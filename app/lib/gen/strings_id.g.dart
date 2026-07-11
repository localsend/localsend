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
class TranslationsId extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsId({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Indonesian';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$id general = _Translations$general$id._(_root);
  @override
  late final _Translations$receiveTab$id receiveTab = _Translations$receiveTab$id._(_root);
  @override
  late final _Translations$sendTab$id sendTab = _Translations$sendTab$id._(_root);
  @override
  late final _Translations$settingsTab$id settingsTab = _Translations$settingsTab$id._(_root);
  @override
  late final _Translations$troubleshootPage$id troubleshootPage = _Translations$troubleshootPage$id._(_root);
  @override
  late final _Translations$receiveHistoryPage$id receiveHistoryPage = _Translations$receiveHistoryPage$id._(_root);
  @override
  late final _Translations$apkPickerPage$id apkPickerPage = _Translations$apkPickerPage$id._(_root);
  @override
  late final _Translations$selectedFilesPage$id selectedFilesPage = _Translations$selectedFilesPage$id._(_root);
  @override
  late final _Translations$receivePage$id receivePage = _Translations$receivePage$id._(_root);
  @override
  late final _Translations$receiveOptionsPage$id receiveOptionsPage = _Translations$receiveOptionsPage$id._(_root);
  @override
  late final _Translations$sendPage$id sendPage = _Translations$sendPage$id._(_root);
  @override
  late final _Translations$progressPage$id progressPage = _Translations$progressPage$id._(_root);
  @override
  late final _Translations$webSharePage$id webSharePage = _Translations$webSharePage$id._(_root);
  @override
  late final _Translations$aboutPage$id aboutPage = _Translations$aboutPage$id._(_root);
  @override
  late final _Translations$donationPage$id donationPage = _Translations$donationPage$id._(_root);
  @override
  late final _Translations$changelogPage$id changelogPage = _Translations$changelogPage$id._(_root);
  @override
  late final _Translations$dialogs$id dialogs = _Translations$dialogs$id._(_root);
  @override
  late final _Translations$sanitization$id sanitization = _Translations$sanitization$id._(_root);
  @override
  late final _Translations$tray$id tray = _Translations$tray$id._(_root);
  @override
  late final _Translations$web$id web = _Translations$web$id._(_root);
  @override
  late final _Translations$assetPicker$id assetPicker = _Translations$assetPicker$id._(_root);
  @override
  late final _Translations$networkInterfacesPage$id networkInterfacesPage = _Translations$networkInterfacesPage$id._(_root);
}

// Path: general
class _Translations$general$id extends Translations$general$en {
  _Translations$general$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$id extends Translations$receiveTab$en {
  _Translations$receiveTab$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Terima';
  @override
  late final _Translations$receiveTab$infoBox$id infoBox = _Translations$receiveTab$infoBox$id._(_root);
  @override
  late final _Translations$receiveTab$quickSave$id quickSave = _Translations$receiveTab$quickSave$id._(_root);
}

// Path: sendTab
class _Translations$sendTab$id extends Translations$sendTab$en {
  _Translations$sendTab$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirim';
  @override
  late final _Translations$sendTab$selection$id selection = _Translations$sendTab$selection$id._(_root);
  @override
  late final _Translations$sendTab$picker$id picker = _Translations$sendTab$picker$id._(_root);
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
  late final _Translations$sendTab$sendModes$id sendModes = _Translations$sendTab$sendModes$id._(_root);
  @override
  String get sendModeHelp => 'Penjelasan';
  @override
  String get help => 'Pastikan perangkat tujuan juga terkoneksi pada jaringan Wi-Fi yang sama.';
  @override
  String get placeItems => 'Letakkan item untuk dibagikan.';
}

// Path: settingsTab
class _Translations$settingsTab$id extends Translations$settingsTab$en {
  _Translations$settingsTab$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pengaturan';
  @override
  late final _Translations$settingsTab$general$id general = _Translations$settingsTab$general$id._(_root);
  @override
  late final _Translations$settingsTab$receive$id receive = _Translations$settingsTab$receive$id._(_root);
  @override
  late final _Translations$settingsTab$send$id send = _Translations$settingsTab$send$id._(_root);
  @override
  late final _Translations$settingsTab$network$id network = _Translations$settingsTab$network$id._(_root);
  @override
  late final _Translations$settingsTab$other$id other = _Translations$settingsTab$other$id._(_root);
  @override
  String get advancedSettings => 'Pengaturan Lanjutan';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$id extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$id firewall = _Translations$troubleshootPage$firewall$id._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$id noDiscovery = _Translations$troubleshootPage$noDiscovery$id._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$id noConnection = _Translations$troubleshootPage$noConnection$id._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$id extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$id entryActions = _Translations$receiveHistoryPage$entryActions$id._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$id extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$id extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Hapus semua';
}

// Path: receivePage
class _Translations$receivePage$id extends Translations$receivePage$en {
  _Translations$receivePage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$receiveOptionsPage$id extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pilihan';
  @override
  String get appDirectory => '(folder LocalSend)';
  @override
  String get saveToGalleryOff => 'Dimatikan secara otomatis karena ada direktori.';
}

// Path: sendPage
class _Translations$sendPage$id extends Translations$sendPage$en {
  _Translations$sendPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$id extends Translations$progressPage$en {
  _Translations$progressPage$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Mengirim Berkas';
  @override
  String get titleReceiving => 'Menerima Berkas';
  @override
  String get savedToGallery => 'Simpan di galeri';
  @override
  late final _Translations$progressPage$total$id total = _Translations$progressPage$total$id._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$id extends Translations$webSharePage$en {
  _Translations$webSharePage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$id extends Translations$aboutPage$en {
  _Translations$aboutPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$id extends Translations$donationPage$en {
  _Translations$donationPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$id extends Translations$changelogPage$en {
  _Translations$changelogPage$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Catatan Perubahan';
}

// Path: dialogs
class _Translations$dialogs$id extends Translations$dialogs$en {
  _Translations$dialogs$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$id addFile = _Translations$dialogs$addFile$id._(_root);
  @override
  late final _Translations$dialogs$openFile$id openFile = _Translations$dialogs$openFile$id._(_root);
  @override
  late final _Translations$dialogs$addressInput$id addressInput = _Translations$dialogs$addressInput$id._(_root);
  @override
  late final _Translations$dialogs$cancelSession$id cancelSession = _Translations$dialogs$cancelSession$id._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$id cannotOpenFile = _Translations$dialogs$cannotOpenFile$id._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$id encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$id._(_root);
  @override
  late final _Translations$dialogs$errorDialog$id errorDialog = _Translations$dialogs$errorDialog$id._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$id favoriteDialog = _Translations$dialogs$favoriteDialog$id._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$id favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$id._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$id favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$id._(_root);
  @override
  late final _Translations$dialogs$fileInfo$id fileInfo = _Translations$dialogs$fileInfo$id._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$id fileNameInput = _Translations$dialogs$fileNameInput$id._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$id historyClearDialog = _Translations$dialogs$historyClearDialog$id._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$id localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$id._(_root);
  @override
  late final _Translations$dialogs$messageInput$id messageInput = _Translations$dialogs$messageInput$id._(_root);
  @override
  late final _Translations$dialogs$noFiles$id noFiles = _Translations$dialogs$noFiles$id._(_root);
  @override
  late final _Translations$dialogs$noPermission$id noPermission = _Translations$dialogs$noPermission$id._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$id notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$id._(_root);
  @override
  late final _Translations$dialogs$qr$id qr = _Translations$dialogs$qr$id._(_root);
  @override
  late final _Translations$dialogs$quickActions$id quickActions = _Translations$dialogs$quickActions$id._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$id quickSaveNotice = _Translations$dialogs$quickSaveNotice$id._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$id quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$id._(_root);
  @override
  late final _Translations$dialogs$pin$id pin = _Translations$dialogs$pin$id._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$id sendModeHelp = _Translations$dialogs$sendModeHelp$id._(_root);
  @override
  late final _Translations$dialogs$zoom$id zoom = _Translations$dialogs$zoom$id._(_root);
}

// Path: sanitization
class _Translations$sanitization$id extends Translations$sanitization$en {
  _Translations$sanitization$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Nama berkas tidak boleh kosong';
  @override
  String get invalid => 'Nama berkas mengandung karakter yang takvalid';
}

// Path: tray
class _Translations$tray$id extends Translations$tray$en {
  _Translations$tray$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$web$id extends Translations$web$en {
  _Translations$web$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$id extends Translations$assetPicker$en {
  _Translations$assetPicker$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$id extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$id extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$id extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$id extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$id extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$id extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$id extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Umum';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$id brightnessOptions = _Translations$settingsTab$general$brightnessOptions$id._(
    _root,
  );
  @override
  String get color => 'Warna';
  @override
  late final _Translations$settingsTab$general$colorOptions$id colorOptions = _Translations$settingsTab$general$colorOptions$id._(_root);
  @override
  String get language => 'Bahasa';
  @override
  late final _Translations$settingsTab$general$languageOptions$id languageOptions = _Translations$settingsTab$general$languageOptions$id._(_root);
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
class _Translations$settingsTab$receive$id extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$id extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kirim';
  @override
  String get shareViaLinkAutoAccept => 'Bagikan melalui tautan: Terima otomatis';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$id extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$id._(TranslationsId root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$id networkOptions = _Translations$settingsTab$network$networkOptions$id._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$id extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$id extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Aplikasi ini dapat mengirim berkas ke perangkat lain, tetapi tidak sebaliknya.';
  @override
  String solution({required Object port}) =>
      'Hal ini kemungkinan merupakan masalah tembok api (firewall). Anda dapat memperbaiki masalah ini dengan memperbolehkan koneksi masuk (UDP dan TCP) pada porta ${port}.';
  @override
  String get openFirewall => 'Buka Tembok Api';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$id extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Perangkat ini tidak dapat menemukan perangkat lain.';
  @override
  String get solution =>
      'Pastikan semua perangkat berada pada jaringan Wi-Fi yang sama dan menggunakan konfigurasi yang sama (porta, alamat multicast, dan enkripsi). Anda dapat mencoba mengetik alamat IP perangkat target secara manual. Jika cara ini berhasil, pertimbangkan menambahkan perangkat ini ke daftar favorit sehingga perangkat dapat ditemukan secara otomatis pada lain waktu.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$id extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Kedua perangkat tidak dapat saling menemukan dan berbagi berkas.';
  @override
  String get solution =>
      'Pastikan kedua perangkat berada pada jaringan Wi-Fi yang sama dan berbagi konfigurasi yang sama (porta, alamat multicast, enkripsi). Jika Wi-Fi tidak mengizinkan komunikasi, aktifkan pilihan ini pada ruter.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$id extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$id extends Translations$progressPage$total$en {
  _Translations$progressPage$total$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$id title = _Translations$progressPage$total$title$id._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Berkas: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Ukuran: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Kecepatan: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$id extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tambahkan dalam pilihan';
  @override
  String get content => 'Apa yang ingin Anda tambahkan?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$id extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Buka berkas';
  @override
  String get content => 'Anda ingin membuka berkas yang diterima?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$id extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$id extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Batalkan pentransferan berkas';
  @override
  String get content => 'Anda yakin ingin membatalkan pengiriman berkas?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$id extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak dapat membuka berkas';
  @override
  String content({required Object file}) => 'Tidak dapat membuka "${file}". Apakah berkas ini telah dipindahkan, berganti nama, atau dihapus?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$id extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enkripsi dinonaktifkan';
  @override
  String get content => 'Komunikasi sekarang terjadi melalui protokol HTTP yang takterenkripsi. Untuk menggunakan HTTPS, aktifkan kembali enkripsi.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$id extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$id extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$id extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hapus dari daftar favorit';
  @override
  String content({required Object name}) => 'Anda yakin ingin menghapus ini dari daftar favorit? "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$id extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$id extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$id extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan nama berkas';
  @override
  String original({required Object original}) => 'Asli: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$id extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hapus Riwayat';
  @override
  String get content => 'Anda yakin ingin menghapus seluruh riwayat?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$id extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$id extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ketik pesan';
  @override
  String get multiline => 'Baris Ganda';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$id extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak ada berkas yang dipilih';
  @override
  String get content => 'Pilih setidaknya satu berkas.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$id extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak ada izin';
  @override
  String get content => 'Anda belum memberikan izin yang diperlukan. Harap berikan izin tersebut di pengaturan.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$id extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak tersedia';
  @override
  String get content => 'Fitur ini hanya tersedia di:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$id extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kode QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$id extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$id extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Semua permintaan akan langsung diterima. Harap berhati-hati bahwa semua orang di jaringan lokal dapat mengirim berkas.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$id extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$id extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$id extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$id extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$id extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$id extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$id extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$id extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

  final TranslationsId _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Semua';
  @override
  String get filtered => 'Tersaring';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$id extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$id._(TranslationsId root) : this._root = root, super.internal(root);

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
