# 🚀 Inicio Rápido - Calendario CAU SES-SGS

## ⚡ Uso Inmediato (3 pasos)

### 1️⃣ Crear Accesos Directos
Doble clic en: **`crear-accesos-directos.bat`**

Esto creará automáticamente en tu escritorio:
- 📅 **Calendario CAU SES-SGS** (iniciar app)
- ⛔ **Detener Calendario CAU** (cerrar app)

### 2️⃣ Migrar Datos a Supabase
Ejecuta estos archivos SQL en Supabase SQL Editor (en orden):

1. **`fix-password-hash.sql`** - Corrige las contraseñas
2. **`import-calendar-data.sql`** - Importa los 187 eventos

### 3️⃣ ¡Usar la Aplicación!
Doble clic en el acceso directo del escritorio: **Calendario CAU SES-SGS**

---

## 📋 Archivos Importantes

### 🎯 Scripts de Uso Diario:
- **Calendario-CAU.vbs** - Iniciar app (modo silencioso)
- **Detener-Calendario.vbs** - Cerrar app (modo silencioso)
- **crear-accesos-directos.bat** - Crear accesos directos en escritorio

### 📊 Migración de Datos:
- **fix-password-hash.sql** - Actualiza contraseñas de usuarios
- **import-calendar-data.sql** - Importa 187 eventos del calendario
- **complete-migration.sql** - Script combinado (opcional)

### 📚 Documentación:
- **INSTRUCCIONES-MIGRACION.md** - Guía completa de migración
- **CREAR-ACCESOS-DIRECTOS.md** - Personalización de accesos directos
- **INICIO-RAPIDO.md** - Este archivo
- **DEPLOYMENT.md** - Guía de despliegue a producción
- **MIGRATION-GUIDE.md** - Guía de migración detallada

### 🔧 Scripts de Desarrollo:
- **start-calendario.bat** - Iniciar con terminal visible
- **stop-calendario.bat** - Detener con terminal visible
- **migrate-json-to-sql.js** - Convertir JSON a SQL
- **generate-password-hash.js** - Generar hashes de contraseñas
- **test-password.js** - Verificar autenticación

---

## 🔐 Credenciales de Acceso

Después de ejecutar la migración, usa estas credenciales:

| Usuario | Contraseña |
|---------|-----------|
| `ahmed.elfakir` | `Satec2016C@U` |
| `luis.fernandez` | `Satec2016C@U` |
| `borja.lopez` | `Satec2016C@U` |
| `sergio.crespo` | `Satec2016C@U` |
| `armando.vergara` | `Satec2016C@U` |
| `alvaro.oliver` | `Satec2016C@U` |
| `santiago.diaz` | `Satec2016C@U` |

---

## ⚙️ Configuración Inicial

### Primera vez que usas la aplicación:

1. **Verifica que Node.js está instalado**
   ```bash
   node --version
   npm --version
   ```

2. **Configura las variables de entorno**
   - Copia `.env.example` a `.env`
   - Completa con tus credenciales de Supabase:
     ```
     VITE_SUPABASE_URL=tu_url_aqui
     VITE_SUPABASE_ANON_KEY=tu_key_aqui
     ```

3. **Ejecuta la migración de datos** (pasos en INSTRUCCIONES-MIGRACION.md)

4. **Crea los accesos directos**
   - Doble clic en `crear-accesos-directos.bat`

5. **¡Listo para usar!**
   - Doble clic en el acceso directo del escritorio

---

## 🌐 URLs de la Aplicación

- **Desarrollo Local**: http://localhost:5173
- **Producción**: (configura en Vercel/Netlify según DEPLOYMENT.md)

---

## 🛠️ Comandos Útiles

### Desarrollo:
```bash
npm run dev          # Iniciar servidor de desarrollo
npm run build        # Construir para producción
npm run preview      # Previsualizar build de producción
```

### Migración:
```bash
node migrate-json-to-sql.js      # Generar SQL desde JSON
node generate-password-hash.js   # Generar hash de contraseña
node test-password.js            # Verificar autenticación
```

---

## 📱 Atajos de Teclado (opcional)

Puedes configurar teclas de acceso rápido para los accesos directos:

1. Clic derecho en el acceso directo → Propiedades
2. Campo "Tecla de método abreviado"
3. Presiona la combinación deseada (ej: `Ctrl + Alt + C`)

---

## ❓ Solución Rápida de Problemas

### No puedo iniciar sesión
→ Ejecuta `fix-password-hash.sql` en Supabase

### No veo los eventos
→ Ejecuta `import-calendar-data.sql` en Supabase

### El servidor no inicia
→ Verifica que el puerto 5173 no esté en uso
→ Ejecuta `Detener-Calendario.vbs` primero

### Error de dependencias
→ Elimina la carpeta `node_modules`
→ Ejecuta `npm install`

---

## 📞 Estructura del Proyecto

```
Calendario/
├── src/                          # Código fuente
├── public/                       # Archivos públicos
├── .env                          # Variables de entorno
├── package.json                  # Dependencias
│
├── Calendario-CAU.vbs           # ⭐ Iniciar app (silencioso)
├── Detener-Calendario.vbs       # ⭐ Detener app (silencioso)
├── crear-accesos-directos.bat   # ⭐ Crear accesos directos
│
├── fix-password-hash.sql        # 🔐 Migración: contraseñas
├── import-calendar-data.sql     # 📊 Migración: eventos
│
├── INICIO-RAPIDO.md             # 📖 Esta guía
├── INSTRUCCIONES-MIGRACION.md   # 📖 Guía de migración
└── CREAR-ACCESOS-DIRECTOS.md    # 📖 Personalización
```

---

## 🎉 ¡Todo Listo!

Ahora tienes todo lo necesario para usar el Calendario CAU SES-SGS de forma profesional y eficiente.

### Flujo de trabajo típico:

1. **Lunes por la mañana**: Doble clic en "Calendario CAU SES-SGS"
2. **Durante el día**: Usar la aplicación normalmente
3. **Al terminar**: Doble clic en "Detener Calendario CAU"

### Sin ventanas molestas, sin comandos complicados, ¡solo productividad! 🚀
