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
class TranslationsSk extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Slovenčina';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralSk general = _TranslationsGeneralSk._(_root);
  @override
  late final _TranslationsReceiveTabSk receiveTab = _TranslationsReceiveTabSk._(_root);
  @override
  late final _TranslationsSendTabSk sendTab = _TranslationsSendTabSk._(_root);
  @override
  late final _TranslationsSettingsTabSk settingsTab = _TranslationsSettingsTabSk._(_root);
  @override
  late final _TranslationsTroubleshootPageSk troubleshootPage = _TranslationsTroubleshootPageSk._(_root);
  @override
  late final _TranslationsReceiveHistoryPageSk receiveHistoryPage = _TranslationsReceiveHistoryPageSk._(_root);
  @override
  late final _TranslationsApkPickerPageSk apkPickerPage = _TranslationsApkPickerPageSk._(_root);
  @override
  late final _TranslationsSelectedFilesPageSk selectedFilesPage = _TranslationsSelectedFilesPageSk._(_root);
  @override
  late final _TranslationsReceivePageSk receivePage = _TranslationsReceivePageSk._(_root);
  @override
  late final _TranslationsReceiveOptionsPageSk receiveOptionsPage = _TranslationsReceiveOptionsPageSk._(_root);
  @override
  late final _TranslationsSendPageSk sendPage = _TranslationsSendPageSk._(_root);
  @override
  late final _TranslationsProgressPageSk progressPage = _TranslationsProgressPageSk._(_root);
  @override
  late final _TranslationsWebSharePageSk webSharePage = _TranslationsWebSharePageSk._(_root);
  @override
  late final _TranslationsAboutPageSk aboutPage = _TranslationsAboutPageSk._(_root);
  @override
  late final _TranslationsDonationPageSk donationPage = _TranslationsDonationPageSk._(_root);
  @override
  late final _TranslationsChangelogPageSk changelogPage = _TranslationsChangelogPageSk._(_root);
  @override
  late final _TranslationsAliasGeneratorSk aliasGenerator = _TranslationsAliasGeneratorSk._(_root);
  @override
  late final _TranslationsDialogsSk dialogs = _TranslationsDialogsSk._(_root);
  @override
  late final _TranslationsSanitizationSk sanitization = _TranslationsSanitizationSk._(_root);
  @override
  late final _TranslationsTraySk tray = _TranslationsTraySk._(_root);
  @override
  late final _TranslationsWebSk web = _TranslationsWebSk._(_root);
  @override
  late final _TranslationsAssetPickerSk assetPicker = _TranslationsAssetPickerSk._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageSk networkInterfacesPage = _TranslationsNetworkInterfacesPageSk._(_root);
}

// Path: general
class _TranslationsGeneralSk extends TranslationsGeneralEn {
  _TranslationsGeneralSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabSk extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prijať';
  @override
  late final _TranslationsReceiveTabInfoBoxSk infoBox = _TranslationsReceiveTabInfoBoxSk._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveSk quickSave = _TranslationsReceiveTabQuickSaveSk._(_root);
}

// Path: sendTab
class _TranslationsSendTabSk extends TranslationsSendTabEn {
  _TranslationsSendTabSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odoslať';
  @override
  late final _TranslationsSendTabSelectionSk selection = _TranslationsSendTabSelectionSk._(_root);
  @override
  late final _TranslationsSendTabPickerSk picker = _TranslationsSendTabPickerSk._(_root);
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
  late final _TranslationsSendTabSendModesSk sendModes = _TranslationsSendTabSendModesSk._(_root);
  @override
  String get sendModeHelp => 'Vysvetlenie';
  @override
  String get help => 'Uistite sa, že je požadované zariadenie v rovnakej Wi-Fi sieti.';
  @override
  String get placeItems => 'Umiestnite položky na zdieľanie.';
}

// Path: settingsTab
class _TranslationsSettingsTabSk extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nastavenia';
  @override
  late final _TranslationsSettingsTabGeneralSk general = _TranslationsSettingsTabGeneralSk._(_root);
  @override
  late final _TranslationsSettingsTabReceiveSk receive = _TranslationsSettingsTabReceiveSk._(_root);
  @override
  late final _TranslationsSettingsTabSendSk send = _TranslationsSettingsTabSendSk._(_root);
  @override
  late final _TranslationsSettingsTabNetworkSk network = _TranslationsSettingsTabNetworkSk._(_root);
  @override
  late final _TranslationsSettingsTabOtherSk other = _TranslationsSettingsTabOtherSk._(_root);
  @override
  String get advancedSettings => 'Pokročilé nastavenia';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageSk extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallSk firewall = _TranslationsTroubleshootPageFirewallSk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoverySk noDiscovery = _TranslationsTroubleshootPageNoDiscoverySk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionSk noConnection = _TranslationsTroubleshootPageNoConnectionSk._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageSk extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsSk entryActions = _TranslationsReceiveHistoryPageEntryActionsSk._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSk extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageSk extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Vymazať všetky';
}

// Path: receivePage
class _TranslationsReceivePageSk extends TranslationsReceivePageEn {
  _TranslationsReceivePageSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(n, one: 'vám chce poslať súbor', other: 'vám chce poslať ${n} súborov');
  @override
  String get subTitleMessage => 'vám poslal správu:';
  @override
  String get subTitleLink => 'vám poslal odkaz:';
  @override
  String get canceled => 'Odosielateľ zrušil žiadosť.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSk extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageSk extends TranslationsSendPageEn {
  _TranslationsSendPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageSk extends TranslationsProgressPageEn {
  _TranslationsProgressPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Odosielanie súborov';
  @override
  String get titleReceiving => 'Prijímanie súborov';
  @override
  String get savedToGallery => 'Uložené vo Fotkách';
  @override
  late final _TranslationsProgressPageTotalSk total = _TranslationsProgressPageTotalSk._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSk extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageSk extends TranslationsAboutPageEn {
  _TranslationsAboutPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageSk extends TranslationsDonationPageEn {
  _TranslationsDonationPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageSk extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zoznam zmien';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSk extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsSk extends TranslationsDialogsEn {
  _TranslationsDialogsSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileSk addFile = _TranslationsDialogsAddFileSk._(_root);
  @override
  late final _TranslationsDialogsOpenFileSk openFile = _TranslationsDialogsOpenFileSk._(_root);
  @override
  late final _TranslationsDialogsAddressInputSk addressInput = _TranslationsDialogsAddressInputSk._(_root);
  @override
  late final _TranslationsDialogsCancelSessionSk cancelSession = _TranslationsDialogsCancelSessionSk._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileSk cannotOpenFile = _TranslationsDialogsCannotOpenFileSk._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeSk encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeSk._(_root);
  @override
  late final _TranslationsDialogsErrorDialogSk errorDialog = _TranslationsDialogsErrorDialogSk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogSk favoriteDialog = _TranslationsDialogsFavoriteDialogSk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogSk favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogSk._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogSk favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogSk._(_root);
  @override
  late final _TranslationsDialogsFileInfoSk fileInfo = _TranslationsDialogsFileInfoSk._(_root);
  @override
  late final _TranslationsDialogsFileNameInputSk fileNameInput = _TranslationsDialogsFileNameInputSk._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogSk historyClearDialog = _TranslationsDialogsHistoryClearDialogSk._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedSk localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedSk._(_root);
  @override
  late final _TranslationsDialogsMessageInputSk messageInput = _TranslationsDialogsMessageInputSk._(_root);
  @override
  late final _TranslationsDialogsNoFilesSk noFiles = _TranslationsDialogsNoFilesSk._(_root);
  @override
  late final _TranslationsDialogsNoPermissionSk noPermission = _TranslationsDialogsNoPermissionSk._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformSk notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformSk._(_root);
  @override
  late final _TranslationsDialogsQrSk qr = _TranslationsDialogsQrSk._(_root);
  @override
  late final _TranslationsDialogsQuickActionsSk quickActions = _TranslationsDialogsQuickActionsSk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeSk quickSaveNotice = _TranslationsDialogsQuickSaveNoticeSk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSk quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeSk._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinSk pin = _TranslationsDialogsPinSk._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSk sendModeHelp = _TranslationsDialogsSendModeHelpSk._(_root);
  @override
  late final _TranslationsDialogsZoomSk zoom = _TranslationsDialogsZoomSk._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSk extends TranslationsSanitizationEn {
  _TranslationsSanitizationSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Názov súboru nemôže byť prázdny';
  @override
  String get invalid => 'Názov súboru obsahuje neplatné znaky';
}

// Path: tray
class _TranslationsTraySk extends TranslationsTrayEn {
  _TranslationsTraySk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsWebSk extends TranslationsWebEn {
  _TranslationsWebSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerSk extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageSk extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxSk extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveSk extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionSk extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerSk extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesSk extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralSk extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Všeobecné';
  @override
  String get brightness => 'Téma';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSk brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsSk._(_root);
  @override
  String get color => 'Farba';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSk colorOptions = _TranslationsSettingsTabGeneralColorOptionsSk._(_root);
  @override
  String get language => 'Jazyk';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSk languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSk._(_root);
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
class _TranslationsSettingsTabReceiveSk extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendSk extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odoslať';
  @override
  String get shareViaLinkAutoAccept => 'Automaticky prijímať žiadosti v režime "Zdieľať cez odkaz"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSk extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsSk networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsSk._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSk extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallSk extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Toto zariadenie môže odosielať súbory do iných zariadení, ale iné zariadenia nemôžu odosielať súbory do tohto zariadenia.';
  @override
  String solution({required Object port}) =>
      'S najväčšou pravdepodobnosťou ide o problém brány firewall. Môžete to vyriešiť povolením prichádzajúcich spojení (UDP a TCP) na porte ${port}.';
  @override
  String get openFirewallSettings => 'Otvoriť firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySk extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Toto zariadenie nemôže nájsť iné zariadenia.';
  @override
  String get solution =>
      'Uistite sa, že sú všetky zariadenia v rovnakej Wi-Fi sieti a zdieľajú rovnakú konfiguráciu (port, multicast adresa, šifrovanie). Môžete sa pokúsiť zadať IP adresu cieľového zariadenia ručne. Ak to funguje, zvážte pridanie tohto zariadenia do obľúbených položiek, aby mohlo byť v budúcnosti automaticky nájdené.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSk extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Obe zariadenia sa nedokážu navzájom nájsť ani nemôžu zdieľať súbory.';
  @override
  String get solution =>
      'Existuje problém na oboch stranách? Ak áno, musíte sa uistiť, že sú obe zariadenia v rovnakej Wi-Fi sieti a majú rovnakú konfiguráciu (port, multicastovú adresu, šifrovanie). Sieť Wi-Fi nemusí umožňovať komunikáciu medzi účastníkmi (izolácia prístupového bodu). V takom prípade musí byť táto možnosť povolená na smerovači.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSk extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalSk extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleSk title = _TranslationsProgressPageTotalTitleSk._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Súbory: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Veľkosť: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Rýchlosť: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileSk extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pridať do výberu';
  @override
  String get content => 'Čo chcete pridať?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSk extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otvoriť súbor';
  @override
  String get content => 'Chcete otvoriť prijatý súbor?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSk extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionSk extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zrušiť prenos súborov';
  @override
  String get content => 'Naozaj chcete zrušiť prenos súborov?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSk extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie je možné otvoriť súbor';
  @override
  String content({required Object file}) => 'Nepodarilo sa otvoriť súbor "${file}". Bol tento súbor presunutý, premenovaný alebo odstránený?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSk extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifrovanie je vypnuté';
  @override
  String get content => 'Komunikácia teraz prebieha cez nešifrovaný protokol HTTP. Ak chcete použiť protokol HTTPS, opäť povoľte šifrovanie.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSk extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSk extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogSk extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odstrániť z obľúbených';
  @override
  String content({required Object name}) => 'Naozaj chcete odstrániť "${name}" z obľúbených?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSk extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoSk extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputSk extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadajte názov súboru';
  @override
  String original({required Object original}) => 'Originál: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSk extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vymazať históriu';
  @override
  String get content => 'Naozaj chcete vymazať celú históriu?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSk extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputSk extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Napíšte správu';
  @override
  String get multiline => 'Viacriadková';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSk extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie sú vybraté žiadne súbory';
  @override
  String get content => 'Vyberte prosím aspoň jeden súbor.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSk extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Žiadne povolenie';
  @override
  String get content => 'Neudelili ste potrebné povolenia. Udeľte ich prosím v nastaveniach.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSk extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie je k dispozícii';
  @override
  String get content => 'Táto funkcia je dostupná iba na:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSk extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kód';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSk extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeSk extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Žiadosti o súbor sú automaticky akceptované. Uvedomte si, že každý v miestnej sieti vám môže posielať súbory.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSk extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinSk extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadajte PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSk extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomSk extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSk extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsSk extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systémová';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSk extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systémový';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsSk extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsSk._(TranslationsSk root) : this._root = root, super.internal(root);

  final TranslationsSk _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Všetky';
  @override
  String get filtered => 'Filtrované';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSk extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSk._(TranslationsSk root) : this._root = root, super.internal(root);

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
