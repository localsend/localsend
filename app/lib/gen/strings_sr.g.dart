///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsSr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.sr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsSr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Srpski';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralSr general = _StringsGeneralSr._(_root);
	@override late final _StringsReceiveTabSr receiveTab = _StringsReceiveTabSr._(_root);
	@override late final _StringsSendTabSr sendTab = _StringsSendTabSr._(_root);
	@override late final _StringsSettingsTabSr settingsTab = _StringsSettingsTabSr._(_root);
	@override late final _StringsTroubleshootPageSr troubleshootPage = _StringsTroubleshootPageSr._(_root);
	@override late final _StringsReceiveHistoryPageSr receiveHistoryPage = _StringsReceiveHistoryPageSr._(_root);
	@override late final _StringsApkPickerPageSr apkPickerPage = _StringsApkPickerPageSr._(_root);
	@override late final _StringsSelectedFilesPageSr selectedFilesPage = _StringsSelectedFilesPageSr._(_root);
	@override late final _StringsReceivePageSr receivePage = _StringsReceivePageSr._(_root);
	@override late final _StringsReceiveOptionsPageSr receiveOptionsPage = _StringsReceiveOptionsPageSr._(_root);
	@override late final _StringsSendPageSr sendPage = _StringsSendPageSr._(_root);
	@override late final _StringsProgressPageSr progressPage = _StringsProgressPageSr._(_root);
	@override late final _StringsWebSharePageSr webSharePage = _StringsWebSharePageSr._(_root);
	@override late final _StringsAboutPageSr aboutPage = _StringsAboutPageSr._(_root);
	@override late final _StringsDonationPageSr donationPage = _StringsDonationPageSr._(_root);
	@override late final _StringsChangelogPageSr changelogPage = _StringsChangelogPageSr._(_root);
	@override late final _StringsAliasGeneratorSr aliasGenerator = _StringsAliasGeneratorSr._(_root);
	@override late final _StringsDialogsSr dialogs = _StringsDialogsSr._(_root);
	@override late final _StringsTraySr tray = _StringsTraySr._(_root);
	@override late final _StringsWebSr web = _StringsWebSr._(_root);
	@override late final _StringsAssetPickerSr assetPicker = _StringsAssetPickerSr._(_root);
}

// Path: general
class _StringsGeneralSr extends _StringsGeneralEn {
	_StringsGeneralSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Prihvati';
	@override String get accepted => 'Prihvaćeno';
	@override String get add => 'Dodaj';
	@override String get advanced => 'Napredno';
	@override String get cancel => 'Odustani';
	@override String get close => 'Zatvori';
	@override String get confirm => 'Potvrdi';
	@override String get continueStr => 'Nastavi';
	@override String get copy => 'Kopiraj';
	@override String get copiedToClipboard => 'Kopirano u Clipboard';
	@override String get decline => 'Odbij';
	@override String get done => 'Gotovo';
	@override String get delete => 'Izbriši';
	@override String get edit => 'Izmeni';
	@override String get error => 'Grešla';
	@override String get example => 'Primer';
	@override String get files => 'Fajlovi';
	@override String get finished => 'Završeno';
	@override String get hide => 'Sakri';
	@override String get off => 'Isključeno';
	@override String get offline => 'Offline';
	@override String get on => 'On';
	@override String get online => 'Online';
	@override String get open => 'Otvori';
	@override String get queue => 'Stavi u Queue';
	@override String get quickSave => 'Brzo snimi';
	@override String get renamed => 'Preimenovano';
	@override String get reset => 'Resetuj';
	@override String get restart => 'Restartuj';
	@override String get settings => 'Postavke';
	@override String get skipped => 'Propušteno';
	@override String get start => 'Startuj';
	@override String get stop => 'Zaustavi';
	@override String get save => 'Snimi';
	@override String get unchanged => 'Nepromenjeno';
	@override String get unknown => 'Nepoznato';
	@override String get noItemInClipboard => 'Nema itema u Clipboard-u';
}

// Path: receiveTab
class _StringsReceiveTabSr extends _StringsReceiveTabEn {
	_StringsReceiveTabSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Primanje';
	@override late final _StringsReceiveTabInfoBoxSr infoBox = _StringsReceiveTabInfoBoxSr._(_root);
}

// Path: sendTab
class _StringsSendTabSr extends _StringsSendTabEn {
	_StringsSendTabSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Slanje';
	@override late final _StringsSendTabSelectionSr selection = _StringsSendTabSelectionSr._(_root);
	@override late final _StringsSendTabPickerSr picker = _StringsSendTabPickerSr._(_root);
	@override String get shareIntentInfo => 'Možeš takodje da koristiš i "Share" opciju tvog mobilnog uredjaja da bi lakše selektovao fajlove.';
	@override String get nearbyDevices => 'Uredjaji u blizini';
	@override String get thisDevice => 'Ovaj uredjaj';
	@override String get scan => 'Potraži uredjaje';
	@override String get sendMode => 'Mod za slanje';
	@override late final _StringsSendTabSendModesSr sendModes = _StringsSendTabSendModesSr._(_root);
	@override String get sendModeHelp => 'Objašnjenje';
	@override String get help => 'Molim uveri se da je željena destinacija takodje na istoj WiFi mreži.';
	@override String get placeItems => 'Postavi šta želiš da share-uješ.';
}

// Path: settingsTab
class _StringsSettingsTabSr extends _StringsSettingsTabEn {
	_StringsSettingsTabSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Podešavanje';
	@override late final _StringsSettingsTabGeneralSr general = _StringsSettingsTabGeneralSr._(_root);
	@override late final _StringsSettingsTabReceiveSr receive = _StringsSettingsTabReceiveSr._(_root);
	@override late final _StringsSettingsTabSendSr send = _StringsSettingsTabSendSr._(_root);
	@override late final _StringsSettingsTabNetworkSr network = _StringsSettingsTabNetworkSr._(_root);
	@override late final _StringsSettingsTabOtherSr other = _StringsSettingsTabOtherSr._(_root);
	@override String get advancedSettings => 'Napredna podešavanja';
}

// Path: troubleshootPage
class _StringsTroubleshootPageSr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Troubleshoot';
	@override String get subTitle => 'Da li aplikacija radi kako treba? Ovde možete naći neka uobičajena rešenja.';
	@override String get solution => 'Rešenje:';
	@override String get fixButton => 'Popravi automatski';
	@override late final _StringsTroubleshootPageFirewallSr firewall = _StringsTroubleshootPageFirewallSr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionSr noConnection = _StringsTroubleshootPageNoConnectionSr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageSr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Istorija';
	@override String get openFolder => 'Otvori folder';
	@override String get deleteHistory => 'Obriši Istoriju';
	@override String get empty => 'Istorija je prazna.';
	@override late final _StringsReceiveHistoryPageEntryActionsSr entryActions = _StringsReceiveHistoryPageEntryActionsSr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageSr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikacije (APK)';
	@override String get excludeSystemApps => 'Izostavi sistemske aplikacije';
	@override String get excludeAppsWithoutLaunchIntent => 'Izostavi aplikacije koje se ne pokreću';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageSr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Obriši sve';
}

// Path: receivePage
class _StringsReceivePageSr extends _StringsReceivePageEn {
	_StringsReceivePageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n,
		one: 'želi da pošalje fajl',
		other: 'želi da pošalje ${n} fajlova',
	);
	@override String get subTitleMessage => 'je poslao poruku:';
	@override String get subTitleLink => 'je poslao Link:';
	@override String get canceled => 'Pošiljalac je poništio zahtev.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageSr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opcije';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Isključeno automatski zato što postoje folderi.';
}

// Path: sendPage
class _StringsSendPageSr extends _StringsSendPageEn {
	_StringsSendPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Čekam odgovor...';
	@override String get rejected => 'Primalac je odbio zahtev.';
	@override String get busy => 'Primalac je zauzet nekim drugim zahtevom za slanje.';
}

// Path: progressPage
class _StringsProgressPageSr extends _StringsProgressPageEn {
	_StringsProgressPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Slanje fajlova';
	@override String get titleReceiving => 'Primanje fajlova';
	@override String get savedToGallery => 'Snimljeno u Slike';
	@override late final _StringsProgressPageTotalSr total = _StringsProgressPageTotalSr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageSr extends _StringsWebSharePageEn {
	_StringsWebSharePageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deli pomoću Linka';
	@override String get loading => 'Pokrećem server...';
	@override String get stopping => 'Zaustavljam server...';
	@override String get error => 'Prilikom pokretanja servera dogodila se greška.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n,
		one: 'Otvori ovaj link u browseru:',
		other: 'Otvori jedan od ovih linkova u browseru:',
	);
	@override String get requests => 'Zahtevi';
	@override String get noRequests => 'Nema zahteva još uvek.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get autoAccept => 'Automatski prihvati zahteve';
	@override String get encryptionHint => 'LocalSend koristi sertifikate koji su self-signed. Morate da prihvatite to u browseru.';
	@override String pendingRequests({required Object n}) => 'Zahtevi na čekanju: ${n}';
}

// Path: aboutPage
class _StringsAboutPageSr extends _StringsAboutPageEn {
	_StringsAboutPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'O LocalSend-u';
	@override List<String> get description => [
		'LocalSend je besplatna (slobodna) open-source aplikacija, koja vam omogućava da delite fajlove i poruke sa obližnjim uredjajima sigurno, preko lokalne mreže, bez potrebe za internet konekcijom.',
		'Ova aplikacije je dostupna za Android, iOS, macOS, Windows i Linux. Možete pronaći sve opcije za download na oficijelnoj web strani.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Saradnici';
	@override String get translators => 'Prevodioci';
}

// Path: donationPage
class _StringsDonationPageSr extends _StringsDonationPageEn {
	_StringsDonationPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doniraj';
	@override String get info => 'LocalSend je slobodna, open-source aplikacije bez reklama. Ako vam se dopada aplikacija, možete podržati razvoj putem donacije.';
	@override String donate({required Object amount}) => 'Doniraj ${amount}';
	@override String get thanks => 'Hvala vam!';
	@override String get restore => 'Obnovi kupovinu';
}

// Path: changelogPage
class _StringsChangelogPageSr extends _StringsChangelogPageEn {
	_StringsChangelogPageSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log Promena';
}

// Path: aliasGenerator
class _StringsAliasGeneratorSr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Neodoljiva',
		'Prelepa',
		'Velika',
		'Bistra',
		'Čista',
		'Pametna',
		'Hladnjikava',
		'Slatka',
		'Lukava',
		'Odlučna',
		'Energetska',
		'Efikasna',
		'Fantastična',
		'Brza',
		'Fina',
		'Sveža',
		'Dobra',
		'Divna',
		'Velika',
		'Zgodna',
		'Vruća',
		'Nežna',
		'Ljubazna',
		'Mistična',
		'Uredna',
		'Lepa',
		'Strpljiva',
		'Prelepa',
		'Moćna',
		'Bogata',
		'Tajnovita',
		'Pametna',
		'Čvrsta',
		'Specijalna',
		'Budjava',
		'Jaka',
		'Uredna',
		'Mudra',
	];
	@override List<String> get fruits => [
		'Jabuka',
		'Šljiva',
		'Banana',
		'Borovnica',
		'Ribizla',
		'Kajsija',
		'Šargarepa',
		'Trešnja',
		'Paprika',
		'Papričica',
		'Krompiruša',
		'Kupusara',
		'Rotkvica',
		'Lubenica',
		'Pečurka',
		'Mandarina',
		'Pomorandža',
		'Papaja',
		'Breskva',
		'Kruška',
		'Šišarka',
		'Dinja',
		'Bundeva',
		'Višnja',
		'Jagoda',
		'Dunja',
	];

	/// In some languages, the adjective must be last. Not the case in Serbian, but serbian adjektives must have endings which depend on the gender of the noun. That's why we put all the Fruits with the female form and corresponding adjective endings in female form for this translation.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsSr extends _StringsDialogsEn {
	_StringsDialogsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileSr addFile = _StringsDialogsAddFileSr._(_root);
	@override late final _StringsDialogsAddressInputSr addressInput = _StringsDialogsAddressInputSr._(_root);
	@override late final _StringsDialogsCancelSessionSr cancelSession = _StringsDialogsCancelSessionSr._(_root);
	@override late final _StringsDialogsCannotOpenFileSr cannotOpenFile = _StringsDialogsCannotOpenFileSr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeSr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeSr._(_root);
	@override late final _StringsDialogsErrorDialogSr errorDialog = _StringsDialogsErrorDialogSr._(_root);
	@override late final _StringsDialogsFavoriteDialogSr favoriteDialog = _StringsDialogsFavoriteDialogSr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogSr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogSr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogSr favoriteEditDialog = _StringsDialogsFavoriteEditDialogSr._(_root);
	@override late final _StringsDialogsFileInfoSr fileInfo = _StringsDialogsFileInfoSr._(_root);
	@override late final _StringsDialogsFileNameInputSr fileNameInput = _StringsDialogsFileNameInputSr._(_root);
	@override late final _StringsDialogsHistoryClearDialogSr historyClearDialog = _StringsDialogsHistoryClearDialogSr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedSr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedSr._(_root);
	@override late final _StringsDialogsMessageInputSr messageInput = _StringsDialogsMessageInputSr._(_root);
	@override late final _StringsDialogsNoFilesSr noFiles = _StringsDialogsNoFilesSr._(_root);
	@override late final _StringsDialogsNoPermissionSr noPermission = _StringsDialogsNoPermissionSr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformSr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformSr._(_root);
	@override late final _StringsDialogsQrSr qr = _StringsDialogsQrSr._(_root);
	@override late final _StringsDialogsQuickActionsSr quickActions = _StringsDialogsQuickActionsSr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeSr quickSaveNotice = _StringsDialogsQuickSaveNoticeSr._(_root);
	@override late final _StringsDialogsSendModeHelpSr sendModeHelp = _StringsDialogsSendModeHelpSr._(_root);
}

// Path: tray
class _StringsTraySr extends _StringsTrayEn {
	_StringsTraySr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Quit LocalSend';
}

// Path: web
class _StringsWebSr extends _StringsWebEn {
	_StringsWebSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Odbijeno';
	@override String get files => 'Fajlovi';
	@override String get fileName => 'Ime fajla';
	@override String get size => 'Veličina';
}

// Path: assetPicker
class _StringsAssetPickerSr extends _StringsAssetPickerEn {
	_StringsAssetPickerSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Potvrdi';
	@override String get cancel => 'Odustani';
	@override String get edit => 'Izmeni';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Učitavanje neuspešno';
	@override String get original => 'Poreklo';
	@override String get preview => 'Pogledaj';
	@override String get select => 'Izaberi';
	@override String get emptyList => 'Isprazni listu';
	@override String get unSupportedAssetType => 'Tip fajla nije podržan.';
	@override String get unableToAccessAll => 'Nemoguće pristupiti svim fajlovima na ovom uredjaju';
	@override String get viewingLimitedAssetsTip => 'Samo view fajlovi i albumi dostupni aplikaciji.';
	@override String get changeAccessibleLimitedAssets => 'Klikni da updatuješ dostupne fajlove';
	@override String get accessAllTip => 'Aplikacija može da pristupi samo nekim fajlovima na uredjaju.Idi u Sistemska podešavanja i dozvoli aplikaciji pristup svim medijskim fajlovima na uredjaju.';
	@override String get goToSystemSettings => 'Idi u Sistemska podešavanja';
	@override String get accessLimitedAssets => 'Nastavi sa ograničenim pristupom';
	@override String get accessiblePathName => 'Dostupni fajlovi';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Slika';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Druga vrsta medija';
	@override String get sActionPlayHint => 'play';
	@override String get sActionPreviewHint => 'preview';
	@override String get sActionSelectHint => 'izaberi';
	@override String get sActionSwitchPathLabel => 'promeni putanju';
	@override String get sActionUseCameraHint => 'koristi kameru';
	@override String get sNameDurationLabel => 'trajanje';
	@override String get sUnitAssetCountLabel => 'broj';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxSr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Ime uredjaja:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionSr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selekcija';
	@override String files({required Object files}) => 'Fajlovi: ${files}';
	@override String size({required Object size}) => 'Veličina: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerSr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fajl';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Tekst';
	@override String get app => 'App';
	@override String get clipboard => 'Nalepi';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesSr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get single => 'Jedan primalac';
	@override String get multiple => 'Više primalaca';
	@override String get link => 'Deli pomoću Linka';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralSr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uopšteno';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsSr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsSr._(_root);
	@override String get color => 'Boja';
	@override late final _StringsSettingsTabGeneralColorOptionsSr colorOptions = _StringsSettingsTabGeneralColorOptionsSr._(_root);
	@override String get language => 'Jezik';
	@override late final _StringsSettingsTabGeneralLanguageOptionsSr languageOptions = _StringsSettingsTabGeneralLanguageOptionsSr._(_root);
	@override String get saveWindowPlacement => 'Izadji: Snimi položaj prozora';
	@override String get minimizeToTray => 'Izadji: Minimizuj u Tray/MenuBar';
	@override String get launchAtStartup => 'Autostartuj posle login-a';
	@override String get launchMinimized => 'Autostartuj: Start sakriven';
	@override String get animations => 'Animacije';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveSr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Primanje';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Automatski završi';
	@override String get destination => 'Destinacija';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Snimi media-fajlove u Galeriju';
	@override String get saveToHistory => 'Snimi u Istoriju';
}

// Path: settingsTab.send
class _StringsSettingsTabSendSr extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Slanje';
	@override String get shareViaLinkAutoAccept => 'Podeli preko Link-a: Automatski prihvati';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkSr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mreža';
	@override String get needRestart => 'Restartuj server da bi Podešavanja bila primenjena!';
	@override String get server => 'Server';
	@override String get alias => 'Ime uredjaja';
	@override String get deviceType => 'Tip uredjaja';
	@override String get deviceModel => 'Model uredjaja';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Možda nećete biti pronadjeni od strane drugih uredjaja jer koristite custom Port.(default: ${defaultPort})';
	@override String get encryption => 'Enkripcija';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Možda nećete biti pronadjeni od strane drugih uredjaja jer koristite custom multicast adresu. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherSr extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Drugo';
	@override String get support => 'Podrži LocalSend';
	@override String get donate => 'Doniraj';
	@override String get privacyPolicy => 'Politika Privatnosti';
	@override String get termsOfUse => 'Uslovi korišćenja';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallSr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ova aplikacija može poslati fajlove drugim uredjajima; ali drugi uredjaji ne mogu poslati fajlove ovom uredjaju.';
	@override String solution({required Object port}) => 'Ovo je najverovatnije Firewall problem. Možete rešiti ovo omogućavanjem dolaznih konekcija (UDP and TCP) na portu ${port}.';
	@override String get openFirewall => 'Otvori Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionSr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Uredjaji ne mogu ni da pronadju jedan drugog, ni da podele fajlove.';
	@override String get solution => 'Da li problem postoji na obe strane? Ako je tako, morate da se uverite da se oba uredjaja nalaze na istoj Wi-Fi mreži i da dele istu konfiguraciju (port, multicast adresa, enkripcija). Mreža možda ne dozvoljava komunikaciju medju uredjajima. U ovom slučaju, ova opcija mora biti omogućena na ruteru.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsSr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get open => 'Otvori fajl';
	@override String get info => 'Informacije';
	@override String get deleteFromHistory => 'Obriši iz Istorije.';
}

// Path: progressPage.total
class _StringsProgressPageTotalSr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleSr title = _StringsProgressPageTotalTitleSr._(_root);
	@override String count({required Object curr, required Object n}) => 'Fajlova: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Veličina: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Brzina: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileSr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dodaj u Selekciju';
	@override String get content => 'Šta želiš da dodaš?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputSr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Upiši adresu';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Adresa';
	@override String get recentlyUsed => 'Nedavno korišćeno: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionSr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odustani od prebacivanja fajla';
	@override String get content => 'Da li stvarno želiš da odustaneš od slanja fajla?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileSr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ne mogu da otvorim fajl';
	@override String content({required Object file}) => 'Ne mogu da otvorim "${file}". Da li je ovaj fajl negde pomeren, preimenovan, ili obrisan?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeSr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enkripcija onemogućena';
	@override String get content => 'Komunikacija se sada vrši preko ne-enkriptovanog HTTP protokola. Da bi koristio HTTPS, omogući Enkripciju opet.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogSr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogSr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Omiljeni';
	@override String get noFavorites => 'Nema omiljenih uredjaja još uvek.';
	@override String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogSr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Izbriši iz Omiljenih';
	@override String content({required Object name}) => 'Da li stvarno želiš da izbrišeš iz Omiljenih "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogSr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Dodaj u Omiljene';
	@override String get titleEdit => 'Podešavanja';
	@override String get name => 'Ime Uredjaja';
	@override String get auto => '(auto)';
	@override String get ip => 'IP Adresa';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoSr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informacije o fajlu';
	@override String get fileName => 'Ime fajla:';
	@override String get path => 'Putanja:';
	@override String get size => 'Veličina:';
	@override String get sender => 'Pošiljalac:';
	@override String get time => 'Vreme:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputSr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ubaci ima fajla';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogSr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Očisti Istoriju';
	@override String get content => 'Da li stvarno želiš da izbrišeš celu Istoriju?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedSr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend ne može da nadje druge uredjaje bez dozvole da skenira lokalnu mrežu. Molim dodajte ovu dozvolu u Podešavanja.';
	@override String get gotoSettings => 'Podešavanja';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputSr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Upiši poruku';
	@override String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesSr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nijedan fajl nije izabran';
	@override String get content => 'Molim izaberite bar jedan fajl.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionSr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nema dozvole';
	@override String get content => 'Niste dodali neophodne dozvole. Molim dodajte ih u Podešavanja.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformSr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nije dostupno';
	@override String get content => 'Ova opcija je dostupna samo na:';
}

// Path: dialogs.qr
class _StringsDialogsQrSr extends _StringsDialogsQrEn {
	_StringsDialogsQrSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsSr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Brze Akcije';
	@override String get counter => 'Merač';
	@override String get prefix => 'Prefiks';
	@override String get padZero => 'Bez padding-a';
	@override String get sortBeforeCount => 'Sortiraj po abecedi prethodno';
	@override String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeSr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Zahtevi za slanje fajlova su automatski prihvaćeni. Primite k znanju da bilo ko na lokalnoj mreži može da vam pošalje fajl.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpSr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mod za slanje';
	@override String get single => 'Pošalji fajlove jednom primaocu. Selekcija će biti resetovana nakon završenog slanja.';
	@override String get multiple => 'Pošalji fajlove za više primalaca. Selekcija neće biti resetovana nakon završenog slanja.';
	@override String get link => 'Primaoci koji nemaju LocalSend instaliran, mogu da download-uju selektovane fajlove preko Linka u browseru.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsSr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Tamno';
	@override String get light => 'Svetlo';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsSr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsSr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleSr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleSr._(_StringsSr root) : this._root = root, super._(root);

	@override final _StringsSr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Ukupan progres (${time})';
	@override String get finishedError => 'Završeno sa greškom';
	@override String get canceledSender => 'Pošiljalac odustao';
	@override String get canceledReceiver => 'Primalac odustao';
}
