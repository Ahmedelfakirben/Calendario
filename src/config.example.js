// ============================================
// CONFIGURACIÓN DE SUPABASE - ARCHIVO DE EJEMPLO
// ============================================
//
// INSTRUCCIONES:
// 1. Copia este archivo y renómbralo a "config.js"
// 2. Reemplaza los valores de ejemplo con tus credenciales de Supabase
// 3. NO subas el archivo "config.js" a Git (ya está en .gitignore)
//
// Para obtener tus credenciales de Supabase:
// 1. Ve a tu proyecto en https://app.supabase.com
// 2. Settings → API
// 3. Copia "Project URL" y "anon/public key"
// ============================================

// URL de tu proyecto de Supabase
export const SUPABASE_URL = process.env.SUPABASE_URL || 'https://tu-proyecto.supabase.co';

// Clave anónima/pública de Supabase (es seguro exponerla en el frontend)
export const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY || 'tu-clave-anonima-aqui';

// Configuración de la aplicación
export const APP_CONFIG = {
  version: '3.2',
  name: 'Calendario del CAU SES-SGS'
};
