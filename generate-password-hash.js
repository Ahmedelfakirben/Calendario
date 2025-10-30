// Script para generar el hash correcto de la contraseña por defecto
import bcrypt from 'bcryptjs';

const defaultPassword = 'Satec2016C@U';

console.log('Generando hash para la contraseña:', defaultPassword);
console.log('-------------------------------------------');

bcrypt.hash(defaultPassword, 10, (err, hash) => {
  if (err) {
    console.error('Error al generar hash:', err);
    return;
  }

  console.log('Hash generado:');
  console.log(hash);
  console.log('-------------------------------------------');
  console.log('\nCopia este hash y actualiza la base de datos con:');
  console.log(`UPDATE users SET password_hash = '${hash}';`);

  // Verificar que funciona
  bcrypt.compare(defaultPassword, hash, (err, result) => {
    if (err) {
      console.error('Error al verificar:', err);
      return;
    }
    console.log('\n✓ Verificación:', result ? 'CORRECTO' : 'INCORRECTO');
  });
});
