# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Tahanan][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

Ang LocalSend ay isang libreng, open-source na app na nagbibigay-daan sa iyo na ligtas na mag-share ng mga file at mensahe sa mga kalapit na device sa iyong lokal network nang hindi nangangailangan ng koneksyon sa internet.

- [Tungkol](#Tungkol)
- [Mga Screenshots](#Mga-Screenshots)
- [I-download](#I-download)
- [Paano ito Gumagana](#Paano-ito-Gumagana)
- [Pagsisimula](#Pagsisimula)
- [Pag-aambag](#Pag-aambag)
  - [Pagsasalin](#Pagsasalin)
  - [Pag-aayos ng mga Bug at Improvements](#Pag-aayos-ng-mga-Bug-at-Improvements)
- [Pagbuo](#Pagbuo)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Tungkol

Ang LocalSend ay isang cross-platform na app na nagbibigay-daan para sa ligtas na komunikasyon sa pagitan ng mga device gamit ang REST API at HTTPS encryption. Hindi tulad ng ibang mga messaging apps na umaasa sa mga external servers, ang LocalSend ay hindi nangangailangan ng koneksyon sa internet o mga third-party servers, kaya't ito ay isang mabilis at maaasahang solusyon para sa lokal na komunikasyon.

## Mga Screenshots

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## I-download

Inirerekomenda na i-download ang app mula sa app store o mula sa package manager dahil ang app na ito ay walang auto-update.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Magbasa nang higit pa tungkol sa [distribution channels][].

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

## Setup

Sa karamihan, dapat gumana ang LocalSend out of the box. Gayunpaman, kung ikaw ay nahaharap sa mga problema sa pagpapadala o pagtanggap ng mga file, maaaring kailanganin mong i-configure ang iyong firewall upang pahintulutan ang LocalSend na makipag-ugnayan sa iyong lokal na network.

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

Siguraduhing i-disable ang AP isolation sa iyong router. Karaniwang naka-disable ito sa default ngunit ang ilang mga router ay maaaring naka-enable ito (lalo na sa mga guest network).

**Portable Mode**

(Introduced in v1.13.0)

Lumikha ng file na may pangalang `settings.json` na matatagpuan sa parehong directory ng executable.
Maaaring walang laman ang file na ito.
Gagamitin ng app ang file na ito upang i-save ang mga setting sa halip na ang default na lokasyon.

**Start hidden**

(Updated in v1.15.0)

Upang buksan ang app na nakatago (lamang sa tray), gamitin ang `--hidden` flag (halimbawa: `localsend_app.exe --hidden`).

Sa v1.14.0 at baba, ang app ay magsisimula nang nakatago kung ang `autostart` flag ay naka-set, at ang hidden setting ay naka-enable.

## Paano Ito Gumagana

Gumagamit ang LocalSend ng isang secure na protocol ng komunikasyon na nagpapahintulot sa mga device na makipag-usap sa isa't isa gamit ang REST API. Lahat ng data ay ipinapadala nang ligtas sa pamamagitan ng HTTPS, at ang TLS/SSL certificate ay nilikha sa bawat device, na tinitiyak ang maximum na seguridad.

Para sa karagdagang impormasyon sa LocalSend Protocol, tingnan ang [documentation](https://github.com/localsend/protocol).

## Pagsisimula

Upang i-compile ang LocalSend mula sa source code, sundin ang mga hakbang na ito:

1. I-install ang Flutter [directly](https://flutter.dev) o gamit ang [fvm](https://fvm.app) (tignan ang [version required](.fvmrc))
2. I-clone ang `LocalSend` repository
3. I-run ang `cd app` upang pumasok sa app directory
4. I-run ang `flutter pub get` upang i-download ang mga dependencies
5. I-run ang `flutter run` upang simulan ang app

> [!NOTE]
> Kasalukuyang nangangailangan ang LocalSend ng mas lumang bersyon ng Flutter (na tinukoy sa [.fvmrc](.fvmrc))
> at ang mga isyu sa build ay maaaring sanhi ng mismatch sa pagitan ng required at ang (system-wide) na naka-install na Flutter version.
> Upang gawing mas consistent ang development, gumagamit ang LocalSend [fvm](https://fvm.app) upang i-manage ang proyekto Flutter version.
> Pagkatapos i-install ang `fvm`, i-run ang `fvm flutter` sa halip na `flutter`.

## Pag-aambag

Malugod naming tinatanggap ang mga kontribusyon mula sa sinumang interesado na makatulong na mapabuti ang LocalSend. Kung nais mong mag-ambag, may ilang mga paraan upang makilahok:

### Pagsasalin

Maaari kang makatulong na isalin ang app sa iba pang mga wika!

1. I-fork ang repository na ito
2. Pumili ng isa
   - Magdagdag ng mga nawawalang translation sa umiiral na mga wika: I-update lamang ang `_missing_translations_<locale>.json` in [app/assets/i18n][i18n]
   - Ayusin ang umiiral na mga translation: I-update ang `strings_<locale>.i18n.json` in [app/assets/i18n][i18n]
   - Magdagdag ng mga bagong wika: Lumikha ng bagong file; tingnan din: [locale codes][].
3. Opsyonal: I-re-run ang app na ito
   1. I-run ang `cd app` upang pumasok sa app directory.
   2. Siguraduhing na-[run](#Pagsisimula) ang app na ito ng isang beses.
   3. I-update ang mga translation sa pamamagitan ng `flutter pub run slang`
   4. I-run ang app sa pamamagitan ng `flutter run`
   5. Mag-open ng pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**_Pakitandaan:_ Ang mga fields na may `@` ay hindi dapat isalin; hindi ito ginagamit sa app sa anumang paraan, nagbibigay lamang ng impormasyon tungkol sa file o upang bigyan ng konteksto ang tagasalin.**

### Pag-aayos ng mga Bug at Improvements

- **Pag-aayos ng Bug:** Kung nakahanap ka ng bug, mangyaring lumikha ng pull request na may malinaw na paglalarawan ng isyu at kung paano ito aayusin.
- **Improvements:** May ideya ka kung paano ma-improve ang LocalSend? Mangyaring lumikha ng issue upang talakayin kung bakit kinakailangan ng improvement.

Para sa karagdagang impormasyon, tingnan ang [contributing guide](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Pagbuo

Ang mga command na ito ay inilaan lamang para sa mga maintainers.

### Android

Tradisyonal na APK

```bash
flutter build apk
```

AppBundle para sa Google Play

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

**Tradisyonal**

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

**Tradisyonal**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Malugod na mag-bukas ng pull request. Mayroong `snap` branch na maaari mong subukan.

## Mga Kontribyutor

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
