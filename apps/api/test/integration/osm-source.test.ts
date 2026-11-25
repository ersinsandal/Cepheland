import { mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { basename, dirname, join, resolve } from 'node:path';
import { describe, expect, it, vi } from 'vitest';
import { createOsmSource, parseOsmNames, parseOsmTile, planOsmTiles } from '../../src/services/osm-source.js';

const bbox = { minLat: 40.981, maxLat: 40.989, minLng: 29.021, maxLng: 29.029 };
const way = {
  type: 'way', id: 123, tags: { highway: 'residential', name: 'Test Sokağı' },
  nodes: [1, 2, 3],
  geometry: [{ lon: 29.021, lat: 40.982 }, { lon: 29.025, lat: 40.984 }, { lon: 29.029, lat: 40.985 }],
};
const body = { version: 0.6, elements: [way] };
const success = (data: unknown = body) => ({ ok: true, status: 200, text: async () => JSON.stringify(data) });

describe('OSM source and stable tile snapshots', () => {
  it('uses the same full tile for nearby viewports, including negative world coordinates', () => {
    expect(planOsmTiles(bbox)).toEqual(planOsmTiles({ ...bbox, minLat: 40.983, maxLng: 29.031 }));
    expect(planOsmTiles(bbox)[0].bbox).toEqual({ minLat: 40.98, maxLat: 41, minLng: 29.02, maxLng: 29.04 });
    expect(planOsmTiles({ minLat: -1, maxLat: -0.98, minLng: -74, maxLng: -73.98 })).toHaveLength(1);
  });

  it('rejects invalid or large viewports instead of returning a truncated corner', () => {
    expect(() => planOsmTiles({ ...bbox, minLat: NaN })).toThrow('Geçerli');
    expect(() => planOsmTiles({ minLat: 0, maxLat: 10, minLng: 0, maxLng: 10 })).toThrow('yakınlaştırın');
    const crossed = planOsmTiles({ minLat: 1, maxLat: 1.01, minLng: 179.99, maxLng: -179.99 });
    expect(crossed).toHaveLength(2);
    expect(crossed.map(tile => tile.bbox.minLng)).toEqual([179.98, -180]);
  });

  it('deduplicates simultaneous requests and uses a halo with full way geometry', async () => {
    const fetcher = vi.fn(async () => success());
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'], enrichNames: false });
    const [first, second] = await Promise.all([source.loadTilesForViewport(bbox), source.loadTilesForViewport(bbox)]);
    expect(fetcher).toHaveBeenCalledTimes(1);
    expect(first).toEqual(second);
    expect(first[0].roads[0].coordinates).toHaveLength(3);
    const init = fetcher.mock.calls[0][1] as RequestInit;
    const query = new URLSearchParams(init.body as string).get('data');
    expect(query).toContain('(40.975,29.015,41.005,29.045)');
    expect(query).toContain('out body geom');
    await source.loadTilesForViewport(bbox);
    expect(fetcher).toHaveBeenCalledTimes(1);
  });

  it('retries an alternate endpoint and does not cache an outage as empty land', async () => {
    const fetcher = vi.fn(async () => ({ ok: false, status: 503, text: async () => 'unavailable' }));
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://first.test', 'https://second.test'], enrichNames: false, retryMs: 0 });
    await expect(source.loadTilesForViewport(bbox)).rejects.toMatchObject({ code: 'OSM_UNAVAILABLE', statusCode: 503 });
    expect(fetcher).toHaveBeenCalledTimes(2);
    fetcher.mockImplementation(async () => success());
    const tiles = await source.loadTilesForViewport(bbox);
    expect(tiles[0].roads).toHaveLength(1);
    expect(fetcher).toHaveBeenCalledTimes(3);
  });

  it('refuses a partial successful HTTP response when Overpass times out', async () => {
    const fetcher = vi.fn(async () => success({ ...body, remark: 'runtime error: Query timed out' }));
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'], enrichNames: false });
    await expect(source.loadTilesForViewport(bbox)).rejects.toMatchObject({ code: 'OSM_UNAVAILABLE' });
  });

  it('preserves water multipolygon inner rings and directed coastline coordinates', () => {
    const outer = [{ lat: 40.98, lon: 29.02 }, { lat: 40.99, lon: 29.02 }, { lat: 40.99, lon: 29.03 }, { lat: 40.98, lon: 29.03 }, { lat: 40.98, lon: 29.02 }];
    const inner = [{ lat: 40.983, lon: 29.023 }, { lat: 40.987, lon: 29.023 }, { lat: 40.987, lon: 29.027 }, { lat: 40.983, lon: 29.027 }, { lat: 40.983, lon: 29.023 }];
    const tile = parseOsmTile(planOsmTiles(bbox)[0], { elements: [
      { type: 'way', id: 99, tags: { natural: 'coastline' }, nodes: [1, 2], geometry: [{ lat: 40.98, lon: 29.02 }, { lat: 40.99, lon: 29.02 }] },
      { type: 'relation', id: 55, tags: { type: 'multipolygon', natural: 'water' }, members: [
        { type: 'way', ref: 10, role: 'outer', geometry: outer },
        { type: 'way', ref: 11, role: 'inner', geometry: inner },
      ] },
    ] });
    expect(tile.water).toHaveLength(1);
    expect(tile.water[0].type).toBe('Polygon');
    expect(tile.water[0].coordinates).toHaveLength(2);
    expect(tile.coastlines).toEqual([[[29.02, 40.98], [29.02, 40.99]]]);
  });

  it('loads a pinned disk snapshot in a fresh source without hitting the network', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-osm-test-'));
    try {
      const firstFetcher = vi.fn(async () => success());
      await createOsmSource({ fetcher: firstFetcher, cacheDirectory: directory, enrichNames: false }).loadTilesForViewport(bbox);
      const secondFetcher = vi.fn(async () => { throw new Error('offline'); });
      const tiles = await createOsmSource({ fetcher: secondFetcher, cacheDirectory: directory, enrichNames: false }).loadTilesForViewport(bbox);
      expect(secondFetcher).not.toHaveBeenCalled();
      expect(tiles[0].roads[0].id).toBe('way/123');
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-osm-test-')) {
        throw new Error('Refusing to remove a path outside the test temporary directory');
      }
      await rm(directory, { recursive: true, force: true });
    }
  });

  it('bounds parallel upstream calls across different tiles', async () => {
    let active = 0;
    let peak = 0;
    const fetcher = vi.fn(async () => {
      active++;
      peak = Math.max(peak, active);
      await new Promise(resolve => setTimeout(resolve, 5));
      active--;
      return success();
    });
    const source = createOsmSource({ fetcher, cacheDirectory: null, concurrency: 2, enrichNames: false });
    await source.loadTilesForViewport({ minLat: 40.98, maxLat: 41.02, minLng: 29.02, maxLng: 29.06 });
    expect(fetcher).toHaveBeenCalledTimes(4);
    expect(peak).toBe(2);
  });
});

describe('Nonblocking OSM viewport snapshots', () => {
  const east = { ...bbox, minLng: 29.041, maxLng: 29.049 };
  const fartherEast = { ...bbox, minLng: 29.061, maxLng: 29.069 };
  const pair = { ...bbox, maxLng: east.maxLng };
  const triple = { ...bbox, maxLng: fartherEast.maxLng };

  it('keeps a ready neighbor visible while other tiles are pending or failed', async () => {
    let finishPending!: (response: ReturnType<typeof success>) => void;
    const pending = new Promise<ReturnType<typeof success>>(resolve => { finishPending = resolve; });
    const fetcher = vi.fn(async (_url: string, init: RequestInit) => {
      const query = new URLSearchParams(init.body as string).get('data')!;
      if (query.includes(',29.035,')) return pending;
      if (query.includes(',29.055,')) throw new Error('one neighboring tile is offline');
      return success();
    });
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'], enrichNames: false });
    const [ready] = await source.loadTilesForViewport(bbox);
    const initial = await source.getViewportSnapshot(triple);
    expect(initial.tiles).toEqual([ready]);
    expect(initial.pending).toEqual([planOsmTiles(east)[0].key, planOsmTiles(fartherEast)[0].key]);
    await vi.waitFor(async () => {
      const snapshot = await source.getViewportSnapshot(triple);
      expect(snapshot.tiles).toEqual([ready]);
      expect(snapshot.pending).toEqual([planOsmTiles(east)[0].key]);
      expect(snapshot.failed).toEqual([{ key: planOsmTiles(fartherEast)[0].key, retryAfterMs: expect.any(Number) }]);
      expect(snapshot.failed[0].retryAfterMs).toBeGreaterThan(0);
    });
    expect(fetcher).toHaveBeenCalledTimes(3);
    finishPending(success());
    await source.loadTilesForViewport(east);
    expect((await source.getViewportSnapshot(triple)).tiles).toHaveLength(2);
  });

  it('deduplicates background requests and retries failed tiles only after their cooldown on demand', async () => {
    const now = vi.spyOn(Date, 'now').mockReturnValue(10_000);
    try {
      const fetcher = vi.fn(async () => { throw new Error('offline'); });
      const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'], enrichNames: false });
      const snapshots = await Promise.all([source.getViewportSnapshot(bbox), source.getViewportSnapshot(bbox)]);
      expect(snapshots.every(snapshot => snapshot.tiles.length === 0)).toBe(true);
      await vi.waitFor(async () => expect((await source.getViewportSnapshot(bbox)).failed).toEqual([
        { key: planOsmTiles(bbox)[0].key, retryAfterMs: 30_000 },
      ]));
      await source.getViewportSnapshot(bbox);
      expect(fetcher).toHaveBeenCalledTimes(1);
      now.mockReturnValue(39_999);
      expect((await source.getViewportSnapshot(bbox)).failed[0].retryAfterMs).toBe(1);
      now.mockReturnValue(40_001);
      expect(fetcher).toHaveBeenCalledTimes(1);
      fetcher.mockImplementation(async () => success());
      const retry = await source.getViewportSnapshot(bbox);
      expect(retry.pending).toEqual([planOsmTiles(bbox)[0].key]);
      expect(retry.failed).toEqual([]);
      await source.loadTilesForViewport(bbox);
      expect(fetcher).toHaveBeenCalledTimes(2);
      expect((await source.getViewportSnapshot(bbox)).tiles[0].roads[0].id).toBe('way/123');
    } finally {
      now.mockRestore();
    }
  });

  it('returns disk roads immediately even when a naming fetch never resolves', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-osm-test-'));
    try {
      const [original] = await createOsmSource({ fetcher: async () => success(), cacheDirectory: directory, enrichNames: false }).loadTilesForViewport(bbox);
      const fetcher = vi.fn((_url: string, init: RequestInit) => {
        expect(isNamingQuery(init)).toBe(true);
        return new Promise<ReturnType<typeof success>>(() => undefined);
      });
      const source = createOsmSource({ fetcher, cacheDirectory: directory, endpoints: ['https://example.test'], namingTimeoutMs: 30 });
      const snapshot = await source.getViewportSnapshot(bbox);
      expect(snapshot.tiles[0].roads).toEqual(original.roads);
      expect(snapshot.tiles[0].key).toBe(original.key);
      expect(snapshot.pending).toEqual([]);
      expect(snapshot.failed).toEqual([]);
      await vi.waitFor(() => expect(fetcher).toHaveBeenCalledTimes(1), { interval: 1 });
      expect((await source.getViewportSnapshot(bbox)).tiles[0].roads).toEqual(original.roads);
      // The legacy blocking caller also gets roads after the independently bounded name timeout.
      expect((await source.loadTilesForViewport(bbox))[0].namingStatus).toBe('unavailable');
      expect(fetcher).toHaveBeenCalledTimes(1);
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-osm-test-')) throw new Error('Unsafe test directory');
      await rm(directory, { recursive: true, force: true });
    }
  });

  it('keeps name queries at concurrency one without consuming any road slots and publishes names on later snapshots', async () => {
    const waitingNames: ((response: ReturnType<typeof success>) => void)[] = [];
    const fetcher = vi.fn(async (_url: string, init: RequestInit) => {
      if (isNamingQuery(init)) return new Promise<ReturnType<typeof success>>(resolve => { waitingNames.push(resolve); });
      return success();
    });
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'], concurrency: 1 });
    await source.getViewportSnapshot(bbox);
    await vi.waitFor(async () => expect((await source.getViewportSnapshot(bbox)).tiles).toHaveLength(1));
    await vi.waitFor(() => expect(waitingNames).toHaveLength(1));
    const before = await source.getViewportSnapshot(pair);
    expect(before.tiles).toHaveLength(1);
    expect(before.pending).toEqual([planOsmTiles(east)[0].key]);
    await vi.waitFor(async () => expect((await source.getViewportSnapshot(pair)).tiles).toHaveLength(2));
    expect(waitingNames).toHaveLength(1);
    expect(fetcher.mock.calls.filter(([, init]) => !isNamingQuery(init))).toHaveLength(2);
    waitingNames[0](success(namedBody));
    await vi.waitFor(() => expect(waitingNames).toHaveLength(2));
    waitingNames[1](success(namedBody));
    await source.loadTilesForViewport(pair);
    const enriched = await source.getViewportSnapshot(pair);
    expect(enriched.tiles.every(tile => tile.namingStatus === 'ready' && tile.places?.[0].id === 'node/701')).toBe(true);
    expect(fetcher).toHaveBeenCalledTimes(4);
  });

  it('reads both pinned disk snapshots on the first call without any upstream request', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-osm-test-'));
    try {
      const fetcher = vi.fn(async (_url: string, init: RequestInit) => success(isNamingQuery(init) ? namedBody : body));
      const [original] = await createOsmSource({ fetcher, cacheDirectory: directory }).loadTilesForViewport(bbox);
      const offline = vi.fn(async () => { throw new Error('offline'); });
      const snapshot = await createOsmSource({ fetcher: offline, cacheDirectory: directory }).getViewportSnapshot(bbox);
      expect(snapshot).toEqual({ tiles: [original], pending: [], failed: [] });
      expect(offline).not.toHaveBeenCalled();
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-osm-test-')) throw new Error('Unsafe test directory');
      await rm(directory, { recursive: true, force: true });
    }
  });

  it('falls back to bundled roads and names without replacing an existing writable road snapshot', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-osm-test-'));
    try {
      const bundledDirectory = join(directory, 'bundled');
      const cacheDirectory = join(directory, 'writable');
      const fetcher = vi.fn(async (_url: string, init: RequestInit) => success(isNamingQuery(init) ? namedBody : body));
      const [bundled] = await createOsmSource({ fetcher, cacheDirectory: bundledDirectory }).loadTilesForViewport(bbox);
      const bundledPath = join(bundledDirectory, `${bundled.key}.json`);
      const bundledBefore = await readFile(bundledPath, 'utf8');
      const offline = vi.fn(async () => { throw new Error('offline'); });
      const missingCache = createOsmSource({ fetcher: offline, cacheDirectory, bundledDirectory });
      expect(await missingCache.getViewportSnapshot(bbox)).toEqual({ tiles: [bundled], pending: [], failed: [] });
      expect(offline).not.toHaveBeenCalled();

      const [pinned] = await createOsmSource({
        fetcher: async () => success({ ...body, elements: [{ ...way, id: 999 }] }), cacheDirectory, enrichNames: false,
      }).loadTilesForViewport(bbox);
      const pinnedPath = join(cacheDirectory, `${pinned.key}.json`);
      const pinnedBefore = await readFile(pinnedPath, 'utf8');
      const snapshot = await createOsmSource({ fetcher: offline, cacheDirectory, bundledDirectory }).getViewportSnapshot(bbox);
      expect(snapshot.tiles[0].roads[0].id).toBe('way/999');
      expect(snapshot.tiles[0].places).toEqual(bundled.places);
      expect(offline).not.toHaveBeenCalled();
      expect(await readFile(pinnedPath, 'utf8')).toBe(pinnedBefore);
      expect(await readFile(bundledPath, 'utf8')).toBe(bundledBefore);
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-osm-test-')) throw new Error('Unsafe test directory');
      await rm(directory, { recursive: true, force: true });
    }
  });

  it('bounds stalled road fetches across endpoints and never substitutes invented empty geometry', async () => {
    const fetcher = vi.fn((_url: string, _init: RequestInit) => new Promise<ReturnType<typeof success>>(() => undefined));
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://first.test', 'https://second.test'], timeoutMs: 10, enrichNames: false });
    expect(await source.getViewportSnapshot(bbox)).toEqual({ tiles: [], pending: [planOsmTiles(bbox)[0].key], failed: [] });
    await expect(source.loadTilesForViewport(bbox)).rejects.toMatchObject({ code: 'OSM_UNAVAILABLE' });
    expect(fetcher).toHaveBeenCalledTimes(2);
    expect(fetcher.mock.calls.every(([, init]) => init.signal?.aborted)).toBe(true);
    const snapshot = await source.getViewportSnapshot(bbox);
    expect(snapshot.tiles).toEqual([]);
    expect(snapshot.pending).toEqual([]);
    expect(snapshot.failed).toEqual([{ key: planOsmTiles(bbox)[0].key, retryAfterMs: expect.any(Number) }]);
  });
});

const cafe = { type: 'node', id: 701, lat: 40.984, lon: 29.024, tags: { amenity: 'cafe', name: 'Ada Kahvesi' } };
const namedBody = { version: 0.6, elements: [cafe] };
const isNamingQuery = (init: RequestInit) => new URLSearchParams(init.body as string).get('data')!.includes('"amenity"');

describe('Optional real place-name enrichment', () => {
  it('retains separate branches with the same name and exact POI positions', () => {
    const places = parseOsmNames({ elements: [cafe, { ...cafe, id: 702, lon: 29.026 }] });
    expect(places.map(place => place.id)).toEqual(['node/701', 'node/702']);
    expect(places.map(place => place.tags.name)).toEqual(['Ada Kahvesi', 'Ada Kahvesi']);
    expect(places[0].geometry).toEqual({ type: 'Point', coordinates: [29.024, 40.984] });
  });

  it('preserves an actual named polygon footprint with its excluded inner courtyard', () => {
    const outer = [{ lat: 40.98, lon: 29.02 }, { lat: 40.99, lon: 29.02 }, { lat: 40.99, lon: 29.03 }, { lat: 40.98, lon: 29.03 }, { lat: 40.98, lon: 29.02 }];
    const inner = [{ lat: 40.983, lon: 29.023 }, { lat: 40.987, lon: 29.023 }, { lat: 40.987, lon: 29.027 }, { lat: 40.983, lon: 29.027 }, { lat: 40.983, lon: 29.023 }];
    const places = parseOsmNames({ elements: [{
      type: 'relation', id: 710, tags: { type: 'multipolygon', amenity: 'school', name: 'Örnek Lisesi' },
      members: [
        { type: 'way', ref: 711, role: 'outer', geometry: outer },
        { type: 'way', ref: 712, role: 'inner', geometry: inner },
      ],
    }] });
    expect(places).toHaveLength(1);
    expect(places[0].geometry.type).toBe('Polygon');
    expect(places[0].geometry.coordinates).toHaveLength(2);
    expect(places[0].id).toBe('relation/710');
  });

  it('skips inactive shops and unrelated residential names without inventing POIs', () => {
    const places = parseOsmNames({ elements: [
      { ...cafe, id: 1, tags: { shop: 'vacant', name: 'Eski Market' } },
      { ...cafe, id: 2, tags: { amenity: 'cafe', name: 'Kapalı Kafe', disused: 'yes' } },
      { ...cafe, id: 3, tags: { building: 'apartments', name: 'Konut' } },
      { ...cafe, id: 4, tags: { amenity: 'cafe' } },
      { ...cafe, id: 5, tags: { place: 'neighbourhood', 'name:tr': 'Caferağa' } },
    ] });
    expect(places.map(place => place.id)).toEqual(['node/5']);
  });

  it('deduplicates naming requests independently of geometry requests', async () => {
    const fetcher = vi.fn(async (_url: string, init: RequestInit) => success(isNamingQuery(init) ? namedBody : body));
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'] });
    const [first, second] = await Promise.all([source.loadTilesForViewport(bbox), source.loadTilesForViewport(bbox)]);
    expect(fetcher).toHaveBeenCalledTimes(2);
    expect(first).toEqual(second);
    expect(first[0]).toMatchObject({ namingStatus: 'ready', namingVersion: 'osm-names-v1', places: [{ id: 'node/701' }] });
    expect(first[0].roads[0].id).toBe('way/123');
    const nameRequest = fetcher.mock.calls.find(([, init]) => isNamingQuery(init))![1];
    const query = new URLSearchParams(nameRequest.body as string).get('data')!;
    expect(query).toContain('out body geom');
    expect(query).toContain('"shop"');
    expect(query).not.toContain('"building"');
    await source.loadTilesForViewport(bbox);
    expect(fetcher).toHaveBeenCalledTimes(2);
  });

  it('returns valid roads when both name sources fail and suppresses immediate retries', async () => {
    const fetcher = vi.fn(async (_url: string, init: RequestInit) => {
      if (isNamingQuery(init)) throw new Error('names unavailable');
      return success();
    });
    const source = createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://first.test', 'https://second.test'] });
    const first = await source.loadTilesForViewport(bbox);
    expect(first[0]).toMatchObject({ namingStatus: 'unavailable', places: [], roads: [{ id: 'way/123' }] });
    expect(fetcher).toHaveBeenCalledTimes(3);
    expect(await source.loadTilesForViewport(bbox)).toEqual(first);
    expect(fetcher).toHaveBeenCalledTimes(3);
  });

  it('rejects a timed-out partial name response without rejecting its complete road snapshot', async () => {
    const fetcher = vi.fn(async (_url: string, init: RequestInit) => success(isNamingQuery(init)
      ? { ...namedBody, remark: 'runtime error: Query timed out' } : body));
    const [tile] = await createOsmSource({ fetcher, cacheDirectory: null, endpoints: ['https://example.test'] }).loadTilesForViewport(bbox);
    expect(tile.namingStatus).toBe('unavailable');
    expect(tile.places).toEqual([]);
    expect(tile.roads).toHaveLength(1);
  });

  it('enriches a pinned old road cache through a separate sidecar without changing or downloading geometry', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-osm-test-'));
    try {
      const [original] = await createOsmSource({ fetcher: async () => success(), cacheDirectory: directory, enrichNames: false }).loadTilesForViewport(bbox);
      const filename = join(directory, `${original.key}.json`);
      const geometryBefore = await readFile(filename, 'utf8');
      const namesOnlyFetcher = vi.fn(async (_url: string, init: RequestInit) => {
        expect(isNamingQuery(init)).toBe(true);
        return success(namedBody);
      });
      const [enriched] = await createOsmSource({ fetcher: namesOnlyFetcher, cacheDirectory: directory }).loadTilesForViewport(bbox);
      expect(namesOnlyFetcher).toHaveBeenCalledTimes(1);
      expect(enriched.roads).toEqual(original.roads);
      expect(enriched.key).toBe(original.key);
      expect(await readFile(filename, 'utf8')).toBe(geometryBefore);
      expect(JSON.parse(await readFile(join(directory, `${original.key}.osm-names-v1.json`), 'utf8')).places).toHaveLength(1);
      const offline = vi.fn(async () => { throw new Error('offline'); });
      const [restored] = await createOsmSource({ fetcher: offline, cacheDirectory: directory }).loadTilesForViewport(bbox);
      expect(restored).toEqual(enriched);
      expect(offline).not.toHaveBeenCalled();
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-osm-test-')) {
        throw new Error('Refusing to remove a path outside the test temporary directory');
      }
      await rm(directory, { recursive: true, force: true });
    }
  });
});
