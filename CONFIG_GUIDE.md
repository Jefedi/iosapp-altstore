# 📝 Configuration Centralisée - JAPP

Ce projet utilise un système simple de configuration centralisée avec un fichier JSON unique.

## 🎯 Principe Simple

Toutes les informations du projet sont stockées dans **`config.json`** :
- Nom de l'application
- Versions et métadonnées  
- URLs et liens
- Descriptions
- Paramètres de release

## 📁 Structure

```
📦 iosapp-altstore/
├── 🔧 config.json           # ← MODIFIEZ ICI pour tout changer
├── 📄 manifest.json         # Généré à partir de config.json
├── 📄 altstore-source.json  # Généré à partir de config.json  
└── 📱 JAPP.xcodeproj/       # Projet Xcode (version à sync manuellement)
```

## 🔄 Comment Mettre à Jour

### 1. Modifier config.json

Éditez le fichier `config.json` et changez les valeurs :

```json
{
  "app": {
    "name": "JAPP",
    "version": "1.0.5",    ← Changez ici la version
    "subtitle": "...",
    ...
  }
}
```

### 2. Mettre à jour les autres fichiers

Après avoir modifié `config.json`, copiez les valeurs dans :

- `manifest.json` 
- `altstore-source.json`
- `JAPP.xcodeproj/project.pbxproj` (MARKETING_VERSION)

### 3. Commit et Push

```bash
git add .
git commit -m "🔖 Version X.Y.Z"  
git push
```

## 📊 Variables Principales

| Variable | Description | Exemple |
|----------|-------------|---------|
| `app.version` | Version de l'app | `"1.0.4"` |
| `app.name` | Nom court | `"JAPP"` |
| `app.bundleId` | Bundle identifier | `"com.jefedi.japp"` |
| `urls.ipaDownload` | Lien de téléchargement | GitHub releases |
| `descriptions.long` | Description complète | Texte avec fonctionnalités |

## 🚀 Création de Release Automatique

### Option 1: Release Complète (Recommandée)

```powershell
.\release.ps1 -Version "1.0.5" -IpaPath "chemin\vers\JAPP.ipa"
```

Cette commande fait **TOUT AUTOMATIQUEMENT** :
- ✅ Met à jour `config.json`
- ✅ Met à jour `manifest.json` 
- ✅ Met à jour `altstore-source.json`
- ✅ Met à jour le projet Xcode
- ✅ Commit les changements
- ✅ Crée la release GitHub avec l'IPA
- ✅ Push tout sur GitHub

### Option 2: Release Seulement

Si vous avez déjà mis à jour les fichiers :

```powershell
.\create-release.ps1 -IpaPath "chemin\vers\JAPP.ipa"
```

### 🧪 Pre-Release

Pour créer une pre-release/beta :

```powershell
.\release.ps1 -Version "1.1.0-beta1" -IpaPath "chemin\vers\JAPP.ipa" -PreRelease
```

## 🔧 Prérequis

1. **GitHub CLI** installé :
   ```powershell
   winget install GitHub.cli
   gh auth login
   ```

2. **Git** configuré et repository cloné

## 🔄 Workflow Recommandé

1. **Développement** dans Xcode
2. **Build et Export** de l'IPA  
3. **Release automatique** :
   ```powershell
   .\release.ps1 -Version "1.0.5" -IpaPath "builds\JAPP.ipa"
   ```
4. **C'est tout !** 🎉

## 🚀 Création de Release

1. **Compilez l'IPA** dans Xcode
2. **Lancez le script** :
   ```powershell
   .\release.ps1 -Version "NOUVELLE_VERSION" -IpaPath "chemin\vers\JAPP.ipa"
   ```
3. **Vérifiez** sur GitHub que tout est OK

Le script se charge de tout automatiquement !

## ✨ Avantages

- ✅ **Simple** : Un seul fichier à modifier
- ✅ **Lisible** : Format JSON clair  
- ✅ **Pas de script** : Pas de dépendances PowerShell
- ✅ **Portable** : Fonctionne partout
- ✅ **Maintenance** : Facile à comprendre et modifier

## 🔧 Synchronisation Xcode

Pour synchroniser la version avec Xcode :

1. Ouvrir `JAPP.xcodeproj`
2. Sélectionner le projet → Target JAPP → Build Settings
3. Rechercher "Marketing Version" 
4. Mettre la même valeur que dans `config.json`

---

**Plus besoin de scripts complexes ! Juste un fichier JSON simple à modifier.** 🎉