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
class TranslationsFi extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFi({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsFi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFi(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Finnish';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$fi general = _Translations$general$fi._(_root);
  @override
  late final _Translations$receiveTab$fi receiveTab = _Translations$receiveTab$fi._(_root);
  @override
  late final _Translations$sendTab$fi sendTab = _Translations$sendTab$fi._(_root);
  @override
  late final _Translations$settingsTab$fi settingsTab = _Translations$settingsTab$fi._(_root);
  @override
  late final _Translations$troubleshootPage$fi troubleshootPage = _Translations$troubleshootPage$fi._(_root);
  @override
  late final _Translations$receiveHistoryPage$fi receiveHistoryPage = _Translations$receiveHistoryPage$fi._(_root);
  @override
  late final _Translations$apkPickerPage$fi apkPickerPage = _Translations$apkPickerPage$fi._(_root);
  @override
  late final _Translations$selectedFilesPage$fi selectedFilesPage = _Translations$selectedFilesPage$fi._(_root);
  @override
  late final _Translations$receivePage$fi receivePage = _Translations$receivePage$fi._(_root);
  @override
  late final _Translations$receiveOptionsPage$fi receiveOptionsPage = _Translations$receiveOptionsPage$fi._(_root);
  @override
  late final _Translations$sendPage$fi sendPage = _Translations$sendPage$fi._(_root);
  @override
  late final _Translations$progressPage$fi progressPage = _Translations$progressPage$fi._(_root);
  @override
  late final _Translations$webSharePage$fi webSharePage = _Translations$webSharePage$fi._(_root);
  @override
  late final _Translations$aboutPage$fi aboutPage = _Translations$aboutPage$fi._(_root);
  @override
  late final _Translations$donationPage$fi donationPage = _Translations$donationPage$fi._(_root);
  @override
  late final _Translations$changelogPage$fi changelogPage = _Translations$changelogPage$fi._(_root);
  @override
  late final _Translations$aliasGenerator$fi aliasGenerator = _Translations$aliasGenerator$fi._(_root);
  @override
  late final _Translations$dialogs$fi dialogs = _Translations$dialogs$fi._(_root);
  @override
  late final _Translations$sanitization$fi sanitization = _Translations$sanitization$fi._(_root);
  @override
  late final _Translations$tray$fi tray = _Translations$tray$fi._(_root);
  @override
  late final _Translations$web$fi web = _Translations$web$fi._(_root);
  @override
  late final _Translations$assetPicker$fi assetPicker = _Translations$assetPicker$fi._(_root);
  @override
  late final _Translations$networkInterfacesPage$fi networkInterfacesPage = _Translations$networkInterfacesPage$fi._(_root);
}

// Path: general
class _Translations$general$fi extends Translations$general$en {
  _Translations$general$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
  String get noItemInClipboard => 'Leikepöydällä ei ole mitään.';
}

// Path: receiveTab
class _Translations$receiveTab$fi extends Translations$receiveTab$en {
  _Translations$receiveTab$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ota vastaan';
  @override
  late final _Translations$receiveTab$infoBox$fi infoBox = _Translations$receiveTab$infoBox$fi._(_root);
  @override
  late final _Translations$receiveTab$quickSave$fi quickSave = _Translations$receiveTab$quickSave$fi._(_root);
}

// Path: sendTab
class _Translations$sendTab$fi extends Translations$sendTab$en {
  _Translations$sendTab$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lähetä';
  @override
  late final _Translations$sendTab$selection$fi selection = _Translations$sendTab$selection$fi._(_root);
  @override
  late final _Translations$sendTab$picker$fi picker = _Translations$sendTab$picker$fi._(_root);
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
  late final _Translations$sendTab$sendModes$fi sendModes = _Translations$sendTab$sendModes$fi._(_root);
  @override
  String get sendModeHelp => 'Selitys';
  @override
  String get help => 'Varmista, että haluttu kohde on myös samassa Wi-Fi-verkossa.';
  @override
  String get placeItems => 'Lisää tiedostot tähän, jotta voit lähettää ne.';
}

// Path: settingsTab
class _Translations$settingsTab$fi extends Translations$settingsTab$en {
  _Translations$settingsTab$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Asetukset';
  @override
  late final _Translations$settingsTab$general$fi general = _Translations$settingsTab$general$fi._(_root);
  @override
  late final _Translations$settingsTab$receive$fi receive = _Translations$settingsTab$receive$fi._(_root);
  @override
  late final _Translations$settingsTab$send$fi send = _Translations$settingsTab$send$fi._(_root);
  @override
  late final _Translations$settingsTab$network$fi network = _Translations$settingsTab$network$fi._(_root);
  @override
  late final _Translations$settingsTab$other$fi other = _Translations$settingsTab$other$fi._(_root);
  @override
  String get advancedSettings => 'Edistyneet asetukset';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$fi extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$fi firewall = _Translations$troubleshootPage$firewall$fi._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$fi noDiscovery = _Translations$troubleshootPage$noDiscovery$fi._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$fi noConnection = _Translations$troubleshootPage$noConnection$fi._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$fi extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historia';
  @override
  String get openFolder => 'Avaa kansio';
  @override
  String get deleteHistory => 'Tyhjennä historia';
  @override
  String get empty => 'Historia on tyhjä.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$fi entryActions = _Translations$receiveHistoryPage$entryActions$fi._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$fi extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$fi extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Poista kaikki';
}

// Path: receivePage
class _Translations$receivePage$fi extends Translations$receivePage$en {
  _Translations$receivePage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(
    n,
    one: 'on lähettämässä sinulle tiedostoa',
    other: 'on lähettämässä sinulle ${n} tiedostoa',
  );
  @override
  String get subTitleMessage => 'lähetti sinulle viestin:';
  @override
  String get subTitleLink => 'lähetti sinulle linkin:';
  @override
  String get canceled => 'Lähettäjä on peruuttanut pyynnön.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$fi extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Asetukset';
  @override
  String get destination => 'Vastaanottoasetukset';
  @override
  String get appDirectory => '(LocalSend-kansio)';
  @override
  String get saveToGallery => 'Tallenna galleriaan';
  @override
  String get saveToGalleryOff => 'Poistettu käytöstä automaattisesti, koska lähetetyissä tiedostoissa on kansioita.';
}

// Path: sendPage
class _Translations$sendPage$fi extends Translations$sendPage$en {
  _Translations$sendPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Odotetaan vastausta...';
  @override
  String get rejected => 'Vastaanottaja on peruuttanut pyynnön.';
  @override
  String get busy => 'Vastaanottaja vastaanottaa toista pyyntöä.';
  @override
  String get tooManyAttempts => 'Liian monta yritystä';
}

// Path: progressPage
class _Translations$progressPage$fi extends Translations$progressPage$en {
  _Translations$progressPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Tiedostojen lähetys';
  @override
  String get titleReceiving => 'Tiedostojen vastaanotto';
  @override
  String get savedToGallery => 'Tallennettu Kuvat-kansioon';
  @override
  late final _Translations$progressPage$total$fi total = _Translations$progressPage$total$fi._(_root);
  @override
  late final _Translations$progressPage$remainingTime$fi remainingTime = _Translations$progressPage$remainingTime$fi._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$fi extends Translations$webSharePage$en {
  _Translations$webSharePage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Jaa linkin kautta';
  @override
  String get loading => 'Käynnistetään palvelinta…';
  @override
  String get stopping => 'Pysäytetään palvelinta…';
  @override
  String get error => 'Palvelimen käynnistyksessä tapahtui virhe.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(
    n,
    one: 'Avaa tämä linkki selaimessasi:',
    other: 'Avaa jokin näistä linkeistä selaimessasi:',
  );
  @override
  String get requests => 'Pyynnöt';
  @override
  String get noRequests => 'Ei pyyntöjä vielä.';
  @override
  String get encryption => 'Verkon salaus';
  @override
  String get autoAccept => 'Hyväksy pyynnöt automaattisesti';
  @override
  String get requirePin => 'Vaadi PIN-koodi';
  @override
  String pinHint({required Object pin}) => 'PIN-koodi on "${pin}"';
  @override
  String get encryptionHint => 'LocalSend käyttää itse allekirjoitettua sertifikaattia. Sinun on hyväksyttävä se selaimessasi.';
  @override
  String pendingRequests({required Object n}) => 'Odottavat pyynnöt: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$fi extends Translations$aboutPage$en {
  _Translations$aboutPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tietoja LocalSendista';
  @override
  List<String> get description => [
    'LocalSend on ilmainen, avoimen lähdekoodin sovellus, jonka avulla voit turvallisesti jakaa tiedostoja ja lähettää viestejä läheisten laitteiden kanssa paikallisessa verkossasi ilman internet-yhteyttä.',
    'LocalSend on saatavilla Androidille, iOS:lle, Linuxille, macOS:lle ja Windowsille. Kaikki latausvaihtoehdot löytyvät virallisilta kotisivuilta.',
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
class _Translations$donationPage$fi extends Translations$donationPage$en {
  _Translations$donationPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lahjoita';
  @override
  String get info =>
      'LocalSend on ilmainen, avoimen lähdekoodin sovellus ilman mainoksia. Voit tukea projektia lahjoituksella, jos pidät sovelluksesta.';
  @override
  String donate({required Object amount}) => 'Lahjoita ${amount}';
  @override
  String get thanks => 'Suuret kiitokset!';
  @override
  String get restore => 'Palauta ostos';
}

// Path: changelogPage
class _Translations$changelogPage$fi extends Translations$changelogPage$en {
  _Translations$changelogPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muutosloki';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$fi extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fi extends Translations$dialogs$en {
  _Translations$dialogs$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$fi addFile = _Translations$dialogs$addFile$fi._(_root);
  @override
  late final _Translations$dialogs$openFile$fi openFile = _Translations$dialogs$openFile$fi._(_root);
  @override
  late final _Translations$dialogs$addressInput$fi addressInput = _Translations$dialogs$addressInput$fi._(_root);
  @override
  late final _Translations$dialogs$cancelSession$fi cancelSession = _Translations$dialogs$cancelSession$fi._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$fi cannotOpenFile = _Translations$dialogs$cannotOpenFile$fi._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$fi encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$fi._(_root);
  @override
  late final _Translations$dialogs$errorDialog$fi errorDialog = _Translations$dialogs$errorDialog$fi._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$fi favoriteDialog = _Translations$dialogs$favoriteDialog$fi._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$fi favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$fi._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$fi favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$fi._(_root);
  @override
  late final _Translations$dialogs$fileInfo$fi fileInfo = _Translations$dialogs$fileInfo$fi._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$fi fileNameInput = _Translations$dialogs$fileNameInput$fi._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$fi historyClearDialog = _Translations$dialogs$historyClearDialog$fi._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$fi localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$fi._(_root);
  @override
  late final _Translations$dialogs$messageInput$fi messageInput = _Translations$dialogs$messageInput$fi._(_root);
  @override
  late final _Translations$dialogs$noFiles$fi noFiles = _Translations$dialogs$noFiles$fi._(_root);
  @override
  late final _Translations$dialogs$noPermission$fi noPermission = _Translations$dialogs$noPermission$fi._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$fi notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$fi._(_root);
  @override
  late final _Translations$dialogs$qr$fi qr = _Translations$dialogs$qr$fi._(_root);
  @override
  late final _Translations$dialogs$quickActions$fi quickActions = _Translations$dialogs$quickActions$fi._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$fi quickSaveNotice = _Translations$dialogs$quickSaveNotice$fi._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$fi quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$fi._(_root);
  @override
  late final _Translations$dialogs$pin$fi pin = _Translations$dialogs$pin$fi._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$fi sendModeHelp = _Translations$dialogs$sendModeHelp$fi._(_root);
  @override
  late final _Translations$dialogs$zoom$fi zoom = _Translations$dialogs$zoom$fi._(_root);
}

// Path: sanitization
class _Translations$sanitization$fi extends Translations$sanitization$en {
  _Translations$sanitization$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Tiedostonimi ei voi olla tyhjä';
  @override
  String get invalid => 'Tiedostonimi sisältää kiellettyjä merkkejä';
}

// Path: tray
class _Translations$tray$fi extends Translations$tray$en {
  _Translations$tray$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$web$fi extends Translations$web$en {
  _Translations$web$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$fi extends Translations$assetPicker$en {
  _Translations$assetPicker$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$fi extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verkkokäyttöliittymät';
  @override
  String get info =>
      'Oletuksena LocalSend käyttää kaikkia saatavilla olevia verkkoliitäntöjä. Voit sulkea pois verkkoliitännät, joita et halua. Sinun tulee uudelleenkäynnistää LocalSend ottaaksesi muutokset käyttöön.';
  @override
  String get preview => 'Esikatselu';
  @override
  String get whitelist => 'Sallittujen lista';
  @override
  String get blacklist => 'Estettyjen lista';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$fi extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP-osoite:';
  @override
  String get port => 'Portti:';
  @override
  String get alias => 'Laitteen nimi:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$fi extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get favorites => 'Suosikit';
  @override
  String get off => _root.general.off;
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$fi extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$fi extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$fi extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$fi extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yleinen';
  @override
  String get brightness => 'Teema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$fi brightnessOptions = _Translations$settingsTab$general$brightnessOptions$fi._(
    _root,
  );
  @override
  String get color => 'Väri';
  @override
  late final _Translations$settingsTab$general$colorOptions$fi colorOptions = _Translations$settingsTab$general$colorOptions$fi._(_root);
  @override
  String get language => 'Kieli';
  @override
  late final _Translations$settingsTab$general$languageOptions$fi languageOptions = _Translations$settingsTab$general$languageOptions$fi._(_root);
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
class _Translations$settingsTab$receive$fi extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vastaanotto';
  @override
  String get quickSave => 'Automaattinen tallennus';
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
  @override
  String get quickSaveFromFavorites => 'Automaattinen tallennus suosikeista';
  @override
  String get requirePin => 'Kiinnitä';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$fi extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lähetys';
  @override
  String get shareViaLinkAutoAccept => 'Jaa linkki: Hyväksy automaattisesti';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$fi extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verkko';
  @override
  String get needRestart => 'Käynnistä LocalSend uudelleen saadaksesi muutokset käyttöön!';
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
  @override
  late final _Translations$settingsTab$network$networkOptions$fi networkOptions = _Translations$settingsTab$network$networkOptions$fi._(_root);
  @override
  String get network => 'Verkko';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$fi extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$fi extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Tämä sovellus voi lähettää tiedostoja muihin laitteisiin, mutta muut laitteet eivät voi lähettää tiedostoja tähän laitteeseen.';
  @override
  String solution({required Object port}) =>
      'Tämä on todennäköisesti palomuuriongelma. Voit ratkaista tämän sallimalla saapuvat yhteydet (UDP ja TCP) porttiin ${port}.';
  @override
  String get openFirewall => 'Avaa palomuuri';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$fi extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Tämä laite ei pysty löytämään muita laitteita.';
  @override
  String get solution =>
      'Varmista, että kaikki laitteet ovat samassa Wi-Fi-verkossa ja jakavat saman kokoonpanon (portti, monilähetysosoite, salaus). Voit yrittää kirjoittaa kohdelaitteen IP-osoitteen manuaalisesti. Jos tämä toimii, harkitse tämän laitteen lisäämistä suosikkeihin, jotta se voidaan löytää automaattisesti tulevaisuudessa.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$fi extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Molemmat laitteet eivät voi löytää toisiaan eivätkä jakaa tiedostoja.';
  @override
  String get solution =>
      'Onko ongelma olemassa molemmin puolin? Jos on, sinun on varmistettava, että molemmat laitteet ovat samassa Wi-Fi-verkossa ja jakavat saman kokoonpanon (portti, multicast-osoite, salaus). Verkko ei ehkä salli viestintää osallistujien välillä. Tässä tapauksessa tämä vaihtoehto on otettava käyttöön reitittimessä.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$fi extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$fi extends Translations$progressPage$total$en {
  _Translations$progressPage$total$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$fi title = _Translations$progressPage$total$title$fi._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Tiedostot: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Koko: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Nopeus: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$fi extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Käytä 'h' tuntien lyhenteenä ja 'm' minuuttien
  @override
  String hours({required Object h, required Object m}) => '${h}t ${m}m';

  /// Käytä 'pv' päiville, 'h' tunneille ja 'm' minuuteille
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}pv ${h}t ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$fi extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lisää valintaan';
  @override
  String get content => 'Mitä haluat lisätä?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$fi extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Avaa tiedosto';
  @override
  String get content => 'Haluatko avata vastaanotetun tiedoston?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$fi extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$fi extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Peruuta tiedostonsiirto';
  @override
  String get content => 'Haluatko varmasti peruuttaa tiedostonsiirron?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$fi extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tiedostoa ei voi avata';
  @override
  String content({required Object file}) => 'Tiedostoa "${file}" ei voitu avata. Onko tämä tiedosto siirretty, nimetty uudelleen tai poistettu?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$fi extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Salaus poistettu käytöstä';
  @override
  String get content => 'Viestintä tapahtuu nyt salaamattoman HTTP-protokollan kautta. Jos haluat käyttää HTTPS:ää, ota salaus uudelleen käyttöön.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$fi extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$fi extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$fi extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Poista suosikeista';
  @override
  String content({required Object name}) => 'Haluatko varmasti poistaa suosikeista "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$fi extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$fi extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$fi extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Anna tiedoston nimi';
  @override
  String original({required Object original}) => 'Alkuperäinen: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$fi extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tyhjennä historia';
  @override
  String get content => 'Haluatko varmasti poistaa koko historian?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$fi extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$fi extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirjoita viesti';
  @override
  String get multiline => 'Monirivinen';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$fi extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei tiedostoa valittuna';
  @override
  String get content => 'Valitse vähintään yksi tiedosto.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$fi extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei oikeuksia';
  @override
  String get content => 'Et ole myöntänyt tarvittavia oikeuksia. Myönnä ne asetuksissa.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$fi extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ei saatavilla';
  @override
  String get content => 'Tämä ominaisuus on saatavilla vain:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$fi extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-koodi';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$fi extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$fi extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pikatallennus';
  @override
  String get content => 'Tiedostopyynnöt hyväksytään automaattisesti. Huomaa, että kuka tahansa paikallisverkossa voi lähettää sinulle tiedostoja.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$fi extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'Tiedostopyynnöt hyväksytään nyt automaattisesti suosikkiluettelossasi olevilta laitteilta.',
    'Varoitus! Tällä hetkellä tämä ei ole täysin turvallista, koska hakkeri, jolla on minkä tahansa suosikkiluettelosi laitteen sormenjälki, voi lähettää sinulle tiedostoja ilman rajoituksia.',
    'Tämä vaihtoehto on kuitenkin turvallisempi kuin sallia kaikkien paikallisverkon käyttäjien lähettää sinulle tiedostoja ilman rajoituksia.',
  ];
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _Translations$dialogs$pin$fi extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Syötä PIN-koodi';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$fi extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$fi extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$fi extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$fi extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Järjestelmä';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$fi extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Järjestelmä';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$fi extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Kaikki';
  @override
  String get filtered => 'Suodatettu';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$fi extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$fi._(TranslationsFi root) : this._root = root, super.internal(root);

  final TranslationsFi _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Lähetysprosessi (${time})';
  @override
  String get finishedError => 'Päättynyt virheellä';
  @override
  String get canceledSender => 'Lähettäjä peruutti';
  @override
  String get canceledReceiver => 'Vastaanottaja peruutti';
}
