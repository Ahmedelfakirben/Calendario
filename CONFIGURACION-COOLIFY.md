# 🚀 Configuración para Deploy en Coolify

## ⚠️ Problema: React Refresh en Producción

Si ves el error:
```
React Refresh runtime should not be included in the production bundle
```

Significa que Coolify está ejecutando en **modo desarrollo** (`npm start`) en lugar de **modo producción** (build + serve).

---

## ✅ Solución: Configurar Nixpacks

### Archivos creados:

#### 1. `nixpacks.toml` (Configuración de Coolify)

```toml
[phases.setup]
nixPkgs = ['nodejs_20']

[phases.install]
cmds = ['npm ci']

[phases.build]
cmds = ['npm run build']

[start]
cmd = 'npx serve dist -s -l 3000'
```

**Explicación:**
- `setup`: Instala Node.js 20
- `install`: Instala dependencias con `npm ci` (más rápido y determinista)
- `build`: Ejecuta el build de producción
- `start`: Sirve los archivos estáticos del directorio `dist/`

---

## 📦 Dependencias Agregadas

### `serve` - Servidor estático

Agregado a `package.json`:

```json
"dependencies": {
  "serve": "^14.2.3"
}
```

**¿Para qué?**
- Sirve archivos estáticos del directorio `dist/`
- Maneja SPA (Single Page Application) con `-s`
- Redirecciona todas las rutas a `index.html`

---

## 🔧 Scripts Agregados

```json
"scripts": {
  "start": "parcel public/index.html",      // Desarrollo local
  "build": "parcel build public/index.html", // Build de producción
  "serve": "serve dist -s -l 3000",          // Servir archivos estáticos
  "prod": "npm run build && npm run serve"   // Build + Serve (testing local)
}
```

---

## 🚀 Instrucciones de Deploy

### Paso 1: Asegurar que los archivos están en Git

```bash
git add nixpacks.toml package.json
git commit -m "feat: Configurar Coolify para servir build de producción"
git push origin main
```

### Paso 2: En Coolify Dashboard

1. **Ir a tu aplicación**
2. **Settings** → **Build & Deploy**
3. **Verificar que detecta `nixpacks.toml`**
4. **Hacer Redeploy**

### Paso 3: Verificar el Build

En los logs de Coolify deberías ver:

```bash
# Fase de instalación
npm ci
# ✅ added 309 packages

# Fase de build
npm run build
# ✅ Built in 2.78s

# Fase de inicio
npx serve dist -s -l 3000
# ✅ Server running at http://localhost:3000
```

---

## 🔍 Verificación

### ✅ Build Correcto:

```bash
# En los logs de Coolify:
✨ Built in 2.78s
dist\index.html              9.52 kB
dist\public.1b7aecbd.js    437.83 kB

# Al abrir la URL:
✅ Sin error de React Refresh
✅ Aplicación carga correctamente
✅ Login funciona
```

### ❌ Build Incorrecto:

```bash
# En los logs de Coolify:
Server running at http://localhost:3000
Building...  ← Modo desarrollo (MAL)

# Al abrir la URL:
❌ Error: React Refresh runtime should not be included
```

---

## 🛠️ Testing Local de Producción

Para probar localmente el mismo setup que Coolify:

```bash
# 1. Build
npm run build

# 2. Servir archivos estáticos
npm run serve

# O todo junto:
npm run prod
```

Luego abre: `http://localhost:3000`

---

## 📋 Alternativa: Variables de Entorno en Coolify

Si `nixpacks.toml` no funciona, puedes configurar en Coolify:

### Settings → Environment Variables:

```bash
# Build Command
npm run build

# Start Command
npx serve dist -s -l 3000

# Install Command
npm ci
```

---

## 🔧 Solución de Problemas

### Problema 1: "serve: command not found"

**Causa:** `serve` no está instalado

**Solución:**
```bash
# Asegurar que serve está en dependencies (no devDependencies)
npm install --save serve
```

### Problema 2: Página en blanco

**Causa:** Rutas incorrectas en el build

**Solución:** Verifica en `dist/index.html` que las rutas sean relativas:
```html
<!-- CORRECTO -->
<script src="./public.31b563d9.js"></script>

<!-- INCORRECTO -->
<script src="/public.31b563d9.js"></script>
```

### Problema 3: 404 al recargar página

**Causa:** Servidor no redirige a index.html

**Solución:** Usar la opción `-s` en serve:
```bash
serve dist -s  # Single Page Application mode
```

### Problema 4: Puerto incorrecto

**Causa:** Coolify espera el puerto 3000

**Solución:** Usar `-l 3000`:
```bash
serve dist -s -l 3000
```

---

## 📊 Comparación: Desarrollo vs Producción

| Aspecto | Desarrollo (`npm start`) | Producción (`build + serve`) |
|---------|-------------------------|------------------------------|
| **Comando** | `parcel public/index.html` | `parcel build` + `serve dist` |
| **Hot Reload** | ✅ Sí | ❌ No |
| **React Refresh** | ✅ Incluido | ❌ Excluido |
| **Optimizado** | ❌ No | ✅ Sí (minificado) |
| **Tamaño bundle** | ~2 MB | ~437 KB |
| **Source maps** | ✅ Inline | ❌ Externo |
| **Para** | Desarrollo local | Producción/Coolify |

---

## 🎯 Resumen

### Antes (INCORRECTO):
```bash
npm start  # Modo desarrollo
└── Parcel dev server
    └── React Refresh incluido ❌
```

### Después (CORRECTO):
```bash
npm run build  # Build de producción
└── dist/
    └── Archivos optimizados ✅

npx serve dist  # Servir estáticos
└── Sin React Refresh ✅
```

---

## ✅ Checklist

- [ ] `nixpacks.toml` creado
- [ ] `serve` agregado a dependencies
- [ ] Scripts `serve` y `prod` agregados
- [ ] Committed y pushed a Git
- [ ] Redeploy en Coolify
- [ ] Verificar logs: debe mostrar "Built in X.XXs"
- [ ] Verificar URL: sin error de React Refresh
- [ ] Login funciona correctamente

---

**Fecha:** 30 de Octubre, 2025
**Estado:** ✅ Listo para producción
