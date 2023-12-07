part of 'strings.g.dart';

// Path: <root>
class _StringsFa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsFa _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'فارسی';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralFa general = _StringsGeneralFa._(_root);
	@override late final _StringsReceiveTabFa receiveTab = _StringsReceiveTabFa._(_root);
	@override late final _StringsSendTabFa sendTab = _StringsSendTabFa._(_root);
	@override late final _StringsSettingsTabFa settingsTab = _StringsSettingsTabFa._(_root);
	@override late final _StringsTroubleshootPageFa troubleshootPage = _StringsTroubleshootPageFa._(_root);
	@override late final _StringsReceiveHistoryPageFa receiveHistoryPage = _StringsReceiveHistoryPageFa._(_root);
	@override late final _StringsApkPickerPageFa apkPickerPage = _StringsApkPickerPageFa._(_root);
	@override late final _StringsSelectedFilesPageFa selectedFilesPage = _StringsSelectedFilesPageFa._(_root);
	@override late final _StringsReceivePageFa receivePage = _StringsReceivePageFa._(_root);
	@override late final _StringsReceiveOptionsPageFa receiveOptionsPage = _StringsReceiveOptionsPageFa._(_root);
	@override late final _StringsSendPageFa sendPage = _StringsSendPageFa._(_root);
	@override late final _StringsProgressPageFa progressPage = _StringsProgressPageFa._(_root);
	@override late final _StringsWebSharePageFa webSharePage = _StringsWebSharePageFa._(_root);
	@override late final _StringsAboutPageFa aboutPage = _StringsAboutPageFa._(_root);
	@override late final _StringsDonationPageFa donationPage = _StringsDonationPageFa._(_root);
	@override late final _StringsChangelogPageFa changelogPage = _StringsChangelogPageFa._(_root);
	@override late final _StringsAliasGeneratorFa aliasGenerator = _StringsAliasGeneratorFa._(_root);
	@override late final _StringsDialogsFa dialogs = _StringsDialogsFa._(_root);
	@override late final _StringsTrayFa tray = _StringsTrayFa._(_root);
	@override late final _StringsWebFa web = _StringsWebFa._(_root);
	@override late final _StringsAssetPickerFa assetPicker = _StringsAssetPickerFa._(_root);
}

// Path: general
class _StringsGeneralFa extends _StringsGeneralEn {
	_StringsGeneralFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get accept => 'پذیرفتن';
	@override String get accepted => 'پذیرفته شده';
	@override String get add => 'افزودن';
	@override String get advanced => 'پیشرفته';
	@override String get cancel => 'لغو';
	@override String get close => 'بستن';
	@override String get confirm => 'تایید';
	@override String get continueStr => 'ادامه';
	@override String get copy => 'کپی';
	@override String get copiedToClipboard => 'در کلیپ بورد کپی شد';
	@override String get decline => 'نپذیرفتن';
	@override String get done => 'انجام شد';
	@override String get delete => 'حذف';
	@override String get edit => 'ویرایش';
	@override String get error => 'خطا';
	@override String get example => 'مثال';
	@override String get files => 'فایل ها';
	@override String get finished => 'پایان یافت';
	@override String get hide => 'مخفی';
	@override String get off => 'خاموش';
	@override String get offline => 'آفلاین';
	@override String get on => 'روشن';
	@override String get online => 'آنلاین';
	@override String get open => 'باز کردن';
	@override String get queue => 'صف';
	@override String get quickSave => 'ذخیره سریع';
	@override String get renamed => 'تغییر نام یافت';
	@override String get reset => 'بازنشانی';
	@override String get restart => 'راه اندازی مجدد';
	@override String get settings => 'تنظیمات';
	@override String get skipped => 'رد شد';
	@override String get start => 'شروع';
	@override String get stop => 'توقف';
	@override String get save => 'ذخیره';
	@override String get unchanged => 'بدون تغییر';
	@override String get unknown => 'ناشناخته';
	@override String get noItemInClipboard => 'هیچ موردی در کلیپ بورد وجود ندارد';
}

// Path: receiveTab
class _StringsReceiveTabFa extends _StringsReceiveTabEn {
	_StringsReceiveTabFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'دریافت';
	@override late final _StringsReceiveTabInfoBoxFa infoBox = _StringsReceiveTabInfoBoxFa._(_root);
}

// Path: sendTab
class _StringsSendTabFa extends _StringsSendTabEn {
	_StringsSendTabFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ارسال';
	@override late final _StringsSendTabSelectionFa selection = _StringsSendTabSelectionFa._(_root);
	@override late final _StringsSendTabPickerFa picker = _StringsSendTabPickerFa._(_root);
	@override String get shareIntentInfo => 'همچنین می توانید از ویژگی "اشتراک گذاری" دستگاه تلفن همراه خود برای انتخاب آسان تر فایل ها استفاده کنید';
	@override String get nearbyDevices => 'دستگاه های  اطراف';
	@override String get thisDevice => 'این دستگاه';
	@override String get scan => 'جستجوی دستگاه ها';
	@override String get sendMode => 'حالت ارسال';
	@override late final _StringsSendTabSendModesFa sendModes = _StringsSendTabSendModesFa._(_root);
	@override String get sendModeHelp => 'توضیح';
	@override String get help => 'لطفاً مطمئن شوید که دستگاه مورد نظر به شبکه وای فای یکسانی متصل باشد';
	@override String get placeItems => 'موارد را برای اشتراک گذاری قرار دهید';
}

// Path: settingsTab
class _StringsSettingsTabFa extends _StringsSettingsTabEn {
	_StringsSettingsTabFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'تنظیمات';
	@override late final _StringsSettingsTabGeneralFa general = _StringsSettingsTabGeneralFa._(_root);
	@override late final _StringsSettingsTabReceiveFa receive = _StringsSettingsTabReceiveFa._(_root);
	@override late final _StringsSettingsTabNetworkFa network = _StringsSettingsTabNetworkFa._(_root);
	@override late final _StringsSettingsTabOtherFa other = _StringsSettingsTabOtherFa._(_root);
	@override String get advancedSettings => 'تنظیمات پیشرفته';
}

// Path: troubleshootPage
class _StringsTroubleshootPageFa extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'عیب یابی';
	@override String get subTitle => 'این برنامه مطابق انتظار کار نمی کند؟ در اینجا می توانید راه حل های رایج را بیابید';
	@override String get solution => 'راه حل:';
	@override String get fixButton => 'تعمیر خودکار';
	@override late final _StringsTroubleshootPageFirewallFa firewall = _StringsTroubleshootPageFirewallFa._(_root);
	@override late final _StringsTroubleshootPageNoConnectionFa noConnection = _StringsTroubleshootPageNoConnectionFa._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageFa extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'تاریخچه';
	@override String get openFolder => 'باز کردن پوشه';
	@override String get deleteHistory => 'حذف تاریخچه';
	@override String get empty => 'تاریخچه خالی است';
	@override late final _StringsReceiveHistoryPageEntryActionsFa entryActions = _StringsReceiveHistoryPageEntryActionsFa._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageFa extends _StringsApkPickerPageEn {
	_StringsApkPickerPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'برنامه (APK)';
	@override String get excludeSystemApps => 'شامل نشدن برنامه های سیستمی';
	@override String get excludeAppsWithoutLaunchIntent => 'شامل نشدن برنامه های غیر اجرایی';
	@override String apps({required Object n}) => '${n} برنامه';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageFa extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'حذف همه';
}

// Path: receivePage
class _StringsReceivePageFa extends _StringsReceivePageEn {
	_StringsReceivePageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n,
		one: 'می خواهد برای شما یک فایل ارسال کند',
		other: 'می خواهد برای شما ${n} فایل ارسال کند',
	);
	@override String get subTitleMessage => 'به شما پیام داد:';
	@override String get subTitleLink => 'برای شما یک لینک ارسال کرد:';
	@override String get canceled => 'فرستنده درخواست را لغو کرد';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageFa extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'گزینه ها';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(پوشه لوکال سند)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'به دلیل وجود مسیر ها به طور خودکار خاموش می شود';
}

// Path: sendPage
class _StringsSendPageFa extends _StringsSendPageEn {
	_StringsSendPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'در انتظار پاسخ...';
	@override String get rejected => 'گیرنده درخواست را رد کرد';
	@override String get busy => 'گیرنده با درخواست دیگری مشغول است';
}

// Path: progressPage
class _StringsProgressPageFa extends _StringsProgressPageEn {
	_StringsProgressPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'ارسال فایل ها';
	@override String get titleReceiving => 'دریافت فایل ها';
	@override String get savedToGallery => 'در تصاویر ذخیره شد';
	@override late final _StringsProgressPageTotalFa total = _StringsProgressPageTotalFa._(_root);
}

// Path: webSharePage
class _StringsWebSharePageFa extends _StringsWebSharePageEn {
	_StringsWebSharePageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'اشتراک گذاری از طریق لینک';
	@override String get loading => 'شروع سرور...';
	@override String get stopping => 'توقف سرور...';
	@override String get error => 'هنگام راه اندازی سرور خطایی رخ داد';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n,
		one: 'باز کردن لینک در مرورگر:',
		other: 'باز کردن لینک ها در مرورگر:',
	);
	@override String get requests => 'درخواست ها';
	@override String get noRequests => 'هنوز درخواستی وجود ندارد';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend از یک گواهی خودامضا استفاده می‌کند. شما باید آن را در مرورگر قبول کنید.';
	@override String pendingRequests({required Object n}) => 'درخواست های در حال انتظار: ${n}';
}

// Path: aboutPage
class _StringsAboutPageFa extends _StringsAboutPageEn {
	_StringsAboutPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'درباره لوکال سند';
	@override List<String> get description => [
		'لوکال‌سند یک برنامه رایگان و متن باز است که به شما امکان می‌دهد فایل‌ها و پیام‌ها را به‌طور ایمن با دستگاه‌های اطراف از طریق شبکه محلی خود و بدون نیاز به اینترنت به اشتراک بگذارید',
		'این برنامه برای سیستم عامل های اندروید، آی او اس، مک او اس، ویندوز و لینوکس در دسترس است. شما می توانید با مراجعه به وبسایت رسمی برنامه کلیه روش‌های دانلود را مشاهده نمایید',
	];
	@override String get author => 'مولف';
	@override String get contributors => 'مشارکت کنندگان';
	@override String get translators => 'مترجمان';
}

// Path: donationPage
class _StringsDonationPageFa extends _StringsDonationPageEn {
	_StringsDonationPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'کمک مالی';
	@override String get info => 'لوکال‌سند رایگان، متن باز و فاقد هر گونه تبلیغات است. اگر به این برنامه علاقه‌مندید، می توانید با کمک مالی از توسعه آن حمایت کنید';
	@override String donate({required Object amount}) => 'کمک مالی ${amount}';
	@override String get thanks => 'بسیار از شما سپاسگزاریم';
	@override String get restore => 'بازیابی خرید';
}

// Path: changelogPage
class _StringsChangelogPageFa extends _StringsChangelogPageEn {
	_StringsChangelogPageFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'تاریخچه تغییرات برنامه';
}

// Path: aliasGenerator
class _StringsAliasGeneratorFa extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
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
		'پر انرژی',
		'چابک',
		'شگفت انگیز',
		'سریع',
		'شایسته',
		'سرحال',
		'خوب',
		'دلنشین',
		'باشکوه',
		'خوشتیپ',
		'جذاب',
		'مهربون',
		'دوست داشتنی',
		'مرموز',
		'معرکه',
		'مودب',
		'صبور',
		'خوشگل',
		'نیرومند',
		'مایه دار',
		'اسرار آمیز',
		'باهوش',
		'سرسخت',
		'خاص',
		'خوش فکر',
		'قدرتمند',
		'منظم',
		'خردمند',
	];
	@override List<String> get fruits => [
		'سیب',
		'آووکادو',
		'موز',
		'توت',
		'بلوبری',
		'کلم',
		'هویچ',
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
		'سیب زمینی',
		'کدو تنبل',
		'تمشک',
		'توت فرنگی',
		'گوجه',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsFa extends _StringsDialogsEn {
	_StringsDialogsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileFa addFile = _StringsDialogsAddFileFa._(_root);
	@override late final _StringsDialogsAddressInputFa addressInput = _StringsDialogsAddressInputFa._(_root);
	@override late final _StringsDialogsCancelSessionFa cancelSession = _StringsDialogsCancelSessionFa._(_root);
	@override late final _StringsDialogsCannotOpenFileFa cannotOpenFile = _StringsDialogsCannotOpenFileFa._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeFa encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeFa._(_root);
	@override late final _StringsDialogsErrorDialogFa errorDialog = _StringsDialogsErrorDialogFa._(_root);
	@override late final _StringsDialogsFavoriteDialogFa favoriteDialog = _StringsDialogsFavoriteDialogFa._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogFa favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogFa._(_root);
	@override late final _StringsDialogsFavoriteEditDialogFa favoriteEditDialog = _StringsDialogsFavoriteEditDialogFa._(_root);
	@override late final _StringsDialogsFileInfoFa fileInfo = _StringsDialogsFileInfoFa._(_root);
	@override late final _StringsDialogsFileNameInputFa fileNameInput = _StringsDialogsFileNameInputFa._(_root);
	@override late final _StringsDialogsHistoryClearDialogFa historyClearDialog = _StringsDialogsHistoryClearDialogFa._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedFa localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedFa._(_root);
	@override late final _StringsDialogsMessageInputFa messageInput = _StringsDialogsMessageInputFa._(_root);
	@override late final _StringsDialogsNoFilesFa noFiles = _StringsDialogsNoFilesFa._(_root);
	@override late final _StringsDialogsNoPermissionFa noPermission = _StringsDialogsNoPermissionFa._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformFa notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformFa._(_root);
	@override late final _StringsDialogsQrFa qr = _StringsDialogsQrFa._(_root);
	@override late final _StringsDialogsQuickActionsFa quickActions = _StringsDialogsQuickActionsFa._(_root);
	@override late final _StringsDialogsQuickSaveNoticeFa quickSaveNotice = _StringsDialogsQuickSaveNoticeFa._(_root);
	@override late final _StringsDialogsSendModeHelpFa sendModeHelp = _StringsDialogsSendModeHelpFa._(_root);
}

// Path: tray
class _StringsTrayFa extends _StringsTrayEn {
	_StringsTrayFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'خروج از لوکال سند';
}

// Path: web
class _StringsWebFa extends _StringsWebEn {
	_StringsWebFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'پذیرفته نشد';
	@override String get files => 'فایل ها';
	@override String get fileName => 'نام فایل';
	@override String get size => 'حجم';
}

// Path: assetPicker
class _StringsAssetPickerFa extends _StringsAssetPickerEn {
	_StringsAssetPickerFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'تایید';
	@override String get cancel => 'لغو';
	@override String get edit => 'ویرایش';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'بارگذاری ناموفق';
	@override String get original => 'اصلی';
	@override String get preview => 'پیش نمایش';
	@override String get select => 'انتخاب';
	@override String get emptyList => 'لیست خالی';
	@override String get unSupportedAssetType => 'نوع فایل پشتیبانی نشده';
	@override String get unableToAccessAll => 'قادر به دسترسی به تمام فایل های موجود در دستگاه نیست';
	@override String get viewingLimitedAssetsTip => 'فقط فایل ها و آلبوم های قابل دسترسی برنامه را مشاهده کنید';
	@override String get changeAccessibleLimitedAssets => 'برای به روز رسانی فایل های در دسترس کلیک کنید';
	@override String get accessAllTip => 'برنامه فقط می تواند به برخی از فایل های دستگاه دسترسی داشته باشد. به تنظیمات سیستم بروید و به برنامه اجازه دهید به تمام رسانه های موجود در دستگاه دسترسی داشته باشد';
	@override String get goToSystemSettings => 'رفتن به تنظیمات سیستم';
	@override String get accessLimitedAssets => 'با دسترسی محدود ادامه دهید';
	@override String get accessiblePathName => 'فایل های قابل دسترسی';
	@override String get sTypeAudioLabel => 'صوت';
	@override String get sTypeImageLabel => 'تصویر';
	@override String get sTypeVideoLabel => 'ویدیو';
	@override String get sTypeOtherLabel => 'دیگر رسانه ها';
	@override String get sActionPlayHint => 'پخش';
	@override String get sActionPreviewHint => 'پیش نمایش';
	@override String get sActionSelectHint => 'انتخاب';
	@override String get sActionSwitchPathLabel => 'تغییر مسیر';
	@override String get sActionUseCameraHint => 'از دوربین استفاده کنید';
	@override String get sNameDurationLabel => 'مدت زمان';
	@override String get sUnitAssetCountLabel => 'شمردن';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxFa extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get ip => 'آی پی:';
	@override String get port => 'پورت:';
	@override String get alias => 'نام مستعار:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionFa extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'انتخاب شده ها';
	@override String files({required Object files}) => 'فایل ها: ${files}';
	@override String size({required Object size}) => 'حجم: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerFa extends _StringsSendTabPickerEn {
	_StringsSendTabPickerFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get file => 'فایل';
	@override String get folder => 'پوشه';
	@override String get media => 'رسانه';
	@override String get text => 'متن';
	@override String get app => 'برنامه';
	@override String get clipboard => 'کلیپ بورد';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesFa extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get single => 'یک دریافت کننده';
	@override String get multiple => 'چندین دریافت کننده';
	@override String get link => 'اشتراک گذاری از طریق لینک';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralFa extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'عمومی';
	@override String get brightness => 'ظاهر';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsFa brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsFa._(_root);
	@override String get color => 'رنگ';
	@override late final _StringsSettingsTabGeneralColorOptionsFa colorOptions = _StringsSettingsTabGeneralColorOptionsFa._(_root);
	@override String get language => 'زبان';
	@override late final _StringsSettingsTabGeneralLanguageOptionsFa languageOptions = _StringsSettingsTabGeneralLanguageOptionsFa._(_root);
	@override String get saveWindowPlacement => 'خروج: ذخیره قرار دادن پنجره';
	@override String get minimizeToTray => 'خروج: ارسال برنامه به سیستم تری';
	@override String get launchAtStartup => 'شروع خودکار پس از ورود به سیستم';
	@override String get launchMinimized => 'شروع خودکار: شروع به صورت پنجره پنهان';
	@override String get animations => 'انیمیشن‌ها';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveFa extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'دریافت';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'پایان خودکار';
	@override String get destination => 'مقصد';
	@override String get downloads => '(دانلودها)';
	@override String get saveToGallery => 'ذخیره رسانه در گالری';
	@override String get saveToHistory => 'ذخیره در تاریخچه';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkFa extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'شبکه';
	@override String get needRestart => 'برای اعمال تنظیمات سرور را مجدد راه اندازی کنید';
	@override String get server => 'سرور';
	@override String get alias => 'نام مستعار';
	@override String get deviceType => 'نوع دستگاه';
	@override String get deviceModel => 'مدل دستگاه';
	@override String get port => 'پورت';
	@override String portWarning({required Object defaultPort}) => 'ممکن است به دلیل استفاده از یک پورت سفارشی، دستگاه های دیگر شما را شناسایی نکنند (پیشفرض : ${defaultPort})';
	@override String get encryption => 'رمزنگاری';
	@override String get multicastGroup => 'چندپخشی';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'ممکن است به دلیل استفاده از چندپخشی سفارشی، دستگاه های دیگر شما را شناسایی نکنند (پیشفرض: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherFa extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'سایر';
	@override String get support => 'حمایت از لوکال‌سند';
	@override String get donate => 'کمک مالی';
	@override String get privacyPolicy => 'سیاست حفظ حریم خصوصی';
	@override String get termsOfUse => 'شرایط استفاده';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallFa extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'این برنامه می تواند فایل ها را به دستگاه های دیگر ارسال کند اما دستگاه های دیگر نمی توانند فایل ها را به این دستگاه ارسال کنند';
	@override String solution({required Object port}) => 'این مشکل به احتمال زیاد مربوط به فایروال است. شما می توانید با دادن مجوز به اتصالات ورودی این مشکل را حل کنید (UDP و TCP) در پورت ${port}';
	@override String get openFirewall => 'باز کردن فایروال';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionFa extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'هر دو دستگاه نمی توانند یکدیگر را پیدا کرده و فایل ها را به اشتراک بگذارند';
	@override String get solution => 'اگر مشکل در هر دو طرف وجود دارد، پس باید مطمئن شوید که هر دو دستگاه به یک شبکه وای فای متصل هستند و پیکربندی یکسانی دارند (پورت، آدرس چندپخشی، رمزنگاری). شبکه وای فای ممکن است اجازه ارتباط بین شرکت کنندگان را ندهد. در این حالت، این گزینه باید در روتر فعال باشد';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsFa extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get open => 'باز کردن فایل';
	@override String get info => 'اطلاعات';
	@override String get deleteFromHistory => 'حذف از تاریخچه';
}

// Path: progressPage.total
class _StringsProgressPageTotalFa extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleFa title = _StringsProgressPageTotalTitleFa._(_root);
	@override String count({required Object curr, required Object n}) => 'فایل ها: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'حجم: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'سرعت: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileFa extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'افزودن به انتخاب شده ها';
	@override String get content => 'چه چیزی می خواهید اضافه کنید؟';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputFa extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'آدرس را وارد کنید';
	@override String get hashtag => 'هشتگ';
	@override String get ip => 'آدرس آی پی';
	@override String get recentlyUsed => 'اخیرا استفاده شده: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionFa extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'لغو کردن انتقال فایل';
	@override String get content => 'واقعاً می خواهید انتقال فایل را لغو کنید؟';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileFa extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'نمی تواند فایل را باز کند';
	@override String content({required Object file}) => 'نمیتوان فایل "${file}" باز کرد. آیا این فایل منتقل، تغییر نام یا حذف شده است؟';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeFa extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'رمزنگاری غیرفعال شد';
	@override String get content => 'اکنون ارتباط از طریق پروتکل http رمزنگاری نشده صورت می گیرد. برای استفاده از https، رمزنگاری را دوباره فعال کنید';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogFa extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogFa extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'علاقه‌مندی‌ها';
	@override String get noFavorites => 'هنوز دستگاهی اضافه نشده';
	@override String get addFavorite => 'افزودن';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogFa extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'حذف از علاقه‌مندی‌ها';
	@override String content({required Object name}) => 'واقعاً می خواهید از علاقه‌مندی‌ها حذف کنید "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogFa extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'افزودن به علاقه‌مندی‌ها';
	@override String get titleEdit => 'تنظیمات';
	@override String get name => 'نام مستعار';
	@override String get auto => '(خودکار)';
	@override String get ip => 'آدرس آی پی';
	@override String get port => 'پورت';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoFa extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'مشخصات فایل';
	@override String get fileName => 'نام فایل:';
	@override String get path => 'مسیر:';
	@override String get size => 'حجم:';
	@override String get sender => 'فرستنده:';
	@override String get time => 'زمان:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputFa extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'نام فایل را وارد کنید';
	@override String original({required Object original}) => 'اصلی: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogFa extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پاکسازی تاریخچه';
	@override String get content => 'واقعاً می خواهید کل تاریخچه را حذف کنید؟';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedFa extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'لوکال سند نمی تواند دستگاه های دیگر را بدون داشتن مجوز اسکن شبکه محلی پیدا کند. لطفاً این مجوز را در تنظیمات به برنامه بدهید';
	@override String get gotoSettings => 'تنظیمات';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputFa extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پیام را تایپ کنید';
	@override String get multiline => 'چند خطی';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesFa extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'فایلی انتخاب نشده';
	@override String get content => 'لطفا حداقل یک فایل را انتخاب کنید';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionFa extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'بدون مجوز';
	@override String get content => 'شما مجوزهای مورد نیاز را اعطا نکرده‌اید. لطفاً آنها را در تنظیمات مجوزدهی کنید.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformFa extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'در دسترس نیست';
	@override String get content => 'این ویژگی فقط در دسترس است در:';
}

// Path: dialogs.qr
class _StringsDialogsQrFa extends _StringsDialogsQrEn {
	_StringsDialogsQrFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR کد';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsFa extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'اقدامات سریع';
	@override String get counter => 'شمارنده';
	@override String get prefix => 'پیشوند';
	@override String get padZero => 'همگام سازی نام ها با افزودن صفر';
	@override String get sortBeforeCount => 'از قبل بر اساس حروف الفبا مرتب کنید';
	@override String get random => 'تصادفی';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeFa extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'درخواست ها به صورت خودکار پذیرفته می شوند. توجه داشته باشید که همه افراد در شبکه محلی می توانند برای شما فایل ارسال کنند';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpFa extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'حالت های ارسال';
	@override String get single => 'فایل ها را به یک گیرنده ارسال می کند. لیست انتخاب شده ها پس از اتمام انتقال فایل پاک می شود';
	@override String get multiple => 'فایل ها را برای چندین گیرنده ارسال می کند. لیست انتخاب شده ها پاک نخواهد شد';
	@override String get link => 'گیرندگانی که لوکال سند را نصب نکرده اند، می توانند فایل ها را با باز کردن لینک در مرورگر خود دانلود کنند';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsFa extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'سیستم';
	@override String get dark => 'تیره';
	@override String get light => 'روشن';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsFa extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'سیستم';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsFa extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'سیستم';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleFa extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'مجموع پیشرفت (${time})';
	@override String get finishedError => 'با خطا مواجه شد';
	@override String get canceledSender => 'توسط فرستنده لغو شد';
	@override String get canceledReceiver => 'توسط گیرنده لغو شد';
}
