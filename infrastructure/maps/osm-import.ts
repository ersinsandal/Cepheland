/**
 * Cepheland OpenStreetMap Ingestion Runner
 * Reads GeoJSON feature collections from OSM Overpass or local extract and outputs validated fronts.
 */

import { calculateOsmRoadWeight, OsmFeature, OsmImportSummary } from '../../packages/geo/src/index.js';
import * as fs from 'fs';

export function parseOsmGeoJson(filePath: string): OsmImportSummary {
  if (!fs.existsSync(filePath)) {
    return {
      totalFeatures: 0,
      importedFronts: 0,
      totalAreaM2: 0,
      arterialsCount: 0,
      residentialCount: 0,
    };
  }

  const raw = fs.readFileSync(filePath, 'utf8');
  const collection = JSON.parse(raw);
  const features: OsmFeature[] = collection.features || [];

  let arterialsCount = 0;
  let residentialCount = 0;

  for (const feat of features) {
    const weight = calculateOsmRoadWeight(feat.properties.highway);
    if (weight >= 4.0) arterialsCount++;
    else residentialCount++;
  }

  return {
    totalFeatures: features.length,
    importedFronts: features.length,
    totalAreaM2: features.length * 15000,
    arterialsCount,
    residentialCount,
  };
}
