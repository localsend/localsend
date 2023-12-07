part of 'strings.g.dart';

// Path: <root>
class _StringsUr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ur,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ur>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsUr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'اردو';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralUr general = _StringsGeneralUr._(_root);
	@override late final _StringsReceiveTabUr receiveTab = _StringsReceiveTabUr._(_root);
	@override late final _StringsSendTabUr sendTab = _StringsSendTabUr._(_root);
	@override late final _StringsSettingsTabUr settingsTab = _StringsSettingsTabUr._(_root);
	@override late final _StringsTroubleshootPageUr troubleshootPage = _StringsTroubleshootPageUr._(_root);
	@override late final _StringsReceiveHistoryPageUr receiveHistoryPage = _StringsReceiveHistoryPageUr._(_root);
	@override late final _StringsApkPickerPageUr apkPickerPage = _StringsApkPickerPageUr._(_root);
	@override late final _StringsSelectedFilesPageUr selectedFilesPage = _StringsSelectedFilesPageUr._(_root);
	@override late final _StringsReceivePageUr receivePage = _StringsReceivePageUr._(_root);
	@override late final _StringsReceiveOptionsPageUr receiveOptionsPage = _StringsReceiveOptionsPageUr._(_root);
	@override late final _StringsSendPageUr sendPage = _StringsSendPageUr._(_root);
	@override late final _StringsProgressPageUr progressPage = _StringsProgressPageUr._(_root);
	@override late final _StringsWebSharePageUr webSharePage = _StringsWebSharePageUr._(_root);
	@override late final _StringsAboutPageUr aboutPage = _StringsAboutPageUr._(_root);
	@override late final _StringsChangelogPageUr changelogPage = _StringsChangelogPageUr._(_root);
	@override late final _StringsAliasGeneratorUr aliasGenerator = _StringsAliasGeneratorUr._(_root);
	@override late final _StringsDialogsUr dialogs = _StringsDialogsUr._(_root);
	@override late final _StringsTrayUr tray = _StringsTrayUr._(_root);
	@override late final _StringsWebUr web = _StringsWebUr._(_root);
	@override late final _StringsAssetPickerUr assetPicker = _StringsAssetPickerUr._(_root);
}

// Path: general
class _StringsGeneralUr extends _StringsGeneralEn {
	_StringsGeneralUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'قبول کریں';
	@override String get accepted => 'قبول کر لیا';
	@override String get add => 'شامل کریں';
	@override String get advanced => 'اعلی درجے کی';
	@override String get cancel => 'منسوخ کریں';
	@override String get close => 'بند کریں';
	@override String get confirm => 'تصدیق کریں';
	@override String get continueStr => 'جاری رہے';
	@override String get copy => 'کاپی';
	@override String get copiedToClipboard => 'کلپ بورڈ پر کاپی کیا گیا';
	@override String get decline => 'رد کرنا';
	@override String get done => 'ہو گیا';
	@override String get edit => 'ترمیم';
	@override String get error => 'خرابی';
	@override String get example => 'مثال';
	@override String get files => 'فائلوں';
	@override String get finished => 'ختم';
	@override String get hide => 'چھپائیں';
	@override String get off => 'بند';
	@override String get offline => 'آف لائن';
	@override String get on => 'پر';
	@override String get online => 'آن لائن';
	@override String get open => 'کھولیں';
	@override String get queue => 'قطار';
	@override String get quickSave => 'فوری محفوظ کریں';
	@override String get renamed => 'نام تبدیل کر دیا گیا';
	@override String get reset => 'دوبارہ ترتیب دیں';
	@override String get restart => 'دوبارہ شروع کریں';
	@override String get settings => 'ترتیبات';
	@override String get skipped => 'چھوڑ دیا';
	@override String get start => 'شروع کریں';
	@override String get stop => 'رک جاؤ';
	@override String get save => 'محفوظ کریں';
	@override String get unchanged => 'غیر تبدیل شدہ';
	@override String get unknown => 'نامعلوم';
}

// Path: receiveTab
class _StringsReceiveTabUr extends _StringsReceiveTabEn {
	_StringsReceiveTabUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'وصول کریں';
	@override late final _StringsReceiveTabInfoBoxUr infoBox = _StringsReceiveTabInfoBoxUr._(_root);
}

// Path: sendTab
class _StringsSendTabUr extends _StringsSendTabEn {
	_StringsSendTabUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'بھیجیں';
	@override late final _StringsSendTabSelectionUr selection = _StringsSendTabSelectionUr._(_root);
	@override late final _StringsSendTabPickerUr picker = _StringsSendTabPickerUr._(_root);
	@override String get shareIntentInfo => 'آپ اپنے موبائل ڈیوائس کی "شیئر کریں" فیچر کو بھی آسانی سے فائلوں کو منتخب کرنے کے لیے استعمال کرسکتے ہیں۔';
	@override String get nearbyDevices => 'قریبی ڈیوائس';
	@override String get thisDevice => 'یہ ڈیوائس';
	@override String get scan => 'ڈیوائس تلاش کریں';
	@override String get sendMode => 'سینڈ موڈ';
	@override late final _StringsSendTabSendModesUr sendModes = _StringsSendTabSendModesUr._(_root);
	@override String get sendModeHelp => 'وضاحت';
	@override String get help => 'براہ کرم یقینی بنائیں کہ مطلوبہ ہدف بھی اسی وائی فائی نیٹ ورک میں ہے۔';
	@override String get placeItems => 'شئیر کرنے کے لیے اشیاء رکھیں۔';
}

// Path: settingsTab
class _StringsSettingsTabUr extends _StringsSettingsTabEn {
	_StringsSettingsTabUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ترتیبات';
	@override late final _StringsSettingsTabGeneralUr general = _StringsSettingsTabGeneralUr._(_root);
	@override late final _StringsSettingsTabReceiveUr receive = _StringsSettingsTabReceiveUr._(_root);
	@override late final _StringsSettingsTabNetworkUr network = _StringsSettingsTabNetworkUr._(_root);
	@override String get advancedSettings => 'تجاویز شھر کی ترتیبات';
}

// Path: troubleshootPage
class _StringsTroubleshootPageUr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خرابی کا سراغ لگانا';
	@override String get subTitle => 'کیا یہ ایپ توقع کے مطابق کام نہیں کرتی؟ یہاں آپ عام حل تلاش کر سکتے ہیں۔';
	@override String get solution => 'حل:';
	@override String get fixButton => 'خود بخود درست کریں۔';
	@override late final _StringsTroubleshootPageFirewallUr firewall = _StringsTroubleshootPageFirewallUr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionUr noConnection = _StringsTroubleshootPageNoConnectionUr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageUr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تاریخ';
	@override String get openFolder => 'فولڈر کھولیں';
	@override String get deleteHistory => 'تاریخ کو حذف کریں';
	@override String get empty => 'تاریخ خالی ہے۔';
	@override late final _StringsReceiveHistoryPageEntryActionsUr entryActions = _StringsReceiveHistoryPageEntryActionsUr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageUr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اپلیکیشنز (APK)';
	@override String get excludeSystemApps => 'سسٹم ایپس کو ختم کریں';
	@override String get excludeAppsWithoutLaunchIntent => 'غیر لانچ ہونے والے ایپس کو ختم کریں';
	@override String apps({required Object n}) => '${n} ایپس';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageUr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'تمام حذف کریں';
}

// Path: receivePage
class _StringsReceivePageUr extends _StringsReceivePageEn {
	_StringsReceivePageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ur'))(n,
		one: 'آپ کو ایک فائل بھیجنا چاہتا ہے۔',
		other: 'آپ کو ${n} فائلیں بھیجنا چاہتا ہے۔',
	);
	@override String get subTitleMessage => 'آپ کو ایک پیغام بھیجا:';
	@override String get subTitleLink => 'آپ کو ایک لنک بھیجا:';
	@override String get canceled => 'بھیجنے والے نے درخواست منسوخ کر دی ہے۔';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageUr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختیارات';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(${_root.appName} folder)';
	@override String get saveToGallery => '. گیلری میں محفوظ کریں${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'خود کار طور پر منقطع ہوگیا ہے کیونکہ ڈائریکٹریاں ہیں۔';
}

// Path: sendPage
class _StringsSendPageUr extends _StringsSendPageEn {
	_StringsSendPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'جواب کا منتظر...';
	@override String get rejected => 'وصول کنندہ نے درخواست مسترد کر دی ہے۔';
	@override String get busy => 'وصول کنندہ دوسری درخواست میں مصروف ہے۔';
}

// Path: progressPage
class _StringsProgressPageUr extends _StringsProgressPageEn {
	_StringsProgressPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'فائلیں بھیج رہا ہے';
	@override String get titleReceiving => 'فائلیں موصول ہو رہی ہیں';
	@override String get savedToGallery => 'تصاویر میں محفوظ کیا گیا';
	@override late final _StringsProgressPageTotalUr total = _StringsProgressPageTotalUr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageUr extends _StringsWebSharePageEn {
	_StringsWebSharePageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لنک کے ذریعے شئیر کریں';
	@override String get loading => 'سرور کو چالو کررہا ہے...';
	@override String get stopping => 'سرور بند ہو رہا ہے...';
	@override String get error => 'سرور چالو کرتے وقت خامی پیش آئی ہے۔';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ur'))(n,
		one: 'اس لنک کو براوزر میں کھولیں:',
		other: 'ان میں سے کسی ایک لنک کو براوزر میں کھولیں:',
	);
	@override String get requests => 'درخواستیں';
	@override String get noRequests => 'ابھی تک کوئی درخواست نہیں۔';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend براؤزر میں استعمال کرنے کیلئے آپ کوخود سائن کردہ سرٹیفکیٹ قبول کرنا ہوگا۔';
	@override String pendingRequests({required Object n}) => 'زیر التواء درخواستیں: ${n}';
}

// Path: aboutPage
class _StringsAboutPageUr extends _StringsAboutPageEn {
	_StringsAboutPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'کے بارے میں LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageUr extends _StringsChangelogPageEn {
	_StringsChangelogPageUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'چینج لاگ';
}

// Path: aliasGenerator
class _StringsAliasGeneratorUr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsUr extends _StringsDialogsEn {
	_StringsDialogsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileUr addFile = _StringsDialogsAddFileUr._(_root);
	@override late final _StringsDialogsAddressInputUr addressInput = _StringsDialogsAddressInputUr._(_root);
	@override late final _StringsDialogsCancelSessionUr cancelSession = _StringsDialogsCancelSessionUr._(_root);
	@override late final _StringsDialogsCannotOpenFileUr cannotOpenFile = _StringsDialogsCannotOpenFileUr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeUr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeUr._(_root);
	@override late final _StringsDialogsErrorDialogUr errorDialog = _StringsDialogsErrorDialogUr._(_root);
	@override late final _StringsDialogsFileInfoUr fileInfo = _StringsDialogsFileInfoUr._(_root);
	@override late final _StringsDialogsFileNameInputUr fileNameInput = _StringsDialogsFileNameInputUr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedUr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedUr._(_root);
	@override late final _StringsDialogsMessageInputUr messageInput = _StringsDialogsMessageInputUr._(_root);
	@override late final _StringsDialogsNoFilesUr noFiles = _StringsDialogsNoFilesUr._(_root);
	@override late final _StringsDialogsNoPermissionUr noPermission = _StringsDialogsNoPermissionUr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformUr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformUr._(_root);
	@override late final _StringsDialogsQrUr qr = _StringsDialogsQrUr._(_root);
	@override late final _StringsDialogsQuickActionsUr quickActions = _StringsDialogsQuickActionsUr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeUr quickSaveNotice = _StringsDialogsQuickSaveNoticeUr._(_root);
	@override late final _StringsDialogsSendModeHelpUr sendModeHelp = _StringsDialogsSendModeHelpUr._(_root);
}

// Path: tray
class _StringsTrayUr extends _StringsTrayEn {
	_StringsTrayUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'چھوڑو LocalSend';
}

// Path: web
class _StringsWebUr extends _StringsWebEn {
	_StringsWebUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'منسوخ کردیا';
	@override String get files => 'فائلیں';
	@override String get fileName => 'فائل کا نام';
	@override String get size => 'سائز';
}

// Path: assetPicker
class _StringsAssetPickerUr extends _StringsAssetPickerEn {
	_StringsAssetPickerUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'تصدیق کریں';
	@override String get cancel => 'منسوخ کریں';
	@override String get edit => 'ترمیم کریں';
	@override String get gifIndicator => 'جی آئی ایف';
	@override String get loadFailed => 'لوڈ نہیں ہوسکی';
	@override String get original => 'اصل ';
	@override String get preview => 'پیش نظارہ';
	@override String get select => 'منتخب کریں';
	@override String get emptyList => 'خالی فہرست';
	@override String get unSupportedAssetType => 'غیر معتبر فائل کی قسم۔';
	@override String get unableToAccessAll => 'یہ ڈیوائس پر تمام فائلوں تک رسائی نہیں ہوسکتی ہے۔';
	@override String get viewingLimitedAssetsTip => 'صرف ایپ تک رسائی پذیر فائلوں اور البم کونسیس ہوسکتی ہیں۔';
	@override String get changeAccessibleLimitedAssets => 'رسائی پذیر فائلوں کو اپ ڈیٹ کرنے کے لئے کلک کریں';
	@override String get accessAllTip => 'ایپ صرف چند فائلوں تک رسائی حاصل کرسکتی ہے ڈیوائس پر۔ سسٹم کی ترتیبات میں جائیں اور ایپ کو ڈیوائس پر تمام میڈیا تک رسائی کی اجازت دیں۔';
	@override String get goToSystemSettings => 'سسٹم ترتیبات پر جائیں';
	@override String get accessLimitedAssets => 'محدود رسائی کے ساتھ جاری رکھیں';
	@override String get accessiblePathName => 'رسائی پذیر فائلیں';
	@override String get sTypeAudioLabel => 'آڈیو';
	@override String get sTypeImageLabel => 'تصویر';
	@override String get sTypeVideoLabel => 'ویڈیو';
	@override String get sTypeOtherLabel => 'دیگر میڈیا';
	@override String get sActionPlayHint => 'چلائیں';
	@override String get sActionPreviewHint => 'پیش نظارہ کریں';
	@override String get sActionSelectHint => 'منتخب کریں';
	@override String get sActionSwitchPathLabel => 'راستہ تبدیل کریں';
	@override String get sActionUseCameraHint => 'کیمرہ استعمال کریں';
	@override String get sNameDurationLabel => 'مدت';
	@override String get sUnitAssetCountLabel => 'کاؤنٹ';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxUr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get ip => ':آئی پی';
	@override String get port => ':پورٹ';
	@override String get alias => ':عرف';
}

// Path: sendTab.selection
class _StringsSendTabSelectionUr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'انتخاب';
	@override String files({required Object files}) => 'فائلیں: ${files}';
	@override String size({required Object size}) => 'سائز: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerUr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get file => 'فائل';
	@override String get folder => 'فولڈر';
	@override String get media => 'میڈیا';
	@override String get text => 'ٹیکسٹ';
	@override String get app => 'ایپ';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesUr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get single => 'سنگل رسپٹ';
	@override String get multiple => 'ملٹیپل رسپٹ';
	@override String get link => 'لنک کے ذریعے شیئر کریں';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralUr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'جنرل';
	@override String get brightness => 'تھیم';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsUr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsUr._(_root);
	@override String get color => 'رنگ';
	@override late final _StringsSettingsTabGeneralColorOptionsUr colorOptions = _StringsSettingsTabGeneralColorOptionsUr._(_root);
	@override String get language => 'زبان';
	@override late final _StringsSettingsTabGeneralLanguageOptionsUr languageOptions = _StringsSettingsTabGeneralLanguageOptionsUr._(_root);
	@override String get saveWindowPlacement => 'چھوڑیں: ونڈو کی جگہ کو محفوظ کریں۔';
	@override String get minimizeToTray => 'چھوڑیں: ٹرے میں چھوٹا کریں۔';
	@override String get launchAtStartup => 'لاگ ان کے بعد آٹو اسٹارٹ';
	@override String get launchMinimized => 'آٹو سٹارٹ: سٹارٹ پوشیدہ';
	@override String get animations => 'تحریکات';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveUr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'وصول کریں';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'منزل';
	@override String get downloads => '(ڈاؤن لوڈ)';
	@override String get saveToGallery => 'میڈیا کو گیلری میں محفوظ کریں۔';
	@override String get saveToHistory => 'تاریخچہ میں محفوظ کریں';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkUr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'نیٹ ورک';
	@override String get needRestart => 'ترتیبات کو لاگو کرنے کے لیے سرور کو دوبارہ شروع کریں!';
	@override String get server => 'سرور';
	@override String get alias => 'عرف';
	@override String get deviceType => 'آلہ کی قسم';
	@override String get deviceModel => 'آلہ کا ماڈل';
	@override String get port => 'پورٹ';
	@override String portWarning({required Object defaultPort}) => 'ہو سکتا ہے آپ کو دوسرے آلات سے پتہ نہ چل سکے کیونکہ آپ حسب ضرورت پورٹ استعمال کر رہے ہیں۔ (پہلے سے طے شدہ: ${defaultPort})';
	@override String get encryption => 'خفیہ کاری';
	@override String get multicastGroup => 'ملٹی کاسٹ';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'ہو سکتا ہے آپ کو دوسرے آلات سے پتہ نہ لگے کیونکہ آپ حسب ضرورت ملٹی کاسٹ ایڈریس استعمال کر رہے ہیں۔ (پہلے سے طے شدہ: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallUr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'یہ ایپ دیگر آلات پر فائلیں بھیج سکتی ہے لیکن دیگر آلات اس ڈیوائس پر فائلیں نہیں بھیج سکتے۔';
	@override String solution({required Object port}) => 'یہ ممکنہ طور پر فائر وال کا مسئلہ ہے۔ آپ اسے پورٹ ${port} پر آنے والے کنکشنز (UDP اور TCP) کی اجازت دے کر حل کر سکتے ہیں۔';
	@override String get openFirewall => 'فائر وال کھولیں';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionUr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'دونوں آلات ایک دوسرے کو دریافت نہیں کرسکتے ہیں اور نہ ہی وہ فائلوں کا اشتراک کرسکتے ہیں۔';
	@override String get solution => 'مسئلہ دونوں طرف موجود ہے؟ پھر آپ کو یہ یقینی بنانا ہوگا کہ دونوں ڈیوائسز ایک ہی وائی فائی نیٹ ورک میں ہیں اور ایک ہی کنفیگریشن (پورٹ، ملٹی کاسٹ ایڈریس، انکرپشن) کا اشتراک کرتے ہیں۔ وائی فائی شرکاء کے درمیان مواصلت کی اجازت نہیں دے سکتا ہے۔ اس صورت میں، یہ اختیار روٹر پر فعال ہونا ضروری ہے.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsUr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get open => 'فائل کھولو';
	@override String get info => 'معلومات';
	@override String get deleteFromHistory => 'تاریخ سے حذف کریں';
}

// Path: progressPage.total
class _StringsProgressPageTotalUr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleUr title = _StringsProgressPageTotalTitleUr._(_root);
	@override String count({required Object curr, required Object n}) => 'فائلوں: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'سائز: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'رفتار: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileUr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'انتخاب میں شامل کریں';
	@override String get content => 'آپ کیا شامل کرنا چاہتے ہیں؟';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputUr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'پتہ درج کریں۔';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'اپ ایڈریس';
	@override String get recentlyUsed => 'حال ہی میں استعمال ہوا:';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionUr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فائل ٹرانسفر منسوخ کریں۔';
	@override String get content => 'کیا آپ واقعی فائل ٹرانسفر کو منسوخ کرنا چاہتے ہیں؟';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileUr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فائل نہیں کھل سکی';
	@override String content({required Object file}) => '"${file}" کھول نہیں سکتا۔ کیا یہ فائل منتقل ہوگئی ہے، نام تبدیل ہوگیا ہے یا حذف ہوگئی ہے؟';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeUr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encryption disabled';
	@override String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogUr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoUr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فائل کی معلومات';
	@override String get fileName => 'فائل کا نام:';
	@override String get path => 'راستہ:';
	@override String get size => 'سائز:';
	@override String get sender => 'بھیجنے والا:';
	@override String get time => 'وقت:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputUr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فائل کا نام درج کریں۔';
	@override String original({required Object original}) => 'اصل: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedUr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'لوکل نیٹ ورک کا سکین کرنے کی اجازت کے بغیر LocalSend، دیگر ڈیوائسز تلاش نہیں کرسکتا ہے۔ براہ کرم ترتیبات میں اس اجازت کو منظور کریں۔';
	@override String get gotoSettings => 'ترتیبات';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputUr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'پیغام ٹائپ کریں۔';
	@override String get multiline => 'ملٹی لائن';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesUr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'کوئی فائل منتخب نہیں کی گئی';
	@override String get content => 'براہ کرم کم از کم ایک فائل منتخب کریں۔';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionUr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اجازت نہیں';
	@override String get content => 'آپ نے ضروری اجازتیں فراہم نہیں کی ہیں۔ براہ کرم انہیں ترتیبات میں فراہم کریں۔';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformUr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'دستیاب نہیں';
	@override String get content => 'یہ خصوصیت صرف یہاں دستیاب ہے:';
}

// Path: dialogs.qr
class _StringsDialogsQrUr extends _StringsDialogsQrEn {
	_StringsDialogsQrUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR کوڈ';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsUr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فوری اقدامات';
	@override String get counter => 'کاؤنٹر';
	@override String get prefix => 'سابقہ';
	@override String get padZero => 'زیرو کے ساتھ پیڈ';
	@override String get sortBeforeCount => 'پہلے سے حروف تہجی کے مطابق ترتیب دیں۔';
	@override String get random => 'بے ترتیب';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeUr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'فائل کی درخواستیں خود بخود قبول ہو جاتی ہیں۔ آگاہ رہیں کہ مقامی نیٹ ورک میں موجود ہر کوئی آپ کو فائلیں بھیج سکتا ہے۔';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpUr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get title => 'بھیجنے کے انداز';
	@override String get single => 'ایک ریسیور کو فائل بھیجتا ہے۔ بھیجتے وقت سلیکشن ختم ہوجائیگا۔';
	@override String get multiple => 'اکثر متعدد ریسیورز کو فائل بھیجتا ہے۔ سلیکشن ختم نہیں ہوگا۔';
	@override String get link => 'LocalSend نصب نہیں ہونے والے رسیورز منتخب شدہ فائلز کو لنک اپنے براؤزر میں کھولنے سے ڈاؤن لوڈ کر سکتے ہیں۔';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsUr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get system => 'سسٹم';
	@override String get dark => 'اندھیرا';
	@override String get light => 'روشنی';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsUr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get system => 'نظام';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsUr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get system => 'سسٹم';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleUr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleUr._(_StringsUr root) : this._root = root, super._(root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'کل پیش رفت (${time})';
	@override String get finishedError => 'غلطی کے ساتھ ختم';
	@override String get canceledSender => 'بھیجنے والے کے ذریعے منسوخ کر دیا گیا۔';
	@override String get canceledReceiver => 'وصول کنندہ کے ذریعے منسوخ کر دیا گیا۔';
}
