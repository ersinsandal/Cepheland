-- CEPHELAND Complementary Schema Migration 002
-- Master Blueprint EK A (Tables 08.4)

CREATE TABLE IF NOT EXISTS auth_identities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  provider text NOT NULL CHECK(provider IN ('otp_email','otp_phone','google','apple','passkey')),
  provider_subject_hash char(64) NOT NULL,
  provider_metadata_encrypted bytea,
  linked_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz,
  UNIQUE(provider, provider_subject_hash)
);
CREATE INDEX IF NOT EXISTS ix_auth_identities_user ON auth_identities(user_id);

CREATE TABLE IF NOT EXISTS notification_preferences (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  battle_alerts boolean NOT NULL DEFAULT true,
  front_alerts boolean NOT NULL DEFAULT true,
  season_alerts boolean NOT NULL DEFAULT true,
  security_alerts boolean NOT NULL DEFAULT true,
  marketing_opt_in boolean NOT NULL DEFAULT false,
  quiet_start time,
  quiet_end time,
  timezone text NOT NULL DEFAULT 'Europe/Istanbul',
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE NULLS NOT DISTINCT (user_id, league_id)
);

CREATE TABLE IF NOT EXISTS push_tokens (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  platform text NOT NULL CHECK(platform IN ('ios','android')),
  token_ciphertext bytea NOT NULL,
  token_lookup_hash char(64) NOT NULL UNIQUE,
  last_valid_at timestamptz,
  revoked_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS favorite_fronts (
  user_id uuid NOT NULL REFERENCES users(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(user_id, season_id, front_id)
);

CREATE TABLE IF NOT EXISTS privacy_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  type text NOT NULL CHECK(type IN ('export','delete','restrict','correct')),
  status text NOT NULL DEFAULT 'requested'
    CHECK(status IN ('requested','verifying','processing','completed','declined')),
  data_package_key text,
  request_reason text,
  resolution_reason text,
  requested_at timestamptz NOT NULL DEFAULT now(),
  fulfilled_at timestamptz
);
CREATE INDEX IF NOT EXISTS ix_privacy_requests_status ON privacy_requests(status, requested_at);

CREATE TABLE IF NOT EXISTS user_blocks (
  blocker_user_id uuid NOT NULL REFERENCES users(id),
  blocked_user_id uuid NOT NULL REFERENCES users(id),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(blocker_user_id, blocked_user_id),
  CHECK(blocker_user_id <> blocked_user_id)
);

CREATE TABLE IF NOT EXISTS support_tickets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  category text NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','in_progress','waiting_user','resolved','closed')),
  assigned_admin_user_id uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  closed_at timestamptz
);

CREATE TABLE IF NOT EXISTS security_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  claim_id uuid REFERENCES battle_contributions(id),
  type text NOT NULL,
  reason_codes text[] NOT NULL DEFAULT ARRAY[]::text[],
  risk_bucket text CHECK(risk_bucket IN ('low','medium','high')),
  encrypted_evidence bytea,
  created_at timestamptz NOT NULL DEFAULT now(),
  retain_until timestamptz NOT NULL
);
CREATE INDEX IF NOT EXISTS ix_security_events_retain ON security_events(retain_until);
CREATE INDEX IF NOT EXISTS ix_security_events_user ON security_events(user_id, created_at DESC);

CREATE TABLE IF NOT EXISTS battle_reversals (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  battle_id uuid NOT NULL REFERENCES battles(id),
  decision_json jsonb NOT NULL,
  reason text NOT NULL,
  requested_by uuid NOT NULL REFERENCES admin_users(user_id),
  reviewed_by uuid REFERENCES admin_users(user_id),
  status text NOT NULL DEFAULT 'requested'
    CHECK(status IN ('requested','approved','rejected','applied')),
  created_at timestamptz NOT NULL DEFAULT now(),
  applied_at timestamptz,
  CHECK(reviewed_by IS NULL OR requested_by <> reviewed_by)
);

CREATE TABLE IF NOT EXISTS season_awards (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  user_id uuid REFERENCES users(id),
  team_id uuid REFERENCES teams(id),
  award_code text NOT NULL,
  reason_ref text,
  awarded_at timestamptz NOT NULL DEFAULT now(),
  CHECK((user_id IS NOT NULL) <> (team_id IS NOT NULL))
);
CREATE UNIQUE INDEX IF NOT EXISTS uq_season_user_award
  ON season_awards(season_id, user_id, award_code) WHERE user_id IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS uq_season_team_award
  ON season_awards(season_id, team_id, award_code) WHERE team_id IS NOT NULL;

CREATE TABLE IF NOT EXISTS season_final_snapshots (
  season_id uuid NOT NULL REFERENCES seasons(id),
  region_id uuid NOT NULL REFERENCES geographic_regions(id),
  finalized_json jsonb NOT NULL,
  snapshot_hash char(64) NOT NULL,
  published_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id, region_id)
);

CREATE TABLE IF NOT EXISTS map_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  source_type text NOT NULL,
  source_version text,
  input_hash char(64) NOT NULL,
  status text NOT NULL DEFAULT 'queued'
    CHECK(status IN ('queued','running','failed','completed','cancelled')),
  stats jsonb NOT NULL DEFAULT '{}'::jsonb,
  error_message text,
  created_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  finished_at timestamptz,
  UNIQUE(map_version_id, input_hash)
);

CREATE TABLE IF NOT EXISTS app_feature_flags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  flag_key text NOT NULL,
  scope_type text NOT NULL DEFAULT 'global',
  scope_id uuid,
  value_json jsonb NOT NULL,
  updated_by uuid REFERENCES admin_users(user_id),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE NULLS NOT DISTINCT(flag_key, scope_type, scope_id),
  CHECK(scope_type='global' OR scope_id IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS localized_copy (
  copy_key text NOT NULL,
  locale varchar(10) NOT NULL,
  content text NOT NULL,
  revision integer NOT NULL DEFAULT 1,
  PRIMARY KEY(copy_key, locale)
);

CREATE TABLE IF NOT EXISTS asset_license_registry (
  asset_key text PRIMARY KEY,
  rights_holder text NOT NULL,
  license_text text NOT NULL,
  evidence_url text,
  allowed_uses text[] NOT NULL DEFAULT ARRAY[]::text[],
  expires_at timestamptz,
  verified_by uuid REFERENCES admin_users(user_id),
  verified_at timestamptz
);

CREATE TABLE IF NOT EXISTS analytics_events (
  id bigserial PRIMARY KEY,
  pseudonymous_user_id uuid,
  event_type text NOT NULL,
  properties jsonb NOT NULL DEFAULT '{}'::jsonb,
  consent_scope text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS ix_analytics_time_type ON analytics_events(created_at, event_type);

CREATE TABLE IF NOT EXISTS billing_accounts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_type text NOT NULL CHECK(customer_type IN ('user','organization')),
  user_id uuid REFERENCES users(id),
  processor_customer_ref text UNIQUE,
  status text NOT NULL DEFAULT 'inactive',
  created_at timestamptz NOT NULL DEFAULT now()
);
