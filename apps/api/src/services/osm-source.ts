import { mkdir, readFile, rename, writeFile } from 'node:fs/promises';
import { resolve, join } from 'node:path';
import { randomUUID } from 'node:crypto';
import osmtogeojson from 'osmtogeojson';
import type { Point, Polygon, MultiPolygon } from 'geojson';
import type { BoundingBox } from '@cepheland/geo';

export type OsmCoordinate = [number, number];

export interface OsmRoad {
  id: string;
  coordinates: OsmCoordinate[];
  tags: Record<string, string>;
}

export interface OsmNamedPlace {
  id: string;
  geometry: Point | Polygon | MultiPolygon;
  tags: Record<string, string>;
}

interface NamingMetadata {
  places: OsmNamedPlace[];
  namingStatus: 'ready' | 'unavailable';
  namingVersion: 'osm-names-v1';
}

export interface OsmTile {
  key: string;
  bbox: BoundingBox;
  roads: OsmRoad[];
  water: (Polygon | MultiPolygon)[];
  coastlines: OsmCoordinate[][];
  places?: OsmNamedPlace[];
  namingStatus?: NamingMetadata['namingStatus'];
  namingVersion?: NamingMetadata['namingVersion'];
}

export interface OsmViewportSnapshot {
  tiles: OsmTile[];
  pending: string[];
  failed: { key: string; retryAfterMs: number }[];
}

export class OsmSourceError extends Error {
  constructor(public readonly code: string, message: string, public readonly statusCode: number, options?: ErrorOptions) {
    super(message, options);
    this.name = 'OsmSourceError';
  }
}

export const OSM_TILE_SIZE = 0.02;
export const OSM_TILE_HALO = 0.005;
export const OSM_MAX_VIEWPORT_TILES = 16;
export const OSM_MAX_LATITUDE = 85.05112878;
const CACHE_VERSION = 1;
const NAMING_VERSION = 'osm-names-v1';
const MAX_RESPONSE_BYTES = 24 * 1024 * 1024;
const DEFAULT_ENDPOINTS = [
  'https://overpass-api.de/api/interpreter',
  'https://overpass.private.coffee/api/interpreter',
];

interface OsmGeometryPoint { lat: number; lon: number }
interface OsmElement {
  type: string;
  id: number;
  tags?: Record<string, string>;
  geometry?: OsmGeometryPoint[];
  [key: string]: unknown;
}
interface OsmResponse { elements: OsmElement[]; remark?: string }
type TilePlan = Pick<OsmTile, 'key' | 'bbox'>;
type Fetcher = (url: string, init: RequestInit) => Promise<Pick<Response, 'ok' | 'status' | 'text'>>;

export interface OsmSourceOptions {
  fetcher?: Fetcher;
  /** null disables disk cache, useful for isolated tests. */
  cacheDirectory?: string | null;
  /** Read-only prepared map snapshots, checked after the writable pinned cache. */
  bundledDirectory?: string | null;
  endpoints?: string[];
  timeoutMs?: number;
  /** Cooldown after all road sources fail. A later request may retry after this delay. */
  retryMs?: number;
  concurrency?: number;
  memoryTileLimit?: number;
  /** Naming is optional enrichment; unavailable names never invalidate road geometry. */
  enrichNames?: boolean;
  namingTimeoutMs?: number;
  namingRetryMs?: number;
}

const rounded = (n: number) => Math.round(n * 1e8) / 1e8;

/** Fixed world tiles make a road dataset independent of viewport position and zoom. */
export function planOsmTiles(bbox: BoundingBox): TilePlan[] {
  if (![bbox.minLat, bbox.maxLat, bbox.minLng, bbox.maxLng].every(Number.isFinite)
    || bbox.minLat < -OSM_MAX_LATITUDE || bbox.maxLat > OSM_MAX_LATITUDE || bbox.minLat >= bbox.maxLat
    || bbox.minLng < -180 || bbox.minLng > 180 || bbox.maxLng < -180 || bbox.maxLng > 180
    || bbox.minLng === bbox.maxLng) {
    throw new OsmSourceError('INVALID_VIEWPORT', 'Geçerli bir harita görünüm alanı seçin.', 400);
  }
  // A west > east interval crosses the antimeridian; do not request almost the whole planet.
  const longitudeRanges = bbox.minLng < bbox.maxLng
    ? [[bbox.minLng, bbox.maxLng]]
    : [[bbox.minLng, 180], [-180, bbox.maxLng]];
  const minY = Math.floor(rounded((bbox.minLat + 90) / OSM_TILE_SIZE));
  const maxY = Math.ceil(rounded((bbox.maxLat + 90) / OSM_TILE_SIZE)) - 1;
  const ranges = longitudeRanges.filter(([west, east]) => west < east).map(([west, east]) => ({
    minX: Math.floor(rounded((west + 180) / OSM_TILE_SIZE)),
    maxX: Math.ceil(rounded((east + 180) / OSM_TILE_SIZE)) - 1,
  }));
  const count = ranges.reduce((sum, range) => sum + (range.maxX - range.minX + 1) * (maxY - minY + 1), 0);
  if (count > OSM_MAX_VIEWPORT_TILES) {
    throw new OsmSourceError(
      'VIEWPORT_TOO_LARGE',
      'Sokak parsellerini görmek için haritayı yakınlaştırın.',
      422,
    );
  }
  const tiles: TilePlan[] = [];
  for (const { minX, maxX } of ranges) {
    for (let y = minY; y <= maxY; y++) {
      for (let x = minX; x <= maxX; x++) {
        tiles.push({
          key: `osm-v${CACHE_VERSION}-${x}-${y}`,
          bbox: {
            minLat: rounded(y * OSM_TILE_SIZE - 90),
            maxLat: rounded((y + 1) * OSM_TILE_SIZE - 90),
            minLng: rounded(x * OSM_TILE_SIZE - 180),
            maxLng: rounded((x + 1) * OSM_TILE_SIZE - 180),
          },
        });
      }
    }
  }
  return tiles;
}

function queryForTile(tile: TilePlan): string {
  const b = tile.bbox;
  const box = [
    Math.max(-90, rounded(b.minLat - OSM_TILE_HALO)),
    Math.max(-180, rounded(b.minLng - OSM_TILE_HALO)),
    Math.min(90, rounded(b.maxLat + OSM_TILE_HALO)),
    Math.min(180, rounded(b.maxLng + OSM_TILE_HALO)),
  ].join(',');
  // out geom includes complete ways and relation members, not viewport-clipped lines.
  return `[out:json][timeout:7];(
way["highway"](${box});
way["natural"="coastline"](${box});
way["natural"="water"](${box});rel["natural"="water"](${box});
way["waterway"="riverbank"](${box});rel["waterway"="riverbank"](${box});
way["landuse"="reservoir"](${box});rel["landuse"="reservoir"](${box});
);out body geom;`;
}

function queryForNames(tile: TilePlan): string {
  const b = tile.bbox;
  const box = [
    Math.max(-90, rounded(b.minLat - OSM_TILE_HALO)),
    Math.max(-180, rounded(b.minLng - OSM_TILE_HALO)),
    Math.min(90, rounded(b.maxLat + OSM_TILE_HALO)),
    Math.min(180, rounded(b.maxLng + OSM_TILE_HALO)),
  ].join(',');
  const named = '[~"^(name|name:tr|name:en|official_name)$"~"."]';
  // Request named public map features rather than every named building/address.
  // Full geometries are needed to distinguish an interior landmark from one
  // across the street; a relation's bounding-box center would not be sufficient.
  const categories = ['amenity', 'shop', 'tourism', 'leisure', 'historic'];
  return `[out:json][timeout:7];(\n${categories.map(category => `nwr${named}["${category}"](${box});`).join('\n')}
nwr${named}["place"~"^(city|town|village|hamlet|suburb|quarter|neighbourhood|locality|square)$"](${box});
);out body geom;`;
}

function isCoordinate(value: unknown): value is OsmCoordinate {
  return Array.isArray(value) && value.length === 2
    && value.every(Number.isFinite) && Math.abs(value[0]) <= 180 && Math.abs(value[1]) <= 90;
}

/** Keep multipolygon holes (islands), rather than treating every water ring as filled water. */
export function parseOsmTile(plan: TilePlan, body: unknown): OsmTile {
  const response = body as Partial<OsmResponse> | null;
  // Overpass may return HTTP 200 with a remark and partial data after a timeout.
  if (!response || !Array.isArray(response.elements) || response.remark) {
    throw new Error('Incomplete OpenStreetMap response');
  }
  const roads: OsmRoad[] = [];
  const coastlines: OsmCoordinate[][] = [];
  for (const element of response.elements) {
    if (element.type !== 'way') continue;
    if (!element.geometry) {
      if (element.tags?.highway || element.tags?.natural === 'coastline') {
        throw new Error('Missing OpenStreetMap way geometry');
      }
      continue;
    }
    const coordinates = element.geometry.map((p): OsmCoordinate => [p.lon, p.lat]);
    if (coordinates.length < 2 || !coordinates.every(isCoordinate)) {
      if (element.tags?.highway || element.tags?.natural === 'coastline') {
        throw new Error('Incomplete OpenStreetMap way geometry');
      }
      continue;
    }
    if (element.tags?.highway) {
      roads.push({ id: `way/${element.id}`, coordinates, tags: element.tags });
    }
    if (element.tags?.natural === 'coastline') coastlines.push(coordinates);
  }
  const geojson = osmtogeojson(response, { flatProperties: false });
  const water: (Polygon | MultiPolygon)[] = [];
  for (const feature of geojson.features) {
    const properties = feature.properties ?? {};
    const tags = properties.tags ?? {};
    const isWater = tags.natural === 'water' || tags.waterway === 'riverbank' || tags.landuse === 'reservoir';
    if (!isWater) continue;
    if (properties.tainted || !['Polygon', 'MultiPolygon'].includes(feature.geometry.type)) {
      throw new Error('Incomplete OpenStreetMap water geometry');
    }
    water.push(feature.geometry as Polygon | MultiPolygon);
  }
  roads.sort((a, b) => a.id.localeCompare(b.id));
  return { ...plan, roads, water, coastlines };
}

/** Preserve POI footprints and holes; equal names are separate real OSM objects. */
export function parseOsmNames(body: unknown): OsmNamedPlace[] {
  const response = body as Partial<OsmResponse> | null;
  if (!response || !Array.isArray(response.elements) || response.remark) {
    throw new Error('Incomplete OpenStreetMap naming response');
  }
  const places = new Map<string, OsmNamedPlace>();
  for (const feature of osmtogeojson(response, { flatProperties: false }).features) {
    const properties = feature.properties ?? {};
    const tags = Object.fromEntries(Object.entries(properties.tags ?? {})
      .filter((entry): entry is [string, string] => typeof entry[1] === 'string'));
    if (![tags.name, tags['name:tr'], tags['name:en'], tags.official_name].some(name => name?.trim())) continue;
    if (!['amenity', 'shop', 'tourism', 'leisure', 'historic', 'place'].some(key => tags[key])) continue;
    if (tags.shop === 'vacant' || tags.disused === 'yes' || tags.abandoned === 'yes') continue;
    if (properties.tainted || !['Point', 'Polygon', 'MultiPolygon'].includes(feature.geometry.type)) continue;
    const geometry = feature.geometry as OsmNamedPlace['geometry'];
    const coordinates = geometry.type === 'Point' ? [geometry.coordinates]
      : geometry.type === 'Polygon' ? geometry.coordinates.flat() : geometry.coordinates.flat(2);
    if (!coordinates.length || !coordinates.every(isCoordinate)) continue;
    const id = typeof feature.id === 'string' ? feature.id : `${properties.type}/${properties.id}`;
    if (!/^(node|way|relation)\/\d+$/.test(id)) continue;
    places.set(id, { id, geometry, tags });
  }
  return [...places.values()].sort((a, b) => a.id.localeCompare(b.id));
}

export function createOsmSource(options: OsmSourceOptions = {}) {
  const fetcher: Fetcher = options.fetcher ?? fetch;
  const endpoints = options.endpoints ?? (process.env.OSM_OVERPASS_URLS?.split(',').map(s => s.trim()).filter(Boolean) || DEFAULT_ENDPOINTS);
  const timeoutMs = options.timeoutMs ?? 8_000;
  const retryMs = options.retryMs ?? 30_000;
  const namingTimeoutMs = options.namingTimeoutMs ?? 8_000;
  const namingRetryMs = options.namingRetryMs ?? 5 * 60_000;
  const cacheDirectory = options.cacheDirectory === undefined
    ? resolve(process.env.OSM_CACHE_DIR || join(__dirname, '..', '..', 'scratch', 'osm-cache', `v${CACHE_VERSION}`))
    : options.cacheDirectory;
  const bundledDirectory = options.bundledDirectory === undefined
    ? (options.cacheDirectory === undefined ? join(__dirname, '..', '..', 'data', 'maps', `v${CACHE_VERSION}`) : null)
    : options.bundledDirectory;
  const cacheDirectories = [...new Set([cacheDirectory, bundledDirectory].filter((directory): directory is string => Boolean(directory)))];
  const memoryLimit = Math.max(1, options.memoryTileLimit ?? 128);
  const concurrency = Math.max(1, options.concurrency ?? 2);
  const memory = new Map<string, OsmTile>();
  const inFlight = new Map<string, Promise<OsmTile>>();
  const diskReads = new Map<string, Promise<OsmTile | undefined>>();
  const failures = new Map<string, { error: unknown; retryAfter: number }>();
  const names = new Map<string, { data: NamingMetadata; retryAfter: number }>();
  const namesInFlight = new Map<string, Promise<NamingMetadata>>();
  const namesDiskReads = new Map<string, Promise<NamingMetadata | undefined>>();
  const queue: (() => void)[] = [];
  const namesQueue: (() => void)[] = [];
  let active = 0;
  let namesActive = false;

  function remember(tile: OsmTile) {
    memory.delete(tile.key);
    memory.set(tile.key, tile);
    if (memory.size > memoryLimit) memory.delete(memory.keys().next().value!);
    return tile;
  }

  async function limited<T>(work: () => Promise<T>): Promise<T> {
    if (active >= concurrency) await new Promise<void>(resolve => queue.push(resolve));
    else active++;
    try {
      return await work();
    } finally {
      const next = queue.shift();
      if (next) next();
      else active--;
    }
  }

  async function limitedNames<T>(work: () => Promise<T>): Promise<T> {
    if (namesActive) await new Promise<void>(resolve => namesQueue.push(resolve));
    else namesActive = true;
    try {
      // Optional POIs have their own single slot and yield to already requested roads.
      // They never occupy a road slot or delay a viewport snapshot.
      await Promise.allSettled([...inFlight.values()]);
      return await work();
    } finally {
      const next = namesQueue.shift();
      if (next) next();
      else namesActive = false;
    }
  }

  async function fetchBody(endpoint: string, query: string, timeout: number, userAgent: string): Promise<unknown> {
    const controller = new AbortController();
    let timer: ReturnType<typeof setTimeout> | undefined;
    // Bound the whole response, including its body and clients that ignore abort.
    const expired = new Promise<never>((_resolve, reject) => {
      timer = setTimeout(() => {
        controller.abort();
        reject(new Error('OpenStreetMap request timed out'));
      }, timeout);
      timer.unref?.();
    });
    try {
      return await Promise.race([expired, (async () => {
        const response = await fetcher(endpoint, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
            'User-Agent': userAgent,
          },
          body: new URLSearchParams({ data: query }).toString(),
          signal: controller.signal,
        });
        if (!response.ok) throw new Error(`OpenStreetMap HTTP ${response.status}`);
        const body = await response.text();
        if (Buffer.byteLength(body, 'utf8') > MAX_RESPONSE_BYTES) throw new Error('OpenStreetMap response too large');
        return JSON.parse(body);
      })()]);
    } finally {
      if (timer) clearTimeout(timer);
    }
  }

  async function readCached(plan: TilePlan): Promise<OsmTile | undefined> {
    for (const directory of cacheDirectories) {
      try {
        const cached = JSON.parse(await readFile(join(directory, `${plan.key}.json`), 'utf8'));
        if (cached.version === CACHE_VERSION && cached.tile?.key === plan.key
          && JSON.stringify(cached.tile.bbox) === JSON.stringify(plan.bbox)
          && Array.isArray(cached.tile.roads) && Array.isArray(cached.tile.water) && Array.isArray(cached.tile.coastlines)) {
          return cached.tile as OsmTile;
        }
      } catch { /* Missing/interrupted cache files fall through to the prepared map or upstream. */ }
    }
    return undefined;
  }

  async function readAvailableTile(plan: TilePlan): Promise<OsmTile | undefined> {
    const cached = memory.get(plan.key);
    if (cached) return remember(cached);
    const running = diskReads.get(plan.key);
    if (running) return running;
    const promise = readCached(plan).then(tile => tile ? remember(tile) : undefined);
    diskReads.set(plan.key, promise);
    try { return await promise; }
    finally { diskReads.delete(plan.key); }
  }

  async function fetchTile(plan: TilePlan): Promise<OsmTile> {
    let lastError: unknown;
    for (const endpoint of endpoints) {
      try {
        const tile = parseOsmTile(plan, await fetchBody(endpoint, queryForTile(plan), timeoutMs, 'Cepheland/1.0 (street parcel map)'));
        if (cacheDirectory) {
          // Persist a pinned map snapshot across restarts. Bump CACHE_VERSION deliberately to refresh.
          await mkdir(cacheDirectory, { recursive: true });
          const target = join(cacheDirectory, `${plan.key}.json`);
          const temporary = `${target}.${randomUUID()}.tmp`;
          await writeFile(temporary, JSON.stringify({ version: CACHE_VERSION, tile }), 'utf8');
          await rename(temporary, target);
        }
        return remember(tile);
      } catch (error) {
        lastError = error;
        // Try the alternate source; never fabricate an empty road dataset.
      }
    }
    throw new OsmSourceError(
      'OSM_UNAVAILABLE',
      'Sokak verisi şu anda alınamıyor. Lütfen biraz sonra yeniden deneyin.',
      503,
      { cause: lastError },
    );
  }

  async function loadTile(plan: TilePlan): Promise<OsmTile> {
    const cached = memory.get(plan.key);
    if (cached) return remember(cached);
    const running = inFlight.get(plan.key);
    if (running) return running;
    const promise = (async () => {
      const disk = await readAvailableTile(plan);
      if (disk) return disk;
      const failed = failures.get(plan.key);
      if (failed && failed.retryAfter > Date.now()) throw failed.error;
      try {
        const tile = await limited(() => fetchTile(plan));
        failures.delete(plan.key);
        return tile;
      } catch (error) {
        failures.delete(plan.key);
        failures.set(plan.key, { error, retryAfter: Date.now() + retryMs });
        if (failures.size > memoryLimit) failures.delete(failures.keys().next().value!);
        throw error;
      }
    })();
    inFlight.set(plan.key, promise);
    try {
      return await promise;
    } finally {
      inFlight.delete(plan.key);
    }
  }

  function rememberNames(key: string, data: NamingMetadata) {
    names.delete(key);
    names.set(key, { data, retryAfter: data.namingStatus === 'ready' ? Infinity : Date.now() + namingRetryMs });
    if (names.size > memoryLimit) names.delete(names.keys().next().value!);
    return data;
  }

  async function readAvailableNames(plan: TilePlan): Promise<NamingMetadata | undefined> {
    const cached = names.get(plan.key);
    if (cached && cached.retryAfter > Date.now()) return cached.data;
    const running = namesDiskReads.get(plan.key);
    if (running) return running;
    const promise = (async (): Promise<NamingMetadata | undefined> => {
      for (const directory of cacheDirectories) {
        try {
          const disk = JSON.parse(await readFile(join(directory, `${plan.key}.${NAMING_VERSION}.json`), 'utf8'));
          if (disk.version === NAMING_VERSION && disk.key === plan.key
            && JSON.stringify(disk.bbox) === JSON.stringify(plan.bbox) && Array.isArray(disk.places)) {
            return rememberNames(plan.key, { places: disk.places, namingStatus: 'ready', namingVersion: NAMING_VERSION });
          }
        } catch { /* Missing/corrupt naming sidecar is retried without touching geometry. */ }
      }
      return undefined;
    })();
    namesDiskReads.set(plan.key, promise);
    try { return await promise; }
    finally { namesDiskReads.delete(plan.key); }
  }

  async function loadNames(plan: TilePlan): Promise<NamingMetadata> {
    const cached = names.get(plan.key);
    if (cached && cached.retryAfter > Date.now()) return cached.data;
    const running = namesInFlight.get(plan.key);
    if (running) return running;
    const promise = (async (): Promise<NamingMetadata> => {
      const disk = await readAvailableNames(plan);
      if (disk) return disk;
      // Sidecars deliberately leave the pinned road snapshot and its key untouched.
      const target = cacheDirectory ? join(cacheDirectory, `${plan.key}.${NAMING_VERSION}.json`) : null;
      return limitedNames(async () => {
        for (const endpoint of endpoints) {
          try {
            const places = parseOsmNames(await fetchBody(endpoint, queryForNames(plan), namingTimeoutMs, 'Cepheland/1.0 (real place names)'));
            if (target && cacheDirectory) {
              await mkdir(cacheDirectory, { recursive: true });
              const temporary = `${target}.${randomUUID()}.tmp`;
              await writeFile(temporary, JSON.stringify({ version: NAMING_VERSION, key: plan.key, bbox: plan.bbox, places }), 'utf8');
              await rename(temporary, target);
            }
            return rememberNames(plan.key, { places, namingStatus: 'ready', namingVersion: NAMING_VERSION });
          } catch { /* A landmark outage must not turn a valid map into a 503. */ }
        }
        return rememberNames(plan.key, { places: [], namingStatus: 'unavailable', namingVersion: NAMING_VERSION });
      });
    })();
    namesInFlight.set(plan.key, promise);
    try { return await promise; }
    finally { namesInFlight.delete(plan.key); }
  }

  return {
    async getViewportSnapshot(bbox: BoundingBox): Promise<OsmViewportSnapshot> {
      const plans = planOsmTiles(bbox);
      const cached = await Promise.all(plans.map(readAvailableTile));
      const snapshot: OsmViewportSnapshot = { tiles: [], pending: [], failed: [] };
      const ready: OsmTile[] = [];
      for (let i = 0; i < plans.length; i++) {
        const plan = plans[i];
        const tile = cached[i] ?? memory.get(plan.key);
        if (tile) {
          ready.push(tile);
          continue;
        }
        const failed = failures.get(plan.key);
        if (failed && failed.retryAfter > Date.now()) {
          snapshot.failed.push({ key: plan.key, retryAfterMs: failed.retryAfter - Date.now() });
        } else if (!inFlight.has(plan.key) && inFlight.size >= 24) {
          // Fast panning must not enqueue an unbounded world download after
          // the browser has already moved elsewhere. A later view can retry.
          snapshot.failed.push({ key: plan.key, retryAfterMs: 5000 });
        } else {
          snapshot.pending.push(plan.key);
          // Attach a rejection handler immediately; each failed tile keeps its own cooldown.
          void loadTile(plan).catch(() => undefined);
        }
      }
      snapshot.tiles = await Promise.all(ready.map(async tile => {
        if (options.enrichNames === false) return tile;
        const available = await readAvailableNames(tile);
        if (!available) void loadNames(tile).catch(() => undefined);
        return { ...tile, ...(available ?? { places: [], namingStatus: 'unavailable' as const, namingVersion: NAMING_VERSION }) };
      }));
      return snapshot;
    },
    async loadTilesForViewport(bbox: BoundingBox): Promise<OsmTile[]> {
      const tiles = await Promise.all(planOsmTiles(bbox).map(loadTile));
      if (options.enrichNames === false) return tiles;
      return Promise.all(tiles.map(async tile => ({ ...tile, ...await loadNames(tile) })));
    },
  };
}

// Resolve configuration on the first request, after the application's dotenv setup.
let source: ReturnType<typeof createOsmSource> | undefined;
export const loadTilesForViewport = (bbox: BoundingBox) => (source ??= createOsmSource()).loadTilesForViewport(bbox);
export const getOsmViewportSnapshot = (bbox: BoundingBox) => (source ??= createOsmSource()).getViewportSnapshot(bbox);
