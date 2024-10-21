///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsFi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsFi _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Finnish';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralFi general = _StringsGeneralFi._(_root);
	@override late final _StringsReceiveTabFi receiveTab = _StringsReceiveTabFi._(_root);
	@override late final _StringsSendTabFi sendTab = _StringsSendTabFi._(_root);
	@override late final _StringsSettingsTabFi settingsTab = _StringsSettingsTabFi._(_root);
	@override late final _StringsTroubleshootPageFi troubleshootPage = _StringsTroubleshootPageFi._(_root);
	@override late final _StringsReceiveHistoryPageFi receiveHistoryPage = _StringsReceiveHistoryPageFi._(_root);
	@override late final _StringsApkPickerPageFi apkPickerPage = _StringsApkPickerPageFi._(_root);
	@override late final _StringsSelectedFilesPageFi selectedFilesPage = _StringsSelectedFilesPageFi._(_root);
	@override late final _StringsReceivePageFi receivePage = _StringsReceivePageFi._(_root);
	@override late final _StringsReceiveOptionsPageFi receiveOptionsPage = _StringsReceiveOptionsPageFi._(_root);
	@override late final _StringsSendPageFi sendPage = _StringsSendPageFi._(_root);
	@override late final _StringsProgressPageFi progressPage = _StringsProgressPageFi._(_root);
	@override late final _StringsWebSharePageFi webSharePage = _StringsWebSharePageFi._(_root);
	@override late final _StringsAboutPageFi aboutPage = _StringsAboutPageFi._(_root);
	@override late final _StringsDonationPageFi donationPage = _StringsDonationPageFi._(_root);
	@override late final _StringsChangelogPageFi changelogPage = _StringsChangelogPageFi._(_root);
	@override late final _StringsAliasGeneratorFi aliasGenerator = _StringsAliasGeneratorFi._(_root);
	@override late final _StringsDialogsFi dialogs = _StringsDialogsFi._(_root);
	@override late final _StringsSanitizationFi sanitization = _StringsSanitizationFi._(_root);
	@override late final _StringsTrayFi tray = _StringsTrayFi._(_root);
	@override late final _StringsWebFi web = _StringsWebFi._(_root);
	@override late final _StringsAssetPickerFi assetPicker = _StringsAssetPickerFi._(_root);
}

// Path: general
class _StringsGeneralFi extends _StringsGeneralEn {
	_StringsGeneralFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Hyväksy';
	@override String get accepted => 'Hyväksytty';
	@override String get add => 'Lisää';
	@override String get advanced => 'Edistynyt';
	@override String get cancel => 'Peruuta';
	@override String get close => 'Sulje';
	@override String get confirm => 'Vahvista';
	@override String get continueStr => 'Jatka';
	@override String get copy => 'Kopioi';
	@override String get copiedToClipboard => 'Kopioitu leikepöydälle';
	@override String get decline => 'Hylkää';
	@override String get done => 'Valmis';
	@override String get delete => 'Poista';
	@override String get edit => 'Muokkaa';
	@override String get error => 'Virhe';
	@override String get example => 'Esimerkki';
	@override String get files => 'Tiedostot';
	@override String get finished => 'Valmis';
	@override String get hide => 'Piilota';
	@override String get off => 'Pois';
	@override String get offline => 'Offline';
	@override String get on => 'Päällä';
	@override String get online => 'Online';
	@override String get open => 'Avaa';
	@override String get queue => 'Jono';
	@override String get quickSave => 'Pikatallennus';
	@override String get renamed => 'Nimetty uudelleen';
	@override String get reset => 'Nollaa';
	@override String get restart => 'Käynnistä uudelleen';
	@override String get settings => 'Asetukset';
	@override String get skipped => 'Ohitettu';
	@override String get start => 'Aloita';
	@override String get stop => 'Pysäytä';
	@override String get save => 'Tallenna';
	@override String get unchanged => 'Muuttumaton';
	@override String get unknown => 'Tuntematon';
	@override String get noItemInClipboard => 'Leikepöydällä ei ole mitään';
}

// Path: receiveTab
class _StringsReceiveTabFi extends _StringsReceiveTabEn {
	_StringsReceiveTabFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ota Vastaan';
	@override late final _StringsReceiveTabInfoBoxFi infoBox = _StringsReceiveTabInfoBoxFi._(_root);
}

// Path: sendTab
class _StringsSendTabFi extends _StringsSendTabEn {
	_StringsSendTabFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lähetä';
	@override late final _StringsSendTabSelectionFi selection = _StringsSendTabSelectionFi._(_root);
	@override late final _StringsSendTabPickerFi picker = _StringsSendTabPickerFi._(_root);
	@override String get shareIntentInfo => 'Sinä voit myös käyttää laitteesi "Jaa"-toimintoa valitaksesi tiedostoja helpommin.';
	@override String get nearbyDevices => 'Lähellä olevat laitteet';
	@override String get thisDevice => 'Tämä laite';
	@override String get scan => 'Etsi laitteita';
	@override String get sendMode => 'Lähetystapa';
	@override late final _StringsSendTabSendModesFi sendModes = _StringsSendTabSendModesFi._(_root);
	@override String get sendModeHelp => 'Selitys';
	@override String get help => 'Varmista, että haluttu kohde on myös samassa Wi-Fi-verkossa.';
	@override String get placeItems => 'Lissä tiedostot tähän, jakaaksesi ne.';
}

// Path: settingsTab
class _StringsSettingsTabFi extends _StringsSettingsTabEn {
	_StringsSettingsTabFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asetukset';
	@override late final _StringsSettingsTabGeneralFi general = _StringsSettingsTabGeneralFi._(_root);
	@override late final _StringsSettingsTabReceiveFi receive = _StringsSettingsTabReceiveFi._(_root);
	@override late final _StringsSettingsTabSendFi send = _StringsSettingsTabSendFi._(_root);
	@override late final _StringsSettingsTabNetworkFi network = _StringsSettingsTabNetworkFi._(_root);
	@override late final _StringsSettingsTabOtherFi other = _StringsSettingsTabOtherFi._(_root);
	@override String get advancedSettings => 'Edistyneet asetukset';
}

// Path: troubleshootPage
class _StringsTroubleshootPageFi extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ongelmanratkaisu';
	@override String get subTitle => 'Eikö sovellus toimi odotetusti? Täältä löydät joitain yleisiä ratkaisuja.';
	@override String get solution => 'Ratkaisu';
	@override String get fixButton => 'Automaattinen korjaus';
	@override late final _StringsTroubleshootPageFirewallFi firewall = _StringsTroubleshootPageFirewallFi._(_root);
	@override late final _StringsTroubleshootPageNoConnectionFi noConnection = _StringsTroubleshootPageNoConnectionFi._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageFi extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historia';
	@override String get openFolder => 'Avaa kansio';
	@override String get deleteHistory => 'Poista historia';
	@override String get empty => 'Historia on tyhjä.';
	@override late final _StringsReceiveHistoryPageEntryActionsFi entryActions = _StringsReceiveHistoryPageEntryActionsFi._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageFi extends _StringsApkPickerPageEn {
	_StringsApkPickerPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sovellukset (APK)';
	@override String get excludeSystemApps => 'lukuun ottamatta järjestelmäsovelluksia';
	@override String get excludeAppsWithoutLaunchIntent => 'lukuun ottamatta sovelluksia, joilla ei ole käynnistysintentiota';
	@override String apps({required Object n}) => '${n} sovellusta';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageFi extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Poista kaikki';
}

// Path: receivePage
class _StringsReceivePageFi extends _StringsReceivePageEn {
	_StringsReceivePageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(n,
		one: 'haluaa lähettää sinulle tiedoston',
		other: 'haluaa lähettää sinulle ${n} tiedostoa',
	);
	@override String get subTitleMessage => 'lähetti sinulle viestin:';
	@override String get subTitleLink => 'lähetti sinulle linkin:';
	@override String get canceled => 'Lähettäjä on peruuttanut pyynnön.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageFi extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asetukset';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(LocalSend-kansio)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Poistettu käytöstä automaattisesti, koska hakemistoja on olemassa.';
}

// Path: sendPage
class _StringsSendPageFi extends _StringsSendPageEn {
	_StringsSendPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Odotetaan vastausta...';
	@override String get rejected => 'Vastaanottaja on hylännyt pyynnön.';
	@override String get busy => 'Vastaanottaja käsittelee toista pyyntöä.';
}

// Path: progressPage
class _StringsProgressPageFi extends _StringsProgressPageEn {
	_StringsProgressPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Tiedostojen lähetys';
	@override String get titleReceiving => 'Tiedostojen vastaanotto';
	@override String get savedToGallery => 'Tallennettu Kuvat-kansioon';
	@override late final _StringsProgressPageTotalFi total = _StringsProgressPageTotalFi._(_root);
}

// Path: webSharePage
class _StringsWebSharePageFi extends _StringsWebSharePageEn {
	_StringsWebSharePageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Jaa linkin kautta';
	@override String get loading => 'Palvelimen käynnistys...';
	@override String get stopping => 'Palvelimen pysäytys...';
	@override String get error => 'Palvelimen käynnistyksessä tapahtui virhe.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(n,
		one: 'Avaa tämä linkki selaimessasi:',
		other: 'Avaa jokin näistä linkeistä selaimessasi:',
	);
	@override String get requests => 'Pyyntöjä';
	@override String get noRequests => 'Ei pyyntöjä vielä.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Hyväksy pyynnöt automaattisesti';
	@override String get encryptionHint => 'LocalSend käyttää itse allekirjoitettua sertifikaattia. Sinun on hyväksyttävä se selaimessasi.';
	@override String pendingRequests({required Object n}) => 'Odottavat pyynnöt: ${n}';
}

// Path: aboutPage
class _StringsAboutPageFi extends _StringsAboutPageEn {
	_StringsAboutPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tietoja LocalSendista';
	@override List<String> get description => [
		'LocalSend on ilmainen, avoimen lähdekoodin sovellus, jonka avulla voit turvallisesti jakaa tiedostoja ja viestejä läheisten laitteiden kanssa paikallisverkossasi ilman internet-yhteyttä.',
		'Tämä sovellus on saatavilla Androidille, iOS:lle, macOS:lle, Windowsille ja Linuxille. Kaikki latausvaihtoehdot löytyvät virallisilta kotisivuilta.',
	];
	@override String get author => 'Tekijä';
	@override String get contributors => 'Avustajat';
	@override String get translators => 'Kääntäjät';
}

// Path: donationPage
class _StringsDonationPageFi extends _StringsDonationPageEn {
	_StringsDonationPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lahjoita';
	@override String get info => 'LocalSend on ilmainen, avoimen lähdekoodin sovellus ilman mainoksia. Jos pidät sovelluksesta, voit tukea kehitystä lahjoituksella.';
	@override String donate({required Object amount}) => 'Lahjoita ${amount}';
	@override String get thanks => 'Suurkiitokset!';
	@override String get restore => 'Palauta ostos';
}

// Path: changelogPage
class _StringsChangelogPageFi extends _StringsChangelogPageEn {
	_StringsChangelogPageFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Muutosloki';
}

// Path: aliasGenerator
class _StringsAliasGeneratorFi extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Stydi',
		'Jämä',
		'Raju',
		'Makee',
		'Siisti',
		'Kummallinen',
		'Hurja',
		'Hörisevä',
		'Naurava',
		'Suriseva',
		'Pöhelö',
		'Hölmö',
		'Spede',
		'Kummallinen',
		'Rampainen',
		'Jonne',
		'Lössi',
		'Kuuli',
		'Aukiva',
		'Lutsi',
		'Wallahi',
		'Pummi',
		'Köyhä',
		'Saunassa käyvä',
		'Bulkki',
		'Chilli',
		'Dokkaava',
		'Känni',
		'Broidi',
		'Kundi',
		'Göntsä',
		'Pelleilevä',
		'Haiseva',
		'Hakkeri',
	];
	@override List<String> get fruits => [
		'Omena',
		'Banaani',
		'Appelsiini',
		'Mango',
		'Päärynä',
		'Kiivi',
		'Kirsikka',
		'Vadelma',
		'Mustikka',
		'Mansikka',
		'Luumu',
		'Persikka',
		'Punaherukka',
		'Mustaherukka',
		'Karhunvatukka',
		'Vesimeloni',
		'Hedelmä',
		'Päärynä',
		'Pihlajanmarja',
		'Karpalo',
		'Puolukka',
		'Lakka',
		'Kuusenkerkkä',
		'Kataja',
		'Kuusama',
		'Ananas',
		'Granaattiomena',
		'Sitruuna',
		'Lime',
		'Papaija',
		'Passionhedelmä',
		'Pomelo',
		'Kiinalainen karviainen',
		'Lychee',
		'Taateli',
		'Viikuna',
		'Rypäle',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsFi extends _StringsDialogsEn {
	_StringsDialogsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileFi addFile = _StringsDialogsAddFileFi._(_root);
	@override late final _StringsDialogsAddressInputFi addressInput = _StringsDialogsAddressInputFi._(_root);
	@override late final _StringsDialogsCancelSessionFi cancelSession = _StringsDialogsCancelSessionFi._(_root);
	@override late final _StringsDialogsCannotOpenFileFi cannotOpenFile = _StringsDialogsCannotOpenFileFi._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeFi encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeFi._(_root);
	@override late final _StringsDialogsErrorDialogFi errorDialog = _StringsDialogsErrorDialogFi._(_root);
	@override late final _StringsDialogsFavoriteDialogFi favoriteDialog = _StringsDialogsFavoriteDialogFi._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogFi favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogFi._(_root);
	@override late final _StringsDialogsFavoriteEditDialogFi favoriteEditDialog = _StringsDialogsFavoriteEditDialogFi._(_root);
	@override late final _StringsDialogsFileInfoFi fileInfo = _StringsDialogsFileInfoFi._(_root);
	@override late final _StringsDialogsFileNameInputFi fileNameInput = _StringsDialogsFileNameInputFi._(_root);
	@override late final _StringsDialogsHistoryClearDialogFi historyClearDialog = _StringsDialogsHistoryClearDialogFi._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedFi localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedFi._(_root);
	@override late final _StringsDialogsMessageInputFi messageInput = _StringsDialogsMessageInputFi._(_root);
	@override late final _StringsDialogsNoFilesFi noFiles = _StringsDialogsNoFilesFi._(_root);
	@override late final _StringsDialogsNoPermissionFi noPermission = _StringsDialogsNoPermissionFi._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformFi notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformFi._(_root);
	@override late final _StringsDialogsQrFi qr = _StringsDialogsQrFi._(_root);
	@override late final _StringsDialogsQuickActionsFi quickActions = _StringsDialogsQuickActionsFi._(_root);
	@override late final _StringsDialogsQuickSaveNoticeFi quickSaveNotice = _StringsDialogsQuickSaveNoticeFi._(_root);
	@override late final _StringsDialogsSendModeHelpFi sendModeHelp = _StringsDialogsSendModeHelpFi._(_root);
	@override late final _StringsDialogsZoomFi zoom = _StringsDialogsZoomFi._(_root);
}

// Path: sanitization
class _StringsSanitizationFi extends _StringsSanitizationEn {
	_StringsSanitizationFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Tiedostonimi ei voi olla tyhjä';
	@override String get invalid => 'Tiedostonimi sisältää kiellettyjä merkkejä';
}

// Path: tray
class _StringsTrayFi extends _StringsTrayEn {
	_StringsTrayFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get open => 'Avaa';
	@override String get close => 'Lopeta LocalSend';
}

// Path: web
class _StringsWebFi extends _StringsWebEn {
	_StringsWebFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Odotetaan vastausta...';
	@override String get rejected => 'Hylätty';
	@override String get files => 'Tiedostot';
	@override String get fileName => 'Tiedoston nimi';
	@override String get size => 'Koko';
}

// Path: assetPicker
class _StringsAssetPickerFi extends _StringsAssetPickerEn {
	_StringsAssetPickerFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Vahvista';
	@override String get cancel => 'Peruuta';
	@override String get edit => 'Muokkaa';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Lataus epäonnistui';
	@override String get original => 'Alkuperäinen';
	@override String get preview => 'Esikatselu';
	@override String get select => 'Valitse';
	@override String get emptyList => 'Tyhjä lista';
	@override String get unSupportedAssetType => 'Tiedostotyyppiä ei tueta.';
	@override String get unableToAccessAll => 'Kaikkien tiedostojen käyttö laitteella ei onnistu';
	@override String get viewingLimitedAssetsTip => 'Näytä vain sovelluksen käyttöön saatavilla olevat tiedostot ja albumit.';
	@override String get changeAccessibleLimitedAssets => 'Päivitä käytettävissä olevat tiedostot napsauttamalla';
	@override String get accessAllTip => 'Sovellus pääsee käsiksi vain osaan laitteen tiedostoista. Siirry järjestelmäasetuksiin ja salli sovelluksen pääsy kaikkiin laitteen mediaan.';
	@override String get goToSystemSettings => 'Siirry järjestelmäasetuksiin';
	@override String get accessLimitedAssets => 'Jatka rajoitetulla pääsyllä';
	@override String get accessiblePathName => 'Käytettävissä olevat tiedostot';
	@override String get sTypeAudioLabel => 'Ääni';
	@override String get sTypeImageLabel => 'Kuva';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Muut mediat';
	@override String get sActionPlayHint => 'toista';
	@override String get sActionPreviewHint => 'esikatsele';
	@override String get sActionSelectHint => 'valitse';
	@override String get sActionSwitchPathLabel => 'vaihda polkua';
	@override String get sActionUseCameraHint => 'käytä kameraa';
	@override String get sNameDurationLabel => 'kesto';
	@override String get sUnitAssetCountLabel => 'määrä';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxFi extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Portti:';
	@override String get alias => 'Laitteen nimi:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionFi extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Valinta';
	@override String files({required Object files}) => 'Tiedostot: ${files}';
	@override String size({required Object size}) => 'Koko: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerFi extends _StringsSendTabPickerEn {
	_StringsSendTabPickerFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get file => 'Tiedosto';
	@override String get folder => 'Kansio';
	@override String get media => 'Media';
	@override String get text => 'Teksti';
	@override String get app => 'Sovellus';
	@override String get clipboard => 'Liitä';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesFi extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get single => 'Yksi vastaanottaja';
	@override String get multiple => 'Monta vastaanottajaa';
	@override String get link => 'Jaa linkillä';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralFi extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yleinen';
	@override String get brightness => 'Teema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsFi brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsFi._(_root);
	@override String get color => 'Väri';
	@override late final _StringsSettingsTabGeneralColorOptionsFi colorOptions = _StringsSettingsTabGeneralColorOptionsFi._(_root);
	@override String get language => 'Kieli';
	@override late final _StringsSettingsTabGeneralLanguageOptionsFi languageOptions = _StringsSettingsTabGeneralLanguageOptionsFi._(_root);
	@override String get saveWindowPlacement => 'Poistu: Tallenna ikkunan sijainti';
	@override String get minimizeToTray => 'Poistu: Minimoi ilmoitusalueelle';
	@override String get launchAtStartup => 'Automaattinen käynnistys';
	@override String get launchMinimized => 'Automaattinen käynnistys: Käynnistä piiilotettuna';
	@override String get animations => 'Animaatiot';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveFi extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vastaanotto';
	@override String get quickSave => _root.general.quickSave;
	@override String get autoFinish => 'Automaattinen lopetus';
	@override String get destination => 'Kohde';
	@override String get downloads => '(Lataukset)';
	@override String get saveToGallery => 'Tallenna media galleriaan';
	@override String get saveToHistory => 'Tallenna historiaan';
}

// Path: settingsTab.send
class _StringsSettingsTabSendFi extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lähetys';
	@override String get shareViaLinkAutoAccept => 'Jaa linkki: Hyväksy automaattisesti';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkFi extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verkko';
	@override String get needRestart => 'UUdelleenkäynistä sovellus, jotta muutokset tallennetaan.';
	@override String get server => 'Palvelin';
	@override String get alias => 'Laitteen nimi';
	@override String get deviceType => 'Laitteen tyyppi';
	@override String get deviceModel => 'Laitteen malli';
	@override String get port => 'Portti';
	@override String get discoveryTimeout => 'Laitteiden etsintäaika';
	@override String portWarning({required Object defaultPort}) => 'Sinua ei ehkä havaita muiden laitteiden toimesta, koska käytät mukautettua porttia. (oletus: ${defaultPort})';
	@override String get encryption => 'Salaus';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Sinua ei ehkä havaita muiden laitteiden toimesta, koska käytät mukautettua multicast-osoitetta. (oletus: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherFi extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Muut';
	@override String get support => 'Tue LocalSendia';
	@override String get donate => 'Lahjoita';
	@override String get privacyPolicy => 'Tietosuojakäytäntö';
	@override String get termsOfUse => 'Käyttöehdot';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallFi extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Tämä sovellus voi lähettää tiedostoja muihin laitteisiin; mutta muut laitteet eivät voi lähettää tiedostoja tähän laitteeseen.';
	@override String solution({required Object port}) => 'Tämä on todennäköisesti palomuuriongelma. Voit ratkaista tämän sallimalla saapuvat yhteydet (UDP ja TCP) porttiin ${port}.';
	@override String get openFirewall => 'Avaa palomuuri';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionFi extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Molemmat laitteet eivät voi löytää toisiaan eivätkä jakaa tiedostoja.';
	@override String get solution => 'Onko ongelma olemassa molemmin puolin? Jos on, sinun on varmistettava, että molemmat laitteet ovat samassa Wi-Fi-verkossa ja jakavat saman kokoonpanon (portti, multicast-osoite, salaus). Verkko ei ehkä salli viestintää osallistujien välillä. Tässä tapauksessa tämä vaihtoehto on otettava käyttöön reitittimessä.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsFi extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get open => 'Avaa tiedosto';
	@override String get info => 'Tiedot';
	@override String get deleteFromHistory => 'Poista historiasta';
}

// Path: progressPage.total
class _StringsProgressPageTotalFi extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleFi title = _StringsProgressPageTotalTitleFi._(_root);
	@override String count({required Object curr, required Object n}) => 'Tiedostoja: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Koko: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Nopeus: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileFi extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lisää valintaan';
	@override String get content => 'Mitä haluat lisätä?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputFi extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anna osoite';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP-osoite';
	@override String get recentlyUsed => 'Äskettäin käytetty: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionFi extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Peruuta tiedostonsiirto';
	@override String get content => 'Haluatko varmasti peruuttaa tiedostonsiirron?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileFi extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tiedostoa ei voi avata';
	@override String content({required Object file}) => 'Tiedostoa "${file}" ei voitu avata. Onko tämä tiedosto siirretty, nimetty uudelleen tai poistettu?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeFi extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Salaus poistettu käytöstä';
	@override String get content => 'Viestintä tapahtuu nyt salaamattoman HTTP-protokollan kautta. Jos haluat käyttää HTTPS:ää, ota salaus uudelleen käyttöön.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogFi extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogFi extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Suosikit';
	@override String get noFavorites => 'Ei suosikkilaitteita vielä.';
	@override String get addFavorite => 'Lisää';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogFi extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Poista suosikeista';
	@override String content({required Object name}) => 'Haluatko varmasti poistaa suosikeista "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogFi extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Lisää suosikkeihin';
	@override String get titleEdit => 'Asetukset';
	@override String get name => 'Laitteen nimi';
	@override String get auto => '(automaattinen)';
	@override String get ip => 'IP-osoite';
	@override String get port => 'Portti';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoFi extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tiedoston tiedot';
	@override String get fileName => 'Tiedoston nimi:';
	@override String get path => 'Polku:';
	@override String get size => 'Koko:';
	@override String get sender => 'Lähettäjä:';
	@override String get time => 'Aika:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputFi extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anna tiedoston nimi';
	@override String original({required Object original}) => 'Alkuperäinen: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogFi extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tyhjennä historia';
	@override String get content => 'Haluatko varmasti poistaa koko historian?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedFi extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend ei löydä muita laitteita ilman lupaa skannata paikallisverkkoa. Anna tämä lupa asetuksissa.';
	@override String get gotoSettings => 'Asetukset';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputFi extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kirjoita viesti';
	@override String get multiline => 'Monirivinen';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesFi extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ei tiedostoa valittuna';
	@override String get content => 'Valitse vähintään yksi tiedosto.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionFi extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ei oikeuksia';
	@override String get content => 'Et ole myöntänyt tarvittavia oikeuksia. Myönnä ne asetuksissa.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformFi extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ei saatavilla';
	@override String get content => 'Tämä ominaisuus on saatavilla vain:';
}

// Path: dialogs.qr
class _StringsDialogsQrFi extends _StringsDialogsQrEn {
	_StringsDialogsQrFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-koodi';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsFi extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pikatoiminnot';
	@override String get counter => 'Laskuri';
	@override String get prefix => 'Etuliite';
	@override String get padZero => 'Täytä nollilla';
	@override String get sortBeforeCount => 'Lajittele aakkosjärjestykseen ennen laskentaa';
	@override String get random => 'Satunnainen';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeFi extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pikatallennus';
	@override String get content => 'Tiedostopyynnöt hyväksytään automaattisesti. Huomaa, että kuka tahansa paikallisverkossa voi lähettää sinulle tiedostoja.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpFi extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lähetystilat';
	@override String get single => 'Lähettää tiedostoja yhdelle vastaanottajalle. Valinta tyhjennetään tiedostonsiirron päätyttyä.';
	@override String get multiple => 'Lähettää tiedostoja useille vastaanottajille. Valinta ei tyhjene.';
	@override String get link => 'Vastaanottajat, joilla ei ole LocalSendia asennettuna, voivat ladata valitut tiedostot avaamalla linkin selaimessaan.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomFi extends _StringsDialogsZoomEn {
	_StringsDialogsZoomFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsFi extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Järjestelmä';
	@override String get dark => 'Tumma';
	@override String get light => 'Vaalea';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsFi extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Järjestelmä';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsFi extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Järjestelmä';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleFi extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleFi._(_StringsFi root) : this._root = root, super._(root);

	@override final _StringsFi _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Edistyminen yhteensä (${time})';
	@override String get finishedError => 'Päättynyt virheellä';
	@override String get canceledSender => 'Lähettäjä peruutti';
	@override String get canceledReceiver => 'Vastaanottaja peruutti';
}
