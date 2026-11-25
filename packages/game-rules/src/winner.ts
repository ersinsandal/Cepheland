/**
 * Deterministic winner calculation for battles as specified in Blueprint Section 05.8.
 */

export interface TeamTally {
  teamId: string;
  approvedUniquePlayers: number;
}

export interface BattleWinnerInput {
  kind: 'neutral_open' | 'attack';
  defendingTeamId?: string;
  attackingTeamId?: string;
  allTeamTallies: TeamTally[];
  minAttacker: number; // default: 3
}

export interface BattleSettlementResult {
  winnerTeamId: string | null;
  outcome: 'capture' | 'defended' | 'neutral_remains';
  isTie: boolean;
  minThresholdMet: boolean;
}

export function determineBattleResult(input: BattleWinnerInput): BattleSettlementResult {
  const counts = new Map<string, number>(input.allTeamTallies.map((x) => [x.teamId, x.approvedUniquePlayers]));
  const minThreshold = input.minAttacker;

  if (input.kind === 'attack') {
    const attackCount = counts.get(input.attackingTeamId ?? '') ?? 0;
    const defendCount = counts.get(input.defendingTeamId ?? '') ?? 0;

    const thresholdMet = attackCount >= minThreshold;
    const attackerOutscored = attackCount > defendCount;

    if (thresholdMet && attackerOutscored) {
      return {
        winnerTeamId: input.attackingTeamId!,
        outcome: 'capture',
        isTie: false,
        minThresholdMet: true,
      };
    }

    const isTie = attackCount === defendCount;
    return {
      winnerTeamId: input.defendingTeamId ?? null,
      outcome: 'defended',
      isTie,
      minThresholdMet: thresholdMet,
    };
  }

  // neutral_open mode
  const sorted = [...input.allTeamTallies].sort((a, b) => b.approvedUniquePlayers - a.approvedUniquePlayers);

  if (sorted.length === 0 || sorted[0].approvedUniquePlayers < minThreshold) {
    return {
      winnerTeamId: null,
      outcome: 'neutral_remains',
      isTie: false,
      minThresholdMet: false,
    };
  }

  // Check for tie between 1st and 2nd place
  if (sorted.length > 1 && sorted[0].approvedUniquePlayers === sorted[1].approvedUniquePlayers) {
    return {
      winnerTeamId: null,
      outcome: 'neutral_remains',
      isTie: true,
      minThresholdMet: true,
    };
  }

  return {
    winnerTeamId: sorted[0].teamId,
    outcome: 'capture',
    isTie: false,
    minThresholdMet: true,
  };
}

export function winnerOfBattle(input: BattleWinnerInput): string | null {
  return determineBattleResult(input).winnerTeamId;
}
