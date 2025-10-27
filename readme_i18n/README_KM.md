# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[ទំព័រដើម][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend គឺជាកម្មវិធីឥតគិតថ្លៃ, បើកបង្ហាញប្រភពកូដ ដែលអនុញ្ញាតឱ្យអ្នកចែករំលែកឯកសារ និងសារដោយសុវត្ថិភាពជាមួយឧបករណ៍ដែលនៅជិតៗដែលស្ថិតនៅលើបណ្តាញមូលដ្ឋានតែមួយរបស់អ្នកដោយមិនចាំបាច់ភ្ជាប់អ៊ីនធឺណិត។

- [អំពី](#about)
- [រូបតាំងបង្ហាញ](#screenshots)
- [ទាញយក](#download)
- [របៀបដែលកម្មវិធីដំណើរការ](#how-it-works)
- [ចាប់ផ្តើម](#getting-started)
- [ការចូលរួមចំណែក](#contributing)
  - [បកប្រែ](#translation)
  - [ជួសជុល អភិវឌ្ឍន៍ និងកែលម្អលើកម្មវិធី](#bug-fixes-and-improvements)
- [ការបង្កើត](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## អំពី

LocalSend គឺជាកម្មវិធីដែលដំណើរការគ្រប់ប្រព័ន្ធប្រតិបត្តិការទាំងអស់ និងអនុញ្ញាតឲ្យមានការទំនាក់ទំនងប្រកបដោយសុវត្ថិភាពរវាងឧបករណ៍និងឧបករណ៍ដោយប្រើ REST API និងការធ្វើកូដនីយកម្ម HTTPS ។ មិនដូចកម្មវិធីផ្ញើសារផ្សេងទៀតដែលពឹងផ្អែកលើម៉ាស៊ីនមេខាងក្រៅទេ LocalSend មិនតម្រូវឱ្យមានការតភ្ជាប់អ៊ីនធឺណិត ឬម៉ាស៊ីនមេភាគីទីបីឡើយ ដែលធ្វើឱ្យវាក្លាយជាដំណោះស្រាយដែលលឿន និងអាចទុកចិត្តបានសម្រាប់ការទំនាក់ទំនងក្នុងតំបន់ local។

## រូបតាំងបង្ហាញ

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## ទាញយក

ការទាញយកកម្មវិធីពីក្នុងហាងកម្មវិធីផ្លូវការ ឬពីកម្មវិធីគ្រប់គ្រងកញ្ចប់ ត្រូវបានណែនាំ ពីព្រោះកម្មវិធីមិនមានការធ្វើបច្ចុប្បន្នភាពដោយស្វ័យប្រវត្តិទេ។

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
| ----------------------- | ----------------------- | ------------------ | -------------- | ------------- | ---------- |
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

ស្វែងយល់ និងអានបន្ថែមអំពី [distribution channels][].

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

**ភាពឆបគ្នា**

| Platform | កំណែអប្បបរមា | ចំណាំ                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | ប្រើ OpenCore Legacy Patcher 2.0.2 (សូមមើល [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10              | កំណែចុងក្រោយដែលគាំទ្រ Windows 7 គឺ v1.15.4។ ប្រហែលជាមានកំណែថ្មីជាងសម្រាប់ Windows 7 នៅពេលអនាគត។   |
| Linux    | N.A.            | ភាពអាស្រ័យ: Gnome: `xdg-desktop-portal` និង `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` និង `xdg-desktop-portal-kde` |

## របៀបរៀបចំតម្លើង

ក្នុងករណីភាគច្រើន LocalSend គួរតែដំណើរការដោយរលូន និងឥតមានបញ្ហា។ ទោះជាយ៉ាងណាក៏ដោយ ប្រសិនបើអ្នកមានបញ្ហាក្នុងការផ្ញើ ឬទទួលឯកសារ អ្នកប្រហែលជាត្រូវកំណត់រចនាសម្ព័ន្ធ Firewall របស់អ្នក ដើម្បីអនុញ្ញាតឱ្យ LocalSend អាចទំនាក់ទំនងនៅលើបណ្តាញមូលដ្ឋានរបស់អ្នក។

| ប្រភេទ Traffic | ប្រូតូកូល | ផត         | Action   |
| -------------- | --------- | ---------- | -------- |
| ចូល            | TCP, UDP  | 53317      | អនុញ្ញាត |
| ចេញ            | TCP, UDP  | មួយណាក៏បាន | អនុញ្ញាត |

ម្យ៉ាងទៀត ត្រូវប្រាកដថាបានបិទការផ្តាច់ AP នៅលើ router របស់អ្នក។ ជាធម្មតា វាគួរតែត្រូវបានបិទតាមលំនាំដើមដោយស្វ័យប្រវត្តិ ប៉ុន្តែ router ខ្លះប្រហែលអាចនឹងបើក (ជាពិសេស guest networks)។

**Portable Mode**

(ត្រូវបានបង្ហាញជាលើកដំបូងក្នុងជំនាន់ v1.13.0)

បង្កើតឯកសារមួយមានឈ្មោះថា `settings.json` ស្ថិតនៅក្នុងទីតាំង directory ដូចគ្នាជាមួយនឹង executable ។
ឯកសារនេះអាចនឹងទទេ។
កម្មវិធីនេះនឹងប្រើប្រាស់ឯកសារនេះដើម្បីរក្សាទុកការកំណត់ជំនួសឲ្យទីតាំងគោលដើម។

**ការចាប់ផ្តើមកម្មវិធីត្រូវបានលាក់**

(ត្រូវបានធ្វើបច្ចុប្បន្នភាពនៅក្នុងជំនាន់ v1.15.0)

ដើម្បីចាប់ផ្តើមកម្មវិធីដែលលាក់ (តែក្នុង tray ប៉ុណ្ណោះ) សូមប្រើ `--hidden` (ឧទាហរណ៍៖ `localsend_app.exe --hidden`)។

នៅក្នុងជំនាន់ v1.14.0 និងពីមុនៗ កម្មវិធីនឹងចាប់ផ្តើមលាក់ប្រសិនបើ `autostart` ត្រូវបានកំណត់ ហើយការកំណត់លាក់កម្មវិធីនឹងត្រូវបានបើក។

## របៀបដែលកម្មវិធីដំណើរការ

LocalSend ប្រើ Protocol ទំនាក់ទំនងសុវត្ថិភាពដែលអនុញ្ញាតឱ្យឧបករណ៍ទំនាក់ទំនងគ្នាទៅវិញទៅមកដោយប្រើ REST API ។ ទិន្នន័យទាំងអស់ត្រូវបានផ្ញើដោយសុវត្ថិភាពតាម HTTPS ហើយវិញ្ញាបនបត្រ TLS/SSL ត្រូវបានបង្កើតភ្លាមៗនៅលើឧបករណ៍នីមួយៗ ដោយធានាបាននូវសុវត្ថិភាពយ៉ាងអតិបរមា។

សម្រាប់ព័ត៌មានបន្ថែមអំពី LocalSend Protocol សូមមើល [documentation](https://github.com/localsend/protocol)។

## ចាប់ផ្តើម

ដើម្បី compile កម្មវិធី LocalSend ចេញពីកូដប្រភព សូមអនុវត្តតាមជំហានទាំងនេះ៖

1. តម្លើង Flutter [ដោយផ្ទាល់](https://flutter.dev) ឬដោយប្រើ [fvm](https://fvm.app) (សូមមើល [ជំនាន់ដែលអ្នកត្រូវការ].fvmrc))
2. Clone កូដពី 'LocalSend' repository
3. វាយពាក្យបញ្ជា `cd app` ដើម្បីបើកចូលបញ្ជីកម្មវិធី
4. វាយពាក្យបញ្ជា `flutter pub get` ដើម្បីទាញយក dependencies
5. វាយពាក្យបញ្ជា 'flutter run' ដើម្បីចាប់ផ្តើមដំណើរការកម្មវិធី

> [!ចំណាំ]
> LocalSend បច្ចុប្បន្នទាមទារកំណែ Flutter ចាស់ (បានបញ្ជាក់ក្នុង [.fvmrc].fvmrc))
> ហើយដូច្នេះបញ្ហាស្ថាបនាកម្មវិធីអាចបណ្តាលមកពីភាពមិនស៊ីសង្វាក់គ្នារវាងជំនាន់ Flutter ដែលទាមទារ និង ជំនាន់ដែលអ្នកបានតម្លើង (ប្រព័ន្ធទាំងមូល)។
> ដើម្បីធ្វើឱ្យការអភិវឌ្ឍន៍កាន់តែស៊ីសង្វាក់គ្នា LocalSend ប្រើ [fvm](https://fvm.app) ដើម្បីគ្រប់គ្រងជំនាន់ និងកំណែ Flutter។
> បន្ទាប់ពីតម្លើង `fvm` សូមវាយពាក្យបញ្ជា `fvm flutter` ជំនួសឱ្យ `flutter`។

## ការរួមចំណែក

យើងស្វាគមន៍ការរួមចំណែកពីអ្នកដែលចាប់អារម្មណ៍ក្នុងការជួយកែលម្អ LocalSend ។ ប្រសិនបើអ្នកចង់រួមចំណែក មានវិធីមួយចំនួនដើម្បីចូលរួម៖

### ការបកប្រែ

អ្នកអាចជួយបកប្រែ LocalSend ទៅជាភាសាផ្សេងទៀត! **វិធីដែលបានណែនាំ**: ប្រើប្ល័តហ្វោម [Weblate](https://hosted.weblate.org/projects/localsend/app) ដើម្បីគ្រប់គ្រងការបកប្រែ។

**ជម្រើសមួយទៀត**: អ្នកក៏អាចរួមចំណែកដោយ Fork មាន repository នេះ ហើយបន្ថែមការបកប្រែដោយដៃ។

ការបកប្រែស្ថិតនៅក្នុងថត [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n)។ កែសម្រួលឯកសារ `_missing_translations_<locale>.json` ឬ `strings_<locale>.i18n.json` ដើម្បីបន្ថែម ឬធ្វើបច្ចុប្បន្នភាពការបកប្រែ។

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="ស្ថានភាពបកប្រែ" />
</a>

**_ចំណាំ:_ កន្លែងដែលដាក់ភ្ជាប់ដោយ `@` នៅពីមុខ មិនត្រូវបកប្រែទេ។ ពួកវាមិនត្រូវបានប្រើនៅក្នុងកម្មវិធីតាមធ្យោបាយណាមួយឡើយ ដោយគ្រាន់តែជាអត្ថបទផ្តល់ព័ត៌មានអំពីឯកសារ ឬផ្តល់បរិបទដល់អ្នកបកប្រែ។**

### ជួសជុលបញ្ហា និងកែសម្រួល

- **ជួសជុលបញ្ហា:** ប្រសិនបើអ្នករកឃើញកំហុស សូមបង្កើតសំណើ pull request ដោយមានការពិពណ៌នាច្បាស់លាស់អំពីបញ្ហា និងរបៀបជួសជុលវា។
- **កែសម្រួល:** មានបំណងចង់កែលម្អ LocalSend ទេ? សូមបង្កើត issue លើ GitHub ជាមុនសិន ដើម្បីពិភាក្សាពីមូលហេតុដែលចាំបាច់ត្រូវកែលម្អ។

សម្រាប់ព័ត៌មានបន្ថែម, សូមមើល [ការណែនាំស្តីពីការរួមចំណែក](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## ការដោះស្រាយបញ្ហា

| បញ្ហា              | Platform (ផ្ញើ) | Platform (ទទួល) | ដំណោះស្រាយ                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| មិនឃើញឧបករណ៍ | ណាមួយក៏បាន                | ណាមួយក៏បាន                  | ត្រូវប្រាកដថាបានបិទ AP-Isolation នៅលើ router របស់អ្នក។ ប្រសិនបើវាបានបើក ការតភ្ជាប់រវាងឧបករណ៍ត្រូវបានហាមឃាត់។                          |
| មិនឃើញឧបករណ៍ | ណាមួយក៏បាន                | Windows              | ត្រូវប្រាកដថាបានកំណត់បណ្តាញរបស់អ្នកជាបណ្តាញ "ឯកជន"។ Windows អាចនឹងមានការរឹតបន្តឹងជាងនេះនៅពេលបណ្តាញត្រូវបានកំណត់ជាសាធារណៈ។ |
| មិនឃើញឧបករណ៍ | macOS, iOS         | ណាមួយក៏បាន                  | អ្នកអាចសាកល្បងប្តូរការអនុញ្ញាត "Local Network" នៅក្រោម "Privacy" នៅក្នុងការកំណត់ OS។                                                |
| ល្បឿនយឺតពេក     | ណាមួយក៏បាន                | ណាមួយក៏បាន                  | ប្រើ 5 Ghz; បិទការអ៊ិនគ្រីបនៅលើឧបករណ៍ទាំងពីរ                                                                                           |
| ល្បឿនយឺតពេក     | ណាមួយក៏បាន                | Android              | បញ្ហាដែលត្រូវបានដឹង។ https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |


## អ្នកចូលរួមចំណែក

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
