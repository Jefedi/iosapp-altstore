# 🚀 Déploiement Automatique - JAPP

Ce projet utilise **GitHub Actions** pour automatiser complètement le déploiement. Plus besoin de scripts locaux !

## ✨ Processus 100% Automatique

Quand vous modifiez `config.json` et pushez vers GitHub :

1. **🔍 Détection automatique** de la nouvelle version
2. **🏗️ Build automatique** de l'IPA avec Xcode  
3. **🚀 Création automatique** de la release GitHub
4. **📱 Mise à jour automatique** d'AltStore
5. **🔄 Synchronisation** de tous les fichiers de config

**Tout se fait automatiquement en 10-15 minutes !**

## 🎯 Comment Déployer une Nouvelle Version

### Étape unique : Modifier config.json

1. **Ouvrez** `config.json`
2. **Changez** la version :
   ```json
   {
     "app": {
       "version": "1.0.5",  ← Changez ici
       ...
     }
   }
   ```
3. **Sauvegardez** le fichier
4. **Commitez et pushez** :
   ```bash
   git add config.json
   git commit -m "🔖 Version 1.0.5"
   git push
   ```

**C'est tout !** GitHub Actions fait le reste automatiquement.

## 🔄 Que Se Passe-t-il Automatiquement

### 1. Détection (30 secondes)
- ✅ GitHub détecte le changement dans `config.json`
- ✅ Vérifie que la version est nouvelle
- ✅ Démarre le processus de build

### 2. Build iOS (8-10 minutes)
- ✅ Configure Xcode sur macOS
- ✅ Met à jour la version dans le projet Xcode
- ✅ Compile et archive l'application
- ✅ Exporte le fichier IPA

### 3. Création de Release (1-2 minutes)
- ✅ Crée le tag Git `v1.0.5`
- ✅ Génère les notes de release automatiquement
- ✅ Upload l'IPA vers GitHub Releases
- ✅ Rend la release publique

### 4. Mise à Jour des Configs (1 minute)
- ✅ Met à jour `manifest.json`
- ✅ Met à jour `altstore-source.json`
- ✅ Synchronise toutes les URLs
- ✅ Commite les changements automatiquement

### 5. Disponibilité AltStore (Immédiat)
- ✅ L'app apparaît dans AltStore
- ✅ Les utilisateurs peuvent installer la nouvelle version
- ✅ Toutes les métadonnées sont à jour

## 👀 Suivi du Déploiement

Après avoir pushé, suivez le progrès sur :
**https://github.com/Jefedi/iosapp-altstore/actions**

Vous verrez :
- 🟡 **En cours** : Build et déploiement
- 🟢 **Succès** : App disponible dans AltStore  
- 🔴 **Échec** : Vérifiez les logs pour corriger

## 📋 Variables dans config.json

| Variable | Description | Exemple |
|----------|-------------|---------|
| `app.version` | **Version de l'app** (DÉCLENCHEUR) | `"1.0.5"` |
| `app.name` | Nom de l'application | `"JAPP"` |
| `descriptions.long` | Description complète | Texte marketing |
| `urls.*` | Toutes les URLs | GitHub, assets, etc. |

## ⚠️ Points Importants

### ✅ Ce qui est Automatique
- Build de l'IPA
- Création de la release GitHub
- Upload des fichiers
- Mise à jour des manifestes AltStore
- Synchronisation des versions

### 🔧 Ce qui est Manuel (Optionnel)
- Ajouter de nouvelles icônes dans `assets/`
- Modifier les descriptions dans `config.json`
- Changer les URLs de base

### 🚫 Éviter
- Ne pas modifier directement `manifest.json` ou `altstore-source.json`
- Ne pas créer de releases GitHub manuellement
- Ne pas utiliser de tags de version existants

## 🎉 Avantages du Système

- ✅ **Zero maintenance** : Tout est automatique
- ✅ **Cohérence garantie** : Pas d'erreurs humaines
- ✅ **Traçabilité complète** : Tous les déploiements sont loggés
- ✅ **Rollback facile** : Retour vers `config.json` précédent
- ✅ **Multi-plateforme** : Fonctionne depuis n'importe où

## 🔧 Dépannage

### Le workflow ne se déclenche pas
- Vérifiez que `config.json` a été modifié
- Assurez-vous d'avoir pushé vers la branche `main`

### Build échoue - Problème Xcode
- Le workflow utilise maintenant `latest-stable` Xcode
- En cas d'échec, regardez les logs dans GitHub Actions
- Testez avec le workflow "Test Build" (manual trigger)

### Erreur "Could not find Xcode version"
- ✅ **Corrigé** : Le workflow utilise maintenant la dernière version stable
- Si le problème persiste, vérifiez les logs du job `build-ios`

### Build échoue - Problèmes de signing
- L'app est configurée pour build sans signing (CODE_SIGNING_REQUIRED=NO)
- Vérifiez que le projet Xcode compile localement d'abord

### IPA non créé
- Le workflow essaie plusieurs méthodes de création d'IPA
- En cas d'échec, il crée l'IPA manuellement depuis le .app
- Vérifiez les logs du step "Find IPA File"

### Test de Build Manuel
Pour tester uniquement le build sans release :
1. Allez sur GitHub Actions
2. Cliquez sur "Test Build" 
3. Cliquez "Run workflow"
4. Regardez les logs détaillés pour identifier les problèmes

### Release existe déjà
- GitHub Actions skip automatiquement si la version existe
- Changez la version dans `config.json` pour une nouvelle

### Logs utiles
- **Actions** : https://github.com/Jefedi/iosapp-altstore/actions
- **Build logs** : Cliquez sur le workflow échoué → job "build-ios"
- **Artifacts** : Les IPA de test sont sauvegardés pendant 7 jours

---

**Plus simple impossible ! Modifiez `config.json`, pushez, et tout se déploie automatiquement !** 🚀