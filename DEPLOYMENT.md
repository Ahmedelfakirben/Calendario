# Guía de Despliegue en Coolify con Supabase

Este documento describe cómo desplegar la aplicación de Calendario del CAU SES-SGS en Coolify usando Supabase como backend.

## Requisitos previos

1. Cuenta en Supabase (https://supabase.com)
2. Instancia de Coolify configurada
3. Git repository con el código

## Paso 1: Configurar Supabase

### 1.1 Crear un proyecto en Supabase

1. Ve a https://supabase.com y crea una cuenta o inicia sesión
2. Crea un nuevo proyecto
3. Anota la URL del proyecto y la clave anónima (API Key)

### 1.2 Ejecutar el esquema de base de datos

1. En el dashboard de Supabase, ve a "SQL Editor"
2. Copia y pega el contenido del archivo `database-schema.sql`
3. Ejecuta el script
4. Verifica que las tablas `users`, `events` y `user_filters` se hayan creado correctamente

### 1.3 Verificar políticas de seguridad (RLS)

El script ya configura políticas de acceso público temporal. En producción, considera:
- Implementar autenticación más robusta con Supabase Auth
- Ajustar las políticas RLS según tus necesidades de seguridad

## Paso 2: Configurar Coolify

### 2.1 Crear una nueva aplicación

1. En Coolify, ve a "Applications"
2. Crea una nueva aplicación
3. Conecta tu repositorio Git

### 2.2 Configurar variables de entorno

En la configuración de la aplicación en Coolify, añade las siguientes variables de entorno:

```
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu_clave_anonima_de_supabase
NODE_ENV=production
```

### 2.3 Configurar el build

Coolify debería detectar automáticamente que es un proyecto Node.js/Parcel. Si no:

**Build Command:**
```bash
npm install && npm run build
```

**Start Command:**
```bash
npm start
```

**Puerto:** 3000 (o el que prefieras)

### 2.4 Configurar el Dockerfile (opcional)

Si prefieres usar Docker, puedes crear un `Dockerfile`:

```dockerfile
FROM node:18-alpine

WORKDIR /app

# Copiar package files
COPY package*.json ./

# Instalar dependencias
RUN npm ci --only=production

# Copiar el resto de archivos
COPY . .

# Build de la aplicación
RUN npm run build

# Exponer puerto
EXPOSE 3000

# Comando de inicio
CMD ["npm", "start"]
```

## Paso 3: Usuarios por defecto

Los usuarios se crean automáticamente con el script SQL. Todos tienen la contraseña por defecto:

**Contraseña:** `Satec2016C@U`

### Usuarios disponibles:

1. **ahmed.elfakir** - Ahmed El Fakir
2. **luis.fernandez** - Luis Miguel Fernandez Nunez
3. **borja.lopez** - Borja Lopez Vila
4. **sergio.crespo** - Sergio Crespo Sabrido
5. **armando.vergara** - Armando Vergara Verd
6. **alvaro.oliver** - Alvaro Oliver Morgado
7. **santiago.diaz** - Santiago Diaz Barbara

### Cambiar contraseña

Cada usuario puede cambiar su contraseña desde la aplicación:
1. Iniciar sesión con usuario y contraseña por defecto
2. Hacer clic en "Cambiar contraseña" en el header
3. Introducir contraseña actual y nueva contraseña
4. La nueva contraseña debe cumplir los requisitos de seguridad

## Paso 4: Desplegar

1. Haz commit de tus cambios al repositorio Git
2. En Coolify, haz clic en "Deploy"
3. Espera a que termine el despliegue
4. Accede a la URL proporcionada por Coolify

## Verificación

1. Abre la aplicación en el navegador
2. Deberías ver la página de login
3. Intenta iniciar sesión con uno de los usuarios por defecto
4. Verifica que puedes ver el calendario y crear eventos

## Troubleshooting

### Error de conexión a Supabase

- Verifica que la URL y la API Key sean correctas
- Asegúrate de que las políticas RLS estén configuradas correctamente
- Revisa los logs de Coolify para más información

### La aplicación no carga

- Verifica que el build se completó correctamente
- Revisa los logs de la aplicación en Coolify
- Asegúrate de que el puerto esté configurado correctamente

### No puedo iniciar sesión

- Verifica que el script SQL se ejecutó correctamente
- Asegúrate de que la tabla `users` tenga datos
- Revisa la consola del navegador para errores

## Seguridad en Producción

⚠️ **IMPORTANTE:** Esta configuración inicial usa políticas de acceso público para facilitar el desarrollo. En producción, considera:

1. Implementar Supabase Auth para autenticación real
2. Ajustar las políticas RLS para restringir acceso
3. Usar HTTPS en todas las conexiones
4. Implementar rate limiting
5. Rotar las claves API regularmente
6. Configurar backup automático de la base de datos

## Mantenimiento

### Actualizar la aplicación

1. Haz cambios en el código
2. Commit y push a Git
3. Coolify desplegará automáticamente (si está configurado)

### Gestión de usuarios

Puedes añadir/modificar usuarios directamente en Supabase:

```sql
-- Añadir nuevo usuario
INSERT INTO users (name, username, password_hash) VALUES
  ('Nuevo Usuario', 'nuevo.usuario', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy');

-- El hash de contraseña debe generarse con bcrypt
```

### Backup de datos

Configura backups automáticos en Supabase desde el dashboard.

## Soporte

Para problemas o dudas:
1. Revisa los logs en Coolify
2. Revisa los logs en Supabase
3. Consulta la documentación de Supabase: https://supabase.com/docs
4. Consulta la documentación de Coolify: https://coolify.io/docs
