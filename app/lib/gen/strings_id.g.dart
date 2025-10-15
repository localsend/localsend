///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.id,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <id>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsId _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Indonesian';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralId general = _TranslationsGeneralId._(_root);
  @override
  late final _TranslationsReceiveTabId receiveTab = _TranslationsReceiveTabId._(_root);
  @override
  late final _TranslationsSendTabId sendTab = _TranslationsSendTabId._(_root);
  @override
  late final _TranslationsSettingsTabId settingsTab = _TranslationsSettingsTabId._(_root);
  @override
  late final _TranslationsTroubleshootPageId troubleshootPage = _TranslationsTroubleshootPageId._(_root);
  @override
  late final _TranslationsReceiveHistoryPageId receiveHistoryPage = _TranslationsReceiveHistoryPageId._(_root);
  @override
  late final _TranslationsApkPickerPageId apkPickerPage = _TranslationsApkPickerPageId._(_root);
  @override
  late final _TranslationsSelectedFilesPageId selectedFilesPage = _TranslationsSelectedFilesPageId._(_root);
  @override
  late final _TranslationsReceivePageId receivePage = _TranslationsReceivePageId._(_root);
  @override
  late final _TranslationsReceiveOptionsPageId receiveOptionsPage = _TranslationsReceiveOptionsPageId._(_root);
  @override
  late final _TranslationsSendPageId sendPage = _TranslationsSendPageId._(_root);
  @override
  late final _TranslationsProgressPageId progressPage = _TranslationsProgressPageId._(_root);
  @override
  late final _TranslationsWebSharePageId webSharePage = _TranslationsWebSharePageId._(_root);
  @override
  late final _TranslationsAboutPageId aboutPage = _TranslationsAboutPageId._(_root);
  @override
  late final _TranslationsDonationPageId donationPage = _TranslationsDonationPageId._(_root);
  @override
  late final _TranslationsChangelogPageId changelogPage = _TranslationsChangelogPageId._(_root);
  @override
  late final _TranslationsAliasGeneratorId aliasGenerator = _TranslationsAliasGeneratorId._(_root);
  @override
  late final _TranslationsDialogsId dialogs = _TranslationsDialogsId._(_root);
  @override
  late final _TranslationsSanitizationId sanitization = _TranslationsSanitizationId._(_root);
  @override
  late final _TranslationsTrayId tray = _TranslationsTrayId._(_root);
  @override
  late final _TranslationsWebId web = _TranslationsWebId._(_root);
  @override
  late final _TranslationsAssetPickerId assetPicker = _TranslationsAssetPickerId._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageId networkInterfacesPage = _TranslationsNetworkInterfacesPageId._(_root);
}

// Path: general
class _TranslationsGeneralId extends TranslationsGeneralEn {
  _TranslationsGeneralId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Terima';
  @override
  String get accepted => 'Diterima';
  @override
  String get add => 'Tambah';
  @override
  String get advanced => 'Lanjutan';
  @override
  String get cancel => 'Batal';
  @override
  String get close => 'Tutup';
  @override
  String get confirm => 'Konfirmasi';
  @override
  String get continueStr => 'Lanjut';
  @override
  String get copy => 'Salin';
  @override
  String get copiedToClipboard => 'Disalin ke Papan Klip';
  @override
  String get decline => 'Tolak';
  @override
  String get done => 'Selesai';
  @override
  String get delete => 'Hapus';
  @override
  String get edit => 'Sunting';
  @override
  String get error => 'Galat';
  @override
  String get example => 'Contoh';
  @override
  String get files => 'Berkas';
  @override
  String get finished => 'Selesai';
  @override
  String get hide => 'Sembunyikan';
  @override
  String get off => 'Mati';
  @override
  String get offline => 'Luring';
  @override
  String get on => 'Hidup';
  @override
  String get online => 'Daring';
  @override
  String get open => 'Buka';
  @override
  String get queue => 'Antrean';
  @override
  String get quickSave => 'Penyimpanan Cepat';
  @override
  String get quickSaveFromFavorites => 'Simpan Cepat di “Favorit”';
  @override
  String get renamed => 'Ganti nama';
  @override
  String get reset => 'Batalkan perubahan';
  @override
  String get restart => 'Mengulang Kembali';
  @override
  String get settings => 'Pengaturan';
  @override
  String get skipped => 'Dilewati';
  @override
  String get start => 'Mulai';
  @override
  String get stop => 'Berhenti';
  @override
  String get save => 'Simpan';
  @override
  String get unchanged => 'Takberubah';
  @override
  String get unknown => 'Takdikenal';
  @override
  String get noItemInClipboard => 'Tidak ada item di Papan Klip.';
}

// Path: receiveTab
class _TranslationsReceiveTabId extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Terima';
  @override
  late final _TranslationsReceiveTabInfoBoxId infoBox = _TranslationsReceiveTabInfoBoxId._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveId quickSave = _TranslationsReceiveTabQuickSaveId._(_root);
}

// Path: sendTab
class _TranslationsSendTabId extends TranslationsSendTabEn {
  _TranslationsSendTabId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirim';
  @override
  late final _TranslationsSendTabSelectionId selection = _TranslationsSendTabSelectionId._(_root);
  @override
  late final _TranslationsSendTabPickerId picker = _TranslationsSendTabPickerId._(_root);
  @override
  String get shareIntentInfo => 'Anda juga dapat menggunakan fitur "Berbagi" agar dapat memilih berkas dengan lebih mudah.';
  @override
  String get nearbyDevices => 'Perangkat Terdekat';
  @override
  String get thisDevice => 'Perangkat Ini';
  @override
  String get scan => 'Cari perangkat';
  @override
  String get manualSending => 'Kirim secara manual';
  @override
  String get sendMode => 'Mode Pengiriman';
  @override
  late final _TranslationsSendTabSendModesId sendModes = _TranslationsSendTabSendModesId._(_root);
  @override
  String get sendModeHelp => 'Penjelasan';
  @override
  String get help => 'Pastikan perangkat tujuan juga terkoneksi pada jaringan Wi-Fi yang sama.';
  @override
  String get placeItems => 'Letakkan item untuk dibagikan.';
}

// Path: settingsTab
class _TranslationsSettingsTabId extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pengaturan';
  @override
  late final _TranslationsSettingsTabGeneralId general = _TranslationsSettingsTabGeneralId._(_root);
  @override
  late final _TranslationsSettingsTabReceiveId receive = _TranslationsSettingsTabReceiveId._(_root);
  @override
  late final _TranslationsSettingsTabSendId send = _TranslationsSettingsTabSendId._(_root);
  @override
  late final _TranslationsSettingsTabNetworkId network = _TranslationsSettingsTabNetworkId._(_root);
  @override
  late final _TranslationsSettingsTabOtherId other = _TranslationsSettingsTabOtherId._(_root);
  @override
  String get advancedSettings => 'Pengaturan Lanjutan';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageId extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Perbaikan Masalah';
  @override
  String get subTitle => 'Aplikasi ini tidak berfungsi seperti yang diharapkan? Temukan penyelesaian masalah umum di sini.';
  @override
  String get solution => 'Penyelesaian:';
  @override
  String get fixButton => 'Perbaiki secara otomatis';
  @override
  late final _TranslationsTroubleshootPageFirewallId firewall = _TranslationsTroubleshootPageFirewallId._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryId noDiscovery = _TranslationsTroubleshootPageNoDiscoveryId._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionId noConnection = _TranslationsTroubleshootPageNoConnectionId._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageId extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Riwayat';
  @override
  String get openFolder => 'Buka folder';
  @override
  String get deleteHistory => 'Hapus riwayat';
  @override
  String get empty => 'Riwayat kosong.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsId entryActions = _TranslationsReceiveHistoryPageEntryActionsId._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageId extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikasi (APK)';
  @override
  String get excludeSystemApps => 'Kecualikan aplikasi sistem';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Kecualikan aplikasi yang tidak dapat diluncurkan';
  @override
  String apps({required Object n}) => '${n} Aplikasi';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageId extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Hapus semua';
}

// Path: receivePage
class _TranslationsReceivePageId extends TranslationsReceivePageEn {
  _TranslationsReceivePageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(
    n,
    one: 'ingin mengirimi Anda sebuah berkas',
    other: 'ingin mengirimi Anda ${n} berkas',
  );
  @override
  String get subTitleMessage => 'mengirimi Anda pesan sbb.:';
  @override
  String get subTitleLink => 'mengirimi Anda tautan sbb.:';
  @override
  String get canceled => 'Pengirim membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageId extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pilihan';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(folder LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Dimatikan secara otomatis karena ada direktori.';
}

// Path: sendPage
class _TranslationsSendPageId extends TranslationsSendPageEn {
  _TranslationsSendPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Menunggu tanggapan…';
  @override
  String get rejected => 'Penerima menolak permintaan.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Penerima sedang sibuk dengan permintaan lain.';
}

// Path: progressPage
class _TranslationsProgressPageId extends TranslationsProgressPageEn {
  _TranslationsProgressPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Mengirim Berkas';
  @override
  String get titleReceiving => 'Menerima Berkas';
  @override
  String get savedToGallery => 'Simpan di galeri';
  @override
  late final _TranslationsProgressPageTotalId total = _TranslationsProgressPageTotalId._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageId extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bagikan melalui Tautan';
  @override
  String get loading => 'Memulai peladen…';
  @override
  String get stopping => 'Menghentikan peladen…';
  @override
  String get error => 'Ada galat saat menjalankan peladen.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(
    n,
    one: 'Buka tautan ini di peramban:',
    other: 'Buka salah satu tautan ini di peramban:',
  );
  @override
  String get requests => 'Permintaan';
  @override
  String get noRequests => 'Belum ada permintaan.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Terima permintaan secara otomatis';
  @override
  String get requirePin => 'Memerlukan PIN';
  @override
  String pinHint({required Object pin}) => 'PIN-nya adalah "${pin}"';
  @override
  String get encryptionHint => 'LocalSend menggunakan sertifikat self-signed. Anda perlu menerimanya di peramban.';
  @override
  String pendingRequests({required Object n}) => 'Banyaknya permintaan yang tertunda: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageId extends TranslationsAboutPageEn {
  _TranslationsAboutPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tentang LocalSend';
  @override
  List<String> get description => [
    'LocalSend adalah aplikasi gratis dan bersumber terbuka yang memungkinkan Anda untuk membagikan berkas dan pesan secara aman dengan perangkat lain yang terhubung pada jaringan lokal tanpa memerlukan koneksi internet atau paket data.',
    'Aplikasi ini tersedia untuk platform Android, iOS, macOS, Windows, dan Linux. Semua pilihan pengunduhan dapat ditemukan di laman situs resmi kami.',
  ];
  @override
  String get author => 'Pembuat';
  @override
  String get contributors => 'Daftar Kontributor';
  @override
  String get packagers => 'Pengemas';
  @override
  String get translators => 'Daftar Penerjemah';
}

// Path: donationPage
class _TranslationsDonationPageId extends TranslationsDonationPageEn {
  _TranslationsDonationPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donasi';
  @override
  String get info =>
      'LocalSend adalah aplikasi gratis, bersumber terbuka, dan bebas iklan. Jika Anda menyukai aplikasi ini, mohon berikan kami dukungan dengan cara memberikan donasi.';
  @override
  String donate({required Object amount}) => 'Donasi ${amount}';
  @override
  String get thanks => 'Terima kasih banyak!';
  @override
  String get restore => 'Kembalikan dana';
}

// Path: changelogPage
class _TranslationsChangelogPageId extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Catatan Perubahan';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorId extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsId extends TranslationsDialogsEn {
  _TranslationsDialogsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileId addFile = _TranslationsDialogsAddFileId._(_root);
  @override
  late final _TranslationsDialogsOpenFileId openFile = _TranslationsDialogsOpenFileId._(_root);
  @override
  late final _TranslationsDialogsAddressInputId addressInput = _TranslationsDialogsAddressInputId._(_root);
  @override
  late final _TranslationsDialogsCancelSessionId cancelSession = _TranslationsDialogsCancelSessionId._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileId cannotOpenFile = _TranslationsDialogsCannotOpenFileId._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeId encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeId._(_root);
  @override
  late final _TranslationsDialogsErrorDialogId errorDialog = _TranslationsDialogsErrorDialogId._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogId favoriteDialog = _TranslationsDialogsFavoriteDialogId._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogId favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogId._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogId favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogId._(_root);
  @override
  late final _TranslationsDialogsFileInfoId fileInfo = _TranslationsDialogsFileInfoId._(_root);
  @override
  late final _TranslationsDialogsFileNameInputId fileNameInput = _TranslationsDialogsFileNameInputId._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogId historyClearDialog = _TranslationsDialogsHistoryClearDialogId._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedId localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedId._(_root);
  @override
  late final _TranslationsDialogsMessageInputId messageInput = _TranslationsDialogsMessageInputId._(_root);
  @override
  late final _TranslationsDialogsNoFilesId noFiles = _TranslationsDialogsNoFilesId._(_root);
  @override
  late final _TranslationsDialogsNoPermissionId noPermission = _TranslationsDialogsNoPermissionId._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformId notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformId._(_root);
  @override
  late final _TranslationsDialogsQrId qr = _TranslationsDialogsQrId._(_root);
  @override
  late final _TranslationsDialogsQuickActionsId quickActions = _TranslationsDialogsQuickActionsId._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeId quickSaveNotice = _TranslationsDialogsQuickSaveNoticeId._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeId quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeId._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinId pin = _TranslationsDialogsPinId._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpId sendModeHelp = _TranslationsDialogsSendModeHelpId._(_root);
  @override
  late final _TranslationsDialogsZoomId zoom = _TranslationsDialogsZoomId._(_root);
}

// Path: sanitization
class _TranslationsSanitizationId extends TranslationsSanitizationEn {
  _TranslationsSanitizationId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Nama berkas tidak boleh kosong';
  @override
  String get invalid => 'Nama berkas mengandung karakter yang takvalid';
}

// Path: tray
class _TranslationsTrayId extends TranslationsTrayEn {
  _TranslationsTrayId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Tutup LocalSend';
  @override
  String get closeWindows => 'Keluar';
}

// Path: web
class _TranslationsWebId extends TranslationsWebEn {
  _TranslationsWebId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Masukkan PIN';
  @override
  String get invalidPin => 'PIN Salah';
  @override
  String get tooManyAttempts => 'Terlalu banyak percobaan';
  @override
  String get rejected => 'Ditolak';
  @override
  String get files => 'Berkas';
  @override
  String get fileName => 'Nama Berkas';
  @override
  String get size => 'Ukuran';
}

// Path: assetPicker
class _TranslationsAssetPickerId extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Konfirmasikan';
  @override
  String get cancel => 'Batalkan';
  @override
  String get edit => 'Sunting';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Gagal memuat';
  @override
  String get original => 'Asli';
  @override
  String get preview => 'Pratinjau';
  @override
  String get select => 'Pilih';
  @override
  String get emptyList => 'Daftar kosong';
  @override
  String get unSupportedAssetType => 'Jenis berkas tidak didukung.';
  @override
  String get unableToAccessAll => 'Tidak dapat mengakses semua berkas di perangkat';
  @override
  String get viewingLimitedAssetsTip => 'Hanya melihat berkas dan album yang dapat diakses oleh aplikasi.';
  @override
  String get changeAccessibleLimitedAssets => 'Klik untuk memutakhirkan berkas yang dapat diakses';
  @override
  String get accessAllTip =>
      'Aplikasi hanya dapat mengakses beberapa berkas di perangkat. Pergi ke pengaturan sistem dan izinkan aplikasi untuk mengakses semua media di perangkat.';
  @override
  String get goToSystemSettings => 'Ke pengaturan sistem';
  @override
  String get accessLimitedAssets => 'Lanjutkan dengan akses terbatas';
  @override
  String get accessiblePathName => 'Berkas yang dapat diakses';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Gambar';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Media lainnya';
  @override
  String get sActionPlayHint => 'Putar';
  @override
  String get sActionPreviewHint => 'Pratinjau';
  @override
  String get sActionSelectHint => 'Pilih';
  @override
  String get sActionSwitchPathLabel => 'Ubah jalur';
  @override
  String get sActionUseCameraHint => 'Gunakan kamera';
  @override
  String get sNameDurationLabel => 'Durasi';
  @override
  String get sUnitAssetCountLabel => 'Jumlah';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageId extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Antarmuka Jaringan';
  @override
  String get preview => 'Pratinjau';
  @override
  String get whitelist => 'Daftar putih';
  @override
  String get blacklist => 'Daftar hitam';
  @override
  String get info =>
      'Secara default, LocalSend menggunakan semua antarmuka jaringan yang tersedia. Anda dapat mengecualikan jaringan yang tidak diinginkan di sini. Anda perlu memulai ulang server untuk menerapkan perubahan.';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxId extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porta:';
  @override
  String get alias => 'Nama perangkat:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveId extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favorit';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionId extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pilihan';
  @override
  String files({required Object files}) => 'Berkas: ${files}';
  @override
  String size({required Object size}) => 'Ukuran: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerId extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Berkas';
  @override
  String get folder => 'Direktori';
  @override
  String get media => 'Media';
  @override
  String get text => 'Teks';
  @override
  String get app => 'Aplikasi';
  @override
  String get clipboard => 'Tempel';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesId extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Penerima tunggal';
  @override
  String get multiple => 'Banyak penerima';
  @override
  String get link => 'Bagikan melalui tautan';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralId extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Umum';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsId brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsId._(_root);
  @override
  String get color => 'Warna';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsId colorOptions = _TranslationsSettingsTabGeneralColorOptionsId._(_root);
  @override
  String get language => 'Bahasa';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsId languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsId._(_root);
  @override
  String get saveWindowPlacement => 'Keluar: Simpan posisi jendela';
  @override
  String get saveWindowPlacementWindows => 'Simpan posisi jendela setelah keluar';
  @override
  String get minimizeToTray => 'Keluar: Perkecil ke pojok bawah';
  @override
  String get launchAtStartup => 'Mulai otomatis setelah masuk';
  @override
  String get launchMinimized => 'Mulai otomatis: Berjalan di latar';
  @override
  String get showInContextMenu => 'Tampilkan LocalSend di menu konteks';
  @override
  String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveId extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Menerima';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Selesai Otomatis';
  @override
  String get destination => 'Tujuan';
  @override
  String get downloads => '(Unduhan)';
  @override
  String get saveToGallery => 'Simpan media ke galeri';
  @override
  String get saveToHistory => 'Simpan ke riwayat';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendId extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirim';
  @override
  String get shareViaLinkAutoAccept => 'Bagikan melalui tautan: Terima otomatis';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkId extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Jaringan';
  @override
  String get needRestart => 'Mulai ulang agar dapat menerapkan pengaturan!';
  @override
  String get server => 'Peladen';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Tipe Perangkat';
  @override
  String get deviceModel => 'Model Perangkat';
  @override
  String get port => 'Porta';
  @override
  String get discoveryTimeout => 'Waktu penemuan habis';
  @override
  String get useSystemName => 'Gunakan nama sistem';
  @override
  String get generateRandomAlias => 'Hasilkan alias acak';
  @override
  String portWarning({required Object defaultPort}) =>
      'Anda mungkin tidak terdeteksi oleh perangkat lain karena menggunakan porta kustom. (bawaan: ${defaultPort})';
  @override
  String get encryption => 'Enkripsi';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Anda mungkin tidak terdeteksi oleh perangkat lain karena menggunakan alamat multicast khusus. (bawaan: ${defaultMulticast})';
  @override
  String get network => 'Jaringan';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsId networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsId._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherId extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lainnya';
  @override
  String get support => 'Dukung LocalSend';
  @override
  String get donate => 'Donasi';
  @override
  String get privacyPolicy => 'Kebijakan Privasi';
  @override
  String get termsOfUse => 'Syarat dan Ketentuan Penggunaan';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallId extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Aplikasi ini dapat mengirim berkas ke perangkat lain, tetapi tidak sebaliknya.';
  @override
  String solution({required Object port}) =>
      'Hal ini kemungkinan merupakan masalah tembok api (firewall). Anda dapat memperbaiki masalah ini dengan memperbolehkan koneksi masuk (UDP dan TCP) pada porta ${port}.';
  @override
  String get openFirewallSettings => 'Buka Tembok Api';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryId extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Perangkat ini tidak dapat menemukan perangkat lain.';
  @override
  String get solution =>
      'Pastikan semua perangkat berada pada jaringan Wi-Fi yang sama dan menggunakan konfigurasi yang sama (porta, alamat multicast, dan enkripsi). Anda dapat mencoba mengetik alamat IP perangkat target secara manual. Jika cara ini berhasil, pertimbangkan menambahkan perangkat ini ke daftar favorit sehingga perangkat dapat ditemukan secara otomatis pada lain waktu.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionId extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Kedua perangkat tidak dapat saling menemukan dan berbagi berkas.';
  @override
  String get solution =>
      'Pastikan kedua perangkat berada pada jaringan Wi-Fi yang sama dan berbagi konfigurasi yang sama (porta, alamat multicast, enkripsi). Jika Wi-Fi tidak mengizinkan komunikasi, aktifkan pilihan ini pada ruter.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsId extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Buka berkas';
  @override
  String get showInFolder => 'Tampilkan di folder';
  @override
  String get info => 'Informasi';
  @override
  String get deleteFromHistory => 'Hapus dari riwayat';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalId extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleId title = _TranslationsProgressPageTotalTitleId._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Berkas: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Ukuran: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Kecepatan: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileId extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tambahkan dalam pilihan';
  @override
  String get content => 'Apa yang ingin Anda tambahkan?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileId extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Buka berkas';
  @override
  String get content => 'Anda ingin membuka berkas yang diterima?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputId extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan Alamat';
  @override
  String get hashtag => 'Tagar';
  @override
  String get ip => 'Alamat IP';
  @override
  String get recentlyUsed => 'Baru saja digunakan: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionId extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Batalkan pentransferan berkas';
  @override
  String get content => 'Anda yakin ingin membatalkan pengiriman berkas?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileId extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak dapat membuka berkas';
  @override
  String content({required Object file}) => 'Tidak dapat membuka "${file}". Apakah berkas ini telah dipindahkan, berganti nama, atau dihapus?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeId extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enkripsi dinonaktifkan';
  @override
  String get content => 'Komunikasi sekarang terjadi melalui protokol HTTP yang takterenkripsi. Untuk menggunakan HTTPS, aktifkan kembali enkripsi.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogId extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogId extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorit';
  @override
  String get noFavorites => 'Tidak ada perangkat favorit.';
  @override
  String get addFavorite => 'Tambah';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogId extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hapus dari daftar favorit';
  @override
  String content({required Object name}) => 'Anda yakin ingin menghapus ini dari daftar favorit? "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogId extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Tambah ke daftar favorit';
  @override
  String get titleEdit => 'Pengaturan';
  @override
  String get name => 'Nama perangkat';
  @override
  String get auto => '(otomatis)';
  @override
  String get ip => 'Alamat IP';
  @override
  String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoId extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informasi Berkas';
  @override
  String get fileName => 'Nama Berkas:';
  @override
  String get path => 'Lokasi:';
  @override
  String get size => 'Ukuran:';
  @override
  String get sender => 'Pengirim:';
  @override
  String get time => 'Waktu:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputId extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan nama berkas';
  @override
  String original({required Object original}) => 'Asli: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogId extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hapus Riwayat';
  @override
  String get content => 'Anda yakin ingin menghapus seluruh riwayat?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedId extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend tidak dapat menemukan perangkat lain tanpa izin untuk memindai jaringan lokal. Mohon berikan izin ini di pengaturan.';
  @override
  String get gotoSettings => 'Pengaturan';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputId extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ketik pesan';
  @override
  String get multiline => 'Baris Ganda';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesId extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak ada berkas yang dipilih';
  @override
  String get content => 'Pilih setidaknya satu berkas.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionId extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak ada izin';
  @override
  String get content => 'Anda belum memberikan izin yang diperlukan. Harap berikan izin tersebut di pengaturan.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformId extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak tersedia';
  @override
  String get content => 'Fitur ini hanya tersedia di:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrId extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kode QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsId extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aksi Cepat';
  @override
  String get counter => 'Penghitung';
  @override
  String get prefix => 'Awalan';
  @override
  String get padZero => 'Isi dengan nol';
  @override
  String get sortBeforeCount => 'Urutkan berdasarkan abjad sebelumnya';
  @override
  String get random => 'Acak';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeId extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Semua permintaan akan langsung diterima. Harap berhati-hati bahwa semua orang di jaringan lokal dapat mengirim berkas.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeId extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Permintaan berkas sekarang diterima secara otomatis dari perangkat di daftar favorit Anda.',
    'Peringatan! Saat ini, pilihan ini tidak sepenuhnya aman karena peretas yang memiliki sidik jari perangkat apa pun dari daftar favorit Anda dapat mengirimi Anda berkas tanpa pembatasan.',
    'Akan tetapi, pilihan ini masih lebih aman daripada mengizinkan semua pengguna di jaringan lokal mengirimkan berkas kepada Anda tanpa pembatasan.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinId extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpId extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mode Pengiriman';
  @override
  String get single => 'Mengirim berkas ke satu penerima. Pilihan penerima akan dihapus setelah selesai membagikan berkas.';
  @override
  String get multiple => 'Mengirim berkas ke beberapa penerima. Pilihan penerima tidak akan dihapus.';
  @override
  String get link => 'Penerima yang tidak memiliki LocalSend dapat mengunduh berkas yang dipilih dengan membuka tautan di peramban.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomId extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsId extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Gelap';
  @override
  String get light => 'Terang';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsId extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsId extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsId extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Semua';
  @override
  String get filtered => 'Tersaring';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleId extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleId._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Total proses (${time})';
  @override
  String get finishedError => 'Selesai, tetapi ada galat';
  @override
  String get canceledSender => 'Dibatalkan pengirim';
  @override
  String get canceledReceiver => 'Dibatalkan penerima';
}
