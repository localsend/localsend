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
class TranslationsFilPh extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFilPh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.filPh,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <fil-PH>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsFilPh _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Filipino';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralFilPh general = _TranslationsGeneralFilPh._(_root);
  @override
  late final _TranslationsReceiveTabFilPh receiveTab = _TranslationsReceiveTabFilPh._(_root);
  @override
  late final _TranslationsSendTabFilPh sendTab = _TranslationsSendTabFilPh._(_root);
  @override
  late final _TranslationsSettingsTabFilPh settingsTab = _TranslationsSettingsTabFilPh._(_root);
  @override
  late final _TranslationsTroubleshootPageFilPh troubleshootPage = _TranslationsTroubleshootPageFilPh._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageFilPh networkInterfacesPage = _TranslationsNetworkInterfacesPageFilPh._(_root);
  @override
  late final _TranslationsReceiveHistoryPageFilPh receiveHistoryPage = _TranslationsReceiveHistoryPageFilPh._(_root);
  @override
  late final _TranslationsApkPickerPageFilPh apkPickerPage = _TranslationsApkPickerPageFilPh._(_root);
  @override
  late final _TranslationsSelectedFilesPageFilPh selectedFilesPage = _TranslationsSelectedFilesPageFilPh._(_root);
  @override
  late final _TranslationsReceivePageFilPh receivePage = _TranslationsReceivePageFilPh._(_root);
  @override
  late final _TranslationsReceiveOptionsPageFilPh receiveOptionsPage = _TranslationsReceiveOptionsPageFilPh._(_root);
  @override
  late final _TranslationsSendPageFilPh sendPage = _TranslationsSendPageFilPh._(_root);
  @override
  late final _TranslationsProgressPageFilPh progressPage = _TranslationsProgressPageFilPh._(_root);
  @override
  late final _TranslationsWebSharePageFilPh webSharePage = _TranslationsWebSharePageFilPh._(_root);
  @override
  late final _TranslationsAboutPageFilPh aboutPage = _TranslationsAboutPageFilPh._(_root);
  @override
  late final _TranslationsDonationPageFilPh donationPage = _TranslationsDonationPageFilPh._(_root);
  @override
  late final _TranslationsChangelogPageFilPh changelogPage = _TranslationsChangelogPageFilPh._(_root);
  @override
  late final _TranslationsAliasGeneratorFilPh aliasGenerator = _TranslationsAliasGeneratorFilPh._(_root);
  @override
  late final _TranslationsDialogsFilPh dialogs = _TranslationsDialogsFilPh._(_root);
  @override
  late final _TranslationsSanitizationFilPh sanitization = _TranslationsSanitizationFilPh._(_root);
  @override
  late final _TranslationsTrayFilPh tray = _TranslationsTrayFilPh._(_root);
  @override
  late final _TranslationsWebFilPh web = _TranslationsWebFilPh._(_root);
  @override
  late final _TranslationsAssetPickerFilPh assetPicker = _TranslationsAssetPickerFilPh._(_root);
}

// Path: general
class _TranslationsGeneralFilPh extends TranslationsGeneralEn {
  _TranslationsGeneralFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Tanggapin';
  @override
  String get accepted => 'Tinanggap';
  @override
  String get add => 'Magdagdag';
  @override
  String get advanced => 'Advanced';
  @override
  String get cancel => 'Kanselahin';
  @override
  String get close => 'Isara';
  @override
  String get confirm => 'Kumpirmahin';
  @override
  String get continueStr => 'Magpatuloy';
  @override
  String get copy => 'Kopyahin';
  @override
  String get copiedToClipboard => 'Kopyahin sa Clipboard';
  @override
  String get decline => 'Tanggihan';
  @override
  String get done => 'Tapos Na';
  @override
  String get delete => 'Tanggalin';
  @override
  String get edit => 'Baguhin';
  @override
  String get error => 'Error';
  @override
  String get example => 'Halimbawa';
  @override
  String get files => 'Files';
  @override
  String get finished => 'Tapos Na';
  @override
  String get hide => 'Itago';
  @override
  String get off => 'Sarado';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Bukas';
  @override
  String get online => 'Online';
  @override
  String get open => 'Buksan';
  @override
  String get queue => 'Pila';
  @override
  String get quickSave => 'Quick Save';
  @override
  String get quickSaveFromFavorites => 'I-save agad kapag galing sa "Favorites"';
  @override
  String get renamed => 'Pinangalanan';
  @override
  String get reset => 'Reset';
  @override
  String get restart => 'Restart';
  @override
  String get settings => 'Settings';
  @override
  String get skipped => 'Nilaktawan';
  @override
  String get start => 'Simulan';
  @override
  String get stop => 'Ihinto';
  @override
  String get save => 'Save';
  @override
  String get unchanged => 'Walang Pagbabago';
  @override
  String get unknown => 'Hindi Kilala';
  @override
  String get noItemInClipboard => 'Walang Item sa Clipboard';
}

// Path: receiveTab
class _TranslationsReceiveTabFilPh extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tumanggap';
  @override
  late final _TranslationsReceiveTabInfoBoxFilPh infoBox = _TranslationsReceiveTabInfoBoxFilPh._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveFilPh quickSave = _TranslationsReceiveTabQuickSaveFilPh._(_root);
}

// Path: sendTab
class _TranslationsSendTabFilPh extends TranslationsSendTabEn {
  _TranslationsSendTabFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Magpadala';
  @override
  late final _TranslationsSendTabSelectionFilPh selection = _TranslationsSendTabSelectionFilPh._(_root);
  @override
  late final _TranslationsSendTabPickerFilPh picker = _TranslationsSendTabPickerFilPh._(_root);
  @override
  String get shareIntentInfo => 'Maaaring gamitin ang "Share" feature sa iyong mobile device para sa mas madaling pagpili ng mga file.';
  @override
  String get nearbyDevices => 'Malalapit na mga device';
  @override
  String get thisDevice => 'Ang Device na Ito';
  @override
  String get scan => 'Maghanap ng mga device';
  @override
  String get manualSending => 'Mano-manong pagpapadala';
  @override
  String get sendMode => 'Send mode';
  @override
  late final _TranslationsSendTabSendModesFilPh sendModes = _TranslationsSendTabSendModesFilPh._(_root);
  @override
  String get sendModeHelp => 'Paliwanag';
  @override
  String get help => 'Mangyaring siguraduhin na ang target ay nasa parehas na wifi network.';
  @override
  String get placeItems => 'Maglagay ng mga bagay na i-share.';
}

// Path: settingsTab
class _TranslationsSettingsTabFilPh extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Settings';
  @override
  late final _TranslationsSettingsTabGeneralFilPh general = _TranslationsSettingsTabGeneralFilPh._(_root);
  @override
  late final _TranslationsSettingsTabReceiveFilPh receive = _TranslationsSettingsTabReceiveFilPh._(_root);
  @override
  late final _TranslationsSettingsTabSendFilPh send = _TranslationsSettingsTabSendFilPh._(_root);
  @override
  late final _TranslationsSettingsTabNetworkFilPh network = _TranslationsSettingsTabNetworkFilPh._(_root);
  @override
  late final _TranslationsSettingsTabOtherFilPh other = _TranslationsSettingsTabOtherFilPh._(_root);
  @override
  String get advancedSettings => 'Advanced settings';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageFilPh extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Troubleshoot';
  @override
  String get subTitle => 'Hindi gumagana ang app na ito gaya nang inaasahan? Narito ang mga madalas na solusyon.';
  @override
  String get solution => 'Solusyon:';
  @override
  String get fixButton => 'Awtomatikong ayusin';
  @override
  late final _TranslationsTroubleshootPageFirewallFilPh firewall = _TranslationsTroubleshootPageFirewallFilPh._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryFilPh noDiscovery = _TranslationsTroubleshootPageNoDiscoveryFilPh._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionFilPh noConnection = _TranslationsTroubleshootPageNoConnectionFilPh._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageFilPh extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mga Interface ng Network';
  @override
  String get info =>
      'Bilang default, ang LocalSend ay gumagamit ng lahat ng mga available na network interface. Maaari mong ibukod ang mga hindi mo gustong network dito. Kinakailangang i-restart ang server upang mai-apply ang mga pagbabago';
  @override
  String get preview => 'Silipin';
  @override
  String get whitelist => 'Whitelist';
  @override
  String get blacklist => 'Blacklist';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageFilPh extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'History';
  @override
  String get openFolder => 'Buksan ang folder';
  @override
  String get deleteHistory => 'Burahin ang history';
  @override
  String get empty => 'Walang laman ang history.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsFilPh entryActions = _TranslationsReceiveHistoryPageEntryActionsFilPh._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageFilPh extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'Ibukod ang mga system app';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Ibukod and mga non-launchable app';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageFilPh extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Burahin lahat';
}

// Path: receivePage
class _TranslationsReceivePageFilPh extends TranslationsReceivePageEn {
  _TranslationsReceivePageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fil'))(
    n,
    one: 'ay gustong magpadala sa iyo ng file',
    other: 'ay gustong magpadala sa iyo ng ${n} na mga file',
  );
  @override
  String get subTitleMessage => 'ay nagpadala sa iyo ng mensahe:';
  @override
  String get subTitleLink => 'ay nagpadala sa iyo ng link:';
  @override
  String get canceled => 'Ang sender ay nagkansela ng request.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageFilPh extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

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
  String get saveToGalleryOff => 'Awtomatikong pinatay dahil mayroong mga directories.';
}

// Path: sendPage
class _TranslationsSendPageFilPh extends TranslationsSendPageEn {
  _TranslationsSendPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Naghihintay ng response...';
  @override
  String get rejected => 'Tinanggihan ng recipient ang request.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Ang recipient ay abala pa sa ibang request.';
}

// Path: progressPage
class _TranslationsProgressPageFilPh extends TranslationsProgressPageEn {
  _TranslationsProgressPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Nagpapadala ng mga file';
  @override
  String get titleReceiving => 'Tumatanggap ng mga file';
  @override
  String get savedToGallery => 'Naka-save sa Photos';
  @override
  late final _TranslationsProgressPageTotalFilPh total = _TranslationsProgressPageTotalFilPh._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageFilPh extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'I-share gamit ang link';
  @override
  String get loading => 'Binubuksan ang server...';
  @override
  String get stopping => 'Ihinihinto ang server...';
  @override
  String get error => 'May nangyaring error habang binubuksan ang server.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fil'))(
    n,
    one: 'Buksan ang link na ito sa browser:',
    other: 'Buksan ang isa sa mga link na ito sa browser:',
  );
  @override
  String get requests => 'Requests';
  @override
  String get noRequests => 'Wala pang mga request.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Kusang I-accept ang request';
  @override
  String get requirePin => 'I-require ang Pin';
  @override
  String pinHint({required Object pin}) => 'Ang Pin ay "${pin}"';
  @override
  String get encryptionHint => 'Ang LocalSend ay gumagamit ng self-signed certificate. Kailangan mo itong i-accept sa browser.';
  @override
  String pendingRequests({required Object n}) => 'Mga naka-pending na request: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageFilPh extends TranslationsAboutPageEn {
  _TranslationsAboutPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tungkol sa LocalSend';
  @override
  List<String> get description => [
    'Ang LocalSend ay isang libre at open-source na app na nagbibigay-daan sa secure na pagbabahagi ng mga file at mga message sa mga kalapit na device sa iyong local network nang hindi nangangailangan ng koneksyon sa internet.',
    'Available ang app na ito sa Android, iOS, macOS, Windows, at Linux. Maaari mong mahanap ang lahat ng mga pagpipilian sa pag-download sa opisyal na homepage.',
  ];
  @override
  String get author => 'Author';
  @override
  String get contributors => 'Mga Contributor';
  @override
  String get packagers => 'Mga Packagers';
  @override
  String get translators => 'Mga Translator';
}

// Path: donationPage
class _TranslationsDonationPageFilPh extends TranslationsDonationPageEn {
  _TranslationsDonationPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mag-donate';
  @override
  String get info =>
      'Ang LocalSend ay libre, open-source, at walang anumang mga ad. Kung iyong nagustuhan ang app, maaari mong suportahan ang development sa pamamagitan ng donasyon.';
  @override
  String donate({required Object amount}) => 'Mag-donate ng ${amount}';
  @override
  String get thanks => 'Maraming salamat!';
  @override
  String get restore => 'Restore purchase';
}

// Path: changelogPage
class _TranslationsChangelogPageFilPh extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorFilPh extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

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
class _TranslationsDialogsFilPh extends TranslationsDialogsEn {
  _TranslationsDialogsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileFilPh addFile = _TranslationsDialogsAddFileFilPh._(_root);
  @override
  late final _TranslationsDialogsOpenFileFilPh openFile = _TranslationsDialogsOpenFileFilPh._(_root);
  @override
  late final _TranslationsDialogsAddressInputFilPh addressInput = _TranslationsDialogsAddressInputFilPh._(_root);
  @override
  late final _TranslationsDialogsCancelSessionFilPh cancelSession = _TranslationsDialogsCancelSessionFilPh._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileFilPh cannotOpenFile = _TranslationsDialogsCannotOpenFileFilPh._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeFilPh encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeFilPh._(_root);
  @override
  late final _TranslationsDialogsErrorDialogFilPh errorDialog = _TranslationsDialogsErrorDialogFilPh._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogFilPh favoriteDialog = _TranslationsDialogsFavoriteDialogFilPh._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogFilPh favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogFilPh._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogFilPh favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogFilPh._(_root);
  @override
  late final _TranslationsDialogsFileInfoFilPh fileInfo = _TranslationsDialogsFileInfoFilPh._(_root);
  @override
  late final _TranslationsDialogsFileNameInputFilPh fileNameInput = _TranslationsDialogsFileNameInputFilPh._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogFilPh historyClearDialog = _TranslationsDialogsHistoryClearDialogFilPh._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedFilPh localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedFilPh._(_root);
  @override
  late final _TranslationsDialogsMessageInputFilPh messageInput = _TranslationsDialogsMessageInputFilPh._(_root);
  @override
  late final _TranslationsDialogsNoFilesFilPh noFiles = _TranslationsDialogsNoFilesFilPh._(_root);
  @override
  late final _TranslationsDialogsNoPermissionFilPh noPermission = _TranslationsDialogsNoPermissionFilPh._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformFilPh notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformFilPh._(_root);
  @override
  late final _TranslationsDialogsQrFilPh qr = _TranslationsDialogsQrFilPh._(_root);
  @override
  late final _TranslationsDialogsQuickActionsFilPh quickActions = _TranslationsDialogsQuickActionsFilPh._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeFilPh quickSaveNotice = _TranslationsDialogsQuickSaveNoticeFilPh._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeFilPh quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeFilPh._(_root);
  @override
  late final _TranslationsDialogsPinFilPh pin = _TranslationsDialogsPinFilPh._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpFilPh sendModeHelp = _TranslationsDialogsSendModeHelpFilPh._(_root);
  @override
  late final _TranslationsDialogsZoomFilPh zoom = _TranslationsDialogsZoomFilPh._(_root);
}

// Path: sanitization
class _TranslationsSanitizationFilPh extends TranslationsSanitizationEn {
  _TranslationsSanitizationFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ang Filename ay hindi maaaring walang laman';
  @override
  String get invalid => 'Ang Filename ay naglalaman ng hindi suportado na characters';
}

// Path: tray
class _TranslationsTrayFilPh extends TranslationsTrayEn {
  _TranslationsTrayFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Isara ang LocalSend';
  @override
  String get closeWindows => 'Isara';
}

// Path: web
class _TranslationsWebFilPh extends TranslationsWebEn {
  _TranslationsWebFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Ilagay ang PIN';
  @override
  String get invalidPin => 'Ang PIN ay invalid';
  @override
  String get tooManyAttempts => 'Marami nang pagsubok';
  @override
  String get rejected => 'Hindi Tinanggap';
  @override
  String get files => 'Files';
  @override
  String get fileName => 'Pangalan ng file';
  @override
  String get size => 'Size';
}

// Path: assetPicker
class _TranslationsAssetPickerFilPh extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Kumpirmahin';
  @override
  String get cancel => 'Kanselahin';
  @override
  String get edit => 'Baguhin';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Load failed';
  @override
  String get original => 'Pinagmulan';
  @override
  String get preview => 'Silipin';
  @override
  String get select => 'Piliin';
  @override
  String get emptyList => 'Walang lamang listahan';
  @override
  String get unSupportedAssetType => 'Hindi suportadong file type.';
  @override
  String get unableToAccessAll => 'Hindi ma-access ang lahat ng mga file sa device';
  @override
  String get viewingLimitedAssetsTip => 'Makikita lamang ang mga file at mga album na accessible sa app';
  @override
  String get changeAccessibleLimitedAssets => 'I-click para i-update ang accessible na mga file';
  @override
  String get accessAllTip =>
      'Ang app na ito ay kaya lamang mag-access ng iilang mga file sa device. Magtungo sa system settings at i-allow ang app para ma-access ang lahat ng media sa device.';
  @override
  String get goToSystemSettings => 'Magpunta sa system settings';
  @override
  String get accessLimitedAssets => 'Ituloy nang limitadong access';
  @override
  String get accessiblePathName => 'Accessible na mga file';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Image';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Iba pang media';
  @override
  String get sActionPlayHint => 'play';
  @override
  String get sActionPreviewHint => 'silipin';
  @override
  String get sActionSelectHint => 'piliin';
  @override
  String get sActionSwitchPathLabel => 'baguhin ang lokasyon';
  @override
  String get sActionUseCameraHint => 'gamiting ang camera';
  @override
  String get sNameDurationLabel => 'duration';
  @override
  String get sUnitAssetCountLabel => 'count';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxFilPh extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveFilPh extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Mga Paborito';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionFilPh extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pagpipilian';
  @override
  String files({required Object files}) => 'Mga File: ${files}';
  @override
  String size({required Object size}) => 'Size: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerFilPh extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

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
class _TranslationsSendTabSendModesFilPh extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Isang tatanggap';
  @override
  String get multiple => 'Maramihang tatanggap';
  @override
  String get link => 'I-share gamit ang link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralFilPh extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsFilPh brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsFilPh._(_root);
  @override
  String get color => 'Kulay';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsFilPh colorOptions = _TranslationsSettingsTabGeneralColorOptionsFilPh._(_root);
  @override
  String get language => 'Wika';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsFilPh languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsFilPh._(_root);
  @override
  String get saveWindowPlacement => 'Quit: I-save ang window placement';
  @override
  String get saveWindowPlacementWindows => 'I-save ang posisyon ng window pagkasara';
  @override
  String get minimizeToTray => 'Quit: Paliitin sa Tray/Menu Bar';
  @override
  String get launchAtStartup => 'I-autostart pagkatapos mag-login';
  @override
  String get launchMinimized => 'Autostart: I-start nang nakatago';
  @override
  String get showInContextMenu => 'Ipakita ang LocalSend sa context menu';
  @override
  String get animations => 'Animations';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveFilPh extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tumanggap';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Auto Finish';
  @override
  String get destination => 'Patutunguhan';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'I-save ang media sa gallery';
  @override
  String get saveToHistory => 'I-save sa history';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendFilPh extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ipasa';
  @override
  String get shareViaLinkAutoAccept => 'Kusang tanggapin ang request sa "Share via link" mode';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkFilPh extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Network';
  @override
  String get needRestart => 'I-restart ang server para ma-apply ang settings!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Device type';
  @override
  String get deviceModel => 'Device model';
  @override
  String get port => 'Port';
  @override
  String get network => 'Network';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsFilPh networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsFilPh._(_root);
  @override
  String get discoveryTimeout => 'Nag Timeout ang Discovery';
  @override
  String get useSystemName => 'Gamitin ang pangalan ng system';
  @override
  String get generateRandomAlias => 'Mag-generate ng random na alias';
  @override
  String portWarning({required Object defaultPort}) =>
      'Maaaring hindi ka ma-detect ng ibang devices dahil ikaw ay gumagamit ng ibang port. (default: ${defaultPort})';
  @override
  String get encryption => 'Encryption';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Maaaring hindi ka ma-detect ng ibang devices dahil ikaw ay gumagamit ng ibang multicast address. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherFilPh extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Iba Pa';
  @override
  String get support => 'Suportahan ang LocalSend';
  @override
  String get donate => 'Mag-donate';
  @override
  String get privacyPolicy => 'Patakaran sa Privacy';
  @override
  String get termsOfUse => 'Mga Tuntunin sa Paggamit';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallFilPh extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Ang app na ito ay nakakapagpadala ng mga file sa ibang mga device ngunit ang ibang mga device ay hindi makapagpadala sa device na ito.';
  @override
  String solution({required Object port}) =>
      'Ito ay kadalasang isyu sa firewall. Maaari mong maayos ito sa pamamagitan nang pag-allow ng mga incoming connections (UDP at TCP) sa port ${port}.';
  @override
  String get openFirewallSettings => 'Buksan ang Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryFilPh extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ang device na\'to ay hindi maka-discover ng ibang devices.';
  @override
  String get solution =>
      'Siguraduhing lahat ng device ay nasa same WI-FI network at i-share ang parehong configuration (port, multicast address, encryption). Pwedeng i-type manually ang IP address ng target device. Kung gumana, i-consider na i-dagdag ang device sa favorites upang automatic na ma discover sa susunod na paggamit.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionFilPh extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ang dalawa o higit pang device ay hindi ma-discover ang isa\'t isa o hindi makapag-share ng mga file.';
  @override
  String get solution =>
      'Ang problema ay nangyayari sa dalawang device? Mangyaring siguraduhin na ang dalawang device ay nasa parehas na wifi network at mayroong parehas na configuration (port, multicast address, encryption). Maaaring ang wifi ay hindi pinahihintulutan and komunikasyon sa pagitan nang mga participants. Sa ganitong pangyayari, ang option na ito ay dapat i-enable sa router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsFilPh extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Buksan ang file';
  @override
  String get showInFolder => 'Buksan sa folder';
  @override
  String get info => 'Impormasyon';
  @override
  String get deleteFromHistory => 'Burahin sa history';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalFilPh extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleFilPh title = _TranslationsProgressPageTotalTitleFilPh._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Files: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Size: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Speed: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileFilPh extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Idagdag sa selection';
  @override
  String get content => 'Ano ang gusto mong idagdag?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileFilPh extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Buksan ang file';
  @override
  String get content => 'Gusto mo bang buksan ang natanggap na file?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputFilPh extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ilagay ang address';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Address';
  @override
  String get recentlyUsed => 'Recently used: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionFilPh extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kanselahin ang pagpapadala ng file';
  @override
  String get content => 'Gusto mo ba talagang kanselahin ang pagpapadala ng file?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileFilPh extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hindi mabuksan ang file';
  @override
  String content({required Object file}) => 'Hindi mabuksan ang "${file}". Ito ba ay nalipat, pinangalanan, o nabura?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeFilPh extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ang encryption ay naka-disable';
  @override
  String get content =>
      'Ang communication ngayon ay nangyayari gamit ang unencrypted HTTP protocol. Para gamitin ang HTTPS, muling i-enable ang encryption.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogFilPh extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogFilPh extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorites';
  @override
  String get noFavorites => 'Wala pang favorites sa mga device.';
  @override
  String get addFavorite => 'Magdagdag';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogFilPh extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Burahin sa favorites';
  @override
  String content({required Object name}) => 'Gusto mo ba talagang burahin ang favorites "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogFilPh extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Idagdag sa favorites';
  @override
  String get titleEdit => 'Adjust';
  @override
  String get name => 'Alias';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP Address';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoFilPh extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Impormasyon sa file';
  @override
  String get fileName => 'Pangalan ng file:';
  @override
  String get path => 'Lokasyon:';
  @override
  String get size => 'Size:';
  @override
  String get sender => 'Sender:';
  @override
  String get time => 'Time:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputFilPh extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ilagay ang pangalan ng file';
  @override
  String original({required Object original}) => 'Orihinal: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogFilPh extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Burahin ang history';
  @override
  String get content => 'Gusto mo ba talagang burahin ang buong history?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedFilPh extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Hindi makikita ng LocalSend ang ibang devices hangga\'t hindi nabibigyan ng permission para mag-scan sa lokal na network. Mangyaring bigyan ito ng permission sa settings.';
  @override
  String get gotoSettings => 'Settings';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputFilPh extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'I-type ang message';
  @override
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesFilPh extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Walang file na pinli';
  @override
  String get content => 'Mangyaring pumili nang kahit isang file.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionFilPh extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Walang permission';
  @override
  String get content => 'Hindi nabigyan ng mga kinakailangang permissions. Mangyaring bigyan ito ng permission sa settings.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformFilPh extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hindi available';
  @override
  String get content => 'Ang feature na ito ay available lamang sa:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrFilPh extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsFilPh extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

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
  String get sortBeforeCount => 'Pagsunud-sunurin ayon sa alpabeto';
  @override
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeFilPh extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Ang mga file request ay awtomatikong tinatanggap. Mabatid lamang na ang lahat ng nasa lokal na network ay maaaring magpadala sa iyo ng mga file.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeFilPh extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Ang mga file request ngayon ay awtomatikong tinatanggap sa mga device sa iyong listahan ng mga paborito.',
    'Babala: Ito ay kasalukuyang hindi ganap na secure dahil ang isang hacker na alam ang fingerprint ng iyong mga paboritong device ay maaari pa ring magpadala sa iyo ng mga file.',
    'Gayunpaman, ang opsyon na ito ay mas secure kaysa sa pag-allow sa anumang device.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinFilPh extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ilagay ang PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpFilPh extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send modes';
  @override
  String get single => 'Magpadala ng mga file sa iisang recipient o tatanggap. Ang mga pagpipilian ay maaalis pagkatapos ipadala ang file.';
  @override
  String get multiple => 'Magpadala ng mga file sa maraming recipient o tatanggap. Ang mga pagpipilian ay hindi maaalis.';
  @override
  String get link =>
      'Ang mga recipient o tatanggap na walang nakainstall na LocalSend ay maaaring mag download nang mga napiling file sa pamamagitan ng pagbukas ng link sa kanilang browser.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomFilPh extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsFilPh extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get dark => 'Madilim';
  @override
  String get light => 'Maliwanag';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsFilPh extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsFilPh extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsFilPh extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Lahat';
  @override
  String get filtered => 'Na-filter';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleFilPh extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleFilPh._(TranslationsFilPh root) : this._root = root, super.internal(root);

  final TranslationsFilPh _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Kabuuang progreso (${time})';
  @override
  String get finishedError => 'Natapos nang may error';
  @override
  String get canceledSender => 'Kinansela ng sender';
  @override
  String get canceledReceiver => 'Kinansela ng receiver';
}
