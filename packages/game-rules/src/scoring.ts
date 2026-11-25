/**
 * Deterministic calculation for the three simultaneous electoral metrics
 * as specified in Blueprint Section 06:
 * 1. front_control_share (Cephe Sayısı)
 * 2. verified_support_share (Doğrulanmış Halk Desteği)
 * 3. weighted_control_share (Ağırlıklı Harita Hâkimiyeti)
 */

export interface TeamScoreItem {
  teamId: string;
  frontCount: number;
  frontSharePercent: number;
  verifiedSupportCount: number;
  verifiedSupportSharePercent: number;
  weightedControlScore: number;
  weightedControlSharePercent: number;
}

export interface FrontSummary {
  frontId: string;
  ownerTeamId: string | null;
  weight: number; // 1.0 to 5.0
  isPlayable: boolean;
}

export interface VoterSummary {
  userId: string;
  teamId: string;
  cityRegionId: string;
  firstFrontId: string;
}

export function clampWeight(weight: number): number {
  const clamped = Math.max(1.0, Math.min(5.0, weight));
  return Math.round(clamped * 100) / 100;
}

export function calculateThreeMetrics(
  teams: { id: string; name: string }[],
  fronts: FrontSummary[],
  voters: VoterSummary[]
): {
  items: TeamScoreItem[];
  totalPlayableFronts: number;
  totalVerifiedVoters: number;
  totalPossibleWeight: number;
  championshipWinnerTeamId: string | null;
} {
  const playableFronts = fronts.filter((f) => f.isPlayable);
  const totalPlayableFronts = playableFronts.length;

  const totalPossibleWeight = playableFronts.reduce((sum, f) => sum + clampWeight(f.weight), 0);
  const totalVerifiedVoters = voters.length;

  // Aggregate counts per team
  const frontCounts = new Map<string, number>();
  const weightedScores = new Map<string, number>();
  const supportCounts = new Map<string, number>();

  for (const t of teams) {
    frontCounts.set(t.id, 0);
    weightedScores.set(t.id, 0);
    supportCounts.set(t.id, 0);
  }

  for (const f of playableFronts) {
    if (f.ownerTeamId && frontCounts.has(f.ownerTeamId)) {
      frontCounts.set(f.ownerTeamId, (frontCounts.get(f.ownerTeamId) ?? 0) + 1);
      weightedScores.set(
        f.ownerTeamId,
        Math.round(((weightedScores.get(f.ownerTeamId) ?? 0) + clampWeight(f.weight)) * 100) / 100
      );
    }
  }

  for (const v of voters) {
    if (supportCounts.has(v.teamId)) {
      supportCounts.set(v.teamId, (supportCounts.get(v.teamId) ?? 0) + 1);
    }
  }

  const items: TeamScoreItem[] = teams.map((t) => {
    const fCount = frontCounts.get(t.id) ?? 0;
    const wScore = weightedScores.get(t.id) ?? 0;
    const sCount = supportCounts.get(t.id) ?? 0;

    const fShare = totalPlayableFronts > 0 ? (fCount / totalPlayableFronts) * 100 : 0;
    const wShare = totalPossibleWeight > 0 ? (wScore / totalPossibleWeight) * 100 : 0;
    const sShare = totalVerifiedVoters > 0 ? (sCount / totalVerifiedVoters) * 100 : 0;

    return {
      teamId: t.id,
      frontCount: fCount,
      frontSharePercent: Math.round(fShare * 100) / 100,
      verifiedSupportCount: sCount,
      verifiedSupportSharePercent: Math.round(sShare * 100) / 100,
      weightedControlScore: wScore,
      weightedControlSharePercent: Math.round(wShare * 100) / 100,
    };
  });

  // Determine championship winner (default: weighted_control, tie-breaker: front_count, then verified_support)
  const sorted = [...items].sort((a, b) => {
    if (b.weightedControlScore !== a.weightedControlScore) {
      return b.weightedControlScore - a.weightedControlScore;
    }
    if (b.frontCount !== a.frontCount) {
      return b.frontCount - a.frontCount;
    }
    return b.verifiedSupportCount - a.verifiedSupportCount;
  });

  let winnerId: string | null = null;
  if (sorted.length > 0 && sorted[0].weightedControlScore > 0) {
    if (sorted.length > 1 && sorted[0].weightedControlScore === sorted[1].weightedControlScore &&
        sorted[0].frontCount === sorted[1].frontCount &&
        sorted[0].verifiedSupportCount === sorted[1].verifiedSupportCount) {
      winnerId = null; // true tie
    } else {
      winnerId = sorted[0].teamId;
    }
  }

  return {
    items,
    totalPlayableFronts,
    totalVerifiedVoters,
    totalPossibleWeight: Math.round(totalPossibleWeight * 100) / 100,
    championshipWinnerTeamId: winnerId,
  };
}
