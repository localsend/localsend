# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Portugês Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend یک برنامه رایگان و متن‌باز است که به شما امکان می‌دهد تا فایل‌ها و پیام‌ها را با دستگاه‌های نزدیک از طریق شبکه محلی خود، بدون نیاز به اینترنت، به‌صورت امن به اشتراک بگذارید.

- [درباره](#about)
- [تصاویر](#screenshots)
- [دانلود](#download)
- [نحوه عملکرد](#how-it-works)
- [شروع به کار](#getting-started)
- [مشارکت](#contributing)
  - [ترجمه](#translation)
  - [رفع اشکالات و بهبودها](#bug-fixes-and-improvements)
- [ساخت](#building)
  - [اندروید](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [ویندوز](#windows)
  - [لینوکس](#linux)

## درباره

LocalSend یک برنامه چندسکویی است که امکان ارتباط امن بین دستگاه‌ها را با استفاده از REST API و رمزگذاری HTTPS فراهم می‌کند. برخلاف سایر برنامه‌های پیام‌رسان که به سرورهای خارجی وابسته هستند، لوکال‌سند نیازی به اتصال به اینترنت یا سرورهای شخص ثالث ندارد و به همین دلیل یک راه‌حل سریع و مطمئن برای ارتباطات محلی محسوب می‌شود. 

## تصاویر

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## دانلود

توصیه می‌شود که برنامه را از طریق فروشگاه‌های اپلیکیشن یا یک مدیریت بسته دانلود کنید، زیرا این برنامه به‌طور خودکار به‌روزرسانی نمی‌شود.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

مطالعه بیشتر [distribution channels][].

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

**سازگاری**

| Platform | Minimum Version | Note                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | از OpenCore Legacy Patcher نسخه ۲.۰.۲ استفاده کنید (نگاه کنید به #1005)                                                     |
| Windows  | 10              | آخرین نسخه‌ای که از ویندوز ۷ پشتیبانی می‌کند، نسخه 1.15.4 است. ممکن است نسخه‌های جدیدتری نیز در آینده برای ویندوز ۷ پشتیبانی شوند.   |
| Linux    | N.A.            | -                                                                                                                           |

## نصب

در بیشتر موارد، LocalSend باید به‌طور خودکار کار کند. با این حال، اگر در ارسال یا دریافت فایل‌ها مشکلی داشتید، ممکن است نیاز باشد تنظیمات فایروال خود را برای اجازه دسترسی LocalSend به شبکه محلی تغییر دهید.

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

همچنین، اطمینان حاصل کنید که AP Isolation در روتر شما غیرفعال باشد. این گزینه به‌طور پیش‌فرض غیرفعال است، اما ممکن است برخی روترها (مخصوصاً شبکه‌های مهمان) آن را فعال کرده باشند.

**حالت پرتابل**

(معرفی شده در نسخه 1.13.0)

یک فایل با نام `settings.json` در همان دایرکتوری که فایل اجرایی قرار دارد، ایجاد کنید.
این فایل می‌تواند خالی باشد.
برنامه از این فایل برای ذخیره تنظیمات به‌جای محل پیش‌فرض استفاده خواهد کرد.

**شروع به‌صورت مخفی**

(به‌روزرسانی شده در نسخه 1.15.0)

برای شروع برنامه به‌صورت مخفی (فقط در قسمت اعلان)، از فلگ `--hidden` استفاده کنید (مثال: `localsend_app.exe --hidden`).

در نسخه‌های 1.14.0 و قبل‌تر، برنامه به‌صورت مخفی شروع می‌شود اگر فلگ autostart تنظیم شده باشد و گزینه مخفی فعال باشد.

## نحوه عملکرد

لوکال‌سند از یک پروتکل ارتباطی امن استفاده می‌کند که به دستگاه‌ها اجازه می‌دهد با استفاده از REST API با یکدیگر ارتباط برقرار کنند. تمام داده‌ها به‌صورت امن از طریق HTTPS ارسال می‌شوند و گواهینامه TLS/SSL به‌طور خودکار روی هر دستگاه تولید می‌شود که حداکثر امنیت را فراهم می‌کند.

برای اطلاعات بیشتر درباره پروتکل LocalSend، به مستندات مراجعه کنید. [مستندات](https://github.com/localsend/protocol).

## شروع به کار

برای کامپایل کردن LocalSend از سورس کد، مراحل زیر را دنبال کنید:

1. فلاتر را به‌صورت [مستقیم](https://flutter.dev) یا با استفاده از [fvm](https://fvm.app) نصب کنید (به [نسخه مورد نیاز](.fvmrc) مراجعه کنید).
2. مخزن `LocalSend‍‍` را کلون کنید.
3. با دستور `cd app` وارد دایرکتوری برنامه شوید.
4. دستور `flutter pub get` را برای دانلود وابستگی‌ها اجرا کنید.
5. دستور `flutter run` را اجرا کنید تا برنامه شروع به کار کند.

> [!NOTE]
> LocalSend لوکال‌سند در حال حاضر به نسخه‌ای قدیمی‌تر از فلاتر نیاز دارد ([مشخص شده در](.fvmrc) fvmrc) و بنابراین ممکن است مشکلاتی
> در بیلد به دلیل عدم هماهنگی بین نسخه مورد نیاز و نسخه نصب‌شده (در سطح سیستم) فلاتر رخ دهد. برای یکپارچه‌سازی توسعه،
> LocalSend از [fvm](https://fvm.app) برای مدیریت نسخه فلاتر پروژه استفاده می‌کند. پس از نصب `fvm،` به جای `flutter` از `fvm flutter` استفاده کنید.

## مشارکت

ما از مشارکت هر کسی که مایل به بهبود LocalSend است استقبال می‌کنیم. اگر مایل به کمک هستید، راه‌های مختلفی برای مشارکت وجود دارد:

### ترجمه

می‌توانید به ترجمه این برنامه به زبان‌های دیگر کمک کنید!

1. این مخزن را فورک کنید.
2. یکی از موارد زیر را انتخاب کنید:
   - افزودن ترجمه‌های ناقص در زبان‌های موجود: فقط `_missing_translations_<locale>.json` را در [app/assets/i18n][i18n] به‌روزرسانی کنید.
   - اصلاح ترجمه‌های موجود: فایل `strings_<locale>.i18n.json` را در [app/assets/i18n][i18n] به‌روزرسانی کنید.
   - افزودن زبان‌های جدید: یک فایل جدید ایجاد کنید؛ به [کدهای محلی][] نیز مراجعه کنید.
3. اختیاری: برنامه را دوباره اجرا کنید
   1. با دستور `cd app` به دایرکتوری برنامه بروید.
   2. اطمینان حاصل کنید که یک‌بار برنامه را [اجرا](#شروع به کار) کرده‌اید.
   3. ترجمه‌ها را از طریق `flutter pub run slang` به‌روزرسانی کنید.
   4. برنامه را با `flutter run` اجرا کنید.
   5. یک درخواست pull باز کنید.

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**توجه: فیلدهایی که با `@` شروع شده‌اند، نباید ترجمه شوند؛ این فیلدها در برنامه استفاده نمی‌شوند و فقط به‌عنوان متن اطلاعاتی درباره فایل یا برای ارائه زمینه به مترجم هستند..**

### رفع اشکالات و بهبودها

- **رفع اشکالات:** اگر باگ یا اشکالی پیدا کردید، لطفاً یک درخواست pull همراه با توضیح واضحی از مشکل و نحوه رفع آن ایجاد کنید.
- **بهبودها:** ایده‌ای برای بهبود LocalSend دارید؟ لطفاً ابتدا یک issue ایجاد کنید تا درباره نیاز به این بهبود صحبت کنیم.

برای اطلاعات بیشتر، به [راهنمای مشارکت](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md) مراجعه کنید.

## ساخت

این دستورات فقط برای مدیران و نگهدارندگان پروژه هستند.

### اندروید

Traditional APK

```bash
flutter build apk
```

AppBundle برای Google Play

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

### ویندوز

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

### لینوکس

**Traditional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

آموزش در [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## مشارکت کنندگان

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
