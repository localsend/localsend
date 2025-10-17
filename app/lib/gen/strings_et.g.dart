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
class TranslationsEt extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Eesti keel';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralEt general = _TranslationsGeneralEt._(_root);
  @override
  late final _TranslationsReceiveTabEt receiveTab = _TranslationsReceiveTabEt._(_root);
  @override
  late final _TranslationsSendTabEt sendTab = _TranslationsSendTabEt._(_root);
  @override
  late final _TranslationsSettingsTabEt settingsTab = _TranslationsSettingsTabEt._(_root);
  @override
  late final _TranslationsTroubleshootPageEt troubleshootPage = _TranslationsTroubleshootPageEt._(_root);
  @override
  late final _TranslationsReceiveHistoryPageEt receiveHistoryPage = _TranslationsReceiveHistoryPageEt._(_root);
  @override
  late final _TranslationsApkPickerPageEt apkPickerPage = _TranslationsApkPickerPageEt._(_root);
  @override
  late final _TranslationsSelectedFilesPageEt selectedFilesPage = _TranslationsSelectedFilesPageEt._(_root);
  @override
  late final _TranslationsReceivePageEt receivePage = _TranslationsReceivePageEt._(_root);
  @override
  late final _TranslationsReceiveOptionsPageEt receiveOptionsPage = _TranslationsReceiveOptionsPageEt._(_root);
  @override
  late final _TranslationsSendPageEt sendPage = _TranslationsSendPageEt._(_root);
  @override
  late final _TranslationsProgressPageEt progressPage = _TranslationsProgressPageEt._(_root);
  @override
  late final _TranslationsWebSharePageEt webSharePage = _TranslationsWebSharePageEt._(_root);
  @override
  late final _TranslationsAboutPageEt aboutPage = _TranslationsAboutPageEt._(_root);
  @override
  late final _TranslationsDonationPageEt donationPage = _TranslationsDonationPageEt._(_root);
  @override
  late final _TranslationsChangelogPageEt changelogPage = _TranslationsChangelogPageEt._(_root);
  @override
  late final _TranslationsAliasGeneratorEt aliasGenerator = _TranslationsAliasGeneratorEt._(_root);
  @override
  late final _TranslationsDialogsEt dialogs = _TranslationsDialogsEt._(_root);
  @override
  late final _TranslationsSanitizationEt sanitization = _TranslationsSanitizationEt._(_root);
  @override
  late final _TranslationsTrayEt tray = _TranslationsTrayEt._(_root);
  @override
  late final _TranslationsWebEt web = _TranslationsWebEt._(_root);
  @override
  late final _TranslationsAssetPickerEt assetPicker = _TranslationsAssetPickerEt._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageEt networkInterfacesPage = _TranslationsNetworkInterfacesPageEt._(_root);
}

// Path: general
class _TranslationsGeneralEt extends TranslationsGeneralEn {
  _TranslationsGeneralEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
  String get queue => 'Järjekord';
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
class _TranslationsReceiveTabEt extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võta vastu';
  @override
  late final _TranslationsReceiveTabInfoBoxEt infoBox = _TranslationsReceiveTabInfoBoxEt._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveEt quickSave = _TranslationsReceiveTabQuickSaveEt._(_root);
}

// Path: sendTab
class _TranslationsSendTabEt extends TranslationsSendTabEn {
  _TranslationsSendTabEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saada';
  @override
  late final _TranslationsSendTabSelectionEt selection = _TranslationsSendTabSelectionEt._(_root);
  @override
  late final _TranslationsSendTabPickerEt picker = _TranslationsSendTabPickerEt._(_root);
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
  late final _TranslationsSendTabSendModesEt sendModes = _TranslationsSendTabSendModesEt._(_root);
  @override
  String get sendModeHelp => 'Selgitus';
  @override
  String get help => 'Palun kontrolli, et sihtseade asub sama WiFi ühenduse piires.';
  @override
  String get placeItems => 'Lisa jagatavad failid siia.';
}

// Path: settingsTab
class _TranslationsSettingsTabEt extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seadistused';
  @override
  late final _TranslationsSettingsTabGeneralEt general = _TranslationsSettingsTabGeneralEt._(_root);
  @override
  late final _TranslationsSettingsTabReceiveEt receive = _TranslationsSettingsTabReceiveEt._(_root);
  @override
  late final _TranslationsSettingsTabSendEt send = _TranslationsSettingsTabSendEt._(_root);
  @override
  late final _TranslationsSettingsTabNetworkEt network = _TranslationsSettingsTabNetworkEt._(_root);
  @override
  late final _TranslationsSettingsTabOtherEt other = _TranslationsSettingsTabOtherEt._(_root);
  @override
  String get advancedSettings => 'Täiendavad seadistused';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageEt extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallEt firewall = _TranslationsTroubleshootPageFirewallEt._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryEt noDiscovery = _TranslationsTroubleshootPageNoDiscoveryEt._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionEt noConnection = _TranslationsTroubleshootPageNoConnectionEt._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageEt extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsEt entryActions = _TranslationsReceiveHistoryPageEntryActionsEt._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageEt extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageEt extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Kustuta kõik';
}

// Path: receivePage
class _TranslationsReceivePageEt extends TranslationsReceivePageEn {
  _TranslationsReceivePageEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('et'))(n, one: 'soovib sulle saata faili', other: 'soovib sulle saata ${n} faili');
  @override
  String get subTitleMessage => 'saatis sulle sõnumi:';
  @override
  String get subTitleLink => 'saatis sulle lingi:';
  @override
  String get canceled => 'Saatja on päringu tühistanud.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageEt extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageEt extends TranslationsSendPageEn {
  _TranslationsSendPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageEt extends TranslationsProgressPageEn {
  _TranslationsProgressPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Saadame faile';
  @override
  String get titleReceiving => 'Võtame faile vastu';
  @override
  String get savedToGallery => 'Salvestatud kausta Fotod';
  @override
  late final _TranslationsProgressPageTotalEt total = _TranslationsProgressPageTotalEt._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageEt extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageEt extends TranslationsAboutPageEn {
  _TranslationsAboutPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageEt extends TranslationsDonationPageEn {
  _TranslationsDonationPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageEt extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muudatuste logi';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorEt extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsEt extends TranslationsDialogsEn {
  _TranslationsDialogsEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileEt addFile = _TranslationsDialogsAddFileEt._(_root);
  @override
  late final _TranslationsDialogsOpenFileEt openFile = _TranslationsDialogsOpenFileEt._(_root);
  @override
  late final _TranslationsDialogsAddressInputEt addressInput = _TranslationsDialogsAddressInputEt._(_root);
  @override
  late final _TranslationsDialogsCancelSessionEt cancelSession = _TranslationsDialogsCancelSessionEt._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileEt cannotOpenFile = _TranslationsDialogsCannotOpenFileEt._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeEt encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeEt._(_root);
  @override
  late final _TranslationsDialogsErrorDialogEt errorDialog = _TranslationsDialogsErrorDialogEt._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogEt favoriteDialog = _TranslationsDialogsFavoriteDialogEt._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogEt favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogEt._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogEt favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogEt._(_root);
  @override
  late final _TranslationsDialogsFileInfoEt fileInfo = _TranslationsDialogsFileInfoEt._(_root);
  @override
  late final _TranslationsDialogsFileNameInputEt fileNameInput = _TranslationsDialogsFileNameInputEt._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogEt historyClearDialog = _TranslationsDialogsHistoryClearDialogEt._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedEt localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedEt._(_root);
  @override
  late final _TranslationsDialogsMessageInputEt messageInput = _TranslationsDialogsMessageInputEt._(_root);
  @override
  late final _TranslationsDialogsNoFilesEt noFiles = _TranslationsDialogsNoFilesEt._(_root);
  @override
  late final _TranslationsDialogsNoPermissionEt noPermission = _TranslationsDialogsNoPermissionEt._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformEt notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformEt._(_root);
  @override
  late final _TranslationsDialogsQrEt qr = _TranslationsDialogsQrEt._(_root);
  @override
  late final _TranslationsDialogsQuickActionsEt quickActions = _TranslationsDialogsQuickActionsEt._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeEt quickSaveNotice = _TranslationsDialogsQuickSaveNoticeEt._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeEt quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeEt._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinEt pin = _TranslationsDialogsPinEt._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpEt sendModeHelp = _TranslationsDialogsSendModeHelpEt._(_root);
  @override
  late final _TranslationsDialogsZoomEt zoom = _TranslationsDialogsZoomEt._(_root);
}

// Path: sanitization
class _TranslationsSanitizationEt extends TranslationsSanitizationEn {
  _TranslationsSanitizationEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Failil peab olema nimi';
  @override
  String get invalid => 'Failinimes on valesid tähemärke';
}

// Path: tray
class _TranslationsTrayEt extends TranslationsTrayEn {
  _TranslationsTrayEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsWebEt extends TranslationsWebEn {
  _TranslationsWebEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerEt extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageEt extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxEt extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveEt extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionEt extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerEt extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesEt extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralEt extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Üldised seadistused';
  @override
  String get brightness => 'Kujundus';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsEt brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsEt._(_root);
  @override
  String get color => 'Värv';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsEt colorOptions = _TranslationsSettingsTabGeneralColorOptionsEt._(_root);
  @override
  String get language => 'Keel';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsEt languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsEt._(_root);
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
class _TranslationsSettingsTabReceiveEt extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendEt extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saatmine';
  @override
  String get shareViaLinkAutoAccept => 'Kui kasutusel on „Jaga lingi abil“, siis nõustu vastuvõtmisega automaatselt';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkEt extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsEt networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsEt._(_root);
  @override
  String get network => 'Võrk';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherEt extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muu teave';
  @override
  String get support => 'Toeta LocalSendi';
  @override
  String get donate => 'Toeta rahaliselt';
  @override
  String get privacyPolicy => 'Privaatsuspoliitika';
  @override
  String get termsOfUse => 'Kasutustingimused';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallEt extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Siit seadmest on võimalik teisele faile saata, kuid teised ei saa siia saata.';
  @override
  String solution({required Object port}) =>
      'Tõenäoliselt on see seotud tulemüüriga. Olukorra võid lahendada lubades sisenevad (UDP ja TCP) ühendused pordis ${port}.';
  @override
  String get openFirewallSettings => 'Ava tulemüüri seadistused';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryEt extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'See seade ei suuda tuvastada teisi seadeid.';
  @override
  String get solution =>
      'Palun kontrolli, et kõik seadmed asuvad samas WiFi võrgus ning kasutavad samu seadistusi (port, multiedastuse aadress ja krüptimine). Sa võid ka proovida sihtseadme IP-aadressi lisamist käsitsi. Kui siis ühendus toimib, võid ta lisada lemmikuks ja hilisem tuvastamine saab olema automaatne.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionEt extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Mõlemad seadmed ei suuda üksteist leida ega jagada faile.';
  @override
  String get solution =>
      'Kas identne probleem on mõlemas seadmes? Kui nii, siis palun kontrolli, et mõlemad seadmed asuvad samas WiFi võrgus ning kasutavad samu seadistusi (port, multiedastuse aadress ja krüptimine). Aga samas on võimalik, et WiFi võrk on seadistatud nii, et kõik seadmed on üksteisest isoleeritud. Sel juhul küsi abi võrgu haldajalt, kes saab ruuteris teha vajalikud muudatused.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsEt extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalEt extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleEt title = _TranslationsProgressPageTotalTitleEt._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Faile: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Andmemaht: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Kiirus: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileEt extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lisa valiku hulka';
  @override
  String get content => 'Mida sa sooviksid lisada?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileEt extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ava fail';
  @override
  String get content => 'Kas sa soovid avada saadud faili?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputEt extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionEt extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Katkesta failide edastamine';
  @override
  String get content => 'Kas sa kindlasti soovid katkestada failide edastamise?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileEt extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faili avamine ei õnnestu';
  @override
  String content({required Object file}) => '„${file}“ faili avamine ei õnnestunud. Kas ta võib olla teisaldatud, ümbernimetatud või kustutatud?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeEt extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Krüptimine pole kasutusel';
  @override
  String get content =>
      'Andmevahetus toimub nüüd krüptimata HTTP-protokolli vahendusel. Turvalise HTTPS-protokolli kasutamiseks lülita krüptimine sisse.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogEt extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogEt extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogEt extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kustuta lemmikute hulgast';
  @override
  String content({required Object name}) => 'Kas sa kindlasti soovid „${name}“ kustutada lemmikute hulgast?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogEt extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoEt extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputEt extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sisesta failinimi';
  @override
  String original({required Object original}) => 'Algne: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogEt extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tühjenda ajalugu';
  @override
  String get content => 'Kas sa kindlasti soovid kogu ajaloo kustutada?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedEt extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputEt extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirjuta sõnum';
  @override
  String get multiline => 'Mitmerealine';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesEt extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ühtegi faili pole valitud';
  @override
  String get content => 'Palun vali vähemalt üks fail.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionEt extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Õigused puuduvad';
  @override
  String get content => 'Sa pole rakendusele jaganud vajalikke õigusi. Palun tee seda süsteemi seadistustes.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformEt extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pole saadaval';
  @override
  String get content => 'See funktsionaalsus on saadaval vaid:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrEt extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kood';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsEt extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeEt extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Failipäringutega nõustume nüüd automaatselt. Palun arvesta, et seeläbi võivad kõik sinu kohtvõrgus saata sulle faile.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeEt extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinEt extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sisesta PIN-kood';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpEt extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomEt extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Võrguaadress';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsEt extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsEt extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Süsteemi värvid';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsEt extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Süsteemi keel';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsEt extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsEt._(TranslationsEt root) : this._root = root, super.internal(root);

  final TranslationsEt _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'Filtreeritud';
  @override
  String get all => 'Kõik';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleEt extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleEt._(TranslationsEt root) : this._root = root, super.internal(root);

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
