///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsSk extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.sk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsSk _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Slovenčina';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralSk general = _StringsGeneralSk._(_root);
	@override late final _StringsReceiveTabSk receiveTab = _StringsReceiveTabSk._(_root);
	@override late final _StringsSendTabSk sendTab = _StringsSendTabSk._(_root);
	@override late final _StringsSettingsTabSk settingsTab = _StringsSettingsTabSk._(_root);
	@override late final _StringsTroubleshootPageSk troubleshootPage = _StringsTroubleshootPageSk._(_root);
	@override late final _StringsReceiveHistoryPageSk receiveHistoryPage = _StringsReceiveHistoryPageSk._(_root);
	@override late final _StringsApkPickerPageSk apkPickerPage = _StringsApkPickerPageSk._(_root);
	@override late final _StringsSelectedFilesPageSk selectedFilesPage = _StringsSelectedFilesPageSk._(_root);
	@override late final _StringsReceivePageSk receivePage = _StringsReceivePageSk._(_root);
	@override late final _StringsReceiveOptionsPageSk receiveOptionsPage = _StringsReceiveOptionsPageSk._(_root);
	@override late final _StringsSendPageSk sendPage = _StringsSendPageSk._(_root);
	@override late final _StringsProgressPageSk progressPage = _StringsProgressPageSk._(_root);
	@override late final _StringsWebSharePageSk webSharePage = _StringsWebSharePageSk._(_root);
	@override late final _StringsAboutPageSk aboutPage = _StringsAboutPageSk._(_root);
	@override late final _StringsDonationPageSk donationPage = _StringsDonationPageSk._(_root);
	@override late final _StringsChangelogPageSk changelogPage = _StringsChangelogPageSk._(_root);
	@override late final _StringsAliasGeneratorSk aliasGenerator = _StringsAliasGeneratorSk._(_root);
	@override late final _StringsDialogsSk dialogs = _StringsDialogsSk._(_root);
	@override late final _StringsSanitizationSk sanitization = _StringsSanitizationSk._(_root);
	@override late final _StringsTraySk tray = _StringsTraySk._(_root);
	@override late final _StringsWebSk web = _StringsWebSk._(_root);
	@override late final _StringsAssetPickerSk assetPicker = _StringsAssetPickerSk._(_root);
}

// Path: general
class _StringsGeneralSk extends _StringsGeneralEn {
	_StringsGeneralSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Prijať';
	@override String get accepted => 'Prijaté';
	@override String get add => 'Pridať';
	@override String get advanced => 'Pokročilé';
	@override String get cancel => 'Zrušiť';
	@override String get close => 'Zavrieť';
	@override String get confirm => 'Potvrdiť';
	@override String get continueStr => 'Pokračovať';
	@override String get copy => 'Kopírovať';
	@override String get copiedToClipboard => 'Skopírované do schránky';
	@override String get decline => 'Odmietnuť';
	@override String get done => 'Hotovo';
	@override String get delete => 'Odstrániť';
	@override String get edit => 'Upraviť';
	@override String get error => 'Chyba';
	@override String get example => 'Príklad';
	@override String get files => 'Súbory';
	@override String get finished => 'Dokončené';
	@override String get hide => 'Skryť';
	@override String get off => 'Vypnuté';
	@override String get offline => 'Offline';
	@override String get on => 'Zapnuté';
	@override String get online => 'Online';
	@override String get open => 'Otvoriť';
	@override String get queue => 'Fronta';
	@override String get quickSave => 'Rýchle uloženie';
	@override String get quickSaveFromFavorites => 'Rýchle uloženie pre "Obľúbené"';
	@override String get renamed => 'Premenovaný';
	@override String get reset => 'Vrátiť späť zmeny';
	@override String get restart => 'Reštartovať';
	@override String get settings => 'Nastavenia';
	@override String get skipped => 'Preskočené';
	@override String get start => 'Spustiť';
	@override String get stop => 'Zastaviť';
	@override String get save => 'Uložiť';
	@override String get unchanged => 'Nezmenené';
	@override String get unknown => 'Neznáme';
	@override String get noItemInClipboard => 'Žiadne položky v schránke.';
}

// Path: receiveTab
class _StringsReceiveTabSk extends _StringsReceiveTabEn {
	_StringsReceiveTabSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prijať';
	@override late final _StringsReceiveTabInfoBoxSk infoBox = _StringsReceiveTabInfoBoxSk._(_root);
}

// Path: sendTab
class _StringsSendTabSk extends _StringsSendTabEn {
	_StringsSendTabSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odoslať';
	@override late final _StringsSendTabSelectionSk selection = _StringsSendTabSelectionSk._(_root);
	@override late final _StringsSendTabPickerSk picker = _StringsSendTabPickerSk._(_root);
	@override String get shareIntentInfo => 'Na jednoduchší výber súborov môžete použiť aj funkciu "Zdieľať" vášho mobilného zariadenia.';
	@override String get nearbyDevices => 'Zariadenia v blízkosti';
	@override String get thisDevice => 'Toto zariadenie';
	@override String get scan => 'Vyhľadať zariadenia';
	@override String get manualSending => 'Manuálne odoslanie';
	@override String get sendMode => 'Režim odosielania';
	@override late final _StringsSendTabSendModesSk sendModes = _StringsSendTabSendModesSk._(_root);
	@override String get sendModeHelp => 'Vysvetlenie';
	@override String get help => 'Uistite sa, že požadované zariadenie je tiež v rovnakej sieti Wi-Fi.';
	@override String get placeItems => 'Umiestnite položky na zdieľanie.';
}

// Path: settingsTab
class _StringsSettingsTabSk extends _StringsSettingsTabEn {
	_StringsSettingsTabSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nastavenia';
	@override late final _StringsSettingsTabGeneralSk general = _StringsSettingsTabGeneralSk._(_root);
	@override late final _StringsSettingsTabReceiveSk receive = _StringsSettingsTabReceiveSk._(_root);
	@override late final _StringsSettingsTabSendSk send = _StringsSettingsTabSendSk._(_root);
	@override late final _StringsSettingsTabNetworkSk network = _StringsSettingsTabNetworkSk._(_root);
	@override late final _StringsSettingsTabOtherSk other = _StringsSettingsTabOtherSk._(_root);
	@override String get advancedSettings => 'Pokročilé nastavenia';
}

// Path: troubleshootPage
class _StringsTroubleshootPageSk extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Riešenie problémov';
	@override String get subTitle => 'Aplikácia nefunguje podľa očakávania? Tu nájdete niektoré bežné riešenia problémov.';
	@override String get solution => 'Riešenie:';
	@override String get fixButton => 'Opraviť automaticky';
	@override late final _StringsTroubleshootPageFirewallSk firewall = _StringsTroubleshootPageFirewallSk._(_root);
	@override late final _StringsTroubleshootPageNoDiscoverySk noDiscovery = _StringsTroubleshootPageNoDiscoverySk._(_root);
	@override late final _StringsTroubleshootPageNoConnectionSk noConnection = _StringsTroubleshootPageNoConnectionSk._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageSk extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'História';
	@override String get openFolder => 'Otvoriť priečinok';
	@override String get deleteHistory => 'Odstrániť históriu';
	@override String get empty => 'História je prázdna.';
	@override late final _StringsReceiveHistoryPageEntryActionsSk entryActions = _StringsReceiveHistoryPageEntryActionsSk._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageSk extends _StringsApkPickerPageEn {
	_StringsApkPickerPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikácie (APK)';
	@override String get excludeSystemApps => 'Vylúčiť systémové aplikácie';
	@override String get excludeAppsWithoutLaunchIntent => 'Vylúčiť nespustiteľné aplikácie';
	@override String apps({required Object n}) => '${n} Aplikácie';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageSk extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Vymazať všetky';
}

// Path: receivePage
class _StringsReceivePageSk extends _StringsReceivePageEn {
	_StringsReceivePageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(n,
		one: 'vám chce poslať súbor',
		other: 'vám chce poslať ${n} súborov',
	);
	@override String get subTitleMessage => 'vám poslal správu:';
	@override String get subTitleLink => 'vám poslal odkaz:';
	@override String get canceled => 'Odosielateľ zrušil žiadosť.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageSk extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(Priečinok LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Automaticky vypnuté, pretože existujú priečinky.';
}

// Path: sendPage
class _StringsSendPageSk extends _StringsSendPageEn {
	_StringsSendPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Čaká sa na odpoveď...';
	@override String get rejected => 'Príjemca zamietol žiadosť.';
	@override String get tooManyAttempts => _root.web.tooManyAttempts;
	@override String get busy => 'Príjemca je zaneprázdnený inou žiadosťou.';
}

// Path: progressPage
class _StringsProgressPageSk extends _StringsProgressPageEn {
	_StringsProgressPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Odosielanie súborov';
	@override String get titleReceiving => 'Prijímanie súborov';
	@override String get savedToGallery => 'Uložené vo Fotkách';
	@override late final _StringsProgressPageTotalSk total = _StringsProgressPageTotalSk._(_root);
}

// Path: webSharePage
class _StringsWebSharePageSk extends _StringsWebSharePageEn {
	_StringsWebSharePageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zdieľať cez odkaz';
	@override String get loading => 'Spúšťa sa server...';
	@override String get stopping => 'Zastavuje sa server...';
	@override String get error => 'Pri spúšťaní servera sa vyskytla chyba.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(n,
		one: 'Otvorte tento odkaz vo svojom prehliadači:',
		other: 'Otvorte jeden z týchto odkazov vo svojom prehliadači:',
	);
	@override String get requests => 'Žiadosti';
	@override String get noRequests => 'Zatiaľ žiadne žiadosti.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Automaticky prijímať žiadosti';
	@override String get requirePin => 'Vyžadovať PIN';
	@override String pinHint({required Object pin}) => 'PIN je "${pin}"';
	@override String get encryptionHint => 'LocalSend používa certifikát s vlastným podpisom. Musíte ho prijať vo svojom prehliadači.';
	@override String pendingRequests({required Object n}) => 'Nespracované žiadosti: ${n}';
}

// Path: aboutPage
class _StringsAboutPageSk extends _StringsAboutPageEn {
	_StringsAboutPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'O aplikácii LocalSend';
	@override List<String> get description => [
		'LocalSend je bezplatná aplikácia s otvoreným zdrojovým kódom, ktorá vám umožňuje bezpečne zdieľať súbory a správy so zariadeniami v okolí cez vašu lokálnu sieť bez potreby pripojenia k internetu.',
		'Táto aplikácia je dostupná pre Android, iOS, macOS, Windows a Linux. Všetky možnosti stiahnutia nájdete na oficiálnej domovskej stránke.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Prispievatelia';
	@override String get packagers => 'Zostavovatelia balíkov';
	@override String get translators => 'Prekladatelia';
}

// Path: donationPage
class _StringsDonationPageSk extends _StringsDonationPageEn {
	_StringsDonationPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Darovať';
	@override String get info => 'LocalSend je bezplatný, s otvoreným kódom a bez reklám. Ak sa vám aplikácia páči, môžete jej vývoj podporiť darom.';
	@override String donate({required Object amount}) => 'Darovať ${amount}';
	@override String get thanks => 'Ďakujeme veľmi pekne!';
	@override String get restore => 'Obnoviť nákup';
}

// Path: changelogPage
class _StringsChangelogPageSk extends _StringsChangelogPageEn {
	_StringsChangelogPageSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zoznam zmien';
}

// Path: aliasGenerator
class _StringsAliasGeneratorSk extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Rozkošná',
		'Krásna',
		'Veľká',
		'Ľahká',
		'Okúzľujúca',
		'Šikovná',
		'Pohodová',
		'Roztomilá',
		'Prefíkaná',
		'Odhodlaná',
		'Energická',
		'Efektívna',
		'Fantastická',
		'Rýchla',
		'Fajná',
		'Čerstvá',
		'Dobrá',
		'Nádherná',
		'Skvelá',
		'Sympatická',
		'Horúca',
		'Milá',
		'Zvodná',
		'Mystická',
		'Čistá',
		'Úhľadná',
		'Trpezlivá',
		'Pekná',
		'Výkonná',
		'Bohatá',
		'Tajomná',
		'Inteligentná',
		'Pôvabná',
		'Špeciálna',
		'Strategická',
		'Silná',
		'Vášnivá',
		'Múdra',
	];
	@override List<String> get fruits => [
		'hruška',
		'višňa',
		'čerešňa',
		'broskyňa',
		'slivka',
		'marhuľa',
		'ringlota',
		'čučoriedka',
		'brusnica',
		'ríbezľa',
		'malina',
		'jahoda',
		'moruša',
		'mandarínka',
		'marakuja',
		'datľa',
		'dula',
		'figa',
		'limetka',
		'papája',
		'tekvica',
		'akébia',
		'brokolica',
		'cibuľa',
		'kapusta',
		'paradajka',
	];

	/// V niektorých jazykoch musí byť prídavné meno posledné.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsSk extends _StringsDialogsEn {
	_StringsDialogsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileSk addFile = _StringsDialogsAddFileSk._(_root);
	@override late final _StringsDialogsAddressInputSk addressInput = _StringsDialogsAddressInputSk._(_root);
	@override late final _StringsDialogsCancelSessionSk cancelSession = _StringsDialogsCancelSessionSk._(_root);
	@override late final _StringsDialogsCannotOpenFileSk cannotOpenFile = _StringsDialogsCannotOpenFileSk._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeSk encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeSk._(_root);
	@override late final _StringsDialogsErrorDialogSk errorDialog = _StringsDialogsErrorDialogSk._(_root);
	@override late final _StringsDialogsFavoriteDialogSk favoriteDialog = _StringsDialogsFavoriteDialogSk._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogSk favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogSk._(_root);
	@override late final _StringsDialogsFavoriteEditDialogSk favoriteEditDialog = _StringsDialogsFavoriteEditDialogSk._(_root);
	@override late final _StringsDialogsFileInfoSk fileInfo = _StringsDialogsFileInfoSk._(_root);
	@override late final _StringsDialogsFileNameInputSk fileNameInput = _StringsDialogsFileNameInputSk._(_root);
	@override late final _StringsDialogsHistoryClearDialogSk historyClearDialog = _StringsDialogsHistoryClearDialogSk._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedSk localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedSk._(_root);
	@override late final _StringsDialogsMessageInputSk messageInput = _StringsDialogsMessageInputSk._(_root);
	@override late final _StringsDialogsNoFilesSk noFiles = _StringsDialogsNoFilesSk._(_root);
	@override late final _StringsDialogsNoPermissionSk noPermission = _StringsDialogsNoPermissionSk._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformSk notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformSk._(_root);
	@override late final _StringsDialogsQrSk qr = _StringsDialogsQrSk._(_root);
	@override late final _StringsDialogsQuickActionsSk quickActions = _StringsDialogsQuickActionsSk._(_root);
	@override late final _StringsDialogsQuickSaveNoticeSk quickSaveNotice = _StringsDialogsQuickSaveNoticeSk._(_root);
	@override late final _StringsDialogsQuickSaveFromFavoritesNoticeSk quickSaveFromFavoritesNotice = _StringsDialogsQuickSaveFromFavoritesNoticeSk._(_root);
	@override late final _StringsDialogsPinSk pin = _StringsDialogsPinSk._(_root);
	@override late final _StringsDialogsSendModeHelpSk sendModeHelp = _StringsDialogsSendModeHelpSk._(_root);
	@override late final _StringsDialogsZoomSk zoom = _StringsDialogsZoomSk._(_root);
}

// Path: sanitization
class _StringsSanitizationSk extends _StringsSanitizationEn {
	_StringsSanitizationSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Názov súboru nemôže byť prázdny';
	@override String get invalid => 'Názov súboru obsahuje neplatné znaky';
}

// Path: tray
class _StringsTraySk extends _StringsTrayEn {
	_StringsTraySk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Ukončiť LocalSend';
	@override String get closeWindows => 'Ukončiť';
}

// Path: web
class _StringsWebSk extends _StringsWebEn {
	_StringsWebSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get enterPin => 'Zadajte PIN';
	@override String get invalidPin => 'Neplatný PIN kód';
	@override String get tooManyAttempts => 'Príliš veľa pokusov';
	@override String get rejected => 'Odmietnuté';
	@override String get files => 'Súbory';
	@override String get fileName => 'Názov súboru';
	@override String get size => 'Veľkosť';
}

// Path: assetPicker
class _StringsAssetPickerSk extends _StringsAssetPickerEn {
	_StringsAssetPickerSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Potvrdiť';
	@override String get cancel => 'Zrušiť';
	@override String get edit => 'Upraviť';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Načítanie zlyhalo';
	@override String get original => 'Pôvod';
	@override String get preview => 'Ukážka';
	@override String get select => 'Vybrať';
	@override String get emptyList => 'Prázdny zoznam';
	@override String get unSupportedAssetType => 'Nepodporovaný typ súboru.';
	@override String get unableToAccessAll => 'Nie je možné získať prístup ku všetkým súborom v zariadení';
	@override String get viewingLimitedAssetsTip => 'Zobraziť iba súbory a albumy, ktoré má aplikácia prístupné.';
	@override String get changeAccessibleLimitedAssets => 'Kliknutím aktualizujete prístupné súbory';
	@override String get accessAllTip => 'Aplikácia má prístup iba k niektorým súborom v zariadení. Prejdite do systémových nastavení a povoľte aplikácii prístup ku všetkým médiám v zariadení.';
	@override String get goToSystemSettings => 'Prejdite do nastavení systému';
	@override String get accessLimitedAssets => 'Pokračovať s obmedzeným prístupom';
	@override String get accessiblePathName => 'Prístupné súbory';
	@override String get sTypeAudioLabel => 'Zvuk';
	@override String get sTypeImageLabel => 'Obrázok';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Iné médiá';
	@override String get sActionPlayHint => 'prehrať';
	@override String get sActionPreviewHint => 'náhľad';
	@override String get sActionSelectHint => 'vyberať';
	@override String get sActionSwitchPathLabel => 'zmeniť cestu';
	@override String get sActionUseCameraHint => 'použiť fotoaparát';
	@override String get sNameDurationLabel => 'trvanie';
	@override String get sUnitAssetCountLabel => 'počet';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxSk extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Názov zariadenia:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionSk extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Výber';
	@override String files({required Object files}) => 'Súbory: ${files}';
	@override String size({required Object size}) => 'Veľkosť: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerSk extends _StringsSendTabPickerEn {
	_StringsSendTabPickerSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get file => 'Súbor';
	@override String get folder => 'Priečinok';
	@override String get media => 'Médiá';
	@override String get text => 'Text';
	@override String get app => 'Aplikácia';
	@override String get clipboard => 'Vložiť';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesSk extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get single => 'Jeden príjemca';
	@override String get multiple => 'Viacerí príjemcovia';
	@override String get link => 'Zdieľať cez odkaz';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralSk extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Všeobecné';
	@override String get brightness => 'Téma';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsSk brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsSk._(_root);
	@override String get color => 'Farba';
	@override late final _StringsSettingsTabGeneralColorOptionsSk colorOptions = _StringsSettingsTabGeneralColorOptionsSk._(_root);
	@override String get language => 'Jazyk';
	@override late final _StringsSettingsTabGeneralLanguageOptionsSk languageOptions = _StringsSettingsTabGeneralLanguageOptionsSk._(_root);
	@override String get saveWindowPlacement => 'Uložiť polohu okna po ukončení';
	@override String get saveWindowPlacementWindows => 'Uložiť polohu okna po ukončení';
	@override String get minimizeToTray => 'Minimalizovať na systémový panel/panel ponuky pri zatvorení';
	@override String get launchAtStartup => 'Autoštart po prihlásení';
	@override String get launchMinimized => 'Autoštart: Spustiť skryté';
	@override String get showInContextMenu => 'Zobraziť LocalSend v kontextovej ponuke';
	@override String get animations => 'Animácie';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveSk extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prijať';
	@override String get quickSave => _root.general.quickSave;
	@override String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
	@override String get requirePin => _root.webSharePage.requirePin;
	@override String get autoFinish => 'Automatické dokončenie';
	@override String get destination => 'Uložiť do priečinka';
	@override String get downloads => '(Stiahnuté)';
	@override String get saveToGallery => 'Uložiť médiá do galérie';
	@override String get saveToHistory => 'Uložiť do histórie';
}

// Path: settingsTab.send
class _StringsSettingsTabSendSk extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odoslať';
	@override String get shareViaLinkAutoAccept => 'Automaticky prijímať žiadosti v režime "Zdieľať cez odkaz".';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkSk extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sieť';
	@override String get needRestart => 'Ak chcete použiť nastavenia, reštartujte server!';
	@override String get server => 'Server';
	@override String get alias => 'Názov zariadenia';
	@override String get deviceType => 'Typ zariadenia';
	@override String get deviceModel => 'Model zariadenia';
	@override String get port => 'Port';
	@override String get discoveryTimeout => 'Časový limit objavovania';
	@override String portWarning({required Object defaultPort}) => 'Iné zariadenia vás nemusia rozpoznať, pretože používate vlastný port. (predvolené: ${defaultPort})';
	@override String get encryption => 'Šifrovanie';
	@override String get multicastGroup => 'Multicast adresa';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Iné zariadenia vás nemusia rozpoznať, pretože používate vlastnú multicast adresu. (predvolené: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherSk extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Iné';
	@override String get support => 'Podporte LocalSend';
	@override String get donate => 'Darovať';
	@override String get privacyPolicy => 'Zásady ochrany osobných údajov';
	@override String get termsOfUse => 'Podmienky používania';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallSk extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Toto zariadenie môže odosielať súbory do iných zariadení, ale iné zariadenia nemôžu odosielať súbory do tohto zariadenia.';
	@override String solution({required Object port}) => 'S najväčšou pravdepodobnosťou ide o problém brány firewall. Môžete to vyriešiť povolením prichádzajúcich spojení (UDP a TCP) na porte ${port}.';
	@override String get openFirewall => 'Otvoriť firewall';
}

// Path: troubleshootPage.noDiscovery
class _StringsTroubleshootPageNoDiscoverySk extends _StringsTroubleshootPageNoDiscoveryEn {
	_StringsTroubleshootPageNoDiscoverySk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Toto zariadenie nemôže objaviť iné zariadenia.';
	@override String get solution => 'Uistite sa, že všetky zariadenia sú v rovnakej sieti Wi-Fi a zdieľajú rovnakú konfiguráciu (port, multicast adresa, šifrovanie). Môžete sa pokúsiť zadať IP adresu cieľového zariadenia ručne. Ak to funguje, zvážte pridanie tohto zariadenia do obľúbených položiek, aby mohlo byť v budúcnosti automaticky objavené.';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionSk extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Obe zariadenia sa nedokážu navzájom objaviť ani nemôžu zdieľať súbory.';
	@override String get solution => 'Existuje problém na oboch stranách? Ak áno, musíte sa uistiť, že obe zariadenia sú v rovnakej sieti Wi-Fi a majú rovnakú konfiguráciu (port, multicastovú adresu, šifrovanie). Sieť Wi-Fi nemusí umožňovať komunikáciu medzi účastníkmi (izolácia prístupového bodu). V takom prípade musí byť táto možnosť povolená na smerovači.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsSk extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get open => 'Otvoriť súbor';
	@override String get showInFolder => 'Zobraziť v priečinku';
	@override String get info => 'Informácie';
	@override String get deleteFromHistory => 'Vymazať z histórie';
}

// Path: progressPage.total
class _StringsProgressPageTotalSk extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleSk title = _StringsProgressPageTotalTitleSk._(_root);
	@override String count({required Object curr, required Object n}) => 'Súbory: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Veľkosť: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Rýchlosť: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileSk extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pridať do výberu';
	@override String get content => 'Čo chcete pridať?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputSk extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zadajte adresu';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP adresa';
	@override String get recentlyUsed => 'Nedávno použité: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionSk extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zrušiť prenos súborov';
	@override String get content => 'Naozaj chcete zrušiť prenos súborov?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileSk extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nie je možné otvoriť súbor';
	@override String content({required Object file}) => 'Nepodarilo sa otvoriť súbor "${file}". Bol tento súbor presunutý, premenovaný alebo odstránený?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeSk extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Šifrovanie je vypnuté';
	@override String get content => 'Komunikácia teraz prebieha cez nešifrovaný protokol HTTP. Ak chcete použiť protokol HTTPS, opäť povoľte šifrovanie.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogSk extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogSk extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Obľúbené';
	@override String get noFavorites => 'Zatiaľ žiadne obľúbené zariadenia.';
	@override String get addFavorite => 'Pridať';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogSk extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odstrániť z obľúbených';
	@override String content({required Object name}) => 'Naozaj chcete odstrániť "${name}" z obľúbených?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogSk extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Pridať k obľúbeným';
	@override String get titleEdit => 'Nastavenia';
	@override String get name => 'Názov zariadenia';
	@override String get auto => '(automaticky)';
	@override String get ip => 'IP adresa';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoSk extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informácie o súbore';
	@override String get fileName => 'Názov súboru:';
	@override String get path => 'Cesta:';
	@override String get size => 'Veľkosť:';
	@override String get sender => 'Odosielateľ:';
	@override String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputSk extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zadajte názov súboru';
	@override String original({required Object original}) => 'Originál: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogSk extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vymazať históriu';
	@override String get content => 'Naozaj chcete vymazať celú históriu?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedSk extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend nemôže nájsť iné zariadenia bez povolenia na prehľadanie lokálnej siete. Povoľte prosím toto povolenie v nastaveniach.';
	@override String get gotoSettings => 'Nastavenia';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputSk extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Napíšte správu';
	@override String get multiline => 'Viacriadková';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesSk extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nie sú vybraté žiadne súbory';
	@override String get content => 'Vyberte prosím aspoň jeden súbor.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionSk extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Žiadne povolenie';
	@override String get content => 'Neudelili ste potrebné povolenia. Udeľte ich prosím v nastaveniach.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformSk extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nie je k dispozícii';
	@override String get content => 'Táto funkcia je dostupná iba na:';
}

// Path: dialogs.qr
class _StringsDialogsQrSk extends _StringsDialogsQrEn {
	_StringsDialogsQrSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR kód';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsSk extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rýchle akcie';
	@override String get counter => 'Počítadlo';
	@override String get prefix => 'Predpona';
	@override String get padZero => 'Vyplniť s nulami';
	@override String get sortBeforeCount => 'Vopred zoradiť podľa abecedy (A-Z)';
	@override String get random => 'Náhodne';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeSk extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Žiadosti o súbor sú automaticky akceptované. Uvedomte si, že každý v miestnej sieti vám môže posielať súbory.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _StringsDialogsQuickSaveFromFavoritesNoticeSk extends _StringsDialogsQuickSaveFromFavoritesNoticeEn {
	_StringsDialogsQuickSaveFromFavoritesNoticeSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSaveFromFavorites;
	@override String get content => 'Žiadosti o súbor sa automaticky prijímajú zo zariadení vo vašom zozname kontaktov.';
}

// Path: dialogs.pin
class _StringsDialogsPinSk extends _StringsDialogsPinEn {
	_StringsDialogsPinSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zadajte PIN';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpSk extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Režimy odosielania';
	@override String get single => 'Odošle súbory jednému príjemcovi. Výber sa vymaže po dokončení prenosu súborov.';
	@override String get multiple => 'Posiela súbory viacerým príjemcom. Výber sa vymaže po dokončení prenosu súborov.';
	@override String get link => 'Príjemcovia, ktorí nemajú nainštalovaný LocalSend, si môžu stiahnuť vybrané súbory otvorením odkazu vo svojom prehliadači.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomSk extends _StringsDialogsZoomEn {
	_StringsDialogsZoomSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsSk extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémová';
	@override String get dark => 'Tmavá';
	@override String get light => 'Svetlá';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsSk extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémová';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsSk extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémový';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleSk extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleSk._(_StringsSk root) : this._root = root, super._(root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Celkový priebeh (${time})';
	@override String get finishedError => 'Dokončené s chybou';
	@override String get canceledSender => 'Zrušené odosielateľom';
	@override String get canceledReceiver => 'Zrušené príjemcom';
}
