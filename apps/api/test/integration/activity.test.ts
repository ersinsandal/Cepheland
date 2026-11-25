import { describe, expect, it } from 'vitest';
import request from 'supertest';
import { app } from '../../src/index.js';
import { dbStore, type BattleContributionRecord } from '../../src/db/store.js';

describe('Personal activity endpoint', () => {
  it('requires a valid login before returning contribution history', async () => {
    expect((await request(app).get('/me/activity')).status).toBe(401);
    expect((await request(app).get('/me/activity').set('Authorization', 'Bearer invalid')).status).toBe(401);
  });

  it('returns only the authenticated user and selected season, with current names and a distinct daily quota', async () => {
    const login = await request(app).post('/auth/verify').send({ identifier: 'activity_scope_test@cepheland.example', code: '123456' });
    expect(login.status).toBe(200);
    const userId = login.body.user.id as string;
    const seasonId = 'activity-scope-season';
    const frontId = 'f0000000-0000-0000-0000-000000000003';
    const otherFrontId = 'f0000000-0000-0000-0000-000000000004';
    const today = new Date(); today.setHours(12, 0, 0, 0);
    const yesterday = new Date(today); yesterday.setDate(today.getDate() - 1);
    const ids: string[] = [];
    const add = (id: string, overrides: Partial<BattleContributionRecord> = {}) => {
      ids.push(id);
      dbStore.battleContributions.set(id, {
        id, userId, seasonId, frontId, battleId: 'activity-test-battle', teamId: 'activity-test-team',
        challengeId: `challenge-${id}`, idempotencyKey: `idem-${id}`, status: 'approved',
        decisionCode: 'APPROVED', submittedAt: today, approvedAt: today, ...overrides,
      });
    };
    try {
      add('activity-own-first');
      add('activity-own-second', { submittedAt: new Date(today.getTime() + 60_000) });
      add('activity-own-yesterday', { frontId: otherFrontId, submittedAt: yesterday });
      add('activity-other-user', { userId: 'another-private-user', frontId: otherFrontId });
      add('activity-other-season', { seasonId: 'another-season', frontId: otherFrontId });
      const response = await request(app).get('/me/activity')
        .set('Authorization', `Bearer ${login.body.accessToken}`)
        .query({ season_id: seasonId, user_id: 'another-private-user' });
      expect(response.status).toBe(200);
      expect(response.body.claims.map((claim: { id: string }) => claim.id)).toEqual([
        'activity-own-second', 'activity-own-first', 'activity-own-yesterday',
      ]);
      expect(response.body.claims[0].frontNameI18n).toEqual(dbStore.fronts.get(frontId)!.displayNameI18n);
      expect(response.body.remainingDailyFronts).toBe(2);
      expect(response.body.dailyLimit).toBe(3);
      expect(response.body.claims.every((claim: Record<string, unknown>) => !('userId' in claim) && !('idempotencyKey' in claim))).toBe(true);
      const otherSeason = await request(app).get('/me/activity')
        .set('Authorization', `Bearer ${login.body.accessToken}`).query({ season_id: 'another-season' });
      expect(otherSeason.body.claims.map((claim: { id: string }) => claim.id)).toEqual(['activity-other-season']);
    } finally {
      for (const id of ids) dbStore.battleContributions.delete(id);
      dbStore.users.delete(userId);
    }
  });
});
