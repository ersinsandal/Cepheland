/**
 * Cepheland OpenStreetMap (OSM) & Boundary Ingestion Pipeline
 * Blueprint Section 04.2 & 04.3 compliant.
 * Handles ingestion of real road networks and land parcels, assigning weights and geometries.
 */

import { PartitionedFront } from './planetary-grid.js';

export interface OsmFeature {
  type: 'Feature';
  geometry: {
    type: 'Polygon' | 'MultiPolygon' | 'LineString';
    coordinates: any;
  };
  properties: {
    name?: string;
    highway?: string;
    landuse?: string;
    building?: string;
    [key: string]: any;
  };
}

export interface OsmImportSummary {
  totalFeatures: number;
  importedFronts: number;
  totalAreaM2: number;
  arterialsCount: number;
  residentialCount: number;
}

/**
 * Calculates deterministic weight based on OSM highway classification.
 * Section 04: Arterials (5.0), Collectors (2.5), Residential/Local (1.0 - 1.2).
 */
export function calculateOsmRoadWeight(highwayType?: string): number {
  switch (highwayType) {
    case 'motorway':
    case 'trunk':
    case 'primary':
    case 'primary_link':
      return 5.0; // Major arterial avenue / highway

    case 'secondary':
    case 'tertiary':
    case 'secondary_link':
      return 2.5; // Collector street / main boulevard

    case 'residential':
    case 'living_street':
    case 'unclassified':
      return 1.2; // Residential street

    default:
      return 1.0; // Pedestrian, path, or minor sector
  }
}

/**
 * Converts an array of partitioned fronts to a PostgreSQL / PostGIS SQL migration / seed insert script.
 */
export function generateSqlSeedScript(
  fronts: PartitionedFront[],
  regionId: string = 'a0000000-0000-0000-0000-000000000003'
): string {
  const lines: string[] = [
    '--',
    '-- CEPHELAND PLANETARY FRONT INGESTION SQL SCRIPT',
    `-- Total Fronts: ${fronts.length}`,
    '--',
    'BEGIN;',
  ];

  for (const f of fronts) {
    const geomWkt = `POLYGON((${f.geometry.map(([lng, lat]) => `${lng} ${lat}`).join(', ')}))`;
    const centerWkt = `POINT(${f.center.longitude} ${f.center.latitude})`;

    lines.push(
      `INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)`,
      `VALUES (`,
      `  '${f.id}',`,
      `  '${regionId}',`,
      `  '${f.frontCode}',`,
      `  '{"tr": "${f.displayNameI18n.tr.replace(/'/g, "''")}", "en": "${f.displayNameI18n.en.replace(/'/g, "''")}"}'::jsonb,`,
      `  '${f.streetName.replace(/'/g, "''")}',`,
      `  ${f.areaM2},`,
      `  ST_GeomFromText('${geomWkt}', 4326),`,
      `  ST_GeomFromText('${centerWkt}', 4326),`,
      `  ${f.weight},`,
      `  'active'`,
      `) ON CONFLICT (front_code) DO NOTHING;`
    );
  }

  lines.push('COMMIT;');
  return lines.join('\n');
}
