-- CEPHELAND Core Schema Migration 001
-- Master Blueprint Section 08.3

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  handle varchar(32) NOT NULL UNIQUE,
  display_name varchar(72) NOT NULL,
  locale varchar(10) NOT NULL DEFAULT 'tr',
  birth_year smallint,
  email_ciphertext bytea,
  phone_ciphertext bytea,
  email_lookup_hash char(64),
  phone_lookup_hash char(64),
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','limited','suspended','deleted')),
  age_18_confirmed_at timestamptz,
  terms_version text NOT NULL,
  privacy_version text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);
CREATE UNIQUE INDEX IF NOT EXISTS uq_phone_hash_not_null ON users(phone_lookup_hash)
  WHERE phone_lookup_hash IS NOT NULL AND status <> 'deleted';
CREATE UNIQUE INDEX IF NOT EXISTS uq_email_hash_not_null ON users(email_lookup_hash)
  WHERE email_lookup_hash IS NOT NULL AND status <> 'deleted';

CREATE TABLE IF NOT EXISTS admin_users (
  user_id uuid PRIMARY KEY REFERENCES users(id),
  role text NOT NULL CHECK(role IN ('super_admin','league_admin','map_editor','moderator','analyst','support')),
  mfa_enabled boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS user_devices (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  platform text NOT NULL CHECK(platform IN ('android','ios','web')),
  device_key_hash char(64),
  attest_key_id text,
  app_version text,
  integrity_status text NOT NULL DEFAULT 'unknown',
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz
);
CREATE INDEX IF NOT EXISTS ix_devices_user ON user_devices(user_id);

CREATE TABLE IF NOT EXISTS auth_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  refresh_token_hash char(64) NOT NULL UNIQUE,
  device_id uuid REFERENCES user_devices(id),
  expires_at timestamptz NOT NULL,
  revoked_at timestamptz,
  last_seen_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_sessions_user ON auth_sessions(user_id,expires_at);

CREATE TABLE IF NOT EXISTS leagues (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug varchar(72) NOT NULL UNIQUE,
  name_i18n jsonb NOT NULL,
  description_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  banner_asset_key text,
  status text NOT NULL DEFAULT 'draft'
    CHECK(status IN ('draft','review','scheduled','active','paused','archived')),
  timezone text NOT NULL DEFAULT 'Europe/Istanbul',
  age_min smallint NOT NULL DEFAULT 18 CHECK(age_min >= 18),
  allowed_country_codes text[] NOT NULL DEFAULT ARRAY['TR'],
  public_at timestamptz,
  created_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS teams (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  slug varchar(72) NOT NULL,
  name_i18n jsonb NOT NULL,
  about_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  color_primary char(7) NOT NULL,
  color_secondary char(7) NOT NULL,
  emblem_asset_key text,
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','disabled')),
  order_no integer NOT NULL DEFAULT 0,
  UNIQUE(league_id, slug),
  UNIQUE(id, league_id)
);

CREATE TABLE IF NOT EXISTS league_rule_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  version integer NOT NULL,
  rules_json jsonb NOT NULL,
  rules_hash char(64) NOT NULL,
  approved_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(league_id, version)
);

CREATE TABLE IF NOT EXISTS seasons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  title_i18n jsonb NOT NULL,
  status text NOT NULL DEFAULT 'scheduled'
    CHECK(status IN ('draft','scheduled','active','closing','finished','archived')),
  rule_version_id uuid NOT NULL REFERENCES league_rule_versions(id),
  championship_metric text NOT NULL DEFAULT 'weighted_control'
    CHECK(championship_metric IN ('weighted_control','front_count','verified_support')),
  starts_at timestamptz NOT NULL,
  ends_at timestamptz NOT NULL,
  freeze_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  CHECK(ends_at > starts_at),
  UNIQUE(id, league_id)
);
CREATE UNIQUE INDEX IF NOT EXISTS uq_active_season_per_league ON seasons(league_id)
  WHERE status='active';
CREATE INDEX IF NOT EXISTS ix_seasons_schedule ON seasons(league_id, starts_at, ends_at);

CREATE TABLE IF NOT EXISTS league_memberships (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  league_id uuid NOT NULL REFERENCES leagues(id),
  team_id uuid NOT NULL,
  joined_at timestamptz NOT NULL DEFAULT now(),
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','banned','removed')),
  UNIQUE(user_id, season_id),
  FOREIGN KEY(team_id, league_id) REFERENCES teams(id, league_id),
  FOREIGN KEY(season_id, league_id) REFERENCES seasons(id, league_id)
);
CREATE INDEX IF NOT EXISTS ix_memberships_team ON league_memberships(season_id, team_id);

CREATE TABLE IF NOT EXISTS geographic_regions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  parent_id uuid REFERENCES geographic_regions(id),
  level text NOT NULL CHECK(level IN ('country','province','city','district','neighborhood')),
  canonical_code varchar(72) UNIQUE,
  name_i18n jsonb NOT NULL,
  geom geometry(MultiPolygon,4326),
  center geometry(Point,4326),
  is_playable boolean NOT NULL DEFAULT true,
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_regions_geom ON geographic_regions USING gist(geom);
CREATE INDEX IF NOT EXISTS ix_regions_parent ON geographic_regions(parent_id);

CREATE TABLE IF NOT EXISTS map_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  version integer NOT NULL,
  name text NOT NULL,
  source_version text,
  status text NOT NULL DEFAULT 'draft'
    CHECK(status IN ('draft','review','published','retired')),
  reviewed_by uuid REFERENCES admin_users(user_id),
  published_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(city_region_id, version)
);

CREATE TABLE IF NOT EXISTS fronts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  neighborhood_region_id uuid REFERENCES geographic_regions(id),
  front_code varchar(80) NOT NULL,
  display_name_i18n jsonb NOT NULL,
  street_name text,
  geom geometry(MultiPolygon,4326) NOT NULL,
  center geometry(Point,4326) NOT NULL,
  h3_index varchar(20),
  area_m2 double precision NOT NULL CHECK(area_m2 > 0),
  geometry_hash char(64) NOT NULL,
  safety_status text NOT NULL DEFAULT 'pending'
    CHECK(safety_status IN ('pending','approved','suspended','rejected')),
  enabled boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(map_version_id, front_code)
);
CREATE INDEX IF NOT EXISTS ix_fronts_geom ON fronts USING gist(geom);
CREATE INDEX IF NOT EXISTS ix_fronts_center ON fronts USING gist(center);
CREATE INDEX IF NOT EXISTS ix_fronts_city_map ON fronts(city_region_id, map_version_id, enabled);

CREATE TABLE IF NOT EXISTS play_zones (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  front_id uuid NOT NULL REFERENCES fronts(id),
  geom geometry(MultiPolygon,4326) NOT NULL,
  label_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  safety_notes text,
  safe_hours_json jsonb,
  status text NOT NULL DEFAULT 'pending'
    CHECK(status IN ('pending','approved','suspended','disabled')),
  reviewed_by uuid REFERENCES admin_users(user_id),
  reviewed_at timestamptz
);
CREATE INDEX IF NOT EXISTS ix_play_zones_geom ON play_zones USING gist(geom);
CREATE INDEX IF NOT EXISTS ix_play_zones_front ON play_zones(front_id, status);

CREATE TABLE IF NOT EXISTS front_adjacencies (
  front_id_a uuid NOT NULL REFERENCES fronts(id),
  front_id_b uuid NOT NULL REFERENCES fronts(id),
  walkable boolean NOT NULL DEFAULT false,
  PRIMARY KEY(front_id_a, front_id_b),
  CHECK(front_id_a <> front_id_b),
  CHECK(front_id_a < front_id_b)
);

CREATE TABLE IF NOT EXISTS front_lineage (
  predecessor_front_id uuid NOT NULL REFERENCES fronts(id),
  successor_front_id uuid NOT NULL REFERENCES fronts(id),
  reason text NOT NULL,
  PRIMARY KEY(predecessor_front_id, successor_front_id)
);

CREATE TABLE IF NOT EXISTS league_territory_maps (
  season_id uuid NOT NULL REFERENCES seasons(id),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  PRIMARY KEY(season_id, map_version_id)
);

CREATE TABLE IF NOT EXISTS battles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  mode text NOT NULL CHECK(mode IN ('neutral_open','attack')),
  status text NOT NULL DEFAULT 'proposed'
    CHECK(status IN ('proposed','active','paused','settling','under_review','finalized','cancelled','expired')),
  defender_team_id uuid REFERENCES teams(id),
  attacker_team_id uuid REFERENCES teams(id),
  created_by uuid REFERENCES users(id),
  rules_snapshot_json jsonb NOT NULL,
  rules_snapshot_hash char(64) NOT NULL,
  proposed_at timestamptz NOT NULL DEFAULT now(),
  proposal_expires_at timestamptz,
  starts_at timestamptz,
  ends_at timestamptz,
  settled_at timestamptz,
  winner_team_id uuid REFERENCES teams(id),
  outcome text CHECK(outcome IN ('capture','defended','neutral_remains','cancelled')),
  tally_hash char(64),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(id, season_id, front_id),
  CHECK(mode='neutral_open' OR (defender_team_id IS NOT NULL AND attacker_team_id IS NOT NULL)),
  CHECK(attacker_team_id IS NULL OR attacker_team_id <> defender_team_id)
);
CREATE UNIQUE INDEX IF NOT EXISTS uq_one_live_battle_per_front_season
  ON battles(season_id, front_id)
  WHERE status IN ('proposed','active','paused','settling','under_review');
CREATE INDEX IF NOT EXISTS ix_battles_due ON battles(status, ends_at) WHERE status IN ('active','settling');
CREATE INDEX IF NOT EXISTS ix_battles_by_front ON battles(season_id, front_id, created_at DESC);

CREATE TABLE IF NOT EXISTS season_front_states (
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  owner_team_id uuid REFERENCES teams(id),
  status text NOT NULL DEFAULT 'neutral'
    CHECK(status IN ('neutral','owned','contested','protected','suspended','archived')),
  active_battle_id uuid REFERENCES battles(id),
  protection_until timestamptz,
  cooldown_until timestamptz,
  version bigint NOT NULL DEFAULT 1,
  last_changed_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id, front_id)
);
CREATE INDEX IF NOT EXISTS ix_front_states_owner ON season_front_states(season_id, owner_team_id, status);
CREATE INDEX IF NOT EXISTS ix_front_states_protection ON season_front_states(protection_until);

CREATE TABLE IF NOT EXISTS front_season_weights (
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  weight numeric(4,2) NOT NULL CHECK(weight >= 1.0 AND weight <= 5.0),
  method_version text NOT NULL,
  input_summary jsonb NOT NULL DEFAULT '{}'::jsonb,
  approved_by uuid REFERENCES admin_users(user_id),
  approved_at timestamptz,
  PRIMARY KEY(season_id, front_id)
);

CREATE TABLE IF NOT EXISTS claim_challenges (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  battle_id uuid REFERENCES battles(id),
  action text NOT NULL,
  nonce_hash char(64) NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  consumed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_claim_challenges_user ON claim_challenges(user_id, expires_at);

CREATE TABLE IF NOT EXISTS location_proofs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  challenge_id uuid NOT NULL UNIQUE REFERENCES claim_challenges(id),
  user_id uuid NOT NULL REFERENCES users(id),
  encrypted_samples bytea,
  coarse_h3_index varchar(20),
  accuracy_m numeric(7,2),
  server_verified_at timestamptz NOT NULL DEFAULT now(),
  retain_until timestamptz NOT NULL,
  verdict text NOT NULL CHECK(verdict IN ('pass','review','fail')),
  public_coordinates_available boolean NOT NULL DEFAULT false
    CHECK(public_coordinates_available=false)
);
CREATE INDEX IF NOT EXISTS ix_location_retain ON location_proofs(retain_until);

CREATE TABLE IF NOT EXISTS battle_contributions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  battle_id uuid NOT NULL REFERENCES battles(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  user_id uuid NOT NULL REFERENCES users(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  challenge_id uuid NOT NULL UNIQUE REFERENCES claim_challenges(id),
  proof_id uuid REFERENCES location_proofs(id),
  status text NOT NULL DEFAULT 'pending'
    CHECK(status IN ('reserved','pending','approved','rejected','voided')),
  risk_bucket text CHECK(risk_bucket IN ('low','medium','high')),
  decision_code text,
  idempotency_key uuid NOT NULL,
  submitted_at timestamptz NOT NULL DEFAULT now(),
  approved_at timestamptz,
  voided_at timestamptz,
  UNIQUE(battle_id, user_id),
  UNIQUE(user_id, idempotency_key),
  FOREIGN KEY(battle_id, season_id, front_id) REFERENCES battles(id, season_id, front_id)
);
CREATE INDEX IF NOT EXISTS ix_contributions_battle_status ON battle_contributions(battle_id, status, team_id);
CREATE INDEX IF NOT EXISTS ix_contributions_user_time ON battle_contributions(user_id, submitted_at DESC);

CREATE TABLE IF NOT EXISTS battle_team_tallies (
  battle_id uuid NOT NULL REFERENCES battles(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  approved_unique_players integer NOT NULL CHECK(approved_unique_players>=0),
  finalized_at timestamptz NOT NULL,
  PRIMARY KEY(battle_id, team_id)
);

CREATE TABLE IF NOT EXISTS season_voters (
  season_id uuid NOT NULL REFERENCES seasons(id),
  user_id uuid NOT NULL REFERENCES users(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  neighborhood_region_id uuid REFERENCES geographic_regions(id),
  first_front_id uuid NOT NULL REFERENCES fronts(id),
  first_approved_contribution_id uuid NOT NULL UNIQUE REFERENCES battle_contributions(id),
  status text NOT NULL DEFAULT 'verified'
    CHECK(status IN ('verified','review','voided')),
  registered_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id, user_id)
);
CREATE INDEX IF NOT EXISTS ix_voters_city_team ON season_voters(season_id, city_region_id, team_id, status);

CREATE TABLE IF NOT EXISTS battle_events (
  id bigserial PRIMARY KEY,
  battle_id uuid NOT NULL REFERENCES battles(id),
  event_type text NOT NULL,
  details jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_battle_events_history ON battle_events(battle_id, id);

CREATE TABLE IF NOT EXISTS front_ownership_history (
  id bigserial PRIMARY KEY,
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  battle_id uuid REFERENCES battles(id),
  old_owner_team_id uuid REFERENCES teams(id),
  new_owner_team_id uuid REFERENCES teams(id),
  changed_at timestamptz NOT NULL DEFAULT now(),
  reason text NOT NULL,
  UNIQUE(battle_id)
);
CREATE INDEX IF NOT EXISTS ix_ownership_history_front ON front_ownership_history(season_id, front_id, changed_at DESC);

CREATE TABLE IF NOT EXISTS ranking_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  region_id uuid NOT NULL REFERENCES geographic_regions(id),
  snapshot_version bigint NOT NULL,
  metric_json jsonb NOT NULL,
  calculated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(season_id, region_id, snapshot_version)
);

CREATE TABLE IF NOT EXISTS notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  type text NOT NULL,
  title_i18n jsonb NOT NULL,
  body_i18n jsonb NOT NULL,
  deep_link text,
  payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  read_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_notifications_user_time ON notifications(user_id, created_at DESC);

CREATE TABLE IF NOT EXISTS user_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  reporter_user_id uuid REFERENCES users(id),
  target_type text NOT NULL CHECK(target_type IN ('front','battle','user','team','map','other')),
  target_id uuid,
  reason text NOT NULL,
  description text,
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','triaged','resolved','dismissed')),
  created_at timestamptz NOT NULL DEFAULT now(),
  closed_at timestamptz
);

CREATE TABLE IF NOT EXISTS review_cases (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  contribution_id uuid REFERENCES battle_contributions(id),
  battle_id uuid REFERENCES battles(id),
  case_type text NOT NULL,
  reason_codes text[] NOT NULL DEFAULT ARRAY[]::text[],
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','investigating','escalated','approved','rejected','closed')),
  assigned_admin_id uuid REFERENCES admin_users(user_id),
  resolution text,
  created_at timestamptz NOT NULL DEFAULT now(),
  resolved_at timestamptz
);

CREATE TABLE IF NOT EXISTS moderation_actions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  subject_user_id uuid REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  action text NOT NULL,
  reason text NOT NULL,
  case_id uuid REFERENCES review_cases(id),
  performed_by uuid NOT NULL REFERENCES admin_users(user_id),
  effective_from timestamptz NOT NULL DEFAULT now(),
  effective_until timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS admin_audit_logs (
  id bigserial PRIMARY KEY,
  admin_user_id uuid NOT NULL REFERENCES admin_users(user_id),
  action text NOT NULL,
  target_type text NOT NULL,
  target_id text,
  before_json jsonb,
  after_json jsonb,
  reason text,
  request_id text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_admin_audit_by_admin ON admin_audit_logs(admin_user_id, created_at DESC);

CREATE TABLE IF NOT EXISTS outbox_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  aggregate_type text NOT NULL,
  aggregate_id uuid NOT NULL,
  event_type text NOT NULL,
  payload jsonb NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  processed_at timestamptz,
  attempts integer NOT NULL DEFAULT 0
);
CREATE INDEX IF NOT EXISTS ix_outbox_unprocessed ON outbox_events(created_at)
  WHERE processed_at IS NULL;
