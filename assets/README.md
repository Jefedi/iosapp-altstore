# Assets

Ce dossier contient les ressources visuelles pour JAPP :

- `icon.png` - Icône de l'application (1024x1024)
- `screenshot1.png` - Capture d'écran interface principale
- `screenshot2.png` - Capture d'écran mode sombre

## Génération des icônes

Pour générer les icônes de l'app à partir de l'icône principale :

1. Placez une icône 1024x1024 nommée `icon.png` dans ce dossier
2. Utilisez un outil comme [App Icon Generator](https://appicon.co/) pour générer toutes les tailles
3. Remplacez les fichiers dans `JAPP/Assets.xcassets/AppIcon.appiconset/`

## Format des captures d'écran

- **Format** : PNG
- **Tailles recommandées** :
  - iPhone : 1290x2796 (iPhone 15 Pro)
  - iPad : 2048x2732 (iPad Pro)

Les captures d'écran sont utilisées pour :
- La page de téléchargement HTML
- Le manifeste AltStore
- La documentation GitHub