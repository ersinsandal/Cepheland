import { dbStore, FrontRecord } from '../db/store.js';
import {
  type BoundingBox, type RoadParcel,
  WORLD_NEIGHBORHOODS, WORLD_DISTRICTS, WORLD_COUNTRIES, WORLD_PROVINCES,
  territoryIntersectsViewport, generateDeterministicUuid,
} from '@cepheland/geo';
import { loadTilesForViewport, getOsmViewportSnapshot, type OsmTile } from './osm-source.js';
import { buildRoadParcels } from './parcel-builder.js';
import { loadNameCandidates } from './name-candidates.js';
import { FrontNameRegistry, frontNameRegistry, type FrontNameProposal, type RegisteredFrontName } from './front-name-registry.js';

const ROAD_MAP_VERSION = 'map_v2_osm_roads';
type OsmSnapshot = { tiles: OsmTile[]; pending: string[]; failed: { key: string; retryAfterMs: number }[] };
export interface ViewportLoading {
  status: 'ready' | 'loading' | 'partial' | 'unavailable';
  readyTiles: number; totalTiles: number; pendingTiles: number; failedTiles: number; retryAfterMs: number;
}

export class MapService {
  private readonly parcelCache = new Map<string, RoadParcel[]>();
  private readonly parcelJobs = new Map<string, Promise<RoadParcel[]>>();
  private readonly parcelFailures = new Map<string, number>();
  private readonly nameCandidates = new Map<string, { places: OsmTile['places']; proposals: FrontNameProposal[] }>();

  constructor(
    private readonly loadTiles: (bbox: BoundingBox) => Promise<OsmTile[]> = loadTilesForViewport,
    private readonly nameRegistry: FrontNameRegistry = frontNameRegistry,
    private readonly loadSnapshot: (bbox: BoundingBox) => Promise<OsmSnapshot> = getOsmViewportSnapshot,
    private readonly buildParcels = buildRoadParcels,
  ) {}

  /** Restore saved pilot names before any detail, battle or search reader uses
   * the shared store. This needs only the local registry, never an OSM request. */
  async restoreCoreNames(): Promise<void> {
    const core = this.coreFronts();
    const names = await this.nameRegistry.assign(core.map(front => this.coreNameProposal(front)));
    for (const front of core) this.applyName(front, names.get(front.id)!);
    this.applyParticipationNames(names);
  }

  private coreFronts(): FrontRecord[] {
    return [...dbStore.fronts.values()].filter(f => !f.source && f.mapVersionId !== 'map_v1_world');
  }

  private coreNameProposal(front: FrontRecord): FrontNameProposal {
    return {
      frontId: front.id, candidates: [front.displayNameI18n.tr],
      baseName: front.naming?.baseName ?? front.displayNameI18n.tr,
      streetName: front.streetName, source: front.naming?.source ?? 'street',
      osmIds: front.naming?.osmIds ?? [], locality: front.naming?.locality,
    };
  }

  private reservedGeometry() {
    return this.coreFronts().map(front => ({
      type: 'Polygon' as const, coordinates: front.geometryRings ?? [front.geometry],
    }));
  }

  private prepareTile(tile: OsmTile): Promise<RoadParcel[]> {
    const reserved = this.reservedGeometry();
    const cacheKey = tile.key + ':' + JSON.stringify(reserved);
    const cached = this.parcelCache.get(cacheKey);
    if (cached) return Promise.resolve(cached);
    const pending = this.parcelJobs.get(cacheKey);
    if (pending) return pending;
    const job = this.buildParcels({ ...tile, reserved }).then(parcels => {
      this.parcelCache.set(cacheKey, parcels);
      this.parcelFailures.delete(cacheKey);
      if (this.parcelCache.size > 128) this.parcelCache.delete(this.parcelCache.keys().next().value!);
      return parcels;
    }).catch(error => {
      this.parcelFailures.set(cacheKey, Date.now() + 30_000);
      throw error;
    }).finally(() => this.parcelJobs.delete(cacheKey));
    this.parcelJobs.set(cacheKey, job);
    return job;
  }

  /** Fast partial response: a slow/missing tile never hides its ready neighbors.
   * Network and CPU work continue once per tile, independently of client polling. */
  async getViewportSnapshot(seasonId: string, bbox?: BoundingBox) {
    if (!bbox) return {
      fronts: await this.getViewportFronts(seasonId),
      loading: { status: 'ready', readyTiles: 0, totalTiles: 0, pendingTiles: 0, failedTiles: 0, retryAfterMs: 0 } as ViewportLoading,
    };
    const snapshot = await this.loadSnapshot(bbox);
    const reservedVersion = JSON.stringify(this.reservedGeometry());
    const jobs: Promise<unknown>[] = [];
    for (const tile of snapshot.tiles) {
      const key = tile.key + ':' + reservedVersion;
      if (!this.parcelCache.has(key) && (this.parcelFailures.get(key) ?? 0) <= Date.now()
        && (this.parcelJobs.has(key) || this.parcelJobs.size < 16)) {
        jobs.push(this.prepareTile(tile).catch(() => undefined));
      }
    }
    // Give disk-cached geometry one short opportunity to complete. Cold workers
    // never hold the HTTP request open for their (potentially long) computation.
    if (jobs.length) {
      let timer: ReturnType<typeof setTimeout> | undefined;
      await Promise.race([Promise.all(jobs), new Promise(resolve => { timer = setTimeout(resolve, 40); })]);
      clearTimeout(timer);
    }
    const ready: OsmTile[] = [];
    let pendingTiles = snapshot.pending.length;
    let failedTiles = snapshot.failed.length;
    let retryAfterMs = Math.max(0, ...snapshot.failed.map(f => f.retryAfterMs));
    for (const tile of snapshot.tiles) {
      const key = tile.key + ':' + reservedVersion;
      if (this.parcelCache.has(key)) ready.push(tile);
      else if ((this.parcelFailures.get(key) ?? 0) > Date.now()) {
        failedTiles++;
        retryAfterMs = Math.max(retryAfterMs, this.parcelFailures.get(key)! - Date.now());
      } else pendingTiles++;
    }
    const fronts = await this.frontsFromTiles(seasonId, ready, bbox);
    const totalTiles = snapshot.tiles.length + snapshot.pending.length + snapshot.failed.length;
    const status = pendingTiles ? (fronts.length ? 'partial' : 'loading')
      : failedTiles ? (fronts.length ? 'partial' : 'unavailable') : 'ready';
    return { fronts, loading: {
      status, readyTiles: ready.length, totalTiles, pendingTiles, failedTiles,
      retryAfterMs: pendingTiles ? 1500 : Math.ceil(retryAfterMs),
    } as ViewportLoading };
  }

  async getViewportFronts(seasonId: string, bbox?: BoundingBox) {
    const tiles = bbox ? await this.loadTiles(bbox) : [];
    await Promise.all(tiles.map(tile => this.prepareTile(tile)));
    return this.frontsFromTiles(seasonId, tiles, bbox);
  }

  private async frontsFromTiles(seasonId: string, tiles: OsmTile[], bbox?: BoundingBox) {
    // Preserve pilot ownership and battle IDs, subtracting their actual footprints
    // from generated parcels instead of deleting nearby legitimate street blocks.
    const core = this.coreFronts();
    const proposals = core.map(front => this.coreNameProposal(front));
    const reservedVersion = JSON.stringify(this.reservedGeometry());
    const batches: RoadParcel[][] = [];
    for (const tile of tiles) {
      const cacheKey = tile.key + ':' + reservedVersion;
      const parcels = this.parcelCache.get(cacheKey)!;
      batches.push(parcels);
      const places = tile.places?.length ? tile.places : undefined;
      let named = this.nameCandidates.get(cacheKey);
      if (!named || named.places !== places) {
        // Allocate full tiles once per naming snapshot, rather than resampling
        // thousands of street segments on every pan or progress poll.
        const tileProposals = await loadNameCandidates(tile, parcels, core.map(f => ({
          id: f.id, center: f.center, geometry: f.geometry, geometryRings: f.geometryRings,
        })));
        named = { places, proposals: tileProposals };
        this.nameCandidates.set(cacheKey, named);
        if (this.nameCandidates.size > 128) this.nameCandidates.delete(this.nameCandidates.keys().next().value!);
      }
      proposals.push(...named.proposals);
    }
    const names = await this.nameRegistry.assign(proposals);
    const results = new Map<string, ReturnType<MapService['formatFrontPayload']>>();
    for (const front of core) {
      this.applyName(front, names.get(front.id)!);
      if (!bbox || territoryIntersectsViewport(front, bbox)) results.set(front.id, this.formatFrontPayload(front, seasonId));
    }
    for (const parcels of batches) {
      for (const parcel of parcels) {
        if (!bbox || !territoryIntersectsViewport(parcel, bbox) || results.has(parcel.id)) continue;
        let front = dbStore.fronts.get(parcel.id);
        if (!front) {
          front = {
            id: parcel.id, mapVersionId: ROAD_MAP_VERSION,
            cityRegionId: 'reg_world', neighborhoodRegionId: 'neigh_world',
            frontCode: parcel.frontCode, displayNameI18n: parcel.displayNameI18n,
            streetName: null, center: parcel.center,
            geometry: parcel.geometry, geometryRings: parcel.geometryRings, source: parcel.source,
            areaM2: parcel.areaM2, geometryHash: parcel.id,
            safetyStatus: 'approved', enabled: true, defaultWeight: 1,
          };
          dbStore.fronts.set(front.id, front);
          const zoneId = generateDeterministicUuid('play-zone:' + front.id);
          dbStore.playZones.set(zoneId, {
            id: zoneId, frontId: front.id, geometry: front.geometry,
            geometryRings: front.geometryRings, center: front.center,
            labelI18n: { tr: parcel.displayNameI18n.tr + ' Katılım Alanı', en: parcel.displayNameI18n.en + ' Participation Area' },
            status: 'approved',
          });
        }
        this.applyName(front, names.get(front.id)!);
        // Existing geometry can be requested in another season; initialize that
        // season without overwriting the existing season's ownership or battle.
        const stateKey = seasonId + ':' + front.id;
        if (!dbStore.seasonFrontStates.has(stateKey)) {
          dbStore.seasonFrontStates.set(stateKey, {
            seasonId, frontId: front.id, ownerTeamId: null, status: 'neutral',
            activeBattleId: null, protectionUntil: null, cooldownUntil: null,
            version: 1, lastChangedAt: new Date(),
          });
        }
        if (!dbStore.frontSeasonWeights.has(stateKey)) {
          dbStore.frontSeasonWeights.set(stateKey, {
            seasonId, frontId: front.id, weight: 1, methodVersion: 'v3_osm_roads',
          });
        }
        results.set(front.id, this.formatFrontPayload(front, seasonId));
      }
    }
    this.applyParticipationNames(names);
    return [...results.values()];
  }

  private applyParticipationNames(names: Map<string, RegisteredFrontName>) {
    // Keep all participation labels aligned, including old pilot zone IDs.
    for (const zone of dbStore.playZones.values()) {
      const named = names.get(zone.frontId);
      if (named) zone.labelI18n = { tr: `${named.name} Katılım Alanı`, en: `${named.name} Participation Area` };
    }
  }

  private applyName(front: FrontRecord, named: RegisteredFrontName) {
    front.displayNameI18n = { tr: named.name, en: named.name };
    front.streetName = named.streetName;
    front.naming = { baseName: named.baseName, source: named.source, osmIds: named.osmIds, locality: named.locality };
  }

  getFrontDetails(frontId: string, seasonId: string) {
    const front = dbStore.fronts.get(frontId);
    if (!front) return null;

    const payload = this.formatFrontPayload(front, seasonId);
    const playZones = Array.from(dbStore.playZones.values()).filter((pz) => pz.frontId === frontId);

    return {
      ...payload,
      playZones,
    };
  }

  /**
   * Returns list of available world metropolises and neighborhoods for quick navigation.
   */
  getWorldRegions() {
    const list: any[] = [];
    for (const [key, n] of Object.entries(WORLD_NEIGHBORHOODS)) {
      const country = WORLD_COUNTRIES[n.countryCode];
      const province = WORLD_PROVINCES[n.provinceCode];
      const district = WORLD_DISTRICTS[n.districtCode];

      list.push({
        id: key,
        code: n.code,
        nameI18n: n.name,
        country: { code: n.countryCode, nameI18n: country?.name || { tr: n.countryCode, en: n.countryCode } },
        province: { code: n.provinceCode, nameI18n: province?.name || { tr: n.provinceCode, en: n.provinceCode } },
        district: { code: n.districtCode, nameI18n: district?.name || { tr: n.districtCode, en: n.districtCode } },
        center: n.center,
        bbox: {
          minLat: n.bbox[0],
          maxLat: n.bbox[1],
          minLng: n.bbox[2],
          maxLng: n.bbox[3],
        },
        majorArterials: n.majorArterials,
      });
    }
    return list;
  }

  /**
   * Search locations worldwide by name, street, neighborhood, or city.
   */
  searchLocations(query: string) {
    const q = query.toLowerCase().trim();
    const matches: any[] = [];

    // Search neighborhoods
    for (const [key, n] of Object.entries(WORLD_NEIGHBORHOODS)) {
      if (
        n.name.tr.toLowerCase().includes(q) ||
        n.name.en.toLowerCase().includes(q) ||
        n.code.toLowerCase().includes(q) ||
        n.majorArterials.some((a) => a.toLowerCase().includes(q))
      ) {
        matches.push({
          type: 'neighborhood',
          id: key,
          title: n.name.tr,
          subtitle: `${n.districtCode} · ${n.provinceCode}`,
          center: n.center,
          bbox: {
            minLat: n.bbox[0],
            maxLat: n.bbox[1],
            minLng: n.bbox[2],
            maxLng: n.bbox[3],
          },
        });
      }
    }

    // Search existing fronts
    for (const f of dbStore.fronts.values()) {
      if (
        f.displayNameI18n.tr.toLowerCase().includes(q) ||
        f.frontCode.toLowerCase().includes(q) ||
        (f.streetName && f.streetName.toLowerCase().includes(q))
      ) {
        matches.push({
          type: 'front',
          id: f.id,
          title: f.displayNameI18n.tr,
          subtitle: f.frontCode,
          center: f.center,
        });
        if (matches.length >= 10) break;
      }
    }

    return matches;
  }

  private formatFrontPayload(front: FrontRecord, seasonId: string) {
    const state = dbStore.seasonFrontStates.get(`${seasonId}:${front.id}`) || {
      ownerTeamId: null,
      status: 'neutral' as const,
      activeBattleId: null,
      protectionUntil: null,
      cooldownUntil: null,
    };

    const weightRecord = dbStore.frontSeasonWeights.get(`${seasonId}:${front.id}`);
    const weight = weightRecord ? weightRecord.weight : front.defaultWeight;

    const ownerTeam = state.ownerTeamId ? dbStore.teams.get(state.ownerTeamId) : null;
    const activeBattle = state.activeBattleId ? dbStore.battles.get(state.activeBattleId) : null;

    return {
      id: front.id,
      frontCode: front.frontCode,
      displayNameI18n: front.displayNameI18n,
      streetName: front.streetName,
      areaM2: front.areaM2,
      center: front.center,
      geometry: front.geometry,
      geometryRings: front.geometryRings,
      source: front.source,
      naming: front.naming,
      weight,
      status: state.status,
      ownerTeamId: state.ownerTeamId,
      ownerTeam: ownerTeam
        ? {
            id: ownerTeam.id,
            slug: ownerTeam.slug,
            nameI18n: ownerTeam.nameI18n,
            colorPrimary: ownerTeam.colorPrimary,
            colorSecondary: ownerTeam.colorSecondary,
          }
        : null,
      activeBattleId: state.activeBattleId,
      activeBattle: activeBattle
        ? {
            id: activeBattle.id,
            mode: activeBattle.mode,
            status: activeBattle.status,
            attackerTeamId: activeBattle.attackerTeamId,
            defenderTeamId: activeBattle.defenderTeamId,
            startsAt: activeBattle.startsAt?.toISOString(),
            endsAt: activeBattle.endsAt?.toISOString(),
          }
        : null,
      protectionUntil: state.protectionUntil?.toISOString() ?? null,
      cooldownUntil: state.cooldownUntil?.toISOString() ?? null,
    };
  }
}

export const mapService = new MapService();
