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
	@override late final _StringsChangelogPageId changelogPage = _StringsChangelogPageId._(_root);
	@override late final _StringsAliasGeneratorId aliasGenerator = _StringsAliasGeneratorId._(_root);
	@override late final _StringsDialogsId dialogs = _StringsDialogsId._(_root);
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
	@override String get advanced => 'Advanced';
	@override String get cancel => 'Batal';
	@override String get close => 'Tutup';
	@override String get confirm => 'Konfirmasi';
	@override String get continueStr => 'Lanjut';
	@override String get copy => 'Salin';
	@override String get copiedToClipboard => 'Disalin ke Papanklip';
	@override String get decline => 'Tolak';
	@override String get done => 'Selesai';
	@override String get edit => 'Ubah';
	@override String get error => 'Kesalahan';
	@override String get example => 'Contoh';
	@override String get files => 'File';
	@override String get finished => 'Selesai';
	@override String get hide => 'sembunyi';
	@override String get off => 'Mati';
	@override String get offline => 'Offline';
	@override String get on => 'Hidup';
	@override String get online => 'Online';
	@override String get open => 'Buka';
	@override String get queue => 'Antrian';
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
}

// Path: receiveTab
class _StringsReceiveTabId extends _StringsReceiveTabEn {
	_StringsReceiveTabId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menerima';
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
	@override String get shareIntentInfo => 'Anda juga dapat menggunakan fitur "Berbagi" untuk memilih file dengan lebih mudah.';
	@override String get nearbyDevices => 'Perangkat terdekat';
	@override String get thisDevice => 'Perangkat ini';
	@override String get scan => 'Cari perangkat';
	@override String get sendMode => 'Mode pengiriman';
	@override late final _StringsSendTabSendModesId sendModes = _StringsSendTabSendModesId._(_root);
	@override String get sendModeHelp => 'Penjelasan';
	@override String get help => 'Pastikan perangkat terkoneksi pada jaringan yang sama.';
	@override String get placeItems => 'Tempatkan item untuk dibagikan.';
}

// Path: settingsTab
class _StringsSettingsTabId extends _StringsSettingsTabEn {
	_StringsSettingsTabId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override late final _StringsSettingsTabGeneralId general = _StringsSettingsTabGeneralId._(_root);
	@override late final _StringsSettingsTabReceiveId receive = _StringsSettingsTabReceiveId._(_root);
	@override late final _StringsSettingsTabNetworkId network = _StringsSettingsTabNetworkId._(_root);
	@override String get advancedSettings => 'Pengaturan Lanjutan';
}

// Path: troubleshootPage
class _StringsTroubleshootPageId extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perbaikan masalah';
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
		one: 'ingin mengirim file',
		other: 'ingin mengirim ${n} file',
	);
	@override String get subTitleMessage => 'mengirim pesan:';
	@override String get subTitleLink => 'mengirim link:';
	@override String get canceled => 'Pengirim membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageId extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opsi';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Dimatikan secara otomatis karena ada direktori.';
}

// Path: sendPage
class _StringsSendPageId extends _StringsSendPageEn {
	_StringsSendPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Menunggu respon...';
	@override String get rejected => 'Penerima menolak permintaan.';
	@override String get busy => 'Penerima sedang sibuk dengan permintaan lain.';
}

// Path: progressPage
class _StringsProgressPageId extends _StringsProgressPageEn {
	_StringsProgressPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Mengirim file';
	@override String get titleReceiving => 'Menerima file';
	@override String get savedToGallery => 'Simpan ke galeri';
	@override late final _StringsProgressPageTotalId total = _StringsProgressPageTotalId._(_root);
}

// Path: webSharePage
class _StringsWebSharePageId extends _StringsWebSharePageEn {
	_StringsWebSharePageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bagikan melalui tautan';
	@override String get loading => 'Memulai server...';
	@override String get stopping => 'Menghentikan server...';
	@override String get error => 'Terjadi kesalahan saat memulai server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Buka tautan ini di browser:',
		other: 'Buka salah satu tautan ini di browser:',
	);
	@override String get requests => 'Permintaan';
	@override String get noRequests => 'Belum ada permintaan.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend menggunakan sertifikat self-signed. Anda perlu menerimanya di peramban.';
	@override String pendingRequests({required Object n}) => 'Permintaan tertunda: ${n}';
}

// Path: aboutPage
class _StringsAboutPageId extends _StringsAboutPageEn {
	_StringsAboutPageId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang LocalSend';
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
		'Pisan',
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
		'Rasberi',
		'Stroberi',
		'Tomat',
	];

	/// In some languages, the adjective must be last.
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
	@override late final _StringsDialogsFileInfoId fileInfo = _StringsDialogsFileInfoId._(_root);
	@override late final _StringsDialogsFileNameInputId fileNameInput = _StringsDialogsFileNameInputId._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedId localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedId._(_root);
	@override late final _StringsDialogsMessageInputId messageInput = _StringsDialogsMessageInputId._(_root);
	@override late final _StringsDialogsNoFilesId noFiles = _StringsDialogsNoFilesId._(_root);
	@override late final _StringsDialogsNoPermissionId noPermission = _StringsDialogsNoPermissionId._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformId notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformId._(_root);
	@override late final _StringsDialogsQrId qr = _StringsDialogsQrId._(_root);
	@override late final _StringsDialogsQuickActionsId quickActions = _StringsDialogsQuickActionsId._(_root);
	@override late final _StringsDialogsQuickSaveNoticeId quickSaveNotice = _StringsDialogsQuickSaveNoticeId._(_root);
	@override late final _StringsDialogsSendModeHelpId sendModeHelp = _StringsDialogsSendModeHelpId._(_root);
}

// Path: tray
class _StringsTrayId extends _StringsTrayEn {
	_StringsTrayId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Tutup LocalSend';
}

// Path: web
class _StringsWebId extends _StringsWebEn {
	_StringsWebId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Ditolak';
	@override String get files => 'Berkas';
	@override String get fileName => 'Nama file';
	@override String get size => 'Ukuran';
}

// Path: assetPicker
class _StringsAssetPickerId extends _StringsAssetPickerEn {
	_StringsAssetPickerId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Konfirmasi';
	@override String get cancel => 'Batal';
	@override String get edit => 'Edit';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Gagal memuat';
	@override String get original => 'Asli';
	@override String get preview => 'Pratinjau';
	@override String get select => 'Pilih';
	@override String get emptyList => 'Daftar kosong';
	@override String get unSupportedAssetType => 'Jenis file tidak didukung.';
	@override String get unableToAccessAll => 'Tidak dapat mengakses semua file di perangkat';
	@override String get viewingLimitedAssetsTip => 'Hanya melihat file dan album yang dapat diakses oleh aplikasi.';
	@override String get changeAccessibleLimitedAssets => 'Klik untuk memperbarui file yang dapat diakses';
	@override String get accessAllTip => 'Aplikasi hanya dapat mengakses beberapa file di perangkat. Pergi ke pengaturan sistem dan izinkan aplikasi untuk mengakses semua media di perangkat.';
	@override String get goToSystemSettings => 'Ke pengaturan sistem';
	@override String get accessLimitedAssets => 'Lanjutkan dengan akses terbatas';
	@override String get accessiblePathName => 'File yang dapat diakses';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Gambar';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Media lainnya';
	@override String get sActionPlayHint => 'mainkan';
	@override String get sActionPreviewHint => 'pratinjau';
	@override String get sActionSelectHint => 'pilih';
	@override String get sActionSwitchPathLabel => 'ubah path';
	@override String get sActionUseCameraHint => 'gunakan kamera';
	@override String get sNameDurationLabel => 'durasi';
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
	@override String files({required Object files}) => 'File: ${files}';
	@override String size({required Object size}) => 'Ukuran: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerId extends _StringsSendTabPickerEn {
	_StringsSendTabPickerId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get file => 'File';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Teks';
	@override String get app => 'Aplikasi';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesId extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get single => 'Penerima tunggal';
	@override String get multiple => 'Penerima ganda';
	@override String get link => 'Bagikan melalui tautan';
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
	@override String get launchMinimized => 'Mulai otomatis: Berjalan di belakang';
	@override String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveId extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menerima';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Tujuan';
	@override String get downloads => '(Unduhan)';
	@override String get saveToGallery => 'Simpan media ke galeri';
	@override String get saveToHistory => 'Simpan ke riwayat';
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
	@override String portWarning({required Object defaultPort}) => 'You might not be detected by other devices because you are using a custom port. (default: ${defaultPort})';
	@override String get encryption => 'Encryption';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Anda mungkin tidak terdeteksi oleh perangkat lain karena Anda menggunakan alamat multicast khusus. (default: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallId extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aplikasi ini dapat mengirim file ke perangkat lain tetapi perangkat lain tidak dapat mengirim file ke perangkat ini.';
	@override String solution({required Object port}) => 'Ini kemungkinan masalah firewall. Anda dapat memperbaikinya dengan memperbolehkan koneksi masuk (UDP dan TCP) pada port ${port}.';
	@override String get openFirewall => 'Buka Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionId extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Kedua perangkat tidak dapat saling menemukan atau berbagi file.';
	@override String get solution => 'Masalah ada di kedua sisi? Maka Anda perlu memastikan bahwa kedua perangkat berada dalam jaringan wifi yang sama dan berbagi konfigurasi yang sama (port, alamat multicast, enkripsi). Wifi mungkin tidak memperbolehkan komunikasi antara peserta. Dalam hal ini, opsi ini harus diaktifkan pada router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsId extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get open => 'Buka file';
	@override String get info => 'Informasi';
	@override String get deleteFromHistory => 'Hapus dari riwayat';
}

// Path: progressPage.total
class _StringsProgressPageTotalId extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleId title = _StringsProgressPageTotalTitleId._(_root);
	@override String count({required Object curr, required Object n}) => 'File: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Ukuran: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Kecepatan: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileId extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tambah dalam pilihan';
	@override String get content => 'Apa yang akan ditambahkan?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputId extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukan Alamat';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Alamat IP';
	@override String get recentlyUsed => 'Baru saja digunakan: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionId extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Batalkan transfer file';
	@override String get content => 'Apakah Anda yakin untuk membatalkan pengiriman file?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileId extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak dapat membuka file';
	@override String content({required Object file}) => 'Tidak dapat membuka "${file}". Apakah file ini telah dipindahkan, diganti nama, atau dihapus?';
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
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoId extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informasi file';
	@override String get fileName => 'Nama file:';
	@override String get path => 'Path:';
	@override String get size => 'Ukuran:';
	@override String get sender => 'Pengirim:';
	@override String get time => 'Waktu:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputId extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukan nama file';
	@override String original({required Object original}) => 'Asli: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedId extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend tidak dapat menemukan perangkat lain tanpa izin untuk memindai jaringan lokal. Mohon berikan izin ini di pengaturan.';
	@override String get gotoSettings => 'Pengaturan';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputId extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ketik pesan';
	@override String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesId extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak ada file yang dipilih';
	@override String get content => 'Pilih setidaknya satu file.';
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
	@override String get title => 'Tindakan Cepat';
	@override String get counter => 'Counter';
	@override String get prefix => 'Awalan';
	@override String get padZero => 'Pad dengan nol';
	@override String get sortBeforeCount => 'Urutkan berdasarkan abjad sebelumnya';
	@override String get random => 'Acak';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeId extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Semua permintaan akan langsung diterima. Harap berhati-hati bahwa semua orang di jaringan lokal dapat mengirim file.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpId extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpId._(_StringsId root) : this._root = root, super._(root);

	@override final _StringsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode pengiriman';
	@override String get single => 'Mengirim file ke satu penerima. Pilihan akan dihapus setelah selesai mentransfer file.';
	@override String get multiple => 'Mengirim file ke beberapa penerima. Pilihan tidak akan dihapus.';
	@override String get link => 'Penerima yang tidak memiliki LocalSend dapat mengunduh file yang dipilih dengan membuka tautan di browser mereka.';
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
