part of 'strings.g.dart';

// Path: <root>
class _StringsIt extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsIt _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Italiano';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralIt general = _StringsGeneralIt._(_root);
	@override late final _StringsReceiveTabIt receiveTab = _StringsReceiveTabIt._(_root);
	@override late final _StringsSendTabIt sendTab = _StringsSendTabIt._(_root);
	@override late final _StringsDonationPageIt donationPage = _StringsDonationPageIt._(_root);
	@override late final _StringsSettingsTabIt settingsTab = _StringsSettingsTabIt._(_root);
	@override late final _StringsTroubleshootPageIt troubleshootPage = _StringsTroubleshootPageIt._(_root);
	@override late final _StringsReceiveHistoryPageIt receiveHistoryPage = _StringsReceiveHistoryPageIt._(_root);
	@override late final _StringsApkPickerPageIt apkPickerPage = _StringsApkPickerPageIt._(_root);
	@override late final _StringsSelectedFilesPageIt selectedFilesPage = _StringsSelectedFilesPageIt._(_root);
	@override late final _StringsReceivePageIt receivePage = _StringsReceivePageIt._(_root);
	@override late final _StringsReceiveOptionsPageIt receiveOptionsPage = _StringsReceiveOptionsPageIt._(_root);
	@override late final _StringsSendPageIt sendPage = _StringsSendPageIt._(_root);
	@override late final _StringsProgressPageIt progressPage = _StringsProgressPageIt._(_root);
	@override late final _StringsWebSharePageIt webSharePage = _StringsWebSharePageIt._(_root);
	@override late final _StringsAboutPageIt aboutPage = _StringsAboutPageIt._(_root);
	@override late final _StringsChangelogPageIt changelogPage = _StringsChangelogPageIt._(_root);
	@override late final _StringsAliasGeneratorIt aliasGenerator = _StringsAliasGeneratorIt._(_root);
	@override late final _StringsDialogsIt dialogs = _StringsDialogsIt._(_root);
	@override late final _StringsTrayIt tray = _StringsTrayIt._(_root);
	@override late final _StringsWebIt web = _StringsWebIt._(_root);
	@override late final _StringsAssetPickerIt assetPicker = _StringsAssetPickerIt._(_root);
}

// Path: general
class _StringsGeneralIt extends _StringsGeneralEn {
	_StringsGeneralIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Accetta';
	@override String get accepted => 'Accettato';
	@override String get add => 'Aggiungi';
	@override String get advanced => 'Avanzate';
	@override String get cancel => 'Interrompi';
	@override String get close => 'Chiudi';
	@override String get confirm => 'Conferma';
	@override String get continueStr => 'Continua';
	@override String get copy => 'Copia';
	@override String get copiedToClipboard => 'Copiato negli Appunti';
	@override String get decline => 'Rifiuta';
	@override String get done => 'Eseguito';
	@override String get delete => 'Cancella';
	@override String get edit => 'Modifica';
	@override String get error => 'Errore';
	@override String get example => 'Esempio';
	@override String get files => 'File';
	@override String get finished => 'Completato';
	@override String get hide => 'Nascondi';
	@override String get off => 'Disattivato';
	@override String get offline => 'Non in linea';
	@override String get on => 'Attivato';
	@override String get online => 'In linea';
	@override String get open => 'Apri';
	@override String get queue => 'Coda';
	@override String get quickSave => 'Salva rapido';
	@override String get renamed => 'Rinominato';
	@override String get reset => 'Reset';
	@override String get restart => 'Riavvia';
	@override String get settings => 'Impostazioni';
	@override String get skipped => 'Saltato';
	@override String get start => 'Inizia';
	@override String get stop => 'Arresta';
	@override String get save => 'Salva';
	@override String get unchanged => 'Invariato';
	@override String get unknown => 'Sconosciuto';
	@override String get noItemInClipboard => 'Nessun elemento negli Appunti';
}

// Path: receiveTab
class _StringsReceiveTabIt extends _StringsReceiveTabEn {
	_StringsReceiveTabIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ricevi';
	@override late final _StringsReceiveTabInfoBoxIt infoBox = _StringsReceiveTabInfoBoxIt._(_root);
}

// Path: sendTab
class _StringsSendTabIt extends _StringsSendTabEn {
	_StringsSendTabIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Invia';
	@override late final _StringsSendTabSelectionIt selection = _StringsSendTabSelectionIt._(_root);
	@override late final _StringsSendTabPickerIt picker = _StringsSendTabPickerIt._(_root);
	@override String get shareIntentInfo => 'Puoi anche usare la funzionalità "Condividi" sul tuo dispositivo mobile per selezionare file in modo più semplice.';
	@override String get nearbyDevices => 'Dispositivi vicini';
	@override String get thisDevice => 'Questo Dispositivo';
	@override String get scan => 'Cerca dispositivi';
	@override String get sendMode => 'Modalità di invio';
	@override late final _StringsSendTabSendModesIt sendModes = _StringsSendTabSendModesIt._(_root);
	@override String get sendModeHelp => 'Spiegazione';
	@override String get help => 'Assicurarsi che il destinatario desiderato si trovi nella stessa rete wifi.';
	@override String get placeItems => 'Inserire gli oggetti da condividere.';
}

// Path: donationPage
class _StringsDonationPageIt extends _StringsDonationPageEn {
	_StringsDonationPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dona';
	@override String get info => 'LocalSend è un progetto open-source gratuito e senza pubblicità. Se ti piace l\'applicazione, puoi supportare lo sviluppo con una donazione.';
	@override String donate({required Object amount}) => 'Dona ${amount}';
	@override String get thanks => 'Grazie per il tuo supporto!';
	@override String get restore => 'Ripristina acquisti';
}

// Path: settingsTab
class _StringsSettingsTabIt extends _StringsSettingsTabEn {
	_StringsSettingsTabIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impostazioni';
	@override late final _StringsSettingsTabGeneralIt general = _StringsSettingsTabGeneralIt._(_root);
	@override late final _StringsSettingsTabReceiveIt receive = _StringsSettingsTabReceiveIt._(_root);
	@override late final _StringsSettingsTabNetworkIt network = _StringsSettingsTabNetworkIt._(_root);
	@override late final _StringsSettingsTabOtherIt other = _StringsSettingsTabOtherIt._(_root);
	@override String get advancedSettings => 'Impostazioni avanzate';
}

// Path: troubleshootPage
class _StringsTroubleshootPageIt extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Risoluzione dei problemi';
	@override String get subTitle => 'Questa app non funziona come previsto? Qui puoi trovare soluzioni comuni.';
	@override String get solution => 'Soluzione:';
	@override String get fixButton => 'Risolvi automaticamente';
	@override late final _StringsTroubleshootPageFirewallIt firewall = _StringsTroubleshootPageFirewallIt._(_root);
	@override late final _StringsTroubleshootPageNoConnectionIt noConnection = _StringsTroubleshootPageNoConnectionIt._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageIt extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cronologia';
	@override String get openFolder => 'Apri cartella';
	@override String get deleteHistory => 'Elimina cronologia';
	@override String get empty => 'La cronologia è vuota.';
	@override late final _StringsReceiveHistoryPageEntryActionsIt entryActions = _StringsReceiveHistoryPageEntryActionsIt._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageIt extends _StringsApkPickerPageEn {
	_StringsApkPickerPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'App (APK)';
	@override String get excludeSystemApps => 'Escludi app di sistema';
	@override String get excludeAppsWithoutLaunchIntent => 'Escludi app non avviabili';
	@override String apps({required Object n}) => '${n} App';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageIt extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Elimina tutti';
}

// Path: receivePage
class _StringsReceivePageIt extends _StringsReceivePageEn {
	_StringsReceivePageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(n,
		one: 'vuole inviarti un file',
		other: 'vuole inviarti ${n} files',
	);
	@override String get subTitleMessage => 'ti ha inviato un messaggio:';
	@override String get subTitleLink => 'ti ha inviato un link:';
	@override String get canceled => 'Il mittente ha cancellato la richiesta.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageIt extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzioni';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend cartella)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Disattivato automaticamente perché ci sono delle cartelle.';
}

// Path: sendPage
class _StringsSendPageIt extends _StringsSendPageEn {
	_StringsSendPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'In attesa di risposta...';
	@override String get rejected => 'Il destinatario ha rifiutato la richiesta.';
	@override String get busy => 'Il destinatario è occupato con un\'altra richiesta.';
}

// Path: progressPage
class _StringsProgressPageIt extends _StringsProgressPageEn {
	_StringsProgressPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Invio di file in corso';
	@override String get titleReceiving => 'Ricezione di file in corso';
	@override String get savedToGallery => 'Salvato in Galleria';
	@override late final _StringsProgressPageTotalIt total = _StringsProgressPageTotalIt._(_root);
}

// Path: webSharePage
class _StringsWebSharePageIt extends _StringsWebSharePageEn {
	_StringsWebSharePageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Condividi tramite link';
	@override String get loading => 'Avvio del server...';
	@override String get stopping => 'Arresto del server...';
	@override String get error => 'Si è verificato un errore durante l\'avvio del server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(n,
		one: 'Apri questo link nel browser:',
		other: 'Apri uno di questi link nel browser:',
	);
	@override String get requests => 'Richieste';
	@override String get noRequests => 'Nessuna richiesta ancora.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend utilizza un certificato self-signed. Devi accettarlo nel browser.';
	@override String pendingRequests({required Object n}) => 'Richieste in sospeso: ${n}';
}

// Path: aboutPage
class _StringsAboutPageIt extends _StringsAboutPageEn {
	_StringsAboutPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Riguardo LocalSend';
	@override List<String> get description => [
		'LocalSend è un\'app gratuita e open-source che ti consente di condividere file e messaggi in modo sicuro con dispositivi vicini sulla tua rete locale senza bisogno di una connessione Internet.',
		'Questa app è disponibile su Android, iOS, macOS, Windows e Linux. Puoi trovare tutte le opzioni di download sulla homepage ufficiale.',
	];
	@override String get author => 'Autore';
	@override String get contributors => 'Contributori';
	@override String get translators => 'Traduttori';
}

// Path: changelogPage
class _StringsChangelogPageIt extends _StringsChangelogPageEn {
	_StringsChangelogPageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorIt extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsIt extends _StringsDialogsEn {
	_StringsDialogsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileIt addFile = _StringsDialogsAddFileIt._(_root);
	@override late final _StringsDialogsAddressInputIt addressInput = _StringsDialogsAddressInputIt._(_root);
	@override late final _StringsDialogsCancelSessionIt cancelSession = _StringsDialogsCancelSessionIt._(_root);
	@override late final _StringsDialogsCannotOpenFileIt cannotOpenFile = _StringsDialogsCannotOpenFileIt._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeIt encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeIt._(_root);
	@override late final _StringsDialogsErrorDialogIt errorDialog = _StringsDialogsErrorDialogIt._(_root);
	@override late final _StringsDialogsFavoriteDialogIt favoriteDialog = _StringsDialogsFavoriteDialogIt._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogIt favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogIt._(_root);
	@override late final _StringsDialogsFavoriteEditDialogIt favoriteEditDialog = _StringsDialogsFavoriteEditDialogIt._(_root);
	@override late final _StringsDialogsFileInfoIt fileInfo = _StringsDialogsFileInfoIt._(_root);
	@override late final _StringsDialogsFileNameInputIt fileNameInput = _StringsDialogsFileNameInputIt._(_root);
	@override late final _StringsDialogsHistoryClearDialogIt historyClearDialog = _StringsDialogsHistoryClearDialogIt._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedIt localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedIt._(_root);
	@override late final _StringsDialogsMessageInputIt messageInput = _StringsDialogsMessageInputIt._(_root);
	@override late final _StringsDialogsNoFilesIt noFiles = _StringsDialogsNoFilesIt._(_root);
	@override late final _StringsDialogsNoPermissionIt noPermission = _StringsDialogsNoPermissionIt._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformIt notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformIt._(_root);
	@override late final _StringsDialogsQrIt qr = _StringsDialogsQrIt._(_root);
	@override late final _StringsDialogsQuickActionsIt quickActions = _StringsDialogsQuickActionsIt._(_root);
	@override late final _StringsDialogsQuickSaveNoticeIt quickSaveNotice = _StringsDialogsQuickSaveNoticeIt._(_root);
	@override late final _StringsDialogsSendModeHelpIt sendModeHelp = _StringsDialogsSendModeHelpIt._(_root);
}

// Path: tray
class _StringsTrayIt extends _StringsTrayEn {
	_StringsTrayIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Chiudi LocalSend';
}

// Path: web
class _StringsWebIt extends _StringsWebEn {
	_StringsWebIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Rifiutato';
	@override String get files => 'File';
	@override String get fileName => 'Nome del file';
	@override String get size => 'Dimensione';
}

// Path: assetPicker
class _StringsAssetPickerIt extends _StringsAssetPickerEn {
	_StringsAssetPickerIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Conferma';
	@override String get cancel => 'Annulla';
	@override String get edit => 'Modifica';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Caricamento fallito';
	@override String get original => 'Origine';
	@override String get preview => 'Anteprima';
	@override String get select => 'Seleziona';
	@override String get emptyList => 'Lista vuota';
	@override String get unSupportedAssetType => 'Tipo di file non supportato.';
	@override String get unableToAccessAll => 'Impossibile accedere a tutti i file sul dispositivo';
	@override String get viewingLimitedAssetsTip => 'Visualizza solo file e album accessibili all\'app.';
	@override String get changeAccessibleLimitedAssets => 'Fai clic per aggiornare i file accessibili';
	@override String get accessAllTip => 'L\'app può accedere solo ad alcuni file sul dispositivo. Vai alle impostazioni di sistema e consenti all\'app di accedere a tutti i file multimediali sul dispositivo.';
	@override String get goToSystemSettings => 'Vai alle impostazioni di sistema';
	@override String get accessLimitedAssets => 'Continua con accesso limitato';
	@override String get accessiblePathName => 'File accessibili';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Immagine';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Altri media';
	@override String get sActionPlayHint => 'riproduci';
	@override String get sActionPreviewHint => 'anteprima';
	@override String get sActionSelectHint => 'seleziona';
	@override String get sActionSwitchPathLabel => 'cambia percorso';
	@override String get sActionUseCameraHint => 'usa fotocamera';
	@override String get sNameDurationLabel => 'durata';
	@override String get sUnitAssetCountLabel => 'conteggio';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxIt extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Porta:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionIt extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selezione';
	@override String files({required Object files}) => 'File: ${files}';
	@override String size({required Object size}) => 'Dimensione: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerIt extends _StringsSendTabPickerEn {
	_StringsSendTabPickerIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get file => 'File';
	@override String get folder => 'Cartella';
	@override String get media => 'Media';
	@override String get text => 'Testo';
	@override String get app => 'App';
	@override String get clipboard => 'Incolla';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesIt extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get single => 'Singolo destinatario';
	@override String get multiple => 'Destinatari multipli';
	@override String get link => 'Condividi tramite link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralIt extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Generale';
	@override String get brightness => 'Luminosità';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsIt brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsIt._(_root);
	@override String get color => 'Colore';
	@override late final _StringsSettingsTabGeneralColorOptionsIt colorOptions = _StringsSettingsTabGeneralColorOptionsIt._(_root);
	@override String get language => 'Lingua';
	@override late final _StringsSettingsTabGeneralLanguageOptionsIt languageOptions = _StringsSettingsTabGeneralLanguageOptionsIt._(_root);
	@override String get saveWindowPlacement => 'Esci: Salva posizione della finestra';
	@override String get minimizeToTray => 'Esci: Riduci ad icona nel vassoio';
	@override String get launchAtStartup => 'Avvio automatico dopo il login';
	@override String get launchMinimized => 'Avvio automatico: Avvio nascosto';
	@override String get animations => 'Animazioni';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveIt extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get autoFinish => 'Termina automaticamente';
	@override String get title => 'Ricevi';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Destinazione';
	@override String get downloads => '(Download)';
	@override String get saveToGallery => 'Salva i dati nella galleria';
	@override String get saveToHistory => 'Salva nella cronologia';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkIt extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rete';
	@override String get needRestart => 'Riavvia il server per applicare le modifiche!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Tipo di dispositivo';
	@override String get deviceModel => 'Modello di dispositivo';
	@override String get port => 'Porta';
	@override String portWarning({required Object defaultPort}) => 'Alcuni dispositivi potrebbero non rilevare il tua dispositivi perché stai usando una porta personalizzata. (default: ${defaultPort})';
	@override String get encryption => 'Crittografia';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Potresti non essere rilevato dagli altri dispositivi perché stai utilizzando un indirizzo multicast personalizzato. (predefinito: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherIt extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Altro';
	@override String get support => 'Supporta LocalSend';
	@override String get donate => 'Dona';
	@override String get privacyPolicy => 'Informativa sulla privacy';
	@override String get termsOfUse => 'Termini di utilizzo';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallIt extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Questa app può inviare file ad altri dispositivi, ma altri dispositivi non possono inviare file a questo dispositivo.';
	@override String solution({required Object port}) => 'È molto probabile che si tratti di un problema di firewall. Puoi risolverlo consentendo connessioni in entrata (UDP e TCP) sulla porta ${port}.';
	@override String get openFirewall => 'Apri Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionIt extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Entrambi i dispositivi non riescono a scoprirsi a vicenda né a condividere file.';
	@override String get solution => 'Il problema esiste su entrambi i lati? Allora devi assicurarti che entrambi i dispositivi siano nella stessa rete Wi-Fi e condividano la stessa configurazione (porta, indirizzo multicast, crittografia). Il Wi-Fi potrebbe non consentire la comunicazione tra i partecipanti. In questo caso, questa opzione deve essere abilitata sul router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsIt extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get open => 'Apri file';
	@override String get info => 'Informazioni';
	@override String get deleteFromHistory => 'Elimina dalla cronologia';
}

// Path: progressPage.total
class _StringsProgressPageTotalIt extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleIt title = _StringsProgressPageTotalTitleIt._(_root);
	@override String count({required Object curr, required Object n}) => 'File: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Dimensione: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Velocità: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileIt extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aggiungi alla selezione';
	@override String get content => 'Cosa vuoi aggiungere?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputIt extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inserisci l\'indirizzo';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Indirizzo IP';
	@override String get recentlyUsed => 'Usato di recente: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionIt extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Interrompi trasferimento';
	@override String get content => 'Sei sicuro di voler interromper il trasferimento?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileIt extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impossibile aprire il file';
	@override String content({required Object file}) => 'Impossibile aprire "${file}". Questo file è stato spostato, rinominato o eliminato?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeIt extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Crittografia disabiitata';
	@override String get content => 'La comunicazione ora avviene tramite il protocollo HTTP non crittografato. Per usare il protocollo crittografato HTTPS, abilita la crittografia.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogIt extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogIt extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Preferiti';
	@override String get noFavorites => 'Nessun dispositivo preferito al momento.';
	@override String get addFavorite => 'Aggiungi';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogIt extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elimina dai preferiti';
	@override String content({required Object name}) => 'Sei davvero sicuro di voler eliminare dai preferiti "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogIt extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Aggiungi ai preferiti';
	@override String get titleEdit => 'Modifica';
	@override String get name => 'Alias';
	@override String get auto => '(automatico)';
	@override String get ip => 'Indirizzo IP';
	@override String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoIt extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informazioni sul file';
	@override String get fileName => 'Nome del file:';
	@override String get path => 'Percorso:';
	@override String get size => 'Dimensione:';
	@override String get sender => 'Mittente:';
	@override String get time => 'Ora:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputIt extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inserisci un nome del file';
	@override String original({required Object original}) => 'Originale: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogIt extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clear history';
	@override String get content => 'Do you really want to delete the entire history?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedIt extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend non può trovare altri dispositivi senza avere il permesso di eseguire la scansione della rete locale. Si prega di concedere questo permesso nelle impostazioni.';
	@override String get gotoSettings => 'Impostazioni';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputIt extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scrivi un messaggio';
	@override String get multiline => 'Multilinea';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesIt extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nessun file selezionato';
	@override String get content => 'Seleziona almeno un file.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionIt extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nessun permesso';
	@override String get content => 'Non hai concesso le autorizzazioni necessarie. Per favore, concedile nelle impostazioni.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformIt extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Non disponibile';
	@override String get content => 'Questa funzione è disponibile solo su:';
}

// Path: dialogs.qr
class _StringsDialogsQrIt extends _StringsDialogsQrEn {
	_StringsDialogsQrIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Codice QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsIt extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Azioni Rapide';
	@override String get counter => 'Contatore';
	@override String get prefix => 'Prefisso';
	@override String get padZero => 'Riempi con zero';
	@override String get sortBeforeCount => 'Preordina alfabeticamente';
	@override String get random => 'Casuale';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeIt extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Ogni richiesta è automaticamente accettata. Sii consapevole che chiunque abbia accesso alla tua rete locale può inviarti file.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpIt extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modalità di invio';
	@override String get single => 'Invia file a un destinatario. La selezione verrà cancellata dopo il trasferimento del file.';
	@override String get multiple => 'Invia file a più destinatari. La selezione non verrà cancellata.';
	@override String get link => 'I destinatari che non hanno installato LocalSend possono scaricare i file selezionati aprendo il link nel loro browser.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsIt extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Scuro';
	@override String get light => 'Chiaro';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsIt extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsIt extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleIt extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progresso complessivo (${time})';
	@override String get finishedError => 'Terminato con errore';
	@override String get canceledSender => 'Cancellato dal mittente';
	@override String get canceledReceiver => 'Cancellato dal destinatario';
}
