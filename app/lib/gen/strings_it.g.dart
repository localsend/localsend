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
class TranslationsIt extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsIt({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Italiano';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$it general = _Translations$general$it._(_root);
  @override
  late final _Translations$receiveTab$it receiveTab = _Translations$receiveTab$it._(_root);
  @override
  late final _Translations$sendTab$it sendTab = _Translations$sendTab$it._(_root);
  @override
  late final _Translations$settingsTab$it settingsTab = _Translations$settingsTab$it._(_root);
  @override
  late final _Translations$troubleshootPage$it troubleshootPage = _Translations$troubleshootPage$it._(_root);
  @override
  late final _Translations$receiveHistoryPage$it receiveHistoryPage = _Translations$receiveHistoryPage$it._(_root);
  @override
  late final _Translations$apkPickerPage$it apkPickerPage = _Translations$apkPickerPage$it._(_root);
  @override
  late final _Translations$selectedFilesPage$it selectedFilesPage = _Translations$selectedFilesPage$it._(_root);
  @override
  late final _Translations$receivePage$it receivePage = _Translations$receivePage$it._(_root);
  @override
  late final _Translations$receiveOptionsPage$it receiveOptionsPage = _Translations$receiveOptionsPage$it._(_root);
  @override
  late final _Translations$sendPage$it sendPage = _Translations$sendPage$it._(_root);
  @override
  late final _Translations$progressPage$it progressPage = _Translations$progressPage$it._(_root);
  @override
  late final _Translations$webSharePage$it webSharePage = _Translations$webSharePage$it._(_root);
  @override
  late final _Translations$aboutPage$it aboutPage = _Translations$aboutPage$it._(_root);
  @override
  late final _Translations$donationPage$it donationPage = _Translations$donationPage$it._(_root);
  @override
  late final _Translations$changelogPage$it changelogPage = _Translations$changelogPage$it._(_root);
  @override
  late final _Translations$dialogs$it dialogs = _Translations$dialogs$it._(_root);
  @override
  late final _Translations$sanitization$it sanitization = _Translations$sanitization$it._(_root);
  @override
  late final _Translations$tray$it tray = _Translations$tray$it._(_root);
  @override
  late final _Translations$web$it web = _Translations$web$it._(_root);
  @override
  late final _Translations$assetPicker$it assetPicker = _Translations$assetPicker$it._(_root);
  @override
  late final _Translations$networkInterfacesPage$it networkInterfacesPage = _Translations$networkInterfacesPage$it._(_root);
}

// Path: general
class _Translations$general$it extends Translations$general$en {
  _Translations$general$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$it extends Translations$receiveTab$en {
  _Translations$receiveTab$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ricevi';
  @override
  late final _Translations$receiveTab$infoBox$it infoBox = _Translations$receiveTab$infoBox$it._(_root);
  @override
  late final _Translations$receiveTab$quickSave$it quickSave = _Translations$receiveTab$quickSave$it._(_root);
}

// Path: sendTab
class _Translations$sendTab$it extends Translations$sendTab$en {
  _Translations$sendTab$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Invia';
  @override
  late final _Translations$sendTab$selection$it selection = _Translations$sendTab$selection$it._(_root);
  @override
  late final _Translations$sendTab$picker$it picker = _Translations$sendTab$picker$it._(_root);
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
  late final _Translations$sendTab$sendModes$it sendModes = _Translations$sendTab$sendModes$it._(_root);
  @override
  String get sendModeHelp => 'Spiegazione';
  @override
  String get help => 'Assicurati che il destinatario desiderato si trovi sulla stessa rete Wi-Fi.';
  @override
  String get placeItems => 'Rilascia qui gli elementi da condividere.';
}

// Path: settingsTab
class _Translations$settingsTab$it extends Translations$settingsTab$en {
  _Translations$settingsTab$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Impostazioni';
  @override
  late final _Translations$settingsTab$general$it general = _Translations$settingsTab$general$it._(_root);
  @override
  late final _Translations$settingsTab$receive$it receive = _Translations$settingsTab$receive$it._(_root);
  @override
  late final _Translations$settingsTab$send$it send = _Translations$settingsTab$send$it._(_root);
  @override
  late final _Translations$settingsTab$network$it network = _Translations$settingsTab$network$it._(_root);
  @override
  late final _Translations$settingsTab$other$it other = _Translations$settingsTab$other$it._(_root);
  @override
  String get advancedSettings => 'Impostazioni avanzate';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$it extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$it firewall = _Translations$troubleshootPage$firewall$it._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$it noDiscovery = _Translations$troubleshootPage$noDiscovery$it._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$it noConnection = _Translations$troubleshootPage$noConnection$it._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$it extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$it entryActions = _Translations$receiveHistoryPage$entryActions$it._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$it extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$it extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Rimuovi tutti';
}

// Path: receivePage
class _Translations$receivePage$it extends Translations$receivePage$en {
  _Translations$receivePage$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
    n,
    one: 'vuole inviarti un file',
    other: 'vuole inviarti ${n} file',
  );
  @override
  String get subTitleMessage => 'ti ha inviato un messaggio:';
  @override
  String get subTitleLink => 'ti ha inviato un link:';
  @override
  String get canceled => 'Il mittente ha annullato la richiesta.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$it extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$it extends Translations$sendPage$en {
  _Translations$sendPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$it extends Translations$progressPage$en {
  _Translations$progressPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Invio di file in corso';
  @override
  String get titleReceiving => 'Ricezione di file in corso';
  @override
  String get savedToGallery => 'Salvato in Galleria';
  @override
  late final _Translations$progressPage$total$it total = _Translations$progressPage$total$it._(_root);
  @override
  late final _Translations$progressPage$remainingTime$it remainingTime = _Translations$progressPage$remainingTime$it._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$it extends Translations$webSharePage$en {
  _Translations$webSharePage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$it extends Translations$aboutPage$en {
  _Translations$aboutPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$it extends Translations$donationPage$en {
  _Translations$donationPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$it extends Translations$changelogPage$en {
  _Translations$changelogPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: dialogs
class _Translations$dialogs$it extends Translations$dialogs$en {
  _Translations$dialogs$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$it addFile = _Translations$dialogs$addFile$it._(_root);
  @override
  late final _Translations$dialogs$openFile$it openFile = _Translations$dialogs$openFile$it._(_root);
  @override
  late final _Translations$dialogs$addressInput$it addressInput = _Translations$dialogs$addressInput$it._(_root);
  @override
  late final _Translations$dialogs$cancelSession$it cancelSession = _Translations$dialogs$cancelSession$it._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$it cannotOpenFile = _Translations$dialogs$cannotOpenFile$it._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$it encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$it._(_root);
  @override
  late final _Translations$dialogs$errorDialog$it errorDialog = _Translations$dialogs$errorDialog$it._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$it favoriteDialog = _Translations$dialogs$favoriteDialog$it._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$it favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$it._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$it favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$it._(_root);
  @override
  late final _Translations$dialogs$fileInfo$it fileInfo = _Translations$dialogs$fileInfo$it._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$it fileNameInput = _Translations$dialogs$fileNameInput$it._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$it historyClearDialog = _Translations$dialogs$historyClearDialog$it._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$it localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$it._(_root);
  @override
  late final _Translations$dialogs$messageInput$it messageInput = _Translations$dialogs$messageInput$it._(_root);
  @override
  late final _Translations$dialogs$noFiles$it noFiles = _Translations$dialogs$noFiles$it._(_root);
  @override
  late final _Translations$dialogs$noPermission$it noPermission = _Translations$dialogs$noPermission$it._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$it notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$it._(_root);
  @override
  late final _Translations$dialogs$qr$it qr = _Translations$dialogs$qr$it._(_root);
  @override
  late final _Translations$dialogs$quickActions$it quickActions = _Translations$dialogs$quickActions$it._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$it quickSaveNotice = _Translations$dialogs$quickSaveNotice$it._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$it quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$it._(_root);
  @override
  late final _Translations$dialogs$pin$it pin = _Translations$dialogs$pin$it._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$it sendModeHelp = _Translations$dialogs$sendModeHelp$it._(_root);
  @override
  late final _Translations$dialogs$zoom$it zoom = _Translations$dialogs$zoom$it._(_root);
}

// Path: sanitization
class _Translations$sanitization$it extends Translations$sanitization$en {
  _Translations$sanitization$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Il nome del file non può essere vuoto';
  @override
  String get invalid => 'Il nome del file contiene dei caratteri non validi';
}

// Path: tray
class _Translations$tray$it extends Translations$tray$en {
  _Translations$tray$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$web$it extends Translations$web$en {
  _Translations$web$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$it extends Translations$assetPicker$en {
  _Translations$assetPicker$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$it extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$it extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$it extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$it extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$it extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$it extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$it extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Generale';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$it brightnessOptions = _Translations$settingsTab$general$brightnessOptions$it._(
    _root,
  );
  @override
  String get color => 'Colore';
  @override
  late final _Translations$settingsTab$general$colorOptions$it colorOptions = _Translations$settingsTab$general$colorOptions$it._(_root);
  @override
  String get language => 'Lingua';
  @override
  late final _Translations$settingsTab$general$languageOptions$it languageOptions = _Translations$settingsTab$general$languageOptions$it._(_root);
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
class _Translations$settingsTab$receive$it extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$it extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Invia';
  @override
  String get shareViaLinkAutoAccept => 'Accetta automaticamente le richieste in modalità "Condividi tramite link"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$it extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$it networkOptions = _Translations$settingsTab$network$networkOptions$it._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$it extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$it extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Questa app può inviare file ad altri dispositivi, ma altri dispositivi non possono inviare file a questo dispositivo.';
  @override
  String solution({required Object port}) =>
      'È molto probabile che si tratti di un problema di firewall. Puoi risolverlo consentendo connessioni in entrata (UDP e TCP) sulla porta ${port}.';
  @override
  String get openFirewall => 'Apri Firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$it extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Questo dispositivo non riesce a rilevare altri dispositivi.';
  @override
  String get solution =>
      'Assicurati che tutti i dispositivi siano sulla stessa rete Wi-Fi e condividano la stessa configurazione (porta, indirizzo multicast, crittografia). Puoi provare a digitare manualmente l\'indirizzo IP del dispositivo di destinazione. Se funziona, considera di aggiungere questo dispositivo ai preferiti in modo che possa essere scoperto automaticamente in futuro.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$it extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Entrambi i dispositivi non sono in grado di riconoscersi a vicenda né di condividere file.';
  @override
  String get solution =>
      'Il problema si presenta da entrambi le parti? In tal caso, assicurati che i dispositivi siano sulla stessa rete Wi-Fi e condividano la stessa configurazione (porta, indirizzo multicast, crittografia). La rete Wi-Fi potrebbe non consentire la comunicazione tra i partecipanti (isolamento dell\'Access Point). In questo caso, l\'opzione deve essere abilitata sul router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$it extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$it extends Translations$progressPage$total$en {
  _Translations$progressPage$total$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$it title = _Translations$progressPage$total$title$it._(_root);
  @override
  String count({required Object curr, required Object n}) => 'File: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Dimensione: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocità: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$it extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations

  /// Usa 'h' come abbreviazione per ore e 'm' per minuti
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Usa 'd' per giorni, 'h' per ore, e 'm' per minuti
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';

  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$it extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aggiungi alla selezione';
  @override
  String get content => 'Cosa vuoi aggiungere?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$it extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apri file';
  @override
  String get content => 'Vuoi aprire il file ricevuto?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$it extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$it extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interrompi trasferimento';
  @override
  String get content => 'Sei sicuro di voler interrompere il trasferimento?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$it extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Impossibile aprire il file';
  @override
  String content({required Object file}) => 'Impossibile aprire "${file}". Hai spostato, rinominato o eliminato il file?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$it extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Crittografia disabilitata';
  @override
  String get content =>
      'La comunicazione ora avviene tramite il protocollo HTTP non crittografato. Per usare il protocollo crittografato HTTPS, abilita la crittografia.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$it extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$it extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$it extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rimuovi dai preferiti';
  @override
  String content({required Object name}) => 'Sei davvero sicuro di voler rimuovere "${name}" dai preferiti?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$it extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$it extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$it extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inserisci nome file';
  @override
  String original({required Object original}) => 'Originale: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$it extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancella cronologia';
  @override
  String get content => 'Vuoi davvero eliminare l\'intera cronologia?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$it extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$it extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Scrivi un messaggio';
  @override
  String get multiline => 'Multilinea';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$it extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nessun file selezionato';
  @override
  String get content => 'Seleziona almeno un file.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$it extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nessun permesso';
  @override
  String get content => 'Non hai concesso le autorizzazioni necessarie. Si prega di concederle nelle impostazioni.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$it extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Non disponibile';
  @override
  String get content => 'Questa funzione è disponibile solo su:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$it extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Codice QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$it extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$it extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Le richieste di file ora vengono accettate automaticamente. Tieni presente che chiunque abbia accesso alla tua rete locale può inviarti file.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$it extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$it extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inserisci il PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$it extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$it extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$it extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$it extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$it extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$it extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

  final TranslationsIt _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Tutto';
  @override
  String get filtered => 'Filtrato';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$it extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$it._(TranslationsIt root) : this._root = root, super.internal(root);

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
