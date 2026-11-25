import { afterEach, describe, expect, it, vi } from 'vitest';
import request from 'supertest';
import { generateDeterministicUuid, type RoadParcel, type RoadTileInput } from '@cepheland/geo';
import { MapService, mapService } from '../../src/services/map.service.js';
import { FrontNameRegistry } from '../../src/services/front-name-registry.js';
import type { OsmTile } from '../../src/services/osm-source.js';
import { dbStore } from '../../src/db/store.js';
import { app } from '../../src/index.js';

const seasonId = 'progressive-map-test-season';
const generatedIds = new Set<string>();
function fixture(key: string, longitude = 32.84) {
  const bbox = { minLng: longitude, maxLng: longitude + .002, minLat: 39.92, maxLat: 39.922 };
  const geometry: [number, number][] = [
    [longitude + .0001, 39.9201], [longitude + .0019, 39.9201],
    [longitude + .0019, 39.9219], [longitude + .0001, 39.9219], [longitude + .0001, 39.9201],
  ];
  const tile: OsmTile = { key, bbox, roads: [{
    id: `way/${key}`, coordinates: geometry, tags: { highway: 'residential', name: 'Deneme Sokağı' },
  }], water: [], coastlines: [] };
  // Representative worker output: orchestration tests inject CPU results, while
  // road geometry itself is exercised in map-parcels.test.ts and geo unit tests.
  const parcel: RoadParcel = {
    id: generateDeterministicUuid(`progressive-test:${key}`), frontCode: `RP-${key}`,
    displayNameI18n: { tr: 'Deneme Sokağı', en: 'Deneme Sokağı' },
    center: { latitude: 39.921, longitude: longitude + .001 },
    geometry, geometryRings: [geometry], areaM2: 30_000, weight: 1, source: 'osm_block',
  };
  generatedIds.add(parcel.id);
  return { tile, parcel, bbox };
}

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>(done => { resolve = done; });
  return { promise, resolve };
}

afterEach(() => {
  vi.restoreAllMocks();
  for (const id of generatedIds) dbStore.fronts.delete(id);
  for (const [key, state] of dbStore.seasonFrontStates) if (generatedIds.has(state.frontId)) dbStore.seasonFrontStates.delete(key);
  for (const [key, weight] of dbStore.frontSeasonWeights) if (generatedIds.has(weight.frontId)) dbStore.frontSeasonWeights.delete(key);
  for (const [key, zone] of dbStore.playZones) if (generatedIds.has(zone.frontId)) dbStore.playZones.delete(key);
  generatedIds.clear();
});

describe('Progressive map preparation', () => {
  it('returns existing pilot fronts while both network tiles and a worker remain unresolved', async () => {
    const core = dbStore.fronts.get('f0000000-0000-0000-0000-000000000003')!;
    const bbox = {
      minLat: core.center.latitude - .002, maxLat: core.center.latitude + .002,
      minLng: core.center.longitude - .002, maxLng: core.center.longitude + .002,
    };
    const tile: OsmTile = { key: 'progressive-pilot-worker', bbox, roads: [], water: [], coastlines: [] };
    const worker = deferred<RoadParcel[]>();
    const build = vi.fn(() => worker.promise);
    const blockingLoad = vi.fn(async () => { throw new Error('Progressive reads must not use the blocking source'); });
    const service = new MapService(blockingLoad, new FrontNameRegistry(null), async () => ({
      tiles: [tile], pending: ['unresolved-network-neighbor'], failed: [],
    }), build);
    const response = await service.getViewportSnapshot(seasonId, bbox);
    expect(response.fronts.some(front => front.id === core.id)).toBe(true);
    expect(response.fronts.every(front => !front.source)).toBe(true);
    expect(response.loading).toMatchObject({ status: 'partial', readyTiles: 0, totalTiles: 2, pendingTiles: 2, failedTiles: 0 });
    expect(blockingLoad).not.toHaveBeenCalled();
    expect(build).toHaveBeenCalledTimes(1);
    worker.resolve([]);
    await service.getViewportSnapshot(seasonId, bbox);
  });

  it('keeps a completed neighbor visible and deduplicates a pending worker across concurrent polls', async () => {
    const a = fixture('ready-neighbor');
    const b = fixture('pending-neighbor', 32.842);
    const bbox = { ...a.bbox, maxLng: b.bbox.maxLng };
    const worker = deferred<RoadParcel[]>();
    const build = vi.fn((input: RoadTileInput) => input.key === a.tile.key ? Promise.resolve([a.parcel]) : worker.promise);
    const service = new MapService(async () => [a.tile, b.tile], new FrontNameRegistry(null), async () => ({
      tiles: [a.tile, b.tile], pending: [], failed: [],
    }), build);
    const snapshots = await Promise.all(Array.from({ length: 3 }, () => service.getViewportSnapshot(seasonId, bbox)));
    for (const snapshot of snapshots) {
      expect(snapshot.fronts.map(front => front.id)).toEqual([a.parcel.id]);
      expect(snapshot.loading).toMatchObject({ status: 'partial', readyTiles: 1, totalTiles: 2, pendingTiles: 1, failedTiles: 0 });
    }
    expect(build).toHaveBeenCalledTimes(2);
    worker.resolve([b.parcel]);
    const ready = await service.getViewportSnapshot(seasonId, bbox);
    expect(ready.fronts.map(front => front.id)).toEqual([a.parcel.id, b.parcel.id]);
    expect(ready.loading).toMatchObject({ status: 'ready', readyTiles: 2, pendingTiles: 0 });
    expect(build).toHaveBeenCalledTimes(2);
  });

  it('isolates a worker failure, keeps its neighbor visible, and retries only after the geometry cooldown', async () => {
    const a = fixture('failure-ready');
    const b = fixture('failure-retry', 32.842);
    const bbox = { ...a.bbox, maxLng: b.bbox.maxLng };
    const now = vi.spyOn(Date, 'now').mockReturnValue(1_000);
    let fail = true;
    const build = vi.fn(async (input: RoadTileInput) => {
      if (input.key === a.tile.key) return [a.parcel];
      if (fail) throw new Error('worker failed');
      return [b.parcel];
    });
    const service = new MapService(async () => [a.tile, b.tile], new FrontNameRegistry(null), async () => ({
      tiles: [a.tile, b.tile], pending: [], failed: [],
    }), build);
    const partial = await service.getViewportSnapshot(seasonId, bbox);
    expect(partial.fronts.map(front => front.id)).toEqual([a.parcel.id]);
    expect(partial.loading).toEqual({ status: 'partial', readyTiles: 1, totalTiles: 2, pendingTiles: 0, failedTiles: 1, retryAfterMs: 30_000 });
    await service.getViewportSnapshot(seasonId, bbox);
    now.mockReturnValue(30_999);
    expect((await service.getViewportSnapshot(seasonId, bbox)).loading.retryAfterMs).toBe(1);
    expect(build).toHaveBeenCalledTimes(2);
    now.mockReturnValue(31_001);
    fail = false;
    const recovered = await service.getViewportSnapshot(seasonId, bbox);
    expect(recovered.loading).toMatchObject({ status: 'ready', readyTiles: 2, failedTiles: 0 });
    expect(recovered.fronts.map(front => front.id)).toEqual([a.parcel.id, b.parcel.id]);
    expect(build).toHaveBeenCalledTimes(3);
  });

  it('returns no invented parcels for unknown pending or failed territory', async () => {
    const { bbox } = fixture('unknown');
    let failed = false;
    const build = vi.fn(async () => []);
    const service = new MapService(async () => [], new FrontNameRegistry(null), async () => ({
      tiles: [], pending: failed ? [] : ['unknown-road-tile'],
      failed: failed ? [{ key: 'unknown-road-tile', retryAfterMs: 20_000 }] : [],
    }), build);
    const frontCount = dbStore.fronts.size;
    const pending = await service.getViewportSnapshot(seasonId, bbox);
    expect(pending.fronts).toEqual([]);
    expect(pending.loading).toMatchObject({ status: 'loading', readyTiles: 0, totalTiles: 1, pendingTiles: 1 });
    failed = true;
    const unavailable = await service.getViewportSnapshot(seasonId, bbox);
    expect(unavailable.fronts).toEqual([]);
    expect(unavailable.loading).toMatchObject({ status: 'unavailable', readyTiles: 0, totalTiles: 1, failedTiles: 1, retryAfterMs: 20_000 });
    expect(build).not.toHaveBeenCalled();
    expect(dbStore.fronts.size).toBe(frontCount);
  });

  it('preserves front identity, owned state and participation IDs as names arrive and another season reads the geometry', async () => {
    const { tile, parcel, bbox } = fixture('preserved-state');
    const build = vi.fn(async () => [parcel]);
    const service = new MapService(async () => [tile], new FrontNameRegistry(null), async () => ({ tiles: [tile], pending: [], failed: [] }), build);
    const first = (await service.getViewportSnapshot(seasonId, bbox)).fronts[0];
    const state = dbStore.seasonFrontStates.get(`${seasonId}:${first.id}`)!;
    Object.assign(state, {
      ownerTeamId: 'd0000000-0000-0000-0000-000000000001', status: 'protected', version: 7,
      activeBattleId: 'bb000000-0000-0000-0000-000000000001',
      protectionUntil: new Date('2030-01-01T00:00:00Z'), cooldownUntil: new Date('2030-01-02T00:00:00Z'),
    });
    const before = structuredClone(state);
    const zoneIds = service.getFrontDetails(first.id, seasonId)!.playZones.map(zone => zone.id);
    tile.places = [{ id: 'node/999990', geometry: { type: 'Point', coordinates: [parcel.center.longitude, parcel.center.latitude] }, tags: { shop: 'books', name: 'Kademeli Kitabevi' } }];
    const enriched = (await service.getViewportSnapshot(seasonId, bbox)).fronts[0];
    expect(enriched.displayNameI18n.tr).toContain('Kademeli Kitabevi');
    expect(enriched.id).toBe(first.id);
    expect(enriched.geometryRings).toEqual(first.geometryRings);
    expect(enriched.ownerTeamId).toBe(before.ownerTeamId);
    expect(enriched.activeBattleId).toBe(before.activeBattleId);
    expect(enriched.protectionUntil).toBe(before.protectionUntil!.toISOString());
    expect(dbStore.seasonFrontStates.get(`${seasonId}:${first.id}`)).toEqual(before);
    expect(service.getFrontDetails(first.id, seasonId)!.playZones.map(zone => zone.id)).toEqual(zoneIds);
    const otherSeason = (await service.getViewportSnapshot('progressive-other-season', bbox)).fronts[0];
    expect(otherSeason.id).toBe(first.id);
    expect(otherSeason.status).toBe('neutral');
    expect(otherSeason.ownerTeamId).toBeNull();
    expect(dbStore.seasonFrontStates.get(`${seasonId}:${first.id}`)).toEqual(before);
    expect(build).toHaveBeenCalledTimes(1);
  });

  it('serves progressive=1 as HTTP 200 with loading metadata while the requested road tile is pending', async () => {
    const { bbox } = fixture('route-pending');
    const build = vi.fn(async () => []);
    const service = new MapService(async () => [], new FrontNameRegistry(null), async () => ({
      tiles: [], pending: ['route-road-tile'], failed: [],
    }), build);
    const progressive = vi.spyOn(mapService, 'getViewportSnapshot').mockImplementation((season, bounds) => service.getViewportSnapshot(season, bounds));
    const legacy = vi.spyOn(mapService, 'getViewportFronts');
    const response = await request(app).get('/maps/viewport').query({ ...bbox, progressive: '1', season_id: seasonId });
    expect(response.status).toBe(200);
    expect(response.headers['cache-control']).toBe('no-store');
    expect(response.body).toMatchObject({ fronts: [], seasonId, loading: {
      status: 'loading', readyTiles: 0, totalTiles: 1, pendingTiles: 1, failedTiles: 0, retryAfterMs: 1500,
    } });
    expect(progressive).toHaveBeenCalledWith(seasonId, bbox);
    expect(legacy).not.toHaveBeenCalled();
    expect(build).not.toHaveBeenCalled();
  });
});
