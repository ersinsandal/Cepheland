-- CEPHELAND Stress Electoral Scenario Seed
-- Master Blueprint Section 06 & Acceptance Test G15/G16:
-- 80 GS distinct verified voters vs 160 FB distinct verified voters in Alanya

DO $$
DECLARE
  v_season_id uuid := 'e0000000-0000-0000-0000-000000000001';
  v_city_id uuid := 'a0000000-0000-0000-0000-000000000003';
  v_gs_team_id uuid := 'd0000000-0000-0000-0000-000000000001';
  v_fb_team_id uuid := 'd0000000-0000-0000-0000-000000000002';
  v_gs_front_id uuid := 'f0000000-0000-0000-0000-000000000001';
  v_fb_front_id uuid := 'f0000000-0000-0000-0000-000000000005';
  v_user_id uuid;
  v_challenge_id uuid;
  v_contribution_id uuid;
  i int;
BEGIN
  -- Insert 80 GS voters
  FOR i IN 1..80 LOOP
    v_user_id := gen_random_uuid();
    v_challenge_id := gen_random_uuid();
    v_contribution_id := gen_random_uuid();

    INSERT INTO users (id, handle, display_name, locale, terms_version, privacy_version, status, age_18_confirmed_at)
    VALUES (v_user_id, 'gs_voter_' || i, 'GS Destekçi ' || i, 'tr', 'v1.0', 'v1.0', 'active', now() - interval '30 days');

    INSERT INTO claim_challenges (id, user_id, season_id, front_id, action, nonce_hash, expires_at)
    VALUES (v_challenge_id, v_user_id, v_season_id, v_gs_front_id, 'join_battle', md5('gs_nonce_' || i), now() + interval '1 hour');

    INSERT INTO battle_contributions (id, battle_id, season_id, front_id, user_id, team_id, challenge_id, status, idempotency_key)
    VALUES (v_contribution_id, 'bb000000-0000-0000-0000-000000000001', v_season_id, v_gs_front_id, v_user_id, v_gs_team_id, v_challenge_id, 'approved', gen_random_uuid());

    INSERT INTO season_voters (season_id, user_id, team_id, city_region_id, first_front_id, first_approved_contribution_id, status)
    VALUES (v_season_id, v_user_id, v_gs_team_id, v_city_id, v_gs_front_id, v_contribution_id, 'verified');
  END LOOP;

  -- Insert 160 FB voters
  FOR i IN 1..160 LOOP
    v_user_id := gen_random_uuid();
    v_challenge_id := gen_random_uuid();
    v_contribution_id := gen_random_uuid();

    INSERT INTO users (id, handle, display_name, locale, terms_version, privacy_version, status, age_18_confirmed_at)
    VALUES (v_user_id, 'fb_voter_' || i, 'FB Destekçi ' || i, 'tr', 'v1.0', 'v1.0', 'active', now() - interval '30 days');

    INSERT INTO claim_challenges (id, user_id, season_id, front_id, action, nonce_hash, expires_at)
    VALUES (v_challenge_id, v_user_id, v_season_id, v_fb_front_id, 'join_battle', md5('fb_nonce_' || i), now() + interval '1 hour');

    INSERT INTO battle_contributions (id, battle_id, season_id, front_id, user_id, team_id, challenge_id, status, idempotency_key)
    VALUES (v_contribution_id, 'bb000000-0000-0000-0000-000000000001', v_season_id, v_fb_front_id, v_user_id, v_fb_team_id, v_challenge_id, 'approved', gen_random_uuid());

    INSERT INTO season_voters (season_id, user_id, team_id, city_region_id, first_front_id, first_approved_contribution_id, status)
    VALUES (v_season_id, v_user_id, v_fb_team_id, v_city_id, v_fb_front_id, v_contribution_id, 'verified');
  END LOOP;
END $$;
