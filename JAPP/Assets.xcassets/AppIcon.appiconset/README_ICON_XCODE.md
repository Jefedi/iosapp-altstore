# Configuration de l'icône JAPP dans Xcode

## Instructions pour ajouter l'icône dans Xcode

1. **Ouvrir le projet** : Ouvrez `JAPP.xcodeproj` dans Xcode

2. **Naviguer vers Assets.xcassets** :
   - Dans le navigator de gauche, cliquez sur `JAPP` 
   - Puis cliquez sur `Assets.xcassets`
   - Ensuite sur `AppIcon`

3. **Ajouter l'icône 1024x1024** :
   - Faites glisser votre fichier `icon-1024.png` dans la case "iOS App Store"
   - Cette case est marquée "1024pt" en bas à droite

4. **Générer les autres tailles (optionnel)** :
   - Xcode peut générer automatiquement les autres tailles
   - Ou utilisez un outil comme "Icon Set Creator" pour générer toutes les tailles

## Tailles d'icônes iOS requises
- 20x20 (2x, 3x) - Notifications
- 29x29 (2x, 3x) - Settings  
- 40x40 (2x, 3x) - Spotlight
- 60x60 (2x, 3x) - App Icon iPhone
- 76x76 (1x, 2x) - App Icon iPad
- 83.5x83.5 (2x) - App Icon iPad Pro
- 1024x1024 (1x) - App Store Marketing

## Résultat
Après ajout de l'icône, elle apparaîtra dans :
- L'application compilée
- L'écran d'accueil iOS
- L'App Store (si publié)