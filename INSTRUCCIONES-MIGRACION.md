# Instrucciones de Migración - Calendario CAU SES-SGS

## Resumen

Este documento explica cómo migrar tu calendario desde el archivo JSON a la base de datos de Supabase.

## Archivos generados

1. **fix-password-hash.sql** - Actualiza el hash de contraseña de los usuarios
2. **import-calendar-data.sql** - Importa los 187 eventos del calendario
3. **complete-migration.sql** - Script combinado (opcional)

## Datos a migrar

- **Total de eventos**: 187
- **Usuarios**: 7 usuarios del equipo CAU SES-SGS
- **Contraseña por defecto**: `Satec2016C@U`

## Pasos para la migración

### Opción A: Migración completa (Recomendado)

#### Paso 1: Actualizar hash de contraseña

1. Abre tu proyecto en [Supabase Dashboard](https://supabase.com/dashboard)
2. Ve a **SQL Editor** en el menú lateral
3. Crea una nueva query
4. Copia y pega el contenido de `fix-password-hash.sql`
5. Haz clic en **Run** (F5)
6. Verifica que se muestre "✓ Hash correcto" para todos los usuarios

#### Paso 2: Importar eventos del calendario

1. En el mismo **SQL Editor**
2. Crea una nueva query
3. Copia y pega el contenido de `import-calendar-data.sql`
4. Haz clic en **Run** (F5)
5. Espera a que se completen las 187 inserciones

#### Paso 3: Verificar la importación

Ejecuta esta query en SQL Editor:

```sql
SELECT
  (SELECT COUNT(*) FROM users) as total_usuarios,
  (SELECT COUNT(*) FROM events) as total_eventos;

-- Ver los primeros 10 eventos importados
SELECT e.title, e.type, u.name, e.start_date, e.end_date
FROM events e
JOIN users u ON e.user_id = u.id
ORDER BY e.start_date
LIMIT 10;
```

### Opción B: Migración paso a paso

Si prefieres hacerlo en pasos separados, puedes ejecutar cada script individualmente en el orden indicado arriba.

## Credenciales de acceso después de la migración

Una vez completada la migración, puedes iniciar sesión con:

### Usuarios disponibles:
- **ahmed.elfakir** / Satec2016C@U
- **luis.fernandez** / Satec2016C@U
- **borja.lopez** / Satec2016C@U
- **sergio.crespo** / Satec2016C@U
- **armando.vergara** / Satec2016C@U
- **alvaro.oliver** / Satec2016C@U
- **santiago.diaz** / Satec2016C@U

## Tipos de eventos migrados

Los eventos importados incluyen:
- ✈️ Vacaciones
- 🛡️ Guardias
- 🏢 OFI (Oficina)
- ⏰ Jornada (Jornadas extendidas)
- 🏥 Visitas médicas
- 📅 Reuniones
- 🛒 Compras
- 📚 Manuales

## Eventos recurrentes

El script mantiene la información de repetición para eventos recurrentes:
- Frecuencia (daily, weekly, everyXWeeks)
- Intervalo de repetición
- Días de la semana
- Excepciones

## Solución de problemas

### Error: "Contraseña incorrecta" al hacer login

**Causa**: El hash de contraseña no se actualizó correctamente.

**Solución**: Ejecuta nuevamente `fix-password-hash.sql`

### Error: "user_id does not exist"

**Causa**: La tabla users no tiene los usuarios necesarios.

**Solución**: Ejecuta primero el script `database-schema.sql` o `database-migration.sql`

### Error: Eventos duplicados

**Causa**: Ya ejecutaste el script de importación anteriormente.

**Solución**: Limpia los eventos antes de volver a importar:

```sql
DELETE FROM events;
```

Luego ejecuta nuevamente `import-calendar-data.sql`

## Verificación final

Después de la migración, verifica que:

1. ✅ Todos los usuarios tienen el hash correcto
2. ✅ Se importaron los 187 eventos
3. ✅ Puedes iniciar sesión con cualquier usuario
4. ✅ Los eventos aparecen en el calendario de la aplicación

## Soporte

Si encuentras algún problema durante la migración, revisa:

1. Los logs de Supabase SQL Editor
2. La consola del navegador para errores de la aplicación
3. Verifica que las variables de entorno (.env) estén configuradas correctamente

## Archivos de respaldo

- **calendario-cau-v3-2025-10-30.json** - Respaldo original de tus datos
- Conserva este archivo como backup por seguridad
