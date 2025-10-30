// Script para convertir el JSON del calendario a SQL para Supabase
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Leer el archivo JSON
const jsonPath = path.join(__dirname, 'calendario-cau-v3-2025-10-30.json');
const jsonData = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));

// Mapeo de nombres de usuarios a usernames
const userMapping = {
  'Ahmed El Fakir': 'ahmed.elfakir',
  'Luis Miguel Fernandez Nunez': 'luis.fernandez',
  'Borja Lopez Vila': 'borja.lopez',
  'Sergio Crespo Sabrido': 'sergio.crespo',
  'Armando Vergara Verd': 'armando.vergara',
  'Alvaro Oliver Morgado': 'alvaro.oliver',
  'Santiago Diaz Barbara': 'santiago.diaz'
};

// Función para escapar strings en SQL
function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL';
  if (str === '') return "''";
  return "'" + str.toString().replace(/'/g, "''") + "'";
}

// Función para convertir array a formato PostgreSQL
function arrayToPostgres(arr) {
  if (!arr || arr.length === 0) return 'ARRAY[]::integer[]';
  return `ARRAY[${arr.join(',')}]::integer[]`;
}

// Función para convertir fechas a formato PostgreSQL
function dateArrayToPostgres(arr) {
  if (!arr || arr.length === 0) return 'ARRAY[]::date[]';
  const dates = arr.map(d => `'${d}'::date`).join(',');
  return `ARRAY[${dates}]`;
}

// Función para convertir frecuencia de repetición
function convertRepetitionFrequency(freq) {
  if (!freq || freq === '') return 'NULL';
  return escapeSql(freq);
}

console.log('='.repeat(80));
console.log('MIGRACIÓN DE DATOS: JSON a Supabase SQL');
console.log('='.repeat(80));
console.log(`\nArchivo fuente: ${jsonPath}`);
console.log(`Total de eventos: ${jsonData.events.length}`);
console.log('\nGenerando SQL...\n');

// Generar SQL
let sql = `-- ============================================
-- MIGRACIÓN DE DATOS DEL CALENDARIO
-- Generado automáticamente desde: calendario-cau-v3-2025-10-30.json
-- Fecha: ${new Date().toISOString()}
-- ============================================
-- Total de eventos: ${jsonData.events.length}

-- ============================================
-- PASO 1: Insertar eventos
-- ============================================

`;

let successCount = 0;
let errorCount = 0;
const errors = [];

jsonData.events.forEach((event, index) => {
  try {
    const username = userMapping[event.user];
    if (!username) {
      throw new Error(`Usuario no encontrado en el mapeo: ${event.user}`);
    }

    // Construir el INSERT
    const title = escapeSql(event.title);
    const type = escapeSql(event.type);
    const startDate = escapeSql(event.startDate);
    const endDate = escapeSql(event.endDate);
    const startTime = event.startTime && event.startTime !== '' ? escapeSql(event.startTime) : 'NULL';
    const endTime = event.endTime && event.endTime !== '' ? escapeSql(event.endTime) : 'NULL';
    const description = event.description ? escapeSql(event.description) : "''";
    const repetitionFrequency = convertRepetitionFrequency(event.repetitionFrequency);
    const repetitionInterval = event.repetitionInterval || 1;
    const repetitionWeekdays = arrayToPostgres(event.repetitionWeekdays || []);
    const exceptions = dateArrayToPostgres(event.exceptions || []);

    sql += `-- Evento ${index + 1}: ${event.title} (${event.user})
INSERT INTO events (
  title, type, user_id, start_date, end_date, start_time, end_time,
  description, repetition_frequency, repetition_interval,
  repetition_weekdays, exceptions
)
SELECT
  ${title},
  ${type},
  u.id,
  ${startDate}::date,
  ${endDate}::date,
  ${startTime}${startTime !== 'NULL' ? '::time' : ''},
  ${endTime}${endTime !== 'NULL' ? '::time' : ''},
  ${description},
  ${repetitionFrequency},
  ${repetitionInterval},
  ${repetitionWeekdays},
  ${exceptions}
FROM users u
WHERE u.username = '${username}';

`;

    successCount++;
  } catch (error) {
    errorCount++;
    errors.push({ index: index + 1, event: event.title, error: error.message });
    sql += `-- ERROR en evento ${index + 1}: ${error.message}\n-- ${JSON.stringify(event)}\n\n`;
  }
});

sql += `
-- ============================================
-- RESUMEN DE LA MIGRACIÓN
-- ============================================
-- Total de eventos procesados: ${jsonData.events.length}
-- Eventos convertidos exitosamente: ${successCount}
-- Errores encontrados: ${errorCount}
--
-- Para verificar los datos importados:
-- SELECT COUNT(*) FROM events;
-- SELECT e.title, e.type, u.name, e.start_date, e.end_date
-- FROM events e
-- JOIN users u ON e.user_id = u.id
-- ORDER BY e.start_date
-- LIMIT 10;
`;

// Guardar el SQL en un archivo
const outputPath = path.join(__dirname, 'import-calendar-data.sql');
fs.writeFileSync(outputPath, sql, 'utf8');

console.log('='.repeat(80));
console.log('RESUMEN');
console.log('='.repeat(80));
console.log(`Total de eventos: ${jsonData.events.length}`);
console.log(`Convertidos exitosamente: ${successCount}`);
console.log(`Errores: ${errorCount}`);

if (errors.length > 0) {
  console.log('\nErrores encontrados:');
  errors.forEach(err => {
    console.log(`  - Evento ${err.index} (${err.event}): ${err.error}`);
  });
}

console.log(`\nArchivo SQL generado: ${outputPath}`);
console.log('\nPróximos pasos:');
console.log('1. Revisa el archivo import-calendar-data.sql');
console.log('2. Ejecuta fix-password-hash.sql en Supabase SQL Editor');
console.log('3. Ejecuta import-calendar-data.sql en Supabase SQL Editor');
console.log('='.repeat(80));
