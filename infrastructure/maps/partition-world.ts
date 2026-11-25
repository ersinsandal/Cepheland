/**
 * Cepheland Planetary Front Generator CLI
 * Generates deterministic front datasets for any world region or bounding box.
 * Outputs GeoJSON, JSON catalog, or SQL seed scripts.
 */

import {
  WORLD_NEIGHBORHOODS,
  WORLD_DISTRICTS,
  partitionViewport,
  generateSqlSeedScript,
  PartitionedFront,
} from '../../packages/geo/src/index.js';
import * as fs from 'fs';
import * as path from 'path';

export function generateAllKeyWorldFronts(): {
  totalFronts: number;
  neighborhoodsCount: number;
  frontsByDistrict: Record<string, PartitionedFront[]>;
} {
  const frontsByDistrict: Record<string, PartitionedFront[]> = {};
  let totalFronts = 0;

  for (const [key, neigh] of Object.entries(WORLD_NEIGHBORHOODS)) {
    const bbox = {
      minLat: neigh.bbox[0],
      maxLat: neigh.bbox[1],
      minLng: neigh.bbox[2],
      maxLng: neigh.bbox[3],
    };

    // Partition the neighborhood into street-block fronts (ada & 4-5 streets)
    const fronts = partitionViewport(bbox, 120);
    frontsByDistrict[key] = fronts;
    totalFronts += fronts.length;
  }

  return {
    totalFronts,
    neighborhoodsCount: Object.keys(WORLD_NEIGHBORHOODS).length,
    frontsByDistrict,
  };
}

// Execution block when run as script
if (process.argv[1] && process.argv[1].includes('partition-world')) {
  console.log('=====================================================');
  console.log(' CEPHELAND PLANETARY FRONT PARTITIONING PIPELINE');
  console.log('=====================================================');

  const result = generateAllKeyWorldFronts();
  console.log(`Generated ${result.totalFronts} fronts across ${result.neighborhoodsCount} world metropolises!`);

  for (const [distKey, fronts] of Object.entries(result.frontsByDistrict)) {
    const arterials = fronts.filter((f) => f.weight >= 4.0).length;
    const collectors = fronts.filter((f) => f.weight >= 2.0 && f.weight < 4.0).length;
    const residential = fronts.filter((f) => f.weight < 2.0).length;
    console.log(
      `  - ${distKey}: ${fronts.length} fronts (Arterials: ${arterials}, Collectors: ${collectors}, Residential: ${residential})`
    );
  }

  // Generate SQL output
  const allFronts = Object.values(result.frontsByDistrict).flat();
  const sql = generateSqlSeedScript(allFronts);
  const outDir = path.resolve(process.cwd(), 'infrastructure/sql/seed');
  if (!fs.existsSync(outDir)) {
    fs.mkdirSync(outDir, { recursive: true });
  }
  const outFile = path.join(outDir, '003_seed_world_fronts.sql');
  fs.writeFileSync(outFile, sql, 'utf8');
  console.log(`Exported SQL seed to: ${outFile}`);
}
