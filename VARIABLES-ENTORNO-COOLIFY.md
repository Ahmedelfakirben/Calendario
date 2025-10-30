# 🔧 Configurar Variables de Entorno en Coolify

## ⚠️ Problema

Las credenciales de Supabase están hardcodeadas en `src/config.js`, pero Parcel necesita las variables de entorno **en tiempo de BUILD**, no en runtime.

---

## ✅ Solución: Variables de Entorno en Coolify

### Paso 1: Ir a Coolify Dashboard

1. **Abrir tu aplicación** en Coolify
2. **Settings** → **Environment Variables**
3. **Agregar las siguientes variables:**

---

## 📝 Variables a Agregar

### Variable 1: SUPABASE_URL
```
Key: SUPABASE_URL
Value: http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io
Build Time: ✅ YES (importante)
```

### Variable 2: SUPABASE_ANON_KEY
```
Key: SUPABASE_ANON_KEY
Value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTc2MTgyMTQwMCwiZXhwIjo0OTE3NDk1MDAwLCJyb2xlIjoiYW5vbiJ9.XVvK9HuGoW4h6k6hIG__e7_G-L_kDpKW_nsl7BAzjBA
Build Time: ✅ YES (importante)
```

---

## ⚙️ Configuración Visual en Coolify

```
┌─────────────────────────────────────────────────────────┐
│ Environment Variables                                    │
├─────────────────────────────────────────────────────────┤
│ ┌───────────────────────────────────────────────────┐  │
│ │ Key: SUPABASE_URL                                 │  │
│ │ Value: http://supabasekong-e004...sslip.io       │  │
│ │ [✓] Build Time  [ ] Runtime                       │  │
│ └───────────────────────────────────────────────────┘  │
│                                                          │
│ ┌───────────────────────────────────────────────────┐  │
│ │ Key: SUPABASE_ANON_KEY                            │  │
│ │ Value: eyJ0eXAiOiJKV1QiLCJhbGciOi...              │  │
│ │ [✓] Build Time  [ ] Runtime                       │  │
│ └───────────────────────────────────────────────────┘  │
│                                                          │
│ [Save]                                                   │
└─────────────────────────────────────────────────────────┘
```

---

## 🔍 ¿Por qué "Build Time"?

Parcel necesita las variables **durante el build** para reemplazar `process.env.SUPABASE_URL` en el código.

```javascript
// Antes del build (código fuente):
export const SUPABASE_URL = process.env.SUPABASE_URL || 'http://...';

// Después del build (código compilado):
export const SUPABASE_URL = 'http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io';
```

---

## 📋 Pasos Completos

### 1. Agregar Variables en Coolify

1. **Settings** → **Environment Variables**
2. **Add Variable**
3. Agregar `SUPABASE_URL`:
   - Key: `SUPABASE_URL`
   - Value: `http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io`
   - **✓ Build Time** (marcar checkbox)
   - **Save**

4. **Add Variable** (otra vez)
5. Agregar `SUPABASE_ANON_KEY`:
   - Key: `SUPABASE_ANON_KEY`
   - Value: `eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTc2MTgyMTQwMCwiZXhwIjo0OTE3NDk1MDAwLCJyb2xlIjoiYW5vbiJ9.XVvK9HuGoW4h6k6hIG__e7_G-L_kDpKW_nsl7BAzjBA`
   - **✓ Build Time** (marcar checkbox)
   - **Save**

### 2. Redeploy

Después de guardar las variables:
1. **Deploy** → **Redeploy**
2. Esperar que compile
3. **Verificar logs:**
   ```bash
   # Debería mostrar las variables durante el build:
   Building...
   SUPABASE_URL: http://supabasekong...
   ✨ Built in X.XXs
   ```

### 3. Verificar

Abre la aplicación e intenta hacer login.

---

## 🔍 Verificar que Funciona

### En el Navegador (DevTools):

1. **F12** → **Network**
2. Hacer login
3. Ver la petición a Supabase
4. Debería ser: `http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io/rest/v1/...`

### Si Funciona:
```
✅ Request a Supabase con la URL correcta
✅ Login exitoso
✅ Redirección al calendario
```

### Si No Funciona:
```
❌ 404 o CORS error
❌ Login falla
→ Verificar variables de entorno en Coolify
→ Verificar que "Build Time" está marcado
→ Redeploy de nuevo
```

---

## 🛠️ Troubleshooting

### Problema 1: Variables no se aplican

**Causa:** "Build Time" no marcado

**Solución:**
1. Editar la variable en Coolify
2. Marcar **✓ Build Time**
3. **Save**
4. **Redeploy**

### Problema 2: CORS Error

**Causa:** Supabase no permite peticiones desde tu dominio

**Solución:**
1. Ir a Supabase Dashboard
2. **Settings** → **API**
3. **CORS Settings** → Agregar tu dominio de Coolify
4. Guardar

### Problema 3: 404 Not Found

**Causa:** URL de Supabase incorrecta

**Solución:**
1. Verificar la URL en Coolify
2. No debe tener espacios ni caracteres extra
3. Debe empezar con `http://` o `https://`

---

## 📊 Alternativa: .env en el Repositorio

Si no quieres usar variables de entorno de Coolify, puedes crear un `.env` en el repo:

### Crear `.env` (NO recomendado para producción):

```bash
# .env
SUPABASE_URL=http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io
SUPABASE_ANON_KEY=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTc2MTgyMTQwMCwiZXhwIjo0OTE3NDk1MDAwLCJyb2xlIjoiYW5vbiJ9.XVvK9HuGoW4h6k6hIG__e7_G-L_kDpKW_nsl7BAzjBA
```

**⚠️ IMPORTANTE:** Si haces esto, asegúrate de que `.env` NO esté en `.gitignore` (pero es menos seguro).

---

## 🔐 Mejor Práctica

**✅ RECOMENDADO:**
- Variables en Coolify con "Build Time" activado
- `.env` NO en el repositorio
- Credenciales seguras

**❌ NO RECOMENDADO:**
- Credenciales hardcodeadas en `config.js`
- `.env` en Git (repositorio público)
- Variables sin "Build Time"

---

## ✅ Checklist

- [ ] Abrir Coolify Dashboard
- [ ] Ir a Settings → Environment Variables
- [ ] Agregar `SUPABASE_URL` con Build Time ✓
- [ ] Agregar `SUPABASE_ANON_KEY` con Build Time ✓
- [ ] Guardar variables
- [ ] Redeploy aplicación
- [ ] Verificar logs del build
- [ ] Probar login en la aplicación
- [ ] ✅ Login funciona

---

## 📝 Resumen

```
Coolify Dashboard
└── Tu Aplicación
    └── Settings
        └── Environment Variables
            ├── SUPABASE_URL (Build Time ✓)
            └── SUPABASE_ANON_KEY (Build Time ✓)

Redeploy → Build usa variables → Login funciona ✅
```

---

**Fecha:** 30 de Octubre, 2025
**Estado:** Pendiente configuración en Coolify
