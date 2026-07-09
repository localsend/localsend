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
class TranslationsGu extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGu({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsGu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'અંગ્રેજી';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$gu general = _Translations$general$gu._(_root);
  @override
  late final _Translations$receiveTab$gu receiveTab = _Translations$receiveTab$gu._(_root);
  @override
  late final _Translations$sendTab$gu sendTab = _Translations$sendTab$gu._(_root);
  @override
  late final _Translations$settingsTab$gu settingsTab = _Translations$settingsTab$gu._(_root);
  @override
  late final _Translations$troubleshootPage$gu troubleshootPage = _Translations$troubleshootPage$gu._(_root);
  @override
  late final _Translations$receiveHistoryPage$gu receiveHistoryPage = _Translations$receiveHistoryPage$gu._(_root);
  @override
  late final _Translations$apkPickerPage$gu apkPickerPage = _Translations$apkPickerPage$gu._(_root);
  @override
  late final _Translations$selectedFilesPage$gu selectedFilesPage = _Translations$selectedFilesPage$gu._(_root);
  @override
  late final _Translations$receivePage$gu receivePage = _Translations$receivePage$gu._(_root);
  @override
  late final _Translations$receiveOptionsPage$gu receiveOptionsPage = _Translations$receiveOptionsPage$gu._(_root);
  @override
  late final _Translations$sendPage$gu sendPage = _Translations$sendPage$gu._(_root);
  @override
  late final _Translations$progressPage$gu progressPage = _Translations$progressPage$gu._(_root);
  @override
  late final _Translations$webSharePage$gu webSharePage = _Translations$webSharePage$gu._(_root);
  @override
  late final _Translations$aboutPage$gu aboutPage = _Translations$aboutPage$gu._(_root);
  @override
  late final _Translations$donationPage$gu donationPage = _Translations$donationPage$gu._(_root);
  @override
  late final _Translations$changelogPage$gu changelogPage = _Translations$changelogPage$gu._(_root);
  @override
  late final _Translations$aliasGenerator$gu aliasGenerator = _Translations$aliasGenerator$gu._(_root);
  @override
  late final _Translations$dialogs$gu dialogs = _Translations$dialogs$gu._(_root);
  @override
  late final _Translations$sanitization$gu sanitization = _Translations$sanitization$gu._(_root);
  @override
  late final _Translations$tray$gu tray = _Translations$tray$gu._(_root);
  @override
  late final _Translations$web$gu web = _Translations$web$gu._(_root);
  @override
  late final _Translations$assetPicker$gu assetPicker = _Translations$assetPicker$gu._(_root);
  @override
  late final _Translations$networkInterfacesPage$gu networkInterfacesPage = _Translations$networkInterfacesPage$gu._(_root);
}

// Path: general
class _Translations$general$gu extends Translations$general$en {
  _Translations$general$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  String get continueStr => 'આગળ વધો';
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
  @override
  String get quickSaveFromFavorites => '"મનપસંદ" માટે ક્વિક સેવ કરો';
}

// Path: receiveTab
class _Translations$receiveTab$gu extends Translations$receiveTab$en {
  _Translations$receiveTab$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પ્રાપ્ત કરો';
  @override
  late final _Translations$receiveTab$infoBox$gu infoBox = _Translations$receiveTab$infoBox$gu._(_root);
  @override
  late final _Translations$receiveTab$quickSave$gu quickSave = _Translations$receiveTab$quickSave$gu._(_root);
}

// Path: sendTab
class _Translations$sendTab$gu extends Translations$sendTab$en {
  _Translations$sendTab$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મોકલો';
  @override
  late final _Translations$sendTab$selection$gu selection = _Translations$sendTab$selection$gu._(_root);
  @override
  late final _Translations$sendTab$picker$gu picker = _Translations$sendTab$picker$gu._(_root);
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
  late final _Translations$sendTab$sendModes$gu sendModes = _Translations$sendTab$sendModes$gu._(_root);
  @override
  String get sendModeHelp => 'સમજાણ';
  @override
  String get help => 'મહેરબાની કરીને ખાતરી કરો કે ઇચ્છિત લક્ષ્ય પણ તે જ Wi-Fi નેટવર્ક પર છે.';
  @override
  String get placeItems => 'શેર કરવા માટે વસ્તુઓ મૂકો.';
  @override
  String get manualSending => 'મૈન્યુલ મોકલવું';
}

// Path: settingsTab
class _Translations$settingsTab$gu extends Translations$settingsTab$en {
  _Translations$settingsTab$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સેટિંગ્સ';
  @override
  late final _Translations$settingsTab$general$gu general = _Translations$settingsTab$general$gu._(_root);
  @override
  late final _Translations$settingsTab$receive$gu receive = _Translations$settingsTab$receive$gu._(_root);
  @override
  late final _Translations$settingsTab$send$gu send = _Translations$settingsTab$send$gu._(_root);
  @override
  late final _Translations$settingsTab$network$gu network = _Translations$settingsTab$network$gu._(_root);
  @override
  late final _Translations$settingsTab$other$gu other = _Translations$settingsTab$other$gu._(_root);
  @override
  String get advancedSettings => 'અદ્યતન સેટિંગ્સ';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$gu extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$gu firewall = _Translations$troubleshootPage$firewall$gu._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$gu noConnection = _Translations$troubleshootPage$noConnection$gu._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$gu noDiscovery = _Translations$troubleshootPage$noDiscovery$gu._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$gu extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$gu entryActions = _Translations$receiveHistoryPage$entryActions$gu._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$gu extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$gu extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'બધા ડિલીટ કરો';
}

// Path: receivePage
class _Translations$receivePage$gu extends Translations$receivePage$en {
  _Translations$receivePage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gu'))(
    n,
    one: 'તમે ફાઇલ મોકલવા માંગે છે',
    other: 'તમે ${n} ફાઇલો મોકલવા માંગે છે',
  );
  @override
  String get subTitleMessage => 'તમે સંદેશો મોકલ્યો:';
  @override
  String get subTitleLink => 'તમે લિંક મોકલી:';
  @override
  String get canceled => 'પ્રેષક એ વિનંતી રદ કરી છે.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$gu extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$gu extends Translations$sendPage$en {
  _Translations$sendPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'પ્રતિસાદની રાહ જોવામાં આવી રહી છે...';
  @override
  String get rejected => 'પ્રાપ્તકર્તાએ વિનંતી અસ્વીકાર કરી છે.';
  @override
  String get busy => 'પ્રાપ્તકર્તા બીજી વિનંતી સાથે વ્યસ્ત છે.';
  @override
  String get tooManyAttempts => '@:વેબ.બહુ_બધા_પ્રયાસ';
}

// Path: progressPage
class _Translations$progressPage$gu extends Translations$progressPage$en {
  _Translations$progressPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ફાઈલો મોકલી રહ્યા છે';
  @override
  String get titleReceiving => 'ફાઈલો મેળવી રહ્યા છે';
  @override
  String get savedToGallery => 'ફોટોઝ માં સાચવ્યું';
  @override
  late final _Translations$progressPage$total$gu total = _Translations$progressPage$total$gu._(_root);
  @override
  late final _Translations$progressPage$remainingTime$gu remainingTime = _Translations$progressPage$remainingTime$gu._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$gu extends Translations$webSharePage$en {
  _Translations$webSharePage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  @override
  String get requirePin => 'પિન જોયશે';
  @override
  String pinHint({required Object pin}) => 'પિન "${pin}" છે';
}

// Path: aboutPage
class _Translations$aboutPage$gu extends Translations$aboutPage$en {
  _Translations$aboutPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  @override
  String get packagers => 'પૅકેજકરતાં';
}

// Path: donationPage
class _Translations$donationPage$gu extends Translations$donationPage$en {
  _Translations$donationPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$gu extends Translations$changelogPage$en {
  _Translations$changelogPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ચેન્જલોગ';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$gu extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$gu extends Translations$dialogs$en {
  _Translations$dialogs$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$gu addFile = _Translations$dialogs$addFile$gu._(_root);
  @override
  late final _Translations$dialogs$addressInput$gu addressInput = _Translations$dialogs$addressInput$gu._(_root);
  @override
  late final _Translations$dialogs$cancelSession$gu cancelSession = _Translations$dialogs$cancelSession$gu._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$gu cannotOpenFile = _Translations$dialogs$cannotOpenFile$gu._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$gu encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$gu._(_root);
  @override
  late final _Translations$dialogs$errorDialog$gu errorDialog = _Translations$dialogs$errorDialog$gu._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$gu favoriteDialog = _Translations$dialogs$favoriteDialog$gu._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$gu favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$gu._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$gu favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$gu._(_root);
  @override
  late final _Translations$dialogs$fileInfo$gu fileInfo = _Translations$dialogs$fileInfo$gu._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$gu fileNameInput = _Translations$dialogs$fileNameInput$gu._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$gu historyClearDialog = _Translations$dialogs$historyClearDialog$gu._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$gu localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$gu._(_root);
  @override
  late final _Translations$dialogs$messageInput$gu messageInput = _Translations$dialogs$messageInput$gu._(_root);
  @override
  late final _Translations$dialogs$noFiles$gu noFiles = _Translations$dialogs$noFiles$gu._(_root);
  @override
  late final _Translations$dialogs$noPermission$gu noPermission = _Translations$dialogs$noPermission$gu._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$gu notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$gu._(_root);
  @override
  late final _Translations$dialogs$qr$gu qr = _Translations$dialogs$qr$gu._(_root);
  @override
  late final _Translations$dialogs$quickActions$gu quickActions = _Translations$dialogs$quickActions$gu._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$gu quickSaveNotice = _Translations$dialogs$quickSaveNotice$gu._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$gu sendModeHelp = _Translations$dialogs$sendModeHelp$gu._(_root);
  @override
  late final _Translations$dialogs$zoom$gu zoom = _Translations$dialogs$zoom$gu._(_root);
  @override
  late final _Translations$dialogs$openFile$gu openFile = _Translations$dialogs$openFile$gu._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$gu quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$gu._(_root);
  @override
  late final _Translations$dialogs$pin$gu pin = _Translations$dialogs$pin$gu._(_root);
}

// Path: sanitization
class _Translations$sanitization$gu extends Translations$sanitization$en {
  _Translations$sanitization$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ફાઈલનામ ખાલી ન હોઈ શકે';
  @override
  String get invalid => 'ફાઈલનામમાં અમાન્ય અક્ષરો છે';
}

// Path: tray
class _Translations$tray$gu extends Translations$tray$en {
  _Translations$tray$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend બંધ કરો';
  @override
  String get closeWindows => 'બહાર નિકડો';
}

// Path: web
class _Translations$web$gu extends Translations$web$en {
  _Translations$web$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  @override
  String get enterPin => 'પિન નાખો';
  @override
  String get invalidPin => 'પિન ગલત છે';
  @override
  String get tooManyAttempts => 'બહુ બધા પ્રયાસ કરી દીધા';
}

// Path: assetPicker
class _Translations$assetPicker$gu extends Translations$assetPicker$en {
  _Translations$assetPicker$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$gu extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'પ્રીવ્યૂ';
  @override
  String get whitelist => 'જોયતીસૂચી';
  @override
  String get blacklist => 'નજોયતીસૂચી';
  @override
  String get title => 'નેટવર્ક ઇન્ટરફેસ';
  @override
  String get info =>
      'ડિફૌલ્ટ રૂપે, LocalSend બધા ઉપલબ્ધ નેટવર્ક ઇન્ટરફેસ વાપરશે. તમે અહી નજોયતા નેટવર્ક ને કાઢી શકો છો. બદલાવ જોયા માટે તમને સર્વર ને ફરી ચાલુ કરવું પડસે.';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$gu extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'પોર્ટ:';
  @override
  String get alias => 'ડિવાઇસનું નામ:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$gu extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get favorites => 'મનપસંદ';
  @override
  String get off => _root.general.off;
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$gu extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$gu extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$gu extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$gu extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સામાન્ય';
  @override
  String get brightness => 'વિષય';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$gu brightnessOptions = _Translations$settingsTab$general$brightnessOptions$gu._(
    _root,
  );
  @override
  String get color => 'રંગ';
  @override
  late final _Translations$settingsTab$general$colorOptions$gu colorOptions = _Translations$settingsTab$general$colorOptions$gu._(_root);
  @override
  String get language => 'ભાષા';
  @override
  late final _Translations$settingsTab$general$languageOptions$gu languageOptions = _Translations$settingsTab$general$languageOptions$gu._(_root);
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
  @override
  String get saveWindowPlacementWindows => 'બહાર નીકળ્યા પછી વિન્ડો ની જગ્યા સાચવો';
  @override
  String get showInContextMenu => 'કૉટેક્સ્ટ મેન્યુ માં LocalSend દેખાડો';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$gu extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
}

// Path: settingsTab.send
class _Translations$settingsTab$send$gu extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મોકલો';
  @override
  String get shareViaLinkAutoAccept => 'લિંક દ્વારા શેર કરો: સ્વયંચાલિત સ્વીકારો';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$gu extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
  @override
  String get network => 'નૅટવર્ક';
  @override
  late final _Translations$settingsTab$network$networkOptions$gu networkOptions = _Translations$settingsTab$network$networkOptions$gu._(_root);
  @override
  String get useSystemName => 'સિસ્ટમ નામ વાપરો';
  @override
  String get generateRandomAlias => 'રેનડમ ઉપનામ બનાવો';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$gu extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$gu extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'આ એપ્લિકેશન અન્ય ડિવાઇસને ફાઈલો મોકલી શકે છે; પરંતુ અન્ય ડિવાઇસ આ ડિવાઇસને ફાઈલો મોકલી શકતા નથી.';
  @override
  String solution({required Object port}) =>
      'આ મોટાભાગે ફાયરવોલનો પ્રશ્ન છે. તમે ${port} પોર્ટ પર આવનારી કનેક્શન્સ (UDP અને TCP) ને મંજૂરી આપીને આ ઉકેલી શકો છો.';
  @override
  String get openFirewall => 'ફાયરવોલ ખોલો';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$gu extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'બંને ડિવાઇસ એકબીજાને શોધી શકતા નથી કે ફાઈલો શેર કરી શકતા નથી.';
  @override
  String get solution =>
      'શું સમસ્યા બંને બાજુ છે? જો આવું હોય, તો તમને ખાતરી કરવી જોઈએ કે બંને ડિવાઇસ એ જ Wi-Fi નેટવર્ક પર છે અને એ જ રૂપરેખા (પોર્ટ, મલ્ટીકાસ્ટ સરનામું, એન્ક્રિપ્શન) શેર કરે છે. નેટવર્ક ભાગ લેનારા વચ્ચે સંવાદિતા મંજૂરી ન આપી શકે. આ કિસ્સામાં, આ વિકલ્પને રાઉટરમાં સક્રિય કરવો પડશે.';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$gu extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'આ ડિવાઇસ બીજા ડિવાઇસ ને શોધી નથી શકતો.';
  @override
  String get solution =>
      'પક્કું કરો કે તમારા બધા ડિવાઇસ એજ વાઈફાઈ પર છે એંડ એજ કૉંફઈગુરેશન (પોર્ટ, મલ્ટીકાષ્ટ એડ્રેસ, એનક્રિપશન) છે. તમે જોયતા ડિવાઇસ નું આઇપી એડ્રેસ લખવનો પ્રયાસ કરી શકો છો. અગર આ કામ કયરૂ તોહ તમે આ ડિવાઇસ ને તમારા મનપસંદ માં જોડી શકો છો જેનાથી, ભવિષ્ય માં એ એની મેતે શોધી લેસે.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$gu extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ફાઇલ ખોલો';
  @override
  String get info => 'માહિતી';
  @override
  String get deleteFromHistory => 'ઇતિહાસમાંથી ડિલીટ કરો';
  @override
  String get showInFolder => 'ફોલ્ડર માં બતાવો';
}

// Path: progressPage.total
class _Translations$progressPage$total$gu extends Translations$progressPage$total$en {
  _Translations$progressPage$total$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$gu title = _Translations$progressPage$total$title$gu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ફાઈલો: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'કદ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'ગતિ: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$gu extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations

  /// નાનું કરી ને 'દિ' દિવસ માટે, 'ક' કલાક માટે અને 'મિ' મિનિટ માટે વાપરો
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}દિ ${h}ક ${m}મિ';

  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// નાનું કરી ને 'ક' કલાક માટે અને 'મિ' મિનિટ માટે વાપરો
  @override
  String hours({required Object h, required Object m}) => '${h}ક ${m}મિ';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$gu extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પસંદગીમાં ઉમેરો';
  @override
  String get content => 'તમે શું ઉમેરવા માંગો છો?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$gu extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$gu extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ ટ્રાન્સફર રદ કરો';
  @override
  String get content => 'શું તમે ખરેખર ફાઇલ ટ્રાન્સફર રદ કરવા માંગો છો?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$gu extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ ખોલી શકતા નથી';
  @override
  String content({required Object file}) => '"${file}" ખોલી શક્યા નહીં. શું આ ફાઇલ ખસેડવામાં આવી છે, નામ બદલવામાં આવ્યું છે કે દૂર કરવામાં આવી છે?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$gu extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'એન્ક્રિપ્શન નિષ્ક્રિય';
  @override
  String get content => 'આંકડાશાસ્ત્ર હવે કોડ ન કરાયેલા HTTP પ્રોટોકોલ દ્વારા થાય છે. HTTPS નો ઉપયોગ કરવા માટે, ફરીથી એન્ક્રિપ્શન સક્રિય કરો.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$gu extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$gu extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$gu extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'મનપસંદમાંથી કાઢો';
  @override
  String content({required Object name}) => 'શું તમે ખરેખર "${name}" ને મનપસંદમાંથી કાઢવા માંગો છો?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$gu extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$gu extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$gu extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલનું નામ દાખલ કરો';
  @override
  String original({required Object original}) => 'મૂળ: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$gu extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઈતિહાસ સાફ કરો';
  @override
  String get content => 'શું તમે ખરેખર સંપૂર્ણ ઈતિહાસ કાઢવા માંગો છો?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$gu extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$gu extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'સંદેશ લખો';
  @override
  String get multiline => 'મલ્ટિલાઇન';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$gu extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'કોઈ ફાઇલ પસંદ કરેલી નથી';
  @override
  String get content => 'કૃપા કરીને ઓછામાં ઓછી એક ફાઇલ પસંદ કરો.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$gu extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પરવાનગી નથી';
  @override
  String get content => 'તમે જરૂરી પરવાનગીઓ આપી નથી. કૃપા કરીને સેટિંગ્સમાં તે આપો.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$gu extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ઉપલબ્ધ નથી';
  @override
  String get content => 'આ સુવિધા ફક્ત આ પર ઉપલબ્ધ છે:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$gu extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR કોડ';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$gu extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$gu extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ફાઈલ વિનંતીઓ આપમેળે સ્વીકારવામાં આવે છે. ધ્યાન રાખો કે સ્થાનિક નેટવર્ક પરના દરેક વ્યક્તિ તમને ફાઈલો મોકલી શકે છે.';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$gu extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$gu extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$gu extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ફાઇલ ખોલો';
  @override
  String get content => 'પ્રાપ્ત થઈલી ફાઇલ ખોલવી છે?';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$gu extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'તમારા મનપસંદ સૂચી માં હોય એ ડિવાઇસ ના ફાઇલ અનુરોધ એની મેતે સ્વીકાર કરી લેશે.',
    'ચેતવણી! હમણાં, આ પૂર્ણ રૂપ થઈ સુરક્ષિત નથી, કારણ કે તમારા મનપસંદ સૂચી માંથી કોઈ ભી ડિવાઇસ નું ફિંગરપ્રિન્ટ કોઈ હેકર પાસે હસે તો એ તમને ફાઇલ બીના તમારા મંજૂરી મોકલી સકશે.',
    'જોકે, બીના મંજૂરી બધા જે લોકલ નેટવર્ક પર હોય એના પાસ થી ફાઇલ લેવા કરતા આ વિકલ્પ વધારે સુરક્ષિત છે.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$gu extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'પિન નાખો';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$gu extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$gu extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'સિસ્ટમ';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$gu extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'સિસ્ટમ';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$gu extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$gu._(TranslationsGu root) : this._root = root, super.internal(root);

  final TranslationsGu _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'બધા';
  @override
  String get filtered => 'છાણેલા';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$gu extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$gu._(TranslationsGu root) : this._root = root, super.internal(root);

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
