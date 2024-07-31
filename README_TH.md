# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend เป็นแอปที่ช่วยให้การส่งไฟล์ระหว่างอุปกรณ์เป็นไปอย่างปลอดภัยโดยไม่จำเป็นต้องใช้อินเทอร์เน็ต

- [เกี่ยวกับ](#about)
- [ภาพหน้าจอ](#screenshots)
- [ดาวน์โหลด](#download)
- [หลักการทำงาน](#how-it-works)
- [การเริ่มต้น](#getting-started)
- [Contributing](#contributing)
  - [การแปล](#translation)
  - [การพัฒนาและการแก้บัค](#bug-fixes-and-improvements)
- [Building](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## เกี่ยวกับ

LocalSend เป็นแอปข้ามแพลตฟอร์มที่ช่วยให้การสื่อสารระหว่างอุปกรณ์เป็นไปอย่างปลอดภัยโดยใช้ REST API และการเข้ารหัส HTTPS ต่างจากแอปส่งข้อความอื่นๆ ที่ต้องพึ่งพาเซิร์ฟเวอร์ภายนอก LocalSend ไม่ต้องการการเชื่อมต่ออินเทอร์เน็ตหรือเซิร์ฟเวอร์บุคคลที่สาม ทำให้เป็นโซลูชั่นการสื่อสารภายในท้องถิ่นที่รวดเร็วและเชื่อถือได้

## ภาพหน้าจอ

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## ดาวน์โหลด

ทางเราแนะนำให้ดาวน์โหลดแอปนี้จาก App Store หรือ Package Manager เพราะในตัวแอปไม่มีฟังชั่นอัปเดตอัตโนมัติ

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

อ่านเพิ่มเติมเกี่ยวกับ [distribution channels][].

[windows store]: https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR
[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[play store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[amazon]: https://www.amazon.com/dp/B0BW6MP732
[winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66
[chocolatey]: https://community.chocolatey.org/packages/localsend
[homebrew]: https://github.com/localsend/homebrew-localsend
[flathub]: https://flathub.org/apps/details/org.localsend.localsend_app
[nixpkgs]: https://search.nixos.org/packages?show=localsend
[snap]: https://snapcraft.io/localsend
[aur]: https://aur.archlinux.org/packages/localsend-bin
[latest]: https://github.com/localsend/localsend/releases/latest
[distribution channels]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

## การตั่งค่า

ในกรณีส่วนใหญ่ LocalSend ควรทำงานได้ทันที อย่างไรก็ตาม หากคุณประสบปัญหาในการส่งหรือรับไฟล์ คุณอาจต้องกำหนดค่าไฟร์วอลล์ของคุณเพื่อให้ LocalSend สามารถสื่อสารผ่านเครือข่ายแลนได้

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

แนะนำให้ตรวจสอบให้แน่ใจว่าคุณได้ปิด AP isolation บนเราเตอร์ของคุณแล้ว โดยปกติการตั้งค่าดังกล่าวจะถูกปิดเป็นค่าเริ่มต้นอยู่แล้ว แต่บางเราเตอร์บางตัวอาจเปิดใช้งานไว้

**โหมดเคลื่อนที่**

(เพิ่มเข้ามาในเวอร์ชัน v1.13.0)

สร้างไฟล์ชื่อ `settings.json` ไว้ในโฟล์เดอร์เดียวกับตัวแอป (.exe) 
ไฟล์นี้สามารถเป็นไฟล์ว่างเปล่าได้
ตัวแอปจะทำการเก็บข้อมูลการตั้งค่าไว้ในนี้แทนที่จะไปเก็บยังที่เริ่มต้น

**เริ่มแอปเป็นไอคอนถาดกราฟิก**

(อัปเดตในเวอร์ชัน v1.15.0)

เพื่อเริ่มแอปเป็นไอคอนถาดกราฟิก (เฉพาะไอคอนถาดกราฟิกอย่างเดียว) ใช้คำสั่ง --hidden (ตัวอย่าง: localsend_app.exe --hidden)

ในเวอร์ชัน v1.14.0 หรือก่อนหน้า ตัวแอปจะเริ่มเป็นไอคอนถาดกราฟิกถ้าใส่ flag `autostart` และเปิดโหมดซ่อน

## หลักการทำงาน

LocalSend ใช้โปรโตคอลการสื่อสารที่ปลอดภัยที่ช่วยให้อุปกรณ์สามารถสื่อสารกันโดยใช้ REST API ข้อมูลทั้งหมดจะถูกส่งอย่างปลอดภัยผ่าน HTTPS และใบรับรอง TLS/SSL จะถูกสร้างขึ้นในทันทีบนแต่ละอุปกรณ์เพื่อให้แน่ใจว่ามีความปลอดภัยสูงสุด

สำหรับข้อมูลเพิ่มเติมเกี่ยวกับโปรโตคอล LocalSend ดูที่ [documentation](https://github.com/localsend/protocol).

## การเริ่มต้น

ในการคอมไพล์ LocalSend จากซอร์สโค้ด ให้ทำตามขั้นตอนเหล่านี้:

1. ติดตั้ง Flutter [โดยตรง](https://flutter.dev) หรือใช้ [fvm](https://fvm.app) (ดู [เวอร์ชันที่ต้องการ](.fvmrc))
2. โคลน repository ของ `LocalSend` 
3. รัน `cd app` เพื่อเข้าไปยังโฟล์เดอร์ของแอป
4. รัน `flutter pub get` เพื่อดาวโหลด dependencies
5. รัน `flutter run` เพื่อเริ่มแอป

> [!หมายเหตุ]
> LocalSend currently requires an older Flutter version (specified in [.fvmrc](.fvmrc))
> and thus build issues may be caused by a mismatch between the required and the (system-wide) installed Flutter version.  
> To make development more consistent, LocalSend uses [fvm](https://fvm.app) to manage the project Flutter version.
> After installing `fvm`, run `fvm flutter` instead of `flutter`.

## Contributing

We welcome contributions from anyone interested in helping improve LocalSend. If you'd like to contribute, there are a few ways to get involved:

### Translation

You can help translate this app to other languages!

1. Fork this repository
2. Choose one
   - Add missing translations in existing languages: Only update `_missing_translations_<locale>.json` in [app/assets/i18n][i18n]
   - Fix existing translations: Update `strings_<locale>.i18n.json` in [app/assets/i18n][i18n]
   - Add new languages: Create a new file; see also: [locale codes][].
3. Optional: Re-run this app
   1. Run `cd app` to enter the app directory.
   2. Make sure you have [run](#getting-started) this app once.
   3. Update translations via `flutter pub run slang`
   4. Run the app via `flutter run`
   5. Open a pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**_Take note:_ Fields decorated with `@` are not meant to be translated; they are not used in the app in any way, being merely informative text about the file or to give context to the translator.**

### Bug Fixes and Improvements

- **Bug Fixes:** If you find a bug, please create a pull request with a clear description of the issue and how to fix it.
- **Improvements:** Have an idea for how to improve LocalSend? Please create an issue first to discuss why the improvement is needed.

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

Feel free to open a pull request. There is a `snap` branch to play with.

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
