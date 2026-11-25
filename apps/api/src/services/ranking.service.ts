import { dbStore } from '../db/store.js';
import { calculateThreeMetrics, FrontSummary, VoterSummary } from '@cepheland/game-rules';

export class RankingService {
  getRankings(seasonId: string, regionId: string) {
    const season = dbStore.seasons.get(seasonId);
    if (!season) throw new Error('SEASON_NOT_FOUND');

    const leagueTeams = Array.from(dbStore.teams.values()).filter((t) => t.leagueId === season.leagueId);

    // Fronts in this region
    const fronts: FrontSummary[] = [];
    for (const front of dbStore.fronts.values()) {
      if (front.cityRegionId === regionId || front.neighborhoodRegionId === regionId) {
        const state = dbStore.seasonFrontStates.get(`${seasonId}:${front.id}`);
        const weightRecord = dbStore.frontSeasonWeights.get(`${seasonId}:${front.id}`);
        fronts.push({
          frontId: front.id,
          ownerTeamId: state?.ownerTeamId ?? null,
          weight: weightRecord ? weightRecord.weight : front.defaultWeight,
          isPlayable: front.enabled && front.safetyStatus === 'approved' && state?.status !== 'suspended',
        });
      }
    }

    // Voters in this region
    const voters: VoterSummary[] = [];
    for (const voter of dbStore.seasonVoters.values()) {
      if (voter.seasonId === seasonId && (voter.cityRegionId === regionId || voter.neighborhoodRegionId === regionId)) {
        if (voter.status === 'verified') {
          voters.push({
            userId: voter.userId,
            teamId: voter.teamId,
            cityRegionId: voter.cityRegionId,
            firstFrontId: voter.firstFrontId,
          });
        }
      }
    }

    const { items, totalPlayableFronts, totalVerifiedVoters, totalPossibleWeight, championshipWinnerTeamId } =
      calculateThreeMetrics(
        leagueTeams.map((t) => ({ id: t.id, name: t.nameI18n.tr || t.slug })),
        fronts,
        voters
      );

    const teamRows = items.map((item) => {
      const team = dbStore.teams.get(item.teamId)!;
      return {
        teamId: item.teamId,
        slug: team.slug,
        nameI18n: team.nameI18n,
        colorPrimary: team.colorPrimary,
        colorSecondary: team.colorSecondary,
        frontCount: item.frontCount,
        frontSharePercent: item.frontSharePercent,
        verifiedSupportCount: item.verifiedSupportCount,
        verifiedSupportSharePercent: item.verifiedSupportSharePercent,
        weightedControlScore: item.weightedControlScore,
        weightedControlSharePercent: item.weightedControlSharePercent,
      };
    });

    const region = dbStore.geographicRegions.get(regionId);
    const regionName = region ? (region.nameI18n.tr || region.canonicalCode) : 'Alanya';

    return {
      seasonId,
      regionId,
      regionName,
      championshipMetric: season.championshipMetric,
      championshipWinnerTeamId,
      totalPlayableFronts,
      totalVerifiedVoters,
      totalPossibleWeight,
      teams: teamRows,
      updatedAt: new Date().toISOString(),
    };
  }
}

export const rankingService = new RankingService();
