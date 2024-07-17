///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsRo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRo.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ro,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ro>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsRo _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Română';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralRo general = _StringsGeneralRo._(_root);
	@override late final _StringsReceiveTabRo receiveTab = _StringsReceiveTabRo._(_root);
	@override late final _StringsSendTabRo sendTab = _StringsSendTabRo._(_root);
	@override late final _StringsSettingsTabRo settingsTab = _StringsSettingsTabRo._(_root);
	@override late final _StringsTroubleshootPageRo troubleshootPage = _StringsTroubleshootPageRo._(_root);
	@override late final _StringsReceiveHistoryPageRo receiveHistoryPage = _StringsReceiveHistoryPageRo._(_root);
	@override late final _StringsApkPickerPageRo apkPickerPage = _StringsApkPickerPageRo._(_root);
	@override late final _StringsSelectedFilesPageRo selectedFilesPage = _StringsSelectedFilesPageRo._(_root);
	@override late final _StringsReceivePageRo receivePage = _StringsReceivePageRo._(_root);
	@override late final _StringsReceiveOptionsPageRo receiveOptionsPage = _StringsReceiveOptionsPageRo._(_root);
	@override late final _StringsSendPageRo sendPage = _StringsSendPageRo._(_root);
	@override late final _StringsProgressPageRo progressPage = _StringsProgressPageRo._(_root);
	@override late final _StringsWebSharePageRo webSharePage = _StringsWebSharePageRo._(_root);
	@override late final _StringsAboutPageRo aboutPage = _StringsAboutPageRo._(_root);
	@override late final _StringsDonationPageRo donationPage = _StringsDonationPageRo._(_root);
	@override late final _StringsChangelogPageRo changelogPage = _StringsChangelogPageRo._(_root);
	@override late final _StringsAliasGeneratorRo aliasGenerator = _StringsAliasGeneratorRo._(_root);
	@override late final _StringsDialogsRo dialogs = _StringsDialogsRo._(_root);
	@override late final _StringsSanitizationRo sanitization = _StringsSanitizationRo._(_root);
	@override late final _StringsTrayRo tray = _StringsTrayRo._(_root);
	@override late final _StringsWebRo web = _StringsWebRo._(_root);
	@override late final _StringsAssetPickerRo assetPicker = _StringsAssetPickerRo._(_root);
}

// Path: general
class _StringsGeneralRo extends _StringsGeneralEn {
	_StringsGeneralRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Acceptă';
	@override String get accepted => 'Acceptat';
	@override String get add => 'Adaugă';
	@override String get advanced => 'Advansat';
	@override String get cancel => 'Anulare';
	@override String get close => 'Închide';
	@override String get confirm => 'Confirmă';
	@override String get continueStr => 'Continuă';
	@override String get copy => 'Copiază';
	@override String get copiedToClipboard => 'Copiat pe Clipboard';
	@override String get decline => 'Declină';
	@override String get done => 'Gata';
	@override String get delete => 'Șterge';
	@override String get edit => 'Editează';
	@override String get error => 'Eroare';
	@override String get example => 'Exemplu';
	@override String get files => 'Fișiere';
	@override String get finished => 'Finalizat';
	@override String get hide => 'Ascunde';
	@override String get off => 'Oprit';
	@override String get offline => 'Offline';
	@override String get on => 'Deschis';
	@override String get online => 'Online';
	@override String get open => 'Deschide';
	@override String get queue => 'Coadă';
	@override String get quickSave => 'Salvare Rapidă';
	@override String get renamed => 'Redenumit';
	@override String get reset => 'Resetare';
	@override String get restart => 'Repornire';
	@override String get settings => 'Setări';
	@override String get skipped => 'Omis';
	@override String get start => 'Pornește';
	@override String get stop => 'Oprește';
	@override String get save => 'Salvează';
	@override String get unchanged => 'Neschimbat';
	@override String get unknown => 'Necunoscut';
	@override String get noItemInClipboard => 'Clipboard gol';
}

// Path: receiveTab
class _StringsReceiveTabRo extends _StringsReceiveTabEn {
	_StringsReceiveTabRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Primire';
	@override late final _StringsReceiveTabInfoBoxRo infoBox = _StringsReceiveTabInfoBoxRo._(_root);
}

// Path: sendTab
class _StringsSendTabRo extends _StringsSendTabEn {
	_StringsSendTabRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trimitere';
	@override late final _StringsSendTabSelectionRo selection = _StringsSendTabSelectionRo._(_root);
	@override late final _StringsSendTabPickerRo picker = _StringsSendTabPickerRo._(_root);
	@override String get shareIntentInfo => 'Pentru a selecta mai ușor fișierele, puteți utiliza funcția "Partajare" a dispozitivului telefonului.';
	@override String get nearbyDevices => 'Dispozitive din apropiere';
	@override String get thisDevice => 'Acest dispozitiv';
	@override String get scan => 'Caută dispozitive';
	@override String get sendMode => 'Mod de trimitere';
	@override late final _StringsSendTabSendModesRo sendModes = _StringsSendTabSendModesRo._(_root);
	@override String get sendModeHelp => 'Explicație';
	@override String get help => 'Verificați dacă destinația se află în aceeași rețea Wi-Fi.';
	@override String get placeItems => 'Adaugă lucruri de partajare.';
}

// Path: settingsTab
class _StringsSettingsTabRo extends _StringsSettingsTabEn {
	_StringsSettingsTabRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Setări';
	@override late final _StringsSettingsTabGeneralRo general = _StringsSettingsTabGeneralRo._(_root);
	@override late final _StringsSettingsTabReceiveRo receive = _StringsSettingsTabReceiveRo._(_root);
	@override late final _StringsSettingsTabSendRo send = _StringsSettingsTabSendRo._(_root);
	@override late final _StringsSettingsTabNetworkRo network = _StringsSettingsTabNetworkRo._(_root);
	@override late final _StringsSettingsTabOtherRo other = _StringsSettingsTabOtherRo._(_root);
	@override String get advancedSettings => 'Setări avansate';
}

// Path: troubleshootPage
class _StringsTroubleshootPageRo extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Depanare';
	@override String get subTitle => 'Aplicația nu funcționează așa cum trebuie? Aici poți găsi câteva soluții comune.';
	@override String get solution => 'Soluția:';
	@override String get fixButton => 'Rezolvă automată';
	@override late final _StringsTroubleshootPageFirewallRo firewall = _StringsTroubleshootPageFirewallRo._(_root);
	@override late final _StringsTroubleshootPageNoConnectionRo noConnection = _StringsTroubleshootPageNoConnectionRo._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageRo extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Istoric';
	@override String get openFolder => 'Deschide dosarul';
	@override String get deleteHistory => 'Șterge istoricul';
	@override String get empty => 'Istoricul este gol.';
	@override late final _StringsReceiveHistoryPageEntryActionsRo entryActions = _StringsReceiveHistoryPageEntryActionsRo._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageRo extends _StringsApkPickerPageEn {
	_StringsApkPickerPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicații (APK)';
	@override String get excludeSystemApps => 'Exclude aplicațiile de sistem';
	@override String get excludeAppsWithoutLaunchIntent => 'Exclude aplicațiile nelansabile';
	@override String apps({required Object n}) => '${n} Aplicații';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageRo extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Șterge tot';
}

// Path: receivePage
class _StringsReceivePageRo extends _StringsReceivePageEn {
	_StringsReceivePageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(n,
		one: 'vrea să îți trimită un fișier',
		other: 'vrea să îți trimită ${n} fișiere',
	);
	@override String get subTitleMessage => 'ți-a trimis un mesaj:';
	@override String get subTitleLink => 'ți-a trimis un link:';
	@override String get canceled => 'Trimitentul a anulat cererea.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageRo extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opțiuni';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(Dosarul LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Dezactivat automat deoarece există foldere.';
}

// Path: sendPage
class _StringsSendPageRo extends _StringsSendPageEn {
	_StringsSendPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Aștept răspuns...';
	@override String get rejected => 'Recipientul a respins cererea.';
	@override String get tooManyAttempts => _root.web.tooManyAttempts;
	@override String get busy => 'Recipientul este ocupat cu o altă cerere.';
}

// Path: progressPage
class _StringsProgressPageRo extends _StringsProgressPageEn {
	_StringsProgressPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Trimitere fișiere';
	@override String get titleReceiving => 'Primire fișiere';
	@override String get savedToGallery => 'Salvat în Galerie';
	@override late final _StringsProgressPageTotalRo total = _StringsProgressPageTotalRo._(_root);
}

// Path: webSharePage
class _StringsWebSharePageRo extends _StringsWebSharePageEn {
	_StringsWebSharePageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Partajează prin link';
	@override String get loading => 'Să pornim serverul...';
	@override String get stopping => 'Să oprim serverul...';
	@override String get error => 'A apărut o eroare la pornirea serverului.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(n,
		one: 'Deschide acest link în browserul tău:',
		other: 'Deschide unul dintre aceste linkuri în browserul tău:',
	);
	@override String get requests => 'Cereri';
	@override String get noRequests => 'Nicio cerere încă.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Acceptă automat cererile';
	@override String get requirePin => 'Solicită PIN';
	@override String pinHint({required Object pin}) => 'PIN-ul este "${pin}"';
	@override String get encryptionHint => 'LocalSend folosește un certificat auto-semnat. Trebuie să-l accepți în browserul tău.';
	@override String pendingRequests({required Object n}) => 'Cererile în așteptare: ${n}';
}

// Path: aboutPage
class _StringsAboutPageRo extends _StringsAboutPageEn {
	_StringsAboutPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Despre LocalSend';
	@override List<String> get description => [
		'LocalSend este o aplicație gratuită și open-source care îți permite să partajezi în siguranță fișiere și mesaje cu dispozitivele din apropiere prin rețeaua ta locală, fără a avea nevoie de o conexiune la internet.',
		'Această aplicație este disponibilă pe Android, iOS, macOS, Windows și Linux. Poți găsi toate opțiunile de descărcare pe pagina oficială.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Contribuitori';
	@override String get translators => 'Traducători';
}

// Path: donationPage
class _StringsDonationPageRo extends _StringsDonationPageEn {
	_StringsDonationPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Donează';
	@override String get info => 'LocalSend este gratuit, open-source și fără reclame. Dacă îți place aplicația, poți susține dezvoltarea cu o donație.';
	@override String donate({required Object amount}) => 'Donează ${amount}';
	@override String get thanks => 'Îți mulțumim foarte mult!';
	@override String get restore => 'Restabilește achiziția';
}

// Path: changelogPage
class _StringsChangelogPageRo extends _StringsChangelogPageEn {
	_StringsChangelogPageRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Schimbări';
}

// Path: aliasGenerator
class _StringsAliasGeneratorRo extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Adorabilă',
		'Frumoasă',
		'Mare',
		'Strălucitoare',
		'Curată',
		'Deșteaptă',
		'Cool',
		'Drăguță',
		'Vicleană',
		'Determinantă',
		'Energică',
		'Eficientă',
		'Fantastică',
		'Repede',
		'Bine',
		'Sănătoasă',
		'Proaspătă',
		'Bună',
		'Superbă',
		'Grozavă',
		'Coaptă',
		'Fierbinte',
		'Amabilă',
		'Iubitoare',
		'Mistică',
		'îngrijită',
		'Plăcută',
		'Răbdătoare',
		'Frumușică',
		'Puternică',
		'Delicioasă',
		'Secretă',
		'Inteligentă',
		'Solidă',
		'Specială',
		'Strategică',
		'Aromată',
		'Înțeleaptă',
	];
	@override List<String> get fruits => [
		'Caisă',
		'Gutuie',
		'Banană',
		'Mură',
		'Nucă',
		'Afină',
		'Vișină',
		'Cireașă',
		'Lămâie',
		'Salată',
		'Fasole',
		'Conopidă',
		'Ciupercă',
		'Ceapă',
		'Portocală',
		'Piersică',
		'Pară',
		'Varză',
		'Mazăre',
		'Prună',
		'Rodie',
		'Zmeură',
		'Căpșună',
		'Roșie',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsRo extends _StringsDialogsEn {
	_StringsDialogsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileRo addFile = _StringsDialogsAddFileRo._(_root);
	@override late final _StringsDialogsAddressInputRo addressInput = _StringsDialogsAddressInputRo._(_root);
	@override late final _StringsDialogsCancelSessionRo cancelSession = _StringsDialogsCancelSessionRo._(_root);
	@override late final _StringsDialogsCannotOpenFileRo cannotOpenFile = _StringsDialogsCannotOpenFileRo._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeRo encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeRo._(_root);
	@override late final _StringsDialogsErrorDialogRo errorDialog = _StringsDialogsErrorDialogRo._(_root);
	@override late final _StringsDialogsFavoriteDialogRo favoriteDialog = _StringsDialogsFavoriteDialogRo._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogRo favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogRo._(_root);
	@override late final _StringsDialogsFavoriteEditDialogRo favoriteEditDialog = _StringsDialogsFavoriteEditDialogRo._(_root);
	@override late final _StringsDialogsFileInfoRo fileInfo = _StringsDialogsFileInfoRo._(_root);
	@override late final _StringsDialogsFileNameInputRo fileNameInput = _StringsDialogsFileNameInputRo._(_root);
	@override late final _StringsDialogsHistoryClearDialogRo historyClearDialog = _StringsDialogsHistoryClearDialogRo._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedRo localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedRo._(_root);
	@override late final _StringsDialogsMessageInputRo messageInput = _StringsDialogsMessageInputRo._(_root);
	@override late final _StringsDialogsNoFilesRo noFiles = _StringsDialogsNoFilesRo._(_root);
	@override late final _StringsDialogsNoPermissionRo noPermission = _StringsDialogsNoPermissionRo._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformRo notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformRo._(_root);
	@override late final _StringsDialogsQrRo qr = _StringsDialogsQrRo._(_root);
	@override late final _StringsDialogsQuickActionsRo quickActions = _StringsDialogsQuickActionsRo._(_root);
	@override late final _StringsDialogsQuickSaveNoticeRo quickSaveNotice = _StringsDialogsQuickSaveNoticeRo._(_root);
	@override late final _StringsDialogsPinRo pin = _StringsDialogsPinRo._(_root);
	@override late final _StringsDialogsSendModeHelpRo sendModeHelp = _StringsDialogsSendModeHelpRo._(_root);
	@override late final _StringsDialogsZoomRo zoom = _StringsDialogsZoomRo._(_root);
}

// Path: sanitization
class _StringsSanitizationRo extends _StringsSanitizationEn {
	_StringsSanitizationRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Numele fișierului nu poate fi gol';
	@override String get invalid => 'Numele fișierului conține caractere invalide';
}

// Path: tray
class _StringsTrayRo extends _StringsTrayEn {
	_StringsTrayRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Închide LocalSend';
}

// Path: web
class _StringsWebRo extends _StringsWebEn {
	_StringsWebRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get enterPin => 'Introdu PIN-ul';
	@override String get invalidPin => 'PIN-ul introdus este greșit';
	@override String get tooManyAttempts => 'Prea multe încercări';
	@override String get rejected => 'Respins';
	@override String get files => 'Fișiere';
	@override String get fileName => 'Numele fișierului';
	@override String get size => 'Mărime';
}

// Path: assetPicker
class _StringsAssetPickerRo extends _StringsAssetPickerEn {
	_StringsAssetPickerRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmă';
	@override String get cancel => 'Anulează';
	@override String get edit => 'Editează';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Eroare la încărcare';
	@override String get original => 'Original';
	@override String get preview => 'Vezi';
	@override String get select => 'Selectează';
	@override String get emptyList => 'Listă goală';
	@override String get unSupportedAssetType => 'Tip de fișier neacceptat.';
	@override String get unableToAccessAll => 'Nu se pot accesa toate fișierele de pe dispozitiv';
	@override String get viewingLimitedAssetsTip => 'Vezi doar fișierele și albumele accesibile aplicației.';
	@override String get changeAccessibleLimitedAssets => 'Apasă pentru a actualiza fișierele accesibile';
	@override String get accessAllTip => 'Aplicația poate accesa doar unele fișiere de pe dispozitiv. Mergi la setările sistemului și permite aplicația să acceseze toate mediile de pe dispozitiv.';
	@override String get goToSystemSettings => 'Mergi la setările sistemului';
	@override String get accessLimitedAssets => 'Continuă cu acces limitat';
	@override String get accessiblePathName => 'Fișiere accesibile';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Imagini';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Alte media';
	@override String get sActionPlayHint => 'redare';
	@override String get sActionPreviewHint => 'vezi';
	@override String get sActionSelectHint => 'selectare';
	@override String get sActionSwitchPathLabel => 'schimbă calea';
	@override String get sActionUseCameraHint => 'folosește camera';
	@override String get sNameDurationLabel => 'durată';
	@override String get sUnitAssetCountLabel => 'număr';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxRo extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Nume dispozitivului:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionRo extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selecție';
	@override String files({required Object files}) => 'Fișiere: ${files}';
	@override String size({required Object size}) => 'Mărime: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerRo extends _StringsSendTabPickerEn {
	_StringsSendTabPickerRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fișier';
	@override String get folder => 'Dosar';
	@override String get media => 'Media';
	@override String get text => 'Text';
	@override String get app => 'App';
	@override String get clipboard => 'Lipește';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesRo extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get single => 'Recipient unic';
	@override String get multiple => 'Recipienți multipli';
	@override String get link => 'Partajează prin link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralRo extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'General';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsRo brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsRo._(_root);
	@override String get color => 'Culoare';
	@override late final _StringsSettingsTabGeneralColorOptionsRo colorOptions = _StringsSettingsTabGeneralColorOptionsRo._(_root);
	@override String get language => 'Limba';
	@override late final _StringsSettingsTabGeneralLanguageOptionsRo languageOptions = _StringsSettingsTabGeneralLanguageOptionsRo._(_root);
	@override String get saveWindowPlacement => 'Închidere: Salvează plasarea ferestrei';
	@override String get minimizeToTray => 'Închidere: Minimizează în Bara de Meniuri/Tray';
	@override String get launchAtStartup => 'Autopornire după logare';
	@override String get launchMinimized => 'Autopornire: Pornire ascunsă';
	@override String get showInContextMenu => 'Afișează LocalSend în meniul contextual';
	@override String get animations => 'Animații';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveRo extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Primire';
	@override String get quickSave => _root.general.quickSave;
	@override String get requirePin => _root.webSharePage.requirePin;
	@override String get autoFinish => 'Finisare automată';
	@override String get destination => 'Destinație';
	@override String get downloads => '(Descărcări)';
	@override String get saveToGallery => 'Salvează media în galerie';
	@override String get saveToHistory => 'Salvează în istorie';
}

// Path: settingsTab.send
class _StringsSettingsTabSendRo extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trimitere';
	@override String get shareViaLinkAutoAccept => 'Partajează prin link: Acceptare automată';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkRo extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rețeaua';
	@override String get needRestart => 'Reporniți serverul pentru a aplica setările!';
	@override String get server => 'Server';
	@override String get alias => 'Nume dispozitiv';
	@override String get deviceType => 'Tip dispozitiv';
	@override String get deviceModel => 'Model dispozitiv';
	@override String get port => 'Port';
	@override String get discoveryTimeout => 'Timp de așteptare pentru descoperire';
	@override String portWarning({required Object defaultPort}) => 'Este posibil să nu fii detectat de alte dispozitive pentru că folosești un port customizat. (implicit: ${defaultPort})';
	@override String get encryption => 'Criptare';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Este posibil să nu fii detectat de alte dispozitive pentru că folosești o adresă multicast customizată. (implicit: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherRo extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Altele';
	@override String get support => 'Susțineți LocalSend';
	@override String get donate => 'Donează';
	@override String get privacyPolicy => 'Politică de confidențialitate';
	@override String get termsOfUse => 'Termeni de utilizare';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallRo extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Această aplicație poate trimite fișiere la alte dispozitive, dar alte dispozitive nu pot trimite fișiere de pe acest dispozitiv.';
	@override String solution({required Object port}) => 'Cel mai probabil problema este de la firewall. Poți rezolva această problemă permițând conexiunile de intrare (UDP și TCP) pe portul ${port}.';
	@override String get openFirewall => 'Deschide Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionRo extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ambele dispozitive nu se pot descoperi și nu pot partaja fișiere.';
	@override String get solution => 'Problema există de ambele părți? Dacă da, trebuie să te asiguri că ambele dispozitive se află în aceeași rețea Wi-Fi și au aceeași configurație (port, adresă multicast, criptare). Este posibil ca rețeaua să nu permită comunicarea între participanți. În acest caz, această opțiune trebuie să fie activată pe router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsRo extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get open => 'Deschide fișierul';
	@override String get showInFolder => 'Afișează în dosar';
	@override String get info => 'Informații';
	@override String get deleteFromHistory => 'Șterge din istoric';
}

// Path: progressPage.total
class _StringsProgressPageTotalRo extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleRo title = _StringsProgressPageTotalTitleRo._(_root);
	@override String count({required Object curr, required Object n}) => 'Fișiere: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Mărime: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Viteză: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileRo extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adaugă la selecție';
	@override String get content => 'Ce vrei să adaugi?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputRo extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introdu adresa';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Adresă IP';
	@override String get recentlyUsed => 'Folosit recent: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionRo extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anularea transferului';
	@override String get content => 'Chiar vrei să anulezi transferul cu fișiere?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileRo extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nu se poate deschide fișierul';
	@override String content({required Object file}) => 'Nu s-a putut deschide \"${file}\". A fost mutat, redenumit sau șters?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeRo extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Criptare dezactivată';
	@override String get content => 'Comunicarea are loc acum prin protocolul HTTP necriptat. Pentru a folosi HTTPS, activează din nou criptarea.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogRo extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogRo extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorite';
	@override String get noFavorites => 'Încă nu sunt dispozitive favorite.';
	@override String get addFavorite => 'Adaugă';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogRo extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Șterge din favorite';
	@override String content({required Object name}) => 'Sigur vrei să ștergi din favorite "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogRo extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Adaugă la favorite';
	@override String get titleEdit => 'Setări';
	@override String get name => 'Nume dispozitivului';
	@override String get auto => '(auto)';
	@override String get ip => 'Adresă IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoRo extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informații despre fișier';
	@override String get fileName => 'Numele fișierului:';
	@override String get path => 'Calea:';
	@override String get size => 'Mărime:';
	@override String get sender => 'Recipientul:';
	@override String get time => 'Timp:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputRo extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introdu numele fișierului';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogRo extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Golește istoricul';
	@override String get content => 'Sigur vrei să golești întregul istoric?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedRo extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend nu poate găsi alte dispozitive fără permisiunea de a scana rețeaua locală. Să acorzi această permisiune în setări.';
	@override String get gotoSettings => 'Setări';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputRo extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scrie un mesaj';
	@override String get multiline => 'Multilinie';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesRo extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Niciun fișier selectat';
	@override String get content => 'Selectează cel puțin un fișier.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionRo extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fără permisiune';
	@override String get content => 'Nu ai acordat permisiunile necesare. Acordă-le în setări.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformRo extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nu este disponibil';
	@override String get content => 'Această funcție este disponibilă doar pe:';
}

// Path: dialogs.qr
class _StringsDialogsQrRo extends _StringsDialogsQrEn {
	_StringsDialogsQrRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cod QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsRo extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acțiuni rapide';
	@override String get counter => 'Contor';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Completează cu zerouri';
	@override String get sortBeforeCount => 'Sortează alfabetic înainte';
	@override String get random => 'Aleatoriu';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeRo extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Cereri de fișiere sunt acceptate automat. Fii atent oricine din rețeaua locală îți poate trimite fișiere.';
}

// Path: dialogs.pin
class _StringsDialogsPinRo extends _StringsDialogsPinEn {
	_StringsDialogsPinRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introdu PIN-ul';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpRo extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Moduri de trimitere';
	@override String get single => 'Trimite fișiere unui singur recipient. Selecția va fi golită după ce transferul este finalizat.';
	@override String get multiple => 'Trimite fișiere la mai mulți recipienți. Selecția nu va fi golită.';
	@override String get link => 'Recipienții care nu au LocalSend instalat pot descărca fișierele selectate accesând linkul în browser.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomRo extends _StringsDialogsZoomEn {
	_StringsDialogsZoomRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsRo extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Întuneric';
	@override String get light => 'Lumină';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsRo extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsRo extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleRo extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleRo._(_StringsRo root) : this._root = root, super._(root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progres total (${time})';
	@override String get finishedError => 'Finalizat cu eroare';
	@override String get canceledSender => 'Anulat de trimitent';
	@override String get canceledReceiver => 'Anulat de receptor';
}
