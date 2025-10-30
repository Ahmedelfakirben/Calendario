@echo off
REM Script para iniciar el Calendario CAU SES-SGS
REM Este script inicia el servidor de desarrollo y abre el navegador

cd /d "%~dp0"

REM Verificar si node_modules existe
if not exist "node_modules\" (
    echo Instalando dependencias por primera vez...
    call npm install
)

REM Iniciar el servidor de desarrollo en segundo plano
start /B npm start

REM Esperar 8 segundos para que el servidor inicie (Parcel tarda más)
timeout /t 8 /nobreak >nul

REM Abrir el navegador en la URL local
start http://localhost:1234

REM Mantener el proceso abierto pero minimizado
REM El servidor seguirá corriendo hasta que cierres esta ventana
echo.
echo ============================================
echo   Calendario CAU SES-SGS iniciado
echo ============================================
echo.
echo El servidor esta corriendo en: http://localhost:1234
echo.
echo Para detener el servidor:
echo - Presiona Ctrl+C en esta ventana
echo - O simplemente cierra esta ventana
echo.
echo ============================================
