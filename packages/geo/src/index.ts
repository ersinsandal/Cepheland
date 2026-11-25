/**
 * Cepheland Geospatial Utilities
 * Specified in Blueprint Section 04:
 * Point-in-polygon, Haversine distance, Play Zone verification, Viewport bbox filter
 */

export interface LatLng {
  latitude: number;
  longitude: number;
}

export interface BoundingBox {
  minLat: number;
  maxLat: number;
  minLng: number;
  maxLng: number;
}

/**
 * Great-circle distance between two coordinates in meters (Haversine formula).
 */
export function haversineDistanceMeters(a: LatLng, b: LatLng): number {
  const R = 6371e3; // Earth radius in meters
  const phi1 = (a.latitude * Math.PI) / 180;
  const phi2 = (b.latitude * Math.PI) / 180;
  const deltaPhi = ((b.latitude - a.latitude) * Math.PI) / 180;
  const deltaLambda = ((b.longitude - a.longitude) * Math.PI) / 180;

  const sinHalfPhi = Math.sin(deltaPhi / 2);
  const sinHalfLambda = Math.sin(deltaLambda / 2);

  const calc =
    sinHalfPhi * sinHalfPhi +
    Math.cos(phi1) * Math.cos(phi2) * sinHalfLambda * sinHalfLambda;
  const c = 2 * Math.atan2(Math.sqrt(calc), Math.sqrt(1 - calc));

  return Math.round(R * c * 100) / 100;
}

/**
 * Checks if point is within polygon (Ray casting algorithm).
 * Polygon coordinates format: [[lng, lat], [lng, lat], ...] as per GeoJSON specification.
 */
export function isPointInPolygon(point: LatLng, polygonRing: [number, number][]): boolean {
  let inside = false;
  const x = point.longitude;
  const y = point.latitude;

  for (let i = 0, j = polygonRing.length - 1; i < polygonRing.length; j = i++) {
    const xi = polygonRing[i][0];
    const yi = polygonRing[i][1];
    const xj = polygonRing[j][0];
    const yj = polygonRing[j][1];

    const intersect = yi > y !== yj > y && x < ((xj - xi) * (y - yi)) / (yj - yi) + xi;
    if (intersect) inside = !inside;
  }

  return inside;
}

/**
 * Checks whether location sample falls within a safe play zone or within allowable tolerance.
 */
export function verifyPlayZonePresence(
  sample: LatLng & { accuracyMeters?: number },
  playZoneGeom: [number, number][],
  playZoneCenter: LatLng,
  maxToleranceMeters: number = 40,
  excludedRings: [number, number][][] = []
): { valid: boolean; distanceToCenterMeters: number; reason?: string } {
  const dist = haversineDistanceMeters(sample, playZoneCenter);

  // If sample accuracy is poor (> 50m), trigger location unreliable
  if (sample.accuracyMeters && sample.accuracyMeters > 50) {
    return { valid: false, distanceToCenterMeters: dist, reason: 'LOCATION_UNRELIABLE' };
  }

  // Inside polygon
  if (excludedRings.some(ring => isPointInPolygon(sample, ring))) {
    return { valid: false, distanceToCenterMeters: dist, reason: 'OUTSIDE_PLAY_ZONE' };
  }
  if (isPointInPolygon(sample, playZoneGeom)) {
    return { valid: true, distanceToCenterMeters: dist };
  }

  // Within designated tolerance boundary of the play zone
  if (dist <= maxToleranceMeters) {
    return { valid: true, distanceToCenterMeters: dist };
  }

  return { valid: false, distanceToCenterMeters: dist, reason: 'OUTSIDE_PLAY_ZONE' };
}

/**
 * Evaluates bounding box containment for viewport queries.
 */
export function isCoordInBBox(coord: LatLng, bbox: BoundingBox): boolean {
  return (
    coord.latitude >= bbox.minLat &&
    coord.latitude <= bbox.maxLat &&
    coord.longitude >= bbox.minLng &&
    coord.longitude <= bbox.maxLng
  );
}

// Global World Hierarchy & Administrative Engine
export * from './world-hierarchy.js';

// Deterministic Planetary Grid & Front Partitioning Engine
export * from './planetary-grid.js';

// OpenStreetMap & Boundary Ingestion Pipeline
export * from './osm-pipeline.js';

// Automated Planetary Road Partitioning & Prebuilt Metropolises
export * from './prebuilt-cities.js';
export * from './road-partitioner.js';
export * from './road-parcels.js';
export * from './front-names.js';


