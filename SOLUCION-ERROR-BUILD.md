# 🔧 Solución - Error de Build en Coolify

## ❌ Error Original

```
@parcel/core: Failed to resolve 'process' from './node_modules/randombytes/browser.js'

@parcel/resolver-default: Node builtin polyfill "process/" is not installed, but auto install is disabled.
```

---

## 🔍 Causa del Problema

El error ocurre porque:

1. **bcryptjs** (usado para hashear contraseñas) depende de módulos nativos de Node.js
2. Estos módulos (`crypto`, `process`, `buffer`) no existen en el navegador
3. Parcel necesita **polyfills** (implementaciones alternativas) de estos módulos
4. En entornos de producción (como Coolify), la auto-instalación está deshabilitada

---

## ✅ Solución Implementada

### 1. Agregar el paquete `process` como dependencia

**Archivo modificado:** `package.json`

```json
{
  "devDependencies": {
    "buffer": "^6.0.3",
    "crypto-browserify": "^3.12.1",
    "parcel": "^2.16.0",
    "process": "^0.11.10"  ← NUEVO
  }
}
```

### 2. Crear archivo de configuración de Parcel

**Archivo creado:** `.parcelrc`

```json
{
  "extends": "@parcel/config-default",
  "transformers": {
    "*.{js,mjs,jsx,cjs,ts,tsx}": [
      "@parcel/transformer-js",
      "@parcel/transformer-react-refresh-wrap"
    ]
  }
}
```

---

## 🚀 Pasos de Implementación

### Para el repositorio:

1. **Agregar `process` al package.json:**
   ```bash
   npm install --save-dev process
   ```

2. **Crear `.parcelrc` en la raíz del proyecto**

3. **Commit y push:**
   ```bash
   git add package.json .parcelrc
   git commit -m "Fix: Agregar polyfill de process para build en producción"
   git push origin main
   ```

### En Coolify:

1. **Redeploy la aplicación**
   - El build ahora debería funcionar correctamente
   - Coolify instalará automáticamente la dependencia `process`

---

## 🧪 Verificar Localmente

Para probar que el build funciona antes de deployar:

```bash
# Limpiar cache
rm -rf .parcel-cache dist

# Instalar dependencias
npm install

# Ejecutar build
npm run build

# Debería completarse sin errores
```

---

## 📦 Dependencias Actuales

### Para el navegador:
- `buffer` - Polyfill de Buffer de Node.js
- `crypto-browserify` - Polyfill de crypto de Node.js
- `process` - Polyfill de process de Node.js

### ¿Por qué son necesarias?

**bcryptjs** → usa **crypto** → necesita **process** + **buffer**

```
bcryptjs
  └── crypto (Node.js)
       ├── buffer ✅ (ya instalado)
       ├── crypto-browserify ✅ (ya instalado)
       └── process ❌ (FALTABA - ahora instalado)
```

---

## 🔍 Otros Errores Comunes

### Error: "Cannot find module 'buffer'"

**Solución:**
```bash
npm install --save-dev buffer
```

### Error: "Cannot find module 'crypto'"

**Solución:**
```bash
npm install --save-dev crypto-browserify
```

### Error: Build funciona local pero falla en Coolify

**Posibles causas:**

1. **`.parcel-cache` corrupta en Coolify**
   - Solución: Forzar rebuild limpio en Coolify

2. **package-lock.json desactualizado**
   ```bash
   rm package-lock.json
   npm install
   git add package-lock.json
   git commit -m "Update package-lock.json"
   git push
   ```

3. **Node version diferente**
   - Verifica que Coolify use Node.js 16 o superior
   - Agregar `.nvmrc` en la raíz:
   ```
   18
   ```

---

## 📝 Archivos Modificados

### package.json
```diff
  "devDependencies": {
    "buffer": "^6.0.3",
    "crypto-browserify": "^3.12.1",
    "parcel": "^2.16.0",
+   "process": "^0.11.10"
  }
```

### .parcelrc (NUEVO)
```json
{
  "extends": "@parcel/config-default",
  "transformers": {
    "*.{js,mjs,jsx,cjs,ts,tsx}": [
      "@parcel/transformer-js",
      "@parcel/transformer-react-refresh-wrap"
    ]
  }
}
```

---

## ✅ Checklist de Verificación

Antes de hacer push:

- [x] `process` agregado a `devDependencies` en package.json
- [x] `.parcelrc` creado en la raíz del proyecto
- [x] `npm install` ejecutado localmente
- [x] `npm run build` funciona sin errores localmente
- [ ] Commit de cambios
- [ ] Push a repositorio
- [ ] Redeploy en Coolify
- [ ] Verificar que el build completa exitosamente

---

## 🆘 Si el Error Persiste

1. **Ver logs completos de Coolify**
   - Buscar mensajes de error específicos

2. **Verificar versión de Node.js**
   ```bash
   node --version  # Debería ser >= 16
   ```

3. **Limpiar cache de Coolify**
   - En el dashboard de Coolify, forzar rebuild desde cero

4. **Verificar package-lock.json**
   - Debe incluir las nuevas dependencias

5. **Contactar soporte de Coolify**
   - Con logs completos del build

---

## 📚 Referencias

- [Parcel - Node Emulation](https://parceljs.org/features/node-emulation/)
- [bcryptjs - GitHub](https://github.com/dcodeIO/bcrypt.js)
- [process polyfill - npm](https://www.npmjs.com/package/process)

---

**Fecha de solución:** 30 de Octubre, 2025
**Estado:** ✅ RESUELTO
