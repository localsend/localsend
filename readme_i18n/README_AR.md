# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Türkçe](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md) • [العربية](README_AR.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend هو تطبيق مجاني ومفتوح المصدر يتيح لك مشاركة الملفات والرسائل بشكل آمن مع الأجهزة القريبة عبر شبكتك المحلية دون الحاجة إلى اتصال بالإنترنت.

- [حول](#about)
- [الرعاة](#sponsors)
- [لقطات الشاشة](#screenshots)
- [التنزيل](#download)
- [كيف يعمل](#how-it-works)
- [البدء](#getting-started)
- [المساهمة](#contributing)
  - [الترجمة](#translation)
  - [إصلاح الأخطاء والتحسينات](#bug-fixes-and-improvements)
- [استكشاف الأخطاء وإصلاحها](#troubleshooting)
- [البناء](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## حول

LocalSend هو تطبيق متعدد المنصات يتيح التواصل الآمن بين الأجهزة باستخدام REST API وتشفير HTTPS. على عكس تطبيقات المراسلة الأخرى التي تعتمد على خوادم خارجية، لا يتطلب LocalSend اتصالاً بالإنترنت أو خوادم طرف ثالث، مما يجعله حلاً سريعاً وموثوقاً للتواصل المحلي.

## الرعاة

اختبار المتصفح عبر

<a href="https://www.lambdatest.com/" target="_blank">
    <img src="https://www.lambdatest.com/blue-logo.png" style="vertical-align: middle;" width="250" height="45" />
</a>

## لقطات الشاشة

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## التنزيل

[![Packaging status](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

يُنصح بتنزيل التطبيق إما من متجر التطبيقات أو من مدير الحزم لأن التطبيق لا يحتوي على تحديث تلقائي.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

اقرأ المزيد حول [قنوات التوزيع][].

> [!CAUTION]
> **معاينة MSIX غير رسمية:** يمكنك تجربة البناءات من آخر الالتزامات في [localsend.ob-buff.dev](https://localsend.ob-buff.dev/). لا يتم ضمان الاستقرار وجميع تعديلات الكود المخصصة مدرجة على ذلك الموقع.

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

**التوافق**

| Platform | Minimum Version | Note                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | استخدم OpenCore Legacy Patcher 2.0.2 (انظر [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10              | آخر إصدار يدعم Windows 7 هو v1.15.4. قد تكون هناك إصدارات جديدة لاحقة لـ Windows 7 في المستقبل.   |
| Linux    | N.A.            | التبعيات: Gnome: `xdg-desktop-portal` و `xdg-desktop-portal-gtk`، KDE: `xdg-desktop-portal` و `xdg-desktop-portal-kde`      |

## الإعداد

في معظم الحالات، يجب أن يعمل LocalSend مباشرة. ومع ذلك، إذا كنت تواجه مشكلة في إرسال أو استقبال الملفات، قد تحتاج إلى تكوين جدار الحماية للسماح لـ LocalSend بالتواصل عبر شبكتك المحلية.

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

تأكد أيضاً من تعطيل عزل AP على جهاز التوجيه الخاص بك. يجب أن يكون معطلاً بشكل افتراضي ولكن قد يكون بعض أجهزة التوجيه قد فعلوه (خاصة الشبكات الضيفية).
راجع [استكشاف الأخطاء وإصلاحها](#troubleshooting) لمزيد من المعلومات.

**الوضع المحمول**

(تم تقديمه في v1.13.0)

قم بإنشاء ملف باسم `settings.json` موجود في نفس الدليل الذي يوجد فيه الملف القابل للتنفيذ.
يمكن أن يكون هذا الملف فارغاً.
سيستخدم التطبيق هذا الملف لتخزين الإعدادات بدلاً من الموقع الافتراضي.

**بدء مخفي**

(تم التحديث في v1.15.0)

لبدء التطبيق بشكل مخفي (فقط في علبة النظام)، استخدم العلم `--hidden` (مثال: `localsend_app.exe --hidden`).

في v1.14.0 والإصدارات السابقة، يبدأ التطبيق بشكل مخفي إذا تم تعيين علم `autostart` وتم تفعيل إعداد المخفي.

## كيف يعمل

يستخدم LocalSend بروتوكول اتصال آمن يسمح للأجهزة بالتواصل مع بعضها البعض باستخدام REST API. يتم إرسال جميع البيانات بشكل آمن عبر HTTPS، ويتم إنشاء شهادة TLS/SSL على الفور على كل جهاز، مما يضمن أقصى درجات الأمان.

لمزيد من المعلومات حول بروتوكول LocalSend، راجع [التوثيق](https://github.com/localsend/protocol).

## البدء

لتجميع LocalSend من الكود المصدري، اتبع هذه الخطوات:

1. قم بتثبيت Flutter [مباشرة](https://flutter.dev) أو باستخدام [fvm](https://fvm.app) (راجع [الإصدار المطلوب](.fvmrc))
2. قم بتثبيت [Rust](https://www.rust-lang.org/tools/install)
3. استنسخ مستودع `LocalSend`
4. قم بتشغيل `cd app` للدخول إلى دليل التطبيق
5. قم بتشغيل `flutter pub get` لتنزيل التبعيات
6. قم بتشغيل `flutter run` لبدء التطبيق

> [!NOTE]
> يتطلب LocalSend حالياً إصداراً أقدم من Flutter (محدد في [.fvmrc](.fvmrc))
> وبالتالي قد تكون مشاكل البناء ناتجة عن عدم التطابق بين الإصدار المطلوب والإصدار المثبت (على مستوى النظام) من Flutter.  
> لجعل التطوير أكثر اتساقاً، يستخدم LocalSend [fvm](https://fvm.app) لإدارة إصدار Flutter للمشروع.
> بعد تثبيت `fvm`، قم بتشغيل `fvm flutter` بدلاً من `flutter`.

## المساهمة

نرحب بمساهمات أي شخص مهتم بمساعدة تحسين LocalSend. إذا كنت ترغب في المساهمة، هناك عدة طرق للمشاركة:

### الترجمة

يمكنك المساعدة في ترجمة LocalSend إلى لغات أخرى. نستخدم منصة [Weblate](https://hosted.weblate.org/projects/localsend/app) لإدارة الترجمات.

بدلاً من ذلك، يمكنك أيضاً المساهمة من خلال عمل fork لهذا المستودع وإضافة الترجمات يدوياً.

توجد الترجمات في دليل [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). قم بتحرير ملف `_missing_translations_<locale>.json` أو `strings_<locale>.i18n.json` لإضافة أو تحديث الترجمات.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_لاحظ:_ الحقول المزينة بـ `@` لا يُقصد ترجمتها؛ لا تُستخدم في التطبيق بأي شكل من الأشكال، فهي مجرد نص إعلامي حول الملف أو لإعطاء سياق للمترجم.**

### إصلاح الأخطاء والتحسينات

- **إصلاح الأخطاء:** إذا وجدت خطأً، يرجى إنشاء طلب سحب مع وصف واضح للمشكلة وكيفية إصلاحها.
- **التحسينات:** لديك فكرة حول كيفية تحسين LocalSend؟ يرجى إنشاء مشكلة أولاً لمناقشة سبب الحاجة إلى التحسين.

لمزيد من المعلومات، راجع [دليل المساهمة](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## استكشاف الأخطاء وإصلاحها

| Issue              | Platform (Sending) | Platform (Receiving) | Solution                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| الجهاز غير مرئي | Any                | Any                  | تأكد من تعطيل AP-Isolation على جهاز التوجيه الخاص بك. إذا كان مفعلاً، يتم منع الاتصالات بين الأجهزة.                          |
| الجهاز غير مرئي | Any                | Windows              | تأكد من تكوين شبكتك كشبكة "خاصة". قد يكون Windows أكثر تقييداً عندما تكون الشبكة مكونة كشبكة عامة. | |
| الجهاز غير مرئي | macOS, iOS         | Any                  | يمكنك محاولة تبديل إذن "Local Network" تحت "Privacy" في إعدادات نظام التشغيل.                                                |
| السرعة بطيئة جداً     | Any                | Any                  | استخدم 5 Ghz؛ قم بتعطيل التشفير على كلا الجهازين                                                                                           |
| السرعة بطيئة جداً     | Any                | Android              | مشكلة معروفة. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

## البناء

هذه الأوامر مخصصة للمحافظين فقط. تأكد من تشغيلها من دليل `app`.

### Android

APK تقليدي

```bash
flutter build apk
```

AppBundle لـ Google Play

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

**تقليدي**

```bash
flutter build windows
```

**تطبيق MSIX محلي**

```bash
flutter pub run msix:create
```

**جاهز للمتجر**

```bash
flutter pub run msix:create --store
```

### Linux

**تقليدي**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

التعليمات في [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## المساهمون

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>

