@echo off
rem Double-click this file to run all automated tests.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\run-tests.ps1"
set code=%ERRORLEVEL%
pause
exit /b %code%
