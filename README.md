# LocalSend

Share files to nearby devices. Free, open source, cross-platform. [Homepage](https://localsend.org)

# Screenshots

<img src="https://localsend.org/img/screenshot-iphone.png" alt="screenshot1" width="200"/>

<img src="https://localsend.org/img/screenshot-pc.png" alt="screenshot2" width="200"/>

# Run

```shell
flutter pub get
flutter pub run build_runner build
flutter run
```

# Build

Android

```shell
flutter build appbundle
```

iOS

```shell
flutter build ipa
```

MacOS

```shell
flutter build macos
```

Windows

```shell
flutter pub run msix:create --store
```
