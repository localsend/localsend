part of 'strings.g.dart';

// Path: <root>
class _StringsCs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsCs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.cs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <cs>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsCs _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Česky';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralCs general = _StringsGeneralCs._(_root);
	@override late final _StringsReceiveTabCs receiveTab = _StringsReceiveTabCs._(_root);
	@override late final _StringsSendTabCs sendTab = _StringsSendTabCs._(_root);
	@override late final _StringsSettingsTabCs settingsTab = _StringsSettingsTabCs._(_root);
	@override late final _StringsTroubleshootPageCs troubleshootPage = _StringsTroubleshootPageCs._(_root);
	@override late final _StringsReceiveHistoryPageCs receiveHistoryPage = _StringsReceiveHistoryPageCs._(_root);
	@override late final _StringsApkPickerPageCs apkPickerPage = _StringsApkPickerPageCs._(_root);
	@override late final _StringsSelectedFilesPageCs selectedFilesPage = _StringsSelectedFilesPageCs._(_root);
	@override late final _StringsReceivePageCs receivePage = _StringsReceivePageCs._(_root);
	@override late final _StringsReceiveOptionsPageCs receiveOptionsPage = _StringsReceiveOptionsPageCs._(_root);
	@override late final _StringsSendPageCs sendPage = _StringsSendPageCs._(_root);
	@override late final _StringsProgressPageCs progressPage = _StringsProgressPageCs._(_root);
	@override late final _StringsWebSharePageCs webSharePage = _StringsWebSharePageCs._(_root);
	@override late final _StringsAboutPageCs aboutPage = _StringsAboutPageCs._(_root);
	@override late final _StringsDonationPageCs donationPage = _StringsDonationPageCs._(_root);
	@override late final _StringsChangelogPageCs changelogPage = _StringsChangelogPageCs._(_root);
	@override late final _StringsAliasGeneratorCs aliasGenerator = _StringsAliasGeneratorCs._(_root);
	@override late final _StringsDialogsCs dialogs = _StringsDialogsCs._(_root);
	@override late final _StringsTrayCs tray = _StringsTrayCs._(_root);
	@override late final _StringsWebCs web = _StringsWebCs._(_root);
	@override late final _StringsAssetPickerCs assetPicker = _StringsAssetPickerCs._(_root);
}

// Path: general
class _StringsGeneralCs extends _StringsGeneralEn {
	_StringsGeneralCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Přijmout';
	@override String get accepted => 'Přijato';
	@override String get add => 'Přidat';
	@override String get advanced => 'Pokročilé';
	@override String get cancel => 'Zrušit';
	@override String get close => 'Zavřít';
	@override String get confirm => 'Potvrdit';
	@override String get continueStr => 'Pokračovat';
	@override String get copy => 'Kopírovat';
	@override String get copiedToClipboard => 'Zkopírováno do schránky';
	@override String get decline => 'Odmítnout';
	@override String get done => 'Hotovo';
	@override String get delete => 'Vymazat';
	@override String get edit => 'Upravit';
	@override String get error => 'Chyba';
	@override String get example => 'Příklad';
	@override String get files => 'Soubory';
	@override String get finished => 'Hotovo';
	@override String get hide => 'Skrýt';
	@override String get off => 'Vypnuto';
	@override String get offline => 'Offline';
	@override String get on => 'Zapnuto';
	@override String get online => 'Online';
	@override String get open => 'Otevřít';
	@override String get queue => 'Fronta';
	@override String get quickSave => 'Rychlé uložení';
	@override String get renamed => 'Přejmenováno';
	@override String get reset => 'Resetovat';
	@override String get restart => 'Restartovat';
	@override String get settings => 'Nastavení';
	@override String get skipped => 'Přeskočeno';
	@override String get start => 'Spustit';
	@override String get stop => 'Zastavit';
	@override String get save => 'Uložit';
	@override String get unchanged => 'Nezměněno';
	@override String get unknown => 'Neznámý';
	@override String get noItemInClipboard => 'Žádná položka ve schránce';
}

// Path: receiveTab
class _StringsReceiveTabCs extends _StringsReceiveTabEn {
	_StringsReceiveTabCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Příjmout';
	@override late final _StringsReceiveTabInfoBoxCs infoBox = _StringsReceiveTabInfoBoxCs._(_root);
}

// Path: sendTab
class _StringsSendTabCs extends _StringsSendTabEn {
	_StringsSendTabCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odeslat';
	@override late final _StringsSendTabSelectionCs selection = _StringsSendTabSelectionCs._(_root);
	@override late final _StringsSendTabPickerCs picker = _StringsSendTabPickerCs._(_root);
	@override String get shareIntentInfo => 'Pro snazší výběr souborů můžete také použít funkci "Sdílet" svého mobilního zařízení.';
	@override String get nearbyDevices => 'Zařízení v okolí';
	@override String get thisDevice => 'Toto zařízení';
	@override String get scan => 'Hledat zařízení';
	@override String get sendMode => 'Režim odesílání';
	@override late final _StringsSendTabSendModesCs sendModes = _StringsSendTabSendModesCs._(_root);
	@override String get sendModeHelp => 'Vysvětlení';
	@override String get help => 'Ujistěte se, že se požadovaný cíl nachází ve stejné síti Wi-Fi.';
	@override String get placeItems => 'Vložte položky, které chcete sdílet.';
}

// Path: settingsTab
class _StringsSettingsTabCs extends _StringsSettingsTabEn {
	_StringsSettingsTabCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nastavení';
	@override late final _StringsSettingsTabGeneralCs general = _StringsSettingsTabGeneralCs._(_root);
	@override late final _StringsSettingsTabReceiveCs receive = _StringsSettingsTabReceiveCs._(_root);
	@override late final _StringsSettingsTabNetworkCs network = _StringsSettingsTabNetworkCs._(_root);
	@override late final _StringsSettingsTabOtherCs other = _StringsSettingsTabOtherCs._(_root);
	@override String get advancedSettings => 'Pokročilá nastavení';
}

// Path: troubleshootPage
class _StringsTroubleshootPageCs extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odstraňování problémů';
	@override String get subTitle => 'Tato aplikace nefunguje podle očekávání? Zde najdete častá řešení.';
	@override String get solution => 'Řešení:';
	@override String get fixButton => 'Opravit automaticky';
	@override late final _StringsTroubleshootPageFirewallCs firewall = _StringsTroubleshootPageFirewallCs._(_root);
	@override late final _StringsTroubleshootPageNoConnectionCs noConnection = _StringsTroubleshootPageNoConnectionCs._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageCs extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historie';
	@override String get openFolder => 'Otevřít složku';
	@override String get deleteHistory => 'Smazat historii';
	@override String get empty => 'Historie je prázdná.';
	@override late final _StringsReceiveHistoryPageEntryActionsCs entryActions = _StringsReceiveHistoryPageEntryActionsCs._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageCs extends _StringsApkPickerPageEn {
	_StringsApkPickerPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikace (APK)';
	@override String get excludeSystemApps => 'Vyloučit systémové aplikace';
	@override String get excludeAppsWithoutLaunchIntent => 'Vyloučit aplikace, které nelze spustit';
	@override String apps({required Object n}) => '${n} Aplikace';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageCs extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Smazat vše';
}

// Path: receivePage
class _StringsReceivePageCs extends _StringsReceivePageEn {
	_StringsReceivePageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('cs'))(n,
		one: 'vám chce poslat soubor',
		other: 'vám chce poslat ${n} souborů',
	);
	@override String get subTitleMessage => 'vám poslal zprávu:';
	@override String get subTitleLink => 'vám poslal odkaz:';
	@override String get canceled => 'Odesílatel zrušil požadavek.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageCs extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Automaticky vypnuto, protože existují adresáře.';
}

// Path: sendPage
class _StringsSendPageCs extends _StringsSendPageEn {
	_StringsSendPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Čekání na odpověď...';
	@override String get rejected => 'Příjemce žádost odmítl.';
	@override String get busy => 'Příjemce je zaneprázdněn dalším požadavkem.';
}

// Path: progressPage
class _StringsProgressPageCs extends _StringsProgressPageEn {
	_StringsProgressPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Odesílání souborů';
	@override String get titleReceiving => 'Přijímání souborů';
	@override String get savedToGallery => 'Uloženo ve Fotkách';
	@override late final _StringsProgressPageTotalCs total = _StringsProgressPageTotalCs._(_root);
}

// Path: webSharePage
class _StringsWebSharePageCs extends _StringsWebSharePageEn {
	_StringsWebSharePageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sdílet pomocí odkazu';
	@override String get loading => 'Spouštění serveru...';
	@override String get stopping => 'Zastavování serveru...';
	@override String get error => 'Při spouštění serveru došlo k chybě.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('cs'))(n,
		one: 'Otevřete tento odkaz v prohlížeči:',
		other: 'Otevřete v prohlížeči jeden z těchto odkazů:',
	);
	@override String get requests => 'Žádosti';
	@override String get noRequests => 'Zatím žádné žádosti.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend používá self-signed certifikát. Musíte ho přijmout ve vašem prohlížeči.';
	@override String pendingRequests({required Object n}) => 'Čekající žádosti: ${n}';
}

// Path: aboutPage
class _StringsAboutPageCs extends _StringsAboutPageEn {
	_StringsAboutPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'O aplikaci LocalSend';
	@override List<String> get description => [
		'LocalSend je bezplatná aplikace s otevřeným zdrojovým kódem, která vám umožňuje bezpečně sdílet soubory a zprávy s okolními zařízeními přes vaši místní síť, aniž byste potřebovali připojení k internetu.',
		'Tato aplikace je dostupná pro Android, iOS, macOS, Windows a Linux. Všechny možnosti stahování najdete na oficiální domovské stránce.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Přispěvatelé';
	@override String get translators => 'Překladatelé';
}

// Path: donationPage
class _StringsDonationPageCs extends _StringsDonationPageEn {
	_StringsDonationPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Darovat';
	@override String get info => 'LocalSend je zdarma, open source a bez reklam. Pokud se vám aplikace líbí, můžete její vývoj podpořit darem.';
	@override String donate({required Object amount}) => 'Darovat ${amount}';
	@override String get thanks => 'Děkuji mnohokrát!';
	@override String get restore => 'Obnovit';
}

// Path: changelogPage
class _StringsChangelogPageCs extends _StringsChangelogPageEn {
	_StringsChangelogPageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seznam změn';
}

// Path: aliasGenerator
class _StringsAliasGeneratorCs extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsCs extends _StringsDialogsEn {
	_StringsDialogsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileCs addFile = _StringsDialogsAddFileCs._(_root);
	@override late final _StringsDialogsAddressInputCs addressInput = _StringsDialogsAddressInputCs._(_root);
	@override late final _StringsDialogsCancelSessionCs cancelSession = _StringsDialogsCancelSessionCs._(_root);
	@override late final _StringsDialogsCannotOpenFileCs cannotOpenFile = _StringsDialogsCannotOpenFileCs._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeCs encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeCs._(_root);
	@override late final _StringsDialogsErrorDialogCs errorDialog = _StringsDialogsErrorDialogCs._(_root);
	@override late final _StringsDialogsFavoriteDialogCs favoriteDialog = _StringsDialogsFavoriteDialogCs._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogCs favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogCs._(_root);
	@override late final _StringsDialogsFavoriteEditDialogCs favoriteEditDialog = _StringsDialogsFavoriteEditDialogCs._(_root);
	@override late final _StringsDialogsFileInfoCs fileInfo = _StringsDialogsFileInfoCs._(_root);
	@override late final _StringsDialogsFileNameInputCs fileNameInput = _StringsDialogsFileNameInputCs._(_root);
	@override late final _StringsDialogsHistoryClearDialogCs historyClearDialog = _StringsDialogsHistoryClearDialogCs._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedCs localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedCs._(_root);
	@override late final _StringsDialogsMessageInputCs messageInput = _StringsDialogsMessageInputCs._(_root);
	@override late final _StringsDialogsNoFilesCs noFiles = _StringsDialogsNoFilesCs._(_root);
	@override late final _StringsDialogsNoPermissionCs noPermission = _StringsDialogsNoPermissionCs._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformCs notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformCs._(_root);
	@override late final _StringsDialogsQrCs qr = _StringsDialogsQrCs._(_root);
	@override late final _StringsDialogsQuickActionsCs quickActions = _StringsDialogsQuickActionsCs._(_root);
	@override late final _StringsDialogsQuickSaveNoticeCs quickSaveNotice = _StringsDialogsQuickSaveNoticeCs._(_root);
	@override late final _StringsDialogsSendModeHelpCs sendModeHelp = _StringsDialogsSendModeHelpCs._(_root);
}

// Path: tray
class _StringsTrayCs extends _StringsTrayEn {
	_StringsTrayCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Ukončit LocalSend';
}

// Path: web
class _StringsWebCs extends _StringsWebEn {
	_StringsWebCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Odmítnuto';
	@override String get files => 'Soubory';
	@override String get fileName => 'Název souboru';
	@override String get size => 'Velikost';
}

// Path: assetPicker
class _StringsAssetPickerCs extends _StringsAssetPickerEn {
	_StringsAssetPickerCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Potvrdit';
	@override String get cancel => 'Zrušit';
	@override String get edit => 'Editovat';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Načtení se nezdařilo';
	@override String get original => 'Původ';
	@override String get preview => 'Náhled';
	@override String get select => 'Vybrat';
	@override String get emptyList => 'Prázdný seznam';
	@override String get unSupportedAssetType => 'Nepodporovaný typ souboru.';
	@override String get unableToAccessAll => 'Nelze získat přístup ke všem souborům v zařízení';
	@override String get viewingLimitedAssetsTip => 'Zobrazit pouze soubory a alba, ke kterým má aplikace přístup.';
	@override String get changeAccessibleLimitedAssets => 'Kliknutím aktualizujete přístupné soubory';
	@override String get accessAllTip => 'Aplikace má přístup pouze k některým souborům v zařízení. Přejděte do nastavení systému a povolte aplikaci přístup ke všem médiím v zařízení.';
	@override String get goToSystemSettings => 'Přejít do nastavení systému';
	@override String get accessLimitedAssets => 'Pokračovat s omezeným přístupem';
	@override String get accessiblePathName => 'Přístupné soubory';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Obrázek';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Ostatní média';
	@override String get sActionPlayHint => 'přehrát';
	@override String get sActionPreviewHint => 'náhled';
	@override String get sActionSelectHint => 'vybrat';
	@override String get sActionSwitchPathLabel => 'změnit cestu';
	@override String get sActionUseCameraHint => 'použít kameru';
	@override String get sNameDurationLabel => 'doba trvání';
	@override String get sUnitAssetCountLabel => 'počet';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxCs extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionCs extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vybrat';
	@override String files({required Object files}) => 'Soubory: ${files}';
	@override String size({required Object size}) => 'Velikost: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerCs extends _StringsSendTabPickerEn {
	_StringsSendTabPickerCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get file => 'Soubor';
	@override String get folder => 'Složka';
	@override String get media => 'Média';
	@override String get text => 'Text';
	@override String get app => 'Aplikace';
	@override String get clipboard => 'Vložit';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesCs extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get single => 'Jediný příjemce';
	@override String get multiple => 'Více příjemců';
	@override String get link => 'Sdílet pomocí odkazu';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralCs extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Všeobecné';
	@override String get brightness => 'Motiv';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsCs brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsCs._(_root);
	@override String get color => 'Barva';
	@override late final _StringsSettingsTabGeneralColorOptionsCs colorOptions = _StringsSettingsTabGeneralColorOptionsCs._(_root);
	@override String get language => 'Jazyk';
	@override late final _StringsSettingsTabGeneralLanguageOptionsCs languageOptions = _StringsSettingsTabGeneralLanguageOptionsCs._(_root);
	@override String get saveWindowPlacement => 'Při ukončení uložit umístění okna';
	@override String get minimizeToTray => 'Při ukončení minimalizovat do lišty';
	@override String get launchAtStartup => 'Automatické spuštění po přihlášení';
	@override String get launchMinimized => 'Automatické spuštění: skrytý start';
	@override String get animations => 'Animace';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveCs extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Příjmout';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Automatické dokončování';
	@override String get destination => 'Uložit do';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Uložit média do galerie';
	@override String get saveToHistory => 'Uložit do historie';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkCs extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Síť';
	@override String get needRestart => 'Chcete-li použít nastavení, restartujte server!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Typ zařízení';
	@override String get deviceModel => 'Model zařízení';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Je možné, že vás ostatní zařízení nezjistí, protože používáte vlastní port. (výchozí: ${defaultPort})';
	@override String get encryption => 'Šifrování';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Je možné, že vás ostatní zařízení nezjistí, protože používáte vlastní adresu vícesměrového vysílání. (výchozí: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherCs extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ostatní';
	@override String get support => 'Podporujte LocalSend';
	@override String get donate => 'Darovat';
	@override String get privacyPolicy => 'Zásady ochrany osobních údajů';
	@override String get termsOfUse => 'Podmínky použití';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallCs extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Tato aplikace může odesílat soubory do jiných zařízení, ale jiná zařízení nemohou odesílat soubory do tohoto zařízení.';
	@override String solution({required Object port}) => 'S největší pravděpodobností se jedná o problém s firewallem. Můžete to vyřešit povolením příchozích připojení (UDP a TCP) na portu ${port}.';
	@override String get openFirewall => 'Otevřít bránu firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionCs extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Obě zařízení se nemohou navzájem objevit ani nemohou sdílet soubory.';
	@override String get solution => 'Problém je na obou stranách? Pak se musíte ujistit, že jsou obě zařízení ve stejné wifi síti a sdílejí stejnou konfiguraci (port, multicastová adresa, šifrování). Wifi nemusí umožňovat komunikaci mezi účastníky. V takovém případě musí být tato možnost povolena na routeru.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsCs extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get open => 'Otevřít soubor';
	@override String get info => 'Informace';
	@override String get deleteFromHistory => 'Smazat z historie';
}

// Path: progressPage.total
class _StringsProgressPageTotalCs extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleCs title = _StringsProgressPageTotalTitleCs._(_root);
	@override String count({required Object curr, required Object n}) => 'Soubory: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Velikost: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Rychlost: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileCs extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Přidat do výběru';
	@override String get content => 'Co chcete přidat?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputCs extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zadat adresu';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Adresa';
	@override String get recentlyUsed => 'Nedávno použité: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionCs extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zrušit přenos souborů';
	@override String get content => 'Opravdu chcete zrušit přenos souborů?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileCs extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nelze otevřít soubor';
	@override String content({required Object file}) => 'Nelze otevřít "${file}". Byl tento soubor přesunut, přejmenován nebo smazán?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeCs extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Šifrování zakázáno';
	@override String get content => 'Komunikace nyní probíhá prostřednictvím nešifrovaného protokolu HTTP. Chcete-li použít HTTPS, znovu povolte šifrování.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogCs extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogCs extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Oblíbené';
	@override String get noFavorites => 'Zatím nemáte žádná oblíbená zařízení.';
	@override String get addFavorite => 'Přidat';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogCs extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Smazat z oblíbených';
	@override String content({required Object name}) => 'Opravdu chcete smazat "${name}" z oblíbených?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogCs extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Přidat k oblíbeným';
	@override String get titleEdit => 'Upravit';
	@override String get name => 'Přezdívka';
	@override String get auto => '(auto)';
	@override String get ip => 'IP adresa';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoCs extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informace o souboru';
	@override String get fileName => 'Název souboru:';
	@override String get path => 'Cesta:';
	@override String get size => 'Velikost:';
	@override String get sender => 'Odesílatel:';
	@override String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputCs extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zadejte název souboru';
	@override String original({required Object original}) => 'Původní: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogCs extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Smazat historii';
	@override String get content => 'Opravdu chcete smazat celou historii?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedCs extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend nemůže najít jiná zařízení, aniž by měl oprávnění skenovat místní síť. Udělte prosím toto oprávnění v nastavení.';
	@override String get gotoSettings => 'Nastavení';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputCs extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Napište zprávu';
	@override String get multiline => 'Více řádků';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesCs extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Žádný soubor nevybrán';
	@override String get content => 'Vyberte prosím alespoň jeden soubor.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionCs extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Žádné oprávnění';
	@override String get content => 'Neposkytli jste potřebná oprávnění. Prosím, udělte je v nastavení.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformCs extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Není k dispozici';
	@override String get content => 'Tato funkce je dostupná pouze na:';
}

// Path: dialogs.qr
class _StringsDialogsQrCs extends _StringsDialogsQrEn {
	_StringsDialogsQrCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR kód';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsCs extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rychlé akce';
	@override String get counter => 'Číslo';
	@override String get prefix => 'Předpona';
	@override String get padZero => 'Přidat nuly';
	@override String get sortBeforeCount => 'Nejprve seřadit abecedně';
	@override String get random => 'Náhodné jméno';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeCs extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Požadavky na soubor jsou automaticky přijímány. Uvědomte si, že každý v místní síti vám může posílat soubory.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpCs extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Režimy odesílání';
	@override String get single => 'Odešle soubory jednomu příjemci. Po dokončení přenosu souboru bude výběr vymazán.';
	@override String get multiple => 'Odešle soubory více příjemcům. Výběr nebude vymazán.';
	@override String get link => 'Příjemci, kteří nemají nainstalovaný LocalSend, si mohou vybrané soubory stáhnout otevřením odkazu ve svém prohlížeči.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsCs extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systém';
	@override String get dark => 'Tmavý';
	@override String get light => 'Světlý';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsCs extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systém';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsCs extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systém';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleCs extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Celkový průběh (${time})';
	@override String get finishedError => 'Dokončeno s chybou';
	@override String get canceledSender => 'Zrušeno odesílatelem';
	@override String get canceledReceiver => 'Zrušeno příjemcem';
}
