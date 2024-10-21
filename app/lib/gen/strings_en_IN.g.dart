///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsEnIn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEnIn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.enIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <en-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsEnIn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'English(India)';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralEnIn general = _StringsGeneralEnIn._(_root);
	@override late final _StringsReceiveTabEnIn receiveTab = _StringsReceiveTabEnIn._(_root);
	@override late final _StringsSendTabEnIn sendTab = _StringsSendTabEnIn._(_root);
	@override late final _StringsSettingsTabEnIn settingsTab = _StringsSettingsTabEnIn._(_root);
	@override late final _StringsTroubleshootPageEnIn troubleshootPage = _StringsTroubleshootPageEnIn._(_root);
	@override late final _StringsReceiveHistoryPageEnIn receiveHistoryPage = _StringsReceiveHistoryPageEnIn._(_root);
	@override late final _StringsApkPickerPageEnIn apkPickerPage = _StringsApkPickerPageEnIn._(_root);
	@override late final _StringsSelectedFilesPageEnIn selectedFilesPage = _StringsSelectedFilesPageEnIn._(_root);
	@override late final _StringsReceivePageEnIn receivePage = _StringsReceivePageEnIn._(_root);
	@override late final _StringsReceiveOptionsPageEnIn receiveOptionsPage = _StringsReceiveOptionsPageEnIn._(_root);
	@override late final _StringsSendPageEnIn sendPage = _StringsSendPageEnIn._(_root);
	@override late final _StringsProgressPageEnIn progressPage = _StringsProgressPageEnIn._(_root);
	@override late final _StringsWebSharePageEnIn webSharePage = _StringsWebSharePageEnIn._(_root);
	@override late final _StringsAboutPageEnIn aboutPage = _StringsAboutPageEnIn._(_root);
	@override late final _StringsDonationPageEnIn donationPage = _StringsDonationPageEnIn._(_root);
	@override late final _StringsChangelogPageEnIn changelogPage = _StringsChangelogPageEnIn._(_root);
	@override late final _StringsAliasGeneratorEnIn aliasGenerator = _StringsAliasGeneratorEnIn._(_root);
	@override late final _StringsDialogsEnIn dialogs = _StringsDialogsEnIn._(_root);
	@override late final _StringsSanitizationEnIn sanitization = _StringsSanitizationEnIn._(_root);
	@override late final _StringsTrayEnIn tray = _StringsTrayEnIn._(_root);
	@override late final _StringsWebEnIn web = _StringsWebEnIn._(_root);
	@override late final _StringsAssetPickerEnIn assetPicker = _StringsAssetPickerEnIn._(_root);
}

// Path: general
class _StringsGeneralEnIn extends _StringsGeneralEn {
	_StringsGeneralEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Accept';
	@override String get accepted => 'Accepted';
	@override String get add => 'Add';
	@override String get advanced => 'Advanced';
	@override String get cancel => 'Cancel';
	@override String get close => 'Close';
	@override String get confirm => 'Confirm';
	@override String get continueStr => 'Continue';
	@override String get copy => 'Copy';
	@override String get copiedToClipboard => 'Copied to Clipboard';
	@override String get decline => 'Decline';
	@override String get done => 'Done';
	@override String get delete => 'Delete';
	@override String get edit => 'Edit';
	@override String get error => 'Error';
	@override String get example => 'Example';
	@override String get files => 'Files';
	@override String get finished => 'Finished';
	@override String get hide => 'Hide';
	@override String get off => 'Off';
	@override String get offline => 'Offline';
	@override String get on => 'On';
	@override String get online => 'Online';
	@override String get open => 'Open';
	@override String get queue => 'Queue';
	@override String get quickSave => 'Quick Save';
	@override String get renamed => 'Renamed';
	@override String get reset => 'Reset';
	@override String get restart => 'Restart';
	@override String get settings => 'Settings';
	@override String get skipped => 'Skipped';
	@override String get start => 'Start';
	@override String get stop => 'Stop';
	@override String get save => 'Save';
	@override String get unchanged => 'Unchanged';
	@override String get unknown => 'Unknown';
	@override String get noItemInClipboard => 'No items in Clipboard';
}

// Path: receiveTab
class _StringsReceiveTabEnIn extends _StringsReceiveTabEn {
	_StringsReceiveTabEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Receive';
	@override late final _StringsReceiveTabInfoBoxEnIn infoBox = _StringsReceiveTabInfoBoxEnIn._(_root);
}

// Path: sendTab
class _StringsSendTabEnIn extends _StringsSendTabEn {
	_StringsSendTabEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send';
	@override late final _StringsSendTabSelectionEnIn selection = _StringsSendTabSelectionEnIn._(_root);
	@override late final _StringsSendTabPickerEnIn picker = _StringsSendTabPickerEnIn._(_root);
	@override String get shareIntentInfo => 'You can also use the "Share" feature of your mobile device to select files more easily.';
	@override String get nearbyDevices => 'Nearby devices';
	@override String get thisDevice => 'This Device';
	@override String get scan => 'Look for devices';
	@override String get sendMode => 'Send mode';
	@override late final _StringsSendTabSendModesEnIn sendModes = _StringsSendTabSendModesEnIn._(_root);
	@override String get sendModeHelp => 'Explanation';
	@override String get help => 'Please ensure that the desired target is also on the same Wi-Fi network.';
	@override String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _StringsSettingsTabEnIn extends _StringsSettingsTabEn {
	_StringsSettingsTabEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override late final _StringsSettingsTabGeneralEnIn general = _StringsSettingsTabGeneralEnIn._(_root);
	@override late final _StringsSettingsTabReceiveEnIn receive = _StringsSettingsTabReceiveEnIn._(_root);
	@override late final _StringsSettingsTabSendEnIn send = _StringsSettingsTabSendEnIn._(_root);
	@override late final _StringsSettingsTabNetworkEnIn network = _StringsSettingsTabNetworkEnIn._(_root);
	@override late final _StringsSettingsTabOtherEnIn other = _StringsSettingsTabOtherEnIn._(_root);
	@override String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _StringsTroubleshootPageEnIn extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Troubleshoot';
	@override String get subTitle => 'Does the app not work as expected? Here you can find some common solutions.';
	@override String get solution => 'Solution:';
	@override String get fixButton => 'Fix automatically';
	@override late final _StringsTroubleshootPageFirewallEnIn firewall = _StringsTroubleshootPageFirewallEnIn._(_root);
	@override late final _StringsTroubleshootPageNoConnectionEnIn noConnection = _StringsTroubleshootPageNoConnectionEnIn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageEnIn extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'History';
	@override String get openFolder => 'Open folder';
	@override String get deleteHistory => 'Delete history';
	@override String get empty => 'The history is empty.';
	@override late final _StringsReceiveHistoryPageEntryActionsEnIn entryActions = _StringsReceiveHistoryPageEntryActionsEnIn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageEnIn extends _StringsApkPickerPageEn {
	_StringsApkPickerPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'Exclude system apps';
	@override String get excludeAppsWithoutLaunchIntent => 'Exclude non-launchable apps';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageEnIn extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Delete all';
}

// Path: receivePage
class _StringsReceivePageEnIn extends _StringsReceivePageEn {
	_StringsReceivePageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'wants to send you a file',
		other: 'wants to send you ${n} files',
	);
	@override String get subTitleMessage => 'sent you a message:';
	@override String get subTitleLink => 'sent you a link:';
	@override String get canceled => 'The sender has cancelled the request.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageEnIn extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Turned off automatically because there are directories.';
}

// Path: sendPage
class _StringsSendPageEnIn extends _StringsSendPageEn {
	_StringsSendPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Waiting for response...';
	@override String get rejected => 'The recipient has rejected the request.';
	@override String get tooManyAttempts => _root.web.tooManyAttempts;
	@override String get busy => 'The recipient is busy with another request.';
}

// Path: progressPage
class _StringsProgressPageEnIn extends _StringsProgressPageEn {
	_StringsProgressPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Sending files';
	@override String get titleReceiving => 'Receiving files';
	@override String get savedToGallery => 'Saved in Photos';
	@override late final _StringsProgressPageTotalEnIn total = _StringsProgressPageTotalEnIn._(_root);
}

// Path: webSharePage
class _StringsWebSharePageEnIn extends _StringsWebSharePageEn {
	_StringsWebSharePageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Share via link';
	@override String get loading => 'Starting server...';
	@override String get stopping => 'Stopping server...';
	@override String get error => 'An error occurred while starting the server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Open this link in your browser:',
		other: 'Open one of these links in your browser:',
	);
	@override String get requests => 'Requests';
	@override String get noRequests => 'No requests yet.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Automatically accept requests';
	@override String get requirePin => 'Require PIN';
	@override String pinHint({required Object pin}) => 'The PIN is "${pin}"';
	@override String get encryptionHint => 'LocalSend uses a self-signed certificate. You need to accept it in your browser.';
	@override String pendingRequests({required Object n}) => 'Pending requests: ${n}';
}

// Path: aboutPage
class _StringsAboutPageEnIn extends _StringsAboutPageEn {
	_StringsAboutPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'About LocalSend';
	@override List<String> get description => [
		'LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.',
		'This app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.',
	];
	@override String get author => 'Author';
	@override String get contributors => 'Contributors';
	@override String get translators => 'Translators';
}

// Path: donationPage
class _StringsDonationPageEnIn extends _StringsDonationPageEn {
	_StringsDonationPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Donate';
	@override String get info => 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.';
	@override String donate({required Object amount}) => 'Donate ${amount}';
	@override String get thanks => 'Thank you very much!';
	@override String get restore => 'Restore purchase';
}

// Path: changelogPage
class _StringsChangelogPageEnIn extends _StringsChangelogPageEn {
	_StringsChangelogPageEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorEnIn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

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
class _StringsDialogsEnIn extends _StringsDialogsEn {
	_StringsDialogsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileEnIn addFile = _StringsDialogsAddFileEnIn._(_root);
	@override late final _StringsDialogsAddressInputEnIn addressInput = _StringsDialogsAddressInputEnIn._(_root);
	@override late final _StringsDialogsCancelSessionEnIn cancelSession = _StringsDialogsCancelSessionEnIn._(_root);
	@override late final _StringsDialogsCannotOpenFileEnIn cannotOpenFile = _StringsDialogsCannotOpenFileEnIn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeEnIn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeEnIn._(_root);
	@override late final _StringsDialogsErrorDialogEnIn errorDialog = _StringsDialogsErrorDialogEnIn._(_root);
	@override late final _StringsDialogsFavoriteDialogEnIn favoriteDialog = _StringsDialogsFavoriteDialogEnIn._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogEnIn favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogEnIn._(_root);
	@override late final _StringsDialogsFavoriteEditDialogEnIn favoriteEditDialog = _StringsDialogsFavoriteEditDialogEnIn._(_root);
	@override late final _StringsDialogsFileInfoEnIn fileInfo = _StringsDialogsFileInfoEnIn._(_root);
	@override late final _StringsDialogsFileNameInputEnIn fileNameInput = _StringsDialogsFileNameInputEnIn._(_root);
	@override late final _StringsDialogsHistoryClearDialogEnIn historyClearDialog = _StringsDialogsHistoryClearDialogEnIn._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedEnIn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedEnIn._(_root);
	@override late final _StringsDialogsMessageInputEnIn messageInput = _StringsDialogsMessageInputEnIn._(_root);
	@override late final _StringsDialogsNoFilesEnIn noFiles = _StringsDialogsNoFilesEnIn._(_root);
	@override late final _StringsDialogsNoPermissionEnIn noPermission = _StringsDialogsNoPermissionEnIn._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformEnIn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformEnIn._(_root);
	@override late final _StringsDialogsQrEnIn qr = _StringsDialogsQrEnIn._(_root);
	@override late final _StringsDialogsQuickActionsEnIn quickActions = _StringsDialogsQuickActionsEnIn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeEnIn quickSaveNotice = _StringsDialogsQuickSaveNoticeEnIn._(_root);
	@override late final _StringsDialogsPinEnIn pin = _StringsDialogsPinEnIn._(_root);
	@override late final _StringsDialogsSendModeHelpEnIn sendModeHelp = _StringsDialogsSendModeHelpEnIn._(_root);
	@override late final _StringsDialogsZoomEnIn zoom = _StringsDialogsZoomEnIn._(_root);
}

// Path: sanitization
class _StringsSanitizationEnIn extends _StringsSanitizationEn {
	_StringsSanitizationEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Filename cannot be empty';
	@override String get invalid => 'Filename contains invalid characters';
}

// Path: tray
class _StringsTrayEnIn extends _StringsTrayEn {
	_StringsTrayEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Quit LocalSend';
}

// Path: web
class _StringsWebEnIn extends _StringsWebEn {
	_StringsWebEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get enterPin => 'Enter PIN';
	@override String get invalidPin => 'Invalid PIN';
	@override String get tooManyAttempts => 'Too many attempts';
	@override String get rejected => 'Rejected';
	@override String get files => 'Files';
	@override String get fileName => 'File name';
	@override String get size => 'Size';
}

// Path: assetPicker
class _StringsAssetPickerEnIn extends _StringsAssetPickerEn {
	_StringsAssetPickerEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirm';
	@override String get cancel => 'Cancel';
	@override String get edit => 'Edit';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Load failed';
	@override String get original => 'Origin';
	@override String get preview => 'Preview';
	@override String get select => 'Select';
	@override String get emptyList => 'Empty list';
	@override String get unSupportedAssetType => 'Unsupported file type.';
	@override String get unableToAccessAll => 'Unable to access all files on the device';
	@override String get viewingLimitedAssetsTip => 'Only view files and albums accessible to the app.';
	@override String get changeAccessibleLimitedAssets => 'Click to update accessible files';
	@override String get accessAllTip => 'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.';
	@override String get goToSystemSettings => 'Go to system settings';
	@override String get accessLimitedAssets => 'Continue with limited access';
	@override String get accessiblePathName => 'Accessible files';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Image';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Other media';
	@override String get sActionPlayHint => 'play';
	@override String get sActionPreviewHint => 'preview';
	@override String get sActionSelectHint => 'select';
	@override String get sActionSwitchPathLabel => 'change path';
	@override String get sActionUseCameraHint => 'use camera';
	@override String get sNameDurationLabel => 'duration';
	@override String get sUnitAssetCountLabel => 'count';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxEnIn extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Device name:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionEnIn extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selection';
	@override String files({required Object files}) => 'Files: ${files}';
	@override String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerEnIn extends _StringsSendTabPickerEn {
	_StringsSendTabPickerEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get file => 'File';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Text';
	@override String get app => 'App';
	@override String get clipboard => 'Paste';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesEnIn extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get single => 'Single recipient';
	@override String get multiple => 'Multiple recipients';
	@override String get link => 'Share via link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralEnIn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'General';
	@override String get brightness => 'Theme';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsEnIn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsEnIn._(_root);
	@override String get color => 'Color';
	@override late final _StringsSettingsTabGeneralColorOptionsEnIn colorOptions = _StringsSettingsTabGeneralColorOptionsEnIn._(_root);
	@override String get language => 'Language';
	@override late final _StringsSettingsTabGeneralLanguageOptionsEnIn languageOptions = _StringsSettingsTabGeneralLanguageOptionsEnIn._(_root);
	@override String get saveWindowPlacement => 'Quit: Save window placement';
	@override String get minimizeToTray => 'Quit: Minimize to Tray/Menu Bar';
	@override String get launchAtStartup => 'Autostart after login';
	@override String get launchMinimized => 'Autostart: Start hidden';
	@override String get showInContextMenu => 'Show LocalSend in context menu';
	@override String get animations => 'Animations';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveEnIn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Receive';
	@override String get quickSave => _root.general.quickSave;
	@override String get requirePin => _root.webSharePage.requirePin;
	@override String get autoFinish => 'Auto Finish';
	@override String get destination => 'Destination';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Save media to gallery';
	@override String get saveToHistory => 'Save to history';
}

// Path: settingsTab.send
class _StringsSettingsTabSendEnIn extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send';
	@override String get shareViaLinkAutoAccept => 'Share via link: Auto accept';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkEnIn extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Network';
	@override String get needRestart => 'Restart the server to apply the settings!';
	@override String get server => 'Server';
	@override String get alias => 'Device name';
	@override String get deviceType => 'Device type';
	@override String get deviceModel => 'Device model';
	@override String get port => 'Port';
	@override String get discoveryTimeout => 'Discovery Timeout';
	@override String portWarning({required Object defaultPort}) => 'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';
	@override String get encryption => 'Encryption';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'You might not be detected by other devices because you are using a custom multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherEnIn extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Other';
	@override String get support => 'Support LocalSend';
	@override String get donate => 'Donate';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get termsOfUse => 'Terms of Use';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallEnIn extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'This app can send files to other devices; but other devices cannot send files to this device.';
	@override String solution({required Object port}) => 'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';
	@override String get openFirewall => 'Open Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionEnIn extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Both devices cannot discover each other nor can they share files.';
	@override String get solution => 'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The network may not allow communication between participants. In this case, this option must be enabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsEnIn extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get open => 'Open file';
	@override String get showInFolder => 'Show in folder';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Delete from history';
}

// Path: progressPage.total
class _StringsProgressPageTotalEnIn extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleEnIn title = _StringsProgressPageTotalTitleEnIn._(_root);
	@override String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileEnIn extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Add to selection';
	@override String get content => 'What do you want to add?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputEnIn extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enter address';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Address';
	@override String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionEnIn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cancel file transfer';
	@override String get content => 'Do you really want to cancel the file transfer?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileEnIn extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cannot open file';
	@override String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeEnIn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encryption disabled';
	@override String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogEnIn extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogEnIn extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorites';
	@override String get noFavorites => 'No favourite devices yet.';
	@override String get addFavorite => 'Add';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogEnIn extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Delete from favourites';
	@override String content({required Object name}) => 'Do you really want to delete from favourites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogEnIn extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Add to favourites';
	@override String get titleEdit => 'Settings';
	@override String get name => 'Device name';
	@override String get auto => '(auto)';
	@override String get ip => 'IP Address';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoEnIn extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'File information';
	@override String get fileName => 'File name:';
	@override String get path => 'Path:';
	@override String get size => 'Size:';
	@override String get sender => 'Sender:';
	@override String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputEnIn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enter file name';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogEnIn extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clear history';
	@override String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedEnIn extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
	@override String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputEnIn extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Type message';
	@override String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesEnIn extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'No file selected';
	@override String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionEnIn extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'No permission';
	@override String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformEnIn extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Not available';
	@override String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class _StringsDialogsQrEnIn extends _StringsDialogsQrEn {
	_StringsDialogsQrEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsEnIn extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quick Actions';
	@override String get counter => 'Counter';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Pad with zeros';
	@override String get sortBeforeCount => 'Sort alphabetically beforehand';
	@override String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeEnIn extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'File requests are automatically accepted. Be aware that everyone on the local network can send you files.';
}

// Path: dialogs.pin
class _StringsDialogsPinEnIn extends _StringsDialogsPinEn {
	_StringsDialogsPinEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enter PIN';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpEnIn extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send modes';
	@override String get single => 'Sends files to one recipient. Selection will be cleared after finished file transfer.';
	@override String get multiple => 'Sends files to multiple recipients. Selection will not be cleared.';
	@override String get link => 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomEnIn extends _StringsDialogsZoomEn {
	_StringsDialogsZoomEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsEnIn extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Dark';
	@override String get light => 'Light';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsEnIn extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsEnIn extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleEnIn extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleEnIn._(_StringsEnIn root) : this._root = root, super._(root);

	@override final _StringsEnIn _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Total progress (${time})';
	@override String get finishedError => 'Finished with error';
	@override String get canceledSender => 'Cancelled by sender';
	@override String get canceledReceiver => 'Cancelled by receiver';
}
