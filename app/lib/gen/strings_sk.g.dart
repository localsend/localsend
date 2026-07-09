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
class TranslationsSk extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSk({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.sk,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sk>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSk _root = this; // ignore: unused_field

  @override
  TranslationsSk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Slovenčina';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$sk general = _Translations$general$sk._(_root);
  @override
  late final _Translations$receiveTab$sk receiveTab = _Translations$receiveTab$sk._(_root);
  @override
  late final _Translations$sendTab$sk sendTab = _Translations$sendTab$sk._(_root);
  @override
  late final _Translations$settingsTab$sk settingsTab = _Translations$settingsTab$sk._(_root);
  @override
  late final _Translations$troubleshootPage$sk troubleshootPage = _Translations$troubleshootPage$sk._(_root);
  @override
  late final _Translations$receiveHistoryPage$sk receiveHistoryPage = _Translations$receiveHistoryPage$sk._(_root);
  @override
  late final _Translations$apkPickerPage$sk apkPickerPage = _Translations$apkPickerPage$sk._(_root);
  @override
  late final _Translations$selectedFilesPage$sk selectedFilesPage = _Translations$selectedFilesPage$sk._(_root);
  @override
  late final _Translations$receivePage$sk receivePage = _Translations$receivePage$sk._(_root);
  @override
  late final _Translations$receiveOptionsPage$sk receiveOptionsPage = _Translations$receiveOptionsPage$sk._(_root);
  @override
  late final _Translations$sendPage$sk sendPage = _Translations$sendPage$sk._(_root);
  @override
  late final _Translations$progressPage$sk progressPage = _Translations$progressPage$sk._(_root);
  @override
  late final _Translations$webSharePage$sk webSharePage = _Translations$webSharePage$sk._(_root);
  @override
  late final _Translations$aboutPage$sk aboutPage = _Translations$aboutPage$sk._(_root);
  @override
  late final _Translations$donationPage$sk donationPage = _Translations$donationPage$sk._(_root);
  @override
  late final _Translations$changelogPage$sk changelogPage = _Translations$changelogPage$sk._(_root);
  @override
  late final _Translations$aliasGenerator$sk aliasGenerator = _Translations$aliasGenerator$sk._(_root);
  @override
  late final _Translations$dialogs$sk dialogs = _Translations$dialogs$sk._(_root);
  @override
  late final _Translations$sanitization$sk sanitization = _Translations$sanitization$sk._(_root);
  @override
  late final _Translations$tray$sk tray = _Translations$tray$sk._(_root);
  @override
  late final _Translations$web$sk web = _Translations$web$sk._(_root);
  @override
  late final _Translations$assetPicker$sk assetPicker = _Translations$assetPicker$sk._(_root);
  @override
  late final _Translations$networkInterfacesPage$sk networkInterfacesPage = _Translations$networkInterfacesPage$sk._(_root);
}

// Path: general
class _Translations$general$sk extends Translations$general$en {
  _Translations$general$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Prijať';
  @override
  String get accepted => 'Prijaté';
  @override
  String get add => 'Pridať';
  @override
  String get advanced => 'Pokročilé';
  @override
  String get cancel => 'Zrušiť';
  @override
  String get close => 'Zavrieť';
  @override
  String get confirm => 'Potvrdiť';
  @override
  String get continueStr => 'Pokračovať';
  @override
  String get copy => 'Kopírovať';
  @override
  String get copiedToClipboard => 'Skopírované do schránky';
  @override
  String get decline => 'Odmietnuť';
  @override
  String get done => 'Hotovo';
  @override
  String get delete => 'Odstrániť';
  @override
  String get edit => 'Upraviť';
  @override
  String get error => 'Chyba';
  @override
  String get example => 'Príklad';
  @override
  String get files => 'Súbory';
  @override
  String get finished => 'Dokončené';
  @override
  String get hide => 'Skryť';
  @override
  String get off => 'Vypnuté';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Zapnuté';
  @override
  String get online => 'Online';
  @override
  String get open => 'Otvoriť';
  @override
  String get queue => 'Fronta';
  @override
  String get quickSave => 'Rýchle uloženie';
  @override
  String get quickSaveFromFavorites => 'Rýchle uloženie pre "Obľúbené"';
  @override
  String get renamed => 'Premenovaný';
  @override
  String get reset => 'Vrátiť späť zmeny';
  @override
  String get restart => 'Reštartovať';
  @override
  String get settings => 'Nastavenia';
  @override
  String get skipped => 'Preskočené';
  @override
  String get start => 'Spustiť';
  @override
  String get stop => 'Zastaviť';
  @override
  String get save => 'Uložiť';
  @override
  String get unchanged => 'Nezmenené';
  @override
  String get unknown => 'Neznáme';
  @override
  String get noItemInClipboard => 'Žiadne položky v schránke.';
}

// Path: receiveTab
class _Translations$receiveTab$sk extends Translations$receiveTab$en {
  _Translations$receiveTab$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prijať';
  @override
  late final _Translations$receiveTab$infoBox$sk infoBox = _Translations$receiveTab$infoBox$sk._(_root);
  @override
  late final _Translations$receiveTab$quickSave$sk quickSave = _Translations$receiveTab$quickSave$sk._(_root);
}

// Path: sendTab
class _Translations$sendTab$sk extends Translations$sendTab$en {
  _Translations$sendTab$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odoslať';
  @override
  late final _Translations$sendTab$selection$sk selection = _Translations$sendTab$selection$sk._(_root);
  @override
  late final _Translations$sendTab$picker$sk picker = _Translations$sendTab$picker$sk._(_root);
  @override
  String get shareIntentInfo => 'Na jednoduchší výber súborov môžete použiť aj funkciu "Zdieľať" vášho mobilného zariadenia.';
  @override
  String get nearbyDevices => 'Zariadenia v blízkosti';
  @override
  String get thisDevice => 'Toto zariadenie';
  @override
  String get scan => 'Vyhľadať zariadenia';
  @override
  String get manualSending => 'Manuálne odoslanie';
  @override
  String get sendMode => 'Režim odosielania';
  @override
  late final _Translations$sendTab$sendModes$sk sendModes = _Translations$sendTab$sendModes$sk._(_root);
  @override
  String get sendModeHelp => 'Vysvetlenie';
  @override
  String get help => 'Uistite sa, že je požadované zariadenie v rovnakej Wi-Fi sieti.';
  @override
  String get placeItems => 'Umiestnite položky na zdieľanie.';
}

// Path: settingsTab
class _Translations$settingsTab$sk extends Translations$settingsTab$en {
  _Translations$settingsTab$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nastavenia';
  @override
  late final _Translations$settingsTab$general$sk general = _Translations$settingsTab$general$sk._(_root);
  @override
  late final _Translations$settingsTab$receive$sk receive = _Translations$settingsTab$receive$sk._(_root);
  @override
  late final _Translations$settingsTab$send$sk send = _Translations$settingsTab$send$sk._(_root);
  @override
  late final _Translations$settingsTab$network$sk network = _Translations$settingsTab$network$sk._(_root);
  @override
  late final _Translations$settingsTab$other$sk other = _Translations$settingsTab$other$sk._(_root);
  @override
  String get advancedSettings => 'Pokročilé nastavenia';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$sk extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Riešenie problémov';
  @override
  String get subTitle => 'Aplikácia nefunguje podľa očakávania? Tu nájdete niektoré bežné riešenia problémov.';
  @override
  String get solution => 'Riešenie:';
  @override
  String get fixButton => 'Opraviť automaticky';
  @override
  late final _Translations$troubleshootPage$firewall$sk firewall = _Translations$troubleshootPage$firewall$sk._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$sk noDiscovery = _Translations$troubleshootPage$noDiscovery$sk._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$sk noConnection = _Translations$troubleshootPage$noConnection$sk._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$sk extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'História';
  @override
  String get openFolder => 'Otvoriť priečinok';
  @override
  String get deleteHistory => 'Odstrániť históriu';
  @override
  String get empty => 'História je prázdna.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$sk entryActions = _Translations$receiveHistoryPage$entryActions$sk._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$sk extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikácie (APK)';
  @override
  String get excludeSystemApps => 'Vylúčiť systémové aplikácie';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Vylúčiť nespustiteľné aplikácie';
  @override
  String apps({required Object n}) => '${n} Aplikácie';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$sk extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Vymazať všetky';
}

// Path: receivePage
class _Translations$receivePage$sk extends Translations$receivePage$en {
  _Translations$receivePage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
    n,
    one: 'vám chce poslať súbor',
    other: 'vám chce poslať ${n} súborov',
  );
  @override
  String get subTitleMessage => 'vám poslal správu:';
  @override
  String get subTitleLink => 'vám poslal odkaz:';
  @override
  String get canceled => 'Odosielateľ zrušil žiadosť.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$sk extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Možnosti';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Priečinok LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automaticky vypnuté, pretože existujú priečinky.';
}

// Path: sendPage
class _Translations$sendPage$sk extends Translations$sendPage$en {
  _Translations$sendPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čaká sa na odpoveď…';
  @override
  String get rejected => 'Príjemca zamietol žiadosť.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Príjemca je zaneprázdnený inou žiadosťou.';
}

// Path: progressPage
class _Translations$progressPage$sk extends Translations$progressPage$en {
  _Translations$progressPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Odosielanie súborov';
  @override
  String get titleReceiving => 'Prijímanie súborov';
  @override
  String get savedToGallery => 'Uložené vo Fotkách';
  @override
  late final _Translations$progressPage$total$sk total = _Translations$progressPage$total$sk._(_root);
  @override
  late final _Translations$progressPage$remainingTime$sk remainingTime = _Translations$progressPage$remainingTime$sk._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$sk extends Translations$webSharePage$en {
  _Translations$webSharePage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zdieľať cez odkaz';
  @override
  String get loading => 'Spúšťa sa server…';
  @override
  String get stopping => 'Zastavuje sa server…';
  @override
  String get error => 'Pri spúšťaní servera sa vyskytla chyba.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
    n,
    one: 'Otvorte tento odkaz vo svojom prehliadači:',
    other: 'Otvorte jeden z týchto odkazov vo svojom prehliadači:',
  );
  @override
  String get requests => 'Žiadosti';
  @override
  String get noRequests => 'Zatiaľ žiadne žiadosti.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automaticky prijímať žiadosti';
  @override
  String get requirePin => 'Vyžadovať PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je "${pin}"';
  @override
  String get encryptionHint => 'LocalSend používa certifikát s vlastným podpisom. Musíte ho prijať vo svojom prehliadači.';
  @override
  String pendingRequests({required Object n}) => 'Nespracované žiadosti: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$sk extends Translations$aboutPage$en {
  _Translations$aboutPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O aplikácii LocalSend';
  @override
  List<String> get description => [
    'LocalSend je bezplatná aplikácia s otvoreným zdrojovým kódom, ktorá vám umožňuje bezpečne zdieľať súbory a správy so zariadeniami v okolí cez vašu lokálnu sieť bez potreby pripojenia k internetu.',
    'Táto aplikácia je dostupná pre Android, iOS, macOS, Windows a Linux. Všetky možnosti stiahnutia nájdete na oficiálnej domovskej stránke.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Prispievatelia';
  @override
  String get packagers => 'Zostavovatelia balíkov';
  @override
  String get translators => 'Prekladatelia';
}

// Path: donationPage
class _Translations$donationPage$sk extends Translations$donationPage$en {
  _Translations$donationPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Darovať';
  @override
  String get info => 'LocalSend je bezplatný, s otvoreným kódom a bez reklám. Ak sa vám aplikácia páči, môžete jej vývoj podporiť darom.';
  @override
  String donate({required Object amount}) => 'Darovať ${amount}';
  @override
  String get thanks => 'Ďakujeme veľmi pekne!';
  @override
  String get restore => 'Obnoviť nákup';
}

// Path: changelogPage
class _Translations$changelogPage$sk extends Translations$changelogPage$en {
  _Translations$changelogPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zoznam zmien';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$sk extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Rozkošná',
    'Krásna',
    'Veľká',
    'Ľahká',
    'Okúzľujúca',
    'Šikovná',
    'Pohodová',
    'Roztomilá',
    'Prefíkaná',
    'Odhodlaná',
    'Energická',
    'Efektívna',
    'Fantastická',
    'Rýchla',
    'Fajná',
    'Čerstvá',
    'Dobrá',
    'Nádherná',
    'Skvelá',
    'Sympatická',
    'Horúca',
    'Milá',
    'Zvodná',
    'Mystická',
    'Čistá',
    'Úhľadná',
    'Trpezlivá',
    'Pekná',
    'Výkonná',
    'Bohatá',
    'Tajomná',
    'Inteligentná',
    'Pôvabná',
    'Špeciálna',
    'Strategická',
    'Silná',
    'Vášnivá',
    'Múdra',
  ];
  @override
  List<String> get fruits => [
    'hruška',
    'višňa',
    'čerešňa',
    'broskyňa',
    'slivka',
    'marhuľa',
    'ringlota',
    'čučoriedka',
    'brusnica',
    'ríbezľa',
    'malina',
    'jahoda',
    'moruša',
    'mandarínka',
    'marakuja',
    'datľa',
    'dula',
    'figa',
    'limetka',
    'papája',
    'tekvica',
    'akébia',
    'brokolica',
    'cibuľa',
    'kapusta',
    'paradajka',
  ];

  /// V niektorých jazykoch musí byť prídavné meno posledné.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$sk extends Translations$dialogs$en {
  _Translations$dialogs$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$sk addFile = _Translations$dialogs$addFile$sk._(_root);
  @override
  late final _Translations$dialogs$openFile$sk openFile = _Translations$dialogs$openFile$sk._(_root);
  @override
  late final _Translations$dialogs$addressInput$sk addressInput = _Translations$dialogs$addressInput$sk._(_root);
  @override
  late final _Translations$dialogs$cancelSession$sk cancelSession = _Translations$dialogs$cancelSession$sk._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$sk cannotOpenFile = _Translations$dialogs$cannotOpenFile$sk._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$sk encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$sk._(_root);
  @override
  late final _Translations$dialogs$errorDialog$sk errorDialog = _Translations$dialogs$errorDialog$sk._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$sk favoriteDialog = _Translations$dialogs$favoriteDialog$sk._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$sk favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$sk._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$sk favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$sk._(_root);
  @override
  late final _Translations$dialogs$fileInfo$sk fileInfo = _Translations$dialogs$fileInfo$sk._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$sk fileNameInput = _Translations$dialogs$fileNameInput$sk._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$sk historyClearDialog = _Translations$dialogs$historyClearDialog$sk._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$sk localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$sk._(_root);
  @override
  late final _Translations$dialogs$messageInput$sk messageInput = _Translations$dialogs$messageInput$sk._(_root);
  @override
  late final _Translations$dialogs$noFiles$sk noFiles = _Translations$dialogs$noFiles$sk._(_root);
  @override
  late final _Translations$dialogs$noPermission$sk noPermission = _Translations$dialogs$noPermission$sk._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$sk notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$sk._(_root);
  @override
  late final _Translations$dialogs$qr$sk qr = _Translations$dialogs$qr$sk._(_root);
  @override
  late final _Translations$dialogs$quickActions$sk quickActions = _Translations$dialogs$quickActions$sk._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$sk quickSaveNotice = _Translations$dialogs$quickSaveNotice$sk._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$sk quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$sk._(_root);
  @override
  late final _Translations$dialogs$pin$sk pin = _Translations$dialogs$pin$sk._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$sk sendModeHelp = _Translations$dialogs$sendModeHelp$sk._(_root);
  @override
  late final _Translations$dialogs$zoom$sk zoom = _Translations$dialogs$zoom$sk._(_root);
}

// Path: sanitization
class _Translations$sanitization$sk extends Translations$sanitization$en {
  _Translations$sanitization$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Názov súboru nemôže byť prázdny';
  @override
  String get invalid => 'Názov súboru obsahuje neplatné znaky';
}

// Path: tray
class _Translations$tray$sk extends Translations$tray$en {
  _Translations$tray$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Ukončiť LocalSend';
  @override
  String get closeWindows => 'Ukončiť';
}

// Path: web
class _Translations$web$sk extends Translations$web$en {
  _Translations$web$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Zadajte PIN';
  @override
  String get invalidPin => 'Neplatný PIN kód';
  @override
  String get tooManyAttempts => 'Príliš veľa pokusov';
  @override
  String get rejected => 'Odmietnuté';
  @override
  String get files => 'Súbory';
  @override
  String get fileName => 'Názov súboru';
  @override
  String get size => 'Veľkosť';
}

// Path: assetPicker
class _Translations$assetPicker$sk extends Translations$assetPicker$en {
  _Translations$assetPicker$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potvrdiť';
  @override
  String get cancel => 'Zrušiť';
  @override
  String get edit => 'Upraviť';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Načítanie zlyhalo';
  @override
  String get original => 'Pôvod';
  @override
  String get preview => 'Ukážka';
  @override
  String get select => 'Vybrať';
  @override
  String get emptyList => 'Prázdny zoznam';
  @override
  String get unSupportedAssetType => 'Nepodporovaný typ súboru.';
  @override
  String get unableToAccessAll => 'Nie je možné získať prístup ku všetkým súborom v zariadení';
  @override
  String get viewingLimitedAssetsTip => 'Zobraziť iba súbory a albumy, ktoré má aplikácia prístupné.';
  @override
  String get changeAccessibleLimitedAssets => 'Kliknutím aktualizujete prístupné súbory';
  @override
  String get accessAllTip =>
      'Aplikácia má prístup iba k niektorým súborom v zariadení. Prejdite do systémových nastavení a povoľte aplikácii prístup ku všetkým médiám v zariadení.';
  @override
  String get goToSystemSettings => 'Prejdite do nastavení systému';
  @override
  String get accessLimitedAssets => 'Pokračovať s obmedzeným prístupom';
  @override
  String get accessiblePathName => 'Prístupné súbory';
  @override
  String get sTypeAudioLabel => 'Zvuk';
  @override
  String get sTypeImageLabel => 'Obrázok';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Iné médiá';
  @override
  String get sActionPlayHint => 'prehrať';
  @override
  String get sActionPreviewHint => 'náhľad';
  @override
  String get sActionSelectHint => 'vyberať';
  @override
  String get sActionSwitchPathLabel => 'zmeniť cestu';
  @override
  String get sActionUseCameraHint => 'použiť fotoaparát';
  @override
  String get sNameDurationLabel => 'trvanie';
  @override
  String get sUnitAssetCountLabel => 'počet';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$sk extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'V predvolenom nastavení LocalSend používa všetky dostupné sieťové rozhrania. Nežiaduce siete tu môžete vylúčiť. Na uplatnenie zmien je potrebné reštartovať server.';
  @override
  String get preview => 'Náhľad';
  @override
  String get blacklist => 'Zoznam zakázaných';
  @override
  String get title => 'Sieťové rozhrania';
  @override
  String get whitelist => 'Zoznam povolených';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$sk extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Názov zariadenia:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$sk extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Obľúbené';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$sk extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Výber';
  @override
  String files({required Object files}) => 'Súbory: ${files}';
  @override
  String size({required Object size}) => 'Veľkosť: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$sk extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Súbor';
  @override
  String get folder => 'Priečinok';
  @override
  String get media => 'Médiá';
  @override
  String get text => 'Text';
  @override
  String get app => 'Aplikácia';
  @override
  String get clipboard => 'Vložiť';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$sk extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Jeden príjemca';
  @override
  String get multiple => 'Viacerí príjemcovia';
  @override
  String get link => 'Zdieľať cez odkaz';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$sk extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Všeobecné';
  @override
  String get brightness => 'Téma';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$sk brightnessOptions = _Translations$settingsTab$general$brightnessOptions$sk._(
    _root,
  );
  @override
  String get color => 'Farba';
  @override
  late final _Translations$settingsTab$general$colorOptions$sk colorOptions = _Translations$settingsTab$general$colorOptions$sk._(_root);
  @override
  String get language => 'Jazyk';
  @override
  late final _Translations$settingsTab$general$languageOptions$sk languageOptions = _Translations$settingsTab$general$languageOptions$sk._(_root);
  @override
  String get saveWindowPlacement => 'Uložiť polohu okna po ukončení';
  @override
  String get saveWindowPlacementWindows => 'Uložiť polohu okna po ukončení';
  @override
  String get minimizeToTray => 'Minimalizovať na systémový panel/panel ponuky pri zatvorení';
  @override
  String get launchAtStartup => 'Autoštart po prihlásení';
  @override
  String get launchMinimized => 'Autoštart: Spustiť skryté';
  @override
  String get showInContextMenu => 'Zobraziť LocalSend v kontextovej ponuke';
  @override
  String get animations => 'Animácie';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$sk extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prijať';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatické dokončenie';
  @override
  String get destination => 'Uložiť do priečinka';
  @override
  String get downloads => '(Stiahnuté)';
  @override
  String get saveToGallery => 'Uložiť médiá do galérie';
  @override
  String get saveToHistory => 'Uložiť do histórie';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$sk extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odoslať';
  @override
  String get shareViaLinkAutoAccept => 'Automaticky prijímať žiadosti v režime "Zdieľať cez odkaz"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$sk extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sieť';
  @override
  String get needRestart => 'Ak chcete použiť nastavenia, reštartujte server!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Názov zariadenia';
  @override
  String get deviceType => 'Typ zariadenia';
  @override
  String get deviceModel => 'Model zariadenia';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Časový limit hľadania';
  @override
  String get useSystemName => 'Použiť systémové meno';
  @override
  String get generateRandomAlias => 'Generovať náhodnú prezývku';
  @override
  String portWarning({required Object defaultPort}) =>
      'Iné zariadenia vás nemusia rozpoznať, pretože používate vlastný port. (predvolené: ${defaultPort})';
  @override
  String get encryption => 'Šifrovanie';
  @override
  String get multicastGroup => 'Multicast adresa';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Iné zariadenia vás nemusia rozpoznať, pretože používate vlastnú multicast adresu. (predvolené: ${defaultMulticast})';
  @override
  String get network => 'Sieť';
  @override
  late final _Translations$settingsTab$network$networkOptions$sk networkOptions = _Translations$settingsTab$network$networkOptions$sk._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$sk extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Iné';
  @override
  String get support => 'Podporte LocalSend';
  @override
  String get donate => 'Darovať';
  @override
  String get privacyPolicy => 'Zásady ochrany osobných údajov';
  @override
  String get termsOfUse => 'Podmienky používania';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$sk extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Toto zariadenie môže odosielať súbory do iných zariadení, ale iné zariadenia nemôžu odosielať súbory do tohto zariadenia.';
  @override
  String solution({required Object port}) =>
      'S najväčšou pravdepodobnosťou ide o problém brány firewall. Môžete to vyriešiť povolením prichádzajúcich spojení (UDP a TCP) na porte ${port}.';
  @override
  String get openFirewall => 'Otvoriť firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$sk extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Toto zariadenie nemôže nájsť iné zariadenia.';
  @override
  String get solution =>
      'Uistite sa, že sú všetky zariadenia v rovnakej Wi-Fi sieti a zdieľajú rovnakú konfiguráciu (port, multicast adresa, šifrovanie). Môžete sa pokúsiť zadať IP adresu cieľového zariadenia ručne. Ak to funguje, zvážte pridanie tohto zariadenia do obľúbených položiek, aby mohlo byť v budúcnosti automaticky nájdené.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$sk extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Obe zariadenia sa nedokážu navzájom nájsť ani nemôžu zdieľať súbory.';
  @override
  String get solution =>
      'Existuje problém na oboch stranách? Ak áno, musíte sa uistiť, že sú obe zariadenia v rovnakej Wi-Fi sieti a majú rovnakú konfiguráciu (port, multicastovú adresu, šifrovanie). Sieť Wi-Fi nemusí umožňovať komunikáciu medzi účastníkmi (izolácia prístupového bodu). V takom prípade musí byť táto možnosť povolená na smerovači.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$sk extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otvoriť súbor';
  @override
  String get showInFolder => 'Zobraziť v priečinku';
  @override
  String get info => 'Informácie';
  @override
  String get deleteFromHistory => 'Vymazať z histórie';
}

// Path: progressPage.total
class _Translations$progressPage$total$sk extends Translations$progressPage$total$en {
  _Translations$progressPage$total$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$sk title = _Translations$progressPage$total$title$sk._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Súbory: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Veľkosť: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Rýchlosť: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$sk extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Použiť „h“ pre skratku hodín a „m“ pre minúty
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Použiť „d“ pre dni, „h“ pre hodiny a „m“ pre minúty
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$sk extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pridať do výberu';
  @override
  String get content => 'Čo chcete pridať?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$sk extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otvoriť súbor';
  @override
  String get content => 'Chcete otvoriť prijatý súbor?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$sk extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadajte adresu';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP adresa';
  @override
  String get recentlyUsed => 'Nedávno použité: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$sk extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zrušiť prenos súborov';
  @override
  String get content => 'Naozaj chcete zrušiť prenos súborov?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$sk extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie je možné otvoriť súbor';
  @override
  String content({required Object file}) => 'Nepodarilo sa otvoriť súbor "${file}". Bol tento súbor presunutý, premenovaný alebo odstránený?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$sk extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifrovanie je vypnuté';
  @override
  String get content => 'Komunikácia teraz prebieha cez nešifrovaný protokol HTTP. Ak chcete použiť protokol HTTPS, opäť povoľte šifrovanie.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$sk extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$sk extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Obľúbené';
  @override
  String get noFavorites => 'Zatiaľ žiadne obľúbené zariadenia.';
  @override
  String get addFavorite => 'Pridať';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$sk extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odstrániť z obľúbených';
  @override
  String content({required Object name}) => 'Naozaj chcete odstrániť "${name}" z obľúbených?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$sk extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Pridať k obľúbeným';
  @override
  String get titleEdit => 'Nastavenia';
  @override
  String get name => 'Názov zariadenia';
  @override
  String get auto => '(automaticky)';
  @override
  String get ip => 'IP adresa';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$sk extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informácie o súbore';
  @override
  String get fileName => 'Názov súboru:';
  @override
  String get path => 'Cesta:';
  @override
  String get size => 'Veľkosť:';
  @override
  String get sender => 'Odosielateľ:';
  @override
  String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$sk extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadajte názov súboru';
  @override
  String original({required Object original}) => 'Originál: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$sk extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vymazať históriu';
  @override
  String get content => 'Naozaj chcete vymazať celú históriu?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$sk extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend nemôže nájsť iné zariadenia bez povolenia na prehľadanie lokálnej siete. Povoľte prosím toto povolenie v nastaveniach.';
  @override
  String get gotoSettings => 'Nastavenia';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$sk extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Napíšte správu';
  @override
  String get multiline => 'Viacriadková';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$sk extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie sú vybraté žiadne súbory';
  @override
  String get content => 'Vyberte prosím aspoň jeden súbor.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$sk extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Žiadne povolenie';
  @override
  String get content => 'Neudelili ste potrebné povolenia. Udeľte ich prosím v nastaveniach.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$sk extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie je k dispozícii';
  @override
  String get content => 'Táto funkcia je dostupná iba na:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$sk extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kód';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$sk extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rýchle akcie';
  @override
  String get counter => 'Počítadlo';
  @override
  String get prefix => 'Predpona';
  @override
  String get padZero => 'Vyplniť s nulami';
  @override
  String get sortBeforeCount => 'Vopred zoradiť podľa abecedy (A-Z)';
  @override
  String get random => 'Náhodne';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$sk extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Žiadosti o súbor sú automaticky akceptované. Uvedomte si, že každý v miestnej sieti vám môže posielať súbory.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$sk extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Žiadosti o súbory sa teraz automaticky prijímajú zo zariadení vo vašom zozname obľúbených.',
    'Varovanie! V súčasnosti to nie je úplne bezpečné, pretože hacker, ktorý má odtlačok prsta akéhokoľvek zariadenia zo zoznamu obľúbených, vám môže posielať súbory bez obmedzenia.',
    'Táto možnosť je však stále bezpečnejšia ako povoliť všetkým používateľom v miestnej sieti posielať súbory bez obmedzenia.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$sk extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadajte PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$sk extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Režimy odosielania';
  @override
  String get single => 'Odošle súbory jednému príjemcovi. Výber sa vymaže po dokončení prenosu súborov.';
  @override
  String get multiple => 'Posiela súbory viacerým príjemcom. Výber sa vymaže po dokončení prenosu súborov.';
  @override
  String get link => 'Príjemcovia, ktorí nemajú nainštalovaný LocalSend, si môžu stiahnuť vybrané súbory otvorením odkazu vo svojom prehliadači.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$sk extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$sk extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systémová';
  @override
  String get dark => 'Tmavá';
  @override
  String get light => 'Svetlá';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$sk extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systémová';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$sk extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systémový';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$sk extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Všetky';
  @override
  String get filtered => 'Filtrované';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$sk extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$sk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Celkový priebeh (${time})';
  @override
  String get finishedError => 'Dokončené s chybou';
  @override
  String get canceledSender => 'Zrušené odosielateľom';
  @override
  String get canceledReceiver => 'Zrušené príjemcom';
}
