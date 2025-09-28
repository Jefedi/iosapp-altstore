# 📱 Guide d'Installation AltStore

## 🎯 Comment télécharger et installer votre app via AltStore

### **📦 Étape 1 : Télécharger l'IPA**

#### **Option A : Depuis GitHub Actions (Recommandé actuellement)**
1. **Allez sur votre repository** : https://github.com/Jefedi/iosapp-altstore
2. **Cliquez sur l'onglet "Actions"**
3. **Sélectionnez le build réussi** (celui avec ✅ et "success")
4. **Descendez vers "Artifacts"**
5. **Cliquez sur "AltStoreApp-[hash]"** pour télécharger
6. **Décompressez le zip** → vous obtenez `AltStoreApp.ipa`

#### **Option B : Depuis les Releases (après correction)**
1. **Allez sur** : https://github.com/Jefedi/iosapp-altstore/releases
2. **Cliquez sur la dernière release** (v1.0.0 ou plus récente)
3. **Téléchargez** `AltStoreApp.ipa` directement

---

### **📲 Étape 2 : Installer via AltStore**

#### **Prérequis**
- ✅ **AltStore installé** sur votre iPhone/iPad
- ✅ **AltServer lancé** sur votre PC/Mac
- ✅ **Même réseau WiFi** pour l'appareil et l'ordinateur
- ✅ **Compte Apple ID** (gratuit suffit)

#### **Installation directe**
1. **Copiez** le fichier `AltStoreApp.ipa` sur votre iPhone
   - Via AirDrop (Mac → iPhone)
   - Via cloud (Dropbox, iCloud Drive, etc.)
   - Via email (en pièce jointe)

2. **Ouvrez le fichier avec AltStore**
   - Tapez sur le fichier .ipa
   - Choisissez "Ouvrir avec AltStore"
   - AltStore lance l'installation

3. **Confirmez l'installation**
   - Entrez votre identifiant Apple ID
   - AltStore signe et installe l'app
   - L'app apparaît sur votre écran d'accueil

---

### **🌐 Étape 3 : Installation via Source AltStore (Bientôt)**

Une fois l'hébergement configuré, vous pourrez :

1. **Ajouter la source dans AltStore** :
   ```
   https://jefedi.github.io/iosapp-altstore/altstore-source.json
   ```

2. **Installer directement depuis AltStore** :
   - Ouvrez AltStore
   - Allez dans "Sources"
   - Trouvez "Jefedi AltStore App"
   - Tapez "Installer"

---

### **🔧 Dépannage**

#### **❌ "Impossible d'installer l'app"**
- Vérifiez qu'AltServer est lancé
- Assurez-vous d'être sur le même WiFi
- Redémarrez AltStore

#### **❌ "Certificat non valide"**
- L'app expire après 7 jours (compte gratuit)
- Réinstallez via AltStore pour renouveler

#### **❌ "App non signée"**
- Normal pour les comptes gratuits
- AltStore gère la signature automatiquement

---

### **📋 Après Installation**

✅ **L'app est installée** comme "Jefedi AltStore App"  
✅ **Fonctionnalités** : Compteur interactif avec boutons +/-  
✅ **Compatible** : iPhone et iPad, iOS 17+  
✅ **Renouvellement** : Automatique via AltStore  

---

### **🎯 Prochaines améliorations**

1. **GitHub Pages** : Hébergement automatique des manifestes
2. **Release automatique** : Correction du workflow pour les tags
3. **Icône personnalisée** : Ajout d'une vraie icône d'app
4. **Screenshots** : Captures d'écran pour le store

---

**🚀 Votre app iOS est maintenant prête pour AltStore !**

*Note : Actuellement, utilisez la méthode "Artifacts" pour télécharger l'IPA. L'installation via source sera disponible après configuration de l'hébergement.*