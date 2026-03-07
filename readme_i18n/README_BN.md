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

[হোমপেজ][homepage] • [ডিসকর্ড][discord] • [গিটহাব][github] • [কডবার্গ][codeberg]

[English (Default)](../README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Türkçe](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md) • [বাংলা](README_BN.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend হল একটি বিনামূল্যের, ওপেন-সোর্স অ্যাপ যা আপনাকে ইন্টারনেট সংযোগ ছাড়াই আপনার স্থানীয় নেটওয়ার্কে কাছাকাছি ডিভাইসের সাথে সুরক্ষিতভাবে ফাইল এবং বার্তা শেয়ার করতে দেয়।

- [সম্পর্কে](#সম্পর্কে)
- [স্পন্সর](#স্পন্সর)
- [স্ক্রিনশট](#স্ক্রিনশট)
- [ডাউনলোড](#ডাউনলোড)
- [এটি কীভাবে কাজ করে](#এটি-কীভাবে-কাজ-করে)
- [শুরু করা](#শুরু-করা)
- [অবদান রাখুন](#অবদান-রাখুন)
  - [অনুবাদ](#অনুবাদ)
  - [বাগ সংশোধন এবং উন্নতি](#বাগ-সংশোধন-এবং-উন্নতি)
- [সমস্যা সমাধান](#সমস্যা-সমাধান)
- [নির্মাণ](#নির্মাণ)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## সম্পর্কে

LocalSend হল একটি ক্রস-প্ল্যাটফর্ম অ্যাপ যা REST API এবং HTTPS এনক্রিপশন ব্যবহার করে ডিভাইসগুলির মধ্যে সুরক্ষিত যোগাযোগ সক্ষম করে। বাহ্যিক সার্ভারের উপর নির্ভর করে এমন অন্যান্য মেসেজিং অ্যাপের বিপরীতে, LocalSend এর কোনও ইন্টারনেট সংযোগ বা তৃতীয় পক্ষের সার্ভার প্রয়োজন নেই, এটি স্থানীয় যোগাযোগের জন্য দ্রুত এবং নির্ভরযোগ্য সমাধান করে তোলে।

## স্পন্সর

ব্রাউজার পরীক্ষার মাধ্যমে

<a href="https://www.lambdatest.com/" target="_blank">
    <img src="https://www.lambdatest.com/blue-logo.png" style="vertical-align: middle;" width="250" height="45" />
</a>

## স্ক্রিনশট

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone স্ক্রিনশট" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC স্ক্রিনশট" height="300"/>

## ডাউনলোড

[![প্যাকেজিং স্ট্যাটাস](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

অ্যাপ স্টোর বা প্যাকেজ ম্যানেজার থেকে ডাউনলোড করার পরামর্শ দেওয়া হয় কারণ অ্যাপটিতে স্বয়ংক্রিয় আপডেট নেই।

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG ইনস্টলার][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE ইনস্টলার][latest] |                         | [AUR][]            |                |               |            |
| [পোর্টেবল ZIP][latest] |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

[বিতরণ চ্যানেল][distribution channels] সম্পর্কে আরও পড়ুন।

> [!CAUTION]
> **অনানুষ্ঠানিক MSIX প্রিভিউ:** আপনি [localsend.ob-buff.dev](https://localsend.ob-buff.dev/) এ সর্বশেষ প্রতিশ্রুতি থেকে বিল্ড চেষ্টা করতে পারেন। স্থিতিশীলতা গ্যারান্টিযুক্ত নয় এবং সমস্ত কাস্টম কোড টুইক সেই সাইটে তালিকাভুক্ত করা হয়।

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

**সামঞ্জস্যতা**

| প্ল্যাটফর্ম | ন্যূনতম সংস্করণ | নোট                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | OpenCore Legacy Patcher 2.0.2 ব্যবহার করুন (দেখুন [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10              | Windows 7 সমর্থন করার জন্য শেষ সংস্করণ v1.15.4। ভবিষ্যতে Windows 7 এর জন্য নতুন সংস্করণের ব্যাকপোর্ট থাকতে পারে।   |
| Linux    | N.A.            | ডেপস: Gnome: `xdg-desktop-portal` এবং `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` এবং `xdg-desktop-portal-kde`      |

## সেটআপ

বেশিরভাগ ক্ষেত্রে, LocalSend সরাসরি কাজ করে। তবে, যদি আপনার ফাইল পাঠাতে বা গ্রহণ করতে সমস্যা হয় তবে আপনাকে আপনার ফায়ারওয়াল কনফিগার করতে হতে পারে যাতে LocalSend আপনার স্থানীয় নেটওয়ার্কে যোগাযোগ করতে পারে।

| ট্রাফিক টাইপ | প্রোটোকল | পোর্ট | অ্যাকশন |
|--------------|----------|-------|--------|
| আগত         | TCP, UDP | 53317 | অনুমতি |
| বহির্গামী   | TCP, UDP | যেকোনো | অনুমতি |

এছাড়াও আপনার রাউটারে AP বিচ্ছিন্নতা নিষ্ক্রিয় করতে হবে। এটি সাধারণত ডিফল্টভাবে নিষ্ক্রিয় থাকা উচিত তবে কিছু রাউটার এটি সক্ষম করতে পারে (বিশেষ করে অতিথি নেটওয়ার্কগুলিতে)।
আরও তথ্যের জন্য [সমস্যা সমাধান](#সমস্যা-সমাধান) দেখুন।

**পোর্টেবল মোড**

(v1.13.0 এ প্রবর্তিত)

এক্সিকিউটেবলের মতো একই ডিরেক্টরিতে `settings.json` নামে একটি ফাইল তৈরি করুন।
এই ফাইলটি খালি হতে পারে।
অ্যাপ ডিফল্ট অবস্থানের পরিবর্তে এই ফাইলটি সেটিংস সংরক্ষণ করতে ব্যবহার করবে।

**লুকানো শুরু করুন**

(v1.15.0 এ আপডেট করা হয়েছে)

অ্যাপটি লুকানো অবস্থায় শুরু করতে (শুধুমাত্র ট্রে-তে), `--hidden` ফ্ল্যাগ ব্যবহার করুন (উদাহরণ: `localsend_app.exe --hidden`)।

v1.14.0 এবং তার আগে, অ্যাপটি লুকানো শুরু হয় যদি `autostart` ফ্ল্যাগ সেট করা হয় এবং লুকানো সেটিং সক্ষম করা হয়।

## এটি কীভাবে কাজ করে

LocalSend একটি সুরক্ষিত যোগাযোগ প্রোটোকল ব্যবহার করে যা ডিভাইসগুলিকে REST API ব্যবহার করে একে অপরের সাথে যোগাযোগ করতে দেয়। সমস্ত ডেটা HTTPS এর উপর নিরাপদে পাঠানো হয় এবং TLS/SSL সার্টিফিকেট প্রতিটি ডিভাইসে তাৎক্ষণিকভাবে তৈরি হয়, সর্বোচ্চ নিরাপত্তা নিশ্চিত করে।

LocalSend প্রোটোকল সম্পর্কে আরও তথ্যের জন্য, [ডকুমেন্টেশন](https://github.com/localsend/protocol) দেখুন।

## শুরু করা

উৎস কোড থেকে LocalSend সংকলন করতে, এই পদক্ষেপগুলি অনুসরণ করুন:

1. Flutter [সরাসরি](https://flutter.dev) বা [fvm](https://fvm.app) ব্যবহার করে ইনস্টল করুন ([প্রয়োজনীয় সংস্করণ](.fvmrc) দেখুন)
2. [Rust](https://www.rust-lang.org/tools/install) ইনস্টল করুন
3. `LocalSend` রিপোজিটরি ক্লোন করুন
4. অ্যাপ ডিরেক্টরিতে প্রবেশ করতে `cd app` চালান
5. নির্ভরতা ডাউনলোড করতে `flutter pub get` চালান
6. অ্যাপ শুরু করতে `flutter run` চালান

> [!NOTE]
> LocalSend বর্তমানে একটি পুরানো Flutter সংস্করণের প্রয়োজন ([.fvmrc](.fvmrc) এ নির্দিষ্ট)
> এবং এইভাবে বিল্ড সমস্যাগুলি প্রয়োজনীয় এবং (সিস্টেম-ওয়াইড) ইনস্টল করা Flutter সংস্করণের মধ্যে মিসম্যাচের কারণে হতে পারে।
> উন্নয়ন আরও সামঞ্জস্যপূর্ণ করতে, LocalSend প্রকল্প Flutter সংস্করণ পরিচালনা করতে [fvm](https://fvm.app) ব্যবহার করে।
> `fvm` ইনস্টল করার পরে, `flutter` এর পরিবর্তে `fvm flutter` চালান।

## অবদান রাখুন

আমরা LocalSend উন্নত করতে আগ্রহী যে কাউকে স্বাগত জানাই। আপনি যদি অবদান রাখতে চান তবে যুক্ত হওয়ার কয়েকটি উপায় রয়েছে:

### অনুবাদ

আপনি LocalSend কে অন্যান্য ভাষায় অনুবাদ করতে সাহায্য করতে পারেন। আমরা অনুবাদ পরিচালনা করতে [Weblate](https://hosted.weblate.org/projects/localsend/app) প্ল্যাটফর্ম ব্যবহার করি।

বিকল্পভাবে, আপনি এই রিপোজিটরি ফর্ক করে এবং ম্যানুয়ালি অনুবাদ যোগ করেও অবদান রাখতে পারেন।

অনুবাদগুলি [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) ডিরেক্টরিতে অবস্থিত। `_missing_translations_<locale>.json` বা `strings_<locale>.i18n.json` ফাইল সম্পাদন করে অনুবাদ যোগ বা আপডেট করুন।

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="অনুবাদ অবস্থা" />
</a>

**_নোট করুন:_ `@` দিয়ে সজ্জিত ক্ষেত্রগুলি অনুবাদ করার উদ্দেশ্যে নয়; এগুলি অ্যাপে কোনও উপায়ে ব্যবহৃত হয় না, শুধুমাত্র অনুবাদকের জন্য তথ্যপূর্ণ পাঠ বা প্রসঙ্গ।**

### বাগ সংশোধন এবং উন্নতি

- **বাগ সংশোধন:** যদি আপনি একটি বাগ খুঁজে পান, অনুগ্রহ করে সমস্যার স্পষ্ট বর্ণনা এবং এটি কীভাবে সমাধান করতে হয় তার সাথে একটি পুল রিকোয়েস্ট তৈরি করুন।
- **উন্নতি:** LocalSend উন্নত করার কোনও ধারণা আছে? অনুগ্রহ করে প্রথমে একটি সমস্যা তৈরি করুন উন্নতির প্রয়োজন কেন তা নিয়ে আলোচনা করতে।

আরও তথ্যের জন্য, [অবদান গাইড](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md) দেখুন।

## সমস্যা সমাধান

| সমস্যা           | প্ল্যাটফর্ম (পাঠানো) | প্ল্যাটফর্ম (গ্রহণ) | সমাধান                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| ডিভাইস দৃশ্যমান নয় | যেকোনো            | যেকোনো              | নিশ্চিত করুন যে আপনার রাউটারে AP-বিচ্ছিন্নতা অক্ষম করা আছে। যদি এটি সক্ষম থাকে তবে ডিভাইসগুলির মধ্যে সংযোগ নিষিদ্ধ।                          |
| ডিভাইস দৃশ্যমান নয় | যেকোনো            | Windows             | নিশ্চিত করুন যে আপনার নেটওয়ার্ক "ব্যক্তিগত" নেটওয়ার্ক হিসাবে কনফিগার করা আছে। Windows নেটওয়ার্ক জনসাধারণ হিসাবে কনফিগার করা হলে আরও সীমাবদ্ধ হতে পারে। |
| ডিভাইস দৃশ্যমান নয় | macOS, iOS        | যেকোনো              | আপনি OS সেটিংসে "গোপনীয়তা" অধীনে "স্থানীয় নেটওয়ার্ক" অনুমতি টগল করার চেষ্টা করতে পারেন।                                                |
| গতি খুবই ধীর    | যেকোনো            | যেকোনো              | 5 Ghz ব্যবহার করুন; উভয় ডিভাইসে এনক্রিপশন অক্ষম করুন                                                                                           |
| গতি খুবই ধীর    | যেকোনো            | Android             | পরিচিত সমস্যা। https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

## নির্মাণ

এই কমান্ডগুলি শুধুমাত্র রক্ষণাবেক্ষণকারীদের জন্য উদ্দেশ্য করা হয়েছে। `app` ডিরেক্টরি থেকে চালানো নিশ্চিত করুন।

### Android

ঐতিহ্যবাহী APK

```bash
flutter build apk
```

Google Play এর জন্য AppBundle

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

**ঐতিহ্যবাহী**

```bash
flutter build windows
```

**স্থানীয় MSIX অ্যাপ**

```bash
flutter pub run msix:create
```

**স্টোর প্রস্তুত**

```bash
flutter pub run msix:create --store
```

### Linux

**ঐতিহ্যবাহী**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

[localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md) এ নির্দেশাবলী

## অবদানকারীরা

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend অবদানকারীরা"/>
</a>
