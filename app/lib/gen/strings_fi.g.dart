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
class TranslationsFi extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.fi,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <fi>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsFi _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Finnish';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralFi general = _TranslationsGeneralFi._(_root);
  @override
  late final _TranslationsReceiveTabFi receiveTab = _TranslationsReceiveTabFi._(_root);
  @override
  late final _TranslationsSendTabFi sendTab = _TranslationsSendTabFi._(_root);
  @override
  late final _TranslationsSettingsTabFi settingsTab = _TranslationsSettingsTabFi._(_root);
  @override
  late final _TranslationsTroubleshootPageFi troubleshootPage = _TranslationsTroubleshootPageFi._(_root);
  @override
  late final _TranslationsReceiveHistoryPageFi receiveHistoryPage = _TranslationsReceiveHistoryPageFi._(_root);
  @override
  late final _TranslationsApkPickerPageFi apkPickerPage = _TranslationsApkPickerPageFi._(_root);
  @override
  late final _TranslationsSelectedFilesPageFi selectedFilesPage = _TranslationsSelectedFilesPageFi._(_root);
  @override
  late final _TranslationsReceivePageFi receivePage = _TranslationsReceivePageFi._(_root);
  @override
  late final _TranslationsReceiveOptionsPageFi receiveOptionsPage = _TranslationsReceiveOptionsPageFi._(_root);
  @override
  late final _TranslationsSendPageFi sendPage = _TranslationsSendPageFi._(_root);
  @override
  late final _TranslationsProgressPageFi progressPage = _TranslationsProgressPageFi._(_root);
  @override
  late final _TranslationsWebSharePageFi webSharePage = _TranslationsWebSharePageFi._(_root);
  @override
  late final _TranslationsAboutPageFi aboutPage = _TranslationsAboutPageFi._(_root);
  @override
  late final _TranslationsDonationPageFi donationPage = _TranslationsDonationPageFi._(_root);
  @override
  late final _TranslationsChangelogPageFi changelogPage = _TranslationsChangelogPageFi._(_root);
  @override
  late final _TranslationsAliasGeneratorFi aliasGenerator = _TranslationsAliasGeneratorFi._(_root);
  @override
  late final _TranslationsDialogsFi dialogs = _TranslationsDialogsFi._(_root);
  @override
  late final _TranslationsSanitizationFi sanitization = _TranslationsSanitizationFi._(_root);
  @override
  late final _TranslationsTrayFi tray = _TranslationsTrayFi._(_root);
  @override
  late final _TranslationsWebFi web = _TranslationsWebFi._(_root);
  @override
  late final _TranslationsAssetPickerFi assetPicker = _TranslationsAssetPickerFi._(_root);
}

// Path: general
class _TranslationsGeneralFi extends TranslationsGeneralEn {
  _TranslationsGeneralFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Hyväksy';
  @override
  String get accepted => 'Hyväksytty';
  @override
  String get add => 'Lisää';
  @override
  String get advanced => 'Edistynyt';
  @override
  String get cancel => 'Peruuta';
  @override
  String get close => 'Sulje';
  @override
  String get confirm => 'Vahvista';
  @override
  String get continueStr => 'Jatka';
  @override
  String get copy => 'Kopioi';
  @override
  String get copiedToClipboard => 'Kopioitu leikepöydälle';
  @override
  String get decline => 'Hylkää';
  @override
  String get done => 'Valmis';
  @override
  String get delete => 'Poista';
  @override
  String get edit => 'Muokkaa';
  @override
  String get error => 'Virhe';
  @override
  String get example => 'Esimerkki';
  @override
  String get files => 'Tiedostot';
  @override
  String get finished => 'Valmis';
  @override
  String get hide => 'Piilota';
  @override
  String get off => 'Pois';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Päällä';
  @override
  String get online => 'Online';
  @override
  String get open => 'Avaa';
  @override
  String get queue => 'Jono';
  @override
  String get quickSave => 'Pikatallennus';
  @override
  String get quickSaveFromFavorites => 'Pikatallennus suosikeiksi';
  @override
  String get renamed => 'Nimetty uudelleen';
  @override
  String get reset => 'Nollaa';
  @override
  String get restart => 'Käynnistä uudelleen';
  @override
  String get settings => 'Asetukset';
  @override
  String get skipped => 'Ohitettu';
  @override
  String get start => 'Aloita';
  @override
  String get stop => 'Pysäytä';
  @override
  String get save => 'Tallenna';
  @override
  String get unchanged => 'Muuttumaton';
  @override
  String get unknown => 'Tuntematon';
  @override
  String get noItemInClipboard => 'Leikepöydällä ei ole mitään';
}

// Path: receiveTab
class _TranslationsReceiveTabFi extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ota Vastaan';
  @override
  late final _TranslationsReceiveTabInfoBoxFi infoBox = _TranslationsReceiveTabInfoBoxFi._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveFi quickSave = _TranslationsReceiveTabQuickSaveFi._(_root);
}

// Path: sendTab
class _TranslationsSendTabFi extends TranslationsSendTabEn {
  _TranslationsSendTabFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lähetä';
  @override
  late final _TranslationsSendTabSelectionFi selection = _TranslationsSendTabSelectionFi._(_root);
  @override
  late final _TranslationsSendTabPickerFi picker = _TranslationsSendTabPickerFi._(_root);
  @override
  String get shareIntentInfo => 'Sinä voit myös käyttää laitteesi "Jaa"-toimintoa valitaksesi tiedostoja helpommin.';
  @override
  String get nearbyDevices => 'Lähellä olevat laitteet';
  @override
  String get thisDevice => 'Tämä laite';
  @override
  String get scan => 'Etsi laitteita';
  @override
  String get manualSending => 'Manuaalinen lähetys';
  @override
  String get sendMode => 'Lähetystapa';
  @override
  late final _TranslationsSendTabSendModesFi sendModes = _TranslationsSendTabSendModesFi._(_root);
  @override
  String get sendModeHelp => 'Selitys';
  @override
  String get help => 'Varmista, että haluttu kohde on myös samassa Wi-Fi-verkossa.';
  @override
  String get placeItems => 'Lissä tiedostot tähän, jakaaksesi ne.';
}

// Path: settingsTab
class _TranslationsSettingsTabFi extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Asetukset';
  @override
  late final _TranslationsSettingsTabGeneralFi general = _TranslationsSettingsTabGeneralFi._(_root);
  @override
  late final _TranslationsSettingsTabReceiveFi receive = _TranslationsSettingsTabReceiveFi._(_root);
  @override
  late final _TranslationsSettingsTabSendFi send = _TranslationsSettingsTabSendFi._(_root);
  @override
  late final _TranslationsSettingsTabNetworkFi network = _TranslationsSettingsTabNetworkFi._(_root);
  @override
  late final _TranslationsSettingsTabOtherFi other = _TranslationsSettingsTabOtherFi._(_root);
  @override
  String get advancedSettings => 'Edistyneet asetukset';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageFi extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ongelmanratkaisu';
  @override
  String get subTitle => 'Eikö sovellus toimi odotetusti? Täältä löydät joitain yleisiä ratkaisuja.';
  @override
  String get solution => 'Ratkaisu:';
  @override
  String get fixButton => 'Automaattinen korjaus';
  @override
  late final _TranslationsTroubleshootPageFirewallFi firewall = _TranslationsTroubleshootPageFirewallFi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryFi noDiscovery = _TranslationsTroubleshootPageNoDiscoveryFi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionFi noConnection = _TranslationsTroubleshootPageNoConnectionFi._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageFi extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historia';
  @override
  String get openFolder => 'Avaa kansio';
  @override
  String get deleteHistory => 'Poista historia';
  @override
  String get empty => 'Historia on tyhjä.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsFi entryActions = _TranslationsReceiveHistoryPageEntryActionsFi._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageFi extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sovellukset (APK)';
  @override
  String get excludeSystemApps => 'lukuun ottamatta järjestelmäsovelluksia';
  @override
  String get excludeAppsWithoutLaunchIntent => 'lukuun ottamatta sovelluksia, joilla ei ole käynnistysintentiota';
  @override
  String apps({required Object n}) => '${n} sovellusta';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageFi extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Poista kaikki';
}

// Path: receivePage
class _TranslationsReceivePageFi extends TranslationsReceivePageEn {
  _TranslationsReceivePageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(
    n,
    one: 'haluaa lähettää sinulle tiedoston',
    other: 'haluaa lähettää sinulle ${n} tiedostoa',
  );
  @override
  String get subTitleMessage => 'lähetti sinulle viestin:';
  @override
  String get subTitleLink => 'lähetti sinulle linkin:';
  @override
  String get canceled => 'Lähettäjä on peruuttanut pyynnön.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageFi extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Asetukset';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-kansio)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Poistettu käytöstä automaattisesti, koska hakemistoja on olemassa.';
}

// Path: sendPage
class _TranslationsSendPageFi extends TranslationsSendPageEn {
  _TranslationsSendPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Odotetaan vastausta...';
  @override
  String get rejected => 'Vastaanottaja on hylännyt pyynnön.';
  @override
  String get busy => 'Vastaanottaja käsittelee toista pyyntöä.';
}

// Path: progressPage
class _TranslationsProgressPageFi extends TranslationsProgressPageEn {
  _TranslationsProgressPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Tiedostojen lähetys';
  @override
  String get titleReceiving => 'Tiedostojen vastaanotto';
  @override
  String get savedToGallery => 'Tallennettu Kuvat-kansioon';
  @override
  late final _TranslationsProgressPageTotalFi total = _TranslationsProgressPageTotalFi._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageFi extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Jaa linkin kautta';
  @override
  String get loading => 'Palvelimen käynnistys...';
  @override
  String get stopping => 'Palvelimen pysäytys...';
  @override
  String get error => 'Palvelimen käynnistyksessä tapahtui virhe.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(
    n,
    one: 'Avaa tämä linkki selaimessasi:',
    other: 'Avaa jokin näistä linkeistä selaimessasi:',
  );
  @override
  String get requests => 'Pyyntöjä';
  @override
  String get noRequests => 'Ei pyyntöjä vielä.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Hyväksy pyynnöt automaattisesti';
  @override
  String get requirePin => 'Vaadi PIN';
  @override
  String pinHint({required Object pin}) => 'PIN-koodi on "${pin}"';
  @override
  String get encryptionHint => 'LocalSend käyttää itse allekirjoitettua sertifikaattia. Sinun on hyväksyttävä se selaimessasi.';
  @override
  String pendingRequests({required Object n}) => 'Odottavat pyynnöt: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageFi extends TranslationsAboutPageEn {
  _TranslationsAboutPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tietoja LocalSendista';
  @override
  List<String> get description => [
    'LocalSend on ilmainen, avoimen lähdekoodin sovellus, jonka avulla voit turvallisesti jakaa tiedostoja ja viestejä läheisten laitteiden kanssa paikallisverkossasi ilman internet-yhteyttä.',
    'Tämä sovellus on saatavilla Androidille, iOS:lle, macOS:lle, Windowsille ja Linuxille. Kaikki latausvaihtoehdot löytyvät virallisilta kotisivuilta.',
  ];
  @override
  String get author => 'Tekijä';
  @override
  String get contributors => 'Avustajat';
  @override
  String get packagers => 'Pakkaajat';
  @override
  String get translators => 'Kääntäjät';
}

// Path: donationPage
class _TranslationsDonationPageFi extends TranslationsDonationPageEn {
  _TranslationsDonationPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lahjoita';
  @override
  String get info =>
      'LocalSend on ilmainen, avoimen lähdekoodin sovellus ilman mainoksia. Jos pidät sovelluksesta, voit tukea kehitystä lahjoituksella.';
  @override
  String donate({required Object amount}) => 'Lahjoita ${amount}';
  @override
  String get thanks => 'Suurkiitokset!';
  @override
  String get restore => 'Palauta ostos';
}

// Path: changelogPage
class _TranslationsChangelogPageFi extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muutosloki';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorFi extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Stydi',
    'Jämä',
    'Raju',
    'Makee',
    'Siisti',
    'Kummallinen',
    'Hurja',
    'Hörisevä',
    'Naurava',
    'Suriseva',
    'Pöhelö',
    'Hölmö',
    'Spede',
    'Kummallinen',
    'Rampainen',
    'Jonne',
    'Lössi',
    'Kuuli',
    'Aukiva',
    'Lutsi',
    'Wallahi',
    'Pummi',
    'Köyhä',
    'Saunassa käyvä',
    'Bulkki',
    'Chilli',
    'Dokkaava',
    'Känni',
    'Broidi',
    'Kundi',
    'Göntsä',
    'Pelleilevä',
    'Haiseva',
    'Hakkeri',
  ];
  @override
  List<String> get fruits => [
    'Omena',
    'Banaani',
    'Appelsiini',
    'Mango',
    'Päärynä',
    'Kiivi',
    'Kirsikka',
    'Vadelma',
    'Mustikka',
    'Mansikka',
    'Luumu',
    'Persikka',
    'Punaherukka',
    'Mustaherukka',
    'Karhunvatukka',
    'Vesimeloni',
    'Hedelmä',
    'Päärynä',
    'Pihlajanmarja',
    'Karpalo',
    'Puolukka',
    'Lakka',
    'Kuusenkerkkä',
    'Kataja',
    'Kuusama',
    'Ananas',
    'Granaattiomena',
    'Sitruuna',
    'Lime',
    'Papaija',
    'Passionhedelmä',
    'Pomelo',
    'Kiinalainen karviainen',
    'Lychee',
    'Taateli',
    'Viikuna',
    'Rypäle',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsFi extends TranslationsDialogsEn {
  _TranslationsDialogsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileFi addFile = _TranslationsDialogsAddFileFi._(_root);
  @override
  late final _TranslationsDialogsOpenFileFi openFile = _TranslationsDialogsOpenFileFi._(_root);
  @override
  late final _TranslationsDialogsAddressInputFi addressInput = _TranslationsDialogsAddressInputFi._(_root);
  @override
  late final _TranslationsDialogsCancelSessionFi cancelSession = _TranslationsDialogsCancelSessionFi._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileFi cannotOpenFile = _TranslationsDialogsCannotOpenFileFi._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeFi encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeFi._(_root);
  @override
  late final _TranslationsDialogsErrorDialogFi errorDialog = _TranslationsDialogsErrorDialogFi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogFi favoriteDialog = _TranslationsDialogsFavoriteDialogFi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogFi favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogFi._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogFi favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogFi._(_root);
  @override
  late final _TranslationsDialogsFileInfoFi fileInfo = _TranslationsDialogsFileInfoFi._(_root);
  @override
  late final _TranslationsDialogsFileNameInputFi fileNameInput = _TranslationsDialogsFileNameInputFi._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogFi historyClearDialog = _TranslationsDialogsHistoryClearDialogFi._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedFi localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedFi._(_root);
  @override
  late final _TranslationsDialogsMessageInputFi messageInput = _TranslationsDialogsMessageInputFi._(_root);
  @override
  late final _TranslationsDialogsNoFilesFi noFiles = _TranslationsDialogsNoFilesFi._(_root);
  @override
  late final _TranslationsDialogsNoPermissionFi noPermission = _TranslationsDialogsNoPermissionFi._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformFi notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformFi._(_root);
  @override
  late final _TranslationsDialogsQrFi qr = _TranslationsDialogsQrFi._(_root);
  @override
  late final _TranslationsDialogsQuickActionsFi quickActions = _TranslationsDialogsQuickActionsFi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeFi quickSaveNotice = _TranslationsDialogsQuickSaveNoticeFi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeFi quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeFi._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinFi pin = _TranslationsDialogsPinFi._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpFi sendModeHelp = _TranslationsDialogsSendModeHelpFi._(_root);
  @override
  late final _TranslationsDialogsZoomFi zoom = _TranslationsDialogsZoomFi._(_root);
}

// Path: sanitization
class _TranslationsSanitizationFi extends TranslationsSanitizationEn {
  _TranslationsSanitizationFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Tiedostonimi ei voi olla tyhjä';
  @override
  String get invalid => 'Tiedostonimi sisältää kiellettyjä merkkejä';
}

// Path: tray
class _TranslationsTrayFi extends TranslationsTrayEn {
  _TranslationsTrayFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Avaa';
  @override
  String get close => 'Lopeta LocalSend';
  @override
  String get closeWindows => 'Poistu';
}

// Path: web
class _TranslationsWebFi extends TranslationsWebEn {
  _TranslationsWebFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Odotetaan vastausta...';
  @override
  String get enterPin => 'Syötä PIN-koodi';
  @override
  String get invalidPin => 'Virheellinen PIN-koodi';
  @override
  String get tooManyAttempts => 'Liian monta yritystä';
  @override
  String get rejected => 'Hylätty';
  @override
  String get files => 'Tiedostot';
  @override
  String get fileName => 'Tiedoston nimi';
  @override
  String get size => 'Koko';
}

// Path: assetPicker
class _TranslationsAssetPickerFi extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Vahvista';
  @override
  String get cancel => 'Peruuta';
  @override
  String get edit => 'Muokkaa';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Lataus epäonnistui';
  @override
  String get original => 'Alkuperäinen';
  @override
  String get preview => 'Esikatselu';
  @override
  String get select => 'Valitse';
  @override
  String get emptyList => 'Tyhjä lista';
  @override
  String get unSupportedAssetType => 'Tiedostotyyppiä ei tueta.';
  @override
  String get unableToAccessAll => 'Kaikkien tiedostojen käyttö laitteella ei onnistu';
  @override
  String get viewingLimitedAssetsTip => 'Näytä vain sovelluksen käyttöön saatavilla olevat tiedostot ja albumit.';
  @override
  String get changeAccessibleLimitedAssets => 'Päivitä käytettävissä olevat tiedostot napsauttamalla';
  @override
  String get accessAllTip =>
      'Sovellus pääsee käsiksi vain osaan laitteen tiedostoista. Siirry järjestelmäasetuksiin ja salli sovelluksen pääsy kaikkiin laitteen mediaan.';
  @override
  String get goToSystemSettings => 'Siirry järjestelmäasetuksiin';
  @override
  String get accessLimitedAssets => 'Jatka rajoitetulla pääsyllä';
  @override
  String get accessiblePathName => 'Käytettävissä olevat tiedostot';
  @override
  String get sTypeAudioLabel => 'Ääni';
  @override
  String get sTypeImageLabel => 'Kuva';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Muut mediat';
  @override
  String get sActionPlayHint => 'toista';
  @override
  String get sActionPreviewHint => 'esikatsele';
  @override
  String get sActionSelectHint => 'valitse';
  @override
  String get sActionSwitchPathLabel => 'vaihda polkua';
  @override
  String get sActionUseCameraHint => 'käytä kameraa';
  @override
  String get sNameDurationLabel => 'kesto';
  @override
  String get sUnitAssetCountLabel => 'määrä';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxFi extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Portti:';
  @override
  String get alias => 'Laitteen nimi:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveFi extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get favorites => 'Suosikit';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionFi extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Valinta';
  @override
  String files({required Object files}) => 'Tiedostot: ${files}';
  @override
  String size({required Object size}) => 'Koko: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerFi extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Tiedosto';
  @override
  String get folder => 'Kansio';
  @override
  String get media => 'Media';
  @override
  String get text => 'Teksti';
  @override
  String get app => 'Sovellus';
  @override
  String get clipboard => 'Liitä';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesFi extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Yksi vastaanottaja';
  @override
  String get multiple => 'Monta vastaanottajaa';
  @override
  String get link => 'Jaa linkillä';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralFi extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yleinen';
  @override
  String get brightness => 'Teema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsFi brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsFi._(_root);
  @override
  String get color => 'Väri';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsFi colorOptions = _TranslationsSettingsTabGeneralColorOptionsFi._(_root);
  @override
  String get language => 'Kieli';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsFi languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsFi._(_root);
  @override
  String get saveWindowPlacement => 'Poistu: Tallenna ikkunan sijainti';
  @override
  String get saveWindowPlacementWindows => 'Tallenna ikkunan sijainti poistumisen jälkeen';
  @override
  String get minimizeToTray => 'Poistu: Minimoi ilmoitusalueelle';
  @override
  String get launchAtStartup => 'Automaattinen käynnistys';
  @override
  String get launchMinimized => 'Automaattinen käynnistys: Käynnistä piiilotettuna';
  @override
  String get showInContextMenu => 'Näytä LocalSend kontekstivalikossa';
  @override
  String get animations => 'Animaatiot';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveFi extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vastaanotto';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get autoFinish => 'Automaattinen lopetus';
  @override
  String get destination => 'Kohde';
  @override
  String get downloads => '(Lataukset)';
  @override
  String get saveToGallery => 'Tallenna media galleriaan';
  @override
  String get saveToHistory => 'Tallenna historiaan';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendFi extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lähetys';
  @override
  String get shareViaLinkAutoAccept => 'Jaa linkki: Hyväksy automaattisesti';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkFi extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verkko';
  @override
  String get needRestart => 'Uudelleenkäynnistä palvelin ottaaksesi asetukset käyttöön!';
  @override
  String get server => 'Palvelin';
  @override
  String get alias => 'Laitteen nimi';
  @override
  String get deviceType => 'Laitteen tyyppi';
  @override
  String get deviceModel => 'Laitteen malli';
  @override
  String get port => 'Portti';
  @override
  String get discoveryTimeout => 'Laitteiden etsintäaika';
  @override
  String get useSystemName => 'Käytä järjestelmän nimeä';
  @override
  String get generateRandomAlias => 'Luo satunnainen alias';
  @override
  String portWarning({required Object defaultPort}) =>
      'Sinua ei ehkä havaita muiden laitteiden toimesta, koska käytät mukautettua porttia. (oletus: ${defaultPort})';
  @override
  String get encryption => 'Salaus';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Sinua ei ehkä havaita muiden laitteiden toimesta, koska käytät mukautettua multicast-osoitetta. (oletus: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherFi extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muut';
  @override
  String get support => 'Tue LocalSendia';
  @override
  String get donate => 'Lahjoita';
  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';
  @override
  String get termsOfUse => 'Käyttöehdot';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallFi extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Tämä sovellus voi lähettää tiedostoja muihin laitteisiin; mutta muut laitteet eivät voi lähettää tiedostoja tähän laitteeseen.';
  @override
  String solution({required Object port}) =>
      'Tämä on todennäköisesti palomuuriongelma. Voit ratkaista tämän sallimalla saapuvat yhteydet (UDP ja TCP) porttiin ${port}.';
  @override
  String get openFirewallSettings => 'Avaa palomuuri';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryFi extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Tämä laite ei pysty löytämään muita laitteita.';
  @override
  String get solution =>
      'Varmista, että kaikki laitteet ovat samassa Wi-Fi-verkossa ja jakavat saman kokoonpanon (portti, monilähetysosoite, salaus). Voit yrittää kirjoittaa kohdelaitteen IP-osoitteen manuaalisesti. Jos tämä toimii, harkitse tämän laitteen lisäämistä suosikkeihin, jotta se voidaan löytää automaattisesti tulevaisuudessa.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionFi extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Molemmat laitteet eivät voi löytää toisiaan eivätkä jakaa tiedostoja.';
  @override
  String get solution =>
      'Onko ongelma olemassa molemmin puolin? Jos on, sinun on varmistettava, että molemmat laitteet ovat samassa Wi-Fi-verkossa ja jakavat saman kokoonpanon (portti, multicast-osoite, salaus). Verkko ei ehkä salli viestintää osallistujien välillä. Tässä tapauksessa tämä vaihtoehto on otettava käyttöön reitittimessä.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsFi extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Avaa tiedosto';
  @override
  String get showInFolder => 'Näytä kansiossa';
  @override
  String get info => 'Tiedot';
  @override
  String get deleteFromHistory => 'Poista historiasta';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalFi extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleFi title = _TranslationsProgressPageTotalTitleFi._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Tiedostoja: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Koko: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Nopeus: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileFi extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lisää valintaan';
  @override
  String get content => 'Mitä haluat lisätä?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileFi extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Avaa tiedosto';
  @override
  String get content => 'Haluatko avata vastaanotetun tiedoston?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputFi extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Anna osoite';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP-osoite';
  @override
  String get recentlyUsed => 'Äskettäin käytetty: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionFi extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Peruuta tiedostonsiirto';
  @override
  String get content => 'Haluatko varmasti peruuttaa tiedostonsiirron?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileFi extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tiedostoa ei voi avata';
  @override
  String content({required Object file}) => 'Tiedostoa "${file}" ei voitu avata. Onko tämä tiedosto siirretty, nimetty uudelleen tai poistettu?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeFi extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Salaus poistettu käytöstä';
  @override
  String get content => 'Viestintä tapahtuu nyt salaamattoman HTTP-protokollan kautta. Jos haluat käyttää HTTPS:ää, ota salaus uudelleen käyttöön.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogFi extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogFi extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Suosikit';
  @override
  String get noFavorites => 'Ei suosikkilaitteita vielä.';
  @override
  String get addFavorite => 'Lisää';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogFi extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Poista suosikeista';
  @override
  String content({required Object name}) => 'Haluatko varmasti poistaa suosikeista "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogFi extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Lisää suosikkeihin';
  @override
  String get titleEdit => 'Asetukset';
  @override
  String get name => 'Laitteen nimi';
  @override
  String get auto => '(automaattinen)';
  @override
  String get ip => 'IP-osoite';
  @override
  String get port => 'Portti';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoFi extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tiedoston tiedot';
  @override
  String get fileName => 'Tiedoston nimi:';
  @override
  String get path => 'Polku:';
  @override
  String get size => 'Koko:';
  @override
  String get sender => 'Lähettäjä:';
  @override
  String get time => 'Aika:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputFi extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Anna tiedoston nimi';
  @override
  String original({required Object original}) => 'Alkuperäinen: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogFi extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tyhjennä historia';
  @override
  String get content => 'Haluatko varmasti poistaa koko historian?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedFi extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend ei löydä muita laitteita ilman lupaa skannata paikallisverkkoa. Anna tämä lupa asetuksissa.';
  @override
  String get gotoSettings => 'Asetukset';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputFi extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirjoita viesti';
  @override
  String get multiline => 'Monirivinen';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesFi extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei tiedostoa valittuna';
  @override
  String get content => 'Valitse vähintään yksi tiedosto.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionFi extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei oikeuksia';
  @override
  String get content => 'Et ole myöntänyt tarvittavia oikeuksia. Myönnä ne asetuksissa.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformFi extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei saatavilla';
  @override
  String get content => 'Tämä ominaisuus on saatavilla vain:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrFi extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-koodi';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsFi extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pikatoiminnot';
  @override
  String get counter => 'Laskuri';
  @override
  String get prefix => 'Etuliite';
  @override
  String get padZero => 'Täytä nollilla';
  @override
  String get sortBeforeCount => 'Lajittele aakkosjärjestykseen ennen laskentaa';
  @override
  String get random => 'Satunnainen';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeFi extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pikatallennus';
  @override
  String get content => 'Tiedostopyynnöt hyväksytään automaattisesti. Huomaa, että kuka tahansa paikallisverkossa voi lähettää sinulle tiedostoja.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeFi extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'Tiedostopyynnöt hyväksytään nyt automaattisesti suosikkiluettelossasi olevilta laitteilta.',
    'Varoitus! Tällä hetkellä tämä ei ole täysin turvallista, koska hakkeri, jolla on minkä tahansa suosikkiluettelosi laitteen sormenjälki, voi lähettää sinulle tiedostoja ilman rajoituksia.',
    'Tämä vaihtoehto on kuitenkin turvallisempi kuin sallia kaikkien paikallisverkon käyttäjien lähettää sinulle tiedostoja ilman rajoituksia.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinFi extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Syötä PIN-koodi';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpFi extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lähetystilat';
  @override
  String get single => 'Lähettää tiedostoja yhdelle vastaanottajalle. Valinta tyhjennetään tiedostonsiirron päätyttyä.';
  @override
  String get multiple => 'Lähettää tiedostoja useille vastaanottajille. Valinta ei tyhjene.';
  @override
  String get link => 'Vastaanottajat, joilla ei ole LocalSendia asennettuna, voivat ladata valitut tiedostot avaamalla linkin selaimessaan.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomFi extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsFi extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Järjestelmä';
  @override
  String get dark => 'Tumma';
  @override
  String get light => 'Vaalea';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsFi extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Järjestelmä';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsFi extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Järjestelmä';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleFi extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleFi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Edistyminen yhteensä (${time})';
  @override
  String get finishedError => 'Päättynyt virheellä';
  @override
  String get canceledSender => 'Lähettäjä peruutti';
  @override
  String get canceledReceiver => 'Vastaanottaja peruutti';
}
