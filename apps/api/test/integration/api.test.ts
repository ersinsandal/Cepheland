import { describe, expect, it, vi } from 'vitest';
import request from 'supertest';
import { app } from '../../src/index.js';
import { dbStore } from '../../src/db/store.js';

// Keep integration tests independent of public Overpass availability. Exercise
// the real geometry pipeline using a deterministic road network at Manhattan.
vi.mock('../../src/services/osm-source.js', async (importOriginal) => {
  const actual = await importOriginal<typeof import('../../src/services/osm-source.js')>();
  return { ...actual, loadTilesForViewport: async () => {
    const roads = [];
    for (let i = 0; i <= 5; i++) {
      roads.push({ id: `avenue-${i}`, tags: { highway: 'residential' }, coordinates: [
        [-73.99 + i * .002, 40.75], [-73.99 + i * .002, 40.76],
      ] });
      roads.push({ id: `street-${i}`, tags: { highway: 'residential' }, coordinates: [
        [-73.99, 40.75 + i * .002], [-73.98, 40.75 + i * .002],
      ] });
    }
    return [{ key: 'manhattan-test-roads', bbox: { minLat: 40.75, maxLat: 40.76, minLng: -73.99, maxLng: -73.98 }, roads, water: [], coastlines: [] }];
  } };
});

describe('API Integration Tests (G01 - G16 Core Verification)', () => {
  it('GET /health/public returns ok', async () => {
    const res = await request(app).get('/health/public');
    expect(res.status).toBe(200);
    expect(res.body.status).toBe('ok');
    expect(res.body.app).toBe('Cepheland API');
  });

  it('G01/G02: Two independent leagues exist with independent teams & front states', async () => {
    const res = await request(app).get('/leagues');
    expect(res.status).toBe(200);
    expect(res.body.length).toBeGreaterThanOrEqual(2);

    const football = res.body.find((l: any) => l.slug === 'football-demo');
    const gaming = res.body.find((l: any) => l.slug === 'gaming-demo');

    expect(football).toBeDefined();
    expect(gaming).toBeDefined();

    expect(football.teams.length).toBe(3);
    expect(gaming.teams.length).toBe(3);
  });

  it('GET /maps/viewport returns the 12 Alanya Mahmutlar fronts', async () => {
    const res = await request(app).get('/maps/viewport');
    expect(res.status).toBe(200);
    expect(res.body.fronts.length).toBe(12);

    const kumru03 = res.body.fronts.find((f: any) => f.frontCode === 'ALN-MHM-KUM-003');
    expect(kumru03).toBeDefined();
    expect(kumru03.status).toBe('contested');
    expect(kumru03.activeBattleId).toBeDefined();
  });

  it('Auth Flow: /auth/start -> /auth/verify returns valid access token', async () => {
    const startRes = await request(app).post('/auth/start').send({
      identifier: 'test_player_1@cepheland.example',
      channel: 'email',
    });
    expect(startRes.status).toBe(200);

    const verifyRes = await request(app).post('/auth/verify').send({
      identifier: 'test_player_1@cepheland.example',
      code: '123456',
    });
    expect(verifyRes.status).toBe(200);
    expect(verifyRes.body.accessToken).toBeDefined();
    expect(verifyRes.body.user.handle).toBeDefined();
  });

  it('G03/G04 & Claim Flow: Challenge -> Submit Claim with location proof', async () => {
    // 1. Login user
    const loginRes = await request(app).post('/auth/verify').send({
      identifier: 'ahmet_gs',
      code: '123456',
    });
    const token = loginRes.body.accessToken;

    const seasonId = 'e0000000-0000-0000-0000-000000000001';
    const kumru03Id = 'f0000000-0000-0000-0000-000000000003';
    const location = dbStore.fronts.get(kumru03Id)!.center;

    // 2. Challenge
    const challengeRes = await request(app)
      .post('/claims/challenge')
      .set('Authorization', `Bearer ${token}`)
      .send({
        seasonId,
        frontId: kumru03Id,
        action: 'join_battle',
      });
    expect(challengeRes.status).toBe(200);
    expect(challengeRes.body.challengeId).toBeDefined();
    expect(challengeRes.body.nonce).toBeDefined();

    const challengeId = challengeRes.body.challengeId;
    const idempotencyKey = crypto.randomUUID();

    // 3. Submit Claim with safe play zone coordinates
    const claimRes = await request(app)
      .post('/claims')
      .set('Authorization', `Bearer ${token}`)
      .send({
        challengeId,
        idempotencyKey,
        locationSamples: [
          {
            ...location,
            accuracyMeters: 12.0,
            recordedAt: new Date().toISOString(),
          },
        ],
        integrity: { platform: 'web' },
      });

    expect([201, 202]).toContain(claimRes.status);
    expect(claimRes.body.claimId).toBeDefined();
    expect(claimRes.body.status).toBe('approved');

    // 4. Test Idempotency with exact same key -> Returns same receipt!
    const replayRes = await request(app)
      .post('/claims')
      .set('Authorization', `Bearer ${token}`)
      .send({
        challengeId,
        idempotencyKey,
        locationSamples: [{ ...location, accuracyMeters: 12.0, recordedAt: new Date().toISOString() }],
        integrity: { platform: 'web' },
      });
    expect([200, 201, 202]).toContain(replayRes.status);
    expect(replayRes.body.claimId).toBe(claimRes.body.claimId);
  });

  it('G15/G16: GET /rankings accurately calculates the three simultaneous metrics', async () => {
    const res = await request(app)
      .get('/rankings')
      .query({
        season_id: 'e0000000-0000-0000-0000-000000000001',
        region_id: 'a0000000-0000-0000-0000-000000000003',
      });

    expect(res.status).toBe(200);
    expect(res.body.teams.length).toBe(3);

    const gs = res.body.teams.find((t: any) => t.slug === 'galatasaray');
    const fb = res.body.teams.find((t: any) => t.slug === 'fenerbahce');

    expect(gs).toBeDefined();
    expect(fb).toBeDefined();

    // GS has 8 fronts, FB has 2 fronts (Front Majority: GS)
    expect(gs.frontCount).toBe(8);
    expect(fb.frontCount).toBe(2);

    // FB has 160 verified support voters vs GS 81 (80 initial seed + 1 from Ahmet Kaya's claim above)
    expect(fb.verifiedSupportCount).toBe(160);
    expect(gs.verifiedSupportCount).toBe(81);
    expect(fb.verifiedSupportSharePercent).toBeGreaterThan(gs.verifiedSupportSharePercent);

    // FB has 10.0 weighted score vs GS 9.6 (Weighted Control: FB)
    expect(fb.weightedControlScore).toBe(10.0);
    expect(gs.weightedControlScore).toBe(9.6);
    expect(fb.weightedControlScore).toBeGreaterThan(gs.weightedControlScore);
  });

  it('Admin Battle Settlement & Front Protection Flow', async () => {
    const loginRes = await request(app).post('/auth/verify').send({
      identifier: 'admin',
      code: '123456',
    });
    const adminToken = loginRes.body.accessToken;

    const battleId = 'bb000000-0000-0000-0000-000000000001'; // Kumru 03 battle (FB 15 vs GS 12+1)
    const settleRes = await request(app)
      .post(`/admin/battles/${battleId}/settle`)
      .set('Authorization', `Bearer ${adminToken}`)
      .send();

    expect(settleRes.status).toBe(200);
    expect(settleRes.body.winnerTeamId).toBeDefined();
    // FB had 15 approved unique players, GS had 13 -> FB won the attack!
    expect(settleRes.body.outcome).toBe('capture');
    expect(settleRes.body.ownerChanged).toBe(true);

    // Verify Kumru 03 front state now has protection
    const frontRes = await request(app).get('/fronts/f0000000-0000-0000-0000-000000000003');
    expect(frontRes.status).toBe(200);
    expect(frontRes.body.status).toBe('protected');
    expect(frontRes.body.protectionUntil).toBeDefined();
  });

  it('Global Planetary Coverage: /maps/regions, /maps/search, and viewport partitioning in New York Manhattan', async () => {
    // 1. Regions catalog
    const regionsRes = await request(app).get('/maps/regions');
    expect(regionsRes.status).toBe(200);
    expect(regionsRes.body.length).toBeGreaterThanOrEqual(10);
    const manhattan = regionsRes.body.find((r: any) => r.code === 'MID');
    expect(manhattan).toBeDefined();
    expect(manhattan.country.code).toBe('US');

    // 2. Search location
    const searchRes = await request(app).get('/maps/search?q=moda');
    expect(searchRes.status).toBe(200);
    expect(searchRes.body.length).toBeGreaterThan(0);
    expect(searchRes.body[0].title).toContain('Moda');

    // 3. Dynamic viewport partitioning in Manhattan
    const nycViewport = await request(app).get(
      '/maps/viewport?minLat=40.75&maxLat=40.76&minLng=-73.99&maxLng=-73.98'
    );
    expect(nycViewport.status).toBe(200);
    expect(nycViewport.body.fronts.length).toBeGreaterThan(5);

    const firstNycFront = nycViewport.body.fronts[0];
    expect(firstNycFront.frontCode).toMatch(/^RP-/);
    expect(firstNycFront.geometry.length).toBeGreaterThanOrEqual(4);
    expect(nycViewport.body.fronts.filter((f: any) => f.source === 'osm_block')).toHaveLength(25);
    expect(firstNycFront.geometryRings[0]).toEqual(firstNycFront.geometry);
    expect(firstNycFront.status).toBe('neutral');
  });
});
