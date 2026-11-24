[CmdletBinding()]
param([switch]$Fast)
$ErrorActionPreference = 'Stop'
Set-Location (Join-Path $PSScriptRoot '..')
if (-not (Test-Path 'package.json')) { throw 'Run this script from a valid OmniRoute checkout.' }
$pkg = Get-Content 'package.json' -Raw | ConvertFrom-Json
Write-Host 'OmniRoute quality gate' -ForegroundColor Cyan
Write-Host 'This script runs existing repository checks; it does not bypass or weaken them.'
if ($pkg.scripts.lint) { bun run lint; if ($LASTEXITCODE -ne 0) { throw 'Lint failed.' } }
if ($Fast) {
  if ($pkg.scripts.'quality:scan:fast') { bun run quality:scan:fast; if ($LASTEXITCODE -ne 0) { throw 'Fast quality scan failed.' } }
} else {
  if ($pkg.scripts.check) { bun run check; if ($LASTEXITCODE -ne 0) { throw 'Check failed.' } }
  if ($pkg.scripts.'quality:scan') { bun run quality:scan; if ($LASTEXITCODE -ne 0) { throw 'Quality scan failed.' } }
}
Write-Host 'Requested quality commands completed successfully.' -ForegroundColor Green
