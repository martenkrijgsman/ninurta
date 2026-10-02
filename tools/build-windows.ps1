# Builds the Windows version of the game as a single .exe.
# Usage, from the repo root:  .\tools\build-windows.ps1
# Output: builds\windows\NinurtaSharur.exe (builds\ is never committed).
# Needs Godot's export templates for 4.7.2 (Editor > Manage Export Templates).

$ErrorActionPreference = "Stop"
$godot = "C:\Tools\Godot_v4.7.2-stable_win64_console.exe"
$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$project = Join-Path $root "game"
$outDir = Join-Path $root "builds\windows"
$exe = Join-Path $outDir "NinurtaSharur.exe"
$templates = Join-Path $env:APPDATA "Godot\export_templates\4.7.2.stable"

if (-not (Test-Path $godot)) {
    Write-Error "Godot not found at $godot"
    exit 1
}
if (-not (Test-Path $templates)) {
    Write-Host "Export templates for Godot 4.7.2 are not installed." -ForegroundColor Red
    Write-Host "In Godot: Editor > Manage Export Templates > Download and Install."
    exit 1
}

# Start from a clean folder so old files never linger.
if (Test-Path $outDir) { Remove-Item -Recurse -Force $outDir }
New-Item -ItemType Directory -Force $outDir | Out-Null

& $godot --headless --path $project --import | Out-Null
& $godot --headless --path $project --export-release "Windows Desktop" $exe
$code = $LASTEXITCODE

if ($code -eq 0 -and (Test-Path $exe)) {
    Write-Host "`nBUILD OK: $exe" -ForegroundColor Green
    exit 0
}
Write-Host "`nBUILD FAILED (exit code $code)" -ForegroundColor Red
exit 1
