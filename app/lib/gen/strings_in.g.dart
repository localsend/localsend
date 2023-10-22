part of 'strings.g.dart';

// Path: <root>
class _StringsIn extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.india,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <in>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsIn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Indonesian';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralIn general = _StringsGeneralIn._(_root);
	@override late final _StringsReceiveTabIn receiveTab = _StringsReceiveTabIn._(_root);
	@override late final _StringsSendTabIn sendTab = _StringsSendTabIn._(_root);
	@override late final _StringsSettingsTabIn settingsTab = _StringsSettingsTabIn._(_root);
	@override late final _StringsTroubleshootPageIn troubleshootPage = _StringsTroubleshootPageIn._(_root);
	@override late final _StringsReceiveHistoryPageIn receiveHistoryPage = _StringsReceiveHistoryPageIn._(_root);
	@override late final _StringsApkPickerPageIn apkPickerPage = _StringsApkPickerPageIn._(_root);
	@override late final _StringsSelectedFilesPageIn selectedFilesPage = _StringsSelectedFilesPageIn._(_root);
	@override late final _StringsReceivePageIn receivePage = _StringsReceivePageIn._(_root);
	@override late final _StringsReceiveOptionsPageIn receiveOptionsPage = _StringsReceiveOptionsPageIn._(_root);
	@override late final _StringsSendPageIn sendPage = _StringsSendPageIn._(_root);
	@override late final _StringsProgressPageIn progressPage = _StringsProgressPageIn._(_root);
	@override late final _StringsWebSharePageIn webSharePage = _StringsWebSharePageIn._(_root);
	@override late final _StringsAboutPageIn aboutPage = _StringsAboutPageIn._(_root);
	@override late final _StringsChangelogPageIn changelogPage = _StringsChangelogPageIn._(_root);
	@override late final _StringsAliasGeneratorIn aliasGenerator = _StringsAliasGeneratorIn._(_root);
	@override late final _StringsDialogsIn dialogs = _StringsDialogsIn._(_root);
	@override late final _StringsTrayIn tray = _StringsTrayIn._(_root);
	@override late final _StringsWebIn web = _StringsWebIn._(_root);
	@override late final _StringsAssetPickerIn assetPicker = _StringsAssetPickerIn._(_root);
}

// Path: general
class _StringsGeneralIn extends _StringsGeneralEn {
	_StringsGeneralIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

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
class _StringsReceiveTabIn extends _StringsReceiveTabEn {
	_StringsReceiveTabIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menerima';
	@override late final _StringsReceiveTabInfoBoxIn infoBox = _StringsReceiveTabInfoBoxIn._(_root);
}

// Path: sendTab
class _StringsSendTabIn extends _StringsSendTabEn {
	_StringsSendTabIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kirim';
	@override late final _StringsSendTabSelectionIn selection = _StringsSendTabSelectionIn._(_root);
	@override late final _StringsSendTabPickerIn picker = _StringsSendTabPickerIn._(_root);
	@override String get shareIntentInfo => 'Anda juga dapat menggunakan fitur "Berbagi" untuk memilih file dengan lebih mudah.';
	@override String get nearbyDevices => 'Perangkat terdekat';
	@override String get thisDevice => 'Perangkat ini';
	@override String get scan => 'Cari perangkat';
	@override String get sendMode => 'Mode pengiriman';
	@override late final _StringsSendTabSendModesIn sendModes = _StringsSendTabSendModesIn._(_root);
	@override String get sendModeHelp => 'Penjelasan';
	@override String get help => 'Pastikan perangkat terkoneksi pada jaringan yang sama.';
	@override String get placeItems => 'Tempatkan item untuk dibagikan.';
}

// Path: settingsTab
class _StringsSettingsTabIn extends _StringsSettingsTabEn {
	_StringsSettingsTabIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override late final _StringsSettingsTabGeneralIn general = _StringsSettingsTabGeneralIn._(_root);
	@override late final _StringsSettingsTabReceiveIn receive = _StringsSettingsTabReceiveIn._(_root);
	@override late final _StringsSettingsTabNetworkIn network = _StringsSettingsTabNetworkIn._(_root);
	@override String get advancedSettings => 'Pengaturan Lanjutan';
}

// Path: troubleshootPage
class _StringsTroubleshootPageIn extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perbaikan masalah';
	@override String get subTitle => 'Aplikasi ini tidak berfungsi seperti yang diharapkan? Di sini Anda dapat menemukan solusi umum.';
	@override String get solution => 'Solusi:';
	@override String get fixButton => 'Perbaiki secara otomatis';
	@override late final _StringsTroubleshootPageFirewallIn firewall = _StringsTroubleshootPageFirewallIn._(_root);
	@override late final _StringsTroubleshootPageNoConnectionIn noConnection = _StringsTroubleshootPageNoConnectionIn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageIn extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Riwayat';
	@override String get openFolder => 'Buka folder';
	@override String get deleteHistory => 'Hapus riwayat';
	@override String get empty => 'Riwayat kosong.';
	@override late final _StringsReceiveHistoryPageEntryActionsIn entryActions = _StringsReceiveHistoryPageEntryActionsIn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageIn extends _StringsApkPickerPageEn {
	_StringsApkPickerPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikasi (APK)';
	@override String get excludeSystemApps => 'Kecualikan aplikasi sistem';
	@override String get excludeAppsWithoutLaunchIntent => 'Kecualikan aplikasi yang tidak dapat diluncurkan';
	@override String apps({required Object n}) => '${n} Aplikasi';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageIn extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Hapus semua';
}

// Path: receivePage
class _StringsReceivePageIn extends _StringsReceivePageEn {
	_StringsReceivePageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('in'))(n,
		one: 'ingin mengirim file.',
		other: 'ingin mengirim ${n} file.',
	);
	@override String get subTitleMessage => 'mengirim pesan:';
	@override String get subTitleLink => 'mengirim link:';
	@override String get canceled => 'Pengirim membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageIn extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opsi';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Dimatikan secara otomatis karena ada direktori.';
}

// Path: sendPage
class _StringsSendPageIn extends _StringsSendPageEn {
	_StringsSendPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Menunggu respon...';
	@override String get rejected => 'Penerima menolak permintaan.';
	@override String get busy => 'Penerima sedang sibuk dengan permintaan lain.';
}

// Path: progressPage
class _StringsProgressPageIn extends _StringsProgressPageEn {
	_StringsProgressPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Mengirim file';
	@override String get titleReceiving => 'Menerima file';
	@override String get savedToGallery => 'Simpan ke galeri';
	@override late final _StringsProgressPageTotalIn total = _StringsProgressPageTotalIn._(_root);
}

// Path: webSharePage
class _StringsWebSharePageIn extends _StringsWebSharePageEn {
	_StringsWebSharePageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bagikan melalui tautan';
	@override String get loading => 'Memulai server...';
	@override String get stopping => 'Menghentikan server...';
	@override String get error => 'Terjadi kesalahan saat memulai server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('in'))(n,
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
class _StringsAboutPageIn extends _StringsAboutPageEn {
	_StringsAboutPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageIn extends _StringsChangelogPageEn {
	_StringsChangelogPageIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catatan Perubahan';
}

// Path: aliasGenerator
class _StringsAliasGeneratorIn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

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
class _StringsDialogsIn extends _StringsDialogsEn {
	_StringsDialogsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileIn addFile = _StringsDialogsAddFileIn._(_root);
	@override late final _StringsDialogsAddressInputIn addressInput = _StringsDialogsAddressInputIn._(_root);
	@override late final _StringsDialogsCancelSessionIn cancelSession = _StringsDialogsCancelSessionIn._(_root);
	@override late final _StringsDialogsCannotOpenFileIn cannotOpenFile = _StringsDialogsCannotOpenFileIn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeIn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeIn._(_root);
	@override late final _StringsDialogsErrorDialogIn errorDialog = _StringsDialogsErrorDialogIn._(_root);
	@override late final _StringsDialogsFileInfoIn fileInfo = _StringsDialogsFileInfoIn._(_root);
	@override late final _StringsDialogsFileNameInputIn fileNameInput = _StringsDialogsFileNameInputIn._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedIn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedIn._(_root);
	@override late final _StringsDialogsMessageInputIn messageInput = _StringsDialogsMessageInputIn._(_root);
	@override late final _StringsDialogsNoFilesIn noFiles = _StringsDialogsNoFilesIn._(_root);
	@override late final _StringsDialogsNoPermissionIn noPermission = _StringsDialogsNoPermissionIn._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformIn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformIn._(_root);
	@override late final _StringsDialogsQrIn qr = _StringsDialogsQrIn._(_root);
	@override late final _StringsDialogsQuickActionsIn quickActions = _StringsDialogsQuickActionsIn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeIn quickSaveNotice = _StringsDialogsQuickSaveNoticeIn._(_root);
	@override late final _StringsDialogsSendModeHelpIn sendModeHelp = _StringsDialogsSendModeHelpIn._(_root);
}

// Path: tray
class _StringsTrayIn extends _StringsTrayEn {
	_StringsTrayIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Tutup LocalSend';
}

// Path: web
class _StringsWebIn extends _StringsWebEn {
	_StringsWebIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Ditolak';
	@override String get files => 'Berkas';
	@override String get fileName => 'Nama file';
	@override String get size => 'Ukuran';
}

// Path: assetPicker
class _StringsAssetPickerIn extends _StringsAssetPickerEn {
	_StringsAssetPickerIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

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
class _StringsReceiveTabInfoBoxIn extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionIn extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan';
	@override String files({required Object files}) => 'File: ${files}';
	@override String size({required Object size}) => 'Ukuran: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerIn extends _StringsSendTabPickerEn {
	_StringsSendTabPickerIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get file => 'File';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Teks';
	@override String get app => 'Aplikasi';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesIn extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get single => 'Penerima tunggal';
	@override String get multiple => 'Penerima ganda';
	@override String get link => 'Bagikan melalui tautan';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralIn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Umum';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsIn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsIn._(_root);
	@override String get color => 'Warna';
	@override late final _StringsSettingsTabGeneralColorOptionsIn colorOptions = _StringsSettingsTabGeneralColorOptionsIn._(_root);
	@override String get language => 'Bahasa';
	@override late final _StringsSettingsTabGeneralLanguageOptionsIn languageOptions = _StringsSettingsTabGeneralLanguageOptionsIn._(_root);
	@override String get saveWindowPlacement => 'Keluar: Simpan posisi jendela';
	@override String get minimizeToTray => 'Keluar: Perkecil ke pojok bawah';
	@override String get launchAtStartup => 'Mulai otomatis setelah masuk';
	@override String get launchMinimized => 'Mulai otomatis: Berjalan di belakang';
	@override String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveIn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menerima';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Tujuan';
	@override String get downloads => '(Unduhan)';
	@override String get saveToGallery => 'Simpan media ke galeri';
	@override String get saveToHistory => 'Simpan ke riwayat';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkIn extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

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
class _StringsTroubleshootPageFirewallIn extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aplikasi ini dapat mengirim file ke perangkat lain tetapi perangkat lain tidak dapat mengirim file ke perangkat ini.';
	@override String solution({required Object port}) => 'Ini kemungkinan masalah firewall. Anda dapat memperbaikinya dengan memperbolehkan koneksi masuk (UDP dan TCP) pada port ${port}.';
	@override String get openFirewall => 'Buka Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionIn extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Kedua perangkat tidak dapat saling menemukan atau berbagi file.';
	@override String get solution => 'Masalah ada di kedua sisi? Maka Anda perlu memastikan bahwa kedua perangkat berada dalam jaringan wifi yang sama dan berbagi konfigurasi yang sama (port, alamat multicast, enkripsi). Wifi mungkin tidak memperbolehkan komunikasi antara peserta. Dalam hal ini, opsi ini harus diaktifkan pada router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsIn extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get open => 'Buka file';
	@override String get info => 'Informasi';
	@override String get deleteFromHistory => 'Hapus dari riwayat';
}

// Path: progressPage.total
class _StringsProgressPageTotalIn extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleIn title = _StringsProgressPageTotalTitleIn._(_root);
	@override String count({required Object curr, required Object n}) => 'File: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Ukuran: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Kecepatan: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileIn extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tambah dalam pilihan';
	@override String get content => 'Apa yang akan ditambahkan?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputIn extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukan Alamat';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Alamat IP';
	@override String get recentlyUsed => 'Baru saja digunakan: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionIn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Batalkan transfer file';
	@override String get content => 'Apakah Anda yakin untuk membatalkan pengiriman file?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileIn extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak dapat membuka file';
	@override String content({required Object file}) => 'Tidak dapat membuka "${file}". Apakah file ini telah dipindahkan, diganti nama, atau dihapus?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeIn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enkripsi dinonaktifkan';
	@override String get content => 'Komunikasi sekarang terjadi melalui protokol HTTP yang tidak terenkripsi. Untuk menggunakan HTTPS, aktifkan kembali enkripsi.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogIn extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoIn extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informasi file';
	@override String get fileName => 'Nama file:';
	@override String get path => 'Path:';
	@override String get size => 'Ukuran:';
	@override String get sender => 'Pengirim:';
	@override String get time => 'Waktu:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputIn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masukan nama file';
	@override String original({required Object original}) => 'Asli: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedIn extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend tidak dapat menemukan perangkat lain tanpa izin untuk memindai jaringan lokal. Mohon berikan izin ini di pengaturan.';
	@override String get gotoSettings => 'Pengaturan';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputIn extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ketik pesan';
	@override String get multiline => 'Multiline';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesIn extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak ada file yang dipilih';
	@override String get content => 'Pilih setidaknya satu file.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionIn extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak ada izin';
	@override String get content => 'Anda belum memberikan izin yang diperlukan. Harap berikan izin tersebut di pengaturan.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformIn extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tidak tersedia';
	@override String get content => 'Fitur ini hanya tersedia di:';
}

// Path: dialogs.qr
class _StringsDialogsQrIn extends _StringsDialogsQrEn {
	_StringsDialogsQrIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kode QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsIn extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tindakan Cepat';
	@override String get counter => 'Counter';
	@override String get prefix => 'Awalan';
	@override String get padZero => 'Pad dengan nol';
	@override String get sortBeforeCount => 'Urutkan berdasarkan abjad sebelumnya';
	@override String get random => 'Acak';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeIn extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Semua permintaan akan langsung diterima. Harap berhati-hati bahwa semua orang di jaringan lokal dapat mengirim file.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpIn extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode pengiriman';
	@override String get single => 'Mengirim file ke satu penerima. Pilihan akan dihapus setelah selesai mentransfer file.';
	@override String get multiple => 'Mengirim file ke beberapa penerima. Pilihan tidak akan dihapus.';
	@override String get link => 'Penerima yang tidak memiliki LocalSend dapat mengunduh file yang dipilih dengan membuka tautan di browser mereka.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsIn extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get dark => 'Gelap';
	@override String get light => 'Terang';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsIn extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsIn extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleIn extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleIn._(_StringsIn root) : this._root = root, super._(root);

	@override final _StringsIn _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Total proses (${time})';
	@override String get finishedError => 'Selesai dengan kesalahan';
	@override String get canceledSender => 'Dibatalkan oleh pengirim';
	@override String get canceledReceiver => 'Dibatalkan oleh penerima';
}
