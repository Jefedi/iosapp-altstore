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

## 🚀 Création de Release

1. **Compilez l'IPA** dans Xcode
2. **Créez la release** sur GitHub :
   - Tag : `v1.0.4`
   - Title : Tiré de `config.json`
   - Upload de l'IPA
3. **Les URLs se mettront à jour automatiquement**

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