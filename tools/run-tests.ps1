# Runs every automated test in game/tests with GUT, headless (no window).
# Usage, from the repo root:  .\tools\run-tests.ps1
# Exit code 0 means all tests passed; anything else means a failure.

$ErrorActionPreference = "Stop"
$godot = "C:\Tools\Godot_v4.7.2-stable_win64_console.exe"
$project = Join-Path $PSScriptRoot "..\game"

if (-not (Test-Path $godot)) {
    Write-Error "Godot not found at $godot"
    exit 1
}

# First pass imports assets and registers addon classes (needed on a fresh checkout).
& $godot --headless --path $project --import | Out-Null

& $godot --headless --path $project -s res://addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json
$code = $LASTEXITCODE

if ($code -eq 0) {
    Write-Host "`nALL TESTS PASSED" -ForegroundColor Green
} else {
    Write-Host "`nTESTS FAILED (exit code $code)" -ForegroundColor Red
}
exit $code
