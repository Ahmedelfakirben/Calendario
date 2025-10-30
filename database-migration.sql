-- ============================================
-- MIGRACIÓN DE BASE DE DATOS
-- Calendario del CAU SES-SGS v3.2
-- ============================================
-- Este script actualiza la base de datos existente para añadir autenticación
-- IMPORTANTE: Ejecutar este script en lugar de database-schema.sql si ya tienes datos

-- ============================================
-- PASO 1: Añadir nuevas columnas a la tabla users
-- ============================================

-- Añadir columna username (temporal permite NULL)
ALTER TABLE users
ADD COLUMN IF NOT EXISTS username TEXT;

-- Añadir columna password_hash (temporal permite NULL)
ALTER TABLE users
ADD COLUMN IF NOT EXISTS password_hash TEXT;

-- Añadir columna updated_at si no existe
ALTER TABLE users
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW();

-- ============================================
-- PASO 2: Generar usernames automáticamente para usuarios existentes
-- ============================================

-- Actualizar usuarios existentes con usernames basados en sus nombres
UPDATE users SET username =
  CASE
    WHEN name = 'Ahmed El Fakir' THEN 'ahmed.elfakir'
    WHEN name = 'Luis Miguel Fernandez Nunez' THEN 'luis.fernandez'
    WHEN name = 'Borja Lopez Vila' THEN 'borja.lopez'
    WHEN name = 'Sergio Crespo Sabrido' THEN 'sergio.crespo'
    WHEN name = 'Armando Vergara Verd' THEN 'armando.vergara'
    WHEN name = 'Alvaro Oliver Morgado' THEN 'alvaro.oliver'
    WHEN name = 'Santiago Diaz Barbara' THEN 'santiago.diaz'
    -- Para cualquier otro usuario, generar username desde el nombre
    ELSE LOWER(REPLACE(REGEXP_REPLACE(name, '[^a-zA-Z ]', '', 'g'), ' ', '.'))
  END
WHERE username IS NULL;

-- ============================================
-- PASO 3: Asignar contraseña por defecto a todos los usuarios
-- ============================================

-- Contraseña por defecto: Satec2016C@U
-- Hash bcrypt (generado con bcryptjs): $2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq
UPDATE users
SET password_hash = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'
WHERE password_hash IS NULL;

-- ============================================
-- PASO 4: Hacer las columnas NOT NULL y añadir restricciones
-- ============================================

-- Ahora que todos los usuarios tienen username, hacerlo obligatorio y único
ALTER TABLE users
ALTER COLUMN username SET NOT NULL;

-- Crear índice único para username
CREATE UNIQUE INDEX IF NOT EXISTS users_username_unique ON users(username);

-- Hacer password_hash obligatorio
ALTER TABLE users
ALTER COLUMN password_hash SET NOT NULL;

-- ============================================
-- PASO 5: Insertar usuarios nuevos si no existen
-- ============================================

-- Insertar solo los usuarios que no existan ya
INSERT INTO users (name, username, password_hash) VALUES
  ('Ahmed El Fakir', 'ahmed.elfakir', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Luis Miguel Fernandez Nunez', 'luis.fernandez', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Borja Lopez Vila', 'borja.lopez', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Sergio Crespo Sabrido', 'sergio.crespo', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Armando Vergara Verd', 'armando.vergara', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Alvaro Oliver Morgado', 'alvaro.oliver', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Santiago Diaz Barbara', 'santiago.diaz', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq')
ON CONFLICT (username) DO NOTHING;

-- ============================================
-- PASO 6: Crear trigger para updated_at si no existe
-- ============================================

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Eliminar trigger si ya existe para evitar duplicados
DROP TRIGGER IF EXISTS update_users_updated_at ON users;

-- Crear trigger para users
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- VERIFICACIÓN: Consultar usuarios migrados
-- ============================================

-- Descomentar para ver el resultado de la migración
-- SELECT id, name, username,
--        CASE WHEN password_hash IS NOT NULL THEN 'Configurado' ELSE 'Sin configurar' END as password_status,
--        created_at, updated_at
-- FROM users
-- ORDER BY name;

-- ============================================
-- RESUMEN DE LA MIGRACIÓN
-- ============================================
-- ✓ Columnas 'username' y 'password_hash' añadidas
-- ✓ Usernames generados para usuarios existentes
-- ✓ Contraseña por defecto asignada: Satec2016C@U
-- ✓ Restricciones de unicidad aplicadas
-- ✓ Trigger updated_at configurado
-- ✓ Usuarios nuevos insertados (si no existían)
