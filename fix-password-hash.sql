-- ============================================
-- CORRECCIÓN DE HASH DE CONTRASEÑA
-- Calendario del CAU SES-SGS
-- ============================================
-- Este script actualiza el hash de contraseña incorrecto
-- Ejecutar en Supabase SQL Editor

-- ============================================
-- ACTUALIZAR HASH DE CONTRASEÑA PARA TODOS LOS USUARIOS
-- ============================================

-- Contraseña: Satec2016C@U
-- Nuevo hash correcto (generado con bcryptjs): $2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq
-- Este hash es compatible con bcryptjs usado en la aplicación

UPDATE users
SET password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq',
    updated_at = NOW();

-- ============================================
-- VERIFICACIÓN
-- ============================================

-- Mostrar todos los usuarios actualizados
SELECT
  id,
  name,
  username,
  CASE
    WHEN password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq' THEN '✓ Hash correcto'
    ELSE '✗ Hash incorrecto'
  END as password_status,
  updated_at
FROM users
ORDER BY name;

-- ============================================
-- RESUMEN
-- ============================================
-- ✓ Hash de contraseña actualizado para todos los usuarios
-- ✓ Contraseña: Satec2016C@U
-- ✓ Compatible con bcryptjs
--
-- Ahora puedes iniciar sesión con:
-- - Username: ahmed.elfakir, luis.fernandez, borja.lopez, etc.
-- - Password: Satec2016C@U
