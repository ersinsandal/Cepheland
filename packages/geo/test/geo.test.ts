import { describe, expect, it } from 'vitest';
import {
  haversineDistanceMeters,
  isPointInPolygon,
  verifyPlayZonePresence,
  isCoordInBBox,
} from '../src/index.js';

describe('Geospatial Calculation Tests', () => {
  it('Haversine formula calculates correct distance in meters', () => {
    // Alanya center to Mahmutlar center (~10 km)
    const alanya = { latitude: 36.5437, longitude: 31.9998 };
    const mahmutlar = { latitude: 36.4850, longitude: 32.0950 };

    const distance = haversineDistanceMeters(alanya, mahmutlar);
    expect(distance).toBeGreaterThan(10000);
    expect(distance).toBeLessThan(12000);
  });

  it('isPointInPolygon accurately detects point inside/outside polygon', () => {
    // Square around Mahmutlar Kumru Sokak
    const squareRing: [number, number][] = [
      [32.0940, 36.4840],
      [32.0960, 36.4840],
      [32.0960, 36.4860],
      [32.0940, 36.4860],
      [32.0940, 36.4840],
    ];

    const insidePoint = { latitude: 36.4850, longitude: 32.0950 };
    const outsidePoint = { latitude: 36.4870, longitude: 32.0950 };

    expect(isPointInPolygon(insidePoint, squareRing)).toBe(true);
    expect(isPointInPolygon(outsidePoint, squareRing)).toBe(false);
  });

  it('verifyPlayZonePresence handles polygon inclusion and tolerance correctly', () => {
    const playZoneGeom: [number, number][] = [
      [32.0940, 36.4840],
      [32.0960, 36.4840],
      [32.0960, 36.4860],
      [32.0940, 36.4860],
      [32.0940, 36.4840],
    ];
    const center = { latitude: 36.4850, longitude: 32.0950 };

    // Point inside
    const inside = { latitude: 36.4850, longitude: 32.0950, accuracyMeters: 10 };
    expect(verifyPlayZonePresence(inside, playZoneGeom, center).valid).toBe(true);

    // Point outside polygon ring [36.4840 to 36.4860] but within 40m tolerance
    // polygon maxLat is 36.4860; 36.4862 is ~22m away from 36.4860
    const closeCenter = { latitude: 36.4860, longitude: 32.0950 };
    const closeBy = { latitude: 36.4862, longitude: 32.0950, accuracyMeters: 15 };
    expect(verifyPlayZonePresence(closeBy, playZoneGeom, closeCenter, 40).valid).toBe(true);

    // Far away point
    const farAway = { latitude: 36.4900, longitude: 32.0950, accuracyMeters: 10 };
    const farResult = verifyPlayZonePresence(farAway, playZoneGeom, center, 40);
    expect(farResult.valid).toBe(false);
    expect(farResult.reason).toBe('OUTSIDE_PLAY_ZONE');

    // Poor accuracy sample
    const badGps = { latitude: 36.4850, longitude: 32.0950, accuracyMeters: 75 };
    const badGpsResult = verifyPlayZonePresence(badGps, playZoneGeom, center, 40);
    expect(badGpsResult.valid).toBe(false);
    expect(badGpsResult.reason).toBe('LOCATION_UNRELIABLE');
  });

  it('isCoordInBBox filters correctly by bounding box', () => {
    const bbox = { minLat: 36.4800, maxLat: 36.4900, minLng: 32.0900, maxLng: 32.1000 };
    expect(isCoordInBBox({ latitude: 36.4850, longitude: 32.0950 }, bbox)).toBe(true);
    expect(isCoordInBBox({ latitude: 36.5000, longitude: 32.0950 }, bbox)).toBe(false);
  });
});
