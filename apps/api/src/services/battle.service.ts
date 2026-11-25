import { dbStore, BattleRecord } from '../db/store.js';
import { determineBattleResult, TeamTally } from '@cepheland/game-rules';

export class BattleService {
  getBattleDetails(battleId: string, viewerUserId?: string) {
    const battle = dbStore.battles.get(battleId);
    if (!battle) return null;

    const front = dbStore.fronts.get(battle.frontId);
    const frontState = dbStore.seasonFrontStates.get(`${battle.seasonId}:${battle.frontId}`);

    // Aggregate tallies
    const approvedCounts: Record<string, number> = {};
    const contributions = Array.from(dbStore.battleContributions.values()).filter(
      (c) => c.battleId === battleId && c.status === 'approved'
    );

    let viewerContributed = false;
    for (const c of contributions) {
      if (viewerUserId && c.userId === viewerUserId) {
        viewerContributed = true;
      }
      approvedCounts[c.teamId] = (approvedCounts[c.teamId] ?? 0) + 1;
    }

    return {
      id: battle.id,
      seasonId: battle.seasonId,
      frontId: battle.frontId,
      frontNameI18n: front?.displayNameI18n,
      frontCode: front?.frontCode,
      mode: battle.mode,
      status: battle.status,
      defenderTeamId: battle.defenderTeamId,
      attackerTeamId: battle.attackerTeamId,
      defenderTeam: battle.defenderTeamId ? dbStore.teams.get(battle.defenderTeamId) : null,
      attackerTeam: battle.attackerTeamId ? dbStore.teams.get(battle.attackerTeamId) : null,
      startsAt: battle.startsAt?.toISOString() ?? null,
      endsAt: battle.endsAt?.toISOString() ?? null,
      proposalExpiresAt: battle.proposalExpiresAt?.toISOString() ?? null,
      winnerTeamId: battle.winnerTeamId,
      outcome: battle.outcome,
      approvedCounts,
      minAttackerRequired: 3,
      viewerContributed,
    };
  }

  settleBattle(battleId: string): {
    battle: BattleRecord;
    outcome: string;
    winnerTeamId: string | null;
    ownerChanged: boolean;
  } {
    const battle = dbStore.battles.get(battleId);
    if (!battle) throw new Error('BATTLE_NOT_FOUND');
    if (battle.status === 'finalized') {
      return {
        battle,
        outcome: battle.outcome ?? 'finalized',
        winnerTeamId: battle.winnerTeamId,
        ownerChanged: false,
      };
    }

    // Collect approved tallies
    const talliesMap = new Map<string, number>();
    const contributions = Array.from(dbStore.battleContributions.values()).filter(
      (c) => c.battleId === battleId && c.status === 'approved'
    );
    for (const c of contributions) {
      talliesMap.set(c.teamId, (talliesMap.get(c.teamId) ?? 0) + 1);
    }

    const allTeamTallies: TeamTally[] = Array.from(talliesMap.entries()).map(([teamId, count]) => ({
      teamId,
      approvedUniquePlayers: count,
    }));

    const result = determineBattleResult({
      kind: battle.mode,
      defendingTeamId: battle.defenderTeamId ?? undefined,
      attackingTeamId: battle.attackerTeamId ?? undefined,
      allTeamTallies,
      minAttacker: 3,
    });

    const now = new Date();
    battle.status = 'finalized';
    battle.settledAt = now;
    battle.winnerTeamId = result.winnerTeamId;
    battle.outcome = result.outcome;

    const frontState = dbStore.seasonFrontStates.get(`${battle.seasonId}:${battle.frontId}`);
    let ownerChanged = false;

    if (frontState) {
      frontState.activeBattleId = null;

      if (result.outcome === 'capture' && result.winnerTeamId) {
        ownerChanged = frontState.ownerTeamId !== result.winnerTeamId;
        const oldOwner = frontState.ownerTeamId;
        frontState.ownerTeamId = result.winnerTeamId;
        frontState.status = 'protected';
        frontState.protectionUntil = new Date(now.getTime() + 48 * 3600000); // 48h protection
        frontState.cooldownUntil = null;
        frontState.version++;
        frontState.lastChangedAt = now;

        // Record history
        dbStore.frontOwnershipHistory.push({
          id: dbStore.frontOwnershipHistory.length + 1,
          seasonId: battle.seasonId,
          frontId: battle.frontId,
          battleId: battle.id,
          oldOwnerTeamId: oldOwner,
          newOwnerTeamId: result.winnerTeamId,
          changedAt: now,
          reason: 'BATTLE_CONQUEST',
        });
      } else if (result.outcome === 'defended') {
        frontState.status = 'owned';
        frontState.cooldownUntil = new Date(now.getTime() + 12 * 3600000); // 12h cooldown
        frontState.version++;
        frontState.lastChangedAt = now;
      } else {
        // Neutral remains
        frontState.status = 'neutral';
        frontState.ownerTeamId = null;
        frontState.cooldownUntil = new Date(now.getTime() + 6 * 3600000);
        frontState.version++;
        frontState.lastChangedAt = now;
      }
    }

    return {
      battle,
      outcome: result.outcome,
      winnerTeamId: result.winnerTeamId,
      ownerChanged,
    };
  }
}

export const battleService = new BattleService();
