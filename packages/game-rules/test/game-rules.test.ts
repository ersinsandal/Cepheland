import { describe, expect, it } from 'vitest';
import {
  determineBattleResult,
  winnerOfBattle,
  calculateThreeMetrics,
  canStartAttack,
  validateDailyContributionLimit,
  isAccountAgeEligible,
  clampWeight,
} from '../src/index.js';

describe('Deterministic Game Rules & Acceptance Scenarios (G05 - G16)', () => {
  it('G05: 3 attackers, 2 defenders -> Attacker wins', () => {
    const result = determineBattleResult({
      kind: 'attack',
      defendingTeamId: 'GS',
      attackingTeamId: 'FB',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 2 },
        { teamId: 'FB', approvedUniquePlayers: 3 },
      ],
    });
    expect(result.winnerTeamId).toBe('FB');
    expect(result.outcome).toBe('capture');
    expect(result.minThresholdMet).toBe(true);
  });

  it('G06: 2 attackers, 0 defenders -> min 3 threshold not met, defender retains front', () => {
    const result = determineBattleResult({
      kind: 'attack',
      defendingTeamId: 'GS',
      attackingTeamId: 'FB',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 0 },
        { teamId: 'FB', approvedUniquePlayers: 2 },
      ],
    });
    expect(result.winnerTeamId).toBe('GS');
    expect(result.outcome).toBe('defended');
    expect(result.minThresholdMet).toBe(false);
  });

  it('G07: 5 attackers, 5 defenders -> Tie results in defender retaining front', () => {
    const result = determineBattleResult({
      kind: 'attack',
      defendingTeamId: 'GS',
      attackingTeamId: 'FB',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 5 },
        { teamId: 'FB', approvedUniquePlayers: 5 },
      ],
    });
    expect(result.winnerTeamId).toBe('GS');
    expect(result.outcome).toBe('defended');
    expect(result.isTie).toBe(true);
  });

  it('G08: Neutral battle: A3, B3 -> Tie means remains neutral (null)', () => {
    const result = determineBattleResult({
      kind: 'neutral_open',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 3 },
        { teamId: 'FB', approvedUniquePlayers: 3 },
      ],
    });
    expect(result.winnerTeamId).toBeNull();
    expect(result.outcome).toBe('neutral_remains');
    expect(result.isTie).toBe(true);
  });

  it('G09: Neutral battle: A2, B1 -> min 3 threshold not met, remains neutral', () => {
    const result = determineBattleResult({
      kind: 'neutral_open',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 2 },
        { teamId: 'FB', approvedUniquePlayers: 1 },
      ],
    });
    expect(result.winnerTeamId).toBeNull();
    expect(result.outcome).toBe('neutral_remains');
    expect(result.minThresholdMet).toBe(false);
  });

  it('G10: Neutral battle: A4, B3 -> Team A wins and captures', () => {
    const result = determineBattleResult({
      kind: 'neutral_open',
      minAttacker: 3,
      allTeamTallies: [
        { teamId: 'GS', approvedUniquePlayers: 4 },
        { teamId: 'FB', approvedUniquePlayers: 3 },
      ],
    });
    expect(result.winnerTeamId).toBe('GS');
    expect(result.outcome).toBe('capture');
  });

  it('G12: 48h Protection check prevents new battle while active', () => {
    const now = new Date('2026-11-02T12:00:00Z');
    const futureProt = new Date('2026-11-03T12:00:00Z');
    const pastProt = new Date('2026-11-01T12:00:00Z');

    expect(
      canStartAttack({
        status: 'protected',
        ownerTeamId: 'GS',
        protectionUntil: futureProt,
        now,
      }).allowed
    ).toBe(false);

    expect(
      canStartAttack({
        status: 'owned',
        ownerTeamId: 'GS',
        protectionUntil: pastProt,
        now,
      }).allowed
    ).toBe(true);
  });

  it('G13: Daily quota of 3 distinct fronts per league', () => {
    expect(validateDailyContributionLimit(0, 3).allowed).toBe(true);
    expect(validateDailyContributionLimit(2, 3).allowed).toBe(true);
    expect(validateDailyContributionLimit(2, 3).remaining).toBe(1);
    expect(validateDailyContributionLimit(3, 3).allowed).toBe(false);
    expect(validateDailyContributionLimit(4, 3).allowed).toBe(false);
  });

  it('G15: Electoral Blueprint Target Scenario — 8 GS fronts / 80 voters vs 2 FB fronts / 160 voters', () => {
    const teams = [
      { id: 'GS', name: 'Galatasaray' },
      { id: 'FB', name: 'Fenerbahçe' },
    ];

    // 8 fronts owned by GS, 2 fronts owned by FB
    const fronts = [
      ...Array.from({ length: 8 }).map((_, i) => ({
        frontId: `gs-front-${i}`,
        ownerTeamId: 'GS',
        weight: 1.0,
        isPlayable: true,
      })),
      ...Array.from({ length: 2 }).map((_, i) => ({
        frontId: `fb-front-${i}`,
        ownerTeamId: 'FB',
        weight: 1.0,
        isPlayable: true,
      })),
    ];

    // 80 unique GS voters, 160 unique FB voters
    const voters = [
      ...Array.from({ length: 80 }).map((_, i) => ({
        userId: `user-gs-${i}`,
        teamId: 'GS',
        cityRegionId: 'alanya',
        firstFrontId: 'gs-front-0',
      })),
      ...Array.from({ length: 160 }).map((_, i) => ({
        userId: `user-fb-${i}`,
        teamId: 'FB',
        cityRegionId: 'alanya',
        firstFrontId: 'fb-front-0',
      })),
    ];

    const { items, totalPlayableFronts, totalVerifiedVoters } = calculateThreeMetrics(teams, fronts, voters);

    expect(totalPlayableFronts).toBe(10);
    expect(totalVerifiedVoters).toBe(240);

    const gs = items.find((x) => x.teamId === 'GS')!;
    const fb = items.find((x) => x.teamId === 'FB')!;

    // 1. Front share verification: GS has 8 fronts (80%), FB has 2 fronts (20%)
    expect(gs.frontCount).toBe(8);
    expect(gs.frontSharePercent).toBe(80);
    expect(fb.frontCount).toBe(2);
    expect(fb.frontSharePercent).toBe(20);

    // 2. Verified player support share: GS has 80 (33.33%), FB has 160 (66.67%)
    expect(gs.verifiedSupportCount).toBe(80);
    expect(gs.verifiedSupportSharePercent).toBe(33.33);
    expect(fb.verifiedSupportCount).toBe(160);
    expect(fb.verifiedSupportSharePercent).toBe(66.67);

    // In this scenario, GS leads in Front Count while FB leads in Verified Support!
    expect(gs.frontCount).toBeGreaterThan(fb.frontCount);
    expect(fb.verifiedSupportSharePercent).toBeGreaterThan(gs.verifiedSupportSharePercent);
  });

  it('G16: Weighted Control Share Scenario — GS 8x1.2=9.6 vs FB 2x5.0=10.0', () => {
    const teams = [
      { id: 'GS', name: 'Galatasaray' },
      { id: 'FB', name: 'Fenerbahçe' },
    ];

    // GS controls 8 quiet streets each with weight 1.2 -> 9.6
    // FB controls 2 heavy avenue fronts each with weight 5.0 -> 10.0
    const fronts = [
      ...Array.from({ length: 8 }).map((_, i) => ({
        frontId: `gs-front-${i}`,
        ownerTeamId: 'GS',
        weight: 1.2,
        isPlayable: true,
      })),
      ...Array.from({ length: 2 }).map((_, i) => ({
        frontId: `fb-front-${i}`,
        ownerTeamId: 'FB',
        weight: 5.0,
        isPlayable: true,
      })),
    ];

    const { items, totalPossibleWeight, championshipWinnerTeamId } = calculateThreeMetrics(teams, fronts, []);

    expect(totalPossibleWeight).toBe(19.6);

    const gs = items.find((x) => x.teamId === 'GS')!;
    const fb = items.find((x) => x.teamId === 'FB')!;

    expect(gs.weightedControlScore).toBe(9.6);
    expect(fb.weightedControlScore).toBe(10.0);

    // GS has front majority (8 to 2)
    expect(gs.frontCount).toBe(8);
    expect(fb.frontCount).toBe(2);

    // FB has weighted control majority (10.0 > 9.6)
    expect(fb.weightedControlScore).toBeGreaterThan(gs.weightedControlScore);
    expect(championshipWinnerTeamId).toBe('FB');
  });

  it('Weight clamping enforces [1.0, 5.0] range', () => {
    expect(clampWeight(0.5)).toBe(1.0);
    expect(clampWeight(1.234)).toBe(1.23);
    expect(clampWeight(5.8)).toBe(5.0);
  });

  it('Account maturity verification requires min 24 hours', () => {
    const now = new Date('2026-11-02T12:00:00Z');
    const recent = new Date('2026-11-02T02:00:00Z'); // 10h old
    const mature = new Date('2026-11-01T10:00:00Z'); // 26h old

    expect(isAccountAgeEligible(recent, 24, now)).toBe(false);
    expect(isAccountAgeEligible(mature, 24, now)).toBe(true);
  });
});
