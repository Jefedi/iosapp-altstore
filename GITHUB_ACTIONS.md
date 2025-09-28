# Guide GitHub Actions pour AltStore

Ce guide vous explique comment utiliser GitHub Actions pour compiler automatiquement votre application iOS pour AltStore.

## 🚀 Configuration initiale

### 1. Créer un repository GitHub

```bash
# Initialiser un repo Git local
git init
git add .
git commit -m "Initial commit - iOS app for AltStore"

# Créer un repo sur GitHub et le lier
git remote add origin https://github.com/VOTRE-USERNAME/VOTRE-REPO.git
git push -u origin main
```

### 2. Le workflow se déclenche automatiquement

Le workflow GitHub Actions (`.github/workflows/build.yml`) se déclenche sur :
- ✅ **Push** sur les branches `main` ou `develop`
- ✅ **Pull Requests** vers `main`
- ✅ **Tags** commençant par `v` (ex: `v1.0.0`)
- ✅ **Déclenchement manuel** depuis l'interface GitHub

## 📱 Compilation automatique

### Processus de build

1. **Setup** : Environnement macOS + Xcode latest
2. **Cache** : Accélération des builds suivants
3. **Build Archive** : Création de l'archive Xcode
4. **Export IPA** : Génération du fichier .ipa
5. **Upload Artifact** : Sauvegarde temporaire (30 jours)
6. **Release** : Publication automatique pour les tags

### Récupérer l'IPA compilé

#### Option A: Artifacts (builds normaux)
1. Allez dans votre repo GitHub
2. Cliquez sur l'onglet "Actions"
3. Sélectionnez le build désiré
4. Téléchargez l'artifact `AltStoreApp-[commit-hash]`

#### Option B: Releases (tags seulement)
1. Créez un tag : `git tag v1.0.0 && git push origin v1.0.0`
2. GitHub créera automatiquement une release
3. L'IPA sera attaché à la release
4. Le manifeste AltStore sera mis à jour avec la bonne URL

## 🔧 Personnalisation

### Modifier le Bundle ID
Éditez le fichier `AltStoreApp.xcodeproj/project.pbxproj` :
```
PRODUCT_BUNDLE_IDENTIFIER = com.votre-nom.votre-app;
```

### Ajouter des dépendances
Modifiez la step "Install Dependencies" dans le workflow :
```yaml
- name: Install Dependencies
  run: |
    # Pour CocoaPods
    pod install --repo-update
    
    # Pour Swift Package Manager
    # Les dépendances sont automatiquement résolues
```

### Changer les paramètres de build
Modifiez les variables d'environnement au début du workflow :
```yaml
env:
  PROJECT_NAME: VotreApp
  SCHEME_NAME: VotreScheme
```

## 📋 Utilisation pour AltStore

### 1. Publication via GitHub Releases

```bash
# Créer un tag pour déclencher une release
git tag v1.0.0
git push origin v1.0.0
```

L'IPA sera disponible à :
`https://github.com/VOTRE-USERNAME/VOTRE-REPO/releases/download/v1.0.0/AltStoreApp.ipa`

### 2. Mise à jour du manifeste AltStore

Le workflow met automatiquement à jour `altstore-source.json` avec la bonne URL de release.

### 3. Ajout dans AltStore

Hébergez `altstore-source.json` quelque part (GitHub Pages, Netlify, etc.) et ajoutez l'URL dans AltStore :

```
https://votre-site.github.io/altstore-source.json
```

## ⚡ Conseils et astuces

### Build plus rapides
- Le cache Xcode accélère les builds répétés
- Les artifacts permettent de télécharger sans reconstruire

### Debugging
- Consultez les logs détaillés dans l'onglet Actions
- Vérifiez que tous les fichiers nécessaires sont committés

### Sécurité
- Les secrets GitHub peuvent être utilisés pour les certificats
- Aucun secret n'est requis pour les builds de développement

### Limites
- **2000 minutes/mois** pour les repos privés (gratuit)
- **Illimité** pour les repos publics
- Les macOS runners sont plus lents que Linux

## 🎯 Flux de travail recommandé

1. **Développement** : Commitez sur `develop`
2. **Test** : Le workflow build automatiquement
3. **Release** : Mergez vers `main` et créez un tag
4. **Distribution** : L'IPA est publié automatiquement

C'est tout ! Votre app iOS sera compilée automatiquement dans le cloud à chaque modification. 🚀