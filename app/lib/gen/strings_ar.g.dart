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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ar,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ar>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAr _root = this; // ignore: unused_field

  @override
  TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'العربية';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ar general = _Translations$general$ar._(_root);
  @override
  late final _Translations$receiveTab$ar receiveTab = _Translations$receiveTab$ar._(_root);
  @override
  late final _Translations$sendTab$ar sendTab = _Translations$sendTab$ar._(_root);
  @override
  late final _Translations$settingsTab$ar settingsTab = _Translations$settingsTab$ar._(_root);
  @override
  late final _Translations$troubleshootPage$ar troubleshootPage = _Translations$troubleshootPage$ar._(_root);
  @override
  late final _Translations$receiveHistoryPage$ar receiveHistoryPage = _Translations$receiveHistoryPage$ar._(_root);
  @override
  late final _Translations$apkPickerPage$ar apkPickerPage = _Translations$apkPickerPage$ar._(_root);
  @override
  late final _Translations$selectedFilesPage$ar selectedFilesPage = _Translations$selectedFilesPage$ar._(_root);
  @override
  late final _Translations$receivePage$ar receivePage = _Translations$receivePage$ar._(_root);
  @override
  late final _Translations$receiveOptionsPage$ar receiveOptionsPage = _Translations$receiveOptionsPage$ar._(_root);
  @override
  late final _Translations$sendPage$ar sendPage = _Translations$sendPage$ar._(_root);
  @override
  late final _Translations$progressPage$ar progressPage = _Translations$progressPage$ar._(_root);
  @override
  late final _Translations$webSharePage$ar webSharePage = _Translations$webSharePage$ar._(_root);
  @override
  late final _Translations$aboutPage$ar aboutPage = _Translations$aboutPage$ar._(_root);
  @override
  late final _Translations$donationPage$ar donationPage = _Translations$donationPage$ar._(_root);
  @override
  late final _Translations$changelogPage$ar changelogPage = _Translations$changelogPage$ar._(_root);
  @override
  late final _Translations$aliasGenerator$ar aliasGenerator = _Translations$aliasGenerator$ar._(_root);
  @override
  late final _Translations$dialogs$ar dialogs = _Translations$dialogs$ar._(_root);
  @override
  late final _Translations$sanitization$ar sanitization = _Translations$sanitization$ar._(_root);
  @override
  late final _Translations$tray$ar tray = _Translations$tray$ar._(_root);
  @override
  late final _Translations$web$ar web = _Translations$web$ar._(_root);
  @override
  late final _Translations$assetPicker$ar assetPicker = _Translations$assetPicker$ar._(_root);
  @override
  late final _Translations$networkInterfacesPage$ar networkInterfacesPage = _Translations$networkInterfacesPage$ar._(_root);
}

// Path: general
class _Translations$general$ar extends Translations$general$en {
  _Translations$general$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'اقبل';
  @override
  String get accepted => 'قُبلت';
  @override
  String get add => 'إضافة';
  @override
  String get advanced => 'متقدم';
  @override
  String get cancel => 'ألغِ';
  @override
  String get close => 'أغلِق';
  @override
  String get confirm => 'أكِّد';
  @override
  String get continueStr => 'أكمل';
  @override
  String get copy => 'انسخ';
  @override
  String get copiedToClipboard => 'نُسخ إلى الحافظة';
  @override
  String get decline => 'ارفض';
  @override
  String get done => 'تم';
  @override
  String get delete => 'احذف';
  @override
  String get edit => 'عدِّل';
  @override
  String get error => 'خطأ';
  @override
  String get example => 'مثال';
  @override
  String get files => 'ملفات';
  @override
  String get finished => 'انتهى';
  @override
  String get hide => 'أخفِ';
  @override
  String get off => 'إيقاف';
  @override
  String get offline => 'غير متصل بالانترنت';
  @override
  String get on => 'تشغيل';
  @override
  String get online => 'متصل بالانترنت';
  @override
  String get open => 'افتح';
  @override
  String get queue => 'صفّ';
  @override
  String get quickSave => 'حفظ سريع';
  @override
  String get quickSaveFromFavorites => 'حفظ سريع لـ "المفضلات"';
  @override
  String get renamed => 'اعادة تسمية';
  @override
  String get reset => 'إعادة ضبط';
  @override
  String get restart => 'إعادة تشغيل';
  @override
  String get settings => 'الإعدادات';
  @override
  String get skipped => 'تم تخطيه';
  @override
  String get start => 'ابدأ';
  @override
  String get stop => 'قف';
  @override
  String get save => 'احفظ';
  @override
  String get unchanged => 'دون تغيير';
  @override
  String get unknown => 'مجهول';
  @override
  String get noItemInClipboard => 'لا توجد عناصر في الحافظة.';
}

// Path: receiveTab
class _Translations$receiveTab$ar extends Translations$receiveTab$en {
  _Translations$receiveTab$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'استلام';
  @override
  late final _Translations$receiveTab$infoBox$ar infoBox = _Translations$receiveTab$infoBox$ar._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ar quickSave = _Translations$receiveTab$quickSave$ar._(_root);
}

// Path: sendTab
class _Translations$sendTab$ar extends Translations$sendTab$en {
  _Translations$sendTab$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إرسال';
  @override
  late final _Translations$sendTab$selection$ar selection = _Translations$sendTab$selection$ar._(_root);
  @override
  late final _Translations$sendTab$picker$ar picker = _Translations$sendTab$picker$ar._(_root);
  @override
  String get shareIntentInfo => 'يمكنك أيضًا استخدام ميزة "مشاركة" بجهازك المحمول لتحديد الملفات بسهولة.';
  @override
  String get nearbyDevices => 'الأجهزة القريبة';
  @override
  String get thisDevice => 'هذا الجهاز';
  @override
  String get scan => 'ابحث عن أجهزة';
  @override
  String get manualSending => 'الإرسال اليدوي';
  @override
  String get sendMode => 'وضع الإرسال';
  @override
  late final _Translations$sendTab$sendModes$ar sendModes = _Translations$sendTab$sendModes$ar._(_root);
  @override
  String get sendModeHelp => 'شرح';
  @override
  String get help => 'يُرجى التأكد من أن الهدف المطلوب موجود أيضًا في نفس شبكة الواي فاي.';
  @override
  String get placeItems => 'ضع العناصر للمشاركة.';
}

// Path: settingsTab
class _Translations$settingsTab$ar extends Translations$settingsTab$en {
  _Translations$settingsTab$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'الإعدادات';
  @override
  late final _Translations$settingsTab$general$ar general = _Translations$settingsTab$general$ar._(_root);
  @override
  late final _Translations$settingsTab$receive$ar receive = _Translations$settingsTab$receive$ar._(_root);
  @override
  late final _Translations$settingsTab$send$ar send = _Translations$settingsTab$send$ar._(_root);
  @override
  late final _Translations$settingsTab$network$ar network = _Translations$settingsTab$network$ar._(_root);
  @override
  late final _Translations$settingsTab$other$ar other = _Translations$settingsTab$other$ar._(_root);
  @override
  String get advancedSettings => 'الإعدادات المتقدمة';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ar extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'حل المشكلات';
  @override
  String get subTitle => 'هل هذا التطبيق لا يعمل كما هو متوقع؟ هنا يمكنك العثور على الحلول الشائعة.';
  @override
  String get solution => 'الحل:';
  @override
  String get fixButton => 'إصلاح تلقائيًا';
  @override
  late final _Translations$troubleshootPage$firewall$ar firewall = _Translations$troubleshootPage$firewall$ar._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ar noDiscovery = _Translations$troubleshootPage$noDiscovery$ar._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ar noConnection = _Translations$troubleshootPage$noConnection$ar._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ar extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'التاريخ';
  @override
  String get openFolder => 'افتح المجلد';
  @override
  String get deleteHistory => 'احذف التاريخ';
  @override
  String get empty => 'التاريخ فارغ.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$ar entryActions = _Translations$receiveHistoryPage$entryActions$ar._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ar extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'التطبيقات (APK)';
  @override
  String get excludeSystemApps => 'استبعاد التطبيقات النظام';
  @override
  String get excludeAppsWithoutLaunchIntent => 'استبعاد التطبيقات غير القابلة للتشغيل';
  @override
  String apps({required Object n}) => '${n} تطبيق';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ar extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'احذف الكل';
}

// Path: receivePage
class _Translations$receivePage$ar extends Translations$receivePage$en {
  _Translations$receivePage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(
    n,
    one: 'يريد أن يرسل لك ملف',
    other: 'يريد أن يرسل لك ${n} ملفات',
  );
  @override
  String get subTitleMessage => 'أرسل لك رسالة:';
  @override
  String get subTitleLink => 'أرسل لك ارتباط:';
  @override
  String get canceled => 'أُلغِيَ المرسل الطلب.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$ar extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'خيارات';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(مجلد LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'تم إيقافه تلقائيًا لوجود مجلدات.';
}

// Path: sendPage
class _Translations$sendPage$ar extends Translations$sendPage$en {
  _Translations$sendPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'بإنتظار الرد…';
  @override
  String get rejected => 'المستلم رفض الطلب.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'المستلم مشغول بطلب آخر.';
}

// Path: progressPage
class _Translations$progressPage$ar extends Translations$progressPage$en {
  _Translations$progressPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'جارِ إرسال الملفات';
  @override
  String get titleReceiving => 'جارِ استلام الملفات';
  @override
  String get savedToGallery => 'حُفظ في الصور';
  @override
  late final _Translations$progressPage$total$ar total = _Translations$progressPage$total$ar._(_root);
  @override
  late final _Translations$progressPage$remainingTime$ar remainingTime = _Translations$progressPage$remainingTime$ar._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ar extends Translations$webSharePage$en {
  _Translations$webSharePage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'مشاركة عبر الرابط';
  @override
  String get loading => 'جارِ بدء الخادم…';
  @override
  String get stopping => 'جارِ إيقاف الخادم…';
  @override
  String get error => 'حدث خطأ أثناء بدء الخادم.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(
    n,
    one: 'افتح هذا الرابط في المتصفح:',
    other: 'افتح أحد هذه الروابط في المتصفح:',
  );
  @override
  String get requests => 'الطلبات';
  @override
  String get noRequests => 'لا يوجد طلبات حتى الآن.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'قبول الطلبات تلقائيًا';
  @override
  String get requirePin => 'يتطلب رمز PIN';
  @override
  String pinHint({required Object pin}) => 'رمز PIN هو "${pin}"';
  @override
  String get encryptionHint => 'يستخدم تطبيق LocalSend شهادة موقع ذاتية التوقيع. يجب عليك قبولها في المتصفح.';
  @override
  String pendingRequests({required Object n}) => 'الطلبات المعلقة: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$ar extends Translations$aboutPage$en {
  _Translations$aboutPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عن LocalSend';
  @override
  List<String> get description => [
    'LocalSend هو تطبيق مجاني مفتوح المصدر يسمح لك بمشاركة الملفات والرسائل بشكل آمن مع الأجهزة القريبة عبر شبكتك المحلية دون الحاجة إلى اتصال بالإنترنت.',
    'هذا التطبيق متاح على أنظمة Android وiOS وmacOS وWindows وLinux. يمكنك العثور على جميع خيارات التنزيل على الصفحة الرئيسية الرسمية.',
  ];
  @override
  String get author => 'المؤلف';
  @override
  String get contributors => 'المساهمون';
  @override
  String get packagers => 'محزمي التطبيقات';
  @override
  String get translators => 'المترجمون';
}

// Path: donationPage
class _Translations$donationPage$ar extends Translations$donationPage$en {
  _Translations$donationPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تبرّع';
  @override
  String get info => 'LocalSend مجاني ومفتوح المصدر وبدون أي إعلانات. إذا أعجبك التطبيق، يمكنك دعم التطوير بالتبرع.';
  @override
  String donate({required Object amount}) => 'تبرّع ${amount}';
  @override
  String get thanks => 'شكراً جزيلاً!';
  @override
  String get restore => 'استعادة شراء';
}

// Path: changelogPage
class _Translations$changelogPage$ar extends Translations$changelogPage$en {
  _Translations$changelogPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'سجل التغييرات';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$ar extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'محبوب',
    'جميل',
    'كبير',
    'ساطع',
    'نظيف',
    'ذكي',
    'رائع',
    'جذاب',
    'ماكر',
    'مصمم',
    'نشيط',
    'فعال',
    'خيالي',
    'سريع',
    'جيد',
    'طازج',
    'حسن',
    'خلاب',
    'رائع',
    'جميل المظهر',
    'حار',
    'حنون',
    'محبوب',
    'صوفي',
    'مرتب',
    'لطيف',
    'صبور',
    'جميل',
    'قوي',
    'ثري',
    'سري',
    'ذكي',
    'صلب',
    'مميز',
    'استراتيجي',
    'قوي',
    'مرتب',
    'حكيم',
  ];
  @override
  List<String> get fruits => [
    'تفاح',
    'أفوكادو',
    'موز',
    'بلاك بيري',
    'توت',
    'بروكلي',
    'جزر',
    'كرز',
    'جوز الهند',
    'عنب',
    'ليمون',
    'خَسّ',
    'مانجو',
    'شمام',
    'فطر',
    'بصل',
    'برتقال',
    'بابايا',
    'خَوخ',
    'إجاص',
    'أناناس',
    'بطاطس',
    'يقطين',
    'توت العُليق',
    'فراولة',
    'طماطم',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$ar extends Translations$dialogs$en {
  _Translations$dialogs$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ar addFile = _Translations$dialogs$addFile$ar._(_root);
  @override
  late final _Translations$dialogs$openFile$ar openFile = _Translations$dialogs$openFile$ar._(_root);
  @override
  late final _Translations$dialogs$addressInput$ar addressInput = _Translations$dialogs$addressInput$ar._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ar cancelSession = _Translations$dialogs$cancelSession$ar._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ar cannotOpenFile = _Translations$dialogs$cannotOpenFile$ar._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ar encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ar._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ar errorDialog = _Translations$dialogs$errorDialog$ar._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ar favoriteDialog = _Translations$dialogs$favoriteDialog$ar._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ar favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ar._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ar favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ar._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ar fileInfo = _Translations$dialogs$fileInfo$ar._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ar fileNameInput = _Translations$dialogs$fileNameInput$ar._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ar historyClearDialog = _Translations$dialogs$historyClearDialog$ar._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ar localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ar._(_root);
  @override
  late final _Translations$dialogs$messageInput$ar messageInput = _Translations$dialogs$messageInput$ar._(_root);
  @override
  late final _Translations$dialogs$noFiles$ar noFiles = _Translations$dialogs$noFiles$ar._(_root);
  @override
  late final _Translations$dialogs$noPermission$ar noPermission = _Translations$dialogs$noPermission$ar._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ar notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ar._(_root);
  @override
  late final _Translations$dialogs$qr$ar qr = _Translations$dialogs$qr$ar._(_root);
  @override
  late final _Translations$dialogs$quickActions$ar quickActions = _Translations$dialogs$quickActions$ar._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ar quickSaveNotice = _Translations$dialogs$quickSaveNotice$ar._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ar quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ar._(_root);
  @override
  late final _Translations$dialogs$pin$ar pin = _Translations$dialogs$pin$ar._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ar sendModeHelp = _Translations$dialogs$sendModeHelp$ar._(_root);
  @override
  late final _Translations$dialogs$zoom$ar zoom = _Translations$dialogs$zoom$ar._(_root);
}

// Path: sanitization
class _Translations$sanitization$ar extends Translations$sanitization$en {
  _Translations$sanitization$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'لا يمكن أن يكون اسم الملف فارغًا';
  @override
  String get invalid => 'يحتوي اسم الملف على أحرف غير صالحة';
}

// Path: tray
class _Translations$tray$ar extends Translations$tray$en {
  _Translations$tray$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'أنهِ LocalSend';
  @override
  String get closeWindows => 'اخرج';
}

// Path: web
class _Translations$web$ar extends Translations$web$en {
  _Translations$web$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'أدخل رمز PIN';
  @override
  String get invalidPin => 'رمز PIN غير صالح';
  @override
  String get tooManyAttempts => 'محاولات كثيرة جدًا';
  @override
  String get rejected => 'رُفض';
  @override
  String get files => 'الملفات';
  @override
  String get fileName => 'اسم الملف';
  @override
  String get size => 'الحجم';
}

// Path: assetPicker
class _Translations$assetPicker$ar extends Translations$assetPicker$en {
  _Translations$assetPicker$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'أكّد';
  @override
  String get cancel => 'ألغِ';
  @override
  String get edit => 'عدّل';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'فشل التحميل';
  @override
  String get original => 'أصلي';
  @override
  String get preview => 'معاينة';
  @override
  String get select => 'حدّد';
  @override
  String get emptyList => 'القائمة فارغة';
  @override
  String get unSupportedAssetType => 'نوع الملف غير مدعوم.';
  @override
  String get unableToAccessAll => 'لا يمكن الوصول إلى جميع الملفات الموجودة على الجهاز';
  @override
  String get viewingLimitedAssetsTip => 'إظهار الملفات والألبومات التي يمكن للتطبيق الوصول إليها فقط.';
  @override
  String get changeAccessibleLimitedAssets => 'انقر لتحديث الملفات التي يمكن الوصول إليها';
  @override
  String get accessAllTip =>
      'يمكن للتطبيق الوصول فقط إلى بعض الملفات على الجهاز. اذهب إلى إعدادات النظام واسمح للتطبيق بالوصول إلى جميع الوسائط على الجهاز.';
  @override
  String get goToSystemSettings => 'اذهب إلى إعدادات النظام';
  @override
  String get accessLimitedAssets => 'استمر بوصول محدود';
  @override
  String get accessiblePathName => 'ملفات يمكن الوصول إليها';
  @override
  String get sTypeAudioLabel => 'صوتي';
  @override
  String get sTypeImageLabel => 'صورة';
  @override
  String get sTypeVideoLabel => 'فيديو';
  @override
  String get sTypeOtherLabel => 'وسائط أخرى';
  @override
  String get sActionPlayHint => 'شغِّل';
  @override
  String get sActionPreviewHint => 'معاينة';
  @override
  String get sActionSelectHint => 'حدّد';
  @override
  String get sActionSwitchPathLabel => 'غيّر المسار';
  @override
  String get sActionUseCameraHint => 'استخدم الكاميرا';
  @override
  String get sNameDurationLabel => 'مدة';
  @override
  String get sUnitAssetCountLabel => 'عدد';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ar extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get whitelist => 'القائمة البيضاء';
  @override
  String get title => 'واجهات الشبكة';
  @override
  String get blacklist => 'القائمة السوداء';
  @override
  String get info =>
      'بشكل افتراضي، يستخدم LocalSend جميع واجهات الشبكة المتاحة. يمكنك استبعاد الشبكات غير المرغوب فيها هنا. تحتاج إلى إعادة تشغيل الخادم لتطبيق التغييرات.';
  @override
  String get preview => 'معاينة';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$ar extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'منفذ:';
  @override
  String get alias => 'اسم الجهاز:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$ar extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'المفضلات';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ar extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اختيار';
  @override
  String files({required Object files}) => 'ملفات: ${files}';
  @override
  String size({required Object size}) => 'حجم: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$ar extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ملف';
  @override
  String get folder => 'مجلد';
  @override
  String get media => 'وسائط';
  @override
  String get text => 'نص';
  @override
  String get app => 'تطبيق';
  @override
  String get clipboard => 'لصق';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$ar extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'مستلم واحد';
  @override
  String get multiple => 'متعدد المستلمين';
  @override
  String get link => 'مشاركة عبر الرابط';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$ar extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عام';
  @override
  String get brightness => 'السمة';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ar brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ar._(
    _root,
  );
  @override
  String get color => 'اللون';
  @override
  late final _Translations$settingsTab$general$colorOptions$ar colorOptions = _Translations$settingsTab$general$colorOptions$ar._(_root);
  @override
  String get language => 'اللغة';
  @override
  late final _Translations$settingsTab$general$languageOptions$ar languageOptions = _Translations$settingsTab$general$languageOptions$ar._(_root);
  @override
  String get saveWindowPlacement => 'إنهاء: حفظ موقع النافذة';
  @override
  String get saveWindowPlacementWindows => 'حفظ موضع النافذة بعد الخروج';
  @override
  String get minimizeToTray => 'إنهاء : أخفاء في شريط المهام';
  @override
  String get launchAtStartup => 'تشغيل تلقائي بعد تسجيل الدخول';
  @override
  String get launchMinimized => 'تشغيل تلقائي: ابدأ مخفيًا';
  @override
  String get showInContextMenu => 'إظهار LocalSend في قائمة السياق';
  @override
  String get animations => 'الرسوم المتحركة';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$ar extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'استلم';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'إنهاء تلقائي';
  @override
  String get destination => 'احفظ في المجلد';
  @override
  String get downloads => '(التنزيلات)';
  @override
  String get saveToGallery => 'حفظ الوسائط في المعرض';
  @override
  String get saveToHistory => 'حفظ في التاريخ';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$ar extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أرسِل';
  @override
  String get shareViaLinkAutoAccept => 'المشاركة عبر الرابط: قبول تلقائي';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ar extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'شبكة الاتصال';
  @override
  String get needRestart => 'أعد تشغيل الخادم لتطبيق الإعدادات!';
  @override
  String get server => 'الخادم';
  @override
  String get alias => 'اسم مستعار';
  @override
  String get deviceType => 'نوع الجهاز';
  @override
  String get deviceModel => 'نموذج الجهاز';
  @override
  String get port => 'منفذ';
  @override
  String get discoveryTimeout => 'مهلة الاكتشاف';
  @override
  String get useSystemName => 'استخدم اسم النظام';
  @override
  String get generateRandomAlias => 'ولّد كنية عشوائية';
  @override
  String portWarning({required Object defaultPort}) =>
      'ربما لا يتم الكشف عنك من قبل الأجهزة الأخرى لأنك تستخدم منفذ مخصص. (الافتراضي: ${defaultPort})';
  @override
  String get encryption => 'التعمية';
  @override
  String get multicastGroup => 'فرق البث المتعدد';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ربما لا يتم الكشف عنك من قبل الأجهزة الأخرى لأنك تستخدم عنوان بث متعدد مخصص. (الافتراضي: ${defaultMulticast})';
  @override
  late final _Translations$settingsTab$network$networkOptions$ar networkOptions = _Translations$settingsTab$network$networkOptions$ar._(_root);
  @override
  String get network => 'الشبكة';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ar extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أخرى';
  @override
  String get support => 'دعم LocalSend';
  @override
  String get donate => 'تبرّع';
  @override
  String get privacyPolicy => 'سياسة الخصوصيّة';
  @override
  String get termsOfUse => 'شروط الاستخدام';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$ar extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'يمكن لهذا التطبيق إرسال الملفات إلى الأجهزة الأخرى ولكن الأجهزة الأخرى لا يمكنها إرسال الملفات إلى هذا الجهاز.';
  @override
  String solution({required Object port}) =>
      'هذه المشكلة عادة ما تكون مشكلة في جدار الحماية. يمكنك حل هذه المشكلة عن طريق السماح بالاتصالات الواردة (UDP و TCP) على المنفذ ${port}.';
  @override
  String get openFirewall => 'افتح جدار الحماية';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ar extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'هذا الجهاز لا يمكنه اكتشاف الأجهزة الأخرى.';
  @override
  String get solution =>
      'يُرجى التأكد من أن جميع الأجهزة متصلة بنفس شبكة الواي فاي وتشارك نفس التكوين (المنفذ، عنوان البث المتعدد، التعمية). يمكنك محاولة كتابة عنوان IP للجهاز المستهدف يدويًا. إذا نجح ذلك، فكر في إضافة هذا الجهاز إلى قائمة المفضلات حتى يتم اكتشافه تلقائيًا في المستقبل.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ar extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'لا يمكن للجهازين اكتشاف بعضهما البعض ولا يمكنهما مشاركة الملفات.';
  @override
  String get solution =>
      'هل المشكلة موجودة على كِلا الجانبين؟ إذا كان الأمر كذلك، يجب التأكد من أن كِلا الجهازين متصلان بنفس شبكة الواي فاي ويشتركان في نفس الإعدادات (المنفذ، عنوان البث المتعدد، التعمية). قد تمنع شبكة الواي فاي الاتصال بين المشاركين بسبب عزل نقطة الوصول (AP Isolation). في هذه الحالة، يجب تعطيل هذا الخيار على الراوتر.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ar extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'افتح الملف';
  @override
  String get showInFolder => 'اعرض في المجلد';
  @override
  String get info => 'معلومات';
  @override
  String get deleteFromHistory => 'احذف من التاريخ';
}

// Path: progressPage.total
class _Translations$progressPage$total$ar extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ar title = _Translations$progressPage$total$title$ar._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ملفات: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'حجم: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'سرعة: ${speed}/ثانية';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$ar extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// استخدم 'س' لاختصار الساعات و'د' للدقائق
  @override
  String hours({required Object h, required Object m}) => '${h}س ${m}د';

  /// استخدم 'ي' للأيام، و'س' للساعات، و'د' للدقائق
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}ي ${h}س ${m}د';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ar extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أضف إلى الاختيار';
  @override
  String get content => 'ماذا تريد أن تضيف؟';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ar extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'افتح الملف';
  @override
  String get content => 'هل تريد فتح الملف المُستلم؟';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ar extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أدخل العنوان';
  @override
  String get hashtag => 'رابطة هاشتاق';
  @override
  String get ip => 'عنوان IP';
  @override
  String get recentlyUsed => 'المستخدمة حديثًا: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$ar extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ألغِ نقل الملف';
  @override
  String get content => 'هل تريد حقًا إلغاء نقل الملف؟';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ar extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'لا يمكن فتح الملف';
  @override
  String content({required Object file}) => 'تعذر فتح "${file}". هل نُقل هذا الملف أو إعادة تسميته أو حذفه؟';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ar extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'التعمية مُعطّلة';
  @override
  String get content => 'الاتصال يتم الآن عبر بروتوكول HTTP غير المُعمّى. لاستخدام HTTPS، فعِّل التعمية مرة أخرى.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ar extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ar extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'المفضلات';
  @override
  String get noFavorites => 'لا توجد أجهزة مفضلة بعد.';
  @override
  String get addFavorite => 'أضف';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$ar extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'احذف من المفضلات';
  @override
  String content({required Object name}) => 'هل ترغب حقًا في حذف "${name}" من المفضلات؟';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ar extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'أضف إلى المفضلات';
  @override
  String get titleEdit => 'اﻹعدادات';
  @override
  String get name => 'اسم الجهاز';
  @override
  String get auto => '(تلقائي)';
  @override
  String get ip => 'عنوان IP';
  @override
  String get port => 'المنفذ';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$ar extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'معلومات الملف';
  @override
  String get fileName => 'اسم الملف:';
  @override
  String get path => 'المسار:';
  @override
  String get size => 'الحجم:';
  @override
  String get sender => 'المرسل:';
  @override
  String get time => 'الوقت:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$ar extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أدخل اسم الملف';
  @override
  String original({required Object original}) => 'أصلي: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ar extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'امسح التاريخ';
  @override
  String get content => 'هل ترغب حقًا في مسح التاريخ بالكامل؟';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ar extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'لا يمكن ل LocalSend العثور على الأجهزة الأخرى بدون الإذن بفحص الشبكة المحلية. يُرجى منح هذا الإذن في الإعدادات.';
  @override
  String get gotoSettings => 'الإعدادات';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ar extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اكتب رسالة';
  @override
  String get multiline => 'متعدد الأسطر';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ar extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'لم يتم اختيار اي ملف';
  @override
  String get content => 'الرجاء تحديد ملف واحد على الأقل.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ar extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بدون إذن';
  @override
  String get content => 'لم تمنح الأذونات اللازمة. يُرجى منحها في الإعدادات.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ar extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'غير متاح';
  @override
  String get content => 'هذه الميزة متاحة فقط على:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ar extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'رمز QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ar extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إجراءات سريعة';
  @override
  String get counter => 'عداد';
  @override
  String get prefix => 'بادئة';
  @override
  String get padZero => 'احشو مع أصفار';
  @override
  String get sortBeforeCount => 'افرز أبجديًا مسبقًا (أ-ي)';
  @override
  String get random => 'عشوائي';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$ar extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'يتم قبول طلبات الملفات تلقائيًا. اعلم أن كل فرد في الشبكة المحلية يمكنه إرسال الملفات إليك.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ar extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'يتم الآن قبول طلبات الملفات تلقائيًا من الأجهزة الموجودة في قائمة المفضلات لديك.',
    'تحذير! في الوقت الحالي، هذا ليس آمنًا تمامًا، حيث يمكن للمخترق الذي لديه بصمة أي جهاز من قائمة المفضلات لديك أن يرسل لك ملفات دون قيود.',
    'ومع ذلك، يظل هذا الخيار أكثر أمانًا من السماح لجميع المستخدمين على الشبكة المحلية بإرسال الملفات إليك دون قيود.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$ar extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أدخل رمز PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ar extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أوضاع الإرسال';
  @override
  String get single => 'يقوم بإرسال الملفات إلى مستلم واحد. سيتم مسح الاختيار بعد انتهاء نقل الملف.';
  @override
  String get multiple => 'يرسل الملفات إلى عدة مستلمين. لن يتم مسح التحديد بعد الانتهاء من نقل الملفات.';
  @override
  String get link => 'يمكن للمستلمين الذين لا يحتوون على LocalSend تنزيل الملفات المحددة عن طريق فتح الرابط في متصفحهم.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ar extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عنوان URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ar extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'نظام';
  @override
  String get dark => 'داكنة';
  @override
  String get light => 'فاتحة';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$ar extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'النظام';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ar extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'النظام';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ar extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'مُصفاة';
  @override
  String get all => 'الكل';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ar extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'التقدم الكلي (${time})';
  @override
  String get finishedError => 'انتهى مع وجود خطأ';
  @override
  String get canceledSender => 'أُلغِيَ من قِبل المرسل';
  @override
  String get canceledReceiver => 'أُلغِيَ من قِبل المتلقي';
}
