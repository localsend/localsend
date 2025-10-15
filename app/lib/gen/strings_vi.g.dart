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
class TranslationsVi extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.vi,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <vi>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsVi _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Tiếng Việt';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralVi general = _TranslationsGeneralVi._(_root);
  @override
  late final _TranslationsReceiveTabVi receiveTab = _TranslationsReceiveTabVi._(_root);
  @override
  late final _TranslationsSendTabVi sendTab = _TranslationsSendTabVi._(_root);
  @override
  late final _TranslationsSettingsTabVi settingsTab = _TranslationsSettingsTabVi._(_root);
  @override
  late final _TranslationsTroubleshootPageVi troubleshootPage = _TranslationsTroubleshootPageVi._(_root);
  @override
  late final _TranslationsReceiveHistoryPageVi receiveHistoryPage = _TranslationsReceiveHistoryPageVi._(_root);
  @override
  late final _TranslationsApkPickerPageVi apkPickerPage = _TranslationsApkPickerPageVi._(_root);
  @override
  late final _TranslationsSelectedFilesPageVi selectedFilesPage = _TranslationsSelectedFilesPageVi._(_root);
  @override
  late final _TranslationsReceivePageVi receivePage = _TranslationsReceivePageVi._(_root);
  @override
  late final _TranslationsReceiveOptionsPageVi receiveOptionsPage = _TranslationsReceiveOptionsPageVi._(_root);
  @override
  late final _TranslationsSendPageVi sendPage = _TranslationsSendPageVi._(_root);
  @override
  late final _TranslationsProgressPageVi progressPage = _TranslationsProgressPageVi._(_root);
  @override
  late final _TranslationsWebSharePageVi webSharePage = _TranslationsWebSharePageVi._(_root);
  @override
  late final _TranslationsAboutPageVi aboutPage = _TranslationsAboutPageVi._(_root);
  @override
  late final _TranslationsDonationPageVi donationPage = _TranslationsDonationPageVi._(_root);
  @override
  late final _TranslationsChangelogPageVi changelogPage = _TranslationsChangelogPageVi._(_root);
  @override
  late final _TranslationsAliasGeneratorVi aliasGenerator = _TranslationsAliasGeneratorVi._(_root);
  @override
  late final _TranslationsDialogsVi dialogs = _TranslationsDialogsVi._(_root);
  @override
  late final _TranslationsSanitizationVi sanitization = _TranslationsSanitizationVi._(_root);
  @override
  late final _TranslationsTrayVi tray = _TranslationsTrayVi._(_root);
  @override
  late final _TranslationsWebVi web = _TranslationsWebVi._(_root);
  @override
  late final _TranslationsAssetPickerVi assetPicker = _TranslationsAssetPickerVi._(_root);
}

// Path: general
class _TranslationsGeneralVi extends TranslationsGeneralEn {
  _TranslationsGeneralVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Đồng ý';
  @override
  String get accepted => 'Đã đồng ý';
  @override
  String get add => 'Thêm';
  @override
  String get advanced => 'Nâng cao';
  @override
  String get cancel => 'Thoát';
  @override
  String get close => 'Đóng';
  @override
  String get confirm => 'Xác nhận';
  @override
  String get continueStr => 'Tiếp tục';
  @override
  String get copy => 'Sao chép';
  @override
  String get copiedToClipboard => 'Đã sao chép vào bộ nhớ tạm';
  @override
  String get decline => 'Từ chối';
  @override
  String get done => 'Hoàn thành';
  @override
  String get delete => 'Xoá';
  @override
  String get edit => 'Sửa';
  @override
  String get error => 'Lỗi';
  @override
  String get example => 'Ví dụ';
  @override
  String get files => 'Tập tin';
  @override
  String get finished => 'Đã xong';
  @override
  String get hide => 'Ẩn';
  @override
  String get off => 'Tắt';
  @override
  String get offline => 'Ngoại tuyến';
  @override
  String get on => 'Bật';
  @override
  String get online => 'Trực tuyến';
  @override
  String get open => 'Mở';
  @override
  String get queue => 'Hàng chờ';
  @override
  String get quickSave => 'Lưu nhanh';
  @override
  String get quickSaveFromFavorites => 'Lưu nhanh cho "Yêu thích"';
  @override
  String get renamed => 'Đã đổi tên';
  @override
  String get reset => 'Thiết lập lại';
  @override
  String get restart => 'Khởi động lại';
  @override
  String get settings => 'Cài đặt';
  @override
  String get skipped => 'Đã bỏ qua';
  @override
  String get start => 'Bắt đầu';
  @override
  String get stop => 'Dừng';
  @override
  String get save => 'Lưu';
  @override
  String get unchanged => 'Chưa thay đổi';
  @override
  String get unknown => 'Không rõ';
  @override
  String get noItemInClipboard => 'Không có gì trong bộ nhớ tạm';
}

// Path: receiveTab
class _TranslationsReceiveTabVi extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhận';
  @override
  late final _TranslationsReceiveTabInfoBoxVi infoBox = _TranslationsReceiveTabInfoBoxVi._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveVi quickSave = _TranslationsReceiveTabQuickSaveVi._(_root);
}

// Path: sendTab
class _TranslationsSendTabVi extends TranslationsSendTabEn {
  _TranslationsSendTabVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gửi';
  @override
  late final _TranslationsSendTabSelectionVi selection = _TranslationsSendTabSelectionVi._(_root);
  @override
  late final _TranslationsSendTabPickerVi picker = _TranslationsSendTabPickerVi._(_root);
  @override
  String get shareIntentInfo => 'Bạn có thể dùng tính năng "Chia sẻ" trong điện thoại của bạn để lựa chọn các tập tin dễ dàng hơn.';
  @override
  String get nearbyDevices => 'Thiết bị lân cận';
  @override
  String get thisDevice => 'Thiết bị hiện tại';
  @override
  String get scan => 'Tìm kiếm thiết bị';
  @override
  String get manualSending => 'Gửi thủ công';
  @override
  String get sendMode => 'Chế độ gửi';
  @override
  late final _TranslationsSendTabSendModesVi sendModes = _TranslationsSendTabSendModesVi._(_root);
  @override
  String get sendModeHelp => 'Giải thích';
  @override
  String get help => 'Vui lòng đảm bảo thiết bị gửi và nhận dùng chung mạng wifi.';
  @override
  String get placeItems => 'Đặt các mục để chia sẻ.';
}

// Path: settingsTab
class _TranslationsSettingsTabVi extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cài đặt';
  @override
  late final _TranslationsSettingsTabGeneralVi general = _TranslationsSettingsTabGeneralVi._(_root);
  @override
  late final _TranslationsSettingsTabReceiveVi receive = _TranslationsSettingsTabReceiveVi._(_root);
  @override
  late final _TranslationsSettingsTabSendVi send = _TranslationsSettingsTabSendVi._(_root);
  @override
  late final _TranslationsSettingsTabNetworkVi network = _TranslationsSettingsTabNetworkVi._(_root);
  @override
  late final _TranslationsSettingsTabOtherVi other = _TranslationsSettingsTabOtherVi._(_root);
  @override
  String get advancedSettings => 'Cài đặt nâng cao';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageVi extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gỡ lỗi';
  @override
  String get subTitle => 'Ứng dụng không hoạt động như dự kiến? Bạn có thể tìm giải pháp cho những vấn đề thường gặp tại đây.';
  @override
  String get solution => 'Giải pháp:';
  @override
  String get fixButton => 'Sửa lỗi tự động';
  @override
  late final _TranslationsTroubleshootPageFirewallVi firewall = _TranslationsTroubleshootPageFirewallVi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryVi noDiscovery = _TranslationsTroubleshootPageNoDiscoveryVi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionVi noConnection = _TranslationsTroubleshootPageNoConnectionVi._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageVi extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lịch sử';
  @override
  String get openFolder => 'Mở thư mục';
  @override
  String get deleteHistory => 'Xoá lịch sử';
  @override
  String get empty => 'Lịch sử rỗng.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsVi entryActions = _TranslationsReceiveHistoryPageEntryActionsVi._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageVi extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ứng dụng (APK)';
  @override
  String get excludeSystemApps => 'Mở ứng dụng hệ thống';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Loại trừ các ứng dụng không thể khởi chạy';
  @override
  String apps({required Object n}) => '${n} Ứng dụng';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageVi extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Xoá toàn bộ';
}

// Path: receivePage
class _TranslationsReceivePageVi extends TranslationsReceivePageEn {
  _TranslationsReceivePageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(
    n,
    one: 'muốn gửi cho bạn một tập tin',
    other: 'muốn gửi cho bạn ${n} tập tin',
  );
  @override
  String get subTitleMessage => 'đã gửi cho bạn một tin nhắn:';
  @override
  String get subTitleLink => 'đã gửi cho bạn một liên kết:';
  @override
  String get canceled => 'Người gửi đã xoá yêu cầu.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageVi extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tuỳ chọn';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Thư mục LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Đã tự động tắt vì là thư mục.';
}

// Path: sendPage
class _TranslationsSendPageVi extends TranslationsSendPageEn {
  _TranslationsSendPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Đang chờ phản hồi...';
  @override
  String get rejected => 'Người nhận đã từ chối yêu cầu.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Người nhận đang bận xử lý một yêu cầu khác.';
}

// Path: progressPage
class _TranslationsProgressPageVi extends TranslationsProgressPageEn {
  _TranslationsProgressPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Đang gửi tập tin';
  @override
  String get titleReceiving => 'Đang nhận tập tin';
  @override
  String get savedToGallery => 'Đã lưu vào Ảnh';
  @override
  late final _TranslationsProgressPageTotalVi total = _TranslationsProgressPageTotalVi._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageVi extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Chia sẻ qua liên kết';
  @override
  String get loading => 'Đang khởi tạo server...';
  @override
  String get stopping => 'Đang dừng server...';
  @override
  String get error => 'Một lỗi đã xảy ra khi khởi tạo server.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(
    n,
    one: 'Mở liên kết trong trình duyệt:',
    other: 'Mở một trong các liên kết với trình duyệt:',
  );
  @override
  String get requests => 'Yêu cầu';
  @override
  String get noRequests => 'Hiện không có yêu cầu nào.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Tự động chấp nhận yêu cầu';
  @override
  String get requirePin => 'Cần cung cấp mã PIN';
  @override
  String pinHint({required Object pin}) => 'Mã PIN là "${pin}"';
  @override
  String get encryptionHint => 'LocalSend dùng chứng chỉ tự tạo. Bạn cần chấp thuận trong trình duyệt.';
  @override
  String pendingRequests({required Object n}) => 'Yêu cầu chờ: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageVi extends TranslationsAboutPageEn {
  _TranslationsAboutPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Thông tin về LocalSend';
  @override
  List<String> get description => [
    'LocalSend là một phần mềm miễn phí mã nguồn mở, giúp bạn chia sẻ tập tin cũng như tin nhắn đến các thiết bị phụ cận một cách bảo mật thông qua mạng nội bộ mà không cần kết nối mạng đến bên ngoài.',
    'Ứng dụng có trên Android, iOS, macOS, Windows và Linux. Bạn có thể tìm thấy các tuỳ chọn tải ở trang chủ.',
  ];
  @override
  String get author => 'Tác giả';
  @override
  String get contributors => 'Người đóng góp';
  @override
  String get packagers => 'Công cụ đóng gói';
  @override
  String get translators => 'Người dịch';
}

// Path: donationPage
class _TranslationsDonationPageVi extends TranslationsDonationPageEn {
  _TranslationsDonationPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ủng hộ';
  @override
  String get info =>
      'LocalSend là ứng dụng miễn phí, mã nguồn mở, không chứa quảng cáo. Nếu bạn yêu thích ứng dụng này, bạn có thể hỗ trợ việc phát triển bằng việc ủng hộ.';
  @override
  String donate({required Object amount}) => 'Ủng hộ ${amount}';
  @override
  String get thanks => 'Xin chân thành cảm ơn!';
  @override
  String get restore => 'Khôi phục lịch sử ủng hộ';
}

// Path: changelogPage
class _TranslationsChangelogPageVi extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorVi extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsVi extends TranslationsDialogsEn {
  _TranslationsDialogsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileVi addFile = _TranslationsDialogsAddFileVi._(_root);
  @override
  late final _TranslationsDialogsOpenFileVi openFile = _TranslationsDialogsOpenFileVi._(_root);
  @override
  late final _TranslationsDialogsAddressInputVi addressInput = _TranslationsDialogsAddressInputVi._(_root);
  @override
  late final _TranslationsDialogsCancelSessionVi cancelSession = _TranslationsDialogsCancelSessionVi._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileVi cannotOpenFile = _TranslationsDialogsCannotOpenFileVi._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeVi encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeVi._(_root);
  @override
  late final _TranslationsDialogsErrorDialogVi errorDialog = _TranslationsDialogsErrorDialogVi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogVi favoriteDialog = _TranslationsDialogsFavoriteDialogVi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogVi favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogVi._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogVi favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogVi._(_root);
  @override
  late final _TranslationsDialogsFileInfoVi fileInfo = _TranslationsDialogsFileInfoVi._(_root);
  @override
  late final _TranslationsDialogsFileNameInputVi fileNameInput = _TranslationsDialogsFileNameInputVi._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogVi historyClearDialog = _TranslationsDialogsHistoryClearDialogVi._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedVi localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedVi._(_root);
  @override
  late final _TranslationsDialogsMessageInputVi messageInput = _TranslationsDialogsMessageInputVi._(_root);
  @override
  late final _TranslationsDialogsNoFilesVi noFiles = _TranslationsDialogsNoFilesVi._(_root);
  @override
  late final _TranslationsDialogsNoPermissionVi noPermission = _TranslationsDialogsNoPermissionVi._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformVi notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformVi._(_root);
  @override
  late final _TranslationsDialogsQrVi qr = _TranslationsDialogsQrVi._(_root);
  @override
  late final _TranslationsDialogsQuickActionsVi quickActions = _TranslationsDialogsQuickActionsVi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeVi quickSaveNotice = _TranslationsDialogsQuickSaveNoticeVi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeVi quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeVi._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinVi pin = _TranslationsDialogsPinVi._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpVi sendModeHelp = _TranslationsDialogsSendModeHelpVi._(_root);
  @override
  late final _TranslationsDialogsZoomVi zoom = _TranslationsDialogsZoomVi._(_root);
}

// Path: sanitization
class _TranslationsSanitizationVi extends TranslationsSanitizationEn {
  _TranslationsSanitizationVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Tên tập tin không được để trống';
  @override
  String get invalid => 'Tên tập tin chứa ký tự không hợp lệ';
}

// Path: tray
class _TranslationsTrayVi extends TranslationsTrayEn {
  _TranslationsTrayVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Đóng LocalSend';
  @override
  String get closeWindows => 'Thoát';
}

// Path: web
class _TranslationsWebVi extends TranslationsWebEn {
  _TranslationsWebVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Nhập mã PIN';
  @override
  String get invalidPin => 'Sai mã PIN';
  @override
  String get tooManyAttempts => 'Sai quá nhiều';
  @override
  String get rejected => 'Đã từ chối';
  @override
  String get files => 'Tập tin';
  @override
  String get fileName => 'Tên';
  @override
  String get size => 'Kích thước';
}

// Path: assetPicker
class _TranslationsAssetPickerVi extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Xác nhận';
  @override
  String get cancel => 'Thoát';
  @override
  String get edit => 'Sửa';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Tải lỗi';
  @override
  String get original => 'Gốc';
  @override
  String get preview => 'Xem trước';
  @override
  String get select => 'Chọn';
  @override
  String get emptyList => 'Danh sách trống';
  @override
  String get unSupportedAssetType => 'Định dạng tập tin không được hỗ trợ.';
  @override
  String get unableToAccessAll => 'Không thể truy cập tới tất cả tập tin trong thiết bị';
  @override
  String get viewingLimitedAssetsTip => 'Chỉ hiển thị các tập tin và album mà ứng dụng có thể truy cập.';
  @override
  String get changeAccessibleLimitedAssets => 'Ấn để cập nhận các tập tin có thể truy cập.';
  @override
  String get accessAllTip =>
      'Ứng dụng chỉ có thể truy cập một số tập tin trong thiết bị. Hãy vào cài đặt hệ thống để chấp thuận ứng dụng có thể truy cập tất cả media trong thiết bị.';
  @override
  String get goToSystemSettings => 'Truy cập cài đặt hệ thống';
  @override
  String get accessLimitedAssets => 'Tiếp tục với truy cập bị giới hạn';
  @override
  String get accessiblePathName => 'Các tập tin có thể truy cập';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Ảnh';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Media khác';
  @override
  String get sActionPlayHint => 'mở';
  @override
  String get sActionPreviewHint => 'xem trước';
  @override
  String get sActionSelectHint => 'chọn';
  @override
  String get sActionSwitchPathLabel => 'đổi đường dẫn';
  @override
  String get sActionUseCameraHint => 'dùng camera';
  @override
  String get sNameDurationLabel => 'thời lượng';
  @override
  String get sUnitAssetCountLabel => 'đếm';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxVi extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Biệt danh:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveVi extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Yêu thích';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionVi extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lựa chọn';
  @override
  String files({required Object files}) => 'Tập tin: ${files}';
  @override
  String size({required Object size}) => 'Kích thước: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerVi extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Tập tin';
  @override
  String get folder => 'Thư mục';
  @override
  String get media => 'Media';
  @override
  String get text => 'Văn bản';
  @override
  String get app => 'Ứng dụng';
  @override
  String get clipboard => 'Dán';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesVi extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Một người nhận';
  @override
  String get multiple => 'Nhiều người nhận';
  @override
  String get link => 'Chia sẻ liên kết';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralVi extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Chung';
  @override
  String get brightness => 'Chủ đề';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsVi brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsVi._(_root);
  @override
  String get color => 'Màu sắc';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsVi colorOptions = _TranslationsSettingsTabGeneralColorOptionsVi._(_root);
  @override
  String get language => 'Ngôn ngữ';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsVi languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsVi._(_root);
  @override
  String get saveWindowPlacement => 'Thoát: Lưu vị trí cửa sổ hiển thị';
  @override
  String get saveWindowPlacementWindows => 'Lưu vị trí cửa sổ sau khi thoát ứng dụng';
  @override
  String get minimizeToTray => 'Thoát: Ẩn xuống thanh tác vụ';
  @override
  String get launchAtStartup => 'Tự khởi động sau khi đăng nhập';
  @override
  String get launchMinimized => 'Tự khởi động: Khởi động ẩn';
  @override
  String get showInContextMenu => 'Hiển thị LocalSend ở danh mục';
  @override
  String get animations => 'Hoạt ảnh';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveVi extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhận';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Tự động hoàn thành';
  @override
  String get destination => 'Đích đến';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Lưu media vào thư viện';
  @override
  String get saveToHistory => 'Lưu vào lịch sử';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendVi extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gửi';
  @override
  String get shareViaLinkAutoAccept => 'Chia sẻ qua liên kết: Tự động chấp nhận';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkVi extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mạng';
  @override
  String get needRestart => 'Khởi động lại server để cài đặt có hiệu lực!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Biệt danh';
  @override
  String get deviceType => 'Loại thiết bị';
  @override
  String get deviceModel => 'Model thiết bị';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Hết thời gian tìm kiếm';
  @override
  String get useSystemName => 'Dùng tên hệ thống';
  @override
  String get generateRandomAlias => 'Dùng bí danh ngẫu nhiên';
  @override
  String portWarning({required Object defaultPort}) =>
      'Các thiết bị khác có thể không nhận diện được thiết bị của bạn, vì bạn đang dùng port tuỳ chỉnh. (mặc định: ${defaultPort})';
  @override
  String get encryption => 'Mã hoá';
  @override
  String get multicastGroup => 'Đa phương tiện';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Các thiết bị khác có thể không nhận diện được thiết bị của bạn, vì bạn đang dùng địa chỉ multicast tuỳ chỉnh. (mặc định: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherVi extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Khác';
  @override
  String get support => 'Hỗ trợ LocalSend';
  @override
  String get donate => 'Ủng hộ';
  @override
  String get privacyPolicy => 'Chính sách bảo mật';
  @override
  String get termsOfUse => 'Điều khoản sử dụng';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallVi extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ứng dụng có thể gửi tập tin tới các thiết bị khác, nhưng các thiết bị khác không thể gửi tập tin đến thiết bị này.';
  @override
  String solution({required Object port}) =>
      'Có vẻ như đây là một vấn đề với tường lửa (firewall). Bạn có thể khắc phục bằng cách chấp thuận các kết nối đến (UDP và TCP) trên port ${port}.';
  @override
  String get openFirewallSettings => 'Mở tường lửa(Firewall)';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryVi extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Thiết bị này không thể tìm thấy thiết bị khác.';
  @override
  String get solution =>
      'Hãy đảm bảo rằng các thiết bị được kết nối với cùng một mạng Wi-Fi và dùng chung thiết lập (port, multicast address, encryption). Bạn có thể thử nhập địa chỉ IP của thiết bị đích đến. Nếu nó hoạt động, cân nhắc thêm thiết bị đó vào mục yêu thích. Thiết bị sẽ được nhận tự động trong những lần tìm kiếm trong tương lai.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionVi extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Cả hai thiết bị không thể nhận diện lẫn nhau cũng như không thể chia sẻ tập tin.';
  @override
  String get solution =>
      'Vấn đề tồn tại ở cả 2 thiết bị? Nếu thế, bạn cần chắc chắn rằng cả hai thiết bị đang dùng chung một mạng wifi với cùng thiết lập (port, địa chỉ multicast, mã hoá). Wifi có thể không cho các thiết bị giao tiếp với nhau. Trong trường hợp đó, bạn cần tìm trong thiết lập của router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsVi extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Mở tập tin';
  @override
  String get showInFolder => 'Hiển thị trong thư mục';
  @override
  String get info => 'Thông tin';
  @override
  String get deleteFromHistory => 'Xoá khỏi lịch sử';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalVi extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleVi title = _TranslationsProgressPageTotalTitleVi._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Tập tin: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Kích thước: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Tốc độ: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileVi extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Thêm vào lựa chọn';
  @override
  String get content => 'Bạn muốn thêm mục nào?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileVi extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mở tệp tin';
  @override
  String get content => 'Bạn có muốn mở tập tin vừa nhận được không?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputVi extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhập địa chỉ';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Địa chỉ IP';
  @override
  String get recentlyUsed => 'Sử dụng gần đây: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionVi extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dừng gửi tập tin';
  @override
  String get content => 'Bạn có thực sự muống dừng quá trình gửi tập tin?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileVi extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Không thể mở tập tin';
  @override
  String content({required Object file}) => 'Không thể mở "${file}". Có thể tập tin có thể đã bị di chuyển, đổi tên hoặc xoá?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeVi extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mã hoá đã tắt';
  @override
  String get content => 'Kết nối hiện đang hoạt động trên giao thức HTTP. Để dùng HTTPS, hãy bật mã hoá.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogVi extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogVi extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yêu thích';
  @override
  String get noFavorites => 'Hiện không có thiết bị yêu thích.';
  @override
  String get addFavorite => 'Thêm';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogVi extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xoá khỏi yêu thích';
  @override
  String content({required Object name}) => 'Bạn có chắc chắn muốn xoá "${name}" khỏi yêu thích?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogVi extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Thêm vào yêu thích';
  @override
  String get titleEdit => 'Điều chỉnh';
  @override
  String get name => 'Biệt danh';
  @override
  String get auto => '(tự động)';
  @override
  String get ip => 'Địa chỉ IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoVi extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Thông tin tập tin';
  @override
  String get fileName => 'Tên:';
  @override
  String get path => 'Đường dẫn:';
  @override
  String get size => 'Kích thước:';
  @override
  String get sender => 'Người gửi:';
  @override
  String get time => 'Thời gian:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputVi extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhập tên';
  @override
  String original({required Object original}) => 'Ban đầu: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogVi extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xoá lịch sử';
  @override
  String get content => 'Bạn có chắc chắn muốn xoá toàn bộ lịch sử?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedVi extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend không thể tìm kiếm thiết bị khác khi không được phép quét mạng nội bộ. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
  @override
  String get gotoSettings => 'Cài đặt';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputVi extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhập tin nhắn';
  @override
  String get multiline => 'Nhiều dòng';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesVi extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Không có tập tin nào được chọn';
  @override
  String get content => 'Vui lòng chọn ít nhất một tập tin.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionVi extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Chưa được trao quyền.';
  @override
  String get content => 'Bạn chưa được trao quyền. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformVi extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Không khả dụng';
  @override
  String get content => 'Tính năng chỉ có trên:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrVi extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mã QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsVi extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Thao Tác Nhanh';
  @override
  String get counter => 'Bộ đếm';
  @override
  String get prefix => 'Tiếp đầu ngữ';
  @override
  String get padZero => 'Pad with zeros';
  @override
  String get sortBeforeCount => 'Sắp xếp theo bảng chữ cái';
  @override
  String get random => 'Ngẫu nhiên';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeVi extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Yêu cầu tập tin đã được chấp thuận tự động. Chú ý rằng bất kỳ ai dùng chung mạng nội bộ với bạn đều có thể gửi tập tin cho bạn.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeVi extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Yêu cầu sẽ được chấp thuận tự động nếu thiết bị nằm trong danh sách yêu thích.',
    'Lưu ý! Hiện tại, tính năng này không hoàn toàn an toàn, vì tin tặc có thể mạo danh thiết bị trong danh sách yêu thích và gửi tệp tin cho bạn mà không gặp trở ngại gì.',
    'Tuy nhiên, tính năng này vẫn an toàn hơn tự động chấp thuận tập tin từ tất cả người dùng chung mạng nội bộ.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinVi extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nhập mã PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpVi extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Chế độ gửi';
  @override
  String get single => 'Gửi tập tin tới một người nhận. Lựa chọn sẽ được xoá sau khi quá trình gửi hoàn thành.';
  @override
  String get multiple => 'Gửi tập tin tới nhiều người nhận. Lựa chọn sẽ không bị xoá.';
  @override
  String get link => 'Người nhận chưa cài đặt LocalSend có thể nhận tập tin bằng cách mở liên kết trong trình duyệt.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomVi extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Đường dẫn';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsVi extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Hệ thống';
  @override
  String get dark => 'Tối';
  @override
  String get light => 'Sáng';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsVi extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Hệ thống';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsVi extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Hệ thống';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleVi extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleVi._(TranslationsVi root) : this._root = root, super.internal(root);

  final TranslationsVi _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Tổng tiến độ (${time})';
  @override
  String get finishedError => 'Kết thúc với lỗi';
  @override
  String get canceledSender => 'Đã huỷ bởi người gửi';
  @override
  String get canceledReceiver => 'Đã huỷ bởi người nhận';
}
