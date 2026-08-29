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
class TranslationsGa extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGa({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ga,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ga>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsGa _root = this; // ignore: unused_field

  @override
  TranslationsGa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGa(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ga general = _Translations$general$ga._(_root);
  @override
  late final _Translations$receiveTab$ga receiveTab = _Translations$receiveTab$ga._(_root);
  @override
  late final _Translations$sendTab$ga sendTab = _Translations$sendTab$ga._(_root);
  @override
  late final _Translations$settingsTab$ga settingsTab = _Translations$settingsTab$ga._(_root);
  @override
  late final _Translations$troubleshootPage$ga troubleshootPage = _Translations$troubleshootPage$ga._(_root);
  @override
  late final _Translations$networkInterfacesPage$ga networkInterfacesPage = _Translations$networkInterfacesPage$ga._(_root);
  @override
  late final _Translations$receiveHistoryPage$ga receiveHistoryPage = _Translations$receiveHistoryPage$ga._(_root);
  @override
  late final _Translations$apkPickerPage$ga apkPickerPage = _Translations$apkPickerPage$ga._(_root);
  @override
  late final _Translations$selectedFilesPage$ga selectedFilesPage = _Translations$selectedFilesPage$ga._(_root);
  @override
  late final _Translations$receivePage$ga receivePage = _Translations$receivePage$ga._(_root);
  @override
  late final _Translations$receiveOptionsPage$ga receiveOptionsPage = _Translations$receiveOptionsPage$ga._(_root);
  @override
  late final _Translations$sendPage$ga sendPage = _Translations$sendPage$ga._(_root);
  @override
  late final _Translations$progressPage$ga progressPage = _Translations$progressPage$ga._(_root);
  @override
  late final _Translations$webSharePage$ga webSharePage = _Translations$webSharePage$ga._(_root);
  @override
  late final _Translations$aboutPage$ga aboutPage = _Translations$aboutPage$ga._(_root);
  @override
  late final _Translations$donationPage$ga donationPage = _Translations$donationPage$ga._(_root);
  @override
  late final _Translations$changelogPage$ga changelogPage = _Translations$changelogPage$ga._(_root);
  @override
  late final _Translations$aliasGenerator$ga aliasGenerator = _Translations$aliasGenerator$ga._(_root);
  @override
  late final _Translations$dialogs$ga dialogs = _Translations$dialogs$ga._(_root);
  @override
  late final _Translations$sanitization$ga sanitization = _Translations$sanitization$ga._(_root);
  @override
  late final _Translations$tray$ga tray = _Translations$tray$ga._(_root);
  @override
  late final _Translations$web$ga web = _Translations$web$ga._(_root);
  @override
  late final _Translations$assetPicker$ga assetPicker = _Translations$assetPicker$ga._(_root);
}

// Path: general
class _Translations$general$ga extends Translations$general$en {
  _Translations$general$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Glac';
  @override
  String get accepted => 'Glactha';
  @override
  String get add => 'Cuir';
  @override
  String get advanced => 'Casta';
  @override
  String get cancel => 'Cealaigh';
  @override
  String get close => 'Dún';
  @override
  String get confirm => 'Deimhnigh';
  @override
  String get continueStr => 'Lean ar aghaidh';
  @override
  String get copy => 'Cóipeáil';
  @override
  String get copiedToClipboard => 'Cóipeáilte chuig an nGearrthaisce';
  @override
  String get decline => 'Diúltú';
  @override
  String get done => 'Déanta';
  @override
  String get delete => 'Scrios';
  @override
  String get edit => 'Cuir in Eagar';
  @override
  String get error => 'Earráid';
  @override
  String get example => 'Sampla';
  @override
  String get files => 'Comhaid';
  @override
  String get finished => 'Críochnaithe';
  @override
  String get hide => 'Folaigh';
  @override
  String get off => 'As';
  @override
  String get offline => 'As líne';
  @override
  String get on => 'Ar';
  @override
  String get online => 'Ar Líne';
  @override
  String get open => 'Oscail';
  @override
  String get queue => 'Scuaine';
  @override
  String get quickSave => 'Sábháil Thapa';
  @override
  String get quickSaveFromFavorites => 'Sábháil Tapa do "Ceanáin"';
  @override
  String get renamed => 'Athainmnithe';
  @override
  String get reset => 'Cealaigh athruithe';
  @override
  String get restart => 'Atosaigh';
  @override
  String get settings => 'Socruithe';
  @override
  String get skipped => 'Scipeáilte';
  @override
  String get start => 'Tosaigh';
  @override
  String get stop => 'Stad';
  @override
  String get save => 'Sábháil';
  @override
  String get unchanged => 'Gan athrú';
  @override
  String get unknown => 'Anaithnid';
  @override
  String get noItemInClipboard => 'Gan aon mhíreanna sa Ghearrthaisce.';
}

// Path: receiveTab
class _Translations$receiveTab$ga extends Translations$receiveTab$en {
  _Translations$receiveTab$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faigh';
  @override
  late final _Translations$receiveTab$infoBox$ga infoBox = _Translations$receiveTab$infoBox$ga._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ga quickSave = _Translations$receiveTab$quickSave$ga._(_root);
}

// Path: sendTab
class _Translations$sendTab$ga extends Translations$sendTab$en {
  _Translations$sendTab$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seol';
  @override
  late final _Translations$sendTab$selection$ga selection = _Translations$sendTab$selection$ga._(_root);
  @override
  late final _Translations$sendTab$picker$ga picker = _Translations$sendTab$picker$ga._(_root);
  @override
  String get shareIntentInfo =>
      'Is féidir leat an ghné "Comhroinn" de do ghléas soghluaiste a úsáid freisin chun comhaid a roghnú ar bhealach níos éasca.';
  @override
  String get nearbyDevices => 'Gléasanna in aice láimhe';
  @override
  String get thisDevice => 'An Gléas seo';
  @override
  String get scan => 'Cuardaigh gléasanna';
  @override
  String get manualSending => 'Seoladh de láimh';
  @override
  String get sendMode => 'Mód seolta';
  @override
  late final _Translations$sendTab$sendModes$ga sendModes = _Translations$sendTab$sendModes$ga._(_root);
  @override
  String get sendModeHelp => 'Míniú';
  @override
  String get help => 'Cinntigh le do thoil go bhfuil an sprioc atá uait ar an líonra Wi-Fi céanna freisin.';
  @override
  String get placeItems => 'Cuir míreanna le roinnt.';
}

// Path: settingsTab
class _Translations$settingsTab$ga extends Translations$settingsTab$en {
  _Translations$settingsTab$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Socruithe';
  @override
  late final _Translations$settingsTab$general$ga general = _Translations$settingsTab$general$ga._(_root);
  @override
  late final _Translations$settingsTab$receive$ga receive = _Translations$settingsTab$receive$ga._(_root);
  @override
  late final _Translations$settingsTab$send$ga send = _Translations$settingsTab$send$ga._(_root);
  @override
  late final _Translations$settingsTab$network$ga network = _Translations$settingsTab$network$ga._(_root);
  @override
  late final _Translations$settingsTab$other$ga other = _Translations$settingsTab$other$ga._(_root);
  @override
  String get advancedSettings => 'Socruithe ardleibhéil';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ga extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fabhtcheartú';
  @override
  String get subTitle =>
      'Nach bhfuil an aip ag obair mar a bhíothas ag súil leis? Anseo, is féidir leat roinnt réitigh choitianta ar fhadhbanna a fháil.';
  @override
  String get solution => 'Réiteach:';
  @override
  String get fixButton => 'Deisigh go huathoibríoch';
  @override
  late final _Translations$troubleshootPage$firewall$ga firewall = _Translations$troubleshootPage$firewall$ga._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ga noDiscovery = _Translations$troubleshootPage$noDiscovery$ga._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ga noConnection = _Translations$troubleshootPage$noConnection$ga._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ga extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Comhéadain Líonra';
  @override
  String get info =>
      'De réir réamhshocraithe, úsáideann LocalSend na comhéadain líonra go léir atá ar fáil. Is féidir leat líonraí nach dteastaíonn a eisiamh anseo. Ní mór duit an freastalaí a atosú chun na hathruithe a chur i bhfeidhm.';
  @override
  String get preview => 'Réamhamharc';
  @override
  String get whitelist => 'Liosta bán';
  @override
  String get blacklist => 'Liosta Dubh';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ga extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Stair';
  @override
  String get openFolder => 'Oscail fillteán';
  @override
  String get deleteHistory => 'Scrios stair';
  @override
  String get empty => 'Tá an stair folamh.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$ga entryActions = _Translations$receiveHistoryPage$entryActions$ga._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ga extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aipeanna (APK)';
  @override
  String get excludeSystemApps => 'Eisiamh aip chóraiss';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Eisiamh aipeanna nach féidir a sheoladh';
  @override
  String apps({required Object n}) => '${n} Aipeanna';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ga extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Scrios gach rud';
}

// Path: receivePage
class _Translations$receivePage$ga extends Translations$receivePage$en {
  _Translations$receivePage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ga'))(
    n,
    one: 'ag iarraidh comhad a sheoladh chugat',
    other: 'ag iarraidh ${n} comhad a sheoladh chugat',
  );
  @override
  String get subTitleMessage => 'teachtaireacht curtha chugat:';
  @override
  String get subTitleLink => 'sheol nasc chugat:';
  @override
  String get canceled => 'Tá an t-iarratas curtha ar ceal ag an seoltóir.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$ga extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Roghanna';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Fillteán LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Múchta go huathoibríoch mar go bhfuil fillteáin ann.';
}

// Path: sendPage
class _Translations$sendPage$ga extends Translations$sendPage$en {
  _Translations$sendPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Ag fanacht le freagra…';
  @override
  String get rejected => 'Dhiúltaigh an faighteoir don iarratas.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Tá an faighteoir gnóthach le hiarratas eile.';
}

// Path: progressPage
class _Translations$progressPage$ga extends Translations$progressPage$en {
  _Translations$progressPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Ag seoladh comhad';
  @override
  String get titleReceiving => 'Ag fáil comhad';
  @override
  String get savedToGallery => 'Sábháilte i nGrianghraif';
  @override
  late final _Translations$progressPage$total$ga total = _Translations$progressPage$total$ga._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ga extends Translations$webSharePage$en {
  _Translations$webSharePage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Comhroinn trí nasc';
  @override
  String get loading => 'Ag tosú an fhreastalaí…';
  @override
  String get stopping => 'Ag stopadh an fhreastalaí…';
  @override
  String get error => 'Tharla earráid agus an freastalaí á thosú.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ga'))(
    n,
    one: 'Oscail an nasc seo i do bhrabhsálaí:',
    other: 'Oscail ceann de na naisc seo i do bhrabhsálaí:',
  );
  @override
  String get requests => 'Iarratais';
  @override
  String get noRequests => 'Gan aon iarratais fós.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Glac le hiarratais go huathoibríoch';
  @override
  String get requirePin => 'Éiligh UAP';
  @override
  String pinHint({required Object pin}) => 'Is é an UAP ná "${pin}"';
  @override
  String get encryptionHint => 'Úsáideann LocalSend teastas féinshínithe. Ní mór duit glacadh leis i do bhrabhsálaí.';
  @override
  String pendingRequests({required Object n}) => 'Iarratais ar feitheamh: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$ga extends Translations$aboutPage$en {
  _Translations$aboutPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Maidir le LocalSend';
  @override
  List<String> get description => [
    'Is aip foinse oscailte saor in aisce é LocalSend a ligeann duit comhaid agus teachtaireachtaí a roinnt go slán le gléasanna in aice láimhe thar do líonra áitiúil gan nasc idirlín a bheith ag teastáil.',
    'Tá an aip seo ar fáil ar Android, iOS, macOS, Windows agus Linux. Is féidir leat na roghanna íoslódála go léir a fháil ar an leathanach baile oifigiúil.',
  ];
  @override
  String get author => 'Údar';
  @override
  String get contributors => 'Rannpháirtithe';
  @override
  String get packagers => 'Pacálaithe';
  @override
  String get translators => 'Aistritheoirí';
}

// Path: donationPage
class _Translations$donationPage$ga extends Translations$donationPage$en {
  _Translations$donationPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tabhair Síntiús';
  @override
  String get info =>
      'Tá LocalSend saor in aisce, foinse oscailte agus gan aon fhógraí. Más maith leat an aip, is féidir leat tacú leis an bhforbairt le síntiús.';
  @override
  String donate({required Object amount}) => 'Tabhair síntiús ${amount}';
  @override
  String get thanks => 'Go raibh míle maith agat!';
  @override
  String get restore => 'Athchóirigh an ceannachán';
}

// Path: changelogPage
class _Translations$changelogPage$ga extends Translations$changelogPage$en {
  _Translations$changelogPage$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Log Athruithe';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$ga extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Glóireach',
    'Álainn',
    'Mór',
    'Geal',
    'Glan',
    'Cliste',
    'Fionnuar',
    'Gleoite',
    'Cliste',
    'Díograiseach',
    'Fuinniúil',
    'Éifeachtach',
    'Iontach',
    'Gasta',
    'Breá',
    'Úr',
    'Maith',
    'Taibhseach',
    'Iontach',
    'Dathúil',
    'Te',
    'Cineálta',
    'Álainn',
    'Mistic',
    'Neata',
    'Deas',
    'Foighneach',
    'Deas',
    'Cumhachtach',
    'Saibhir',
    'Rúnda',
    'Cliste',
    'Soladach',
    'Speisialta',
    'Straitéiseach',
    'Láidir',
    'Slachtmhar',
    'Ciallmhar',
  ];
  @override
  List<String> get fruits => [
    'Úll',
    'Abhcáid',
    'Banana',
    'Sméar Dubh',
    'Fraochán Gorm',
    'Brocailí',
    'Cairéad',
    'Silíní',
    'Cnó Cócó',
    'Fíonchaor',
    'Líomóid',
    'Leitís',
    'Mangó',
    'Mealbhacán',
    'Beacán',
    'Oinniún',
    'Oráiste',
    'Paipéir',
    'Péitseog',
    'Piorra',
    'Anann',
    'Práta',
    'Pumpkin',
    'Sú craobh',
    'Sútha talún',
    'Tráta',
  ];

  /// I roinnt teangacha, ní mór an aidiacht a bheith sa dara háit.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$ga extends Translations$dialogs$en {
  _Translations$dialogs$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ga addFile = _Translations$dialogs$addFile$ga._(_root);
  @override
  late final _Translations$dialogs$openFile$ga openFile = _Translations$dialogs$openFile$ga._(_root);
  @override
  late final _Translations$dialogs$addressInput$ga addressInput = _Translations$dialogs$addressInput$ga._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ga cancelSession = _Translations$dialogs$cancelSession$ga._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ga cannotOpenFile = _Translations$dialogs$cannotOpenFile$ga._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ga encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ga._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ga errorDialog = _Translations$dialogs$errorDialog$ga._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ga favoriteDialog = _Translations$dialogs$favoriteDialog$ga._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ga favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ga._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ga favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ga._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ga fileInfo = _Translations$dialogs$fileInfo$ga._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ga fileNameInput = _Translations$dialogs$fileNameInput$ga._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ga historyClearDialog = _Translations$dialogs$historyClearDialog$ga._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ga localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ga._(_root);
  @override
  late final _Translations$dialogs$messageInput$ga messageInput = _Translations$dialogs$messageInput$ga._(_root);
  @override
  late final _Translations$dialogs$noFiles$ga noFiles = _Translations$dialogs$noFiles$ga._(_root);
  @override
  late final _Translations$dialogs$noPermission$ga noPermission = _Translations$dialogs$noPermission$ga._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ga notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ga._(_root);
  @override
  late final _Translations$dialogs$qr$ga qr = _Translations$dialogs$qr$ga._(_root);
  @override
  late final _Translations$dialogs$quickActions$ga quickActions = _Translations$dialogs$quickActions$ga._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ga quickSaveNotice = _Translations$dialogs$quickSaveNotice$ga._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ga quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ga._(_root);
  @override
  late final _Translations$dialogs$pin$ga pin = _Translations$dialogs$pin$ga._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ga sendModeHelp = _Translations$dialogs$sendModeHelp$ga._(_root);
  @override
  late final _Translations$dialogs$zoom$ga zoom = _Translations$dialogs$zoom$ga._(_root);
}

// Path: sanitization
class _Translations$sanitization$ga extends Translations$sanitization$en {
  _Translations$sanitization$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ní féidir ainm comhaid a fhágáil folamh';
  @override
  String get invalid => 'Tá carachtair neamhbhailí san ainm comhaid';
}

// Path: tray
class _Translations$tray$ga extends Translations$tray$en {
  _Translations$tray$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Scoir LocalSend';
  @override
  String get closeWindows => 'Scoir';
}

// Path: web
class _Translations$web$ga extends Translations$web$en {
  _Translations$web$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Iontráil UAP';
  @override
  String get invalidPin => 'UAP neamhbhailí';
  @override
  String get tooManyAttempts => 'Iarrachtaí an iomarca';
  @override
  String get rejected => 'Diúltaithe';
  @override
  String get files => 'Comhaid';
  @override
  String get fileName => 'Ainm comhaid';
  @override
  String get size => 'Méid';
}

// Path: assetPicker
class _Translations$assetPicker$ga extends Translations$assetPicker$en {
  _Translations$assetPicker$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Deimhnigh';
  @override
  String get cancel => 'Cealaigh';
  @override
  String get edit => 'Cuir in Eagar';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Theip ar an luchtú';
  @override
  String get original => 'Bunús';
  @override
  String get preview => 'Réamhamharc';
  @override
  String get select => 'Roghnaigh';
  @override
  String get emptyList => 'Liosta folamh';
  @override
  String get unSupportedAssetType => 'Cineál comhaid gan tacaíocht.';
  @override
  String get unableToAccessAll => 'Ní féidir rochtain a fháil ar gach comhad ar an ngléas';
  @override
  String get viewingLimitedAssetsTip => 'Féach ar chomhaid agus albaim amháin atá inrochtana ag an aip.';
  @override
  String get changeAccessibleLimitedAssets => 'Cliceáil chun comhaid inrochtana a nuashonrú';
  @override
  String get accessAllTip =>
      'Ní féidir leis an aip rochtain a fháil ach ar roinnt comhad ar an ngléas. Téigh chuig socruithe an chórais agus lig don aip rochtain a fháil ar na meáin go léir ar an ngléas.';
  @override
  String get goToSystemSettings => 'Téigh chuig socruithe an chórais';
  @override
  String get accessLimitedAssets => 'Lean ar aghaidh le rochtain theoranta';
  @override
  String get accessiblePathName => 'Comhaid inrochtana';
  @override
  String get sTypeAudioLabel => 'Fuaim';
  @override
  String get sTypeImageLabel => 'Íomhá';
  @override
  String get sTypeVideoLabel => 'Físeán';
  @override
  String get sTypeOtherLabel => 'Meáin eile';
  @override
  String get sActionPlayHint => 'seinn';
  @override
  String get sActionPreviewHint => 'réamhamharc';
  @override
  String get sActionSelectHint => 'roghnaigh';
  @override
  String get sActionSwitchPathLabel => 'athraigh cosán';
  @override
  String get sActionUseCameraHint => 'bain úsáid as an gceamara';
  @override
  String get sNameDurationLabel => 'fad';
  @override
  String get sUnitAssetCountLabel => 'comhaireamh';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$ga extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Ainm an ghléis:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$ga extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Ceanáin';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ga extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rogha';
  @override
  String files({required Object files}) => 'Comhaid: ${files}';
  @override
  String size({required Object size}) => 'Méid: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$ga extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Comhad';
  @override
  String get folder => 'Fillteán';
  @override
  String get media => 'Meáin';
  @override
  String get text => 'Téacs';
  @override
  String get app => 'Aip';
  @override
  String get clipboard => 'Greamaigh';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$ga extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Faighteoir aonair';
  @override
  String get multiple => 'Faighteoirí iolracha';
  @override
  String get link => 'Comhroinn trí nasc';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$ga extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ginearálta';
  @override
  String get brightness => 'Téama';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ga brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ga._(
    _root,
  );
  @override
  String get color => 'Dath';
  @override
  late final _Translations$settingsTab$general$colorOptions$ga colorOptions = _Translations$settingsTab$general$colorOptions$ga._(_root);
  @override
  String get language => 'Teanga';
  @override
  late final _Translations$settingsTab$general$languageOptions$ga languageOptions = _Translations$settingsTab$general$languageOptions$ga._(_root);
  @override
  String get saveWindowPlacement => 'Sábháil suíomh na fuinneoige tar éis scoir';
  @override
  String get saveWindowPlacementWindows => 'Sábháil suíomh na fuinneoige tar éis imeachta';
  @override
  String get minimizeToTray => 'Íoslaghdaigh go dtí an Tráidire Córais/Barra Roghchláir agus é á dhúnadh';
  @override
  String get launchAtStartup => 'Uaththosú tar éis logáil isteach';
  @override
  String get launchMinimized => 'Uaththosú: Tosaigh i bhfolach';
  @override
  String get showInContextMenu => 'Taispeáin LocalSend sa roghchlár comhthéacs';
  @override
  String get animations => 'Beochana';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$ga extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faigh';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Críochnú Uathoibríoch';
  @override
  String get destination => 'Sábháil chuig fillteán';
  @override
  String get downloads => '(Íoslódálacha)';
  @override
  String get saveToGallery => 'Sábháil meáin chuig an ngailearaí';
  @override
  String get saveToHistory => 'Sábháil chuig an stair';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$ga extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seol';
  @override
  String get shareViaLinkAutoAccept => 'Glac le hiarratais go huathoibríoch sa mhód "Comhroinn trí nasc"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ga extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Líonra';
  @override
  String get needRestart => 'Atosaigh an freastalaí chun na socruithe a chur i bhfeidhm!';
  @override
  String get server => 'Freastalaí';
  @override
  String get alias => 'Ainm an ghléis';
  @override
  String get deviceType => 'Cineál gléis';
  @override
  String get deviceModel => 'Múnla gléis';
  @override
  String get port => 'Port';
  @override
  String get network => 'Líonra';
  @override
  late final _Translations$settingsTab$network$networkOptions$ga networkOptions = _Translations$settingsTab$network$networkOptions$ga._(_root);
  @override
  String get discoveryTimeout => 'Am Teorann Fionnachtana';
  @override
  String get useSystemName => 'Úsáid ainm an chórais';
  @override
  String get generateRandomAlias => 'Gin leasainm randamach';
  @override
  String portWarning({required Object defaultPort}) =>
      'B’fhéidir nach mbraithfidh gléasanna eile thú mar go bhfuil port saincheaptha in úsáid agat. (réamhshocrú: ${defaultPort})';
  @override
  String get encryption => 'Criptiú';
  @override
  String get multicastGroup => 'Seoladh ilchraolta';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'B’fhéidir nach mbraithfidh gléasanna eile thú mar go bhfuil seoladh ilchraolta saincheaptha in úsáid agat. (réamhshocrú: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ga extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eile';
  @override
  String get support => 'Tacaigh le LocalSend';
  @override
  String get donate => 'Tabhair Síntiús';
  @override
  String get privacyPolicy => 'Polasaí Príobháideachais';
  @override
  String get termsOfUse => 'Téarmaí Úsáide';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$ga extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Is féidir leis an ngléas seo comhaid a sheoladh chuig gléasanna eile ach ní féidir le gléasanna eile comhaid a sheoladh chuig an ngléas seo.';
  @override
  String solution({required Object port}) =>
      'Is dóichí gur fadhb le balla dóiteáin atá ann. Is féidir leat é seo a réiteach trí naisc isteach (UDP agus TCP) a cheadú ar phort ${port}.';
  @override
  String get openFirewall => 'Oscail Balla Dóiteáin';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ga extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ní féidir leis an ngléas seo gléasanna eile a aimsiú.';
  @override
  String get solution =>
      'Cinntigh go bhfuil na gléasanna uile ar an líonra Wi-Fi céanna agus go roinneann siad an chumraíocht chéanna (port, seoladh ilchraolta, criptiú). Is féidir leat iarracht a dhéanamh seoladh IP an ghléis sprice a chlóscríobh de láimh. Má oibríonn sé seo, smaoinigh ar an ngléas seo a chur leis na cinn is fearr leat ionas gur féidir é a aimsiú go huathoibríoch amach anseo.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ga extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ní féidir leis an dá fheiste a chéile a aimsiú ná ní féidir leo comhaid a roinnt.';
  @override
  String get solution =>
      'An bhfuil an fhadhb ann ar an dá thaobh? Más ea, ní mór duit a chinntiú go bhfuil an dá fheiste ar an líonra Wi-Fi céanna agus go bhfuil an chumraíocht chéanna acu (port, seoladh ilchraolta, criptiú). B’fhéidir nach gceadaíonn an líonra Wi-Fi cumarsáid idir rannpháirtithe mar gheall ar Leithlisiú Pointe Rochtana (AP). Sa chás seo, ní mór an rogha seo a dhíchumasú ar an ródaire.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ga extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Oscail comhad';
  @override
  String get showInFolder => 'Taispeáin sa bhfillteán';
  @override
  String get info => 'Eolas';
  @override
  String get deleteFromHistory => 'Scrios ón stair';
}

// Path: progressPage.total
class _Translations$progressPage$total$ga extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ga title = _Translations$progressPage$total$title$ga._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Comhaid: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Méid: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Luas: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ga extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cuir leis an rogha';
  @override
  String get content => 'Cad ba mhaith leat a chur leis?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ga extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Oscail comhad';
  @override
  String get content => 'Ar mhaith leat an comhad a fuarthas a oscailt?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ga extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Iontráil seoladh';
  @override
  String get recentlyUsed => 'Úsáidte le déanaí: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$ga extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cealaigh aistriú comhad';
  @override
  String get content => 'An bhfuil tú cinnte gur mhaith leat an t-aistriú comhad a chealú?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ga extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ní féidir an comhad a oscailt';
  @override
  String content({required Object file}) => 'Níorbh fhéidir "${file}" a oscailt. An ndearnadh an comhad seo a bhogadh, a athainmniú nó a scriosadh?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ga extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Criptiú díchumasaithe';
  @override
  String get content => 'Déantar cumarsáid anois tríd an bprótacal HTTP neamhchriptithe. Chun prótacal HTTPS a úsáid, cumasaigh criptiú arís.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ga extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ga extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ceanáin';
  @override
  String get noFavorites => 'Níl aon ghléasanna is fearr leat fós.';
  @override
  String get addFavorite => 'Cuir';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$ga extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Scrios ó cheanáin';
  @override
  String content({required Object name}) => 'An bhfuil tú cinnte gur mhaith leat "${name}" a scriosadh ó na cinn is fearr leat?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ga extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Cuir le ceanáin';
  @override
  String get titleEdit => 'Socruithe';
  @override
  String get name => 'Ainm an ghléis';
  @override
  String get auto => '(uathoibríoch)';
  @override
  String get ip => 'Seoladh IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$ga extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eolas comhaid';
  @override
  String get fileName => 'Ainm comhaid:';
  @override
  String get path => 'Cosán:';
  @override
  String get size => 'Méid:';
  @override
  String get sender => 'Seoltóir:';
  @override
  String get time => 'Am:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$ga extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cuir isteach ainm comhaid';
  @override
  String original({required Object original}) => 'Bunaidh: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ga extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Glan stair';
  @override
  String get content => 'An bhfuil tú cinnte gur mhaith leat an stair ar fad a scriosadh?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ga extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Ní féidir le LocalSend gléasanna eile a aimsiú gan cead a bheith aige an líonra áitiúil a scanadh. Deonaigh an cead seo sna socruithe le do thoil.';
  @override
  String get gotoSettings => 'Socruithe';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ga extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Clóscríobh teachtaireacht';
  @override
  String get multiline => 'Il-líne';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ga extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Níl aon chomhaid roghnaithe';
  @override
  String get content => 'Roghnaigh comhad amháin ar a laghad.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ga extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gan cead';
  @override
  String get content => 'Níor dheonaigh tú na ceadanna riachtanacha. Deonaigh iad sna socruithe le do thoil.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ga extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Níl sé ar fáil';
  @override
  String get content => 'Níl an ghné seo ar fáil ach ar:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ga extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cód QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ga extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gníomhartha Tapa';
  @override
  String get counter => 'Áiritheoir';
  @override
  String get prefix => 'Réimír';
  @override
  String get padZero => 'Ceap le nialais';
  @override
  String get sortBeforeCount => 'Sórtáil in ord aibítre roimh ré (A-Z)';
  @override
  String get random => 'Randamach';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$ga extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Glactar le hiarratais ar chomhaid go huathoibríoch anois. Tabhair faoi deara gur féidir le gach duine ar an líonra áitiúil comhaid a sheoladh chugat.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ga extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Glactar le hiarratais chomhaid go huathoibríoch anois ó ghléasanna i do liosta is fearr leat.',
    'Rabhadh! Faoi láthair, níl sé seo slán go hiomlán, mar is féidir le haiceálaí a bhfuil méarloirg aon ghléis aige ó do liosta is fearr leat comhaid a sheoladh chugat gan srian.',
    'Mar sin féin, tá an rogha seo níos sábháilte fós ná ligean do gach úsáideoir ar an líonra áitiúil comhaid a sheoladh chugat gan srian.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$ga extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Iontráil UAP';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ga extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modhanna seolta';
  @override
  String get single => 'Seolann sé comhaid chuig faighteoir amháin. Glanfar an rogha tar éis aistriú comhad a bheith críochnaithe.';
  @override
  String get multiple => 'Seolann sé comhaid chuig ilfhaighteoirí. Ní ghlanfar an rogha tar éis aistriú comhad a bheith críochnaithe.';
  @override
  String get link =>
      'Is féidir le faighteoirí nach bhfuil LocalSend suiteáilte acu na comhaid roghnaithe a íoslódáil tríd an nasc a oscailt ina mbrabhsálaí.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ga extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ga extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Córas';
  @override
  String get dark => 'Dorcha';
  @override
  String get light => 'Solas';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$ga extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Córas';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ga extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Córas';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ga extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Gach';
  @override
  String get filtered => 'Scagtha';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ga extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ga._(TranslationsGa root) : this._root = root, super.internal(root);

  final TranslationsGa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Dul chun cinn iomlán (${time})';
  @override
  String get finishedError => 'Críochnaithe le hearráid';
  @override
  String get canceledSender => 'Cealaithe ag an seoltóir';
  @override
  String get canceledReceiver => 'Cealaithe ag an nglacadóir';
}
