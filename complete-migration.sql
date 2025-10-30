-- ============================================
-- MIGRACIÓN COMPLETA DEL CALENDARIO CAU SES-SGS
-- ============================================
-- Este script realiza la migración completa:
-- 1. Actualiza el hash de contraseña de todos los usuarios
-- 2. Importa todos los eventos del calendario
--
-- IMPORTANTE: Ejecutar este script en Supabase SQL Editor
-- ============================================

-- ============================================
-- PARTE 1: ACTUALIZAR HASH DE CONTRASEÑA
-- ============================================

-- Contraseña: Satec2016C@U
-- Hash correcto (generado con bcryptjs): $2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq

UPDATE users
SET password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq',
    updated_at = NOW();

-- Verificar usuarios actualizados
DO $$
DECLARE
  user_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO user_count FROM users
  WHERE password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq';

  RAISE NOTICE '✓ Hash de contraseña actualizado para % usuarios', user_count;
END $$;

-- ============================================
-- PARTE 2: LIMPIAR EVENTOS EXISTENTES (OPCIONAL)
-- ============================================
-- DESCOMENTAR LA SIGUIENTE LÍNEA SI QUIERES ELIMINAR TODOS LOS EVENTOS EXISTENTES
-- DELETE FROM events;

-- ============================================
-- PARTE 3: IMPORTAR EVENTOS
-- ============================================
-- Los eventos se importarán desde el archivo import-calendar-data.sql
-- Este placeholder indica dónde se insertarán los eventos

-- NOTA: Para completar la migración:
-- 1. Ejecuta este script (complete-migration.sql) primero
-- 2. Luego ejecuta el script import-calendar-data.sql

-- Verificar estado actual
SELECT
  (SELECT COUNT(*) FROM users) as total_usuarios,
  (SELECT COUNT(*) FROM users WHERE password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq') as usuarios_con_hash_correcto,
  (SELECT COUNT(*) FROM events) as total_eventos_antes_importacion;

-- ============================================
-- RESUMEN
-- ============================================
-- ✓ Hash de contraseña actualizado
-- → Siguiente paso: Ejecutar import-calendar-data.sql para importar los 187 eventos
