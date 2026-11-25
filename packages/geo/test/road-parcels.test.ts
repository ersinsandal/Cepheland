import { describe, expect, it } from 'vitest';
import { area, bboxPolygon, booleanPointInPolygon, featureCollection, intersect, polygon, union } from '@turf/turf';
import { partitionRoadTile, type RoadCoordinate, type RoadParcel, type RoadTileInput, type RoadWay } from '../src/road-parcels.js';

const base = { minLng: 32.48, maxLng: 32.484, minLat: 37.87, maxLat: 37.874 };
const input = (extra: Partial<RoadTileInput> = {}): RoadTileInput => ({ key: 'test', bbox: base, roads: [], ...extra });
const boxRoad: RoadWay = {
  id: 1, tags: { highway: 'residential', width: '8' },
  coordinates: [[32.481, 37.871], [32.483, 37.871], [32.483, 37.873], [32.481, 37.873], [32.481, 37.871]],
};
const shape = (parcel: RoadParcel) => polygon(parcel.geometryRings);
const hasPoint = (parcels: RoadParcel[], p: RoadCoordinate) => parcels.some(parcel => booleanPointInPolygon(p, shape(parcel)));
const allArea = (parcels: RoadParcel[]) => parcels.reduce((sum, parcel) => sum + area(shape(parcel)), 0);

describe('Road parcel geometry', () => {
  it('fills roadless land with deterministic irregular parcels without overlaps or gaps', () => {
    const first = partitionRoadTile(input());
    expect(first.length).toBeGreaterThan(3);
    expect(first.every(p => p.source === 'open_land')).toBe(true);
    expect(partitionRoadTile(input())).toEqual(first);
    const joined = union(featureCollection(first.map(shape)))!;
    const expectedArea = area(bboxPolygon([base.minLng, base.minLat, base.maxLng, base.maxLat]));
    expect(Math.abs(allArea(first) - area(joined))).toBeLessThan(0.1);
    expect(Math.abs(area(joined) - expectedArea)).toBeLessThan(0.1);
    expect(new Set(first.map(p => p.id)).size).toBe(first.length);
    for (const parcel of first) {
      expect(booleanPointInPolygon([parcel.center.longitude, parcel.center.latitude], shape(parcel), { ignoreBoundary: true })).toBe(true);
    }
  });

  it('keeps the bends of a real street block and cuts out road corridors', () => {
    const bent: RoadWay = { ...boxRoad, coordinates: [
      [32.481, 37.871], [32.483, 37.871], [32.483, 37.872], [32.4825, 37.873], [32.481, 37.873], [32.481, 37.871],
    ] };
    const parcels = partitionRoadTile(input({ roads: [bent] }));
    const blocks = parcels.filter(p => p.source === 'osm_block');
    expect(blocks).toHaveLength(1);
    expect(hasPoint(blocks, [32.482, 37.872])).toBe(true);
    expect(hasPoint(blocks, [32.4829, 37.8729])).toBe(false);
    expect(hasPoint(parcels, [32.482, 37.871])).toBe(false);
    expect(hasPoint(parcels, [32.48275, 37.8725])).toBe(false);
    expect(blocks[0].geometry.length).toBeGreaterThan(5);
  });

  it('nodes crossings and shared middle nodes before polygonizing', () => {
    const divider: RoadWay = { id: 2, coordinates: [[32.4805, 37.872], [32.4835, 37.872]] };
    const parcels = partitionRoadTile(input({ roads: [boxRoad, divider] }));
    expect(parcels.filter(p => p.source === 'osm_block')).toHaveLength(2);
    expect(hasPoint(parcels, [32.482, 37.872])).toBe(false);
  });

  it('preserves a lake hole and does not put parcel centers inside the lake', () => {
    const lake = polygon([[[32.4818, 37.8718], [32.4822, 37.8718], [32.4822, 37.8722], [32.4818, 37.8722], [32.4818, 37.8718]]]);
    const parcels = partitionRoadTile(input({ roads: [boxRoad], water: [lake.geometry] }));
    const blocks = parcels.filter(p => p.source === 'osm_block');
    expect(blocks).toHaveLength(1);
    expect(blocks[0].geometryRings).toHaveLength(2);
    expect(hasPoint(parcels, [32.482, 37.872])).toBe(false);
    for (const parcel of parcels) {
      expect(intersect(featureCollection([shape(parcel), lake]))).toBeNull();
      expect(booleanPointInPolygon([parcel.center.longitude, parcel.center.latitude], lake)).toBe(false);
    }
  });

  it('uses coastline direction to exclude the sea even through the middle of a tile', () => {
    // West-to-east coast: north (left) is land, south is sea.
    const parcels = partitionRoadTile(input({ coastlines: [[[32.47, 37.872], [32.50, 37.872]]] }));
    expect(parcels.length).toBeGreaterThan(0);
    expect(hasPoint(parcels, [32.482, 37.871])).toBe(false);
    expect(hasPoint(parcels, [32.482, 37.873])).toBe(true);
    for (const parcel of parcels) expect(Math.min(...parcel.geometry.map(p => p[1]))).toBeGreaterThanOrEqual(37.872 - 1e-8);
  });

  it('keeps a closed urban block whole and identical across neighboring tiles', () => {
    const left = partitionRoadTile(input({ bbox: { ...base, maxLng: 32.482 }, roads: [boxRoad] }));
    const right = partitionRoadTile(input({ key: 'neighbor', bbox: { ...base, minLng: 32.482 }, roads: [boxRoad] }));
    const leftBlock = left.find(p => p.source === 'osm_block')!;
    const rightBlock = right.find(p => p.source === 'osm_block')!;
    expect(leftBlock.id).toBe(rightBlock.id);
    expect(leftBlock.geometryRings).toEqual(rightBlock.geometryRings);
    expect(Math.max(...leftBlock.geometry.map(p => p[0]))).toBeGreaterThan(32.482);
  });

  it('does not erase small adjacent street blocks or stop at 140 parcels', () => {
    const roads: RoadWay[] = [];
    for (let i = 0; i <= 13; i++) {
      const offset = i * 0.00075;
      roads.push({ id: `h${i}`, coordinates: [[32.48, 37.87 + offset], [32.48975, 37.87 + offset]] });
      roads.push({ id: `v${i}`, coordinates: [[32.48 + offset, 37.87], [32.48 + offset, 37.87975]] });
    }
    const parcels = partitionRoadTile(input({ roads, bbox: { minLng: 32.4799, maxLng: 32.4899, minLat: 37.8699, maxLat: 37.8799 } }));
    expect(parcels.filter(p => p.source === 'osm_block')).toHaveLength(169);
    expect(parcels.length).toBeGreaterThan(140);
  }, 30_000);

  it('retains a dead-end as a road cutout and excludes reserved pilot geometry', () => {
    const deadEnd: RoadWay = { id: 2, coordinates: [[32.481, 37.872], [32.482, 37.872]] };
    const reserved = bboxPolygon([32.4802, 37.8702, 32.4806, 37.8706]);
    const parcels = partitionRoadTile(input({ roads: [boxRoad, deadEnd], reserved: [reserved.geometry] }));
    expect(hasPoint(parcels, [32.4815, 37.872])).toBe(false);
    expect(hasPoint(parcels, [32.4804, 37.8704])).toBe(false);
  });
});
