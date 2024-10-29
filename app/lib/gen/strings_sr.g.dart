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
  String get locale => 'Srpski';
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
}

// Path: general
class _TranslationsGeneralSr extends TranslationsGeneralEn {
  _TranslationsGeneralSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  String get cancel => 'Odustani';
  @override
  String get close => 'Zatvori';
  @override
  String get confirm => 'Potvrdi';
  @override
  String get continueStr => 'Nastavi';
  @override
  String get copy => 'Kopiraj';
  @override
  String get copiedToClipboard => 'Kopirano u Clipboard';
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
  String get offline => 'Offline';
  @override
  String get on => 'Uključeno';
  @override
  String get online => 'Online';
  @override
  String get open => 'Otvori';
  @override
  String get queue => 'Stavi u Queue';
  @override
  String get quickSave => 'Brzo snimi';
  @override
  String get quickSaveFromFavorites => 'Brzo snimi u "Omiljeni"';
  @override
  String get renamed => 'Preimenovano';
  @override
  String get reset => 'Resetuj';
  @override
  String get restart => 'Restartuj';
  @override
  String get settings => 'Postavke';
  @override
  String get skipped => 'Propušteno';
  @override
  String get start => 'Startuj';
  @override
  String get stop => 'Zaustavi';
  @override
  String get save => 'Snimi';
  @override
  String get unchanged => 'Nepromenjeno';
  @override
  String get unknown => 'Nepoznato';
  @override
  String get noItemInClipboard => 'Nema itema u Clipboard-u';
}

// Path: receiveTab
class _TranslationsReceiveTabSr extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSendTabSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  late final _TranslationsSendTabSelectionSr selection = _TranslationsSendTabSelectionSr._(_root);
  @override
  late final _TranslationsSendTabPickerSr picker = _TranslationsSendTabPickerSr._(_root);
  @override
  String get shareIntentInfo => 'Možeš takodje da koristiš i "Share" opciju tvog mobilnog uredjaja da bi lakše selektovao fajlove.';
  @override
  String get nearbyDevices => 'Uredjaji u blizini';
  @override
  String get thisDevice => 'Ovaj uredjaj';
  @override
  String get scan => 'Potraži uredjaje';
  @override
  String get manualSending => 'Manuelno slanje';
  @override
  String get sendMode => 'Mod za slanje';
  @override
  late final _TranslationsSendTabSendModesSr sendModes = _TranslationsSendTabSendModesSr._(_root);
  @override
  String get sendModeHelp => 'Objašnjenje';
  @override
  String get help => 'Molim uveri se da je željena destinacija takodje na istoj WiFi mreži.';
  @override
  String get placeItems => 'Postavi šta želiš da share-uješ.';
}

// Path: settingsTab
class _TranslationsSettingsTabSr extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Podešavanje';
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
  _TranslationsTroubleshootPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Troubleshoot';
  @override
  String get subTitle => 'Da li aplikacija radi kako treba? Ovde možete naći neka uobičajena rešenja.';
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
  _TranslationsReceiveHistoryPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Istorija';
  @override
  String get openFolder => 'Otvori folder';
  @override
  String get deleteHistory => 'Obriši Istoriju';
  @override
  String get empty => 'Istorija je prazna.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsSr entryActions = _TranslationsReceiveHistoryPageEntryActionsSr._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSr extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikacije (APK)';
  @override
  String get excludeSystemApps => 'Izostavi sistemske aplikacije';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Izostavi aplikacije koje se ne pokreću';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageSr extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Obriši sve';
}

// Path: receivePage
class _TranslationsReceivePageSr extends TranslationsReceivePageEn {
  _TranslationsReceivePageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
        n,
        one: 'želi da pošalje fajl',
        other: 'želi da pošalje ${n} fajlova',
      );
  @override
  String get subTitleMessage => 'je poslao poruku:';
  @override
  String get subTitleLink => 'je poslao Link:';
  @override
  String get canceled => 'Pošiljalac je poništio zahtev.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSr extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  String get saveToGalleryOff => 'Isključeno automatski zato što postoje folderi.';
}

// Path: sendPage
class _TranslationsSendPageSr extends TranslationsSendPageEn {
  _TranslationsSendPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čekam odgovor...';
  @override
  String get rejected => 'Primalac je odbio zahtev.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Primalac je zauzet nekim drugim zahtevom za slanje.';
}

// Path: progressPage
class _TranslationsProgressPageSr extends TranslationsProgressPageEn {
  _TranslationsProgressPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Slanje fajlova';
  @override
  String get titleReceiving => 'Primanje fajlova';
  @override
  String get savedToGallery => 'Snimljeno u Slike';
  @override
  late final _TranslationsProgressPageTotalSr total = _TranslationsProgressPageTotalSr._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSr extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Deli pomoću Linka';
  @override
  String get loading => 'Pokrećem server...';
  @override
  String get stopping => 'Zaustavljam server...';
  @override
  String get error => 'Prilikom pokretanja servera dogodila se greška.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
        n,
        one: 'Otvori ovaj link u browseru:',
        other: 'Otvori jedan od ovih linkova u browseru:',
      );
  @override
  String get requests => 'Zahtevi';
  @override
  String get noRequests => 'Nema zahteva još uvek.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automatski prihvati zahteve';
  @override
  String get requirePin => 'Potreban PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je "${pin}"';
  @override
  String get encryptionHint => 'LocalSend koristi sertifikate koji su self-signed. Morate da prihvatite to u browseru.';
  @override
  String pendingRequests({required Object n}) => 'Zahtevi na čekanju: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageSr extends TranslationsAboutPageEn {
  _TranslationsAboutPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O LocalSend-u';
  @override
  List<String> get description => [
        'LocalSend je besplatna (slobodna) open-source aplikacija, koja vam omogućava da delite fajlove i poruke sa obližnjim uredjajima sigurno, preko lokalne mreže, bez potrebe za internet konekcijom.',
        'Ova aplikacije je dostupna za Android, iOS, macOS, Windows i Linux. Možete pronaći sve opcije za download na oficijelnoj web strani.',
      ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Saradnici';
  @override
  String get packagers => 'Paketi';
  @override
  String get translators => 'Prevodioci';
}

// Path: donationPage
class _TranslationsDonationPageSr extends TranslationsDonationPageEn {
  _TranslationsDonationPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doniraj';
  @override
  String get info =>
      'LocalSend je slobodna, open-source aplikacije bez reklama. Ako vam se dopada aplikacija, možete podržati razvoj putem donacije.';
  @override
  String donate({required Object amount}) => 'Doniraj ${amount}';
  @override
  String get thanks => 'Hvala vam!';
  @override
  String get restore => 'Obnovi kupovinu';
}

// Path: changelogPage
class _TranslationsChangelogPageSr extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Log Promena';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSr extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSr quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeSr._(_root);
  @override
  late final _TranslationsDialogsPinSr pin = _TranslationsDialogsPinSr._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSr sendModeHelp = _TranslationsDialogsSendModeHelpSr._(_root);
  @override
  late final _TranslationsDialogsZoomSr zoom = _TranslationsDialogsZoomSr._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSr extends TranslationsSanitizationEn {
  _TranslationsSanitizationSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ime fajla ne može biti prazno';
  @override
  String get invalid => 'Ime fajla sadrži nedozvoljene karaktere';
}

// Path: tray
class _TranslationsTraySr extends TranslationsTrayEn {
  _TranslationsTraySr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Quit LocalSend';
  @override
  String get closeWindows => 'Izadji';
}

// Path: web
class _TranslationsWebSr extends TranslationsWebEn {
  _TranslationsWebSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Unesi PIN';
  @override
  String get invalidPin => 'Neispravan PIN';
  @override
  String get tooManyAttempts => 'Previše pokušaja';
  @override
  String get rejected => 'Odbijeno';
  @override
  String get files => 'Fajlovi';
  @override
  String get fileName => 'Ime fajla';
  @override
  String get size => 'Veličina';
}

// Path: assetPicker
class _TranslationsAssetPickerSr extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potvrdi';
  @override
  String get cancel => 'Odustani';
  @override
  String get edit => 'Izmeni';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Učitavanje neuspešno';
  @override
  String get original => 'Poreklo';
  @override
  String get preview => 'Pogledaj';
  @override
  String get select => 'Izaberi';
  @override
  String get emptyList => 'Isprazni listu';
  @override
  String get unSupportedAssetType => 'Tip fajla nije podržan.';
  @override
  String get unableToAccessAll => 'Nemoguće pristupiti svim fajlovima na ovom uredjaju';
  @override
  String get viewingLimitedAssetsTip => 'Samo view fajlovi i albumi dostupni aplikaciji.';
  @override
  String get changeAccessibleLimitedAssets => 'Klikni da updatuješ dostupne fajlove';
  @override
  String get accessAllTip =>
      'Aplikacija može da pristupi samo nekim fajlovima na uredjaju.Idi u Sistemska podešavanja i dozvoli aplikaciji pristup svim medijskim fajlovima na uredjaju.';
  @override
  String get goToSystemSettings => 'Idi u Sistemska podešavanja';
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
  String get sTypeOtherLabel => 'Druga vrsta medija';
  @override
  String get sActionPlayHint => 'play';
  @override
  String get sActionPreviewHint => 'preview';
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

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxSr extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Ime uredjaja:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveSr extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Omiljeni';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionSr extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selekcija';
  @override
  String files({required Object files}) => 'Fajlovi: ${files}';
  @override
  String size({required Object size}) => 'Veličina: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerSr extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fajl';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Media';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Nalepi';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesSr extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Jedan primalac';
  @override
  String get multiple => 'Više primalaca';
  @override
  String get link => 'Deli pomoću Linka';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralSr extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Uopšteno';
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
  String get saveWindowPlacement => 'Izadji: Snimi položaj prozora';
  @override
  String get saveWindowPlacementWindows => 'Zapamti poziciju prozora nakon izlaska iz aplikacije';
  @override
  String get minimizeToTray => 'Izadji: Minimizuj u Tray/MenuBar';
  @override
  String get launchAtStartup => 'Autostartuj posle login-a';
  @override
  String get launchMinimized => 'Autostartuj: Start sakriven';
  @override
  String get showInContextMenu => 'Prikaži LocalSend u kontekst meniju';
  @override
  String get animations => 'Animacije';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveSr extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  String get destination => 'Destinacija';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Snimi media-fajlove u Galeriju';
  @override
  String get saveToHistory => 'Snimi u Istoriju';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendSr extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  String get shareViaLinkAutoAccept => 'Podeli preko Link-a: Automatski prihvati';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSr extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mreža';
  @override
  String get needRestart => 'Restartuj server da bi Podešavanja bila primenjena!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Ime uredjaja';
  @override
  String get deviceType => 'Tip uredjaja';
  @override
  String get deviceModel => 'Model uredjaja';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Otkrivanje otkazano';
  @override
  String get useSystemName => 'Koristi ime sistema';
  @override
  String get generateRandomAlias => 'Generiši slučajni pseudonim';
  @override
  String portWarning({required Object defaultPort}) =>
      'Možda nećete biti pronadjeni od strane drugih uredjaja jer koristite custom Port.(default: ${defaultPort})';
  @override
  String get encryption => 'Enkripcija';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Možda nećete biti pronadjeni od strane drugih uredjaja jer koristite custom multicast adresu. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSr extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Drugo';
  @override
  String get support => 'Podrži LocalSend';
  @override
  String get donate => 'Doniraj';
  @override
  String get privacyPolicy => 'Politika Privatnosti';
  @override
  String get termsOfUse => 'Uslovi korišćenja';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallSr extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ova aplikacija može poslati fajlove drugim uredjajima; ali drugi uredjaji ne mogu poslati fajlove ovom uredjaju.';
  @override
  String solution({required Object port}) =>
      'Ovo je najverovatnije Firewall problem. Možete rešiti ovo omogućavanjem dolaznih konekcija (UDP and TCP) na portu ${port}.';
  @override
  String get openFirewall => 'Otvori Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySr extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ovaj uredjaj ne može da pronadje druge uredjaje.';
  @override
  String get solution =>
      'Uverite se da su svi uredjaji na istoj Wi-Fi mreži i da dele istu konfiguraciju (port, multikast adresu, enkripciju). Možete da pokušate da upišete IP adresu manuelno. Ako to radi, razmislite o dodavanju te adrese u Omiljene tako da uredjaj može da bude automatski pronadjen u budućnosti.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSr extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Uredjaji ne mogu ni da pronadju jedan drugog, ni da podele fajlove.';
  @override
  String get solution =>
      'Da li problem postoji na obe strane? Ako je tako, morate da se uverite da se oba uredjaja nalaze na istoj Wi-Fi mreži i da dele istu konfiguraciju (port, multicast adresa, enkripcija). Mreža možda ne dozvoljava komunikaciju medju uredjajima. U ovom slučaju, ova opcija mora biti omogućena na ruteru.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSr extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otvori fajl';
  @override
  String get showInFolder => 'Prikaži u folderu';
  @override
  String get info => 'Informacije';
  @override
  String get deleteFromHistory => 'Obriši iz Istorije.';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalSr extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsAddFileSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodaj u Selekciju';
  @override
  String get content => 'Šta želiš da dodaš?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSr extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otvori fajl';
  @override
  String get content => 'Da li želite da otvorite primljeni fajl?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSr extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Upiši adresu';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Adresa';
  @override
  String get recentlyUsed => 'Nedavno korišćeno: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionSr extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odustani od prebacivanja fajla';
  @override
  String get content => 'Da li stvarno želiš da odustaneš od slanja fajla?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSr extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ne mogu da otvorim fajl';
  @override
  String content({required Object file}) => 'Ne mogu da otvorim "${file}". Da li je ovaj fajl negde pomeren, preimenovan, ili obrisan?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSr extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enkripcija onemogućena';
  @override
  String get content => 'Komunikacija se sada vrši preko ne-enkriptovanog HTTP protokola. Da bi koristio HTTPS, omogući Enkripciju opet.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSr extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSr extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Omiljeni';
  @override
  String get noFavorites => 'Nema omiljenih uredjaja još uvek.';
  @override
  String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogSr extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbriši iz Omiljenih';
  @override
  String content({required Object name}) => 'Da li stvarno želiš da izbrišeš iz Omiljenih "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSr extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Dodaj u Omiljene';
  @override
  String get titleEdit => 'Podešavanja';
  @override
  String get name => 'Ime Uredjaja';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP Adresa';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoSr extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informacije o fajlu';
  @override
  String get fileName => 'Ime fajla:';
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
  _TranslationsDialogsFileNameInputSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ubaci ima fajla';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSr extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Očisti Istoriju';
  @override
  String get content => 'Da li stvarno želiš da izbrišeš celu Istoriju?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSr extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend ne može da nadje druge uredjaje bez dozvole da skenira lokalnu mrežu. Molim dodajte ovu dozvolu u Podešavanja.';
  @override
  String get gotoSettings => 'Podešavanja';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputSr extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Upiši poruku';
  @override
  String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSr extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nijedan fajl nije izabran';
  @override
  String get content => 'Molim izaberite bar jedan fajl.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSr extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nema dozvole';
  @override
  String get content => 'Niste dodali neophodne dozvole. Molim dodajte ih u Podešavanja.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSr extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije dostupno';
  @override
  String get content => 'Ova opcija je dostupna samo na:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSr extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSr extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Brze Akcije';
  @override
  String get counter => 'Merač';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Bez padding-a';
  @override
  String get sortBeforeCount => 'Sortiraj po abecedi prethodno';
  @override
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeSr extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Zahtevi za slanje fajlova su automatski prihvaćeni. Primite k znanju da bilo ko na lokalnoj mreži može da vam pošalje fajl.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSr extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
        'Zahtevi za primanje fajlova su automatski prihvaćeni od uredjaja u listi Omiljenih.',
        'Upozorenje: Ovo trenutno nije potpuno bezbedno, jer napadač koji zna Fingerprint vašeg uredjaja u Omiljenima takodje može da vam pošalje fajl.',
        'Ipak, ovo je i dalje sigurnije nego dozvoliti prijem sa svih uredjaja.',
      ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinSr extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesi PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSr extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mod za slanje';
  @override
  String get single => 'Pošalji fajlove jednom primaocu. Selekcija će biti resetovana nakon završenog slanja.';
  @override
  String get multiple => 'Pošalji fajlove za više primalaca. Selekcija neće biti resetovana nakon završenog slanja.';
  @override
  String get link => 'Primaoci koji nemaju LocalSend instaliran, mogu da download-uju selektovane fajlove preko Linka u browseru.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomSr extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSr extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Tamno';
  @override
  String get light => 'Svetlo';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsSr extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSr extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSr extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSr._(TranslationsSr root)
      : this._root = root,
        super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Ukupan progres (${time})';
  @override
  String get finishedError => 'Završeno sa greškom';
  @override
  String get canceledSender => 'Pošiljalac odustao';
  @override
  String get canceledReceiver => 'Primalac odustao';
}
