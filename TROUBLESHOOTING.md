# Guide de Résolution des Problèmes GitHub Actions

## 🔍 Comment vérifier les erreurs GitHub Actions

### 1. Accéder aux logs d'exécution
1. Allez sur votre repository GitHub : `https://github.com/Jefedi/iosapp-altstore`
2. Cliquez sur l'onglet "Actions"
3. Sélectionnez l'exécution de workflow la plus récente
4. Cliquez sur le job "Build and Export IPA"
5. Examinez chaque étape pour voir les erreurs

### 2. Problèmes courants et solutions

#### ❌ **Erreur : Xcode project not found**
**Solution :**
- Vérifiez que le fichier `AltStoreApp.xcodeproj` existe
- Assurez-vous que la structure des dossiers est correcte

#### ❌ **Erreur : Scheme not found**
**Solution :**
- Le schéma Xcode doit être partagé
- Vérifiez le fichier `.xcodeproj/xcshareddata/xcschemes/`

#### ❌ **Erreur de signature de code**
**Solution :**
- Nous utilisons `CODE_SIGNING_REQUIRED=NO` pour éviter ce problème
- Pour une app distribuée, vous devrez configurer les certificats

#### ❌ **Erreur d'export IPA**
**Solution :**
- Vérifiez le fichier `ExportOptions.plist`
- Assurez-vous que le Bundle ID est correct

### 3. Debug étapes par étapes

Le workflow inclut maintenant une étape "Debug Project Structure" qui affiche :
- Le répertoire courant
- La liste des fichiers
- Le contenu du projet Xcode
- La liste des schémas disponibles

### 4. Erreurs spécifiques possibles

#### **Build Archive failed**
Causes possibles :
- Fichiers Swift avec erreurs de syntaxe
- Ressources manquantes
- Configuration Xcode incorrecte

#### **Export IPA failed**
Causes possibles :
- `ExportOptions.plist` malformé
- Bundle ID incorrect
- Problème de certificats/provisioning

### 5. Actions de correction

#### **Si le build échoue complètement :**
```bash
# Vérifiez localement d'abord (sur Mac uniquement)
xcodebuild -project AltStoreApp.xcodeproj -scheme AltStoreApp -configuration Release clean build
```

#### **Si l'export IPA échoue :**
```bash
# Testez l'export localement
xcodebuild -exportArchive -archivePath build/AltStoreApp.xcarchive -exportPath build/ -exportOptionsPlist ExportOptions.plist
```

### 6. Monitoring en continu

Après chaque push sur `main`, le workflow :
1. ✅ Se déclenche automatiquement
2. 🔍 Affiche les informations de debug
3. 🛠 Tente la compilation
4. 📱 Génère l'IPA si succès
5. 📊 Fournit un résumé

### 7. En cas d'échec persistant

Si le build continue d'échouer :

1. **Vérifiez les logs détaillés** dans GitHub Actions
2. **Testez localement** si vous avez accès à un Mac
3. **Contactez le support** avec les logs d'erreur
4. **Utilisez une VM macOS** pour les tests locaux

### 8. Alternatives en cas de problème

- **GitHub Codespaces** avec un environnement macOS
- **Xcode Cloud** (service officiel Apple)
- **Codemagic** ou **Bitrise** (services tiers)

## 📱 Prochaines étapes après le build réussi

Une fois le build GitHub Actions fonctionnel :

1. ⭐ **Créer un tag** : `git tag v1.0.0 && git push origin v1.0.0`
2. 📦 **Télécharger l'IPA** depuis les Artifacts ou Releases
3. 🌐 **Configurer l'hébergement** des manifestes
4. 📲 **Tester avec AltStore**

---

**Note :** Surveillez l'onglet Actions pour voir le statut du build en cours !