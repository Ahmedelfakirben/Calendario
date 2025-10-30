-- ============================================
-- TABLA DE AUDITORÍA - SISTEMA DE REGISTRO DE CAMBIOS
-- Para el Calendario del CAU SES-SGS
-- ============================================

-- Tabla de auditoría para registrar todos los cambios
CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  -- Información del usuario que realizó el cambio
  user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  user_name TEXT NOT NULL, -- Guardamos el nombre para histórico

  -- Tipo de acción realizada
  action_type TEXT NOT NULL CHECK (action_type IN ('CREATE', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT', 'PASSWORD_CHANGE')),

  -- Entidad afectada (event, user, etc.)
  entity_type TEXT NOT NULL CHECK (entity_type IN ('event', 'user', 'filter')),
  entity_id UUID, -- ID de la entidad afectada (puede ser null para algunas acciones)

  -- Detalles del cambio
  description TEXT NOT NULL, -- Descripción legible del cambio
  old_values JSONB, -- Valores anteriores (para UPDATE y DELETE)
  new_values JSONB, -- Valores nuevos (para CREATE y UPDATE)

  -- Metadatos adicionales
  ip_address TEXT, -- Dirección IP del usuario (opcional)
  user_agent TEXT, -- Navegador/dispositivo usado (opcional)

  -- Timestamp
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índices para mejorar el rendimiento de consultas
CREATE INDEX IF NOT EXISTS idx_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_action_type ON audit_logs(action_type);
CREATE INDEX IF NOT EXISTS idx_audit_logs_entity_type ON audit_logs(entity_type);
CREATE INDEX IF NOT EXISTS idx_audit_logs_entity_id ON audit_logs(entity_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at DESC);

-- Índice compuesto para consultas más comunes
CREATE INDEX IF NOT EXISTS idx_audit_logs_composite ON audit_logs(entity_type, created_at DESC);

-- Política de seguridad para audit_logs
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- Permitir lectura a todos (autenticados)
CREATE POLICY "Audit logs are viewable by everyone" ON audit_logs
    FOR SELECT USING (true);

-- Solo usuarios autenticados pueden insertar (la aplicación lo hará automáticamente)
CREATE POLICY "Audit logs are insertable by authenticated users" ON audit_logs
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- Política para acceso público (temporal para desarrollo)
CREATE POLICY "Public access to audit_logs" ON audit_logs FOR ALL USING (true) WITH CHECK (true);

-- ============================================
-- FUNCIÓN TRIGGER PARA AUDITORÍA AUTOMÁTICA
-- ============================================

-- Función para registrar cambios en eventos automáticamente
CREATE OR REPLACE FUNCTION log_event_changes()
RETURNS TRIGGER AS $$
DECLARE
    v_user_name TEXT;
    v_description TEXT;
    v_old_values JSONB;
    v_new_values JSONB;
BEGIN
    -- Obtener el nombre del usuario (esto debería venir de la aplicación)
    -- Por ahora usamos un valor por defecto
    SELECT name INTO v_user_name FROM users WHERE id = COALESCE(NEW.user_id, OLD.user_id) LIMIT 1;
    IF v_user_name IS NULL THEN
        v_user_name := 'Sistema';
    END IF;

    -- Determinar la acción y construir la descripción
    IF TG_OP = 'INSERT' THEN
        v_description := 'Nuevo evento creado: ' || NEW.title || ' (' || NEW.type || ')';
        v_new_values := to_jsonb(NEW);

        INSERT INTO audit_logs (
            user_id, user_name, action_type, entity_type, entity_id,
            description, old_values, new_values
        ) VALUES (
            NEW.user_id, v_user_name, 'CREATE', 'event', NEW.id,
            v_description, NULL, v_new_values
        );

    ELSIF TG_OP = 'UPDATE' THEN
        v_description := 'Evento actualizado: ' || NEW.title;
        v_old_values := to_jsonb(OLD);
        v_new_values := to_jsonb(NEW);

        INSERT INTO audit_logs (
            user_id, user_name, action_type, entity_type, entity_id,
            description, old_values, new_values
        ) VALUES (
            NEW.user_id, v_user_name, 'UPDATE', 'event', NEW.id,
            v_description, v_old_values, v_new_values
        );

    ELSIF TG_OP = 'DELETE' THEN
        v_description := 'Evento eliminado: ' || OLD.title || ' (' || OLD.type || ')';
        v_old_values := to_jsonb(OLD);

        INSERT INTO audit_logs (
            user_id, user_name, action_type, entity_type, entity_id,
            description, old_values, new_values
        ) VALUES (
            OLD.user_id, v_user_name, 'DELETE', 'event', OLD.id,
            v_description, v_old_values, NULL
        );
    END IF;

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Trigger para eventos
DROP TRIGGER IF EXISTS audit_events_trigger ON events;
CREATE TRIGGER audit_events_trigger
    AFTER INSERT OR UPDATE OR DELETE ON events
    FOR EACH ROW
    EXECUTE FUNCTION log_event_changes();

-- ============================================
-- VISTA SIMPLIFICADA PARA CONSULTAS
-- ============================================

-- Vista que muestra los registros de auditoría con información útil
CREATE OR REPLACE VIEW audit_logs_view AS
SELECT
    al.id,
    al.user_name,
    al.action_type,
    al.entity_type,
    al.description,
    -- Extraer información específica de eventos si aplica
    CASE
        WHEN al.entity_type = 'event' AND al.new_values IS NOT NULL THEN
            al.new_values->>'title'
        WHEN al.entity_type = 'event' AND al.old_values IS NOT NULL THEN
            al.old_values->>'title'
        ELSE NULL
    END as event_title,
    CASE
        WHEN al.entity_type = 'event' AND al.new_values IS NOT NULL THEN
            al.new_values->>'type'
        WHEN al.entity_type = 'event' AND al.old_values IS NOT NULL THEN
            al.old_values->>'type'
        ELSE NULL
    END as event_type,
    al.old_values,
    al.new_values,
    al.created_at,
    -- Formato legible de fecha
    TO_CHAR(al.created_at, 'DD/MM/YYYY HH24:MI:SS') as formatted_date
FROM audit_logs al
ORDER BY al.created_at DESC;

-- ============================================
-- EJEMPLOS DE CONSULTAS ÚTILES
-- ============================================

-- Ver todos los cambios de un usuario específico
-- SELECT * FROM audit_logs_view WHERE user_name = 'Ahmed El Fakir';

-- Ver todos los cambios en un rango de fechas
-- SELECT * FROM audit_logs_view WHERE created_at >= '2025-01-01' AND created_at < '2025-02-01';

-- Ver todos los cambios de un tipo específico de evento
-- SELECT * FROM audit_logs_view WHERE event_type = 'vacaciones';

-- Ver todas las eliminaciones
-- SELECT * FROM audit_logs_view WHERE action_type = 'DELETE';

-- Contar acciones por usuario
-- SELECT user_name, action_type, COUNT(*) as total
-- FROM audit_logs
-- GROUP BY user_name, action_type
-- ORDER BY user_name, action_type;
