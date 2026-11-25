--
-- CEPHELAND PLANETARY FRONT INGESTION SQL SCRIPT
-- Total Fronts: 1026
--
BEGIN;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2db83ec7-f138-4ded-ac80-732a1ef08cb4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-218',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.084574 36.4742, 32.086315 36.4742, 32.086315 36.4756, 32.084574 36.4756, 32.084574 36.4742))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eea6e6c8-a163-42cc-afc5-d404900a1994',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-255',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.086315 36.4742, 32.088056 36.4742, 32.088056 36.4756, 32.086315 36.4756, 32.086315 36.4742))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ab17feff-2167-4da8-aa70-3357cc7fcca7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-292',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.088056 36.4742, 32.089797 36.4742, 32.089797 36.4756, 32.088056 36.4756, 32.088056 36.4742))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5a11a21a-adb1-4043-a7a0-c25907c3025d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-329',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.089797 36.4742, 32.091539 36.4742, 32.091539 36.4756, 32.089797 36.4756, 32.089797 36.4742))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3aecc0f0-c987-4f22-a36b-7fd204748012',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-366',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.091539 36.4742, 32.09328 36.4742, 32.09328 36.4756, 32.091539 36.4756, 32.091539 36.4742))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '561b5a5f-464c-45b6-a057-afe99c685015',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-403',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.09328 36.4742, 32.095021 36.4742, 32.095021 36.4756, 32.09328 36.4756, 32.09328 36.4742))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4749)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5169adbb-4659-426e-a730-ffd597c30029',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-440',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.095021 36.4742, 32.096762 36.4742, 32.096762 36.4756, 32.095021 36.4756, 32.095021 36.4742))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4749)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '08e26c13-0237-49a3-aad5-85b00b1a55b6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-477',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.096762 36.4742, 32.098504 36.4742, 32.098504 36.4756, 32.096762 36.4756, 32.096762 36.4742))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f06e680d-fbd9-4966-abb7-216bec47b173',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-514',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.098504 36.4742, 32.100245 36.4742, 32.100245 36.4756, 32.098504 36.4756, 32.098504 36.4742))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b7d9edcd-5067-45ba-a7be-987708416387',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-551',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.100245 36.4742, 32.101986 36.4742, 32.101986 36.4756, 32.100245 36.4756, 32.100245 36.4742))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5189a3b3-dbab-4129-aa22-629a2d3564dc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-588',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.101986 36.4742, 32.103727 36.4742, 32.103727 36.4756, 32.101986 36.4756, 32.101986 36.4742))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b80c0a9-dd05-4420-a685-e4893885e4c9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-625',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.103727 36.4742, 32.105469 36.4742, 32.105469 36.4756, 32.103727 36.4756, 32.103727 36.4742))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '62974e94-1313-4476-a184-cae275aad30a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-662',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.105469 36.4742, 32.10721 36.4742, 32.10721 36.4756, 32.105469 36.4756, 32.105469 36.4742))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '61ab689d-3b63-4b18-aac8-83859d0f53b5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-699',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.10721 36.4742, 32.108951 36.4742, 32.108951 36.4756, 32.10721 36.4756, 32.10721 36.4742))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4749)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ba6f5073-6652-4372-ac3d-930120c213e5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-736',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.108951 36.4742, 32.110693 36.4742, 32.110693 36.4756, 32.108951 36.4756, 32.108951 36.4742))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '115fe763-9477-44e1-a528-b382a5d73c44',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-773',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.110693 36.4742, 32.112434 36.4742, 32.112434 36.4756, 32.110693 36.4756, 32.110693 36.4742))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c7f983f-7d91-4a5c-a1ee-c263ea10f29b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-810',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.112434 36.4742, 32.114175 36.4742, 32.114175 36.4756, 32.112434 36.4756, 32.112434 36.4742))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ef4573f3-e201-4287-ad44-b174d147367a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-847',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.114175 36.4742, 32.115916 36.4742, 32.115916 36.4756, 32.114175 36.4756, 32.114175 36.4742))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4749)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1d300a10-1fcc-4855-a2fc-c2453cfcd265',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-291',
  '{"tr": "Sahil Yolu · Ada Kümesi 79", "en": "Sahil Yolu · Block Cluster 79"}'::jsonb,
  'Sahil Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.084574 36.4756, 32.086315 36.4756, 32.086315 36.477, 32.084574 36.477, 32.084574 36.4756))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4763)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a81a873f-db75-4192-a36f-46ad839048d1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-328',
  '{"tr": "135. Sokak · Ada Kümesi 86", "en": "135. Sokak · Block Cluster 86"}'::jsonb,
  '135. Sokak',
  24233,
  ST_GeomFromText('POLYGON((32.086315 36.4756, 32.088056 36.4756, 32.088056 36.477, 32.086315 36.477, 32.086315 36.4756))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8380ced8-561c-47a0-a59c-d978d99ce678',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-365',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 4", "en": "Mehmet Çakır Caddesi · Block Cluster 4"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.088056 36.4756, 32.089797 36.4756, 32.089797 36.477, 32.088056 36.477, 32.088056 36.4756))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4763)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f10c7cdf-38eb-42f6-a9e7-4e2929f7afd5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-402',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 11", "en": "Sarıhasanlı Caddesi · Block Cluster 11"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.089797 36.4756, 32.091539 36.4756, 32.091539 36.477, 32.089797 36.477, 32.089797 36.4756))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '80e1e4c6-6c28-4a52-acc9-ee94ed09ef18',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-439',
  '{"tr": "Atatürk Caddesi · Ada Kümesi 18", "en": "Atatürk Caddesi · Block Cluster 18"}'::jsonb,
  'Atatürk Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.091539 36.4756, 32.09328 36.4756, 32.09328 36.477, 32.091539 36.477, 32.091539 36.4756))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4763)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78f8a274-17d8-4d40-af20-2f3490d12fb4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-476',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 25", "en": "Karasüleymanlar Sokak · Block Cluster 25"}'::jsonb,
  'Karasüleymanlar Sokak',
  24233,
  ST_GeomFromText('POLYGON((32.09328 36.4756, 32.095021 36.4756, 32.095021 36.477, 32.09328 36.477, 32.09328 36.4756))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '68b7871c-02d1-4852-aa66-af4e6b88af6e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-513',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 32", "en": "Yangılı Caddesi · Block Cluster 32"}'::jsonb,
  'Yangılı Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.095021 36.4756, 32.096762 36.4756, 32.096762 36.477, 32.095021 36.477, 32.095021 36.4756))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4763)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1b178720-0e6a-4601-a57d-f1212981fd21',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-550',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 39", "en": "Sarıhasanlı Caddesi · Block Cluster 39"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.096762 36.4756, 32.098504 36.4756, 32.098504 36.477, 32.096762 36.477, 32.096762 36.4756))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eb18cd2f-90ae-45f0-abb6-b8df7bc7431f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-587',
  '{"tr": "Sahil Yolu · Ada Kümesi 46", "en": "Sahil Yolu · Block Cluster 46"}'::jsonb,
  'Sahil Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.098504 36.4756, 32.100245 36.4756, 32.100245 36.477, 32.098504 36.477, 32.098504 36.4756))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4763)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0dfebb67-744b-4bdf-a9b5-e0b8824a1746',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-624',
  '{"tr": "135. Sokak · Ada Kümesi 53", "en": "135. Sokak · Block Cluster 53"}'::jsonb,
  '135. Sokak',
  24233,
  ST_GeomFromText('POLYGON((32.100245 36.4756, 32.101986 36.4756, 32.101986 36.477, 32.100245 36.477, 32.100245 36.4756))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b61d7ca6-81e9-47f8-a7f4-8b5e3807749e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-661',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 60", "en": "Mehmet Çakır Caddesi · Block Cluster 60"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.101986 36.4756, 32.103727 36.4756, 32.103727 36.477, 32.101986 36.477, 32.101986 36.4756))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4763)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7769a7d9-b7b2-4c64-a0db-5bbd2f1ca43d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-698',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 67", "en": "Sarıhasanlı Caddesi · Block Cluster 67"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.103727 36.4756, 32.105469 36.4756, 32.105469 36.477, 32.103727 36.477, 32.103727 36.4756))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '842b3360-41ba-4a3e-a591-b95ec5e5bd9e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-735',
  '{"tr": "Sahil Yolu · Ada Kümesi 74", "en": "Sahil Yolu · Block Cluster 74"}'::jsonb,
  'Sahil Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.105469 36.4756, 32.10721 36.4756, 32.10721 36.477, 32.105469 36.477, 32.105469 36.4756))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4763)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '38793dd2-ce23-4b99-a65a-b64b069cc96b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-772',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 81", "en": "Karasüleymanlar Sokak · Block Cluster 81"}'::jsonb,
  'Karasüleymanlar Sokak',
  24233,
  ST_GeomFromText('POLYGON((32.10721 36.4756, 32.108951 36.4756, 32.108951 36.477, 32.10721 36.477, 32.10721 36.4756))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd91f5b24-4338-4803-aa27-c3271c57f327',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-809',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 88", "en": "Yangılı Caddesi · Block Cluster 88"}'::jsonb,
  'Yangılı Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.108951 36.4756, 32.110693 36.4756, 32.110693 36.477, 32.108951 36.477, 32.108951 36.4756))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4763)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b00ee7f4-49e1-40c5-a9ef-6731f9f068b9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-846',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 6", "en": "Sarıhasanlı Caddesi · Block Cluster 6"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.110693 36.4756, 32.112434 36.4756, 32.112434 36.477, 32.110693 36.477, 32.110693 36.4756))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4763)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '12b91532-a007-4d37-a2be-5805b2c06269',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-883',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 13", "en": "Barbaros Caddesi · Block Cluster 13"}'::jsonb,
  'Barbaros Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.112434 36.4756, 32.114175 36.4756, 32.114175 36.477, 32.112434 36.477, 32.112434 36.4756))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4763)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '665f4501-6506-44a4-a359-61a5cb6569a5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-920',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.114175 36.4756, 32.115916 36.4756, 32.115916 36.477, 32.114175 36.477, 32.114175 36.4756))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4763)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '573a6cf3-0461-4a17-a35b-96e45b9c670a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-364',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 3", "en": "Karasüleymanlar Sokak · Block Cluster 3"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.084574 36.477, 32.086315 36.477, 32.086315 36.4784, 32.084574 36.4784, 32.084574 36.477))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a9a5daad-233d-4901-aa98-a3accce353ae',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-401',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 10", "en": "Mehmet Çakır Caddesi · Block Cluster 10"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.086315 36.477, 32.088056 36.477, 32.088056 36.4784, 32.086315 36.4784, 32.086315 36.477))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4777)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2cd57123-e9ca-42d6-a51f-c3f516a023f9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-438',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 17", "en": "Karasüleymanlar Sokak · Block Cluster 17"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.088056 36.477, 32.089797 36.477, 32.089797 36.4784, 32.088056 36.4784, 32.088056 36.477))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6825bcf8-77a3-418e-af86-dd76dfc91e86',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-475',
  '{"tr": "Sahil Yolu · Ada Kümesi 24", "en": "Sahil Yolu · Block Cluster 24"}'::jsonb,
  'Sahil Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.089797 36.477, 32.091539 36.477, 32.091539 36.4784, 32.089797 36.4784, 32.089797 36.477))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4777)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '283f22d7-e237-440c-aa08-a6db0a76a6e3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-512',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 31", "en": "Karasüleymanlar Sokak · Block Cluster 31"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.091539 36.477, 32.09328 36.477, 32.09328 36.4784, 32.091539 36.4784, 32.091539 36.477))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1ff3adf2-90d0-420f-af23-affdb0c3b001',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-549',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 38", "en": "Mehmet Çakır Caddesi · Block Cluster 38"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.09328 36.477, 32.095021 36.477, 32.095021 36.4784, 32.09328 36.4784, 32.09328 36.477))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4777)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '87df196d-b5ef-426d-a230-fb003dcefbda',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-586',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 45", "en": "Karasüleymanlar Sokak · Block Cluster 45"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.095021 36.477, 32.096762 36.477, 32.096762 36.4784, 32.095021 36.4784, 32.095021 36.477))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e500fdf3-fc15-4886-a915-c575e1163679',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-623',
  '{"tr": "Sahil Yolu · Ada Kümesi 52", "en": "Sahil Yolu · Block Cluster 52"}'::jsonb,
  'Sahil Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.096762 36.477, 32.098504 36.477, 32.098504 36.4784, 32.096762 36.4784, 32.096762 36.477))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4777)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '22968d6b-ff4f-48c8-add9-45a321e65633',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-660',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 59", "en": "Karasüleymanlar Sokak · Block Cluster 59"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.098504 36.477, 32.100245 36.477, 32.100245 36.4784, 32.098504 36.4784, 32.098504 36.477))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1c0aa215-8052-404f-ac58-225a9c5d2264',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-697',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 66", "en": "Mehmet Çakır Caddesi · Block Cluster 66"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.100245 36.477, 32.101986 36.477, 32.101986 36.4784, 32.100245 36.4784, 32.100245 36.477))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4777)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3ffc773b-2491-47b5-ab6d-108e648ddef0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-734',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 73", "en": "Karasüleymanlar Sokak · Block Cluster 73"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.101986 36.477, 32.103727 36.477, 32.103727 36.4784, 32.101986 36.4784, 32.101986 36.477))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c7eb7e21-891d-46c8-aef6-c8e9510934e9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-771',
  '{"tr": "Sahil Yolu · Ada Kümesi 80", "en": "Sahil Yolu · Block Cluster 80"}'::jsonb,
  'Sahil Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.103727 36.477, 32.105469 36.477, 32.105469 36.4784, 32.103727 36.4784, 32.103727 36.477))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4777)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '91eca475-a2d6-4d57-a33a-392234c341cc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-808',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 87", "en": "Karasüleymanlar Sokak · Block Cluster 87"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.105469 36.477, 32.10721 36.477, 32.10721 36.4784, 32.105469 36.4784, 32.105469 36.477))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '59dea3e8-ea6f-4fc7-a3b1-6c2f444e73af',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-845',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 5", "en": "Mehmet Çakır Caddesi · Block Cluster 5"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.10721 36.477, 32.108951 36.477, 32.108951 36.4784, 32.10721 36.4784, 32.10721 36.477))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4777)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aa62c1dc-f0a7-4a71-aac5-4bad9b0a4c4d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-882',
  '{"tr": "135. Sokak · Ada Kümesi 12", "en": "135. Sokak · Block Cluster 12"}'::jsonb,
  '135. Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.108951 36.477, 32.110693 36.477, 32.110693 36.4784, 32.108951 36.4784, 32.108951 36.477))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e1da37e-2212-43ea-ac0f-1094c0305768',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-919',
  '{"tr": "Sahil Yolu · Ada Kümesi 19", "en": "Sahil Yolu · Block Cluster 19"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.110693 36.477, 32.112434 36.477, 32.112434 36.4784, 32.110693 36.4784, 32.110693 36.477))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4777)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '61bd051c-fbcb-41ac-aa76-24b05d8826c8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-956',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 26", "en": "Sarıhasanlı Caddesi · Block Cluster 26"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.112434 36.477, 32.114175 36.477, 32.114175 36.4784, 32.112434 36.4784, 32.112434 36.477))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4777)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eb6c7e7b-0435-45fb-af59-3b80efa1c476',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-993',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.114175 36.477, 32.115916 36.477, 32.115916 36.4784, 32.114175 36.4784, 32.114175 36.477))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4777)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a8902e73-cbee-44fb-a37e-ea88747ef36e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-437',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 16", "en": "Yangılı Caddesi · Block Cluster 16"}'::jsonb,
  'Yangılı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.084574 36.4784, 32.086315 36.4784, 32.086315 36.4798, 32.084574 36.4798, 32.084574 36.4784))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4791)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aba7c8e3-b457-4bf7-aff0-63145fff74da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-474',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 23", "en": "Karasüleymanlar Sokak · Block Cluster 23"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.086315 36.4784, 32.088056 36.4784, 32.088056 36.4798, 32.086315 36.4798, 32.086315 36.4784))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a468d89e-853a-47c9-a152-0f5729a3b067',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-511',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 30", "en": "Barbaros Caddesi · Block Cluster 30"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.088056 36.4784, 32.089797 36.4784, 32.089797 36.4798, 32.088056 36.4798, 32.088056 36.4784))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4791)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bd39dab9-b626-4bfe-ab1f-e147736016b7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-548',
  '{"tr": "135. Sokak · Ada Kümesi 37", "en": "135. Sokak · Block Cluster 37"}'::jsonb,
  '135. Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.089797 36.4784, 32.091539 36.4784, 32.091539 36.4798, 32.089797 36.4798, 32.089797 36.4784))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e6583b9e-4f83-4202-a9db-499c35dbada0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-585',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 44", "en": "Mehmet Çakır Caddesi · Block Cluster 44"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.091539 36.4784, 32.09328 36.4784, 32.09328 36.4798, 32.091539 36.4798, 32.091539 36.4784))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4791)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'efc96524-3d73-45d8-a2ba-00fc2d3ccafc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-622',
  '{"tr": "135. Sokak · Ada Kümesi 51", "en": "135. Sokak · Block Cluster 51"}'::jsonb,
  '135. Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.09328 36.4784, 32.095021 36.4784, 32.095021 36.4798, 32.09328 36.4798, 32.09328 36.4784))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd9216b2f-3eec-45b1-a7cd-0e9e180dd0e0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-659',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 58", "en": "Barbaros Caddesi · Block Cluster 58"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.095021 36.4784, 32.096762 36.4784, 32.096762 36.4798, 32.095021 36.4798, 32.095021 36.4784))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4791)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2fa9584b-0a23-4737-a58a-3f7c39ccbf82',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-696',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 65", "en": "Karasüleymanlar Sokak · Block Cluster 65"}'::jsonb,
  'Karasüleymanlar Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.096762 36.4784, 32.098504 36.4784, 32.098504 36.4798, 32.096762 36.4798, 32.096762 36.4784))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a83324ad-629b-4cc7-aaa8-f86a0acf0174',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-733',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 72", "en": "Yangılı Caddesi · Block Cluster 72"}'::jsonb,
  'Yangılı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.098504 36.4784, 32.100245 36.4784, 32.100245 36.4798, 32.098504 36.4798, 32.098504 36.4784))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4791)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '46a85de3-2a21-4152-ac89-ecb170ca0f35',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-770',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 79", "en": "Karasüleymanlar Sokak · Block Cluster 79"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.100245 36.4784, 32.101986 36.4784, 32.101986 36.4798, 32.100245 36.4798, 32.100245 36.4784))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '610b30fc-cd47-41b3-ac4c-f14f2e52f2af',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-807',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 86", "en": "Barbaros Caddesi · Block Cluster 86"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.101986 36.4784, 32.103727 36.4784, 32.103727 36.4798, 32.101986 36.4798, 32.101986 36.4784))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4791)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '76cdce83-4a8c-44ca-ac41-7a49c15a834d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-844',
  '{"tr": "135. Sokak · Ada Kümesi 4", "en": "135. Sokak · Block Cluster 4"}'::jsonb,
  '135. Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.103727 36.4784, 32.105469 36.4784, 32.105469 36.4798, 32.103727 36.4798, 32.103727 36.4784))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4d12fd10-4a06-41eb-a714-0cfb9719eefb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-881',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 11", "en": "Mehmet Çakır Caddesi · Block Cluster 11"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.105469 36.4784, 32.10721 36.4784, 32.10721 36.4798, 32.105469 36.4798, 32.105469 36.4784))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4791)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd8261126-495b-4f32-a17d-6e1421819058',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-918',
  '{"tr": "135. Sokak · Ada Kümesi 18", "en": "135. Sokak · Block Cluster 18"}'::jsonb,
  '135. Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.10721 36.4784, 32.108951 36.4784, 32.108951 36.4798, 32.10721 36.4798, 32.10721 36.4784))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9a082c1b-29c5-4781-a3cd-1b9ac3cd639c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-955',
  '{"tr": "Sahil Yolu · Ada Kümesi 25", "en": "Sahil Yolu · Block Cluster 25"}'::jsonb,
  'Sahil Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.108951 36.4784, 32.110693 36.4784, 32.110693 36.4798, 32.108951 36.4798, 32.108951 36.4784))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4791)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0c19e874-c8a9-45ec-a4b0-fd98d4c2fe60',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-992',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 32", "en": "Karasüleymanlar Sokak · Block Cluster 32"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.110693 36.4784, 32.112434 36.4784, 32.112434 36.4798, 32.110693 36.4798, 32.110693 36.4784))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4791)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bf340021-9080-4e4a-afb4-ee6b4fb4ee6b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-030',
  '{"tr": "Mehmet Çakır Caddesi · Ada Kümesi 39", "en": "Mehmet Çakır Caddesi · Block Cluster 39"}'::jsonb,
  'Mehmet Çakır Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.112434 36.4784, 32.114175 36.4784, 32.114175 36.4798, 32.112434 36.4798, 32.112434 36.4784))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4791)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dd30be7b-402c-4a01-ad1c-447a1d5db87c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-067',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.114175 36.4784, 32.115916 36.4784, 32.115916 36.4798, 32.114175 36.4798, 32.114175 36.4784))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4791)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a4642416-9fb6-4318-abd2-570e441a972e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-510',
  '{"tr": "135. Sokak · Ada Kümesi 29", "en": "135. Sokak · Block Cluster 29"}'::jsonb,
  '135. Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.084574 36.4798, 32.086315 36.4798, 32.086315 36.4812, 32.084574 36.4812, 32.084574 36.4798))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5a3cc27f-ee77-41f7-a44b-438848b44476',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-547',
  '{"tr": "Sahil Yolu · Ada Kümesi 36", "en": "Sahil Yolu · Block Cluster 36"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.086315 36.4798, 32.088056 36.4798, 32.088056 36.4812, 32.086315 36.4812, 32.086315 36.4798))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4805)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7d1a6086-ddf5-4536-a0ef-d5b05b1015bc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-584',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 43", "en": "Karasüleymanlar Sokak · Block Cluster 43"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.088056 36.4798, 32.089797 36.4798, 32.089797 36.4812, 32.088056 36.4812, 32.088056 36.4798))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9bd563b0-a0e8-417e-ab3d-a2ce3cbe252e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-621',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 50", "en": "Yangılı Caddesi · Block Cluster 50"}'::jsonb,
  'Yangılı Caddesi',
  24246,
  ST_GeomFromText('POLYGON((32.089797 36.4798, 32.091539 36.4798, 32.091539 36.4812, 32.089797 36.4812, 32.089797 36.4798))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4805)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '245ed5b1-c17a-4234-a524-f785e5d8f7e5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-658',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 57", "en": "Sarıhasanlı Caddesi · Block Cluster 57"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.091539 36.4798, 32.09328 36.4798, 32.09328 36.4812, 32.091539 36.4812, 32.091539 36.4798))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8a4a8402-af06-4c38-a54c-d83a3950e03a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-695',
  '{"tr": "Sahil Yolu · Ada Kümesi 64", "en": "Sahil Yolu · Block Cluster 64"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.09328 36.4798, 32.095021 36.4798, 32.095021 36.4812, 32.09328 36.4812, 32.09328 36.4798))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4805)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '81ca5552-fbb5-467e-aa7f-432c7d7f6bd0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-732',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 71", "en": "Karasüleymanlar Sokak · Block Cluster 71"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.095021 36.4798, 32.096762 36.4798, 32.096762 36.4812, 32.095021 36.4812, 32.095021 36.4798))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9801dc98-552b-48d3-ad2a-f44bed2d056b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-769',
  '{"tr": "Vatan Caddesi · Ada Kümesi 78", "en": "Vatan Caddesi · Block Cluster 78"}'::jsonb,
  'Vatan Caddesi',
  24246,
  ST_GeomFromText('POLYGON((32.096762 36.4798, 32.098504 36.4798, 32.098504 36.4812, 32.096762 36.4812, 32.096762 36.4798))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4805)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e349e28-e083-42ce-aeb7-4ce67eb870f6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-806',
  '{"tr": "135. Sokak · Ada Kümesi 85", "en": "135. Sokak · Block Cluster 85"}'::jsonb,
  '135. Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.098504 36.4798, 32.100245 36.4798, 32.100245 36.4812, 32.098504 36.4812, 32.098504 36.4798))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4e47288f-450a-4a1a-ab4d-52959351a2a9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-843',
  '{"tr": "Sahil Yolu · Ada Kümesi 3", "en": "Sahil Yolu · Block Cluster 3"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.100245 36.4798, 32.101986 36.4798, 32.101986 36.4812, 32.100245 36.4812, 32.100245 36.4798))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4805)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f03418e3-71d0-43b7-a1e4-5b5462045c9a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-880',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 10", "en": "Karasüleymanlar Sokak · Block Cluster 10"}'::jsonb,
  'Karasüleymanlar Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.101986 36.4798, 32.103727 36.4798, 32.103727 36.4812, 32.101986 36.4812, 32.101986 36.4798))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e66f0ce-6009-4cce-ae6f-ec00fe700d9c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-917',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 17", "en": "Yangılı Caddesi · Block Cluster 17"}'::jsonb,
  'Yangılı Caddesi',
  24246,
  ST_GeomFromText('POLYGON((32.103727 36.4798, 32.105469 36.4798, 32.105469 36.4812, 32.103727 36.4812, 32.103727 36.4798))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4805)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '695f3101-f9df-4445-a080-3544633e3546',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-954',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 24", "en": "Sarıhasanlı Caddesi · Block Cluster 24"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.105469 36.4798, 32.10721 36.4798, 32.10721 36.4812, 32.105469 36.4812, 32.105469 36.4798))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b96c393-9776-4a78-ace0-59ebf30d5e0b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-991',
  '{"tr": "Sahil Yolu · Ada Kümesi 31", "en": "Sahil Yolu · Block Cluster 31"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.10721 36.4798, 32.108951 36.4798, 32.108951 36.4812, 32.10721 36.4812, 32.10721 36.4798))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4805)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ba40ba54-ac8b-47c4-a6cb-6d9066cc9218',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-029',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 38", "en": "Karasüleymanlar Sokak · Block Cluster 38"}'::jsonb,
  'Karasüleymanlar Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.108951 36.4798, 32.110693 36.4798, 32.110693 36.4812, 32.108951 36.4812, 32.108951 36.4798))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '304f5c9d-ab3d-4482-ab72-881fdb8d311f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-066',
  '{"tr": "Vatan Caddesi · Ada Kümesi 45", "en": "Vatan Caddesi · Block Cluster 45"}'::jsonb,
  'Vatan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.110693 36.4798, 32.112434 36.4798, 32.112434 36.4812, 32.110693 36.4812, 32.110693 36.4798))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4805)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7da2b01d-feb2-4800-a310-081d7c55681d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-103',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 52", "en": "Sarıhasanlı Caddesi · Block Cluster 52"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.112434 36.4798, 32.114175 36.4798, 32.114175 36.4812, 32.112434 36.4812, 32.112434 36.4798))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4805)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f1df9639-60e8-4d80-a137-fbb952c803b9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-140',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.114175 36.4798, 32.115916 36.4798, 32.115916 36.4812, 32.114175 36.4812, 32.114175 36.4798))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4805)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '85010592-013c-4d5d-a43d-58cf863d62ef',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-583',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 42", "en": "Barbaros Caddesi · Block Cluster 42"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.084574 36.4812, 32.086315 36.4812, 32.086315 36.4826, 32.084574 36.4826, 32.084574 36.4812))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4819)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b9dbfff-c8aa-40e9-a337-7f16244880e8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-620',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 49", "en": "Sarıhasanlı Caddesi · Block Cluster 49"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.086315 36.4812, 32.088056 36.4812, 32.088056 36.4826, 32.086315 36.4826, 32.086315 36.4812))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5efe6546-6052-47e5-aeac-e2a3bf50ed2b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-657',
  '{"tr": "Vatan Caddesi · Ada Kümesi 56", "en": "Vatan Caddesi · Block Cluster 56"}'::jsonb,
  'Vatan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.088056 36.4812, 32.089797 36.4812, 32.089797 36.4826, 32.088056 36.4826, 32.088056 36.4812))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4819)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '59fba267-1637-48a9-afcc-3ace70333b10',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-694',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 63", "en": "Karasüleymanlar Sokak · Block Cluster 63"}'::jsonb,
  'Karasüleymanlar Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.089797 36.4812, 32.091539 36.4812, 32.091539 36.4826, 32.089797 36.4826, 32.089797 36.4812))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '386fe8a2-8d4b-4643-a524-5ee1c5bb9ee5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-731',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 70", "en": "Barbaros Caddesi · Block Cluster 70"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.091539 36.4812, 32.09328 36.4812, 32.09328 36.4826, 32.091539 36.4826, 32.091539 36.4812))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4819)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '355c97cb-430c-4400-a650-c3cb7868ebcb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-768',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 77", "en": "Sarıhasanlı Caddesi · Block Cluster 77"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.09328 36.4812, 32.095021 36.4812, 32.095021 36.4826, 32.09328 36.4826, 32.09328 36.4812))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b8b72307-c765-4750-afd2-1457801c5a57',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-805',
  '{"tr": "Vatan Caddesi · Ada Kümesi 84", "en": "Vatan Caddesi · Block Cluster 84"}'::jsonb,
  'Vatan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.095021 36.4812, 32.096762 36.4812, 32.096762 36.4826, 32.095021 36.4826, 32.095021 36.4812))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4819)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '53607f05-1605-4ce2-a565-33e76965cbe7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-842',
  '{"tr": "135. Sokak · Ada Kümesi 2", "en": "135. Sokak · Block Cluster 2"}'::jsonb,
  '135. Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.096762 36.4812, 32.098504 36.4812, 32.098504 36.4826, 32.096762 36.4826, 32.096762 36.4812))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '544d026c-2f0b-4725-ab46-e5498358e991',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-879',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 9", "en": "Barbaros Caddesi · Block Cluster 9"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.098504 36.4812, 32.100245 36.4812, 32.100245 36.4826, 32.098504 36.4826, 32.098504 36.4812))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4819)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f01547c4-f8f6-4e2f-a8e3-d9ebe90be5f3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-916',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 16", "en": "Sarıhasanlı Caddesi · Block Cluster 16"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.100245 36.4812, 32.101986 36.4812, 32.101986 36.4826, 32.100245 36.4826, 32.100245 36.4812))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e4eb92da-51f6-4ca0-a51d-de7a36e1df7a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-953',
  '{"tr": "Vatan Caddesi · Ada Kümesi 23", "en": "Vatan Caddesi · Block Cluster 23"}'::jsonb,
  'Vatan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.101986 36.4812, 32.103727 36.4812, 32.103727 36.4826, 32.101986 36.4826, 32.101986 36.4812))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4819)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2ff6e2d1-696c-4bce-a69a-391f9963be9f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-990',
  '{"tr": "Karasüleymanlar Sokak · Ada Kümesi 30", "en": "Karasüleymanlar Sokak · Block Cluster 30"}'::jsonb,
  'Karasüleymanlar Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.103727 36.4812, 32.105469 36.4812, 32.105469 36.4826, 32.103727 36.4826, 32.103727 36.4812))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'da05b969-3ed1-4c23-a4d4-054a18d7758c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-028',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 37", "en": "Barbaros Caddesi · Block Cluster 37"}'::jsonb,
  'Barbaros Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.105469 36.4812, 32.10721 36.4812, 32.10721 36.4826, 32.105469 36.4826, 32.105469 36.4812))', 4326),
  ST_GeomFromText('POINT(32.10634 36.4819)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e1aaf71b-78be-4220-a914-b53b5a69393b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-065',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 44", "en": "Sarıhasanlı Caddesi · Block Cluster 44"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.10721 36.4812, 32.108951 36.4812, 32.108951 36.4826, 32.10721 36.4826, 32.10721 36.4812))', 4326),
  ST_GeomFromText('POINT(32.108081 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c18562b-5197-43e5-ad8f-f5cebdaffa10',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-102',
  '{"tr": "Vatan Caddesi · Ada Kümesi 51", "en": "Vatan Caddesi · Block Cluster 51"}'::jsonb,
  'Vatan Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.108951 36.4812, 32.110693 36.4812, 32.110693 36.4826, 32.108951 36.4826, 32.108951 36.4812))', 4326),
  ST_GeomFromText('POINT(32.109822 36.4819)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4170f729-8762-43e8-a612-a4c1c8d34b11',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-139',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 58", "en": "Sarıhasanlı Caddesi · Block Cluster 58"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.110693 36.4812, 32.112434 36.4812, 32.112434 36.4826, 32.110693 36.4826, 32.110693 36.4812))', 4326),
  ST_GeomFromText('POINT(32.111564 36.4819)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '823553b7-2534-46ac-a701-e51ba76a0a63',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-176',
  '{"tr": "Sahil Yolu · Ada Kümesi 65", "en": "Sahil Yolu · Block Cluster 65"}'::jsonb,
  'Sahil Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.112434 36.4812, 32.114175 36.4812, 32.114175 36.4826, 32.112434 36.4826, 32.112434 36.4812))', 4326),
  ST_GeomFromText('POINT(32.113305 36.4819)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b58cc36-4614-4bf1-ad4c-07c7a16d9827',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-213',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.114175 36.4812, 32.115916 36.4812, 32.115916 36.4826, 32.114175 36.4826, 32.114175 36.4812))', 4326),
  ST_GeomFromText('POINT(32.115046 36.4819)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8dca05c6-2ba1-4aaa-a66b-8f6cb96b9070',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-656',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 55", "en": "Sarıhasanlı Caddesi · Block Cluster 55"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.084574 36.4826, 32.086315 36.4826, 32.086315 36.484, 32.084574 36.484, 32.084574 36.4826))', 4326),
  ST_GeomFromText('POINT(32.085445 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c1652c5f-5f86-46e2-aee3-cabd20ec1341',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-693',
  '{"tr": "Vatan Caddesi · Ada Kümesi 62", "en": "Vatan Caddesi · Block Cluster 62"}'::jsonb,
  'Vatan Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.086315 36.4826, 32.088056 36.4826, 32.088056 36.484, 32.086315 36.484, 32.086315 36.4826))', 4326),
  ST_GeomFromText('POINT(32.087186 36.4833)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c8b1803d-6998-472a-a129-d7173249d767',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-730',
  '{"tr": "135. Sokak · Ada Kümesi 69", "en": "135. Sokak · Block Cluster 69"}'::jsonb,
  '135. Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.088056 36.4826, 32.089797 36.4826, 32.089797 36.484, 32.088056 36.484, 32.088056 36.4826))', 4326),
  ST_GeomFromText('POINT(32.088927 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '902a4037-dacf-4d6f-aae5-9d586afa1da6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-767',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 76", "en": "Barbaros Caddesi · Block Cluster 76"}'::jsonb,
  'Barbaros Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.089797 36.4826, 32.091539 36.4826, 32.091539 36.484, 32.089797 36.484, 32.089797 36.4826))', 4326),
  ST_GeomFromText('POINT(32.090668 36.4833)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3921b1f5-cc48-4783-a569-e676056a0978',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-804',
  '{"tr": "135. Sokak · Ada Kümesi 83", "en": "135. Sokak · Block Cluster 83"}'::jsonb,
  '135. Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.091539 36.4826, 32.09328 36.4826, 32.09328 36.484, 32.091539 36.484, 32.091539 36.4826))', 4326),
  ST_GeomFromText('POINT(32.09241 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd43470df-bc54-4d63-a860-7dbc90887e42',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-841',
  '{"tr": "Yangılı Caddesi · Ada Kümesi 1", "en": "Yangılı Caddesi · Block Cluster 1"}'::jsonb,
  'Yangılı Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.09328 36.4826, 32.095021 36.4826, 32.095021 36.484, 32.09328 36.484, 32.09328 36.4826))', 4326),
  ST_GeomFromText('POINT(32.09415 36.4833)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '348e7009-7bd2-4b99-af5c-0b90b060eba2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-878',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 8", "en": "Sarıhasanlı Caddesi · Block Cluster 8"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.095021 36.4826, 32.096762 36.4826, 32.096762 36.484, 32.095021 36.484, 32.095021 36.4826))', 4326),
  ST_GeomFromText('POINT(32.095892 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd19dbed8-db0b-496b-aa96-f7b3aca90843',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-915',
  '{"tr": "Atatürk Caddesi · Ada Kümesi 15", "en": "Atatürk Caddesi · Block Cluster 15"}'::jsonb,
  'Atatürk Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.096762 36.4826, 32.098504 36.4826, 32.098504 36.484, 32.096762 36.484, 32.096762 36.4826))', 4326),
  ST_GeomFromText('POINT(32.097633 36.4833)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'edb37d9a-bf58-46db-a2eb-9b41ad0c6475',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-952',
  '{"tr": "Sarıhasanlı Caddesi · Ada Kümesi 22", "en": "Sarıhasanlı Caddesi · Block Cluster 22"}'::jsonb,
  'Sarıhasanlı Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.098504 36.4826, 32.100245 36.4826, 32.100245 36.484, 32.098504 36.484, 32.098504 36.4826))', 4326),
  ST_GeomFromText('POINT(32.099374 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '55e7c97d-9e82-40fd-ab65-6980f46a6a7a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-989',
  '{"tr": "Vatan Caddesi · Ada Kümesi 29", "en": "Vatan Caddesi · Block Cluster 29"}'::jsonb,
  'Vatan Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.100245 36.4826, 32.101986 36.4826, 32.101986 36.484, 32.100245 36.484, 32.100245 36.4826))', 4326),
  ST_GeomFromText('POINT(32.101116 36.4833)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5dc53ecf-d137-4d5f-acf2-13902efc6c2e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-027',
  '{"tr": "135. Sokak · Ada Kümesi 36", "en": "135. Sokak · Block Cluster 36"}'::jsonb,
  '135. Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.101986 36.4826, 32.103727 36.4826, 32.103727 36.484, 32.101986 36.484, 32.101986 36.4826))', 4326),
  ST_GeomFromText('POINT(32.102857 36.4833)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '176986bd-1c3a-4e21-ab53-789c33a484de',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MHM-064',
  '{"tr": "Barbaros Caddesi · Ada Kümesi 43", "en": "Barbaros Caddesi · Block Cluster 43"}'::jsonb,
  'Barbaros Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.103727 36.4826, 32.105469 36.4826, 32.105469 36.484, 32.103727 36.484, 32.103727 36.4826))', 4326),
  ST_GeomFromText('POINT(32.104598 36.4833)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '92726d90-47e8-4684-a59a-bb14da5b4414',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-582',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((31.978762 36.5344, 31.980505 36.5344, 31.980505 36.5358, 31.978762 36.5358, 31.978762 36.5344))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5351)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c8eb6136-1ee8-4f00-a603-be36e7d44036',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-619',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 18", "en": "Ahmet Tokuş Bulvarı · Block Cluster 18"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24242,
  ST_GeomFromText('POLYGON((31.980505 36.5344, 31.982248 36.5344, 31.982248 36.5358, 31.980505 36.5358, 31.980505 36.5344))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5351)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '05981c73-77cb-49d2-a253-85a17d63b645',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-656',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 25", "en": "Damlatas Caddesi · Block Cluster 25"}'::jsonb,
  'Damlatas Caddesi',
  24228,
  ST_GeomFromText('POLYGON((31.982248 36.5344, 31.98399 36.5344, 31.98399 36.5358, 31.982248 36.5358, 31.982248 36.5344))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f5eb64b0-2bcb-4596-ae20-412621b68a46',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-693',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 32", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 32"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((31.98399 36.5344, 31.985733 36.5344, 31.985733 36.5358, 31.98399 36.5358, 31.98399 36.5344))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5351)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6f0f9c58-b56d-45ed-aa62-f9b5247d0245',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-730',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 39", "en": "Damlatas Caddesi · Block Cluster 39"}'::jsonb,
  'Damlatas Caddesi',
  24228,
  ST_GeomFromText('POLYGON((31.985733 36.5344, 31.987475 36.5344, 31.987475 36.5358, 31.985733 36.5358, 31.985733 36.5344))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '88ecfaa6-0f93-4779-a77f-cddf9880321f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-767',
  '{"tr": "Dinek Yolu · Ada Kümesi 46", "en": "Dinek Yolu · Block Cluster 46"}'::jsonb,
  'Dinek Yolu',
  24242,
  ST_GeomFromText('POLYGON((31.987475 36.5344, 31.989218 36.5344, 31.989218 36.5358, 31.987475 36.5358, 31.987475 36.5344))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5351)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bbc9e0e0-2101-46a7-aac8-0647dccbc787',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-804',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 53", "en": "Güzelyalı Caddesi · Block Cluster 53"}'::jsonb,
  'Güzelyalı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((31.989218 36.5344, 31.990961 36.5344, 31.990961 36.5358, 31.989218 36.5358, 31.989218 36.5344))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0d8cd78f-0cd1-4292-a15d-751d1a5e7a21',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-841',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 60", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 60"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24228,
  ST_GeomFromText('POLYGON((31.990961 36.5344, 31.992703 36.5344, 31.992703 36.5358, 31.990961 36.5358, 31.990961 36.5344))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5351)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cfcf132b-4618-4c27-a9d7-3f0c15e73f52',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-878',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 67", "en": "Güzelyalı Caddesi · Block Cluster 67"}'::jsonb,
  'Güzelyalı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((31.992703 36.5344, 31.994446 36.5344, 31.994446 36.5358, 31.992703 36.5358, 31.992703 36.5344))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8243dfe3-3c35-4d09-ae76-e2eabe791cec',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-915',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 74", "en": "Ahmet Tokuş Bulvarı · Block Cluster 74"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24242,
  ST_GeomFromText('POLYGON((31.994446 36.5344, 31.996189 36.5344, 31.996189 36.5358, 31.994446 36.5358, 31.994446 36.5344))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5351)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9558cacf-2b68-47a9-ae30-1d66c0c1a278',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-952',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 81", "en": "Damlatas Caddesi · Block Cluster 81"}'::jsonb,
  'Damlatas Caddesi',
  24228,
  ST_GeomFromText('POLYGON((31.996189 36.5344, 31.997931 36.5344, 31.997931 36.5358, 31.996189 36.5358, 31.996189 36.5344))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '67a168ff-a264-4b41-a5c5-43be0a059440',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-989',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 88", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 88"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((31.997931 36.5344, 31.999674 36.5344, 31.999674 36.5358, 31.997931 36.5358, 31.997931 36.5344))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5351)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '21170b39-ea1e-4db9-ab09-e6800b35f8f2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-027',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 6", "en": "Damlatas Caddesi · Block Cluster 6"}'::jsonb,
  'Damlatas Caddesi',
  24228,
  ST_GeomFromText('POLYGON((31.999674 36.5344, 32.001416 36.5344, 32.001416 36.5358, 31.999674 36.5358, 31.999674 36.5344))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3525afbf-99f2-4db7-acd7-8208cf17dd76',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-064',
  '{"tr": "Dinek Yolu · Ada Kümesi 13", "en": "Dinek Yolu · Block Cluster 13"}'::jsonb,
  'Dinek Yolu',
  24242,
  ST_GeomFromText('POLYGON((32.001416 36.5344, 32.003159 36.5344, 32.003159 36.5358, 32.001416 36.5358, 32.001416 36.5344))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5351)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5c3a86ed-6fc5-4ad6-a3ff-ec3bcbfff1c3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-101',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 20", "en": "Güzelyalı Caddesi · Block Cluster 20"}'::jsonb,
  'Güzelyalı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((32.003159 36.5344, 32.004902 36.5344, 32.004902 36.5358, 32.003159 36.5358, 32.003159 36.5344))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bb97c4df-1d0c-4dcb-a69b-4914d8a452aa',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-138',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 27", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 27"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24228,
  ST_GeomFromText('POLYGON((32.004902 36.5344, 32.006644 36.5344, 32.006644 36.5358, 32.004902 36.5358, 32.004902 36.5344))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5351)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1ceb4506-c75e-4117-abb5-2411e449a61d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-175',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 34", "en": "Güzelyalı Caddesi · Block Cluster 34"}'::jsonb,
  'Güzelyalı Caddesi',
  24242,
  ST_GeomFromText('POLYGON((32.006644 36.5344, 32.008387 36.5344, 32.008387 36.5358, 32.006644 36.5358, 32.006644 36.5344))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5351)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4a63fa30-5be1-4ca5-a182-d695a64526d5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-212',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 41", "en": "Ahmet Tokuş Bulvarı · Block Cluster 41"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24228,
  ST_GeomFromText('POLYGON((32.008387 36.5344, 32.010129 36.5344, 32.010129 36.5358, 32.008387 36.5358, 32.008387 36.5344))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5351)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '19037446-7206-472b-ab05-e36d8b0a0b71',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-655',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.978762 36.5358, 31.980505 36.5358, 31.980505 36.5372, 31.978762 36.5372, 31.978762 36.5358))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5365)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fa559014-da93-4a7f-a0c6-6a6bd4e98a93',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-692',
  '{"tr": "Müze Sokak · Ada Kümesi 31", "en": "Müze Sokak · Block Cluster 31"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.980505 36.5358, 31.982248 36.5358, 31.982248 36.5372, 31.980505 36.5372, 31.980505 36.5358))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '45a9b71b-3797-41fd-a23e-f6e67d40f918',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-729',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 38", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 38"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.982248 36.5358, 31.98399 36.5358, 31.98399 36.5372, 31.982248 36.5372, 31.982248 36.5358))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5365)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a3277eeb-94bf-4c44-a798-c2af37e73b2f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-766',
  '{"tr": "Postacılar Sokak · Ada Kümesi 45", "en": "Postacılar Sokak · Block Cluster 45"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.98399 36.5358, 31.985733 36.5358, 31.985733 36.5372, 31.98399 36.5372, 31.98399 36.5358))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd4e45fa7-4aa6-49ce-ae42-76691f8a8975',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-803',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 52", "en": "Ahmet Tokuş Bulvarı · Block Cluster 52"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((31.985733 36.5358, 31.987475 36.5358, 31.987475 36.5372, 31.985733 36.5372, 31.985733 36.5358))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5365)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6cd3577d-ca03-4c25-a6d0-2b5836d6d3a2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-840',
  '{"tr": "Postacılar Sokak · Ada Kümesi 59", "en": "Postacılar Sokak · Block Cluster 59"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.987475 36.5358, 31.989218 36.5358, 31.989218 36.5372, 31.987475 36.5372, 31.987475 36.5358))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'adf7e81a-8ce7-407d-a110-d8673adf1897',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-877',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 66", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 66"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.989218 36.5358, 31.990961 36.5358, 31.990961 36.5372, 31.989218 36.5372, 31.989218 36.5358))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5365)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '41dbabd8-0ef1-4c6c-af2a-37b450cd4844',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-914',
  '{"tr": "Postacılar Sokak · Ada Kümesi 73", "en": "Postacılar Sokak · Block Cluster 73"}'::jsonb,
  'Postacılar Sokak',
  24227,
  ST_GeomFromText('POLYGON((31.990961 36.5358, 31.992703 36.5358, 31.992703 36.5372, 31.990961 36.5372, 31.990961 36.5358))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bb003c2e-0646-4627-ad46-9a09c146e255',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-951',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 80", "en": "Ahmet Tokuş Bulvarı · Block Cluster 80"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.992703 36.5358, 31.994446 36.5358, 31.994446 36.5372, 31.992703 36.5372, 31.992703 36.5358))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5365)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4154ca95-434b-4e87-a21f-a41284a0391c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-988',
  '{"tr": "Postacılar Sokak · Ada Kümesi 87", "en": "Postacılar Sokak · Block Cluster 87"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.994446 36.5358, 31.996189 36.5358, 31.996189 36.5372, 31.994446 36.5372, 31.994446 36.5358))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8659f8b7-f2f2-475c-a4ab-afeb794c5013',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-026',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 5", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 5"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.996189 36.5358, 31.997931 36.5358, 31.997931 36.5372, 31.996189 36.5372, 31.996189 36.5358))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5365)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '207b1070-a6db-4b65-a6a0-fb15c756fbd5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-063',
  '{"tr": "Postacılar Sokak · Ada Kümesi 12", "en": "Postacılar Sokak · Block Cluster 12"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.997931 36.5358, 31.999674 36.5358, 31.999674 36.5372, 31.997931 36.5372, 31.997931 36.5358))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '346be1f8-730e-42e2-a765-a31aa77a24da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-100',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 19", "en": "Ahmet Tokuş Bulvarı · Block Cluster 19"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((31.999674 36.5358, 32.001416 36.5358, 32.001416 36.5372, 31.999674 36.5372, 31.999674 36.5358))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5365)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c65ae241-af8a-4b6e-a9d0-992f75e55daf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-137',
  '{"tr": "Postacılar Sokak · Ada Kümesi 26", "en": "Postacılar Sokak · Block Cluster 26"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((32.001416 36.5358, 32.003159 36.5358, 32.003159 36.5372, 32.001416 36.5372, 32.001416 36.5358))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2c625aae-2cce-43ea-a0ac-39445930be98',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-174',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 33", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 33"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((32.003159 36.5358, 32.004902 36.5358, 32.004902 36.5372, 32.003159 36.5372, 32.003159 36.5358))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5365)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8b7d5c72-0447-4a22-af3a-96508fc52694',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-211',
  '{"tr": "Postacılar Sokak · Ada Kümesi 40", "en": "Postacılar Sokak · Block Cluster 40"}'::jsonb,
  'Postacılar Sokak',
  24227,
  ST_GeomFromText('POLYGON((32.004902 36.5358, 32.006644 36.5358, 32.006644 36.5372, 32.004902 36.5372, 32.004902 36.5358))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '85d5507a-e4aa-43d2-a17f-c3a86a7fe44c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-248',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 47", "en": "Ahmet Tokuş Bulvarı · Block Cluster 47"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((32.006644 36.5358, 32.008387 36.5358, 32.008387 36.5372, 32.006644 36.5372, 32.006644 36.5358))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5365)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1e6adc1c-d881-4121-a6eb-cd3df6ebed3d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-285',
  '{"tr": "Postacılar Sokak · Ada Kümesi 54", "en": "Postacılar Sokak · Block Cluster 54"}'::jsonb,
  'Postacılar Sokak',
  24227,
  ST_GeomFromText('POLYGON((32.008387 36.5358, 32.010129 36.5358, 32.010129 36.5372, 32.008387 36.5372, 32.008387 36.5358))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5365)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '243b3124-8e29-4bd6-aa12-daf2b2651cfa',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-728',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.978762 36.5372, 31.980505 36.5372, 31.980505 36.5386, 31.978762 36.5386, 31.978762 36.5372))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '164e278f-ca90-45b7-acde-a238e0dead46',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-765',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 44", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 44"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.980505 36.5372, 31.982248 36.5372, 31.982248 36.5386, 31.980505 36.5386, 31.980505 36.5372))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '730b38d1-d1d3-456d-a2d8-3dbc44de3e3e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-802',
  '{"tr": "Stad Caddesi · Ada Kümesi 51", "en": "Stad Caddesi · Block Cluster 51"}'::jsonb,
  'Stad Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.982248 36.5372, 31.98399 36.5372, 31.98399 36.5386, 31.982248 36.5386, 31.982248 36.5372))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '91b727a7-b126-4f94-a091-183342dd673b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-839',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 58", "en": "Atatürk Bulvarı · Block Cluster 58"}'::jsonb,
  'Atatürk Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.98399 36.5372, 31.985733 36.5372, 31.985733 36.5386, 31.98399 36.5386, 31.98399 36.5372))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5379)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0615dca-88fb-494c-a89a-b486595d4716',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-876',
  '{"tr": "Müze Sokak · Ada Kümesi 65", "en": "Müze Sokak · Block Cluster 65"}'::jsonb,
  'Müze Sokak',
  24227,
  ST_GeomFromText('POLYGON((31.985733 36.5372, 31.987475 36.5372, 31.987475 36.5386, 31.985733 36.5386, 31.985733 36.5372))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9bd259b9-bf8d-4d35-a45f-448c5b5f76ee',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-913',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 72", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 72"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.987475 36.5372, 31.989218 36.5372, 31.989218 36.5386, 31.987475 36.5386, 31.987475 36.5372))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '18248e9b-1f99-441a-a7bd-4a8137be52b5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-950',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 79", "en": "Güzelyalı Caddesi · Block Cluster 79"}'::jsonb,
  'Güzelyalı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.989218 36.5372, 31.990961 36.5372, 31.990961 36.5386, 31.989218 36.5386, 31.989218 36.5372))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '422b0c57-1473-47f2-a658-aba5569eb449',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-987',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 86", "en": "Atatürk Bulvarı · Block Cluster 86"}'::jsonb,
  'Atatürk Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((31.990961 36.5372, 31.992703 36.5372, 31.992703 36.5386, 31.990961 36.5386, 31.990961 36.5372))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5379)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '34da4f06-e54a-48c5-a190-17c31a24a7cb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-025',
  '{"tr": "Müze Sokak · Ada Kümesi 4", "en": "Müze Sokak · Block Cluster 4"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.992703 36.5372, 31.994446 36.5372, 31.994446 36.5386, 31.992703 36.5386, 31.992703 36.5372))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '22474bc2-241c-41ec-a65b-0a2e46638dae',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-062',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 11", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 11"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.994446 36.5372, 31.996189 36.5372, 31.996189 36.5386, 31.994446 36.5386, 31.994446 36.5372))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f8d8985c-c6f3-4013-ae2b-884fbfcba86f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-099',
  '{"tr": "Stad Caddesi · Ada Kümesi 18", "en": "Stad Caddesi · Block Cluster 18"}'::jsonb,
  'Stad Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.996189 36.5372, 31.997931 36.5372, 31.997931 36.5386, 31.996189 36.5386, 31.996189 36.5372))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1cf3276c-e355-4ff9-afa6-189500486765',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-136',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 25", "en": "Atatürk Bulvarı · Block Cluster 25"}'::jsonb,
  'Atatürk Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.997931 36.5372, 31.999674 36.5372, 31.999674 36.5386, 31.997931 36.5386, 31.997931 36.5372))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5379)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '83998816-b250-49e6-a1c9-31f035ea41fc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-173',
  '{"tr": "Müze Sokak · Ada Kümesi 32", "en": "Müze Sokak · Block Cluster 32"}'::jsonb,
  'Müze Sokak',
  24227,
  ST_GeomFromText('POLYGON((31.999674 36.5372, 32.001416 36.5372, 32.001416 36.5386, 31.999674 36.5386, 31.999674 36.5372))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '27854182-f0ba-40bf-a73f-d13d183fd241',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-210',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 39", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 39"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((32.001416 36.5372, 32.003159 36.5372, 32.003159 36.5386, 32.001416 36.5386, 32.001416 36.5372))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1dfedb3e-7f40-434d-a2be-78739d3f7e8b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-247',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 46", "en": "Güzelyalı Caddesi · Block Cluster 46"}'::jsonb,
  'Güzelyalı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((32.003159 36.5372, 32.004902 36.5372, 32.004902 36.5386, 32.003159 36.5386, 32.003159 36.5372))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '232f7e2f-b3da-41fa-a0f5-afd5d70a5029',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-284',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 53", "en": "Atatürk Bulvarı · Block Cluster 53"}'::jsonb,
  'Atatürk Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((32.004902 36.5372, 32.006644 36.5372, 32.006644 36.5386, 32.004902 36.5386, 32.004902 36.5372))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5379)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b85cbbaa-1b80-4ae6-a3dc-114cd3dd6690',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-321',
  '{"tr": "Müze Sokak · Ada Kümesi 60", "en": "Müze Sokak · Block Cluster 60"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((32.006644 36.5372, 32.008387 36.5372, 32.008387 36.5386, 32.006644 36.5386, 32.006644 36.5372))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5379)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78c80fe6-9018-4eeb-a8d0-110d08e02ed1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-358',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 67", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 67"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((32.008387 36.5372, 32.010129 36.5372, 32.010129 36.5386, 32.008387 36.5386, 32.008387 36.5372))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5379)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '94ca1cb8-2ca3-40d2-a869-cc6ac16ded8a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-801',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.978762 36.5386, 31.980505 36.5386, 31.980505 36.54, 31.978762 36.54, 31.978762 36.5386))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5393)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7aa53351-1fcd-45b7-a568-36e69a723908',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-838',
  '{"tr": "Postacılar Sokak · Ada Kümesi 57", "en": "Postacılar Sokak · Block Cluster 57"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.980505 36.5386, 31.982248 36.5386, 31.982248 36.54, 31.980505 36.54, 31.980505 36.5386))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '842bee75-c47e-41dd-a055-4fa848aa9052',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-875',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 64", "en": "Atatürk Bulvarı · Block Cluster 64"}'::jsonb,
  'Atatürk Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((31.982248 36.5386, 31.98399 36.5386, 31.98399 36.54, 31.982248 36.54, 31.982248 36.5386))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5393)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd74716ec-6f25-48de-a862-be32466cbfca',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-912',
  '{"tr": "Postacılar Sokak · Ada Kümesi 71", "en": "Postacılar Sokak · Block Cluster 71"}'::jsonb,
  'Postacılar Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.98399 36.5386, 31.985733 36.5386, 31.985733 36.54, 31.98399 36.54, 31.98399 36.5386))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a48ea0f9-3b81-412d-af0f-81d4e00fc226',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-949',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 78", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 78"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.985733 36.5386, 31.987475 36.5386, 31.987475 36.54, 31.985733 36.54, 31.985733 36.5386))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5393)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5a6b0d82-7e17-4ff1-a47c-6273d8827d73',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-986',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 85", "en": "Güzelyalı Caddesi · Block Cluster 85"}'::jsonb,
  'Güzelyalı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.987475 36.5386, 31.989218 36.5386, 31.989218 36.54, 31.987475 36.54, 31.987475 36.5386))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2bffea0e-1dc5-4731-a63a-8d3f49c5513f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-024',
  '{"tr": "Dinek Yolu · Ada Kümesi 3", "en": "Dinek Yolu · Block Cluster 3"}'::jsonb,
  'Dinek Yolu',
  24241,
  ST_GeomFromText('POLYGON((31.989218 36.5386, 31.990961 36.5386, 31.990961 36.54, 31.989218 36.54, 31.989218 36.5386))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5393)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '14c140a4-39e6-4f47-ad27-6fe34ea76feb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-061',
  '{"tr": "Müze Sokak · Ada Kümesi 10", "en": "Müze Sokak · Block Cluster 10"}'::jsonb,
  'Müze Sokak',
  24227,
  ST_GeomFromText('POLYGON((31.990961 36.5386, 31.992703 36.5386, 31.992703 36.54, 31.990961 36.54, 31.990961 36.5386))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dffc9914-6142-4fc6-aebe-06d2413f38da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-098',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 17", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 17"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.992703 36.5386, 31.994446 36.5386, 31.994446 36.54, 31.992703 36.54, 31.992703 36.5386))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5393)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5c2c6f8e-657e-481c-a952-5792c1aaa7aa',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-135',
  '{"tr": "Stad Caddesi · Ada Kümesi 24", "en": "Stad Caddesi · Block Cluster 24"}'::jsonb,
  'Stad Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.994446 36.5386, 31.996189 36.5386, 31.996189 36.54, 31.994446 36.54, 31.994446 36.5386))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9c5d2546-6921-4527-a57c-7061057e7a6d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-172',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 31", "en": "Atatürk Bulvarı · Block Cluster 31"}'::jsonb,
  'Atatürk Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((31.996189 36.5386, 31.997931 36.5386, 31.997931 36.54, 31.996189 36.54, 31.996189 36.5386))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5393)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7a60610c-5fbc-4698-a5dc-0794da1cc7a4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-209',
  '{"tr": "Müze Sokak · Ada Kümesi 38", "en": "Müze Sokak · Block Cluster 38"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((31.997931 36.5386, 31.999674 36.5386, 31.999674 36.54, 31.997931 36.54, 31.997931 36.5386))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4d9e61dd-dd24-4a91-a0ba-3b4c2ac2bc6e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-246',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 45", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 45"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.999674 36.5386, 32.001416 36.5386, 32.001416 36.54, 31.999674 36.54, 31.999674 36.5386))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5393)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '825b7057-2d2c-40e0-af77-a0b7af884137',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-283',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 52", "en": "Güzelyalı Caddesi · Block Cluster 52"}'::jsonb,
  'Güzelyalı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((32.001416 36.5386, 32.003159 36.5386, 32.003159 36.54, 32.001416 36.54, 32.001416 36.5386))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fb1d9938-fb24-433f-a039-5a07f6425c77',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-320',
  '{"tr": "Dinek Yolu · Ada Kümesi 59", "en": "Dinek Yolu · Block Cluster 59"}'::jsonb,
  'Dinek Yolu',
  24241,
  ST_GeomFromText('POLYGON((32.003159 36.5386, 32.004902 36.5386, 32.004902 36.54, 32.003159 36.54, 32.003159 36.5386))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5393)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '94bfafe6-34ab-44e6-a014-fb00c96b04cc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-357',
  '{"tr": "Postacılar Sokak · Ada Kümesi 66", "en": "Postacılar Sokak · Block Cluster 66"}'::jsonb,
  'Postacılar Sokak',
  24227,
  ST_GeomFromText('POLYGON((32.004902 36.5386, 32.006644 36.5386, 32.006644 36.54, 32.004902 36.54, 32.004902 36.5386))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3430fe89-7981-4a05-adb1-648cadb2988e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-394',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 73", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 73"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((32.006644 36.5386, 32.008387 36.5386, 32.008387 36.54, 32.006644 36.54, 32.006644 36.5386))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5393)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a38d3eb9-94ba-4293-a737-5c2a3847a14c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-431',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 80", "en": "Güzelyalı Caddesi · Block Cluster 80"}'::jsonb,
  'Güzelyalı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((32.008387 36.5386, 32.010129 36.5386, 32.010129 36.54, 32.008387 36.54, 32.008387 36.5386))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5393)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '53945dca-81fe-4740-a26a-aa8ad593550a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-874',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.978762 36.54, 31.980505 36.54, 31.980505 36.5414, 31.978762 36.5414, 31.978762 36.54))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5407)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f7ac6901-db9a-4743-ac36-5e42d346a044',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-911',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 70", "en": "Ahmet Tokuş Bulvarı · Block Cluster 70"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.980505 36.54, 31.982248 36.54, 31.982248 36.5414, 31.980505 36.5414, 31.980505 36.54))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5407)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f7408f20-0811-4bb0-af51-c490ff51dad0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-948',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 77", "en": "Damlatas Caddesi · Block Cluster 77"}'::jsonb,
  'Damlatas Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.982248 36.54, 31.98399 36.54, 31.98399 36.5414, 31.982248 36.5414, 31.982248 36.54))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd6971818-f8af-4112-ae38-190acf46192a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-985',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 84", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 84"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.98399 36.54, 31.985733 36.54, 31.985733 36.5414, 31.98399 36.5414, 31.98399 36.54))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5407)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b3e11842-48d8-451c-ab39-2d5efcb94d5e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-023',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 2", "en": "Damlatas Caddesi · Block Cluster 2"}'::jsonb,
  'Damlatas Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.985733 36.54, 31.987475 36.54, 31.987475 36.5414, 31.985733 36.5414, 31.985733 36.54))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7c64a254-06db-402a-aabf-427e8340827e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-060',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 9", "en": "Atatürk Bulvarı · Block Cluster 9"}'::jsonb,
  'Atatürk Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.987475 36.54, 31.989218 36.54, 31.989218 36.5414, 31.987475 36.5414, 31.987475 36.54))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5407)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '323624c5-84a1-4953-a697-ed96b6d7ee18',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-097',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 16", "en": "Damlatas Caddesi · Block Cluster 16"}'::jsonb,
  'Damlatas Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.989218 36.54, 31.990961 36.54, 31.990961 36.5414, 31.989218 36.5414, 31.989218 36.54))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '05fd2ec7-b026-406d-a5db-8eaab623cf34',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-134',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 23", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 23"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.990961 36.54, 31.992703 36.54, 31.992703 36.5414, 31.990961 36.5414, 31.990961 36.54))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5407)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '004ce967-7443-4091-a40f-a9f6749029f8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-171',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 30", "en": "Damlatas Caddesi · Block Cluster 30"}'::jsonb,
  'Damlatas Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.992703 36.54, 31.994446 36.54, 31.994446 36.5414, 31.992703 36.5414, 31.992703 36.54))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '96dd62d0-8e2b-4389-a8f6-31592508b659',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-208',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 37", "en": "Atatürk Bulvarı · Block Cluster 37"}'::jsonb,
  'Atatürk Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((31.994446 36.54, 31.996189 36.54, 31.996189 36.5414, 31.994446 36.5414, 31.994446 36.54))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5407)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '486181c0-ef7d-4e0a-a71c-3fca37df3fca',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-245',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 44", "en": "Damlatas Caddesi · Block Cluster 44"}'::jsonb,
  'Damlatas Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.996189 36.54, 31.997931 36.54, 31.997931 36.5414, 31.996189 36.5414, 31.996189 36.54))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3adb93c9-bad6-466d-a00d-e5a4f5b20a36',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-282',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 51", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 51"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24241,
  ST_GeomFromText('POLYGON((31.997931 36.54, 31.999674 36.54, 31.999674 36.5414, 31.997931 36.5414, 31.997931 36.54))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5407)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cdfeb156-03a5-448f-ae5b-15d9d1a455e5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-319',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 58", "en": "Damlatas Caddesi · Block Cluster 58"}'::jsonb,
  'Damlatas Caddesi',
  24227,
  ST_GeomFromText('POLYGON((31.999674 36.54, 32.001416 36.54, 32.001416 36.5414, 31.999674 36.5414, 31.999674 36.54))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a575fb66-871b-4686-a26e-ede02c9111ec',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-356',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 65", "en": "Ahmet Tokuş Bulvarı · Block Cluster 65"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24241,
  ST_GeomFromText('POLYGON((32.001416 36.54, 32.003159 36.54, 32.003159 36.5414, 32.001416 36.5414, 32.001416 36.54))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5407)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '64fbaefa-daba-493d-ae41-57c73fb6a837',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-393',
  '{"tr": "Müze Sokak · Ada Kümesi 72", "en": "Müze Sokak · Block Cluster 72"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((32.003159 36.54, 32.004902 36.54, 32.004902 36.5414, 32.003159 36.5414, 32.003159 36.54))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '46d8c61b-c67d-4734-a0a5-c12f0d55cd4f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-430',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 79", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 79"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24227,
  ST_GeomFromText('POLYGON((32.004902 36.54, 32.006644 36.54, 32.006644 36.5414, 32.004902 36.5414, 32.004902 36.54))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5407)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '920af930-dac2-4097-a8c8-79a76ccd79c7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-467',
  '{"tr": "Müze Sokak · Ada Kümesi 86", "en": "Müze Sokak · Block Cluster 86"}'::jsonb,
  'Müze Sokak',
  24241,
  ST_GeomFromText('POLYGON((32.006644 36.54, 32.008387 36.54, 32.008387 36.5414, 32.006644 36.5414, 32.006644 36.54))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5407)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3dccb83d-96fd-4d2c-ab31-6511d4ca9569',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-504',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 4", "en": "Ahmet Tokuş Bulvarı · Block Cluster 4"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24227,
  ST_GeomFromText('POLYGON((32.008387 36.54, 32.010129 36.54, 32.010129 36.5414, 32.008387 36.5414, 32.008387 36.54))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5407)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b42ffed6-2b2e-42e3-af01-fc35df5e01b9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-947',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.978762 36.5414, 31.980505 36.5414, 31.980505 36.5428, 31.978762 36.5428, 31.978762 36.5414))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5421)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c9e45ddc-d4c0-492c-ad24-94f09ea52708',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-984',
  '{"tr": "Postacılar Sokak · Ada Kümesi 83", "en": "Postacılar Sokak · Block Cluster 83"}'::jsonb,
  'Postacılar Sokak',
  24239,
  ST_GeomFromText('POLYGON((31.980505 36.5414, 31.982248 36.5414, 31.982248 36.5428, 31.980505 36.5428, 31.980505 36.5414))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78ee9f5a-c4be-4db8-ac50-d2e23daced12',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-022',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 1", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 1"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24225,
  ST_GeomFromText('POLYGON((31.982248 36.5414, 31.98399 36.5414, 31.98399 36.5428, 31.982248 36.5428, 31.982248 36.5414))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5421)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6eda6fa6-4da0-4bd3-a37a-7475bc7a8b79',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-059',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 8", "en": "Güzelyalı Caddesi · Block Cluster 8"}'::jsonb,
  'Güzelyalı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.98399 36.5414, 31.985733 36.5414, 31.985733 36.5428, 31.98399 36.5428, 31.98399 36.5414))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cc690def-687b-48e5-a412-850a34e496d4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-096',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 15", "en": "Atatürk Bulvarı · Block Cluster 15"}'::jsonb,
  'Atatürk Bulvarı',
  24225,
  ST_GeomFromText('POLYGON((31.985733 36.5414, 31.987475 36.5414, 31.987475 36.5428, 31.985733 36.5428, 31.985733 36.5414))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5421)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '05109ddc-c09a-4f4e-a58a-2292c5ab5d2a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-133',
  '{"tr": "Müze Sokak · Ada Kümesi 22", "en": "Müze Sokak · Block Cluster 22"}'::jsonb,
  'Müze Sokak',
  24239,
  ST_GeomFromText('POLYGON((31.987475 36.5414, 31.989218 36.5414, 31.989218 36.5428, 31.987475 36.5428, 31.987475 36.5414))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '16f273f5-2df2-4339-ab00-70cc44e4772e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-170',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 29", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 29"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.989218 36.5414, 31.990961 36.5414, 31.990961 36.5428, 31.989218 36.5428, 31.989218 36.5414))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5421)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7f6fd5d7-5973-4e1a-a61c-0bcdd8e3b3f1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-207',
  '{"tr": "Stad Caddesi · Ada Kümesi 36", "en": "Stad Caddesi · Block Cluster 36"}'::jsonb,
  'Stad Caddesi',
  24225,
  ST_GeomFromText('POLYGON((31.990961 36.5414, 31.992703 36.5414, 31.992703 36.5428, 31.990961 36.5428, 31.990961 36.5414))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8981021e-25ff-4359-ac7e-b147af80b577',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-244',
  '{"tr": "Dinek Yolu · Ada Kümesi 43", "en": "Dinek Yolu · Block Cluster 43"}'::jsonb,
  'Dinek Yolu',
  24239,
  ST_GeomFromText('POLYGON((31.992703 36.5414, 31.994446 36.5414, 31.994446 36.5428, 31.992703 36.5428, 31.992703 36.5414))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5421)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '69262af6-5ac0-47da-a3e6-7d2cc3e682d0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-281',
  '{"tr": "Stad Caddesi · Ada Kümesi 50", "en": "Stad Caddesi · Block Cluster 50"}'::jsonb,
  'Stad Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.994446 36.5414, 31.996189 36.5414, 31.996189 36.5428, 31.994446 36.5428, 31.994446 36.5414))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6b383b4f-fe61-4057-a559-fb186999fba6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-318',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 57", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 57"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24225,
  ST_GeomFromText('POLYGON((31.996189 36.5414, 31.997931 36.5414, 31.997931 36.5428, 31.996189 36.5428, 31.996189 36.5414))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5421)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a53244d8-4ab2-49b8-af80-6d60efe46e90',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-355',
  '{"tr": "Stad Caddesi · Ada Kümesi 64", "en": "Stad Caddesi · Block Cluster 64"}'::jsonb,
  'Stad Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.997931 36.5414, 31.999674 36.5414, 31.999674 36.5428, 31.997931 36.5428, 31.997931 36.5414))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd4b47b8a-77ac-4e73-a318-85f94c6179fd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-392',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 71", "en": "Ahmet Tokuş Bulvarı · Block Cluster 71"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24225,
  ST_GeomFromText('POLYGON((31.999674 36.5414, 32.001416 36.5414, 32.001416 36.5428, 31.999674 36.5428, 31.999674 36.5414))', 4326),
  ST_GeomFromText('POINT(32.000545 36.5421)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5f1b3d38-89f9-4999-a6e2-54a1e914a6d1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-429',
  '{"tr": "Stad Caddesi · Ada Kümesi 78", "en": "Stad Caddesi · Block Cluster 78"}'::jsonb,
  'Stad Caddesi',
  24239,
  ST_GeomFromText('POLYGON((32.001416 36.5414, 32.003159 36.5414, 32.003159 36.5428, 32.001416 36.5428, 32.001416 36.5414))', 4326),
  ST_GeomFromText('POINT(32.002287 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9440e02f-a68d-4969-a2cd-d9463ace1998',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-466',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 85", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 85"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((32.003159 36.5414, 32.004902 36.5414, 32.004902 36.5428, 32.003159 36.5428, 32.003159 36.5414))', 4326),
  ST_GeomFromText('POINT(32.004031 36.5421)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f49e7e16-56fd-4b0f-a263-55194b9ba925',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-503',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 3", "en": "Güzelyalı Caddesi · Block Cluster 3"}'::jsonb,
  'Güzelyalı Caddesi',
  24225,
  ST_GeomFromText('POLYGON((32.004902 36.5414, 32.006644 36.5414, 32.006644 36.5428, 32.004902 36.5428, 32.004902 36.5414))', 4326),
  ST_GeomFromText('POINT(32.005773 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '18ef9153-25ff-4dec-ad10-3cbf3eef3f3f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-540',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 10", "en": "Atatürk Bulvarı · Block Cluster 10"}'::jsonb,
  'Atatürk Bulvarı',
  24239,
  ST_GeomFromText('POLYGON((32.006644 36.5414, 32.008387 36.5414, 32.008387 36.5428, 32.006644 36.5428, 32.006644 36.5414))', 4326),
  ST_GeomFromText('POINT(32.007515 36.5421)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2a6a5f60-92e6-4c9d-a88c-13fdbd50abfd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-577',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 17", "en": "Güzelyalı Caddesi · Block Cluster 17"}'::jsonb,
  'Güzelyalı Caddesi',
  24225,
  ST_GeomFromText('POLYGON((32.008387 36.5414, 32.010129 36.5414, 32.010129 36.5428, 32.008387 36.5428, 32.008387 36.5414))', 4326),
  ST_GeomFromText('POINT(32.009258 36.5421)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b4fd2468-e43a-4565-a0c7-a10d9937a9cd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-MRK-021',
  '{"tr": "Alanya Şehir Caddeleri", "en": "Alanya City Streets"}'::jsonb,
  'Alanya Alanya Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.978762 36.5428, 31.980505 36.5428, 31.980505 36.5442, 31.978762 36.5442, 31.978762 36.5428))', 4326),
  ST_GeomFromText('POINT(31.979634 36.5435)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '179a50b1-b0fa-46ad-a760-161cc894975e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-058',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 7", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 7"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.980505 36.5428, 31.982248 36.5428, 31.982248 36.5442, 31.980505 36.5442, 31.980505 36.5428))', 4326),
  ST_GeomFromText('POINT(31.981377 36.5435)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '941092d0-2445-4348-a055-3198b8563618',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-095',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 14", "en": "Güzelyalı Caddesi · Block Cluster 14"}'::jsonb,
  'Güzelyalı Caddesi',
  24225,
  ST_GeomFromText('POLYGON((31.982248 36.5428, 31.98399 36.5428, 31.98399 36.5442, 31.982248 36.5442, 31.982248 36.5428))', 4326),
  ST_GeomFromText('POINT(31.983119 36.5435)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '43f2ca9c-699d-4c04-aa6f-c698ad8fd6a0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-132',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 21", "en": "Ahmet Tokuş Bulvarı · Block Cluster 21"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24239,
  ST_GeomFromText('POLYGON((31.98399 36.5428, 31.985733 36.5428, 31.985733 36.5442, 31.98399 36.5442, 31.98399 36.5428))', 4326),
  ST_GeomFromText('POINT(31.984862 36.5435)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cad338ab-cf86-4b55-a555-63fe9a599400',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-169',
  '{"tr": "Müze Sokak · Ada Kümesi 28", "en": "Müze Sokak · Block Cluster 28"}'::jsonb,
  'Müze Sokak',
  24225,
  ST_GeomFromText('POLYGON((31.985733 36.5428, 31.987475 36.5428, 31.987475 36.5442, 31.985733 36.5442, 31.985733 36.5428))', 4326),
  ST_GeomFromText('POINT(31.986604 36.5435)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c6063435-f749-405a-a14f-f46fbd4ff48f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-206',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 35", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 35"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.987475 36.5428, 31.989218 36.5428, 31.989218 36.5442, 31.987475 36.5442, 31.987475 36.5428))', 4326),
  ST_GeomFromText('POINT(31.988347 36.5435)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b0a23a39-02d1-4383-a273-e9bab3740dbc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-243',
  '{"tr": "Güzelyalı Caddesi · Ada Kümesi 42", "en": "Güzelyalı Caddesi · Block Cluster 42"}'::jsonb,
  'Güzelyalı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.989218 36.5428, 31.990961 36.5428, 31.990961 36.5442, 31.989218 36.5442, 31.989218 36.5428))', 4326),
  ST_GeomFromText('POINT(31.99009 36.5435)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '51b05171-5f1d-4280-aead-23f1b0cdc3f1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-280',
  '{"tr": "Ahmet Tokuş Bulvarı · Ada Kümesi 49", "en": "Ahmet Tokuş Bulvarı · Block Cluster 49"}'::jsonb,
  'Ahmet Tokuş Bulvarı',
  24225,
  ST_GeomFromText('POLYGON((31.990961 36.5428, 31.992703 36.5428, 31.992703 36.5442, 31.990961 36.5442, 31.990961 36.5428))', 4326),
  ST_GeomFromText('POINT(31.991832 36.5435)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1ba9c43f-e9bc-47f5-a215-f3ca0565fc34',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-317',
  '{"tr": "Postacılar Sokak · Ada Kümesi 56", "en": "Postacılar Sokak · Block Cluster 56"}'::jsonb,
  'Postacılar Sokak',
  24239,
  ST_GeomFromText('POLYGON((31.992703 36.5428, 31.994446 36.5428, 31.994446 36.5442, 31.992703 36.5442, 31.992703 36.5428))', 4326),
  ST_GeomFromText('POINT(31.993575 36.5435)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '565ce19d-ad66-4810-ab3a-598d03c399ad',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-354',
  '{"tr": "İsmet Hilmi Balcı Caddesi · Ada Kümesi 63", "en": "İsmet Hilmi Balcı Caddesi · Block Cluster 63"}'::jsonb,
  'İsmet Hilmi Balcı Caddesi',
  24239,
  ST_GeomFromText('POLYGON((31.994446 36.5428, 31.996189 36.5428, 31.996189 36.5442, 31.994446 36.5442, 31.994446 36.5428))', 4326),
  ST_GeomFromText('POINT(31.995318 36.5435)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4682f6a5-ded5-4f0d-a857-09a82558f5b2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-391',
  '{"tr": "Damlatas Caddesi · Ada Kümesi 70", "en": "Damlatas Caddesi · Block Cluster 70"}'::jsonb,
  'Damlatas Caddesi',
  24225,
  ST_GeomFromText('POLYGON((31.996189 36.5428, 31.997931 36.5428, 31.997931 36.5442, 31.996189 36.5442, 31.996189 36.5428))', 4326),
  ST_GeomFromText('POINT(31.99706 36.5435)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3d11fb2b-e8e5-4231-a5f4-491a25f7ad5c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-ALN-SRY-428',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 77", "en": "Atatürk Bulvarı · Block Cluster 77"}'::jsonb,
  'Atatürk Bulvarı',
  24239,
  ST_GeomFromText('POLYGON((31.997931 36.5428, 31.999674 36.5428, 31.999674 36.5442, 31.997931 36.5442, 31.997931 36.5428))', 4326),
  ST_GeomFromText('POINT(31.998803 36.5435)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0aa4ba52-bff8-4596-a55c-2fc4ca9d4fe8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-149',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.018207 40.9738, 29.020061 40.9738, 29.020061 40.9752, 29.018207 40.9752, 29.018207 40.9738))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9745)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8f6e2a6c-59fb-4652-a695-2c3ee96930be',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-186',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.020061 40.9738, 29.021916 40.9738, 29.021916 40.9752, 29.020061 40.9752, 29.020061 40.9738))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5a861d22-ed09-44f1-a78f-89d3478fb213',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-223',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.021916 40.9738, 29.02377 40.9738, 29.02377 40.9752, 29.021916 40.9752, 29.021916 40.9738))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9745)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '48fcafc6-e577-42ed-ad8b-cd2b2e7412b3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-260',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.02377 40.9738, 29.025625 40.9738, 29.025625 40.9752, 29.02377 40.9752, 29.02377 40.9738))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a4a4cdd4-6bdd-4a58-af79-078c1082982c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-297',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.025625 40.9738, 29.027479 40.9738, 29.027479 40.9752, 29.025625 40.9752, 29.025625 40.9738))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9745)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '76484a28-4bdd-4105-ad95-db2dc225db2d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-334',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.027479 40.9738, 29.029334 40.9738, 29.029334 40.9752, 29.027479 40.9752, 29.027479 40.9738))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9745)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f581f789-cb6c-4e9f-aeed-1916c0eee628',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-371',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.029334 40.9738, 29.031188 40.9738, 29.031188 40.9752, 29.029334 40.9752, 29.029334 40.9738))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd67eb913-c237-4ba4-a449-d2b798b624b7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-408',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.031188 40.9738, 29.033043 40.9738, 29.033043 40.9752, 29.031188 40.9752, 29.031188 40.9738))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f491bc9e-4c0d-449c-a89c-2802409f513a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-445',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.033043 40.9738, 29.034897 40.9738, 29.034897 40.9752, 29.033043 40.9752, 29.033043 40.9738))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9002ec87-9863-4fea-a861-436d28669c71',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-482',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.034897 40.9738, 29.036752 40.9738, 29.036752 40.9752, 29.034897 40.9752, 29.034897 40.9738))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd94b8261-8b15-4688-a25e-d4e96460d8e9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-519',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.036752 40.9738, 29.038607 40.9738, 29.038607 40.9752, 29.036752 40.9752, 29.036752 40.9738))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4fbf7133-e95f-4dfd-a6e0-7cce391e7f30',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-556',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.038607 40.9738, 29.040461 40.9738, 29.040461 40.9752, 29.038607 40.9752, 29.038607 40.9738))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9745)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ec193e02-b259-4042-ae40-7e409e727e44',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-222',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.018207 40.9752, 29.020061 40.9752, 29.020061 40.9766, 29.018207 40.9766, 29.018207 40.9752))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9759)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7ce11700-5245-4ec6-aea4-a9c6cf26d5c6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-259',
  '{"tr": "Moda Caddesi · Ada Kümesi 76", "en": "Moda Caddesi · Block Cluster 76"}'::jsonb,
  'Moda Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.020061 40.9752, 29.021916 40.9752, 29.021916 40.9766, 29.020061 40.9766, 29.020061 40.9752))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9759)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2d4a5ddb-8549-4304-a803-3edfb293c0df',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-296',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 83", "en": "Kafesçi Sokak · Block Cluster 83"}'::jsonb,
  'Kafesçi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.021916 40.9752, 29.02377 40.9752, 29.02377 40.9766, 29.021916 40.9766, 29.021916 40.9752))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9759)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f7bfeee9-3e41-4d0b-a9fe-63e236017bf4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-333',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 1", "en": "Bahariye Caddesi · Block Cluster 1"}'::jsonb,
  'Bahariye Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.02377 40.9752, 29.025625 40.9752, 29.025625 40.9766, 29.02377 40.9766, 29.02377 40.9752))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9759)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '33780d3e-329d-4871-a1e5-654f661575af',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-370',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 8", "en": "Kafesçi Sokak · Block Cluster 8"}'::jsonb,
  'Kafesçi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.025625 40.9752, 29.027479 40.9752, 29.027479 40.9766, 29.025625 40.9766, 29.025625 40.9752))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9759)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '341c97b0-c17e-4ce5-a562-7b55f59b8495',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-407',
  '{"tr": "Moda Caddesi · Ada Kümesi 15", "en": "Moda Caddesi · Block Cluster 15"}'::jsonb,
  'Moda Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.027479 40.9752, 29.029334 40.9752, 29.029334 40.9766, 29.027479 40.9766, 29.027479 40.9752))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9759)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2669facc-05bc-4d1e-a3d5-37d22c26c7ea',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-444',
  '{"tr": "Ağabey Sokak · Ada Kümesi 22", "en": "Ağabey Sokak · Block Cluster 22"}'::jsonb,
  'Ağabey Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.029334 40.9752, 29.031188 40.9752, 29.031188 40.9766, 29.029334 40.9766, 29.029334 40.9752))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9759)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c7980d1f-a40c-44db-a394-b9c46ba4c1fa',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-481',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 29", "en": "Bahariye Caddesi · Block Cluster 29"}'::jsonb,
  'Bahariye Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.031188 40.9752, 29.033043 40.9752, 29.033043 40.9766, 29.031188 40.9766, 29.031188 40.9752))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9759)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'afd910fb-59a2-4c10-a67b-1ceb097b1d0b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-518',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 36", "en": "Ferit Tek Sokak · Block Cluster 36"}'::jsonb,
  'Ferit Tek Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.033043 40.9752, 29.034897 40.9752, 29.034897 40.9766, 29.033043 40.9766, 29.033043 40.9752))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9759)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a2a4e945-1c69-4db9-aecd-14fcbf0ee6fe',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-555',
  '{"tr": "Moda Caddesi · Ada Kümesi 43", "en": "Moda Caddesi · Block Cluster 43"}'::jsonb,
  'Moda Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.034897 40.9752, 29.036752 40.9752, 29.036752 40.9766, 29.034897 40.9766, 29.034897 40.9752))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9759)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '975a0001-6df8-48ac-aaa2-48ad055248ad',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-592',
  '{"tr": "Ağabey Sokak · Ada Kümesi 50", "en": "Ağabey Sokak · Block Cluster 50"}'::jsonb,
  'Ağabey Sokak',
  24242,
  ST_GeomFromText('POLYGON((29.036752 40.9752, 29.038607 40.9752, 29.038607 40.9766, 29.036752 40.9766, 29.036752 40.9752))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9759)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5e537513-4b62-40d2-a531-95c1a9b655e5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-629',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 57", "en": "Bahariye Caddesi · Block Cluster 57"}'::jsonb,
  'Bahariye Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.038607 40.9752, 29.040461 40.9752, 29.040461 40.9766, 29.038607 40.9766, 29.038607 40.9752))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9759)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '59edb496-a106-451c-a8eb-c18afaf429b2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-295',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.018207 40.9766, 29.020061 40.9766, 29.020061 40.978, 29.018207 40.978, 29.018207 40.9766))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9773)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '13cfcbc8-16f3-4035-a53c-5bfd2ac35bfd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-332',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 89", "en": "Kafesçi Sokak · Block Cluster 89"}'::jsonb,
  'Kafesçi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.020061 40.9766, 29.021916 40.9766, 29.021916 40.978, 29.020061 40.978, 29.020061 40.9766))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3fec5af2-17aa-43ae-a846-995c57971ea0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-369',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 7", "en": "Şair Nefi Sokak · Block Cluster 7"}'::jsonb,
  'Şair Nefi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.021916 40.9766, 29.02377 40.9766, 29.02377 40.978, 29.021916 40.978, 29.021916 40.9766))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9773)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a491d8d3-abcd-4bf6-af5c-4325505f74c9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-406',
  '{"tr": "Ağabey Sokak · Ada Kümesi 14", "en": "Ağabey Sokak · Block Cluster 14"}'::jsonb,
  'Ağabey Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.02377 40.9766, 29.025625 40.9766, 29.025625 40.978, 29.02377 40.978, 29.02377 40.9766))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '33d67e9c-7ff7-4875-ac21-c6e9b3ce3711',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-443',
  '{"tr": "Moda Caddesi · Ada Kümesi 21", "en": "Moda Caddesi · Block Cluster 21"}'::jsonb,
  'Moda Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.025625 40.9766, 29.027479 40.9766, 29.027479 40.978, 29.025625 40.978, 29.025625 40.9766))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9773)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9743d3a0-c2bf-4a63-a5fc-e9c35a030e03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-480',
  '{"tr": "Ağabey Sokak · Ada Kümesi 28", "en": "Ağabey Sokak · Block Cluster 28"}'::jsonb,
  'Ağabey Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.027479 40.9766, 29.029334 40.9766, 29.029334 40.978, 29.027479 40.978, 29.027479 40.9766))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c9e51767-b3fd-4f0e-aa18-28697de25675',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-517',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 35", "en": "Bahariye Caddesi · Block Cluster 35"}'::jsonb,
  'Bahariye Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.029334 40.9766, 29.031188 40.9766, 29.031188 40.978, 29.029334 40.978, 29.029334 40.9766))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9773)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '40a07c8f-56a2-4886-a602-34099742c515',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-554',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 42", "en": "Kafesçi Sokak · Block Cluster 42"}'::jsonb,
  'Kafesçi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.031188 40.9766, 29.033043 40.9766, 29.033043 40.978, 29.031188 40.978, 29.031188 40.9766))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7cf0ef9c-6af3-4e44-a603-d1d8e7e42de0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-591',
  '{"tr": "Moda Caddesi · Ada Kümesi 49", "en": "Moda Caddesi · Block Cluster 49"}'::jsonb,
  'Moda Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.033043 40.9766, 29.034897 40.9766, 29.034897 40.978, 29.033043 40.978, 29.033043 40.9766))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9773)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fa69e588-909e-4771-aaf7-82f98b084cf9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-628',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 56", "en": "Kafesçi Sokak · Block Cluster 56"}'::jsonb,
  'Kafesçi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.034897 40.9766, 29.036752 40.9766, 29.036752 40.978, 29.034897 40.978, 29.034897 40.9766))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '73cffaba-74d4-41ef-a71b-0b55e8a4eca9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-665',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 63", "en": "Şair Nefi Sokak · Block Cluster 63"}'::jsonb,
  'Şair Nefi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.036752 40.9766, 29.038607 40.9766, 29.038607 40.978, 29.036752 40.978, 29.036752 40.9766))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9773)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2f86abef-9420-432b-aba6-f8c4c3a6ff1a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-702',
  '{"tr": "Ağabey Sokak · Ada Kümesi 70", "en": "Ağabey Sokak · Block Cluster 70"}'::jsonb,
  'Ağabey Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.038607 40.9766, 29.040461 40.9766, 29.040461 40.978, 29.038607 40.978, 29.038607 40.9766))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9773)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bf931150-8255-4fd2-adc6-be8241e8c122',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-368',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.018207 40.978, 29.020061 40.978, 29.020061 40.9794, 29.018207 40.9794, 29.018207 40.978))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9787)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fcae299d-a9c9-4ad8-a567-8345a677d475',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-405',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 13", "en": "Bahariye Caddesi · Block Cluster 13"}'::jsonb,
  'Bahariye Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.020061 40.978, 29.021916 40.978, 29.021916 40.9794, 29.020061 40.9794, 29.020061 40.978))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9787)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '52652710-153e-44f3-a75b-53e367a39c03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-442',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 20", "en": "Kafesçi Sokak · Block Cluster 20"}'::jsonb,
  'Kafesçi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.021916 40.978, 29.02377 40.978, 29.02377 40.9794, 29.021916 40.9794, 29.021916 40.978))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9787)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '251bdc44-c17e-42e9-a465-1eade69a9f2d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-479',
  '{"tr": "Söğütlüçeşme Caddesi · Ada Kümesi 27", "en": "Söğütlüçeşme Caddesi · Block Cluster 27"}'::jsonb,
  'Söğütlüçeşme Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.02377 40.978, 29.025625 40.978, 29.025625 40.9794, 29.02377 40.9794, 29.02377 40.978))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9787)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e6e061e2-8971-413e-af91-00dc7051c320',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-516',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 34", "en": "Ferit Tek Sokak · Block Cluster 34"}'::jsonb,
  'Ferit Tek Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.025625 40.978, 29.027479 40.978, 29.027479 40.9794, 29.025625 40.9794, 29.025625 40.978))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9787)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '002e5365-df41-4d7d-af6f-0e18df6fb0e2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-553',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 41", "en": "Bahariye Caddesi · Block Cluster 41"}'::jsonb,
  'Bahariye Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.027479 40.978, 29.029334 40.978, 29.029334 40.9794, 29.027479 40.9794, 29.027479 40.978))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9787)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '588f59bc-55f6-4304-ad79-aab8ae864cc0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-590',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 48", "en": "Kafesçi Sokak · Block Cluster 48"}'::jsonb,
  'Kafesçi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.029334 40.978, 29.031188 40.978, 29.031188 40.9794, 29.029334 40.9794, 29.029334 40.978))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9787)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a10f1e7b-be33-404b-af3c-fe305f42fec6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-627',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 55", "en": "Rıhtım Caddesi · Block Cluster 55"}'::jsonb,
  'Rıhtım Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.031188 40.978, 29.033043 40.978, 29.033043 40.9794, 29.031188 40.9794, 29.031188 40.978))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9787)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3eff06e5-c423-4f67-aadc-19820322264c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-664',
  '{"tr": "Ağabey Sokak · Ada Kümesi 62", "en": "Ağabey Sokak · Block Cluster 62"}'::jsonb,
  'Ağabey Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.033043 40.978, 29.034897 40.978, 29.034897 40.9794, 29.033043 40.9794, 29.033043 40.978))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9787)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4e0d5259-5caf-4975-a2a2-bb2caabd3bce',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-701',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 69", "en": "Bahariye Caddesi · Block Cluster 69"}'::jsonb,
  'Bahariye Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.034897 40.978, 29.036752 40.978, 29.036752 40.9794, 29.034897 40.9794, 29.034897 40.978))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9787)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '227228fb-4a10-43c0-a862-6b3b6c826cbb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-738',
  '{"tr": "Ağabey Sokak · Ada Kümesi 76", "en": "Ağabey Sokak · Block Cluster 76"}'::jsonb,
  'Ağabey Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.036752 40.978, 29.038607 40.978, 29.038607 40.9794, 29.036752 40.9794, 29.036752 40.978))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9787)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '27e7c46d-a025-46bd-a7c2-92d0c80d1b2a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-775',
  '{"tr": "Söğütlüçeşme Caddesi · Ada Kümesi 83", "en": "Söğütlüçeşme Caddesi · Block Cluster 83"}'::jsonb,
  'Söğütlüçeşme Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.038607 40.978, 29.040461 40.978, 29.040461 40.9794, 29.038607 40.9794, 29.038607 40.978))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9787)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '899f2de9-8a4c-4429-a3d3-c9c013ec1212',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-441',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.018207 40.9794, 29.020061 40.9794, 29.020061 40.9808, 29.018207 40.9808, 29.018207 40.9794))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9801)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '591401c4-dff1-4c31-a6e5-4df539054df5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-478',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 26", "en": "Ferit Tek Sokak · Block Cluster 26"}'::jsonb,
  'Ferit Tek Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.020061 40.9794, 29.021916 40.9794, 29.021916 40.9808, 29.020061 40.9808, 29.020061 40.9794))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '705e465e-96eb-407c-a6b5-c6220749c6da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-515',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 33", "en": "Rıhtım Caddesi · Block Cluster 33"}'::jsonb,
  'Rıhtım Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.021916 40.9794, 29.02377 40.9794, 29.02377 40.9808, 29.021916 40.9808, 29.021916 40.9794))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9801)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '37b215c6-2396-44f9-a424-013f5b482abf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-552',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 40", "en": "Kafesçi Sokak · Block Cluster 40"}'::jsonb,
  'Kafesçi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.02377 40.9794, 29.025625 40.9794, 29.025625 40.9808, 29.02377 40.9808, 29.02377 40.9794))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '62445025-53ac-4fa3-a1e8-2f86b5f0cfc8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-589',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 47", "en": "Şair Nefi Sokak · Block Cluster 47"}'::jsonb,
  'Şair Nefi Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.025625 40.9794, 29.027479 40.9794, 29.027479 40.9808, 29.025625 40.9808, 29.025625 40.9794))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9801)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '50034a0d-4881-403e-a882-6a3398846a4b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-626',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 54", "en": "Ferit Tek Sokak · Block Cluster 54"}'::jsonb,
  'Ferit Tek Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.027479 40.9794, 29.029334 40.9794, 29.029334 40.9808, 29.027479 40.9808, 29.027479 40.9794))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cb9d6136-6a2c-4538-a1b1-840e35ca466e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-663',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 61", "en": "Rıhtım Caddesi · Block Cluster 61"}'::jsonb,
  'Rıhtım Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.029334 40.9794, 29.031188 40.9794, 29.031188 40.9808, 29.029334 40.9808, 29.029334 40.9794))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9801)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '20c29c3c-b546-4d5a-a584-0166d6093996',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-700',
  '{"tr": "Ağabey Sokak · Ada Kümesi 68", "en": "Ağabey Sokak · Block Cluster 68"}'::jsonb,
  'Ağabey Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.031188 40.9794, 29.033043 40.9794, 29.033043 40.9808, 29.031188 40.9808, 29.031188 40.9794))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9d47aceb-dab1-467e-a7f6-ba9577f8c369',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-737',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 75", "en": "Bademaltı Sokak · Block Cluster 75"}'::jsonb,
  'Bademaltı Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.033043 40.9794, 29.034897 40.9794, 29.034897 40.9808, 29.033043 40.9808, 29.033043 40.9794))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9801)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '428bcf5b-7ce7-4653-ae6c-0908bf7395ae',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-774',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 82", "en": "Ferit Tek Sokak · Block Cluster 82"}'::jsonb,
  'Ferit Tek Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.034897 40.9794, 29.036752 40.9794, 29.036752 40.9808, 29.034897 40.9808, 29.034897 40.9794))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3d55bc48-1661-441b-ab34-885353b6f063',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-811',
  '{"tr": "Moda Caddesi · Ada Kümesi 89", "en": "Moda Caddesi · Block Cluster 89"}'::jsonb,
  'Moda Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.036752 40.9794, 29.038607 40.9794, 29.038607 40.9808, 29.036752 40.9808, 29.036752 40.9794))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9801)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '34b3c45e-617e-4286-a5cd-56d8963256e4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-848',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 7", "en": "Kafesçi Sokak · Block Cluster 7"}'::jsonb,
  'Kafesçi Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.038607 40.9794, 29.040461 40.9794, 29.040461 40.9808, 29.038607 40.9808, 29.038607 40.9794))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9801)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '19817410-e704-4674-ae85-926400865a84',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-514',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.018207 40.9808, 29.020061 40.9808, 29.020061 40.9822, 29.018207 40.9822, 29.018207 40.9808))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9815)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ea00755e-1b9b-4004-a19b-055a059be562',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-551',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 39", "en": "Rıhtım Caddesi · Block Cluster 39"}'::jsonb,
  'Rıhtım Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.020061 40.9808, 29.021916 40.9808, 29.021916 40.9822, 29.020061 40.9822, 29.020061 40.9808))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9815)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '72cc5884-ae7b-4c8e-acb7-c40a2147f512',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-588',
  '{"tr": "Ağabey Sokak · Ada Kümesi 46", "en": "Ağabey Sokak · Block Cluster 46"}'::jsonb,
  'Ağabey Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.021916 40.9808, 29.02377 40.9808, 29.02377 40.9822, 29.021916 40.9822, 29.021916 40.9808))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9815)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c8dd3510-acf8-4f82-a425-1a9275d56492',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-625',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 53", "en": "Şair Nefi Sokak · Block Cluster 53"}'::jsonb,
  'Şair Nefi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.02377 40.9808, 29.025625 40.9808, 29.025625 40.9822, 29.02377 40.9822, 29.02377 40.9808))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9815)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c291d9a7-4f41-4529-add0-2c8e11d3ced0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-662',
  '{"tr": "Ağabey Sokak · Ada Kümesi 60", "en": "Ağabey Sokak · Block Cluster 60"}'::jsonb,
  'Ağabey Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.025625 40.9808, 29.027479 40.9808, 29.027479 40.9822, 29.025625 40.9822, 29.025625 40.9808))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9815)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cf3df75d-8ff5-432e-a0c8-74735f337a8b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-699',
  '{"tr": "Söğütlüçeşme Caddesi · Ada Kümesi 67", "en": "Söğütlüçeşme Caddesi · Block Cluster 67"}'::jsonb,
  'Söğütlüçeşme Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.027479 40.9808, 29.029334 40.9808, 29.029334 40.9822, 29.027479 40.9822, 29.027479 40.9808))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9815)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3dcdb89d-8264-4f40-afa9-77ddc03287dd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-736',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 74", "en": "Ferit Tek Sokak · Block Cluster 74"}'::jsonb,
  'Ferit Tek Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.029334 40.9808, 29.031188 40.9808, 29.031188 40.9822, 29.029334 40.9822, 29.029334 40.9808))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9815)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '160ab9fd-abc7-4141-adcd-58bcc1d29b3e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-773',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 81", "en": "Bademaltı Sokak · Block Cluster 81"}'::jsonb,
  'Bademaltı Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.031188 40.9808, 29.033043 40.9808, 29.033043 40.9822, 29.031188 40.9822, 29.031188 40.9808))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9815)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '690dae98-8912-4df3-a01f-336bf2204c8b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-810',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 88", "en": "Ferit Tek Sokak · Block Cluster 88"}'::jsonb,
  'Ferit Tek Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.033043 40.9808, 29.034897 40.9808, 29.034897 40.9822, 29.033043 40.9822, 29.033043 40.9808))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9815)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2203d5c3-fe1e-4dc2-ac1d-d8012021e385',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-847',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 6", "en": "Rıhtım Caddesi · Block Cluster 6"}'::jsonb,
  'Rıhtım Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.034897 40.9808, 29.036752 40.9808, 29.036752 40.9822, 29.034897 40.9822, 29.034897 40.9808))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9815)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3aa08259-13d7-4e22-a977-fc7b4e78007b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-884',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 13", "en": "Ferit Tek Sokak · Block Cluster 13"}'::jsonb,
  'Ferit Tek Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.036752 40.9808, 29.038607 40.9808, 29.038607 40.9822, 29.036752 40.9822, 29.036752 40.9808))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9815)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '559770d0-936d-4187-a6fa-5157e9049257',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-921',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 20", "en": "Şair Nefi Sokak · Block Cluster 20"}'::jsonb,
  'Şair Nefi Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.038607 40.9808, 29.040461 40.9808, 29.040461 40.9822, 29.038607 40.9822, 29.038607 40.9808))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9815)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8097bfc4-6805-421d-a892-ddd9e89d21e1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-587',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.018207 40.9822, 29.020061 40.9822, 29.020061 40.9836, 29.018207 40.9836, 29.018207 40.9822))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9829)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '04aa1248-2fe8-4071-ab42-2239349242b9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-624',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 52", "en": "Ferit Tek Sokak · Block Cluster 52"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.020061 40.9822, 29.021916 40.9822, 29.021916 40.9836, 29.020061 40.9836, 29.020061 40.9822))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'db14d9f4-265b-4346-ad4f-cab2016fed3a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-661',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 59", "en": "Bademaltı Sokak · Block Cluster 59"}'::jsonb,
  'Bademaltı Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.021916 40.9822, 29.02377 40.9822, 29.02377 40.9836, 29.021916 40.9836, 29.021916 40.9822))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9829)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '048e76e2-308d-485c-a403-8ebe351c6f3e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-698',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 66", "en": "Ferit Tek Sokak · Block Cluster 66"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.02377 40.9822, 29.025625 40.9822, 29.025625 40.9836, 29.02377 40.9836, 29.02377 40.9822))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '528e21b8-6ec7-4ccd-ac49-fd75c155fe85',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-735',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 73", "en": "Rıhtım Caddesi · Block Cluster 73"}'::jsonb,
  'Rıhtım Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.025625 40.9822, 29.027479 40.9822, 29.027479 40.9836, 29.025625 40.9836, 29.025625 40.9822))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9829)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd75ddee7-115f-485a-a602-26bde8bdd741',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-772',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 80", "en": "Ferit Tek Sokak · Block Cluster 80"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.027479 40.9822, 29.029334 40.9822, 29.029334 40.9836, 29.027479 40.9836, 29.027479 40.9822))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2b007fbb-abfe-4a63-a0fe-05d8d6fefa1e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-809',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 87", "en": "Bahariye Caddesi · Block Cluster 87"}'::jsonb,
  'Bahariye Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.029334 40.9822, 29.031188 40.9822, 29.031188 40.9836, 29.029334 40.9836, 29.029334 40.9822))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9829)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8c54ee35-d827-4e73-a473-0046647cdca8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-846',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 5", "en": "Ferit Tek Sokak · Block Cluster 5"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.031188 40.9822, 29.033043 40.9822, 29.033043 40.9836, 29.031188 40.9836, 29.031188 40.9822))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4a40183c-cc9f-4ea8-a6df-e69416e016e4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-883',
  '{"tr": "Rıhtım Caddesi · Ada Kümesi 12", "en": "Rıhtım Caddesi · Block Cluster 12"}'::jsonb,
  'Rıhtım Caddesi',
  24227,
  ST_GeomFromText('POLYGON((29.033043 40.9822, 29.034897 40.9822, 29.034897 40.9836, 29.033043 40.9836, 29.033043 40.9822))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9829)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '530a4841-ba2b-4ac2-a921-12830d35a303',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-920',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 19", "en": "Ferit Tek Sokak · Block Cluster 19"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.034897 40.9822, 29.036752 40.9822, 29.036752 40.9836, 29.034897 40.9836, 29.034897 40.9822))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cfe8b325-6f43-4663-a0ab-15463f2c5988',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-957',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 26", "en": "Bademaltı Sokak · Block Cluster 26"}'::jsonb,
  'Bademaltı Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.036752 40.9822, 29.038607 40.9822, 29.038607 40.9836, 29.036752 40.9836, 29.036752 40.9822))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9829)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0ad4995f-5095-49a3-aa41-e0fc5b6a1302',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-994',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 33", "en": "Ferit Tek Sokak · Block Cluster 33"}'::jsonb,
  'Ferit Tek Sokak',
  24227,
  ST_GeomFromText('POLYGON((29.038607 40.9822, 29.040461 40.9822, 29.040461 40.9836, 29.038607 40.9836, 29.038607 40.9822))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9829)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bd647cfb-ed20-420a-a044-4ef1aa84af05',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-660',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.018207 40.9836, 29.020061 40.9836, 29.020061 40.985, 29.018207 40.985, 29.018207 40.9836))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9843)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '88b02505-dd35-4263-a585-776665e57768',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-697',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 65", "en": "Bademaltı Sokak · Block Cluster 65"}'::jsonb,
  'Bademaltı Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.020061 40.9836, 29.021916 40.9836, 29.021916 40.985, 29.020061 40.985, 29.020061 40.9836))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9843)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9edcaa40-4603-45fc-a8df-1fbce4e0603c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-734',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 72", "en": "Ferit Tek Sokak · Block Cluster 72"}'::jsonb,
  'Ferit Tek Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.021916 40.9836, 29.02377 40.9836, 29.02377 40.985, 29.021916 40.985, 29.021916 40.9836))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9843)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '79fb8168-ac05-4260-a5fe-5308260153c8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-771',
  '{"tr": "Moda Caddesi · Ada Kümesi 79", "en": "Moda Caddesi · Block Cluster 79"}'::jsonb,
  'Moda Caddesi',
  24239,
  ST_GeomFromText('POLYGON((29.02377 40.9836, 29.025625 40.9836, 29.025625 40.985, 29.02377 40.985, 29.02377 40.9836))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9843)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '649db8e1-1a80-46ae-ae1d-2e4f7f1e4f8f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-808',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 86", "en": "Kafesçi Sokak · Block Cluster 86"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.025625 40.9836, 29.027479 40.9836, 29.027479 40.985, 29.025625 40.985, 29.025625 40.9836))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9843)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4832328a-7fc5-4164-a7f7-a3eec7f7c3ee',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-845',
  '{"tr": "Şair Nefi Sokak · Ada Kümesi 4", "en": "Şair Nefi Sokak · Block Cluster 4"}'::jsonb,
  'Şair Nefi Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.027479 40.9836, 29.029334 40.9836, 29.029334 40.985, 29.027479 40.985, 29.027479 40.9836))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9843)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '14e4b5f2-3e03-4efe-aae7-fb0c52e804f0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-882',
  '{"tr": "Ağabey Sokak · Ada Kümesi 11", "en": "Ağabey Sokak · Block Cluster 11"}'::jsonb,
  'Ağabey Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.029334 40.9836, 29.031188 40.9836, 29.031188 40.985, 29.029334 40.985, 29.029334 40.9836))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9843)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dd394db1-a370-4995-ae49-042480a99746',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-919',
  '{"tr": "Moda Caddesi · Ada Kümesi 18", "en": "Moda Caddesi · Block Cluster 18"}'::jsonb,
  'Moda Caddesi',
  24239,
  ST_GeomFromText('POLYGON((29.031188 40.9836, 29.033043 40.9836, 29.033043 40.985, 29.031188 40.985, 29.031188 40.9836))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9843)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b3753874-3318-4b38-a06d-134ce68d63ac',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-956',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 25", "en": "Kafesçi Sokak · Block Cluster 25"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.033043 40.9836, 29.034897 40.9836, 29.034897 40.985, 29.033043 40.985, 29.033043 40.9836))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9843)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '65eaaff4-60bb-4c9a-a551-f36ec6a60c8e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-993',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 32", "en": "Bademaltı Sokak · Block Cluster 32"}'::jsonb,
  'Bademaltı Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.034897 40.9836, 29.036752 40.9836, 29.036752 40.985, 29.034897 40.985, 29.034897 40.9836))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9843)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6a291e92-bda5-44f2-a78c-ca6027cef384',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-031',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 39", "en": "Ferit Tek Sokak · Block Cluster 39"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.036752 40.9836, 29.038607 40.9836, 29.038607 40.985, 29.036752 40.985, 29.036752 40.9836))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9843)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c8f56bf-19fe-499d-a571-2f22868dd05c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-068',
  '{"tr": "Moda Caddesi · Ada Kümesi 46", "en": "Moda Caddesi · Block Cluster 46"}'::jsonb,
  'Moda Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.038607 40.9836, 29.040461 40.9836, 29.040461 40.985, 29.038607 40.985, 29.038607 40.9836))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9843)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '939d2e65-2e9e-4e0f-ad03-306ac23b4c74',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-733',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.018207 40.985, 29.020061 40.985, 29.020061 40.9864, 29.018207 40.9864, 29.018207 40.985))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9857)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '54181514-0fd5-4a58-abcd-af4c63edcf6c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-770',
  '{"tr": "Ağabey Sokak · Ada Kümesi 78", "en": "Ağabey Sokak · Block Cluster 78"}'::jsonb,
  'Ağabey Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.020061 40.985, 29.021916 40.985, 29.021916 40.9864, 29.020061 40.9864, 29.020061 40.985))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e5af7a51-f56e-4fa7-a0c1-95f6db1e69f8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-807',
  '{"tr": "Moda Caddesi · Ada Kümesi 85", "en": "Moda Caddesi · Block Cluster 85"}'::jsonb,
  'Moda Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.021916 40.985, 29.02377 40.985, 29.02377 40.9864, 29.021916 40.9864, 29.021916 40.985))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9857)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b1d44932-eca0-47ea-ad74-0ed89e74911c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-844',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 3", "en": "Ferit Tek Sokak · Block Cluster 3"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.02377 40.985, 29.025625 40.985, 29.025625 40.9864, 29.02377 40.9864, 29.02377 40.985))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '870c6ade-2380-4e9e-a48c-7440aa8c897c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-881',
  '{"tr": "Bademaltı Sokak · Ada Kümesi 10", "en": "Bademaltı Sokak · Block Cluster 10"}'::jsonb,
  'Bademaltı Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.025625 40.985, 29.027479 40.985, 29.027479 40.9864, 29.025625 40.9864, 29.025625 40.985))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9857)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cf6c6644-ec06-4609-a36a-d04dbb731c4d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-918',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 17", "en": "Kafesçi Sokak · Block Cluster 17"}'::jsonb,
  'Kafesçi Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.027479 40.985, 29.029334 40.985, 29.029334 40.9864, 29.027479 40.9864, 29.027479 40.985))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0e96a00-4bb1-45ad-ab58-efad1c9aefad',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-955',
  '{"tr": "Söğütlüçeşme Caddesi · Ada Kümesi 24", "en": "Söğütlüçeşme Caddesi · Block Cluster 24"}'::jsonb,
  'Söğütlüçeşme Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.029334 40.985, 29.031188 40.985, 29.031188 40.9864, 29.029334 40.9864, 29.029334 40.985))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9857)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b9a1e9c8-8188-435e-a829-4a963b2a8d26',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-992',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 31", "en": "Ferit Tek Sokak · Block Cluster 31"}'::jsonb,
  'Ferit Tek Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.031188 40.985, 29.033043 40.985, 29.033043 40.9864, 29.031188 40.9864, 29.031188 40.985))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '14635b42-dd6a-4ea8-a909-45eaf1cd79ea',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-030',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 38", "en": "Bahariye Caddesi · Block Cluster 38"}'::jsonb,
  'Bahariye Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.033043 40.985, 29.034897 40.985, 29.034897 40.9864, 29.033043 40.9864, 29.033043 40.985))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9857)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '41497421-da27-45e2-ab6e-81c31b716a03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-067',
  '{"tr": "Ağabey Sokak · Ada Kümesi 45", "en": "Ağabey Sokak · Block Cluster 45"}'::jsonb,
  'Ağabey Sokak',
  24239,
  ST_GeomFromText('POLYGON((29.034897 40.985, 29.036752 40.985, 29.036752 40.9864, 29.034897 40.9864, 29.034897 40.985))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9cf4ac29-9d1f-400e-a1eb-fc273a13fc37',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-104',
  '{"tr": "Moda Caddesi · Ada Kümesi 52", "en": "Moda Caddesi · Block Cluster 52"}'::jsonb,
  'Moda Caddesi',
  24239,
  ST_GeomFromText('POLYGON((29.036752 40.985, 29.038607 40.985, 29.038607 40.9864, 29.036752 40.9864, 29.036752 40.985))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9857)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6afe36a6-8680-4e0c-ac7e-48aaf17eb4b2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-141',
  '{"tr": "Ferit Tek Sokak · Ada Kümesi 59", "en": "Ferit Tek Sokak · Block Cluster 59"}'::jsonb,
  'Ferit Tek Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.038607 40.985, 29.040461 40.985, 29.040461 40.9864, 29.038607 40.9864, 29.038607 40.985))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9857)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f3be1cf1-9731-4157-a48f-0da68aef2e48',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MRK-806',
  '{"tr": "Kadıköy Şehir Caddeleri", "en": "Kadikoy City Streets"}'::jsonb,
  'Kadıköy Kadıköy Bölgesi Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.018207 40.9864, 29.020061 40.9864, 29.020061 40.9878, 29.018207 40.9878, 29.018207 40.9864))', 4326),
  ST_GeomFromText('POINT(29.019134 40.9871)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd4f021a9-069a-4436-a26a-959fdb8ad5df',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-843',
  '{"tr": "Moda Caddesi · Ada Kümesi 2", "en": "Moda Caddesi · Block Cluster 2"}'::jsonb,
  'Moda Caddesi',
  24238,
  ST_GeomFromText('POLYGON((29.020061 40.9864, 29.021916 40.9864, 29.021916 40.9878, 29.020061 40.9878, 29.020061 40.9864))', 4326),
  ST_GeomFromText('POINT(29.020989 40.9871)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '15086af3-8fd4-457e-aadc-7f8da4dc8071',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-880',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 9", "en": "Kafesçi Sokak · Block Cluster 9"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.021916 40.9864, 29.02377 40.9864, 29.02377 40.9878, 29.021916 40.9878, 29.021916 40.9864))', 4326),
  ST_GeomFromText('POINT(29.022843 40.9871)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3197e484-1109-4881-a09e-8c0542a14d05',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-917',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 16", "en": "Bahariye Caddesi · Block Cluster 16"}'::jsonb,
  'Bahariye Caddesi',
  24238,
  ST_GeomFromText('POLYGON((29.02377 40.9864, 29.025625 40.9864, 29.025625 40.9878, 29.02377 40.9878, 29.02377 40.9864))', 4326),
  ST_GeomFromText('POINT(29.024698 40.9871)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '82860c21-b661-4617-a4e7-9a3638e7a238',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-954',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 23", "en": "Kafesçi Sokak · Block Cluster 23"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.025625 40.9864, 29.027479 40.9864, 29.027479 40.9878, 29.025625 40.9878, 29.025625 40.9864))', 4326),
  ST_GeomFromText('POINT(29.026552 40.9871)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bb15fe63-7c8e-4cca-a79b-d2a937a42b2d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-991',
  '{"tr": "Moda Caddesi · Ada Kümesi 30", "en": "Moda Caddesi · Block Cluster 30"}'::jsonb,
  'Moda Caddesi',
  24238,
  ST_GeomFromText('POLYGON((29.027479 40.9864, 29.029334 40.9864, 29.029334 40.9878, 29.027479 40.9878, 29.027479 40.9864))', 4326),
  ST_GeomFromText('POINT(29.028407 40.9871)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'af5ac5d1-9fab-4b20-a0f1-6ef14f0670f1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-029',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 37", "en": "Kafesçi Sokak · Block Cluster 37"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.029334 40.9864, 29.031188 40.9864, 29.031188 40.9878, 29.029334 40.9878, 29.029334 40.9864))', 4326),
  ST_GeomFromText('POINT(29.030261 40.9871)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '249ad2a2-3016-44f4-a48c-d65654b0d796',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-066',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 44", "en": "Bahariye Caddesi · Block Cluster 44"}'::jsonb,
  'Bahariye Caddesi',
  24238,
  ST_GeomFromText('POLYGON((29.031188 40.9864, 29.033043 40.9864, 29.033043 40.9878, 29.031188 40.9878, 29.031188 40.9864))', 4326),
  ST_GeomFromText('POINT(29.032116 40.9871)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c79d079c-486c-4d74-aff1-0ae810091510',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-103',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 51", "en": "Kafesçi Sokak · Block Cluster 51"}'::jsonb,
  'Kafesçi Sokak',
  24225,
  ST_GeomFromText('POLYGON((29.033043 40.9864, 29.034897 40.9864, 29.034897 40.9878, 29.033043 40.9878, 29.033043 40.9864))', 4326),
  ST_GeomFromText('POINT(29.03397 40.9871)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e87e1428-87a5-452a-afdb-610270238952',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-140',
  '{"tr": "Moda Caddesi · Ada Kümesi 58", "en": "Moda Caddesi · Block Cluster 58"}'::jsonb,
  'Moda Caddesi',
  24238,
  ST_GeomFromText('POLYGON((29.034897 40.9864, 29.036752 40.9864, 29.036752 40.9878, 29.034897 40.9878, 29.034897 40.9864))', 4326),
  ST_GeomFromText('POINT(29.035825 40.9871)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '74f02b43-5e71-43b1-aa81-78f2d3617ef4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-177',
  '{"tr": "Kafesçi Sokak · Ada Kümesi 65", "en": "Kafesçi Sokak · Block Cluster 65"}'::jsonb,
  'Kafesçi Sokak',
  24238,
  ST_GeomFromText('POLYGON((29.036752 40.9864, 29.038607 40.9864, 29.038607 40.9878, 29.036752 40.9878, 29.036752 40.9864))', 4326),
  ST_GeomFromText('POINT(29.03768 40.9871)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4a09435d-feae-4cae-a4a7-0ff348b7900b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-KAD-MOD-214',
  '{"tr": "Bahariye Caddesi · Ada Kümesi 72", "en": "Bahariye Caddesi · Block Cluster 72"}'::jsonb,
  'Bahariye Caddesi',
  24225,
  ST_GeomFromText('POLYGON((29.038607 40.9864, 29.040461 40.9864, 29.040461 40.9878, 29.038607 40.9878, 29.038607 40.9864))', 4326),
  ST_GeomFromText('POINT(29.039534 40.9871)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ec51b88b-7c66-4ac4-a037-524f68b8a34f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-548',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24246,
  ST_GeomFromText('POLYGON((29.000317 41.0368, 29.002174 41.0368, 29.002174 41.0382, 29.000317 41.0382, 29.000317 41.0368))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0db42236-3d5c-4507-a0e8-37314b10373d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-585',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.002174 41.0368, 29.00403 41.0368, 29.00403 41.0382, 29.002174 41.0382, 29.002174 41.0368))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b151994-84be-4c21-afab-05b5dfd335b5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-622',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.00403 41.0368, 29.005886 41.0368, 29.005886 41.0382, 29.00403 41.0382, 29.00403 41.0368))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '050c2444-db68-4414-ae64-5050e0749858',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-659',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.005886 41.0368, 29.007742 41.0368, 29.007742 41.0382, 29.005886 41.0382, 29.005886 41.0368))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0fea246d-c5fd-4e87-aa17-aaead5e7b2f4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-696',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24246,
  ST_GeomFromText('POLYGON((29.007742 41.0368, 29.009599 41.0368, 29.009599 41.0382, 29.007742 41.0382, 29.007742 41.0368))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0c981b66-5101-4d1d-ad99-467b5d997883',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-733',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.009599 41.0368, 29.011455 41.0368, 29.011455 41.0382, 29.009599 41.0382, 29.009599 41.0368))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9eb3cef7-e4fe-4b3d-aa4d-35ca83b2ca34',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-770',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.011455 41.0368, 29.013311 41.0368, 29.013311 41.0382, 29.011455 41.0382, 29.011455 41.0368))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1db9d14f-58d8-48ff-a561-89b076922a4e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-807',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((29.013311 41.0368, 29.015167 41.0368, 29.015167 41.0382, 29.013311 41.0382, 29.013311 41.0368))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '997a3278-99b5-4a37-a0cf-284f332f4caf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-621',
  '{"tr": "Barbaros Bulvarı · Ada Kümesi 41", "en": "Barbaros Bulvarı · Block Cluster 41"}'::jsonb,
  'Barbaros Bulvarı',
  24246,
  ST_GeomFromText('POLYGON((29.000317 41.0382, 29.002174 41.0382, 29.002174 41.0396, 29.000317 41.0396, 29.000317 41.0382))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0389)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f74fa7b9-c16b-4c16-a624-cbafb8bb13cf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-658',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 48", "en": "Alaybeyi Sokak · Block Cluster 48"}'::jsonb,
  'Alaybeyi Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.002174 41.0382, 29.00403 41.0382, 29.00403 41.0396, 29.002174 41.0396, 29.002174 41.0382))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9700cc8b-6dc4-438d-aac4-7f0604c58018',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-695',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 55", "en": "Ihlamurdere Caddesi · Block Cluster 55"}'::jsonb,
  'Ihlamurdere Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.00403 41.0382, 29.005886 41.0382, 29.005886 41.0396, 29.00403 41.0396, 29.00403 41.0382))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0389)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9bc48036-a99e-4f1f-a25a-2f2945632f55',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-732',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 62", "en": "Şehit Asım Caddesi · Block Cluster 62"}'::jsonb,
  'Şehit Asım Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.005886 41.0382, 29.007742 41.0382, 29.007742 41.0396, 29.005886 41.0396, 29.005886 41.0382))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6600ab21-008c-45fe-a68c-aedf668cb11f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-769',
  '{"tr": "Dolmabahçe Caddesi · Ada Kümesi 69", "en": "Dolmabahçe Caddesi · Block Cluster 69"}'::jsonb,
  'Dolmabahçe Caddesi',
  24246,
  ST_GeomFromText('POLYGON((29.007742 41.0382, 29.009599 41.0382, 29.009599 41.0396, 29.007742 41.0396, 29.007742 41.0382))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0389)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f88ec26c-d835-4a72-a0bb-f81ed0c3fcde',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-806',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 76", "en": "Şehit Asım Caddesi · Block Cluster 76"}'::jsonb,
  'Şehit Asım Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.009599 41.0382, 29.011455 41.0382, 29.011455 41.0396, 29.009599 41.0396, 29.009599 41.0382))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b4a813e0-80dc-4d98-a474-4e7835847178',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-843',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 83", "en": "Ihlamurdere Caddesi · Block Cluster 83"}'::jsonb,
  'Ihlamurdere Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.011455 41.0382, 29.013311 41.0382, 29.013311 41.0396, 29.011455 41.0396, 29.011455 41.0382))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0389)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8b1d7582-7390-4775-a88d-42f7feadacf7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-880',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 1", "en": "Alaybeyi Sokak · Block Cluster 1"}'::jsonb,
  'Alaybeyi Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.013311 41.0382, 29.015167 41.0382, 29.015167 41.0396, 29.013311 41.0396, 29.013311 41.0382))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '53bf569e-e2fb-4060-a144-46fe36ba66fe',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-694',
  '{"tr": "Hasfırın Caddesi · Ada Kümesi 54", "en": "Hasfırın Caddesi · Block Cluster 54"}'::jsonb,
  'Hasfırın Caddesi',
  24244,
  ST_GeomFromText('POLYGON((29.000317 41.0396, 29.002174 41.0396, 29.002174 41.041, 29.000317 41.041, 29.000317 41.0396))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0403)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bba6edf9-4397-4f23-a831-a2daff3e3d1c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-731',
  '{"tr": "Köyiçi Caddesi · Ada Kümesi 61", "en": "Köyiçi Caddesi · Block Cluster 61"}'::jsonb,
  'Köyiçi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.002174 41.0396, 29.00403 41.0396, 29.00403 41.041, 29.002174 41.041, 29.002174 41.0396))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0403)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3dbf6fbc-e8b1-4bc1-a50e-847d26715b7d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-768',
  '{"tr": "Mumcu Bakkal Sokak · Ada Kümesi 68", "en": "Mumcu Bakkal Sokak · Block Cluster 68"}'::jsonb,
  'Mumcu Bakkal Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.00403 41.0396, 29.005886 41.0396, 29.005886 41.041, 29.00403 41.041, 29.00403 41.0396))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0403)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e95be909-d3db-4b34-aa80-523dbd37a43d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-805',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 75", "en": "Çırağan Caddesi · Block Cluster 75"}'::jsonb,
  'Çırağan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.005886 41.0396, 29.007742 41.0396, 29.007742 41.041, 29.005886 41.041, 29.005886 41.0396))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0403)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bb4dbef9-5b53-427c-a01e-ec8516a11175',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-842',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 82", "en": "Alaybeyi Sokak · Block Cluster 82"}'::jsonb,
  'Alaybeyi Sokak',
  24244,
  ST_GeomFromText('POLYGON((29.007742 41.0396, 29.009599 41.0396, 29.009599 41.041, 29.007742 41.041, 29.007742 41.0396))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0403)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '074d010d-9806-4c5b-af4b-fd569f53fd68',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-879',
  '{"tr": "Köyiçi Caddesi · Ada Kümesi 89", "en": "Köyiçi Caddesi · Block Cluster 89"}'::jsonb,
  'Köyiçi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.009599 41.0396, 29.011455 41.0396, 29.011455 41.041, 29.009599 41.041, 29.009599 41.0396))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0403)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5dbb6c97-24b6-4b62-a90d-67f5827177f9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-916',
  '{"tr": "Mumcu Bakkal Sokak · Ada Kümesi 7", "en": "Mumcu Bakkal Sokak · Block Cluster 7"}'::jsonb,
  'Mumcu Bakkal Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.011455 41.0396, 29.013311 41.0396, 29.013311 41.041, 29.011455 41.041, 29.011455 41.0396))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0403)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '79ccb7a6-78a1-41bd-a16d-a61bf26dc963',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-953',
  '{"tr": "Dolmabahçe Caddesi · Ada Kümesi 14", "en": "Dolmabahçe Caddesi · Block Cluster 14"}'::jsonb,
  'Dolmabahçe Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.013311 41.0396, 29.015167 41.0396, 29.015167 41.041, 29.013311 41.041, 29.013311 41.0396))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0403)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '44ed253a-3630-4b6b-a2dd-2e517b1d30a5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-767',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 67", "en": "Ihlamurdere Caddesi · Block Cluster 67"}'::jsonb,
  'Ihlamurdere Caddesi',
  24244,
  ST_GeomFromText('POLYGON((29.000317 41.041, 29.002174 41.041, 29.002174 41.0424, 29.000317 41.0424, 29.000317 41.041))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0417)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '32d7caae-884c-492b-aa9b-a385bb2433d9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-804',
  '{"tr": "Mumcu Bakkal Sokak · Ada Kümesi 74", "en": "Mumcu Bakkal Sokak · Block Cluster 74"}'::jsonb,
  'Mumcu Bakkal Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.002174 41.041, 29.00403 41.041, 29.00403 41.0424, 29.002174 41.0424, 29.002174 41.041))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0417)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '290679ed-8f2b-448b-a62d-fd66b831fe78',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-841',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 81", "en": "Çırağan Caddesi · Block Cluster 81"}'::jsonb,
  'Çırağan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.00403 41.041, 29.005886 41.041, 29.005886 41.0424, 29.00403 41.0424, 29.00403 41.041))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0417)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f5c1f943-6b1f-4576-aede-fc3560e0feb9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-878',
  '{"tr": "Hasfırın Caddesi · Ada Kümesi 88", "en": "Hasfırın Caddesi · Block Cluster 88"}'::jsonb,
  'Hasfırın Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.005886 41.041, 29.007742 41.041, 29.007742 41.0424, 29.005886 41.0424, 29.005886 41.041))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0417)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0f96063c-fb9e-4e83-a408-68bf0b3474bf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-915',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 6", "en": "Ihlamurdere Caddesi · Block Cluster 6"}'::jsonb,
  'Ihlamurdere Caddesi',
  24244,
  ST_GeomFromText('POLYGON((29.007742 41.041, 29.009599 41.041, 29.009599 41.0424, 29.007742 41.0424, 29.007742 41.041))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0417)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '952dd10b-6a21-4f76-af0c-de7dff4ee081',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-952',
  '{"tr": "Mumcu Bakkal Sokak · Ada Kümesi 13", "en": "Mumcu Bakkal Sokak · Block Cluster 13"}'::jsonb,
  'Mumcu Bakkal Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.009599 41.041, 29.011455 41.041, 29.011455 41.0424, 29.009599 41.0424, 29.009599 41.041))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0417)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ecc5199b-0e4a-4ee7-a28f-577cfb0f6882',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-989',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 20", "en": "Çırağan Caddesi · Block Cluster 20"}'::jsonb,
  'Çırağan Caddesi',
  24232,
  ST_GeomFromText('POLYGON((29.011455 41.041, 29.013311 41.041, 29.013311 41.0424, 29.011455 41.0424, 29.011455 41.041))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0417)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6752c43f-7a51-4ff0-ad03-0bcfe1a4942f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-027',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 27", "en": "Alaybeyi Sokak · Block Cluster 27"}'::jsonb,
  'Alaybeyi Sokak',
  24232,
  ST_GeomFromText('POLYGON((29.013311 41.041, 29.015167 41.041, 29.015167 41.0424, 29.013311 41.0424, 29.013311 41.041))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0417)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fde83664-b4fc-4101-a914-e765b2e50765',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-840',
  '{"tr": "Hasfırın Caddesi · Ada Kümesi 80", "en": "Hasfırın Caddesi · Block Cluster 80"}'::jsonb,
  'Hasfırın Caddesi',
  24244,
  ST_GeomFromText('POLYGON((29.000317 41.0424, 29.002174 41.0424, 29.002174 41.0438, 29.000317 41.0438, 29.000317 41.0424))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0431)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5c569253-6897-4f23-a4c1-2d70c4ee5176',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-877',
  '{"tr": "Dolmabahçe Caddesi · Ada Kümesi 87", "en": "Dolmabahçe Caddesi · Block Cluster 87"}'::jsonb,
  'Dolmabahçe Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.002174 41.0424, 29.00403 41.0424, 29.00403 41.0438, 29.002174 41.0438, 29.002174 41.0424))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0431)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c70e70f4-ecf0-424e-abfe-62bab3fe8342',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-914',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 5", "en": "Kartal Meydanı Sokak · Block Cluster 5"}'::jsonb,
  'Kartal Meydanı Sokak',
  24230,
  ST_GeomFromText('POLYGON((29.00403 41.0424, 29.005886 41.0424, 29.005886 41.0438, 29.00403 41.0438, 29.00403 41.0424))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0431)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '14513897-9982-4b88-add3-b31fadd3c41f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-951',
  '{"tr": "Şair Nedim Caddesi · Ada Kümesi 12", "en": "Şair Nedim Caddesi · Block Cluster 12"}'::jsonb,
  'Şair Nedim Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.005886 41.0424, 29.007742 41.0424, 29.007742 41.0438, 29.005886 41.0438, 29.005886 41.0424))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0431)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aeec936e-8ed1-4eea-a03d-fd843dbe0258',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-988',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 19", "en": "Kartal Meydanı Sokak · Block Cluster 19"}'::jsonb,
  'Kartal Meydanı Sokak',
  24244,
  ST_GeomFromText('POLYGON((29.007742 41.0424, 29.009599 41.0424, 29.009599 41.0438, 29.007742 41.0438, 29.007742 41.0424))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0431)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9cdca021-2097-4e97-ac4b-3eb6bd743eb8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-026',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 26", "en": "Çırağan Caddesi · Block Cluster 26"}'::jsonb,
  'Çırağan Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.009599 41.0424, 29.011455 41.0424, 29.011455 41.0438, 29.009599 41.0438, 29.009599 41.0424))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0431)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9eacfedb-86bb-4029-a817-eef225680f04',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-063',
  '{"tr": "Hasfırın Caddesi · Ada Kümesi 33", "en": "Hasfırın Caddesi · Block Cluster 33"}'::jsonb,
  'Hasfırın Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.011455 41.0424, 29.013311 41.0424, 29.013311 41.0438, 29.011455 41.0438, 29.011455 41.0424))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0431)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0313df9f-80d9-439f-a3ca-dc0083ece33e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-100',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 40", "en": "Ihlamurdere Caddesi · Block Cluster 40"}'::jsonb,
  'Ihlamurdere Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.013311 41.0424, 29.015167 41.0424, 29.015167 41.0438, 29.013311 41.0438, 29.013311 41.0424))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0431)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ff72945b-d876-47b2-a704-e3e9d7e90c0d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-913',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 4", "en": "Çırağan Caddesi · Block Cluster 4"}'::jsonb,
  'Çırağan Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.000317 41.0438, 29.002174 41.0438, 29.002174 41.0452, 29.000317 41.0452, 29.000317 41.0438))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0445)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a9a192aa-d302-4530-aaa3-379a7ca437da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-950',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 11", "en": "Şehit Asım Caddesi · Block Cluster 11"}'::jsonb,
  'Şehit Asım Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.002174 41.0438, 29.00403 41.0438, 29.00403 41.0452, 29.002174 41.0452, 29.002174 41.0438))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0445)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '30c45934-fdf6-4ce8-ad32-c5dc2ebaf61c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-987',
  '{"tr": "Köyiçi Caddesi · Ada Kümesi 18", "en": "Köyiçi Caddesi · Block Cluster 18"}'::jsonb,
  'Köyiçi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.00403 41.0438, 29.005886 41.0438, 29.005886 41.0452, 29.00403 41.0452, 29.00403 41.0438))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0445)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9568d016-ece2-4b79-a98a-eb6f824b0b8f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-025',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 25", "en": "Şehit Asım Caddesi · Block Cluster 25"}'::jsonb,
  'Şehit Asım Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.005886 41.0438, 29.007742 41.0438, 29.007742 41.0452, 29.005886 41.0452, 29.005886 41.0438))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0445)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7f3c2241-6f4a-48f0-a076-0ab1ee864b31',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-062',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 32", "en": "Çırağan Caddesi · Block Cluster 32"}'::jsonb,
  'Çırağan Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.007742 41.0438, 29.009599 41.0438, 29.009599 41.0452, 29.007742 41.0452, 29.007742 41.0438))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0445)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a0810e5d-276d-42d5-a7ec-5c88c7ee6132',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-099',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 39", "en": "Şehit Asım Caddesi · Block Cluster 39"}'::jsonb,
  'Şehit Asım Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.009599 41.0438, 29.011455 41.0438, 29.011455 41.0452, 29.009599 41.0452, 29.009599 41.0438))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0445)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '11883fdf-97c3-43d3-a64b-2c0ca94b53b2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-136',
  '{"tr": "Şair Nedim Caddesi · Ada Kümesi 46", "en": "Şair Nedim Caddesi · Block Cluster 46"}'::jsonb,
  'Şair Nedim Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.011455 41.0438, 29.013311 41.0438, 29.013311 41.0452, 29.011455 41.0452, 29.011455 41.0438))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0445)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ed7a7fe7-9502-4ad5-a878-1532827ceabc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-173',
  '{"tr": "Mumcu Bakkal Sokak · Ada Kümesi 53", "en": "Mumcu Bakkal Sokak · Block Cluster 53"}'::jsonb,
  'Mumcu Bakkal Sokak',
  24230,
  ST_GeomFromText('POLYGON((29.013311 41.0438, 29.015167 41.0438, 29.015167 41.0452, 29.013311 41.0452, 29.013311 41.0438))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0445)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5f05be7e-11c7-4990-aec2-a7ee70ccd80e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-986',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 17", "en": "Alaybeyi Sokak · Block Cluster 17"}'::jsonb,
  'Alaybeyi Sokak',
  24242,
  ST_GeomFromText('POLYGON((29.000317 41.0452, 29.002174 41.0452, 29.002174 41.0466, 29.000317 41.0466, 29.000317 41.0452))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0459)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd2b6ee16-bc0e-493d-aeb8-d72b8ec52753',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-024',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 24", "en": "Ihlamurdere Caddesi · Block Cluster 24"}'::jsonb,
  'Ihlamurdere Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.002174 41.0452, 29.00403 41.0452, 29.00403 41.0466, 29.002174 41.0466, 29.002174 41.0452))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0459)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1658ba57-2776-4d2a-a12e-e77d3dcf1781',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-061',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 31", "en": "Kartal Meydanı Sokak · Block Cluster 31"}'::jsonb,
  'Kartal Meydanı Sokak',
  24230,
  ST_GeomFromText('POLYGON((29.00403 41.0452, 29.005886 41.0452, 29.005886 41.0466, 29.00403 41.0466, 29.00403 41.0452))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0459)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4ae95b3e-12ff-43ad-a816-98935de91eeb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-098',
  '{"tr": "Barbaros Bulvarı · Ada Kümesi 38", "en": "Barbaros Bulvarı · Block Cluster 38"}'::jsonb,
  'Barbaros Bulvarı',
  24230,
  ST_GeomFromText('POLYGON((29.005886 41.0452, 29.007742 41.0452, 29.007742 41.0466, 29.005886 41.0466, 29.005886 41.0452))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0459)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a57084d0-f568-4db3-a018-a9639ad8b283',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-135',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 45", "en": "Alaybeyi Sokak · Block Cluster 45"}'::jsonb,
  'Alaybeyi Sokak',
  24242,
  ST_GeomFromText('POLYGON((29.007742 41.0452, 29.009599 41.0452, 29.009599 41.0466, 29.007742 41.0466, 29.007742 41.0452))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0459)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7801d6e8-2c3e-42a2-a43f-144aa440998a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-172',
  '{"tr": "Köyiçi Caddesi · Ada Kümesi 52", "en": "Köyiçi Caddesi · Block Cluster 52"}'::jsonb,
  'Köyiçi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.009599 41.0452, 29.011455 41.0452, 29.011455 41.0466, 29.009599 41.0466, 29.009599 41.0452))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0459)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '80820468-b256-435f-a2d4-173732d817c7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-209',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 59", "en": "Kartal Meydanı Sokak · Block Cluster 59"}'::jsonb,
  'Kartal Meydanı Sokak',
  24230,
  ST_GeomFromText('POLYGON((29.011455 41.0452, 29.013311 41.0452, 29.013311 41.0466, 29.011455 41.0466, 29.011455 41.0452))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0459)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '00f75b20-f1c4-4244-a133-7964f2bb7d64',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-246',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 66", "en": "Çırağan Caddesi · Block Cluster 66"}'::jsonb,
  'Çırağan Caddesi',
  24230,
  ST_GeomFromText('POLYGON((29.013311 41.0452, 29.015167 41.0452, 29.015167 41.0466, 29.013311 41.0466, 29.013311 41.0452))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0459)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dab6b044-2e32-4820-a484-d86408e91864',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-060',
  '{"tr": "Şair Nedim Caddesi · Ada Kümesi 30", "en": "Şair Nedim Caddesi · Block Cluster 30"}'::jsonb,
  'Şair Nedim Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.000317 41.0466, 29.002174 41.0466, 29.002174 41.048, 29.000317 41.048, 29.000317 41.0466))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0473)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '633e726d-bd75-4a3e-ae4b-485320b3acab',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-097',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 37", "en": "Kartal Meydanı Sokak · Block Cluster 37"}'::jsonb,
  'Kartal Meydanı Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.002174 41.0466, 29.00403 41.0466, 29.00403 41.048, 29.002174 41.048, 29.002174 41.0466))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0473)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '20467e57-29ee-4202-a9a8-dc554a352059',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-134',
  '{"tr": "Dolmabahçe Caddesi · Ada Kümesi 44", "en": "Dolmabahçe Caddesi · Block Cluster 44"}'::jsonb,
  'Dolmabahçe Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.00403 41.0466, 29.005886 41.0466, 29.005886 41.048, 29.00403 41.048, 29.00403 41.0466))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0473)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '04cc2597-6096-434a-a45a-e6dd6562e8e1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-171',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 51", "en": "Şehit Asım Caddesi · Block Cluster 51"}'::jsonb,
  'Şehit Asım Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.005886 41.0466, 29.007742 41.0466, 29.007742 41.048, 29.005886 41.048, 29.005886 41.0466))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0473)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5de5befa-7175-49f2-ac90-a708cf5ad8ec',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-208',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 58", "en": "Ihlamurdere Caddesi · Block Cluster 58"}'::jsonb,
  'Ihlamurdere Caddesi',
  24242,
  ST_GeomFromText('POLYGON((29.007742 41.0466, 29.009599 41.0466, 29.009599 41.048, 29.007742 41.048, 29.007742 41.0466))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0473)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '96bc38d5-5081-44c1-a63d-ac14e73dcd96',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-245',
  '{"tr": "Kartal Meydanı Sokak · Ada Kümesi 65", "en": "Kartal Meydanı Sokak · Block Cluster 65"}'::jsonb,
  'Kartal Meydanı Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.009599 41.0466, 29.011455 41.0466, 29.011455 41.048, 29.009599 41.048, 29.009599 41.0466))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0473)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f2462471-8973-45ca-ab35-71bb7bb97a3b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-282',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 72", "en": "Çırağan Caddesi · Block Cluster 72"}'::jsonb,
  'Çırağan Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.011455 41.0466, 29.013311 41.0466, 29.013311 41.048, 29.011455 41.048, 29.011455 41.0466))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0473)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '74703a95-c1c8-455e-a5b8-afcb3638cff3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-319',
  '{"tr": "Şehit Asım Caddesi · Ada Kümesi 79", "en": "Şehit Asım Caddesi · Block Cluster 79"}'::jsonb,
  'Şehit Asım Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.013311 41.0466, 29.015167 41.0466, 29.015167 41.048, 29.013311 41.048, 29.013311 41.0466))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0473)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '42bd5682-0806-4152-aabb-27d04ac3c7d4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-133',
  '{"tr": "Hasfırın Caddesi · Ada Kümesi 43", "en": "Hasfırın Caddesi · Block Cluster 43"}'::jsonb,
  'Hasfırın Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.000317 41.048, 29.002174 41.048, 29.002174 41.0494, 29.000317 41.0494, 29.000317 41.048))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0487)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '82fc305d-cf58-42a5-ada4-82f85254e302',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-170',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 50", "en": "Çırağan Caddesi · Block Cluster 50"}'::jsonb,
  'Çırağan Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.002174 41.048, 29.00403 41.048, 29.00403 41.0494, 29.002174 41.0494, 29.002174 41.048))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0487)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e71e2089-f73e-4f91-a020-5f18de5ca01a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-207',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 57", "en": "Alaybeyi Sokak · Block Cluster 57"}'::jsonb,
  'Alaybeyi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.00403 41.048, 29.005886 41.048, 29.005886 41.0494, 29.00403 41.0494, 29.00403 41.048))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0487)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '948bebe7-1b26-441f-afad-1ff8afb2e006',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-244',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 64", "en": "Ihlamurdere Caddesi · Block Cluster 64"}'::jsonb,
  'Ihlamurdere Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.005886 41.048, 29.007742 41.048, 29.007742 41.0494, 29.005886 41.0494, 29.005886 41.048))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0487)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '84f6776c-d2f3-44ca-a605-53a657e99c36',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-281',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 71", "en": "Alaybeyi Sokak · Block Cluster 71"}'::jsonb,
  'Alaybeyi Sokak',
  24241,
  ST_GeomFromText('POLYGON((29.007742 41.048, 29.009599 41.048, 29.009599 41.0494, 29.007742 41.0494, 29.007742 41.048))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0487)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '04f07830-205d-44a8-a4ad-ac98254e4cd8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-318',
  '{"tr": "Çırağan Caddesi · Ada Kümesi 78", "en": "Çırağan Caddesi · Block Cluster 78"}'::jsonb,
  'Çırağan Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.009599 41.048, 29.011455 41.048, 29.011455 41.0494, 29.009599 41.0494, 29.009599 41.048))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0487)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '88b0f4a4-5ac8-4068-a278-84cce379650c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-355',
  '{"tr": "Alaybeyi Sokak · Ada Kümesi 85", "en": "Alaybeyi Sokak · Block Cluster 85"}'::jsonb,
  'Alaybeyi Sokak',
  24228,
  ST_GeomFromText('POLYGON((29.011455 41.048, 29.013311 41.048, 29.013311 41.0494, 29.011455 41.0494, 29.011455 41.048))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0487)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '71302942-48d1-4347-a9e1-7a05ba017c89',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-CRS-392',
  '{"tr": "Ihlamurdere Caddesi · Ada Kümesi 3", "en": "Ihlamurdere Caddesi · Block Cluster 3"}'::jsonb,
  'Ihlamurdere Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.013311 41.048, 29.015167 41.048, 29.015167 41.0494, 29.013311 41.0494, 29.013311 41.048))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0487)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '890a9b9a-7c10-4ba9-a51a-1033051b2743',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-206',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.000317 41.0494, 29.002174 41.0494, 29.002174 41.0508, 29.000317 41.0508, 29.000317 41.0494))', 4326),
  ST_GeomFromText('POINT(29.001246 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '63d31bbc-2412-42cf-a7c1-697387e58e8b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-243',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.002174 41.0494, 29.00403 41.0494, 29.00403 41.0508, 29.002174 41.0508, 29.002174 41.0494))', 4326),
  ST_GeomFromText('POINT(29.003102 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'abafc829-5c8a-44f9-a725-bcd0083a3d22',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-280',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.00403 41.0494, 29.005886 41.0494, 29.005886 41.0508, 29.00403 41.0508, 29.00403 41.0494))', 4326),
  ST_GeomFromText('POINT(29.004958 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b8a84610-c6a6-45d4-ae0e-73c47f4e7be4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-317',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.005886 41.0494, 29.007742 41.0494, 29.007742 41.0508, 29.005886 41.0508, 29.005886 41.0494))', 4326),
  ST_GeomFromText('POINT(29.006814 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e3cc769b-df88-404d-ac44-c6d6c35526e8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-354',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((29.007742 41.0494, 29.009599 41.0494, 29.009599 41.0508, 29.007742 41.0508, 29.007742 41.0494))', 4326),
  ST_GeomFromText('POINT(29.008671 41.0501)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78c4aeab-610d-45f4-a9c9-cb5fd9d2149f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-391',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.009599 41.0494, 29.011455 41.0494, 29.011455 41.0508, 29.009599 41.0508, 29.009599 41.0494))', 4326),
  ST_GeomFromText('POINT(29.010527 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '27e7a513-527a-428a-a59d-17997a62579d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-428',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.011455 41.0494, 29.013311 41.0494, 29.013311 41.0508, 29.011455 41.0508, 29.011455 41.0494))', 4326),
  ST_GeomFromText('POINT(29.012383 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd03dd0e6-676c-4c0b-a751-8ced37aa2cf1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BES-MRK-465',
  '{"tr": "Beşiktaş Şehir Caddeleri", "en": "Besiktas City Streets"}'::jsonb,
  'Beşiktaş Beşiktaş Bölgesi Caddesi',
  24228,
  ST_GeomFromText('POLYGON((29.013311 41.0494, 29.015167 41.0494, 29.015167 41.0508, 29.013311 41.0508, 29.013311 41.0494))', 4326),
  ST_GeomFromText('POINT(29.014239 41.0501)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ef462297-6c58-43fd-a31e-c16a5b9f0694',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-592',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.97364 41.027, 28.975496 41.027, 28.975496 41.0284, 28.97364 41.0284, 28.97364 41.027))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0277)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c130d84a-fb73-4148-aa43-8902bca42992',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-629',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.975496 41.027, 28.977352 41.027, 28.977352 41.0284, 28.975496 41.0284, 28.975496 41.027))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '07baff91-5c26-47b3-ab9c-b82263e14744',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-666',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.977352 41.027, 28.979208 41.027, 28.979208 41.0284, 28.977352 41.0284, 28.977352 41.027))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd396b9f3-a5fc-4dbe-a66a-e44d799317b1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-703',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.979208 41.027, 28.981064 41.027, 28.981064 41.0284, 28.979208 41.0284, 28.979208 41.027))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f096f269-38ab-4b48-a83d-692129428db1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-740',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.981064 41.027, 28.98292 41.027, 28.98292 41.0284, 28.981064 41.0284, 28.981064 41.027))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c0ec5e70-0525-4e74-a5c9-4004c6117ce4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-777',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.98292 41.027, 28.984776 41.027, 28.984776 41.0284, 28.98292 41.0284, 28.98292 41.027))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8ea9bb3f-daf9-4a10-a450-112f69a3654f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-814',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.984776 41.027, 28.986632 41.027, 28.986632 41.0284, 28.984776 41.0284, 28.984776 41.027))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0d4807cc-26e2-481a-abaa-1fd6342a1fe6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-851',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.986632 41.027, 28.988488 41.027, 28.988488 41.0284, 28.986632 41.0284, 28.986632 41.027))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0277)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '02373593-b7df-4c95-a5e8-c906ba173228',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-888',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.988488 41.027, 28.990344 41.027, 28.990344 41.0284, 28.988488 41.0284, 28.988488 41.027))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0277)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '585ba21f-98c4-4f6a-a09f-8d75f11fd189',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-665',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.97364 41.0284, 28.975496 41.0284, 28.975496 41.0298, 28.97364 41.0298, 28.97364 41.0284))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0291)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'afbd7884-98cb-40a0-a776-f8244888f924',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-702',
  '{"tr": "Meşrutiyet Caddesi · Ada Kümesi 51", "en": "Meşrutiyet Caddesi · Block Cluster 51"}'::jsonb,
  'Meşrutiyet Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.975496 41.0284, 28.977352 41.0284, 28.977352 41.0298, 28.975496 41.0298, 28.975496 41.0284))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0291)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '047f38ef-5412-4ed2-a06d-c63d589237c1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-739',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 58", "en": "Turnacıbaşı Caddesi · Block Cluster 58"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.977352 41.0284, 28.979208 41.0284, 28.979208 41.0298, 28.977352 41.0298, 28.977352 41.0284))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0291)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4d420c80-a5d8-43b6-a89a-6f36f31a7036',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-776',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 65", "en": "İstiklal Caddesi · Block Cluster 65"}'::jsonb,
  'İstiklal Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.979208 41.0284, 28.981064 41.0284, 28.981064 41.0298, 28.979208 41.0298, 28.979208 41.0284))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0291)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0384dbc5-7378-4179-a0fc-cabc76fced3e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-813',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 72", "en": "Akarsu Yokuşu · Block Cluster 72"}'::jsonb,
  'Akarsu Yokuşu',
  24236,
  ST_GeomFromText('POLYGON((28.981064 41.0284, 28.98292 41.0284, 28.98292 41.0298, 28.981064 41.0298, 28.981064 41.0284))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0291)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '985b7001-4e71-4408-a62a-a409e6cd4409',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-850',
  '{"tr": "Meşrutiyet Caddesi · Ada Kümesi 79", "en": "Meşrutiyet Caddesi · Block Cluster 79"}'::jsonb,
  'Meşrutiyet Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.98292 41.0284, 28.984776 41.0284, 28.984776 41.0298, 28.98292 41.0298, 28.98292 41.0284))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0291)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '95fa2b58-0486-4e57-a17c-b50f9a80c9af',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-887',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 86", "en": "Turnacıbaşı Caddesi · Block Cluster 86"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.984776 41.0284, 28.986632 41.0284, 28.986632 41.0298, 28.984776 41.0298, 28.984776 41.0284))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0291)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '21ba860f-1cf4-4264-ad4e-c46b3eaec873',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-924',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 4", "en": "Meclis-i Mebusan Caddesi · Block Cluster 4"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.986632 41.0284, 28.988488 41.0284, 28.988488 41.0298, 28.986632 41.0298, 28.986632 41.0284))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0291)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b8ec82a8-8080-433f-a86c-c197396cc5e7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-961',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((28.988488 41.0284, 28.990344 41.0284, 28.990344 41.0298, 28.988488 41.0298, 28.988488 41.0284))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0291)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ad7f5aed-ebf0-4145-a68f-2ba8996fcc32',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-738',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.97364 41.0298, 28.975496 41.0298, 28.975496 41.0312, 28.97364 41.0312, 28.97364 41.0298))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0305)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7d0541ec-ccac-4304-a1a9-a2e849b224f0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-775',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 64", "en": "Turnacıbaşı Caddesi · Block Cluster 64"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.975496 41.0298, 28.977352 41.0298, 28.977352 41.0312, 28.975496 41.0312, 28.975496 41.0298))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0305)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '028dae76-01ed-49cc-a360-37ba047b4842',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-812',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 71", "en": "Meclis-i Mebusan Caddesi · Block Cluster 71"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.977352 41.0298, 28.979208 41.0298, 28.979208 41.0312, 28.977352 41.0312, 28.977352 41.0298))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0305)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2e0d9f1a-59b0-46c0-a7bd-a9da87bdd5da',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-849',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 78", "en": "Kumbaracı Yokuşu · Block Cluster 78"}'::jsonb,
  'Kumbaracı Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.979208 41.0298, 28.981064 41.0298, 28.981064 41.0312, 28.979208 41.0312, 28.979208 41.0298))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0305)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ba80a6f4-8b37-49a7-a1b7-bf5345b7c09b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-886',
  '{"tr": "Boğazkesen Caddesi · Ada Kümesi 85", "en": "Boğazkesen Caddesi · Block Cluster 85"}'::jsonb,
  'Boğazkesen Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.981064 41.0298, 28.98292 41.0298, 28.98292 41.0312, 28.981064 41.0312, 28.981064 41.0298))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0305)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b9e27831-e54f-42d2-acad-0ae39f31eb03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-923',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 3", "en": "Turnacıbaşı Caddesi · Block Cluster 3"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.98292 41.0298, 28.984776 41.0298, 28.984776 41.0312, 28.98292 41.0312, 28.98292 41.0298))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0305)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fe7b400f-144c-409a-aa37-a09512c820a9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-960',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 10", "en": "Meclis-i Mebusan Caddesi · Block Cluster 10"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.984776 41.0298, 28.986632 41.0298, 28.986632 41.0312, 28.984776 41.0312, 28.984776 41.0298))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0305)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0513659-d6f4-4f91-a6a5-d9c8a74625ea',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-997',
  '{"tr": "Firuzağa Sokak · Ada Kümesi 17", "en": "Firuzağa Sokak · Block Cluster 17"}'::jsonb,
  'Firuzağa Sokak',
  24235,
  ST_GeomFromText('POLYGON((28.986632 41.0298, 28.988488 41.0298, 28.988488 41.0312, 28.986632 41.0312, 28.986632 41.0298))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0305)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8f00ebf3-e24a-4b47-ad4a-80b4714b573a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-035',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.988488 41.0298, 28.990344 41.0298, 28.990344 41.0312, 28.988488 41.0312, 28.988488 41.0298))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0305)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '404248a7-9c14-416d-ac56-29cadc56aa14',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-811',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.97364 41.0312, 28.975496 41.0312, 28.975496 41.0326, 28.97364 41.0326, 28.97364 41.0312))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0319)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aa0520ea-e9d0-4f91-a3d5-2f7b93d5307b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-848',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 77", "en": "Meclis-i Mebusan Caddesi · Block Cluster 77"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.975496 41.0312, 28.977352 41.0312, 28.977352 41.0326, 28.975496 41.0326, 28.975496 41.0312))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0319)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e8a04b83-fe13-49d4-a6b3-f257e6b40557',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-885',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 84", "en": "Akarsu Yokuşu · Block Cluster 84"}'::jsonb,
  'Akarsu Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.977352 41.0312, 28.979208 41.0312, 28.979208 41.0326, 28.977352 41.0326, 28.977352 41.0312))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0319)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'da94fd78-81c4-4c83-ab50-a1fb5c5959fb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-922',
  '{"tr": "Boğazkesen Caddesi · Ada Kümesi 2", "en": "Boğazkesen Caddesi · Block Cluster 2"}'::jsonb,
  'Boğazkesen Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.979208 41.0312, 28.981064 41.0312, 28.981064 41.0326, 28.979208 41.0326, 28.979208 41.0312))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0319)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cc73b19e-5c14-4d7e-a067-cce028882f1c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-959',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 9", "en": "Akarsu Yokuşu · Block Cluster 9"}'::jsonb,
  'Akarsu Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.981064 41.0312, 28.98292 41.0312, 28.98292 41.0326, 28.981064 41.0326, 28.981064 41.0312))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0319)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b6e8c642-f177-4c58-a79f-7a1aa860829a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-996',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 16", "en": "Meclis-i Mebusan Caddesi · Block Cluster 16"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.98292 41.0312, 28.984776 41.0312, 28.984776 41.0326, 28.98292 41.0326, 28.98292 41.0312))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0319)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd577bc5c-0dc0-4086-a8b7-8cdae337ece2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-034',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 23", "en": "Turnacıbaşı Caddesi · Block Cluster 23"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.984776 41.0312, 28.986632 41.0312, 28.986632 41.0326, 28.984776 41.0326, 28.984776 41.0312))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0319)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7756fe1f-58ee-4980-afb8-679fd045979f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-071',
  '{"tr": "Boğazkesen Caddesi · Ada Kümesi 30", "en": "Boğazkesen Caddesi · Block Cluster 30"}'::jsonb,
  'Boğazkesen Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.986632 41.0312, 28.988488 41.0312, 28.988488 41.0326, 28.986632 41.0326, 28.986632 41.0312))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0319)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e7e0e305-50ed-46ed-a70d-65e838ce69f2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-108',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.988488 41.0312, 28.990344 41.0312, 28.990344 41.0326, 28.988488 41.0326, 28.988488 41.0312))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0319)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8b5357d8-d05a-40c8-ab09-67105bad88a0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-884',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.97364 41.0326, 28.975496 41.0326, 28.975496 41.034, 28.97364 41.034, 28.97364 41.0326))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0333)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '896628fc-6099-4399-a9ff-3b65e9ff3c95',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-921',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 1", "en": "Kumbaracı Yokuşu · Block Cluster 1"}'::jsonb,
  'Kumbaracı Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.975496 41.0326, 28.977352 41.0326, 28.977352 41.034, 28.975496 41.034, 28.975496 41.0326))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0333)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '30d3f2c5-0c7b-43e2-aca8-21273d4fc6a7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-958',
  '{"tr": "Sıraselviler Caddesi · Ada Kümesi 8", "en": "Sıraselviler Caddesi · Block Cluster 8"}'::jsonb,
  'Sıraselviler Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.977352 41.0326, 28.979208 41.0326, 28.979208 41.034, 28.977352 41.034, 28.977352 41.0326))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0333)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '004dc89a-033a-4850-a377-40ca038850ea',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-995',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 15", "en": "Kumbaracı Yokuşu · Block Cluster 15"}'::jsonb,
  'Kumbaracı Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.979208 41.0326, 28.981064 41.0326, 28.981064 41.034, 28.979208 41.034, 28.979208 41.0326))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0333)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3c1f81df-3520-4bd8-a93f-4a0771404db7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-033',
  '{"tr": "Tarlabaşı Bulvarı · Ada Kümesi 22", "en": "Tarlabaşı Bulvarı · Block Cluster 22"}'::jsonb,
  'Tarlabaşı Bulvarı',
  24235,
  ST_GeomFromText('POLYGON((28.981064 41.0326, 28.98292 41.0326, 28.98292 41.034, 28.981064 41.034, 28.981064 41.0326))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0333)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a5f514ac-be98-438c-ab6d-2720648d4838',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-070',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 29", "en": "Kumbaracı Yokuşu · Block Cluster 29"}'::jsonb,
  'Kumbaracı Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.98292 41.0326, 28.984776 41.0326, 28.984776 41.034, 28.98292 41.034, 28.98292 41.0326))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0333)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7ffa0ac4-50fb-401d-af01-bad9d0f5bae1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-107',
  '{"tr": "Sıraselviler Caddesi · Ada Kümesi 36", "en": "Sıraselviler Caddesi · Block Cluster 36"}'::jsonb,
  'Sıraselviler Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.984776 41.0326, 28.986632 41.0326, 28.986632 41.034, 28.984776 41.034, 28.984776 41.0326))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0333)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c74a1327-9344-4390-a40e-c0b75a8ee6b7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-144',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 43", "en": "Kumbaracı Yokuşu · Block Cluster 43"}'::jsonb,
  'Kumbaracı Yokuşu',
  24235,
  ST_GeomFromText('POLYGON((28.986632 41.0326, 28.988488 41.0326, 28.988488 41.034, 28.986632 41.034, 28.986632 41.0326))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0333)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8daa0e0c-2231-4bbd-af9b-55b1afdb69c9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-181',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((28.988488 41.0326, 28.990344 41.0326, 28.990344 41.034, 28.988488 41.034, 28.988488 41.0326))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0333)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3e9cd513-2076-4132-aeea-04215f13a645',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-957',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.97364 41.034, 28.975496 41.034, 28.975496 41.0354, 28.97364 41.0354, 28.97364 41.034))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0347)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '87c614b4-4ad3-49d8-ad15-9d6cd2999e8c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-994',
  '{"tr": "Sıraselviler Caddesi · Ada Kümesi 14", "en": "Sıraselviler Caddesi · Block Cluster 14"}'::jsonb,
  'Sıraselviler Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.975496 41.034, 28.977352 41.034, 28.977352 41.0354, 28.975496 41.0354, 28.975496 41.034))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0347)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9cebcc90-0c01-4c73-a0ea-90e3a8ed2903',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-032',
  '{"tr": "Asmalı Mescit Sokak · Ada Kümesi 21", "en": "Asmalı Mescit Sokak · Block Cluster 21"}'::jsonb,
  'Asmalı Mescit Sokak',
  24233,
  ST_GeomFromText('POLYGON((28.977352 41.034, 28.979208 41.034, 28.979208 41.0354, 28.977352 41.0354, 28.977352 41.034))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0347)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9b09bfda-b36d-4b97-a864-944d4e76eb71',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-069',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 28", "en": "İstiklal Caddesi · Block Cluster 28"}'::jsonb,
  'İstiklal Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.979208 41.034, 28.981064 41.034, 28.981064 41.0354, 28.979208 41.0354, 28.979208 41.034))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0347)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e2114c44-fe2e-46e5-ac3f-8aa1e0401329',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-106',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 35", "en": "Akarsu Yokuşu · Block Cluster 35"}'::jsonb,
  'Akarsu Yokuşu',
  24233,
  ST_GeomFromText('POLYGON((28.981064 41.034, 28.98292 41.034, 28.98292 41.0354, 28.981064 41.0354, 28.981064 41.034))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0347)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f343b912-0dca-46a5-ae89-cfb7010e2fb7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-143',
  '{"tr": "Meşrutiyet Caddesi · Ada Kümesi 42", "en": "Meşrutiyet Caddesi · Block Cluster 42"}'::jsonb,
  'Meşrutiyet Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.98292 41.034, 28.984776 41.034, 28.984776 41.0354, 28.98292 41.0354, 28.98292 41.034))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0347)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78db296f-cb39-452f-a3e2-ec404414ee9e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-180',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 49", "en": "Turnacıbaşı Caddesi · Block Cluster 49"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.984776 41.034, 28.986632 41.034, 28.986632 41.0354, 28.984776 41.0354, 28.984776 41.034))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0347)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6f51134a-47dd-4a80-a88c-19cab72e1dca',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-217',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 56", "en": "İstiklal Caddesi · Block Cluster 56"}'::jsonb,
  'İstiklal Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.986632 41.034, 28.988488 41.034, 28.988488 41.0354, 28.986632 41.0354, 28.986632 41.034))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0347)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7d09acac-4d73-4257-a07a-4efbca7d8f03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-254',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.988488 41.034, 28.990344 41.034, 28.990344 41.0354, 28.988488 41.0354, 28.988488 41.034))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0347)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0e0e00c9-38fb-43e3-a6f5-e32a4709e4ac',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-031',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.97364 41.0354, 28.975496 41.0354, 28.975496 41.0368, 28.97364 41.0368, 28.97364 41.0354))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0361)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0d63264-1fe8-4335-af3e-d151f0bf1599',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-068',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 27", "en": "Kumbaracı Yokuşu · Block Cluster 27"}'::jsonb,
  'Kumbaracı Yokuşu',
  24233,
  ST_GeomFromText('POLYGON((28.975496 41.0354, 28.977352 41.0354, 28.977352 41.0368, 28.975496 41.0368, 28.975496 41.0354))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0361)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5e801f26-d406-4cbc-aa86-e39a32871be2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-105',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 34", "en": "İstiklal Caddesi · Block Cluster 34"}'::jsonb,
  'İstiklal Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.977352 41.0354, 28.979208 41.0354, 28.979208 41.0368, 28.977352 41.0368, 28.977352 41.0354))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0361)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1c9b6d72-409c-4483-ac07-79f15d3781f5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-142',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 41", "en": "Kumbaracı Yokuşu · Block Cluster 41"}'::jsonb,
  'Kumbaracı Yokuşu',
  24233,
  ST_GeomFromText('POLYGON((28.979208 41.0354, 28.981064 41.0354, 28.981064 41.0368, 28.979208 41.0368, 28.979208 41.0354))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0361)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e61ef705-5ec7-4b00-a8d9-6c0544e69205',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-179',
  '{"tr": "Boğazkesen Caddesi · Ada Kümesi 48", "en": "Boğazkesen Caddesi · Block Cluster 48"}'::jsonb,
  'Boğazkesen Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.981064 41.0354, 28.98292 41.0354, 28.98292 41.0368, 28.981064 41.0368, 28.981064 41.0354))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0361)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3ef4c0c2-d794-42d6-a960-021416898398',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-216',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 55", "en": "Turnacıbaşı Caddesi · Block Cluster 55"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.98292 41.0354, 28.984776 41.0354, 28.984776 41.0368, 28.98292 41.0368, 28.98292 41.0354))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0361)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a6504568-5eba-422c-a8ea-e744050ae794',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-253',
  '{"tr": "Meclis-i Mebusan Caddesi · Ada Kümesi 62", "en": "Meclis-i Mebusan Caddesi · Block Cluster 62"}'::jsonb,
  'Meclis-i Mebusan Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.984776 41.0354, 28.986632 41.0354, 28.986632 41.0368, 28.984776 41.0368, 28.984776 41.0354))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0361)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '33d8a7fc-1b93-455d-a84b-f2a14f6bfd59',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-290',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 69", "en": "Akarsu Yokuşu · Block Cluster 69"}'::jsonb,
  'Akarsu Yokuşu',
  24233,
  ST_GeomFromText('POLYGON((28.986632 41.0354, 28.988488 41.0354, 28.988488 41.0368, 28.986632 41.0368, 28.986632 41.0354))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0361)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6a2d8dd6-3b17-4527-a13a-78f1a54582fd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-327',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.988488 41.0354, 28.990344 41.0354, 28.990344 41.0368, 28.988488 41.0368, 28.988488 41.0354))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0361)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '199278a3-8454-476a-adc6-bfc99de7400d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-104',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.97364 41.0368, 28.975496 41.0368, 28.975496 41.0382, 28.97364 41.0382, 28.97364 41.0368))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8ac3a234-0c45-406a-a686-225e9709229e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-141',
  '{"tr": "Tarlabaşı Bulvarı · Ada Kümesi 40", "en": "Tarlabaşı Bulvarı · Block Cluster 40"}'::jsonb,
  'Tarlabaşı Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((28.975496 41.0368, 28.977352 41.0368, 28.977352 41.0382, 28.975496 41.0382, 28.975496 41.0368))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0375)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4220aecf-4ec0-4870-ace0-c6bf90e1173f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-178',
  '{"tr": "Firuzağa Sokak · Ada Kümesi 47", "en": "Firuzağa Sokak · Block Cluster 47"}'::jsonb,
  'Firuzağa Sokak',
  24233,
  ST_GeomFromText('POLYGON((28.977352 41.0368, 28.979208 41.0368, 28.979208 41.0382, 28.977352 41.0382, 28.977352 41.0368))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0375)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b3db0ae3-58fd-4059-ab26-eaba0cd8eb3c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-215',
  '{"tr": "Boğazkesen Caddesi · Ada Kümesi 54", "en": "Boğazkesen Caddesi · Block Cluster 54"}'::jsonb,
  'Boğazkesen Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.979208 41.0368, 28.981064 41.0368, 28.981064 41.0382, 28.979208 41.0382, 28.979208 41.0368))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '572f6897-bcf4-4232-abdb-caa514240ac9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-252',
  '{"tr": "Firuzağa Sokak · Ada Kümesi 61", "en": "Firuzağa Sokak · Block Cluster 61"}'::jsonb,
  'Firuzağa Sokak',
  24233,
  ST_GeomFromText('POLYGON((28.981064 41.0368, 28.98292 41.0368, 28.98292 41.0382, 28.981064 41.0382, 28.981064 41.0368))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0375)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6535ace7-a8b1-4201-ad84-0ee60de74ee8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-289',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 68", "en": "İstiklal Caddesi · Block Cluster 68"}'::jsonb,
  'İstiklal Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.98292 41.0368, 28.984776 41.0368, 28.984776 41.0382, 28.98292 41.0382, 28.98292 41.0368))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0375)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '186f5bff-e525-44f1-ad4a-9f0efd9520f0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-326',
  '{"tr": "Firuzağa Sokak · Ada Kümesi 75", "en": "Firuzağa Sokak · Block Cluster 75"}'::jsonb,
  'Firuzağa Sokak',
  24233,
  ST_GeomFromText('POLYGON((28.984776 41.0368, 28.986632 41.0368, 28.986632 41.0382, 28.984776 41.0382, 28.984776 41.0368))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0375)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '49979939-39a5-4457-a032-8d6e833cad90',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-363',
  '{"tr": "Sıraselviler Caddesi · Ada Kümesi 82", "en": "Sıraselviler Caddesi · Block Cluster 82"}'::jsonb,
  'Sıraselviler Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.986632 41.0368, 28.988488 41.0368, 28.988488 41.0382, 28.986632 41.0382, 28.986632 41.0368))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '80192c9e-d267-40b0-a27e-6c2e52806d4e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-400',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((28.988488 41.0368, 28.990344 41.0368, 28.990344 41.0382, 28.988488 41.0382, 28.988488 41.0368))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0375)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0ab353a1-dfa8-4db4-a51b-0e15ea5bb155',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-177',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.97364 41.0382, 28.975496 41.0382, 28.975496 41.0396, 28.97364 41.0396, 28.97364 41.0382))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0389)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dcca2f11-75fd-4f33-a937-f02252c80e44',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-214',
  '{"tr": "Kumbaracı Yokuşu · Ada Kümesi 53", "en": "Kumbaracı Yokuşu · Block Cluster 53"}'::jsonb,
  'Kumbaracı Yokuşu',
  24232,
  ST_GeomFromText('POLYGON((28.975496 41.0382, 28.977352 41.0382, 28.977352 41.0396, 28.975496 41.0396, 28.975496 41.0382))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ec7e015d-effe-4f73-a380-ce2edc7cd0d0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-251',
  '{"tr": "Meşrutiyet Caddesi · Ada Kümesi 60", "en": "Meşrutiyet Caddesi · Block Cluster 60"}'::jsonb,
  'Meşrutiyet Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.977352 41.0382, 28.979208 41.0382, 28.979208 41.0396, 28.977352 41.0396, 28.977352 41.0382))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0389)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '080f67a9-1b69-4154-a366-e6fd2378e8fd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-288',
  '{"tr": "Turnacıbaşı Caddesi · Ada Kümesi 67", "en": "Turnacıbaşı Caddesi · Block Cluster 67"}'::jsonb,
  'Turnacıbaşı Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.979208 41.0382, 28.981064 41.0382, 28.981064 41.0396, 28.979208 41.0396, 28.979208 41.0382))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fc9ede3b-8dac-408c-a132-deb78a4adec7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-325',
  '{"tr": "İstiklal Caddesi · Ada Kümesi 74", "en": "İstiklal Caddesi · Block Cluster 74"}'::jsonb,
  'İstiklal Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.981064 41.0382, 28.98292 41.0382, 28.98292 41.0396, 28.981064 41.0396, 28.981064 41.0382))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0389)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f18d7627-05f5-4922-a478-4f05f782af49',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-362',
  '{"tr": "Akarsu Yokuşu · Ada Kümesi 81", "en": "Akarsu Yokuşu · Block Cluster 81"}'::jsonb,
  'Akarsu Yokuşu',
  24232,
  ST_GeomFromText('POLYGON((28.98292 41.0382, 28.984776 41.0382, 28.984776 41.0396, 28.98292 41.0396, 28.98292 41.0382))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a20b9bce-bfbf-4002-adb4-abcc61cacbd0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-399',
  '{"tr": "Meşrutiyet Caddesi · Ada Kümesi 88", "en": "Meşrutiyet Caddesi · Block Cluster 88"}'::jsonb,
  'Meşrutiyet Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.984776 41.0382, 28.986632 41.0382, 28.986632 41.0396, 28.984776 41.0396, 28.984776 41.0382))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0389)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8b8d333d-55c9-44db-ae44-07e6e1566818',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-IST-436',
  '{"tr": "Asmalı Mescit Sokak · Ada Kümesi 6", "en": "Asmalı Mescit Sokak · Block Cluster 6"}'::jsonb,
  'Asmalı Mescit Sokak',
  24232,
  ST_GeomFromText('POLYGON((28.986632 41.0382, 28.988488 41.0382, 28.988488 41.0396, 28.986632 41.0396, 28.986632 41.0382))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0389)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6efb403f-0e45-42f4-a0be-72cb7d407333',
  'a0000000-0000-0000-0000-000000000003',
  'TR-BEY-MRK-473',
  '{"tr": "Beyoğlu Şehir Caddeleri", "en": "Beyoglu City Streets"}'::jsonb,
  'Beyoğlu Beyoğlu Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.988488 41.0382, 28.990344 41.0382, 28.990344 41.0396, 28.988488 41.0396, 28.988488 41.0382))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0389)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '397bc84f-7ff7-4e9c-a68c-f6d3b97306eb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-250',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.97364 41.0396, 28.975496 41.0396, 28.975496 41.041, 28.97364 41.041, 28.97364 41.0396))', 4326),
  ST_GeomFromText('POINT(28.974568 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5325277a-85a7-45e4-a682-329ed8cc3d5e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-287',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.975496 41.0396, 28.977352 41.0396, 28.977352 41.041, 28.975496 41.041, 28.975496 41.0396))', 4326),
  ST_GeomFromText('POINT(28.976424 41.0403)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ee2edf6b-0c52-4575-a27c-ea1efa8114e0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-324',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.977352 41.0396, 28.979208 41.0396, 28.979208 41.041, 28.977352 41.041, 28.977352 41.0396))', 4326),
  ST_GeomFromText('POINT(28.97828 41.0403)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '47eb81ef-ab44-458e-acaf-1461f330177d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-361',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.979208 41.0396, 28.981064 41.0396, 28.981064 41.041, 28.979208 41.041, 28.979208 41.0396))', 4326),
  ST_GeomFromText('POINT(28.980136 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8a46a65a-074e-4873-ad08-8e299194cecd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-398',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.981064 41.0396, 28.98292 41.0396, 28.98292 41.041, 28.981064 41.041, 28.981064 41.0396))', 4326),
  ST_GeomFromText('POINT(28.981992 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2804e351-3d91-4b89-a595-48d865968eda',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-435',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.98292 41.0396, 28.984776 41.0396, 28.984776 41.041, 28.98292 41.041, 28.98292 41.0396))', 4326),
  ST_GeomFromText('POINT(28.983848 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b6fa800a-2e86-41d3-a87c-71d9e58171dd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-472',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.984776 41.0396, 28.986632 41.0396, 28.986632 41.041, 28.984776 41.041, 28.984776 41.0396))', 4326),
  ST_GeomFromText('POINT(28.985704 41.0403)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd643cbe2-b820-4912-ae63-22f08e64b4f4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-509',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.986632 41.0396, 28.988488 41.0396, 28.988488 41.041, 28.986632 41.041, 28.986632 41.0396))', 4326),
  ST_GeomFromText('POINT(28.98756 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e1e0f2cd-e2fb-4c5c-a31b-3e91c4dcbf29',
  'a0000000-0000-0000-0000-000000000003',
  'TR-SIS-MRK-546',
  '{"tr": "Şişli Şehir Caddeleri", "en": "Sisli City Streets"}'::jsonb,
  'Şişli Şişli Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((28.988488 41.0396, 28.990344 41.0396, 28.990344 41.041, 28.988488 41.041, 28.988488 41.0396))', 4326),
  ST_GeomFromText('POINT(28.989416 41.0403)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '485eb323-dc24-48e0-a47a-2bc324834c03',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-028',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.84325 39.9, 32.845075 39.9, 32.845075 39.9014, 32.84325 39.9014, 32.84325 39.9))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9007)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a71c7ba8-7a3b-4d50-ad27-56f82157a8f8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-065',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 24", "en": "Yüksel Caddesi · Block Cluster 24"}'::jsonb,
  'Yüksel Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.845075 39.9, 32.8469 39.9, 32.8469 39.9014, 32.845075 39.9014, 32.845075 39.9))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dedb1158-b478-426c-aaa3-0334935323c4',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-102',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 31", "en": "Atatürk Bulvarı · Block Cluster 31"}'::jsonb,
  'Atatürk Bulvarı',
  24249,
  ST_GeomFromText('POLYGON((32.8469 39.9, 32.848726 39.9, 32.848726 39.9014, 32.8469 39.9014, 32.8469 39.9))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9007)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f17f97bf-9dfc-4f21-ac83-089e8f7c36e0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-139',
  '{"tr": "Büklüm Sokak · Ada Kümesi 38", "en": "Büklüm Sokak · Block Cluster 38"}'::jsonb,
  'Büklüm Sokak',
  24235,
  ST_GeomFromText('POLYGON((32.848726 39.9, 32.850551 39.9, 32.850551 39.9014, 32.848726 39.9014, 32.848726 39.9))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b324b410-49dc-4eb7-aaf8-9aa7fd00e2c7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-176',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 45", "en": "Turan Güneş Bulvarı · Block Cluster 45"}'::jsonb,
  'Turan Güneş Bulvarı',
  24235,
  ST_GeomFromText('POLYGON((32.850551 39.9, 32.852376 39.9, 32.852376 39.9014, 32.850551 39.9014, 32.850551 39.9))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9007)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9b6d1d75-d6af-4a17-adc2-f762721d078c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-213',
  '{"tr": "Büklüm Sokak · Ada Kümesi 52", "en": "Büklüm Sokak · Block Cluster 52"}'::jsonb,
  'Büklüm Sokak',
  24235,
  ST_GeomFromText('POLYGON((32.852376 39.9, 32.854201 39.9, 32.854201 39.9014, 32.852376 39.9014, 32.852376 39.9))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '452424db-bed2-411a-abf6-15c103f655f5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-250',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 59", "en": "Atatürk Bulvarı · Block Cluster 59"}'::jsonb,
  'Atatürk Bulvarı',
  24235,
  ST_GeomFromText('POLYGON((32.854201 39.9, 32.856026 39.9, 32.856026 39.9014, 32.854201 39.9014, 32.854201 39.9))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9007)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '607cf6f2-3911-4754-a96d-81a6998e6e46',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-287',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 66", "en": "Yüksel Caddesi · Block Cluster 66"}'::jsonb,
  'Yüksel Caddesi',
  24249,
  ST_GeomFromText('POLYGON((32.856026 39.9, 32.857852 39.9, 32.857852 39.9014, 32.856026 39.9014, 32.856026 39.9))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b88dacf1-dc15-4968-a498-659994a37659',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-324',
  '{"tr": "Karanfil Sokak · Ada Kümesi 73", "en": "Karanfil Sokak · Block Cluster 73"}'::jsonb,
  'Karanfil Sokak',
  24235,
  ST_GeomFromText('POLYGON((32.857852 39.9, 32.859677 39.9, 32.859677 39.9014, 32.857852 39.9014, 32.857852 39.9))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9007)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b8d35d1d-898a-4903-a159-041e425db620',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-361',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 80", "en": "Yüksel Caddesi · Block Cluster 80"}'::jsonb,
  'Yüksel Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.859677 39.9, 32.861502 39.9, 32.861502 39.9014, 32.859677 39.9014, 32.859677 39.9))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6d47eada-8b8b-40c4-a6cc-1a1ef8d3db9e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-398',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 87", "en": "Ziya Gökalp Caddesi · Block Cluster 87"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.861502 39.9, 32.863327 39.9, 32.863327 39.9014, 32.861502 39.9014, 32.861502 39.9))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9007)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '80542dc6-c7c2-4401-a796-c9c7481711c7',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-435',
  '{"tr": "Büklüm Sokak · Ada Kümesi 5", "en": "Büklüm Sokak · Block Cluster 5"}'::jsonb,
  'Büklüm Sokak',
  24249,
  ST_GeomFromText('POLYGON((32.863327 39.9, 32.865153 39.9, 32.865153 39.9014, 32.863327 39.9014, 32.863327 39.9))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9007)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b6b97809-5867-4e04-aede-f60d0f21060d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-101',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.84325 39.9014, 32.845075 39.9014, 32.845075 39.9028, 32.84325 39.9028, 32.84325 39.9014))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9021)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2abcc3bc-8ac7-4c0c-a07b-1fb0b5849fc8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-138',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 37", "en": "Ziya Gökalp Caddesi · Block Cluster 37"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.845075 39.9014, 32.8469 39.9014, 32.8469 39.9028, 32.845075 39.9028, 32.845075 39.9014))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9021)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c3f0ab3-c709-41ea-ab36-eb593348ec9d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-175',
  '{"tr": "Büklüm Sokak · Ada Kümesi 44", "en": "Büklüm Sokak · Block Cluster 44"}'::jsonb,
  'Büklüm Sokak',
  24247,
  ST_GeomFromText('POLYGON((32.8469 39.9014, 32.848726 39.9014, 32.848726 39.9028, 32.8469 39.9028, 32.8469 39.9014))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9021)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8a63dca0-9007-46a0-aa64-3a001a6bc340',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-212',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 51", "en": "Tunalı Hilmi Caddesi · Block Cluster 51"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.848726 39.9014, 32.850551 39.9014, 32.850551 39.9028, 32.848726 39.9028, 32.848726 39.9014))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9021)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7f1050cf-c81a-40cd-a70a-3002472ab19c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-249',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 58", "en": "Yüksel Caddesi · Block Cluster 58"}'::jsonb,
  'Yüksel Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.850551 39.9014, 32.852376 39.9014, 32.852376 39.9028, 32.850551 39.9028, 32.850551 39.9014))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9021)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '98a00283-df99-41df-a739-935c78399462',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-286',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 65", "en": "Ziya Gökalp Caddesi · Block Cluster 65"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.852376 39.9014, 32.854201 39.9014, 32.854201 39.9028, 32.852376 39.9028, 32.852376 39.9014))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9021)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1a96e9c7-de00-49a4-a496-2063f897b36b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-323',
  '{"tr": "Büklüm Sokak · Ada Kümesi 72", "en": "Büklüm Sokak · Block Cluster 72"}'::jsonb,
  'Büklüm Sokak',
  24235,
  ST_GeomFromText('POLYGON((32.854201 39.9014, 32.856026 39.9014, 32.856026 39.9028, 32.854201 39.9028, 32.854201 39.9014))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9021)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7f78ec20-3a17-4b83-a56f-17a3b990e7a3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-360',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 79", "en": "Turan Güneş Bulvarı · Block Cluster 79"}'::jsonb,
  'Turan Güneş Bulvarı',
  24247,
  ST_GeomFromText('POLYGON((32.856026 39.9014, 32.857852 39.9014, 32.857852 39.9028, 32.856026 39.9028, 32.856026 39.9014))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9021)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'db3ebb21-0183-42ef-aabd-c9cedcc22e10',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-397',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 86", "en": "Kuğulu Park Yolu · Block Cluster 86"}'::jsonb,
  'Kuğulu Park Yolu',
  24235,
  ST_GeomFromText('POLYGON((32.857852 39.9014, 32.859677 39.9014, 32.859677 39.9028, 32.857852 39.9028, 32.857852 39.9014))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9021)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1c331cef-cebb-4219-a288-aef6eaeecf08',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-434',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 4", "en": "Ziya Gökalp Caddesi · Block Cluster 4"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24235,
  ST_GeomFromText('POLYGON((32.859677 39.9014, 32.861502 39.9014, 32.861502 39.9028, 32.859677 39.9028, 32.859677 39.9014))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9021)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2e9d2905-a2ab-4123-ac36-e826d148ea28',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-471',
  '{"tr": "Büklüm Sokak · Ada Kümesi 11", "en": "Büklüm Sokak · Block Cluster 11"}'::jsonb,
  'Büklüm Sokak',
  24235,
  ST_GeomFromText('POLYGON((32.861502 39.9014, 32.863327 39.9014, 32.863327 39.9028, 32.861502 39.9028, 32.861502 39.9014))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9021)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f8e32c42-49e3-4b43-a100-570142c6a785',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-508',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 18", "en": "Tunalı Hilmi Caddesi · Block Cluster 18"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.863327 39.9014, 32.865153 39.9014, 32.865153 39.9028, 32.863327 39.9028, 32.863327 39.9014))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9021)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a8540d02-c0fd-4588-a8a9-288a6951328a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-174',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.84325 39.9028, 32.845075 39.9028, 32.845075 39.9042, 32.84325 39.9042, 32.84325 39.9028))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9035)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '32bfdc16-2be6-451f-a959-09095ea6b135',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-211',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 50", "en": "Kuğulu Park Yolu · Block Cluster 50"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.845075 39.9028, 32.8469 39.9028, 32.8469 39.9042, 32.845075 39.9042, 32.845075 39.9028))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '70029e39-0607-4385-a605-1dbc760a21be',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-248',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 57", "en": "Tunalı Hilmi Caddesi · Block Cluster 57"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.8469 39.9028, 32.848726 39.9028, 32.848726 39.9042, 32.8469 39.9042, 32.8469 39.9028))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9035)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2dffb21d-45f5-48c0-a80a-2add73f54add',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-285',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 64", "en": "Yüksel Caddesi · Block Cluster 64"}'::jsonb,
  'Yüksel Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.848726 39.9028, 32.850551 39.9028, 32.850551 39.9042, 32.848726 39.9042, 32.848726 39.9028))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7e69db49-5d7d-4b8f-a314-10c6dbe7a6d8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-322',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 71", "en": "Atatürk Bulvarı · Block Cluster 71"}'::jsonb,
  'Atatürk Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.850551 39.9028, 32.852376 39.9028, 32.852376 39.9042, 32.850551 39.9042, 32.850551 39.9028))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9035)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fee8fa00-845b-4124-aab3-7b2483447b24',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-359',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 78", "en": "Kuğulu Park Yolu · Block Cluster 78"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.852376 39.9028, 32.854201 39.9028, 32.854201 39.9042, 32.852376 39.9042, 32.852376 39.9028))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd859f6bf-261e-4cf1-ae47-0a4efe78f3b0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-396',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 85", "en": "Tunalı Hilmi Caddesi · Block Cluster 85"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.854201 39.9028, 32.856026 39.9028, 32.856026 39.9042, 32.854201 39.9042, 32.854201 39.9028))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9035)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e41087a2-095f-494e-ad4f-9eeced6fa0f0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-433',
  '{"tr": "Büklüm Sokak · Ada Kümesi 3", "en": "Büklüm Sokak · Block Cluster 3"}'::jsonb,
  'Büklüm Sokak',
  24247,
  ST_GeomFromText('POLYGON((32.856026 39.9028, 32.857852 39.9028, 32.857852 39.9042, 32.856026 39.9042, 32.856026 39.9028))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c190c0ac-2470-425f-a5e0-e2f3e600e30b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-470',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 10", "en": "Atatürk Bulvarı · Block Cluster 10"}'::jsonb,
  'Atatürk Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.857852 39.9028, 32.859677 39.9028, 32.859677 39.9042, 32.857852 39.9042, 32.857852 39.9028))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9035)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '79425294-d642-441e-af00-368a4f84b6b2',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-507',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 17", "en": "Kuğulu Park Yolu · Block Cluster 17"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.859677 39.9028, 32.861502 39.9028, 32.861502 39.9042, 32.859677 39.9042, 32.859677 39.9028))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '00dc9441-0f2f-49e1-aff3-2da0100c4e22',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-544',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 24", "en": "Tunalı Hilmi Caddesi · Block Cluster 24"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.861502 39.9028, 32.863327 39.9028, 32.863327 39.9042, 32.861502 39.9042, 32.861502 39.9028))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9035)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7172ad74-2a52-412d-ab20-0c599bc54ea1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-581',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 31", "en": "Yüksel Caddesi · Block Cluster 31"}'::jsonb,
  'Yüksel Caddesi',
  24247,
  ST_GeomFromText('POLYGON((32.863327 39.9028, 32.865153 39.9028, 32.865153 39.9042, 32.863327 39.9042, 32.863327 39.9028))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9035)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c5bcadb8-b519-433e-a0a5-9e867ad5e0f6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-247',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.84325 39.9042, 32.845075 39.9042, 32.845075 39.9056, 32.84325 39.9056, 32.84325 39.9042))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9049)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ebbc80e0-743c-4454-af80-34b45ff93534',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-284',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 63", "en": "Turan Güneş Bulvarı · Block Cluster 63"}'::jsonb,
  'Turan Güneş Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.845075 39.9042, 32.8469 39.9042, 32.8469 39.9056, 32.845075 39.9056, 32.845075 39.9042))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9049)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '056186de-2102-46d5-a463-c00b2663cdb3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-321',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 70", "en": "Kuğulu Park Yolu · Block Cluster 70"}'::jsonb,
  'Kuğulu Park Yolu',
  24247,
  ST_GeomFromText('POLYGON((32.8469 39.9042, 32.848726 39.9042, 32.848726 39.9056, 32.8469 39.9056, 32.8469 39.9042))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9049)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3b81f993-f006-4fb2-ab87-26212b88d945',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-358',
  '{"tr": "İnönü Bulvarı · Ada Kümesi 77", "en": "İnönü Bulvarı · Block Cluster 77"}'::jsonb,
  'İnönü Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.848726 39.9042, 32.850551 39.9042, 32.850551 39.9056, 32.848726 39.9056, 32.848726 39.9042))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9049)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '95845b74-8c9f-4d2c-a91b-6658222398a0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-395',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 84", "en": "Kuğulu Park Yolu · Block Cluster 84"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.850551 39.9042, 32.852376 39.9042, 32.852376 39.9056, 32.850551 39.9056, 32.850551 39.9042))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9049)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5578f409-e240-4ff6-a738-0bff37b9f3ff',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-432',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 2", "en": "Tunalı Hilmi Caddesi · Block Cluster 2"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.852376 39.9042, 32.854201 39.9042, 32.854201 39.9056, 32.852376 39.9056, 32.852376 39.9042))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9049)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '64a6b0be-be2d-4882-aa8b-383c22d43940',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-469',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 9", "en": "Yüksel Caddesi · Block Cluster 9"}'::jsonb,
  'Yüksel Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.854201 39.9042, 32.856026 39.9042, 32.856026 39.9056, 32.854201 39.9056, 32.854201 39.9042))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9049)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '89af9a03-6390-404b-aa3f-0a48ed402a4e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-506',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 16", "en": "Atatürk Bulvarı · Block Cluster 16"}'::jsonb,
  'Atatürk Bulvarı',
  24247,
  ST_GeomFromText('POLYGON((32.856026 39.9042, 32.857852 39.9042, 32.857852 39.9056, 32.856026 39.9056, 32.856026 39.9042))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9049)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c7ad31fa-a6ab-416c-a106-90966e58d366',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-543',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 23", "en": "Yüksel Caddesi · Block Cluster 23"}'::jsonb,
  'Yüksel Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.857852 39.9042, 32.859677 39.9042, 32.859677 39.9056, 32.857852 39.9056, 32.857852 39.9042))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9049)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '138e723d-c887-498e-ab09-7bb3dc157bcb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-580',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 30", "en": "Turan Güneş Bulvarı · Block Cluster 30"}'::jsonb,
  'Turan Güneş Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.859677 39.9042, 32.861502 39.9042, 32.861502 39.9056, 32.859677 39.9056, 32.859677 39.9042))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9049)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd5e92bca-f15c-4789-a4b5-3c43c7454353',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-617',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 37", "en": "Kuğulu Park Yolu · Block Cluster 37"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.861502 39.9042, 32.863327 39.9042, 32.863327 39.9056, 32.861502 39.9056, 32.861502 39.9042))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9049)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1f5f8b04-b1dd-465b-ae82-dd5fd13ce15f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-654',
  '{"tr": "İnönü Bulvarı · Ada Kümesi 44", "en": "İnönü Bulvarı · Block Cluster 44"}'::jsonb,
  'İnönü Bulvarı',
  24247,
  ST_GeomFromText('POLYGON((32.863327 39.9042, 32.865153 39.9042, 32.865153 39.9056, 32.863327 39.9056, 32.863327 39.9042))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9049)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eb6cb1f6-0dc8-4eb6-a6a4-6f40f93590ac',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-320',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.84325 39.9056, 32.845075 39.9056, 32.845075 39.907, 32.84325 39.907, 32.84325 39.9056))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9063)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '81be097b-2016-4df4-a1a8-548fa1d4676f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-357',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 76", "en": "Kuğulu Park Yolu · Block Cluster 76"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.845075 39.9056, 32.8469 39.9056, 32.8469 39.907, 32.845075 39.907, 32.845075 39.9056))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ed8c7980-7864-4265-a5e8-dbe565f11be5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-394',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 83", "en": "Ziya Gökalp Caddesi · Block Cluster 83"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24246,
  ST_GeomFromText('POLYGON((32.8469 39.9056, 32.848726 39.9056, 32.848726 39.907, 32.8469 39.907, 32.8469 39.9056))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9063)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c349cc29-2319-4556-a050-f97fe663017f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-431',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 1", "en": "Kuğulu Park Yolu · Block Cluster 1"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.848726 39.9056, 32.850551 39.9056, 32.850551 39.907, 32.848726 39.907, 32.848726 39.9056))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f78cd373-8631-436e-a1bd-001d7dbea6e1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-468',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 8", "en": "Tunalı Hilmi Caddesi · Block Cluster 8"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.850551 39.9056, 32.852376 39.9056, 32.852376 39.907, 32.850551 39.907, 32.850551 39.9056))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9063)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ad9e47b1-99f7-4eff-a469-a94e479636b0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-505',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 15", "en": "Kuğulu Park Yolu · Block Cluster 15"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.852376 39.9056, 32.854201 39.9056, 32.854201 39.907, 32.852376 39.907, 32.852376 39.9056))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c2fb0b4a-624d-4d03-a0b6-36492548484d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-542',
  '{"tr": "İnönü Bulvarı · Ada Kümesi 22", "en": "İnönü Bulvarı · Block Cluster 22"}'::jsonb,
  'İnönü Bulvarı',
  24233,
  ST_GeomFromText('POLYGON((32.854201 39.9056, 32.856026 39.9056, 32.856026 39.907, 32.854201 39.907, 32.854201 39.9056))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9063)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9f1249cf-5379-4ac2-ac6b-630df28b7491',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-579',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 29", "en": "Kuğulu Park Yolu · Block Cluster 29"}'::jsonb,
  'Kuğulu Park Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.856026 39.9056, 32.857852 39.9056, 32.857852 39.907, 32.856026 39.907, 32.856026 39.9056))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4814bd3f-6f8c-4869-a798-d556b7a125a8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-616',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 36", "en": "Tunalı Hilmi Caddesi · Block Cluster 36"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.857852 39.9056, 32.859677 39.9056, 32.859677 39.907, 32.857852 39.907, 32.857852 39.9056))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9063)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a7711441-d9aa-42d3-aedb-c692811be714',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-653',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 43", "en": "Kuğulu Park Yolu · Block Cluster 43"}'::jsonb,
  'Kuğulu Park Yolu',
  24233,
  ST_GeomFromText('POLYGON((32.859677 39.9056, 32.861502 39.9056, 32.861502 39.907, 32.859677 39.907, 32.859677 39.9056))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7b8c154b-2fbf-4c74-a433-693fab4b91bf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-690',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 50", "en": "Ziya Gökalp Caddesi · Block Cluster 50"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24233,
  ST_GeomFromText('POLYGON((32.861502 39.9056, 32.863327 39.9056, 32.863327 39.907, 32.861502 39.907, 32.861502 39.9056))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9063)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '320ec28a-5e9f-4d7c-ac91-eff690adf006',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-727',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 57", "en": "Kuğulu Park Yolu · Block Cluster 57"}'::jsonb,
  'Kuğulu Park Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.863327 39.9056, 32.865153 39.9056, 32.865153 39.907, 32.863327 39.907, 32.863327 39.9056))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9063)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cac5723d-5216-46f7-a8d3-54ca1cdb9934',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-393',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.84325 39.907, 32.845075 39.907, 32.845075 39.9084, 32.84325 39.9084, 32.84325 39.907))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9077)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3e64f90a-305f-4f81-ae3b-568b6ec4a88b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-430',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 89", "en": "Atatürk Bulvarı · Block Cluster 89"}'::jsonb,
  'Atatürk Bulvarı',
  24232,
  ST_GeomFromText('POLYGON((32.845075 39.907, 32.8469 39.907, 32.8469 39.9084, 32.845075 39.9084, 32.845075 39.907))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9077)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '838bed28-80cb-470e-a340-ba2604574436',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-467',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 7", "en": "Yüksel Caddesi · Block Cluster 7"}'::jsonb,
  'Yüksel Caddesi',
  24246,
  ST_GeomFromText('POLYGON((32.8469 39.907, 32.848726 39.907, 32.848726 39.9084, 32.8469 39.9084, 32.8469 39.907))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9077)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '191266df-f898-4169-a18a-c7b611ab0848',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-504',
  '{"tr": "Karanfil Sokak · Ada Kümesi 14", "en": "Karanfil Sokak · Block Cluster 14"}'::jsonb,
  'Karanfil Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.848726 39.907, 32.850551 39.907, 32.850551 39.9084, 32.848726 39.9084, 32.848726 39.907))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9077)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0004aee9-dd21-48ef-ad25-a606dd25b7d8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-541',
  '{"tr": "Büklüm Sokak · Ada Kümesi 21", "en": "Büklüm Sokak · Block Cluster 21"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.850551 39.907, 32.852376 39.907, 32.852376 39.9084, 32.850551 39.9084, 32.850551 39.907))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9077)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c20854d9-edda-4742-afd2-639bafe28c1b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-578',
  '{"tr": "İnönü Bulvarı · Ada Kümesi 28", "en": "İnönü Bulvarı · Block Cluster 28"}'::jsonb,
  'İnönü Bulvarı',
  24232,
  ST_GeomFromText('POLYGON((32.852376 39.907, 32.854201 39.907, 32.854201 39.9084, 32.852376 39.9084, 32.852376 39.907))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9077)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '68164ca3-4ca9-4907-a4bf-75a4b4bf85aa',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-615',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 35", "en": "Kuğulu Park Yolu · Block Cluster 35"}'::jsonb,
  'Kuğulu Park Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.854201 39.907, 32.856026 39.907, 32.856026 39.9084, 32.854201 39.9084, 32.854201 39.907))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9077)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5b430f77-92c7-4245-a984-bd32ee0ac1bc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-652',
  '{"tr": "Karanfil Sokak · Ada Kümesi 42", "en": "Karanfil Sokak · Block Cluster 42"}'::jsonb,
  'Karanfil Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.856026 39.907, 32.857852 39.907, 32.857852 39.9084, 32.856026 39.9084, 32.856026 39.907))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9077)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '07b1c427-1dcd-4ccc-aa7c-e8eb257ef0f3',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-689',
  '{"tr": "Büklüm Sokak · Ada Kümesi 49", "en": "Büklüm Sokak · Block Cluster 49"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.857852 39.907, 32.859677 39.907, 32.859677 39.9084, 32.857852 39.9084, 32.857852 39.907))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9077)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd19dac12-8e65-4d1a-aff8-41086003992c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-726',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 56", "en": "Atatürk Bulvarı · Block Cluster 56"}'::jsonb,
  'Atatürk Bulvarı',
  24232,
  ST_GeomFromText('POLYGON((32.859677 39.907, 32.861502 39.907, 32.861502 39.9084, 32.859677 39.9084, 32.859677 39.907))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9077)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dd4c5c5b-1c69-4f4e-a125-8315f9b63ba9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-763',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 63", "en": "Yüksel Caddesi · Block Cluster 63"}'::jsonb,
  'Yüksel Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.861502 39.907, 32.863327 39.907, 32.863327 39.9084, 32.861502 39.9084, 32.861502 39.907))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9077)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f692f479-b6d2-4f0b-a040-3b72ad65c384',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-800',
  '{"tr": "Karanfil Sokak · Ada Kümesi 70", "en": "Karanfil Sokak · Block Cluster 70"}'::jsonb,
  'Karanfil Sokak',
  24246,
  ST_GeomFromText('POLYGON((32.863327 39.907, 32.865153 39.907, 32.865153 39.9084, 32.863327 39.9084, 32.863327 39.907))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9077)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c111990c-b549-46cd-a458-cfc1765aefd9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-466',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.84325 39.9084, 32.845075 39.9084, 32.845075 39.9098, 32.84325 39.9098, 32.84325 39.9084))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9091)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2aeba05a-820b-4591-a8e0-c5cbacf705eb',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-503',
  '{"tr": "Büklüm Sokak · Ada Kümesi 13", "en": "Büklüm Sokak · Block Cluster 13"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.845075 39.9084, 32.8469 39.9084, 32.8469 39.9098, 32.845075 39.9098, 32.845075 39.9084))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '85a28aab-0a31-47d9-af93-0d728fd41284',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-540',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 20", "en": "Turan Güneş Bulvarı · Block Cluster 20"}'::jsonb,
  'Turan Güneş Bulvarı',
  24246,
  ST_GeomFromText('POLYGON((32.8469 39.9084, 32.848726 39.9084, 32.848726 39.9098, 32.8469 39.9098, 32.8469 39.9084))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9091)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b244091a-420a-4241-a04e-bb5bf44ebb5b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-577',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 27", "en": "Kuğulu Park Yolu · Block Cluster 27"}'::jsonb,
  'Kuğulu Park Yolu',
  24232,
  ST_GeomFromText('POLYGON((32.848726 39.9084, 32.850551 39.9084, 32.850551 39.9098, 32.848726 39.9098, 32.848726 39.9084))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0b20115e-54df-480c-afff-59525fff596a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-614',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 34", "en": "Ziya Gökalp Caddesi · Block Cluster 34"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.850551 39.9084, 32.852376 39.9084, 32.852376 39.9098, 32.850551 39.9098, 32.850551 39.9084))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9091)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '409e5429-3e43-4bc8-aedd-cfe17ee1eff1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-651',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 41", "en": "Yüksel Caddesi · Block Cluster 41"}'::jsonb,
  'Yüksel Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.852376 39.9084, 32.854201 39.9084, 32.854201 39.9098, 32.852376 39.9098, 32.852376 39.9084))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6541f4d8-2175-4158-a434-058086b7e630',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-688',
  '{"tr": "Karanfil Sokak · Ada Kümesi 48", "en": "Karanfil Sokak · Block Cluster 48"}'::jsonb,
  'Karanfil Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.854201 39.9084, 32.856026 39.9084, 32.856026 39.9098, 32.854201 39.9098, 32.854201 39.9084))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9091)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '07df085d-1969-4132-aeb6-096f2148098f',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-725',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 55", "en": "Kuğulu Park Yolu · Block Cluster 55"}'::jsonb,
  'Kuğulu Park Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.856026 39.9084, 32.857852 39.9084, 32.857852 39.9098, 32.856026 39.9098, 32.856026 39.9084))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9ac93e1c-4fb0-4857-a579-964bea79e673',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-762',
  '{"tr": "İnönü Bulvarı · Ada Kümesi 62", "en": "İnönü Bulvarı · Block Cluster 62"}'::jsonb,
  'İnönü Bulvarı',
  24232,
  ST_GeomFromText('POLYGON((32.857852 39.9084, 32.859677 39.9084, 32.859677 39.9098, 32.857852 39.9098, 32.857852 39.9084))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9091)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '87e52884-4d5b-4c78-aabe-c4fcd54114fc',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-799',
  '{"tr": "Büklüm Sokak · Ada Kümesi 69", "en": "Büklüm Sokak · Block Cluster 69"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.859677 39.9084, 32.861502 39.9084, 32.861502 39.9098, 32.859677 39.9098, 32.859677 39.9084))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4a72146c-34c5-4b35-aeb7-8f597f37afa1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-836',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 76", "en": "Turan Güneş Bulvarı · Block Cluster 76"}'::jsonb,
  'Turan Güneş Bulvarı',
  24232,
  ST_GeomFromText('POLYGON((32.861502 39.9084, 32.863327 39.9084, 32.863327 39.9098, 32.861502 39.9098, 32.861502 39.9084))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9091)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '25b607ed-4753-456e-a2e5-f2836d09fd5b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-873',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 83", "en": "Kuğulu Park Yolu · Block Cluster 83"}'::jsonb,
  'Kuğulu Park Yolu',
  24246,
  ST_GeomFromText('POLYGON((32.863327 39.9084, 32.865153 39.9084, 32.865153 39.9098, 32.863327 39.9098, 32.863327 39.9084))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9091)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fe0a46a7-a98f-4cb4-a785-5a13a799635b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-539',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.84325 39.9098, 32.845075 39.9098, 32.845075 39.9112, 32.84325 39.9112, 32.84325 39.9098))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9105)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '17a37302-8918-40a3-aebb-d3a1a0bc13a5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-576',
  '{"tr": "Karanfil Sokak · Ada Kümesi 26", "en": "Karanfil Sokak · Block Cluster 26"}'::jsonb,
  'Karanfil Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.845075 39.9098, 32.8469 39.9098, 32.8469 39.9112, 32.845075 39.9112, 32.845075 39.9098))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9105)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '89d50489-6c20-4995-a5f5-3d1cf5f53e1e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-613',
  '{"tr": "Büklüm Sokak · Ada Kümesi 33", "en": "Büklüm Sokak · Block Cluster 33"}'::jsonb,
  'Büklüm Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.8469 39.9098, 32.848726 39.9098, 32.848726 39.9112, 32.8469 39.9112, 32.8469 39.9098))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9105)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '68622d4b-b703-4bff-af61-b6b41f65c94a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-650',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 40", "en": "Ziya Gökalp Caddesi · Block Cluster 40"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24232,
  ST_GeomFromText('POLYGON((32.848726 39.9098, 32.850551 39.9098, 32.850551 39.9112, 32.848726 39.9112, 32.848726 39.9098))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9105)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd72ad8b3-ab30-424a-ac1a-9af9825b1afd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-687',
  '{"tr": "Büklüm Sokak · Ada Kümesi 47", "en": "Büklüm Sokak · Block Cluster 47"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.850551 39.9098, 32.852376 39.9098, 32.852376 39.9112, 32.850551 39.9112, 32.850551 39.9098))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9105)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4608e068-7cfe-49f1-aaf6-0999c307ca59',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-724',
  '{"tr": "Karanfil Sokak · Ada Kümesi 54", "en": "Karanfil Sokak · Block Cluster 54"}'::jsonb,
  'Karanfil Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.852376 39.9098, 32.854201 39.9098, 32.854201 39.9112, 32.852376 39.9112, 32.852376 39.9098))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9105)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '88952368-e8eb-44ff-a07e-579771809867',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-761',
  '{"tr": "Büklüm Sokak · Ada Kümesi 61", "en": "Büklüm Sokak · Block Cluster 61"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.854201 39.9098, 32.856026 39.9098, 32.856026 39.9112, 32.854201 39.9112, 32.854201 39.9098))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9105)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd115f021-668f-4ace-a79a-8aef37a56aef',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-798',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 68", "en": "Ziya Gökalp Caddesi · Block Cluster 68"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.856026 39.9098, 32.857852 39.9098, 32.857852 39.9112, 32.856026 39.9112, 32.856026 39.9098))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9105)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '05d6c8e6-3da5-4c81-a873-f467437c0567',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-835',
  '{"tr": "Büklüm Sokak · Ada Kümesi 75", "en": "Büklüm Sokak · Block Cluster 75"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.857852 39.9098, 32.859677 39.9098, 32.859677 39.9112, 32.857852 39.9112, 32.857852 39.9098))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9105)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9ec9cd23-ae80-46e7-a049-ebc44d49f40a',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-872',
  '{"tr": "Karanfil Sokak · Ada Kümesi 82", "en": "Karanfil Sokak · Block Cluster 82"}'::jsonb,
  'Karanfil Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.859677 39.9098, 32.861502 39.9098, 32.861502 39.9112, 32.859677 39.9112, 32.859677 39.9098))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9105)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4f6eaf9d-edd5-477f-a2bb-28e23d44371c',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-909',
  '{"tr": "Büklüm Sokak · Ada Kümesi 89", "en": "Büklüm Sokak · Block Cluster 89"}'::jsonb,
  'Büklüm Sokak',
  24232,
  ST_GeomFromText('POLYGON((32.861502 39.9098, 32.863327 39.9098, 32.863327 39.9112, 32.861502 39.9112, 32.861502 39.9098))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9105)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4adff835-392d-4398-a3f2-cbad840d2bcd',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-946',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 7", "en": "Ziya Gökalp Caddesi · Block Cluster 7"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.863327 39.9098, 32.865153 39.9098, 32.865153 39.9112, 32.863327 39.9112, 32.863327 39.9098))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9105)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5cf15895-263e-4d23-aacf-e5b6833015b8',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-612',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.84325 39.9112, 32.845075 39.9112, 32.845075 39.9126, 32.84325 39.9126, 32.84325 39.9112))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9119)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e45e3a5f-28d5-4314-ac8b-b94b0d33bd73',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-649',
  '{"tr": "Büklüm Sokak · Ada Kümesi 39", "en": "Büklüm Sokak · Block Cluster 39"}'::jsonb,
  'Büklüm Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.845075 39.9112, 32.8469 39.9112, 32.8469 39.9126, 32.845075 39.9126, 32.845075 39.9112))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8f688979-2908-470f-a660-be76b870c088',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-686',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 46", "en": "Atatürk Bulvarı · Block Cluster 46"}'::jsonb,
  'Atatürk Bulvarı',
  24244,
  ST_GeomFromText('POLYGON((32.8469 39.9112, 32.848726 39.9112, 32.848726 39.9126, 32.8469 39.9126, 32.8469 39.9112))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9119)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a2e35a84-098e-446b-ab6d-9eefac721eef',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-723',
  '{"tr": "Büklüm Sokak · Ada Kümesi 53", "en": "Büklüm Sokak · Block Cluster 53"}'::jsonb,
  'Büklüm Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.848726 39.9112, 32.850551 39.9112, 32.850551 39.9126, 32.848726 39.9126, 32.848726 39.9112))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c818887-8c23-4925-a0a2-31a2f8a541ac',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-760',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 60", "en": "Turan Güneş Bulvarı · Block Cluster 60"}'::jsonb,
  'Turan Güneş Bulvarı',
  24230,
  ST_GeomFromText('POLYGON((32.850551 39.9112, 32.852376 39.9112, 32.852376 39.9126, 32.850551 39.9126, 32.850551 39.9112))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9119)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '366d9041-ea4f-4a6e-ac22-2a2f20bd4aaf',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-797',
  '{"tr": "Büklüm Sokak · Ada Kümesi 67", "en": "Büklüm Sokak · Block Cluster 67"}'::jsonb,
  'Büklüm Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.852376 39.9112, 32.854201 39.9112, 32.854201 39.9126, 32.852376 39.9126, 32.852376 39.9112))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '01c83de3-1af0-4b9e-ab38-667d1cb89981',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-834',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 74", "en": "Atatürk Bulvarı · Block Cluster 74"}'::jsonb,
  'Atatürk Bulvarı',
  24230,
  ST_GeomFromText('POLYGON((32.854201 39.9112, 32.856026 39.9112, 32.856026 39.9126, 32.854201 39.9126, 32.854201 39.9112))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9119)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e7ff3562-4562-4803-a29d-0d612d616d65',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-871',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 81", "en": "Yüksel Caddesi · Block Cluster 81"}'::jsonb,
  'Yüksel Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.856026 39.9112, 32.857852 39.9112, 32.857852 39.9126, 32.856026 39.9126, 32.856026 39.9112))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b354e647-7f27-4b89-ac73-9dce327c61d0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-908',
  '{"tr": "Karanfil Sokak · Ada Kümesi 88", "en": "Karanfil Sokak · Block Cluster 88"}'::jsonb,
  'Karanfil Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.857852 39.9112, 32.859677 39.9112, 32.859677 39.9126, 32.857852 39.9126, 32.857852 39.9112))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9119)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'af11bfbe-0c5b-49d6-a34a-6668bb6d9994',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-945',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 6", "en": "Yüksel Caddesi · Block Cluster 6"}'::jsonb,
  'Yüksel Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.859677 39.9112, 32.861502 39.9112, 32.861502 39.9126, 32.859677 39.9126, 32.859677 39.9112))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6d5dfc8b-f697-4a9e-abca-c61563f53729',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-982',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 13", "en": "Atatürk Bulvarı · Block Cluster 13"}'::jsonb,
  'Atatürk Bulvarı',
  24230,
  ST_GeomFromText('POLYGON((32.861502 39.9112, 32.863327 39.9112, 32.863327 39.9126, 32.861502 39.9126, 32.861502 39.9112))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9119)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ded8341b-98a3-46b6-a67b-e2ad777c0ad1',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-020',
  '{"tr": "Büklüm Sokak · Ada Kümesi 20", "en": "Büklüm Sokak · Block Cluster 20"}'::jsonb,
  'Büklüm Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.863327 39.9112, 32.865153 39.9112, 32.865153 39.9126, 32.863327 39.9126, 32.863327 39.9112))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9119)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8d6cebdf-fb85-4c4f-a6e9-379088f2c82e',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-MRK-685',
  '{"tr": "Çankaya Şehir Caddeleri", "en": "Cankaya City Streets"}'::jsonb,
  'Çankaya Çankaya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.84325 39.9126, 32.845075 39.9126, 32.845075 39.914, 32.84325 39.914, 32.84325 39.9126))', 4326),
  ST_GeomFromText('POINT(32.844162 39.9133)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1b7dcd18-fbf9-4cf5-a084-81ed17771a0d',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-722',
  '{"tr": "Atatürk Bulvarı · Ada Kümesi 52", "en": "Atatürk Bulvarı · Block Cluster 52"}'::jsonb,
  'Atatürk Bulvarı',
  24230,
  ST_GeomFromText('POLYGON((32.845075 39.9126, 32.8469 39.9126, 32.8469 39.914, 32.845075 39.914, 32.845075 39.9126))', 4326),
  ST_GeomFromText('POINT(32.845988 39.9133)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dc94890e-e71d-44a8-ab89-cda6c3b1cdb6',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-759',
  '{"tr": "Büklüm Sokak · Ada Kümesi 59", "en": "Büklüm Sokak · Block Cluster 59"}'::jsonb,
  'Büklüm Sokak',
  24244,
  ST_GeomFromText('POLYGON((32.8469 39.9126, 32.848726 39.9126, 32.848726 39.914, 32.8469 39.914, 32.8469 39.9126))', 4326),
  ST_GeomFromText('POINT(32.847813 39.9133)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '039986e6-4eae-47cf-ad37-b1295247beb5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-796',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 66", "en": "Tunalı Hilmi Caddesi · Block Cluster 66"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.848726 39.9126, 32.850551 39.9126, 32.850551 39.914, 32.848726 39.914, 32.848726 39.9126))', 4326),
  ST_GeomFromText('POINT(32.849638 39.9133)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0b550439-6c6e-4230-a73b-260977c32669',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-833',
  '{"tr": "Yüksel Caddesi · Ada Kümesi 73", "en": "Yüksel Caddesi · Block Cluster 73"}'::jsonb,
  'Yüksel Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.850551 39.9126, 32.852376 39.9126, 32.852376 39.914, 32.850551 39.914, 32.850551 39.9126))', 4326),
  ST_GeomFromText('POINT(32.851464 39.9133)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8f900fdb-11de-4cda-ae4e-7301a16e8cb5',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-870',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 80", "en": "Ziya Gökalp Caddesi · Block Cluster 80"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.852376 39.9126, 32.854201 39.9126, 32.854201 39.914, 32.852376 39.914, 32.852376 39.9126))', 4326),
  ST_GeomFromText('POINT(32.853289 39.9133)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '68e9bcb6-6349-45ba-aba0-690ccc339270',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-907',
  '{"tr": "Büklüm Sokak · Ada Kümesi 87", "en": "Büklüm Sokak · Block Cluster 87"}'::jsonb,
  'Büklüm Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.854201 39.9126, 32.856026 39.9126, 32.856026 39.914, 32.854201 39.914, 32.854201 39.9126))', 4326),
  ST_GeomFromText('POINT(32.855114 39.9133)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6b62da9e-1f32-420b-a450-e8958a950ca9',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-944',
  '{"tr": "Turan Güneş Bulvarı · Ada Kümesi 5", "en": "Turan Güneş Bulvarı · Block Cluster 5"}'::jsonb,
  'Turan Güneş Bulvarı',
  24244,
  ST_GeomFromText('POLYGON((32.856026 39.9126, 32.857852 39.9126, 32.857852 39.914, 32.856026 39.914, 32.856026 39.9126))', 4326),
  ST_GeomFromText('POINT(32.856939 39.9133)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '74a587c9-4255-4b07-a6f0-0cceb6fb12d0',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-981',
  '{"tr": "Kuğulu Park Yolu · Ada Kümesi 12", "en": "Kuğulu Park Yolu · Block Cluster 12"}'::jsonb,
  'Kuğulu Park Yolu',
  24230,
  ST_GeomFromText('POLYGON((32.857852 39.9126, 32.859677 39.9126, 32.859677 39.914, 32.857852 39.914, 32.857852 39.9126))', 4326),
  ST_GeomFromText('POINT(32.858765 39.9133)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '659179f3-3180-4843-a411-b1b097124236',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-019',
  '{"tr": "Ziya Gökalp Caddesi · Ada Kümesi 19", "en": "Ziya Gökalp Caddesi · Block Cluster 19"}'::jsonb,
  'Ziya Gökalp Caddesi',
  24230,
  ST_GeomFromText('POLYGON((32.859677 39.9126, 32.861502 39.9126, 32.861502 39.914, 32.859677 39.914, 32.859677 39.9126))', 4326),
  ST_GeomFromText('POINT(32.86059 39.9133)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1215015e-6a98-413b-a88d-80657cad8299',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-056',
  '{"tr": "Büklüm Sokak · Ada Kümesi 26", "en": "Büklüm Sokak · Block Cluster 26"}'::jsonb,
  'Büklüm Sokak',
  24230,
  ST_GeomFromText('POLYGON((32.861502 39.9126, 32.863327 39.9126, 32.863327 39.914, 32.861502 39.914, 32.861502 39.9126))', 4326),
  ST_GeomFromText('POINT(32.862415 39.9133)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '67131bf1-b772-4e3a-a061-e5cb1e861a2b',
  'a0000000-0000-0000-0000-000000000003',
  'TR-CNK-TUN-093',
  '{"tr": "Tunalı Hilmi Caddesi · Ada Kümesi 33", "en": "Tunalı Hilmi Caddesi · Block Cluster 33"}'::jsonb,
  'Tunalı Hilmi Caddesi',
  24244,
  ST_GeomFromText('POLYGON((32.863327 39.9126, 32.865153 39.9126, 32.865153 39.914, 32.863327 39.914, 32.863327 39.9126))', 4326),
  ST_GeomFromText('POINT(32.86424 39.9133)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0795a7f5-b3f8-49d3-a46d-0e26bb8e51c8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-757',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24249,
  ST_GeomFromText('POLYGON((-73.996841 40.7442, -73.994992 40.7442, -73.994992 40.7456, -73.996841 40.7456, -73.996841 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7a1aadaa-4025-4e3d-aa3f-5397ba40abe7',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-794',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.994992 40.7442, -73.993144 40.7442, -73.993144 40.7456, -73.994992 40.7456, -73.994992 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7449)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e3b1040f-6607-4f5e-a5b6-cb5149b8d36d',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-831',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.993144 40.7442, -73.991296 40.7442, -73.991296 40.7456, -73.993144 40.7456, -73.993144 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7449)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e2eb2c5d-2cd1-406d-ae3a-4c300fbc8cca',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-868',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.991296 40.7442, -73.989448 40.7442, -73.989448 40.7456, -73.991296 40.7456, -73.991296 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8e925d89-8aa2-4807-a430-e58e19351590',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-905',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.989448 40.7442, -73.9876 40.7442, -73.9876 40.7456, -73.989448 40.7456, -73.989448 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7449)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f38c55d5-329a-44c9-a116-311c2626ba9e',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-942',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.9876 40.7442, -73.985752 40.7442, -73.985752 40.7456, -73.9876 40.7456, -73.9876 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e08c5e20-8962-48d1-a9ee-36f169eec6f1',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-979',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24249,
  ST_GeomFromText('POLYGON((-73.985752 40.7442, -73.983903 40.7442, -73.983903 40.7456, -73.985752 40.7456, -73.985752 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cf33e60b-a0c8-4276-affb-c47d6ffc0881',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-017',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.983903 40.7442, -73.982055 40.7442, -73.982055 40.7456, -73.983903 40.7456, -73.983903 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a738af84-ccf6-4139-abce-2ebd742f30bd',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-054',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.982055 40.7442, -73.980207 40.7442, -73.980207 40.7456, -73.982055 40.7456, -73.982055 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a4803a5b-0d98-41d4-a918-4b8fb218ac2f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-091',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.980207 40.7442, -73.978359 40.7442, -73.978359 40.7456, -73.980207 40.7456, -73.980207 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6c2a27ce-543f-48eb-a815-3f25c06940b9',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-128',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.978359 40.7442, -73.976511 40.7442, -73.976511 40.7456, -73.978359 40.7456, -73.978359 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6b7da1e8-ae4e-43a0-a533-424819cc8588',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-165',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-73.976511 40.7442, -73.974663 40.7442, -73.974663 40.7456, -73.976511 40.7456, -73.976511 40.7442))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7449)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0b434aea-bd24-417b-a667-cb91c867cc65',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-830',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((-73.996841 40.7456, -73.994992 40.7456, -73.994992 40.747, -73.996841 40.747, -73.996841 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7463)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e6175610-0018-41cf-a60f-27dfe62fc7df',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-867',
  '{"tr": "West 43rd Street · Ada Kümesi 16", "en": "West 43rd Street · Block Cluster 16"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.994992 40.7456, -73.993144 40.7456, -73.993144 40.747, -73.994992 40.747, -73.994992 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '45656bc5-52fe-4b84-a79b-30419863c749',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-904',
  '{"tr": "5th Avenue · Ada Kümesi 23", "en": "5th Avenue · Block Cluster 23"}'::jsonb,
  '5th Avenue',
  24235,
  ST_GeomFromText('POLYGON((-73.993144 40.7456, -73.991296 40.7456, -73.991296 40.747, -73.993144 40.747, -73.993144 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7463)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9d19bd2a-346c-4cfc-a975-11d6d1866a26',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-941',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 30", "en": "West 46th Street (Restaurant Row) · Block Cluster 30"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24235,
  ST_GeomFromText('POLYGON((-73.991296 40.7456, -73.989448 40.7456, -73.989448 40.747, -73.991296 40.747, -73.991296 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '10a5fc44-ebae-4674-ab0b-2a30fc54d2b8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-978',
  '{"tr": "West 43rd Street · Ada Kümesi 37", "en": "West 43rd Street · Block Cluster 37"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.989448 40.7456, -73.9876 40.7456, -73.9876 40.747, -73.989448 40.747, -73.989448 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'be654a7d-8d3e-4563-a35b-9f1e4ba41fe0',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-016',
  '{"tr": "West 43rd Street · Ada Kümesi 44", "en": "West 43rd Street · Block Cluster 44"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.9876 40.7456, -73.985752 40.7456, -73.985752 40.747, -73.9876 40.747, -73.9876 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c257a30b-55b0-4e75-a7e7-2d7e18083180',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-053',
  '{"tr": "5th Avenue · Ada Kümesi 51", "en": "5th Avenue · Block Cluster 51"}'::jsonb,
  '5th Avenue',
  24247,
  ST_GeomFromText('POLYGON((-73.985752 40.7456, -73.983903 40.7456, -73.983903 40.747, -73.985752 40.747, -73.985752 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7463)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0fbebc7c-31e8-413c-ae56-cd4041a72db8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-090',
  '{"tr": "West 43rd Street · Ada Kümesi 58", "en": "West 43rd Street · Block Cluster 58"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.983903 40.7456, -73.982055 40.7456, -73.982055 40.747, -73.983903 40.747, -73.983903 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '27fe6ee0-e3ff-44ac-a401-5a4c0bfda38c',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-127',
  '{"tr": "West 44th Street · Ada Kümesi 65", "en": "West 44th Street · Block Cluster 65"}'::jsonb,
  'West 44th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.982055 40.7456, -73.980207 40.7456, -73.980207 40.747, -73.982055 40.747, -73.982055 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '074007ed-1230-4306-a570-34eb19703af3',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-164',
  '{"tr": "West 43rd Street · Ada Kümesi 72", "en": "West 43rd Street · Block Cluster 72"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.980207 40.7456, -73.978359 40.7456, -73.978359 40.747, -73.980207 40.747, -73.980207 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ee8844ee-d7e4-4dbb-a96c-d955c66ce2a9',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-201',
  '{"tr": "5th Avenue · Ada Kümesi 79", "en": "5th Avenue · Block Cluster 79"}'::jsonb,
  '5th Avenue',
  24235,
  ST_GeomFromText('POLYGON((-73.978359 40.7456, -73.976511 40.7456, -73.976511 40.747, -73.978359 40.747, -73.978359 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7463)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3d0a8b1e-e4fa-4021-a9f0-cb3f2204cb3f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-238',
  '{"tr": "West 43rd Street · Ada Kümesi 86", "en": "West 43rd Street · Block Cluster 86"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.976511 40.7456, -73.974663 40.7456, -73.974663 40.747, -73.976511 40.747, -73.976511 40.7456))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7463)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a8408f0b-c31f-4f81-ab5f-c08a6b5fde8c',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-903',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((-73.996841 40.747, -73.994992 40.747, -73.994992 40.7484, -73.996841 40.7484, -73.996841 40.747))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7477)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4ea24bdf-726c-40ef-acce-bb30c10f3cce',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-940',
  '{"tr": "Broadway · Ada Kümesi 29", "en": "Broadway · Block Cluster 29"}'::jsonb,
  'Broadway',
  24235,
  ST_GeomFromText('POLYGON((-73.994992 40.747, -73.993144 40.747, -73.993144 40.7484, -73.994992 40.7484, -73.994992 40.747))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7477)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2f71f46a-2026-4bc2-af57-3fa84f98c02c',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-977',
  '{"tr": "West 45th Street · Ada Kümesi 36", "en": "West 45th Street · Block Cluster 36"}'::jsonb,
  'West 45th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.993144 40.747, -73.991296 40.747, -73.991296 40.7484, -73.993144 40.7484, -73.993144 40.747))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '73521262-b2a3-499a-a1f1-6bf825f58bfc',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-015',
  '{"tr": "West 44th Street · Ada Kümesi 43", "en": "West 44th Street · Block Cluster 43"}'::jsonb,
  'West 44th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.991296 40.747, -73.989448 40.747, -73.989448 40.7484, -73.991296 40.7484, -73.991296 40.747))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '35c3e205-a9dd-4113-ac1e-0316dfa1c318',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-052',
  '{"tr": "West 43rd Street · Ada Kümesi 50", "en": "West 43rd Street · Block Cluster 50"}'::jsonb,
  'West 43rd Street',
  24235,
  ST_GeomFromText('POLYGON((-73.989448 40.747, -73.9876 40.747, -73.9876 40.7484, -73.989448 40.7484, -73.989448 40.747))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '963b89c3-9f4e-4230-a975-3bf3358a3bf3',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-089',
  '{"tr": "Broadway · Ada Kümesi 57", "en": "Broadway · Block Cluster 57"}'::jsonb,
  'Broadway',
  24235,
  ST_GeomFromText('POLYGON((-73.9876 40.747, -73.985752 40.747, -73.985752 40.7484, -73.9876 40.7484, -73.9876 40.747))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7477)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f6174bec-3a73-487b-ac64-1397308aa467',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-126',
  '{"tr": "West 48th Street · Ada Kümesi 64", "en": "West 48th Street · Block Cluster 64"}'::jsonb,
  'West 48th Street',
  24247,
  ST_GeomFromText('POLYGON((-73.985752 40.747, -73.983903 40.747, -73.983903 40.7484, -73.985752 40.7484, -73.985752 40.747))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5baa6d8a-6b35-445a-a09f-f9d0c6e001e4',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-163',
  '{"tr": "West 44th Street · Ada Kümesi 71", "en": "West 44th Street · Block Cluster 71"}'::jsonb,
  'West 44th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.983903 40.747, -73.982055 40.747, -73.982055 40.7484, -73.983903 40.7484, -73.983903 40.747))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a1ca94c0-d4ae-4b5a-a564-af9a7678d01a',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-200',
  '{"tr": "West 44th Street · Ada Kümesi 78", "en": "West 44th Street · Block Cluster 78"}'::jsonb,
  'West 44th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.982055 40.747, -73.980207 40.747, -73.980207 40.7484, -73.982055 40.7484, -73.982055 40.747))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6470ca35-9097-49e4-a4e7-a3d1f5083419',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-237',
  '{"tr": "Broadway · Ada Kümesi 85", "en": "Broadway · Block Cluster 85"}'::jsonb,
  'Broadway',
  24235,
  ST_GeomFromText('POLYGON((-73.980207 40.747, -73.978359 40.747, -73.978359 40.7484, -73.980207 40.7484, -73.980207 40.747))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7477)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0cb4ab14-0f12-4c55-a3a6-87411bc6d769',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-274',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 3", "en": "West 46th Street (Restaurant Row) · Block Cluster 3"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24235,
  ST_GeomFromText('POLYGON((-73.978359 40.747, -73.976511 40.747, -73.976511 40.7484, -73.978359 40.7484, -73.978359 40.747))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a30abd8e-4d0e-4f70-ae04-72fef0198cfe',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-311',
  '{"tr": "West 44th Street · Ada Kümesi 10", "en": "West 44th Street · Block Cluster 10"}'::jsonb,
  'West 44th Street',
  24235,
  ST_GeomFromText('POLYGON((-73.976511 40.747, -73.974663 40.747, -73.974663 40.7484, -73.976511 40.7484, -73.976511 40.747))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7477)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '521ba511-4f70-4afb-ad6b-8feaa18bd00c',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-976',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24247,
  ST_GeomFromText('POLYGON((-73.996841 40.7484, -73.994992 40.7484, -73.994992 40.7498, -73.996841 40.7498, -73.996841 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7491)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a93f7acd-1fb0-4a4b-a68f-9086c8f06518',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-014',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 42", "en": "West 46th Street (Restaurant Row) · Block Cluster 42"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.994992 40.7484, -73.993144 40.7484, -73.993144 40.7498, -73.994992 40.7498, -73.994992 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '961e80da-1c63-4ab4-aa7d-0a6eb2820b8e',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-051',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 49", "en": "West 46th Street (Restaurant Row) · Block Cluster 49"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.993144 40.7484, -73.991296 40.7484, -73.991296 40.7498, -73.993144 40.7498, -73.993144 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0495f5d-2b64-4cf2-ab2d-93affbae2c4f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-088',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 56", "en": "West 46th Street (Restaurant Row) · Block Cluster 56"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.991296 40.7484, -73.989448 40.7484, -73.989448 40.7498, -73.991296 40.7498, -73.991296 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c4da7956-81e0-4a21-a53a-637746ba9377',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-125',
  '{"tr": "5th Avenue · Ada Kümesi 63", "en": "5th Avenue · Block Cluster 63"}'::jsonb,
  '5th Avenue',
  24233,
  ST_GeomFromText('POLYGON((-73.989448 40.7484, -73.9876 40.7484, -73.9876 40.7498, -73.989448 40.7498, -73.989448 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7491)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fc04e98f-5d2a-4749-a12e-aec6592f30d8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-162',
  '{"tr": "West 43rd Street · Ada Kümesi 70", "en": "West 43rd Street · Block Cluster 70"}'::jsonb,
  'West 43rd Street',
  24233,
  ST_GeomFromText('POLYGON((-73.9876 40.7484, -73.985752 40.7484, -73.985752 40.7498, -73.9876 40.7498, -73.9876 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b53c7572-a0f1-4cab-a5cd-29d9562dd21d',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-199',
  '{"tr": "West 43rd Street · Ada Kümesi 77", "en": "West 43rd Street · Block Cluster 77"}'::jsonb,
  'West 43rd Street',
  24247,
  ST_GeomFromText('POLYGON((-73.985752 40.7484, -73.983903 40.7484, -73.983903 40.7498, -73.985752 40.7498, -73.985752 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2e30d6aa-2f26-4a7d-a116-fcd75d570127',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-236',
  '{"tr": "West 43rd Street · Ada Kümesi 84", "en": "West 43rd Street · Block Cluster 84"}'::jsonb,
  'West 43rd Street',
  24233,
  ST_GeomFromText('POLYGON((-73.983903 40.7484, -73.982055 40.7484, -73.982055 40.7498, -73.983903 40.7498, -73.983903 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6bc6adfc-8b15-4582-a0d3-d87ef6dc237e',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-273',
  '{"tr": "5th Avenue · Ada Kümesi 2", "en": "5th Avenue · Block Cluster 2"}'::jsonb,
  '5th Avenue',
  24233,
  ST_GeomFromText('POLYGON((-73.982055 40.7484, -73.980207 40.7484, -73.980207 40.7498, -73.982055 40.7498, -73.982055 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7491)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cdb3d22e-727e-45b6-afcd-b798403237e4',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-310',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 9", "en": "West 46th Street (Restaurant Row) · Block Cluster 9"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.980207 40.7484, -73.978359 40.7484, -73.978359 40.7498, -73.980207 40.7498, -73.980207 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd06bcac9-4f89-422b-afe2-f8e21ff4fcf4',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-347',
  '{"tr": "West 48th Street · Ada Kümesi 16", "en": "West 48th Street · Block Cluster 16"}'::jsonb,
  'West 48th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.978359 40.7484, -73.976511 40.7484, -73.976511 40.7498, -73.978359 40.7498, -73.978359 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '63c636a7-68e8-4ffe-ab2e-9959ccaee6a5',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-384',
  '{"tr": "West 44th Street · Ada Kümesi 23", "en": "West 44th Street · Block Cluster 23"}'::jsonb,
  'West 44th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.976511 40.7484, -73.974663 40.7484, -73.974663 40.7498, -73.976511 40.7498, -73.976511 40.7484))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7491)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e09d6f76-8b84-408e-ab19-3ff86c21c004',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-050',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24246,
  ST_GeomFromText('POLYGON((-73.996841 40.7498, -73.994992 40.7498, -73.994992 40.7512, -73.996841 40.7512, -73.996841 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7505)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4fe06b91-02bc-46cf-ad5c-ed5e529cf260',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-087',
  '{"tr": "West 48th Street · Ada Kümesi 55", "en": "West 48th Street · Block Cluster 55"}'::jsonb,
  'West 48th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.994992 40.7498, -73.993144 40.7498, -73.993144 40.7512, -73.994992 40.7512, -73.994992 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c7302cc3-2654-4812-a164-84d1ed84d4d5',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-124',
  '{"tr": "West 45th Street · Ada Kümesi 62", "en": "West 45th Street · Block Cluster 62"}'::jsonb,
  'West 45th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.993144 40.7498, -73.991296 40.7498, -73.991296 40.7512, -73.993144 40.7512, -73.993144 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eaf24f33-636d-4199-a99f-2eaa4e5fb0cc',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-161',
  '{"tr": "Broadway · Ada Kümesi 69", "en": "Broadway · Block Cluster 69"}'::jsonb,
  'Broadway',
  24233,
  ST_GeomFromText('POLYGON((-73.991296 40.7498, -73.989448 40.7498, -73.989448 40.7512, -73.991296 40.7512, -73.991296 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7505)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9d1a910a-783f-4a68-a525-4b62155a6b72',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-198',
  '{"tr": "West 45th Street · Ada Kümesi 76", "en": "West 45th Street · Block Cluster 76"}'::jsonb,
  'West 45th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.989448 40.7498, -73.9876 40.7498, -73.9876 40.7512, -73.989448 40.7512, -73.989448 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '04aa6405-ddd3-4b8c-a979-6f89e27d6f91',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-235',
  '{"tr": "West 44th Street · Ada Kümesi 83", "en": "West 44th Street · Block Cluster 83"}'::jsonb,
  'West 44th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.9876 40.7498, -73.985752 40.7498, -73.985752 40.7512, -73.9876 40.7512, -73.9876 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cc8cf39c-8a45-4eea-a6c9-cd7656d23286',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-272',
  '{"tr": "West 45th Street · Ada Kümesi 1", "en": "West 45th Street · Block Cluster 1"}'::jsonb,
  'West 45th Street',
  24246,
  ST_GeomFromText('POLYGON((-73.985752 40.7498, -73.983903 40.7498, -73.983903 40.7512, -73.985752 40.7512, -73.985752 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '893a1de1-9d9a-450b-a4a0-68ea26d492ec',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-309',
  '{"tr": "Broadway · Ada Kümesi 8", "en": "Broadway · Block Cluster 8"}'::jsonb,
  'Broadway',
  24233,
  ST_GeomFromText('POLYGON((-73.983903 40.7498, -73.982055 40.7498, -73.982055 40.7512, -73.983903 40.7512, -73.983903 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7505)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e1b6214-87f6-4df3-a9ed-efe72611f007',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-346',
  '{"tr": "West 45th Street · Ada Kümesi 15", "en": "West 45th Street · Block Cluster 15"}'::jsonb,
  'West 45th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.982055 40.7498, -73.980207 40.7498, -73.980207 40.7512, -73.982055 40.7512, -73.982055 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '93fa2808-1701-4cfc-a4fb-b4f4aafbc504',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-383',
  '{"tr": "West 45th Street · Ada Kümesi 22", "en": "West 45th Street · Block Cluster 22"}'::jsonb,
  'West 45th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.980207 40.7498, -73.978359 40.7498, -73.978359 40.7512, -73.980207 40.7512, -73.980207 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f757ef41-39ec-4daf-aebb-a2ee31443cf0',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-420',
  '{"tr": "West 45th Street · Ada Kümesi 29", "en": "West 45th Street · Block Cluster 29"}'::jsonb,
  'West 45th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.978359 40.7498, -73.976511 40.7498, -73.976511 40.7512, -73.978359 40.7512, -73.978359 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7505)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bbb878e7-b3bd-4a72-a805-c2956f763359',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-457',
  '{"tr": "Broadway · Ada Kümesi 36", "en": "Broadway · Block Cluster 36"}'::jsonb,
  'Broadway',
  24233,
  ST_GeomFromText('POLYGON((-73.976511 40.7498, -73.974663 40.7498, -73.974663 40.7512, -73.976511 40.7512, -73.976511 40.7498))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7505)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6e1f91ae-b20c-4c4c-ac13-9de2202b9dfa',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-123',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24246,
  ST_GeomFromText('POLYGON((-73.996841 40.7512, -73.994992 40.7512, -73.994992 40.7526, -73.996841 40.7526, -73.996841 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7519)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '38c8664e-c9ab-4335-a163-857b02744983',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-160',
  '{"tr": "West 44th Street · Ada Kümesi 68", "en": "West 44th Street · Block Cluster 68"}'::jsonb,
  'West 44th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.994992 40.7512, -73.993144 40.7512, -73.993144 40.7526, -73.994992 40.7526, -73.994992 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78485c87-a822-44f8-a06a-c87f206af17f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-197',
  '{"tr": "5th Avenue · Ada Kümesi 75", "en": "5th Avenue · Block Cluster 75"}'::jsonb,
  '5th Avenue',
  24233,
  ST_GeomFromText('POLYGON((-73.993144 40.7512, -73.991296 40.7512, -73.991296 40.7526, -73.993144 40.7526, -73.993144 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7519)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0cd7345f-024c-4094-ae9b-54cb0f2394f3',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-234',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 82", "en": "West 46th Street (Restaurant Row) · Block Cluster 82"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.991296 40.7512, -73.989448 40.7512, -73.989448 40.7526, -73.991296 40.7526, -73.991296 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '11b687f1-e45f-406f-a5e9-f79ef615f860',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-271',
  '{"tr": "West 43rd Street · Ada Kümesi 89", "en": "West 43rd Street · Block Cluster 89"}'::jsonb,
  'West 43rd Street',
  24233,
  ST_GeomFromText('POLYGON((-73.989448 40.7512, -73.9876 40.7512, -73.9876 40.7526, -73.989448 40.7526, -73.989448 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '08f3b5c8-a4d9-45d7-ac2a-701fadcd7b9f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-308',
  '{"tr": "West 43rd Street · Ada Kümesi 7", "en": "West 43rd Street · Block Cluster 7"}'::jsonb,
  'West 43rd Street',
  24233,
  ST_GeomFromText('POLYGON((-73.9876 40.7512, -73.985752 40.7512, -73.985752 40.7526, -73.9876 40.7526, -73.9876 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd1a73301-e95a-4c85-a8fd-bf84bb01bf86',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-345',
  '{"tr": "5th Avenue · Ada Kümesi 14", "en": "5th Avenue · Block Cluster 14"}'::jsonb,
  '5th Avenue',
  24246,
  ST_GeomFromText('POLYGON((-73.985752 40.7512, -73.983903 40.7512, -73.983903 40.7526, -73.985752 40.7526, -73.985752 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7519)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4f5b1408-a449-4b6b-ab12-7f63f3a47f73',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-382',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 21", "en": "West 46th Street (Restaurant Row) · Block Cluster 21"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24233,
  ST_GeomFromText('POLYGON((-73.983903 40.7512, -73.982055 40.7512, -73.982055 40.7526, -73.983903 40.7526, -73.983903 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f86bac8b-afa5-4217-a7ce-9e9ca810dea2',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-419',
  '{"tr": "West 44th Street · Ada Kümesi 28", "en": "West 44th Street · Block Cluster 28"}'::jsonb,
  'West 44th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.982055 40.7512, -73.980207 40.7512, -73.980207 40.7526, -73.982055 40.7526, -73.982055 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'be8edf69-c14c-4ced-afc2-c3847fdafc56',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-456',
  '{"tr": "West 44th Street · Ada Kümesi 35", "en": "West 44th Street · Block Cluster 35"}'::jsonb,
  'West 44th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.980207 40.7512, -73.978359 40.7512, -73.978359 40.7526, -73.980207 40.7526, -73.980207 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0a8d52f6-68c4-40f4-a249-8202735223ea',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-493',
  '{"tr": "5th Avenue · Ada Kümesi 42", "en": "5th Avenue · Block Cluster 42"}'::jsonb,
  '5th Avenue',
  24233,
  ST_GeomFromText('POLYGON((-73.978359 40.7512, -73.976511 40.7512, -73.976511 40.7526, -73.978359 40.7526, -73.978359 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7519)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7d0188b9-e02f-40c8-ad2e-38715d313981',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-530',
  '{"tr": "West 48th Street · Ada Kümesi 49", "en": "West 48th Street · Block Cluster 49"}'::jsonb,
  'West 48th Street',
  24233,
  ST_GeomFromText('POLYGON((-73.976511 40.7512, -73.974663 40.7512, -73.974663 40.7526, -73.976511 40.7526, -73.976511 40.7512))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7519)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fe24aa51-213f-40df-af1b-5a8e1f649b30',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-196',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24246,
  ST_GeomFromText('POLYGON((-73.996841 40.7526, -73.994992 40.7526, -73.994992 40.754, -73.996841 40.754, -73.996841 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7533)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0abaa98c-7a7e-422c-a0c4-9ba08538dbb8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-233',
  '{"tr": "Broadway · Ada Kümesi 81", "en": "Broadway · Block Cluster 81"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.994992 40.7526, -73.993144 40.7526, -73.993144 40.754, -73.994992 40.754, -73.994992 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7533)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3e937446-4b8e-4227-a51d-96618a22566d',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-270',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 88", "en": "West 46th Street (Restaurant Row) · Block Cluster 88"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24232,
  ST_GeomFromText('POLYGON((-73.993144 40.7526, -73.991296 40.7526, -73.991296 40.754, -73.993144 40.754, -73.993144 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '66146e39-1e8f-46e1-a89b-18d884a3e51a',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-307',
  '{"tr": "West 44th Street · Ada Kümesi 6", "en": "West 44th Street · Block Cluster 6"}'::jsonb,
  'West 44th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.991296 40.7526, -73.989448 40.7526, -73.989448 40.754, -73.991296 40.754, -73.991296 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8a93b586-3a3e-4094-a0ad-f512c4d1f61a',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-344',
  '{"tr": "West 43rd Street · Ada Kümesi 13", "en": "West 43rd Street · Block Cluster 13"}'::jsonb,
  'West 43rd Street',
  24232,
  ST_GeomFromText('POLYGON((-73.989448 40.7526, -73.9876 40.7526, -73.9876 40.754, -73.989448 40.754, -73.989448 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5bdb6e6b-56b5-4bba-ad6e-a5d1b2913a25',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-381',
  '{"tr": "Broadway · Ada Kümesi 20", "en": "Broadway · Block Cluster 20"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.9876 40.7526, -73.985752 40.7526, -73.985752 40.754, -73.9876 40.754, -73.9876 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7533)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '98453e18-1a72-4edd-a237-f0c5b2b80cf5',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-418',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 27", "en": "West 46th Street (Restaurant Row) · Block Cluster 27"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24246,
  ST_GeomFromText('POLYGON((-73.985752 40.7526, -73.983903 40.7526, -73.983903 40.754, -73.985752 40.754, -73.985752 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b7dc007e-e821-44e4-affd-449a9ffd4562',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-455',
  '{"tr": "West 45th Street · Ada Kümesi 34", "en": "West 45th Street · Block Cluster 34"}'::jsonb,
  'West 45th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.983903 40.7526, -73.982055 40.7526, -73.982055 40.754, -73.983903 40.754, -73.983903 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b2229b26-b7be-4382-a59c-38a469e13ea8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-492',
  '{"tr": "West 44th Street · Ada Kümesi 41", "en": "West 44th Street · Block Cluster 41"}'::jsonb,
  'West 44th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.982055 40.7526, -73.980207 40.7526, -73.980207 40.754, -73.982055 40.754, -73.982055 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2c39c7b4-fa9b-4929-a6a2-5e9d26d560dd',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-529',
  '{"tr": "Broadway · Ada Kümesi 48", "en": "Broadway · Block Cluster 48"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.980207 40.7526, -73.978359 40.7526, -73.978359 40.754, -73.980207 40.754, -73.980207 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7533)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e26d19d8-d598-4a9c-a7f5-d344b805e474',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-566',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 55", "en": "West 46th Street (Restaurant Row) · Block Cluster 55"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24232,
  ST_GeomFromText('POLYGON((-73.978359 40.7526, -73.976511 40.7526, -73.976511 40.754, -73.978359 40.754, -73.978359 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bcacdc00-0b9f-42cb-a733-7ecbc84c7ecb',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-603',
  '{"tr": "West 43rd Street · Ada Kümesi 62", "en": "West 43rd Street · Block Cluster 62"}'::jsonb,
  'West 43rd Street',
  24232,
  ST_GeomFromText('POLYGON((-73.976511 40.7526, -73.974663 40.7526, -73.974663 40.754, -73.976511 40.754, -73.976511 40.7526))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7533)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd8d65438-7d09-4ed6-a5df-baee55e0430e',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-269',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24244,
  ST_GeomFromText('POLYGON((-73.996841 40.754, -73.994992 40.754, -73.994992 40.7554, -73.996841 40.7554, -73.996841 40.754))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7547)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c0ede563-01c9-49e9-a124-fc8ac2b6ff4c',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-306',
  '{"tr": "West 48th Street · Ada Kümesi 5", "en": "West 48th Street · Block Cluster 5"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.994992 40.754, -73.993144 40.754, -73.993144 40.7554, -73.994992 40.7554, -73.994992 40.754))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '91a9b5c7-b41d-4921-a5b4-dce645c71ee8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-343',
  '{"tr": "West 48th Street · Ada Kümesi 12", "en": "West 48th Street · Block Cluster 12"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.993144 40.754, -73.991296 40.754, -73.991296 40.7554, -73.993144 40.7554, -73.993144 40.754))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '197909bd-c82d-4ee2-a154-d75fe1a6e89f',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-380',
  '{"tr": "West 48th Street · Ada Kümesi 19", "en": "West 48th Street · Block Cluster 19"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.991296 40.754, -73.989448 40.754, -73.989448 40.7554, -73.991296 40.7554, -73.991296 40.754))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0fd63fc5-8b42-4deb-a494-422e9b18bdb0',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-417',
  '{"tr": "5th Avenue · Ada Kümesi 26", "en": "5th Avenue · Block Cluster 26"}'::jsonb,
  '5th Avenue',
  24232,
  ST_GeomFromText('POLYGON((-73.989448 40.754, -73.9876 40.754, -73.9876 40.7554, -73.989448 40.7554, -73.989448 40.754))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7547)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b7f0adbe-f469-42c8-a399-8f76ac59d086',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-454',
  '{"tr": "West 48th Street · Ada Kümesi 33", "en": "West 48th Street · Block Cluster 33"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.9876 40.754, -73.985752 40.754, -73.985752 40.7554, -73.9876 40.7554, -73.9876 40.754))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cba6ac8d-7728-406b-ac8e-fce642cefcf8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-491',
  '{"tr": "West 48th Street · Ada Kümesi 40", "en": "West 48th Street · Block Cluster 40"}'::jsonb,
  'West 48th Street',
  24244,
  ST_GeomFromText('POLYGON((-73.985752 40.754, -73.983903 40.754, -73.983903 40.7554, -73.985752 40.7554, -73.985752 40.754))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd647c958-a231-473f-a476-7e6778798097',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-528',
  '{"tr": "West 48th Street · Ada Kümesi 47", "en": "West 48th Street · Block Cluster 47"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.983903 40.754, -73.982055 40.754, -73.982055 40.7554, -73.983903 40.7554, -73.983903 40.754))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e87509c3-4b6f-4846-a31a-518533e46209',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-565',
  '{"tr": "5th Avenue · Ada Kümesi 54", "en": "5th Avenue · Block Cluster 54"}'::jsonb,
  '5th Avenue',
  24232,
  ST_GeomFromText('POLYGON((-73.982055 40.754, -73.980207 40.754, -73.980207 40.7554, -73.982055 40.7554, -73.982055 40.754))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7547)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7c5eedd4-85cb-4cdc-a995-5108022aaab0',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-602',
  '{"tr": "West 48th Street · Ada Kümesi 61", "en": "West 48th Street · Block Cluster 61"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.980207 40.754, -73.978359 40.754, -73.978359 40.7554, -73.980207 40.7554, -73.980207 40.754))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ccdb38f5-dba5-49f3-a77e-3106a88042e8',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-639',
  '{"tr": "West 48th Street · Ada Kümesi 68", "en": "West 48th Street · Block Cluster 68"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.978359 40.754, -73.976511 40.754, -73.976511 40.7554, -73.978359 40.7554, -73.978359 40.754))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f2e61ccb-d30b-4023-a1ed-5ce8c5f15cee',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-676',
  '{"tr": "West 48th Street · Ada Kümesi 75", "en": "West 48th Street · Block Cluster 75"}'::jsonb,
  'West 48th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.976511 40.754, -73.974663 40.754, -73.974663 40.7554, -73.976511 40.7554, -73.976511 40.754))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7547)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c0c421dd-6365-4087-a3a1-a15a2429a264',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-342',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24244,
  ST_GeomFromText('POLYGON((-73.996841 40.7554, -73.994992 40.7554, -73.994992 40.7568, -73.996841 40.7568, -73.996841 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7561)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7ebb1f41-04a8-45a8-aa13-4ae9836374e9',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-379',
  '{"tr": "West 43rd Street · Ada Kümesi 18", "en": "West 43rd Street · Block Cluster 18"}'::jsonb,
  'West 43rd Street',
  24232,
  ST_GeomFromText('POLYGON((-73.994992 40.7554, -73.993144 40.7554, -73.993144 40.7568, -73.994992 40.7568, -73.994992 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ac71e88c-6d74-42d2-a105-da5e19e61b5e',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-416',
  '{"tr": "West 45th Street · Ada Kümesi 25", "en": "West 45th Street · Block Cluster 25"}'::jsonb,
  'West 45th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.993144 40.7554, -73.991296 40.7554, -73.991296 40.7568, -73.993144 40.7568, -73.993144 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fd024780-7c3f-4eab-a13d-a92b7942362b',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-453',
  '{"tr": "Broadway · Ada Kümesi 32", "en": "Broadway · Block Cluster 32"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.991296 40.7554, -73.989448 40.7554, -73.989448 40.7568, -73.991296 40.7568, -73.991296 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7561)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aed92447-bf75-42cb-a1ac-568c6e4e9712',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-490',
  '{"tr": "West 45th Street · Ada Kümesi 39", "en": "West 45th Street · Block Cluster 39"}'::jsonb,
  'West 45th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.989448 40.7554, -73.9876 40.7554, -73.9876 40.7568, -73.989448 40.7568, -73.989448 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '12eb8c70-7109-4bb1-a3e2-b7c183f4c821',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-527',
  '{"tr": "West 43rd Street · Ada Kümesi 46", "en": "West 43rd Street · Block Cluster 46"}'::jsonb,
  'West 43rd Street',
  24232,
  ST_GeomFromText('POLYGON((-73.9876 40.7554, -73.985752 40.7554, -73.985752 40.7568, -73.9876 40.7568, -73.9876 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '046a3e1e-4a23-4b4c-ae49-15524e8d696a',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-564',
  '{"tr": "West 44th Street · Ada Kümesi 53", "en": "West 44th Street · Block Cluster 53"}'::jsonb,
  'West 44th Street',
  24244,
  ST_GeomFromText('POLYGON((-73.985752 40.7554, -73.983903 40.7554, -73.983903 40.7568, -73.985752 40.7568, -73.985752 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'efc198b3-7311-4793-acd0-1f2062d32046',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-601',
  '{"tr": "Broadway · Ada Kümesi 60", "en": "Broadway · Block Cluster 60"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.983903 40.7554, -73.982055 40.7554, -73.982055 40.7568, -73.983903 40.7568, -73.983903 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7561)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bde94fc6-a3e0-4aca-ae09-650c61c97a90',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-638',
  '{"tr": "West 44th Street · Ada Kümesi 67", "en": "West 44th Street · Block Cluster 67"}'::jsonb,
  'West 44th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.982055 40.7554, -73.980207 40.7554, -73.980207 40.7568, -73.982055 40.7568, -73.982055 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '358e668c-ad9c-42ec-a812-a460e32b2978',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-675',
  '{"tr": "West 43rd Street · Ada Kümesi 74", "en": "West 43rd Street · Block Cluster 74"}'::jsonb,
  'West 43rd Street',
  24232,
  ST_GeomFromText('POLYGON((-73.980207 40.7554, -73.978359 40.7554, -73.978359 40.7568, -73.980207 40.7568, -73.980207 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2ab449c6-e354-4ca3-a9e0-75650e088669',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-712',
  '{"tr": "West 45th Street · Ada Kümesi 81", "en": "West 45th Street · Block Cluster 81"}'::jsonb,
  'West 45th Street',
  24232,
  ST_GeomFromText('POLYGON((-73.978359 40.7554, -73.976511 40.7554, -73.976511 40.7568, -73.978359 40.7568, -73.978359 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7561)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd0b67153-b325-4e54-a393-4f0783dbafa7',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-749',
  '{"tr": "Broadway · Ada Kümesi 88", "en": "Broadway · Block Cluster 88"}'::jsonb,
  'Broadway',
  24232,
  ST_GeomFromText('POLYGON((-73.976511 40.7554, -73.974663 40.7554, -73.974663 40.7568, -73.976511 40.7568, -73.976511 40.7554))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7561)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5f704631-f566-4d11-aa16-ab2054d73342',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MRK-415',
  '{"tr": "Manhattan Şehir Caddeleri", "en": "Manhattan City Streets"}'::jsonb,
  'Manhattan Manhattan Bölgesi Caddesi',
  24244,
  ST_GeomFromText('POLYGON((-73.996841 40.7568, -73.994992 40.7568, -73.994992 40.7582, -73.996841 40.7582, -73.996841 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.995916 40.7575)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e6c8c160-007c-4102-a6b4-e062e744e262',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-452',
  '{"tr": "West 43rd Street · Ada Kümesi 31", "en": "West 43rd Street · Block Cluster 31"}'::jsonb,
  'West 43rd Street',
  24230,
  ST_GeomFromText('POLYGON((-73.994992 40.7568, -73.993144 40.7568, -73.993144 40.7582, -73.994992 40.7582, -73.994992 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.994068 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '14e3da44-7061-4f16-a482-45528545795a',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-489',
  '{"tr": "5th Avenue · Ada Kümesi 38", "en": "5th Avenue · Block Cluster 38"}'::jsonb,
  '5th Avenue',
  24230,
  ST_GeomFromText('POLYGON((-73.993144 40.7568, -73.991296 40.7568, -73.991296 40.7582, -73.993144 40.7582, -73.993144 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.99222 40.7575)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eefc6010-8b0f-4ec0-a5f3-7ed07a0b7ed0',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-526',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 45", "en": "West 46th Street (Restaurant Row) · Block Cluster 45"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24230,
  ST_GeomFromText('POLYGON((-73.991296 40.7568, -73.989448 40.7568, -73.989448 40.7582, -73.991296 40.7582, -73.991296 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.990372 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ffdabd24-c6db-46c7-a901-abe3c6b5d3eb',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-563',
  '{"tr": "West 43rd Street · Ada Kümesi 52", "en": "West 43rd Street · Block Cluster 52"}'::jsonb,
  'West 43rd Street',
  24230,
  ST_GeomFromText('POLYGON((-73.989448 40.7568, -73.9876 40.7568, -73.9876 40.7582, -73.989448 40.7582, -73.989448 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.988524 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '38cf5606-6562-4fe4-adad-d9e29e31e5ea',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-600',
  '{"tr": "West 43rd Street · Ada Kümesi 59", "en": "West 43rd Street · Block Cluster 59"}'::jsonb,
  'West 43rd Street',
  24230,
  ST_GeomFromText('POLYGON((-73.9876 40.7568, -73.985752 40.7568, -73.985752 40.7582, -73.9876 40.7582, -73.9876 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.986676 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '99178a8d-daf1-4b0e-a3e6-c1837408d59b',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-637',
  '{"tr": "5th Avenue · Ada Kümesi 66", "en": "5th Avenue · Block Cluster 66"}'::jsonb,
  '5th Avenue',
  24244,
  ST_GeomFromText('POLYGON((-73.985752 40.7568, -73.983903 40.7568, -73.983903 40.7582, -73.985752 40.7582, -73.985752 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.984827 40.7575)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f22eda00-3dc3-41b7-afed-bbb72ff23bb7',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-674',
  '{"tr": "West 45th Street · Ada Kümesi 73", "en": "West 45th Street · Block Cluster 73"}'::jsonb,
  'West 45th Street',
  24230,
  ST_GeomFromText('POLYGON((-73.983903 40.7568, -73.982055 40.7568, -73.982055 40.7582, -73.983903 40.7582, -73.983903 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.982979 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '03c5a51e-17fa-46ea-a43f-d3f41bc01c08',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-711',
  '{"tr": "West 43rd Street · Ada Kümesi 80", "en": "West 43rd Street · Block Cluster 80"}'::jsonb,
  'West 43rd Street',
  24230,
  ST_GeomFromText('POLYGON((-73.982055 40.7568, -73.980207 40.7568, -73.980207 40.7582, -73.982055 40.7582, -73.982055 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.981131 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '84801c25-5e5a-40a4-aada-fc81e2dafcc9',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-748',
  '{"tr": "West 43rd Street · Ada Kümesi 87", "en": "West 43rd Street · Block Cluster 87"}'::jsonb,
  'West 43rd Street',
  24230,
  ST_GeomFromText('POLYGON((-73.980207 40.7568, -73.978359 40.7568, -73.978359 40.7582, -73.980207 40.7582, -73.980207 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.979283 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '64b42070-286b-4f2d-acdf-5f5d8d1f9f9d',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-785',
  '{"tr": "5th Avenue · Ada Kümesi 5", "en": "5th Avenue · Block Cluster 5"}'::jsonb,
  '5th Avenue',
  24230,
  ST_GeomFromText('POLYGON((-73.978359 40.7568, -73.976511 40.7568, -73.976511 40.7582, -73.978359 40.7582, -73.978359 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.977435 40.7575)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ae3239aa-2c96-4877-a2a4-81dddac8f221',
  'a0000000-0000-0000-0000-000000000003',
  'US-MAN-MID-822',
  '{"tr": "West 46th Street (Restaurant Row) · Ada Kümesi 12", "en": "West 46th Street (Restaurant Row) · Block Cluster 12"}'::jsonb,
  'West 46th Street (Restaurant Row)',
  24230,
  ST_GeomFromText('POLYGON((-73.976511 40.7568, -73.974663 40.7568, -73.974663 40.7582, -73.976511 40.7582, -73.976511 40.7568))', 4326),
  ST_GeomFromText('POINT(-73.975587 40.7575)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '44b055fe-0bbc-4704-af0c-12fa506c9d02',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-099',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((-0.141724 51.5074, -0.139474 51.5074, -0.139474 51.5088, -0.141724 51.5088, -0.141724 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5081)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e2105f4b-d38d-46b3-a19d-79f8b59d85fe',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-136',
  '{"tr": "Beak Street · Ada Kümesi 9", "en": "Beak Street · Block Cluster 9"}'::jsonb,
  'Beak Street',
  24230,
  ST_GeomFromText('POLYGON((-0.139474 51.5074, -0.137225 51.5074, -0.137225 51.5088, -0.139474 51.5088, -0.139474 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5081)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5e42f58a-9ef3-4f7c-a0b1-6af6fd369506',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-173',
  '{"tr": "Wardour Street · Ada Kümesi 16", "en": "Wardour Street · Block Cluster 16"}'::jsonb,
  'Wardour Street',
  24241,
  ST_GeomFromText('POLYGON((-0.137225 51.5074, -0.134975 51.5074, -0.134975 51.5088, -0.137225 51.5088, -0.137225 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5081)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b99e31b4-9781-46b5-ae1f-d70151201869',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-210',
  '{"tr": "Greek Street · Ada Kümesi 23", "en": "Greek Street · Block Cluster 23"}'::jsonb,
  'Greek Street',
  24230,
  ST_GeomFromText('POLYGON((-0.134975 51.5074, -0.132726 51.5074, -0.132726 51.5088, -0.134975 51.5088, -0.134975 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5081)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '203d97ec-3d37-494d-ad0a-1ea15d752139',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-247',
  '{"tr": "Oxford Street · Ada Kümesi 30", "en": "Oxford Street · Block Cluster 30"}'::jsonb,
  'Oxford Street',
  24241,
  ST_GeomFromText('POLYGON((-0.132726 51.5074, -0.130476 51.5074, -0.130476 51.5088, -0.132726 51.5088, -0.132726 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5081)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0ddeb5bd-e2e6-4222-af38-979ff0c4d7df',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-284',
  '{"tr": "Beak Street · Ada Kümesi 37", "en": "Beak Street · Block Cluster 37"}'::jsonb,
  'Beak Street',
  24241,
  ST_GeomFromText('POLYGON((-0.130476 51.5074, -0.128226 51.5074, -0.128226 51.5088, -0.130476 51.5088, -0.130476 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5081)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0c2ed249-7067-4666-ac49-042f7c96a8af',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-321',
  '{"tr": "Wardour Street · Ada Kümesi 44", "en": "Wardour Street · Block Cluster 44"}'::jsonb,
  'Wardour Street',
  24230,
  ST_GeomFromText('POLYGON((-0.128226 51.5074, -0.125977 51.5074, -0.125977 51.5088, -0.128226 51.5088, -0.128226 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5081)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '55a31cc6-479f-4f0f-a23c-73c99d428bd5',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-358',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24241,
  ST_GeomFromText('POLYGON((-0.125977 51.5074, -0.123727 51.5074, -0.123727 51.5088, -0.125977 51.5088, -0.125977 51.5074))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5081)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c2a72c67-337e-4dab-a1d9-e1ccf625fa12',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-172',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((-0.141724 51.5088, -0.139474 51.5088, -0.139474 51.5102, -0.141724 51.5102, -0.141724 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5095)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '67224424-ba0c-4084-ad2e-74a0212e74a8',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-209',
  '{"tr": "Wardour Street · Ada Kümesi 22", "en": "Wardour Street · Block Cluster 22"}'::jsonb,
  'Wardour Street',
  24228,
  ST_GeomFromText('POLYGON((-0.139474 51.5088, -0.137225 51.5088, -0.137225 51.5102, -0.139474 51.5102, -0.139474 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5095)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd141d7c0-c180-4826-a0c1-1fe692c29fe6',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-246',
  '{"tr": "Broadwick Street · Ada Kümesi 29", "en": "Broadwick Street · Block Cluster 29"}'::jsonb,
  'Broadwick Street',
  24239,
  ST_GeomFromText('POLYGON((-0.137225 51.5088, -0.134975 51.5088, -0.134975 51.5102, -0.137225 51.5102, -0.137225 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5095)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b9f2e069-7607-4a8b-aff5-5ae22ffa9af4',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-283',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 36", "en": "Shaftesbury Avenue · Block Cluster 36"}'::jsonb,
  'Shaftesbury Avenue',
  24228,
  ST_GeomFromText('POLYGON((-0.134975 51.5088, -0.132726 51.5088, -0.132726 51.5102, -0.134975 51.5102, -0.134975 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5095)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '271460bb-82cf-404c-a5db-70f7a9e37107',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-320',
  '{"tr": "Broadwick Street · Ada Kümesi 43", "en": "Broadwick Street · Block Cluster 43"}'::jsonb,
  'Broadwick Street',
  24239,
  ST_GeomFromText('POLYGON((-0.132726 51.5088, -0.130476 51.5088, -0.130476 51.5102, -0.132726 51.5102, -0.132726 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5095)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b48f53a6-5bd3-4bf0-af5c-b85610633f96',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-357',
  '{"tr": "Wardour Street · Ada Kümesi 50", "en": "Wardour Street · Block Cluster 50"}'::jsonb,
  'Wardour Street',
  24239,
  ST_GeomFromText('POLYGON((-0.130476 51.5088, -0.128226 51.5088, -0.128226 51.5102, -0.130476 51.5102, -0.130476 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5095)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2d21d814-e9a0-4cd5-a481-f4c116c204e9',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-394',
  '{"tr": "Broadwick Street · Ada Kümesi 57", "en": "Broadwick Street · Block Cluster 57"}'::jsonb,
  'Broadwick Street',
  24228,
  ST_GeomFromText('POLYGON((-0.128226 51.5088, -0.125977 51.5088, -0.125977 51.5102, -0.128226 51.5102, -0.128226 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5095)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7be63c27-4fb5-45e9-a453-59cecb9ba210',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-431',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((-0.125977 51.5088, -0.123727 51.5088, -0.123727 51.5102, -0.125977 51.5102, -0.125977 51.5088))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5095)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eed459e2-d122-433d-aff6-eadfbff70d1f',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-245',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((-0.141724 51.5102, -0.139474 51.5102, -0.139474 51.5116, -0.141724 51.5116, -0.141724 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5109)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '74d6c853-d95d-43d9-ad8b-4b8a4e344c2c',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-282',
  '{"tr": "Broadwick Street · Ada Kümesi 35", "en": "Broadwick Street · Block Cluster 35"}'::jsonb,
  'Broadwick Street',
  24228,
  ST_GeomFromText('POLYGON((-0.139474 51.5102, -0.137225 51.5102, -0.137225 51.5116, -0.139474 51.5116, -0.139474 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5109)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '96ddb27c-77c5-4bc5-a118-f9b90ea2fe41',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-319',
  '{"tr": "Oxford Street · Ada Kümesi 42", "en": "Oxford Street · Block Cluster 42"}'::jsonb,
  'Oxford Street',
  24239,
  ST_GeomFromText('POLYGON((-0.137225 51.5102, -0.134975 51.5102, -0.134975 51.5116, -0.137225 51.5116, -0.137225 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5109)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f140e32e-7cdc-40b9-ad9c-53976e1d93e7',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-356',
  '{"tr": "Broadwick Street · Ada Kümesi 49", "en": "Broadwick Street · Block Cluster 49"}'::jsonb,
  'Broadwick Street',
  24228,
  ST_GeomFromText('POLYGON((-0.134975 51.5102, -0.132726 51.5102, -0.132726 51.5116, -0.134975 51.5116, -0.134975 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5109)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a1d80da3-a20e-4153-a3d6-acf043e6aef6',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-393',
  '{"tr": "Dean Street · Ada Kümesi 56", "en": "Dean Street · Block Cluster 56"}'::jsonb,
  'Dean Street',
  24239,
  ST_GeomFromText('POLYGON((-0.132726 51.5102, -0.130476 51.5102, -0.130476 51.5116, -0.132726 51.5116, -0.132726 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5109)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4789cbda-0261-4e0e-a5e8-85d449eb19e8',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-430',
  '{"tr": "Greek Street · Ada Kümesi 63", "en": "Greek Street · Block Cluster 63"}'::jsonb,
  'Greek Street',
  24239,
  ST_GeomFromText('POLYGON((-0.130476 51.5102, -0.128226 51.5102, -0.128226 51.5116, -0.130476 51.5116, -0.130476 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5109)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f2919887-b20c-41d4-a09d-8953a49daa5b',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-467',
  '{"tr": "Oxford Street · Ada Kümesi 70", "en": "Oxford Street · Block Cluster 70"}'::jsonb,
  'Oxford Street',
  24228,
  ST_GeomFromText('POLYGON((-0.128226 51.5102, -0.125977 51.5102, -0.125977 51.5116, -0.128226 51.5116, -0.128226 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5109)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'db616747-8e51-4559-a530-921e69b35ca0',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-504',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24239,
  ST_GeomFromText('POLYGON((-0.125977 51.5102, -0.123727 51.5102, -0.123727 51.5116, -0.125977 51.5116, -0.125977 51.5102))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5109)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2b77be03-4986-4bce-a2f1-a5cd74fdd9d1',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-318',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24238,
  ST_GeomFromText('POLYGON((-0.141724 51.5116, -0.139474 51.5116, -0.139474 51.513, -0.141724 51.513, -0.141724 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5123)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4b98eba0-8529-49cf-aeb1-726fd0c2856f',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-355',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 48", "en": "Shaftesbury Avenue · Block Cluster 48"}'::jsonb,
  'Shaftesbury Avenue',
  24227,
  ST_GeomFromText('POLYGON((-0.139474 51.5116, -0.137225 51.5116, -0.137225 51.513, -0.139474 51.513, -0.139474 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5123)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd1a5572d-75f3-4617-a456-b13a47993d44',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-392',
  '{"tr": "Greek Street · Ada Kümesi 55", "en": "Greek Street · Block Cluster 55"}'::jsonb,
  'Greek Street',
  24238,
  ST_GeomFromText('POLYGON((-0.137225 51.5116, -0.134975 51.5116, -0.134975 51.513, -0.137225 51.513, -0.137225 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5123)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '43332f3a-fd87-4b51-aeb4-c46b40bb1a8b',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-429',
  '{"tr": "Wardour Street · Ada Kümesi 62", "en": "Wardour Street · Block Cluster 62"}'::jsonb,
  'Wardour Street',
  24227,
  ST_GeomFromText('POLYGON((-0.134975 51.5116, -0.132726 51.5116, -0.132726 51.513, -0.134975 51.513, -0.134975 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5123)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ca453d09-6331-4c9e-a974-51972d76a9a7',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-466',
  '{"tr": "Broadwick Street · Ada Kümesi 69", "en": "Broadwick Street · Block Cluster 69"}'::jsonb,
  'Broadwick Street',
  24238,
  ST_GeomFromText('POLYGON((-0.132726 51.5116, -0.130476 51.5116, -0.130476 51.513, -0.132726 51.513, -0.132726 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5123)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '632ae6d5-8ea4-4715-ad8e-31c0f1cfbdea',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-503',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 76", "en": "Shaftesbury Avenue · Block Cluster 76"}'::jsonb,
  'Shaftesbury Avenue',
  24238,
  ST_GeomFromText('POLYGON((-0.130476 51.5116, -0.128226 51.5116, -0.128226 51.513, -0.130476 51.513, -0.130476 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5123)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c240e354-2ee8-4392-aca8-50c6f12996e6',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-540',
  '{"tr": "Beak Street · Ada Kümesi 83", "en": "Beak Street · Block Cluster 83"}'::jsonb,
  'Beak Street',
  24227,
  ST_GeomFromText('POLYGON((-0.128226 51.5116, -0.125977 51.5116, -0.125977 51.513, -0.128226 51.513, -0.128226 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5123)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9738b7ff-50ee-45bc-a7d6-5243e8279dbb',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-577',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24238,
  ST_GeomFromText('POLYGON((-0.125977 51.5116, -0.123727 51.5116, -0.123727 51.513, -0.125977 51.513, -0.125977 51.5116))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5123)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '02ee3280-b346-4fe9-a1a8-0d69b6347269',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-391',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24238,
  ST_GeomFromText('POLYGON((-0.141724 51.513, -0.139474 51.513, -0.139474 51.5144, -0.141724 51.5144, -0.141724 51.513))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5137)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2b89ca71-5985-4845-a20c-f234850f02b6',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-428',
  '{"tr": "Greek Street · Ada Kümesi 61", "en": "Greek Street · Block Cluster 61"}'::jsonb,
  'Greek Street',
  24227,
  ST_GeomFromText('POLYGON((-0.139474 51.513, -0.137225 51.513, -0.137225 51.5144, -0.139474 51.5144, -0.139474 51.513))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5137)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a983144c-6e28-4b7e-a7ab-2f3217ab4fca',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-465',
  '{"tr": "Dean Street · Ada Kümesi 68", "en": "Dean Street · Block Cluster 68"}'::jsonb,
  'Dean Street',
  24238,
  ST_GeomFromText('POLYGON((-0.137225 51.513, -0.134975 51.513, -0.134975 51.5144, -0.137225 51.5144, -0.137225 51.513))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5137)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1a1089eb-54f8-4b46-aee8-42ad6f095531',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-502',
  '{"tr": "Beak Street · Ada Kümesi 75", "en": "Beak Street · Block Cluster 75"}'::jsonb,
  'Beak Street',
  24227,
  ST_GeomFromText('POLYGON((-0.134975 51.513, -0.132726 51.513, -0.132726 51.5144, -0.134975 51.5144, -0.134975 51.513))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5137)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7dfc7599-fe7c-4a24-a380-6fbd7c788fbd',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-539',
  '{"tr": "Oxford Street · Ada Kümesi 82", "en": "Oxford Street · Block Cluster 82"}'::jsonb,
  'Oxford Street',
  24238,
  ST_GeomFromText('POLYGON((-0.132726 51.513, -0.130476 51.513, -0.130476 51.5144, -0.132726 51.5144, -0.132726 51.513))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5137)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f77e4ba7-a386-483b-a4f8-c39c9b04d3e2',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-576',
  '{"tr": "Broadwick Street · Ada Kümesi 89", "en": "Broadwick Street · Block Cluster 89"}'::jsonb,
  'Broadwick Street',
  24238,
  ST_GeomFromText('POLYGON((-0.130476 51.513, -0.128226 51.513, -0.128226 51.5144, -0.130476 51.5144, -0.130476 51.513))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5137)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '22e56245-17fb-4a16-a51e-08533ae0cc5b',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-613',
  '{"tr": "Dean Street · Ada Kümesi 7", "en": "Dean Street · Block Cluster 7"}'::jsonb,
  'Dean Street',
  24227,
  ST_GeomFromText('POLYGON((-0.128226 51.513, -0.125977 51.513, -0.125977 51.5144, -0.128226 51.5144, -0.128226 51.513))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5137)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2ba91a3f-e5b4-4a20-ae1d-a01f115dd45f',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-650',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24238,
  ST_GeomFromText('POLYGON((-0.125977 51.513, -0.123727 51.513, -0.123727 51.5144, -0.125977 51.5144, -0.125977 51.513))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5137)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5571cf34-dec2-45a1-abb3-fa95343404d5',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-464',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((-0.141724 51.5144, -0.139474 51.5144, -0.139474 51.5158, -0.141724 51.5158, -0.141724 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5151)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3094cf18-d86c-4879-a8f8-17610901a791',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-501',
  '{"tr": "Old Compton Street · Ada Kümesi 74", "en": "Old Compton Street · Block Cluster 74"}'::jsonb,
  'Old Compton Street',
  24227,
  ST_GeomFromText('POLYGON((-0.139474 51.5144, -0.137225 51.5144, -0.137225 51.5158, -0.139474 51.5158, -0.139474 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5151)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd9b5a6ce-1ed2-4cc4-a767-da0af8882392',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-538',
  '{"tr": "Beak Street · Ada Kümesi 81", "en": "Beak Street · Block Cluster 81"}'::jsonb,
  'Beak Street',
  24236,
  ST_GeomFromText('POLYGON((-0.137225 51.5144, -0.134975 51.5144, -0.134975 51.5158, -0.137225 51.5158, -0.137225 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5151)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0268db86-f14d-451e-a325-9e98f3b620a4',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-575',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 88", "en": "Shaftesbury Avenue · Block Cluster 88"}'::jsonb,
  'Shaftesbury Avenue',
  24227,
  ST_GeomFromText('POLYGON((-0.134975 51.5144, -0.132726 51.5144, -0.132726 51.5158, -0.134975 51.5158, -0.134975 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5151)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7e89c557-25e8-481d-ab61-8d4aa4720d74',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-612',
  '{"tr": "Greek Street · Ada Kümesi 6", "en": "Greek Street · Block Cluster 6"}'::jsonb,
  'Greek Street',
  24236,
  ST_GeomFromText('POLYGON((-0.132726 51.5144, -0.130476 51.5144, -0.130476 51.5158, -0.132726 51.5158, -0.132726 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5151)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b1c834c4-ecf9-454d-ad31-71899ec17a11',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-649',
  '{"tr": "Dean Street · Ada Kümesi 13", "en": "Dean Street · Block Cluster 13"}'::jsonb,
  'Dean Street',
  24236,
  ST_GeomFromText('POLYGON((-0.130476 51.5144, -0.128226 51.5144, -0.128226 51.5158, -0.130476 51.5158, -0.130476 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5151)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '374dcecc-faa0-4775-aded-f9b931ee0641',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-686',
  '{"tr": "Greek Street · Ada Kümesi 20", "en": "Greek Street · Block Cluster 20"}'::jsonb,
  'Greek Street',
  24227,
  ST_GeomFromText('POLYGON((-0.128226 51.5144, -0.125977 51.5144, -0.125977 51.5158, -0.128226 51.5158, -0.128226 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5151)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4bcc6b6e-0682-474c-ad4e-cc22524f12ba',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-723',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((-0.125977 51.5144, -0.123727 51.5144, -0.123727 51.5158, -0.125977 51.5158, -0.125977 51.5144))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5151)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd60a0683-16d5-402b-a0df-b6a8ecdfb6ae',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-537',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((-0.141724 51.5158, -0.139474 51.5158, -0.139474 51.5172, -0.141724 51.5172, -0.141724 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5165)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '01e6fe46-4f6f-4bc6-ae89-05805156fa0c',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-574',
  '{"tr": "Beak Street · Ada Kümesi 87", "en": "Beak Street · Block Cluster 87"}'::jsonb,
  'Beak Street',
  24225,
  ST_GeomFromText('POLYGON((-0.139474 51.5158, -0.137225 51.5158, -0.137225 51.5172, -0.139474 51.5172, -0.139474 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5165)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1a8fc2a5-8f70-416a-a5ff-a3cfaa00240f',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-611',
  '{"tr": "Oxford Street · Ada Kümesi 5", "en": "Oxford Street · Block Cluster 5"}'::jsonb,
  'Oxford Street',
  24236,
  ST_GeomFromText('POLYGON((-0.137225 51.5158, -0.134975 51.5158, -0.134975 51.5172, -0.137225 51.5172, -0.137225 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5165)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ec4b469c-817a-4362-ad31-55fe6dc559fe',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-648',
  '{"tr": "Beak Street · Ada Kümesi 12", "en": "Beak Street · Block Cluster 12"}'::jsonb,
  'Beak Street',
  24225,
  ST_GeomFromText('POLYGON((-0.134975 51.5158, -0.132726 51.5158, -0.132726 51.5172, -0.134975 51.5172, -0.134975 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5165)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '35ceb512-4499-496e-a157-1c7c7a685e80',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-685',
  '{"tr": "Old Compton Street · Ada Kümesi 19", "en": "Old Compton Street · Block Cluster 19"}'::jsonb,
  'Old Compton Street',
  24236,
  ST_GeomFromText('POLYGON((-0.132726 51.5158, -0.130476 51.5158, -0.130476 51.5172, -0.132726 51.5172, -0.132726 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5165)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f03834e5-3333-4c16-a30b-b8f3236bc0fb',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-722',
  '{"tr": "Broadwick Street · Ada Kümesi 26", "en": "Broadwick Street · Block Cluster 26"}'::jsonb,
  'Broadwick Street',
  24236,
  ST_GeomFromText('POLYGON((-0.130476 51.5158, -0.128226 51.5158, -0.128226 51.5172, -0.130476 51.5172, -0.130476 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5165)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3279b213-8271-4daa-a008-efb9b4eb0fbd',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-759',
  '{"tr": "Oxford Street · Ada Kümesi 33", "en": "Oxford Street · Block Cluster 33"}'::jsonb,
  'Oxford Street',
  24225,
  ST_GeomFromText('POLYGON((-0.128226 51.5158, -0.125977 51.5158, -0.125977 51.5172, -0.128226 51.5172, -0.128226 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5165)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '78724cfe-2989-4328-a1fb-7fd6a1fb8026',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-796',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((-0.125977 51.5158, -0.123727 51.5158, -0.123727 51.5172, -0.125977 51.5172, -0.125977 51.5158))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5165)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b428db47-5576-4550-a15e-3e17099fc097',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-610',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-0.141724 51.5172, -0.139474 51.5172, -0.139474 51.5186, -0.141724 51.5186, -0.141724 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.140599 51.5179)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f5bd75af-8c7d-4e7c-a9c0-ebd3823b142b',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-647',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 11", "en": "Shaftesbury Avenue · Block Cluster 11"}'::jsonb,
  'Shaftesbury Avenue',
  24225,
  ST_GeomFromText('POLYGON((-0.139474 51.5172, -0.137225 51.5172, -0.137225 51.5186, -0.139474 51.5186, -0.139474 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.138349 51.5179)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dd3a28f2-35e4-485b-a8de-00a9131e514d',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-684',
  '{"tr": "Broadwick Street · Ada Kümesi 18", "en": "Broadwick Street · Block Cluster 18"}'::jsonb,
  'Broadwick Street',
  24235,
  ST_GeomFromText('POLYGON((-0.137225 51.5172, -0.134975 51.5172, -0.134975 51.5186, -0.137225 51.5186, -0.137225 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.1361 51.5179)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'acc7d05f-5baa-4583-a76d-95dc087215e2',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-721',
  '{"tr": "Wardour Street · Ada Kümesi 25", "en": "Wardour Street · Block Cluster 25"}'::jsonb,
  'Wardour Street',
  24225,
  ST_GeomFromText('POLYGON((-0.134975 51.5172, -0.132726 51.5172, -0.132726 51.5186, -0.134975 51.5186, -0.134975 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.13385 51.5179)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f2cbf9e2-e21e-4ed5-a0d5-5737d4eaa8b7',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-758',
  '{"tr": "Broadwick Street · Ada Kümesi 32", "en": "Broadwick Street · Block Cluster 32"}'::jsonb,
  'Broadwick Street',
  24235,
  ST_GeomFromText('POLYGON((-0.132726 51.5172, -0.130476 51.5172, -0.130476 51.5186, -0.132726 51.5186, -0.132726 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.131601 51.5179)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f5ffd4de-a5de-4199-a021-05479bdea677',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-795',
  '{"tr": "Shaftesbury Avenue · Ada Kümesi 39", "en": "Shaftesbury Avenue · Block Cluster 39"}'::jsonb,
  'Shaftesbury Avenue',
  24235,
  ST_GeomFromText('POLYGON((-0.130476 51.5172, -0.128226 51.5172, -0.128226 51.5186, -0.130476 51.5186, -0.130476 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.129351 51.5179)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '95583da1-6b81-4c07-aed9-11a600d969a8',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-SOH-832',
  '{"tr": "Greek Street · Ada Kümesi 46", "en": "Greek Street · Block Cluster 46"}'::jsonb,
  'Greek Street',
  24225,
  ST_GeomFromText('POLYGON((-0.128226 51.5172, -0.125977 51.5172, -0.125977 51.5186, -0.128226 51.5186, -0.128226 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.127101 51.5179)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3f3c7f09-3ee9-4a12-a1d5-d51b7e26291b',
  'a0000000-0000-0000-0000-000000000003',
  'GB-WES-MRK-869',
  '{"tr": "Westminster Şehir Caddeleri", "en": "City of Westminster City Streets"}'::jsonb,
  'Westminster Westminster Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((-0.125977 51.5172, -0.123727 51.5172, -0.123727 51.5186, -0.125977 51.5186, -0.125977 51.5172))', 4326),
  ST_GeomFromText('POINT(-0.124852 51.5179)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '97cf847e-a7d0-4b46-a01f-7f383fa07fc4',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-403',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((2.323823 48.8544, 2.325951 48.8544, 2.325951 48.8558, 2.323823 48.8558, 2.323823 48.8544))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8551)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a8cd2c0b-dbd7-408c-a31a-ec8784a4ec97',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-440',
  '{"tr": "Rue Montmartre · Ada Kümesi 13", "en": "Rue Montmartre · Block Cluster 13"}'::jsonb,
  'Rue Montmartre',
  24236,
  ST_GeomFromText('POLYGON((2.325951 48.8544, 2.328079 48.8544, 2.328079 48.8558, 2.325951 48.8558, 2.325951 48.8544))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8551)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '55d94003-e11f-4bf4-a4c6-6bf736f86bf7',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-477',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 20", "en": "Quai François Mitterrand · Block Cluster 20"}'::jsonb,
  'Quai François Mitterrand',
  24236,
  ST_GeomFromText('POLYGON((2.328079 48.8544, 2.330207 48.8544, 2.330207 48.8558, 2.328079 48.8558, 2.328079 48.8544))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8551)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bf02578b-59e8-4a26-a6ea-5dad18ea61b1',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-514',
  '{"tr": "Rue Montmartre · Ada Kümesi 27", "en": "Rue Montmartre · Block Cluster 27"}'::jsonb,
  'Rue Montmartre',
  24236,
  ST_GeomFromText('POLYGON((2.330207 48.8544, 2.332335 48.8544, 2.332335 48.8558, 2.330207 48.8558, 2.330207 48.8544))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8551)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '26fbec0d-b839-40c6-aec2-cccbdf350cd3',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-551',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 34", "en": "Boulevard de Sébastopol · Block Cluster 34"}'::jsonb,
  'Boulevard de Sébastopol',
  24236,
  ST_GeomFromText('POLYGON((2.332335 48.8544, 2.334463 48.8544, 2.334463 48.8558, 2.332335 48.8558, 2.332335 48.8544))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8551)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b62bef18-2d09-4db7-ab22-52afe335accf',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-588',
  '{"tr": "Rue Montmartre · Ada Kümesi 41", "en": "Rue Montmartre · Block Cluster 41"}'::jsonb,
  'Rue Montmartre',
  24236,
  ST_GeomFromText('POLYGON((2.334463 48.8544, 2.336591 48.8544, 2.336591 48.8558, 2.334463 48.8558, 2.334463 48.8544))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8551)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '21d3c969-ce47-40e3-af94-798af01b7a4c',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-625',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 48", "en": "Quai François Mitterrand · Block Cluster 48"}'::jsonb,
  'Quai François Mitterrand',
  24236,
  ST_GeomFromText('POLYGON((2.336591 48.8544, 2.338719 48.8544, 2.338719 48.8558, 2.336591 48.8558, 2.336591 48.8544))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8551)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'db1dac3e-f4b6-4f44-afab-937acfd3eb82',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-662',
  '{"tr": "Rue Montmartre · Ada Kümesi 55", "en": "Rue Montmartre · Block Cluster 55"}'::jsonb,
  'Rue Montmartre',
  24236,
  ST_GeomFromText('POLYGON((2.338719 48.8544, 2.340847 48.8544, 2.340847 48.8558, 2.338719 48.8558, 2.338719 48.8544))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8551)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd34f9d7e-7e88-4138-adc7-7c4651d87eb6',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-699',
  '{"tr": "Rue de Rivoli · Ada Kümesi 62", "en": "Rue de Rivoli · Block Cluster 62"}'::jsonb,
  'Rue de Rivoli',
  24236,
  ST_GeomFromText('POLYGON((2.340847 48.8544, 2.342975 48.8544, 2.342975 48.8558, 2.340847 48.8558, 2.340847 48.8544))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8551)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9c64fde1-fdd1-43c0-a1b5-5e219a36a1a1',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-736',
  '{"tr": "Rue Montmartre · Ada Kümesi 69", "en": "Rue Montmartre · Block Cluster 69"}'::jsonb,
  'Rue Montmartre',
  24236,
  ST_GeomFromText('POLYGON((2.342975 48.8544, 2.345103 48.8544, 2.345103 48.8558, 2.342975 48.8558, 2.342975 48.8544))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8551)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '80f8aab5-246a-4cf7-a492-6642a56377ac',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-773',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 76", "en": "Quai François Mitterrand · Block Cluster 76"}'::jsonb,
  'Quai François Mitterrand',
  24236,
  ST_GeomFromText('POLYGON((2.345103 48.8544, 2.347231 48.8544, 2.347231 48.8558, 2.345103 48.8558, 2.345103 48.8544))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8551)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fa3c05c2-5bc1-40d1-a1fd-f51355fdf693',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-810',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((2.347231 48.8544, 2.349359 48.8544, 2.349359 48.8558, 2.347231 48.8558, 2.347231 48.8544))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8551)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bec0c08a-87e4-45c0-a924-154a46a5964a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-476',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((2.323823 48.8558, 2.325951 48.8558, 2.325951 48.8572, 2.323823 48.8572, 2.323823 48.8558))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8565)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c790576b-7183-4569-a613-820239142cd4',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-513',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 26", "en": "Rue Saint-Honoré · Block Cluster 26"}'::jsonb,
  'Rue Saint-Honoré',
  24236,
  ST_GeomFromText('POLYGON((2.325951 48.8558, 2.328079 48.8558, 2.328079 48.8572, 2.325951 48.8572, 2.325951 48.8558))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8565)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '08f7a166-0081-42c6-a876-e3a00978e42c',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-550',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 33", "en": "Rue Jean-Jacques Rousseau · Block Cluster 33"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24236,
  ST_GeomFromText('POLYGON((2.328079 48.8558, 2.330207 48.8558, 2.330207 48.8572, 2.328079 48.8572, 2.328079 48.8558))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8565)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fa7375cf-7b0e-44af-a17d-716075817a7e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-587',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 40", "en": "Boulevard de Sébastopol · Block Cluster 40"}'::jsonb,
  'Boulevard de Sébastopol',
  24236,
  ST_GeomFromText('POLYGON((2.330207 48.8558, 2.332335 48.8558, 2.332335 48.8572, 2.330207 48.8572, 2.330207 48.8558))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8565)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '25b35a52-8fbf-45c8-aa0c-1f9ab572a01a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-624',
  '{"tr": "Rue du Louvre · Ada Kümesi 47", "en": "Rue du Louvre · Block Cluster 47"}'::jsonb,
  'Rue du Louvre',
  24236,
  ST_GeomFromText('POLYGON((2.332335 48.8558, 2.334463 48.8558, 2.334463 48.8572, 2.332335 48.8572, 2.332335 48.8558))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8565)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5a64831d-a732-40ac-ad56-c3b10196c3c9',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-661',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 54", "en": "Rue Saint-Honoré · Block Cluster 54"}'::jsonb,
  'Rue Saint-Honoré',
  24236,
  ST_GeomFromText('POLYGON((2.334463 48.8558, 2.336591 48.8558, 2.336591 48.8572, 2.334463 48.8572, 2.334463 48.8558))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8565)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0fde32c5-43b6-45fe-ac68-473b5394a8c3',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-698',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 61", "en": "Rue Jean-Jacques Rousseau · Block Cluster 61"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24236,
  ST_GeomFromText('POLYGON((2.336591 48.8558, 2.338719 48.8558, 2.338719 48.8572, 2.336591 48.8572, 2.336591 48.8558))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8565)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f5d8ea0a-832e-46d3-a6f6-fcd9790700dd',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-735',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 68", "en": "Avenue de l’Opéra · Block Cluster 68"}'::jsonb,
  'Avenue de l’Opéra',
  24236,
  ST_GeomFromText('POLYGON((2.338719 48.8558, 2.340847 48.8558, 2.340847 48.8572, 2.338719 48.8572, 2.338719 48.8558))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8565)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b939c354-5c56-4be8-a56f-c8bc158fcf3c',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-772',
  '{"tr": "Rue de Richelieu · Ada Kümesi 75", "en": "Rue de Richelieu · Block Cluster 75"}'::jsonb,
  'Rue de Richelieu',
  24236,
  ST_GeomFromText('POLYGON((2.340847 48.8558, 2.342975 48.8558, 2.342975 48.8572, 2.340847 48.8572, 2.340847 48.8558))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8565)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f0a43ddf-4729-4491-a78d-a94e37cdd270',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-809',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 82", "en": "Rue Saint-Honoré · Block Cluster 82"}'::jsonb,
  'Rue Saint-Honoré',
  24236,
  ST_GeomFromText('POLYGON((2.342975 48.8558, 2.345103 48.8558, 2.345103 48.8572, 2.342975 48.8572, 2.342975 48.8558))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8565)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b10c0325-7ed5-4e4e-afd9-dd6b2fe1e173',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-846',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 89", "en": "Rue Jean-Jacques Rousseau · Block Cluster 89"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24236,
  ST_GeomFromText('POLYGON((2.345103 48.8558, 2.347231 48.8558, 2.347231 48.8572, 2.345103 48.8572, 2.345103 48.8558))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8565)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9ffd110d-5bb1-472e-a44c-0623fbae283b',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-883',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24236,
  ST_GeomFromText('POLYGON((2.347231 48.8558, 2.349359 48.8558, 2.349359 48.8572, 2.347231 48.8572, 2.347231 48.8558))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8565)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '40819e32-047e-497c-a4ff-474e450077ae',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-549',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((2.323823 48.8572, 2.325951 48.8572, 2.325951 48.8586, 2.323823 48.8586, 2.323823 48.8572))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8579)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7d81bccd-0abf-4d0a-a73e-c1c7884139d7',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-586',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 39", "en": "Rue Jean-Jacques Rousseau · Block Cluster 39"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24235,
  ST_GeomFromText('POLYGON((2.325951 48.8572, 2.328079 48.8572, 2.328079 48.8586, 2.325951 48.8586, 2.325951 48.8572))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8579)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b7fb78b2-337c-4dd6-a487-e564eb781688',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-623',
  '{"tr": "Rue de Rivoli · Ada Kümesi 46", "en": "Rue de Rivoli · Block Cluster 46"}'::jsonb,
  'Rue de Rivoli',
  24235,
  ST_GeomFromText('POLYGON((2.328079 48.8572, 2.330207 48.8572, 2.330207 48.8586, 2.328079 48.8586, 2.328079 48.8572))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8579)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '29648cdf-ca5d-4d37-a339-b1e8f3c1ca16',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-660',
  '{"tr": "Rue du Louvre · Ada Kümesi 53", "en": "Rue du Louvre · Block Cluster 53"}'::jsonb,
  'Rue du Louvre',
  24235,
  ST_GeomFromText('POLYGON((2.330207 48.8572, 2.332335 48.8572, 2.332335 48.8586, 2.330207 48.8586, 2.330207 48.8572))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8579)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f82f0e39-279f-4a09-afb0-84301fce9842',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-697',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 60", "en": "Rue Saint-Honoré · Block Cluster 60"}'::jsonb,
  'Rue Saint-Honoré',
  24235,
  ST_GeomFromText('POLYGON((2.332335 48.8572, 2.334463 48.8572, 2.334463 48.8586, 2.332335 48.8586, 2.332335 48.8572))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8579)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '27f8422a-b028-4f92-a7d0-2db8d820b1bc',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-734',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 67", "en": "Rue Jean-Jacques Rousseau · Block Cluster 67"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24235,
  ST_GeomFromText('POLYGON((2.334463 48.8572, 2.336591 48.8572, 2.336591 48.8586, 2.334463 48.8586, 2.334463 48.8572))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8579)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5c550d10-db92-46de-a7c7-6bce37e773ee',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-771',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 74", "en": "Boulevard de Sébastopol · Block Cluster 74"}'::jsonb,
  'Boulevard de Sébastopol',
  24235,
  ST_GeomFromText('POLYGON((2.336591 48.8572, 2.338719 48.8572, 2.338719 48.8586, 2.336591 48.8586, 2.336591 48.8572))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8579)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0d208ae4-fd54-4059-a074-babd0a74bb3d',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-808',
  '{"tr": "Rue de Richelieu · Ada Kümesi 81", "en": "Rue de Richelieu · Block Cluster 81"}'::jsonb,
  'Rue de Richelieu',
  24235,
  ST_GeomFromText('POLYGON((2.338719 48.8572, 2.340847 48.8572, 2.340847 48.8586, 2.338719 48.8586, 2.338719 48.8572))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8579)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6f31f583-1f58-4988-a069-fc0b8e89ff0b',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-845',
  '{"tr": "Rue de Turbigo · Ada Kümesi 88", "en": "Rue de Turbigo · Block Cluster 88"}'::jsonb,
  'Rue de Turbigo',
  24235,
  ST_GeomFromText('POLYGON((2.340847 48.8572, 2.342975 48.8572, 2.342975 48.8586, 2.340847 48.8586, 2.340847 48.8572))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8579)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f403e062-b841-454e-ac42-352cac45b5b0',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-882',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 6", "en": "Rue Jean-Jacques Rousseau · Block Cluster 6"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24235,
  ST_GeomFromText('POLYGON((2.342975 48.8572, 2.345103 48.8572, 2.345103 48.8586, 2.342975 48.8586, 2.342975 48.8572))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8579)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3febb7d1-df84-4f28-a06f-78f91f7086f9',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-919',
  '{"tr": "Rue de Rivoli · Ada Kümesi 13", "en": "Rue de Rivoli · Block Cluster 13"}'::jsonb,
  'Rue de Rivoli',
  24235,
  ST_GeomFromText('POLYGON((2.345103 48.8572, 2.347231 48.8572, 2.347231 48.8586, 2.345103 48.8586, 2.345103 48.8572))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8579)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2184c7ba-bded-41b7-ac69-e60ddf71e971',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-956',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((2.347231 48.8572, 2.349359 48.8572, 2.349359 48.8586, 2.347231 48.8586, 2.347231 48.8572))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8579)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ff1f5901-b5d6-4538-aac9-2c39b4f5ce39',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-622',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((2.323823 48.8586, 2.325951 48.8586, 2.325951 48.86, 2.323823 48.86, 2.323823 48.8586))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8593)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '84f3c3ab-b16d-4877-a59e-5bdc36615c22',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-659',
  '{"tr": "Rue de Rivoli · Ada Kümesi 52", "en": "Rue de Rivoli · Block Cluster 52"}'::jsonb,
  'Rue de Rivoli',
  24235,
  ST_GeomFromText('POLYGON((2.325951 48.8586, 2.328079 48.8586, 2.328079 48.86, 2.325951 48.86, 2.325951 48.8586))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8593)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c0e775ee-2e59-454c-aebe-f0a2ef40fb3a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-696',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 59", "en": "Rue Croix des Petits Champs · Block Cluster 59"}'::jsonb,
  'Rue Croix des Petits Champs',
  24235,
  ST_GeomFromText('POLYGON((2.328079 48.8586, 2.330207 48.8586, 2.330207 48.86, 2.328079 48.86, 2.328079 48.8586))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8593)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '858e241a-d1d0-4c9f-a45e-1885575e60b9',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-733',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 66", "en": "Rue Saint-Honoré · Block Cluster 66"}'::jsonb,
  'Rue Saint-Honoré',
  24235,
  ST_GeomFromText('POLYGON((2.330207 48.8586, 2.332335 48.8586, 2.332335 48.86, 2.330207 48.86, 2.330207 48.8586))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8593)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e89739d9-98b1-4a06-a026-33df814843df',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-770',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 73", "en": "Rue Croix des Petits Champs · Block Cluster 73"}'::jsonb,
  'Rue Croix des Petits Champs',
  24235,
  ST_GeomFromText('POLYGON((2.332335 48.8586, 2.334463 48.8586, 2.334463 48.86, 2.332335 48.86, 2.332335 48.8586))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8593)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ca5b80df-212c-475c-ab77-e783eb87e83b',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-807',
  '{"tr": "Rue de Rivoli · Ada Kümesi 80", "en": "Rue de Rivoli · Block Cluster 80"}'::jsonb,
  'Rue de Rivoli',
  24235,
  ST_GeomFromText('POLYGON((2.334463 48.8586, 2.336591 48.8586, 2.336591 48.86, 2.334463 48.86, 2.334463 48.8586))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8593)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2c93d6f2-ac2e-4500-a0bd-83f2d8c22bf2',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-844',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 87", "en": "Rue Croix des Petits Champs · Block Cluster 87"}'::jsonb,
  'Rue Croix des Petits Champs',
  24235,
  ST_GeomFromText('POLYGON((2.336591 48.8586, 2.338719 48.8586, 2.338719 48.86, 2.336591 48.86, 2.336591 48.8586))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8593)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b83a168b-3525-43da-ad1f-6551ed5f8a65',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-881',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 5", "en": "Rue Saint-Honoré · Block Cluster 5"}'::jsonb,
  'Rue Saint-Honoré',
  24235,
  ST_GeomFromText('POLYGON((2.338719 48.8586, 2.340847 48.8586, 2.340847 48.86, 2.338719 48.86, 2.338719 48.8586))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8593)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '020bd5a2-6f65-4710-ad6e-d2b27170dcb2',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-918',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 12", "en": "Rue Croix des Petits Champs · Block Cluster 12"}'::jsonb,
  'Rue Croix des Petits Champs',
  24235,
  ST_GeomFromText('POLYGON((2.340847 48.8586, 2.342975 48.8586, 2.342975 48.86, 2.340847 48.86, 2.340847 48.8586))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8593)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cfedc571-6fe9-42fc-a004-a78d3fd7286d',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-955',
  '{"tr": "Rue de Rivoli · Ada Kümesi 19", "en": "Rue de Rivoli · Block Cluster 19"}'::jsonb,
  'Rue de Rivoli',
  24235,
  ST_GeomFromText('POLYGON((2.342975 48.8586, 2.345103 48.8586, 2.345103 48.86, 2.342975 48.86, 2.342975 48.8586))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8593)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2f781f44-e07e-4ce6-af06-83a20ff6bc2a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-992',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 26", "en": "Rue Croix des Petits Champs · Block Cluster 26"}'::jsonb,
  'Rue Croix des Petits Champs',
  24235,
  ST_GeomFromText('POLYGON((2.345103 48.8586, 2.347231 48.8586, 2.347231 48.86, 2.345103 48.86, 2.345103 48.8586))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8593)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1d657c03-3fd4-4d8a-a2b1-f1895d3a098d',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-030',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24235,
  ST_GeomFromText('POLYGON((2.347231 48.8586, 2.349359 48.8586, 2.349359 48.86, 2.347231 48.86, 2.347231 48.8586))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8593)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a5addca4-9696-4b83-a33b-a7273c445827',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-695',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((2.323823 48.86, 2.325951 48.86, 2.325951 48.8614, 2.323823 48.8614, 2.323823 48.86))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8607)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e7e2c9ba-fe27-4244-a9c5-1bfee60a9bfe',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-732',
  '{"tr": "Rue du Louvre · Ada Kümesi 65", "en": "Rue du Louvre · Block Cluster 65"}'::jsonb,
  'Rue du Louvre',
  24233,
  ST_GeomFromText('POLYGON((2.325951 48.86, 2.328079 48.86, 2.328079 48.8614, 2.325951 48.8614, 2.325951 48.86))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8607)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f01ec256-3463-4665-a47d-7433248278bb',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-769',
  '{"tr": "Rue de Turbigo · Ada Kümesi 72", "en": "Rue de Turbigo · Block Cluster 72"}'::jsonb,
  'Rue de Turbigo',
  24233,
  ST_GeomFromText('POLYGON((2.328079 48.86, 2.330207 48.86, 2.330207 48.8614, 2.328079 48.8614, 2.328079 48.86))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8607)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '763bed29-c66c-4f27-a057-f20e3ca80c50',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-806',
  '{"tr": "Rue du Louvre · Ada Kümesi 79", "en": "Rue du Louvre · Block Cluster 79"}'::jsonb,
  'Rue du Louvre',
  24233,
  ST_GeomFromText('POLYGON((2.330207 48.86, 2.332335 48.86, 2.332335 48.8614, 2.330207 48.8614, 2.330207 48.86))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8607)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cb93a3ee-ace4-4c28-a777-efc67877f016',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-843',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 86", "en": "Avenue de l’Opéra · Block Cluster 86"}'::jsonb,
  'Avenue de l’Opéra',
  24233,
  ST_GeomFromText('POLYGON((2.332335 48.86, 2.334463 48.86, 2.334463 48.8614, 2.332335 48.8614, 2.332335 48.86))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8607)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'eef6ad89-ba25-49f3-a4d3-547aa91ca77c',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-880',
  '{"tr": "Rue Montmartre · Ada Kümesi 4", "en": "Rue Montmartre · Block Cluster 4"}'::jsonb,
  'Rue Montmartre',
  24233,
  ST_GeomFromText('POLYGON((2.334463 48.86, 2.336591 48.86, 2.336591 48.8614, 2.334463 48.8614, 2.334463 48.86))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8607)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c071ef00-485c-4801-a82d-f70108ce0701',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-917',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 11", "en": "Rue Saint-Honoré · Block Cluster 11"}'::jsonb,
  'Rue Saint-Honoré',
  24233,
  ST_GeomFromText('POLYGON((2.336591 48.86, 2.338719 48.86, 2.338719 48.8614, 2.336591 48.8614, 2.336591 48.86))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8607)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '34f7e6ab-64b9-4045-a04e-36ee99b1b6f0',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-954',
  '{"tr": "Rue Montmartre · Ada Kümesi 18", "en": "Rue Montmartre · Block Cluster 18"}'::jsonb,
  'Rue Montmartre',
  24233,
  ST_GeomFromText('POLYGON((2.338719 48.86, 2.340847 48.86, 2.340847 48.8614, 2.338719 48.8614, 2.338719 48.86))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8607)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4c3a9039-6629-47cf-aa13-87f6b263a808',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-991',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 25", "en": "Avenue de l’Opéra · Block Cluster 25"}'::jsonb,
  'Avenue de l’Opéra',
  24233,
  ST_GeomFromText('POLYGON((2.340847 48.86, 2.342975 48.86, 2.342975 48.8614, 2.340847 48.8614, 2.340847 48.86))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8607)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0b95a491-83d3-4d58-a846-59c98f69a1e9',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-029',
  '{"tr": "Rue du Louvre · Ada Kümesi 32", "en": "Rue du Louvre · Block Cluster 32"}'::jsonb,
  'Rue du Louvre',
  24233,
  ST_GeomFromText('POLYGON((2.342975 48.86, 2.345103 48.86, 2.345103 48.8614, 2.342975 48.8614, 2.342975 48.86))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8607)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f9d7dbfc-88b6-4bae-a161-3052828ec7aa',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-066',
  '{"tr": "Rue de Turbigo · Ada Kümesi 39", "en": "Rue de Turbigo · Block Cluster 39"}'::jsonb,
  'Rue de Turbigo',
  24233,
  ST_GeomFromText('POLYGON((2.345103 48.86, 2.347231 48.86, 2.347231 48.8614, 2.345103 48.8614, 2.345103 48.86))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8607)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0687d098-291b-4ed2-af9c-4e4a2fa36f6a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-103',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((2.347231 48.86, 2.349359 48.86, 2.349359 48.8614, 2.347231 48.8614, 2.347231 48.86))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8607)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0ea0807f-7192-4512-af32-556d80335591',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-768',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((2.323823 48.8614, 2.325951 48.8614, 2.325951 48.8628, 2.323823 48.8628, 2.323823 48.8614))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8621)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c04beb8e-c2e2-4476-a2a9-0ff8832ed004',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-805',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 78", "en": "Quai François Mitterrand · Block Cluster 78"}'::jsonb,
  'Quai François Mitterrand',
  24233,
  ST_GeomFromText('POLYGON((2.325951 48.8614, 2.328079 48.8614, 2.328079 48.8628, 2.325951 48.8628, 2.325951 48.8614))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8621)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0661bd37-ca95-4a57-acf4-c760d0f7378e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-842',
  '{"tr": "Rue Montmartre · Ada Kümesi 85", "en": "Rue Montmartre · Block Cluster 85"}'::jsonb,
  'Rue Montmartre',
  24233,
  ST_GeomFromText('POLYGON((2.328079 48.8614, 2.330207 48.8614, 2.330207 48.8628, 2.328079 48.8628, 2.328079 48.8614))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8621)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd9d887ad-9ab9-451b-a361-22b674922cc8',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-879',
  '{"tr": "Rue de Rivoli · Ada Kümesi 3", "en": "Rue de Rivoli · Block Cluster 3"}'::jsonb,
  'Rue de Rivoli',
  24233,
  ST_GeomFromText('POLYGON((2.330207 48.8614, 2.332335 48.8614, 2.332335 48.8628, 2.330207 48.8628, 2.330207 48.8614))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8621)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0f99f343-7467-4b87-abfe-28c48401ceca',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-916',
  '{"tr": "Rue de Richelieu · Ada Kümesi 10", "en": "Rue de Richelieu · Block Cluster 10"}'::jsonb,
  'Rue de Richelieu',
  24233,
  ST_GeomFromText('POLYGON((2.332335 48.8614, 2.334463 48.8614, 2.334463 48.8628, 2.332335 48.8628, 2.332335 48.8614))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8621)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '354bed03-51f4-4a62-a4bf-c76187401765',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-953',
  '{"tr": "Rue de Turbigo · Ada Kümesi 17", "en": "Rue de Turbigo · Block Cluster 17"}'::jsonb,
  'Rue de Turbigo',
  24233,
  ST_GeomFromText('POLYGON((2.334463 48.8614, 2.336591 48.8614, 2.336591 48.8628, 2.334463 48.8628, 2.334463 48.8614))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8621)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '16f5bc7b-57d8-4b4d-a12d-87366ecdf7c8',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-990',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 24", "en": "Rue Jean-Jacques Rousseau · Block Cluster 24"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24233,
  ST_GeomFromText('POLYGON((2.336591 48.8614, 2.338719 48.8614, 2.338719 48.8628, 2.336591 48.8628, 2.336591 48.8614))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8621)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0e22fae0-5bcb-416f-a5e9-5b8f69ee9c4f',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-028',
  '{"tr": "Rue de Rivoli · Ada Kümesi 31", "en": "Rue de Rivoli · Block Cluster 31"}'::jsonb,
  'Rue de Rivoli',
  24233,
  ST_GeomFromText('POLYGON((2.338719 48.8614, 2.340847 48.8614, 2.340847 48.8628, 2.338719 48.8628, 2.338719 48.8614))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8621)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '11eeb8ce-d3f1-4246-a21f-9a88e5dfdb14',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-065',
  '{"tr": "Rue de Richelieu · Ada Kümesi 38", "en": "Rue de Richelieu · Block Cluster 38"}'::jsonb,
  'Rue de Richelieu',
  24233,
  ST_GeomFromText('POLYGON((2.340847 48.8614, 2.342975 48.8614, 2.342975 48.8628, 2.340847 48.8628, 2.340847 48.8614))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8621)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3b75a6e4-a9e8-4c95-a29d-4a71e55e9379',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-102',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 45", "en": "Quai François Mitterrand · Block Cluster 45"}'::jsonb,
  'Quai François Mitterrand',
  24233,
  ST_GeomFromText('POLYGON((2.342975 48.8614, 2.345103 48.8614, 2.345103 48.8628, 2.342975 48.8628, 2.342975 48.8614))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8621)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '25becca8-6bdd-4798-ae63-cb30919bd440',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-139',
  '{"tr": "Rue Montmartre · Ada Kümesi 52", "en": "Rue Montmartre · Block Cluster 52"}'::jsonb,
  'Rue Montmartre',
  24233,
  ST_GeomFromText('POLYGON((2.345103 48.8614, 2.347231 48.8614, 2.347231 48.8628, 2.345103 48.8628, 2.345103 48.8614))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8621)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9b797fb8-a414-49f4-af6d-364c3f8dc9ac',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-176',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((2.347231 48.8614, 2.349359 48.8614, 2.349359 48.8628, 2.347231 48.8628, 2.347231 48.8614))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8621)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f97582b7-6b29-418c-a25c-533b649f5443',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-841',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((2.323823 48.8628, 2.325951 48.8628, 2.325951 48.8642, 2.323823 48.8642, 2.323823 48.8628))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8635)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8c826c77-59c5-43cf-a547-ffb8e6480046',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-878',
  '{"tr": "Rue du Louvre · Ada Kümesi 2", "en": "Rue du Louvre · Block Cluster 2"}'::jsonb,
  'Rue du Louvre',
  24232,
  ST_GeomFromText('POLYGON((2.325951 48.8628, 2.328079 48.8628, 2.328079 48.8642, 2.325951 48.8642, 2.325951 48.8628))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8635)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0877e18d-c058-4bcb-a82f-1a46c8d0dd58',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-915',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 9", "en": "Avenue de l’Opéra · Block Cluster 9"}'::jsonb,
  'Avenue de l’Opéra',
  24232,
  ST_GeomFromText('POLYGON((2.328079 48.8628, 2.330207 48.8628, 2.330207 48.8642, 2.328079 48.8642, 2.328079 48.8628))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8635)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0922acd6-6502-4fa8-ac20-c37e6e251c7e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-952',
  '{"tr": "Rue de Richelieu · Ada Kümesi 16", "en": "Rue de Richelieu · Block Cluster 16"}'::jsonb,
  'Rue de Richelieu',
  24232,
  ST_GeomFromText('POLYGON((2.330207 48.8628, 2.332335 48.8628, 2.332335 48.8642, 2.330207 48.8642, 2.330207 48.8628))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8635)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '88c9bb4c-7e92-478a-a65b-1cc6075c62d6',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-989',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 23", "en": "Quai François Mitterrand · Block Cluster 23"}'::jsonb,
  'Quai François Mitterrand',
  24232,
  ST_GeomFromText('POLYGON((2.332335 48.8628, 2.334463 48.8628, 2.334463 48.8642, 2.332335 48.8642, 2.332335 48.8628))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8635)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fdd0cf3c-3afb-4e29-a72b-311538cccd65',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-027',
  '{"tr": "Rue Montmartre · Ada Kümesi 30", "en": "Rue Montmartre · Block Cluster 30"}'::jsonb,
  'Rue Montmartre',
  24232,
  ST_GeomFromText('POLYGON((2.334463 48.8628, 2.336591 48.8628, 2.336591 48.8642, 2.334463 48.8642, 2.334463 48.8628))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8635)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd7c6c79e-2c0d-4c17-abcb-1b8903d4a3b5',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-064',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 37", "en": "Avenue de l’Opéra · Block Cluster 37"}'::jsonb,
  'Avenue de l’Opéra',
  24232,
  ST_GeomFromText('POLYGON((2.336591 48.8628, 2.338719 48.8628, 2.338719 48.8642, 2.336591 48.8642, 2.336591 48.8628))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8635)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4e431f35-dce1-4a2c-a2a2-e5192b251961',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-101',
  '{"tr": "Rue de Richelieu · Ada Kümesi 44", "en": "Rue de Richelieu · Block Cluster 44"}'::jsonb,
  'Rue de Richelieu',
  24232,
  ST_GeomFromText('POLYGON((2.338719 48.8628, 2.340847 48.8628, 2.340847 48.8642, 2.338719 48.8642, 2.338719 48.8628))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8635)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bc497b38-b5e8-4690-a9a1-9da8723261c8',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-138',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 51", "en": "Quai François Mitterrand · Block Cluster 51"}'::jsonb,
  'Quai François Mitterrand',
  24232,
  ST_GeomFromText('POLYGON((2.340847 48.8628, 2.342975 48.8628, 2.342975 48.8642, 2.340847 48.8642, 2.340847 48.8628))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8635)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '01a80a98-493d-4ad9-a895-40414ae55571',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-175',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 58", "en": "Rue Jean-Jacques Rousseau · Block Cluster 58"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24232,
  ST_GeomFromText('POLYGON((2.342975 48.8628, 2.345103 48.8628, 2.345103 48.8642, 2.342975 48.8642, 2.342975 48.8628))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8635)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '542dbf22-8097-4c66-a4ba-2344d4c55b88',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-212',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 65", "en": "Avenue de l’Opéra · Block Cluster 65"}'::jsonb,
  'Avenue de l’Opéra',
  24232,
  ST_GeomFromText('POLYGON((2.345103 48.8628, 2.347231 48.8628, 2.347231 48.8642, 2.345103 48.8642, 2.345103 48.8628))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8635)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '47f6dec5-c8df-4d69-af29-b3ac10d64c2e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-249',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((2.347231 48.8628, 2.349359 48.8628, 2.349359 48.8642, 2.347231 48.8642, 2.347231 48.8628))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8635)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '53bdd945-fd09-4c33-aeb4-157650c7a578',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-914',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((2.323823 48.8642, 2.325951 48.8642, 2.325951 48.8656, 2.323823 48.8656, 2.323823 48.8642))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8649)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e85e8ace-c0fb-4df7-a8a5-9739a959a8c5',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-951',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 15", "en": "Avenue de l’Opéra · Block Cluster 15"}'::jsonb,
  'Avenue de l’Opéra',
  24232,
  ST_GeomFromText('POLYGON((2.325951 48.8642, 2.328079 48.8642, 2.328079 48.8656, 2.325951 48.8656, 2.325951 48.8642))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8649)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '541c13f1-089a-4f47-ac86-ccb65cb6f338',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-988',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 22", "en": "Rue Croix des Petits Champs · Block Cluster 22"}'::jsonb,
  'Rue Croix des Petits Champs',
  24232,
  ST_GeomFromText('POLYGON((2.328079 48.8642, 2.330207 48.8642, 2.330207 48.8656, 2.328079 48.8656, 2.328079 48.8642))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8649)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f83012fd-017f-41c3-a94f-433ef9af64c0',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-026',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 29", "en": "Quai François Mitterrand · Block Cluster 29"}'::jsonb,
  'Quai François Mitterrand',
  24232,
  ST_GeomFromText('POLYGON((2.330207 48.8642, 2.332335 48.8642, 2.332335 48.8656, 2.330207 48.8656, 2.330207 48.8642))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8649)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ce177bea-8985-464a-a792-7da0579c8234',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-063',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 36", "en": "Rue Jean-Jacques Rousseau · Block Cluster 36"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24232,
  ST_GeomFromText('POLYGON((2.332335 48.8642, 2.334463 48.8642, 2.334463 48.8656, 2.332335 48.8656, 2.332335 48.8642))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8649)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c90ce2f4-b211-45ec-ab1d-d7187b1e18e0',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-100',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 43", "en": "Avenue de l’Opéra · Block Cluster 43"}'::jsonb,
  'Avenue de l’Opéra',
  24232,
  ST_GeomFromText('POLYGON((2.334463 48.8642, 2.336591 48.8642, 2.336591 48.8656, 2.334463 48.8656, 2.334463 48.8642))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8649)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2e2721a1-9ef1-46d6-a0d6-1777cd185877',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-137',
  '{"tr": "Rue Jean-Jacques Rousseau · Ada Kümesi 50", "en": "Rue Jean-Jacques Rousseau · Block Cluster 50"}'::jsonb,
  'Rue Jean-Jacques Rousseau',
  24232,
  ST_GeomFromText('POLYGON((2.336591 48.8642, 2.338719 48.8642, 2.338719 48.8656, 2.336591 48.8656, 2.336591 48.8642))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8649)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8fedaecd-52f5-454c-ad18-6b81e2e37419',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-174',
  '{"tr": "Rue de Turbigo · Ada Kümesi 57", "en": "Rue de Turbigo · Block Cluster 57"}'::jsonb,
  'Rue de Turbigo',
  24232,
  ST_GeomFromText('POLYGON((2.338719 48.8642, 2.340847 48.8642, 2.340847 48.8656, 2.338719 48.8656, 2.338719 48.8642))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8649)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'aca0f81d-daae-4c6c-a60e-e471874f1489',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-211',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 64", "en": "Rue Croix des Petits Champs · Block Cluster 64"}'::jsonb,
  'Rue Croix des Petits Champs',
  24232,
  ST_GeomFromText('POLYGON((2.340847 48.8642, 2.342975 48.8642, 2.342975 48.8656, 2.340847 48.8656, 2.340847 48.8642))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8649)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '8eb56459-8b90-4970-a525-3d291a45bdc9',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-248',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 71", "en": "Boulevard de Sébastopol · Block Cluster 71"}'::jsonb,
  'Boulevard de Sébastopol',
  24232,
  ST_GeomFromText('POLYGON((2.342975 48.8642, 2.345103 48.8642, 2.345103 48.8656, 2.342975 48.8656, 2.342975 48.8642))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8649)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2a66635c-5597-45d3-aff1-868f7ffe492f',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-285',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 78", "en": "Rue Croix des Petits Champs · Block Cluster 78"}'::jsonb,
  'Rue Croix des Petits Champs',
  24232,
  ST_GeomFromText('POLYGON((2.345103 48.8642, 2.347231 48.8642, 2.347231 48.8656, 2.345103 48.8656, 2.345103 48.8642))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8649)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '988f5c10-1043-4bfa-a8cc-07eaa8d2b80a',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-322',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24232,
  ST_GeomFromText('POLYGON((2.347231 48.8642, 2.349359 48.8642, 2.349359 48.8656, 2.347231 48.8656, 2.347231 48.8642))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8649)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7ae195da-cb90-479e-a171-924446719d78',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-987',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((2.323823 48.8656, 2.325951 48.8656, 2.325951 48.867, 2.323823 48.867, 2.323823 48.8656))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8663)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'fdb73df1-1507-4383-a8b0-5e7212bea174',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-025',
  '{"tr": "Rue de Richelieu · Ada Kümesi 28", "en": "Rue de Richelieu · Block Cluster 28"}'::jsonb,
  'Rue de Richelieu',
  24230,
  ST_GeomFromText('POLYGON((2.325951 48.8656, 2.328079 48.8656, 2.328079 48.867, 2.325951 48.867, 2.325951 48.8656))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8663)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'caf5deca-46a3-4cea-ac56-822011993bb4',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-062',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 35", "en": "Quai François Mitterrand · Block Cluster 35"}'::jsonb,
  'Quai François Mitterrand',
  24230,
  ST_GeomFromText('POLYGON((2.328079 48.8656, 2.330207 48.8656, 2.330207 48.867, 2.328079 48.867, 2.328079 48.8656))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8663)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4be31806-062e-444d-adcd-fc4b5211fc53',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-099',
  '{"tr": "Rue Montmartre · Ada Kümesi 42", "en": "Rue Montmartre · Block Cluster 42"}'::jsonb,
  'Rue Montmartre',
  24230,
  ST_GeomFromText('POLYGON((2.330207 48.8656, 2.332335 48.8656, 2.332335 48.867, 2.330207 48.867, 2.330207 48.8656))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8663)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e6a39482-077d-4795-a1de-7317ee217c17',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-136',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 49", "en": "Boulevard de Sébastopol · Block Cluster 49"}'::jsonb,
  'Boulevard de Sébastopol',
  24230,
  ST_GeomFromText('POLYGON((2.332335 48.8656, 2.334463 48.8656, 2.334463 48.867, 2.332335 48.867, 2.332335 48.8656))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8663)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dd50902e-5f14-4110-a244-e13e3c65013e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-173',
  '{"tr": "Rue du Louvre · Ada Kümesi 56", "en": "Rue du Louvre · Block Cluster 56"}'::jsonb,
  'Rue du Louvre',
  24230,
  ST_GeomFromText('POLYGON((2.334463 48.8656, 2.336591 48.8656, 2.336591 48.867, 2.334463 48.867, 2.334463 48.8656))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8663)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '23ae536b-d41c-41b3-a7b2-e2d8f7cb051e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-210',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 63", "en": "Quai François Mitterrand · Block Cluster 63"}'::jsonb,
  'Quai François Mitterrand',
  24230,
  ST_GeomFromText('POLYGON((2.336591 48.8656, 2.338719 48.8656, 2.338719 48.867, 2.336591 48.867, 2.336591 48.8656))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8663)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ebeb4a3d-e6e5-49c3-ad0e-c3fed2d0d400',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-247',
  '{"tr": "Rue du Louvre · Ada Kümesi 70", "en": "Rue du Louvre · Block Cluster 70"}'::jsonb,
  'Rue du Louvre',
  24230,
  ST_GeomFromText('POLYGON((2.338719 48.8656, 2.340847 48.8656, 2.340847 48.867, 2.338719 48.867, 2.338719 48.8656))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8663)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1e173e3b-13b9-4852-adae-c66931d1368d',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-284',
  '{"tr": "Rue de Rivoli · Ada Kümesi 77", "en": "Rue de Rivoli · Block Cluster 77"}'::jsonb,
  'Rue de Rivoli',
  24230,
  ST_GeomFromText('POLYGON((2.340847 48.8656, 2.342975 48.8656, 2.342975 48.867, 2.340847 48.867, 2.340847 48.8656))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8663)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a469227a-26d2-4be8-a2bb-7992cb3b7e62',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-321',
  '{"tr": "Rue du Louvre · Ada Kümesi 84", "en": "Rue du Louvre · Block Cluster 84"}'::jsonb,
  'Rue du Louvre',
  24230,
  ST_GeomFromText('POLYGON((2.342975 48.8656, 2.345103 48.8656, 2.345103 48.867, 2.342975 48.867, 2.342975 48.8656))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8663)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f2a54563-a467-432e-a6c2-564d970c5891',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-358',
  '{"tr": "Quai François Mitterrand · Ada Kümesi 2", "en": "Quai François Mitterrand · Block Cluster 2"}'::jsonb,
  'Quai François Mitterrand',
  24230,
  ST_GeomFromText('POLYGON((2.345103 48.8656, 2.347231 48.8656, 2.347231 48.867, 2.345103 48.867, 2.345103 48.8656))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8663)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '62020585-04df-45c7-a6dd-804266e18b4c',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-395',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((2.347231 48.8656, 2.349359 48.8656, 2.349359 48.867, 2.347231 48.867, 2.347231 48.8656))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8663)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1e845751-b7bb-45ed-a93f-b2bcd6403d3e',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-061',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((2.323823 48.867, 2.325951 48.867, 2.325951 48.8684, 2.323823 48.8684, 2.323823 48.867))', 4326),
  ST_GeomFromText('POINT(2.324887 48.8677)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'de78a436-76c1-4a69-a8b9-6e5f553a6e9f',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-098',
  '{"tr": "Rue de Turbigo · Ada Kümesi 41", "en": "Rue de Turbigo · Block Cluster 41"}'::jsonb,
  'Rue de Turbigo',
  24230,
  ST_GeomFromText('POLYGON((2.325951 48.867, 2.328079 48.867, 2.328079 48.8684, 2.325951 48.8684, 2.325951 48.867))', 4326),
  ST_GeomFromText('POINT(2.327015 48.8677)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9c53c5c4-4464-49d0-a837-6c14e0b86f94',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-135',
  '{"tr": "Rue Montmartre · Ada Kümesi 48", "en": "Rue Montmartre · Block Cluster 48"}'::jsonb,
  'Rue Montmartre',
  24230,
  ST_GeomFromText('POLYGON((2.328079 48.867, 2.330207 48.867, 2.330207 48.8684, 2.328079 48.8684, 2.328079 48.867))', 4326),
  ST_GeomFromText('POINT(2.329143 48.8677)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e4596fd-6bd8-41aa-a59d-a7570a1dc8a7',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-172',
  '{"tr": "Boulevard de Sébastopol · Ada Kümesi 55", "en": "Boulevard de Sébastopol · Block Cluster 55"}'::jsonb,
  'Boulevard de Sébastopol',
  24230,
  ST_GeomFromText('POLYGON((2.330207 48.867, 2.332335 48.867, 2.332335 48.8684, 2.330207 48.8684, 2.330207 48.867))', 4326),
  ST_GeomFromText('POINT(2.331271 48.8677)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '133e1874-7b54-4038-a86a-a84c8e92c8ac',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-209',
  '{"tr": "Rue de Richelieu · Ada Kümesi 62", "en": "Rue de Richelieu · Block Cluster 62"}'::jsonb,
  'Rue de Richelieu',
  24230,
  ST_GeomFromText('POLYGON((2.332335 48.867, 2.334463 48.867, 2.334463 48.8684, 2.332335 48.8684, 2.332335 48.867))', 4326),
  ST_GeomFromText('POINT(2.333399 48.8677)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'cb49e7af-2407-4d30-af4e-6a9fef5174df',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-246',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 69", "en": "Rue Saint-Honoré · Block Cluster 69"}'::jsonb,
  'Rue Saint-Honoré',
  24230,
  ST_GeomFromText('POLYGON((2.334463 48.867, 2.336591 48.867, 2.336591 48.8684, 2.334463 48.8684, 2.334463 48.867))', 4326),
  ST_GeomFromText('POINT(2.335527 48.8677)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c39df155-a970-451b-aaed-d44e6d0e1670',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-283',
  '{"tr": "Rue Montmartre · Ada Kümesi 76", "en": "Rue Montmartre · Block Cluster 76"}'::jsonb,
  'Rue Montmartre',
  24230,
  ST_GeomFromText('POLYGON((2.336591 48.867, 2.338719 48.867, 2.338719 48.8684, 2.336591 48.8684, 2.336591 48.867))', 4326),
  ST_GeomFromText('POINT(2.337655 48.8677)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '46d82ffb-6590-4557-a348-3aacac684552',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-320',
  '{"tr": "Avenue de l’Opéra · Ada Kümesi 83", "en": "Avenue de l’Opéra · Block Cluster 83"}'::jsonb,
  'Avenue de l’Opéra',
  24230,
  ST_GeomFromText('POLYGON((2.338719 48.867, 2.340847 48.867, 2.340847 48.8684, 2.338719 48.8684, 2.338719 48.867))', 4326),
  ST_GeomFromText('POINT(2.339783 48.8677)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1cefd6d2-e428-43e2-a8c7-f5300117fab4',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-357',
  '{"tr": "Rue Croix des Petits Champs · Ada Kümesi 1", "en": "Rue Croix des Petits Champs · Block Cluster 1"}'::jsonb,
  'Rue Croix des Petits Champs',
  24230,
  ST_GeomFromText('POLYGON((2.340847 48.867, 2.342975 48.867, 2.342975 48.8684, 2.340847 48.8684, 2.340847 48.867))', 4326),
  ST_GeomFromText('POINT(2.341911 48.8677)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c8b9b2f0-edcb-4fe3-a572-7d13b68582d3',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-394',
  '{"tr": "Rue Saint-Honoré · Ada Kümesi 8", "en": "Rue Saint-Honoré · Block Cluster 8"}'::jsonb,
  'Rue Saint-Honoré',
  24230,
  ST_GeomFromText('POLYGON((2.342975 48.867, 2.345103 48.867, 2.345103 48.8684, 2.342975 48.8684, 2.342975 48.867))', 4326),
  ST_GeomFromText('POINT(2.344039 48.8677)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ad3b467e-4c66-43b3-a15d-85cdf9a20a31',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-LOU-431',
  '{"tr": "Rue Montmartre · Ada Kümesi 15", "en": "Rue Montmartre · Block Cluster 15"}'::jsonb,
  'Rue Montmartre',
  24230,
  ST_GeomFromText('POLYGON((2.345103 48.867, 2.347231 48.867, 2.347231 48.8684, 2.345103 48.8684, 2.345103 48.867))', 4326),
  ST_GeomFromText('POINT(2.346167 48.8677)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'd7b7fe4e-f874-486e-afc3-e620d02c16bc',
  'a0000000-0000-0000-0000-000000000003',
  'FR-PAR-MRK-468',
  '{"tr": "Paris Merkez Şehir Caddeleri", "en": "Central Paris City Streets"}'::jsonb,
  'Paris Merkez Paris Merkez Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((2.347231 48.867, 2.349359 48.867, 2.349359 48.8684, 2.347231 48.8684, 2.347231 48.867))', 4326),
  ST_GeomFromText('POINT(2.348295 48.8677)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2a2b5070-bcaa-4aad-a681-2adde6d5cb1d',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-619',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.694888 35.6538, 139.696611 35.6538, 139.696611 35.6552, 139.694888 35.6552, 139.694888 35.6538))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6545)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3cde2636-9197-4edc-ad49-68eace757512',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-656',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.696611 35.6538, 139.698334 35.6538, 139.698334 35.6552, 139.696611 35.6552, 139.696611 35.6538))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6545)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '726c24a6-703d-4507-a251-21a1e2a929ad',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-693',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24249,
  ST_GeomFromText('POLYGON((139.698334 35.6538, 139.700058 35.6538, 139.700058 35.6552, 139.698334 35.6552, 139.698334 35.6538))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6545)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '265e0d1a-a9a4-43cb-affa-1ed1d00220e5',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-730',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.700058 35.6538, 139.701781 35.6538, 139.701781 35.6552, 139.700058 35.6552, 139.700058 35.6538))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6545)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'af5afaee-95a7-4a44-aafd-90aa45026532',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-767',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.701781 35.6538, 139.703504 35.6538, 139.703504 35.6552, 139.701781 35.6552, 139.701781 35.6538))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6545)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '369afe02-cf97-4379-a90d-2d7b0632d17b',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-804',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.703504 35.6538, 139.705227 35.6538, 139.705227 35.6552, 139.703504 35.6552, 139.703504 35.6538))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6545)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ed94ce7b-ef01-44c8-a295-6ab3dc967343',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-841',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.705227 35.6538, 139.70695 35.6538, 139.70695 35.6552, 139.705227 35.6552, 139.705227 35.6538))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6545)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2d4a8f66-08c9-41ff-a583-ae993613b165',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-878',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24233,
  ST_GeomFromText('POLYGON((139.70695 35.6538, 139.708673 35.6538, 139.708673 35.6552, 139.70695 35.6552, 139.70695 35.6538))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6545)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b1137b0c-3f60-4495-ae73-bf99f0743fa1',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-692',
  '{"tr": "Roppongi-dori · Ada Kümesi 45", "en": "Roppongi-dori · Block Cluster 45"}'::jsonb,
  'Roppongi-dori',
  24233,
  ST_GeomFromText('POLYGON((139.694888 35.6552, 139.696611 35.6552, 139.696611 35.6566, 139.694888 35.6566, 139.694888 35.6552))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6559)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b3ec4ff5-fce3-4717-af0f-f8e2b0d0070c',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-729',
  '{"tr": "Center-gai Street · Ada Kümesi 52", "en": "Center-gai Street · Block Cluster 52"}'::jsonb,
  'Center-gai Street',
  24233,
  ST_GeomFromText('POLYGON((139.696611 35.6552, 139.698334 35.6552, 139.698334 35.6566, 139.696611 35.6566, 139.696611 35.6552))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6559)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '09f884f8-6550-482d-aca8-0cd56f490d25',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-766',
  '{"tr": "Bunkamura-dori · Ada Kümesi 59", "en": "Bunkamura-dori · Block Cluster 59"}'::jsonb,
  'Bunkamura-dori',
  24247,
  ST_GeomFromText('POLYGON((139.698334 35.6552, 139.700058 35.6552, 139.700058 35.6566, 139.698334 35.6566, 139.698334 35.6552))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6559)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e169bf0f-c7bd-4e13-a6d4-e11ca9271d22',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-803',
  '{"tr": "Center-gai Street · Ada Kümesi 66", "en": "Center-gai Street · Block Cluster 66"}'::jsonb,
  'Center-gai Street',
  24233,
  ST_GeomFromText('POLYGON((139.700058 35.6552, 139.701781 35.6552, 139.701781 35.6566, 139.700058 35.6566, 139.700058 35.6552))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6559)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6076e99f-94b4-424c-a4c2-abd3f52b2beb',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-840',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 73", "en": "Aoyama-dori Avenue · Block Cluster 73"}'::jsonb,
  'Aoyama-dori Avenue',
  24233,
  ST_GeomFromText('POLYGON((139.701781 35.6552, 139.703504 35.6552, 139.703504 35.6566, 139.701781 35.6566, 139.701781 35.6552))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6559)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9fabcf74-3c8b-41dd-a320-8ea9dc371151',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-877',
  '{"tr": "Udagawa-cho · Ada Kümesi 80", "en": "Udagawa-cho · Block Cluster 80"}'::jsonb,
  'Udagawa-cho',
  24233,
  ST_GeomFromText('POLYGON((139.703504 35.6552, 139.705227 35.6552, 139.705227 35.6566, 139.703504 35.6566, 139.703504 35.6552))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6559)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '775a43d3-6420-4a0e-a37a-a9dddb7b2de1',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-914',
  '{"tr": "Dogenzaka Avenue · Ada Kümesi 87", "en": "Dogenzaka Avenue · Block Cluster 87"}'::jsonb,
  'Dogenzaka Avenue',
  24233,
  ST_GeomFromText('POLYGON((139.705227 35.6552, 139.70695 35.6552, 139.70695 35.6566, 139.705227 35.6566, 139.705227 35.6552))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6559)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '22d7ef9e-bd5d-47f3-af8a-f86de0350791',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-951',
  '{"tr": "Udagawa-cho · Ada Kümesi 5", "en": "Udagawa-cho · Block Cluster 5"}'::jsonb,
  'Udagawa-cho',
  24233,
  ST_GeomFromText('POLYGON((139.70695 35.6552, 139.708673 35.6552, 139.708673 35.6566, 139.70695 35.6566, 139.70695 35.6552))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6559)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4777df76-f3d9-4e64-a4ae-71123b518dda',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-765',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 58", "en": "Sakuragaoka-cho · Block Cluster 58"}'::jsonb,
  'Sakuragaoka-cho',
  24233,
  ST_GeomFromText('POLYGON((139.694888 35.6566, 139.696611 35.6566, 139.696611 35.658, 139.694888 35.658, 139.694888 35.6566))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6573)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '09f96984-2492-4c7c-ad6b-e5f82e8bf600',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-802',
  '{"tr": "Inokashira-dori · Ada Kümesi 65", "en": "Inokashira-dori · Block Cluster 65"}'::jsonb,
  'Inokashira-dori',
  24233,
  ST_GeomFromText('POLYGON((139.696611 35.6566, 139.698334 35.6566, 139.698334 35.658, 139.696611 35.658, 139.696611 35.6566))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6573)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c3161c6f-7046-4a59-a350-a636335cd6c8',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-839',
  '{"tr": "Spain-zaka Slope · Ada Kümesi 72", "en": "Spain-zaka Slope · Block Cluster 72"}'::jsonb,
  'Spain-zaka Slope',
  24247,
  ST_GeomFromText('POLYGON((139.698334 35.6566, 139.700058 35.6566, 139.700058 35.658, 139.698334 35.658, 139.698334 35.6566))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6573)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c5795648-37d4-4e97-a2ad-98dffd4e24df',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-876',
  '{"tr": "Roppongi-dori · Ada Kümesi 79", "en": "Roppongi-dori · Block Cluster 79"}'::jsonb,
  'Roppongi-dori',
  24233,
  ST_GeomFromText('POLYGON((139.700058 35.6566, 139.701781 35.6566, 139.701781 35.658, 139.700058 35.658, 139.700058 35.6566))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6573)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b309aa0d-72c8-48d0-a1c1-22dd25d232dd',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-913',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 86", "en": "Sakuragaoka-cho · Block Cluster 86"}'::jsonb,
  'Sakuragaoka-cho',
  24233,
  ST_GeomFromText('POLYGON((139.701781 35.6566, 139.703504 35.6566, 139.703504 35.658, 139.701781 35.658, 139.701781 35.6566))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6573)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9d23e1a6-803a-4636-ad19-97901d5e57dc',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-950',
  '{"tr": "Bunkamura-dori · Ada Kümesi 4", "en": "Bunkamura-dori · Block Cluster 4"}'::jsonb,
  'Bunkamura-dori',
  24233,
  ST_GeomFromText('POLYGON((139.703504 35.6566, 139.705227 35.6566, 139.705227 35.658, 139.703504 35.658, 139.703504 35.6566))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6573)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '29940878-df01-4451-a695-3c2908953cc9',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-987',
  '{"tr": "Center-gai Street · Ada Kümesi 11", "en": "Center-gai Street · Block Cluster 11"}'::jsonb,
  'Center-gai Street',
  24233,
  ST_GeomFromText('POLYGON((139.705227 35.6566, 139.70695 35.6566, 139.70695 35.658, 139.705227 35.658, 139.705227 35.6566))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6573)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c61dfaba-8bb7-4775-adaa-1dcf51d5e22f',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-025',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 18", "en": "Aoyama-dori Avenue · Block Cluster 18"}'::jsonb,
  'Aoyama-dori Avenue',
  24233,
  ST_GeomFromText('POLYGON((139.70695 35.6566, 139.708673 35.6566, 139.708673 35.658, 139.70695 35.658, 139.70695 35.6566))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6573)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '6b3577c9-5a01-4ff0-a134-3839c536c7b9',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-838',
  '{"tr": "Dogenzaka Avenue · Ada Kümesi 71", "en": "Dogenzaka Avenue · Block Cluster 71"}'::jsonb,
  'Dogenzaka Avenue',
  24233,
  ST_GeomFromText('POLYGON((139.694888 35.658, 139.696611 35.658, 139.696611 35.6594, 139.694888 35.6594, 139.694888 35.658))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6587)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2c23df4b-a0ce-4067-aced-6f2cccf28fb2',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-875',
  '{"tr": "Center-gai Street · Ada Kümesi 78", "en": "Center-gai Street · Block Cluster 78"}'::jsonb,
  'Center-gai Street',
  24233,
  ST_GeomFromText('POLYGON((139.696611 35.658, 139.698334 35.658, 139.698334 35.6594, 139.696611 35.6594, 139.696611 35.658))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6587)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1338ebaf-33e8-4438-a0d0-6f9747216fe7',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-912',
  '{"tr": "Meiji-dori Avenue · Ada Kümesi 85", "en": "Meiji-dori Avenue · Block Cluster 85"}'::jsonb,
  'Meiji-dori Avenue',
  24247,
  ST_GeomFromText('POLYGON((139.698334 35.658, 139.700058 35.658, 139.700058 35.6594, 139.698334 35.6594, 139.698334 35.658))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6587)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'b0ff6d99-295b-4829-a9a4-45b0da5a95c2',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-949',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 3", "en": "Sakuragaoka-cho · Block Cluster 3"}'::jsonb,
  'Sakuragaoka-cho',
  24233,
  ST_GeomFromText('POLYGON((139.700058 35.658, 139.701781 35.658, 139.701781 35.6594, 139.700058 35.6594, 139.700058 35.658))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6587)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '689917c4-5964-4f5f-a1fd-489bc1fd7723',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-986',
  '{"tr": "Bunkamura-dori · Ada Kümesi 10", "en": "Bunkamura-dori · Block Cluster 10"}'::jsonb,
  'Bunkamura-dori',
  24233,
  ST_GeomFromText('POLYGON((139.701781 35.658, 139.703504 35.658, 139.703504 35.6594, 139.701781 35.6594, 139.701781 35.658))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6587)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9fb7cf52-4001-41f8-afb6-deaadfb8e14a',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-024',
  '{"tr": "Center-gai Street · Ada Kümesi 17", "en": "Center-gai Street · Block Cluster 17"}'::jsonb,
  'Center-gai Street',
  24233,
  ST_GeomFromText('POLYGON((139.703504 35.658, 139.705227 35.658, 139.705227 35.6594, 139.703504 35.6594, 139.703504 35.658))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6587)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c32f4341-34b2-4c89-a79d-1fc8f7e19fca',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-061',
  '{"tr": "Roppongi-dori · Ada Kümesi 24", "en": "Roppongi-dori · Block Cluster 24"}'::jsonb,
  'Roppongi-dori',
  24233,
  ST_GeomFromText('POLYGON((139.705227 35.658, 139.70695 35.658, 139.70695 35.6594, 139.705227 35.6594, 139.705227 35.658))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6587)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a5b693f9-a6b2-4d37-a304-5ece4c696130',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-098',
  '{"tr": "Koen-dori · Ada Kümesi 31", "en": "Koen-dori · Block Cluster 31"}'::jsonb,
  'Koen-dori',
  24233,
  ST_GeomFromText('POLYGON((139.70695 35.658, 139.708673 35.658, 139.708673 35.6594, 139.70695 35.6594, 139.70695 35.658))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6587)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '50f58a80-5c46-4b47-acb3-a1c7ad3bb5c7',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-911',
  '{"tr": "Spain-zaka Slope · Ada Kümesi 84", "en": "Spain-zaka Slope · Block Cluster 84"}'::jsonb,
  'Spain-zaka Slope',
  24232,
  ST_GeomFromText('POLYGON((139.694888 35.6594, 139.696611 35.6594, 139.696611 35.6608, 139.694888 35.6608, 139.694888 35.6594))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6601)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'dbeb420f-f239-4010-a9d2-221fce24a21f',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-948',
  '{"tr": "Meiji-dori Avenue · Ada Kümesi 2", "en": "Meiji-dori Avenue · Block Cluster 2"}'::jsonb,
  'Meiji-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.696611 35.6594, 139.698334 35.6594, 139.698334 35.6608, 139.696611 35.6608, 139.696611 35.6594))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6601)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9d4b9cbd-ed09-470f-a042-7bb28a5583cc',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-985',
  '{"tr": "Spain-zaka Slope · Ada Kümesi 9", "en": "Spain-zaka Slope · Block Cluster 9"}'::jsonb,
  'Spain-zaka Slope',
  24246,
  ST_GeomFromText('POLYGON((139.698334 35.6594, 139.700058 35.6594, 139.700058 35.6608, 139.698334 35.6608, 139.698334 35.6594))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6601)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5601d081-1688-41de-a089-915f6c8a125f',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-023',
  '{"tr": "Bunkamura-dori · Ada Kümesi 16", "en": "Bunkamura-dori · Block Cluster 16"}'::jsonb,
  'Bunkamura-dori',
  24232,
  ST_GeomFromText('POLYGON((139.700058 35.6594, 139.701781 35.6594, 139.701781 35.6608, 139.700058 35.6608, 139.700058 35.6594))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6601)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f16e70e6-8561-48b7-a40f-c85176d0299d',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-060',
  '{"tr": "Spain-zaka Slope · Ada Kümesi 23", "en": "Spain-zaka Slope · Block Cluster 23"}'::jsonb,
  'Spain-zaka Slope',
  24232,
  ST_GeomFromText('POLYGON((139.701781 35.6594, 139.703504 35.6594, 139.703504 35.6608, 139.701781 35.6608, 139.701781 35.6594))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6601)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e47eb8e3-6482-4275-a0fc-6a9649018b58',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-097',
  '{"tr": "Meiji-dori Avenue · Ada Kümesi 30", "en": "Meiji-dori Avenue · Block Cluster 30"}'::jsonb,
  'Meiji-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.703504 35.6594, 139.705227 35.6594, 139.705227 35.6608, 139.703504 35.6608, 139.703504 35.6594))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6601)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '75b9fa37-089e-4fa4-ad27-75937e5889db',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-134',
  '{"tr": "Spain-zaka Slope · Ada Kümesi 37", "en": "Spain-zaka Slope · Block Cluster 37"}'::jsonb,
  'Spain-zaka Slope',
  24232,
  ST_GeomFromText('POLYGON((139.705227 35.6594, 139.70695 35.6594, 139.70695 35.6608, 139.705227 35.6608, 139.705227 35.6594))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6601)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'ecfc316d-3f83-4683-a37f-e7ee2c8007f0',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-171',
  '{"tr": "Bunkamura-dori · Ada Kümesi 44", "en": "Bunkamura-dori · Block Cluster 44"}'::jsonb,
  'Bunkamura-dori',
  24232,
  ST_GeomFromText('POLYGON((139.70695 35.6594, 139.708673 35.6594, 139.708673 35.6608, 139.70695 35.6608, 139.70695 35.6594))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6601)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'a8d0ecbb-713e-40fe-a9ee-dc451a0f1db9',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-984',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 8", "en": "Aoyama-dori Avenue · Block Cluster 8"}'::jsonb,
  'Aoyama-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.694888 35.6608, 139.696611 35.6608, 139.696611 35.6622, 139.694888 35.6622, 139.694888 35.6608))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6615)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '036544df-b147-410e-a222-05d1b4ac85ed',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-022',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 15", "en": "Sakuragaoka-cho · Block Cluster 15"}'::jsonb,
  'Sakuragaoka-cho',
  24232,
  ST_GeomFromText('POLYGON((139.696611 35.6608, 139.698334 35.6608, 139.698334 35.6622, 139.696611 35.6622, 139.696611 35.6608))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6615)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '22dfb482-bc63-4452-aebc-a0d0df42c8d4',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-059',
  '{"tr": "Inokashira-dori · Ada Kümesi 22", "en": "Inokashira-dori · Block Cluster 22"}'::jsonb,
  'Inokashira-dori',
  24246,
  ST_GeomFromText('POLYGON((139.698334 35.6608, 139.700058 35.6608, 139.700058 35.6622, 139.698334 35.6622, 139.698334 35.6608))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6615)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '3d325de9-e4d7-4862-a9e5-958b220a264b',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-096',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 29", "en": "Sakuragaoka-cho · Block Cluster 29"}'::jsonb,
  'Sakuragaoka-cho',
  24232,
  ST_GeomFromText('POLYGON((139.700058 35.6608, 139.701781 35.6608, 139.701781 35.6622, 139.700058 35.6622, 139.700058 35.6608))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6615)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9548b2a3-3d2b-4fb8-a863-bd1bd273c25b',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-133',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 36", "en": "Aoyama-dori Avenue · Block Cluster 36"}'::jsonb,
  'Aoyama-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.701781 35.6608, 139.703504 35.6608, 139.703504 35.6622, 139.701781 35.6622, 139.701781 35.6608))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6615)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0248a043-f862-499c-aa2a-d9dffaab19df',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-170',
  '{"tr": "Udagawa-cho · Ada Kümesi 43", "en": "Udagawa-cho · Block Cluster 43"}'::jsonb,
  'Udagawa-cho',
  24232,
  ST_GeomFromText('POLYGON((139.703504 35.6608, 139.705227 35.6608, 139.705227 35.6622, 139.703504 35.6622, 139.703504 35.6608))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6615)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f8819fd9-6660-49a1-aee1-a6785ee1d97a',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-207',
  '{"tr": "Bunkamura-dori · Ada Kümesi 50", "en": "Bunkamura-dori · Block Cluster 50"}'::jsonb,
  'Bunkamura-dori',
  24232,
  ST_GeomFromText('POLYGON((139.705227 35.6608, 139.70695 35.6608, 139.70695 35.6622, 139.705227 35.6622, 139.705227 35.6608))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6615)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '5c214d98-353c-4824-a91d-c5bc915dd5bc',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-244',
  '{"tr": "Udagawa-cho · Ada Kümesi 57", "en": "Udagawa-cho · Block Cluster 57"}'::jsonb,
  'Udagawa-cho',
  24232,
  ST_GeomFromText('POLYGON((139.70695 35.6608, 139.708673 35.6608, 139.708673 35.6622, 139.70695 35.6622, 139.70695 35.6608))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6615)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '438a874a-cb96-4c7a-a81c-7b300f2183c4',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-058',
  '{"tr": "Koen-dori · Ada Kümesi 21", "en": "Koen-dori · Block Cluster 21"}'::jsonb,
  'Koen-dori',
  24232,
  ST_GeomFromText('POLYGON((139.694888 35.6622, 139.696611 35.6622, 139.696611 35.6636, 139.694888 35.6636, 139.694888 35.6622))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6629)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '2ccae2c0-d37f-47f3-afb5-4533004a8ab3',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-095',
  '{"tr": "Dogenzaka Avenue · Ada Kümesi 28", "en": "Dogenzaka Avenue · Block Cluster 28"}'::jsonb,
  'Dogenzaka Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.696611 35.6622, 139.698334 35.6622, 139.698334 35.6636, 139.696611 35.6636, 139.696611 35.6622))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6629)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9f7cca11-b2e2-4758-ad9e-3d49525fc169',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-132',
  '{"tr": "Udagawa-cho · Ada Kümesi 35", "en": "Udagawa-cho · Block Cluster 35"}'::jsonb,
  'Udagawa-cho',
  24246,
  ST_GeomFromText('POLYGON((139.698334 35.6622, 139.700058 35.6622, 139.700058 35.6636, 139.698334 35.6636, 139.698334 35.6622))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6629)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4bb39a0a-1365-42c2-a8d6-08c85f192ccc',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-169',
  '{"tr": "Meiji-dori Avenue · Ada Kümesi 42", "en": "Meiji-dori Avenue · Block Cluster 42"}'::jsonb,
  'Meiji-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.700058 35.6622, 139.701781 35.6622, 139.701781 35.6636, 139.700058 35.6636, 139.700058 35.6622))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6629)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'bfb9ba1a-42c2-40ab-ad7b-eab1027c0ac5',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-206',
  '{"tr": "Koen-dori · Ada Kümesi 49", "en": "Koen-dori · Block Cluster 49"}'::jsonb,
  'Koen-dori',
  24232,
  ST_GeomFromText('POLYGON((139.701781 35.6622, 139.703504 35.6622, 139.703504 35.6636, 139.701781 35.6636, 139.701781 35.6622))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6629)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'deb73f75-ef8e-4310-a139-cc65ce463285',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-243',
  '{"tr": "Inokashira-dori · Ada Kümesi 56", "en": "Inokashira-dori · Block Cluster 56"}'::jsonb,
  'Inokashira-dori',
  24232,
  ST_GeomFromText('POLYGON((139.703504 35.6622, 139.705227 35.6622, 139.705227 35.6636, 139.703504 35.6636, 139.703504 35.6622))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6629)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '18273893-d8d6-4733-a0f1-1fa0f0fd5fc6',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-280',
  '{"tr": "Center-gai Street · Ada Kümesi 63", "en": "Center-gai Street · Block Cluster 63"}'::jsonb,
  'Center-gai Street',
  24232,
  ST_GeomFromText('POLYGON((139.705227 35.6622, 139.70695 35.6622, 139.70695 35.6636, 139.705227 35.6636, 139.705227 35.6622))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6629)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'be25273b-fefb-4db5-a0de-ca8ebd2114f0',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-317',
  '{"tr": "Meiji-dori Avenue · Ada Kümesi 70", "en": "Meiji-dori Avenue · Block Cluster 70"}'::jsonb,
  'Meiji-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.70695 35.6622, 139.708673 35.6622, 139.708673 35.6636, 139.70695 35.6636, 139.70695 35.6622))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6629)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '222b2674-5760-4b96-a54b-9de2798be20a',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-131',
  '{"tr": "Dogenzaka Avenue · Ada Kümesi 34", "en": "Dogenzaka Avenue · Block Cluster 34"}'::jsonb,
  'Dogenzaka Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.694888 35.6636, 139.696611 35.6636, 139.696611 35.665, 139.694888 35.665, 139.694888 35.6636))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6643)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c19c85da-03f3-4ed2-a26f-0b08c59014ac',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-168',
  '{"tr": "Sakuragaoka-cho · Ada Kümesi 41", "en": "Sakuragaoka-cho · Block Cluster 41"}'::jsonb,
  'Sakuragaoka-cho',
  24232,
  ST_GeomFromText('POLYGON((139.696611 35.6636, 139.698334 35.6636, 139.698334 35.665, 139.696611 35.665, 139.696611 35.6636))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6643)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'baa964a4-db33-4d4e-a19a-d9ea95dd21f2',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-205',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 48", "en": "Aoyama-dori Avenue · Block Cluster 48"}'::jsonb,
  'Aoyama-dori Avenue',
  24246,
  ST_GeomFromText('POLYGON((139.698334 35.6636, 139.700058 35.6636, 139.700058 35.665, 139.698334 35.665, 139.698334 35.6636))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6643)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'c8f12348-2b24-4041-a3d5-7309f4157389',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-242',
  '{"tr": "Koen-dori · Ada Kümesi 55", "en": "Koen-dori · Block Cluster 55"}'::jsonb,
  'Koen-dori',
  24232,
  ST_GeomFromText('POLYGON((139.700058 35.6636, 139.701781 35.6636, 139.701781 35.665, 139.700058 35.665, 139.700058 35.6636))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6643)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '7b956431-176d-45d0-acf8-41e193028a01',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-279',
  '{"tr": "Dogenzaka Avenue · Ada Kümesi 62", "en": "Dogenzaka Avenue · Block Cluster 62"}'::jsonb,
  'Dogenzaka Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.701781 35.6636, 139.703504 35.6636, 139.703504 35.665, 139.701781 35.665, 139.701781 35.6636))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6643)', 4326),
  2.5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '4df43498-b66f-465b-ab9b-82c30463eaf3',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-316',
  '{"tr": "Udagawa-cho · Ada Kümesi 69", "en": "Udagawa-cho · Block Cluster 69"}'::jsonb,
  'Udagawa-cho',
  24232,
  ST_GeomFromText('POLYGON((139.703504 35.6636, 139.705227 35.6636, 139.705227 35.665, 139.703504 35.665, 139.703504 35.6636))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6643)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e74725de-c918-4106-ae5f-04d8b05f46e4',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-353',
  '{"tr": "Aoyama-dori Avenue · Ada Kümesi 76", "en": "Aoyama-dori Avenue · Block Cluster 76"}'::jsonb,
  'Aoyama-dori Avenue',
  24232,
  ST_GeomFromText('POLYGON((139.705227 35.6636, 139.70695 35.6636, 139.70695 35.665, 139.705227 35.665, 139.705227 35.6636))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6643)', 4326),
  5,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '935b89cc-67dc-4ebd-a487-7771fb388889',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-CRX-390',
  '{"tr": "Koen-dori · Ada Kümesi 83", "en": "Koen-dori · Block Cluster 83"}'::jsonb,
  'Koen-dori',
  24232,
  ST_GeomFromText('POLYGON((139.70695 35.6636, 139.708673 35.6636, 139.708673 35.665, 139.70695 35.665, 139.70695 35.6636))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6643)', 4326),
  1.2,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '1bd5e754-6d82-45b6-a657-a2e289582d0a',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-204',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.694888 35.665, 139.696611 35.665, 139.696611 35.6664, 139.694888 35.6664, 139.694888 35.665))', 4326),
  ST_GeomFromText('POINT(139.695749 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e3343a2d-d4e7-4612-a7d3-5c3fb81ba03f',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-241',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.696611 35.665, 139.698334 35.665, 139.698334 35.6664, 139.696611 35.6664, 139.696611 35.665))', 4326),
  ST_GeomFromText('POINT(139.697473 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '0b131e06-a541-4778-ae52-a97eb054d57e',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-278',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24244,
  ST_GeomFromText('POLYGON((139.698334 35.665, 139.700058 35.665, 139.700058 35.6664, 139.698334 35.6664, 139.698334 35.665))', 4326),
  ST_GeomFromText('POINT(139.699196 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f9a4790f-976b-4a4b-aecf-0344910ff35a',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-315',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.700058 35.665, 139.701781 35.665, 139.701781 35.6664, 139.700058 35.6664, 139.700058 35.665))', 4326),
  ST_GeomFromText('POINT(139.70092 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'e13f0cb0-1b15-4614-aa2a-5aa4fc5462c4',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-352',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.701781 35.665, 139.703504 35.665, 139.703504 35.6664, 139.701781 35.6664, 139.701781 35.665))', 4326),
  ST_GeomFromText('POINT(139.702643 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '064a9ff2-3a5b-435f-ac11-fcad40a60351',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-389',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.703504 35.665, 139.705227 35.665, 139.705227 35.6664, 139.703504 35.6664, 139.703504 35.665))', 4326),
  ST_GeomFromText('POINT(139.704366 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  'f8893c10-9128-488b-a9a1-749b89b1849b',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-426',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.705227 35.665, 139.70695 35.665, 139.70695 35.6664, 139.705227 35.6664, 139.705227 35.665))', 4326),
  ST_GeomFromText('POINT(139.706089 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
INSERT INTO fronts (id, city_region_id, front_code, display_name_i18n, street_name, area_m2, geom, center_point, default_weight, status)
VALUES (
  '9e28ab1f-c3d9-42d1-adf1-39ce62023df0',
  'a0000000-0000-0000-0000-000000000003',
  'JP-SHI-MRK-463',
  '{"tr": "Shibuya Şehir Caddeleri", "en": "Shibuya City Streets"}'::jsonb,
  'Shibuya Shibuya Bölgesi Caddesi',
  24230,
  ST_GeomFromText('POLYGON((139.70695 35.665, 139.708673 35.665, 139.708673 35.6664, 139.70695 35.6664, 139.70695 35.665))', 4326),
  ST_GeomFromText('POINT(139.707812 35.6657)', 4326),
  1,
  'active'
) ON CONFLICT (front_code) DO NOTHING;
COMMIT;