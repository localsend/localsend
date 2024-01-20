part of 'strings.g.dart';

// Path: <root>
class _StringsDa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsDa _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Dansk';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralDa general = _StringsGeneralDa._(_root);
	@override late final _StringsReceiveTabDa receiveTab = _StringsReceiveTabDa._(_root);
	@override late final _StringsSendTabDa sendTab = _StringsSendTabDa._(_root);
	@override late final _StringsSettingsTabDa settingsTab = _StringsSettingsTabDa._(_root);
	@override late final _StringsTroubleshootPageDa troubleshootPage = _StringsTroubleshootPageDa._(_root);
	@override late final _StringsReceiveHistoryPageDa receiveHistoryPage = _StringsReceiveHistoryPageDa._(_root);
	@override late final _StringsApkPickerPageDa apkPickerPage = _StringsApkPickerPageDa._(_root);
	@override late final _StringsSelectedFilesPageDa selectedFilesPage = _StringsSelectedFilesPageDa._(_root);
	@override late final _StringsReceivePageDa receivePage = _StringsReceivePageDa._(_root);
	@override late final _StringsReceiveOptionsPageDa receiveOptionsPage = _StringsReceiveOptionsPageDa._(_root);
	@override late final _StringsSendPageDa sendPage = _StringsSendPageDa._(_root);
	@override late final _StringsProgressPageDa progressPage = _StringsProgressPageDa._(_root);
	@override late final _StringsWebSharePageDa webSharePage = _StringsWebSharePageDa._(_root);
	@override late final _StringsAboutPageDa aboutPage = _StringsAboutPageDa._(_root);
	@override late final _StringsDonationPageDa donationPage = _StringsDonationPageDa._(_root);
	@override late final _StringsChangelogPageDa changelogPage = _StringsChangelogPageDa._(_root);
	@override late final _StringsAliasGeneratorDa aliasGenerator = _StringsAliasGeneratorDa._(_root);
	@override late final _StringsDialogsDa dialogs = _StringsDialogsDa._(_root);
	@override late final _StringsTrayDa tray = _StringsTrayDa._(_root);
	@override late final _StringsWebDa web = _StringsWebDa._(_root);
	@override late final _StringsAssetPickerDa assetPicker = _StringsAssetPickerDa._(_root);
}

// Path: general
class _StringsGeneralDa extends _StringsGeneralEn {
	_StringsGeneralDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Accepter';
	@override String get accepted => 'Accepteret';
	@override String get add => 'Tilføj';
	@override String get advanced => 'Avanceret';
	@override String get cancel => 'Afbryd';
	@override String get close => 'Luk';
	@override String get confirm => 'Bebkræft';
	@override String get continueStr => 'Videre';
	@override String get copy => 'Kopier';
	@override String get copiedToClipboard => 'Kopieret til udklipsholderen.';
	@override String get decline => 'Afvis';
	@override String get done => 'Færdig';
	@override String get delete => 'Slet';
	@override String get edit => 'Rediger';
	@override String get error => 'Fejl';
	@override String get example => 'Eksempel';
	@override String get files => 'Filer';
	@override String get finished => 'Fuldendt';
	@override String get hide => 'Skjul';
	@override String get off => 'Fra';
	@override String get offline => 'Offline';
	@override String get on => 'Til';
	@override String get online => 'Online';
	@override String get open => 'Åben';
	@override String get queue => 'Kø';
	@override String get quickSave => 'Quick Save';
	@override String get renamed => 'Omdøbt';
	@override String get reset => 'Nulstil';
	@override String get restart => 'Genstart';
	@override String get settings => 'Indstillinger';
	@override String get skipped => 'Sprunget over';
	@override String get start => 'Start';
	@override String get stop => 'Stop';
	@override String get save => 'Gem';
	@override String get unchanged => 'Uforandret';
	@override String get unknown => 'Ukendt';
	@override String get noItemInClipboard => 'Intet element fundet i udklipsholderen.';
}

// Path: receiveTab
class _StringsReceiveTabDa extends _StringsReceiveTabEn {
	_StringsReceiveTabDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modtag';
	@override late final _StringsReceiveTabInfoBoxDa infoBox = _StringsReceiveTabInfoBoxDa._(_root);
}

// Path: sendTab
class _StringsSendTabDa extends _StringsSendTabEn {
	_StringsSendTabDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send';
	@override late final _StringsSendTabSelectionDa selection = _StringsSendTabSelectionDa._(_root);
	@override late final _StringsSendTabPickerDa picker = _StringsSendTabPickerDa._(_root);
	@override String get shareIntentInfo => 'Du kan også benytte "Dele"-funktionen på din mobilentelefon, for lettere at kunne vælge filer.';
	@override String get nearbyDevices => 'Enheder tæt på';
	@override String get thisDevice => 'Denne enhed';
	@override String get scan => 'Søg efter enheder';
	@override String get sendMode => 'Sendemåde';
	@override late final _StringsSendTabSendModesDa sendModes = _StringsSendTabSendModesDa._(_root);
	@override String get sendModeHelp => 'Forklaring';
	@override String get help => 'Vær venligst sikker på, at den ønskede enhed også befinder sig på samme Wi-Fi-netværk.';
	@override String get placeItems => 'Placer filer for at dele.';
}

// Path: settingsTab
class _StringsSettingsTabDa extends _StringsSettingsTabEn {
	_StringsSettingsTabDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indstillinger';
	@override late final _StringsSettingsTabGeneralDa general = _StringsSettingsTabGeneralDa._(_root);
	@override late final _StringsSettingsTabReceiveDa receive = _StringsSettingsTabReceiveDa._(_root);
	@override late final _StringsSettingsTabNetworkDa network = _StringsSettingsTabNetworkDa._(_root);
	@override late final _StringsSettingsTabOtherDa other = _StringsSettingsTabOtherDa._(_root);
	@override String get advancedSettings => 'Avancerede indstillinger';
}

// Path: troubleshootPage
class _StringsTroubleshootPageDa extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fejlmelding';
	@override String get subTitle => 'Virker appen ikke som forventet? Her finder du hyppigt brugte løsninger.';
	@override String get solution => 'Løsning:';
	@override String get fixButton => 'Løs automatisk';
	@override late final _StringsTroubleshootPageFirewallDa firewall = _StringsTroubleshootPageFirewallDa._(_root);
	@override late final _StringsTroubleshootPageNoConnectionDa noConnection = _StringsTroubleshootPageNoConnectionDa._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageDa extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historik';
	@override String get openFolder => 'Åben mappe';
	@override String get deleteHistory => 'Slet historik';
	@override String get empty => 'Historikken er tom.';
	@override late final _StringsReceiveHistoryPageEntryActionsDa entryActions = _StringsReceiveHistoryPageEntryActionsDa._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageDa extends _StringsApkPickerPageEn {
	_StringsApkPickerPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'Ekskluder System-apps';
	@override String get excludeAppsWithoutLaunchIntent => 'Ekskluder Ikke-startbare Apps';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageDa extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Slet alle';
}

// Path: receivePage
class _StringsReceivePageDa extends _StringsReceivePageEn {
	_StringsReceivePageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(n,
		one: 'vil sende dig en fil',
		other: 'vil sende dig ${n} filer',
	);
	@override String get subTitleMessage => 'sendte dig en besked:';
	@override String get subTitleLink => 'sendte dig et link:';
	@override String get canceled => 'Afsenderen har afbrudt delingen.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageDa extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Muligheder';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend mappe)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Aufgrund von Ordnern automatisch ausgeschaltet.';
}

// Path: sendPage
class _StringsSendPageDa extends _StringsSendPageEn {
	_StringsSendPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Venter på svar...';
	@override String get rejected => 'Modtageren har afvist delingen.';
	@override String get busy => 'Modtageren er optaget med en anden deling.';
}

// Path: progressPage
class _StringsProgressPageDa extends _StringsProgressPageEn {
	_StringsProgressPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Send filer';
	@override String get titleReceiving => 'Modtag filer';
	@override String get savedToGallery => 'Gemt i fotos';
	@override late final _StringsProgressPageTotalDa total = _StringsProgressPageTotalDa._(_root);
}

// Path: webSharePage
class _StringsWebSharePageDa extends _StringsWebSharePageEn {
	_StringsWebSharePageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Del med link';
	@override String get loading => 'Start server...';
	@override String get stopping => 'Stop server...';
	@override String get error => 'En fejl opstod mens serveren blev startet.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(n,
		one: 'Åben dette link i browseren:',
		other: 'Åben et af disse link i browseren:',
	);
	@override String get requests => 'Forespørgsler';
	@override String get noRequests => 'Ingen forespørgsler endnu.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend benytter et selvsigneret certifikat. Det skal accepteres i browseren.';
	@override String pendingRequests({required Object n}) => 'Offene Anfragen: ${n}';
}

// Path: aboutPage
class _StringsAboutPageDa extends _StringsAboutPageEn {
	_StringsAboutPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Om LocalSend';
	@override List<String> get description => [
		'LocalSend er en gratis Open-Source-App, som du kan bruge til sikkert at dele filer og beskeder med andre enheder i nærheden på dit lokale netværk, uden en internet forbindelse.',
		'Appen findes til Android, iOS, macOS, Windows og Linux. Alle downloadmuligheder finder du på den officielle hjemmeside.',
	];
	@override String get author => 'Skaber';
	@override String get contributors => 'Medvirkende';
	@override String get translators => 'Oversættere';
}

// Path: donationPage
class _StringsDonationPageDa extends _StringsDonationPageEn {
	_StringsDonationPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doner';
	@override String get info => 'LocalSend er gratis, open-source og reklamefri. Hvis du kan lide denne app, kan du støtte dens udvikling med en donation.';
	@override String donate({required Object amount}) => 'Donation ${amount}';
	@override String get thanks => 'Tusind tak for din støtte!';
	@override String get restore => 'Genskab køb';
}

// Path: changelogPage
class _StringsChangelogPageDa extends _StringsChangelogPageEn {
	_StringsChangelogPageDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ændringsbemærkninger';
}

// Path: aliasGenerator
class _StringsAliasGeneratorDa extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsDa extends _StringsDialogsEn {
	_StringsDialogsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileDa addFile = _StringsDialogsAddFileDa._(_root);
	@override late final _StringsDialogsAddressInputDa addressInput = _StringsDialogsAddressInputDa._(_root);
	@override late final _StringsDialogsCancelSessionDa cancelSession = _StringsDialogsCancelSessionDa._(_root);
	@override late final _StringsDialogsCannotOpenFileDa cannotOpenFile = _StringsDialogsCannotOpenFileDa._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeDa encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeDa._(_root);
	@override late final _StringsDialogsErrorDialogDa errorDialog = _StringsDialogsErrorDialogDa._(_root);
	@override late final _StringsDialogsFavoriteDialogDa favoriteDialog = _StringsDialogsFavoriteDialogDa._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogDa favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogDa._(_root);
	@override late final _StringsDialogsFavoriteEditDialogDa favoriteEditDialog = _StringsDialogsFavoriteEditDialogDa._(_root);
	@override late final _StringsDialogsFileInfoDa fileInfo = _StringsDialogsFileInfoDa._(_root);
	@override late final _StringsDialogsFileNameInputDa fileNameInput = _StringsDialogsFileNameInputDa._(_root);
	@override late final _StringsDialogsHistoryClearDialogDa historyClearDialog = _StringsDialogsHistoryClearDialogDa._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedDa localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedDa._(_root);
	@override late final _StringsDialogsMessageInputDa messageInput = _StringsDialogsMessageInputDa._(_root);
	@override late final _StringsDialogsNoFilesDa noFiles = _StringsDialogsNoFilesDa._(_root);
	@override late final _StringsDialogsNoPermissionDa noPermission = _StringsDialogsNoPermissionDa._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformDa notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformDa._(_root);
	@override late final _StringsDialogsQrDa qr = _StringsDialogsQrDa._(_root);
	@override late final _StringsDialogsQuickActionsDa quickActions = _StringsDialogsQuickActionsDa._(_root);
	@override late final _StringsDialogsQuickSaveNoticeDa quickSaveNotice = _StringsDialogsQuickSaveNoticeDa._(_root);
	@override late final _StringsDialogsSendModeHelpDa sendModeHelp = _StringsDialogsSendModeHelpDa._(_root);
}

// Path: tray
class _StringsTrayDa extends _StringsTrayEn {
	_StringsTrayDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend beenden';
}

// Path: web
class _StringsWebDa extends _StringsWebEn {
	_StringsWebDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Afvist';
	@override String get files => 'Filer';
	@override String get fileName => 'Filname';
	@override String get size => 'Størrelse';
}

// Path: assetPicker
class _StringsAssetPickerDa extends _StringsAssetPickerEn {
	_StringsAssetPickerDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Bebkræft';
	@override String get cancel => 'Afbryd';
	@override String get edit => 'Rediger';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Indlæsning slog fejl';
	@override String get original => 'Original';
	@override String get preview => 'Forhåndsvisning';
	@override String get select => 'Vælg';
	@override String get emptyList => 'Tom liste';
	@override String get unSupportedAssetType => 'Formatet understøttes ikke.';
	@override String get unableToAccessAll => 'Kan ikke tilgå alle filer på enheden.';
	@override String get viewingLimitedAssetsTip => 'Vis kun filer og mapper tilgængelig for appen.';
	@override String get changeAccessibleLimitedAssets => 'Click for at opdatere tilgængelige filer';
	@override String get accessAllTip => 'Appen kan kun tilgå nogle filer på enheden. Åben venligst systemindstillingerne og giv appen adgang til alle medier på enheden.';
	@override String get goToSystemSettings => 'Gå til systemindstillingerne';
	@override String get accessLimitedAssets => 'Fortsæt med begrænset adgang';
	@override String get accessiblePathName => 'Tilgængelige filer';
	@override String get sTypeAudioLabel => 'Lyd';
	@override String get sTypeImageLabel => 'Billede';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Andre medier';
	@override String get sActionPlayHint => 'Afspil';
	@override String get sActionPreviewHint => 'Forhåndsvisning';
	@override String get sActionSelectHint => 'Vælg';
	@override String get sActionSwitchPathLabel => 'Ændr filens sti';
	@override String get sActionUseCameraHint => 'Benyt kamera';
	@override String get sNameDurationLabel => 'Varighed';
	@override String get sUnitAssetCountLabel => 'Antal';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxDa extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionDa extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hvad vil du dele?';
	@override String files({required Object files}) => 'Filer: ${files}';
	@override String size({required Object size}) => 'Størrelse: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerDa extends _StringsSendTabPickerEn {
	_StringsSendTabPickerDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fil';
	@override String get folder => 'Mappe';
	@override String get media => 'Medie';
	@override String get text => 'Tekst';
	@override String get app => 'App';
	@override String get clipboard => 'Udklipsholder';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesDa extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get single => 'Enkelt modtager';
	@override String get multiple => 'Flere modtagere';
	@override String get link => 'Del med link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralDa extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Generelt';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsDa brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsDa._(_root);
	@override String get color => 'Farve';
	@override late final _StringsSettingsTabGeneralColorOptionsDa colorOptions = _StringsSettingsTabGeneralColorOptionsDa._(_root);
	@override String get language => 'Sprog';
	@override late final _StringsSettingsTabGeneralLanguageOptionsDa languageOptions = _StringsSettingsTabGeneralLanguageOptionsDa._(_root);
	@override String get saveWindowPlacement => 'Afslut: Gem vindueposition.';
	@override String get minimizeToTray => 'Afslut: minimer til dock/menubjælke';
	@override String get launchAtStartup => 'Autostart ved login';
	@override String get launchMinimized => 'Autostart: Skjult ved opstart';
	@override String get animations => 'Animationer';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveDa extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modtag';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Fuldend automatisk';
	@override String get destination => 'Placering';
	@override String get downloads => '(Overførsler)';
	@override String get saveToGallery => 'Gem medier i galleri';
	@override String get saveToHistory => 'Gem i historik';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkDa extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Netværk';
	@override String get needRestart => 'Genstart serveren for at effektuere ændringer!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Enhedstype';
	@override String get deviceModel => 'Enhedsmodel';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Hvis du bruger en brugerdefineret port, vil du muligvis ikke blive genkendt af andre enheder. (Standard: ${defaultPort})';
	@override String get encryption => 'Kryptering';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Du bliver muligvis ikke genkendt af andre enheder, fordi du bruger en brugerdefineret multicast-adresse. (Standard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherDa extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Andet';
	@override String get support => 'Støt LocalSend';
	@override String get donate => 'Doner';
	@override String get privacyPolicy => 'Privatlivspolitik';
	@override String get termsOfUse => 'Brugsbetingelser';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallDa extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Denne app kan sende filer til andre endheder, men ikke omvendt.';
	@override String solution({required Object port}) => 'Dette er højsy sandsynligt et Firewall-problem. Du kan løse det ved at tillade indgående forbindelser (UDP und TCP) på Port ${port} zulässt.';
	@override String get openFirewall => 'Åben firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionDa extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Begge enheder kan hverken se hinanden eller dele data.';
	@override String get solution => 'Findes problemet på begge sider? I så fald skal du sikrer, at begge enheder er tilsluttet samme Wi-Fi-netværk og deler den samme konfiguration (Port, Multicast-adresse, kryptering). Det er muligt, at Wi-Fi-netværket ikke tillader forbindelser mellem enheder. I så fald skal denne indstilling slås til på routeren.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsDa extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get open => 'Åben fil';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Slet fra historikken';
}

// Path: progressPage.total
class _StringsProgressPageTotalDa extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleDa title = _StringsProgressPageTotalTitleDa._(_root);
	@override String count({required Object curr, required Object n}) => 'Filer: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Størrelse: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Hastighed: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileDa extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tilføj til pakke';
	@override String get content => 'Hvad vil du tilføje?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputDa extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skriv adresse';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP-adresse';
	@override String get recentlyUsed => 'Senest brugt: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionDa extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Afbryd filoverførsel';
	@override String get content => 'Vil du virkelig afbryde filoverførslen?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileDa extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kan ikke åbne fil';
	@override String content({required Object file}) => 'Filen "${file}" kunne ikke åbnes. Er denne fil blevet flyttet, omdøbt eller slettet?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeDa extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kryptering slået fra';
	@override String get content => 'Kommunikationen forløber nu over den ukrypterede HTTP-protokol. Aktiver krypteringe for igen at benytte HTTPS.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogDa extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogDa extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritter';
	@override String get noFavorites => 'Ingen favoritten indstillet.';
	@override String get addFavorite => 'Ny';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogDa extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Slet favorit';
	@override String content({required Object name}) => 'Vil du virkelig slette "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogDa extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Tilføj favorit';
	@override String get titleEdit => 'Rediger favorit';
	@override String get name => 'Navn';
	@override String get auto => '(auto)';
	@override String get ip => 'IP-addresse';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoDa extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fil-information';
	@override String get fileName => 'Filnavn:';
	@override String get path => 'Sti:';
	@override String get size => 'Størrelse:';
	@override String get sender => 'Afsender:';
	@override String get time => 'Tidspunkt:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputDa extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Angiv filnavn';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogDa extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Slet historik';
	@override String get content => 'Vil du virkelig slette historikken?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedDa extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend kan ikke finde andre enheder uden tilladelse til at scanne det lokale netværk. Giv venligst tilladelse i systemindstillingerne.';
	@override String get gotoSettings => 'Einstellungen';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputDa extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skriv besked';
	@override String get multiline => 'Flerlinjet';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesDa extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ingen fil valgt';
	@override String get content => 'Vælg mindst en fil.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionDa extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ingen tilladelse';
	@override String get content => 'Du har ikke givet de tilstrækkelige tilladelser. Giv venligst tilladelse i systemindstillingerne.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformDa extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ikke tilgængelig';
	@override String get content => 'Denne funktion er ikke tilgængelig:';
}

// Path: dialogs.qr
class _StringsDialogsQrDa extends _StringsDialogsQrEn {
	_StringsDialogsQrDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-kode';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsDa extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kvikhandlinger';
	@override String get counter => 'Tæller';
	@override String get prefix => 'Præfiks';
	@override String get padZero => 'Fyld med nuller';
	@override String get sortBeforeCount => 'Sorter alfabetisk på forhånd';
	@override String get random => 'Tilfældig';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeDa extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Filoverførsler bliver automatisk accepteret. Bemærk at alle på det lokale netværk kan sende dig filer.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpDa extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sendemåde';
	@override String get single => 'Send filer til en modtager. Filvalget vil blive ryddet når filoverførslen er slut.';
	@override String get multiple => 'Send filer til flere modtagere. Filvalget vil ikke blive ryddet.';
	@override String get link => 'Modtagere, der ikke har LocalSend installeret, kan downloade de valgte filer i en browser.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsDa extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Mørk';
	@override String get light => 'Lys';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsDa extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsDa extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleDa extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleDa._(_StringsDa root) : this._root = root, super._(root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Samlet tid (${time})';
	@override String get finishedError => 'Fuldendt med fejl';
	@override String get canceledSender => 'Afbrudt af afsender';
	@override String get canceledReceiver => 'Afbrudt af modtager';
}
