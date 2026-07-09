///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'English'
  String get locale => 'English';

  /// en: 'LocalSend'
  String get appName => 'LocalSend';

  late final Translations$general$en general = Translations$general$en.internal(_root);
  late final Translations$receiveTab$en receiveTab = Translations$receiveTab$en.internal(_root);
  late final Translations$sendTab$en sendTab = Translations$sendTab$en.internal(_root);
  late final Translations$settingsTab$en settingsTab = Translations$settingsTab$en.internal(_root);
  late final Translations$troubleshootPage$en troubleshootPage = Translations$troubleshootPage$en.internal(_root);
  late final Translations$networkInterfacesPage$en networkInterfacesPage = Translations$networkInterfacesPage$en.internal(_root);
  late final Translations$receiveHistoryPage$en receiveHistoryPage = Translations$receiveHistoryPage$en.internal(_root);
  late final Translations$apkPickerPage$en apkPickerPage = Translations$apkPickerPage$en.internal(_root);
  late final Translations$selectedFilesPage$en selectedFilesPage = Translations$selectedFilesPage$en.internal(_root);
  late final Translations$receivePage$en receivePage = Translations$receivePage$en.internal(_root);
  late final Translations$receiveOptionsPage$en receiveOptionsPage = Translations$receiveOptionsPage$en.internal(_root);
  late final Translations$sendPage$en sendPage = Translations$sendPage$en.internal(_root);
  late final Translations$progressPage$en progressPage = Translations$progressPage$en.internal(_root);
  late final Translations$webSharePage$en webSharePage = Translations$webSharePage$en.internal(_root);
  late final Translations$aboutPage$en aboutPage = Translations$aboutPage$en.internal(_root);
  late final Translations$donationPage$en donationPage = Translations$donationPage$en.internal(_root);
  late final Translations$changelogPage$en changelogPage = Translations$changelogPage$en.internal(_root);
  late final Translations$aliasGenerator$en aliasGenerator = Translations$aliasGenerator$en.internal(_root);
  late final Translations$dialogs$en dialogs = Translations$dialogs$en.internal(_root);
  late final Translations$sanitization$en sanitization = Translations$sanitization$en.internal(_root);
  late final Translations$tray$en tray = Translations$tray$en.internal(_root);
  late final Translations$web$en web = Translations$web$en.internal(_root);
  late final Translations$assetPicker$en assetPicker = Translations$assetPicker$en.internal(_root);
}

// Path: general
class Translations$general$en {
  Translations$general$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Accept'
  String get accept => 'Accept';

  /// en: 'Accepted'
  String get accepted => 'Accepted';

  /// en: 'Add'
  String get add => 'Add';

  /// en: 'Advanced'
  String get advanced => 'Advanced';

  /// en: 'Cancel'
  String get cancel => 'Cancel';

  /// en: 'Close'
  String get close => 'Close';

  /// en: 'Confirm'
  String get confirm => 'Confirm';

  /// en: 'Continue'
  String get continueStr => 'Continue';

  /// en: 'Copy'
  String get copy => 'Copy';

  /// en: 'Copied to Clipboard'
  String get copiedToClipboard => 'Copied to Clipboard';

  /// en: 'Decline'
  String get decline => 'Decline';

  /// en: 'Done'
  String get done => 'Done';

  /// en: 'Delete'
  String get delete => 'Delete';

  /// en: 'Edit'
  String get edit => 'Edit';

  /// en: 'Error'
  String get error => 'Error';

  /// en: 'Example'
  String get example => 'Example';

  /// en: 'Files'
  String get files => 'Files';

  /// en: 'Finished'
  String get finished => 'Finished';

  /// en: 'Hide'
  String get hide => 'Hide';

  /// en: 'Off'
  String get off => 'Off';

  /// en: 'Offline'
  String get offline => 'Offline';

  /// en: 'On'
  String get on => 'On';

  /// en: 'Online'
  String get online => 'Online';

  /// en: 'Open'
  String get open => 'Open';

  /// en: 'Queue'
  String get queue => 'Queue';

  /// en: 'Quick Save'
  String get quickSave => 'Quick Save';

  /// en: 'Quick Save for "Favorites"'
  String get quickSaveFromFavorites => 'Quick Save for "Favorites"';

  /// en: 'Renamed'
  String get renamed => 'Renamed';

  /// en: 'Undo changes'
  String get reset => 'Undo changes';

  /// en: 'Restart'
  String get restart => 'Restart';

  /// en: 'Settings'
  String get settings => 'Settings';

  /// en: 'Skipped'
  String get skipped => 'Skipped';

  /// en: 'Start'
  String get start => 'Start';

  /// en: 'Stop'
  String get stop => 'Stop';

  /// en: 'Save'
  String get save => 'Save';

  /// en: 'Unchanged'
  String get unchanged => 'Unchanged';

  /// en: 'Unknown'
  String get unknown => 'Unknown';

  /// en: 'No items in Clipboard.'
  String get noItemInClipboard => 'No items in Clipboard.';
}

// Path: receiveTab
class Translations$receiveTab$en {
  Translations$receiveTab$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Receive'
  String get title => 'Receive';

  late final Translations$receiveTab$infoBox$en infoBox = Translations$receiveTab$infoBox$en.internal(_root);
  late final Translations$receiveTab$quickSave$en quickSave = Translations$receiveTab$quickSave$en.internal(_root);
}

// Path: sendTab
class Translations$sendTab$en {
  Translations$sendTab$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Send'
  String get title => 'Send';

  late final Translations$sendTab$selection$en selection = Translations$sendTab$selection$en.internal(_root);
  late final Translations$sendTab$picker$en picker = Translations$sendTab$picker$en.internal(_root);

  /// en: 'You can also use the "Share" feature of your mobile device to select files more easily.'
  String get shareIntentInfo => 'You can also use the "Share" feature of your mobile device to select files more easily.';

  /// en: 'Nearby devices'
  String get nearbyDevices => 'Nearby devices';

  /// en: 'This Device'
  String get thisDevice => 'This Device';

  /// en: 'Search devices'
  String get scan => 'Search devices';

  /// en: 'Manual sending'
  String get manualSending => 'Manual sending';

  /// en: 'Send mode'
  String get sendMode => 'Send mode';

  late final Translations$sendTab$sendModes$en sendModes = Translations$sendTab$sendModes$en.internal(_root);

  /// en: 'Explanation'
  String get sendModeHelp => 'Explanation';

  /// en: 'Please ensure that the desired target is also on the same Wi-Fi network.'
  String get help => 'Please ensure that the desired target is also on the same Wi-Fi network.';

  /// en: 'Place items to share.'
  String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class Translations$settingsTab$en {
  Translations$settingsTab$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Settings'
  String get title => 'Settings';

  late final Translations$settingsTab$general$en general = Translations$settingsTab$general$en.internal(_root);
  late final Translations$settingsTab$receive$en receive = Translations$settingsTab$receive$en.internal(_root);
  late final Translations$settingsTab$send$en send = Translations$settingsTab$send$en.internal(_root);
  late final Translations$settingsTab$network$en network = Translations$settingsTab$network$en.internal(_root);
  late final Translations$settingsTab$other$en other = Translations$settingsTab$other$en.internal(_root);

  /// en: 'Advanced settings'
  String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class Translations$troubleshootPage$en {
  Translations$troubleshootPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Troubleshoot'
  String get title => 'Troubleshoot';

  /// en: 'Does the app not work as expected? Here you can find some common solutions to problems.'
  String get subTitle => 'Does the app not work as expected? Here you can find some common solutions to problems.';

  /// en: 'Solution:'
  String get solution => 'Solution:';

  /// en: 'Fix automatically'
  String get fixButton => 'Fix automatically';

  late final Translations$troubleshootPage$firewall$en firewall = Translations$troubleshootPage$firewall$en.internal(_root);
  late final Translations$troubleshootPage$noDiscovery$en noDiscovery = Translations$troubleshootPage$noDiscovery$en.internal(_root);
  late final Translations$troubleshootPage$noConnection$en noConnection = Translations$troubleshootPage$noConnection$en.internal(_root);
}

// Path: networkInterfacesPage
class Translations$networkInterfacesPage$en {
  Translations$networkInterfacesPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Network Interfaces'
  String get title => 'Network Interfaces';

  /// en: 'By default, LocalSend uses all available network interfaces. You can exclude unwanted networks here. You need to restart the server to apply the changes.'
  String get info =>
      'By default, LocalSend uses all available network interfaces. You can exclude unwanted networks here. You need to restart the server to apply the changes.';

  /// en: 'Preview'
  String get preview => 'Preview';

  /// en: 'Whitelist'
  String get whitelist => 'Whitelist';

  /// en: 'Blacklist'
  String get blacklist => 'Blacklist';
}

// Path: receiveHistoryPage
class Translations$receiveHistoryPage$en {
  Translations$receiveHistoryPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'History'
  String get title => 'History';

  /// en: 'Open folder'
  String get openFolder => 'Open folder';

  /// en: 'Delete history'
  String get deleteHistory => 'Delete history';

  /// en: 'The history is empty.'
  String get empty => 'The history is empty.';

  late final Translations$receiveHistoryPage$entryActions$en entryActions = Translations$receiveHistoryPage$entryActions$en.internal(_root);
}

// Path: apkPickerPage
class Translations$apkPickerPage$en {
  Translations$apkPickerPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Apps (APK)'
  String get title => 'Apps (APK)';

  /// en: 'Exclude system apps'
  String get excludeSystemApps => 'Exclude system apps';

  /// en: 'Exclude non-launchable apps'
  String get excludeAppsWithoutLaunchIntent => 'Exclude non-launchable apps';

  /// en: '{n} Apps'
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class Translations$selectedFilesPage$en {
  Translations$selectedFilesPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Delete all'
  String get deleteAll => 'Delete all';
}

// Path: receivePage
class Translations$receivePage$en {
  Translations$receivePage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: '(one) {wants to send you a file} (other) {wants to send you {n} files}'
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
    n,
    one: 'wants to send you a file',
    other: 'wants to send you ${n} files',
  );

  /// en: 'sent you a message:'
  String get subTitleMessage => 'sent you a message:';

  /// en: 'sent you a link:'
  String get subTitleLink => 'sent you a link:';

  /// en: 'The sender has canceled the request.'
  String get canceled => 'The sender has canceled the request.';
}

// Path: receiveOptionsPage
class Translations$receiveOptionsPage$en {
  Translations$receiveOptionsPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Options'
  String get title => 'Options';

  /// en: 'Save to folder'
  String get destination => _root.settingsTab.receive.destination;

  /// en: '(LocalSend folder)'
  String get appDirectory => '(LocalSend folder)';

  /// en: 'Save media to gallery'
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;

  /// en: 'Turned off automatically because there are folders.'
  String get saveToGalleryOff => 'Turned off automatically because there are folders.';
}

// Path: sendPage
class Translations$sendPage$en {
  Translations$sendPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Waiting for response…'
  String get waiting => 'Waiting for response…';

  /// en: 'The recipient has rejected the request.'
  String get rejected => 'The recipient has rejected the request.';

  /// en: 'Too many attempts'
  String get tooManyAttempts => _root.web.tooManyAttempts;

  /// en: 'The recipient is busy with another request.'
  String get busy => 'The recipient is busy with another request.';
}

// Path: progressPage
class Translations$progressPage$en {
  Translations$progressPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Sending files'
  String get titleSending => 'Sending files';

  /// en: 'Receiving files'
  String get titleReceiving => 'Receiving files';

  /// en: 'Saved in Photos'
  String get savedToGallery => 'Saved in Photos';

  late final Translations$progressPage$total$en total = Translations$progressPage$total$en.internal(_root);
  late final Translations$progressPage$remainingTime$en remainingTime = Translations$progressPage$remainingTime$en.internal(_root);
}

// Path: webSharePage
class Translations$webSharePage$en {
  Translations$webSharePage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Share via link'
  String get title => 'Share via link';

  /// en: 'Starting server…'
  String get loading => 'Starting server…';

  /// en: 'Stopping server…'
  String get stopping => 'Stopping server…';

  /// en: 'An error occurred while starting the server.'
  String get error => 'An error occurred while starting the server.';

  /// en: '(one) {Open this link in your browser:} (other) {Open one of these links in your browser:}'
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
    n,
    one: 'Open this link in your browser:',
    other: 'Open one of these links in your browser:',
  );

  /// en: 'Requests'
  String get requests => 'Requests';

  /// en: 'No requests yet.'
  String get noRequests => 'No requests yet.';

  /// en: 'Encryption'
  String get encryption => _root.settingsTab.network.encryption;

  /// en: 'Automatically accept requests'
  String get autoAccept => 'Automatically accept requests';

  /// en: 'Require PIN'
  String get requirePin => 'Require PIN';

  /// en: 'The PIN is "{pin}"'
  String pinHint({required Object pin}) => 'The PIN is "${pin}"';

  /// en: 'LocalSend uses a self-signed certificate. You need to accept it in your browser.'
  String get encryptionHint => 'LocalSend uses a self-signed certificate. You need to accept it in your browser.';

  /// en: 'Pending requests: {n}'
  String pendingRequests({required Object n}) => 'Pending requests: ${n}';
}

// Path: aboutPage
class Translations$aboutPage$en {
  Translations$aboutPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'About LocalSend'
  String get title => 'About LocalSend';

  List<String> get description => [
    'LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.',
    'This app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.',
  ];

  /// en: 'Author'
  String get author => 'Author';

  /// en: 'Contributors'
  String get contributors => 'Contributors';

  /// en: 'Packagers'
  String get packagers => 'Packagers';

  /// en: 'Translators'
  String get translators => 'Translators';
}

// Path: donationPage
class Translations$donationPage$en {
  Translations$donationPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Donate'
  String get title => 'Donate';

  /// en: 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.'
  String get info => 'LocalSend is free, open-source and without any ads. If you like the app, you can support the development with a donation.';

  /// en: 'Donate {amount}'
  String donate({required Object amount}) => 'Donate ${amount}';

  /// en: 'Thank you very much!'
  String get thanks => 'Thank you very much!';

  /// en: 'Restore purchase'
  String get restore => 'Restore purchase';
}

// Path: changelogPage
class Translations$changelogPage$en {
  Translations$changelogPage$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Changelog'
  String get title => 'Changelog';
}

// Path: aliasGenerator
class Translations$aliasGenerator$en {
  Translations$aliasGenerator$en.internal(this._root);

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
  ///
  /// en: '{adjective} {fruit}'
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class Translations$dialogs$en {
  Translations$dialogs$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$dialogs$addFile$en addFile = Translations$dialogs$addFile$en.internal(_root);
  late final Translations$dialogs$openFile$en openFile = Translations$dialogs$openFile$en.internal(_root);
  late final Translations$dialogs$addressInput$en addressInput = Translations$dialogs$addressInput$en.internal(_root);
  late final Translations$dialogs$cancelSession$en cancelSession = Translations$dialogs$cancelSession$en.internal(_root);
  late final Translations$dialogs$cannotOpenFile$en cannotOpenFile = Translations$dialogs$cannotOpenFile$en.internal(_root);
  late final Translations$dialogs$encryptionDisabledNotice$en encryptionDisabledNotice = Translations$dialogs$encryptionDisabledNotice$en.internal(
    _root,
  );
  late final Translations$dialogs$errorDialog$en errorDialog = Translations$dialogs$errorDialog$en.internal(_root);
  late final Translations$dialogs$favoriteDialog$en favoriteDialog = Translations$dialogs$favoriteDialog$en.internal(_root);
  late final Translations$dialogs$favoriteDeleteDialog$en favoriteDeleteDialog = Translations$dialogs$favoriteDeleteDialog$en.internal(_root);
  late final Translations$dialogs$favoriteEditDialog$en favoriteEditDialog = Translations$dialogs$favoriteEditDialog$en.internal(_root);
  late final Translations$dialogs$fileInfo$en fileInfo = Translations$dialogs$fileInfo$en.internal(_root);
  late final Translations$dialogs$fileNameInput$en fileNameInput = Translations$dialogs$fileNameInput$en.internal(_root);
  late final Translations$dialogs$historyClearDialog$en historyClearDialog = Translations$dialogs$historyClearDialog$en.internal(_root);
  late final Translations$dialogs$localNetworkUnauthorized$en localNetworkUnauthorized = Translations$dialogs$localNetworkUnauthorized$en.internal(
    _root,
  );
  late final Translations$dialogs$messageInput$en messageInput = Translations$dialogs$messageInput$en.internal(_root);
  late final Translations$dialogs$noFiles$en noFiles = Translations$dialogs$noFiles$en.internal(_root);
  late final Translations$dialogs$noPermission$en noPermission = Translations$dialogs$noPermission$en.internal(_root);
  late final Translations$dialogs$notAvailableOnPlatform$en notAvailableOnPlatform = Translations$dialogs$notAvailableOnPlatform$en.internal(_root);
  late final Translations$dialogs$qr$en qr = Translations$dialogs$qr$en.internal(_root);
  late final Translations$dialogs$quickActions$en quickActions = Translations$dialogs$quickActions$en.internal(_root);
  late final Translations$dialogs$quickSaveNotice$en quickSaveNotice = Translations$dialogs$quickSaveNotice$en.internal(_root);
  late final Translations$dialogs$quickSaveFromFavoritesNotice$en quickSaveFromFavoritesNotice =
      Translations$dialogs$quickSaveFromFavoritesNotice$en.internal(_root);
  late final Translations$dialogs$pin$en pin = Translations$dialogs$pin$en.internal(_root);
  late final Translations$dialogs$sendModeHelp$en sendModeHelp = Translations$dialogs$sendModeHelp$en.internal(_root);
  late final Translations$dialogs$zoom$en zoom = Translations$dialogs$zoom$en.internal(_root);
}

// Path: sanitization
class Translations$sanitization$en {
  Translations$sanitization$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Filename cannot be empty'
  String get empty => 'Filename cannot be empty';

  /// en: 'Filename contains invalid characters'
  String get invalid => 'Filename contains invalid characters';
}

// Path: tray
class Translations$tray$en {
  Translations$tray$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Open'
  String get open => _root.general.open;

  /// en: 'Quit LocalSend'
  String get close => 'Quit LocalSend';

  /// en: 'Exit'
  String get closeWindows => 'Exit';
}

// Path: web
class Translations$web$en {
  Translations$web$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Waiting for response…'
  String get waiting => _root.sendPage.waiting;

  /// en: 'Enter PIN'
  String get enterPin => 'Enter PIN';

  /// en: 'Invalid PIN'
  String get invalidPin => 'Invalid PIN';

  /// en: 'Too many attempts'
  String get tooManyAttempts => 'Too many attempts';

  /// en: 'Rejected'
  String get rejected => 'Rejected';

  /// en: 'Files'
  String get files => 'Files';

  /// en: 'File name'
  String get fileName => 'File name';

  /// en: 'Size'
  String get size => 'Size';
}

// Path: assetPicker
class Translations$assetPicker$en {
  Translations$assetPicker$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Confirm'
  String get confirm => 'Confirm';

  /// en: 'Cancel'
  String get cancel => 'Cancel';

  /// en: 'Edit'
  String get edit => 'Edit';

  /// en: 'GIF'
  String get gifIndicator => 'GIF';

  /// en: 'Load failed'
  String get loadFailed => 'Load failed';

  /// en: 'Origin'
  String get original => 'Origin';

  /// en: 'Preview'
  String get preview => 'Preview';

  /// en: 'Select'
  String get select => 'Select';

  /// en: 'Empty list'
  String get emptyList => 'Empty list';

  /// en: 'Unsupported file type.'
  String get unSupportedAssetType => 'Unsupported file type.';

  /// en: 'Unable to access all files on the device'
  String get unableToAccessAll => 'Unable to access all files on the device';

  /// en: 'Only view files and albums accessible to the app.'
  String get viewingLimitedAssetsTip => 'Only view files and albums accessible to the app.';

  /// en: 'Click to update accessible files'
  String get changeAccessibleLimitedAssets => 'Click to update accessible files';

  /// en: 'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.'
  String get accessAllTip =>
      'App can only access some files on the device. Go to system settings and allow the app to access all media on the device.';

  /// en: 'Go to system settings'
  String get goToSystemSettings => 'Go to system settings';

  /// en: 'Continue with limited access'
  String get accessLimitedAssets => 'Continue with limited access';

  /// en: 'Accessible files'
  String get accessiblePathName => 'Accessible files';

  /// en: 'Audio'
  String get sTypeAudioLabel => 'Audio';

  /// en: 'Image'
  String get sTypeImageLabel => 'Image';

  /// en: 'Video'
  String get sTypeVideoLabel => 'Video';

  /// en: 'Other media'
  String get sTypeOtherLabel => 'Other media';

  /// en: 'play'
  String get sActionPlayHint => 'play';

  /// en: 'preview'
  String get sActionPreviewHint => 'preview';

  /// en: 'select'
  String get sActionSelectHint => 'select';

  /// en: 'change path'
  String get sActionSwitchPathLabel => 'change path';

  /// en: 'use camera'
  String get sActionUseCameraHint => 'use camera';

  /// en: 'duration'
  String get sNameDurationLabel => 'duration';

  /// en: 'count'
  String get sUnitAssetCountLabel => 'count';
}

// Path: receiveTab.infoBox
class Translations$receiveTab$infoBox$en {
  Translations$receiveTab$infoBox$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'IP:'
  String get ip => 'IP:';

  /// en: 'Port:'
  String get port => 'Port:';

  /// en: 'Device name:'
  String get alias => 'Device name:';
}

// Path: receiveTab.quickSave
class Translations$receiveTab$quickSave$en {
  Translations$receiveTab$quickSave$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Off'
  String get off => _root.general.off;

  /// en: 'Favorites'
  String get favorites => 'Favorites';

  /// en: 'On'
  String get on => _root.general.on;
}

// Path: sendTab.selection
class Translations$sendTab$selection$en {
  Translations$sendTab$selection$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Selection'
  String get title => 'Selection';

  /// en: 'Files: {files}'
  String files({required Object files}) => 'Files: ${files}';

  /// en: 'Size: {size}'
  String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class Translations$sendTab$picker$en {
  Translations$sendTab$picker$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'File'
  String get file => 'File';

  /// en: 'Folder'
  String get folder => 'Folder';

  /// en: 'Media'
  String get media => 'Media';

  /// en: 'Text'
  String get text => 'Text';

  /// en: 'App'
  String get app => 'App';

  /// en: 'Paste'
  String get clipboard => 'Paste';
}

// Path: sendTab.sendModes
class Translations$sendTab$sendModes$en {
  Translations$sendTab$sendModes$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Single recipient'
  String get single => 'Single recipient';

  /// en: 'Multiple recipients'
  String get multiple => 'Multiple recipients';

  /// en: 'Share via link'
  String get link => 'Share via link';
}

// Path: settingsTab.general
class Translations$settingsTab$general$en {
  Translations$settingsTab$general$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'General'
  String get title => 'General';

  /// en: 'Theme'
  String get brightness => 'Theme';

  late final Translations$settingsTab$general$brightnessOptions$en brightnessOptions = Translations$settingsTab$general$brightnessOptions$en.internal(
    _root,
  );

  /// en: 'Color'
  String get color => 'Color';

  late final Translations$settingsTab$general$colorOptions$en colorOptions = Translations$settingsTab$general$colorOptions$en.internal(_root);

  /// en: 'Language'
  String get language => 'Language';

  late final Translations$settingsTab$general$languageOptions$en languageOptions = Translations$settingsTab$general$languageOptions$en.internal(
    _root,
  );

  /// en: 'Save window position after quit'
  String get saveWindowPlacement => 'Save window position after quit';

  /// en: 'Save window position after exit'
  String get saveWindowPlacementWindows => 'Save window position after exit';

  /// en: 'Minimize to the System Tray/Menu Bar when closing'
  String get minimizeToTray => 'Minimize to the System Tray/Menu Bar when closing';

  /// en: 'Autostart after login'
  String get launchAtStartup => 'Autostart after login';

  /// en: 'Autostart: Start hidden'
  String get launchMinimized => 'Autostart: Start hidden';

  /// en: 'Show LocalSend in context menu'
  String get showInContextMenu => 'Show LocalSend in context menu';

  /// en: 'Animations'
  String get animations => 'Animations';
}

// Path: settingsTab.receive
class Translations$settingsTab$receive$en {
  Translations$settingsTab$receive$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Receive'
  String get title => 'Receive';

  /// en: 'Quick Save'
  String get quickSave => _root.general.quickSave;

  /// en: 'Quick Save for "Favorites"'
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;

  /// en: 'Require PIN'
  String get requirePin => _root.webSharePage.requirePin;

  /// en: 'Auto Finish'
  String get autoFinish => 'Auto Finish';

  /// en: 'Save to folder'
  String get destination => 'Save to folder';

  /// en: '(Downloads)'
  String get downloads => '(Downloads)';

  /// en: 'Save media to gallery'
  String get saveToGallery => 'Save media to gallery';

  /// en: 'Save to history'
  String get saveToHistory => 'Save to history';
}

// Path: settingsTab.send
class Translations$settingsTab$send$en {
  Translations$settingsTab$send$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Send'
  String get title => 'Send';

  /// en: 'Automatically accept requests in "Share via link" mode'
  String get shareViaLinkAutoAccept => 'Automatically accept requests in "Share via link" mode';
}

// Path: settingsTab.network
class Translations$settingsTab$network$en {
  Translations$settingsTab$network$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Network'
  String get title => 'Network';

  /// en: 'Restart the server to apply the settings!'
  String get needRestart => 'Restart the server to apply the settings!';

  /// en: 'Server'
  String get server => 'Server';

  /// en: 'Device name'
  String get alias => 'Device name';

  /// en: 'Device type'
  String get deviceType => 'Device type';

  /// en: 'Device model'
  String get deviceModel => 'Device model';

  /// en: 'Port'
  String get port => 'Port';

  /// en: 'Network'
  String get network => 'Network';

  late final Translations$settingsTab$network$networkOptions$en networkOptions = Translations$settingsTab$network$networkOptions$en.internal(_root);

  /// en: 'Discovery Timeout'
  String get discoveryTimeout => 'Discovery Timeout';

  /// en: 'Use system name'
  String get useSystemName => 'Use system name';

  /// en: 'Generate random alias'
  String get generateRandomAlias => 'Generate random alias';

  /// en: 'You might not be detected by other devices because you are using a custom port. (default: {defaultPort})'
  String portWarning({required Object defaultPort}) =>
      'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';

  /// en: 'Encryption'
  String get encryption => 'Encryption';

  /// en: 'Multicast address'
  String get multicastGroup => 'Multicast address';

  /// en: 'You might not be detected by other devices because you are using a custom multicast address. (default: {defaultMulticast})'
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'You might not be detected by other devices because you are using a custom multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class Translations$settingsTab$other$en {
  Translations$settingsTab$other$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Other'
  String get title => 'Other';

  /// en: 'Support LocalSend'
  String get support => 'Support LocalSend';

  /// en: 'Donate'
  String get donate => 'Donate';

  /// en: 'Privacy Policy'
  String get privacyPolicy => 'Privacy Policy';

  /// en: 'Terms of Use'
  String get termsOfUse => 'Terms of Use';
}

// Path: troubleshootPage.firewall
class Translations$troubleshootPage$firewall$en {
  Translations$troubleshootPage$firewall$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'This device can send files to other devices but other devices cannot send files to this device.'
  String get symptom => 'This device can send files to other devices but other devices cannot send files to this device.';

  /// en: 'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port {port}.'
  String solution({required Object port}) =>
      'This is most likely a firewall issue. You can solve this by allowing incoming connections (UDP and TCP) on port ${port}.';

  /// en: 'Open Firewall'
  String get openFirewall => 'Open Firewall';
}

// Path: troubleshootPage.noDiscovery
class Translations$troubleshootPage$noDiscovery$en {
  Translations$troubleshootPage$noDiscovery$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'This device cannot discover other devices.'
  String get symptom => 'This device cannot discover other devices.';

  /// en: 'Please make sure that all devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). You can try to type the IP address of the target device manually. If this works, consider adding this device to the favorites so it can be automatically discovered in the future.'
  String get solution =>
      'Please make sure that all devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). You can try to type the IP address of the target device manually. If this works, consider adding this device to the favorites so it can be automatically discovered in the future.';
}

// Path: troubleshootPage.noConnection
class Translations$troubleshootPage$noConnection$en {
  Translations$troubleshootPage$noConnection$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Both devices cannot discover each other nor can they share files.'
  String get symptom => 'Both devices cannot discover each other nor can they share files.';

  /// en: 'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The Wi-Fi network may not allow communication between participants due to Access Point (AP) Isolation. In this case, this option must be disabled on the router.'
  String get solution =>
      'Does the problem exist on both sides? If so, you need to make sure that both devices are on the same Wi-Fi network and share the same configuration (port, multicast address, encryption). The Wi-Fi network may not allow communication between participants due to Access Point (AP) Isolation. In this case, this option must be disabled on the router.';
}

// Path: receiveHistoryPage.entryActions
class Translations$receiveHistoryPage$entryActions$en {
  Translations$receiveHistoryPage$entryActions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Open file'
  String get open => 'Open file';

  /// en: 'Show in folder'
  String get showInFolder => 'Show in folder';

  /// en: 'Information'
  String get info => 'Information';

  /// en: 'Delete from history'
  String get deleteFromHistory => 'Delete from history';
}

// Path: progressPage.total
class Translations$progressPage$total$en {
  Translations$progressPage$total$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$progressPage$total$title$en title = Translations$progressPage$total$title$en.internal(_root);

  /// en: 'Files: {curr} / {n}'
  String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';

  /// en: 'Size: {curr} / {n}'
  String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';

  /// en: 'Speed: {speed}/s'
  String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: progressPage.remainingTime
class Translations$progressPage$remainingTime$en {
  Translations$progressPage$remainingTime$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: '{n}:{ss}'
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';

  /// en: '{n}:{ss}'
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Use 'h' for hours abbreviation and 'm' for minutes
  ///
  /// en: '{h}h {m}m'
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Use 'd' for days, 'h' for hours, and 'm' for minutes
  ///
  /// en: '{d}d {h}h {m}m'
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class Translations$dialogs$addFile$en {
  Translations$dialogs$addFile$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Add to selection'
  String get title => 'Add to selection';

  /// en: 'What do you want to add?'
  String get content => 'What do you want to add?';
}

// Path: dialogs.openFile
class Translations$dialogs$openFile$en {
  Translations$dialogs$openFile$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Open file'
  String get title => 'Open file';

  /// en: 'Do you want to open the received file?'
  String get content => 'Do you want to open the received file?';
}

// Path: dialogs.addressInput
class Translations$dialogs$addressInput$en {
  Translations$dialogs$addressInput$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Enter address'
  String get title => 'Enter address';

  /// en: 'Hashtag'
  String get hashtag => 'Hashtag';

  /// en: 'IP Address'
  String get ip => 'IP Address';

  /// en: 'Recently used: '
  String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class Translations$dialogs$cancelSession$en {
  Translations$dialogs$cancelSession$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Cancel files transfer'
  String get title => 'Cancel files transfer';

  /// en: 'Do you really want to cancel the files transfer?'
  String get content => 'Do you really want to cancel the files transfer?';
}

// Path: dialogs.cannotOpenFile
class Translations$dialogs$cannotOpenFile$en {
  Translations$dialogs$cannotOpenFile$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Cannot open file'
  String get title => 'Cannot open file';

  /// en: 'Could not open "{file}". Has this file been moved, renamed or deleted?'
  String content({required Object file}) => 'Could not open "${file}". Has this file been moved, renamed or deleted?';
}

// Path: dialogs.encryptionDisabledNotice
class Translations$dialogs$encryptionDisabledNotice$en {
  Translations$dialogs$encryptionDisabledNotice$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Encryption disabled'
  String get title => 'Encryption disabled';

  /// en: 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS protocol, enable encryption again.'
  String get content => 'Communication now takes place via the unencrypted HTTP protocol. To use HTTPS protocol, enable encryption again.';
}

// Path: dialogs.errorDialog
class Translations$dialogs$errorDialog$en {
  Translations$dialogs$errorDialog$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Error'
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class Translations$dialogs$favoriteDialog$en {
  Translations$dialogs$favoriteDialog$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Favorites'
  String get title => 'Favorites';

  /// en: 'No favorite devices yet.'
  String get noFavorites => 'No favorite devices yet.';

  /// en: 'Add'
  String get addFavorite => 'Add';
}

// Path: dialogs.favoriteDeleteDialog
class Translations$dialogs$favoriteDeleteDialog$en {
  Translations$dialogs$favoriteDeleteDialog$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Delete from favorites'
  String get title => 'Delete from favorites';

  /// en: 'Do you really want to delete from favorites "{name}"?'
  String content({required Object name}) => 'Do you really want to delete from favorites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class Translations$dialogs$favoriteEditDialog$en {
  Translations$dialogs$favoriteEditDialog$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Add to favorites'
  String get titleAdd => 'Add to favorites';

  /// en: 'Settings'
  String get titleEdit => 'Settings';

  /// en: 'Device name'
  String get name => 'Device name';

  /// en: '(auto)'
  String get auto => '(auto)';

  /// en: 'IP Address'
  String get ip => 'IP Address';

  /// en: 'Port'
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class Translations$dialogs$fileInfo$en {
  Translations$dialogs$fileInfo$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'File information'
  String get title => 'File information';

  /// en: 'File name:'
  String get fileName => 'File name:';

  /// en: 'Path:'
  String get path => 'Path:';

  /// en: 'Size:'
  String get size => 'Size:';

  /// en: 'Sender:'
  String get sender => 'Sender:';

  /// en: 'Time:'
  String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class Translations$dialogs$fileNameInput$en {
  Translations$dialogs$fileNameInput$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Enter file name'
  String get title => 'Enter file name';

  /// en: 'Original: {original}'
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class Translations$dialogs$historyClearDialog$en {
  Translations$dialogs$historyClearDialog$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Clear history'
  String get title => 'Clear history';

  /// en: 'Do you really want to delete the entire history?'
  String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class Translations$dialogs$localNetworkUnauthorized$en {
  Translations$dialogs$localNetworkUnauthorized$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No permission'
  String get title => _root.dialogs.noPermission.title;

  /// en: 'LocalSend can't find other devices without having the permission to scan the local network. Please grant this permission in the settings.'
  String get description =>
      'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';

  /// en: 'Settings'
  String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class Translations$dialogs$messageInput$en {
  Translations$dialogs$messageInput$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Type message'
  String get title => 'Type message';

  /// en: 'Multiline'
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class Translations$dialogs$noFiles$en {
  Translations$dialogs$noFiles$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No files selected'
  String get title => 'No files selected';

  /// en: 'Please select at least one file.'
  String get content => 'Please select at least one file.';
}

// Path: dialogs.noPermission
class Translations$dialogs$noPermission$en {
  Translations$dialogs$noPermission$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No permission'
  String get title => 'No permission';

  /// en: 'You have not granted the necessary permissions. Please grant them in the settings.'
  String get content => 'You have not granted the necessary permissions. Please grant them in the settings.';
}

// Path: dialogs.notAvailableOnPlatform
class Translations$dialogs$notAvailableOnPlatform$en {
  Translations$dialogs$notAvailableOnPlatform$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Not available'
  String get title => 'Not available';

  /// en: 'This feature is only available on:'
  String get content => 'This feature is only available on:';
}

// Path: dialogs.qr
class Translations$dialogs$qr$en {
  Translations$dialogs$qr$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'QR Code'
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class Translations$dialogs$quickActions$en {
  Translations$dialogs$quickActions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Quick Actions'
  String get title => 'Quick Actions';

  /// en: 'Counter'
  String get counter => 'Counter';

  /// en: 'Prefix'
  String get prefix => 'Prefix';

  /// en: 'Pad with zeros'
  String get padZero => 'Pad with zeros';

  /// en: 'Sort alphabetically beforehand (A-Z)'
  String get sortBeforeCount => 'Sort alphabetically beforehand (A-Z)';

  /// en: 'Random'
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class Translations$dialogs$quickSaveNotice$en {
  Translations$dialogs$quickSaveNotice$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Quick Save'
  String get title => _root.general.quickSave;

  /// en: 'File requests are now accepted automatically. Be aware that everyone on the local network can send you files.'
  String get content => 'File requests are now accepted automatically. Be aware that everyone on the local network can send you files.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class Translations$dialogs$quickSaveFromFavoritesNotice$en {
  Translations$dialogs$quickSaveFromFavoritesNotice$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Quick Save for "Favorites"'
  String get title => _root.general.quickSaveFromFavorites;

  List<String> get content => [
    'File requests are now accepted automatically from devices in your favorites list.',
    'Warning! Currently, this is not entirely secure, as a hacker who has the fingerprint of any device from your favorites list can send you files without restriction.',
    'However, this option is still safer than allowing all users on the local network to send you files without restriction.',
  ];
}

// Path: dialogs.pin
class Translations$dialogs$pin$en {
  Translations$dialogs$pin$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Enter PIN'
  String get title => 'Enter PIN';
}

// Path: dialogs.sendModeHelp
class Translations$dialogs$sendModeHelp$en {
  Translations$dialogs$sendModeHelp$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Send modes'
  String get title => 'Send modes';

  /// en: 'Sends files to one recipient. Selection will be cleared after finished files transfer.'
  String get single => 'Sends files to one recipient. Selection will be cleared after finished files transfer.';

  /// en: 'Sends files to multiple recipients. Selection will not be cleared after finished files transfer.'
  String get multiple => 'Sends files to multiple recipients. Selection will not be cleared after finished files transfer.';

  /// en: 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.'
  String get link => 'Recipients who do not have LocalSend installed can download the selected files by opening the link in their browser.';
}

// Path: dialogs.zoom
class Translations$dialogs$zoom$en {
  Translations$dialogs$zoom$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'URL'
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class Translations$settingsTab$general$brightnessOptions$en {
  Translations$settingsTab$general$brightnessOptions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'System'
  String get system => 'System';

  /// en: 'Dark'
  String get dark => 'Dark';

  /// en: 'Light'
  String get light => 'Light';
}

// Path: settingsTab.general.colorOptions
class Translations$settingsTab$general$colorOptions$en {
  Translations$settingsTab$general$colorOptions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'System'
  String get system => 'System';

  /// en: 'OLED'
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class Translations$settingsTab$general$languageOptions$en {
  Translations$settingsTab$general$languageOptions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'System'
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class Translations$settingsTab$network$networkOptions$en {
  Translations$settingsTab$network$networkOptions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'All'
  String get all => 'All';

  /// en: 'Filtered'
  String get filtered => 'Filtered';
}

// Path: progressPage.total.title
class Translations$progressPage$total$title$en {
  Translations$progressPage$total$title$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Total progress ({time})'
  String sending({required Object time}) => 'Total progress (${time})';

  /// en: 'Finished with error'
  String get finishedError => 'Finished with error';

  /// en: 'Canceled by sender'
  String get canceledSender => 'Canceled by sender';

  /// en: 'Canceled by receiver'
  String get canceledReceiver => 'Canceled by receiver';
}
