import { Worker } from 'node:worker_threads';
import { createHash, randomUUID } from 'node:crypto';
import { mkdir, readFile, rename, writeFile } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import type { RoadParcel, RoadTileInput } from '@cepheland/geo';

// Change this version whenever the geometry algorithm changes. Raw OSM snapshots
// remain pinned separately; processed parcel caches never include ownership.
const ENGINE_VERSION = 'road-parcels-v3';
const pending = new Map<string, Promise<RoadParcel[]>>();
const queue: (() => void)[] = [];
let active = 0;

async function compute(input: RoadTileInput): Promise<RoadParcel[]> {
  if (active >= 2) await new Promise<void>(resolve => queue.push(resolve));
  else active++;
  try {
    return await new Promise<RoadParcel[]>((resolve, reject) => {
      // CPU-heavy overlays run outside Express's event loop. Only the pinned
      // local geo module is loaded; data is passed through workerData.
      const worker = new Worker(`
        const { parentPort, workerData } = require('node:worker_threads');
        const { partitionRoadTile } = require(${JSON.stringify(require.resolve('@cepheland/geo'))});
        parentPort.postMessage(partitionRoadTile(workerData));
      `, { eval: true, workerData: input });
      const timeout = setTimeout(() => {
        void worker.terminate();
        reject(new Error('Parsel üretimi zaman aşımına uğradı. Lütfen yeniden deneyin.'));
      }, 120_000);
      worker.once('message', parcels => { clearTimeout(timeout); resolve(parcels); });
      worker.once('error', error => { clearTimeout(timeout); reject(error); });
      worker.once('exit', code => {
        clearTimeout(timeout);
        if (code !== 0) reject(new Error(`Parsel üretimi tamamlanamadı (${code}).`));
      });
    });
  } finally {
    const next = queue.shift();
    if (next) next();
    else active--;
  }
}

export async function buildRoadParcels(input: RoadTileInput): Promise<RoadParcel[]> {
  // Place-name enrichment must never invalidate the expensive geometry cache or
  // alter a territory's identity. Accept only geometry inputs in its fingerprint.
  input = { key: input.key, bbox: input.bbox, roads: input.roads, water: input.water,
    coastlines: input.coastlines, reserved: input.reserved };
  const fingerprint = createHash('sha256').update(ENGINE_VERSION).update(JSON.stringify(input)).digest('hex');
  const running = pending.get(fingerprint);
  if (running) return running;
  const result = (async () => {
    const directory = resolve(process.env.PARCEL_CACHE_DIR || join(__dirname, '..', '..', 'scratch', 'parcel-cache'));
    const target = join(directory, `${fingerprint}.json`);
    const bundled = join(__dirname, '..', '..', 'data', 'parcels', `${fingerprint}.json`);
    for (const path of [target, bundled]) {
      try {
        const cached = JSON.parse(await readFile(path, 'utf8'));
        if (cached.version === ENGINE_VERSION && Array.isArray(cached.parcels)) return cached.parcels as RoadParcel[];
      } catch { /* A missing or interrupted cache is rebuilt. */ }
    }
    const parcels = await compute(input);
    await mkdir(directory, { recursive: true });
    const temporary = `${target}.${randomUUID()}.tmp`;
    await writeFile(temporary, JSON.stringify({ version: ENGINE_VERSION, parcels }));
    await rename(temporary, target);
    return parcels;
  })();
  pending.set(fingerprint, result);
  try { return await result; }
  finally { pending.delete(fingerprint); }
}
