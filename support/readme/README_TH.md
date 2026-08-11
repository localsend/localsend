# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend เป็นแอปที่ช่วยให้การส่งไฟล์ระหว่างอุปกรณ์เป็นไปอย่างปลอดภัยโดยไม่จำเป็นต้องใช้อินเทอร์เน็ต

- [เกี่ยวกับ](#เกี่ยวกับ)
- [ภาพหน้าจอ](#ภาพหน้าจอ)
- [ดาวน์โหลด](#ดาวน์โหลด)
- [หลักการทำงาน](#หลักการทำงาน)
- [การเริ่มต้น](#การเริ่มต้น)
- [การมีส่วนร่วมพัฒนา](#การมีส่วนร่วมพัฒนา)
  - [การแปล](#การแปล)
  - [การแก้บัคและพัฒนา](#การแก้บัคและพัฒนา)
- [การสร้างและคอมไพล์แอป](#การสร้างและคอมไพล์แอป)
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
[homebrew]: https://formulae.brew.sh/cask/localsend
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
> LocalSend ยังคงต้องการ Flutter เวอร์ชันเก่าอยู่ (ดูที่ [.fvmrc](.fvmrc))
> จึงอาจเกิดปัญหาการคอมไพล์ ที่เกิดจากความไม่ตรงกันระหว่างเวอร์ชันที่ต้องการและเวอร์ชัน Flutter ที่ติดตั้งในระบบ
> เพื่อทำให้การพัฒนาเป็นไปอย่างสม่ำเสมอ LocalSend ใช้ [fvm](https://fvm.app) ในการจัดการเวอร์ชัน Flutter ของโปรเจกต์
> หลังจากติดตั้ง `fvm`, ให้ใช้คำสั่ง `fvm flutter` แทนการใช้ `flutter`.

## การมีส่วนร่วมพัฒนา

เรายินดีต้อนรับการมีส่วนร่วมจากทุกคนที่สนใจช่วยปรับปรุง LocalSend หากคุณต้องการมีส่วนร่วม มีหลายวิธีที่คุณสามารถทำได้:

### การแปล

คุณสามารถช่วยแปล LocalSend เป็นภาษาอื่นได้! **วิธีที่แนะนำ**: ใช้ platform [Weblate](https://hosted.weblate.org/projects/localsend/app) ในการจัดการการแปล

**วิธีอื่น**: คุณสามารถช่วยเหลือด้วยการ Fork repository นี้และเพิ่มการแปลด้วยตนเอง

การแปลอยู่ในไดเรกทอรี [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) แก้ไขไฟล์ `_missing_translations_<locale>.json` หรือ `strings_<locale>.i18n.json` เพื่อเพิ่มหรืออัปเดตการแปล

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="สถานะการแปล" />
</a>

**_หมายเหตุ:_ ไม่ต้องแปลช่องหรือบรรทัดที่ขึ้นต้นด้วยตัวอักษร `@` เพราะจะไม่ถูกแสดงในแอป ข้อความเหล่านั้นมีไว้เพื่อให้นักพัฒนาเข้าใจโค้ดเท่านั้น.**

### การแก้บัคและพัฒนา

- **การแก้บัค:** หากคุณพบข้อบกพร่อง กรุณาสร้าง pull request พร้อมคำอธิบายชัดเจนเกี่ยวกับปัญหาและวิธีการแก้ไข
- **การพัฒนา:** มีไอเดียในการปรับปรุง LocalSend ไหม? กรุณาสร้าง "issue" ก่อนเพื่อพูดคุยว่าทำไมการปรับปรุงนั้นจึงจำเป็น

สำหรับข้อมูลเพิ่มเติม ดูได้ที่ [contributing guide](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## รายชื่อผู้มีส่วนร่วมพัฒนา

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
