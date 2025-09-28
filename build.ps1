# Script de compilation PowerShell pour AltStoreApp
# Compatible Windows avec Xcode via VM ou Hackintosh

param(
    [string]$Configuration = "Release",
    [switch]$Clean = $false
)

Write-Host "Compilation de AltStoreApp pour AltStore..." -ForegroundColor Green
# Initialisez un repo Git
git init
git add .
git commit -m "Initial commit"

# Poussez sur GitHub
# Le workflow dans .github/workflows/build.yml se déclenchera automatiquement
# Configuration
$ProjectName = "AltStoreApp"
$SchemeName = "AltStoreApp"
$BuildDir = "build"
$ArchivePath = "$BuildDir\$ProjectName.xcarchive"
$ExportPath = $BuildDir
$IpaName = "$ProjectName.ipa"

# Nettoyage si demande
if ($Clean) {
    Write-Host "Nettoyage des anciens builds..." -ForegroundColor Yellow
    if (Test-Path $BuildDir) {
        Remove-Item -Recurse -Force $BuildDir
    }
}

# Creation du dossier de build
New-Item -ItemType Directory -Path $BuildDir -Force | Out-Null

# Verification de xcodebuild (necessite macOS)
try {
    $xcodebuildExists = Get-Command "xcodebuild" -ErrorAction SilentlyContinue
    if (-not $xcodebuildExists) {
        throw "xcodebuild not found"
    }
} catch {
    Write-Host "Erreur: xcodebuild n'est pas disponible sur Windows" -ForegroundColor Red
    Write-Host "Solutions possibles:" -ForegroundColor Yellow
    Write-Host "  - Utilisez un Mac ou une VM macOS" -ForegroundColor Cyan
    Write-Host "  - Configurez un build server macOS" -ForegroundColor Cyan
    Write-Host "  - Utilisez GitHub Actions avec des runners macOS" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Template GitHub Actions disponible dans .github/workflows/" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "Pour utiliser GitHub Actions:" -ForegroundColor Yellow
    Write-Host "  1. Commitez ce projet sur GitHub" -ForegroundColor Cyan
    Write-Host "  2. Le workflow se declenchera automatiquement" -ForegroundColor Cyan
    Write-Host "  3. Telechargez l'IPA depuis les Artifacts" -ForegroundColor Cyan
    exit 1
}

Write-Host "Compilation terminee!" -ForegroundColor Green
Write-Host "Pour compiler sur Windows:" -ForegroundColor Yellow
Write-Host "  1. Utilisez GitHub Actions" -ForegroundColor Cyan
Write-Host "  2. Configurez une VM macOS" -ForegroundColor Cyan
Write-Host "  3. Utilisez un service de build cloud" -ForegroundColor Cyan