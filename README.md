# Application iOS pour AltStore

Cette application iOS a été créée spécialement pour être distribuée via [AltStore](https://altstore.io/), une alternative à l'App Store officiel d'Apple.

## 🚀 Fonctionnalités

- Interface utilisateur moderne développée avec SwiftUI
- Compteur interactif avec boutons d'incrémentation, décrémentation et reset
- Design adaptatif compatible iPhone et iPad
- Compatible iOS 17.0 et versions ultérieures
- Prête pour la distribution via AltStore

## 📱 Installation via AltStore

### Prérequis
1. **AltStore** installé sur votre appareil iOS
2. **AltServer** installé sur votre PC/Mac
3. Connexion au même réseau WiFi

### Méthode 1: Installation directe
1. Compilez l'app en suivant les instructions ci-dessous
2. Copiez le fichier `.ipa` généré sur votre appareil
3. Ouvrez le fichier avec AltStore
4. L'app sera installée automatiquement

### Méthode 2: Via source personnalisée
1. Hébergez les fichiers `altstore-source.json` et l'IPA sur votre serveur web
2. Dans AltStore, ajoutez votre source personnalisée
3. Installez l'app directement depuis AltStore

## 🛠 Compilation

### Avec Xcode (Recommandé)
```bash
# Ouvrir le projet
open AltStoreApp.xcodeproj

# Ou utiliser xcodebuild en ligne de commande
xcodebuild -project AltStoreApp.xcodeproj -scheme AltStoreApp -configuration Release -archivePath build/AltStoreApp.xcarchive archive

# Exporter l'IPA
xcodebuild -exportArchive -archivePath build/AltStoreApp.xcarchive -exportPath build/ -exportOptionsPlist ExportOptions.plist
```

### Avec les scripts fournis
```bash
# Rendre le script exécutable
chmod +x build.sh

# Compiler et générer l'IPA
./build.sh
```

## 📝 Configuration

### Bundle Identifier
Modifiez le `PRODUCT_BUNDLE_IDENTIFIER` dans le projet Xcode :
```
com.yourname.altstoreapp
```

### Team de développement
1. Ouvrez le projet dans Xcode
2. Sélectionnez le target "AltStoreApp"
3. Dans "Signing & Capabilities", sélectionnez votre équipe de développement
4. Xcode configurera automatiquement les certificats

## 🌐 Distribution

### Hébergement des fichiers
Pour distribuer via AltStore, vous devez héberger :

1. **Le fichier IPA** : `AltStoreApp.ipa`
2. **Le manifeste** : `altstore-source.json`
3. **Les assets** (optionnel) :
   - Icône de l'app (PNG 1024x1024)
   - Captures d'écran (PNG, recommandé 1290x2796 pour iPhone)

### Configuration du manifeste
Éditez `altstore-source.json` et remplacez :
- `votre-site.com` par votre domaine
- `votre-nom` par votre nom de développeur
- Les URLs des assets par les vrais liens

### HTTPS requis
⚠️ **Important** : AltStore nécessite que tous les fichiers soient hébergés en HTTPS.

## 📋 Structure du projet

```
AltStoreApp/
├── AltStoreApp.xcodeproj/       # Projet Xcode
├── AltStoreApp/                 # Code source de l'app
│   ├── AltStoreAppApp.swift     # Point d'entrée de l'app
│   ├── ContentView.swift        # Interface principale
│   ├── Assets.xcassets/         # Assets (icônes, couleurs)
│   └── Preview Content/         # Assets pour les previews Xcode
├── altstore-source.json         # Manifeste de source AltStore
├── altstore-manifest.json       # Manifeste de l'app individuelle
├── build.sh                     # Script de compilation
├── ExportOptions.plist          # Options d'export IPA
└── README.md                    # Ce fichier
```

## 🔧 Développement

### Modification de l'app
1. Ouvrez `AltStoreApp.xcodeproj` dans Xcode
2. Modifiez les fichiers Swift selon vos besoins
3. Testez dans le simulateur iOS
4. Compilez pour la distribution

### Ajout de fonctionnalités
- **Nouvelles vues** : Créez des fichiers SwiftUI dans le dossier `AltStoreApp/`
- **Assets** : Ajoutez images et couleurs dans `Assets.xcassets`
- **Permissions** : Modifiez `Info.plist` ou utilisez les build settings

## 🐛 Résolution de problèmes

### Erreurs de signature
- Vérifiez que votre certificat de développeur est valide
- Assurez-vous que le Bundle ID est unique
- Vérifiez les profils de provisioning dans Xcode

### Problèmes d'installation AltStore
- Vérifiez que AltServer est en cours d'exécution
- Assurez-vous d'être sur le même réseau WiFi
- Vérifiez que l'IPA n'est pas corrompu

### Erreurs de compilation
- Vérifiez la version d'Xcode (15.0+ recommandé)
- Assurez-vous que le deployment target est correct (iOS 17.0+)
- Nettoyez le build folder : `Product > Clean Build Folder`

## 📚 Ressources

- [Documentation AltStore](https://altstore.io/)
- [Guide de développement iOS](https://developer.apple.com/documentation/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [Xcode Documentation](https://developer.apple.com/documentation/xcode/)

## ⚖️ Licence

Ce projet est fourni à des fins éducatives. Vous êtes libre de l'utiliser comme base pour vos propres applications.

## 🤝 Contribution

N'hésitez pas à :
- Signaler des bugs
- Proposer des améliorations
- Contribuer au code
- Partager votre expérience

---

**Note** : Cette application est destinée à la distribution via AltStore et ne sera pas soumise à l'App Store officiel d'Apple.