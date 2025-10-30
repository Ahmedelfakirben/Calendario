# Crear Accesos Directos - Calendario CAU SES-SGS

## 📝 Archivos Creados

Se han creado los siguientes scripts para facilitar el uso de la aplicación:

### Scripts de Inicio:

1. **Calendario-CAU.vbs** ⭐ (RECOMENDADO)
   - Inicia la aplicación en modo silencioso (sin ventanas)
   - Abre automáticamente el navegador
   - Instalación automática de dependencias en primera ejecución

2. **start-calendario.bat**
   - Inicia la aplicación mostrando una ventana de terminal
   - Útil para ver mensajes de error o depuración

### Scripts de Detención:

3. **Detener-Calendario.vbs** ⭐ (RECOMENDADO)
   - Detiene la aplicación en modo silencioso
   - Cierra todos los procesos de Node.js relacionados

4. **stop-calendario.bat**
   - Detiene la aplicación mostrando una ventana de confirmación

## 🚀 Uso Rápido

### Iniciar la Aplicación:
Doble clic en: `Calendario-CAU.vbs`

### Detener la Aplicación:
Doble clic en: `Detener-Calendario.vbs`

## 📌 Crear Accesos Directos en el Escritorio

### Opción 1: Crear acceso directo manualmente

1. **Clic derecho** en el escritorio → **Nuevo** → **Acceso directo**

2. En "Ubicación del elemento", pega la ruta completa al archivo .vbs:
   ```
   C:\Users\Admin\Desktop\cqlendqr\Calendario\Calendario-CAU.vbs
   ```

3. Haz clic en **Siguiente**

4. Ponle un nombre:
   ```
   Calendario CAU SES-SGS
   ```

5. Haz clic en **Finalizar**

### Opción 2: Copiar y pegar

1. Abre la carpeta del proyecto: `C:\Users\Admin\Desktop\cqlendqr\Calendario`
2. **Clic derecho** en `Calendario-CAU.vbs`
3. Selecciona **Crear acceso directo**
4. Arrastra el acceso directo al escritorio

## 🎨 Personalizar el Icono del Acceso Directo

1. **Clic derecho** en el acceso directo → **Propiedades**

2. Haz clic en **Cambiar icono...**

3. Selecciona uno de estos iconos de Windows:
   - `%SystemRoot%\System32\imageres.dll` (muchos iconos disponibles)
   - `%SystemRoot%\System32\shell32.dll` (iconos clásicos)
   - Busca un icono de calendario 📅

4. O descarga un icono .ico personalizado y selecciónalo

5. Haz clic en **Aceptar** y luego **Aplicar**

## 🔧 Crear Acceso Directo para "Detener Calendario"

Repite los mismos pasos pero para el archivo:
```
C:\Users\Admin\Desktop\cqlendqr\Calendario\Detener-Calendario.vbs
```

Nombre sugerido: `Detener Calendario CAU`

## ⚙️ Configuración Avanzada

### Ejecutar al Inicio de Windows

Para que el calendario se inicie automáticamente al encender el PC:

1. Presiona **Win + R** y escribe: `shell:startup`
2. Copia el acceso directo de `Calendario-CAU.vbs` en esta carpeta

### Ejecutar como Administrador (si es necesario)

1. **Clic derecho** en el acceso directo → **Propiedades**
2. Haz clic en **Avanzadas...**
3. Marca **Ejecutar como administrador**
4. **Aceptar** y **Aplicar**

## 🎯 Configurar Teclas de Acceso Rápido

1. **Clic derecho** en el acceso directo → **Propiedades**
2. En el campo **Tecla de método abreviado**, presiona la combinación deseada
   - Ejemplo: `Ctrl + Alt + C` para abrir el Calendario
3. **Aplicar** y **Aceptar**

## 📱 Acceso desde la Barra de Tareas

### Anclar a la Barra de Tareas:

1. Arrastra el acceso directo desde el escritorio
2. Suéltalo en la barra de tareas
3. Ahora tendrás acceso con un solo clic

## 🌐 Crear Acceso Directo Directo al Navegador

Si prefieres un acceso directo que abra directamente el navegador (sin iniciar el servidor):

1. **Clic derecho** en el escritorio → **Nuevo** → **Acceso directo**
2. Ubicación:
   ```
   http://localhost:5173
   ```
3. Nombre: `Calendario CAU - Web`

**NOTA**: Esto solo funciona si el servidor ya está corriendo.

## ❓ Solución de Problemas

### El acceso directo no funciona

- Verifica que la ruta al archivo .vbs es correcta
- Clic derecho → Propiedades → Comprobar ruta

### El navegador no se abre

- Espera 5-10 segundos después de ejecutar el script
- El servidor necesita tiempo para iniciar

### Error de permisos

- Clic derecho en el acceso directo → Ejecutar como administrador
- O marca "Ejecutar como administrador" en las propiedades

### Múltiples instancias corriendo

- Usa `Detener-Calendario.vbs` antes de iniciar nuevamente
- O abre el Administrador de Tareas y cierra procesos "node.exe"

## 🔒 Seguridad

Los scripts .vbs y .bat son seguros y solo ejecutan comandos locales para:
- Iniciar el servidor de desarrollo Node.js
- Abrir el navegador predeterminado
- Detener procesos de Node.js

No se conectan a internet ni ejecutan código malicioso.

## 📞 Notas Importantes

1. **Primera ejecución**: La primera vez que ejecutes `Calendario-CAU.vbs`, instalará las dependencias. Esto puede tardar varios minutos.

2. **Puerto ocupado**: Si el puerto 5173 está en uso, el script puede fallar. Usa `Detener-Calendario.vbs` primero.

3. **Antivirus**: Algunos antivirus pueden bloquear scripts .vbs. Añade una excepción si es necesario.

4. **Node.js requerido**: Asegúrate de tener Node.js instalado en tu sistema.

## 🎉 ¡Listo!

Ahora puedes iniciar y detener el Calendario CAU SES-SGS con un simple doble clic, sin ver ventanas molestas de terminal.
