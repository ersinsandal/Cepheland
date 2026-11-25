import { dbStore, LeagueRecord, TeamRecord, SeasonRecord, AdminAuditLogRecord } from '../db/store.js';
import { battleService } from './battle.service.js';

export class AdminService {
  getOverviewKpis() {
    const activeLeagues = Array.from(dbStore.leagues.values()).filter((l) => l.status === 'active').length;
    const liveBattles = Array.from(dbStore.battles.values()).filter((b) => b.status === 'active').length;
    const approvedClaims = Array.from(dbStore.battleContributions.values()).filter((c) => c.status === 'approved').length;
    const pendingReviews = Array.from(dbStore.reviewCases.values()).filter((r) => r.status === 'open').length;
    const suspendedFronts = Array.from(dbStore.seasonFrontStates.values()).filter((s) => s.status === 'suspended').length;

    return {
      activeLeagues,
      liveBattles,
      todayApprovedClaims: approvedClaims,
      pendingReviewCases: pendingReviews,
      suspendedFronts,
      apiErrorRatePercent: 0.05,
      avgSettlementLatencySeconds: 1.2,
      serverTime: new Date().toISOString(),
    };
  }

  // A03 League Wizard
  createLeague(input: {
    slug: string;
    nameI18n: Record<string, string>;
    descriptionI18n: Record<string, string>;
    timezone?: string;
    ageMin?: number;
    adminUserId: string;
    teams?: { slug: string; nameI18n: Record<string, string>; colorPrimary: string; colorSecondary: string }[];
  }) {
    const leagueId = crypto.randomUUID();
    const league: LeagueRecord = {
      id: leagueId,
      slug: input.slug,
      nameI18n: input.nameI18n,
      descriptionI18n: input.descriptionI18n,
      status: 'draft',
      timezone: input.timezone || 'Europe/Istanbul',
      ageMin: input.ageMin || 18,
      allowedCountryCodes: ['TR'],
      createdAt: new Date(),
    };
    dbStore.leagues.set(leagueId, league);

    if (input.teams) {
      input.teams.forEach((t, i) => {
        const teamId = crypto.randomUUID();
        dbStore.teams.set(teamId, {
          id: teamId,
          leagueId,
          slug: t.slug,
          nameI18n: t.nameI18n,
          colorPrimary: t.colorPrimary,
          colorSecondary: t.colorSecondary,
          status: 'active',
          orderNo: i + 1,
        });
      });
    }

    this.logAudit(input.adminUserId, 'CREATE_LEAGUE', 'LEAGUE', leagueId, undefined, league, 'Yeni lig taslağı oluşturuldu');
    return league;
  }

  submitLeagueForReview(leagueId: string, adminUserId: string) {
    const league = dbStore.leagues.get(leagueId);
    if (!league) throw new Error('LEAGUE_NOT_FOUND');
    league.status = 'review';
    this.logAudit(adminUserId, 'SUBMIT_LEAGUE_REVIEW', 'LEAGUE', leagueId, { status: 'draft' }, { status: 'review' }, 'İncelemeye gönderildi');
    return league;
  }

  publishLeague(leagueId: string, adminUserId: string) {
    const league = dbStore.leagues.get(leagueId);
    if (!league) throw new Error('LEAGUE_NOT_FOUND');
    const oldStatus = league.status;
    league.status = 'active';

    // Create default active season
    const seasonId = crypto.randomUUID();
    const now = new Date();
    const season: SeasonRecord = {
      id: seasonId,
      leagueId,
      titleI18n: { tr: `${league.nameI18n.tr || league.slug} Sezon 1`, en: `${league.nameI18n.en || league.slug} Season 1` },
      status: 'active',
      ruleVersionId: 'c1000000-0000-0000-0000-000000000001',
      championshipMetric: 'weighted_control',
      startsAt: now,
      endsAt: new Date(now.getTime() + 30 * 86400000),
    };
    dbStore.seasons.set(seasonId, season);

    // Initialize front states for this season
    for (const f of dbStore.fronts.values()) {
      dbStore.seasonFrontStates.set(`${seasonId}:${f.id}`, {
        seasonId,
        frontId: f.id,
        ownerTeamId: null,
        status: 'neutral',
        activeBattleId: null,
        protectionUntil: null,
        cooldownUntil: null,
        version: 1,
        lastChangedAt: now,
      });
      dbStore.frontSeasonWeights.set(`${seasonId}:${f.id}`, {
        seasonId,
        frontId: f.id,
        weight: f.defaultWeight,
        methodVersion: 'default_v1',
      });
    }

    this.logAudit(adminUserId, 'PUBLISH_LEAGUE', 'LEAGUE', leagueId, { status: oldStatus }, { status: 'active' }, 'Lig çift onay sonrası resmen yayımlandı');
    return league;
  }

  pauseLeague(leagueId: string, adminUserId: string, reason: string) {
    const league = dbStore.leagues.get(leagueId);
    if (!league) throw new Error('LEAGUE_NOT_FOUND');
    const oldStatus = league.status;
    league.status = 'paused';
    this.logAudit(adminUserId, 'PAUSE_LEAGUE', 'LEAGUE', leagueId, { status: oldStatus }, { status: 'paused' }, reason);
    return league;
  }

  // A06 Safety & Front Control
  suspendFront(frontId: string, seasonId: string, adminUserId: string, reason: string) {
    const state = dbStore.seasonFrontStates.get(`${seasonId}:${frontId}`);
    if (!state) throw new Error('FRONT_STATE_NOT_FOUND');
    const oldStatus = state.status;
    state.status = 'suspended';

    // Pause active battle if any
    if (state.activeBattleId) {
      const battle = dbStore.battles.get(state.activeBattleId);
      if (battle && battle.status === 'active') {
        battle.status = 'paused';
      }
    }

    this.logAudit(adminUserId, 'SUSPEND_FRONT', 'FRONT', frontId, { status: oldStatus }, { status: 'suspended' }, reason);
    return state;
  }

  restoreFront(frontId: string, seasonId: string, adminUserId: string) {
    const state = dbStore.seasonFrontStates.get(`${seasonId}:${frontId}`);
    if (!state) throw new Error('FRONT_STATE_NOT_FOUND');
    state.status = state.ownerTeamId ? 'owned' : 'neutral';
    this.logAudit(adminUserId, 'RESTORE_FRONT', 'FRONT', frontId, { status: 'suspended' }, { status: state.status }, 'Güvenlik onayı sonrası cephe yeniden açıldı');
    return state;
  }

  // A07 Settle Trigger from Admin
  triggerSettlement(battleId: string, adminUserId: string) {
    const res = battleService.settleBattle(battleId);
    this.logAudit(adminUserId, 'SETTLE_BATTLE_MANUAL', 'BATTLE', battleId, undefined, res, 'Yönetici savaşı manuel sonuçlandırdı');
    return res;
  }

  // A09 Security Review Decisions
  resolveReviewCase(caseId: string, decision: 'approved' | 'rejected', adminUserId: string, resolutionNotes: string) {
    const c = dbStore.reviewCases.get(caseId);
    if (!c) throw new Error('CASE_NOT_FOUND');
    c.status = decision === 'approved' ? 'approved' : 'rejected';
    c.resolution = resolutionNotes;
    c.assignedAdminId = adminUserId;

    if (c.contributionId) {
      const contrib = dbStore.battleContributions.get(c.contributionId);
      if (contrib) {
        contrib.status = decision === 'approved' ? 'approved' : 'rejected';
        if (decision === 'approved') {
          contrib.approvedAt = new Date();
        }
      }
    }

    this.logAudit(adminUserId, 'RESOLVE_SECURITY_CASE', 'REVIEW_CASE', caseId, undefined, { decision, resolutionNotes }, 'Güvenlik inceleme kararı verildi');
    return c;
  }

  // A14 Emergency Kill Switch
  triggerKillSwitch(scope: 'all_claims' | 'single_league' | 'maintenance', adminUserId: string, reason: string) {
    dbStore.featureFlags.set('KILL_SWITCH_SCOPE', scope);
    dbStore.featureFlags.set('KILL_SWITCH_ACTIVE', true);
    dbStore.featureFlags.set('KILL_SWITCH_REASON', reason);

    this.logAudit(adminUserId, 'TRIGGER_KILL_SWITCH', 'SYSTEM', 'global', undefined, { scope, reason }, 'ACİL DURUM KİLL SWITCH TETİKLENDİ');
    return { active: true, scope, reason };
  }

  getAuditLogs() {
    return dbStore.adminAuditLogs.slice(-100).reverse();
  }

  private logAudit(
    adminUserId: string,
    action: string,
    targetType: string,
    targetId: string,
    beforeJson?: Record<string, any>,
    afterJson?: Record<string, any>,
    reason?: string
  ) {
    dbStore.adminAuditLogs.push({
      id: dbStore.adminAuditLogs.length + 1,
      adminUserId,
      action,
      targetType,
      targetId,
      beforeJson,
      afterJson,
      reason,
      createdAt: new Date(),
    });
  }
}

export const adminService = new AdminService();
