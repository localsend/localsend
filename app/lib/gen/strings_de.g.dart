part of 'strings.g.dart';

// Path: <root>
class _StringsDe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsDe _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Deutsch';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralDe general = _StringsGeneralDe._(_root);
	@override late final _StringsReceiveTabDe receiveTab = _StringsReceiveTabDe._(_root);
	@override late final _StringsSendTabDe sendTab = _StringsSendTabDe._(_root);
	@override late final _StringsSettingsTabDe settingsTab = _StringsSettingsTabDe._(_root);
	@override late final _StringsTroubleshootPageDe troubleshootPage = _StringsTroubleshootPageDe._(_root);
	@override late final _StringsReceiveHistoryPageDe receiveHistoryPage = _StringsReceiveHistoryPageDe._(_root);
	@override late final _StringsApkPickerPageDe apkPickerPage = _StringsApkPickerPageDe._(_root);
	@override late final _StringsSelectedFilesPageDe selectedFilesPage = _StringsSelectedFilesPageDe._(_root);
	@override late final _StringsReceivePageDe receivePage = _StringsReceivePageDe._(_root);
	@override late final _StringsReceiveOptionsPageDe receiveOptionsPage = _StringsReceiveOptionsPageDe._(_root);
	@override late final _StringsSendPageDe sendPage = _StringsSendPageDe._(_root);
	@override late final _StringsProgressPageDe progressPage = _StringsProgressPageDe._(_root);
	@override late final _StringsWebSharePageDe webSharePage = _StringsWebSharePageDe._(_root);
	@override late final _StringsAboutPageDe aboutPage = _StringsAboutPageDe._(_root);
	@override late final _StringsDonationPageDe donationPage = _StringsDonationPageDe._(_root);
	@override late final _StringsChangelogPageDe changelogPage = _StringsChangelogPageDe._(_root);
	@override late final _StringsAliasGeneratorDe aliasGenerator = _StringsAliasGeneratorDe._(_root);
	@override late final _StringsDialogsDe dialogs = _StringsDialogsDe._(_root);
	@override late final _StringsTrayDe tray = _StringsTrayDe._(_root);
	@override late final _StringsWebDe web = _StringsWebDe._(_root);
	@override late final _StringsAssetPickerDe assetPicker = _StringsAssetPickerDe._(_root);
}

// Path: general
class _StringsGeneralDe extends _StringsGeneralEn {
	_StringsGeneralDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Akzeptieren';
	@override String get accepted => 'Akzeptiert';
	@override String get add => 'Hinzufügen';
	@override String get advanced => 'Erweitert';
	@override String get cancel => 'Abbrechen';
	@override String get close => 'Schließen';
	@override String get confirm => 'Bestätigen';
	@override String get continueStr => 'Weiter';
	@override String get copy => 'Kopieren';
	@override String get copiedToClipboard => 'In die Zwischenablage kopiert';
	@override String get decline => 'Ablehnen';
	@override String get done => 'Fertig';
	@override String get delete => 'Löschen';
	@override String get edit => 'Bearbeiten';
	@override String get error => 'Fehler';
	@override String get example => 'Beispiel';
	@override String get files => 'Dateien';
	@override String get finished => 'Abgeschlossen';
	@override String get hide => 'Verstecken';
	@override String get off => 'Aus';
	@override String get offline => 'Offline';
	@override String get on => 'An';
	@override String get online => 'Online';
	@override String get open => 'Öffnen';
	@override String get queue => 'Warteschlange';
	@override String get quickSave => 'Quick Save';
	@override String get renamed => 'Umbenannt';
	@override String get reset => 'Zurücksetzen';
	@override String get restart => 'Neustarten';
	@override String get settings => 'Einstellungen';
	@override String get skipped => 'Übersprungen';
	@override String get start => 'Start';
	@override String get stop => 'Stop';
	@override String get save => 'Speichern';
	@override String get unchanged => 'Unverändert';
	@override String get unknown => 'Unbekannt';
	@override String get noItemInClipboard => 'Kein Element in der Zwischenablage gefunden.';
}

// Path: receiveTab
class _StringsReceiveTabDe extends _StringsReceiveTabEn {
	_StringsReceiveTabDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Empfangen';
	@override late final _StringsReceiveTabInfoBoxDe infoBox = _StringsReceiveTabInfoBoxDe._(_root);
}

// Path: sendTab
class _StringsSendTabDe extends _StringsSendTabEn {
	_StringsSendTabDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Senden';
	@override late final _StringsSendTabSelectionDe selection = _StringsSendTabSelectionDe._(_root);
	@override late final _StringsSendTabPickerDe picker = _StringsSendTabPickerDe._(_root);
	@override String get shareIntentInfo => 'Du kannst auch die "Teilen"-Funktion deines mobilen Geräts nutzen, um Dateien einfacher auszuwählen.';
	@override String get nearbyDevices => 'Geräte in der Nähe';
	@override String get thisDevice => 'Dieses Gerät';
	@override String get scan => 'Geräte suchen';
	@override String get sendMode => 'Sendemodus';
	@override late final _StringsSendTabSendModesDe sendModes = _StringsSendTabSendModesDe._(_root);
	@override String get sendModeHelp => 'Erklärung';
	@override String get help => 'Bitte stelle sicher, dass sich das gewünschte Ziel auch im selben WLAN-Netzwerk befindet.';
	@override String get placeItems => 'Dateien ablegen, um zu teilen.';
}

// Path: settingsTab
class _StringsSettingsTabDe extends _StringsSettingsTabEn {
	_StringsSettingsTabDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Einstellungen';
	@override late final _StringsSettingsTabGeneralDe general = _StringsSettingsTabGeneralDe._(_root);
	@override late final _StringsSettingsTabReceiveDe receive = _StringsSettingsTabReceiveDe._(_root);
	@override late final _StringsSettingsTabNetworkDe network = _StringsSettingsTabNetworkDe._(_root);
	@override late final _StringsSettingsTabOtherDe other = _StringsSettingsTabOtherDe._(_root);
	@override String get advancedSettings => 'Erweiterte Einstellungen';
}

// Path: troubleshootPage
class _StringsTroubleshootPageDe extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fehlerbehebung';
	@override String get subTitle => 'Diese App funktioniert nicht wie erwartet? Hier findest du häufige Lösungsansätze.';
	@override String get solution => 'Lösung:';
	@override String get fixButton => 'Automatisch beheben';
	@override late final _StringsTroubleshootPageFirewallDe firewall = _StringsTroubleshootPageFirewallDe._(_root);
	@override late final _StringsTroubleshootPageNoConnectionDe noConnection = _StringsTroubleshootPageNoConnectionDe._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageDe extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verlauf';
	@override String get openFolder => 'Ordner öffnen';
	@override String get deleteHistory => 'Verlauf löschen';
	@override String get empty => 'Der Verlauf ist leer.';
	@override late final _StringsReceiveHistoryPageEntryActionsDe entryActions = _StringsReceiveHistoryPageEntryActionsDe._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageDe extends _StringsApkPickerPageEn {
	_StringsApkPickerPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'System-Apps ausschließen';
	@override String get excludeAppsWithoutLaunchIntent => 'Nicht-startbare Apps ausschließen';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageDe extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Alle löschen';
}

// Path: receivePage
class _StringsReceivePageDe extends _StringsReceivePageEn {
	_StringsReceivePageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(n,
		one: 'möchte dir eine Datei senden',
		other: 'möchte dir ${n} Dateien senden',
	);
	@override String get subTitleMessage => 'sendet dir eine Nachricht:';
	@override String get subTitleLink => 'sendet dir einen Link:';
	@override String get canceled => 'Der Absender hat die Anfrage abgebrochen.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageDe extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Optionen';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend-Ordner)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Aufgrund von Ordnern automatisch ausgeschaltet.';
}

// Path: sendPage
class _StringsSendPageDe extends _StringsSendPageEn {
	_StringsSendPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Warte auf Antwort...';
	@override String get rejected => 'Der Empfänger hat die Anfrage abgelehnt.';
	@override String get busy => 'Der Empfänger ist mit einer anderen Anfrage beschäftigt.';
}

// Path: progressPage
class _StringsProgressPageDe extends _StringsProgressPageEn {
	_StringsProgressPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Sende Dateien';
	@override String get titleReceiving => 'Empfange Dateien';
	@override String get savedToGallery => 'in Fotos gespeichert';
	@override late final _StringsProgressPageTotalDe total = _StringsProgressPageTotalDe._(_root);
}

// Path: webSharePage
class _StringsWebSharePageDe extends _StringsWebSharePageEn {
	_StringsWebSharePageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Per Link teilen';
	@override String get loading => 'Starte Server...';
	@override String get stopping => 'Stoppe server...';
	@override String get error => 'Ein Fehler ist beim Starten des Servers aufgetreten.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(n,
		one: 'Öffne diesen Link im Browser:',
		other: 'Öffne einer dieser Links im Browser:',
	);
	@override String get requests => 'Anfragen';
	@override String get noRequests => 'Bisher keine Anfragen erhalten.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend verwendet ein selbstsigniertes Zertifikat. Sie müssen es im Browser akzeptieren.';
	@override String pendingRequests({required Object n}) => 'Offene Anfragen: ${n}';
}

// Path: aboutPage
class _StringsAboutPageDe extends _StringsAboutPageEn {
	_StringsAboutPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Über LocalSend';
	@override List<String> get description => [
		'LocalSend ist eine kostenlose Open-Source-App, mit der du Dateien und Nachrichten sicher über dein lokales Netzwerk mit Geräten in der Nähe teilen kannst, ohne dass eine Internetverbindung erforderlich ist.',
		'Diese App ist für Android, iOS, macOS, Windows und Linux verfügbar. Alle Downloadmöglichkeiten findest du auf der offiziellen Homepage.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Mitwirkende';
	@override String get translators => 'Übersetzer:innen';
}

// Path: donationPage
class _StringsDonationPageDe extends _StringsDonationPageEn {
	_StringsDonationPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Spenden';
	@override String get info => 'LocalSend ist kostenlos, open-source und frei von Werbung. Wenn dir diese App gefällt, kannst du die Entwicklung mit einer Spende unterstützen.';
	@override String donate({required Object amount}) => 'Spende ${amount}';
	@override String get thanks => 'Vielen Dank für deine Unterstützung!';
	@override String get restore => 'Käufe Wiederherstellen';
}

// Path: changelogPage
class _StringsChangelogPageDe extends _StringsChangelogPageEn {
	_StringsChangelogPageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorDe extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsDe extends _StringsDialogsEn {
	_StringsDialogsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileDe addFile = _StringsDialogsAddFileDe._(_root);
	@override late final _StringsDialogsAddressInputDe addressInput = _StringsDialogsAddressInputDe._(_root);
	@override late final _StringsDialogsCancelSessionDe cancelSession = _StringsDialogsCancelSessionDe._(_root);
	@override late final _StringsDialogsCannotOpenFileDe cannotOpenFile = _StringsDialogsCannotOpenFileDe._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeDe encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeDe._(_root);
	@override late final _StringsDialogsErrorDialogDe errorDialog = _StringsDialogsErrorDialogDe._(_root);
	@override late final _StringsDialogsFavoriteDialogDe favoriteDialog = _StringsDialogsFavoriteDialogDe._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogDe favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogDe._(_root);
	@override late final _StringsDialogsFavoriteEditDialogDe favoriteEditDialog = _StringsDialogsFavoriteEditDialogDe._(_root);
	@override late final _StringsDialogsFileInfoDe fileInfo = _StringsDialogsFileInfoDe._(_root);
	@override late final _StringsDialogsFileNameInputDe fileNameInput = _StringsDialogsFileNameInputDe._(_root);
	@override late final _StringsDialogsHistoryClearDialogDe historyClearDialog = _StringsDialogsHistoryClearDialogDe._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedDe localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedDe._(_root);
	@override late final _StringsDialogsMessageInputDe messageInput = _StringsDialogsMessageInputDe._(_root);
	@override late final _StringsDialogsNoFilesDe noFiles = _StringsDialogsNoFilesDe._(_root);
	@override late final _StringsDialogsNoPermissionDe noPermission = _StringsDialogsNoPermissionDe._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformDe notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformDe._(_root);
	@override late final _StringsDialogsQrDe qr = _StringsDialogsQrDe._(_root);
	@override late final _StringsDialogsQuickActionsDe quickActions = _StringsDialogsQuickActionsDe._(_root);
	@override late final _StringsDialogsQuickSaveNoticeDe quickSaveNotice = _StringsDialogsQuickSaveNoticeDe._(_root);
	@override late final _StringsDialogsSendModeHelpDe sendModeHelp = _StringsDialogsSendModeHelpDe._(_root);
}

// Path: tray
class _StringsTrayDe extends _StringsTrayEn {
	_StringsTrayDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend beenden';
}

// Path: web
class _StringsWebDe extends _StringsWebEn {
	_StringsWebDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Abgelehnt';
	@override String get files => 'Dateien';
	@override String get fileName => 'Dateiname';
	@override String get size => 'Größe';
}

// Path: assetPicker
class _StringsAssetPickerDe extends _StringsAssetPickerEn {
	_StringsAssetPickerDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Bestätigen';
	@override String get cancel => 'Abbrechen';
	@override String get edit => 'Bearbeiten';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Ladevorgang ist fehlgeschlagen';
	@override String get original => 'Ursprung';
	@override String get preview => 'Vorschau';
	@override String get select => 'Auswählen';
	@override String get emptyList => 'Leere Liste';
	@override String get unSupportedAssetType => 'Format ist nicht unterstützt.';
	@override String get unableToAccessAll => 'Zugriff nicht möglich';
	@override String get viewingLimitedAssetsTip => 'Zeigen Sie nur Dateien und Alben an, auf die die App zugreifen kann.';
	@override String get changeAccessibleLimitedAssets => 'Tippen, um erlaubte Dateien zu aktualisieren';
	@override String get accessAllTip => 'Die App kann nur auf einige der Dateien auf dem Gerät zugreifen. Öffnen Sie die Systemeinstellungen und erlauben Sie der App, \nauf alle Dateien auf dem Gerät zuzugreifen';
	@override String get goToSystemSettings => 'Gehe zu den Systemeinstellungen';
	@override String get accessLimitedAssets => 'Fahre fort mit limitiertem Zugriff';
	@override String get accessiblePathName => 'Verfügbare Assets';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Bild';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Andere Medien';
	@override String get sActionPlayHint => 'Abspielen';
	@override String get sActionPreviewHint => 'Vorschau';
	@override String get sActionSelectHint => 'Auswählen';
	@override String get sActionSwitchPathLabel => 'Dateipfad ändern';
	@override String get sActionUseCameraHint => 'Kamera benutzen';
	@override String get sNameDurationLabel => 'Dauer';
	@override String get sUnitAssetCountLabel => 'Anzahl';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxDe extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionDe extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Auswahl';
	@override String files({required Object files}) => 'Dateien: ${files}';
	@override String size({required Object size}) => 'Größe: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerDe extends _StringsSendTabPickerEn {
	_StringsSendTabPickerDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get file => 'Datei';
	@override String get folder => 'Ordner';
	@override String get media => 'Medien';
	@override String get text => 'Text';
	@override String get app => 'App';
	@override String get clipboard => 'Ablage';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesDe extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get single => 'Einzelner Empfänger';
	@override String get multiple => 'Mehrere Empfänger';
	@override String get link => 'Per Link teilen';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralDe extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Allgemein';
	@override String get brightness => 'Helligkeit';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsDe brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsDe._(_root);
	@override String get color => 'Farbe';
	@override late final _StringsSettingsTabGeneralColorOptionsDe colorOptions = _StringsSettingsTabGeneralColorOptionsDe._(_root);
	@override String get language => 'Sprache';
	@override late final _StringsSettingsTabGeneralLanguageOptionsDe languageOptions = _StringsSettingsTabGeneralLanguageOptionsDe._(_root);
	@override String get saveWindowPlacement => 'Schließen: Fensterposition speichern';
	@override String get minimizeToTray => 'Schließen: in Symbolleiste minimieren';
	@override String get launchAtStartup => 'Autostart nach Login';
	@override String get launchMinimized => 'Autostart: versteckt starten';
	@override String get animations => 'Animationen';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveDe extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Empfangen';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Autom. beenden';
	@override String get destination => 'Ziel-Ordner';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Medien in die Gallerie speichern';
	@override String get saveToHistory => 'In Verlauf speichern';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkDe extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Netzwerk';
	@override String get needRestart => 'Starte den Server neu, um die Änderungen zu übernehmen!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Gerätetyp';
	@override String get deviceModel => 'Gerätemodell';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Möglicherweise wirst du von anderen Geräten nicht erkannt, weil du einen benutzerdefinierten Port verwendest. (Standard: ${defaultPort})';
	@override String get encryption => 'Verschlüsselung';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Möglicherweise wirst du von anderen Geräten nicht erkannt, weil du eine benutzerdefinierte Multicast-Adresse verwendest. (Standard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherDe extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Weitere';
	@override String get support => 'LocalSend unterstützen';
	@override String get donate => 'Spenden';
	@override String get privacyPolicy => 'Datenschutzerklärung';
	@override String get termsOfUse => 'Nutzungsbedingungen';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallDe extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Diese App kann Dateien an andere Geräte senden, aber nicht umgekehrt.';
	@override String solution({required Object port}) => 'Dies ist höchstwahrscheinlich ein Firewall-Problem. Du kannst es lösen, indem du eingehende Verbindungen (UDP und TCP) auf Port ${port} zulässt.';
	@override String get openFirewall => 'Firewall öffnen';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionDe extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Beide Geräte können sich nicht sehen noch können sie Dateien miteinander teilen.';
	@override String get solution => 'Das Problem tritt auf beiden Seiten auf? Dann stelle sicher, dass beide Geräte im selben WLAN sind sowie dieselbe Konfiguration (Port, Multicast-Adresse, Verschlüsselung) haben. Es kann sein, dass das WLAN keine Kommunikation zwischen Teilnehmern erlaubt. In diesem Fall muss am Router diese Option aktiviert werden.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsDe extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get open => 'Datei öffnen';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Vom Verlauf entfernen';
}

// Path: progressPage.total
class _StringsProgressPageTotalDe extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleDe title = _StringsProgressPageTotalTitleDe._(_root);
	@override String count({required Object curr, required Object n}) => 'Dateien: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Größe: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Geschwindigkeit: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileDe extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zur Auswahl hinzufügen';
	@override String get content => 'Was möchtest du zum Senden hinzufügen?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputDe extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adresse eingeben';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP-Adresse';
	@override String get recentlyUsed => 'Zuletzt verwendet: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionDe extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dateiübertragung abbrechen';
	@override String get content => 'Möchtest du wirklich die Dateiübertragung abbrechen?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileDe extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Öffnen fehlgeschlagen';
	@override String content({required Object file}) => 'Die Datei "${file}" konnte nicht geöffnet werden. Wurde diese Datei verschoben, umbenannt oder gelöscht?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeDe extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verschlüsselung deaktiviert';
	@override String get content => 'Die Kommunikation erfolgt nun über das unverschlüsselte HTTP-Protokoll. Um HTTPS zu verwenden, aktiviere wieder die Verschlüsselung.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogDe extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogDe extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoriten';
	@override String get noFavorites => 'Keine Favoriten konfiguriert.';
	@override String get addFavorite => 'Neu';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogDe extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorit löschen';
	@override String content({required Object name}) => 'Möchtest du wirklich "${name}" löschen?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogDe extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Favorit hinzufügen';
	@override String get titleEdit => 'Favorit bearbeiten';
	@override String get name => 'Name';
	@override String get auto => '(auto)';
	@override String get ip => 'IP-Addresse';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoDe extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Datei-Information';
	@override String get fileName => 'Dateiname:';
	@override String get path => 'Pfad:';
	@override String get size => 'Größe:';
	@override String get sender => 'Absender:';
	@override String get time => 'Zeit:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputDe extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dateiname eingeben';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogDe extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verlauf löschen';
	@override String get content => 'Möchtest du wirklich den gesamten Verlauf löschen?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedDe extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend kann nicht auf das lokale Netzwerk zugreifen. Bitte erlaube LocalSend den Zugriff auf das lokale Netzwerk in den Einstellungen.';
	@override String get gotoSettings => 'Einstellungen';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputDe extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nachricht eingeben';
	@override String get multiline => 'Mehrzeilig';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesDe extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keine Datei ausgewählt';
	@override String get content => 'Bitte wähle mindestens eine Datei aus.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionDe extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keine Berechtigung';
	@override String get content => 'Sie haben die erforderlichen Berechtigungen nicht gewährt. Bitte gewähren Sie sie in den Einstellungen.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformDe extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nicht verfügbar';
	@override String get content => 'Diese Funktion ist nur verfügbar auf:';
}

// Path: dialogs.qr
class _StringsDialogsQrDe extends _StringsDialogsQrEn {
	_StringsDialogsQrDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsDe extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quick Actions';
	@override String get counter => 'Zähler';
	@override String get prefix => 'Prefix';
	@override String get padZero => 'Mit Nullen auffüllen';
	@override String get sortBeforeCount => 'Vorher alphabetisch sortieren';
	@override String get random => 'Zufall';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeDe extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Dateianfragen werden automatisch akzeptiert. Beachte, dass jeder im lokalen Netzwerk dir Dateien senden kann.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpDe extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sendemodus';
	@override String get single => 'Sende Dateien an einen Empfänger. Die Auswahl wird nach Abschluss der Dateiübertragung gelöscht.';
	@override String get multiple => 'Sende Dateien an mehrere Empfänger. Die Auswahl bleibt erhalten.';
	@override String get link => 'Empfänger, die LocalSend nicht installiert haben, können die ausgewählten Dateien herunterladen, in dem sie den Link im Browser öffnen.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsDe extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Dunkel';
	@override String get light => 'Hell';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsDe extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsDe extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleDe extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Gesamtfortschritt (${time})';
	@override String get finishedError => 'Abgeschlossen mit Fehler';
	@override String get canceledSender => 'Abgebrochen durch Absender';
	@override String get canceledReceiver => 'Abgebrochen durch Empfänger';
}
