// Configuración de Supabase
// En producción, estas variables se obtendrán de las variables de entorno de Coolify
export const SUPABASE_URL = process.env.SUPABASE_URL || 'http://supabasekong-e004o8s4s40go0ssk4swok4o.91.99.232.186.sslip.io';
export const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY || 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTc2MTgyMTQwMCwiZXhwIjo0OTE3NDk1MDAwLCJyb2xlIjoiYW5vbiJ9.XVvK9HuGoW4h6k6hIG__e7_G-L_kDpKW_nsl7BAzjBA';

// Configuración de la aplicación
export const APP_CONFIG = {
  version: '3.2',
  name: 'Calendario del CAU SES-SGS'
};