part of 'strings.g.dart';

// Path: <root>
class _StringsZhTw extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhTw.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsZhTw _root = this; // ignore: unused_field

	// Translations
	@override String get locale => '繁體中文 – 台灣';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralZhTw general = _StringsGeneralZhTw._(_root);
	@override late final _StringsReceiveTabZhTw receiveTab = _StringsReceiveTabZhTw._(_root);
	@override late final _StringsSendTabZhTw sendTab = _StringsSendTabZhTw._(_root);
	@override late final _StringsSettingsTabZhTw settingsTab = _StringsSettingsTabZhTw._(_root);
	@override late final _StringsTroubleshootPageZhTw troubleshootPage = _StringsTroubleshootPageZhTw._(_root);
	@override late final _StringsReceiveHistoryPageZhTw receiveHistoryPage = _StringsReceiveHistoryPageZhTw._(_root);
	@override late final _StringsApkPickerPageZhTw apkPickerPage = _StringsApkPickerPageZhTw._(_root);
	@override late final _StringsSelectedFilesPageZhTw selectedFilesPage = _StringsSelectedFilesPageZhTw._(_root);
	@override late final _StringsReceivePageZhTw receivePage = _StringsReceivePageZhTw._(_root);
	@override late final _StringsReceiveOptionsPageZhTw receiveOptionsPage = _StringsReceiveOptionsPageZhTw._(_root);
	@override late final _StringsSendPageZhTw sendPage = _StringsSendPageZhTw._(_root);
	@override late final _StringsProgressPageZhTw progressPage = _StringsProgressPageZhTw._(_root);
	@override late final _StringsWebSharePageZhTw webSharePage = _StringsWebSharePageZhTw._(_root);
	@override late final _StringsAboutPageZhTw aboutPage = _StringsAboutPageZhTw._(_root);
	@override late final _StringsDonationPageZhTw donationPage = _StringsDonationPageZhTw._(_root);
	@override late final _StringsChangelogPageZhTw changelogPage = _StringsChangelogPageZhTw._(_root);
	@override late final _StringsAliasGeneratorZhTw aliasGenerator = _StringsAliasGeneratorZhTw._(_root);
	@override late final _StringsDialogsZhTw dialogs = _StringsDialogsZhTw._(_root);
	@override late final _StringsTrayZhTw tray = _StringsTrayZhTw._(_root);
	@override late final _StringsWebZhTw web = _StringsWebZhTw._(_root);
	@override late final _StringsAssetPickerZhTw assetPicker = _StringsAssetPickerZhTw._(_root);
}

// Path: general
class _StringsGeneralZhTw extends _StringsGeneralEn {
	_StringsGeneralZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get accept => '接受';
	@override String get accepted => '已接受';
	@override String get add => '新增';
	@override String get advanced => '進階';
	@override String get cancel => '取消';
	@override String get close => '關閉';
	@override String get confirm => '確認';
	@override String get continueStr => '繼續';
	@override String get copy => '複製';
	@override String get copiedToClipboard => '已複製到剪貼簿';
	@override String get decline => '拒絕';
	@override String get done => '完成';
	@override String get delete => '刪除';
	@override String get edit => '編輯';
	@override String get error => '錯誤';
	@override String get example => '範例';
	@override String get files => '檔案';
	@override String get finished => '已完成';
	@override String get hide => '隱藏';
	@override String get off => '關閉';
	@override String get offline => '離線';
	@override String get on => '開啟';
	@override String get online => '線上';
	@override String get open => '開啟';
	@override String get queue => '佇列';
	@override String get quickSave => '快速儲存';
	@override String get renamed => '已重新命名';
	@override String get reset => '重設';
	@override String get restart => '重新啟動';
	@override String get settings => '設定';
	@override String get skipped => '已跳過';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get save => '儲存';
	@override String get unchanged => '未變更';
	@override String get unknown => '未知';
	@override String get noItemInClipboard => '剪貼簿中沒有項目';
}

// Path: receiveTab
class _StringsReceiveTabZhTw extends _StringsReceiveTabEn {
	_StringsReceiveTabZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override late final _StringsReceiveTabInfoBoxZhTw infoBox = _StringsReceiveTabInfoBoxZhTw._(_root);
}

// Path: sendTab
class _StringsSendTabZhTw extends _StringsSendTabEn {
	_StringsSendTabZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '傳送';
	@override late final _StringsSendTabSelectionZhTw selection = _StringsSendTabSelectionZhTw._(_root);
	@override late final _StringsSendTabPickerZhTw picker = _StringsSendTabPickerZhTw._(_root);
	@override String get shareIntentInfo => '您也可以使用您的行動裝置中的「分享」功能更簡單地選取檔案。';
	@override String get nearbyDevices => '附近的裝置';
	@override String get thisDevice => '此裝置';
	@override String get scan => '尋找裝置';
	@override String get sendMode => '傳送模式';
	@override late final _StringsSendTabSendModesZhTw sendModes = _StringsSendTabSendModesZhTw._(_root);
	@override String get sendModeHelp => '說明';
	@override String get help => '請確保所需目標的處於相同的 Wi‑Fi 網路。';
	@override String get placeItems => '列出要分享的項目。';
}

// Path: settingsTab
class _StringsSettingsTabZhTw extends _StringsSettingsTabEn {
	_StringsSettingsTabZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override late final _StringsSettingsTabGeneralZhTw general = _StringsSettingsTabGeneralZhTw._(_root);
	@override late final _StringsSettingsTabReceiveZhTw receive = _StringsSettingsTabReceiveZhTw._(_root);
	@override late final _StringsSettingsTabNetworkZhTw network = _StringsSettingsTabNetworkZhTw._(_root);
	@override late final _StringsSettingsTabOtherZhTw other = _StringsSettingsTabOtherZhTw._(_root);
	@override String get advancedSettings => '進階設定';
}

// Path: troubleshootPage
class _StringsTroubleshootPageZhTw extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '疑難排解';
	@override String get subTitle => '這個應用程式並未如預期運作？在這裡您可以找到常見的解決方案。';
	@override String get solution => '解決方案:';
	@override String get fixButton => '自動修正';
	@override late final _StringsTroubleshootPageFirewallZhTw firewall = _StringsTroubleshootPageFirewallZhTw._(_root);
	@override late final _StringsTroubleshootPageNoConnectionZhTw noConnection = _StringsTroubleshootPageNoConnectionZhTw._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageZhTw extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '歷史記錄';
	@override String get openFolder => '開啟資料夾';
	@override String get deleteHistory => '刪除歷史記錄';
	@override String get empty => '沒有歷史記錄.';
	@override late final _StringsReceiveHistoryPageEntryActionsZhTw entryActions = _StringsReceiveHistoryPageEntryActionsZhTw._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageZhTw extends _StringsApkPickerPageEn {
	_StringsApkPickerPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '應用程式 (APK)';
	@override String get excludeSystemApps => '排除系統應用程式';
	@override String get excludeAppsWithoutLaunchIntent => '排除不可啟動的應用程式';
	@override String apps({required Object n}) => '${n} 個應用程式';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageZhTw extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => '全部刪除';
}

// Path: receivePage
class _StringsReceivePageZhTw extends _StringsReceivePageEn {
	_StringsReceivePageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '要傳送一個檔案給您。',
		other: '要傳送 ${n} 個檔案給您。',
	);
	@override String get subTitleMessage => '已傳送一則訊息給您：';
	@override String get subTitleLink => '已傳送一個連結給您：';
	@override String get canceled => '傳送者已取消要求。';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageZhTw extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '選項';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend 資料夾)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => '因存在目錄而自動關閉。';
}

// Path: sendPage
class _StringsSendPageZhTw extends _StringsSendPageEn {
	_StringsSendPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get waiting => '正在等候回應…';
	@override String get rejected => '接收者拒絕了要求。';
	@override String get busy => '接收者正忙於處理另一個要求。';
}

// Path: progressPage
class _StringsProgressPageZhTw extends _StringsProgressPageEn {
	_StringsProgressPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get titleSending => '正在傳送檔案';
	@override String get titleReceiving => '正在接收檔案';
	@override String get savedToGallery => '已儲存至相簿';
	@override late final _StringsProgressPageTotalZhTw total = _StringsProgressPageTotalZhTw._(_root);
}

// Path: webSharePage
class _StringsWebSharePageZhTw extends _StringsWebSharePageEn {
	_StringsWebSharePageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '透過連結分享';
	@override String get loading => '正在啟動伺服器…';
	@override String get stopping => '正在關閉伺服器…';
	@override String get error => '啟動伺服器時發生錯誤。';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '在瀏覽器開啟此連結：',
		other: '在瀏覽器中開啟其中一個連結：',
	);
	@override String get requests => '要求';
	@override String get noRequests => '目前沒有任何要求。';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend 使用自簽名憑證。您需要在瀏覽器中接受它。';
	@override String pendingRequests({required Object n}) => '待處理的要求：${n}';
}

// Path: aboutPage
class _StringsAboutPageZhTw extends _StringsAboutPageEn {
	_StringsAboutPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '關於 LocalSend';
	@override List<String> get description => [
		'LocalSend 是一款免費的開源應用程式，可讓您透過區域網路與鄰近的裝置安全的共享檔案和訊息，無需網際網路連線。',
		'此應用程式可在 Android、iOS、macOS、Windows 和 Linux 上使用。 您可以在官網首頁上找到所有下載選項。',
	];
	@override String get author => '作者';
	@override String get contributors => '貢獻者';
	@override String get translators => '翻譯者';
}

// Path: donationPage
class _StringsDonationPageZhTw extends _StringsDonationPageEn {
	_StringsDonationPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '贊助';
	@override String get info => 'LocalSend 是免費、開源且沒有任何廣告的。如果您喜歡此應用程式，您可以透過捐贈來支持開發。';
	@override String donate({required Object amount}) => '贊助 ${amount}';
	@override String get thanks => '非常感謝您!';
	@override String get restore => '回復購買';
}

// Path: changelogPage
class _StringsChangelogPageZhTw extends _StringsChangelogPageEn {
	_StringsChangelogPageZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '變更記錄';
}

// Path: aliasGenerator
class _StringsAliasGeneratorZhTw extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsZhTw extends _StringsDialogsEn {
	_StringsDialogsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileZhTw addFile = _StringsDialogsAddFileZhTw._(_root);
	@override late final _StringsDialogsAddressInputZhTw addressInput = _StringsDialogsAddressInputZhTw._(_root);
	@override late final _StringsDialogsCancelSessionZhTw cancelSession = _StringsDialogsCancelSessionZhTw._(_root);
	@override late final _StringsDialogsCannotOpenFileZhTw cannotOpenFile = _StringsDialogsCannotOpenFileZhTw._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeZhTw encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeZhTw._(_root);
	@override late final _StringsDialogsErrorDialogZhTw errorDialog = _StringsDialogsErrorDialogZhTw._(_root);
	@override late final _StringsDialogsFavoriteDialogZhTw favoriteDialog = _StringsDialogsFavoriteDialogZhTw._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogZhTw favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogZhTw._(_root);
	@override late final _StringsDialogsFavoriteEditDialogZhTw favoriteEditDialog = _StringsDialogsFavoriteEditDialogZhTw._(_root);
	@override late final _StringsDialogsFileInfoZhTw fileInfo = _StringsDialogsFileInfoZhTw._(_root);
	@override late final _StringsDialogsFileNameInputZhTw fileNameInput = _StringsDialogsFileNameInputZhTw._(_root);
	@override late final _StringsDialogsHistoryClearDialogZhTw historyClearDialog = _StringsDialogsHistoryClearDialogZhTw._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedZhTw localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedZhTw._(_root);
	@override late final _StringsDialogsMessageInputZhTw messageInput = _StringsDialogsMessageInputZhTw._(_root);
	@override late final _StringsDialogsNoFilesZhTw noFiles = _StringsDialogsNoFilesZhTw._(_root);
	@override late final _StringsDialogsNoPermissionZhTw noPermission = _StringsDialogsNoPermissionZhTw._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformZhTw notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformZhTw._(_root);
	@override late final _StringsDialogsQrZhTw qr = _StringsDialogsQrZhTw._(_root);
	@override late final _StringsDialogsQuickActionsZhTw quickActions = _StringsDialogsQuickActionsZhTw._(_root);
	@override late final _StringsDialogsQuickSaveNoticeZhTw quickSaveNotice = _StringsDialogsQuickSaveNoticeZhTw._(_root);
	@override late final _StringsDialogsSendModeHelpZhTw sendModeHelp = _StringsDialogsSendModeHelpZhTw._(_root);
}

// Path: tray
class _StringsTrayZhTw extends _StringsTrayEn {
	_StringsTrayZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => '離開 LocalSend';
}

// Path: web
class _StringsWebZhTw extends _StringsWebEn {
	_StringsWebZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => '遭到拒絕';
	@override String get files => '檔案';
	@override String get fileName => '檔案名稱';
	@override String get size => '大小';
}

// Path: assetPicker
class _StringsAssetPickerZhTw extends _StringsAssetPickerEn {
	_StringsAssetPickerZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get confirm => '確認';
	@override String get cancel => '取消';
	@override String get edit => '編輯';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => '載入失敗';
	@override String get original => '原始檔案';
	@override String get preview => '預覽';
	@override String get select => '選取';
	@override String get emptyList => '空白清單';
	@override String get unSupportedAssetType => '不支援的檔案類型。';
	@override String get unableToAccessAll => '無法存取此裝置上的所有檔案';
	@override String get viewingLimitedAssetsTip => '僅檢視此應用程式可存取的檔案和相簿。';
	@override String get changeAccessibleLimitedAssets => '按一下以更新可存取的檔案';
	@override String get accessAllTip => '應用程式僅可存取此裝置的部分檔案，前往系統設定並允許應用程式存取此裝置上的所有媒體。';
	@override String get goToSystemSettings => '前往系統設定';
	@override String get accessLimitedAssets => '以受限制的存取繼續';
	@override String get accessiblePathName => '可存取的檔案';
	@override String get sTypeAudioLabel => '音樂';
	@override String get sTypeImageLabel => '圖片';
	@override String get sTypeVideoLabel => '影片';
	@override String get sTypeOtherLabel => '其他媒體';
	@override String get sActionPlayHint => '播放';
	@override String get sActionPreviewHint => '預覽';
	@override String get sActionSelectHint => '選取';
	@override String get sActionSwitchPathLabel => '變更路徑';
	@override String get sActionUseCameraHint => '使用相機';
	@override String get sNameDurationLabel => '持續時間';
	@override String get sUnitAssetCountLabel => '計數';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxZhTw extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP：';
	@override String get port => '通訊埠：';
	@override String get alias => '別名：';
}

// Path: sendTab.selection
class _StringsSendTabSelectionZhTw extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '選取';
	@override String files({required Object files}) => '檔案：${files}';
	@override String size({required Object size}) => '大小：${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerZhTw extends _StringsSendTabPickerEn {
	_StringsSendTabPickerZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get file => '檔案';
	@override String get folder => '資料夾';
	@override String get media => '媒體';
	@override String get text => '文字';
	@override String get app => '應用程式';
	@override String get clipboard => '貼上';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesZhTw extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get single => '單一接收者';
	@override String get multiple => '多重接收者';
	@override String get link => '透過連結分享';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralZhTw extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '一般';
	@override String get brightness => '亮度';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsZhTw brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsZhTw._(_root);
	@override String get color => '顏色';
	@override late final _StringsSettingsTabGeneralColorOptionsZhTw colorOptions = _StringsSettingsTabGeneralColorOptionsZhTw._(_root);
	@override String get language => '語言';
	@override late final _StringsSettingsTabGeneralLanguageOptionsZhTw languageOptions = _StringsSettingsTabGeneralLanguageOptionsZhTw._(_root);
	@override String get saveWindowPlacement => '離開：儲存視窗位置';
	@override String get minimizeToTray => '離開：最小化至系統匣';
	@override String get launchAtStartup => '登入後自動啟動';
	@override String get launchMinimized => '自動啟動至系統匣';
	@override String get animations => '動畫效果';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveZhTw extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => '自動完成';
	@override String get destination => '儲存目錄';
	@override String get downloads => '(下載)';
	@override String get saveToGallery => '儲存媒體至相簿';
	@override String get saveToHistory => '儲存至歷史紀錄';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkZhTw extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '網路';
	@override String get needRestart => '重新啟動伺服器以套用設定！';
	@override String get server => '伺服器';
	@override String get alias => '別名';
	@override String get deviceType => '裝置類型';
	@override String get deviceModel => '裝置型號';
	@override String get port => '通訊埠';
	@override String portWarning({required Object defaultPort}) => '您可能無法被其他裝置偵測，因為您正在使用自訂通訊埠。(預設：${defaultPort})';
	@override String get encryption => '加密';
	@override String get multicastGroup => '多點傳送';
	@override String multicastGroupWarning({required Object defaultMulticast}) => '您可能無法被其他裝置偵測，因為您正在使用自訂多點傳送位址。(預設：${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherZhTw extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '其它';
	@override String get support => '支持LocalSend';
	@override String get donate => '贊助';
	@override String get privacyPolicy => '隱私權政策';
	@override String get termsOfUse => '使用條款';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallZhTw extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get symptom => '此應用程式可以向其他裝置傳送檔案，但其他裝置無法向此裝置傳送檔案。';
	@override String solution({required Object port}) => '這很可能是防火牆問題。您可以透過允許通訊埠 ${port} 上的連入連線 (UDP 和 TCP) 以解決此問題。';
	@override String get openFirewall => '開啟防火牆';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionZhTw extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get symptom => '兩部裝置無法探索彼此，也無法分享檔案。';
	@override String get solution => '雙方都存在問題？然後你需要確保兩部裝置處於相同的 Wi‑Fi 網路中並共用相同的組態 (通訊埠、多點傳送位址、加密)。Wi‑Fi 可能不允許參與者之間進行通訊。在這種狀況下，必須在路由器上啟用此選項。';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsZhTw extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get open => '開啟檔案';
	@override String get info => '資訊';
	@override String get deleteFromHistory => '從歷史記錄刪除';
}

// Path: progressPage.total
class _StringsProgressPageTotalZhTw extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleZhTw title = _StringsProgressPageTotalTitleZhTw._(_root);
	@override String count({required Object curr, required Object n}) => '檔案：${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => '大小：${curr} / ${n}';
	@override String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileZhTw extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '新增檔案';
	@override String get content => '您想要新增什麼檔案？';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputZhTw extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入位址';
	@override String get hashtag => '雜湊標記';
	@override String get ip => 'IP 位址';
	@override String get recentlyUsed => '最近使用：';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionZhTw extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '取消檔案傳輸';
	@override String get content => '您確定要取消檔案傳輸嗎？';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileZhTw extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '無法開啟檔案';
	@override String content({required Object file}) => '無法開啟「${file}」，這個檔案已被移動、重新命名或刪除了嗎？';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeZhTw extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '加密已停用';
	@override String get content => '目前的通訊透過未經加密的 HTTP 通訊協定執行。若要使用 HTTPS，請再次啟用加密。';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogZhTw extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogZhTw extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '收藏';
	@override String get noFavorites => '還沒有收藏的裝置。';
	@override String get addFavorite => '新增';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogZhTw extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '從收藏中刪除';
	@override String content({required Object name}) => '您確定要從收藏中刪除 "${name}" 嗎?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogZhTw extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => '新增收藏';
	@override String get titleEdit => '調整';
	@override String get name => '別名';
	@override String get auto => '(自動)';
	@override String get ip => 'IP位址';
	@override String get port => '連接埠';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoZhTw extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '檔案資訊';
	@override String get fileName => '檔案名稱：';
	@override String get path => '路徑：';
	@override String get size => '大小：';
	@override String get sender => '傳送者：';
	@override String get time => '時間：';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputZhTw extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入檔案名稱';
	@override String original({required Object original}) => '原始檔案名稱：${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogZhTw extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '清除紀錄';
	@override String get content => '您真的要刪除整個歷史記錄嗎?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedZhTw extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => '在未取得掃描區域網路權限的狀況下 LocalSend 無法找到其他裝置，請在設定中授予此權限。';
	@override String get gotoSettings => '設定';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputZhTw extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入訊息';
	@override String get multiline => '多行';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesZhTw extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '未選取檔案';
	@override String get content => '請至少選取一個檔案。';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionZhTw extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '沒有權限';
	@override String get content => '您尚未授予必要的權限。請在設定中授予權限。';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformZhTw extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '無法使用';
	@override String get content => '此功能僅適用於：';
}

// Path: dialogs.qr
class _StringsDialogsQrZhTw extends _StringsDialogsQrEn {
	_StringsDialogsQrZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsZhTw extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '快速動作';
	@override String get counter => '計數器';
	@override String get prefix => '前置詞';
	@override String get padZero => '字元零填補';
	@override String get sortBeforeCount => '事先依字母排序';
	@override String get random => '隨機';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeZhTw extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => '自動接受所有檔案要求。請注意，區域網路中的所有人都可以傳送檔案給您。';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpZhTw extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '傳送模式';
	@override String get single => '傳送檔案至單個接收者，選取項目將在檔案傳輸完成後被清除。';
	@override String get multiple => '傳送檔案至多重接收者，選取項目將不會被清除。';
	@override String get link => '未安裝 LocalSend 的接收者可以透過在瀏覽器開啟連結以下載選取的檔案.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsZhTw extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get dark => '深色';
	@override String get light => '淺色';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsZhTw extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsZhTw extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleZhTw extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => '整體進度 (${time})';
	@override String get finishedError => '已完成，但發生錯誤';
	@override String get canceledSender => '傳送者已取消';
	@override String get canceledReceiver => '接收者已取消';
}
