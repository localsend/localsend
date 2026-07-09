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
  String get locale => 'فارسی';
  @override
  String get appName => 'لوکال‌سِند';
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
  late final _Translations$receiveHistoryPage$fa receiveHistoryPage = _Translations$receiveHistoryPage$fa._(_root);
  @override
  late final _Translations$apkPickerPage$fa apkPickerPage = _Translations$apkPickerPage$fa._(_root);
  @override
  late final _Translations$selectedFilesPage$fa selectedFilesPage = _Translations$selectedFilesPage$fa._(_root);
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
  late final _Translations$aboutPage$fa aboutPage = _Translations$aboutPage$fa._(_root);
  @override
  late final _Translations$donationPage$fa donationPage = _Translations$donationPage$fa._(_root);
  @override
  late final _Translations$changelogPage$fa changelogPage = _Translations$changelogPage$fa._(_root);
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
  @override
  late final _Translations$networkInterfacesPage$fa networkInterfacesPage = _Translations$networkInterfacesPage$fa._(_root);
}

// Path: general
class _Translations$general$fa extends Translations$general$en {
  _Translations$general$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'پذیرفتن';
  @override
  String get accepted => 'پذیرفته‌شده';
  @override
  String get add => 'افزودن';
  @override
  String get advanced => 'پیشرفته';
  @override
  String get cancel => 'ردکردن';
  @override
  String get close => 'بستن';
  @override
  String get confirm => 'پذیرفتن';
  @override
  String get continueStr => 'ادامه';
  @override
  String get copy => 'کپی';
  @override
  String get copiedToClipboard => 'کپی شد';
  @override
  String get decline => 'نپذیرفتن';
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
  String get finished => 'پایان‌یافت';
  @override
  String get hide => 'مخفی';
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
  String get renamed => 'نام ویرایش‌شد';
  @override
  String get reset => 'بازنشانی';
  @override
  String get restart => 'راه‌اندازی دوباره';
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
  String get noItemInClipboard => 'چیزی در کلیپ‌بورد وجود ندارد.';
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
  String get shareIntentInfo => 'همچنین می‌توانید از ویژگی «هم‌رسانی» دستگاه تلفن‌همراه خود برای انتخاب آسان‌تر پرونده‌ها استفاده کنید.';
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
  String get sendModeHelp => 'توضیح';
  @override
  String get help => 'لطفاً مطمئن شوید که دستگاه مورد نظر به شبکه وای‌فای یکسانی وصل باشد.';
  @override
  String get placeItems => 'موارد را برای هم‌رسانی قرار دهید.';
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
  String get title => 'عیب یابی';
  @override
  String get subTitle => 'این برنامه مطابق انتظار کار نمی‌کند؟ در اینجا می‌توانید راه حل‌های رایج را بیابید.';
  @override
  String get solution => 'راه حل:';
  @override
  String get fixButton => 'تعمیر خودکار';
  @override
  late final _Translations$troubleshootPage$firewall$fa firewall = _Translations$troubleshootPage$firewall$fa._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$fa noDiscovery = _Translations$troubleshootPage$noDiscovery$fa._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$fa noConnection = _Translations$troubleshootPage$noConnection$fa._(_root);
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

// Path: receivePage
class _Translations$receivePage$fa extends Translations$receivePage$en {
  _Translations$receivePage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    n,
    one: 'می‌خواهد برای شما یک فایل ارسال کند',
    other: 'می‌خواهد برای شما ${n} فایل ارسال کند',
  );
  @override
  String get subTitleMessage => 'به شما پیام داد:';
  @override
  String get subTitleLink => 'برای شما یک لینک ارسال کرد:';
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
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(پوشه لوکال‌سند)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'به دلیل وجود پوشه‌ها به طور خودکار خاموش می‌شود.';
}

// Path: sendPage
class _Translations$sendPage$fa extends Translations$sendPage$en {
  _Translations$sendPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'در انتظار پاسخ…';
  @override
  String get rejected => 'گیرنده درخواست را رد کرد.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'گیرنده با درخواست دیگری مشغول است.';
}

// Path: progressPage
class _Translations$progressPage$fa extends Translations$progressPage$en {
  _Translations$progressPage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ارسال فایل‌ها';
  @override
  String get titleReceiving => 'دریافت فایل‌ها';
  @override
  String get savedToGallery => 'در تصاویر ذخیره شد';
  @override
  late final _Translations$progressPage$total$fa total = _Translations$progressPage$total$fa._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$fa extends Translations$webSharePage$en {
  _Translations$webSharePage$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اشتراک گذاری از طریق لینک';
  @override
  String get loading => 'در حال راه‌اندازی سرور…';
  @override
  String get stopping => 'در حال توقف سرور…';
  @override
  String get error => 'هنگام راه‌اندازی سرور خطایی رخ داد.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(
    n,
    one: 'باز کردن لینک در مرورگر:',
    other: 'باز کردن لینک‌ها در مرورگر:',
  );
  @override
  String get requests => 'درخواست‌ها';
  @override
  String get noRequests => 'هنوز درخواستی وجود ندارد.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'درخواست‌ها به طور خودکار پذیرفته می‌شوند';
  @override
  String get requirePin => 'نیاز به پین';
  @override
  String pinHint({required Object pin}) => 'پین "${pin}" می‌باشد';
  @override
  String get encryptionHint => 'لوکال‌سند از یک گواهی خودامضا استفاده می‌کند. شما باید آن را در مرورگر قبول کنید.';
  @override
  String pendingRequests({required Object n}) => 'درخواست‌های در حال انتظار: ${n}';
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
    'لوکال‌سند یک برنامه آزاد و متن‌باز است که به شما امکان می‌دهد پرونده‌ها و پیام‌ها را به‌طور ایمن با دستگاه‌های اطراف از طریق شبکه محلی خود و بدون نیاز به اینترنت هم‌رسانی کنید.',
    'این برنامه برای سیستم عامل‌های اندروید، آی او اس، مک او اس، ویندوز و لینوکس در دسترس است. شما می‌توانید با مراجعه به وبگاه رسمی برنامه کلیه روش‌های دانلود را مشاهده نمایید.',
  ];
  @override
  String get author => 'نویسنده';
  @override
  String get contributors => 'مشارکت کنندگان';
  @override
  String get packagers => 'بسته‌بندی‌ها';
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
      'لوکال‌سند آزاد، متن‌باز و فاقد هرگونه تبلیغات است. اگر به این برنامه علاقه‌مندید، می‌توانید با کمک مالی از توسعه آن حمایت کنید.';
  @override
  String donate({required Object amount}) => 'کمک مالی ${amount}';
  @override
  String get thanks => 'بسیار از شما سپاسگزاریم!';
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
    'کلک',
    'مصمم',
    'باانرژی',
    'چابک',
    'شگفت‌انگیز',
    'سریع',
    'شایسته',
    'سرحال',
    'خوب',
    'دلنشین',
    'باشکوه',
    'خوشتیپ',
    'جذاب',
    'مهربون',
    'دوست‌داشتنی',
    'مبهم',
    'بی‌نظیر',
    'باادب',
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
  String get invalid => 'نام فایل حاوی کاراکترهای نامعتبر است';
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
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'پین را وارد کنید';
  @override
  String get invalidPin => 'پین اشتباه است';
  @override
  String get tooManyAttempts => 'تلاش‌های بیش از اندازه';
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
  String get confirm => 'تایید';
  @override
  String get cancel => 'لغو';
  @override
  String get edit => 'ویرایش';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'بارگذاری ناموفق';
  @override
  String get original => 'اصلی';
  @override
  String get preview => 'پیش نمایش';
  @override
  String get select => 'انتخاب';
  @override
  String get emptyList => 'لیست خالی';
  @override
  String get unSupportedAssetType => 'نوع پرونده پشتیبانی نشده.';
  @override
  String get unableToAccessAll => 'قادر به دسترسی به تمام فایل‌های موجود در دستگاه نیست';
  @override
  String get viewingLimitedAssetsTip => 'فقط پرونده‌ها و آلبوم‌های قابل دسترسی برنامه را مشاهده کنید.';
  @override
  String get changeAccessibleLimitedAssets => 'برای به‌روزرسانی فایل‌های در دسترس کلیک کنید';
  @override
  String get accessAllTip =>
      'برنامه فقط می‌تواند به برخی از پرونده‌های دستگاه دسترسی داشته باشد. به تنظیمات سیستم بروید و به برنامه اجازه دهید به تمام رسانه‌های موجود در دستگاه دسترسی داشته باشد.';
  @override
  String get goToSystemSettings => 'رفتن به تنظیمات سیستم';
  @override
  String get accessLimitedAssets => 'با دسترسی محدود ادامه دهید';
  @override
  String get accessiblePathName => 'فایل‌های قابل دسترسی';
  @override
  String get sTypeAudioLabel => 'صوت';
  @override
  String get sTypeImageLabel => 'تصویر';
  @override
  String get sTypeVideoLabel => 'ویدیو';
  @override
  String get sTypeOtherLabel => 'دیگر رسانه‌ها';
  @override
  String get sActionPlayHint => 'پخش';
  @override
  String get sActionPreviewHint => 'پیش نمایش';
  @override
  String get sActionSelectHint => 'انتخاب';
  @override
  String get sActionSwitchPathLabel => 'تغییر مسیر';
  @override
  String get sActionUseCameraHint => 'از دوربین استفاده کنید';
  @override
  String get sNameDurationLabel => 'مدت زمان';
  @override
  String get sUnitAssetCountLabel => 'شمردن';
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
      'به طور پیش فرض، LocalSend از تمام رابط های شبکه موجود استفاده می کند. در اینجا می توانید شبکه های ناخواسته را حذف کنید. برای اعمال تغییرات باید سرور را ریستارت کنید.';
  @override
  String get preview => 'پیشنمایش';
  @override
  String get whitelist => 'لیست سفید';
  @override
  String get blacklist => 'لیست سیاه';
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
  String get alias => 'نام کوتاه:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$fa extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => '‌موردعلاقه‌ها';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$fa extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'انتخاب شده‌ها';
  @override
  String files({required Object files}) => 'فایل‌ها: ${files}';
  @override
  String size({required Object size}) => 'اندازه: ${size}';
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
  String get single => 'یک دریافت کننده';
  @override
  String get multiple => 'چندین دریافت کننده';
  @override
  String get link => 'اشتراک گذاری از طریق لینک';
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
  String get minimizeToTray => 'خروج: ارسال برنامه به سیستم تری';
  @override
  String get launchAtStartup => 'شروع خودکار پس از ورود به سیستم';
  @override
  String get launchMinimized => 'شروع خودکار: شروع به صورت پنجره پنهان';
  @override
  String get showInContextMenu => 'نمایش لوکال‌سند در منوی زمینه';
  @override
  String get animations => 'انیمیشن‌ها';
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
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'پایان خودکار';
  @override
  String get destination => 'مقصد';
  @override
  String get downloads => '(دانلودها)';
  @override
  String get saveToGallery => 'ذخیره رسانه در گالری';
  @override
  String get saveToHistory => 'ذخیره در تاریخچه';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$fa extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ارسال';
  @override
  String get shareViaLinkAutoAccept => 'اشتراک‌گذاری از طریق لینک: تایید خودکار';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$fa extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'شبکه';
  @override
  String get needRestart => 'برای اعمال تنظیمات، سرور را مجدد راه‌اندازی کنید!';
  @override
  String get server => 'سرور';
  @override
  String get alias => 'نام کوتاه';
  @override
  String get deviceType => 'نوع دستگاه';
  @override
  String get deviceModel => 'مدل دستگاه';
  @override
  String get port => 'پورت';
  @override
  String get discoveryTimeout => 'مدت کاوش';
  @override
  String get useSystemName => 'استفاده از نام سیستم';
  @override
  String get generateRandomAlias => 'ایجاد نام مستعار تصادفی';
  @override
  String portWarning({required Object defaultPort}) =>
      'ممکن است به دلیل استفاده از یک پورت سفارشی، دستگاه‌های دیگر شما را شناسایی نکنند (پیشفرض : ${defaultPort})';
  @override
  String get encryption => 'رمزنگاری';
  @override
  String get multicastGroup => 'چندپخشی';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ممکن است به دلیل استفاده از چندپخشی سفارشی، دستگاه‌های دیگر شما را شناسایی نکنند (پیشفرض: ${defaultMulticast})';
  @override
  String get network => 'شبکه';
  @override
  late final _Translations$settingsTab$network$networkOptions$fa networkOptions = _Translations$settingsTab$network$networkOptions$fa._(_root);
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
  String get symptom =>
      'این برنامه می‌تواند پرونده‌ها را به دستگاه‌های دیگر ارسال کند اما دستگاه‌های دیگر نمی‌توانند پرونده‌ها را به این دستگاه ارسال کنند.';
  @override
  String solution({required Object port}) =>
      'این مشکل به احتمال زیاد مربوط به تنظیمات فایروال است. شما می‌توانید با دادن مجوز به اتصالات ورودی این مشکل را حل کنید (UDP و TCP) در پورت ${port}.';
  @override
  String get openFirewall => 'بازکردن فایروال';
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
      'مطمئن شوید که هر دو دستگاه به یک شبکه وای‌فای متصل هستند و پیکربندی یکسانی دارند (پورت، آدرس چندپخشی، رمزنگاری). سعی کنید آدرس آی‌پی دستگاه مورد نظر را به صورت دستی تایپ کنید. اگر جواب داد، این دستگاه را به موارد موردعلاقه اضافه کنید تا در آینده به طور خودکار کشف شود.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$fa extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'هر دو دستگاه نمی‌توانند یکدیگر را پیدا کرده و پرونده‌ها را هم‌رسانی کنند.';
  @override
  String get solution =>
      'آیا مشکل در هر دو طرف وجود دارد؟ اگر چنین است، باید مطمئن شوید که هر دو دستگاه در یک شبکه Wi-Fi متصل هستند و تنظیمات یکسانی دارند (پورت، آدرس چندپخشی، رمزگذاری). ممکن است شبکه Wi-Fi اجازه‌ی ارتباط بین شرکت‌کنندگان را ندهد، به دلیل فعال بودن قابلیت ایزوله‌سازی نقطه دسترسی (AP Isolation). در این صورت باید این گزینه را در روتر غیرفعال کنید.';
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

// Path: dialogs.addFile
class _Translations$dialogs$addFile$fa extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'افزودن به انتخاب شده‌ها';
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
  String get hashtag => 'هشتگ';
  @override
  String get ip => 'آدرس آی‌پی';
  @override
  String get recentlyUsed => 'اخیرا استفاده شده: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$fa extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '‌‌لغو انتقال فایل';
  @override
  String get content => 'واقعاً می‌خواهید انتقال فایل را لغو کنید؟';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$fa extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'نمی‌تواند فایل را باز کند';
  @override
  String content({required Object file}) => 'نمی‌توان فایل "${file}" را باز کرد. آیا این فایل منتقل، تغییر نام یا حذف شده است؟';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$fa extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'رمزنگاری غیرفعال شد';
  @override
  String get content => 'اکنون ارتباط از طریق پروتکل HTTP رمزنگاری نشده صورت می‌گیرد. برای استفاده از HTTPS، رمزنگاری را دوباره فعال کنید.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$fa extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$fa extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'علاقه‌مندی‌ها';
  @override
  String get noFavorites => 'هنوز دستگاه مورد علاقه‌ای انتخاب نشده است.';
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
  String content({required Object name}) => 'واقعاً می‌خواهید از علاقه‌مندی‌ها حذف کنید "${name}"?';
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
  String get name => 'نام مستعار';
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
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'لوکال‌سند نمی‌تواند دستگاه‌های دیگر را بدون داشتن مجوز اسکن شبکه محلی پیدا کند. لطفاً این مجوز را در تنظیمات به برنامه بدهید.';
  @override
  String get gotoSettings => 'تنظیمات';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$fa extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پیام را بنویسید';
  @override
  String get multiline => 'چند خطی';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$fa extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فایلی انتخاب نشده';
  @override
  String get content => 'لطفا حداقل یک پرونده را انتخاب کنید.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$fa extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بدون مجوز';
  @override
  String get content => 'شما مجوزهای مورد نیاز را اعطا نکرده‌اید. لطفاً آنها را در تنظیمات مجوزدهی کنید.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$fa extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'در دسترس نیست';
  @override
  String get content => 'این ویژگی فقط در دسترس است در:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$fa extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR کد';
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
  String get padZero => 'همگام سازی نام‌ها با افزودن صفر';
  @override
  String get sortBeforeCount => 'از قبل بر اساس حروف الفبا مرتب کنید';
  @override
  String get random => 'تصادفی';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$fa extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'درخواست‌ها به صورت خودکار پذیرفته می‌شوند. توجه داشته باشید که همه افراد در شبکه محلی می‌توانند برای شما پرونده ارسال کنند.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$fa extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'درخواست‌ها به طور خودکار از دستگاه‌های موجود در فهرست موردعلاقه‌ها پذیرفته می‌شود.',
    'هشدار: این روش در حال حاضر کاملاً ایمن نیست، زیرا در صورت دسترسی هکر به دستگاه‌های موجود در فهرست موردعلاقه‌ها، می‌تواند بدون محدودیت برای شما پرونده ارسال کند.',
    'با این حال، این گزینه هنوز هم ایمن‌تر از اجازه دادن به همه کاربران در شبکه محلی برای ارسال پرونده بدون محدودیت است.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$fa extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پین را وارد کنید';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$fa extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$fa._(TranslationsFa root) : this._root = root, super.internal(root);

  final TranslationsFa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'حالت‌های ارسال';
  @override
  String get single => 'پرونده‌ها را به یک گیرنده ارسال می‌کند. فهرست انتخاب شده‌ها پس از اتمام انتقال پرونده پاک می‌شود.';
  @override
  String get multiple => 'پرونده‌ها را برای چندین گیرنده ارسال می‌کند. فهرست انتخاب شده‌ها پاک نخواهد شد.';
  @override
  String get link => 'گیرندگانی که لوکال‌سند را نصب نکرده اند، می‌توانند پرونده‌ها را با باز کردن پیوند در مرورگر خود دانلود کنند.';
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
  String get filtered => 'فیلتر شده';
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
