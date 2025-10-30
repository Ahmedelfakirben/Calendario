@echo off
REM Script para crear accesos directos automáticamente en el escritorio
REM Calendario CAU SES-SGS

echo ============================================
echo   Crear Accesos Directos
echo   Calendario CAU SES-SGS
echo ============================================
echo.

REM Obtener la ruta del escritorio del usuario actual
set DESKTOP=%USERPROFILE%\Desktop

REM Obtener la ruta actual del proyecto
set PROJECT_DIR=%~dp0

echo Creando accesos directos en: %DESKTOP%
echo.

REM Crear acceso directo para iniciar el calendario
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%DESKTOP%\Calendario CAU SES-SGS.lnk'); $Shortcut.TargetPath = '%PROJECT_DIR%Calendario-CAU.vbs'; $Shortcut.WorkingDirectory = '%PROJECT_DIR%'; $Shortcut.Description = 'Iniciar Calendario CAU SES-SGS'; $Shortcut.Save()"

if %ERRORLEVEL% EQU 0 (
    echo [OK] Acceso directo "Calendario CAU SES-SGS" creado
) else (
    echo [ERROR] No se pudo crear el acceso directo de inicio
)

REM Crear acceso directo para detener el calendario
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%DESKTOP%\Detener Calendario CAU.lnk'); $Shortcut.TargetPath = '%PROJECT_DIR%Detener-Calendario.vbs'; $Shortcut.WorkingDirectory = '%PROJECT_DIR%'; $Shortcut.Description = 'Detener Calendario CAU SES-SGS'; $Shortcut.Save()"

if %ERRORLEVEL% EQU 0 (
    echo [OK] Acceso directo "Detener Calendario CAU" creado
) else (
    echo [ERROR] No se pudo crear el acceso directo de detencion
)

echo.
echo ============================================
echo   Accesos directos creados exitosamente!
echo ============================================
echo.
echo Revisa tu escritorio para encontrar:
echo   - Calendario CAU SES-SGS.lnk
echo   - Detener Calendario CAU.lnk
echo.
echo Puedes personalizar los iconos haciendo:
echo   Clic derecho ^> Propiedades ^> Cambiar icono
echo.
echo Presiona cualquier tecla para cerrar...
pause >nul
