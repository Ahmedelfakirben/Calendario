# 🚀 Guía de Configuración para Nuevos Usuarios

## 📋 Requisitos Previos

Antes de empezar, asegúrate de tener instalado:

- ✅ **Node.js** (versión 16 o superior) - [Descargar aquí](https://nodejs.org/)
- ✅ **Git** - [Descargar aquí](https://git-scm.com/)
- ✅ **Cuenta de Supabase** - [Crear gratis](https://supabase.com/)

---

## 🔧 Instalación Paso a Paso

### Paso 1️⃣: Clonar el Repositorio

```bash
git clone <url-del-repositorio>
cd Calendario
```

### Paso 2️⃣: Configurar Credenciales de Supabase

#### A. Obtener tus credenciales de Supabase

1. Ve a [https://app.supabase.com](https://app.supabase.com)
2. Selecciona tu proyecto (o crea uno nuevo)
3. Ve a **Settings** → **API**
4. Copia estos dos valores:
   - **Project URL** (ejemplo: `https://abc123xyz.supabase.co`)
   - **anon/public key** (una clave larga que empieza con `eyJ...`)

#### B. Crear el archivo de configuración

```bash
# Copiar el archivo de ejemplo
cp src/config.example.js src/config.js
```

#### C. Editar con tus credenciales

Abre `src/config.js` con tu editor favorito:

**Windows:**
```bash
notepad src/config.js
```

**Mac/Linux:**
```bash
nano src/config.js
# o
code src/config.js  # Si tienes VSCode
```

Reemplaza los valores de ejemplo:

```javascript
// ANTES (ejemplo)
export const SUPABASE_URL = 'https://tu-proyecto.supabase.co';
export const SUPABASE_ANON_KEY = 'tu-clave-anonima-aqui';

// DESPUÉS (con tus credenciales)
export const SUPABASE_URL = 'https://abc123xyz.supabase.co';
export const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

⚠️ **IMPORTANTE:**
- NO subas el archivo `src/config.js` a Git
- Ya está protegido en `.gitignore`
- Solo sube `src/config.example.js`

### Paso 3️⃣: Instalar Dependencias

```bash
npm install
```

Esto instalará todas las librerías necesarias (React, Supabase, bcrypt, etc.)

### Paso 4️⃣: Configurar la Base de Datos

Ve a tu proyecto de Supabase → **SQL Editor** y ejecuta estos scripts en orden:

#### 1. Schema principal
```sql
-- Ejecuta el contenido de: database-schema.sql
```

Este script crea:
- Tabla de usuarios
- Tabla de eventos
- Tabla de filtros
- Triggers y funciones

#### 2. Datos iniciales (opcional)
```sql
-- Ejecuta el contenido de: database-migration.sql
```

Este script inserta usuarios iniciales con contraseña: `Satec2016C@U`

#### 3. Sistema de auditoría
```sql
-- Ejecuta el contenido de: audit-log-schema.sql
```

Este script crea:
- Tabla de registros de auditoría
- Triggers automáticos para eventos
- Vista simplificada de logs

---

## 🎯 Iniciar la Aplicación

Tienes 3 opciones:

### Opción 1: Modo Silencioso (Recomendado) 🌟

**Windows:**

Doble clic en: `Calendario-CAU.vbs`

- ✅ Inicia el servidor automáticamente
- ✅ Abre el navegador
- ✅ Sin ventanas molestas
- ✅ Icono en la bandeja del sistema

### Opción 2: Modo con Ventana

**Windows:**

Doble clic en: `start-calendario.bat`

- ✅ Inicia el servidor
- ✅ Abre el navegador
- ✅ Muestra una ventana de terminal (puedes minimizarla)

### Opción 3: Modo Manual (Desarrollo)

```bash
npm start
```

Luego abre tu navegador en: [http://localhost:1234](http://localhost:1234)

---

## 🔐 Primer Inicio de Sesión

### Usuarios por Defecto

Si ejecutaste `database-migration.sql`, tendrás estos usuarios:

| Username | Nombre Completo | Contraseña |
|----------|-----------------|------------|
| `ahmed.elfakir` | Ahmed El Fakir | `Satec2016C@U` |
| `luis.fernandez` | Luis Miguel Fernandez | `Satec2016C@U` |
| `borja.lopez` | Borja Lopez | `Satec2016C@U` |
| `sergio.crespo` | Sergio Crespo | `Satec2016C@U` |
| `armando.vergara` | Armando Vergara | `Satec2016C@U` |
| `alvaro.oliver` | Alvaro Oliver | `Satec2016C@U` |
| `santiago.diaz` | Santiago Diaz | `Satec2016C@U` |

### Cambiar Contraseña

1. Inicia sesión con cualquier usuario
2. Haz clic en tu nombre (esquina superior derecha)
3. Selecciona "Cambiar Contraseña"
4. Ingresa:
   - Contraseña actual: `Satec2016C@U`
   - Nueva contraseña
   - Confirmar nueva contraseña

---

## 🛠️ Detener la Aplicación

### Si usaste el VBS o BAT:

**Opción 1:** Doble clic en `Detener-Calendario.vbs` o `stop-calendario.bat`

**Opción 2:** Abrir Task Manager (Ctrl+Shift+Esc) y finalizar el proceso `node.exe`

### Si usaste npm start:

Presiona `Ctrl+C` en la terminal

---

## 🎨 Crear Accesos Directos

Para tener accesos rápidos en el Escritorio y Menú Inicio:

**Windows:**

Doble clic en: `crear-accesos-directos.bat`

Esto creará:
- ✅ Acceso directo en el Escritorio
- ✅ Acceso directo en el Menú Inicio
- ✅ Configurados para usar el modo silencioso (VBS)

---

## 📚 Documentación Adicional

- **[INICIO-RAPIDO.md](INICIO-RAPIDO.md)** - Guía rápida de uso
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Despliegue en producción
- **[MIGRATION-GUIDE.md](MIGRATION-GUIDE.md)** - Migración desde versión anterior
- **[INSTRUCCIONES-HISTORIAL-AUDITORIA.md](INSTRUCCIONES-HISTORIAL-AUDITORIA.md)** - Sistema de auditoría
- **[PREPARAR-PARA-GIT.md](PREPARAR-PARA-GIT.md)** - Preparar para Git

---

## 🆘 Solución de Problemas

### Error: "Cannot find module '@supabase/supabase-js'"

```bash
# Reinstalar dependencias
npm install
```

### Error: "Failed to fetch" al iniciar sesión

1. Verifica tus credenciales en `src/config.js`
2. Asegúrate de que la URL de Supabase es correcta
3. Verifica que ejecutaste los scripts SQL en Supabase

### Error: "Port 1234 is already in use"

Otro proceso está usando el puerto 1234:

```bash
# Windows - Matar el proceso en el puerto 1234
npx kill-port 1234

# Luego reinicia
npm start
```

### El navegador se abre antes de que el servidor esté listo

Edita `start-calendario.bat` o `Calendario-CAU.vbs` y aumenta el tiempo de espera:

```batch
REM En el .bat, cambia:
timeout /t 8 /nobreak >nul
REM A:
timeout /t 15 /nobreak >nul
```

```vbscript
' En el .vbs, cambia:
WScript.Sleep 8000
' A:
WScript.Sleep 15000
```

### No aparecen datos/eventos

1. Verifica que ejecutaste `database-schema.sql` en Supabase
2. Verifica que las políticas RLS están configuradas correctamente
3. Abre la consola del navegador (F12) y busca errores

### Error al hacer build

```bash
# Limpiar cache y reinstalar
rm -rf .parcel-cache dist node_modules
npm install
npm start
```

---

## 📞 Contacto y Soporte

Para reportar problemas o sugerir mejoras:

1. Abre un **Issue** en el repositorio de Git
2. Contacta al administrador del sistema
3. Revisa la documentación en la carpeta del proyecto

---

## ✅ Checklist de Configuración

Marca cada paso a medida que lo completes:

- [ ] Clonaste el repositorio
- [ ] Instalaste Node.js
- [ ] Copiaste `config.example.js` a `config.js`
- [ ] Configuraste tus credenciales de Supabase en `config.js`
- [ ] Ejecutaste `npm install`
- [ ] Ejecutaste `database-schema.sql` en Supabase
- [ ] Ejecutaste `database-migration.sql` en Supabase (opcional)
- [ ] Ejecutaste `audit-log-schema.sql` en Supabase
- [ ] Iniciaste la aplicación (VBS, BAT o npm start)
- [ ] Pudiste iniciar sesión con un usuario
- [ ] Creaste accesos directos (opcional)

---

**¡Listo!** 🎉 Ya tienes el Calendario CAU SES-SGS funcionando.

**Desarrollado para:** Calendario CAU SES-SGS
**Versión:** 3.2
**Fecha:** 30 de Octubre, 2025
