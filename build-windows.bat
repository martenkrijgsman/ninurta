@echo off
rem Double-click this file to build the Windows game into builds\windows.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\build-windows.ps1"
set code=%ERRORLEVEL%
if %code%==0 explorer "%~dp0builds\windows"
pause
exit /b %code%
