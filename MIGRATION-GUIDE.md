# Guía de Migración - Base de Datos Existente

Si ya tienes una base de datos con datos existentes, **usa este archivo en lugar de `database-schema.sql`**.

## ⚠️ Importante

- **NO ejecutes** `database-schema.sql` si ya tienes datos
- **Usa** `database-migration.sql` para actualizar tu base de datos existente
- Este script es seguro y no eliminará tus datos

## Pasos de Migración

### 1. Hacer Backup (Recomendado)

En Supabase Dashboard:
1. Ve a `Database` → `Backups`
2. Crea un backup manual antes de migrar
3. Anota la fecha/hora del backup

### 2. Ejecutar el Script de Migración

1. Ve a Supabase Dashboard → `SQL Editor`
2. Abre `database-migration.sql`
3. Copia todo el contenido
4. Pégalo en el editor SQL
5. Haz clic en `RUN` o presiona `Ctrl+Enter`

### 3. Verificar la Migración

Ejecuta esta consulta para verificar que todo funcionó:

```sql
SELECT
    id,
    name,
    username,
    CASE
        WHEN password_hash IS NOT NULL THEN '✓ Configurado'
        ELSE '✗ Falta'
    END as password_status,
    created_at,
    updated_at
FROM users
ORDER BY name;
```

Deberías ver:
- ✓ Todos los usuarios tienen `username`
- ✓ Todos los usuarios tienen `password_status` = "✓ Configurado"
- ✓ Las columnas `created_at` y `updated_at` existen

### 4. Probar el Login

1. Ve a tu aplicación (local o producción)
2. Intenta iniciar sesión con cualquier usuario
3. Usa la contraseña por defecto: **`Satec2016C@U`**

Ejemplos:
- Usuario: `ahmed.elfakir` / Contraseña: `Satec2016C@U`
- Usuario: `luis.fernandez` / Contraseña: `Satec2016C@U`

## ¿Qué hace el script de migración?

El script `database-migration.sql` realiza las siguientes operaciones de forma segura:

1. ✅ **Añade columnas nuevas** a la tabla `users`:
   - `username` (único)
   - `password_hash` (encriptado con bcrypt)
   - `updated_at` (timestamp)

2. ✅ **Genera usernames automáticamente** para usuarios existentes:
   - Basados en los nombres actuales
   - Formato: nombre.apellido (en minúsculas)

3. ✅ **Asigna contraseña por defecto** a todos los usuarios:
   - Contraseña: `Satec2016C@U`
   - Hash bcrypt seguro

4. ✅ **Añade restricciones de seguridad**:
   - Username obligatorio y único
   - Password obligatorio
   - Trigger para actualizar `updated_at`

5. ✅ **Inserta usuarios nuevos** (si no existen):
   - Ahmed El Fakir → ahmed.elfakir
   - Luis Miguel Fernandez Nunez → luis.fernandez
   - Borja Lopez Vila → borja.lopez
   - Sergio Crespo Sabrido → sergio.crespo
   - Armando Vergara Verd → armando.vergara
   - Alvaro Oliver Morgado → alvaro.oliver
   - Santiago Diaz Barbara → santiago.diaz

## Resolución de Problemas

### Error: "column username already exists"

✅ **Esto es normal**: El script usa `IF NOT EXISTS`, así que es seguro ejecutarlo múltiples veces.

### Error: "duplicate key value violates unique constraint"

Esto significa que ya tienes usuarios con esos usernames. Opciones:

**Opción A - Conservar usuarios existentes:**
```sql
-- No hagas nada, los usuarios existentes se mantienen
```

**Opción B - Resetear un usuario específico:**
```sql
-- Ejemplo: resetear password de un usuario
UPDATE users
SET password_hash = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
WHERE username = 'ahmed.elfakir';
```

### No puedo iniciar sesión

1. **Verifica el username**: Debe ser exactamente como está en la base de datos
2. **Verifica la contraseña**: `Satec2016C@U` (con mayúsculas y carácter especial)
3. **Revisa la consola del navegador**: Abre DevTools (F12) para ver errores
4. **Verifica Supabase**:
   - URL correcta en `src/config.js`
   - API Key correcta
   - Políticas RLS configuradas

### Verificar que el hash de contraseña es correcto

```sql
SELECT
    username,
    password_hash,
    CASE
        WHEN password_hash = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
        THEN '✓ Contraseña por defecto'
        ELSE 'Contraseña personalizada'
    END as password_type
FROM users;
```

## Después de la Migración

### Cambiar Contraseña

Los usuarios pueden cambiar su contraseña desde la aplicación:
1. Iniciar sesión con la contraseña por defecto
2. Clic en "Cambiar contraseña" en el header
3. Introducir contraseña actual: `Satec2016C@U`
4. Introducir nueva contraseña (debe cumplir requisitos)
5. Guardar

### Requisitos de Nueva Contraseña

- ✓ Mínimo 8 caracteres
- ✓ Al menos una letra MAYÚSCULA
- ✓ Al menos una letra minúscula
- ✓ Al menos un número (0-9)
- ✓ Al menos un carácter especial (!@#$%...)

### Añadir Nuevos Usuarios

```sql
-- Generar hash de contraseña en: https://bcrypt-generator.com/
-- Rounds: 10

INSERT INTO users (name, username, password_hash)
VALUES ('Nuevo Usuario', 'nuevo.usuario', 'hash_bcrypt_aqui');
```

## Rollback (Deshacer Cambios)

Si necesitas volver atrás:

```sql
-- 1. Restaurar desde backup en Supabase Dashboard
-- O manualmente:

-- 2. Eliminar columnas añadidas
ALTER TABLE users DROP COLUMN IF EXISTS username;
ALTER TABLE users DROP COLUMN IF EXISTS password_hash;
ALTER TABLE users DROP COLUMN IF EXISTS updated_at;

-- 3. Eliminar trigger
DROP TRIGGER IF EXISTS update_users_updated_at ON users;
DROP FUNCTION IF EXISTS update_updated_at_column();
```

## Soporte

Si tienes problemas:
1. Revisa los logs en Supabase → `Logs`
2. Revisa la consola del navegador (F12)
3. Verifica que las políticas RLS estén configuradas (ver `database-schema.sql` líneas 88-127)
4. Consulta `DEPLOYMENT.md` para más detalles

## Siguiente Paso

Una vez migrada la base de datos, sigue con el despliegue en Coolify usando la guía en `DEPLOYMENT.md`.
