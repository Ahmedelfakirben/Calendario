@echo off
REM Script para detener el Calendario CAU SES-SGS
REM Este script cierra todos los procesos de node relacionados con Vite

echo ============================================
echo   Deteniendo Calendario CAU SES-SGS
echo ============================================
echo.

REM Buscar y matar procesos de node que estén usando Vite
for /f "tokens=2" %%a in ('tasklist /FI "IMAGENAME eq node.exe" /NH') do (
    echo Deteniendo proceso Node.js (PID: %%a)...
    taskkill /F /PID %%a >nul 2>&1
)

echo.
echo ✓ Servidor detenido correctamente
echo.
echo Presiona cualquier tecla para cerrar...
pause >nul
