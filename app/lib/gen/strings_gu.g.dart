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
class TranslationsGu extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.gu,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <gu>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsGu _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Gujarati';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralGu general = _TranslationsGeneralGu._(_root);
  @override
  late final _TranslationsReceiveTabGu receiveTab = _TranslationsReceiveTabGu._(_root);
  @override
  late final _TranslationsSendTabGu sendTab = _TranslationsSendTabGu._(_root);
  @override
  late final _TranslationsSettingsTabGu settingsTab = _TranslationsSettingsTabGu._(_root);
  @override
  late final _TranslationsTroubleshootPageGu troubleshootPage = _TranslationsTroubleshootPageGu._(_root);
  @override
  late final _TranslationsReceiveHistoryPageGu receiveHistoryPage = _TranslationsReceiveHistoryPageGu._(_root);
  @override
  late final _TranslationsApkPickerPageGu apkPickerPage = _TranslationsApkPickerPageGu._(_root);
  @override
  late final _TranslationsSelectedFilesPageGu selectedFilesPage = _TranslationsSelectedFilesPageGu._(_root);
  @override
  late final _TranslationsReceivePageGu receivePage = _TranslationsReceivePageGu._(_root);
  @override
  late final _TranslationsReceiveOptionsPageGu receiveOptionsPage = _TranslationsReceiveOptionsPageGu._(_root);
  @override
  late final _TranslationsSendPageGu sendPage = _TranslationsSendPageGu._(_root);
  @override
  late final _TranslationsProgressPageGu progressPage = _TranslationsProgressPageGu._(_root);
  @override
  late final _TranslationsWebSharePageGu webSharePage = _TranslationsWebSharePageGu._(_root);
  @override
  late final _TranslationsAboutPageGu aboutPage = _TranslationsAboutPageGu._(_root);
  @override
  late final _TranslationsDonationPageGu donationPage = _TranslationsDonationPageGu._(_root);
  @override
  late final _TranslationsChangelogPageGu changelogPage = _TranslationsChangelogPageGu._(_root);
  @override
  late final _TranslationsAliasGeneratorGu aliasGenerator = _TranslationsAliasGeneratorGu._(_root);
  @override
  late final _TranslationsDialogsGu dialogs = _TranslationsDialogsGu._(_root);
  @override
  late final _TranslationsSanitizationGu sanitization = _TranslationsSanitizationGu._(_root);
  @override
  late final _TranslationsTrayGu tray = _TranslationsTrayGu._(_root);
  @override
  late final _TranslationsWebGu web = _TranslationsWebGu._(_root);
  @override
  late final _TranslationsAssetPickerGu assetPicker = _TranslationsAssetPickerGu._(_root);
}

// Path: general
class _TranslationsGeneralGu extends TranslationsGeneralEn {
  _TranslationsGeneralGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'સ્વીકારો';
  @override
  String get accepted => 'સ્વીકાર્યો';
  @override
  String get add => 'ઉમેરો';
  @override
  String get advanced => 'અદ્યતન';
  @override
  String get cancel => 'રદ કરો';
  @override
  String get close => 'બંધ કરો';
  @override
  String get confirm => 'પુષ્ટિ કરો';
  @override
  String get continueStr => 'ચાલુ રાખો';
  @override
  String get copy => 'કૉપિ કરો';
  @override
  String get copiedToClipboard => 'ક્લિપબોર્ડ પર કૉપિ થયું';
  @override
  String get decline => 'અસ્વીકારો';
  @override
  String get done => 'પૂર્ણ';
  @override
  String get delete => 'કાઢી નાખો';
  @override
  String get edit => 'ફેરફાર કરો';
  @override
  String get error => 'ભૂલ';
  @override
  String get example => 'ઉદાહરણ';
  @override
  String get files => 'ફાઇલો';
  @override
  String get finished => 'સમાપ્ત';
  @override
  String get hide => 'છૂપાવો';
  @override
  String get off => 'બંધ';
  @override
  String get offline => 'ઓફલાઇન';
  @override
  String get on => 'ચાલુ';
  @override
  String get online => 'ઓનલાઇન';
  @override
  String get open => 'ખોલો';
  @override
  String get queue => 'કતાર';
  @override
  String get quickSave => 'ઝડપથી સેવ કરો';
  @override
  String get renamed => 'નામ બદલ્યું';
  @override
  String get reset => 'રીસેટ કરો';
  @override
  String get restart => 'ફરીથી શરૂ કરો';
  @override
  String get settings => 'સેટિંગ્સ';
  @override
  String get skipped => 'છોડી દીધું';
  @override
  String get start => 'શરૂ કરો';
  @override
  String get stop => 'બંધ કરો';
  @override
  String get save => 'સેવ કરો';
  @override
  String get unchanged => 'બદલાયું નથી';
  @override
  String get unknown => 'અજ્ઞાત';
  @override
  String get noItemInClipboard => 'ક્લિપબોર્ડમાં કોઈ વસ્તુ નથી';
}

// Path: receiveTab
class _TranslationsReceiveTabGu extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પ્રાપ્ત કરો';
  @override
  late final _TranslationsReceiveTabInfoBoxGu infoBox = _TranslationsReceiveTabInfoBoxGu._(_root);
}

// Path: sendTab
class _TranslationsSendTabGu extends TranslationsSendTabEn {
  _TranslationsSendTabGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મોકલો';
  @override
  late final _TranslationsSendTabSelectionGu selection = _TranslationsSendTabSelectionGu._(_root);
  @override
  late final _TranslationsSendTabPickerGu picker = _TranslationsSendTabPickerGu._(_root);
  @override
  String get shareIntentInfo => 'તમારા મોબાઇલ ડિવાઇસના "શેર" ફીચરને પણ વાપરીને ફાઇલોને વધુ સરળતાથી પસંદ કરી શકો છો.';
  @override
  String get nearbyDevices => 'નજીકના ઉપકરણો';
  @override
  String get thisDevice => 'આ ઉપકરણ';
  @override
  String get scan => 'ઉપકરણો શોધો';
  @override
  String get sendMode => 'મોડ મોકલો';
  @override
  late final _TranslationsSendTabSendModesGu sendModes = _TranslationsSendTabSendModesGu._(_root);
  @override
  String get sendModeHelp => 'સમજાણ';
  @override
  String get help => 'મહેરબાની કરીને ખાતરી કરો કે ઇચ્છિત લક્ષ્ય પણ તે જ Wi-Fi નેટવર્ક પર છે.';
  @override
  String get placeItems => 'શેર કરવા માટે વસ્તુઓ મૂકો.';
}

// Path: settingsTab
class _TranslationsSettingsTabGu extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સેટિંગ્સ';
  @override
  late final _TranslationsSettingsTabGeneralGu general = _TranslationsSettingsTabGeneralGu._(_root);
  @override
  late final _TranslationsSettingsTabReceiveGu receive = _TranslationsSettingsTabReceiveGu._(_root);
  @override
  late final _TranslationsSettingsTabSendGu send = _TranslationsSettingsTabSendGu._(_root);
  @override
  late final _TranslationsSettingsTabNetworkGu network = _TranslationsSettingsTabNetworkGu._(_root);
  @override
  late final _TranslationsSettingsTabOtherGu other = _TranslationsSettingsTabOtherGu._(_root);
  @override
  String get advancedSettings => 'અદ્યતન સેટિંગ્સ';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageGu extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ટ્રબલશૂટ';
  @override
  String get subTitle => 'એપ્લિકેશન અપેક્ષિત રીતે કાર્ય કરતી નથી? અહીં તમે કેટલાક સામાન્ય ઉકેલો મેળવી શકો છો.';
  @override
  String get solution => 'ઉકેલ:';
  @override
  String get fixButton => 'સ્વયંચાલિત રીતે ઉકેલો';
  @override
  late final _TranslationsTroubleshootPageFirewallGu firewall = _TranslationsTroubleshootPageFirewallGu._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionGu noConnection = _TranslationsTroubleshootPageNoConnectionGu._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageGu extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઇતિહાસ';
  @override
  String get openFolder => 'ફોલ્ડર ખોલો';
  @override
  String get deleteHistory => 'ઇતિહાસ ડિલીટ કરો';
  @override
  String get empty => 'ઇતિહાસ ખાલી છે.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsGu entryActions = _TranslationsReceiveHistoryPageEntryActionsGu._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageGu extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'એપ્સ (APK)';
  @override
  String get excludeSystemApps => 'સિસ્ટમ એપ્સનો સમાવેશ ન કરો';
  @override
  String get excludeAppsWithoutLaunchIntent => 'લૉન્ચ નહીં કરી શકાય તેવા એપ્સનો સમાવેશ ન કરો';
  @override
  String apps({required Object n}) => '${n} એપ્સ';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageGu extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'બધા ડિલીટ કરો';
}

// Path: receivePage
class _TranslationsReceivePageGu extends TranslationsReceivePageEn {
  _TranslationsReceivePageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gu'))(n, one: 'તમે ફાઇલ મોકલવા માંગે છે', other: 'તમે ${n} ફાઇલો મોકલવા માંગે છે');
  @override
  String get subTitleMessage => 'તમે સંદેશો મોકલ્યો:';
  @override
  String get subTitleLink => 'તમે લિંક મોકલી:';
  @override
  String get canceled => 'પ્રેષક એ વિનંતી રદ કરી છે.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageGu extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'વિકલ્પો';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(લોકલસેન્ડ ફોલ્ડર)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'સ્વયંચાલિત રીતે બંધ કરી દેવામાં આવ્યું છે કારણ કે ડિરેક્ટરીઓ છે.';
}

// Path: sendPage
class _TranslationsSendPageGu extends TranslationsSendPageEn {
  _TranslationsSendPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'પ્રતિસાદની રાહ જોવામાં આવી રહી છે...';
  @override
  String get rejected => 'પ્રાપ્તકર્તાએ વિનંતી અસ્વીકાર કરી છે.';
  @override
  String get busy => 'પ્રાપ્તકર્તા બીજી વિનંતી સાથે વ્યસ્ત છે.';
}

// Path: progressPage
class _TranslationsProgressPageGu extends TranslationsProgressPageEn {
  _TranslationsProgressPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ફાઈલો મોકલી રહ્યા છે';
  @override
  String get titleReceiving => 'ફાઈલો મેળવી રહ્યા છે';
  @override
  String get savedToGallery => 'ફોટોઝ માં સાચવ્યું';
  @override
  late final _TranslationsProgressPageTotalGu total = _TranslationsProgressPageTotalGu._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageGu extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'લિંક દ્વારા શેર કરો';
  @override
  String get loading => 'સર્વર શરૂ કરી રહ્યો છે...';
  @override
  String get stopping => 'સર્વર બંધ કરી રહ્યો છે...';
  @override
  String get error => 'સર્વર શરૂ કરતી વખતે એક ભૂલ થઈ.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gu'))(
    n,
    one: 'તમારા બ્રાઉઝરમાં આ લિંક ખોલો:',
    other: 'તમારા બ્રાઉઝરમાં આમાંથી કોઈ એક લિંક ખોલો:',
  );
  @override
  String get requests => 'વિનંતિઓ';
  @override
  String get noRequests => 'હજી સુધી કોઈ વિનંતિ નથી.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'સ્વયંસંચાલિત રીતે વિનંતિઓ સ્વીકારો';
  @override
  String get encryptionHint => 'લોકલસેન્ડ એ સ્વ-સાઇન્ડ સર્ટિફિકેટનો ઉપયોગ કરે છે. તમારે તેને તમારા બ્રાઉઝરમાં સ્વીકારવું પડશે.';
  @override
  String pendingRequests({required Object n}) => 'બાકી વિનંતિઓ: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageGu extends TranslationsAboutPageEn {
  _TranslationsAboutPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'લોકલસેન્ડ વિશે';
  @override
  List<String> get description => [
    'લોકલસેન્ડ એક મફત, ઓપન-સોર્સ એપ છે જે તમને તમારા સ્થાનિક નેટવર્ક પર નજીકના ઉપકરણો સાથે સુરક્ષિત રીતે ફાઈલો અને સંદેશાઓ શેર કરવાની મંજૂરી આપે છે અને તે માટે ઈન્ટરનેટ કનેક્શનની જરૂર નથી.',
    'આ એપ એન્ડ્રોઇડ, ios, મેકઓએસ, વિન્ડોઝ અને લિનક્સ પર ઉપલબ્ધ છે. તમે તમામ ડાઉનલોડ વિકલ્પો આધિકારીક હોમપેજ પર શોધી શકો છો.',
  ];
  @override
  String get author => 'લેખક';
  @override
  String get contributors => 'યોગદાનકર્તાઓ';
  @override
  String get translators => 'અનુવાદકો';
}

// Path: donationPage
class _TranslationsDonationPageGu extends TranslationsDonationPageEn {
  _TranslationsDonationPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'દાન આપો';
  @override
  String get info => 'લોકલસેન્ડ મફત, ઓપન-સોર્સ છે અને તેમાં કોઈ જ જાહેરાતો નથી. જો તમને એપ ગમે, તો તમે દાન દ્વારા વિકાસને સપોર્ટ કરી શકો છો.';
  @override
  String donate({required Object amount}) => 'દાન આપો ${amount}';
  @override
  String get thanks => 'તમારો ખુબ ખુબ આભાર!';
  @override
  String get restore => 'ખરીદી પુનઃસ્થાપિત કરો';
}

// Path: changelogPage
class _TranslationsChangelogPageGu extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ચેન્જલોગ';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorGu extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

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
class _TranslationsDialogsGu extends TranslationsDialogsEn {
  _TranslationsDialogsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileGu addFile = _TranslationsDialogsAddFileGu._(_root);
  @override
  late final _TranslationsDialogsAddressInputGu addressInput = _TranslationsDialogsAddressInputGu._(_root);
  @override
  late final _TranslationsDialogsCancelSessionGu cancelSession = _TranslationsDialogsCancelSessionGu._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileGu cannotOpenFile = _TranslationsDialogsCannotOpenFileGu._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeGu encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeGu._(_root);
  @override
  late final _TranslationsDialogsErrorDialogGu errorDialog = _TranslationsDialogsErrorDialogGu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogGu favoriteDialog = _TranslationsDialogsFavoriteDialogGu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogGu favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogGu._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogGu favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogGu._(_root);
  @override
  late final _TranslationsDialogsFileInfoGu fileInfo = _TranslationsDialogsFileInfoGu._(_root);
  @override
  late final _TranslationsDialogsFileNameInputGu fileNameInput = _TranslationsDialogsFileNameInputGu._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogGu historyClearDialog = _TranslationsDialogsHistoryClearDialogGu._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedGu localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedGu._(_root);
  @override
  late final _TranslationsDialogsMessageInputGu messageInput = _TranslationsDialogsMessageInputGu._(_root);
  @override
  late final _TranslationsDialogsNoFilesGu noFiles = _TranslationsDialogsNoFilesGu._(_root);
  @override
  late final _TranslationsDialogsNoPermissionGu noPermission = _TranslationsDialogsNoPermissionGu._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformGu notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformGu._(_root);
  @override
  late final _TranslationsDialogsQrGu qr = _TranslationsDialogsQrGu._(_root);
  @override
  late final _TranslationsDialogsQuickActionsGu quickActions = _TranslationsDialogsQuickActionsGu._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeGu quickSaveNotice = _TranslationsDialogsQuickSaveNoticeGu._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpGu sendModeHelp = _TranslationsDialogsSendModeHelpGu._(_root);
  @override
  late final _TranslationsDialogsZoomGu zoom = _TranslationsDialogsZoomGu._(_root);
}

// Path: sanitization
class _TranslationsSanitizationGu extends TranslationsSanitizationEn {
  _TranslationsSanitizationGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ફાઈલનામ ખાલી ન હોઈ શકે';
  @override
  String get invalid => 'ફાઈલનામમાં અમાન્ય અક્ષરો છે';
}

// Path: tray
class _TranslationsTrayGu extends TranslationsTrayEn {
  _TranslationsTrayGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend બંધ કરો';
}

// Path: web
class _TranslationsWebGu extends TranslationsWebEn {
  _TranslationsWebGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get rejected => 'નકારી કાઢ્યું';
  @override
  String get files => 'ફાઈલો';
  @override
  String get fileName => 'ફાઈલનું નામ';
  @override
  String get size => 'માપ';
}

// Path: assetPicker
class _TranslationsAssetPickerGu extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'ખાતરી કરો';
  @override
  String get cancel => 'રદ કરો';
  @override
  String get edit => 'સંપાદિત કરો';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'લોડ નિષ્ફળ';
  @override
  String get original => 'મૂળ';
  @override
  String get preview => 'પૂર્વદર્શન';
  @override
  String get select => 'પસંદ કરો';
  @override
  String get emptyList => 'ખાલી યાદી';
  @override
  String get unSupportedAssetType => 'અમાન્ય ફાઈલ પ્રકાર.';
  @override
  String get unableToAccessAll => 'ડિવાઇસ પરની તમામ ફાઇલોનેઍક્સેસ કરી શકાતી નથી';
  @override
  String get viewingLimitedAssetsTip => 'એપને ઉપલબ્ધ ફાઈલો અને આલ્બમ્સ જુઓ.';
  @override
  String get changeAccessibleLimitedAssets => 'પ્રાપ્ય ફાઈલો અપડેટ કરવા માટે ક્લિક કરો';
  @override
  String get accessAllTip => 'અમુક ફાઇલો જોવા એપને પરવાનગી નથી. સેટિંગ્સમાં જઈને બધી મીડિયા ફાઇલોની પરવાનગી આપો.';
  @override
  String get goToSystemSettings => 'સિસ્ટમ સેટિંગ્સ પર જાઓ';
  @override
  String get accessLimitedAssets => 'મર્યાદિત ઍક્સેસ સાથે ચાલુ રાખો';
  @override
  String get accessiblePathName => 'પ્રાપ્ય ફાઈલો';
  @override
  String get sTypeAudioLabel => 'ઑડિઓ';
  @override
  String get sTypeImageLabel => 'છબી';
  @override
  String get sTypeVideoLabel => 'વિડિયો';
  @override
  String get sTypeOtherLabel => 'અન્ય મીડિયા';
  @override
  String get sActionPlayHint => 'વગાડો';
  @override
  String get sActionPreviewHint => 'પૂર્વદર્શન';
  @override
  String get sActionSelectHint => 'પસંદ કરો';
  @override
  String get sActionSwitchPathLabel => 'માર્ગ બદલો';
  @override
  String get sActionUseCameraHint => 'કૅમેરા વાપરો';
  @override
  String get sNameDurationLabel => 'અવધિ';
  @override
  String get sUnitAssetCountLabel => 'ગણતરી';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxGu extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'પોર્ટ:';
  @override
  String get alias => 'ડિવાઇસનું નામ:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionGu extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પસંદગી';
  @override
  String files({required Object files}) => 'ફાઇલો: ${files}';
  @override
  String size({required Object size}) => 'કદ: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerGu extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ફાઇલ';
  @override
  String get folder => 'ફોલ્ડર';
  @override
  String get media => 'મીડિયા';
  @override
  String get text => 'ટેક્સ્ટ';
  @override
  String get app => 'એપ';
  @override
  String get clipboard => 'પેસ્ટ કરો';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesGu extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'એકમાત્ર પ્રાપ્તકર્તા';
  @override
  String get multiple => 'એકથી વધારે પ્રાપ્તકર્તાઓ';
  @override
  String get link => 'લિંક દ્વારા શેર કરો';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralGu extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સામાન્ય';
  @override
  String get brightness => 'વિષય';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsGu brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsGu._(_root);
  @override
  String get color => 'રંગ';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsGu colorOptions = _TranslationsSettingsTabGeneralColorOptionsGu._(_root);
  @override
  String get language => 'ભાષા';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsGu languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsGu._(_root);
  @override
  String get saveWindowPlacement => 'બંધ કરો: વિન્ડો પ્લેસમેન્ટ સેવ કરો';
  @override
  String get minimizeToTray => 'બંધ કરો: ટ્રે/મેનુ બારમાં મિનિમાઇઝ';
  @override
  String get launchAtStartup => 'લૉગિન પછી સ્વયંચાલિત શરૂઆત';
  @override
  String get launchMinimized => 'સ્વયંચાલિત શરૂઆત: છુપાવેલી સ્થિતિમાં શરૂ કરો';
  @override
  String get animations => 'એનિમેશન';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveGu extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સ્વીકારો';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get autoFinish => 'સ્વયંચાલિત પૂરણ';
  @override
  String get destination => 'સ્થળ';
  @override
  String get downloads => '(ડાઉનલોડ્સ)';
  @override
  String get saveToGallery => 'મીડિયા ગેલેરીમાં સેવ કરો';
  @override
  String get saveToHistory => 'ઇતિહાસમાં સેવ કરો';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendGu extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મોકલો';
  @override
  String get shareViaLinkAutoAccept => 'લિંક દ્વારા શેર કરો: સ્વયંચાલિત સ્વીકારો';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkGu extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'નેટવર્ક';
  @override
  String get needRestart => 'સેટિંગ્સ લાગુ કરવા સર્વરને પુનઃપ્રારંભ કરો!';
  @override
  String get server => 'સર્વર';
  @override
  String get alias => 'ડિવાઇસ નામ';
  @override
  String get deviceType => 'ડિવાઇસ પ્રકાર';
  @override
  String get deviceModel => 'ડિવાઇસ મોડલ';
  @override
  String get port => 'પોર્ટ';
  @override
  String get discoveryTimeout => 'ડિસ્કવરી ટાઈમઆઉટ';
  @override
  String portWarning({required Object defaultPort}) =>
      'તમે કસ્ટમ પોર્ટનો ઉપયોગ કરી રહ્યા છો તેથી તમે અન્ય ડિવાઇસ દ્વારા શોધી શકાય નહીં. (મૂળભૂત: ${defaultPort})';
  @override
  String get encryption => 'એન્ક્રિપ્શન';
  @override
  String get multicastGroup => 'મલ્ટીકાસ્ટ';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'તમે કસ્ટમ મલ્ટીકાસ્ટ સરનામાનો ઉપયોગ કરી રહ્યા છો તેથી તમે અન્ય ડિવાઇસ દ્વારા શોધી શકાય નહીં. (મૂળભૂત: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherGu extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'અન્ય';
  @override
  String get support => 'લોકલસેન્ડને સપોર્ટ કરો';
  @override
  String get donate => 'દાન આપો';
  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';
  @override
  String get termsOfUse => 'વાપરવા માટેની શરતો';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallGu extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'આ એપ્લિકેશન અન્ય ડિવાઇસને ફાઈલો મોકલી શકે છે; પરંતુ અન્ય ડિવાઇસ આ ડિવાઇસને ફાઈલો મોકલી શકતા નથી.';
  @override
  String solution({required Object port}) =>
      'આ મોટાભાગે ફાયરવોલનો પ્રશ્ન છે. તમે ${port} પોર્ટ પર આવનારી કનેક્શન્સ (UDP અને TCP) ને મંજૂરી આપીને આ ઉકેલી શકો છો.';
  @override
  String get openFirewallSettings => 'ફાયરવોલ ખોલો';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionGu extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'બંને ડિવાઇસ એકબીજાને શોધી શકતા નથી કે ફાઈલો શેર કરી શકતા નથી.';
  @override
  String get solution =>
      'શું સમસ્યા બંને બાજુ છે? જો આવું હોય, તો તમને ખાતરી કરવી જોઈએ કે બંને ડિવાઇસ એ જ Wi-Fi નેટવર્ક પર છે અને એ જ રૂપરેખા (પોર્ટ, મલ્ટીકાસ્ટ સરનામું, એન્ક્રિપ્શન) શેર કરે છે. નેટવર્ક ભાગ લેનારા વચ્ચે સંવાદિતા મંજૂરી ન આપી શકે. આ કિસ્સામાં, આ વિકલ્પને રાઉટરમાં સક્રિય કરવો પડશે.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsGu extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ફાઇલ ખોલો';
  @override
  String get info => 'માહિતી';
  @override
  String get deleteFromHistory => 'ઇતિહાસમાંથી ડિલીટ કરો';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalGu extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleGu title = _TranslationsProgressPageTotalTitleGu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ફાઈલો: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'કદ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'ગતિ: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileGu extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પસંદગીમાં ઉમેરો';
  @override
  String get content => 'તમે શું ઉમેરવા માંગો છો?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputGu extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સરનામું દાખલ કરો';
  @override
  String get hashtag => 'હૅશટૅગ';
  @override
  String get ip => 'IP સરનામું';
  @override
  String get recentlyUsed => 'હાલમાં ઉપયોગમાં લીધેલું: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionGu extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ ટ્રાન્સફર રદ કરો';
  @override
  String get content => 'શું તમે ખરેખર ફાઇલ ટ્રાન્સફર રદ કરવા માંગો છો?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileGu extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ ખોલી શકતા નથી';
  @override
  String content({required Object file}) => '"${file}" ખોલી શક્યા નહીં. શું આ ફાઇલ ખસેડવામાં આવી છે, નામ બદલવામાં આવ્યું છે કે દૂર કરવામાં આવી છે?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeGu extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'એન્ક્રિપ્શન નિષ્ક્રિય';
  @override
  String get content => 'આંકડાશાસ્ત્ર હવે કોડ ન કરાયેલા HTTP પ્રોટોકોલ દ્વારા થાય છે. HTTPS નો ઉપયોગ કરવા માટે, ફરીથી એન્ક્રિપ્શન સક્રિય કરો.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogGu extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogGu extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મનપસંદ';
  @override
  String get noFavorites => 'હજી સુધી કોઈ મનપસંદ ઉપકરણ નથી.';
  @override
  String get addFavorite => 'ઉમેરો';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogGu extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મનપસંદમાંથી કાઢો';
  @override
  String content({required Object name}) => 'શું તમે ખરેખર "${name}" ને મનપસંદમાંથી કાઢવા માંગો છો?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogGu extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'મનપસંદમાં ઉમેરો';
  @override
  String get titleEdit => 'સેટિંગ્સ';
  @override
  String get name => 'ઉપકરણનું નામ';
  @override
  String get auto => '(આપમેળે)';
  @override
  String get ip => 'IP સરનામું';
  @override
  String get port => 'પોર્ટ';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoGu extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ માહિતી';
  @override
  String get fileName => 'ફાઇલનું નામ:';
  @override
  String get path => 'માર્ગ:';
  @override
  String get size => 'કદ:';
  @override
  String get sender => 'મોકલનાર:';
  @override
  String get time => 'સમય:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputGu extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલનું નામ દાખલ કરો';
  @override
  String original({required Object original}) => 'મૂળ: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogGu extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઈતિહાસ સાફ કરો';
  @override
  String get content => 'શું તમે ખરેખર સંપૂર્ણ ઈતિહાસ કાઢવા માંગો છો?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedGu extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'લોકલસેન્ડને સ્થાનિક નેટવર્ક સ્કેન કરવાની પરવાનગી વિના અન્ય ઉપકરણો શોધી શકતા નથી. કૃપા કરીને સેટિંગ્સમાં આ પરવાનગી આપો.';
  @override
  String get gotoSettings => 'સેટિંગ્સ';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputGu extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સંદેશ લખો';
  @override
  String get multiline => 'મલ્ટિલાઇન';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesGu extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'કોઈ ફાઇલ પસંદ કરેલી નથી';
  @override
  String get content => 'કૃપા કરીને ઓછામાં ઓછી એક ફાઇલ પસંદ કરો.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionGu extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પરવાનગી નથી';
  @override
  String get content => 'તમે જરૂરી પરવાનગીઓ આપી નથી. કૃપા કરીને સેટિંગ્સમાં તે આપો.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformGu extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઉપલબ્ધ નથી';
  @override
  String get content => 'આ સુવિધા ફક્ત આ પર ઉપલબ્ધ છે:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrGu extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR કોડ';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsGu extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઝડપી કાર્યવાહી';
  @override
  String get counter => 'કાઉન્ટર';
  @override
  String get prefix => 'પ્રેફિક્સ';
  @override
  String get padZero => 'શૂન્ય સાથે ભરવો';
  @override
  String get sortBeforeCount => 'ગણતરી પહેલાં આલ્ફાબેટિક ક્રમમાં ગોઠવો';
  @override
  String get random => 'રેન્ડમ';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeGu extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ફાઈલ વિનંતીઓ આપમેળે સ્વીકારવામાં આવે છે. ધ્યાન રાખો કે સ્થાનિક નેટવર્ક પરના દરેક વ્યક્તિ તમને ફાઈલો મોકલી શકે છે.';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpGu extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મોડ મોકલો';
  @override
  String get single => 'ફાઈલોને એક પ્રાપ્તકર્તાને મોકલવામાં આવે છે. ફાઈલ ટ્રાન્સફર પૂરી થયા પછી પસંદગી સાફ કરવામાં આવશે.';
  @override
  String get multiple => 'ફાઈલોને ઘણા પ્રાપ્તકર્તાઓને મોકલવામાં આવે છે. પસંદગી સાફ કરવામાં આવશે નહીં.';
  @override
  String get link => 'જે પ્રાપ્તકર્તાઓ પાસે LocalSend સ્થાપિત નથી તેઓ તેમના બ્રાઉઝરમાં લિંક ખોલીને પસંદ કરેલી ફાઈલો ડાઉનલોડ કરી શકે છે.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomGu extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsGu extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'સિસ્ટમ';
  @override
  String get dark => 'ડાર્ક';
  @override
  String get light => 'લાઇટ';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsGu extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'સિસ્ટમ';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsGu extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'સિસ્ટમ';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleGu extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleGu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'કુલ પ્રગતિ (${time})';
  @override
  String get finishedError => 'ભૂલ સાથે પૂર્ણ થયું';
  @override
  String get canceledSender => 'મોકલનાર દ્વારા રદ કરવામાં આવ્યું';
  @override
  String get canceledReceiver => 'પ્રાપ્તકર્તા દ્વારા રદ કરવામાં આવ્યું';
}
