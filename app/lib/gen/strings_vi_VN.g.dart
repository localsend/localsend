part of 'strings.g.dart';

// Path: <root>
class _StringsViVn extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsViVn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.viVn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <vi-VN>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsViVn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Vietnam';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralViVn general = _StringsGeneralViVn._(_root);
	@override late final _StringsReceiveTabViVn receiveTab = _StringsReceiveTabViVn._(_root);
	@override late final _StringsSendTabViVn sendTab = _StringsSendTabViVn._(_root);
	@override late final _StringsSettingsTabViVn settingsTab = _StringsSettingsTabViVn._(_root);
	@override late final _StringsTroubleshootPageViVn troubleshootPage = _StringsTroubleshootPageViVn._(_root);
	@override late final _StringsReceiveHistoryPageViVn receiveHistoryPage = _StringsReceiveHistoryPageViVn._(_root);
	@override late final _StringsApkPickerPageViVn apkPickerPage = _StringsApkPickerPageViVn._(_root);
	@override late final _StringsSelectedFilesPageViVn selectedFilesPage = _StringsSelectedFilesPageViVn._(_root);
	@override late final _StringsReceivePageViVn receivePage = _StringsReceivePageViVn._(_root);
	@override late final _StringsReceiveOptionsPageViVn receiveOptionsPage = _StringsReceiveOptionsPageViVn._(_root);
	@override late final _StringsSendPageViVn sendPage = _StringsSendPageViVn._(_root);
	@override late final _StringsProgressPageViVn progressPage = _StringsProgressPageViVn._(_root);
	@override late final _StringsWebSharePageViVn webSharePage = _StringsWebSharePageViVn._(_root);
	@override late final _StringsAboutPageViVn aboutPage = _StringsAboutPageViVn._(_root);
	@override late final _StringsChangelogPageViVn changelogPage = _StringsChangelogPageViVn._(_root);
	@override late final _StringsAliasGeneratorViVn aliasGenerator = _StringsAliasGeneratorViVn._(_root);
	@override late final _StringsDialogsViVn dialogs = _StringsDialogsViVn._(_root);
	@override late final _StringsTrayViVn tray = _StringsTrayViVn._(_root);
	@override late final _StringsWebViVn web = _StringsWebViVn._(_root);
	@override late final _StringsAssetPickerViVn assetPicker = _StringsAssetPickerViVn._(_root);
}

// Path: general
class _StringsGeneralViVn extends _StringsGeneralEn {
	_StringsGeneralViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

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
class _StringsReceiveTabViVn extends _StringsReceiveTabEn {
	_StringsReceiveTabViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhận';
	@override late final _StringsReceiveTabInfoBoxViVn infoBox = _StringsReceiveTabInfoBoxViVn._(_root);
}

// Path: sendTab
class _StringsSendTabViVn extends _StringsSendTabEn {
	_StringsSendTabViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gửi';
	@override late final _StringsSendTabSelectionViVn selection = _StringsSendTabSelectionViVn._(_root);
	@override late final _StringsSendTabPickerViVn picker = _StringsSendTabPickerViVn._(_root);
	@override String get shareIntentInfo => 'Bạn có thể dùng tính năng "Chia sẻ" trong điện thoại của bạn để lựa chọn các tập tin dễ dàng hơn.';
	@override String get nearbyDevices => 'Thiết bị lân cận';
	@override String get thisDevice => 'Thiết bị hiện tại';
	@override String get scan => 'Tìm kiếm thiết bị';
	@override String get sendMode => 'Chế độ gửi';
	@override late final _StringsSendTabSendModesViVn sendModes = _StringsSendTabSendModesViVn._(_root);
	@override String get sendModeHelp => 'Giải thích';
	@override String get help => 'Vui lòng đảm bảo thiết bị gửi và nhận dùng chung mạng wifi.';
	@override String get placeItems => 'Đặt các mục để chia sẻ.';
}

// Path: settingsTab
class _StringsSettingsTabViVn extends _StringsSettingsTabEn {
	_StringsSettingsTabViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt';
	@override late final _StringsSettingsTabGeneralViVn general = _StringsSettingsTabGeneralViVn._(_root);
	@override late final _StringsSettingsTabReceiveViVn receive = _StringsSettingsTabReceiveViVn._(_root);
	@override late final _StringsSettingsTabNetworkViVn network = _StringsSettingsTabNetworkViVn._(_root);
	@override String get advancedSettings => 'Cài đặt nâng cao';
}

// Path: troubleshootPage
class _StringsTroubleshootPageViVn extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gỡ lỗi';
	@override String get subTitle => 'Ứng dụng không hoạt động như dự kiến? Bạn có thể tìm giải pháp thông thường tại đây.';
	@override String get solution => 'Giải pháp:';
	@override String get fixButton => 'Sửa lỗi tự động';
	@override late final _StringsTroubleshootPageFirewallViVn firewall = _StringsTroubleshootPageFirewallViVn._(_root);
	@override late final _StringsTroubleshootPageNoConnectionViVn noConnection = _StringsTroubleshootPageNoConnectionViVn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageViVn extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lịch sử';
	@override String get openFolder => 'Mở thư mục';
	@override String get deleteHistory => 'Xoá lịch sử';
	@override String get empty => 'Lịch sử rỗng.';
	@override late final _StringsReceiveHistoryPageEntryActionsViVn entryActions = _StringsReceiveHistoryPageEntryActionsViVn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageViVn extends _StringsApkPickerPageEn {
	_StringsApkPickerPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ứng dụng (APK)';
	@override String get excludeSystemApps => 'Mở ứng dụng hệ thống';
	@override String get excludeAppsWithoutLaunchIntent => 'Loại trừ các ứng dụng không thể khởi chạy';
	@override String apps({required Object n}) => '${n} Ứng dụng';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageViVn extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Xoá toàn bộ';
}

// Path: receivePage
class _StringsReceivePageViVn extends _StringsReceivePageEn {
	_StringsReceivePageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		one: 'muốn gửi cho bạn một tập tin.',
		other: 'muốn gửi cho bạn ${n} tập tin.',
	);
	@override String get subTitleMessage => 'đã gửi cho bạn một tin nhắn:';
	@override String get subTitleLink => 'đã gửi cho bạn một liên kết:';
	@override String get canceled => 'Người gửi đã xoá yêu cầu.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageViVn extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tuỳ chọn';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Thư mục LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Đã tự động tắt vì là thư mục.';
}

// Path: sendPage
class _StringsSendPageViVn extends _StringsSendPageEn {
	_StringsSendPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Đang chờ phản hồi...';
	@override String get rejected => 'Người nhận đã từ chối yêu cầu.';
	@override String get busy => 'Người nhận đang bận xử lý một yêu cầu khác.';
}

// Path: progressPage
class _StringsProgressPageViVn extends _StringsProgressPageEn {
	_StringsProgressPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Đang gửi tập tin';
	@override String get titleReceiving => 'Đang nhận tập tin';
	@override String get savedToGallery => 'Đã lưu vào Ảnh';
	@override late final _StringsProgressPageTotalViVn total = _StringsProgressPageTotalViVn._(_root);
}

// Path: webSharePage
class _StringsWebSharePageViVn extends _StringsWebSharePageEn {
	_StringsWebSharePageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

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
class _StringsAboutPageViVn extends _StringsAboutPageEn {
	_StringsAboutPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thông tin về LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageViVn extends _StringsChangelogPageEn {
	_StringsChangelogPageViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changelog';
}

// Path: aliasGenerator
class _StringsAliasGeneratorViVn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsViVn extends _StringsDialogsEn {
	_StringsDialogsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileViVn addFile = _StringsDialogsAddFileViVn._(_root);
	@override late final _StringsDialogsAddressInputViVn addressInput = _StringsDialogsAddressInputViVn._(_root);
	@override late final _StringsDialogsCancelSessionViVn cancelSession = _StringsDialogsCancelSessionViVn._(_root);
	@override late final _StringsDialogsCannotOpenFileViVn cannotOpenFile = _StringsDialogsCannotOpenFileViVn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeViVn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeViVn._(_root);
	@override late final _StringsDialogsErrorDialogViVn errorDialog = _StringsDialogsErrorDialogViVn._(_root);
	@override late final _StringsDialogsFavoriteDialogViVn favoriteDialog = _StringsDialogsFavoriteDialogViVn._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogViVn favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogViVn._(_root);
	@override late final _StringsDialogsFavoriteEditDialogViVn favoriteEditDialog = _StringsDialogsFavoriteEditDialogViVn._(_root);
	@override late final _StringsDialogsFileInfoViVn fileInfo = _StringsDialogsFileInfoViVn._(_root);
	@override late final _StringsDialogsFileNameInputViVn fileNameInput = _StringsDialogsFileNameInputViVn._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedViVn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedViVn._(_root);
	@override late final _StringsDialogsMessageInputViVn messageInput = _StringsDialogsMessageInputViVn._(_root);
	@override late final _StringsDialogsNoFilesViVn noFiles = _StringsDialogsNoFilesViVn._(_root);
	@override late final _StringsDialogsNoPermissionViVn noPermission = _StringsDialogsNoPermissionViVn._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformViVn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformViVn._(_root);
	@override late final _StringsDialogsQrViVn qr = _StringsDialogsQrViVn._(_root);
	@override late final _StringsDialogsQuickActionsViVn quickActions = _StringsDialogsQuickActionsViVn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeViVn quickSaveNotice = _StringsDialogsQuickSaveNoticeViVn._(_root);
	@override late final _StringsDialogsSendModeHelpViVn sendModeHelp = _StringsDialogsSendModeHelpViVn._(_root);
}

// Path: tray
class _StringsTrayViVn extends _StringsTrayEn {
	_StringsTrayViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Đóng LocalSend';
}

// Path: web
class _StringsWebViVn extends _StringsWebEn {
	_StringsWebViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Đã từ chối';
	@override String get files => 'Tập tin';
	@override String get fileName => 'Tên';
	@override String get size => 'Kích thước';
}

// Path: assetPicker
class _StringsAssetPickerViVn extends _StringsAssetPickerEn {
	_StringsAssetPickerViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

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
class _StringsReceiveTabInfoBoxViVn extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Biệt danh:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionViVn extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lựa chọn';
	@override String files({required Object files}) => 'Tập tin: ${files}';
	@override String size({required Object size}) => 'Kích thước: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerViVn extends _StringsSendTabPickerEn {
	_StringsSendTabPickerViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get file => 'Tập tin';
	@override String get folder => 'Thư mục';
	@override String get media => 'Media';
	@override String get text => 'Văn bản';
	@override String get app => 'Ứng dụng';
	@override String get clipboard => 'Dán';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesViVn extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get single => 'Một người nhận';
	@override String get multiple => 'Nhiều người nhận';
	@override String get link => 'Chia sẻ liên kết';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralViVn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tổng';
	@override String get brightness => 'Chủ đề';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsViVn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsViVn._(_root);
	@override String get color => 'Màu sắc';
	@override late final _StringsSettingsTabGeneralColorOptionsViVn colorOptions = _StringsSettingsTabGeneralColorOptionsViVn._(_root);
	@override String get language => 'Ngôn ngữ';
	@override late final _StringsSettingsTabGeneralLanguageOptionsViVn languageOptions = _StringsSettingsTabGeneralLanguageOptionsViVn._(_root);
	@override String get saveWindowPlacement => 'Thoát: Lưu vị trí cửa sổ hiển thị';
	@override String get minimizeToTray => 'Thoát: Ẩn xuống thanh tác vụ';
	@override String get launchAtStartup => 'Tự khởi động sau khi đăng nhập';
	@override String get launchMinimized => 'Tự khởi động: Khởi động ẩn';
	@override String get animations => 'Hoạt ảnh';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveViVn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhận';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Đích đến';
	@override String get downloads => '(Tải xuống)';
	@override String get saveToGallery => 'Lưu media vào thư viện';
	@override String get saveToHistory => 'Lưu vào lịch sử';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkViVn extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

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

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallViVn extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ứng dụng có thể gửi tập tin tới các thiết bị khác, nhưng các thiết bị khác không thể gửi tập tin đến thiết bị này.';
	@override String solution({required Object port}) => 'Có vẻ như đây là vấn đề của tường lửa (firewall). Bạn có thể khắc phục bằng cách chấp thuận các kết nối đến (UDP và TCP) trên port ${port}.';
	@override String get openFirewall => 'Mở tường lửa(Firewall)';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionViVn extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Cả hai thiết bị không thể nhận diện lẫn nhau cũng như không thể chia sẻ tập tin.';
	@override String get solution => 'Vấn đề tồn tại ở cả 2 thiết bị? Nếu thế, bạn cần chắc chắn rằng cả hai thiết bị đang dùng chung một mạng wifi với cùng thiết lập (port, địa chỉ multicast, mã hoá). Wifi có thể không cho các thiết bị giao tiếp với nhau. Trong trường hợp đó, bạn cần tìm trong thiết lập của router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsViVn extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get open => 'Mở tập tin';
	@override String get info => 'Thông tin';
	@override String get deleteFromHistory => 'Xoá khỏi lịch sử';
}

// Path: progressPage.total
class _StringsProgressPageTotalViVn extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleViVn title = _StringsProgressPageTotalTitleViVn._(_root);
	@override String count({required Object curr, required Object n}) => 'Tập tin: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Kích thước: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Tốc độ: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileViVn extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thêm vào lựa chọn';
	@override String get content => 'Bạn muốn thêm mục nào?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputViVn extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập địa chỉ';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Địa chỉ IP';
	@override String get recentlyUsed => 'Sử dụng gần đây: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionViVn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dừng gửi tập tin';
	@override String get content => 'Bạn có thực sự muống dừng quá trình gửi tập tin?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileViVn extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không thể mở tập tin';
	@override String content({required Object file}) => 'Không thể mở "${file}". Có thể tập tin có thể đã bị di chuyển, đổi tên hoặc xoá?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeViVn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mã hoá đã tắt';
	@override String get content => 'Kết nối hiện đang hoạt động trên giao thức HTTP. Để dùng HTTPS, hãy bật mã hoá.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogViVn extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogViVn extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yêu thích';
	@override String get noFavorites => 'Hiện không có thiết bị yêu thích.';
	@override String get addFavorite => 'Thêm';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogViVn extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Xoá khỏi yêu thích';
	@override String content({required Object name}) => 'Bạn có chắc chắn muốn xoá "${name}" khỏi yêu thích?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogViVn extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Thêm vào yêu thích';
	@override String get titleEdit => 'Điều chỉnh';
	@override String get name => 'Biệt danh';
	@override String get auto => '(tự động)';
	@override String get ip => 'Địa chỉ IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoViVn extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thông tin tập tin';
	@override String get fileName => 'Tên:';
	@override String get path => 'Đường dẫn:';
	@override String get size => 'Kích thước:';
	@override String get sender => 'Người gửi:';
	@override String get time => 'Thời gian:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputViVn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập tên';
	@override String original({required Object original}) => 'Ban đầu: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedViVn extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend không thể tìm kiếm thiết bị khác khi không được phép quét mạng nội bộ. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
	@override String get gotoSettings => 'Cài đặt';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputViVn extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nhập tin nhắn';
	@override String get multiline => 'Nhiều dòng';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesViVn extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không có tập tin nào được chọn';
	@override String get content => 'Vui lòng chọn ít nhất một tập tin.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionViVn extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chưa được trao quyền.';
	@override String get content => 'Bạn chưa được trao quyền. Vui lòng trao quyền cho ứng dụng trong cài đặt.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformViVn extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Không khả dụng';
	@override String get content => 'Tính năng chỉ có trên:';
}

// Path: dialogs.qr
class _StringsDialogsQrViVn extends _StringsDialogsQrEn {
	_StringsDialogsQrViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mã QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsViVn extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thao Tác Nhanh';
	@override String get counter => 'Bộ đếm';
	@override String get prefix => 'Tiếp đầu ngữ';
	@override String get padZero => 'Pad with zeros';
	@override String get sortBeforeCount => 'Sắp xếp theo bảng chữ cái';
	@override String get random => 'Ngẫu nhiên';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeViVn extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Yêu cầu tập tin đã được chấp thuận tự động. Chú ý rằng bất kỳ ai dùng chung mạng nội bộ với bạn đều có thể gửi tập tin cho bạn.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpViVn extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chế độ gửi';
	@override String get single => 'Gửi tập tin tới một người nhận. Lựa chọn sẽ được xoá sau khi quá trình gửi hoàn thành.';
	@override String get multiple => 'Gửi tập tin tới nhiều người nhận. Lựa chọn sẽ không bị xoá.';
	@override String get link => 'Người nhận chưa cài đặt LocalSend có thể nhận tập tin bằng cách mở liên kết trong trình duyệt.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsViVn extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get dark => 'Tối';
	@override String get light => 'Sáng';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsViVn extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsViVn extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleViVn extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleViVn._(_StringsViVn root) : this._root = root, super._(root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Tổng tiến độ (${time})';
	@override String get finishedError => 'Kết thúc với lỗi';
	@override String get canceledSender => 'Đã huỷ bởi người gửi';
	@override String get canceledReceiver => 'Đã huỷ bởi người nhận';
}
