part of 'strings.g.dart';

// Path: <root>
class _StringsFilPh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFilPh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.filPh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fil-PH>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsFilPh _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Filipino';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralFilPh general = _StringsGeneralFilPh._(_root);
	@override late final _StringsReceiveTabFilPh receiveTab = _StringsReceiveTabFilPh._(_root);
	@override late final _StringsSendTabFilPh sendTab = _StringsSendTabFilPh._(_root);
	@override late final _StringsSettingsTabFilPh settingsTab = _StringsSettingsTabFilPh._(_root);
	@override late final _StringsTroubleshootPageFilPh troubleshootPage = _StringsTroubleshootPageFilPh._(_root);
	@override late final _StringsReceiveHistoryPageFilPh receiveHistoryPage = _StringsReceiveHistoryPageFilPh._(_root);
	@override late final _StringsApkPickerPageFilPh apkPickerPage = _StringsApkPickerPageFilPh._(_root);
	@override late final _StringsSelectedFilesPageFilPh selectedFilesPage = _StringsSelectedFilesPageFilPh._(_root);
	@override late final _StringsReceivePageFilPh receivePage = _StringsReceivePageFilPh._(_root);
	@override late final _StringsReceiveOptionsPageFilPh receiveOptionsPage = _StringsReceiveOptionsPageFilPh._(_root);
	@override late final _StringsSendPageFilPh sendPage = _StringsSendPageFilPh._(_root);
	@override late final _StringsProgressPageFilPh progressPage = _StringsProgressPageFilPh._(_root);
	@override late final _StringsWebSharePageFilPh webSharePage = _StringsWebSharePageFilPh._(_root);
	@override late final _StringsAboutPageFilPh aboutPage = _StringsAboutPageFilPh._(_root);
	@override late final _StringsDonationPageFilPh donationPage = _StringsDonationPageFilPh._(_root);
	@override late final _StringsChangelogPageFilPh changelogPage = _StringsChangelogPageFilPh._(_root);
	@override late final _StringsAliasGeneratorFilPh aliasGenerator = _StringsAliasGeneratorFilPh._(_root);
	@override late final _StringsDialogsFilPh dialogs = _StringsDialogsFilPh._(_root);
	@override late final _StringsTrayFilPh tray = _StringsTrayFilPh._(_root);
	@override late final _StringsWebFilPh web = _StringsWebFilPh._(_root);
	@override late final _StringsAssetPickerFilPh assetPicker = _StringsAssetPickerFilPh._(_root);
}

// Path: general
class _StringsGeneralFilPh extends _StringsGeneralEn {
	_StringsGeneralFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Tanggapin';
	@override String get accepted => 'Tinanggap';
	@override String get add => 'Magdagdag';
	@override String get advanced => 'Advanced';
	@override String get cancel => 'Kanselahin';
	@override String get close => 'Isara';
	@override String get confirm => 'Kumpirmahin';
	@override String get continueStr => 'Magpatuloy';
	@override String get copy => 'Kopyahin';
	@override String get copiedToClipboard => 'Kopyahin sa Clipboard';
	@override String get decline => 'Tanggihan';
	@override String get done => 'Tapos Na';
	@override String get delete => 'Tanggalin';
	@override String get edit => 'Baguhin';
	@override String get error => 'Error';
	@override String get example => 'Halimbawa';
	@override String get files => 'Files';
	@override String get finished => 'Tapos Na';
	@override String get hide => 'Itago';
	@override String get off => 'Sarado';
	@override String get offline => 'Offline';
	@override String get on => 'Bukas';
	@override String get online => 'Online';
	@override String get open => 'Buksan';
	@override String get queue => 'Pila';
	@override String get quickSave => 'Quick Save';
	@override String get renamed => 'Pinangalanan';
	@override String get reset => 'Reset';
	@override String get restart => 'Restart';
	@override String get settings => 'Settings';
	@override String get skipped => 'Nilaktawan';
	@override String get start => 'Simulan';
	@override String get stop => 'Ihinto';
	@override String get save => 'Save';
	@override String get unchanged => 'Walang Pagbabago';
	@override String get unknown => 'Hindi Kilala';
	@override String get noItemInClipboard => 'Walang Item sa Clipboard';
}

// Path: receiveTab
class _StringsReceiveTabFilPh extends _StringsReceiveTabEn {
	_StringsReceiveTabFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tumanggap';
	@override late final _StringsReceiveTabInfoBoxFilPh infoBox = _StringsReceiveTabInfoBoxFilPh._(_root);
}

// Path: sendTab
class _StringsSendTabFilPh extends _StringsSendTabEn {
	_StringsSendTabFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Magpadala';
	@override late final _StringsSendTabSelectionFilPh selection = _StringsSendTabSelectionFilPh._(_root);
	@override late final _StringsSendTabPickerFilPh picker = _StringsSendTabPickerFilPh._(_root);
	@override String get shareIntentInfo => 'Maaaring gamitin ang "Share" feature sa iyong mobile device para sa mas madaling pagpili ng mga file.';
	@override String get nearbyDevices => 'Malalapit na mga device';
	@override String get thisDevice => 'Ang Device na Ito';
	@override String get scan => 'Maghanap ng mga device';
	@override String get sendMode => 'Send mode';
	@override late final _StringsSendTabSendModesFilPh sendModes = _StringsSendTabSendModesFilPh._(_root);
	@override String get sendModeHelp => 'Paliwanag';
	@override String get help => 'Mangyaring siguraduhin na ang target ay nasa parehas na wifi network.';
	@override String get placeItems => 'Maglagay ng mga bagay na i-share.';
}

// Path: settingsTab
class _StringsSettingsTabFilPh extends _StringsSettingsTabEn {
	_StringsSettingsTabFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override late final _StringsSettingsTabGeneralFilPh general = _StringsSettingsTabGeneralFilPh._(_root);
	@override late final _StringsSettingsTabReceiveFilPh receive = _StringsSettingsTabReceiveFilPh._(_root);
	@override late final _StringsSettingsTabNetworkFilPh network = _StringsSettingsTabNetworkFilPh._(_root);
	@override late final _StringsSettingsTabOtherFilPh other = _StringsSettingsTabOtherFilPh._(_root);
	@override String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _StringsTroubleshootPageFilPh extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Troubleshoot';
	@override String get subTitle => 'Hindi gumagana ang app na ito gaya nang inaasahan? Narito ang mga madalas na solusyon.';
	@override String get solution => 'Solusyon:';
	@override String get fixButton => 'Awtomatikong ayusin';
	@override late final _StringsTroubleshootPageFirewallFilPh firewall = _StringsTroubleshootPageFirewallFilPh._(_root);
	@override late final _StringsTroubleshootPageNoConnectionFilPh noConnection = _StringsTroubleshootPageNoConnectionFilPh._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageFilPh extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'History';
	@override String get openFolder => 'Buksan ang folder';
	@override String get deleteHistory => 'Burahin ang history';
	@override String get empty => 'Walang laman ang history.';
	@override late final _StringsReceiveHistoryPageEntryActionsFilPh entryActions = _StringsReceiveHistoryPageEntryActionsFilPh._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageFilPh extends _StringsApkPickerPageEn {
	_StringsApkPickerPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'Ibukod ang mga system app';
	@override String get excludeAppsWithoutLaunchIntent => 'Ibukod and mga non-launchable app';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageFilPh extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Burahin lahat';
}

// Path: receivePage
class _StringsReceivePageFilPh extends _StringsReceivePageEn {
	_StringsReceivePageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fil'))(n,
		one: 'ay gustong magpadala sa iyo ng file',
		other: 'ay gustong magpadala sa iyo ng ${n} na mga file',
	);
	@override String get subTitleMessage => 'ay nagpadala sa iyo ng mensahe:';
	@override String get subTitleLink => 'ay nagpadala sa iyo ng link:';
	@override String get canceled => 'Ang sender ay nagkansela ng request.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageFilPh extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Awtomatikong pinatay dahil mayroong mga directories.';
}

// Path: sendPage
class _StringsSendPageFilPh extends _StringsSendPageEn {
	_StringsSendPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Naghihintay ng response...';
	@override String get rejected => 'Tinanggihan ng recipient ang request.';
	@override String get busy => 'Ang recipient ay abala pa sa ibang request.';
}

// Path: progressPage
class _StringsProgressPageFilPh extends _StringsProgressPageEn {
	_StringsProgressPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Nagpapadala ng mga file';
	@override String get titleReceiving => 'Tumatanggap ng mga file';
	@override String get savedToGallery => 'Naka-save sa Photos';
	@override late final _StringsProgressPageTotalFilPh total = _StringsProgressPageTotalFilPh._(_root);
}

// Path: webSharePage
class _StringsWebSharePageFilPh extends _StringsWebSharePageEn {
	_StringsWebSharePageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'I-share gamit ang link';
	@override String get loading => 'Binubuksan ang server...';
	@override String get stopping => 'Ihinihinto ang server...';
	@override String get error => 'May nangyaring error habang binubuksan ang server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fil'))(n,
		one: 'Buksan ang link na ito sa browser:',
		other: 'Buksan ang isa sa mga link na ito sa browser:',
	);
	@override String get requests => 'Requests';
	@override String get noRequests => 'Wala pang mga request.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'Ang LocalSend ay gumagamit ng self-signed certificate. Kailangan mo itong i-accept sa browser.';
	@override String pendingRequests({required Object n}) => 'Mga naka-pending na request: ${n}';
}

// Path: aboutPage
class _StringsAboutPageFilPh extends _StringsAboutPageEn {
	_StringsAboutPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tungkol sa LocalSend';
	@override List<String> get description => [
		'Ang LocalSend ay isang libre at open-source na app na nagbibigay-daan sa secure na pagbabahagi ng mga file at mga message sa mga kalapit na device sa iyong local network nang hindi nangangailangan ng koneksyon sa internet.',
		'Available ang app na ito sa Android, iOS, macOS, Windows, at Linux. Maaari mong mahanap ang lahat ng mga pagpipilian sa pag-download sa opisyal na homepage.',
	];
	@override String get author => 'Author';
	@override String get contributors => 'Mga Contributor';
	@override String get translators => 'Mga Translator';
}

// Path: donationPage
class _StringsDonationPageFilPh extends _StringsDonationPageEn {
	_StringsDonationPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mag-donate';
	@override String get info => 'Ang LocalSend ay libre, open-source, at walang anumang mga ad. Kung iyong nagustuhan ang app, maaari mong suportahan ang development sa pamamagitan ng donasyon.';
	@override String donate({required Object amount}) => 'Mag-donate ng ${amount}';
	@override String get thanks => 'Maraming salamat!';
	@override String get restore => 'Restore purchase';
}

// Path: changelogPage
class _StringsChangelogPageFilPh extends _StringsChangelogPageEn {
	_StringsChangelogPageFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorFilPh extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Adorable',
		'Beautiful',
		'Big',
		'Bright',
		'Clean',
		'Clever',
		'Cool',
		'Cute',
		'Cunning',
		'Determined',
		'Energetic',
		'Efficient',
		'Fantastic',
		'Fast',
		'Fine',
		'Fresh',
		'Good',
		'Gorgeous',
		'Great',
		'Handsome',
		'Hot',
		'Kind',
		'Lovely',
		'Mystic',
		'Neat',
		'Nice',
		'Patient',
		'Pretty',
		'Powerful',
		'Rich',
		'Secret',
		'Smart',
		'Solid',
		'Special',
		'Strategic',
		'Strong',
		'Tidy',
		'Wise',
	];
	@override List<String> get fruits => [
		'Apple',
		'Avocado',
		'Banana',
		'Blackberry',
		'Blueberry',
		'Broccoli',
		'Carrot',
		'Cherry',
		'Coconut',
		'Grape',
		'Lemon',
		'Lettuce',
		'Mango',
		'Melon',
		'Mushroom',
		'Onion',
		'Orange',
		'Papaya',
		'Peach',
		'Pear',
		'Pineapple',
		'Potato',
		'Pumpkin',
		'Raspberry',
		'Strawberry',
		'Tomato',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsFilPh extends _StringsDialogsEn {
	_StringsDialogsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileFilPh addFile = _StringsDialogsAddFileFilPh._(_root);
	@override late final _StringsDialogsAddressInputFilPh addressInput = _StringsDialogsAddressInputFilPh._(_root);
	@override late final _StringsDialogsCancelSessionFilPh cancelSession = _StringsDialogsCancelSessionFilPh._(_root);
	@override late final _StringsDialogsCannotOpenFileFilPh cannotOpenFile = _StringsDialogsCannotOpenFileFilPh._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeFilPh encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeFilPh._(_root);
	@override late final _StringsDialogsErrorDialogFilPh errorDialog = _StringsDialogsErrorDialogFilPh._(_root);
	@override late final _StringsDialogsFavoriteDialogFilPh favoriteDialog = _StringsDialogsFavoriteDialogFilPh._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogFilPh favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogFilPh._(_root);
	@override late final _StringsDialogsFavoriteEditDialogFilPh favoriteEditDialog = _StringsDialogsFavoriteEditDialogFilPh._(_root);
	@override late final _StringsDialogsFileInfoFilPh fileInfo = _StringsDialogsFileInfoFilPh._(_root);
	@override late final _StringsDialogsFileNameInputFilPh fileNameInput = _StringsDialogsFileNameInputFilPh._(_root);
	@override late final _StringsDialogsHistoryClearDialogFilPh historyClearDialog = _StringsDialogsHistoryClearDialogFilPh._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedFilPh localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedFilPh._(_root);
	@override late final _StringsDialogsMessageInputFilPh messageInput = _StringsDialogsMessageInputFilPh._(_root);
	@override late final _StringsDialogsNoFilesFilPh noFiles = _StringsDialogsNoFilesFilPh._(_root);
	@override late final _StringsDialogsNoPermissionFilPh noPermission = _StringsDialogsNoPermissionFilPh._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformFilPh notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformFilPh._(_root);
	@override late final _StringsDialogsQrFilPh qr = _StringsDialogsQrFilPh._(_root);
	@override late final _StringsDialogsQuickActionsFilPh quickActions = _StringsDialogsQuickActionsFilPh._(_root);
	@override late final _StringsDialogsQuickSaveNoticeFilPh quickSaveNotice = _StringsDialogsQuickSaveNoticeFilPh._(_root);
	@override late final _StringsDialogsSendModeHelpFilPh sendModeHelp = _StringsDialogsSendModeHelpFilPh._(_root);
}

// Path: tray
class _StringsTrayFilPh extends _StringsTrayEn {
	_StringsTrayFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Isara ang LocalSend';
}

// Path: web
class _StringsWebFilPh extends _StringsWebEn {
	_StringsWebFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Hindi Tinanggap';
	@override String get files => 'Files';
	@override String get fileName => 'Pangalan ng file';
	@override String get size => 'Size';
}

// Path: assetPicker
class _StringsAssetPickerFilPh extends _StringsAssetPickerEn {
	_StringsAssetPickerFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Kumpirmahin';
	@override String get cancel => 'Kanselahin';
	@override String get edit => 'Baguhin';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Load failed';
	@override String get original => 'Pinagmulan';
	@override String get preview => 'Silipin';
	@override String get select => 'Piliin';
	@override String get emptyList => 'Walang lamang listahan';
	@override String get unSupportedAssetType => 'Hindi suportadong file type.';
	@override String get unableToAccessAll => 'Hindi ma-access ang lahat ng mga file sa device';
	@override String get viewingLimitedAssetsTip => 'Makikita lamang ang mga file at mga album na accessible sa app';
	@override String get changeAccessibleLimitedAssets => 'I-click para i-update ang accessible na mga file';
	@override String get accessAllTip => 'Ang app na ito ay kaya lamang mag-access ng iilang mga file sa device. Magtungo sa system settings at i-allow ang app para ma-access ang lahat ng media sa device.';
	@override String get goToSystemSettings => 'Magpunta sa system settings';
	@override String get accessLimitedAssets => 'Ituloy nang limitadong access';
	@override String get accessiblePathName => 'Accessible na mga file';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Image';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Iba pang media';
	@override String get sActionPlayHint => 'play';
	@override String get sActionPreviewHint => 'silipin';
	@override String get sActionSelectHint => 'piliin';
	@override String get sActionSwitchPathLabel => 'baguhin ang lokasyon';
	@override String get sActionUseCameraHint => 'gamiting ang camera';
	@override String get sNameDurationLabel => 'duration';
	@override String get sUnitAssetCountLabel => 'count';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxFilPh extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionFilPh extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pagpipilian';
	@override String files({required Object files}) => 'Mga File: ${files}';
	@override String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerFilPh extends _StringsSendTabPickerEn {
	_StringsSendTabPickerFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get file => 'File';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Text';
	@override String get app => 'App';
	@override String get clipboard => 'Paste';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesFilPh extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get single => 'Isang tatanggap';
	@override String get multiple => 'Maramihang tatanggap';
	@override String get link => 'I-share gamit ang link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralFilPh extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'General';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsFilPh brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsFilPh._(_root);
	@override String get color => 'Kulay';
	@override late final _StringsSettingsTabGeneralColorOptionsFilPh colorOptions = _StringsSettingsTabGeneralColorOptionsFilPh._(_root);
	@override String get language => 'Wika';
	@override late final _StringsSettingsTabGeneralLanguageOptionsFilPh languageOptions = _StringsSettingsTabGeneralLanguageOptionsFilPh._(_root);
	@override String get saveWindowPlacement => 'Quit: I-save ang window placement';
	@override String get minimizeToTray => 'Quit: Paliitin sa Tray/Menu Bar';
	@override String get launchAtStartup => 'I-autostart pagkatapos mag-login';
	@override String get launchMinimized => 'Autostart: I-start nang nakatago';
	@override String get animations => 'Animations';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveFilPh extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tumanggap';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Auto Finish';
	@override String get destination => 'Patutunguhan';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'I-save ang media sa gallery';
	@override String get saveToHistory => 'I-save sa history';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkFilPh extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Network';
	@override String get needRestart => 'I-restart ang server para ma-apply ang settings!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Device type';
	@override String get deviceModel => 'Device model';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Maaaring hindi ka ma-detect ng ibang devices dahil ikaw ay gumagamit ng ibang port. (default: ${defaultPort})';
	@override String get encryption => 'Encryption';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Maaaring hindi ka ma-detect ng ibang devices dahil ikaw ay gumagamit ng ibang multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherFilPh extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Iba Pa';
	@override String get support => 'Suportahan ang LocalSend';
	@override String get donate => 'Mag-donate';
	@override String get privacyPolicy => 'Patakaran sa Privacy';
	@override String get termsOfUse => 'Mga Tuntunin sa Paggamit';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallFilPh extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ang app na ito ay nakakapagpadala ng mga file sa ibang mga device ngunit ang ibang mga device ay hindi makapagpadala sa device na ito.';
	@override String solution({required Object port}) => 'Ito ay kadalasang isyu sa firewall. Maaari mong maayos ito sa pamamagitan nang pag-allow ng mga incoming connections (UDP at TCP) sa port ${port}.';
	@override String get openFirewall => 'Buksan ang Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionFilPh extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ang dalawa o higit pang device ay hindi ma-discover ang isa\'t isa o hindi makapag-share ng mga file.';
	@override String get solution => 'Ang problema ay nangyayari sa dalawang device? Mangyaring siguraduhin na ang dalawang device ay nasa parehas na wifi network at mayroong parehas na configuration (port, multicast address, encryption). Maaaring ang wifi ay hindi pinahihintulutan and komunikasyon sa pagitan nang mga participants. Sa ganitong pangyayari, ang option na ito ay dapat i-enable sa router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsFilPh extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get open => 'Buksan ang file';
	@override String get info => 'Impormasyon';
	@override String get deleteFromHistory => 'Burahin sa history';
}

// Path: progressPage.total
class _StringsProgressPageTotalFilPh extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleFilPh title = _StringsProgressPageTotalTitleFilPh._(_root);
	@override String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileFilPh extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idagdag sa selection';
	@override String get content => 'Ano ang gusto mong idagdag?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputFilPh extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ilagay ang address';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Address';
	@override String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionFilPh extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kanselahin ang pagpapadala ng file';
	@override String get content => 'Gusto mo ba talagang kanselahin ang pagpapadala ng file?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileFilPh extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hindi mabuksan ang file';
	@override String content({required Object file}) => 'Hindi mabuksan ang "${file}". Ito ba ay nalipat, pinangalanan, o nabura?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeFilPh extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ang encryption ay naka-disable';
	@override String get content => 'Ang communication ngayon ay nangyayari gamit ang unencrypted HTTP protocol. Para gamitin ang HTTPS, muling i-enable ang encryption.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogFilPh extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogFilPh extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorites';
	@override String get noFavorites => 'Wala pang favorites sa mga device.';
	@override String get addFavorite => 'Magdagdag';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogFilPh extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Burahin sa favorites';
	@override String content({required Object name}) => 'Gusto mo ba talagang burahin ang favorites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogFilPh extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Idagdag sa favorites';
	@override String get titleEdit => 'Adjust';
	@override String get name => 'Alias';
	@override String get auto => '(auto)';
	@override String get ip => 'IP Address';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoFilPh extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impormasyon sa file';
	@override String get fileName => 'Pangalan ng file:';
	@override String get path => 'Lokasyon:';
	@override String get size => 'Size:';
	@override String get sender => 'Sender:';
	@override String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputFilPh extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ilagay ang pangalan ng file';
	@override String original({required Object original}) => 'Orihinal: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogFilPh extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Burahin ang history';
	@override String get content => 'Gusto mo ba talagang burahin ang buong history?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedFilPh extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'Hindi makikita ng LocalSend ang ibang devices hangga\'t hindi nabibigyan ng permission para mag-scan sa lokal na network. Mangyaring bigyan ito ng permission sa settings.';
	@override String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputFilPh extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'I-type ang message';
	@override String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesFilPh extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Walang file na pinli';
	@override String get content => 'Mangyaring pumili nang kahit isang file.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionFilPh extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Walang permission';
	@override String get content => 'Hindi nabigyan ng mga kinakailangang permissions. Mangyaring bigyan ito ng permission sa settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformFilPh extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hindi available';
	@override String get content => 'Ang feature na ito ay available lamang sa:';
}

// Path: dialogs.qr
class _StringsDialogsQrFilPh extends _StringsDialogsQrEn {
	_StringsDialogsQrFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsFilPh extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quick Actions';
	@override String get counter => 'Counter';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Pad with zeros';
	@override String get sortBeforeCount => 'Pagsunud-sunurin ayon sa alpabeto';
	@override String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeFilPh extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Ang mga file request ay awtomatikong tinatanggap. Mabatid lamang na ang lahat ng nasa lokal na network ay maaaring magpadala sa iyo ng mga file.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpFilPh extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send modes';
	@override String get single => 'Magpadala ng mga file sa iisang recipient o tatanggap. Ang mga pagpipilian ay maaalis pagkatapos ipadala ang file.';
	@override String get multiple => 'Magpadala ng mga file sa maraming recipient o tatanggap. Ang mga pagpipilian ay hindi maaalis.';
	@override String get link => 'Ang mga recipient o tatanggap na walang nakainstall na LocalSend ay maaaring mag download nang mga napiling file sa pamamagitan ng pagbukas ng link sa kanilang browser.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsFilPh extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Madilim';
	@override String get light => 'Maliwanag';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsFilPh extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsFilPh extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleFilPh extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleFilPh._(_StringsFilPh root) : this._root = root, super._(root);

	@override final _StringsFilPh _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Kabuuang progreso (${time})';
	@override String get finishedError => 'Natapos nang may error';
	@override String get canceledSender => 'Kinansela ng sender';
	@override String get canceledReceiver => 'Kinansela ng receiver';
}
