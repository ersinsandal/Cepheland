# Cepheland development launcher for Windows PowerShell
$ErrorActionPreference = 'Stop'

Write-Host 'CEPHELAND - Development environment' -ForegroundColor Green
Write-Host 'API: http://localhost:3001'
Write-Host 'Admin: http://localhost:3010'
Write-Host 'Player application: http://localhost:3002'
Write-Host 'Showcase: http://localhost:4000'

pnpm.cmd build
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
pnpm.cmd test:unit
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
pnpm.cmd test:integration
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host 'Build and tests passed. Starting development services.' -ForegroundColor Green
pnpm.cmd dev:all
exit $LASTEXITCODE
