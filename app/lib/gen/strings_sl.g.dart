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
class TranslationsSl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.sl,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSl _root = this; // ignore: unused_field

  @override
  TranslationsSl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Slovenščina';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$sl general = _Translations$general$sl._(_root);
  @override
  late final _Translations$receiveTab$sl receiveTab = _Translations$receiveTab$sl._(_root);
  @override
  late final _Translations$sendTab$sl sendTab = _Translations$sendTab$sl._(_root);
  @override
  late final _Translations$settingsTab$sl settingsTab = _Translations$settingsTab$sl._(_root);
  @override
  late final _Translations$troubleshootPage$sl troubleshootPage = _Translations$troubleshootPage$sl._(_root);
  @override
  late final _Translations$receiveHistoryPage$sl receiveHistoryPage = _Translations$receiveHistoryPage$sl._(_root);
  @override
  late final _Translations$apkPickerPage$sl apkPickerPage = _Translations$apkPickerPage$sl._(_root);
  @override
  late final _Translations$selectedFilesPage$sl selectedFilesPage = _Translations$selectedFilesPage$sl._(_root);
  @override
  late final _Translations$receivePage$sl receivePage = _Translations$receivePage$sl._(_root);
  @override
  late final _Translations$receiveOptionsPage$sl receiveOptionsPage = _Translations$receiveOptionsPage$sl._(_root);
  @override
  late final _Translations$sendPage$sl sendPage = _Translations$sendPage$sl._(_root);
  @override
  late final _Translations$progressPage$sl progressPage = _Translations$progressPage$sl._(_root);
  @override
  late final _Translations$webSharePage$sl webSharePage = _Translations$webSharePage$sl._(_root);
  @override
  late final _Translations$aboutPage$sl aboutPage = _Translations$aboutPage$sl._(_root);
  @override
  late final _Translations$donationPage$sl donationPage = _Translations$donationPage$sl._(_root);
  @override
  late final _Translations$changelogPage$sl changelogPage = _Translations$changelogPage$sl._(_root);
  @override
  late final _Translations$aliasGenerator$sl aliasGenerator = _Translations$aliasGenerator$sl._(_root);
  @override
  late final _Translations$dialogs$sl dialogs = _Translations$dialogs$sl._(_root);
  @override
  late final _Translations$sanitization$sl sanitization = _Translations$sanitization$sl._(_root);
  @override
  late final _Translations$tray$sl tray = _Translations$tray$sl._(_root);
  @override
  late final _Translations$web$sl web = _Translations$web$sl._(_root);
  @override
  late final _Translations$assetPicker$sl assetPicker = _Translations$assetPicker$sl._(_root);
}

// Path: general
class _Translations$general$sl extends Translations$general$en {
  _Translations$general$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Sprejmi';
  @override
  String get accepted => 'Sprejeto';
  @override
  String get add => 'Dodaj';
  @override
  String get advanced => 'Napredno';
  @override
  String get cancel => 'Prekliči';
  @override
  String get close => 'Zapri';
  @override
  String get confirm => 'Potrdi';
  @override
  String get continueStr => 'Nadaljuj';
  @override
  String get copy => 'Kopiraj';
  @override
  String get copiedToClipboard => 'Kopirano v odložišče';
  @override
  String get decline => 'Zavrni';
  @override
  String get done => 'Končano';
  @override
  String get delete => 'Izbriši';
  @override
  String get edit => 'Uredi';
  @override
  String get error => 'Napaka';
  @override
  String get example => 'Primer';
  @override
  String get files => 'Datoteke';
  @override
  String get finished => 'Končano';
  @override
  String get hide => 'Skrij';
  @override
  String get off => 'Izklopljeno';
  @override
  String get offline => 'Brez povezave';
  @override
  String get on => 'Vklopljeno';
  @override
  String get online => 'Na spletu';
  @override
  String get open => 'Odpri';
  @override
  String get queue => 'Čakalna vrsta';
  @override
  String get quickSave => 'Hitro shranjevanje';
  @override
  String get quickSaveFromFavorites => 'Hitro shranjevanje za »Priljubljene«';
  @override
  String get renamed => 'Preimenovano';
  @override
  String get reset => 'Razveljavi spremembe';
  @override
  String get restart => 'Ponovni zagon';
  @override
  String get settings => 'Nastavitve';
  @override
  String get skipped => 'Preskočeno';
  @override
  String get start => 'Začni';
  @override
  String get stop => 'Ustavi';
  @override
  String get save => 'Shrani';
  @override
  String get unchanged => 'Nespremenjeno';
  @override
  String get unknown => 'Neznano';
  @override
  String get noItemInClipboard => 'V odložišču ni elementov.';
}

// Path: receiveTab
class _Translations$receiveTab$sl extends Translations$receiveTab$en {
  _Translations$receiveTab$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prejem';
  @override
  late final _Translations$receiveTab$infoBox$sl infoBox = _Translations$receiveTab$infoBox$sl._(_root);
}

// Path: sendTab
class _Translations$sendTab$sl extends Translations$sendTab$en {
  _Translations$sendTab$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pošlji';
  @override
  late final _Translations$sendTab$selection$sl selection = _Translations$sendTab$selection$sl._(_root);
  @override
  late final _Translations$sendTab$picker$sl picker = _Translations$sendTab$picker$sl._(_root);
  @override
  String get shareIntentInfo => 'Lahko uporabite funkcijo »Deli« na vaši mobilni napravi za lažjo izbiro datotek.';
  @override
  String get nearbyDevices => 'Naprave v bližini';
  @override
  String get thisDevice => 'Ta naprava';
  @override
  String get scan => 'Išči naprave';
  @override
  String get manualSending => 'Ročno pošiljanje';
  @override
  String get sendMode => 'Način pošiljanja';
  @override
  late final _Translations$sendTab$sendModes$sl sendModes = _Translations$sendTab$sendModes$sl._(_root);
  @override
  String get sendModeHelp => 'Pojasnilo';
  @override
  String get help => 'Preverite, da je ciljna naprava povezana v isto Wi-Fi omrežje.';
  @override
  String get placeItems => 'Postavite elemente za deljenje.';
}

// Path: settingsTab
class _Translations$settingsTab$sl extends Translations$settingsTab$en {
  _Translations$settingsTab$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nastavitve';
  @override
  late final _Translations$settingsTab$general$sl general = _Translations$settingsTab$general$sl._(_root);
  @override
  late final _Translations$settingsTab$receive$sl receive = _Translations$settingsTab$receive$sl._(_root);
  @override
  late final _Translations$settingsTab$send$sl send = _Translations$settingsTab$send$sl._(_root);
  @override
  late final _Translations$settingsTab$network$sl network = _Translations$settingsTab$network$sl._(_root);
  @override
  late final _Translations$settingsTab$other$sl other = _Translations$settingsTab$other$sl._(_root);
  @override
  String get advancedSettings => 'Napredne nastavitve';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$sl extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odpravljanje težav';
  @override
  String get subTitle => 'Aplikacija ne deluje pravilno? Tukaj najdete rešitve za pogoste težave.';
  @override
  String get solution => 'Rešitev:';
  @override
  String get fixButton => 'Samodejno odpravi';
  @override
  late final _Translations$troubleshootPage$firewall$sl firewall = _Translations$troubleshootPage$firewall$sl._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$sl noDiscovery = _Translations$troubleshootPage$noDiscovery$sl._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$sl noConnection = _Translations$troubleshootPage$noConnection$sl._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$sl extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zgodovina';
  @override
  String get openFolder => 'Odpri mapo';
  @override
  String get deleteHistory => 'Izbriši zgodovino';
  @override
  String get empty => 'Zgodovina je prazna.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$sl entryActions = _Translations$receiveHistoryPage$entryActions$sl._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$sl extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikacije (APK)';
  @override
  String get excludeSystemApps => 'Izključi sistemske aplikacije';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Izključi aplikacije, ki jih ni mogoče zagnati';
  @override
  String apps({required Object n}) => '${n} aplikacij';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$sl extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Izbriši vse';
}

// Path: receivePage
class _Translations$receivePage$sl extends Translations$receivePage$en {
  _Translations$receivePage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sl'))(
    n,
    one: 'želi poslati datoteko',
    other: 'želi poslati ${n} datotek',
  );
  @override
  String get subTitleMessage => 'vam je poslal sporočilo:';
  @override
  String get subTitleLink => 'vam je poslal povezavo:';
  @override
  String get canceled => 'Pošiljatelj je preklical zahtevo.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$sl extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Možnosti';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(mapa LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Samodejno izklopljeno, ker obstajajo mape.';
}

// Path: sendPage
class _Translations$sendPage$sl extends Translations$sendPage$en {
  _Translations$sendPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čakanje na odgovor...';
  @override
  String get rejected => 'Prejemnik je zavrnil zahtevo.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Prejemnik je zaseden z drugo zahtevo.';
}

// Path: progressPage
class _Translations$progressPage$sl extends Translations$progressPage$en {
  _Translations$progressPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Pošiljanje datotek';
  @override
  String get titleReceiving => 'Prejemanje datotek';
  @override
  String get savedToGallery => 'Shranjeno v Fotografije';
  @override
  late final _Translations$progressPage$total$sl total = _Translations$progressPage$total$sl._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$sl extends Translations$webSharePage$en {
  _Translations$webSharePage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Deli prek povezave';
  @override
  String get loading => 'Zagon strežnika...';
  @override
  String get stopping => 'Ustavitev strežnika...';
  @override
  String get error => 'Prišlo je do napake pri zagonu strežnika.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sl'))(
    n,
    one: 'Odprite to povezavo v svojem brskalniku:',
    other: 'Odprite eno od teh povezav v svojem brskalniku:',
  );
  @override
  String get requests => 'Zahteve';
  @override
  String get noRequests => 'Zaenkrat ni nobenih zahtev.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Samodejno sprejemaj zahteve';
  @override
  String get requirePin => 'Zahtevaj PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je "${pin}"';
  @override
  String get encryptionHint => 'LocalSend uporablja samopodpisano potrdilo. Sprejeti ga morate v svojem brskalniku.';
  @override
  String pendingRequests({required Object n}) => 'Čakajoče zahteve: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$sl extends Translations$aboutPage$en {
  _Translations$aboutPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O LocalSend';
  @override
  List<String> get description => [
    'LocalSend je brezplačna, odprtokodna aplikacija, ki vam omogoča varno deljenje datotek in sporočil z napravami v bližini prek lokalnega omrežja brez potrebe po internetni povezavi.',
    'Aplikacija je na voljo za Android, iOS, macOS, Windows in Linux. Vse možnosti prenosa lahko najdete na uradni spletni strani.',
  ];
  @override
  String get author => 'Avtor';
  @override
  String get contributors => 'Sodelavci';
  @override
  String get packagers => 'Paketniki';
  @override
  String get translators => 'Prevajalci';
}

// Path: donationPage
class _Translations$donationPage$sl extends Translations$donationPage$en {
  _Translations$donationPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doniraj';
  @override
  String get info => 'LocalSend je brezplačna, odprtokodna in brez oglasov. Če vam je aplikacija všeč, lahko podprete razvoj z donacijo.';
  @override
  String donate({required Object amount}) => 'Doniraj ${amount}';
  @override
  String get thanks => 'Najlepša hvala!';
  @override
  String get restore => 'Obnovi nakup';
}

// Path: changelogPage
class _Translations$changelogPage$sl extends Translations$changelogPage$en {
  _Translations$changelogPage$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dnevnik sprememb';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$sl extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Ljubek',
    'Lep',
    'Velik',
    'Svetel',
    'Čist',
    'Pameten',
    'Kul',
    'Prisrčen',
    'Prebrisan',
    'Odločen',
    'Energijski',
    'Učinkovit',
    'Fantastičen',
    'Hiter',
    'Fin',
    'Svež',
    'Dober',
    'Čudovit',
    'Odličen',
    'Postaven',
    'Vroč',
    'Prijazen',
    'Ljubek',
    'Mističen',
    'Urejen',
    'Lep',
    'Potrpežljiv',
    'Prikupen',
    'Mogočen',
    'Bogat',
    'Skrivnosten',
    'Pameten',
    'Trden',
    'Poseben',
    'Strateški',
    'Močan',
    'Pospravljeno',
    'Moder',
  ];
  @override
  List<String> get fruits => [
    'Jabolko',
    'Avokado',
    'Banana',
    'Robida',
    'Borovnica',
    'Brokoli',
    'Korenček',
    'Češnja',
    'Kokos',
    'Grozdje',
    'Limona',
    'Solata',
    'Mango',
    'Melona',
    'Goba',
    'Čebula',
    'Pomaranča',
    'Papaja',
    'Breskev',
    'Hruška',
    'Ananas',
    'Krompir',
    'Buča',
    'Malina',
    'Jagoda',
    'Paradižnik',
  ];

  /// V nekaterih jezikih mora biti pridevnik na koncu.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$sl extends Translations$dialogs$en {
  _Translations$dialogs$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$sl addFile = _Translations$dialogs$addFile$sl._(_root);
  @override
  late final _Translations$dialogs$addressInput$sl addressInput = _Translations$dialogs$addressInput$sl._(_root);
  @override
  late final _Translations$dialogs$cancelSession$sl cancelSession = _Translations$dialogs$cancelSession$sl._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$sl cannotOpenFile = _Translations$dialogs$cannotOpenFile$sl._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$sl encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$sl._(_root);
  @override
  late final _Translations$dialogs$errorDialog$sl errorDialog = _Translations$dialogs$errorDialog$sl._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$sl favoriteDialog = _Translations$dialogs$favoriteDialog$sl._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$sl favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$sl._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$sl favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$sl._(_root);
  @override
  late final _Translations$dialogs$fileInfo$sl fileInfo = _Translations$dialogs$fileInfo$sl._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$sl fileNameInput = _Translations$dialogs$fileNameInput$sl._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$sl historyClearDialog = _Translations$dialogs$historyClearDialog$sl._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$sl localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$sl._(_root);
  @override
  late final _Translations$dialogs$messageInput$sl messageInput = _Translations$dialogs$messageInput$sl._(_root);
  @override
  late final _Translations$dialogs$noFiles$sl noFiles = _Translations$dialogs$noFiles$sl._(_root);
  @override
  late final _Translations$dialogs$noPermission$sl noPermission = _Translations$dialogs$noPermission$sl._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$sl notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$sl._(_root);
  @override
  late final _Translations$dialogs$qr$sl qr = _Translations$dialogs$qr$sl._(_root);
  @override
  late final _Translations$dialogs$quickActions$sl quickActions = _Translations$dialogs$quickActions$sl._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$sl quickSaveNotice = _Translations$dialogs$quickSaveNotice$sl._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$sl quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$sl._(_root);
  @override
  late final _Translations$dialogs$pin$sl pin = _Translations$dialogs$pin$sl._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$sl sendModeHelp = _Translations$dialogs$sendModeHelp$sl._(_root);
  @override
  late final _Translations$dialogs$zoom$sl zoom = _Translations$dialogs$zoom$sl._(_root);
}

// Path: sanitization
class _Translations$sanitization$sl extends Translations$sanitization$en {
  _Translations$sanitization$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ime datoteke ne sme biti prazno';
  @override
  String get invalid => 'Ime datoteke vsebuje neveljavne znake';
}

// Path: tray
class _Translations$tray$sl extends Translations$tray$en {
  _Translations$tray$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Zapri LocalSend';
  @override
  String get closeWindows => 'Izhod';
}

// Path: web
class _Translations$web$sl extends Translations$web$en {
  _Translations$web$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Vnesite PIN';
  @override
  String get invalidPin => 'Neveljaven PIN';
  @override
  String get tooManyAttempts => 'Preveč poskusov';
  @override
  String get rejected => 'Zavrnjeno';
  @override
  String get files => 'Datoteke';
  @override
  String get fileName => 'Ime datoteke';
  @override
  String get size => 'Velikost';
}

// Path: assetPicker
class _Translations$assetPicker$sl extends Translations$assetPicker$en {
  _Translations$assetPicker$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potrdi';
  @override
  String get cancel => 'Prekliči';
  @override
  String get edit => 'Uredi';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Nalaganje ni uspelo';
  @override
  String get original => 'Izvirnik';
  @override
  String get preview => 'Predogled';
  @override
  String get select => 'Izberi';
  @override
  String get emptyList => 'Prazno';
  @override
  String get unSupportedAssetType => 'Nepodprt tip datoteke.';
  @override
  String get unableToAccessAll => 'Ni mogoče dostopati do vseh datotek na napravi';
  @override
  String get viewingLimitedAssetsTip => 'Prikaži samo datoteke in albume, do katerih ima aplikacija dostop.';
  @override
  String get changeAccessibleLimitedAssets => 'Kliknite za posodobitev dostopnih datotek';
  @override
  String get accessAllTip =>
      'Aplikacija lahko dostopa le do nekaterih datotek na napravi. Pojdite v sistemske nastavitve in omogočite dostop do vseh medijev na napravi.';
  @override
  String get goToSystemSettings => 'Pojdi v sistemske nastavitve';
  @override
  String get accessLimitedAssets => 'Nadaljuj z omejenim dostopom';
  @override
  String get accessiblePathName => 'Dostopne datoteke';
  @override
  String get sTypeAudioLabel => 'Zvok';
  @override
  String get sTypeImageLabel => 'Slika';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Ostalo';
  @override
  String get sActionPlayHint => 'predvajaj';
  @override
  String get sActionPreviewHint => 'predogled';
  @override
  String get sActionSelectHint => 'izberi';
  @override
  String get sActionSwitchPathLabel => 'spremeni pot';
  @override
  String get sActionUseCameraHint => 'uporabi kamero';
  @override
  String get sNameDurationLabel => 'trajanje';
  @override
  String get sUnitAssetCountLabel => 'številka';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$sl extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Vrata:';
  @override
  String get alias => 'Ime naprave:';
}

// Path: sendTab.selection
class _Translations$sendTab$selection$sl extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbira';
  @override
  String files({required Object files}) => 'Datoteke: ${files}';
  @override
  String size({required Object size}) => 'Velikost: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$sl extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Datoteka';
  @override
  String get folder => 'Mapa';
  @override
  String get media => 'Mediji';
  @override
  String get text => 'Besedilo';
  @override
  String get app => 'Aplikacija';
  @override
  String get clipboard => 'Prilepi';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$sl extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'En prejemnik';
  @override
  String get multiple => 'Več prejemnikov';
  @override
  String get link => 'Deli prek povezave';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$sl extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Splošno';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$sl brightnessOptions = _Translations$settingsTab$general$brightnessOptions$sl._(
    _root,
  );
  @override
  String get color => 'Barva';
  @override
  late final _Translations$settingsTab$general$colorOptions$sl colorOptions = _Translations$settingsTab$general$colorOptions$sl._(_root);
  @override
  String get language => 'Jezik';
  @override
  late final _Translations$settingsTab$general$languageOptions$sl languageOptions = _Translations$settingsTab$general$languageOptions$sl._(_root);
  @override
  String get saveWindowPlacement => 'Shrani položaj okna ob izhodu';
  @override
  String get saveWindowPlacementWindows => 'Shrani položaj okna ob zaprtju';
  @override
  String get minimizeToTray => 'Ob zaprtju minimiziraj v sistemski pladenj / meni';
  @override
  String get launchAtStartup => 'Samodejni zagon po prijavi';
  @override
  String get launchMinimized => 'Samodejni zagon: Začni skrito';
  @override
  String get showInContextMenu => 'Prikaži LocalSend v kontekstnem meniju';
  @override
  String get animations => 'Animacije';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$sl extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prejem';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Samodejno dokončaj';
  @override
  String get destination => 'Shrani v mapo';
  @override
  String get downloads => '(Prenosi)';
  @override
  String get saveToGallery => 'Shrani medije v galerijo';
  @override
  String get saveToHistory => 'Shrani v zgodovino';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$sl extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pošlji';
  @override
  String get shareViaLinkAutoAccept => 'Samodejno sprejmi zahteve v načinu »Deli prek povezave«';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$sl extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Omrežje';
  @override
  String get needRestart => 'Ponovno zaženite strežnik, da uveljavite nastavitve!';
  @override
  String get server => 'Strežnik';
  @override
  String get alias => 'Ime naprave';
  @override
  String get deviceType => 'Tip naprave';
  @override
  String get deviceModel => 'Model naprave';
  @override
  String get port => 'Vrata';
  @override
  String get discoveryTimeout => 'Časovna omejitev za odkrivanje';
  @override
  String get useSystemName => 'Uporabi sistemsko ime';
  @override
  String get generateRandomAlias => 'Ustvari naključni vzdevek';
  @override
  String portWarning({required Object defaultPort}) =>
      'Morda vas druge naprave ne bodo zaznale, ker uporabljate nestandardna vrata. (privzeto: ${defaultPort})';
  @override
  String get encryption => 'Šifriranje';
  @override
  String get multicastGroup => 'Večtočkovni naslov';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Morda vas druge naprave ne bodo zaznale, ker uporabljate nestandardni večtočkovni naslov. (privzeto: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$sl extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Drugo';
  @override
  String get support => 'Podprite LocalSend';
  @override
  String get donate => 'Donirajte';
  @override
  String get privacyPolicy => 'Politika zasebnosti';
  @override
  String get termsOfUse => 'Pogoji uporabe';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$sl extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ta naprava lahko pošilja datoteke, ne more pa jih prejemati.';
  @override
  String solution({required Object port}) => 'Verjetno gre za težavo z požarnim zidom. Dovoli dohodne povezave (UDP in TCP) na vrata ${port}.';
  @override
  String get openFirewall => 'Odpri požarni zid';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$sl extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ta naprava ne more najti drugih naprav.';
  @override
  String get solution =>
      'Preverite, da so vse naprave v istem Wi-Fi omrežju in imajo enako konfiguracijo (vrata, večtočkovni naslov, šifriranje). Poskusite ročno vnesti IP naslov ciljne naprave. Če to deluje, jo dodajte med priljubljene za prihodnje odkrivanje.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$sl extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Naprave se ne najdejo in ne morejo deliti datotek.';
  @override
  String get solution =>
      'Preverite, da so obe napravi v istem Wi-Fi omrežju in imajo enake nastavitve (vrata, večtočkovni naslov, šifriranje). Morda omrežje preprečuje komunikacijo med udeleženci (izolacija AP).';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$sl extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Odpri datoteko';
  @override
  String get showInFolder => 'Prikaži v mapi';
  @override
  String get info => 'Informacije';
  @override
  String get deleteFromHistory => 'Izbriši iz zgodovine';
}

// Path: progressPage.total
class _Translations$progressPage$total$sl extends Translations$progressPage$total$en {
  _Translations$progressPage$total$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$sl title = _Translations$progressPage$total$title$sl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Datoteke: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Velikost: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Hitrost: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$sl extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodaj k izbiri';
  @override
  String get content => 'Kaj želite dodati?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$sl extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite naslov';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP naslov';
  @override
  String get recentlyUsed => 'Nedavno uporabljeno: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$sl extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prekliči prenos datotek';
  @override
  String get content => 'Ali res želite preklicati prenos datotek?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$sl extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ne morem odpreti datoteke';
  @override
  String content({required Object file}) => 'Ni mogoče odpreti "${file}". Ali je bila ta datoteka premaknjena, preimenovana ali izbrisana?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$sl extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifriranje onemogočeno';
  @override
  String get content => 'Komunikacija zdaj poteka prek nezaščitenega HTTP protokola. Če želite uporabljati HTTPS, znova omogočite šifriranje.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$sl extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$sl extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Priljubljene naprave';
  @override
  String get noFavorites => 'Ni še priljubljenih naprav.';
  @override
  String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$sl extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbriši iz priljubljenih';
  @override
  String content({required Object name}) => 'Ali res želite izbrisati napravo "${name}" iz priljubljenih?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$sl extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Dodaj v priljubljene';
  @override
  String get titleEdit => 'Nastavitve';
  @override
  String get name => 'Ime naprave';
  @override
  String get auto => '(samodejno)';
  @override
  String get ip => 'IP naslov';
  @override
  String get port => 'Vrata';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$sl extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informacije o datoteki';
  @override
  String get fileName => 'Ime datoteke:';
  @override
  String get path => 'Pot:';
  @override
  String get size => 'Velikost:';
  @override
  String get sender => 'Pošiljatelj:';
  @override
  String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$sl extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite ime datoteke';
  @override
  String original({required Object original}) => 'Izvirno: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$sl extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Počisti zgodovino';
  @override
  String get content => 'Ali res želite izbrisati celotno zgodovino?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$sl extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend ne more najti drugih naprav brez dovoljenja za iskanje v lokalnem omrežju. Prosim, omogočite to dovoljenje v nastavitvah.';
  @override
  String get gotoSettings => 'Nastavitve';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$sl extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite sporočilo';
  @override
  String get multiline => 'Več vrstic';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$sl extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni izbranih datotek';
  @override
  String get content => 'Prosim, izberite vsaj eno datoteko.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$sl extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni dovoljenja';
  @override
  String get content => 'Niste podelili zahtevanih dovoljenj. Prosim, omogočite jih v nastavitvah.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$sl extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni na voljo';
  @override
  String get content => 'Ta funkcija je na voljo samo na:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$sl extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR koda';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$sl extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hitre akcije';
  @override
  String get counter => 'Števec';
  @override
  String get prefix => 'Predpona';
  @override
  String get padZero => 'Dodaj ničle';
  @override
  String get sortBeforeCount => 'Predhodno uredi po abecedi (A-Ž)';
  @override
  String get random => 'Naključno';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$sl extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Zahteve za datoteke so zdaj samodejno sprejete. Bodite pozorni, da vam lahko vsi v lokalnem omrežju pošiljajo datoteke.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$sl extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _Translations$dialogs$pin$sl extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$sl extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Načini pošiljanja';
  @override
  String get single => 'Pošlje datoteke enemu prejemniku. Izbira bo po končanem prenosu izbrisana.';
  @override
  String get multiple => 'Pošlje datoteke več prejemnikom. Izbira po končanem prenosu ne bo izbrisana.';
  @override
  String get link => 'Prejemniki, ki nimajo nameščenega LocalSend, lahko prenesejo izbrane datoteke z odpiranjem povezave v brskalniku.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$sl extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$sl extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Temna';
  @override
  String get light => 'Svetla';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$sl extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$sl extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$sl extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$sl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Skupni napredek (${time})';
  @override
  String get finishedError => 'Zaključeno z napako';
  @override
  String get canceledSender => 'Preklical pošiljatelj';
  @override
  String get canceledReceiver => 'Preklical prejemnik';
}
