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
class TranslationsIt extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.it,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <it>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsIt _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Italiano';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralIt general = _TranslationsGeneralIt._(_root);
  @override
  late final _TranslationsReceiveTabIt receiveTab = _TranslationsReceiveTabIt._(_root);
  @override
  late final _TranslationsSendTabIt sendTab = _TranslationsSendTabIt._(_root);
  @override
  late final _TranslationsSettingsTabIt settingsTab = _TranslationsSettingsTabIt._(_root);
  @override
  late final _TranslationsTroubleshootPageIt troubleshootPage = _TranslationsTroubleshootPageIt._(_root);
  @override
  late final _TranslationsReceiveHistoryPageIt receiveHistoryPage = _TranslationsReceiveHistoryPageIt._(_root);
  @override
  late final _TranslationsApkPickerPageIt apkPickerPage = _TranslationsApkPickerPageIt._(_root);
  @override
  late final _TranslationsSelectedFilesPageIt selectedFilesPage = _TranslationsSelectedFilesPageIt._(_root);
  @override
  late final _TranslationsReceivePageIt receivePage = _TranslationsReceivePageIt._(_root);
  @override
  late final _TranslationsReceiveOptionsPageIt receiveOptionsPage = _TranslationsReceiveOptionsPageIt._(_root);
  @override
  late final _TranslationsSendPageIt sendPage = _TranslationsSendPageIt._(_root);
  @override
  late final _TranslationsProgressPageIt progressPage = _TranslationsProgressPageIt._(_root);
  @override
  late final _TranslationsWebSharePageIt webSharePage = _TranslationsWebSharePageIt._(_root);
  @override
  late final _TranslationsAboutPageIt aboutPage = _TranslationsAboutPageIt._(_root);
  @override
  late final _TranslationsDonationPageIt donationPage = _TranslationsDonationPageIt._(_root);
  @override
  late final _TranslationsChangelogPageIt changelogPage = _TranslationsChangelogPageIt._(_root);
  @override
  late final _TranslationsAliasGeneratorIt aliasGenerator = _TranslationsAliasGeneratorIt._(_root);
  @override
  late final _TranslationsDialogsIt dialogs = _TranslationsDialogsIt._(_root);
  @override
  late final _TranslationsSanitizationIt sanitization = _TranslationsSanitizationIt._(_root);
  @override
  late final _TranslationsTrayIt tray = _TranslationsTrayIt._(_root);
  @override
  late final _TranslationsWebIt web = _TranslationsWebIt._(_root);
  @override
  late final _TranslationsAssetPickerIt assetPicker = _TranslationsAssetPickerIt._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageIt networkInterfacesPage = _TranslationsNetworkInterfacesPageIt._(_root);
}

// Path: general
class _TranslationsGeneralIt extends TranslationsGeneralEn {
  _TranslationsGeneralIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Accetta';
  @override
  String get accepted => 'Accettato';
  @override
  String get add => 'Aggiungi';
  @override
  String get advanced => 'Avanzate';
  @override
  String get cancel => 'Annulla';
  @override
  String get close => 'Chiudi';
  @override
  String get confirm => 'Conferma';
  @override
  String get continueStr => 'Continua';
  @override
  String get copy => 'Copia';
  @override
  String get copiedToClipboard => 'Copiato negli Appunti';
  @override
  String get decline => 'Rifiuta';
  @override
  String get done => 'Fatto';
  @override
  String get delete => 'Cancella';
  @override
  String get edit => 'Modifica';
  @override
  String get error => 'Errore';
  @override
  String get example => 'Esempio';
  @override
  String get files => 'File';
  @override
  String get finished => 'Completato';
  @override
  String get hide => 'Nascondi';
  @override
  String get off => 'Disattivato';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Attivato';
  @override
  String get online => 'Online';
  @override
  String get open => 'Apri';
  @override
  String get queue => 'Coda';
  @override
  String get quickSave => 'Salvataggio rapido';
  @override
  String get quickSaveFromFavorites => 'Salvataggio rapido per "Preferiti"';
  @override
  String get renamed => 'Rinominato';
  @override
  String get reset => 'Reset';
  @override
  String get restart => 'Riavvia';
  @override
  String get settings => 'Impostazioni';
  @override
  String get skipped => 'Saltato';
  @override
  String get start => 'Inizia';
  @override
  String get stop => 'Arresta';
  @override
  String get save => 'Salva';
  @override
  String get unchanged => 'Invariato';
  @override
  String get unknown => 'Sconosciuto';
  @override
  String get noItemInClipboard => 'Nessun elemento negli Appunti.';
}

// Path: receiveTab
class _TranslationsReceiveTabIt extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ricevi';
  @override
  late final _TranslationsReceiveTabInfoBoxIt infoBox = _TranslationsReceiveTabInfoBoxIt._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveIt quickSave = _TranslationsReceiveTabQuickSaveIt._(_root);
}

// Path: sendTab
class _TranslationsSendTabIt extends TranslationsSendTabEn {
  _TranslationsSendTabIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Invia';
  @override
  late final _TranslationsSendTabSelectionIt selection = _TranslationsSendTabSelectionIt._(_root);
  @override
  late final _TranslationsSendTabPickerIt picker = _TranslationsSendTabPickerIt._(_root);
  @override
  String get shareIntentInfo => 'Puoi anche usare la funzione "Condividi" del dispositivo mobile per selezionare più facilmente i file.';
  @override
  String get nearbyDevices => 'Dispositivi vicini';
  @override
  String get thisDevice => 'Questo dispositivo';
  @override
  String get scan => 'Cerca dispositivi';
  @override
  String get manualSending => 'Invio manuale';
  @override
  String get sendMode => 'Modalità di invio';
  @override
  late final _TranslationsSendTabSendModesIt sendModes = _TranslationsSendTabSendModesIt._(_root);
  @override
  String get sendModeHelp => 'Spiegazione';
  @override
  String get help => 'Assicurati che il destinatario desiderato si trovi sulla stessa rete Wi-Fi.';
  @override
  String get placeItems => 'Rilascia qui gli elementi da condividere.';
}

// Path: settingsTab
class _TranslationsSettingsTabIt extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Impostazioni';
  @override
  late final _TranslationsSettingsTabGeneralIt general = _TranslationsSettingsTabGeneralIt._(_root);
  @override
  late final _TranslationsSettingsTabReceiveIt receive = _TranslationsSettingsTabReceiveIt._(_root);
  @override
  late final _TranslationsSettingsTabSendIt send = _TranslationsSettingsTabSendIt._(_root);
  @override
  late final _TranslationsSettingsTabNetworkIt network = _TranslationsSettingsTabNetworkIt._(_root);
  @override
  late final _TranslationsSettingsTabOtherIt other = _TranslationsSettingsTabOtherIt._(_root);
  @override
  String get advancedSettings => 'Impostazioni avanzate';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageIt extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Risoluzione dei problemi';
  @override
  String get subTitle => 'L\'app non funziona come previsto? Qui puoi trovare le soluzioni più comuni.';
  @override
  String get solution => 'Soluzione:';
  @override
  String get fixButton => 'Risolvi automaticamente';
  @override
  late final _TranslationsTroubleshootPageFirewallIt firewall = _TranslationsTroubleshootPageFirewallIt._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryIt noDiscovery = _TranslationsTroubleshootPageNoDiscoveryIt._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionIt noConnection = _TranslationsTroubleshootPageNoConnectionIt._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageIt extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cronologia';
  @override
  String get openFolder => 'Apri cartella';
  @override
  String get deleteHistory => 'Elimina cronologia';
  @override
  String get empty => 'La cronologia è vuota.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsIt entryActions = _TranslationsReceiveHistoryPageEntryActionsIt._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageIt extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'App (APK)';
  @override
  String get excludeSystemApps => 'Escludi app di sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Escludi app non avviabili';
  @override
  String apps({required Object n}) => '${n} App';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageIt extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Rimuovi tutti';
}

// Path: receivePage
class _TranslationsReceivePageIt extends TranslationsReceivePageEn {
  _TranslationsReceivePageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(n, one: 'vuole inviarti un file', other: 'vuole inviarti ${n} file');
  @override
  String get subTitleMessage => 'ti ha inviato un messaggio:';
  @override
  String get subTitleLink => 'ti ha inviato un link:';
  @override
  String get canceled => 'Il mittente ha annullato la richiesta.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageIt extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opzioni';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(cartella LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Disattivato automaticamente in presenza di cartelle.';
}

// Path: sendPage
class _TranslationsSendPageIt extends TranslationsSendPageEn {
  _TranslationsSendPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'In attesa di risposta…';
  @override
  String get rejected => 'Il destinatario ha rifiutato la richiesta.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Il destinatario è occupato con un\'altra richiesta.';
}

// Path: progressPage
class _TranslationsProgressPageIt extends TranslationsProgressPageEn {
  _TranslationsProgressPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Invio di file in corso';
  @override
  String get titleReceiving => 'Ricezione di file in corso';
  @override
  String get savedToGallery => 'Salvato in Galleria';
  @override
  late final _TranslationsProgressPageTotalIt total = _TranslationsProgressPageTotalIt._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageIt extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Condividi tramite link';
  @override
  String get loading => 'Avvio del server…';
  @override
  String get stopping => 'Arresto del server…';
  @override
  String get error => 'Si è verificato un errore durante l\'avvio del server.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
    n,
    one: 'Apri questo link nel browser:',
    other: 'Apri uno di questi link nel browser:',
  );
  @override
  String get requests => 'Richieste';
  @override
  String get noRequests => 'Ancora nessuna richiesta.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Accetta automaticamente le richieste';
  @override
  String get requirePin => 'Richiedi PIN';
  @override
  String pinHint({required Object pin}) => 'Il PIN è "${pin}"';
  @override
  String get encryptionHint => 'LocalSend utilizza un certificato autofirmato. Devi accettarlo nel browser.';
  @override
  String pendingRequests({required Object n}) => 'Richieste in sospeso: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageIt extends TranslationsAboutPageEn {
  _TranslationsAboutPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informazioni su LocalSend';
  @override
  List<String> get description => [
    'LocalSend è un\'app gratuita e open-source che consente di condividere file e messaggi in modo sicuro con dispositivi vicini sulla tua rete locale, senza bisogno di una connessione internet.',
    'Quest\'app è disponibile su Android, iOS, macOS, Windows e Linux. Puoi trovare tutte le opzioni di download sulla homepage ufficiale.',
  ];
  @override
  String get author => 'Autore';
  @override
  String get contributors => 'Contributori';
  @override
  String get packagers => 'Packager';
  @override
  String get translators => 'Traduttori';
}

// Path: donationPage
class _TranslationsDonationPageIt extends TranslationsDonationPageEn {
  _TranslationsDonationPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dona';
  @override
  String get info =>
      'LocalSend è gratuito, open-source e privo di pubblicità. Se ti piace l\'applicazione, puoi supportarne lo sviluppo con una donazione.';
  @override
  String donate({required Object amount}) => 'Dona ${amount}';
  @override
  String get thanks => 'Grazie per il tuo supporto!';
  @override
  String get restore => 'Ripristina acquisti';
}

// Path: changelogPage
class _TranslationsChangelogPageIt extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorIt extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsIt extends TranslationsDialogsEn {
  _TranslationsDialogsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileIt addFile = _TranslationsDialogsAddFileIt._(_root);
  @override
  late final _TranslationsDialogsOpenFileIt openFile = _TranslationsDialogsOpenFileIt._(_root);
  @override
  late final _TranslationsDialogsAddressInputIt addressInput = _TranslationsDialogsAddressInputIt._(_root);
  @override
  late final _TranslationsDialogsCancelSessionIt cancelSession = _TranslationsDialogsCancelSessionIt._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileIt cannotOpenFile = _TranslationsDialogsCannotOpenFileIt._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeIt encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeIt._(_root);
  @override
  late final _TranslationsDialogsErrorDialogIt errorDialog = _TranslationsDialogsErrorDialogIt._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogIt favoriteDialog = _TranslationsDialogsFavoriteDialogIt._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogIt favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogIt._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogIt favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogIt._(_root);
  @override
  late final _TranslationsDialogsFileInfoIt fileInfo = _TranslationsDialogsFileInfoIt._(_root);
  @override
  late final _TranslationsDialogsFileNameInputIt fileNameInput = _TranslationsDialogsFileNameInputIt._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogIt historyClearDialog = _TranslationsDialogsHistoryClearDialogIt._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedIt localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedIt._(_root);
  @override
  late final _TranslationsDialogsMessageInputIt messageInput = _TranslationsDialogsMessageInputIt._(_root);
  @override
  late final _TranslationsDialogsNoFilesIt noFiles = _TranslationsDialogsNoFilesIt._(_root);
  @override
  late final _TranslationsDialogsNoPermissionIt noPermission = _TranslationsDialogsNoPermissionIt._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformIt notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformIt._(_root);
  @override
  late final _TranslationsDialogsQrIt qr = _TranslationsDialogsQrIt._(_root);
  @override
  late final _TranslationsDialogsQuickActionsIt quickActions = _TranslationsDialogsQuickActionsIt._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeIt quickSaveNotice = _TranslationsDialogsQuickSaveNoticeIt._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeIt quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeIt._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinIt pin = _TranslationsDialogsPinIt._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpIt sendModeHelp = _TranslationsDialogsSendModeHelpIt._(_root);
  @override
  late final _TranslationsDialogsZoomIt zoom = _TranslationsDialogsZoomIt._(_root);
}

// Path: sanitization
class _TranslationsSanitizationIt extends TranslationsSanitizationEn {
  _TranslationsSanitizationIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Il nome del file non può essere vuoto';
  @override
  String get invalid => 'Il nome del file contiene dei caratteri non validi';
}

// Path: tray
class _TranslationsTrayIt extends TranslationsTrayEn {
  _TranslationsTrayIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Esci da LocalSend';
  @override
  String get closeWindows => 'Uscita';
}

// Path: web
class _TranslationsWebIt extends TranslationsWebEn {
  _TranslationsWebIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Inserisci il PIN';
  @override
  String get invalidPin => 'PIN non valido';
  @override
  String get tooManyAttempts => 'Troppi tentativi';
  @override
  String get rejected => 'Rifiutato';
  @override
  String get files => 'File';
  @override
  String get fileName => 'Nome del file';
  @override
  String get size => 'Dimensione';
}

// Path: assetPicker
class _TranslationsAssetPickerIt extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Conferma';
  @override
  String get cancel => 'Annulla';
  @override
  String get edit => 'Modifica';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Caricamento fallito';
  @override
  String get original => 'Origine';
  @override
  String get preview => 'Anteprima';
  @override
  String get select => 'Seleziona';
  @override
  String get emptyList => 'Lista vuota';
  @override
  String get unSupportedAssetType => 'Tipo di file non supportato.';
  @override
  String get unableToAccessAll => 'Impossibile accedere a tutti i file sul dispositivo';
  @override
  String get viewingLimitedAssetsTip => 'Visualizza solo file e album accessibili dall\'app.';
  @override
  String get changeAccessibleLimitedAssets => 'Clicca per aggiornare i file accessibili';
  @override
  String get accessAllTip =>
      'L\'app può accedere solo ad alcuni file sul dispositivo. Vai alle impostazioni di sistema e consenti all\'app di accedere a tutti i file multimediali sul dispositivo.';
  @override
  String get goToSystemSettings => 'Vai alle impostazioni di sistema';
  @override
  String get accessLimitedAssets => 'Continua con accesso limitato';
  @override
  String get accessiblePathName => 'File accessibili';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Immagine';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Altri media';
  @override
  String get sActionPlayHint => 'riproduci';
  @override
  String get sActionPreviewHint => 'anteprima';
  @override
  String get sActionSelectHint => 'seleziona';
  @override
  String get sActionSwitchPathLabel => 'cambia percorso';
  @override
  String get sActionUseCameraHint => 'usa fotocamera';
  @override
  String get sNameDurationLabel => 'durata';
  @override
  String get sUnitAssetCountLabel => 'conteggio';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageIt extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfacce di rete';
  @override
  String get info =>
      'Per impostazione predefinita, LocalSend utilizza tutte le interfacce di rete disponibili. È possibile escludere le reti indesiderate. È necessario riavviare il server per applicare le modifiche.';
  @override
  String get preview => 'Anteprima';
  @override
  String get whitelist => 'Whitelist';
  @override
  String get blacklist => 'Blacklist';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxIt extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porta:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveIt extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Preferiti';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionIt extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selezione';
  @override
  String files({required Object files}) => 'File: ${files}';
  @override
  String size({required Object size}) => 'Dimensione: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerIt extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'File';
  @override
  String get folder => 'Cartella';
  @override
  String get media => 'Media';
  @override
  String get text => 'Testo';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Incolla';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesIt extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Destinatario singolo';
  @override
  String get multiple => 'Destinatari multipli';
  @override
  String get link => 'Condividi tramite link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralIt extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Generale';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsIt brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsIt._(_root);
  @override
  String get color => 'Colore';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsIt colorOptions = _TranslationsSettingsTabGeneralColorOptionsIt._(_root);
  @override
  String get language => 'Lingua';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsIt languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsIt._(_root);
  @override
  String get saveWindowPlacement => 'Salva la posizione della finestra all\'uscita';
  @override
  String get saveWindowPlacementWindows => 'Salva la posizione della finestra alla chiusura';
  @override
  String get minimizeToTray => 'Riduci a icona anziché chiudere';
  @override
  String get launchAtStartup => 'Avvio automatico all\'accesso';
  @override
  String get launchMinimized => 'Avvio automatico: ridotto a icona';
  @override
  String get showInContextMenu => 'Mostra LocalSend nel menù contestuale';
  @override
  String get animations => 'Animazioni';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveIt extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ricevi';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Termina automaticamente';
  @override
  String get destination => 'Destinazione';
  @override
  String get downloads => '(Download)';
  @override
  String get saveToGallery => 'Salva i media nella galleria';
  @override
  String get saveToHistory => 'Salva nella cronologia';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendIt extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Invia';
  @override
  String get shareViaLinkAutoAccept => 'Accetta automaticamente le richieste in modalità "Condividi tramite link"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkIt extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rete';
  @override
  String get needRestart => 'Riavvia il server per applicare le modifiche!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Nome del dispositivo';
  @override
  String get deviceType => 'Tipo di dispositivo';
  @override
  String get deviceModel => 'Modello del dispositivo';
  @override
  String get port => 'Porta';
  @override
  String get discoveryTimeout => 'Timeout di rilevamento';
  @override
  String get useSystemName => 'Usa il nome di sistema';
  @override
  String get generateRandomAlias => 'Genera un alias casuale';
  @override
  String portWarning({required Object defaultPort}) =>
      'Potresti non essere rilevato da altri dispositivi perché stai utilizzando una porta personalizzata. (predefinita: ${defaultPort})';
  @override
  String get encryption => 'Crittografia';
  @override
  String get multicastGroup => 'Indirizzo Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Potresti non essere rilevato dagli altri dispositivi perché stai utilizzando un indirizzo multicast personalizzato. (predefinito: ${defaultMulticast})';
  @override
  String get network => 'Rete';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsIt networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsIt._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherIt extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Altro';
  @override
  String get support => 'Supporta LocalSend';
  @override
  String get donate => 'Dona';
  @override
  String get privacyPolicy => 'Informativa sulla privacy';
  @override
  String get termsOfUse => 'Termini di utilizzo';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallIt extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Questa app può inviare file ad altri dispositivi, ma altri dispositivi non possono inviare file a questo dispositivo.';
  @override
  String solution({required Object port}) =>
      'È molto probabile che si tratti di un problema di firewall. Puoi risolverlo consentendo connessioni in entrata (UDP e TCP) sulla porta ${port}.';
  @override
  String get openFirewallSettings => 'Apri Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryIt extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Questo dispositivo non riesce a rilevare altri dispositivi.';
  @override
  String get solution =>
      'Assicurati che tutti i dispositivi siano sulla stessa rete Wi-Fi e condividano la stessa configurazione (porta, indirizzo multicast, crittografia). Puoi provare a digitare manualmente l\'indirizzo IP del dispositivo di destinazione. Se funziona, considera di aggiungere questo dispositivo ai preferiti in modo che possa essere scoperto automaticamente in futuro.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionIt extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Entrambi i dispositivi non sono in grado di riconoscersi a vicenda né di condividere file.';
  @override
  String get solution =>
      'Il problema si presenta da entrambi le parti? In tal caso, assicurati che i dispositivi siano sulla stessa rete Wi-Fi e condividano la stessa configurazione (porta, indirizzo multicast, crittografia). La rete Wi-Fi potrebbe non consentire la comunicazione tra i partecipanti (isolamento dell\'Access Point). In questo caso, l\'opzione deve essere abilitata sul router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsIt extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Apri file';
  @override
  String get showInFolder => 'Mostra nella cartella';
  @override
  String get info => 'Informazioni';
  @override
  String get deleteFromHistory => 'Elimina dalla cronologia';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalIt extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleIt title = _TranslationsProgressPageTotalTitleIt._(_root);
  @override
  String count({required Object curr, required Object n}) => 'File: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Dimensione: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocità: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileIt extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aggiungi alla selezione';
  @override
  String get content => 'Cosa vuoi aggiungere?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileIt extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apri file';
  @override
  String get content => 'Vuoi aprire il file ricevuto?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputIt extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inserisci l\'indirizzo';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Indirizzo IP';
  @override
  String get recentlyUsed => 'Usato di recente: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionIt extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interrompi trasferimento';
  @override
  String get content => 'Sei sicuro di voler interrompere il trasferimento?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileIt extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Impossibile aprire il file';
  @override
  String content({required Object file}) => 'Impossibile aprire "${file}". Hai spostato, rinominato o eliminato il file?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeIt extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Crittografia disabilitata';
  @override
  String get content =>
      'La comunicazione ora avviene tramite il protocollo HTTP non crittografato. Per usare il protocollo crittografato HTTPS, abilita la crittografia.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogIt extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogIt extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Preferiti';
  @override
  String get noFavorites => 'Non ci sono ancora dispositivi preferiti.';
  @override
  String get addFavorite => 'Aggiungi';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogIt extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rimuovi dai preferiti';
  @override
  String content({required Object name}) => 'Sei davvero sicuro di voler rimuovere "${name}" dai preferiti?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogIt extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Aggiungi ai preferiti';
  @override
  String get titleEdit => 'Modifica';
  @override
  String get name => 'Nome del dispositivo';
  @override
  String get auto => '(automatico)';
  @override
  String get ip => 'Indirizzo IP';
  @override
  String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoIt extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informazioni sul file';
  @override
  String get fileName => 'Nome del file:';
  @override
  String get path => 'Percorso:';
  @override
  String get size => 'Dimensione:';
  @override
  String get sender => 'Mittente:';
  @override
  String get time => 'Ora:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputIt extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inserisci nome file';
  @override
  String original({required Object original}) => 'Originale: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogIt extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancella cronologia';
  @override
  String get content => 'Vuoi davvero eliminare l\'intera cronologia?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedIt extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend non può trovare altri dispositivi senza il permesso per la scansione della rete locale. Puoi concedere questo permesso nelle impostazioni.';
  @override
  String get gotoSettings => 'Impostazioni';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputIt extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Scrivi un messaggio';
  @override
  String get multiline => 'Multilinea';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesIt extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nessun file selezionato';
  @override
  String get content => 'Seleziona almeno un file.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionIt extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nessun permesso';
  @override
  String get content => 'Non hai concesso le autorizzazioni necessarie. Si prega di concederle nelle impostazioni.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformIt extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Non disponibile';
  @override
  String get content => 'Questa funzione è disponibile solo su:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrIt extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Codice QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsIt extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Azioni rapide';
  @override
  String get counter => 'Contatore';
  @override
  String get prefix => 'Prefisso';
  @override
  String get padZero => 'Riempi con zero';
  @override
  String get sortBeforeCount => 'Preordina alfabeticamente (A-Z)';
  @override
  String get random => 'Casuale';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeIt extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Le richieste di file ora vengono accettate automaticamente. Tieni presente che chiunque abbia accesso alla tua rete locale può inviarti file.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeIt extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Ora le richieste di file vengono accettate automaticamente dai dispositivi presenti nell\'elenco dei preferiti.',
    'Attenzione! Al momento, questa soluzione non è del tutto sicura, poiché un hacker che possiede l\'impronta digitale di un qualsiasi dispositivo presente nella tua lista dei preferiti può inviarti file senza restrizioni.',
    'Tuttavia, questa opzione è comunque più sicura rispetto al consentire a tutti gli utenti della rete locale di inviarti file senza restrizioni.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinIt extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inserisci il PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpIt extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modalità di invio';
  @override
  String get single => 'Invia file a un destinatario. Gli elementi saranno deselezionati dopo il trasferimento dei file.';
  @override
  String get multiple => 'Invia file a più destinatari. Gli elementi non saranno deselezionati dopo il trasferimento dei file.';
  @override
  String get link => 'I destinatari che non hanno installato LocalSend possono scaricare i file selezionati aprendo il link nel loro browser.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomIt extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsIt extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Scuro';
  @override
  String get light => 'Chiaro';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsIt extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsIt extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsIt extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Tutto';
  @override
  String get filtered => 'Filtrato';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleIt extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleIt._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progresso complessivo (${time})';
  @override
  String get finishedError => 'Terminato con errore';
  @override
  String get canceledSender => 'Annullato dal mittente';
  @override
  String get canceledReceiver => 'Annullato dal destinatario';
}
