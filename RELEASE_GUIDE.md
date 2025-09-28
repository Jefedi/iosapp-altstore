# 📦 Système de Release Simplifié

## 🎯 Comment créer une nouvelle release

### Méthode 1 : Script PowerShell (Recommandé)

```powershell
.\create-release.ps1 -Version "1.0.7" -Message "Corrections de bugs et améliorations"
```

### Méthode 2 : Manuel avec Git

```bash
# Créer et pousser le tag
git tag -a v1.0.7 -m "Release v1.0.7"
git push origin v1.0.7
```

## ✨ Ce qui se passe automatiquement

Quand tu pousses un tag qui commence par `v` :

1. **🏗️ Build automatique** : L'app iOS est compilée sur macOS
2. **📦 Release GitHub** : Une release est créée avec le tag
3. **📤 Upload IPA** : Le fichier d'installation est attaché
4. **🔄 Mise à jour configs** : 
   - `config.json` - Version synchronisée
   - `manifest.json` - URLs mises à jour  
   - `altstore-source.json` - Métadonnées AltStore
5. **📝 Notes de release** : Description générée automatiquement

## 📋 Structure des fichiers

- `tag-release.yml` - Workflow principal (se déclenche sur tags)
- `test-only.yml` - Tests uniquement (déclenchement manuel)
- `config.json` - Configuration centralisée de l'app
- `create-release.ps1` - Script PowerShell pour faciliter les releases

## 🔗 Liens utiles

- **Actions** : https://github.com/Jefedi/iosapp-altstore/actions
- **Releases** : https://github.com/Jefedi/iosapp-altstore/releases  
- **AltStore Source** : https://raw.githubusercontent.com/Jefedi/iosapp-altstore/main/altstore-source.json

## 🎯 Avantages du nouveau système

- ✅ **Simple** : Juste créer un tag pour release
- ✅ **Automatique** : Tout se fait sans intervention
- ✅ **Fiable** : Un seul workflow, moins d'erreurs
- ✅ **Flexible** : Script PowerShell pour faciliter
- ✅ **Propre** : Suppression des workflows complexes