part of 'strings.g.dart';

// Path: <root>
class _StringsBn extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsBn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.bn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <bn>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsBn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'বাংলা';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralBn general = _StringsGeneralBn._(_root);
	@override late final _StringsReceiveTabBn receiveTab = _StringsReceiveTabBn._(_root);
	@override late final _StringsSendTabBn sendTab = _StringsSendTabBn._(_root);
	@override late final _StringsSettingsTabBn settingsTab = _StringsSettingsTabBn._(_root);
	@override late final _StringsSelectedFilesPageBn selectedFilesPage = _StringsSelectedFilesPageBn._(_root);
	@override late final _StringsReceivePageBn receivePage = _StringsReceivePageBn._(_root);
	@override late final _StringsReceiveOptionsPageBn receiveOptionsPage = _StringsReceiveOptionsPageBn._(_root);
	@override late final _StringsSendPageBn sendPage = _StringsSendPageBn._(_root);
	@override late final _StringsProgressPageBn progressPage = _StringsProgressPageBn._(_root);
	@override late final _StringsAboutPageBn aboutPage = _StringsAboutPageBn._(_root);
	@override late final _StringsChangelogPageBn changelogPage = _StringsChangelogPageBn._(_root);
	@override late final _StringsAliasGeneratorBn aliasGenerator = _StringsAliasGeneratorBn._(_root);
	@override late final _StringsDialogsBn dialogs = _StringsDialogsBn._(_root);
	@override late final _StringsTrayBn tray = _StringsTrayBn._(_root);
	@override late final _StringsAssetPickerBn assetPicker = _StringsAssetPickerBn._(_root);
}

// Path: general
class _StringsGeneralBn extends _StringsGeneralEn {
	_StringsGeneralBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get accept => 'মেনে নিন';
	@override String get add => 'যোগ করুন';
	@override String get advanced => 'উন্নত করা হয়েছে';
	@override String get cancel => 'বাতিল করুন';
	@override String get close => 'বন্ধ করুন ';
	@override String get confirm => 'নিশ্চিত করুন';
	@override String get continueStr => 'চালিয়ে যান';
	@override String get copy => 'কপি করুন';
	@override String get copiedToClipboard => 'ক্লিপবোর্ডে কপি করা হয়েছে';
	@override String get decline => 'প্রত্যাখ্যান করুন';
	@override String get done => 'সম্পন্ন';
	@override String get edit => 'বাহির হোন';
	@override String get error => 'ভুল হয়েছে';
	@override String get example => 'উদাহরণ';
	@override String get files => 'ফাইল সমূহ';
	@override String get finished => 'শেষ হয়েছে';
	@override String get hide => 'আড়াল করুন';
	@override String get off => 'বন্ধ';
	@override String get offline => 'অফলাইন';
	@override String get on => 'চালু';
	@override String get online => 'অনলাইন';
	@override String get open => 'খোলা';
	@override String get queue => 'সারিবদ্ধ';
	@override String get quickSave => 'দ্রুত সেভ করুন';
	@override String get renamed => 'নাম পরিবর্তন করা হয়েছে';
	@override String get reset => 'রিসেট করুন';
	@override String get restart => 'পুনরায় চালু করুন';
	@override String get settings => 'সেটিংস';
	@override String get skipped => 'স্কিপ করা হয়েছে';
	@override String get start => 'শুরু করুন';
	@override String get stop => 'বন্ধ করুন';
	@override String get save => 'সেভ করুন';
	@override String get unchanged => 'অপরিবর্তিত';
	@override String get unknown => 'অজানা';
}

// Path: receiveTab
class _StringsReceiveTabBn extends _StringsReceiveTabEn {
	_StringsReceiveTabBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'গ্রহণ';
	@override late final _StringsReceiveTabInfoBoxBn infoBox = _StringsReceiveTabInfoBoxBn._(_root);
}

// Path: sendTab
class _StringsSendTabBn extends _StringsSendTabEn {
	_StringsSendTabBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'পাঠান';
	@override late final _StringsSendTabSelectionBn selection = _StringsSendTabSelectionBn._(_root);
	@override late final _StringsSendTabPickerBn picker = _StringsSendTabPickerBn._(_root);
	@override String get shareIntentInfo => 'আরো সহজে ফাইলসমূহ সিলেক্ট করার জন্য আপনি আপনার মোবাইলের "Share" ফিচারটি ব্যবহার করতে পারেন';
	@override String get nearbyDevices => 'আশেপাশের ডিভাইসসমূহ';
	@override String get thisDevice => 'এই ডিভাইস';
	@override String get scan => 'ডিভাইসসমূহ সন্ধান করুন';
	@override String get help => 'অনুগ্রহ করে নিশ্চিত করুন যে অন্য ডিভাসটিও একই ওয়াইফাই নেটওয়ার্কে রয়েছে।';
	@override String get placeItems => 'শেয়ার করার জন্য ফাইল রাখুন।';
}

// Path: settingsTab
class _StringsSettingsTabBn extends _StringsSettingsTabEn {
	_StringsSettingsTabBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'সেটিংস';
	@override late final _StringsSettingsTabGeneralBn general = _StringsSettingsTabGeneralBn._(_root);
	@override late final _StringsSettingsTabReceiveBn receive = _StringsSettingsTabReceiveBn._(_root);
	@override late final _StringsSettingsTabNetworkBn network = _StringsSettingsTabNetworkBn._(_root);
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageBn extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'সব ডিলিট করুন';
}

// Path: receivePage
class _StringsReceivePageBn extends _StringsReceivePageEn {
	_StringsReceivePageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bn'))(n,
		one: 'আপনাকে একটি ফাইল পাঠাতে চায়।',
		other: 'আপনাকে ${n}টি ফাইল পাঠাতে চায়।',
	);
	@override String get subTitleMessage => 'আপনাকে একটি বার্তা পাঠিয়েছে:';
	@override String get subTitleLink => 'আপনাকে একটি লিঙ্ক পাঠিয়েছে:';
	@override String get canceled => 'সেন্ডার রিকুয়েস্টটি কেন্সেল করেছে।';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageBn extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'অপশনসমূহ';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(${_root.appName} folder)';
}

// Path: sendPage
class _StringsSendPageBn extends _StringsSendPageEn {
	_StringsSendPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'রেস্পন্সের অপেক্ষায় ...';
	@override String get rejected => 'প্রাপক অনুরোধ প্রত্যাখ্যান করেছেন।';
}

// Path: progressPage
class _StringsProgressPageBn extends _StringsProgressPageEn {
	_StringsProgressPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'ফাইল পাঠানো হচ্ছে';
	@override String get titleReceiving => 'ফাইল গ্রহণ করা হচ্ছে';
	@override String get savedToGallery => 'Photos এ সেভ করা হয়েছে';
	@override late final _StringsProgressPageTotalBn total = _StringsProgressPageTotalBn._(_root);
}

// Path: aboutPage
class _StringsAboutPageBn extends _StringsAboutPageEn {
	_StringsAboutPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSend সম্পর্কে';
}

// Path: changelogPage
class _StringsChangelogPageBn extends _StringsChangelogPageEn {
	_StringsChangelogPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorBn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsBn extends _StringsDialogsEn {
	_StringsDialogsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileBn addFile = _StringsDialogsAddFileBn._(_root);
	@override late final _StringsDialogsAddressInputBn addressInput = _StringsDialogsAddressInputBn._(_root);
	@override late final _StringsDialogsCancelSessionBn cancelSession = _StringsDialogsCancelSessionBn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeBn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeBn._(_root);
	@override late final _StringsDialogsFileNameInputBn fileNameInput = _StringsDialogsFileNameInputBn._(_root);
	@override late final _StringsDialogsMessageInputBn messageInput = _StringsDialogsMessageInputBn._(_root);
	@override late final _StringsDialogsNoFilesBn noFiles = _StringsDialogsNoFilesBn._(_root);
	@override late final _StringsDialogsQuickActionsBn quickActions = _StringsDialogsQuickActionsBn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeBn quickSaveNotice = _StringsDialogsQuickSaveNoticeBn._(_root);
}

// Path: tray
class _StringsTrayBn extends _StringsTrayEn {
	_StringsTrayBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend থেকে প্রস্থান করুন';
}

// Path: assetPicker
class _StringsAssetPickerBn extends _StringsAssetPickerEn {
	_StringsAssetPickerBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxBn extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get ip => 'আইপি:';
	@override String get port => 'পোর্ট:';
	@override String get alias => 'উপনাম:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionBn extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'সিলেকশন';
	@override String files({required Object files}) => 'ফাইলসমূহ: ${files}';
	@override String size({required Object size}) => 'সাইজ: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerBn extends _StringsSendTabPickerEn {
	_StringsSendTabPickerBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get file => 'ফাইল';
	@override String get media => 'মিডিয়া';
	@override String get text => 'টেক্সট';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralBn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'জেনারেল';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsBn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsBn._(_root);
	@override String get language => 'ভাষা';
	@override late final _StringsSettingsTabGeneralLanguageOptionsBn languageOptions = _StringsSettingsTabGeneralLanguageOptionsBn._(_root);
	@override String get minimizeToTray => 'প্রস্থান করুন: ট্রেতে মিনিমাইজ করুন';
	@override String get launchAtStartup => 'লগইন করার পরে অটোস্টার্ট করুন';
	@override String get launchMinimized => 'অটোস্টার্ট: হিডেন থেকে শুরু করুন';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveBn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'গ্রহণ করুন';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'গন্তব্য';
	@override String get saveToGallery => 'গ্যালারিতে মিডিয়া সেভ করুন';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkBn extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'নেটওয়ার্ক';
	@override String get needRestart => 'সেটিংস প্রয়োগ করতে সার্ভার রিস্টার্ট করুন!';
	@override String get server => 'সার্ভার';
	@override String get alias => 'উপনাম';
	@override String get port => 'পোর্ট';
	@override String portWarning({required Object defaultPort}) => 'আপনি একটি কাস্টম পোর্ট ব্যবহার করছেন তাই আপনি অন্য ডিভাইস থেকে এই ডিভাইকে খুঁজে নাও হতে পারে. (default: ${defaultPort})';
	@override String get encryption => 'এনক্রিপশন';
}

// Path: progressPage.total
class _StringsProgressPageTotalBn extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleBn title = _StringsProgressPageTotalTitleBn._(_root);
	@override String count({required Object curr, required Object n}) => 'ফাইলসমূহ: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'সাইজ: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'স্পীড: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileBn extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'সিলেকশনে যুক্ত করুন';
	@override String get content => 'আপনি কি যোগ করতে চান?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputBn extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'এড্রেস লিখুন';
	@override String get hashtag => 'হ্যাশট্যাগ';
	@override String get ip => 'আইপি অ্যাড্রেস';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionBn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইল ট্রান্সফার বাতিল করুন';
	@override String get content => 'আপনি কি সত্যিই ফাইল ট্রান্সফার বাতিল করতে চান?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeBn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encryption বন্ধ করা হয়েছে';
	@override String get content => 'এখন কমিউনিকেশন আনএনক্রিপ্টেড HTTP প্রটোকলের মাধ্যমে করা হচ্ছে। HTTPS ব্যবহার করার জন্য আবার এনক্রিপশন চালু করুন';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputBn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইলের নাম লিখুন';
	@override String original({required Object original}) => 'আসল: ${original}';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputBn extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'মেসেজ লিখুন';
	@override String get multiline => 'মাল্টিলাইন';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesBn extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'কোনো ফাইল সিলেক্ট করা হয়নি';
	@override String get content => 'অন্তত একটি ফাইল সিলেক্ট করুন। ';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsBn extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'কুইক একশন্স';
	@override String get counter => 'কাউন্টার';
	@override String get prefix => 'উপসর্গ';
	@override String get padZero => 'শূন্য সহ প্যাড';
	@override String get sortBeforeCount => 'আগে থেকে বর্ণানুক্রমিকভাবে সাজান';
	@override String get random => 'এলোমেলো';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeBn extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'ফাইল অনুরোধ স্বয়ংক্রিয়ভাবে এক্সেপ্ট করা হয়। সচেতন থাকুন যেনা লোকাল নেটওয়ার্কের সবাই আপনাকে ফাইল পাঠাতে পারে।';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsBn extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get system => 'সিস্টেম';
	@override String get dark => 'ডার্ক';
	@override String get light => 'লাইট';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsBn extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get system => 'সিস্টেম';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleBn extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'মোট অগ্রগতি (${time})';
	@override String get finishedError => 'ত্রুটি সহ সমাপ্ত হয়েছে';
	@override String get canceledSender => 'সেন্ডারের দ্বারা বাতিল করা হয়েছে';
	@override String get canceledReceiver => 'রিসিভার দ্বারা বাতিল করা হয়েছে';
}
