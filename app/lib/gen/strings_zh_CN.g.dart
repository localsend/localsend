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
class TranslationsZhCn extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.zhCn,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <zh-CN>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsZhCn _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => '简体中文';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralZhCn general = _TranslationsGeneralZhCn._(_root);
  @override
  late final _TranslationsReceiveTabZhCn receiveTab = _TranslationsReceiveTabZhCn._(_root);
  @override
  late final _TranslationsSendTabZhCn sendTab = _TranslationsSendTabZhCn._(_root);
  @override
  late final _TranslationsSettingsTabZhCn settingsTab = _TranslationsSettingsTabZhCn._(_root);
  @override
  late final _TranslationsTroubleshootPageZhCn troubleshootPage = _TranslationsTroubleshootPageZhCn._(_root);
  @override
  late final _TranslationsReceiveHistoryPageZhCn receiveHistoryPage = _TranslationsReceiveHistoryPageZhCn._(_root);
  @override
  late final _TranslationsApkPickerPageZhCn apkPickerPage = _TranslationsApkPickerPageZhCn._(_root);
  @override
  late final _TranslationsSelectedFilesPageZhCn selectedFilesPage = _TranslationsSelectedFilesPageZhCn._(_root);
  @override
  late final _TranslationsReceivePageZhCn receivePage = _TranslationsReceivePageZhCn._(_root);
  @override
  late final _TranslationsReceiveOptionsPageZhCn receiveOptionsPage = _TranslationsReceiveOptionsPageZhCn._(_root);
  @override
  late final _TranslationsSendPageZhCn sendPage = _TranslationsSendPageZhCn._(_root);
  @override
  late final _TranslationsProgressPageZhCn progressPage = _TranslationsProgressPageZhCn._(_root);
  @override
  late final _TranslationsWebSharePageZhCn webSharePage = _TranslationsWebSharePageZhCn._(_root);
  @override
  late final _TranslationsAboutPageZhCn aboutPage = _TranslationsAboutPageZhCn._(_root);
  @override
  late final _TranslationsDonationPageZhCn donationPage = _TranslationsDonationPageZhCn._(_root);
  @override
  late final _TranslationsChangelogPageZhCn changelogPage = _TranslationsChangelogPageZhCn._(_root);
  @override
  late final _TranslationsAliasGeneratorZhCn aliasGenerator = _TranslationsAliasGeneratorZhCn._(_root);
  @override
  late final _TranslationsDialogsZhCn dialogs = _TranslationsDialogsZhCn._(_root);
  @override
  late final _TranslationsSanitizationZhCn sanitization = _TranslationsSanitizationZhCn._(_root);
  @override
  late final _TranslationsTrayZhCn tray = _TranslationsTrayZhCn._(_root);
  @override
  late final _TranslationsWebZhCn web = _TranslationsWebZhCn._(_root);
  @override
  late final _TranslationsAssetPickerZhCn assetPicker = _TranslationsAssetPickerZhCn._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageZhCn networkInterfacesPage = _TranslationsNetworkInterfacesPageZhCn._(_root);
}

// Path: general
class _TranslationsGeneralZhCn extends TranslationsGeneralEn {
  _TranslationsGeneralZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get accept => '接受';
  @override
  String get accepted => '已接受';
  @override
  String get add => '添加';
  @override
  String get advanced => '高级';
  @override
  String get cancel => '取消';
  @override
  String get close => '关闭';
  @override
  String get confirm => '确认';
  @override
  String get continueStr => '继续';
  @override
  String get copy => '复制';
  @override
  String get copiedToClipboard => '已复制到剪贴板';
  @override
  String get decline => '拒绝';
  @override
  String get done => '完成';
  @override
  String get delete => '删除';
  @override
  String get edit => '编辑';
  @override
  String get error => '错误';
  @override
  String get example => '示例';
  @override
  String get files => '文件';
  @override
  String get finished => '已完成';
  @override
  String get hide => '隐藏';
  @override
  String get off => '关';
  @override
  String get offline => '离线';
  @override
  String get on => '开';
  @override
  String get online => '在线';
  @override
  String get open => '打开';
  @override
  String get queue => '队列';
  @override
  String get quickSave => '自动保存';
  @override
  String get quickSaveFromFavorites => '自动保存来自“收藏夹(白名单)”设备的文件';
  @override
  String get renamed => '重命名成功';
  @override
  String get reset => '重置';
  @override
  String get restart => '重启';
  @override
  String get settings => '设置';
  @override
  String get skipped => '已跳过';
  @override
  String get start => '开始';
  @override
  String get stop => '停止';
  @override
  String get save => '保存';
  @override
  String get unchanged => '未更改';
  @override
  String get unknown => '未知';
  @override
  String get noItemInClipboard => '剪贴板为空';
}

// Path: receiveTab
class _TranslationsReceiveTabZhCn extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '接收';
  @override
  late final _TranslationsReceiveTabInfoBoxZhCn infoBox = _TranslationsReceiveTabInfoBoxZhCn._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveZhCn quickSave = _TranslationsReceiveTabQuickSaveZhCn._(_root);
}

// Path: sendTab
class _TranslationsSendTabZhCn extends TranslationsSendTabEn {
  _TranslationsSendTabZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '发送';
  @override
  late final _TranslationsSendTabSelectionZhCn selection = _TranslationsSendTabSelectionZhCn._(_root);
  @override
  late final _TranslationsSendTabPickerZhCn picker = _TranslationsSendTabPickerZhCn._(_root);
  @override
  String get shareIntentInfo => '你也可以通过移动设备中的“分享”功能更简单地发送文件。';
  @override
  String get nearbyDevices => '附近的设备';
  @override
  String get thisDevice => '这台设备';
  @override
  String get scan => '扫描设备';
  @override
  String get manualSending => '手动发送';
  @override
  String get sendMode => '发送模式';
  @override
  late final _TranslationsSendTabSendModesZhCn sendModes = _TranslationsSendTabSendModesZhCn._(_root);
  @override
  String get sendModeHelp => '提示';
  @override
  String get help => '请确保目标连接到同一个 Wi‑Fi 网络。';
  @override
  String get placeItems => '列出要分享的项目。';
}

// Path: settingsTab
class _TranslationsSettingsTabZhCn extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '设置';
  @override
  late final _TranslationsSettingsTabGeneralZhCn general = _TranslationsSettingsTabGeneralZhCn._(_root);
  @override
  late final _TranslationsSettingsTabReceiveZhCn receive = _TranslationsSettingsTabReceiveZhCn._(_root);
  @override
  late final _TranslationsSettingsTabSendZhCn send = _TranslationsSettingsTabSendZhCn._(_root);
  @override
  late final _TranslationsSettingsTabNetworkZhCn network = _TranslationsSettingsTabNetworkZhCn._(_root);
  @override
  late final _TranslationsSettingsTabOtherZhCn other = _TranslationsSettingsTabOtherZhCn._(_root);
  @override
  String get advancedSettings => '高级设置';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageZhCn extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '故障排除';
  @override
  String get subTitle => '应用没有按预期工作？您可以在这里找到常用解决方案。';
  @override
  String get solution => '解决方案：';
  @override
  String get fixButton => '自动修复';
  @override
  late final _TranslationsTroubleshootPageFirewallZhCn firewall = _TranslationsTroubleshootPageFirewallZhCn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryZhCn noDiscovery = _TranslationsTroubleshootPageNoDiscoveryZhCn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionZhCn noConnection = _TranslationsTroubleshootPageNoConnectionZhCn._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageZhCn extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '历史';
  @override
  String get openFolder => '打开目录';
  @override
  String get deleteHistory => '删除历史记录';
  @override
  String get empty => '无历史记录。';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsZhCn entryActions = _TranslationsReceiveHistoryPageEntryActionsZhCn._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageZhCn extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '应用（APK）';
  @override
  String get excludeSystemApps => '排除系统应用';
  @override
  String get excludeAppsWithoutLaunchIntent => '排除无法启动的应用';
  @override
  String apps({required Object n}) => '${n} 个应用';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageZhCn extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => '全部删除';
}

// Path: receivePage
class _TranslationsReceivePageZhCn extends TranslationsReceivePageEn {
  _TranslationsReceivePageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, one: '想要发送给你一个文件', other: '想要发送给你 ${n} 个文件');
  @override
  String get subTitleMessage => '发送给你了一条消息：';
  @override
  String get subTitleLink => '发送给你了一个链接：';
  @override
  String get canceled => '发送者取消了请求。';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageZhCn extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '设置';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend 文件夹)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => '由于分享内容中存在文件夹，已自动关闭。';
}

// Path: sendPage
class _TranslationsSendPageZhCn extends TranslationsSendPageEn {
  _TranslationsSendPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => '等待响应中……';
  @override
  String get rejected => '对方拒绝了请求。';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => '对方正在处理另一个请求。';
}

// Path: progressPage
class _TranslationsProgressPageZhCn extends TranslationsProgressPageEn {
  _TranslationsProgressPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => '正在发送文件';
  @override
  String get titleReceiving => '正在接收文件';
  @override
  String get savedToGallery => '已保存到相册';
  @override
  late final _TranslationsProgressPageTotalZhCn total = _TranslationsProgressPageTotalZhCn._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageZhCn extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '分享为链接';
  @override
  String get loading => '正在启动服务器……';
  @override
  String get stopping => '正在停止服务器……';
  @override
  String get error => '在启动服务器过程中发生了错误。';
  @override
  String openLink({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, one: '在浏览器中打开链接：', other: '在浏览器中打开其中一个链接：');
  @override
  String get requests => '请求';
  @override
  String get noRequests => '尚无请求。';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => '自动接受请求';
  @override
  String get requirePin => '启用 PIN 密码';
  @override
  String pinHint({required Object pin}) => 'PIN 为 “${pin}”';
  @override
  String get encryptionHint => 'LocalSend 使用自签名证书。您需要在浏览器中允许它。';
  @override
  String pendingRequests({required Object n}) => '待处理请求：${n}';
}

// Path: aboutPage
class _TranslationsAboutPageZhCn extends TranslationsAboutPageEn {
  _TranslationsAboutPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '关于 LocalSend';
  @override
  List<String> get description => [
    'LocalSend 是一款免费的开源应用程序，可让您通过本地网络与附近的设备安全地分享文件和信息，而无需互联网连接。',
    '本程序可在 Android、iOS、macOS、Windows 和 Linux 上使用。您可以在官方主页找到所有下载选项。',
  ];
  @override
  String get author => '作者';
  @override
  String get contributors => '贡献者';
  @override
  String get packagers => '打包者';
  @override
  String get translators => '翻译者';
}

// Path: donationPage
class _TranslationsDonationPageZhCn extends TranslationsDonationPageEn {
  _TranslationsDonationPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '捐赠';
  @override
  String get info => 'LocalSend 免费、开源、无广告。如果您喜欢这款应用程序，可以捐款支持开发。';
  @override
  String donate({required Object amount}) => '捐款 ${amount}';
  @override
  String get thanks => '非常感谢您的支持！';
  @override
  String get restore => '恢复购买';
}

// Path: changelogPage
class _TranslationsChangelogPageZhCn extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '更新日志';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorZhCn extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    '迷人',
    '美丽',
    '巨大',
    '明亮',
    '干净',
    '聪明',
    '帅气',
    '可爱',
    '狡猾',
    '坚定',
    '有活力',
    '高效',
    '极好',
    '快速',
    '不错',
    '新鲜',
    '好',
    '华丽',
    '伟大',
    '英俊',
    '炽热',
    '善良',
    '诚实',
    '神秘',
    '整洁',
    '开心',
    '耐心',
    '漂亮',
    '强大',
    '富有',
    '秘密',
    '聪明',
    '稳固',
    '特别',
    '战略性',
    '强大',
    '整洁',
    '智慧',
  ];
  @override
  List<String> get fruits => [
    '苹果',
    '鳄梨',
    '香蕉',
    '黑莓',
    '蓝莓',
    '西兰花',
    '胡萝卜',
    '樱桃',
    '椰子',
    '葡萄',
    '柠檬',
    '莴苣',
    '芒果',
    '甜瓜',
    '蘑菇',
    '洋葱',
    '橙子',
    '木瓜',
    '桃子',
    '梨',
    '菠萝',
    '土豆',
    '南瓜',
    '覆盆子',
    '草莓',
    '番茄',
  ];
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective}的${fruit}';
}

// Path: dialogs
class _TranslationsDialogsZhCn extends TranslationsDialogsEn {
  _TranslationsDialogsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileZhCn addFile = _TranslationsDialogsAddFileZhCn._(_root);
  @override
  late final _TranslationsDialogsOpenFileZhCn openFile = _TranslationsDialogsOpenFileZhCn._(_root);
  @override
  late final _TranslationsDialogsAddressInputZhCn addressInput = _TranslationsDialogsAddressInputZhCn._(_root);
  @override
  late final _TranslationsDialogsCancelSessionZhCn cancelSession = _TranslationsDialogsCancelSessionZhCn._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileZhCn cannotOpenFile = _TranslationsDialogsCannotOpenFileZhCn._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeZhCn encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeZhCn._(_root);
  @override
  late final _TranslationsDialogsErrorDialogZhCn errorDialog = _TranslationsDialogsErrorDialogZhCn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogZhCn favoriteDialog = _TranslationsDialogsFavoriteDialogZhCn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogZhCn favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogZhCn._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogZhCn favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogZhCn._(_root);
  @override
  late final _TranslationsDialogsFileInfoZhCn fileInfo = _TranslationsDialogsFileInfoZhCn._(_root);
  @override
  late final _TranslationsDialogsFileNameInputZhCn fileNameInput = _TranslationsDialogsFileNameInputZhCn._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogZhCn historyClearDialog = _TranslationsDialogsHistoryClearDialogZhCn._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedZhCn localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedZhCn._(_root);
  @override
  late final _TranslationsDialogsMessageInputZhCn messageInput = _TranslationsDialogsMessageInputZhCn._(_root);
  @override
  late final _TranslationsDialogsNoFilesZhCn noFiles = _TranslationsDialogsNoFilesZhCn._(_root);
  @override
  late final _TranslationsDialogsNoPermissionZhCn noPermission = _TranslationsDialogsNoPermissionZhCn._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformZhCn notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformZhCn._(_root);
  @override
  late final _TranslationsDialogsQrZhCn qr = _TranslationsDialogsQrZhCn._(_root);
  @override
  late final _TranslationsDialogsQuickActionsZhCn quickActions = _TranslationsDialogsQuickActionsZhCn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeZhCn quickSaveNotice = _TranslationsDialogsQuickSaveNoticeZhCn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeZhCn quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeZhCn._(_root);
  @override
  late final _TranslationsDialogsPinZhCn pin = _TranslationsDialogsPinZhCn._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpZhCn sendModeHelp = _TranslationsDialogsSendModeHelpZhCn._(_root);
  @override
  late final _TranslationsDialogsZoomZhCn zoom = _TranslationsDialogsZoomZhCn._(_root);
}

// Path: sanitization
class _TranslationsSanitizationZhCn extends TranslationsSanitizationEn {
  _TranslationsSanitizationZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => '文件名不能为空';
  @override
  String get invalid => '文件名包含无效字符';
}

// Path: tray
class _TranslationsTrayZhCn extends TranslationsTrayEn {
  _TranslationsTrayZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => '退出 LocalSend';
  @override
  String get closeWindows => '退出';
}

// Path: web
class _TranslationsWebZhCn extends TranslationsWebEn {
  _TranslationsWebZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => '输入 PIN';
  @override
  String get invalidPin => 'PIN 无效';
  @override
  String get tooManyAttempts => '尝试次数过多';
  @override
  String get rejected => '已拒绝';
  @override
  String get files => '文件';
  @override
  String get fileName => '文件名';
  @override
  String get size => '大小';
}

// Path: assetPicker
class _TranslationsAssetPickerZhCn extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => '确认';
  @override
  String get cancel => '取消';
  @override
  String get edit => '编辑';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => '加载失败';
  @override
  String get original => '原文件';
  @override
  String get preview => '预览';
  @override
  String get select => '选择';
  @override
  String get emptyList => '清空列表';
  @override
  String get unSupportedAssetType => '不支持该文件格式';
  @override
  String get unableToAccessAll => '无法访问设备上的所有文件';
  @override
  String get viewingLimitedAssetsTip => '应用程序仅能查看您允许的文件和相册。';
  @override
  String get changeAccessibleLimitedAssets => '点击以更改可访问文件范围';
  @override
  String get accessAllTip => '应用程序只能访问设备上的部分文件，请转到系统设置并允许该应用访问设备上的所有媒体文件。';
  @override
  String get goToSystemSettings => '转到系统设置';
  @override
  String get accessLimitedAssets => '继续受限访问';
  @override
  String get accessiblePathName => '可访问的文件';
  @override
  String get sTypeAudioLabel => '音频';
  @override
  String get sTypeImageLabel => '图片';
  @override
  String get sTypeVideoLabel => '视频';
  @override
  String get sTypeOtherLabel => '其他媒体文件';
  @override
  String get sActionPlayHint => '播放';
  @override
  String get sActionPreviewHint => '预览';
  @override
  String get sActionSelectHint => '选择';
  @override
  String get sActionSwitchPathLabel => '更改路径';
  @override
  String get sActionUseCameraHint => '使用摄像头';
  @override
  String get sNameDurationLabel => '时长';
  @override
  String get sUnitAssetCountLabel => '计数';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageZhCn extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '网络接口';
  @override
  String get info => '默认情况下，LocalSend 使用所有可用的网络接口。您可以在此处排除不需要的网络接口。您需要重新启动服务器以应用更改。';
  @override
  String get preview => '预览';
  @override
  String get whitelist => '白名单';
  @override
  String get blacklist => '黑名单';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxZhCn extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP：';
  @override
  String get port => '端口：';
  @override
  String get alias => '设备名称：';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveZhCn extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => '收藏夹';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionZhCn extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '选择';
  @override
  String files({required Object files}) => '文件：${files}';
  @override
  String size({required Object size}) => '大小：${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerZhCn extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get file => '文件';
  @override
  String get folder => '文件夹';
  @override
  String get media => '媒体';
  @override
  String get text => '文本';
  @override
  String get app => '应用';
  @override
  String get clipboard => '剪贴板';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesZhCn extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get single => '一个接收者';
  @override
  String get multiple => '多个接收者';
  @override
  String get link => '通过链接分享';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralZhCn extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通用';
  @override
  String get brightness => '主题';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsZhCn brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsZhCn._(_root);
  @override
  String get color => '颜色';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsZhCn colorOptions = _TranslationsSettingsTabGeneralColorOptionsZhCn._(_root);
  @override
  String get language => '语言';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsZhCn languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsZhCn._(_root);
  @override
  String get saveWindowPlacement => '退出时保存窗口位置';
  @override
  String get saveWindowPlacementWindows => '退出时保存窗口位置';
  @override
  String get minimizeToTray => '关闭时最小化到系统托盘';
  @override
  String get launchAtStartup => '登录系统后自动启动程序';
  @override
  String get launchMinimized => '启动时最小化到任务栏';
  @override
  String get showInContextMenu => '在“发送到...”文件菜单中显示 LocalSend';
  @override
  String get animations => '动画效果';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveZhCn extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '接收';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => '自动完成传输任务';
  @override
  String get destination => '保存目录';
  @override
  String get downloads => '(下载)';
  @override
  String get saveToGallery => '保存到相册';
  @override
  String get saveToHistory => '保存到历史记录';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendZhCn extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '发送';
  @override
  String get shareViaLinkAutoAccept => '通过链接分享：自动同意接收请求';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkZhCn extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '网络';
  @override
  String get needRestart => '重启服务器后生效！';
  @override
  String get server => '服务器';
  @override
  String get alias => '设备名称';
  @override
  String get deviceType => '设备类型';
  @override
  String get deviceModel => '设备型号';
  @override
  String get port => '端口';
  @override
  String get discoveryTimeout => '搜索设备超时';
  @override
  String get useSystemName => '使用系统名称';
  @override
  String get generateRandomAlias => '生成随机昵称';
  @override
  String portWarning({required Object defaultPort}) => '由于正在使用自定义端口，你可能不会被其他设备检测到。（默认端口：${defaultPort}）';
  @override
  String get encryption => '加密';
  @override
  String get multicastGroup => '多播';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) => '由于正在使用自定义多播地址，你可能不会被其他设备检测到。（默认地址：${defaultMulticast}）';
  @override
  String get network => '网络';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsZhCn networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsZhCn._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherZhCn extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '其他';
  @override
  String get support => '支持 LocalSend';
  @override
  String get donate => '捐赠';
  @override
  String get privacyPolicy => '隐私政策';
  @override
  String get termsOfUse => '使用条款';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallZhCn extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '此设备可以发送文件至其他设备，但其它设备无法发送文件到此设备。';
  @override
  String solution({required Object port}) => '这最可能是由防火墙规则设定引起的。你可以通过在端口 ${port} 上允许（UDP 和 TCP 的）传入请求来解决这个问题。';
  @override
  String get openFirewallSettings => '打开防火墙';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryZhCn extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '此设备未能发现其他设备。';
  @override
  String get solution => '确保所有设备都处于同一个 Wi‑Fi 网络上，且共享相同的网络配置（端口、多播地址、加密选项）。您可以尝试手动输入目标设备的 IP 地址。如果起到了效果，请考虑将此设备添加到收藏夹中，以便将来可以自动发现。';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionZhCn extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '双方设备均无法发现对方或者分享文件。';
  @override
  String get solution => '当问题发生在双方设备上时，请先确认双方设备处于同一个 Wi‑Fi 网络上，且共享相同的网络配置（端口、多播地址、加密选项）。若因 Wi‑Fi 不允许参与者间通信，那么请在路由器中关闭“接入点(AP)隔离”选项。';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsZhCn extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get open => '打开文件';
  @override
  String get showInFolder => '在文件管理器中显示';
  @override
  String get info => '信息';
  @override
  String get deleteFromHistory => '从历史记录中删除';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalZhCn extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleZhCn title = _TranslationsProgressPageTotalTitleZhCn._(_root);
  @override
  String count({required Object curr, required Object n}) => '文件：${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => '大小：${curr} / ${n}';
  @override
  String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileZhCn extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '添加文件';
  @override
  String get content => '你想添加什么文件？';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileZhCn extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '打开文件';
  @override
  String get content => '您是否要打开接收的文件？';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputZhCn extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '输入地址';
  @override
  String get hashtag => '标签';
  @override
  String get ip => 'IP 地址';
  @override
  String get recentlyUsed => '最近使用： ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionZhCn extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '取消文件传输';
  @override
  String get content => '要取消文件传输吗？';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileZhCn extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '无法打开文件';
  @override
  String content({required Object file}) => '无法打开 “${file}”。这个文件是否已被移动、重命名或删除？';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeZhCn extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '加密已关闭';
  @override
  String get content => '正在通过未加密的 HTTP 协议连接。要使用 HTTPS 协议，请开启加密选项。';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogZhCn extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogZhCn extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '收藏夹';
  @override
  String get noFavorites => '还没有收藏的设备。';
  @override
  String get addFavorite => '新建';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogZhCn extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '删除收藏';
  @override
  String content({required Object name}) => '确定要取消收藏 “${name}” 吗?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogZhCn extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => '添加到收藏夹';
  @override
  String get titleEdit => '设置';
  @override
  String get name => '名称';
  @override
  String get auto => '(自动)';
  @override
  String get ip => 'IP 地址';
  @override
  String get port => '端口';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoZhCn extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '文件信息';
  @override
  String get fileName => '文件名：';
  @override
  String get path => '路径：';
  @override
  String get size => '大小：';
  @override
  String get sender => '发送者：';
  @override
  String get time => '时间：';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputZhCn extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '输入文件名';
  @override
  String original({required Object original}) => '原名：${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogZhCn extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '清空历史记录';
  @override
  String get content => '确定要清空全部历史记录吗？';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedZhCn extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend 在没有扫描本地网络的权限的情况下无法找到其他设备。请在设置中授予此权限。';
  @override
  String get gotoSettings => '设置';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputZhCn extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '输入消息';
  @override
  String get multiline => '多行';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesZhCn extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '未选择文件';
  @override
  String get content => '请至少选择一个文件。';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionZhCn extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '没有权限';
  @override
  String get content => '您尚未授予必要的权限。请在设置中授予权限。';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformZhCn extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '不可用';
  @override
  String get content => '此功能只在以下平台可用：';
}

// Path: dialogs.qr
class _TranslationsDialogsQrZhCn extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '二维码';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsZhCn extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '快速操作';
  @override
  String get counter => '计数器';
  @override
  String get prefix => '前缀';
  @override
  String get padZero => '以零填充';
  @override
  String get sortBeforeCount => '事先以字母顺序排序';
  @override
  String get random => '随机';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeZhCn extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => '自动接受所有文件传输请求。请注意，这会让此网络中的所有人都可以向你发送文件。';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeZhCn extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => ['当前会自动接受收藏夹中设备的文件请求。', '警告：这目前并非绝对安全，知道您收藏夹列表中的设备指纹被黑客窃取，其仍可以向您发送文件。', '但是，此选项比“允许任何设备”更安全。'];
}

// Path: dialogs.pin
class _TranslationsDialogsPinZhCn extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '输入 PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpZhCn extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '发送模式';
  @override
  String get single => '发送文件给一个接收者。已选择的文件在发送后会取消选择。';
  @override
  String get multiple => '发送文件给多个接收者。已选择的文件在发送后不会取消选择。';
  @override
  String get link => '未安装 LocalSend 的接收者可以在浏览器中打开链接以下载选中的文件。';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomZhCn extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsZhCn extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟随系统';
  @override
  String get dark => '深色';
  @override
  String get light => '浅色';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsZhCn extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟随系统';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsZhCn extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟随系统';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsZhCn extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get all => '所有';
  @override
  String get filtered => '已过滤';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleZhCn extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => '总进度 (${time})';
  @override
  String get finishedError => '已完成，但发生错误';
  @override
  String get canceledSender => '发送者已取消';
  @override
  String get canceledReceiver => '接收者已取消';
}
