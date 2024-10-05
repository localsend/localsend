///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsMs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsMs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ms,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ms>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsMs _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Bahasa Melayu';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralMs general = _StringsGeneralMs._(_root);
	@override late final _StringsReceiveTabMs receiveTab = _StringsReceiveTabMs._(_root);
	@override late final _StringsSendTabMs sendTab = _StringsSendTabMs._(_root);
	@override late final _StringsSettingsTabMs settingsTab = _StringsSettingsTabMs._(_root);
	@override late final _StringsTroubleshootPageMs troubleshootPage = _StringsTroubleshootPageMs._(_root);
	@override late final _StringsReceiveHistoryPageMs receiveHistoryPage = _StringsReceiveHistoryPageMs._(_root);
	@override late final _StringsApkPickerPageMs apkPickerPage = _StringsApkPickerPageMs._(_root);
	@override late final _StringsSelectedFilesPageMs selectedFilesPage = _StringsSelectedFilesPageMs._(_root);
	@override late final _StringsReceivePageMs receivePage = _StringsReceivePageMs._(_root);
	@override late final _StringsReceiveOptionsPageMs receiveOptionsPage = _StringsReceiveOptionsPageMs._(_root);
	@override late final _StringsSendPageMs sendPage = _StringsSendPageMs._(_root);
	@override late final _StringsProgressPageMs progressPage = _StringsProgressPageMs._(_root);
	@override late final _StringsWebSharePageMs webSharePage = _StringsWebSharePageMs._(_root);
	@override late final _StringsAboutPageMs aboutPage = _StringsAboutPageMs._(_root);
	@override late final _StringsDonationPageMs donationPage = _StringsDonationPageMs._(_root);
	@override late final _StringsChangelogPageMs changelogPage = _StringsChangelogPageMs._(_root);
	@override late final _StringsAliasGeneratorMs aliasGenerator = _StringsAliasGeneratorMs._(_root);
	@override late final _StringsDialogsMs dialogs = _StringsDialogsMs._(_root);
	@override late final _StringsTrayMs tray = _StringsTrayMs._(_root);
	@override late final _StringsWebMs web = _StringsWebMs._(_root);
	@override late final _StringsAssetPickerMs assetPicker = _StringsAssetPickerMs._(_root);
	@override late final _StringsSanitizationMs sanitization = _StringsSanitizationMs._(_root);
}

// Path: general
class _StringsGeneralMs extends _StringsGeneralEn {
	_StringsGeneralMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Terima';
	@override String get accepted => 'Diterima';
	@override String get add => 'Tambah';
	@override String get advanced => 'Lanjutan';
	@override String get cancel => 'Batal';
	@override String get close => 'Tutup';
	@override String get confirm => 'Sahkan';
	@override String get continueStr => 'Teruskan';
	@override String get copy => 'Salin';
	@override String get copiedToClipboard => 'Disalin ke papan keratan';
	@override String get decline => 'Tolak';
	@override String get done => 'Selesai';
	@override String get delete => 'Padam';
	@override String get edit => 'Edit';
	@override String get error => 'Ralat';
	@override String get example => 'Contoh';
	@override String get files => 'Fail';
	@override String get finished => 'Selesai';
	@override String get hide => 'Sembunyi';
	@override String get off => 'Mati';
	@override String get offline => 'Luar talian';
	@override String get on => 'Hidup';
	@override String get online => 'Dalam talian';
	@override String get open => 'Buka';
	@override String get queue => 'Baris gilir';
	@override String get quickSave => 'Simpan Cepat';
	@override String get quickSaveFromFavorites => 'Simpan Cepat dari "Kegemaran"';
	@override String get renamed => 'Dinamakan semula';
	@override String get reset => 'Set semula';
	@override String get restart => 'Mula semula';
	@override String get settings => 'Tetapan';
	@override String get skipped => 'Dilangkau';
	@override String get start => 'Mula';
	@override String get stop => 'Berhenti';
	@override String get save => 'Simpan';
	@override String get unchanged => 'Tidak berubah';
	@override String get unknown => 'Tidak diketahui';
	@override String get noItemInClipboard => 'Tiada item dalam papan keratan.';
}

// Path: receiveTab
class _StringsReceiveTabMs extends _StringsReceiveTabEn {
	_StringsReceiveTabMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Terima';
	@override late final _StringsReceiveTabInfoBoxMs infoBox = _StringsReceiveTabInfoBoxMs._(_root);
}

// Path: sendTab
class _StringsSendTabMs extends _StringsSendTabEn {
	_StringsSendTabMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hantar';
	@override late final _StringsSendTabSelectionMs selection = _StringsSendTabSelectionMs._(_root);
	@override late final _StringsSendTabPickerMs picker = _StringsSendTabPickerMs._(_root);
	@override String get shareIntentInfo => 'Anda juga boleh menggunakan ciri "Kongsi" peranti mudah alih anda untuk memilih fail dengan lebih mudah.';
	@override String get nearbyDevices => 'Peranti berdekatan';
	@override String get thisDevice => 'Peranti Ini';
	@override String get scan => 'Cari peranti';
	@override String get manualSending => 'Penghantaran manual';
	@override String get sendMode => 'Mod penghantaran';
	@override late final _StringsSendTabSendModesMs sendModes = _StringsSendTabSendModesMs._(_root);
	@override String get sendModeHelp => 'Penerangan';
	@override String get help => 'Sila pastikan sasaran yang diingini juga berada dalam rangkaian Wi-Fi yang sama.';
	@override String get placeItems => 'Letakkan item untuk dikongsi.';
}

// Path: settingsTab
class _StringsSettingsTabMs extends _StringsSettingsTabEn {
	_StringsSettingsTabMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tetapan';
	@override late final _StringsSettingsTabGeneralMs general = _StringsSettingsTabGeneralMs._(_root);
	@override late final _StringsSettingsTabReceiveMs receive = _StringsSettingsTabReceiveMs._(_root);
	@override late final _StringsSettingsTabSendMs send = _StringsSettingsTabSendMs._(_root);
	@override late final _StringsSettingsTabNetworkMs network = _StringsSettingsTabNetworkMs._(_root);
	@override late final _StringsSettingsTabOtherMs other = _StringsSettingsTabOtherMs._(_root);
	@override String get advancedSettings => 'Tetapan lanjutan';
}

// Path: troubleshootPage
class _StringsTroubleshootPageMs extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Penyelesaian masalah';
	@override String get subTitle => 'Aplikasi ini tidak berfungsi seperti yang diharapkan? Di sini anda boleh mencari penyelesaian umum.';
	@override String get solution => 'Penyelesaian:';
	@override String get fixButton => 'Baiki secara automatik';
	@override late final _StringsTroubleshootPageFirewallMs firewall = _StringsTroubleshootPageFirewallMs._(_root);
	@override late final _StringsTroubleshootPageNoDiscoveryMs noDiscovery = _StringsTroubleshootPageNoDiscoveryMs._(_root);
	@override late final _StringsTroubleshootPageNoConnectionMs noConnection = _StringsTroubleshootPageNoConnectionMs._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageMs extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sejarah';
	@override String get openFolder => 'Buka folder';
	@override String get deleteHistory => 'Padam sejarah';
	@override String get empty => 'Sejarah kosong.';
	@override late final _StringsReceiveHistoryPageEntryActionsMs entryActions = _StringsReceiveHistoryPageEntryActionsMs._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageMs extends _StringsApkPickerPageEn {
	_StringsApkPickerPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikasi (APK)';
	@override String get excludeSystemApps => 'Kecualikan aplikasi sistem';
	@override String get excludeAppsWithoutLaunchIntent => 'Kecualikan aplikasi yang tidak boleh dilancarkan';
	@override String apps({required Object n}) => '${n} Aplikasi';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageMs extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Padam semua';
}

// Path: receivePage
class _StringsReceivePageMs extends _StringsReceivePageEn {
	_StringsReceivePageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ms'))(n,
		one: 'ingin menghantar fail kepada anda',
		other: 'ingin menghantar ${n} fail kepada anda',
	);
	@override String get subTitleMessage => 'menghantar mesej kepada anda:';
	@override String get subTitleLink => 'menghantar pautan kepada anda:';
	@override String get canceled => 'Penghantar telah membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageMs extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(folder LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Dimatikan secara automatik kerana terdapat folder.';
}

// Path: sendPage
class _StringsSendPageMs extends _StringsSendPageEn {
	_StringsSendPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Menunggu respons...';
	@override String get rejected => 'Penerima telah menolak permintaan.';
	@override String get busy => 'Penerima sibuk dengan permintaan lain.';
}

// Path: progressPage
class _StringsProgressPageMs extends _StringsProgressPageEn {
	_StringsProgressPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Menghantar fail';
	@override String get titleReceiving => 'Menerima fail';
	@override String get savedToGallery => 'Disimpan dalam Foto';
	@override late final _StringsProgressPageTotalMs total = _StringsProgressPageTotalMs._(_root);
}

// Path: webSharePage
class _StringsWebSharePageMs extends _StringsWebSharePageEn {
	_StringsWebSharePageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kongsi melalui pautan';
	@override String get loading => 'Memulakan pelayan...';
	@override String get stopping => 'Menghentikan pelayan...';
	@override String get error => 'Ralat berlaku semasa memulakan pelayan.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ms'))(n,
		one: 'Buka pautan ini dalam pelayar anda:',
		other: 'Buka salah satu pautan ini dalam pelayar anda:',
	);
	@override String get requests => 'Permintaan';
	@override String get noRequests => 'Tiada permintaan lagi.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Terima permintaan secara automatik';
	@override String get requirePin => 'Memerlukan PIN';
	@override String pinHint({required Object pin}) => 'PIN ialah "${pin}"';
	@override String pendingRequests({required Object n}) => 'Permintaan menunggu: ${n}';
}

// Path: aboutPage
class _StringsAboutPageMs extends _StringsAboutPageEn {
	_StringsAboutPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mengenai LocalSend';
	@override List<String> get description => [
		'LocalSend adalah aplikasi percuma dan sumber terbuka yang membolehkan anda berkongsi fail dan mesej dengan selamat dengan peranti berdekatan melalui rangkaian tempatan anda tanpa memerlukan sambungan internet.',
		'Aplikasi ini tersedia di Android, iOS, macOS, Windows dan Linux. Anda boleh mencari semua pilihan muat turun di laman web rasmi.',
	];
	@override String get author => 'Pengarang';
	@override String get contributors => 'Penyumbang';
	@override String get translators => 'Penterjemah';
}

// Path: donationPage
class _StringsDonationPageMs extends _StringsDonationPageEn {
	_StringsDonationPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Derma';
	@override String get info => 'LocalSend adalah percuma, sumber terbuka dan tanpa iklan. Jika anda menyukai aplikasi ini, anda boleh menyokong pembangunannya dengan derma.';
	@override String donate({required Object amount}) => 'Derma ${amount}';
	@override String get thanks => 'Terima kasih banyak!';
	@override String get restore => 'Pulihkan pembelian';
}

// Path: changelogPage
class _StringsChangelogPageMs extends _StringsChangelogPageEn {
	_StringsChangelogPageMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log perubahan';
}

// Path: aliasGenerator
class _StringsAliasGeneratorMs extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Comel',
		'Cantik',
		'Besar',
		'Terang',
		'Bersih',
		'Bijak',
		'Keren',
		'Menarik',
		'Licik',
		'Bersemangat',
		'Cekap',
		'Hebat',
		'Pantas',
		'Baik',
		'Segar',
		'Bagus',
		'Menakjubkan',
		'Hebat',
		'Tampan',
		'Panas',
		'Baik hati',
		'Misteri',
		'Kemas',
		'Sabar',
		'Cantik',
		'Berkuasa',
		'Kaya',
		'Rahsia',
		'Pintar',
		'Kukuh',
		'Istimewa',
		'Strategik',
		'Kuat',
		'Kemas',
		'Bijaksana',
	];
	@override List<String> get fruits => [
		'Epal',
		'Avokado',
		'Pisang',
		'Blackberi',
		'Bluberi',
		'Brokoli',
		'Lobak merah',
		'Ceri',
		'Kelapa',
		'Anggur',
		'Lemon',
		'Salad',
		'Mangga',
		'Tembikai',
		'Cendawan',
		'Bawang',
		'Oren',
		'Betik',
		'Pic',
		'Pir',
		'Nanas',
		'Kentang',
		'Labu',
		'Rasberi',
		'Strawberi',
		'Tomato',
	];

	/// Dalam bahasa Melayu, kata sifat biasanya diletakkan selepas kata nama.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} yang ${adjective}';
}

// Path: dialogs
class _StringsDialogsMs extends _StringsDialogsEn {
	_StringsDialogsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileMs addFile = _StringsDialogsAddFileMs._(_root);
	@override late final _StringsDialogsAddressInputMs addressInput = _StringsDialogsAddressInputMs._(_root);
	@override late final _StringsDialogsCancelSessionMs cancelSession = _StringsDialogsCancelSessionMs._(_root);
	@override late final _StringsDialogsCannotOpenFileMs cannotOpenFile = _StringsDialogsCannotOpenFileMs._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeMs encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeMs._(_root);
	@override late final _StringsDialogsErrorDialogMs errorDialog = _StringsDialogsErrorDialogMs._(_root);
	@override late final _StringsDialogsFileInfoMs fileInfo = _StringsDialogsFileInfoMs._(_root);
	@override late final _StringsDialogsFileNameInputMs fileNameInput = _StringsDialogsFileNameInputMs._(_root);
	@override late final _StringsDialogsHistoryClearDialogMs historyClearDialog = _StringsDialogsHistoryClearDialogMs._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedMs localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedMs._(_root);
	@override late final _StringsDialogsMessageInputMs messageInput = _StringsDialogsMessageInputMs._(_root);
	@override late final _StringsDialogsNoFilesMs noFiles = _StringsDialogsNoFilesMs._(_root);
	@override late final _StringsDialogsNoPermissionMs noPermission = _StringsDialogsNoPermissionMs._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformMs notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformMs._(_root);
	@override late final _StringsDialogsQrMs qr = _StringsDialogsQrMs._(_root);
	@override late final _StringsDialogsQuickActionsMs quickActions = _StringsDialogsQuickActionsMs._(_root);
	@override late final _StringsDialogsQuickSaveNoticeMs quickSaveNotice = _StringsDialogsQuickSaveNoticeMs._(_root);
	@override late final _StringsDialogsQuickSaveFromFavoritesNoticeMs quickSaveFromFavoritesNotice = _StringsDialogsQuickSaveFromFavoritesNoticeMs._(_root);
	@override late final _StringsDialogsSendModeHelpMs sendModeHelp = _StringsDialogsSendModeHelpMs._(_root);
	@override late final _StringsDialogsFavoriteDialogMs favoriteDialog = _StringsDialogsFavoriteDialogMs._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogMs favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogMs._(_root);
	@override late final _StringsDialogsFavoriteEditDialogMs favoriteEditDialog = _StringsDialogsFavoriteEditDialogMs._(_root);
	@override late final _StringsDialogsPinMs pin = _StringsDialogsPinMs._(_root);
	@override late final _StringsDialogsZoomMs zoom = _StringsDialogsZoomMs._(_root);
}

// Path: tray
class _StringsTrayMs extends _StringsTrayEn {
	_StringsTrayMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Keluar LocalSend';
	@override String get closeWindows => 'Keluar';
}

// Path: web
class _StringsWebMs extends _StringsWebEn {
	_StringsWebMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get rejected => 'Ditolak';
	@override String get files => 'Fail';
	@override String get fileName => 'Nama fail';
	@override String get size => 'Saiz';
}

// Path: assetPicker
class _StringsAssetPickerMs extends _StringsAssetPickerEn {
	_StringsAssetPickerMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Sahkan';
	@override String get cancel => 'Batal';
	@override String get edit => 'Edit';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Gagal dimuat';
	@override String get original => 'Asal';
	@override String get preview => 'Pratonton';
	@override String get select => 'Pilih';
	@override String get emptyList => 'Senarai kosong';
	@override String get unSupportedAssetType => 'Jenis fail tidak disokong.';
	@override String get unableToAccessAll => 'Tidak dapat mengakses semua fail pada peranti';
	@override String get viewingLimitedAssetsTip => 'Hanya lihat fail dan album yang boleh diakses oleh aplikasi.';
	@override String get changeAccessibleLimitedAssets => 'Klik untuk mengemas kini fail yang boleh diakses';
	@override String get accessAllTip => 'Aplikasi hanya dapat mengakses beberapa fail pada peranti. Pergi ke tetapan sistem dan benarkan aplikasi mengakses semua media pada peranti.';
	@override String get goToSystemSettings => 'Pergi ke tetapan sistem';
	@override String get accessLimitedAssets => 'Teruskan dengan akses terhad';
	@override String get accessiblePathName => 'Fail yang boleh diakses';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Imej';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Media lain';
	@override String get sActionPlayHint => 'main';
	@override String get sActionPreviewHint => 'pratonton';
	@override String get sActionSelectHint => 'pilih';
	@override String get sActionSwitchPathLabel => 'tukar laluan';
	@override String get sActionUseCameraHint => 'guna kamera';
	@override String get sNameDurationLabel => 'tempoh';
	@override String get sUnitAssetCountLabel => 'kiraan';
}

// Path: sanitization
class _StringsSanitizationMs extends _StringsSanitizationEn {
	_StringsSanitizationMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Nama fail tidak boleh kosong';
	@override String get invalid => 'Nama fail mengandungi aksara yang tidak sah';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxMs extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Nama peranti:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionMs extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan';
	@override String files({required Object files}) => 'Fail: ${files}';
	@override String size({required Object size}) => 'Saiz: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerMs extends _StringsSendTabPickerEn {
	_StringsSendTabPickerMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fail';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Teks';
	@override String get app => 'Aplikasi';
	@override String get clipboard => 'Tampal';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesMs extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get single => 'Satu penerima';
	@override String get multiple => 'Pelbagai penerima';
	@override String get link => 'Kongsi melalui pautan';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralMs extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Umum';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsMs brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsMs._(_root);
	@override String get color => 'Warna';
	@override late final _StringsSettingsTabGeneralColorOptionsMs colorOptions = _StringsSettingsTabGeneralColorOptionsMs._(_root);
	@override String get language => 'Bahasa';
	@override late final _StringsSettingsTabGeneralLanguageOptionsMs languageOptions = _StringsSettingsTabGeneralLanguageOptionsMs._(_root);
	@override String get saveWindowPlacement => 'Simpan kedudukan tetingkap selepas keluar';
	@override String get minimizeToTray => 'Minimumkan ke dulang sistem/menu bar apabila menutup';
	@override String get launchAtStartup => 'Mula automatik selepas log masuk';
	@override String get launchMinimized => 'Mula automatik: Mula tersembunyi';
	@override String get showInContextMenu => 'Tunjukkan LocalSend dalam menu konteks';
	@override String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveMs extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Terima';
	@override String get quickSave => _root.general.quickSave;
	@override String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
	@override String get destination => 'Simpan ke folder';
	@override String get downloads => '(Muat turun)';
	@override String get saveToGallery => 'Simpan media ke galeri';
	@override String get saveToHistory => 'Simpan ke sejarah';
	@override String get requirePin => 'Memerlukan PIN';
	@override String get autoFinish => 'Selesai Automatik';
}

// Path: settingsTab.send
class _StringsSettingsTabSendMs extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hantar';
	@override String get shareViaLinkAutoAccept => 'Terima permintaan secara automatik dalam mod "Kongsi melalui pautan"';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkMs extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rangkaian';
	@override String get needRestart => 'Mulakan semula pelayan untuk menggunakan tetapan!';
	@override String get server => 'Pelayan';
	@override String get alias => 'Nama peranti';
	@override String get deviceType => 'Jenis peranti';
	@override String get deviceModel => 'Model peranti';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Anda mungkin tidak dapat dikesan oleh peranti lain kerana anda menggunakan port tersuai. (lalai: ${defaultPort})';
	@override String get encryption => 'Penyulitan';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Anda mungkin tidak dapat dikesan oleh peranti lain kerana anda menggunakan alamat multicast tersuai. (lalai: ${defaultMulticast})';
	@override String get discoveryTimeout => 'Tamat Masa Penemuan';
	@override String get useSystemName => 'Gunakan nama sistem';
	@override String get generateRandomAlias => 'Jana alias rawak';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherMs extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lain-lain';
	@override String get support => 'Sokong LocalSend';
	@override String get donate => 'Derma';
	@override String get privacyPolicy => 'Dasar Privasi';
	@override String get termsOfUse => 'Syarat Penggunaan';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallMs extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Peranti ini boleh menghantar fail ke peranti lain tetapi peranti lain tidak boleh menghantar fail ke peranti ini.';
	@override String solution({required Object port}) => 'Ini kemungkinan besar adalah masalah firewall. Anda boleh menyelesaikannya dengan membenarkan sambungan masuk (UDP dan TCP) pada port ${port}.';
	@override String get openFirewall => 'Buka Firewall';
}

// Path: troubleshootPage.noDiscovery
class _StringsTroubleshootPageNoDiscoveryMs extends _StringsTroubleshootPageNoDiscoveryEn {
	_StringsTroubleshootPageNoDiscoveryMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Peranti ini tidak dapat menemui peranti lain.';
	@override String get solution => 'Sila pastikan semua peranti berada dalam rangkaian Wi-Fi yang sama dan berkongsi konfigurasi yang sama (port, alamat multicast, penyulitan). Anda boleh cuba menaip alamat IP peranti sasaran secara manual. Jika ini berhasil, pertimbangkan untuk menambahkan peranti ini ke kegemaran agar ia dapat ditemui secara automatik pada masa hadapan.';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionMs extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Kedua-dua peranti tidak dapat menemui satu sama lain atau tidak dapat berkongsi fail.';
	@override String get solution => 'Adakah masalah wujud di kedua-dua belah pihak? Jika ya, anda perlu memastikan bahawa kedua-dua peranti berada dalam rangkaian Wi-Fi yang sama dan berkongsi konfigurasi yang sama (port, alamat multicast, penyulitan). Rangkaian Wi-Fi mungkin tidak membenarkan komunikasi antara peserta (pengasingan AP). Dalam kes ini, pilihan ini mesti diaktifkan pada penghala.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsMs extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get open => 'Buka fail';
	@override String get showInFolder => 'Tunjukkan dalam folder';
	@override String get info => 'Maklumat';
	@override String get deleteFromHistory => 'Padam dari sejarah';
}

// Path: progressPage.total
class _StringsProgressPageTotalMs extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleMs title = _StringsProgressPageTotalTitleMs._(_root);
	@override String count({required Object curr, required Object n}) => 'Fail: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Saiz: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Kelajuan: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileMs extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tambah ke pilihan';
	@override String get content => 'Apa yang anda ingin tambah?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputMs extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukkan alamat';
	@override String get hashtag => 'Tanda pagar';
	@override String get ip => 'Alamat IP';
	@override String get recentlyUsed => 'Digunakan baru-baru ini: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionMs extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Batalkan pemindahan fail';
	@override String get content => 'Adakah anda benar-benar mahu membatalkan pemindahan fail?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileMs extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak dapat membuka fail';
	@override String content({required Object file}) => 'Tidak dapat membuka "${file}". Adakah fail ini telah dipindahkan, dinamakan semula atau dipadamkan?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeMs extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Penyulitan dimatikan';
	@override String get content => 'Komunikasi kini berlaku melalui protokol HTTP yang tidak disulitkan. Untuk menggunakan protokol HTTPS, aktifkan penyulitan semula.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogMs extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoMs extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maklumat fail';
	@override String get fileName => 'Nama fail:';
	@override String get path => 'Laluan:';
	@override String get size => 'Saiz:';
	@override String get sender => 'Penghantar:';
	@override String get time => 'Masa:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputMs extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukkan nama fail';
	@override String original({required Object original}) => 'Asal: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogMs extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kosongkan sejarah';
	@override String get content => 'Adakah anda benar-benar mahu memadamkan keseluruhan sejarah?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedMs extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend tidak dapat mencari peranti lain tanpa mempunyai kebenaran untuk mengimbas rangkaian tempatan. Sila berikan kebenaran ini dalam tetapan.';
	@override String get gotoSettings => 'Tetapan';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputMs extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taip mesej';
	@override String get multiline => 'Pelbagai baris';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesMs extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tiada fail dipilih';
	@override String get content => 'Sila pilih sekurang-kurangnya satu fail.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionMs extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tiada kebenaran';
	@override String get content => 'Anda belum memberikan kebenaran yang diperlukan. Sila berikan kebenaran dalam tetapan.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformMs extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak tersedia';
	@override String get content => 'Ciri ini hanya tersedia di:';
}

// Path: dialogs.qr
class _StringsDialogsQrMs extends _StringsDialogsQrEn {
	_StringsDialogsQrMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kod QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsMs extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tindakan Pantas';
	@override String get counter => 'Kaunter';
	@override String get prefix => 'Awalan';
	@override String get padZero => 'Isi dengan sifar';
	@override String get sortBeforeCount => 'Susun mengikut abjad terlebih dahulu';
	@override String get random => 'Rawak';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeMs extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Permintaan fail kini diterima secara automatik. Sila ambil perhatian bahawa semua orang dalam rangkaian tempatan boleh menghantar fail kepada anda.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _StringsDialogsQuickSaveFromFavoritesNoticeMs extends _StringsDialogsQuickSaveFromFavoritesNoticeEn {
	_StringsDialogsQuickSaveFromFavoritesNoticeMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSaveFromFavorites;
	@override String get content => 'Permintaan fail kini diterima secara automatik dari peranti dalam senarai kegemaran anda.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpMs extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mod penghantaran';
	@override String get single => 'Menghantar fail kepada satu penerima. Pilihan akan dibersihkan selepas pemindahan fail selesai.';
	@override String get multiple => 'Menghantar fail kepada beberapa penerima. Pilihan tidak akan dibersihkan.';
	@override String get link => 'Penerima yang tidak mempunyai LocalSend dipasang boleh memuat turun fail yang dipilih dengan membuka pautan dalam pelayar mereka.';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogMs extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kegemaran';
	@override String get noFavorites => 'Tiada peranti kegemaran lagi.';
	@override String get addFavorite => 'Tambah';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogMs extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Padam dari kegemaran';
	@override String content({required Object name}) => 'Adakah anda benar-benar mahu memadam "${name}" dari kegemaran?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogMs extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Tambah ke kegemaran';
	@override String get titleEdit => 'Tetapan';
	@override String get name => 'Nama peranti';
	@override String get auto => '(auto)';
	@override String get ip => 'Alamat IP';
	@override String get port => 'Port';
}

// Path: dialogs.pin
class _StringsDialogsPinMs extends _StringsDialogsPinEn {
	_StringsDialogsPinMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukkan PIN';
}

// Path: dialogs.zoom
class _StringsDialogsZoomMs extends _StringsDialogsZoomEn {
	_StringsDialogsZoomMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsMs extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Gelap';
	@override String get light => 'Cerah';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsMs extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsMs extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleMs extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleMs._(_StringsMs root) : this._root = root, super._(root);

	@override final _StringsMs _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Kemajuan keseluruhan (${time})';
	@override String get finishedError => 'Selesai dengan ralat';
	@override String get canceledSender => 'Dibatalkan oleh penghantar';
	@override String get canceledReceiver => 'Dibatalkan oleh penerima';
}
