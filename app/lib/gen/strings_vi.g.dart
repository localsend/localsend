part of 'strings.g.dart';

// Path: <root>
class _StringsVi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsVi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsVi _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Tiếng Việt';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralVi general = _StringsGeneralVi._(_root);
	@override late final _StringsReceiveTabVi receiveTab = _StringsReceiveTabVi._(_root);
	@override late final _StringsSendTabVi sendTab = _StringsSendTabVi._(_root);
	@override late final _StringsSettingsTabVi settingsTab = _StringsSettingsTabVi._(_root);
	@override late final _StringsTroubleshootPageVi troubleshootPage = _StringsTroubleshootPageVi._(_root);
	@override late final _StringsReceiveHistoryPageVi receiveHistoryPage = _StringsReceiveHistoryPageVi._(_root);
	@override late final _StringsApkPickerPageVi apkPickerPage = _StringsApkPickerPageVi._(_root);
	@override late final _StringsSelectedFilesPageVi selectedFilesPage = _StringsSelectedFilesPageVi._(_root);
	@override late final _StringsReceivePageVi receivePage = _StringsReceivePageVi._(_root);
	@override late final _StringsReceiveOptionsPageVi receiveOptionsPage = _StringsReceiveOptionsPageVi._(_root);
	@override late final _StringsSendPageVi sendPage = _StringsSendPageVi._(_root);
	@override late final _StringsProgressPageVi progressPage = _StringsProgressPageVi._(_root);
	@override late final _StringsWebSharePageVi webSharePage = _StringsWebSharePageVi._(_root);
	@override late final _StringsAboutPageVi aboutPage = _StringsAboutPageVi._(_root);
	@override late final _StringsDonationPageVi donationPage = _StringsDonationPageVi._(_root);
	@override late final _StringsChangelogPageVi changelogPage = _StringsChangelogPageVi._(_root);
	@override late final _StringsAliasGeneratorVi aliasGenerator = _StringsAliasGeneratorVi._(_root);
	@override late final _StringsDialogsVi dialogs = _StringsDialogsVi._(_root);
	@override late final _StringsTrayVi tray = _StringsTrayVi._(_root);
	@override late final _StringsWebVi web = _StringsWebVi._(_root);
	@override late final _StringsAssetPickerVi assetPicker = _StringsAssetPickerVi._(_root);
}

// Path: general
class _StringsGeneralVi extends _StringsGeneralEn {
	_StringsGeneralVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Đồng ý';
	@override String get accepted => 'Đã đồng ý';
	@override String get add => 'Thêm';
	@override String get advanced => 'Nâng cao';
	@override String get cancel => 'Thoát';
	@override String get close => 'Đóng';
	@override String get confirm => 'Xác nhận';
	@override String get continueStr => 'Tiếp tục';
	@override String get copy => 'Sao chép';
	@override String get copiedToClipboard => 'Đã sao chép vào bộ nhớ tạm';
	@override String get decline => 'Từ chối';
	@override String get done => 'Hoàn thành';
	@override String get delete => 'Xoá';
	@override String get edit => 'Sửa';
	@override String get error => 'Lỗi';
	@override String get example => 'Ví dụ';
	@override String get files => 'Tập tin';
	@override String get finished => 'Đã xong';
	@override String get hide => 'Ẩn';
	@override String get off => 'Tắt';
	@override String get offline => 'Ngoại tuyến';
	@override String get on => 'Bật';
	@override String get online => 'Trực tuyến';
	@override String get open => 'Mở';
	@override String get queue => 'Hàng chờ';
	@override String get quickSave => 'Lưu nhanh';
	@override String get renamed => 'Đã đổi tên';
	@override String get reset => 'Thiết lập lại';
	@override String get restart => 'Khởi động lại';
	@override String get settings => 'Cài đặt';
	@override String get skipped => 'Đã bỏ qua';
	@override String get start => 'Bắt đầu';
	@override String get stop => 'Dừng';
	@override String get save => 'Lưu';
	@override String get unchanged => 'Chưa thay đổi';
	@override String get unknown => 'Không rõ';
	@override String get noItemInClipboard => 'Không có gì trong bộ nhớ tạm';
}

// Path: receiveTab
class _StringsReceiveTabVi extends _StringsReceiveTabEn {
	_StringsReceiveTabVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhận';
	@override late final _StringsReceiveTabInfoBoxVi infoBox = _StringsReceiveTabInfoBoxVi._(_root);
}

// Path: sendTab
class _StringsSendTabVi extends _StringsSendTabEn {
	_StringsSendTabVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gửi';
	@override late final _StringsSendTabSelectionVi selection = _StringsSendTabSelectionVi._(_root);
	@override late final _StringsSendTabPickerVi picker = _StringsSendTabPickerVi._(_root);
	@override String get shareIntentInfo => 'Bạn có thể dùng tính năng "Chia sẻ" trong điện thoại của bạn để lựa chọn các tập tin dễ dàng hơn.';
	@override String get nearbyDevices => 'Thiết bị lân cận';
	@override String get thisDevice => 'Thiết bị hiện tại';
	@override String get scan => 'Tìm kiếm thiết bị';
	@override String get sendMode => 'Chế độ gửi';
	@override late final _StringsSendTabSendModesVi sendModes = _StringsSendTabSendModesVi._(_root);
	@override String get sendModeHelp => 'Giải thích';
	@override String get help => 'Vui lòng đảm bảo thiết bị gửi và nhận dùng chung mạng wifi.';
	@override String get placeItems => 'Đặt các mục để chia sẻ.';
}

// Path: settingsTab
class _StringsSettingsTabVi extends _StringsSettingsTabEn {
	_StringsSettingsTabVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt';
	@override late final _StringsSettingsTabGeneralVi general = _StringsSettingsTabGeneralVi._(_root);
	@override late final _StringsSettingsTabReceiveVi receive = _StringsSettingsTabReceiveVi._(_root);
	@override late final _StringsSettingsTabNetworkVi network = _StringsSettingsTabNetworkVi._(_root);
	@override late final _StringsSettingsTabOtherVi other = _StringsSettingsTabOtherVi._(_root);
	@override String get advancedSettings => 'Cài đặt nâng cao';
}

// Path: troubleshootPage
class _StringsTroubleshootPageVi extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gỡ lỗi';
	@override String get subTitle => 'Ứng dụng không hoạt động như dự kiến? Bạn có thể tìm giải pháp cho những vấn đề thường gặp tại đây.';
	@override String get solution => 'Giải pháp:';
	@override String get fixButton => 'Sửa lỗi tự động';
	@override late final _StringsTroubleshootPageFirewallVi firewall = _StringsTroubleshootPageFirewallVi._(_root);
	@override late final _StringsTroubleshootPageNoConnectionVi noConnection = _StringsTroubleshootPageNoConnectionVi._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageVi extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lịch sử';
	@override String get openFolder => 'Mở thư mục';
	@override String get deleteHistory => 'Xoá lịch sử';
	@override String get empty => 'Lịch sử rỗng.';
	@override late final _StringsReceiveHistoryPageEntryActionsVi entryActions = _StringsReceiveHistoryPageEntryActionsVi._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageVi extends _StringsApkPickerPageEn {
	_StringsApkPickerPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ứng dụng (APK)';
	@override String get excludeSystemApps => 'Mở ứng dụng hệ thống';
	@override String get excludeAppsWithoutLaunchIntent => 'Loại trừ các ứng dụng không thể khởi chạy';
	@override String apps({required Object n}) => '${n} Ứng dụng';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageVi extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Xoá toàn bộ';
}

// Path: receivePage
class _StringsReceivePageVi extends _StringsReceivePageEn {
	_StringsReceivePageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		one: 'muốn gửi cho bạn một tập tin',
		other: 'muốn gửi cho bạn ${n} tập tin',
	);
	@override String get subTitleMessage => 'đã gửi cho bạn một tin nhắn:';
	@override String get subTitleLink => 'đã gửi cho bạn một liên kết:';
	@override String get canceled => 'Người gửi đã xoá yêu cầu.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageVi extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tuỳ chọn';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Thư mục LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Đã tự động tắt vì là thư mục.';
}

// Path: sendPage
class _StringsSendPageVi extends _StringsSendPageEn {
	_StringsSendPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Đang chờ phản hồi...';
	@override String get rejected => 'Người nhận đã từ chối yêu cầu.';
	@override String get busy => 'Người nhận đang bận xử lý một yêu cầu khác.';
}

// Path: progressPage
class _StringsProgressPageVi extends _StringsProgressPageEn {
	_StringsProgressPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Đang gửi tập tin';
	@override String get titleReceiving => 'Đang nhận tập tin';
	@override String get savedToGallery => 'Đã lưu vào Ảnh';
	@override late final _StringsProgressPageTotalVi total = _StringsProgressPageTotalVi._(_root);
}

// Path: webSharePage
class _StringsWebSharePageVi extends _StringsWebSharePageEn {
	_StringsWebSharePageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chia sẻ qua liên kết';
	@override String get loading => 'Đang khởi tạo server...';
	@override String get stopping => 'Đang dừng server...';
	@override String get error => 'Một lỗi đã xảy ra khi khởi tạo server.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		one: 'Mở liên kết trong trình duyệt:',
		other: 'Mở một trong các liên kết với trình duyệt:',
	);
	@override String get requests => 'Yêu cầu';
	@override String get noRequests => 'Hiện không có yêu cầu nào.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend dùng chứng chỉ tự tạo. Bạn cần chấp thuận trong trình duyệt.';
	@override String pendingRequests({required Object n}) => 'Yêu cầu chờ: ${n}';
}

// Path: aboutPage
class _StringsAboutPageVi extends _StringsAboutPageEn {
	_StringsAboutPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thông tin về LocalSend';
	@override List<String> get description => [
		'LocalSend là một phần mềm miễn phí mã nguồn mở, giúp bạn chia sẻ tập tin cũng như tin nhắn đến các thiết bị phụ cận một cách bảo mật thông qua mạng nội bộ mà không cần kết nối mạng đến bên ngoài.',
		'Ứng dụng có trên Android, iOS, macOS, Windows và Linux. Bạn có thể tìm thấy các tuỳ chọn tải ở trang chủ.',
	];
	@override String get author => 'Tác giả';
	@override String get contributors => 'Người đóng góp';
	@override String get translators => 'Người dịch';
}

// Path: donationPage
class _StringsDonationPageVi extends _StringsDonationPageEn {
	_StringsDonationPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ủng hộ';
	@override String get info => 'LocalSend là ứng dụng miễn phí, mã nguồn mở, không chứa quảng cáo. Nếu bạn yêu thích ứng dụng này, bạn có thể hỗ trợ việc phát triển bằng việc ủng hộ.';
	@override String donate({required Object amount}) => 'Ủng hộ ${amount}';
	@override String get thanks => 'Xin chân thành cảm ơn!';
	@override String get restore => 'Khôi phục lịch sử ủng hộ';
}

// Path: changelogPage
class _StringsChangelogPageVi extends _StringsChangelogPageEn {
	_StringsChangelogPageVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorVi extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsVi extends _StringsDialogsEn {
	_StringsDialogsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileVi addFile = _StringsDialogsAddFileVi._(_root);
	@override late final _StringsDialogsAddressInputVi addressInput = _StringsDialogsAddressInputVi._(_root);
	@override late final _StringsDialogsCancelSessionVi cancelSession = _StringsDialogsCancelSessionVi._(_root);
	@override late final _StringsDialogsCannotOpenFileVi cannotOpenFile = _StringsDialogsCannotOpenFileVi._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeVi encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeVi._(_root);
	@override late final _StringsDialogsErrorDialogVi errorDialog = _StringsDialogsErrorDialogVi._(_root);
	@override late final _StringsDialogsFavoriteDialogVi favoriteDialog = _StringsDialogsFavoriteDialogVi._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogVi favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogVi._(_root);
	@override late final _StringsDialogsFavoriteEditDialogVi favoriteEditDialog = _StringsDialogsFavoriteEditDialogVi._(_root);
	@override late final _StringsDialogsFileInfoVi fileInfo = _StringsDialogsFileInfoVi._(_root);
	@override late final _StringsDialogsFileNameInputVi fileNameInput = _StringsDialogsFileNameInputVi._(_root);
	@override late final _StringsDialogsHistoryClearDialogVi historyClearDialog = _StringsDialogsHistoryClearDialogVi._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedVi localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedVi._(_root);
	@override late final _StringsDialogsMessageInputVi messageInput = _StringsDialogsMessageInputVi._(_root);
	@override late final _StringsDialogsNoFilesVi noFiles = _StringsDialogsNoFilesVi._(_root);
	@override late final _StringsDialogsNoPermissionVi noPermission = _StringsDialogsNoPermissionVi._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformVi notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformVi._(_root);
	@override late final _StringsDialogsQrVi qr = _StringsDialogsQrVi._(_root);
	@override late final _StringsDialogsQuickActionsVi quickActions = _StringsDialogsQuickActionsVi._(_root);
	@override late final _StringsDialogsQuickSaveNoticeVi quickSaveNotice = _StringsDialogsQuickSaveNoticeVi._(_root);
	@override late final _StringsDialogsSendModeHelpVi sendModeHelp = _StringsDialogsSendModeHelpVi._(_root);
}

// Path: tray
class _StringsTrayVi extends _StringsTrayEn {
	_StringsTrayVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Đóng LocalSend';
}

// Path: web
class _StringsWebVi extends _StringsWebEn {
	_StringsWebVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Đã từ chối';
	@override String get files => 'Tập tin';
	@override String get fileName => 'Tên';
	@override String get size => 'Kích thước';
}

// Path: assetPicker
class _StringsAssetPickerVi extends _StringsAssetPickerEn {
	_StringsAssetPickerVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Xác nhận';
	@override String get cancel => 'Thoát';
	@override String get edit => 'Sửa';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Tải lỗi';
	@override String get original => 'Gốc';
	@override String get preview => 'Xem trước';
	@override String get select => 'Chọn';
	@override String get emptyList => 'Danh sách trống';
	@override String get unSupportedAssetType => 'Định dạng tập tin không được hỗ trợ.';
	@override String get unableToAccessAll => 'Không thể truy cập tới tất cả tập tin trong thiết bị';
	@override String get viewingLimitedAssetsTip => 'Chỉ hiển thị các tập tin và album mà ứng dụng có thể truy cập.';
	@override String get changeAccessibleLimitedAssets => 'Ấn để cập nhận các tập tin có thể truy cập.';
	@override String get accessAllTip => 'Ứng dụng chỉ có thể truy cập một số tập tin trong thiết bị. Hãy vào cài đặt hệ thống để chấp thuận ứng dụng có thể truy cập tất cả media trong thiết bị.';
	@override String get goToSystemSettings => 'Truy cập cài đặt hệ thống';
	@override String get accessLimitedAssets => 'Tiếp tục với truy cập bị giới hạn';
	@override String get accessiblePathName => 'Các tập tin có thể truy cập';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Ảnh';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Media khác';
	@override String get sActionPlayHint => 'mở';
	@override String get sActionPreviewHint => 'xem trước';
	@override String get sActionSelectHint => 'chọn';
	@override String get sActionSwitchPathLabel => 'đổi đường dẫn';
	@override String get sActionUseCameraHint => 'dùng camera';
	@override String get sNameDurationLabel => 'thời lượng';
	@override String get sUnitAssetCountLabel => 'đếm';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxVi extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Biệt danh:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionVi extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lựa chọn';
	@override String files({required Object files}) => 'Tập tin: ${files}';
	@override String size({required Object size}) => 'Kích thước: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerVi extends _StringsSendTabPickerEn {
	_StringsSendTabPickerVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get file => 'Tập tin';
	@override String get folder => 'Thư mục';
	@override String get media => 'Media';
	@override String get text => 'Văn bản';
	@override String get app => 'Ứng dụng';
	@override String get clipboard => 'Dán';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesVi extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get single => 'Một người nhận';
	@override String get multiple => 'Nhiều người nhận';
	@override String get link => 'Chia sẻ liên kết';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralVi extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chung';
	@override String get brightness => 'Chủ đề';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsVi brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsVi._(_root);
	@override String get color => 'Màu sắc';
	@override late final _StringsSettingsTabGeneralColorOptionsVi colorOptions = _StringsSettingsTabGeneralColorOptionsVi._(_root);
	@override String get language => 'Ngôn ngữ';
	@override late final _StringsSettingsTabGeneralLanguageOptionsVi languageOptions = _StringsSettingsTabGeneralLanguageOptionsVi._(_root);
	@override String get saveWindowPlacement => 'Thoát: Lưu vị trí cửa sổ hiển thị';
	@override String get minimizeToTray => 'Thoát: Ẩn xuống thanh tác vụ';
	@override String get launchAtStartup => 'Tự khởi động sau khi đăng nhập';
	@override String get launchMinimized => 'Tự khởi động: Khởi động ẩn';
	@override String get animations => 'Hoạt ảnh';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveVi extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhận';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Tự động hoàn thành';
	@override String get destination => 'Đích đến';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Lưu media vào thư viện';
	@override String get saveToHistory => 'Lưu vào lịch sử';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkVi extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mạng';
	@override String get needRestart => 'Khởi động lại server để cài đặt có hiệu lực!';
	@override String get server => 'Server';
	@override String get alias => 'Biệt danh';
	@override String get deviceType => 'Loại thiết bị';
	@override String get deviceModel => 'Model thiết bị';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Các thiết bị khác có thể không nhận diện được thiết bị của bạn, vì bạn đang dùng port tuỳ chỉnh. (mặc định: ${defaultPort})';
	@override String get encryption => 'Mã hoá';
	@override String get multicastGroup => 'Đa phương tiện';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Các thiết bị khác có thể không nhận diện được thiết bị của bạn, vì bạn đang dùng địa chỉ multicast tuỳ chỉnh. (mặc định: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherVi extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Khác';
	@override String get support => 'Hỗ trợ LocalSend';
	@override String get donate => 'Ủng hộ';
	@override String get privacyPolicy => 'Chính sách bảo mật';
	@override String get termsOfUse => 'Điều khoản sử dụng';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallVi extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ứng dụng có thể gửi tập tin tới các thiết bị khác, nhưng các thiết bị khác không thể gửi tập tin đến thiết bị này.';
	@override String solution({required Object port}) => 'Có vẻ như đây là một vấn đề với tường lửa (firewall). Bạn có thể khắc phục bằng cách chấp thuận các kết nối đến (UDP và TCP) trên port ${port}.';
	@override String get openFirewall => 'Mở tường lửa(Firewall)';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionVi extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Cả hai thiết bị không thể nhận diện lẫn nhau cũng như không thể chia sẻ tập tin.';
	@override String get solution => 'Vấn đề tồn tại ở cả 2 thiết bị? Nếu thế, bạn cần chắc chắn rằng cả hai thiết bị đang dùng chung một mạng wifi với cùng thiết lập (port, địa chỉ multicast, mã hoá). Wifi có thể không cho các thiết bị giao tiếp với nhau. Trong trường hợp đó, bạn cần tìm trong thiết lập của router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsVi extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get open => 'Mở tập tin';
	@override String get info => 'Thông tin';
	@override String get deleteFromHistory => 'Xoá khỏi lịch sử';
}

// Path: progressPage.total
class _StringsProgressPageTotalVi extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleVi title = _StringsProgressPageTotalTitleVi._(_root);
	@override String count({required Object curr, required Object n}) => 'Tập tin: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Kích thước: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Tốc độ: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileVi extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thêm vào lựa chọn';
	@override String get content => 'Bạn muốn thêm mục nào?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputVi extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập địa chỉ';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Địa chỉ IP';
	@override String get recentlyUsed => 'Sử dụng gần đây: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionVi extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dừng gửi tập tin';
	@override String get content => 'Bạn có thực sự muống dừng quá trình gửi tập tin?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileVi extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không thể mở tập tin';
	@override String content({required Object file}) => 'Không thể mở "${file}". Có thể tập tin có thể đã bị di chuyển, đổi tên hoặc xoá?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeVi extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mã hoá đã tắt';
	@override String get content => 'Kết nối hiện đang hoạt động trên giao thức HTTP. Để dùng HTTPS, hãy bật mã hoá.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogVi extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogVi extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yêu thích';
	@override String get noFavorites => 'Hiện không có thiết bị yêu thích.';
	@override String get addFavorite => 'Thêm';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogVi extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Xoá khỏi yêu thích';
	@override String content({required Object name}) => 'Bạn có chắc chắn muốn xoá "${name}" khỏi yêu thích?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogVi extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Thêm vào yêu thích';
	@override String get titleEdit => 'Điều chỉnh';
	@override String get name => 'Biệt danh';
	@override String get auto => '(tự động)';
	@override String get ip => 'Địa chỉ IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoVi extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thông tin tập tin';
	@override String get fileName => 'Tên:';
	@override String get path => 'Đường dẫn:';
	@override String get size => 'Kích thước:';
	@override String get sender => 'Người gửi:';
	@override String get time => 'Thời gian:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputVi extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập tên';
	@override String original({required Object original}) => 'Ban đầu: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogVi extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Xoá lịch sử';
	@override String get content => 'Bạn có chắc chắn muốn xoá toàn bộ lịch sử?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedVi extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend không thể tìm kiếm thiết bị khác khi không được phép quét mạng nội bộ. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
	@override String get gotoSettings => 'Cài đặt';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputVi extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập tin nhắn';
	@override String get multiline => 'Nhiều dòng';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesVi extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không có tập tin nào được chọn';
	@override String get content => 'Vui lòng chọn ít nhất một tập tin.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionVi extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chưa được trao quyền.';
	@override String get content => 'Bạn chưa được trao quyền. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformVi extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không khả dụng';
	@override String get content => 'Tính năng chỉ có trên:';
}

// Path: dialogs.qr
class _StringsDialogsQrVi extends _StringsDialogsQrEn {
	_StringsDialogsQrVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mã QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsVi extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thao Tác Nhanh';
	@override String get counter => 'Bộ đếm';
	@override String get prefix => 'Tiếp đầu ngữ';
	@override String get padZero => 'Pad with zeros';
	@override String get sortBeforeCount => 'Sắp xếp theo bảng chữ cái';
	@override String get random => 'Ngẫu nhiên';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeVi extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Yêu cầu tập tin đã được chấp thuận tự động. Chú ý rằng bất kỳ ai dùng chung mạng nội bộ với bạn đều có thể gửi tập tin cho bạn.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpVi extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chế độ gửi';
	@override String get single => 'Gửi tập tin tới một người nhận. Lựa chọn sẽ được xoá sau khi quá trình gửi hoàn thành.';
	@override String get multiple => 'Gửi tập tin tới nhiều người nhận. Lựa chọn sẽ không bị xoá.';
	@override String get link => 'Người nhận chưa cài đặt LocalSend có thể nhận tập tin bằng cách mở liên kết trong trình duyệt.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsVi extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get dark => 'Tối';
	@override String get light => 'Sáng';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsVi extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsVi extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleVi extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Tổng tiến độ (${time})';
	@override String get finishedError => 'Kết thúc với lỗi';
	@override String get canceledSender => 'Đã huỷ bởi người gửi';
	@override String get canceledReceiver => 'Đã huỷ bởi người nhận';
}
