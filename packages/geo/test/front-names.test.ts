import { describe, expect, it } from 'vitest';
import { createFrontNameResolver, getFrontNameCandidates, type NameableFront, type NamedMapPlace } from '../src/front-names.js';
import type { RoadWay } from '../src/road-parcels.js';

const front: NameableFront = {
  id: 'parcel-one', center: { longitude: 29.0285, latitude: 40.9835 },
  geometry: [[29.028, 40.983], [29.029, 40.983], [29.029, 40.984], [29.028, 40.984], [29.028, 40.983]],
};
const street: RoadWay = {
  id: 'way/1', tags: { name: 'Cem Sokak', highway: 'residential' },
  coordinates: [[29.0278, 40.98296], [29.0292, 40.98296]],
};
const crossStreet: RoadWay = {
  id: 'way/2', tags: { name: 'Moda Caddesi', highway: 'residential' },
  coordinates: [[29.02795, 40.9828], [29.02795, 40.9842]],
};
const cafe: NamedMapPlace = {
  id: 'node/100', tags: { name: 'Örnek Kahve', amenity: 'cafe' },
  geometry: { type: 'Point', coordinates: [29.0284, 40.9834] },
};

describe('Real place front name candidates', () => {
  it('combines an interior business with a bordering street without changing front identity or geometry', () => {
    const snapshot = JSON.stringify(front);
    const result = getFrontNameCandidates(front, { roads: [street], places: [cafe] });
    expect(result.source).toBe('poi');
    expect(result.baseName).toBe('Örnek Kahve · Cem Sokak');
    expect(result.streetName).toBe('Cem Sokak');
    expect(result.osmIds).toContain('node/100');
    expect(JSON.stringify(front)).toBe(snapshot);
  });

  it('never uses a point business across the street, on the boundary, or inside a parcel hole', () => {
    const hole: [number, number][] = [[29.0283, 40.9833], [29.0286, 40.9833], [29.0286, 40.9836], [29.0283, 40.9836], [29.0283, 40.9833]];
    const places: NamedMapPlace[] = [
      cafe,
      { ...cafe, id: 'node/101', tags: { amenity: 'restaurant', name: 'Karşıdaki Restoran', wikidata: 'Q1' }, geometry: { type: 'Point', coordinates: [29.0285, 40.9829] } },
      { ...cafe, id: 'node/102', geometry: { type: 'Point', coordinates: [29.028, 40.9834] } },
    ];
    const result = getFrontNameCandidates({ ...front, geometryRings: [front.geometry, hole] }, { roads: [street], places });
    expect(result.source).toBe('street');
    expect(result.osmIds).not.toEqual(expect.arrayContaining(['node/100', 'node/101', 'node/102']));
    expect(result.candidates.join(' ')).not.toMatch(/Kahve|Restoran/);
  });

  it('requires at least half a polygon landmark to belong to this parcel', () => {
    const school: NamedMapPlace = {
      id: 'way/10', tags: { name: 'Örnek Okulu', amenity: 'school' },
      geometry: { type: 'Polygon', coordinates: [[[29.0282, 40.9832], [29.0288, 40.9832], [29.0288, 40.9838], [29.0282, 40.9838], [29.0282, 40.9832]]] },
    };
    const hugePark: NamedMapPlace = {
      id: 'relation/9', tags: { name: 'Büyük Park', leisure: 'park', wikidata: 'Q2' },
      geometry: { type: 'Polygon', coordinates: [[[29.02, 40.98], [29.04, 40.98], [29.04, 41], [29.02, 41], [29.02, 40.98]]] },
    };
    const result = getFrontNameCandidates(front, { roads: [street], places: [hugePark, school] });
    expect(result.baseName).toBe('Örnek Okulu · Cem Sokak');
    expect(result.osmIds).toContain('way/10');
    expect(result.osmIds).not.toContain('relation/9');
  });

  it('uses the actual bordering street pair and rejects a distant named road', () => {
    const far: RoadWay = { ...street, id: 'way/8', tags: { name: 'Uzak Bulvar' }, coordinates: [[29.02, 40.98], [29.04, 40.98]] };
    const result = getFrontNameCandidates(front, { roads: [street, crossStreet, far] });
    expect(result.source).toBe('street');
    expect(result.baseName).toContain('Cem Sokak');
    expect(result.baseName).toContain('Moda Caddesi');
    expect(result.candidates.join(' ')).not.toContain('Uzak');
    expect(result.osmIds).not.toContain('way/8');
  });

  it('keeps curved street frontage instead of choosing a road from its center alone', () => {
    const curved: RoadWay = {
      id: 'way/6', tags: { name: 'Kıvrımlı Sokak' },
      coordinates: [[29.02795, 40.98295], [29.02905, 40.98295], [29.02905, 40.98405]],
    };
    const result = getFrontNameCandidates(front, { roads: [curved, crossStreet] });
    expect(result.streetName).toBe('Kıvrımlı Sokak');
  });

  it('has stable candidates regardless of OSM order and preserves real Unicode names', () => {
    const name = '  İncir\n  Ağacı  Cafe\u0301  ';
    const realCafe = { ...cafe, tags: { amenity: 'cafe', name } };
    const sibling = { ...cafe, id: 'node/200', geometry: { type: 'Point' as const, coordinates: [29.0286, 40.9836] } };
    const a = createFrontNameResolver({ roads: [street, crossStreet], places: [realCafe, sibling] })(front);
    const b = createFrontNameResolver({ roads: [crossStreet, street], places: [sibling, realCafe] })(front);
    expect(a).toEqual(b);
    expect(a.baseName).toContain('İncir Ağacı Café');
    expect(a.baseName).not.toContain('\n');
  });

  it('uses only a real nearby locality when there is no named road or interior business', () => {
    const locality: NamedMapPlace = { id: 'node/300', tags: { name: 'Caferağa', place: 'neighbourhood' }, geometry: { type: 'Point', coordinates: [29.028, 40.985] } };
    const result = getFrontNameCandidates(front, { roads: [], places: [locality] });
    expect(result.baseName).toBe('Caferağa çevresi');
    expect(result.locality).toBe('Caferağa');
    expect(result.source).toBe('locality');
  });

  it('states that land is unnamed instead of inventing a business or using a faraway locality', () => {
    const distant: NamedMapPlace = { id: 'node/400', tags: { name: 'Uzak Köy', place: 'village' }, geometry: { type: 'Point', coordinates: [30, 41] } };
    const result = getFrontNameCandidates(front, { roads: [], places: [distant] });
    expect(result.source).toBe('coordinate');
    expect(result.baseName).toBe('Adsız arazi · 40.98350, 29.02850');
    expect(result.osmIds).toEqual([]);
  });

  it('locates unnamed land using a road within 250 meters without claiming it borders the parcel', () => {
    const nearby: RoadWay = { id: 'way/501', tags: { name: 'Yakın Yol' }, coordinates: [[29.028, 40.982], [29.029, 40.982]] };
    const farther: RoadWay = { id: 'way/502', tags: { name: 'Daha Uzak Yol' }, coordinates: [[29.028, 40.9815], [29.029, 40.9815]] };
    const a = getFrontNameCandidates(front, { roads: [farther, nearby] });
    const b = getFrontNameCandidates(front, { roads: [nearby, farther] });
    expect(a.baseName).toBe('Yakın Yol çevresi');
    expect(a.source).toBe('locality');
    expect(a.streetName).toBeNull();
    expect(a.osmIds).toEqual(['way/501']);
    expect(a).toEqual(b);

    const locality: NamedMapPlace = { id: 'node/300', tags: { name: 'Caferağa', place: 'neighbourhood' }, geometry: { type: 'Point', coordinates: [29.028, 40.985] } };
    const withLocality = getFrontNameCandidates(front, { roads: [nearby], places: [locality] });
    expect(withLocality.baseName).toBe('Caferağa çevresi');
    expect(withLocality.osmIds).toEqual(['node/300']);
  });

  it('does not use a road beyond 250 meters as the unnamed-land fallback', () => {
    const far: RoadWay = { id: 'way/503', tags: { name: 'Uzak Yol' }, coordinates: [[29.028, 40.98], [29.029, 40.98]] };
    const result = getFrontNameCandidates(front, { roads: [far] });
    expect(result.source).toBe('coordinate');
    expect(result.osmIds).toEqual([]);
    expect(result.streetName).toBeNull();
  });
});
