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
class TranslationsSl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Slovenščina';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralSl general = _TranslationsGeneralSl._(_root);
  @override
  late final _TranslationsReceiveTabSl receiveTab = _TranslationsReceiveTabSl._(_root);
  @override
  late final _TranslationsSendTabSl sendTab = _TranslationsSendTabSl._(_root);
  @override
  late final _TranslationsSettingsTabSl settingsTab = _TranslationsSettingsTabSl._(_root);
  @override
  late final _TranslationsTroubleshootPageSl troubleshootPage = _TranslationsTroubleshootPageSl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageSl receiveHistoryPage = _TranslationsReceiveHistoryPageSl._(_root);
  @override
  late final _TranslationsApkPickerPageSl apkPickerPage = _TranslationsApkPickerPageSl._(_root);
  @override
  late final _TranslationsSelectedFilesPageSl selectedFilesPage = _TranslationsSelectedFilesPageSl._(_root);
  @override
  late final _TranslationsReceivePageSl receivePage = _TranslationsReceivePageSl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageSl receiveOptionsPage = _TranslationsReceiveOptionsPageSl._(_root);
  @override
  late final _TranslationsSendPageSl sendPage = _TranslationsSendPageSl._(_root);
  @override
  late final _TranslationsProgressPageSl progressPage = _TranslationsProgressPageSl._(_root);
  @override
  late final _TranslationsWebSharePageSl webSharePage = _TranslationsWebSharePageSl._(_root);
  @override
  late final _TranslationsAboutPageSl aboutPage = _TranslationsAboutPageSl._(_root);
  @override
  late final _TranslationsDonationPageSl donationPage = _TranslationsDonationPageSl._(_root);
  @override
  late final _TranslationsChangelogPageSl changelogPage = _TranslationsChangelogPageSl._(_root);
  @override
  late final _TranslationsAliasGeneratorSl aliasGenerator = _TranslationsAliasGeneratorSl._(_root);
  @override
  late final _TranslationsDialogsSl dialogs = _TranslationsDialogsSl._(_root);
  @override
  late final _TranslationsSanitizationSl sanitization = _TranslationsSanitizationSl._(_root);
  @override
  late final _TranslationsTraySl tray = _TranslationsTraySl._(_root);
  @override
  late final _TranslationsWebSl web = _TranslationsWebSl._(_root);
  @override
  late final _TranslationsAssetPickerSl assetPicker = _TranslationsAssetPickerSl._(_root);
}

// Path: general
class _TranslationsGeneralSl extends TranslationsGeneralEn {
  _TranslationsGeneralSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabSl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prejem';
  @override
  late final _TranslationsReceiveTabInfoBoxSl infoBox = _TranslationsReceiveTabInfoBoxSl._(_root);
}

// Path: sendTab
class _TranslationsSendTabSl extends TranslationsSendTabEn {
  _TranslationsSendTabSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pošlji';
  @override
  late final _TranslationsSendTabSelectionSl selection = _TranslationsSendTabSelectionSl._(_root);
  @override
  late final _TranslationsSendTabPickerSl picker = _TranslationsSendTabPickerSl._(_root);
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
  late final _TranslationsSendTabSendModesSl sendModes = _TranslationsSendTabSendModesSl._(_root);
  @override
  String get sendModeHelp => 'Pojasnilo';
  @override
  String get help => 'Preverite, da je ciljna naprava povezana v isto Wi-Fi omrežje.';
  @override
  String get placeItems => 'Postavite elemente za deljenje.';
}

// Path: settingsTab
class _TranslationsSettingsTabSl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nastavitve';
  @override
  late final _TranslationsSettingsTabGeneralSl general = _TranslationsSettingsTabGeneralSl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveSl receive = _TranslationsSettingsTabReceiveSl._(_root);
  @override
  late final _TranslationsSettingsTabSendSl send = _TranslationsSettingsTabSendSl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkSl network = _TranslationsSettingsTabNetworkSl._(_root);
  @override
  late final _TranslationsSettingsTabOtherSl other = _TranslationsSettingsTabOtherSl._(_root);
  @override
  String get advancedSettings => 'Napredne nastavitve';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageSl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallSl firewall = _TranslationsTroubleshootPageFirewallSl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoverySl noDiscovery = _TranslationsTroubleshootPageNoDiscoverySl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionSl noConnection = _TranslationsTroubleshootPageNoConnectionSl._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageSl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsSl entryActions = _TranslationsReceiveHistoryPageEntryActionsSl._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageSl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Izbriši vse';
}

// Path: receivePage
class _TranslationsReceivePageSl extends TranslationsReceivePageEn {
  _TranslationsReceivePageSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sl'))(n, one: 'želi poslati datoteko', other: 'želi poslati ${n} datotek');
  @override
  String get subTitleMessage => 'vam je poslal sporočilo:';
  @override
  String get subTitleLink => 'vam je poslal povezavo:';
  @override
  String get canceled => 'Pošiljatelj je preklical zahtevo.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageSl extends TranslationsSendPageEn {
  _TranslationsSendPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageSl extends TranslationsProgressPageEn {
  _TranslationsProgressPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Pošiljanje datotek';
  @override
  String get titleReceiving => 'Prejemanje datotek';
  @override
  String get savedToGallery => 'Shranjeno v Fotografije';
  @override
  late final _TranslationsProgressPageTotalSl total = _TranslationsProgressPageTotalSl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageSl extends TranslationsAboutPageEn {
  _TranslationsAboutPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageSl extends TranslationsDonationPageEn {
  _TranslationsDonationPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageSl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dnevnik sprememb';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSl extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsSl extends TranslationsDialogsEn {
  _TranslationsDialogsSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileSl addFile = _TranslationsDialogsAddFileSl._(_root);
  @override
  late final _TranslationsDialogsAddressInputSl addressInput = _TranslationsDialogsAddressInputSl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionSl cancelSession = _TranslationsDialogsCancelSessionSl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileSl cannotOpenFile = _TranslationsDialogsCannotOpenFileSl._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeSl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeSl._(_root);
  @override
  late final _TranslationsDialogsErrorDialogSl errorDialog = _TranslationsDialogsErrorDialogSl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogSl favoriteDialog = _TranslationsDialogsFavoriteDialogSl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogSl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogSl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogSl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogSl._(_root);
  @override
  late final _TranslationsDialogsFileInfoSl fileInfo = _TranslationsDialogsFileInfoSl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputSl fileNameInput = _TranslationsDialogsFileNameInputSl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogSl historyClearDialog = _TranslationsDialogsHistoryClearDialogSl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedSl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedSl._(_root);
  @override
  late final _TranslationsDialogsMessageInputSl messageInput = _TranslationsDialogsMessageInputSl._(_root);
  @override
  late final _TranslationsDialogsNoFilesSl noFiles = _TranslationsDialogsNoFilesSl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionSl noPermission = _TranslationsDialogsNoPermissionSl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformSl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformSl._(_root);
  @override
  late final _TranslationsDialogsQrSl qr = _TranslationsDialogsQrSl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsSl quickActions = _TranslationsDialogsQuickActionsSl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeSl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeSl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSl quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeSl._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinSl pin = _TranslationsDialogsPinSl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSl sendModeHelp = _TranslationsDialogsSendModeHelpSl._(_root);
  @override
  late final _TranslationsDialogsZoomSl zoom = _TranslationsDialogsZoomSl._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSl extends TranslationsSanitizationEn {
  _TranslationsSanitizationSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ime datoteke ne sme biti prazno';
  @override
  String get invalid => 'Ime datoteke vsebuje neveljavne znake';
}

// Path: tray
class _TranslationsTraySl extends TranslationsTrayEn {
  _TranslationsTraySl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsWebSl extends TranslationsWebEn {
  _TranslationsWebSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerSl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxSl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionSl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerSl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesSl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralSl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Splošno';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsSl._(_root);
  @override
  String get color => 'Barva';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSl colorOptions = _TranslationsSettingsTabGeneralColorOptionsSl._(_root);
  @override
  String get language => 'Jezik';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSl._(_root);
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
class _TranslationsSettingsTabReceiveSl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendSl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pošlji';
  @override
  String get shareViaLinkAutoAccept => 'Samodejno sprejmi zahteve v načinu »Deli prek povezave«';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabOtherSl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallSl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ta naprava lahko pošilja datoteke, ne more pa jih prejemati.';
  @override
  String solution({required Object port}) => 'Verjetno gre za težavo z požarnim zidom. Dovoli dohodne povezave (UDP in TCP) na vrata ${port}.';
  @override
  String get openFirewallSettings => 'Odpri požarni zid';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ta naprava ne more najti drugih naprav.';
  @override
  String get solution =>
      'Preverite, da so vse naprave v istem Wi-Fi omrežju in imajo enako konfiguracijo (vrata, večtočkovni naslov, šifriranje). Poskusite ročno vnesti IP naslov ciljne naprave. Če to deluje, jo dodajte med priljubljene za prihodnje odkrivanje.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Naprave se ne najdejo in ne morejo deliti datotek.';
  @override
  String get solution =>
      'Preverite, da so obe napravi v istem Wi-Fi omrežju in imajo enake nastavitve (vrata, večtočkovni naslov, šifriranje). Morda omrežje preprečuje komunikacijo med udeleženci (izolacija AP).';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalSl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleSl title = _TranslationsProgressPageTotalTitleSl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Datoteke: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Velikost: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Hitrost: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileSl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodaj k izbiri';
  @override
  String get content => 'Kaj želite dodati?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionSl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prekliči prenos datotek';
  @override
  String get content => 'Ali res želite preklicati prenos datotek?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ne morem odpreti datoteke';
  @override
  String content({required Object file}) => 'Ni mogoče odpreti "${file}". Ali je bila ta datoteka premaknjena, preimenovana ali izbrisana?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifriranje onemogočeno';
  @override
  String get content => 'Komunikacija zdaj poteka prek nezaščitenega HTTP protokola. Če želite uporabljati HTTPS, znova omogočite šifriranje.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogSl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbriši iz priljubljenih';
  @override
  String content({required Object name}) => 'Ali res želite izbrisati napravo "${name}" iz priljubljenih?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoSl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputSl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite ime datoteke';
  @override
  String original({required Object original}) => 'Izvirno: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Počisti zgodovino';
  @override
  String get content => 'Ali res želite izbrisati celotno zgodovino?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputSl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite sporočilo';
  @override
  String get multiline => 'Več vrstic';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni izbranih datotek';
  @override
  String get content => 'Prosim, izberite vsaj eno datoteko.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni dovoljenja';
  @override
  String get content => 'Niste podelili zahtevanih dovoljenj. Prosim, omogočite jih v nastavitvah.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ni na voljo';
  @override
  String get content => 'Ta funkcija je na voljo samo na:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR koda';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeSl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Zahteve za datoteke so zdaj samodejno sprejete. Bodite pozorni, da vam lahko vsi v lokalnem omrežju pošiljajo datoteke.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _TranslationsDialogsPinSl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vnesite PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomSl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsSl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

  final TranslationsSl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSl._(TranslationsSl root) : this._root = root, super.internal(root);

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
