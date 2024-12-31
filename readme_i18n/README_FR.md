# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Site web][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Portugês Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend est une application gratuite et open-source qui permet de partager en toute sécurité des fichiers et messages aux appareils connectés à votre réseau local, même sans accès à Internet.

- [À propos](#à-propos)
- [Captures d'écran](#captures-décran)
- [Téléchargements](#téléchargements)
- [Fonctionnement](#fonctionnement)
- [Configuration](#configuration)
- [Contributions](#contributions)
  - [Traductions](#traductions)
  - [Corrections de bugs et améliorations](#corrections-de-bugs-et-améliorations)
- [Building](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## À propos

LocalSend est une application cross-platform qui permet une communication sécurisée entre plusieurs appareils grâce au chiffrement HTTPS et à l'utilisation d'une API REST. A contrario des autres applications de messagerie, LocalSend ne requiert aucune connexion à des serveurs externes ni de connexion Internet, ce qui en fait une solution fiable et rapide pour des échanges locaux. 

## Captures d'écran

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Téléchargements

Il est recommandé de télécharger l'application soit depuis un app store ou depuis un gestionnaire de paquet car LocalSend ne dispose pas d'un système de mise à jour intégré.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

En savoir plus à propos des [canaux de distribution][].

[windows store]: https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR
[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[play store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[amazon]: https://www.amazon.com/dp/B0BW6MP732
[winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66
[chocolatey]: https://community.chocolatey.org/packages/localsend
[homebrew]: https://formulae.brew.sh/cask/localsend
[flathub]: https://flathub.org/apps/details/org.localsend.localsend_app
[nixpkgs]: https://search.nixos.org/packages?show=localsend
[snap]: https://snapcraft.io/localsend
[aur]: https://aur.archlinux.org/packages/localsend-bin
[latest]: https://github.com/localsend/localsend/releases/latest
[canaux de distribution]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

## Informations additionnelles

Dans la plupart des cas, LocalSend devrait fonctionner tel quel. Cependant, si vous rencontrez des problèmes lors de l'envoi ou la réception de fichiers, il se peut que vous deviez configurer votre pare-feu afin d'autoriser LocalSend à communiquer avec d'autres appareils sur votre réseau local.

| Type de traffic | Protocole | Port  | Action    |
|-----------------|-----------|-------|-----------|
| Entrant         | TCP, UDP  | 53317 | Autoriser |
| Sortant         | TCP, UDP  | Tous  | Autoriser |

Veillez également à ce que l'option "Isolement du point d'accès" (AP isolation) soit bien désactivée dans les paramètres de votre routeur/box internet car il se peut qu'elle soit activée par défaut (surtout pour le Wi-Fi invité).

**Mode Portable**

(Introduit dans la version 1.13.0)

Créer un fichier nommé `settings.json` situé dans le même dossier que le fichier exécutable.
Ce fichier peut être vide.
LocalSend utilisera ce fichier au lieu de l'emplacement par défaut afin de sauvegarder vos paramètres.

**Lancement en arrière-plan**

(Mis à jour dans la version 1.15.0)

Pour lancer l'application en arrière-plan, utilisez l'argument `--hidden` (exemple: `localsend_app.exe --hidden`).

Pour les versions <= 1.14.0, l'application se lance en arrière-plan si l'argument `autostart` est défini et que le paramètre "hidden" est activé.

## Fonctionnement

LocalSend utilise un protocole de communication securisé qui permet aux appareils de communiquer entre eux via une API REST. Toutes les données sont envoyées de façon sécurisée grâce à HTTPS et au certificat TLS/SSL qui est généré pour chaque appareil, garantissant un niveau de sécurité maximal.

Pour plus d'informations sur le protocole LocalSend, vous pouvez lire la [documentation](https://github.com/localsend/protocol).

## Configuration

Pour compiler LocalSend depuis le code source, veuillez suivre les étapes suivantes :

1. Installer Flutter [directement](https://flutter.dev) ou utiliser [fvm](https://fvm.app) (voir [la version requise](/.fvmrc))
2. Cloner le repository `LocalSend`
3. Exécuter `cd app` pour entrer dans le dossier de l'application
4. Exécuter `flutter pub get` pour télécharger les dépendances
5. Exécuter `flutter run` pour lancer l'application

> [!NOTE]
> LocalSend requiert pour le moment une version plus ancienne de Flutter (spécifiée dans [.fvmrc](/.fvmrc))
> ce qui peut créer des erreurs lors de la compilation à cause d'une différence de version entre celle requise par LocalSend et celle installée.
> Dans le but de rendre le développement plus conforme, LocalSend utilise [fvm](https://fvm.app) pour gérer la version de Flutter.
> Après l'installation de `fvm`, exécutez `fvm flutter` au lieu de `flutter`.

## Contributions

Nous accueillons les contributions venant de quiconque étant intéressé pour aider à améliorer LocalSend. Si vous désirez contribuer au projet, il y a plusieurs façons pour y parvenir :

### Traductions

Vous pouvez aider à traduire cette application dans d'autres langues !

1. Fork le repository
2. Choisir entre
   - Ajouter les traductions manquantes pour des langues existantes: Mettre à jour seulement `_missing_translations_<locale>.json` dans [app/assets/i18n][i18n]
   - Corriger des traductions existantes: Mettre à jour `strings_<locale>.i18n.json` dans [app/assets/i18n][i18n]
   - Ajouter une nouvelle langue: Créer un nouveau fichier dans [app/assets/i18n][i18n]; voir également les [codes régionaux][].
3. Optionnel: Tester l'application avec les nouvelles traductions
   1. Exécuter `cd app` pour entrer dans le dossier de l'application.
   2. Valider que la [configuration](#configuration) a déjà été faite.
   3. Mettre à jour les traductions en exécutant `flutter pub run slang`
   4. Lancer l'application en exécutant `flutter run`
   5. Ouvrir une pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[codes régionaux]: https://saimana.com/list-of-country-locale-code/

**_Nota Bene:_ Les textes précédés par un `@` ne doivent pas être traduit; ce ne sont pas des textes utilisés dans l'application mais des notes informatives pouvant aider les traducteurs.**

### Corrections de bugs et améliorations

- **Corrections de bugs:** Si vous trouvez un bug, veuillez créer une pull request contenant une description détaillée du problème et comment le résoudre.
- **Améliorations:** Vous voulez proposer une idée pour LocalSend ? Veuillez d'abord créer une issue afin d'expliquer en quoi il s'agit d'une amélioration.

Pour plus d'informations, veuillez vous référer au [guide du contributeur](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Building

Ces commandes sont destinées aux mainteneurs uniquement.

### Android

APK traditionnel

```bash
flutter build apk
```

AppBundle pour Google Play

```bash
flutter build appbundle
```

### iOS

```bash
flutter build ipa
```

### macOS

```bash
flutter build macos
```

### Windows

**Traditionnel**

```bash
flutter build windows
```

**Application MSIX locale**

```bash
flutter pub run msix:create
```

**Compatible Windows Store**

```bash
flutter pub run msix:create --store
```

### Linux

**Traditionnel**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Instructions dans [snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Contributeurs

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
