///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFa extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFa({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.fa,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <fa>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsFa _root = this; // ignore: unused_field

  @override
  TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'لوکال‌سند';
  @override
  late final _Translations$general$fa general = _Translations$general$fa._(_root);
  @override
  late final _Translations$receiveTab$fa receiveTab = _Translations$receiveTab$fa._(_root);
  @override
  late final _Translations$sendTab$fa sendTab = _Translations$sendTab$fa._(_root);
  @override
  late final _Translations$settingsTab$fa settingsTab = _Translations$settingsTab$fa._(_root);
  @override
  late final _Translations$troubleshootPage$fa troubleshootPage = _Translations$troubleshootPage$fa._(_root);
  @override
  late final _Translations$networkInterfacesPage$fa networkInterfacesPage = _Translations$networkInterfacesPage$fa._(_root);
  @override
  late final _Translations$receiveHistoryPage$fa receiveHistoryPage = _Translations$receiveHistoryPage$fa._(_root);
  @override
  late final _Translations$apkPickerPage$fa apkPickerPage = _Translations$apkPickerPage$fa._(_root);
  @override
  late final _Translations$selectedFilesPage$fa selectedFilesPage = _Translations$selectedFilesPage$fa._(_root);
  @override
  late final _Translations$deviceDetailsPage$fa deviceDetailsPage = _Translations$deviceDetailsPage$fa._(_root);
  @override
  late final _Translations$verifyPage$fa verifyPage = _Translations$verifyPage$fa._(_root);
  @override
  late final _Translations$receivePage$fa receivePage = _Translations$receivePage$fa._(_root);
  @override
  late final _Translations$receiveOptionsPage$fa receiveOptionsPage = _Translations$receiveOptionsPage$fa._(_root);
  @override
  late final _Translations$sendPage$fa sendPage = _Translations$sendPage$fa._(_root);
  @override
  late final _Translations$progressPage$fa progressPage = _Translations$progressPage$fa._(_root);
  @override
  late final _Translations$webSharePage$fa webSharePage = _Translations$webSharePage$fa._(_root);
  @override
  late final _Translations$webReceivePage$fa webReceivePage = _Translations$webReceivePage$fa._(_root);
  @override
  late final _Translations$aboutPage$fa aboutPage = _Translations$aboutPage$fa._(_root);
  @override
  late final _Translations$donationPage$fa donationPage = _Translations$donationPage$fa._(_root);
  @override
  late final _Translations$changelogPage$fa changelogPage = _Translations$changelogPage$fa._(_root);
  @override
  late final _Translations$whatsNewPage$fa whatsNewPage = _Translations$whatsNewPage$fa._(_root);
  @override
  late final _Translations$aliasGenerator$fa aliasGenerator = _Translations$aliasGenerator$fa._(_root);
  @override
  late final _Translations$dialogs$fa dialogs = _Translations$dialogs$fa._(_root);
  @override
  late final _Translations$sanitization$fa sanitization = _Translations$sanitization$fa._(_root);
  @override
  late final _Translations$tray$fa tray = _Translations$tray$fa._(_root);
  @override
  late final _Translations$web$fa web = _Translations$web$fa._(_root);
  @override
  late final _Translations$assetPicker$fa assetPicker = _Translations$assetPicker$fa._(_root);
}

// Path: general
class _Translations$general$fa extends Translations$general$en {
  _Translations$general$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'پذیرفتن';
  @override
  String get accepted => 'پذیرفته شد';
  @override
  String get add => 'افزودن';
  @override
  String get advanced => 'پیشرفته';
  @override
  String get cancel => 'لغو';
  @override
  String get close => 'بستن';
  @override
  String get confirm => 'تأیید';
  @override
  String get continueStr => 'ادامه';
  @override
  String get copy => 'کپی';
  @override
  String get copiedToClipboard => 'کپی شد';
  @override
  String get decline => 'رد کردن';
  @override
  String get done => 'انجام شد';
  @override
  String get delete => 'حذف';
  @override
  String get edit => 'ویرایش';
  @override
  String get error => 'خطا';
  @override
  String get example => 'نمونه';
  @override
  String get files => 'فایل‌ها';
  @override
  String get finished => 'تکمیل شد';
  @override
  String get hide => 'مخفی کردن';
  @override
  String get off => 'خاموش';
  @override
  String get offline => 'آفلاین';
  @override
  String get on => 'روشن';
  @override
  String get online => 'آنلاین';
  @override
  String get open => 'باز کردن';
  @override
  String get queue => 'صف';
  @override
  String get quickSave => 'ذخیره سریع';
  @override
  String get quickSaveFromFavorites => 'ذخیره سریع برای "موردعلاقه‌ها"';
  @override
  String get renamed => 'تغییر نام یافت';
  @override
  String get reset => 'بازنشانی تغییرات';
  @override
  String get restart => 'راه‌اندازی مجدد';
  @override
  String get settings => 'تنظیمات';
  @override
  String get skipped => 'رد شد';
  @override
  String get start => 'شروع';
  @override
  String get stop => 'توقف';
  @override
  String get save => 'ذخیره';
  @override
  String get unchanged => 'بدون تغییر';
  @override
  String get unknown => 'ناشناخته';
  @override
  String get noItemInClipboard => 'موردی در کلیپ‌بورد نیست.';
}

// Path: receiveTab
class _Translations$receiveTab$fa extends Translations$receiveTab$en {
  _Translations$receiveTab$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دریافت';
  @override
  late final _Translations$receiveTab$infoBox$fa infoBox = _Translations$receiveTab$infoBox$fa._(_root);
  @override
  late final _Translations$receiveTab$quickSave$fa quickSave = _Translations$receiveTab$quickSave$fa._(_root);
  @override
  String get link => 'دریافت از طریق لینک';
}

// Path: sendTab
class _Translations$sendTab$fa extends Translations$sendTab$en {
  _Translations$sendTab$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ارسال';
  @override
  late final _Translations$sendTab$selection$fa selection = _Translations$sendTab$selection$fa._(_root);
  @override
  late final _Translations$sendTab$picker$fa picker = _Translations$sendTab$picker$fa._(_root);
  @override
  String get shareIntentInfo => 'همچنین می‌توانید از قابلیت «اشتراک‌گذاری» دستگاه خود برای انتخاب آسان‌تر فایل‌ها استفاده کنید.';
  @override
  String get nearbyDevices => 'دستگاه‌های اطراف';
  @override
  String get thisDevice => 'این دستگاه';
  @override
  String get scan => 'جستجوی دستگاه‌ها';
  @override
  String get manualSending => 'ارسال دستی';
  @override
  String get sendMode => 'حالت ارسال';
  @override
  late final _Translations$sendTab$sendModes$fa sendModes = _Translations$sendTab$sendModes$fa._(_root);
  @override
  String get sendModeHelp => 'توضیحات';
  @override
  String get help => 'لطفاً مطمئن شوید که دستگاه مورد نظر به شبکه وای‌فای یکسانی متصل باشد.';
  @override
  String get placeItems => 'موارد را برای اشتراک‌گذاری در اینجا قرار دهید.';
}

// Path: settingsTab
class _Translations$settingsTab$fa extends Translations$settingsTab$en {
  _Translations$settingsTab$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تنظیمات';
  @override
  late final _Translations$settingsTab$general$fa general = _Translations$settingsTab$general$fa._(_root);
  @override
  late final _Translations$settingsTab$receive$fa receive = _Translations$settingsTab$receive$fa._(_root);
  @override
  late final _Translations$settingsTab$send$fa send = _Translations$settingsTab$send$fa._(_root);
  @override
  late final _Translations$settingsTab$network$fa network = _Translations$settingsTab$network$fa._(_root);
  @override
  late final _Translations$settingsTab$other$fa other = _Translations$settingsTab$other$fa._(_root);
  @override
  String get advancedSettings => 'تنظیمات پیشرفته';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$fa extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عیب‌یابی';
  @override
  String get subTitle => 'برنامه مطابق انتظار کار نمی‌کند؟ در اینجا می‌توانید راه‌حل‌های رایج را بیابید.';
  @override
  String get solution => 'راه‌حل:';
  @override
  String get fixButton => 'تعمیر خودکار';
  @override
  late final _Translations$troubleshootPage$firewall$fa firewall = _Translations$troubleshootPage$firewall$fa._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$fa noDiscovery = _Translations$troubleshootPage$noDiscovery$fa._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$fa noConnection = _Translations$troubleshootPage$noConnection$fa._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$fa extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'رابط‌های شبکه';
  @override
  String get info =>
      'به طور پیش‌فرض، لوکال‌سند از تمام رابط‌های شبکه موجود استفاده می‌کند. در اینجا می‌توانید شبکه‌های ناخواسته را استثنا کنید. برای اعمال تغییرات باید سرور را راه‌اندازی مجدد کنید.';
  @override
  String get preview => 'پیش‌نمایش';
  @override
  String get whitelist => 'لیست سفید';
  @override
  String get blacklist => 'لیست سیاه';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$fa extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تاریخچه';
  @override
  String get openFolder => 'باز کردن پوشه';
  @override
  String get deleteHistory => 'حذف تاریخچه';
  @override
  String get empty => 'تاریخچه خالی است.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$fa entryActions = _Translations$receiveHistoryPage$entryActions$fa._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$fa extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'برنامه (APK)';
  @override
  String get excludeSystemApps => 'شامل نشدن برنامه‌های سیستمی';
  @override
  String get excludeAppsWithoutLaunchIntent => 'شامل نشدن برنامه‌های غیر اجرایی';
  @override
  String apps({required Object n}) => '${n} برنامه';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$fa extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'حذف همه';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$fa extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'جزئیات دستگاه';
  @override
  String get favorite => 'علاقه‌مندی';
  @override
  String get verify => 'تأیید هویت';
  @override
  late final _Translations$deviceDetailsPage$info$fa info = _Translations$deviceDetailsPage$info$fa._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$fa logs = _Translations$deviceDetailsPage$logs$fa._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$fa extends Translations$verifyPage$en {
  _Translations$verifyPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تأیید هویت';
  @override
  String get icons => 'آیکون‌ها';
  @override
  String get raw => 'خام';
  @override
  String get question => 'آیا در دستگاه دیگر هم همین‌طور به نظر می‌رسد؟';
}

// Path: receivePage
class _Translations$receivePage$fa extends Translations$receivePage$en {
  _Translations$receivePage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    n,
    one: 'می‌خواهدیک فایل برای شما ارسال کند',
    other: 'می‌خواهد ${n} فایل برای شما ارسال کند',
  );
  @override
  String get subTitleMessage => 'یک پیام برای شما فرستاد:';
  @override
  String get subTitleLink => 'یک لینک برای شما فرستاد';
  @override
  String get canceled => 'فرستنده درخواست را لغو کرد.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$fa extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'گزینه‌ها';
  @override
  String get destination => 'مسیر دریافت';
  @override
  String get appDirectory => '(پوشه لوکال‌سند)';
  @override
  String get saveToGallery => 'ذخیره در گالری';
  @override
  String get saveToGalleryOff => 'به دلیل وجود پوشه‌ها به‌طور خودکار خاموش شد.';
}

// Path: sendPage
class _Translations$sendPage$fa extends Translations$sendPage$en {
  _Translations$sendPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'در حال محاسبه کد سلامت فایل (${curr} / ${n})';
  @override
  String get waiting => 'در انتظار پاسخ…';
  @override
  String get rejected => 'گیرنده درخواست را رد کرد.';
  @override
  String get tooManyAttempts => 'تلاش‌های بیش از حد مجاز';
  @override
  String get busy => 'گیرنده در حال پردازش درخواست دیگری است.';
}

// Path: progressPage
class _Translations$progressPage$fa extends Translations$progressPage$en {
  _Translations$progressPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'در حال ارسال فایل‌ها';
  @override
  String get titleReceiving => 'در حال دریافت فایل‌ها';
  @override
  String get savedToGallery => 'در گالری ذخیره شد';
  @override
  late final _Translations$progressPage$total$fa total = _Translations$progressPage$total$fa._(_root);
  @override
  late final _Translations$progressPage$remainingTime$fa remainingTime = _Translations$progressPage$remainingTime$fa._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$fa extends Translations$webSharePage$en {
  _Translations$webSharePage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اشتراک‌گذاری از طریق لینک';
  @override
  String get loading => 'در حال راه‌اندازی سرور…';
  @override
  String get stopping => 'در حال متوقف کردن سرور…';
  @override
  String get error => 'هنگام راه‌اندازی سرور خطایی رخ داد.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    n,
    one: 'این لینک را در مرورگر خود باز کنید:',
    other: 'یکی از این لینک‌ها را در مرورگر خود باز کنید:',
  );
  @override
  String get requests => 'درخواست‌ها';
  @override
  String get noRequests => 'هنوز درخواستی وجود ندارد.';
  @override
  String get encryption => 'رمزنگاری شبکه';
  @override
  String get autoAccept => 'تأیید خودکار درخواست‌ها';
  @override
  String get requirePin => 'نیاز به رمز (PIN)';
  @override
  String pinHint({required Object pin}) => 'رمز ورود: "${pin}"';
  @override
  String get encryptionHint => 'لوکال‌سند از یک گواهی خودامضا (Self-signed) استفاده می‌کند. باید آن را در مرورگر تأیید کنید.';
  @override
  String pendingRequests({required Object n}) => 'درخواست‌های در انتظار: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$fa extends Translations$webReceivePage$en {
  _Translations$webReceivePage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دریافت از طریق لینک';
}

// Path: aboutPage
class _Translations$aboutPage$fa extends Translations$aboutPage$en {
  _Translations$aboutPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'درباره لوکال‌سند';
  @override
  List<String> get description => [
    'لوکال‌سند یک برنامه رایگان و متن‌باز است که به شما امکان می‌دهد فایل‌ها و پیام‌ها را به‌طور امن با دستگاه‌های اطراف از طریق شبکه محلی و بدون نیاز به اینترنت به اشتراک بگذارید.',
    'این برنامه برای سیستم‌عامل‌های اندروید، آی او اس، مک او اس، ویندوز و لینوکس در دسترس است. می‌توانید با مراجعه به وب‌سایت رسمی برنامه، تمامی روش‌های دانلود را مشاهده کنید.',
  ];
  @override
  String get author => 'توسعه‌دهنده';
  @override
  String get contributors => 'مشارکت کنندگان';
  @override
  String get packagers => 'بسته‌بندها';
  @override
  String get translators => 'مترجمان';
}

// Path: donationPage
class _Translations$donationPage$fa extends Translations$donationPage$en {
  _Translations$donationPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'کمک مالی';
  @override
  String get info =>
      'لوکال‌سند رایگان، متن‌باز و فاقد هرگونه تبلیغات است. اگر به این برنامه علاقه‌مندید، می‌توانید با کمک مالی از توسعه آن حمایت کنید.';
  @override
  String donate({required Object amount}) => 'کمک مالی به میزان ${amount}';
  @override
  String get thanks => 'از حمایت شما بسیار سپاسگزاریم!';
  @override
  String get restore => 'بازیابی خرید';
}

// Path: changelogPage
class _Translations$changelogPage$fa extends Translations$changelogPage$en {
  _Translations$changelogPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تاریخچه تغییرات برنامه';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$fa extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => 'ویژگی‌های جدید در نسخه ${version}';
  @override
  late final _Translations$whatsNewPage$changes$fa changes = _Translations$whatsNewPage$changes$fa._(_root);
}

// Path: aliasGenerator
class _Translations$aliasGenerator$fa extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'ستودنی',
    'زیبا',
    'بزرگ',
    'درخشان',
    'تمیز',
    'باهوش',
    'باحال',
    'بامزه',
    'زرنگ',
    'مصمم',
    'پرانرژی',
    'چابک',
    'شگفت‌انگیز',
    'سریع',
    'شایسته',
    'سرحال',
    'خوب',
    'دلنشین',
    'باشکوه',
    'خوش‌تیپ',
    'جذاب',
    'مهربون',
    'دوست‌داشتنی',
    'رازآلود',
    'بی‌نظیر',
    'مودب',
    'صبور',
    'زیبا',
    'نیرومند',
    'مایه‌دار',
    'اسرارآمیز',
    'باهوش',
    'سرسخت',
    'خاص',
    'خوش‌فکر',
    'قدرتمند',
    'منظم',
    'خردمند',
  ];
  @override
  List<String> get fruits => [
    'سیب',
    'آووکادو',
    'موز',
    'توت',
    'بلوبری',
    'کلم',
    'هویج',
    'گیلاس',
    'نارگیل',
    'انگور',
    'لیمو',
    'کاهو',
    'انبه',
    'خربزه',
    'قارچ',
    'پیاز',
    'پرتقال',
    'پاپایا',
    'هلو',
    'گلابی',
    'آناناس',
    'سیب‌زمینی',
    'کدوتنبل',
    'تمشک',
    'توت‌فرنگی',
    'گوجه',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _Translations$dialogs$fa extends Translations$dialogs$en {
  _Translations$dialogs$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$fa addFile = _Translations$dialogs$addFile$fa._(_root);
  @override
  late final _Translations$dialogs$openFile$fa openFile = _Translations$dialogs$openFile$fa._(_root);
  @override
  late final _Translations$dialogs$addressInput$fa addressInput = _Translations$dialogs$addressInput$fa._(_root);
  @override
  late final _Translations$dialogs$cancelSession$fa cancelSession = _Translations$dialogs$cancelSession$fa._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$fa cannotOpenFile = _Translations$dialogs$cannotOpenFile$fa._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$fa encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$fa._(_root);
  @override
  late final _Translations$dialogs$errorDialog$fa errorDialog = _Translations$dialogs$errorDialog$fa._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$fa favoriteDialog = _Translations$dialogs$favoriteDialog$fa._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$fa favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$fa._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$fa favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$fa._(_root);
  @override
  late final _Translations$dialogs$fileInfo$fa fileInfo = _Translations$dialogs$fileInfo$fa._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$fa fileNameInput = _Translations$dialogs$fileNameInput$fa._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$fa historyClearDialog = _Translations$dialogs$historyClearDialog$fa._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$fa localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$fa._(_root);
  @override
  late final _Translations$dialogs$messageInput$fa messageInput = _Translations$dialogs$messageInput$fa._(_root);
  @override
  late final _Translations$dialogs$noFiles$fa noFiles = _Translations$dialogs$noFiles$fa._(_root);
  @override
  late final _Translations$dialogs$noPermission$fa noPermission = _Translations$dialogs$noPermission$fa._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$fa notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$fa._(_root);
  @override
  late final _Translations$dialogs$qr$fa qr = _Translations$dialogs$qr$fa._(_root);
  @override
  late final _Translations$dialogs$quickActions$fa quickActions = _Translations$dialogs$quickActions$fa._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$fa quickSaveNotice = _Translations$dialogs$quickSaveNotice$fa._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$fa quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$fa._(_root);
  @override
  late final _Translations$dialogs$pin$fa pin = _Translations$dialogs$pin$fa._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$fa sendModeHelp = _Translations$dialogs$sendModeHelp$fa._(_root);
  @override
  late final _Translations$dialogs$zoom$fa zoom = _Translations$dialogs$zoom$fa._(_root);
}

// Path: sanitization
class _Translations$sanitization$fa extends Translations$sanitization$en {
  _Translations$sanitization$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'نام فایل نمی‌تواند خالی باشد';
  @override
  String get invalid => 'نام فایل حاوی کاراکترهای غیرمجاز است';
}

// Path: tray
class _Translations$tray$fa extends Translations$tray$en {
  _Translations$tray$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'خروج از لوکال‌سند';
  @override
  String get closeWindows => 'خروج';
}

// Path: web
class _Translations$web$fa extends Translations$web$en {
  _Translations$web$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'در حال انتظار';
  @override
  String get enterPin => 'رمز (PIN) را وارد کنید';
  @override
  String get invalidPin => 'رمز اشتباه است';
  @override
  String get tooManyAttempts => 'تلاش‌های بیش از حد مجاز';
  @override
  String get rejected => 'پذیرفته نشد';
  @override
  String get files => 'فایل‌ها';
  @override
  String get fileName => 'نام فایل';
  @override
  String get size => 'حجم';
}

// Path: assetPicker
class _Translations$assetPicker$fa extends Translations$assetPicker$en {
  _Translations$assetPicker$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'تأیید';
  @override
  String get cancel => 'لغو';
  @override
  String get edit => 'ویرایش';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'بارگذاری ناموفق بود';
  @override
  String get original => 'اصلی';
  @override
  String get preview => 'پیش‌نمایش';
  @override
  String get select => 'انتخاب';
  @override
  String get emptyList => 'لیست خالی است';
  @override
  String get unSupportedAssetType => 'نوع فایل پشتیبانی نمی‌شود.';
  @override
  String get unableToAccessAll => 'عدم دسترسی به تمام فایل‌های دستگاه';
  @override
  String get viewingLimitedAssetsTip => 'تنها فایل‌ها و آلبوم‌های قابل دسترسی برای برنامه نمایش داده می‌شوند.';
  @override
  String get changeAccessibleLimitedAssets => 'برای به‌روزرسانی فایل‌های قابل دسترسی کلیک کنید';
  @override
  String get accessAllTip =>
      'برنامه فقط به برخی از فایل‌های دستگاه دسترسی دارد. به تنظیمات سیستم بروید و اجازه دسترسی به تمامی رسانه‌ها را اعطا کنید.';
  @override
  String get goToSystemSettings => 'رفتن به تنظیمات سیستم';
  @override
  String get accessLimitedAssets => 'ادامه با دسترسی محدود';
  @override
  String get accessiblePathName => 'فایل‌های قابل دسترسی';
  @override
  String get sTypeAudioLabel => 'صدا';
  @override
  String get sTypeImageLabel => 'تصویر';
  @override
  String get sTypeVideoLabel => 'ویدیو';
  @override
  String get sTypeOtherLabel => 'سایر رسانه‌ها';
  @override
  String get sActionPlayHint => 'پخش';
  @override
  String get sActionPreviewHint => 'پیش‌نمایش';
  @override
  String get sActionSelectHint => 'انتخاب';
  @override
  String get sActionSwitchPathLabel => 'تغییر مسیر';
  @override
  String get sActionUseCameraHint => 'استفاده از دوربین';
  @override
  String get sNameDurationLabel => 'مدت زمان';
  @override
  String get sUnitAssetCountLabel => 'تعداد';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$fa extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'آی‌پی:';
  @override
  String get port => 'پورت:';
  @override
  String get alias => 'نام دستگاه:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$fa extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'موردعلاقه‌ها';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$fa extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'انتخاب‌شده‌ها';
  @override
  String files({required Object files}) => 'فایل‌ها: ${files}';
  @override
  String size({required Object size}) => 'حجم: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$fa extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'فایل';
  @override
  String get folder => 'پوشه';
  @override
  String get media => 'رسانه';
  @override
  String get text => 'متن';
  @override
  String get app => 'برنامه';
  @override
  String get clipboard => 'کلیپ‌بورد';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$fa extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'یک دریافت‌کننده';
  @override
  String get multiple => 'چندین دریافت‌کننده';
  @override
  String get link => 'اشتراک‌گذاری از طریق لینک';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$fa extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عمومی';
  @override
  String get brightness => 'ظاهر';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$fa brightnessOptions = _Translations$settingsTab$general$brightnessOptions$fa._(
    _root,
  );
  @override
  String get color => 'رنگ';
  @override
  late final _Translations$settingsTab$general$colorOptions$fa colorOptions = _Translations$settingsTab$general$colorOptions$fa._(_root);
  @override
  String get language => 'زبان';
  @override
  late final _Translations$settingsTab$general$languageOptions$fa languageOptions = _Translations$settingsTab$general$languageOptions$fa._(_root);
  @override
  String get saveWindowPlacement => 'ذخیره موقعیت پنجره پس از خروج';
  @override
  String get saveWindowPlacementWindows => 'ذخیره موقعیت پنجره پس از خروج';
  @override
  String get minimizeToTray => 'ارسال برنامه به سیستم تری هنگام بستن';
  @override
  String get launchAtStartup => 'اجرای خودکار هنگام ورود به سیستم';
  @override
  String get launchMinimized => 'اجرای خودکار: اجرا به‌صورت پنجره پنهان';
  @override
  String get showInContextMenu => 'نمایش لوکال‌سند در منوی راست‌کلیک';
  @override
  String get animations => 'پویانمایی‌ها';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$fa extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دریافت';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => 'نیاز به رمز (PIN)';
  @override
  String get autoFinish => 'پایان خودکار';
  @override
  String get destination => 'مسیر ذخیره‌سازی';
  @override
  String get downloads => '(دانلودها)';
  @override
  String get saveToGallery => 'ذخیره رسانه در گالری';
  @override
  String get saveToHistory => 'ذخیره در تاریخچه';
  @override
  String get verifyChecksums => 'تأیید اصالت و سلامت فایل‌ها هنگام دریافت';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$fa extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ارسال';
  @override
  String get shareViaLinkAutoAccept => 'تأیید خودکار درخواست‌ها در حالت «اشتراک‌گذاری از طریق لینک»';
  @override
  String get createChecksums => 'تولید کد ساختار و سلامت فایل هنگام ارسال';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$fa extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'شبکه';
  @override
  String get needRestart => 'برای اعمال تنظیمات، سرور را مجدداً راه‌اندازی کنید!';
  @override
  String get server => 'سرور';
  @override
  String get alias => 'نام دستگاه';
  @override
  String get deviceType => 'نوع دستگاه';
  @override
  String get deviceModel => 'مدل دستگاه';
  @override
  String get port => 'پورت';
  @override
  String get network => 'شبکه';
  @override
  late final _Translations$settingsTab$network$networkOptions$fa networkOptions = _Translations$settingsTab$network$networkOptions$fa._(_root);
  @override
  String get discoveryTimeout => 'مدت‌زمان جستجو';
  @override
  String get useSystemName => 'استفاده از نام سیستم';
  @override
  String get generateRandomAlias => 'ایجاد نام مستعار تصادفی';
  @override
  String portWarning({required Object defaultPort}) =>
      'ممکن است به دلیل استفاده از پورت سفارشی، دستگاه‌های دیگر شما را شناسایی نکنند (پیش‌فرض: ${defaultPort})';
  @override
  String get encryption => 'رمزنگاری';
  @override
  String get multicastGroup => 'آدرس چندپخشی';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ممکن است به دلیل استفاده از آدرس چندپخشی سفارشی، دستگاه‌های دیگر شما را شناسایی نکنند (پیش‌فرض: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$fa extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'سایر';
  @override
  String get support => 'حمایت از لوکال‌سند';
  @override
  String get donate => 'کمک مالی';
  @override
  String get privacyPolicy => 'سیاست حفظ حریم خصوصی';
  @override
  String get termsOfUse => 'شرایط استفاده';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$fa extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'این دستگاه می‌تواند فایل‌ها را به دستگاه‌های دیگر ارسال کند، اما دستگاه‌های دیگر نمی‌توانند به این دستگاه فایل ارسال کنند.';
  @override
  String solution({required Object port}) =>
      'این مشکل به احتمال زیاد مربوط به تنظیمات فایروال است. می‌توانید با دادن مجوز به اتصالات ورودی (UDP و TCP) در پورت ${port} مشکل را حل کنید.';
  @override
  String get openFirewall => 'باز کردن فایروال';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$fa extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'این دستگاه نمی‌تواند دستگاه‌های دیگر را پیدا کند.';
  @override
  String get solution =>
      'لطفاً اطمینان حاصل کنید که همه دستگاه‌ها به یک شبکه وای‌فای متصل هستند و تنظیمات یکسانی (پورت، آدرس چندپخشی، رمزنگاری) دارند. می‌توانید آدرس IP دستگاه مقصد را به‌صورت دستی وارد کنید. اگر این روش کارساز بود، آن دستگاه را به لیست علاقه‌مندی‌ها اضافه کنید تا در آینده به‌طور خودکار شناسایی شود.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$fa extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'هیچ‌یک از دستگاه‌ها نمی‌توانند یکدیگر را پیدا کرده یا فایلی به اشتراک بگذارند.';
  @override
  String get solution =>
      'اگر مشکل در هر دو طرف وجود دارد، مطمئن شوید هر دو دستگاه به یک شبکه وای‌فای متصل هستند و تنظیمات شبکه یکسانی دارند. همچنین ممکن است به دلیل فعال بودن قابلیت ایزوله‌سازی نقطه دسترسی (AP Isolation) در روتر، ارتباط بین دستگاه‌ها مسدود شده باشد که باید آن را در تنظیمات روتر غیرفعال کنید.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$fa extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'باز کردن فایل';
  @override
  String get showInFolder => 'نمایش پوشه';
  @override
  String get info => 'اطلاعات';
  @override
  String get deleteFromHistory => 'حذف از تاریخچه';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$fa extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'نام';
  @override
  String get address => 'آدرس';
  @override
  String get version => 'نسخه';
  @override
  String protocol({required Object version}) => 'پروتکل نسخه ${version}';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$fa extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'گزارش‌ها';
  @override
  String get empty => 'هیچ گزارشی موجود نیست.';
  @override
  String discovered({required Object protocol, required Object host}) => 'شناسایی شده از طریق ${protocol} (${host})';
  @override
  String updated({required Object protocol, required Object host}) => 'به‌روزرسانی شده از طریق ${protocol} (${host})';
}

// Path: progressPage.total
class _Translations$progressPage$total$fa extends Translations$progressPage$total$en {
  _Translations$progressPage$total$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$fa title = _Translations$progressPage$total$title$fa._(_root);
  @override
  String count({required Object curr, required Object n}) => 'فایل‌ها: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'حجم: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'سرعت: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$fa extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    m,
    other: '${m} د',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    h,
    other: '${h} س',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';

  /// از «س» به عنوان مخفف ساعت و از «د» برای دقیقه استفاده کنید
  @override
  String hours({required Object h, required Object m}) => '${h}س ${m}د';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$fa extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$fa v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$fa._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$fa extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'افزودن به انتخاب‌شده‌ها';
  @override
  String get content => 'چه چیزی می‌خواهید اضافه کنید؟';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$fa extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'باز کردن فایل';
  @override
  String get content => 'آیا می‌خواهید فایل دریافتی را باز کنید؟';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$fa extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'آدرس را وارد کنید';
  @override
  String get recentlyUsed => 'اخیرا استفاده شده: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$fa extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'لغو انتقال فایل‌ها';
  @override
  String get content => 'واقعاً می‌خواهید انتقال فایل‌ها را لغو کنید؟';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$fa extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'نمی‌توان فایل را باز کرد ';
  @override
  String content({required Object file}) => 'فایل "${file}" باز نشد. آیا این فایل جابه‌جا، تغییر نام یا حذف شده است؟';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$fa extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'رمزنگاری غیرفعال شد';
  @override
  String get content => 'ارتباط اکنون از طریق پروتکل رمزنگاری نشده HTTP انجام می‌شود. برای استفاده از پروتکل HTTPS، رمزنگاری را دوباره فعال کنید.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$fa extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'خطایی رخ داد';
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$fa extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'علاقه‌مندی‌ها';
  @override
  String get noFavorites => 'هنوز دستگاه مورد علاقه‌ای وجود ندارد.';
  @override
  String get addFavorite => 'افزودن';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$fa extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'حذف از علاقه‌مندی‌ها';
  @override
  String content({required Object name}) => 'واقعاً می‌خواهید "${name}" را از علاقه‌مندی‌ها حذف کنید؟';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$fa extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'افزودن به علاقه‌مندی‌ها';
  @override
  String get titleEdit => 'تنظیمات';
  @override
  String get name => 'نام دستگاه';
  @override
  String get auto => '(خودکار)';
  @override
  String get ip => 'آدرس آی پی';
  @override
  String get port => 'پورت';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$fa extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'مشخصات فایل';
  @override
  String get fileName => 'نام فایل:';
  @override
  String get path => 'مسیر:';
  @override
  String get size => 'حجم:';
  @override
  String get sender => 'فرستنده:';
  @override
  String get time => 'زمان:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$fa extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'نام فایل را وارد کنید';
  @override
  String original({required Object original}) => 'اصلی: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$fa extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پاکسازی تاریخچه';
  @override
  String get content => 'واقعاً می‌خواهید کل تاریخچه را حذف کنید؟';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$fa extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عدم دسترسی به شبکه';
  @override
  String get description =>
      'لوکال‌سند بدون داشتن مجوز اسکن شبکه محلی نمی‌تواند دستگاه‌های دیگر را پیدا کند. لطفاً این دسترسی را در تنظیمات به برنامه اعطا کنید.';
  @override
  String get gotoSettings => 'تنظیمات';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$fa extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'متن پیام';
  @override
  String get multiline => 'چندخطی';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$fa extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فایلی انتخاب نشده است';
  @override
  String get content => 'لطفاً حداقل یک فایل را انتخاب کنید.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$fa extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عدم وجود دسترسی';
  @override
  String get content => 'مجوزهای لازم اعطا نشده است. لطفاً آن‌ها را در تنظیمات فعال کنید.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$fa extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'در دسترس نیست';
  @override
  String get content => 'این ویژگی فقط در این پلتفرم‌ها پشتیبانی می‌شود:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$fa extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'کد QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$fa extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اقدامات سریع';
  @override
  String get counter => 'شمارنده';
  @override
  String get prefix => 'پیشوند';
  @override
  String get padZero => 'همگام‌سازی نام‌ها با افزودن صفر';
  @override
  String get sortBeforeCount => 'مرتب‌سازی الفبایی پیش از شماره‌گذاری';
  @override
  String get random => 'تصادفی';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$fa extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ذخیره سریع';
  @override
  String get content =>
      'درخواست‌ها به صورت خودکار پذیرفته می‌شوند. توجه داشته باشید که همه افراد حاضر در شبکه محلی می‌توانند برای شما فایل ارسال کنند.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$fa extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ذخیره سریع از علاقه‌مندی‌ها';
  @override
  List<String> get content => [
    'درخواست‌ها به صورت خودکار از دستگاه‌های موجود در فهرست موردعلاقه‌ها پذیرفته می‌شوند.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$fa extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'رمز (PIN) را وارد کنید';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$fa extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'حالت‌های ارسال';
  @override
  String get single => 'فایل‌ها را به یک گیرنده ارسال می‌کند. لیست فایل‌های انتخاب‌شده پس از اتمام انتقال پاک می‌شود.';
  @override
  String get multiple => 'فایل‌ها را برای چندین گیرنده ارسال می‌کند. لیست فایل‌های انتخاب‌شده پس از اتمام انتقال پاک نخواهد شد.';
  @override
  String get link => 'گیرندگانی که لوکال‌سند را نصب نکرده‌اند، می‌توانند فایل‌ها را با باز کردن لینک در مرورگر خود دانلود کنند.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$fa extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'آدرس اینترنتی';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$fa extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'سیستم';
  @override
  String get dark => 'تیره';
  @override
  String get light => 'روشن';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$fa extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'سیستم';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'سفارشی';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$fa extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'سیستم';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$fa extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'همه';
  @override
  String get filtered => 'فیلترشده';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$fa extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'مجموع پیشرفت (${time})';
  @override
  String get finishedError => 'با خطا مواجه شد';
  @override
  String get canceledSender => 'توسط فرستنده لغو شد';
  @override
  String get canceledReceiver => 'توسط گیرنده لغو شد';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$fa extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'رمزنگاری دیگر سرعت انتقال را کاهش نمی‌دهد. اگر قبلاً آن را خاموش کرده بودید، دوباره در این دستگاه فعال شده است.',
    'درخواست‌های دریافت شده از لیست علاقه‌مندی‌ها اکنون به صورت خودکار پذیرفته می‌شوند. این گزینه به صورت پیش‌فرض روشن است و می‌توانید آن را در تنظیمات غیرفعال کنید.',
    'در اندروید، انتقال فایل‌ها زمانی که برنامه در پس‌زمینه است یا صفحه نمایش خاموش است ادامه می‌یابد. در iOS، برنامه همچنان باید در پیش‌زمینه باقی بماند.',
  ];
}
