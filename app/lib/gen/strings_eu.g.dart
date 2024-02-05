part of 'strings.g.dart';

// Path: <root>
class _StringsEu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.eu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <eu>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsEu _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Euskara';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralEu general = _StringsGeneralEu._(_root);
	@override late final _StringsReceiveTabEu receiveTab = _StringsReceiveTabEu._(_root);
	@override late final _StringsSendTabEu sendTab = _StringsSendTabEu._(_root);
	@override late final _StringsSettingsTabEu settingsTab = _StringsSettingsTabEu._(_root);
	@override late final _StringsTroubleshootPageEu troubleshootPage = _StringsTroubleshootPageEu._(_root);
	@override late final _StringsReceiveHistoryPageEu receiveHistoryPage = _StringsReceiveHistoryPageEu._(_root);
	@override late final _StringsApkPickerPageEu apkPickerPage = _StringsApkPickerPageEu._(_root);
	@override late final _StringsSelectedFilesPageEu selectedFilesPage = _StringsSelectedFilesPageEu._(_root);
	@override late final _StringsReceivePageEu receivePage = _StringsReceivePageEu._(_root);
	@override late final _StringsReceiveOptionsPageEu receiveOptionsPage = _StringsReceiveOptionsPageEu._(_root);
	@override late final _StringsSendPageEu sendPage = _StringsSendPageEu._(_root);
	@override late final _StringsProgressPageEu progressPage = _StringsProgressPageEu._(_root);
	@override late final _StringsWebSharePageEu webSharePage = _StringsWebSharePageEu._(_root);
	@override late final _StringsAboutPageEu aboutPage = _StringsAboutPageEu._(_root);
	@override late final _StringsChangelogPageEu changelogPage = _StringsChangelogPageEu._(_root);
	@override late final _StringsAliasGeneratorEu aliasGenerator = _StringsAliasGeneratorEu._(_root);
	@override late final _StringsDialogsEu dialogs = _StringsDialogsEu._(_root);
	@override late final _StringsTrayEu tray = _StringsTrayEu._(_root);
	@override late final _StringsWebEu web = _StringsWebEu._(_root);
	@override late final _StringsAssetPickerEu assetPicker = _StringsAssetPickerEu._(_root);
}

// Path: general
class _StringsGeneralEu extends _StringsGeneralEn {
	_StringsGeneralEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Onartu';
	@override String get accepted => 'Onartuta';
	@override String get add => 'Gehitu';
	@override String get advanced => 'Aurreratua';
	@override String get cancel => 'Utzi';
	@override String get close => 'Itxi';
	@override String get confirm => 'Baieztatu';
	@override String get continueStr => 'Jarraitu';
	@override String get copy => 'Kopiatu';
	@override String get copiedToClipboard => 'Arbelean kopiatua';
	@override String get decline => 'Ez onartu';
	@override String get done => 'Egina';
	@override String get delete => 'Ezabatu';
	@override String get edit => 'Editatu';
	@override String get error => 'Errorea';
	@override String get example => 'Adibidea';
	@override String get files => 'Fitxategiak';
	@override String get finished => 'Amaituta';
	@override String get hide => 'Ezkutatu';
	@override String get off => 'Itzalita';
	@override String get offline => 'Deskonektatua';
	@override String get on => 'Piztuta';
	@override String get online => 'Online';
	@override String get open => 'Ireki';
	@override String get queue => 'Ilara';
	@override String get quickSave => 'Gordetze Azkarra';
	@override String get renamed => 'Berizendatua';
	@override String get reset => 'Berrezarri';
	@override String get restart => 'Berrasieratu';
	@override String get settings => 'Aukerak';
	@override String get skipped => 'Utzita';
	@override String get start => 'Hasieratu';
	@override String get stop => 'Gelditu';
	@override String get save => 'Gorde';
	@override String get unchanged => 'Aldaketarik gabe';
	@override String get unknown => 'Ezezaguna';
	@override String get noItemInClipboard => 'Elementua ez dago arbeletan';
}

// Path: receiveTab
class _StringsReceiveTabEu extends _StringsReceiveTabEn {
	_StringsReceiveTabEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eskuratu';
	@override late final _StringsReceiveTabInfoBoxEu infoBox = _StringsReceiveTabInfoBoxEu._(_root);
}

// Path: sendTab
class _StringsSendTabEu extends _StringsSendTabEn {
	_StringsSendTabEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bidali';
	@override late final _StringsSendTabSelectionEu selection = _StringsSendTabSelectionEu._(_root);
	@override late final _StringsSendTabPickerEu picker = _StringsSendTabPickerEu._(_root);
	@override String get shareIntentInfo => 'Zure gailuko "Elkarbanatu" aukera ere erabil dezakezu fitxategi gehiago errezago aukeratzeko.';
	@override String get nearbyDevices => 'Inguruko Gailuak';
	@override String get thisDevice => 'Gailu hau';
	@override String get scan => 'Bilatu gailuak';
	@override String get sendMode => 'Bidalketa modua';
	@override late final _StringsSendTabSendModesEu sendModes = _StringsSendTabSendModesEu._(_root);
	@override String get sendModeHelp => 'Azalpena';
	@override String get help => 'Ziurtatu zaitez aukeratutako hartzailea zure Wi-Fi sare berean dagoela.';
	@override String get placeItems => 'Aukeratu elkarbanatzeko elementuak.';
}

// Path: settingsTab
class _StringsSettingsTabEu extends _StringsSettingsTabEn {
	_StringsSettingsTabEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ezarpenak';
	@override late final _StringsSettingsTabGeneralEu general = _StringsSettingsTabGeneralEu._(_root);
	@override late final _StringsSettingsTabReceiveEu receive = _StringsSettingsTabReceiveEu._(_root);
	@override late final _StringsSettingsTabNetworkEu network = _StringsSettingsTabNetworkEu._(_root);
	@override String get advancedSettings => 'Ezarpen aurreratuak';
}

// Path: troubleshootPage
class _StringsTroubleshootPageEu extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Konpondu arazoak';
	@override String get subTitle => 'Aplikazioa ez dabil espero bezala? Hemen arazo arrunten konponbidea aurki dezakezu.';
	@override String get solution => 'Konponbidea:';
	@override String get fixButton => 'Konpondu automatikoki';
	@override late final _StringsTroubleshootPageFirewallEu firewall = _StringsTroubleshootPageFirewallEu._(_root);
	@override late final _StringsTroubleshootPageNoConnectionEu noConnection = _StringsTroubleshootPageNoConnectionEu._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageEu extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historia';
	@override String get openFolder => 'Ireki direktorioa';
	@override String get deleteHistory => 'Ezabatu historia';
	@override String get empty => 'Historia hutsik dago.';
	@override late final _StringsReceiveHistoryPageEntryActionsEu entryActions = _StringsReceiveHistoryPageEntryActionsEu._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageEu extends _StringsApkPickerPageEn {
	_StringsApkPickerPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'App-ak (APK)';
	@override String get excludeSystemApps => 'Baztertu sistemako app-ak';
	@override String get excludeAppsWithoutLaunchIntent => 'Baztertu exekutatu ezin diren app-ak';
	@override String apps({required Object n}) => '${n} App-ak';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageEu extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Ezabatu dena';
}

// Path: receivePage
class _StringsReceivePageEu extends _StringsReceivePageEn {
	_StringsReceivePageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(n,
		one: '-(e)k fitxategi bat bidali nahi dizu',
		other: '-(e)k ${n} fitxategi bidali nahi dizkizu',
	);
	@override String get subTitleMessage => '-(e)k mezu bat bidali dizu:';
	@override String get subTitleLink => '-(e)k lotura bat bidali dizu:';
	@override String get canceled => 'Bidaltzaileak bidalketa bertan behera utzi du.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageEu extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ezarpenak';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(directorio ${_root.appName})';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Direktorioak daudelako desaktibatua.';
}

// Path: sendPage
class _StringsSendPageEu extends _StringsSendPageEn {
	_StringsSendPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Erantzunaren zai...';
	@override String get rejected => 'Hartzaileak ez du bidalketa onartu.';
	@override String get busy => 'Hartzailea beste bidalketa batekin okupatuta dago.';
}

// Path: progressPage
class _StringsProgressPageEu extends _StringsProgressPageEn {
	_StringsProgressPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Fitxategiak bidaltzen';
	@override String get titleReceiving => 'Fitxategiak eskuratzen';
	@override String get savedToGallery => 'Galerian gordeta';
	@override late final _StringsProgressPageTotalEu total = _StringsProgressPageTotalEu._(_root);
}

// Path: webSharePage
class _StringsWebSharePageEu extends _StringsWebSharePageEn {
	_StringsWebSharePageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Loturaren bidez elkarbanatu';
	@override String get loading => 'Hasieratu zerbitzaria...';
	@override String get stopping => 'Gelditu zerbitzaria...';
	@override String get error => 'Zerbitzaria hasieratzean arazo bat gertatu da.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(n,
		one: 'Ireki lotura nabigatzailean:',
		other: 'Ireki hauetako lotura bat nabigatzailean:',
	);
	@override String get requests => 'Eskerak';
	@override String get noRequests => 'Oraindik ez dago eskaerarik.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend-ek autosinatutako zertifikatuak erabiltzen ditu. Nabigatzailean onartu behar duzu';
	@override String pendingRequests({required Object n}) => 'Eskerak: ${n}';
}

// Path: aboutPage
class _StringsAboutPageEu extends _StringsAboutPageEn {
	_StringsAboutPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSend buruz';
}

// Path: changelogPage
class _StringsChangelogPageEu extends _StringsChangelogPageEn {
	_StringsChangelogPageEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aldaketak';
}

// Path: aliasGenerator
class _StringsAliasGeneratorEu extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsEu extends _StringsDialogsEn {
	_StringsDialogsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileEu addFile = _StringsDialogsAddFileEu._(_root);
	@override late final _StringsDialogsAddressInputEu addressInput = _StringsDialogsAddressInputEu._(_root);
	@override late final _StringsDialogsCancelSessionEu cancelSession = _StringsDialogsCancelSessionEu._(_root);
	@override late final _StringsDialogsCannotOpenFileEu cannotOpenFile = _StringsDialogsCannotOpenFileEu._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeEu encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeEu._(_root);
	@override late final _StringsDialogsErrorDialogEu errorDialog = _StringsDialogsErrorDialogEu._(_root);
	@override late final _StringsDialogsFavoriteDialogEu favoriteDialog = _StringsDialogsFavoriteDialogEu._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogEu favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogEu._(_root);
	@override late final _StringsDialogsFavoriteEditDialogEu favoriteEditDialog = _StringsDialogsFavoriteEditDialogEu._(_root);
	@override late final _StringsDialogsFileInfoEu fileInfo = _StringsDialogsFileInfoEu._(_root);
	@override late final _StringsDialogsFileNameInputEu fileNameInput = _StringsDialogsFileNameInputEu._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedEu localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedEu._(_root);
	@override late final _StringsDialogsMessageInputEu messageInput = _StringsDialogsMessageInputEu._(_root);
	@override late final _StringsDialogsNoFilesEu noFiles = _StringsDialogsNoFilesEu._(_root);
	@override late final _StringsDialogsNoPermissionEu noPermission = _StringsDialogsNoPermissionEu._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformEu notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformEu._(_root);
	@override late final _StringsDialogsQrEu qr = _StringsDialogsQrEu._(_root);
	@override late final _StringsDialogsQuickActionsEu quickActions = _StringsDialogsQuickActionsEu._(_root);
	@override late final _StringsDialogsQuickSaveNoticeEu quickSaveNotice = _StringsDialogsQuickSaveNoticeEu._(_root);
	@override late final _StringsDialogsSendModeHelpEu sendModeHelp = _StringsDialogsSendModeHelpEu._(_root);
}

// Path: tray
class _StringsTrayEu extends _StringsTrayEn {
	_StringsTrayEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Itxi LocalSend';
}

// Path: web
class _StringsWebEu extends _StringsWebEn {
	_StringsWebEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Bertan behera utzita';
	@override String get files => 'Fitxategiak';
	@override String get fileName => 'Fitxateig izena';
	@override String get size => 'Tamaina';
}

// Path: assetPicker
class _StringsAssetPickerEu extends _StringsAssetPickerEn {
	_StringsAssetPickerEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Baieztatu';
	@override String get cancel => 'Utzi';
	@override String get edit => 'Editatu';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Akatsa kargatzen';
	@override String get original => 'Jatorrizkoa';
	@override String get preview => 'Aurrebista';
	@override String get select => 'Aukeratu';
	@override String get emptyList => 'Zerrenda hutsik';
	@override String get unSupportedAssetType => 'Fitxategi mota ez onartua.';
	@override String get unableToAccessAll => 'Ezin da gailuko fitxategietara atzitu.';
	@override String get viewingLimitedAssetsTip => 'Ikusi bakarrik aplikazioarentzat eskuragarri dauden fitxategi eta albumak.';
	@override String get changeAccessibleLimitedAssets => 'Egin klik eskuragarri dauden fitxategiak eguneratzeko';
	@override String get accessAllTip => 'Aplikazioak gailu fitxategi batzuk bakarrik atzitu ditzake. Joan sistemako ezarpenetara eta eman aplikazioari media fitxategi guztiak atzitzeko baimena';
	@override String get goToSystemSettings => 'Joan sistemako ezarpenetara';
	@override String get accessLimitedAssets => 'Jarraitu atzipen mugatuarekin';
	@override String get accessiblePathName => 'Eskuragarri dauden fitxategiak';
	@override String get sTypeAudioLabel => 'Audioa';
	@override String get sTypeImageLabel => 'Irudia';
	@override String get sTypeVideoLabel => 'Bideoa';
	@override String get sTypeOtherLabel => 'Bestelako medioak';
	@override String get sActionPlayHint => 'erreproduzitu';
	@override String get sActionPreviewHint => 'aurrebista';
	@override String get sActionSelectHint => 'aukeratu';
	@override String get sActionSwitchPathLabel => 'aldatu bidea';
	@override String get sActionUseCameraHint => 'erabaili kamera';
	@override String get sNameDurationLabel => 'iraupena';
	@override String get sUnitAssetCountLabel => 'kontaketa';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxEu extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Portua:';
	@override String get alias => 'Aliasa:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionEu extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aukeraketa';
	@override String files({required Object files}) => 'Fitxategiak: ${files}';
	@override String size({required Object size}) => 'Tamaina: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerEu extends _StringsSendTabPickerEn {
	_StringsSendTabPickerEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fitxategia';
	@override String get folder => 'Direktorioa';
	@override String get media => 'Media';
	@override String get text => 'Testua';
	@override String get app => 'App';
	@override String get clipboard => 'Itsatsi';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesEu extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get single => 'Hartzaile bakarra';
	@override String get multiple => 'Hartzaile anitz';
	@override String get link => 'Lotura elkarbanatu';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralEu extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Orokorra';
	@override String get brightness => 'Argitasuna';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsEu brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsEu._(_root);
	@override String get color => 'Kolorea';
	@override late final _StringsSettingsTabGeneralColorOptionsEu colorOptions = _StringsSettingsTabGeneralColorOptionsEu._(_root);
	@override String get language => 'Hizkuntza';
	@override late final _StringsSettingsTabGeneralLanguageOptionsEu languageOptions = _StringsSettingsTabGeneralLanguageOptionsEu._(_root);
	@override String get saveWindowPlacement => 'Ateratzean gorde lehioaren kokapena';
	@override String get minimizeToTray => 'Itxi: txikitu lehioa';
	@override String get launchAtStartup => 'Hasieratze automatikoa';
	@override String get launchMinimized => 'Hasieratze automatikoa: hasi txikituta';
	@override String get animations => 'Animazioak';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveEu extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eskuratu';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Hartzailea';
	@override String get downloads => '(Deskargak)';
	@override String get saveToGallery => 'Gorde galerian';
	@override String get saveToHistory => 'Gorde historialean';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkEu extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gorria';
	@override String get needRestart => 'Berrabiarazi zerbitzaria aldaketak aplikatzeko.';
	@override String get server => 'Zerbitzaria';
	@override String get alias => 'Aliasa';
	@override String get deviceType => 'Gailu mota';
	@override String get deviceModel => 'Gailu modeloa';
	@override String get port => 'Portua';
	@override String portWarning({required Object defaultPort}) => 'Portu berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango (Lehenetsitako portua: ${defaultPort})';
	@override String get encryption => 'Zifratzea';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Multicast helbide berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango. (Lehenetsitako multicast helbidea: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallEu extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aplikazio honek fitxategiak bidal ditzake beste gailuei, baina beste gailuek ezin ditzakete fitxategiak bidali gailu honetara.';
	@override String solution({required Object port}) => 'Suhesiarekin erlazionatutako arazo bat izen liteke. ${port} portura sarrerako konexioak (UDP eta TCP) onartuz konpon dezakezu.';
	@override String get openFirewall => 'Ireki Suhesia';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionEu extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Hartzaile eta bidaltzaileak ez dute elkar ikusten eta ezin diote fitxategiak elkarri bidali';
	@override String get solution => 'Bi aldeetan dago arazoa? Ziurtatu Wi-Fi sare berdinean kokatuta daudela eta konfigurazio bera elkarbanatzen dutela (portua, multicast helbidea, zifratua). Arazoa Wi-Fi sareak partaideen arteko konexioak mugatzea ere izan liteke. Horrela bada, routerrean aukera hau aktibatu';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsEu extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get open => 'Ireki fitxategia';
	@override String get info => 'Informazioa';
	@override String get deleteFromHistory => 'Ezabatu historia';
}

// Path: progressPage.total
class _StringsProgressPageTotalEu extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleEu title = _StringsProgressPageTotalTitleEu._(_root);
	@override String count({required Object curr, required Object n}) => 'Fitxategiak: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Tamaina: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Abiadura: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileEu extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gehitu aukeraketari';
	@override String get content => 'Zer gehitu nahi duzu?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputEu extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sartu helbidea';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP Helbidea';
	@override String get recentlyUsed => 'Duela gutxi erabilitakoak: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionEu extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bertan behera utzi fitxategi bidalketa';
	@override String get content => '¿Benetan nahi duzu bertan behera utzi fitxategi bidalketa?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileEu extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ezin da fitxategia ireki';
	@override String content({required Object file}) => 'Ezin izan da "${file}" fitxategia ireki. Agian mugitu, berizendatu edo ezabatu egin da?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeEu extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zifratua ezgaituta';
	@override String get content => 'Orain komunikazioa zifratu gabeko HTTP konexioaren bidez egiten ari da. HTTPS erailtzeko, gaitu berriro zifratua';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogEu extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogEu extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gogokoak';
	@override String get noFavorites => 'Ez dago gogoko gailurik.';
	@override String get addFavorite => 'Gehitu';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogEu extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ezabatu gogokoetatik';
	@override String content({required Object name}) => 'Benetan nahi duzu "${name}" gogokoetatik ezabatu?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogEu extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Gehitu gogokoetara';
	@override String get titleEdit => 'Doitu';
	@override String get name => 'Aliasa';
	@override String get auto => '(auto)';
	@override String get ip => 'IP Helbidea';
	@override String get port => 'Portua';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoEu extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fitxategiari buruzko informazioa';
	@override String get fileName => 'Fitxategiaren izena:';
	@override String get path => 'Bidea:';
	@override String get size => 'Tamaina:';
	@override String get sender => 'Bidaltzailea:';
	@override String get time => 'Ordua:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputEu extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sartu izena';
	@override String original({required Object original}) => 'Jatorrizkoa: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedEu extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'Sare lokala eskaneatzeko baimenik gabe, LocalSend-ek ezin ditu inguruko gailuak aurkitu. Mesedez, onartu baimen hau ezarpenetan.';
	@override String get gotoSettings => 'Ezarpenak';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputEu extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idatzi mezu bat';
	@override String get multiline => 'Lerro anitz';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesEu extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ez da fitxategirik aukeratu';
	@override String get content => 'Mesedez aukeratu gutxienez fitxategi bat.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionEu extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Baimenik gabe';
	@override String get content => 'Ez dituzu beharrezko baimenak onartu. Mesedez, onartu itzazu ezarpenetan.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformEu extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ez dago eskuragarri';
	@override String get content => 'Ezaugarri hau hurrengo plataforman bakarrik dago eskuragarri:';
}

// Path: dialogs.qr
class _StringsDialogsQrEu extends _StringsDialogsQrEn {
	_StringsDialogsQrEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Kodea';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsEu extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ekintza azkarrak';
	@override String get counter => 'Kontagailua';
	@override String get prefix => 'Aurrizkia';
	@override String get padZero => 'Hutsekin osatu';
	@override String get sortBeforeCount => 'Aldez aurretik alfabetikoki ordenatu';
	@override String get random => 'Ausazkoa';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeEu extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Fitxategi eskaerak automatikoki onartzen dira. Kontutan izan sare lokaleko edonork bidali ahal izango dizkizula fitxategiak.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpEu extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bidalketa moduak';
	@override String get single => 'Bidali fitxategiak hartzaile bakar bati. Bidalketa bukatutakoan aukeraketa garbituko da.';
	@override String get multiple => 'Bidali fitxategiak hartzaile anitzeri. Aukeraketa ez da garbituko.';
	@override String get link => 'LocalSend instalatuta ez duten hartzaileak fitxategiak eskuratu ahali zango dituzte lotura nabigatzailean zabalduz.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsEu extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Iluna';
	@override String get light => 'Argia';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsEu extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsEu extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleEu extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleEu._(_StringsEu root) : this._root = root, super._(root);

	@override final _StringsEu _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Aurrerapena (${time})';
	@override String get finishedError => 'Akatsarekin amaitu da';
	@override String get canceledSender => 'Bidaltzaileak bertan behera utzita';
	@override String get canceledReceiver => 'Hartzaileak bertan behera utzita';
}
