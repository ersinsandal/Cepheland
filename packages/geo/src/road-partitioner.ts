import { bboxPolygon, booleanIntersects, polygon } from '@turf/turf';
import type { BoundingBox } from './index.js';
import { partitionRoadTile, type RoadParcel, type RoadTileInput } from './road-parcels.js';

export type ViewportTerritory = RoadParcel;

/** Select by polygon intersection, not center distance or a partial result limit. */
export function territoryIntersectsViewport(
  territory: { geometry: [number, number][]; geometryRings?: [number, number][][] },
  bbox: BoundingBox,
): boolean {
  if (bbox.minLng > bbox.maxLng) {
    return territoryIntersectsViewport(territory, { ...bbox, maxLng: 180 })
      || territoryIntersectsViewport(territory, { ...bbox, minLng: -180 });
  }
  return booleanIntersects(
    polygon(territory.geometryRings ?? [territory.geometry]),
    bboxPolygon([bbox.minLng, bbox.minLat, bbox.maxLng, bbox.maxLat]),
  );
}

/** Road data is mandatory: unavailable OSM data must never become invented streets. */
export function getTerritoriesForViewport(
  bbox: BoundingBox,
  tiles: RoadTileInput[],
): ViewportTerritory[] {
  const territories = new Map<string, ViewportTerritory>();
  for (const tile of tiles) {
    for (const territory of partitionRoadTile(tile)) {
      if (territoryIntersectsViewport(territory, bbox)) territories.set(territory.id, territory);
    }
  }
  return [...territories.values()].sort((a, b) => a.id.localeCompare(b.id));
}
