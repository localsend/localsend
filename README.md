# LocalSend

LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network, without needing an internet connection.

[![CI status](https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg)](https://github.com/localsend/localsend/actions/workflows/ci.yml)

Links: [Homepage](https://localsend.org)
| [Play Store](https://play.google.com/store/apps/details?id=org.localsend.localsend_app)
| [F-Droid](https://f-droid.org/packages/org.localsend.localsend_app)
| [App Store](https://apps.apple.com/us/app/localsend/id1661733229)
| [Windows Store](https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR)

- [About](#about)
- [Screenshots](#screenshots)
- [How it Works](#how-it-works)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
  - [Translation](#translation)
  - [Bug fixes and improvements](#bug-fixes-and-improvements)
- [Building](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [MacOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## About

LocalSend is a cross-platform app that enables secure communication between devices using a REST API and HTTPS encryption. Unlike other messaging apps that rely on external servers, LocalSend doesn't require an internet connection or third-party servers, making it a fast and reliable solution for local communication.

## Screenshots

<img src="https://localsend.org/img/screenshot-iphone.png" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.png" alt="PC screenshot" height="300"/>

## How it Works

LocalSend uses a secure communication protocol that allows devices to communicate with each other using a REST API. All data is sent securely over HTTPS, and the TLS/SSL certificate is generated on the fly on each device, ensuring maximum security.

For more information on the LocalSend Protocol, see the [documentation](https://github.com/localsend/protocol).

## Getting Started

To get started with LocalSend, follow these steps:

1. Install [Flutter](https://flutter.dev)
2. Clone the LocalSend repository
3. Run `flutter pub get` to download dependencies
4. Run `flutter pub run build_runner build -d` to generate code
5. Run `flutter run` to start the app

## Contributing

We welcome contributions from anyone who is interested in helping improve LocalSend. If you'd like to contribute, there are a few ways to get involved:

### Translation

You can help translating this app to other languages!

1. Fork this repository
2. Choose one
   - Add missing translations in existing languages: Only update `_missing_translations_<locale>.json` in [assets/i18n](https://github.com/localsend/localsend/tree/main/assets/i18n)
   - Fix existing translations: Update `strings_<locale>.i18n.json` in [assets/i18n](https://github.com/localsend/localsend/tree/main/assets/i18n)
   - Add new languages: Create a new file, see also: [locale codes](https://saimana.com/list-of-country-locale-code/).
3. Optional: Re-run this app
   1. Make sure you have [run](#getting-started) this app once.
   2. Update translations via `flutter pub run slang`
   3. Run app via `flutter run`
4. Open a pull request

### Bug fixes and improvements

- **Bug Fixes:** If you find a bug, please create a pull request with a clear description of the issue and how to fix it.
- **Improvements:** Have an idea for how to improve LocalSend? Please create an issue first so we can discuss why the improvement is needed.

For more information, see the [contributing guide](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

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

### MacOS

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

Feel free to open a pull request. There is a `snap` branch to play with.
