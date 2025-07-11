<div dir="rtl" align="right">

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

[الصفحة الرئيسية][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[Arabic](readme_i18n/README_AR.md) • [English (Default)](/README.md) • [Español](readme_i18n/README_ES.md) • [فارسی](readme_i18n/README_FA.md) • [Filipino](readme_i18n/README_PH.md) • [Français](readme_i18n/README_FR.md) • [Indonesia](readme_i18n/README_ID.md) • [Italiano](readme_i18n/README_IT.md) • [日本語](readme_i18n/README_JA.md) • [ភាសាខ្មែរ](readme_i18n/README_KM.md) • [한국어](readme_i18n/README_KO.md) • [Polski](readme_i18n/README_PL.md) • [Portugês Brasil](readme_i18n/README_PT_BR.md) • [Русский](readme_i18n/README_RU.md) • [ภาษาไทย](readme_i18n/README_TH.md) • [Türkçe](readme_i18n/README_TR.md) • [Українська](readme_i18n/README_UK.md) • [Tiếng Việt](readme_i18n/README_VI.md) • [中文](readme_i18n/README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

<p dir="rtl" align="right">
LocalSend هو تطبيق مجاني ومفتوح المصدر يتيح لك مشاركة الملفات والرسائل بشكل آمن مع الأجهزة القريبة عبر الشبكة المحلية دون الحاجة إلى اتصال بالإنترنت.
</p>

<ul>
  <li><a href="#عن-التطبيق">عن التطبيق</a></li>
  <li><a href="#لقطات-الشاشة">لقطات الشاشة</a></li>
  <li><a href="#التنزيل">التنزيل</a></li>
  <li><a href="#كيف-يعمل">كيف يعمل</a></li>
  <li><a href="#البدء">البدء</a></li>
  <li>
    <a href="#المساهمة">المساهمة</a>
    <ul>
      <li><a href="#الترجمة">الترجمة</a></li>
      <li><a href="#إصلاح-الأخطاء-والتحسينات">إصلاح الأخطاء والتحسينات</a></li>
    </ul>
  </li>
  <li><a href="#استكشاف-الأخطاء-وإصلاحها">استكشاف الأخطاء وإصلاحها</a></li>
  <li>
    <a href="#بناء-المشروع">بناء المشروع</a>
    <ul dir="rtl">
      <li><a href="#android">Android</a></li>
      <li><a href="#ios">iOS</a></li>
      <li><a href="#macos">macOS</a></li>
      <li><a href="#windows">Windows</a></li>
      <li><a href="#linux">Linux</a></li>
    </ul>
  </li>
</ul>

## عن التطبيق

<p dir="rtl" align="right">
LocalSend هو تطبيق متعدد المنصات يتيح التواصل الآمن بين الأجهزة باستخدام واجهات برمجة تطبيقات REST وتشفير HTTPS. على عكس تطبيقات المراسلة الأخرى التي تعتمد على خوادم خارجية، لا يتطلب LocalSend اتصالاً بالإنترنت أو خوادم طرف ثالث، مما يجعله حلاً سريعاً وموثوقاً للتواصل المحلي.
</p>

## لقطات الشاشة

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="لقطة شاشة iPhone" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="لقطة شاشة PC" height="300"/>

## التنزيل

[![Packaging status](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

يُنصح بتنزيل التطبيق إما من متجر التطبيقات أو من مدير الحزم لأن التطبيق لا يدعم تحديث تلقائي.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

اقرأ المزيد عن [منصات التحميل][distribution channels].

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

| المنصة  | الحد الأدنى للإصدار | ملاحظات                                                                                                                         |
|---------|---------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Android | 5.0                 | -                                                                                                                               |
| iOS     | 12.0                | -                                                                                                                               |
| macOS   | 11 Big Sur          | استخدم OpenCore Legacy Patcher 2.0.2 (راجع [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows | 10                  | آخر إصدار يدعم Windows 7 هو v1.15.4. قد تتوفر نسخ أحدث في المستقبل.                                                             |
| Linux   | غير محدد            | -                                                                                                                               |


## الإعداد

في معظم الحالات، يجب أن يعمل LocalSend مباشرة دون إعدادات إضافية. إذا واجهت مشاكل في إرسال أو استقبال الملفات، قد تحتاج إلى ضبط جدار الحماية للسماح للتطبيق بالتواصل عبر الشبكة المحلية.

| Traffic Type (نوع الحركة) | Protocol (البروتوكول) | Port (المنفذ) | Action (الإجراء) |
|---------------------------|-----------------------|---------------|------------------|
| Incoming                  | TCP, UDP              | 53317         | Allow            |
| Outgoing                  | TCP, UDP              | Any           | Allow            |

تأكد أيضًا من تعطيل خاصية "عزل نقاط الوصول" (AP isolation) في جهاز التوجيه الخاص بك. عادةً ما تكون معطلة بشكل افتراضي، لكن بعض أجهزة التوجيه (خاصة شبكات الضيوف) قد تفعل هذه الخاصية. راجع [استكشاف الأخطاء وإصلاحها](#troubleshooting)  لمزيد من المعلومات.

**الوضع المحمول (Portable Mode)**

(تمت إضافته في الإصدار 1.13.0)

أنشئ ملفًا باسم `settings.json` في نفس مجلد التطبيق التنفيذي.
يمكن أن يكون الملف فارغًا.
سيستخدم التطبيق هذا الملف لتخزين الإعدادات بدلًا من الموقع الافتراضي.

**التشغيل المخفي**

(تم تحديثه في الإصدار 1.15.0)

لبدء التطبيق بشكل مخفي (في شريط النظام فقط)، استخدم الخيار `--hidden` (مثال: `localsend_app.exe --hidden`).

في الإصدار 1.14.0 وما قبله، يبدأ التطبيق مخفيًا إذا تم تفعيل خيار `autostart`، وتم تفعيل الإعداد المخفي.

## كيف يعمل

يستخدم LocalSend بروتوكول اتصال آمن يسمح للأجهزة بالتواصل مع بعضها البعض باستخدام واجهة برمجة تطبيقات REST. جميع البيانات تُرسل بشكل آمن عبر HTTPS، ويتم إنشاء شهادة TLS/SSL تلقائيًا على كل جهاز، مما يضمن أقصى درجات الأمان.

لمزيد من المعلومات حول بروتوكول LocalSend، راجع [التوثيق](https://github.com/localsend/protocol).

## البدء

لتجميع (compile) LocalSend من الكود المصدري، اتبع الخطوات التالية:

1. قم بتثبيت Flutter [مباشرة](https://flutter.dev) أو باستخدام [fvm](https://fvm.app) (راجع [الإصدار المطلوب](/.fvmrc))
2. قم بتثبيت [Rust](https://www.rust-lang.org/tools/install)
3. استنسخ (clone) مشروع `LocalSend`
4. قم بتشغيل `cd app` للدخول إلى مجلد التطبيق
5. قم بتشغيل `flutter pub get` لتنزيل التبعيات
6. قم بتشغيل `flutter run` لبدء التطبيق

</div>

> [!NOTE]
> يتطلب LocalSend حاليًا إصدارًا قديم من Flutter (تم تحديد الاصدار في [.fvmrc](/.fvmrc))
> قد تحدث مشاكل أثناء بناء المشروع بسبب عدم التطابق بين الإصدار المطلوب والإصدار المثبت (على مستوى النظام).  
> لجعل بيئة التطوير موحده، يستخدم LocalSend [fvm](https://fvm.app) لإدارة إصدار Flutter الخاص بالمشروع.
> بعد تثبيت `fvm`، قم بتشغيل `fvm flutter` بدلاً من `flutter`.

<div dir="rtl" align="right">

## المساهمة

نرحب بالمساهمات من أي شخص مهتم بتحسين LocalSend. إذا كنت ترغب في المساهمة، هناك عدة طرق للمشاركة:

### الترجمة

يمكنك المساعدة في ترجمة LocalSend إلى لغات أخرى. نستخدم منصة [Weblate](https://hosted.weblate.org/projects/localsend/app) لإدارة الترجمات.

بدلاً من ذلك، يمكنك أيضاً المساهمة عن طريق نسخ (fork) هذا المشروع وإضافة الترجمات يدوياً.

توجد الترجمات في مجلد [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). قم بتحرير ملف `_missing_translations_<locale>.json` أو `strings_<locale>.i18n.json` لإضافة أو تحديث الترجمات.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="حالة الترجمة" />
</a>

**_ملاحظة:_ الحقول التي تحتوي على الرمز `@` ليست مخصصة للترجمة؛ فهي نصوص توضيحية فقط ولا تُستخدم في التطبيق، بل تهدف لإعطاء سياق للمترجم.**

### إصلاح الأخطاء والتحسينات

- **إصلاح الأخطاء:** إذا وجدت خطأً، يرجى إنشاء pull request مع وصف واضح للمشكلة وكيفية إصلاحها.
- **التحسينات:** لديك فكرة لتحسين LocalSend؟ يرجى إنشاء issue أولاً لمناقشة سبب الحاجة إلى التحسين.

لمزيد من المعلومات، راجع [دليل المساهمة](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## استكشاف الأخطاء وإصلاحها

| المشكلة           | المنصة (مرسل) | المنصة (مستقبل) | الحل                                                                                                        |
|-------------------|---------------|-----------------|-------------------------------------------------------------------------------------------------------------|
| الجهاز غير ظاهر   | أي            | أي              | تأكد من تعطيل عزل نقاط الوصول (AP isolation) في جهاز التوجيه. إذا كان مفعلاً، سيتم منع الاتصال بين الأجهزة. |
| الجهاز غير ظاهر   | أي            | Windows         | تأكد من ضبط الشبكة كـ"خاصة". قد يكون Windows أكثر تقييدًا إذا كانت الشبكة عامة.                             |
| الجهاز غير ظاهر   | macOS, iOS    | أي              | يمكنك محاولة تفعيل/تعطيل إذن "الشبكة المحلية" ضمن إعدادات الخصوصية في النظام.                               |
| السرعة بطيئة جداً | أي            | أي              | استخدم 5 جيجاهرتز؛ قم بتعطيل التشفير على كلا الجهازين.                                                      |
| السرعة بطيئة جداً | أي            | Android         | مشكلة معروفة. https://github.com/flutter-cavalry/saf_stream/issues/4                                        |

## بناء المشروع

هذه الأوامر مخصصة فقط للمطورين.

### Android

APK تقليدي

```bash
flutter build apk
```

AppBundle لمتجر Google Play

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
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend مساهمو"/>
</a>
</div>