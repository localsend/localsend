part of 'strings.g.dart';

// Path: <root>
class _StringsSv extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSv.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsSv _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Svenska';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralSv general = _StringsGeneralSv._(_root);
	@override late final _StringsReceiveTabSv receiveTab = _StringsReceiveTabSv._(_root);
	@override late final _StringsSendTabSv sendTab = _StringsSendTabSv._(_root);
	@override late final _StringsSettingsTabSv settingsTab = _StringsSettingsTabSv._(_root);
	@override late final _StringsTroubleshootPageSv troubleshootPage = _StringsTroubleshootPageSv._(_root);
	@override late final _StringsReceiveHistoryPageSv receiveHistoryPage = _StringsReceiveHistoryPageSv._(_root);
	@override late final _StringsApkPickerPageSv apkPickerPage = _StringsApkPickerPageSv._(_root);
	@override late final _StringsSelectedFilesPageSv selectedFilesPage = _StringsSelectedFilesPageSv._(_root);
	@override late final _StringsReceivePageSv receivePage = _StringsReceivePageSv._(_root);
	@override late final _StringsReceiveOptionsPageSv receiveOptionsPage = _StringsReceiveOptionsPageSv._(_root);
	@override late final _StringsSendPageSv sendPage = _StringsSendPageSv._(_root);
	@override late final _StringsProgressPageSv progressPage = _StringsProgressPageSv._(_root);
	@override late final _StringsWebSharePageSv webSharePage = _StringsWebSharePageSv._(_root);
	@override late final _StringsAboutPageSv aboutPage = _StringsAboutPageSv._(_root);
	@override late final _StringsChangelogPageSv changelogPage = _StringsChangelogPageSv._(_root);
	@override late final _StringsAliasGeneratorSv aliasGenerator = _StringsAliasGeneratorSv._(_root);
	@override late final _StringsDialogsSv dialogs = _StringsDialogsSv._(_root);
	@override late final _StringsTraySv tray = _StringsTraySv._(_root);
	@override late final _StringsWebSv web = _StringsWebSv._(_root);
	@override late final _StringsAssetPickerSv assetPicker = _StringsAssetPickerSv._(_root);
}

// Path: general
class _StringsGeneralSv extends _StringsGeneralEn {
	_StringsGeneralSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Acceptera';
	@override String get accepted => 'Accepterad';
	@override String get add => 'Lägg till';
	@override String get advanced => 'Avancerat';
	@override String get cancel => 'Avbryt';
	@override String get close => 'Stäng';
	@override String get confirm => 'Bekräfta';
	@override String get continueStr => 'Vidare';
	@override String get copy => 'Kopiera';
	@override String get copiedToClipboard => 'Kopierat till urklipp';
	@override String get decline => 'Avböj';
	@override String get done => 'Klar';
	@override String get edit => 'Redigera';
	@override String get error => 'Fel';
	@override String get example => 'Exempel';
	@override String get files => 'Filer';
	@override String get finished => 'Färdig';
	@override String get hide => 'Göm';
	@override String get off => 'Av';
	@override String get offline => 'Offline';
	@override String get on => 'På';
	@override String get online => 'Online';
	@override String get open => 'Öppen';
	@override String get queue => 'Kö';
	@override String get quickSave => 'Snabbspara';
	@override String get renamed => 'Bytt namn';
	@override String get reset => 'Återställ';
	@override String get restart => 'Starta om';
	@override String get settings => 'Inställningar';
	@override String get skipped => 'Hoppad över';
	@override String get start => 'Börja';
	@override String get stop => 'Avsluta';
	@override String get save => 'Spara';
	@override String get unchanged => 'Oförändrad';
	@override String get unknown => 'Okänd';
}

// Path: receiveTab
class _StringsReceiveTabSv extends _StringsReceiveTabEn {
	_StringsReceiveTabSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ta emot';
	@override late final _StringsReceiveTabInfoBoxSv infoBox = _StringsReceiveTabInfoBoxSv._(_root);
}

// Path: sendTab
class _StringsSendTabSv extends _StringsSendTabEn {
	_StringsSendTabSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skicka';
	@override late final _StringsSendTabSelectionSv selection = _StringsSendTabSelectionSv._(_root);
	@override late final _StringsSendTabPickerSv picker = _StringsSendTabPickerSv._(_root);
	@override String get shareIntentInfo => 'Du kan också använda "Dela"-funtionen i din mobiltelefon för att lättare välja filer.';
	@override String get nearbyDevices => 'Närbelägna enhter';
	@override String get thisDevice => 'Denna Enhet';
	@override String get scan => 'Leta efter enheter';
	@override String get sendMode => 'Sändningsläge';
	@override late final _StringsSendTabSendModesSv sendModes = _StringsSendTabSendModesSv._(_root);
	@override String get sendModeHelp => 'Förklaring';
	@override String get help => 'Kontrollera att den sökta enheten är uppkopplad till samma wifi nätverk som din enhet.';
	@override String get placeItems => 'Placera objekt att dela';
}

// Path: settingsTab
class _StringsSettingsTabSv extends _StringsSettingsTabEn {
	_StringsSettingsTabSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inställningar';
	@override late final _StringsSettingsTabGeneralSv general = _StringsSettingsTabGeneralSv._(_root);
	@override late final _StringsSettingsTabReceiveSv receive = _StringsSettingsTabReceiveSv._(_root);
	@override late final _StringsSettingsTabNetworkSv network = _StringsSettingsTabNetworkSv._(_root);
	@override String get advancedSettings => 'Avancerade inställningar';
}

// Path: troubleshootPage
class _StringsTroubleshootPageSv extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Felsökning';
	@override String get subTitle => 'Gör appen inte som förväntat? Här hittar du vanliga lösningar.';
	@override String get solution => 'Lösning:';
	@override String get fixButton => 'Fixa automatiskt';
	@override late final _StringsTroubleshootPageFirewallSv firewall = _StringsTroubleshootPageFirewallSv._(_root);
	@override late final _StringsTroubleshootPageNoConnectionSv noConnection = _StringsTroubleshootPageNoConnectionSv._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageSv extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historik';
	@override String get openFolder => 'Öppna mapp';
	@override String get deleteHistory => 'Radera historik';
	@override String get empty => 'Historiken är tom.';
	@override late final _StringsReceiveHistoryPageEntryActionsSv entryActions = _StringsReceiveHistoryPageEntryActionsSv._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageSv extends _StringsApkPickerPageEn {
	_StringsApkPickerPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Appar (APK)';
	@override String get excludeSystemApps => 'Exkludera systemappar';
	@override String get excludeAppsWithoutLaunchIntent => 'Exkludera appar som inte kan startas';
	@override String apps({required Object n}) => '${n} Appar';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageSv extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Radera alla';
}

// Path: receivePage
class _StringsReceivePageSv extends _StringsReceivePageEn {
	_StringsReceivePageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(n,
		one: 'vill skicka en fil till dig',
		other: 'Vill skick ${n} filer till dig',
	);
	@override String get subTitleMessage => 'skickade ett meddelande till dig:';
	@override String get subTitleLink => 'skickade en länk till dig:';
	@override String get canceled => 'Sändaren har avbrutit begäran.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageSv extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alternativ';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend-mappen)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Avstängd automatiskt eftersom det finns kataloger.';
}

// Path: sendPage
class _StringsSendPageSv extends _StringsSendPageEn {
	_StringsSendPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Väntar på svar...';
	@override String get rejected => 'Mottagaren har avvisat begäran.';
	@override String get busy => 'Mottagaren är upptagen med en annan förfrågan.';
}

// Path: progressPage
class _StringsProgressPageSv extends _StringsProgressPageEn {
	_StringsProgressPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Skickar filer';
	@override String get titleReceiving => 'Tar emot filer';
	@override String get savedToGallery => 'Sparat i Foton';
	@override late final _StringsProgressPageTotalSv total = _StringsProgressPageTotalSv._(_root);
}

// Path: webSharePage
class _StringsWebSharePageSv extends _StringsWebSharePageEn {
	_StringsWebSharePageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dela via länk';
	@override String get loading => 'Startar server...';
	@override String get stopping => 'Stoppar servern...';
	@override String get error => 'Ett fel inträffade vid start av servern.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(n,
		one: 'Öppna denna länk i webbläsaren:',
		other: 'Öppna en av dessa länkar i webbläsaren:',
	);
	@override String get requests => 'Förfrågningar';
	@override String get noRequests => 'Inga förfrågningar ännu.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend använder ett självsignerat certifikat. Du behöver acceptera det i webbläsaren.';
	@override String pendingRequests({required Object n}) => 'Väntande förfrågningar: ${n}';
}

// Path: aboutPage
class _StringsAboutPageSv extends _StringsAboutPageEn {
	_StringsAboutPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Om LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageSv extends _StringsChangelogPageEn {
	_StringsChangelogPageSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ändringslog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorSv extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Bedårande',
		'Vacker',
		'Stor',
		'Ljus',
		'Ren',
		'Klyftig',
		'Cool',
		'Söt',
		'Listig',
		'Bestämd',
		'Energisk',
		'Effektiv',
		'Fantastisk',
		'Snabb',
		'Fint',
		'Fräsch',
		'Bra',
		'Underbar',
		'Jättebra',
		'Stilig',
		'Het',
		'Snäll',
		'Underbar',
		'Mystiker',
		'Prydlig',
		'Trevlig',
		'Tålmodig',
		'Snygg',
		'Kraftfull',
		'Rik',
		'Hemlig',
		'Smart',
		'Solid',
		'Speciell',
		'Strategisk',
		'Stark',
		'Ordentlig',
		'Vis',
	];
	@override List<String> get fruits => [
		'Äpple',
		'Avocado',
		'Banan',
		'Björnbär',
		'Blåbär',
		'Broccoli',
		'Morot',
		'Körsbär',
		'Kokosnöt',
		'Druva',
		'Citron',
		'Sallad',
		'Mango',
		'Melon',
		'Svamp',
		'Lök',
		'Apelsin',
		'Papaya',
		'Persika',
		'Päron',
		'Ananas',
		'Potatis',
		'Pumpa',
		'Hallon',
		'Jordgubbe',
		'Tomat',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsSv extends _StringsDialogsEn {
	_StringsDialogsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileSv addFile = _StringsDialogsAddFileSv._(_root);
	@override late final _StringsDialogsAddressInputSv addressInput = _StringsDialogsAddressInputSv._(_root);
	@override late final _StringsDialogsCancelSessionSv cancelSession = _StringsDialogsCancelSessionSv._(_root);
	@override late final _StringsDialogsCannotOpenFileSv cannotOpenFile = _StringsDialogsCannotOpenFileSv._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeSv encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeSv._(_root);
	@override late final _StringsDialogsErrorDialogSv errorDialog = _StringsDialogsErrorDialogSv._(_root);
	@override late final _StringsDialogsFileInfoSv fileInfo = _StringsDialogsFileInfoSv._(_root);
	@override late final _StringsDialogsFileNameInputSv fileNameInput = _StringsDialogsFileNameInputSv._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedSv localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedSv._(_root);
	@override late final _StringsDialogsMessageInputSv messageInput = _StringsDialogsMessageInputSv._(_root);
	@override late final _StringsDialogsNoFilesSv noFiles = _StringsDialogsNoFilesSv._(_root);
	@override late final _StringsDialogsNoPermissionSv noPermission = _StringsDialogsNoPermissionSv._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformSv notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformSv._(_root);
	@override late final _StringsDialogsQrSv qr = _StringsDialogsQrSv._(_root);
	@override late final _StringsDialogsQuickActionsSv quickActions = _StringsDialogsQuickActionsSv._(_root);
	@override late final _StringsDialogsQuickSaveNoticeSv quickSaveNotice = _StringsDialogsQuickSaveNoticeSv._(_root);
	@override late final _StringsDialogsSendModeHelpSv sendModeHelp = _StringsDialogsSendModeHelpSv._(_root);
}

// Path: tray
class _StringsTraySv extends _StringsTrayEn {
	_StringsTraySv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Avsluta LocalSend';
}

// Path: web
class _StringsWebSv extends _StringsWebEn {
	_StringsWebSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Avvisad';
	@override String get files => 'Filer';
	@override String get fileName => 'Filnamn';
	@override String get size => 'Storlek';
}

// Path: assetPicker
class _StringsAssetPickerSv extends _StringsAssetPickerEn {
	_StringsAssetPickerSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Bekräfta';
	@override String get cancel => 'Avbryt';
	@override String get edit => 'Redigera';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Laddning misslyckades';
	@override String get original => 'Original';
	@override String get preview => 'Förhandsvisning';
	@override String get select => 'Välj';
	@override String get emptyList => 'Tom lista';
	@override String get unSupportedAssetType => 'Ogiltig filtyp.';
	@override String get unableToAccessAll => 'Kan inte få åtkomst till alla filer på enheten';
	@override String get viewingLimitedAssetsTip => 'Endast visa filer och album som kan nås av appen.';
	@override String get changeAccessibleLimitedAssets => 'Klicka för att uppdatera åtkomliga filer';
	@override String get accessAllTip => 'Appen kan endast få åtkomst till vissa filer på enheten. Gå till systeminställningar och tillåt appen att få åtkomst till allt media på enheten.';
	@override String get goToSystemSettings => 'Gå till systeminställningar';
	@override String get accessLimitedAssets => 'Fortsätt med begränsad åtkomst';
	@override String get accessiblePathName => 'Åtkomliga filer';
	@override String get sTypeAudioLabel => 'Ljud';
	@override String get sTypeImageLabel => 'Bild';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Annan media';
	@override String get sActionPlayHint => 'spela';
	@override String get sActionPreviewHint => 'förhandsvisa';
	@override String get sActionSelectHint => 'välj';
	@override String get sActionSwitchPathLabel => 'byt sökväg';
	@override String get sActionUseCameraHint => 'använd kamera';
	@override String get sNameDurationLabel => 'längd';
	@override String get sUnitAssetCountLabel => 'antal';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxSv extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionSv extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Val';
	@override String files({required Object files}) => 'Filer: ${files}';
	@override String size({required Object size}) => 'Storlek: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerSv extends _StringsSendTabPickerEn {
	_StringsSendTabPickerSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fil';
	@override String get folder => 'Mapp';
	@override String get media => 'Media';
	@override String get text => 'Text';
	@override String get app => 'App';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesSv extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get single => 'En mottagare';
	@override String get multiple => 'Flera mottagare';
	@override String get link => 'Dela via länk';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralSv extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Allmänt';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsSv brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsSv._(_root);
	@override String get color => 'Färg';
	@override late final _StringsSettingsTabGeneralColorOptionsSv colorOptions = _StringsSettingsTabGeneralColorOptionsSv._(_root);
	@override String get language => 'Språk';
	@override late final _StringsSettingsTabGeneralLanguageOptionsSv languageOptions = _StringsSettingsTabGeneralLanguageOptionsSv._(_root);
	@override String get saveWindowPlacement => 'Avsluta: Spara fönsterplacering';
	@override String get minimizeToTray => 'Lämna: minimera till tray';
	@override String get launchAtStartup => 'Starta automatiskt efter inloggning';
	@override String get launchMinimized => 'Starta automatiskt: starta gömd';
	@override String get animations => 'Animationer';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveSv extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ta emot';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Destination';
	@override String get downloads => '(Hämtade)';
	@override String get saveToGallery => 'Spara media i galleriet';
	@override String get saveToHistory => 'Spara till historik';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkSv extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nätverk';
	@override String get needRestart => 'Starta om servern för att tillämpa inställningarna!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Enhetstyp';
	@override String get deviceModel => 'Enhet modell';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Du kanske inte upptäcks av andra enheter eftersom du använder en anpassad port. (standard: ${defaultPort})';
	@override String get encryption => 'Kryptering';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Du kanske inte upptäcks av andra enheter eftersom du använder en anpassad multicast-adress. (standard: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallSv extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Denna app kan skicka filer till andra enheter men andra enheter kan inte skicka filer till denna enhet.';
	@override String solution({required Object port}) => 'Detta är troligtvis ett brandväggsproblem. Du kan lösa det genom att tillåta inkommande anslutningar (UDP och TCP) på port ${port}.';
	@override String get openFirewall => 'Öppna brandväggen';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionSv extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Båda enheterna kan inte upptäcka varandra eller dela filer.';
	@override String get solution => 'Problemet finns på båda sidor? Då måste du se till att båda enheterna är anslutna till samma wifi-nätverk och delar samma konfiguration (port, multicast-adress, kryptering). Wi-Fi kanske inte tillåter kommunikation mellan deltagare. I så fall måste alternativet vara aktiverat på routern.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsSv extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get open => 'Öppna fil';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Ta bort från historik';
}

// Path: progressPage.total
class _StringsProgressPageTotalSv extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleSv title = _StringsProgressPageTotalTitleSv._(_root);
	@override String count({required Object curr, required Object n}) => 'Filer: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Storlek: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Hastighet: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileSv extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lägg till i val';
	@override String get content => 'Vad vill du lägga till?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputSv extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skriv in adress';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Address';
	@override String get recentlyUsed => 'Senast använda: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionSv extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Avbryt filöverföring';
	@override String get content => 'Vill du verkligen avbryta filöverföringen?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileSv extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kan inte öppna fil';
	@override String content({required Object file}) => 'Kunde inte öppna "${file}". Har denna fil flyttats, bytt namn eller raderats?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeSv extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kryptering inaktiverad';
	@override String get content => 'Kommunikationen sker nu via det oenkrypterade HTTP-protokollet. För att använda HTTPS, aktivera kryptering igen.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogSv extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoSv extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filinformation';
	@override String get fileName => 'Filnamn:';
	@override String get path => 'Sökväg:';
	@override String get size => 'Storlek:';
	@override String get sender => 'Avsändare:';
	@override String get time => 'Tid:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputSv extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skriv in filnamn';
	@override String original({required Object original}) => 'Orginal: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedSv extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend kan inte hitta andra enheter utan att ha behörighet att skanna det lokala nätverket. Bevilja denna behörighet i inställningarna.';
	@override String get gotoSettings => 'Inställningar';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputSv extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skriv meddelande';
	@override String get multiline => 'Flerlinje';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesSv extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ingen fil vald';
	@override String get content => 'Var god välj minst en fil.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionSv extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ingen behörighet';
	@override String get content => 'Du har inte beviljat nödvändiga behörigheter. Var vänlig bevilja dem i inställningarna.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformSv extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inte tillgängligt';
	@override String get content => 'Denna funktion är endast tillgänglig på:';
}

// Path: dialogs.qr
class _StringsDialogsQrSv extends _StringsDialogsQrEn {
	_StringsDialogsQrSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-kod';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsSv extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Snabba Handlingar';
	@override String get counter => 'Disken';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Stoppa med nollor';
	@override String get sortBeforeCount => 'Sortera alphabetiskt innan';
	@override String get random => 'Slumpmässig';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeSv extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Filförfrågningar accepteras automatiskt. Observera att alla i lokala nätverket kan skicka filer till dig.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpSv extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sändningslägen';
	@override String get single => 'Skickar filer till en mottagare. Valet rensas efter avslutad filöverföring.';
	@override String get multiple => 'Skickar filer till flera mottagare. Valet rensas inte.';
	@override String get link => 'Mottagare som inte har LocalSend installerat kan ladda ner de valda filerna genom att öppna länken i deras webbläsare.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsSv extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Mörkt';
	@override String get light => 'Ljust';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsSv extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsSv extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleSv extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleSv._(_StringsSv root) : this._root = root, super._(root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Total  (${time})';
	@override String get finishedError => 'Avslutad med fel';
	@override String get canceledSender => 'Avbruten av sändaren';
	@override String get canceledReceiver => 'Avbruten av mottagaren';
}
