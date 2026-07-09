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
class TranslationsEt extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEt({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.et,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <et>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEt _root = this; // ignore: unused_field

  @override
  TranslationsEt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEt(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Eesti keel';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$et general = _Translations$general$et._(_root);
  @override
  late final _Translations$receiveTab$et receiveTab = _Translations$receiveTab$et._(_root);
  @override
  late final _Translations$sendTab$et sendTab = _Translations$sendTab$et._(_root);
  @override
  late final _Translations$settingsTab$et settingsTab = _Translations$settingsTab$et._(_root);
  @override
  late final _Translations$troubleshootPage$et troubleshootPage = _Translations$troubleshootPage$et._(_root);
  @override
  late final _Translations$receiveHistoryPage$et receiveHistoryPage = _Translations$receiveHistoryPage$et._(_root);
  @override
  late final _Translations$apkPickerPage$et apkPickerPage = _Translations$apkPickerPage$et._(_root);
  @override
  late final _Translations$selectedFilesPage$et selectedFilesPage = _Translations$selectedFilesPage$et._(_root);
  @override
  late final _Translations$receivePage$et receivePage = _Translations$receivePage$et._(_root);
  @override
  late final _Translations$receiveOptionsPage$et receiveOptionsPage = _Translations$receiveOptionsPage$et._(_root);
  @override
  late final _Translations$sendPage$et sendPage = _Translations$sendPage$et._(_root);
  @override
  late final _Translations$progressPage$et progressPage = _Translations$progressPage$et._(_root);
  @override
  late final _Translations$webSharePage$et webSharePage = _Translations$webSharePage$et._(_root);
  @override
  late final _Translations$aboutPage$et aboutPage = _Translations$aboutPage$et._(_root);
  @override
  late final _Translations$donationPage$et donationPage = _Translations$donationPage$et._(_root);
  @override
  late final _Translations$changelogPage$et changelogPage = _Translations$changelogPage$et._(_root);
  @override
  late final _Translations$dialogs$et dialogs = _Translations$dialogs$et._(_root);
  @override
  late final _Translations$sanitization$et sanitization = _Translations$sanitization$et._(_root);
  @override
  late final _Translations$tray$et tray = _Translations$tray$et._(_root);
  @override
  late final _Translations$web$et web = _Translations$web$et._(_root);
  @override
  late final _Translations$assetPicker$et assetPicker = _Translations$assetPicker$et._(_root);
  @override
  late final _Translations$networkInterfacesPage$et networkInterfacesPage = _Translations$networkInterfacesPage$et._(_root);
}

// Path: general
class _Translations$general$et extends Translations$general$en {
  _Translations$general$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Nõustu';
  @override
  String get accepted => 'Nõustusid';
  @override
  String get add => 'Lisa';
  @override
  String get advanced => 'Lisavalikud';
  @override
  String get cancel => 'Katkesta';
  @override
  String get close => 'Sulge';
  @override
  String get confirm => 'Kinnita';
  @override
  String get continueStr => 'Jätka';
  @override
  String get copy => 'Kopeeri';
  @override
  String get copiedToClipboard => 'Kopeeritud lõikelauale';
  @override
  String get decline => 'Keeldu';
  @override
  String get done => 'Valmis';
  @override
  String get delete => 'Kustuta';
  @override
  String get edit => 'Muuda';
  @override
  String get error => 'Viga';
  @override
  String get example => 'Näide';
  @override
  String get files => 'Failid';
  @override
  String get finished => 'Valmis';
  @override
  String get hide => 'Peida';
  @override
  String get off => 'Väljas';
  @override
  String get offline => 'Pole võrgus';
  @override
  String get on => 'Sees';
  @override
  String get online => 'Võrgus';
  @override
  String get open => 'Ava';
  @override
  String get queue => 'Järjekorras';
  @override
  String get quickSave => 'Kiirsalvestus';
  @override
  String get quickSaveFromFavorites => 'Kiirsalvestamine „Lemmikutelt“';
  @override
  String get renamed => 'Nimi on muudetud';
  @override
  String get reset => 'Tühista muudatused';
  @override
  String get restart => 'Käivita uuesti';
  @override
  String get settings => 'Seadistused';
  @override
  String get skipped => 'Vahelejäetud';
  @override
  String get start => 'Alusta';
  @override
  String get stop => 'Peata';
  @override
  String get save => 'Salvesta';
  @override
  String get unchanged => 'Muutmata';
  @override
  String get unknown => 'Teadmata';
  @override
  String get noItemInClipboard => 'Lõikelaual pole midagi.';
}

// Path: receiveTab
class _Translations$receiveTab$et extends Translations$receiveTab$en {
  _Translations$receiveTab$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võta vastu';
  @override
  late final _Translations$receiveTab$infoBox$et infoBox = _Translations$receiveTab$infoBox$et._(_root);
  @override
  late final _Translations$receiveTab$quickSave$et quickSave = _Translations$receiveTab$quickSave$et._(_root);
}

// Path: sendTab
class _Translations$sendTab$et extends Translations$sendTab$en {
  _Translations$sendTab$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saada';
  @override
  late final _Translations$sendTab$selection$et selection = _Translations$sendTab$selection$et._(_root);
  @override
  late final _Translations$sendTab$picker$et picker = _Translations$sendTab$picker$et._(_root);
  @override
  String get shareIntentInfo => 'Klikates nutiseadmes olevates rakendustes nuppu „Jaga“ võid kasutada ka mugavat jagamise võimalust.';
  @override
  String get nearbyDevices => 'Läheduses asuvad seadmed';
  @override
  String get thisDevice => 'See seade';
  @override
  String get scan => 'Otsi seadmeid';
  @override
  String get manualSending => 'Saada käsitsi';
  @override
  String get sendMode => 'Saatmisviis';
  @override
  late final _Translations$sendTab$sendModes$et sendModes = _Translations$sendTab$sendModes$et._(_root);
  @override
  String get sendModeHelp => 'Selgitus';
  @override
  String get help => 'Palun kontrolli, et sihtseade asub sama WiFi ühenduse piires.';
  @override
  String get placeItems => 'Lisa jagatavad failid siia.';
}

// Path: settingsTab
class _Translations$settingsTab$et extends Translations$settingsTab$en {
  _Translations$settingsTab$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seadistused';
  @override
  late final _Translations$settingsTab$general$et general = _Translations$settingsTab$general$et._(_root);
  @override
  late final _Translations$settingsTab$receive$et receive = _Translations$settingsTab$receive$et._(_root);
  @override
  late final _Translations$settingsTab$send$et send = _Translations$settingsTab$send$et._(_root);
  @override
  late final _Translations$settingsTab$network$et network = _Translations$settingsTab$network$et._(_root);
  @override
  late final _Translations$settingsTab$other$et other = _Translations$settingsTab$other$et._(_root);
  @override
  String get advancedSettings => 'Täiendavad seadistused';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$et extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Veaotsing';
  @override
  String get subTitle => 'Kas rakendus toimib nii, nagu vaja? Siin võid leida lahendusi levinumatele probleemidele.';
  @override
  String get solution => 'Lahendus:';
  @override
  String get fixButton => 'Paranda automaatselt';
  @override
  late final _Translations$troubleshootPage$firewall$et firewall = _Translations$troubleshootPage$firewall$et._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$et noDiscovery = _Translations$troubleshootPage$noDiscovery$et._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$et noConnection = _Translations$troubleshootPage$noConnection$et._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$et extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ajalugu';
  @override
  String get openFolder => 'Ava kaust';
  @override
  String get deleteHistory => 'Kustuta ajalugu';
  @override
  String get empty => 'Ajalugu on tühi.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$et entryActions = _Translations$receiveHistoryPage$entryActions$et._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$et extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rakendused (apk-failid)';
  @override
  String get excludeSystemApps => 'Välista süsteemi rakendused';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Välista mittekäivitatavad rakendused';
  @override
  String apps({required Object n}) => '${n} rakendust';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$et extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Kustuta kõik';
}

// Path: receivePage
class _Translations$receivePage$et extends Translations$receivePage$en {
  _Translations$receivePage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('et'))(
    n,
    one: 'soovib sulle saata faili',
    other: 'soovib sulle saata ${n} faili',
  );
  @override
  String get subTitleMessage => 'saatis sulle sõnumi:';
  @override
  String get subTitleLink => 'saatis sulle lingi:';
  @override
  String get canceled => 'Saatja on päringu tühistanud.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$et extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eelistused';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSendi kaust)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Pole kasutusel, kuna saadetavate hulgas leidub kaustu.';
}

// Path: sendPage
class _Translations$sendPage$et extends Translations$sendPage$en {
  _Translations$sendPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Ootame vastust…';
  @override
  String get rejected => 'Vastuvõtja on vastuvõtmisest keeldunud.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Vastuvõtja on hõivatud teise päringuga tegelemisega.';
}

// Path: progressPage
class _Translations$progressPage$et extends Translations$progressPage$en {
  _Translations$progressPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Saadame faile';
  @override
  String get titleReceiving => 'Võtame faile vastu';
  @override
  String get savedToGallery => 'Salvestatud kausta Fotod';
  @override
  late final _Translations$progressPage$total$et total = _Translations$progressPage$total$et._(_root);
  @override
  late final _Translations$progressPage$remainingTime$et remainingTime = _Translations$progressPage$remainingTime$et._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$et extends Translations$webSharePage$en {
  _Translations$webSharePage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Jaga lingi vahendusel';
  @override
  String get loading => 'Käivitame serverit…';
  @override
  String get stopping => 'Peatame serverit…';
  @override
  String get error => 'Serveri käivitamisel tekkis viga.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('et'))(
    n,
    one: 'Ava see link oma veebibrauseris:',
    other: 'Ava üks neist linkidest oma veebibrauseris:',
  );
  @override
  String get requests => 'Päringuid';
  @override
  String get noRequests => 'Päringuid veel pole.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Nõustu päringutega automaatselt';
  @override
  String get requirePin => 'Küsi PIN-koodi';
  @override
  String pinHint({required Object pin}) => 'PIN-kood on „${pin}“';
  @override
  String get encryptionHint => 'LocalSend kasutab enda poolt allkirjastatud sertifikaate. Ühenduse toimimiseks palun nõustu nendega veebibrauseris.';
  @override
  String pendingRequests({required Object n}) => 'Ootel päringuid: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$et extends Translations$aboutPage$en {
  _Translations$aboutPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rakenduse teave: LocalSend';
  @override
  List<String> get description => [
    'LocalSend põhineb avatud lähtekoodil, on kõikide jaoks vaba ning tasuta kasutatav. Rakenduse eesmärgiks on võimaldada failide ja tekstide jagamist kohtvõrgus asuvate arvutite vahel nii, et välist internetiühendust pole vaja kasutada.',
    'See rakendus on saadaval Androidi, iOSi, macOSi, Windowsi ja Linuxi jaoks. Kõik allalaaditavad paigaldusfailid leiad meie ametlikust veebisaidist.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Kaasautorid';
  @override
  String get packagers => 'Pakendajad';
  @override
  String get translators => 'Tõlkijad';
}

// Path: donationPage
class _Translations$donationPage$et extends Translations$donationPage$en {
  _Translations$donationPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Toeta meid rahaliselt';
  @override
  String get info =>
      'LocalSend põhineb avatud lähtekoodil, on kõikide jaoks vaba ning tasuta kasutatav, ega sisalda reklaame. Kui sulle see rakendus meeldib, siis palun toeta meie arendust.';
  @override
  String donate({required Object amount}) => 'Anneta ${amount}';
  @override
  String get thanks => 'Suur tänu!';
  @override
  String get restore => 'Taasta ost';
}

// Path: changelogPage
class _Translations$changelogPage$et extends Translations$changelogPage$en {
  _Translations$changelogPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muudatuste logi';
}

// Path: dialogs
class _Translations$dialogs$et extends Translations$dialogs$en {
  _Translations$dialogs$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$et addFile = _Translations$dialogs$addFile$et._(_root);
  @override
  late final _Translations$dialogs$openFile$et openFile = _Translations$dialogs$openFile$et._(_root);
  @override
  late final _Translations$dialogs$addressInput$et addressInput = _Translations$dialogs$addressInput$et._(_root);
  @override
  late final _Translations$dialogs$cancelSession$et cancelSession = _Translations$dialogs$cancelSession$et._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$et cannotOpenFile = _Translations$dialogs$cannotOpenFile$et._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$et encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$et._(_root);
  @override
  late final _Translations$dialogs$errorDialog$et errorDialog = _Translations$dialogs$errorDialog$et._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$et favoriteDialog = _Translations$dialogs$favoriteDialog$et._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$et favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$et._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$et favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$et._(_root);
  @override
  late final _Translations$dialogs$fileInfo$et fileInfo = _Translations$dialogs$fileInfo$et._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$et fileNameInput = _Translations$dialogs$fileNameInput$et._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$et historyClearDialog = _Translations$dialogs$historyClearDialog$et._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$et localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$et._(_root);
  @override
  late final _Translations$dialogs$messageInput$et messageInput = _Translations$dialogs$messageInput$et._(_root);
  @override
  late final _Translations$dialogs$noFiles$et noFiles = _Translations$dialogs$noFiles$et._(_root);
  @override
  late final _Translations$dialogs$noPermission$et noPermission = _Translations$dialogs$noPermission$et._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$et notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$et._(_root);
  @override
  late final _Translations$dialogs$qr$et qr = _Translations$dialogs$qr$et._(_root);
  @override
  late final _Translations$dialogs$quickActions$et quickActions = _Translations$dialogs$quickActions$et._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$et quickSaveNotice = _Translations$dialogs$quickSaveNotice$et._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$et quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$et._(_root);
  @override
  late final _Translations$dialogs$pin$et pin = _Translations$dialogs$pin$et._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$et sendModeHelp = _Translations$dialogs$sendModeHelp$et._(_root);
  @override
  late final _Translations$dialogs$zoom$et zoom = _Translations$dialogs$zoom$et._(_root);
}

// Path: sanitization
class _Translations$sanitization$et extends Translations$sanitization$en {
  _Translations$sanitization$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Failil peab olema nimi';
  @override
  String get invalid => 'Failinimes on valesid tähemärke';
}

// Path: tray
class _Translations$tray$et extends Translations$tray$en {
  _Translations$tray$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Sulge LocalSend';
  @override
  String get closeWindows => 'Välju';
}

// Path: web
class _Translations$web$et extends Translations$web$en {
  _Translations$web$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Sisesta PIN-kood';
  @override
  String get invalidPin => 'Vigane PIN-kood';
  @override
  String get tooManyAttempts => 'Liiga palju sisestuskatseid';
  @override
  String get rejected => 'Keelatud';
  @override
  String get files => 'Failid';
  @override
  String get fileName => 'Failinimi';
  @override
  String get size => 'Suurus';
}

// Path: assetPicker
class _Translations$assetPicker$et extends Translations$assetPicker$en {
  _Translations$assetPicker$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Kinnita';
  @override
  String get cancel => 'Katkesta';
  @override
  String get edit => 'Muuda';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Laadimine ei õnnestunud';
  @override
  String get original => 'Algne';
  @override
  String get preview => 'Eelvaade';
  @override
  String get select => 'Vali';
  @override
  String get emptyList => 'Tühi loend';
  @override
  String get unSupportedAssetType => 'Failitüüp pole toetatud.';
  @override
  String get unableToAccessAll => 'Selles seadmes puudub ligipääs failidele';
  @override
  String get viewingLimitedAssetsTip => 'Näed vaid faile ja albumeid, millele oled sellele rakendusele ligipääsu andnud.';
  @override
  String get changeAccessibleLimitedAssets => 'Ligipääsetavate failide loendi uuendmiseks klõpsi';
  @override
  String get accessAllTip =>
      'Rakendusel on selles nutiseadmes ligipääs vaid mõnedele failidele. Kui vajad ligipääsu kõikidele meediafailidele, siis ava seadistused ning luba vastavad õigused.';
  @override
  String get goToSystemSettings => 'Ava süsteemi seadistused';
  @override
  String get accessLimitedAssets => 'Jätka piiratud ligipääsuga';
  @override
  String get accessiblePathName => 'Kasutatavad failid';
  @override
  String get sTypeAudioLabel => 'Heli';
  @override
  String get sTypeImageLabel => 'Pilt';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Muu meedia';
  @override
  String get sActionPlayHint => 'esita';
  @override
  String get sActionPreviewHint => 'eelvaade';
  @override
  String get sActionSelectHint => 'vali';
  @override
  String get sActionSwitchPathLabel => 'muuda asukohta';
  @override
  String get sActionUseCameraHint => 'kasuta kaamerat';
  @override
  String get sNameDurationLabel => 'kestus';
  @override
  String get sUnitAssetCountLabel => 'kogus';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$et extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võrguliidesed';
  @override
  String get preview => 'Eelvaade';
  @override
  String get whitelist => 'Lubatud loend';
  @override
  String get blacklist => 'Keelatud loend';
  @override
  String get info =>
      'Vaikimisi kasutab LocalSend kõiki võrguliideseid. Kui sul on vaja, siis saad mittesoovitud võrgud siinkohal välistada ning muudatuste jõustumine eeldab serverikomponendi uuesti käivitamist.';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$et extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP-aadress:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Seadme nimi:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$et extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Lemmikud';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$et extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Valik';
  @override
  String files({required Object files}) => 'Failid: ${files}';
  @override
  String size({required Object size}) => 'Andmemaht: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$et extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fail';
  @override
  String get folder => 'Kaust';
  @override
  String get media => 'Meedia';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'Rakendus';
  @override
  String get clipboard => 'Aseta';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$et extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Üks vastuvõtja';
  @override
  String get multiple => 'Mitu vastuvõtjat';
  @override
  String get link => 'Jagamine lingi vahendusel';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$et extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Üldised seadistused';
  @override
  String get brightness => 'Kujundus';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$et brightnessOptions = _Translations$settingsTab$general$brightnessOptions$et._(
    _root,
  );
  @override
  String get color => 'Värv';
  @override
  late final _Translations$settingsTab$general$colorOptions$et colorOptions = _Translations$settingsTab$general$colorOptions$et._(_root);
  @override
  String get language => 'Keel';
  @override
  late final _Translations$settingsTab$general$languageOptions$et languageOptions = _Translations$settingsTab$general$languageOptions$et._(_root);
  @override
  String get saveWindowPlacement => 'Peale väljumist salvesta akna asukoht';
  @override
  String get saveWindowPlacementWindows => 'Peale lõpetamist salvesta akna asukoht';
  @override
  String get minimizeToTray => 'Sulgemisel aseta rakendus süsteemisalve';
  @override
  String get launchAtStartup => 'Sisselogimisel käivita automaatselt';
  @override
  String get launchMinimized => 'Automaatsel käivitamisel: käivita peidetuna';
  @override
  String get showInContextMenu => 'Näita LocalSendi kontekstimenüüs';
  @override
  String get animations => 'Animatsioonid';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$et extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vastuvõtmine';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Lõpeta automaatselt';
  @override
  String get destination => 'Salvesta kausta';
  @override
  String get downloads => '(Allalaadimised)';
  @override
  String get saveToGallery => 'Lisa meedia galeriisse';
  @override
  String get saveToHistory => 'Salvesta ajalukku';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$et extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saatmine';
  @override
  String get shareViaLinkAutoAccept => 'Kui kasutusel on „Jaga lingi abil“, siis nõustu vastuvõtmisega automaatselt';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$et extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võrk';
  @override
  String get needRestart => 'Muudatuste jõustamiseks palun käivita server uuesti!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Seadme nimi';
  @override
  String get deviceType => 'Seadme tüüp';
  @override
  String get deviceModel => 'Seadme mudel';
  @override
  String get port => 'Kasutatav port';
  @override
  String get discoveryTimeout => 'Leitavuse aegumine';
  @override
  String get useSystemName => 'Kasuta süsteemset nime';
  @override
  String get generateRandomAlias => 'Loo juhuslik nimi';
  @override
  String portWarning({required Object defaultPort}) =>
      'Kuna kasutad endamääratud porti, siis muud seadmed ei pruugi seda seadet leida. (vaikimisi: ${defaultPort})';
  @override
  String get encryption => 'Krüptimine';
  @override
  String get multicastGroup => 'Multiedastuse aadress';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Kuna kasutad endamääratud multiedastuse aadressi, siis muud seadmed ei pruugi seda seadet leida. (vaikimisi: ${defaultMulticast})';
  @override
  late final _Translations$settingsTab$network$networkOptions$et networkOptions = _Translations$settingsTab$network$networkOptions$et._(_root);
  @override
  String get network => 'Võrk';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$et extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muu teave';
  @override
  String get support => 'Toeta LocalSendi';
  @override
  String get donate => 'Toeta rahaliselt';
  @override
  String get privacyPolicy => 'Andmekaitsepõhimõtted';
  @override
  String get termsOfUse => 'Kasutustingimused';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$et extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Siit seadmest on võimalik teisele faile saata, kuid teised ei saa siia saata.';
  @override
  String solution({required Object port}) =>
      'Tõenäoliselt on see seotud tulemüüriga. Olukorra võid lahendada lubades sisenevad (UDP ja TCP) ühendused pordis ${port}.';
  @override
  String get openFirewall => 'Ava tulemüüri seadistused';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$et extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'See seade ei suuda tuvastada teisi seadeid.';
  @override
  String get solution =>
      'Palun kontrolli, et kõik seadmed asuvad samas WiFi võrgus ning kasutavad samu seadistusi (port, multiedastuse aadress ja krüptimine). Sa võid ka proovida sihtseadme IP-aadressi lisamist käsitsi. Kui siis ühendus toimib, võid ta lisada lemmikuks ja hilisem tuvastamine saab olema automaatne.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$et extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Mõlemad seadmed ei suuda üksteist leida ega jagada faile.';
  @override
  String get solution =>
      'Kas identne probleem on mõlemas seadmes? Kui nii, siis palun kontrolli, et mõlemad seadmed asuvad samas WiFi võrgus ning kasutavad samu seadistusi (port, multiedastuse aadress ja krüptimine). Aga samas on võimalik, et WiFi võrk on seadistatud nii, et kõik seadmed on üksteisest isoleeritud. Sel juhul küsi abi võrgu haldajalt, kes saab ruuteris teha vajalikud muudatused.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$et extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Ava fail';
  @override
  String get showInFolder => 'Näita kaustas';
  @override
  String get info => 'Teave';
  @override
  String get deleteFromHistory => 'Kustuta ajaloost';
}

// Path: progressPage.total
class _Translations$progressPage$total$et extends Translations$progressPage$total$en {
  _Translations$progressPage$total$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$et title = _Translations$progressPage$total$title$et._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Faile: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Andmemaht: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Kiirus: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$et extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Kasuta „h“ tunni lühendina ja „m“ minutite jaoks
  @override
  String hours({required Object h, required Object m}) => '${h} t ${m} min';

  /// Kasuta „d“ päeva, lühendina „h“ tunni lühendina ja „m“ minutite jaoks
  @override
  String days({required Object d, required Object h, required Object m}) => '${d} pv ${h} t ${m} min';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$et extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lisa valiku hulka';
  @override
  String get content => 'Mida sa sooviksid lisada?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$et extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ava fail';
  @override
  String get content => 'Kas sa soovid avada saadud faili?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$et extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sisesta aadress';
  @override
  String get hashtag => 'Teemaviide';
  @override
  String get ip => 'IP-aadress';
  @override
  String get recentlyUsed => 'Hiljuti kasutatud: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$et extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Katkesta failide edastamine';
  @override
  String get content => 'Kas sa kindlasti soovid katkestada failide edastamise?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$et extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faili avamine ei õnnestu';
  @override
  String content({required Object file}) => '„${file}“ faili avamine ei õnnestunud. Kas ta võib olla teisaldatud, ümbernimetatud või kustutatud?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$et extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Krüptimine pole kasutusel';
  @override
  String get content =>
      'Andmevahetus toimub nüüd krüptimata HTTP-protokolli vahendusel. Turvalise HTTPS-protokolli kasutamiseks lülita krüptimine sisse.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$et extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$et extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lemmikud';
  @override
  String get noFavorites => 'Ühtegi lemmikseadet veel pole.';
  @override
  String get addFavorite => 'Lisa';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$et extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kustuta lemmikute hulgast';
  @override
  String content({required Object name}) => 'Kas sa kindlasti soovid „${name}“ kustutada lemmikute hulgast?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$et extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Lisa lemmikuks';
  @override
  String get titleEdit => 'Seadistused';
  @override
  String get name => 'Seadme nimi';
  @override
  String get auto => '(automaatne)';
  @override
  String get ip => 'IP-aadress';
  @override
  String get port => 'Kasutatav port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$et extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faili teave';
  @override
  String get fileName => 'Failinimi:';
  @override
  String get path => 'Asukoht:';
  @override
  String get size => 'Suurus:';
  @override
  String get sender => 'Saatja:';
  @override
  String get time => 'Kellaaeg:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$et extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sisesta failinimi';
  @override
  String original({required Object original}) => 'Algne: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$et extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tühjenda ajalugu';
  @override
  String get content => 'Kas sa kindlasti soovid kogu ajaloo kustutada?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$et extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Ilma kohtvõrgu skaneerimise õiguseta ei suuda LocalSend leida teisi seadmeid. Palun luba süsteemi seadistustest vajalikud õigused.';
  @override
  String get gotoSettings => 'Seadistused';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$et extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirjuta sõnum';
  @override
  String get multiline => 'Mitmerealine';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$et extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ühtegi faili pole valitud';
  @override
  String get content => 'Palun vali vähemalt üks fail.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$et extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Õigused puuduvad';
  @override
  String get content => 'Sa pole rakendusele jaganud vajalikke õigusi. Palun tee seda süsteemi seadistustes.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$et extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pole saadaval';
  @override
  String get content => 'See funktsionaalsus on saadaval vaid:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$et extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kood';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$et extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kiirtoimingud';
  @override
  String get counter => 'Loendur';
  @override
  String get prefix => 'Eesliide';
  @override
  String get padZero => 'Täida nullidega';
  @override
  String get sortBeforeCount => 'Enne loendamist järjesta tähestiku järjekorras (A-Z)';
  @override
  String get random => 'Juhuslikult';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$et extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Failipäringutega nõustume nüüd automaatselt. Palun arvesta, et seeläbi võivad kõik sinu kohtvõrgus saata sulle faile.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$et extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Failipäringutega nõustume nüüd automaatselt vaid nende seadmete puhul, mis on lemmikuks märgitud.',
    'Hoiatus! Kui kohtvõrgus tegutsev võimalik pahatahtlik osapool saaks kätte sinul lemmikuks märgitud seadmete võtmed ja sõrmejäljed, siis saaks sulle piiranguteta faile saata ja seega pole lahendus hetkel täiesti turvaline.',
    'Aga siiski on see valik turvalisem, kui lubada kõigil sinu kohtvõrgu kasutajatel saata sulle faile ilma igasuguste piiranguteta.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$et extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sisesta PIN-kood';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$et extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saatmisviisid';
  @override
  String get single => 'Sellega saadame faile ühele vastuvõtjale. Peale failide saatmise lõppu eemaldame failid saatmisloendist.';
  @override
  String get multiple => 'Sellega saadame faile mitmele vastuvõtjale. Peale failide saatmise lõppu failid jäävad saatmisloendisse alles.';
  @override
  String get link =>
      'Kui failide vastuvõtjatel pole arvutis või nutiseadmes rakendust LocalSend, siis avades etteantud lingi oma veebibrauseris, saavad nad failid alla laadida.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$et extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võrguaadress';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$et extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Süsteemi kujundus';
  @override
  String get dark => 'Tume kujundus';
  @override
  String get light => 'Hele kujundus';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$et extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Süsteemi värvid';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$et extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Süsteemi keel';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$et extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'Filtreeritud';
  @override
  String get all => 'Kõik';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$et extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$et._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Edenemine kokku (${time})';
  @override
  String get finishedError => 'Lõppes veaga';
  @override
  String get canceledSender => 'Saatja poolt katkestatud';
  @override
  String get canceledReceiver => 'Vastuvõtja poolt katkestatud';
}
