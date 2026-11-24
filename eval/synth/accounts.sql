-- Comptes de test synthétiques. Généré par eval/synth/generate_accounts.py
-- (graine 20261118). Ne pas modifier à la main : regénérer.
-- Projet Supabase de TEST uniquement. Prérequis :
--   1. le catalogue `exercises` chargé (codes ci-dessous, owner_id NULL) ;
--   2. les trois utilisateurs créés avec ces UUID :
--      debutant    710357a0-5015-5f1c-a753-9b8627409cb3
--      avance      81cc037c-3dde-56be-aec1-a7d8171bea63
--      irregulier  c1ba0015-c3b7-51ed-8d83-df70ac9b261c
-- Chargement en rôle propriétaire (éditeur SQL) : triggers de garde et RLS contournés,
-- le générateur respecte lui-même leurs bornes (tests/test_synth_accounts.py).
BEGIN;

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('0d0a5b8b-6de5-51e9-800a-783cfdafaa72', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-01T17:34:00+00:00', '2026-06-01T18:18:36+00:00', 2676, 3650.0, FALSE, 68.0, 'gym', 182);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('1b3fea87-3868-5453-a9a6-06e76354a13e', '0d0a5b8b-6de5-51e9-800a-783cfdafaa72', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('0b084fa1-9ed1-5b28-849b-dc3b652a0676', '0d0a5b8b-6de5-51e9-800a-783cfdafaa72', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('adc84831-bfe1-588f-ad75-583aaa164676', '0d0a5b8b-6de5-51e9-800a-783cfdafaa72', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('060f8a2f-26c7-5fb9-a089-8ae713fbaef4', '0d0a5b8b-6de5-51e9-800a-783cfdafaa72', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('95ee03f2-0e5c-5df6-86a5-a4480fcf53b1', '1b3fea87-3868-5453-a9a6-06e76354a13e', 'working', 1, 10, 60.0, 90, FALSE, '2026-06-01T17:41:40+00:00'),
  ('d0c69727-eac6-5999-80b9-d951023d240d', '1b3fea87-3868-5453-a9a6-06e76354a13e', 'working', 2, 10, 60.0, 60, FALSE, '2026-06-01T17:43:50+00:00'),
  ('4cca288d-dab1-527d-aab2-0b218102b883', '1b3fea87-3868-5453-a9a6-06e76354a13e', 'working', 3, 10, 60.0, 120, FALSE, '2026-06-01T17:47:00+00:00'),
  ('db4218e0-21fa-521c-a897-c4cc732b463c', '0b084fa1-9ed1-5b28-849b-dc3b652a0676', 'working', 1, 10, 30.0, 120, FALSE, '2026-06-01T17:50:10+00:00'),
  ('62999bd7-cf18-512e-b275-6c72e952393c', '0b084fa1-9ed1-5b28-849b-dc3b652a0676', 'working', 2, 10, 30.0, 60, FALSE, '2026-06-01T17:52:20+00:00'),
  ('4306a8e7-701d-5659-aae0-373cd9c1cbfb', '0b084fa1-9ed1-5b28-849b-dc3b652a0676', 'working', 3, 9, 30.0, 90, FALSE, '2026-06-01T17:54:57+00:00'),
  ('deb1152f-4f1e-58fc-9aad-1abca525d79e', 'adc84831-bfe1-588f-ad75-583aaa164676', 'working', 1, 10, 35.0, 150, FALSE, '2026-06-01T17:58:37+00:00'),
  ('161b393c-2ad0-5c68-aa60-d73f9ce1d746', 'adc84831-bfe1-588f-ad75-583aaa164676', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-01T18:01:17+00:00'),
  ('80178b8e-6279-590b-a6d4-f8cdf2e3e8d7', 'adc84831-bfe1-588f-ad75-583aaa164676', 'working', 3, 8, 35.0, 90, FALSE, '2026-06-01T18:03:51+00:00'),
  ('513ce6e5-f787-5eda-b0ab-5c82899511d9', '060f8a2f-26c7-5fb9-a089-8ae713fbaef4', 'working', 1, 35, 0.0, 90, FALSE, '2026-06-01T18:07:46+00:00'),
  ('d1e78a03-3bf1-5698-a901-bf7a9b7d53de', '060f8a2f-26c7-5fb9-a089-8ae713fbaef4', 'working', 2, 30, 0.0, 90, FALSE, '2026-06-01T18:11:26+00:00'),
  ('3d020fa9-ecb3-5a8d-a653-3fe766851e48', '060f8a2f-26c7-5fb9-a089-8ae713fbaef4', 'working', 3, 30, 0.0, 120, FALSE, '2026-06-01T18:15:36+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('61a046ea-4d4f-5507-8173-ec6a7d839226', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-06-03T17:37:00+00:00', '2026-06-03T18:32:12+00:00', 3312, 2128.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e102ca62-5b02-5034-8322-740e0864398a', '61a046ea-4d4f-5507-8173-ec6a7d839226', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('ec884b5c-f064-5fbb-833a-b4890295f57f', '61a046ea-4d4f-5507-8173-ec6a7d839226', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('bbd51eae-7f1f-5e3b-8129-f2c5e27e77b5', '61a046ea-4d4f-5507-8173-ec6a7d839226', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('86c5ff31-7ed2-59c3-afa2-bdb342b8bf39', '61a046ea-4d4f-5507-8173-ec6a7d839226', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('e796fa7e-c690-5c6d-82c3-85e312ec93fc', '61a046ea-4d4f-5507-8173-ec6a7d839226', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4bbfb214-53f6-5c18-9e68-a5a2ec735ce1', 'e102ca62-5b02-5034-8322-740e0864398a', 'working', 1, 10, 12.0, 150, FALSE, '2026-06-03T17:45:40+00:00'),
  ('287c22f1-3d13-5993-887c-d54adefc533e', 'e102ca62-5b02-5034-8322-740e0864398a', 'working', 2, 10, 12.0, 150, FALSE, '2026-06-03T17:49:20+00:00'),
  ('d7965821-e691-59b3-b24a-796787a37169', 'e102ca62-5b02-5034-8322-740e0864398a', 'working', 3, 8, 12.0, 120, FALSE, '2026-06-03T17:52:24+00:00'),
  ('1a6268d5-ec0b-5f5a-8ba9-1cbe1e487245', 'ec884b5c-f064-5fbb-833a-b4890295f57f', 'working', 1, 10, 30.0, 90, FALSE, '2026-06-03T17:55:04+00:00'),
  ('cfe6ce52-e795-57f2-8649-ed500bbdc065', 'ec884b5c-f064-5fbb-833a-b4890295f57f', 'working', 2, 10, 30.0, 90, FALSE, '2026-06-03T17:57:44+00:00'),
  ('b079d9d7-185b-5f6e-894e-c02608e6d8d4', 'ec884b5c-f064-5fbb-833a-b4890295f57f', 'working', 3, 10, 30.0, 90, FALSE, '2026-06-03T18:00:24+00:00'),
  ('5761e34f-2675-5b28-a59e-18b206369828', 'bbd51eae-7f1f-5e3b-8129-f2c5e27e77b5', 'working', 1, 12, 4.0, 90, FALSE, '2026-06-03T18:03:10+00:00'),
  ('35fa2e5d-7471-5feb-b0de-08569f0ab0d2', 'bbd51eae-7f1f-5e3b-8129-f2c5e27e77b5', 'working', 2, 12, 4.0, 150, FALSE, '2026-06-03T18:06:56+00:00'),
  ('b931827b-fcf6-5479-8f2e-ca16fd75194b', 'bbd51eae-7f1f-5e3b-8129-f2c5e27e77b5', 'working', 3, 10, 4.0, 150, FALSE, '2026-06-03T18:10:36+00:00'),
  ('386b3c5a-1aaa-5247-ab1b-c9a0638c6c8e', '86c5ff31-7ed2-59c3-afa2-bdb342b8bf39', 'working', 1, 12, 6.0, 150, FALSE, '2026-06-03T18:14:22+00:00'),
  ('435ac1f7-149a-531c-a308-20cc69df5264', '86c5ff31-7ed2-59c3-afa2-bdb342b8bf39', 'working', 2, 12, 6.0, 120, FALSE, '2026-06-03T18:17:38+00:00'),
  ('459daf41-f1a6-529b-a261-ba29f2d3fe16', '86c5ff31-7ed2-59c3-afa2-bdb342b8bf39', 'working', 3, 12, 6.0, 60, FALSE, '2026-06-03T18:19:54+00:00'),
  ('b30bc8b3-6691-54d7-adac-ccc20caa2151', 'e796fa7e-c690-5c6d-82c3-85e312ec93fc', 'working', 1, 12, 15.0, 90, FALSE, '2026-06-03T18:22:40+00:00'),
  ('2fada684-88e4-5dc0-83a0-53d0f25de209', 'e796fa7e-c690-5c6d-82c3-85e312ec93fc', 'working', 2, 12, 15.0, 90, FALSE, '2026-06-03T18:25:26+00:00'),
  ('f6d53e73-2a49-53e7-b88e-867132791ebe', 'e796fa7e-c690-5c6d-82c3-85e312ec93fc', 'working', 3, 12, 15.0, 150, FALSE, '2026-06-03T18:29:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d143c97c-fd9d-5404-9c41-dc7029fe74b2', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-05T17:44:00+00:00', '2026-06-05T18:29:57+00:00', 2757, 3500.0, FALSE, 68.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('ae9e1a4d-96d3-5c3f-901d-f48ff12d1775', 'd143c97c-fd9d-5404-9c41-dc7029fe74b2', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('0d5759d5-082f-5319-9f55-2484096030c1', 'd143c97c-fd9d-5404-9c41-dc7029fe74b2', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('31e6e153-c89b-549b-b410-b6dc1a3772de', 'd143c97c-fd9d-5404-9c41-dc7029fe74b2', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('8be44358-c64f-5dcb-aaf0-b7e1612cfab3', 'd143c97c-fd9d-5404-9c41-dc7029fe74b2', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5bf0e611-8fb1-51fe-8b68-4a33ecd826e3', 'ae9e1a4d-96d3-5c3f-901d-f48ff12d1775', 'working', 1, 10, 60.0, 90, FALSE, '2026-06-05T17:51:40+00:00'),
  ('1aa52aa1-c645-5a08-acdf-4e14fd58dff1', 'ae9e1a4d-96d3-5c3f-901d-f48ff12d1775', 'working', 2, 10, 60.0, 90, FALSE, '2026-06-05T17:54:20+00:00'),
  ('1be388ac-f494-5459-90b4-8d2009c4b973', 'ae9e1a4d-96d3-5c3f-901d-f48ff12d1775', 'working', 3, 8, 60.0, 150, FALSE, '2026-06-05T17:57:54+00:00'),
  ('0f28faef-1461-5fb1-973e-3ce555257cc6', '0d5759d5-082f-5319-9f55-2484096030c1', 'working', 1, 10, 30.0, 150, FALSE, '2026-06-05T18:01:34+00:00'),
  ('ae925553-5310-5aba-9abf-b8551b885d83', '0d5759d5-082f-5319-9f55-2484096030c1', 'working', 2, 10, 30.0, 90, FALSE, '2026-06-05T18:04:14+00:00'),
  ('574370ce-0f26-5752-9389-39fd7b9826b2', '0d5759d5-082f-5319-9f55-2484096030c1', 'working', 3, 8, 30.0, 60, FALSE, '2026-06-05T18:06:18+00:00'),
  ('66471f82-c4ac-5db9-b123-26f59bc3a34e', '31e6e153-c89b-549b-b410-b6dc1a3772de', 'working', 1, 10, 35.0, 90, FALSE, '2026-06-05T18:08:58+00:00'),
  ('92c27497-ac8d-5881-84c7-59750d78aeb1', '31e6e153-c89b-549b-b410-b6dc1a3772de', 'working', 2, 10, 35.0, 150, FALSE, '2026-06-05T18:12:38+00:00'),
  ('592419e4-fbd2-53cb-9afa-20c9500e0086', '31e6e153-c89b-549b-b410-b6dc1a3772de', 'working', 3, 8, 35.0, 90, FALSE, '2026-06-05T18:15:12+00:00'),
  ('c1b88927-dcb6-5207-8422-6b5d7dac518a', '8be44358-c64f-5dcb-aaf0-b7e1612cfab3', 'working', 1, 35, 0.0, 150, FALSE, '2026-06-05T18:20:07+00:00'),
  ('2f20a3c6-5e40-5655-a28a-b1b547c3be8f', '8be44358-c64f-5dcb-aaf0-b7e1612cfab3', 'working', 2, 30, 0.0, 90, FALSE, '2026-06-05T18:23:47+00:00'),
  ('8fbfdf58-9354-597e-8218-f1c4a46fab38', '8be44358-c64f-5dcb-aaf0-b7e1612cfab3', 'working', 3, 30, 0.0, 60, FALSE, '2026-06-05T18:26:57+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2a72bbbe-707f-5fbc-87a2-1da8d6a9fcb5', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-12T17:25:00+00:00', '2026-06-12T18:11:30+00:00', 2790, 3975.0, FALSE, 68.0, 'gym', 200);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('f3f93cdf-c066-5af3-b374-50df9eb2956d', '2a72bbbe-707f-5fbc-87a2-1da8d6a9fcb5', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('838d2f8c-7a5d-5ab0-9a54-132927899ed2', '2a72bbbe-707f-5fbc-87a2-1da8d6a9fcb5', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('0c037459-66bb-594d-a40a-0a51b3d13f37', '2a72bbbe-707f-5fbc-87a2-1da8d6a9fcb5', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('0795bdba-7852-5ebd-bd1b-01a61bc5d3ed', '2a72bbbe-707f-5fbc-87a2-1da8d6a9fcb5', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5234e17d-bee9-58da-a6e8-b703d558cc25', 'f3f93cdf-c066-5af3-b374-50df9eb2956d', 'working', 1, 10, 65.0, 150, FALSE, '2026-06-12T17:33:40+00:00'),
  ('b691a15d-3f92-5668-9da4-2c8731c0fd18', 'f3f93cdf-c066-5af3-b374-50df9eb2956d', 'working', 2, 10, 65.0, 120, FALSE, '2026-06-12T17:36:50+00:00'),
  ('63f8b8bc-72b4-5acd-a9c0-8e352fc0f183', 'f3f93cdf-c066-5af3-b374-50df9eb2956d', 'working', 3, 10, 65.0, 120, FALSE, '2026-06-12T17:40:00+00:00'),
  ('436c03ff-86d2-56ea-a9a0-413696dd47ff', '838d2f8c-7a5d-5ab0-9a54-132927899ed2', 'working', 1, 10, 32.5, 120, FALSE, '2026-06-12T17:43:10+00:00'),
  ('d2026b77-243b-5773-818d-1f97641e7a79', '838d2f8c-7a5d-5ab0-9a54-132927899ed2', 'working', 2, 10, 32.5, 120, FALSE, '2026-06-12T17:46:20+00:00'),
  ('33e75b8d-7535-5ecb-9329-715c08cd6d4a', '838d2f8c-7a5d-5ab0-9a54-132927899ed2', 'working', 3, 10, 32.5, 90, FALSE, '2026-06-12T17:49:00+00:00'),
  ('ee4c6e90-12bf-5e26-8efd-1d8470c2619f', '0c037459-66bb-594d-a40a-0a51b3d13f37', 'working', 1, 10, 35.0, 90, FALSE, '2026-06-12T17:51:40+00:00'),
  ('9f771459-2263-5812-9f13-5c0292a1359b', '0c037459-66bb-594d-a40a-0a51b3d13f37', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-12T17:54:20+00:00'),
  ('f082d3a6-496e-5207-80ec-46af2db9c1fe', '0c037459-66bb-594d-a40a-0a51b3d13f37', 'working', 3, 10, 35.0, 90, FALSE, '2026-06-12T17:57:00+00:00'),
  ('5aaf13da-ae81-5751-948e-25800afc0cf0', '0795bdba-7852-5ebd-bd1b-01a61bc5d3ed', 'working', 1, 40, 0.0, 60, FALSE, '2026-06-12T18:00:40+00:00'),
  ('990ffaa3-6c00-5094-ba82-6823c81ca392', '0795bdba-7852-5ebd-bd1b-01a61bc5d3ed', 'working', 2, 35, 0.0, 90, FALSE, '2026-06-12T18:04:35+00:00'),
  ('171f1a6a-0011-5bb8-beb4-08f730ef14cd', '0795bdba-7852-5ebd-bd1b-01a61bc5d3ed', 'working', 3, 35, 0.0, 90, FALSE, '2026-06-12T18:08:30+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('e762f808-99a6-53ed-8f95-e44589689aa0', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-15T17:10:00+00:00', '2026-06-15T17:55:12+00:00', 2712, 4012.5, FALSE, 68.0, 'gym', 204);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('464974eb-994c-55a6-81c5-655b3756286b', 'e762f808-99a6-53ed-8f95-e44589689aa0', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1b336a2a-f24c-5192-9acc-ce662b88f30f', 'e762f808-99a6-53ed-8f95-e44589689aa0', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('3916ae1e-bf09-5875-a869-10975bc9f892', 'e762f808-99a6-53ed-8f95-e44589689aa0', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('9ae045d4-836b-509a-8914-ecb84b525a6a', 'e762f808-99a6-53ed-8f95-e44589689aa0', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('3667b77b-1c1f-510d-8c7a-1539840ad128', '464974eb-994c-55a6-81c5-655b3756286b', 'working', 1, 10, 65.0, 60, FALSE, '2026-06-15T17:17:10+00:00'),
  ('8d245737-7135-5f9e-8c25-0096dbe3ae72', '464974eb-994c-55a6-81c5-655b3756286b', 'working', 2, 10, 65.0, 120, FALSE, '2026-06-15T17:20:20+00:00'),
  ('65de1310-a204-5cb4-a5c1-602c10f15ef1', '464974eb-994c-55a6-81c5-655b3756286b', 'working', 3, 10, 65.0, 90, FALSE, '2026-06-15T17:23:00+00:00'),
  ('4a2ab814-553d-5a81-9060-22e1acbe4315', '1b336a2a-f24c-5192-9acc-ce662b88f30f', 'working', 1, 10, 32.5, 150, FALSE, '2026-06-15T17:26:40+00:00'),
  ('5d1ac01d-1a76-535b-a3da-c3c34c743668', '1b336a2a-f24c-5192-9acc-ce662b88f30f', 'working', 2, 10, 32.5, 90, FALSE, '2026-06-15T17:29:20+00:00'),
  ('236d3807-983d-5977-a091-e40e1e5827dd', '1b336a2a-f24c-5192-9acc-ce662b88f30f', 'working', 3, 10, 32.5, 120, FALSE, '2026-06-15T17:32:30+00:00'),
  ('ecc195a4-04f6-5a09-bc72-80e5ff7a0b80', '3916ae1e-bf09-5875-a869-10975bc9f892', 'working', 1, 10, 37.5, 60, FALSE, '2026-06-15T17:34:40+00:00'),
  ('7ef9a7e7-4036-52f6-a2cf-fdd91e254f16', '3916ae1e-bf09-5875-a869-10975bc9f892', 'working', 2, 10, 37.5, 150, FALSE, '2026-06-15T17:38:20+00:00'),
  ('d9f8de20-2369-5f72-8674-b2a2e5880fb1', '3916ae1e-bf09-5875-a869-10975bc9f892', 'working', 3, 9, 37.5, 120, FALSE, '2026-06-15T17:41:27+00:00'),
  ('d16f4332-464c-539d-8f57-864d89b991a0', '9ae045d4-836b-509a-8914-ecb84b525a6a', 'working', 1, 40, 0.0, 60, FALSE, '2026-06-15T17:45:07+00:00'),
  ('31ff2c27-379a-5673-b56d-61a14efc6058', '9ae045d4-836b-509a-8914-ecb84b525a6a', 'working', 2, 40, 0.0, 60, FALSE, '2026-06-15T17:48:47+00:00'),
  ('8b07d6f7-b91a-5ee8-8749-fee0c1475b5d', '9ae045d4-836b-509a-8914-ecb84b525a6a', 'working', 3, 35, 0.0, 60, FALSE, '2026-06-15T17:52:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('703a47da-12cc-547b-abba-3f9bde83dd1f', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-06-17T17:44:00+00:00', '2026-06-17T18:32:51+00:00', 2931, 2156.0, FALSE, 68.0, 'gym', 167);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('f0a7242f-8e5f-5bcd-993a-6b7905fb2aba', '703a47da-12cc-547b-abba-3f9bde83dd1f', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('abac5ed5-a020-5d37-92cb-33ecf540cad8', '703a47da-12cc-547b-abba-3f9bde83dd1f', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('072aae2a-7dd0-5473-9c2d-1a41b4d8c99c', '703a47da-12cc-547b-abba-3f9bde83dd1f', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('7a21105d-8e62-5526-83ae-e4e92bd6c2c8', '703a47da-12cc-547b-abba-3f9bde83dd1f', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('79ddfdb1-40ce-5597-ac47-62d2cd1b185b', '703a47da-12cc-547b-abba-3f9bde83dd1f', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2202564d-276a-58d5-94ad-4d0b92135c2d', 'f0a7242f-8e5f-5bcd-993a-6b7905fb2aba', 'working', 1, 10, 12.0, 90, FALSE, '2026-06-17T17:51:40+00:00'),
  ('d00a7c18-802a-568f-bb8c-331efca556cd', 'f0a7242f-8e5f-5bcd-993a-6b7905fb2aba', 'working', 2, 10, 12.0, 60, FALSE, '2026-06-17T17:53:50+00:00'),
  ('94ef809e-ef8e-55c1-9fff-f3dcf8e32a89', 'f0a7242f-8e5f-5bcd-993a-6b7905fb2aba', 'working', 3, 10, 12.0, 60, FALSE, '2026-06-17T17:56:00+00:00'),
  ('e46934fc-cf2b-5f7f-bb8c-5ce1ba9551a3', 'abac5ed5-a020-5d37-92cb-33ecf540cad8', 'working', 1, 10, 30.0, 90, FALSE, '2026-06-17T17:58:40+00:00'),
  ('5f037a34-a83f-59cc-84ef-5843a0072d9d', 'abac5ed5-a020-5d37-92cb-33ecf540cad8', 'working', 2, 10, 30.0, 60, FALSE, '2026-06-17T18:00:50+00:00'),
  ('baa032b1-92c4-5948-86a0-d717a382a896', 'abac5ed5-a020-5d37-92cb-33ecf540cad8', 'working', 3, 10, 30.0, 60, FALSE, '2026-06-17T18:03:00+00:00'),
  ('65c08550-c205-5b93-a2c0-3097d911fd6d', '072aae2a-7dd0-5473-9c2d-1a41b4d8c99c', 'working', 1, 12, 4.0, 60, FALSE, '2026-06-17T18:05:16+00:00'),
  ('0c5a061e-1061-50f1-9534-f652e8d9d28c', '072aae2a-7dd0-5473-9c2d-1a41b4d8c99c', 'working', 2, 12, 4.0, 90, FALSE, '2026-06-17T18:08:02+00:00'),
  ('fe211956-1024-57a4-a010-a37129d72c57', '072aae2a-7dd0-5473-9c2d-1a41b4d8c99c', 'working', 3, 11, 4.0, 120, FALSE, '2026-06-17T18:11:15+00:00'),
  ('7b9945d8-f793-5b15-9e0e-b65a04bbf1f3', '7a21105d-8e62-5526-83ae-e4e92bd6c2c8', 'working', 1, 12, 6.0, 60, FALSE, '2026-06-17T18:13:31+00:00'),
  ('f5d15331-163d-53f4-a7df-242f417faef5', '7a21105d-8e62-5526-83ae-e4e92bd6c2c8', 'working', 2, 12, 6.0, 150, FALSE, '2026-06-17T18:17:17+00:00'),
  ('d74c24f1-b38a-507b-b56f-7a97e9a05544', '7a21105d-8e62-5526-83ae-e4e92bd6c2c8', 'working', 3, 12, 6.0, 120, FALSE, '2026-06-17T18:20:33+00:00'),
  ('3e02b53a-683f-59ed-a4e7-308e9c3c64bb', '79ddfdb1-40ce-5597-ac47-62d2cd1b185b', 'working', 1, 12, 15.0, 90, FALSE, '2026-06-17T18:23:19+00:00'),
  ('f5bcdc18-ba1e-5b1d-bc33-a5481fe44945', '79ddfdb1-40ce-5597-ac47-62d2cd1b185b', 'working', 2, 12, 15.0, 150, FALSE, '2026-06-17T18:27:05+00:00'),
  ('d60c752b-ec97-5454-94d3-7e5c559a4c69', '79ddfdb1-40ce-5597-ac47-62d2cd1b185b', 'working', 3, 12, 15.0, 90, FALSE, '2026-06-17T18:29:51+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1874fccb-9d63-5122-adcb-ff8c4da81066', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-19T17:08:00+00:00', '2026-06-19T17:52:00+00:00', 2640, 4275.0, FALSE, 68.0, 'gym', 210);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('30aa3d12-c8b5-5dbd-9c29-d8e2985d6dab', '1874fccb-9d63-5122-adcb-ff8c4da81066', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a63d7c55-8294-5fb9-801c-c12b82b0bdce', '1874fccb-9d63-5122-adcb-ff8c4da81066', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('bd654d5b-e049-5b9c-89de-26dfd2dccfc0', '1874fccb-9d63-5122-adcb-ff8c4da81066', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('854e9f0a-1aec-506d-9e16-9f5532f6f303', '1874fccb-9d63-5122-adcb-ff8c4da81066', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('b08c87b4-979e-598f-9393-de5848b6e8d3', '30aa3d12-c8b5-5dbd-9c29-d8e2985d6dab', 'working', 1, 10, 70.0, 150, FALSE, '2026-06-19T17:16:40+00:00'),
  ('8b156cc7-15b8-5e66-b1ef-1471c2271f2c', '30aa3d12-c8b5-5dbd-9c29-d8e2985d6dab', 'working', 2, 10, 70.0, 90, FALSE, '2026-06-19T17:19:20+00:00'),
  ('48d1bee9-4518-508c-bfb1-f156410f24be', '30aa3d12-c8b5-5dbd-9c29-d8e2985d6dab', 'working', 3, 10, 70.0, 120, FALSE, '2026-06-19T17:22:30+00:00'),
  ('99bf109e-b6d3-5e3b-b227-4bfcf37bdf38', 'a63d7c55-8294-5fb9-801c-c12b82b0bdce', 'working', 1, 10, 35.0, 60, FALSE, '2026-06-19T17:24:40+00:00'),
  ('a4f578a1-979e-5428-af95-f2df1217af58', 'a63d7c55-8294-5fb9-801c-c12b82b0bdce', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-19T17:27:20+00:00'),
  ('b765ba5e-a6bf-5047-b017-8f3fc6f75822', 'a63d7c55-8294-5fb9-801c-c12b82b0bdce', 'working', 3, 10, 35.0, 60, FALSE, '2026-06-19T17:29:30+00:00'),
  ('5e5c8a3a-31d8-5392-9561-41f4a1d7d52d', 'bd654d5b-e049-5b9c-89de-26dfd2dccfc0', 'working', 1, 10, 37.5, 90, FALSE, '2026-06-19T17:32:10+00:00'),
  ('13880ef8-3f99-542b-a9ce-fe51fc0fcad7', 'bd654d5b-e049-5b9c-89de-26dfd2dccfc0', 'working', 2, 10, 37.5, 60, FALSE, '2026-06-19T17:34:20+00:00'),
  ('c114c5bb-a3f1-55ce-93d1-288389264a44', 'bd654d5b-e049-5b9c-89de-26dfd2dccfc0', 'working', 3, 10, 37.5, 90, FALSE, '2026-06-19T17:37:00+00:00'),
  ('8c901482-7454-5b85-aa2d-8a9ecb51885e', '854e9f0a-1aec-506d-9e16-9f5532f6f303', 'working', 1, 35, 0.0, 90, FALSE, '2026-06-19T17:40:55+00:00'),
  ('0db2e651-5a67-5095-801a-59c1a3aa0fad', '854e9f0a-1aec-506d-9e16-9f5532f6f303', 'working', 2, 45, 0.0, 60, FALSE, '2026-06-19T17:44:50+00:00'),
  ('f975f9d7-94cf-5e6b-bfcb-6cd2c099fefe', '854e9f0a-1aec-506d-9e16-9f5532f6f303', 'working', 3, 40, 0.0, 90, FALSE, '2026-06-19T17:49:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('052f0b68-6fcf-5df9-b470-4e0953049757', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-22T17:17:00+00:00', '2026-06-22T18:03:12+00:00', 2772, 4240.0, FALSE, 68.0, 'gym', 214);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('6d7eabfe-5d90-566d-bb1d-f1a4856e5069', '052f0b68-6fcf-5df9-b470-4e0953049757', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('e790d1d4-5858-5325-ac38-bceda719c7c3', '052f0b68-6fcf-5df9-b470-4e0953049757', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('e93173bf-d503-5ba9-891d-a47788c4e5ce', '052f0b68-6fcf-5df9-b470-4e0953049757', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('c437fae2-b2c8-5c71-b4fc-8a677324c89b', '052f0b68-6fcf-5df9-b470-4e0953049757', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('345888e3-5c0a-58c5-a0e4-05c2f3b9ee18', '6d7eabfe-5d90-566d-bb1d-f1a4856e5069', 'working', 1, 10, 70.0, 60, FALSE, '2026-06-22T17:24:10+00:00'),
  ('aa9d4393-d875-55cf-8802-1f8aafffdc8c', '6d7eabfe-5d90-566d-bb1d-f1a4856e5069', 'working', 2, 10, 70.0, 120, FALSE, '2026-06-22T17:27:20+00:00'),
  ('0882a3d3-4cfb-55ed-a473-ee86e649abe5', '6d7eabfe-5d90-566d-bb1d-f1a4856e5069', 'working', 3, 10, 70.0, 150, FALSE, '2026-06-22T17:31:00+00:00'),
  ('5fed94e5-6287-5a89-9ff1-e588bbf6bace', 'e790d1d4-5858-5325-ac38-bceda719c7c3', 'working', 1, 10, 35.0, 60, FALSE, '2026-06-22T17:33:10+00:00'),
  ('e55df115-6169-5915-9b15-55ee3ce93b5a', 'e790d1d4-5858-5325-ac38-bceda719c7c3', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-22T17:35:50+00:00'),
  ('8c4a6d44-ea19-5ef0-a2d2-65e421f80bad', 'e790d1d4-5858-5325-ac38-bceda719c7c3', 'working', 3, 9, 35.0, 120, FALSE, '2026-06-22T17:38:57+00:00'),
  ('1e1004ce-64ed-5b30-a61e-6a102fe0dda1', 'e93173bf-d503-5ba9-891d-a47788c4e5ce', 'working', 1, 10, 37.5, 120, FALSE, '2026-06-22T17:42:07+00:00'),
  ('4cae7446-6dce-53d1-bd77-9b004d6b2e5d', 'e93173bf-d503-5ba9-891d-a47788c4e5ce', 'working', 2, 10, 37.5, 150, FALSE, '2026-06-22T17:45:47+00:00'),
  ('5682aa99-0dcf-5869-a33c-8fdcf778bee6', 'e93173bf-d503-5ba9-891d-a47788c4e5ce', 'working', 3, 10, 37.5, 90, FALSE, '2026-06-22T17:48:27+00:00'),
  ('9fe0e497-523c-5132-afa3-c6c0d5f34bff', 'c437fae2-b2c8-5c71-b4fc-8a677324c89b', 'working', 1, 45, 0.0, 60, FALSE, '2026-06-22T17:52:22+00:00'),
  ('cb667857-ccd5-5bfd-bb0b-edd864401aee', 'c437fae2-b2c8-5c71-b4fc-8a677324c89b', 'working', 2, 35, 0.0, 60, FALSE, '2026-06-22T17:55:47+00:00'),
  ('3b477023-d2a3-509a-a497-0602f173c2e5', 'c437fae2-b2c8-5c71-b4fc-8a677324c89b', 'working', 3, 45, 0.0, 90, FALSE, '2026-06-22T18:00:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3f606772-7369-5d40-ae73-481d5ca9001b', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-26T17:19:00+00:00', '2026-06-26T18:06:30+00:00', 2850, 4575.0, FALSE, 68.0, 'gym', 230);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('39ddc5d0-0e62-5a2d-97a2-99d56859f943', '3f606772-7369-5d40-ae73-481d5ca9001b', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1c91bde3-e0c6-573d-b609-4580897026d9', '3f606772-7369-5d40-ae73-481d5ca9001b', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('a7c77a53-7d78-5a97-84cd-8f97093813fc', '3f606772-7369-5d40-ae73-481d5ca9001b', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('6263ff0c-abf3-5e64-965e-4213d0c1ebe6', '3f606772-7369-5d40-ae73-481d5ca9001b', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4eed3055-6ad2-5cef-a47e-2c5253ea787f', '39ddc5d0-0e62-5a2d-97a2-99d56859f943', 'working', 1, 10, 75.0, 60, FALSE, '2026-06-26T17:26:10+00:00'),
  ('117050a0-efcb-5a65-8c80-2d05b7231f26', '39ddc5d0-0e62-5a2d-97a2-99d56859f943', 'working', 2, 10, 75.0, 90, FALSE, '2026-06-26T17:28:50+00:00'),
  ('058fe14f-5f57-5ada-a010-8c322cb43c25', '39ddc5d0-0e62-5a2d-97a2-99d56859f943', 'working', 3, 10, 75.0, 150, FALSE, '2026-06-26T17:32:30+00:00'),
  ('0195ef5f-5713-511d-b735-cad6111bbc3a', '1c91bde3-e0c6-573d-b609-4580897026d9', 'working', 1, 10, 37.5, 150, FALSE, '2026-06-26T17:36:10+00:00'),
  ('a0c22fb8-2a3e-51e1-bbef-c8820e6aa0c9', '1c91bde3-e0c6-573d-b609-4580897026d9', 'working', 2, 10, 37.5, 90, FALSE, '2026-06-26T17:38:50+00:00'),
  ('753c4905-2a2f-52a2-9f5c-1bc5d26b44e3', '1c91bde3-e0c6-573d-b609-4580897026d9', 'working', 3, 10, 37.5, 90, FALSE, '2026-06-26T17:41:30+00:00'),
  ('5033de7d-641b-5382-ad56-e4f8165723e3', 'a7c77a53-7d78-5a97-84cd-8f97093813fc', 'working', 1, 10, 40.0, 90, FALSE, '2026-06-26T17:44:10+00:00'),
  ('c9bf6c19-40fb-5075-91f6-5960d587af5b', 'a7c77a53-7d78-5a97-84cd-8f97093813fc', 'working', 2, 10, 40.0, 120, FALSE, '2026-06-26T17:47:20+00:00'),
  ('6bb993ec-2721-5d2c-85b9-a98303e95f01', 'a7c77a53-7d78-5a97-84cd-8f97093813fc', 'working', 3, 10, 40.0, 60, FALSE, '2026-06-26T17:49:30+00:00'),
  ('c4ed93fa-9bda-534b-8125-572bd42ee303', '6263ff0c-abf3-5e64-965e-4213d0c1ebe6', 'working', 1, 50, 0.0, 150, FALSE, '2026-06-26T17:55:10+00:00'),
  ('bce99b84-bc3d-5b86-9533-02bcf80adeb0', '6263ff0c-abf3-5e64-965e-4213d0c1ebe6', 'working', 2, 45, 0.0, 60, FALSE, '2026-06-26T17:59:05+00:00'),
  ('9bd3065a-7d67-505a-b66e-116107451af9', '6263ff0c-abf3-5e64-965e-4213d0c1ebe6', 'working', 3, 45, 0.0, 90, FALSE, '2026-06-26T18:03:30+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('438098ed-885b-5079-a13c-46c3c5687a4e', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-06-29T17:32:00+00:00', '2026-06-29T18:17:06+00:00', 2706, 4457.5, FALSE, 68.0, 'gym', 212);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2607dcfe-99a7-5bf3-9158-94e869fe4f89', '438098ed-885b-5079-a13c-46c3c5687a4e', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a8ddf849-631c-5e5c-aa15-0b284f0d434e', '438098ed-885b-5079-a13c-46c3c5687a4e', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('649185a9-525e-5b6c-becc-929c66b42e41', '438098ed-885b-5079-a13c-46c3c5687a4e', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('b5432868-22d5-5a5f-930f-f4db2bec734e', '438098ed-885b-5079-a13c-46c3c5687a4e', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e2e4927d-aaab-51e0-855b-c39bbf0d47bd', '2607dcfe-99a7-5bf3-9158-94e869fe4f89', 'working', 1, 10, 75.0, 90, FALSE, '2026-06-29T17:39:40+00:00'),
  ('052f6450-c712-571d-b024-ac041b1a034a', '2607dcfe-99a7-5bf3-9158-94e869fe4f89', 'working', 2, 10, 75.0, 90, FALSE, '2026-06-29T17:42:20+00:00'),
  ('fdce2a2f-6094-5997-bc90-38fb3604e290', '2607dcfe-99a7-5bf3-9158-94e869fe4f89', 'working', 3, 10, 75.0, 120, FALSE, '2026-06-29T17:45:30+00:00'),
  ('b264b19c-08c5-5b2e-a88f-e60b9fc418b9', 'a8ddf849-631c-5e5c-aa15-0b284f0d434e', 'working', 1, 10, 37.5, 60, FALSE, '2026-06-29T17:47:40+00:00'),
  ('65503b97-33f6-5b16-9bb1-457e80f3f4dd', 'a8ddf849-631c-5e5c-aa15-0b284f0d434e', 'working', 2, 10, 37.5, 90, FALSE, '2026-06-29T17:50:20+00:00'),
  ('d720e9ef-2dcf-5e3f-87c8-8f9460fbede4', 'a8ddf849-631c-5e5c-aa15-0b284f0d434e', 'working', 3, 9, 37.5, 120, FALSE, '2026-06-29T17:53:27+00:00'),
  ('c111ca98-2adc-54ba-87b2-b7b0c0468db1', '649185a9-525e-5b6c-becc-929c66b42e41', 'working', 1, 10, 40.0, 90, FALSE, '2026-06-29T17:56:07+00:00'),
  ('c7f5a75d-f6b0-5d44-acae-e12f1bc6cab5', '649185a9-525e-5b6c-becc-929c66b42e41', 'working', 2, 10, 40.0, 60, FALSE, '2026-06-29T17:58:17+00:00'),
  ('8937b561-ecd5-502b-9c7e-0de68800f443', '649185a9-525e-5b6c-becc-929c66b42e41', 'working', 3, 8, 40.0, 90, FALSE, '2026-06-29T18:00:51+00:00'),
  ('5fd57799-1e34-5493-93c6-8483a586008c', 'b5432868-22d5-5a5f-930f-f4db2bec734e', 'working', 1, 40, 0.0, 90, FALSE, '2026-06-29T18:05:01+00:00'),
  ('2a96c3cf-758e-5f70-97f8-bc6f970bbceb', 'b5432868-22d5-5a5f-930f-f4db2bec734e', 'working', 2, 45, 0.0, 90, FALSE, '2026-06-29T18:09:26+00:00'),
  ('94680afe-7d6f-5888-b43f-4d210d76d4b2', 'b5432868-22d5-5a5f-930f-f4db2bec734e', 'working', 3, 40, 0.0, 120, FALSE, '2026-06-29T18:14:06+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('396f2ec6-7791-5b79-abd8-0ed699ee2fd3', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-03T17:23:00+00:00', '2026-07-03T18:11:15+00:00', 2895, 4800.0, FALSE, 68.0, 'gym', 235);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('02ac0190-6fd7-56eb-aa00-7dd1ffa0a6fc', '396f2ec6-7791-5b79-abd8-0ed699ee2fd3', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('21324e91-425a-5fae-a804-46d20ab6a312', '396f2ec6-7791-5b79-abd8-0ed699ee2fd3', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('612e60fa-67a8-507f-8a40-bd0f188697cd', '396f2ec6-7791-5b79-abd8-0ed699ee2fd3', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('e3c89a61-7dc8-53a9-82de-7e51996768c3', '396f2ec6-7791-5b79-abd8-0ed699ee2fd3', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('82fde164-34d6-59be-bc44-c9ad8dc3f263', '02ac0190-6fd7-56eb-aa00-7dd1ffa0a6fc', 'working', 1, 10, 80.0, 90, FALSE, '2026-07-03T17:30:40+00:00'),
  ('8cd91df7-02a1-5f23-ae7a-0ccf165702a4', '02ac0190-6fd7-56eb-aa00-7dd1ffa0a6fc', 'working', 2, 10, 80.0, 120, FALSE, '2026-07-03T17:33:50+00:00'),
  ('bfbf510e-8ebb-59df-86fa-b49b2c904863', '02ac0190-6fd7-56eb-aa00-7dd1ffa0a6fc', 'working', 3, 10, 80.0, 120, FALSE, '2026-07-03T17:37:00+00:00'),
  ('7e8bd9a8-693b-5ff7-8364-1f885be119a9', '21324e91-425a-5fae-a804-46d20ab6a312', 'working', 1, 10, 40.0, 120, FALSE, '2026-07-03T17:40:10+00:00'),
  ('a55bcf53-2f5d-5d4a-a43b-26caba0318c5', '21324e91-425a-5fae-a804-46d20ab6a312', 'working', 2, 10, 40.0, 150, FALSE, '2026-07-03T17:43:50+00:00'),
  ('49b3d633-cf6a-5082-95bb-a71904ad8edb', '21324e91-425a-5fae-a804-46d20ab6a312', 'working', 3, 10, 40.0, 90, FALSE, '2026-07-03T17:46:30+00:00'),
  ('cd756b17-17f0-597f-86d4-afdbc7883ca2', '612e60fa-67a8-507f-8a40-bd0f188697cd', 'working', 1, 10, 40.0, 90, FALSE, '2026-07-03T17:49:10+00:00'),
  ('6ed74ac0-ed3f-5901-b87f-f9c9788aae23', '612e60fa-67a8-507f-8a40-bd0f188697cd', 'working', 2, 10, 40.0, 90, FALSE, '2026-07-03T17:51:50+00:00'),
  ('2db57bab-5f66-5fe8-8f99-66347cb1137e', '612e60fa-67a8-507f-8a40-bd0f188697cd', 'working', 3, 10, 40.0, 90, FALSE, '2026-07-03T17:54:30+00:00'),
  ('c53d4df2-7b24-5883-a263-796c343853eb', 'e3c89a61-7dc8-53a9-82de-7e51996768c3', 'working', 1, 45, 0.0, 90, FALSE, '2026-07-03T17:58:55+00:00'),
  ('23171e70-c56b-54aa-b731-517553ad32ab', 'e3c89a61-7dc8-53a9-82de-7e51996768c3', 'working', 2, 50, 0.0, 90, FALSE, '2026-07-03T18:03:35+00:00'),
  ('b3015804-3eaa-5d5c-9e38-03ce9089d295', 'e3c89a61-7dc8-53a9-82de-7e51996768c3', 'working', 3, 50, 0.0, 90, FALSE, '2026-07-03T18:08:15+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('9105f22d-e720-5202-a658-10726bf28cc5', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-06T17:31:00+00:00', '2026-07-06T18:17:24+00:00', 2784, 4790.0, FALSE, 68.0, 'gym', 238);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8a482824-5f1d-5c50-9c02-ab920cfb23f4', '9105f22d-e720-5202-a658-10726bf28cc5', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('6cbb58cf-672b-53b1-8e17-ac11969a7ee8', '9105f22d-e720-5202-a658-10726bf28cc5', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('e42ee5a1-609e-55c0-a51d-d1e1d3f462ab', '9105f22d-e720-5202-a658-10726bf28cc5', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('52d46e06-282b-5d20-b728-1001ec6e5ffa', '9105f22d-e720-5202-a658-10726bf28cc5', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('dd16a4c0-d5ab-5e9b-a219-6ed49f239dfa', '8a482824-5f1d-5c50-9c02-ab920cfb23f4', 'working', 1, 10, 80.0, 90, FALSE, '2026-07-06T17:38:40+00:00'),
  ('15daa503-4114-573c-b86a-94562adb3409', '8a482824-5f1d-5c50-9c02-ab920cfb23f4', 'working', 2, 10, 80.0, 60, FALSE, '2026-07-06T17:40:50+00:00'),
  ('477b2cbe-da8a-5b8b-af25-3f8df98c54ea', '8a482824-5f1d-5c50-9c02-ab920cfb23f4', 'working', 3, 10, 80.0, 90, FALSE, '2026-07-06T17:43:30+00:00'),
  ('40048b37-dd0f-539c-836c-18c7c2fc9978', '6cbb58cf-672b-53b1-8e17-ac11969a7ee8', 'working', 1, 10, 40.0, 90, FALSE, '2026-07-06T17:46:10+00:00'),
  ('504a83c5-e27b-5ffb-b31f-376941fe24b9', '6cbb58cf-672b-53b1-8e17-ac11969a7ee8', 'working', 2, 10, 40.0, 60, FALSE, '2026-07-06T17:48:20+00:00'),
  ('9d000fc6-0c01-597e-89a5-3309265a691a', '6cbb58cf-672b-53b1-8e17-ac11969a7ee8', 'working', 3, 10, 40.0, 90, FALSE, '2026-07-06T17:51:00+00:00'),
  ('c49096d5-3a6e-5d19-8d76-975e2f9bec32', 'e42ee5a1-609e-55c0-a51d-d1e1d3f462ab', 'working', 1, 10, 42.5, 120, FALSE, '2026-07-06T17:54:10+00:00'),
  ('d886e624-1771-5fdd-8f91-d01109d33ead', 'e42ee5a1-609e-55c0-a51d-d1e1d3f462ab', 'working', 2, 10, 42.5, 90, FALSE, '2026-07-06T17:56:50+00:00'),
  ('acf4f753-7a14-5985-bd45-63d9439f224f', 'e42ee5a1-609e-55c0-a51d-d1e1d3f462ab', 'working', 3, 8, 42.5, 120, FALSE, '2026-07-06T17:59:54+00:00'),
  ('8210c022-6de2-53a2-96d7-cadba1575447', '52d46e06-282b-5d20-b728-1001ec6e5ffa', 'working', 1, 55, 0.0, 90, FALSE, '2026-07-06T18:04:49+00:00'),
  ('a0fe73cb-0521-5f98-b5e0-5497334bcc17', '52d46e06-282b-5d20-b728-1001ec6e5ffa', 'working', 2, 45, 0.0, 90, FALSE, '2026-07-06T18:09:14+00:00'),
  ('1a6494d1-9203-57fd-b8b2-a6da1820f2d7', '52d46e06-282b-5d20-b728-1001ec6e5ffa', 'working', 3, 50, 0.0, 120, FALSE, '2026-07-06T18:14:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-07-08T17:45:00+00:00', '2026-07-08T18:37:12+00:00', 3132, 2190.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b5cadc1e-a807-5c8b-af20-1b94c0c606fe', '60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('49d92dd4-41bd-5393-b091-5cb7bcc3a636', '60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('03c7a8c1-07b7-51e5-8f6c-464dc533b1e4', '60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('1cf0943a-6ae4-5973-bde2-cdd2fd688443', '60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('24c85cba-c9e0-5678-8948-9c25ca2bfc5d', '60cee5ce-c3fe-5ae8-a742-6a3c812b7e81', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('075eb9b0-9505-5894-b402-4d420378faa5', 'b5cadc1e-a807-5c8b-af20-1b94c0c606fe', 'working', 1, 10, 12.0, 60, FALSE, '2026-07-08T17:52:10+00:00'),
  ('4182f8ec-0864-5a69-b3c5-9a58f9acac18', 'b5cadc1e-a807-5c8b-af20-1b94c0c606fe', 'working', 2, 10, 12.0, 60, FALSE, '2026-07-08T17:54:20+00:00'),
  ('4fbb7030-2659-525e-8b14-61f6460f1e8d', 'b5cadc1e-a807-5c8b-af20-1b94c0c606fe', 'working', 3, 8, 12.0, 60, FALSE, '2026-07-08T17:56:24+00:00'),
  ('1344edf0-e91c-5bf6-8e87-4a9ccb88aa76', '49d92dd4-41bd-5393-b091-5cb7bcc3a636', 'working', 1, 10, 32.5, 90, FALSE, '2026-07-08T17:59:04+00:00'),
  ('1106453c-b407-5469-9417-2a04db41a76d', '49d92dd4-41bd-5393-b091-5cb7bcc3a636', 'working', 2, 10, 32.5, 60, FALSE, '2026-07-08T18:01:14+00:00'),
  ('29786653-b872-566f-9fb8-eabbbc513368', '49d92dd4-41bd-5393-b091-5cb7bcc3a636', 'working', 3, 10, 32.5, 150, FALSE, '2026-07-08T18:04:54+00:00'),
  ('4241fef5-0f91-5598-a9bb-81b93785734c', '03c7a8c1-07b7-51e5-8f6c-464dc533b1e4', 'working', 1, 12, 4.0, 150, FALSE, '2026-07-08T18:08:40+00:00'),
  ('fe4a5948-3b58-5897-9672-6a00c5029bf2', '03c7a8c1-07b7-51e5-8f6c-464dc533b1e4', 'working', 2, 12, 4.0, 150, FALSE, '2026-07-08T18:12:26+00:00'),
  ('9c0be5d9-302b-5bfb-a042-f9e054a87f9c', '03c7a8c1-07b7-51e5-8f6c-464dc533b1e4', 'working', 3, 12, 4.0, 150, FALSE, '2026-07-08T18:16:12+00:00'),
  ('6a97cf67-1386-5000-9fee-8da793130b2a', '1cf0943a-6ae4-5973-bde2-cdd2fd688443', 'working', 1, 12, 6.0, 150, FALSE, '2026-07-08T18:19:58+00:00'),
  ('a706dd3d-332d-5c9e-adf4-2365c0423829', '1cf0943a-6ae4-5973-bde2-cdd2fd688443', 'working', 2, 12, 6.0, 120, FALSE, '2026-07-08T18:23:14+00:00'),
  ('85c1453a-54b1-531d-873f-2f5b106d7256', '1cf0943a-6ae4-5973-bde2-cdd2fd688443', 'working', 3, 11, 6.0, 60, FALSE, '2026-07-08T18:25:27+00:00'),
  ('f6b2d828-91e4-5846-8f05-ba69bb7a4099', '24c85cba-c9e0-5678-8948-9c25ca2bfc5d', 'working', 1, 12, 15.0, 90, FALSE, '2026-07-08T18:28:13+00:00'),
  ('98d53b57-0c17-511f-969b-af063e88d4d1', '24c85cba-c9e0-5678-8948-9c25ca2bfc5d', 'working', 2, 12, 15.0, 60, FALSE, '2026-07-08T18:30:29+00:00'),
  ('e6617c84-20ae-51e2-9d36-1217db3e834a', '24c85cba-c9e0-5678-8948-9c25ca2bfc5d', 'working', 3, 11, 15.0, 150, FALSE, '2026-07-08T18:34:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('88586c7d-0c48-5cf5-8b9d-c5634d167b00', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-10T17:34:00+00:00', '2026-07-10T18:22:24+00:00', 2904, 5015.0, FALSE, 68.0, 'gym', 258);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('df277105-c61a-5291-a81d-516ca8016ca7', '88586c7d-0c48-5cf5-8b9d-c5634d167b00', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ca10d55b-2de9-5f97-a5f6-01d42188e899', '88586c7d-0c48-5cf5-8b9d-c5634d167b00', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('6e53582b-aae7-529f-a2eb-93b7f80c607a', '88586c7d-0c48-5cf5-8b9d-c5634d167b00', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('2d33a0c9-3cb9-5ab1-a13b-c97c3e037da6', '88586c7d-0c48-5cf5-8b9d-c5634d167b00', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('121c2e57-3045-5054-b017-bc4a5378e857', 'df277105-c61a-5291-a81d-516ca8016ca7', 'working', 1, 10, 85.0, 90, FALSE, '2026-07-10T17:41:40+00:00'),
  ('8b92487a-d747-5400-8931-f6974886d8dc', 'df277105-c61a-5291-a81d-516ca8016ca7', 'working', 2, 10, 85.0, 90, FALSE, '2026-07-10T17:44:20+00:00'),
  ('c788084d-826f-57e4-96d0-e232d304d85e', 'df277105-c61a-5291-a81d-516ca8016ca7', 'working', 3, 10, 85.0, 90, FALSE, '2026-07-10T17:47:00+00:00'),
  ('66123d00-f16a-5395-a0c5-370434658fd8', 'ca10d55b-2de9-5f97-a5f6-01d42188e899', 'working', 1, 10, 42.5, 90, FALSE, '2026-07-10T17:49:40+00:00'),
  ('712ad6ca-9bef-5a0f-a5de-9acb0323dbea', 'ca10d55b-2de9-5f97-a5f6-01d42188e899', 'working', 2, 10, 42.5, 60, FALSE, '2026-07-10T17:51:50+00:00'),
  ('247a579d-6641-56ee-af2c-6ca627fa8799', 'ca10d55b-2de9-5f97-a5f6-01d42188e899', 'working', 3, 9, 42.5, 120, FALSE, '2026-07-10T17:54:57+00:00'),
  ('6c37a7ac-1cdd-5f1b-a7ee-ca2186726b75', '6e53582b-aae7-529f-a2eb-93b7f80c607a', 'working', 1, 10, 42.5, 60, FALSE, '2026-07-10T17:57:07+00:00'),
  ('65a65361-9560-5194-837f-ca85fbd762ab', '6e53582b-aae7-529f-a2eb-93b7f80c607a', 'working', 2, 10, 42.5, 90, FALSE, '2026-07-10T17:59:47+00:00'),
  ('7700f2a1-6aa9-52e7-a620-083c8b0a2e37', '6e53582b-aae7-529f-a2eb-93b7f80c607a', 'working', 3, 9, 42.5, 90, FALSE, '2026-07-10T18:02:24+00:00'),
  ('9221b9d4-454e-5e0e-8b54-4660334d55aa', '2d33a0c9-3cb9-5ab1-a13b-c97c3e037da6', 'working', 1, 60, 0.0, 120, FALSE, '2026-07-10T18:08:04+00:00'),
  ('b9d019d8-7eb6-53cd-8814-36398dfd1ebf', '2d33a0c9-3cb9-5ab1-a13b-c97c3e037da6', 'working', 2, 55, 0.0, 120, FALSE, '2026-07-10T18:13:29+00:00'),
  ('5a872e4b-b201-5b95-831c-e5831f9063c9', '2d33a0c9-3cb9-5ab1-a13b-c97c3e037da6', 'working', 3, 55, 0.0, 150, FALSE, '2026-07-10T18:19:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('591b87e8-c2c6-54d6-829f-0e52c2f96c7a', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-13T17:14:00+00:00', '2026-07-13T18:04:12+00:00', 3012, 5015.0, FALSE, 68.0, 'gym', 254);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2d00bdfb-2916-5718-a7ef-95a8785fb412', '591b87e8-c2c6-54d6-829f-0e52c2f96c7a', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('2228dd1d-0684-566b-b5cd-fcaae94b2130', '591b87e8-c2c6-54d6-829f-0e52c2f96c7a', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('88c088b2-7bca-56f1-8739-889787d4a9da', '591b87e8-c2c6-54d6-829f-0e52c2f96c7a', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('47e18e63-fd46-5858-babd-2e5f9a4d7cee', '591b87e8-c2c6-54d6-829f-0e52c2f96c7a', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('dedc327b-a045-5c81-94af-f668d93d6e8a', '2d00bdfb-2916-5718-a7ef-95a8785fb412', 'working', 1, 10, 85.0, 150, FALSE, '2026-07-13T17:22:40+00:00'),
  ('cbc18e45-d17c-57a2-b9f6-ce667e32089d', '2d00bdfb-2916-5718-a7ef-95a8785fb412', 'working', 2, 10, 85.0, 90, FALSE, '2026-07-13T17:25:20+00:00'),
  ('47274ba1-08da-5504-ab1a-a2dfba29ff8c', '2d00bdfb-2916-5718-a7ef-95a8785fb412', 'working', 3, 9, 85.0, 150, FALSE, '2026-07-13T17:28:57+00:00'),
  ('94d49eb4-1012-5f6d-81da-7bd33ce585fb', '2228dd1d-0684-566b-b5cd-fcaae94b2130', 'working', 1, 10, 42.5, 90, FALSE, '2026-07-13T17:31:37+00:00'),
  ('ce422f9f-57b0-5bd6-ae18-0babd5d1e73b', '2228dd1d-0684-566b-b5cd-fcaae94b2130', 'working', 2, 10, 42.5, 120, FALSE, '2026-07-13T17:34:47+00:00'),
  ('06232f15-3546-5b14-a8e5-4713d8905b6e', '2228dd1d-0684-566b-b5cd-fcaae94b2130', 'working', 3, 10, 42.5, 150, FALSE, '2026-07-13T17:38:27+00:00'),
  ('e081032d-39c8-5322-9229-e8c2f6c5580d', '88c088b2-7bca-56f1-8739-889787d4a9da', 'working', 1, 10, 42.5, 60, FALSE, '2026-07-13T17:40:37+00:00'),
  ('6c1457c1-b9ec-546a-b82e-c9315f173997', '88c088b2-7bca-56f1-8739-889787d4a9da', 'working', 2, 10, 42.5, 150, FALSE, '2026-07-13T17:44:17+00:00'),
  ('80402637-1f9b-5401-92ee-e924fe985e42', '88c088b2-7bca-56f1-8739-889787d4a9da', 'working', 3, 10, 42.5, 90, FALSE, '2026-07-13T17:46:57+00:00'),
  ('d20f4095-1414-51ba-8666-e0fcbfbfd39e', '47e18e63-fd46-5858-babd-2e5f9a4d7cee', 'working', 1, 55, 0.0, 60, FALSE, '2026-07-13T17:51:22+00:00'),
  ('21a5cb7b-c8f2-5c91-8822-16a43f9386fe', '47e18e63-fd46-5858-babd-2e5f9a4d7cee', 'working', 2, 55, 0.0, 90, FALSE, '2026-07-13T17:56:17+00:00'),
  ('ef870bbc-9f06-5747-a55e-2e8765781406', '47e18e63-fd46-5858-babd-2e5f9a4d7cee', 'working', 3, 55, 0.0, 90, FALSE, '2026-07-13T18:01:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('954dd6af-cf26-59ef-813a-f8f3e4dc9539', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-07-15T17:14:00+00:00', '2026-07-15T18:04:42+00:00', 3042, 2322.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('ec9e5d36-c23f-507b-9fa3-50957cea606f', '954dd6af-cf26-59ef-813a-f8f3e4dc9539', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('cee4a03e-7f53-5e96-95cd-8fa66eba6cd4', '954dd6af-cf26-59ef-813a-f8f3e4dc9539', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('9dc81f29-015a-56f8-b0f9-d0470ba1c351', '954dd6af-cf26-59ef-813a-f8f3e4dc9539', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('d67cdadb-3b84-586d-8c16-95466a656a96', '954dd6af-cf26-59ef-813a-f8f3e4dc9539', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('231cb879-cdc6-5b12-b55a-a0b20b989e63', '954dd6af-cf26-59ef-813a-f8f3e4dc9539', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('47d7b9f2-b1d1-5513-89af-f842f18fdee8', 'ec9e5d36-c23f-507b-9fa3-50957cea606f', 'working', 1, 10, 14.0, 60, FALSE, '2026-07-15T17:21:10+00:00'),
  ('9d0541b9-bb3d-5b6a-9cfa-8ce1ea8598c6', 'ec9e5d36-c23f-507b-9fa3-50957cea606f', 'working', 2, 10, 14.0, 90, FALSE, '2026-07-15T17:23:50+00:00'),
  ('434d8258-b323-58dd-bc3f-d7e5e6042038', 'ec9e5d36-c23f-507b-9fa3-50957cea606f', 'working', 3, 8, 14.0, 90, FALSE, '2026-07-15T17:26:24+00:00'),
  ('c6cf398c-1659-5a60-9f55-51ae1b6a434d', 'cee4a03e-7f53-5e96-95cd-8fa66eba6cd4', 'working', 1, 10, 32.5, 120, FALSE, '2026-07-15T17:29:34+00:00'),
  ('3ed0866c-c9fb-5136-a513-d3815dd22448', 'cee4a03e-7f53-5e96-95cd-8fa66eba6cd4', 'working', 2, 10, 32.5, 90, FALSE, '2026-07-15T17:32:14+00:00'),
  ('01eb7f41-faec-5902-9759-d296c9089fa0', 'cee4a03e-7f53-5e96-95cd-8fa66eba6cd4', 'working', 3, 10, 32.5, 120, FALSE, '2026-07-15T17:35:24+00:00'),
  ('561ef9cd-51c5-5cbd-9f37-7cc8540d269d', '9dc81f29-015a-56f8-b0f9-d0470ba1c351', 'working', 1, 12, 4.0, 60, FALSE, '2026-07-15T17:37:40+00:00'),
  ('d9e79901-b431-58e3-89ab-ff0848901d27', '9dc81f29-015a-56f8-b0f9-d0470ba1c351', 'working', 2, 12, 4.0, 120, FALSE, '2026-07-15T17:40:56+00:00'),
  ('b14b673d-a9f0-5b1f-87d9-2c00c239b08f', '9dc81f29-015a-56f8-b0f9-d0470ba1c351', 'working', 3, 12, 4.0, 90, FALSE, '2026-07-15T17:43:42+00:00'),
  ('f7923f86-914c-5a85-8193-1ef261f1f33e', 'd67cdadb-3b84-586d-8c16-95466a656a96', 'working', 1, 12, 6.0, 90, FALSE, '2026-07-15T17:46:28+00:00'),
  ('a6c8eb95-4ad7-5a31-9af3-11a9f7c27b12', 'd67cdadb-3b84-586d-8c16-95466a656a96', 'working', 2, 12, 6.0, 90, FALSE, '2026-07-15T17:49:14+00:00'),
  ('c776d10a-f7b3-5e5a-87b2-87bc970f4329', 'd67cdadb-3b84-586d-8c16-95466a656a96', 'working', 3, 12, 6.0, 60, FALSE, '2026-07-15T17:51:30+00:00'),
  ('45510127-6cdb-506a-869b-0be90d547183', '231cb879-cdc6-5b12-b55a-a0b20b989e63', 'working', 1, 12, 17.5, 150, FALSE, '2026-07-15T17:55:16+00:00'),
  ('1ff2c89e-8161-57b1-928c-1661e9f21a34', '231cb879-cdc6-5b12-b55a-a0b20b989e63', 'working', 2, 12, 17.5, 90, FALSE, '2026-07-15T17:58:02+00:00'),
  ('a2b1c470-1c10-5140-8655-db748eff10b1', '231cb879-cdc6-5b12-b55a-a0b20b989e63', 'working', 3, 10, 17.5, 150, FALSE, '2026-07-15T18:01:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('82f8d693-fea7-5055-acda-bb009f213dd2', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-17T17:45:00+00:00', '2026-07-17T18:36:21+00:00', 3081, 5175.0, FALSE, 68.0, 'gym', 267);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d14d5f5f-b2c6-546d-8e4e-ed0287f76b82', '82f8d693-fea7-5055-acda-bb009f213dd2', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ca5072e2-7665-5da2-ba5d-2446aff4929f', '82f8d693-fea7-5055-acda-bb009f213dd2', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('c78162a0-7ec7-5106-abb9-9c70c394aeab', '82f8d693-fea7-5055-acda-bb009f213dd2', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('0f953a47-bab0-58a4-b73d-ce8bef8690f1', '82f8d693-fea7-5055-acda-bb009f213dd2', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('ea97525c-ec4f-506b-b7ed-ef9b2365ffbb', 'd14d5f5f-b2c6-546d-8e4e-ed0287f76b82', 'working', 1, 10, 90.0, 150, FALSE, '2026-07-17T17:53:40+00:00'),
  ('365fd1e9-2079-5ee5-9b00-a3ca8352550d', 'd14d5f5f-b2c6-546d-8e4e-ed0287f76b82', 'working', 2, 10, 90.0, 90, FALSE, '2026-07-17T17:56:20+00:00'),
  ('e55cbd39-219e-51c0-8dff-96670a2feecb', 'd14d5f5f-b2c6-546d-8e4e-ed0287f76b82', 'working', 3, 8, 90.0, 150, FALSE, '2026-07-17T17:59:54+00:00'),
  ('0d20f053-3db3-530e-9028-043d143a46c4', 'ca5072e2-7665-5da2-ba5d-2446aff4929f', 'working', 1, 10, 45.0, 150, FALSE, '2026-07-17T18:03:34+00:00'),
  ('3e2ed042-6473-5243-9db3-c2d6df9296bf', 'ca5072e2-7665-5da2-ba5d-2446aff4929f', 'working', 2, 10, 45.0, 150, FALSE, '2026-07-17T18:07:14+00:00'),
  ('44207b00-6d23-5eef-8e1c-4b009e8ec156', 'ca5072e2-7665-5da2-ba5d-2446aff4929f', 'working', 3, 10, 45.0, 60, FALSE, '2026-07-17T18:09:24+00:00'),
  ('f81233f9-be9f-5136-bd09-7594ca614098', 'c78162a0-7ec7-5106-abb9-9c70c394aeab', 'working', 1, 10, 45.0, 120, FALSE, '2026-07-17T18:12:34+00:00'),
  ('cd2df3c6-ba0e-5b81-844e-5a10e6ff29f8', 'c78162a0-7ec7-5106-abb9-9c70c394aeab', 'working', 2, 10, 45.0, 90, FALSE, '2026-07-17T18:15:14+00:00'),
  ('dd171795-2c79-53a6-83a4-254403dfd7aa', 'c78162a0-7ec7-5106-abb9-9c70c394aeab', 'working', 3, 9, 45.0, 120, FALSE, '2026-07-17T18:18:21+00:00'),
  ('6454ed36-dc5f-5578-b9e1-75a67969a875', '0f953a47-bab0-58a4-b73d-ce8bef8690f1', 'working', 1, 60, 0.0, 60, FALSE, '2026-07-17T18:23:01+00:00'),
  ('fd2317a7-52fa-515f-b746-f6043f9e5cf0', '0f953a47-bab0-58a4-b73d-ce8bef8690f1', 'working', 2, 55, 0.0, 90, FALSE, '2026-07-17T18:27:56+00:00'),
  ('8a50bdb7-e488-59eb-8f52-2c648bd4c080', '0f953a47-bab0-58a4-b73d-ce8bef8690f1', 'working', 3, 65, 0.0, 90, FALSE, '2026-07-17T18:33:21+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d0c4ae78-398a-5ebe-8008-18fe816701f9', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-20T17:18:00+00:00', '2026-07-20T18:07:27+00:00', 2967, 5355.0, FALSE, 68.0, 'gym', 259);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d51769f8-5ad6-5b00-9ee9-ba13d57a517d', 'd0c4ae78-398a-5ebe-8008-18fe816701f9', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('c58ac78a-4d39-5417-acdd-592f1abcc8e9', 'd0c4ae78-398a-5ebe-8008-18fe816701f9', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('8cfb56da-937c-51f2-a4cb-ea5823c05c9b', 'd0c4ae78-398a-5ebe-8008-18fe816701f9', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('4c783e13-8888-5db8-ade2-825642133d55', 'd0c4ae78-398a-5ebe-8008-18fe816701f9', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('79810fc6-3e4d-500b-bb31-872fd9ac2716', 'd51769f8-5ad6-5b00-9ee9-ba13d57a517d', 'working', 1, 10, 90.0, 120, FALSE, '2026-07-20T17:26:10+00:00'),
  ('98da440e-8f0c-5aea-a7c7-bb90cacab03f', 'd51769f8-5ad6-5b00-9ee9-ba13d57a517d', 'working', 2, 10, 90.0, 150, FALSE, '2026-07-20T17:29:50+00:00'),
  ('4901b890-3ecb-5b0d-b38d-08709e406652', 'd51769f8-5ad6-5b00-9ee9-ba13d57a517d', 'working', 3, 10, 90.0, 90, FALSE, '2026-07-20T17:32:30+00:00'),
  ('10e3af8d-b341-508f-bfe1-2e6282a2e932', 'c58ac78a-4d39-5417-acdd-592f1abcc8e9', 'working', 1, 10, 45.0, 60, FALSE, '2026-07-20T17:34:40+00:00'),
  ('523f02cd-dc23-5258-b911-6b20664e2c88', 'c58ac78a-4d39-5417-acdd-592f1abcc8e9', 'working', 2, 10, 45.0, 90, FALSE, '2026-07-20T17:37:20+00:00'),
  ('b35de91f-58d5-5b63-9acb-eaaeb6419f14', 'c58ac78a-4d39-5417-acdd-592f1abcc8e9', 'working', 3, 9, 45.0, 120, FALSE, '2026-07-20T17:40:27+00:00'),
  ('30f1a6e3-8cca-5094-bab6-fca0dc54aaa1', '8cfb56da-937c-51f2-a4cb-ea5823c05c9b', 'working', 1, 10, 45.0, 90, FALSE, '2026-07-20T17:43:07+00:00'),
  ('2d3d0e9e-c3fb-551f-9ad7-2edc76d9caa4', '8cfb56da-937c-51f2-a4cb-ea5823c05c9b', 'working', 2, 10, 45.0, 60, FALSE, '2026-07-20T17:45:17+00:00'),
  ('202ce7b1-a378-504b-8801-3c5982f93eda', '8cfb56da-937c-51f2-a4cb-ea5823c05c9b', 'working', 3, 10, 45.0, 150, FALSE, '2026-07-20T17:48:57+00:00'),
  ('b0921979-0ffd-59f4-b719-a26f7a5f3c42', '4c783e13-8888-5db8-ade2-825642133d55', 'working', 1, 55, 0.0, 150, FALSE, '2026-07-20T17:54:52+00:00'),
  ('e3eaa9d2-80a8-5c69-9214-f03e703c5771', '4c783e13-8888-5db8-ade2-825642133d55', 'working', 2, 60, 0.0, 60, FALSE, '2026-07-20T17:59:32+00:00'),
  ('c8a72f9b-982c-5e9a-82aa-e15bb478cfda', '4c783e13-8888-5db8-ade2-825642133d55', 'working', 3, 55, 0.0, 90, FALSE, '2026-07-20T18:04:27+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('9ccd7559-92f7-5cab-9080-23737822fdc6', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-07-22T17:43:00+00:00', '2026-07-22T18:35:42+00:00', 3162, 2452.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('0fd5efcb-a568-5abc-8298-490f659b88d8', '9ccd7559-92f7-5cab-9080-23737822fdc6', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('46b2d63b-2fa4-51c6-a157-3ea59a2aff13', '9ccd7559-92f7-5cab-9080-23737822fdc6', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('0ddd2890-af63-5d70-96fd-74c32de44a5f', '9ccd7559-92f7-5cab-9080-23737822fdc6', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('99ee927d-cd5c-5c33-90c1-60f8f257c873', '9ccd7559-92f7-5cab-9080-23737822fdc6', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('8786747c-f0c3-5009-bd6f-bc2b9f3870f1', '9ccd7559-92f7-5cab-9080-23737822fdc6', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('ac9ccae7-afb2-567f-9b24-33452b39948d', '0fd5efcb-a568-5abc-8298-490f659b88d8', 'working', 1, 10, 14.0, 90, FALSE, '2026-07-22T17:50:40+00:00'),
  ('06db43af-1157-5860-b395-345ae6917e5f', '0fd5efcb-a568-5abc-8298-490f659b88d8', 'working', 2, 10, 14.0, 150, FALSE, '2026-07-22T17:54:20+00:00'),
  ('0d8576bc-a1d3-5216-b884-d58b3f129da2', '0fd5efcb-a568-5abc-8298-490f659b88d8', 'working', 3, 10, 14.0, 150, FALSE, '2026-07-22T17:58:00+00:00'),
  ('c340b918-41de-5cff-a1d7-82270db7bdfb', '46b2d63b-2fa4-51c6-a157-3ea59a2aff13', 'working', 1, 10, 35.0, 120, FALSE, '2026-07-22T18:01:10+00:00'),
  ('86fc0b98-029f-573b-a080-62bdcdeb18aa', '46b2d63b-2fa4-51c6-a157-3ea59a2aff13', 'working', 2, 10, 35.0, 90, FALSE, '2026-07-22T18:03:50+00:00'),
  ('c8bc6d7b-a132-56d8-9dd0-eec77db0c286', '46b2d63b-2fa4-51c6-a157-3ea59a2aff13', 'working', 3, 8, 35.0, 90, FALSE, '2026-07-22T18:06:24+00:00'),
  ('e25d886e-7209-5307-a49a-5e740d7f75d8', '0ddd2890-af63-5d70-96fd-74c32de44a5f', 'working', 1, 12, 5.0, 90, FALSE, '2026-07-22T18:09:10+00:00'),
  ('a594bfd4-3a76-58d5-80f5-b398adba987a', '0ddd2890-af63-5d70-96fd-74c32de44a5f', 'working', 2, 12, 5.0, 90, FALSE, '2026-07-22T18:11:56+00:00'),
  ('647fb9e6-a3be-5a82-999d-c0c877eb8114', '0ddd2890-af63-5d70-96fd-74c32de44a5f', 'working', 3, 10, 5.0, 90, FALSE, '2026-07-22T18:14:36+00:00'),
  ('8c96628f-05a0-52ca-bb71-f4ba98a0a34f', '99ee927d-cd5c-5c33-90c1-60f8f257c873', 'working', 1, 12, 7.0, 90, FALSE, '2026-07-22T18:17:22+00:00'),
  ('c0f2ae7f-addb-5e8d-8ca4-b3504394ffeb', '99ee927d-cd5c-5c33-90c1-60f8f257c873', 'working', 2, 12, 7.0, 60, FALSE, '2026-07-22T18:19:38+00:00'),
  ('003beb90-fb7d-5466-b0c7-e429ce8a411d', '99ee927d-cd5c-5c33-90c1-60f8f257c873', 'working', 3, 12, 7.0, 90, FALSE, '2026-07-22T18:22:24+00:00'),
  ('d9ad19d7-ce9d-5203-b87c-57f078559731', '8786747c-f0c3-5009-bd6f-bc2b9f3870f1', 'working', 1, 12, 17.5, 150, FALSE, '2026-07-22T18:26:10+00:00'),
  ('6128b422-c9e2-560c-85c4-1257c2002bae', '8786747c-f0c3-5009-bd6f-bc2b9f3870f1', 'working', 2, 12, 17.5, 90, FALSE, '2026-07-22T18:28:56+00:00'),
  ('4f3ceb2c-72d0-5fff-8796-4c111127c3b7', '8786747c-f0c3-5009-bd6f-bc2b9f3870f1', 'working', 3, 12, 17.5, 150, FALSE, '2026-07-22T18:32:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c714b720-8f57-5453-8ffa-6322553d2c75', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-24T17:27:00+00:00', '2026-07-24T18:18:24+00:00', 3084, 5530.0, FALSE, 68.0, 'gym', 288);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('4d0d29ce-afa2-5951-9bbc-2a70ed7ec3ef', 'c714b720-8f57-5453-8ffa-6322553d2c75', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('18777722-c538-5709-874a-37b013c09f50', 'c714b720-8f57-5453-8ffa-6322553d2c75', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('727301aa-5b4a-556e-824f-59d117d3346f', 'c714b720-8f57-5453-8ffa-6322553d2c75', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('83d23503-6f52-5f00-b3a3-32b60869ebcc', 'c714b720-8f57-5453-8ffa-6322553d2c75', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e2398bb2-a18f-58a3-bd79-dc776cbdcd65', '4d0d29ce-afa2-5951-9bbc-2a70ed7ec3ef', 'working', 1, 10, 95.0, 60, FALSE, '2026-07-24T17:34:10+00:00'),
  ('eab7d0b0-83bb-5f47-914f-83e07eb49c7a', '4d0d29ce-afa2-5951-9bbc-2a70ed7ec3ef', 'working', 2, 10, 95.0, 150, FALSE, '2026-07-24T17:37:50+00:00'),
  ('43a03e14-8414-57b9-b6fb-01280887c640', '4d0d29ce-afa2-5951-9bbc-2a70ed7ec3ef', 'working', 3, 10, 95.0, 120, FALSE, '2026-07-24T17:41:00+00:00'),
  ('34ff5edd-ff39-5eb1-85c0-3de354b09355', '18777722-c538-5709-874a-37b013c09f50', 'working', 1, 10, 47.5, 90, FALSE, '2026-07-24T17:43:40+00:00'),
  ('d8718070-14ac-5da5-b9d5-a269b72c4398', '18777722-c538-5709-874a-37b013c09f50', 'working', 2, 10, 47.5, 120, FALSE, '2026-07-24T17:46:50+00:00'),
  ('ab44c486-b750-59eb-a303-3b1a7428961f', '18777722-c538-5709-874a-37b013c09f50', 'working', 3, 8, 47.5, 120, FALSE, '2026-07-24T17:49:54+00:00'),
  ('b5080092-f762-567d-b1cc-591266b9922f', '727301aa-5b4a-556e-824f-59d117d3346f', 'working', 1, 10, 45.0, 60, FALSE, '2026-07-24T17:52:04+00:00'),
  ('0938083a-838a-5abe-8587-a7a2f5496e93', '727301aa-5b4a-556e-824f-59d117d3346f', 'working', 2, 10, 45.0, 120, FALSE, '2026-07-24T17:55:14+00:00'),
  ('1a45739a-34ce-5f60-b7fe-f4a973412acb', '727301aa-5b4a-556e-824f-59d117d3346f', 'working', 3, 10, 45.0, 120, FALSE, '2026-07-24T17:58:24+00:00'),
  ('88e0941f-790e-557f-b6e9-179d67fae5f4', '83d23503-6f52-5f00-b3a3-32b60869ebcc', 'working', 1, 70, 0.0, 90, FALSE, '2026-07-24T18:04:04+00:00'),
  ('c8725bce-3610-5456-80a2-7eb1c92a6f09', '83d23503-6f52-5f00-b3a3-32b60869ebcc', 'working', 2, 70, 0.0, 90, FALSE, '2026-07-24T18:09:44+00:00'),
  ('a30f517b-ee6b-5e78-a546-dffc9b2e1c91', '83d23503-6f52-5f00-b3a3-32b60869ebcc', 'working', 3, 60, 0.0, 120, FALSE, '2026-07-24T18:15:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('0250f513-30fa-53b3-8ca9-d9dbf3b009d9', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-27T17:05:00+00:00', '2026-07-27T17:55:42+00:00', 3042, 5652.5, FALSE, 68.0, 'gym', 274);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('89461278-aac2-5af4-8b44-de9ee6ff73c8', '0250f513-30fa-53b3-8ca9-d9dbf3b009d9', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('08db6982-04b5-5707-9165-7a921eea97b1', '0250f513-30fa-53b3-8ca9-d9dbf3b009d9', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('46426669-2b40-5b80-a7a4-b942b996e48f', '0250f513-30fa-53b3-8ca9-d9dbf3b009d9', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('5a64ca69-5649-594b-a4b0-5c39a55edb92', '0250f513-30fa-53b3-8ca9-d9dbf3b009d9', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('949921e3-f393-525a-8375-f7dae90cd703', '89461278-aac2-5af4-8b44-de9ee6ff73c8', 'working', 1, 10, 95.0, 120, FALSE, '2026-07-27T17:13:10+00:00'),
  ('953a630e-8bc1-55aa-b3ee-39a80509230e', '89461278-aac2-5af4-8b44-de9ee6ff73c8', 'working', 2, 10, 95.0, 150, FALSE, '2026-07-27T17:16:50+00:00'),
  ('cfa6e21a-6ff8-53b1-9c51-ebad81e7281d', '89461278-aac2-5af4-8b44-de9ee6ff73c8', 'working', 3, 10, 95.0, 120, FALSE, '2026-07-27T17:20:00+00:00'),
  ('50341f06-1bd8-572b-a81a-24a0e0adb191', '08db6982-04b5-5707-9165-7a921eea97b1', 'working', 1, 10, 47.5, 90, FALSE, '2026-07-27T17:22:40+00:00'),
  ('18b9c92e-3132-5e3e-b5c5-4cdeafb5962c', '08db6982-04b5-5707-9165-7a921eea97b1', 'working', 2, 10, 47.5, 60, FALSE, '2026-07-27T17:24:50+00:00'),
  ('4289d217-03a2-5b0c-8c75-54361e966b2a', '08db6982-04b5-5707-9165-7a921eea97b1', 'working', 3, 10, 47.5, 90, FALSE, '2026-07-27T17:27:30+00:00'),
  ('bf0f8a0c-4f81-5f56-9463-7501aa1ff800', '46426669-2b40-5b80-a7a4-b942b996e48f', 'working', 1, 10, 47.5, 150, FALSE, '2026-07-27T17:31:10+00:00'),
  ('52696bdb-3434-572e-b34d-fd22cd2ca2ad', '46426669-2b40-5b80-a7a4-b942b996e48f', 'working', 2, 10, 47.5, 90, FALSE, '2026-07-27T17:33:50+00:00'),
  ('bd152a23-c944-5dab-b359-4faa5f57e2e2', '46426669-2b40-5b80-a7a4-b942b996e48f', 'working', 3, 9, 47.5, 90, FALSE, '2026-07-27T17:36:27+00:00'),
  ('315d8f12-d535-5186-b07d-461f0a01262b', '5a64ca69-5649-594b-a4b0-5c39a55edb92', 'working', 1, 65, 0.0, 90, FALSE, '2026-07-27T17:41:52+00:00'),
  ('378abd55-a030-500e-8842-89bd78a8a34b', '5a64ca69-5649-594b-a4b0-5c39a55edb92', 'working', 2, 60, 0.0, 90, FALSE, '2026-07-27T17:47:02+00:00'),
  ('0d990ccc-5e87-5023-bd5b-6bdae53eb80b', '5a64ca69-5649-594b-a4b0-5c39a55edb92', 'working', 3, 60, 0.0, 120, FALSE, '2026-07-27T17:52:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('88c834d1-a69a-5276-a87a-a393350f1adf', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-07-29T17:06:00+00:00', '2026-07-29T17:57:48+00:00', 3108, 2504.0, FALSE, 68.0, 'gym', 166);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2138ae25-fefd-5a9d-b011-667a694573fa', '88c834d1-a69a-5276-a87a-a393350f1adf', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('cd52adcf-2a55-58f8-abfb-c13a585fc293', '88c834d1-a69a-5276-a87a-a393350f1adf', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('d4e35cd3-b0c3-5cd8-a57d-aa0d24c26f61', '88c834d1-a69a-5276-a87a-a393350f1adf', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('abb4be23-76d8-5b1c-b218-b9bf19c3c1c2', '88c834d1-a69a-5276-a87a-a393350f1adf', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('9090cf10-26a1-59f6-b8ab-e9618965d430', '88c834d1-a69a-5276-a87a-a393350f1adf', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('17ab948f-d73c-5f91-bdce-b7e122c8a458', '2138ae25-fefd-5a9d-b011-667a694573fa', 'working', 1, 10, 14.0, 150, FALSE, '2026-07-29T17:14:40+00:00'),
  ('014d541f-abc8-58ed-92ff-009d8aee26e9', '2138ae25-fefd-5a9d-b011-667a694573fa', 'working', 2, 10, 14.0, 90, FALSE, '2026-07-29T17:17:20+00:00'),
  ('2d036b57-2625-585c-9949-631faae56d5e', '2138ae25-fefd-5a9d-b011-667a694573fa', 'working', 3, 8, 14.0, 150, FALSE, '2026-07-29T17:20:54+00:00'),
  ('57191218-42a2-5ca8-b511-2ee38850be36', 'cd52adcf-2a55-58f8-abfb-c13a585fc293', 'working', 1, 10, 35.0, 60, FALSE, '2026-07-29T17:23:04+00:00'),
  ('2a46a9aa-a9b5-52fa-b0bc-f94f33d16da8', 'cd52adcf-2a55-58f8-abfb-c13a585fc293', 'working', 2, 10, 35.0, 150, FALSE, '2026-07-29T17:26:44+00:00'),
  ('2d3fd7de-b50a-5374-a9cc-b216406c77ad', 'cd52adcf-2a55-58f8-abfb-c13a585fc293', 'working', 3, 10, 35.0, 90, FALSE, '2026-07-29T17:29:24+00:00'),
  ('1d694a60-3d0b-5473-8798-b9d6ff85da49', 'd4e35cd3-b0c3-5cd8-a57d-aa0d24c26f61', 'working', 1, 12, 5.0, 90, FALSE, '2026-07-29T17:32:10+00:00'),
  ('27c27ceb-846a-5407-8852-07ecc02345cc', 'd4e35cd3-b0c3-5cd8-a57d-aa0d24c26f61', 'working', 2, 12, 5.0, 90, FALSE, '2026-07-29T17:34:56+00:00'),
  ('e6a4a9d2-3ccc-5bbe-9b14-6896ec2e064e', 'd4e35cd3-b0c3-5cd8-a57d-aa0d24c26f61', 'working', 3, 12, 5.0, 150, FALSE, '2026-07-29T17:38:42+00:00'),
  ('ba998fbd-2801-5a1e-8513-a447f1c8a3bd', 'abb4be23-76d8-5b1c-b218-b9bf19c3c1c2', 'working', 1, 12, 7.0, 120, FALSE, '2026-07-29T17:41:58+00:00'),
  ('fd4e966f-e68a-5ca7-9efa-840ec7b99c27', 'abb4be23-76d8-5b1c-b218-b9bf19c3c1c2', 'working', 2, 12, 7.0, 90, FALSE, '2026-07-29T17:44:44+00:00'),
  ('c2ccb1c3-4e30-5313-b694-ebdfe2978bfa', 'abb4be23-76d8-5b1c-b218-b9bf19c3c1c2', 'working', 3, 12, 7.0, 60, FALSE, '2026-07-29T17:47:00+00:00'),
  ('2ee8c2e2-df2f-5a8a-9b83-f0cd375c9fc0', '9090cf10-26a1-59f6-b8ab-e9618965d430', 'working', 1, 12, 17.5, 90, FALSE, '2026-07-29T17:49:46+00:00'),
  ('3672907d-176e-5751-ac4f-3e281ef2e913', '9090cf10-26a1-59f6-b8ab-e9618965d430', 'working', 2, 12, 17.5, 90, FALSE, '2026-07-29T17:52:32+00:00'),
  ('ea072b93-1ad7-5ec7-a7c6-f5a6f7232de2', '9090cf10-26a1-59f6-b8ab-e9618965d430', 'working', 3, 12, 17.5, 60, FALSE, '2026-07-29T17:54:48+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1ee7a994-d3b5-5464-856d-5159a734c05d', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-07-31T17:37:00+00:00', '2026-07-31T18:26:00+00:00', 2940, 5925.0, FALSE, 68.0, 'gym', 290);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('6e55fa7b-587b-5739-ac3e-c7bdcb05ca74', '1ee7a994-d3b5-5464-856d-5159a734c05d', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('237cfeb0-de67-551f-a5ac-709f95374c96', '1ee7a994-d3b5-5464-856d-5159a734c05d', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('02f8459d-9661-5a3d-98f6-9b9b619d48a4', '1ee7a994-d3b5-5464-856d-5159a734c05d', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('70634146-3238-59b4-8f23-6d1973fb646b', '1ee7a994-d3b5-5464-856d-5159a734c05d', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2c4dfa18-5fd7-5655-bec3-952236134920', '6e55fa7b-587b-5739-ac3e-c7bdcb05ca74', 'working', 1, 10, 100.0, 60, FALSE, '2026-07-31T17:44:10+00:00'),
  ('1e0ef84c-aa59-5e76-adc4-08da07a93e6c', '6e55fa7b-587b-5739-ac3e-c7bdcb05ca74', 'working', 2, 10, 100.0, 90, FALSE, '2026-07-31T17:46:50+00:00'),
  ('ae103d11-6719-5675-b56a-2ac265d109db', '6e55fa7b-587b-5739-ac3e-c7bdcb05ca74', 'working', 3, 10, 100.0, 90, FALSE, '2026-07-31T17:49:30+00:00'),
  ('bedf901c-3be4-58e3-bbe0-4149e243a2a7', '237cfeb0-de67-551f-a5ac-709f95374c96', 'working', 1, 10, 50.0, 90, FALSE, '2026-07-31T17:52:10+00:00'),
  ('3a1ff7a6-231e-5e78-a3dd-8fdf01a6b945', '237cfeb0-de67-551f-a5ac-709f95374c96', 'working', 2, 10, 50.0, 90, FALSE, '2026-07-31T17:54:50+00:00'),
  ('86a6f006-fcb3-5e4c-af9b-1d36728cc18f', '237cfeb0-de67-551f-a5ac-709f95374c96', 'working', 3, 10, 50.0, 90, FALSE, '2026-07-31T17:57:30+00:00'),
  ('c625dbc3-eb0c-5044-8e16-5566e36f680c', '02f8459d-9661-5a3d-98f6-9b9b619d48a4', 'working', 1, 10, 47.5, 90, FALSE, '2026-07-31T18:00:10+00:00'),
  ('07508e2b-6cdf-5f4b-aae8-bd2ee8807548', '02f8459d-9661-5a3d-98f6-9b9b619d48a4', 'working', 2, 10, 47.5, 120, FALSE, '2026-07-31T18:03:20+00:00'),
  ('6c516c4b-44ec-55f1-b668-9fa7e4372fa9', '02f8459d-9661-5a3d-98f6-9b9b619d48a4', 'working', 3, 10, 47.5, 90, FALSE, '2026-07-31T18:06:00+00:00'),
  ('e4bb2f33-7c44-5fce-83df-b5d6a41bc2de', '70634146-3238-59b4-8f23-6d1973fb646b', 'working', 1, 65, 0.0, 90, FALSE, '2026-07-31T18:11:25+00:00'),
  ('150bde95-d565-58b0-af61-3dc7703bb7df', '70634146-3238-59b4-8f23-6d1973fb646b', 'working', 2, 65, 0.0, 90, FALSE, '2026-07-31T18:16:50+00:00'),
  ('21c5366e-cc8c-5212-941b-06c4a9364037', '70634146-3238-59b4-8f23-6d1973fb646b', 'working', 3, 70, 0.0, 120, FALSE, '2026-07-31T18:23:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('cf067a1e-0f88-59de-b4fc-152569e30034', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-03T17:10:00+00:00', '2026-08-03T17:59:39+00:00', 2979, 5725.0, FALSE, 68.0, 'gym', 303);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('5d4dbdf2-2854-5daf-a00b-799767c7d3b0', 'cf067a1e-0f88-59de-b4fc-152569e30034', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ac49a69c-1541-5f4c-bb0c-8344dedf10fb', 'cf067a1e-0f88-59de-b4fc-152569e30034', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('9194db78-3ae2-568d-9f3c-e1e428889043', 'cf067a1e-0f88-59de-b4fc-152569e30034', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('e0731f0e-1237-50b8-a5fd-a4656b5cbc45', 'cf067a1e-0f88-59de-b4fc-152569e30034', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('dda366bc-9d8f-5032-a4b3-eb26d624865e', '5d4dbdf2-2854-5daf-a00b-799767c7d3b0', 'working', 1, 10, 100.0, 60, FALSE, '2026-08-03T17:17:10+00:00'),
  ('f9241c86-7876-5773-947a-223be0b9516f', '5d4dbdf2-2854-5daf-a00b-799767c7d3b0', 'working', 2, 10, 100.0, 90, FALSE, '2026-08-03T17:19:50+00:00'),
  ('41991279-ab29-5c96-b312-7ae02d8949e9', '5d4dbdf2-2854-5daf-a00b-799767c7d3b0', 'working', 3, 8, 100.0, 60, FALSE, '2026-08-03T17:21:54+00:00'),
  ('40dc9395-dab2-58fe-8d0f-2671d8b60019', 'ac49a69c-1541-5f4c-bb0c-8344dedf10fb', 'working', 1, 10, 50.0, 60, FALSE, '2026-08-03T17:24:04+00:00'),
  ('5eb2a2bb-ba89-5133-92a3-139b961fe90d', 'ac49a69c-1541-5f4c-bb0c-8344dedf10fb', 'working', 2, 10, 50.0, 120, FALSE, '2026-08-03T17:27:14+00:00'),
  ('be2c30d2-8244-5964-a1c1-0027defe121b', 'ac49a69c-1541-5f4c-bb0c-8344dedf10fb', 'working', 3, 10, 50.0, 60, FALSE, '2026-08-03T17:29:24+00:00'),
  ('f0ca9aa1-b2eb-5b46-bc2a-cce5a7c456d3', '9194db78-3ae2-568d-9f3c-e1e428889043', 'working', 1, 10, 47.5, 120, FALSE, '2026-08-03T17:32:34+00:00'),
  ('43c3906b-706e-598c-b7a2-a6dd2a78e79d', '9194db78-3ae2-568d-9f3c-e1e428889043', 'working', 2, 10, 47.5, 90, FALSE, '2026-08-03T17:35:14+00:00'),
  ('1d1bdf23-68f9-5546-841d-8df1783fe0c4', '9194db78-3ae2-568d-9f3c-e1e428889043', 'working', 3, 10, 47.5, 120, FALSE, '2026-08-03T17:38:24+00:00'),
  ('3db91d76-4160-5b93-a108-7dbe9c759ab5', 'e0731f0e-1237-50b8-a5fd-a4656b5cbc45', 'working', 1, 75, 0.0, 120, FALSE, '2026-08-03T17:44:49+00:00'),
  ('2adddc98-ca0f-5456-82f6-649619a6f6cf', 'e0731f0e-1237-50b8-a5fd-a4656b5cbc45', 'working', 2, 65, 0.0, 90, FALSE, '2026-08-03T17:50:14+00:00'),
  ('55ace5a7-852c-5f22-a389-d5a13436790e', 'e0731f0e-1237-50b8-a5fd-a4656b5cbc45', 'working', 3, 75, 0.0, 120, FALSE, '2026-08-03T17:56:39+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('550be9ae-1572-592e-9a99-1704401484fa', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-08-05T17:00:00+00:00', '2026-08-05T17:46:54+00:00', 2814, 2757.0, FALSE, 68.0, 'gym', 168);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('5ddb0d1d-f778-5763-8455-2010cf1d5274', '550be9ae-1572-592e-9a99-1704401484fa', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('99a46630-902d-5667-aa5c-5cb51bfba94d', '550be9ae-1572-592e-9a99-1704401484fa', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('52d8a231-f57b-53f0-9cf8-e09f4704f758', '550be9ae-1572-592e-9a99-1704401484fa', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('4638bd79-5f3b-5413-92fd-c0dd2d594a3c', '550be9ae-1572-592e-9a99-1704401484fa', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('4a79b658-d139-5efc-bc16-4b806305bc78', '550be9ae-1572-592e-9a99-1704401484fa', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d0305f72-53a1-5c92-a8cc-e91459b58c09', '5ddb0d1d-f778-5763-8455-2010cf1d5274', 'working', 1, 10, 16.0, 120, FALSE, '2026-08-05T17:08:10+00:00'),
  ('a55e93d0-b55b-5828-9a39-df808c01f8bc', '5ddb0d1d-f778-5763-8455-2010cf1d5274', 'working', 2, 10, 16.0, 60, FALSE, '2026-08-05T17:10:20+00:00'),
  ('88549e25-70c4-57cf-a690-b81db3650956', '5ddb0d1d-f778-5763-8455-2010cf1d5274', 'working', 3, 10, 16.0, 60, FALSE, '2026-08-05T17:12:30+00:00'),
  ('d90e1de6-99e6-51ab-9440-67382034f89b', '99a46630-902d-5667-aa5c-5cb51bfba94d', 'working', 1, 10, 37.5, 90, FALSE, '2026-08-05T17:15:10+00:00'),
  ('5cef2700-f250-5ee1-89a6-841d7d7a7807', '99a46630-902d-5667-aa5c-5cb51bfba94d', 'working', 2, 10, 37.5, 90, FALSE, '2026-08-05T17:17:50+00:00'),
  ('5d3e5273-a4f3-55ab-a857-5473739458ef', '99a46630-902d-5667-aa5c-5cb51bfba94d', 'working', 3, 10, 37.5, 60, FALSE, '2026-08-05T17:20:00+00:00'),
  ('e207f599-6039-554b-b727-d5d8bf982074', '52d8a231-f57b-53f0-9cf8-e09f4704f758', 'working', 1, 12, 5.0, 90, FALSE, '2026-08-05T17:22:46+00:00'),
  ('acefda66-4afd-5707-833c-e0088933d95d', '52d8a231-f57b-53f0-9cf8-e09f4704f758', 'working', 2, 12, 5.0, 60, FALSE, '2026-08-05T17:25:02+00:00'),
  ('d38a681b-6055-55a6-88cc-85f50e2cce6b', '52d8a231-f57b-53f0-9cf8-e09f4704f758', 'working', 3, 12, 5.0, 90, FALSE, '2026-08-05T17:27:48+00:00'),
  ('660a7110-fc6e-5d0c-8b76-01a45428b058', '4638bd79-5f3b-5413-92fd-c0dd2d594a3c', 'working', 1, 12, 7.0, 60, FALSE, '2026-08-05T17:30:04+00:00'),
  ('85e75bdf-ceac-5b5b-afb0-7a85205e794f', '4638bd79-5f3b-5413-92fd-c0dd2d594a3c', 'working', 2, 12, 7.0, 90, FALSE, '2026-08-05T17:32:50+00:00'),
  ('2a4f9b29-23f9-5351-870c-fd2e755872a3', '4638bd79-5f3b-5413-92fd-c0dd2d594a3c', 'working', 3, 12, 7.0, 90, FALSE, '2026-08-05T17:35:36+00:00'),
  ('259ad567-2018-5b7a-901c-7c0a10b829e9', '4a79b658-d139-5efc-bc16-4b806305bc78', 'working', 1, 12, 20.0, 90, FALSE, '2026-08-05T17:38:22+00:00'),
  ('cce49d8b-d50f-5dcb-b982-5be23d7bfe73', '4a79b658-d139-5efc-bc16-4b806305bc78', 'working', 2, 12, 20.0, 60, FALSE, '2026-08-05T17:40:38+00:00'),
  ('10b910d8-96e5-5d3f-b666-05e99e95b973', '4a79b658-d139-5efc-bc16-4b806305bc78', 'working', 3, 12, 20.0, 120, FALSE, '2026-08-05T17:43:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('f1e6d87b-ced6-5fba-95bd-04375bd427dc', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-07T17:10:00+00:00', '2026-08-07T18:02:03+00:00', 3123, 5965.0, FALSE, 68.0, 'gym', 321);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8dab4081-e4e4-5fee-a765-ca6af39357bf', 'f1e6d87b-ced6-5fba-95bd-04375bd427dc', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('10c4ddca-745a-5f84-b6bb-8a9712703cda', 'f1e6d87b-ced6-5fba-95bd-04375bd427dc', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('23027dff-c28b-50c7-94b1-481de64e0150', 'f1e6d87b-ced6-5fba-95bd-04375bd427dc', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('3512cd09-2fa3-5670-a4ad-4761df5010f2', 'f1e6d87b-ced6-5fba-95bd-04375bd427dc', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2a49cd86-e6fb-544f-a4f1-6132f1c5c9c3', '8dab4081-e4e4-5fee-a765-ca6af39357bf', 'working', 1, 10, 105.0, 60, FALSE, '2026-08-07T17:17:10+00:00'),
  ('fab5f345-bba6-5bbd-bc5b-354de110fc7d', '8dab4081-e4e4-5fee-a765-ca6af39357bf', 'working', 2, 10, 105.0, 90, FALSE, '2026-08-07T17:19:50+00:00'),
  ('bc2fb455-e5dc-56ac-8d20-8a92f4907faa', '8dab4081-e4e4-5fee-a765-ca6af39357bf', 'working', 3, 9, 105.0, 150, FALSE, '2026-08-07T17:23:27+00:00'),
  ('32967b5a-979d-5fe9-bf58-18c1280cca5e', '10c4ddca-745a-5f84-b6bb-8a9712703cda', 'working', 1, 10, 52.5, 60, FALSE, '2026-08-07T17:25:37+00:00'),
  ('3587d527-1d5f-5f09-99b7-9bc357904746', '10c4ddca-745a-5f84-b6bb-8a9712703cda', 'working', 2, 10, 52.5, 90, FALSE, '2026-08-07T17:28:17+00:00'),
  ('dfaf9c73-d0fd-571a-bfbe-7486b97e0ebc', '10c4ddca-745a-5f84-b6bb-8a9712703cda', 'working', 3, 8, 52.5, 150, FALSE, '2026-08-07T17:31:51+00:00'),
  ('c518e327-fa67-5c34-a8a0-b5b22cb56ea5', '23027dff-c28b-50c7-94b1-481de64e0150', 'working', 1, 10, 50.0, 120, FALSE, '2026-08-07T17:35:01+00:00'),
  ('1bab4960-c464-5851-aed4-1807235cb8db', '23027dff-c28b-50c7-94b1-481de64e0150', 'working', 2, 10, 50.0, 90, FALSE, '2026-08-07T17:37:41+00:00'),
  ('8fbaedd9-adce-5917-8577-e774deb438af', '23027dff-c28b-50c7-94b1-481de64e0150', 'working', 3, 9, 50.0, 90, FALSE, '2026-08-07T17:40:18+00:00'),
  ('16e748d0-5792-542b-a168-f9c82eb2e5fd', '3512cd09-2fa3-5670-a4ad-4761df5010f2', 'working', 1, 80, 0.0, 90, FALSE, '2026-08-07T17:46:28+00:00'),
  ('231a9316-ba9f-52e3-9706-2518d109ba48', '3512cd09-2fa3-5670-a4ad-4761df5010f2', 'working', 2, 75, 0.0, 90, FALSE, '2026-08-07T17:52:23+00:00'),
  ('3bb4beb3-ef9f-544a-a0f2-f1f92d0829c6', '3512cd09-2fa3-5670-a4ad-4761df5010f2', 'working', 3, 80, 0.0, 120, FALSE, '2026-08-07T17:59:03+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('ddf6dfed-1e08-53a8-8fc0-1e8309e9ef2f', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-10T17:24:00+00:00', '2026-08-10T18:16:54+00:00', 3174, 6125.0, FALSE, 68.0, 'gym', 318);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('50a6543b-a4b8-5410-8182-edbd9002b0a7', 'ddf6dfed-1e08-53a8-8fc0-1e8309e9ef2f', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('49a21c00-412c-5281-a9c6-c99aab99a045', 'ddf6dfed-1e08-53a8-8fc0-1e8309e9ef2f', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('61696f92-4806-5475-a7e9-283d2d90e1eb', 'ddf6dfed-1e08-53a8-8fc0-1e8309e9ef2f', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('13fdc5de-5ca5-58c2-b4b9-529820e2849d', 'ddf6dfed-1e08-53a8-8fc0-1e8309e9ef2f', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8dec80d7-bb32-5905-b8e3-485f26146c4c', '50a6543b-a4b8-5410-8182-edbd9002b0a7', 'working', 1, 10, 105.0, 150, FALSE, '2026-08-10T17:32:40+00:00'),
  ('76935316-208b-52c5-aa9e-e546b45f045b', '50a6543b-a4b8-5410-8182-edbd9002b0a7', 'working', 2, 10, 105.0, 90, FALSE, '2026-08-10T17:35:20+00:00'),
  ('6d64473b-d7f5-5c47-9006-35e2481440e4', '50a6543b-a4b8-5410-8182-edbd9002b0a7', 'working', 3, 10, 105.0, 60, FALSE, '2026-08-10T17:37:30+00:00'),
  ('9704ebb0-a5b8-50ad-8bf9-631db8027843', '49a21c00-412c-5281-a9c6-c99aab99a045', 'working', 1, 10, 52.5, 120, FALSE, '2026-08-10T17:40:40+00:00'),
  ('0bebe0b1-1021-586b-8211-fd9300167b77', '49a21c00-412c-5281-a9c6-c99aab99a045', 'working', 2, 10, 52.5, 150, FALSE, '2026-08-10T17:44:20+00:00'),
  ('0ff9777f-3ae5-50a7-a7cd-51d1a9365e7d', '49a21c00-412c-5281-a9c6-c99aab99a045', 'working', 3, 10, 52.5, 90, FALSE, '2026-08-10T17:47:00+00:00'),
  ('1f19549c-77bf-50cf-b870-ab1ccd66c544', '61696f92-4806-5475-a7e9-283d2d90e1eb', 'working', 1, 10, 50.0, 60, FALSE, '2026-08-10T17:49:10+00:00'),
  ('272c1ba0-c622-592f-86ae-c71826352d7b', '61696f92-4806-5475-a7e9-283d2d90e1eb', 'working', 2, 10, 50.0, 150, FALSE, '2026-08-10T17:52:50+00:00'),
  ('7e35e530-8b36-522c-ae94-c546ef03c708', '61696f92-4806-5475-a7e9-283d2d90e1eb', 'working', 3, 8, 50.0, 60, FALSE, '2026-08-10T17:54:54+00:00'),
  ('fdb78e16-6c2c-5809-b8a2-b43ca5a3ab39', '13fdc5de-5ca5-58c2-b4b9-529820e2849d', 'working', 1, 75, 0.0, 90, FALSE, '2026-08-10T18:00:49+00:00'),
  ('7805349b-5425-503a-9b39-a66cd34c2731', '13fdc5de-5ca5-58c2-b4b9-529820e2849d', 'working', 2, 80, 0.0, 120, FALSE, '2026-08-10T18:07:29+00:00'),
  ('645a7ba0-369f-5b38-b217-780d05c0a21b', '13fdc5de-5ca5-58c2-b4b9-529820e2849d', 'working', 3, 75, 0.0, 120, FALSE, '2026-08-10T18:13:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7eecff11-1e45-5369-919c-fd10a8f37d5e', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-08-12T17:27:00+00:00', '2026-08-12T18:21:12+00:00', 3252, 2655.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('04e3335d-8563-5b7e-a3fb-3c3b731c0a88', '7eecff11-1e45-5369-919c-fd10a8f37d5e', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('674c1a6a-1885-572c-8a95-38bcf05422dd', '7eecff11-1e45-5369-919c-fd10a8f37d5e', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('7b038c9a-9664-5137-acd3-639027b48190', '7eecff11-1e45-5369-919c-fd10a8f37d5e', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('abaca103-a1f1-5e17-83aa-9720fa397eb2', '7eecff11-1e45-5369-919c-fd10a8f37d5e', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('dac7b788-3d54-5e85-b976-3980c16332e2', '7eecff11-1e45-5369-919c-fd10a8f37d5e', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('b23da3fb-dfac-536e-afa3-d246ef5e82d0', '04e3335d-8563-5b7e-a3fb-3c3b731c0a88', 'working', 1, 10, 16.0, 90, FALSE, '2026-08-12T17:34:40+00:00'),
  ('f2de4301-1749-5e67-9ece-a3bc9f64c601', '04e3335d-8563-5b7e-a3fb-3c3b731c0a88', 'working', 2, 10, 16.0, 90, FALSE, '2026-08-12T17:37:20+00:00'),
  ('ea45e662-9c63-5867-b66d-237292c8658b', '04e3335d-8563-5b7e-a3fb-3c3b731c0a88', 'working', 3, 10, 16.0, 150, FALSE, '2026-08-12T17:41:00+00:00'),
  ('29d09b40-ab0b-5eac-84c3-c822f8afc5b2', '674c1a6a-1885-572c-8a95-38bcf05422dd', 'working', 1, 10, 37.5, 60, FALSE, '2026-08-12T17:43:10+00:00'),
  ('d3782a03-254e-5638-8423-ee682f7343cc', '674c1a6a-1885-572c-8a95-38bcf05422dd', 'working', 2, 10, 37.5, 60, FALSE, '2026-08-12T17:45:20+00:00'),
  ('a115f7b1-aa0a-5f8c-8dc0-f733da1bdf11', '674c1a6a-1885-572c-8a95-38bcf05422dd', 'working', 3, 8, 37.5, 120, FALSE, '2026-08-12T17:48:24+00:00'),
  ('bacf99f6-f15f-5e63-a6ee-d279027a7aa8', '7b038c9a-9664-5137-acd3-639027b48190', 'working', 1, 12, 5.0, 150, FALSE, '2026-08-12T17:52:10+00:00'),
  ('899771d1-e728-5c98-994b-f9a9931ae1c0', '7b038c9a-9664-5137-acd3-639027b48190', 'working', 2, 12, 5.0, 150, FALSE, '2026-08-12T17:55:56+00:00'),
  ('a5502f78-98ec-56d4-bd4f-2305c1162aef', '7b038c9a-9664-5137-acd3-639027b48190', 'working', 3, 12, 5.0, 150, FALSE, '2026-08-12T17:59:42+00:00'),
  ('c06772fe-70dc-5a39-999e-37ad09486691', 'abaca103-a1f1-5e17-83aa-9720fa397eb2', 'working', 1, 12, 7.0, 90, FALSE, '2026-08-12T18:02:28+00:00'),
  ('797e1e1e-967d-5d49-9841-4b74af7c6453', 'abaca103-a1f1-5e17-83aa-9720fa397eb2', 'working', 2, 12, 7.0, 150, FALSE, '2026-08-12T18:06:14+00:00'),
  ('b2de4052-8540-5b32-9246-ddd5d921fd5a', 'abaca103-a1f1-5e17-83aa-9720fa397eb2', 'working', 3, 11, 7.0, 120, FALSE, '2026-08-12T18:09:27+00:00'),
  ('0656e99e-7855-5880-8cc1-f04eb4f6c3ad', 'dac7b788-3d54-5e85-b976-3980c16332e2', 'working', 1, 12, 20.0, 120, FALSE, '2026-08-12T18:12:43+00:00'),
  ('70dcfd46-4ff5-59d7-9d16-6a61ca08d04a', 'dac7b788-3d54-5e85-b976-3980c16332e2', 'working', 2, 12, 20.0, 90, FALSE, '2026-08-12T18:15:29+00:00'),
  ('9a5a09a4-9322-58fd-b631-5c031e4d04b5', 'dac7b788-3d54-5e85-b976-3980c16332e2', 'working', 3, 11, 20.0, 90, FALSE, '2026-08-12T18:18:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c6b596b8-84be-5a5a-8f0d-ef8c634f164e', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-14T17:43:00+00:00', '2026-08-14T18:34:00+00:00', 3060, 6450.0, FALSE, 68.0, 'gym', 320);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('6f29b627-7b58-5582-b8a6-d21b36995281', 'c6b596b8-84be-5a5a-8f0d-ef8c634f164e', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f96f8f05-3a83-53cb-9fc8-33092067dd5c', 'c6b596b8-84be-5a5a-8f0d-ef8c634f164e', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('9f69603e-4baf-53c4-a8fa-b10050d33606', 'c6b596b8-84be-5a5a-8f0d-ef8c634f164e', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('0b85475f-4a45-5972-8b0f-b34b59663b52', 'c6b596b8-84be-5a5a-8f0d-ef8c634f164e', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('41e56f32-1146-5285-924a-177b54ae51c8', '6f29b627-7b58-5582-b8a6-d21b36995281', 'working', 1, 10, 110.0, 90, FALSE, '2026-08-14T17:50:40+00:00'),
  ('4903cfa7-c34a-5525-bf3e-63bd205660f5', '6f29b627-7b58-5582-b8a6-d21b36995281', 'working', 2, 10, 110.0, 90, FALSE, '2026-08-14T17:53:20+00:00'),
  ('77826299-bee9-5e49-8f94-a9ff2c50129f', '6f29b627-7b58-5582-b8a6-d21b36995281', 'working', 3, 10, 110.0, 120, FALSE, '2026-08-14T17:56:30+00:00'),
  ('fa48890f-b733-51a0-96fb-3ecb4bc17077', 'f96f8f05-3a83-53cb-9fc8-33092067dd5c', 'working', 1, 10, 55.0, 90, FALSE, '2026-08-14T17:59:10+00:00'),
  ('46525a36-71c7-5702-a140-e92a448dd39f', 'f96f8f05-3a83-53cb-9fc8-33092067dd5c', 'working', 2, 10, 55.0, 90, FALSE, '2026-08-14T18:01:50+00:00'),
  ('82622de3-2b81-518c-8315-657d947bb16b', 'f96f8f05-3a83-53cb-9fc8-33092067dd5c', 'working', 3, 10, 55.0, 150, FALSE, '2026-08-14T18:05:30+00:00'),
  ('9a57681f-a1f5-57b4-b021-61dbd62a9925', '9f69603e-4baf-53c4-a8fa-b10050d33606', 'working', 1, 10, 50.0, 90, FALSE, '2026-08-14T18:08:10+00:00'),
  ('07054700-c225-59b4-b806-8d9a1bc8d730', '9f69603e-4baf-53c4-a8fa-b10050d33606', 'working', 2, 10, 50.0, 90, FALSE, '2026-08-14T18:10:50+00:00'),
  ('40d610d1-d93d-5672-8994-e9d5df542507', '9f69603e-4baf-53c4-a8fa-b10050d33606', 'working', 3, 10, 50.0, 90, FALSE, '2026-08-14T18:13:30+00:00'),
  ('0ecb2629-de86-5ccc-a982-0ade4fde51b2', '0b85475f-4a45-5972-8b0f-b34b59663b52', 'working', 1, 75, 0.0, 90, FALSE, '2026-08-14T18:19:25+00:00'),
  ('bcbd8944-96a8-5df1-ab98-1ea5d9faa3fb', '0b85475f-4a45-5972-8b0f-b34b59663b52', 'working', 2, 80, 0.0, 90, FALSE, '2026-08-14T18:25:35+00:00'),
  ('c83341c6-7d97-5626-b1c7-7fdce3634431', '0b85475f-4a45-5972-8b0f-b34b59663b52', 'working', 3, 75, 0.0, 60, FALSE, '2026-08-14T18:31:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('75b98402-2eef-533e-8061-f4e24fc8ac43', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-17T17:33:00+00:00', '2026-08-17T18:26:39+00:00', 3219, 6415.0, FALSE, 68.0, 'gym', 333);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('980dc3d6-6576-53d8-bcaf-e9f74347a7ea', '75b98402-2eef-533e-8061-f4e24fc8ac43', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f5554e2c-6cef-5f8f-8889-dffcb83a8e48', '75b98402-2eef-533e-8061-f4e24fc8ac43', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('8bfb2319-b413-5ff3-a2eb-290bf845df98', '75b98402-2eef-533e-8061-f4e24fc8ac43', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('d7632409-d5cf-55d0-8559-f58604485b9b', '75b98402-2eef-533e-8061-f4e24fc8ac43', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('54587603-c32f-582c-980b-60926612168d', '980dc3d6-6576-53d8-bcaf-e9f74347a7ea', 'working', 1, 10, 110.0, 150, FALSE, '2026-08-17T17:41:40+00:00'),
  ('2c55dd0d-11f4-52f1-b9a6-f09270ee7520', '980dc3d6-6576-53d8-bcaf-e9f74347a7ea', 'working', 2, 10, 110.0, 90, FALSE, '2026-08-17T17:44:20+00:00'),
  ('879a31a0-892b-5774-a70a-6e03b4572c6f', '980dc3d6-6576-53d8-bcaf-e9f74347a7ea', 'working', 3, 10, 110.0, 150, FALSE, '2026-08-17T17:48:00+00:00'),
  ('d9217947-2a59-528a-80d9-63374d9a448d', 'f5554e2c-6cef-5f8f-8889-dffcb83a8e48', 'working', 1, 10, 55.0, 60, FALSE, '2026-08-17T17:50:10+00:00'),
  ('77855375-677f-51a9-8090-b6c493615793', 'f5554e2c-6cef-5f8f-8889-dffcb83a8e48', 'working', 2, 10, 55.0, 150, FALSE, '2026-08-17T17:53:50+00:00'),
  ('e70e61f2-086f-5bd8-9cd9-1f6af3af07e4', 'f5554e2c-6cef-5f8f-8889-dffcb83a8e48', 'working', 3, 8, 55.0, 60, FALSE, '2026-08-17T17:55:54+00:00'),
  ('2d2c5610-9bea-5413-a56b-f2a574e7fb03', '8bfb2319-b413-5ff3-a2eb-290bf845df98', 'working', 1, 10, 52.5, 150, FALSE, '2026-08-17T17:59:34+00:00'),
  ('f009c7bb-970c-54ba-9b6b-e71b309d387f', '8bfb2319-b413-5ff3-a2eb-290bf845df98', 'working', 2, 10, 52.5, 90, FALSE, '2026-08-17T18:02:14+00:00'),
  ('1897af0f-6712-5ed2-a48d-60bf2fb9dec5', '8bfb2319-b413-5ff3-a2eb-290bf845df98', 'working', 3, 10, 52.5, 90, FALSE, '2026-08-17T18:04:54+00:00'),
  ('4b213e0e-a35d-5c8f-a5e8-b2ffdf16126f', 'd7632409-d5cf-55d0-8559-f58604485b9b', 'working', 1, 80, 0.0, 120, FALSE, '2026-08-17T18:11:34+00:00'),
  ('0a81a600-587a-54e7-8d8b-4038963989ce', 'd7632409-d5cf-55d0-8559-f58604485b9b', 'working', 2, 80, 0.0, 60, FALSE, '2026-08-17T18:17:14+00:00'),
  ('0e509100-00f8-5be7-9ca3-6a80c4653bc3', 'd7632409-d5cf-55d0-8559-f58604485b9b', 'working', 3, 85, 0.0, 90, FALSE, '2026-08-17T18:23:39+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('aca8a97c-2398-58e1-9902-829e5763f9b3', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-08-19T17:31:00+00:00', '2026-08-19T18:23:45+00:00', 3165, 2816.0, FALSE, 68.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b121c118-7bc0-5807-b538-ee54e7d0855f', 'aca8a97c-2398-58e1-9902-829e5763f9b3', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('ba338f75-4f0a-5395-b245-59524201c222', 'aca8a97c-2398-58e1-9902-829e5763f9b3', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('f808f98a-b74d-5c55-a216-bf04a724e352', 'aca8a97c-2398-58e1-9902-829e5763f9b3', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('9d9bd96e-13a7-5a6f-be2f-f42526796007', 'aca8a97c-2398-58e1-9902-829e5763f9b3', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('2090aa46-99bf-53e4-8743-c08093d5028f', 'aca8a97c-2398-58e1-9902-829e5763f9b3', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e11c80a6-e189-56ab-9cca-b1994a56f24c', 'b121c118-7bc0-5807-b538-ee54e7d0855f', 'working', 1, 10, 16.0, 120, FALSE, '2026-08-19T17:39:10+00:00'),
  ('7314bdcf-4781-5bf3-89b9-9b7009484a4d', 'b121c118-7bc0-5807-b538-ee54e7d0855f', 'working', 2, 10, 16.0, 90, FALSE, '2026-08-19T17:41:50+00:00'),
  ('b66bc4b8-a8a0-5c23-a919-30cf34b0dfae', 'b121c118-7bc0-5807-b538-ee54e7d0855f', 'working', 3, 10, 16.0, 150, FALSE, '2026-08-19T17:45:30+00:00'),
  ('9d3b091d-7b1e-5ee9-af72-a885f32bb138', 'ba338f75-4f0a-5395-b245-59524201c222', 'working', 1, 10, 40.0, 90, FALSE, '2026-08-19T17:48:10+00:00'),
  ('11d65310-4c5e-5514-802b-07da592edc10', 'ba338f75-4f0a-5395-b245-59524201c222', 'working', 2, 10, 40.0, 120, FALSE, '2026-08-19T17:51:20+00:00'),
  ('d218f913-3031-567d-95e2-aed568d15ce9', 'ba338f75-4f0a-5395-b245-59524201c222', 'working', 3, 8, 40.0, 60, FALSE, '2026-08-19T17:53:24+00:00'),
  ('9359d5e0-0b63-5010-bd7a-99ac0e9294fa', 'f808f98a-b74d-5c55-a216-bf04a724e352', 'working', 1, 12, 6.0, 120, FALSE, '2026-08-19T17:56:40+00:00'),
  ('380d1e59-33fa-58fc-b1a6-5daa10bf0f89', 'f808f98a-b74d-5c55-a216-bf04a724e352', 'working', 2, 12, 6.0, 90, FALSE, '2026-08-19T17:59:26+00:00'),
  ('f4c84250-72c8-5080-b1f4-44d98076ca39', 'f808f98a-b74d-5c55-a216-bf04a724e352', 'working', 3, 12, 6.0, 90, FALSE, '2026-08-19T18:02:12+00:00'),
  ('d6adafdb-5543-558f-becd-fc802885fa4f', '9d9bd96e-13a7-5a6f-be2f-f42526796007', 'working', 1, 12, 8.0, 60, FALSE, '2026-08-19T18:04:28+00:00'),
  ('82b19f9d-27f8-57e9-9518-a90ef917908b', '9d9bd96e-13a7-5a6f-be2f-f42526796007', 'working', 2, 12, 8.0, 150, FALSE, '2026-08-19T18:08:14+00:00'),
  ('d67b0d49-11d9-57a9-b4e3-29a51ae8bc14', '9d9bd96e-13a7-5a6f-be2f-f42526796007', 'working', 3, 11, 8.0, 120, FALSE, '2026-08-19T18:11:27+00:00'),
  ('ad84be06-789f-5245-8b60-c5e2a5bc5e04', '2090aa46-99bf-53e4-8743-c08093d5028f', 'working', 1, 12, 20.0, 90, FALSE, '2026-08-19T18:14:13+00:00'),
  ('d5e31510-63e7-5895-bf05-e9a915d99e14', '2090aa46-99bf-53e4-8743-c08093d5028f', 'working', 2, 12, 20.0, 150, FALSE, '2026-08-19T18:17:59+00:00'),
  ('20f75c6e-6045-5ec3-b42f-34778d8c30ae', '2090aa46-99bf-53e4-8743-c08093d5028f', 'working', 3, 12, 20.0, 90, FALSE, '2026-08-19T18:20:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('0b7c45be-6722-5751-8f79-72584422d63e', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-21T17:06:00+00:00', '2026-08-21T18:00:15+00:00', 3255, 6750.0, FALSE, 68.0, 'gym', 335);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8b03f8c1-8c47-5636-baf4-4418c9d1603f', '0b7c45be-6722-5751-8f79-72584422d63e', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('7d87a8fa-6008-5046-aec5-eafb9bcde1a8', '0b7c45be-6722-5751-8f79-72584422d63e', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('f3d05a29-0eed-5779-af60-79f352bc28b9', '0b7c45be-6722-5751-8f79-72584422d63e', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('179e7a21-82e9-54b4-9c76-391178043393', '0b7c45be-6722-5751-8f79-72584422d63e', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6ca480c9-f8e4-5b5e-8559-7fa4902d7820', '8b03f8c1-8c47-5636-baf4-4418c9d1603f', 'working', 1, 10, 115.0, 150, FALSE, '2026-08-21T17:14:40+00:00'),
  ('d82f38d4-2aec-5ba2-aa65-e08186f8f60e', '8b03f8c1-8c47-5636-baf4-4418c9d1603f', 'working', 2, 10, 115.0, 150, FALSE, '2026-08-21T17:18:20+00:00'),
  ('53f03366-9e50-56f9-8a48-ff28cbd968bb', '8b03f8c1-8c47-5636-baf4-4418c9d1603f', 'working', 3, 10, 115.0, 60, FALSE, '2026-08-21T17:20:30+00:00'),
  ('9d39a24d-a4eb-59ad-a23c-f2ef00871e8a', '7d87a8fa-6008-5046-aec5-eafb9bcde1a8', 'working', 1, 10, 57.5, 60, FALSE, '2026-08-21T17:22:40+00:00'),
  ('4497c26e-9727-5699-a13d-32db26012491', '7d87a8fa-6008-5046-aec5-eafb9bcde1a8', 'working', 2, 10, 57.5, 120, FALSE, '2026-08-21T17:25:50+00:00'),
  ('68db9977-177c-552d-8f07-ee3de63706c9', '7d87a8fa-6008-5046-aec5-eafb9bcde1a8', 'working', 3, 10, 57.5, 150, FALSE, '2026-08-21T17:29:30+00:00'),
  ('1c977b7d-a43c-58b0-a6e6-76d74e7b2ae4', 'f3d05a29-0eed-5779-af60-79f352bc28b9', 'working', 1, 10, 52.5, 150, FALSE, '2026-08-21T17:33:10+00:00'),
  ('e438e396-ed35-5e60-adce-a565777f4d2b', 'f3d05a29-0eed-5779-af60-79f352bc28b9', 'working', 2, 10, 52.5, 90, FALSE, '2026-08-21T17:35:50+00:00'),
  ('f19de6b1-c3e5-5ca4-8e44-cf0a037770ea', 'f3d05a29-0eed-5779-af60-79f352bc28b9', 'working', 3, 10, 52.5, 60, FALSE, '2026-08-21T17:38:00+00:00'),
  ('65d65b7d-66d4-591e-a070-5ea8c025b741', '179e7a21-82e9-54b4-9c76-391178043393', 'working', 1, 80, 0.0, 90, FALSE, '2026-08-21T17:44:10+00:00'),
  ('6c8ce491-981e-59db-bef5-56be21378833', '179e7a21-82e9-54b4-9c76-391178043393', 'working', 2, 85, 0.0, 60, FALSE, '2026-08-21T17:50:05+00:00'),
  ('345f8858-06bb-5bba-970d-ee7652667120', '179e7a21-82e9-54b4-9c76-391178043393', 'working', 3, 80, 0.0, 150, FALSE, '2026-08-21T17:57:15+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('20f66e99-b2df-522d-9b7c-2c978f67e1cd', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-24T17:16:00+00:00', '2026-08-24T18:10:54+00:00', 3294, 6520.0, FALSE, 68.0, 'gym', 338);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('1c733f10-1076-5e5c-9d58-2408ebc72587', '20f66e99-b2df-522d-9b7c-2c978f67e1cd', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('34dcf1fd-f0d1-5f53-8bb0-4c69e5a6ba73', '20f66e99-b2df-522d-9b7c-2c978f67e1cd', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('3fd842c0-432d-58b7-af6a-6b63483a23a3', '20f66e99-b2df-522d-9b7c-2c978f67e1cd', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('47a6963c-7301-5c3f-b3a0-d614436c8722', '20f66e99-b2df-522d-9b7c-2c978f67e1cd', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6a432bc8-eeff-5429-9ec8-e4ee01762ea9', '1c733f10-1076-5e5c-9d58-2408ebc72587', 'working', 1, 10, 115.0, 90, FALSE, '2026-08-24T17:23:40+00:00'),
  ('ae1ddd46-e54a-509d-a62d-aa26c814a388', '1c733f10-1076-5e5c-9d58-2408ebc72587', 'working', 2, 10, 115.0, 60, FALSE, '2026-08-24T17:25:50+00:00'),
  ('a33fb2b8-c8c5-5885-b703-3e18d190f548', '1c733f10-1076-5e5c-9d58-2408ebc72587', 'working', 3, 8, 115.0, 150, FALSE, '2026-08-24T17:29:24+00:00'),
  ('678b5185-e1db-5094-b11a-ea08d13a4a99', '34dcf1fd-f0d1-5f53-8bb0-4c69e5a6ba73', 'working', 1, 10, 57.5, 90, FALSE, '2026-08-24T17:32:04+00:00'),
  ('089233a4-a711-5703-ae42-e5dc1c130c62', '34dcf1fd-f0d1-5f53-8bb0-4c69e5a6ba73', 'working', 2, 10, 57.5, 120, FALSE, '2026-08-24T17:35:14+00:00'),
  ('583f9ff1-600b-5de6-bf8f-b453e9dd7785', '34dcf1fd-f0d1-5f53-8bb0-4c69e5a6ba73', 'working', 3, 10, 57.5, 120, FALSE, '2026-08-24T17:38:24+00:00'),
  ('e1e5cbcd-f0cc-56f9-a53f-7ef3af4e9d39', '3fd842c0-432d-58b7-af6a-6b63483a23a3', 'working', 1, 10, 52.5, 150, FALSE, '2026-08-24T17:42:04+00:00'),
  ('fdf1b907-2fec-561b-8a7a-6985d4833e44', '3fd842c0-432d-58b7-af6a-6b63483a23a3', 'working', 2, 10, 52.5, 90, FALSE, '2026-08-24T17:44:44+00:00'),
  ('bff58d3d-b880-51b4-8073-e3e3b2fbd49d', '3fd842c0-432d-58b7-af6a-6b63483a23a3', 'working', 3, 10, 52.5, 60, FALSE, '2026-08-24T17:46:54+00:00'),
  ('4b10899a-5f40-5c3c-ac0a-fb2efd714322', '47a6963c-7301-5c3f-b3a0-d614436c8722', 'working', 1, 80, 0.0, 150, FALSE, '2026-08-24T17:54:04+00:00'),
  ('2cf2f03d-173c-5d2e-af0b-72bc98cd9abb', '47a6963c-7301-5c3f-b3a0-d614436c8722', 'working', 2, 85, 0.0, 120, FALSE, '2026-08-24T18:00:59+00:00'),
  ('a20e1eaf-7502-52f0-87e1-4d2f1074dc46', '47a6963c-7301-5c3f-b3a0-d614436c8722', 'working', 3, 85, 0.0, 120, FALSE, '2026-08-24T18:07:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('30c99d82-41cd-5e70-a564-e5cfb6c04dfd', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-08-26T17:12:00+00:00', '2026-08-26T18:04:45+00:00', 3165, 2968.0, FALSE, 68.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8e1a7179-f063-5d0d-b2e1-83ee1f8dc466', '30c99d82-41cd-5e70-a564-e5cfb6c04dfd', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('f2b6d3c8-fb66-5707-9590-002eb4c6521d', '30c99d82-41cd-5e70-a564-e5cfb6c04dfd', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('9b4b8154-6aa8-549a-97f5-52ccad325289', '30c99d82-41cd-5e70-a564-e5cfb6c04dfd', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('2368b801-bce9-5fc0-a3b5-1d5faa1d5f85', '30c99d82-41cd-5e70-a564-e5cfb6c04dfd', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('f6cce427-2fb4-5bed-96e1-d7778e7ea04e', '30c99d82-41cd-5e70-a564-e5cfb6c04dfd', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4b70aa19-6542-57c9-ac75-6b600d5f4463', '8e1a7179-f063-5d0d-b2e1-83ee1f8dc466', 'working', 1, 10, 18.0, 150, FALSE, '2026-08-26T17:20:40+00:00'),
  ('fee81960-8e9d-53d0-853f-6000b41ae828', '8e1a7179-f063-5d0d-b2e1-83ee1f8dc466', 'working', 2, 10, 18.0, 90, FALSE, '2026-08-26T17:23:20+00:00'),
  ('28c156ee-9a74-548e-9bae-09ee9a65c713', '8e1a7179-f063-5d0d-b2e1-83ee1f8dc466', 'working', 3, 10, 18.0, 90, FALSE, '2026-08-26T17:26:00+00:00'),
  ('222f2548-221c-567b-bd40-1992b68d10f7', 'f2b6d3c8-fb66-5707-9590-002eb4c6521d', 'working', 1, 10, 40.0, 150, FALSE, '2026-08-26T17:29:40+00:00'),
  ('b26a9f5c-89ce-5184-82ff-74c219956513', 'f2b6d3c8-fb66-5707-9590-002eb4c6521d', 'working', 2, 10, 40.0, 150, FALSE, '2026-08-26T17:33:20+00:00'),
  ('42d6d361-6bb6-59dd-a247-89450c2c59e7', 'f2b6d3c8-fb66-5707-9590-002eb4c6521d', 'working', 3, 8, 40.0, 150, FALSE, '2026-08-26T17:36:54+00:00'),
  ('1400336f-76b8-5d68-991c-ae262272bb8e', '9b4b8154-6aa8-549a-97f5-52ccad325289', 'working', 1, 12, 6.0, 60, FALSE, '2026-08-26T17:39:10+00:00'),
  ('226efb17-989e-56fc-8aa3-d143d5735a9d', '9b4b8154-6aa8-549a-97f5-52ccad325289', 'working', 2, 12, 6.0, 120, FALSE, '2026-08-26T17:42:26+00:00'),
  ('aea0e358-0885-5dd5-bd78-a037eb32d652', '9b4b8154-6aa8-549a-97f5-52ccad325289', 'working', 3, 11, 6.0, 90, FALSE, '2026-08-26T17:45:09+00:00'),
  ('b1e17a5d-7098-558e-a842-5cbae70e0fa8', '2368b801-bce9-5fc0-a3b5-1d5faa1d5f85', 'working', 1, 12, 8.0, 90, FALSE, '2026-08-26T17:47:55+00:00'),
  ('cfffbcec-5ef2-5600-a5af-d8d3903b8cec', '2368b801-bce9-5fc0-a3b5-1d5faa1d5f85', 'working', 2, 12, 8.0, 60, FALSE, '2026-08-26T17:50:11+00:00'),
  ('025e0a6c-ea76-5515-b10d-54ea8dd8822d', '2368b801-bce9-5fc0-a3b5-1d5faa1d5f85', 'working', 3, 12, 8.0, 90, FALSE, '2026-08-26T17:52:57+00:00'),
  ('ffafa0a0-d64d-5ba5-a55c-eab0b7db62d4', 'f6cce427-2fb4-5bed-96e1-d7778e7ea04e', 'working', 1, 12, 22.5, 120, FALSE, '2026-08-26T17:56:13+00:00'),
  ('a33e2443-0514-5dfc-9558-822116f68f54', 'f6cce427-2fb4-5bed-96e1-d7778e7ea04e', 'working', 2, 12, 22.5, 90, FALSE, '2026-08-26T17:58:59+00:00'),
  ('96394f8b-5ea4-5e18-a716-bcf6939be912', 'f6cce427-2fb4-5bed-96e1-d7778e7ea04e', 'working', 3, 12, 22.5, 90, FALSE, '2026-08-26T18:01:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('f558691a-424b-5fd9-b06e-fd8206c55b6a', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-28T17:45:00+00:00', '2026-08-28T18:36:21+00:00', 3081, 6820.0, FALSE, 68.0, 'gym', 347);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9392837b-90ae-5e7e-b321-20bd624c754c', 'f558691a-424b-5fd9-b06e-fd8206c55b6a', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('e1a34dd3-4ca1-516c-ad76-9b813d644725', 'f558691a-424b-5fd9-b06e-fd8206c55b6a', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('a638d11e-658a-5d95-9dd3-ff2f6b05778f', 'f558691a-424b-5fd9-b06e-fd8206c55b6a', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('4dd50ca9-1650-5f39-a178-7614904ac667', 'f558691a-424b-5fd9-b06e-fd8206c55b6a', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('c649aa31-e3b0-5988-8ee2-1063de0c37e3', '9392837b-90ae-5e7e-b321-20bd624c754c', 'working', 1, 10, 120.0, 90, FALSE, '2026-08-28T17:52:40+00:00'),
  ('b4c01800-5490-54ba-9a4c-d43d81f59921', '9392837b-90ae-5e7e-b321-20bd624c754c', 'working', 2, 10, 120.0, 60, FALSE, '2026-08-28T17:54:50+00:00'),
  ('95461996-e460-5bd2-8b24-285f4de153ad', '9392837b-90ae-5e7e-b321-20bd624c754c', 'working', 3, 9, 120.0, 90, FALSE, '2026-08-28T17:57:27+00:00'),
  ('57828e73-1d39-583d-ad05-41cb3984a88a', 'e1a34dd3-4ca1-516c-ad76-9b813d644725', 'working', 1, 10, 60.0, 60, FALSE, '2026-08-28T17:59:37+00:00'),
  ('3aa22dcb-2653-57fd-be62-3b32e6eec9bc', 'e1a34dd3-4ca1-516c-ad76-9b813d644725', 'working', 2, 10, 60.0, 120, FALSE, '2026-08-28T18:02:47+00:00'),
  ('861d9f83-505d-5d62-90c4-4735e79eb378', 'e1a34dd3-4ca1-516c-ad76-9b813d644725', 'working', 3, 10, 60.0, 60, FALSE, '2026-08-28T18:04:57+00:00'),
  ('9c067f3b-0a5e-5c7a-b319-081bedfd1a44', 'a638d11e-658a-5d95-9dd3-ff2f6b05778f', 'working', 1, 10, 55.0, 120, FALSE, '2026-08-28T18:08:07+00:00'),
  ('afad7454-6c9d-583b-9fa8-598fb648da1c', 'a638d11e-658a-5d95-9dd3-ff2f6b05778f', 'working', 2, 10, 55.0, 90, FALSE, '2026-08-28T18:10:47+00:00'),
  ('a71c31f4-71c9-55b5-8216-60a163e7f142', 'a638d11e-658a-5d95-9dd3-ff2f6b05778f', 'working', 3, 8, 55.0, 120, FALSE, '2026-08-28T18:13:51+00:00'),
  ('e890a9d8-81fe-5d2f-8599-827e00b62c90', '4dd50ca9-1650-5f39-a178-7614904ac667', 'working', 1, 85, 0.0, 90, FALSE, '2026-08-28T18:20:16+00:00'),
  ('df31a2f2-cefe-5872-b856-f56a0d4ae671', '4dd50ca9-1650-5f39-a178-7614904ac667', 'working', 2, 85, 0.0, 90, FALSE, '2026-08-28T18:26:41+00:00'),
  ('6ec0005e-dd85-5708-a2d8-b6e981dd9c04', '4dd50ca9-1650-5f39-a178-7614904ac667', 'working', 3, 90, 0.0, 90, FALSE, '2026-08-28T18:33:21+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('31eb6d87-9640-5c2a-9959-5564b2ab68c3', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-08-31T17:24:00+00:00', '2026-08-31T18:17:39+00:00', 3219, 6810.0, FALSE, 68.0, 'gym', 353);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b61a6ee8-f270-5c8b-baf4-e0f15c69dfe9', '31eb6d87-9640-5c2a-9959-5564b2ab68c3', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('84ae89a8-e28e-5a2b-9476-cdb54669ffde', '31eb6d87-9640-5c2a-9959-5564b2ab68c3', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('3a6d5b1a-8a74-5ea4-a735-fc5f227a9c45', '31eb6d87-9640-5c2a-9959-5564b2ab68c3', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('ed00ce89-e844-57cc-8bf9-8e24d1afe964', '31eb6d87-9640-5c2a-9959-5564b2ab68c3', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('53ecd0f0-01e9-58e4-b5fe-783ffdca2c00', 'b61a6ee8-f270-5c8b-baf4-e0f15c69dfe9', 'working', 1, 10, 120.0, 60, FALSE, '2026-08-31T17:31:10+00:00'),
  ('4b433a3d-5d81-5194-8d58-6ad09356b26e', 'b61a6ee8-f270-5c8b-baf4-e0f15c69dfe9', 'working', 2, 10, 120.0, 90, FALSE, '2026-08-31T17:33:50+00:00'),
  ('317f3eec-69fe-5c5a-b703-174b1b79c9d0', 'b61a6ee8-f270-5c8b-baf4-e0f15c69dfe9', 'working', 3, 8, 120.0, 90, FALSE, '2026-08-31T17:36:24+00:00'),
  ('820ab0a1-cb77-59de-bb9f-6f22c210c3bd', '84ae89a8-e28e-5a2b-9476-cdb54669ffde', 'working', 1, 10, 60.0, 90, FALSE, '2026-08-31T17:39:04+00:00'),
  ('d006e5ce-c02d-5f85-bf56-d7514408dde6', '84ae89a8-e28e-5a2b-9476-cdb54669ffde', 'working', 2, 10, 60.0, 90, FALSE, '2026-08-31T17:41:44+00:00'),
  ('c3ce7f63-c03e-509e-b5a2-6d9a582eecd1', '84ae89a8-e28e-5a2b-9476-cdb54669ffde', 'working', 3, 10, 60.0, 90, FALSE, '2026-08-31T17:44:24+00:00'),
  ('91c43863-1f38-58a2-a91b-b71f5d680101', '3a6d5b1a-8a74-5ea4-a735-fc5f227a9c45', 'working', 1, 10, 55.0, 120, FALSE, '2026-08-31T17:47:34+00:00'),
  ('38ecb937-27c4-54cc-bf0a-0909cbea7c4f', '3a6d5b1a-8a74-5ea4-a735-fc5f227a9c45', 'working', 2, 10, 55.0, 120, FALSE, '2026-08-31T17:50:44+00:00'),
  ('5eb08b88-dbaf-5819-ad00-1129e4ce0190', '3a6d5b1a-8a74-5ea4-a735-fc5f227a9c45', 'working', 3, 10, 55.0, 120, FALSE, '2026-08-31T17:53:54+00:00'),
  ('fc37fd73-4412-50f8-b43c-2ae39630b3bd', 'ed00ce89-e844-57cc-8bf9-8e24d1afe964', 'working', 1, 85, 0.0, 120, FALSE, '2026-08-31T18:00:49+00:00'),
  ('a3e11732-c312-5d94-b122-65d5e53c4543', 'ed00ce89-e844-57cc-8bf9-8e24d1afe964', 'working', 2, 90, 0.0, 60, FALSE, '2026-08-31T18:06:59+00:00'),
  ('48e0100e-96bf-5205-8fea-87c8be24e85d', 'ed00ce89-e844-57cc-8bf9-8e24d1afe964', 'working', 3, 90, 0.0, 150, FALSE, '2026-08-31T18:14:39+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('dd6bf37b-9145-5bfd-ba1a-f37383061721', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-09-02T17:10:00+00:00', '2026-09-02T18:04:24+00:00', 3264, 3129.0, FALSE, 68.0, 'gym', 168);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('1e0b66df-8d74-589f-9c5a-3f5234767b7f', 'dd6bf37b-9145-5bfd-ba1a-f37383061721', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('a7e2afb8-8fb1-55b9-9d5d-3543ca3c65f3', 'dd6bf37b-9145-5bfd-ba1a-f37383061721', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('4bace959-d075-57e3-9c59-f737c91b145a', 'dd6bf37b-9145-5bfd-ba1a-f37383061721', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('cf129c88-29dc-5cbc-a6de-22f0d9675702', 'dd6bf37b-9145-5bfd-ba1a-f37383061721', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('8b97580a-496f-5b51-934f-4f8525baacf3', 'dd6bf37b-9145-5bfd-ba1a-f37383061721', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('77779a5a-81bf-5878-b33b-4b33d8cc82b7', '1e0b66df-8d74-589f-9c5a-3f5234767b7f', 'working', 1, 10, 18.0, 60, FALSE, '2026-09-02T17:17:10+00:00'),
  ('305adb39-271e-5b4c-aec3-5453fb20938f', '1e0b66df-8d74-589f-9c5a-3f5234767b7f', 'working', 2, 10, 18.0, 150, FALSE, '2026-09-02T17:20:50+00:00'),
  ('730d5f6b-dfa3-5c0e-accb-ed0b391a0ee6', '1e0b66df-8d74-589f-9c5a-3f5234767b7f', 'working', 3, 10, 18.0, 90, FALSE, '2026-09-02T17:23:30+00:00'),
  ('da4eac62-eade-5af6-94dd-59d722959fda', 'a7e2afb8-8fb1-55b9-9d5d-3543ca3c65f3', 'working', 1, 10, 42.5, 150, FALSE, '2026-09-02T17:27:10+00:00'),
  ('917f5744-a713-57f6-8d0d-47786a6dc62a', 'a7e2afb8-8fb1-55b9-9d5d-3543ca3c65f3', 'working', 2, 10, 42.5, 120, FALSE, '2026-09-02T17:30:20+00:00'),
  ('d4b0d9f9-f244-5e12-8499-540f9ada004a', 'a7e2afb8-8fb1-55b9-9d5d-3543ca3c65f3', 'working', 3, 10, 42.5, 90, FALSE, '2026-09-02T17:33:00+00:00'),
  ('a7fbd000-8621-5d16-93f4-9cb4d8431ac7', '4bace959-d075-57e3-9c59-f737c91b145a', 'working', 1, 12, 6.0, 120, FALSE, '2026-09-02T17:36:16+00:00'),
  ('946f16f3-02d4-5a0e-ab93-93a5a644c966', '4bace959-d075-57e3-9c59-f737c91b145a', 'working', 2, 12, 6.0, 150, FALSE, '2026-09-02T17:40:02+00:00'),
  ('20a453c4-f8d9-5f20-b4cc-a4afea2be038', '4bace959-d075-57e3-9c59-f737c91b145a', 'working', 3, 12, 6.0, 120, FALSE, '2026-09-02T17:43:18+00:00'),
  ('8afcac96-69ea-5692-a73e-79799424c23c', 'cf129c88-29dc-5cbc-a6de-22f0d9675702', 'working', 1, 12, 8.0, 90, FALSE, '2026-09-02T17:46:04+00:00'),
  ('ab4054a6-ca84-58b5-910b-e75153cc5f7f', 'cf129c88-29dc-5cbc-a6de-22f0d9675702', 'working', 2, 12, 8.0, 150, FALSE, '2026-09-02T17:49:50+00:00'),
  ('283f02f8-1997-50f6-b404-324fab3282e3', 'cf129c88-29dc-5cbc-a6de-22f0d9675702', 'working', 3, 12, 8.0, 90, FALSE, '2026-09-02T17:52:36+00:00'),
  ('db031e15-4b88-5d53-b6ed-545a269b2525', '8b97580a-496f-5b51-934f-4f8525baacf3', 'working', 1, 12, 22.5, 120, FALSE, '2026-09-02T17:55:52+00:00'),
  ('b1850117-3949-5f41-8336-f2513247c0b1', '8b97580a-496f-5b51-934f-4f8525baacf3', 'working', 2, 12, 22.5, 90, FALSE, '2026-09-02T17:58:38+00:00'),
  ('17664cb9-dd72-520c-b852-8dc01615b6bb', '8b97580a-496f-5b51-934f-4f8525baacf3', 'working', 3, 12, 22.5, 90, FALSE, '2026-09-02T18:01:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('4a31e143-4834-5d3e-9952-fc3e3f4edbee', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-04T17:16:00+00:00', '2026-09-04T18:12:57+00:00', 3417, 7150.0, FALSE, 68.0, 'gym', 369);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('06db6657-2406-53fa-bef6-fd03995444a4', '4a31e143-4834-5d3e-9952-fc3e3f4edbee', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('3a8086a1-8ac1-5040-8e4a-6a0e4a796aff', '4a31e143-4834-5d3e-9952-fc3e3f4edbee', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('7fc44d4e-edc8-5150-84e5-41a949b38074', '4a31e143-4834-5d3e-9952-fc3e3f4edbee', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('82a3666b-586b-557f-9b59-542a24f4246c', '4a31e143-4834-5d3e-9952-fc3e3f4edbee', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('331710f2-dcd4-5f97-9e7f-c522d8e74714', '06db6657-2406-53fa-bef6-fd03995444a4', 'working', 1, 10, 125.0, 90, FALSE, '2026-09-04T17:23:40+00:00'),
  ('9d8a338d-877b-567f-b9ff-517ab67973e8', '06db6657-2406-53fa-bef6-fd03995444a4', 'working', 2, 10, 125.0, 90, FALSE, '2026-09-04T17:26:20+00:00'),
  ('8b6b6aea-ca51-5fee-90fe-668b9368d56e', '06db6657-2406-53fa-bef6-fd03995444a4', 'working', 3, 9, 125.0, 90, FALSE, '2026-09-04T17:28:57+00:00'),
  ('e86abc7f-23ab-5ae8-888d-89b21e17866d', '3a8086a1-8ac1-5040-8e4a-6a0e4a796aff', 'working', 1, 10, 62.5, 90, FALSE, '2026-09-04T17:31:37+00:00'),
  ('a5411afd-cd1d-5713-bc72-bf3b2d48fb8d', '3a8086a1-8ac1-5040-8e4a-6a0e4a796aff', 'working', 2, 10, 62.5, 90, FALSE, '2026-09-04T17:34:17+00:00'),
  ('bb59799b-81fd-5263-a5f4-779e78088ad1', '3a8086a1-8ac1-5040-8e4a-6a0e4a796aff', 'working', 3, 10, 62.5, 120, FALSE, '2026-09-04T17:37:27+00:00'),
  ('b07687c4-9d4e-58f7-89c9-b9d102eb7bcf', '7fc44d4e-edc8-5150-84e5-41a949b38074', 'working', 1, 10, 55.0, 120, FALSE, '2026-09-04T17:40:37+00:00'),
  ('c1f3f5c5-974f-59b9-93a8-43ccd47430fd', '7fc44d4e-edc8-5150-84e5-41a949b38074', 'working', 2, 10, 55.0, 150, FALSE, '2026-09-04T17:44:17+00:00'),
  ('86f177dc-87da-54d8-952a-80968211abbd', '7fc44d4e-edc8-5150-84e5-41a949b38074', 'working', 3, 10, 55.0, 150, FALSE, '2026-09-04T17:47:57+00:00'),
  ('bb206341-91db-5475-acb7-9367a790cea5', '82a3666b-586b-557f-9b59-542a24f4246c', 'working', 1, 95, 0.0, 120, FALSE, '2026-09-04T17:55:22+00:00'),
  ('5701a513-a0ee-521d-9f49-20673ed1f9c4', '82a3666b-586b-557f-9b59-542a24f4246c', 'working', 2, 90, 0.0, 120, FALSE, '2026-09-04T18:02:32+00:00'),
  ('fc3710af-974e-5b95-b149-10f6463832b9', '82a3666b-586b-557f-9b59-542a24f4246c', 'working', 3, 95, 0.0, 120, FALSE, '2026-09-04T18:09:57+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2cff5201-3394-5934-a6b3-fcbfb77452f9', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-07T17:35:00+00:00', '2026-09-07T18:31:21+00:00', 3381, 7042.5, FALSE, 68.0, 'gym', 367);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('70d1bbd4-a843-5474-8b83-1cf4ea1c8457', '2cff5201-3394-5934-a6b3-fcbfb77452f9', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f7ac4c0a-75a4-58e5-9c42-00a62fb029b5', '2cff5201-3394-5934-a6b3-fcbfb77452f9', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('97db0ac5-8781-5ab9-91d1-29fa76a074b7', '2cff5201-3394-5934-a6b3-fcbfb77452f9', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('9012e8ca-b45f-5f09-af2c-2298091c61ea', '2cff5201-3394-5934-a6b3-fcbfb77452f9', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('fd0b4ccd-1589-5efe-8449-e57cb26b8f39', '70d1bbd4-a843-5474-8b83-1cf4ea1c8457', 'working', 1, 10, 125.0, 90, FALSE, '2026-09-07T17:42:40+00:00'),
  ('8346f23c-b327-5be0-9c7d-269e8d30e149', '70d1bbd4-a843-5474-8b83-1cf4ea1c8457', 'working', 2, 10, 125.0, 60, FALSE, '2026-09-07T17:44:50+00:00'),
  ('8d0ef7d8-2dba-5acc-bc52-1b6eaf545183', '70d1bbd4-a843-5474-8b83-1cf4ea1c8457', 'working', 3, 8, 125.0, 150, FALSE, '2026-09-07T17:48:24+00:00'),
  ('ca6f6c77-c767-5cce-8fb9-4fb73f94eb4c', 'f7ac4c0a-75a4-58e5-9c42-00a62fb029b5', 'working', 1, 10, 62.5, 120, FALSE, '2026-09-07T17:51:34+00:00'),
  ('2da9b4ea-053a-54d3-8db7-b282c36691bd', 'f7ac4c0a-75a4-58e5-9c42-00a62fb029b5', 'working', 2, 10, 62.5, 150, FALSE, '2026-09-07T17:55:14+00:00'),
  ('183d86a1-3497-5bf3-b783-ea6a17f67dbd', 'f7ac4c0a-75a4-58e5-9c42-00a62fb029b5', 'working', 3, 10, 62.5, 120, FALSE, '2026-09-07T17:58:24+00:00'),
  ('8ecb8843-e21a-50d1-b5be-7d5aee69d4e6', '97db0ac5-8781-5ab9-91d1-29fa76a074b7', 'working', 1, 10, 57.5, 120, FALSE, '2026-09-07T18:01:34+00:00'),
  ('8e8d6ab9-9e05-5df6-9eea-5248e4ef0e4c', '97db0ac5-8781-5ab9-91d1-29fa76a074b7', 'working', 2, 10, 57.5, 90, FALSE, '2026-09-07T18:04:14+00:00'),
  ('3e560b28-90b1-5b2b-8e5e-9abb31611d11', '97db0ac5-8781-5ab9-91d1-29fa76a074b7', 'working', 3, 9, 57.5, 150, FALSE, '2026-09-07T18:07:51+00:00'),
  ('6a1f6e0b-bb8b-542a-b603-2b48809a0f32', '9012e8ca-b45f-5f09-af2c-2298091c61ea', 'working', 1, 95, 0.0, 90, FALSE, '2026-09-07T18:14:46+00:00'),
  ('d0872ed2-9d7b-5c85-900d-13b4fec51bb0', '9012e8ca-b45f-5f09-af2c-2298091c61ea', 'working', 2, 95, 0.0, 90, FALSE, '2026-09-07T18:21:41+00:00'),
  ('cee8e33a-6b04-5173-be92-a0ceecdad33e', '9012e8ca-b45f-5f09-af2c-2298091c61ea', 'working', 3, 90, 0.0, 90, FALSE, '2026-09-07T18:28:21+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('862f632e-55f0-5618-8b97-f30c5bb47bff', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-09-09T17:39:00+00:00', '2026-09-09T18:28:45+00:00', 2985, 3107.0, FALSE, 68.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('71cd8047-bab0-52ed-a4c3-311c0e3c3760', '862f632e-55f0-5618-8b97-f30c5bb47bff', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('53aaafec-983b-5593-8524-eb474f944e60', '862f632e-55f0-5618-8b97-f30c5bb47bff', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('a97b4866-cce8-5f3f-8fd5-6658a1c0915e', '862f632e-55f0-5618-8b97-f30c5bb47bff', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('8da98371-b8b6-5502-adca-154cee2c57bc', '862f632e-55f0-5618-8b97-f30c5bb47bff', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('f442033b-95a1-5d07-8a2a-7fd6d6c3dfa7', '862f632e-55f0-5618-8b97-f30c5bb47bff', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1e2dea2c-2d70-551c-9ad4-93e296e32a14', '71cd8047-bab0-52ed-a4c3-311c0e3c3760', 'working', 1, 10, 18.0, 60, FALSE, '2026-09-09T17:46:10+00:00'),
  ('e24ad555-a303-5f74-9962-1f2f7e549e29', '71cd8047-bab0-52ed-a4c3-311c0e3c3760', 'working', 2, 10, 18.0, 60, FALSE, '2026-09-09T17:48:20+00:00'),
  ('9f5cf89e-7f4a-569c-ad12-04307c03671f', '71cd8047-bab0-52ed-a4c3-311c0e3c3760', 'working', 3, 10, 18.0, 90, FALSE, '2026-09-09T17:51:00+00:00'),
  ('5778266b-6c46-5e54-a304-dda1cff76844', '53aaafec-983b-5593-8524-eb474f944e60', 'working', 1, 10, 42.5, 60, FALSE, '2026-09-09T17:53:10+00:00'),
  ('9d1eacb5-592b-503f-b81f-eb2fa6a6de91', '53aaafec-983b-5593-8524-eb474f944e60', 'working', 2, 10, 42.5, 90, FALSE, '2026-09-09T17:55:50+00:00'),
  ('65bf24cc-d422-5591-aa6a-7300eca613f2', '53aaafec-983b-5593-8524-eb474f944e60', 'working', 3, 10, 42.5, 150, FALSE, '2026-09-09T17:59:30+00:00'),
  ('154114ff-31a9-5017-9ed0-4e336d7a801f', 'a97b4866-cce8-5f3f-8fd5-6658a1c0915e', 'working', 1, 12, 6.0, 150, FALSE, '2026-09-09T18:03:16+00:00'),
  ('d199f0fc-ae73-564d-a1a8-094236a0b807', 'a97b4866-cce8-5f3f-8fd5-6658a1c0915e', 'working', 2, 12, 6.0, 90, FALSE, '2026-09-09T18:06:02+00:00'),
  ('faa3e8d4-1c1d-5ebc-9844-0833d54e5f5d', 'a97b4866-cce8-5f3f-8fd5-6658a1c0915e', 'working', 3, 11, 6.0, 90, FALSE, '2026-09-09T18:08:45+00:00'),
  ('19dbf5d4-fe56-5b2d-ab79-26a4f9008f7a', '8da98371-b8b6-5502-adca-154cee2c57bc', 'working', 1, 12, 8.0, 90, FALSE, '2026-09-09T18:11:31+00:00'),
  ('72b024ba-6d33-5ada-8214-8cd8df171c3a', '8da98371-b8b6-5502-adca-154cee2c57bc', 'working', 2, 12, 8.0, 60, FALSE, '2026-09-09T18:13:47+00:00'),
  ('e042b5a8-bdea-5ed2-97da-8ac127553eae', '8da98371-b8b6-5502-adca-154cee2c57bc', 'working', 3, 10, 8.0, 60, FALSE, '2026-09-09T18:15:57+00:00'),
  ('a118f2a3-bd40-5b30-9dfd-76b55e3712fa', 'f442033b-95a1-5d07-8a2a-7fd6d6c3dfa7', 'working', 1, 12, 22.5, 150, FALSE, '2026-09-09T18:19:43+00:00'),
  ('c246400e-b97f-5bca-89ec-e1626ae573da', 'f442033b-95a1-5d07-8a2a-7fd6d6c3dfa7', 'working', 2, 12, 22.5, 120, FALSE, '2026-09-09T18:22:59+00:00'),
  ('c3e2b193-92fe-52ea-90df-3f1149497b9c', 'f442033b-95a1-5d07-8a2a-7fd6d6c3dfa7', 'working', 3, 12, 22.5, 90, FALSE, '2026-09-09T18:25:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2eb9a2cd-2555-5b03-97d9-89e48ac34b58', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-11T17:12:00+00:00', '2026-09-11T18:07:21+00:00', 3321, 7387.5, FALSE, 68.0, 'gym', 387);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('230296f7-1c04-59bd-8018-cc3ab796fb51', '2eb9a2cd-2555-5b03-97d9-89e48ac34b58', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('aff0e2d8-44c8-5fac-ac0b-ce19be3d0f57', '2eb9a2cd-2555-5b03-97d9-89e48ac34b58', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('d2510238-fbe8-590e-a342-52620267ddd8', '2eb9a2cd-2555-5b03-97d9-89e48ac34b58', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('553c0404-f090-509b-a118-605dd19ebed9', '2eb9a2cd-2555-5b03-97d9-89e48ac34b58', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('53c506f7-f11f-5ca9-8450-9c8f438d4423', '230296f7-1c04-59bd-8018-cc3ab796fb51', 'working', 1, 10, 130.0, 60, FALSE, '2026-09-11T17:19:10+00:00'),
  ('8891c1d7-1bc4-5acb-b2a0-ffe790c84ec6', '230296f7-1c04-59bd-8018-cc3ab796fb51', 'working', 2, 10, 130.0, 120, FALSE, '2026-09-11T17:22:20+00:00'),
  ('a7b78883-a983-5d91-8d06-9cba5457bef0', '230296f7-1c04-59bd-8018-cc3ab796fb51', 'working', 3, 10, 130.0, 90, FALSE, '2026-09-11T17:25:00+00:00'),
  ('1a9db5c4-5559-5c8e-b33c-6bdec2dacbcb', 'aff0e2d8-44c8-5fac-ac0b-ce19be3d0f57', 'working', 1, 10, 65.0, 150, FALSE, '2026-09-11T17:28:40+00:00'),
  ('dc33a62e-3211-5044-a8bd-99df7956f312', 'aff0e2d8-44c8-5fac-ac0b-ce19be3d0f57', 'working', 2, 10, 65.0, 90, FALSE, '2026-09-11T17:31:20+00:00'),
  ('1be29020-9fba-5e15-8c73-d4d96e0c3dde', 'aff0e2d8-44c8-5fac-ac0b-ce19be3d0f57', 'working', 3, 8, 65.0, 90, FALSE, '2026-09-11T17:33:54+00:00'),
  ('1ab8cd58-a2a2-5d19-b989-bbe55d4f9957', 'd2510238-fbe8-590e-a342-52620267ddd8', 'working', 1, 10, 57.5, 90, FALSE, '2026-09-11T17:36:34+00:00'),
  ('80c7a21c-9a8b-51c6-b5cf-682c7c7c5e9b', 'd2510238-fbe8-590e-a342-52620267ddd8', 'working', 2, 10, 57.5, 90, FALSE, '2026-09-11T17:39:14+00:00'),
  ('99308711-7e2d-5649-919c-4c13030ec686', 'd2510238-fbe8-590e-a342-52620267ddd8', 'working', 3, 9, 57.5, 60, FALSE, '2026-09-11T17:41:21+00:00'),
  ('aaf2bf97-334b-59cc-94e4-1fb11f10b5e3', '553c0404-f090-509b-a118-605dd19ebed9', 'working', 1, 100, 0.0, 150, FALSE, '2026-09-11T17:49:31+00:00'),
  ('1395e8c2-62ce-5c2e-ba79-676a2c66c4e8', '553c0404-f090-509b-a118-605dd19ebed9', 'working', 2, 100, 0.0, 90, FALSE, '2026-09-11T17:56:41+00:00'),
  ('d30fb00a-c7cf-56ec-a720-c7a479773fdc', '553c0404-f090-509b-a118-605dd19ebed9', 'working', 3, 100, 0.0, 120, FALSE, '2026-09-11T18:04:21+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('583c1abb-4107-5e9c-941d-4a78007c996f', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-14T17:37:00+00:00', '2026-09-14T18:32:36+00:00', 3336, 7257.5, FALSE, 68.0, 'gym', 392);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('4535719c-5be5-58ab-bb7a-25349cdc459f', '583c1abb-4107-5e9c-941d-4a78007c996f', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1c29ead2-62d9-5a02-ae45-84230315d415', '583c1abb-4107-5e9c-941d-4a78007c996f', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('611d2cb7-64e3-57d4-8041-65c48e67ec7a', '583c1abb-4107-5e9c-941d-4a78007c996f', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('ff04bf67-014e-5f7b-9d4e-b42a7b4c585e', '583c1abb-4107-5e9c-941d-4a78007c996f', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('3e7221fb-8e45-54df-a975-799dd0a61b6d', '4535719c-5be5-58ab-bb7a-25349cdc459f', 'working', 1, 10, 130.0, 120, FALSE, '2026-09-14T17:45:10+00:00'),
  ('9fe18cb8-6b81-5706-bec1-f453e12b11aa', '4535719c-5be5-58ab-bb7a-25349cdc459f', 'working', 2, 10, 130.0, 150, FALSE, '2026-09-14T17:48:50+00:00'),
  ('ed074ad1-38b2-5347-9e84-5ff1052446e1', '4535719c-5be5-58ab-bb7a-25349cdc459f', 'working', 3, 8, 130.0, 90, FALSE, '2026-09-14T17:51:24+00:00'),
  ('a989378d-77e5-5112-91e4-c1d89e4424d2', '1c29ead2-62d9-5a02-ae45-84230315d415', 'working', 1, 10, 65.0, 60, FALSE, '2026-09-14T17:53:34+00:00'),
  ('5f73bc0e-15ab-5a9c-b2ac-5f0a219efa54', '1c29ead2-62d9-5a02-ae45-84230315d415', 'working', 2, 10, 65.0, 60, FALSE, '2026-09-14T17:55:44+00:00'),
  ('245254fd-97e2-5729-b34a-9fa4856c3953', '1c29ead2-62d9-5a02-ae45-84230315d415', 'working', 3, 10, 65.0, 90, FALSE, '2026-09-14T17:58:24+00:00'),
  ('f6db1daf-8d72-5498-b1bd-88bc7963017c', '611d2cb7-64e3-57d4-8041-65c48e67ec7a', 'working', 1, 10, 57.5, 90, FALSE, '2026-09-14T18:01:04+00:00'),
  ('4e83caf3-906a-51f1-89ef-7b4ecac465a1', '611d2cb7-64e3-57d4-8041-65c48e67ec7a', 'working', 2, 10, 57.5, 150, FALSE, '2026-09-14T18:04:44+00:00'),
  ('10b6f202-6958-51af-86f8-ddfaad45070d', '611d2cb7-64e3-57d4-8041-65c48e67ec7a', 'working', 3, 9, 57.5, 90, FALSE, '2026-09-14T18:07:21+00:00'),
  ('8a71d79a-9df4-5ff0-9d31-1a0a21afe3aa', 'ff04bf67-014e-5f7b-9d4e-b42a7b4c585e', 'working', 1, 100, 0.0, 150, FALSE, '2026-09-14T18:15:31+00:00'),
  ('aba9123b-0ed0-5096-bb21-a5962cc25870', 'ff04bf67-014e-5f7b-9d4e-b42a7b4c585e', 'working', 2, 100, 0.0, 90, FALSE, '2026-09-14T18:22:41+00:00'),
  ('1d501795-456c-55b5-8821-e99ffd4b392e', 'ff04bf67-014e-5f7b-9d4e-b42a7b4c585e', 'working', 3, 105, 0.0, 60, FALSE, '2026-09-14T18:29:36+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('e729d7fd-9572-527f-a7d3-e839561132c1', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-09-16T17:00:00+00:00', '2026-09-16T17:52:09+00:00', 3129, 3277.0, FALSE, 68.0, 'gym', 163);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('eb92af2e-1b61-5161-950f-c27d7461ea01', 'e729d7fd-9572-527f-a7d3-e839561132c1', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('5d731be9-f4fb-5e5e-8207-d70bd9acb179', 'e729d7fd-9572-527f-a7d3-e839561132c1', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('b3d99694-085f-5be8-8f17-9c26aeac0b18', 'e729d7fd-9572-527f-a7d3-e839561132c1', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('7870603a-4e71-5a2c-b5ec-b33688978480', 'e729d7fd-9572-527f-a7d3-e839561132c1', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('52877b7b-9423-51cc-8fdc-65b35ef3b3a1', 'e729d7fd-9572-527f-a7d3-e839561132c1', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1a90359b-34d4-527e-bc21-2a4c7d8a09c4', 'eb92af2e-1b61-5161-950f-c27d7461ea01', 'working', 1, 10, 20.0, 90, FALSE, '2026-09-16T17:07:40+00:00'),
  ('74e0c202-ac9a-5b88-ab31-4e3ee9f79d51', 'eb92af2e-1b61-5161-950f-c27d7461ea01', 'working', 2, 10, 20.0, 120, FALSE, '2026-09-16T17:10:50+00:00'),
  ('9fcd300d-9a22-571b-bd1f-13e618ed67e9', 'eb92af2e-1b61-5161-950f-c27d7461ea01', 'working', 3, 10, 20.0, 90, FALSE, '2026-09-16T17:13:30+00:00'),
  ('75785064-62fb-5a47-9abc-be2f41db0103', '5d731be9-f4fb-5e5e-8207-d70bd9acb179', 'working', 1, 10, 45.0, 90, FALSE, '2026-09-16T17:16:10+00:00'),
  ('d681a31d-19a0-51cc-8f68-fbf4cf4a4cbb', '5d731be9-f4fb-5e5e-8207-d70bd9acb179', 'working', 2, 10, 45.0, 150, FALSE, '2026-09-16T17:19:50+00:00'),
  ('3644ce19-55b6-5abe-afa8-b2a3cb8a6a22', '5d731be9-f4fb-5e5e-8207-d70bd9acb179', 'working', 3, 8, 45.0, 120, FALSE, '2026-09-16T17:22:54+00:00'),
  ('ca6fab28-d6d2-5071-b236-a4c7f586495b', 'b3d99694-085f-5be8-8f17-9c26aeac0b18', 'working', 1, 12, 7.0, 120, FALSE, '2026-09-16T17:26:10+00:00'),
  ('e2f740e4-c958-5d9d-839c-6f8cc99b6dca', 'b3d99694-085f-5be8-8f17-9c26aeac0b18', 'working', 2, 12, 7.0, 150, FALSE, '2026-09-16T17:29:56+00:00'),
  ('bd3c7a22-feab-5a8c-880a-a0f71f2e5def', 'b3d99694-085f-5be8-8f17-9c26aeac0b18', 'working', 3, 12, 7.0, 90, FALSE, '2026-09-16T17:32:42+00:00'),
  ('7b598f5e-3772-53f3-ba7c-c1aac86ba48b', '7870603a-4e71-5a2c-b5ec-b33688978480', 'working', 1, 12, 9.0, 60, FALSE, '2026-09-16T17:34:58+00:00'),
  ('97bdea56-3d26-5741-b82e-ee4e8ed456dd', '7870603a-4e71-5a2c-b5ec-b33688978480', 'working', 2, 12, 9.0, 150, FALSE, '2026-09-16T17:38:44+00:00'),
  ('f9cc1129-fa07-5628-90c3-aed182a197a3', '7870603a-4e71-5a2c-b5ec-b33688978480', 'working', 3, 11, 9.0, 90, FALSE, '2026-09-16T17:41:27+00:00'),
  ('b913da04-8c65-5ab4-aa3d-05c9d3fd90be', '52877b7b-9423-51cc-8fdc-65b35ef3b3a1', 'working', 1, 12, 25.0, 90, FALSE, '2026-09-16T17:44:13+00:00'),
  ('ceef8f9e-4ba3-5e75-80b4-5b7192c3ffd9', '52877b7b-9423-51cc-8fdc-65b35ef3b3a1', 'working', 2, 12, 25.0, 90, FALSE, '2026-09-16T17:46:59+00:00'),
  ('e1f5538a-963e-508f-9900-0a820a2ed99e', '52877b7b-9423-51cc-8fdc-65b35ef3b3a1', 'working', 3, 10, 25.0, 60, FALSE, '2026-09-16T17:49:09+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('897bfac8-aa73-5e29-990a-01e1283d3ed5', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-18T17:04:00+00:00', '2026-09-18T18:00:30+00:00', 3390, 7875.0, FALSE, 68.0, 'gym', 400);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('50b77d39-8479-5e79-9977-af48f2086162', '897bfac8-aa73-5e29-990a-01e1283d3ed5', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('8b269914-82c6-57c4-af62-ec41a5d378c7', '897bfac8-aa73-5e29-990a-01e1283d3ed5', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('c065a083-f0c6-5f58-b593-a42ac299283a', '897bfac8-aa73-5e29-990a-01e1283d3ed5', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('c1cad057-e7dc-592a-81ed-99d1cba4bd12', '897bfac8-aa73-5e29-990a-01e1283d3ed5', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('7810aced-cff7-5d03-bbd7-92343cf50a93', '50b77d39-8479-5e79-9977-af48f2086162', 'working', 1, 10, 135.0, 120, FALSE, '2026-09-18T17:12:10+00:00'),
  ('03892041-510b-5c3a-a809-abc8c2a890fb', '50b77d39-8479-5e79-9977-af48f2086162', 'working', 2, 10, 135.0, 90, FALSE, '2026-09-18T17:14:50+00:00'),
  ('0c1f8c15-bd71-584b-ad83-5d7a98adf127', '50b77d39-8479-5e79-9977-af48f2086162', 'working', 3, 10, 135.0, 90, FALSE, '2026-09-18T17:17:30+00:00'),
  ('bc28f0e8-ccf7-58ad-8343-a7de322e38b0', '8b269914-82c6-57c4-af62-ec41a5d378c7', 'working', 1, 10, 67.5, 60, FALSE, '2026-09-18T17:19:40+00:00'),
  ('5ef305c6-2e7b-57dc-b244-120c2a83a718', '8b269914-82c6-57c4-af62-ec41a5d378c7', 'working', 2, 10, 67.5, 90, FALSE, '2026-09-18T17:22:20+00:00'),
  ('ef5744c4-e008-53f6-8a7e-d944fd0332b3', '8b269914-82c6-57c4-af62-ec41a5d378c7', 'working', 3, 10, 67.5, 120, FALSE, '2026-09-18T17:25:30+00:00'),
  ('f7df6b41-e565-5602-bf45-d8d6cde2aa9e', 'c065a083-f0c6-5f58-b593-a42ac299283a', 'working', 1, 10, 60.0, 120, FALSE, '2026-09-18T17:28:40+00:00'),
  ('60be4f37-ebe3-5877-a943-d75c9a1dbf76', 'c065a083-f0c6-5f58-b593-a42ac299283a', 'working', 2, 10, 60.0, 120, FALSE, '2026-09-18T17:31:50+00:00'),
  ('4428395c-577f-5ed7-9394-e3eb769048a1', 'c065a083-f0c6-5f58-b593-a42ac299283a', 'working', 3, 10, 60.0, 150, FALSE, '2026-09-18T17:35:30+00:00'),
  ('ba4d1b2a-5066-5aa3-977a-2e02d3847d00', 'c1cad057-e7dc-592a-81ed-99d1cba4bd12', 'working', 1, 105, 0.0, 90, FALSE, '2026-09-18T17:42:55+00:00'),
  ('1e414b00-19ad-5d06-aa5a-cb30b8ac30e9', 'c1cad057-e7dc-592a-81ed-99d1cba4bd12', 'working', 2, 100, 0.0, 90, FALSE, '2026-09-18T17:50:05+00:00'),
  ('7b2ed41c-87c6-5203-8d00-c01d61d8ebea', 'c1cad057-e7dc-592a-81ed-99d1cba4bd12', 'working', 3, 105, 0.0, 90, FALSE, '2026-09-18T17:57:30+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('f141f22a-ba8d-538c-8b1b-9679d499df8a', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-21T17:30:00+00:00', '2026-09-21T18:26:57+00:00', 3417, 7815.0, FALSE, 68.0, 'gym', 399);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('7db51d5e-5a8f-559d-8b4d-3457688ca0d3', 'f141f22a-ba8d-538c-8b1b-9679d499df8a', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f9961c12-7b71-5979-adb5-a4b045aab617', 'f141f22a-ba8d-538c-8b1b-9679d499df8a', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('ae21ec77-41f5-5601-ae9d-a55232e1840f', 'f141f22a-ba8d-538c-8b1b-9679d499df8a', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('a2198abc-b559-5e2a-a853-68ab85e0e594', 'f141f22a-ba8d-538c-8b1b-9679d499df8a', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d4e41175-2295-52d8-8bc4-8c29f8c1a064', '7db51d5e-5a8f-559d-8b4d-3457688ca0d3', 'working', 1, 10, 135.0, 90, FALSE, '2026-09-21T17:37:40+00:00'),
  ('5e3b8497-b965-57b9-bd2a-827208d8a00c', '7db51d5e-5a8f-559d-8b4d-3457688ca0d3', 'working', 2, 10, 135.0, 90, FALSE, '2026-09-21T17:40:20+00:00'),
  ('4fc789f8-29f1-5b9f-8d82-c225b68bf9ac', '7db51d5e-5a8f-559d-8b4d-3457688ca0d3', 'working', 3, 10, 135.0, 90, FALSE, '2026-09-21T17:43:00+00:00'),
  ('fd08e9e6-747a-5fbb-b30d-c4352202f2c9', 'f9961c12-7b71-5979-adb5-a4b045aab617', 'working', 1, 10, 67.5, 120, FALSE, '2026-09-21T17:46:10+00:00'),
  ('72c929b7-a74b-594e-b9d5-19bbc2cf8022', 'f9961c12-7b71-5979-adb5-a4b045aab617', 'working', 2, 10, 67.5, 90, FALSE, '2026-09-21T17:48:50+00:00'),
  ('bc009452-db9b-50f0-90bc-34a79a11316d', 'f9961c12-7b71-5979-adb5-a4b045aab617', 'working', 3, 10, 67.5, 60, FALSE, '2026-09-21T17:51:00+00:00'),
  ('18ecab8e-4a0d-5ee6-8bc7-4a71e9876a5b', 'ae21ec77-41f5-5601-ae9d-a55232e1840f', 'working', 1, 10, 60.0, 150, FALSE, '2026-09-21T17:54:40+00:00'),
  ('4c949c3c-8afd-592a-9f1a-b66e38443453', 'ae21ec77-41f5-5601-ae9d-a55232e1840f', 'working', 2, 10, 60.0, 120, FALSE, '2026-09-21T17:57:50+00:00'),
  ('312cfd98-b61a-5457-a6cc-f3a10aaffff3', 'ae21ec77-41f5-5601-ae9d-a55232e1840f', 'working', 3, 9, 60.0, 120, FALSE, '2026-09-21T18:00:57+00:00'),
  ('e2c55afc-c8a1-5c2a-b00f-68dc85cd04d3', 'a2198abc-b559-5e2a-a853-68ab85e0e594', 'working', 1, 105, 0.0, 120, FALSE, '2026-09-21T18:08:52+00:00'),
  ('75668d4d-996c-543f-8113-d9393d831d6c', 'a2198abc-b559-5e2a-a853-68ab85e0e594', 'working', 2, 105, 0.0, 90, FALSE, '2026-09-21T18:16:17+00:00'),
  ('664f3870-a0e7-5778-b2c0-a2e114913b11', 'a2198abc-b559-5e2a-a853-68ab85e0e594', 'working', 3, 100, 0.0, 120, FALSE, '2026-09-21T18:23:57+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('4fa133bb-4213-5e51-aa0d-3527e0fc69ac', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-09-23T17:14:00+00:00', '2026-09-23T18:05:24+00:00', 3084, 3426.0, FALSE, 68.0, 'gym', 168);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('0214d603-1ad0-5ee5-b7b9-b3dc2a8d3716', '4fa133bb-4213-5e51-aa0d-3527e0fc69ac', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('d2b2d581-8d51-5df0-9e3d-d2427084a3cc', '4fa133bb-4213-5e51-aa0d-3527e0fc69ac', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('d7844396-1c18-530f-90af-25a1bd9befc9', '4fa133bb-4213-5e51-aa0d-3527e0fc69ac', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('ac19a6c3-b559-583b-9028-a86861b2f37c', '4fa133bb-4213-5e51-aa0d-3527e0fc69ac', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('56df3bf8-e5e8-541b-a0c3-a5e9489c8208', '4fa133bb-4213-5e51-aa0d-3527e0fc69ac', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d89e91c7-cacb-5375-bcb3-c164787ffebc', '0214d603-1ad0-5ee5-b7b9-b3dc2a8d3716', 'working', 1, 10, 20.0, 90, FALSE, '2026-09-23T17:21:40+00:00'),
  ('bee34423-9c22-5dfe-8952-1377b6b8ab77', '0214d603-1ad0-5ee5-b7b9-b3dc2a8d3716', 'working', 2, 10, 20.0, 90, FALSE, '2026-09-23T17:24:20+00:00'),
  ('bb3a89ca-3bc8-5efd-9dca-31f21b2cec0a', '0214d603-1ad0-5ee5-b7b9-b3dc2a8d3716', 'working', 3, 10, 20.0, 60, FALSE, '2026-09-23T17:26:30+00:00'),
  ('7843d01e-b730-5267-bb2b-0a62efc67734', 'd2b2d581-8d51-5df0-9e3d-d2427084a3cc', 'working', 1, 10, 45.0, 60, FALSE, '2026-09-23T17:28:40+00:00'),
  ('eb443117-83b7-59b0-a291-8c18740b5082', 'd2b2d581-8d51-5df0-9e3d-d2427084a3cc', 'working', 2, 10, 45.0, 90, FALSE, '2026-09-23T17:31:20+00:00'),
  ('fd0a463f-2f8c-56c5-8f48-c750acf6e108', 'd2b2d581-8d51-5df0-9e3d-d2427084a3cc', 'working', 3, 10, 45.0, 60, FALSE, '2026-09-23T17:33:30+00:00'),
  ('480cf707-9b58-5bf8-9b86-77e652fe3fcd', 'd7844396-1c18-530f-90af-25a1bd9befc9', 'working', 1, 12, 7.0, 150, FALSE, '2026-09-23T17:37:16+00:00'),
  ('2d586f43-037a-56eb-ba64-8267df68415d', 'd7844396-1c18-530f-90af-25a1bd9befc9', 'working', 2, 12, 7.0, 90, FALSE, '2026-09-23T17:40:02+00:00'),
  ('4f327b1d-1527-513b-849b-40b58d45cc31', 'd7844396-1c18-530f-90af-25a1bd9befc9', 'working', 3, 12, 7.0, 120, FALSE, '2026-09-23T17:43:18+00:00'),
  ('0ad2ab6b-3823-5245-b5b7-9c660ebb6b95', 'ac19a6c3-b559-583b-9028-a86861b2f37c', 'working', 1, 12, 9.0, 90, FALSE, '2026-09-23T17:46:04+00:00'),
  ('cf9ab47a-d6a0-599d-ac40-2fbb9c77877c', 'ac19a6c3-b559-583b-9028-a86861b2f37c', 'working', 2, 12, 9.0, 150, FALSE, '2026-09-23T17:49:50+00:00'),
  ('e24176e9-f62d-5e71-85d6-e7031d218b54', 'ac19a6c3-b559-583b-9028-a86861b2f37c', 'working', 3, 12, 9.0, 150, FALSE, '2026-09-23T17:53:36+00:00'),
  ('ef0e3208-a504-5087-9864-20203b615659', '56df3bf8-e5e8-541b-a0c3-a5e9489c8208', 'working', 1, 12, 25.0, 150, FALSE, '2026-09-23T17:57:22+00:00'),
  ('fee83fd9-797f-5c6c-9640-32b24442a445', '56df3bf8-e5e8-541b-a0c3-a5e9489c8208', 'working', 2, 12, 25.0, 90, FALSE, '2026-09-23T18:00:08+00:00'),
  ('97bd4dfd-795f-5eb3-8e56-92aa8a760619', '56df3bf8-e5e8-541b-a0c3-a5e9489c8208', 'working', 3, 12, 25.0, 60, FALSE, '2026-09-23T18:02:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('016bab12-95f5-5dfd-afa0-5f5c9fdddb61', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-25T17:03:00+00:00', '2026-09-25T17:59:45+00:00', 3405, 8100.0, FALSE, 68.0, 'gym', 415);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('0b9028e8-4f74-5448-8441-e767e8f450b1', '016bab12-95f5-5dfd-afa0-5f5c9fdddb61', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a4407413-38f4-52e2-b9e3-5e39e591a197', '016bab12-95f5-5dfd-afa0-5f5c9fdddb61', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('d36eec8d-f953-5081-ae60-98c7ae5b4b20', '016bab12-95f5-5dfd-afa0-5f5c9fdddb61', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('233f192a-52bb-5400-a355-60290b4feda4', '016bab12-95f5-5dfd-afa0-5f5c9fdddb61', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8360ba6b-0e9e-54e2-86bf-da835b8c9294', '0b9028e8-4f74-5448-8441-e767e8f450b1', 'working', 1, 10, 140.0, 60, FALSE, '2026-09-25T17:10:10+00:00'),
  ('4b0f4ca6-5429-51fb-9267-0530ebb2eab9', '0b9028e8-4f74-5448-8441-e767e8f450b1', 'working', 2, 10, 140.0, 90, FALSE, '2026-09-25T17:12:50+00:00'),
  ('931c0943-1ae7-52ee-a299-8cb25af38791', '0b9028e8-4f74-5448-8441-e767e8f450b1', 'working', 3, 10, 140.0, 90, FALSE, '2026-09-25T17:15:30+00:00'),
  ('9ade7587-d2c1-5c27-981c-0c996c6a08ea', 'a4407413-38f4-52e2-b9e3-5e39e591a197', 'working', 1, 10, 70.0, 60, FALSE, '2026-09-25T17:17:40+00:00'),
  ('2a9c4467-fded-55ac-9927-cab7515b1fb5', 'a4407413-38f4-52e2-b9e3-5e39e591a197', 'working', 2, 10, 70.0, 150, FALSE, '2026-09-25T17:21:20+00:00'),
  ('b91bd347-6e75-5895-95e7-0fb09f3dc726', 'a4407413-38f4-52e2-b9e3-5e39e591a197', 'working', 3, 10, 70.0, 120, FALSE, '2026-09-25T17:24:30+00:00'),
  ('d7ee727d-781d-5914-bf15-77bb90a5face', 'd36eec8d-f953-5081-ae60-98c7ae5b4b20', 'working', 1, 10, 60.0, 90, FALSE, '2026-09-25T17:27:10+00:00'),
  ('528b7797-b8f2-51ff-962c-a8de9804f35e', 'd36eec8d-f953-5081-ae60-98c7ae5b4b20', 'working', 2, 10, 60.0, 90, FALSE, '2026-09-25T17:29:50+00:00'),
  ('6b87d957-01ed-59a6-a57b-fcfbb8f9c490', 'd36eec8d-f953-5081-ae60-98c7ae5b4b20', 'working', 3, 10, 60.0, 120, FALSE, '2026-09-25T17:33:00+00:00'),
  ('f99aa513-7f60-5f52-bd79-dd4c9c1090ac', '233f192a-52bb-5400-a355-60290b4feda4', 'working', 1, 110, 0.0, 120, FALSE, '2026-09-25T17:41:10+00:00'),
  ('169b6805-c43f-558b-96a1-6e69af1cbe7a', '233f192a-52bb-5400-a355-60290b4feda4', 'working', 2, 105, 0.0, 120, FALSE, '2026-09-25T17:49:05+00:00'),
  ('f0044444-bee5-57fa-a0e3-f6c2e5e911b2', '233f192a-52bb-5400-a355-60290b4feda4', 'working', 3, 110, 0.0, 90, FALSE, '2026-09-25T17:56:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('556ca9e7-8cd4-55e2-a626-3fe6ea5b5bb9', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-09-28T17:23:00+00:00', '2026-09-28T18:22:15+00:00', 3555, 8175.0, FALSE, 68.0, 'gym', 415);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2dcf6daa-6a22-506e-8b34-a276e9129a0a', '556ca9e7-8cd4-55e2-a626-3fe6ea5b5bb9', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f9e0dcee-0063-5da0-9ef9-d1710a91d3e5', '556ca9e7-8cd4-55e2-a626-3fe6ea5b5bb9', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('aa761cd7-01d2-5393-a4fc-34680cb83f79', '556ca9e7-8cd4-55e2-a626-3fe6ea5b5bb9', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('14bba782-9b39-5c6e-a6d9-c95117236e66', '556ca9e7-8cd4-55e2-a626-3fe6ea5b5bb9', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('63e1f8c7-0ec6-59b3-acb1-2d30df437664', '2dcf6daa-6a22-506e-8b34-a276e9129a0a', 'working', 1, 10, 140.0, 150, FALSE, '2026-09-28T17:31:40+00:00'),
  ('daaee4b9-1636-52c5-8271-71ea074db383', '2dcf6daa-6a22-506e-8b34-a276e9129a0a', 'working', 2, 10, 140.0, 120, FALSE, '2026-09-28T17:34:50+00:00'),
  ('a61c1673-ff9e-5221-af96-d05235525eaf', '2dcf6daa-6a22-506e-8b34-a276e9129a0a', 'working', 3, 10, 140.0, 150, FALSE, '2026-09-28T17:38:30+00:00'),
  ('b25d8655-f135-5667-9b9a-ed684d49a1a4', 'f9e0dcee-0063-5da0-9ef9-d1710a91d3e5', 'working', 1, 10, 70.0, 60, FALSE, '2026-09-28T17:40:40+00:00'),
  ('a51210a1-dbce-596c-92f2-8aa1ecc96989', 'f9e0dcee-0063-5da0-9ef9-d1710a91d3e5', 'working', 2, 10, 70.0, 120, FALSE, '2026-09-28T17:43:50+00:00'),
  ('859ee072-c93d-591f-b4e4-aad165773b0c', 'f9e0dcee-0063-5da0-9ef9-d1710a91d3e5', 'working', 3, 10, 70.0, 150, FALSE, '2026-09-28T17:47:30+00:00'),
  ('1eb8ef86-3f02-5e49-b687-7fb6e235362f', 'aa761cd7-01d2-5393-a4fc-34680cb83f79', 'working', 1, 10, 62.5, 150, FALSE, '2026-09-28T17:51:10+00:00'),
  ('f5168497-5bfc-59f5-9793-be941026e63f', 'aa761cd7-01d2-5393-a4fc-34680cb83f79', 'working', 2, 10, 62.5, 150, FALSE, '2026-09-28T17:54:50+00:00'),
  ('66a98db5-f051-57ef-88b7-e1dbb80297e0', 'aa761cd7-01d2-5393-a4fc-34680cb83f79', 'working', 3, 10, 62.5, 90, FALSE, '2026-09-28T17:57:30+00:00'),
  ('7dbd28e8-2825-5353-90af-a2e459252850', '14bba782-9b39-5c6e-a6d9-c95117236e66', 'working', 1, 110, 0.0, 60, FALSE, '2026-09-28T18:04:40+00:00'),
  ('db5632ac-ff3d-5195-9e5d-87127649571d', '14bba782-9b39-5c6e-a6d9-c95117236e66', 'working', 2, 110, 0.0, 60, FALSE, '2026-09-28T18:11:50+00:00'),
  ('efdbfcef-3e02-53b3-808e-1d01b7dc9dde', '14bba782-9b39-5c6e-a6d9-c95117236e66', 'working', 3, 105, 0.0, 90, FALSE, '2026-09-28T18:19:15+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c914bd60-fbee-51a0-a5e8-6e940a7e3f22', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-09-30T17:06:00+00:00', '2026-09-30T17:58:09+00:00', 3129, 3415.0, FALSE, 68.0, 'gym', 163);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('786be27c-3651-5731-a1d9-8f8acf5e6e92', 'c914bd60-fbee-51a0-a5e8-6e940a7e3f22', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('6ea60e49-ecef-54bc-aef4-2a9e5b58cdfe', 'c914bd60-fbee-51a0-a5e8-6e940a7e3f22', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('4d45ff59-7ae4-5327-b93d-059e1e87c644', 'c914bd60-fbee-51a0-a5e8-6e940a7e3f22', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('4b54715e-db35-5ed6-a862-5ee89b000e17', 'c914bd60-fbee-51a0-a5e8-6e940a7e3f22', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('485df1d5-ef0d-5715-911e-fab0377a56ee', 'c914bd60-fbee-51a0-a5e8-6e940a7e3f22', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('21b801d8-198c-5c81-8f63-9ef8ba8fc77e', '786be27c-3651-5731-a1d9-8f8acf5e6e92', 'working', 1, 10, 20.0, 60, FALSE, '2026-09-30T17:13:10+00:00'),
  ('b4d75730-887e-5957-b2a5-29236a5c54a1', '786be27c-3651-5731-a1d9-8f8acf5e6e92', 'working', 2, 10, 20.0, 120, FALSE, '2026-09-30T17:16:20+00:00'),
  ('728499cd-5e90-5841-bbf1-3a09930e6c05', '786be27c-3651-5731-a1d9-8f8acf5e6e92', 'working', 3, 9, 20.0, 120, FALSE, '2026-09-30T17:19:27+00:00'),
  ('55f4e211-adf8-57c6-a1bd-3f6120ac5b3a', '6ea60e49-ecef-54bc-aef4-2a9e5b58cdfe', 'working', 1, 10, 47.5, 120, FALSE, '2026-09-30T17:22:37+00:00'),
  ('07946433-ad38-5271-8586-6af3a060cc7b', '6ea60e49-ecef-54bc-aef4-2a9e5b58cdfe', 'working', 2, 10, 47.5, 90, FALSE, '2026-09-30T17:25:17+00:00'),
  ('9dc72b02-b87e-54cd-807f-f18e2b410f14', '6ea60e49-ecef-54bc-aef4-2a9e5b58cdfe', 'working', 3, 10, 47.5, 90, FALSE, '2026-09-30T17:27:57+00:00'),
  ('670c5aec-e843-5fd7-939f-f465a87c6c53', '4d45ff59-7ae4-5327-b93d-059e1e87c644', 'working', 1, 12, 7.0, 120, FALSE, '2026-09-30T17:31:13+00:00'),
  ('f872b5c7-eb0e-5f64-970b-c62ba7140c5a', '4d45ff59-7ae4-5327-b93d-059e1e87c644', 'working', 2, 12, 7.0, 90, FALSE, '2026-09-30T17:33:59+00:00'),
  ('86d4a223-1012-5930-84b1-6596529a184e', '4d45ff59-7ae4-5327-b93d-059e1e87c644', 'working', 3, 11, 7.0, 90, FALSE, '2026-09-30T17:36:42+00:00'),
  ('91ddbcee-961f-5492-a7e1-bb0e644e6f14', '4b54715e-db35-5ed6-a862-5ee89b000e17', 'working', 1, 12, 9.0, 120, FALSE, '2026-09-30T17:39:58+00:00'),
  ('4f8ebb33-9d0a-5bf4-a7b0-fa5bd1116d40', '4b54715e-db35-5ed6-a862-5ee89b000e17', 'working', 2, 12, 9.0, 90, FALSE, '2026-09-30T17:42:44+00:00'),
  ('7bb81107-f4ef-55d7-ae54-68082aed2988', '4b54715e-db35-5ed6-a862-5ee89b000e17', 'working', 3, 11, 9.0, 150, FALSE, '2026-09-30T17:46:27+00:00'),
  ('4fd2a708-bca5-5552-bf71-1d0f1866db7f', '485df1d5-ef0d-5715-911e-fab0377a56ee', 'working', 1, 12, 25.0, 90, FALSE, '2026-09-30T17:49:13+00:00'),
  ('46afb679-8e83-5496-b86c-49671b6ccc32', '485df1d5-ef0d-5715-911e-fab0377a56ee', 'working', 2, 12, 25.0, 90, FALSE, '2026-09-30T17:51:59+00:00'),
  ('e3b4c2fd-42b6-5853-a648-b245b9830868', '485df1d5-ef0d-5715-911e-fab0377a56ee', 'working', 3, 10, 25.0, 120, FALSE, '2026-09-30T17:55:09+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2334bc01-f266-5cd4-a87e-2c21328e2ffd', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-02T17:35:00+00:00', '2026-10-02T18:34:00+00:00', 3540, 8400.0, FALSE, 68.0, 'gym', 440);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('6052b751-578b-5fc7-a129-6a0dc9efa8e2', '2334bc01-f266-5cd4-a87e-2c21328e2ffd', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('90ff0528-ec75-558e-b517-0351225ec765', '2334bc01-f266-5cd4-a87e-2c21328e2ffd', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('3829324c-9abe-5958-b53b-f0ca34a6010a', '2334bc01-f266-5cd4-a87e-2c21328e2ffd', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('a8ff967f-3173-5fcd-95ba-fd90d7b81246', '2334bc01-f266-5cd4-a87e-2c21328e2ffd', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('71139408-1830-505f-8047-9ae93dec66c1', '6052b751-578b-5fc7-a129-6a0dc9efa8e2', 'working', 1, 10, 145.0, 150, FALSE, '2026-10-02T17:43:40+00:00'),
  ('44347bfe-f0d0-56e8-b5f4-65ddaabd5c03', '6052b751-578b-5fc7-a129-6a0dc9efa8e2', 'working', 2, 10, 145.0, 120, FALSE, '2026-10-02T17:46:50+00:00'),
  ('913206d7-be42-565d-93c8-05da601be024', '6052b751-578b-5fc7-a129-6a0dc9efa8e2', 'working', 3, 10, 145.0, 120, FALSE, '2026-10-02T17:50:00+00:00'),
  ('9ec749a2-5dc4-5208-aec0-d44f35f90262', '90ff0528-ec75-558e-b517-0351225ec765', 'working', 1, 10, 72.5, 60, FALSE, '2026-10-02T17:52:10+00:00'),
  ('f7f07294-df47-54cf-b15a-60fd526ab62c', '90ff0528-ec75-558e-b517-0351225ec765', 'working', 2, 10, 72.5, 60, FALSE, '2026-10-02T17:54:20+00:00'),
  ('f6528a90-f169-5913-b1b1-26d53cca1d2e', '90ff0528-ec75-558e-b517-0351225ec765', 'working', 3, 10, 72.5, 120, FALSE, '2026-10-02T17:57:30+00:00'),
  ('b83d2bbf-12f4-5979-9ed8-a200dade9604', '3829324c-9abe-5958-b53b-f0ca34a6010a', 'working', 1, 10, 62.5, 60, FALSE, '2026-10-02T17:59:40+00:00'),
  ('fbf07ce3-2275-51bd-bc4e-738acbd5404b', '3829324c-9abe-5958-b53b-f0ca34a6010a', 'working', 2, 10, 62.5, 150, FALSE, '2026-10-02T18:03:20+00:00'),
  ('de5718b2-a061-581d-bd8f-cdd214a7194f', '3829324c-9abe-5958-b53b-f0ca34a6010a', 'working', 3, 10, 62.5, 120, FALSE, '2026-10-02T18:06:30+00:00'),
  ('ffe7704e-e0b5-5625-9bac-6b7f71b3783d', 'a8ff967f-3173-5fcd-95ba-fd90d7b81246', 'working', 1, 120, 0.0, 60, FALSE, '2026-10-02T18:14:10+00:00'),
  ('23e13367-c069-5e54-8166-55953378c5ce', 'a8ff967f-3173-5fcd-95ba-fd90d7b81246', 'working', 2, 120, 0.0, 150, FALSE, '2026-10-02T18:23:20+00:00'),
  ('9ebf838c-30e3-5f78-b950-b18eb2b465c6', 'a8ff967f-3173-5fcd-95ba-fd90d7b81246', 'working', 3, 110, 0.0, 90, FALSE, '2026-10-02T18:31:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('37bc837c-94f6-5f3a-8164-6b4deeafb322', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-05T17:05:00+00:00', '2026-10-05T18:05:21+00:00', 3621, 8110.0, FALSE, 68.0, 'gym', 427);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e69974aa-a2d1-58e1-9bee-87a22f830a8a', '37bc837c-94f6-5f3a-8164-6b4deeafb322', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('d6f8be67-bceb-57e9-885a-f6903d191581', '37bc837c-94f6-5f3a-8164-6b4deeafb322', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('80d692eb-8014-541c-95f2-7d3ef3a1c90f', '37bc837c-94f6-5f3a-8164-6b4deeafb322', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('2f95a28b-f51b-585f-96cb-75e5327354e3', '37bc837c-94f6-5f3a-8164-6b4deeafb322', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2e8d2ac2-5476-56d0-860d-016689c7e0b6', 'e69974aa-a2d1-58e1-9bee-87a22f830a8a', 'working', 1, 10, 145.0, 90, FALSE, '2026-10-05T17:12:40+00:00'),
  ('e49933f5-fa2b-5725-80e3-9e1e229ba364', 'e69974aa-a2d1-58e1-9bee-87a22f830a8a', 'working', 2, 10, 145.0, 150, FALSE, '2026-10-05T17:16:20+00:00'),
  ('bf97c089-3e01-50bd-9c6c-7cbefc75700a', 'e69974aa-a2d1-58e1-9bee-87a22f830a8a', 'working', 3, 9, 145.0, 90, FALSE, '2026-10-05T17:18:57+00:00'),
  ('db056fa6-8562-556c-93b7-efdb91a64d4d', 'd6f8be67-bceb-57e9-885a-f6903d191581', 'working', 1, 10, 72.5, 90, FALSE, '2026-10-05T17:21:37+00:00'),
  ('88228ea8-8f05-5dd0-8384-4fdc25e1afe8', 'd6f8be67-bceb-57e9-885a-f6903d191581', 'working', 2, 10, 72.5, 90, FALSE, '2026-10-05T17:24:17+00:00'),
  ('ed30fa53-732c-5e12-ab3a-b4890f441d9f', 'd6f8be67-bceb-57e9-885a-f6903d191581', 'working', 3, 8, 72.5, 150, FALSE, '2026-10-05T17:27:51+00:00'),
  ('9a94afa0-1fa7-5fb7-ac96-a9b5abbc59f1', '80d692eb-8014-541c-95f2-7d3ef3a1c90f', 'working', 1, 10, 62.5, 120, FALSE, '2026-10-05T17:31:01+00:00'),
  ('efb12df2-cec3-5d0f-b0fb-59f971048374', '80d692eb-8014-541c-95f2-7d3ef3a1c90f', 'working', 2, 10, 62.5, 90, FALSE, '2026-10-05T17:33:41+00:00'),
  ('993e82aa-0a8c-54b3-bae1-b2e8b7161e8d', '80d692eb-8014-541c-95f2-7d3ef3a1c90f', 'working', 3, 10, 62.5, 150, FALSE, '2026-10-05T17:37:21+00:00'),
  ('ba94eb9f-a14f-519b-8400-def1dded394a', '2f95a28b-f51b-585f-96cb-75e5327354e3', 'working', 1, 110, 0.0, 150, FALSE, '2026-10-05T17:46:01+00:00'),
  ('732e6c23-bdb3-5522-96a9-fcb9266bc2f9', '2f95a28b-f51b-585f-96cb-75e5327354e3', 'working', 2, 115, 0.0, 120, FALSE, '2026-10-05T17:54:26+00:00'),
  ('abd1bc37-1dea-50fc-bbe8-937d4d88c2fa', '2f95a28b-f51b-585f-96cb-75e5327354e3', 'working', 3, 115, 0.0, 90, FALSE, '2026-10-05T18:02:21+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('5a27c305-d107-57cc-bc22-b878209e590d', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-10-07T17:15:00+00:00', '2026-10-07T18:08:42+00:00', 3222, 3552.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('f5c71c2f-1831-53e4-9fab-0dfb9c6e90c9', '5a27c305-d107-57cc-bc22-b878209e590d', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('b54bf2a7-e004-5d92-9b2c-4da454daec21', '5a27c305-d107-57cc-bc22-b878209e590d', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('c5aae5e0-49a9-55f4-8ee3-22198ea5b608', '5a27c305-d107-57cc-bc22-b878209e590d', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('119e83b6-ade7-5643-8095-d7d477ff1a31', '5a27c305-d107-57cc-bc22-b878209e590d', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('8426e247-9a46-5fda-b5af-cfe92c8e6e01', '5a27c305-d107-57cc-bc22-b878209e590d', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('534cc981-8749-5695-a158-56fdb92fd877', 'f5c71c2f-1831-53e4-9fab-0dfb9c6e90c9', 'working', 1, 10, 22.0, 120, FALSE, '2026-10-07T17:23:10+00:00'),
  ('9a8246ba-f853-58f2-b37f-df8631348c0f', 'f5c71c2f-1831-53e4-9fab-0dfb9c6e90c9', 'working', 2, 10, 22.0, 90, FALSE, '2026-10-07T17:25:50+00:00'),
  ('307ba9a5-5087-5649-8910-57ca6265fe2f', 'f5c71c2f-1831-53e4-9fab-0dfb9c6e90c9', 'working', 3, 8, 22.0, 60, FALSE, '2026-10-07T17:27:54+00:00'),
  ('2eaf0ee3-78ee-5b07-bf46-65da7480fe37', 'b54bf2a7-e004-5d92-9b2c-4da454daec21', 'working', 1, 10, 47.5, 150, FALSE, '2026-10-07T17:31:34+00:00'),
  ('57a87dad-a441-5d1c-86d9-6980d01a6b84', 'b54bf2a7-e004-5d92-9b2c-4da454daec21', 'working', 2, 10, 47.5, 150, FALSE, '2026-10-07T17:35:14+00:00'),
  ('1c51107d-7455-55b2-a183-797f21fe85f8', 'b54bf2a7-e004-5d92-9b2c-4da454daec21', 'working', 3, 10, 47.5, 120, FALSE, '2026-10-07T17:38:24+00:00'),
  ('97d2f4ff-a286-5cb8-a76d-2cfe203c28aa', 'c5aae5e0-49a9-55f4-8ee3-22198ea5b608', 'working', 1, 12, 7.0, 120, FALSE, '2026-10-07T17:41:40+00:00'),
  ('93651e8a-690c-5dc0-ae7d-a401a23926cb', 'c5aae5e0-49a9-55f4-8ee3-22198ea5b608', 'working', 2, 12, 7.0, 90, FALSE, '2026-10-07T17:44:26+00:00'),
  ('fb629d9f-7aa4-58cc-b27e-8509ada079cb', 'c5aae5e0-49a9-55f4-8ee3-22198ea5b608', 'working', 3, 12, 7.0, 90, FALSE, '2026-10-07T17:47:12+00:00'),
  ('1d66b025-bc82-5758-9ae8-c19d4f3fef56', '119e83b6-ade7-5643-8095-d7d477ff1a31', 'working', 1, 12, 9.0, 90, FALSE, '2026-10-07T17:49:58+00:00'),
  ('962ced41-fc42-5176-ae32-6d6a4e86e6bf', '119e83b6-ade7-5643-8095-d7d477ff1a31', 'working', 2, 12, 9.0, 90, FALSE, '2026-10-07T17:52:44+00:00'),
  ('af0278c9-ade8-5ecd-a662-d0dadaa5700a', '119e83b6-ade7-5643-8095-d7d477ff1a31', 'working', 3, 12, 9.0, 150, FALSE, '2026-10-07T17:56:30+00:00'),
  ('abd74960-bb8a-5eec-a1aa-d7bbb3762500', '8426e247-9a46-5fda-b5af-cfe92c8e6e01', 'working', 1, 12, 27.5, 90, FALSE, '2026-10-07T17:59:16+00:00'),
  ('3ecd2959-29a9-576b-9167-c645c3671066', '8426e247-9a46-5fda-b5af-cfe92c8e6e01', 'working', 2, 12, 27.5, 150, FALSE, '2026-10-07T18:03:02+00:00'),
  ('2fdb9328-213d-5252-b1bd-9d2369e81bce', '8426e247-9a46-5fda-b5af-cfe92c8e6e01', 'working', 3, 10, 27.5, 90, FALSE, '2026-10-07T18:05:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7259e27c-210d-599a-ae19-ee625eba5a0a', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-09T17:22:00+00:00', '2026-10-09T18:19:12+00:00', 3432, 8120.0, FALSE, 68.0, 'gym', 434);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('29e510fd-cb7d-5efa-b37c-7b341897e681', '7259e27c-210d-599a-ae19-ee625eba5a0a', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('7ab68c97-a2dd-5f15-b736-743163fe748b', '7259e27c-210d-599a-ae19-ee625eba5a0a', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('d5688c92-dc1b-57f5-8314-31b3ed4fa43a', '7259e27c-210d-599a-ae19-ee625eba5a0a', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('96291508-a1fc-5f0e-8596-9534cad0057b', '7259e27c-210d-599a-ae19-ee625eba5a0a', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('23bfc423-6c62-5ed5-9ebe-700d5230899b', '29e510fd-cb7d-5efa-b37c-7b341897e681', 'working', 1, 10, 150.0, 90, FALSE, '2026-10-09T17:29:40+00:00'),
  ('fe3f9296-7413-52ba-8867-6ef1fa02bd61', '29e510fd-cb7d-5efa-b37c-7b341897e681', 'working', 2, 10, 150.0, 120, FALSE, '2026-10-09T17:32:50+00:00'),
  ('aacc944f-a4d4-5b01-ba85-048313e40f72', '29e510fd-cb7d-5efa-b37c-7b341897e681', 'working', 3, 8, 150.0, 150, FALSE, '2026-10-09T17:36:24+00:00'),
  ('ab92989e-aa65-5d08-a5f9-25bd8cf73042', '7ab68c97-a2dd-5f15-b736-743163fe748b', 'working', 1, 10, 75.0, 60, FALSE, '2026-10-09T17:38:34+00:00'),
  ('4cb689fc-84cd-58b5-be31-3ea7d1026558', '7ab68c97-a2dd-5f15-b736-743163fe748b', 'working', 2, 10, 75.0, 90, FALSE, '2026-10-09T17:41:14+00:00'),
  ('58cac701-e0c0-5287-99d1-773213ed1386', '7ab68c97-a2dd-5f15-b736-743163fe748b', 'working', 3, 8, 75.0, 60, FALSE, '2026-10-09T17:43:18+00:00'),
  ('2a8444d1-0a5f-5a0f-b0c2-a6ef8aa0cef0', 'd5688c92-dc1b-57f5-8314-31b3ed4fa43a', 'working', 1, 10, 65.0, 90, FALSE, '2026-10-09T17:45:58+00:00'),
  ('763f6213-abb2-580d-8a72-c5f2e5b4782f', 'd5688c92-dc1b-57f5-8314-31b3ed4fa43a', 'working', 2, 10, 65.0, 150, FALSE, '2026-10-09T17:49:38+00:00'),
  ('063c2eb0-ba88-527a-98e6-4af1764daf36', 'd5688c92-dc1b-57f5-8314-31b3ed4fa43a', 'working', 3, 8, 65.0, 90, FALSE, '2026-10-09T17:52:12+00:00'),
  ('4109d682-7182-58c7-8724-c8bb6c2c4560', '96291508-a1fc-5f0e-8596-9534cad0057b', 'working', 1, 115, 0.0, 90, FALSE, '2026-10-09T18:00:07+00:00'),
  ('40925de6-14a0-5c05-9c64-d9ad55d8ca20', '96291508-a1fc-5f0e-8596-9534cad0057b', 'working', 2, 120, 0.0, 90, FALSE, '2026-10-09T18:08:17+00:00'),
  ('9c3a6b45-0823-5bb1-9a0c-b3cf3e9314c5', '96291508-a1fc-5f0e-8596-9534cad0057b', 'working', 3, 115, 0.0, 90, FALSE, '2026-10-09T18:16:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('ca164a58-aa86-593a-b3f5-b10f4af4aa9c', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-12T17:44:00+00:00', '2026-10-12T18:42:00+00:00', 3480, 8195.0, FALSE, 68.0, 'gym', 450);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('bfeef066-2252-501b-935d-a02159462713', 'ca164a58-aa86-593a-b3f5-b10f4af4aa9c', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1c14cf12-3968-5e74-8372-31a6cb7bf6b6', 'ca164a58-aa86-593a-b3f5-b10f4af4aa9c', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('6834bcab-4e96-50ea-a0ae-c25432dea844', 'ca164a58-aa86-593a-b3f5-b10f4af4aa9c', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('77dcbab2-8941-5856-87ac-7f6c66bd9426', 'ca164a58-aa86-593a-b3f5-b10f4af4aa9c', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0bcabad5-6e85-57c9-85fd-8e493f299cb2', 'bfeef066-2252-501b-935d-a02159462713', 'working', 1, 10, 150.0, 60, FALSE, '2026-10-12T17:51:10+00:00'),
  ('aac3034a-7197-5efa-80b2-16577590dfdb', 'bfeef066-2252-501b-935d-a02159462713', 'working', 2, 10, 150.0, 150, FALSE, '2026-10-12T17:54:50+00:00'),
  ('99a27f63-aa60-551f-85a4-214993c45926', 'bfeef066-2252-501b-935d-a02159462713', 'working', 3, 8, 150.0, 90, FALSE, '2026-10-12T17:57:24+00:00'),
  ('ed38366c-dca4-5fa7-a959-319f6886ced9', '1c14cf12-3968-5e74-8372-31a6cb7bf6b6', 'working', 1, 10, 75.0, 120, FALSE, '2026-10-12T18:00:34+00:00'),
  ('8d13ae29-6135-5a45-8f9c-64050b793184', '1c14cf12-3968-5e74-8372-31a6cb7bf6b6', 'working', 2, 10, 75.0, 60, FALSE, '2026-10-12T18:02:44+00:00'),
  ('137a7052-2b1c-5a6b-9dc4-29eb65083930', '1c14cf12-3968-5e74-8372-31a6cb7bf6b6', 'working', 3, 9, 75.0, 90, FALSE, '2026-10-12T18:05:21+00:00'),
  ('2d6916e3-eec6-5ac4-93bd-1556aeda4eea', '6834bcab-4e96-50ea-a0ae-c25432dea844', 'working', 1, 10, 65.0, 60, FALSE, '2026-10-12T18:07:31+00:00'),
  ('60d00df1-6be9-5b8b-b3b0-f2f9d881b94d', '6834bcab-4e96-50ea-a0ae-c25432dea844', 'working', 2, 10, 65.0, 150, FALSE, '2026-10-12T18:11:11+00:00'),
  ('cf839bc9-1196-5a1c-85f3-bed522bdf29d', '6834bcab-4e96-50ea-a0ae-c25432dea844', 'working', 3, 8, 65.0, 60, FALSE, '2026-10-12T18:13:15+00:00'),
  ('a5bbf32c-60d4-5416-880e-b49a2938ebae', '77dcbab2-8941-5856-87ac-7f6c66bd9426', 'working', 1, 125, 0.0, 90, FALSE, '2026-10-12T18:21:40+00:00'),
  ('bcf52e6c-1f8f-5a8e-b090-c728992c799e', '77dcbab2-8941-5856-87ac-7f6c66bd9426', 'working', 2, 120, 0.0, 150, FALSE, '2026-10-12T18:30:50+00:00'),
  ('9bc78acc-03fa-569c-a047-d4155b8b637d', '77dcbab2-8941-5856-87ac-7f6c66bd9426', 'working', 3, 120, 0.0, 90, FALSE, '2026-10-12T18:39:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('f0861975-48cb-5add-941c-ba239fcdf62f', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-10-14T17:43:00+00:00', '2026-10-14T18:34:54+00:00', 3114, 3798.0, FALSE, 68.0, 'gym', 168);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('78fdcd74-d421-5db1-a050-18a1a9d5b730', 'f0861975-48cb-5add-941c-ba239fcdf62f', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('16c2ff86-c5d6-5d87-822b-7f57ca4393f4', 'f0861975-48cb-5add-941c-ba239fcdf62f', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('02fc408d-23d6-582d-b655-a116f4083888', 'f0861975-48cb-5add-941c-ba239fcdf62f', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('6f7da9c8-489c-5003-b863-1f71fce9ecba', 'f0861975-48cb-5add-941c-ba239fcdf62f', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('9b8bea5d-c153-5fd0-951e-79ae34c21190', 'f0861975-48cb-5add-941c-ba239fcdf62f', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('01132402-b440-5a2c-87d3-f98008d31162', '78fdcd74-d421-5db1-a050-18a1a9d5b730', 'working', 1, 10, 22.0, 90, FALSE, '2026-10-14T17:50:40+00:00'),
  ('c1188a9c-043c-5b69-aa75-1616d0b6f3dc', '78fdcd74-d421-5db1-a050-18a1a9d5b730', 'working', 2, 10, 22.0, 90, FALSE, '2026-10-14T17:53:20+00:00'),
  ('3895c5b1-a039-5263-bd4c-2b67b0fb2ea9', '78fdcd74-d421-5db1-a050-18a1a9d5b730', 'working', 3, 10, 22.0, 60, FALSE, '2026-10-14T17:55:30+00:00'),
  ('d1f4308a-c356-5ece-a56e-8626b0084d30', '16c2ff86-c5d6-5d87-822b-7f57ca4393f4', 'working', 1, 10, 50.0, 90, FALSE, '2026-10-14T17:58:10+00:00'),
  ('3d54f840-7c67-500e-86db-f892817a8685', '16c2ff86-c5d6-5d87-822b-7f57ca4393f4', 'working', 2, 10, 50.0, 60, FALSE, '2026-10-14T18:00:20+00:00'),
  ('189973d6-d9f4-5600-8824-9df72dbdc644', '16c2ff86-c5d6-5d87-822b-7f57ca4393f4', 'working', 3, 10, 50.0, 60, FALSE, '2026-10-14T18:02:30+00:00'),
  ('efcaea19-9d3f-5cb3-ac39-0e320c41343f', '02fc408d-23d6-582d-b655-a116f4083888', 'working', 1, 12, 8.0, 60, FALSE, '2026-10-14T18:04:46+00:00'),
  ('755da8c0-598d-55b6-83c4-042a30f5cd58', '02fc408d-23d6-582d-b655-a116f4083888', 'working', 2, 12, 8.0, 120, FALSE, '2026-10-14T18:08:02+00:00'),
  ('1549c740-b0af-5fd8-be8a-8a5f34c421d9', '02fc408d-23d6-582d-b655-a116f4083888', 'working', 3, 12, 8.0, 150, FALSE, '2026-10-14T18:11:48+00:00'),
  ('f2a5cee4-89c1-5b1a-81db-3e3c36b50026', '6f7da9c8-489c-5003-b863-1f71fce9ecba', 'working', 1, 12, 10.0, 150, FALSE, '2026-10-14T18:15:34+00:00'),
  ('5848c28b-ac32-5581-b881-4f9402a51367', '6f7da9c8-489c-5003-b863-1f71fce9ecba', 'working', 2, 12, 10.0, 120, FALSE, '2026-10-14T18:18:50+00:00'),
  ('9c01ded2-eb62-5722-b51f-d0f1d4dbc5a7', '6f7da9c8-489c-5003-b863-1f71fce9ecba', 'working', 3, 12, 10.0, 120, FALSE, '2026-10-14T18:22:06+00:00'),
  ('41c6fe0b-483a-57eb-a5ec-8b40c5561e5b', '9b8bea5d-c153-5fd0-951e-79ae34c21190', 'working', 1, 12, 27.5, 120, FALSE, '2026-10-14T18:25:22+00:00'),
  ('5be7a128-c2af-5494-b02e-bb1bfc27644e', '9b8bea5d-c153-5fd0-951e-79ae34c21190', 'working', 2, 12, 27.5, 120, FALSE, '2026-10-14T18:28:38+00:00'),
  ('43ae1333-1f02-5fd2-bae8-2459ba76a7e4', '9b8bea5d-c153-5fd0-951e-79ae34c21190', 'working', 3, 12, 27.5, 120, FALSE, '2026-10-14T18:31:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('78ec004d-acd4-54e2-b997-daafb8ca37b7', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-16T17:10:00+00:00', '2026-10-16T18:11:54+00:00', 3714, 8615.0, FALSE, 68.0, 'gym', 458);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('f2122f6c-eace-57ce-b6d2-71ebec36306e', '78ec004d-acd4-54e2-b997-daafb8ca37b7', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('456c874c-d2de-5d6d-99fb-75ace33a3fd0', '78ec004d-acd4-54e2-b997-daafb8ca37b7', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('17bf30dc-2f2c-5480-98f2-92c06cd37e4e', '78ec004d-acd4-54e2-b997-daafb8ca37b7', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('eba62667-b144-5dff-a0fb-9ab5b9e899eb', '78ec004d-acd4-54e2-b997-daafb8ca37b7', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8651d6c3-18cd-50ea-9b7b-43516cadda20', 'f2122f6c-eace-57ce-b6d2-71ebec36306e', 'working', 1, 10, 155.0, 60, FALSE, '2026-10-16T17:17:10+00:00'),
  ('c917c56a-cf88-5e31-bded-a9e67af3cff9', 'f2122f6c-eace-57ce-b6d2-71ebec36306e', 'working', 2, 10, 155.0, 60, FALSE, '2026-10-16T17:19:20+00:00'),
  ('b86b29d8-0dd6-5dec-967a-f76814f33e17', 'f2122f6c-eace-57ce-b6d2-71ebec36306e', 'working', 3, 8, 155.0, 90, FALSE, '2026-10-16T17:21:54+00:00'),
  ('c3152ce4-8084-53cb-bd0d-afa70284a70f', '456c874c-d2de-5d6d-99fb-75ace33a3fd0', 'working', 1, 10, 77.5, 150, FALSE, '2026-10-16T17:25:34+00:00'),
  ('c5978af8-7483-59d2-9e90-8f16adfdbead', '456c874c-d2de-5d6d-99fb-75ace33a3fd0', 'working', 2, 10, 77.5, 90, FALSE, '2026-10-16T17:28:14+00:00'),
  ('8a91d314-0714-549f-9187-384bf53a6fa2', '456c874c-d2de-5d6d-99fb-75ace33a3fd0', 'working', 3, 10, 77.5, 150, FALSE, '2026-10-16T17:31:54+00:00'),
  ('f37d1407-f9ea-5824-9ec9-50fdca6afc54', '17bf30dc-2f2c-5480-98f2-92c06cd37e4e', 'working', 1, 10, 65.0, 150, FALSE, '2026-10-16T17:35:34+00:00'),
  ('7caca775-72b7-5cca-a42e-be34694dd2f7', '17bf30dc-2f2c-5480-98f2-92c06cd37e4e', 'working', 2, 10, 65.0, 90, FALSE, '2026-10-16T17:38:14+00:00'),
  ('3f3c72d2-5987-5bfc-ac36-aa8320909087', '17bf30dc-2f2c-5480-98f2-92c06cd37e4e', 'working', 3, 10, 65.0, 150, FALSE, '2026-10-16T17:41:54+00:00'),
  ('c87108f1-79aa-590a-a208-4146fa7b1ca7', 'eba62667-b144-5dff-a0fb-9ab5b9e899eb', 'working', 1, 125, 0.0, 150, FALSE, '2026-10-16T17:51:19+00:00'),
  ('9c7bf54d-ffd5-5454-9451-fba6e8e3461d', 'eba62667-b144-5dff-a0fb-9ab5b9e899eb', 'working', 2, 125, 0.0, 120, FALSE, '2026-10-16T18:00:14+00:00'),
  ('38f91b55-27b7-5212-bccf-a10a8f03ecb0', 'eba62667-b144-5dff-a0fb-9ab5b9e899eb', 'working', 3, 120, 0.0, 120, FALSE, '2026-10-16T18:08:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('62995668-1370-59ca-91e7-060ca7e3bd28', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-19T17:24:00+00:00', '2026-10-19T18:21:06+00:00', 3426, 8777.5, FALSE, 68.0, 'gym', 452);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e769b381-5086-55f5-aeda-f3247dcd95f0', '62995668-1370-59ca-91e7-060ca7e3bd28', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('c0ae33f2-2e96-5422-ae63-c5fa6a0b7d08', '62995668-1370-59ca-91e7-060ca7e3bd28', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('820b69d6-517b-53a6-bf28-8a735206abe0', '62995668-1370-59ca-91e7-060ca7e3bd28', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('aea2c6c8-6e5f-5544-9aa0-47222b215852', '62995668-1370-59ca-91e7-060ca7e3bd28', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('24ec3aa8-4eba-587f-9093-bec85fa3cecb', 'e769b381-5086-55f5-aeda-f3247dcd95f0', 'working', 1, 10, 155.0, 120, FALSE, '2026-10-19T17:32:10+00:00'),
  ('e2dec0f8-f001-54a3-b480-42a1f5abcfe0', 'e769b381-5086-55f5-aeda-f3247dcd95f0', 'working', 2, 10, 155.0, 60, FALSE, '2026-10-19T17:34:20+00:00'),
  ('0190d8f6-6933-562d-a1da-095762ffef29', 'e769b381-5086-55f5-aeda-f3247dcd95f0', 'working', 3, 10, 155.0, 90, FALSE, '2026-10-19T17:37:00+00:00'),
  ('54a486fe-f2e3-5956-8b23-019dd08da7b7', 'c0ae33f2-2e96-5422-ae63-c5fa6a0b7d08', 'working', 1, 10, 77.5, 90, FALSE, '2026-10-19T17:39:40+00:00'),
  ('d319c7b3-3431-5e07-83ca-fba961387e8c', 'c0ae33f2-2e96-5422-ae63-c5fa6a0b7d08', 'working', 2, 10, 77.5, 60, FALSE, '2026-10-19T17:41:50+00:00'),
  ('f27382e0-a16b-5427-95ec-8e32ab8d31a4', 'c0ae33f2-2e96-5422-ae63-c5fa6a0b7d08', 'working', 3, 8, 77.5, 90, FALSE, '2026-10-19T17:44:24+00:00'),
  ('afb24e55-16ca-53e4-b5eb-bd17c625f970', '820b69d6-517b-53a6-bf28-8a735206abe0', 'working', 1, 10, 67.5, 90, FALSE, '2026-10-19T17:47:04+00:00'),
  ('ceaac73f-5b54-5ac5-9c11-c2ecb6ec5f3e', '820b69d6-517b-53a6-bf28-8a735206abe0', 'working', 2, 10, 67.5, 90, FALSE, '2026-10-19T17:49:44+00:00'),
  ('a882339c-3c77-573d-babb-5cdc2351c9ea', '820b69d6-517b-53a6-bf28-8a735206abe0', 'working', 3, 9, 67.5, 60, FALSE, '2026-10-19T17:51:51+00:00'),
  ('e38c46a5-8b02-5955-af6d-7cf547fa644a', 'aea2c6c8-6e5f-5544-9aa0-47222b215852', 'working', 1, 120, 0.0, 150, FALSE, '2026-10-19T18:01:01+00:00'),
  ('6fc00754-1a19-53bd-bbad-8e31886c3757', 'aea2c6c8-6e5f-5544-9aa0-47222b215852', 'working', 2, 120, 0.0, 90, FALSE, '2026-10-19T18:09:11+00:00'),
  ('6a2faa62-c222-5fb1-bec7-8cd7e2c803f0', 'aea2c6c8-6e5f-5544-9aa0-47222b215852', 'working', 3, 125, 0.0, 120, FALSE, '2026-10-19T18:18:06+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('ee1b5a4e-0596-5f35-aba5-d562d12682ee', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-10-21T17:32:00+00:00', '2026-10-21T18:20:12+00:00', 2892, 3736.0, FALSE, 68.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('897b4335-8026-5e8d-890d-a28b310de033', 'ee1b5a4e-0596-5f35-aba5-d562d12682ee', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('7175be74-180b-547c-8625-b7cf65701158', 'ee1b5a4e-0596-5f35-aba5-d562d12682ee', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('1b78964a-ba1a-52dd-957f-b4b0443fb0d2', 'ee1b5a4e-0596-5f35-aba5-d562d12682ee', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('f6cb1cb1-1fe5-50db-ba46-4da676b6a14f', 'ee1b5a4e-0596-5f35-aba5-d562d12682ee', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('3ad2ee85-eddc-51bb-9460-0f841497a672', 'ee1b5a4e-0596-5f35-aba5-d562d12682ee', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('c0282d85-abc8-5ac0-99a3-a81e52fd715e', '897b4335-8026-5e8d-890d-a28b310de033', 'working', 1, 10, 22.0, 150, FALSE, '2026-10-21T17:40:40+00:00'),
  ('f8a97d6d-e060-5dfb-b916-0f599e40419c', '897b4335-8026-5e8d-890d-a28b310de033', 'working', 2, 10, 22.0, 60, FALSE, '2026-10-21T17:42:50+00:00'),
  ('673a9733-a187-56f9-8f4c-ac6711f8f600', '897b4335-8026-5e8d-890d-a28b310de033', 'working', 3, 8, 22.0, 60, FALSE, '2026-10-21T17:44:54+00:00'),
  ('335617af-6590-522f-bdfe-d3584e534059', '7175be74-180b-547c-8625-b7cf65701158', 'working', 1, 10, 50.0, 90, FALSE, '2026-10-21T17:47:34+00:00'),
  ('b4e9603b-120c-5531-a194-c8899e153ef9', '7175be74-180b-547c-8625-b7cf65701158', 'working', 2, 10, 50.0, 90, FALSE, '2026-10-21T17:50:14+00:00'),
  ('de36b61c-d269-5d69-a49f-f3967fab8eb3', '7175be74-180b-547c-8625-b7cf65701158', 'working', 3, 10, 50.0, 60, FALSE, '2026-10-21T17:52:24+00:00'),
  ('c90072a1-844c-5bef-afc0-f2182183bcb4', '1b78964a-ba1a-52dd-957f-b4b0443fb0d2', 'working', 1, 12, 8.0, 120, FALSE, '2026-10-21T17:55:40+00:00'),
  ('69da9aa2-d4f7-5c1d-93df-2fd049c04955', '1b78964a-ba1a-52dd-957f-b4b0443fb0d2', 'working', 2, 12, 8.0, 60, FALSE, '2026-10-21T17:57:56+00:00'),
  ('7b35a8e7-ca3a-5101-8f0c-af003230a2a6', '1b78964a-ba1a-52dd-957f-b4b0443fb0d2', 'working', 3, 11, 8.0, 90, FALSE, '2026-10-21T18:00:39+00:00'),
  ('0526134a-e6e0-5186-a2a4-d0af01131f84', 'f6cb1cb1-1fe5-50db-ba46-4da676b6a14f', 'working', 1, 12, 10.0, 90, FALSE, '2026-10-21T18:03:25+00:00'),
  ('55f4c1b9-538d-5490-a182-e77ca5953c68', 'f6cb1cb1-1fe5-50db-ba46-4da676b6a14f', 'working', 2, 12, 10.0, 60, FALSE, '2026-10-21T18:05:41+00:00'),
  ('2856dc9e-01ee-5ec7-a212-8613c7b6fb2c', 'f6cb1cb1-1fe5-50db-ba46-4da676b6a14f', 'working', 3, 11, 10.0, 90, FALSE, '2026-10-21T18:08:24+00:00'),
  ('c78adc6a-048b-5a36-8bb6-ab8b3ff40e6b', '3ad2ee85-eddc-51bb-9460-0f841497a672', 'working', 1, 12, 27.5, 120, FALSE, '2026-10-21T18:11:40+00:00'),
  ('661c06c8-e223-5009-a44a-320b297593ef', '3ad2ee85-eddc-51bb-9460-0f841497a672', 'working', 2, 12, 27.5, 90, FALSE, '2026-10-21T18:14:26+00:00'),
  ('034829fb-ee43-51b1-8b32-2d0cb97427e3', '3ad2ee85-eddc-51bb-9460-0f841497a672', 'working', 3, 12, 27.5, 90, FALSE, '2026-10-21T18:17:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('b2165f1d-9d92-5dea-a629-6c20a11dfaef', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-23T17:00:00+00:00', '2026-10-23T18:01:45+00:00', 3705, 9225.0, FALSE, 68.0, 'gym', 475);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('0c9134b8-2355-50a0-8ea8-d755681602ee', 'b2165f1d-9d92-5dea-a629-6c20a11dfaef', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ff9826a3-3503-521e-8a32-0556870552c8', 'b2165f1d-9d92-5dea-a629-6c20a11dfaef', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('bc123d26-51bb-5ea5-ac66-ff5fc8cd1843', 'b2165f1d-9d92-5dea-a629-6c20a11dfaef', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('14a0e2ef-bd87-5d4e-b953-490999dfd0b0', 'b2165f1d-9d92-5dea-a629-6c20a11dfaef', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('000c8aa4-3371-57ac-9641-0ef9831a86c8', '0c9134b8-2355-50a0-8ea8-d755681602ee', 'working', 1, 10, 160.0, 120, FALSE, '2026-10-23T17:08:10+00:00'),
  ('0248950e-ea8c-5276-9a62-ed79254e5d9e', '0c9134b8-2355-50a0-8ea8-d755681602ee', 'working', 2, 10, 160.0, 60, FALSE, '2026-10-23T17:10:20+00:00'),
  ('9a3fd448-8385-59ed-8dee-5dbe2ce7d06e', '0c9134b8-2355-50a0-8ea8-d755681602ee', 'working', 3, 10, 160.0, 90, FALSE, '2026-10-23T17:13:00+00:00'),
  ('6aba6a3b-125f-5829-9c14-3d32d34587d5', 'ff9826a3-3503-521e-8a32-0556870552c8', 'working', 1, 10, 80.0, 150, FALSE, '2026-10-23T17:16:40+00:00'),
  ('7376f5f2-be58-5f1f-8a3b-0506ccc93ac5', 'ff9826a3-3503-521e-8a32-0556870552c8', 'working', 2, 10, 80.0, 150, FALSE, '2026-10-23T17:20:20+00:00'),
  ('4940acb2-a8dd-5a71-abc9-32d5ef0bb17d', 'ff9826a3-3503-521e-8a32-0556870552c8', 'working', 3, 10, 80.0, 120, FALSE, '2026-10-23T17:23:30+00:00'),
  ('94e57c38-ee16-5476-aba1-44ad02b075b0', 'bc123d26-51bb-5ea5-ac66-ff5fc8cd1843', 'working', 1, 10, 67.5, 120, FALSE, '2026-10-23T17:26:40+00:00'),
  ('9790fd64-3332-542d-a92f-b2a291333cfb', 'bc123d26-51bb-5ea5-ac66-ff5fc8cd1843', 'working', 2, 10, 67.5, 60, FALSE, '2026-10-23T17:28:50+00:00'),
  ('86e31f69-337d-50d4-bde4-43363be414cf', 'bc123d26-51bb-5ea5-ac66-ff5fc8cd1843', 'working', 3, 10, 67.5, 120, FALSE, '2026-10-23T17:32:00+00:00'),
  ('67149721-6665-575b-85ec-2b8d43b7ee31', '14a0e2ef-bd87-5d4e-b953-490999dfd0b0', 'working', 1, 125, 0.0, 60, FALSE, '2026-10-23T17:39:55+00:00'),
  ('77d8ff1c-1955-5dac-ade0-945516b8814a', '14a0e2ef-bd87-5d4e-b953-490999dfd0b0', 'working', 2, 135, 0.0, 120, FALSE, '2026-10-23T17:49:20+00:00'),
  ('8dd28862-101f-5fe9-97d9-e52e38e39a05', '14a0e2ef-bd87-5d4e-b953-490999dfd0b0', 'working', 3, 125, 0.0, 150, FALSE, '2026-10-23T17:58:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body B', '2026-10-28T17:14:00+00:00', '2026-10-28T18:05:48+00:00', 3108, 3918.0, FALSE, 68.0, 'gym', 166);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('07e7fa9b-b395-5517-a3e5-b741b2458bf9', '5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', (SELECT id FROM exercises WHERE code = 'goblet-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('fec980ad-9e55-5ae7-81eb-d70fe9547460', '5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', (SELECT id FROM exercises WHERE code = 'seated-cable-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('daeb6163-7b1f-5814-b472-850efcc6e911', '5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', (SELECT id FROM exercises WHERE code = 'dumbbell-lateral-raise' AND owner_id IS NULL), 2, 'bilateral'),
  ('225efbb8-8b86-584b-a32b-ed4aca42ff9f', '5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', (SELECT id FROM exercises WHERE code = 'dumbbell-curl' AND owner_id IS NULL), 3, 'bilateral'),
  ('d2d184b5-a7fc-58be-889b-05894a8f851a', '5c91d069-3dd5-5b10-9df0-b1cd15a6e79a', (SELECT id FROM exercises WHERE code = 'cable-rope-pushdown' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2a634f8f-c8f2-53a1-bfe4-fc7fef3f5d2a', '07e7fa9b-b395-5517-a3e5-b741b2458bf9', 'working', 1, 10, 24.0, 150, FALSE, '2026-10-28T17:22:40+00:00'),
  ('baefdabb-be4e-53a4-8aa4-aa691f5ae2b5', '07e7fa9b-b395-5517-a3e5-b741b2458bf9', 'working', 2, 10, 24.0, 60, FALSE, '2026-10-28T17:24:50+00:00'),
  ('560cdd5c-290a-58aa-b5c3-b719a3b01b9e', '07e7fa9b-b395-5517-a3e5-b741b2458bf9', 'working', 3, 10, 24.0, 150, FALSE, '2026-10-28T17:28:30+00:00'),
  ('b835dc80-78a7-5d2f-9cef-9b9c18c18e46', 'fec980ad-9e55-5ae7-81eb-d70fe9547460', 'working', 1, 10, 52.5, 120, FALSE, '2026-10-28T17:31:40+00:00'),
  ('224890c6-c273-5d87-b97c-4d15941bcd15', 'fec980ad-9e55-5ae7-81eb-d70fe9547460', 'working', 2, 10, 52.5, 60, FALSE, '2026-10-28T17:33:50+00:00'),
  ('37f87adf-9e89-5705-a5e3-75e0eed989a4', 'fec980ad-9e55-5ae7-81eb-d70fe9547460', 'working', 3, 8, 52.5, 90, FALSE, '2026-10-28T17:36:24+00:00'),
  ('0a3d7883-9bad-505c-abc4-df087f831244', 'daeb6163-7b1f-5814-b472-850efcc6e911', 'working', 1, 12, 8.0, 90, FALSE, '2026-10-28T17:39:10+00:00'),
  ('b7213b7a-6cac-546c-93a1-99fba99c65a1', 'daeb6163-7b1f-5814-b472-850efcc6e911', 'working', 2, 12, 8.0, 150, FALSE, '2026-10-28T17:42:56+00:00'),
  ('6ddb7b20-14cc-503e-bd0d-c0acac68b045', 'daeb6163-7b1f-5814-b472-850efcc6e911', 'working', 3, 12, 8.0, 90, FALSE, '2026-10-28T17:45:42+00:00'),
  ('c7a92503-392d-5a31-acd5-d83d40bb2f09', '225efbb8-8b86-584b-a32b-ed4aca42ff9f', 'working', 1, 12, 10.0, 90, FALSE, '2026-10-28T17:48:28+00:00'),
  ('35a339e1-fd70-5bcb-9a8c-caa9e17bd264', '225efbb8-8b86-584b-a32b-ed4aca42ff9f', 'working', 2, 12, 10.0, 120, FALSE, '2026-10-28T17:51:44+00:00'),
  ('7f301929-4d71-5f1b-88a1-b25d9fb86a04', '225efbb8-8b86-584b-a32b-ed4aca42ff9f', 'working', 3, 12, 10.0, 60, FALSE, '2026-10-28T17:54:00+00:00'),
  ('7a5151d2-f3ca-5f7f-b929-2421d6fc48cd', 'd2d184b5-a7fc-58be-889b-05894a8f851a', 'working', 1, 12, 30.0, 60, FALSE, '2026-10-28T17:56:16+00:00'),
  ('94edbbe3-3b40-5f0c-b8c9-8ccc64114821', 'd2d184b5-a7fc-58be-889b-05894a8f851a', 'working', 2, 12, 30.0, 150, FALSE, '2026-10-28T18:00:02+00:00'),
  ('37dfd655-7a1a-5a2b-aef9-7b69e28c2bad', 'd2d184b5-a7fc-58be-889b-05894a8f851a', 'working', 3, 12, 30.0, 90, FALSE, '2026-10-28T18:02:48+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3bfb0c59-06a6-56bf-8821-5504047e29c0', '710357a0-5015-5f1c-a753-9b8627409cb3', 'Full body A', '2026-10-30T17:06:00+00:00', '2026-10-30T18:05:45+00:00', 3585, 9225.0, FALSE, 68.0, 'gym', 475);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e773ee34-83b3-53e5-b241-5b557c2ec81f', '3bfb0c59-06a6-56bf-8821-5504047e29c0', (SELECT id FROM exercises WHERE code = 'machine-leg-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('fdbd37dc-1302-5dd2-b7fd-beb023b2a667', '3bfb0c59-06a6-56bf-8821-5504047e29c0', (SELECT id FROM exercises WHERE code = 'machine-chest-press' AND owner_id IS NULL), 1, 'bilateral'),
  ('790cd29d-82f6-5441-a858-498956727e1f', '3bfb0c59-06a6-56bf-8821-5504047e29c0', (SELECT id FROM exercises WHERE code = 'machine-pulldown' AND owner_id IS NULL), 2, 'bilateral'),
  ('bb2a5352-5c81-5841-90e4-00ff7038339e', '3bfb0c59-06a6-56bf-8821-5504047e29c0', (SELECT id FROM exercises WHERE code = 'plank' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1a8d7102-083c-5bf8-84e0-41b16c8631e5', 'e773ee34-83b3-53e5-b241-5b557c2ec81f', 'working', 1, 10, 160.0, 150, FALSE, '2026-10-30T17:14:40+00:00'),
  ('11df4faf-45f9-5c0c-8bc1-352a216ff3a2', 'e773ee34-83b3-53e5-b241-5b557c2ec81f', 'working', 2, 10, 160.0, 120, FALSE, '2026-10-30T17:17:50+00:00'),
  ('2c76bbd9-3087-5014-b22a-f1fce83df7b8', 'e773ee34-83b3-53e5-b241-5b557c2ec81f', 'working', 3, 10, 160.0, 150, FALSE, '2026-10-30T17:21:30+00:00'),
  ('da91ee97-e102-5a02-ab39-e6051772be36', 'fdbd37dc-1302-5dd2-b7fd-beb023b2a667', 'working', 1, 10, 80.0, 60, FALSE, '2026-10-30T17:23:40+00:00'),
  ('d62682d2-f5ac-5a9f-8f45-bae58897f74b', 'fdbd37dc-1302-5dd2-b7fd-beb023b2a667', 'working', 2, 10, 80.0, 60, FALSE, '2026-10-30T17:25:50+00:00'),
  ('6725afa5-4b38-553a-bf66-1a6d8279ec7b', 'fdbd37dc-1302-5dd2-b7fd-beb023b2a667', 'working', 3, 10, 80.0, 90, FALSE, '2026-10-30T17:28:30+00:00'),
  ('d02cba69-c283-5dfa-b9d8-6687ff82a1cf', '790cd29d-82f6-5441-a858-498956727e1f', 'working', 1, 10, 67.5, 90, FALSE, '2026-10-30T17:31:10+00:00'),
  ('d81babe2-8a3b-5526-a44c-bd19cabeb138', '790cd29d-82f6-5441-a858-498956727e1f', 'working', 2, 10, 67.5, 120, FALSE, '2026-10-30T17:34:20+00:00'),
  ('30c3ee1a-d523-57f5-8b7e-2a7ffd2069ae', '790cd29d-82f6-5441-a858-498956727e1f', 'working', 3, 10, 67.5, 90, FALSE, '2026-10-30T17:37:00+00:00'),
  ('c0a750c6-bd9e-54ef-8a9d-0aa1823caf59', 'bb2a5352-5c81-5841-90e4-00ff7038339e', 'working', 1, 130, 0.0, 90, FALSE, '2026-10-30T17:45:40+00:00'),
  ('5573f7d5-ea5c-5683-b012-51ac34945f78', 'bb2a5352-5c81-5841-90e4-00ff7038339e', 'working', 2, 130, 0.0, 90, FALSE, '2026-10-30T17:54:20+00:00'),
  ('05d2a3ed-b818-52ed-99a9-b6eb111feb4a', 'bb2a5352-5c81-5841-90e4-00ff7038339e', 'working', 3, 125, 0.0, 90, FALSE, '2026-10-30T18:02:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7e03f69a-484c-5e8d-880e-ac689eea7cbf', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-06-01T06:42:00+00:00', '2026-06-01T07:48:10+00:00', 3970, 5170.0, FALSE, 84.0, 'gym', 124);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', '7e03f69a-484c-5e8d-880e-ac689eea7cbf', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('400e1bd2-621a-5a5d-baa9-c640d3deeb60', '7e03f69a-484c-5e8d-880e-ac689eea7cbf', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('0282b5a3-0610-50a7-a6d1-be8699a9a156', '7e03f69a-484c-5e8d-880e-ac689eea7cbf', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('caaa740a-d078-530d-a44c-a8dfdefe3f83', '7e03f69a-484c-5e8d-880e-ac689eea7cbf', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('8f3cd8ee-1b2b-5735-b4c7-d021d63e59a3', '7e03f69a-484c-5e8d-880e-ac689eea7cbf', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6015bbc0-b009-5326-8502-6bbceb5dbf19', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-06-01T06:48:49+00:00'),
  ('afb59d2b-a34d-5e6b-a678-dcb6da226cff', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-06-01T06:50:29+00:00'),
  ('2e83a3d1-3fc6-52b2-956b-7e9dc84c55ed', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'working', 3, 5, 90.0, 90, FALSE, '2026-06-01T06:52:54+00:00'),
  ('557e213d-c211-5be2-b45b-26187c9b4403', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'working', 4, 5, 90.0, 120, FALSE, '2026-06-01T06:55:49+00:00'),
  ('2daf7316-6302-5f25-bb49-6cc9b43aeb36', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'working', 5, 5, 90.0, 120, FALSE, '2026-06-01T06:58:44+00:00'),
  ('4ae444f3-c3e2-5500-802d-0be63b995e07', 'add537ab-d5b8-5f14-a7ad-6b9f054dd7a5', 'working', 6, 5, 90.0, 90, FALSE, '2026-06-01T07:01:09+00:00'),
  ('11f642f0-db1a-592e-9722-2bd1ccc7b571', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-06-01T07:02:58+00:00'),
  ('c1e91095-89ce-50ad-a5d8-7b8cf5384664', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'warmup', 2, 5, 60.0, NULL, FALSE, '2026-06-01T07:04:38+00:00'),
  ('013a3eea-edcd-510b-9d0d-7f79d7b25281', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'working', 3, 6, 80.0, 90, FALSE, '2026-06-01T07:07:06+00:00'),
  ('4d9ba441-11e5-50b2-a962-1a723998646c', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'working', 4, 6, 80.0, 120, FALSE, '2026-06-01T07:10:04+00:00'),
  ('b54701b5-1bd1-53a0-b689-f44d85a10245', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'working', 5, 6, 80.0, 90, FALSE, '2026-06-01T07:12:32+00:00'),
  ('0b0203c3-a848-5310-a207-0a3ec57ef041', '400e1bd2-621a-5a5d-baa9-c640d3deeb60', 'working', 6, 5, 80.0, 60, FALSE, '2026-06-01T07:14:27+00:00'),
  ('0cb09ebb-a108-5821-a5fc-9f5bc30626ef', '0282b5a3-0610-50a7-a6d1-be8699a9a156', 'working', 1, 8, 30.0, 120, FALSE, '2026-06-01T07:17:31+00:00'),
  ('0573c2bf-6520-583e-a7b5-b7c8ceaed6ee', '0282b5a3-0610-50a7-a6d1-be8699a9a156', 'working', 2, 8, 30.0, 90, FALSE, '2026-06-01T07:20:05+00:00'),
  ('9fe712f6-6b03-5996-ab04-b11b7e8ea011', '0282b5a3-0610-50a7-a6d1-be8699a9a156', 'failure', 3, 7, 30.0, 90, FALSE, '2026-06-01T07:22:36+00:00'),
  ('1ac7c5d8-dd04-51c1-b68f-585c1c134b76', 'caaa740a-d078-530d-a44c-a8dfdefe3f83', 'working', 1, 9, 0.0, 90, FALSE, '2026-06-01T07:25:13+00:00'),
  ('ab1eca82-3dc0-5bdd-b77f-f0f7b9e7c348', 'caaa740a-d078-530d-a44c-a8dfdefe3f83', 'working', 2, 9, 0.0, 120, FALSE, '2026-06-01T07:28:20+00:00'),
  ('3e7b1379-2f9d-529e-ae2f-ff3d6c2d9ebb', 'caaa740a-d078-530d-a44c-a8dfdefe3f83', 'working', 3, 6, 0.0, 90, FALSE, '2026-06-01T07:30:48+00:00'),
  ('199793a4-2bab-5ce9-9b4f-ff1eb59acefd', 'caaa740a-d078-530d-a44c-a8dfdefe3f83', 'failure', 4, 6, 0.0, 150, FALSE, '2026-06-01T07:34:16+00:00'),
  ('3fa2bde7-d934-5053-8c8b-a2bfb068a213', '8f3cd8ee-1b2b-5735-b4c7-d021d63e59a3', 'working', 1, 10, 30.0, 150, FALSE, '2026-06-01T07:37:56+00:00'),
  ('df9d417d-dc61-5e75-9891-33ec48d8b4bf', '8f3cd8ee-1b2b-5735-b4c7-d021d63e59a3', 'working', 2, 10, 30.0, 150, FALSE, '2026-06-01T07:41:36+00:00'),
  ('c5f8a69a-5e56-513a-aa6e-d8c58fd23669', '8f3cd8ee-1b2b-5735-b4c7-d021d63e59a3', 'failure', 3, 8, 30.0, 150, FALSE, '2026-06-01T07:45:10+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6b51d219-d301-549f-927d-a82a223c05b3', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-06-02T06:06:00+00:00', '2026-06-02T07:04:55+00:00', 3535, 10010.0, FALSE, 84.0, 'gym', 162);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', '6b51d219-d301-549f-927d-a82a223c05b3', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('727aef72-dfbf-54bd-bf78-2cbf177707f5', '6b51d219-d301-549f-927d-a82a223c05b3', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('4643909b-b4ac-5ba8-8f27-2f4b24e84aa7', '6b51d219-d301-549f-927d-a82a223c05b3', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('ee2b9262-dee8-5038-b315-ce2bf5b4760d', '6b51d219-d301-549f-927d-a82a223c05b3', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('78b310f0-b8ef-571a-abbd-60a1e8810241', '6b51d219-d301-549f-927d-a82a223c05b3', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8d87f4e7-3cb5-5591-b874-ccf9fc9608b0', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'warmup', 1, 8, 60.0, NULL, FALSE, '2026-06-02T06:12:49+00:00'),
  ('f71ee9ec-baa4-5f93-8b11-210d7f2c05c9', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'warmup', 2, 5, 90.0, NULL, FALSE, '2026-06-02T06:14:29+00:00'),
  ('0c7d017f-33f6-5fe8-8e03-1bf573db51f3', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'working', 3, 5, 120.0, 90, FALSE, '2026-06-02T06:16:54+00:00'),
  ('74dc7c26-5105-548c-874c-c2594b7743ee', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'working', 4, 5, 120.0, 90, FALSE, '2026-06-02T06:19:19+00:00'),
  ('26e25674-3c5b-5fd5-8e5e-d91810bd3bd0', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'working', 5, 5, 120.0, 150, FALSE, '2026-06-02T06:22:44+00:00'),
  ('55520c27-7a2b-5f94-a65b-611aaac666ee', '6e3e37d3-8c1e-567c-8d0a-8a3d64ea02e8', 'working', 6, 5, 120.0, 120, FALSE, '2026-06-02T06:25:39+00:00'),
  ('3e73a33c-e6f0-5323-bc42-0db20b95b632', '727aef72-dfbf-54bd-bf78-2cbf177707f5', 'working', 1, 8, 100.0, 90, FALSE, '2026-06-02T06:28:13+00:00'),
  ('4f0a408f-3279-54a5-ac65-fa9ad624b28a', '727aef72-dfbf-54bd-bf78-2cbf177707f5', 'working', 2, 8, 100.0, 60, FALSE, '2026-06-02T06:30:17+00:00'),
  ('a714275e-7e34-5f6d-8704-5783c7a0b5ed', '727aef72-dfbf-54bd-bf78-2cbf177707f5', 'working', 3, 8, 100.0, 60, FALSE, '2026-06-02T06:32:21+00:00'),
  ('33626fdc-71f4-59ef-bf02-6314ccba9a62', '4643909b-b4ac-5ba8-8f27-2f4b24e84aa7', 'working', 1, 10, 45.0, 120, FALSE, '2026-06-02T06:35:31+00:00'),
  ('17691555-12a4-5fc5-adb5-f223da42a250', '4643909b-b4ac-5ba8-8f27-2f4b24e84aa7', 'working', 2, 10, 45.0, 150, FALSE, '2026-06-02T06:39:11+00:00'),
  ('88812687-a8fb-50a5-9711-062aa165cdf1', '4643909b-b4ac-5ba8-8f27-2f4b24e84aa7', 'dropset', 3, 13, 35.0, 90, FALSE, '2026-06-02T06:42:00+00:00'),
  ('d3459733-2cba-5c7a-8a64-c12c18ea315a', 'ee2b9262-dee8-5038-b315-ce2bf5b4760d', 'working', 1, 12, 80.0, 90, FALSE, '2026-06-02T06:44:46+00:00'),
  ('188e91cb-4c70-5b9d-8597-7d82c325aee0', 'ee2b9262-dee8-5038-b315-ce2bf5b4760d', 'working', 2, 12, 80.0, 150, FALSE, '2026-06-02T06:48:32+00:00'),
  ('dcf3b088-9039-59ae-994d-2babf52e10f1', 'ee2b9262-dee8-5038-b315-ce2bf5b4760d', 'working', 3, 12, 80.0, 60, FALSE, '2026-06-02T06:50:48+00:00'),
  ('fe59fd7e-268e-54c8-b878-81bb24363108', 'ee2b9262-dee8-5038-b315-ce2bf5b4760d', 'dropset', 4, 15, 65.0, 90, FALSE, '2026-06-02T06:53:43+00:00'),
  ('bc1469b5-9636-5c94-9b4a-0bd52ebf599e', '78b310f0-b8ef-571a-abbd-60a1e8810241', 'working', 1, 10, 0.0, 90, FALSE, '2026-06-02T06:56:23+00:00'),
  ('501a2d56-7828-57d1-879a-00e1e6973697', '78b310f0-b8ef-571a-abbd-60a1e8810241', 'working', 2, 11, 0.0, 90, FALSE, '2026-06-02T06:59:06+00:00'),
  ('d5e669af-cb74-58a6-96ac-3d1a3e2662f4', '78b310f0-b8ef-571a-abbd-60a1e8810241', 'failure', 3, 13, 0.0, 90, FALSE, '2026-06-02T07:01:55+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7a20d576-e00e-5ce2-bf96-93a91111bc2b', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-06-04T06:08:00+00:00', '2026-06-04T07:05:22+00:00', 3442, 3485.0, FALSE, 84.0, 'gym', 161);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('a7104cf6-25da-5563-9ef4-4178def0196f', '7a20d576-e00e-5ce2-bf96-93a91111bc2b', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('2b1c8749-2f70-5be9-9d82-60139239e4c7', '7a20d576-e00e-5ce2-bf96-93a91111bc2b', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('92ab75b2-6e8f-5cd4-bc9c-3c469581e08e', '7a20d576-e00e-5ce2-bf96-93a91111bc2b', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('a9c0f5ca-940e-5588-a919-ff767ee9c07b', '7a20d576-e00e-5ce2-bf96-93a91111bc2b', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('04957a53-c896-5009-a305-53b88c300a49', '7a20d576-e00e-5ce2-bf96-93a91111bc2b', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('db4e2bc8-9d40-513d-a4e3-82c57af0184a', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'warmup', 1, 8, 27.5, NULL, FALSE, '2026-06-04T06:14:49+00:00'),
  ('c7fbdb70-91af-59c3-bf37-1867caa8fb9a', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'warmup', 2, 5, 40.0, NULL, FALSE, '2026-06-04T06:16:29+00:00'),
  ('4ba9060f-34e2-513a-a637-653d776b47be', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'working', 3, 5, 55.0, 90, FALSE, '2026-06-04T06:18:54+00:00'),
  ('57b5b580-04cc-5954-8285-e4625cb10511', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'working', 4, 5, 55.0, 90, FALSE, '2026-06-04T06:21:19+00:00'),
  ('a4d31e3e-e373-56c5-9017-fb678341f473', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'working', 5, 5, 55.0, 90, FALSE, '2026-06-04T06:23:44+00:00'),
  ('d488c3a2-e2c0-52af-aff5-f6d1e25ec34b', 'a7104cf6-25da-5563-9ef4-4178def0196f', 'working', 6, 5, 55.0, 90, FALSE, '2026-06-04T06:26:09+00:00'),
  ('14b08812-d624-58a5-8249-59a2724b4e25', '2b1c8749-2f70-5be9-9d82-60139239e4c7', 'working', 1, 9, 0.0, 120, FALSE, '2026-06-04T06:29:16+00:00'),
  ('01652b9e-4900-5402-ad59-4491c6e1ebd1', '2b1c8749-2f70-5be9-9d82-60139239e4c7', 'working', 2, 7, 0.0, 90, FALSE, '2026-06-04T06:31:47+00:00'),
  ('92ecb8b7-9822-55ca-ae5c-4f353a32340b', '2b1c8749-2f70-5be9-9d82-60139239e4c7', 'working', 3, 6, 0.0, 60, FALSE, '2026-06-04T06:33:45+00:00'),
  ('45c44d30-37d1-53a7-88be-a7108081457a', '2b1c8749-2f70-5be9-9d82-60139239e4c7', 'dropset', 4, 11, 0.0, 120, FALSE, '2026-06-04T06:36:58+00:00'),
  ('5e7a5b9e-0f66-5e5b-a346-e7377a6da7ee', '92ab75b2-6e8f-5cd4-bc9c-3c469581e08e', 'working', 1, 10, 30.0, 90, FALSE, '2026-06-04T06:39:38+00:00'),
  ('10d9dd35-c05e-559c-993e-e80492312f43', '92ab75b2-6e8f-5cd4-bc9c-3c469581e08e', 'working', 2, 10, 30.0, 60, FALSE, '2026-06-04T06:41:48+00:00'),
  ('5d1c61d3-287c-5f41-adae-6d475e6921de', '92ab75b2-6e8f-5cd4-bc9c-3c469581e08e', 'failure', 3, 10, 30.0, 150, FALSE, '2026-06-04T06:45:28+00:00'),
  ('00bd6aa8-3834-53f1-9b37-8a843854612c', 'a9c0f5ca-940e-5588-a919-ff767ee9c07b', 'working', 1, 15, 10.0, 120, FALSE, '2026-06-04T06:48:53+00:00'),
  ('806a9da1-f9fd-5c38-8d54-45424a9c19de', 'a9c0f5ca-940e-5588-a919-ff767ee9c07b', 'working', 2, 15, 10.0, 120, FALSE, '2026-06-04T06:52:18+00:00'),
  ('5b8c94b0-42bf-5da5-a8b6-96eab0ab4b1e', 'a9c0f5ca-940e-5588-a919-ff767ee9c07b', 'dropset', 3, 18, 7.5, 90, FALSE, '2026-06-04T06:55:22+00:00'),
  ('17d9a24b-7813-5220-8748-c92be3c69aa7', '04957a53-c896-5009-a305-53b88c300a49', 'working', 1, 10, 35.0, 90, FALSE, '2026-06-04T06:58:02+00:00'),
  ('684d9d5b-7302-53e3-a37b-c4c78a121c6e', '04957a53-c896-5009-a305-53b88c300a49', 'working', 2, 10, 35.0, 60, FALSE, '2026-06-04T07:00:12+00:00'),
  ('47eef427-e754-5c66-9cff-a76f8db2a06e', '04957a53-c896-5009-a305-53b88c300a49', 'failure', 3, 10, 35.0, 60, FALSE, '2026-06-04T07:02:22+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('4adc063f-109b-559c-ad3f-dbb4b42328fe', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-06-06T06:08:00+00:00', '2026-06-06T06:57:06+00:00', 2946, 11120.0, FALSE, 84.0, 'gym', 109);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d089e9b8-8f1a-5bae-bc83-3b18e80aa50e', '4adc063f-109b-559c-ad3f-dbb4b42328fe', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('65790113-0040-5fb1-a865-28b297500a44', '4adc063f-109b-559c-ad3f-dbb4b42328fe', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('c4e905ba-8ff8-5735-aeb9-1e00e5070ac4', '4adc063f-109b-559c-ad3f-dbb4b42328fe', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('4bd71126-5566-552e-b3ef-8283da62a026', '4adc063f-109b-559c-ad3f-dbb4b42328fe', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5e533007-ca6b-5c69-b187-1c3a5d25ee1c', 'd089e9b8-8f1a-5bae-bc83-3b18e80aa50e', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-06-06T06:14:49+00:00'),
  ('6f8a2a07-8afe-5f0e-adc1-54c463ec4ae4', 'd089e9b8-8f1a-5bae-bc83-3b18e80aa50e', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-06-06T06:16:29+00:00'),
  ('e98ce970-3291-5362-af60-31ba79287521', 'd089e9b8-8f1a-5bae-bc83-3b18e80aa50e', 'working', 3, 5, 150.0, 120, FALSE, '2026-06-06T06:19:24+00:00'),
  ('e4865659-e2a1-50f7-8e95-4854292486ee', 'd089e9b8-8f1a-5bae-bc83-3b18e80aa50e', 'working', 4, 5, 150.0, 150, FALSE, '2026-06-06T06:22:49+00:00'),
  ('b743120a-eaa1-5f5c-9be8-9d45ccc619df', 'd089e9b8-8f1a-5bae-bc83-3b18e80aa50e', 'working', 5, 4, 150.0, 90, FALSE, '2026-06-06T06:25:11+00:00'),
  ('1311db6e-44a3-5dd4-8fc3-1f1d317033ae', '65790113-0040-5fb1-a865-28b297500a44', 'working', 1, 8, 120.0, 60, FALSE, '2026-06-06T06:27:15+00:00'),
  ('21909791-009d-5f4b-827c-b23e6ecbc264', '65790113-0040-5fb1-a865-28b297500a44', 'working', 2, 8, 120.0, 150, FALSE, '2026-06-06T06:30:49+00:00'),
  ('b7cdb45b-3cfe-5e16-88ae-c8fc64d7b727', '65790113-0040-5fb1-a865-28b297500a44', 'failure', 3, 8, 120.0, 60, FALSE, '2026-06-06T06:32:53+00:00'),
  ('188e78bc-32cd-58e1-9954-03b6760fc005', 'c4e905ba-8ff8-5735-aeb9-1e00e5070ac4', 'working', 1, 8, 100.0, 150, FALSE, '2026-06-06T06:36:27+00:00'),
  ('c591ac72-6e7d-58f5-8d41-76dfc19ccfe3', 'c4e905ba-8ff8-5735-aeb9-1e00e5070ac4', 'working', 2, 8, 100.0, 120, FALSE, '2026-06-06T06:39:31+00:00'),
  ('a1d3c067-2f0d-52c6-9418-4e176e5bc368', 'c4e905ba-8ff8-5735-aeb9-1e00e5070ac4', 'working', 3, 7, 100.0, 150, FALSE, '2026-06-06T06:43:02+00:00'),
  ('170a090e-18da-5368-a04b-957396f24325', '4bd71126-5566-552e-b3ef-8283da62a026', 'working', 1, 12, 80.0, 150, FALSE, '2026-06-06T06:46:48+00:00'),
  ('6c7eb398-c207-51d6-974c-ebc7b8c76663', '4bd71126-5566-552e-b3ef-8283da62a026', 'working', 2, 12, 80.0, 90, FALSE, '2026-06-06T06:49:34+00:00'),
  ('5fcd2d1d-66e2-5d5c-b656-ecc2e0518ae7', '4bd71126-5566-552e-b3ef-8283da62a026', 'working', 3, 12, 80.0, 60, FALSE, '2026-06-06T06:51:50+00:00'),
  ('58def165-a8b8-5a65-a420-c94d187db208', '4bd71126-5566-552e-b3ef-8283da62a026', 'working', 4, 12, 80.0, 60, FALSE, '2026-06-06T06:54:06+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-06-08T06:13:00+00:00', '2026-06-08T07:20:49+00:00', 4069, 5250.0, FALSE, 84.0, 'gym', 127);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('bae665db-e3dc-5b5c-937b-0fb77aea321b', '89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('007d2080-f749-5be6-b8a1-4cc90211cd8e', '89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('f17d3049-9669-5c38-bd51-784385a9cb9c', '89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('159b3dbd-f845-5c27-8120-80899e057b39', '89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('65112498-9811-56c2-8a19-aa528b16f7c6', '89f33a3f-94ac-51f3-93b4-8f98cdd85b0c', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('16fd1c63-edef-5c8d-a148-de2ed509e34b', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-06-08T06:19:49+00:00'),
  ('6706ef1d-42e3-502b-8f63-bc45b43826ed', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-06-08T06:21:29+00:00'),
  ('002112a5-526d-5bd8-9dc6-ba7e6c40f6e7', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'working', 3, 5, 90.0, 150, FALSE, '2026-06-08T06:24:54+00:00'),
  ('a892d339-d655-5192-892c-00c02f4ca2be', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'working', 4, 5, 90.0, 90, FALSE, '2026-06-08T06:27:19+00:00'),
  ('838403fa-df40-5f7c-88d1-c9d5626f303e', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'working', 5, 5, 90.0, 150, FALSE, '2026-06-08T06:30:44+00:00'),
  ('6672f194-4a8e-5682-8cfb-25a3576594cd', 'bae665db-e3dc-5b5c-937b-0fb77aea321b', 'working', 6, 5, 90.0, 150, FALSE, '2026-06-08T06:34:09+00:00'),
  ('b593a163-e519-5d5a-8231-e7742651c2a6', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-06-08T06:35:58+00:00'),
  ('d5e672e3-d73b-5279-a820-49c89ca315ff', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'warmup', 2, 5, 60.0, NULL, FALSE, '2026-06-08T06:37:38+00:00'),
  ('76b8ce41-85ba-50aa-a876-2378aea2ea7d', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'working', 3, 6, 80.0, 150, FALSE, '2026-06-08T06:41:06+00:00'),
  ('6967ea7c-5336-5c3f-89e8-46370469999e', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'working', 4, 6, 80.0, 60, FALSE, '2026-06-08T06:43:04+00:00'),
  ('3356905c-6468-5300-b8a6-fed743cefab8', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'working', 5, 6, 80.0, 90, FALSE, '2026-06-08T06:45:32+00:00'),
  ('13780363-aacb-565c-9ea5-0135d81184b9', '007d2080-f749-5be6-b8a1-4cc90211cd8e', 'working', 6, 6, 80.0, 150, FALSE, '2026-06-08T06:49:00+00:00'),
  ('ed4c844b-84ff-5b4d-afa9-fdcdf9d71217', 'f17d3049-9669-5c38-bd51-784385a9cb9c', 'working', 1, 8, 30.0, 150, FALSE, '2026-06-08T06:52:34+00:00'),
  ('1f4d59f8-cf24-5e85-af6d-0cb5f965342e', 'f17d3049-9669-5c38-bd51-784385a9cb9c', 'working', 2, 8, 30.0, 150, FALSE, '2026-06-08T06:56:08+00:00'),
  ('7d710793-473b-5036-97ca-3c4d45d7cb4f', 'f17d3049-9669-5c38-bd51-784385a9cb9c', 'failure', 3, 7, 30.0, 90, FALSE, '2026-06-08T06:58:39+00:00'),
  ('7b6d511a-ae29-5f80-a206-cf79aa75a8b8', '159b3dbd-f845-5c27-8120-80899e057b39', 'working', 1, 9, 0.0, 90, FALSE, '2026-06-08T07:01:16+00:00'),
  ('11c5c359-d7fb-5b96-bb9f-38f80c576368', '159b3dbd-f845-5c27-8120-80899e057b39', 'working', 2, 8, 0.0, 90, FALSE, '2026-06-08T07:03:50+00:00'),
  ('e0d3224c-f742-5a51-90cd-5ecb7e895e79', '159b3dbd-f845-5c27-8120-80899e057b39', 'working', 3, 6, 0.0, 120, FALSE, '2026-06-08T07:06:48+00:00'),
  ('108e537a-a501-568c-87cb-52bbbcef6fef', '159b3dbd-f845-5c27-8120-80899e057b39', 'working', 4, 9, 0.0, 90, FALSE, '2026-06-08T07:09:25+00:00'),
  ('194cc836-9cb1-5cff-9fdd-0318542638b7', '65112498-9811-56c2-8a19-aa528b16f7c6', 'working', 1, 10, 30.0, 150, FALSE, '2026-06-08T07:13:05+00:00'),
  ('7a0f815f-6953-5dfb-9d8c-a94be29028b3', '65112498-9811-56c2-8a19-aa528b16f7c6', 'working', 2, 10, 30.0, 60, FALSE, '2026-06-08T07:15:15+00:00'),
  ('db0d74b4-6ce2-580f-9cae-61fb6ee429a1', '65112498-9811-56c2-8a19-aa528b16f7c6', 'failure', 3, 8, 30.0, 90, FALSE, '2026-06-08T07:17:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2dc39f51-741c-5afb-87cf-b3ada5cc9b75', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-06-09T06:35:00+00:00', '2026-06-09T07:32:19+00:00', 3439, 9835.0, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('ee5b0048-7750-5405-a9df-81eedbec22b5', '2dc39f51-741c-5afb-87cf-b3ada5cc9b75', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('6ae90888-90d8-5e5e-a3df-1ec1a47b4241', '2dc39f51-741c-5afb-87cf-b3ada5cc9b75', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('6176f4e7-81b1-5eff-b374-9c5abc05b490', '2dc39f51-741c-5afb-87cf-b3ada5cc9b75', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('febe1d7c-ef10-500f-8c37-36ff0b7c7fb5', '2dc39f51-741c-5afb-87cf-b3ada5cc9b75', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('a1d96e38-704b-59e4-acd8-24ef89f6f978', '2dc39f51-741c-5afb-87cf-b3ada5cc9b75', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a2c453c0-d08b-575a-9e74-0f98ea846a4d', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'warmup', 1, 8, 60.0, NULL, FALSE, '2026-06-09T06:41:49+00:00'),
  ('b2fd163b-464d-5475-88f8-2bfc03f04e5b', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'warmup', 2, 5, 90.0, NULL, FALSE, '2026-06-09T06:43:29+00:00'),
  ('2ee3dbb7-35c5-5b72-ae16-58ad8a72befc', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'working', 3, 5, 120.0, 120, FALSE, '2026-06-09T06:46:24+00:00'),
  ('b4192f13-0581-576a-bcc9-6ce9c3396dec', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'working', 4, 5, 120.0, 60, FALSE, '2026-06-09T06:48:19+00:00'),
  ('7f5b7ff9-932c-589d-8e00-5bedc3236b83', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'working', 5, 5, 120.0, 90, FALSE, '2026-06-09T06:50:44+00:00'),
  ('324f26f3-7917-5c23-93e3-c33e5aedf6f3', 'ee5b0048-7750-5405-a9df-81eedbec22b5', 'working', 6, 3, 120.0, 120, FALSE, '2026-06-09T06:53:33+00:00'),
  ('98a87c96-95df-5237-b34a-a4e0f4b0a5ea', '6ae90888-90d8-5e5e-a3df-1ec1a47b4241', 'working', 1, 8, 100.0, 120, FALSE, '2026-06-09T06:56:37+00:00'),
  ('8c65fbe0-9629-5339-a05a-17f66d1aef85', '6ae90888-90d8-5e5e-a3df-1ec1a47b4241', 'working', 2, 8, 100.0, 90, FALSE, '2026-06-09T06:59:11+00:00'),
  ('a8e35abe-6522-5d68-861c-9d1e00533554', '6ae90888-90d8-5e5e-a3df-1ec1a47b4241', 'dropset', 3, 11, 80.0, 90, FALSE, '2026-06-09T07:01:54+00:00'),
  ('4f2b011b-6c30-57ed-9fa5-8b6f7e836448', '6176f4e7-81b1-5eff-b374-9c5abc05b490', 'working', 1, 10, 45.0, 60, FALSE, '2026-06-09T07:04:04+00:00'),
  ('2b7761b8-f8f4-58f5-9dee-3366c8d3b33c', '6176f4e7-81b1-5eff-b374-9c5abc05b490', 'working', 2, 10, 45.0, 90, FALSE, '2026-06-09T07:06:44+00:00'),
  ('d67cd1ce-32a5-5d0e-bad4-f05572354eae', '6176f4e7-81b1-5eff-b374-9c5abc05b490', 'dropset', 3, 13, 35.0, 90, FALSE, '2026-06-09T07:09:33+00:00'),
  ('c9fce6d4-4a03-5b9f-b2c4-dbeeeb3a5dd6', 'febe1d7c-ef10-500f-8c37-36ff0b7c7fb5', 'working', 1, 12, 80.0, 90, FALSE, '2026-06-09T07:12:19+00:00'),
  ('a5b00f35-9bdc-51e7-bd07-377999fe5ef8', 'febe1d7c-ef10-500f-8c37-36ff0b7c7fb5', 'working', 2, 12, 80.0, 90, FALSE, '2026-06-09T07:15:05+00:00'),
  ('45d4cf0e-4a89-56cd-b174-74cb2cb8894b', 'febe1d7c-ef10-500f-8c37-36ff0b7c7fb5', 'working', 3, 12, 80.0, 120, FALSE, '2026-06-09T07:18:21+00:00'),
  ('191c1aae-91f0-5db3-8df1-6d13f662fcbb', 'febe1d7c-ef10-500f-8c37-36ff0b7c7fb5', 'working', 4, 12, 80.0, 90, FALSE, '2026-06-09T07:21:07+00:00'),
  ('40d990d2-30df-556a-bdfb-a502a9d1b3d3', 'a1d96e38-704b-59e4-acd8-24ef89f6f978', 'working', 1, 10, 0.0, 90, FALSE, '2026-06-09T07:23:47+00:00'),
  ('8c3fba0d-323a-5afd-890d-24657ecaa366', 'a1d96e38-704b-59e4-acd8-24ef89f6f978', 'working', 2, 12, 0.0, 90, FALSE, '2026-06-09T07:26:33+00:00'),
  ('6232ab04-9139-5107-97b1-daf5357d1ea0', 'a1d96e38-704b-59e4-acd8-24ef89f6f978', 'failure', 3, 12, 0.0, 90, FALSE, '2026-06-09T07:29:19+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-06-11T06:10:00+00:00', '2026-06-11T07:10:40+00:00', 3640, 3500.0, FALSE, 84.0, 'gym', 157);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('313b6e04-940b-59d5-b096-b1fc60aba58c', '6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('dde24521-4c8c-5322-bab5-91767ee9432b', '6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('f5e0d31f-9371-51aa-875d-2395cadc581b', '6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('682aeffe-ada6-56e2-87c2-641ef195b09f', '6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('fb562aa7-b469-52f2-8faa-5bef5d259570', '6d8c3ae2-3387-598c-86eb-45e4ce4e6ede', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('87b3e3bc-c378-5370-834b-be32af91e8e3', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'warmup', 1, 8, 27.5, NULL, FALSE, '2026-06-11T06:16:49+00:00'),
  ('9a82d89c-ea72-5bb5-9576-d77bdd106bac', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'warmup', 2, 5, 40.0, NULL, FALSE, '2026-06-11T06:18:29+00:00'),
  ('44de996b-8dd4-5472-9d54-4f0311330623', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'working', 3, 5, 55.0, 90, FALSE, '2026-06-11T06:20:54+00:00'),
  ('3eac4ac0-ddf1-553a-baf3-efe2bc02799e', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'working', 4, 5, 55.0, 90, FALSE, '2026-06-11T06:23:19+00:00'),
  ('960fe71e-0e59-55a9-bc98-874f0b5e2740', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'working', 5, 5, 55.0, 150, FALSE, '2026-06-11T06:26:44+00:00'),
  ('d52bf2d0-bc4e-5e34-86d7-8242fc09cb45', '313b6e04-940b-59d5-b096-b1fc60aba58c', 'working', 6, 5, 55.0, 90, FALSE, '2026-06-11T06:29:09+00:00'),
  ('245910bb-1f79-58aa-9b90-dae8f3cd5216', 'dde24521-4c8c-5322-bab5-91767ee9432b', 'working', 1, 7, 0.0, 90, FALSE, '2026-06-11T06:31:40+00:00'),
  ('23d2936a-bf14-5567-a372-6ba69dc5414f', 'dde24521-4c8c-5322-bab5-91767ee9432b', 'working', 2, 8, 0.0, 60, FALSE, '2026-06-11T06:33:44+00:00'),
  ('9416f0af-06fa-5db3-9ac6-fd31eb8fc32d', 'dde24521-4c8c-5322-bab5-91767ee9432b', 'working', 3, 9, 0.0, 120, FALSE, '2026-06-11T06:36:51+00:00'),
  ('2d83a5cd-85a8-5753-8fd6-1a8552ec1088', 'dde24521-4c8c-5322-bab5-91767ee9432b', 'working', 4, 8, 0.0, 120, FALSE, '2026-06-11T06:39:55+00:00'),
  ('c812dac6-707a-5e69-85bb-ab9aea4acd31', 'f5e0d31f-9371-51aa-875d-2395cadc581b', 'working', 1, 10, 30.0, 150, FALSE, '2026-06-11T06:43:35+00:00'),
  ('4b873802-e670-5610-903d-5ad43e1d80d6', 'f5e0d31f-9371-51aa-875d-2395cadc581b', 'working', 2, 10, 30.0, 90, FALSE, '2026-06-11T06:46:15+00:00'),
  ('3fdb295e-28cb-5130-86be-a6db4bc44c44', 'f5e0d31f-9371-51aa-875d-2395cadc581b', 'working', 3, 10, 30.0, 120, FALSE, '2026-06-11T06:49:25+00:00'),
  ('85c5b912-870c-5501-b4df-081d390dc3c3', '682aeffe-ada6-56e2-87c2-641ef195b09f', 'working', 1, 15, 10.0, 120, FALSE, '2026-06-11T06:52:50+00:00'),
  ('9f8a9b63-8a48-5764-ad2c-36ff94eef710', '682aeffe-ada6-56e2-87c2-641ef195b09f', 'working', 2, 15, 10.0, 150, FALSE, '2026-06-11T06:56:45+00:00'),
  ('b151a73a-8838-5906-8f9b-c4ca396ed994', '682aeffe-ada6-56e2-87c2-641ef195b09f', 'working', 3, 15, 10.0, 60, FALSE, '2026-06-11T06:59:10+00:00'),
  ('cca86c5b-b286-59d4-a2c6-c9e0cdb346f3', 'fb562aa7-b469-52f2-8faa-5bef5d259570', 'working', 1, 10, 35.0, 90, FALSE, '2026-06-11T07:01:50+00:00'),
  ('c84ff21c-d59b-58c0-bd60-95356595e090', 'fb562aa7-b469-52f2-8faa-5bef5d259570', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-11T07:04:30+00:00'),
  ('e8c67177-9615-5dd6-bb4e-35e884480a90', 'fb562aa7-b469-52f2-8faa-5bef5d259570', 'failure', 3, 10, 35.0, 120, FALSE, '2026-06-11T07:07:40+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('84b7c590-eee7-554c-8155-d76a6c03195d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-06-13T06:01:00+00:00', '2026-06-13T06:49:54+00:00', 2934, 11375.0, FALSE, 84.0, 'gym', 115);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9f10197a-de32-5a1d-9530-0d6019db95e8', '84b7c590-eee7-554c-8155-d76a6c03195d', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('c9846cb4-a4a7-599f-bd6d-becfe67dff37', '84b7c590-eee7-554c-8155-d76a6c03195d', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('ccdea918-aa0a-589a-88ab-02fed369731a', '84b7c590-eee7-554c-8155-d76a6c03195d', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('68a4e452-b364-5a74-aab1-85de9c79a488', '84b7c590-eee7-554c-8155-d76a6c03195d', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e651bb14-6c3d-5243-baa6-76abe5fa51fa', '9f10197a-de32-5a1d-9530-0d6019db95e8', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-06-13T06:07:49+00:00'),
  ('9696f23f-c6a5-5be0-adfd-04878ed3c287', '9f10197a-de32-5a1d-9530-0d6019db95e8', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-06-13T06:09:29+00:00'),
  ('5958a8aa-1393-521a-a722-96f174dd88ee', '9f10197a-de32-5a1d-9530-0d6019db95e8', 'working', 3, 5, 150.0, 150, FALSE, '2026-06-13T06:12:54+00:00'),
  ('5d2596b2-9342-5b02-8fc1-3a10776a1a72', '9f10197a-de32-5a1d-9530-0d6019db95e8', 'working', 4, 5, 150.0, 90, FALSE, '2026-06-13T06:15:19+00:00'),
  ('d46611e6-e129-59e0-a040-500862793108', '9f10197a-de32-5a1d-9530-0d6019db95e8', 'working', 5, 5, 150.0, 120, FALSE, '2026-06-13T06:18:14+00:00'),
  ('c2cecfff-87d3-526d-a54b-d89ef63b180a', 'c9846cb4-a4a7-599f-bd6d-becfe67dff37', 'working', 1, 8, 120.0, 120, FALSE, '2026-06-13T06:21:18+00:00'),
  ('3dc9c7b9-ac65-5cbf-bd0f-84dd57fe1dbc', 'c9846cb4-a4a7-599f-bd6d-becfe67dff37', 'working', 2, 8, 120.0, 60, FALSE, '2026-06-13T06:23:22+00:00'),
  ('15f28bbc-d60c-586a-ba4d-f3d19e5b0b43', 'c9846cb4-a4a7-599f-bd6d-becfe67dff37', 'dropset', 3, 11, 95.0, 150, FALSE, '2026-06-13T06:27:05+00:00'),
  ('6a8225d8-e9b1-5e61-a253-442b6e0941d0', 'ccdea918-aa0a-589a-88ab-02fed369731a', 'working', 1, 8, 100.0, 90, FALSE, '2026-06-13T06:29:39+00:00'),
  ('83ea7260-5a21-595e-82cf-889cc04613f7', 'ccdea918-aa0a-589a-88ab-02fed369731a', 'working', 2, 8, 100.0, 90, FALSE, '2026-06-13T06:32:13+00:00'),
  ('7828ac8a-12e4-5928-82de-e90daf2a403c', 'ccdea918-aa0a-589a-88ab-02fed369731a', 'dropset', 3, 11, 80.0, 90, FALSE, '2026-06-13T06:34:56+00:00'),
  ('5e00247c-69c5-5f1a-af01-a9d21bfc01cd', '68a4e452-b364-5a74-aab1-85de9c79a488', 'working', 1, 12, 80.0, 60, FALSE, '2026-06-13T06:37:12+00:00'),
  ('504388cc-26af-50de-b9e6-76269652cb4f', '68a4e452-b364-5a74-aab1-85de9c79a488', 'working', 2, 12, 80.0, 150, FALSE, '2026-06-13T06:40:58+00:00'),
  ('3fc74347-5c8f-56fd-a889-ff952d17fcc6', '68a4e452-b364-5a74-aab1-85de9c79a488', 'working', 3, 12, 80.0, 90, FALSE, '2026-06-13T06:43:44+00:00'),
  ('191582cf-89a7-5081-b17a-d66cffd5f133', '68a4e452-b364-5a74-aab1-85de9c79a488', 'working', 4, 10, 80.0, 120, FALSE, '2026-06-13T06:46:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('532a903d-5bbf-56f2-b5bb-1b8471f364a9', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-06-15T06:28:00+00:00', '2026-06-15T07:29:55+00:00', 3715, 5388.0, FALSE, 84.0, 'gym', 129);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8434b6db-17fe-5fee-8eae-6997fcc54029', '532a903d-5bbf-56f2-b5bb-1b8471f364a9', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a28dc234-1d28-5ac6-8fc1-d18007e6b96a', '532a903d-5bbf-56f2-b5bb-1b8471f364a9', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('0b7c7000-320f-5d50-a120-8a2445b8a9bf', '532a903d-5bbf-56f2-b5bb-1b8471f364a9', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('1f2b583b-0e04-5e23-8631-1a4d27a4b322', '532a903d-5bbf-56f2-b5bb-1b8471f364a9', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('c5f2ed06-4751-5bdb-9163-b3ec4df84cff', '532a903d-5bbf-56f2-b5bb-1b8471f364a9', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('9c6898e2-696c-556a-b30a-c6236d151ebe', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-06-15T06:34:49+00:00'),
  ('8cbacd5d-7556-5aef-9a90-90ec81648dee', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-06-15T06:36:29+00:00'),
  ('70cd178a-2c32-5ba5-80a0-e325b66e7606', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'working', 3, 5, 90.0, 60, FALSE, '2026-06-15T06:38:24+00:00'),
  ('f8ac0fc2-ba1e-52a9-b284-733a4d48f04b', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'working', 4, 5, 90.0, 60, FALSE, '2026-06-15T06:40:19+00:00'),
  ('a39b77c6-6d57-54da-a07f-da6b31646c5b', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'working', 5, 5, 90.0, 60, FALSE, '2026-06-15T06:42:14+00:00'),
  ('630e6f18-e399-51c3-a9c7-a60db08e3063', '8434b6db-17fe-5fee-8eae-6997fcc54029', 'working', 6, 5, 90.0, 90, FALSE, '2026-06-15T06:44:39+00:00'),
  ('e320afe6-7659-56d7-ab60-ceed44ab6b4a', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-06-15T06:46:28+00:00'),
  ('2ac8081c-e7ad-550e-8615-b9c37cca31d2', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'warmup', 2, 5, 60.0, NULL, FALSE, '2026-06-15T06:48:08+00:00'),
  ('2f93d1e8-dc53-5ef7-90c5-16583af9d740', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'working', 3, 6, 80.0, 60, FALSE, '2026-06-15T06:50:06+00:00'),
  ('06ed126e-73ff-56ad-8b82-a7c60caa9968', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'working', 4, 6, 80.0, 90, FALSE, '2026-06-15T06:52:34+00:00'),
  ('3a394430-26e2-55eb-8eec-e65041621eaf', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'working', 5, 6, 80.0, 90, FALSE, '2026-06-15T06:55:02+00:00'),
  ('899f7c94-ff3d-5614-a289-f8bc62916153', 'a28dc234-1d28-5ac6-8fc1-d18007e6b96a', 'working', 6, 6, 80.0, 150, FALSE, '2026-06-15T06:58:30+00:00'),
  ('64161c17-40bd-5150-b4f9-19a1fa01a694', '0b7c7000-320f-5d50-a120-8a2445b8a9bf', 'working', 1, 8, 32.0, 150, FALSE, '2026-06-15T07:02:04+00:00'),
  ('d7685af1-be2b-5f1d-a018-79f58540ae10', '0b7c7000-320f-5d50-a120-8a2445b8a9bf', 'working', 2, 8, 32.0, 90, FALSE, '2026-06-15T07:04:38+00:00'),
  ('53d8c8d8-fe31-5d56-9ea7-50517456f6ba', '0b7c7000-320f-5d50-a120-8a2445b8a9bf', 'failure', 3, 8, 32.0, 120, FALSE, '2026-06-15T07:07:42+00:00'),
  ('586cbbe0-54d6-5f5a-8778-f811fcb3a565', '1f2b583b-0e04-5e23-8631-1a4d27a4b322', 'working', 1, 8, 0.0, 90, FALSE, '2026-06-15T07:10:16+00:00'),
  ('d152ea3d-4f4f-53cb-ab7e-4626c1f875ea', '1f2b583b-0e04-5e23-8631-1a4d27a4b322', 'working', 2, 9, 0.0, 120, FALSE, '2026-06-15T07:13:23+00:00'),
  ('1c6fb14b-024a-563e-91e3-cfa90df02a8a', '1f2b583b-0e04-5e23-8631-1a4d27a4b322', 'working', 3, 8, 0.0, 60, FALSE, '2026-06-15T07:15:27+00:00'),
  ('2be80437-ee97-59f1-8547-859284ed45df', '1f2b583b-0e04-5e23-8631-1a4d27a4b322', 'failure', 4, 6, 0.0, 90, FALSE, '2026-06-15T07:17:55+00:00'),
  ('7cb5be51-e358-5a43-892d-58c2f4bdf042', 'c5f2ed06-4751-5bdb-9163-b3ec4df84cff', 'working', 1, 10, 30.0, 120, FALSE, '2026-06-15T07:21:05+00:00'),
  ('e5dca1cc-a64e-5af3-9407-82d85efe48a1', 'c5f2ed06-4751-5bdb-9163-b3ec4df84cff', 'working', 2, 10, 30.0, 90, FALSE, '2026-06-15T07:23:45+00:00'),
  ('2b390c91-9514-5a4f-a064-13a349b228e6', 'c5f2ed06-4751-5bdb-9163-b3ec4df84cff', 'working', 3, 10, 30.0, 120, FALSE, '2026-06-15T07:26:55+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('8612ccbf-88ee-5e42-a809-23bf163c40ed', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-06-16T06:14:00+00:00', '2026-06-16T07:13:49+00:00', 3589, 10000.0, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b896a18a-e39d-5077-b6ec-c6d877e291e0', '8612ccbf-88ee-5e42-a809-23bf163c40ed', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('efc87be1-9786-555c-977f-feb38f041acc', '8612ccbf-88ee-5e42-a809-23bf163c40ed', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('6a134f84-e20e-51a4-b52e-e3997be1c532', '8612ccbf-88ee-5e42-a809-23bf163c40ed', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('8dc961e9-ce46-5410-90e5-21e8489bb22e', '8612ccbf-88ee-5e42-a809-23bf163c40ed', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('0201f0d7-62d8-5c9e-9e0b-1857c0742763', '8612ccbf-88ee-5e42-a809-23bf163c40ed', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1610571f-eb75-568d-a190-b7cc3afb0e02', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'warmup', 1, 8, 60.0, NULL, FALSE, '2026-06-16T06:20:49+00:00'),
  ('fd70bb52-2051-5f02-a4a5-a5d2d258c421', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'warmup', 2, 5, 92.5, NULL, FALSE, '2026-06-16T06:22:29+00:00'),
  ('0640f43b-79c3-5c63-8faf-10b23160944e', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'working', 3, 5, 122.5, 60, FALSE, '2026-06-16T06:24:24+00:00'),
  ('5dd408c5-ca82-54c8-9d53-7a1f0250b6c5', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'working', 4, 5, 122.5, 150, FALSE, '2026-06-16T06:27:49+00:00'),
  ('d0cc2e13-ab65-5b91-a324-8aa45c95ba5a', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'working', 5, 5, 122.5, 120, FALSE, '2026-06-16T06:30:44+00:00'),
  ('5fc709d1-6a0b-57f3-8233-77f550f89977', 'b896a18a-e39d-5077-b6ec-c6d877e291e0', 'working', 6, 5, 122.5, 150, FALSE, '2026-06-16T06:34:09+00:00'),
  ('83ea2c26-ac5b-546a-b6cf-9a97d18986d2', 'efc87be1-9786-555c-977f-feb38f041acc', 'working', 1, 8, 100.0, 90, FALSE, '2026-06-16T06:36:43+00:00'),
  ('b3cb024f-6fb2-510e-bc8f-3c87172a7e37', 'efc87be1-9786-555c-977f-feb38f041acc', 'working', 2, 8, 100.0, 90, FALSE, '2026-06-16T06:39:17+00:00'),
  ('60e675ce-1bc2-54f0-9a5a-8b37bce7bf70', 'efc87be1-9786-555c-977f-feb38f041acc', 'working', 3, 6, 100.0, 120, FALSE, '2026-06-16T06:42:15+00:00'),
  ('b9cebe81-4a06-5615-a84e-5b19f4184a89', '6a134f84-e20e-51a4-b52e-e3997be1c532', 'working', 1, 10, 45.0, 60, FALSE, '2026-06-16T06:44:25+00:00'),
  ('f25df13b-e846-5947-b25d-7193fc2db9d9', '6a134f84-e20e-51a4-b52e-e3997be1c532', 'working', 2, 10, 45.0, 90, FALSE, '2026-06-16T06:47:05+00:00'),
  ('580aea1b-3530-543a-9c05-f41fa1de4c87', '6a134f84-e20e-51a4-b52e-e3997be1c532', 'dropset', 3, 13, 35.0, 120, FALSE, '2026-06-16T06:50:24+00:00'),
  ('04060c43-ebba-51b3-b092-477287048cb1', '8dc961e9-ce46-5410-90e5-21e8489bb22e', 'working', 1, 12, 85.0, 60, FALSE, '2026-06-16T06:52:40+00:00'),
  ('0303e2a8-7c91-53e4-8d18-c19389ebc57a', '8dc961e9-ce46-5410-90e5-21e8489bb22e', 'working', 2, 12, 85.0, 150, FALSE, '2026-06-16T06:56:26+00:00'),
  ('5b2f8e47-dec2-57c9-9560-11b0e84f2188', '8dc961e9-ce46-5410-90e5-21e8489bb22e', 'working', 3, 12, 85.0, 60, FALSE, '2026-06-16T06:58:42+00:00'),
  ('3e11e4e4-f3e7-5984-a82b-3005d30f455c', '8dc961e9-ce46-5410-90e5-21e8489bb22e', 'failure', 4, 11, 85.0, 120, FALSE, '2026-06-16T07:01:55+00:00'),
  ('a30001b4-7fa9-5197-b634-b247f613c858', '0201f0d7-62d8-5c9e-9e0b-1857c0742763', 'working', 1, 10, 0.0, 90, FALSE, '2026-06-16T07:04:35+00:00'),
  ('8e650579-bb29-53cf-98ad-35bcc258446b', '0201f0d7-62d8-5c9e-9e0b-1857c0742763', 'working', 2, 13, 0.0, 120, FALSE, '2026-06-16T07:07:54+00:00'),
  ('974c292c-64f4-5343-917b-ef50470fd202', '0201f0d7-62d8-5c9e-9e0b-1857c0742763', 'dropset', 3, 15, 0.0, 90, FALSE, '2026-06-16T07:10:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('5047c1a6-ed15-5b33-abdb-e5a976873b82', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-06-18T06:04:00+00:00', '2026-06-18T07:02:28+00:00', 3508, 3450.0, FALSE, 84.0, 'gym', 153);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('c45bb24f-31ee-5825-bb52-c23dec2268a6', '5047c1a6-ed15-5b33-abdb-e5a976873b82', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('bd42d925-38e0-58e2-b5ab-a6ce43ed6dd4', '5047c1a6-ed15-5b33-abdb-e5a976873b82', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('f0e42bab-eb06-59f1-b451-2dcaceb4a29f', '5047c1a6-ed15-5b33-abdb-e5a976873b82', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('e1d1735b-fa6b-50ef-8758-eba698d4ed93', '5047c1a6-ed15-5b33-abdb-e5a976873b82', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('9cdf674b-7bf3-5dac-ab41-012babb1da9f', '5047c1a6-ed15-5b33-abdb-e5a976873b82', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('92bb7990-fedd-556f-8666-d8acd7d7ef83', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'warmup', 1, 8, 27.5, NULL, FALSE, '2026-06-18T06:10:49+00:00'),
  ('8f3bfe51-693f-5cbe-a36c-7feef3eebbf2', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'warmup', 2, 5, 40.0, NULL, FALSE, '2026-06-18T06:12:29+00:00'),
  ('761baf1f-de89-51dd-b1d3-f8024e14b585', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'working', 3, 5, 55.0, 120, FALSE, '2026-06-18T06:15:24+00:00'),
  ('e4e8d7af-4dbe-515f-825c-04d2b4e0af25', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'working', 4, 5, 55.0, 90, FALSE, '2026-06-18T06:17:49+00:00'),
  ('89c7e755-48a7-5ae7-a157-8a6fbcb7bd7a', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'working', 5, 5, 55.0, 60, FALSE, '2026-06-18T06:19:44+00:00'),
  ('03e99cb2-c4e3-5dc9-9778-e2e7ec2f9cf1', 'c45bb24f-31ee-5825-bb52-c23dec2268a6', 'working', 6, 3, 55.0, 150, FALSE, '2026-06-18T06:23:03+00:00'),
  ('4f75cc15-28eb-5d8f-b925-51a733b66e3e', 'bd42d925-38e0-58e2-b5ab-a6ce43ed6dd4', 'working', 1, 6, 0.0, 150, FALSE, '2026-06-18T06:26:31+00:00'),
  ('03118701-1dd4-57d1-bd8a-50210195a444', 'bd42d925-38e0-58e2-b5ab-a6ce43ed6dd4', 'working', 2, 8, 0.0, 60, FALSE, '2026-06-18T06:28:35+00:00'),
  ('12e343b7-c5d3-5ed8-82cb-c875a90bd13a', 'bd42d925-38e0-58e2-b5ab-a6ce43ed6dd4', 'working', 3, 8, 0.0, 60, FALSE, '2026-06-18T06:30:39+00:00'),
  ('6b4ea8e4-7648-54cc-a665-7ed49f0b72c0', 'bd42d925-38e0-58e2-b5ab-a6ce43ed6dd4', 'failure', 4, 8, 0.0, 60, FALSE, '2026-06-18T06:32:43+00:00'),
  ('055e1f81-6c8c-56f3-8a86-ba6bf3bf2de5', 'f0e42bab-eb06-59f1-b451-2dcaceb4a29f', 'working', 1, 10, 32.0, 90, FALSE, '2026-06-18T06:35:23+00:00'),
  ('1f86fd76-9b36-5f64-9703-a7b08d96553e', 'f0e42bab-eb06-59f1-b451-2dcaceb4a29f', 'working', 2, 10, 32.0, 150, FALSE, '2026-06-18T06:39:03+00:00'),
  ('d30d4a29-9007-5829-bc48-72cbb5436a33', 'f0e42bab-eb06-59f1-b451-2dcaceb4a29f', 'working', 3, 10, 32.0, 90, FALSE, '2026-06-18T06:41:43+00:00'),
  ('95ffedc0-824b-5aa0-bf69-ce8a44777cdf', 'e1d1735b-fa6b-50ef-8758-eba698d4ed93', 'working', 1, 15, 10.0, 150, FALSE, '2026-06-18T06:45:38+00:00'),
  ('2eb6a763-dd6b-5adb-8c86-b2864f752d71', 'e1d1735b-fa6b-50ef-8758-eba698d4ed93', 'working', 2, 15, 10.0, 90, FALSE, '2026-06-18T06:48:33+00:00'),
  ('5850ce80-d3ef-530c-b306-5342d434ce53', 'e1d1735b-fa6b-50ef-8758-eba698d4ed93', 'failure', 3, 15, 10.0, 60, FALSE, '2026-06-18T06:50:58+00:00'),
  ('ca9ccd57-f5e0-512a-a17e-d7ba1d913454', '9cdf674b-7bf3-5dac-ab41-012babb1da9f', 'working', 1, 10, 35.0, 120, FALSE, '2026-06-18T06:54:08+00:00'),
  ('d13e514b-7b22-5296-8143-ef1910c72277', '9cdf674b-7bf3-5dac-ab41-012babb1da9f', 'working', 2, 10, 35.0, 90, FALSE, '2026-06-18T06:56:48+00:00'),
  ('7f58f487-263c-5de5-b2ec-0f62f4d5777d', '9cdf674b-7bf3-5dac-ab41-012babb1da9f', 'working', 3, 10, 35.0, 90, FALSE, '2026-06-18T06:59:28+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('438c1c3a-d77b-5b7d-9e30-db969a29ddb6', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-06-20T06:33:00+00:00', '2026-06-20T07:20:12+00:00', 2832, 11375.0, FALSE, 84.0, 'gym', 111);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9d31b12b-fc7f-5926-9757-5f8d76c59802', '438c1c3a-d77b-5b7d-9e30-db969a29ddb6', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('146910f7-e7e5-5eae-b7f5-7a741aceda32', '438c1c3a-d77b-5b7d-9e30-db969a29ddb6', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('2cdd730e-e7c3-5e07-ac51-8de4f0af0df0', '438c1c3a-d77b-5b7d-9e30-db969a29ddb6', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('a9168ccb-4c4e-5488-b775-8b5d2e259186', '438c1c3a-d77b-5b7d-9e30-db969a29ddb6', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('3540c209-fda7-560b-b0aa-1443688db238', '9d31b12b-fc7f-5926-9757-5f8d76c59802', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-06-20T06:39:49+00:00'),
  ('b7dd5dcb-14bd-5f5f-b023-001767f6ba1b', '9d31b12b-fc7f-5926-9757-5f8d76c59802', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-06-20T06:41:29+00:00'),
  ('acf0b4c2-f82e-5e03-9c94-7f6b4f57d0f4', '9d31b12b-fc7f-5926-9757-5f8d76c59802', 'working', 3, 5, 150.0, 120, FALSE, '2026-06-20T06:44:24+00:00'),
  ('b4d897ce-7e57-51c6-9d16-519e9b85079e', '9d31b12b-fc7f-5926-9757-5f8d76c59802', 'working', 4, 5, 150.0, 90, FALSE, '2026-06-20T06:46:49+00:00'),
  ('ff5f0520-4937-5411-863f-73d8af8ba25a', '9d31b12b-fc7f-5926-9757-5f8d76c59802', 'working', 5, 3, 150.0, 90, FALSE, '2026-06-20T06:49:08+00:00'),
  ('ef96e9a9-6400-5e98-b256-04ec6eb40d0e', '146910f7-e7e5-5eae-b7f5-7a741aceda32', 'working', 1, 8, 120.0, 60, FALSE, '2026-06-20T06:51:12+00:00'),
  ('ed157357-b39a-53e9-a728-d26966cb1ccf', '146910f7-e7e5-5eae-b7f5-7a741aceda32', 'working', 2, 8, 120.0, 60, FALSE, '2026-06-20T06:53:16+00:00'),
  ('98da02c2-dbc2-5ff0-b38a-836ea7d89864', '146910f7-e7e5-5eae-b7f5-7a741aceda32', 'failure', 3, 8, 120.0, 90, FALSE, '2026-06-20T06:55:50+00:00'),
  ('4c78ca29-383f-54ef-a0f8-93c809192a68', '2cdd730e-e7c3-5e07-ac51-8de4f0af0df0', 'working', 1, 8, 102.5, 120, FALSE, '2026-06-20T06:58:54+00:00'),
  ('9d5b61a4-a22c-57c1-ae18-663983485827', '2cdd730e-e7c3-5e07-ac51-8de4f0af0df0', 'working', 2, 8, 102.5, 90, FALSE, '2026-06-20T07:01:28+00:00'),
  ('3ab4ed81-b6e8-551d-a1cf-f3acaa73cd43', '2cdd730e-e7c3-5e07-ac51-8de4f0af0df0', 'dropset', 3, 10, 82.5, 90, FALSE, '2026-06-20T07:04:08+00:00'),
  ('8d8aa578-ca59-5601-aa1b-3a67122d5468', 'a9168ccb-4c4e-5488-b775-8b5d2e259186', 'working', 1, 12, 85.0, 90, FALSE, '2026-06-20T07:06:54+00:00'),
  ('320acca1-67f4-5d5f-8163-547de84bb9ff', 'a9168ccb-4c4e-5488-b775-8b5d2e259186', 'working', 2, 12, 85.0, 120, FALSE, '2026-06-20T07:10:10+00:00'),
  ('10789cd2-4d58-5ed3-b8ea-2f2cc44b7dcf', 'a9168ccb-4c4e-5488-b775-8b5d2e259186', 'working', 3, 12, 85.0, 150, FALSE, '2026-06-20T07:13:56+00:00'),
  ('8c00b56d-5b35-5b4d-9ab4-d7569cb52eef', 'a9168ccb-4c4e-5488-b775-8b5d2e259186', 'failure', 4, 12, 85.0, 120, FALSE, '2026-06-20T07:17:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('97c25403-643b-5fc8-bd59-42a9d1e0dc4c', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-06-22T06:12:00+00:00', '2026-06-22T07:17:16+00:00', 3916, 5443.0, FALSE, 84.0, 'gym', 136);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('a7ecc643-5a49-5dbb-9eb5-b9d41371a040', '97c25403-643b-5fc8-bd59-42a9d1e0dc4c', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('be8e1dd6-8367-5222-a18d-e37c95d7d243', '97c25403-643b-5fc8-bd59-42a9d1e0dc4c', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('1b1b8d8d-fb72-526b-843c-27543a320ec5', '97c25403-643b-5fc8-bd59-42a9d1e0dc4c', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('9023da2d-748f-57f2-9ef9-d0fa8bdf323a', '97c25403-643b-5fc8-bd59-42a9d1e0dc4c', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('b3becb95-ea41-5bb7-9935-4225ebd27b84', '97c25403-643b-5fc8-bd59-42a9d1e0dc4c', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f21cc392-3cef-5b9c-a2c2-5493dca70180', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-06-22T06:18:49+00:00'),
  ('cac036ad-330a-59ca-b4ca-c2ad6c5810d9', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-06-22T06:20:29+00:00'),
  ('bfbf420c-12ed-5205-aa9b-5e64d23373be', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'working', 3, 5, 90.0, 150, FALSE, '2026-06-22T06:23:54+00:00'),
  ('fe84b808-90bb-5777-a639-2b751882255e', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'working', 4, 5, 90.0, 60, FALSE, '2026-06-22T06:25:49+00:00'),
  ('41d27bfd-e9f4-5d24-9f4f-ca4e98c40aa9', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'working', 5, 5, 90.0, 60, FALSE, '2026-06-22T06:27:44+00:00'),
  ('83d3de09-2df7-5c61-8f96-f943a87a88cb', 'a7ecc643-5a49-5dbb-9eb5-b9d41371a040', 'working', 6, 5, 90.0, 90, FALSE, '2026-06-22T06:30:09+00:00'),
  ('304b61c1-460b-53c9-b813-3160895217c9', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-06-22T06:31:58+00:00'),
  ('40ad5816-952c-5de1-b0d5-a7f856bc3e8b', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'warmup', 2, 5, 60.0, NULL, FALSE, '2026-06-22T06:33:38+00:00'),
  ('bd9c8648-fea2-59cf-8bd1-ef20bff47fe0', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'working', 3, 6, 80.0, 120, FALSE, '2026-06-22T06:36:36+00:00'),
  ('58a28fc0-feee-54a0-9427-21fbc5e59c37', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'working', 4, 6, 80.0, 90, FALSE, '2026-06-22T06:39:04+00:00'),
  ('14d1513b-8850-51e0-b4a4-136ed82e0953', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'working', 5, 6, 80.0, 90, FALSE, '2026-06-22T06:41:32+00:00'),
  ('8853a91e-3867-54b6-b5be-715031db62a0', 'be8e1dd6-8367-5222-a18d-e37c95d7d243', 'working', 6, 6, 80.0, 120, FALSE, '2026-06-22T06:44:30+00:00'),
  ('06d6ad01-3baf-5afa-9123-31d103d96321', '1b1b8d8d-fb72-526b-843c-27543a320ec5', 'working', 1, 8, 32.0, 150, FALSE, '2026-06-22T06:48:04+00:00'),
  ('d539ceea-09c8-5ed5-9334-c998e39bb26a', '1b1b8d8d-fb72-526b-843c-27543a320ec5', 'working', 2, 8, 32.0, 60, FALSE, '2026-06-22T06:50:08+00:00'),
  ('518288ae-32b1-51e1-a89f-ca3b34bc5a43', '1b1b8d8d-fb72-526b-843c-27543a320ec5', 'dropset', 3, 11, 26.0, 120, FALSE, '2026-06-22T06:53:21+00:00'),
  ('f81e158b-d0e6-5149-b91d-a2eba56963c0', '9023da2d-748f-57f2-9ef9-d0fa8bdf323a', 'working', 1, 8, 0.0, 90, FALSE, '2026-06-22T06:55:55+00:00'),
  ('6dbce5e8-b3fd-5bed-9e94-c40b750a8cb8', '9023da2d-748f-57f2-9ef9-d0fa8bdf323a', 'working', 2, 10, 0.0, 90, FALSE, '2026-06-22T06:58:35+00:00'),
  ('a8794e3b-9d45-5ea3-a2c4-3bfe2832e3b0', '9023da2d-748f-57f2-9ef9-d0fa8bdf323a', 'working', 3, 7, 0.0, 120, FALSE, '2026-06-22T07:01:36+00:00'),
  ('b6859db3-229a-5aa8-88b5-2f57a2731817', '9023da2d-748f-57f2-9ef9-d0fa8bdf323a', 'working', 4, 7, 0.0, 150, FALSE, '2026-06-22T07:05:07+00:00'),
  ('aa13edc5-ea38-5bbb-9504-8722c5966ee1', 'b3becb95-ea41-5bb7-9935-4225ebd27b84', 'working', 1, 10, 30.0, 90, FALSE, '2026-06-22T07:07:47+00:00'),
  ('b104a374-0253-5d03-9f48-5074aee1aae7', 'b3becb95-ea41-5bb7-9935-4225ebd27b84', 'working', 2, 10, 30.0, 90, FALSE, '2026-06-22T07:10:27+00:00'),
  ('bead44ac-a2b3-5f92-bec3-33872d08d3b6', 'b3becb95-ea41-5bb7-9935-4225ebd27b84', 'dropset', 3, 13, 25.0, 150, FALSE, '2026-06-22T07:14:16+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('59e036dc-6343-566e-a080-d11e9507cb65', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-06-23T06:39:00+00:00', '2026-06-23T07:39:31+00:00', 3631, 10160.0, FALSE, 84.0, 'gym', 154);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b927af09-cc9f-5747-9c89-a6d097a216f3', '59e036dc-6343-566e-a080-d11e9507cb65', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('f71cd664-e2e9-5182-8906-899e57b9f0b8', '59e036dc-6343-566e-a080-d11e9507cb65', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('db274791-5de3-58aa-8ac9-ef13ce96640c', '59e036dc-6343-566e-a080-d11e9507cb65', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('33c94c34-bf8b-5c18-8afc-cef07663ecd0', '59e036dc-6343-566e-a080-d11e9507cb65', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('ea25d3a1-6495-5961-a0d2-ad570cfe940b', '59e036dc-6343-566e-a080-d11e9507cb65', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('97044094-bf48-5b74-b843-640e6e45e019', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'warmup', 1, 8, 62.5, NULL, FALSE, '2026-06-23T06:45:49+00:00'),
  ('9d78642d-e0ca-55a6-b92e-32651f5f0da8', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'warmup', 2, 5, 95.0, NULL, FALSE, '2026-06-23T06:47:29+00:00'),
  ('6433f6e1-97ac-5233-957e-fe6a44192989', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'working', 3, 5, 125.0, 90, FALSE, '2026-06-23T06:49:54+00:00'),
  ('bb040788-959a-51f9-bd42-d4397c3871c4', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'working', 4, 5, 125.0, 150, FALSE, '2026-06-23T06:53:19+00:00'),
  ('3ca35aad-efa9-53d7-af03-d97831963961', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'working', 5, 5, 125.0, 60, FALSE, '2026-06-23T06:55:14+00:00'),
  ('c4d79ea8-1b18-59e3-b58a-3eb8e475e937', 'b927af09-cc9f-5747-9c89-a6d097a216f3', 'working', 6, 5, 125.0, 90, FALSE, '2026-06-23T06:57:39+00:00'),
  ('0a5885c0-1b80-593a-8f5d-ab69b439f6f6', 'f71cd664-e2e9-5182-8906-899e57b9f0b8', 'working', 1, 8, 100.0, 60, FALSE, '2026-06-23T06:59:43+00:00'),
  ('ed42b153-2ce8-5f1f-afd6-148808771d5b', 'f71cd664-e2e9-5182-8906-899e57b9f0b8', 'working', 2, 8, 100.0, 90, FALSE, '2026-06-23T07:02:17+00:00'),
  ('bf9bfac4-4319-554e-9fe6-3bf8e21f7f4e', 'f71cd664-e2e9-5182-8906-899e57b9f0b8', 'failure', 3, 8, 100.0, 150, FALSE, '2026-06-23T07:05:51+00:00'),
  ('ad02dab1-8e1f-5055-a07e-f1c9e76034e9', 'db274791-5de3-58aa-8ac9-ef13ce96640c', 'working', 1, 10, 45.0, 150, FALSE, '2026-06-23T07:09:31+00:00'),
  ('b8c802ef-ffd1-5ef8-bdbf-b3f67d384beb', 'db274791-5de3-58aa-8ac9-ef13ce96640c', 'working', 2, 10, 45.0, 90, FALSE, '2026-06-23T07:12:11+00:00'),
  ('275ee629-e933-5aed-9556-65a20f27e57b', 'db274791-5de3-58aa-8ac9-ef13ce96640c', 'failure', 3, 10, 45.0, 120, FALSE, '2026-06-23T07:15:21+00:00'),
  ('25723d32-cf8d-59c3-a38d-ce2c3a649efd', '33c94c34-bf8b-5c18-8afc-cef07663ecd0', 'working', 1, 12, 85.0, 60, FALSE, '2026-06-23T07:17:37+00:00'),
  ('4816c9aa-d2e2-5ee7-907c-62fb6ce623f2', '33c94c34-bf8b-5c18-8afc-cef07663ecd0', 'working', 2, 12, 85.0, 150, FALSE, '2026-06-23T07:21:23+00:00'),
  ('de3c7f02-e071-548e-803d-3f80d16cab75', '33c94c34-bf8b-5c18-8afc-cef07663ecd0', 'working', 3, 12, 85.0, 120, FALSE, '2026-06-23T07:24:39+00:00'),
  ('06c3001a-879e-5241-916d-5bf03b64c5fc', '33c94c34-bf8b-5c18-8afc-cef07663ecd0', 'working', 4, 10, 85.0, 90, FALSE, '2026-06-23T07:27:19+00:00'),
  ('6dc6d0f3-b540-561d-8ac8-0e9fed02f561', 'ea25d3a1-6495-5961-a0d2-ad570cfe940b', 'working', 1, 10, 0.0, 120, FALSE, '2026-06-23T07:30:29+00:00'),
  ('0ee605a6-ba14-5964-92b2-42542bd05de1', 'ea25d3a1-6495-5961-a0d2-ad570cfe940b', 'working', 2, 11, 0.0, 60, FALSE, '2026-06-23T07:32:42+00:00'),
  ('1801ac8d-69ad-5726-a4fe-03bf37c3dafe', 'ea25d3a1-6495-5961-a0d2-ad570cfe940b', 'working', 3, 13, 0.0, 150, FALSE, '2026-06-23T07:36:31+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-06-25T06:20:00+00:00', '2026-06-25T07:19:58+00:00', 3598, 3442.5, FALSE, 84.0, 'gym', 163);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('18878f4b-112b-5f40-9eb2-b54e3db53cbc', 'e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('70925ad0-4c63-5317-bc89-344441e177ef', 'e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('aa3a6ec5-2b8b-55ec-aea3-2f0cb6db2840', 'e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('a174d252-afc3-563a-81ae-06e3e1d4e515', 'e10abc7d-e8e0-543c-a38c-6e0bd2bbf673', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8d123887-559f-5893-9bb6-047d88cff578', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'warmup', 1, 8, 27.5, NULL, FALSE, '2026-06-25T06:26:49+00:00'),
  ('79cd8037-3a37-5cb4-9ece-4c4dc6feca1b', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'warmup', 2, 5, 40.0, NULL, FALSE, '2026-06-25T06:28:29+00:00'),
  ('58a30df8-1b19-536b-814f-1bd9d49b7130', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'working', 3, 5, 55.0, 150, FALSE, '2026-06-25T06:31:54+00:00'),
  ('7e565ad1-9312-5953-811c-4d4a14040257', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'working', 4, 5, 55.0, 120, FALSE, '2026-06-25T06:34:49+00:00'),
  ('072cffe2-f92e-5646-90db-ca44af43b1d2', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'working', 5, 5, 55.0, 60, FALSE, '2026-06-25T06:36:44+00:00'),
  ('7af6f057-f87b-5c81-b380-d5dc3f7ddd95', '2ec642c3-88b9-50f2-b4ef-8776eb515e98', 'working', 6, 3, 55.0, 150, FALSE, '2026-06-25T06:40:03+00:00'),
  ('33157fad-fbf2-5584-9ac9-f40f44251bc5', '18878f4b-112b-5f40-9eb2-b54e3db53cbc', 'working', 1, 9, 0.0, 90, FALSE, '2026-06-25T06:42:40+00:00'),
  ('05bc33a4-346a-56a4-9998-f4cf927ffbcd', '18878f4b-112b-5f40-9eb2-b54e3db53cbc', 'working', 2, 10, 0.0, 90, FALSE, '2026-06-25T06:45:20+00:00'),
  ('d3d35355-7e18-52ac-8bd2-053e197241bf', '18878f4b-112b-5f40-9eb2-b54e3db53cbc', 'working', 3, 7, 0.0, 120, FALSE, '2026-06-25T06:48:21+00:00'),
  ('d82815dd-92c6-52ab-8048-c0f7c85826a7', '18878f4b-112b-5f40-9eb2-b54e3db53cbc', 'failure', 4, 8, 0.0, 60, FALSE, '2026-06-25T06:50:25+00:00'),
  ('1a926f9a-af03-5fa4-abc3-57265e98c696', '70925ad0-4c63-5317-bc89-344441e177ef', 'working', 1, 10, 32.0, 120, FALSE, '2026-06-25T06:53:35+00:00'),
  ('6e988051-53d9-5403-b849-a977aa409ed2', '70925ad0-4c63-5317-bc89-344441e177ef', 'working', 2, 10, 32.0, 90, FALSE, '2026-06-25T06:56:15+00:00'),
  ('e34c0f51-9c07-53c7-9f3c-11408dea7191', '70925ad0-4c63-5317-bc89-344441e177ef', 'failure', 3, 10, 32.0, 120, FALSE, '2026-06-25T06:59:25+00:00'),
  ('0d0e9f41-8555-5dab-9128-a465381c4124', 'aa3a6ec5-2b8b-55ec-aea3-2f0cb6db2840', 'working', 1, 15, 10.0, 150, FALSE, '2026-06-25T07:03:20+00:00'),
  ('2d9984c9-9d1d-5194-8270-45f8c80b4402', 'aa3a6ec5-2b8b-55ec-aea3-2f0cb6db2840', 'working', 2, 15, 10.0, 90, FALSE, '2026-06-25T07:06:15+00:00'),
  ('aa98f10d-b5c3-5c15-b10d-92c79372c4af', 'aa3a6ec5-2b8b-55ec-aea3-2f0cb6db2840', 'dropset', 3, 18, 7.5, 90, FALSE, '2026-06-25T07:09:19+00:00'),
  ('487ef24f-3cad-5365-a828-36af92253511', 'a174d252-afc3-563a-81ae-06e3e1d4e515', 'working', 1, 10, 35.0, 90, FALSE, '2026-06-25T07:11:59+00:00'),
  ('d7e90864-6034-526a-b42f-865ea060fc04', 'a174d252-afc3-563a-81ae-06e3e1d4e515', 'working', 2, 10, 35.0, 60, FALSE, '2026-06-25T07:14:09+00:00'),
  ('6690881a-32de-5d0f-a3fa-0426a8f2e681', 'a174d252-afc3-563a-81ae-06e3e1d4e515', 'dropset', 3, 13, 27.5, 90, FALSE, '2026-06-25T07:16:58+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3b8232ba-1d2a-5c91-8909-07ece00efc7a', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-06-27T06:02:00+00:00', '2026-06-27T06:46:54+00:00', 2694, 11677.5, FALSE, 84.0, 'gym', 115);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('7d46b605-ebfa-50af-90cc-98d00a14cf19', '3b8232ba-1d2a-5c91-8909-07ece00efc7a', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('26c938cf-a688-5d4c-ba71-de5cd4f4f98b', '3b8232ba-1d2a-5c91-8909-07ece00efc7a', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('974f3e09-b73f-51c3-a33f-5beaab0c1441', '3b8232ba-1d2a-5c91-8909-07ece00efc7a', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('4390ebb6-1f07-5958-a1b7-ee92f2a243ce', '3b8232ba-1d2a-5c91-8909-07ece00efc7a', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('7ea3588a-16cc-5b46-afad-b821d4b46b00', '7d46b605-ebfa-50af-90cc-98d00a14cf19', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-06-27T06:08:49+00:00'),
  ('6009a3f1-0283-595f-9f9d-583109cbb917', '7d46b605-ebfa-50af-90cc-98d00a14cf19', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-06-27T06:10:29+00:00'),
  ('fbe28138-8a50-5d7f-8f0b-4ac97d2b1356', '7d46b605-ebfa-50af-90cc-98d00a14cf19', 'working', 3, 5, 150.0, 90, FALSE, '2026-06-27T06:12:54+00:00'),
  ('107fde28-b900-5675-80fb-ae881a9b100f', '7d46b605-ebfa-50af-90cc-98d00a14cf19', 'working', 4, 5, 150.0, 150, FALSE, '2026-06-27T06:16:19+00:00'),
  ('83b8b1bf-39dc-559c-9e8d-56b56a9875b7', '7d46b605-ebfa-50af-90cc-98d00a14cf19', 'working', 5, 3, 150.0, 90, FALSE, '2026-06-27T06:18:38+00:00'),
  ('c4260192-d535-514d-bc55-5bc80a8bd735', '26c938cf-a688-5d4c-ba71-de5cd4f4f98b', 'working', 1, 8, 125.0, 60, FALSE, '2026-06-27T06:20:42+00:00'),
  ('0403909d-f826-5c2f-877c-33d3f6274b63', '26c938cf-a688-5d4c-ba71-de5cd4f4f98b', 'working', 2, 8, 125.0, 90, FALSE, '2026-06-27T06:23:16+00:00'),
  ('7305744f-3648-5059-a6c5-fccaab350f90', '26c938cf-a688-5d4c-ba71-de5cd4f4f98b', 'dropset', 3, 11, 100.0, 90, FALSE, '2026-06-27T06:25:59+00:00'),
  ('59223ed0-7207-5938-9416-60cab07b6e7b', '974f3e09-b73f-51c3-a33f-5beaab0c1441', 'working', 1, 8, 102.5, 60, FALSE, '2026-06-27T06:28:03+00:00'),
  ('b200af61-9130-5ef6-b79b-a621eae3ddeb', '974f3e09-b73f-51c3-a33f-5beaab0c1441', 'working', 2, 8, 102.5, 90, FALSE, '2026-06-27T06:30:37+00:00'),
  ('6fd0f5dc-6af4-5fda-882f-9b06a051289a', '974f3e09-b73f-51c3-a33f-5beaab0c1441', 'dropset', 3, 11, 82.5, 120, FALSE, '2026-06-27T06:33:50+00:00'),
  ('5ed31d91-58a7-52e6-8347-6ff4eddfd565', '4390ebb6-1f07-5958-a1b7-ee92f2a243ce', 'working', 1, 12, 85.0, 60, FALSE, '2026-06-27T06:36:06+00:00'),
  ('373c83dc-d154-571e-a789-5c4a19bd9777', '4390ebb6-1f07-5958-a1b7-ee92f2a243ce', 'working', 2, 12, 85.0, 90, FALSE, '2026-06-27T06:38:52+00:00'),
  ('5d05403d-02b6-51d8-8611-a7255f7a0283', '4390ebb6-1f07-5958-a1b7-ee92f2a243ce', 'working', 3, 12, 85.0, 90, FALSE, '2026-06-27T06:41:38+00:00'),
  ('f89a8f32-b3fe-56b2-9299-9c5109b2a8d4', '4390ebb6-1f07-5958-a1b7-ee92f2a243ce', 'working', 4, 12, 85.0, 60, FALSE, '2026-06-27T06:43:54+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6d05c73c-6c10-5d9e-948f-d27ea0528fa0', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-06-29T06:08:00+00:00', '2026-06-29T07:16:43+00:00', 4123, 5553.0, FALSE, 84.0, 'gym', 135);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b845847d-b779-5fda-a9c0-919b06e54043', '6d05c73c-6c10-5d9e-948f-d27ea0528fa0', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ada1d485-f25a-546f-9f68-f7b7b2327ba4', '6d05c73c-6c10-5d9e-948f-d27ea0528fa0', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('19c76fcd-25c3-53da-8ee7-ba9d857698d1', '6d05c73c-6c10-5d9e-948f-d27ea0528fa0', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('85917b21-b8ba-5681-b155-0f9c2013735e', '6d05c73c-6c10-5d9e-948f-d27ea0528fa0', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('1ab1217b-d07a-50fe-b680-d63b6b358a67', '6d05c73c-6c10-5d9e-948f-d27ea0528fa0', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('ac8a9382-cf3c-5a65-b190-310cb89f1c69', 'b845847d-b779-5fda-a9c0-919b06e54043', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-06-29T06:14:49+00:00'),
  ('b42ded9c-9e70-58d9-bf39-191beee7f1dc', 'b845847d-b779-5fda-a9c0-919b06e54043', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-06-29T06:16:29+00:00'),
  ('1244dde9-bfbc-5aa7-badc-93a57afde63c', 'b845847d-b779-5fda-a9c0-919b06e54043', 'working', 3, 5, 92.5, 120, FALSE, '2026-06-29T06:19:24+00:00'),
  ('24bb6e10-b059-5039-8df3-f67964837e31', 'b845847d-b779-5fda-a9c0-919b06e54043', 'working', 4, 5, 92.5, 90, FALSE, '2026-06-29T06:21:49+00:00'),
  ('60989a99-b14a-5c1d-a679-18c095e326ee', 'b845847d-b779-5fda-a9c0-919b06e54043', 'working', 5, 5, 92.5, 150, FALSE, '2026-06-29T06:25:14+00:00'),
  ('9d06637a-fce6-54d8-b58f-de5d7454a0c7', 'b845847d-b779-5fda-a9c0-919b06e54043', 'working', 6, 5, 92.5, 150, FALSE, '2026-06-29T06:28:39+00:00'),
  ('728eedc6-38e6-5399-aa40-c23a016da50f', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-06-29T06:30:28+00:00'),
  ('945caf89-082a-5a5a-beeb-a11d73ac0c73', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'warmup', 2, 5, 62.5, NULL, FALSE, '2026-06-29T06:32:08+00:00'),
  ('ef2307b6-dd3b-5870-8cdf-01dc08c17f9b', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'working', 3, 6, 82.5, 150, FALSE, '2026-06-29T06:35:36+00:00'),
  ('744778c7-ecd0-583d-a01e-6ce77660e6f0', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'working', 4, 6, 82.5, 120, FALSE, '2026-06-29T06:38:34+00:00'),
  ('bc5f340d-b5a7-59ef-82e2-241e61aa0ed1', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'working', 5, 6, 82.5, 120, FALSE, '2026-06-29T06:41:32+00:00'),
  ('ae1dafc4-1a7b-513c-8d0a-c93281cdc0f3', 'ada1d485-f25a-546f-9f68-f7b7b2327ba4', 'working', 6, 6, 82.5, 90, FALSE, '2026-06-29T06:44:00+00:00'),
  ('a7556928-4e7c-5356-9dd7-9bae5be54e34', '19c76fcd-25c3-53da-8ee7-ba9d857698d1', 'working', 1, 8, 34.0, 120, FALSE, '2026-06-29T06:47:04+00:00'),
  ('72218e57-0381-5bdd-98f1-f51e1e822da4', '19c76fcd-25c3-53da-8ee7-ba9d857698d1', 'working', 2, 8, 34.0, 120, FALSE, '2026-06-29T06:50:08+00:00'),
  ('c7109aac-1262-52c9-9ae7-634e894014eb', '19c76fcd-25c3-53da-8ee7-ba9d857698d1', 'working', 3, 6, 34.0, 90, FALSE, '2026-06-29T06:52:36+00:00'),
  ('325b71e8-16fc-56ae-a42d-a0bff0e51b22', '85917b21-b8ba-5681-b155-0f9c2013735e', 'working', 1, 10, 0.0, 90, FALSE, '2026-06-29T06:55:16+00:00'),
  ('2af08335-c953-59bc-a06e-49af8304fcda', '85917b21-b8ba-5681-b155-0f9c2013735e', 'working', 2, 7, 0.0, 120, FALSE, '2026-06-29T06:58:17+00:00'),
  ('5c324fc6-f562-5cc1-ba5c-ef739f942160', '85917b21-b8ba-5681-b155-0f9c2013735e', 'working', 3, 9, 0.0, 90, FALSE, '2026-06-29T07:00:54+00:00'),
  ('68da6ca2-5353-5b5b-8c17-c6a6d47e3958', '85917b21-b8ba-5681-b155-0f9c2013735e', 'failure', 4, 10, 0.0, 120, FALSE, '2026-06-29T07:04:04+00:00'),
  ('930479a8-3f7d-5119-9545-3c4ca65969b3', '1ab1217b-d07a-50fe-b680-d63b6b358a67', 'working', 1, 10, 32.5, 150, FALSE, '2026-06-29T07:07:44+00:00'),
  ('0262c743-35a5-505b-8fca-bb6539f02b8e', '1ab1217b-d07a-50fe-b680-d63b6b358a67', 'working', 2, 10, 32.5, 120, FALSE, '2026-06-29T07:10:54+00:00'),
  ('93f62226-9b1f-59ea-aaad-b5582d749334', '1ab1217b-d07a-50fe-b680-d63b6b358a67', 'dropset', 3, 13, 25.0, 90, FALSE, '2026-06-29T07:13:43+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('23e213f6-f692-54eb-a14e-b3828c3e1223', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-06-30T06:33:00+00:00', '2026-06-30T07:30:22+00:00', 3442, 10730.0, FALSE, 84.0, 'gym', 161);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('42554958-907d-5f98-b3de-e647605ca12e', '23e213f6-f692-54eb-a14e-b3828c3e1223', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('fac9ac11-62ae-5e37-a49d-9bde9cf2e83b', '23e213f6-f692-54eb-a14e-b3828c3e1223', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('a99dfa66-2af8-5268-9b22-af399a293f3d', '23e213f6-f692-54eb-a14e-b3828c3e1223', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('f7df9f1e-4e17-5e3d-8641-6eb6b6b3816a', '23e213f6-f692-54eb-a14e-b3828c3e1223', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('838c305a-23b1-5bbb-9c79-95bcc26fa9f0', '23e213f6-f692-54eb-a14e-b3828c3e1223', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('c2938887-92a3-5cbb-862d-74f0b0a845ef', '42554958-907d-5f98-b3de-e647605ca12e', 'warmup', 1, 8, 62.5, NULL, FALSE, '2026-06-30T06:39:49+00:00'),
  ('a8d7c1bd-6955-5575-9965-fdd688658f63', '42554958-907d-5f98-b3de-e647605ca12e', 'warmup', 2, 5, 95.0, NULL, FALSE, '2026-06-30T06:41:29+00:00'),
  ('f1df8ddd-4bf2-5b9d-aed4-e06dcf83ce93', '42554958-907d-5f98-b3de-e647605ca12e', 'working', 3, 5, 125.0, 60, FALSE, '2026-06-30T06:43:24+00:00'),
  ('6b436704-6aff-54e9-94b2-3076ec86e224', '42554958-907d-5f98-b3de-e647605ca12e', 'working', 4, 5, 125.0, 60, FALSE, '2026-06-30T06:45:19+00:00'),
  ('bad2946a-5677-5f13-a4ed-07bb7401c920', '42554958-907d-5f98-b3de-e647605ca12e', 'working', 5, 5, 125.0, 120, FALSE, '2026-06-30T06:48:14+00:00'),
  ('c240c58f-1628-5001-ae0c-3c83ccea4483', '42554958-907d-5f98-b3de-e647605ca12e', 'working', 6, 5, 125.0, 90, FALSE, '2026-06-30T06:50:39+00:00'),
  ('0563d2f5-4b90-5540-9c86-ed9f69e18635', 'fac9ac11-62ae-5e37-a49d-9bde9cf2e83b', 'working', 1, 8, 102.5, 120, FALSE, '2026-06-30T06:53:43+00:00'),
  ('18537420-c7e3-58d9-ac11-5c82fe9ecb6b', 'fac9ac11-62ae-5e37-a49d-9bde9cf2e83b', 'working', 2, 8, 102.5, 90, FALSE, '2026-06-30T06:56:17+00:00'),
  ('e6df7fc4-227e-57b0-811b-235784d3c8b1', 'fac9ac11-62ae-5e37-a49d-9bde9cf2e83b', 'dropset', 3, 11, 82.5, 90, FALSE, '2026-06-30T06:59:00+00:00'),
  ('01b95557-f0ef-510a-a679-0be957b5405a', 'a99dfa66-2af8-5268-9b22-af399a293f3d', 'working', 1, 10, 47.5, 90, FALSE, '2026-06-30T07:01:40+00:00'),
  ('085b1ee0-ba0c-539b-86c6-7f9aa9285700', 'a99dfa66-2af8-5268-9b22-af399a293f3d', 'working', 2, 10, 47.5, 90, FALSE, '2026-06-30T07:04:20+00:00'),
  ('083bea1b-c7cf-55d0-9cd4-813005d6043c', 'a99dfa66-2af8-5268-9b22-af399a293f3d', 'dropset', 3, 11, 37.5, 150, FALSE, '2026-06-30T07:08:03+00:00'),
  ('3cef9459-4dcf-5a47-8998-bcbbf318800b', 'f7df9f1e-4e17-5e3d-8641-6eb6b6b3816a', 'working', 1, 12, 90.0, 90, FALSE, '2026-06-30T07:10:49+00:00'),
  ('6d6dbc8f-8a71-576b-90f0-1a8be04876f9', 'f7df9f1e-4e17-5e3d-8641-6eb6b6b3816a', 'working', 2, 12, 90.0, 90, FALSE, '2026-06-30T07:13:35+00:00'),
  ('d5d2532f-f578-5b90-b13d-f80d4c818620', 'f7df9f1e-4e17-5e3d-8641-6eb6b6b3816a', 'working', 3, 12, 90.0, 90, FALSE, '2026-06-30T07:16:21+00:00'),
  ('28e1a164-c6b6-5b83-b689-7c03f458ac6d', 'f7df9f1e-4e17-5e3d-8641-6eb6b6b3816a', 'working', 4, 12, 90.0, 60, FALSE, '2026-06-30T07:18:37+00:00'),
  ('8affd20e-b027-56f1-af31-fb4e1cebf25f', '838c305a-23b1-5bbb-9c79-95bcc26fa9f0', 'working', 1, 11, 0.0, 120, FALSE, '2026-06-30T07:21:50+00:00'),
  ('0c39d6b1-a0d4-58da-824e-9c62d422aad3', '838c305a-23b1-5bbb-9c79-95bcc26fa9f0', 'working', 2, 12, 0.0, 90, FALSE, '2026-06-30T07:24:36+00:00'),
  ('f9b58c5f-468b-51e0-a084-38afe8344b40', '838c305a-23b1-5bbb-9c79-95bcc26fa9f0', 'working', 3, 12, 0.0, 90, FALSE, '2026-06-30T07:27:22+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d5820e6f-53f5-5407-bc22-9fa348b75e9f', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-07-02T06:04:00+00:00', '2026-07-02T07:02:04+00:00', 3484, 3767.25, FALSE, 84.0, 'gym', 155);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('a2f64dda-2774-5e72-b555-93d37ef397dc', 'd5820e6f-53f5-5407-bc22-9fa348b75e9f', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a2f0e4c4-1a55-57e2-b4b0-14c17953d441', 'd5820e6f-53f5-5407-bc22-9fa348b75e9f', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('6292f45a-892d-5900-8ce6-17098cedc836', 'd5820e6f-53f5-5407-bc22-9fa348b75e9f', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('2276876f-edc3-54d9-b45e-82fa8e947b21', 'd5820e6f-53f5-5407-bc22-9fa348b75e9f', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('d8cdac77-6047-5db9-913d-21c78846e4d5', 'd5820e6f-53f5-5407-bc22-9fa348b75e9f', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0e3cc94d-de01-50b1-b421-cf0f198240a2', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-07-02T06:10:49+00:00'),
  ('2e1951f6-d4f7-52d5-b3d9-8dea5ccff441', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'warmup', 2, 5, 42.5, NULL, FALSE, '2026-07-02T06:12:29+00:00'),
  ('f5d59849-f429-52d2-84b3-571d23ef29f3', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'working', 3, 5, 57.5, 90, FALSE, '2026-07-02T06:14:54+00:00'),
  ('b5503422-8a02-5b9d-b289-82a924061955', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'working', 4, 5, 57.5, 90, FALSE, '2026-07-02T06:17:19+00:00'),
  ('461b0741-8dc2-501c-9df5-9782204f01fd', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'working', 5, 5, 57.5, 60, FALSE, '2026-07-02T06:19:14+00:00'),
  ('291245df-2341-5404-8c06-72ca0d2dd2a7', 'a2f64dda-2774-5e72-b555-93d37ef397dc', 'working', 6, 5, 57.5, 60, FALSE, '2026-07-02T06:21:09+00:00'),
  ('578af873-cbe1-5250-9500-f92b10baab49', 'a2f0e4c4-1a55-57e2-b4b0-14c17953d441', 'working', 1, 7, 0.0, 90, FALSE, '2026-07-02T06:23:40+00:00'),
  ('058bccbf-f28c-5496-b284-288e12c8a861', 'a2f0e4c4-1a55-57e2-b4b0-14c17953d441', 'working', 2, 7, 0.0, 60, FALSE, '2026-07-02T06:25:41+00:00'),
  ('fd648316-4da2-5110-bf52-3b51bd4b26d4', 'a2f0e4c4-1a55-57e2-b4b0-14c17953d441', 'working', 3, 10, 0.0, 90, FALSE, '2026-07-02T06:28:21+00:00'),
  ('7d2c0ad2-02e0-5d73-a8e1-518a2206b858', 'a2f0e4c4-1a55-57e2-b4b0-14c17953d441', 'working', 4, 7, 0.0, 150, FALSE, '2026-07-02T06:31:52+00:00'),
  ('c08d5b5a-a37a-5b41-80aa-37bf2bb9b6a9', '6292f45a-892d-5900-8ce6-17098cedc836', 'working', 1, 10, 34.0, 90, FALSE, '2026-07-02T06:34:32+00:00'),
  ('430b7634-070a-50df-a769-9dc014b8db9d', '6292f45a-892d-5900-8ce6-17098cedc836', 'working', 2, 10, 34.0, 90, FALSE, '2026-07-02T06:37:12+00:00'),
  ('98eb6d0b-3561-5590-a27c-a1b0c5d1280c', '6292f45a-892d-5900-8ce6-17098cedc836', 'failure', 3, 9, 34.0, 150, FALSE, '2026-07-02T06:40:49+00:00'),
  ('2c847e35-678d-5752-abe3-4e57f38a29de', '2276876f-edc3-54d9-b45e-82fa8e947b21', 'working', 1, 15, 11.25, 90, FALSE, '2026-07-02T06:43:44+00:00'),
  ('62cf3583-feec-55ea-9c24-500ed5d0ac6a', '2276876f-edc3-54d9-b45e-82fa8e947b21', 'working', 2, 15, 11.25, 120, FALSE, '2026-07-02T06:47:09+00:00'),
  ('faa99edf-00b7-5b87-84a8-455d086aed64', '2276876f-edc3-54d9-b45e-82fa8e947b21', 'working', 3, 15, 11.25, 90, FALSE, '2026-07-02T06:50:04+00:00'),
  ('51377ce9-c079-5fd7-8c0f-5fa4ac19876c', 'd8cdac77-6047-5db9-913d-21c78846e4d5', 'working', 1, 10, 37.5, 90, FALSE, '2026-07-02T06:52:44+00:00'),
  ('34fa3118-8dcd-5805-9bcb-2adf2c1053b9', 'd8cdac77-6047-5db9-913d-21c78846e4d5', 'working', 2, 10, 37.5, 150, FALSE, '2026-07-02T06:56:24+00:00'),
  ('bf9e5313-bca9-58de-ab67-e94b02d67ad5', 'd8cdac77-6047-5db9-913d-21c78846e4d5', 'failure', 3, 10, 37.5, 90, FALSE, '2026-07-02T06:59:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7dcc6fe1-dd0f-5b9f-8eb4-9a8fc06ac873', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-07-04T06:45:00+00:00', '2026-07-04T07:33:06+00:00', 2886, 11885.0, FALSE, 84.0, 'gym', 109);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('45c2affd-5a7d-5712-8a09-f28806ba586b', '7dcc6fe1-dd0f-5b9f-8eb4-9a8fc06ac873', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('a92013a2-f7f7-516f-b841-02dac83d9f89', '7dcc6fe1-dd0f-5b9f-8eb4-9a8fc06ac873', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('dcf33983-52b9-5399-8839-396da526ee65', '7dcc6fe1-dd0f-5b9f-8eb4-9a8fc06ac873', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('28f517b1-8fd8-548a-a14b-d723a95f1258', '7dcc6fe1-dd0f-5b9f-8eb4-9a8fc06ac873', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0236742a-fee9-520b-8fdd-61ff7baacc81', '45c2affd-5a7d-5712-8a09-f28806ba586b', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-07-04T06:51:49+00:00'),
  ('b3c92bd7-5c17-5bb0-8490-57fcb98c24bf', '45c2affd-5a7d-5712-8a09-f28806ba586b', 'warmup', 2, 5, 115.0, NULL, FALSE, '2026-07-04T06:53:29+00:00'),
  ('fe1aa2be-66d7-52e8-9029-b84dfe6b5cce', '45c2affd-5a7d-5712-8a09-f28806ba586b', 'working', 3, 5, 155.0, 120, FALSE, '2026-07-04T06:56:24+00:00'),
  ('05c11f5d-bfc2-5872-be46-108d3ff0befd', '45c2affd-5a7d-5712-8a09-f28806ba586b', 'working', 4, 5, 155.0, 90, FALSE, '2026-07-04T06:58:49+00:00'),
  ('1e820c43-d117-5902-ab50-edd64801aba0', '45c2affd-5a7d-5712-8a09-f28806ba586b', 'working', 5, 4, 155.0, 120, FALSE, '2026-07-04T07:01:41+00:00'),
  ('ff056cb3-3869-53ca-9e40-9d6653a26b62', 'a92013a2-f7f7-516f-b841-02dac83d9f89', 'working', 1, 8, 125.0, 90, FALSE, '2026-07-04T07:04:15+00:00'),
  ('8eb349f8-288d-5e20-aa9d-557048f99d2d', 'a92013a2-f7f7-516f-b841-02dac83d9f89', 'working', 2, 8, 125.0, 60, FALSE, '2026-07-04T07:06:19+00:00'),
  ('e78e9a0d-56f6-5954-a3ad-52177bfa4d26', 'a92013a2-f7f7-516f-b841-02dac83d9f89', 'failure', 3, 7, 125.0, 60, FALSE, '2026-07-04T07:08:20+00:00'),
  ('701a9afe-af22-5b11-ba2e-5f26d7830daa', 'dcf33983-52b9-5399-8839-396da526ee65', 'working', 1, 8, 105.0, 90, FALSE, '2026-07-04T07:10:54+00:00'),
  ('977bcb3e-ae70-5aa1-82f2-37bf86e1d60d', 'dcf33983-52b9-5399-8839-396da526ee65', 'working', 2, 8, 105.0, 150, FALSE, '2026-07-04T07:14:28+00:00'),
  ('e3fe8fb3-5c1e-5ed0-9cbc-f3ab4dc981c5', 'dcf33983-52b9-5399-8839-396da526ee65', 'working', 3, 8, 105.0, 120, FALSE, '2026-07-04T07:17:32+00:00'),
  ('12c41faa-923e-5240-b728-ad42843a2f36', '28f517b1-8fd8-548a-a14b-d723a95f1258', 'working', 1, 12, 90.0, 90, FALSE, '2026-07-04T07:20:18+00:00'),
  ('36037887-010d-5974-b26f-3cc838e7260e', '28f517b1-8fd8-548a-a14b-d723a95f1258', 'working', 2, 12, 90.0, 120, FALSE, '2026-07-04T07:23:34+00:00'),
  ('19da8580-3d1b-551a-872c-99ee9d3449e7', '28f517b1-8fd8-548a-a14b-d723a95f1258', 'working', 3, 12, 90.0, 90, FALSE, '2026-07-04T07:26:20+00:00'),
  ('9b582361-f3bb-553f-a0be-013cbeb56804', '28f517b1-8fd8-548a-a14b-d723a95f1258', 'working', 4, 12, 90.0, 150, FALSE, '2026-07-04T07:30:06+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3b389631-cf6e-5e22-97ab-3322fc32f995', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-07-06T06:15:00+00:00', '2026-07-06T07:24:13+00:00', 4153, 4744.5, FALSE, 84.0, 'gym', 135);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('66a929a0-c3d1-5ae3-9463-f6320b00d8d3', '3b389631-cf6e-5e22-97ab-3322fc32f995', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('727c75b9-1f00-5d36-9673-794ffff927e9', '3b389631-cf6e-5e22-97ab-3322fc32f995', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('76ef8833-a1bd-5d5e-91c9-9dbeb7ab7df5', '3b389631-cf6e-5e22-97ab-3322fc32f995', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('2be85ac5-e43d-5915-bef4-d498e0c09fd1', '3b389631-cf6e-5e22-97ab-3322fc32f995', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('6ecb0da1-cbc3-5b02-b38c-882c7aff3c63', '3b389631-cf6e-5e22-97ab-3322fc32f995', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('36198aaf-d5f0-5827-8f04-e8ff92c4ca01', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-07-06T06:21:49+00:00'),
  ('649a2304-1f51-5462-ab5f-366804ef12c8', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'warmup', 2, 5, 57.5, NULL, FALSE, '2026-07-06T06:23:29+00:00'),
  ('c61fe3b8-2562-52cb-a235-3e71bd580d99', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'working', 3, 5, 77.5, 120, FALSE, '2026-07-06T06:26:24+00:00'),
  ('8757b8ed-4aa8-54e3-80e9-a69acd29b519', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'working', 4, 5, 77.5, 90, FALSE, '2026-07-06T06:28:49+00:00'),
  ('d128cba2-91f1-581c-9917-28772ada0a5c', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'working', 5, 5, 77.5, 150, FALSE, '2026-07-06T06:32:14+00:00'),
  ('4401ba45-f0b3-5ae7-9fb5-e2b6af6b3cc9', '66a929a0-c3d1-5ae3-9463-f6320b00d8d3', 'working', 6, 5, 77.5, 150, FALSE, '2026-07-06T06:35:39+00:00'),
  ('3e89dfaf-7ae7-5928-a993-c80f0ce18518', '727c75b9-1f00-5d36-9673-794ffff927e9', 'warmup', 1, 8, 35.0, NULL, FALSE, '2026-07-06T06:37:28+00:00'),
  ('a9887670-1c50-5094-9aae-a83c18d3266c', '727c75b9-1f00-5d36-9673-794ffff927e9', 'warmup', 2, 5, 52.5, NULL, FALSE, '2026-07-06T06:39:08+00:00'),
  ('6c238076-47bc-5ffe-a751-c68e3d30fb2d', '727c75b9-1f00-5d36-9673-794ffff927e9', 'working', 3, 6, 70.0, 150, FALSE, '2026-07-06T06:42:36+00:00'),
  ('aa4637f0-9edc-599f-ba20-5651d6f1231a', '727c75b9-1f00-5d36-9673-794ffff927e9', 'working', 4, 6, 70.0, 150, FALSE, '2026-07-06T06:46:04+00:00'),
  ('40fdeeb0-fd21-51ca-bde1-fbd4e134db71', '727c75b9-1f00-5d36-9673-794ffff927e9', 'working', 5, 6, 70.0, 120, FALSE, '2026-07-06T06:49:02+00:00'),
  ('a7b1eb95-c77d-5fec-98de-b40405ea2884', '727c75b9-1f00-5d36-9673-794ffff927e9', 'working', 6, 6, 70.0, 150, FALSE, '2026-07-06T06:52:30+00:00'),
  ('1f7c7b0d-a34d-587b-b651-6b060a96a801', '76ef8833-a1bd-5d5e-91c9-9dbeb7ab7df5', 'working', 1, 8, 28.0, 60, FALSE, '2026-07-06T06:54:34+00:00'),
  ('39e8b92a-3ee3-570e-94c9-c8a03e1ce75a', '76ef8833-a1bd-5d5e-91c9-9dbeb7ab7df5', 'working', 2, 8, 28.0, 60, FALSE, '2026-07-06T06:56:38+00:00'),
  ('9ac582ae-7d15-5577-8480-9568b4f20b5f', '76ef8833-a1bd-5d5e-91c9-9dbeb7ab7df5', 'working', 3, 8, 28.0, 120, FALSE, '2026-07-06T06:59:42+00:00'),
  ('362faba1-c25f-5963-9265-30697fb0b62f', '2be85ac5-e43d-5915-bef4-d498e0c09fd1', 'working', 1, 9, 0.0, 150, FALSE, '2026-07-06T07:03:19+00:00'),
  ('c6a8bc70-0e15-5e3c-a90b-9dcbbc544875', '2be85ac5-e43d-5915-bef4-d498e0c09fd1', 'working', 2, 9, 0.0, 90, FALSE, '2026-07-06T07:05:56+00:00'),
  ('8210c7cb-7d7a-562e-b5d1-0eaf70b136d0', '2be85ac5-e43d-5915-bef4-d498e0c09fd1', 'working', 3, 7, 0.0, 90, FALSE, '2026-07-06T07:08:27+00:00'),
  ('287ef201-5c72-53bf-b20b-eb2e84846e39', '2be85ac5-e43d-5915-bef4-d498e0c09fd1', 'failure', 4, 9, 0.0, 60, FALSE, '2026-07-06T07:10:34+00:00'),
  ('a4257f90-ba50-57f2-87b3-5767112596e9', '6ecb0da1-cbc3-5b02-b38c-882c7aff3c63', 'working', 1, 10, 27.5, 150, FALSE, '2026-07-06T07:14:14+00:00'),
  ('4878143d-fe67-5881-befc-d0c35c9d4e84', '6ecb0da1-cbc3-5b02-b38c-882c7aff3c63', 'working', 2, 10, 27.5, 150, FALSE, '2026-07-06T07:17:54+00:00'),
  ('05e5446f-2eae-589f-83f8-ec424df2b988', '6ecb0da1-cbc3-5b02-b38c-882c7aff3c63', 'dropset', 3, 13, 22.5, 120, FALSE, '2026-07-06T07:21:13+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-07-07T06:18:00+00:00', '2026-07-07T07:19:04+00:00', 3664, 8842.5, FALSE, 84.0, 'gym', 155);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('717779df-7d95-5c1d-9df4-5645d809c362', '84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('7fb42057-c5df-5993-9ebe-ebf995f4d6fb', '84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('3fba0ec8-6306-50f3-b83d-59f7ec7a36e8', '84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('839a76d9-0ec3-5877-9a12-f30518f54f41', '84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('871468bf-5767-59b9-a8ae-1bd2e42401e8', '84dccd8b-f2b8-5972-abc2-f1bfdbe0efd9', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4baf22d7-465a-50ed-b2f8-04df8545defa', '717779df-7d95-5c1d-9df4-5645d809c362', 'warmup', 1, 8, 55.0, NULL, FALSE, '2026-07-07T06:24:49+00:00'),
  ('c340984c-f163-52d5-b66e-eedb0479d19b', '717779df-7d95-5c1d-9df4-5645d809c362', 'warmup', 2, 5, 80.0, NULL, FALSE, '2026-07-07T06:26:29+00:00'),
  ('1d970c7f-80c4-5370-a667-80e06da82b01', '717779df-7d95-5c1d-9df4-5645d809c362', 'working', 3, 5, 107.5, 120, FALSE, '2026-07-07T06:29:24+00:00'),
  ('74b653c2-f098-515e-965e-88748aa73614', '717779df-7d95-5c1d-9df4-5645d809c362', 'working', 4, 5, 107.5, 150, FALSE, '2026-07-07T06:32:49+00:00'),
  ('986f4140-9ad1-5e19-bda3-184702215d1d', '717779df-7d95-5c1d-9df4-5645d809c362', 'working', 5, 5, 107.5, 120, FALSE, '2026-07-07T06:35:44+00:00'),
  ('e4c2e3e7-0ede-54ee-9d01-69aed691c54f', '717779df-7d95-5c1d-9df4-5645d809c362', 'working', 6, 5, 107.5, 150, FALSE, '2026-07-07T06:39:09+00:00'),
  ('40e87451-6a60-5766-8f3b-cecabc46b68a', '7fb42057-c5df-5993-9ebe-ebf995f4d6fb', 'working', 1, 8, 87.5, 90, FALSE, '2026-07-07T06:41:43+00:00'),
  ('e06a6fa3-b05b-5004-ad85-2949fb0d30a3', '7fb42057-c5df-5993-9ebe-ebf995f4d6fb', 'working', 2, 8, 87.5, 60, FALSE, '2026-07-07T06:43:47+00:00'),
  ('6a3f8ecb-e59e-5b35-a256-c3d28bf85f07', '7fb42057-c5df-5993-9ebe-ebf995f4d6fb', 'failure', 3, 7, 87.5, 90, FALSE, '2026-07-07T06:46:18+00:00'),
  ('6f9fbe5b-67fa-5bcf-be8d-34616f9d9a8d', '3fba0ec8-6306-50f3-b83d-59f7ec7a36e8', 'working', 1, 10, 40.0, 90, FALSE, '2026-07-07T06:48:58+00:00'),
  ('0246895f-c2ee-5052-8c3f-32bb9e472888', '3fba0ec8-6306-50f3-b83d-59f7ec7a36e8', 'working', 2, 10, 40.0, 90, FALSE, '2026-07-07T06:51:38+00:00'),
  ('db63a8bf-2b75-51ac-985b-2f45d48b3d45', '3fba0ec8-6306-50f3-b83d-59f7ec7a36e8', 'working', 3, 10, 40.0, 90, FALSE, '2026-07-07T06:54:18+00:00'),
  ('7ff65c73-1fc4-523c-9ac7-3a6871b79d67', '839a76d9-0ec3-5877-9a12-f30518f54f41', 'working', 1, 12, 75.0, 90, FALSE, '2026-07-07T06:57:04+00:00'),
  ('23fd9ca0-224f-5cab-8dba-0115cb2ca5dc', '839a76d9-0ec3-5877-9a12-f30518f54f41', 'working', 2, 12, 75.0, 60, FALSE, '2026-07-07T06:59:20+00:00'),
  ('a0d71ec1-3702-5ac2-98c5-5e715f644023', '839a76d9-0ec3-5877-9a12-f30518f54f41', 'working', 3, 12, 75.0, 150, FALSE, '2026-07-07T07:03:06+00:00'),
  ('f6510004-e88d-5857-b158-3989e2f94d39', '839a76d9-0ec3-5877-9a12-f30518f54f41', 'dropset', 4, 13, 60.0, 90, FALSE, '2026-07-07T07:05:55+00:00'),
  ('f6ad27eb-2994-5b48-8e57-b4c68d189cf1', '871468bf-5767-59b9-a8ae-1bd2e42401e8', 'working', 1, 11, 0.0, 150, FALSE, '2026-07-07T07:09:38+00:00'),
  ('8ab7d73c-cce5-51e8-9492-21fb56e76018', '871468bf-5767-59b9-a8ae-1bd2e42401e8', 'working', 2, 10, 0.0, 150, FALSE, '2026-07-07T07:13:18+00:00'),
  ('eaaf03e3-541a-5964-a7ff-1d324c80fba6', '871468bf-5767-59b9-a8ae-1bd2e42401e8', 'working', 3, 12, 0.0, 90, FALSE, '2026-07-07T07:16:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-07-09T06:03:00+00:00', '2026-07-09T07:01:19+00:00', 3499, 3227.0, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e4fee8f8-5c20-5ae2-a99e-570119026cd8', '8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('328c1793-35aa-5e41-9bab-884174d1dad8', '8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('b4fc70fb-3cc6-560c-b474-c42b57076a41', '8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('7e814c90-c02c-51b8-998b-c4955ac91cba', '8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('a1de3fd3-bb21-5308-8290-c15782b54b19', '8f67fa80-f5ba-5475-ba68-cbfd2db35ac6', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('24945f75-0c0f-589d-80ea-14e7ee1e9aef', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'warmup', 1, 8, 25.0, NULL, FALSE, '2026-07-09T06:09:49+00:00'),
  ('b5137aa9-8df4-5bd9-8fe5-ac400c805306', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'warmup', 2, 5, 37.5, NULL, FALSE, '2026-07-09T06:11:29+00:00'),
  ('4980ac86-6d2f-5117-9fc8-9cc317ea070d', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'working', 3, 5, 50.0, 60, FALSE, '2026-07-09T06:13:24+00:00'),
  ('b55e193a-5cb2-5f26-87c4-e02f01e29920', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'working', 4, 5, 50.0, 90, FALSE, '2026-07-09T06:15:49+00:00'),
  ('4634f356-0f54-54d8-af84-662e7b9f7b3e', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'working', 5, 5, 50.0, 60, FALSE, '2026-07-09T06:17:44+00:00'),
  ('40848fee-d59e-5d9c-bfe4-dd19a602cc13', 'e4fee8f8-5c20-5ae2-a99e-570119026cd8', 'working', 6, 5, 50.0, 60, FALSE, '2026-07-09T06:19:39+00:00'),
  ('cb96223b-26ff-50c1-ac78-9eee13dff9a7', '328c1793-35aa-5e41-9bab-884174d1dad8', 'working', 1, 9, 0.0, 150, FALSE, '2026-07-09T06:23:16+00:00'),
  ('61a55563-2c3d-5aaa-b4a7-d39dd9f6ef96', '328c1793-35aa-5e41-9bab-884174d1dad8', 'working', 2, 7, 0.0, 60, FALSE, '2026-07-09T06:25:17+00:00'),
  ('4a15c39c-e667-54a1-ac14-9e07d4a360db', '328c1793-35aa-5e41-9bab-884174d1dad8', 'working', 3, 9, 0.0, 90, FALSE, '2026-07-09T06:27:54+00:00'),
  ('61d15888-bec9-5347-861b-2307ba48f725', '328c1793-35aa-5e41-9bab-884174d1dad8', 'working', 4, 9, 0.0, 150, FALSE, '2026-07-09T06:31:31+00:00'),
  ('0e7df1e2-e1f5-5c79-989d-56931d156e75', 'b4fc70fb-3cc6-560c-b474-c42b57076a41', 'working', 1, 10, 28.0, 90, FALSE, '2026-07-09T06:34:11+00:00'),
  ('a62421fc-9d00-50de-bb3d-02117f2901d9', 'b4fc70fb-3cc6-560c-b474-c42b57076a41', 'working', 2, 10, 28.0, 120, FALSE, '2026-07-09T06:37:21+00:00'),
  ('17209837-4214-5b3e-9dd8-393852d2fe43', 'b4fc70fb-3cc6-560c-b474-c42b57076a41', 'dropset', 3, 11, 22.0, 150, FALSE, '2026-07-09T06:41:04+00:00'),
  ('4dc42627-d2cf-51f6-8fa1-f8bc703f3825', '7e814c90-c02c-51b8-998b-c4955ac91cba', 'working', 1, 15, 10.0, 60, FALSE, '2026-07-09T06:43:29+00:00'),
  ('948ad7a1-01db-5e38-9395-48172dbbd4c7', '7e814c90-c02c-51b8-998b-c4955ac91cba', 'working', 2, 15, 10.0, 60, FALSE, '2026-07-09T06:45:54+00:00'),
  ('59a6cca5-476f-5297-a343-7b0fd07943d5', '7e814c90-c02c-51b8-998b-c4955ac91cba', 'failure', 3, 15, 10.0, 90, FALSE, '2026-07-09T06:48:49+00:00'),
  ('d3174d1f-22dd-536a-9b9d-b42011282510', 'a1de3fd3-bb21-5308-8290-c15782b54b19', 'working', 1, 10, 32.5, 150, FALSE, '2026-07-09T06:52:29+00:00'),
  ('f38e3185-4700-533f-a789-bb792b54d03a', 'a1de3fd3-bb21-5308-8290-c15782b54b19', 'working', 2, 10, 32.5, 90, FALSE, '2026-07-09T06:55:09+00:00'),
  ('d4865d16-a0ee-538e-a9b3-2d3e9a5cbd92', 'a1de3fd3-bb21-5308-8290-c15782b54b19', 'working', 3, 10, 32.5, 120, FALSE, '2026-07-09T06:58:19+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7f48ee04-c912-5a66-8569-296284fda6f9', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-07-11T06:16:00+00:00', '2026-07-11T07:06:30+00:00', 3030, 9900.0, FALSE, 84.0, 'gym', 107);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('77a55c8f-ad7f-5f8e-8efc-e06552ef775e', '7f48ee04-c912-5a66-8569-296284fda6f9', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('33a5d13a-3a38-5001-a0fb-14fb7c40351a', '7f48ee04-c912-5a66-8569-296284fda6f9', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('8f14e70e-3d01-5173-97bb-98a2fed4e18b', '7f48ee04-c912-5a66-8569-296284fda6f9', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('5231545c-05be-596f-b6ab-2ddc9f6e9629', '7f48ee04-c912-5a66-8569-296284fda6f9', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2b1f4c6a-d407-5d40-95de-72dae1eeb311', '77a55c8f-ad7f-5f8e-8efc-e06552ef775e', 'warmup', 1, 8, 65.0, NULL, FALSE, '2026-07-11T06:22:49+00:00'),
  ('4c6e78ce-02fa-54cc-bc85-fcf56271f726', '77a55c8f-ad7f-5f8e-8efc-e06552ef775e', 'warmup', 2, 5, 100.0, NULL, FALSE, '2026-07-11T06:24:29+00:00'),
  ('c5f35c06-aa87-5a2a-b18a-b2da84ec4dec', '77a55c8f-ad7f-5f8e-8efc-e06552ef775e', 'working', 3, 5, 130.0, 90, FALSE, '2026-07-11T06:26:54+00:00'),
  ('729489a2-e44f-519d-8ac4-53ab4c0b358a', '77a55c8f-ad7f-5f8e-8efc-e06552ef775e', 'working', 4, 5, 130.0, 120, FALSE, '2026-07-11T06:29:49+00:00'),
  ('842cb385-263c-554e-ac8f-06140cfc45f2', '77a55c8f-ad7f-5f8e-8efc-e06552ef775e', 'working', 5, 5, 130.0, 150, FALSE, '2026-07-11T06:33:14+00:00'),
  ('9015d8f3-5f20-5668-b308-b3ad6a77bd7e', '33a5d13a-3a38-5001-a0fb-14fb7c40351a', 'working', 1, 8, 105.0, 150, FALSE, '2026-07-11T06:36:48+00:00'),
  ('7eccb37d-565c-568e-a298-438d436c3c1c', '33a5d13a-3a38-5001-a0fb-14fb7c40351a', 'working', 2, 8, 105.0, 90, FALSE, '2026-07-11T06:39:22+00:00'),
  ('4058abee-31af-5c91-864d-ed1b7deef3fa', '33a5d13a-3a38-5001-a0fb-14fb7c40351a', 'working', 3, 8, 105.0, 150, FALSE, '2026-07-11T06:42:56+00:00'),
  ('9e10aeea-9389-5396-9baa-a0c4e44b014b', '8f14e70e-3d01-5173-97bb-98a2fed4e18b', 'working', 1, 8, 90.0, 90, FALSE, '2026-07-11T06:45:30+00:00'),
  ('79e6242d-72b3-51eb-a1cf-83066772a642', '8f14e70e-3d01-5173-97bb-98a2fed4e18b', 'working', 2, 8, 90.0, 150, FALSE, '2026-07-11T06:49:04+00:00'),
  ('79d0486d-8a57-5294-81d6-fbd9b686b91f', '8f14e70e-3d01-5173-97bb-98a2fed4e18b', 'working', 3, 6, 90.0, 120, FALSE, '2026-07-11T06:52:02+00:00'),
  ('f8af1fb3-7df0-510a-9e3a-3e7cb50fe41c', '5231545c-05be-596f-b6ab-2ddc9f6e9629', 'working', 1, 12, 75.0, 60, FALSE, '2026-07-11T06:54:18+00:00'),
  ('011fb008-c33c-5b71-9729-95e3e0109c82', '5231545c-05be-596f-b6ab-2ddc9f6e9629', 'working', 2, 12, 75.0, 90, FALSE, '2026-07-11T06:57:04+00:00'),
  ('efb06817-631c-57fb-9c11-0ecc30278bf9', '5231545c-05be-596f-b6ab-2ddc9f6e9629', 'working', 3, 12, 75.0, 150, FALSE, '2026-07-11T07:00:50+00:00'),
  ('f1632af2-fb47-579e-88a4-e869d62a10a7', '5231545c-05be-596f-b6ab-2ddc9f6e9629', 'working', 4, 10, 75.0, 90, FALSE, '2026-07-11T07:03:30+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('147dfb84-1808-5511-baa9-e30910f210f2', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-07-13T06:36:00+00:00', '2026-07-13T07:41:55+00:00', 3955, 5606.5, FALSE, 84.0, 'gym', 139);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('1c5b0ec2-3c77-512a-88a7-2c4818f5c732', '147dfb84-1808-5511-baa9-e30910f210f2', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('c77f5ff7-5721-58d9-8f18-ce94136cfbc5', '147dfb84-1808-5511-baa9-e30910f210f2', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('257f50d6-3202-5cda-9e87-103703d24014', '147dfb84-1808-5511-baa9-e30910f210f2', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('c22c77a6-ae15-5f70-bb90-b9c0ded41738', '147dfb84-1808-5511-baa9-e30910f210f2', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('65945ed3-1293-59d9-9ced-2e078c2a5197', '147dfb84-1808-5511-baa9-e30910f210f2', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('b42be61d-1362-5470-8576-ce4894c328de', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-07-13T06:42:49+00:00'),
  ('6e9a59a6-cee7-510f-90b5-706d4917878f', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-07-13T06:44:29+00:00'),
  ('d9d2283a-c44f-536d-8bca-94ddf9cbc8d3', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'working', 3, 5, 92.5, 120, FALSE, '2026-07-13T06:47:24+00:00'),
  ('5d544b84-bcd9-55c0-94ad-c1f45bc75832', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'working', 4, 5, 92.5, 90, FALSE, '2026-07-13T06:49:49+00:00'),
  ('b84bec4d-b8cc-56c5-8858-eec846b0d9fd', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'working', 5, 5, 92.5, 90, FALSE, '2026-07-13T06:52:14+00:00'),
  ('75883f8a-5edb-5c3f-8c4e-491fb089ac41', '1c5b0ec2-3c77-512a-88a7-2c4818f5c732', 'working', 6, 5, 92.5, 60, FALSE, '2026-07-13T06:54:09+00:00'),
  ('472797ab-4c30-5faa-8733-8ed9ab9590b1', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-07-13T06:55:58+00:00'),
  ('c8b7799d-35e0-5e6c-be11-cedce233d98d', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'warmup', 2, 5, 62.5, NULL, FALSE, '2026-07-13T06:57:38+00:00'),
  ('2a391982-9438-5064-8dfc-13fa762c7479', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'working', 3, 6, 82.5, 90, FALSE, '2026-07-13T07:00:06+00:00'),
  ('2d06a4f1-0460-55cb-ad0a-c90a84648830', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'working', 4, 6, 82.5, 120, FALSE, '2026-07-13T07:03:04+00:00'),
  ('5c2a0ec1-720e-57dd-8e5a-33df6681c482', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'working', 5, 6, 82.5, 150, FALSE, '2026-07-13T07:06:32+00:00'),
  ('02af3532-7e55-50a8-a76b-d23d9b5d2172', 'c77f5ff7-5721-58d9-8f18-ce94136cfbc5', 'working', 6, 5, 82.5, 150, FALSE, '2026-07-13T07:09:57+00:00'),
  ('82540643-8802-563b-a0a5-1a52010d6f5f', '257f50d6-3202-5cda-9e87-103703d24014', 'working', 1, 8, 36.0, 90, FALSE, '2026-07-13T07:12:31+00:00'),
  ('ca2b7017-a1db-5f22-8e15-3f3b13736190', '257f50d6-3202-5cda-9e87-103703d24014', 'working', 2, 8, 36.0, 90, FALSE, '2026-07-13T07:15:05+00:00'),
  ('cdfb57bd-96a0-5715-9464-083a31fcd8d5', '257f50d6-3202-5cda-9e87-103703d24014', 'dropset', 3, 11, 28.0, 120, FALSE, '2026-07-13T07:18:18+00:00'),
  ('5bfd9db8-68bb-5c83-a8df-d50d4c47f49f', 'c22c77a6-ae15-5f70-bb90-b9c0ded41738', 'working', 1, 10, 0.0, 90, FALSE, '2026-07-13T07:20:58+00:00'),
  ('679a5d38-4d9c-5b28-9c6c-67e022876ba0', 'c22c77a6-ae15-5f70-bb90-b9c0ded41738', 'working', 2, 9, 0.0, 150, FALSE, '2026-07-13T07:24:35+00:00'),
  ('39702778-85b1-5555-8dbb-74d2cdd4e2f8', 'c22c77a6-ae15-5f70-bb90-b9c0ded41738', 'working', 3, 10, 0.0, 60, FALSE, '2026-07-13T07:26:45+00:00'),
  ('416473fe-9bf6-53b3-99bd-e78b426f5442', 'c22c77a6-ae15-5f70-bb90-b9c0ded41738', 'working', 4, 10, 0.0, 90, FALSE, '2026-07-13T07:29:25+00:00'),
  ('9ea79ae8-1e38-527d-9903-802de685aab7', '65945ed3-1293-59d9-9ced-2e078c2a5197', 'working', 1, 10, 32.5, 150, FALSE, '2026-07-13T07:33:05+00:00'),
  ('9ec933d1-1043-5b47-abe0-2b43dae69d4c', '65945ed3-1293-59d9-9ced-2e078c2a5197', 'working', 2, 10, 32.5, 90, FALSE, '2026-07-13T07:35:45+00:00'),
  ('55c5377d-3fef-543c-aad6-9dbe4a96eab7', '65945ed3-1293-59d9-9ced-2e078c2a5197', 'working', 3, 10, 32.5, 120, FALSE, '2026-07-13T07:38:55+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2aab4e18-e313-5ace-b436-b08a8aaed1a0', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-07-14T06:23:00+00:00', '2026-07-14T07:27:46+00:00', 3886, 10785.0, FALSE, 84.0, 'gym', 159);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('10223f2f-f555-5961-83b7-898812437e42', '2aab4e18-e313-5ace-b436-b08a8aaed1a0', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('9bbe94f5-d80f-54e0-837e-51847e8bd750', '2aab4e18-e313-5ace-b436-b08a8aaed1a0', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('86cca203-d15f-5d1d-a5e2-de960b82bfee', '2aab4e18-e313-5ace-b436-b08a8aaed1a0', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('fac082de-f45e-5779-ad61-0b294d3d208c', '2aab4e18-e313-5ace-b436-b08a8aaed1a0', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('1cc3a61a-8f5f-5fa4-a54c-5d080bba2f3d', '2aab4e18-e313-5ace-b436-b08a8aaed1a0', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a0979ce3-892b-5d0e-b19e-94c55e5571e7', '10223f2f-f555-5961-83b7-898812437e42', 'warmup', 1, 8, 65.0, NULL, FALSE, '2026-07-14T06:29:49+00:00'),
  ('50f46b5a-7569-542e-bc26-f0532501ac5a', '10223f2f-f555-5961-83b7-898812437e42', 'warmup', 2, 5, 97.5, NULL, FALSE, '2026-07-14T06:31:29+00:00'),
  ('9352b4a7-d71e-5c87-ac12-41779582f9f3', '10223f2f-f555-5961-83b7-898812437e42', 'working', 3, 5, 130.0, 90, FALSE, '2026-07-14T06:33:54+00:00'),
  ('2be25446-96e0-564b-95d5-6a202fea9d84', '10223f2f-f555-5961-83b7-898812437e42', 'working', 4, 5, 130.0, 90, FALSE, '2026-07-14T06:36:19+00:00'),
  ('eda6eed4-23c0-57dd-b4cb-17d32a194a84', '10223f2f-f555-5961-83b7-898812437e42', 'working', 5, 5, 130.0, 120, FALSE, '2026-07-14T06:39:14+00:00'),
  ('d399434f-c18c-53cd-8cfa-6d2f3ca86b80', '10223f2f-f555-5961-83b7-898812437e42', 'working', 6, 3, 130.0, 150, FALSE, '2026-07-14T06:42:33+00:00'),
  ('e552c6bb-a557-5091-99bd-502ce2dce3af', '9bbe94f5-d80f-54e0-837e-51847e8bd750', 'working', 1, 8, 102.5, 150, FALSE, '2026-07-14T06:46:07+00:00'),
  ('5df588b5-b0d6-533f-a9b9-607d30ad1b55', '9bbe94f5-d80f-54e0-837e-51847e8bd750', 'working', 2, 8, 102.5, 120, FALSE, '2026-07-14T06:49:11+00:00'),
  ('15f91afb-43f4-5862-8ba9-ab90ba91acd6', '9bbe94f5-d80f-54e0-837e-51847e8bd750', 'failure', 3, 8, 102.5, 120, FALSE, '2026-07-14T06:52:15+00:00'),
  ('b297333f-2500-5360-be3d-184c85dd7fbc', '86cca203-d15f-5d1d-a5e2-de960b82bfee', 'working', 1, 10, 47.5, 150, FALSE, '2026-07-14T06:55:55+00:00'),
  ('0b8bca0f-2f97-5370-9c5c-8d932e9c508d', '86cca203-d15f-5d1d-a5e2-de960b82bfee', 'working', 2, 10, 47.5, 90, FALSE, '2026-07-14T06:58:35+00:00'),
  ('a23e71f3-9e79-5d88-a39d-0e28e1752c52', '86cca203-d15f-5d1d-a5e2-de960b82bfee', 'failure', 3, 10, 47.5, 150, FALSE, '2026-07-14T07:02:15+00:00'),
  ('dfb6a97f-a5df-5f49-80e0-ea3567e1d33f', 'fac082de-f45e-5779-ad61-0b294d3d208c', 'working', 1, 12, 95.0, 150, FALSE, '2026-07-14T07:06:01+00:00'),
  ('d2ef1d71-547e-5882-a71a-105bb2f8f298', 'fac082de-f45e-5779-ad61-0b294d3d208c', 'working', 2, 12, 95.0, 60, FALSE, '2026-07-14T07:08:17+00:00'),
  ('319d8cc5-6978-50fd-b5d7-5412cde25b23', 'fac082de-f45e-5779-ad61-0b294d3d208c', 'working', 3, 12, 95.0, 60, FALSE, '2026-07-14T07:10:33+00:00'),
  ('d79c37af-ef44-5402-b3a2-4b5f661d6258', 'fac082de-f45e-5779-ad61-0b294d3d208c', 'working', 4, 12, 95.0, 150, FALSE, '2026-07-14T07:14:19+00:00'),
  ('825b7381-5fa6-5ebc-943f-f37fd1d5639d', '1cc3a61a-8f5f-5fa4-a54c-5d080bba2f3d', 'working', 1, 13, 0.0, 150, FALSE, '2026-07-14T07:18:08+00:00'),
  ('287fd8dd-f846-5244-beb2-f68d15520cc8', '1cc3a61a-8f5f-5fa4-a54c-5d080bba2f3d', 'working', 2, 13, 0.0, 150, FALSE, '2026-07-14T07:21:57+00:00'),
  ('9f9ddc69-c94f-57ba-95dc-ee150666d2b2', '1cc3a61a-8f5f-5fa4-a54c-5d080bba2f3d', 'working', 3, 13, 0.0, 90, FALSE, '2026-07-14T07:24:46+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('5536a523-f7c2-5b89-812f-21b26d8a1b6e', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-07-16T06:11:00+00:00', '2026-07-16T07:09:49+00:00', 3529, 3760.25, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b625c46a-7537-5db3-85c1-646102a0e192', '5536a523-f7c2-5b89-812f-21b26d8a1b6e', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('9fa727f7-b0b2-5cb8-943b-b9bd7313bc89', '5536a523-f7c2-5b89-812f-21b26d8a1b6e', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('1fa79d32-2146-529c-9591-40d81cd32cd0', '5536a523-f7c2-5b89-812f-21b26d8a1b6e', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('65ba230c-7f45-5f4d-a717-a2fc3b6268ff', '5536a523-f7c2-5b89-812f-21b26d8a1b6e', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('72141315-5c83-5f14-b987-a5a6085fb9ab', '5536a523-f7c2-5b89-812f-21b26d8a1b6e', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0712b98d-890f-583b-8c91-ada2daf69116', 'b625c46a-7537-5db3-85c1-646102a0e192', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-07-16T06:17:49+00:00'),
  ('dc0bd3da-9575-5f51-9cad-a7e931ff6cc8', 'b625c46a-7537-5db3-85c1-646102a0e192', 'warmup', 2, 5, 42.5, NULL, FALSE, '2026-07-16T06:19:29+00:00'),
  ('9e9e45da-4de2-5399-942f-f5e78f97b7ab', 'b625c46a-7537-5db3-85c1-646102a0e192', 'working', 3, 5, 57.5, 90, FALSE, '2026-07-16T06:21:54+00:00'),
  ('587f722d-d6c1-56bc-89fc-b066dca98084', 'b625c46a-7537-5db3-85c1-646102a0e192', 'working', 4, 5, 57.5, 60, FALSE, '2026-07-16T06:23:49+00:00'),
  ('438a959e-f727-513c-b87c-72c00eef61cf', 'b625c46a-7537-5db3-85c1-646102a0e192', 'working', 5, 5, 57.5, 60, FALSE, '2026-07-16T06:25:44+00:00'),
  ('4d3a9a87-a96e-5162-8cf0-7ccc950af317', 'b625c46a-7537-5db3-85c1-646102a0e192', 'working', 6, 4, 57.5, 90, FALSE, '2026-07-16T06:28:06+00:00'),
  ('493612d5-63cd-5831-9e43-87cba2617167', '9fa727f7-b0b2-5cb8-943b-b9bd7313bc89', 'working', 1, 9, 0.0, 60, FALSE, '2026-07-16T06:30:13+00:00'),
  ('2f347d5c-a743-5a64-b757-2dbe09bd0bdf', '9fa727f7-b0b2-5cb8-943b-b9bd7313bc89', 'working', 2, 11, 0.0, 90, FALSE, '2026-07-16T06:32:56+00:00'),
  ('0514a44e-5f16-578b-819b-19ca8b51e095', '9fa727f7-b0b2-5cb8-943b-b9bd7313bc89', 'working', 3, 8, 0.0, 120, FALSE, '2026-07-16T06:36:00+00:00'),
  ('a063cebc-f33c-54be-badd-6d76377f8e05', '9fa727f7-b0b2-5cb8-943b-b9bd7313bc89', 'working', 4, 8, 0.0, 90, FALSE, '2026-07-16T06:38:34+00:00'),
  ('43205961-fe57-510c-9901-4a0e92721f84', '1fa79d32-2146-529c-9591-40d81cd32cd0', 'working', 1, 10, 36.0, 60, FALSE, '2026-07-16T06:40:44+00:00'),
  ('ce999259-76ca-5490-bd49-4eabb60bb543', '1fa79d32-2146-529c-9591-40d81cd32cd0', 'working', 2, 10, 36.0, 120, FALSE, '2026-07-16T06:43:54+00:00'),
  ('d80d9cc5-265e-5432-948f-96d88bdedf3c', '1fa79d32-2146-529c-9591-40d81cd32cd0', 'failure', 3, 9, 36.0, 150, FALSE, '2026-07-16T06:47:31+00:00'),
  ('6e84175f-b2e5-5c0f-a5f7-30e1fc949953', '65ba230c-7f45-5f4d-a717-a2fc3b6268ff', 'working', 1, 15, 11.25, 90, FALSE, '2026-07-16T06:50:26+00:00'),
  ('ab25ea89-b9fb-5ac2-b243-a8a47c3d2afa', '65ba230c-7f45-5f4d-a717-a2fc3b6268ff', 'working', 2, 15, 11.25, 150, FALSE, '2026-07-16T06:54:21+00:00'),
  ('57cf4c6c-7938-530e-822c-79f3e3a90186', '65ba230c-7f45-5f4d-a717-a2fc3b6268ff', 'failure', 3, 13, 11.25, 90, FALSE, '2026-07-16T06:57:10+00:00'),
  ('cf075d99-b8f5-53ed-adbe-f934355e969b', '72141315-5c83-5f14-b987-a5a6085fb9ab', 'working', 1, 10, 37.5, 150, FALSE, '2026-07-16T07:00:50+00:00'),
  ('3a26d172-c1bd-5c59-828c-4875201c1228', '72141315-5c83-5f14-b987-a5a6085fb9ab', 'working', 2, 10, 37.5, 90, FALSE, '2026-07-16T07:03:30+00:00'),
  ('abc3d7f4-60fb-56f7-bd58-6cb0d8c95cfe', '72141315-5c83-5f14-b987-a5a6085fb9ab', 'dropset', 3, 13, 30.0, 120, FALSE, '2026-07-16T07:06:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('41a87d03-ed8d-563c-80e8-2343ff6d050e', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-07-18T06:15:00+00:00', '2026-07-18T07:01:42+00:00', 2802, 12315.0, FALSE, 84.0, 'gym', 111);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('cbbfaab8-3189-5b5b-953d-59d1d5373c15', '41a87d03-ed8d-563c-80e8-2343ff6d050e', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('09a7bc8e-e08d-5c03-9b94-7e31c46b4df3', '41a87d03-ed8d-563c-80e8-2343ff6d050e', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('e910f87d-ee6d-5ee0-b052-1a08f2ec12d8', '41a87d03-ed8d-563c-80e8-2343ff6d050e', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('51d83b32-fe20-55fc-8228-65513b5f79e0', '41a87d03-ed8d-563c-80e8-2343ff6d050e', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('01141391-ad82-53df-a5c2-ff65e6599264', 'cbbfaab8-3189-5b5b-953d-59d1d5373c15', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-07-18T06:21:49+00:00'),
  ('664cdb08-1dbe-5000-ad59-49c0d916d232', 'cbbfaab8-3189-5b5b-953d-59d1d5373c15', 'warmup', 2, 5, 115.0, NULL, FALSE, '2026-07-18T06:23:29+00:00'),
  ('8d8e39e8-4100-58e3-ba03-ffaef32204e4', 'cbbfaab8-3189-5b5b-953d-59d1d5373c15', 'working', 3, 5, 155.0, 60, FALSE, '2026-07-18T06:25:24+00:00'),
  ('f1c3e9db-89cb-5f65-ae2b-dd9ca72604d9', 'cbbfaab8-3189-5b5b-953d-59d1d5373c15', 'working', 4, 5, 155.0, 60, FALSE, '2026-07-18T06:27:19+00:00'),
  ('05cf3d7c-db0d-5196-ad0d-51b68dade8c4', 'cbbfaab8-3189-5b5b-953d-59d1d5373c15', 'working', 5, 5, 155.0, 90, FALSE, '2026-07-18T06:29:44+00:00'),
  ('03ea87be-1a10-5e91-9db3-09744d21e6d3', '09a7bc8e-e08d-5c03-9b94-7e31c46b4df3', 'working', 1, 8, 130.0, 90, FALSE, '2026-07-18T06:32:18+00:00'),
  ('bd09c028-6b3c-5d9f-998e-3e7476bcc1ac', '09a7bc8e-e08d-5c03-9b94-7e31c46b4df3', 'working', 2, 8, 130.0, 150, FALSE, '2026-07-18T06:35:52+00:00'),
  ('bfc91a67-d3d3-5fcb-a031-2d05749d3e87', '09a7bc8e-e08d-5c03-9b94-7e31c46b4df3', 'working', 3, 6, 130.0, 90, FALSE, '2026-07-18T06:38:20+00:00'),
  ('3ee25578-2e3e-5783-88c3-1831f7ecb21c', 'e910f87d-ee6d-5ee0-b052-1a08f2ec12d8', 'working', 1, 8, 107.5, 150, FALSE, '2026-07-18T06:41:54+00:00'),
  ('f36b4397-aa08-5b7f-b92d-52e1aec552a0', 'e910f87d-ee6d-5ee0-b052-1a08f2ec12d8', 'working', 2, 8, 107.5, 90, FALSE, '2026-07-18T06:44:28+00:00'),
  ('6c87cf85-c232-5177-b8ed-0ce2e310cf41', 'e910f87d-ee6d-5ee0-b052-1a08f2ec12d8', 'dropset', 3, 10, 85.0, 120, FALSE, '2026-07-18T06:47:38+00:00'),
  ('36b51909-c3a6-5842-92ee-89cac47fe891', '51d83b32-fe20-55fc-8228-65513b5f79e0', 'working', 1, 12, 95.0, 60, FALSE, '2026-07-18T06:49:54+00:00'),
  ('9171bea1-a697-523f-a2d5-db5cd2986dce', '51d83b32-fe20-55fc-8228-65513b5f79e0', 'working', 2, 12, 95.0, 90, FALSE, '2026-07-18T06:52:40+00:00'),
  ('65829889-bd6e-59cc-b3da-62d4ae874fc4', '51d83b32-fe20-55fc-8228-65513b5f79e0', 'working', 3, 12, 95.0, 60, FALSE, '2026-07-18T06:54:56+00:00'),
  ('85274491-05a4-542f-9c14-eecb98f941db', '51d83b32-fe20-55fc-8228-65513b5f79e0', 'failure', 4, 12, 95.0, 150, FALSE, '2026-07-18T06:58:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1da4c8e3-facb-5b5c-b04e-8602c07e0c29', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-07-20T06:17:00+00:00', '2026-07-20T07:23:25+00:00', 3985, 5633.0, FALSE, 84.0, 'gym', 139);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('64de018e-858a-5afe-b549-1879c71628d3', '1da4c8e3-facb-5b5c-b04e-8602c07e0c29', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('8d8b3b4e-cb23-54ea-84a2-1154d9708e56', '1da4c8e3-facb-5b5c-b04e-8602c07e0c29', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('930144b4-f6c6-5b96-a8a9-ac614eb2760b', '1da4c8e3-facb-5b5c-b04e-8602c07e0c29', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('6abe775e-d143-5ee6-ac0e-d44526e78a9e', '1da4c8e3-facb-5b5c-b04e-8602c07e0c29', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('e3749054-f7e8-5d9a-9e06-bc75b3b6071e', '1da4c8e3-facb-5b5c-b04e-8602c07e0c29', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f3a4c860-0f0f-5e7f-b8e5-1e6e629c719c', '64de018e-858a-5afe-b549-1879c71628d3', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-07-20T06:23:49+00:00'),
  ('6167dc25-971f-516a-817d-078463d1b5de', '64de018e-858a-5afe-b549-1879c71628d3', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-07-20T06:25:29+00:00'),
  ('f7a6b86b-2de5-5188-9271-b4394c58638b', '64de018e-858a-5afe-b549-1879c71628d3', 'working', 3, 5, 92.5, 150, FALSE, '2026-07-20T06:28:54+00:00'),
  ('c9555cd0-df6d-5eb2-989a-207ac878e6fb', '64de018e-858a-5afe-b549-1879c71628d3', 'working', 4, 5, 92.5, 90, FALSE, '2026-07-20T06:31:19+00:00'),
  ('434e665d-d9bf-59f1-9901-46a5b49e2500', '64de018e-858a-5afe-b549-1879c71628d3', 'working', 5, 5, 92.5, 150, FALSE, '2026-07-20T06:34:44+00:00'),
  ('0d7c86ef-355c-5299-b8a5-796e1ae20b86', '64de018e-858a-5afe-b549-1879c71628d3', 'working', 6, 5, 92.5, 90, FALSE, '2026-07-20T06:37:09+00:00'),
  ('69a40a70-160d-5f59-b5c6-a85ec2fe0bc7', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-07-20T06:38:58+00:00'),
  ('46583c13-905f-5dd1-99fb-f93118cead99', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'warmup', 2, 5, 62.5, NULL, FALSE, '2026-07-20T06:40:38+00:00'),
  ('afb01361-9112-546a-b078-f7a299035145', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'working', 3, 6, 82.5, 90, FALSE, '2026-07-20T06:43:06+00:00'),
  ('ea7800d1-b4e2-5ba5-83d9-e25ae8819b69', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'working', 4, 6, 82.5, 150, FALSE, '2026-07-20T06:46:34+00:00'),
  ('228a165a-2814-5ba1-b6da-57555c8d5790', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'working', 5, 6, 82.5, 120, FALSE, '2026-07-20T06:49:32+00:00'),
  ('29bbca68-8f89-5148-b2de-3ab0536828ff', '8d8b3b4e-cb23-54ea-84a2-1154d9708e56', 'working', 6, 6, 82.5, 120, FALSE, '2026-07-20T06:52:30+00:00'),
  ('2abe63a4-407c-5075-b6c4-7623e2b56b1e', '930144b4-f6c6-5b96-a8a9-ac614eb2760b', 'working', 1, 8, 36.0, 90, FALSE, '2026-07-20T06:55:04+00:00'),
  ('f0f98e87-ada8-5a3c-9151-3870ee5c2602', '930144b4-f6c6-5b96-a8a9-ac614eb2760b', 'working', 2, 8, 36.0, 120, FALSE, '2026-07-20T06:58:08+00:00'),
  ('380114bb-720a-590f-afba-c08e58efa6d1', '930144b4-f6c6-5b96-a8a9-ac614eb2760b', 'failure', 3, 7, 36.0, 90, FALSE, '2026-07-20T07:00:39+00:00'),
  ('bb547652-46e9-5bce-91e3-81211a7ae5c6', '6abe775e-d143-5ee6-ac0e-d44526e78a9e', 'working', 1, 10, 0.0, 90, FALSE, '2026-07-20T07:03:19+00:00'),
  ('6ec7511b-a754-5f66-b71c-796c8655273f', '6abe775e-d143-5ee6-ac0e-d44526e78a9e', 'working', 2, 10, 0.0, 60, FALSE, '2026-07-20T07:05:29+00:00'),
  ('0fc4f15d-2f58-54be-b6b6-23fdcaf87894', '6abe775e-d143-5ee6-ac0e-d44526e78a9e', 'working', 3, 11, 0.0, 120, FALSE, '2026-07-20T07:08:42+00:00'),
  ('c00c36d0-74b7-5325-bf47-be6b8b312393', '6abe775e-d143-5ee6-ac0e-d44526e78a9e', 'failure', 4, 11, 0.0, 60, FALSE, '2026-07-20T07:10:55+00:00'),
  ('2ca33298-bc33-56e7-8245-f6cd231dc94b', 'e3749054-f7e8-5d9a-9e06-bc75b3b6071e', 'working', 1, 10, 32.5, 120, FALSE, '2026-07-20T07:14:05+00:00'),
  ('9410f1f7-5826-53d9-b37a-2d5623c9ecc4', 'e3749054-f7e8-5d9a-9e06-bc75b3b6071e', 'working', 2, 10, 32.5, 90, FALSE, '2026-07-20T07:16:45+00:00'),
  ('bb0a1c60-3ff0-5b7c-a27b-ad0d98d91f57', 'e3749054-f7e8-5d9a-9e06-bc75b3b6071e', 'working', 3, 10, 32.5, 150, FALSE, '2026-07-20T07:20:25+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('0f15f41d-31fe-5d68-a5dd-ae0877b0974d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-07-21T06:14:00+00:00', '2026-07-21T07:14:07+00:00', 3607, 10777.5, FALSE, 84.0, 'gym', 166);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('dd528136-5a62-56d1-8a4e-caf8be425b2f', '0f15f41d-31fe-5d68-a5dd-ae0877b0974d', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('9ab1d90d-68c4-5216-a03e-4c9d104ada7a', '0f15f41d-31fe-5d68-a5dd-ae0877b0974d', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('81603c2b-b2c9-53c9-9ccd-c22552cac6f1', '0f15f41d-31fe-5d68-a5dd-ae0877b0974d', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('abfeb8b2-1574-5367-b26d-39576c3b8eb1', '0f15f41d-31fe-5d68-a5dd-ae0877b0974d', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('6eb2be43-0b41-5f72-9697-a2f3a6fb6a02', '0f15f41d-31fe-5d68-a5dd-ae0877b0974d', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a4215cce-6379-58a9-bdfe-884bc032b2ee', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'warmup', 1, 8, 65.0, NULL, FALSE, '2026-07-21T06:20:49+00:00'),
  ('7517585f-7be9-56b5-ba9b-9d6092414a63', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'warmup', 2, 5, 97.5, NULL, FALSE, '2026-07-21T06:22:29+00:00'),
  ('6968dc8d-86f4-5d24-8a35-8a6387b3f3e9', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'working', 3, 5, 130.0, 60, FALSE, '2026-07-21T06:24:24+00:00'),
  ('ea764464-e659-539a-b09c-5b2ace1e7b73', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'working', 4, 5, 130.0, 90, FALSE, '2026-07-21T06:26:49+00:00'),
  ('95a0e877-a52a-58ca-872d-db4a43597479', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'working', 5, 5, 130.0, 90, FALSE, '2026-07-21T06:29:14+00:00'),
  ('5eb11fd2-b1ab-564a-acf5-1827d1f2f593', 'dd528136-5a62-56d1-8a4e-caf8be425b2f', 'working', 6, 5, 130.0, 120, FALSE, '2026-07-21T06:32:09+00:00'),
  ('3f9211aa-c967-558f-b7bd-2d6563138965', '9ab1d90d-68c4-5216-a03e-4c9d104ada7a', 'working', 1, 8, 102.5, 150, FALSE, '2026-07-21T06:35:43+00:00'),
  ('c7c3caec-e12e-56ba-aaf0-11ff4a60c0cd', '9ab1d90d-68c4-5216-a03e-4c9d104ada7a', 'working', 2, 8, 102.5, 150, FALSE, '2026-07-21T06:39:17+00:00'),
  ('3e0c7fd2-7a03-598d-9b2e-d31e71ead0a0', '9ab1d90d-68c4-5216-a03e-4c9d104ada7a', 'dropset', 3, 9, 82.5, 150, FALSE, '2026-07-21T06:42:54+00:00'),
  ('a2ccf312-700f-5a94-9bd1-e91064837805', '81603c2b-b2c9-53c9-9ccd-c22552cac6f1', 'working', 1, 10, 47.5, 120, FALSE, '2026-07-21T06:46:04+00:00'),
  ('1631634f-fa82-5b84-9402-20bc67ba1732', '81603c2b-b2c9-53c9-9ccd-c22552cac6f1', 'working', 2, 10, 47.5, 90, FALSE, '2026-07-21T06:48:44+00:00'),
  ('3e5cbcd5-fdd9-5f91-b754-b23d95cafc2d', '81603c2b-b2c9-53c9-9ccd-c22552cac6f1', 'dropset', 3, 12, 37.5, 90, FALSE, '2026-07-21T06:51:30+00:00'),
  ('4d3ee23d-2331-5fec-9e16-d9e4475b8782', 'abfeb8b2-1574-5367-b26d-39576c3b8eb1', 'working', 1, 12, 95.0, 60, FALSE, '2026-07-21T06:53:46+00:00'),
  ('2f5c6dd6-bb54-5fac-8998-110110f455e3', 'abfeb8b2-1574-5367-b26d-39576c3b8eb1', 'working', 2, 12, 95.0, 90, FALSE, '2026-07-21T06:56:32+00:00'),
  ('4fcb18b6-31f7-5b02-883a-641506c90d87', 'abfeb8b2-1574-5367-b26d-39576c3b8eb1', 'working', 3, 12, 95.0, 90, FALSE, '2026-07-21T06:59:18+00:00'),
  ('77f1b971-bdae-53c0-ade5-75ce5f20addb', 'abfeb8b2-1574-5367-b26d-39576c3b8eb1', 'dropset', 4, 13, 75.0, 90, FALSE, '2026-07-21T07:02:07+00:00'),
  ('e162c1c4-c266-5999-b992-e5a9da701b3c', '6eb2be43-0b41-5f72-9697-a2f3a6fb6a02', 'working', 1, 12, 0.0, 150, FALSE, '2026-07-21T07:05:53+00:00'),
  ('463fccda-faff-51ae-a642-4598b0abb307', '6eb2be43-0b41-5f72-9697-a2f3a6fb6a02', 'working', 2, 14, 0.0, 90, FALSE, '2026-07-21T07:08:45+00:00'),
  ('b68a495d-4594-5a0e-bb00-14de4f82da58', '6eb2be43-0b41-5f72-9697-a2f3a6fb6a02', 'dropset', 3, 14, 0.0, 60, FALSE, '2026-07-21T07:11:07+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('89119a56-d6df-541a-8157-ab612250e48d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-07-23T06:23:00+00:00', '2026-07-23T07:24:49+00:00', 3709, 3835.0, FALSE, 84.0, 'gym', 170);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('fd5ff635-8b03-5460-bd04-189de63e5a4d', '89119a56-d6df-541a-8157-ab612250e48d', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('25b4c960-896d-5b80-969b-ea277b0eb3e0', '89119a56-d6df-541a-8157-ab612250e48d', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('34c9a7aa-d9e2-56af-bbac-c2f72219d71b', '89119a56-d6df-541a-8157-ab612250e48d', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('569f222a-6a6b-5067-a3e6-3b133f9da8f2', '89119a56-d6df-541a-8157-ab612250e48d', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('e7a73d2e-b849-5072-86ef-d474d5e30278', '89119a56-d6df-541a-8157-ab612250e48d', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('532a6859-4601-5c1b-aa4a-e7b89b6d4ba9', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-07-23T06:29:49+00:00'),
  ('92a7510c-5895-5082-9ce5-a6a417cd5548', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'warmup', 2, 5, 42.5, NULL, FALSE, '2026-07-23T06:31:29+00:00'),
  ('7879da59-0a2d-5c75-a6d6-ef0efd296714', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'working', 3, 5, 57.5, 60, FALSE, '2026-07-23T06:33:24+00:00'),
  ('63104d22-5846-5c77-a2da-522a5bd4cdf9', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'working', 4, 5, 57.5, 90, FALSE, '2026-07-23T06:35:49+00:00'),
  ('136f2206-aa75-5cbf-abfa-9468a0de25d5', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'working', 5, 5, 57.5, 90, FALSE, '2026-07-23T06:38:14+00:00'),
  ('488cb1d7-6829-50f6-96fd-445451673e3b', 'fd5ff635-8b03-5460-bd04-189de63e5a4d', 'working', 6, 5, 57.5, 120, FALSE, '2026-07-23T06:41:09+00:00'),
  ('742f46d2-56fa-56a6-b3e0-973478ba9eac', '25b4c960-896d-5b80-969b-ea277b0eb3e0', 'working', 1, 8, 0.0, 120, FALSE, '2026-07-23T06:44:13+00:00'),
  ('b3b6f8e6-adaf-53cb-a1ce-df13419c6a9b', '25b4c960-896d-5b80-969b-ea277b0eb3e0', 'working', 2, 11, 0.0, 120, FALSE, '2026-07-23T06:47:26+00:00'),
  ('1dc72459-3212-5921-a585-562fe5b2be56', '25b4c960-896d-5b80-969b-ea277b0eb3e0', 'working', 3, 11, 0.0, 120, FALSE, '2026-07-23T06:50:39+00:00'),
  ('263d3ca8-cf5c-592c-b8d9-52debdfad833', '25b4c960-896d-5b80-969b-ea277b0eb3e0', 'failure', 4, 10, 0.0, 120, FALSE, '2026-07-23T06:53:49+00:00'),
  ('6fac868d-43dd-59f3-82ea-e2410fd10024', '34c9a7aa-d9e2-56af-bbac-c2f72219d71b', 'working', 1, 10, 36.0, 120, FALSE, '2026-07-23T06:56:59+00:00'),
  ('dc179670-0b5e-5723-bcd1-fd555e767c21', '34c9a7aa-d9e2-56af-bbac-c2f72219d71b', 'working', 2, 10, 36.0, 90, FALSE, '2026-07-23T06:59:39+00:00'),
  ('d7ab4f22-bbe7-576f-9ee1-fb7a36dc4eaf', '34c9a7aa-d9e2-56af-bbac-c2f72219d71b', 'failure', 3, 10, 36.0, 120, FALSE, '2026-07-23T07:02:49+00:00'),
  ('3bf69c40-b1bd-51a2-a38f-0691d26aac7d', '569f222a-6a6b-5067-a3e6-3b133f9da8f2', 'working', 1, 15, 11.25, 60, FALSE, '2026-07-23T07:05:14+00:00'),
  ('3bb211a2-f002-56cc-bd81-791faf12510e', '569f222a-6a6b-5067-a3e6-3b133f9da8f2', 'working', 2, 15, 11.25, 120, FALSE, '2026-07-23T07:08:39+00:00'),
  ('93f503b8-b8a1-5f02-988b-6448c4691ffe', '569f222a-6a6b-5067-a3e6-3b133f9da8f2', 'dropset', 3, 18, 8.75, 150, FALSE, '2026-07-23T07:12:43+00:00'),
  ('5421f744-97a8-5e7a-9cd0-2680888431ee', 'e7a73d2e-b849-5072-86ef-d474d5e30278', 'working', 1, 10, 37.5, 60, FALSE, '2026-07-23T07:14:53+00:00'),
  ('c9d24be5-632c-5491-a001-a7faff716f54', 'e7a73d2e-b849-5072-86ef-d474d5e30278', 'working', 2, 10, 37.5, 150, FALSE, '2026-07-23T07:18:33+00:00'),
  ('82470400-5bec-5555-baaf-029a172a59b7', 'e7a73d2e-b849-5072-86ef-d474d5e30278', 'dropset', 3, 12, 30.0, 120, FALSE, '2026-07-23T07:21:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('2692c3a7-e788-5728-aed8-7965a3560e0b', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-07-25T06:08:00+00:00', '2026-07-25T06:55:27+00:00', 2847, 12670.0, FALSE, 84.0, 'gym', 116);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('f37ed8e2-ce57-5023-98c1-bc28b8252c6a', '2692c3a7-e788-5728-aed8-7965a3560e0b', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('fcaf2394-e17d-59db-b109-3976b1388346', '2692c3a7-e788-5728-aed8-7965a3560e0b', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('51a7498a-32ef-5f53-bcfa-9f347d68ac23', '2692c3a7-e788-5728-aed8-7965a3560e0b', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('ecbb1bde-c6d2-5aad-9ac4-dbcac605a14e', '2692c3a7-e788-5728-aed8-7965a3560e0b', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1661c632-2286-5dd3-96f4-1521f14c4c9c', 'f37ed8e2-ce57-5023-98c1-bc28b8252c6a', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-07-25T06:14:49+00:00'),
  ('bad03e69-f8f2-5966-b8af-a016ed6eb866', 'f37ed8e2-ce57-5023-98c1-bc28b8252c6a', 'warmup', 2, 5, 115.0, NULL, FALSE, '2026-07-25T06:16:29+00:00'),
  ('772147c0-538b-5619-af38-5d589899b784', 'f37ed8e2-ce57-5023-98c1-bc28b8252c6a', 'working', 3, 5, 155.0, 60, FALSE, '2026-07-25T06:18:24+00:00'),
  ('bd24dcf5-3b92-58d6-b26e-8b36c87aaa99', 'f37ed8e2-ce57-5023-98c1-bc28b8252c6a', 'working', 4, 5, 155.0, 90, FALSE, '2026-07-25T06:20:49+00:00'),
  ('72f40dcb-b1b3-5769-81ef-0b8224e5ba26', 'f37ed8e2-ce57-5023-98c1-bc28b8252c6a', 'working', 5, 5, 155.0, 60, FALSE, '2026-07-25T06:22:44+00:00'),
  ('c40c9cf9-83ea-5d47-a4ba-8bf796acd67a', 'fcaf2394-e17d-59db-b109-3976b1388346', 'working', 1, 8, 130.0, 150, FALSE, '2026-07-25T06:26:18+00:00'),
  ('9120c3df-c4ce-5fb7-ab94-30d3df075ccc', 'fcaf2394-e17d-59db-b109-3976b1388346', 'working', 2, 8, 130.0, 120, FALSE, '2026-07-25T06:29:22+00:00'),
  ('ea985017-1d99-5d88-9505-a12ffe767c97', 'fcaf2394-e17d-59db-b109-3976b1388346', 'dropset', 3, 10, 105.0, 120, FALSE, '2026-07-25T06:32:32+00:00'),
  ('01b8c41f-5a26-5841-b9d7-e9ca76d387eb', '51a7498a-32ef-5f53-bcfa-9f347d68ac23', 'working', 1, 8, 107.5, 90, FALSE, '2026-07-25T06:35:06+00:00'),
  ('cec01466-3759-545a-8d3c-ead822ad876a', '51a7498a-32ef-5f53-bcfa-9f347d68ac23', 'working', 2, 8, 107.5, 90, FALSE, '2026-07-25T06:37:40+00:00'),
  ('3b4e0ad7-dc53-5fa6-b128-128696b4a681', '51a7498a-32ef-5f53-bcfa-9f347d68ac23', 'dropset', 3, 11, 85.0, 60, FALSE, '2026-07-25T06:39:53+00:00'),
  ('621d3af3-0da3-501a-ae75-8f056567f221', 'ecbb1bde-c6d2-5aad-9ac4-dbcac605a14e', 'working', 1, 12, 95.0, 90, FALSE, '2026-07-25T06:42:39+00:00'),
  ('472aa39a-6a67-5af9-b63a-fb5411002355', 'ecbb1bde-c6d2-5aad-9ac4-dbcac605a14e', 'working', 2, 12, 95.0, 150, FALSE, '2026-07-25T06:46:25+00:00'),
  ('78d8511b-ffef-596a-9410-6aa7f99647e1', 'ecbb1bde-c6d2-5aad-9ac4-dbcac605a14e', 'working', 3, 12, 95.0, 120, FALSE, '2026-07-25T06:49:41+00:00'),
  ('4c85f1c5-f84e-5b97-a864-fcfc1b01ea9f', 'ecbb1bde-c6d2-5aad-9ac4-dbcac605a14e', 'working', 4, 12, 95.0, 90, FALSE, '2026-07-25T06:52:27+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('85e6a59b-5efa-58a1-81bd-ee451f32eca6', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-07-27T06:25:00+00:00', '2026-07-27T07:32:46+00:00', 4066, 5817.0, FALSE, 84.0, 'gym', 136);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('39b259a7-3b40-5a82-9062-97c0e2891cf5', '85e6a59b-5efa-58a1-81bd-ee451f32eca6', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('a2d89837-ba9a-5a49-8778-b80d23c0f9e3', '85e6a59b-5efa-58a1-81bd-ee451f32eca6', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('f4f7f572-854d-5519-ba04-4a3530ad6998', '85e6a59b-5efa-58a1-81bd-ee451f32eca6', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('6744e041-41f6-5d33-8699-cecfe4c76d9c', '85e6a59b-5efa-58a1-81bd-ee451f32eca6', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('73f2cab5-2610-5835-bf2b-8d80e8f88cbe', '85e6a59b-5efa-58a1-81bd-ee451f32eca6', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6fb31aae-82ef-5f0d-9bda-c23d44d05898', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'warmup', 1, 8, 47.5, NULL, FALSE, '2026-07-27T06:31:49+00:00'),
  ('fb67a14b-cafa-5588-a34a-2f7b8924f8f3', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-07-27T06:33:29+00:00'),
  ('69293024-b455-57db-bcc2-8c006e3a0a0c', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'working', 3, 5, 95.0, 120, FALSE, '2026-07-27T06:36:24+00:00'),
  ('70d203f3-1a62-5169-a02e-991a936e5490', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'working', 4, 5, 95.0, 120, FALSE, '2026-07-27T06:39:19+00:00'),
  ('5fb96fa2-407c-50ad-9201-0dfeb70b1164', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'working', 5, 5, 95.0, 150, FALSE, '2026-07-27T06:42:44+00:00'),
  ('e42cb6f1-44c3-589a-8433-0d90e9ecae14', '39b259a7-3b40-5a82-9062-97c0e2891cf5', 'working', 6, 5, 95.0, 90, FALSE, '2026-07-27T06:45:09+00:00'),
  ('27e53d03-e150-5c44-910b-99df5d0d130e', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'warmup', 1, 8, 42.5, NULL, FALSE, '2026-07-27T06:46:58+00:00'),
  ('9c694b4f-9a9e-57ae-ae0b-248880912375', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-07-27T06:48:38+00:00'),
  ('30723f3e-0ec5-5698-b700-0658d1a4ce2e', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'working', 3, 6, 85.0, 120, FALSE, '2026-07-27T06:51:36+00:00'),
  ('1af5e499-ebfe-52a1-8497-351541f3a8ba', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'working', 4, 6, 85.0, 90, FALSE, '2026-07-27T06:54:04+00:00'),
  ('adeb1def-247a-5943-8beb-5b904a9fb4da', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'working', 5, 6, 85.0, 120, FALSE, '2026-07-27T06:57:02+00:00'),
  ('58e47115-450d-5a1e-8ee3-eace6a91f828', 'a2d89837-ba9a-5a49-8778-b80d23c0f9e3', 'working', 6, 5, 85.0, 150, FALSE, '2026-07-27T07:00:27+00:00'),
  ('8231b79e-03f7-5f65-b79c-7821e3085f4a', 'f4f7f572-854d-5519-ba04-4a3530ad6998', 'working', 1, 8, 38.0, 150, FALSE, '2026-07-27T07:04:01+00:00'),
  ('bb308382-7574-5e94-ae34-5d0f3a4090e5', 'f4f7f572-854d-5519-ba04-4a3530ad6998', 'working', 2, 8, 38.0, 120, FALSE, '2026-07-27T07:07:05+00:00'),
  ('1e0927cb-b632-5c10-b105-d6b56e9e6c98', 'f4f7f572-854d-5519-ba04-4a3530ad6998', 'working', 3, 8, 38.0, 90, FALSE, '2026-07-27T07:09:39+00:00'),
  ('4ad3e16f-06f0-5afc-bfe4-a89c5fbc7ae2', '6744e041-41f6-5d33-8699-cecfe4c76d9c', 'working', 1, 10, 0.0, 120, FALSE, '2026-07-27T07:12:49+00:00'),
  ('4be71f6f-f8d1-51ca-85b5-9f2169e0352a', '6744e041-41f6-5d33-8699-cecfe4c76d9c', 'working', 2, 11, 0.0, 60, FALSE, '2026-07-27T07:15:02+00:00'),
  ('9b622728-af2c-524a-aee2-d2fe481365f2', '6744e041-41f6-5d33-8699-cecfe4c76d9c', 'working', 3, 9, 0.0, 150, FALSE, '2026-07-27T07:18:39+00:00'),
  ('842891fa-56c8-5388-876e-42fa09b19943', '6744e041-41f6-5d33-8699-cecfe4c76d9c', 'working', 4, 9, 0.0, 150, FALSE, '2026-07-27T07:22:16+00:00'),
  ('b1bd3c21-c617-571a-b072-df7a1305b4ef', '73f2cab5-2610-5835-bf2b-8d80e8f88cbe', 'working', 1, 10, 35.0, 90, FALSE, '2026-07-27T07:24:56+00:00'),
  ('87e094fb-bd3b-5b58-a971-3ba513513778', '73f2cab5-2610-5835-bf2b-8d80e8f88cbe', 'working', 2, 10, 35.0, 90, FALSE, '2026-07-27T07:27:36+00:00'),
  ('1b87eff3-09c1-5b70-8d82-dee55eb19239', '73f2cab5-2610-5835-bf2b-8d80e8f88cbe', 'working', 3, 10, 35.0, 60, FALSE, '2026-07-27T07:29:46+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('96c617fa-36e4-50d7-ac21-835a4dba38d0', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-07-28T06:20:00+00:00', '2026-07-28T07:16:40+00:00', 3400, 10840.0, FALSE, 84.0, 'gym', 157);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e1a2f353-bc88-58e8-be0f-5eb9a4e08548', '96c617fa-36e4-50d7-ac21-835a4dba38d0', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('b52c591b-e0f1-59c2-8cb5-472d1e67298e', '96c617fa-36e4-50d7-ac21-835a4dba38d0', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('297dbdec-8e04-5d6f-8e44-0d46003804be', '96c617fa-36e4-50d7-ac21-835a4dba38d0', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('f63d17d8-6106-5e6c-a55d-8143f6b283a6', '96c617fa-36e4-50d7-ac21-835a4dba38d0', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('e6860151-1af3-5ad1-995f-d7cb933f0486', '96c617fa-36e4-50d7-ac21-835a4dba38d0', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('cd478ec4-a726-5c8f-8340-ba17094af539', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'warmup', 1, 8, 65.0, NULL, FALSE, '2026-07-28T06:26:49+00:00'),
  ('c942fc29-b094-5fc2-8623-053e004b0fc3', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'warmup', 2, 5, 100.0, NULL, FALSE, '2026-07-28T06:28:29+00:00'),
  ('f28975ba-4526-531c-945d-b227a9cd93c8', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'working', 3, 5, 132.5, 60, FALSE, '2026-07-28T06:30:24+00:00'),
  ('aea14cd9-aa03-508d-a811-3a361d1e9399', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'working', 4, 5, 132.5, 90, FALSE, '2026-07-28T06:32:49+00:00'),
  ('642df520-6da6-57eb-9941-17489184ed65', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'working', 5, 5, 132.5, 150, FALSE, '2026-07-28T06:36:14+00:00'),
  ('50431a1d-7062-537a-ab8c-9a81e4a0d689', 'e1a2f353-bc88-58e8-be0f-5eb9a4e08548', 'working', 6, 3, 132.5, 90, FALSE, '2026-07-28T06:38:33+00:00'),
  ('15015d10-81eb-5c8e-89fb-fa6e64dd51dc', 'b52c591b-e0f1-59c2-8cb5-472d1e67298e', 'working', 1, 8, 105.0, 90, FALSE, '2026-07-28T06:41:07+00:00'),
  ('6e59e253-967d-5779-8b13-268f35eba081', 'b52c591b-e0f1-59c2-8cb5-472d1e67298e', 'working', 2, 8, 105.0, 90, FALSE, '2026-07-28T06:43:41+00:00'),
  ('c5e6f35b-3427-5ed0-9f13-0085ba83bb7c', 'b52c591b-e0f1-59c2-8cb5-472d1e67298e', 'working', 3, 7, 105.0, 60, FALSE, '2026-07-28T06:45:42+00:00'),
  ('08f98d5a-d439-575b-a303-86e006508acf', '297dbdec-8e04-5d6f-8e44-0d46003804be', 'working', 1, 10, 50.0, 90, FALSE, '2026-07-28T06:48:22+00:00'),
  ('3029bde8-ff15-5f4e-9344-dc2b502774fd', '297dbdec-8e04-5d6f-8e44-0d46003804be', 'working', 2, 10, 50.0, 120, FALSE, '2026-07-28T06:51:32+00:00'),
  ('f8ecf144-454f-5bed-8d8d-bce0a30b415d', '297dbdec-8e04-5d6f-8e44-0d46003804be', 'working', 3, 8, 50.0, 90, FALSE, '2026-07-28T06:54:06+00:00'),
  ('db8621fa-3d26-5338-b01f-4c8c9201b198', 'f63d17d8-6106-5e6c-a55d-8143f6b283a6', 'working', 1, 12, 100.0, 120, FALSE, '2026-07-28T06:57:22+00:00'),
  ('95607769-f174-5271-a6e1-726fba3430ce', 'f63d17d8-6106-5e6c-a55d-8143f6b283a6', 'working', 2, 12, 100.0, 90, FALSE, '2026-07-28T07:00:08+00:00'),
  ('181487c4-4ee6-55cf-9465-15ebf58c1416', 'f63d17d8-6106-5e6c-a55d-8143f6b283a6', 'working', 3, 12, 100.0, 90, FALSE, '2026-07-28T07:02:54+00:00'),
  ('0d79b6bd-68e6-5234-b74e-33d7a267d0dc', 'f63d17d8-6106-5e6c-a55d-8143f6b283a6', 'dropset', 4, 13, 80.0, 90, FALSE, '2026-07-28T07:05:43+00:00'),
  ('dd20a19d-77bc-5481-82e1-23876efacd4b', 'e6860151-1af3-5ad1-995f-d7cb933f0486', 'working', 1, 12, 0.0, 90, FALSE, '2026-07-28T07:08:29+00:00'),
  ('dfa21517-4875-5a6e-ae19-dd39924cb803', 'e6860151-1af3-5ad1-995f-d7cb933f0486', 'working', 2, 14, 0.0, 90, FALSE, '2026-07-28T07:11:21+00:00'),
  ('4776b15b-2f47-5862-bc67-5e1d499e2590', 'e6860151-1af3-5ad1-995f-d7cb933f0486', 'failure', 3, 13, 0.0, 60, FALSE, '2026-07-28T07:13:40+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('58d69f62-001f-5b26-b887-f4f5881ccf99', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-07-30T06:14:00+00:00', '2026-07-30T07:11:01+00:00', 3421, 4077.5, FALSE, 84.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e0f0f229-5367-56bc-b868-7eb8b1571a40', '58d69f62-001f-5b26-b887-f4f5881ccf99', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('d12652da-30aa-5c4c-9b15-b9cefedcd7c4', '58d69f62-001f-5b26-b887-f4f5881ccf99', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('6e01638b-044a-53d7-8cfc-554cfc38efcc', '58d69f62-001f-5b26-b887-f4f5881ccf99', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('cec7be5e-6e06-5320-a760-382c3e73f52a', '58d69f62-001f-5b26-b887-f4f5881ccf99', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('f010b63d-8241-5f25-aa0b-4dff91154fce', '58d69f62-001f-5b26-b887-f4f5881ccf99', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5404abc7-4b5b-58cb-8726-623ed19a1041', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-07-30T06:20:49+00:00'),
  ('7bc173ad-40d9-5ffb-afeb-1e605d89a0fa', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'warmup', 2, 5, 45.0, NULL, FALSE, '2026-07-30T06:22:29+00:00'),
  ('c001ae1a-a0eb-5f8c-99e0-ab6574b8dd7f', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'working', 3, 5, 60.0, 120, FALSE, '2026-07-30T06:25:24+00:00'),
  ('e97e392f-c1e7-5983-a98b-9160228664bf', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'working', 4, 5, 60.0, 90, FALSE, '2026-07-30T06:27:49+00:00'),
  ('49fdc9eb-38c8-51da-81b7-a2f46543d88e', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'working', 5, 5, 60.0, 90, FALSE, '2026-07-30T06:30:14+00:00'),
  ('0767abcc-6d69-512a-9e76-f97da6ad78ed', 'e0f0f229-5367-56bc-b868-7eb8b1571a40', 'working', 6, 5, 60.0, 60, FALSE, '2026-07-30T06:32:09+00:00'),
  ('cd0227f9-6c16-5c81-9282-fddc227309d0', 'd12652da-30aa-5c4c-9b15-b9cefedcd7c4', 'working', 1, 10, 0.0, 60, FALSE, '2026-07-30T06:34:19+00:00'),
  ('91ce84d8-5cc9-5c3c-b4e4-b8b41c8e1df4', 'd12652da-30aa-5c4c-9b15-b9cefedcd7c4', 'working', 2, 10, 0.0, 90, FALSE, '2026-07-30T06:36:59+00:00'),
  ('750cf062-1ad0-5ab4-9721-1e14b6939942', 'd12652da-30aa-5c4c-9b15-b9cefedcd7c4', 'working', 3, 11, 0.0, 90, FALSE, '2026-07-30T06:39:42+00:00'),
  ('8bd3eb10-6ad0-5426-aa7a-3e67325392cd', 'd12652da-30aa-5c4c-9b15-b9cefedcd7c4', 'failure', 4, 10, 0.0, 120, FALSE, '2026-07-30T06:42:52+00:00'),
  ('eca0c97d-16be-5151-8aa7-d0b2e91ddf47', '6e01638b-044a-53d7-8cfc-554cfc38efcc', 'working', 1, 10, 38.0, 60, FALSE, '2026-07-30T06:45:02+00:00'),
  ('e31b512f-f1cb-508c-a50f-f58358562011', '6e01638b-044a-53d7-8cfc-554cfc38efcc', 'working', 2, 10, 38.0, 150, FALSE, '2026-07-30T06:48:42+00:00'),
  ('64c229f6-4193-5bfd-89fd-55d6872c4eaa', '6e01638b-044a-53d7-8cfc-554cfc38efcc', 'working', 3, 10, 38.0, 90, FALSE, '2026-07-30T06:51:22+00:00'),
  ('26ee68ef-1e1a-503a-80b8-d8eb2061cff9', 'cec7be5e-6e06-5320-a760-382c3e73f52a', 'working', 1, 15, 12.5, 90, FALSE, '2026-07-30T06:54:17+00:00'),
  ('920c17f9-68e4-5e8d-802a-4e110c832c1d', 'cec7be5e-6e06-5320-a760-382c3e73f52a', 'working', 2, 15, 12.5, 120, FALSE, '2026-07-30T06:57:42+00:00'),
  ('c892a76b-2f38-589b-ac82-5cb81a298bba', 'cec7be5e-6e06-5320-a760-382c3e73f52a', 'working', 3, 13, 12.5, 90, FALSE, '2026-07-30T07:00:31+00:00'),
  ('2524835a-90fc-5d2b-8ec5-1ca49aa01ebe', 'f010b63d-8241-5f25-aa0b-4dff91154fce', 'working', 1, 10, 40.0, 120, FALSE, '2026-07-30T07:03:41+00:00'),
  ('a442d1f9-2fca-5696-b6b4-c7dbe0ce075b', 'f010b63d-8241-5f25-aa0b-4dff91154fce', 'working', 2, 10, 40.0, 60, FALSE, '2026-07-30T07:05:51+00:00'),
  ('f8fc2bbd-7058-50cf-b2a2-8b91a1101054', 'f010b63d-8241-5f25-aa0b-4dff91154fce', 'working', 3, 10, 40.0, 60, FALSE, '2026-07-30T07:08:01+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('66cf8007-4aaf-5daf-a4e2-90f362b13992', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-08-01T06:05:00+00:00', '2026-08-01T06:53:42+00:00', 2922, 12960.0, FALSE, 84.0, 'gym', 111);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('28a3d674-2202-5236-9997-952430259779', '66cf8007-4aaf-5daf-a4e2-90f362b13992', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('d0317bbf-272a-5f68-bbe0-7642664a1f5c', '66cf8007-4aaf-5daf-a4e2-90f362b13992', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('e8a9e283-6990-50dd-9fbe-3350dac2376d', '66cf8007-4aaf-5daf-a4e2-90f362b13992', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('e27e19e1-24d2-5bea-86e9-c954cdb77633', '66cf8007-4aaf-5daf-a4e2-90f362b13992', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f5d32011-3123-5c1c-8ef9-d2a65fc90eae', '28a3d674-2202-5236-9997-952430259779', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-08-01T06:11:49+00:00'),
  ('565a02e9-bce3-5890-bf91-7224aceaba09', '28a3d674-2202-5236-9997-952430259779', 'warmup', 2, 5, 120.0, NULL, FALSE, '2026-08-01T06:13:29+00:00'),
  ('908db386-b443-50f1-954f-1a7560909e39', '28a3d674-2202-5236-9997-952430259779', 'working', 3, 5, 160.0, 60, FALSE, '2026-08-01T06:15:24+00:00'),
  ('590a97a6-e1d8-5b9a-b538-94b744e28bbc', '28a3d674-2202-5236-9997-952430259779', 'working', 4, 5, 160.0, 90, FALSE, '2026-08-01T06:17:49+00:00'),
  ('6c184c35-16d5-59ac-818d-a5b243954337', '28a3d674-2202-5236-9997-952430259779', 'working', 5, 5, 160.0, 90, FALSE, '2026-08-01T06:20:14+00:00'),
  ('a5773048-9cb1-5e8d-ad70-f290951876a0', 'd0317bbf-272a-5f68-bbe0-7642664a1f5c', 'working', 1, 8, 130.0, 150, FALSE, '2026-08-01T06:23:48+00:00'),
  ('a8b9b31c-4b98-5935-bc3b-02074564623d', 'd0317bbf-272a-5f68-bbe0-7642664a1f5c', 'working', 2, 8, 130.0, 150, FALSE, '2026-08-01T06:27:22+00:00'),
  ('64fb93af-9487-50c9-8f21-7a6cd2423f85', 'd0317bbf-272a-5f68-bbe0-7642664a1f5c', 'failure', 3, 8, 130.0, 120, FALSE, '2026-08-01T06:30:26+00:00'),
  ('0656b423-a445-5251-861f-49daccbb594b', 'e8a9e283-6990-50dd-9fbe-3350dac2376d', 'working', 1, 8, 110.0, 150, FALSE, '2026-08-01T06:34:00+00:00'),
  ('a564359b-41f9-504d-b724-1ebc60490235', 'e8a9e283-6990-50dd-9fbe-3350dac2376d', 'working', 2, 8, 110.0, 150, FALSE, '2026-08-01T06:37:34+00:00'),
  ('c7e32cb7-180a-519a-8a83-5474f9af2474', 'e8a9e283-6990-50dd-9fbe-3350dac2376d', 'working', 3, 8, 110.0, 90, FALSE, '2026-08-01T06:40:08+00:00'),
  ('a5d4ea52-3efe-5e7e-878e-725d3d73b2cb', 'e27e19e1-24d2-5bea-86e9-c954cdb77633', 'working', 1, 12, 100.0, 60, FALSE, '2026-08-01T06:42:24+00:00'),
  ('691ff1f3-2867-5e27-9417-bbee68374556', 'e27e19e1-24d2-5bea-86e9-c954cdb77633', 'working', 2, 12, 100.0, 90, FALSE, '2026-08-01T06:45:10+00:00'),
  ('4a615b2d-88d2-57f9-9929-7c8ec6d1709e', 'e27e19e1-24d2-5bea-86e9-c954cdb77633', 'working', 3, 12, 100.0, 60, FALSE, '2026-08-01T06:47:26+00:00'),
  ('7448bcf7-45c9-5331-9d6e-cae40baafdc1', 'e27e19e1-24d2-5bea-86e9-c954cdb77633', 'working', 4, 12, 100.0, 120, FALSE, '2026-08-01T06:50:42+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('188e4ed2-8bd1-5cbb-910e-1948b9e97d83', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-08-03T06:25:00+00:00', '2026-08-03T07:26:04+00:00', 3664, 5867.0, FALSE, 84.0, 'gym', 142);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9a49fd43-9d66-5773-b762-bce36569a06a', '188e4ed2-8bd1-5cbb-910e-1948b9e97d83', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('92a3c516-ffc5-55ea-874c-29c4801b7d47', '188e4ed2-8bd1-5cbb-910e-1948b9e97d83', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('f04b76e9-0684-5e2e-9013-18d665c542cd', '188e4ed2-8bd1-5cbb-910e-1948b9e97d83', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('66af78d5-d18f-5315-822e-e6a0fcea1431', '188e4ed2-8bd1-5cbb-910e-1948b9e97d83', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('bcbadfdb-3c3e-5db5-b01b-b6c2e673f5f1', '188e4ed2-8bd1-5cbb-910e-1948b9e97d83', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6f47d3ec-48b5-51a7-8220-e6cfd57e5351', '9a49fd43-9d66-5773-b762-bce36569a06a', 'warmup', 1, 8, 47.5, NULL, FALSE, '2026-08-03T06:31:49+00:00'),
  ('a4834579-c515-5807-83cc-d7f9d90eeb64', '9a49fd43-9d66-5773-b762-bce36569a06a', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-08-03T06:33:29+00:00'),
  ('0e2f0fe1-6de3-503a-9e95-c3c15a311149', '9a49fd43-9d66-5773-b762-bce36569a06a', 'working', 3, 5, 95.0, 90, FALSE, '2026-08-03T06:35:54+00:00'),
  ('02632ec5-dc8c-57ca-a70a-3979e609222b', '9a49fd43-9d66-5773-b762-bce36569a06a', 'working', 4, 5, 95.0, 90, FALSE, '2026-08-03T06:38:19+00:00'),
  ('a4114746-a703-5fee-b401-13b7b18270b7', '9a49fd43-9d66-5773-b762-bce36569a06a', 'working', 5, 5, 95.0, 60, FALSE, '2026-08-03T06:40:14+00:00'),
  ('b01149fc-c3de-5457-a4ce-f10cb06df08b', '9a49fd43-9d66-5773-b762-bce36569a06a', 'working', 6, 5, 95.0, 90, FALSE, '2026-08-03T06:42:39+00:00'),
  ('586b43ac-1b46-5203-a58f-c4e1f797346c', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'warmup', 1, 8, 42.5, NULL, FALSE, '2026-08-03T06:44:28+00:00'),
  ('175dfe1e-af19-53fe-9bc5-c15b0f2dadc1', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-08-03T06:46:08+00:00'),
  ('15b561a7-9867-5f83-bef5-3fc26a796fc0', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'working', 3, 6, 85.0, 90, FALSE, '2026-08-03T06:48:36+00:00'),
  ('f245be8e-1352-5eb4-8e53-49ca1b5716b7', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'working', 4, 6, 85.0, 90, FALSE, '2026-08-03T06:51:04+00:00'),
  ('7e788bf8-6ce3-5b5b-9016-297e448ce2bd', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'working', 5, 6, 85.0, 90, FALSE, '2026-08-03T06:53:32+00:00'),
  ('ab40b33f-0f14-5a25-9b5d-b1b058fb0b7c', '92a3c516-ffc5-55ea-874c-29c4801b7d47', 'working', 6, 6, 85.0, 60, FALSE, '2026-08-03T06:55:30+00:00'),
  ('72a3de43-7d5c-55e3-9793-5983b28295cf', 'f04b76e9-0684-5e2e-9013-18d665c542cd', 'working', 1, 8, 38.0, 60, FALSE, '2026-08-03T06:57:34+00:00'),
  ('f85f9401-c5fc-5723-a277-e8fe50b233e3', 'f04b76e9-0684-5e2e-9013-18d665c542cd', 'working', 2, 8, 38.0, 90, FALSE, '2026-08-03T07:00:08+00:00'),
  ('5214e320-d29d-5d44-afec-8e5f61f234a3', 'f04b76e9-0684-5e2e-9013-18d665c542cd', 'working', 3, 8, 38.0, 90, FALSE, '2026-08-03T07:02:42+00:00'),
  ('59b60740-5fe8-52dd-94cc-552981908c43', '66af78d5-d18f-5315-822e-e6a0fcea1431', 'working', 1, 12, 0.0, 90, FALSE, '2026-08-03T07:05:28+00:00'),
  ('6a87e309-e18d-5911-9ce0-30121d03fac0', '66af78d5-d18f-5315-822e-e6a0fcea1431', 'working', 2, 9, 0.0, 120, FALSE, '2026-08-03T07:08:35+00:00'),
  ('0e9d5e12-d5c1-524f-b31e-b1615ed3196d', '66af78d5-d18f-5315-822e-e6a0fcea1431', 'working', 3, 12, 0.0, 60, FALSE, '2026-08-03T07:10:51+00:00'),
  ('bbad1ba7-9dbd-592f-a006-02575a6da323', '66af78d5-d18f-5315-822e-e6a0fcea1431', 'working', 4, 12, 0.0, 90, FALSE, '2026-08-03T07:13:37+00:00'),
  ('098c6321-b7e7-5d58-83c3-462044bee306', 'bcbadfdb-3c3e-5db5-b01b-b6c2e673f5f1', 'working', 1, 10, 35.0, 120, FALSE, '2026-08-03T07:16:47+00:00'),
  ('246e4265-0a67-574e-b3fe-2ce816a527a3', 'bcbadfdb-3c3e-5db5-b01b-b6c2e673f5f1', 'working', 2, 10, 35.0, 120, FALSE, '2026-08-03T07:19:57+00:00'),
  ('e1b729de-4ff4-54d8-a808-dce86f407103', 'bcbadfdb-3c3e-5db5-b01b-b6c2e673f5f1', 'failure', 3, 9, 35.0, 120, FALSE, '2026-08-03T07:23:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1a7cb204-10ed-52ee-a526-ff972b2b66cb', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-08-04T06:30:00+00:00', '2026-08-04T07:22:28+00:00', 3148, 11420.0, FALSE, 84.0, 'gym', 163);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', '1a7cb204-10ed-52ee-a526-ff972b2b66cb', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('ba4d05d1-bb2c-5b08-a85e-ad5e44458601', '1a7cb204-10ed-52ee-a526-ff972b2b66cb', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('c2e5d7b1-25bc-5924-9560-537dc37ffd49', '1a7cb204-10ed-52ee-a526-ff972b2b66cb', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('83e5cb6b-ae62-5220-9540-1992dd059c5c', '1a7cb204-10ed-52ee-a526-ff972b2b66cb', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('9c4acff9-14f1-575e-8af5-91e6414df23e', '1a7cb204-10ed-52ee-a526-ff972b2b66cb', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a5574dee-4e9b-5c78-b94e-c7e52fff7b20', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'warmup', 1, 8, 67.5, NULL, FALSE, '2026-08-04T06:36:49+00:00'),
  ('fb1c1f26-c193-5f70-93ac-f27523ba8bd7', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'warmup', 2, 5, 100.0, NULL, FALSE, '2026-08-04T06:38:29+00:00'),
  ('75ec5395-5082-5e83-9bd2-87c1f6e04c5b', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'working', 3, 5, 135.0, 60, FALSE, '2026-08-04T06:40:24+00:00'),
  ('ff37af5c-4439-5dbb-8d18-cc30bd1229ba', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'working', 4, 5, 135.0, 60, FALSE, '2026-08-04T06:42:19+00:00'),
  ('f40e226a-c7b7-5f51-b255-eeb245b1d588', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'working', 5, 5, 135.0, 60, FALSE, '2026-08-04T06:44:14+00:00'),
  ('ee3819bf-ac9c-5d6a-b3da-4d00c1dfe32f', 'bb6a10b5-28fd-56ea-8657-7f2568d6d4c4', 'working', 6, 5, 135.0, 60, FALSE, '2026-08-04T06:46:09+00:00'),
  ('25c6b495-2e9c-5d45-9289-c6e5af8b4ffb', 'ba4d05d1-bb2c-5b08-a85e-ad5e44458601', 'working', 1, 8, 105.0, 60, FALSE, '2026-08-04T06:48:13+00:00'),
  ('e3302164-9533-52e8-aeaa-9e4e0cbea70c', 'ba4d05d1-bb2c-5b08-a85e-ad5e44458601', 'working', 2, 8, 105.0, 60, FALSE, '2026-08-04T06:50:17+00:00'),
  ('5143c290-4df1-565e-aa36-61332f3337b2', 'ba4d05d1-bb2c-5b08-a85e-ad5e44458601', 'working', 3, 8, 105.0, 60, FALSE, '2026-08-04T06:52:21+00:00'),
  ('49575716-1404-5037-b4c0-c6aa6e84b6bd', 'c2e5d7b1-25bc-5924-9560-537dc37ffd49', 'working', 1, 10, 50.0, 60, FALSE, '2026-08-04T06:54:31+00:00'),
  ('57546a6c-6188-527d-a352-d110c24772ef', 'c2e5d7b1-25bc-5924-9560-537dc37ffd49', 'working', 2, 10, 50.0, 150, FALSE, '2026-08-04T06:58:11+00:00'),
  ('3b1c16c9-ab5d-54d6-8b48-f2696bc352ab', 'c2e5d7b1-25bc-5924-9560-537dc37ffd49', 'failure', 3, 10, 50.0, 60, FALSE, '2026-08-04T07:00:21+00:00'),
  ('36e1ea9f-09f1-5532-a4a1-42486ddf2a12', '83e5cb6b-ae62-5220-9540-1992dd059c5c', 'working', 1, 12, 100.0, 60, FALSE, '2026-08-04T07:02:37+00:00'),
  ('474e2a9c-d1ea-5503-b8e9-35948a5aa651', '83e5cb6b-ae62-5220-9540-1992dd059c5c', 'working', 2, 12, 100.0, 90, FALSE, '2026-08-04T07:05:23+00:00'),
  ('befda25d-b882-549e-89ca-b4f08f3a2c5f', '83e5cb6b-ae62-5220-9540-1992dd059c5c', 'working', 3, 12, 100.0, 90, FALSE, '2026-08-04T07:08:09+00:00'),
  ('fa936aff-8b81-5c77-ad24-22dd9db9a989', '83e5cb6b-ae62-5220-9540-1992dd059c5c', 'working', 4, 11, 100.0, 60, FALSE, '2026-08-04T07:10:22+00:00'),
  ('95460562-5b33-5466-9df1-b9351a78976e', '9c4acff9-14f1-575e-8af5-91e6414df23e', 'working', 1, 14, 0.0, 60, FALSE, '2026-08-04T07:12:44+00:00'),
  ('604bc818-cc79-5b04-8bae-fdb1825182be', '9c4acff9-14f1-575e-8af5-91e6414df23e', 'working', 2, 14, 0.0, 120, FALSE, '2026-08-04T07:16:06+00:00'),
  ('41b8945c-d3e9-515d-8daf-a7965be37cdc', '9c4acff9-14f1-575e-8af5-91e6414df23e', 'failure', 3, 14, 0.0, 120, FALSE, '2026-08-04T07:19:28+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('35ecaacd-24fa-531f-a4ff-d2fba09e41b9', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-08-06T06:43:00+00:00', '2026-08-06T07:42:19+00:00', 3559, 4077.5, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b0e4b5e3-1356-56f5-986e-1b088b0026e9', '35ecaacd-24fa-531f-a4ff-d2fba09e41b9', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('0739695b-a456-5b7f-a09c-c8b35b29e0fc', '35ecaacd-24fa-531f-a4ff-d2fba09e41b9', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('d7137159-9bf4-5c7d-851b-4f0a0b6aa6b6', '35ecaacd-24fa-531f-a4ff-d2fba09e41b9', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('9778b20e-97a9-55e7-8ca0-1a77f4cc95bc', '35ecaacd-24fa-531f-a4ff-d2fba09e41b9', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('d037944f-ef64-56af-bc3f-fde8d9812e85', '35ecaacd-24fa-531f-a4ff-d2fba09e41b9', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a3a816d8-ee06-5853-8417-1ea5e506e3e9', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-08-06T06:49:49+00:00'),
  ('1be10a73-75af-57dc-bb94-0975f92ac987', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'warmup', 2, 5, 45.0, NULL, FALSE, '2026-08-06T06:51:29+00:00'),
  ('dfb5397f-f9fe-511d-91fb-b9a955ebfbac', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'working', 3, 5, 60.0, 90, FALSE, '2026-08-06T06:53:54+00:00'),
  ('96317133-9d42-56f9-8916-08d8952f3f6c', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'working', 4, 5, 60.0, 120, FALSE, '2026-08-06T06:56:49+00:00'),
  ('175946f3-c946-5676-93c4-efa7aca325be', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'working', 5, 5, 60.0, 90, FALSE, '2026-08-06T06:59:14+00:00'),
  ('33b413df-f4ed-59d0-9992-7fcfad8d1e1f', 'b0e4b5e3-1356-56f5-986e-1b088b0026e9', 'working', 6, 5, 60.0, 150, FALSE, '2026-08-06T07:02:39+00:00'),
  ('1a952a53-36ef-5a7d-a410-79ea08c915ff', '0739695b-a456-5b7f-a09c-c8b35b29e0fc', 'working', 1, 9, 0.0, 60, FALSE, '2026-08-06T07:04:46+00:00'),
  ('8974a576-4a8a-59e8-ae2c-75aa6c263ead', '0739695b-a456-5b7f-a09c-c8b35b29e0fc', 'working', 2, 10, 0.0, 90, FALSE, '2026-08-06T07:07:26+00:00'),
  ('94096ae2-724e-56fe-b177-4bdd229ce726', '0739695b-a456-5b7f-a09c-c8b35b29e0fc', 'working', 3, 9, 0.0, 90, FALSE, '2026-08-06T07:10:03+00:00'),
  ('94eb6b58-e3b2-56e9-b8eb-f950e13e76b1', '0739695b-a456-5b7f-a09c-c8b35b29e0fc', 'working', 4, 9, 0.0, 90, FALSE, '2026-08-06T07:12:40+00:00'),
  ('cf8cabf3-0a5b-55d3-9984-c081dcb1b88e', 'd7137159-9bf4-5c7d-851b-4f0a0b6aa6b6', 'working', 1, 10, 38.0, 90, FALSE, '2026-08-06T07:15:20+00:00'),
  ('8c2f2cae-bae6-583d-9645-85cc9ceb70e5', 'd7137159-9bf4-5c7d-851b-4f0a0b6aa6b6', 'working', 2, 10, 38.0, 120, FALSE, '2026-08-06T07:18:30+00:00'),
  ('1f11d917-9f93-5c6a-8aae-6f6cdedd66fe', 'd7137159-9bf4-5c7d-851b-4f0a0b6aa6b6', 'working', 3, 10, 38.0, 90, FALSE, '2026-08-06T07:21:10+00:00'),
  ('fe2ce5e3-4cee-519e-8025-5da3b41b1e6c', '9778b20e-97a9-55e7-8ca0-1a77f4cc95bc', 'working', 1, 15, 12.5, 120, FALSE, '2026-08-06T07:24:35+00:00'),
  ('8eb3a87e-3997-5cb4-b862-e9c28dd70073', '9778b20e-97a9-55e7-8ca0-1a77f4cc95bc', 'working', 2, 15, 12.5, 60, FALSE, '2026-08-06T07:27:00+00:00'),
  ('8be2a6ff-2cbd-5516-b750-ad473765746e', '9778b20e-97a9-55e7-8ca0-1a77f4cc95bc', 'working', 3, 13, 12.5, 90, FALSE, '2026-08-06T07:29:49+00:00'),
  ('668e7f14-bbe2-5d88-8249-44678581e722', 'd037944f-ef64-56af-bc3f-fde8d9812e85', 'working', 1, 10, 40.0, 150, FALSE, '2026-08-06T07:33:29+00:00'),
  ('791b0191-662b-5c10-bb0b-73f91740721c', 'd037944f-ef64-56af-bc3f-fde8d9812e85', 'working', 2, 10, 40.0, 90, FALSE, '2026-08-06T07:36:09+00:00'),
  ('da05836f-0f74-5999-9c1b-5cdabe7b5aad', 'd037944f-ef64-56af-bc3f-fde8d9812e85', 'working', 3, 10, 40.0, 120, FALSE, '2026-08-06T07:39:19+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6ff3255b-4183-523e-869a-672637d633c4', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-08-08T06:31:00+00:00', '2026-08-08T07:18:57+00:00', 2877, 12405.0, FALSE, 84.0, 'gym', 106);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2e9fbe29-2121-567e-823b-ca200cefb6d2', '6ff3255b-4183-523e-869a-672637d633c4', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('9c513dbd-d5bd-5f32-ba1c-0f19122e0865', '6ff3255b-4183-523e-869a-672637d633c4', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('9e1d0c2e-e30b-589b-8972-5321f5fb3c49', '6ff3255b-4183-523e-869a-672637d633c4', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('c5d48088-f486-5c15-b221-4cbfc9926e0c', '6ff3255b-4183-523e-869a-672637d633c4', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a61b70ec-52c2-59ab-971e-69045895d371', '2e9fbe29-2121-567e-823b-ca200cefb6d2', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-08-08T06:37:49+00:00'),
  ('b3201cee-ee3e-526a-abca-f1e1acfa3218', '2e9fbe29-2121-567e-823b-ca200cefb6d2', 'warmup', 2, 5, 120.0, NULL, FALSE, '2026-08-08T06:39:29+00:00'),
  ('ab1255f0-cce9-535f-b3b7-35f9269b425f', '2e9fbe29-2121-567e-823b-ca200cefb6d2', 'working', 3, 5, 160.0, 120, FALSE, '2026-08-08T06:42:24+00:00'),
  ('6d487577-0b1f-5619-903f-102303b14ce6', '2e9fbe29-2121-567e-823b-ca200cefb6d2', 'working', 4, 5, 160.0, 90, FALSE, '2026-08-08T06:44:49+00:00'),
  ('01711a30-79da-5861-8796-251ac858c86f', '2e9fbe29-2121-567e-823b-ca200cefb6d2', 'working', 5, 3, 160.0, 90, FALSE, '2026-08-08T06:47:08+00:00'),
  ('2437de96-c97a-5169-8917-6d2b5adab5c5', '9c513dbd-d5bd-5f32-ba1c-0f19122e0865', 'working', 1, 8, 135.0, 90, FALSE, '2026-08-08T06:49:42+00:00'),
  ('245853b6-8169-55a4-a5ad-dd1c17395249', '9c513dbd-d5bd-5f32-ba1c-0f19122e0865', 'working', 2, 8, 135.0, 120, FALSE, '2026-08-08T06:52:46+00:00'),
  ('9ba3b9eb-1703-5752-95e7-4b48ceb9e108', '9c513dbd-d5bd-5f32-ba1c-0f19122e0865', 'working', 3, 7, 135.0, 120, FALSE, '2026-08-08T06:55:47+00:00'),
  ('b40f566c-3988-5ab7-a0c7-ad80cb0b129f', '9e1d0c2e-e30b-589b-8972-5321f5fb3c49', 'working', 1, 8, 110.0, 90, FALSE, '2026-08-08T06:58:21+00:00'),
  ('a8b5938b-ace9-509b-b5d5-42f33030326b', '9e1d0c2e-e30b-589b-8972-5321f5fb3c49', 'working', 2, 8, 110.0, 150, FALSE, '2026-08-08T07:01:55+00:00'),
  ('49137fc2-90e2-5b89-833c-3e655f1cfd31', '9e1d0c2e-e30b-589b-8972-5321f5fb3c49', 'failure', 3, 6, 110.0, 60, FALSE, '2026-08-08T07:03:53+00:00'),
  ('db094ea6-4a66-55b9-ba26-b809c762bfb2', 'c5d48088-f486-5c15-b221-4cbfc9926e0c', 'working', 1, 12, 100.0, 60, FALSE, '2026-08-08T07:06:09+00:00'),
  ('105e1ccf-6af1-5c50-9e46-154289919c22', 'c5d48088-f486-5c15-b221-4cbfc9926e0c', 'working', 2, 12, 100.0, 150, FALSE, '2026-08-08T07:09:55+00:00'),
  ('7754614a-b67a-5f6a-a073-9914db18ca7a', 'c5d48088-f486-5c15-b221-4cbfc9926e0c', 'working', 3, 12, 100.0, 90, FALSE, '2026-08-08T07:12:41+00:00'),
  ('4854d3ce-fe63-55be-8e0e-289f56f7ca79', 'c5d48088-f486-5c15-b221-4cbfc9926e0c', 'working', 4, 12, 100.0, 120, FALSE, '2026-08-08T07:15:57+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('436bf454-0b5d-5c91-947a-98160cddc65e', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-08-10T06:18:00+00:00', '2026-08-10T07:20:04+00:00', 3724, 5792.0, FALSE, 84.0, 'gym', 142);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', '436bf454-0b5d-5c91-947a-98160cddc65e', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('4096fc06-48a3-580d-bd1e-361ce122a9aa', '436bf454-0b5d-5c91-947a-98160cddc65e', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('fc449907-cdd1-5dd1-918a-c643df8ef0c3', '436bf454-0b5d-5c91-947a-98160cddc65e', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('2209957d-e498-5ac0-9998-30829ae00fe5', '436bf454-0b5d-5c91-947a-98160cddc65e', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('2d2e79dd-f40f-58a9-a87a-ae685ab343cb', '436bf454-0b5d-5c91-947a-98160cddc65e', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('71416e5e-d21f-5ae7-a1ef-70703b7c07b0', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'warmup', 1, 8, 47.5, NULL, FALSE, '2026-08-10T06:24:49+00:00'),
  ('ae37e0e4-94b6-55e1-b60c-0690440456df', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'warmup', 2, 5, 70.0, NULL, FALSE, '2026-08-10T06:26:29+00:00'),
  ('c0f64529-00d8-5cbf-a5eb-3a6ce8cbf450', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'working', 3, 5, 95.0, 150, FALSE, '2026-08-10T06:29:54+00:00'),
  ('6bccd722-538f-5db4-a6cb-3e2149980c82', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'working', 4, 5, 95.0, 60, FALSE, '2026-08-10T06:31:49+00:00'),
  ('6677c274-4168-53e2-b2ba-91f529bc323f', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'working', 5, 5, 95.0, 120, FALSE, '2026-08-10T06:34:44+00:00'),
  ('1dbc5211-7b2a-5c68-a7ed-125adefe428e', '06d6ab52-cc7b-5f2f-8b4e-ea91a8243338', 'working', 6, 3, 95.0, 120, FALSE, '2026-08-10T06:37:33+00:00'),
  ('19dd61c2-5a8e-5e3c-839a-cc9cbaedc1aa', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'warmup', 1, 8, 42.5, NULL, FALSE, '2026-08-10T06:39:22+00:00'),
  ('3a3f9e58-36fd-5326-baf6-2b64da1d1160', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-08-10T06:41:02+00:00'),
  ('b88f5a5a-4c13-5023-9371-86fb04e22625', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'working', 3, 6, 85.0, 120, FALSE, '2026-08-10T06:44:00+00:00'),
  ('89a892f8-2b9a-519a-8f31-10d8f56bad28', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'working', 4, 6, 85.0, 120, FALSE, '2026-08-10T06:46:58+00:00'),
  ('11618ba3-b103-5408-87c8-5ad58ea1ca90', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'working', 5, 6, 85.0, 60, FALSE, '2026-08-10T06:48:56+00:00'),
  ('ac4ab365-754d-5d82-b515-a67e1a721228', '4096fc06-48a3-580d-bd1e-361ce122a9aa', 'working', 6, 6, 85.0, 60, FALSE, '2026-08-10T06:50:54+00:00'),
  ('002e38aa-b216-5a50-b934-fd9b5476117d', 'fc449907-cdd1-5dd1-918a-c643df8ef0c3', 'working', 1, 8, 40.0, 90, FALSE, '2026-08-10T06:53:28+00:00'),
  ('d0772799-2a75-5f12-a269-71fb4d6f596a', 'fc449907-cdd1-5dd1-918a-c643df8ef0c3', 'working', 2, 8, 40.0, 60, FALSE, '2026-08-10T06:55:32+00:00'),
  ('ef47bb86-d72f-5b7d-b78b-f1a3638d11af', 'fc449907-cdd1-5dd1-918a-c643df8ef0c3', 'dropset', 3, 11, 32.0, 120, FALSE, '2026-08-10T06:58:45+00:00'),
  ('41857161-5086-556b-9359-31226999b7af', '2209957d-e498-5ac0-9998-30829ae00fe5', 'working', 1, 11, 0.0, 90, FALSE, '2026-08-10T07:01:28+00:00'),
  ('68490ec2-11f3-5af3-a105-7772164a6683', '2209957d-e498-5ac0-9998-30829ae00fe5', 'working', 2, 11, 0.0, 90, FALSE, '2026-08-10T07:04:11+00:00'),
  ('e1f2cdb7-b8d8-5bdf-be15-616715d7b939', '2209957d-e498-5ac0-9998-30829ae00fe5', 'working', 3, 9, 0.0, 90, FALSE, '2026-08-10T07:06:48+00:00'),
  ('e7c4a2e7-8f41-5e63-9207-59f92438ddec', '2209957d-e498-5ac0-9998-30829ae00fe5', 'working', 4, 12, 0.0, 90, FALSE, '2026-08-10T07:09:34+00:00'),
  ('1bbc25ee-cee1-5c27-8174-ce67ca0271fe', '2d2e79dd-f40f-58a9-a87a-ae685ab343cb', 'working', 1, 10, 35.0, 60, FALSE, '2026-08-10T07:11:44+00:00'),
  ('28ad0a39-103b-5aec-b0ac-30fbb460ee1e', '2d2e79dd-f40f-58a9-a87a-ae685ab343cb', 'working', 2, 10, 35.0, 120, FALSE, '2026-08-10T07:14:54+00:00'),
  ('8dce2362-f48a-5b6d-aab3-20b650a10207', '2d2e79dd-f40f-58a9-a87a-ae685ab343cb', 'working', 3, 10, 35.0, 60, FALSE, '2026-08-10T07:17:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-08-11T06:40:00+00:00', '2026-08-11T07:38:52+00:00', 3532, 11565.0, FALSE, 84.0, 'gym', 161);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('62670512-5dfe-5e2a-9866-c1bb175c8b66', 'a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('401e6e9d-50f9-5518-8d4a-97e8f6e58665', 'a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('8a240675-15bb-55b6-af3f-1beaa007ddfe', 'a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('4fff62fc-a1ee-55f4-90c4-acd5d587700b', 'a7c59e1a-e9db-52b0-bafe-fc9cb0ae2981', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('ae7f732a-a592-51cc-8f8b-279df121babe', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'warmup', 1, 8, 67.5, NULL, FALSE, '2026-08-11T06:46:49+00:00'),
  ('04c4545a-6e11-52b4-b44d-3cf5619f57b1', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'warmup', 2, 5, 100.0, NULL, FALSE, '2026-08-11T06:48:29+00:00'),
  ('a41dfdff-b539-5375-ae39-2babb2f5866b', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'working', 3, 5, 135.0, 60, FALSE, '2026-08-11T06:50:24+00:00'),
  ('33a78253-04d5-59ca-9039-e159414f0070', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'working', 4, 5, 135.0, 150, FALSE, '2026-08-11T06:53:49+00:00'),
  ('6563fc72-5e93-53a2-a09b-ee3666b02967', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'working', 5, 5, 135.0, 120, FALSE, '2026-08-11T06:56:44+00:00'),
  ('4d893303-fd52-51b4-bd5a-862b8110ee42', '4e8a705f-11e4-58c4-8b03-4d1efa39dfa6', 'working', 6, 4, 135.0, 120, FALSE, '2026-08-11T06:59:36+00:00'),
  ('2742dabd-95d5-5d43-b31e-1b0f672aac5e', '62670512-5dfe-5e2a-9866-c1bb175c8b66', 'working', 1, 8, 105.0, 90, FALSE, '2026-08-11T07:02:10+00:00'),
  ('fb559e90-8115-51ee-ba3a-be8f394de3c0', '62670512-5dfe-5e2a-9866-c1bb175c8b66', 'working', 2, 8, 105.0, 60, FALSE, '2026-08-11T07:04:14+00:00'),
  ('a6573d67-5de3-5343-9d43-c890ecdd0568', '62670512-5dfe-5e2a-9866-c1bb175c8b66', 'dropset', 3, 9, 85.0, 120, FALSE, '2026-08-11T07:07:21+00:00'),
  ('0de344f3-9385-5a08-a57b-7bce1125aea8', '401e6e9d-50f9-5518-8d4a-97e8f6e58665', 'working', 1, 10, 50.0, 120, FALSE, '2026-08-11T07:10:31+00:00'),
  ('1857752c-cf38-5cb5-a8fe-5cb4682c56d3', '401e6e9d-50f9-5518-8d4a-97e8f6e58665', 'working', 2, 10, 50.0, 60, FALSE, '2026-08-11T07:12:41+00:00'),
  ('680c38a0-7e82-5b2d-9bfc-2ccf825d7f6c', '401e6e9d-50f9-5518-8d4a-97e8f6e58665', 'failure', 3, 10, 50.0, 60, FALSE, '2026-08-11T07:14:51+00:00'),
  ('bd83f198-7353-5664-b4cc-6fb6bd80b0a7', '8a240675-15bb-55b6-af3f-1beaa007ddfe', 'working', 1, 12, 105.0, 120, FALSE, '2026-08-11T07:18:07+00:00'),
  ('8794a524-2de5-5292-9768-ec1170de5417', '8a240675-15bb-55b6-af3f-1beaa007ddfe', 'working', 2, 12, 105.0, 120, FALSE, '2026-08-11T07:21:23+00:00'),
  ('21dc741a-5840-5551-9a4b-f66f90b1302a', '8a240675-15bb-55b6-af3f-1beaa007ddfe', 'working', 3, 12, 105.0, 120, FALSE, '2026-08-11T07:24:39+00:00'),
  ('9b94108e-c8dc-5178-9e7b-fbcb1d58fc53', '8a240675-15bb-55b6-af3f-1beaa007ddfe', 'dropset', 4, 15, 85.0, 60, FALSE, '2026-08-11T07:27:04+00:00'),
  ('042386fc-fdeb-5975-94d5-58074d4c0f73', '4fff62fc-a1ee-55f4-90c4-acd5d587700b', 'working', 1, 13, 0.0, 90, FALSE, '2026-08-11T07:29:53+00:00'),
  ('1624f7e4-a041-56b2-a465-f6c8be5ea259', '4fff62fc-a1ee-55f4-90c4-acd5d587700b', 'working', 2, 12, 0.0, 150, FALSE, '2026-08-11T07:33:39+00:00'),
  ('15ab9be2-f809-5738-922c-0e4c1fac7d99', '4fff62fc-a1ee-55f4-90c4-acd5d587700b', 'failure', 3, 11, 0.0, 60, FALSE, '2026-08-11T07:35:52+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('92d96624-522f-5eac-847e-141019088212', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-08-13T06:12:00+00:00', '2026-08-13T07:14:04+00:00', 3724, 4073.5, FALSE, 84.0, 'gym', 175);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9d05fb4d-94dd-528d-8836-ab4ac1544973', '92d96624-522f-5eac-847e-141019088212', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('dea2ebdb-3df3-55fd-8fb6-83c6bebd9257', '92d96624-522f-5eac-847e-141019088212', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('89607167-9d92-5c6d-abfc-046d1fe497c1', '92d96624-522f-5eac-847e-141019088212', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('70612924-fe39-5696-a751-c17a4366d377', '92d96624-522f-5eac-847e-141019088212', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('15e48b81-5154-5585-a11c-9c26f5c50b37', '92d96624-522f-5eac-847e-141019088212', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('810de459-7137-5334-9f12-a69ca6eb1a37', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-08-13T06:18:49+00:00'),
  ('c19fa1b1-c84b-56a4-b312-02872dd79ab3', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'warmup', 2, 5, 45.0, NULL, FALSE, '2026-08-13T06:20:29+00:00'),
  ('fa407a0a-ad47-5a5c-9da1-bc1f4dc95755', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'working', 3, 5, 60.0, 90, FALSE, '2026-08-13T06:22:54+00:00'),
  ('2bd2ee48-1248-5f61-b458-cc4e484ee88b', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'working', 4, 5, 60.0, 90, FALSE, '2026-08-13T06:25:19+00:00'),
  ('b1cd528c-3682-5d8a-8a4e-deb73206e495', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'working', 5, 5, 60.0, 150, FALSE, '2026-08-13T06:28:44+00:00'),
  ('d24a86f9-7958-5c85-8f92-f67c6859055e', '9d05fb4d-94dd-528d-8836-ab4ac1544973', 'working', 6, 3, 60.0, 120, FALSE, '2026-08-13T06:31:33+00:00'),
  ('01caf162-3a43-541d-8321-b282269e51c2', 'dea2ebdb-3df3-55fd-8fb6-83c6bebd9257', 'working', 1, 11, 0.0, 60, FALSE, '2026-08-13T06:33:46+00:00'),
  ('0d521b34-7c12-5b61-872a-495129860f90', 'dea2ebdb-3df3-55fd-8fb6-83c6bebd9257', 'working', 2, 9, 0.0, 120, FALSE, '2026-08-13T06:36:53+00:00'),
  ('8f7ae84c-62e6-56f6-8c7c-5532305adcf3', 'dea2ebdb-3df3-55fd-8fb6-83c6bebd9257', 'working', 3, 12, 0.0, 90, FALSE, '2026-08-13T06:39:39+00:00'),
  ('c7ab8ff4-e736-50c9-9e45-334cda2b3da6', 'dea2ebdb-3df3-55fd-8fb6-83c6bebd9257', 'working', 4, 11, 0.0, 60, FALSE, '2026-08-13T06:41:52+00:00'),
  ('d354ae38-9f59-5f18-9e90-b6e399217043', '89607167-9d92-5c6d-abfc-046d1fe497c1', 'working', 1, 10, 40.0, 90, FALSE, '2026-08-13T06:44:32+00:00'),
  ('e4de7e1b-482a-5893-8a9c-7b260e5d80b4', '89607167-9d92-5c6d-abfc-046d1fe497c1', 'working', 2, 10, 40.0, 120, FALSE, '2026-08-13T06:47:42+00:00'),
  ('cfcd3fd1-cd94-5336-8c9e-ce493680afd5', '89607167-9d92-5c6d-abfc-046d1fe497c1', 'dropset', 3, 13, 32.0, 90, FALSE, '2026-08-13T06:50:31+00:00'),
  ('8383f0a8-929c-5d6d-8037-179b1ac34ac2', '70612924-fe39-5696-a751-c17a4366d377', 'working', 1, 15, 12.5, 120, FALSE, '2026-08-13T06:53:56+00:00'),
  ('abb11b1a-62aa-5c42-b428-ca8a500d721e', '70612924-fe39-5696-a751-c17a4366d377', 'working', 2, 15, 12.5, 150, FALSE, '2026-08-13T06:57:51+00:00'),
  ('d876e633-772a-59df-bc3c-34ee8fc3ce0f', '70612924-fe39-5696-a751-c17a4366d377', 'dropset', 3, 18, 10.0, 90, FALSE, '2026-08-13T07:00:55+00:00'),
  ('4bcce845-69dc-5bbb-904a-f4b757892fae', '15e48b81-5154-5585-a11c-9c26f5c50b37', 'working', 1, 10, 40.0, 90, FALSE, '2026-08-13T07:03:35+00:00'),
  ('9d8e4771-af5e-5416-a122-295d062d3895', '15e48b81-5154-5585-a11c-9c26f5c50b37', 'working', 2, 10, 40.0, 150, FALSE, '2026-08-13T07:07:15+00:00'),
  ('b45ddbaf-6f70-5274-ac49-7180bfb8ab49', '15e48b81-5154-5585-a11c-9c26f5c50b37', 'dropset', 3, 13, 32.5, 150, FALSE, '2026-08-13T07:11:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('80fa85a3-b73e-5b00-a6ce-65812b517504', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-08-15T06:18:00+00:00', '2026-08-15T07:08:27+00:00', 3027, 13440.0, FALSE, 84.0, 'gym', 116);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('c720fcb8-d889-5351-85e9-a3e46b10f270', '80fa85a3-b73e-5b00-a6ce-65812b517504', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('5b035556-f5d0-5a97-8530-fe38f40e6994', '80fa85a3-b73e-5b00-a6ce-65812b517504', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('4f027014-5c9b-524e-a56d-60c0a134962c', '80fa85a3-b73e-5b00-a6ce-65812b517504', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('d658075e-90d8-5022-ae57-52337f8711d5', '80fa85a3-b73e-5b00-a6ce-65812b517504', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('dbaec1f5-d0ad-50ca-9a6e-fdcbf8bd3c1c', 'c720fcb8-d889-5351-85e9-a3e46b10f270', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-08-15T06:24:49+00:00'),
  ('41ffb7fe-053c-5d07-9b45-cdb5e43e3980', 'c720fcb8-d889-5351-85e9-a3e46b10f270', 'warmup', 2, 5, 120.0, NULL, FALSE, '2026-08-15T06:26:29+00:00'),
  ('e70164dd-a1e3-5308-a26a-9add78f690a5', 'c720fcb8-d889-5351-85e9-a3e46b10f270', 'working', 3, 5, 160.0, 90, FALSE, '2026-08-15T06:28:54+00:00'),
  ('4322dcd1-26a2-5a23-ad5b-47fa419e706b', 'c720fcb8-d889-5351-85e9-a3e46b10f270', 'working', 4, 5, 160.0, 150, FALSE, '2026-08-15T06:32:19+00:00'),
  ('8b94e50d-89a1-5e68-80d9-17d9324c3e02', 'c720fcb8-d889-5351-85e9-a3e46b10f270', 'working', 5, 5, 160.0, 120, FALSE, '2026-08-15T06:35:14+00:00'),
  ('b5bc9fc0-182e-5d9d-8a48-23f90785efd3', '5b035556-f5d0-5a97-8530-fe38f40e6994', 'working', 1, 8, 135.0, 120, FALSE, '2026-08-15T06:38:18+00:00'),
  ('41f96096-e314-5fc6-aad4-61fce0403830', '5b035556-f5d0-5a97-8530-fe38f40e6994', 'working', 2, 8, 135.0, 90, FALSE, '2026-08-15T06:40:52+00:00'),
  ('a9160df6-2372-5846-a72e-6ccdf423713f', '5b035556-f5d0-5a97-8530-fe38f40e6994', 'dropset', 3, 11, 110.0, 150, FALSE, '2026-08-15T06:44:35+00:00'),
  ('387f8fdd-8890-5686-b2bd-e888e5899f02', '4f027014-5c9b-524e-a56d-60c0a134962c', 'working', 1, 8, 112.5, 120, FALSE, '2026-08-15T06:47:39+00:00'),
  ('e0f17442-b9cb-5999-933c-2b93fb6330e0', '4f027014-5c9b-524e-a56d-60c0a134962c', 'working', 2, 8, 112.5, 60, FALSE, '2026-08-15T06:49:43+00:00'),
  ('d6f7fd08-59c9-5e18-baff-41785e74958c', '4f027014-5c9b-524e-a56d-60c0a134962c', 'working', 3, 8, 112.5, 150, FALSE, '2026-08-15T06:53:17+00:00'),
  ('a1ee9fce-4c0e-530d-b12f-4cb559439e2e', 'd658075e-90d8-5022-ae57-52337f8711d5', 'working', 1, 12, 105.0, 150, FALSE, '2026-08-15T06:57:03+00:00'),
  ('12ca2f32-ab4c-560e-b5d6-46789f240ff9', 'd658075e-90d8-5022-ae57-52337f8711d5', 'working', 2, 12, 105.0, 60, FALSE, '2026-08-15T06:59:19+00:00'),
  ('fca9562b-3677-52c3-8be4-a55f83a0c6aa', 'd658075e-90d8-5022-ae57-52337f8711d5', 'working', 3, 12, 105.0, 150, FALSE, '2026-08-15T07:03:05+00:00'),
  ('62860f22-47be-59c7-9080-ce5b0a0ee38e', 'd658075e-90d8-5022-ae57-52337f8711d5', 'dropset', 4, 14, 85.0, 60, FALSE, '2026-08-15T07:05:27+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('fa50b82c-c677-55e7-a62a-5f9ac470986a', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-08-17T06:05:00+00:00', '2026-08-17T07:08:10+00:00', 3790, 5031.0, FALSE, 84.0, 'gym', 144);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('01df58b7-c7de-5d6e-96a9-bae3102965fb', 'fa50b82c-c677-55e7-a62a-5f9ac470986a', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('08a3c7ab-2847-5298-aa54-5f55b187eade', 'fa50b82c-c677-55e7-a62a-5f9ac470986a', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('a17378cf-a080-5d1b-90ac-b8f79e186f70', 'fa50b82c-c677-55e7-a62a-5f9ac470986a', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('5b3ec299-ea90-5f5e-98fa-151f02e3d6f7', 'fa50b82c-c677-55e7-a62a-5f9ac470986a', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('9ec9034c-9e6d-58d3-aa27-e9bb540e226e', 'fa50b82c-c677-55e7-a62a-5f9ac470986a', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d25c78ed-87dc-564f-856f-3d73c0786ebb', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-08-17T06:11:49+00:00'),
  ('3e0bf9f7-0c99-580e-a0c9-134c14194fb4', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'warmup', 2, 5, 60.0, NULL, FALSE, '2026-08-17T06:13:29+00:00'),
  ('a88c4fab-88b6-5229-9f9b-15473e1e807d', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'working', 3, 5, 80.0, 120, FALSE, '2026-08-17T06:16:24+00:00'),
  ('ccd58313-2482-5816-8575-48fe39e71fce', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'working', 4, 5, 80.0, 60, FALSE, '2026-08-17T06:18:19+00:00'),
  ('73fd299d-b0dd-52cf-9c22-c15593cec859', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'working', 5, 5, 80.0, 90, FALSE, '2026-08-17T06:20:44+00:00'),
  ('8a56c3f8-f47f-5bac-b368-7df0f85278ac', '01df58b7-c7de-5d6e-96a9-bae3102965fb', 'working', 6, 5, 80.0, 90, FALSE, '2026-08-17T06:23:09+00:00'),
  ('5d12d0f0-1388-5fbe-a2ef-fcbeec6ff9f3', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'warmup', 1, 8, 35.0, NULL, FALSE, '2026-08-17T06:24:58+00:00'),
  ('a98465d7-a29f-5e21-8884-d6f522f33c46', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'warmup', 2, 5, 55.0, NULL, FALSE, '2026-08-17T06:26:38+00:00'),
  ('675d82c3-065a-59b4-a765-022228eb4e68', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'working', 3, 6, 72.5, 150, FALSE, '2026-08-17T06:30:06+00:00'),
  ('f3cf7345-bf93-59f0-9953-1ab037b7512f', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'working', 4, 6, 72.5, 120, FALSE, '2026-08-17T06:33:04+00:00'),
  ('b3e1bf2e-4e6f-5e8f-bc6a-69191d49137f', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'working', 5, 6, 72.5, 60, FALSE, '2026-08-17T06:35:02+00:00'),
  ('49150b05-336a-5506-b35c-08cc4961ae28', '08a3c7ab-2847-5298-aa54-5f55b187eade', 'working', 6, 6, 72.5, 120, FALSE, '2026-08-17T06:38:00+00:00'),
  ('2de515f5-5c2b-5928-9173-a8fc901b7860', 'a17378cf-a080-5d1b-90ac-b8f79e186f70', 'working', 1, 8, 34.0, 90, FALSE, '2026-08-17T06:40:34+00:00'),
  ('4bf7dba4-2f9e-5a10-bcf7-d7d1d9d298dd', 'a17378cf-a080-5d1b-90ac-b8f79e186f70', 'working', 2, 8, 34.0, 90, FALSE, '2026-08-17T06:43:08+00:00'),
  ('dac9bd7f-7a3c-50be-8294-b8714b570ae2', 'a17378cf-a080-5d1b-90ac-b8f79e186f70', 'working', 3, 8, 34.0, 150, FALSE, '2026-08-17T06:46:42+00:00'),
  ('6c2ad3d9-3908-56fc-83dc-ad19e85cb413', '5b3ec299-ea90-5f5e-98fa-151f02e3d6f7', 'working', 1, 12, 0.0, 60, FALSE, '2026-08-17T06:48:58+00:00'),
  ('6265d320-b4a0-58c4-b85b-9c287283d58f', '5b3ec299-ea90-5f5e-98fa-151f02e3d6f7', 'working', 2, 12, 0.0, 90, FALSE, '2026-08-17T06:51:44+00:00'),
  ('70007a16-ffa5-52c3-8965-c60b86eb44fc', '5b3ec299-ea90-5f5e-98fa-151f02e3d6f7', 'working', 3, 11, 0.0, 120, FALSE, '2026-08-17T06:54:57+00:00'),
  ('ff04d54e-6b3b-57a6-a1f5-a09513c892ea', '5b3ec299-ea90-5f5e-98fa-151f02e3d6f7', 'working', 4, 10, 0.0, 120, FALSE, '2026-08-17T06:58:07+00:00'),
  ('91125ad4-1f3b-53ce-ab89-66bffb904d0c', '9ec9034c-9e6d-58d3-aa27-e9bb540e226e', 'working', 1, 10, 30.0, 60, FALSE, '2026-08-17T07:00:17+00:00'),
  ('1505d117-f7ba-5fce-885f-186088f4380f', '9ec9034c-9e6d-58d3-aa27-e9bb540e226e', 'working', 2, 10, 30.0, 90, FALSE, '2026-08-17T07:02:57+00:00'),
  ('e1366a3e-adba-5845-8697-3b7e183d2216', '9ec9034c-9e6d-58d3-aa27-e9bb540e226e', 'dropset', 3, 11, 25.0, 60, FALSE, '2026-08-17T07:05:10+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d7b9ebc6-fb91-5577-9636-07eda773e344', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-08-18T06:33:00+00:00', '2026-08-18T07:32:49+00:00', 3589, 10005.0, FALSE, 84.0, 'gym', 160);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'd7b9ebc6-fb91-5577-9636-07eda773e344', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('dd11f433-abd8-5c8d-b32b-adb4e50091d0', 'd7b9ebc6-fb91-5577-9636-07eda773e344', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('fd2822a3-6d07-5e35-b732-63db21b324c2', 'd7b9ebc6-fb91-5577-9636-07eda773e344', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('6557dc0e-6970-5b92-9782-08c1078b424a', 'd7b9ebc6-fb91-5577-9636-07eda773e344', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('3f6336ea-fb98-5e0c-9902-c1f075fe86f6', 'd7b9ebc6-fb91-5577-9636-07eda773e344', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a59ebb4f-0627-5816-8d58-113a4126ed75', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'warmup', 1, 8, 60.0, NULL, FALSE, '2026-08-18T06:39:49+00:00'),
  ('d2be95a1-a594-53f8-a41c-edffb9b3398c', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'warmup', 2, 5, 87.5, NULL, FALSE, '2026-08-18T06:41:29+00:00'),
  ('00a6d210-21cc-53f6-b3cd-d65b4f527eef', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'working', 3, 5, 117.5, 90, FALSE, '2026-08-18T06:43:54+00:00'),
  ('b37f59aa-a093-5924-9cf5-37e57eac2521', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'working', 4, 5, 117.5, 60, FALSE, '2026-08-18T06:45:49+00:00'),
  ('764dd397-0455-53b3-9206-6c9291a9426f', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'working', 5, 5, 117.5, 60, FALSE, '2026-08-18T06:47:44+00:00'),
  ('133e8fcd-d616-5554-8289-b3e29892fbaa', '2f7b9e1d-9971-5efb-b2f2-af8c8865da2b', 'working', 6, 5, 117.5, 120, FALSE, '2026-08-18T06:50:39+00:00'),
  ('18da7555-2133-596d-bb6e-2df72af7c3bc', 'dd11f433-abd8-5c8d-b32b-adb4e50091d0', 'working', 1, 8, 90.0, 90, FALSE, '2026-08-18T06:53:13+00:00'),
  ('e5473834-c465-54f1-860a-b1dab29d4209', 'dd11f433-abd8-5c8d-b32b-adb4e50091d0', 'working', 2, 8, 90.0, 120, FALSE, '2026-08-18T06:56:17+00:00'),
  ('5cc49836-6ec6-5330-b2f6-5bc913183f90', 'dd11f433-abd8-5c8d-b32b-adb4e50091d0', 'working', 3, 8, 90.0, 60, FALSE, '2026-08-18T06:58:21+00:00'),
  ('9d2e4cb1-e5af-5175-b57f-3833cc9e21e1', 'fd2822a3-6d07-5e35-b732-63db21b324c2', 'working', 1, 10, 42.5, 60, FALSE, '2026-08-18T07:00:31+00:00'),
  ('68ae7227-1054-5745-914b-f70134bf114b', 'fd2822a3-6d07-5e35-b732-63db21b324c2', 'working', 2, 10, 42.5, 150, FALSE, '2026-08-18T07:04:11+00:00'),
  ('f0cd9ff8-bdf6-537d-ab5a-98ee8ebcbd68', 'fd2822a3-6d07-5e35-b732-63db21b324c2', 'working', 3, 10, 42.5, 150, FALSE, '2026-08-18T07:07:51+00:00'),
  ('548be3c7-03f7-5dcc-aa9e-cec39d657dcc', '6557dc0e-6970-5b92-9782-08c1078b424a', 'working', 1, 12, 90.0, 120, FALSE, '2026-08-18T07:11:07+00:00'),
  ('fd44f942-2aa0-5af5-b146-75d4a2b4a5ba', '6557dc0e-6970-5b92-9782-08c1078b424a', 'working', 2, 12, 90.0, 120, FALSE, '2026-08-18T07:14:23+00:00'),
  ('b7963255-7065-5c39-a7d3-f1e9aca8ff79', '6557dc0e-6970-5b92-9782-08c1078b424a', 'working', 3, 12, 90.0, 90, FALSE, '2026-08-18T07:17:09+00:00'),
  ('a7f21c53-5018-57d6-af6e-797db984147e', '6557dc0e-6970-5b92-9782-08c1078b424a', 'dropset', 4, 14, 70.0, 120, FALSE, '2026-08-18T07:20:31+00:00'),
  ('74389083-d67f-570e-881e-b8593081c2a7', '3f6336ea-fb98-5e0c-9902-c1f075fe86f6', 'working', 1, 11, 0.0, 90, FALSE, '2026-08-18T07:23:14+00:00'),
  ('cf6d0b1c-81a4-5b3f-b2e8-9eeb3c78bc97', '3f6336ea-fb98-5e0c-9902-c1f075fe86f6', 'working', 2, 14, 0.0, 150, FALSE, '2026-08-18T07:27:06+00:00'),
  ('1dc426f5-f3d7-55e4-b1ce-861fdfa3f886', '3f6336ea-fb98-5e0c-9902-c1f075fe86f6', 'failure', 3, 11, 0.0, 90, FALSE, '2026-08-18T07:29:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('96b56a72-db22-58dd-801e-107284aafc09', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-08-20T06:04:00+00:00', '2026-08-20T07:09:49+00:00', 3949, 3452.0, FALSE, 84.0, 'gym', 170);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8b872e2c-184e-5931-a2e7-b9877723683e', '96b56a72-db22-58dd-801e-107284aafc09', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('ab4dfde7-7021-516f-9323-4140dcfc946a', '96b56a72-db22-58dd-801e-107284aafc09', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('ba336940-5b32-5783-a0ba-6e28cffce9b1', '96b56a72-db22-58dd-801e-107284aafc09', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('4450a0b0-b333-5152-addc-ab4d00589b70', '96b56a72-db22-58dd-801e-107284aafc09', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('923b04e2-fe5b-5dca-bea9-4aef7505eb89', '96b56a72-db22-58dd-801e-107284aafc09', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('740cab9f-886e-5f2f-ac2a-421e28c653a7', '8b872e2c-184e-5931-a2e7-b9877723683e', 'warmup', 1, 8, 25.0, NULL, FALSE, '2026-08-20T06:10:49+00:00'),
  ('4fb84fbd-3527-5b78-9372-a85721c01230', '8b872e2c-184e-5931-a2e7-b9877723683e', 'warmup', 2, 5, 37.5, NULL, FALSE, '2026-08-20T06:12:29+00:00'),
  ('ff13bc91-8201-5289-90d1-7fad2982eabb', '8b872e2c-184e-5931-a2e7-b9877723683e', 'working', 3, 5, 50.0, 120, FALSE, '2026-08-20T06:15:24+00:00'),
  ('f6d67370-e3f9-5b42-ac46-d1797e529d98', '8b872e2c-184e-5931-a2e7-b9877723683e', 'working', 4, 5, 50.0, 150, FALSE, '2026-08-20T06:18:49+00:00'),
  ('21e142d1-58ab-50bd-8f3a-58e4f3e16676', '8b872e2c-184e-5931-a2e7-b9877723683e', 'working', 5, 5, 50.0, 120, FALSE, '2026-08-20T06:21:44+00:00'),
  ('b73c9be6-5c84-56d7-84fb-4fd4d94e11d5', '8b872e2c-184e-5931-a2e7-b9877723683e', 'working', 6, 5, 50.0, 150, FALSE, '2026-08-20T06:25:09+00:00'),
  ('29917333-b175-5a3a-986c-08ecc4dd3a38', 'ab4dfde7-7021-516f-9323-4140dcfc946a', 'working', 1, 10, 0.0, 120, FALSE, '2026-08-20T06:28:19+00:00'),
  ('635f5449-3f2e-5c77-ba71-f5c03f108fae', 'ab4dfde7-7021-516f-9323-4140dcfc946a', 'working', 2, 11, 0.0, 150, FALSE, '2026-08-20T06:32:02+00:00'),
  ('6802568e-ae91-55b7-966e-82eed4e6a40c', 'ab4dfde7-7021-516f-9323-4140dcfc946a', 'working', 3, 12, 0.0, 90, FALSE, '2026-08-20T06:34:48+00:00'),
  ('01707c04-bdd7-5a55-8047-f16ac65f4c29', 'ab4dfde7-7021-516f-9323-4140dcfc946a', 'dropset', 4, 14, 0.0, 120, FALSE, '2026-08-20T06:38:10+00:00'),
  ('8030e567-5494-5706-b73e-6075570f0b35', 'ba336940-5b32-5783-a0ba-6e28cffce9b1', 'working', 1, 10, 34.0, 90, FALSE, '2026-08-20T06:40:50+00:00'),
  ('f565f410-3359-5add-9403-c0ef95c5eb5b', 'ba336940-5b32-5783-a0ba-6e28cffce9b1', 'working', 2, 10, 34.0, 120, FALSE, '2026-08-20T06:44:00+00:00'),
  ('823b83be-c3fd-5b02-aaf9-a1db04c0a1c5', 'ba336940-5b32-5783-a0ba-6e28cffce9b1', 'failure', 3, 8, 34.0, 90, FALSE, '2026-08-20T06:46:34+00:00'),
  ('0561b3be-fad5-5855-a952-c5894c0d1033', '4450a0b0-b333-5152-addc-ab4d00589b70', 'working', 1, 15, 10.0, 120, FALSE, '2026-08-20T06:49:59+00:00'),
  ('d0f5d871-7318-56cd-97a5-20f2894517c6', '4450a0b0-b333-5152-addc-ab4d00589b70', 'working', 2, 15, 10.0, 120, FALSE, '2026-08-20T06:53:24+00:00'),
  ('c7686a03-d2f4-593b-94ac-cc7efdf06551', '4450a0b0-b333-5152-addc-ab4d00589b70', 'working', 3, 15, 10.0, 90, FALSE, '2026-08-20T06:56:19+00:00'),
  ('3d974310-72a3-557e-8828-82b9311816be', '923b04e2-fe5b-5dca-bea9-4aef7505eb89', 'working', 1, 10, 35.0, 150, FALSE, '2026-08-20T06:59:59+00:00'),
  ('26cbf090-15f7-5ad9-809e-582e2d71c710', '923b04e2-fe5b-5dca-bea9-4aef7505eb89', 'working', 2, 10, 35.0, 120, FALSE, '2026-08-20T07:03:09+00:00'),
  ('d26cc91c-0cd5-58ff-9a5e-cb8532a793ba', '923b04e2-fe5b-5dca-bea9-4aef7505eb89', 'working', 3, 10, 35.0, 150, FALSE, '2026-08-20T07:06:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7551f8d4-f6d3-574a-9584-192964011ddb', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-08-22T06:19:00+00:00', '2026-08-22T07:06:00+00:00', 2820, 11425.0, FALSE, 84.0, 'gym', 117);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', '7551f8d4-f6d3-574a-9584-192964011ddb', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('a33c242a-9354-5af5-bdeb-04642bcc2e91', '7551f8d4-f6d3-574a-9584-192964011ddb', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('5268d378-43c1-5a29-b69b-4d2fc312c197', '7551f8d4-f6d3-574a-9584-192964011ddb', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('296e9bd9-aa4a-5c9e-9de9-d0bdbb6f391c', '7551f8d4-f6d3-574a-9584-192964011ddb', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('3d4c5d78-4c69-5fa8-9726-bd023f18d5f8', 'aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-08-22T06:25:49+00:00'),
  ('5b329e22-9cb5-5027-b451-e4fe2922215e', 'aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', 'warmup', 2, 5, 100.0, NULL, FALSE, '2026-08-22T06:27:29+00:00'),
  ('805b29f1-3cc8-59ae-892f-4907f9f3d6d0', 'aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', 'working', 3, 5, 135.0, 90, FALSE, '2026-08-22T06:29:54+00:00'),
  ('bdbaed3b-a954-5384-a1f7-99ed719330ff', 'aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', 'working', 4, 5, 135.0, 90, FALSE, '2026-08-22T06:32:19+00:00'),
  ('b9780ece-24a2-594a-b059-8becb2eb1350', 'aaf9e4f0-f326-58e4-bc0f-1e8a88559bff', 'working', 5, 5, 135.0, 90, FALSE, '2026-08-22T06:34:44+00:00'),
  ('bb86490c-b6a2-5af7-8e3f-6e9cc07b9609', 'a33c242a-9354-5af5-bdeb-04642bcc2e91', 'working', 1, 8, 115.0, 120, FALSE, '2026-08-22T06:37:48+00:00'),
  ('d9a58124-1c93-5b4c-86d5-99f7d7e60485', 'a33c242a-9354-5af5-bdeb-04642bcc2e91', 'working', 2, 8, 115.0, 90, FALSE, '2026-08-22T06:40:22+00:00'),
  ('46c8752a-fa87-527f-8418-51d361a69fdc', 'a33c242a-9354-5af5-bdeb-04642bcc2e91', 'dropset', 3, 11, 90.0, 90, FALSE, '2026-08-22T06:43:05+00:00'),
  ('6ec9bf91-8b43-50c2-833b-8c0e2f49ef34', '5268d378-43c1-5a29-b69b-4d2fc312c197', 'working', 1, 8, 95.0, 90, FALSE, '2026-08-22T06:45:39+00:00'),
  ('973ded42-482d-5afe-a6d0-d5c7e76b917e', '5268d378-43c1-5a29-b69b-4d2fc312c197', 'working', 2, 8, 95.0, 150, FALSE, '2026-08-22T06:49:13+00:00'),
  ('8c9556bf-125f-599d-b195-d7e454dfa777', '5268d378-43c1-5a29-b69b-4d2fc312c197', 'working', 3, 8, 95.0, 90, FALSE, '2026-08-22T06:51:47+00:00'),
  ('7a4e206a-243d-5cc8-aa3a-9cba35040db7', '296e9bd9-aa4a-5c9e-9de9-d0bdbb6f391c', 'working', 1, 12, 90.0, 90, FALSE, '2026-08-22T06:54:33+00:00'),
  ('b52fed33-ff01-507e-8f6a-0cdf13f74bf2', '296e9bd9-aa4a-5c9e-9de9-d0bdbb6f391c', 'working', 2, 12, 90.0, 60, FALSE, '2026-08-22T06:56:49+00:00'),
  ('525d115f-c928-59ad-9b19-5726d08b87b8', '296e9bd9-aa4a-5c9e-9de9-d0bdbb6f391c', 'working', 3, 12, 90.0, 120, FALSE, '2026-08-22T07:00:05+00:00'),
  ('353caa7c-7154-5b4f-9baf-0a890c74695f', '296e9bd9-aa4a-5c9e-9de9-d0bdbb6f391c', 'dropset', 4, 15, 70.0, 90, FALSE, '2026-08-22T07:03:00+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7620e6cc-259f-59bb-abcd-9ed28d74aba8', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-08-24T06:12:00+00:00', '2026-08-24T07:16:19+00:00', 3859, 5973.0, FALSE, 84.0, 'gym', 147);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('19906050-fcdc-588f-83dd-b21a465d448c', '7620e6cc-259f-59bb-abcd-9ed28d74aba8', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', '7620e6cc-259f-59bb-abcd-9ed28d74aba8', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('6af135e9-fe50-5161-b924-7c8fc29ed9c8', '7620e6cc-259f-59bb-abcd-9ed28d74aba8', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('2b5f06b0-df3a-57b4-8a79-93d21a05107e', '7620e6cc-259f-59bb-abcd-9ed28d74aba8', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('61a4a282-8ab9-5dd5-a159-7c193821c9f6', '7620e6cc-259f-59bb-abcd-9ed28d74aba8', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1fb2b22d-5f08-557e-a7db-e3b07038811f', '19906050-fcdc-588f-83dd-b21a465d448c', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-08-24T06:18:49+00:00'),
  ('5b86ab67-f157-5bf7-b3e5-8085b7111154', '19906050-fcdc-588f-83dd-b21a465d448c', 'warmup', 2, 5, 72.5, NULL, FALSE, '2026-08-24T06:20:29+00:00'),
  ('3716e9fd-8d67-5609-ab48-980b77de4528', '19906050-fcdc-588f-83dd-b21a465d448c', 'working', 3, 5, 97.5, 90, FALSE, '2026-08-24T06:22:54+00:00'),
  ('ad49e1d1-2c39-5d09-8bdb-fa6fe51fccbf', '19906050-fcdc-588f-83dd-b21a465d448c', 'working', 4, 5, 97.5, 90, FALSE, '2026-08-24T06:25:19+00:00'),
  ('b2143954-a8bb-5766-b6f4-f441af0453bd', '19906050-fcdc-588f-83dd-b21a465d448c', 'working', 5, 5, 97.5, 150, FALSE, '2026-08-24T06:28:44+00:00'),
  ('cfef648b-bf7e-5f3e-8ebc-081c640f08a0', '19906050-fcdc-588f-83dd-b21a465d448c', 'working', 6, 3, 97.5, 90, FALSE, '2026-08-24T06:31:03+00:00'),
  ('606500c8-1b98-514f-963b-6b6a8c463712', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-08-24T06:32:52+00:00'),
  ('8f2b95f8-4add-552a-9515-a97ebfcdb4fe', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-08-24T06:34:32+00:00'),
  ('b51061e1-40a4-56d9-a1f9-52bcb4abc09a', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'working', 3, 6, 87.5, 150, FALSE, '2026-08-24T06:38:00+00:00'),
  ('9ffab4f7-7a89-59bf-a67e-5bea6a974e33', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'working', 4, 6, 87.5, 120, FALSE, '2026-08-24T06:40:58+00:00'),
  ('3a34ca4a-a9e4-5b79-bdbc-cdd3d472e4a2', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'working', 5, 6, 87.5, 60, FALSE, '2026-08-24T06:42:56+00:00'),
  ('b65354b5-c128-50e9-a58c-778270537838', 'c3e3ddd4-3a30-5ef2-82a0-b559c2fcf4df', 'working', 6, 6, 87.5, 60, FALSE, '2026-08-24T06:44:54+00:00'),
  ('814a188d-91ac-5efc-af26-bdcfb62f10e0', '6af135e9-fe50-5161-b924-7c8fc29ed9c8', 'working', 1, 8, 42.0, 90, FALSE, '2026-08-24T06:47:28+00:00'),
  ('c96046fe-142d-5017-87c8-048c4f2c4af5', '6af135e9-fe50-5161-b924-7c8fc29ed9c8', 'working', 2, 8, 42.0, 90, FALSE, '2026-08-24T06:50:02+00:00'),
  ('b516ce0d-319e-542f-a42b-f34e9e0e5dfb', '6af135e9-fe50-5161-b924-7c8fc29ed9c8', 'working', 3, 8, 42.0, 150, FALSE, '2026-08-24T06:53:36+00:00'),
  ('02a93828-9239-58c0-af85-206354500969', '2b5f06b0-df3a-57b4-8a79-93d21a05107e', 'working', 1, 13, 0.0, 120, FALSE, '2026-08-24T06:56:55+00:00'),
  ('942acc1b-f447-535d-9704-b3261fc683b3', '2b5f06b0-df3a-57b4-8a79-93d21a05107e', 'working', 2, 13, 0.0, 60, FALSE, '2026-08-24T06:59:14+00:00'),
  ('f1fdddd4-a659-50a5-aea7-b6ec196c9207', '2b5f06b0-df3a-57b4-8a79-93d21a05107e', 'working', 3, 12, 0.0, 60, FALSE, '2026-08-24T07:01:30+00:00'),
  ('000af415-7ce8-5581-8aac-a9c85cc95f2f', '2b5f06b0-df3a-57b4-8a79-93d21a05107e', 'working', 4, 11, 0.0, 90, FALSE, '2026-08-24T07:04:13+00:00'),
  ('f59c3636-89f3-50a3-8fb4-260a4d89be7c', '61a4a282-8ab9-5dd5-a159-7c193821c9f6', 'working', 1, 10, 37.5, 150, FALSE, '2026-08-24T07:07:53+00:00'),
  ('c526836c-c419-5fc6-a97f-d66656071574', '61a4a282-8ab9-5dd5-a159-7c193821c9f6', 'working', 2, 10, 37.5, 90, FALSE, '2026-08-24T07:10:33+00:00'),
  ('ea563f5d-5b04-596b-bb96-d1a55e0f6f16', '61a4a282-8ab9-5dd5-a159-7c193821c9f6', 'dropset', 3, 12, 30.0, 90, FALSE, '2026-08-24T07:13:19+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-08-25T06:16:00+00:00', '2026-08-25T07:14:22+00:00', 3502, 12125.0, FALSE, 84.0, 'gym', 161);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', '6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('af7a60c1-0793-53d0-a4a5-ee4471031782', '6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('55ba3654-6f82-5004-9299-9ea560463fca', '6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('ef704860-02a4-5b08-91e5-5635e84e5bc3', '6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('55e640c0-e784-5c40-8dec-5554e6f5e9c2', '6920e9ea-0484-52a3-9f3e-e1b5bafbd3be', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('8aa961ff-d6d3-5834-aa04-d10b0fca8a65', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-08-25T06:22:49+00:00'),
  ('e10030f3-62b9-5fce-8116-9b146afd9623', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'warmup', 2, 5, 105.0, NULL, FALSE, '2026-08-25T06:24:29+00:00'),
  ('36cd4488-636b-53a5-8a1c-25f391956ac0', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'working', 3, 5, 140.0, 150, FALSE, '2026-08-25T06:27:54+00:00'),
  ('2237c38e-4367-5e55-acaa-afc3b6333ce1', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'working', 4, 5, 140.0, 90, FALSE, '2026-08-25T06:30:19+00:00'),
  ('9c4a6c8b-2236-50d6-ad68-78ed49824025', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'working', 5, 5, 140.0, 90, FALSE, '2026-08-25T06:32:44+00:00'),
  ('cf356dc7-5936-56bb-8636-d95fb43ef33f', 'ad23e59b-aaf5-5003-93fd-8a1d0d800c3d', 'working', 6, 5, 140.0, 60, FALSE, '2026-08-25T06:34:39+00:00'),
  ('4f44d259-a490-5273-9c26-76df1e3f71b8', 'af7a60c1-0793-53d0-a4a5-ee4471031782', 'working', 1, 8, 107.5, 90, FALSE, '2026-08-25T06:37:13+00:00'),
  ('08992cb2-e630-59eb-ba7c-8f7907ddec35', 'af7a60c1-0793-53d0-a4a5-ee4471031782', 'working', 2, 8, 107.5, 90, FALSE, '2026-08-25T06:39:47+00:00'),
  ('eec7de13-f512-5283-b5a1-1b479754231d', 'af7a60c1-0793-53d0-a4a5-ee4471031782', 'working', 3, 8, 107.5, 60, FALSE, '2026-08-25T06:41:51+00:00'),
  ('c8e352ff-f03c-529b-9b56-ba4d8f6c43b5', '55ba3654-6f82-5004-9299-9ea560463fca', 'working', 1, 10, 52.5, 90, FALSE, '2026-08-25T06:44:31+00:00'),
  ('8c05f653-61d2-595f-b293-30c3115c8b90', '55ba3654-6f82-5004-9299-9ea560463fca', 'working', 2, 10, 52.5, 120, FALSE, '2026-08-25T06:47:41+00:00'),
  ('16bf590d-04bc-5cb8-b7a1-2353ef857cd7', '55ba3654-6f82-5004-9299-9ea560463fca', 'working', 3, 10, 52.5, 60, FALSE, '2026-08-25T06:49:51+00:00'),
  ('39c89bc9-c560-553e-b876-4b28fd0a4573', 'ef704860-02a4-5b08-91e5-5635e84e5bc3', 'working', 1, 12, 110.0, 150, FALSE, '2026-08-25T06:53:37+00:00'),
  ('3574045b-e40d-5f93-84c6-8377bc7a17c2', 'ef704860-02a4-5b08-91e5-5635e84e5bc3', 'working', 2, 12, 110.0, 90, FALSE, '2026-08-25T06:56:23+00:00'),
  ('6bc83c68-f349-5b3c-9802-4f2e45fb9ad5', 'ef704860-02a4-5b08-91e5-5635e84e5bc3', 'working', 3, 12, 110.0, 60, FALSE, '2026-08-25T06:58:39+00:00'),
  ('cb9655e3-3b21-58a0-949f-7fabf8d1b654', 'ef704860-02a4-5b08-91e5-5635e84e5bc3', 'working', 4, 11, 110.0, 150, FALSE, '2026-08-25T07:02:22+00:00'),
  ('abd848e5-5125-5c26-9308-c51082b2fad2', '55e640c0-e784-5c40-8dec-5554e6f5e9c2', 'working', 1, 15, 0.0, 90, FALSE, '2026-08-25T07:05:17+00:00'),
  ('7272762c-dff6-5f5d-9cca-5263a04cbd34', '55e640c0-e784-5c40-8dec-5554e6f5e9c2', 'working', 2, 12, 0.0, 90, FALSE, '2026-08-25T07:08:03+00:00'),
  ('06df97a3-e0c5-5c3b-8806-21de29b170e6', '55e640c0-e784-5c40-8dec-5554e6f5e9c2', 'working', 3, 13, 0.0, 120, FALSE, '2026-08-25T07:11:22+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('cb7479f1-41e6-5cef-b7c9-dca857c07afb', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-08-27T06:37:00+00:00', '2026-08-27T07:36:31+00:00', 3571, 4377.5, FALSE, 84.0, 'gym', 174);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('b277893b-8405-5c2d-9600-21122e5e9ddd', 'cb7479f1-41e6-5cef-b7c9-dca857c07afb', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('7c7c6451-903c-5d4d-85f7-af3c474e5e65', 'cb7479f1-41e6-5cef-b7c9-dca857c07afb', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('3b110e42-1a6a-54bf-ba9f-a97697232b12', 'cb7479f1-41e6-5cef-b7c9-dca857c07afb', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('838fb0de-0662-5bd6-8006-b5b27ca67d68', 'cb7479f1-41e6-5cef-b7c9-dca857c07afb', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('eb2e38b6-1365-5390-84f5-8e0f0427b14f', 'cb7479f1-41e6-5cef-b7c9-dca857c07afb', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('533bad18-4faa-50f9-a694-048db7927a3d', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-08-27T06:43:49+00:00'),
  ('eb28c809-20ff-5be4-8b6e-f83fc2a340e6', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'warmup', 2, 5, 47.5, NULL, FALSE, '2026-08-27T06:45:29+00:00'),
  ('7f84e4a3-16f2-588d-aed2-4aadb09a5b9f', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'working', 3, 5, 62.5, 90, FALSE, '2026-08-27T06:47:54+00:00'),
  ('57d68c7d-2c3f-5ec1-b34b-b820e5a3abe3', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'working', 4, 5, 62.5, 150, FALSE, '2026-08-27T06:51:19+00:00'),
  ('fc4415dd-457c-583b-9bb8-8bec8cf8efd9', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'working', 5, 5, 62.5, 60, FALSE, '2026-08-27T06:53:14+00:00'),
  ('c02b83a9-bda5-51db-bf94-8bcfcab67914', 'b277893b-8405-5c2d-9600-21122e5e9ddd', 'working', 6, 5, 62.5, 150, FALSE, '2026-08-27T06:56:39+00:00'),
  ('9132de6f-34a8-5352-9ffa-02547e2f0a5a', '7c7c6451-903c-5d4d-85f7-af3c474e5e65', 'working', 1, 13, 0.0, 90, FALSE, '2026-08-27T06:59:28+00:00'),
  ('41dc45a9-65e1-5bf3-8724-821f896c39f0', '7c7c6451-903c-5d4d-85f7-af3c474e5e65', 'working', 2, 11, 0.0, 90, FALSE, '2026-08-27T07:02:11+00:00'),
  ('fde26e86-58dd-590d-8d0f-ed6e58cb8cef', '7c7c6451-903c-5d4d-85f7-af3c474e5e65', 'working', 3, 12, 0.0, 120, FALSE, '2026-08-27T07:05:27+00:00'),
  ('dbb18d74-f7b2-58ff-83c1-51b4ab3f5a59', '7c7c6451-903c-5d4d-85f7-af3c474e5e65', 'failure', 4, 12, 0.0, 90, FALSE, '2026-08-27T07:08:13+00:00'),
  ('fc420255-adff-593b-a7fd-e59a87c1c63a', '3b110e42-1a6a-54bf-ba9f-a97697232b12', 'working', 1, 10, 42.0, 150, FALSE, '2026-08-27T07:11:53+00:00'),
  ('8ddbf0a1-0a3d-5c9a-b11d-3ebd10b45e37', '3b110e42-1a6a-54bf-ba9f-a97697232b12', 'working', 2, 10, 42.0, 90, FALSE, '2026-08-27T07:14:33+00:00'),
  ('cad3771f-0c8f-50d2-9a70-f4c0d50a33be', '3b110e42-1a6a-54bf-ba9f-a97697232b12', 'working', 3, 10, 42.0, 90, FALSE, '2026-08-27T07:17:13+00:00'),
  ('b980c3b7-b36a-594a-9156-2a2ef06ec7f0', '838fb0de-0662-5bd6-8006-b5b27ca67d68', 'working', 1, 15, 13.75, 150, FALSE, '2026-08-27T07:21:08+00:00'),
  ('5ccf7d81-d726-594e-9e2f-b68cb52bde91', '838fb0de-0662-5bd6-8006-b5b27ca67d68', 'working', 2, 15, 13.75, 90, FALSE, '2026-08-27T07:24:03+00:00'),
  ('c61aae19-ec46-5f77-8b74-afcae34bed39', '838fb0de-0662-5bd6-8006-b5b27ca67d68', 'dropset', 3, 16, 11.25, 60, FALSE, '2026-08-27T07:26:31+00:00'),
  ('9e8f0b13-8de7-5310-b77d-bd091d7fd1c5', 'eb2e38b6-1365-5390-84f5-8e0f0427b14f', 'working', 1, 10, 42.5, 60, FALSE, '2026-08-27T07:28:41+00:00'),
  ('d140c24e-6d61-55a4-8094-849d3ca955ba', 'eb2e38b6-1365-5390-84f5-8e0f0427b14f', 'working', 2, 10, 42.5, 90, FALSE, '2026-08-27T07:31:21+00:00'),
  ('725ee12e-aa13-5efb-b6cf-13794f25896b', 'eb2e38b6-1365-5390-84f5-8e0f0427b14f', 'working', 3, 10, 42.5, 60, FALSE, '2026-08-27T07:33:31+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('49e88296-88ab-5270-a36f-a9bcb3908455', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-08-29T06:06:00+00:00', '2026-08-29T06:54:18+00:00', 2898, 13832.5, FALSE, 84.0, 'gym', 113);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('09cd527f-0452-50b1-a337-3f7c529b6379', '49e88296-88ab-5270-a36f-a9bcb3908455', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('3fc07f7a-7bba-5f93-b189-420cee5d4198', '49e88296-88ab-5270-a36f-a9bcb3908455', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('ce94c602-0daf-513a-893c-01c7e955e4f6', '49e88296-88ab-5270-a36f-a9bcb3908455', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('c14387d1-c5e0-549d-9e6e-94f91fc616d0', '49e88296-88ab-5270-a36f-a9bcb3908455', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4973c3f4-8d79-5ec2-9da2-9b4ac26360fa', '09cd527f-0452-50b1-a337-3f7c529b6379', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-08-29T06:12:49+00:00'),
  ('57eab9ba-3589-5fdf-9595-52a21918fd62', '09cd527f-0452-50b1-a337-3f7c529b6379', 'warmup', 2, 5, 125.0, NULL, FALSE, '2026-08-29T06:14:29+00:00'),
  ('c5314ab0-77c3-5295-939b-432234a125e3', '09cd527f-0452-50b1-a337-3f7c529b6379', 'working', 3, 5, 165.0, 120, FALSE, '2026-08-29T06:17:24+00:00'),
  ('70b49e40-275d-5690-b284-2b78c48c5087', '09cd527f-0452-50b1-a337-3f7c529b6379', 'working', 4, 5, 165.0, 150, FALSE, '2026-08-29T06:20:49+00:00'),
  ('f9ff71f7-67e8-57e3-8a5a-25f2604b89c3', '09cd527f-0452-50b1-a337-3f7c529b6379', 'working', 5, 5, 165.0, 120, FALSE, '2026-08-29T06:23:44+00:00'),
  ('53c3a45a-4ddd-5342-a12b-28669b854b80', '3fc07f7a-7bba-5f93-b189-420cee5d4198', 'working', 1, 8, 140.0, 150, FALSE, '2026-08-29T06:27:18+00:00'),
  ('6ca8e409-55dc-5c64-b869-8e0885ec15d1', '3fc07f7a-7bba-5f93-b189-420cee5d4198', 'working', 2, 8, 140.0, 60, FALSE, '2026-08-29T06:29:22+00:00'),
  ('efdcdbf9-206f-570e-8685-fc9ad406101c', '3fc07f7a-7bba-5f93-b189-420cee5d4198', 'failure', 3, 7, 140.0, 60, FALSE, '2026-08-29T06:31:23+00:00'),
  ('00d190fb-fc6a-56fc-8ef1-e80f9ac337f8', 'ce94c602-0daf-513a-893c-01c7e955e4f6', 'working', 1, 8, 115.0, 90, FALSE, '2026-08-29T06:33:57+00:00'),
  ('8698a241-4c1e-5293-81be-96f4c23bbf48', 'ce94c602-0daf-513a-893c-01c7e955e4f6', 'working', 2, 8, 115.0, 150, FALSE, '2026-08-29T06:37:31+00:00'),
  ('7c5e5924-efb6-5bd6-80a4-9c17d4d65130', 'ce94c602-0daf-513a-893c-01c7e955e4f6', 'dropset', 3, 11, 92.5, 60, FALSE, '2026-08-29T06:39:44+00:00'),
  ('47026910-82ef-56b8-96c0-7742971f1677', 'c14387d1-c5e0-549d-9e6e-94f91fc616d0', 'working', 1, 12, 110.0, 60, FALSE, '2026-08-29T06:42:00+00:00'),
  ('c8c6e0f8-1808-55e8-9609-4013094131a2', 'c14387d1-c5e0-549d-9e6e-94f91fc616d0', 'working', 2, 12, 110.0, 90, FALSE, '2026-08-29T06:44:46+00:00'),
  ('ab3691ba-1d5d-5be4-9281-fe27357cbf47', 'c14387d1-c5e0-549d-9e6e-94f91fc616d0', 'working', 3, 12, 110.0, 150, FALSE, '2026-08-29T06:48:32+00:00'),
  ('d101ab1c-7cb3-5ec2-9143-8f05e2ae846e', 'c14387d1-c5e0-549d-9e6e-94f91fc616d0', 'working', 4, 12, 110.0, 90, FALSE, '2026-08-29T06:51:18+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d6b689a3-f4c7-5956-aabe-c2a149cae9c7', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-08-31T06:18:00+00:00', '2026-08-31T07:20:55+00:00', 3775, 6099.0, FALSE, 84.0, 'gym', 139);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'd6b689a3-f4c7-5956-aabe-c2a149cae9c7', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'd6b689a3-f4c7-5956-aabe-c2a149cae9c7', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('75fb8efa-c510-5b44-825e-be66cd62fec1', 'd6b689a3-f4c7-5956-aabe-c2a149cae9c7', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('e3c3292a-cdad-5958-97b7-3f7ded8af131', 'd6b689a3-f4c7-5956-aabe-c2a149cae9c7', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('a81212c8-59e5-5091-a9d1-899c31c2fd42', 'd6b689a3-f4c7-5956-aabe-c2a149cae9c7', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f90a249b-c92d-533c-ac19-3abcb0a38f87', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-08-31T06:24:49+00:00'),
  ('8e771945-7cf2-5167-a412-96ad4d1058c4', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'warmup', 2, 5, 72.5, NULL, FALSE, '2026-08-31T06:26:29+00:00'),
  ('f02397fd-17c9-5257-b733-4dcdc2593e7a', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'working', 3, 5, 97.5, 90, FALSE, '2026-08-31T06:28:54+00:00'),
  ('2b2e7130-471f-5838-beaf-9cc109d094fa', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'working', 4, 5, 97.5, 60, FALSE, '2026-08-31T06:30:49+00:00'),
  ('2aab670c-f1cd-5e5e-9f2c-4f7ea9f3ab5d', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'working', 5, 5, 97.5, 60, FALSE, '2026-08-31T06:32:44+00:00'),
  ('3b75b5bb-ddc9-5e57-9173-ce98e5ce5c7a', 'c242a2e1-f553-5bf0-8cbc-3a7fe0cd50a3', 'working', 6, 5, 97.5, 60, FALSE, '2026-08-31T06:34:39+00:00'),
  ('9e362dac-6abf-569a-ab6e-ebcb42f35c42', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-08-31T06:36:28+00:00'),
  ('620a2a2c-083f-5753-8597-d0abffb4e92b', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-08-31T06:38:08+00:00'),
  ('247bdf44-a76b-550d-b313-3d7d9b199276', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'working', 3, 6, 87.5, 60, FALSE, '2026-08-31T06:40:06+00:00'),
  ('b2e38f40-04b7-5961-b534-5a5903c541a0', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'working', 4, 6, 87.5, 90, FALSE, '2026-08-31T06:42:34+00:00'),
  ('f171b4f4-2400-5ad0-a7af-aad2d94b4423', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'working', 5, 6, 87.5, 90, FALSE, '2026-08-31T06:45:02+00:00'),
  ('59ea49a0-b53e-5cdf-b4c2-dbe5977a7bab', '0583fa3d-5fe2-51b4-aa55-3035ef5e63db', 'working', 6, 6, 87.5, 150, FALSE, '2026-08-31T06:48:30+00:00'),
  ('f342e0d5-a150-52e2-91fd-4abd6518b45c', '75fb8efa-c510-5b44-825e-be66cd62fec1', 'working', 1, 8, 42.0, 90, FALSE, '2026-08-31T06:51:04+00:00'),
  ('245639f1-f079-577b-9eb0-f5d8dc72bf0f', '75fb8efa-c510-5b44-825e-be66cd62fec1', 'working', 2, 8, 42.0, 90, FALSE, '2026-08-31T06:53:38+00:00'),
  ('7c8cfa90-a21b-5589-9662-6ec844147239', '75fb8efa-c510-5b44-825e-be66cd62fec1', 'working', 3, 6, 42.0, 120, FALSE, '2026-08-31T06:56:36+00:00'),
  ('5f38de30-4d2e-5ca5-bc97-44419f0f1d28', 'e3c3292a-cdad-5958-97b7-3f7ded8af131', 'working', 1, 10, 0.0, 150, FALSE, '2026-08-31T07:00:16+00:00'),
  ('75bb168d-e4e2-52ac-83a1-4b48dd90ea3c', 'e3c3292a-cdad-5958-97b7-3f7ded8af131', 'working', 2, 10, 0.0, 120, FALSE, '2026-08-31T07:03:26+00:00'),
  ('30bac3ce-b47c-54a0-8159-591fe4437bc6', 'e3c3292a-cdad-5958-97b7-3f7ded8af131', 'working', 3, 11, 0.0, 90, FALSE, '2026-08-31T07:06:09+00:00'),
  ('4d8b08d2-fa43-59de-96ec-1c442390498d', 'e3c3292a-cdad-5958-97b7-3f7ded8af131', 'failure', 4, 12, 0.0, 90, FALSE, '2026-08-31T07:08:55+00:00'),
  ('b28987e2-8ee3-5714-bbd7-2caa67fe1df6', 'a81212c8-59e5-5091-a9d1-899c31c2fd42', 'working', 1, 10, 37.5, 120, FALSE, '2026-08-31T07:12:05+00:00'),
  ('ff70648e-27c9-584a-ad86-bc7891971569', 'a81212c8-59e5-5091-a9d1-899c31c2fd42', 'working', 2, 10, 37.5, 90, FALSE, '2026-08-31T07:14:45+00:00'),
  ('3530218d-0dc4-5ba0-92e5-2f2ec548e3b5', 'a81212c8-59e5-5091-a9d1-899c31c2fd42', 'working', 3, 10, 37.5, 120, FALSE, '2026-08-31T07:17:55+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('388a529d-f7a8-5924-b0c0-fb07844b6001', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-09-01T06:13:00+00:00', '2026-09-01T07:13:10+00:00', 3610, 12252.5, FALSE, 84.0, 'gym', 167);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('5863ff7c-e029-52cb-848f-2181cb065efc', '388a529d-f7a8-5924-b0c0-fb07844b6001', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('489e7d52-16e5-5658-8943-ed0dd052b392', '388a529d-f7a8-5924-b0c0-fb07844b6001', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('6afba5ab-04c2-5fec-ba70-d9c98c206c14', '388a529d-f7a8-5924-b0c0-fb07844b6001', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('fa235649-a634-51f1-a6a8-11c71d94914e', '388a529d-f7a8-5924-b0c0-fb07844b6001', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('83ae0e96-1055-5d31-b1ce-42d4ed38f166', '388a529d-f7a8-5924-b0c0-fb07844b6001', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('05d8b6b6-fc0d-5a87-84d4-08e4899fb76e', '5863ff7c-e029-52cb-848f-2181cb065efc', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-09-01T06:19:49+00:00'),
  ('91879cc3-121d-5788-b14e-bc6bb03f27d0', '5863ff7c-e029-52cb-848f-2181cb065efc', 'warmup', 2, 5, 105.0, NULL, FALSE, '2026-09-01T06:21:29+00:00'),
  ('fba2f0db-9395-5278-9800-32bb1855c272', '5863ff7c-e029-52cb-848f-2181cb065efc', 'working', 3, 5, 140.0, 150, FALSE, '2026-09-01T06:24:54+00:00'),
  ('cc15de43-1051-55d3-93a7-187d4eea786f', '5863ff7c-e029-52cb-848f-2181cb065efc', 'working', 4, 5, 140.0, 90, FALSE, '2026-09-01T06:27:19+00:00'),
  ('2dfe2541-99a0-5b1a-aed0-26ccfd9c7309', '5863ff7c-e029-52cb-848f-2181cb065efc', 'working', 5, 5, 140.0, 60, FALSE, '2026-09-01T06:29:14+00:00'),
  ('23a079ad-f555-50d3-a025-5291996b1983', '5863ff7c-e029-52cb-848f-2181cb065efc', 'working', 6, 5, 140.0, 120, FALSE, '2026-09-01T06:32:09+00:00'),
  ('ab456fca-fcd2-5c3d-8250-7b067a928627', '489e7d52-16e5-5658-8943-ed0dd052b392', 'working', 1, 8, 107.5, 90, FALSE, '2026-09-01T06:34:43+00:00'),
  ('380e5365-6940-5c0b-8a29-105ab8008050', '489e7d52-16e5-5658-8943-ed0dd052b392', 'working', 2, 8, 107.5, 90, FALSE, '2026-09-01T06:37:17+00:00'),
  ('ae354f25-61f6-506d-957f-dcc4691bdf55', '489e7d52-16e5-5658-8943-ed0dd052b392', 'dropset', 3, 10, 85.0, 90, FALSE, '2026-09-01T06:39:57+00:00'),
  ('e6833c8a-d46f-551f-90db-655f45243511', '6afba5ab-04c2-5fec-ba70-d9c98c206c14', 'working', 1, 10, 52.5, 90, FALSE, '2026-09-01T06:42:37+00:00'),
  ('7e6a48f3-4f2a-5e1c-bd9d-2dc6e916e7f2', '6afba5ab-04c2-5fec-ba70-d9c98c206c14', 'working', 2, 10, 52.5, 150, FALSE, '2026-09-01T06:46:17+00:00'),
  ('5fe3a325-d845-5b26-9f81-81b86e7fa0b4', '6afba5ab-04c2-5fec-ba70-d9c98c206c14', 'dropset', 3, 13, 42.5, 120, FALSE, '2026-09-01T06:49:36+00:00'),
  ('9dd8855c-de14-5315-b8ee-ae9089fb5f8a', 'fa235649-a634-51f1-a6a8-11c71d94914e', 'working', 1, 12, 110.0, 90, FALSE, '2026-09-01T06:52:22+00:00'),
  ('2a613f03-5dc5-5dad-9b67-46aeff40dd84', 'fa235649-a634-51f1-a6a8-11c71d94914e', 'working', 2, 12, 110.0, 60, FALSE, '2026-09-01T06:54:38+00:00'),
  ('a1c3a07e-397a-5bfd-95a1-fec294828b4b', 'fa235649-a634-51f1-a6a8-11c71d94914e', 'working', 3, 12, 110.0, 90, FALSE, '2026-09-01T06:57:24+00:00'),
  ('a107543b-02dd-5c9a-a3fd-28958379d174', 'fa235649-a634-51f1-a6a8-11c71d94914e', 'failure', 4, 12, 110.0, 90, FALSE, '2026-09-01T07:00:10+00:00'),
  ('f49dc89d-102e-5449-87d5-74f8274198e4', '83ae0e96-1055-5d31-b1ce-42d4ed38f166', 'working', 1, 13, 0.0, 60, FALSE, '2026-09-01T07:02:29+00:00'),
  ('c8fc309a-b94e-5a76-accb-abaaed0da52d', '83ae0e96-1055-5d31-b1ce-42d4ed38f166', 'working', 2, 15, 0.0, 150, FALSE, '2026-09-01T07:06:24+00:00'),
  ('8bd8c6f9-2c11-5ad9-925f-186acb896e76', '83ae0e96-1055-5d31-b1ce-42d4ed38f166', 'working', 3, 12, 0.0, 150, FALSE, '2026-09-01T07:10:10+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3ab7f186-8a1e-509d-9247-ef052f9ce32d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-09-03T06:28:00+00:00', '2026-09-03T07:27:37+00:00', 3577, 4433.75, FALSE, 84.0, 'gym', 176);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('47a919a8-7691-5953-84eb-17b49ce075eb', '3ab7f186-8a1e-509d-9247-ef052f9ce32d', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('e5d89db6-0eb4-5828-9995-9d35c84a3d22', '3ab7f186-8a1e-509d-9247-ef052f9ce32d', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('caf3029d-5b17-572f-9164-868342bba2f8', '3ab7f186-8a1e-509d-9247-ef052f9ce32d', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('fdba6d53-190a-5c89-b44b-0a9b6a32fb0b', '3ab7f186-8a1e-509d-9247-ef052f9ce32d', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('89892f81-e9b0-59b6-a463-00b298da604b', '3ab7f186-8a1e-509d-9247-ef052f9ce32d', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f28cb1bd-6189-5ee9-ba1b-0a6e4a0aaa2a', '47a919a8-7691-5953-84eb-17b49ce075eb', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-09-03T06:34:49+00:00'),
  ('1703714a-919f-5a29-a721-9729fc8cb96a', '47a919a8-7691-5953-84eb-17b49ce075eb', 'warmup', 2, 5, 47.5, NULL, FALSE, '2026-09-03T06:36:29+00:00'),
  ('ef4d42f9-c40f-5c29-b1ab-c91cb8251cf5', '47a919a8-7691-5953-84eb-17b49ce075eb', 'working', 3, 5, 62.5, 90, FALSE, '2026-09-03T06:38:54+00:00'),
  ('4ebd5bd1-46de-58df-8faa-f5c1ae21b3e6', '47a919a8-7691-5953-84eb-17b49ce075eb', 'working', 4, 5, 62.5, 60, FALSE, '2026-09-03T06:40:49+00:00'),
  ('6c2578cb-20cb-574a-bd81-c6d16c54f3e1', '47a919a8-7691-5953-84eb-17b49ce075eb', 'working', 5, 5, 62.5, 90, FALSE, '2026-09-03T06:43:14+00:00'),
  ('e10b29e9-78bf-5ae4-a493-3d2fa4bb387c', '47a919a8-7691-5953-84eb-17b49ce075eb', 'working', 6, 5, 62.5, 90, FALSE, '2026-09-03T06:45:39+00:00'),
  ('5abb080b-0904-5c72-8761-6eef54a81658', 'e5d89db6-0eb4-5828-9995-9d35c84a3d22', 'working', 1, 12, 0.0, 120, FALSE, '2026-09-03T06:48:55+00:00'),
  ('769af1fd-1114-57c2-94f9-5136b57e5e67', 'e5d89db6-0eb4-5828-9995-9d35c84a3d22', 'working', 2, 13, 0.0, 90, FALSE, '2026-09-03T06:51:44+00:00'),
  ('592738a5-aaaa-55b1-884a-775725565bea', 'e5d89db6-0eb4-5828-9995-9d35c84a3d22', 'working', 3, 11, 0.0, 90, FALSE, '2026-09-03T06:54:27+00:00'),
  ('43d162c9-1d71-5d0b-9c03-a06870495f04', 'e5d89db6-0eb4-5828-9995-9d35c84a3d22', 'working', 4, 12, 0.0, 90, FALSE, '2026-09-03T06:57:13+00:00'),
  ('cafe6503-9109-5031-a991-6e21b1d1699f', 'caf3029d-5b17-572f-9164-868342bba2f8', 'working', 1, 10, 42.0, 90, FALSE, '2026-09-03T06:59:53+00:00'),
  ('630d6678-ff96-5383-9c3b-169f058fa903', 'caf3029d-5b17-572f-9164-868342bba2f8', 'working', 2, 10, 42.0, 150, FALSE, '2026-09-03T07:03:33+00:00'),
  ('ca5b5d8b-5953-5d68-9265-6bd166698ee0', 'caf3029d-5b17-572f-9164-868342bba2f8', 'failure', 3, 10, 42.0, 90, FALSE, '2026-09-03T07:06:13+00:00'),
  ('3736064a-a4c0-59ab-804c-cb5f4e23104c', 'fdba6d53-190a-5c89-b44b-0a9b6a32fb0b', 'working', 1, 15, 13.75, 60, FALSE, '2026-09-03T07:08:38+00:00'),
  ('f0cb897f-583a-57c1-863c-a96c4be644f7', 'fdba6d53-190a-5c89-b44b-0a9b6a32fb0b', 'working', 2, 15, 13.75, 90, FALSE, '2026-09-03T07:11:33+00:00'),
  ('03e81262-07b4-5d89-928a-267c8293f8a2', 'fdba6d53-190a-5c89-b44b-0a9b6a32fb0b', 'failure', 3, 15, 13.75, 90, FALSE, '2026-09-03T07:14:28+00:00'),
  ('b8298263-48b2-55b4-9bf9-89bdc79a25fb', '89892f81-e9b0-59b6-a463-00b298da604b', 'working', 1, 10, 42.5, 90, FALSE, '2026-09-03T07:17:08+00:00'),
  ('8182e11b-b1f3-515e-a6ed-3e7bd91a4991', '89892f81-e9b0-59b6-a463-00b298da604b', 'working', 2, 10, 42.5, 150, FALSE, '2026-09-03T07:20:48+00:00'),
  ('c6b28160-3dd6-5da0-9ebc-ab379caba942', '89892f81-e9b0-59b6-a463-00b298da604b', 'dropset', 3, 13, 35.0, 150, FALSE, '2026-09-03T07:24:37+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('84b960a7-6ce6-50bb-b773-c5d177af6190', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-09-05T06:01:00+00:00', '2026-09-05T06:48:09+00:00', 2829, 13735.0, FALSE, 84.0, 'gym', 110);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('33a785a8-f8d7-5a58-830d-035cd6b11eea', '84b960a7-6ce6-50bb-b773-c5d177af6190', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('bdb1eda4-c958-5c70-877a-69dc8ef4cff8', '84b960a7-6ce6-50bb-b773-c5d177af6190', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('401e6760-a21b-53c8-a910-f1b8769e8daa', '84b960a7-6ce6-50bb-b773-c5d177af6190', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('4439c5b9-8596-5ea8-8e99-7ae3e78452dc', '84b960a7-6ce6-50bb-b773-c5d177af6190', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('91ffeb44-2e0d-5d1f-a267-4220e4cf982e', '33a785a8-f8d7-5a58-830d-035cd6b11eea', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-09-05T06:07:49+00:00'),
  ('9b8fccbf-2d81-5076-8800-14dc531a73be', '33a785a8-f8d7-5a58-830d-035cd6b11eea', 'warmup', 2, 5, 125.0, NULL, FALSE, '2026-09-05T06:09:29+00:00'),
  ('f79ea3f0-d96e-533c-b0b9-32bb275c6bc0', '33a785a8-f8d7-5a58-830d-035cd6b11eea', 'working', 3, 5, 165.0, 60, FALSE, '2026-09-05T06:11:24+00:00'),
  ('92be60be-d395-5d8f-a815-d21ebb317fef', '33a785a8-f8d7-5a58-830d-035cd6b11eea', 'working', 4, 5, 165.0, 150, FALSE, '2026-09-05T06:14:49+00:00'),
  ('acf8f067-f2f4-54b0-b12e-1312dfbbb51f', '33a785a8-f8d7-5a58-830d-035cd6b11eea', 'working', 5, 5, 165.0, 120, FALSE, '2026-09-05T06:17:44+00:00'),
  ('672336c2-dea3-5095-a02f-74538b44a7d1', 'bdb1eda4-c958-5c70-877a-69dc8ef4cff8', 'working', 1, 8, 140.0, 90, FALSE, '2026-09-05T06:20:18+00:00'),
  ('27589cd1-9db3-5796-adad-9c9b32277679', 'bdb1eda4-c958-5c70-877a-69dc8ef4cff8', 'working', 2, 8, 140.0, 120, FALSE, '2026-09-05T06:23:22+00:00'),
  ('05c90057-923c-5759-a433-95bab8870695', 'bdb1eda4-c958-5c70-877a-69dc8ef4cff8', 'working', 3, 7, 140.0, 60, FALSE, '2026-09-05T06:25:23+00:00'),
  ('01ceb446-3159-5199-86fe-f28555511ae1', '401e6760-a21b-53c8-a910-f1b8769e8daa', 'working', 1, 8, 115.0, 90, FALSE, '2026-09-05T06:27:57+00:00'),
  ('a86712e2-3ce2-5a53-bca7-266d2bb083a9', '401e6760-a21b-53c8-a910-f1b8769e8daa', 'working', 2, 8, 115.0, 120, FALSE, '2026-09-05T06:31:01+00:00'),
  ('f1138777-58c6-5b29-a742-1aeb72fa44eb', '401e6760-a21b-53c8-a910-f1b8769e8daa', 'failure', 3, 8, 115.0, 90, FALSE, '2026-09-05T06:33:35+00:00'),
  ('f13580c6-6f06-57ab-8668-7a25921925be', '4439c5b9-8596-5ea8-8e99-7ae3e78452dc', 'working', 1, 12, 110.0, 150, FALSE, '2026-09-05T06:37:21+00:00'),
  ('58a8543d-ce3f-5ce3-ac66-f5bb6afc341b', '4439c5b9-8596-5ea8-8e99-7ae3e78452dc', 'working', 2, 12, 110.0, 60, FALSE, '2026-09-05T06:39:37+00:00'),
  ('58cb75c7-af37-5294-a181-bf2a2fbaaa53', '4439c5b9-8596-5ea8-8e99-7ae3e78452dc', 'working', 3, 12, 110.0, 90, FALSE, '2026-09-05T06:42:23+00:00'),
  ('53bfb5f1-c4b6-58ec-9945-b3a403ad8982', '4439c5b9-8596-5ea8-8e99-7ae3e78452dc', 'working', 4, 12, 110.0, 90, FALSE, '2026-09-05T06:45:09+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('380662b1-6c9a-5f69-9ab1-1038fdd84486', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-09-08T06:20:00+00:00', '2026-09-08T07:23:34+00:00', 3814, 12472.5, FALSE, 84.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('fe6c872f-ab27-5fdf-88e8-a2d3b2708488', '380662b1-6c9a-5f69-9ab1-1038fdd84486', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('746d7c55-cfde-590f-9cbe-0454d37443de', '380662b1-6c9a-5f69-9ab1-1038fdd84486', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('2537c82d-ed91-5740-a49a-a417d00768ab', '380662b1-6c9a-5f69-9ab1-1038fdd84486', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('3eea378a-aed0-5ce0-90d3-60b99dd11f17', '380662b1-6c9a-5f69-9ab1-1038fdd84486', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('2bf6a1c6-25bd-5c6c-a7ad-5c8fb3424a86', '380662b1-6c9a-5f69-9ab1-1038fdd84486', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a1a416a0-5e3f-5263-9c1a-f67deadce3bc', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-09-08T06:26:49+00:00'),
  ('90f3f8f9-e7e5-5f12-a82e-f5914965677f', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'warmup', 2, 5, 107.5, NULL, FALSE, '2026-09-08T06:28:29+00:00'),
  ('dca5e3f9-b5a4-5f50-87f9-4128c429f90f', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'working', 3, 5, 142.5, 150, FALSE, '2026-09-08T06:31:54+00:00'),
  ('b52152af-cd3f-508f-8cce-c1bfc5c511ef', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'working', 4, 5, 142.5, 90, FALSE, '2026-09-08T06:34:19+00:00'),
  ('e219b048-b7d5-5107-b472-a29061feb5da', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'working', 5, 5, 142.5, 120, FALSE, '2026-09-08T06:37:14+00:00'),
  ('c37eef4b-c6f2-5cce-b8cb-df90e712f949', 'fe6c872f-ab27-5fdf-88e8-a2d3b2708488', 'working', 6, 5, 142.5, 90, FALSE, '2026-09-08T06:39:39+00:00'),
  ('fe99360d-a91d-530d-82e0-18a6185fe8ee', '746d7c55-cfde-590f-9cbe-0454d37443de', 'working', 1, 8, 107.5, 90, FALSE, '2026-09-08T06:42:13+00:00'),
  ('60959bbf-696d-5d52-892e-d778cde65d74', '746d7c55-cfde-590f-9cbe-0454d37443de', 'working', 2, 8, 107.5, 120, FALSE, '2026-09-08T06:45:17+00:00'),
  ('19b7f020-7bf2-5249-8eef-bf38f134243f', '746d7c55-cfde-590f-9cbe-0454d37443de', 'working', 3, 8, 107.5, 120, FALSE, '2026-09-08T06:48:21+00:00'),
  ('85aa59ef-7fec-54d1-8fe8-80eeae1f0561', '2537c82d-ed91-5740-a49a-a417d00768ab', 'working', 1, 10, 52.5, 150, FALSE, '2026-09-08T06:52:01+00:00'),
  ('5df1f15e-b039-5233-b0b1-96c84c3da802', '2537c82d-ed91-5740-a49a-a417d00768ab', 'working', 2, 10, 52.5, 90, FALSE, '2026-09-08T06:54:41+00:00'),
  ('21ec2aa3-4289-5138-9e97-d3b56b5da727', '2537c82d-ed91-5740-a49a-a417d00768ab', 'working', 3, 9, 52.5, 60, FALSE, '2026-09-08T06:56:48+00:00'),
  ('02d2e58a-5171-57ad-9754-835eeb1ccb7d', '3eea378a-aed0-5ce0-90d3-60b99dd11f17', 'working', 1, 12, 115.0, 150, FALSE, '2026-09-08T07:00:34+00:00'),
  ('6052e36a-f84f-5708-a74e-3ed7446b6840', '3eea378a-aed0-5ce0-90d3-60b99dd11f17', 'working', 2, 12, 115.0, 90, FALSE, '2026-09-08T07:03:20+00:00'),
  ('592c18f8-b27f-52fe-b8bd-02c6ba3ba791', '3eea378a-aed0-5ce0-90d3-60b99dd11f17', 'working', 3, 12, 115.0, 150, FALSE, '2026-09-08T07:07:06+00:00'),
  ('dc1ff31f-2064-5341-a803-bd86c0adef10', '3eea378a-aed0-5ce0-90d3-60b99dd11f17', 'failure', 4, 12, 115.0, 150, FALSE, '2026-09-08T07:10:52+00:00'),
  ('156f0f53-9383-5247-9eac-c879b4b93745', '2bf6a1c6-25bd-5c6c-a7ad-5c8fb3424a86', 'working', 1, 14, 0.0, 150, FALSE, '2026-09-08T07:14:44+00:00'),
  ('4d16d70b-6c79-5ce7-95a6-f0114fea65e3', '2bf6a1c6-25bd-5c6c-a7ad-5c8fb3424a86', 'working', 2, 13, 0.0, 60, FALSE, '2026-09-08T07:17:03+00:00'),
  ('c9ceabf0-0dc3-5260-890e-243750a55e2c', '2bf6a1c6-25bd-5c6c-a7ad-5c8fb3424a86', 'dropset', 3, 17, 0.0, 120, FALSE, '2026-09-08T07:20:34+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('b13abdf6-c016-5576-864d-c18560034d14', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-09-10T06:18:00+00:00', '2026-09-10T07:21:07+00:00', 3787, 4325.0, FALSE, 84.0, 'gym', 166);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'b13abdf6-c016-5576-864d-c18560034d14', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('13ede902-3b1c-5844-8f07-b44c791d1ed3', 'b13abdf6-c016-5576-864d-c18560034d14', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('aa5fc92e-6f2e-535b-83cb-c3f3237f60c6', 'b13abdf6-c016-5576-864d-c18560034d14', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('03f032ea-a3f2-5d0f-a77d-84181e212801', 'b13abdf6-c016-5576-864d-c18560034d14', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('eb13ee96-5a17-564e-8d31-98a2a959d8ac', 'b13abdf6-c016-5576-864d-c18560034d14', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('77b28ae6-c862-5ceb-963a-52552b71f825', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-09-10T06:24:49+00:00'),
  ('c186139d-ba68-5aa3-9305-94f4d1bd9a54', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'warmup', 2, 5, 47.5, NULL, FALSE, '2026-09-10T06:26:29+00:00'),
  ('3783b891-f402-56d4-90f8-18f309ea3840', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'working', 3, 5, 62.5, 150, FALSE, '2026-09-10T06:29:54+00:00'),
  ('bb91c81d-1674-5e9a-93a3-b931410803b5', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'working', 4, 5, 62.5, 150, FALSE, '2026-09-10T06:33:19+00:00'),
  ('f625f573-e446-549b-99fd-96a04ab50971', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'working', 5, 5, 62.5, 150, FALSE, '2026-09-10T06:36:44+00:00'),
  ('efb7fc9e-ebec-57a1-8714-a9fc5a634634', '33a833fd-6c0d-5fe1-af9f-22909e6daf81', 'working', 6, 3, 62.5, 120, FALSE, '2026-09-10T06:39:33+00:00'),
  ('a6e07d7f-d07a-5413-b343-a8372b24d34b', '13ede902-3b1c-5844-8f07-b44c791d1ed3', 'working', 1, 10, 0.0, 120, FALSE, '2026-09-10T06:42:43+00:00'),
  ('eae95488-683d-5225-8495-e03366bb066f', '13ede902-3b1c-5844-8f07-b44c791d1ed3', 'working', 2, 10, 0.0, 90, FALSE, '2026-09-10T06:45:23+00:00'),
  ('5221db3e-3b09-5891-9772-c8aaf3557407', '13ede902-3b1c-5844-8f07-b44c791d1ed3', 'working', 3, 12, 0.0, 120, FALSE, '2026-09-10T06:48:39+00:00'),
  ('525f629c-c68c-51ab-9197-76567372f7b2', '13ede902-3b1c-5844-8f07-b44c791d1ed3', 'working', 4, 12, 0.0, 90, FALSE, '2026-09-10T06:51:25+00:00'),
  ('08364133-7ff9-56cc-aead-c034e51c9a16', 'aa5fc92e-6f2e-535b-83cb-c3f3237f60c6', 'working', 1, 10, 44.0, 120, FALSE, '2026-09-10T06:54:35+00:00'),
  ('05b70f75-acf9-5e3a-a6c1-4a5194617e7b', 'aa5fc92e-6f2e-535b-83cb-c3f3237f60c6', 'working', 2, 10, 44.0, 90, FALSE, '2026-09-10T06:57:15+00:00'),
  ('6d396602-2c0b-52d9-9ea7-d4069c39fec5', 'aa5fc92e-6f2e-535b-83cb-c3f3237f60c6', 'working', 3, 10, 44.0, 150, FALSE, '2026-09-10T07:00:55+00:00'),
  ('415d7572-e7bd-5666-9f29-25f8dd8c0eb0', '03f032ea-a3f2-5d0f-a77d-84181e212801', 'working', 1, 15, 13.75, 90, FALSE, '2026-09-10T07:03:50+00:00'),
  ('1e78a871-dbbe-5a1e-b649-313ba25c8420', '03f032ea-a3f2-5d0f-a77d-84181e212801', 'working', 2, 15, 13.75, 90, FALSE, '2026-09-10T07:06:45+00:00'),
  ('a830d5e8-b4a2-5fd3-948a-5515f8350efe', '03f032ea-a3f2-5d0f-a77d-84181e212801', 'working', 3, 14, 13.75, 90, FALSE, '2026-09-10T07:09:37+00:00'),
  ('9af33003-0f33-5735-a37a-5d31026c069b', 'eb13ee96-5a17-564e-8d31-98a2a959d8ac', 'working', 1, 10, 42.5, 60, FALSE, '2026-09-10T07:11:47+00:00'),
  ('9339f0fc-cb46-51cb-885d-dc4c3ebc4f0e', 'eb13ee96-5a17-564e-8d31-98a2a959d8ac', 'working', 2, 10, 42.5, 90, FALSE, '2026-09-10T07:14:27+00:00'),
  ('292e78e4-194b-5180-9467-3bf1147f71a6', 'eb13ee96-5a17-564e-8d31-98a2a959d8ac', 'working', 3, 10, 42.5, 150, FALSE, '2026-09-10T07:18:07+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('e71abb3e-1e3a-5d70-8842-45f8d267a436', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-09-15T06:37:00+00:00', '2026-09-15T07:37:10+00:00', 3610, 12410.0, FALSE, 84.0, 'gym', 167);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'e71abb3e-1e3a-5d70-8842-45f8d267a436', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('0bb8570e-e47d-53cc-b412-2adf745a02d5', 'e71abb3e-1e3a-5d70-8842-45f8d267a436', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('855ee77f-6d73-5095-8050-c7ecbbe66166', 'e71abb3e-1e3a-5d70-8842-45f8d267a436', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('fd668fb9-85ef-5639-bf1a-32192d442f98', 'e71abb3e-1e3a-5d70-8842-45f8d267a436', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('7e4ba2ab-1f25-5ada-899c-6dd071ddfa4e', 'e71abb3e-1e3a-5d70-8842-45f8d267a436', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6693dec0-56ab-5191-8df6-8c8c167c8740', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-09-15T06:43:49+00:00'),
  ('e666cee2-6dd0-538c-af74-bb196897dead', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'warmup', 2, 5, 107.5, NULL, FALSE, '2026-09-15T06:45:29+00:00'),
  ('f7d8d524-3552-5621-a14e-2afe168492b4', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'working', 3, 5, 142.5, 120, FALSE, '2026-09-15T06:48:24+00:00'),
  ('da339d99-8064-5e9f-8ff3-a4cc4e3c6dd0', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'working', 4, 5, 142.5, 120, FALSE, '2026-09-15T06:51:19+00:00'),
  ('c7748fcc-0d5e-5b94-b083-d04dcd5f7d9a', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'working', 5, 5, 142.5, 60, FALSE, '2026-09-15T06:53:14+00:00'),
  ('096d9a86-9551-58d6-885e-792535fd8f39', 'e58cdb0c-0b55-500d-b4a1-5575b2f8d84a', 'working', 6, 4, 142.5, 90, FALSE, '2026-09-15T06:55:36+00:00'),
  ('48fda4af-b004-5d96-b017-2fb0a7b0bd69', '0bb8570e-e47d-53cc-b412-2adf745a02d5', 'working', 1, 8, 107.5, 150, FALSE, '2026-09-15T06:59:10+00:00'),
  ('04f61a83-3091-590c-ab79-5f73629cf3a5', '0bb8570e-e47d-53cc-b412-2adf745a02d5', 'working', 2, 8, 107.5, 150, FALSE, '2026-09-15T07:02:44+00:00'),
  ('2aafec79-d038-52c1-a045-a11139c93f8e', '0bb8570e-e47d-53cc-b412-2adf745a02d5', 'failure', 3, 8, 107.5, 90, FALSE, '2026-09-15T07:05:18+00:00'),
  ('90a5d06f-a952-550f-9588-451c9714eda9', '855ee77f-6d73-5095-8050-c7ecbbe66166', 'working', 1, 10, 52.5, 90, FALSE, '2026-09-15T07:07:58+00:00'),
  ('be16abea-57a9-539e-b165-c2879fefcf8a', '855ee77f-6d73-5095-8050-c7ecbbe66166', 'working', 2, 10, 52.5, 90, FALSE, '2026-09-15T07:10:38+00:00'),
  ('13fff784-21f6-5d46-b857-7e0cdcaff8ca', '855ee77f-6d73-5095-8050-c7ecbbe66166', 'dropset', 3, 13, 42.5, 60, FALSE, '2026-09-15T07:12:57+00:00'),
  ('634996ad-f036-5d81-9813-7d8dbbddb190', 'fd668fb9-85ef-5639-bf1a-32192d442f98', 'working', 1, 12, 115.0, 90, FALSE, '2026-09-15T07:15:43+00:00'),
  ('abba3507-d350-5c00-bf27-73f71660cd34', 'fd668fb9-85ef-5639-bf1a-32192d442f98', 'working', 2, 12, 115.0, 150, FALSE, '2026-09-15T07:19:29+00:00'),
  ('05de9228-56d7-53fe-ae3c-3bc62e02101e', 'fd668fb9-85ef-5639-bf1a-32192d442f98', 'working', 3, 12, 115.0, 90, FALSE, '2026-09-15T07:22:15+00:00'),
  ('11f5c4d6-23dd-5208-8596-4ddf6f64d132', 'fd668fb9-85ef-5639-bf1a-32192d442f98', 'working', 4, 12, 115.0, 60, FALSE, '2026-09-15T07:24:31+00:00'),
  ('8ac8f8bd-76ec-5106-aa82-61a1db10fe0f', '7e4ba2ab-1f25-5ada-899c-6dd071ddfa4e', 'working', 1, 14, 0.0, 90, FALSE, '2026-09-15T07:27:23+00:00'),
  ('2e3235bd-6831-5390-bae2-42e207f3a586', '7e4ba2ab-1f25-5ada-899c-6dd071ddfa4e', 'working', 2, 14, 0.0, 90, FALSE, '2026-09-15T07:30:15+00:00'),
  ('aba37174-dc75-5212-b61f-c1350c40787a', '7e4ba2ab-1f25-5ada-899c-6dd071ddfa4e', 'working', 3, 15, 0.0, 150, FALSE, '2026-09-15T07:34:10+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('fbfd0a3f-b964-5fe1-a8a7-4817923737ef', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-09-17T06:28:00+00:00', '2026-09-17T07:25:22+00:00', 3442, 4368.75, FALSE, 84.0, 'gym', 171);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'fbfd0a3f-b964-5fe1-a8a7-4817923737ef', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('edf918a7-8bcc-560a-a2e3-91678ee7fe12', 'fbfd0a3f-b964-5fe1-a8a7-4817923737ef', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('b206b826-6a23-5967-9e8e-85a2cfe2ef06', 'fbfd0a3f-b964-5fe1-a8a7-4817923737ef', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('6d72d4d3-66ef-53bf-ab6a-3840c4caf9f0', 'fbfd0a3f-b964-5fe1-a8a7-4817923737ef', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('2c434b87-0f3b-5650-9450-280775cf1150', 'fbfd0a3f-b964-5fe1-a8a7-4817923737ef', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4ac179e9-b11a-5bc0-a085-1390f37c398a', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'warmup', 1, 8, 30.0, NULL, FALSE, '2026-09-17T06:34:49+00:00'),
  ('5397cc9d-dad9-594a-a99b-758871846141', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'warmup', 2, 5, 47.5, NULL, FALSE, '2026-09-17T06:36:29+00:00'),
  ('24e48573-07a5-5c46-85bf-f92626f89e5e', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'working', 3, 5, 62.5, 150, FALSE, '2026-09-17T06:39:54+00:00'),
  ('123285c8-0b45-5c15-888d-3b0a936a89dd', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'working', 4, 5, 62.5, 90, FALSE, '2026-09-17T06:42:19+00:00'),
  ('43b373c6-c109-5861-a19d-33dfef91882f', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'working', 5, 5, 62.5, 120, FALSE, '2026-09-17T06:45:14+00:00'),
  ('a6a88455-d40b-5c32-9b53-74ea5347c9f8', '43b7b61f-df62-5f62-89a3-b1b43cec6e66', 'working', 6, 3, 62.5, 60, FALSE, '2026-09-17T06:47:03+00:00'),
  ('d6e7366c-c1da-5d87-8b17-d263530623bd', 'edf918a7-8bcc-560a-a2e3-91678ee7fe12', 'working', 1, 11, 0.0, 150, FALSE, '2026-09-17T06:50:46+00:00'),
  ('84d32d86-decc-531f-8480-d5853a07839b', 'edf918a7-8bcc-560a-a2e3-91678ee7fe12', 'working', 2, 10, 0.0, 60, FALSE, '2026-09-17T06:52:56+00:00'),
  ('06986514-82df-5799-b9cd-e2f0bad04a77', 'edf918a7-8bcc-560a-a2e3-91678ee7fe12', 'working', 3, 12, 0.0, 60, FALSE, '2026-09-17T06:55:12+00:00'),
  ('dab95ca4-b255-5ba0-9d6e-7a4c4439d67f', 'edf918a7-8bcc-560a-a2e3-91678ee7fe12', 'working', 4, 12, 0.0, 90, FALSE, '2026-09-17T06:57:58+00:00'),
  ('1be6c160-15c5-54c3-be28-7301338519d4', 'b206b826-6a23-5967-9e8e-85a2cfe2ef06', 'working', 1, 10, 44.0, 60, FALSE, '2026-09-17T07:00:08+00:00'),
  ('edcf02d6-aae2-5576-84d5-5a9da318a112', 'b206b826-6a23-5967-9e8e-85a2cfe2ef06', 'working', 2, 10, 44.0, 120, FALSE, '2026-09-17T07:03:18+00:00'),
  ('4dddedab-549f-55eb-8f62-d8227d894638', 'b206b826-6a23-5967-9e8e-85a2cfe2ef06', 'failure', 3, 10, 44.0, 90, FALSE, '2026-09-17T07:05:58+00:00'),
  ('aedcf086-89ce-54c3-8176-396e5e4542e3', '6d72d4d3-66ef-53bf-ab6a-3840c4caf9f0', 'working', 1, 15, 13.75, 60, FALSE, '2026-09-17T07:08:23+00:00'),
  ('e3716898-e60e-59c2-a97f-d6beea0cbcfe', '6d72d4d3-66ef-53bf-ab6a-3840c4caf9f0', 'working', 2, 15, 13.75, 90, FALSE, '2026-09-17T07:11:18+00:00'),
  ('71659b29-832d-55de-99a3-402d0192f553', '6d72d4d3-66ef-53bf-ab6a-3840c4caf9f0', 'failure', 3, 15, 13.75, 90, FALSE, '2026-09-17T07:14:13+00:00'),
  ('4c6736b6-bb5a-5303-a75d-94247fce43ff', '2c434b87-0f3b-5650-9450-280775cf1150', 'working', 1, 10, 42.5, 90, FALSE, '2026-09-17T07:16:53+00:00'),
  ('d4a76c22-a74c-5b8d-b197-109cc3d14973', '2c434b87-0f3b-5650-9450-280775cf1150', 'working', 2, 10, 42.5, 60, FALSE, '2026-09-17T07:19:03+00:00'),
  ('0107a49b-77e5-50a1-b554-64c9e6f9a18f', '2c434b87-0f3b-5650-9450-280775cf1150', 'dropset', 3, 13, 35.0, 120, FALSE, '2026-09-17T07:22:22+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('b25eacca-4a58-53eb-a9e7-4cea4a5e6834', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-09-19T06:22:00+00:00', '2026-09-19T07:11:24+00:00', 2964, 13380.0, FALSE, 84.0, 'gym', 105);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'b25eacca-4a58-53eb-a9e7-4cea4a5e6834', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('16e38bfe-13c5-5fb6-9cce-1675708ffeba', 'b25eacca-4a58-53eb-a9e7-4cea4a5e6834', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('04a5183d-2eb8-5399-8ce3-48223d4b737f', 'b25eacca-4a58-53eb-a9e7-4cea4a5e6834', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('4e9a8b14-a3fa-56b1-a753-108b5ddcb5bc', 'b25eacca-4a58-53eb-a9e7-4cea4a5e6834', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('37b5cc64-8c51-5ac2-ad7d-70fe2d89c7f6', '43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-09-19T06:28:49+00:00'),
  ('2896e6bc-5d37-5266-a7d3-6e349bd1d1a6', '43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'warmup', 2, 5, 125.0, NULL, FALSE, '2026-09-19T06:30:29+00:00'),
  ('01712d8b-204c-5ff1-98d2-7fb6f0aa6feb', '43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'working', 3, 5, 165.0, 90, FALSE, '2026-09-19T06:32:54+00:00'),
  ('a314b72a-bbae-5207-8782-1ec247350912', '43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'working', 4, 5, 165.0, 90, FALSE, '2026-09-19T06:35:19+00:00'),
  ('010c4234-0f7a-5bf7-80f4-63784a73aab2', '43a69d0f-a8f1-51e3-a8cc-291ece189a5c', 'working', 5, 3, 165.0, 150, FALSE, '2026-09-19T06:38:38+00:00'),
  ('5d4df3a4-aad3-56dd-99d1-e65caac468ab', '16e38bfe-13c5-5fb6-9cce-1675708ffeba', 'working', 1, 8, 140.0, 90, FALSE, '2026-09-19T06:41:12+00:00'),
  ('3fdb88e3-3ed7-5a1e-be4c-4d8e6c05de8a', '16e38bfe-13c5-5fb6-9cce-1675708ffeba', 'working', 2, 8, 140.0, 90, FALSE, '2026-09-19T06:43:46+00:00'),
  ('249546dd-141a-51d7-84ef-55a72890d952', '16e38bfe-13c5-5fb6-9cce-1675708ffeba', 'working', 3, 8, 140.0, 90, FALSE, '2026-09-19T06:46:20+00:00'),
  ('be0e18b0-ec75-51ab-8caa-65dfcd53955c', '04a5183d-2eb8-5399-8ce3-48223d4b737f', 'working', 1, 8, 117.5, 120, FALSE, '2026-09-19T06:49:24+00:00'),
  ('638ccc59-1308-5fd4-bc21-f9f7b0436005', '04a5183d-2eb8-5399-8ce3-48223d4b737f', 'working', 2, 8, 117.5, 150, FALSE, '2026-09-19T06:52:58+00:00'),
  ('7631a00d-6b12-5846-b47a-92e7a21f6459', '04a5183d-2eb8-5399-8ce3-48223d4b737f', 'working', 3, 6, 117.5, 90, FALSE, '2026-09-19T06:55:26+00:00'),
  ('60cd8895-a8f8-557c-bfb4-76ad1bc9c2aa', '4e9a8b14-a3fa-56b1-a753-108b5ddcb5bc', 'working', 1, 12, 115.0, 150, FALSE, '2026-09-19T06:59:12+00:00'),
  ('ba4c721a-41fa-5b54-bda6-2a0d7235b762', '4e9a8b14-a3fa-56b1-a753-108b5ddcb5bc', 'working', 2, 12, 115.0, 60, FALSE, '2026-09-19T07:01:28+00:00'),
  ('60906519-e626-5cba-97a8-143671700153', '4e9a8b14-a3fa-56b1-a753-108b5ddcb5bc', 'working', 3, 12, 115.0, 120, FALSE, '2026-09-19T07:04:44+00:00'),
  ('42a4033c-cc8c-5cf4-8294-0d5a0fc81c59', '4e9a8b14-a3fa-56b1-a753-108b5ddcb5bc', 'working', 4, 10, 115.0, 150, FALSE, '2026-09-19T07:08:24+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('47bd78a3-9031-535d-9941-e3a735f5b8ca', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-09-21T06:21:00+00:00', '2026-09-21T07:24:01+00:00', 3781, 6061.0, FALSE, 84.0, 'gym', 151);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', '47bd78a3-9031-535d-9941-e3a735f5b8ca', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', '47bd78a3-9031-535d-9941-e3a735f5b8ca', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('c050255b-111b-548b-86ce-c09cd6595f91', '47bd78a3-9031-535d-9941-e3a735f5b8ca', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('03862aab-e86d-5195-ab8e-b819beef42f0', '47bd78a3-9031-535d-9941-e3a735f5b8ca', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('82176694-91a6-5254-a801-9d9248965050', '47bd78a3-9031-535d-9941-e3a735f5b8ca', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('77220e68-7163-5f3d-ad22-0ef79337e559', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-09-21T06:27:49+00:00'),
  ('ad66430c-5b84-54fb-bdc7-35f838346ab5', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'warmup', 2, 5, 72.5, NULL, FALSE, '2026-09-21T06:29:29+00:00'),
  ('cb8ee23c-610c-5b04-9999-e5b1b8af29ab', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'working', 3, 5, 97.5, 90, FALSE, '2026-09-21T06:31:54+00:00'),
  ('9893b16e-93d7-559d-9ba6-dbb6c0183c50', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'working', 4, 5, 97.5, 60, FALSE, '2026-09-21T06:33:49+00:00'),
  ('c4470e47-c1bb-5c7a-9304-94ed8bd93846', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'working', 5, 5, 97.5, 90, FALSE, '2026-09-21T06:36:14+00:00'),
  ('33066257-edfe-5d0e-9564-5f8d40eae85b', '88e29c15-3e5d-5b3d-9c43-2a5d9659fa04', 'working', 6, 4, 97.5, 150, FALSE, '2026-09-21T06:39:36+00:00'),
  ('488df7c9-16c8-5c9c-87c0-0a1d98683b82', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-09-21T06:41:25+00:00'),
  ('2db105ce-b6e4-5697-b9fe-ecb044bf3e57', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'warmup', 2, 5, 65.0, NULL, FALSE, '2026-09-21T06:43:05+00:00'),
  ('e175b74c-b2da-54ec-85ea-872f2a56ccd3', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'working', 3, 6, 87.5, 120, FALSE, '2026-09-21T06:46:03+00:00'),
  ('f571bc26-9ce9-5512-8759-2bd80f5bc72a', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'working', 4, 6, 87.5, 150, FALSE, '2026-09-21T06:49:31+00:00'),
  ('3ba7b922-d9dd-5b85-aec7-0c7c5ae82736', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'working', 5, 6, 87.5, 60, FALSE, '2026-09-21T06:51:29+00:00'),
  ('b79844e5-d1be-5f47-84fa-1a3960e1c3f6', '8f38c52a-a94c-5ee0-b0ac-924d6fa371f0', 'working', 6, 5, 87.5, 90, FALSE, '2026-09-21T06:53:54+00:00'),
  ('5e9d7863-e93b-5ba0-b6c8-e803ae927528', 'c050255b-111b-548b-86ce-c09cd6595f91', 'working', 1, 8, 44.0, 90, FALSE, '2026-09-21T06:56:28+00:00'),
  ('b2bb7c5e-81bf-5a08-9493-96ea374b542d', 'c050255b-111b-548b-86ce-c09cd6595f91', 'working', 2, 8, 44.0, 90, FALSE, '2026-09-21T06:59:02+00:00'),
  ('c1b5c041-61c8-56d6-a58a-ba35d40aff62', 'c050255b-111b-548b-86ce-c09cd6595f91', 'failure', 3, 8, 44.0, 60, FALSE, '2026-09-21T07:01:06+00:00'),
  ('22046fc9-5a2e-543b-97e0-49fa04fbaa43', '03862aab-e86d-5195-ab8e-b819beef42f0', 'working', 1, 12, 0.0, 60, FALSE, '2026-09-21T07:03:22+00:00'),
  ('ad639871-a212-5022-ac6b-7af1c2225179', '03862aab-e86d-5195-ab8e-b819beef42f0', 'working', 2, 14, 0.0, 60, FALSE, '2026-09-21T07:05:44+00:00'),
  ('8462bb46-d007-5a99-8d67-f7eeb96dcd2a', '03862aab-e86d-5195-ab8e-b819beef42f0', 'working', 3, 14, 0.0, 120, FALSE, '2026-09-21T07:09:06+00:00'),
  ('c2496497-ffa4-57f3-84da-a4a4a2acd5dc', '03862aab-e86d-5195-ab8e-b819beef42f0', 'failure', 4, 12, 0.0, 120, FALSE, '2026-09-21T07:12:22+00:00'),
  ('6de7c3fd-82c1-532e-a9f6-634d6a30515d', '82176694-91a6-5254-a801-9d9248965050', 'working', 1, 10, 37.5, 90, FALSE, '2026-09-21T07:15:02+00:00'),
  ('1e583d89-d302-5e50-ba24-48779be810d4', '82176694-91a6-5254-a801-9d9248965050', 'working', 2, 10, 37.5, 60, FALSE, '2026-09-21T07:17:12+00:00'),
  ('973ab5c0-2df4-5a1b-8adf-bb4107d5d650', '82176694-91a6-5254-a801-9d9248965050', 'dropset', 3, 13, 30.0, 150, FALSE, '2026-09-21T07:21:01+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('b678ba95-5ead-5c5b-868f-e928b287b0f5', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-09-24T06:29:00+00:00', '2026-09-24T07:28:52+00:00', 3592, 4615.0, FALSE, 84.0, 'gym', 181);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8c4a3141-3282-5b64-a735-a1d35c21d154', 'b678ba95-5ead-5c5b-868f-e928b287b0f5', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('b9c1eec4-8b78-572a-9c01-72ffc84a5414', 'b678ba95-5ead-5c5b-868f-e928b287b0f5', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('4dcecdd5-1604-55cf-b3f5-ebcbc2a1a1ad', 'b678ba95-5ead-5c5b-868f-e928b287b0f5', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('1dbadc16-d532-533a-8f44-3d3207e2c9df', 'b678ba95-5ead-5c5b-868f-e928b287b0f5', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('8ca2ba88-af84-5a9d-a747-2a68b0754043', 'b678ba95-5ead-5c5b-868f-e928b287b0f5', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5f41043a-575a-5c1d-9f19-a65522181e90', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'warmup', 1, 8, 32.5, NULL, FALSE, '2026-09-24T06:35:49+00:00'),
  ('6de0db20-7ea5-58de-8cc6-eda49b31d4f3', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'warmup', 2, 5, 50.0, NULL, FALSE, '2026-09-24T06:37:29+00:00'),
  ('59409262-d23c-53fc-b303-6532da2bc70f', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'working', 3, 5, 65.0, 90, FALSE, '2026-09-24T06:39:54+00:00'),
  ('e4a682f3-e4bc-57ec-a191-b6a78b7d498b', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'working', 4, 5, 65.0, 60, FALSE, '2026-09-24T06:41:49+00:00'),
  ('ed63e9a5-796a-5f91-8cf1-9c6cb4edaeea', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'working', 5, 5, 65.0, 150, FALSE, '2026-09-24T06:45:14+00:00'),
  ('a185c4cf-7144-591f-b985-1b374c1e48ad', '8c4a3141-3282-5b64-a735-a1d35c21d154', 'working', 6, 5, 65.0, 60, FALSE, '2026-09-24T06:47:09+00:00'),
  ('5a6889dc-7b10-5acf-8c41-991e823ae69b', 'b9c1eec4-8b78-572a-9c01-72ffc84a5414', 'working', 1, 12, 0.0, 90, FALSE, '2026-09-24T06:49:55+00:00'),
  ('dc784c5f-2ba3-53ca-aade-f94076598b13', 'b9c1eec4-8b78-572a-9c01-72ffc84a5414', 'working', 2, 13, 0.0, 90, FALSE, '2026-09-24T06:52:44+00:00'),
  ('e8f27292-a1ac-55ed-a3f9-821951c6260e', 'b9c1eec4-8b78-572a-9c01-72ffc84a5414', 'working', 3, 13, 0.0, 90, FALSE, '2026-09-24T06:55:33+00:00'),
  ('ab1863ea-16b7-572c-9c40-bd9d80b7a363', 'b9c1eec4-8b78-572a-9c01-72ffc84a5414', 'dropset', 4, 16, 0.0, 120, FALSE, '2026-09-24T06:59:01+00:00'),
  ('c04a23ec-c552-573b-b7f8-4ff12fc2c520', '4dcecdd5-1604-55cf-b3f5-ebcbc2a1a1ad', 'working', 1, 10, 44.0, 60, FALSE, '2026-09-24T07:01:11+00:00'),
  ('7ecf8c5b-c2fb-5ce0-813e-afa82b6fc922', '4dcecdd5-1604-55cf-b3f5-ebcbc2a1a1ad', 'working', 2, 10, 44.0, 90, FALSE, '2026-09-24T07:03:51+00:00'),
  ('7f95bb71-e2dc-5298-b50a-9236741152ff', '4dcecdd5-1604-55cf-b3f5-ebcbc2a1a1ad', 'working', 3, 10, 44.0, 90, FALSE, '2026-09-24T07:06:31+00:00'),
  ('b22ccf07-d4c0-5476-9ee7-5574b869e9d7', '1dbadc16-d532-533a-8f44-3d3207e2c9df', 'working', 1, 15, 15.0, 120, FALSE, '2026-09-24T07:09:56+00:00'),
  ('80691601-1362-53ae-8333-591e911af031', '1dbadc16-d532-533a-8f44-3d3207e2c9df', 'working', 2, 15, 15.0, 150, FALSE, '2026-09-24T07:13:51+00:00'),
  ('bf19012c-550e-54f2-9105-ce81df0a6537', '1dbadc16-d532-533a-8f44-3d3207e2c9df', 'working', 3, 15, 15.0, 150, FALSE, '2026-09-24T07:17:46+00:00'),
  ('7524c47c-f70d-503d-b6de-93550df82ddd', '8ca2ba88-af84-5a9d-a747-2a68b0754043', 'working', 1, 10, 45.0, 90, FALSE, '2026-09-24T07:20:26+00:00'),
  ('055eeca4-be2a-51fe-965d-7366ae3d02b1', '8ca2ba88-af84-5a9d-a747-2a68b0754043', 'working', 2, 10, 45.0, 90, FALSE, '2026-09-24T07:23:06+00:00'),
  ('33c8214f-877f-5880-87c0-ab0abbe119ad', '8ca2ba88-af84-5a9d-a747-2a68b0754043', 'dropset', 3, 12, 35.0, 90, FALSE, '2026-09-24T07:25:52+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('db1290a3-92f0-5bea-a327-fc8b662a9005', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-09-26T06:39:00+00:00', '2026-09-26T07:25:27+00:00', 2787, 14225.0, FALSE, 84.0, 'gym', 116);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('501cd246-42a2-514c-aaae-9b3dff37ff76', 'db1290a3-92f0-5bea-a327-fc8b662a9005', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('edafddd5-6481-5a0f-b8f7-ff2a0866b613', 'db1290a3-92f0-5bea-a327-fc8b662a9005', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('93a5f549-36b8-5ca2-94ad-a4bac2b21931', 'db1290a3-92f0-5bea-a327-fc8b662a9005', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('6dfb74f6-83a3-5a8e-828e-7c13c1f79231', 'db1290a3-92f0-5bea-a327-fc8b662a9005', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6ccb6c66-0b30-5519-ace1-e0760e9fe21f', '501cd246-42a2-514c-aaae-9b3dff37ff76', 'warmup', 1, 8, 80.0, NULL, FALSE, '2026-09-26T06:45:49+00:00'),
  ('9f0ba62b-601d-52a1-bce7-bf6d2fac2637', '501cd246-42a2-514c-aaae-9b3dff37ff76', 'warmup', 2, 5, 125.0, NULL, FALSE, '2026-09-26T06:47:29+00:00'),
  ('7b79b597-0987-5eaa-8e85-a4ff33bb2986', '501cd246-42a2-514c-aaae-9b3dff37ff76', 'working', 3, 5, 165.0, 60, FALSE, '2026-09-26T06:49:24+00:00'),
  ('370a7c26-9ddc-5ff8-b8db-ca5fa6a70261', '501cd246-42a2-514c-aaae-9b3dff37ff76', 'working', 4, 5, 165.0, 90, FALSE, '2026-09-26T06:51:49+00:00'),
  ('0bd9d590-e93a-5f0c-b85c-9597a1262fca', '501cd246-42a2-514c-aaae-9b3dff37ff76', 'working', 5, 5, 165.0, 90, FALSE, '2026-09-26T06:54:14+00:00'),
  ('cb65646a-690e-573c-84a7-47bc799d9c4c', 'edafddd5-6481-5a0f-b8f7-ff2a0866b613', 'working', 1, 8, 145.0, 150, FALSE, '2026-09-26T06:57:48+00:00'),
  ('db47f1ed-3385-5da8-9d5d-2359efcc259d', 'edafddd5-6481-5a0f-b8f7-ff2a0866b613', 'working', 2, 8, 145.0, 120, FALSE, '2026-09-26T07:00:52+00:00'),
  ('4b01c906-41aa-5a45-ac23-5553d808aff2', 'edafddd5-6481-5a0f-b8f7-ff2a0866b613', 'working', 3, 7, 145.0, 150, FALSE, '2026-09-26T07:04:23+00:00'),
  ('6cf357e6-b85b-573b-9b9f-a11d39f64470', '93a5f549-36b8-5ca2-94ad-a4bac2b21931', 'working', 1, 8, 117.5, 120, FALSE, '2026-09-26T07:07:27+00:00'),
  ('881376d0-63e0-56b3-9684-1a1bd49dd7c3', '93a5f549-36b8-5ca2-94ad-a4bac2b21931', 'working', 2, 8, 117.5, 90, FALSE, '2026-09-26T07:10:01+00:00'),
  ('1b39bd76-f7a0-5aff-85a9-fe2653ca2ed4', '93a5f549-36b8-5ca2-94ad-a4bac2b21931', 'dropset', 3, 11, 95.0, 60, FALSE, '2026-09-26T07:12:14+00:00'),
  ('2d1c9868-a81b-5652-b82c-a4b0492253f9', '6dfb74f6-83a3-5a8e-828e-7c13c1f79231', 'working', 1, 12, 115.0, 60, FALSE, '2026-09-26T07:14:30+00:00'),
  ('eac5920b-a75d-5477-a220-6cd55d68012b', '6dfb74f6-83a3-5a8e-828e-7c13c1f79231', 'working', 2, 12, 115.0, 60, FALSE, '2026-09-26T07:16:46+00:00'),
  ('d45d4e0f-44f6-5be4-bd66-da3bb27249f9', '6dfb74f6-83a3-5a8e-828e-7c13c1f79231', 'working', 3, 12, 115.0, 60, FALSE, '2026-09-26T07:19:02+00:00'),
  ('18f661fa-0d50-5a66-a043-7e1c4d2f03ed', '6dfb74f6-83a3-5a8e-828e-7c13c1f79231', 'dropset', 4, 15, 90.0, 120, FALSE, '2026-09-26T07:22:27+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('17b81020-8b9d-5109-91ac-a4baa10afe7d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-09-28T06:22:00+00:00', '2026-09-28T07:25:49+00:00', 3829, 5202.0, FALSE, 84.0, 'gym', 147);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e4629d92-4699-5e18-8a81-0cdc73d97068', '17b81020-8b9d-5109-91ac-a4baa10afe7d', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('498f1c5b-d118-534a-b473-511d164aaacb', '17b81020-8b9d-5109-91ac-a4baa10afe7d', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('f44bca1f-6a1c-5d15-aa92-f94e6bd9fe4c', '17b81020-8b9d-5109-91ac-a4baa10afe7d', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('01e4f285-b249-5990-9bdf-997b7377d37c', '17b81020-8b9d-5109-91ac-a4baa10afe7d', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('8e2813d7-8761-5917-add7-aa9c6c5a5de2', '17b81020-8b9d-5109-91ac-a4baa10afe7d', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('c3e7af60-a78f-5ded-a881-79c07849294c', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'warmup', 1, 8, 40.0, NULL, FALSE, '2026-09-28T06:28:49+00:00'),
  ('5caba1bf-cff7-504e-8583-cec7c1a83545', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'warmup', 2, 5, 62.5, NULL, FALSE, '2026-09-28T06:30:29+00:00'),
  ('810efa65-921e-56c4-87f9-ad889f181ce2', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'working', 3, 5, 82.5, 90, FALSE, '2026-09-28T06:32:54+00:00'),
  ('f970fa6c-3355-50c3-9d36-857bc7a968b4', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'working', 4, 5, 82.5, 120, FALSE, '2026-09-28T06:35:49+00:00'),
  ('40ae1c13-cc6e-5aed-967b-5038ad874b85', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'working', 5, 5, 82.5, 60, FALSE, '2026-09-28T06:37:44+00:00'),
  ('023f919f-8e1e-5421-bd52-5043bd6aa262', 'e4629d92-4699-5e18-8a81-0cdc73d97068', 'working', 6, 3, 82.5, 90, FALSE, '2026-09-28T06:40:03+00:00'),
  ('0b88a95c-2e3a-5cdd-9b22-a97006804ab2', '498f1c5b-d118-534a-b473-511d164aaacb', 'warmup', 1, 8, 37.5, NULL, FALSE, '2026-09-28T06:41:52+00:00'),
  ('43125879-990a-5865-b496-07b9070bc861', '498f1c5b-d118-534a-b473-511d164aaacb', 'warmup', 2, 5, 55.0, NULL, FALSE, '2026-09-28T06:43:32+00:00'),
  ('7371b68d-cf2a-58ad-9016-93edcfc00157', '498f1c5b-d118-534a-b473-511d164aaacb', 'working', 3, 6, 75.0, 90, FALSE, '2026-09-28T06:46:00+00:00'),
  ('88bf8fb0-5aba-5762-8756-2e8d84c54be0', '498f1c5b-d118-534a-b473-511d164aaacb', 'working', 4, 6, 75.0, 90, FALSE, '2026-09-28T06:48:28+00:00'),
  ('2705e45c-e5be-524d-a78d-351ccb7a9051', '498f1c5b-d118-534a-b473-511d164aaacb', 'working', 5, 6, 75.0, 150, FALSE, '2026-09-28T06:51:56+00:00'),
  ('d2ca1d98-7935-57d0-bf5b-07b61ebd32e1', '498f1c5b-d118-534a-b473-511d164aaacb', 'working', 6, 6, 75.0, 120, FALSE, '2026-09-28T06:54:54+00:00'),
  ('fc312124-8152-5d35-9764-8a02d53e0920', 'f44bca1f-6a1c-5d15-aa92-f94e6bd9fe4c', 'working', 1, 8, 40.0, 120, FALSE, '2026-09-28T06:57:58+00:00'),
  ('dd1303b8-c302-5965-b67a-af8d0104c097', 'f44bca1f-6a1c-5d15-aa92-f94e6bd9fe4c', 'working', 2, 8, 40.0, 90, FALSE, '2026-09-28T07:00:32+00:00'),
  ('b493fd1a-5f5a-5d65-8b61-d637b0df750f', 'f44bca1f-6a1c-5d15-aa92-f94e6bd9fe4c', 'dropset', 3, 11, 32.0, 90, FALSE, '2026-09-28T07:03:15+00:00'),
  ('61bfa7d3-6209-597a-bea0-fe0a332d6f69', '01e4f285-b249-5990-9bdf-997b7377d37c', 'working', 1, 13, 0.0, 90, FALSE, '2026-09-28T07:06:04+00:00'),
  ('231c51e6-9286-578d-a057-9a5c165fd9e8', '01e4f285-b249-5990-9bdf-997b7377d37c', 'working', 2, 11, 0.0, 90, FALSE, '2026-09-28T07:08:47+00:00'),
  ('82fa1ec8-5d7a-5b20-97c2-7126c5a8f3f9', '01e4f285-b249-5990-9bdf-997b7377d37c', 'working', 3, 12, 0.0, 60, FALSE, '2026-09-28T07:11:03+00:00'),
  ('573dbbac-c9ec-52f6-9e0c-0c43867ea867', '01e4f285-b249-5990-9bdf-997b7377d37c', 'working', 4, 11, 0.0, 120, FALSE, '2026-09-28T07:14:16+00:00'),
  ('c93d715c-198c-57ff-8859-6e115fb04cf2', '8e2813d7-8761-5917-add7-aa9c6c5a5de2', 'working', 1, 10, 32.5, 60, FALSE, '2026-09-28T07:16:26+00:00'),
  ('7a07c577-a55c-555d-852f-86adac6b0ab9', '8e2813d7-8761-5917-add7-aa9c6c5a5de2', 'working', 2, 10, 32.5, 90, FALSE, '2026-09-28T07:19:06+00:00'),
  ('11ed3ccd-b49d-5e4d-9598-45f91c5afbec', '8e2813d7-8761-5917-add7-aa9c6c5a5de2', 'dropset', 3, 11, 25.0, 150, FALSE, '2026-09-28T07:22:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('977b05c0-0c44-5e7b-88ab-a599bf111eb5', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-09-29T06:13:00+00:00', '2026-09-29T07:15:04+00:00', 3724, 10802.5, FALSE, 84.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('874c094a-ded6-5fae-8fc8-154ac2f8671e', '977b05c0-0c44-5e7b-88ab-a599bf111eb5', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('e0b71b38-1b3d-5220-ab12-893210eb3695', '977b05c0-0c44-5e7b-88ab-a599bf111eb5', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('fceaeb75-df2f-5bdb-ae28-910fc5a10d26', '977b05c0-0c44-5e7b-88ab-a599bf111eb5', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('5ae64329-756a-5ccc-b31f-2474d7ca869b', '977b05c0-0c44-5e7b-88ab-a599bf111eb5', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('9dee9017-732e-5fca-aaf1-cd1355c75b22', '977b05c0-0c44-5e7b-88ab-a599bf111eb5', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('06919627-0fb2-57db-bbd9-06cb8e56176d', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'warmup', 1, 8, 60.0, NULL, FALSE, '2026-09-29T06:19:49+00:00'),
  ('290b7c55-c8be-586b-8754-169e6c40608b', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'warmup', 2, 5, 92.5, NULL, FALSE, '2026-09-29T06:21:29+00:00'),
  ('21d90ad8-3927-547d-8426-9ca4dd8667c4', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'working', 3, 5, 122.5, 150, FALSE, '2026-09-29T06:24:54+00:00'),
  ('4253bdd5-cd72-598f-96cd-06ddab95e4fa', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'working', 4, 5, 122.5, 150, FALSE, '2026-09-29T06:28:19+00:00'),
  ('933a18a4-7c4c-5096-87b9-9da62a78b59b', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'working', 5, 5, 122.5, 150, FALSE, '2026-09-29T06:31:44+00:00'),
  ('91419b86-e087-5671-9be2-a57dd0cabf5c', '874c094a-ded6-5fae-8fc8-154ac2f8671e', 'working', 6, 5, 122.5, 60, FALSE, '2026-09-29T06:33:39+00:00'),
  ('3d115f43-03d1-54a0-88e5-fe6d5985478b', 'e0b71b38-1b3d-5220-ab12-893210eb3695', 'working', 1, 8, 92.5, 90, FALSE, '2026-09-29T06:36:13+00:00'),
  ('b8efbabc-f9b0-540e-9be6-f335cf976e16', 'e0b71b38-1b3d-5220-ab12-893210eb3695', 'working', 2, 8, 92.5, 60, FALSE, '2026-09-29T06:38:17+00:00'),
  ('9d21244d-c858-5aa5-91ed-c906d4819a89', 'e0b71b38-1b3d-5220-ab12-893210eb3695', 'working', 3, 7, 92.5, 150, FALSE, '2026-09-29T06:41:48+00:00'),
  ('b2f01ee7-b457-5803-a5f7-169e7d7894ad', 'fceaeb75-df2f-5bdb-ae28-910fc5a10d26', 'working', 1, 10, 47.5, 150, FALSE, '2026-09-29T06:45:28+00:00'),
  ('332b94b1-fb37-53d5-bbb0-2be781e08a69', 'fceaeb75-df2f-5bdb-ae28-910fc5a10d26', 'working', 2, 10, 47.5, 120, FALSE, '2026-09-29T06:48:38+00:00'),
  ('fba7a74d-1fc0-5a20-ab8c-f1c4d4408a8e', 'fceaeb75-df2f-5bdb-ae28-910fc5a10d26', 'failure', 3, 10, 47.5, 120, FALSE, '2026-09-29T06:51:48+00:00'),
  ('cfc6f767-4a34-5c85-9114-c91fb859ac04', '5ae64329-756a-5ccc-b31f-2474d7ca869b', 'working', 1, 12, 100.0, 90, FALSE, '2026-09-29T06:54:34+00:00'),
  ('f2464edf-66b6-52e0-9287-15371303379b', '5ae64329-756a-5ccc-b31f-2474d7ca869b', 'working', 2, 12, 100.0, 120, FALSE, '2026-09-29T06:57:50+00:00'),
  ('7734cefa-f059-52fe-9297-9567577b2349', '5ae64329-756a-5ccc-b31f-2474d7ca869b', 'working', 3, 12, 100.0, 120, FALSE, '2026-09-29T07:01:06+00:00'),
  ('eb0ffec3-4109-5dc2-af1b-1e467672e5b9', '5ae64329-756a-5ccc-b31f-2474d7ca869b', 'working', 4, 12, 100.0, 60, FALSE, '2026-09-29T07:03:22+00:00'),
  ('3a4beed1-465f-5299-91d9-b0626a0c1b92', '9dee9017-732e-5fca-aaf1-cd1355c75b22', 'working', 1, 15, 0.0, 90, FALSE, '2026-09-29T07:06:17+00:00'),
  ('b772848f-e59d-5321-8128-d721f6fdf25d', '9dee9017-732e-5fca-aaf1-cd1355c75b22', 'working', 2, 12, 0.0, 90, FALSE, '2026-09-29T07:09:03+00:00'),
  ('6e64b074-d4c1-5f11-bc20-1a6468b024b9', '9dee9017-732e-5fca-aaf1-cd1355c75b22', 'dropset', 3, 17, 0.0, 90, FALSE, '2026-09-29T07:12:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('a29e9e22-1e5c-5975-a577-392c838474ef', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-10-01T06:09:00+00:00', '2026-10-01T07:06:49+00:00', 3469, 3996.0, FALSE, 84.0, 'gym', 180);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('9b118efd-e186-50fe-aa4d-42cb079a13f4', 'a29e9e22-1e5c-5975-a577-392c838474ef', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('cc513cc7-5222-51f4-90b9-7f968c3f32ad', 'a29e9e22-1e5c-5975-a577-392c838474ef', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('7e4d31b1-286c-5a60-a7ba-b68c551af8b2', 'a29e9e22-1e5c-5975-a577-392c838474ef', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('7455e855-07d4-5488-85b5-78f782c7fb9e', 'a29e9e22-1e5c-5975-a577-392c838474ef', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('2e31cc61-dcf7-5771-a2b6-c73c1bd124d1', 'a29e9e22-1e5c-5975-a577-392c838474ef', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('aaa258aa-0cc2-561e-b150-1922dd0b85be', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'warmup', 1, 8, 27.5, NULL, FALSE, '2026-10-01T06:15:49+00:00'),
  ('54c4df49-1c56-5604-a6fa-279e5ba1983a', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'warmup', 2, 5, 40.0, NULL, FALSE, '2026-10-01T06:17:29+00:00'),
  ('b33eb114-7936-5015-97f8-abd09475ac86', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'working', 3, 5, 55.0, 120, FALSE, '2026-10-01T06:20:24+00:00'),
  ('54478cb3-1324-58d8-8b46-7b4d2660ed0b', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'working', 4, 5, 55.0, 90, FALSE, '2026-10-01T06:22:49+00:00'),
  ('dfe9054e-4aaf-5567-a1e4-898ca7b0ea07', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'working', 5, 5, 55.0, 60, FALSE, '2026-10-01T06:24:44+00:00'),
  ('7520c4cd-0031-5a30-8a47-5f10a49519fa', '9b118efd-e186-50fe-aa4d-42cb079a13f4', 'working', 6, 5, 55.0, 90, FALSE, '2026-10-01T06:27:09+00:00'),
  ('402fd583-761b-515a-915f-a39b1c1c0153', 'cc513cc7-5222-51f4-90b9-7f968c3f32ad', 'working', 1, 12, 0.0, 60, FALSE, '2026-10-01T06:29:25+00:00'),
  ('a482aba7-7a40-5cb1-86dd-c4ac3023c6dc', 'cc513cc7-5222-51f4-90b9-7f968c3f32ad', 'working', 2, 13, 0.0, 90, FALSE, '2026-10-01T06:32:14+00:00'),
  ('5b573aad-790c-5131-8d33-bea05529d172', 'cc513cc7-5222-51f4-90b9-7f968c3f32ad', 'working', 3, 11, 0.0, 90, FALSE, '2026-10-01T06:34:57+00:00'),
  ('e295eb98-25df-56ce-8d54-f4e2a568190f', 'cc513cc7-5222-51f4-90b9-7f968c3f32ad', 'failure', 4, 13, 0.0, 90, FALSE, '2026-10-01T06:37:46+00:00'),
  ('8e4ce922-8f2c-5c85-bd9d-a521f884af14', '7e4d31b1-286c-5a60-a7ba-b68c551af8b2', 'working', 1, 10, 40.0, 90, FALSE, '2026-10-01T06:40:26+00:00'),
  ('3246b3f3-9874-5bad-8ebd-e97f0bea731d', '7e4d31b1-286c-5a60-a7ba-b68c551af8b2', 'working', 2, 10, 40.0, 90, FALSE, '2026-10-01T06:43:06+00:00'),
  ('86496c76-4ef5-528f-8143-9e24bae9e960', '7e4d31b1-286c-5a60-a7ba-b68c551af8b2', 'dropset', 3, 13, 32.0, 120, FALSE, '2026-10-01T06:46:25+00:00'),
  ('b80f73af-fb29-58f7-aa74-00673c3f112c', '7455e855-07d4-5488-85b5-78f782c7fb9e', 'working', 1, 15, 12.5, 150, FALSE, '2026-10-01T06:50:20+00:00'),
  ('64bba260-361b-51d9-99f8-968cfda59026', '7455e855-07d4-5488-85b5-78f782c7fb9e', 'working', 2, 15, 12.5, 90, FALSE, '2026-10-01T06:53:15+00:00'),
  ('427f80d3-ff86-55d2-8e45-d4db26d7ab46', '7455e855-07d4-5488-85b5-78f782c7fb9e', 'dropset', 3, 18, 10.0, 90, FALSE, '2026-10-01T06:56:19+00:00'),
  ('ddbcc048-09bc-5611-bfb3-f4f5de7c140f', '2e31cc61-dcf7-5771-a2b6-c73c1bd124d1', 'working', 1, 10, 37.5, 90, FALSE, '2026-10-01T06:58:59+00:00'),
  ('f6b652f4-61e9-514c-9c7d-94070cf10736', '2e31cc61-dcf7-5771-a2b6-c73c1bd124d1', 'working', 2, 10, 37.5, 60, FALSE, '2026-10-01T07:01:09+00:00'),
  ('87ce05f5-7207-52ca-a53f-7406506533cf', '2e31cc61-dcf7-5771-a2b6-c73c1bd124d1', 'working', 3, 10, 37.5, 90, FALSE, '2026-10-01T07:03:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3869cdd1-d6e7-55bc-93bd-6cf2e28bf721', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-10-03T06:30:00+00:00', '2026-10-03T07:18:09+00:00', 2889, 11980.0, FALSE, 84.0, 'gym', 110);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('fc8b1911-0d0b-585b-a005-40b1705987a7', '3869cdd1-d6e7-55bc-93bd-6cf2e28bf721', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('61e6aea5-2ae2-53e6-bce3-a1303a3a0757', '3869cdd1-d6e7-55bc-93bd-6cf2e28bf721', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('923a4c2e-dccf-5251-b423-ea4ea19efc6d', '3869cdd1-d6e7-55bc-93bd-6cf2e28bf721', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('472fe466-9b95-5ed5-9f02-50dfcc7138a3', '3869cdd1-d6e7-55bc-93bd-6cf2e28bf721', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('de26872c-0212-5599-b795-bda9dc95d486', 'fc8b1911-0d0b-585b-a005-40b1705987a7', 'warmup', 1, 8, 70.0, NULL, FALSE, '2026-10-03T06:36:49+00:00'),
  ('144eeb44-66b2-5a90-ba4d-3be09533da81', 'fc8b1911-0d0b-585b-a005-40b1705987a7', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-10-03T06:38:29+00:00'),
  ('04275fda-d268-5e06-90f5-6a5396859f94', 'fc8b1911-0d0b-585b-a005-40b1705987a7', 'working', 3, 5, 145.0, 90, FALSE, '2026-10-03T06:40:54+00:00'),
  ('75a38701-362c-5312-8d3b-f7ed12d5f046', 'fc8b1911-0d0b-585b-a005-40b1705987a7', 'working', 4, 5, 145.0, 120, FALSE, '2026-10-03T06:43:49+00:00'),
  ('c694cc64-82f9-5384-ab90-4e5240d19f54', 'fc8b1911-0d0b-585b-a005-40b1705987a7', 'working', 5, 5, 145.0, 90, FALSE, '2026-10-03T06:46:14+00:00'),
  ('692dc005-42b2-52d4-801b-b0b90219af46', '61e6aea5-2ae2-53e6-bce3-a1303a3a0757', 'working', 1, 8, 125.0, 120, FALSE, '2026-10-03T06:49:18+00:00'),
  ('55f713c7-0ef2-501f-928d-f4e8d6d0aee6', '61e6aea5-2ae2-53e6-bce3-a1303a3a0757', 'working', 2, 8, 125.0, 90, FALSE, '2026-10-03T06:51:52+00:00'),
  ('a95f0c96-3d40-5b6f-8bf7-bbe3eb664a11', '61e6aea5-2ae2-53e6-bce3-a1303a3a0757', 'working', 3, 6, 125.0, 150, FALSE, '2026-10-03T06:55:20+00:00'),
  ('9a85e263-b3b3-54bc-b558-3dbf67b73d40', '923a4c2e-dccf-5251-b423-ea4ea19efc6d', 'working', 1, 8, 102.5, 90, FALSE, '2026-10-03T06:57:54+00:00'),
  ('ffe68282-37fc-5688-8111-f19b1585ae92', '923a4c2e-dccf-5251-b423-ea4ea19efc6d', 'working', 2, 8, 102.5, 90, FALSE, '2026-10-03T07:00:28+00:00'),
  ('76169723-4a97-5570-8654-009c75bd6c44', '923a4c2e-dccf-5251-b423-ea4ea19efc6d', 'working', 3, 6, 102.5, 90, FALSE, '2026-10-03T07:02:56+00:00'),
  ('0915124a-48e8-53ef-b356-b9aa7ec94df6', '472fe466-9b95-5ed5-9f02-50dfcc7138a3', 'working', 1, 12, 100.0, 150, FALSE, '2026-10-03T07:06:42+00:00'),
  ('2c514baf-39e7-574e-bb20-d238ce9f65be', '472fe466-9b95-5ed5-9f02-50dfcc7138a3', 'working', 2, 12, 100.0, 90, FALSE, '2026-10-03T07:09:28+00:00'),
  ('6d237169-0179-5725-b3b4-2f86698df37b', '472fe466-9b95-5ed5-9f02-50dfcc7138a3', 'working', 3, 12, 100.0, 90, FALSE, '2026-10-03T07:12:14+00:00'),
  ('ebab9fd3-e21e-5c94-83dc-81a8e3e5bed9', '472fe466-9b95-5ed5-9f02-50dfcc7138a3', 'dropset', 4, 15, 80.0, 90, FALSE, '2026-10-03T07:15:09+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3ba84631-f55a-537b-b78d-6ef459e4f18d', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-10-05T06:05:00+00:00', '2026-10-05T07:12:58+00:00', 4078, 6308.0, FALSE, 84.0, 'gym', 150);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('37f94ef1-878c-5d8e-b8b4-01586ca59ce9', '3ba84631-f55a-537b-b78d-6ef459e4f18d', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('96177d84-3752-5127-b263-5d38879618f1', '3ba84631-f55a-537b-b78d-6ef459e4f18d', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('338b051d-a9ac-5e4e-87bc-699e6e419e8a', '3ba84631-f55a-537b-b78d-6ef459e4f18d', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('de12e8b9-44ac-5948-97d2-fd7bcd627790', '3ba84631-f55a-537b-b78d-6ef459e4f18d', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('6708427f-3e25-5abb-87cc-988f6d665f07', '3ba84631-f55a-537b-b78d-6ef459e4f18d', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1a18caab-41df-5595-84cc-b0255acfe2ec', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-10-05T06:11:49+00:00'),
  ('3724764e-67ce-5f1e-a524-5ce1b4392603', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'warmup', 2, 5, 75.0, NULL, FALSE, '2026-10-05T06:13:29+00:00'),
  ('48b76f49-c37f-57a6-ab5c-237cf9dbaad0', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'working', 3, 5, 100.0, 150, FALSE, '2026-10-05T06:16:54+00:00'),
  ('23fe972b-d131-5ba7-a5ed-0f17f8ca0b2e', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'working', 4, 5, 100.0, 90, FALSE, '2026-10-05T06:19:19+00:00'),
  ('4f9a7ba1-8daa-532d-af80-001c57563d43', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'working', 5, 5, 100.0, 90, FALSE, '2026-10-05T06:21:44+00:00'),
  ('ac9aff81-dbfb-5b89-aee0-c913d7ad8c18', '37f94ef1-878c-5d8e-b8b4-01586ca59ce9', 'working', 6, 4, 100.0, 90, FALSE, '2026-10-05T06:24:06+00:00'),
  ('13081aee-e6ae-5f7b-8116-31af3ccc994a', '96177d84-3752-5127-b263-5d38879618f1', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-10-05T06:25:55+00:00'),
  ('b2665fc4-be24-5815-8776-a0215b9e0055', '96177d84-3752-5127-b263-5d38879618f1', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-10-05T06:27:35+00:00'),
  ('cf7b94fe-754d-52e9-abed-0308b85ba14c', '96177d84-3752-5127-b263-5d38879618f1', 'working', 3, 6, 90.0, 90, FALSE, '2026-10-05T06:30:03+00:00'),
  ('4b0a51d4-c153-5f44-ab9d-59d111983753', '96177d84-3752-5127-b263-5d38879618f1', 'working', 4, 6, 90.0, 120, FALSE, '2026-10-05T06:33:01+00:00'),
  ('63dd2f6a-a5b9-5e30-86ab-eb1b674fb999', '96177d84-3752-5127-b263-5d38879618f1', 'working', 5, 6, 90.0, 150, FALSE, '2026-10-05T06:36:29+00:00'),
  ('dcfef96d-36a7-53fe-abe0-eaee49741f90', '96177d84-3752-5127-b263-5d38879618f1', 'working', 6, 6, 90.0, 90, FALSE, '2026-10-05T06:38:57+00:00'),
  ('1ed8abdc-8333-5185-a9eb-d61c1f2c205f', '338b051d-a9ac-5e4e-87bc-699e6e419e8a', 'working', 1, 8, 46.0, 150, FALSE, '2026-10-05T06:42:31+00:00'),
  ('68217983-1138-5ba4-b159-3f4fdaf7e021', '338b051d-a9ac-5e4e-87bc-699e6e419e8a', 'working', 2, 8, 46.0, 150, FALSE, '2026-10-05T06:46:05+00:00'),
  ('417ae686-0268-5225-8ffa-d9f0944ce794', '338b051d-a9ac-5e4e-87bc-699e6e419e8a', 'working', 3, 7, 46.0, 150, FALSE, '2026-10-05T06:49:36+00:00'),
  ('5251bde7-44eb-5da3-a921-a26842c96895', 'de12e8b9-44ac-5948-97d2-fd7bcd627790', 'working', 1, 11, 0.0, 90, FALSE, '2026-10-05T06:52:19+00:00'),
  ('a036bae8-d58f-5f23-b1c0-727a46d984b4', 'de12e8b9-44ac-5948-97d2-fd7bcd627790', 'working', 2, 14, 0.0, 150, FALSE, '2026-10-05T06:56:11+00:00'),
  ('e13cc100-8d5c-5f93-9265-77f434c0bb88', 'de12e8b9-44ac-5948-97d2-fd7bcd627790', 'working', 3, 13, 0.0, 90, FALSE, '2026-10-05T06:59:00+00:00'),
  ('57c514fd-8497-5689-9dc2-186fe1d49fcc', 'de12e8b9-44ac-5948-97d2-fd7bcd627790', 'working', 4, 14, 0.0, 60, FALSE, '2026-10-05T07:01:22+00:00'),
  ('88a9d2fc-6c2c-5012-a091-ea323169d315', '6708427f-3e25-5abb-87cc-988f6d665f07', 'working', 1, 10, 40.0, 90, FALSE, '2026-10-05T07:04:02+00:00'),
  ('bbdf268a-6a1d-5ae5-9247-c05e747e8e4f', '6708427f-3e25-5abb-87cc-988f6d665f07', 'working', 2, 10, 40.0, 150, FALSE, '2026-10-05T07:07:42+00:00'),
  ('127eefca-0c80-50a2-9b75-493e5209188e', '6708427f-3e25-5abb-87cc-988f6d665f07', 'dropset', 3, 12, 32.5, 60, FALSE, '2026-10-05T07:09:58+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('594f3514-7461-5b6c-b714-3569bbb0090b', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-10-06T06:39:00+00:00', '2026-10-06T07:39:46+00:00', 3646, 12935.0, FALSE, 84.0, 'gym', 169);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('554be612-9985-55bb-8dcd-d357bbbe312c', '594f3514-7461-5b6c-b714-3569bbb0090b', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('0315f182-4e0d-5c15-9b2c-b62fd1d1a167', '594f3514-7461-5b6c-b714-3569bbb0090b', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('853c51cc-c532-5b68-a690-cadcfa28c6e5', '594f3514-7461-5b6c-b714-3569bbb0090b', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('8d76ac05-024a-524a-aa25-15eea70b51ae', '594f3514-7461-5b6c-b714-3569bbb0090b', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('55184415-77f8-5b21-86a5-86161e0c8eb5', '594f3514-7461-5b6c-b714-3569bbb0090b', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('bd6a8809-5a58-52cf-87b0-1f0691aa6cd8', '554be612-9985-55bb-8dcd-d357bbbe312c', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-10-06T06:45:49+00:00'),
  ('c50f21ce-46b6-5b2a-a1ab-21dbf4019976', '554be612-9985-55bb-8dcd-d357bbbe312c', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-10-06T06:47:29+00:00'),
  ('73c70558-d51b-5f34-b39b-43a77db2615d', '554be612-9985-55bb-8dcd-d357bbbe312c', 'working', 3, 5, 147.5, 150, FALSE, '2026-10-06T06:50:54+00:00'),
  ('7ac3a7f2-d91b-5329-aed5-311ecceef2e7', '554be612-9985-55bb-8dcd-d357bbbe312c', 'working', 4, 5, 147.5, 120, FALSE, '2026-10-06T06:53:49+00:00'),
  ('78a8dacc-5555-5036-8ad4-550417a770a0', '554be612-9985-55bb-8dcd-d357bbbe312c', 'working', 5, 5, 147.5, 60, FALSE, '2026-10-06T06:55:44+00:00'),
  ('85d7782d-d8c1-500b-9c15-e9cf4bdfa739', '554be612-9985-55bb-8dcd-d357bbbe312c', 'working', 6, 4, 147.5, 120, FALSE, '2026-10-06T06:58:36+00:00'),
  ('12f21ad3-f002-50ee-b6c8-2999a3a49a99', '0315f182-4e0d-5c15-9b2c-b62fd1d1a167', 'working', 1, 8, 110.0, 150, FALSE, '2026-10-06T07:02:10+00:00'),
  ('fad26095-4d16-5bbd-ad00-cbc69ca6ed1f', '0315f182-4e0d-5c15-9b2c-b62fd1d1a167', 'working', 2, 8, 110.0, 150, FALSE, '2026-10-06T07:05:44+00:00'),
  ('9049305f-1de8-5b69-81d5-4664543b6f20', '0315f182-4e0d-5c15-9b2c-b62fd1d1a167', 'dropset', 3, 11, 87.5, 90, FALSE, '2026-10-06T07:08:27+00:00'),
  ('46109ebc-0381-5a27-909b-daadeefb549d', '853c51cc-c532-5b68-a690-cadcfa28c6e5', 'working', 1, 10, 55.0, 90, FALSE, '2026-10-06T07:11:07+00:00'),
  ('17fadb07-0141-5072-9980-1920c25f0781', '853c51cc-c532-5b68-a690-cadcfa28c6e5', 'working', 2, 10, 55.0, 90, FALSE, '2026-10-06T07:13:47+00:00'),
  ('5416b08c-239c-5897-821e-be8f57f79620', '853c51cc-c532-5b68-a690-cadcfa28c6e5', 'working', 3, 10, 55.0, 60, FALSE, '2026-10-06T07:15:57+00:00'),
  ('7619bef3-839c-5291-93b1-4184c141470f', '8d76ac05-024a-524a-aa25-15eea70b51ae', 'working', 1, 12, 120.0, 90, FALSE, '2026-10-06T07:18:43+00:00'),
  ('aa42d999-4f8f-5f20-b5db-170475d8443a', '8d76ac05-024a-524a-aa25-15eea70b51ae', 'working', 2, 12, 120.0, 90, FALSE, '2026-10-06T07:21:29+00:00'),
  ('1d6d56ac-6059-52c6-a5c0-cc9eeaf6cfc0', '8d76ac05-024a-524a-aa25-15eea70b51ae', 'working', 3, 12, 120.0, 90, FALSE, '2026-10-06T07:24:15+00:00'),
  ('31ef86e8-c7d5-5eef-9d9a-468f55f4524f', '8d76ac05-024a-524a-aa25-15eea70b51ae', 'failure', 4, 12, 120.0, 120, FALSE, '2026-10-06T07:27:31+00:00'),
  ('8800a793-e1b4-5ec5-9507-21e0944ae11f', '55184415-77f8-5b21-86a5-86161e0c8eb5', 'working', 1, 14, 0.0, 120, FALSE, '2026-10-06T07:30:53+00:00'),
  ('685aebab-0fa0-5473-86ee-c0192f88332f', '55184415-77f8-5b21-86a5-86161e0c8eb5', 'working', 2, 14, 0.0, 90, FALSE, '2026-10-06T07:33:45+00:00'),
  ('3cad6324-b2ae-5a03-aeb1-9990607fc70b', '55184415-77f8-5b21-86a5-86161e0c8eb5', 'dropset', 3, 17, 0.0, 90, FALSE, '2026-10-06T07:36:46+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-10-08T06:30:00+00:00', '2026-10-08T07:26:49+00:00', 3409, 4538.0, FALSE, 84.0, 'gym', 170);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('616bf908-355b-5181-93e2-4a27eee3b515', '6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('07b9aaf2-aade-578b-96ad-b07778edad2b', '6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('c8ebc0cc-4d19-5d90-9f41-e638e0fc8d1a', '6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('86243492-95d2-50fe-b48f-e999bd61e4cb', '6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('1cc59096-0864-55ec-9170-2686f369dc60', '6d352ad2-110d-59a7-a44d-f8a47c0e2a2a', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('94bc5f56-a78a-5f31-b1b1-f12c140d2026', '616bf908-355b-5181-93e2-4a27eee3b515', 'warmup', 1, 8, 32.5, NULL, FALSE, '2026-10-08T06:36:49+00:00'),
  ('64ab7f14-50fe-5398-8ef3-94da72c40217', '616bf908-355b-5181-93e2-4a27eee3b515', 'warmup', 2, 5, 50.0, NULL, FALSE, '2026-10-08T06:38:29+00:00'),
  ('03080591-a572-5b57-b60c-9feae795e3e4', '616bf908-355b-5181-93e2-4a27eee3b515', 'working', 3, 5, 65.0, 90, FALSE, '2026-10-08T06:40:54+00:00'),
  ('40d6c4e1-f27f-5147-af62-711e0c606f9b', '616bf908-355b-5181-93e2-4a27eee3b515', 'working', 4, 5, 65.0, 150, FALSE, '2026-10-08T06:44:19+00:00'),
  ('8f190ff2-fc14-5953-911f-5d7cf9db5626', '616bf908-355b-5181-93e2-4a27eee3b515', 'working', 5, 5, 65.0, 90, FALSE, '2026-10-08T06:46:44+00:00'),
  ('c63a9351-e6e3-5b5b-9c2b-05c9e34cffe0', '616bf908-355b-5181-93e2-4a27eee3b515', 'working', 6, 5, 65.0, 90, FALSE, '2026-10-08T06:49:09+00:00'),
  ('f84fcd66-23c6-57f8-84e7-24b1a318a016', '07b9aaf2-aade-578b-96ad-b07778edad2b', 'working', 1, 12, 0.0, 60, FALSE, '2026-10-08T06:51:25+00:00'),
  ('62f1c965-4952-50e9-a88c-4a5758ac13bc', '07b9aaf2-aade-578b-96ad-b07778edad2b', 'working', 2, 11, 0.0, 60, FALSE, '2026-10-08T06:53:38+00:00'),
  ('4a5c9bb3-ffe8-509a-9ff8-f120a8b9175b', '07b9aaf2-aade-578b-96ad-b07778edad2b', 'working', 3, 11, 0.0, 60, FALSE, '2026-10-08T06:55:51+00:00'),
  ('df4443fd-0018-5dd7-bfba-c3fabfd8a6b5', '07b9aaf2-aade-578b-96ad-b07778edad2b', 'dropset', 4, 16, 0.0, 60, FALSE, '2026-10-08T06:58:19+00:00'),
  ('830fe5ef-6124-5964-90fb-137c9e6b96d8', 'c8ebc0cc-4d19-5d90-9f41-e638e0fc8d1a', 'working', 1, 10, 46.0, 90, FALSE, '2026-10-08T07:00:59+00:00'),
  ('fa093d68-676a-5ffe-a291-b429e8602054', 'c8ebc0cc-4d19-5d90-9f41-e638e0fc8d1a', 'working', 2, 10, 46.0, 90, FALSE, '2026-10-08T07:03:39+00:00'),
  ('8f1d2922-fb28-5d23-b644-1461522cecd5', 'c8ebc0cc-4d19-5d90-9f41-e638e0fc8d1a', 'working', 3, 8, 46.0, 60, FALSE, '2026-10-08T07:05:43+00:00'),
  ('32de6997-f76e-5159-adeb-9b2e67273391', '86243492-95d2-50fe-b48f-e999bd61e4cb', 'working', 1, 15, 15.0, 90, FALSE, '2026-10-08T07:08:38+00:00'),
  ('009fdcaf-587c-514a-8f60-dd175311f881', '86243492-95d2-50fe-b48f-e999bd61e4cb', 'working', 2, 15, 15.0, 150, FALSE, '2026-10-08T07:12:33+00:00'),
  ('5b4299c6-97c4-5e98-b8cf-1645f636705e', '86243492-95d2-50fe-b48f-e999bd61e4cb', 'failure', 3, 13, 15.0, 90, FALSE, '2026-10-08T07:15:22+00:00'),
  ('011dff4a-2521-526d-83ac-23a025a7231f', '1cc59096-0864-55ec-9170-2686f369dc60', 'working', 1, 10, 45.0, 60, FALSE, '2026-10-08T07:17:32+00:00'),
  ('6157d31c-5fe5-5134-b351-fff15881b75a', '1cc59096-0864-55ec-9170-2686f369dc60', 'working', 2, 10, 45.0, 90, FALSE, '2026-10-08T07:20:12+00:00'),
  ('1eb86f53-5143-5f78-a218-9e78bd7be866', '1cc59096-0864-55ec-9170-2686f369dc60', 'failure', 3, 9, 45.0, 150, FALSE, '2026-10-08T07:23:49+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('003aaeb0-98c1-5bfc-9689-930d405cda96', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-10-12T06:11:00+00:00', '2026-10-12T07:19:13+00:00', 4093, 6438.5, FALSE, 84.0, 'gym', 155);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('222c501b-a952-59eb-8f28-0b0c3f7576b6', '003aaeb0-98c1-5bfc-9689-930d405cda96', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('b27c036d-2256-50c9-9cf9-4f67206fa811', '003aaeb0-98c1-5bfc-9689-930d405cda96', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('824bc4c0-6259-5d20-810e-9ffb21a4cdf3', '003aaeb0-98c1-5bfc-9689-930d405cda96', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('d3ec5333-a26c-54dc-a489-ac20b4cda475', '003aaeb0-98c1-5bfc-9689-930d405cda96', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('ff3d04c9-5f7b-5120-990b-d4897cccf9cd', '003aaeb0-98c1-5bfc-9689-930d405cda96', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0a79ba93-feac-5a7b-86fa-4b77c121c5c7', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-10-12T06:17:49+00:00'),
  ('a817925d-8b8b-5e16-8a38-b731c2caf618', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'warmup', 2, 5, 75.0, NULL, FALSE, '2026-10-12T06:19:29+00:00'),
  ('747983c8-4de7-5898-8b26-2da8e16f3d55', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'working', 3, 5, 100.0, 60, FALSE, '2026-10-12T06:21:24+00:00'),
  ('d5b36e78-c4bf-5a7b-bdf4-0038ce6c67dc', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'working', 4, 5, 100.0, 120, FALSE, '2026-10-12T06:24:19+00:00'),
  ('d51b5fe8-f6a4-57b9-9798-5de3dba6a1bf', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'working', 5, 5, 100.0, 60, FALSE, '2026-10-12T06:26:14+00:00'),
  ('9e18fcc4-714c-5d14-b67b-40d14b419f7d', '222c501b-a952-59eb-8f28-0b0c3f7576b6', 'working', 6, 5, 100.0, 90, FALSE, '2026-10-12T06:28:39+00:00'),
  ('a22c60b0-c538-5370-a139-e8ba98181ebc', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-10-12T06:30:28+00:00'),
  ('1dc9aaaf-d292-5378-8ca7-7cb34edba9f7', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-10-12T06:32:08+00:00'),
  ('fbeddfff-8b55-5e1e-902e-8b1478496ac1', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'working', 3, 6, 90.0, 60, FALSE, '2026-10-12T06:34:06+00:00'),
  ('ab878e83-4093-5a96-8355-c01f257827f2', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'working', 4, 6, 90.0, 150, FALSE, '2026-10-12T06:37:34+00:00'),
  ('64b1ba63-35b3-5cc8-8b5a-a6c8d2f26b79', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'working', 5, 6, 90.0, 150, FALSE, '2026-10-12T06:41:02+00:00'),
  ('61a680be-9268-51bb-b02a-02d5567ae8a1', 'b27c036d-2256-50c9-9cf9-4f67206fa811', 'working', 6, 6, 90.0, 60, FALSE, '2026-10-12T06:43:00+00:00'),
  ('5d220079-093a-56a9-bdc9-e3dc5995252c', '824bc4c0-6259-5d20-810e-9ffb21a4cdf3', 'working', 1, 8, 48.0, 150, FALSE, '2026-10-12T06:46:34+00:00'),
  ('10538c44-34cb-5cfb-b8f0-7ffdcbffa1ed', '824bc4c0-6259-5d20-810e-9ffb21a4cdf3', 'working', 2, 8, 48.0, 120, FALSE, '2026-10-12T06:49:38+00:00'),
  ('834cf6fb-9d8b-53a4-ae19-22367c572b04', '824bc4c0-6259-5d20-810e-9ffb21a4cdf3', 'working', 3, 6, 48.0, 120, FALSE, '2026-10-12T06:52:36+00:00'),
  ('e47c838b-3910-53b4-a2ea-f2cbf0ecf750', 'd3ec5333-a26c-54dc-a489-ac20b4cda475', 'working', 1, 14, 0.0, 150, FALSE, '2026-10-12T06:56:28+00:00'),
  ('0d3fa1b7-79b3-5732-8a09-6649498245f9', 'd3ec5333-a26c-54dc-a489-ac20b4cda475', 'working', 2, 14, 0.0, 120, FALSE, '2026-10-12T06:59:50+00:00'),
  ('4630c039-fba6-5dd2-8322-dfb088666caa', 'd3ec5333-a26c-54dc-a489-ac20b4cda475', 'working', 3, 15, 0.0, 120, FALSE, '2026-10-12T07:03:15+00:00'),
  ('0768cc63-200e-50b5-acfd-4f4575d20bab', 'd3ec5333-a26c-54dc-a489-ac20b4cda475', 'working', 4, 13, 0.0, 90, FALSE, '2026-10-12T07:06:04+00:00'),
  ('43253735-f4d0-5d74-ba8b-9aa7450067e2', 'ff3d04c9-5f7b-5120-990b-d4897cccf9cd', 'working', 1, 10, 40.0, 150, FALSE, '2026-10-12T07:09:44+00:00'),
  ('292b57a4-c0d0-53cb-804d-5815b643e42c', 'ff3d04c9-5f7b-5120-990b-d4897cccf9cd', 'working', 2, 10, 40.0, 90, FALSE, '2026-10-12T07:12:24+00:00'),
  ('e740ded7-ccf5-5b81-98be-a938347d925d', 'ff3d04c9-5f7b-5120-990b-d4897cccf9cd', 'dropset', 3, 13, 32.5, 150, FALSE, '2026-10-12T07:16:13+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('66bf6e66-60af-5fcb-b866-52e55d06e5eb', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-10-13T06:17:00+00:00', '2026-10-13T07:20:01+00:00', 3781, 12880.0, FALSE, 84.0, 'gym', 164);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('bfb00f28-f8a9-5403-acf1-af908decfc61', '66bf6e66-60af-5fcb-b866-52e55d06e5eb', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('7eea669d-9f05-5adc-bc4e-0c6377622356', '66bf6e66-60af-5fcb-b866-52e55d06e5eb', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('6b269292-e9a4-51f3-b685-411df82dfc73', '66bf6e66-60af-5fcb-b866-52e55d06e5eb', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('ff1841b5-0e22-5e2a-9677-a2703a9a42a8', '66bf6e66-60af-5fcb-b866-52e55d06e5eb', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('eee65cb8-745a-59fc-8ce9-1a84c974415f', '66bf6e66-60af-5fcb-b866-52e55d06e5eb', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5360ef68-90c1-5658-92d2-6526ef7882c5', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-10-13T06:23:49+00:00'),
  ('c957a8bd-7441-5fe2-8c23-e11f7c439370', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'warmup', 2, 5, 110.0, NULL, FALSE, '2026-10-13T06:25:29+00:00'),
  ('b8a07ae1-544d-5cad-8e9d-f518c2528bb1', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'working', 3, 5, 147.5, 120, FALSE, '2026-10-13T06:28:24+00:00'),
  ('a4309bde-1c29-521e-aaee-bde17f89635b', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'working', 4, 5, 147.5, 90, FALSE, '2026-10-13T06:30:49+00:00'),
  ('feae4abb-3046-5e25-9274-18db3e0f4fac', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'working', 5, 5, 147.5, 60, FALSE, '2026-10-13T06:32:44+00:00'),
  ('4db14944-2a49-532d-9bd7-98f1132af53f', 'bfb00f28-f8a9-5403-acf1-af908decfc61', 'working', 6, 5, 147.5, 90, FALSE, '2026-10-13T06:35:09+00:00'),
  ('ef56fdca-71d9-59b6-b86b-af5888672d55', '7eea669d-9f05-5adc-bc4e-0c6377622356', 'working', 1, 8, 110.0, 150, FALSE, '2026-10-13T06:38:43+00:00'),
  ('83fdfa1a-3fed-5ef3-a61b-8660f2d3a853', '7eea669d-9f05-5adc-bc4e-0c6377622356', 'working', 2, 8, 110.0, 120, FALSE, '2026-10-13T06:41:47+00:00'),
  ('9c37f916-3c54-5149-9f0d-096058394dcc', '7eea669d-9f05-5adc-bc4e-0c6377622356', 'failure', 3, 8, 110.0, 90, FALSE, '2026-10-13T06:44:21+00:00'),
  ('cfe1049b-b13c-5cce-ac16-cb980f95b4df', '6b269292-e9a4-51f3-b685-411df82dfc73', 'working', 1, 10, 55.0, 120, FALSE, '2026-10-13T06:47:31+00:00'),
  ('41d946dc-c61a-567a-bd9c-dad5e05c32fd', '6b269292-e9a4-51f3-b685-411df82dfc73', 'working', 2, 10, 55.0, 120, FALSE, '2026-10-13T06:50:41+00:00'),
  ('246e15de-8983-534e-85b3-ef930c200057', '6b269292-e9a4-51f3-b685-411df82dfc73', 'working', 3, 10, 55.0, 150, FALSE, '2026-10-13T06:54:21+00:00'),
  ('bd7b7f29-4886-51af-b43a-10ffc146bb64', 'ff1841b5-0e22-5e2a-9677-a2703a9a42a8', 'working', 1, 12, 120.0, 150, FALSE, '2026-10-13T06:58:07+00:00'),
  ('15ad2da5-4d44-5d41-860b-190eace04f80', 'ff1841b5-0e22-5e2a-9677-a2703a9a42a8', 'working', 2, 12, 120.0, 90, FALSE, '2026-10-13T07:00:53+00:00'),
  ('f2d51635-2c84-5eed-a50f-75124fa5eb44', 'ff1841b5-0e22-5e2a-9677-a2703a9a42a8', 'working', 3, 12, 120.0, 120, FALSE, '2026-10-13T07:04:09+00:00'),
  ('7b20c79a-199b-5b72-b58a-38ff0cfa207f', 'ff1841b5-0e22-5e2a-9677-a2703a9a42a8', 'working', 4, 11, 120.0, 120, FALSE, '2026-10-13T07:07:22+00:00'),
  ('ad05f26c-1adf-59f4-ab90-2183b94103eb', 'eee65cb8-745a-59fc-8ce9-1a84c974415f', 'working', 1, 15, 0.0, 120, FALSE, '2026-10-13T07:10:47+00:00'),
  ('32ce85c1-677e-547b-888e-5992d9cd35dc', 'eee65cb8-745a-59fc-8ce9-1a84c974415f', 'working', 2, 15, 0.0, 120, FALSE, '2026-10-13T07:14:12+00:00'),
  ('9a23411b-043c-57f3-8ab3-bfed1ced0326', 'eee65cb8-745a-59fc-8ce9-1a84c974415f', 'failure', 3, 13, 0.0, 90, FALSE, '2026-10-13T07:17:01+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('ea8c7bc8-9397-5f4d-ba38-ce76c8bc7883', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-10-17T06:17:00+00:00', '2026-10-17T07:04:27+00:00', 2847, 14997.5, FALSE, 84.0, 'gym', 116);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('365ac4d6-c489-5bef-914c-56224fce0db2', 'ea8c7bc8-9397-5f4d-ba38-ce76c8bc7883', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('5069229d-3aa0-5072-96ac-d194b2aeaa54', 'ea8c7bc8-9397-5f4d-ba38-ce76c8bc7883', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('38c99da9-ad02-53b9-b6d5-c7d0592144d8', 'ea8c7bc8-9397-5f4d-ba38-ce76c8bc7883', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('9a760887-d5f9-5761-9524-4ad065db4ccf', 'ea8c7bc8-9397-5f4d-ba38-ce76c8bc7883', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('693fa58b-376a-5b55-b479-85dbe6beb782', '365ac4d6-c489-5bef-914c-56224fce0db2', 'warmup', 1, 8, 85.0, NULL, FALSE, '2026-10-17T06:23:49+00:00'),
  ('1f0c85af-8edc-5c8e-aca8-f83093b596fa', '365ac4d6-c489-5bef-914c-56224fce0db2', 'warmup', 2, 5, 130.0, NULL, FALSE, '2026-10-17T06:25:29+00:00'),
  ('b41498ed-a0a7-51b9-9a75-f3c4d3ff9888', '365ac4d6-c489-5bef-914c-56224fce0db2', 'working', 3, 5, 170.0, 60, FALSE, '2026-10-17T06:27:24+00:00'),
  ('dab578b0-7429-5c93-861f-e90c3d0aa4d7', '365ac4d6-c489-5bef-914c-56224fce0db2', 'working', 4, 5, 170.0, 60, FALSE, '2026-10-17T06:29:19+00:00'),
  ('7bf13b7e-0783-5260-9539-30078a9a5341', '365ac4d6-c489-5bef-914c-56224fce0db2', 'working', 5, 4, 170.0, 150, FALSE, '2026-10-17T06:32:41+00:00'),
  ('60af67d2-4c1e-549f-a62c-fb0be5869a15', '5069229d-3aa0-5072-96ac-d194b2aeaa54', 'working', 1, 8, 145.0, 90, FALSE, '2026-10-17T06:35:15+00:00'),
  ('cafb7b4d-7ccc-5f28-a050-1ed5cd974436', '5069229d-3aa0-5072-96ac-d194b2aeaa54', 'working', 2, 8, 145.0, 60, FALSE, '2026-10-17T06:37:19+00:00'),
  ('a484fd8a-156a-5739-81fb-0e85e9148c31', '5069229d-3aa0-5072-96ac-d194b2aeaa54', 'dropset', 3, 11, 115.0, 150, FALSE, '2026-10-17T06:41:02+00:00'),
  ('e9500444-862b-544d-8aee-ff602c32c773', '38c99da9-ad02-53b9-b6d5-c7d0592144d8', 'working', 1, 8, 122.5, 90, FALSE, '2026-10-17T06:43:36+00:00'),
  ('0b7f9ac7-149a-517f-a70b-73aaffae87ed', '38c99da9-ad02-53b9-b6d5-c7d0592144d8', 'working', 2, 8, 122.5, 150, FALSE, '2026-10-17T06:47:10+00:00'),
  ('12138597-e85a-53c6-9628-98a2fbd1e69d', '38c99da9-ad02-53b9-b6d5-c7d0592144d8', 'dropset', 3, 11, 97.5, 90, FALSE, '2026-10-17T06:49:53+00:00'),
  ('243c3110-173d-5f8d-9116-267abd033386', '9a760887-d5f9-5761-9524-4ad065db4ccf', 'working', 1, 12, 125.0, 90, FALSE, '2026-10-17T06:52:39+00:00'),
  ('243e2b45-9bdf-5aae-98d0-f382f4399765', '9a760887-d5f9-5761-9524-4ad065db4ccf', 'working', 2, 12, 125.0, 90, FALSE, '2026-10-17T06:55:25+00:00'),
  ('d23fe478-15c7-5b39-aae9-9a65e0b807a8', '9a760887-d5f9-5761-9524-4ad065db4ccf', 'working', 3, 12, 125.0, 120, FALSE, '2026-10-17T06:58:41+00:00'),
  ('1bff3881-4ecf-5f9a-89b2-9d733b63c021', '9a760887-d5f9-5761-9524-4ad065db4ccf', 'working', 4, 12, 125.0, 90, FALSE, '2026-10-17T07:01:27+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3f432a78-33a0-5904-b399-2a9edcef3418', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-10-19T06:28:00+00:00', '2026-10-19T07:35:37+00:00', 4057, 6416.0, FALSE, 84.0, 'gym', 153);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('68f7e42d-0f1a-5094-8f45-bad323cacd02', '3f432a78-33a0-5904-b399-2a9edcef3418', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('d0cf48f1-bdcf-5611-a3e8-26d80547c87e', '3f432a78-33a0-5904-b399-2a9edcef3418', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('05210c7f-e324-58e6-a81d-818e891146ee', '3f432a78-33a0-5904-b399-2a9edcef3418', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('2c449328-bd43-5326-819d-8d7ac040f9d6', '3f432a78-33a0-5904-b399-2a9edcef3418', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('5e014e84-8f51-512c-9381-386b545dbbad', '3f432a78-33a0-5904-b399-2a9edcef3418', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d15344a3-47d6-56a1-af82-6b3f6ecc46cc', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-10-19T06:34:49+00:00'),
  ('dc169505-4316-526b-964e-11a2490acfc4', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'warmup', 2, 5, 75.0, NULL, FALSE, '2026-10-19T06:36:29+00:00'),
  ('ddbcabc6-064b-5b8b-ac2d-cb36a8d99b87', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'working', 3, 5, 100.0, 120, FALSE, '2026-10-19T06:39:24+00:00'),
  ('4b7854b2-ad76-5c09-8ece-38fdbfd8a3de', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'working', 4, 5, 100.0, 150, FALSE, '2026-10-19T06:42:49+00:00'),
  ('5743d7e0-1668-54c9-ab18-c192b48812b5', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'working', 5, 5, 100.0, 150, FALSE, '2026-10-19T06:46:14+00:00'),
  ('a9f9a440-37c9-5b4e-8d7b-2dc37850ba4b', '68f7e42d-0f1a-5094-8f45-bad323cacd02', 'working', 6, 5, 100.0, 90, FALSE, '2026-10-19T06:48:39+00:00'),
  ('01aebea8-72c5-5b5b-8f63-3d70294e7157', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-10-19T06:50:28+00:00'),
  ('abcf6585-4f34-50bf-b88a-29bc5831848d', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-10-19T06:52:08+00:00'),
  ('ba7c4b83-6e09-56b6-882a-1546cffd44dd', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'working', 3, 6, 90.0, 120, FALSE, '2026-10-19T06:55:06+00:00'),
  ('cc8d353d-39fb-5a7a-b58d-fc94ee8b193f', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'working', 4, 6, 90.0, 150, FALSE, '2026-10-19T06:58:34+00:00'),
  ('85ca0050-a748-50c6-9efd-ee73642a44a4', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'working', 5, 6, 90.0, 90, FALSE, '2026-10-19T07:01:02+00:00'),
  ('c99b98b6-683b-5068-ae43-f0bcb881d20c', 'd0cf48f1-bdcf-5611-a3e8-26d80547c87e', 'working', 6, 6, 90.0, 150, FALSE, '2026-10-19T07:04:30+00:00'),
  ('0e47f8c5-4584-5de6-9d09-38732a423e94', '05210c7f-e324-58e6-a81d-818e891146ee', 'working', 1, 8, 48.0, 90, FALSE, '2026-10-19T07:07:04+00:00'),
  ('c32a2a3f-0409-5802-9ba8-0c50b1151ae7', '05210c7f-e324-58e6-a81d-818e891146ee', 'working', 2, 8, 48.0, 90, FALSE, '2026-10-19T07:09:38+00:00'),
  ('256faa4a-854d-5500-b414-482a7e3ddb12', '05210c7f-e324-58e6-a81d-818e891146ee', 'working', 3, 6, 48.0, 90, FALSE, '2026-10-19T07:12:06+00:00'),
  ('936eb330-d9c4-5a6d-ac25-13625d0ca5f5', '2c449328-bd43-5326-819d-8d7ac040f9d6', 'working', 1, 12, 0.0, 150, FALSE, '2026-10-19T07:15:52+00:00'),
  ('d52b11b7-c278-568b-97bf-9ea18f11ecaa', '2c449328-bd43-5326-819d-8d7ac040f9d6', 'working', 2, 15, 0.0, 60, FALSE, '2026-10-19T07:18:17+00:00'),
  ('4265b13d-944b-5b32-a85f-dd2395734c39', '2c449328-bd43-5326-819d-8d7ac040f9d6', 'working', 3, 15, 0.0, 150, FALSE, '2026-10-19T07:22:12+00:00'),
  ('bb7cc694-c677-508e-bfae-1fa8691aaf98', '2c449328-bd43-5326-819d-8d7ac040f9d6', 'working', 4, 15, 0.0, 60, FALSE, '2026-10-19T07:24:37+00:00'),
  ('a39c76b3-95f8-5548-a1b5-feec8a7103ce', '5e014e84-8f51-512c-9381-386b545dbbad', 'working', 1, 10, 40.0, 60, FALSE, '2026-10-19T07:26:47+00:00'),
  ('894efa4d-1df8-58e9-af9a-23712ad4264a', '5e014e84-8f51-512c-9381-386b545dbbad', 'working', 2, 10, 40.0, 90, FALSE, '2026-10-19T07:29:27+00:00'),
  ('1444d389-29d8-5fb9-90ea-57a0b6db555c', '5e014e84-8f51-512c-9381-386b545dbbad', 'working', 3, 10, 40.0, 120, FALSE, '2026-10-19T07:32:37+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('caf7989f-e80a-5a3a-a280-5c7a8c801632', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-10-20T06:26:00+00:00', '2026-10-20T07:23:04+00:00', 3424, 12865.0, FALSE, 84.0, 'gym', 165);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'caf7989f-e80a-5a3a-a280-5c7a8c801632', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('24a86fbf-c899-5265-9a23-f2edcf55bfca', 'caf7989f-e80a-5a3a-a280-5c7a8c801632', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('ecefc0d5-f4c1-506c-a835-2350726f566d', 'caf7989f-e80a-5a3a-a280-5c7a8c801632', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('8271e9f6-1506-5d49-8605-45ececce1366', 'caf7989f-e80a-5a3a-a280-5c7a8c801632', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('3bba987b-75f3-583d-9c9c-06540a35904f', 'caf7989f-e80a-5a3a-a280-5c7a8c801632', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0c935de8-e333-54d2-ad1f-d9b8112e9ab2', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-10-20T06:32:49+00:00'),
  ('d66f5c03-5bd1-5860-94c0-276c608acbce', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'warmup', 2, 5, 112.5, NULL, FALSE, '2026-10-20T06:34:29+00:00'),
  ('937481ca-b8b1-5ceb-85ff-8e44c4404120', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'working', 3, 5, 150.0, 150, FALSE, '2026-10-20T06:37:54+00:00'),
  ('063270c7-4ed7-5c6d-82ba-4dd3271efce3', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'working', 4, 5, 150.0, 60, FALSE, '2026-10-20T06:39:49+00:00'),
  ('84c616e6-4bdd-58cc-9af1-c71d2ef47581', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'working', 5, 5, 150.0, 60, FALSE, '2026-10-20T06:41:44+00:00'),
  ('7d62035f-d15b-5d96-8891-dddfc0ff91c6', 'd9ecd4f4-003c-5662-95fe-cf7ee12461e0', 'working', 6, 3, 150.0, 120, FALSE, '2026-10-20T06:44:33+00:00'),
  ('1c8fe647-ae1e-5906-b476-efb557048dd9', '24a86fbf-c899-5265-9a23-f2edcf55bfca', 'working', 1, 8, 110.0, 120, FALSE, '2026-10-20T06:47:37+00:00'),
  ('df007014-1264-5e24-a385-f27eabd630e1', '24a86fbf-c899-5265-9a23-f2edcf55bfca', 'working', 2, 8, 110.0, 60, FALSE, '2026-10-20T06:49:41+00:00'),
  ('6d6f5ccc-3b28-5088-b28d-7a6791e43a06', '24a86fbf-c899-5265-9a23-f2edcf55bfca', 'working', 3, 8, 110.0, 90, FALSE, '2026-10-20T06:52:15+00:00'),
  ('1f4f2dc0-5268-5140-9bb3-f6cc2866b4b6', 'ecefc0d5-f4c1-506c-a835-2350726f566d', 'working', 1, 10, 55.0, 90, FALSE, '2026-10-20T06:54:55+00:00'),
  ('86989ed5-81d3-5841-b624-62d934b11d0e', 'ecefc0d5-f4c1-506c-a835-2350726f566d', 'working', 2, 10, 55.0, 60, FALSE, '2026-10-20T06:57:05+00:00'),
  ('8d8c727f-b9ef-5301-bfd0-3e0a23c8831e', 'ecefc0d5-f4c1-506c-a835-2350726f566d', 'working', 3, 10, 55.0, 60, FALSE, '2026-10-20T06:59:15+00:00'),
  ('e52b6aaf-e925-5300-b863-d7eca5c0073f', '8271e9f6-1506-5d49-8605-45ececce1366', 'working', 1, 12, 125.0, 90, FALSE, '2026-10-20T07:02:01+00:00'),
  ('6f0d652c-2168-5187-bb97-1c152060d70f', '8271e9f6-1506-5d49-8605-45ececce1366', 'working', 2, 12, 125.0, 90, FALSE, '2026-10-20T07:04:47+00:00'),
  ('c9958f08-5353-53d5-8eb6-26553d86e983', '8271e9f6-1506-5d49-8605-45ececce1366', 'working', 3, 12, 125.0, 90, FALSE, '2026-10-20T07:07:33+00:00'),
  ('ab53e73f-f614-5ca9-9cbd-6f6ffe3a80f1', '8271e9f6-1506-5d49-8605-45ececce1366', 'failure', 4, 11, 125.0, 150, FALSE, '2026-10-20T07:11:16+00:00'),
  ('cf3cddad-29ea-56bd-a24b-c3176ba6ce25', '3bba987b-75f3-583d-9c9c-06540a35904f', 'working', 1, 15, 0.0, 90, FALSE, '2026-10-20T07:14:11+00:00'),
  ('3fe0f08e-fc4b-5a61-9199-676ffc0c9cc1', '3bba987b-75f3-583d-9c9c-06540a35904f', 'working', 2, 15, 0.0, 90, FALSE, '2026-10-20T07:17:06+00:00'),
  ('d6220bfd-9181-575c-b863-269bfa8c627e', '3bba987b-75f3-583d-9c9c-06540a35904f', 'working', 3, 16, 0.0, 90, FALSE, '2026-10-20T07:20:04+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('a92c686e-3629-50f2-b865-8c83d5dec2cc', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-10-24T06:41:00+00:00', '2026-10-24T07:28:12+00:00', 2832, 15090.0, FALSE, 84.0, 'gym', 111);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('de55b742-ddec-5676-90ea-562a27987814', 'a92c686e-3629-50f2-b865-8c83d5dec2cc', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('ac26974b-efa8-559a-b5fe-dc721995b831', 'a92c686e-3629-50f2-b865-8c83d5dec2cc', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('45f19058-5ab0-5aca-a390-02cc99cb671b', 'a92c686e-3629-50f2-b865-8c83d5dec2cc', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('b4148990-7c8e-5f72-b222-6f2df2e2c05a', 'a92c686e-3629-50f2-b865-8c83d5dec2cc', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4e1e0e99-2ffd-5fa6-bd69-0c2cb0d922d4', 'de55b742-ddec-5676-90ea-562a27987814', 'warmup', 1, 8, 85.0, NULL, FALSE, '2026-10-24T06:47:49+00:00'),
  ('ed582c7d-db04-5e0f-9115-6f3fb556883f', 'de55b742-ddec-5676-90ea-562a27987814', 'warmup', 2, 5, 130.0, NULL, FALSE, '2026-10-24T06:49:29+00:00'),
  ('03cc3de7-4adc-5f38-8ac8-c567d8cc7c8d', 'de55b742-ddec-5676-90ea-562a27987814', 'working', 3, 5, 170.0, 90, FALSE, '2026-10-24T06:51:54+00:00'),
  ('72fabe87-250a-5772-a4f2-c989c10d86ef', 'de55b742-ddec-5676-90ea-562a27987814', 'working', 4, 5, 170.0, 90, FALSE, '2026-10-24T06:54:19+00:00'),
  ('2980d62b-e2d1-59fb-b0e5-d987d2dc7d2d', 'de55b742-ddec-5676-90ea-562a27987814', 'working', 5, 5, 170.0, 60, FALSE, '2026-10-24T06:56:14+00:00'),
  ('f121599b-4643-5145-870b-ec292c367f1d', 'ac26974b-efa8-559a-b5fe-dc721995b831', 'working', 1, 8, 150.0, 150, FALSE, '2026-10-24T06:59:48+00:00'),
  ('792f81ba-47fa-51f1-ba78-4511b80bd2a5', 'ac26974b-efa8-559a-b5fe-dc721995b831', 'working', 2, 8, 150.0, 120, FALSE, '2026-10-24T07:02:52+00:00'),
  ('a6b3f02a-4d80-59bf-8feb-af73056ee949', 'ac26974b-efa8-559a-b5fe-dc721995b831', 'working', 3, 8, 150.0, 120, FALSE, '2026-10-24T07:05:56+00:00'),
  ('9818dd06-3131-5555-b88e-d4a7ddd2cb84', '45f19058-5ab0-5aca-a390-02cc99cb671b', 'working', 1, 8, 122.5, 120, FALSE, '2026-10-24T07:09:00+00:00'),
  ('48f4d9a9-b57c-59ea-b60a-a9f77a3acf03', '45f19058-5ab0-5aca-a390-02cc99cb671b', 'working', 2, 8, 122.5, 90, FALSE, '2026-10-24T07:11:34+00:00'),
  ('bb0ad3be-1589-548a-8756-ad78bc6469bc', '45f19058-5ab0-5aca-a390-02cc99cb671b', 'working', 3, 8, 122.5, 60, FALSE, '2026-10-24T07:13:38+00:00'),
  ('00639cc6-3c6c-59c5-abca-cf135cf531ee', 'b4148990-7c8e-5f72-b222-6f2df2e2c05a', 'working', 1, 12, 125.0, 90, FALSE, '2026-10-24T07:16:24+00:00'),
  ('224b3d98-e2a3-58d3-a88d-9f8a318a9617', 'b4148990-7c8e-5f72-b222-6f2df2e2c05a', 'working', 2, 12, 125.0, 60, FALSE, '2026-10-24T07:18:40+00:00'),
  ('5a3eec78-30be-5e48-9245-db3d46224fd0', 'b4148990-7c8e-5f72-b222-6f2df2e2c05a', 'working', 3, 12, 125.0, 120, FALSE, '2026-10-24T07:21:56+00:00'),
  ('f8f31153-86dd-5af0-b0b4-eb08f9b4a64a', 'b4148990-7c8e-5f72-b222-6f2df2e2c05a', 'working', 4, 12, 125.0, 120, FALSE, '2026-10-24T07:25:12+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 1', '2026-10-26T06:34:00+00:00', '2026-10-26T07:41:34+00:00', 4054, 6534.5, FALSE, 84.0, 'gym', 152);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', (SELECT id FROM exercises WHERE code = 'barbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('0d1b8f2d-48bc-5278-8255-698cded0b120', 'a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', (SELECT id FROM exercises WHERE code = 'barbell-bent-over-row' AND owner_id IS NULL), 1, 'bilateral'),
  ('3a998639-9f8d-5739-b486-445f1eb506e0', 'a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('260246f7-d26e-5519-a5d7-49e96c7cb3e6', 'a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 3, 'bilateral'),
  ('25ee2a3d-a3e9-5a74-a4bd-dd86f7d11938', 'a3bbdac6-f51f-5cd8-9dcf-b54079fc7013', (SELECT id FROM exercises WHERE code = 'skull-crusher-ez-bar' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('f2df837a-cdaf-5aa6-9b02-fb730a2cd7e0', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'warmup', 1, 8, 50.0, NULL, FALSE, '2026-10-26T06:40:49+00:00'),
  ('1a240f82-a1fe-51c5-b6ec-2d154abfbbd3', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'warmup', 2, 5, 75.0, NULL, FALSE, '2026-10-26T06:42:29+00:00'),
  ('d2253b07-2622-5447-91d6-f5edf33af235', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'working', 3, 5, 100.0, 120, FALSE, '2026-10-26T06:45:24+00:00'),
  ('6ce6fc03-641c-5b2c-bcb6-4a59955098f0', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'working', 4, 5, 100.0, 60, FALSE, '2026-10-26T06:47:19+00:00'),
  ('254c922c-9555-5472-8773-87b972f24d18', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'working', 5, 5, 100.0, 120, FALSE, '2026-10-26T06:50:14+00:00'),
  ('f12e72f0-ee84-5e2e-a01d-62c2696add10', '70c3a88b-f90d-5678-9067-ff1c8b8a18de', 'working', 6, 5, 100.0, 60, FALSE, '2026-10-26T06:52:09+00:00'),
  ('19780674-8f86-5899-bcf2-866e909a9349', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'warmup', 1, 8, 45.0, NULL, FALSE, '2026-10-26T06:53:58+00:00'),
  ('15f1ef5d-53be-5f8a-8069-ae91e6df268d', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'warmup', 2, 5, 67.5, NULL, FALSE, '2026-10-26T06:55:38+00:00'),
  ('6e13f45d-2a40-5c5c-aa84-e0fb344fc3b9', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'working', 3, 6, 90.0, 60, FALSE, '2026-10-26T06:57:36+00:00'),
  ('fb063a71-97dd-555b-9ce4-15222342c26e', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'working', 4, 6, 90.0, 90, FALSE, '2026-10-26T07:00:04+00:00'),
  ('59548a2e-6cb2-52c1-9a54-390c6b7864ce', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'working', 5, 6, 90.0, 90, FALSE, '2026-10-26T07:02:32+00:00'),
  ('10b39225-2c11-56bf-be50-bb844f03140c', '0d1b8f2d-48bc-5278-8255-698cded0b120', 'working', 6, 6, 90.0, 90, FALSE, '2026-10-26T07:05:00+00:00'),
  ('db81ad3c-4456-50dc-9ac6-0676c0145cf7', '3a998639-9f8d-5739-b486-445f1eb506e0', 'working', 1, 8, 48.0, 150, FALSE, '2026-10-26T07:08:34+00:00'),
  ('51f061e1-efc8-5dc5-a57d-77febfe7c83a', '3a998639-9f8d-5739-b486-445f1eb506e0', 'working', 2, 8, 48.0, 120, FALSE, '2026-10-26T07:11:38+00:00'),
  ('1dc10bd2-04b5-5f5c-a6b7-922723db2cec', '3a998639-9f8d-5739-b486-445f1eb506e0', 'working', 3, 8, 48.0, 90, FALSE, '2026-10-26T07:14:12+00:00'),
  ('a92e4484-308d-56f8-8723-d0dbe8e20a75', '260246f7-d26e-5519-a5d7-49e96c7cb3e6', 'working', 1, 12, 0.0, 150, FALSE, '2026-10-26T07:17:58+00:00'),
  ('7a4b6041-4255-5f22-8cf9-c4665501c53a', '260246f7-d26e-5519-a5d7-49e96c7cb3e6', 'working', 2, 12, 0.0, 150, FALSE, '2026-10-26T07:21:44+00:00'),
  ('5304cc82-0b59-575f-bd66-9204cd4c5e08', '260246f7-d26e-5519-a5d7-49e96c7cb3e6', 'working', 3, 14, 0.0, 90, FALSE, '2026-10-26T07:24:36+00:00'),
  ('a042a66b-c7b3-5660-b849-7b54249352cf', '260246f7-d26e-5519-a5d7-49e96c7cb3e6', 'working', 4, 13, 0.0, 150, FALSE, '2026-10-26T07:28:25+00:00'),
  ('0985c5d2-63ad-5dd1-87d6-fc04f0012597', '25ee2a3d-a3e9-5a74-a4bd-dd86f7d11938', 'working', 1, 10, 40.0, 120, FALSE, '2026-10-26T07:31:35+00:00'),
  ('9c1d50e7-60e7-5dc4-b69c-cbc13e21717d', '25ee2a3d-a3e9-5a74-a4bd-dd86f7d11938', 'working', 2, 10, 40.0, 120, FALSE, '2026-10-26T07:34:45+00:00'),
  ('b16387d2-6e7f-5e06-9270-f8ea55dc67a2', '25ee2a3d-a3e9-5a74-a4bd-dd86f7d11938', 'dropset', 3, 13, 32.5, 150, FALSE, '2026-10-26T07:38:34+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 1', '2026-10-27T06:40:00+00:00', '2026-10-27T07:41:43+00:00', 3703, 13322.5, FALSE, 84.0, 'gym', 168);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 0, 'bilateral'),
  ('b810ab97-a76e-5a6d-aef8-3a2a7f24d0b4', 'c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', (SELECT id FROM exercises WHERE code = 'romanian-deadlift' AND owner_id IS NULL), 1, 'bilateral'),
  ('32ef89c2-322b-57b4-a0b0-844081fe0297', 'c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', (SELECT id FROM exercises WHERE code = 'lying-leg-curl-machine' AND owner_id IS NULL), 2, 'bilateral'),
  ('01b12f5e-6299-56e4-bb94-c8a97d00609d', 'c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral'),
  ('039ee79c-63df-5b73-ac04-c2577eaa50c4', 'c2a5c8d0-afcb-5f6b-84ea-0a3ece96b182', (SELECT id FROM exercises WHERE code = 'hanging-leg-raise' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a898f75e-e999-5a28-83d9-6d661251fc0b', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'warmup', 1, 8, 75.0, NULL, FALSE, '2026-10-27T06:46:49+00:00'),
  ('721ddd8b-2b05-528a-ac28-2f599e9dc3fc', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'warmup', 2, 5, 115.0, NULL, FALSE, '2026-10-27T06:48:29+00:00'),
  ('dba00b01-fc73-5314-ad6d-58ff8a34059f', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'working', 3, 5, 152.5, 120, FALSE, '2026-10-27T06:51:24+00:00'),
  ('8b6cd388-513f-5b95-b25a-2d867fe40167', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'working', 4, 5, 152.5, 120, FALSE, '2026-10-27T06:54:19+00:00'),
  ('0cddb8a9-212c-5185-93e1-47b37127f0f3', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'working', 5, 5, 152.5, 90, FALSE, '2026-10-27T06:56:44+00:00'),
  ('87722005-debe-528c-87a0-570f6191d2e0', 'e4cfa92c-57a3-5937-8c9a-ede26fd13a12', 'working', 6, 4, 152.5, 150, FALSE, '2026-10-27T07:00:06+00:00'),
  ('82e106b7-5cbf-58eb-8f7b-d0e773dc47ab', 'b810ab97-a76e-5a6d-aef8-3a2a7f24d0b4', 'working', 1, 8, 112.5, 90, FALSE, '2026-10-27T07:02:40+00:00'),
  ('d2ed20e5-30dc-5ee9-9cd9-db80d386af9e', 'b810ab97-a76e-5a6d-aef8-3a2a7f24d0b4', 'working', 2, 8, 112.5, 150, FALSE, '2026-10-27T07:06:14+00:00'),
  ('f90dc8af-8a55-52e5-817e-7dd63aca09f4', 'b810ab97-a76e-5a6d-aef8-3a2a7f24d0b4', 'working', 3, 8, 112.5, 90, FALSE, '2026-10-27T07:08:48+00:00'),
  ('d25da8d4-5651-5b37-a98d-6ce35b88f841', '32ef89c2-322b-57b4-a0b0-844081fe0297', 'working', 1, 10, 57.5, 60, FALSE, '2026-10-27T07:10:58+00:00'),
  ('8ae277ff-bfe7-5808-9366-ac2cc62f96aa', '32ef89c2-322b-57b4-a0b0-844081fe0297', 'working', 2, 10, 57.5, 90, FALSE, '2026-10-27T07:13:38+00:00'),
  ('b9a4f0e8-c96b-5bdd-a22f-711bde4a43e3', '32ef89c2-322b-57b4-a0b0-844081fe0297', 'working', 3, 10, 57.5, 120, FALSE, '2026-10-27T07:16:48+00:00'),
  ('83186728-6780-5f80-b838-93e8d8ad828e', '01b12f5e-6299-56e4-bb94-c8a97d00609d', 'working', 1, 12, 125.0, 120, FALSE, '2026-10-27T07:20:04+00:00'),
  ('bd6f4803-8bf8-5b52-be89-bb604f705625', '01b12f5e-6299-56e4-bb94-c8a97d00609d', 'working', 2, 12, 125.0, 90, FALSE, '2026-10-27T07:22:50+00:00'),
  ('de283b4d-9c86-5043-b24a-30c46cd6ca90', '01b12f5e-6299-56e4-bb94-c8a97d00609d', 'working', 3, 12, 125.0, 90, FALSE, '2026-10-27T07:25:36+00:00'),
  ('357644c6-19f4-5734-8d47-69e1f710960b', '01b12f5e-6299-56e4-bb94-c8a97d00609d', 'working', 4, 12, 125.0, 150, FALSE, '2026-10-27T07:29:22+00:00'),
  ('bb3fc9bd-7b34-519d-9569-8ee10aa3fb20', '039ee79c-63df-5b73-ac04-c2577eaa50c4', 'working', 1, 13, 0.0, 90, FALSE, '2026-10-27T07:32:11+00:00'),
  ('7f2aa340-3ab4-5fb6-b8b5-5ddc102dd826', '039ee79c-63df-5b73-ac04-c2577eaa50c4', 'working', 2, 16, 0.0, 150, FALSE, '2026-10-27T07:36:09+00:00'),
  ('05f368d1-7497-5523-a6ea-d9644c5aa506', '039ee79c-63df-5b73-ac04-c2577eaa50c4', 'dropset', 3, 18, 0.0, 60, FALSE, '2026-10-27T07:38:43+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('3eeadad6-1f43-5152-a927-d572777ff13b', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Haut 2', '2026-10-29T06:12:00+00:00', '2026-10-29T07:14:25+00:00', 3745, 4640.0, FALSE, 84.0, 'gym', 182);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d0ff0838-9db8-543d-bc17-a14dcd5f7410', '3eeadad6-1f43-5152-a927-d572777ff13b', (SELECT id FROM exercises WHERE code = 'barbell-overhead-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('99107378-b07d-5da3-88fb-27fe151d05f2', '3eeadad6-1f43-5152-a927-d572777ff13b', (SELECT id FROM exercises WHERE code = 'pull-ups' AND owner_id IS NULL), 1, 'bilateral'),
  ('7ee78287-e525-586d-b464-7bc829719ef4', '3eeadad6-1f43-5152-a927-d572777ff13b', (SELECT id FROM exercises WHERE code = 'dumbbell-incline-bench-press' AND owner_id IS NULL), 2, 'bilateral'),
  ('15da1cc6-3d03-54da-92f7-4015154217bf', '3eeadad6-1f43-5152-a927-d572777ff13b', (SELECT id FROM exercises WHERE code = 'cable-lateral-raise' AND owner_id IS NULL), 3, 'bilateral'),
  ('277b4637-056e-5191-89b5-57c4d1f46c34', '3eeadad6-1f43-5152-a927-d572777ff13b', (SELECT id FROM exercises WHERE code = 'barbell-curl' AND owner_id IS NULL), 4, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6fd0f750-b8c3-55a1-a46e-78ec1889ec46', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'warmup', 1, 8, 32.5, NULL, FALSE, '2026-10-29T06:18:49+00:00'),
  ('f2ef946d-5be3-55e8-a815-af032bbb20b7', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'warmup', 2, 5, 50.0, NULL, FALSE, '2026-10-29T06:20:29+00:00'),
  ('8d96838a-977e-5cc3-8fb5-4e16854c568f', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'working', 3, 5, 65.0, 60, FALSE, '2026-10-29T06:22:24+00:00'),
  ('8d5d1d9d-ae33-5853-95c6-102b039220a1', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'working', 4, 5, 65.0, 90, FALSE, '2026-10-29T06:24:49+00:00'),
  ('f4ac62b5-48e3-5cdd-98af-06bc3ef24a3a', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'working', 5, 5, 65.0, 90, FALSE, '2026-10-29T06:27:14+00:00'),
  ('159c588e-4777-5233-8116-823db98efbb8', 'd0ff0838-9db8-543d-bc17-a14dcd5f7410', 'working', 6, 4, 65.0, 60, FALSE, '2026-10-29T06:29:06+00:00'),
  ('8c14b7a5-f409-599c-bdee-9e99e515fd64', '99107378-b07d-5da3-88fb-27fe151d05f2', 'working', 1, 13, 0.0, 150, FALSE, '2026-10-29T06:32:55+00:00'),
  ('fb4ce658-9c8a-5178-bcbd-647cbf89445c', '99107378-b07d-5da3-88fb-27fe151d05f2', 'working', 2, 14, 0.0, 90, FALSE, '2026-10-29T06:35:47+00:00'),
  ('dde6e689-d2ce-5f92-999b-fb4fba3d75b0', '99107378-b07d-5da3-88fb-27fe151d05f2', 'working', 3, 14, 0.0, 90, FALSE, '2026-10-29T06:38:39+00:00'),
  ('e2415059-f2ec-5a47-85e0-1aac6687c733', '99107378-b07d-5da3-88fb-27fe151d05f2', 'dropset', 4, 17, 0.0, 60, FALSE, '2026-10-29T06:41:10+00:00'),
  ('6361dff3-5a66-52b1-94e9-522b9822761e', '7ee78287-e525-586d-b464-7bc829719ef4', 'working', 1, 10, 48.0, 150, FALSE, '2026-10-29T06:44:50+00:00'),
  ('4c982312-ede9-567d-b55b-35e618ed5012', '7ee78287-e525-586d-b464-7bc829719ef4', 'working', 2, 10, 48.0, 150, FALSE, '2026-10-29T06:48:30+00:00'),
  ('d596e7f5-9d2b-5e4d-b8a6-e29959a13029', '7ee78287-e525-586d-b464-7bc829719ef4', 'working', 3, 10, 48.0, 120, FALSE, '2026-10-29T06:51:40+00:00'),
  ('8c203be4-940a-5195-b585-68a5365cb44b', '15da1cc6-3d03-54da-92f7-4015154217bf', 'working', 1, 15, 15.0, 120, FALSE, '2026-10-29T06:55:05+00:00'),
  ('3c3e6ee3-77f0-5ac4-bd1a-6d83058a5763', '15da1cc6-3d03-54da-92f7-4015154217bf', 'working', 2, 15, 15.0, 90, FALSE, '2026-10-29T06:58:00+00:00'),
  ('6c04e885-d482-5222-bb04-0fb6b67ddd87', '15da1cc6-3d03-54da-92f7-4015154217bf', 'failure', 3, 13, 15.0, 150, FALSE, '2026-10-29T07:01:49+00:00'),
  ('56303965-06b4-5c6f-acca-d01b71ef3476', '277b4637-056e-5191-89b5-57c4d1f46c34', 'working', 1, 10, 45.0, 150, FALSE, '2026-10-29T07:05:29+00:00'),
  ('b9c4f095-44d6-542d-8ed6-cd8c1fd074ca', '277b4637-056e-5191-89b5-57c4d1f46c34', 'working', 2, 10, 45.0, 60, FALSE, '2026-10-29T07:07:39+00:00'),
  ('abf44adb-8bc5-5958-b002-5e22a6bffb74', '277b4637-056e-5191-89b5-57c4d1f46c34', 'dropset', 3, 12, 35.0, 150, FALSE, '2026-10-29T07:11:25+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('b2f99fa4-a44a-5fd1-ac18-a0c33c6487b2', '81cc037c-3dde-56be-aec1-a7d8171bea63', 'Séance Bas 2', '2026-10-31T06:19:00+00:00', '2026-10-31T07:04:45+00:00', 2745, 15270.0, FALSE, 84.0, 'gym', 112);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('140e6dfd-e691-5198-8221-4b7af058643c', 'b2f99fa4-a44a-5fd1-ac18-a0c33c6487b2', (SELECT id FROM exercises WHERE code = 'barbell-deadlift' AND owner_id IS NULL), 0, 'bilateral'),
  ('7df75c6b-4592-5413-80ab-a31c14094eb1', 'b2f99fa4-a44a-5fd1-ac18-a0c33c6487b2', (SELECT id FROM exercises WHERE code = 'hip-thrust' AND owner_id IS NULL), 1, 'bilateral'),
  ('446ca489-2265-5891-9930-b6b03fc0c456', 'b2f99fa4-a44a-5fd1-ac18-a0c33c6487b2', (SELECT id FROM exercises WHERE code = 'barbell-squat' AND owner_id IS NULL), 2, 'bilateral'),
  ('aaf550b0-a418-510a-8d22-f00f83c7e5c0', 'b2f99fa4-a44a-5fd1-ac18-a0c33c6487b2', (SELECT id FROM exercises WHERE code = 'standing-calf-raise-machine' AND owner_id IS NULL), 3, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('6ddcb6ba-3549-5a14-90b1-1e5129911b88', '140e6dfd-e691-5198-8221-4b7af058643c', 'warmup', 1, 8, 85.0, NULL, FALSE, '2026-10-31T06:25:49+00:00'),
  ('d7951286-3117-581c-84b1-2d197ff18156', '140e6dfd-e691-5198-8221-4b7af058643c', 'warmup', 2, 5, 130.0, NULL, FALSE, '2026-10-31T06:27:29+00:00'),
  ('ebd4ff7c-0e02-5a61-bbf2-19b9b38e9590', '140e6dfd-e691-5198-8221-4b7af058643c', 'working', 3, 5, 170.0, 120, FALSE, '2026-10-31T06:30:24+00:00'),
  ('41ca44f0-841a-5f7d-908f-1f904144c6ff', '140e6dfd-e691-5198-8221-4b7af058643c', 'working', 4, 5, 170.0, 150, FALSE, '2026-10-31T06:33:49+00:00'),
  ('85ed36ea-ff28-54b8-a209-449e56cb57ff', '140e6dfd-e691-5198-8221-4b7af058643c', 'working', 5, 5, 170.0, 60, FALSE, '2026-10-31T06:35:44+00:00'),
  ('6416ebd2-07d4-55f5-97c0-b5742c28d654', '7df75c6b-4592-5413-80ab-a31c14094eb1', 'working', 1, 8, 150.0, 60, FALSE, '2026-10-31T06:37:48+00:00'),
  ('f3a6f85b-3e85-5521-a3b1-3bd26fa3f36e', '7df75c6b-4592-5413-80ab-a31c14094eb1', 'working', 2, 8, 150.0, 90, FALSE, '2026-10-31T06:40:22+00:00'),
  ('0b41eb39-bb5f-55bd-83f3-06abddda5ca8', '7df75c6b-4592-5413-80ab-a31c14094eb1', 'dropset', 3, 9, 120.0, 60, FALSE, '2026-10-31T06:42:29+00:00'),
  ('a00c35bf-8a67-5bc5-8d21-37a9aeec1c83', '446ca489-2265-5891-9930-b6b03fc0c456', 'working', 1, 8, 125.0, 90, FALSE, '2026-10-31T06:45:03+00:00'),
  ('e8715dc5-0952-5e4c-99d6-bac6da9ec98c', '446ca489-2265-5891-9930-b6b03fc0c456', 'working', 2, 8, 125.0, 90, FALSE, '2026-10-31T06:47:37+00:00'),
  ('513879d3-7e96-5781-b10d-61a8c3f88776', '446ca489-2265-5891-9930-b6b03fc0c456', 'working', 3, 8, 125.0, 90, FALSE, '2026-10-31T06:50:11+00:00'),
  ('8d248dd7-66b9-5b93-81cf-a7c3dc8f8400', 'aaf550b0-a418-510a-8d22-f00f83c7e5c0', 'working', 1, 12, 130.0, 90, FALSE, '2026-10-31T06:52:57+00:00'),
  ('2e7419f2-c06b-56ab-b4e8-eba0ce6896f0', 'aaf550b0-a418-510a-8d22-f00f83c7e5c0', 'working', 2, 12, 130.0, 90, FALSE, '2026-10-31T06:55:43+00:00'),
  ('45b3ad7c-51a8-54a1-9708-98639fc858e1', 'aaf550b0-a418-510a-8d22-f00f83c7e5c0', 'working', 3, 12, 130.0, 120, FALSE, '2026-10-31T06:58:59+00:00'),
  ('34259491-b02a-5f88-87ab-3747cf9e4832', 'aaf550b0-a418-510a-8d22-f00f83c7e5c0', 'failure', 4, 12, 130.0, 90, FALSE, '2026-10-31T07:01:45+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('533f6319-d23f-5f4b-a160-a485e61ad344', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-01T22:37:00+00:00', '2026-06-01T23:31:31+00:00', 3271, 2496.0, FALSE, 76.0, 'gym', 177);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('15947345-c560-574f-b6a5-5292af746fdf', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('5ff45b1c-e9bc-5f8e-8f58-05f85fdac512', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('dd74f88a-8dc2-5368-b4be-81fa5f920f45', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('54c60665-8f97-5543-933d-5a741a25070b', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('c437c78c-4841-5071-9161-7245584c033a', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('48768ac4-b0e0-5f68-87d7-0e4b39be026d', '533f6319-d23f-5f4b-a160-a485e61ad344', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('207200ac-7a97-5814-bb6e-84397b1f7799', '15947345-c560-574f-b6a5-5292af746fdf', 'working', 1, 10, 20.0, 90, FALSE, '2026-06-01T22:44:40+00:00'),
  ('12b19a55-e245-5eee-a1a2-b2ffb24839c7', '15947345-c560-574f-b6a5-5292af746fdf', 'working', 2, 10, 20.0, 90, FALSE, '2026-06-01T22:47:20+00:00'),
  ('2e0fb940-014c-51e2-b637-ca24663f2700', '15947345-c560-574f-b6a5-5292af746fdf', 'working', 3, 10, 20.0, 120, FALSE, '2026-06-01T22:50:30+00:00'),
  ('f1182dda-137c-5d64-b602-50d9231e3836', '5ff45b1c-e9bc-5f8e-8f58-05f85fdac512', 'working', 1, 12, 18.0, 60, FALSE, '2026-06-01T22:52:46+00:00'),
  ('90b884bd-4643-5d42-b6f6-8cb02f55323f', '5ff45b1c-e9bc-5f8e-8f58-05f85fdac512', 'working', 2, 12, 18.0, 60, FALSE, '2026-06-01T22:55:02+00:00'),
  ('9fc2e926-468d-5ad2-b4d9-2ba5e323b8c0', '5ff45b1c-e9bc-5f8e-8f58-05f85fdac512', 'working', 3, 12, 18.0, 90, FALSE, '2026-06-01T22:57:48+00:00'),
  ('39e83350-cfaf-580e-a1ed-4920c85af79b', 'dd74f88a-8dc2-5368-b4be-81fa5f920f45', 'working', 1, 10, 22.0, 150, FALSE, '2026-06-01T23:01:28+00:00'),
  ('1073f06c-7797-5593-afc4-d9f3364df45a', 'dd74f88a-8dc2-5368-b4be-81fa5f920f45', 'working', 2, 10, 22.0, 150, FALSE, '2026-06-01T23:05:08+00:00'),
  ('afd67bba-07b9-586a-ac60-ad8503aa4eaf', 'dd74f88a-8dc2-5368-b4be-81fa5f920f45', 'working', 3, 8, 22.0, 60, FALSE, '2026-06-01T23:07:12+00:00'),
  ('a22cb8da-e682-5166-8b66-fb030266817a', '54c60665-8f97-5543-933d-5a741a25070b', 'working', 1, 15, 0.0, 90, FALSE, '2026-06-01T23:10:07+00:00'),
  ('4de3832b-3e80-5b9d-8736-c0a35e2a0a04', '54c60665-8f97-5543-933d-5a741a25070b', 'working', 2, 16, 0.0, 60, FALSE, '2026-06-01T23:12:35+00:00'),
  ('4b8e71af-f0bb-5cd9-81dc-a7b04c96fbc7', 'c437c78c-4841-5071-9161-7245584c033a', 'working', 1, 10, 14.0, 150, FALSE, '2026-06-01T23:16:15+00:00'),
  ('4e0ef45a-1eb9-57e4-8830-c6cd964872f6', 'c437c78c-4841-5071-9161-7245584c033a', 'working', 2, 10, 14.0, 90, FALSE, '2026-06-01T23:18:55+00:00'),
  ('c3f29e07-d8b7-5ae9-a659-9c45243b6778', 'c437c78c-4841-5071-9161-7245584c033a', 'working', 3, 8, 14.0, 120, FALSE, '2026-06-01T23:21:59+00:00'),
  ('efc328da-3699-59b0-b362-48716cea8b93', '48768ac4-b0e0-5f68-87d7-0e4b39be026d', 'working', 1, 12, 10.0, 90, FALSE, '2026-06-01T23:24:45+00:00'),
  ('da5e7129-a541-5c6a-b8a1-942fcc0e5502', '48768ac4-b0e0-5f68-87d7-0e4b39be026d', 'working', 2, 12, 10.0, 150, FALSE, '2026-06-01T23:28:31+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('d83375d6-aa0e-57aa-894b-37ec2d160f9f', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-05T22:00:00+00:00', '2026-06-05T22:52:37+00:00', 3157, 2550.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8d715eb1-b3d4-5133-9cae-f4be3afbdfbf', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('f269bd37-943b-5f9e-9907-9f771c48034a', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('558118a6-1680-534d-95ec-eab426a70512', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('b999dc6e-0aea-5d47-80c9-59e5fec1526b', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('7b91f1dd-5b89-5ff2-9b1d-681b49be53c0', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('92690c8b-a655-5c01-b9fe-334d06922847', 'd83375d6-aa0e-57aa-894b-37ec2d160f9f', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('dbe3d51f-c634-5f0f-9e2e-775002a75b94', '8d715eb1-b3d4-5133-9cae-f4be3afbdfbf', 'working', 1, 10, 20.0, 90, FALSE, '2026-06-05T22:07:40+00:00'),
  ('f201c856-8c5d-5e64-b329-5f8802c4f28e', '8d715eb1-b3d4-5133-9cae-f4be3afbdfbf', 'working', 2, 10, 20.0, 60, FALSE, '2026-06-05T22:09:50+00:00'),
  ('21b8c4c5-be8b-55f6-875d-60994bfc7a4a', '8d715eb1-b3d4-5133-9cae-f4be3afbdfbf', 'working', 3, 10, 20.0, 90, FALSE, '2026-06-05T22:12:30+00:00'),
  ('7d975c42-146a-5680-9e24-62f163c3cb5c', 'f269bd37-943b-5f9e-9907-9f771c48034a', 'working', 1, 12, 18.0, 120, FALSE, '2026-06-05T22:15:46+00:00'),
  ('3941a41d-dd11-557f-9ad3-931fbce9f66d', 'f269bd37-943b-5f9e-9907-9f771c48034a', 'working', 2, 12, 18.0, 60, FALSE, '2026-06-05T22:18:02+00:00'),
  ('1be3756c-a563-50d0-b403-d89abe58a652', 'f269bd37-943b-5f9e-9907-9f771c48034a', 'working', 3, 11, 18.0, 90, FALSE, '2026-06-05T22:20:45+00:00'),
  ('065d1c98-0691-5063-a7e2-dcf4a0db4f7f', '558118a6-1680-534d-95ec-eab426a70512', 'working', 1, 10, 22.0, 120, FALSE, '2026-06-05T22:23:55+00:00'),
  ('e2b0ebf2-3b09-527d-ab98-6cf154e623bc', '558118a6-1680-534d-95ec-eab426a70512', 'working', 2, 10, 22.0, 60, FALSE, '2026-06-05T22:26:05+00:00'),
  ('4617fb58-c552-5282-9279-e977eddec68c', '558118a6-1680-534d-95ec-eab426a70512', 'working', 3, 10, 22.0, 150, FALSE, '2026-06-05T22:29:45+00:00'),
  ('652d4b35-a7d6-5d06-af78-a7a202fb88f5', 'b999dc6e-0aea-5d47-80c9-59e5fec1526b', 'working', 1, 16, 0.0, 60, FALSE, '2026-06-05T22:32:13+00:00'),
  ('8fda87d7-f632-524e-b0c3-6e7f153f11ca', 'b999dc6e-0aea-5d47-80c9-59e5fec1526b', 'working', 2, 14, 0.0, 90, FALSE, '2026-06-05T22:35:05+00:00'),
  ('e76cdc3b-e89e-5edd-b09e-e52d61d4036d', '7b91f1dd-5b89-5ff2-9b1d-681b49be53c0', 'working', 1, 10, 14.0, 150, FALSE, '2026-06-05T22:38:45+00:00'),
  ('1786ef5e-af35-5446-8223-4258553b6db9', '7b91f1dd-5b89-5ff2-9b1d-681b49be53c0', 'working', 2, 10, 14.0, 60, FALSE, '2026-06-05T22:40:55+00:00'),
  ('4ed4b968-19c9-58db-b841-5f2c1bb3ca25', '7b91f1dd-5b89-5ff2-9b1d-681b49be53c0', 'working', 3, 10, 14.0, 60, FALSE, '2026-06-05T22:43:05+00:00'),
  ('ba5f098f-92d5-5fb5-82f2-00329c30b9f2', '92690c8b-a655-5c01-b9fe-334d06922847', 'working', 1, 12, 10.0, 150, FALSE, '2026-06-05T22:46:51+00:00'),
  ('67e48011-1415-56d2-8980-a43b02442afc', '92690c8b-a655-5c01-b9fe-334d06922847', 'working', 2, 12, 10.0, 90, FALSE, '2026-06-05T22:49:37+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('665e581f-e91a-581b-82b6-dce31fad8684', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-06T22:11:00+00:00', '2026-06-06T23:06:25+00:00', 3325, 2482.0, FALSE, 76.0, 'gym', 175);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('969517d4-24c3-5c11-ac41-66ac488f2a40', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('b715f6ef-97dc-59fd-bd6f-0b70261e333b', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('4469bf07-ae3a-5742-941b-b4d34173c6be', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('8d4376cf-8034-56f7-a640-d0e5102d0f3f', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('cc0c1db8-fb7a-5f8e-b78d-3aa5ec8b845d', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('ed39c76a-86ca-56db-abab-fff07c929240', '665e581f-e91a-581b-82b6-dce31fad8684', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('67cb8173-e35a-547a-97f0-96907ac8caa3', '969517d4-24c3-5c11-ac41-66ac488f2a40', 'working', 1, 10, 20.0, 90, FALSE, '2026-06-06T22:18:40+00:00'),
  ('37f6eaad-550f-5faf-b55d-ceffaccdab3c', '969517d4-24c3-5c11-ac41-66ac488f2a40', 'working', 2, 10, 20.0, 60, FALSE, '2026-06-06T22:20:50+00:00'),
  ('31d09729-2a03-5a35-b185-f53d34963b3d', '969517d4-24c3-5c11-ac41-66ac488f2a40', 'working', 3, 8, 20.0, 90, FALSE, '2026-06-06T22:23:24+00:00'),
  ('ed7be618-3753-5dce-89c6-580a62363263', 'b715f6ef-97dc-59fd-bd6f-0b70261e333b', 'working', 1, 12, 18.0, 90, FALSE, '2026-06-06T22:26:10+00:00'),
  ('931b412e-924b-598d-bf72-2c41a1ee0d05', 'b715f6ef-97dc-59fd-bd6f-0b70261e333b', 'working', 2, 12, 18.0, 120, FALSE, '2026-06-06T22:29:26+00:00'),
  ('f1e6d916-cd75-5b57-bc83-98f81728309c', 'b715f6ef-97dc-59fd-bd6f-0b70261e333b', 'working', 3, 10, 18.0, 120, FALSE, '2026-06-06T22:32:36+00:00'),
  ('45132723-3bc6-5a28-9cc2-409e2273489a', '4469bf07-ae3a-5742-941b-b4d34173c6be', 'working', 1, 10, 22.0, 150, FALSE, '2026-06-06T22:36:16+00:00'),
  ('a3bb74db-fe16-5f96-96a8-e6006e7bc1ac', '4469bf07-ae3a-5742-941b-b4d34173c6be', 'working', 2, 10, 22.0, 120, FALSE, '2026-06-06T22:39:26+00:00'),
  ('9632e110-a41d-543d-9a75-d2471a4ccdfb', '4469bf07-ae3a-5742-941b-b4d34173c6be', 'working', 3, 10, 22.0, 120, FALSE, '2026-06-06T22:42:36+00:00'),
  ('d636d2e4-2b4c-5d30-bb42-4090eb03aec3', '8d4376cf-8034-56f7-a640-d0e5102d0f3f', 'working', 1, 15, 0.0, 60, FALSE, '2026-06-06T22:45:01+00:00'),
  ('01723ee4-2689-5219-9569-0ec7233b6899', '8d4376cf-8034-56f7-a640-d0e5102d0f3f', 'working', 2, 15, 0.0, 90, FALSE, '2026-06-06T22:47:56+00:00'),
  ('4564267a-6b01-5fbf-99fa-9975d991763d', 'cc0c1db8-fb7a-5f8e-b78d-3aa5ec8b845d', 'working', 1, 10, 14.0, 150, FALSE, '2026-06-06T22:51:36+00:00'),
  ('de9b4901-592a-5e30-a07e-317d95d096a2', 'cc0c1db8-fb7a-5f8e-b78d-3aa5ec8b845d', 'working', 2, 10, 14.0, 90, FALSE, '2026-06-06T22:54:16+00:00'),
  ('08d1d826-b99d-5a08-a388-7df81fcf5ec7', 'cc0c1db8-fb7a-5f8e-b78d-3aa5ec8b845d', 'working', 3, 10, 14.0, 150, FALSE, '2026-06-06T22:57:56+00:00'),
  ('d4c5c092-2808-5482-a627-0f53d8bcc64b', 'ed39c76a-86ca-56db-abab-fff07c929240', 'working', 1, 12, 10.0, 90, FALSE, '2026-06-06T23:00:42+00:00'),
  ('529bfb8d-2619-51da-9c40-98f25460a1fb', 'ed39c76a-86ca-56db-abab-fff07c929240', 'working', 2, 11, 10.0, 90, FALSE, '2026-06-06T23:03:25+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('9d82c91b-1a9d-50ef-afa2-3f56522aedc1', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-16T22:06:00+00:00', '2026-06-16T23:00:22+00:00', 3262, 2668.0, FALSE, 76.0, 'gym', 174);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('36725d96-54da-5e21-9492-eb618ed90e7c', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1c9854a3-d60e-540d-87a6-6e3532c549a9', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('a94a6b17-1209-5829-943f-a426478afb62', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('28254914-4dea-5477-9a68-2d7f79c97dcf', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('f31bfe4e-9409-59c6-b8b8-0e35e15ea939', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('73fab255-71a6-59ec-8b88-c5a405e6d9a7', '9d82c91b-1a9d-50ef-afa2-3f56522aedc1', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e1b8301c-e572-5209-9a89-9c3a80a61c20', '36725d96-54da-5e21-9492-eb618ed90e7c', 'working', 1, 10, 22.0, 90, FALSE, '2026-06-16T22:13:40+00:00'),
  ('86ac89dd-9c69-528a-81b2-0dbbd853febf', '36725d96-54da-5e21-9492-eb618ed90e7c', 'working', 2, 10, 22.0, 150, FALSE, '2026-06-16T22:17:20+00:00'),
  ('6196fe6c-426b-5cbf-b507-571811de9771', '36725d96-54da-5e21-9492-eb618ed90e7c', 'working', 3, 8, 22.0, 60, FALSE, '2026-06-16T22:19:24+00:00'),
  ('321eff97-bf20-50a9-948e-468c2073ca3b', '1c9854a3-d60e-540d-87a6-6e3532c549a9', 'working', 1, 12, 20.0, 90, FALSE, '2026-06-16T22:22:10+00:00'),
  ('e8821133-c60d-5f24-91ae-3880d5d5f319', '1c9854a3-d60e-540d-87a6-6e3532c549a9', 'working', 2, 12, 20.0, 90, FALSE, '2026-06-16T22:24:56+00:00'),
  ('010888fd-e108-5ca9-8939-0b2153c17134', '1c9854a3-d60e-540d-87a6-6e3532c549a9', 'working', 3, 12, 20.0, 150, FALSE, '2026-06-16T22:28:42+00:00'),
  ('7bce3b50-b055-5b5e-9196-4c7a9aee1b16', 'a94a6b17-1209-5829-943f-a426478afb62', 'working', 1, 10, 24.0, 90, FALSE, '2026-06-16T22:31:22+00:00'),
  ('5e6dcb43-13d6-5219-b3ce-da39bb902949', 'a94a6b17-1209-5829-943f-a426478afb62', 'working', 2, 10, 24.0, 90, FALSE, '2026-06-16T22:34:02+00:00'),
  ('ad632d63-b4a8-5089-8cf8-eac4dee318fc', 'a94a6b17-1209-5829-943f-a426478afb62', 'working', 3, 8, 24.0, 60, FALSE, '2026-06-16T22:36:06+00:00'),
  ('a3e7934d-869b-5a3b-ba4b-aaa025e4756a', '28254914-4dea-5477-9a68-2d7f79c97dcf', 'working', 1, 15, 0.0, 90, FALSE, '2026-06-16T22:39:01+00:00'),
  ('e393117f-d93c-55c2-9fac-b86d9bd16f07', '28254914-4dea-5477-9a68-2d7f79c97dcf', 'working', 2, 13, 0.0, 120, FALSE, '2026-06-16T22:42:20+00:00'),
  ('3eb3825e-2ae1-5835-8343-632266a3b867', 'f31bfe4e-9409-59c6-b8b8-0e35e15ea939', 'working', 1, 10, 14.0, 90, FALSE, '2026-06-16T22:45:00+00:00'),
  ('8ce3e180-cf53-56e7-b0ef-d521e7bc0b69', 'f31bfe4e-9409-59c6-b8b8-0e35e15ea939', 'working', 2, 10, 14.0, 150, FALSE, '2026-06-16T22:48:40+00:00'),
  ('343e4c34-1e8b-5f19-abd5-f11c749f93fe', 'f31bfe4e-9409-59c6-b8b8-0e35e15ea939', 'working', 3, 10, 14.0, 150, FALSE, '2026-06-16T22:52:20+00:00'),
  ('e300e935-41ce-5853-bdaf-f2b22f2f0c37', '73fab255-71a6-59ec-8b88-c5a405e6d9a7', 'working', 1, 12, 10.0, 60, FALSE, '2026-06-16T22:54:36+00:00'),
  ('dc91a074-7873-5912-b959-06ef4cdc3253', '73fab255-71a6-59ec-8b88-c5a405e6d9a7', 'working', 2, 12, 10.0, 90, FALSE, '2026-06-16T22:57:22+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c3fcb46a-2e87-5b55-8d33-9114cc143377', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-24T22:45:00+00:00', '2026-06-24T23:40:16+00:00', 3316, 2844.0, FALSE, 76.0, 'gym', 182);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('ca6b3790-8323-5155-b4aa-50d1292e80de', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('36e483f2-c924-5d90-b9a6-2475c406a308', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('e63c79ac-bb6e-5b92-a20e-8d2a6c0b5788', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('2a46f0eb-16d0-5189-b458-f620b962848d', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('f7d0012c-09b5-5529-9eb0-fdbb49db26d1', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('07f04792-f9e3-5aff-acd5-0887c728912f', 'c3fcb46a-2e87-5b55-8d33-9114cc143377', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1c12fb5b-7eb3-5d27-a579-f1edd7610e1e', 'ca6b3790-8323-5155-b4aa-50d1292e80de', 'working', 1, 10, 22.0, 90, FALSE, '2026-06-24T22:52:40+00:00'),
  ('ac7cc1de-2ac6-5427-9aaf-75e1540c8895', 'ca6b3790-8323-5155-b4aa-50d1292e80de', 'working', 2, 10, 22.0, 120, FALSE, '2026-06-24T22:55:50+00:00'),
  ('84b46c30-9fb2-5b0d-b6b3-802af1e28817', 'ca6b3790-8323-5155-b4aa-50d1292e80de', 'working', 3, 10, 22.0, 90, FALSE, '2026-06-24T22:58:30+00:00'),
  ('434a83e3-b002-5604-9bd1-848070604b16', '36e483f2-c924-5d90-b9a6-2475c406a308', 'working', 1, 12, 20.0, 90, FALSE, '2026-06-24T23:01:16+00:00'),
  ('63f409bd-0321-5fa8-a99a-dac6f1838b9d', '36e483f2-c924-5d90-b9a6-2475c406a308', 'working', 2, 12, 20.0, 90, FALSE, '2026-06-24T23:04:02+00:00'),
  ('3faecc44-05e1-54df-bbbc-e76ad08d02c7', '36e483f2-c924-5d90-b9a6-2475c406a308', 'working', 3, 12, 20.0, 120, FALSE, '2026-06-24T23:07:18+00:00'),
  ('018b2fcb-18f8-5ed5-ab38-b446731f85f4', 'e63c79ac-bb6e-5b92-a20e-8d2a6c0b5788', 'working', 1, 10, 24.0, 120, FALSE, '2026-06-24T23:10:28+00:00'),
  ('8daf9c92-4bcc-53f2-8cad-b4417deedd81', 'e63c79ac-bb6e-5b92-a20e-8d2a6c0b5788', 'working', 2, 10, 24.0, 60, FALSE, '2026-06-24T23:12:38+00:00'),
  ('55420eb2-da69-551f-8133-e460014952ca', 'e63c79ac-bb6e-5b92-a20e-8d2a6c0b5788', 'working', 3, 10, 24.0, 90, FALSE, '2026-06-24T23:15:18+00:00'),
  ('796290d8-4c01-51a7-9d75-782821aebb85', '2a46f0eb-16d0-5189-b458-f620b962848d', 'working', 1, 16, 0.0, 150, FALSE, '2026-06-24T23:19:16+00:00'),
  ('8dae9b62-ede7-5c15-919c-e90af1b58f11', '2a46f0eb-16d0-5189-b458-f620b962848d', 'working', 2, 16, 0.0, 150, FALSE, '2026-06-24T23:23:14+00:00'),
  ('319024fd-73e3-5e56-bbaf-2fbfb20fc2b7', 'f7d0012c-09b5-5529-9eb0-fdbb49db26d1', 'working', 1, 10, 16.0, 90, FALSE, '2026-06-24T23:25:54+00:00'),
  ('f155eaf6-4f6f-5afd-b718-e0cda998a749', 'f7d0012c-09b5-5529-9eb0-fdbb49db26d1', 'working', 2, 10, 16.0, 120, FALSE, '2026-06-24T23:29:04+00:00'),
  ('a7cc3e66-ca35-52b3-aa79-eb7a13b0f051', 'f7d0012c-09b5-5529-9eb0-fdbb49db26d1', 'working', 3, 10, 16.0, 90, FALSE, '2026-06-24T23:31:44+00:00'),
  ('abda00d6-cc94-5644-afd2-4ff8fc510f65', '07f04792-f9e3-5aff-acd5-0887c728912f', 'working', 1, 12, 11.0, 90, FALSE, '2026-06-24T23:34:30+00:00'),
  ('91ae03a1-1290-5a8e-a7a4-c474751e104a', '07f04792-f9e3-5aff-acd5-0887c728912f', 'working', 2, 12, 11.0, 90, FALSE, '2026-06-24T23:37:16+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1d915957-caf3-59ef-b85b-05182ae6a841', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-06-25T22:43:00+00:00', '2026-06-25T23:40:25+00:00', 3445, 2804.0, FALSE, 76.0, 'gym', 175);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('8d8a751b-aa13-5630-87f9-617e314ece5c', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('9a2a4eb4-c044-506b-802f-8cdc61eb1d6c', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('fe47f577-578a-5922-b885-d4b1beea4ff5', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('a27623d3-e81d-52a3-b4f9-237b7f06e84d', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('d34643d6-b286-51a3-b967-d8d1716a30e1', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('83ba8665-2801-59a5-b2e2-0b576c614a3b', '1d915957-caf3-59ef-b85b-05182ae6a841', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('d1c54800-65e8-588a-bda3-e56d715427a4', '8d8a751b-aa13-5630-87f9-617e314ece5c', 'working', 1, 10, 22.0, 90, FALSE, '2026-06-25T22:50:40+00:00'),
  ('63150e71-04ba-54aa-8c79-cd9018b34712', '8d8a751b-aa13-5630-87f9-617e314ece5c', 'working', 2, 10, 22.0, 150, FALSE, '2026-06-25T22:54:20+00:00'),
  ('8fd72a71-06bb-5f9e-8fda-b275fb981849', '8d8a751b-aa13-5630-87f9-617e314ece5c', 'working', 3, 10, 22.0, 60, FALSE, '2026-06-25T22:56:30+00:00'),
  ('ceeb2f76-085b-59ab-8bde-d2d0018c7aef', '9a2a4eb4-c044-506b-802f-8cdc61eb1d6c', 'working', 1, 12, 20.0, 90, FALSE, '2026-06-25T22:59:16+00:00'),
  ('ee9bec19-a86f-51b5-b18b-53779d7a78d8', '9a2a4eb4-c044-506b-802f-8cdc61eb1d6c', 'working', 2, 12, 20.0, 90, FALSE, '2026-06-25T23:02:02+00:00'),
  ('c8231458-9545-5745-884c-4a27a2121f0a', '9a2a4eb4-c044-506b-802f-8cdc61eb1d6c', 'working', 3, 10, 20.0, 120, FALSE, '2026-06-25T23:05:12+00:00'),
  ('5aaeec4d-3a0b-5298-8eba-c628f7bd20ec', 'fe47f577-578a-5922-b885-d4b1beea4ff5', 'working', 1, 10, 24.0, 150, FALSE, '2026-06-25T23:08:52+00:00'),
  ('82139093-33b9-5053-85b5-088a892da00a', 'fe47f577-578a-5922-b885-d4b1beea4ff5', 'working', 2, 10, 24.0, 120, FALSE, '2026-06-25T23:12:02+00:00'),
  ('c66bced5-9c99-5215-90ea-9fad1819ce05', 'fe47f577-578a-5922-b885-d4b1beea4ff5', 'working', 3, 10, 24.0, 90, FALSE, '2026-06-25T23:14:42+00:00'),
  ('8733012b-c1d2-5a85-8833-39bed830d959', 'a27623d3-e81d-52a3-b4f9-237b7f06e84d', 'working', 1, 14, 0.0, 90, FALSE, '2026-06-25T23:17:34+00:00'),
  ('416fd8b0-f115-5d3d-b42d-a7f8a8e57f99', 'a27623d3-e81d-52a3-b4f9-237b7f06e84d', 'working', 2, 13, 0.0, 90, FALSE, '2026-06-25T23:20:23+00:00'),
  ('d768d1ee-7be2-5736-bdd3-9d6e388dfed1', 'd34643d6-b286-51a3-b967-d8d1716a30e1', 'working', 1, 10, 16.0, 90, FALSE, '2026-06-25T23:23:03+00:00'),
  ('13e29177-9e8d-5bca-9a1c-82748c8de0b2', 'd34643d6-b286-51a3-b967-d8d1716a30e1', 'working', 2, 10, 16.0, 150, FALSE, '2026-06-25T23:26:43+00:00'),
  ('c16af689-42a7-53e4-9b55-607324f28063', 'd34643d6-b286-51a3-b967-d8d1716a30e1', 'working', 3, 10, 16.0, 150, FALSE, '2026-06-25T23:30:23+00:00'),
  ('82bdacef-d321-58c6-b648-d9c0ff180a61', '83ba8665-2801-59a5-b2e2-0b576c614a3b', 'working', 1, 12, 11.0, 120, FALSE, '2026-06-25T23:33:39+00:00'),
  ('06a8d537-4449-5a70-94a6-91929bd27488', '83ba8665-2801-59a5-b2e2-0b576c614a3b', 'working', 2, 12, 11.0, 150, FALSE, '2026-06-25T23:37:25+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-07-01T22:29:00+00:00', '2026-07-01T23:25:25+00:00', 3385, 2909.0, FALSE, 76.0, 'gym', 175);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('c47e99d8-e57a-5614-a7c9-440eac7eb32d', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('9eb25fef-76eb-5ba6-b391-c8509b26083e', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('8ec5f857-1154-53d3-9bb2-dc2dcbbbfecd', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('5241b490-f4db-57c1-a8db-bc47bf4a24af', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('fb933bcb-6d22-5d3c-b75e-f538ddc6a369', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('e3bb758c-ce04-5ce0-a510-8eb85be9f9ec', 'e3a8dfc2-9216-5ff9-8840-33cf7a470e0b', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('52f0d952-7522-5f26-ab63-c44ccf65dcfa', 'c47e99d8-e57a-5614-a7c9-440eac7eb32d', 'working', 1, 10, 24.0, 120, FALSE, '2026-07-01T22:37:10+00:00'),
  ('de9fabad-de2a-5a99-8d4b-1463a3df17d5', 'c47e99d8-e57a-5614-a7c9-440eac7eb32d', 'working', 2, 10, 24.0, 120, FALSE, '2026-07-01T22:40:20+00:00'),
  ('e8dceb2c-2b49-538f-aa83-1b545e4df3e7', 'c47e99d8-e57a-5614-a7c9-440eac7eb32d', 'working', 3, 8, 24.0, 120, FALSE, '2026-07-01T22:43:24+00:00'),
  ('b1f70bf7-d188-5577-80df-6b3f01822ceb', '9eb25fef-76eb-5ba6-b391-c8509b26083e', 'working', 1, 12, 22.0, 90, FALSE, '2026-07-01T22:46:10+00:00'),
  ('a5cca7ad-3157-503d-a53d-32e00d87e3a2', '9eb25fef-76eb-5ba6-b391-c8509b26083e', 'working', 2, 12, 22.0, 60, FALSE, '2026-07-01T22:48:26+00:00'),
  ('65fa8b7e-9d99-5884-9ddd-1a14eca5215c', '9eb25fef-76eb-5ba6-b391-c8509b26083e', 'working', 3, 12, 22.0, 150, FALSE, '2026-07-01T22:52:12+00:00'),
  ('0b668d5a-0672-5cce-92be-c53db8af2067', '8ec5f857-1154-53d3-9bb2-dc2dcbbbfecd', 'working', 1, 10, 26.0, 150, FALSE, '2026-07-01T22:55:52+00:00'),
  ('838f2c06-ae99-5659-ae38-36d10658ef33', '8ec5f857-1154-53d3-9bb2-dc2dcbbbfecd', 'working', 2, 10, 26.0, 150, FALSE, '2026-07-01T22:59:32+00:00'),
  ('65d2b7a7-268a-5996-866d-abf4a95fd34f', '8ec5f857-1154-53d3-9bb2-dc2dcbbbfecd', 'working', 3, 8, 26.0, 60, FALSE, '2026-07-01T23:01:36+00:00'),
  ('3d218e86-dc97-5ffe-9045-499c421240c1', '5241b490-f4db-57c1-a8db-bc47bf4a24af', 'working', 1, 17, 0.0, 90, FALSE, '2026-07-01T23:04:37+00:00'),
  ('78c20733-d119-55f1-b956-a87146cc3d64', '5241b490-f4db-57c1-a8db-bc47bf4a24af', 'working', 2, 14, 0.0, 150, FALSE, '2026-07-01T23:08:29+00:00'),
  ('97154f34-6b3b-5cd2-9ad1-e691a96fd303', 'fb933bcb-6d22-5d3c-b75e-f538ddc6a369', 'working', 1, 10, 16.0, 90, FALSE, '2026-07-01T23:11:09+00:00'),
  ('c335b9b2-f80d-5d6b-898a-7c1e4fe609a2', 'fb933bcb-6d22-5d3c-b75e-f538ddc6a369', 'working', 2, 10, 16.0, 90, FALSE, '2026-07-01T23:13:49+00:00'),
  ('7664a2d4-148f-5ed6-bb69-2484456a54b2', 'fb933bcb-6d22-5d3c-b75e-f538ddc6a369', 'working', 3, 9, 16.0, 120, FALSE, '2026-07-01T23:16:56+00:00'),
  ('a82db3e7-fc77-5251-a30b-1797d3e2f73d', 'e3bb758c-ce04-5ce0-a510-8eb85be9f9ec', 'working', 1, 12, 11.0, 120, FALSE, '2026-07-01T23:20:12+00:00'),
  ('81766af2-5145-56b0-b596-3aaff0c21eae', 'e3bb758c-ce04-5ce0-a510-8eb85be9f9ec', 'working', 2, 11, 11.0, 60, FALSE, '2026-07-01T23:22:25+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('5f2e2621-fccd-570a-97ca-2135036298af', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-08-13T22:13:00+00:00', '2026-08-13T23:06:55+00:00', 3235, 2680.0, FALSE, 76.0, 'gym', 175);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('caca7d0c-369a-5b79-b480-1c7171512884', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('17800da7-ad84-5fe8-9045-5fa7293e8bda', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('f3c83955-83d1-5c8e-95d7-25b081581285', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('7e18820f-e62e-5d5f-b591-f346f9793ed0', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('a9d45932-4578-50fc-85ad-84a7208d5e15', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('41a32b5d-b624-5dfb-a6cb-021c8daf4871', '5f2e2621-fccd-570a-97ca-2135036298af', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5ecb4371-32b6-597b-8404-ec3421661ed2', 'caca7d0c-369a-5b79-b480-1c7171512884', 'working', 1, 10, 22.0, 150, FALSE, '2026-08-13T22:21:40+00:00'),
  ('e72b996f-3d9b-54c9-b5a9-9ed1cd8699cd', 'caca7d0c-369a-5b79-b480-1c7171512884', 'working', 2, 10, 22.0, 90, FALSE, '2026-08-13T22:24:20+00:00'),
  ('df763300-014e-5546-ad8c-a16523519568', 'caca7d0c-369a-5b79-b480-1c7171512884', 'working', 3, 9, 22.0, 90, FALSE, '2026-08-13T22:26:57+00:00'),
  ('e4be60e6-84cb-542a-8951-78aa9a9038b0', '17800da7-ad84-5fe8-9045-5fa7293e8bda', 'working', 1, 12, 20.0, 150, FALSE, '2026-08-13T22:30:43+00:00'),
  ('89ec0b81-a6d2-5f6c-af74-cdfccd57aa62', '17800da7-ad84-5fe8-9045-5fa7293e8bda', 'working', 2, 12, 20.0, 90, FALSE, '2026-08-13T22:33:29+00:00'),
  ('bafbf6f3-59ab-5ac9-850d-2ece62467fd8', '17800da7-ad84-5fe8-9045-5fa7293e8bda', 'working', 3, 12, 20.0, 60, FALSE, '2026-08-13T22:35:45+00:00'),
  ('402257d3-d5af-5d78-900a-66ea19bab5f0', 'f3c83955-83d1-5c8e-95d7-25b081581285', 'working', 1, 10, 24.0, 90, FALSE, '2026-08-13T22:38:25+00:00'),
  ('acc5aa7a-9cd5-5a66-8620-57ab0bdec493', 'f3c83955-83d1-5c8e-95d7-25b081581285', 'working', 2, 10, 24.0, 90, FALSE, '2026-08-13T22:41:05+00:00'),
  ('879fddeb-3d29-5af7-a766-ace67ddf646e', 'f3c83955-83d1-5c8e-95d7-25b081581285', 'working', 3, 9, 24.0, 120, FALSE, '2026-08-13T22:44:12+00:00'),
  ('6ed6bb10-92c3-5cb4-839f-55f4ec6b26e3', '7e18820f-e62e-5d5f-b591-f346f9793ed0', 'working', 1, 14, 0.0, 90, FALSE, '2026-08-13T22:47:04+00:00'),
  ('e12fb4f9-7794-52a4-9471-b7863357725b', '7e18820f-e62e-5d5f-b591-f346f9793ed0', 'working', 2, 16, 0.0, 90, FALSE, '2026-08-13T22:50:02+00:00'),
  ('af299b99-53cf-5f22-ae89-84dc71e83eca', 'a9d45932-4578-50fc-85ad-84a7208d5e15', 'working', 1, 10, 14.0, 90, FALSE, '2026-08-13T22:52:42+00:00'),
  ('656d6a32-e7e1-5631-a381-b0fb4958b66d', 'a9d45932-4578-50fc-85ad-84a7208d5e15', 'working', 2, 10, 14.0, 90, FALSE, '2026-08-13T22:55:22+00:00'),
  ('968d468d-727f-5769-93a8-8be170de96ad', 'a9d45932-4578-50fc-85ad-84a7208d5e15', 'working', 3, 9, 14.0, 90, FALSE, '2026-08-13T22:57:59+00:00'),
  ('47c0aaa7-3fd1-5fcd-9962-5dc567a76200', '41a32b5d-b624-5dfb-a6cb-021c8daf4871', 'working', 1, 12, 10.0, 150, FALSE, '2026-08-13T23:01:45+00:00'),
  ('6efdf403-ddf5-5e2b-b76a-264297c33093', '41a32b5d-b624-5dfb-a6cb-021c8daf4871', 'working', 2, 10, 10.0, 60, FALSE, '2026-08-13T23:03:55+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-08-19T22:45:00+00:00', '2026-08-19T23:40:37+00:00', 3337, 2769.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('03b06988-8365-56f1-953d-75a0b609aa70', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('e6a342bb-0346-5ccb-8612-b112cb6525e6', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('63d89785-e4b2-5c05-b340-a6aa7b8faecb', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('b1b317b0-1fe8-5ade-9645-0e9f661d3646', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('8ca87bc4-e98d-5454-aab9-b8ab10644ce1', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('e6debeb3-cb0c-5697-8e69-c6b0dd96c5b2', '4d2dd6d2-8cd7-5b72-a9b5-07a4d83d88a2', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('5ad244bf-5c7a-5663-8407-c48c2a8380b2', '03b06988-8365-56f1-953d-75a0b609aa70', 'working', 1, 10, 22.0, 90, FALSE, '2026-08-19T22:52:40+00:00'),
  ('12781aa5-e2dd-5084-8405-3b00548df81e', '03b06988-8365-56f1-953d-75a0b609aa70', 'working', 2, 10, 22.0, 150, FALSE, '2026-08-19T22:56:20+00:00'),
  ('8f220027-2c76-5f42-ba9a-635820d770f2', '03b06988-8365-56f1-953d-75a0b609aa70', 'working', 3, 10, 22.0, 120, FALSE, '2026-08-19T22:59:30+00:00'),
  ('f81891df-f71a-506f-9d7b-fcb741553506', 'e6a342bb-0346-5ccb-8612-b112cb6525e6', 'working', 1, 12, 20.0, 90, FALSE, '2026-08-19T23:02:16+00:00'),
  ('8903420b-277e-5142-8cdb-e31c27e3cfa5', 'e6a342bb-0346-5ccb-8612-b112cb6525e6', 'working', 2, 12, 20.0, 90, FALSE, '2026-08-19T23:05:02+00:00'),
  ('c53786b6-b4f3-5bc1-8fc3-78d5a8bb9b4a', 'e6a342bb-0346-5ccb-8612-b112cb6525e6', 'working', 3, 10, 20.0, 60, FALSE, '2026-08-19T23:07:12+00:00'),
  ('83b079fe-f7f5-51bd-866e-a6c4b62dac8e', '63d89785-e4b2-5c05-b340-a6aa7b8faecb', 'working', 1, 10, 24.0, 120, FALSE, '2026-08-19T23:10:22+00:00'),
  ('176d04e8-fd09-58f6-b176-2e68bce3ff34', '63d89785-e4b2-5c05-b340-a6aa7b8faecb', 'working', 2, 10, 24.0, 60, FALSE, '2026-08-19T23:12:32+00:00'),
  ('0d0c587d-30c1-51d2-bc64-d73961996239', '63d89785-e4b2-5c05-b340-a6aa7b8faecb', 'working', 3, 9, 24.0, 90, FALSE, '2026-08-19T23:15:09+00:00'),
  ('b4dcd699-7d6c-5f5d-9a76-8c98c6a1cfa6', 'b1b317b0-1fe8-5ade-9645-0e9f661d3646', 'working', 1, 16, 0.0, 120, FALSE, '2026-08-19T23:18:37+00:00'),
  ('ba9b3466-2df7-5b33-8401-4e4306022481', 'b1b317b0-1fe8-5ade-9645-0e9f661d3646', 'working', 2, 17, 0.0, 120, FALSE, '2026-08-19T23:22:08+00:00'),
  ('70767b9e-995c-56d0-985e-33ef86c16630', '8ca87bc4-e98d-5454-aab9-b8ab10644ce1', 'working', 1, 10, 16.0, 90, FALSE, '2026-08-19T23:24:48+00:00'),
  ('93491fbe-7e2a-59eb-82ff-37cd61b7e42e', '8ca87bc4-e98d-5454-aab9-b8ab10644ce1', 'working', 2, 10, 16.0, 150, FALSE, '2026-08-19T23:28:28+00:00'),
  ('7b0af04d-e7df-5050-8330-6a28921524e9', '8ca87bc4-e98d-5454-aab9-b8ab10644ce1', 'working', 3, 10, 16.0, 150, FALSE, '2026-08-19T23:32:08+00:00'),
  ('4ed57b17-e2ad-58d1-a03a-84830250ec64', 'e6debeb3-cb0c-5697-8e69-c6b0dd96c5b2', 'working', 1, 12, 11.0, 90, FALSE, '2026-08-19T23:34:54+00:00'),
  ('77b3b951-049a-5ee2-9fbd-8823350038ab', 'e6debeb3-cb0c-5697-8e69-c6b0dd96c5b2', 'working', 2, 11, 11.0, 90, FALSE, '2026-08-19T23:37:37+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('413f26a2-fc9d-583f-ac11-a8ccddaba2e9', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-08-25T22:38:00+00:00', '2026-08-25T23:34:37+00:00', 3397, 3020.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('a33f3e64-6ff6-5760-b992-3e262f624e03', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('90d4bf49-370a-5e2a-9cd1-f46a64e48838', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('395bc107-c880-58d8-8e61-19fcd0d74af0', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('192e5733-200a-53dc-8d1e-195da828dd4d', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('78b01c12-1d8c-5087-9f74-5f2e5b637358', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('aba3d2c2-d5cd-5581-9572-4d8dfcbf3c8c', '413f26a2-fc9d-583f-ac11-a8ccddaba2e9', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('ab905f6a-42c6-547c-8707-ea0874b4835c', 'a33f3e64-6ff6-5760-b992-3e262f624e03', 'working', 1, 10, 24.0, 120, FALSE, '2026-08-25T22:46:10+00:00'),
  ('e5d9f67e-8a22-52a6-848b-833c261fa61c', 'a33f3e64-6ff6-5760-b992-3e262f624e03', 'working', 2, 10, 24.0, 150, FALSE, '2026-08-25T22:49:50+00:00'),
  ('50f85d95-1c4e-53c3-87ad-33910acf4622', 'a33f3e64-6ff6-5760-b992-3e262f624e03', 'working', 3, 10, 24.0, 150, FALSE, '2026-08-25T22:53:30+00:00'),
  ('6ccf037b-f001-57ca-9295-50b28dde4527', '90d4bf49-370a-5e2a-9cd1-f46a64e48838', 'working', 1, 12, 22.0, 90, FALSE, '2026-08-25T22:56:16+00:00'),
  ('54da03c8-961e-5cf0-9ab4-a6bb8c9a6ea1', '90d4bf49-370a-5e2a-9cd1-f46a64e48838', 'working', 2, 12, 22.0, 90, FALSE, '2026-08-25T22:59:02+00:00'),
  ('f22739f7-79de-503d-b168-1f4c755acfb3', '90d4bf49-370a-5e2a-9cd1-f46a64e48838', 'working', 3, 12, 22.0, 60, FALSE, '2026-08-25T23:01:18+00:00'),
  ('67fe81e9-6ea2-50a0-9bf7-7f79b26e4798', '395bc107-c880-58d8-8e61-19fcd0d74af0', 'working', 1, 10, 26.0, 90, FALSE, '2026-08-25T23:03:58+00:00'),
  ('5a7deaa2-8931-5664-b42e-e76dd49a8f40', '395bc107-c880-58d8-8e61-19fcd0d74af0', 'working', 2, 10, 26.0, 150, FALSE, '2026-08-25T23:07:38+00:00'),
  ('cfc9598a-7596-562b-9b26-de04064016e0', '395bc107-c880-58d8-8e61-19fcd0d74af0', 'working', 3, 10, 26.0, 60, FALSE, '2026-08-25T23:09:48+00:00'),
  ('81e09c13-e83c-5aa9-91cb-5beb29f35a33', '192e5733-200a-53dc-8d1e-195da828dd4d', 'working', 1, 14, 0.0, 150, FALSE, '2026-08-25T23:13:40+00:00'),
  ('3b2a4deb-7bdb-5bd2-99ec-1973039071bf', '192e5733-200a-53dc-8d1e-195da828dd4d', 'working', 2, 16, 0.0, 120, FALSE, '2026-08-25T23:17:08+00:00'),
  ('6aae0230-8d7a-5bfa-9904-3eeccc8d8d44', '78b01c12-1d8c-5087-9f74-5f2e5b637358', 'working', 1, 10, 16.0, 90, FALSE, '2026-08-25T23:19:48+00:00'),
  ('bf1efafa-8487-5f15-bd54-896c4325c6e4', '78b01c12-1d8c-5087-9f74-5f2e5b637358', 'working', 2, 10, 16.0, 150, FALSE, '2026-08-25T23:23:28+00:00'),
  ('d082c81c-0978-5906-a3a7-e95c2003a545', '78b01c12-1d8c-5087-9f74-5f2e5b637358', 'working', 3, 9, 16.0, 90, FALSE, '2026-08-25T23:26:05+00:00'),
  ('26a045b0-83f7-534d-b781-f12a177b1c1c', 'aba3d2c2-d5cd-5581-9572-4d8dfcbf3c8c', 'working', 1, 12, 11.0, 90, FALSE, '2026-08-25T23:28:51+00:00'),
  ('af64ec00-2b9d-5d7c-8cbf-0c4f7a24726e', 'aba3d2c2-d5cd-5581-9572-4d8dfcbf3c8c', 'working', 2, 12, 11.0, 90, FALSE, '2026-08-25T23:31:37+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('bcdeddf9-1281-5af5-83a1-d956354d3a29', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-08-26T22:30:00+00:00', '2026-08-26T23:27:10+00:00', 3430, 2980.0, FALSE, 76.0, 'gym', 180);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e6d88886-fae0-56d1-b4f9-73caf588660b', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('9b179af5-cb5e-5cc4-9113-8cc7910bd7b6', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('9f60287d-7965-5037-b3b7-e6b9bc6b63a1', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('c426fa06-c07a-5a83-ac26-fb7340a2ef6c', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('b8ba2331-a6a1-5b87-9168-49bfb6b34d2a', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('a8a44a5e-1667-562a-b42f-19fb9590c4e2', 'bcdeddf9-1281-5af5-83a1-d956354d3a29', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('a7a1d0ba-81e9-5050-83b5-41d526fb5e33', 'e6d88886-fae0-56d1-b4f9-73caf588660b', 'working', 1, 10, 24.0, 150, FALSE, '2026-08-26T22:38:40+00:00'),
  ('c2317e02-8605-53d1-ba34-d9f054112c86', 'e6d88886-fae0-56d1-b4f9-73caf588660b', 'working', 2, 10, 24.0, 90, FALSE, '2026-08-26T22:41:20+00:00'),
  ('eeff3dcc-aec4-5015-9953-0402d15bdd37', 'e6d88886-fae0-56d1-b4f9-73caf588660b', 'working', 3, 9, 24.0, 150, FALSE, '2026-08-26T22:44:57+00:00'),
  ('939c9e42-37ca-5d3b-b55a-99d510e5d28f', '9b179af5-cb5e-5cc4-9113-8cc7910bd7b6', 'working', 1, 12, 22.0, 120, FALSE, '2026-08-26T22:48:13+00:00'),
  ('425622ad-0809-53f2-8044-60e087ac23d4', '9b179af5-cb5e-5cc4-9113-8cc7910bd7b6', 'working', 2, 12, 22.0, 90, FALSE, '2026-08-26T22:50:59+00:00'),
  ('f4c6caf9-3fdd-5727-a455-e2ae84663aca', '9b179af5-cb5e-5cc4-9113-8cc7910bd7b6', 'working', 3, 12, 22.0, 60, FALSE, '2026-08-26T22:53:15+00:00'),
  ('a2be1e72-3292-5cb2-8dbf-5daf7e92ca2d', '9f60287d-7965-5037-b3b7-e6b9bc6b63a1', 'working', 1, 10, 26.0, 150, FALSE, '2026-08-26T22:56:55+00:00'),
  ('f41f1a92-5560-5b1f-8508-fe96adf3222d', '9f60287d-7965-5037-b3b7-e6b9bc6b63a1', 'working', 2, 10, 26.0, 90, FALSE, '2026-08-26T22:59:35+00:00'),
  ('717e8091-48d1-55be-b5e0-6ca90de47c62', '9f60287d-7965-5037-b3b7-e6b9bc6b63a1', 'working', 3, 10, 26.0, 150, FALSE, '2026-08-26T23:03:15+00:00'),
  ('42372ba4-beeb-50da-bc39-b18183e15813', 'c426fa06-c07a-5a83-ac26-fb7340a2ef6c', 'working', 1, 16, 0.0, 120, FALSE, '2026-08-26T23:06:43+00:00'),
  ('0f2e68f8-74ee-5628-8c29-f7a910bceb7b', 'c426fa06-c07a-5a83-ac26-fb7340a2ef6c', 'working', 2, 17, 0.0, 90, FALSE, '2026-08-26T23:09:44+00:00'),
  ('56860493-2b4b-5caf-bdc8-4f3eb9fcec30', 'b8ba2331-a6a1-5b87-9168-49bfb6b34d2a', 'working', 1, 10, 16.0, 90, FALSE, '2026-08-26T23:12:24+00:00'),
  ('4a9b1f74-ad22-5a2f-bdb4-d5dfc7eb0907', 'b8ba2331-a6a1-5b87-9168-49bfb6b34d2a', 'working', 2, 10, 16.0, 120, FALSE, '2026-08-26T23:15:34+00:00'),
  ('43264028-57c4-5f0f-95c9-ebd16192fc86', 'b8ba2331-a6a1-5b87-9168-49bfb6b34d2a', 'working', 3, 8, 16.0, 150, FALSE, '2026-08-26T23:19:08+00:00'),
  ('29761696-eaf4-5298-aab0-8e4b1d7cde4e', 'a8a44a5e-1667-562a-b42f-19fb9590c4e2', 'working', 1, 12, 11.0, 60, FALSE, '2026-08-26T23:21:24+00:00'),
  ('c21e672c-0456-527f-ad51-d6056510fb48', 'a8a44a5e-1667-562a-b42f-19fb9590c4e2', 'working', 2, 12, 11.0, 90, FALSE, '2026-08-26T23:24:10+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('4271375d-fbfe-5f20-b745-61585693dc9c', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-09-01T22:12:00+00:00', '2026-09-01T23:02:07+00:00', 3007, 3004.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('d06392f1-4f5e-5e73-bb47-4d726169342f', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('64079508-76dc-5961-bcc1-4d8c313ac059', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('d778b8f4-ac77-52fb-8060-fd0cf3b860e8', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('03f5846e-b616-57ab-94f7-81912ef96168', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('cc644517-6ff3-5102-a3eb-8586f8756d0b', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('d10a7f51-5727-508e-a110-194071a67678', '4271375d-fbfe-5f20-b745-61585693dc9c', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4c2e13e3-3b2a-5ea0-8b22-3366a0afa09a', 'd06392f1-4f5e-5e73-bb47-4d726169342f', 'working', 1, 10, 24.0, 60, FALSE, '2026-09-01T22:19:10+00:00'),
  ('056b1b1a-2fe9-5b8f-8360-a071833c68d8', 'd06392f1-4f5e-5e73-bb47-4d726169342f', 'working', 2, 10, 24.0, 150, FALSE, '2026-09-01T22:22:50+00:00'),
  ('ed2ca55c-a482-51e8-8c13-2f25f162d154', 'd06392f1-4f5e-5e73-bb47-4d726169342f', 'working', 3, 10, 24.0, 90, FALSE, '2026-09-01T22:25:30+00:00'),
  ('45e5592b-7a9a-5eaa-97bf-23816a2cb6a0', '64079508-76dc-5961-bcc1-4d8c313ac059', 'working', 1, 12, 22.0, 60, FALSE, '2026-09-01T22:27:46+00:00'),
  ('a63b255a-1be3-5c70-9dfa-7a2ebe307988', '64079508-76dc-5961-bcc1-4d8c313ac059', 'working', 2, 12, 22.0, 90, FALSE, '2026-09-01T22:30:32+00:00'),
  ('7a92ee64-250f-5704-8a69-3ef1b36b884c', '64079508-76dc-5961-bcc1-4d8c313ac059', 'working', 3, 12, 22.0, 60, FALSE, '2026-09-01T22:32:48+00:00'),
  ('fa31ea69-48ce-561b-a7b2-701acdf9a40d', 'd778b8f4-ac77-52fb-8060-fd0cf3b860e8', 'working', 1, 10, 26.0, 60, FALSE, '2026-09-01T22:34:58+00:00'),
  ('2bd40913-645a-5048-b8d4-8a6e3ec22eff', 'd778b8f4-ac77-52fb-8060-fd0cf3b860e8', 'working', 2, 10, 26.0, 90, FALSE, '2026-09-01T22:37:38+00:00'),
  ('cce22a08-b6f3-5c15-aab0-adf566c2b23f', 'd778b8f4-ac77-52fb-8060-fd0cf3b860e8', 'working', 3, 10, 26.0, 120, FALSE, '2026-09-01T22:40:48+00:00'),
  ('2c9fd388-d921-55e7-80c6-2c213eaf61a5', '03f5846e-b616-57ab-94f7-81912ef96168', 'working', 1, 14, 0.0, 60, FALSE, '2026-09-01T22:43:10+00:00'),
  ('f15efdac-fe34-5714-bef5-488d9682033f', '03f5846e-b616-57ab-94f7-81912ef96168', 'working', 2, 17, 0.0, 90, FALSE, '2026-09-01T22:46:11+00:00'),
  ('7edcc07b-188d-53a2-970e-61bfb04d329f', 'cc644517-6ff3-5102-a3eb-8586f8756d0b', 'working', 1, 10, 16.0, 60, FALSE, '2026-09-01T22:48:21+00:00'),
  ('c18af2a0-38fe-5e1a-b2ee-9a401bb6b32f', 'cc644517-6ff3-5102-a3eb-8586f8756d0b', 'working', 2, 10, 16.0, 60, FALSE, '2026-09-01T22:50:31+00:00'),
  ('06b2693f-0cc6-570c-847b-b24f1f815fa5', 'cc644517-6ff3-5102-a3eb-8586f8756d0b', 'working', 3, 8, 16.0, 120, FALSE, '2026-09-01T22:53:35+00:00'),
  ('d19b8955-23d5-5df6-9353-f32eabb3b3ef', 'd10a7f51-5727-508e-a110-194071a67678', 'working', 1, 12, 11.0, 90, FALSE, '2026-09-01T22:56:21+00:00'),
  ('280c9bf9-6877-564e-8ddf-566efe260d6c', 'd10a7f51-5727-508e-a110-194071a67678', 'working', 2, 12, 11.0, 90, FALSE, '2026-09-01T22:59:07+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('ba811034-0687-5ff4-91b6-b4900b616eca', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-09-09T22:15:00+00:00', '2026-09-09T23:11:46+00:00', 3406, 3250.0, FALSE, 76.0, 'gym', 182);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('e16e0d4b-82b4-5b32-8f00-5fe5e5f9e3ed', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('7f347a0c-8798-577c-a84e-1d79cbe38571', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('2670c5dc-3cc7-55fd-a4c5-16170218ebb2', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('8b02f13c-e040-5c65-b303-8ebbfb466ab0', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('85dd5e38-6ced-55b4-bfd5-4dae8c8c3b4f', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('e2832745-8ef3-5ddb-842f-3450982d1d43', 'ba811034-0687-5ff4-91b6-b4900b616eca', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4efe6c7b-4cd3-544f-bfca-b8e473401523', 'e16e0d4b-82b4-5b32-8f00-5fe5e5f9e3ed', 'working', 1, 10, 26.0, 90, FALSE, '2026-09-09T22:22:40+00:00'),
  ('5ee2dda2-93ff-5178-b2a3-fc068dc515a5', 'e16e0d4b-82b4-5b32-8f00-5fe5e5f9e3ed', 'working', 2, 10, 26.0, 60, FALSE, '2026-09-09T22:24:50+00:00'),
  ('59f49a99-ace9-5ac5-9e0c-a3f62fb1e9b3', 'e16e0d4b-82b4-5b32-8f00-5fe5e5f9e3ed', 'working', 3, 9, 26.0, 150, FALSE, '2026-09-09T22:28:27+00:00'),
  ('84e0ec31-9725-5bd0-9da4-13e9ef676724', '7f347a0c-8798-577c-a84e-1d79cbe38571', 'working', 1, 12, 24.0, 90, FALSE, '2026-09-09T22:31:13+00:00'),
  ('be927801-6fce-5dc2-9eec-96bfd3e73d5e', '7f347a0c-8798-577c-a84e-1d79cbe38571', 'working', 2, 12, 24.0, 120, FALSE, '2026-09-09T22:34:29+00:00'),
  ('be6d6de8-f2b4-57e1-aab4-c71e4ab2cb1b', '7f347a0c-8798-577c-a84e-1d79cbe38571', 'working', 3, 12, 24.0, 90, FALSE, '2026-09-09T22:37:15+00:00'),
  ('e209f3d3-0f51-5d41-b199-db98ca43d148', '2670c5dc-3cc7-55fd-a4c5-16170218ebb2', 'working', 1, 10, 28.0, 150, FALSE, '2026-09-09T22:40:55+00:00'),
  ('a5e39478-0e06-5051-a8d9-5924a40f6847', '2670c5dc-3cc7-55fd-a4c5-16170218ebb2', 'working', 2, 10, 28.0, 90, FALSE, '2026-09-09T22:43:35+00:00'),
  ('90cdfa55-a81a-53b6-8fbb-427bd25ff13c', '2670c5dc-3cc7-55fd-a4c5-16170218ebb2', 'working', 3, 10, 28.0, 90, FALSE, '2026-09-09T22:46:15+00:00'),
  ('eec57719-8369-5bde-aafb-1169e6c5a122', '8b02f13c-e040-5c65-b303-8ebbfb466ab0', 'working', 1, 17, 0.0, 150, FALSE, '2026-09-09T22:50:16+00:00'),
  ('11656d3c-9516-57a9-8b2e-5a9f82c031d6', '8b02f13c-e040-5c65-b303-8ebbfb466ab0', 'working', 2, 18, 0.0, 90, FALSE, '2026-09-09T22:53:20+00:00'),
  ('62ad5951-4280-568f-8485-ccf6d0c06ac8', '85dd5e38-6ced-55b4-bfd5-4dae8c8c3b4f', 'working', 1, 10, 18.0, 120, FALSE, '2026-09-09T22:56:30+00:00'),
  ('3d1bd6e8-3141-5980-b5f2-d08604e707d3', '85dd5e38-6ced-55b4-bfd5-4dae8c8c3b4f', 'working', 2, 10, 18.0, 150, FALSE, '2026-09-09T23:00:10+00:00'),
  ('dc58473a-b061-5ff3-9b12-a58cf0768e4a', '85dd5e38-6ced-55b4-bfd5-4dae8c8c3b4f', 'working', 3, 8, 18.0, 90, FALSE, '2026-09-09T23:02:44+00:00'),
  ('d07c867d-bbfb-5e56-a944-343d45044fbf', 'e2832745-8ef3-5ddb-842f-3450982d1d43', 'working', 1, 12, 12.0, 150, FALSE, '2026-09-09T23:06:30+00:00'),
  ('60fabd9c-9ce5-5bc2-90ee-ee4062654caf', 'e2832745-8ef3-5ddb-842f-3450982d1d43', 'working', 2, 12, 12.0, 60, FALSE, '2026-09-09T23:08:46+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('88b28e18-e48d-5162-9c14-f05098fa1be5', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-09-15T22:24:00+00:00', '2026-09-15T23:17:07+00:00', 3187, 3274.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('52bc03b2-0981-5288-8cb5-8a28b3d7ab8c', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('09f81640-adfb-59a0-8896-d571941efc98', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('99b9a7c4-fcc4-5f60-86e9-9a0255cdb622', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('861d31e2-825a-5447-a043-8d60c442632a', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('20c1d06e-8bb5-5d06-b151-9445d2de6f4a', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('dd206fd9-fabd-5259-8305-b46c8354ecfa', '88b28e18-e48d-5162-9c14-f05098fa1be5', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('4b9d411d-92e5-5969-8630-eef494fa5984', '52bc03b2-0981-5288-8cb5-8a28b3d7ab8c', 'working', 1, 10, 26.0, 90, FALSE, '2026-09-15T22:31:40+00:00'),
  ('96cd1a3b-537d-52a1-aef6-b9e53b5e38f6', '52bc03b2-0981-5288-8cb5-8a28b3d7ab8c', 'working', 2, 10, 26.0, 90, FALSE, '2026-09-15T22:34:20+00:00'),
  ('3a50dd58-677a-53fa-bd01-cb978c6e56e6', '52bc03b2-0981-5288-8cb5-8a28b3d7ab8c', 'working', 3, 9, 26.0, 120, FALSE, '2026-09-15T22:37:27+00:00'),
  ('bd74c263-4cab-5d16-ae66-e01d6b711205', '09f81640-adfb-59a0-8896-d571941efc98', 'working', 1, 12, 24.0, 60, FALSE, '2026-09-15T22:39:43+00:00'),
  ('257dceed-aa4e-5034-8ffe-6d4c0c14c212', '09f81640-adfb-59a0-8896-d571941efc98', 'working', 2, 12, 24.0, 60, FALSE, '2026-09-15T22:41:59+00:00'),
  ('8060c6c9-bcf4-580a-ba00-6f669d442a01', '09f81640-adfb-59a0-8896-d571941efc98', 'working', 3, 12, 24.0, 60, FALSE, '2026-09-15T22:44:15+00:00'),
  ('09e93363-b17f-5667-8dc8-d556d11ab408', '99b9a7c4-fcc4-5f60-86e9-9a0255cdb622', 'working', 1, 10, 28.0, 60, FALSE, '2026-09-15T22:46:25+00:00'),
  ('5b99db0a-7f08-53aa-a661-e4131216e6f5', '99b9a7c4-fcc4-5f60-86e9-9a0255cdb622', 'working', 2, 10, 28.0, 120, FALSE, '2026-09-15T22:49:35+00:00'),
  ('b936a68f-3304-5f70-9e2c-0177f286734e', '99b9a7c4-fcc4-5f60-86e9-9a0255cdb622', 'working', 3, 10, 28.0, 150, FALSE, '2026-09-15T22:53:15+00:00'),
  ('9b7f19ee-e1ff-5d3d-8bad-d20b8ede92bb', '861d31e2-825a-5447-a043-8d60c442632a', 'working', 1, 15, 0.0, 90, FALSE, '2026-09-15T22:56:10+00:00'),
  ('98403a90-7ac4-5b2b-aa5b-3f3c883f60f4', '861d31e2-825a-5447-a043-8d60c442632a', 'working', 2, 16, 0.0, 60, FALSE, '2026-09-15T22:58:38+00:00'),
  ('742901a2-fa9b-5711-a7e0-59465c9cb9f0', '20c1d06e-8bb5-5d06-b151-9445d2de6f4a', 'working', 1, 10, 18.0, 90, FALSE, '2026-09-15T23:01:18+00:00'),
  ('8560c755-608e-539b-9998-606ff990f237', '20c1d06e-8bb5-5d06-b151-9445d2de6f4a', 'working', 2, 10, 18.0, 150, FALSE, '2026-09-15T23:04:58+00:00'),
  ('9bdf0cc8-5eda-5870-9df5-a07416dec9c3', '20c1d06e-8bb5-5d06-b151-9445d2de6f4a', 'working', 3, 10, 18.0, 150, FALSE, '2026-09-15T23:08:38+00:00'),
  ('cf9e7555-8408-514a-903b-acb67c60a2ab', 'dd206fd9-fabd-5259-8305-b46c8354ecfa', 'working', 1, 12, 12.0, 90, FALSE, '2026-09-15T23:11:24+00:00'),
  ('988ad86e-ae69-57de-a30f-716488330dd0', 'dd206fd9-fabd-5259-8305-b46c8354ecfa', 'working', 2, 11, 12.0, 90, FALSE, '2026-09-15T23:14:07+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('1777ee2b-7745-5427-8083-b9d69f4399e3', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-09-19T22:40:00+00:00', '2026-09-19T23:31:13+00:00', 3073, 3260.0, FALSE, 76.0, 'gym', 181);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('89275b23-9f55-55e5-81bf-d5e86893a387', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('20b4223a-3de4-5438-84a2-d1f63c5bf086', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('10a53767-0009-5675-8f37-f74116a7cd76', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('5d720c68-f13a-5947-b812-cc79f53ee592', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('0e5e62d0-02d7-5cd2-bcbf-90e5d7874cbc', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('75656509-dcfb-5186-b51f-c4c0e17e682b', '1777ee2b-7745-5427-8083-b9d69f4399e3', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('2f788b88-82d6-51d2-8405-e9f6dcec311a', '89275b23-9f55-55e5-81bf-d5e86893a387', 'working', 1, 10, 26.0, 60, FALSE, '2026-09-19T22:47:10+00:00'),
  ('15ed816f-da50-5586-b03d-44564f9e2e17', '89275b23-9f55-55e5-81bf-d5e86893a387', 'working', 2, 10, 26.0, 90, FALSE, '2026-09-19T22:49:50+00:00'),
  ('2138102c-6cc2-5522-a4d5-42cb074e72b3', '89275b23-9f55-55e5-81bf-d5e86893a387', 'working', 3, 8, 26.0, 90, FALSE, '2026-09-19T22:52:24+00:00'),
  ('0b5f4fcb-2506-5dd8-bc2f-c8eafb0f9851', '20b4223a-3de4-5438-84a2-d1f63c5bf086', 'working', 1, 12, 24.0, 60, FALSE, '2026-09-19T22:54:40+00:00'),
  ('739de997-72b6-59a8-94e0-1bf397322e1c', '20b4223a-3de4-5438-84a2-d1f63c5bf086', 'working', 2, 12, 24.0, 120, FALSE, '2026-09-19T22:57:56+00:00'),
  ('e82b3b0f-05bd-5258-bb76-b164e9cb3585', '20b4223a-3de4-5438-84a2-d1f63c5bf086', 'working', 3, 12, 24.0, 120, FALSE, '2026-09-19T23:01:12+00:00'),
  ('3d35abbd-8f24-5971-941b-54cfd3c52250', '10a53767-0009-5675-8f37-f74116a7cd76', 'working', 1, 10, 28.0, 120, FALSE, '2026-09-19T23:04:22+00:00'),
  ('e597727a-40fd-577e-9a02-289ea99ab156', '10a53767-0009-5675-8f37-f74116a7cd76', 'working', 2, 10, 28.0, 150, FALSE, '2026-09-19T23:08:02+00:00'),
  ('785a5e4f-f2aa-5645-aef8-ccaa8c22ca4d', '10a53767-0009-5675-8f37-f74116a7cd76', 'working', 3, 10, 28.0, 60, FALSE, '2026-09-19T23:10:12+00:00'),
  ('532ca3cc-3a02-50d0-ab48-9f9c56ceba94', '5d720c68-f13a-5947-b812-cc79f53ee592', 'working', 1, 16, 0.0, 60, FALSE, '2026-09-19T23:12:40+00:00'),
  ('28e9ae74-63d1-50f5-80c1-8e98ac0bb443', '5d720c68-f13a-5947-b812-cc79f53ee592', 'working', 2, 17, 0.0, 60, FALSE, '2026-09-19T23:15:11+00:00'),
  ('e5053b40-c356-568c-b96c-d315ab9c5ae3', '0e5e62d0-02d7-5cd2-bcbf-90e5d7874cbc', 'working', 1, 10, 18.0, 60, FALSE, '2026-09-19T23:17:21+00:00'),
  ('6e9e900e-a30a-5ac1-9c17-9391e55bbfe5', '0e5e62d0-02d7-5cd2-bcbf-90e5d7874cbc', 'working', 2, 10, 18.0, 90, FALSE, '2026-09-19T23:20:01+00:00'),
  ('989dac34-06af-5d34-ac5d-aee9b748b750', '0e5e62d0-02d7-5cd2-bcbf-90e5d7874cbc', 'working', 3, 10, 18.0, 60, FALSE, '2026-09-19T23:22:11+00:00'),
  ('ef32a7d6-7ff6-5b86-ba1f-1f9c4c0f6f82', '75656509-dcfb-5186-b51f-c4c0e17e682b', 'working', 1, 12, 12.0, 90, FALSE, '2026-09-19T23:24:57+00:00'),
  ('595b2ab5-f2c7-57ee-8c78-59154dc19f8c', '75656509-dcfb-5186-b51f-c4c0e17e682b', 'working', 2, 12, 12.0, 120, FALSE, '2026-09-19T23:28:13+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('7175c91c-cbc2-5f8d-b04e-d2720da8ab77', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-09-20T22:43:00+00:00', '2026-09-20T23:39:43+00:00', 3403, 3418.0, FALSE, 76.0, 'gym', 181);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('abce8663-13bf-54a5-8e7b-7702a25d5ad9', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('dce87024-aa63-5a6f-ae24-63195473cbda', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('32d59dc3-c941-533e-bfed-3847606b511c', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('0aa2d2aa-053f-5f50-be7d-9ac52b616b2b', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('edffd9e4-c533-5dd2-85ba-1bf4f065846e', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('41bb66d9-1384-50cb-93f7-e637a1e58bbf', '7175c91c-cbc2-5f8d-b04e-d2720da8ab77', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('c40dbff6-8cc2-508e-8add-0ddd1d5fa527', 'abce8663-13bf-54a5-8e7b-7702a25d5ad9', 'working', 1, 10, 28.0, 150, FALSE, '2026-09-20T22:51:40+00:00'),
  ('41c0d520-d34e-5353-8246-d9913e9dc5cf', 'abce8663-13bf-54a5-8e7b-7702a25d5ad9', 'working', 2, 10, 28.0, 90, FALSE, '2026-09-20T22:54:20+00:00'),
  ('fdd22eef-6d8b-52d0-9cca-57eb62d27cf3', 'abce8663-13bf-54a5-8e7b-7702a25d5ad9', 'working', 3, 10, 28.0, 150, FALSE, '2026-09-20T22:58:00+00:00'),
  ('a0d220b8-ad5c-5b64-a074-55ebbc757541', 'dce87024-aa63-5a6f-ae24-63195473cbda', 'working', 1, 12, 26.0, 150, FALSE, '2026-09-20T23:01:46+00:00'),
  ('6639841a-6eb0-54d2-a94b-822bf83244f3', 'dce87024-aa63-5a6f-ae24-63195473cbda', 'working', 2, 12, 26.0, 120, FALSE, '2026-09-20T23:05:02+00:00'),
  ('4f3c0e88-345e-56db-a8be-b2ad685d6cb5', 'dce87024-aa63-5a6f-ae24-63195473cbda', 'working', 3, 11, 26.0, 150, FALSE, '2026-09-20T23:08:45+00:00'),
  ('b40c5d72-b911-55cd-b547-c3300d0972f0', '32d59dc3-c941-533e-bfed-3847606b511c', 'working', 1, 10, 28.0, 90, FALSE, '2026-09-20T23:11:25+00:00'),
  ('5742cb7d-33bb-595c-8993-2e61c9527946', '32d59dc3-c941-533e-bfed-3847606b511c', 'working', 2, 10, 28.0, 90, FALSE, '2026-09-20T23:14:05+00:00'),
  ('30225668-bfd8-5736-8d2c-6a66da920167', '32d59dc3-c941-533e-bfed-3847606b511c', 'working', 3, 10, 28.0, 90, FALSE, '2026-09-20T23:16:45+00:00'),
  ('1f1f1446-4ecc-5ede-a0f6-8f1fd0613713', '0aa2d2aa-053f-5f50-be7d-9ac52b616b2b', 'working', 1, 16, 0.0, 150, FALSE, '2026-09-20T23:20:43+00:00'),
  ('5cede326-208a-5395-94f4-0aeb8c5b2d37', '0aa2d2aa-053f-5f50-be7d-9ac52b616b2b', 'working', 2, 16, 0.0, 90, FALSE, '2026-09-20T23:23:41+00:00'),
  ('34faf283-3dc9-5d8a-95af-780fe8ac3455', 'edffd9e4-c533-5dd2-85ba-1bf4f065846e', 'working', 1, 10, 18.0, 60, FALSE, '2026-09-20T23:25:51+00:00'),
  ('b78b5327-2cfa-5708-9ad7-0426081a7fc2', 'edffd9e4-c533-5dd2-85ba-1bf4f065846e', 'working', 2, 10, 18.0, 120, FALSE, '2026-09-20T23:29:01+00:00'),
  ('efea25ea-75eb-5f43-a1f6-9ab45a79e14a', 'edffd9e4-c533-5dd2-85ba-1bf4f065846e', 'working', 3, 10, 18.0, 90, FALSE, '2026-09-20T23:31:41+00:00'),
  ('5227b67c-c1cd-5aff-983a-bb6db017fb1f', '41bb66d9-1384-50cb-93f7-e637a1e58bbf', 'working', 1, 12, 12.0, 60, FALSE, '2026-09-20T23:33:57+00:00'),
  ('1eaf1e22-9f90-5778-9e2e-ff3a53852911', '41bb66d9-1384-50cb-93f7-e637a1e58bbf', 'working', 2, 12, 12.0, 90, FALSE, '2026-09-20T23:36:43+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-10-12T22:36:00+00:00', '2026-10-12T23:28:40+00:00', 3160, 2976.0, FALSE, 76.0, 'gym', 180);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('bad62ba4-a483-5094-9399-c28c42a0f3a4', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('7b6b5201-4d84-5fb7-b09d-f685790eb1dd', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('2ac9a62e-a71e-5bb1-ad51-6cfd11880432', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('fc875a62-a079-5159-8fed-98d95b55a5c1', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('c029092d-057f-5f40-b0f8-84bed421a999', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('cbe8604b-0608-5da7-8c23-6ab8e4eac6e9', 'c439bcf3-ca7d-591f-9bb5-6fb683d0a80f', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('1aedecc4-9fa0-5b25-8f29-d13701e1d481', 'bad62ba4-a483-5094-9399-c28c42a0f3a4', 'working', 1, 10, 24.0, 120, FALSE, '2026-10-12T22:44:10+00:00'),
  ('63d95970-2a9b-590f-9433-e16f7d9a228f', 'bad62ba4-a483-5094-9399-c28c42a0f3a4', 'working', 2, 10, 24.0, 90, FALSE, '2026-10-12T22:46:50+00:00'),
  ('5f178fe2-3f4d-5970-906d-5944b8fc7f1b', 'bad62ba4-a483-5094-9399-c28c42a0f3a4', 'working', 3, 9, 24.0, 90, FALSE, '2026-10-12T22:49:27+00:00'),
  ('36badf35-02e3-594f-9cbf-7c2311bc1249', '7b6b5201-4d84-5fb7-b09d-f685790eb1dd', 'working', 1, 12, 22.0, 90, FALSE, '2026-10-12T22:52:13+00:00'),
  ('ba2bdd1e-3b97-52cb-8e7f-4e2aabeaf3b5', '7b6b5201-4d84-5fb7-b09d-f685790eb1dd', 'working', 2, 12, 22.0, 60, FALSE, '2026-10-12T22:54:29+00:00'),
  ('b62b881c-0996-5640-a7b8-a07fc8406d21', '7b6b5201-4d84-5fb7-b09d-f685790eb1dd', 'working', 3, 10, 22.0, 60, FALSE, '2026-10-12T22:56:39+00:00'),
  ('f105cf68-30d3-5fad-82db-084b9f8b245d', '2ac9a62e-a71e-5bb1-ad51-6cfd11880432', 'working', 1, 10, 26.0, 120, FALSE, '2026-10-12T22:59:49+00:00'),
  ('f9a05aba-4699-5674-a4e6-f304eedcb524', '2ac9a62e-a71e-5bb1-ad51-6cfd11880432', 'working', 2, 10, 26.0, 60, FALSE, '2026-10-12T23:01:59+00:00'),
  ('6f8acbbf-9cf2-58b4-9066-86120fad0219', '2ac9a62e-a71e-5bb1-ad51-6cfd11880432', 'working', 3, 8, 26.0, 120, FALSE, '2026-10-12T23:05:03+00:00'),
  ('3215b115-82b1-5044-9b4a-295aa21669bd', 'fc875a62-a079-5159-8fed-98d95b55a5c1', 'working', 1, 18, 0.0, 150, FALSE, '2026-10-12T23:09:07+00:00'),
  ('e0c2cd3b-7bc1-516a-a4b0-3173ace0c1ab', 'fc875a62-a079-5159-8fed-98d95b55a5c1', 'working', 2, 17, 0.0, 60, FALSE, '2026-10-12T23:11:38+00:00'),
  ('81032863-0ca1-5b8e-83ec-1974dcac0ae8', 'c029092d-057f-5f40-b0f8-84bed421a999', 'working', 1, 10, 18.0, 120, FALSE, '2026-10-12T23:14:48+00:00'),
  ('a935e570-69c6-59dd-9b84-2b79008a58e3', 'c029092d-057f-5f40-b0f8-84bed421a999', 'working', 2, 10, 18.0, 90, FALSE, '2026-10-12T23:17:28+00:00'),
  ('ff29a1a6-8979-598c-b61f-07280204caba', 'c029092d-057f-5f40-b0f8-84bed421a999', 'working', 3, 10, 18.0, 60, FALSE, '2026-10-12T23:19:38+00:00'),
  ('f77e4b3e-1687-5a4c-9991-4d4e8dbd9124', 'cbe8604b-0608-5da7-8c23-6ab8e4eac6e9', 'working', 1, 12, 11.0, 120, FALSE, '2026-10-12T23:22:54+00:00'),
  ('06c7e1b4-16b0-5262-9caf-35e413b118fb', 'cbe8604b-0608-5da7-8c23-6ab8e4eac6e9', 'working', 2, 12, 11.0, 90, FALSE, '2026-10-12T23:25:40+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('19a9a643-4594-5127-a65d-8d08870ee170', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-10-23T22:03:00+00:00', '2026-10-23T22:56:07+00:00', 3187, 3050.0, FALSE, 76.0, 'gym', 179);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('23b92884-4eb6-5b32-99eb-f871dee63895', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('c8c26a67-f39f-5d4b-af66-4315636f6081', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('174fe89b-d41b-5d29-979e-285a3b29dc90', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('8879f162-9b2d-5455-94a7-8cc629424a0a', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('5ef94f74-13b5-583b-8ae1-662dcce59516', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('f322d6c5-c30e-57a0-81ff-a5110ec4fb5a', '19a9a643-4594-5127-a65d-8d08870ee170', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('345ecc9a-511d-553b-b2b9-91447e428b64', '23b92884-4eb6-5b32-99eb-f871dee63895', 'working', 1, 10, 24.0, 90, FALSE, '2026-10-23T22:10:40+00:00'),
  ('0b71efe7-a1ef-58bf-a9a6-dcf7cbb5b8b5', '23b92884-4eb6-5b32-99eb-f871dee63895', 'working', 2, 10, 24.0, 150, FALSE, '2026-10-23T22:14:20+00:00'),
  ('b35ded63-b637-5814-b853-ef836e8ec61e', '23b92884-4eb6-5b32-99eb-f871dee63895', 'working', 3, 9, 24.0, 90, FALSE, '2026-10-23T22:16:57+00:00'),
  ('8931303c-03e0-5545-8aa5-ebcd45012410', 'c8c26a67-f39f-5d4b-af66-4315636f6081', 'working', 1, 12, 22.0, 90, FALSE, '2026-10-23T22:19:43+00:00'),
  ('cd97398b-a086-52a6-9d85-cc90a3d80ec3', 'c8c26a67-f39f-5d4b-af66-4315636f6081', 'working', 2, 12, 22.0, 60, FALSE, '2026-10-23T22:21:59+00:00'),
  ('7dd580dd-21cb-5bd5-b431-d18d234f7612', 'c8c26a67-f39f-5d4b-af66-4315636f6081', 'working', 3, 12, 22.0, 90, FALSE, '2026-10-23T22:24:45+00:00'),
  ('85230c92-12d9-5da4-b0b8-ac467b7771a6', '174fe89b-d41b-5d29-979e-285a3b29dc90', 'working', 1, 10, 26.0, 90, FALSE, '2026-10-23T22:27:25+00:00'),
  ('a82938c8-cf30-5c6e-b261-6a6466b20d60', '174fe89b-d41b-5d29-979e-285a3b29dc90', 'working', 2, 10, 26.0, 60, FALSE, '2026-10-23T22:29:35+00:00'),
  ('a8b4791d-ee55-5ad0-9ae7-562ecccf7716', '174fe89b-d41b-5d29-979e-285a3b29dc90', 'working', 3, 10, 26.0, 90, FALSE, '2026-10-23T22:32:15+00:00'),
  ('62c80076-a861-59de-b73a-e30b6f8b5494', '8879f162-9b2d-5455-94a7-8cc629424a0a', 'working', 1, 16, 0.0, 90, FALSE, '2026-10-23T22:35:13+00:00'),
  ('ebacf304-fe79-5728-b152-e79324e7bf1f', '8879f162-9b2d-5455-94a7-8cc629424a0a', 'working', 2, 16, 0.0, 120, FALSE, '2026-10-23T22:38:41+00:00'),
  ('4b1538d4-7c24-53df-a177-5a3b6945ae35', '5ef94f74-13b5-583b-8ae1-662dcce59516', 'working', 1, 10, 18.0, 90, FALSE, '2026-10-23T22:41:21+00:00'),
  ('20974a59-c02f-5373-b875-fb8802a166e0', '5ef94f74-13b5-583b-8ae1-662dcce59516', 'working', 2, 10, 18.0, 150, FALSE, '2026-10-23T22:45:01+00:00'),
  ('f5351645-7eea-5dd2-8e3c-30d027e03b84', '5ef94f74-13b5-583b-8ae1-662dcce59516', 'working', 3, 10, 18.0, 60, FALSE, '2026-10-23T22:47:11+00:00'),
  ('8e7a7f51-9add-5971-b64e-eb6a81557659', 'f322d6c5-c30e-57a0-81ff-a5110ec4fb5a', 'working', 1, 12, 11.0, 60, FALSE, '2026-10-23T22:49:27+00:00'),
  ('35d05f5e-0299-5e16-9136-50801a9a1a36', 'f322d6c5-c30e-57a0-81ff-a5110ec4fb5a', 'working', 2, 10, 11.0, 150, FALSE, '2026-10-23T22:53:07+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('abbd5371-d6e4-59c7-80a8-d9222efe00cb', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-10-27T22:16:00+00:00', '2026-10-27T23:12:58+00:00', 3418, 3264.0, FALSE, 76.0, 'gym', 186);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('3d5f2239-f2c5-5ffa-922f-320269f545b4', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('82abe240-10cb-5cbe-aa9d-b84ad42c577d', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('a3006ce6-556a-5f9d-bc93-0e1c2fe18410', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('3a946769-431b-521a-bfe1-3ba4a9861e43', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('45afdb96-b2ed-54fe-b79c-a0ccf1d6e943', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('4b0d9239-96ef-56ff-8292-665b4a2bc038', 'abbd5371-d6e4-59c7-80a8-d9222efe00cb', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('0ed7e527-a320-58b9-b7ee-f58e1832934f', '3d5f2239-f2c5-5ffa-922f-320269f545b4', 'working', 1, 10, 26.0, 60, FALSE, '2026-10-27T22:23:10+00:00'),
  ('4172fbce-1c01-5242-a59b-dbce00b71072', '3d5f2239-f2c5-5ffa-922f-320269f545b4', 'working', 2, 10, 26.0, 60, FALSE, '2026-10-27T22:25:20+00:00'),
  ('fd92db17-fc4e-55f4-ba18-5bed4d9830a1', '3d5f2239-f2c5-5ffa-922f-320269f545b4', 'working', 3, 10, 26.0, 90, FALSE, '2026-10-27T22:28:00+00:00'),
  ('a3751809-48a0-51cd-85cf-b2320f846d29', '82abe240-10cb-5cbe-aa9d-b84ad42c577d', 'working', 1, 12, 24.0, 150, FALSE, '2026-10-27T22:31:46+00:00'),
  ('313f4ead-3e6a-562e-b9ee-9105d1dadda0', '82abe240-10cb-5cbe-aa9d-b84ad42c577d', 'working', 2, 12, 24.0, 90, FALSE, '2026-10-27T22:34:32+00:00'),
  ('34015a31-3b24-54af-97ce-30dd6aac136c', '82abe240-10cb-5cbe-aa9d-b84ad42c577d', 'working', 3, 11, 24.0, 90, FALSE, '2026-10-27T22:37:15+00:00'),
  ('d2007555-f584-51bd-a608-82b70c5de300', 'a3006ce6-556a-5f9d-bc93-0e1c2fe18410', 'working', 1, 10, 28.0, 150, FALSE, '2026-10-27T22:40:55+00:00'),
  ('beb003fd-5a20-5fc6-95ae-fe51bcbba492', 'a3006ce6-556a-5f9d-bc93-0e1c2fe18410', 'working', 2, 10, 28.0, 120, FALSE, '2026-10-27T22:44:05+00:00'),
  ('33f201ed-70dd-5fcf-bdb7-c1d439509fe5', 'a3006ce6-556a-5f9d-bc93-0e1c2fe18410', 'working', 3, 10, 28.0, 90, FALSE, '2026-10-27T22:46:45+00:00'),
  ('b6b3cc44-b435-54e7-8c53-16d8fad7c34a', '3a946769-431b-521a-bfe1-3ba4a9861e43', 'working', 1, 18, 0.0, 150, FALSE, '2026-10-27T22:50:49+00:00'),
  ('999a2d5f-5746-5108-abff-586893e6890a', '3a946769-431b-521a-bfe1-3ba4a9861e43', 'working', 2, 19, 0.0, 60, FALSE, '2026-10-27T22:53:26+00:00'),
  ('95a5bad2-2daf-5cc0-b006-315133d85a39', '45afdb96-b2ed-54fe-b79c-a0ccf1d6e943', 'working', 1, 10, 18.0, 150, FALSE, '2026-10-27T22:57:06+00:00'),
  ('b22a3296-0a9c-5c1c-a57f-bc15cd93b552', '45afdb96-b2ed-54fe-b79c-a0ccf1d6e943', 'working', 2, 10, 18.0, 120, FALSE, '2026-10-27T23:00:16+00:00'),
  ('e39cc019-f9b4-5528-abe4-d32841b783f8', '45afdb96-b2ed-54fe-b79c-a0ccf1d6e943', 'working', 3, 10, 18.0, 90, FALSE, '2026-10-27T23:02:56+00:00'),
  ('736cb8ea-a84d-5df3-8293-8ce2b08d05ee', '4b0d9239-96ef-56ff-8292-665b4a2bc038', 'working', 1, 12, 11.0, 150, FALSE, '2026-10-27T23:06:42+00:00'),
  ('3296b34e-f33f-5373-8e51-9f1ea47b8757', '4b0d9239-96ef-56ff-8292-665b4a2bc038', 'working', 2, 12, 11.0, 120, FALSE, '2026-10-27T23:09:58+00:00');

INSERT INTO workouts (id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, poids_corps_kg, session_mode, total_reps) VALUES ('00a6393c-ac0f-5b76-a659-a9e3907dda4d', 'c1ba0015-c3b7-51ed-8d83-df70ac9b261c', 'Haltères maison', '2026-10-28T22:39:00+00:00', '2026-10-28T23:33:13+00:00', 3253, 3277.0, FALSE, 76.0, 'gym', 181);
INSERT INTO workout_exercises (id, workout_id, exercise_id, order_index, laterality) VALUES
  ('efbb27d2-ee15-5405-8165-2c0f10710949', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'dumbbell-bench-press' AND owner_id IS NULL), 0, 'bilateral'),
  ('1e8f135f-e116-5a71-be6b-6593037cb369', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'dumbbell-goblet-squat' AND owner_id IS NULL), 1, 'bilateral'),
  ('dffc6697-ab83-5fc6-971f-d9be921ca0bd', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'dumbbell-row-unilateral' AND owner_id IS NULL), 2, 'unilateral'),
  ('cb35e1f4-b39e-5583-a61f-d9d012895eb3', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'push-up' AND owner_id IS NULL), 3, 'bilateral'),
  ('0cfc455a-0b37-5a9e-b167-7dc490b80fe6', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'dumbbell-seated-overhead-press' AND owner_id IS NULL), 4, 'bilateral'),
  ('dfb7f0d5-34b3-5620-8c93-ec6085e23396', '00a6393c-ac0f-5b76-a659-a9e3907dda4d', (SELECT id FROM exercises WHERE code = 'dumbbell-hammer-curl' AND owner_id IS NULL), 5, 'bilateral');
INSERT INTO workout_sets (id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, logged_at) VALUES
  ('e126f582-096a-506e-9c14-55346dc30268', 'efbb27d2-ee15-5405-8165-2c0f10710949', 'working', 1, 10, 26.0, 120, FALSE, '2026-10-28T22:47:10+00:00'),
  ('2f44cb80-2207-5c2b-bb04-f50c892dcfa0', 'efbb27d2-ee15-5405-8165-2c0f10710949', 'working', 2, 10, 26.0, 60, FALSE, '2026-10-28T22:49:20+00:00'),
  ('89753662-3df9-58ad-8597-23bb2eb2aa0b', 'efbb27d2-ee15-5405-8165-2c0f10710949', 'working', 3, 10, 26.0, 90, FALSE, '2026-10-28T22:52:00+00:00'),
  ('3598954b-292f-5d73-923a-33d61ac6334b', '1e8f135f-e116-5a71-be6b-6593037cb369', 'working', 1, 12, 24.0, 90, FALSE, '2026-10-28T22:54:46+00:00'),
  ('deb2daad-3769-5048-88dd-d7967d9595eb', '1e8f135f-e116-5a71-be6b-6593037cb369', 'working', 2, 12, 24.0, 90, FALSE, '2026-10-28T22:57:32+00:00'),
  ('120da549-a97a-5f6e-813a-17761b2bbf4b', '1e8f135f-e116-5a71-be6b-6593037cb369', 'working', 3, 12, 24.0, 120, FALSE, '2026-10-28T23:00:48+00:00'),
  ('f58c0fd5-523b-586a-ad27-751cb0c1b992', 'dffc6697-ab83-5fc6-971f-d9be921ca0bd', 'working', 1, 10, 28.0, 90, FALSE, '2026-10-28T23:03:28+00:00'),
  ('d4873def-1409-5a48-9d0d-820c0223dc70', 'dffc6697-ab83-5fc6-971f-d9be921ca0bd', 'working', 2, 10, 28.0, 90, FALSE, '2026-10-28T23:06:08+00:00'),
  ('184c60a3-b068-516a-99ed-aae078cdd71b', 'dffc6697-ab83-5fc6-971f-d9be921ca0bd', 'working', 3, 10, 28.0, 120, FALSE, '2026-10-28T23:09:18+00:00'),
  ('0eba2942-e47a-54d7-98f8-36c45e3508f2', 'cb35e1f4-b39e-5583-a61f-d9d012895eb3', 'working', 1, 16, 0.0, 90, FALSE, '2026-10-28T23:12:16+00:00'),
  ('b94aa98b-1a12-51ea-ae25-f983f5642e5a', 'cb35e1f4-b39e-5583-a61f-d9d012895eb3', 'working', 2, 16, 0.0, 90, FALSE, '2026-10-28T23:15:14+00:00'),
  ('f6c48cf0-51f0-5546-b171-c598a0013c4e', '0cfc455a-0b37-5a9e-b167-7dc490b80fe6', 'working', 1, 10, 18.0, 60, FALSE, '2026-10-28T23:17:24+00:00'),
  ('6de486d8-ea60-5de6-864d-f47b60d93316', '0cfc455a-0b37-5a9e-b167-7dc490b80fe6', 'working', 2, 10, 18.0, 120, FALSE, '2026-10-28T23:20:34+00:00'),
  ('92d28ab8-abdd-5925-9c87-19ab87da255b', '0cfc455a-0b37-5a9e-b167-7dc490b80fe6', 'working', 3, 10, 18.0, 150, FALSE, '2026-10-28T23:24:14+00:00'),
  ('55d976c0-9113-57b4-b848-0045456296a7', 'dfb7f0d5-34b3-5620-8c93-ec6085e23396', 'working', 1, 12, 11.0, 60, FALSE, '2026-10-28T23:26:30+00:00'),
  ('b1db8bbf-754a-51cc-bdf4-7b6c1054ea8c', 'dfb7f0d5-34b3-5620-8c93-ec6085e23396', 'working', 2, 11, 11.0, 150, FALSE, '2026-10-28T23:30:13+00:00');

COMMIT;
