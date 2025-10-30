# 📋 Sistema de Historial y Auditoría - Calendario CAU SES-SGS

## Descripción

Se ha implementado un sistema completo de auditoría y registro de cambios que permite:

- ✅ **Registrar automáticamente** todos los cambios en eventos (crear, modificar, eliminar)
- ✅ **Registrar manualmente** acciones de usuario (login, logout, cambio de contraseña)
- ✅ **Visualizar historial** completo con filtros avanzados
- ✅ **Exportar registros** a formato CSV para análisis externo
- ✅ **Actualizaciones en tiempo real** cuando se registran nuevos cambios

---

## 📦 Componentes Creados

### 1. **Base de Datos**
- **Archivo:** `audit-log-schema.sql`
- **Tabla principal:** `audit_logs`
- **Vista simplificada:** `audit_logs_view`
- **Triggers automáticos:** Para eventos (INSERT, UPDATE, DELETE)

### 2. **API de Auditoría**
- **Archivo:** `src/supabase.js`
- **Funciones disponibles:**
  - `auditAPI.getAll()` - Obtener todos los registros
  - `auditAPI.getByUser()` - Filtrar por usuario
  - `auditAPI.getByActionType()` - Filtrar por tipo de acción
  - `auditAPI.getByDateRange()` - Filtrar por fechas
  - `auditAPI.log()` - Registrar acción manual
  - `auditAPI.getStats()` - Obtener estadísticas

### 3. **Componente de Interfaz**
- **Archivo:** `src/components/AuditLogHistory.jsx`
- **Características:**
  - Panel de estadísticas rápidas
  - Filtros por: tipo de acción, usuario, período, búsqueda
  - Indicadores visuales por tipo de acción
  - Formato de tiempo relativo (hace X minutos/horas/días)
  - Exportación a CSV
  - Actualizaciones en tiempo real

---

## 🚀 Instalación

### Paso 1: Ejecutar el script SQL en Supabase

1. Abre tu proyecto de Supabase
2. Ve a **SQL Editor**
3. Carga y ejecuta el archivo `audit-log-schema.sql`

Esto creará:
- Tabla `audit_logs` para almacenar registros
- Vista `audit_logs_view` para consultas simplificadas
- Triggers automáticos para eventos
- Políticas de seguridad RLS

### Paso 2: Verificar la integración

El código ya está integrado en la aplicación. Solo necesitas:

1. Asegurarte de que el servidor esté corriendo
2. Iniciar sesión en la aplicación
3. Buscar el botón **"📋 Historial"** en la barra de acciones

---

## 💡 Uso del Sistema

### Acceder al Historial

1. Inicia sesión en la aplicación
2. En la barra de acciones superior, haz clic en **"📋 Historial"**
3. Se abrirá el panel de historial con todos los registros

### Filtros Disponibles

1. **Tipo de Acción:**
   - Todas las acciones
   - Creaciones (eventos nuevos)
   - Actualizaciones (eventos modificados)
   - Eliminaciones (eventos borrados)
   - Inicios de sesión
   - Cierres de sesión
   - Cambios de contraseña

2. **Usuario:**
   - Filtra por usuario específico
   - Ver solo cambios de un miembro del equipo

3. **Período:**
   - Últimas 24 horas
   - Últimos 7 días
   - Últimos 30 días
   - Últimos 90 días
   - Todo el historial

4. **Búsqueda:**
   - Busca en descripciones, nombres de eventos y usuarios

### Exportar Datos

1. Aplica los filtros deseados
2. Haz clic en **"📥 Exportar a CSV"**
3. El archivo se descargará con formato:
   ```
   Fecha, Usuario, Acción, Descripción, Detalles
   ```

---

## 📊 Tipos de Registros

### Acciones Automáticas (Triggers de BD)

Estas se registran automáticamente sin intervención del código:

| Acción | Cuándo se registra | Información guardada |
|--------|-------------------|---------------------|
| **CREATE** | Al crear un evento nuevo | Todos los datos del evento |
| **UPDATE** | Al modificar un evento | Valores anteriores y nuevos |
| **DELETE** | Al eliminar un evento | Datos del evento eliminado |

### Acciones Manuales (Registradas por código)

Estas se registran explícitamente desde la aplicación:

| Acción | Cuándo se registra | Dónde se registra |
|--------|-------------------|------------------|
| **LOGIN** | Al iniciar sesión | `App.jsx:handleLoginSuccess()` |
| **LOGOUT** | Al cerrar sesión | `App.jsx:handleLogout()` |
| **PASSWORD_CHANGE** | Al cambiar contraseña | `ChangePasswordModal.jsx` (pendiente) |

---

## 🎨 Códigos de Color

El historial usa colores para identificar rápidamente tipos de acciones:

- 🟢 **Verde (#10b981):** Creaciones
- 🔵 **Azul (#3b82f6):** Actualizaciones
- 🔴 **Rojo (#ef4444):** Eliminaciones
- 🟣 **Morado (#8b5cf6):** Inicios de sesión
- ⚫ **Gris (#6b7280):** Cierres de sesión
- 🟠 **Naranja (#f59e0b):** Cambios de contraseña

---

## 🔍 Consultas SQL Útiles

### Ver últimos 50 cambios
```sql
SELECT * FROM audit_logs_view LIMIT 50;
```

### Ver cambios de un usuario específico
```sql
SELECT * FROM audit_logs_view
WHERE user_name = 'Ahmed El Fakir'
ORDER BY created_at DESC;
```

### Ver todas las eliminaciones
```sql
SELECT * FROM audit_logs_view
WHERE action_type = 'DELETE'
ORDER BY created_at DESC;
```

### Contar acciones por usuario
```sql
SELECT user_name, action_type, COUNT(*) as total
FROM audit_logs
GROUP BY user_name, action_type
ORDER BY user_name, total DESC;
```

### Ver cambios de hoy
```sql
SELECT * FROM audit_logs_view
WHERE created_at >= CURRENT_DATE
ORDER BY created_at DESC;
```

### Ver cambios en un rango de fechas
```sql
SELECT * FROM audit_logs_view
WHERE created_at BETWEEN '2025-01-01' AND '2025-02-01'
ORDER BY created_at DESC;
```

---

## 🛠️ Mantenimiento

### Limpiar registros antiguos (más de 1 año)

⚠️ **ADVERTENCIA:** Esta acción es irreversible

```sql
DELETE FROM audit_logs
WHERE created_at < NOW() - INTERVAL '1 year';
```

### Ver tamaño de la tabla de auditoría

```sql
SELECT
    pg_size_pretty(pg_total_relation_size('audit_logs')) as table_size,
    COUNT(*) as total_records
FROM audit_logs;
```

### Exportar todo el historial a CSV (desde Supabase)

1. Ve a SQL Editor en Supabase
2. Ejecuta:
```sql
SELECT * FROM audit_logs_view ORDER BY created_at DESC;
```
3. Haz clic en "Download as CSV"

---

## 📈 Estadísticas

El componente de historial muestra automáticamente:

- **Total de registros** en el sistema
- **Creaciones** totales
- **Modificaciones** totales
- **Eliminaciones** totales

Puedes obtener estadísticas más detalladas usando:

```javascript
const stats = await auditAPI.getStats();
console.log(stats);
```

Ejemplo de salida:
```javascript
{
  "Ahmed El Fakir": {
    total: 45,
    CREATE: 20,
    UPDATE: 15,
    DELETE: 5,
    LOGIN: 4,
    LOGOUT: 1,
    PASSWORD_CHANGE: 0
  },
  "Luis Miguel Fernandez": {
    total: 32,
    ...
  }
}
```

---

## 🔒 Seguridad y Permisos

### Políticas RLS (Row Level Security)

La tabla `audit_logs` tiene políticas de seguridad configuradas:

- ✅ **Lectura:** Todos pueden ver los registros
- ✅ **Escritura:** Solo usuarios autenticados pueden crear registros
- ❌ **Modificación:** Nadie puede modificar registros existentes
- ❌ **Eliminación:** Nadie puede eliminar registros (solo administradores de BD)

### Datos Sensibles

⚠️ **IMPORTANTE:** Los registros de auditoría almacenan:

- Contraseñas: ❌ **NO** (solo hash, nunca texto plano)
- Nombres de usuario: ✅ **SÍ**
- Títulos de eventos: ✅ **SÍ**
- Descripciones: ✅ **SÍ**
- Fechas y horas: ✅ **SÍ**

---

## 🐛 Solución de Problemas

### El historial no muestra registros

1. Verifica que ejecutaste el SQL: `audit-log-schema.sql`
2. Comprueba en Supabase SQL Editor:
   ```sql
   SELECT COUNT(*) FROM audit_logs;
   ```
3. Verifica que los triggers están creados:
   ```sql
   SELECT * FROM pg_trigger WHERE tgname = 'audit_events_trigger';
   ```

### Los cambios no se registran automáticamente

1. Verifica que los triggers están activos:
   ```sql
   SELECT tgname, tgtype, tgenabled
   FROM pg_trigger
   WHERE tgrelid = 'events'::regclass;
   ```

2. Verifica los permisos de la tabla:
   ```sql
   SELECT * FROM information_schema.table_privileges
   WHERE table_name = 'audit_logs';
   ```

### Error al abrir el historial

1. Abre la consola del navegador (F12)
2. Busca errores de JavaScript
3. Verifica que `auditAPI` está correctamente importado en `App.jsx`

---

## 📝 Próximas Mejoras (Opcionales)

- [ ] Agregar filtro por tipo de evento (vacaciones, guardias, etc.)
- [ ] Implementar paginación para grandes volúmenes de datos
- [ ] Agregar gráficos de actividad por usuario
- [ ] Notificaciones en tiempo real de cambios importantes
- [ ] Exportación a PDF con formato profesional
- [ ] Registro de cambios en contraseñas (actualmente pendiente)

---

## 👥 Soporte

Para problemas o preguntas:

1. Revisa esta documentación
2. Verifica los logs del navegador (F12 → Console)
3. Verifica los logs de Supabase (Dashboard → Logs)
4. Consulta con el administrador del sistema

---

**Desarrollado para:** Calendario CAU SES-SGS
**Fecha:** 30 de Octubre, 2025
**Versión:** 1.0.0
