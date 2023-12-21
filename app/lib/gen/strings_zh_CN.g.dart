part of 'strings.g.dart';

// Path: <root>
class _StringsZhCn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhCn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsZhCn _root = this; // ignore: unused_field

	// Translations
	@override String get locale => '简体中文';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralZhCn general = _StringsGeneralZhCn._(_root);
	@override late final _StringsReceiveTabZhCn receiveTab = _StringsReceiveTabZhCn._(_root);
	@override late final _StringsSendTabZhCn sendTab = _StringsSendTabZhCn._(_root);
	@override late final _StringsSettingsTabZhCn settingsTab = _StringsSettingsTabZhCn._(_root);
	@override late final _StringsTroubleshootPageZhCn troubleshootPage = _StringsTroubleshootPageZhCn._(_root);
	@override late final _StringsReceiveHistoryPageZhCn receiveHistoryPage = _StringsReceiveHistoryPageZhCn._(_root);
	@override late final _StringsApkPickerPageZhCn apkPickerPage = _StringsApkPickerPageZhCn._(_root);
	@override late final _StringsSelectedFilesPageZhCn selectedFilesPage = _StringsSelectedFilesPageZhCn._(_root);
	@override late final _StringsReceivePageZhCn receivePage = _StringsReceivePageZhCn._(_root);
	@override late final _StringsReceiveOptionsPageZhCn receiveOptionsPage = _StringsReceiveOptionsPageZhCn._(_root);
	@override late final _StringsSendPageZhCn sendPage = _StringsSendPageZhCn._(_root);
	@override late final _StringsProgressPageZhCn progressPage = _StringsProgressPageZhCn._(_root);
	@override late final _StringsWebSharePageZhCn webSharePage = _StringsWebSharePageZhCn._(_root);
	@override late final _StringsAboutPageZhCn aboutPage = _StringsAboutPageZhCn._(_root);
	@override late final _StringsDonationPageZhCn donationPage = _StringsDonationPageZhCn._(_root);
	@override late final _StringsChangelogPageZhCn changelogPage = _StringsChangelogPageZhCn._(_root);
	@override late final _StringsAliasGeneratorZhCn aliasGenerator = _StringsAliasGeneratorZhCn._(_root);
	@override late final _StringsDialogsZhCn dialogs = _StringsDialogsZhCn._(_root);
	@override late final _StringsTrayZhCn tray = _StringsTrayZhCn._(_root);
	@override late final _StringsWebZhCn web = _StringsWebZhCn._(_root);
	@override late final _StringsAssetPickerZhCn assetPicker = _StringsAssetPickerZhCn._(_root);
}

// Path: general
class _StringsGeneralZhCn extends _StringsGeneralEn {
	_StringsGeneralZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get accept => '接受';
	@override String get accepted => '已接受';
	@override String get add => '添加';
	@override String get advanced => '高级';
	@override String get cancel => '取消';
	@override String get close => '关闭';
	@override String get confirm => '确认';
	@override String get continueStr => '继续';
	@override String get copy => '复制';
	@override String get copiedToClipboard => '已复制到剪贴板';
	@override String get decline => '拒绝';
	@override String get done => '完成';
	@override String get delete => '删除';
	@override String get edit => '编辑';
	@override String get error => '错误';
	@override String get example => '示例';
	@override String get files => '文件';
	@override String get finished => '已完成';
	@override String get hide => '隐藏';
	@override String get off => '关';
	@override String get offline => '离线';
	@override String get on => '开';
	@override String get online => '在线';
	@override String get open => '打开';
	@override String get queue => '队列';
	@override String get quickSave => '快速保存';
	@override String get renamed => '已重命名';
	@override String get reset => '重置';
	@override String get restart => '重启';
	@override String get settings => '设置';
	@override String get skipped => '已跳过';
	@override String get start => '开始';
	@override String get stop => '停止';
	@override String get save => '保存';
	@override String get unchanged => '未更改';
	@override String get unknown => '未知';
	@override String get noItemInClipboard => '剪贴板中没有项目';
}

// Path: receiveTab
class _StringsReceiveTabZhCn extends _StringsReceiveTabEn {
	_StringsReceiveTabZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override late final _StringsReceiveTabInfoBoxZhCn infoBox = _StringsReceiveTabInfoBoxZhCn._(_root);
}

// Path: sendTab
class _StringsSendTabZhCn extends _StringsSendTabEn {
	_StringsSendTabZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '发送';
	@override late final _StringsSendTabSelectionZhCn selection = _StringsSendTabSelectionZhCn._(_root);
	@override late final _StringsSendTabPickerZhCn picker = _StringsSendTabPickerZhCn._(_root);
	@override String get shareIntentInfo => '你也可以使用你的移动设备中的“分享”功能来更简单的选择文件。';
	@override String get nearbyDevices => '附近的设备';
	@override String get thisDevice => '这台设备';
	@override String get scan => '扫描设备';
	@override String get sendMode => '发送模式';
	@override late final _StringsSendTabSendModesZhCn sendModes = _StringsSendTabSendModesZhCn._(_root);
	@override String get sendModeHelp => '解释';
	@override String get help => '请确保目标连接的是同一个 Wi‑Fi 网络。';
	@override String get placeItems => '列出要分享的文件。';
}

// Path: settingsTab
class _StringsSettingsTabZhCn extends _StringsSettingsTabEn {
	_StringsSettingsTabZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '设置';
	@override late final _StringsSettingsTabGeneralZhCn general = _StringsSettingsTabGeneralZhCn._(_root);
	@override late final _StringsSettingsTabReceiveZhCn receive = _StringsSettingsTabReceiveZhCn._(_root);
	@override late final _StringsSettingsTabNetworkZhCn network = _StringsSettingsTabNetworkZhCn._(_root);
	@override late final _StringsSettingsTabOtherZhCn other = _StringsSettingsTabOtherZhCn._(_root);
	@override String get advancedSettings => '高级设置';
}

// Path: troubleshootPage
class _StringsTroubleshootPageZhCn extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '故障排除';
	@override String get subTitle => '应用没有按预期工作？您可以在这里找到常用解决方案。';
	@override String get solution => '解决方案：';
	@override String get fixButton => '自动修复';
	@override late final _StringsTroubleshootPageFirewallZhCn firewall = _StringsTroubleshootPageFirewallZhCn._(_root);
	@override late final _StringsTroubleshootPageNoConnectionZhCn noConnection = _StringsTroubleshootPageNoConnectionZhCn._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageZhCn extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '历史';
	@override String get openFolder => '打开目录';
	@override String get deleteHistory => '删除历史';
	@override String get empty => '无历史记录。';
	@override late final _StringsReceiveHistoryPageEntryActionsZhCn entryActions = _StringsReceiveHistoryPageEntryActionsZhCn._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageZhCn extends _StringsApkPickerPageEn {
	_StringsApkPickerPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '应用（APK）';
	@override String get excludeSystemApps => '排除系统应用';
	@override String get excludeAppsWithoutLaunchIntent => '排除无法启动的应用';
	@override String apps({required Object n}) => '${n} 个应用';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageZhCn extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => '全部删除';
}

// Path: receivePage
class _StringsReceivePageZhCn extends _StringsReceivePageEn {
	_StringsReceivePageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '想要发送给你一个文件。',
		other: '想要发送给你 ${n} 个文件。',
	);
	@override String get subTitleMessage => '发送给你了一条消息：';
	@override String get subTitleLink => '发送给你了一个链接：';
	@override String get canceled => '发送者取消了请求。';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageZhCn extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '设置';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend 文件夹)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => '由于存在目录，已自动关闭。';
}

// Path: sendPage
class _StringsSendPageZhCn extends _StringsSendPageEn {
	_StringsSendPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get waiting => '等待响应中...';
	@override String get rejected => '对方拒绝了请求。';
	@override String get busy => '对方正在处理另一个请求。';
}

// Path: progressPage
class _StringsProgressPageZhCn extends _StringsProgressPageEn {
	_StringsProgressPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get titleSending => '正在发送文件';
	@override String get titleReceiving => '正在接收文件';
	@override String get savedToGallery => '已保存到相册';
	@override late final _StringsProgressPageTotalZhCn total = _StringsProgressPageTotalZhCn._(_root);
}

// Path: webSharePage
class _StringsWebSharePageZhCn extends _StringsWebSharePageEn {
	_StringsWebSharePageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '分享为链接';
	@override String get loading => '正在启动服务器...';
	@override String get stopping => '正在停止服务器...';
	@override String get error => '在启动服务器过程中发生了错误。';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '在浏览器中打开本链接:',
		other: '在浏览器中打开其中的一个链接:',
	);
	@override String get requests => '请求';
	@override String get noRequests => '尚无请求。';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend 使用自签名证书。您需要在浏览器中接受它。';
	@override String pendingRequests({required Object n}) => '待处理请求: ${n}';
}

// Path: aboutPage
class _StringsAboutPageZhCn extends _StringsAboutPageEn {
	_StringsAboutPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '关于 LocalSend';
	@override List<String> get description => [
		'LocalSend 是一款免费的开源应用程序，可让您通过本地网络与附近的设备安全地共享文件和信息，而无需互联网连接。',
		'本程序可在 Android、iOS、macOS、Windows 和 Linux 上使用。您可以在官方主页找到所有下载选项。',
	];
	@override String get author => '作者';
	@override String get contributors => '贡献者';
	@override String get translators => '翻译者';
}

// Path: donationPage
class _StringsDonationPageZhCn extends _StringsDonationPageEn {
	_StringsDonationPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '捐赠';
	@override String get info => 'LocalSend 免费、开源、无广告。如果您喜欢这款应用程序，可以捐款支持开发。';
	@override String donate({required Object amount}) => '捐款 ${amount}';
	@override String get thanks => '非常感谢您的支持！';
	@override String get restore => '恢复购买';
}

// Path: changelogPage
class _StringsChangelogPageZhCn extends _StringsChangelogPageEn {
	_StringsChangelogPageZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '更新日志';
}

// Path: aliasGenerator
class _StringsAliasGeneratorZhCn extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsZhCn extends _StringsDialogsEn {
	_StringsDialogsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileZhCn addFile = _StringsDialogsAddFileZhCn._(_root);
	@override late final _StringsDialogsAddressInputZhCn addressInput = _StringsDialogsAddressInputZhCn._(_root);
	@override late final _StringsDialogsCancelSessionZhCn cancelSession = _StringsDialogsCancelSessionZhCn._(_root);
	@override late final _StringsDialogsCannotOpenFileZhCn cannotOpenFile = _StringsDialogsCannotOpenFileZhCn._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeZhCn encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeZhCn._(_root);
	@override late final _StringsDialogsErrorDialogZhCn errorDialog = _StringsDialogsErrorDialogZhCn._(_root);
	@override late final _StringsDialogsFavoriteDialogZhCn favoriteDialog = _StringsDialogsFavoriteDialogZhCn._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogZhCn favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogZhCn._(_root);
	@override late final _StringsDialogsFavoriteEditDialogZhCn favoriteEditDialog = _StringsDialogsFavoriteEditDialogZhCn._(_root);
	@override late final _StringsDialogsFileInfoZhCn fileInfo = _StringsDialogsFileInfoZhCn._(_root);
	@override late final _StringsDialogsFileNameInputZhCn fileNameInput = _StringsDialogsFileNameInputZhCn._(_root);
	@override late final _StringsDialogsHistoryClearDialogZhCn historyClearDialog = _StringsDialogsHistoryClearDialogZhCn._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedZhCn localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedZhCn._(_root);
	@override late final _StringsDialogsMessageInputZhCn messageInput = _StringsDialogsMessageInputZhCn._(_root);
	@override late final _StringsDialogsNoFilesZhCn noFiles = _StringsDialogsNoFilesZhCn._(_root);
	@override late final _StringsDialogsNoPermissionZhCn noPermission = _StringsDialogsNoPermissionZhCn._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformZhCn notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformZhCn._(_root);
	@override late final _StringsDialogsQrZhCn qr = _StringsDialogsQrZhCn._(_root);
	@override late final _StringsDialogsQuickActionsZhCn quickActions = _StringsDialogsQuickActionsZhCn._(_root);
	@override late final _StringsDialogsQuickSaveNoticeZhCn quickSaveNotice = _StringsDialogsQuickSaveNoticeZhCn._(_root);
	@override late final _StringsDialogsSendModeHelpZhCn sendModeHelp = _StringsDialogsSendModeHelpZhCn._(_root);
}

// Path: tray
class _StringsTrayZhCn extends _StringsTrayEn {
	_StringsTrayZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => '退出 LocalSend';
}

// Path: web
class _StringsWebZhCn extends _StringsWebEn {
	_StringsWebZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => '已拒绝';
	@override String get files => '文件';
	@override String get fileName => '文件名';
	@override String get size => '大小';
}

// Path: assetPicker
class _StringsAssetPickerZhCn extends _StringsAssetPickerEn {
	_StringsAssetPickerZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get confirm => '确认';
	@override String get cancel => '取消';
	@override String get edit => '编辑';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => '加载失败';
	@override String get original => '源文件';
	@override String get preview => '预览';
	@override String get select => '选择';
	@override String get emptyList => '清空列表';
	@override String get unSupportedAssetType => '不支持的文件格式。';
	@override String get unableToAccessAll => '无法访问设备上的所有文件';
	@override String get viewingLimitedAssetsTip => '应用程序仅能查看可访问的文件和相册。';
	@override String get changeAccessibleLimitedAssets => '单击以更新可访问文件';
	@override String get accessAllTip => '应用程序只能访问设备上的部分文件。转到系统设置并允许该应用访问设备上的所有媒体文件。';
	@override String get goToSystemSettings => '转到系统设置';
	@override String get accessLimitedAssets => '继续受限访问';
	@override String get accessiblePathName => '可访问的文件';
	@override String get sTypeAudioLabel => '音频';
	@override String get sTypeImageLabel => '图片';
	@override String get sTypeVideoLabel => '视频';
	@override String get sTypeOtherLabel => '其他媒体文件';
	@override String get sActionPlayHint => '播放';
	@override String get sActionPreviewHint => '预览';
	@override String get sActionSelectHint => '选择';
	@override String get sActionSwitchPathLabel => '更改路径';
	@override String get sActionUseCameraHint => '使用摄像头';
	@override String get sNameDurationLabel => '时长';
	@override String get sUnitAssetCountLabel => '计数';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxZhCn extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => '端口：';
	@override String get alias => '别名：';
}

// Path: sendTab.selection
class _StringsSendTabSelectionZhCn extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '选择';
	@override String files({required Object files}) => '文件：${files}';
	@override String size({required Object size}) => '大小：${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerZhCn extends _StringsSendTabPickerEn {
	_StringsSendTabPickerZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get file => '文件';
	@override String get folder => '文件夹';
	@override String get media => '媒体';
	@override String get text => '文本';
	@override String get app => '应用';
	@override String get clipboard => '剪贴板';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesZhCn extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get single => '单个接收者';
	@override String get multiple => '多个接收者';
	@override String get link => '通过链接分享';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralZhCn extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '通用';
	@override String get brightness => '亮度';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsZhCn brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsZhCn._(_root);
	@override String get color => '颜色';
	@override late final _StringsSettingsTabGeneralColorOptionsZhCn colorOptions = _StringsSettingsTabGeneralColorOptionsZhCn._(_root);
	@override String get language => '语言';
	@override late final _StringsSettingsTabGeneralLanguageOptionsZhCn languageOptions = _StringsSettingsTabGeneralLanguageOptionsZhCn._(_root);
	@override String get saveWindowPlacement => '关闭时：保存窗口位置';
	@override String get minimizeToTray => '关闭时：最小化到系统托盘';
	@override String get launchAtStartup => '登录系统后自动启动程序';
	@override String get launchMinimized => '静默自启：只启动托盘服务';
	@override String get animations => '动画效果';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveZhCn extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '接收';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => '自动完成';
	@override String get destination => '保存目录';
	@override String get downloads => '(下载)';
	@override String get saveToGallery => '保存到相册';
	@override String get saveToHistory => '保存到历史记录';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkZhCn extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '网络';
	@override String get needRestart => '重启服务器生效！';
	@override String get server => '服务器';
	@override String get alias => '别名';
	@override String get deviceType => '设备类型';
	@override String get deviceModel => '设备型号';
	@override String get port => '端口';
	@override String portWarning({required Object defaultPort}) => '由于正在使用自定义端口，你可能不会被其他设备检测到。（默认端口：${defaultPort}）';
	@override String get encryption => '加密';
	@override String get multicastGroup => '多播';
	@override String multicastGroupWarning({required Object defaultMulticast}) => '由于正在使用自定义多播地址，你可能不会被其他设备检测到。（默认地址：${defaultMulticast}）';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherZhCn extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '其他';
	@override String get support => '支持 LocalSend';
	@override String get donate => '捐赠';
	@override String get privacyPolicy => '隐私政策';
	@override String get termsOfUse => '使用条款';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallZhCn extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get symptom => '此设备可以发送文件至其他设备，但其它设备无法发送文件到此设备。';
	@override String solution({required Object port}) => '这最可能是由防火墙引起的。你可以通过在端口 ${port} 上允许（UDP 和 TCP）的传入请求来解决这个问题。';
	@override String get openFirewall => '打开防火墙';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionZhCn extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get symptom => '双方设备均无法发现对方或者分享文件。';
	@override String get solution => '当问题发生在双方设备上时，请先确认双方设备处于同一 Wi‑Fi 网络内，且有相同的网络（端口、多播地址、加密选项）配置。若因 Wi‑Fi 不允许参与者间通信，那么请在路由器中关闭这个（如：AP 隔离）选项。';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsZhCn extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get open => '打开文件';
	@override String get info => '信息';
	@override String get deleteFromHistory => '从历史记录中删除';
}

// Path: progressPage.total
class _StringsProgressPageTotalZhCn extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleZhCn title = _StringsProgressPageTotalTitleZhCn._(_root);
	@override String count({required Object curr, required Object n}) => '文件：${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => '大小：${curr} / ${n}';
	@override String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileZhCn extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '加入文件';
	@override String get content => '你想加入什么文件？';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputZhCn extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '输入地址';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP 地址';
	@override String get recentlyUsed => '最近使用：';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionZhCn extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '取消文件传输';
	@override String get content => '要取消文件传输吗？';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileZhCn extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '无法打开文件';
	@override String content({required Object file}) => '无法打开 "${file}"。这个文件是否已被移动、重命名或删除？';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeZhCn extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '加密已关闭';
	@override String get content => '正在通过未加密的 HTTP 协议连接。要使用 HTTPS 协议，请开启加密选项。';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogZhCn extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogZhCn extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '收藏夹';
	@override String get noFavorites => '尚未配置收藏夹。';
	@override String get addFavorite => '新建';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogZhCn extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '删除收藏夹';
	@override String content({required Object name}) => '确定要删除收藏夹 "${name}" 吗?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogZhCn extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => '添加收藏夹';
	@override String get titleEdit => '编辑收藏夹';
	@override String get name => '名称';
	@override String get auto => '(auto)';
	@override String get ip => 'IP 地址';
	@override String get port => '端口';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoZhCn extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '文件信息';
	@override String get fileName => '文件名：';
	@override String get path => '路径：';
	@override String get size => '大小：';
	@override String get sender => '发送者：';
	@override String get time => '时间：';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputZhCn extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '输入文件名';
	@override String original({required Object original}) => '原名：${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogZhCn extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '清空历史记录';
	@override String get content => '您确定要清空全部历史记录吗？';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedZhCn extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend 在没有扫描本地网络的权限的情况下无法找到其他设备。请在设置中授予此权限。';
	@override String get gotoSettings => '设置';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputZhCn extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '输入消息';
	@override String get multiline => '多行';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesZhCn extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '未选择文件';
	@override String get content => '请至少选择一个文件。';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionZhCn extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '没有权限';
	@override String get content => '您尚未授予必要的权限。请在设置中授予权限。';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformZhCn extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '不可用';
	@override String get content => '此功能只在以下平台可用：';
}

// Path: dialogs.qr
class _StringsDialogsQrZhCn extends _StringsDialogsQrEn {
	_StringsDialogsQrZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '二维码';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsZhCn extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '快速操作';
	@override String get counter => '计数器';
	@override String get prefix => '前缀';
	@override String get padZero => '以零填充';
	@override String get sortBeforeCount => '事先以字母顺序排序';
	@override String get random => '随机';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeZhCn extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => '自动接受所有文件传输请求。请注意，这会让此网络中的所有人都可以向你发送文件。';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpZhCn extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '发送模式';
	@override String get single => '发送文件给一个接收者。已选择的文件在发送后会取消选择。';
	@override String get multiple => '发送文件给多个接收者。已选择的文件在发送后不会取消选择。';
	@override String get link => '未安装 LocalSend 的接收者可以在浏览器中打开链接以下载选中的文件。';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsZhCn extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get system => '跟随系统';
	@override String get dark => '暗色';
	@override String get light => '亮色';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsZhCn extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get system => '跟随系统';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsZhCn extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get system => '跟随系统';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleZhCn extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleZhCn._(_StringsZhCn root) : this._root = root, super._(root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => '总进度 (${time})';
	@override String get finishedError => '已完成，但发生错误';
	@override String get canceledSender => '发送者已取消';
	@override String get canceledReceiver => '接收者已取消';
}
