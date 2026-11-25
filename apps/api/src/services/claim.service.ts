import { dbStore, ClaimChallengeRecord, BattleContributionRecord, BattleRecord } from '../db/store.js';
import { verifyPlayZonePresence, LatLng } from '@cepheland/geo';
import { canStartAttack, validateDailyContributionLimit } from '@cepheland/game-rules';

export class ClaimService {
  checkEligibility(userId: string, seasonId: string, frontId: string) {
    const user = dbStore.users.get(userId);
    if (!user) return { eligible: false, reason: 'AUTH_REQUIRED' };

    const membership = Array.from(dbStore.leagueMemberships.values()).find(
      (m) => m.userId === userId && m.seasonId === seasonId
    );
    if (!membership) return { eligible: false, reason: 'TEAM_NOT_SELECTED' };

    const frontState = dbStore.seasonFrontStates.get(`${seasonId}:${frontId}`);
    if (!frontState) return { eligible: false, reason: 'FRONT_NOT_FOUND' };

    if (frontState.status === 'suspended') {
      return { eligible: false, reason: 'FRONT_SUSPENDED' };
    }

    const attackCheck = canStartAttack({
      status: frontState.status,
      ownerTeamId: frontState.ownerTeamId,
      protectionUntil: frontState.protectionUntil,
      cooldownUntil: frontState.cooldownUntil,
    });
    if (!attackCheck.allowed && frontState.status !== 'neutral' && frontState.status !== 'contested') {
      return { eligible: false, reason: attackCheck.reason };
    }

    // Check if user already contributed to the active battle
    if (frontState.activeBattleId) {
      const existingContrib = Array.from(dbStore.battleContributions.values()).find(
        (c) => c.battleId === frontState.activeBattleId && c.userId === userId
      );
      if (existingContrib) {
        return { eligible: false, reason: 'ALREADY_CONTRIBUTED' };
      }
    }

    // Daily distinct fronts quota check
    const today = new Date().toDateString();
    const userTodayContribs = Array.from(dbStore.battleContributions.values()).filter(
      (c) => c.userId === userId && c.seasonId === seasonId && c.submittedAt.toDateString() === today
    );
    const distinctFronts = new Set(userTodayContribs.map((c) => c.frontId));
    const quotaCheck = validateDailyContributionLimit(distinctFronts.size, 3);
    if (!quotaCheck.allowed) {
      return { eligible: false, reason: 'DAILY_QUOTA_REACHED', remainingDailyFronts: 0 };
    }

    return {
      eligible: true,
      remainingDailyFronts: quotaCheck.remaining,
      teamId: membership.teamId,
      currentFrontOwnerTeamId: frontState.ownerTeamId,
    };
  }

  createChallenge(userId: string, seasonId: string, frontId: string, action: string, deviceId?: string) {
    const eligibility = this.checkEligibility(userId, seasonId, frontId);
    if (!eligibility.eligible) {
      throw new Error(eligibility.reason || 'NOT_ELIGIBLE');
    }

    const challengeId = crypto.randomUUID();
    const nonce = crypto.randomUUID();
    const expiresAt = new Date(Date.now() + 120 * 1000); // 120 seconds TTL

    const record: ClaimChallengeRecord = {
      id: challengeId,
      userId,
      deviceId,
      seasonId,
      frontId,
      action,
      nonceHash: nonce,
      expiresAt,
      consumedAt: null,
      createdAt: new Date(),
    };
    dbStore.claimChallenges.set(challengeId, record);

    return {
      challengeId,
      nonce,
      expiresAt: expiresAt.toISOString(),
      requiredIntegrityLevel: 'standard',
      serverTime: new Date().toISOString(),
    };
  }

  submitClaim(input: {
    userId: string;
    challengeId: string;
    idempotencyKey: string;
    locationSamples: { latitude: number; longitude: number; accuracyMeters: number; recordedAt: string }[];
    integrity: { platform: string; signedProof?: string };
  }) {
    // 1. Idempotency Check
    const existing = Array.from(dbStore.battleContributions.values()).find(
      (c) => c.userId === input.userId && c.idempotencyKey === input.idempotencyKey
    );
    if (existing) {
      return {
        claimId: existing.id,
        receiptId: existing.id,
        battleId: existing.battleId,
        frontId: existing.frontId,
        status: existing.status,
        counted: existing.status === 'approved',
        decisionCode: existing.decisionCode,
        userMessageKey: 'claim.idempotent_receipt',
        serverTime: new Date().toISOString(),
        remainingDailyFronts: 2,
      };
    }

    // 2. Challenge Check
    const challenge = dbStore.claimChallenges.get(input.challengeId);
    if (!challenge || challenge.userId !== input.userId) {
      throw new Error('INVALID_CHALLENGE');
    }
    if (challenge.consumedAt || challenge.expiresAt.getTime() < Date.now()) {
      throw new Error('CHALLENGE_EXPIRED');
    }
    challenge.consumedAt = new Date();

    const { seasonId, frontId } = challenge;
    const membership = Array.from(dbStore.leagueMemberships.values()).find(
      (m) => m.userId === input.userId && m.seasonId === seasonId
    );
    if (!membership) throw new Error('TEAM_NOT_SELECTED');

    // 3. Location Verification against Safe Play Zone
    const playZone = Array.from(dbStore.playZones.values()).find((pz) => pz.frontId === frontId);
    const primarySample = input.locationSamples[0];
    let geoValid = true;

    if (playZone) {
      const check = verifyPlayZonePresence(
        primarySample,
        playZone.geometry,
        playZone.center,
        40, // 40m tolerance; water/road holes remain excluded
        playZone.geometryRings?.slice(1) ?? []
      );
      if (!check.valid) {
        throw new Error(check.reason || 'OUTSIDE_PLAY_ZONE');
      }
    }

    // 4. Integrity and Risk Evaluation
    let riskDecision: 'approved' | 'pending' = 'approved';
    let decisionCode = 'APPROVED_STANDARD';
    if (input.integrity.signedProof === 'SUSPICIOUS_MOCK_PROOF') {
      riskDecision = 'pending';
      decisionCode = 'INTEGRITY_SUSPICIOUS';
    }

    // 5. State Machine & Battle Management
    const frontState = dbStore.seasonFrontStates.get(`${seasonId}:${frontId}`)!;
    let battle: BattleRecord;

    if (!frontState.activeBattleId) {
      // Create new battle
      const newBattleId = crypto.randomUUID();
      const now = new Date();

      if (frontState.status === 'neutral') {
        // Neutral Battle: open to all teams, 24 hours
        battle = {
          id: newBattleId,
          seasonId,
          frontId,
          mode: 'neutral_open',
          status: 'active',
          defenderTeamId: null,
          attackerTeamId: null,
          createdBy: input.userId,
          rulesSnapshotJson: { min_attackers: 3, duration_hours: 24 },
          rulesSnapshotHash: 'rules_snap_hash_v1',
          proposedAt: now,
          proposalExpiresAt: null,
          startsAt: now,
          endsAt: new Date(now.getTime() + 24 * 3600000),
          settledAt: null,
          winnerTeamId: null,
          outcome: null,
        };
        frontState.status = 'contested';
        frontState.activeBattleId = newBattleId;
      } else {
        // Attack Proposed Battle: requires 2nd distinct trusted teammate within 2 hours
        battle = {
          id: newBattleId,
          seasonId,
          frontId,
          mode: 'attack',
          status: 'proposed',
          defenderTeamId: frontState.ownerTeamId,
          attackerTeamId: membership.teamId,
          createdBy: input.userId,
          rulesSnapshotJson: { min_attackers: 3, duration_hours: 24 },
          rulesSnapshotHash: 'rules_snap_hash_v1',
          proposedAt: now,
          proposalExpiresAt: new Date(now.getTime() + 2 * 3600000), // 2h window
          startsAt: null,
          endsAt: null,
          settledAt: null,
          winnerTeamId: null,
          outcome: null,
        };
        frontState.activeBattleId = newBattleId;
      }
      dbStore.battles.set(newBattleId, battle);
    } else {
      battle = dbStore.battles.get(frontState.activeBattleId)!;

      // If battle is in 'proposed' status, check if this is the 2nd distinct attacker!
      if (battle.status === 'proposed' && battle.attackerTeamId === membership.teamId) {
        if (battle.createdBy !== input.userId) {
          // 2nd distinct trusted team member joins -> Activate battle!
          const now = new Date();
          battle.status = 'active';
          battle.startsAt = now;
          battle.endsAt = new Date(now.getTime() + 24 * 3600000);
          frontState.status = 'contested';
        }
      }
    }

    // 6. Record Contribution
    const contributionId = crypto.randomUUID();
    const contribution: BattleContributionRecord = {
      id: contributionId,
      battleId: battle.id,
      seasonId,
      frontId,
      userId: input.userId,
      teamId: membership.teamId,
      challengeId: input.challengeId,
      status: riskDecision,
      decisionCode,
      idempotencyKey: input.idempotencyKey,
      submittedAt: new Date(),
      approvedAt: riskDecision === 'approved' ? new Date() : null,
    };
    dbStore.battleContributions.set(contributionId, contribution);

    // 7. Electoral Voter Record (Single Source of Truth: first physical contribution per user per season)
    if (riskDecision === 'approved') {
      const existingVoter = dbStore.seasonVoters.get(`${seasonId}:${input.userId}`);
      if (!existingVoter) {
        const front = dbStore.fronts.get(frontId)!;
        dbStore.seasonVoters.set(`${seasonId}:${input.userId}`, {
          seasonId,
          userId: input.userId,
          teamId: membership.teamId,
          cityRegionId: front.cityRegionId,
          neighborhoodRegionId: front.neighborhoodRegionId ?? undefined,
          firstFrontId: frontId,
          firstApprovedContributionId: contributionId,
          status: 'verified',
          registeredAt: new Date(),
        });
      }
    }

    // Remaining daily fronts calculation
    const today = new Date().toDateString();
    const userTodayContribs = Array.from(dbStore.battleContributions.values()).filter(
      (c) => c.userId === input.userId && c.seasonId === seasonId && c.submittedAt.toDateString() === today
    );
    const distinctFronts = new Set(userTodayContribs.map((c) => c.frontId));
    const remainingDailyFronts = Math.max(0, 3 - distinctFronts.size);

    return {
      claimId: contributionId,
      receiptId: contributionId,
      battleId: battle.id,
      frontId,
      status: riskDecision,
      counted: riskDecision === 'approved',
      decisionCode,
      userMessageKey: riskDecision === 'approved' ? 'claim.success' : 'claim.security_review',
      serverTime: new Date().toISOString(),
      remainingDailyFronts,
    };
  }
}

export const claimService = new ClaimService();
