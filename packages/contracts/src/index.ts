import { z } from 'zod';

/**
 * Standard RFC 9457 Problem Details Error Schema
 */
export const ApiErrorSchema = z.object({
  type: z.string().optional(),
  title: z.string(),
  status: z.number(),
  code: z.string(),
  detail: z.string(),
  instance: z.string().optional(),
  requestId: z.string(),
  retryAfter: z.number().optional(),
});
export type ApiError = z.infer<typeof ApiErrorSchema>;

/**
 * Auth Schemas
 */
export const AuthStartSchema = z.object({
  identifier: z.string().min(3),
  channel: z.enum(['phone', 'email']),
  locale: z.enum(['tr', 'en']).default('tr'),
});
export type AuthStartRequest = z.infer<typeof AuthStartSchema>;

export const AuthVerifySchema = z.object({
  identifier: z.string().min(3),
  code: z.string().length(6),
  platform: z.enum(['android', 'ios', 'web']).default('web'),
  deviceId: z.string().optional(),
  appVersion: z.string().optional(),
});
export type AuthVerifyRequest = z.infer<typeof AuthVerifySchema>;

export const AuthSessionSchema = z.object({
  accessToken: z.string(),
  refreshToken: z.string(),
  expiresIn: z.number(),
  tokenType: z.literal('Bearer'),
  user: z.object({
    id: z.string().uuid(),
    handle: z.string(),
    displayName: z.string(),
    locale: z.string(),
    status: z.enum(['active', 'limited', 'suspended']),
    age18Confirmed: z.boolean(),
  }),
});
export type AuthSession = z.infer<typeof AuthSessionSchema>;

/**
 * Leagues, Teams, Seasons
 */
export const TeamDtoSchema = z.object({
  id: z.string().uuid(),
  leagueId: z.string().uuid(),
  slug: z.string(),
  nameI18n: z.record(z.string()),
  aboutI18n: z.record(z.string()).optional(),
  colorPrimary: z.string(),
  colorSecondary: z.string(),
  emblemAssetKey: z.string().nullable().optional(),
  status: z.enum(['active', 'disabled']),
  orderNo: z.number(),
});
export type TeamDto = z.infer<typeof TeamDtoSchema>;

export const LeagueDtoSchema = z.object({
  id: z.string().uuid(),
  slug: z.string(),
  nameI18n: z.record(z.string()),
  descriptionI18n: z.record(z.string()),
  bannerAssetKey: z.string().nullable().optional(),
  status: z.enum(['draft', 'review', 'scheduled', 'active', 'paused', 'archived']),
  timezone: z.string(),
  ageMin: z.number(),
  allowedCountryCodes: z.array(z.string()),
  activeSeason: z.object({
    id: z.string().uuid(),
    titleI18n: z.record(z.string()),
    status: z.enum(['draft', 'scheduled', 'active', 'closing', 'finished', 'archived']),
    startsAt: z.string(),
    endsAt: z.string(),
    championshipMetric: z.enum(['weighted_control', 'front_count', 'verified_support']),
  }).nullable(),
  teams: z.array(TeamDtoSchema),
});
export type LeagueDto = z.infer<typeof LeagueDtoSchema>;

export const JoinTeamRequestSchema = z.object({
  seasonId: z.string().uuid(),
  teamId: z.string().uuid(),
});
export type JoinTeamRequest = z.infer<typeof JoinTeamRequestSchema>;

/**
 * Fronts & Maps
 */
export const PlayZoneDtoSchema = z.object({
  id: z.string().uuid(),
  frontId: z.string().uuid(),
  labelI18n: z.record(z.string()),
  safetyNotes: z.string().nullable().optional(),
  status: z.enum(['pending', 'approved', 'suspended', 'disabled']),
  geometry: z.array(z.tuple([z.number(), z.number()])),
  geometryRings: z.array(z.array(z.tuple([z.number(), z.number()]))).optional(),
});
export type PlayZoneDto = z.infer<typeof PlayZoneDtoSchema>;

export const FrontDtoSchema = z.object({
  id: z.string().uuid(),
  frontCode: z.string(),
  displayNameI18n: z.record(z.string()),
  streetName: z.string().nullable().optional(),
  areaM2: z.number(),
  center: z.object({ latitude: number(), longitude: number() }),
  geometry: z.array(z.tuple([z.number(), z.number()])),
  geometryRings: z.array(z.array(z.tuple([z.number(), z.number()]))).optional(),
  source: z.enum(['osm_block', 'open_land']).optional(),
  naming: z.object({
    baseName: z.string(),
    source: z.enum(['poi', 'street', 'locality', 'coordinate']),
    osmIds: z.array(z.string()),
    locality: z.string().optional(),
  }).optional(),
  weight: z.number(),
  status: z.enum(['neutral', 'owned', 'contested', 'protected', 'suspended', 'archived']),
  ownerTeamId: z.string().uuid().nullable(),
  ownerTeam: TeamDtoSchema.nullable().optional(),
  activeBattleId: z.string().uuid().nullable().optional(),
  protectionUntil: z.string().nullable().optional(),
  cooldownUntil: z.string().nullable().optional(),
  playZones: z.array(PlayZoneDtoSchema).optional(),
});
export type FrontDto = z.infer<typeof FrontDtoSchema>;

function number() {
  return z.number();
}

/**
 * Claim & Challenge Lifecycle
 */
export const ClaimChallengeRequestSchema = z.object({
  seasonId: z.string().uuid(),
  frontId: z.string().uuid(),
  action: z.enum(['join_battle', 'start_attack', 'start_neutral_claim', 'defend_front']),
  deviceId: z.string().optional(),
});
export type ClaimChallengeRequest = z.infer<typeof ClaimChallengeRequestSchema>;

export const ClaimChallengeResponseSchema = z.object({
  challengeId: z.string().uuid(),
  nonce: z.string(),
  expiresAt: z.string(),
  requiredIntegrityLevel: z.string(),
  serverTime: z.string(),
});
export type ClaimChallengeResponse = z.infer<typeof ClaimChallengeResponseSchema>;

export const LocationSampleSchema = z.object({
  latitude: z.number(),
  longitude: z.number(),
  accuracyMeters: z.number(),
  recordedAt: z.string(),
});
export type LocationSample = z.infer<typeof LocationSampleSchema>;

export const ClaimSubmitRequestSchema = z.object({
  challengeId: z.string().uuid(),
  idempotencyKey: z.string().uuid(),
  locationSamples: z.array(LocationSampleSchema).min(1),
  integrity: z.object({
    platform: z.enum(['android', 'ios', 'web']),
    signedProof: z.string().optional(),
  }),
});
export type ClaimSubmitRequest = z.infer<typeof ClaimSubmitRequestSchema>;

export const ClaimReceiptResponseSchema = z.object({
  claimId: z.string().uuid(),
  receiptId: z.string().uuid(),
  battleId: z.string().uuid(),
  frontId: z.string().uuid(),
  status: z.enum(['approved', 'pending_review', 'rejected', 'reserved']),
  counted: z.boolean(),
  decisionCode: z.string(),
  userMessageKey: z.string(),
  serverTime: z.string(),
  remainingDailyFronts: z.number(),
});
export type ClaimReceiptResponse = z.infer<typeof ClaimReceiptResponseSchema>;

/**
 * Battle Dtos
 */
export const BattleDtoSchema = z.object({
  id: z.string().uuid(),
  seasonId: z.string().uuid(),
  frontId: z.string().uuid(),
  mode: z.enum(['neutral_open', 'attack']),
  status: z.enum(['proposed', 'active', 'paused', 'settling', 'under_review', 'finalized', 'cancelled', 'expired']),
  defenderTeamId: z.string().uuid().nullable(),
  attackerTeamId: z.string().uuid().nullable(),
  startsAt: z.string().nullable(),
  endsAt: z.string().nullable(),
  proposalExpiresAt: z.string().nullable().optional(),
  winnerTeamId: z.string().uuid().nullable(),
  outcome: z.enum(['capture', 'defended', 'neutral_remains', 'cancelled']).nullable(),
  approvedCounts: z.record(z.number()),
  minAttackerRequired: z.number().default(3),
  viewerContributed: z.boolean().default(false),
});
export type BattleDto = z.infer<typeof BattleDtoSchema>;

/**
 * Rankings & Electoral View
 */
export const RankingTeamRowSchema = z.object({
  teamId: z.string().uuid(),
  slug: z.string(),
  nameI18n: z.record(z.string()),
  colorPrimary: z.string(),
  colorSecondary: z.string(),
  frontCount: z.number(),
  frontSharePercent: z.number(),
  verifiedSupportCount: z.number(),
  verifiedSupportSharePercent: z.number(),
  weightedControlScore: z.number(),
  weightedControlSharePercent: z.number(),
});
export type RankingTeamRow = z.infer<typeof RankingTeamRowSchema>;

export const RankingsResponseSchema = z.object({
  seasonId: z.string().uuid(),
  regionId: z.string(),
  regionName: z.string(),
  championshipMetric: z.enum(['weighted_control', 'front_count', 'verified_support']),
  championshipWinnerTeamId: z.string().uuid().nullable(),
  totalPlayableFronts: z.number(),
  totalVerifiedVoters: z.number(),
  totalPossibleWeight: z.number(),
  teams: z.array(RankingTeamRowSchema),
  updatedAt: z.string(),
});
export type RankingsResponse = z.infer<typeof RankingsResponseSchema>;
