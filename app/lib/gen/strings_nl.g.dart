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
	@override late final _StringsChangelogPageNl changelogPage = _StringsChangelogPageNl._(_root);
	@override late final _StringsAliasGeneratorNl aliasGenerator = _StringsAliasGeneratorNl._(_root);
	@override late final _StringsDialogsNl dialogs = _StringsDialogsNl._(_root);
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
	@override String get continueStr => 'Ga verder';
	@override String get copy => 'Kopiëren';
	@override String get copiedToClipboard => 'Gekopieerd naar het klembord';
	@override String get decline => 'Weigeren';
	@override String get done => 'Klaar';
	@override String get delete => 'Verwijderen';
	@override String get edit => 'Bewerken';
	@override String get error => 'Fout';
	@override String get example => 'Voorbeeld';
	@override String get files => 'Bestanden';
	@override String get finished => 'Afgewerkt';
	@override String get hide => 'Verbergen';
	@override String get off => 'Uit';
	@override String get offline => 'Offline';
	@override String get on => 'Aan';
	@override String get online => 'Online';
	@override String get open => 'Openen';
	@override String get queue => 'Wachtrij';
	@override String get quickSave => 'Snel opslaan';
	@override String get renamed => 'Hernoemd';
	@override String get reset => 'Reset';
	@override String get restart => 'Herstarten';
	@override String get settings => 'Instellingen';
	@override String get skipped => 'Overgeslagen';
	@override String get start => 'Start';
	@override String get stop => 'Stop';
	@override String get save => 'Opslaan';
	@override String get unchanged => 'Ongewijzigd';
	@override String get unknown => 'Onbekend';
	@override String get noItemInClipboard => 'Niets in klembord';
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
	@override String get shareIntentInfo => 'Je kan ook de  "Delen" functie van je telefoon gebruiken om bestanden gemakkelijker te selecteren.';
	@override String get nearbyDevices => 'Apparaten in de buurt';
	@override String get thisDevice => 'Dit apparaat';
	@override String get scan => 'Zoek naar apparaten';
	@override String get sendMode => 'Verzend modus';
	@override late final _StringsSendTabSendModesNl sendModes = _StringsSendTabSendModesNl._(_root);
	@override String get sendModeHelp => 'Info';
	@override String get help => 'Zorg ervoor dat het gewenste doel zich ook in hetzelfde wifi-netwerk bevindt.';
	@override String get placeItems => 'Plaats items om te delen.';
}

// Path: settingsTab
class _StringsSettingsTabNl extends _StringsSettingsTabEn {
	_StringsSettingsTabNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instellingen';
	@override late final _StringsSettingsTabGeneralNl general = _StringsSettingsTabGeneralNl._(_root);
	@override late final _StringsSettingsTabReceiveNl receive = _StringsSettingsTabReceiveNl._(_root);
	@override late final _StringsSettingsTabNetworkNl network = _StringsSettingsTabNetworkNl._(_root);
	@override String get advancedSettings => 'Geavanceerde instellingen';
}

// Path: troubleshootPage
class _StringsTroubleshootPageNl extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Probleem oplossen';
	@override String get subTitle => 'Werkt de app niet als verwacht? Hier kun je algemene oplossingen vinden.';
	@override String get solution => 'Oplossing:';
	@override String get fixButton => 'Automatisch oplossen';
	@override late final _StringsTroubleshootPageFirewallNl firewall = _StringsTroubleshootPageFirewallNl._(_root);
	@override late final _StringsTroubleshootPageNoConnectionNl noConnection = _StringsTroubleshootPageNoConnectionNl._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageNl extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geschiedenis';
	@override String get openFolder => 'Map openen ';
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
	@override String get excludeSystemApps => 'Sluit systeem-apps uit';
	@override String get excludeAppsWithoutLaunchIntent => 'Sluit niet-startbare apps uit';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageNl extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Verwijder alles';
}

// Path: receivePage
class _StringsReceivePageNl extends _StringsReceivePageEn {
	_StringsReceivePageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(n,
		one: 'wil je een bestand verzenden',
		other: 'wil je ${n} bestanden verzenden',
	);
	@override String get subTitleMessage => 'heeft je een bericht verzonden:';
	@override String get subTitleLink => 'heeft je een link verzonden:';
	@override String get canceled => 'De verzender heeft het verzoek geannuleerd.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageNl extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opties';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Automatisch uitgezet want er zijn mappen.';
}

// Path: sendPage
class _StringsSendPageNl extends _StringsSendPageEn {
	_StringsSendPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Wachten op antwoord...';
	@override String get rejected => 'De ontvanger heeft het verzoek geweigerd.';
	@override String get busy => 'De ontvanger is met een ander verzoek bezig.';
}

// Path: progressPage
class _StringsProgressPageNl extends _StringsProgressPageEn {
	_StringsProgressPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Verzenden bestanden';
	@override String get titleReceiving => 'Ontvangen bestanden';
	@override String get savedToGallery => 'Bewaard in foto\'s';
	@override late final _StringsProgressPageTotalNl total = _StringsProgressPageTotalNl._(_root);
}

// Path: webSharePage
class _StringsWebSharePageNl extends _StringsWebSharePageEn {
	_StringsWebSharePageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Delen via weblink';
	@override String get loading => 'Server starten...';
	@override String get stopping => 'Server stoppen...';
	@override String get error => 'Onverwachte fout bij het opstarten van de server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(n,
		one: 'Open deze link in de browser:',
		other: 'Open een van deze links in de browser:',
	);
	@override String get requests => 'Verzoeken';
	@override String get noRequests => 'Nog geen verzoeken.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend maakt gebruik van een zelfondertekend certificaat. U moet het accepteren in de browser.';
	@override String pendingRequests({required Object n}) => 'Openstaande verzoeken: ${n}';
}

// Path: aboutPage
class _StringsAboutPageNl extends _StringsAboutPageEn {
	_StringsAboutPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Over LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageNl extends _StringsChangelogPageEn {
	_StringsChangelogPageNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
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
	@override late final _StringsDialogsSendModeHelpNl sendModeHelp = _StringsDialogsSendModeHelpNl._(_root);
}

// Path: tray
class _StringsTrayNl extends _StringsTrayEn {
	_StringsTrayNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend afsluiten';
}

// Path: web
class _StringsWebNl extends _StringsWebEn {
	_StringsWebNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
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
	@override String get cancel => 'Anuleren';
	@override String get edit => 'Bewerken';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Laadfout';
	@override String get original => 'Herkomst';
	@override String get preview => 'Preview';
	@override String get select => 'Selecteren';
	@override String get emptyList => 'Lege lijst';
	@override String get unSupportedAssetType => 'Niet-ondersteund bestandstype.';
	@override String get unableToAccessAll => 'Geen toegang tot alle gegevens op apparaat';
	@override String get viewingLimitedAssetsTip => 'Beperkte toegang tot gegevens voor deze app.';
	@override String get changeAccessibleLimitedAssets => 'toegangelijke bestanden voor deze app aanpassen';
	@override String get accessAllTip => 'De app heeft slechts beperkte toegang tot uw bestanden. Ga naar het instellingen menu van uw apparaat om de toegangsrechten aan te passen.';
	@override String get goToSystemSettings => 'Ga naar het instellingen menu';
	@override String get accessLimitedAssets => 'Behoud beperkte toegang tot bestanden';
	@override String get accessiblePathName => 'Toegangkelijke bestanden';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Fotos';
	@override String get sTypeVideoLabel => 'Videos';
	@override String get sTypeOtherLabel => 'andere media';
	@override String get sActionPlayHint => 'Afspelen';
	@override String get sActionPreviewHint => 'preview';
	@override String get sActionSelectHint => 'selecteren';
	@override String get sActionSwitchPathLabel => 'bestandspad aanpassen';
	@override String get sActionUseCameraHint => 'camera gebruiken';
	@override String get sNameDurationLabel => 'duur';
	@override String get sUnitAssetCountLabel => 'aantal';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxNl extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Poort:';
	@override String get alias => 'Alias:';
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
	@override String get single => 'Één ontvanger';
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
	@override String get saveWindowPlacement => 'Afsluiten: Vensterindeling behouden';
	@override String get minimizeToTray => 'Stoppen: Minimaliseer naar systeemvak';
	@override String get launchAtStartup => 'Autostart na inloggen';
	@override String get launchMinimized => 'Autostart: Start verborgen';
	@override String get animations => 'Animaties';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveNl extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ontvangen';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Bestemming';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Bewaar media in galerij';
	@override String get saveToHistory => 'Opslaan in geschiedenis';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkNl extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Netwerk';
	@override String get needRestart => 'Server herstarten om instellingen toe te passen!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Apparaattype';
	@override String get deviceModel => 'Apparaatmodel';
	@override String get port => 'Poort';
	@override String portWarning({required Object defaultPort}) => 'Je wordt mogelijk niet gedetecteerd door andere apparaten omdat je een aagepaste poort gebruikt. (standaard: ${defaultPort})';
	@override String get encryption => 'Encryptie';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Je wordt mogelijk niet gedetecteerd door andere apparaten omdate je een aangepast multicast-addres gebruikt. (standaard: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallNl extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Deze app kan bestanden verzenden naar andere apparaten maar andere apparaten kunnen geen bestanden verzenden naar dit apparaat.';
	@override String solution({required Object port}) => 'Dit is hoogstwaarschijnlijk een firewall probleem. Je kan dit oplossen door inkomende verbindingen (UDP en TCP) toe te staan op poort ${port}.';
	@override String get openFirewall => 'Firewall openen';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionNl extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Beide apparaten kunnen elkaar niet ontdekken en kunnen ook geen bestanden delen.';
	@override String get solution => 'Het probleem doet zich aan beide kanten voor? Dan moet je ervoor zorgen dat beide apparaten zich in hetzelfde wifi-netwerk bevinden en dezelfde configuratie delen (poort, multicast-adres, encryptie). De wifi staat mogelijk geen communicatie tussen deelnemers toe. In dit geval moet deze optie op de router zijn ingeschakeld.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsNl extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get open => 'Bestand openen';
	@override String get info => 'Informatie';
	@override String get deleteFromHistory => 'Uit geschiedenis verwijderen';
}

// Path: progressPage.total
class _StringsProgressPageTotalNl extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleNl title = _StringsProgressPageTotalTitleNl._(_root);
	@override String count({required Object curr, required Object n}) => 'Bestanden: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Grootte: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Sneelheid: ${speed}/s';
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
	@override String get title => 'Adres ingeven';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Adres';
	@override String get recentlyUsed => 'Recent gebruikt: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionNl extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bestandsoverdracht annuleren';
	@override String get content => 'Weet je zeker dat je de bestandsoverdracht wil annuleren?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileNl extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Openen mislukt';
	@override String content({required Object file}) => 'Kan het bestand "${file}" niet openen. Is het bestand van plaats veranderd, hernoemd of verwijderd?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeNl extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encryptie uitgeschakeld';
	@override String get content => 'Communicatie gebeurt nu via het onversleutelde HTTP-protocol. Schakel encryptie in om HTTPS opnieuw te gebruiken.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogNl extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogNl extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Voorkeuren';
	@override String get noFavorites => 'Geen Favoriete Apparaten';
	@override String get addFavorite => 'Toevoegen';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogNl extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'uit voorkeuren verwijderen';
	@override String content({required Object name}) => 'Weet u zeker dat u  "${name}" wilt verwijderen uit uw favorieten?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogNl extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Aan Favorieten toevoegen';
	@override String get titleEdit => 'Aanpassen';
	@override String get name => 'Alias';
	@override String get auto => '(auto)';
	@override String get ip => 'IP Adres';
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
	@override String get size => 'Groote:';
	@override String get sender => 'Verzender:';
	@override String get time => 'Tijdstip:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputNl extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Voer bestandsnaam in';
	@override String original({required Object original}) => 'Origineel: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogNl extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geschiedenis wissen';
	@override String get content => 'Weet u zeker dat u de geschiedenis wilt wissen?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedNl extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend kan geen andere apparaten op uw netwerk vinden zonder de juiste rechten voor netwerktoegang te hebben verkregen. Stel deze correct in in het instellingen menu.';
	@override String get gotoSettings => 'Instellingen';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputNl extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Typ bericht';
	@override String get multiline => 'Meerdere lijnen';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesNl extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geen bestand geselecteerd';
	@override String get content => 'Selecteer minstens één bestand.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionNl extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geen rechten';
	@override String get content => 'U heeft de benodigde rechten niet verleend. Verleen deze alstublieft in de instellingen.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformNl extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Niet beschikbaar';
	@override String get content => 'Deze functie is enkel beschikbaar op:';
}

// Path: dialogs.qr
class _StringsDialogsQrNl extends _StringsDialogsQrEn {
	_StringsDialogsQrNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsNl extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Snelle acties';
	@override String get counter => 'Teller';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Met nullen aanvullen';
	@override String get sortBeforeCount => 'Vooraf alfabetisch sorteren';
	@override String get random => 'Willekeurig';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeNl extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Bestandsoverdrachten worden automatisch geaccepteerd. Houd er rekening mee dat iedereen in het lokale netwerk je bestanden kan sturen.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpNl extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpNl._(_StringsNl root) : this._root = root, super._(root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verzend opties';
	@override String get single => 'Naar één ontvanger zenden. Selectie de-selecteren na verzending.';
	@override String get multiple => 'Naar meerdere ontvangers zenden. Selectie blijft geselecteerd na verzending.';
	@override String get link => 'Ontvangers die de app niet hebben geïnstalleerd kunnen bestanden downloaden door de link in hun browser te openen.';
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
	@override String sending({required Object time}) => 'Totale vooruitgang (${time})';
	@override String get finishedError => 'Afgerond met een foutmelding';
	@override String get canceledSender => 'Geannuleerd door de verzender';
	@override String get canceledReceiver => 'Geannuleerd door de ontvanger';
}
