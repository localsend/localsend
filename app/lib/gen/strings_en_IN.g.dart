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
class TranslationsEnIn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEnIn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsEnIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEnIn(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'English(India)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$en_IN general = _Translations$general$en_IN._(_root);
  @override
  late final _Translations$receiveTab$en_IN receiveTab = _Translations$receiveTab$en_IN._(_root);
  @override
  late final _Translations$sendTab$en_IN sendTab = _Translations$sendTab$en_IN._(_root);
  @override
  late final _Translations$settingsTab$en_IN settingsTab = _Translations$settingsTab$en_IN._(_root);
  @override
  late final _Translations$troubleshootPage$en_IN troubleshootPage = _Translations$troubleshootPage$en_IN._(_root);
  @override
  late final _Translations$receiveHistoryPage$en_IN receiveHistoryPage = _Translations$receiveHistoryPage$en_IN._(_root);
  @override
  late final _Translations$apkPickerPage$en_IN apkPickerPage = _Translations$apkPickerPage$en_IN._(_root);
  @override
  late final _Translations$selectedFilesPage$en_IN selectedFilesPage = _Translations$selectedFilesPage$en_IN._(_root);
  @override
  late final _Translations$receivePage$en_IN receivePage = _Translations$receivePage$en_IN._(_root);
  @override
  late final _Translations$receiveOptionsPage$en_IN receiveOptionsPage = _Translations$receiveOptionsPage$en_IN._(_root);
  @override
  late final _Translations$sendPage$en_IN sendPage = _Translations$sendPage$en_IN._(_root);
  @override
  late final _Translations$progressPage$en_IN progressPage = _Translations$progressPage$en_IN._(_root);
  @override
  late final _Translations$webSharePage$en_IN webSharePage = _Translations$webSharePage$en_IN._(_root);
  @override
  late final _Translations$aboutPage$en_IN aboutPage = _Translations$aboutPage$en_IN._(_root);
  @override
  late final _Translations$donationPage$en_IN donationPage = _Translations$donationPage$en_IN._(_root);
  @override
  late final _Translations$changelogPage$en_IN changelogPage = _Translations$changelogPage$en_IN._(_root);
  @override
  late final _Translations$aliasGenerator$en_IN aliasGenerator = _Translations$aliasGenerator$en_IN._(_root);
  @override
  late final _Translations$dialogs$en_IN dialogs = _Translations$dialogs$en_IN._(_root);
  @override
  late final _Translations$sanitization$en_IN sanitization = _Translations$sanitization$en_IN._(_root);
  @override
  late final _Translations$tray$en_IN tray = _Translations$tray$en_IN._(_root);
  @override
  late final _Translations$web$en_IN web = _Translations$web$en_IN._(_root);
  @override
  late final _Translations$assetPicker$en_IN assetPicker = _Translations$assetPicker$en_IN._(_root);
  @override
  late final _Translations$networkInterfacesPage$en_IN networkInterfacesPage = _Translations$networkInterfacesPage$en_IN._(_root);
}

// Path: general
class _Translations$general$en_IN extends Translations$general$en {
  _Translations$general$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$en_IN extends Translations$receiveTab$en {
  _Translations$receiveTab$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Receive';
  @override
  late final _Translations$receiveTab$infoBox$en_IN infoBox = _Translations$receiveTab$infoBox$en_IN._(_root);
  @override
  late final _Translations$receiveTab$quickSave$en_IN quickSave = _Translations$receiveTab$quickSave$en_IN._(_root);
}

// Path: sendTab
class _Translations$sendTab$en_IN extends Translations$sendTab$en {
  _Translations$sendTab$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  late final _Translations$sendTab$selection$en_IN selection = _Translations$sendTab$selection$en_IN._(_root);
  @override
  late final _Translations$sendTab$picker$en_IN picker = _Translations$sendTab$picker$en_IN._(_root);
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
  late final _Translations$sendTab$sendModes$en_IN sendModes = _Translations$sendTab$sendModes$en_IN._(_root);
  @override
  String get sendModeHelp => 'Explanation';
  @override
  String get help => 'Please ensure that the desired target is also on the same Wi-Fi network.';
  @override
  String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _Translations$settingsTab$en_IN extends Translations$settingsTab$en {
  _Translations$settingsTab$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Settings';
  @override
  late final _Translations$settingsTab$general$en_IN general = _Translations$settingsTab$general$en_IN._(_root);
  @override
  late final _Translations$settingsTab$receive$en_IN receive = _Translations$settingsTab$receive$en_IN._(_root);
  @override
  late final _Translations$settingsTab$send$en_IN send = _Translations$settingsTab$send$en_IN._(_root);
  @override
  late final _Translations$settingsTab$network$en_IN network = _Translations$settingsTab$network$en_IN._(_root);
  @override
  late final _Translations$settingsTab$other$en_IN other = _Translations$settingsTab$other$en_IN._(_root);
  @override
  String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$en_IN extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$en_IN firewall = _Translations$troubleshootPage$firewall$en_IN._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$en_IN noDiscovery = _Translations$troubleshootPage$noDiscovery$en_IN._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$en_IN noConnection = _Translations$troubleshootPage$noConnection$en_IN._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$en_IN extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$en_IN entryActions = _Translations$receiveHistoryPage$entryActions$en_IN._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$en_IN extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$en_IN extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Delete all';
}

// Path: receivePage
class _Translations$receivePage$en_IN extends Translations$receivePage$en {
  _Translations$receivePage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
    n,
    one: 'wants to send you a file',
    other: 'wants to send you ${n} files',
  );
  @override
  String get subTitleMessage => 'sent you a message:';
  @override
  String get subTitleLink => 'sent you a link:';
  @override
  String get canceled => 'The sender has cancelled the request.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$en_IN extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$en_IN extends Translations$sendPage$en {
  _Translations$sendPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$en_IN extends Translations$progressPage$en {
  _Translations$progressPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Sending files';
  @override
  String get titleReceiving => 'Receiving files';
  @override
  String get savedToGallery => 'Saved in Photos';
  @override
  late final _Translations$progressPage$total$en_IN total = _Translations$progressPage$total$en_IN._(_root);
  @override
  late final _Translations$progressPage$remainingTime$en_IN remainingTime = _Translations$progressPage$remainingTime$en_IN._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$en_IN extends Translations$webSharePage$en {
  _Translations$webSharePage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$en_IN extends Translations$aboutPage$en {
  _Translations$aboutPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$en_IN extends Translations$donationPage$en {
  _Translations$donationPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$en_IN extends Translations$changelogPage$en {
  _Translations$changelogPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$en_IN extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$en_IN extends Translations$dialogs$en {
  _Translations$dialogs$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$en_IN addFile = _Translations$dialogs$addFile$en_IN._(_root);
  @override
  late final _Translations$dialogs$openFile$en_IN openFile = _Translations$dialogs$openFile$en_IN._(_root);
  @override
  late final _Translations$dialogs$addressInput$en_IN addressInput = _Translations$dialogs$addressInput$en_IN._(_root);
  @override
  late final _Translations$dialogs$cancelSession$en_IN cancelSession = _Translations$dialogs$cancelSession$en_IN._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$en_IN cannotOpenFile = _Translations$dialogs$cannotOpenFile$en_IN._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$en_IN encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$en_IN._(
    _root,
  );
  @override
  late final _Translations$dialogs$errorDialog$en_IN errorDialog = _Translations$dialogs$errorDialog$en_IN._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$en_IN favoriteDialog = _Translations$dialogs$favoriteDialog$en_IN._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$en_IN favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$en_IN._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$en_IN favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$en_IN._(_root);
  @override
  late final _Translations$dialogs$fileInfo$en_IN fileInfo = _Translations$dialogs$fileInfo$en_IN._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$en_IN fileNameInput = _Translations$dialogs$fileNameInput$en_IN._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$en_IN historyClearDialog = _Translations$dialogs$historyClearDialog$en_IN._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$en_IN localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$en_IN._(
    _root,
  );
  @override
  late final _Translations$dialogs$messageInput$en_IN messageInput = _Translations$dialogs$messageInput$en_IN._(_root);
  @override
  late final _Translations$dialogs$noFiles$en_IN noFiles = _Translations$dialogs$noFiles$en_IN._(_root);
  @override
  late final _Translations$dialogs$noPermission$en_IN noPermission = _Translations$dialogs$noPermission$en_IN._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$en_IN notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$en_IN._(_root);
  @override
  late final _Translations$dialogs$qr$en_IN qr = _Translations$dialogs$qr$en_IN._(_root);
  @override
  late final _Translations$dialogs$quickActions$en_IN quickActions = _Translations$dialogs$quickActions$en_IN._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$en_IN quickSaveNotice = _Translations$dialogs$quickSaveNotice$en_IN._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$en_IN quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$en_IN._(_root);
  @override
  late final _Translations$dialogs$pin$en_IN pin = _Translations$dialogs$pin$en_IN._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$en_IN sendModeHelp = _Translations$dialogs$sendModeHelp$en_IN._(_root);
  @override
  late final _Translations$dialogs$zoom$en_IN zoom = _Translations$dialogs$zoom$en_IN._(_root);
}

// Path: sanitization
class _Translations$sanitization$en_IN extends Translations$sanitization$en {
  _Translations$sanitization$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Filename cannot be empty';
  @override
  String get invalid => 'Filename contains invalid characters';
}

// Path: tray
class _Translations$tray$en_IN extends Translations$tray$en {
  _Translations$tray$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$web$en_IN extends Translations$web$en {
  _Translations$web$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$en_IN extends Translations$assetPicker$en {
  _Translations$assetPicker$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$en_IN extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$en_IN extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$en_IN extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$en_IN extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$en_IN extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$en_IN extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$en_IN extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Theme';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$en_IN brightnessOptions =
      _Translations$settingsTab$general$brightnessOptions$en_IN._(_root);
  @override
  String get color => 'Color';
  @override
  late final _Translations$settingsTab$general$colorOptions$en_IN colorOptions = _Translations$settingsTab$general$colorOptions$en_IN._(_root);
  @override
  String get language => 'Language';
  @override
  late final _Translations$settingsTab$general$languageOptions$en_IN languageOptions = _Translations$settingsTab$general$languageOptions$en_IN._(
    _root,
  );
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
class _Translations$settingsTab$receive$en_IN extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$en_IN extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  String get shareViaLinkAutoAccept => 'Share via link: Auto accept';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$en_IN extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$en_IN networkOptions = _Translations$settingsTab$network$networkOptions$en_IN._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$en_IN extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$en_IN extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'This app can send files to other devices; but other devices cannot send files to this device.';
  @override
  String solution({required Object port}) =>
      'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';
  @override
  String get openFirewall => 'Open Firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$en_IN extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'This device cannot discover other devices.';
  @override
  String get solution =>
      'Please make sure that all devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). You can try to type the IP address of the target device manually. If this works, consider adding this device to the favourites so it can be automatically discovered in the future.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$en_IN extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Both devices cannot discover each other nor can they share files.';
  @override
  String get solution =>
      'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The network may not allow communication between participants. In this case, this option must be enabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$en_IN extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$en_IN extends Translations$progressPage$total$en {
  _Translations$progressPage$total$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$en_IN title = _Translations$progressPage$total$title$en_IN._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$en_IN extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Use 'h' for hours abbreviation and 'm' for minutes
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Use 'd' for days, 'h' for hours, and 'm' for minutes
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$en_IN extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Add to selection';
  @override
  String get content => 'What do you want to add?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$en_IN extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Open file';
  @override
  String get content => 'Do you want to open the received file?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$en_IN extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$en_IN extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancel file transfer';
  @override
  String get content => 'Do you really want to cancel the file transfer?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$en_IN extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cannot open file';
  @override
  String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$en_IN extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encryption disabled';
  @override
  String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS, enable encryption again.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$en_IN extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$en_IN extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$en_IN extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Delete from favourites';
  @override
  String content({required Object name}) => 'Do you really want to delete from favourites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$en_IN extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$en_IN extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$en_IN extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enter file name';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$en_IN extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Clear history';
  @override
  String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$en_IN extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$en_IN extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Type message';
  @override
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$en_IN extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No file selected';
  @override
  String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$en_IN extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No permission';
  @override
  String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$en_IN extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Not available';
  @override
  String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$en_IN extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$en_IN extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$en_IN extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'File requests are automatically accepted. Be aware that everyone on the local network can send you files.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$en_IN extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$en_IN extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enter PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$en_IN extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$en_IN extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$en_IN extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$en_IN extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$en_IN extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$en_IN extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

  final TranslationsEnIn _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'All';
  @override
  String get filtered => 'Filtered';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$en_IN extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$en_IN._(TranslationsEnIn root) : this._root = root, super.internal(root);

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
