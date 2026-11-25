import { dbStore, LeagueRecord, TeamRecord, SeasonRecord } from '../db/store.js';

export class LeagueService {
  getLeagues() {
    const list = Array.from(dbStore.leagues.values());
    return list.map((l) => {
      const activeSeason = Array.from(dbStore.seasons.values()).find(
        (s) => s.leagueId === l.id && s.status === 'active'
      );
      const teams = Array.from(dbStore.teams.values()).filter((t) => t.leagueId === l.id);
      return {
        ...l,
        activeSeason: activeSeason ? {
          id: activeSeason.id,
          titleI18n: activeSeason.titleI18n,
          status: activeSeason.status,
          startsAt: activeSeason.startsAt.toISOString(),
          endsAt: activeSeason.endsAt.toISOString(),
          championshipMetric: activeSeason.championshipMetric,
        } : null,
        teams,
      };
    });
  }

  getLeagueById(id: string) {
    const league = dbStore.leagues.get(id);
    if (!league) return null;
    const activeSeason = Array.from(dbStore.seasons.values()).find(
      (s) => s.leagueId === league.id && s.status === 'active'
    );
    const teams = Array.from(dbStore.teams.values()).filter((t) => t.leagueId === league.id);
    return {
      ...league,
      activeSeason: activeSeason ? {
        id: activeSeason.id,
        titleI18n: activeSeason.titleI18n,
        status: activeSeason.status,
        startsAt: activeSeason.startsAt.toISOString(),
        endsAt: activeSeason.endsAt.toISOString(),
        championshipMetric: activeSeason.championshipMetric,
      } : null,
      teams,
    };
  }

  joinSeasonTeam(userId: string, seasonId: string, teamId: string) {
    const season = dbStore.seasons.get(seasonId);
    if (!season) throw new Error('SEASON_NOT_FOUND');
    const team = dbStore.teams.get(teamId);
    if (!team) throw new Error('TEAM_NOT_FOUND');
    if (team.leagueId !== season.leagueId) throw new Error('TEAM_LEAGUE_MISMATCH');

    // Check if user already joined this season (1 team per season rule)
    const existing = Array.from(dbStore.leagueMemberships.values()).find(
      (m) => m.userId === userId && m.seasonId === seasonId
    );
    if (existing) {
      if (existing.teamId === teamId) {
        return existing;
      }
      throw new Error('SEASON_TEAM_CHANGE_LOCKED');
    }

    const membership = {
      id: crypto.randomUUID(),
      userId,
      seasonId,
      leagueId: season.leagueId,
      teamId,
      status: 'active' as const,
      joinedAt: new Date(),
    };
    dbStore.leagueMemberships.set(userId, membership);
    return membership;
  }

  getUserMembership(userId: string, seasonId: string) {
    return Array.from(dbStore.leagueMemberships.values()).find(
      (m) => m.userId === userId && m.seasonId === seasonId
    );
  }
}

export const leagueService = new LeagueService();
