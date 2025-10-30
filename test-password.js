// Script de diagnóstico para verificar el hash de contraseña
import bcrypt from 'bcryptjs';
import { usersAPI } from './src/supabase.js';

const PASSWORD = 'Satec2016C@U';
const CORRECT_HASH = '$2a$10$7U0.qmJttqrh.as4FHA2KOMK6TAm6DZu1qEgfMaXj/INoD60cF.Tq';
const OLD_INCORRECT_HASH = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy';

console.log('='.repeat(60));
console.log('DIAGNÓSTICO DE AUTENTICACIÓN');
console.log('='.repeat(60));
console.log('\n1. Verificando hashes locales...\n');

// Verificar hash correcto
bcrypt.compare(PASSWORD, CORRECT_HASH, (err, result) => {
  console.log(`   Hash correcto: ${CORRECT_HASH}`);
  console.log(`   ✓ Contraseña "${PASSWORD}" -> ${result ? 'VÁLIDA' : 'INVÁLIDA'}`);
});

// Verificar hash incorrecto
bcrypt.compare(PASSWORD, OLD_INCORRECT_HASH, (err, result) => {
  console.log(`\n   Hash antiguo (incorrecto): ${OLD_INCORRECT_HASH}`);
  console.log(`   ✗ Contraseña "${PASSWORD}" -> ${result ? 'VÁLIDA' : 'INVÁLIDA'}`);
});

console.log('\n2. Verificando base de datos de Supabase...\n');

// Intentar obtener un usuario de la base de datos
async function checkDatabase() {
  try {
    const users = await usersAPI.getAll();

    if (users.length === 0) {
      console.log('   ⚠ No hay usuarios en la base de datos');
      return;
    }

    console.log(`   Encontrados ${users.length} usuarios:\n`);

    for (const user of users) {
      const hashMatch = user.password_hash === CORRECT_HASH ? '✓' : '✗';
      const hashStatus = user.password_hash === CORRECT_HASH
        ? 'CORRECTO'
        : (user.password_hash === OLD_INCORRECT_HASH ? 'ANTIGUO (INCORRECTO)' : 'DESCONOCIDO');

      console.log(`   ${hashMatch} ${user.username} (${user.name})`);
      console.log(`     Hash: ${hashStatus}`);
      console.log(`     Valor: ${user.password_hash.substring(0, 30)}...`);

      // Verificar si la contraseña funciona
      const passwordWorks = await bcrypt.compare(PASSWORD, user.password_hash);
      console.log(`     Login funcionará: ${passwordWorks ? 'SÍ ✓' : 'NO ✗'}\n`);
    }

  } catch (error) {
    console.log('   ✗ Error al conectar con Supabase:');
    console.log(`     ${error.message}`);
    console.log('\n   Verifica:');
    console.log('   - Archivo .env existe con VITE_SUPABASE_URL y VITE_SUPABASE_ANON_KEY');
    console.log('   - Las credenciales son correctas');
    console.log('   - La tabla users existe en Supabase');
  }
}

setTimeout(() => {
  checkDatabase().then(() => {
    console.log('\n' + '='.repeat(60));
    console.log('RESUMEN');
    console.log('='.repeat(60));
    console.log('\nSi ves "Hash: ANTIGUO (INCORRECTO)" arriba:');
    console.log('→ DEBES ejecutar fix-password-hash.sql en Supabase SQL Editor\n');
    console.log('Si ves "Hash: CORRECTO":');
    console.log('→ El problema está resuelto, prueba el login nuevamente\n');
    process.exit(0);
  });
}, 100);
