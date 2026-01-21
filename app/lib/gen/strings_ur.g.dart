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
class TranslationsUr extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsUr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.ur,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ur>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsUr _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'اردو';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralUr general = _TranslationsGeneralUr._(_root);
  @override
  late final _TranslationsReceiveTabUr receiveTab = _TranslationsReceiveTabUr._(_root);
  @override
  late final _TranslationsSendTabUr sendTab = _TranslationsSendTabUr._(_root);
  @override
  late final _TranslationsSettingsTabUr settingsTab = _TranslationsSettingsTabUr._(_root);
  @override
  late final _TranslationsTroubleshootPageUr troubleshootPage = _TranslationsTroubleshootPageUr._(_root);
  @override
  late final _TranslationsReceiveHistoryPageUr receiveHistoryPage = _TranslationsReceiveHistoryPageUr._(_root);
  @override
  late final _TranslationsApkPickerPageUr apkPickerPage = _TranslationsApkPickerPageUr._(_root);
  @override
  late final _TranslationsSelectedFilesPageUr selectedFilesPage = _TranslationsSelectedFilesPageUr._(_root);
  @override
  late final _TranslationsReceivePageUr receivePage = _TranslationsReceivePageUr._(_root);
  @override
  late final _TranslationsReceiveOptionsPageUr receiveOptionsPage = _TranslationsReceiveOptionsPageUr._(_root);
  @override
  late final _TranslationsSendPageUr sendPage = _TranslationsSendPageUr._(_root);
  @override
  late final _TranslationsProgressPageUr progressPage = _TranslationsProgressPageUr._(_root);
  @override
  late final _TranslationsWebSharePageUr webSharePage = _TranslationsWebSharePageUr._(_root);
  @override
  late final _TranslationsAboutPageUr aboutPage = _TranslationsAboutPageUr._(_root);
  @override
  late final _TranslationsDonationPageUr donationPage = _TranslationsDonationPageUr._(_root);
  @override
  late final _TranslationsChangelogPageUr changelogPage = _TranslationsChangelogPageUr._(_root);
  @override
  late final _TranslationsAliasGeneratorUr aliasGenerator = _TranslationsAliasGeneratorUr._(_root);
  @override
  late final _TranslationsDialogsUr dialogs = _TranslationsDialogsUr._(_root);
  @override
  late final _TranslationsSanitizationUr sanitization = _TranslationsSanitizationUr._(_root);
  @override
  late final _TranslationsTrayUr tray = _TranslationsTrayUr._(_root);
  @override
  late final _TranslationsWebUr web = _TranslationsWebUr._(_root);
  @override
  late final _TranslationsAssetPickerUr assetPicker = _TranslationsAssetPickerUr._(_root);
}

// Path: general
class _TranslationsGeneralUr extends TranslationsGeneralEn {
  _TranslationsGeneralUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'قبول کریں';
  @override
  String get accepted => 'قبول کر لیا';
  @override
  String get add => 'شامل کریں';
  @override
  String get advanced => 'اعلی درجے کی';
  @override
  String get cancel => 'منسوخ کریں';
  @override
  String get close => 'بند کریں';
  @override
  String get confirm => 'تصدیق کریں';
  @override
  String get continueStr => 'جاری رہے';
  @override
  String get copy => 'کاپی';
  @override
  String get copiedToClipboard => 'کلپ بورڈ پر کاپی کیا گیا';
  @override
  String get decline => 'رد کرنا';
  @override
  String get done => 'ہو گیا';
  @override
  String get delete => 'حذف کریں';
  @override
  String get edit => 'ترمیم';
  @override
  String get error => 'خرابی';
  @override
  String get example => 'مثال';
  @override
  String get files => 'فائلوں';
  @override
  String get finished => 'ختم';
  @override
  String get hide => 'چھپائیں';
  @override
  String get off => 'بند';
  @override
  String get offline => 'آف لائن';
  @override
  String get on => 'پر';
  @override
  String get online => 'آن لائن';
  @override
  String get open => 'کھولیں';
  @override
  String get queue => 'قطار';
  @override
  String get quickSave => 'فوری محفوظ کریں';
  @override
  String get renamed => 'نام تبدیل کر دیا گیا';
  @override
  String get reset => 'دوبارہ ترتیب دیں';
  @override
  String get restart => 'دوبارہ شروع کریں';
  @override
  String get settings => 'ترتیبات';
  @override
  String get skipped => 'چھوڑ دیا';
  @override
  String get start => 'شروع کریں';
  @override
  String get stop => 'رک جاؤ';
  @override
  String get save => 'محفوظ کریں';
  @override
  String get unchanged => 'غیر تبدیل شدہ';
  @override
  String get unknown => 'نامعلوم';
  @override
  String get noItemInClipboard => 'کلپ بورڈ میں کوئی آئٹم نہیں ہے۔';
}

// Path: receiveTab
class _TranslationsReceiveTabUr extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'وصول کریں';
  @override
  late final _TranslationsReceiveTabInfoBoxUr infoBox = _TranslationsReceiveTabInfoBoxUr._(_root);
}

// Path: sendTab
class _TranslationsSendTabUr extends TranslationsSendTabEn {
  _TranslationsSendTabUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بھیجیں';
  @override
  late final _TranslationsSendTabSelectionUr selection = _TranslationsSendTabSelectionUr._(_root);
  @override
  late final _TranslationsSendTabPickerUr picker = _TranslationsSendTabPickerUr._(_root);
  @override
  String get shareIntentInfo => 'آپ اپنے موبائل ڈیوائس کی "شیئر کریں" فیچر کو بھی آسانی سے فائلوں کو منتخب کرنے کے لیے استعمال کرسکتے ہیں۔';
  @override
  String get nearbyDevices => 'قریبی ڈیوائس';
  @override
  String get thisDevice => 'یہ ڈیوائس';
  @override
  String get scan => 'ڈیوائس تلاش کریں';
  @override
  String get manualSending => 'خود بھیجنا';
  @override
  String get sendMode => 'سینڈ موڈ';
  @override
  late final _TranslationsSendTabSendModesUr sendModes = _TranslationsSendTabSendModesUr._(_root);
  @override
  String get sendModeHelp => 'وضاحت';
  @override
  String get help => 'براہ کرم یقینی بنائیں کہ مطلوبہ ہدف بھی اسی وائی فائی نیٹ ورک میں ہے۔';
  @override
  String get placeItems => 'شئیر کرنے کے لیے اشیاء رکھیں۔';
}

// Path: settingsTab
class _TranslationsSettingsTabUr extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ترتیبات';
  @override
  late final _TranslationsSettingsTabGeneralUr general = _TranslationsSettingsTabGeneralUr._(_root);
  @override
  late final _TranslationsSettingsTabReceiveUr receive = _TranslationsSettingsTabReceiveUr._(_root);
  @override
  late final _TranslationsSettingsTabSendUr send = _TranslationsSettingsTabSendUr._(_root);
  @override
  late final _TranslationsSettingsTabNetworkUr network = _TranslationsSettingsTabNetworkUr._(_root);
  @override
  late final _TranslationsSettingsTabOtherUr other = _TranslationsSettingsTabOtherUr._(_root);
  @override
  String get advancedSettings => 'تجاویز شھر کی ترتیبات';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageUr extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'خرابی کا سراغ لگانا';
  @override
  String get subTitle => 'کیا یہ ایپ توقع کے مطابق کام نہیں کرتی؟ یہاں آپ عام حل تلاش کر سکتے ہیں۔';
  @override
  String get solution => 'حل:';
  @override
  String get fixButton => 'خود بخود درست کریں۔';
  @override
  late final _TranslationsTroubleshootPageFirewallUr firewall = _TranslationsTroubleshootPageFirewallUr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryUr noDiscovery = _TranslationsTroubleshootPageNoDiscoveryUr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionUr noConnection = _TranslationsTroubleshootPageNoConnectionUr._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageUr extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تاریخ';
  @override
  String get openFolder => 'فولڈر کھولیں';
  @override
  String get deleteHistory => 'تاریخ کو حذف کریں';
  @override
  String get empty => 'تاریخ خالی ہے۔';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsUr entryActions = _TranslationsReceiveHistoryPageEntryActionsUr._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageUr extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اپلیکیشنز (APK)';
  @override
  String get excludeSystemApps => 'سسٹم ایپس کو ختم کریں';
  @override
  String get excludeAppsWithoutLaunchIntent => 'غیر لانچ ہونے والے ایپس کو ختم کریں';
  @override
  String apps({required Object n}) => '${n} ایپس';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageUr extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'تمام حذف کریں';
}

// Path: receivePage
class _TranslationsReceivePageUr extends TranslationsReceivePageEn {
  _TranslationsReceivePageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ur'))(
    n,
    one: 'آپ کو ایک فائل بھیجنا چاہتا ہے۔',
    other: 'آپ کو ${n} فائلیں بھیجنا چاہتا ہے۔',
  );
  @override
  String get subTitleMessage => 'آپ کو ایک پیغام بھیجا:';
  @override
  String get subTitleLink => 'آپ کو ایک لنک بھیجا:';
  @override
  String get canceled => 'بھیجنے والے نے درخواست منسوخ کر دی ہے۔';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageUr extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اختیارات';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(${_root.appName} folder)';
  @override
  String get saveToGallery => '. گیلری میں محفوظ کریں${_root.settingsTab.receive.saveToGallery}';
  @override
  String get saveToGalleryOff => 'خود کار طور پر منقطع ہوگیا ہے کیونکہ ڈائریکٹریاں ہیں۔';
}

// Path: sendPage
class _TranslationsSendPageUr extends TranslationsSendPageEn {
  _TranslationsSendPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'جواب کا منتظر...';
  @override
  String get rejected => 'وصول کنندہ نے درخواست مسترد کر دی ہے۔';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'وصول کنندہ دوسری درخواست میں مصروف ہے۔';
}

// Path: progressPage
class _TranslationsProgressPageUr extends TranslationsProgressPageEn {
  _TranslationsProgressPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'فائلیں بھیج رہا ہے';
  @override
  String get titleReceiving => 'فائلیں موصول ہو رہی ہیں';
  @override
  String get savedToGallery => 'تصاویر میں محفوظ کیا گیا';
  @override
  late final _TranslationsProgressPageTotalUr total = _TranslationsProgressPageTotalUr._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageUr extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'لنک کے ذریعے شئیر کریں';
  @override
  String get loading => 'سرور کو چالو کررہا ہے...';
  @override
  String get stopping => 'سرور بند ہو رہا ہے...';
  @override
  String get error => 'سرور چالو کرتے وقت خامی پیش آئی ہے۔';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ur'))(
    n,
    one: 'اس لنک کو براوزر میں کھولیں:',
    other: 'ان میں سے کسی ایک لنک کو براوزر میں کھولیں:',
  );
  @override
  String get requests => 'درخواستیں';
  @override
  String get noRequests => 'ابھی تک کوئی درخواست نہیں۔';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'درخواستیں خود بخود قبول کریں';
  @override
  String get requirePin => 'PIN درکار ہے';
  @override
  String pinHint({required Object pin}) => 'PIN ہے "${pin}"';
  @override
  String get encryptionHint => 'LocalSend براؤزر میں استعمال کرنے کیلئے آپ کوخود سائن کردہ سرٹیفکیٹ قبول کرنا ہوگا۔';
  @override
  String pendingRequests({required Object n}) => 'زیر التواء درخواستیں: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageUr extends TranslationsAboutPageEn {
  _TranslationsAboutPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'کے بارے میں LocalSend';
  @override
  List<String> get description => [
    'LocalSend ایک مفت، اوپن سورس ایپ ہے جو آپ کو انٹرنیٹ کنکشن کی ضرورت کے بغیر اپنے مقامی نیٹ ورک کے ذریعے قریبی آلات کے ساتھ فائلیں اور پیغامات محفوظ طریقے سے شیئر کرنے کی اجازت دیتی ہے۔',
    'یہ ایپ اینڈرائیڈ، iOS، macOS، ونڈوز، اور لینکس پر دستیاب ہے۔ آپ تمام ڈاؤن لوڈ کے اختیارات سرکاری ویب سائٹ پر تلاش کر سکتے ہیں۔',
  ];
  @override
  String get author => 'مصنف';
  @override
  String get contributors => 'تعاون کنندگان';
  @override
  String get packagers => 'پیکجرز';
  @override
  String get translators => 'مترجمین';
}

// Path: donationPage
class _TranslationsDonationPageUr extends TranslationsDonationPageEn {
  _TranslationsDonationPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'عطیہ کریں';
  @override
  String get info =>
      'LocalSend مفت، اوپن سورس ہے اور اس میں کوئی اشتہارات نہیں ہیں۔ اگر آپ کو ایپ پسند ہے، تو آپ عطیہ کے ذریعے ترقی کی حمایت کر سکتے ہیں۔';
  @override
  String donate({required Object amount}) => 'عطیہ کریں ${amount}';
  @override
  String get thanks => 'آپ کا بہت بہت شکریہ!';
  @override
  String get restore => 'خریداری بحال کریں';
}

// Path: changelogPage
class _TranslationsChangelogPageUr extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'چینج لاگ';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorUr extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsUr extends TranslationsDialogsEn {
  _TranslationsDialogsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileUr addFile = _TranslationsDialogsAddFileUr._(_root);
  @override
  late final _TranslationsDialogsAddressInputUr addressInput = _TranslationsDialogsAddressInputUr._(_root);
  @override
  late final _TranslationsDialogsCancelSessionUr cancelSession = _TranslationsDialogsCancelSessionUr._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileUr cannotOpenFile = _TranslationsDialogsCannotOpenFileUr._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeUr encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeUr._(_root);
  @override
  late final _TranslationsDialogsErrorDialogUr errorDialog = _TranslationsDialogsErrorDialogUr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogUr favoriteDialog = _TranslationsDialogsFavoriteDialogUr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogUr favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogUr._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogUr favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogUr._(_root);
  @override
  late final _TranslationsDialogsFileInfoUr fileInfo = _TranslationsDialogsFileInfoUr._(_root);
  @override
  late final _TranslationsDialogsFileNameInputUr fileNameInput = _TranslationsDialogsFileNameInputUr._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogUr historyClearDialog = _TranslationsDialogsHistoryClearDialogUr._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedUr localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedUr._(_root);
  @override
  late final _TranslationsDialogsMessageInputUr messageInput = _TranslationsDialogsMessageInputUr._(_root);
  @override
  late final _TranslationsDialogsNoFilesUr noFiles = _TranslationsDialogsNoFilesUr._(_root);
  @override
  late final _TranslationsDialogsNoPermissionUr noPermission = _TranslationsDialogsNoPermissionUr._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformUr notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformUr._(_root);
  @override
  late final _TranslationsDialogsQrUr qr = _TranslationsDialogsQrUr._(_root);
  @override
  late final _TranslationsDialogsQuickActionsUr quickActions = _TranslationsDialogsQuickActionsUr._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeUr quickSaveNotice = _TranslationsDialogsQuickSaveNoticeUr._(_root);
  @override
  late final _TranslationsDialogsPinUr pin = _TranslationsDialogsPinUr._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpUr sendModeHelp = _TranslationsDialogsSendModeHelpUr._(_root);
  @override
  late final _TranslationsDialogsZoomUr zoom = _TranslationsDialogsZoomUr._(_root);
}

// Path: sanitization
class _TranslationsSanitizationUr extends TranslationsSanitizationEn {
  _TranslationsSanitizationUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'فائل کا نام خالی نہیں ہو سکتا';
  @override
  String get invalid => 'فائل کے نام میں غلط حروف ہیں';
}

// Path: tray
class _TranslationsTrayUr extends TranslationsTrayEn {
  _TranslationsTrayUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'چھوڑو LocalSend';
  @override
  String get closeWindows => 'بند کریں';
}

// Path: web
class _TranslationsWebUr extends TranslationsWebEn {
  _TranslationsWebUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN درج کریں';
  @override
  String get invalidPin => 'غلط PIN';
  @override
  String get tooManyAttempts => 'بہت زیادہ کوششیں';
  @override
  String get rejected => 'منسوخ کردیا';
  @override
  String get files => 'فائلیں';
  @override
  String get fileName => 'فائل کا نام';
  @override
  String get size => 'سائز';
}

// Path: assetPicker
class _TranslationsAssetPickerUr extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'تصدیق کریں';
  @override
  String get cancel => 'منسوخ کریں';
  @override
  String get edit => 'ترمیم کریں';
  @override
  String get gifIndicator => 'جی آئی ایف';
  @override
  String get loadFailed => 'لوڈ نہیں ہوسکی';
  @override
  String get original => 'اصل ';
  @override
  String get preview => 'پیش نظارہ';
  @override
  String get select => 'منتخب کریں';
  @override
  String get emptyList => 'خالی فہرست';
  @override
  String get unSupportedAssetType => 'غیر معتبر فائل کی قسم۔';
  @override
  String get unableToAccessAll => 'یہ ڈیوائس پر تمام فائلوں تک رسائی نہیں ہوسکتی ہے۔';
  @override
  String get viewingLimitedAssetsTip => 'صرف ایپ تک رسائی پذیر فائلوں اور البم کونسیس ہوسکتی ہیں۔';
  @override
  String get changeAccessibleLimitedAssets => 'رسائی پذیر فائلوں کو اپ ڈیٹ کرنے کے لئے کلک کریں';
  @override
  String get accessAllTip =>
      'ایپ صرف چند فائلوں تک رسائی حاصل کرسکتی ہے ڈیوائس پر۔ سسٹم کی ترتیبات میں جائیں اور ایپ کو ڈیوائس پر تمام میڈیا تک رسائی کی اجازت دیں۔';
  @override
  String get goToSystemSettings => 'سسٹم ترتیبات پر جائیں';
  @override
  String get accessLimitedAssets => 'محدود رسائی کے ساتھ جاری رکھیں';
  @override
  String get accessiblePathName => 'رسائی پذیر فائلیں';
  @override
  String get sTypeAudioLabel => 'آڈیو';
  @override
  String get sTypeImageLabel => 'تصویر';
  @override
  String get sTypeVideoLabel => 'ویڈیو';
  @override
  String get sTypeOtherLabel => 'دیگر میڈیا';
  @override
  String get sActionPlayHint => 'چلائیں';
  @override
  String get sActionPreviewHint => 'پیش نظارہ کریں';
  @override
  String get sActionSelectHint => 'منتخب کریں';
  @override
  String get sActionSwitchPathLabel => 'راستہ تبدیل کریں';
  @override
  String get sActionUseCameraHint => 'کیمرہ استعمال کریں';
  @override
  String get sNameDurationLabel => 'مدت';
  @override
  String get sUnitAssetCountLabel => 'کاؤنٹ';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxUr extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => ':آئی پی';
  @override
  String get port => ':پورٹ';
  @override
  String get alias => ':عرف';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionUr extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'انتخاب';
  @override
  String files({required Object files}) => 'فائلیں: ${files}';
  @override
  String size({required Object size}) => 'سائز: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerUr extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'فائل';
  @override
  String get folder => 'فولڈر';
  @override
  String get media => 'میڈیا';
  @override
  String get text => 'ٹیکسٹ';
  @override
  String get app => 'ایپ';
  @override
  String get clipboard => 'چسپاں کریں';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesUr extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'سنگل رسپٹ';
  @override
  String get multiple => 'ملٹیپل رسپٹ';
  @override
  String get link => 'لنک کے ذریعے شیئر کریں';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralUr extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'جنرل';
  @override
  String get brightness => 'تھیم';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsUr brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsUr._(_root);
  @override
  String get color => 'رنگ';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsUr colorOptions = _TranslationsSettingsTabGeneralColorOptionsUr._(_root);
  @override
  String get language => 'زبان';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsUr languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsUr._(_root);
  @override
  String get saveWindowPlacement => 'چھوڑیں: ونڈو کی جگہ کو محفوظ کریں۔';
  @override
  String get saveWindowPlacementWindows => 'بند ہونے پر ونڈو کی پوزیشن محفوظ کریں';
  @override
  String get minimizeToTray => 'چھوڑیں: ٹرے میں چھوٹا کریں۔';
  @override
  String get launchAtStartup => 'لاگ ان کے بعد آٹو اسٹارٹ';
  @override
  String get launchMinimized => 'آٹو سٹارٹ: سٹارٹ پوشیدہ';
  @override
  String get showInContextMenu => 'سیاق و سباق کے مینو میں LocalSend دکھائیں';
  @override
  String get animations => 'تحریکات';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveUr extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'وصول کریں';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'خودکار تکمیل';
  @override
  String get destination => 'منزل';
  @override
  String get downloads => '(ڈاؤن لوڈ)';
  @override
  String get saveToGallery => 'میڈیا کو گیلری میں محفوظ کریں۔';
  @override
  String get saveToHistory => 'تاریخچہ میں محفوظ کریں';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendUr extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بھیجیں';
  @override
  String get shareViaLinkAutoAccept => '"لنک کے ذریعے شیئر کریں" موڈ میں درخواستیں خود بخود قبول کریں';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkUr extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'نیٹ ورک';
  @override
  String get needRestart => 'ترتیبات کو لاگو کرنے کے لیے سرور کو دوبارہ شروع کریں!';
  @override
  String get server => 'سرور';
  @override
  String get alias => 'عرف';
  @override
  String get deviceType => 'آلہ کی قسم';
  @override
  String get deviceModel => 'آلہ کا ماڈل';
  @override
  String get port => 'پورٹ';
  @override
  String get discoveryTimeout => 'نیٹورک پرڈھونڈنے کی مدت ختم ہوگئ ہے';
  @override
  String portWarning({required Object defaultPort}) =>
      'ہو سکتا ہے آپ کو دوسرے آلات سے پتہ نہ چل سکے کیونکہ آپ حسب ضرورت پورٹ استعمال کر رہے ہیں۔ (پہلے سے طے شدہ: ${defaultPort})';
  @override
  String get encryption => 'خفیہ کاری';
  @override
  String get multicastGroup => 'ملٹی کاسٹ';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ہو سکتا ہے آپ کو دوسرے آلات سے پتہ نہ لگے کیونکہ آپ حسب ضرورت ملٹی کاسٹ ایڈریس استعمال کر رہے ہیں۔ (پہلے سے طے شدہ: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherUr extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دیگر';
  @override
  String get support => 'LocalSend کی حمایت کریں';
  @override
  String get donate => 'عطیہ کریں';
  @override
  String get privacyPolicy => 'رازداری کی پالیسی';
  @override
  String get termsOfUse => 'استعمال کی شرائط';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallUr extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'یہ ایپ دیگر آلات پر فائلیں بھیج سکتی ہے لیکن دیگر آلات اس ڈیوائس پر فائلیں نہیں بھیج سکتے۔';
  @override
  String solution({required Object port}) =>
      'یہ ممکنہ طور پر فائر وال کا مسئلہ ہے۔ آپ اسے پورٹ ${port} پر آنے والے کنکشنز (UDP اور TCP) کی اجازت دے کر حل کر سکتے ہیں۔';
  @override
  String get openFirewallSettings => 'فائر وال کھولیں';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryUr extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'یہ آلہ دوسرے آلات کو دریافت نہیں کر سکتا۔';
  @override
  String get solution =>
      'براہ کرم یقینی بنائیں کہ تمام آلات ایک ہی وائی فائی نیٹ ورک پر ہیں اور ایک ہی ترتیب (پورٹ، ملٹی کاسٹ ایڈریس، انکرپشن) شیئر کرتے ہیں۔ آپ ہدف والے آلے کا IP پتہ دستی طور پر ٹائپ کرنے کی کوشش کر سکتے ہیں۔ اگر یہ کام کرتا ہے، تو اس آلے کو پسندیدہ میں شامل کرنے پر غور کریں تاکہ مستقبل میں اسے خود بخود دریافت کیا جا سکے۔';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionUr extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'دونوں آلات ایک دوسرے کو دریافت نہیں کرسکتے ہیں اور نہ ہی وہ فائلوں کا اشتراک کرسکتے ہیں۔';
  @override
  String get solution =>
      'مسئلہ دونوں طرف موجود ہے؟ پھر آپ کو یہ یقینی بنانا ہوگا کہ دونوں ڈیوائسز ایک ہی وائی فائی نیٹ ورک میں ہیں اور ایک ہی کنفیگریشن (پورٹ، ملٹی کاسٹ ایڈریس، انکرپشن) کا اشتراک کرتے ہیں۔ وائی فائی شرکاء کے درمیان مواصلت کی اجازت نہیں دے سکتا ہے۔ اس صورت میں، یہ اختیار روٹر پر فعال ہونا ضروری ہے.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsUr extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'فائل کھولو';
  @override
  String get showInFolder => 'فولڈر میں دکھائیں';
  @override
  String get info => 'معلومات';
  @override
  String get deleteFromHistory => 'تاریخ سے حذف کریں';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalUr extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleUr title = _TranslationsProgressPageTotalTitleUr._(_root);
  @override
  String count({required Object curr, required Object n}) => 'فائلوں: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'سائز: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'رفتار: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileUr extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'انتخاب میں شامل کریں';
  @override
  String get content => 'آپ کیا شامل کرنا چاہتے ہیں؟';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputUr extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پتہ درج کریں۔';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'اپ ایڈریس';
  @override
  String get recentlyUsed => 'حال ہی میں استعمال ہوا:';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionUr extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فائل ٹرانسفر منسوخ کریں۔';
  @override
  String get content => 'کیا آپ واقعی فائل ٹرانسفر کو منسوخ کرنا چاہتے ہیں؟';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileUr extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فائل نہیں کھل سکی';
  @override
  String content({required Object file}) => '"${file}" کھول نہیں سکتا۔ کیا یہ فائل منتقل ہوگئی ہے، نام تبدیل ہوگیا ہے یا حذف ہوگئی ہے؟';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeUr extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encryption disabled';
  @override
  String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogUr extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogUr extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پسندیدہ';
  @override
  String get noFavorites => 'ابھی تک کوئی پسندیدہ آلات نہیں ہیں۔';
  @override
  String get addFavorite => 'شامل کریں';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogUr extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پسندیدہ سے حذف کریں';
  @override
  String content({required Object name}) => 'کیا آپ واقعی "${name}" کو پسندیدہ سے حذف کرنا چاہتے ہیں؟';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogUr extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'پسندیدہ میں شامل کریں';
  @override
  String get titleEdit => 'ترتیبات';
  @override
  String get name => 'آلے کا نام';
  @override
  String get auto => '(خودکار)';
  @override
  String get ip => 'IP پتہ';
  @override
  String get port => 'پورٹ';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoUr extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فائل کی معلومات';
  @override
  String get fileName => 'فائل کا نام:';
  @override
  String get path => 'راستہ:';
  @override
  String get size => 'سائز:';
  @override
  String get sender => 'بھیجنے والا:';
  @override
  String get time => 'وقت:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputUr extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فائل کا نام درج کریں۔';
  @override
  String original({required Object original}) => 'اصل: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogUr extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تاریخ صاف کریں';
  @override
  String get content => 'کیا آپ واقعی پوری تاریخ حذف کرنا چاہتے ہیں؟';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedUr extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'لوکل نیٹ ورک کا سکین کرنے کی اجازت کے بغیر LocalSend، دیگر ڈیوائسز تلاش نہیں کرسکتا ہے۔ براہ کرم ترتیبات میں اس اجازت کو منظور کریں۔';
  @override
  String get gotoSettings => 'ترتیبات';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputUr extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'پیغام ٹائپ کریں۔';
  @override
  String get multiline => 'ملٹی لائن';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesUr extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'کوئی فائل منتخب نہیں کی گئی';
  @override
  String get content => 'براہ کرم کم از کم ایک فائل منتخب کریں۔';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionUr extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اجازت نہیں';
  @override
  String get content => 'آپ نے ضروری اجازتیں فراہم نہیں کی ہیں۔ براہ کرم انہیں ترتیبات میں فراہم کریں۔';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformUr extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دستیاب نہیں';
  @override
  String get content => 'یہ خصوصیت صرف یہاں دستیاب ہے:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrUr extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR کوڈ';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsUr extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'فوری اقدامات';
  @override
  String get counter => 'کاؤنٹر';
  @override
  String get prefix => 'سابقہ';
  @override
  String get padZero => 'زیرو کے ساتھ پیڈ';
  @override
  String get sortBeforeCount => 'پہلے سے حروف تہجی کے مطابق ترتیب دیں۔';
  @override
  String get random => 'بے ترتیب';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeUr extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'فائل کی درخواستیں خود بخود قبول ہو جاتی ہیں۔ آگاہ رہیں کہ مقامی نیٹ ورک میں موجود ہر کوئی آپ کو فائلیں بھیج سکتا ہے۔';
}

// Path: dialogs.pin
class _TranslationsDialogsPinUr extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN درج کریں';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpUr extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بھیجنے کے انداز';
  @override
  String get single => 'ایک ریسیور کو فائل بھیجتا ہے۔ بھیجتے وقت سلیکشن ختم ہوجائیگا۔';
  @override
  String get multiple => 'اکثر متعدد ریسیورز کو فائل بھیجتا ہے۔ سلیکشن ختم نہیں ہوگا۔';
  @override
  String get link => 'LocalSend نصب نہیں ہونے والے رسیورز منتخب شدہ فائلز کو لنک اپنے براؤزر میں کھولنے سے ڈاؤن لوڈ کر سکتے ہیں۔';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomUr extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsUr extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'سسٹم';
  @override
  String get dark => 'اندھیرا';
  @override
  String get light => 'روشنی';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsUr extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'نظام';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsUr extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'سسٹم';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleUr extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleUr._(TranslationsUr root) : this._root = root, super.internal(root);

  final TranslationsUr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'کل پیش رفت (${time})';
  @override
  String get finishedError => 'غلطی کے ساتھ ختم';
  @override
  String get canceledSender => 'بھیجنے والے کے ذریعے منسوخ کر دیا گیا۔';
  @override
  String get canceledReceiver => 'وصول کنندہ کے ذریعے منسوخ کر دیا گیا۔';
}
