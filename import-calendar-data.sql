-- ============================================
-- MIGRACIÓN DE DATOS DEL CALENDARIO
-- Generado automáticamente desde: calendario-cau-v3-2025-10-30.json
-- Fecha: 2025-10-30T11:52:44.368Z
-- ============================================
-- Total de eventos: 187

-- ============================================
-- PASO 1: Insertar eventos
-- ============================================

-- Evento 1: Vacaciones Álvaro (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones Álvaro',
  'vacaciones',
  u.id,
  '2025-07-23'::date,
  '2025-07-24'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 2: Vacaciones (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-08-04'::date,
  '2025-08-08'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 3: Guardia Armando (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardia Armando',
  'guardias',
  u.id,
  '2025-07-14'::date,
  '2025-07-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 4: Vacaciones (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-12-09'::date,
  '2025-12-12'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 5: Vacaciones (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2026-01-02'::date,
  '2026-01-02'::date,
  '8:30'::time,
  '8:30'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 6: Vacaciones (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2026-01-05'::date,
  '2026-01-05'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 7: Vacaciones (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2026-01-07'::date,
  '2026-01-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 8: Vacaciones (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-09-29'::date,
  '2025-09-30'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 9: Ofi (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-11'::date,
  '2025-08-12'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 10: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-01'::date,
  '2025-09-02'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 11: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-08'::date,
  '2025-09-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 12: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-15'::date,
  '2025-09-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 13: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-22'::date,
  '2025-09-23'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 14: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-06'::date,
  '2025-10-07'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 15: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-13'::date,
  '2025-10-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 16: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-20'::date,
  '2025-10-21'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 17: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-27'::date,
  '2025-10-28'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 18: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-11-03'::date,
  '2025-11-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 19: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-11-10'::date,
  '2025-11-11'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 20: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-11-17'::date,
  '2025-11-18'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 21: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-11-24'::date,
  '2025-11-25'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 22: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-12-01'::date,
  '2025-12-02'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 23: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-12-15'::date,
  '2025-12-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 24: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-12-22'::date,
  '2025-12-23'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 25: O (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-12-29'::date,
  '2025-12-30'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 26: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-12-04'::date,
  '2025-12-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 27: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-09-11'::date,
  '2025-09-11'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 28: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-09-18'::date,
  '2025-09-18'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 29: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-09-25'::date,
  '2025-09-25'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 30: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-10-02'::date,
  '2025-10-02'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 31: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-10-09'::date,
  '2025-10-09'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 32: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-10-16'::date,
  '2025-10-16'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 33: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-10-23'::date,
  '2025-10-23'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 34: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-10-30'::date,
  '2025-10-30'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 35: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-11-06'::date,
  '2025-11-06'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 36: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-11-13'::date,
  '2025-11-13'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 37: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-11-20'::date,
  '2025-11-20'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 38: 18 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  '18',
  'jornada',
  u.id,
  '2025-11-27'::date,
  '2025-11-27'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 39: Jornada 18:30 (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-12-18'::date,
  '2028-12-18'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  'weekly',
  1,
  ARRAY[3]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 40: V (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'V',
  'vacaciones',
  u.id,
  '2025-08-25'::date,
  '2025-09-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 41: V: (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'V:',
  'vacaciones',
  u.id,
  '2025-08-04'::date,
  '2025-08-15'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 42: Vacaciones (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-09-08'::date,
  '2025-09-12'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 43: Vacaciones (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-09-15'::date,
  '2025-09-19'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 44: OFI (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'OFI',
  'ofi',
  u.id,
  '2025-09-24'::date,
  '2025-09-25'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 45: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-13'::date,
  '2025-08-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 46: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-12'::date,
  '2025-08-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 47: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-18'::date,
  '2025-08-19'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 48: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-19'::date,
  '2025-08-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 49: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-18'::date,
  '2025-08-18'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 50: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-21'::date,
  '2025-08-21'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 51: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-25'::date,
  '2025-08-26'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 52: ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'ofi',
  'ofi',
  u.id,
  '2025-08-27'::date,
  '2025-08-28'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 53: G (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-08-25'::date,
  '2025-08-31'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 54: G (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-09-29'::date,
  '2025-10-05'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 55: G (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-08-08'::date,
  '2025-08-17'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 56: G (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-08-18'::date,
  '2025-08-24'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 57: G (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-09-01'::date,
  '2025-09-07'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 58: G (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-09-22'::date,
  '2025-09-28'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 59: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-09-03'::date,
  '2025-09-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 60: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-06'::date,
  '2025-10-07'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 61: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-13'::date,
  '2025-10-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 62: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-20'::date,
  '2025-10-21'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 63: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-27'::date,
  '2025-10-28'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 64: O (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-08'::date,
  '2025-10-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 65: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-15'::date,
  '2025-10-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 66: O (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-22'::date,
  '2025-10-23'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 67: O (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-29'::date,
  '2025-10-30'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 68: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-22'::date,
  '2025-10-23'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 69: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-29'::date,
  '2025-10-30'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 70: G (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-10-06'::date,
  '2025-10-12'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 71: G (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'G',
  'guardias',
  u.id,
  '2025-10-27'::date,
  '2025-11-02'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 72: V (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'V',
  'vacaciones',
  u.id,
  '2025-09-22'::date,
  '2025-09-26'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 73: O (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-08'::date,
  '2025-09-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 74: O (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-10'::date,
  '2025-09-11'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 75: O (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-17'::date,
  '2025-09-18'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 76: V (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'V',
  'vacaciones',
  u.id,
  '2025-09-01'::date,
  '2025-09-05'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 77: O (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-03'::date,
  '2025-09-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 78: O (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-24'::date,
  '2025-09-25'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 79: O (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-29'::date,
  '2025-09-30'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 80: O (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-30'::date,
  '2025-10-01'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 81: O (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-10-01'::date,
  '2025-10-02'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 82: O (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'O',
  'ofi',
  u.id,
  '2025-09-16'::date,
  '2025-09-17'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 83: Jornada Extendida 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-15'::date,
  '2025-09-15'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 84: Jornada Extendida 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-08'::date,
  '2025-09-08'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 85: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-19'::date,
  '2025-08-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 86: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-26'::date,
  '2025-08-27'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 87: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-09-02'::date,
  '2025-09-03'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 88: OFI (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'OFI',
  'ofi',
  u.id,
  '2025-09-09'::date,
  '2025-09-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 89: Jornada Extendida 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-10'::date,
  '2025-09-10'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 90: Jornada Extendida 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-17'::date,
  '2025-09-17'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 91: Jornada Extendida 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-24'::date,
  '2025-09-24'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 92: Jornada Extendida 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-16'::date,
  '2025-09-16'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 93: Jornada Extendida 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-19'::date,
  '2025-09-19'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 94: Jornada Extendida 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-29'::date,
  '2025-09-29'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 95: V (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'V',
  'vacaciones',
  u.id,
  '2025-08-26'::date,
  '2025-08-27'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 96: Jornada Extendida 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-09'::date,
  '2025-09-09'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 97: Jornada Extendida 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-12'::date,
  '2025-09-12'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 98: Jornada Extendida 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-23'::date,
  '2025-09-23'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 99: Jornada Extendida 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-22'::date,
  '2025-09-22'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 100: Jornada Extendida 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-26'::date,
  '2025-09-26'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 101: Jornada Extendida 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-09-30'::date,
  '2025-09-30'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 102: Jornada Extendida 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-01'::date,
  '2025-10-01'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 103: Jornada Extendida 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-03'::date,
  '2025-10-03'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 104: Jornada Extendida 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-06'::date,
  '2025-10-06'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 105: Jornada Extendida 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-07'::date,
  '2025-10-07'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 106: Jornada Extendida 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-08'::date,
  '2025-10-08'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 107: Jornada Extendida 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada Extendida 18:30',
  'jornada',
  u.id,
  '2025-10-10'::date,
  '2025-10-10'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 108: ofi (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'ofi',
  'ofi',
  u.id,
  '2025-08-25'::date,
  '2025-08-25'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 109: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-26'::date,
  '2025-08-26'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 110: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-08-28'::date,
  '2025-08-28'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 111: Guardia (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardia',
  'guardias',
  u.id,
  '2025-09-08'::date,
  '2025-09-11'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 112: Guardia (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardia',
  'guardias',
  u.id,
  '2025-09-12'::date,
  '2025-09-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 113: Médico (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Médico',
  'visitas',
  u.id,
  '2025-09-12'::date,
  '2025-09-12'::date,
  '12:00'::time,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 114: Visitas Medicas (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Visitas Medicas',
  'visitas',
  u.id,
  '2025-12-05'::date,
  '2025-12-05'::date,
  '11:00'::time,
  '13:00'::time,
  'Médico',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 115: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-08'::date,
  '2025-10-09'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 116: Guardias (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-11-17'::date,
  '2028-11-16'::date,
  NULL,
  NULL,
  '',
  'everyXWeeks',
  5,
  ARRAY[0,1,2,3,4,5,6]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 117: Ofi (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2026-01-05'::date,
  '2028-01-04'::date,
  NULL,
  NULL,
  '',
  'weekly',
  1,
  ARRAY[0,1]::integer[],
  ARRAY['2026-01-04'::date,'2026-01-05'::date]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 118: Jornada 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-21'::date,
  '2025-10-21'::date,
  '09:00'::time,
  '18:30'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 119: Jornada 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-20'::date,
  '2025-10-20'::date,
  '09:00'::time,
  '18:30'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 120: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-22'::date,
  '2025-10-22'::date,
  '09:00'::time,
  '18:30'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 121: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-22'::date,
  '2025-10-22'::date,
  '09:00'::time,
  '18:30'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 122: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-13'::date,
  '2025-10-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 123: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-15'::date,
  '2025-10-15'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 124: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-13'::date,
  '2025-10-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 125: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-10-16'::date,
  '2025-10-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 126: Guardias (Luis Miguel Fernandez Nunez)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-10-13'::date,
  '2025-10-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'luis.fernandez';

-- Evento 127: Guardias (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-10-17'::date,
  '2025-10-19'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 128: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-03'::date,
  '2025-11-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 129: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-17'::date,
  '2025-11-18'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 130: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-24'::date,
  '2025-11-25'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 131: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-05'::date,
  '2025-11-06'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 132: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-12'::date,
  '2025-11-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 133: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-05'::date,
  '2025-11-06'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 134: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-19'::date,
  '2025-11-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 135: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-19'::date,
  '2025-11-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 136: Guardias (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-12-01'::date,
  '2025-12-07'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 137: Guardias (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-12-08'::date,
  '2025-12-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 138: Guardias (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-12-15'::date,
  '2025-12-21'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 139: Vacaciones (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-11-11'::date,
  '2025-11-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 140: Guardias (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-11-03'::date,
  '2025-11-07'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 141: Guardias (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-11-08'::date,
  '2025-11-14'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 142: Guardias (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Guardias',
  'guardias',
  u.id,
  '2025-11-15'::date,
  '2025-11-16'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 143: Jornada 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-27'::date,
  '2025-10-27'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 144: Jornada 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-28'::date,
  '2025-10-28'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 145: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-29'::date,
  '2025-10-29'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 146: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-29'::date,
  '2025-10-29'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 147: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-30'::date,
  '2025-10-30'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 148: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-23'::date,
  '2025-10-23'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 149: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-24'::date,
  '2025-10-24'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 150: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-10-31'::date,
  '2025-10-31'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 151: Jornada 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-03'::date,
  '2025-11-03'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 152: Jornada 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-04'::date,
  '2025-11-04'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 153: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-05'::date,
  '2025-11-05'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 154: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-05'::date,
  '2025-11-05'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 155: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-06'::date,
  '2025-11-06'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 156: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-07'::date,
  '2025-11-07'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 157: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-14'::date,
  '2025-11-14'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 158: Jornada 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-18'::date,
  '2025-11-18'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 159: Jornada 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-17'::date,
  '2025-11-17'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 160: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-19'::date,
  '2025-11-19'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 161: Vacaciones (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2026-01-02'::date,
  '2026-01-11'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 162: Vacaciones (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Vacaciones',
  'vacaciones',
  u.id,
  '2025-12-29'::date,
  '2026-01-06'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 163: Ofi (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-04'::date,
  '2025-11-04'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 164: Ofi (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-05'::date,
  '2025-11-05'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 165: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-05'::date,
  '2025-11-06'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 166: Ofi (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-12'::date,
  '2025-11-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 167: Visitas Medicas (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Visitas Medicas',
  'visitas',
  u.id,
  '2025-11-11'::date,
  '2025-11-11'::date,
  '11:00'::time,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 168: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-11'::date,
  '2025-11-11'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 169: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-12'::date,
  '2025-11-12'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 170: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-13'::date,
  '2025-11-13'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 171: Ofi (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-11'::date,
  '2025-11-12'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 172: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-12'::date,
  '2025-11-13'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 173: Ofi (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-18'::date,
  '2025-11-19'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 174: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-19'::date,
  '2025-11-20'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 175: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-19'::date,
  '2025-11-19'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 176: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-20'::date,
  '2025-11-20'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 177: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-21'::date,
  '2025-11-21'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';

-- Evento 178: Jornada 18:30 (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-24'::date,
  '2025-11-24'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 179: Ofi (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-25'::date,
  '2025-11-26'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 180: Ofi (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-26'::date,
  '2025-11-27'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 181: Jornada 18:30 (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-25'::date,
  '2025-11-25'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 182: Ofi (Sergio Crespo Sabrido)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-26'::date,
  '2025-11-27'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'sergio.crespo';

-- Evento 183: Ofi (Armando Vergara Verd)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Ofi',
  'ofi',
  u.id,
  '2025-11-26'::date,
  '2025-11-27'::date,
  NULL,
  NULL,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'armando.vergara';

-- Evento 184: Jornada 18:30 (Alvaro Oliver Morgado)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-26'::date,
  '2025-11-26'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'alvaro.oliver';

-- Evento 185: Jornada 18:30 (Santiago Diaz Barbara)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-26'::date,
  '2025-11-26'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'santiago.diaz';

-- Evento 186: Jornada 18:30 (Borja Lopez Vila)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-27'::date,
  '2025-11-27'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'borja.lopez';

-- Evento 187: Jornada 18:30 (Ahmed El Fakir)
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  'Jornada 18:30',
  'jornada',
  u.id,
  '2025-11-28'::date,
  '2025-11-28'::date,
  '18:30'::time,
  '19:00'::time,
  '',
  NULL,
  1,
  ARRAY[]::integer[],
  ARRAY[]::date[]
FROM users u
WHERE u.username = 'ahmed.elfakir';


-- ============================================
-- RESUMEN DE LA MIGRACIÓN
-- ============================================
-- Total de eventos procesados: 187
-- Eventos convertidos exitosamente: 187
-- Errores encontrados: 0
--
-- Para verificar los datos importados:
-- SELECT COUNT(*) FROM events;
-- SELECT e.title, e.type, u.name, e.start_date, e.end_date
-- FROM events e
-- JOIN users u ON e.user_id = u.id
-- ORDER BY e.start_date
-- LIMIT 10;
