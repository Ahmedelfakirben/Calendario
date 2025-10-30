# 📦 Guía para Preparar el Proyecto para Git

## ⚠️ IMPORTANTE: Antes de Subir a Git

Este documento explica cómo preparar el proyecto para compartirlo mediante Git, asegurando que no se suban credenciales ni archivos innecesarios.

---

## 🔒 Protección de Credenciales

### ❌ NUNCA subas estos archivos a Git:

1. **`src/config.js`** - Contiene tus credenciales de Supabase
2. **`.env`** y archivos `.env.*` - Variables de entorno
3. **`node_modules/`** - Dependencias (se instalan con `npm install`)
4. **Archivos de testing** - Scripts temporales de desarrollo

### ✅ Ya están protegidos en `.gitignore`

El archivo `.gitignore` ya está configurado para ignorar automáticamente:
- Credenciales y configuración sensible
- Dependencias de Node.js
- Archivos de build
- Archivos temporales y de sistema
- Archivos de desarrollo y testing

---

## 📋 Checklist Antes de Hacer Commit

### 1️⃣ Verificar que `config.js` NO está en Git

```bash
# Verificar el estado de Git
git status

# Si ves "src/config.js" en la lista, significa que SÍ se va a subir
# Debes asegurarte de que está ignorado
```

**Si `config.js` ya fue trackeado previamente:**

```bash
# Eliminar del tracking de Git (pero mantener el archivo local)
git rm --cached src/config.js

# Commit del cambio
git add .gitignore
git commit -m "Ignorar archivo de configuración con credenciales"
```

### 2️⃣ Configurar Git para el nuevo usuario

Cuando otra persona clone el repositorio, deberá:

```bash
# 1. Clonar el repositorio
git clone <url-del-repositorio>
cd Calendario

# 2. Copiar el archivo de ejemplo
cp src/config.example.js src/config.js

# 3. Editar config.js con sus credenciales
# Abrir con notepad, VSCode, o cualquier editor
notepad src/config.js

# 4. Instalar dependencias
npm install

# 5. Iniciar el proyecto
npm start
```

---

## 📁 Estructura de Archivos en Git

### ✅ Archivos que SÍ deben estar en Git:

```
Calendario/
├── public/                          ← Directorio completo (HTML, etc.)
│   └── index.html
├── src/                             ← Código fuente
│   ├── components/
│   │   ├── LoginPage.jsx
│   │   ├── ChangePasswordModal.jsx
│   │   └── AuditLogHistory.jsx
│   ├── App.jsx
│   ├── index.js
│   ├── supabase.js
│   └── config.example.js            ← Archivo de ejemplo (SÍ)
├── database-schema.sql              ← Schema de base de datos
├── database-migration.sql           ← Migraciones
├── audit-log-schema.sql             ← Schema de auditoría
├── package.json                     ← Dependencias del proyecto
├── start-calendario.bat             ← Script de inicio Windows
├── Calendario-CAU.vbs               ← Script de inicio silencioso
├── stop-calendario.bat              ← Script para detener
├── crear-accesos-directos.bat      ← Crear accesos directos
├── README.md                        ← Documentación principal
├── DEPLOYMENT.md                    ← Guía de despliegue
├── MIGRATION-GUIDE.md               ← Guía de migración
├── INICIO-RAPIDO.md                 ← Guía de inicio rápido
├── INSTRUCCIONES-HISTORIAL-AUDITORIA.md
├── PREPARAR-PARA-GIT.md            ← Este archivo
├── .gitignore                       ← Configuración de Git
└── LICENSE                          ← Licencia del proyecto
```

### ❌ Archivos que NO deben estar en Git:

```
Calendario/
├── src/
│   └── config.js                    ← CREDENCIALES (ignorado)
├── node_modules/                    ← Dependencias (ignorado)
├── dist/                            ← Build (ignorado)
├── .parcel-cache/                   ← Cache (ignorado)
├── test-password.js                 ← Testing (ignorado)
├── generate-password-hash.js        ← Testing (ignorado)
├── calendario-cau-v3-*.json         ← Backups temporales (ignorado)
├── migrate-json-to-sql.js           ← Scripts de migración (ignorado)
├── fix-password-hash.sql            ← Scripts temporales (ignorado)
├── import-calendar-data.sql         ← Datos de importación (ignorado)
├── complete-migration.sql           ← Migraciones ejecutadas (ignorado)
├── calendario_cau.html              ← Versión antigua (ignorado)
└── .claude/settings.local.json      ← Settings de IDE (ignorado)
```

---

## 🚀 Comandos Git Recomendados

### Primera vez - Inicializar repositorio

```bash
# 1. Inicializar Git (si no está inicializado)
git init

# 2. Agregar todos los archivos (respetando .gitignore)
git add .

# 3. Verificar qué se va a subir
git status

# 4. Crear el commit inicial
git commit -m "Initial commit - Calendario CAU SES-SGS v3.2"

# 5. Agregar el repositorio remoto
git remote add origin <url-del-repositorio>

# 6. Subir al repositorio
git push -u origin main
```

### Verificar archivos antes de commit

```bash
# Ver archivos que se van a subir
git status

# Ver archivos ignorados
git status --ignored

# Ver diferencias
git diff

# Ver archivos trackeados
git ls-files
```

### Si accidentalmente agregaste credenciales

```bash
# 1. Eliminar del staging
git reset HEAD src/config.js

# 2. Asegurarse de que está en .gitignore
echo "src/config.js" >> .gitignore

# 3. Eliminar del historial (si ya fue commiteado)
git rm --cached src/config.js

# 4. Commit del cambio
git commit -m "Eliminar credenciales del repositorio"
```

---

## 👥 Instrucciones para Nuevos Usuarios

Crea un archivo `SETUP-NUEVO-USUARIO.md` con estas instrucciones:

### 1. Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd Calendario
```

### 2. Configurar credenciales

```bash
# Copiar el archivo de ejemplo
cp src/config.example.js src/config.js

# Editar con tus credenciales de Supabase
notepad src/config.js
```

Reemplaza:
- `'https://tu-proyecto.supabase.co'` → Tu URL de Supabase
- `'tu-clave-anonima-aqui'` → Tu clave anónima de Supabase

### 3. Instalar dependencias

```bash
npm install
```

### 4. Ejecutar la base de datos

En Supabase SQL Editor, ejecuta en orden:

1. `database-schema.sql`
2. `database-migration.sql`
3. `audit-log-schema.sql`

### 5. Iniciar la aplicación

**Opción 1 - Silencioso (sin ventanas):**
```bash
# Doble clic en:
Calendario-CAU.vbs
```

**Opción 2 - Con ventana:**
```bash
# Doble clic en:
start-calendario.bat
```

**Opción 3 - Manual:**
```bash
npm start
# Luego abre: http://localhost:1234
```

---

## 🔍 Verificación de Seguridad

Antes de hacer push, verifica que no subes credenciales:

```bash
# Buscar URLs de Supabase en archivos trackeados
git grep -i "supabase.co" $(git ls-files)

# Buscar claves que parezcan JWT
git grep -i "eyJ" $(git ls-files)

# Ver archivos que se van a subir
git diff --cached --name-only
```

⚠️ **Si encuentras credenciales en archivos trackeados:**

1. Elimínalas del archivo
2. Múevelas a `config.js` (que está ignorado)
3. Usa `config.example.js` como plantilla en Git

---

## 📝 Archivo .env (Alternativa)

Si prefieres usar variables de entorno en lugar de `config.js`:

### 1. Crear `.env` (ignorado por Git)

```bash
# .env
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-clave-anonima-aqui
```

### 2. Crear `.env.example` (SÍ va a Git)

```bash
# .env.example
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-clave-anonima-aqui
```

### 3. Modificar `config.js` para leer de `.env`

```javascript
export const SUPABASE_URL = process.env.SUPABASE_URL;
export const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY;
```

---

## ⚙️ Configuración de GitHub/GitLab

### Secrets para CI/CD

Si usas GitHub Actions o GitLab CI, configura secrets:

1. Ve a Settings → Secrets
2. Agrega:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`

---

## 🆘 Solución de Problemas

### Problema: "public/ no está en el repositorio"

```bash
# Verificar que public/ NO está en .gitignore
grep -i "public" .gitignore

# Si está, eliminarlo del .gitignore
# Luego agregar public/ al repositorio
git add public/
git commit -m "Agregar directorio public/"
```

### Problema: "src/config.js subió a Git por error"

```bash
# Eliminar del repositorio (pero mantener local)
git rm --cached src/config.js

# Asegurar que está en .gitignore
echo "src/config.js" >> .gitignore

# Commit
git add .gitignore
git commit -m "Eliminar credenciales del repositorio"

# Limpiar historial (CUIDADO: reescribe historial)
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch src/config.js" \
  --prune-empty --tag-name-filter cat -- --all
```

### Problema: "node_modules/ está en Git"

```bash
# Eliminar del repositorio
git rm -r --cached node_modules/

# Commit
git commit -m "Eliminar node_modules del repositorio"
```

---

## ✅ Checklist Final

Antes de hacer `git push`:

- [ ] `src/config.js` NO aparece en `git status`
- [ ] `src/config.example.js` SÍ está en el repositorio
- [ ] `.gitignore` está correctamente configurado
- [ ] `public/` y `src/` están en el repositorio
- [ ] `node_modules/` NO está en el repositorio
- [ ] Archivos `.sql` de schema SÍ están en el repositorio
- [ ] Archivos de documentación `.md` están actualizados
- [ ] Scripts `.bat` y `.vbs` están en el repositorio
- [ ] No hay credenciales hardcodeadas en archivos trackeados

---

## 📚 Recursos Adicionales

- [Git Ignore Patterns](https://git-scm.com/docs/gitignore)
- [Removing Sensitive Data from Git](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) - Para limpiar historial

---

**Desarrollado para:** Calendario CAU SES-SGS
**Fecha:** 30 de Octubre, 2025
**Versión:** 1.0.0
