# LocalSend

![ci](https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg)

Links: [Homepage](https://localsend.org)
| [Play Store](https://play.google.com/store/apps/details?id=org.localsend.localsend_app)
| [App Store](https://apps.apple.com/us/app/localsend/id1661733229)
| [Windows Store](https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR)

## About

Share files to nearby devices. Free, open source, cross-platform.

This app allows you to send files and messages over the local LAN network.

No internet required, no external servers needed.

## Screenshots

<div style="display:flex">
<img src="https://localsend.org/img/screenshot-iphone.png" alt="screenshot1" height="300"/>
<img src="https://localsend.org/img/screenshot-pc.png" alt="screenshot2" height="300"/>
</div>

## Protocol

Devices communicate with each other using a REST API. 

Everything is sent securely over HTTPS. The TLS/SSL certificate is generated on the fly on each device.

For more information: [LocalSend Protocol v1](https://github.com/localsend/protocol)

## Run

After you have installed [Flutter](https://flutter.dev), then you can start this app by typing the following commands: 

```shell
flutter pub get
flutter pub run build_runner build
flutter run
```

## Build

These commands are mostly for the maintainers.

Please ensure that `flutter pub run build_runner build` has been run. Otherwise, files will be missing.

### Android

Traditional APK

```shell
flutter build apk
```

AppBundle for Google Play

```shell
flutter build appbundle
```

### iOS

```shell
flutter build ipa
```

### MacOS

```shell
flutter build macos
```

### Windows

**Traditional**

```shell
flutter build windows
```

**Local MSIX App**

```shell
flutter pub run msix:create
```

**Store ready**

```shell
flutter pub run msix:create --store
```

### Linux

**Traditional**

```shell
flutter build linux
```

**AppImage**

```shell
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Feel free to open a pull request. There is a  `snap` branch to play with.
