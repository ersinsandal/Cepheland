-- CEPHELAND Demo Seed Script
-- Master Blueprint Section 08.6 (Alanya Pilot, 2 Leagues, 12 Fronts, 30 Users)

-- 1. Admin & Test Users
INSERT INTO users (id, handle, display_name, locale, terms_version, privacy_version, status, age_18_confirmed_at)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'admin', 'Sistem Yöneticisi', 'tr', 'v1.0', 'v1.0', 'active', now()),
  ('22222222-2222-2222-2222-222222222222', 'ahmet_gs', 'Ahmet Kaya', 'tr', 'v1.0', 'v1.0', 'active', now()),
  ('33333333-3333-3333-3333-333333333333', 'mehmet_fb', 'Mehmet Demir', 'tr', 'v1.0', 'v1.0', 'active', now()),
  ('44444444-4444-4444-4444-444444444444', 'ayse_bjk', 'Ayşe Yıldız', 'tr', 'v1.0', 'v1.0', 'active', now()),
  ('55555555-5555-5555-5555-555555555555', 'can_pc', 'Can Ergin', 'tr', 'v1.0', 'v1.0', 'active', now()),
  ('66666666-6666-6666-6666-666666666666', 'elif_ps', 'Elif Şahin', 'tr', 'v1.0', 'v1.0', 'active', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO admin_users (user_id, role, mfa_enabled)
VALUES ('11111111-1111-1111-1111-111111111111', 'super_admin', true)
ON CONFLICT (user_id) DO NOTHING;

-- 2. Geographic Regions (Turkey -> Antalya -> Alanya -> Mahmutlar)
INSERT INTO geographic_regions (id, parent_id, level, canonical_code, name_i18n, is_playable)
VALUES
  ('a0000000-0000-0000-0000-000000000001', NULL, 'country', 'TR', '{"tr":"Türkiye","en":"Turkey"}', true),
  ('a0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 'province', 'TR-07', '{"tr":"Antalya","en":"Antalya"}', true),
  ('a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000002', 'city', 'TR-07-ALN', '{"tr":"Alanya","en":"Alanya"}', true),
  ('a0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000003', 'neighborhood', 'TR-07-ALN-MHM', '{"tr":"Mahmutlar","en":"Mahmutlar"}', true)
ON CONFLICT (id) DO NOTHING;

-- 3. Map Versions
INSERT INTO map_versions (id, city_region_id, version, name, source_version, status, published_at)
VALUES
  ('b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 1, 'Alanya Mahmutlar Pilot Haritası v1.0', 'OSM-2026-10', 'published', now())
ON CONFLICT (id) DO NOTHING;

-- 4. Leagues & Rule Versions
-- League 1: football-demo
INSERT INTO leagues (id, slug, name_i18n, description_i18n, status, timezone, age_min)
VALUES
  ('c0000000-0000-0000-0000-000000000001', 'football-demo', '{"tr":"Taraftarlar Ligi (Demo)","en":"Supporters League (Demo)"}', '{"tr":"Alanya sokaklarında futbol rekabeti","en":"Football rivalry on Alanya streets"}', 'active', 'Europe/Istanbul', 18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO league_rule_versions (id, league_id, version, rules_json, rules_hash)
VALUES
  ('c1000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 1, '{"battle_duration_hours":24,"capture_protection_hours":48,"minimum_attackers_to_win":3}', 'mock_hash_rules_v1')
ON CONFLICT (id) DO NOTHING;

-- League 2: gaming-demo
INSERT INTO leagues (id, slug, name_i18n, description_i18n, status, timezone, age_min)
VALUES
  ('c0000000-0000-0000-0000-000000000002', 'gaming-demo', '{"tr":"Oyun Konsolları Ligi (Demo)","en":"Gaming Consoles League (Demo)"}', '{"tr":"PC, PlayStation ve Xbox sokak kontrol savaşı","en":"PC, PS and Xbox battle for territory"}', 'active', 'Europe/Istanbul', 18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO league_rule_versions (id, league_id, version, rules_json, rules_hash)
VALUES
  ('c1000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 1, '{"battle_duration_hours":24,"capture_protection_hours":48,"minimum_attackers_to_win":3}', 'mock_hash_rules_v2')
ON CONFLICT (id) DO NOTHING;

-- 5. Teams
-- Football Teams
INSERT INTO teams (id, league_id, slug, name_i18n, color_primary, color_secondary, order_no)
VALUES
  ('d0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'galatasaray', '{"tr":"Galatasaray","en":"Galatasaray"}', '#A90432', '#FDB913', 1),
  ('d0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000001', 'fenerbahce', '{"tr":"Fenerbahçe","en":"Fenerbahçe"}', '#002D72', '#FFED02', 2),
  ('d0000000-0000-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000001', 'besiktas', '{"tr":"Beşiktaş","en":"Besiktas"}', '#111827', '#FFFFFF', 3)
ON CONFLICT (id) DO NOTHING;

-- Gaming Teams
INSERT INTO teams (id, league_id, slug, name_i18n, color_primary, color_secondary, order_no)
VALUES
  ('d0000000-0000-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000002', 'pc-master-race', '{"tr":"PC Oyuncuları","en":"PC Master Race"}', '#107C41', '#00A4EF', 1),
  ('d0000000-0000-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000002', 'playstation', '{"tr":"PlayStation","en":"PlayStation"}', '#003791', '#0070D1', 2),
  ('d0000000-0000-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000002', 'xbox', '{"tr":"Xbox","en":"Xbox"}', '#107C10', '#52B435', 3)
ON CONFLICT (id) DO NOTHING;

-- 6. Seasons
INSERT INTO seasons (id, league_id, title_i18n, status, rule_version_id, championship_metric, starts_at, ends_at)
VALUES
  ('e0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', '{"tr":"2026 Güz Sezonu","en":"Fall 2026 Season"}', 'active', 'c1000000-0000-0000-0000-000000000001', 'weighted_control', now() - interval '3 days', now() + interval '27 days'),
  ('e0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', '{"tr":"Konsol Savaşları Sezon 1","en":"Console Wars Season 1"}', 'active', 'c1000000-0000-0000-0000-000000000002', 'weighted_control', now() - interval '2 days', now() + interval '28 days')
ON CONFLICT (id) DO NOTHING;

-- 7. Territory Maps linking seasons to map versions
INSERT INTO league_territory_maps (season_id, map_version_id)
VALUES
  ('e0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001'),
  ('e0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000001')
ON CONFLICT DO NOTHING;

-- 8. League Memberships for test users
INSERT INTO league_memberships (user_id, season_id, league_id, team_id)
VALUES
  ('22222222-2222-2222-2222-222222222222', 'e0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000001'),
  ('33333333-3333-3333-3333-333333333333', 'e0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000002'),
  ('44444444-4444-4444-4444-444444444444', 'e0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000003'),
  ('55555555-5555-5555-5555-555555555555', 'e0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000004'),
  ('66666666-6666-6666-6666-666666666666', 'e0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000005')
ON CONFLICT DO NOTHING;

-- 9. 12 Fronts in Alanya Mahmutlar
-- Real polygon coordinates around Mahmutlar Kumru Sokak & Barbaros Caddesi

INSERT INTO fronts (id, map_version_id, city_region_id, neighborhood_region_id, front_code, display_name_i18n, street_name, geom, center, area_m2, geometry_hash, safety_status, enabled)
VALUES
  ('f0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-KUM-001', '{"tr":"Kumru Sokak · Cephe 01","en":"Kumru Street · Front 01"}', 'Kumru Sokak',
   ST_Multi(ST_GeomFromText('POLYGON((32.0930 36.4840, 32.0945 36.4840, 32.0945 36.4855, 32.0930 36.4855, 32.0930 36.4840))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0937, 36.4847), 4326), 2450.0, 'hash_kum_01', 'approved', true),

  ('f0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-KUM-002', '{"tr":"Kumru Sokak · Cephe 02","en":"Kumru Street · Front 02"}', 'Kumru Sokak',
   ST_Multi(ST_GeomFromText('POLYGON((32.0945 36.4840, 32.0960 36.4840, 32.0960 36.4855, 32.0945 36.4855, 32.0945 36.4840))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0952, 36.4847), 4326), 2450.0, 'hash_kum_02', 'approved', true),

  ('f0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-KUM-003', '{"tr":"Kumru Sokak · Cephe 03","en":"Kumru Street · Front 03"}', 'Kumru Sokak',
   ST_Multi(ST_GeomFromText('POLYGON((32.0945 36.4855, 32.0960 36.4855, 32.0960 36.4870, 32.0945 36.4870, 32.0945 36.4855))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0952, 36.4862), 4326), 2450.0, 'hash_kum_03', 'approved', true),

  ('f0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-KUM-004', '{"tr":"Kumru Sokak · Cephe 04","en":"Kumru Street · Front 04"}', 'Kumru Sokak',
   ST_Multi(ST_GeomFromText('POLYGON((32.0930 36.4855, 32.0945 36.4855, 32.0945 36.4870, 32.0930 36.4870, 32.0930 36.4855))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0937, 36.4862), 4326), 2450.0, 'hash_kum_04', 'approved', true),

  ('f0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-BAR-001', '{"tr":"Barbaros Caddesi · Cephe 01","en":"Barbaros Ave · Front 01"}', 'Barbaros Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0960 36.4840, 32.0980 36.4840, 32.0980 36.4855, 32.0960 36.4855, 32.0960 36.4840))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0970, 36.4847), 4326), 3300.0, 'hash_bar_01', 'approved', true),

  ('f0000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-BAR-002', '{"tr":"Barbaros Caddesi · Cephe 02","en":"Barbaros Ave · Front 02"}', 'Barbaros Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0960 36.4855, 32.0980 36.4855, 32.0980 36.4870, 32.0960 36.4870, 32.0960 36.4855))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0970, 36.4862), 4326), 3300.0, 'hash_bar_02', 'approved', true),

  ('f0000000-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-BAR-003', '{"tr":"Barbaros Caddesi · Cephe 03","en":"Barbaros Ave · Front 03"}', 'Barbaros Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0980 36.4840, 32.1000 36.4840, 32.1000 36.4855, 32.0980 36.4855, 32.0980 36.4840))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0990, 36.4847), 4326), 3300.0, 'hash_bar_03', 'approved', true),

  ('f0000000-0000-0000-0000-000000000008', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-BAR-004', '{"tr":"Barbaros Caddesi · Cephe 04","en":"Barbaros Ave · Front 04"}', 'Barbaros Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0980 36.4855, 32.1000 36.4855, 32.1000 36.4870, 32.0980 36.4870, 32.0980 36.4855))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0990, 36.4862), 4326), 3300.0, 'hash_bar_04', 'approved', true),

  ('f0000000-0000-0000-0000-000000000009', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-ATA-001', '{"tr":"Atatürk Caddesi · Cephe 01","en":"Ataturk Ave · Front 01"}', 'Atatürk Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0930 36.4870, 32.0950 36.4870, 32.0950 36.4885, 32.0930 36.4885, 32.0930 36.4870))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0940, 36.4877), 4326), 3100.0, 'hash_ata_01', 'approved', true),

  ('f0000000-0000-0000-0000-000000000010', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-ATA-002', '{"tr":"Atatürk Caddesi · Cephe 02","en":"Ataturk Ave · Front 02"}', 'Atatürk Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0950 36.4870, 32.0970 36.4870, 32.0970 36.4885, 32.0950 36.4885, 32.0950 36.4870))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0960, 36.4877), 4326), 3100.0, 'hash_ata_02', 'approved', true),

  ('f0000000-0000-0000-0000-000000000011', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-SAH-001', '{"tr":"Sahil Yolu · Cephe 01","en":"Coastal Road · Front 01"}', 'Sahil Yolu',
   ST_Multi(ST_GeomFromText('POLYGON((32.0970 36.4870, 32.0990 36.4870, 32.0990 36.4885, 32.0970 36.4885, 32.0970 36.4870))', 4326)),
   ST_SetSRID(ST_MakePoint(32.0980, 36.4877), 4326), 3100.0, 'hash_sah_01', 'approved', true),

  ('f0000000-0000-0000-0000-000000000012', 'b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000004', 'ALN-MHM-VAT-001', '{"tr":"Vatan Caddesi · Cephe 01","en":"Vatan Ave · Front 01"}', 'Vatan Caddesi',
   ST_Multi(ST_GeomFromText('POLYGON((32.0990 36.4870, 32.1010 36.4870, 32.1010 36.4885, 32.0990 36.4885, 32.0990 36.4870))', 4326)),
   ST_SetSRID(ST_MakePoint(32.1000, 36.4877), 4326), 3100.0, 'hash_vat_01', 'approved', true)
ON CONFLICT (id) DO NOTHING;

-- 10. Play Zones for Fronts
INSERT INTO play_zones (id, front_id, geom, label_i18n, status)
VALUES
  ('fa000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000003',
   ST_Multi(ST_GeomFromText('POLYGON((32.0948 36.4858, 32.0956 36.4858, 32.0956 36.4866, 32.0948 36.4866, 32.0948 36.4858))', 4326)),
   '{"tr":"Kumru Sokak Parkı Kamusal Yaya Alanı","en":"Kumru Street Public Pedestrian Zone"}', 'approved')
ON CONFLICT (id) DO NOTHING;

-- 11. Front Season Weights (football season e0000000-0000-0000-0000-000000000001)
-- Notice Barbaros 01 & 02 are high weight 5.0 avenues!
INSERT INTO front_season_weights (season_id, front_id, weight, method_version)
VALUES
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000001', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000002', 'f0000000-0000-0000-0000-000000000002', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000003', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000004', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000005', 5.0, 'density_v1'), -- Barbaros 01 (Heavy)
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000006', 5.0, 'density_v1'), -- Barbaros 02 (Heavy)
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000007', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000008', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000009', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000010', 1.2, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000011', 1.0, 'density_v1'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000012', 1.0, 'density_v1')
ON CONFLICT DO NOTHING;

-- 12. Season Front States (Football League)
-- 8 quiet streets GS (weights 1.2 -> 9.6), 2 heavy avenues FB (weights 5.0 -> 10.0), 2 neutral!
INSERT INTO season_front_states (season_id, front_id, owner_team_id, status)
VALUES
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000001', 'contested'), -- Kumru 03 has active battle!
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000002', 'owned'), -- FB Barbaros 01
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000002', 'owned'), -- FB Barbaros 02
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000001', 'owned'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000011', NULL, 'neutral'),
  ('e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000012', NULL, 'neutral')
ON CONFLICT (season_id, front_id) DO NOTHING;

-- 13. Active Battle on Kumru Sokak / Cephe 03 (Kumru 03)
-- Defender: Galatasaray (d0000000-0000-0000-0000-000000000001)
-- Attacker: Fenerbahçe (d0000000-0000-0000-0000-000000000002)
INSERT INTO battles (id, season_id, front_id, mode, status, defender_team_id, attacker_team_id, created_by, rules_snapshot_json, rules_snapshot_hash, starts_at, ends_at)
VALUES
  ('bb000000-0000-0000-0000-000000000001', 'e0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000003',
   'attack', 'active', 'd0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000002',
   '33333333-3333-3333-3333-333333333333', '{"min_attackers":3,"duration_hours":24}', 'battle_rules_hash_01',
   now() - interval '6 hours', now() + interval '18 hours')
ON CONFLICT (id) DO NOTHING;

UPDATE season_front_states
SET active_battle_id = 'bb000000-0000-0000-0000-000000000001'
WHERE season_id = 'e0000000-0000-0000-0000-000000000001' AND front_id = 'f0000000-0000-0000-0000-000000000003';
