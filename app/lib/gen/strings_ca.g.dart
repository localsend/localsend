part of 'strings.g.dart';

// Path: <root>
class _StringsCa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsCa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsCa _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Català';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralCa general = _StringsGeneralCa._(_root);
	@override late final _StringsReceiveTabCa receiveTab = _StringsReceiveTabCa._(_root);
	@override late final _StringsSendTabCa sendTab = _StringsSendTabCa._(_root);
	@override late final _StringsSettingsTabCa settingsTab = _StringsSettingsTabCa._(_root);
	@override late final _StringsTroubleshootPageCa troubleshootPage = _StringsTroubleshootPageCa._(_root);
	@override late final _StringsReceiveHistoryPageCa receiveHistoryPage = _StringsReceiveHistoryPageCa._(_root);
	@override late final _StringsApkPickerPageCa apkPickerPage = _StringsApkPickerPageCa._(_root);
	@override late final _StringsSelectedFilesPageCa selectedFilesPage = _StringsSelectedFilesPageCa._(_root);
	@override late final _StringsReceivePageCa receivePage = _StringsReceivePageCa._(_root);
	@override late final _StringsReceiveOptionsPageCa receiveOptionsPage = _StringsReceiveOptionsPageCa._(_root);
	@override late final _StringsSendPageCa sendPage = _StringsSendPageCa._(_root);
	@override late final _StringsProgressPageCa progressPage = _StringsProgressPageCa._(_root);
	@override late final _StringsWebSharePageCa webSharePage = _StringsWebSharePageCa._(_root);
	@override late final _StringsAboutPageCa aboutPage = _StringsAboutPageCa._(_root);
	@override late final _StringsChangelogPageCa changelogPage = _StringsChangelogPageCa._(_root);
	@override late final _StringsAliasGeneratorCa aliasGenerator = _StringsAliasGeneratorCa._(_root);
	@override late final _StringsDialogsCa dialogs = _StringsDialogsCa._(_root);
	@override late final _StringsTrayCa tray = _StringsTrayCa._(_root);
	@override late final _StringsWebCa web = _StringsWebCa._(_root);
	@override late final _StringsAssetPickerCa assetPicker = _StringsAssetPickerCa._(_root);
}

// Path: general
class _StringsGeneralCa extends _StringsGeneralEn {
	_StringsGeneralCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Acceptar';
	@override String get accepted => 'Acceptat';
	@override String get add => 'Afegir';
	@override String get advanced => 'Avançat';
	@override String get cancel => 'Cancel·lar';
	@override String get close => 'Tancar';
	@override String get confirm => 'Confirmar';
	@override String get continueStr => 'Continuar';
	@override String get copy => 'Copiar';
	@override String get copiedToClipboard => 'Copiat al porta-paper';
	@override String get decline => 'Rebutjar';
	@override String get done => 'Fet';
	@override String get edit => 'Editar';
	@override String get error => 'Error';
	@override String get example => 'Exemple';
	@override String get files => 'Fitxers';
	@override String get finished => 'Finalitzat';
	@override String get hide => 'Amagar';
	@override String get off => 'Apagat';
	@override String get offline => 'Desconnectat';
	@override String get on => 'Encès';
	@override String get online => 'En línia';
	@override String get open => 'Obrir';
	@override String get queue => 'Cua';
	@override String get quickSave => 'Desar ràpid';
	@override String get renamed => 'Reanomenar';
	@override String get reset => 'Restablir';
	@override String get restart => 'Reiniciar';
	@override String get settings => 'Configuració';
	@override String get skipped => 'Omès';
	@override String get start => 'Iniciar';
	@override String get stop => 'Parar';
	@override String get save => 'Desar';
	@override String get unchanged => 'Sense canvis';
	@override String get unknown => 'Desconegut';
}

// Path: receiveTab
class _StringsReceiveTabCa extends _StringsReceiveTabEn {
	_StringsReceiveTabCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rebre';
	@override late final _StringsReceiveTabInfoBoxCa infoBox = _StringsReceiveTabInfoBoxCa._(_root);
}

// Path: sendTab
class _StringsSendTabCa extends _StringsSendTabEn {
	_StringsSendTabCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enviar';
	@override late final _StringsSendTabSelectionCa selection = _StringsSendTabSelectionCa._(_root);
	@override late final _StringsSendTabPickerCa picker = _StringsSendTabPickerCa._(_root);
	@override String get shareIntentInfo => 'També pot utilitzar l\'opció de "Compartir" del seu dispositiu mòbil per seleccionar fitxer d\'una manera més fàcil.';
	@override String get nearbyDevices => 'Dispositius propers';
	@override String get thisDevice => 'Aquest dispositiu';
	@override String get scan => 'Cercar dispositius';
	@override String get sendMode => 'Mode d\'enviament';
	@override late final _StringsSendTabSendModesCa sendModes = _StringsSendTabSendModesCa._(_root);
	@override String get sendModeHelp => 'Explicació';
	@override String get help => 'Si us plau, asseguris que el destinatari està a la mateixa xarxa Wi-Fi.';
	@override String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _StringsSettingsTabCa extends _StringsSettingsTabEn {
	_StringsSettingsTabCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configuració';
	@override late final _StringsSettingsTabGeneralCa general = _StringsSettingsTabGeneralCa._(_root);
	@override late final _StringsSettingsTabReceiveCa receive = _StringsSettingsTabReceiveCa._(_root);
	@override late final _StringsSettingsTabNetworkCa network = _StringsSettingsTabNetworkCa._(_root);
	@override String get advancedSettings => 'Configuració avançada';
}

// Path: troubleshootPage
class _StringsTroubleshootPageCa extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Solucionar problemes';
	@override String get subTitle => 'L\'aplicació no funciona com s\'espera? Aquí pot trobar la solucions dels problemes més comuns.';
	@override String get solution => 'Solució:';
	@override String get fixButton => 'Corregir automàticament';
	@override late final _StringsTroubleshootPageFirewallCa firewall = _StringsTroubleshootPageFirewallCa._(_root);
	@override late final _StringsTroubleshootPageNoConnectionCa noConnection = _StringsTroubleshootPageNoConnectionCa._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageCa extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historial';
	@override String get openFolder => 'Obrir carpeta';
	@override String get deleteHistory => 'Eliminar historial';
	@override String get empty => 'L\'historial està buit.';
	@override late final _StringsReceiveHistoryPageEntryActionsCa entryActions = _StringsReceiveHistoryPageEntryActionsCa._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageCa extends _StringsApkPickerPageEn {
	_StringsApkPickerPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicacions (APK)';
	@override String get excludeSystemApps => 'Excloure aplicacions del sistema';
	@override String get excludeAppsWithoutLaunchIntent => 'Excloure aplicacions no executables';
	@override String apps({required Object n}) => '${n} Aplicacions';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageCa extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Eliminar tot';
}

// Path: receivePage
class _StringsReceivePageCa extends _StringsReceivePageEn {
	_StringsReceivePageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n,
		one: 'vol enviar un fitxer',
		other: 'vol enviar ${n} fitxers',
	);
	@override String get subTitleMessage => 't\'ha enviat un missatge:';
	@override String get subTitleLink => 't\'ha enviat un enllaç:';
	@override String get canceled => 'El remitent ha cancelat la petició.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageCa extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opcions';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Carpeta LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'S\'ha desactivat automàticament perquè hi ha carpetes.';
}

// Path: sendPage
class _StringsSendPageCa extends _StringsSendPageEn {
	_StringsSendPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Esperant una resposta...';
	@override String get rejected => 'El destinatari ha rebutjat la petició.';
	@override String get busy => 'El destinatari està ocupat amb una altra petició.';
}

// Path: progressPage
class _StringsProgressPageCa extends _StringsProgressPageEn {
	_StringsProgressPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Enviant fitxers';
	@override String get titleReceiving => 'Rebent fitxers';
	@override String get savedToGallery => 'Guardar a Fotos';
	@override late final _StringsProgressPageTotalCa total = _StringsProgressPageTotalCa._(_root);
}

// Path: webSharePage
class _StringsWebSharePageCa extends _StringsWebSharePageEn {
	_StringsWebSharePageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compartir via enllaç';
	@override String get loading => 'Iniciant servidor...';
	@override String get stopping => 'Parant servidor...';
	@override String get error => 'Hi ha hagut un error mentre s\'iniciava el servidor.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n,
		one: 'Obrir l\'enllaç al navegador:',
		other: 'Obrir un d\'aquests enllaços al navegador:',
	);
	@override String get requests => 'Peticions';
	@override String get noRequests => 'Encar ano hi ha peticions.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend utilitza un certificat auto-signat. Cal que l\'accepteu al navegador.';
	@override String pendingRequests({required Object n}) => 'Peticions pendents: ${n}';
}

// Path: aboutPage
class _StringsAboutPageCa extends _StringsAboutPageEn {
	_StringsAboutPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobre LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageCa extends _StringsChangelogPageEn {
	_StringsChangelogPageCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registre de canvis';
}

// Path: aliasGenerator
class _StringsAliasGeneratorCa extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Adorable',
		'Bonic',
		'Gran',
		'Brillant',
		'Neteja',
		'Intel·ligent',
		'Guai',
		'Bonic',
		'Astúcia',
		'Determinat',
		'Energètic',
		'Eficient',
		'Fantàstic',
		'Ràpid',
		'Bé',
		'Fresca',
		'Bo',
		'Preciós',
		'Genial',
		'Guapo',
		'Calent',
		'Amable',
		'Encantador',
		'Místic',
		'Producte',
		'Bonic',
		'Pacient',
		'Bonic',
		'Potent',
		'Ric',
		'Secret',
		'Intel·ligent',
		'Sòlid',
		'Especial',
		'Estratègic',
		'Fort',
		'Endreçat',
		'Savi',
	];
	@override List<String> get fruits => [
		'Poma',
		'Alvocat',
		'Plàtan',
		'Blackberry',
		'Nabiu',
		'Bròquil',
		'Pastanaga',
		'Cirera',
		'Coco',
		'Raïm',
		'Llimona',
		'Enciam',
		'Mango',
		'Meló',
		'Bolet',
		'Ceba',
		'Taronja',
		'Papaia',
		'Préssec',
		'Pera',
		'Pinya',
		'Patata',
		'Carbassa',
		'Gerd',
		'Maduixa',
		'Tomàquet',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsCa extends _StringsDialogsEn {
	_StringsDialogsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileCa addFile = _StringsDialogsAddFileCa._(_root);
	@override late final _StringsDialogsAddressInputCa addressInput = _StringsDialogsAddressInputCa._(_root);
	@override late final _StringsDialogsCancelSessionCa cancelSession = _StringsDialogsCancelSessionCa._(_root);
	@override late final _StringsDialogsCannotOpenFileCa cannotOpenFile = _StringsDialogsCannotOpenFileCa._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeCa encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeCa._(_root);
	@override late final _StringsDialogsErrorDialogCa errorDialog = _StringsDialogsErrorDialogCa._(_root);
	@override late final _StringsDialogsFileInfoCa fileInfo = _StringsDialogsFileInfoCa._(_root);
	@override late final _StringsDialogsFileNameInputCa fileNameInput = _StringsDialogsFileNameInputCa._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedCa localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedCa._(_root);
	@override late final _StringsDialogsMessageInputCa messageInput = _StringsDialogsMessageInputCa._(_root);
	@override late final _StringsDialogsNoFilesCa noFiles = _StringsDialogsNoFilesCa._(_root);
	@override late final _StringsDialogsNoPermissionCa noPermission = _StringsDialogsNoPermissionCa._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformCa notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformCa._(_root);
	@override late final _StringsDialogsQrCa qr = _StringsDialogsQrCa._(_root);
	@override late final _StringsDialogsQuickActionsCa quickActions = _StringsDialogsQuickActionsCa._(_root);
	@override late final _StringsDialogsQuickSaveNoticeCa quickSaveNotice = _StringsDialogsQuickSaveNoticeCa._(_root);
	@override late final _StringsDialogsSendModeHelpCa sendModeHelp = _StringsDialogsSendModeHelpCa._(_root);
}

// Path: tray
class _StringsTrayCa extends _StringsTrayEn {
	_StringsTrayCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Sortir de LocalSend';
}

// Path: web
class _StringsWebCa extends _StringsWebEn {
	_StringsWebCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Rebutjat';
	@override String get files => 'Fitxers';
	@override String get fileName => 'Nom del fitxer';
	@override String get size => 'Mida';
}

// Path: assetPicker
class _StringsAssetPickerCa extends _StringsAssetPickerEn {
	_StringsAssetPickerCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancel·lar';
	@override String get edit => 'Editar';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Càrrega fallida';
	@override String get original => 'Original';
	@override String get preview => 'Vista prèvia';
	@override String get select => 'Seleccioni';
	@override String get emptyList => 'Llista buida';
	@override String get unSupportedAssetType => 'Tipus de fitxer no suportat.';
	@override String get unableToAccessAll => 'No es pot accedir a tots els fitxers del dispositiu.';
	@override String get viewingLimitedAssetsTip => 'Visualitza només fitxers i àlbums accessibles per l\'aplicació.';
	@override String get changeAccessibleLimitedAssets => 'Faci clic per actualitzar els fitxers accessibles';
	@override String get accessAllTip => 'L\'aplicació només pot accedir a alguns fitxers del dispositiu. Vés a la configuració del sistema i permet que l\'aplicació accedeixi a tots els mitjans del dispositiu.';
	@override String get goToSystemSettings => 'Anar a la configuració del sistema';
	@override String get accessLimitedAssets => 'Continuar amb accés limitat';
	@override String get accessiblePathName => 'Fitxers accessibles';
	@override String get sTypeAudioLabel => 'Àudio';
	@override String get sTypeImageLabel => 'Imatge';
	@override String get sTypeVideoLabel => 'Vídeo';
	@override String get sTypeOtherLabel => 'Altres medis';
	@override String get sActionPlayHint => 'reproduir';
	@override String get sActionPreviewHint => 'previ';
	@override String get sActionSelectHint => 'selecccionar';
	@override String get sActionSwitchPathLabel => 'canviar ruta';
	@override String get sActionUseCameraHint => 'utilitzar càmera';
	@override String get sNameDurationLabel => 'duració';
	@override String get sUnitAssetCountLabel => 'comptar';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxCa extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Àlies:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionCa extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selección';
	@override String files({required Object files}) => 'Fitxers: ${files}';
	@override String size({required Object size}) => 'Mida: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerCa extends _StringsSendTabPickerEn {
	_StringsSendTabPickerCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fitxer';
	@override String get folder => 'Carpeta';
	@override String get media => 'Media';
	@override String get text => 'Text';
	@override String get app => 'App';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesCa extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get single => 'Destí únic';
	@override String get multiple => 'Varis destins';
	@override String get link => 'Compartir via enllaç';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralCa extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'General';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsCa brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsCa._(_root);
	@override String get color => 'Color';
	@override late final _StringsSettingsTabGeneralColorOptionsCa colorOptions = _StringsSettingsTabGeneralColorOptionsCa._(_root);
	@override String get language => 'Idioma';
	@override late final _StringsSettingsTabGeneralLanguageOptionsCa languageOptions = _StringsSettingsTabGeneralLanguageOptionsCa._(_root);
	@override String get saveWindowPlacement => 'Surt: desa la ubicació de la finestra';
	@override String get minimizeToTray => 'Surt: Minimitzar a la safata';
	@override String get launchAtStartup => 'Inici automàtic després d\'iniciar sessió';
	@override String get launchMinimized => 'Inici automàtic: Inici minimitzat';
	@override String get animations => 'Animacions';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveCa extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rebre';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Destinació';
	@override String get downloads => '(Descàrregues)';
	@override String get saveToGallery => 'Desar media a la galeria';
	@override String get saveToHistory => 'Desa a l\'historial';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkCa extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Xarxa';
	@override String get needRestart => 'Reiniciar el servidor per aplicar la configuració!';
	@override String get server => 'Servidor';
	@override String get alias => 'Àlies';
	@override String get deviceType => 'Tipus de dispositiu';
	@override String get deviceModel => 'Model de dispositiu';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Podria no ser detectat per altres dispositius perquè està utilitzant un port personalitzat. (per defecte: ${defaultPort})';
	@override String get encryption => 'Encriptació';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Podria no ser detectat per altres dispositius perquè està utilitzant una adreça multicast personalitzada. (per defecte: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallCa extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aquesta aplicació pot enviar fitxers a altres dispositius però altres dispositius no poden enviar fitxers a aquest.';
	@override String solution({required Object port}) => 'El més provable és que sigui un problema del tallafocs. Pot solucionar-ho permetent les connexiions entrants (UDP I TCP) al port ${port}.';
	@override String get openFirewall => 'Obrir Tallafocs';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionCa extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ambdós dispositius no poden trobar-se ni compartir fitxers.';
	@override String get solution => 'El problema existeix als dos costats? S\'ha d\'assegurar que els dispositius estan a la mateixa xarxa Wi-Fi i comparteixen la mateixa configuració (port, adreça multicast i encriptació). El Wi-Fi pot no permetre la comunciació entre participants. En aquest cas, s\'ha d\'activar l\'opció a l\'encaminador.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsCa extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get open => 'Obrir fitxer';
	@override String get info => 'Informació';
	@override String get deleteFromHistory => 'Eliminar de l\'historial';
}

// Path: progressPage.total
class _StringsProgressPageTotalCa extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleCa title = _StringsProgressPageTotalTitleCa._(_root);
	@override String count({required Object curr, required Object n}) => 'Fitxers: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Mida: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Velocitat: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileCa extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Afegir a la selecció';
	@override String get content => 'Què vol afegir?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputCa extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introdueixi adreça';
	@override String get hashtag => 'Etiqueta';
	@override String get ip => 'Adreça IP';
	@override String get recentlyUsed => 'Utilitzat recentment: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionCa extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cancel·lar transferència del fitxer';
	@override String get content => 'Segur que vol cancel·lar la transferència del fitxer?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileCa extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'No es pot obrir el fitxer';
	@override String content({required Object file}) => 'No pot obrir el "${file}". Aquest fitxer s\'ha mogut, reanomenat o eliminat?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeCa extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encriptació deshabilitada';
	@override String get content => 'La comunicació ara es fa mitjançant el protocol HTTP no xifrat. Per utilitzar HTTPS, torneu a activar l\'encriptació.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogCa extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoCa extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informació del fitxer';
	@override String get fileName => 'Nom del fitxer:';
	@override String get path => 'Ruta:';
	@override String get size => 'Mida:';
	@override String get sender => 'Remitent:';
	@override String get time => 'Temps:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputCa extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introdueixi el nom del fitxer';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedCa extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend no pot trobar altres dispositius sense tenir el permís per escanejar la xarxa local. Concediu aquest permís a la configuració.';
	@override String get gotoSettings => 'Configuració';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputCa extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tipus de missatge';
	@override String get multiline => 'Multilínia';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesCa extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fitxer no seleccionat';
	@override String get content => 'Si us plau, seleccioni un fitxer com a mínim.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionCa extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sense permisos';
	@override String get content => 'No has concedit els permisos necessaris. Concediu-los a la configuració.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformCa extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'No disponible';
	@override String get content => 'Aquesta característica només està disponible a:';
}

// Path: dialogs.qr
class _StringsDialogsQrCa extends _StringsDialogsQrEn {
	_StringsDialogsQrCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Codi QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsCa extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accions Ràpides';
	@override String get counter => 'Comptador';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Emplenar amb zeros';
	@override String get sortBeforeCount => 'Ordenar prèviament alfabèticament';
	@override String get random => 'Aleatori';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeCa extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Les sol·licituds d\'arxiu s\'accepten automàticament. Tingueu en compte que tothom a la xarxa local us pot enviar fitxers.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpCa extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modes d\'enviament';
	@override String get single => 'Enviar fitxers a un destinatari. La selecció s\'esborrarà un cop finalitzada la transferència de fitxers.';
	@override String get multiple => 'Enviar fitxers a diversos destinataris. La selecció no s\'esborrarà.';
	@override String get link => 'Els destinataris que no tinguin LocalSend instal·lat poden descarregar els fitxers seleccionats obrint l\'enllaç al seu navegador.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsCa extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Fosc';
	@override String get light => 'Clar';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsCa extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsCa extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleCa extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleCa._(_StringsCa root) : this._root = root, super._(root);

	@override final _StringsCa _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progrés total (${time})';
	@override String get finishedError => 'Finalitzat amb error';
	@override String get canceledSender => 'Cancel·lat pel remitent';
	@override String get canceledReceiver => 'Cancelat pel destinatari';
}
