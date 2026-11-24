[CmdletBinding()]
param([switch]$SkipInstall)
$ErrorActionPreference = 'Stop'
Set-Location (Join-Path $PSScriptRoot '..')
foreach ($tool in @('git','bun')) { if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) { throw "$tool is required. Install it, then rerun this script." } }
Write-Host 'OmniRoute local setup' -ForegroundColor Cyan
git status --short --branch
if ($LASTEXITCODE -ne 0) { throw 'Git status failed.' }
if (-not (Test-Path 'package.json')) { throw 'package.json not found; run from the repository checkout.' }
if (-not $SkipInstall) { bun install; if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' } }
Write-Host "Setup finished. Review README.md and run .\scripts\quality-gate.ps1 -Fast" -ForegroundColor Green
Write-Host 'No external accounts were connected, no credentials were created, and no deployment was performed.'
