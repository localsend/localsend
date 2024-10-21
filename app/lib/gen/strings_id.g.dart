///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsId extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsId.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsId _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Indonesian';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralId general = _StringsGeneralId._(_root);
	@override late final _StringsReceiveTabId receiveTab = _StringsReceiveTabId._(_root);
	@override late final _StringsSendTabId sendTab = _StringsSendTabId._(_root);
	@override late final _StringsSettingsTabId settingsTab = _StringsSettingsTabId._(_root);
	@override late final _StringsTroubleshootPageId troubleshootPage = _StringsTroubleshootPageId._(_root);
	@override late final _StringsReceiveHistoryPageId receiveHistoryPage = _StringsReceiveHistoryPageId._(_root);
	@override late final _StringsApkPickerPageId apkPickerPage = _StringsApkPickerPageId._(_root);
	@override late final _StringsSelectedFilesPageId selectedFilesPage = _StringsSelectedFilesPageId._(_root);
	@override late final _StringsReceivePageId receivePage = _StringsReceivePageId._(_root);
	@override late final _StringsReceiveOptionsPageId receiveOptionsPage = _StringsReceiveOptionsPageId._(_root);
	@override late final _StringsSendPageId sendPage = _StringsSendPageId._(_root);
	@override late final _StringsProgressPageId progressPage = _StringsProgressPageId._(_root);
	@override late final _StringsWebSharePageId webSharePage = _StringsWebSharePageId._(_root);
	@override late final _StringsAboutPageId aboutPage = _StringsAboutPageId._(_root);
	@override late final _StringsDonationPageId donationPage = _StringsDonationPageId._(_root);
	@override late final _StringsChangelogPageId changelogPage = _StringsChangelogPageId._(_root);
	@override late final _StringsAliasGeneratorId aliasGenerator = _StringsAliasGeneratorId._(_root);
	@override late final _StringsDialogsId dialogs = _StringsDialogsId._(_root);
	@override late final _StringsSanitizationId sanitization = _StringsSanitizationId._(_root);
	@override late final _StringsTrayId tray = _StringsTrayId._(_root);
	@override late final _StringsWebId web = _StringsWebId._(_root);
	@override late final _StringsAssetPickerId assetPicker = _StringsAssetPickerId._(_root);
}

// Path: general
class _StringsGeneralId extends _StringsGeneralEn {
	_StringsGeneralId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Terima';
	@override String get accepted => 'Diterima';
	@override String get add => 'Tambah';
	@override String get advanced => 'Lanjutan';
	@override String get cancel => 'Batal';
	@override String get close => 'Tutup';
	@override String get confirm => 'Konfirmasi';
	@override String get continueStr => 'Lanjut';
	@override String get copy => 'Salin';
	@override String get copiedToClipboard => 'Disalin ke Papan klip';
	@override String get decline => 'Tolak';
	@override String get done => 'Selesai';
	@override String get delete => 'Hapus';
	@override String get edit => 'Ubah';
	@override String get error => 'Kesalahan';
	@override String get example => 'Contoh';
	@override String get files => 'File';
	@override String get finished => 'Selesai';
	@override String get hide => 'Sembunyikan';
	@override String get off => 'Mati';
	@override String get offline => 'Offline';
	@override String get on => 'Hidup';
	@override String get online => 'Online';
	@override String get open => 'Buka';
	@override String get queue => 'Antrean';
	@override String get quickSave => 'Penyimpanan Cepat';
	@override String get renamed => 'Berganti nama';
	@override String get reset => 'Atur Ulang';
	@override String get restart => 'Mengulang Kembali';
	@override String get settings => 'Pengaturan';
	@override String get skipped => 'Dilewati';
	@override String get start => 'Mulai';
	@override String get stop => 'Berhenti';
	@override String get save => 'Simpan';
	@override String get unchanged => 'Tidak berubah';
	@override String get unknown => 'Tidak dikenal';
	@override String get noItemInClipboard => 'Tidak ada item di Papan klip';
}

// Path: receiveTab
class _StringsReceiveTabId extends _StringsReceiveTabEn {
	_StringsReceiveTabId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Terima';
	@override late final _StringsReceiveTabInfoBoxId infoBox = _StringsReceiveTabInfoBoxId._(_root);
}

// Path: sendTab
class _StringsSendTabId extends _StringsSendTabEn {
	_StringsSendTabId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kirim';
	@override late final _StringsSendTabSelectionId selection = _StringsSendTabSelectionId._(_root);
	@override late final _StringsSendTabPickerId picker = _StringsSendTabPickerId._(_root);
	@override String get shareIntentInfo => 'Anda juga dapat menggunakan fitur "Berbagi" untuk memilih berkas dengan lebih mudah.';
	@override String get nearbyDevices => 'Perangkat Terdekat';
	@override String get thisDevice => 'Perangkat ini';
	@override String get scan => 'Cari perangkat';
	@override String get sendMode => 'Mode Pengiriman';
	@override late final _StringsSendTabSendModesId sendModes = _StringsSendTabSendModesId._(_root);
	@override String get sendModeHelp => 'Penjelasan';
	@override String get help => 'Pastikan perangkat terkoneksi pada jaringan yang sama.';
	@override String get placeItems => 'Letakkan item untuk dibagikan.';
}

// Path: settingsTab
class _StringsSettingsTabId extends _StringsSettingsTabEn {
	_StringsSettingsTabId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override late final _StringsSettingsTabGeneralId general = _StringsSettingsTabGeneralId._(_root);
	@override late final _StringsSettingsTabReceiveId receive = _StringsSettingsTabReceiveId._(_root);
	@override late final _StringsSettingsTabSendId send = _StringsSettingsTabSendId._(_root);
	@override late final _StringsSettingsTabNetworkId network = _StringsSettingsTabNetworkId._(_root);
	@override late final _StringsSettingsTabOtherId other = _StringsSettingsTabOtherId._(_root);
	@override String get advancedSettings => 'Pengaturan Lanjutan';
}

// Path: troubleshootPage
class _StringsTroubleshootPageId extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perbaikan Masalah';
	@override String get subTitle => 'Aplikasi ini tidak berfungsi seperti yang diharapkan? Di sini Anda dapat menemukan solusi umum.';
	@override String get solution => 'Solusi:';
	@override String get fixButton => 'Perbaiki secara otomatis';
	@override late final _StringsTroubleshootPageFirewallId firewall = _StringsTroubleshootPageFirewallId._(_root);
	@override late final _StringsTroubleshootPageNoConnectionId noConnection = _StringsTroubleshootPageNoConnectionId._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageId extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Riwayat';
	@override String get openFolder => 'Buka folder';
	@override String get deleteHistory => 'Hapus riwayat';
	@override String get empty => 'Riwayat kosong.';
	@override late final _StringsReceiveHistoryPageEntryActionsId entryActions = _StringsReceiveHistoryPageEntryActionsId._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageId extends _StringsApkPickerPageEn {
	_StringsApkPickerPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikasi (APK)';
	@override String get excludeSystemApps => 'Kecualikan aplikasi sistem';
	@override String get excludeAppsWithoutLaunchIntent => 'Kecualikan aplikasi yang tidak dapat diluncurkan';
	@override String apps({required Object n}) => '${n} Aplikasi';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageId extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Hapus semua';
}

// Path: receivePage
class _StringsReceivePageId extends _StringsReceivePageEn {
	_StringsReceivePageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'ingin mengirim berkas',
		other: 'ingin mengirim ${n} berkas',
	);
	@override String get subTitleMessage => 'mengirim pesan:';
	@override String get subTitleLink => 'mengirim tautan:';
	@override String get canceled => 'Pengirim membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageId extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opsi';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(folder LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Dimatikan secara otomatis karena ada direktori.';
}

// Path: sendPage
class _StringsSendPageId extends _StringsSendPageEn {
	_StringsSendPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Menunggu respons...';
	@override String get rejected => 'Penerima menolak permintaan.';
	@override String get busy => 'Penerima sedang sibuk dengan permintaan lain.';
}

// Path: progressPage
class _StringsProgressPageId extends _StringsProgressPageEn {
	_StringsProgressPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Mengirim Berkas';
	@override String get titleReceiving => 'Menerima Berkas';
	@override String get savedToGallery => 'Simpan ke galeri';
	@override late final _StringsProgressPageTotalId total = _StringsProgressPageTotalId._(_root);
}

// Path: webSharePage
class _StringsWebSharePageId extends _StringsWebSharePageEn {
	_StringsWebSharePageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bagikan melalui Tautan';
	@override String get loading => 'Memulai server...';
	@override String get stopping => 'Menghentikan server...';
	@override String get error => 'Terjadi kesalahan saat memulai server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Buka tautan ini di peramban:',
		other: 'Buka salah satu tautan ini di peramban:',
	);
	@override String get requests => 'Permintaan';
	@override String get noRequests => 'Belum ada permintaan.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Terima permintaan secara otomatis';
	@override String get encryptionHint => 'LocalSend menggunakan sertifikat self-signed. Anda perlu menerimanya di peramban.';
	@override String pendingRequests({required Object n}) => 'Permintaan tertunda: ${n}';
}

// Path: aboutPage
class _StringsAboutPageId extends _StringsAboutPageEn {
	_StringsAboutPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang LocalSend';
	@override List<String> get description => [
		'LocalSend adalah aplikasi gratis, open-source yang memungkinkan Anda untuk membagikan berkas dan pesan secara aman dengan perangkat lain yang terhubung pada jaringan lokal tanpa memerlukan koneksi internet atau paket data.',
		'Aplikasi ini tersedia untuk Android, iOS, macOS, Windows, dan Linux. Semua opsi unduhan dapat ditemukan di situs resmi kami.',
	];
	@override String get author => 'Pencipta';
	@override String get contributors => 'Daftar Kontributor';
	@override String get translators => 'Daftar Penerjemah';
}

// Path: donationPage
class _StringsDonationPageId extends _StringsDonationPageEn {
	_StringsDonationPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Donasi';
	@override String get info => 'LocalSend adalah aplikasi gratis, terbuka, dan bebas iklan. Jika Anda menyukai aplikasi ini, Anda bisa mendukung kami dengan memberikan donasi.';
	@override String donate({required Object amount}) => 'Donasi ${amount}';
	@override String get thanks => 'Terima kasih banyak!';
	@override String get restore => 'Kembalikan dana';
}

// Path: changelogPage
class _StringsChangelogPageId extends _StringsChangelogPageEn {
	_StringsChangelogPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catatan Perubahan';
}

// Path: aliasGenerator
class _StringsAliasGeneratorId extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Menarik',
		'Cantik',
		'Besar',
		'Cerah',
		'Bersih',
		'Cerdik',
		'Keren',
		'Imut',
		'Licik',
		'Tekun',
		'Giat',
		'Efisien',
		'Luar biasa',
		'Cepat',
		'Baik',
		'Segar',
		'Bagus',
		'Menawan',
		'Sangat Bagus',
		'Tampan',
		'Panas',
		'Baik',
		'Menyenangkan',
		'Mistik',
		'Rapi',
		'Bagus',
		'Sabar',
		'Cantik',
		'Kuat',
		'Kaya',
		'Rahasia',
		'Cerdas',
		'Kukuh',
		'Khusus',
		'Strategis',
		'Tangguh',
		'Rapi',
		'Bijak',
	];
	@override List<String> get fruits => [
		'Apel',
		'Alpukat',
		'Pisang',
		'Blackberry',
		'Blueberry',
		'Brokoli',
		'Wortel',
		'Ceri',
		'Kelapa',
		'Anggur',
		'Lemon',
		'Selada',
		'Mangga',
		'Melon',
		'Jamur',
		'Bawang',
		'Jeruk',
		'Pepaya',
		'Persik',
		'Pir',
		'Nanas',
		'Kentang',
		'Labu',
		'Raspberi',
		'Stroberi',
		'Tomat',
	];

	/// Pada beberapa bahasa, kata sifat harus diletakkan terakhir.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsId extends _StringsDialogsEn {
	_StringsDialogsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileId addFile = _StringsDialogsAddFileId._(_root);
	@override late final _StringsDialogsAddressInputId addressInput = _StringsDialogsAddressInputId._(_root);
	@override late final _StringsDialogsCancelSessionId cancelSession = _StringsDialogsCancelSessionId._(_root);
	@override late final _StringsDialogsCannotOpenFileId cannotOpenFile = _StringsDialogsCannotOpenFileId._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeId encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeId._(_root);
	@override late final _StringsDialogsErrorDialogId errorDialog = _StringsDialogsErrorDialogId._(_root);
	@override late final _StringsDialogsFavoriteDialogId favoriteDialog = _StringsDialogsFavoriteDialogId._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogId favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogId._(_root);
	@override late final _StringsDialogsFavoriteEditDialogId favoriteEditDialog = _StringsDialogsFavoriteEditDialogId._(_root);
	@override late final _StringsDialogsFileInfoId fileInfo = _StringsDialogsFileInfoId._(_root);
	@override late final _StringsDialogsFileNameInputId fileNameInput = _StringsDialogsFileNameInputId._(_root);
	@override late final _StringsDialogsHistoryClearDialogId historyClearDialog = _StringsDialogsHistoryClearDialogId._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedId localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedId._(_root);
	@override late final _StringsDialogsMessageInputId messageInput = _StringsDialogsMessageInputId._(_root);
	@override late final _StringsDialogsNoFilesId noFiles = _StringsDialogsNoFilesId._(_root);
	@override late final _StringsDialogsNoPermissionId noPermission = _StringsDialogsNoPermissionId._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformId notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformId._(_root);
	@override late final _StringsDialogsQrId qr = _StringsDialogsQrId._(_root);
	@override late final _StringsDialogsQuickActionsId quickActions = _StringsDialogsQuickActionsId._(_root);
	@override late final _StringsDialogsQuickSaveNoticeId quickSaveNotice = _StringsDialogsQuickSaveNoticeId._(_root);
	@override late final _StringsDialogsSendModeHelpId sendModeHelp = _StringsDialogsSendModeHelpId._(_root);
	@override late final _StringsDialogsZoomId zoom = _StringsDialogsZoomId._(_root);
}

// Path: sanitization
class _StringsSanitizationId extends _StringsSanitizationEn {
	_StringsSanitizationId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Nama berkas tidak boleh kosong';
	@override String get invalid => 'Nama berkas mengandung karakter yang tidak valid';
}

// Path: tray
class _StringsTrayId extends _StringsTrayEn {
	_StringsTrayId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Tutup LocalSend';
}

// Path: web
class _StringsWebId extends _StringsWebEn {
	_StringsWebId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get rejected => 'Ditolak';
	@override String get files => 'Berkas';
	@override String get fileName => 'Nama Berkas';
	@override String get size => 'Ukuran';
}

// Path: assetPicker
class _StringsAssetPickerId extends _StringsAssetPickerEn {
	_StringsAssetPickerId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Konfirmasi';
	@override String get cancel => 'Batal';
	@override String get edit => 'Ubah';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Gagal memuat';
	@override String get original => 'Asli';
	@override String get preview => 'Pratinjau';
	@override String get select => 'Pilih';
	@override String get emptyList => 'Daftar kosong';
	@override String get unSupportedAssetType => 'Jenis berkas tidak didukung.';
	@override String get unableToAccessAll => 'Tidak dapat mengakses semua berkas di perangkat';
	@override String get viewingLimitedAssetsTip => 'Hanya melihat berkas dan album yang dapat diakses oleh aplikasi.';
	@override String get changeAccessibleLimitedAssets => 'Klik untuk memperbarui berkas yang dapat diakses';
	@override String get accessAllTip => 'Aplikasi hanya dapat mengakses beberapa berkas di perangkat. Pergi ke pengaturan sistem dan izinkan aplikasi untuk mengakses semua media di perangkat.';
	@override String get goToSystemSettings => 'Ke pengaturan sistem';
	@override String get accessLimitedAssets => 'Lanjutkan dengan akses terbatas';
	@override String get accessiblePathName => 'berkas yang dapat diakses';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Gambar';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Media lainnya';
	@override String get sActionPlayHint => 'Putar';
	@override String get sActionPreviewHint => 'Pratinjau';
	@override String get sActionSelectHint => 'Pilih';
	@override String get sActionSwitchPathLabel => 'Ubah jalur';
	@override String get sActionUseCameraHint => 'Gunakan kamera';
	@override String get sNameDurationLabel => 'Durasi';
	@override String get sUnitAssetCountLabel => 'jumlah';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxId extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionId extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan';
	@override String files({required Object files}) => 'Berkas: ${files}';
	@override String size({required Object size}) => 'Ukuran: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerId extends _StringsSendTabPickerEn {
	_StringsSendTabPickerId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get file => 'Berkas';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Teks';
	@override String get app => 'Aplikasi';
	@override String get clipboard => 'Tempel';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesId extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get single => 'Penerima tunggal';
	@override String get multiple => 'Penerima ganda';
	@override String get link => 'Bagikan melalui Tautan';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralId extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Umum';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsId brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsId._(_root);
	@override String get color => 'Warna';
	@override late final _StringsSettingsTabGeneralColorOptionsId colorOptions = _StringsSettingsTabGeneralColorOptionsId._(_root);
	@override String get language => 'Bahasa';
	@override late final _StringsSettingsTabGeneralLanguageOptionsId languageOptions = _StringsSettingsTabGeneralLanguageOptionsId._(_root);
	@override String get saveWindowPlacement => 'Keluar: Simpan posisi jendela';
	@override String get minimizeToTray => 'Keluar: Perkecil ke pojok bawah';
	@override String get launchAtStartup => 'Mulai otomatis setelah masuk';
	@override String get launchMinimized => 'Mulai otomatis: Berjalan di latar belakang';
	@override String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveId extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menerima';
	@override String get quickSave => _root.general.quickSave;
	@override String get autoFinish => 'Selesai Otomatis';
	@override String get destination => 'Tujuan';
	@override String get downloads => '(Unduhan)';
	@override String get saveToGallery => 'Simpan media ke galeri';
	@override String get saveToHistory => 'Simpan ke riwayat';
}

// Path: settingsTab.send
class _StringsSettingsTabSendId extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kirim';
	@override String get shareViaLinkAutoAccept => 'Bagikan melalui tautan: Terima otomatis';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkId extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Jaringan';
	@override String get needRestart => 'Mulai ulang untuk menerapkan!';
	@override String get server => 'Server';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Tipe Perangkat';
	@override String get deviceModel => 'Model Perangkat';
	@override String get port => 'Port';
	@override String get discoveryTimeout => 'Waktu penemuan habis';
	@override String portWarning({required Object defaultPort}) => 'Anda mungkin tidak terdeteksi oleh perangkat lain karena menggunakan port kustom. (bawaan: ${defaultPort})';
	@override String get encryption => 'Enkripsi';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Anda mungkin tidak terdeteksi oleh perangkat lain karena menggunakan alamat multicast khusus. (bawaan: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherId extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lainnya';
	@override String get support => 'Dukung LocalSend';
	@override String get donate => 'Donasi';
	@override String get privacyPolicy => 'Kebijakan Privasi';
	@override String get termsOfUse => 'Syarat dan Ketentuan Penggunaan';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallId extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aplikasi ini dapat mengirim berkas ke perangkat lain tetapi perangkat lain tidak dapat mengirim berkas ke perangkat ini.';
	@override String solution({required Object port}) => 'Ini kemungkinan masalah firewall. Anda dapat memperbaikinya dengan memperbolehkan koneksi masuk (UDP dan TCP) pada port ${port}.';
	@override String get openFirewall => 'Buka Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionId extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Kedua perangkat tidak dapat saling menemukan atau berbagi berkas.';
	@override String get solution => 'Pastikan kedua perangkat berada dalam jaringan wifi yang sama dan berbagi konfigurasi yang sama (port, alamat multicast, enkripsi). Jika wifi tidak memperbolehkan komunikasi, aktifkan opsi ini pada router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsId extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get open => 'Buka berkas';
	@override String get info => 'Informasi';
	@override String get deleteFromHistory => 'Hapus dari riwayat';
}

// Path: progressPage.total
class _StringsProgressPageTotalId extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleId title = _StringsProgressPageTotalTitleId._(_root);
	@override String count({required Object curr, required Object n}) => 'Berkas: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Ukuran: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Kecepatan: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileId extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tambahkan dalam pilihan';
	@override String get content => 'Apa yang ingin ditambahkan?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputId extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukkan Alamat';
	@override String get hashtag => 'Tagar';
	@override String get ip => 'Alamat IP';
	@override String get recentlyUsed => 'Baru saja digunakan:';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionId extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Batalkan transfer berkas';
	@override String get content => 'Apakah Anda yakin untuk membatalkan pengiriman berkas?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileId extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak dapat membuka berkas';
	@override String content({required Object file}) => 'Tidak dapat membuka "${file}". Apakah berkas ini telah dipindahkan, berganti nama, atau dihapus?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeId extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enkripsi dinonaktifkan';
	@override String get content => 'Komunikasi sekarang terjadi melalui protokol HTTP yang tidak terenkripsi. Untuk menggunakan HTTPS, aktifkan kembali enkripsi.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogId extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogId extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorit';
	@override String get noFavorites => 'Tidak ada perangkat difavoritkan.';
	@override String get addFavorite => 'Tambah';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogId extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hapus dari daftar favorit';
	@override String content({required Object name}) => 'Anda yakin ingin menghapus ini dari daftar favorit? "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogId extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Tambah ke daftar favorit';
	@override String get titleEdit => 'Pengaturan';
	@override String get name => 'Nama perangkat';
	@override String get auto => '(otomatis)';
	@override String get ip => 'Alamat IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoId extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informasi Berkas';
	@override String get fileName => 'Nama Berkas:';
	@override String get path => 'Jalur:';
	@override String get size => 'Ukuran:';
	@override String get sender => 'Pengirim:';
	@override String get time => 'Waktu:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputId extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukkan nama berkas';
	@override String original({required Object original}) => 'Asli: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogId extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hapus Riwayat';
	@override String get content => 'Anda yakin ingin menghapus seluruh riwayat?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedId extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend tidak dapat menemukan perangkat lain tanpa izin untuk memindai jaringan lokal. Mohon berikan izin ini di pengaturan.';
	@override String get gotoSettings => 'Pengaturan';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputId extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ketik pesan';
	@override String get multiline => 'Baris Ganda';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesId extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak ada berkas yang dipilih';
	@override String get content => 'Pilih setidaknya satu berkas.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionId extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak ada izin';
	@override String get content => 'Anda belum memberikan izin yang diperlukan. Harap berikan izin tersebut di pengaturan.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformId extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak tersedia';
	@override String get content => 'Fitur ini hanya tersedia di:';
}

// Path: dialogs.qr
class _StringsDialogsQrId extends _StringsDialogsQrEn {
	_StringsDialogsQrId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kode QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsId extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aksi Cepat';
	@override String get counter => 'Penghitung';
	@override String get prefix => 'Awalan';
	@override String get padZero => 'Isi dengan nol';
	@override String get sortBeforeCount => 'Urutkan berdasarkan abjad sebelumnya';
	@override String get random => 'Acak';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeId extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Semua permintaan akan langsung diterima. Harap berhati-hati bahwa semua orang di jaringan lokal dapat mengirim berkas.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpId extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode Pengiriman';
	@override String get single => 'Mengirim berkas ke satu penerima. Pilihan akan dihapus setelah selesai membagikan berkas.';
	@override String get multiple => 'Mengirim berkas ke beberapa penerima. Pilihan tidak akan dihapus.';
	@override String get link => 'Penerima yang tidak memiliki LocalSend dapat mengunduh berkas yang dipilih dengan membuka tautan di peramban mereka.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomId extends _StringsDialogsZoomEn {
	_StringsDialogsZoomId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsId extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Gelap';
	@override String get light => 'Terang';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsId extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsId extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleId extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Total proses (${time})';
	@override String get finishedError => 'Selesai dengan kesalahan';
	@override String get canceledSender => 'Dibatalkan oleh pengirim';
	@override String get canceledReceiver => 'Dibatalkan oleh penerima';
}
