# LocalSend (বাংলা)

[![CI status][ci-badge]][ci-workflow]  
[![Translations][translate-badge]][translate-link]  
[![Packaging status][packaging-badge]][packaging-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg  
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml  
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg  
[translate-link]: https://hosted.weblate.org/engage/localsend/  
[packaging-badge]: https://repology.org/badge/tiny-repos/localsend.svg  
[packaging-link]: https://repology.org/project/localsend/versions  

[মূল সাইট][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[homepage]: https://localsend.org  
[discord]: https://discord.gg/GSRWmQNP87  
[github]: https://github.com/localsend/localsend  
[codeberg]: https://codeberg.org/localsend/localsend  

LocalSend একটি ওপেন সোর্স অ্যাপ যা আপনাকে ইন্টারনেট ছাড়াই স্থানীয় নেটওয়ার্কের মাধ্যমে নিরাপদে ফাইল এবং বার্তা পাঠাতে ও গ্রহণ করতে দেয়।

## ডাউনলোড

| উইন্ডোজ                  | ম্যাকওএস                 | লিনাক্স                 | অ্যান্ড্রয়েড         | আইওএস       | ফায়ার ওএস |
|--------------------------|--------------------------|-----------------------|------------------|---------------|------------|
| [Winget]                 | [App Store]              | [Flathub]             | [Play Store]     | [App Store]   | [Amazon]   |
| [Scoop]                  | [Homebrew]               | [Nixpkgs]             | [F-Droid]        |               |            |
| [Chocolatey]             | [DMG Installer][latest]  | [Snap]                | [APK][latest]    |               |            |
| [EXE Installer][latest]  |                          | [AUR]                 |                  |               |            |
| [Portable ZIP][latest]   |                          | [TAR][latest]         |                  |               |            |
|                          |                          | [DEB][latest]         |                  |               |            |
|                          |                          | [AppImage][latest]    |                  |               |            |

[Winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend  
[Scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66  
[Chocolatey]: https://community.chocolatey.org/packages/localsend  
[App Store]: https://apps.apple.com/us/app/localsend/id1661733229  
[Play Store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app  
[F-Droid]: https://f-droid.org/packages/org.localsend.localsend_app  
[Amazon]: https://www.amazon.com/dp/B0BW6MP732  
[Homebrew]: https://formulae.brew.sh/cask/localsend  
[Flathub]: https://flathub.org/apps/details/org.localsend.localsend_app  
[Nixpkgs]: https://search.nixos.org/packages?show=localsend  
[Snap]: https://snapcraft.io/localsend  
[AUR]: https://aur.archlinux.org/packages/localsend-bin  
[latest]: https://github.com/localsend/localsend/releases/latest  
[TAR]: https://github.com/localsend/localsend/releases/latest/download/LocalSend-linux.tar.gz  
[DEB]: https://github.com/localsend/localsend/releases/latest/download/LocalSend.deb  
[AppImage]: https://github.com/localsend/localsend/releases/latest/download/LocalSend-x86_64.AppImage  
[Portable ZIP]: https://github.com/localsend/localsend/releases/latest/download/LocalSend-windows-x64.zip  
[EXE Installer]: https://github.com/localsend/localsend/releases/latest/download/LocalSend-setup.exe  
[DMG Installer]: https://github.com/localsend/localsend/releases/latest/download/LocalSend.dmg

## কিভাবে কাজ করে

LocalSend REST API ও HTTPS এনক্রিপশন ব্যবহার করে ডিভাইসগুলোর মধ্যে নিরাপদে ডেটা আদান-প্রদান করে। TLS সার্টিফিকেট প্রতিটি ডিভাইসে লোকালি তৈরি হয়, তাই কোনো তৃতীয় পক্ষের সার্ভারের প্রয়োজন হয় না।

## শুরু করুন

1. [Flutter](https://flutter.dev) ইনস্টল করুন বা [FVM](https://fvm.app) দিয়ে ব্যবস্থাপনা করুন  
2. [Rust](https://www.rust-lang.org/tools/install) ইন্সটল করুন  
3. এই রিপোজিটরি ক্লোন করুন  
4. `cd app` কমান্ডে অ্যাপ ডিরেক্টরিতে যান  
5. `flutter pub get` চালান  
6. `flutter run` দিয়ে অ্যাপ চালান  

## অবদান রাখুন

### অনুবাদ

- [Weblate](https://hosted.weblate.org/engage/localsend/) এ অনুবাদে সাহায্য করুন  
- অথবা `app/assets/i18n` ডিরেক্টরির ফাইলগুলো সম্পাদনা করুন

### বাগ ফিক্স ও ফিচার উন্নয়ন

- কোনো বাগ পেলে PR করুন  
- ফিচার আইডিয়ার জন্য Issue খুলে আলোচনা করুন

## সমস্যা সমাধান

| সমস্যা              | প্রেরক প্ল্যাটফর্ম | গ্রাহক প্ল্যাটফর্ম | সমাধান                                                                                      |
|---------------------|---------------------|---------------------|----------------------------------------------------------------------------------------------|
| ডিভাইস দেখা যাচ্ছে না | যেকোনো              | যেকোনো              | রাউটারে AP Isolation বন্ধ করুন                                                              |
| ডিভাইস দেখা যাচ্ছে না | যেকোনো              | Windows             | নেটওয়ার্ককে "Private" হিসেবে কনফিগার করুন                                                   |
| গতি কম               | যেকোনো              | Android             | পরিচিত সমস্যা: https://github.com/flutter-cavalry/saf_stream/issues/4                      |

## বিল্ড

### Android
```bash
flutter build apk
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
```bash
flutter build windows
flutter pub run msix:create
flutter pub run msix:create --store
```

### Linux
```bash
flutter build linux
appimage-builder --recipe AppImageBuilder.yml
```

Snap এর জন্য বিস্তারিত: https://github.com/localsend/snap/blob/main/README.md

## কৃতজ্ঞতা

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="অবদানকারীরা"/>
</a>