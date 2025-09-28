#!/bin/bash

# Script de compilation pour AltStoreApp
# Compatible macOS/Linux

set -e

echo "🚀 Compilation de AltStoreApp pour AltStore..."

# Configuration
PROJECT_NAME="AltStoreApp"
SCHEME_NAME="AltStoreApp"
CONFIGURATION="Release"
BUILD_DIR="build"
ARCHIVE_PATH="$BUILD_DIR/${PROJECT_NAME}.xcarchive"
EXPORT_PATH="$BUILD_DIR"
IPA_NAME="${PROJECT_NAME}.ipa"

# Nettoyage
echo "🧹 Nettoyage des anciens builds..."
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

# Vérification des prérequis
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ Erreur: xcodebuild n'est pas installé"
    echo "Veuillez installer Xcode et les Command Line Tools"
    exit 1
fi

# Construction de l'archive
echo "📦 Création de l'archive Xcode..."
xcodebuild -project "${PROJECT_NAME}.xcodeproj" \
           -scheme "$SCHEME_NAME" \
           -configuration "$CONFIGURATION" \
           -archivePath "$ARCHIVE_PATH" \
           -destination "generic/platform=iOS" \
           DEVELOPMENT_TEAM="" \
           CODE_SIGN_IDENTITY="" \
           CODE_SIGNING_REQUIRED=NO \
           CODE_SIGNING_ALLOWED=NO \
           archive

# Vérification de l'archive
if [ ! -d "$ARCHIVE_PATH" ]; then
    echo "❌ Erreur: L'archive n'a pas été créée"
    exit 1
fi

echo "✅ Archive créée avec succès: $ARCHIVE_PATH"

# Export de l'IPA
echo "📱 Export de l'IPA..."
xcodebuild -exportArchive \
           -archivePath "$ARCHIVE_PATH" \
           -exportPath "$EXPORT_PATH" \
           -exportOptionsPlist "ExportOptions.plist"

# Vérification de l'IPA
IPA_PATH="$EXPORT_PATH/$IPA_NAME"
if [ -f "$IPA_PATH" ]; then
    echo "✅ IPA créé avec succès: $IPA_PATH"
    
    # Informations sur le fichier
    IPA_SIZE=$(ls -lh "$IPA_PATH" | awk '{print $5}')
    echo "📊 Taille de l'IPA: $IPA_SIZE"
    
    # Affichage du chemin absolu
    echo "📍 Chemin complet: $(pwd)/$IPA_PATH"
else
    echo "❌ Erreur: L'IPA n'a pas été créé"
    echo "Vérifiez les logs ci-dessus pour plus de détails"
    exit 1
fi

echo ""
echo "🎉 Compilation terminée avec succès!"
echo "📋 Étapes suivantes:"
echo "   1. Testez l'IPA dans le simulateur ou sur un appareil"
echo "   2. Hébergez le fichier IPA sur votre serveur web"
echo "   3. Mettez à jour altstore-source.json avec la bonne URL"
echo "   4. Ajoutez votre source dans AltStore"
echo ""