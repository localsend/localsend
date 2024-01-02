part of 'strings.g.dart';

// Path: <root>
class _StringsHu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.hu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <hu>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsHu _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Magyar';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralHu general = _StringsGeneralHu._(_root);
	@override late final _StringsReceiveTabHu receiveTab = _StringsReceiveTabHu._(_root);
	@override late final _StringsSendTabHu sendTab = _StringsSendTabHu._(_root);
	@override late final _StringsSettingsTabHu settingsTab = _StringsSettingsTabHu._(_root);
	@override late final _StringsTroubleshootPageHu troubleshootPage = _StringsTroubleshootPageHu._(_root);
	@override late final _StringsReceiveHistoryPageHu receiveHistoryPage = _StringsReceiveHistoryPageHu._(_root);
	@override late final _StringsApkPickerPageHu apkPickerPage = _StringsApkPickerPageHu._(_root);
	@override late final _StringsSelectedFilesPageHu selectedFilesPage = _StringsSelectedFilesPageHu._(_root);
	@override late final _StringsReceivePageHu receivePage = _StringsReceivePageHu._(_root);
	@override late final _StringsReceiveOptionsPageHu receiveOptionsPage = _StringsReceiveOptionsPageHu._(_root);
	@override late final _StringsSendPageHu sendPage = _StringsSendPageHu._(_root);
	@override late final _StringsProgressPageHu progressPage = _StringsProgressPageHu._(_root);
	@override late final _StringsWebSharePageHu webSharePage = _StringsWebSharePageHu._(_root);
	@override late final _StringsAboutPageHu aboutPage = _StringsAboutPageHu._(_root);
	@override late final _StringsDonationPageHu donationPage = _StringsDonationPageHu._(_root);
	@override late final _StringsChangelogPageHu changelogPage = _StringsChangelogPageHu._(_root);
	@override late final _StringsAliasGeneratorHu aliasGenerator = _StringsAliasGeneratorHu._(_root);
	@override late final _StringsDialogsHu dialogs = _StringsDialogsHu._(_root);
	@override late final _StringsTrayHu tray = _StringsTrayHu._(_root);
	@override late final _StringsWebHu web = _StringsWebHu._(_root);
	@override late final _StringsAssetPickerHu assetPicker = _StringsAssetPickerHu._(_root);
}

// Path: general
class _StringsGeneralHu extends _StringsGeneralEn {
	_StringsGeneralHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Elfogad';
	@override String get accepted => 'Elfogadva';
	@override String get add => 'Hozzáad';
	@override String get advanced => 'Haladó';
	@override String get cancel => 'Mégse';
	@override String get close => 'Bezár';
	@override String get confirm => 'Megerősít';
	@override String get continueStr => 'Folytat';
	@override String get copy => 'Másol';
	@override String get copiedToClipboard => 'Másolva a vágólapra';
	@override String get decline => 'Elutasít';
	@override String get done => 'Kész';
	@override String get delete => 'Törlés';
	@override String get edit => 'Szerkeszt';
	@override String get error => 'Hiba';
	@override String get example => 'Példa';
	@override String get files => 'Fájlok';
	@override String get finished => 'Befejezve';
	@override String get hide => 'Elrejt';
	@override String get off => 'Ki';
	@override String get offline => 'Offline';
	@override String get on => 'Be';
	@override String get online => 'Online';
	@override String get open => 'Megnyit';
	@override String get queue => 'Várósor';
	@override String get quickSave => 'Autom. mentés';
	@override String get renamed => 'Átnevezve';
	@override String get reset => 'Reset';
	@override String get restart => 'Újraindít';
	@override String get settings => 'Beállítások';
	@override String get skipped => 'Kihagyva';
	@override String get start => 'Start';
	@override String get stop => 'Stop';
	@override String get save => 'Ment';
	@override String get unchanged => 'Változatlan';
	@override String get unknown => 'Ismeretlen';
	@override String get noItemInClipboard => 'Nincs semmi a vágólapon';
}

// Path: receiveTab
class _StringsReceiveTabHu extends _StringsReceiveTabEn {
	_StringsReceiveTabHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fogadás';
	@override late final _StringsReceiveTabInfoBoxHu infoBox = _StringsReceiveTabInfoBoxHu._(_root);
}

// Path: sendTab
class _StringsSendTabHu extends _StringsSendTabEn {
	_StringsSendTabHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Küldés';
	@override late final _StringsSendTabSelectionHu selection = _StringsSendTabSelectionHu._(_root);
	@override late final _StringsSendTabPickerHu picker = _StringsSendTabPickerHu._(_root);
	@override String get shareIntentInfo => 'A fájlok könnyebb kiválasztásához használhatja mobileszköze "Megosztás" funkcióját is.';
	@override String get nearbyDevices => 'Közeli eszközök';
	@override String get thisDevice => 'Ez az eszköz';
	@override String get scan => 'Keressen eszközöket';
	@override String get sendMode => 'Küldési mód';
	@override late final _StringsSendTabSendModesHu sendModes = _StringsSendTabSendModesHu._(_root);
	@override String get sendModeHelp => 'Magyarázat';
	@override String get help => 'Győződjön meg arról, hogy a kívánt eszköz is ugyanazon a wifi hálózaton van.';
	@override String get placeItems => 'Helyezze el a megosztandó elemeket.';
}

// Path: settingsTab
class _StringsSettingsTabHu extends _StringsSettingsTabEn {
	_StringsSettingsTabHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Beállítások';
	@override late final _StringsSettingsTabGeneralHu general = _StringsSettingsTabGeneralHu._(_root);
	@override late final _StringsSettingsTabReceiveHu receive = _StringsSettingsTabReceiveHu._(_root);
	@override late final _StringsSettingsTabNetworkHu network = _StringsSettingsTabNetworkHu._(_root);
	@override late final _StringsSettingsTabOtherHu other = _StringsSettingsTabOtherHu._(_root);
	@override String get advancedSettings => 'Haladó beállítások';
}

// Path: troubleshootPage
class _StringsTroubleshootPageHu extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hibaelhárítás';
	@override String get subTitle => 'Az alkalmazás nem a várt módon működik? Itt találhat általános megoldásokat.';
	@override String get solution => 'Megoldás:';
	@override String get fixButton => 'Autom. javítás';
	@override late final _StringsTroubleshootPageFirewallHu firewall = _StringsTroubleshootPageFirewallHu._(_root);
	@override late final _StringsTroubleshootPageNoConnectionHu noConnection = _StringsTroubleshootPageNoConnectionHu._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageHu extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Előzmény';
	@override String get openFolder => 'Mappa megnyitása';
	@override String get deleteHistory => 'Előzmény törlése';
	@override String get empty => 'Még nincs előzmény.';
	@override late final _StringsReceiveHistoryPageEntryActionsHu entryActions = _StringsReceiveHistoryPageEntryActionsHu._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageHu extends _StringsApkPickerPageEn {
	_StringsApkPickerPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Appok (APK)';
	@override String get excludeSystemApps => 'Rendszeralkalmazások kizárása';
	@override String get excludeAppsWithoutLaunchIntent => 'A nem indítható alkalmazások kizárása';
	@override String apps({required Object n}) => '${n} app';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageHu extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Összes törlése';
}

// Path: receivePage
class _StringsReceivePageHu extends _StringsReceivePageEn {
	_StringsReceivePageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hu'))(n,
		one: 'fájlt szeretne küldeni',
		other: '${n} fájlt szeretne küldeni',
	);
	@override String get subTitleMessage => 'üzenetet küldött:';
	@override String get subTitleLink => 'Linket küldött:';
	@override String get canceled => 'A küldő visszavonta a kérést.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageHu extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciók';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend mappa)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Automatikusan kikapcsol, mert vannak könyvtárak.';
}

// Path: sendPage
class _StringsSendPageHu extends _StringsSendPageEn {
	_StringsSendPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Válaszra várva...';
	@override String get rejected => 'A fogadó elutasította a kérelmet.';
	@override String get busy => 'A fogadó más kéréssel van elfoglalva.';
}

// Path: progressPage
class _StringsProgressPageHu extends _StringsProgressPageEn {
	_StringsProgressPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Fájlok küldése';
	@override String get titleReceiving => 'Fájlok fogadása';
	@override String get savedToGallery => 'Mentve a Galériába';
	@override late final _StringsProgressPageTotalHu total = _StringsProgressPageTotalHu._(_root);
}

// Path: webSharePage
class _StringsWebSharePageHu extends _StringsWebSharePageEn {
	_StringsWebSharePageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Megosztás linkben';
	@override String get loading => 'Szerver indítása...';
	@override String get stopping => 'Szerver leállítása...';
	@override String get error => 'Hiba történt a szerver indításakor.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hu'))(n,
		one: 'Nyissa meg ezt a hivatkozást böngészőben:',
		other: 'Nyissa meg a linkek egyikét a böngészőben:',
	);
	@override String get requests => 'Kérések';
	@override String get noRequests => 'Még nincsenek kérések.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'A LocalSend a saját aláírt tanúsítványt használja. A böngészőben kell elfogadnod.';
	@override String pendingRequests({required Object n}) => 'Függőben lévő kérések: ${n}';
}

// Path: aboutPage
class _StringsAboutPageHu extends _StringsAboutPageEn {
	_StringsAboutPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'A LocalSend';
	@override List<String> get description => [
		'A LocalSend egy ingyenes, nyílt forráskódú alkalmazás, amely lehetővé teszi a fájlok és üzenetek biztonságos megosztását a közeli eszközökkel a helyi hálózaton keresztül, internet kapcsolat nélkül.',
		'Ez az alkalmazás Android, iOS, macOS, Windows és Linux rendszereken érhető el. Az összes letöltési lehetőséget megtalálja a hivatalos honlapon.',
	];
	@override String get author => 'Szerző';
	@override String get contributors => 'Közreműködők';
	@override String get translators => 'Fordítók';
}

// Path: donationPage
class _StringsDonationPageHu extends _StringsDonationPageEn {
	_StringsDonationPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adomány';
	@override String get info => 'A LocalSend ingyenes, nyílt forráskódú és hirdetések nélküli. Ha megtetszett az alkalmazás, adományával támogathatja a fejlesztést.';
	@override String donate({required Object amount}) => 'Adomány ${amount}';
	@override String get thanks => 'Köszönöm szépen!';
	@override String get restore => 'Vásárlás visszaállítása';
}

// Path: changelogPage
class _StringsChangelogPageHu extends _StringsChangelogPageEn {
	_StringsChangelogPageHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Változásnapló';
}

// Path: aliasGenerator
class _StringsAliasGeneratorHu extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsHu extends _StringsDialogsEn {
	_StringsDialogsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileHu addFile = _StringsDialogsAddFileHu._(_root);
	@override late final _StringsDialogsAddressInputHu addressInput = _StringsDialogsAddressInputHu._(_root);
	@override late final _StringsDialogsCancelSessionHu cancelSession = _StringsDialogsCancelSessionHu._(_root);
	@override late final _StringsDialogsCannotOpenFileHu cannotOpenFile = _StringsDialogsCannotOpenFileHu._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeHu encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeHu._(_root);
	@override late final _StringsDialogsErrorDialogHu errorDialog = _StringsDialogsErrorDialogHu._(_root);
	@override late final _StringsDialogsFavoriteDialogHu favoriteDialog = _StringsDialogsFavoriteDialogHu._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogHu favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogHu._(_root);
	@override late final _StringsDialogsFavoriteEditDialogHu favoriteEditDialog = _StringsDialogsFavoriteEditDialogHu._(_root);
	@override late final _StringsDialogsFileInfoHu fileInfo = _StringsDialogsFileInfoHu._(_root);
	@override late final _StringsDialogsFileNameInputHu fileNameInput = _StringsDialogsFileNameInputHu._(_root);
	@override late final _StringsDialogsHistoryClearDialogHu historyClearDialog = _StringsDialogsHistoryClearDialogHu._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedHu localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedHu._(_root);
	@override late final _StringsDialogsMessageInputHu messageInput = _StringsDialogsMessageInputHu._(_root);
	@override late final _StringsDialogsNoFilesHu noFiles = _StringsDialogsNoFilesHu._(_root);
	@override late final _StringsDialogsNoPermissionHu noPermission = _StringsDialogsNoPermissionHu._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformHu notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformHu._(_root);
	@override late final _StringsDialogsQrHu qr = _StringsDialogsQrHu._(_root);
	@override late final _StringsDialogsQuickActionsHu quickActions = _StringsDialogsQuickActionsHu._(_root);
	@override late final _StringsDialogsQuickSaveNoticeHu quickSaveNotice = _StringsDialogsQuickSaveNoticeHu._(_root);
	@override late final _StringsDialogsSendModeHelpHu sendModeHelp = _StringsDialogsSendModeHelpHu._(_root);
}

// Path: tray
class _StringsTrayHu extends _StringsTrayEn {
	_StringsTrayHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Kilépés';
}

// Path: web
class _StringsWebHu extends _StringsWebEn {
	_StringsWebHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Elutasítva';
	@override String get files => 'Fájl';
	@override String get fileName => 'Fájlnév';
	@override String get size => 'Méret';
}

// Path: assetPicker
class _StringsAssetPickerHu extends _StringsAssetPickerEn {
	_StringsAssetPickerHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Megerősít';
	@override String get cancel => 'Mégse';
	@override String get edit => 'Szerkeszt';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'A betöltés sikertelen';
	@override String get original => 'Eredeti';
	@override String get preview => 'Előnézet';
	@override String get select => 'Válasszon';
	@override String get emptyList => 'Üres lista';
	@override String get unSupportedAssetType => 'Nem támogatott fájl típus.';
	@override String get unableToAccessAll => 'Nem lehet hozzáférni az eszközön lévő összes fájlhoz';
	@override String get viewingLimitedAssetsTip => 'Csak az app által elérhető fájlok és albumok megtekintése.';
	@override String get changeAccessibleLimitedAssets => 'Koppintson az elérhető fájlok frissítéséhez';
	@override String get accessAllTip => 'Az alkalmazás csak néhány fájlhoz férhet hozzá az eszközön. Nyissa meg a rendszerbeállításokat és engedélyezze az alkalmazás számára, hogy hozzáférjen az eszközön lévő összes médiafájlhoz.';
	@override String get goToSystemSettings => 'Lépjen a rendszer beállításaihoz';
	@override String get accessLimitedAssets => 'Folytassa korlátozott hozzáféréssel';
	@override String get accessiblePathName => 'Elérhető fájlok';
	@override String get sTypeAudioLabel => 'Audió';
	@override String get sTypeImageLabel => 'Kép';
	@override String get sTypeVideoLabel => 'Videó';
	@override String get sTypeOtherLabel => 'Egyéb média';
	@override String get sActionPlayHint => 'lejátszás';
	@override String get sActionPreviewHint => 'előnézet';
	@override String get sActionSelectHint => 'választás';
	@override String get sActionSwitchPathLabel => 'útvonal módosítás';
	@override String get sActionUseCameraHint => 'használjon kamerát';
	@override String get sNameDurationLabel => 'időtartam';
	@override String get sUnitAssetCountLabel => 'számol';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxHu extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Álnév:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionHu extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kiválasztás';
	@override String files({required Object files}) => 'Fájl(ok): ${files}';
	@override String size({required Object size}) => 'Méret: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerHu extends _StringsSendTabPickerEn {
	_StringsSendTabPickerHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fájl';
	@override String get folder => 'Mappa';
	@override String get media => 'Média';
	@override String get text => 'Szöveg';
	@override String get app => 'App';
	@override String get clipboard => 'Beillesztés';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesHu extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get single => 'Egyetlen címzett';
	@override String get multiple => 'Több címzett';
	@override String get link => 'Megosztás linkben';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralHu extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Általános';
	@override String get brightness => 'Fényerő';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsHu brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsHu._(_root);
	@override String get color => 'Színek';
	@override late final _StringsSettingsTabGeneralColorOptionsHu colorOptions = _StringsSettingsTabGeneralColorOptionsHu._(_root);
	@override String get language => 'Nyelv';
	@override late final _StringsSettingsTabGeneralLanguageOptionsHu languageOptions = _StringsSettingsTabGeneralLanguageOptionsHu._(_root);
	@override String get saveWindowPlacement => 'Kilépés: Ablak pozíció mentése';
	@override String get minimizeToTray => 'Kilépés: Minimalizálja a tálcára';
	@override String get launchAtStartup => 'Auto. indítás bejelentkezés után';
	@override String get launchMinimized => 'Auto. indítás: Kis méretben';
	@override String get animations => 'Animációk';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveHu extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fogadás';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Autom. befejezés';
	@override String get destination => 'Mentés helye';
	@override String get downloads => '(Letöltések)';
	@override String get saveToGallery => 'Média mentése a galériába';
	@override String get saveToHistory => 'Mentés az előzmények közé';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkHu extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hálózat';
	@override String get needRestart => 'A beállítások alkalmazásához indítsa újra a szervert!';
	@override String get server => 'Szerver';
	@override String get alias => 'Álnév';
	@override String get deviceType => 'Eszköz típusa';
	@override String get deviceModel => 'Eszköz modell';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Előfordulhat, hogy más eszközök nem észlelik eszközét, mert egyéni portot használ. (alapértelmezett: ${defaultPort})';
	@override String get encryption => 'Titkosítás';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Előfordulhat, hogy más eszközök nem észlelik eszközét, mert egyéni multicast címet használ. (alapérték: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherHu extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Egyéb';
	@override String get support => 'LocalSend támogatás';
	@override String get donate => 'Adomány';
	@override String get privacyPolicy => 'Adatvédelmi irányelvek';
	@override String get termsOfUse => 'Használati feltételek';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallHu extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ez az alkalmazás képes fájlokat küldeni más eszközökre, de más eszközök nem küldhetnek fájlokat erre az eszközre.';
	@override String solution({required Object port}) => 'Ez valószínűleg tűzfal probléma. Ezt úgy oldhatja meg, hogy engedélyezi a bejövő kapcsolatokat (UDP és TCP) a ${port} porton.';
	@override String get openFirewall => 'Tűzfal megnyitás';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionHu extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'A két eszköz nem tudja felismerni egymást, és nem tud fájlokat megosztani.';
	@override String get solution => 'A probléma mindkét oldalon létezik? Akkor meg kell győződnie arról, hogy mindkét eszköz ugyanabban a wifi hálózatban van, és ugyanazt a konfigurációt használja (port, multicast cím, titkosítás). Előfordulhat, hogy a Wifi nem teszi lehetővé a résztvevők közötti kommunikációt. Ebben az esetben ezt az opciót engedélyezni kell a routeren..';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsHu extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get open => 'Fájl megnyitás';
	@override String get info => 'Információ';
	@override String get deleteFromHistory => 'Törlés az előzményből';
}

// Path: progressPage.total
class _StringsProgressPageTotalHu extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleHu title = _StringsProgressPageTotalTitleHu._(_root);
	@override String count({required Object curr, required Object n}) => 'Fájl: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Méret: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Sebesség: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileHu extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hozzáadás a kijelöléshez';
	@override String get content => 'Mit szeretne hozzáfűzni?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputHu extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adja meg a címet';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP cím';
	@override String get recentlyUsed => 'Nemrég használt: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionHu extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fájlátvitel megszakítása';
	@override String get content => 'Valóban meg akarja szakítani a fájlátvitelt?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileHu extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'A fájl nem nyitható meg';
	@override String content({required Object file}) => 'Nem sikerült megnyitni a(z) "${file}" fájlt. A fájlt áthelyezték, átnevezték vagy törölték?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeHu extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'A titkosítás letiltva';
	@override String get content => 'A kommunikáció most a titkosítatlan HTTP protokollon keresztül történik. A HTTPS használatához engedélyezze újra a titkosítást.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogHu extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogHu extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kedvencek';
	@override String get noFavorites => 'Nincsenek még kedvenc eszközök.';
	@override String get addFavorite => 'Hozzáadás';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogHu extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Törlés a kedvencek közül';
	@override String content({required Object name}) => 'Tényleg törölni szeretnéd a "${name}" a kedvencek közül?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogHu extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Hozzáadás a kedvencekhez';
	@override String get titleEdit => 'Beállítás';
	@override String get name => 'Álnév';
	@override String get auto => '(auto)';
	@override String get ip => 'IP cím';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoHu extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fájl információ';
	@override String get fileName => 'Fájl neve:';
	@override String get path => 'Útvonal:';
	@override String get size => 'Méret:';
	@override String get sender => 'Küldő:';
	@override String get time => 'Idő:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputHu extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Írja be a fájl nevét';
	@override String original({required Object original}) => 'Eredeti: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogHu extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Előzmény törlése';
	@override String get content => 'Biztosan törölni szeretné a teljes előzményt?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedHu extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'A LocalSend nem találhat más eszközöket a helyi hálózat vizsgálatára vonatkozó engedély nélkül. Adja meg ezt az engedélyt a beállításokban.';
	@override String get gotoSettings => 'Beállítások';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputHu extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Írja be az üzenetét';
	@override String get multiline => 'Több soros';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesHu extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nincs fájl kiválasztva';
	@override String get content => 'Kérjük válasszon legalább egy fájlt.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionHu extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nem engedélyezett';
	@override String get content => 'Nem adtál megfelelő engedélyeket. Kérlek engedélyezd őket a beállításokban.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformHu extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nem érhető el';
	@override String get content => 'Ez a funkció csak itt érhető el:';
}

// Path: dialogs.qr
class _StringsDialogsQrHu extends _StringsDialogsQrEn {
	_StringsDialogsQrHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-kód';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsHu extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gyors műveletek';
	@override String get counter => 'Számláló';
	@override String get prefix => 'Előtag';
	@override String get padZero => 'Kitöltés nullákkal';
	@override String get sortBeforeCount => 'Előzetesen rendezze ábécé sorrendbe';
	@override String get random => 'Véletlen';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeHu extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'A fájlkérések autom. elfogadásra kerülnek. Ügyeljen arra, hogy a helyi hálózaton mindenki küldhet Önnek fájlokat.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpHu extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Küldési módok';
	@override String get single => 'Fájlokat küld egy címzettnek. Az átvitel befejezése után a kijelölés törlődik.';
	@override String get multiple => 'Fájlokat küld több címzettnek. A kijelölés nem törlődik.';
	@override String get link => 'Azok a címzettek, akiknél nincs telepítve a LocalSend, letölthetik a kiválasztott fájlokat a hivatkozás megnyitásával a böngészőjükben.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsHu extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
	@override String get dark => 'Sötét';
	@override String get light => 'Világos';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsHu extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsHu extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleHu extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Teljes folyamat (${time})';
	@override String get finishedError => 'Hibával befejezve';
	@override String get canceledSender => 'A küldő törölte';
	@override String get canceledReceiver => 'A fogadó törölte';
}
