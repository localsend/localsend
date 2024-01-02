part of 'strings.g.dart';

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get locale => 'English';
	String get appName => 'LocalSend';
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsReceiveTabEn receiveTab = _StringsReceiveTabEn._(_root);
	late final _StringsSendTabEn sendTab = _StringsSendTabEn._(_root);
	late final _StringsSettingsTabEn settingsTab = _StringsSettingsTabEn._(_root);
	late final _StringsTroubleshootPageEn troubleshootPage = _StringsTroubleshootPageEn._(_root);
	late final _StringsReceiveHistoryPageEn receiveHistoryPage = _StringsReceiveHistoryPageEn._(_root);
	late final _StringsApkPickerPageEn apkPickerPage = _StringsApkPickerPageEn._(_root);
	late final _StringsSelectedFilesPageEn selectedFilesPage = _StringsSelectedFilesPageEn._(_root);
	late final _StringsReceivePageEn receivePage = _StringsReceivePageEn._(_root);
	late final _StringsReceiveOptionsPageEn receiveOptionsPage = _StringsReceiveOptionsPageEn._(_root);
	late final _StringsSendPageEn sendPage = _StringsSendPageEn._(_root);
	late final _StringsProgressPageEn progressPage = _StringsProgressPageEn._(_root);
	late final _StringsWebSharePageEn webSharePage = _StringsWebSharePageEn._(_root);
	late final _StringsAboutPageEn aboutPage = _StringsAboutPageEn._(_root);
	late final _StringsDonationPageEn donationPage = _StringsDonationPageEn._(_root);
	late final _StringsChangelogPageEn changelogPage = _StringsChangelogPageEn._(_root);
	late final _StringsAliasGeneratorEn aliasGenerator = _StringsAliasGeneratorEn._(_root);
	late final _StringsDialogsEn dialogs = _StringsDialogsEn._(_root);
	late final _StringsTrayEn tray = _StringsTrayEn._(_root);
	late final _StringsWebEn web = _StringsWebEn._(_root);
	late final _StringsAssetPickerEn assetPicker = _StringsAssetPickerEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accept => 'Accept';
	String get accepted => 'Accepted';
	String get add => 'Add';
	String get advanced => 'Advanced';
	String get cancel => 'Cancel';
	String get close => 'Close';
	String get confirm => 'Confirm';
	String get continueStr => 'Continue';
	String get copy => 'Copy';
	String get copiedToClipboard => 'Copied to Clipboard';
	String get decline => 'Decline';
	String get done => 'Done';
	String get delete => 'Delete';
	String get edit => 'Edit';
	String get error => 'Error';
	String get example => 'Example';
	String get files => 'Files';
	String get finished => 'Finished';
	String get hide => 'Hide';
	String get off => 'Off';
	String get offline => 'Offline';
	String get on => 'On';
	String get online => 'Online';
	String get open => 'Open';
	String get queue => 'Queue';
	String get quickSave => 'Quick Save';
	String get renamed => 'Renamed';
	String get reset => 'Reset';
	String get restart => 'Restart';
	String get settings => 'Settings';
	String get skipped => 'Skipped';
	String get start => 'Start';
	String get stop => 'Stop';
	String get save => 'Save';
	String get unchanged => 'Unchanged';
	String get unknown => 'Unknown';
	String get noItemInClipboard => 'No item in Clipboard';
}

// Path: receiveTab
class _StringsReceiveTabEn {
	_StringsReceiveTabEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Receive';
	late final _StringsReceiveTabInfoBoxEn infoBox = _StringsReceiveTabInfoBoxEn._(_root);
}

// Path: sendTab
class _StringsSendTabEn {
	_StringsSendTabEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Send';
	late final _StringsSendTabSelectionEn selection = _StringsSendTabSelectionEn._(_root);
	late final _StringsSendTabPickerEn picker = _StringsSendTabPickerEn._(_root);
	String get shareIntentInfo => 'You can also use the "Share" feature of your mobile device to select files more easily.';
	String get nearbyDevices => 'Nearby devices';
	String get thisDevice => 'This Device';
	String get scan => 'Look for devices';
	String get sendMode => 'Send mode';
	late final _StringsSendTabSendModesEn sendModes = _StringsSendTabSendModesEn._(_root);
	String get sendModeHelp => 'Explanation';
	String get help => 'Please ensure that the desired target is also in the same wifi network.';
	String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _StringsSettingsTabEn {
	_StringsSettingsTabEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	late final _StringsSettingsTabGeneralEn general = _StringsSettingsTabGeneralEn._(_root);
	late final _StringsSettingsTabReceiveEn receive = _StringsSettingsTabReceiveEn._(_root);
	late final _StringsSettingsTabNetworkEn network = _StringsSettingsTabNetworkEn._(_root);
	late final _StringsSettingsTabOtherEn other = _StringsSettingsTabOtherEn._(_root);
	String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _StringsTroubleshootPageEn {
	_StringsTroubleshootPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Troubleshoot';
	String get subTitle => 'This app does not work as expected? Here you can find common solutions.';
	String get solution => 'Solution:';
	String get fixButton => 'Fix automatically';
	late final _StringsTroubleshootPageFirewallEn firewall = _StringsTroubleshootPageFirewallEn._(_root);
	late final _StringsTroubleshootPageNoConnectionEn noConnection = _StringsTroubleshootPageNoConnectionEn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'History';
	String get openFolder => 'Open folder';
	String get deleteHistory => 'Delete history';
	String get empty => 'The history is empty.';
	late final _StringsReceiveHistoryPageEntryActionsEn entryActions = _StringsReceiveHistoryPageEntryActionsEn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageEn {
	_StringsApkPickerPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Apps (APK)';
	String get excludeSystemApps => 'Exclude system apps';
	String get excludeAppsWithoutLaunchIntent => 'Exclude non-launchable apps';
	String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get deleteAll => 'Delete all';
}

// Path: receivePage
class _StringsReceivePageEn {
	_StringsReceivePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'wants to send you a file',
		other: 'wants to send you ${n} files',
	);
	String get subTitleMessage => 'sent you a message:';
	String get subTitleLink => 'sent you a link:';
	String get canceled => 'The sender has canceled the request.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Options';
	String get destination => '${_root.settingsTab.receive.destination}';
	String get appDirectory => '(LocalSend folder)';
	String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	String get saveToGalleryOff => 'Turned off automatically because there are directories.';
}

// Path: sendPage
class _StringsSendPageEn {
	_StringsSendPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get waiting => 'Waiting for response...';
	String get rejected => 'The recipient has rejected the request.';
	String get busy => 'The recipient is busy with another request.';
}

// Path: progressPage
class _StringsProgressPageEn {
	_StringsProgressPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get titleSending => 'Sending files';
	String get titleReceiving => 'Receiving files';
	String get savedToGallery => 'Saved in Photos';
	late final _StringsProgressPageTotalEn total = _StringsProgressPageTotalEn._(_root);
}

// Path: webSharePage
class _StringsWebSharePageEn {
	_StringsWebSharePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Share via link';
	String get loading => 'Starting server...';
	String get stopping => 'Stopping server...';
	String get error => 'An error occurred while starting the server.';
	String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Open this link in the browser:',
		other: 'Open one of these links in the browser:',
	);
	String get requests => 'Requests';
	String get noRequests => 'No requests yet.';
	String get encryption => '${_root.settingsTab.network.encryption}';
	String get encryptionHint => 'LocalSend uses a self-signed certificate. You need to accept it in the browser.';
	String pendingRequests({required Object n}) => 'Pending requests: ${n}';
}

// Path: aboutPage
class _StringsAboutPageEn {
	_StringsAboutPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About LocalSend';
	List<String> get description => [
		'LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.',
		'This app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.',
	];
	String get author => 'Author';
	String get contributors => 'Contributors';
	String get translators => 'Translators';
}

// Path: donationPage
class _StringsDonationPageEn {
	_StringsDonationPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Donate';
	String get info => 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.';
	String donate({required Object amount}) => 'Donate ${amount}';
	String get thanks => 'Thank you very much!';
	String get restore => 'Restore purchase';
}

// Path: changelogPage
class _StringsChangelogPageEn {
	_StringsChangelogPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorEn {
	_StringsAliasGeneratorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get adjectives => [
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
	List<String> get fruits => [
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
	String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsEn {
	_StringsDialogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsDialogsAddFileEn addFile = _StringsDialogsAddFileEn._(_root);
	late final _StringsDialogsAddressInputEn addressInput = _StringsDialogsAddressInputEn._(_root);
	late final _StringsDialogsCancelSessionEn cancelSession = _StringsDialogsCancelSessionEn._(_root);
	late final _StringsDialogsCannotOpenFileEn cannotOpenFile = _StringsDialogsCannotOpenFileEn._(_root);
	late final _StringsDialogsEncryptionDisabledNoticeEn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeEn._(_root);
	late final _StringsDialogsErrorDialogEn errorDialog = _StringsDialogsErrorDialogEn._(_root);
	late final _StringsDialogsFavoriteDialogEn favoriteDialog = _StringsDialogsFavoriteDialogEn._(_root);
	late final _StringsDialogsFavoriteDeleteDialogEn favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogEn._(_root);
	late final _StringsDialogsFavoriteEditDialogEn favoriteEditDialog = _StringsDialogsFavoriteEditDialogEn._(_root);
	late final _StringsDialogsFileInfoEn fileInfo = _StringsDialogsFileInfoEn._(_root);
	late final _StringsDialogsFileNameInputEn fileNameInput = _StringsDialogsFileNameInputEn._(_root);
	late final _StringsDialogsHistoryClearDialogEn historyClearDialog = _StringsDialogsHistoryClearDialogEn._(_root);
	late final _StringsDialogsLocalNetworkUnauthorizedEn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedEn._(_root);
	late final _StringsDialogsMessageInputEn messageInput = _StringsDialogsMessageInputEn._(_root);
	late final _StringsDialogsNoFilesEn noFiles = _StringsDialogsNoFilesEn._(_root);
	late final _StringsDialogsNoPermissionEn noPermission = _StringsDialogsNoPermissionEn._(_root);
	late final _StringsDialogsNotAvailableOnPlatformEn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformEn._(_root);
	late final _StringsDialogsQrEn qr = _StringsDialogsQrEn._(_root);
	late final _StringsDialogsQuickActionsEn quickActions = _StringsDialogsQuickActionsEn._(_root);
	late final _StringsDialogsQuickSaveNoticeEn quickSaveNotice = _StringsDialogsQuickSaveNoticeEn._(_root);
	late final _StringsDialogsSendModeHelpEn sendModeHelp = _StringsDialogsSendModeHelpEn._(_root);
}

// Path: tray
class _StringsTrayEn {
	_StringsTrayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get open => '${_root.general.open}';
	String get close => 'Quit LocalSend';
}

// Path: web
class _StringsWebEn {
	_StringsWebEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get waiting => '${_root.sendPage.waiting}';
	String get rejected => 'Rejected';
	String get files => 'Files';
	String get fileName => 'File name';
	String get size => 'Size';
}

// Path: assetPicker
class _StringsAssetPickerEn {
	_StringsAssetPickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get confirm => 'Confirm';
	String get cancel => 'Cancel';
	String get edit => 'Edit';
	String get gifIndicator => 'GIF';
	String get loadFailed => 'Load failed';
	String get original => 'Origin';
	String get preview => 'Preview';
	String get select => 'Select';
	String get emptyList => 'Empty list';
	String get unSupportedAssetType => 'Unsupported file type.';
	String get unableToAccessAll => 'Unable to access all files on the device';
	String get viewingLimitedAssetsTip => 'Only view files and albums accessible to the app.';
	String get changeAccessibleLimitedAssets => 'Click to update accessible files';
	String get accessAllTip => 'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.';
	String get goToSystemSettings => 'Go to system settings';
	String get accessLimitedAssets => 'Continue with limited access';
	String get accessiblePathName => 'Accessible files';
	String get sTypeAudioLabel => 'Audio';
	String get sTypeImageLabel => 'Image';
	String get sTypeVideoLabel => 'Video';
	String get sTypeOtherLabel => 'Other media';
	String get sActionPlayHint => 'play';
	String get sActionPreviewHint => 'preview';
	String get sActionSelectHint => 'select';
	String get sActionSwitchPathLabel => 'change path';
	String get sActionUseCameraHint => 'use camera';
	String get sNameDurationLabel => 'duration';
	String get sUnitAssetCountLabel => 'count';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ip => 'IP:';
	String get port => 'Port:';
	String get alias => 'Device name:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionEn {
	_StringsSendTabSelectionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Selection';
	String files({required Object files}) => 'Files: ${files}';
	String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerEn {
	_StringsSendTabPickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get file => 'File';
	String get folder => 'Folder';
	String get media => 'Media';
	String get text => 'Text';
	String get app => 'App';
	String get clipboard => 'Paste';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesEn {
	_StringsSendTabSendModesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get single => 'Single recipient';
	String get multiple => 'Multiple recipients';
	String get link => 'Share via link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'General';
	String get brightness => 'Theme';
	late final _StringsSettingsTabGeneralBrightnessOptionsEn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsEn._(_root);
	String get color => 'Color';
	late final _StringsSettingsTabGeneralColorOptionsEn colorOptions = _StringsSettingsTabGeneralColorOptionsEn._(_root);
	String get language => 'Language';
	late final _StringsSettingsTabGeneralLanguageOptionsEn languageOptions = _StringsSettingsTabGeneralLanguageOptionsEn._(_root);
	String get saveWindowPlacement => 'Quit: Save window placement';
	String get minimizeToTray => 'Quit: Minimize to Tray/Menu Bar';
	String get launchAtStartup => 'Autostart after login';
	String get launchMinimized => 'Autostart: Start hidden';
	String get animations => 'Animations';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Receive';
	String get quickSave => '${_root.general.quickSave}';
	String get autoFinish => 'Auto Finish';
	String get destination => 'Destination';
	String get downloads => '(Downloads)';
	String get saveToGallery => 'Save media to gallery';
	String get saveToHistory => 'Save to history';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Network';
	String get needRestart => 'Restart the server to apply the settings!';
	String get server => 'Server';
	String get alias => 'Device name';
	String get deviceType => 'Device type';
	String get deviceModel => 'Device model';
	String get port => 'Port';
	String portWarning({required Object defaultPort}) => 'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';
	String get encryption => 'Encryption';
	String get multicastGroup => 'Multicast';
	String multicastGroupWarning({required Object defaultMulticast}) => 'You might not be detected by other devices because you are using a custom multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Other';
	String get support => 'Support LocalSend';
	String get donate => 'Donate';
	String get privacyPolicy => 'Privacy Policy';
	String get termsOfUse => 'Terms of Use';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get symptom => 'This app can send files to other devices but other devices cannot send files to this device.';
	String solution({required Object port}) => 'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';
	String get openFirewall => 'Open Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get symptom => 'Both devices cannot discover each other nor can they share files.';
	String get solution => 'The problem exists on both sides? Then you need to make sure that both devices are in the same wifi network and share the same configuration (port, multicast address, encryption). The wifi may not allow communication between participants. In this case, this option must be enabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get open => 'Open file';
	String get info => 'Information';
	String get deleteFromHistory => 'Delete from history';
}

// Path: progressPage.total
class _StringsProgressPageTotalEn {
	_StringsProgressPageTotalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsProgressPageTotalTitleEn title = _StringsProgressPageTotalTitleEn._(_root);
	String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
	String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
	String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileEn {
	_StringsDialogsAddFileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Add to selection';
	String get content => 'What do you want to add?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Enter address';
	String get hashtag => 'Hashtag';
	String get ip => 'IP Address';
	String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Cancel file transfer';
	String get content => 'Do you really want to cancel the file transfer?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Cannot open file';
	String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Encryption disabled';
	String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Favorites';
	String get noFavorites => 'No favorites devices yet.';
	String get addFavorite => 'Add';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete from favorites';
	String content({required Object name}) => 'Do you really want to delete from favorites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get titleAdd => 'Add to favorites';
	String get titleEdit => 'Settings';
	String get name => 'Device name';
	String get auto => '(auto)';
	String get ip => 'IP Address';
	String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'File information';
	String get fileName => 'File name:';
	String get path => 'Path:';
	String get size => 'Size:';
	String get sender => 'Sender:';
	String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Enter file name';
	String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Clear history';
	String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '${_root.dialogs.noPermission.title}';
	String get description => 'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
	String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Type message';
	String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'No file selected';
	String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'No permission';
	String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Not available';
	String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class _StringsDialogsQrEn {
	_StringsDialogsQrEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Quick Actions';
	String get counter => 'Counter';
	String get prefix => 'Prefix';
	String get padZero => 'Pad with zeros';
	String get sortBeforeCount => 'Sort alphabetically beforehand';
	String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '${_root.general.quickSave}';
	String get content => 'File requests are automatically accepted. Be aware that everyone in the local network can send you files.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Send modes';
	String get single => 'Sends files to one recipient. Selection will be cleared after finished file transfer.';
	String get multiple => 'Sends files to multiple recipients. Selection will not be cleared.';
	String get link => 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'System';
	String get dark => 'Dark';
	String get light => 'Light';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'System';
	String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String sending({required Object time}) => 'Total progress (${time})';
	String get finishedError => 'Finished with error';
	String get canceledSender => 'Canceled by sender';
	String get canceledReceiver => 'Canceled by receiver';
}
