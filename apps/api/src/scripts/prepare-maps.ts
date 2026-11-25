/** One-time/offline preparation, never called by an interactive map request.
 * Uses the OSM editing API only for a small, explicit set of opening areas.
 * Existing pinned geometry is preserved; production expansion should use a
 * regional OSM extract or a dedicated Overpass mirror instead of bulk API use. */
import 'dotenv/config';
import { mkdir, readFile, writeFile, copyFile, access } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import { createHash } from 'node:crypto';
import { planOsmTiles, parseOsmTile, parseOsmNames, type OsmTile } from '../services/osm-source.js';
import { buildRoadParcels } from '../services/parcel-builder.js';
import { dbStore } from '../db/store.js';
import { loadNameCandidates, candidateCacheKey, candidateCacheDirectory } from '../services/name-candidates.js';

const regions: Record<string, [number, number]> = {
  mahmutlar: [36.4884, 32.0965], moda: [40.983, 29.028],
  konya: [37.872, 32.493], ankara: [39.918, 32.856],
};
const root = resolve(__dirname, '..', '..');
const rawDir = join(root, 'data', 'maps', 'v1');
const parcelsDir = join(root, 'data', 'parcels');
const namesDir = join(root, 'data', 'names');
const cacheDir = resolve(process.env.OSM_CACHE_DIR || join(root, 'scratch', 'osm-cache', 'v1'));
const geometryCacheDir = resolve(process.env.PARCEL_CACHE_DIR || join(root, 'scratch', 'parcel-cache'));
const reserved = [...dbStore.fronts.values()].filter(f => !f.source && f.mapVersionId !== 'map_v1_world')
  .map(f => ({ type: 'Polygon' as const, coordinates: f.geometryRings ?? [f.geometry] }));

async function exists(file: string) { try { await access(file); return true; } catch { return false; } }

async function download(box: number[], depth = 0): Promise<{ elements: any[] }> {
  const query = box.map(n => Number(n.toFixed(6))).join(',');
  const response = await fetch(`https://api.openstreetmap.org/api/0.6/map.json?bbox=${query}`, {
    headers: { 'User-Agent': 'Cepheland/1.0 (offline opening-area preparation)', Accept: 'application/json' },
    signal: AbortSignal.timeout(30_000),
  });
  const text = await response.text();
  if (response.ok) return JSON.parse(text);
  // Dense downtown areas can exceed the map API's node limit. Subdivide this
  // explicit preparation area, merge complete objects, then validate as usual.
  if (response.status === 400 && /too many nodes|maximum.*nodes|area.*too large/i.test(text) && depth < 2) {
    const [w, s, e, n] = box, x = (w+e)/2, y = (s+n)/2;
    const elements = new Map<string, any>();
    for (const part of [[w,s,x,y], [x,s,e,y], [w,y,x,n], [x,y,e,n]]) {
      for (const element of (await download(part, depth+1)).elements) {
        const key = `${element.type}/${element.id}`;
        if ((elements.get(key)?.version ?? -1) <= (element.version ?? 0)) elements.set(key, element);
      }
    }
    return { elements: [...elements.values()] };
  }
  throw new Error(`OSM HTTP ${response.status}: ${text.slice(0, 180)}`);
}

async function run() {
  const selected = process.argv.slice(2);
  const keys = selected.length ? selected : Object.keys(regions);
  for (const key of keys) if (!regions[key]) throw new Error(`Unknown opening region: ${key}`);
  await mkdir(rawDir, { recursive: true });
  await mkdir(parcelsDir, { recursive: true });
  await mkdir(namesDir, { recursive: true });
  const plans = new Map<string, ReturnType<typeof planOsmTiles>[number]>();
  for (const key of keys) {
    const [lat, lng] = regions[key];
    for (const plan of planOsmTiles({ minLat: lat-.006, maxLat: lat+.006, minLng: lng-.012, maxLng: lng+.012 })) plans.set(plan.key, plan);
  }
  const report: object[] = [];
  for (const plan of plans.values()) {
    const started = Date.now();
    const target = join(rawDir, `${plan.key}.json`);
    const cached = join(cacheDir, `${plan.key}.json`);
    let tile: OsmTile;
    if (await exists(target)) tile = JSON.parse(await readFile(target, 'utf8')).tile;
    else if (await exists(cached)) {
      await copyFile(cached, target);
      tile = JSON.parse(await readFile(target, 'utf8')).tile;
    } else {
      const b = plan.bbox;
      const body = await download([b.minLng-.005, b.minLat-.005, b.maxLng+.005, b.maxLat+.005]);
      const nodes = new Map(body.elements.filter(e => e.type === 'node').map(e => [e.id, { lat: e.lat, lon: e.lon }]));
      for (const way of body.elements.filter(e => e.type === 'way')) {
        if (!way.nodes?.every((id: number) => nodes.has(id))) throw new Error(`${plan.key}: incomplete way ${way.id}`);
        way.geometry = way.nodes.map((id: number) => nodes.get(id));
      }
      // Strict parser rejects incomplete water, rather than filling it with land.
      tile = parseOsmTile(plan, body);
      const places = parseOsmNames(body);
      await writeFile(target, JSON.stringify({ version: 1, tile }));
      await writeFile(join(rawDir, `${plan.key}.osm-names-v1.json`), JSON.stringify({ version: 'osm-names-v1', key: plan.key, bbox: plan.bbox, places }));
    }
    const cachedNames = join(cacheDir, `${plan.key}.osm-names-v1.json`);
    const bundledNames = join(rawDir, `${plan.key}.osm-names-v1.json`);
    if (!await exists(bundledNames) && await exists(cachedNames)) await copyFile(cachedNames, bundledNames);
    const input = { key: tile.key, bbox: tile.bbox, roads: tile.roads, water: tile.water, coastlines: tile.coastlines, reserved };
    const parcels = await buildRoadParcels(input);
    const hash = createHash('sha256').update('road-parcels-v3').update(JSON.stringify(input)).digest('hex');
    const output = join(parcelsDir, `${hash}.json`);
    if (!await exists(output)) await copyFile(join(geometryCacheDir, `${hash}.json`), output);
    if (await exists(bundledNames)) tile = { ...tile, places: JSON.parse(await readFile(bundledNames, 'utf8')).places };
    const core = [...dbStore.fronts.values()].filter(f => !f.source && f.mapVersionId !== 'map_v1_world')
      .map(f => ({ id: f.id, center: f.center, geometry: f.geometry, geometryRings: f.geometryRings }));
    await loadNameCandidates(tile, parcels, core);
    const namesFile = candidateCacheKey(tile, parcels, core)+'.json';
    if (!await exists(join(namesDir, namesFile))) await copyFile(join(candidateCacheDirectory(), namesFile), join(namesDir, namesFile));
    const entry = { key: tile.key, bbox: tile.bbox, roads: tile.roads.length, parcels: parcels.length, elapsedMs: Date.now()-started };
    report.push(entry);
    console.log(JSON.stringify(entry));
  }
  await writeFile(join(root, 'data', 'preparation-report.json'), JSON.stringify({ preparedAt: new Date().toISOString(), regions: keys, tiles: report }, null, 2));
}
run().catch(error => { console.error(error); process.exitCode = 1; });
