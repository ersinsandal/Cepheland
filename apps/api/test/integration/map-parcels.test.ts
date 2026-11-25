import { describe, expect, it, vi } from 'vitest';
import request from 'supertest';
import { MapService, mapService } from '../../src/services/map.service.js';
import { OsmSourceError, type OsmTile } from '../../src/services/osm-source.js';
import { dbStore } from '../../src/db/store.js';
import { app } from '../../src/index.js';
import { isPointInPolygon, territoryIntersectsViewport, verifyPlayZonePresence } from '@cepheland/geo';
import { FrontNameRegistry, normalizeFrontName } from '../../src/services/front-name-registry.js';

const bbox = { minLng: 32.85, minLat: 39.91, maxLng: 32.863, maxLat: 39.923 };
const grid: OsmTile = { key: 'integration-road-grid', bbox, water: [], coastlines: [], roads: [] };
for (let i = 0; i <= 13; i++) {
  grid.roads.push({ id: `horizontal-${i}`, tags: { highway: 'residential', name: `Deneme Yatay ${i} Sokağı` }, coordinates: [
    [bbox.minLng, bbox.minLat + i * .001], [bbox.maxLng, bbox.minLat + i * .001],
  ] });
  grid.roads.push({ id: `vertical-${i}`, tags: { highway: 'residential', name: `Deneme Dikey ${i} Sokağı` }, coordinates: [
    [bbox.minLng + i * .001, bbox.minLat], [bbox.minLng + i * .001, bbox.maxLat],
  ] });
}

describe('Road parcel API integration', () => {
  it('keeps all pilot map markers and play-zone centers inside their parcels', () => {
    const pilots = [...dbStore.fronts.values()].filter(front => front.id.startsWith('f0000000-'));
    expect(pilots).toHaveLength(12);
    for (const front of pilots) {
      expect(isPointInPolygon(front.center, front.geometry), front.id).toBe(true);
      const zone = [...dbStore.playZones.values()].find(item => item.frontId === front.id)!;
      expect(zone).toBeDefined();
      expect(zone.center).toEqual(front.center);
      expect(isPointInPolygon(zone.center, zone.geometry), zone.id).toBe(true);
    }
  });

  it('keeps all 169 adjacent street blocks and preserves ownership across moves and seasons', async () => {
    const service = new MapService(async () => [grid], new FrontNameRegistry(null));
    const fronts = await service.getViewportFronts('road-test-season', bbox);
    expect(fronts.filter(f => f.source === 'osm_block')).toHaveLength(169);
    expect(new Set(fronts.map(f => f.id)).size).toBe(fronts.length);
    expect(new Set(fronts.map(f => normalizeFrontName(f.displayNameI18n.tr))).size).toBe(fronts.length);
    expect(fronts.every(f => !/^Bölge\s*#/.test(f.displayNameI18n.tr))).toBe(true);
    const owned = fronts[0];
    const state = dbStore.seasonFrontStates.get(`road-test-season:${owned.id}`)!;
    state.ownerTeamId = 'd0000000-0000-0000-0000-000000000001';
    state.status = 'owned';
    const moved = await service.getViewportFronts('road-test-season', { ...bbox, minLng: bbox.minLng + .0001 });
    expect(moved.find(f => f.id === owned.id)?.ownerTeamId).toBe(state.ownerTeamId);
    const anotherSeason = await service.getViewportFronts('road-other-season', bbox);
    expect(anotherSeason.find(f => f.id === owned.id)?.status).toBe('neutral');
    expect(dbStore.seasonFrontStates.get(`road-test-season:${owned.id}`)?.status).toBe('owned');
    expect(anotherSeason.every(f => f.geometryRings?.length && f.weight === 1)).toBe(true);
  }, 30_000);

  it('enriches names without changing geometry, front IDs, ownership or participation IDs', async () => {
    const area = { minLng: 32.86, maxLng: 32.862, minLat: 39.92, maxLat: 39.922 };
    const tile: OsmTile = { key: 'name-enrichment-test', bbox: area, water: [], coastlines: [], places: [], roads: [{
      id: 'way/987', tags: { highway: 'residential', name: 'Test Sokağı' },
      coordinates: [[32.86, 39.92], [32.862, 39.92], [32.862, 39.922], [32.86, 39.922], [32.86, 39.92]],
    }] };
    const registry = new FrontNameRegistry(null);
    const service = new MapService(async () => [tile], registry);
    const before = (await service.getViewportFronts('name-season', area)).find(f => f.source === 'osm_block')!;
    const state = dbStore.seasonFrontStates.get(`name-season:${before.id}`)!;
    state.status = 'owned'; state.ownerTeamId = 'd0000000-0000-0000-0000-000000000001';
    const zonesBefore = service.getFrontDetails(before.id, 'name-season')!.playZones.map(p => p.id);
    tile.places = [{ id: 'node/987', geometry: { type: 'Point', coordinates: [32.861, 39.921] }, tags: { name: 'Test Kitabevi', shop: 'books' } }];
    const after = (await service.getViewportFronts('name-season', area)).find(f => f.id === before.id)!;
    expect(after.displayNameI18n.tr).toContain('Test Kitabevi');
    expect(after.naming?.source).toBe('poi');
    expect(after.naming?.osmIds).toContain('node/987');
    expect(after.geometryRings).toEqual(before.geometryRings);
    expect(after.ownerTeamId).toBe(state.ownerTeamId);
    expect(service.getFrontDetails(after.id, 'name-season')!.playZones.map(p => p.id)).toEqual(zonesBefore);
    tile.places = [];
    const outage = (await service.getViewportFronts('name-season', area)).find(f => f.id === before.id)!;
    expect(outage.displayNameI18n).toEqual(after.displayNameI18n);
  }, 30_000);

  it('exposes real pilot names on front and battle details before viewport loading', async () => {
    const frontId = 'f0000000-0000-0000-0000-000000000003';
    const details = await request(app).get(`/fronts/${frontId}`);
    const battle = await request(app).get('/battles/bb000000-0000-0000-0000-000000000001');
    expect(details.status).toBe(200);
    expect(details.body.naming?.osmIds.length).toBeGreaterThan(0);
    expect(details.body.displayNameI18n.tr).not.toMatch(/^Bölge\s*#/);
    expect(battle.body.frontNameI18n).toEqual(details.body.displayNameI18n);
  });

  it('includes parcels crossing the viewport even when their center is outside', () => {
    expect(territoryIntersectsViewport({ geometry: [[0, 0], [2, 0], [2, 2], [0, 2], [0, 0]] },
      { minLat: .1, maxLat: .2, minLng: .1, maxLng: .2 })).toBe(true);
  });

  it('rejects lake holes even within the play-zone center tolerance', () => {
    const outer: [number, number][] = [[0, 0], [.002, 0], [.002, .002], [0, .002], [0, 0]];
    const hole: [number, number][] = [[.0009, .0009], [.0011, .0009], [.0011, .0011], [.0009, .0011], [.0009, .0009]];
    const center = { latitude: .001, longitude: .001 };
    expect(verifyPlayZonePresence(center, outer, center, 40, [hole]).valid).toBe(false);
  });

  it('rejects malformed/partial bounds instead of silently serving seed fronts', async () => {
    for (const query of ['minLat=40', 'minLat=no&maxLat=41&minLng=29&maxLng=30', 'minLat=40junk&maxLat=41&minLng=29&maxLng=30']) {
      const res = await request(app).get('/maps/viewport?' + query);
      expect(res.status).toBe(400);
      expect(res.body.code).toBe('INVALID_VIEWPORT');
    }
  });

  it('reports unavailable road data instead of returning invented random urban parcels', async () => {
    const stub = vi.spyOn(mapService, 'getViewportFronts').mockRejectedValueOnce(
      new OsmSourceError('OSM_UNAVAILABLE', 'Yol verisi alınamadı.', 503),
    );
    try {
      const res = await request(app).get('/maps/viewport?minLat=40&maxLat=40.001&minLng=29&maxLng=29.001');
      expect(res.status).toBe(503);
      expect(res.body.code).toBe('OSM_UNAVAILABLE');
      expect(res.body.fronts).toBeUndefined();
    } finally { stub.mockRestore(); }
  });
});
