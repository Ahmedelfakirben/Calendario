# 🚀 Acceso Rápido - Calendario CAU SES-SGS

## ⚡ Configuración en 3 Pasos

### 📝 Paso 1: Copiar el archivo de configuración

```bash
# Abre la terminal en la carpeta del proyecto y ejecuta:
cp src/config.example.js src/config.js
```

O manualmente:
1. Abre la carpeta `src/`
2. Copia el archivo `config.example.js`
3. Pégalo en la misma carpeta y renómbralo a `config.js`

---

### 🔑 Paso 2: Configurar credenciales de Supabase

Abre el archivo `src/config.js` que acabas de crear y **reemplaza todo el contenido** con esto:

```javascript
// Configuración de Supabase
// En producción, estas variables se obtendrán de las variables de entorno de Coolify
export const SUPABASE_URL = process.env.SUPABASE_URL || 'http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io';
export const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY || 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTc2MTgyMTQwMCwiZXhwIjo0OTE3NDk1MDAwLCJyb2xlIjoiYW5vbiJ9.XVvK9HuGoW4h6k6hIG__e7_G-L_kDpKW_nsl7BAzjBA';

// Configuración de la aplicación
export const APP_CONFIG = {
  version: '3.2',
  name: 'Calendario del CAU SES-SGS'
};
```

**Guarda el archivo** y ciérralo.

---

### ▶️ Paso 3: Iniciar la aplicación

**Opción A - Doble clic (Más fácil):**
- Haz doble clic en `Calendario-CAU.vbs` (inicio silencioso)
- O doble clic en `start-calendario.bat` (con ventana)

**Opción B - Terminal:**
```bash
npm install  # Solo la primera vez
npm start
```

---

## 👤 Usuarios para Iniciar Sesión

| Usuario | Contraseña |
|---------|-----------|
| `ahmed.elfakir` | `Satec2016C@U` |
| `luis.fernandez` | `Satec2016C@U` |
| `borja.lopez` | `Satec2016C@U` |
| `sergio.crespo` | `Satec2016C@U` |
| `armando.vergara` | `Satec2016C@U` |
| `alvaro.oliver` | `Satec2016C@U` |
| `santiago.diaz` | `Satec2016C@U` |

⚠️ **Recomendación:** Cambia tu contraseña después del primer inicio de sesión.

---

## 🆘 ¿Problemas?

### Error: "Cannot find module"
```bash
npm install
```

### Error: "Failed to fetch"
- Verifica que copiaste bien las credenciales en `src/config.js`
- Asegúrate de que no hay espacios extra

### El navegador se abre vacío
- Espera unos segundos más (el servidor está iniciando)
- Recarga la página (F5)

---

## 📱 Acceso Rápido

Una vez configurado, simplemente:

1. **Doble clic** en `Calendario-CAU.vbs`
2. **Espera** 8 segundos
3. **Inicia sesión** con tu usuario

¡Listo! 🎉

---

## 📞 Soporte

¿Más ayuda? Lee la documentación completa:
- `SETUP-NUEVO-USUARIO.md` - Guía detallada
- `README.md` - Información general
- `INICIO-RAPIDO.md` - Guía de uso

---

**Calendario CAU SES-SGS v3.2**
