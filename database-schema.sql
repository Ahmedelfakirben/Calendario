-- Esquema de base de datos para el Calendario del CAU SES-SGS
-- Ejecutar este script en Supabase SQL Editor

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  username TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Función para crear hash de contraseña (bcrypt)
-- Nota: Ejecutar estos inserts después de configurar la aplicación
-- El hash corresponde a la contraseña: Satec2016C@U
-- Hash generado con bcryptjs: $2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq

-- Insertar usuarios iniciales con contraseña por defecto
-- Contraseña para todos: Satec2016C@U
INSERT INTO users (name, username, password_hash) VALUES
  ('Ahmed El Fakir', 'ahmed.elfakir', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Luis Miguel Fernandez Nunez', 'luis.fernandez', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Borja Lopez Vila', 'borja.lopez', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Sergio Crespo Sabrido', 'sergio.crespo', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Armando Vergara Verd', 'armando.vergara', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Alvaro Oliver Morgado', 'alvaro.oliver', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq'),
  ('Santiago Diaz Barbara', 'santiago.diaz', '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq')
ON CONFLICT (username) DO NOTHING;

-- Tabla de eventos
CREATE TABLE IF NOT EXISTS events (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('vacaciones', 'guardias', 'visitas', 'reuniones', 'jornada', 'ofi', 'compras', 'manuales')),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  start_time TIME,
  end_time TIME,
  description TEXT,
  repetition_frequency TEXT CHECK (repetition_frequency IN ('daily', 'weekly', 'everyXWeeks')),
  repetition_interval INTEGER DEFAULT 1,
  repetition_weekdays INTEGER[],
  exceptions DATE[],
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabla de filtros de usuario (opcional, para persistir filtros por usuario)
CREATE TABLE IF NOT EXISTS user_filters (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  filter_type TEXT NOT NULL CHECK (filter_type IN ('event_type', 'user')),
  filter_key TEXT NOT NULL,
  enabled BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índices para mejorar rendimiento
CREATE INDEX IF NOT EXISTS idx_events_user_id ON events(user_id);
CREATE INDEX IF NOT EXISTS idx_events_start_date ON events(start_date);
CREATE INDEX IF NOT EXISTS idx_events_end_date ON events(end_date);
CREATE INDEX IF NOT EXISTS idx_events_type ON events(type);
CREATE INDEX IF NOT EXISTS idx_user_filters_user_id ON user_filters(user_id);

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger para actualizar updated_at en events
CREATE TRIGGER update_events_updated_at
    BEFORE UPDATE ON events
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para actualizar updated_at en users
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Políticas de seguridad (RLS - Row Level Security)
-- Habilitar RLS en las tablas
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_filters ENABLE ROW LEVEL SECURITY;

-- Políticas para users (todos pueden leer, pero solo autenticados pueden modificar)
CREATE POLICY "Users are viewable by everyone" ON users
    FOR SELECT USING (true);

CREATE POLICY "Users are insertable by authenticated users" ON users
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Users are updatable by authenticated users" ON users
    FOR UPDATE USING (auth.role() = 'authenticated');

-- Políticas para events (todos pueden leer, autenticados pueden modificar)
CREATE POLICY "Events are viewable by everyone" ON events
    FOR SELECT USING (true);

CREATE POLICY "Events are insertable by authenticated users" ON events
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Events are updatable by authenticated users" ON events
    FOR UPDATE USING (auth.role() = 'authenticated');

CREATE POLICY "Events are deletable by authenticated users" ON events
    FOR DELETE USING (auth.role() = 'authenticated');

-- Políticas para user_filters
CREATE POLICY "User filters are viewable by everyone" ON user_filters
    FOR SELECT USING (true);

CREATE POLICY "User filters are manageable by authenticated users" ON user_filters
    FOR ALL USING (auth.role() = 'authenticated');

-- Configurar permisos para acceso público (ya que es una aplicación sin autenticación de usuarios)
-- NOTA: En producción, considera implementar autenticación para mayor seguridad
ALTER TABLE users FORCE ROW LEVEL SECURITY;
ALTER TABLE events FORCE ROW LEVEL SECURITY;
ALTER TABLE user_filters FORCE ROW LEVEL SECURITY;

-- Crear políticas que permitan acceso público (temporal para desarrollo)
-- Estas políticas permiten acceso sin autenticación
CREATE POLICY "Public access to users" ON users FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Public access to events" ON events FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Public access to user_filters" ON user_filters FOR ALL USING (true) WITH CHECK (true);