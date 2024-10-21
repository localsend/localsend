///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsSlSi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSlSi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.slSi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sl-SI>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsSlSi _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Slovenščina';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralSlSi general = _StringsGeneralSlSi._(_root);
	@override late final _StringsReceiveTabSlSi receiveTab = _StringsReceiveTabSlSi._(_root);
	@override late final _StringsSendTabSlSi sendTab = _StringsSendTabSlSi._(_root);
	@override late final _StringsSettingsTabSlSi settingsTab = _StringsSettingsTabSlSi._(_root);
	@override late final _StringsTroubleshootPageSlSi troubleshootPage = _StringsTroubleshootPageSlSi._(_root);
	@override late final _StringsReceiveHistoryPageSlSi receiveHistoryPage = _StringsReceiveHistoryPageSlSi._(_root);
	@override late final _StringsApkPickerPageSlSi apkPickerPage = _StringsApkPickerPageSlSi._(_root);
	@override late final _StringsSelectedFilesPageSlSi selectedFilesPage = _StringsSelectedFilesPageSlSi._(_root);
	@override late final _StringsReceivePageSlSi receivePage = _StringsReceivePageSlSi._(_root);
	@override late final _StringsReceiveOptionsPageSlSi receiveOptionsPage = _StringsReceiveOptionsPageSlSi._(_root);
	@override late final _StringsSendPageSlSi sendPage = _StringsSendPageSlSi._(_root);
	@override late final _StringsProgressPageSlSi progressPage = _StringsProgressPageSlSi._(_root);
	@override late final _StringsWebSharePageSlSi webSharePage = _StringsWebSharePageSlSi._(_root);
	@override late final _StringsAboutPageSlSi aboutPage = _StringsAboutPageSlSi._(_root);
	@override late final _StringsDonationPageSlSi donationPage = _StringsDonationPageSlSi._(_root);
	@override late final _StringsChangelogPageSlSi changelogPage = _StringsChangelogPageSlSi._(_root);
	@override late final _StringsAliasGeneratorSlSi aliasGenerator = _StringsAliasGeneratorSlSi._(_root);
	@override late final _StringsDialogsSlSi dialogs = _StringsDialogsSlSi._(_root);
	@override late final _StringsSanitizationSlSi sanitization = _StringsSanitizationSlSi._(_root);
	@override late final _StringsTraySlSi tray = _StringsTraySlSi._(_root);
	@override late final _StringsWebSlSi web = _StringsWebSlSi._(_root);
	@override late final _StringsAssetPickerSlSi assetPicker = _StringsAssetPickerSlSi._(_root);
}

// Path: general
class _StringsGeneralSlSi extends _StringsGeneralEn {
	_StringsGeneralSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Sprejmi';
	@override String get accepted => 'Sprejeto';
	@override String get add => 'Dodaj';
	@override String get advanced => 'Napredno';
	@override String get cancel => 'Prekliči';
	@override String get close => 'Zapri';
	@override String get confirm => 'Potrdi';
	@override String get continueStr => 'Nadaljuj';
	@override String get copy => 'Kopiraj';
	@override String get copiedToClipboard => 'Kopirano v odložišče';
	@override String get decline => 'Zavrni';
	@override String get done => 'Končano';
	@override String get delete => 'Izbriši';
	@override String get edit => 'Uredi';
	@override String get error => 'Napaka';
	@override String get example => 'Primer';
	@override String get files => 'Datoteke';
	@override String get finished => 'Končano';
	@override String get hide => 'Skrij';
	@override String get off => 'Izklopljeno';
	@override String get offline => 'Brez povezave';
	@override String get on => 'Vklopljeno';
	@override String get online => 'Na spletu';
	@override String get open => 'Odpri';
	@override String get queue => 'Čakalna vrsta';
	@override String get quickSave => 'Hitro shranjevanje';
	@override String get quickSaveFromFavorites => 'Hitro shranjevanje za »Priljubljene«';
	@override String get renamed => 'Preimenovano';
	@override String get reset => 'Razveljavi spremembe';
	@override String get restart => 'Ponovni zagon';
	@override String get settings => 'Nastavitve';
	@override String get skipped => 'Preskočeno';
	@override String get start => 'Začni';
	@override String get stop => 'Ustavi';
	@override String get save => 'Shrani';
	@override String get unchanged => 'Nespremenjeno';
	@override String get unknown => 'Neznano';
	@override String get noItemInClipboard => 'V odložišču ni elementov.';
}

// Path: receiveTab
class _StringsReceiveTabSlSi extends _StringsReceiveTabEn {
	_StringsReceiveTabSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prejem';
	@override late final _StringsReceiveTabInfoBoxSlSi infoBox = _StringsReceiveTabInfoBoxSlSi._(_root);
}

// Path: sendTab
class _StringsSendTabSlSi extends _StringsSendTabEn {
	_StringsSendTabSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pošlji';
	@override late final _StringsSendTabSelectionSlSi selection = _StringsSendTabSelectionSlSi._(_root);
	@override late final _StringsSendTabPickerSlSi picker = _StringsSendTabPickerSlSi._(_root);
	@override String get shareIntentInfo => 'Lahko uporabite funkcijo »Deli« na vaši mobilni napravi za lažjo izbiro datotek.';
	@override String get nearbyDevices => 'Naprave v bližini';
	@override String get thisDevice => 'Ta naprava';
	@override String get scan => 'Išči naprave';
	@override String get manualSending => 'Ročno pošiljanje';
	@override String get sendMode => 'Način pošiljanja';
	@override late final _StringsSendTabSendModesSlSi sendModes = _StringsSendTabSendModesSlSi._(_root);
	@override String get sendModeHelp => 'Pojasnilo';
	@override String get help => 'Preverite, da je ciljna naprava povezana v isto Wi-Fi omrežje.';
	@override String get placeItems => 'Postavite elemente za deljenje.';
}

// Path: settingsTab
class _StringsSettingsTabSlSi extends _StringsSettingsTabEn {
	_StringsSettingsTabSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nastavitve';
	@override late final _StringsSettingsTabGeneralSlSi general = _StringsSettingsTabGeneralSlSi._(_root);
	@override late final _StringsSettingsTabReceiveSlSi receive = _StringsSettingsTabReceiveSlSi._(_root);
	@override late final _StringsSettingsTabSendSlSi send = _StringsSettingsTabSendSlSi._(_root);
	@override late final _StringsSettingsTabNetworkSlSi network = _StringsSettingsTabNetworkSlSi._(_root);
	@override late final _StringsSettingsTabOtherSlSi other = _StringsSettingsTabOtherSlSi._(_root);
	@override String get advancedSettings => 'Napredne nastavitve';
}

// Path: troubleshootPage
class _StringsTroubleshootPageSlSi extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odpravljanje težav';
	@override String get subTitle => 'Aplikacija ne deluje pravilno? Tukaj najdete rešitve za pogoste težave.';
	@override String get solution => 'Rešitev:';
	@override String get fixButton => 'Samodejno odpravi';
	@override late final _StringsTroubleshootPageFirewallSlSi firewall = _StringsTroubleshootPageFirewallSlSi._(_root);
	@override late final _StringsTroubleshootPageNoDiscoverySlSi noDiscovery = _StringsTroubleshootPageNoDiscoverySlSi._(_root);
	@override late final _StringsTroubleshootPageNoConnectionSlSi noConnection = _StringsTroubleshootPageNoConnectionSlSi._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageSlSi extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zgodovina';
	@override String get openFolder => 'Odpri mapo';
	@override String get deleteHistory => 'Izbriši zgodovino';
	@override String get empty => 'Zgodovina je prazna.';
	@override late final _StringsReceiveHistoryPageEntryActionsSlSi entryActions = _StringsReceiveHistoryPageEntryActionsSlSi._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageSlSi extends _StringsApkPickerPageEn {
	_StringsApkPickerPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikacije (APK)';
	@override String get excludeSystemApps => 'Izključi sistemske aplikacije';
	@override String get excludeAppsWithoutLaunchIntent => 'Izključi aplikacije, ki jih ni mogoče zagnati';
	@override String apps({required Object n}) => '${n} aplikacij';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageSlSi extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Izbriši vse';
}

// Path: receivePage
class _StringsReceivePageSlSi extends _StringsReceivePageEn {
	_StringsReceivePageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sl'))(n,
		one: 'želi poslati datoteko',
		other: 'želi poslati ${n} datotek',
	);
	@override String get subTitleMessage => 'vam je poslal sporočilo:';
	@override String get subTitleLink => 'vam je poslal povezavo:';
	@override String get canceled => 'Pošiljatelj je preklical zahtevo.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageSlSi extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(mapa LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Samodejno izklopljeno, ker obstajajo mape.';
}

// Path: sendPage
class _StringsSendPageSlSi extends _StringsSendPageEn {
	_StringsSendPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Čakanje na odgovor...';
	@override String get rejected => 'Prejemnik je zavrnil zahtevo.';
	@override String get tooManyAttempts => _root.web.tooManyAttempts;
	@override String get busy => 'Prejemnik je zaseden z drugo zahtevo.';
}

// Path: progressPage
class _StringsProgressPageSlSi extends _StringsProgressPageEn {
	_StringsProgressPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Pošiljanje datotek';
	@override String get titleReceiving => 'Prejemanje datotek';
	@override String get savedToGallery => 'Shranjeno v Fotografije';
	@override late final _StringsProgressPageTotalSlSi total = _StringsProgressPageTotalSlSi._(_root);
}

// Path: webSharePage
class _StringsWebSharePageSlSi extends _StringsWebSharePageEn {
	_StringsWebSharePageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deli prek povezave';
	@override String get loading => 'Zagon strežnika...';
	@override String get stopping => 'Ustavitev strežnika...';
	@override String get error => 'Prišlo je do napake pri zagonu strežnika.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sl'))(n,
		one: 'Odprite to povezavo v svojem brskalniku:',
		other: 'Odprite eno od teh povezav v svojem brskalniku:',
	);
	@override String get requests => 'Zahteve';
	@override String get noRequests => 'Zaenkrat ni nobenih zahtev.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Samodejno sprejemaj zahteve';
	@override String get requirePin => 'Zahtevaj PIN';
	@override String pinHint({required Object pin}) => 'PIN je "${pin}"';
	@override String get encryptionHint => 'LocalSend uporablja samopodpisano potrdilo. Sprejeti ga morate v svojem brskalniku.';
	@override String pendingRequests({required Object n}) => 'Čakajoče zahteve: ${n}';
}

// Path: aboutPage
class _StringsAboutPageSlSi extends _StringsAboutPageEn {
	_StringsAboutPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'O LocalSend';
	@override List<String> get description => [
		'LocalSend je brezplačna, odprtokodna aplikacija, ki vam omogoča varno deljenje datotek in sporočil z napravami v bližini prek lokalnega omrežja brez potrebe po internetni povezavi.',
		'Aplikacija je na voljo za Android, iOS, macOS, Windows in Linux. Vse možnosti prenosa lahko najdete na uradni spletni strani.',
	];
	@override String get author => 'Avtor';
	@override String get contributors => 'Sodelavci';
	@override String get packagers => 'Paketniki';
	@override String get translators => 'Prevajalci';
}

// Path: donationPage
class _StringsDonationPageSlSi extends _StringsDonationPageEn {
	_StringsDonationPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doniraj';
	@override String get info => 'LocalSend je brezplačna, odprtokodna in brez oglasov. Če vam je aplikacija všeč, lahko podprete razvoj z donacijo.';
	@override String donate({required Object amount}) => 'Doniraj ${amount}';
	@override String get thanks => 'Najlepša hvala!';
	@override String get restore => 'Obnovi nakup';
}

// Path: changelogPage
class _StringsChangelogPageSlSi extends _StringsChangelogPageEn {
	_StringsChangelogPageSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dnevnik sprememb';
}

// Path: aliasGenerator
class _StringsAliasGeneratorSlSi extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Ljubek',
		'Lep',
		'Velik',
		'Svetel',
		'Čist',
		'Pameten',
		'Kul',
		'Prisrčen',
		'Prebrisan',
		'Odločen',
		'Energijski',
		'Učinkovit',
		'Fantastičen',
		'Hiter',
		'Fin',
		'Svež',
		'Dober',
		'Čudovit',
		'Odličen',
		'Postaven',
		'Vroč',
		'Prijazen',
		'Ljubek',
		'Mističen',
		'Urejen',
		'Lep',
		'Potrpežljiv',
		'Prikupen',
		'Mogočen',
		'Bogat',
		'Skrivnosten',
		'Pameten',
		'Trden',
		'Poseben',
		'Strateški',
		'Močan',
		'Pospravljeno',
		'Moder',
	];
	@override List<String> get fruits => [
		'Jabolko',
		'Avokado',
		'Banana',
		'Robida',
		'Borovnica',
		'Brokoli',
		'Korenček',
		'Češnja',
		'Kokos',
		'Grozdje',
		'Limona',
		'Solata',
		'Mango',
		'Melona',
		'Goba',
		'Čebula',
		'Pomaranča',
		'Papaja',
		'Breskev',
		'Hruška',
		'Ananas',
		'Krompir',
		'Buča',
		'Malina',
		'Jagoda',
		'Paradižnik',
	];

	/// V nekaterih jezikih mora biti pridevnik na koncu.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsSlSi extends _StringsDialogsEn {
	_StringsDialogsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileSlSi addFile = _StringsDialogsAddFileSlSi._(_root);
	@override late final _StringsDialogsAddressInputSlSi addressInput = _StringsDialogsAddressInputSlSi._(_root);
	@override late final _StringsDialogsCancelSessionSlSi cancelSession = _StringsDialogsCancelSessionSlSi._(_root);
	@override late final _StringsDialogsCannotOpenFileSlSi cannotOpenFile = _StringsDialogsCannotOpenFileSlSi._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeSlSi encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeSlSi._(_root);
	@override late final _StringsDialogsErrorDialogSlSi errorDialog = _StringsDialogsErrorDialogSlSi._(_root);
	@override late final _StringsDialogsFavoriteDialogSlSi favoriteDialog = _StringsDialogsFavoriteDialogSlSi._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogSlSi favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogSlSi._(_root);
	@override late final _StringsDialogsFavoriteEditDialogSlSi favoriteEditDialog = _StringsDialogsFavoriteEditDialogSlSi._(_root);
	@override late final _StringsDialogsFileInfoSlSi fileInfo = _StringsDialogsFileInfoSlSi._(_root);
	@override late final _StringsDialogsFileNameInputSlSi fileNameInput = _StringsDialogsFileNameInputSlSi._(_root);
	@override late final _StringsDialogsHistoryClearDialogSlSi historyClearDialog = _StringsDialogsHistoryClearDialogSlSi._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedSlSi localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedSlSi._(_root);
	@override late final _StringsDialogsMessageInputSlSi messageInput = _StringsDialogsMessageInputSlSi._(_root);
	@override late final _StringsDialogsNoFilesSlSi noFiles = _StringsDialogsNoFilesSlSi._(_root);
	@override late final _StringsDialogsNoPermissionSlSi noPermission = _StringsDialogsNoPermissionSlSi._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformSlSi notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformSlSi._(_root);
	@override late final _StringsDialogsQrSlSi qr = _StringsDialogsQrSlSi._(_root);
	@override late final _StringsDialogsQuickActionsSlSi quickActions = _StringsDialogsQuickActionsSlSi._(_root);
	@override late final _StringsDialogsQuickSaveNoticeSlSi quickSaveNotice = _StringsDialogsQuickSaveNoticeSlSi._(_root);
	@override late final _StringsDialogsQuickSaveFromFavoritesNoticeSlSi quickSaveFromFavoritesNotice = _StringsDialogsQuickSaveFromFavoritesNoticeSlSi._(_root);
	@override late final _StringsDialogsPinSlSi pin = _StringsDialogsPinSlSi._(_root);
	@override late final _StringsDialogsSendModeHelpSlSi sendModeHelp = _StringsDialogsSendModeHelpSlSi._(_root);
	@override late final _StringsDialogsZoomSlSi zoom = _StringsDialogsZoomSlSi._(_root);
}

// Path: sanitization
class _StringsSanitizationSlSi extends _StringsSanitizationEn {
	_StringsSanitizationSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ime datoteke ne sme biti prazno';
	@override String get invalid => 'Ime datoteke vsebuje neveljavne znake';
}

// Path: tray
class _StringsTraySlSi extends _StringsTrayEn {
	_StringsTraySlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Zapri LocalSend';
	@override String get closeWindows => 'Izhod';
}

// Path: web
class _StringsWebSlSi extends _StringsWebEn {
	_StringsWebSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get enterPin => 'Vnesite PIN';
	@override String get invalidPin => 'Neveljaven PIN';
	@override String get tooManyAttempts => 'Preveč poskusov';
	@override String get rejected => 'Zavrnjeno';
	@override String get files => 'Datoteke';
	@override String get fileName => 'Ime datoteke';
	@override String get size => 'Velikost';
}

// Path: assetPicker
class _StringsAssetPickerSlSi extends _StringsAssetPickerEn {
	_StringsAssetPickerSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Potrdi';
	@override String get cancel => 'Prekliči';
	@override String get edit => 'Uredi';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Nalaganje ni uspelo';
	@override String get original => 'Izvirnik';
	@override String get preview => 'Predogled';
	@override String get select => 'Izberi';
	@override String get emptyList => 'Prazno';
	@override String get unSupportedAssetType => 'Nepodprt tip datoteke.';
	@override String get unableToAccessAll => 'Ni mogoče dostopati do vseh datotek na napravi';
	@override String get viewingLimitedAssetsTip => 'Prikaži samo datoteke in albume, do katerih ima aplikacija dostop.';
	@override String get changeAccessibleLimitedAssets => 'Kliknite za posodobitev dostopnih datotek';
	@override String get accessAllTip => 'Aplikacija lahko dostopa le do nekaterih datotek na napravi. Pojdite v sistemske nastavitve in omogočite dostop do vseh medijev na napravi.';
	@override String get goToSystemSettings => 'Pojdi v sistemske nastavitve';
	@override String get accessLimitedAssets => 'Nadaljuj z omejenim dostopom';
	@override String get accessiblePathName => 'Dostopne datoteke';
	@override String get sTypeAudioLabel => 'Zvok';
	@override String get sTypeImageLabel => 'Slika';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Ostalo';
	@override String get sActionPlayHint => 'predvajaj';
	@override String get sActionPreviewHint => 'predogled';
	@override String get sActionSelectHint => 'izberi';
	@override String get sActionSwitchPathLabel => 'spremeni pot';
	@override String get sActionUseCameraHint => 'uporabi kamero';
	@override String get sNameDurationLabel => 'trajanje';
	@override String get sUnitAssetCountLabel => 'številka';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxSlSi extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Vrata:';
	@override String get alias => 'Ime naprave:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionSlSi extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Izbira';
	@override String files({required Object files}) => 'Datoteke: ${files}';
	@override String size({required Object size}) => 'Velikost: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerSlSi extends _StringsSendTabPickerEn {
	_StringsSendTabPickerSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get file => 'Datoteka';
	@override String get folder => 'Mapa';
	@override String get media => 'Mediji';
	@override String get text => 'Besedilo';
	@override String get app => 'Aplikacija';
	@override String get clipboard => 'Prilepi';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesSlSi extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get single => 'En prejemnik';
	@override String get multiple => 'Več prejemnikov';
	@override String get link => 'Deli prek povezave';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralSlSi extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Splošno';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsSlSi brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsSlSi._(_root);
	@override String get color => 'Barva';
	@override late final _StringsSettingsTabGeneralColorOptionsSlSi colorOptions = _StringsSettingsTabGeneralColorOptionsSlSi._(_root);
	@override String get language => 'Jezik';
	@override late final _StringsSettingsTabGeneralLanguageOptionsSlSi languageOptions = _StringsSettingsTabGeneralLanguageOptionsSlSi._(_root);
	@override String get saveWindowPlacement => 'Shrani položaj okna ob izhodu';
	@override String get saveWindowPlacementWindows => 'Shrani položaj okna ob zaprtju';
	@override String get minimizeToTray => 'Ob zaprtju minimiziraj v sistemski pladenj / meni';
	@override String get launchAtStartup => 'Samodejni zagon po prijavi';
	@override String get launchMinimized => 'Samodejni zagon: Začni skrito';
	@override String get showInContextMenu => 'Prikaži LocalSend v kontekstnem meniju';
	@override String get animations => 'Animacije';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveSlSi extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prejem';
	@override String get quickSave => _root.general.quickSave;
	@override String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
	@override String get requirePin => _root.webSharePage.requirePin;
	@override String get autoFinish => 'Samodejno dokončaj';
	@override String get destination => 'Shrani v mapo';
	@override String get downloads => '(Prenosi)';
	@override String get saveToGallery => 'Shrani medije v galerijo';
	@override String get saveToHistory => 'Shrani v zgodovino';
}

// Path: settingsTab.send
class _StringsSettingsTabSendSlSi extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pošlji';
	@override String get shareViaLinkAutoAccept => 'Samodejno sprejmi zahteve v načinu »Deli prek povezave«';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkSlSi extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Omrežje';
	@override String get needRestart => 'Ponovno zaženite strežnik, da uveljavite nastavitve!';
	@override String get server => 'Strežnik';
	@override String get alias => 'Ime naprave';
	@override String get deviceType => 'Tip naprave';
	@override String get deviceModel => 'Model naprave';
	@override String get port => 'Vrata';
	@override String get discoveryTimeout => 'Časovna omejitev za odkrivanje';
	@override String get useSystemName => 'Uporabi sistemsko ime';
	@override String get generateRandomAlias => 'Ustvari naključni vzdevek';
	@override String portWarning({required Object defaultPort}) => 'Morda vas druge naprave ne bodo zaznale, ker uporabljate nestandardna vrata. (privzeto: ${defaultPort})';
	@override String get encryption => 'Šifriranje';
	@override String get multicastGroup => 'Večtočkovni naslov';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Morda vas druge naprave ne bodo zaznale, ker uporabljate nestandardni večtočkovni naslov. (privzeto: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherSlSi extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Drugo';
	@override String get support => 'Podprite LocalSend';
	@override String get donate => 'Donirajte';
	@override String get privacyPolicy => 'Politika zasebnosti';
	@override String get termsOfUse => 'Pogoji uporabe';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallSlSi extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ta naprava lahko pošilja datoteke, ne more pa jih prejemati.';
	@override String solution({required Object port}) => 'Verjetno gre za težavo z požarnim zidom. Dovoli dohodne povezave (UDP in TCP) na vrata ${port}.';
	@override String get openFirewall => 'Odpri požarni zid';
}

// Path: troubleshootPage.noDiscovery
class _StringsTroubleshootPageNoDiscoverySlSi extends _StringsTroubleshootPageNoDiscoveryEn {
	_StringsTroubleshootPageNoDiscoverySlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ta naprava ne more najti drugih naprav.';
	@override String get solution => 'Preverite, da so vse naprave v istem Wi-Fi omrežju in imajo enako konfiguracijo (vrata, večtočkovni naslov, šifriranje). Poskusite ročno vnesti IP naslov ciljne naprave. Če to deluje, jo dodajte med priljubljene za prihodnje odkrivanje.';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionSlSi extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Naprave se ne najdejo in ne morejo deliti datotek.';
	@override String get solution => 'Preverite, da so obe napravi v istem Wi-Fi omrežju in imajo enake nastavitve (vrata, večtočkovni naslov, šifriranje). Morda omrežje preprečuje komunikacijo med udeleženci (izolacija AP).';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsSlSi extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get open => 'Odpri datoteko';
	@override String get showInFolder => 'Prikaži v mapi';
	@override String get info => 'Informacije';
	@override String get deleteFromHistory => 'Izbriši iz zgodovine';
}

// Path: progressPage.total
class _StringsProgressPageTotalSlSi extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleSlSi title = _StringsProgressPageTotalTitleSlSi._(_root);
	@override String count({required Object curr, required Object n}) => 'Datoteke: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Velikost: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Hitrost: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileSlSi extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dodaj k izbiri';
	@override String get content => 'Kaj želite dodati?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputSlSi extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vnesite naslov';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP naslov';
	@override String get recentlyUsed => 'Nedavno uporabljeno: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionSlSi extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prekliči prenos datotek';
	@override String get content => 'Ali res želite preklicati prenos datotek?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileSlSi extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ne morem odpreti datoteke';
	@override String content({required Object file}) => 'Ni mogoče odpreti "${file}". Ali je bila ta datoteka premaknjena, preimenovana ali izbrisana?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeSlSi extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Šifriranje onemogočeno';
	@override String get content => 'Komunikacija zdaj poteka prek nezaščitenega HTTP protokola. Če želite uporabljati HTTPS, znova omogočite šifriranje.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogSlSi extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogSlSi extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Priljubljene naprave';
	@override String get noFavorites => 'Ni še priljubljenih naprav.';
	@override String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogSlSi extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Izbriši iz priljubljenih';
	@override String content({required Object name}) => 'Ali res želite izbrisati napravo "${name}" iz priljubljenih?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogSlSi extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Dodaj v priljubljene';
	@override String get titleEdit => 'Nastavitve';
	@override String get name => 'Ime naprave';
	@override String get auto => '(samodejno)';
	@override String get ip => 'IP naslov';
	@override String get port => 'Vrata';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoSlSi extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informacije o datoteki';
	@override String get fileName => 'Ime datoteke:';
	@override String get path => 'Pot:';
	@override String get size => 'Velikost:';
	@override String get sender => 'Pošiljatelj:';
	@override String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputSlSi extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vnesite ime datoteke';
	@override String original({required Object original}) => 'Izvirno: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogSlSi extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Počisti zgodovino';
	@override String get content => 'Ali res želite izbrisati celotno zgodovino?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedSlSi extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend ne more najti drugih naprav brez dovoljenja za iskanje v lokalnem omrežju. Prosim, omogočite to dovoljenje v nastavitvah.';
	@override String get gotoSettings => 'Nastavitve';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputSlSi extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vnesite sporočilo';
	@override String get multiline => 'Več vrstic';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesSlSi extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ni izbranih datotek';
	@override String get content => 'Prosim, izberite vsaj eno datoteko.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionSlSi extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ni dovoljenja';
	@override String get content => 'Niste podelili zahtevanih dovoljenj. Prosim, omogočite jih v nastavitvah.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformSlSi extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ni na voljo';
	@override String get content => 'Ta funkcija je na voljo samo na:';
}

// Path: dialogs.qr
class _StringsDialogsQrSlSi extends _StringsDialogsQrEn {
	_StringsDialogsQrSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR koda';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsSlSi extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hitre akcije';
	@override String get counter => 'Števec';
	@override String get prefix => 'Predpona';
	@override String get padZero => 'Dodaj ničle';
	@override String get sortBeforeCount => 'Predhodno uredi po abecedi (A-Ž)';
	@override String get random => 'Naključno';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeSlSi extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Zahteve za datoteke so zdaj samodejno sprejete. Bodite pozorni, da vam lahko vsi v lokalnem omrežju pošiljajo datoteke.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _StringsDialogsQuickSaveFromFavoritesNoticeSlSi extends _StringsDialogsQuickSaveFromFavoritesNoticeEn {
	_StringsDialogsQuickSaveFromFavoritesNoticeSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSaveFromFavorites;
	@override String get content => 'Zahteve za datoteke so zdaj samodejno sprejete od naprav na seznamu priljubljenih.';
}

// Path: dialogs.pin
class _StringsDialogsPinSlSi extends _StringsDialogsPinEn {
	_StringsDialogsPinSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vnesite PIN';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpSlSi extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Načini pošiljanja';
	@override String get single => 'Pošlje datoteke enemu prejemniku. Izbira bo po končanem prenosu izbrisana.';
	@override String get multiple => 'Pošlje datoteke več prejemnikom. Izbira po končanem prenosu ne bo izbrisana.';
	@override String get link => 'Prejemniki, ki nimajo nameščenega LocalSend, lahko prenesejo izbrane datoteke z odpiranjem povezave v brskalniku.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomSlSi extends _StringsDialogsZoomEn {
	_StringsDialogsZoomSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsSlSi extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Temna';
	@override String get light => 'Svetla';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsSlSi extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsSlSi extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleSlSi extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleSlSi._(_StringsSlSi root) : this._root = root, super._(root);

	@override final _StringsSlSi _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Skupni napredek (${time})';
	@override String get finishedError => 'Zaključeno z napako';
	@override String get canceledSender => 'Preklical pošiljatelj';
	@override String get canceledReceiver => 'Preklical prejemnik';
}
