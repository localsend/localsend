part of 'strings.g.dart';

// Path: <root>
class _StringsZhHk extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhHk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-HK>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsZhHk _root = this; // ignore: unused_field

	// Translations
	@override String get locale => '繁體中文 – 香港';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralZhHk general = _StringsGeneralZhHk._(_root);
	@override late final _StringsReceiveTabZhHk receiveTab = _StringsReceiveTabZhHk._(_root);
	@override late final _StringsSendTabZhHk sendTab = _StringsSendTabZhHk._(_root);
	@override late final _StringsSettingsTabZhHk settingsTab = _StringsSettingsTabZhHk._(_root);
	@override late final _StringsTroubleshootPageZhHk troubleshootPage = _StringsTroubleshootPageZhHk._(_root);
	@override late final _StringsReceiveHistoryPageZhHk receiveHistoryPage = _StringsReceiveHistoryPageZhHk._(_root);
	@override late final _StringsApkPickerPageZhHk apkPickerPage = _StringsApkPickerPageZhHk._(_root);
	@override late final _StringsSelectedFilesPageZhHk selectedFilesPage = _StringsSelectedFilesPageZhHk._(_root);
	@override late final _StringsReceivePageZhHk receivePage = _StringsReceivePageZhHk._(_root);
	@override late final _StringsReceiveOptionsPageZhHk receiveOptionsPage = _StringsReceiveOptionsPageZhHk._(_root);
	@override late final _StringsSendPageZhHk sendPage = _StringsSendPageZhHk._(_root);
	@override late final _StringsProgressPageZhHk progressPage = _StringsProgressPageZhHk._(_root);
	@override late final _StringsWebSharePageZhHk webSharePage = _StringsWebSharePageZhHk._(_root);
	@override late final _StringsAboutPageZhHk aboutPage = _StringsAboutPageZhHk._(_root);
	@override late final _StringsDonationPageZhHk donationPage = _StringsDonationPageZhHk._(_root);
	@override late final _StringsChangelogPageZhHk changelogPage = _StringsChangelogPageZhHk._(_root);
	@override late final _StringsAliasGeneratorZhHk aliasGenerator = _StringsAliasGeneratorZhHk._(_root);
	@override late final _StringsDialogsZhHk dialogs = _StringsDialogsZhHk._(_root);
	@override late final _StringsTrayZhHk tray = _StringsTrayZhHk._(_root);
	@override late final _StringsWebZhHk web = _StringsWebZhHk._(_root);
	@override late final _StringsAssetPickerZhHk assetPicker = _StringsAssetPickerZhHk._(_root);
}

// Path: general
class _StringsGeneralZhHk extends _StringsGeneralEn {
	_StringsGeneralZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get accept => '接受';
	@override String get accepted => '已接受';
	@override String get add => '新增';
	@override String get advanced => '更多資訊';
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
	@override String get finished => '搞掂';
	@override String get hide => '隱藏';
	@override String get off => '閂';
	@override String get offline => '離線';
	@override String get on => '開';
	@override String get online => '線上';
	@override String get open => '開啟';
	@override String get queue => '佇列';
	@override String get quickSave => '快速儲存';
	@override String get renamed => '改咗名';
	@override String get reset => '重設';
	@override String get restart => '重新啟動';
	@override String get settings => '設定';
	@override String get skipped => '已跳過';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get save => '儲存';
	@override String get unchanged => '冇改過';
	@override String get unknown => '未知';
	@override String get noItemInClipboard => '剪貼簿冇嘢';
}

// Path: receiveTab
class _StringsReceiveTabZhHk extends _StringsReceiveTabEn {
	_StringsReceiveTabZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override late final _StringsReceiveTabInfoBoxZhHk infoBox = _StringsReceiveTabInfoBoxZhHk._(_root);
}

// Path: sendTab
class _StringsSendTabZhHk extends _StringsSendTabEn {
	_StringsSendTabZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '傳送';
	@override late final _StringsSendTabSelectionZhHk selection = _StringsSendTabSelectionZhHk._(_root);
	@override late final _StringsSendTabPickerZhHk picker = _StringsSendTabPickerZhHk._(_root);
	@override String get shareIntentInfo => '用你裝置嘅「分享」功能以更方便揀選檔案。';
	@override String get nearbyDevices => '附近裝置';
	@override String get thisDevice => '此裝置';
	@override String get scan => '掃描裝置';
	@override String get sendMode => '傳送模式';
	@override late final _StringsSendTabSendModesZhHk sendModes = _StringsSendTabSendModesZhHk._(_root);
	@override String get sendModeHelp => '説明';
	@override String get help => '請確保目標裝置駁緊同一個 Wi‑Fi 網路。';
	@override String get placeItems => '將要分享嘅檔案拉過嚟呢度';
}

// Path: settingsTab
class _StringsSettingsTabZhHk extends _StringsSettingsTabEn {
	_StringsSettingsTabZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.settings}';
	@override late final _StringsSettingsTabGeneralZhHk general = _StringsSettingsTabGeneralZhHk._(_root);
	@override late final _StringsSettingsTabReceiveZhHk receive = _StringsSettingsTabReceiveZhHk._(_root);
	@override late final _StringsSettingsTabNetworkZhHk network = _StringsSettingsTabNetworkZhHk._(_root);
	@override late final _StringsSettingsTabOtherZhHk other = _StringsSettingsTabOtherZhHk._(_root);
	@override String get advancedSettings => '進階設定';
}

// Path: troubleshootPage
class _StringsTroubleshootPageZhHk extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '疑難排解';
	@override String get subTitle => '個 app 唔 work？你可以喺度揾到一啲常見問題嘅解決辦法。';
	@override String get solution => '解決辦法：';
	@override String get fixButton => '自動修復';
	@override late final _StringsTroubleshootPageFirewallZhHk firewall = _StringsTroubleshootPageFirewallZhHk._(_root);
	@override late final _StringsTroubleshootPageNoConnectionZhHk noConnection = _StringsTroubleshootPageNoConnectionZhHk._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageZhHk extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '歷史記錄';
	@override String get openFolder => '開啟資料夾';
	@override String get deleteHistory => '清除記錄';
	@override String get empty => '得個吉噃 :(';
	@override late final _StringsReceiveHistoryPageEntryActionsZhHk entryActions = _StringsReceiveHistoryPageEntryActionsZhHk._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageZhHk extends _StringsApkPickerPageEn {
	_StringsApkPickerPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '應用程式（APK）';
	@override String get excludeSystemApps => '排除系統應用程式';
	@override String get excludeAppsWithoutLaunchIntent => '排除唔開得嘅應用程式';
	@override String apps({required Object n}) => '${n} 個應用程式';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageZhHk extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => '全部刪除';
}

// Path: receivePage
class _StringsReceivePageZhHk extends _StringsReceivePageEn {
	_StringsReceivePageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '想 send 1 個檔案畀你。',
		other: '想 send ${n} 個檔案畀你。',
	);
	@override String get subTitleMessage => 'send 咗條訊息畀你：';
	@override String get subTitleLink => 'send 咗條 link 畀你：';
	@override String get canceled => '對方取消咗個請求。';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageZhHk extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.settings}';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '（LocalSend 資料夾）';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => '因為有資料夾存在而自動閂咗';
}

// Path: sendPage
class _StringsSendPageZhHk extends _StringsSendPageEn {
	_StringsSendPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get waiting => '等緊回應……';
	@override String get rejected => '對方拒絕咗個請求。';
	@override String get busy => '對方忙緊另一個請求。';
}

// Path: progressPage
class _StringsProgressPageZhHk extends _StringsProgressPageEn {
	_StringsProgressPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Send 緊……';
	@override String get titleReceiving => '接收緊……';
	@override String get savedToGallery => '成功 save 咗落相簿';
	@override late final _StringsProgressPageTotalZhHk total = _StringsProgressPageTotalZhHk._(_root);
}

// Path: webSharePage
class _StringsWebSharePageZhHk extends _StringsWebSharePageEn {
	_StringsWebSharePageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.sendTab.sendModes.link}';
	@override String get loading => '開緊個 server……';
	@override String get stopping => '閂緊個 server……';
	@override String get error => '開 server 嗰陣發生錯誤。';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '喺瀏覽器開啟以下連結：',
		other: '喺瀏覽器開啟以下任何一個連結：',
	);
	@override String get requests => '請求';
	@override String get noRequests => '未有';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend 用嘅係自我簽署憑證。麻煩你喺瀏覽器度允許咗佢。';
	@override String pendingRequests({required Object n}) => '仲有 ${n} 個請求未處理';
}

// Path: aboutPage
class _StringsAboutPageZhHk extends _StringsAboutPageEn {
	_StringsAboutPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '關於 LocalSend';
	@override List<String> get description => [
		'LocalSend 係一款免費嘅開源應用程式，佢可以透過區域網路幫你安全噉將檔案同訊息分享畀附近嘅裝置，全程無需互聯網連線。',
		'呢個 app 喺 Android、iOS、macOS、Windows 同 Linux 都用得㗎。你可以喺我哋嘅網站揾到呢個 app 所有平台嘅版本同其他下載方式。',
	];
	@override String get author => '作者';
	@override String get contributors => '貢獻者';
	@override String get translators => '翻譯人員';
}

// Path: donationPage
class _StringsDonationPageZhHk extends _StringsDonationPageEn {
	_StringsDonationPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.settingsTab.other.donate}';
	@override String get info => 'LocalSend 唔單只免費、開源，仲係冇廣告添㗎！如果你鍾意呢個 app，不妨捐款贊助我哋開發？';
	@override String donate({required Object amount}) => '捐 ${amount}';
	@override String get thanks => '多謝支持！';
	@override String get restore => '還原 app 內購買';
}

// Path: changelogPage
class _StringsChangelogPageZhHk extends _StringsChangelogPageEn {
	_StringsChangelogPageZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '更新記錄';
}

// Path: aliasGenerator
class _StringsAliasGeneratorZhHk extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsZhHk extends _StringsDialogsEn {
	_StringsDialogsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileZhHk addFile = _StringsDialogsAddFileZhHk._(_root);
	@override late final _StringsDialogsAddressInputZhHk addressInput = _StringsDialogsAddressInputZhHk._(_root);
	@override late final _StringsDialogsCancelSessionZhHk cancelSession = _StringsDialogsCancelSessionZhHk._(_root);
	@override late final _StringsDialogsCannotOpenFileZhHk cannotOpenFile = _StringsDialogsCannotOpenFileZhHk._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeZhHk encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeZhHk._(_root);
	@override late final _StringsDialogsErrorDialogZhHk errorDialog = _StringsDialogsErrorDialogZhHk._(_root);
	@override late final _StringsDialogsFavoriteDialogZhHk favoriteDialog = _StringsDialogsFavoriteDialogZhHk._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogZhHk favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogZhHk._(_root);
	@override late final _StringsDialogsFavoriteEditDialogZhHk favoriteEditDialog = _StringsDialogsFavoriteEditDialogZhHk._(_root);
	@override late final _StringsDialogsFileInfoZhHk fileInfo = _StringsDialogsFileInfoZhHk._(_root);
	@override late final _StringsDialogsFileNameInputZhHk fileNameInput = _StringsDialogsFileNameInputZhHk._(_root);
	@override late final _StringsDialogsHistoryClearDialogZhHk historyClearDialog = _StringsDialogsHistoryClearDialogZhHk._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedZhHk localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedZhHk._(_root);
	@override late final _StringsDialogsMessageInputZhHk messageInput = _StringsDialogsMessageInputZhHk._(_root);
	@override late final _StringsDialogsNoFilesZhHk noFiles = _StringsDialogsNoFilesZhHk._(_root);
	@override late final _StringsDialogsNoPermissionZhHk noPermission = _StringsDialogsNoPermissionZhHk._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformZhHk notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformZhHk._(_root);
	@override late final _StringsDialogsQrZhHk qr = _StringsDialogsQrZhHk._(_root);
	@override late final _StringsDialogsQuickActionsZhHk quickActions = _StringsDialogsQuickActionsZhHk._(_root);
	@override late final _StringsDialogsQuickSaveNoticeZhHk quickSaveNotice = _StringsDialogsQuickSaveNoticeZhHk._(_root);
	@override late final _StringsDialogsSendModeHelpZhHk sendModeHelp = _StringsDialogsSendModeHelpZhHk._(_root);
}

// Path: tray
class _StringsTrayZhHk extends _StringsTrayEn {
	_StringsTrayZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => '退出 LocalSend';
}

// Path: web
class _StringsWebZhHk extends _StringsWebEn {
	_StringsWebZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => '已遭對方拒絕';
	@override String get files => '${_root.general.files}';
	@override String get fileName => '檔案名稱';
	@override String get size => '大細';
}

// Path: assetPicker
class _StringsAssetPickerZhHk extends _StringsAssetPickerEn {
	_StringsAssetPickerZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get confirm => '${_root.general.confirm}';
	@override String get cancel => '${_root.general.cancel}';
	@override String get edit => '${_root.general.edit}';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => '載入失敗';
	@override String get original => '原始檔案';
	@override String get preview => '預覽';
	@override String get select => '揀選';
	@override String get emptyList => '列表冇嘢';
	@override String get unSupportedAssetType => '檔案類型唔支援。';
	@override String get unableToAccessAll => '無法存取裝置入面所有檔案';
	@override String get viewingLimitedAssetsTip => '你淨係可以睇到個 app 能夠存取嘅檔案同相簿。';
	@override String get changeAccessibleLimitedAssets => '撳呢度更新可存取檔案';
	@override String get accessAllTip => '個 app 只能夠存取裝置入面部分檔案。要存取所有媒體，你要去系統設定開返個權限。';
	@override String get goToSystemSettings => '開啟系統設定';
	@override String get accessLimitedAssets => '喺限制存取嘅情況下繼續';
	@override String get accessiblePathName => '可存取檔案';
	@override String get sTypeAudioLabel => '音樂';
	@override String get sTypeImageLabel => '相片';
	@override String get sTypeVideoLabel => '影片';
	@override String get sTypeOtherLabel => '其他媒體';
	@override String get sActionPlayHint => '播放';
	@override String get sActionPreviewHint => '${_root.assetPicker.preview}';
	@override String get sActionSelectHint => '${_root.assetPicker.select}';
	@override String get sActionSwitchPathLabel => '更改路徑';
	@override String get sActionUseCameraHint => '影相';
	@override String get sNameDurationLabel => '持續時間';
	@override String get sUnitAssetCountLabel => '數量';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxZhHk extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP：';
	@override String get port => 'Port：';
	@override String get alias => '名：';
}

// Path: sendTab.selection
class _StringsSendTabSelectionZhHk extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '揀選';
	@override String files({required Object files}) => '檔案：${files}';
	@override String size({required Object size}) => '大細：${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerZhHk extends _StringsSendTabPickerEn {
	_StringsSendTabPickerZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get file => '檔案';
	@override String get folder => '資料夾';
	@override String get media => '媒體';
	@override String get text => '文字';
	@override String get app => '應用程式';
	@override String get clipboard => '貼上';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesZhHk extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get single => '單一接收者';
	@override String get multiple => '多個接收者';
	@override String get link => '用 link 分享';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralZhHk extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '一般';
	@override String get brightness => '亮度';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsZhHk brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsZhHk._(_root);
	@override String get color => '顏色';
	@override late final _StringsSettingsTabGeneralColorOptionsZhHk colorOptions = _StringsSettingsTabGeneralColorOptionsZhHk._(_root);
	@override String get language => '語言';
	@override late final _StringsSettingsTabGeneralLanguageOptionsZhHk languageOptions = _StringsSettingsTabGeneralLanguageOptionsZhHk._(_root);
	@override String get saveWindowPlacement => '退出嗰陣記低視窗位置';
	@override String get minimizeToTray => '退出嗰陣縮細做通知圖示';
	@override String get launchAtStartup => '開機自動啟動';
	@override String get launchMinimized => '自動啟動成通知圖示';
	@override String get animations => '動畫';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveZhHk extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => '完成後自動關閉傳輸畫面';
	@override String get destination => '儲存位置';
	@override String get downloads => '（下載資料夾）';
	@override String get saveToGallery => 'Save 落相簿';
	@override String get saveToHistory => 'Save 去歷史紀錄';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkZhHk extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '網路';
	@override String get needRestart => '熄咗個 server 再開過，設定先會生效';
	@override String get server => 'Server';
	@override String get alias => '名';
	@override String get deviceType => '裝置類型';
	@override String get deviceModel => '裝置型號';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => '改 port 嘅話其他裝置有機會偵測唔到你。（預設：${defaultPort}）';
	@override String get encryption => '加密傳送';
	@override String get multicastGroup => '多播 IP 地址';
	@override String multicastGroupWarning({required Object defaultMulticast}) => '用自訂多播地址嘅話其他裝置有機會偵測唔到你。（預設：${defaultMulticast}）';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherZhHk extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '其他';
	@override String get support => '支援 LocalSend';
	@override String get donate => '捐款';
	@override String get privacyPolicy => '私隱權政策';
	@override String get termsOfUse => '服務條款';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallZhHk extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get symptom => '我 send 到嘢但係接收唔到。';
	@override String solution({required Object port}) => '應該係防火牆嘅問題，可以透過允許接受 port ${port} 嘅連線（UDP 同 TCP）嚟解決。';
	@override String get openFirewall => '開啟防火牆設定';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionZhHk extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get symptom => '兩部裝置都偵測唔到同 send 唔到嘢畀對方。';
	@override String get solution => '如果兩邊都發生同樣嘅情況，你要 check 清楚兩邊係咪駁緊同一個 Wi‑Fi 網路同用緊同樣嘅設定（port、多播 IP 地址同有冇開加密傳送）。亦可能係個 Wi‑Fi 唔畀裝置之間通訊，呢種情況下就要 router 嗰邊先開到。';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsZhHk extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get open => '開啟檔案';
	@override String get info => '資訊';
	@override String get deleteFromHistory => '刪走呢筆記錄';
}

// Path: progressPage.total
class _StringsProgressPageTotalZhHk extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleZhHk title = _StringsProgressPageTotalTitleZhHk._(_root);
	@override String count({required Object curr, required Object n}) => '檔案：${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => '大細：${curr} / ${n}';
	@override String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileZhHk extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '將檔案加至選擇';
	@override String get content => '揀選要加入嘅檔案';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputZhHk extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入地址';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP 地址';
	@override String get recentlyUsed => '輸入記錄：';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionZhHk extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '取消檔案傳輸';
	@override String get content => '你係咪要放棄傳輸檔案？';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileZhHk extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '無法開啟檔案';
	@override String content({required Object file}) => '檔案「${file}」開唔到喎，係咪畀人郁過、改過名或者剷走咗？';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeZhHk extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '加密已停用';
	@override String get content => '而家會透過未經加密嘅 HTTP 協定嚟通訊。要用 HTTPS 請開返加密。';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogZhHk extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogZhHk extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '收藏';
	@override String get noFavorites => '未收藏任何裝置';
	@override String get addFavorite => '${_root.general.add}';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogZhHk extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '取消收藏裝置';
	@override String content({required Object name}) => '你係咪要取消收藏裝置「${name}」？';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogZhHk extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => '新增至收藏';
	@override String get titleEdit => '編輯';
	@override String get name => '名';
	@override String get auto => '（自動）';
	@override String get ip => 'IP 地址';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoZhHk extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '檔案資訊';
	@override String get fileName => '檔案名稱：';
	@override String get path => '路徑：';
	@override String get size => '大小：';
	@override String get sender => '傳送者：';
	@override String get time => '時間：';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputZhHk extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入檔案名稱';
	@override String original({required Object original}) => '原名：${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogZhHk extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '清除歷史記錄';
	@override String get content => '你係咪真係要剷走全部歷史記錄？';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedZhHk extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => '喺冇權掃描區域網路嘅情況下 LocalSend 唔會偵測到其他裝置。麻煩你喺系統設定開返呢個權限。';
	@override String get gotoSettings => '開啟系統設定';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputZhHk extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '輸入訊息';
	@override String get multiline => '多行';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesZhHk extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '冇揀選檔案';
	@override String get content => '最少需要揀選一個檔案。';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionZhHk extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '權限閂咗';
	@override String get content => '你冇畀足夠權限我哋進行處理。麻煩你喺系統設定開返啲權限。';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformZhHk extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '無法使用';
	@override String get content => '此功能只適用於：';
}

// Path: dialogs.qr
class _StringsDialogsQrZhHk extends _StringsDialogsQrEn {
	_StringsDialogsQrZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsZhHk extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '快速動作';
	@override String get counter => '計數器';
	@override String get prefix => '前綴';
	@override String get padZero => '補零';
	@override String get sortBeforeCount => '事前跟字母排序';
	@override String get random => '隨機';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeZhHk extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => '自動接受所有檔案傳輸請求。留意返，噉樣會令呢個網路嘅所有人都 send 得嘢畀你。';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpZhHk extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.sendTab.sendMode}';
	@override String get single => '淨係 send 畀一部裝置，傳輸完成後會清除揀選項目。';
	@override String get multiple => '一次過 send 畀多部裝置，揀選項目會一路保留。';
	@override String get link => '冇裝 LocalSend 嘅裝置可以透過條 link 嚟 download 返揀選嘅項目。';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsZhHk extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get system => '跟機';
	@override String get dark => '暗色';
	@override String get light => '亮色';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsZhHk extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get system => '跟機';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsZhHk extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String get system => '跟機';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleZhHk extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleZhHk._(_StringsZhHk root) : this._root = root, super._(root);

	@override final _StringsZhHk _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => '進度：${time}';
	@override String get finishedError => '搞掂，不過有 error';
	@override String get canceledSender => '傳送者取消咗';
	@override String get canceledReceiver => '接收者取消咗';
}
