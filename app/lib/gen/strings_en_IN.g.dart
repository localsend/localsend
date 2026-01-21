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
class TranslationsEnIn extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEnIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.enIn,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <en-IN>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEnIn _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'English(India)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralEnIn general = _TranslationsGeneralEnIn._(_root);
  @override
  late final _TranslationsReceiveTabEnIn receiveTab = _TranslationsReceiveTabEnIn._(_root);
  @override
  late final _TranslationsSendTabEnIn sendTab = _TranslationsSendTabEnIn._(_root);
  @override
  late final _TranslationsSettingsTabEnIn settingsTab = _TranslationsSettingsTabEnIn._(_root);
  @override
  late final _TranslationsTroubleshootPageEnIn troubleshootPage = _TranslationsTroubleshootPageEnIn._(_root);
  @override
  late final _TranslationsReceiveHistoryPageEnIn receiveHistoryPage = _TranslationsReceiveHistoryPageEnIn._(_root);
  @override
  late final _TranslationsApkPickerPageEnIn apkPickerPage = _TranslationsApkPickerPageEnIn._(_root);
  @override
  late final _TranslationsSelectedFilesPageEnIn selectedFilesPage = _TranslationsSelectedFilesPageEnIn._(_root);
  @override
  late final _TranslationsReceivePageEnIn receivePage = _TranslationsReceivePageEnIn._(_root);
  @override
  late final _TranslationsReceiveOptionsPageEnIn receiveOptionsPage = _TranslationsReceiveOptionsPageEnIn._(_root);
  @override
  late final _TranslationsSendPageEnIn sendPage = _TranslationsSendPageEnIn._(_root);
  @override
  late final _TranslationsProgressPageEnIn progressPage = _TranslationsProgressPageEnIn._(_root);
  @override
  late final _TranslationsWebSharePageEnIn webSharePage = _TranslationsWebSharePageEnIn._(_root);
  @override
  late final _TranslationsAboutPageEnIn aboutPage = _TranslationsAboutPageEnIn._(_root);
  @override
  late final _TranslationsDonationPageEnIn donationPage = _TranslationsDonationPageEnIn._(_root);
  @override
  late final _TranslationsChangelogPageEnIn changelogPage = _TranslationsChangelogPageEnIn._(_root);
  @override
  late final _TranslationsAliasGeneratorEnIn aliasGenerator = _TranslationsAliasGeneratorEnIn._(_root);
  @override
  late final _TranslationsDialogsEnIn dialogs = _TranslationsDialogsEnIn._(_root);
  @override
  late final _TranslationsSanitizationEnIn sanitization = _TranslationsSanitizationEnIn._(_root);
  @override
  late final _TranslationsTrayEnIn tray = _TranslationsTrayEnIn._(_root);
  @override
  late final _TranslationsWebEnIn web = _TranslationsWebEnIn._(_root);
  @override
  late final _TranslationsAssetPickerEnIn assetPicker = _TranslationsAssetPickerEnIn._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageEnIn networkInterfacesPage = _TranslationsNetworkInterfacesPageEnIn._(_root);
}

// Path: general
class _TranslationsGeneralEnIn extends TranslationsGeneralEn {
  _TranslationsGeneralEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Accept';
  @override
  String get accepted => 'Accepted';
  @override
  String get add => 'Add';
  @override
  String get advanced => 'Advanced';
  @override
  String get cancel => 'Cancel';
  @override
  String get close => 'Close';
  @override
  String get confirm => 'Confirm';
  @override
  String get continueStr => 'Continue';
  @override
  String get copy => 'Copy';
  @override
  String get copiedToClipboard => 'Copied to Clipboard';
  @override
  String get decline => 'Decline';
  @override
  String get done => 'Done';
  @override
  String get delete => 'Delete';
  @override
  String get edit => 'Edit';
  @override
  String get error => 'Error';
  @override
  String get example => 'Example';
  @override
  String get files => 'Files';
  @override
  String get finished => 'Finished';
  @override
  String get hide => 'Hide';
  @override
  String get off => 'Off';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'On';
  @override
  String get online => 'Online';
  @override
  String get open => 'Open';
  @override
  String get queue => 'Queue';
  @override
  String get quickSave => 'Quick Save';
  @override
  String get quickSaveFromFavorites => 'Quick Save for "Favourites"';
  @override
  String get renamed => 'Renamed';
  @override
  String get reset => 'Reset';
  @override
  String get restart => 'Restart';
  @override
  String get settings => 'Settings';
  @override
  String get skipped => 'Skipped';
  @override
  String get start => 'Start';
  @override
  String get stop => 'Stop';
  @override
  String get save => 'Save';
  @override
  String get unchanged => 'Unchanged';
  @override
  String get unknown => 'Unknown';
  @override
  String get noItemInClipboard => 'No items in Clipboard.';
}

// Path: receiveTab
class _TranslationsReceiveTabEnIn extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Receive';
  @override
  late final _TranslationsReceiveTabInfoBoxEnIn infoBox = _TranslationsReceiveTabInfoBoxEnIn._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveEnIn quickSave = _TranslationsReceiveTabQuickSaveEnIn._(_root);
}

// Path: sendTab
class _TranslationsSendTabEnIn extends TranslationsSendTabEn {
  _TranslationsSendTabEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  late final _TranslationsSendTabSelectionEnIn selection = _TranslationsSendTabSelectionEnIn._(_root);
  @override
  late final _TranslationsSendTabPickerEnIn picker = _TranslationsSendTabPickerEnIn._(_root);
  @override
  String get shareIntentInfo => 'You can also use the "Share" feature of your mobile device to select files more easily.';
  @override
  String get nearbyDevices => 'Nearby devices';
  @override
  String get thisDevice => 'This Device';
  @override
  String get scan => 'Look for devices';
  @override
  String get manualSending => 'Manual Sending';
  @override
  String get sendMode => 'Send mode';
  @override
  late final _TranslationsSendTabSendModesEnIn sendModes = _TranslationsSendTabSendModesEnIn._(_root);
  @override
  String get sendModeHelp => 'Explanation';
  @override
  String get help => 'Please ensure that the desired target is also on the same Wi-Fi network.';
  @override
  String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _TranslationsSettingsTabEnIn extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Settings';
  @override
  late final _TranslationsSettingsTabGeneralEnIn general = _TranslationsSettingsTabGeneralEnIn._(_root);
  @override
  late final _TranslationsSettingsTabReceiveEnIn receive = _TranslationsSettingsTabReceiveEnIn._(_root);
  @override
  late final _TranslationsSettingsTabSendEnIn send = _TranslationsSettingsTabSendEnIn._(_root);
  @override
  late final _TranslationsSettingsTabNetworkEnIn network = _TranslationsSettingsTabNetworkEnIn._(_root);
  @override
  late final _TranslationsSettingsTabOtherEnIn other = _TranslationsSettingsTabOtherEnIn._(_root);
  @override
  String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageEnIn extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Troubleshoot';
  @override
  String get subTitle => 'Does the app not work as expected? Here you can find some common solutions.';
  @override
  String get solution => 'Solution:';
  @override
  String get fixButton => 'Fix automatically';
  @override
  late final _TranslationsTroubleshootPageFirewallEnIn firewall = _TranslationsTroubleshootPageFirewallEnIn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryEnIn noDiscovery = _TranslationsTroubleshootPageNoDiscoveryEnIn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionEnIn noConnection = _TranslationsTroubleshootPageNoConnectionEnIn._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageEnIn extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'History';
  @override
  String get openFolder => 'Open folder';
  @override
  String get deleteHistory => 'Delete history';
  @override
  String get empty => 'The history is empty.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsEnIn entryActions = _TranslationsReceiveHistoryPageEntryActionsEnIn._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageEnIn extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'Exclude system apps';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Exclude non-launchable apps';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageEnIn extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Delete all';
}

// Path: receivePage
class _TranslationsReceivePageEnIn extends TranslationsReceivePageEn {
  _TranslationsReceivePageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'wants to send you a file', other: 'wants to send you ${n} files');
  @override
  String get subTitleMessage => 'sent you a message:';
  @override
  String get subTitleLink => 'sent you a link:';
  @override
  String get canceled => 'The sender has cancelled the request.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageEnIn extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Options';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Turned off automatically because there are directories.';
}

// Path: sendPage
class _TranslationsSendPageEnIn extends TranslationsSendPageEn {
  _TranslationsSendPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Waiting for response…';
  @override
  String get rejected => 'The recipient has rejected the request.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'The recipient is busy with another request.';
}

// Path: progressPage
class _TranslationsProgressPageEnIn extends TranslationsProgressPageEn {
  _TranslationsProgressPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Sending files';
  @override
  String get titleReceiving => 'Receiving files';
  @override
  String get savedToGallery => 'Saved in Photos';
  @override
  late final _TranslationsProgressPageTotalEnIn total = _TranslationsProgressPageTotalEnIn._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageEnIn extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Share via link';
  @override
  String get loading => 'Starting server…';
  @override
  String get stopping => 'Stopping server…';
  @override
  String get error => 'An error occurred while starting the server.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
    n,
    one: 'Open this link in your browser:',
    other: 'Open one of these links in your browser:',
  );
  @override
  String get requests => 'Requests';
  @override
  String get noRequests => 'No requests yet.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automatically accept requests';
  @override
  String get requirePin => 'Require PIN';
  @override
  String pinHint({required Object pin}) => 'The PIN is "${pin}"';
  @override
  String get encryptionHint => 'LocalSend uses a self-signed certificate. You need to accept it in your browser.';
  @override
  String pendingRequests({required Object n}) => 'Pending requests: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageEnIn extends TranslationsAboutPageEn {
  _TranslationsAboutPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'About LocalSend';
  @override
  List<String> get description => [
    'LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.',
    'This app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.',
  ];
  @override
  String get author => 'Author';
  @override
  String get contributors => 'Contributors';
  @override
  String get packagers => 'Packagers';
  @override
  String get translators => 'Translators';
}

// Path: donationPage
class _TranslationsDonationPageEnIn extends TranslationsDonationPageEn {
  _TranslationsDonationPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donate';
  @override
  String get info => 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.';
  @override
  String donate({required Object amount}) => 'Donate ${amount}';
  @override
  String get thanks => 'Thank you very much!';
  @override
  String get restore => 'Restore purchase';
}

// Path: changelogPage
class _TranslationsChangelogPageEnIn extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorEnIn extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
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
  @override
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
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsEnIn extends TranslationsDialogsEn {
  _TranslationsDialogsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileEnIn addFile = _TranslationsDialogsAddFileEnIn._(_root);
  @override
  late final _TranslationsDialogsOpenFileEnIn openFile = _TranslationsDialogsOpenFileEnIn._(_root);
  @override
  late final _TranslationsDialogsAddressInputEnIn addressInput = _TranslationsDialogsAddressInputEnIn._(_root);
  @override
  late final _TranslationsDialogsCancelSessionEnIn cancelSession = _TranslationsDialogsCancelSessionEnIn._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileEnIn cannotOpenFile = _TranslationsDialogsCannotOpenFileEnIn._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeEnIn encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeEnIn._(_root);
  @override
  late final _TranslationsDialogsErrorDialogEnIn errorDialog = _TranslationsDialogsErrorDialogEnIn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogEnIn favoriteDialog = _TranslationsDialogsFavoriteDialogEnIn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogEnIn favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogEnIn._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogEnIn favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogEnIn._(_root);
  @override
  late final _TranslationsDialogsFileInfoEnIn fileInfo = _TranslationsDialogsFileInfoEnIn._(_root);
  @override
  late final _TranslationsDialogsFileNameInputEnIn fileNameInput = _TranslationsDialogsFileNameInputEnIn._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogEnIn historyClearDialog = _TranslationsDialogsHistoryClearDialogEnIn._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedEnIn localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedEnIn._(_root);
  @override
  late final _TranslationsDialogsMessageInputEnIn messageInput = _TranslationsDialogsMessageInputEnIn._(_root);
  @override
  late final _TranslationsDialogsNoFilesEnIn noFiles = _TranslationsDialogsNoFilesEnIn._(_root);
  @override
  late final _TranslationsDialogsNoPermissionEnIn noPermission = _TranslationsDialogsNoPermissionEnIn._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformEnIn notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformEnIn._(_root);
  @override
  late final _TranslationsDialogsQrEnIn qr = _TranslationsDialogsQrEnIn._(_root);
  @override
  late final _TranslationsDialogsQuickActionsEnIn quickActions = _TranslationsDialogsQuickActionsEnIn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeEnIn quickSaveNotice = _TranslationsDialogsQuickSaveNoticeEnIn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeEnIn quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeEnIn._(_root);
  @override
  late final _TranslationsDialogsPinEnIn pin = _TranslationsDialogsPinEnIn._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpEnIn sendModeHelp = _TranslationsDialogsSendModeHelpEnIn._(_root);
  @override
  late final _TranslationsDialogsZoomEnIn zoom = _TranslationsDialogsZoomEnIn._(_root);
}

// Path: sanitization
class _TranslationsSanitizationEnIn extends TranslationsSanitizationEn {
  _TranslationsSanitizationEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Filename cannot be empty';
  @override
  String get invalid => 'Filename contains invalid characters';
}

// Path: tray
class _TranslationsTrayEnIn extends TranslationsTrayEn {
  _TranslationsTrayEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Quit LocalSend';
  @override
  String get closeWindows => 'Exit';
}

// Path: web
class _TranslationsWebEnIn extends TranslationsWebEn {
  _TranslationsWebEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Enter PIN';
  @override
  String get invalidPin => 'Invalid PIN';
  @override
  String get tooManyAttempts => 'Too many attempts';
  @override
  String get rejected => 'Rejected';
  @override
  String get files => 'Files';
  @override
  String get fileName => 'File name';
  @override
  String get size => 'Size';
}

// Path: assetPicker
class _TranslationsAssetPickerEnIn extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Confirm';
  @override
  String get cancel => 'Cancel';
  @override
  String get edit => 'Edit';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Load failed';
  @override
  String get original => 'Origin';
  @override
  String get preview => 'Preview';
  @override
  String get select => 'Select';
  @override
  String get emptyList => 'Empty list';
  @override
  String get unSupportedAssetType => 'Unsupported file type.';
  @override
  String get unableToAccessAll => 'Unable to access all files on the device';
  @override
  String get viewingLimitedAssetsTip => 'Only view files and albums accessible to the app.';
  @override
  String get changeAccessibleLimitedAssets => 'Click to update accessible files';
  @override
  String get accessAllTip =>
      'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.';
  @override
  String get goToSystemSettings => 'Go to system settings';
  @override
  String get accessLimitedAssets => 'Continue with limited access';
  @override
  String get accessiblePathName => 'Accessible files';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Image';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Other media';
  @override
  String get sActionPlayHint => 'play';
  @override
  String get sActionPreviewHint => 'preview';
  @override
  String get sActionSelectHint => 'select';
  @override
  String get sActionSwitchPathLabel => 'change path';
  @override
  String get sActionUseCameraHint => 'use camera';
  @override
  String get sNameDurationLabel => 'duration';
  @override
  String get sUnitAssetCountLabel => 'count';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageEnIn extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'Preview';
  @override
  String get info =>
      'By default, LocalSend uses all available network interfaces. You can exclude unwanted networks here. You need to restart the server to apply the changes.';
  @override
  String get whitelist => 'Whitelist';
  @override
  String get blacklist => 'Blacklist';
  @override
  String get title => 'Network Interfaces';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxEnIn extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Device name:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveEnIn extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favourites';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionEnIn extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selection';
  @override
  String files({required Object files}) => 'Files: ${files}';
  @override
  String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerEnIn extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'File';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Media';
  @override
  String get text => 'Text';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Paste';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesEnIn extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Single recipient';
  @override
  String get multiple => 'Multiple recipients';
  @override
  String get link => 'Share via link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralEnIn extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Theme';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsEnIn brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsEnIn._(_root);
  @override
  String get color => 'Color';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsEnIn colorOptions = _TranslationsSettingsTabGeneralColorOptionsEnIn._(_root);
  @override
  String get language => 'Language';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsEnIn languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsEnIn._(_root);
  @override
  String get saveWindowPlacement => 'Quit: Save window placement';
  @override
  String get saveWindowPlacementWindows => 'Save window position after exit';
  @override
  String get minimizeToTray => 'Quit: Minimize to Tray/Menu Bar';
  @override
  String get launchAtStartup => 'Autostart after login';
  @override
  String get launchMinimized => 'Autostart: Start hidden';
  @override
  String get showInContextMenu => 'Show LocalSend in context menu';
  @override
  String get animations => 'Animations';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveEnIn extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Receive';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Auto Finish';
  @override
  String get destination => 'Destination';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Save media to gallery';
  @override
  String get saveToHistory => 'Save to history';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendEnIn extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  String get shareViaLinkAutoAccept => 'Share via link: Auto accept';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkEnIn extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Network';
  @override
  String get needRestart => 'Restart the server to apply the settings!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Device name';
  @override
  String get deviceType => 'Device type';
  @override
  String get deviceModel => 'Device model';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Discovery Timeout';
  @override
  String get useSystemName => 'Use system name';
  @override
  String get generateRandomAlias => 'Generate random alias';
  @override
  String portWarning({required Object defaultPort}) =>
      'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';
  @override
  String get encryption => 'Encryption';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'You might not be detected by other devices because you are using a custom multicast address. (default: ${defaultMulticast})';
  @override
  String get network => 'Network';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsEnIn networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsEnIn._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherEnIn extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Other';
  @override
  String get support => 'Support LocalSend';
  @override
  String get donate => 'Donate';
  @override
  String get privacyPolicy => 'Privacy Policy';
  @override
  String get termsOfUse => 'Terms of Use';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallEnIn extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'This app can send files to other devices; but other devices cannot send files to this device.';
  @override
  String solution({required Object port}) =>
      'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';
  @override
  String get openFirewallSettings => 'Open Firewall Settings';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryEnIn extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'This device cannot discover other devices.';
  @override
  String get solution =>
      'Please make sure that all devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). You can try to type the IP address of the target device manually. If this works, consider adding this device to the favourites so it can be automatically discovered in the future.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionEnIn extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Both devices cannot discover each other nor can they share files.';
  @override
  String get solution =>
      'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The network may not allow communication between participants. In this case, this option must be enabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsEnIn extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Open file';
  @override
  String get showInFolder => 'Show in folder';
  @override
  String get info => 'Information';
  @override
  String get deleteFromHistory => 'Delete from history';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalEnIn extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleEnIn title = _TranslationsProgressPageTotalTitleEnIn._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileEnIn extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Add to selection';
  @override
  String get content => 'What do you want to add?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileEnIn extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Open file';
  @override
  String get content => 'Do you want to open the received file?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputEnIn extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enter address';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Address';
  @override
  String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionEnIn extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancel file transfer';
  @override
  String get content => 'Do you really want to cancel the file transfer?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileEnIn extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cannot open file';
  @override
  String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeEnIn extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encryption disabled';
  @override
  String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogEnIn extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogEnIn extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorites';
  @override
  String get noFavorites => 'No favourite devices yet.';
  @override
  String get addFavorite => 'Add';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogEnIn extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Delete from favourites';
  @override
  String content({required Object name}) => 'Do you really want to delete from favourites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogEnIn extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Add to favourites';
  @override
  String get titleEdit => 'Settings';
  @override
  String get name => 'Device name';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP Address';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoEnIn extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'File information';
  @override
  String get fileName => 'File name:';
  @override
  String get path => 'Path:';
  @override
  String get size => 'Size:';
  @override
  String get sender => 'Sender:';
  @override
  String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputEnIn extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enter file name';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogEnIn extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Clear history';
  @override
  String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedEnIn extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
  @override
  String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputEnIn extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Type message';
  @override
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesEnIn extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No file selected';
  @override
  String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionEnIn extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No permission';
  @override
  String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformEnIn extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Not available';
  @override
  String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrEnIn extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsEnIn extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Quick Actions';
  @override
  String get counter => 'Counter';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Pad with zeros';
  @override
  String get sortBeforeCount => 'Sort alphabetically beforehand';
  @override
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeEnIn extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'File requests are automatically accepted. Be aware that everyone on the local network can send you files.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeEnIn extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'File requests are now accepted automatically from devices in your favourites list.',
    'Warning! Currently, this is not entirely secure, as a hacker who has the fingerprint of any device from your favourites list can send you files without restriction.',
    'However, this option is still safer than allowing all users on the local network to send you files without restriction.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinEnIn extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enter PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpEnIn extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send modes';
  @override
  String get single => 'Sends files to one recipient. Selection will be cleared after finished file transfer.';
  @override
  String get multiple => 'Sends files to multiple recipients. Selection will not be cleared.';
  @override
  String get link => 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomEnIn extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsEnIn extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get dark => 'Dark';
  @override
  String get light => 'Light';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsEnIn extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsEnIn extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsEnIn extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'All';
  @override
  String get filtered => 'Filtered';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleEnIn extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleEnIn._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Total progress (${time})';
  @override
  String get finishedError => 'Finished with error';
  @override
  String get canceledSender => 'Cancelled by sender';
  @override
  String get canceledReceiver => 'Cancelled by receiver';
}
