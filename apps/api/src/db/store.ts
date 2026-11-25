import { clampWeight } from '@cepheland/game-rules';
import pilotFrontNames from './pilot-front-names.json';
import type { RegisteredFrontName } from '../services/front-name-registry.js';

export interface UserRecord {
  id: string;
  handle: string;
  displayName: string;
  locale: string;
  status: 'active' | 'limited' | 'suspended' | 'deleted';
  age18ConfirmedAt: Date | null;
  termsVersion: string;
  privacyVersion: string;
  createdAt: Date;
}

export interface AdminUserRecord {
  userId: string;
  role: 'super_admin' | 'league_admin' | 'map_editor' | 'moderator' | 'analyst' | 'support';
  mfaEnabled: boolean;
  createdAt: Date;
}

export interface GeographicRegionRecord {
  id: string;
  parentId: string | null;
  level: 'country' | 'province' | 'city' | 'district' | 'neighborhood';
  canonicalCode: string;
  nameI18n: Record<string, string>;
  isPlayable: boolean;
}

export interface MapVersionRecord {
  id: string;
  cityRegionId: string;
  version: number;
  name: string;
  sourceVersion: string;
  status: 'draft' | 'review' | 'published' | 'retired';
  publishedAt: Date | null;
}

export interface FrontRecord {
  id: string;
  mapVersionId: string;
  cityRegionId: string;
  neighborhoodRegionId: string | null;
  frontCode: string;
  displayNameI18n: Record<string, string>;
  streetName: string | null;
  center: { latitude: number; longitude: number };
  geometry: [number, number][]; // [[lng, lat], ...]
  geometryRings?: [number, number][][]; // Exterior followed by excluded water/road holes
  source?: 'osm_block' | 'open_land';
  naming?: {
    baseName: string;
    source: 'poi' | 'street' | 'locality' | 'coordinate';
    osmIds: string[];
    locality?: string;
  };
  areaM2: number;
  geometryHash: string;
  safetyStatus: 'pending' | 'approved' | 'suspended' | 'rejected';
  enabled: boolean;
  defaultWeight: number;
}

export interface PlayZoneRecord {
  id: string;
  frontId: string;
  geometry: [number, number][];
  geometryRings?: [number, number][][];
  center: { latitude: number; longitude: number };
  labelI18n: Record<string, string>;
  safetyNotes?: string;
  status: 'pending' | 'approved' | 'suspended' | 'disabled';
}

export interface LeagueRecord {
  id: string;
  slug: string;
  nameI18n: Record<string, string>;
  descriptionI18n: Record<string, string>;
  status: 'draft' | 'review' | 'scheduled' | 'active' | 'paused' | 'archived';
  timezone: string;
  ageMin: number;
  allowedCountryCodes: string[];
  bannerAssetKey?: string;
  createdAt: Date;
}

export interface TeamRecord {
  id: string;
  leagueId: string;
  slug: string;
  nameI18n: Record<string, string>;
  aboutI18n?: Record<string, string>;
  colorPrimary: string;
  colorSecondary: string;
  status: 'active' | 'disabled';
  orderNo: number;
}

export interface SeasonRecord {
  id: string;
  leagueId: string;
  titleI18n: Record<string, string>;
  status: 'draft' | 'scheduled' | 'active' | 'closing' | 'finished' | 'archived';
  ruleVersionId: string;
  championshipMetric: 'weighted_control' | 'front_count' | 'verified_support';
  startsAt: Date;
  endsAt: Date;
}

export interface LeagueMembershipRecord {
  id: string;
  userId: string;
  seasonId: string;
  leagueId: string;
  teamId: string;
  status: 'active' | 'banned' | 'removed';
  joinedAt: Date;
}

export interface SeasonFrontStateRecord {
  seasonId: string;
  frontId: string;
  ownerTeamId: string | null;
  status: 'neutral' | 'owned' | 'contested' | 'protected' | 'suspended' | 'archived';
  activeBattleId: string | null;
  protectionUntil: Date | null;
  cooldownUntil: Date | null;
  version: number;
  lastChangedAt: Date;
}

export interface FrontSeasonWeightRecord {
  seasonId: string;
  frontId: string;
  weight: number;
  methodVersion: string;
}

export interface BattleRecord {
  id: string;
  seasonId: string;
  frontId: string;
  mode: 'neutral_open' | 'attack';
  status: 'proposed' | 'active' | 'paused' | 'settling' | 'under_review' | 'finalized' | 'cancelled' | 'expired';
  defenderTeamId: string | null;
  attackerTeamId: string | null;
  createdBy: string;
  rulesSnapshotJson: Record<string, any>;
  rulesSnapshotHash: string;
  proposedAt: Date;
  proposalExpiresAt: Date | null;
  startsAt: Date | null;
  endsAt: Date | null;
  settledAt: Date | null;
  winnerTeamId: string | null;
  outcome: 'capture' | 'defended' | 'neutral_remains' | 'cancelled' | null;
  tallyHash?: string;
}

export interface ClaimChallengeRecord {
  id: string;
  userId: string;
  deviceId?: string;
  seasonId: string;
  frontId: string;
  battleId?: string;
  action: string;
  nonceHash: string;
  expiresAt: Date;
  consumedAt: Date | null;
  createdAt: Date;
}

export interface BattleContributionRecord {
  id: string;
  battleId: string;
  seasonId: string;
  frontId: string;
  userId: string;
  teamId: string;
  challengeId: string;
  status: 'reserved' | 'pending' | 'approved' | 'rejected' | 'voided';
  riskBucket?: 'low' | 'medium' | 'high';
  decisionCode: string;
  idempotencyKey: string;
  submittedAt: Date;
  approvedAt: Date | null;
}

export interface SeasonVoterRecord {
  seasonId: string;
  userId: string;
  teamId: string;
  cityRegionId: string;
  neighborhoodRegionId?: string;
  firstFrontId: string;
  firstApprovedContributionId: string;
  status: 'verified' | 'review' | 'voided';
  registeredAt: Date;
}

export interface BattleEventRecord {
  id: number;
  battleId: string;
  eventType: string;
  details: Record<string, any>;
  createdAt: Date;
}

export interface FrontOwnershipHistoryRecord {
  id: number;
  seasonId: string;
  frontId: string;
  battleId: string;
  oldOwnerTeamId: string | null;
  newOwnerTeamId: string | null;
  changedAt: Date;
  reason: string;
}

export interface NotificationRecord {
  id: string;
  userId: string;
  leagueId?: string;
  type: string;
  titleI18n: Record<string, string>;
  bodyI18n: Record<string, string>;
  deepLink?: string;
  readAt: Date | null;
  createdAt: Date;
}

export interface UserReportRecord {
  id: string;
  reporterUserId?: string;
  targetType: 'front' | 'battle' | 'user' | 'team' | 'map' | 'other';
  targetId?: string;
  reason: string;
  description?: string;
  status: 'open' | 'triaged' | 'resolved' | 'dismissed';
  createdAt: Date;
}

export interface ReviewCaseRecord {
  id: string;
  userId?: string;
  contributionId?: string;
  battleId?: string;
  caseType: string;
  reasonCodes: string[];
  status: 'open' | 'investigating' | 'escalated' | 'approved' | 'rejected' | 'closed';
  resolution?: string;
  assignedAdminId?: string;
  createdAt: Date;
}

export interface AdminAuditLogRecord {
  id: number;
  adminUserId: string;
  action: string;
  targetType: string;
  targetId?: string;
  beforeJson?: Record<string, any>;
  afterJson?: Record<string, any>;
  reason?: string;
  requestId?: string;
  createdAt: Date;
}

export class InMemoryStore {
  users = new Map<string, UserRecord>();
  adminUsers = new Map<string, AdminUserRecord>();
  geographicRegions = new Map<string, GeographicRegionRecord>();
  mapVersions = new Map<string, MapVersionRecord>();
  fronts = new Map<string, FrontRecord>();
  playZones = new Map<string, PlayZoneRecord>();
  leagues = new Map<string, LeagueRecord>();
  teams = new Map<string, TeamRecord>();
  seasons = new Map<string, SeasonRecord>();
  leagueMemberships = new Map<string, LeagueMembershipRecord>();
  seasonFrontStates = new Map<string, SeasonFrontStateRecord>(); // key: `${seasonId}:${frontId}`
  frontSeasonWeights = new Map<string, FrontSeasonWeightRecord>(); // key: `${seasonId}:${frontId}`
  battles = new Map<string, BattleRecord>();
  claimChallenges = new Map<string, ClaimChallengeRecord>();
  battleContributions = new Map<string, BattleContributionRecord>();
  seasonVoters = new Map<string, SeasonVoterRecord>(); // key: `${seasonId}:${userId}`
  battleEvents: BattleEventRecord[] = [];
  frontOwnershipHistory: FrontOwnershipHistoryRecord[] = [];
  notifications = new Map<string, NotificationRecord>();
  userReports = new Map<string, UserReportRecord>();
  reviewCases = new Map<string, ReviewCaseRecord>();
  adminAuditLogs: AdminAuditLogRecord[] = [];
  featureFlags = new Map<string, any>();

  constructor() {
    this.seedDemoData();
  }

  seedDemoData() {
    // 1. Admin & Users
    const adminId = '11111111-1111-1111-1111-111111111111';
    this.users.set(adminId, {
      id: adminId,
      handle: 'admin',
      displayName: 'Sistem Yöneticisi',
      locale: 'tr',
      status: 'active',
      age18ConfirmedAt: new Date(),
      termsVersion: 'v1.0',
      privacyVersion: 'v1.0',
      createdAt: new Date('2026-10-01T00:00:00Z'),
    });
    this.adminUsers.set(adminId, {
      userId: adminId,
      role: 'super_admin',
      mfaEnabled: true,
      createdAt: new Date('2026-10-01T00:00:00Z'),
    });

    const demoUsers = [
      { id: '22222222-2222-2222-2222-222222222222', handle: 'ahmet_gs', displayName: 'Ahmet Kaya' },
      { id: '33333333-3333-3333-3333-333333333333', handle: 'mehmet_fb', displayName: 'Mehmet Demir' },
      { id: '44444444-4444-4444-4444-444444444444', handle: 'ayse_bjk', displayName: 'Ayşe Yıldız' },
      { id: '55555555-5555-5555-5555-555555555555', handle: 'can_pc', displayName: 'Can Ergin' },
      { id: '66666666-6666-6666-6666-666666666666', handle: 'elif_ps', displayName: 'Elif Şahin' },
    ];
    for (const u of demoUsers) {
      this.users.set(u.id, {
        id: u.id,
        handle: u.handle,
        displayName: u.displayName,
        locale: 'tr',
        status: 'active',
        age18ConfirmedAt: new Date(),
        termsVersion: 'v1.0',
        privacyVersion: 'v1.0',
        createdAt: new Date('2026-10-15T00:00:00Z'),
      });
    }

    // 2. Regions
    const cityId = 'a0000000-0000-0000-0000-000000000003';
    const neighborhoodId = 'a0000000-0000-0000-0000-000000000004';
    this.geographicRegions.set(cityId, {
      id: cityId,
      parentId: 'a0000000-0000-0000-0000-000000000002',
      level: 'city',
      canonicalCode: 'TR-07-ALN',
      nameI18n: { tr: 'Alanya', en: 'Alanya' },
      isPlayable: true,
    });
    this.geographicRegions.set(neighborhoodId, {
      id: neighborhoodId,
      parentId: cityId,
      level: 'neighborhood',
      canonicalCode: 'TR-07-ALN-MHM',
      nameI18n: { tr: 'Mahmutlar', en: 'Mahmutlar' },
      isPlayable: true,
    });

    // 3. Map version
    const mapVerId = 'b0000000-0000-0000-0000-000000000001';
    this.mapVersions.set(mapVerId, {
      id: mapVerId,
      cityRegionId: cityId,
      version: 1,
      name: 'Alanya Mahmutlar Pilot Haritası v1.0',
      sourceVersion: 'OSM-2026-10',
      status: 'published',
      publishedAt: new Date('2026-10-20T00:00:00Z'),
    });

    // 4. Leagues
    const footballLeagueId = 'c0000000-0000-0000-0000-000000000001';
    const gamingLeagueId = 'c0000000-0000-0000-0000-000000000002';
    this.leagues.set(footballLeagueId, {
      id: footballLeagueId,
      slug: 'football-demo',
      nameI18n: { tr: 'Taraftarlar Ligi (Demo)', en: 'Supporters League (Demo)' },
      descriptionI18n: { tr: 'Alanya sokaklarında futbol rekabeti', en: 'Football rivalry on Alanya streets' },
      status: 'active',
      timezone: 'Europe/Istanbul',
      ageMin: 18,
      allowedCountryCodes: ['TR'],
      createdAt: new Date('2026-10-25T00:00:00Z'),
    });
    this.leagues.set(gamingLeagueId, {
      id: gamingLeagueId,
      slug: 'gaming-demo',
      nameI18n: { tr: 'Oyun Konsolları Ligi (Demo)', en: 'Gaming Consoles League (Demo)' },
      descriptionI18n: { tr: 'PC, PlayStation ve Xbox sokak kontrol savaşı', en: 'PC, PS and Xbox battle for territory' },
      status: 'active',
      timezone: 'Europe/Istanbul',
      ageMin: 18,
      allowedCountryCodes: ['TR'],
      createdAt: new Date('2026-10-25T00:00:00Z'),
    });

    // 5. Teams
    const gsId = 'd0000000-0000-0000-0000-000000000001';
    const fbId = 'd0000000-0000-0000-0000-000000000002';
    const bjkId = 'd0000000-0000-0000-0000-000000000003';
    this.teams.set(gsId, {
      id: gsId,
      leagueId: footballLeagueId,
      slug: 'galatasaray',
      nameI18n: { tr: 'Galatasaray', en: 'Galatasaray' },
      colorPrimary: '#A90432',
      colorSecondary: '#FDB913',
      status: 'active',
      orderNo: 1,
    });
    this.teams.set(fbId, {
      id: fbId,
      leagueId: footballLeagueId,
      slug: 'fenerbahce',
      nameI18n: { tr: 'Fenerbahçe', en: 'Fenerbahçe' },
      colorPrimary: '#002D72',
      colorSecondary: '#FFED02',
      status: 'active',
      orderNo: 2,
    });
    this.teams.set(bjkId, {
      id: bjkId,
      leagueId: footballLeagueId,
      slug: 'besiktas',
      nameI18n: { tr: 'Beşiktaş', en: 'Besiktas' },
      colorPrimary: '#111827',
      colorSecondary: '#FFFFFF',
      status: 'active',
      orderNo: 3,
    });

    const pcId = 'd0000000-0000-0000-0000-000000000004';
    const psId = 'd0000000-0000-0000-0000-000000000005';
    const xboxId = 'd0000000-0000-0000-0000-000000000006';
    this.teams.set(pcId, {
      id: pcId,
      leagueId: gamingLeagueId,
      slug: 'pc-master-race',
      nameI18n: { tr: 'PC Oyuncuları', en: 'PC Master Race' },
      colorPrimary: '#107C41',
      colorSecondary: '#00A4EF',
      status: 'active',
      orderNo: 1,
    });
    this.teams.set(psId, {
      id: psId,
      leagueId: gamingLeagueId,
      slug: 'playstation',
      nameI18n: { tr: 'PlayStation', en: 'PlayStation' },
      colorPrimary: '#003791',
      colorSecondary: '#0070D1',
      status: 'active',
      orderNo: 2,
    });
    this.teams.set(xboxId, {
      id: xboxId,
      leagueId: gamingLeagueId,
      slug: 'xbox',
      nameI18n: { tr: 'Xbox', en: 'Xbox' },
      colorPrimary: '#107C10',
      colorSecondary: '#52B435',
      status: 'active',
      orderNo: 3,
    });

    // 6. Seasons
    const footballSeasonId = 'e0000000-0000-0000-0000-000000000001';
    const gamingSeasonId = 'e0000000-0000-0000-0000-000000000002';
    const now = new Date();
    this.seasons.set(footballSeasonId, {
      id: footballSeasonId,
      leagueId: footballLeagueId,
      titleI18n: { tr: '2026 Güz Sezonu', en: 'Fall 2026 Season' },
      status: 'active',
      ruleVersionId: 'c1000000-0000-0000-0000-000000000001',
      championshipMetric: 'weighted_control',
      startsAt: new Date(now.getTime() - 3 * 86400000),
      endsAt: new Date(now.getTime() + 27 * 86400000),
    });
    this.seasons.set(gamingSeasonId, {
      id: gamingSeasonId,
      leagueId: gamingLeagueId,
      titleI18n: { tr: 'Konsol Savaşları Sezon 1', en: 'Console Wars Season 1' },
      status: 'active',
      ruleVersionId: 'c1000000-0000-0000-0000-000000000002',
      championshipMetric: 'weighted_control',
      startsAt: new Date(now.getTime() - 2 * 86400000),
      endsAt: new Date(now.getTime() + 28 * 86400000),
    });

    // Memberships
    this.leagueMemberships.set('22222222-2222-2222-2222-222222222222', {
      id: 'm-1',
      userId: '22222222-2222-2222-2222-222222222222',
      seasonId: footballSeasonId,
      leagueId: footballLeagueId,
      teamId: gsId,
      status: 'active',
      joinedAt: new Date(now.getTime() - 86400000),
    });
    this.leagueMemberships.set('33333333-3333-3333-3333-333333333333', {
      id: 'm-2',
      userId: '33333333-3333-3333-3333-333333333333',
      seasonId: footballSeasonId,
      leagueId: footballLeagueId,
      teamId: fbId,
      status: 'active',
      joinedAt: new Date(now.getTime() - 86400000),
    });
    this.leagueMemberships.set('44444444-4444-4444-4444-444444444444', {
      id: 'm-3',
      userId: '44444444-4444-4444-4444-444444444444',
      seasonId: footballSeasonId,
      leagueId: footballLeagueId,
      teamId: bjkId,
      status: 'active',
      joinedAt: new Date(now.getTime() - 86400000),
    });
    this.leagueMemberships.set('55555555-5555-5555-5555-555555555555', {
      id: 'm-4',
      userId: '55555555-5555-5555-5555-555555555555',
      seasonId: gamingSeasonId,
      leagueId: gamingLeagueId,
      teamId: pcId,
      status: 'active',
      joinedAt: new Date(now.getTime() - 86400000),
    });

    // 7. 12 Fronts in Alanya Mahmutlar (100% Real OpenStreetMap Street-Bounded City Blocks / Yapı Adaları)
    // Every single polygon is generated directly by polygonizing the official OSM road network.
    // Boundaries are the actual street ways: Sahil Caddesi (D400), Barbaros Caddesi, Atatürk Caddesi,
    // Kumru Sokak, 117. Sokak, 119. Sokak, 128. Sokak, 130. Sokak, 132. Sokak, 135. Sokak, 136. Sokak.
    // The committed naming snapshot was derived from the archived real OSM
    // roads and POIs; names are available even before the first viewport query.
    const frontDefs = [
      {
        id: 'f0000000-0000-0000-0000-000000000011',
        code: 'ALN-MHM-SAH-001',
        name: 'Bölge #01',
        street: 'Bölge #01',
        lat: 36.489688,
        lng: 32.093967,
        areaM2: 56373,
        polygon: [[32.0931932,36.4913447],[32.0932706,36.4912763],[32.0939181,36.4907039],[32.0939762,36.4906464],[32.0941997,36.490423],[32.0948985,36.4897261],[32.0950161,36.4896088],[32.0950423,36.4895827],[32.0951216,36.4895036],[32.0956001,36.4890263],[32.0955335,36.4889855],[32.0941243,36.4881163],[32.094047,36.4880865],[32.0935758,36.4885566],[32.0930802,36.4890681],[32.0925227,36.4896477],[32.0924824,36.4896792],[32.0918036,36.490398],[32.0931932,36.4913447]] as [number, number][],
        weight: 1.0,
        owner: null,
        status: 'neutral' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000003',
        code: 'ALN-MHM-KUM-003',
        name: 'Bölge #03',
        street: 'Bölge #03',
        lat: 36.48736061319147,
        lng: 32.09601663689034,
        areaM2: 25583,
        polygon: [[32.0951796,36.48773],[32.0960935,36.4883202],[32.0962119,36.4883966],[32.0962509,36.4883568],[32.0972642,36.4873222],[32.0957293,36.4863199],[32.0950814,36.4870038],[32.0950483,36.487077],[32.0950155,36.4872225],[32.0950065,36.4873461],[32.095015,36.4874091],[32.095051,36.4875488],[32.0951796,36.48773]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'contested' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000005',
        code: 'ALN-MHM-BAR-001',
        name: 'Bölge #05',
        street: 'Bölge #05',
        lat: 36.485457,
        lng: 32.097528,
        areaM2: 54648,
        polygon: [[32.0994147,36.4850521],[32.098028,36.4840846],[32.0977979,36.4842864],[32.0971699,36.4848765],[32.0958347,36.4862135],[32.0957293,36.4863199],[32.0972642,36.4873222],[32.0989868,36.4855001],[32.0994147,36.4850521]] as [number, number][],
        weight: 5.0,
        owner: fbId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000007',
        code: 'ALN-MHM-BAR-003',
        name: 'Bölge #07',
        street: 'Bölge #07',
        lat: 36.483869,
        lng: 32.099499,
        areaM2: 19534,
        polygon: [[32.1003538,36.4841616],[32.1002415,36.4840681],[32.0998818,36.483818],[32.0996625,36.4836566],[32.0995571,36.4835791],[32.0991797,36.4833064],[32.099041,36.4832197],[32.0980979,36.484027],[32.0994799,36.4849884],[32.1003538,36.4841616]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000001',
        code: 'ALN-MHM-KUM-001',
        name: 'Bölge #02',
        street: 'Bölge #02',
        lat: 36.490508,
        lng: 32.094815,
        areaM2: 13020,
        polygon: [[32.0958192,36.4901288],[32.0951322,36.4896434],[32.094263,36.4904667],[32.0940315,36.490686],[32.0939618,36.490752],[32.0946331,36.4912206],[32.0951919,36.4907173],[32.0954873,36.4904469],[32.0958192,36.4901288]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000002',
        code: 'ALN-MHM-KUM-002',
        name: 'Bölge #04',
        street: 'Bölge #04',
        lat: 36.489451,
        lng: 32.095933,
        areaM2: 9072,
        polygon: [[32.0958192,36.4901288],[32.0965719,36.4893877],[32.0965406,36.4893362],[32.0964042,36.4892296],[32.0958537,36.4888679],[32.0952077,36.4895622],[32.0951322,36.4896434],[32.0958192,36.4901288]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000006',
        code: 'ALN-MHM-BAR-002',
        name: 'Bölge #06',
        street: 'Bölge #06',
        lat: 36.486924,
        lng: 32.098406,
        areaM2: 12474,
        polygon: [[32.0992793,36.486692],[32.0984803,36.4861761],[32.0975402,36.4871588],[32.0983235,36.4876703],[32.0992793,36.486692]] as [number, number][],
        weight: 5.0,
        owner: fbId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000008',
        code: 'ALN-MHM-BAR-004',
        name: 'Bölge #08',
        street: 'Bölge #08',
        lat: 36.485920,
        lng: 32.099625,
        areaM2: 13448,
        polygon: [[32.0992793,36.486692],[32.0997931,36.4861538],[32.0998838,36.4860588],[32.1002167,36.4856453],[32.1002342,36.485611],[32.0994852,36.4851036],[32.0984803,36.4861761],[32.0992793,36.486692]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000004',
        code: 'ALN-MHM-KUM-004',
        name: 'Bölge #09',
        street: 'Bölge #09',
        lat: 36.491036,
        lng: 32.095672,
        areaM2: 32514,
        polygon: [[32.0972255,36.4911452],[32.0966769,36.4907487],[32.0958192,36.4901288],[32.0954873,36.4904469],[32.0951919,36.4907173],[32.0946331,36.4912206],[32.0943876,36.4914313],[32.0959528,36.4924473],[32.0972255,36.4911452]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000009',
        code: 'ALN-MHM-ATA-001',
        name: 'Bölge #10',
        street: 'Bölge #10',
        lat: 36.492025,
        lng: 32.096939,
        areaM2: 14841,
        polygon: [[32.0979262,36.4915918],[32.0972255,36.4911452],[32.0959528,36.4924473],[32.0966525,36.4929161],[32.0979262,36.4915918]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'owned' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000010',
        code: 'ALN-MHM-ATA-002',
        name: 'Bölge #11',
        street: 'Bölge #11',
        lat: 36.491199,
        lng: 32.099000,
        areaM2: 13983,
        polygon: [[32.0979262,36.4915918],[32.0983562,36.4918914],[32.0987107,36.4921254],[32.0987779,36.4920113],[32.0993138,36.4913998],[32.0997584,36.4909577],[32.0998908,36.4908405],[32.0995829,36.4906793],[32.0992361,36.4905279],[32.0991991,36.4905279],[32.0987645,36.4908095],[32.098486,36.4910254],[32.0979262,36.4915918]] as [number, number][],
        weight: 1.2,
        owner: gsId,
        status: 'protected' as const,
      },
      {
        id: 'f0000000-0000-0000-0000-000000000012',
        code: 'ALN-MHM-VAT-001',
        name: 'Bölge #12',
        street: 'Bölge #12',
        lat: 36.488386,
        lng: 32.101472,
        areaM2: 14346,
        polygon: [[32.1004118,36.4889766],[32.1003063,36.4890856],[32.1003573,36.4891125],[32.1010663,36.4895409],[32.1021278,36.4884069],[32.1021462,36.4883404],[32.1021134,36.4882914],[32.1020264,36.4882463],[32.1020053,36.4881786],[32.1020217,36.4881315],[32.1018378,36.488072],[32.1015937,36.488007],[32.1014505,36.4879718],[32.1014093,36.4879503],[32.1013487,36.4879187],[32.101326,36.4879444],[32.1004118,36.4889766]] as [number, number][],
        weight: 1.0,
        owner: null,
        status: 'neutral' as const,
      }
    ];

    for (const f of frontDefs) {
      const ring = f.polygon;
      const named = (pilotFrontNames.names as Record<string, RegisteredFrontName>)[f.id];

      this.fronts.set(f.id, {
        id: f.id,
        mapVersionId: mapVerId,
        cityRegionId: cityId,
        neighborhoodRegionId: neighborhoodId,
        frontCode: f.code,
        displayNameI18n: { tr: named?.name ?? f.name, en: named?.name ?? f.name },
        streetName: named?.streetName ?? f.street,
        naming: named ? { baseName: named.baseName, source: named.source, osmIds: named.osmIds, locality: named.locality } : undefined,
        center: { latitude: f.lat, longitude: f.lng },
        geometry: ring,
        areaM2: 24000,
        geometryHash: `hash_${f.code}`,
        safetyStatus: 'approved',
        enabled: true,
        defaultWeight: f.weight,
      });

      // Play Zone
      const pzId = `pz-${f.code}`;
      this.playZones.set(pzId, {
        id: pzId,
        frontId: f.id,
        geometry: ring,
        center: { latitude: f.lat, longitude: f.lng },
        labelI18n: { tr: `${named?.name ?? f.street} Katılım Alanı`, en: `${named?.name ?? f.street} Participation Area` },
        status: 'approved',
      });

      // Weight
      this.frontSeasonWeights.set(`${footballSeasonId}:${f.id}`, {
        seasonId: footballSeasonId,
        frontId: f.id,
        weight: clampWeight(f.weight),
        methodVersion: 'density_v1',
      });
      this.frontSeasonWeights.set(`${gamingSeasonId}:${f.id}`, {
        seasonId: gamingSeasonId,
        frontId: f.id,
        weight: clampWeight(f.weight),
        methodVersion: 'density_v1',
      });

      // Front state (football)
      const battleId = f.id === 'f0000000-0000-0000-0000-000000000003' ? 'bb000000-0000-0000-0000-000000000001' : null;
      this.seasonFrontStates.set(`${footballSeasonId}:${f.id}`, {
        seasonId: footballSeasonId,
        frontId: f.id,
        ownerTeamId: f.owner,
        status: f.status,
        activeBattleId: battleId,
        protectionUntil: (f as any).protectionUntil ?? null,
        cooldownUntil: null,
        version: 1,
        lastChangedAt: now,
      });

      // Front state (gaming - independent league!)
      const gamingOwner = f.id.endsWith('1') || f.id.endsWith('2') ? pcId : f.id.endsWith('5') ? psId : null;
      this.seasonFrontStates.set(`${gamingSeasonId}:${f.id}`, {
        seasonId: gamingSeasonId,
        frontId: f.id,
        ownerTeamId: gamingOwner,
        status: gamingOwner ? 'owned' : 'neutral',
        activeBattleId: null,
        protectionUntil: null,
        cooldownUntil: null,
        version: 1,
        lastChangedAt: now,
      });
    }

    // 8. Active Battle on Kumru 03 (Kumru Sokak / Cephe 03)
    const activeBattleId = 'bb000000-0000-0000-0000-000000000001';
    const kumru03Id = 'f0000000-0000-0000-0000-000000000003';
    this.battles.set(activeBattleId, {
      id: activeBattleId,
      seasonId: footballSeasonId,
      frontId: kumru03Id,
      mode: 'attack',
      status: 'active',
      defenderTeamId: gsId,
      attackerTeamId: fbId,
      createdBy: '33333333-3333-3333-3333-333333333333',
      rulesSnapshotJson: { min_attackers: 3, duration_hours: 24 },
      rulesSnapshotHash: 'battle_rules_hash_01',
      proposedAt: new Date(now.getTime() - 6 * 3600000),
      proposalExpiresAt: null,
      startsAt: new Date(now.getTime() - 5 * 3600000),
      endsAt: new Date(now.getTime() + 19 * 3600000), // 19 hours remaining
      settledAt: null,
      winnerTeamId: null,
      outcome: null,
    });

    // Sample contributions on active battle (GS: 12, FB: 15)
    // FB is currently leading the attack 15 to 12
    for (let i = 1; i <= 12; i++) {
      const uId = `gs_contrib_user_${i}`;
      const cId = `contrib_gs_${i}`;
      this.battleContributions.set(cId, {
        id: cId,
        battleId: activeBattleId,
        seasonId: footballSeasonId,
        frontId: kumru03Id,
        userId: uId,
        teamId: gsId,
        challengeId: `ch_gs_${i}`,
        status: 'approved',
        decisionCode: 'APPROVED',
        idempotencyKey: `idem_gs_${i}`,
        submittedAt: new Date(now.getTime() - (5 - i * 0.3) * 3600000),
        approvedAt: new Date(now.getTime() - (5 - i * 0.3) * 3600000),
      });
    }

    for (let i = 1; i <= 15; i++) {
      const uId = `fb_contrib_user_${i}`;
      const cId = `contrib_fb_${i}`;
      this.battleContributions.set(cId, {
        id: cId,
        battleId: activeBattleId,
        seasonId: footballSeasonId,
        frontId: kumru03Id,
        userId: uId,
        teamId: fbId,
        challengeId: `ch_fb_${i}`,
        status: 'approved',
        decisionCode: 'APPROVED',
        idempotencyKey: `idem_fb_${i}`,
        submittedAt: new Date(now.getTime() - (5 - i * 0.25) * 3600000),
        approvedAt: new Date(now.getTime() - (5 - i * 0.25) * 3600000),
      });
    }

    // 1 pending review contribution (suspicious)
    this.battleContributions.set('contrib_suspicious_1', {
      id: 'contrib_suspicious_1',
      battleId: activeBattleId,
      seasonId: footballSeasonId,
      frontId: kumru03Id,
      userId: 'sus_user_1',
      teamId: fbId,
      challengeId: 'ch_sus_1',
      status: 'pending',
      riskBucket: 'high',
      decisionCode: 'INTEGRITY_SUSPICIOUS',
      idempotencyKey: 'idem_sus_1',
      submittedAt: new Date(now.getTime() - 10000),
      approvedAt: null,
    });
    this.reviewCases.set('case-1', {
      id: 'case-1',
      userId: 'sus_user_1',
      contributionId: 'contrib_suspicious_1',
      battleId: activeBattleId,
      caseType: 'SUSPICIOUS_INTEGRITY',
      reasonCodes: ['INTEGRITY_FAIL_MOCK_DETECTED', 'ACCURACY_POOR'],
      status: 'open',
      createdAt: new Date(),
    });

    // 9. Seed the Electoral Scenario: 80 GS distinct voters vs 160 FB distinct voters in Alanya!
    this.seedElectoralStress(footballSeasonId, cityId, gsId, fbId, frontDefs[0].id, frontDefs[4].id);

    // Initial audit log
    this.adminAuditLogs.push({
      id: 1,
      adminUserId: adminId,
      action: 'SYSTEM_BOOTSTRAP',
      targetType: 'SYSTEM',
      targetId: 'cepheland',
      reason: 'Sistem ilk kurulumu ve Alanya pilot haritası yayını',
      createdAt: new Date(),
    });
  }

  seedElectoralStress(
    seasonId: string,
    cityId: string,
    gsId: string,
    fbId: string,
    gsFrontId: string,
    fbFrontId: string
  ) {
    // 80 unique GS voters
    for (let i = 1; i <= 80; i++) {
      const uId = `electoral_gs_user_${i}`;
      this.seasonVoters.set(`${seasonId}:${uId}`, {
        seasonId,
        userId: uId,
        teamId: gsId,
        cityRegionId: cityId,
        firstFrontId: gsFrontId,
        firstApprovedContributionId: `contrib_gs_stress_${i}`,
        status: 'verified',
        registeredAt: new Date(Date.now() - 2 * 86400000),
      });
    }

    // 160 unique FB voters
    for (let i = 1; i <= 160; i++) {
      const uId = `electoral_fb_user_${i}`;
      this.seasonVoters.set(`${seasonId}:${uId}`, {
        seasonId,
        userId: uId,
        teamId: fbId,
        cityRegionId: cityId,
        firstFrontId: fbFrontId,
        firstApprovedContributionId: `contrib_fb_stress_${i}`,
        status: 'verified',
        registeredAt: new Date(Date.now() - 2 * 86400000),
      });
    }
  }
}

export const dbStore = new InMemoryStore();
