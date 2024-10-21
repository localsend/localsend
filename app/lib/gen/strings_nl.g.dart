///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsNl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsNl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsNl _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Nederlands';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralNl general = _StringsGeneralNl._(_root);
	@override late final _StringsReceiveTabNl receiveTab = _StringsReceiveTabNl._(_root);
	@override late final _StringsSendTabNl sendTab = _StringsSendTabNl._(_root);
	@override late final _StringsSettingsTabNl settingsTab = _StringsSettingsTabNl._(_root);
	@override late final _StringsTroubleshootPageNl troubleshootPage = _StringsTroubleshootPageNl._(_root);
	@override late final _StringsReceiveHistoryPageNl receiveHistoryPage = _StringsReceiveHistoryPageNl._(_root);
	@override late final _StringsApkPickerPageNl apkPickerPage = _StringsApkPickerPageNl._(_root);
	@override late final _StringsSelectedFilesPageNl selectedFilesPage = _StringsSelectedFilesPageNl._(_root);
	@override late final _StringsReceivePageNl receivePage = _StringsReceivePageNl._(_root);
	@override late final _StringsReceiveOptionsPageNl receiveOptionsPage = _StringsReceiveOptionsPageNl._(_root);
	@override late final _StringsSendPageNl sendPage = _StringsSendPageNl._(_root);
	@override late final _StringsProgressPageNl progressPage = _StringsProgressPageNl._(_root);
	@override late final _StringsWebSharePageNl webSharePage = _StringsWebSharePageNl._(_root);
	@override late final _StringsAboutPageNl aboutPage = _StringsAboutPageNl._(_root);
	@override late final _StringsDonationPageNl donationPage = _StringsDonationPageNl._(_root);
	@override late final _StringsChangelogPageNl changelogPage = _StringsChangelogPageNl._(_root);
	@override late final _StringsAliasGeneratorNl aliasGenerator = _StringsAliasGeneratorNl._(_root);
	@override late final _StringsDialogsNl dialogs = _StringsDialogsNl._(_root);
	@override late final _StringsSanitizationNl sanitization = _StringsSanitizationNl._(_root);
	@override late final _StringsTrayNl tray = _StringsTrayNl._(_root);
	@override late final _StringsWebNl web = _StringsWebNl._(_root);
	@override late final _StringsAssetPickerNl assetPicker = _StringsAssetPickerNl._(_root);
}

// Path: general
class _StringsGeneralNl extends _StringsGeneralEn {
	_StringsGeneralNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Accepteren';
	@override String get accepted => 'Geaccepteerd';
	@override String get add => 'Toevoegen';
	@override String get advanced => 'Geavanceerd';
	@override String get cancel => 'Annuleren';
	@override String get close => 'Sluiten';
	@override String get confirm => 'Bevestigen';
	@override String get continueStr => 'Doorgaan';
	@override String get copy => 'Kopiëren';
	@override String get copiedToClipboard => 'Gekopieerd naar klembord';
	@override String get decline => 'Weigeren';
	@override String get done => 'Gereed';
	@override String get delete => 'Verwijderen';
	@override String get edit => 'Bewerken';
	@override String get error => 'Fout';
	@override String get example => 'Voorbeeld';
	@override String get files => 'Bestanden';
	@override String get finished => 'Voltooid';
	@override String get hide => 'Verbergen';
	@override String get off => 'Uit';
	@override String get offline => 'Offline';
	@override String get on => 'Aan';
	@override String get online => 'Online';
	@override String get open => 'Openen';
	@override String get queue => 'Wachtrij';
	@override String get quickSave => 'Snel opslaan';
	@override String get quickSaveFromFavorites => 'Snel opslaan voor \'Favorieten\'';
	@override String get renamed => 'Hernoemd';
	@override String get reset => 'Herstellen';
	@override String get restart => 'Opnieuw starten';
	@override String get settings => 'Instellingen';
	@override String get skipped => 'Overgeslagen';
	@override String get start => 'Starten';
	@override String get stop => 'Stoppen';
	@override String get save => 'Opslaan';
	@override String get unchanged => 'Ongewijzigd';
	@override String get unknown => 'Onbekend';
	@override String get noItemInClipboard => 'Het klembord is leeg.';
}

// Path: receiveTab
class _StringsReceiveTabNl extends _StringsReceiveTabEn {
	_StringsReceiveTabNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ontvangen';
	@override late final _StringsReceiveTabInfoBoxNl infoBox = _StringsReceiveTabInfoBoxNl._(_root);
}

// Path: sendTab
class _StringsSendTabNl extends _StringsSendTabEn {
	_StringsSendTabNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verzenden';
	@override late final _StringsSendTabSelectionNl selection = _StringsSendTabSelectionNl._(_root);
	@override late final _StringsSendTabPickerNl picker = _StringsSendTabPickerNl._(_root);
	@override String get shareIntentInfo => 'Je kunt ook de functie \'Delen\' van je mobiele apparaat gebruiken om gemakkelijker bestanden te selecteren.';
	@override String get nearbyDevices => 'Apparaten in de buurt';
	@override String get thisDevice => 'Dit apparaat';
	@override String get scan => 'Apparaten zoeken';
	@override String get manualSending => 'Handmatig verzenden';
	@override String get sendMode => 'Verzendmodus';
	@override late final _StringsSendTabSendModesNl sendModes = _StringsSendTabSendModesNl._(_root);
	@override String get sendModeHelp => 'Informatie';
	@override String get help => 'Zorg ervoor dat de ontvanger is verbonden met hetzelfde wifi-netwerk.';
	@override String get placeItems => 'Zet items neer om te delen.';
}

// Path: settingsTab
class _StringsSettingsTabNl extends _StringsSettingsTabEn {
	_StringsSettingsTabNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instellingen';
	@override late final _StringsSettingsTabGeneralNl general = _StringsSettingsTabGeneralNl._(_root);
	@override late final _StringsSettingsTabReceiveNl receive = _StringsSettingsTabReceiveNl._(_root);
	@override late final _StringsSettingsTabSendNl send = _StringsSettingsTabSendNl._(_root);
	@override late final _StringsSettingsTabNetworkNl network = _StringsSettingsTabNetworkNl._(_root);
	@override late final _StringsSettingsTabOtherNl other = _StringsSettingsTabOtherNl._(_root);
	@override String get advancedSettings => 'Geavanceerde instellingen';
}

// Path: troubleshootPage
class _StringsTroubleshootPageNl extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Problemen oplossen';
	@override String get subTitle => 'Werkt de app niet zoals verwacht? Op deze pagina vind je oplossingen voor veelvoorkomende problemen.';
	@override String get solution => 'Oplossing:';
	@override String get fixButton => 'Automatisch oplossen';
	@override late final _StringsTroubleshootPageFirewallNl firewall = _StringsTroubleshootPageFirewallNl._(_root);
	@override late final _StringsTroubleshootPageNoDiscoveryNl noDiscovery = _StringsTroubleshootPageNoDiscoveryNl._(_root);
	@override late final _StringsTroubleshootPageNoConnectionNl noConnection = _StringsTroubleshootPageNoConnectionNl._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageNl extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geschiedenis';
	@override String get openFolder => 'Map openen';
	@override String get deleteHistory => 'Geschiedenis verwijderen';
	@override String get empty => 'De geschiedenis is leeg.';
	@override late final _StringsReceiveHistoryPageEntryActionsNl entryActions = _StringsReceiveHistoryPageEntryActionsNl._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageNl extends _StringsApkPickerPageEn {
	_StringsApkPickerPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'Systeemapps uitsluiten';
	@override String get excludeAppsWithoutLaunchIntent => 'Niet-startbare apps uitsluiten';
	@override String apps({required Object n}) => '${n} apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageNl extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Alles verwijderen';
}

// Path: receivePage
class _StringsReceivePageNl extends _StringsReceivePageEn {
	_StringsReceivePageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(n,
		one: 'wil een bestand naar je verzenden',
		other: 'wil ${n} bestanden naar je verzenden',
	);
	@override String get subTitleMessage => 'heeft een bericht naar je verzonden:';
	@override String get subTitleLink => 'heeft een link naar je verzonden:';
	@override String get canceled => 'De verzender heeft het verzoek geannuleerd.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageNl extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opties';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(LocalSend-map)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Automatisch uitgezet omdat er mappen bij zitten.';
}

// Path: sendPage
class _StringsSendPageNl extends _StringsSendPageEn {
	_StringsSendPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Wachten op antwoord...';
	@override String get rejected => 'De ontvanger heeft het verzoek geweigerd.';
	@override String get tooManyAttempts => _root.web.tooManyAttempts;
	@override String get busy => 'De ontvanger is bezig met een ander verzoek.';
}

// Path: progressPage
class _StringsProgressPageNl extends _StringsProgressPageEn {
	_StringsProgressPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Bestanden verzenden';
	@override String get titleReceiving => 'Bestanden ontvangen';
	@override String get savedToGallery => 'Opgeslagen in galerij';
	@override late final _StringsProgressPageTotalNl total = _StringsProgressPageTotalNl._(_root);
}

// Path: webSharePage
class _StringsWebSharePageNl extends _StringsWebSharePageEn {
	_StringsWebSharePageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Delen via link';
	@override String get loading => 'Server starten...';
	@override String get stopping => 'Server stoppen...';
	@override String get error => 'Er is een fout opgetreden bij het starten van de server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(n,
		one: 'Open deze link in je browser:',
		other: 'Open een van deze links in je browser:',
	);
	@override String get requests => 'Verzoeken';
	@override String get noRequests => 'Nog geen verzoeken.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Verzoeken automatisch accepteren';
	@override String get requirePin => 'Code vereisen';
	@override String pinHint({required Object pin}) => 'De code is \'${pin}\'.';
	@override String get encryptionHint => 'LocalSend maakt gebruik van een zelfondertekend certificaat. Je moet dit accepteren in je browser.';
	@override String pendingRequests({required Object n}) => 'Openstaande verzoeken: ${n}';
}

// Path: aboutPage
class _StringsAboutPageNl extends _StringsAboutPageEn {
	_StringsAboutPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Over LocalSend';
	@override List<String> get description => [
		'LocalSend is een gratis en opensource app waarmee je veilig bestanden en berichten met apparaten op je lokale netwerk kunt delen, zonder internetverbinding.',
		'De app is beschikbaar voor Android, iOS, macOS, Windows en Linux. Je vindt alle downloadopties op de officiële website.',
	];
	@override String get author => 'Auteur';
	@override String get contributors => 'Bijdragers';
	@override String get packagers => 'Distributeurs';
	@override String get translators => 'Vertalers';
}

// Path: donationPage
class _StringsDonationPageNl extends _StringsDonationPageEn {
	_StringsDonationPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doneren';
	@override String get info => 'LocalSend is gratis, opensource en advertentievrij. Als je de app graag gebruikt, kun je de ontwikkeling steunen middels een donatie.';
	@override String donate({required Object amount}) => '${amount} doneren';
	@override String get thanks => 'Ontzettend bedankt!';
	@override String get restore => 'Aankoop herstellen';
}

// Path: changelogPage
class _StringsChangelogPageNl extends _StringsChangelogPageEn {
	_StringsChangelogPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wijzigingenoverzicht';
}

// Path: aliasGenerator
class _StringsAliasGeneratorNl extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsNl extends _StringsDialogsEn {
	_StringsDialogsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileNl addFile = _StringsDialogsAddFileNl._(_root);
	@override late final _StringsDialogsAddressInputNl addressInput = _StringsDialogsAddressInputNl._(_root);
	@override late final _StringsDialogsCancelSessionNl cancelSession = _StringsDialogsCancelSessionNl._(_root);
	@override late final _StringsDialogsCannotOpenFileNl cannotOpenFile = _StringsDialogsCannotOpenFileNl._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeNl encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeNl._(_root);
	@override late final _StringsDialogsErrorDialogNl errorDialog = _StringsDialogsErrorDialogNl._(_root);
	@override late final _StringsDialogsFavoriteDialogNl favoriteDialog = _StringsDialogsFavoriteDialogNl._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogNl favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogNl._(_root);
	@override late final _StringsDialogsFavoriteEditDialogNl favoriteEditDialog = _StringsDialogsFavoriteEditDialogNl._(_root);
	@override late final _StringsDialogsFileInfoNl fileInfo = _StringsDialogsFileInfoNl._(_root);
	@override late final _StringsDialogsFileNameInputNl fileNameInput = _StringsDialogsFileNameInputNl._(_root);
	@override late final _StringsDialogsHistoryClearDialogNl historyClearDialog = _StringsDialogsHistoryClearDialogNl._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedNl localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedNl._(_root);
	@override late final _StringsDialogsMessageInputNl messageInput = _StringsDialogsMessageInputNl._(_root);
	@override late final _StringsDialogsNoFilesNl noFiles = _StringsDialogsNoFilesNl._(_root);
	@override late final _StringsDialogsNoPermissionNl noPermission = _StringsDialogsNoPermissionNl._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformNl notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformNl._(_root);
	@override late final _StringsDialogsQrNl qr = _StringsDialogsQrNl._(_root);
	@override late final _StringsDialogsQuickActionsNl quickActions = _StringsDialogsQuickActionsNl._(_root);
	@override late final _StringsDialogsQuickSaveNoticeNl quickSaveNotice = _StringsDialogsQuickSaveNoticeNl._(_root);
	@override late final _StringsDialogsQuickSaveFromFavoritesNoticeNl quickSaveFromFavoritesNotice = _StringsDialogsQuickSaveFromFavoritesNoticeNl._(_root);
	@override late final _StringsDialogsPinNl pin = _StringsDialogsPinNl._(_root);
	@override late final _StringsDialogsSendModeHelpNl sendModeHelp = _StringsDialogsSendModeHelpNl._(_root);
	@override late final _StringsDialogsZoomNl zoom = _StringsDialogsZoomNl._(_root);
}

// Path: sanitization
class _StringsSanitizationNl extends _StringsSanitizationEn {
	_StringsSanitizationNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Bestandsnaam mag niet leeg zijn';
	@override String get invalid => 'Bestandsnaam bevat ongeldige tekens';
}

// Path: tray
class _StringsTrayNl extends _StringsTrayEn {
	_StringsTrayNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'LocalSend afsluiten';
	@override String get closeWindows => 'Sluiten';
}

// Path: web
class _StringsWebNl extends _StringsWebEn {
	_StringsWebNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get enterPin => 'Vul de code in';
	@override String get invalidPin => 'Ongeldige code';
	@override String get tooManyAttempts => 'Te veel pogingen';
	@override String get rejected => 'Geweigerd';
	@override String get files => 'Bestanden';
	@override String get fileName => 'Bestandsnaam';
	@override String get size => 'Grootte';
}

// Path: assetPicker
class _StringsAssetPickerNl extends _StringsAssetPickerEn {
	_StringsAssetPickerNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Bevestigen';
	@override String get cancel => 'Annuleren';
	@override String get edit => 'Bewerken';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Laden mislukt';
	@override String get original => 'Herkomst';
	@override String get preview => 'Voorbeeld';
	@override String get select => 'Selecteren';
	@override String get emptyList => 'Lege lijst';
	@override String get unSupportedAssetType => 'Niet-ondersteund bestandstype.';
	@override String get unableToAccessAll => 'Geen toegang tot alle bestanden op het apparaat';
	@override String get viewingLimitedAssetsTip => 'De app heeft beperkte toegang tot bestanden.';
	@override String get changeAccessibleLimitedAssets => 'Toegankelijke bestanden aanpassen';
	@override String get accessAllTip => 'De app heeft slechts beperkte toegang tot je bestanden. Ga naar de systeeminstellingen om de toegangsrechten aan te passen.';
	@override String get goToSystemSettings => 'Naar systeeminstellingen';
	@override String get accessLimitedAssets => 'Doorgaan met beperkte toegang';
	@override String get accessiblePathName => 'Toegankelijke bestanden';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Foto\'s';
	@override String get sTypeVideoLabel => 'Video\'s';
	@override String get sTypeOtherLabel => 'Andere media';
	@override String get sActionPlayHint => 'afspelen';
	@override String get sActionPreviewHint => 'voorbeeld';
	@override String get sActionSelectHint => 'selecteren';
	@override String get sActionSwitchPathLabel => 'pad wijzigen';
	@override String get sActionUseCameraHint => 'camera gebruiken';
	@override String get sNameDurationLabel => 'duur';
	@override String get sUnitAssetCountLabel => 'aantal';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxNl extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP-adres:';
	@override String get port => 'Poort:';
	@override String get alias => 'Apparaatnaam:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionNl extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selectie';
	@override String files({required Object files}) => 'Bestanden: ${files}';
	@override String size({required Object size}) => 'Grootte: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerNl extends _StringsSendTabPickerEn {
	_StringsSendTabPickerNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get file => 'Bestand';
	@override String get folder => 'Map';
	@override String get media => 'Media';
	@override String get text => 'Tekst';
	@override String get app => 'App';
	@override String get clipboard => 'Plakken';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesNl extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get single => 'Eén ontvanger';
	@override String get multiple => 'Meerdere ontvangers';
	@override String get link => 'Delen via link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralNl extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Algemeen';
	@override String get brightness => 'Thema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsNl brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsNl._(_root);
	@override String get color => 'Kleur';
	@override late final _StringsSettingsTabGeneralColorOptionsNl colorOptions = _StringsSettingsTabGeneralColorOptionsNl._(_root);
	@override String get language => 'Taal';
	@override late final _StringsSettingsTabGeneralLanguageOptionsNl languageOptions = _StringsSettingsTabGeneralLanguageOptionsNl._(_root);
	@override String get saveWindowPlacement => 'Afsluiten: vensterindeling behouden';
	@override String get saveWindowPlacementWindows => 'Afsluiten: vensterindeling behouden';
	@override String get minimizeToTray => 'Sluiten: minimaliseren naar systeemvak/menubalk';
	@override String get launchAtStartup => 'Automatisch starten na aanmelden';
	@override String get launchMinimized => 'Automatisch starten: verborgen';
	@override String get showInContextMenu => 'LocalSend weergeven in contextmenu';
	@override String get animations => 'Animaties';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveNl extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ontvangen';
	@override String get quickSave => _root.general.quickSave;
	@override String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
	@override String get requirePin => _root.webSharePage.requirePin;
	@override String get autoFinish => 'Automatisch voltooien';
	@override String get destination => 'Opslaan in map';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Media opslaan in galerij';
	@override String get saveToHistory => 'Opslaan in geschiedenis';
}

// Path: settingsTab.send
class _StringsSettingsTabSendNl extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verzenden';
	@override String get shareViaLinkAutoAccept => 'Automatisch verzoeken goedkeuren in modus \'Delen via link\'';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkNl extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Netwerk';
	@override String get needRestart => 'Start de server opnieuw op om de instellingen toe te passen.';
	@override String get server => 'Server';
	@override String get alias => 'Apparaatnaam';
	@override String get deviceType => 'Apparaattype';
	@override String get deviceModel => 'Apparaatmodel';
	@override String get port => 'Poort';
	@override String get discoveryTimeout => 'Time-out voor scannen';
	@override String portWarning({required Object defaultPort}) => 'Je apparaat kan mogelijk niet worden gevonden omdat je een aangepaste poort gebruikt. (Standaard: ${defaultPort})';
	@override String get encryption => 'Versleuteling';
	@override String get multicastGroup => 'Multicast-adres';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Je apparaat kan mogelijk niet worden gevonden omdat je een aangepast multicast-adres gebruikt. (Standaard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherNl extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Overig';
	@override String get support => 'LocalSend steunen';
	@override String get donate => 'Doneren';
	@override String get privacyPolicy => 'Privacybeleid';
	@override String get termsOfUse => 'Gebruiksvoorwaarden';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallNl extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Dit apparaat kan bestanden naar andere apparaten verzenden, maar andere apparaten kunnen geen bestanden naar dit apparaat verzenden.';
	@override String solution({required Object port}) => 'Dit is hoogstwaarschijnlijk een firewallprobleem. Je kunt dit oplossen door inkomende verbindingen (UDP en TCP) op poort ${port} toe te staan.';
	@override String get openFirewall => 'Firewall openen';
}

// Path: troubleshootPage.noDiscovery
class _StringsTroubleshootPageNoDiscoveryNl extends _StringsTroubleshootPageNoDiscoveryEn {
	_StringsTroubleshootPageNoDiscoveryNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Dit apparaat vindt geen andere apparaten.';
	@override String get solution => 'Zorg ervoor dat alle apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-adres, versleuteling). Je kunt proberen het IP-adres van het apparaat handmatig in te vullen. Als dat werkt, kun je het apparaat toevoegen aan je favorieten, zodat het voortaan automatisch kan worden gevonden.';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionNl extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Beide apparaten kunnen elkaar niet vinden en kunnen ook geen bestanden delen.';
	@override String get solution => 'Doet het probleem zich aan beide kanten voor? Zorg er dan voor dat beide apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-address, versleuteling). Mogelijk is onderlinge communicatie tussen apparaten op het wifi-netwerk geblokkeerd (AP-isolatie). Dit moet je dan toestaan in de instellingen van je router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsNl extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get open => 'Bestand openen';
	@override String get showInFolder => 'Weergeven in map';
	@override String get info => 'Informatie';
	@override String get deleteFromHistory => 'Verwijderen uit geschiedenis';
}

// Path: progressPage.total
class _StringsProgressPageTotalNl extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleNl title = _StringsProgressPageTotalTitleNl._(_root);
	@override String count({required Object curr, required Object n}) => 'Bestanden: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Grootte: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Snelheid: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileNl extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Toevoegen aan selectie';
	@override String get content => 'Wat wil je toevoegen?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputNl extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vul een adres in';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP-adres';
	@override String get recentlyUsed => 'Onlangs gebruikt: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionNl extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bestandsoverdracht annuleren';
	@override String get content => 'Wil je de bestandsoverdracht annuleren?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileNl extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kan bestand niet openen';
	@override String content({required Object file}) => 'Het bestand \'${file}\' kan niet worden geopend. Het is mogelijk verplaatst, hernoemd of verwijderd.';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeNl extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Versleuteling uitgeschakeld';
	@override String get content => 'Communicatie verloopt nu via het onversleutelde HTTP-protocol. Schakel versleuteling weer in om het HTTPS-protocol te gebruiken.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogNl extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogNl extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorieten';
	@override String get noFavorites => 'Nog geen favoriete apparaten.';
	@override String get addFavorite => 'Toevoegen';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogNl extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verwijderen uit favorieten';
	@override String content({required Object name}) => 'Wil je \'${name}\' uit je favorieten verwijderen?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogNl extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Toevoegen aan favorieten';
	@override String get titleEdit => 'Instellingen';
	@override String get name => 'Apparaatnaam';
	@override String get auto => '(automatisch)';
	@override String get ip => 'IP-adres';
	@override String get port => 'Poort';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoNl extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bestandsinformatie';
	@override String get fileName => 'Bestandsnaam:';
	@override String get path => 'Locatie:';
	@override String get size => 'Grootte:';
	@override String get sender => 'Afzender:';
	@override String get time => 'Tijd:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputNl extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vul een bestandsnaam in';
	@override String original({required Object original}) => 'Origineel: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogNl extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geschiedenis wissen';
	@override String get content => 'Wil je de volledige geschiedenis verwijderen?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedNl extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend heeft rechten nodig om op het lokale netwerk naar andere apparaten te kunnen zoeken. Verleen deze rechten in de instellingen.';
	@override String get gotoSettings => 'Instellingen';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputNl extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Typ een bericht';
	@override String get multiline => 'Meerdere regels';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesNl extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geen bestanden geselecteerd';
	@override String get content => 'Selecteer ten minste één bestand.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionNl extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geen rechten';
	@override String get content => 'Je hebt de benodigde rechten niet verleend. Verleen deze in de instellingen.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformNl extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Niet beschikbaar';
	@override String get content => 'Deze functie is alleen beschikbaar op:';
}

// Path: dialogs.qr
class _StringsDialogsQrNl extends _StringsDialogsQrEn {
	_StringsDialogsQrNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsNl extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Snelle acties';
	@override String get counter => 'Teller';
	@override String get prefix => 'Voorvoegsel';
	@override String get padZero => 'Aanvullen met nullen';
	@override String get sortBeforeCount => 'Vooraf alfabetisch sorteren (A-Z)';
	@override String get random => 'Willekeurig';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeNl extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Bestandsverzoeken worden nu automatisch geaccepteerd. Iedereen op het lokale netwerk kan nu dus bestanden naar je verzenden.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _StringsDialogsQuickSaveFromFavoritesNoticeNl extends _StringsDialogsQuickSaveFromFavoritesNoticeEn {
	_StringsDialogsQuickSaveFromFavoritesNoticeNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSaveFromFavorites;
	@override String get content => 'Bestandsverzoeken van je favoriete apparaten worden nu automatisch geaccepteerd.';
}

// Path: dialogs.pin
class _StringsDialogsPinNl extends _StringsDialogsPinEn {
	_StringsDialogsPinNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vul de code in';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpNl extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verzendmodi';
	@override String get single => 'Bestanden naar één ontvanger verzenden. De selectie wordt na de bestandsoverdracht gewist.';
	@override String get multiple => 'Bestanden naar meerdere ontvangers verzenden. De selectie blijft na de bestandsoverdracht behouden.';
	@override String get link => 'Ontvangers die LocalSend niet hebben geïnstalleerd kunnen de bestanden downloaden door de link in hun browser te openen.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomNl extends _StringsDialogsZoomEn {
	_StringsDialogsZoomNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsNl extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systeem';
	@override String get dark => 'Donker';
	@override String get light => 'Licht';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsNl extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systeem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsNl extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systeem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleNl extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Totale voortgang (${time})';
	@override String get finishedError => 'Voltooid met fouten';
	@override String get canceledSender => 'Geannuleerd door verzender';
	@override String get canceledReceiver => 'Geannuleerd door ontvanger';
}
