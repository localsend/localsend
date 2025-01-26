# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[Hlavní stránka][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[Česky](README_CS.md) • [English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Portugês Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend je bezplatná aplikace s otevřeným zdrojovým kódem, která vám umožňuje bezpečně sdílet soubory a zprávy s okolními zařízeními přes vaši místní síť, aniž byste potřebovali připojení k internetu.

- [O aplikaci](#about)
- [Snímky obrazovky](#screenshots)
- [Stažení](#download)
- [Jak to funguje](#how-it-works)
- [Začínáme](#getting-started)
- [Jak přispět](#contributing)
  - [Překlady](#translation)
  - [Opravy chyb a vylepšení](#bug-fixes-and-improvements)
- [Odstraňování problémů](#troubleshooting)
- [Kompilace](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## O aplikaci

LocalSend je multiplatformní aplikace, která umožňuje bezpečnou komunikaci mezi zařízeními pomocí REST API a šifrování HTTPS. Na rozdíl od jiných aplikací pro zasílání zpráv, které se spoléhají na externí servery, LocalSend nevyžaduje připojení k internetu ani servery třetích stran, což z něj činí rychlé a spolehlivé řešení pro místní komunikaci.

## Snímky obrazovky

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Stažení

Doporučuje se stáhnout aplikaci buď z obchodu s aplikacemi nebo ze správce balíčků, protože aplikace nemá automatickou aktualizaci.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
| ----------------------- | ----------------------- | ------------------ | -------------- | ------------- | ---------- |
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Přečtěte si další informace o [distribučních kanálech][].

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

**Kompatibilita**

| Platforma | Minimální Verze | Poznámka                                                                                                                          |
| --------- | --------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Android   | 5.0             | -                                                                                                                                 |
| iOS       | 12.0            | -                                                                                                                                 |
| macOS     | 11 Big Sur      | Použijte OpenCore Legacy Patcher 2.0.2 (Více [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows   | 10              | Poslední verze podporující Windows 7 je v1.15.4. V budoucnu mohou existovat backporty novějších verzí pro Windows 7.              |
| Linux     | N.A.            | -                                                                                                                                 |

## Nastavení

Ve většině případů by měl LocalSend fungovat hned. Pokud však máte potíže s odesíláním nebo přijímáním souborů, možná budete muset nakonfigurovat bránu firewall tak, aby umožnila LocalSend komunikovat přes vaši místní síť.

| Typ provozu | Protokol | Port     | Akce    |
| ----------- | -------- | -------- | ------- |
| Příchozí    | TCP, UDP | 53317    | Povolit |
| Odchozí     | TCP, UDP | Jakýkoli | Povolit |

Také se ujistěte, že jste na routeru zakázali izolaci přístupového bodu. Ve výchozím nastavení by měla být obvykle zakázána, ale některé routery ji mohou mít povolenou (zejména sítě pro hosty).
Více informací při [odstraňování problémů](#troubleshooting).

**Přenosný režim**

(Zavedeno v v1.13.0)

Vytvořte soubor s názvem `settings.json` umístěný ve stejném adresáři jako spustitelný soubor.
Tento soubor může být prázdný.
Aplikace použije tento soubor k uložení nastavení namísto výchozího umístění.

**Spuštění v liště**

(Aktualizováno v v1.15.0)

Chcete-li aplikaci spustit skrytě (pouze v liště), použijte příznak `--hidden` (příklad: `localsend_app.exe --hidden`).
Ve verzi 1.14.0 a dřívějších se aplikace spustí skrytě, pokud je nastaven příznak `autostart` a skryté nastavení je povoleno.

## Jak to funguje

LocalSend používá zabezpečený komunikační protokol, který umožňuje zařízením komunikovat mezi sebou pomocí REST API. Všechna data jsou odesílána bezpečně přes HTTPS a TLS/SSL certifikát je generován za chodu na každém zařízení, což zajišťuje maximální bezpečnost.

Další informace o protokolu LocalSend najdete v [dokumentaci](https://github.com/localsend/protocol).

## Začínáme

Chcete-li zkompilovat LocalSend ze zdrojového kódu, postupujte následovně:

1. Nainstalujte Flutter [přímo](https://flutter.dev) nebo pomocí [fvm](https://fvm.app) (viz [požadovaná verze](.fvmrc))
2. Nainstalujte [Rust](https://www.rust-lang.org/tools/install)
3. Naklonujte repozitář `LocalSend`
4. `cd app` přejděte do adresáře aplikace
5. `flutter pub get` stáhněte závislosti
6. `flutter run` pro spuštění aplikace

> [!NOTE]
> LocalSend aktuálně vyžaduje starší verzi Flutter (uvedenou v [.fvmrc](.fvmrc))
> a tedy problémy se sestavováním mohou být způsobeny nesouladem mezi požadovanou a (v celém systému) nainstalovanou verzí Flutter.
> Aby byl vývoj konzistentnější, používá LocalSend [fvm](https://fvm.app) ke správě verze projektu Flutter.
> Po instalaci `fvm` spusťte `fvm flutter` místo `flutter`.

## Jak přispět

Vítáme příspěvky od každého, kdo má zájem pomoci zlepšit LocalSend. Pokud chcete přispět, existuje několik způsobů, jak se zapojit:

### Překlady

Můžete pomoci s překladem LocalSend do jiných jazyků. Ke správě překladů používáme platformu [Weblate](https://hosted.weblate.org/projects/localsend/app).

Případně můžete také přispět tím, že tento repozitář naklonujete a překlady přidáte ručně.

Překlady jsou umístěny v adresáři [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Chcete-li přidat nebo aktualizovat překlady, upravte soubor `_missing_translations_<locale>.json` nebo `strings_<locale>.i18n.json`.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_Upozornění:_ Pole označená `@` nejsou určena k překladu; nejsou v aplikaci žádným způsobem použity, jsou pouze informativním textem o souboru nebo poskytují kontext překladateli.**

### Opravy chyb a vylepšení

- **Opravy chyb:** Pokud najdete chybu, vytvořte prosím PR s jasným popisem problému a postupem, jak jej opravit.

- **Vylepšení:** Máte nápad, jak zlepšit LocalSend? Nejprve prosím vytvořte požadavek, abyste mohli prodiskutovat, proč je vylepšení potřeba.

Další informace najdete v [příručce pro přispívání](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Odstraňování problémů

| Problém                   | Platforma (odesílání) | Platforma (přijímání) | Řešení                                                                                                                                         |
| ------------------------- | --------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Zařízení není vidět       | Jakákoliv             | Jakákoliv             | Ujistěte se, že jste na routeru zakázali izolaci AP. Pokud je povolena, spojení mezi zařízeními jsou zakázána.                                 |
| Zařízení není vidět       | Jakákoliv             | Windows               | Ujistěte se, že jste nakonfigurovali svou síť jako "soukromou" síť. Windows může být více omezující, když je síť nakonfigurována jako veřejná. |
| Zařízení není vidět       | macOS, iOS            | Jakákoliv             | Můžete zkusit přepnout oprávnění "Místní síť" v "Soukromí" v nastavení OS.                                                                     |
| Rychlost je příliš pomalá | Jakákoliv             | Jakákoliv             | Použijte 5 GHz; Vypněte šifrování na obou zařízeních                                                                                           |
| Rychlost je příliš pomalá | Jakákoliv             | Android               | Známý problém. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                          |

## Kompilace

Tyto příkazy jsou určeny pouze tvůrcům kompilací.

### Android

Traditional APK

```bash
flutter build apk
```

AppBundle for Google Play

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

**Traditional**

```bash
flutter build windows
```

**Local MSIX App**

```bash
flutter pub run msix:create
```

**Store ready**

```bash
flutter pub run msix:create --store
```

### Linux

**Traditional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Instrukce v [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
