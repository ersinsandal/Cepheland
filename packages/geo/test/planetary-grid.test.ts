import { describe, expect, it } from 'vitest';
import {
  resolveWorldHierarchy,
  computeFrontAtCell,
  partitionViewport,
  getFrontForCoordinate,
  generateDeterministicUuid,
  LAT_STEP,
  getLngStep,
  haversineDistanceMeters,
} from '../src/index.js';

describe('Planetary Grid & Global Front Partitioning Engine', () => {
  it('generates consistent, deterministic UUIDs for identical front codes', () => {
    const code = 'TR-ANT-ALN-MHM-001';
    const id1 = generateDeterministicUuid(code);
    const id2 = generateDeterministicUuid(code);
    expect(id1).toBe(id2);
    expect(id1).toMatch(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i);
  });

  it('correctly resolves real-world hierarchy across global metropolises', () => {
    // Alanya Mahmutlar
    const alanya = resolveWorldHierarchy(36.485, 32.095);
    expect(alanya.countryCode).toBe('TR');
    expect(alanya.districtCode).toBe('ALN');
    expect(alanya.neighborhoodCode).toBe('MHM');
    expect(alanya.neighborhoodName.tr).toBe('Mahmutlar');

    // Istanbul Kadikoy Moda
    const kadikoy = resolveWorldHierarchy(40.983, 29.03);
    expect(kadikoy.countryCode).toBe('TR');
    expect(kadikoy.districtCode).toBe('KAD');
    expect(kadikoy.neighborhoodCode).toBe('MOD');
    expect(kadikoy.neighborhoodName.tr).toContain('Moda');

    // New York Manhattan Times Square
    const manhattan = resolveWorldHierarchy(40.755, -73.985);
    expect(manhattan.countryCode).toBe('US');
    expect(manhattan.districtCode).toBe('MAN');
    expect(manhattan.neighborhoodCode).toBe('MID');

    // London Soho
    const london = resolveWorldHierarchy(51.513, -0.133);
    expect(london.countryCode).toBe('GB');
    expect(london.districtCode).toBe('WES');
    expect(london.neighborhoodCode).toBe('SOH');

    // Tokyo Shibuya
    const tokyo = resolveWorldHierarchy(35.659, 139.701);
    expect(tokyo.countryCode).toBe('JP');
    expect(tokyo.districtCode).toBe('SHI');
    expect(tokyo.neighborhoodCode).toBe('CRX');
  });

  it('computes valid, closed, non-overlapping polygonal front with real street names', () => {
    // Coordinate in Kadikoy Moda
    const point = { latitude: 40.983, longitude: 29.03 };
    const front = getFrontForCoordinate(point);

    expect(front.id).toBeDefined();
    expect(front.frontCode).toMatch(/^TR-KAD-MOD-\d{3}$/);
    expect(front.geometry.length).toBe(5); // Closed polygon: 4 corners + closing vertex
    expect(front.geometry[0]).toEqual(front.geometry[4]); // First vertex equals last

    // Verify area is realistic for a city block (2,500m2 to 40,000m2)
    expect(front.areaM2).toBeGreaterThan(2500);
    expect(front.areaM2).toBeLessThan(45000);

    // Verify weight is assigned based on arterial/collector/residential
    expect([1.0, 1.2, 2.5, 5.0]).toContain(front.weight);

    // Safe access point must be inside or right at the front boundary
    const distToCenter = haversineDistanceMeters(front.center, front.safeAccessPoint);
    expect(distToCenter).toBeLessThan(150);
  });

  it('partitions arbitrary global viewports into discrete fronts', () => {
    // Viewport over Central Manhattan
    const bbox = {
      minLat: 40.75,
      maxLat: 40.76,
      minLng: -73.99,
      maxLng: -73.98,
    };

    const fronts = partitionViewport(bbox, 50);
    expect(fronts.length).toBeGreaterThan(5);
    expect(fronts.length).toBeLessThanOrEqual(50);

    // Check all fronts have valid Manhattan hierarchy
    for (const f of fronts) {
      expect(f.hierarchy.countryCode).toBe('US');
      expect(f.hierarchy.districtCode).toBe('MAN');
      expect(f.geometry.length).toBe(5);
      expect(f.weight).toBeGreaterThanOrEqual(1.0);
    }
  });

  it('handles universal coordinates outside pre-mapped neighborhoods (e.g. Pacific ocean or rural Anatolia)', () => {
    // High Anatolian rural plateau
    const rural = getFrontForCoordinate({ latitude: 38.5, longitude: 34.5 });
    expect(rural.hierarchy.countryCode).toBe('TR');
    expect(rural.frontCode).toContain('TR');

    // Open sea
    const ocean = getFrontForCoordinate({ latitude: 10.0, longitude: -140.0 });
    expect(ocean.hierarchy.countryCode).toBe('GL');
    expect(ocean.geometry.length).toBe(5);
  });
});
