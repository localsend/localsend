part of 'strings.g.dart';

// Path: <root>
class _StringsBn extends Translations {
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
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsBn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'বাংলা';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralBn general = _StringsGeneralBn._(_root);
	@override late final _StringsReceiveTabBn receiveTab = _StringsReceiveTabBn._(_root);
	@override late final _StringsSendTabBn sendTab = _StringsSendTabBn._(_root);
	@override late final _StringsSettingsTabBn settingsTab = _StringsSettingsTabBn._(_root);
	@override late final _StringsTroubleshootPageBn troubleshootPage = _StringsTroubleshootPageBn._(_root);
	@override late final _StringsReceiveHistoryPageBn receiveHistoryPage = _StringsReceiveHistoryPageBn._(_root);
	@override late final _StringsApkPickerPageBn apkPickerPage = _StringsApkPickerPageBn._(_root);
	@override late final _StringsSelectedFilesPageBn selectedFilesPage = _StringsSelectedFilesPageBn._(_root);
	@override late final _StringsReceivePageBn receivePage = _StringsReceivePageBn._(_root);
	@override late final _StringsReceiveOptionsPageBn receiveOptionsPage = _StringsReceiveOptionsPageBn._(_root);
	@override late final _StringsSendPageBn sendPage = _StringsSendPageBn._(_root);
	@override late final _StringsProgressPageBn progressPage = _StringsProgressPageBn._(_root);
	@override late final _StringsWebSharePageBn webSharePage = _StringsWebSharePageBn._(_root);
	@override late final _StringsAboutPageBn aboutPage = _StringsAboutPageBn._(_root);
	@override late final _StringsDonationPageBn donationPage = _StringsDonationPageBn._(_root);
	@override late final _StringsChangelogPageBn changelogPage = _StringsChangelogPageBn._(_root);
	@override late final _StringsAliasGeneratorBn aliasGenerator = _StringsAliasGeneratorBn._(_root);
	@override late final _StringsDialogsBn dialogs = _StringsDialogsBn._(_root);
	@override late final _StringsTrayBn tray = _StringsTrayBn._(_root);
	@override late final _StringsWebBn web = _StringsWebBn._(_root);
	@override late final _StringsAssetPickerBn assetPicker = _StringsAssetPickerBn._(_root);
}

// Path: general
class _StringsGeneralBn extends _StringsGeneralEn {
	_StringsGeneralBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get accept => 'মেনে নিন';
	@override String get accepted => 'গৃহীত';
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
	@override String get delete => 'মুছে ফেলা';
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
	@override String get noItemInClipboard => 'ক্লিপবোর্ডে কোনো আইটেম নেই';
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
	@override String get sendMode => 'মোড পাঠান';
	@override late final _StringsSendTabSendModesBn sendModes = _StringsSendTabSendModesBn._(_root);
	@override String get sendModeHelp => 'ব্যাখ্যা';
	@override String get help => 'অনুগ্রহ করে নিশ্চিত করুন যে পছন্দসই লক্ষ্যটিও একই ওয়াইফাই নেটওয়ার্কে রয়েছে।';
	@override String get placeItems => 'শেয়ার করার জন্য আইটেম রাখুন।';
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
	@override late final _StringsSettingsTabOtherBn other = _StringsSettingsTabOtherBn._(_root);
	@override String get advancedSettings => 'উন্নত সেটিংস';
}

// Path: troubleshootPage
class _StringsTroubleshootPageBn extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'সমস্যা সমাধান';
	@override String get subTitle => 'এই অ্যাপটি কি আশানুরূপ কাজ করে না? এখানে আপনি সাধারণ সমাধান খুঁজে পেতে পারেন.';
	@override String get solution => 'সমাধান:';
	@override String get fixButton => 'স্বয়ংক্রিয়ভাবে ঠিক করুন';
	@override late final _StringsTroubleshootPageFirewallBn firewall = _StringsTroubleshootPageFirewallBn._(_root);
	@override late final _StringsTroubleshootPageNoConnectionBn noConnection = _StringsTroubleshootPageNoConnectionBn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageBn extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ইতিহাস';
	@override String get openFolder => 'ফোল্ডার খোলা';
	@override String get deleteHistory => 'ইতিহাস মুছুন';
	@override String get empty => 'ইতিহাস শূন্য।';
	@override late final _StringsReceiveHistoryPageEntryActionsBn entryActions = _StringsReceiveHistoryPageEntryActionsBn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageBn extends _StringsApkPickerPageEn {
	_StringsApkPickerPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'অ্যাপস (এপিকে)';
	@override String get excludeSystemApps => 'সিস্টেম অ্যাপ বাদ দিন';
	@override String get excludeAppsWithoutLaunchIntent => 'অ-লঞ্চযোগ্য অ্যাপগুলি বাদ দিন';
	@override String apps({required Object n}) => '${n} Apps';
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
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'স্বয়ংক্রিয়ভাবে বন্ধ কারণ ডিরেক্টরি আছে.';
}

// Path: sendPage
class _StringsSendPageBn extends _StringsSendPageEn {
	_StringsSendPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'রেস্পন্সের অপেক্ষায় ...';
	@override String get rejected => 'প্রাপক অনুরোধ প্রত্যাখ্যান করেছেন।';
	@override String get busy => 'প্রাপক অন্য অনুরোধে ব্যস্ত।';
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

// Path: webSharePage
class _StringsWebSharePageBn extends _StringsWebSharePageEn {
	_StringsWebSharePageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'লিঙ্কের মাধ্যমে শেয়ার করুন';
	@override String get loading => 'সার্ভার শুরু হচ্ছে...';
	@override String get stopping => 'সার্ভার বন্ধ করা হচ্ছে...';
	@override String get error => 'সার্ভার শুরু করার সময় একটি ত্রুটি ঘটেছে৷.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bn'))(n,
		one: 'ব্রাউজারে এই লিঙ্কটি খুলুন:',
		other: 'ব্রাউজারে এই লিঙ্কগুলির একটি খুলুন:',
	);
	@override String get requests => 'অনুরোধ';
	@override String get noRequests => 'এখনো কোনো অনুরোধ নেই.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend একটি স্ব-স্বাক্ষরিত শংসাপত্র ব্যবহার করে। আপনাকে ব্রাউজারে এটি গ্রহণ করতে হবে।';
	@override String pendingRequests({required Object n}) => 'অনুরোধ অপেক্ষারত: ${n}';
}

// Path: aboutPage
class _StringsAboutPageBn extends _StringsAboutPageEn {
	_StringsAboutPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSend সম্পর্কে';
	@override List<String> get description => [
		'LocalSend হল একটি বিনামূল্যের, ওপেন সোর্স অ্যাপ যা আপনাকে ইন্টারনেট সংযোগের প্রয়োজন ছাড়াই আপনার স্থানীয় নেটওয়ার্কে কাছাকাছি ডিভাইসগুলির সাথে ফাইল এবং বার্তাগুলিকে নিরাপদে ভাগ করতে দেয়৷',
		'এই অ্যাপটি Android, iOS, macOS, Windows এবং Linux-এ উপলব্ধ। আপনি অফিসিয়াল হোমপেজে সমস্ত ডাউনলোড বিকল্প খুঁজে পেতে পারেন।',
	];
	@override String get author => 'লেখক';
	@override String get contributors => 'অবদানকারী';
	@override String get translators => 'অনুবাদক';
}

// Path: donationPage
class _StringsDonationPageBn extends _StringsDonationPageEn {
	_StringsDonationPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'দান';
	@override String get info => 'LocalSend বিনামূল্যে, ওপেন সোর্স এবং কোনো বিজ্ঞাপন ছাড়াই। আপনি যদি অ্যাপটি পছন্দ করেন তবে আপনি একটি অনুদান দিয়ে বিকাশকে সমর্থন করতে পারেন।';
	@override String donate({required Object amount}) => 'দান ${amount}';
	@override String get thanks => 'আপনাকে অনেক ধন্যবাদ!';
	@override String get restore => 'ক্রয় পুনরুদ্ধার';
}

// Path: changelogPage
class _StringsChangelogPageBn extends _StringsChangelogPageEn {
	_StringsChangelogPageBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'চেঞ্জলগ';
}

// Path: aliasGenerator
class _StringsAliasGeneratorBn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'আরাধ্য',
		'সুন্দর',
		'বড়',
		'উজ্জ্বল',
		'পরিষ্কার',
		'চতুর',
		'ঠান্ডা',
		'চতুর',
		'ধূর্ত',
		'নির্ধারিত',
		'অনলস',
		'দক্ষ',
		'অসাধারণ',
		'দ্রুত',
		'ভালো',
		'তাজা',
		'ভাল',
		'চমৎকার',
		'দারুণ',
		'সুদর্শন',
		'গরম',
		'দয়াময়',
		'সুন্দর',
		'রহস্যময়',
		'পরিচ্ছন্ন',
		'সুন্দর',
		'রোগী',
		'সুন্দর',
		'ক্ষমতাশালী',
		'ধনী',
		'গোপন',
		'স্মার্ট',
		'কঠিন',
		'বিশেষ',
		'কৌশলগত',
		'শক্তিশালী',
		'পরিপাটি',
		'জ্ঞানী',
	];
	@override List<String> get fruits => [
		'আপেল',
		'অ্যাভোকাডো',
		'কলা',
		'ব্ল্যাকবেরি',
		'ব্লুবেরি',
		'ব্রকলি',
		'গাজর',
		'চেরি',
		'নারকেল',
		'আঙ্গুর',
		'লেবু',
		'লেটুস',
		'আম',
		'তরমুজ',
		'মাশরুম',
		'পেঁয়াজ',
		'কমলা',
		'পেঁপে',
		'পীচ',
		'নাশপাতি',
		'আনারস',
		'আলু',
		'কুমড়া',
		'রাস্পবেরি',
		'স্ট্রবেরি',
		'টমেটো',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsBn extends _StringsDialogsEn {
	_StringsDialogsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileBn addFile = _StringsDialogsAddFileBn._(_root);
	@override late final _StringsDialogsAddressInputBn addressInput = _StringsDialogsAddressInputBn._(_root);
	@override late final _StringsDialogsCancelSessionBn cancelSession = _StringsDialogsCancelSessionBn._(_root);
	@override late final _StringsDialogsCannotOpenFileBn cannotOpenFile = _StringsDialogsCannotOpenFileBn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeBn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeBn._(_root);
	@override late final _StringsDialogsErrorDialogBn errorDialog = _StringsDialogsErrorDialogBn._(_root);
	@override late final _StringsDialogsFavoriteDialogBn favoriteDialog = _StringsDialogsFavoriteDialogBn._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogBn favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogBn._(_root);
	@override late final _StringsDialogsFavoriteEditDialogBn favoriteEditDialog = _StringsDialogsFavoriteEditDialogBn._(_root);
	@override late final _StringsDialogsFileInfoBn fileInfo = _StringsDialogsFileInfoBn._(_root);
	@override late final _StringsDialogsFileNameInputBn fileNameInput = _StringsDialogsFileNameInputBn._(_root);
	@override late final _StringsDialogsHistoryClearDialogBn historyClearDialog = _StringsDialogsHistoryClearDialogBn._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedBn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedBn._(_root);
	@override late final _StringsDialogsMessageInputBn messageInput = _StringsDialogsMessageInputBn._(_root);
	@override late final _StringsDialogsNoFilesBn noFiles = _StringsDialogsNoFilesBn._(_root);
	@override late final _StringsDialogsNoPermissionBn noPermission = _StringsDialogsNoPermissionBn._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformBn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformBn._(_root);
	@override late final _StringsDialogsQrBn qr = _StringsDialogsQrBn._(_root);
	@override late final _StringsDialogsQuickActionsBn quickActions = _StringsDialogsQuickActionsBn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeBn quickSaveNotice = _StringsDialogsQuickSaveNoticeBn._(_root);
	@override late final _StringsDialogsSendModeHelpBn sendModeHelp = _StringsDialogsSendModeHelpBn._(_root);
}

// Path: tray
class _StringsTrayBn extends _StringsTrayEn {
	_StringsTrayBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend থেকে প্রস্থান করুন';
}

// Path: web
class _StringsWebBn extends _StringsWebEn {
	_StringsWebBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'প্রত্যাখ্যাত';
	@override String get files => 'নথি পত্র';
	@override String get fileName => 'ফাইলের নাম';
	@override String get size => 'আকার';
}

// Path: assetPicker
class _StringsAssetPickerBn extends _StringsAssetPickerEn {
	_StringsAssetPickerBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'নিশ্চিত করুন';
	@override String get cancel => 'বাতিল করুন';
	@override String get edit => 'সম্পাদনা করুন';
	@override String get gifIndicator => 'জিআইএফ';
	@override String get loadFailed => 'লোড ব্যর্থ হয়েছে';
	@override String get original => 'উৎপত্তি';
	@override String get preview => 'পূর্বরূপ';
	@override String get select => 'নির্বাচন করুন';
	@override String get emptyList => 'খালি তালিকা';
	@override String get unSupportedAssetType => 'অসমর্থিত ফাইল টাইপ.';
	@override String get unableToAccessAll => 'ডিভাইসে সমস্ত ফাইল অ্যাক্সেস করতে অক্ষম৷';
	@override String get viewingLimitedAssetsTip => 'শুধুমাত্র অ্যাপে অ্যাক্সেসযোগ্য ফাইল এবং অ্যালবাম দেখুন.';
	@override String get changeAccessibleLimitedAssets => 'অ্যাক্সেসযোগ্য ফাইল আপডেট করতে ক্লিক করুন';
	@override String get accessAllTip => 'অ্যাপ শুধুমাত্র ডিভাইসে কিছু ফাইল অ্যাক্সেস করতে পারে। সিস্টেম সেটিংসে যান এবং অ্যাপটিকে ডিভাইসের সমস্ত মিডিয়া অ্যাক্সেস করার অনুমতি দিন।';
	@override String get goToSystemSettings => 'সিস্টেম সেটিংসে যান';
	@override String get accessLimitedAssets => 'সীমিত অ্যাক্সেস দিয়ে চালিয়ে যান';
	@override String get accessiblePathName => 'অ্যাক্সেসযোগ্য ফাইল';
	@override String get sTypeAudioLabel => 'শ্রুতি';
	@override String get sTypeImageLabel => 'ছবি';
	@override String get sTypeVideoLabel => 'ভিডিও';
	@override String get sTypeOtherLabel => 'অন্যান্য মিডিয়া';
	@override String get sActionPlayHint => 'খেলা';
	@override String get sActionPreviewHint => 'পূর্বরূপ';
	@override String get sActionSelectHint => 'নির্বাচন করুন';
	@override String get sActionSwitchPathLabel => 'পথ পরিবর্তন';
	@override String get sActionUseCameraHint => 'ক্যামেরা ব্যবহার করুন';
	@override String get sNameDurationLabel => 'সময়কাল';
	@override String get sUnitAssetCountLabel => 'গণনা';
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
	@override String get folder => 'ফোল্ডার';
	@override String get media => 'মিডিয়া';
	@override String get text => 'টেক্সট';
	@override String get app => 'আবেদন';
	@override String get clipboard => 'পেস্ট করুন';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesBn extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get single => 'একক প্রাপক';
	@override String get multiple => 'একাধিক প্রাপক';
	@override String get link => 'লিঙ্কের মাধ্যমে শেয়ার করুন';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralBn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'জেনারেল';
	@override String get brightness => 'থিম';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsBn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsBn._(_root);
	@override String get color => 'রঙ';
	@override late final _StringsSettingsTabGeneralColorOptionsBn colorOptions = _StringsSettingsTabGeneralColorOptionsBn._(_root);
	@override String get language => 'ভাষা';
	@override late final _StringsSettingsTabGeneralLanguageOptionsBn languageOptions = _StringsSettingsTabGeneralLanguageOptionsBn._(_root);
	@override String get saveWindowPlacement => 'প্রস্থান করুন: উইন্ডো প্লেসমেন্ট সংরক্ষণ করুন';
	@override String get minimizeToTray => 'প্রস্থান করুন: ট্রেতে মিনিমাইজ করুন';
	@override String get launchAtStartup => 'লগইন করার পরে অটোস্টার্ট করুন';
	@override String get launchMinimized => 'অটোস্টার্ট: হিডেন থেকে শুরু করুন';
	@override String get animations => 'অ্যানিমেশন';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveBn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'গ্রহণ করুন';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'অটো ফিনিশ';
	@override String get destination => 'গন্তব্য';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'গ্যালারিতে মিডিয়া সেভ করুন';
	@override String get saveToHistory => 'ইতিহাসে সংরক্ষণ করুন';
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
	@override String get deviceType => 'ডিভাইসের ধরন';
	@override String get deviceModel => 'ডিভাইস মডেল';
	@override String get port => 'পোর্ট';
	@override String portWarning({required Object defaultPort}) => 'আপনি একটি কাস্টম পোর্ট ব্যবহার করছেন তাই আপনি অন্য ডিভাইস থেকে এই ডিভাইকে খুঁজে নাও হতে পারে. (default: ${defaultPort})';
	@override String get encryption => 'এনক্রিপশন';
	@override String get multicastGroup => 'মাল্টিকাস্ট';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'আপনি একটি কাস্টম মাল্টিকাস্ট ঠিকানা ব্যবহার করছেন কারণ আপনি অন্য ডিভাইস দ্বারা সনাক্ত নাও হতে পারে. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherBn extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'অন্যান্য';
	@override String get support => 'লোকালসেন্ড সমর্থন করুন';
	@override String get donate => 'দান';
	@override String get privacyPolicy => 'গোপনীয়তা নীতি';
	@override String get termsOfUse => 'ব্যবহারের শর্তাবলী';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallBn extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'এই অ্যাপটি অন্য ডিভাইসে ফাইল পাঠাতে পারে কিন্তু অন্য ডিভাইস এই ডিভাইসে ফাইল পাঠাতে পারে না।';
	@override String solution({required Object port}) => 'এটি সম্ভবত একটি ফায়ারওয়াল সমস্যা। আপনি পোর্টে ইনকামিং সংযোগ (UDP এবং TCP) অনুমতি দিয়ে এটি সমাধান করতে পারেন ${port}.';
	@override String get openFirewall => 'ফায়ারওয়াল খুলুন';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionBn extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'উভয় ডিভাইস একে অপরকে আবিষ্কার করতে পারে না বা তারা ফাইল ভাগ করতে পারে না।';
	@override String get solution => 'সমস্যা কি দুই দিকেই আছে? তারপরে আপনাকে নিশ্চিত করতে হবে যে উভয় ডিভাইস একই ওয়াইফাই নেটওয়ার্কে রয়েছে এবং একই কনফিগারেশন (পোর্ট, মাল্টিকাস্ট ঠিকানা, এনক্রিপশন) ভাগ করে নিয়েছে। ওয়াইফাই অংশগ্রহণকারীদের মধ্যে যোগাযোগের অনুমতি নাও দিতে পারে। এই ক্ষেত্রে, এই বিকল্পটি রাউটারে সক্রিয় করা আবশ্যক।';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsBn extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get open => 'খোলা ফাইল';
	@override String get info => 'তথ্য';
	@override String get deleteFromHistory => 'ইতিহাস থেকে মুছে ফেলুন';
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
	@override String get title => 'নির্বাচন যোগ করুন';
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
	@override String get recentlyUsed => 'সম্প্রতি ব্যবহৃত: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionBn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইল ট্রান্সফার বাতিল করুন';
	@override String get content => 'আপনি কি সত্যিই ফাইল ট্রান্সফার বাতিল করতে চান?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileBn extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইলটি খুলতে পারছি না';
	@override String content({required Object file}) => '"${file}" খোলা যায়নি। এই ফাইলটি কি সরানো হয়েছে, নাম পরিবর্তন করা হয়েছে বা মুছে ফেলা হয়েছে?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeBn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encryption বন্ধ করা হয়েছে';
	@override String get content => 'এখন কমিউনিকেশন আনএনক্রিপ্টেড HTTP প্রটোকলের মাধ্যমে করা হচ্ছে। HTTPS ব্যবহার করার জন্য আবার এনক্রিপশন চালু করুন';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogBn extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogBn extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'প্রিয়';
	@override String get noFavorites => 'এখনও কোন পছন্দসই ডিভাইস নেই.';
	@override String get addFavorite => 'যোগ করুন';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogBn extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'যোগ করুনযোগ করুন';
	@override String content({required Object name}) => 'আপনি কি সত্যিই প্রিয় থেকে মুছে ফেলতে চান "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogBn extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'ফেভারিটে যোগ করুন';
	@override String get titleEdit => 'সামঞ্জস্য করুন';
	@override String get name => 'উপনাম';
	@override String get auto => '(auto)';
	@override String get ip => 'আইপি ঠিকানা';
	@override String get port => 'বন্দর';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoBn extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইল তথ্য';
	@override String get fileName => 'ফাইলের নাম:';
	@override String get path => 'পথ:';
	@override String get size => 'আকার:';
	@override String get sender => 'প্রেরক:';
	@override String get time => 'সময়:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputBn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ফাইলের নাম লিখুন';
	@override String original({required Object original}) => 'আসল: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogBn extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'ইতিহাস পরিষ্কার করুন';
	@override String get content => 'আপনি কি সত্যিই সমগ্র ইতিহাস মুছে ফেলতে চান?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedBn extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'স্থানীয় নেটওয়ার্ক স্ক্যান করার অনুমতি ছাড়া LocalSend অন্য ডিভাইস খুঁজে পায় না। অনুগ্রহ করে সেটিংসে এই অনুমতি দিন.';
	@override String get gotoSettings => 'সেটিংস';
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

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionBn extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'অনুমতি নেই';
	@override String get content => 'আপনি প্রয়োজনীয় অনুমতি প্রদান করেননি. অনুগ্রহ করে সেটিংসে তাদের অনুমতি দিন।';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformBn extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'পাওয়া যায় না';
	@override String get content => 'এই বৈশিষ্ট্য শুধুমাত্র উপলব্ধ:';
}

// Path: dialogs.qr
class _StringsDialogsQrBn extends _StringsDialogsQrEn {
	_StringsDialogsQrBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR কোড';
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

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpBn extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get title => 'মোড পাঠান';
	@override String get single => 'একজন প্রাপকের কাছে ফাইল পাঠায়। ফাইল স্থানান্তর সমাপ্ত হওয়ার পরে নির্বাচন পরিষ্কার করা হবে.';
	@override String get multiple => 'একাধিক প্রাপককে ফাইল পাঠায়। নির্বাচন সাফ করা হবে না.';
	@override String get link => 'যাদের কাছে LocalSend ইনস্টল নেই তারা তাদের ব্রাউজারে লিঙ্কটি খুলে নির্বাচিত ফাইলগুলি ডাউনলোড করতে পারেন৷';
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

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsBn extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsBn._(_StringsBn root) : this._root = root, super._(root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get system => 'পদ্ধতি';
	@override String get oled => 'OLED';
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
