///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.en,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  // Translations
  String get locale => 'English';
  String get appName => 'LocalSend';
  late final TranslationsGeneralEn general = TranslationsGeneralEn.internal(_root);
  late final TranslationsReceiveTabEn receiveTab = TranslationsReceiveTabEn.internal(_root);
  late final TranslationsSendTabEn sendTab = TranslationsSendTabEn.internal(_root);
  late final TranslationsSettingsTabEn settingsTab = TranslationsSettingsTabEn.internal(_root);
  late final TranslationsTroubleshootPageEn troubleshootPage = TranslationsTroubleshootPageEn.internal(_root);
  late final TranslationsNetworkInterfacesPageEn networkInterfacesPage = TranslationsNetworkInterfacesPageEn.internal(_root);
  late final TranslationsReceiveHistoryPageEn receiveHistoryPage = TranslationsReceiveHistoryPageEn.internal(_root);
  late final TranslationsApkPickerPageEn apkPickerPage = TranslationsApkPickerPageEn.internal(_root);
  late final TranslationsSelectedFilesPageEn selectedFilesPage = TranslationsSelectedFilesPageEn.internal(_root);
  late final TranslationsReceivePageEn receivePage = TranslationsReceivePageEn.internal(_root);
  late final TranslationsReceiveOptionsPageEn receiveOptionsPage = TranslationsReceiveOptionsPageEn.internal(_root);
  late final TranslationsSendPageEn sendPage = TranslationsSendPageEn.internal(_root);
  late final TranslationsProgressPageEn progressPage = TranslationsProgressPageEn.internal(_root);
  late final TranslationsWebSharePageEn webSharePage = TranslationsWebSharePageEn.internal(_root);
  late final TranslationsAboutPageEn aboutPage = TranslationsAboutPageEn.internal(_root);
  late final TranslationsDonationPageEn donationPage = TranslationsDonationPageEn.internal(_root);
  late final TranslationsChangelogPageEn changelogPage = TranslationsChangelogPageEn.internal(_root);
  late final TranslationsAliasGeneratorEn aliasGenerator = TranslationsAliasGeneratorEn.internal(_root);
  late final TranslationsDialogsEn dialogs = TranslationsDialogsEn.internal(_root);
  late final TranslationsSanitizationEn sanitization = TranslationsSanitizationEn.internal(_root);
  late final TranslationsTrayEn tray = TranslationsTrayEn.internal(_root);
  late final TranslationsWebEn web = TranslationsWebEn.internal(_root);
  late final TranslationsAssetPickerEn assetPicker = TranslationsAssetPickerEn.internal(_root);
}

// Path: general
class TranslationsGeneralEn {
  TranslationsGeneralEn.internal(this._root);

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
  String get quickSaveFromFavorites => 'Quick Save for "Favorites"';
  String get renamed => 'Renamed';
  String get reset => 'Undo changes';
  String get restart => 'Restart';
  String get settings => 'Settings';
  String get skipped => 'Skipped';
  String get start => 'Start';
  String get stop => 'Stop';
  String get save => 'Save';
  String get unchanged => 'Unchanged';
  String get unknown => 'Unknown';
  String get noItemInClipboard => 'No items in Clipboard.';
}

// Path: receiveTab
class TranslationsReceiveTabEn {
  TranslationsReceiveTabEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Receive';
  late final TranslationsReceiveTabInfoBoxEn infoBox = TranslationsReceiveTabInfoBoxEn.internal(_root);
  late final TranslationsReceiveTabQuickSaveEn quickSave = TranslationsReceiveTabQuickSaveEn.internal(_root);
}

// Path: sendTab
class TranslationsSendTabEn {
  TranslationsSendTabEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Send';
  late final TranslationsSendTabSelectionEn selection = TranslationsSendTabSelectionEn.internal(_root);
  late final TranslationsSendTabPickerEn picker = TranslationsSendTabPickerEn.internal(_root);
  String get shareIntentInfo => 'You can also use the "Share" feature of your mobile device to select files more easily.';
  String get nearbyDevices => 'Nearby devices';
  String get thisDevice => 'This Device';
  String get scan => 'Search devices';
  String get manualSending => 'Manual sending';
  String get sendMode => 'Send mode';
  late final TranslationsSendTabSendModesEn sendModes = TranslationsSendTabSendModesEn.internal(_root);
  String get sendModeHelp => 'Explanation';
  String get help => 'Please ensure that the desired target is also on the same Wi-Fi network.';
  String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class TranslationsSettingsTabEn {
  TranslationsSettingsTabEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  late final TranslationsSettingsTabGeneralEn general = TranslationsSettingsTabGeneralEn.internal(_root);
  late final TranslationsSettingsTabReceiveEn receive = TranslationsSettingsTabReceiveEn.internal(_root);
  late final TranslationsSettingsTabSendEn send = TranslationsSettingsTabSendEn.internal(_root);
  late final TranslationsSettingsTabNetworkEn network = TranslationsSettingsTabNetworkEn.internal(_root);
  late final TranslationsSettingsTabOtherEn other = TranslationsSettingsTabOtherEn.internal(_root);
  String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class TranslationsTroubleshootPageEn {
  TranslationsTroubleshootPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Troubleshoot';
  String get subTitle => 'Does the app not work as expected? Here you can find some common solutions to problems.';
  String get solution => 'Solution:';
  String get fixButton => 'Fix automatically';
  late final TranslationsTroubleshootPageFirewallEn firewall = TranslationsTroubleshootPageFirewallEn.internal(_root);
  late final TranslationsTroubleshootPageNoDiscoveryEn noDiscovery = TranslationsTroubleshootPageNoDiscoveryEn.internal(_root);
  late final TranslationsTroubleshootPageNoConnectionEn noConnection = TranslationsTroubleshootPageNoConnectionEn.internal(_root);
}

// Path: networkInterfacesPage
class TranslationsNetworkInterfacesPageEn {
  TranslationsNetworkInterfacesPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Network Interfaces';
  String get info =>
      'By default, LocalSend uses all available network interfaces. You can exclude unwanted networks here. You need to restart the server to apply the changes.';
  String get preview => 'Preview';
  String get whitelist => 'Whitelist';
  String get blacklist => 'Blacklist';
}

// Path: receiveHistoryPage
class TranslationsReceiveHistoryPageEn {
  TranslationsReceiveHistoryPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'History';
  String get openFolder => 'Open folder';
  String get deleteHistory => 'Delete history';
  String get empty => 'The history is empty.';
  late final TranslationsReceiveHistoryPageEntryActionsEn entryActions = TranslationsReceiveHistoryPageEntryActionsEn.internal(_root);
}

// Path: apkPickerPage
class TranslationsApkPickerPageEn {
  TranslationsApkPickerPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Apps (APK)';
  String get excludeSystemApps => 'Exclude system apps';
  String get excludeAppsWithoutLaunchIntent => 'Exclude non-launchable apps';
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class TranslationsSelectedFilesPageEn {
  TranslationsSelectedFilesPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get deleteAll => 'Delete all';
}

// Path: receivePage
class TranslationsReceivePageEn {
  TranslationsReceivePageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'wants to send you a file', other: 'wants to send you ${n} files');
  String get subTitleMessage => 'sent you a message:';
  String get subTitleLink => 'sent you a link:';
  String get canceled => 'The sender has canceled the request.';
}

// Path: receiveOptionsPage
class TranslationsReceiveOptionsPageEn {
  TranslationsReceiveOptionsPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Options';
  String get destination => _root.settingsTab.receive.destination;
  String get appDirectory => '(LocalSend folder)';
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  String get saveToGalleryOff => 'Turned off automatically because there are folders.';
}

// Path: sendPage
class TranslationsSendPageEn {
  TranslationsSendPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get waiting => 'Waiting for response…';
  String get rejected => 'The recipient has rejected the request.';
  String get tooManyAttempts => _root.web.tooManyAttempts;
  String get busy => 'The recipient is busy with another request.';
}

// Path: progressPage
class TranslationsProgressPageEn {
  TranslationsProgressPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get titleSending => 'Sending files';
  String get titleReceiving => 'Receiving files';
  String get savedToGallery => 'Saved in Photos';
  late final TranslationsProgressPageTotalEn total = TranslationsProgressPageTotalEn.internal(_root);
  late final TranslationsProgressPageRemainingTimeEn remainingTime = TranslationsProgressPageRemainingTimeEn.internal(_root);
}

// Path: webSharePage
class TranslationsWebSharePageEn {
  TranslationsWebSharePageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Share via link';
  String get loading => 'Starting server…';
  String get stopping => 'Stopping server…';
  String get error => 'An error occurred while starting the server.';
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
    n,
    one: 'Open this link in your browser:',
    other: 'Open one of these links in your browser:',
  );
  String get requests => 'Requests';
  String get noRequests => 'No requests yet.';
  String get encryption => _root.settingsTab.network.encryption;
  String get autoAccept => 'Automatically accept requests';
  String get requirePin => 'Require PIN';
  String pinHint({required Object pin}) => 'The PIN is "${pin}"';
  String get encryptionHint => 'LocalSend uses a self-signed certificate. You need to accept it in your browser.';
  String pendingRequests({required Object n}) => 'Pending requests: ${n}';
}

// Path: aboutPage
class TranslationsAboutPageEn {
  TranslationsAboutPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'About LocalSend';
  List<String> get description => [
    'LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.',
    'This app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.',
  ];
  String get author => 'Author';
  String get contributors => 'Contributors';
  String get packagers => 'Packagers';
  String get translators => 'Translators';
}

// Path: donationPage
class TranslationsDonationPageEn {
  TranslationsDonationPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Donate';
  String get info => 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.';
  String donate({required Object amount}) => 'Donate ${amount}';
  String get thanks => 'Thank you very much!';
  String get restore => 'Restore purchase';
}

// Path: changelogPage
class TranslationsChangelogPageEn {
  TranslationsChangelogPageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Changelog';
}

// Path: aliasGenerator
class TranslationsAliasGeneratorEn {
  TranslationsAliasGeneratorEn.internal(this._root);

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
class TranslationsDialogsEn {
  TranslationsDialogsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsDialogsAddFileEn addFile = TranslationsDialogsAddFileEn.internal(_root);
  late final TranslationsDialogsOpenFileEn openFile = TranslationsDialogsOpenFileEn.internal(_root);
  late final TranslationsDialogsAddressInputEn addressInput = TranslationsDialogsAddressInputEn.internal(_root);
  late final TranslationsDialogsCancelSessionEn cancelSession = TranslationsDialogsCancelSessionEn.internal(_root);
  late final TranslationsDialogsCannotOpenFileEn cannotOpenFile = TranslationsDialogsCannotOpenFileEn.internal(_root);
  late final TranslationsDialogsEncryptionDisabledNoticeEn encryptionDisabledNotice = TranslationsDialogsEncryptionDisabledNoticeEn.internal(_root);
  late final TranslationsDialogsErrorDialogEn errorDialog = TranslationsDialogsErrorDialogEn.internal(_root);
  late final TranslationsDialogsFavoriteDialogEn favoriteDialog = TranslationsDialogsFavoriteDialogEn.internal(_root);
  late final TranslationsDialogsFavoriteDeleteDialogEn favoriteDeleteDialog = TranslationsDialogsFavoriteDeleteDialogEn.internal(_root);
  late final TranslationsDialogsFavoriteEditDialogEn favoriteEditDialog = TranslationsDialogsFavoriteEditDialogEn.internal(_root);
  late final TranslationsDialogsFileInfoEn fileInfo = TranslationsDialogsFileInfoEn.internal(_root);
  late final TranslationsDialogsFileNameInputEn fileNameInput = TranslationsDialogsFileNameInputEn.internal(_root);
  late final TranslationsDialogsHistoryClearDialogEn historyClearDialog = TranslationsDialogsHistoryClearDialogEn.internal(_root);
  late final TranslationsDialogsLocalNetworkUnauthorizedEn localNetworkUnauthorized = TranslationsDialogsLocalNetworkUnauthorizedEn.internal(_root);
  late final TranslationsDialogsMessageInputEn messageInput = TranslationsDialogsMessageInputEn.internal(_root);
  late final TranslationsDialogsNoFilesEn noFiles = TranslationsDialogsNoFilesEn.internal(_root);
  late final TranslationsDialogsNoPermissionEn noPermission = TranslationsDialogsNoPermissionEn.internal(_root);
  late final TranslationsDialogsNotAvailableOnPlatformEn notAvailableOnPlatform = TranslationsDialogsNotAvailableOnPlatformEn.internal(_root);
  late final TranslationsDialogsQrEn qr = TranslationsDialogsQrEn.internal(_root);
  late final TranslationsDialogsQuickActionsEn quickActions = TranslationsDialogsQuickActionsEn.internal(_root);
  late final TranslationsDialogsQuickSaveNoticeEn quickSaveNotice = TranslationsDialogsQuickSaveNoticeEn.internal(_root);
  late final TranslationsDialogsQuickSaveFromFavoritesNoticeEn quickSaveFromFavoritesNotice =
      TranslationsDialogsQuickSaveFromFavoritesNoticeEn.internal(_root);
  late final TranslationsDialogsPinEn pin = TranslationsDialogsPinEn.internal(_root);
  late final TranslationsDialogsSendModeHelpEn sendModeHelp = TranslationsDialogsSendModeHelpEn.internal(_root);
  late final TranslationsDialogsZoomEn zoom = TranslationsDialogsZoomEn.internal(_root);
}

// Path: sanitization
class TranslationsSanitizationEn {
  TranslationsSanitizationEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get empty => 'Filename cannot be empty';
  String get invalid => 'Filename contains invalid characters';
}

// Path: tray
class TranslationsTrayEn {
  TranslationsTrayEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get open => _root.general.open;
  String get close => 'Quit LocalSend';
  String get closeWindows => 'Exit';
}

// Path: web
class TranslationsWebEn {
  TranslationsWebEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get waiting => _root.sendPage.waiting;
  String get enterPin => 'Enter PIN';
  String get invalidPin => 'Invalid PIN';
  String get tooManyAttempts => 'Too many attempts';
  String get rejected => 'Rejected';
  String get files => 'Files';
  String get fileName => 'File name';
  String get size => 'Size';
}

// Path: assetPicker
class TranslationsAssetPickerEn {
  TranslationsAssetPickerEn.internal(this._root);

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
  String get accessAllTip =>
      'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.';
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
class TranslationsReceiveTabInfoBoxEn {
  TranslationsReceiveTabInfoBoxEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get ip => 'IP:';
  String get port => 'Port:';
  String get alias => 'Device name:';
}

// Path: receiveTab.quickSave
class TranslationsReceiveTabQuickSaveEn {
  TranslationsReceiveTabQuickSaveEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get off => _root.general.off;
  String get favorites => 'Favorites';
  String get on => _root.general.on;
}

// Path: sendTab.selection
class TranslationsSendTabSelectionEn {
  TranslationsSendTabSelectionEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Selection';
  String files({required Object files}) => 'Files: ${files}';
  String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class TranslationsSendTabPickerEn {
  TranslationsSendTabPickerEn.internal(this._root);

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
class TranslationsSendTabSendModesEn {
  TranslationsSendTabSendModesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get single => 'Single recipient';
  String get multiple => 'Multiple recipients';
  String get link => 'Share via link';
}

// Path: settingsTab.general
class TranslationsSettingsTabGeneralEn {
  TranslationsSettingsTabGeneralEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'General';
  String get brightness => 'Theme';
  late final TranslationsSettingsTabGeneralBrightnessOptionsEn brightnessOptions = TranslationsSettingsTabGeneralBrightnessOptionsEn.internal(_root);
  String get color => 'Color';
  late final TranslationsSettingsTabGeneralColorOptionsEn colorOptions = TranslationsSettingsTabGeneralColorOptionsEn.internal(_root);
  String get language => 'Language';
  late final TranslationsSettingsTabGeneralLanguageOptionsEn languageOptions = TranslationsSettingsTabGeneralLanguageOptionsEn.internal(_root);
  String get saveWindowPlacement => 'Save window position after quit';
  String get saveWindowPlacementWindows => 'Save window position after exit';
  String get minimizeToTray => 'Minimize to the System Tray/Menu Bar when closing';
  String get launchAtStartup => 'Autostart after login';
  String get launchMinimized => 'Autostart: Start hidden';
  String get showInContextMenu => 'Show LocalSend in context menu';
  String get animations => 'Animations';
}

// Path: settingsTab.receive
class TranslationsSettingsTabReceiveEn {
  TranslationsSettingsTabReceiveEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Receive';
  String get quickSave => _root.general.quickSave;
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  String get requirePin => _root.webSharePage.requirePin;
  String get autoFinish => 'Auto Finish';
  String get destination => 'Save to folder';
  String get downloads => '(Downloads)';
  String get saveToGallery => 'Save media to gallery';
  String get saveToHistory => 'Save to history';
}

// Path: settingsTab.send
class TranslationsSettingsTabSendEn {
  TranslationsSettingsTabSendEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Send';
  String get shareViaLinkAutoAccept => 'Automatically accept requests in "Share via link" mode';
}

// Path: settingsTab.network
class TranslationsSettingsTabNetworkEn {
  TranslationsSettingsTabNetworkEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Network';
  String get needRestart => 'Restart the server to apply the settings!';
  String get server => 'Server';
  String get alias => 'Device name';
  String get deviceType => 'Device type';
  String get deviceModel => 'Device model';
  String get port => 'Port';
  String get network => 'Network';
  late final TranslationsSettingsTabNetworkNetworkOptionsEn networkOptions = TranslationsSettingsTabNetworkNetworkOptionsEn.internal(_root);
  String get discoveryTimeout => 'Discovery Timeout';
  String get useSystemName => 'Use system name';
  String get generateRandomAlias => 'Generate random alias';
  String portWarning({required Object defaultPort}) =>
      'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';
  String get encryption => 'Encryption';
  String get multicastGroup => 'Multicast address';
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'You might not be detected by other devices because you are using a custom multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class TranslationsSettingsTabOtherEn {
  TranslationsSettingsTabOtherEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Other';
  String get support => 'Support LocalSend';
  String get donate => 'Donate';
  String get privacyPolicy => 'Privacy Policy';
  String get termsOfUse => 'Terms of Use';
}

// Path: troubleshootPage.firewall
class TranslationsTroubleshootPageFirewallEn {
  TranslationsTroubleshootPageFirewallEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get symptom => 'This device can send files to other devices but other devices cannot send files to this device.';
  String solution({required Object port}) =>
      'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';
  String get openFirewall => 'Open Firewall';
}

// Path: troubleshootPage.noDiscovery
class TranslationsTroubleshootPageNoDiscoveryEn {
  TranslationsTroubleshootPageNoDiscoveryEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get symptom => 'This device cannot discover other devices.';
  String get solution =>
      'Please make sure that all devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). You can try to type the IP address of the target device manually. If this works, consider adding this device to the favorites so it can be automatically discovered in the future.';
}

// Path: troubleshootPage.noConnection
class TranslationsTroubleshootPageNoConnectionEn {
  TranslationsTroubleshootPageNoConnectionEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get symptom => 'Both devices cannot discover each other nor can they share files.';
  String get solution =>
      'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The Wi-Fi network may not allow communication between participants due to Access Point (AP) Isolation. In this case, this option must be disabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class TranslationsReceiveHistoryPageEntryActionsEn {
  TranslationsReceiveHistoryPageEntryActionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get open => 'Open file';
  String get showInFolder => 'Show in folder';
  String get info => 'Information';
  String get deleteFromHistory => 'Delete from history';
}

// Path: progressPage.total
class TranslationsProgressPageTotalEn {
  TranslationsProgressPageTotalEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsProgressPageTotalTitleEn title = TranslationsProgressPageTotalTitleEn.internal(_root);
  String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
  String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
  String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: progressPage.remainingTime
class TranslationsProgressPageRemainingTimeEn {
  TranslationsProgressPageRemainingTimeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Use 'h' for hours abbreviation and 'm' for minutes
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Use 'd' for days, 'h' for hours, and 'm' for minutes
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class TranslationsDialogsAddFileEn {
  TranslationsDialogsAddFileEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Add to selection';
  String get content => 'What do you want to add?';
}

// Path: dialogs.openFile
class TranslationsDialogsOpenFileEn {
  TranslationsDialogsOpenFileEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Open file';
  String get content => 'Do you want to open the received file?';
}

// Path: dialogs.addressInput
class TranslationsDialogsAddressInputEn {
  TranslationsDialogsAddressInputEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Enter address';
  String get hashtag => 'Hashtag';
  String get ip => 'IP Address';
  String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class TranslationsDialogsCancelSessionEn {
  TranslationsDialogsCancelSessionEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Cancel files transfer';
  String get content => 'Do you really want to cancel the files transfer?';
}

// Path: dialogs.cannotOpenFile
class TranslationsDialogsCannotOpenFileEn {
  TranslationsDialogsCannotOpenFileEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Cannot open file';
  String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class TranslationsDialogsEncryptionDisabledNoticeEn {
  TranslationsDialogsEncryptionDisabledNoticeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Encryption disabled';
  String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS protocol, enable encryption again.';
}

// Path: dialogs.errorDialog
class TranslationsDialogsErrorDialogEn {
  TranslationsDialogsErrorDialogEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class TranslationsDialogsFavoriteDialogEn {
  TranslationsDialogsFavoriteDialogEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Favorites';
  String get noFavorites => 'No favorite devices yet.';
  String get addFavorite => 'Add';
}

// Path: dialogs.favoriteDeleteDialog
class TranslationsDialogsFavoriteDeleteDialogEn {
  TranslationsDialogsFavoriteDeleteDialogEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete from favorites';
  String content({required Object name}) => 'Do you really want to delete from favorites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class TranslationsDialogsFavoriteEditDialogEn {
  TranslationsDialogsFavoriteEditDialogEn.internal(this._root);

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
class TranslationsDialogsFileInfoEn {
  TranslationsDialogsFileInfoEn.internal(this._root);

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
class TranslationsDialogsFileNameInputEn {
  TranslationsDialogsFileNameInputEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Enter file name';
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class TranslationsDialogsHistoryClearDialogEn {
  TranslationsDialogsHistoryClearDialogEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Clear history';
  String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class TranslationsDialogsLocalNetworkUnauthorizedEn {
  TranslationsDialogsLocalNetworkUnauthorizedEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => _root.dialogs.noPermission.title;
  String get description =>
      'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
  String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class TranslationsDialogsMessageInputEn {
  TranslationsDialogsMessageInputEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Type message';
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class TranslationsDialogsNoFilesEn {
  TranslationsDialogsNoFilesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'No files selected';
  String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class TranslationsDialogsNoPermissionEn {
  TranslationsDialogsNoPermissionEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'No permission';
  String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class TranslationsDialogsNotAvailableOnPlatformEn {
  TranslationsDialogsNotAvailableOnPlatformEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Not available';
  String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class TranslationsDialogsQrEn {
  TranslationsDialogsQrEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class TranslationsDialogsQuickActionsEn {
  TranslationsDialogsQuickActionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Quick Actions';
  String get counter => 'Counter';
  String get prefix => 'Prefix';
  String get padZero => 'Pad with zeros';
  String get sortBeforeCount => 'Sort alphabetically beforehand (A-Z)';
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class TranslationsDialogsQuickSaveNoticeEn {
  TranslationsDialogsQuickSaveNoticeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => _root.general.quickSave;
  String get content => 'File requests are now accepted automatically. Be aware that everyone on the local network can send you files.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  TranslationsDialogsQuickSaveFromFavoritesNoticeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => _root.general.quickSaveFromFavorites;
  List<String> get content => [
    'File requests are now accepted automatically from devices in your favorites list.',
    'Warning! Currently, this is not entirely secure, as a hacker who has the fingerprint of any device from your favorites list can send you files without restriction.',
    'However, this option is still safer than allowing all users on the local network to send you files without restriction.',
  ];
}

// Path: dialogs.pin
class TranslationsDialogsPinEn {
  TranslationsDialogsPinEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Enter PIN';
}

// Path: dialogs.sendModeHelp
class TranslationsDialogsSendModeHelpEn {
  TranslationsDialogsSendModeHelpEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Send modes';
  String get single => 'Sends files to one recipient. Selection will be cleared after finished files transfer.';
  String get multiple => 'Sends files to multiple recipients. Selection will not be cleared after finished files transfer.';
  String get link => 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.';
}

// Path: dialogs.zoom
class TranslationsDialogsZoomEn {
  TranslationsDialogsZoomEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class TranslationsSettingsTabGeneralBrightnessOptionsEn {
  TranslationsSettingsTabGeneralBrightnessOptionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'System';
  String get dark => 'Dark';
  String get light => 'Light';
}

// Path: settingsTab.general.colorOptions
class TranslationsSettingsTabGeneralColorOptionsEn {
  TranslationsSettingsTabGeneralColorOptionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'System';
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class TranslationsSettingsTabGeneralLanguageOptionsEn {
  TranslationsSettingsTabGeneralLanguageOptionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class TranslationsSettingsTabNetworkNetworkOptionsEn {
  TranslationsSettingsTabNetworkNetworkOptionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get all => 'All';
  String get filtered => 'Filtered';
}

// Path: progressPage.total.title
class TranslationsProgressPageTotalTitleEn {
  TranslationsProgressPageTotalTitleEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String sending({required Object time}) => 'Total progress (${time})';
  String get finishedError => 'Finished with error';
  String get canceledSender => 'Canceled by sender';
  String get canceledReceiver => 'Canceled by receiver';
}
