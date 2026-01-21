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
class TranslationsMs extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsMs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.ms,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ms>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsMs _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Bahasa Melayu';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralMs general = _TranslationsGeneralMs._(_root);
  @override
  late final _TranslationsReceiveTabMs receiveTab = _TranslationsReceiveTabMs._(_root);
  @override
  late final _TranslationsSendTabMs sendTab = _TranslationsSendTabMs._(_root);
  @override
  late final _TranslationsSettingsTabMs settingsTab = _TranslationsSettingsTabMs._(_root);
  @override
  late final _TranslationsTroubleshootPageMs troubleshootPage = _TranslationsTroubleshootPageMs._(_root);
  @override
  late final _TranslationsReceiveHistoryPageMs receiveHistoryPage = _TranslationsReceiveHistoryPageMs._(_root);
  @override
  late final _TranslationsApkPickerPageMs apkPickerPage = _TranslationsApkPickerPageMs._(_root);
  @override
  late final _TranslationsSelectedFilesPageMs selectedFilesPage = _TranslationsSelectedFilesPageMs._(_root);
  @override
  late final _TranslationsReceivePageMs receivePage = _TranslationsReceivePageMs._(_root);
  @override
  late final _TranslationsReceiveOptionsPageMs receiveOptionsPage = _TranslationsReceiveOptionsPageMs._(_root);
  @override
  late final _TranslationsSendPageMs sendPage = _TranslationsSendPageMs._(_root);
  @override
  late final _TranslationsProgressPageMs progressPage = _TranslationsProgressPageMs._(_root);
  @override
  late final _TranslationsWebSharePageMs webSharePage = _TranslationsWebSharePageMs._(_root);
  @override
  late final _TranslationsAboutPageMs aboutPage = _TranslationsAboutPageMs._(_root);
  @override
  late final _TranslationsDonationPageMs donationPage = _TranslationsDonationPageMs._(_root);
  @override
  late final _TranslationsChangelogPageMs changelogPage = _TranslationsChangelogPageMs._(_root);
  @override
  late final _TranslationsAliasGeneratorMs aliasGenerator = _TranslationsAliasGeneratorMs._(_root);
  @override
  late final _TranslationsDialogsMs dialogs = _TranslationsDialogsMs._(_root);
  @override
  late final _TranslationsSanitizationMs sanitization = _TranslationsSanitizationMs._(_root);
  @override
  late final _TranslationsTrayMs tray = _TranslationsTrayMs._(_root);
  @override
  late final _TranslationsWebMs web = _TranslationsWebMs._(_root);
  @override
  late final _TranslationsAssetPickerMs assetPicker = _TranslationsAssetPickerMs._(_root);
}

// Path: general
class _TranslationsGeneralMs extends TranslationsGeneralEn {
  _TranslationsGeneralMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

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
  String get confirm => 'Sahkan';
  @override
  String get continueStr => 'Teruskan';
  @override
  String get copy => 'Salin';
  @override
  String get copiedToClipboard => 'Disalin ke papan keratan';
  @override
  String get decline => 'Tolak';
  @override
  String get done => 'Selesai';
  @override
  String get delete => 'Padam';
  @override
  String get edit => 'Edit';
  @override
  String get error => 'Ralat';
  @override
  String get example => 'Contoh';
  @override
  String get files => 'Fail';
  @override
  String get finished => 'Selesai';
  @override
  String get hide => 'Sembunyi';
  @override
  String get off => 'Mati';
  @override
  String get offline => 'Luar talian';
  @override
  String get on => 'Hidup';
  @override
  String get online => 'Dalam talian';
  @override
  String get open => 'Buka';
  @override
  String get queue => 'Baris gilir';
  @override
  String get quickSave => 'Simpan Cepat';
  @override
  String get quickSaveFromFavorites => 'Simpan Cepat dari "Kegemaran"';
  @override
  String get renamed => 'Dinamakan semula';
  @override
  String get reset => 'Set semula';
  @override
  String get restart => 'Mula semula';
  @override
  String get settings => 'Tetapan';
  @override
  String get skipped => 'Dilangkau';
  @override
  String get start => 'Mula';
  @override
  String get stop => 'Berhenti';
  @override
  String get save => 'Simpan';
  @override
  String get unchanged => 'Tidak berubah';
  @override
  String get unknown => 'Tidak diketahui';
  @override
  String get noItemInClipboard => 'Tiada item dalam papan keratan.';
}

// Path: receiveTab
class _TranslationsReceiveTabMs extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Terima';
  @override
  late final _TranslationsReceiveTabInfoBoxMs infoBox = _TranslationsReceiveTabInfoBoxMs._(_root);
}

// Path: sendTab
class _TranslationsSendTabMs extends TranslationsSendTabEn {
  _TranslationsSendTabMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hantar';
  @override
  late final _TranslationsSendTabSelectionMs selection = _TranslationsSendTabSelectionMs._(_root);
  @override
  late final _TranslationsSendTabPickerMs picker = _TranslationsSendTabPickerMs._(_root);
  @override
  String get shareIntentInfo => 'Anda juga boleh menggunakan ciri "Kongsi" peranti mudah alih anda untuk memilih fail dengan lebih mudah.';
  @override
  String get nearbyDevices => 'Peranti berdekatan';
  @override
  String get thisDevice => 'Peranti Ini';
  @override
  String get scan => 'Cari peranti';
  @override
  String get manualSending => 'Penghantaran manual';
  @override
  String get sendMode => 'Mod penghantaran';
  @override
  late final _TranslationsSendTabSendModesMs sendModes = _TranslationsSendTabSendModesMs._(_root);
  @override
  String get sendModeHelp => 'Penerangan';
  @override
  String get help => 'Sila pastikan sasaran yang diingini juga berada dalam rangkaian Wi-Fi yang sama.';
  @override
  String get placeItems => 'Letakkan item untuk dikongsi.';
}

// Path: settingsTab
class _TranslationsSettingsTabMs extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tetapan';
  @override
  late final _TranslationsSettingsTabGeneralMs general = _TranslationsSettingsTabGeneralMs._(_root);
  @override
  late final _TranslationsSettingsTabReceiveMs receive = _TranslationsSettingsTabReceiveMs._(_root);
  @override
  late final _TranslationsSettingsTabSendMs send = _TranslationsSettingsTabSendMs._(_root);
  @override
  late final _TranslationsSettingsTabNetworkMs network = _TranslationsSettingsTabNetworkMs._(_root);
  @override
  late final _TranslationsSettingsTabOtherMs other = _TranslationsSettingsTabOtherMs._(_root);
  @override
  String get advancedSettings => 'Tetapan lanjutan';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageMs extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Penyelesaian masalah';
  @override
  String get subTitle => 'Aplikasi ini tidak berfungsi seperti yang diharapkan? Di sini anda boleh mencari penyelesaian umum.';
  @override
  String get solution => 'Penyelesaian:';
  @override
  String get fixButton => 'Baiki secara automatik';
  @override
  late final _TranslationsTroubleshootPageFirewallMs firewall = _TranslationsTroubleshootPageFirewallMs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryMs noDiscovery = _TranslationsTroubleshootPageNoDiscoveryMs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionMs noConnection = _TranslationsTroubleshootPageNoConnectionMs._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageMs extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sejarah';
  @override
  String get openFolder => 'Buka folder';
  @override
  String get deleteHistory => 'Padam sejarah';
  @override
  String get empty => 'Sejarah kosong.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsMs entryActions = _TranslationsReceiveHistoryPageEntryActionsMs._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageMs extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikasi (APK)';
  @override
  String get excludeSystemApps => 'Kecualikan aplikasi sistem';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Kecualikan aplikasi yang tidak boleh dilancarkan';
  @override
  String apps({required Object n}) => '${n} Aplikasi';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageMs extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Padam semua';
}

// Path: receivePage
class _TranslationsReceivePageMs extends TranslationsReceivePageEn {
  _TranslationsReceivePageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ms'))(
    n,
    one: 'ingin menghantar fail kepada anda',
    other: 'ingin menghantar ${n} fail kepada anda',
  );
  @override
  String get subTitleMessage => 'menghantar mesej kepada anda:';
  @override
  String get subTitleLink => 'menghantar pautan kepada anda:';
  @override
  String get canceled => 'Penghantar telah membatalkan permintaan.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageMs extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

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
  String get saveToGalleryOff => 'Dimatikan secara automatik kerana terdapat folder.';
}

// Path: sendPage
class _TranslationsSendPageMs extends TranslationsSendPageEn {
  _TranslationsSendPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Menunggu respons...';
  @override
  String get rejected => 'Penerima telah menolak permintaan.';
  @override
  String get busy => 'Penerima sibuk dengan permintaan lain.';
}

// Path: progressPage
class _TranslationsProgressPageMs extends TranslationsProgressPageEn {
  _TranslationsProgressPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Menghantar fail';
  @override
  String get titleReceiving => 'Menerima fail';
  @override
  String get savedToGallery => 'Disimpan dalam Foto';
  @override
  late final _TranslationsProgressPageTotalMs total = _TranslationsProgressPageTotalMs._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageMs extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kongsi melalui pautan';
  @override
  String get loading => 'Memulakan pelayan...';
  @override
  String get stopping => 'Menghentikan pelayan...';
  @override
  String get error => 'Ralat berlaku semasa memulakan pelayan.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ms'))(
    n,
    one: 'Buka pautan ini dalam pelayar anda:',
    other: 'Buka salah satu pautan ini dalam pelayar anda:',
  );
  @override
  String get requests => 'Permintaan';
  @override
  String get noRequests => 'Tiada permintaan lagi.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Terima permintaan secara automatik';
  @override
  String get requirePin => 'Memerlukan PIN';
  @override
  String pinHint({required Object pin}) => 'PIN ialah "${pin}"';
  @override
  String pendingRequests({required Object n}) => 'Permintaan menunggu: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageMs extends TranslationsAboutPageEn {
  _TranslationsAboutPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mengenai LocalSend';
  @override
  List<String> get description => [
    'LocalSend adalah aplikasi percuma dan sumber terbuka yang membolehkan anda berkongsi fail dan mesej dengan selamat dengan peranti berdekatan melalui rangkaian tempatan anda tanpa memerlukan sambungan internet.',
    'Aplikasi ini tersedia di Android, iOS, macOS, Windows dan Linux. Anda boleh mencari semua pilihan muat turun di laman web rasmi.',
  ];
  @override
  String get author => 'Pengarang';
  @override
  String get contributors => 'Penyumbang';
  @override
  String get translators => 'Penterjemah';
}

// Path: donationPage
class _TranslationsDonationPageMs extends TranslationsDonationPageEn {
  _TranslationsDonationPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Derma';
  @override
  String get info =>
      'LocalSend adalah percuma, sumber terbuka dan tanpa iklan. Jika anda menyukai aplikasi ini, anda boleh menyokong pembangunannya dengan derma.';
  @override
  String donate({required Object amount}) => 'Derma ${amount}';
  @override
  String get thanks => 'Terima kasih banyak!';
  @override
  String get restore => 'Pulihkan pembelian';
}

// Path: changelogPage
class _TranslationsChangelogPageMs extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Log perubahan';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorMs extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
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
  @override
  List<String> get fruits => [
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
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} yang ${adjective}';
}

// Path: dialogs
class _TranslationsDialogsMs extends TranslationsDialogsEn {
  _TranslationsDialogsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileMs addFile = _TranslationsDialogsAddFileMs._(_root);
  @override
  late final _TranslationsDialogsAddressInputMs addressInput = _TranslationsDialogsAddressInputMs._(_root);
  @override
  late final _TranslationsDialogsCancelSessionMs cancelSession = _TranslationsDialogsCancelSessionMs._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileMs cannotOpenFile = _TranslationsDialogsCannotOpenFileMs._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeMs encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeMs._(_root);
  @override
  late final _TranslationsDialogsErrorDialogMs errorDialog = _TranslationsDialogsErrorDialogMs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogMs favoriteDialog = _TranslationsDialogsFavoriteDialogMs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogMs favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogMs._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogMs favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogMs._(_root);
  @override
  late final _TranslationsDialogsFileInfoMs fileInfo = _TranslationsDialogsFileInfoMs._(_root);
  @override
  late final _TranslationsDialogsFileNameInputMs fileNameInput = _TranslationsDialogsFileNameInputMs._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogMs historyClearDialog = _TranslationsDialogsHistoryClearDialogMs._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedMs localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedMs._(_root);
  @override
  late final _TranslationsDialogsMessageInputMs messageInput = _TranslationsDialogsMessageInputMs._(_root);
  @override
  late final _TranslationsDialogsNoFilesMs noFiles = _TranslationsDialogsNoFilesMs._(_root);
  @override
  late final _TranslationsDialogsNoPermissionMs noPermission = _TranslationsDialogsNoPermissionMs._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformMs notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformMs._(_root);
  @override
  late final _TranslationsDialogsQrMs qr = _TranslationsDialogsQrMs._(_root);
  @override
  late final _TranslationsDialogsQuickActionsMs quickActions = _TranslationsDialogsQuickActionsMs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeMs quickSaveNotice = _TranslationsDialogsQuickSaveNoticeMs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeMs quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeMs._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinMs pin = _TranslationsDialogsPinMs._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpMs sendModeHelp = _TranslationsDialogsSendModeHelpMs._(_root);
  @override
  late final _TranslationsDialogsZoomMs zoom = _TranslationsDialogsZoomMs._(_root);
}

// Path: sanitization
class _TranslationsSanitizationMs extends TranslationsSanitizationEn {
  _TranslationsSanitizationMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Nama fail tidak boleh kosong';
  @override
  String get invalid => 'Nama fail mengandungi aksara yang tidak sah';
}

// Path: tray
class _TranslationsTrayMs extends TranslationsTrayEn {
  _TranslationsTrayMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Keluar LocalSend';
  @override
  String get closeWindows => 'Keluar';
}

// Path: web
class _TranslationsWebMs extends TranslationsWebEn {
  _TranslationsWebMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get rejected => 'Ditolak';
  @override
  String get files => 'Fail';
  @override
  String get fileName => 'Nama fail';
  @override
  String get size => 'Saiz';
}

// Path: assetPicker
class _TranslationsAssetPickerMs extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Sahkan';
  @override
  String get cancel => 'Batal';
  @override
  String get edit => 'Edit';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Gagal dimuat';
  @override
  String get original => 'Asal';
  @override
  String get preview => 'Pratonton';
  @override
  String get select => 'Pilih';
  @override
  String get emptyList => 'Senarai kosong';
  @override
  String get unSupportedAssetType => 'Jenis fail tidak disokong.';
  @override
  String get unableToAccessAll => 'Tidak dapat mengakses semua fail pada peranti';
  @override
  String get viewingLimitedAssetsTip => 'Hanya lihat fail dan album yang boleh diakses oleh aplikasi.';
  @override
  String get changeAccessibleLimitedAssets => 'Klik untuk mengemas kini fail yang boleh diakses';
  @override
  String get accessAllTip =>
      'Aplikasi hanya dapat mengakses beberapa fail pada peranti. Pergi ke tetapan sistem dan benarkan aplikasi mengakses semua media pada peranti.';
  @override
  String get goToSystemSettings => 'Pergi ke tetapan sistem';
  @override
  String get accessLimitedAssets => 'Teruskan dengan akses terhad';
  @override
  String get accessiblePathName => 'Fail yang boleh diakses';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Imej';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Media lain';
  @override
  String get sActionPlayHint => 'main';
  @override
  String get sActionPreviewHint => 'pratonton';
  @override
  String get sActionSelectHint => 'pilih';
  @override
  String get sActionSwitchPathLabel => 'tukar laluan';
  @override
  String get sActionUseCameraHint => 'guna kamera';
  @override
  String get sNameDurationLabel => 'tempoh';
  @override
  String get sUnitAssetCountLabel => 'kiraan';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxMs extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Nama peranti:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionMs extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pilihan';
  @override
  String files({required Object files}) => 'Fail: ${files}';
  @override
  String size({required Object size}) => 'Saiz: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerMs extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fail';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Media';
  @override
  String get text => 'Teks';
  @override
  String get app => 'Aplikasi';
  @override
  String get clipboard => 'Tampal';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesMs extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Satu penerima';
  @override
  String get multiple => 'Pelbagai penerima';
  @override
  String get link => 'Kongsi melalui pautan';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralMs extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Umum';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsMs brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsMs._(_root);
  @override
  String get color => 'Warna';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsMs colorOptions = _TranslationsSettingsTabGeneralColorOptionsMs._(_root);
  @override
  String get language => 'Bahasa';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsMs languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsMs._(_root);
  @override
  String get saveWindowPlacement => 'Simpan kedudukan tetingkap selepas keluar';
  @override
  String get minimizeToTray => 'Minimumkan ke dulang sistem/menu bar apabila menutup';
  @override
  String get launchAtStartup => 'Mula automatik selepas log masuk';
  @override
  String get launchMinimized => 'Mula automatik: Mula tersembunyi';
  @override
  String get showInContextMenu => 'Tunjukkan LocalSend dalam menu konteks';
  @override
  String get animations => 'Animasi';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveMs extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Terima';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => 'Memerlukan PIN';
  @override
  String get autoFinish => 'Selesai Automatik';
  @override
  String get destination => 'Simpan ke folder';
  @override
  String get downloads => '(Muat turun)';
  @override
  String get saveToGallery => 'Simpan media ke galeri';
  @override
  String get saveToHistory => 'Simpan ke sejarah';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendMs extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hantar';
  @override
  String get shareViaLinkAutoAccept => 'Terima permintaan secara automatik dalam mod "Kongsi melalui pautan"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkMs extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rangkaian';
  @override
  String get needRestart => 'Mulakan semula pelayan untuk menggunakan tetapan!';
  @override
  String get server => 'Pelayan';
  @override
  String get alias => 'Nama peranti';
  @override
  String get deviceType => 'Jenis peranti';
  @override
  String get deviceModel => 'Model peranti';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Tamat Masa Penemuan';
  @override
  String get useSystemName => 'Gunakan nama sistem';
  @override
  String get generateRandomAlias => 'Jana alias rawak';
  @override
  String portWarning({required Object defaultPort}) =>
      'Anda mungkin tidak dapat dikesan oleh peranti lain kerana anda menggunakan port tersuai. (lalai: ${defaultPort})';
  @override
  String get encryption => 'Penyulitan';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Anda mungkin tidak dapat dikesan oleh peranti lain kerana anda menggunakan alamat multicast tersuai. (lalai: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherMs extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lain-lain';
  @override
  String get support => 'Sokong LocalSend';
  @override
  String get donate => 'Derma';
  @override
  String get privacyPolicy => 'Dasar Privasi';
  @override
  String get termsOfUse => 'Syarat Penggunaan';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallMs extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Peranti ini boleh menghantar fail ke peranti lain tetapi peranti lain tidak boleh menghantar fail ke peranti ini.';
  @override
  String solution({required Object port}) =>
      'Ini kemungkinan besar adalah masalah firewall. Anda boleh menyelesaikannya dengan membenarkan sambungan masuk (UDP dan TCP) pada port ${port}.';
  @override
  String get openFirewallSettings => 'Buka Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryMs extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Peranti ini tidak dapat menemui peranti lain.';
  @override
  String get solution =>
      'Sila pastikan semua peranti berada dalam rangkaian Wi-Fi yang sama dan berkongsi konfigurasi yang sama (port, alamat multicast, penyulitan). Anda boleh cuba menaip alamat IP peranti sasaran secara manual. Jika ini berhasil, pertimbangkan untuk menambahkan peranti ini ke kegemaran agar ia dapat ditemui secara automatik pada masa hadapan.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionMs extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Kedua-dua peranti tidak dapat menemui satu sama lain atau tidak dapat berkongsi fail.';
  @override
  String get solution =>
      'Adakah masalah wujud di kedua-dua belah pihak? Jika ya, anda perlu memastikan bahawa kedua-dua peranti berada dalam rangkaian Wi-Fi yang sama dan berkongsi konfigurasi yang sama (port, alamat multicast, penyulitan). Rangkaian Wi-Fi mungkin tidak membenarkan komunikasi antara peserta (pengasingan AP). Dalam kes ini, pilihan ini mesti diaktifkan pada penghala.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsMs extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Buka fail';
  @override
  String get showInFolder => 'Tunjukkan dalam folder';
  @override
  String get info => 'Maklumat';
  @override
  String get deleteFromHistory => 'Padam dari sejarah';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalMs extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleMs title = _TranslationsProgressPageTotalTitleMs._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fail: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Saiz: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Kelajuan: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileMs extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tambah ke pilihan';
  @override
  String get content => 'Apa yang anda ingin tambah?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputMs extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan alamat';
  @override
  String get hashtag => 'Tanda pagar';
  @override
  String get ip => 'Alamat IP';
  @override
  String get recentlyUsed => 'Digunakan baru-baru ini: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionMs extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Batalkan pemindahan fail';
  @override
  String get content => 'Adakah anda benar-benar mahu membatalkan pemindahan fail?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileMs extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak dapat membuka fail';
  @override
  String content({required Object file}) => 'Tidak dapat membuka "${file}". Adakah fail ini telah dipindahkan, dinamakan semula atau dipadamkan?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeMs extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Penyulitan dimatikan';
  @override
  String get content =>
      'Komunikasi kini berlaku melalui protokol HTTP yang tidak disulitkan. Untuk menggunakan protokol HTTPS, aktifkan penyulitan semula.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogMs extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogMs extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kegemaran';
  @override
  String get noFavorites => 'Tiada peranti kegemaran lagi.';
  @override
  String get addFavorite => 'Tambah';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogMs extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Padam dari kegemaran';
  @override
  String content({required Object name}) => 'Adakah anda benar-benar mahu memadam "${name}" dari kegemaran?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogMs extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Tambah ke kegemaran';
  @override
  String get titleEdit => 'Tetapan';
  @override
  String get name => 'Nama peranti';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Alamat IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoMs extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Maklumat fail';
  @override
  String get fileName => 'Nama fail:';
  @override
  String get path => 'Laluan:';
  @override
  String get size => 'Saiz:';
  @override
  String get sender => 'Penghantar:';
  @override
  String get time => 'Masa:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputMs extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan nama fail';
  @override
  String original({required Object original}) => 'Asal: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogMs extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kosongkan sejarah';
  @override
  String get content => 'Adakah anda benar-benar mahu memadamkan keseluruhan sejarah?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedMs extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend tidak dapat mencari peranti lain tanpa mempunyai kebenaran untuk mengimbas rangkaian tempatan. Sila berikan kebenaran ini dalam tetapan.';
  @override
  String get gotoSettings => 'Tetapan';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputMs extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Taip mesej';
  @override
  String get multiline => 'Pelbagai baris';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesMs extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tiada fail dipilih';
  @override
  String get content => 'Sila pilih sekurang-kurangnya satu fail.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionMs extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tiada kebenaran';
  @override
  String get content => 'Anda belum memberikan kebenaran yang diperlukan. Sila berikan kebenaran dalam tetapan.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformMs extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tidak tersedia';
  @override
  String get content => 'Ciri ini hanya tersedia di:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrMs extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kod QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsMs extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tindakan Pantas';
  @override
  String get counter => 'Kaunter';
  @override
  String get prefix => 'Awalan';
  @override
  String get padZero => 'Isi dengan sifar';
  @override
  String get sortBeforeCount => 'Susun mengikut abjad terlebih dahulu';
  @override
  String get random => 'Rawak';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeMs extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Permintaan fail kini diterima secara automatik. Sila ambil perhatian bahawa semua orang dalam rangkaian tempatan boleh menghantar fail kepada anda.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeMs extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _TranslationsDialogsPinMs extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Masukkan PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpMs extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mod penghantaran';
  @override
  String get single => 'Menghantar fail kepada satu penerima. Pilihan akan dibersihkan selepas pemindahan fail selesai.';
  @override
  String get multiple => 'Menghantar fail kepada beberapa penerima. Pilihan tidak akan dibersihkan.';
  @override
  String get link =>
      'Penerima yang tidak mempunyai LocalSend dipasang boleh memuat turun fail yang dipilih dengan membuka pautan dalam pelayar mereka.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomMs extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsMs extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Gelap';
  @override
  String get light => 'Cerah';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsMs extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsMs extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleMs extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleMs._(TranslationsMs root) : this._root = root, super.internal(root);

  final TranslationsMs _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Kemajuan keseluruhan (${time})';
  @override
  String get finishedError => 'Selesai dengan ralat';
  @override
  String get canceledSender => 'Dibatalkan oleh penghantar';
  @override
  String get canceledReceiver => 'Dibatalkan oleh penerima';
}
