# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]
[![Packaging status][packaging-badge]][packaging-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/
[packaging-badge]: https://repology.org/badge/tiny-repos/localsend.svg
[packaging-link]: https://repology.org/project/localsend/versions

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[Deutsch](README_DE.md) • [English (Default)](/README.md) • [Bahasa Melayu](README_MS.md) • [Español](README_ES.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Tiếng Việt](README_VI.md) • [Türkçe](README_TR.md) • [Česky](README_CS.md) • [Русский](README_RU.md) • [Українська](README_UK.md) • [فارسی](README_FA.md) • [ภาษาไทย](README_TH.md) • [ភាសាខ្មែរ](README_KM.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [한국어](README_KO.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend ist eine freie Open-Source-App, die dir ermöglicht, sicher Daten und Nachrichten an Geräte in der Nähe über das lokale Netzwerk ohne Internetverbindung zu senden.

- [Über](#über)
- [Sponsors](#sponsors)
- [Screenshots](#screenshots)
- [Download](#download)
- [Wie es funktioniert](#wie-es-funktioniert)
- [Erste Schritte](#erste-schritte)
- [Mitwirken](#mitwirken)
  - [Übersetzen](#übersetzungen)
  - [Bugfixes und Verbesserungen](#bug-fixes-und-verbesserungen)
- [Fehlerbehebung](#fehlerbehebung)
- [Building](#bauen)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Über

LocalSend ist eine plattformübergreifende App, die dir erlaubt, eine sichere Verbindung zwischen Geräten mithilfe einer REST API und HTTPS-Verschlüsselung herzustellen. Im Gegensatz zu anderen Messaging-Apps, die externe Server benötigen, braucht LocalSend keine Internetverbindung
oder andere Drittanbieter, was es zu einer schnellen und zuverlässigen Lösung für lokale Kommunikation macht.

## Sponsors

Browser testing via

<a href="https://www.testmuai.com/?utm_medium=sponsor&utm_source=localsend" target="_blank">
    <img src="https://localsend.org/img/sponsors/tesmu.svg" style="vertical-align: middle;" width="250" height="45" />
</a>

## Screenshots

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Download

[![Packaging status](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

Es wird empfohlen, die App über einen App-Store oder einen Paketmanager zu installieren, da die App keinen Auto-Updater hat.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Lies mehr über die [Vertriebskanäle]().

> [!CAUTION]
> **Inoffizielle MSIX preview:** Du kannst Builds aus den neuesten Commits unter [localsend.ob-buff.dev](https://localsend.ob-buff.dev/) ausprobieren. Die Stabilität wird nicht garantiert, und alle individuellen Code-Anpassungen sind auf dieser Seite aufgelistet.

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
[distribution channels]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**Kompatibilität**

| Platform | Mindest Version | Notiz                                                                                                                                        |
|----------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                                            |
| iOS      | 12.0            | -                                                                                                                                            |
| macOS    | 11 Big Sur      | Nutze OpenCore Legacy Patcher 2.0.2 (Siehe [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384))              |
| Windows  | 10              | Die neuste Version die Windows 7 unterstützt ist v1.15.4. Möglicherweise wird es in Zukunft Backports neuerer Versionen für Windows 7 geben. |
| Linux    | N.A.            | Abgängigkeiten: Gnome: `xdg-desktop-portal` und `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` und `xdg-desktop-portal-kde`             |

## Setup

In den meisten Fällen funktioniert LocalSend ohne Einstellungen. Falls esaber Fehler beim Senden oder Empfangen von Dateien gibt, musst du möglicherweise die Firewall anpassen, damit LocalSend über das lokale Netzwerk kommunizieren kann.

| Verkehrs Typ | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Eingang      | TCP, UDP | 53317 | Allow  |
| Ausgang      | TCP, UDP | Jeder | Allow  |

Stelle auch sicher, dass `AP-Isolation` bei deinem Router deaktiviert ist. Normalerweise ist dies standardmäßig deaktiviert, aber manche Router haben dies aktiviert (besonders bei Gäste-WLAN). Siehe [Fehlerbehebung](#fehlerbehebung) für weitere Informationen.

**Portabler Modus**

(Eingeführt in v1.13.0)

Erstelle eine Datei namens `settings.json` in dem gleichen Ordner wie die ausführbare Datei.
Diese Datei kann leer bleiben.
Die App wird diese Datei verwenden, um dort die Einstellungen zu speichern anstatt im üblichen Verzeichnis.

**Versteckt starten**

(Aktualisiert in v1.15.0)

Um die App versteckt (nur im Tray) zu starten, nutze die `--hidden` Option (Beispiel: `localsend_app.exe --hidden`). In v1.14.0 und früher musste die `autostart` Option angegeben und in den Einstellungen aktiviert sein.

## Wie es funktioniert

LocalSend nutzt ein sicheres Kommunikationsprotokoll, das es Geräten erlaubt, über eine REST API zu kommunizieren. Alle Informationen werden sicher über HTTPS übertragen, wobei die TLS/SSL-Zertifikate auf jedem Gerät generiert werden, was maximale Sicherheit ermöglicht.

Für mehr Informationen über das LocalSend Protocol, siehe [Dokumentation](https://github.com/localsend/protocol).

## Erste Schritte

Um LocalSend direkt vom Sourcecode zu kompilieren, folge folgenden Schritten:

1.  Installiere Flutter [direkt](https://flutter.dev) oder [fvm](https://fvm.app) (siehe [version benötigt](/.fvmrc))
2.  Installiere [Rust](https://www.rust-lang.org/tools/install)
3.  Klone das `LocalSend` Repository
4.  Führe `cd app` aus, um in das App-Verzeichnis zu gelangen
5.  Führe `flutter pub get` aus, um die Abhängigkeiten zu installieren
6.  Führe `flutter run` aus, um die App zu starten

> [!NOTE] LocalSend benötigt aktuell eine ältere Flutter-Version
> (festgelegt in [.fvmrc](/.fvmrc)) und kann somit Build-Probleme
> verursachen, wenn eine andere (systemweite) Flutter-Version verwendet
> wird. Um die Entwicklung etwas einheitlicher zu machen, nutzt LocalSend
> [fvm](https://fvm.app), um die Flutter-Version zu verwalten. Nach der
> Installation von `fvm`, nutze `fvm flutter` anstatt `flutter`.

## Mitwirken

Wir begrüßen Mitwirkungen von jedem, der interessiert ist, LocalSend zu verbessern. Wenn du einen Beitrag leisten möchtest, gibt es verschiedene Möglichkeiten, dich zu engagieren:

### Übersetzungen

Du kannst helfen, LocalSend in andere Sprachen zu übersetzen. Wir nutzen [Weblate](https://hosted.weblate.org/projects/localsend/app) zum Verwalten von Übersetzungen.

Alternativ kannst du auch dieses Repo forken und die Übersetzungen manuell hinzufügen.

Die Übersetzungen befinden sich im[app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n)Verzeichnis. Bearbeite die `_missing_translations_<locale>.json`- oder`strings_<locale>.i18n.json`-Datei, um Übersetzungen hinzuzufügen oder zu bearbeiten.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

***Beachte:* Felder mit einem `@` sind nicht zur Übersetzung gedacht; sie werden in der App in keiner Weise verwendet. Es handelt sich lediglich um informativen Text zur Datei oder um Informationen, die dem Übersetzer den Kontext verdeutlichen sollen.**

### Bug-fixes und Verbesserungen

- **Bug-Fixes:** Wenn du einen Bug findest, erstelle bitte einen Pull-Request mit einer klaren Beschreibung, was der Fehler ist, und im besten Fall, wie man ihn behebt.
- **Verbesserung:** Du hast eine Idee, wie man LocalSend verbessern könnte? Dann erstelle bitte ein Issue, um diskutieren zu können, warum und ob diese Verbesserung gebraucht wird.

Für mehr Informationen siehe [Leitfaden für Mitwirkende](/CONTRIBUTING.md)

## Fehlerbehebung

| Problem                    | Platform (Senden) | Platform (Empfangen) | Lösung                                                                                                                                                                        |
|----------------------------|-------------------|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Gerät nicht sichbar        | Jede              | Jede                 | Stelle sicher das AP-Isolation bei deinem Router deaktivert ist. Falls dies aktiert ist, ist die Kommunitikation zwischen den Geräten deaktiviert.                            |
| Gerät nicht sichbar        | Jede              | Windows              | Achten darauf, dass das Netzwerk als "privates" Netzwerk zu konfigurieren. Windows ist möglicherweise strenger, wenn das Netzwerk als öffentliches Netzwerk konfiguriert ist. |
| Gerät nicht sichbar        | macOS, iOS        | Jede                 | Du kannst versuchen die "Local Netzwork" Berechtigung unter "Privary" (Sicherheit) in den Betrebisssystem einstellung umzuschalten                                            |
| Geschwindigkeit zu langsam | Jede              | Jede                 | Nutze 5 Ghz; Deaktivere Verschlüsslung auf beiden Geräten (Nicht empfolhen).                                                                                                  |
| Geschwindigkeit zu langsam | Jede              | Android              | Bekannstes Problem. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                                                    |

## Bauen

Diese Befehle sind nur für Mitwirkende gedacht. Stelle sicher, dass diese aus dem `app`-Verzeichnis ausgeführt werden.

### Android

Traditionelle APK

```bash
flutter build apk
```

AppBundle für Google Play

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

**Traditionell**

```bash
flutter build windows
```

**Lokale MSIX App**

```bash
flutter pub run msix:create
```

**(App) Store bereit**

```bash
flutter pub run msix:create --store
```

### Linux

**Traditionell**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Anleitung in [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Mitwirkende

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
