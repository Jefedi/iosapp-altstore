# AltStore App iOS - Par Jefedi 📱

Une application iOS créée spécialement pour être distribuée via **AltStore**. Cette app de démonstration inclut un compteur interactif développé en SwiftUI avec automatisation GitHub Actions.

## 🎯 Fonctionnalités

- ✅ **Interface SwiftUI moderne** avec compteur interactif
- ✅ **Boutons +/-** pour incrémenter/décrémenter 
- ✅ **Bouton Reset** pour remettre à zéro
- ✅ **GitHub Actions** pour builds automatiques
- ✅ **Distribution AltStore** prête à l'emploi
- ✅ **Compatible iOS 17+** et architectures modernes

## 🚀 Installation via AltStore

### Prérequis
1. **AltStore** installé sur votre iPhone/iPad
2. **Connexion Internet** active

### Étapes d'installation

1. **Ouvrir AltStore** sur votre appareil iOS

2. **Ajouter ma source** :
   - Aller dans l'onglet **"Browse"**
   - Toucher le **"+"** en haut à droite
   - Entrer l'URL : `https://jefedi.github.io/iosapp-altstore/altstore-source.json`
   - Confirmer l'ajout de la source

3. **Installer l'app** :
   - Aller dans **"Sources"** → **"Jefedi AltStore Source"**
   - Toucher **"Jefedi AltStore App"** 
   - Appuyer sur **"INSTALL"**
   - Attendre le téléchargement et l'installation

4. **Lancer l'app** :
   - L'icône apparaît sur l'écran d'accueil
   - Toucher pour ouvrir et utiliser le compteur !

## 📱 Interface de l'App

```
┌─────────────────────┐
│     COMPTEUR        │
│                     │
│        [42]         │
│                     │
│   [−]  [+]  [↻]     │
│                     │
└─────────────────────┘
```

## 🛠️ Développement Local

### Compilation avec Xcode
```bash
# Ouvrir le projet
open AltStoreApp.xcodeproj
```

### Compilation en ligne de commande (macOS)
```bash
./build.sh
```

### Compilation PowerShell (Windows)
```powershell
.\build.ps1
```

## 🔧 Architecture du Projet

```
iosapp-altstore/
├── AltStoreApp.xcodeproj/     # Projet Xcode
├── AltStoreApp/              # Code source SwiftUI
│   ├── AltStoreAppApp.swift  # Point d'entrée @main
│   └── ContentView.swift     # Interface utilisateur
├── .github/workflows/        # CI/CD automatisé
│   └── build.yml            # GitHub Actions
├── docs/                    # GitHub Pages
│   ├── index.html          # Page d'accueil
│   └── altstore-source.json # Manifeste AltStore
└── altstore-manifest.json   # Config installation
```

## 🌐 URLs Importantes

- **🏠 Site web**: https://jefedi.github.io/iosapp-altstore/
- **📥 Source AltStore**: `https://jefedi.github.io/iosapp-altstore/altstore-source.json`
- **🔗 Repository GitHub**: https://github.com/Jefedi/iosapp-altstore
- **📦 Releases**: https://github.com/Jefedi/iosapp-altstore/releases

## 🤝 Support

### Problèmes d'installation ?

1. **Vérifier AltStore** : Assurez-vous qu'AltStore est bien installé et fonctionnel
2. **Connexion réseau** : L'installation nécessite Internet
3. **URL correcte** : Vérifiez que vous utilisez la bonne URL de source
4. **Réessayer** : Si ça échoue, fermez AltStore et relancez

### Pour les développeurs

- **Issues GitHub** : https://github.com/Jefedi/iosapp-altstore/issues
- **Discussions** : https://github.com/Jefedi/iosapp-altstore/discussions

## 📄 Licence

Ce projet est un exemple de démonstration créé à des fins éducatives.

---

**Made with ❤️ by Jefedi** 

*Première app iOS distribuée via AltStore avec GitHub Actions !* 🎉