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
class TranslationsSr extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.sr,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSr _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Srpski (latinica)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralSr general = _TranslationsGeneralSr._(_root);
  @override
  late final _TranslationsReceiveTabSr receiveTab = _TranslationsReceiveTabSr._(_root);
  @override
  late final _TranslationsSendTabSr sendTab = _TranslationsSendTabSr._(_root);
  @override
  late final _TranslationsSettingsTabSr settingsTab = _TranslationsSettingsTabSr._(_root);
  @override
  late final _TranslationsTroubleshootPageSr troubleshootPage = _TranslationsTroubleshootPageSr._(_root);
  @override
  late final _TranslationsReceiveHistoryPageSr receiveHistoryPage = _TranslationsReceiveHistoryPageSr._(_root);
  @override
  late final _TranslationsApkPickerPageSr apkPickerPage = _TranslationsApkPickerPageSr._(_root);
  @override
  late final _TranslationsSelectedFilesPageSr selectedFilesPage = _TranslationsSelectedFilesPageSr._(_root);
  @override
  late final _TranslationsReceivePageSr receivePage = _TranslationsReceivePageSr._(_root);
  @override
  late final _TranslationsReceiveOptionsPageSr receiveOptionsPage = _TranslationsReceiveOptionsPageSr._(_root);
  @override
  late final _TranslationsSendPageSr sendPage = _TranslationsSendPageSr._(_root);
  @override
  late final _TranslationsProgressPageSr progressPage = _TranslationsProgressPageSr._(_root);
  @override
  late final _TranslationsWebSharePageSr webSharePage = _TranslationsWebSharePageSr._(_root);
  @override
  late final _TranslationsAboutPageSr aboutPage = _TranslationsAboutPageSr._(_root);
  @override
  late final _TranslationsDonationPageSr donationPage = _TranslationsDonationPageSr._(_root);
  @override
  late final _TranslationsChangelogPageSr changelogPage = _TranslationsChangelogPageSr._(_root);
  @override
  late final _TranslationsAliasGeneratorSr aliasGenerator = _TranslationsAliasGeneratorSr._(_root);
  @override
  late final _TranslationsDialogsSr dialogs = _TranslationsDialogsSr._(_root);
  @override
  late final _TranslationsSanitizationSr sanitization = _TranslationsSanitizationSr._(_root);
  @override
  late final _TranslationsTraySr tray = _TranslationsTraySr._(_root);
  @override
  late final _TranslationsWebSr web = _TranslationsWebSr._(_root);
  @override
  late final _TranslationsAssetPickerSr assetPicker = _TranslationsAssetPickerSr._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageSr networkInterfacesPage = _TranslationsNetworkInterfacesPageSr._(_root);
}

// Path: general
class _TranslationsGeneralSr extends TranslationsGeneralEn {
  _TranslationsGeneralSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Prihvati';
  @override
  String get accepted => 'Prihvaćeno';
  @override
  String get add => 'Dodaj';
  @override
  String get advanced => 'Napredno';
  @override
  String get cancel => 'Otkaži';
  @override
  String get close => 'Zatvori';
  @override
  String get confirm => 'Potvrdi';
  @override
  String get continueStr => 'Nastavi';
  @override
  String get copy => 'Kopiraj';
  @override
  String get copiedToClipboard => 'Kopirano u privremenu memoriju';
  @override
  String get decline => 'Odbij';
  @override
  String get done => 'Gotovo';
  @override
  String get delete => 'Izbriši';
  @override
  String get edit => 'Izmeni';
  @override
  String get error => 'Greška';
  @override
  String get example => 'Primer';
  @override
  String get files => 'Fajlovi';
  @override
  String get finished => 'Završeno';
  @override
  String get hide => 'Sakrij';
  @override
  String get off => 'Isključeno';
  @override
  String get offline => 'Oflajn';
  @override
  String get on => 'Uključeno';
  @override
  String get online => 'Onlajn';
  @override
  String get open => 'Otvori';
  @override
  String get queue => 'Redosled';
  @override
  String get quickSave => 'Brzo čuvanje';
  @override
  String get quickSaveFromFavorites => 'Brzo čuvanje u „Omiljeno“';
  @override
  String get renamed => 'Preimenovano';
  @override
  String get reset => 'Poništi promene';
  @override
  String get restart => 'Restartuj';
  @override
  String get settings => 'Podešavanja';
  @override
  String get skipped => 'Preskočeno';
  @override
  String get start => 'Pokreni';
  @override
  String get stop => 'Zaustavi';
  @override
  String get save => 'Sačuvaj';
  @override
  String get unchanged => 'Nepromenjeno';
  @override
  String get unknown => 'Nepoznato';
  @override
  String get noItemInClipboard => 'Nema predmeta u privremenoj memoriji.';
}

// Path: receiveTab
class _TranslationsReceiveTabSr extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primanje';
  @override
  late final _TranslationsReceiveTabInfoBoxSr infoBox = _TranslationsReceiveTabInfoBoxSr._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveSr quickSave = _TranslationsReceiveTabQuickSaveSr._(_root);
}

// Path: sendTab
class _TranslationsSendTabSr extends TranslationsSendTabEn {
  _TranslationsSendTabSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  late final _TranslationsSendTabSelectionSr selection = _TranslationsSendTabSelectionSr._(_root);
  @override
  late final _TranslationsSendTabPickerSr picker = _TranslationsSendTabPickerSr._(_root);
  @override
  String get shareIntentInfo => 'Takođe, možete da koristite funkciju „Deli“ na svom mobilnom uređaju da biste lakše birali fajlove.';
  @override
  String get nearbyDevices => 'Uređaji u blizini';
  @override
  String get thisDevice => 'Ovaj uređaj';
  @override
  String get scan => 'Pretraga uređaja';
  @override
  String get manualSending => 'Ručno slanje';
  @override
  String get sendMode => 'Režim slanja';
  @override
  late final _TranslationsSendTabSendModesSr sendModes = _TranslationsSendTabSendModesSr._(_root);
  @override
  String get sendModeHelp => 'Objašnjenje';
  @override
  String get help => 'Uverite se da je primalac takođe na istoj Wi-Fi mreži.';
  @override
  String get placeItems => 'Postavite predmete za deljenje.';
}

// Path: settingsTab
class _TranslationsSettingsTabSr extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Podešavanja';
  @override
  late final _TranslationsSettingsTabGeneralSr general = _TranslationsSettingsTabGeneralSr._(_root);
  @override
  late final _TranslationsSettingsTabReceiveSr receive = _TranslationsSettingsTabReceiveSr._(_root);
  @override
  late final _TranslationsSettingsTabSendSr send = _TranslationsSettingsTabSendSr._(_root);
  @override
  late final _TranslationsSettingsTabNetworkSr network = _TranslationsSettingsTabNetworkSr._(_root);
  @override
  late final _TranslationsSettingsTabOtherSr other = _TranslationsSettingsTabOtherSr._(_root);
  @override
  String get advancedSettings => 'Napredna podešavanja';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageSr extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otklanjanje grešaka';
  @override
  String get subTitle => 'Da li aplikacija radi kako treba? Ovde možete pronaći neka uobičajena rešenja problema.';
  @override
  String get solution => 'Rešenje:';
  @override
  String get fixButton => 'Popravi automatski';
  @override
  late final _TranslationsTroubleshootPageFirewallSr firewall = _TranslationsTroubleshootPageFirewallSr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoverySr noDiscovery = _TranslationsTroubleshootPageNoDiscoverySr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionSr noConnection = _TranslationsTroubleshootPageNoConnectionSr._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageSr extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Istorija';
  @override
  String get openFolder => 'Otvori folder';
  @override
  String get deleteHistory => 'Izbriši istoriju';
  @override
  String get empty => 'Istorija je prazna.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsSr entryActions = _TranslationsReceiveHistoryPageEntryActionsSr._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSr extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikacije (APK)';
  @override
  String get excludeSystemApps => 'Izuzmi sistemske aplikacije';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Izuzmi aplikacije koje se ne pokreću';
  @override
  String apps({required Object n}) => '${n} aplikacija';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageSr extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Izbriši sve';
}

// Path: receivePage
class _TranslationsReceivePageSr extends TranslationsReceivePageEn {
  _TranslationsReceivePageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n, one: 'želi da vam pošalje fajl', other: 'želi da vam pošalje ${n} fajlova');
  @override
  String get subTitleMessage => 'poslao vam je poruku:';
  @override
  String get subTitleLink => 'poslao vam je link:';
  @override
  String get canceled => 'Pošiljalac je otkazao zahtev.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSr extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opcije';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automatski isključeno jer postoje folderi.';
}

// Path: sendPage
class _TranslationsSendPageSr extends TranslationsSendPageEn {
  _TranslationsSendPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čekanje odgovora…';
  @override
  String get rejected => 'Primalac je odbio zahtev.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Primalac je zauzet drugim zahtevom.';
}

// Path: progressPage
class _TranslationsProgressPageSr extends TranslationsProgressPageEn {
  _TranslationsProgressPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Slanje fajlova';
  @override
  String get titleReceiving => 'Primanje fajlova';
  @override
  String get savedToGallery => 'Sačuvano u galeriji';
  @override
  late final _TranslationsProgressPageTotalSr total = _TranslationsProgressPageTotalSr._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSr extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Deljenje putem linka';
  @override
  String get loading => 'Pokretanje servera…';
  @override
  String get stopping => 'Zaustavljanje servera…';
  @override
  String get error => 'Došlo je do greške prilikom pokretanja servera.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
    n,
    one: 'Otvorite ovaj link u vašem pregledaču:',
    other: 'Otvorite jedan od ovih linkova u vašem pregledaču:',
  );
  @override
  String get requests => 'Zahtevi';
  @override
  String get noRequests => 'Još uvek nema zahteva.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automatski prihvati zahteve';
  @override
  String get requirePin => 'Zahtevaj PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je „${pin}“';
  @override
  String get encryptionHint => 'LocalSend koristi samopotpisani sertifikat. Morate ga prihvatiti u svom pregledaču.';
  @override
  String pendingRequests({required Object n}) => 'Zahtevi na čekanju: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageSr extends TranslationsAboutPageEn {
  _TranslationsAboutPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O LocalSend-u';
  @override
  List<String> get description => [
    'LocalSend je besplatna aplikacija otvorenog koda koja vam omogućava da bezbedno delite fajlove i poruke sa uređajima u blizini preko vaše lokalne mreže, bez potrebe za internet vezom.',
    'Ova aplikacije je dostupna za Android, iOS, macOS, Windows i Linux. Možete pronaći sve opcije za preuzimanje na zvaničnoj početnoj stranici.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Saradnici';
  @override
  String get packagers => 'Pakeri';
  @override
  String get translators => 'Prevodioci';
}

// Path: donationPage
class _TranslationsDonationPageSr extends TranslationsDonationPageEn {
  _TranslationsDonationPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donacija';
  @override
  String get info => 'LocalSend je besplatan, otvorenog koda i bez ikakvih oglasa. Ako vam se sviđa aplikacija, možete podržati razvoj donacijom.';
  @override
  String donate({required Object amount}) => 'Doniraj ${amount}';
  @override
  String get thanks => 'Hvala vam puno!';
  @override
  String get restore => 'Vrati kupovinu';
}

// Path: changelogPage
class _TranslationsChangelogPageSr extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Evidencija promena';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSr extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Neodoljiva',
    'Prelepa',
    'Velika',
    'Bistra',
    'Čista',
    'Pametna',
    'Hladnjikava',
    'Slatka',
    'Lukava',
    'Odlučna',
    'Energetska',
    'Efikasna',
    'Fantastična',
    'Brza',
    'Fina',
    'Sveža',
    'Dobra',
    'Divna',
    'Velika',
    'Zgodna',
    'Vruća',
    'Nežna',
    'Ljubazna',
    'Mistična',
    'Uredna',
    'Lepa',
    'Strpljiva',
    'Prelepa',
    'Moćna',
    'Bogata',
    'Tajnovita',
    'Pametna',
    'Čvrsta',
    'Specijalna',
    'Budjava',
    'Jaka',
    'Uredna',
    'Mudra',
  ];
  @override
  List<String> get fruits => [
    'Jabuka',
    'Šljiva',
    'Banana',
    'Borovnica',
    'Ribizla',
    'Kajsija',
    'Šargarepa',
    'Trešnja',
    'Paprika',
    'Papričica',
    'Krompiruša',
    'Kupusara',
    'Rotkvica',
    'Lubenica',
    'Pečurka',
    'Mandarina',
    'Pomorandža',
    'Papaja',
    'Breskva',
    'Kruška',
    'Šišarka',
    'Dinja',
    'Bundeva',
    'Višnja',
    'Jagoda',
    'Dunja',
  ];

  /// In some languages, the adjective must be last. Not the case in Serbian, but serbian adjectives must have endings which depend on the gender of the noun. That's why we put all the Fruits with the female form and corresponding adjective endings in female form for this translation.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsSr extends TranslationsDialogsEn {
  _TranslationsDialogsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileSr addFile = _TranslationsDialogsAddFileSr._(_root);
  @override
  late final _TranslationsDialogsOpenFileSr openFile = _TranslationsDialogsOpenFileSr._(_root);
  @override
  late final _TranslationsDialogsAddressInputSr addressInput = _TranslationsDialogsAddressInputSr._(_root);
  @override
  late final _TranslationsDialogsCancelSessionSr cancelSession = _TranslationsDialogsCancelSessionSr._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileSr cannotOpenFile = _TranslationsDialogsCannotOpenFileSr._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeSr encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeSr._(_root);
  @override
  late final _TranslationsDialogsErrorDialogSr errorDialog = _TranslationsDialogsErrorDialogSr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogSr favoriteDialog = _TranslationsDialogsFavoriteDialogSr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogSr favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogSr._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogSr favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogSr._(_root);
  @override
  late final _TranslationsDialogsFileInfoSr fileInfo = _TranslationsDialogsFileInfoSr._(_root);
  @override
  late final _TranslationsDialogsFileNameInputSr fileNameInput = _TranslationsDialogsFileNameInputSr._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogSr historyClearDialog = _TranslationsDialogsHistoryClearDialogSr._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedSr localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedSr._(_root);
  @override
  late final _TranslationsDialogsMessageInputSr messageInput = _TranslationsDialogsMessageInputSr._(_root);
  @override
  late final _TranslationsDialogsNoFilesSr noFiles = _TranslationsDialogsNoFilesSr._(_root);
  @override
  late final _TranslationsDialogsNoPermissionSr noPermission = _TranslationsDialogsNoPermissionSr._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformSr notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformSr._(_root);
  @override
  late final _TranslationsDialogsQrSr qr = _TranslationsDialogsQrSr._(_root);
  @override
  late final _TranslationsDialogsQuickActionsSr quickActions = _TranslationsDialogsQuickActionsSr._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeSr quickSaveNotice = _TranslationsDialogsQuickSaveNoticeSr._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSr quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeSr._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinSr pin = _TranslationsDialogsPinSr._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSr sendModeHelp = _TranslationsDialogsSendModeHelpSr._(_root);
  @override
  late final _TranslationsDialogsZoomSr zoom = _TranslationsDialogsZoomSr._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSr extends TranslationsSanitizationEn {
  _TranslationsSanitizationSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Naziv fajla ne može biti prazan';
  @override
  String get invalid => 'Naziv fajla sadrži nevažeće znakove';
}

// Path: tray
class _TranslationsTraySr extends TranslationsTrayEn {
  _TranslationsTraySr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Napusti LocalSend';
  @override
  String get closeWindows => 'Izađi';
}

// Path: web
class _TranslationsWebSr extends TranslationsWebEn {
  _TranslationsWebSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Unesite PIN';
  @override
  String get invalidPin => 'Neispravan PIN';
  @override
  String get tooManyAttempts => 'Previše pokušaja';
  @override
  String get rejected => 'Odbijeno';
  @override
  String get files => 'Fajlovi';
  @override
  String get fileName => 'Naziv fajla';
  @override
  String get size => 'Veličina';
}

// Path: assetPicker
class _TranslationsAssetPickerSr extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potvrdi';
  @override
  String get cancel => 'Otkaži';
  @override
  String get edit => 'Izmeni';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Učitavanje neuspešno';
  @override
  String get original => 'Poreklo';
  @override
  String get preview => 'Pregled';
  @override
  String get select => 'Izaberi';
  @override
  String get emptyList => 'Očisti listu';
  @override
  String get unSupportedAssetType => 'Nepodržan tip fajla.';
  @override
  String get unableToAccessAll => 'Nije moguće pristupiti svim fajlovima na uređaju';
  @override
  String get viewingLimitedAssetsTip => 'Samo fajlovi za gledanje i albumi dostupni aplikaciji.';
  @override
  String get changeAccessibleLimitedAssets => 'Dodirnite da ažurirate dostupne fajlove';
  @override
  String get accessAllTip =>
      'Aplikacija može da pristupi samo nekim fajlovima na uređaju. Idite u sistemska podešavanja i dozvolite aplikaciji pristup svim medijima na uređaju.';
  @override
  String get goToSystemSettings => 'Idi u sistemska podešavanja';
  @override
  String get accessLimitedAssets => 'Nastavi sa ograničenim pristupom';
  @override
  String get accessiblePathName => 'Dostupni fajlovi';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Slika';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Ostali mediji';
  @override
  String get sActionPlayHint => 'pusti';
  @override
  String get sActionPreviewHint => 'pregled';
  @override
  String get sActionSelectHint => 'izaberi';
  @override
  String get sActionSwitchPathLabel => 'promeni putanju';
  @override
  String get sActionUseCameraHint => 'koristi kameru';
  @override
  String get sNameDurationLabel => 'trajanje';
  @override
  String get sUnitAssetCountLabel => 'broj';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageSr extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mrežni interfejsi';
  @override
  String get preview => 'Pregled';
  @override
  String get whitelist => 'Bela lista';
  @override
  String get blacklist => 'Crna lista';
  @override
  String get info =>
      'Podrazumevano, LocalSend koristi sve dostupne mrežne interfejse. Ovde možete izuzeti neželjene mreže. Morate restartovati server da bi se primenile promene.';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxSr extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Naziv uređaja:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveSr extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Omiljeno';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionSr extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbor';
  @override
  String files({required Object files}) => 'Fajlovi: ${files}';
  @override
  String size({required Object size}) => 'Veličina: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerSr extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fajl';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Mediji';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'Aplikacija';
  @override
  String get clipboard => 'Nalepi';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesSr extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Jedan primalac';
  @override
  String get multiple => 'Više primalaca';
  @override
  String get link => 'Deljenje putem linka';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralSr extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opšte';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSr brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsSr._(_root);
  @override
  String get color => 'Boja';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSr colorOptions = _TranslationsSettingsTabGeneralColorOptionsSr._(_root);
  @override
  String get language => 'Jezik';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSr languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSr._(_root);
  @override
  String get saveWindowPlacement => 'Sačuvaj položaj prozora nakon napuštanja';
  @override
  String get saveWindowPlacementWindows => 'Sačuvaj položaj prozora nakon izlaženja';
  @override
  String get minimizeToTray => 'Minimiziraj na sistemsku traku/traku menija prilikom zatvaranja';
  @override
  String get launchAtStartup => 'Automatski pokreni nakon prijave';
  @override
  String get launchMinimized => 'Automatsko pokretanje: Pokretanje skriveno';
  @override
  String get showInContextMenu => 'Prikaži LocalSend u kontekstualnom meniju';
  @override
  String get animations => 'Animacije';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveSr extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primanje';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatski završi';
  @override
  String get destination => 'Čuvanje u folder';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Sačuvaj medije u galeriju';
  @override
  String get saveToHistory => 'Sačuvaj u istoriji';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendSr extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  String get shareViaLinkAutoAccept => 'Automatski prihvati zahteve u režimu „Deljenje putem linka“';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSr extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mreža';
  @override
  String get needRestart => 'Restartujte server da bi se primenila podešavanja!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Naziv uređaja';
  @override
  String get deviceType => 'Tip uređaja';
  @override
  String get deviceModel => 'Model uređaja';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Otkrivanje je isteklo';
  @override
  String get useSystemName => 'Koristi sistemski naziv';
  @override
  String get generateRandomAlias => 'Generiši nasumični pseudonim';
  @override
  String portWarning({required Object defaultPort}) =>
      'Drugi uređaji vas možda neće otkriti, jer koristite prilagođeni port. (podrazumevani: ${defaultPort})';
  @override
  String get encryption => 'Šifrovanje';
  @override
  String get multicastGroup => 'Adresa višesmernog emitovanja';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Drugi uređaji vas možda neće otkriti, jer koristite prilagođenu adresu višesmernog emitovanja. (podrazumevana: ${defaultMulticast})';
  @override
  String get network => 'Mreža';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsSr networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsSr._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSr extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ostalo';
  @override
  String get support => 'Podržite LocalSend';
  @override
  String get donate => 'Doniraj';
  @override
  String get privacyPolicy => 'Politika privatnosti';
  @override
  String get termsOfUse => 'Uslovi korišćenja';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallSr extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ovaj uređaj može slati fajlove drugim uređajima, ali drugi uređaji ne mogu slati fajlove ovom uređaju.';
  @override
  String solution({required Object port}) =>
      'Ovo je najverovatnije problem sa zaštitnim zidom. Ovo možete rešiti tako što ćete dozvoliti dolazne veze (UDP i TCP) na portu ${port}.';
  @override
  String get openFirewallSettings => 'Otvori zaštitni zid';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySr extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ovaj uređaj ne može da otkrije druge uređaje.';
  @override
  String get solution =>
      'Uverite se da su svi uređaji na istoj Wi-Fi mreži i da imaju istu konfiguraciju (port, adresa višesmernog emitovanja, šifrovanje). Možete pokušati da ručno unesete IP adresu ciljnog uređaja. Ako ovo funkcioniše, razmislite o dodavanju ovog uređaja u omiljene kako bi se mogao automatski otkriti u budućnosti.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSr extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Oba uređaja ne mogu da otkriju jedan drugog niti mogu da dele fajlove.';
  @override
  String get solution =>
      'Da li problem postoji na obe strane? Ako je tako, potrebno je da se uverite da su oba uređaja na istoj Wi-Fi mreži i da imaju istu konfiguraciju (port, adresa višesmernog emitovanja, šifrovanje). Wi-Fi mreža možda neće dozvoliti komunikaciju između učesnika zbog izolacije pristupne tačke (AP). U ovom slučaju, ova opcija mora biti onemogućena na ruteru.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSr extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otvori fajl';
  @override
  String get showInFolder => 'Prikaži u folderu';
  @override
  String get info => 'Informacije';
  @override
  String get deleteFromHistory => 'Izbriši iz istorije';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalSr extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleSr title = _TranslationsProgressPageTotalTitleSr._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fajlova: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Veličina: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Brzina: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileSr extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodajte u izbor';
  @override
  String get content => 'Šta želite dodati?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSr extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otvori fajl';
  @override
  String get content => 'Želite li da otvorite primljeni fajl?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSr extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite adresu';
  @override
  String get hashtag => 'Heš-oznaka';
  @override
  String get ip => 'IP adresa';
  @override
  String get recentlyUsed => 'Nedavno korišćeno: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionSr extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otkažite prenos fajlova';
  @override
  String get content => 'Želite li zaista da otkažete prenos fajlova?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSr extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije moguće otvoriti fajl';
  @override
  String content({required Object file}) => 'Nije moguće otvoriti „${file}“. Da li je ovaj fajl premešten, preimenovan ili izbrisan?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSr extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifrovanje onemogućeno';
  @override
  String get content =>
      'Komunikacija se sada odvija preko nešifrovanog HTTP protokola. Da biste koristili HTTPS protokol, ponovo omogućite šifrovanje.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSr extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSr extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Omiljeno';
  @override
  String get noFavorites => 'Još uvek nema omiljenih uređaja.';
  @override
  String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogSr extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbriši iz omiljenih';
  @override
  String content({required Object name}) => 'Želite li zaista da izbrišete „${name}“ iz omiljenih?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSr extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Dodajte u omiljene';
  @override
  String get titleEdit => 'Podešavanja';
  @override
  String get name => 'Naziv uređaja';
  @override
  String get auto => '(automatski)';
  @override
  String get ip => 'IP adresa';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoSr extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informacije o fajlu';
  @override
  String get fileName => 'Naziv fajla:';
  @override
  String get path => 'Putanja:';
  @override
  String get size => 'Veličina:';
  @override
  String get sender => 'Pošiljalac:';
  @override
  String get time => 'Vreme:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputSr extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite naziv fajla';
  @override
  String original({required Object original}) => 'Originalni naziv fajla: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSr extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Očistite istoriju';
  @override
  String get content => 'Želite li zaista da očistite čitavu istoriju?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSr extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend ne može da pronađe druge uređaje bez dozvole za skeniranje lokalne mreže. Dajte ovu dozvolu u podešavanjima.';
  @override
  String get gotoSettings => 'Podešavanja';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputSr extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Napišite poruku';
  @override
  String get multiline => 'Više redova';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSr extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije izabran nijedan fajl';
  @override
  String get content => 'Izaberite bar jedan fajl.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSr extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nema dozvole';
  @override
  String get content => 'Niste dali neophodne dozvole. Dajte ih u podešavanjima.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSr extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije dostupno';
  @override
  String get content => 'Ova funkcija je dostupna samo na:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSr extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kôd';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSr extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Brze radnje';
  @override
  String get counter => 'Brojač';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Dopuna nulama';
  @override
  String get sortBeforeCount => 'Sortiraj unapred po abecedi (A-Z)';
  @override
  String get random => 'Nasumično';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeSr extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Zahtevi za fajlove se sada automatski prihvataju. Imajte na umu da svi na lokalnoj mreži mogu da vam šalju fajlove.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSr extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Zahtevi za fajlove se sada automatski prihvataju sa uređaja koji su na vašoj listi omiljenih.',
    'Upozorenje! Trenutno, ovo nije potpuno bezbedno, jer haker koji ima otisak prsta bilo kog uređaja sa vaše liste omiljenih može da vam šalje fajlove bez ograničenja.',
    'Ipak, ova opcija je i dalje bezbednija od dopuštanja svim korisnicima na lokalnoj mreži da vam šalju fajlove bez ograničenja.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinSr extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSr extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Režimi slanja';
  @override
  String get single => 'Slanje fajlova jednom primaocu. Izbor će biti očišćen nakon završenog prenosa fajlova.';
  @override
  String get multiple => 'Slanje fajlova više primalaca. Izbor neće biti očišćen nakon završenog prenosa fajlova.';
  @override
  String get link => 'Primaoci koji nemaju instaliran LocalSend mogu preuzeti izabrane fajlove otvaranjem linka u svom pregledaču.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomSr extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSr extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemska';
  @override
  String get dark => 'Tamna';
  @override
  String get light => 'Svetla';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsSr extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemska';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSr extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemski';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsSr extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'Filtrirana';
  @override
  String get all => 'Sve';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSr extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSr._(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Ukupan napredak (${time})';
  @override
  String get finishedError => 'Završeno sa greškom';
  @override
  String get canceledSender => 'Pošiljalac je otkazao';
  @override
  String get canceledReceiver => 'Primalac je otkazao';
}
