@echo off
REM ============================================================
REM  Dictom — Deploy del sistema de login a GitHub Pages
REM  Doble click para subir los cambios a santipitre.github.io/dictom
REM ============================================================
setlocal

cd /d "%~dp0"

echo.
echo === Carpeta: %CD%
echo.

REM 1. Eliminar lock fantasma de OneDrive si existe
if exist ".git\index.lock" (
  echo [1/5] Quitando .git\index.lock...
  del /F /Q ".git\index.lock"
)

REM 2. Mostrar estado actual
echo.
echo [2/5] Estado del repo antes del push:
git status --short

REM 3. Agregar los archivos nuevos y modificados
echo.
echo [3/5] git add ...
git add index.html dictom-auth.js

REM 4. Commit
echo.
echo [4/5] git commit ...
git commit -m "feat(auth): login + sistema de licencias estilo Lumen" -m "- Overlay de login con branding Dictom (luciernaga + monograma D)" -m "- Paywall cuando la licencia expira" -m "- Panel admin para crear usuarios y gestionar licencias" -m "- Sesion persistida 8h en localStorage" -m "- Reusa proyecto Supabase de Lumen"

REM 5. Push
echo.
echo [5/5] git push ...
git push origin main

echo.
echo === Listo. Si todo salio bien, GitHub Pages publica el cambio en 1-2 minutos.
echo === Visita: https://santipitre.github.io/dictom/
echo.
echo Recorda: antes de probar, corre el SQL en Supabase (ver INSTALACION_LOGIN.md).
echo.
pause
