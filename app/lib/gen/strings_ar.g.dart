part of 'strings.g.dart';

// Path: <root>
class _StringsAr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'العربية';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralAr general = _StringsGeneralAr._(_root);
	@override late final _StringsReceiveTabAr receiveTab = _StringsReceiveTabAr._(_root);
	@override late final _StringsSendTabAr sendTab = _StringsSendTabAr._(_root);
	@override late final _StringsSettingsTabAr settingsTab = _StringsSettingsTabAr._(_root);
	@override late final _StringsTroubleshootPageAr troubleshootPage = _StringsTroubleshootPageAr._(_root);
	@override late final _StringsReceiveHistoryPageAr receiveHistoryPage = _StringsReceiveHistoryPageAr._(_root);
	@override late final _StringsApkPickerPageAr apkPickerPage = _StringsApkPickerPageAr._(_root);
	@override late final _StringsSelectedFilesPageAr selectedFilesPage = _StringsSelectedFilesPageAr._(_root);
	@override late final _StringsReceivePageAr receivePage = _StringsReceivePageAr._(_root);
	@override late final _StringsReceiveOptionsPageAr receiveOptionsPage = _StringsReceiveOptionsPageAr._(_root);
	@override late final _StringsSendPageAr sendPage = _StringsSendPageAr._(_root);
	@override late final _StringsProgressPageAr progressPage = _StringsProgressPageAr._(_root);
	@override late final _StringsWebSharePageAr webSharePage = _StringsWebSharePageAr._(_root);
	@override late final _StringsAboutPageAr aboutPage = _StringsAboutPageAr._(_root);
	@override late final _StringsChangelogPageAr changelogPage = _StringsChangelogPageAr._(_root);
	@override late final _StringsAliasGeneratorAr aliasGenerator = _StringsAliasGeneratorAr._(_root);
	@override late final _StringsDialogsAr dialogs = _StringsDialogsAr._(_root);
	@override late final _StringsTrayAr tray = _StringsTrayAr._(_root);
	@override late final _StringsWebAr web = _StringsWebAr._(_root);
	@override late final _StringsAssetPickerAr assetPicker = _StringsAssetPickerAr._(_root);
}

// Path: general
class _StringsGeneralAr extends _StringsGeneralEn {
	_StringsGeneralAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'قبول';
	@override String get accepted => 'تم قبولها';
	@override String get add => 'إضافة';
	@override String get advanced => 'متقدم';
	@override String get cancel => 'إلغاء';
	@override String get close => 'إغلاق';
	@override String get confirm => 'تأكيد';
	@override String get continueStr => 'أكمل';
	@override String get copy => 'إنسخ';
	@override String get copiedToClipboard => 'نسخ إلى الحافظة';
	@override String get decline => 'ارفض';
	@override String get done => 'انتهى';
	@override String get delete => 'حذف';
	@override String get edit => 'تعديل';
	@override String get error => 'خطأ';
	@override String get example => 'مثال';
	@override String get files => 'ملفات';
	@override String get finished => 'انتهى';
	@override String get hide => 'إخفاء';
	@override String get off => 'إيقاف';
	@override String get offline => 'غير متصل بالانترنت';
	@override String get on => 'تشغيل';
	@override String get online => 'متصل بالانترنت';
	@override String get open => 'مفتوح';
	@override String get queue => 'طابور';
	@override String get quickSave => 'حفظ سريع';
	@override String get renamed => 'اعادة تسمية';
	@override String get reset => 'إعادة ضبط';
	@override String get restart => 'إعادة تشغيل';
	@override String get settings => 'إعدادات';
	@override String get skipped => 'تم تخطيه';
	@override String get start => 'ابدأ';
	@override String get stop => 'قف';
	@override String get save => 'احفظ';
	@override String get unchanged => 'دون تغيير';
	@override String get unknown => 'مجهول';
	@override String get noItemInClipboard => 'لا توجد عناصر في الحافظة';
}

// Path: receiveTab
class _StringsReceiveTabAr extends _StringsReceiveTabEn {
	_StringsReceiveTabAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'استلام';
	@override late final _StringsReceiveTabInfoBoxAr infoBox = _StringsReceiveTabInfoBoxAr._(_root);
}

// Path: sendTab
class _StringsSendTabAr extends _StringsSendTabEn {
	_StringsSendTabAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إرسال';
	@override late final _StringsSendTabSelectionAr selection = _StringsSendTabSelectionAr._(_root);
	@override late final _StringsSendTabPickerAr picker = _StringsSendTabPickerAr._(_root);
	@override String get shareIntentInfo => 'يمكنك أيضًا استخدام ميزة "مشاركة" بجهازك المحمول لتحديد الملفات بسهولة.';
	@override String get nearbyDevices => 'الأجهزة القريبة';
	@override String get thisDevice => 'هذا الجهاز';
	@override String get scan => 'ابحث عن أجهزة';
	@override String get sendMode => 'وضع الإرسال';
	@override late final _StringsSendTabSendModesAr sendModes = _StringsSendTabSendModesAr._(_root);
	@override String get sendModeHelp => 'شرح';
	@override String get help => 'يرجى التأكد من أن الهدف المطلوب موجود أيضًا في نفس شبكة wifi.';
	@override String get placeItems => 'ضع العناصر للمشاركة.';
}

// Path: settingsTab
class _StringsSettingsTabAr extends _StringsSettingsTabEn {
	_StringsSettingsTabAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إعدادات';
	@override late final _StringsSettingsTabGeneralAr general = _StringsSettingsTabGeneralAr._(_root);
	@override late final _StringsSettingsTabReceiveAr receive = _StringsSettingsTabReceiveAr._(_root);
	@override late final _StringsSettingsTabNetworkAr network = _StringsSettingsTabNetworkAr._(_root);
	@override String get advancedSettings => 'الإعدادات المتقدمة';
}

// Path: troubleshootPage
class _StringsTroubleshootPageAr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'حل المشكلات';
	@override String get subTitle => 'هل هذا التطبيق لا يعمل كما هو متوقع؟ هنا يمكنك العثور على الحلول الشائعة.';
	@override String get solution => 'الحل:';
	@override String get fixButton => 'إصلاح تلقائيًا';
	@override late final _StringsTroubleshootPageFirewallAr firewall = _StringsTroubleshootPageFirewallAr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionAr noConnection = _StringsTroubleshootPageNoConnectionAr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageAr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'السجل';
	@override String get openFolder => 'فتح المجلد';
	@override String get deleteHistory => 'حذف السجل';
	@override String get empty => 'السجل فارغ.';
	@override late final _StringsReceiveHistoryPageEntryActionsAr entryActions = _StringsReceiveHistoryPageEntryActionsAr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageAr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'التطبيقات (APK)';
	@override String get excludeSystemApps => 'استبعاد التطبيقات النظام';
	@override String get excludeAppsWithoutLaunchIntent => 'استبعاد التطبيقات غير القابلة للتشغيل';
	@override String apps({required Object n}) => '${n} تطبيق';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageAr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'حذف الكل';
}

// Path: receivePage
class _StringsReceivePageAr extends _StringsReceivePageEn {
	_StringsReceivePageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		one: 'يريد أن يرسل لك ملف',
		other: 'يريد أن يرسل لك ${n} ملفات',
	);
	@override String get subTitleMessage => 'أرسل لك رسالة:';
	@override String get subTitleLink => 'أرسل لك ارتباط:';
	@override String get canceled => 'ألغى المرسل الطلب.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageAr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خيارات';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'تم إيقافه تلقائيًا لوجود دلائل.';
}

// Path: sendPage
class _StringsSendPageAr extends _StringsSendPageEn {
	_StringsSendPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'بإنتظار الرد...';
	@override String get rejected => 'المستلم رفض الطلب.';
	@override String get busy => 'المستلم مشغول بطلب آخر.';
}

// Path: progressPage
class _StringsProgressPageAr extends _StringsProgressPageEn {
	_StringsProgressPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'يتم إرسال الملفات';
	@override String get titleReceiving => 'يتم استلام الملفات';
	@override String get savedToGallery => 'تم الحفظ في الصور';
	@override late final _StringsProgressPageTotalAr total = _StringsProgressPageTotalAr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageAr extends _StringsWebSharePageEn {
	_StringsWebSharePageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مشاركة عبر الرابط';
	@override String get loading => 'جاري بدء الخادم...';
	@override String get stopping => 'جاري إيقاف الخادم...';
	@override String get error => 'حدث خطأ أثناء بدء الخادم.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		one: 'افتح هذا الرابط في المتصفح:',
		other: 'افتح أحد هذه الروابط في المتصفح:',
	);
	@override String get requests => 'الطلبات';
	@override String get noRequests => 'لا يوجد طلبات حتى الآن.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'يستخدم تطبيق LocalSend شهادة موقع ذاتية التوقيع. يجب عليك قبولها في المتصفح.';
	@override String pendingRequests({required Object n}) => 'الطلبات المعلقة: ${n}';
}

// Path: aboutPage
class _StringsAboutPageAr extends _StringsAboutPageEn {
	_StringsAboutPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'عن LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageAr extends _StringsChangelogPageEn {
	_StringsChangelogPageAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'التغييرات';
}

// Path: aliasGenerator
class _StringsAliasGeneratorAr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
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
	@override List<String> get fruits => [
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
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsAr extends _StringsDialogsEn {
	_StringsDialogsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileAr addFile = _StringsDialogsAddFileAr._(_root);
	@override late final _StringsDialogsAddressInputAr addressInput = _StringsDialogsAddressInputAr._(_root);
	@override late final _StringsDialogsCancelSessionAr cancelSession = _StringsDialogsCancelSessionAr._(_root);
	@override late final _StringsDialogsCannotOpenFileAr cannotOpenFile = _StringsDialogsCannotOpenFileAr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeAr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeAr._(_root);
	@override late final _StringsDialogsErrorDialogAr errorDialog = _StringsDialogsErrorDialogAr._(_root);
	@override late final _StringsDialogsFavoriteDialogAr favoriteDialog = _StringsDialogsFavoriteDialogAr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogAr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogAr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogAr favoriteEditDialog = _StringsDialogsFavoriteEditDialogAr._(_root);
	@override late final _StringsDialogsFileInfoAr fileInfo = _StringsDialogsFileInfoAr._(_root);
	@override late final _StringsDialogsFileNameInputAr fileNameInput = _StringsDialogsFileNameInputAr._(_root);
	@override late final _StringsDialogsHistoryClearDialogAr historyClearDialog = _StringsDialogsHistoryClearDialogAr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedAr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedAr._(_root);
	@override late final _StringsDialogsMessageInputAr messageInput = _StringsDialogsMessageInputAr._(_root);
	@override late final _StringsDialogsNoFilesAr noFiles = _StringsDialogsNoFilesAr._(_root);
	@override late final _StringsDialogsNoPermissionAr noPermission = _StringsDialogsNoPermissionAr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformAr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformAr._(_root);
	@override late final _StringsDialogsQrAr qr = _StringsDialogsQrAr._(_root);
	@override late final _StringsDialogsQuickActionsAr quickActions = _StringsDialogsQuickActionsAr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeAr quickSaveNotice = _StringsDialogsQuickSaveNoticeAr._(_root);
	@override late final _StringsDialogsSendModeHelpAr sendModeHelp = _StringsDialogsSendModeHelpAr._(_root);
}

// Path: tray
class _StringsTrayAr extends _StringsTrayEn {
	_StringsTrayAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'أغلق LocalSend';
}

// Path: web
class _StringsWebAr extends _StringsWebEn {
	_StringsWebAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'مرفوضة';
	@override String get files => 'الملفات';
	@override String get fileName => 'اسم الملف';
	@override String get size => 'الحجم';
}

// Path: assetPicker
class _StringsAssetPickerAr extends _StringsAssetPickerEn {
	_StringsAssetPickerAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'تاكيد';
	@override String get cancel => 'إلغاء';
	@override String get edit => 'تعديل';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'فشل التحميل';
	@override String get original => 'أصلي';
	@override String get preview => 'معاينة';
	@override String get select => 'تحديد';
	@override String get emptyList => 'القائمة فارغة';
	@override String get unSupportedAssetType => 'نوع غير مدعوم';
	@override String get unableToAccessAll => 'لا يمكن الوصول إلى جميع الملفات الموجودة على الجهاز';
	@override String get viewingLimitedAssetsTip => 'إظهار الملفات والألبومات التي يمكن للتطبيق الوصول إليها فقط.';
	@override String get changeAccessibleLimitedAssets => 'السماح بالوصول إلى ملفات إضافية';
	@override String get accessAllTip => 'يمكن للتطبيق الوصول فقط إلى بعض الملفات على الجهاز. انتقل إلى إعدادات النظام واسمح للتطبيق بالوصول إلى جميع الوسائط على الجهاز.';
	@override String get goToSystemSettings => 'فتح إعدادات النظام';
	@override String get accessLimitedAssets => 'الاستمرار مع صلاحيات محدوده';
	@override String get accessiblePathName => 'ملفات يمكن الوصول إليها';
	@override String get sTypeAudioLabel => 'صوتي';
	@override String get sTypeImageLabel => 'صورة';
	@override String get sTypeVideoLabel => 'فيديو';
	@override String get sTypeOtherLabel => 'آخر';
	@override String get sActionPlayHint => 'تشغيل';
	@override String get sActionPreviewHint => 'معاينة';
	@override String get sActionSelectHint => 'تحديد';
	@override String get sActionSwitchPathLabel => 'تبديل المسار';
	@override String get sActionUseCameraHint => 'استخدم الكاميرا';
	@override String get sNameDurationLabel => 'مدة';
	@override String get sUnitAssetCountLabel => 'عدد';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxAr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'منفذ:';
	@override String get alias => 'اسم مستعار:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionAr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختيار';
	@override String files({required Object files}) => 'ملفات: ${files}';
	@override String size({required Object size}) => 'حجم: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerAr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get file => 'ملف';
	@override String get folder => 'مجلد';
	@override String get media => 'وسائط';
	@override String get text => 'نص';
	@override String get app => 'تطبيق';
	@override String get clipboard => 'لصق';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesAr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get single => 'مستلم واحد';
	@override String get multiple => 'متعدد المستلمين';
	@override String get link => 'مشاركة عبر الرابط';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralAr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'عام';
	@override String get brightness => 'سمة';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsAr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsAr._(_root);
	@override String get color => 'لون';
	@override late final _StringsSettingsTabGeneralColorOptionsAr colorOptions = _StringsSettingsTabGeneralColorOptionsAr._(_root);
	@override String get language => 'لغة';
	@override late final _StringsSettingsTabGeneralLanguageOptionsAr languageOptions = _StringsSettingsTabGeneralLanguageOptionsAr._(_root);
	@override String get saveWindowPlacement => 'إنهاء: حفظ موقع النافذة';
	@override String get minimizeToTray => 'إنهاء : أخفاء في شريط المهام';
	@override String get launchAtStartup => 'تشغيل تلقائي بعد تسجيل الدخول';
	@override String get launchMinimized => 'تشغيل تلقائي: ابدأ مخفيًا';
	@override String get animations => 'الرسوم المتحركة';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveAr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'استلم';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'حفظ في';
	@override String get downloads => '(التنزيلات)';
	@override String get saveToGallery => 'حفظ الوسائط في المعرض';
	@override String get saveToHistory => 'حفظ في التاريخ';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkAr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شبكة الاتصال';
	@override String get needRestart => 'أعد تشغيل الخادم لتطبيق الإعدادات!';
	@override String get server => 'الخادم';
	@override String get alias => 'اسم مستعار';
	@override String get deviceType => 'نوع الجهاز';
	@override String get deviceModel => 'نموذج الجهاز';
	@override String get port => 'منفذ';
	@override String portWarning({required Object defaultPort}) => 'ربما لا يتم الكشف عنك من قبل الأجهزة الأخرى لأنك تستخدم منفذ مخصص. (الافتراضي: ${defaultPort})';
	@override String get encryption => 'التشفير';
	@override String get multicastGroup => 'فرق البث المتعدد';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'ربما لا يتم الكشف عنك من قبل الأجهزة الأخرى لأنك تستخدم عنوان بث متعدد مخصص. (الافتراضي: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallAr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'يمكن لهذا التطبيق إرسال الملفات إلى الأجهزة الأخرى ولكن الأجهزة الأخرى لا يمكنها إرسال الملفات إلى هذا الجهاز.';
	@override String solution({required Object port}) => 'هذه المشكلة عادة ما تكون مشكلة في جدار الحماية. يمكنك حل هذه المشكلة عن طريق السماح بالاتصالات الواردة (UDP و TCP) على المنفذ ${port}.';
	@override String get openFirewall => 'افتح جدار الحماية';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionAr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'لا يمكن للجهازين اكتشاف بعضهما البعض ولا يمكنهما مشاركة الملفات.';
	@override String get solution => 'هل المشكلة موجودة على الجانبين؟ في هذه الحالة ، يجب عليك التأكد من أن الجهازين في نفس شبكة الواي فاي ويشتركان في نفس التكوين (المنفذ وعنوان البث المتعدد والتشفير). قد لا يسمح الواي فاي بالاتصال بين المشاركين. في هذه الحالة ، يجب تمكين هذا الخيار على الجهاز التوجيه.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsAr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get open => 'فتح الملف';
	@override String get info => 'معلومات';
	@override String get deleteFromHistory => 'حذف من السجل';
}

// Path: progressPage.total
class _StringsProgressPageTotalAr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleAr title = _StringsProgressPageTotalTitleAr._(_root);
	@override String count({required Object curr, required Object n}) => 'ملفات: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'حجم: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'سرعة: ${speed}/ثانية';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileAr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أضف إلى الاختيار';
	@override String get content => 'ماذا تريد أن تضيف؟';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputAr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أدخل العنوان';
	@override String get hashtag => 'رابطة هاشتاق';
	@override String get ip => 'عنوان IP';
	@override String get recentlyUsed => 'تم استخدامها مؤخرًا: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionAr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إلغاء نقل الملف';
	@override String get content => 'هل تريد حقًا إلغاء نقل الملف؟';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileAr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لا يمكن فتح الملف';
	@override String content({required Object file}) => 'تعذر فتح "${file}". هل تم نقل هذا الملف أو إعادة تسميته أو حذفه؟';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeAr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تم تعطيل التشفير';
	@override String get content => 'الاتصال يتم الآن عبر بروتوكول HTTP غير المشفر. لاستخدام HTTPS ، قم بتمكين التشفير مرة أخرى.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogAr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogAr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المفضلة';
	@override String get noFavorites => 'لا توجد أجهزة مفضلة بعد.';
	@override String get addFavorite => 'إضافة';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogAr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'حذف من المفضلة';
	@override String content({required Object name}) => 'هل ترغب حقًا في حذف "${name}" من قائمة المفضلة؟';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogAr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'إضافة إلى المفضلة';
	@override String get titleEdit => 'تعديل';
	@override String get name => 'الاسم';
	@override String get auto => '(تلقائي)';
	@override String get ip => 'عنوان IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoAr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات الملف';
	@override String get fileName => 'اسم الملف:';
	@override String get path => 'المسار:';
	@override String get size => 'الحجم:';
	@override String get sender => 'المرسل:';
	@override String get time => 'الوقت:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputAr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أدخل اسم الملف';
	@override String original({required Object original}) => 'أصلي: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogAr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'محو السجل';
	@override String get content => 'هل ترغب حقًا في محو السجل بالكامل؟';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedAr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'لا يمكن ل LocalSend العثور على الأجهزة الأخرى بدون الإذن بفحص الشبكة المحلية. يرجى منح هذا الإذن في الإعدادات.';
	@override String get gotoSettings => 'الإعدادات';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputAr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اكتب رسالة';
	@override String get multiline => 'متعدد الأسطر';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesAr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لم يتم اختيار اي ملف';
	@override String get content => 'الرجاء تحديد ملف واحد على الأقل.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionAr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'بدون إذن';
	@override String get content => 'لم تقم بمنح الأذونات اللازمة. يرجى منحها من الإعدادات.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformAr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'غير متاح';
	@override String get content => 'هذه الميزة متاحة فقط على:';
}

// Path: dialogs.qr
class _StringsDialogsQrAr extends _StringsDialogsQrEn {
	_StringsDialogsQrAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'رمز الاستجابة السريعة';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsAr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إجراءات سريعة';
	@override String get counter => 'عداد';
	@override String get prefix => 'بادئة';
	@override String get padZero => 'بدأ مع أصفار';
	@override String get sortBeforeCount => 'قم بالفرز أبجديًا مسبقًا';
	@override String get random => 'عشوائي';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeAr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'يتم قبول طلبات الملفات تلقائيًا. اعلم أن كل فرد في الشبكة المحلية يمكنه إرسال الملفات إليك.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpAr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أوضاع الإرسال';
	@override String get single => 'يقوم بإرسال الملفات إلى مستلم واحد. ستتم مسح الاختيار بعد انتهاء نقل الملف.';
	@override String get multiple => 'يقوم بإرسال الملفات إلى مستلمين متعددين. لن يتم مسح الاختيار.';
	@override String get link => 'يمكن للمستلمين الذين لا يحتوون على LocalSend تنزيل الملفات المحددة عن طريق فتح الرابط في متصفحهم.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsAr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'نظام';
	@override String get dark => 'داكن';
	@override String get light => 'فاتح';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsAr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'النظام';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsAr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'نظام';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleAr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'التقدم الكلي (${time})';
	@override String get finishedError => 'انتهى مع وجود خطأ';
	@override String get canceledSender => 'ألغي من قبل المرسل';
	@override String get canceledReceiver => 'ألغي من قبل المتلقي';
}
