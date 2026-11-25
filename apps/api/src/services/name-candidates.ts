import { createHash, randomUUID } from 'node:crypto';
import { mkdir, readFile, rename, writeFile } from 'node:fs/promises';
import { join } from 'node:path';
import { createFrontNameResolver, territoryIntersectsViewport, type NameableFront, type RoadParcel } from '@cepheland/geo';
import type { OsmTile } from './osm-source.js';
import type { FrontNameProposal } from './front-name-registry.js';

const VERSION = 'front-name-candidates-v1';
export function candidateCacheKey(tile: OsmTile, parcels: RoadParcel[], core: NameableFront[]) {
  return createHash('sha256').update(VERSION).update(JSON.stringify({
    key: tile.key, bbox: tile.bbox, roads: tile.roads, places: tile.places ?? [],
    parcels: parcels.map(p => p.id), core,
  })).digest('hex');
}
export const candidateCacheDirectory = () => join(__dirname, '..', '..', 'scratch', 'name-candidates');

/** Offline-prepared naming candidates remove POI containment/frontage work from
 * the first opening-area HTTP response. The registry still allocates the names
 * globally, so a prepared list cannot override an existing name or ownership. */
export async function loadNameCandidates(tile: OsmTile, parcels: RoadParcel[], core: NameableFront[]): Promise<FrontNameProposal[]> {
  const key = candidateCacheKey(tile, parcels, core);
  const file = `${key}.json`;
  if (process.env.NODE_ENV !== 'test') {
    for (const directory of [candidateCacheDirectory(), join(__dirname, '..', '..', 'data', 'names')]) {
      try {
        const cached = JSON.parse(await readFile(join(directory, file), 'utf8'));
        if (cached.version === VERSION && Array.isArray(cached.proposals)) return cached.proposals;
      } catch { /* Regenerate only candidates; geometry and assigned names remain pinned. */ }
    }
  }
  const resolveName = createFrontNameResolver(tile);
  const proposals: FrontNameProposal[] = parcels.map(parcel => ({ frontId: parcel.id, ...resolveName(parcel) }));
  for (const front of core) {
    if (territoryIntersectsViewport(front, tile.bbox)) proposals.push({ frontId: front.id, ...resolveName(front) });
  }
  if (process.env.NODE_ENV !== 'test') {
    await mkdir(candidateCacheDirectory(), { recursive: true });
    const target = join(candidateCacheDirectory(), file), temporary = `${target}.${randomUUID()}.tmp`;
    await writeFile(temporary, JSON.stringify({ version: VERSION, proposals }));
    await rename(temporary, target);
  }
  return proposals;
}
