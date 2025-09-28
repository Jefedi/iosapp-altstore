# Script PowerShell pour créer facilement des releases
# Usage: .\create-release.ps1 -Version "1.0.7" -Message "Nouvelle version avec corrections"

param(
    [Parameter(Mandatory=$true)]
    [string]$Version,
    
    [Parameter(Mandatory=$false)]
    [string]$Message = "Release version $Version"
)

Write-Host "🚀 Création de la release v$Version" -ForegroundColor Green

# Vérifier qu'on est sur la branche main
$currentBranch = git branch --show-current
if ($currentBranch -ne "main") {
    Write-Host "❌ Tu dois être sur la branche main pour créer une release" -ForegroundColor Red
    exit 1
}

# Vérifier qu'il n'y a pas de changements non commitées
$status = git status --porcelain
if ($status) {
    Write-Host "⚠️ Il y a des changements non commitées. Commit d'abord :" -ForegroundColor Yellow
    git status --short
    exit 1
}

# Pull les derniers changements
Write-Host "📥 Pull des derniers changements..." -ForegroundColor Blue
git pull origin main

# Vérifier si le tag existe déjà
$existingTag = git tag -l "v$Version"
if ($existingTag) {
    Write-Host "⚠️ Le tag v$Version existe déjà!" -ForegroundColor Yellow
    $response = Read-Host "Veux-tu le supprimer et le recréer? (y/N)"
    if ($response -eq "y" -or $response -eq "Y") {
        Write-Host "🗑️ Suppression du tag existant..." -ForegroundColor Yellow
        git tag -d "v$Version"
        git push --delete origin "v$Version" 2>$null
    } else {
        Write-Host "❌ Annulé" -ForegroundColor Red
        exit 1
    }
}

# Créer le tag
Write-Host "🏷️ Création du tag v$Version..." -ForegroundColor Blue
git tag -a "v$Version" -m "$Message"

# Pousser le tag
Write-Host "📤 Push du tag vers GitHub..." -ForegroundColor Blue
git push origin "v$Version"

Write-Host ""
Write-Host "✅ Tag v$Version créé avec succès!" -ForegroundColor Green
Write-Host ""
Write-Host "🎯 Le workflow GitHub Actions va maintenant :" -ForegroundColor Cyan
Write-Host "   1. 🏗️ Builder l'app iOS" -ForegroundColor White
Write-Host "   2. 📦 Créer la release GitHub" -ForegroundColor White  
Write-Host "   3. 📤 Uploader le fichier IPA" -ForegroundColor White
Write-Host "   4. 🔄 Mettre à jour les configs AltStore" -ForegroundColor White
Write-Host ""
Write-Host "📊 Surveille le progrès sur :" -ForegroundColor Yellow
Write-Host "   https://github.com/Jefedi/iosapp-altstore/actions" -ForegroundColor Blue
Write-Host ""
Write-Host "🎉 Release sera disponible sur :" -ForegroundColor Yellow
Write-Host "   https://github.com/Jefedi/iosapp-altstore/releases/tag/v$Version" -ForegroundColor Blue