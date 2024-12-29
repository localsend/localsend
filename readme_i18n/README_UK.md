# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[Домашня сторінка][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](README.md) • [中文](readme_i18n/README_ZH.md) • [日本語](readme_i18n/README_JA.md) • [ภาษาไทย](readme_i18n/README_TH.md) • [Filipino](readme_i18n/README_PH.md) • [Polski](readme_i18n/README_PL.md) • [Español](readme_i18n/README_ES.md) • [Tiếng Việt](readme_i18n/README_VI.md) • [Portugês Brasil](readme_i18n/README_PT_BR.md) • [Italiano](readme_i18n/README_IT.md) • [Indonesia](readme_i18n/README_ID.md) • [ភាសាខ្មែរ](readme_i18n/README_KM.md) • [Français](readme_i18n/README_FR.md) • [فارسی](readme_i18n/README_FA.md) • [Turkish](readme_i18n/README_TR.md) • [한국어](readme_i18n/README_KO.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend — це безплатна програма з відкритим вихідним кодом, яка дозволяє вам безпечно обмінюватися файлами та повідомленнями з пристроями поблизу через локальну мережу, без необхідності підключення до Інтернету.

- [About](#about)
- [Screenshots](#screenshots)
- [Download](#download)
- [How It Works](#how-it-works)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
  - [Translation](#translation)
  - [Bug Fixes and Improvements](#bug-fixes-and-improvements)
- [Troubleshooting](#troubleshooting)
- [Building](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Про LocalSend

LocalSend — це кросплатформна програма, яка забезпечує безпечний зв'язок між пристроями за допомогою REST API та HTTPS-шифрування. На відміну від інших програм для обміну повідомленнями, які покладаються на зовнішні сервери, LocalSend не потребує підключення до Інтернету чи сторонніх серверів, що робить його швидким та надійним рішенням для локального зв'язку.

## Скріншоти

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Завантажити

Рекомендується завантажувати програму з магазину програм або з менеджера пакетів, оскільки програма не має автоматичного оновлення.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Детальніше про [канали дистрибуції][].

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
[канали дистрибуції]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**Сумісність**

| Платформа | Мінімальна версія | Примітка                                                                                                                                 |
|-----------|-------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Android   | 5.0               | -                                                                                                                                        |
| iOS       | 12.0              | -                                                                                                                                        |
| macOS     | 11 Big Sur        | Використовуйте OpenCore Legacy Patcher 2.0.2 (Див. [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384))  |
| Windows   | 10                | Остання версія, що підтримує Windows 7 — v1.15.4. Можливо, в майбутньому можуть з'явитися зворотні порти новіших версій для Windows 7.   |
| Linux     | Н/Д               | -                                                                                                                                        |

## Налаштування

У більшості випадків LocalSend має працювати прямо з коробки. Проте, якщо у вас виникли проблеми з надсиланням або отриманням файлів, можливо, вам доведеться налаштувати брандмауер, щоб дозволити LocalSend взаємодіяти з вашою локальною мережею.

| Тип трафіку | Протокол | Порт      | Дія       |
|-------------|----------|-----------|-----------|
| Вхідний     | TCP, UDP | 53317     | Дозволити |
| Вихідний    | TCP, UDP | Будь-який | Дозволити |

Також переконайтеся, що на вашому маршрутизаторі вимкнено ізоляцію точок доступу. Зазвичай вона вимкнена за замовчуванням, але на деяких маршрутизаторах вона може бути увімкнена (особливо в гостьових мережах).
Для отримання додаткової інформації перегляньте розділ [усунення несправностей](#troubleshooting).

**Портативний режим**

(Починаючи з v1.13.0)

Створіть файл з іменем `settings.json` у тій самій директорії, що й виконуваний файл.
Цей файл може бути порожнім.
Програма використовуватиме цей файл для зберігання налаштувань замість стандартного місця збереження.

**Start hidden**

(Updated in v1.15.0)

To start the app hidden (only in tray), use the `--hidden` flag (example: `localsend_app.exe --hidden`).

On v1.14.0 and earlier, the app starts hidden if `autostart` flag is set, and the hidden setting is enabled.

## How It Works

LocalSend uses a secure communication protocol that allows devices to communicate with each other using a REST API. All data is sent securely over HTTPS, and the TLS/SSL certificate is generated on the fly on each device, ensuring maximum security.

For more information on the LocalSend Protocol, see the [documentation](https://github.com/localsend/protocol).

## Getting Started

To compile LocalSend from the source code, follow these steps:

1. Install Flutter [directly](https://flutter.dev) or using [fvm](https://fvm.app) (see [version required](.fvmrc))
2. Install [Rust](https://www.rust-lang.org/tools/install)
3. Clone the `LocalSend` repository
4. Run `cd app` to enter the app directory
5. Run `flutter pub get` to download dependencies
6. Run `flutter run` to start the app

> [!NOTE]
> LocalSend currently requires an older Flutter version (specified in [.fvmrc](.fvmrc))
> and thus build issues may be caused by a mismatch between the required and the (system-wide) installed Flutter version.  
> To make development more consistent, LocalSend uses [fvm](https://fvm.app) to manage the project Flutter version.
> After installing `fvm`, run `fvm flutter` instead of `flutter`.

## Contributing

We welcome contributions from anyone interested in helping improve LocalSend. If you'd like to contribute, there are a few ways to get involved:

### Translation

You can help translate LocalSend into other languages. We use the [Weblate](https://hosted.weblate.org/projects/localsend/app) platform to manage translations.

Alternatively, you can also contribute by forking this repository and adding translations manually.

The translations are located in the [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) directory. Edit the `_missing_translations_<locale>.json` or `strings_<locale>.i18n.json` file to add or update translations.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_Take note:_ Fields decorated with `@` are not meant to be translated; they are not used in the app in any way, being merely informative text about the file or to give context to the translator.**

### Bug Fixes and Improvements

- **Bug Fixes:** If you find a bug, please create a pull request with a clear description of the issue and how to fix it.
- **Improvements:** Have an idea for how to improve LocalSend? Please create an issue first to discuss why the improvement is needed.

For more information, see the [contributing guide](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Troubleshooting

| Issue              | Platform (Sending) | Platform (Receiving) | Solution                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Device not visible | Any                | Any                  | Make sure to disable AP-Isolation on your router. If it is enabled, connections between devices are forbidden.                          |
| Device not visible | Any                | Windows              | Make sure to configure your network as a "private" network. Windows might be more restrictive when the network is configured as public. |
| Device not visible | macOS, iOS         | Any                  | You can try to toggle the "Local Network" permission under "Privacy" in the OS settings.                                                |
| Speed too slow     | Any                | Any                  | Use 5 Ghz; Disable encryption on both devices                                                                                           |
| Speed too slow     | Any                | Android              | Known issue. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

## Building

These commands are intended for maintainers only.

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

Instructions in [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
