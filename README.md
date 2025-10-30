# Calendario del CAU SES-SGS v3.2

Sistema de gestión de calendario para el Centro de Atención a Usuarios (CAU) del SES-SGS, con sistema de autenticación integrado.

## 🎯 Características

- 📅 **Vistas múltiples**: Mensual, Anual y Diaria
- 👥 **Multi-usuario**: Gestión de eventos para múltiples usuarios
- 🔐 **Autenticación**: Sistema de login con usuarios y contraseñas
- 🔑 **Cambio de contraseña**: Los usuarios pueden cambiar su contraseña
- 📊 **Dashboard**: Estadísticas por usuario y tipo de evento
- 🔄 **Tiempo real**: Sincronización automática con Supabase
- 🎨 **8 tipos de eventos**: Vacaciones, Guardias, Visitas Médicas, Reuniones, Jornadas 18:30, OFI, Compras, Manuales
- 🔁 **Eventos recurrentes**: Soporte para eventos diarios, semanales y personalizados
- 📱 **Responsive**: Diseño adaptable a todos los dispositivos

## 🚀 Inicio Rápido

### Requisitos

- Node.js 18+
- npm o yarn
- Cuenta en Supabase

### Instalación Local

```bash
# Clonar el repositorio
git clone <tu-repositorio>
cd Calendario

# Instalar dependencias
npm install

# Configurar variables de entorno (ver .env.example)
# Editar src/config.js con tus credenciales de Supabase

# Iniciar en modo desarrollo
npm start
```

La aplicación estará disponible en `http://localhost:1234`

### Usuarios por Defecto

Todos los usuarios tienen la contraseña por defecto: **`Satec2016C@U`**

| Usuario | Username |
|---------|----------|
| Ahmed El Fakir | `ahmed.elfakir` |
| Luis Miguel Fernandez Nunez | `luis.fernandez` |
| Borja Lopez Vila | `borja.lopez` |
| Sergio Crespo Sabrido | `sergio.crespo` |
| Armando Vergara Verd | `armando.vergara` |
| Alvaro Oliver Morgado | `alvaro.oliver` |
| Santiago Diaz Barbara | `santiago.diaz` |

## 📦 Despliegue

### Base de Datos Nueva

Si es la primera vez que configuras el proyecto:

1. Lee **`DEPLOYMENT.md`** - Guía completa de despliegue
2. Ejecuta **`database-schema.sql`** en Supabase SQL Editor

### Base de Datos Existente

Si ya tienes una base de datos con datos:

1. Lee **`MIGRATION-GUIDE.md`** - Guía de migración
2. Ejecuta **`database-migration.sql`** en Supabase SQL Editor

### Despliegue en Coolify

Ver guía completa en **`DEPLOYMENT.md`**

Variables de entorno necesarias:
```env
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu_clave_anonima
NODE_ENV=production
```

## 🔒 Seguridad

### Contraseñas

- Todas las contraseñas se hashean con **bcrypt** (10 rounds)
- Contraseña por defecto: `Satec2016C@U`
- Los usuarios deben cambiar su contraseña al primer inicio de sesión

### Requisitos de Contraseña

- ✓ Mínimo 8 caracteres
- ✓ Al menos una letra MAYÚSCULA
- ✓ Al menos una letra minúscula
- ✓ Al menos un número
- ✓ Al menos un carácter especial

### Sesiones

- Gestión de sesiones con `localStorage`
- Cierre de sesión manual disponible
- Las sesiones persisten hasta que el usuario cierra sesión

## 🛠️ Tecnologías

- **Frontend**: React 19, Parcel
- **Backend**: Supabase (PostgreSQL + Realtime)
- **Autenticación**: bcryptjs
- **Estilos**: CSS vanilla (inline styles + classes)

## 📁 Estructura del Proyecto

```
Calendario/
├── src/
│   ├── components/
│   │   ├── LoginPage.jsx           # Página de inicio de sesión
│   │   └── ChangePasswordModal.jsx # Modal cambio de contraseña
│   ├── App.jsx                      # Componente principal
│   ├── supabase.js                  # API de Supabase
│   ├── config.js                    # Configuración
│   └── index.js                     # Punto de entrada
├── public/
│   └── index.html                   # HTML base
├── database-schema.sql              # Esquema para BD nueva
├── database-migration.sql           # Migración para BD existente
├── DEPLOYMENT.md                    # Guía de despliegue
├── MIGRATION-GUIDE.md              # Guía de migración
└── package.json
```

## 📖 Uso

### Iniciar Sesión

1. Abre la aplicación
2. Introduce tu username (ej: `ahmed.elfakir`)
3. Introduce la contraseña: `Satec2016C@U`
4. Haz clic en "Iniciar sesión"

### Crear Eventos

1. Selecciona una vista (Mensual/Anual/Diaria)
2. Haz clic en "Nuevo Evento" o en un día específico
3. Rellena el formulario:
   - **Tipo**: Vacaciones, Guardias, etc.
   - **Usuario**: Selecciona el usuario
   - **Fechas**: Inicio y fin
   - **Horario**: Opcional para algunos tipos
   - **Repetición**: Opcional (diario/semanal/personalizado)
4. Guarda el evento

### Cambiar Contraseña

1. Haz clic en "Cambiar contraseña" en el header
2. Introduce tu contraseña actual
3. Introduce la nueva contraseña (debe cumplir requisitos)
4. Confirma la nueva contraseña
5. Guarda

### Dashboard

1. Haz clic en "Dashboard" en los controles
2. Visualiza estadísticas por usuario:
   - Total de días de vacaciones
   - Guardias realizadas
   - Visitas médicas
   - Reuniones asistidas
   - Y más...

## 🎨 Tipos de Eventos

| Tipo | Código | Color |
|------|--------|-------|
| Vacaciones | V | Azul |
| Guardias | G | Verde |
| Visitas Médicas | VM | Amarillo |
| Reuniones | R | Morado |
| Jornada 18:30 | J-18:30 | Púrpura |
| OFI | OFI | Rojo |
| Compras | C | Índigo |
| Manuales | M | Cian |

## 🔧 Scripts Disponibles

```bash
# Desarrollo
npm start          # Inicia servidor de desarrollo

# Producción
npm run build      # Compila para producción

# Otros
npm audit fix      # Corrige vulnerabilidades
```

## 📝 Notas de Versión

### v3.2 (Actual)
- ✅ Sistema de autenticación completo
- ✅ Login con username/password
- ✅ Cambio de contraseña
- ✅ Gestión de sesiones
- ✅ Migraciones de base de datos
- ✅ Guías de despliegue actualizadas

### v3.1
- Dashboard de estadísticas
- Eventos recurrentes
- Vista anual mejorada

## 🐛 Solución de Problemas

### No puedo iniciar sesión

1. Verifica el username (minúsculas, formato: nombre.apellido)
2. Verifica la contraseña: `Satec2016C@U` (exacta)
3. Abre la consola del navegador (F12) para ver errores
4. Verifica la conexión a Supabase

### Los eventos no se cargan

1. Verifica tu conexión a Internet
2. Verifica las credenciales de Supabase en `config.js`
3. Revisa las políticas RLS en Supabase
4. Verifica los logs en Supabase Dashboard

### Error al cambiar contraseña

1. Verifica que la contraseña actual sea correcta
2. Asegúrate de que la nueva contraseña cumpla todos los requisitos
3. Confirma que ambas contraseñas nuevas coincidan

## 📞 Soporte

Para reportar problemas o solicitar funcionalidades:
- Revisa `DEPLOYMENT.md` para problemas de despliegue
- Revisa `MIGRATION-GUIDE.md` para problemas de migración
- Consulta los logs de Supabase
- Abre un issue en el repositorio

## 📄 Licencia

ISC

## 👥 Créditos

Desarrollado por **Satecgroup** para el CAU SES-SGS

---

**¿Necesitas ayuda?** Lee las guías:
- 📘 **Instalación nueva**: `DEPLOYMENT.md`
- 🔄 **Migración**: `MIGRATION-GUIDE.md`
