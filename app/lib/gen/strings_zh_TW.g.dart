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
class TranslationsZhTw extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.zhTw,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <zh-TW>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsZhTw _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => '繁體中文 (台灣)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralZhTw general = _TranslationsGeneralZhTw._(_root);
  @override
  late final _TranslationsReceiveTabZhTw receiveTab = _TranslationsReceiveTabZhTw._(_root);
  @override
  late final _TranslationsSendTabZhTw sendTab = _TranslationsSendTabZhTw._(_root);
  @override
  late final _TranslationsSettingsTabZhTw settingsTab = _TranslationsSettingsTabZhTw._(_root);
  @override
  late final _TranslationsTroubleshootPageZhTw troubleshootPage = _TranslationsTroubleshootPageZhTw._(_root);
  @override
  late final _TranslationsReceiveHistoryPageZhTw receiveHistoryPage = _TranslationsReceiveHistoryPageZhTw._(_root);
  @override
  late final _TranslationsApkPickerPageZhTw apkPickerPage = _TranslationsApkPickerPageZhTw._(_root);
  @override
  late final _TranslationsSelectedFilesPageZhTw selectedFilesPage = _TranslationsSelectedFilesPageZhTw._(_root);
  @override
  late final _TranslationsReceivePageZhTw receivePage = _TranslationsReceivePageZhTw._(_root);
  @override
  late final _TranslationsReceiveOptionsPageZhTw receiveOptionsPage = _TranslationsReceiveOptionsPageZhTw._(_root);
  @override
  late final _TranslationsSendPageZhTw sendPage = _TranslationsSendPageZhTw._(_root);
  @override
  late final _TranslationsProgressPageZhTw progressPage = _TranslationsProgressPageZhTw._(_root);
  @override
  late final _TranslationsWebSharePageZhTw webSharePage = _TranslationsWebSharePageZhTw._(_root);
  @override
  late final _TranslationsAboutPageZhTw aboutPage = _TranslationsAboutPageZhTw._(_root);
  @override
  late final _TranslationsDonationPageZhTw donationPage = _TranslationsDonationPageZhTw._(_root);
  @override
  late final _TranslationsChangelogPageZhTw changelogPage = _TranslationsChangelogPageZhTw._(_root);
  @override
  late final _TranslationsAliasGeneratorZhTw aliasGenerator = _TranslationsAliasGeneratorZhTw._(_root);
  @override
  late final _TranslationsDialogsZhTw dialogs = _TranslationsDialogsZhTw._(_root);
  @override
  late final _TranslationsSanitizationZhTw sanitization = _TranslationsSanitizationZhTw._(_root);
  @override
  late final _TranslationsTrayZhTw tray = _TranslationsTrayZhTw._(_root);
  @override
  late final _TranslationsWebZhTw web = _TranslationsWebZhTw._(_root);
  @override
  late final _TranslationsAssetPickerZhTw assetPicker = _TranslationsAssetPickerZhTw._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageZhTw networkInterfacesPage = _TranslationsNetworkInterfacesPageZhTw._(_root);
}

// Path: general
class _TranslationsGeneralZhTw extends TranslationsGeneralEn {
  _TranslationsGeneralZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get accept => '接受';
  @override
  String get accepted => '已接受';
  @override
  String get add => '新增';
  @override
  String get advanced => '進階';
  @override
  String get cancel => '取消';
  @override
  String get close => '關閉';
  @override
  String get confirm => '確認';
  @override
  String get continueStr => '繼續';
  @override
  String get copy => '複製';
  @override
  String get copiedToClipboard => '已複製到剪貼簿';
  @override
  String get decline => '拒絕';
  @override
  String get done => '完成';
  @override
  String get delete => '刪除';
  @override
  String get edit => '編輯';
  @override
  String get error => '錯誤';
  @override
  String get example => '範例';
  @override
  String get files => '檔案';
  @override
  String get finished => '已完成';
  @override
  String get hide => '隱藏';
  @override
  String get off => '關閉';
  @override
  String get offline => '離線';
  @override
  String get on => '開啟';
  @override
  String get online => '線上';
  @override
  String get open => '開啟';
  @override
  String get queue => '佇列';
  @override
  String get quickSave => '自動儲存';
  @override
  String get quickSaveFromFavorites => '自動儲存來自「最愛」裝置的檔案';
  @override
  String get renamed => '已重新命名';
  @override
  String get reset => '復原變更';
  @override
  String get restart => '重新啟動';
  @override
  String get settings => '設定';
  @override
  String get skipped => '已跳過';
  @override
  String get start => '開始';
  @override
  String get stop => '停止';
  @override
  String get save => '儲存';
  @override
  String get unchanged => '未變更';
  @override
  String get unknown => '未知';
  @override
  String get noItemInClipboard => '剪貼簿中沒有內容。';
}

// Path: receiveTab
class _TranslationsReceiveTabZhTw extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '接收';
  @override
  late final _TranslationsReceiveTabInfoBoxZhTw infoBox = _TranslationsReceiveTabInfoBoxZhTw._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveZhTw quickSave = _TranslationsReceiveTabQuickSaveZhTw._(_root);
}

// Path: sendTab
class _TranslationsSendTabZhTw extends TranslationsSendTabEn {
  _TranslationsSendTabZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '傳送';
  @override
  late final _TranslationsSendTabSelectionZhTw selection = _TranslationsSendTabSelectionZhTw._(_root);
  @override
  late final _TranslationsSendTabPickerZhTw picker = _TranslationsSendTabPickerZhTw._(_root);
  @override
  String get shareIntentInfo => '您也可以使用您的行動裝置中的「分享」功能更簡單地選取檔案。';
  @override
  String get nearbyDevices => '附近的裝置';
  @override
  String get thisDevice => '此裝置';
  @override
  String get scan => '尋找裝置';
  @override
  String get manualSending => '手動傳送';
  @override
  String get sendMode => '傳送模式';
  @override
  late final _TranslationsSendTabSendModesZhTw sendModes = _TranslationsSendTabSendModesZhTw._(_root);
  @override
  String get sendModeHelp => '說明';
  @override
  String get help => '請確保所需目標的處於相同的 Wi‑Fi 網路。';
  @override
  String get placeItems => '列出要分享的項目。';
}

// Path: settingsTab
class _TranslationsSettingsTabZhTw extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '設定';
  @override
  late final _TranslationsSettingsTabGeneralZhTw general = _TranslationsSettingsTabGeneralZhTw._(_root);
  @override
  late final _TranslationsSettingsTabReceiveZhTw receive = _TranslationsSettingsTabReceiveZhTw._(_root);
  @override
  late final _TranslationsSettingsTabSendZhTw send = _TranslationsSettingsTabSendZhTw._(_root);
  @override
  late final _TranslationsSettingsTabNetworkZhTw network = _TranslationsSettingsTabNetworkZhTw._(_root);
  @override
  late final _TranslationsSettingsTabOtherZhTw other = _TranslationsSettingsTabOtherZhTw._(_root);
  @override
  String get advancedSettings => '進階設定';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageZhTw extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '疑難排解';
  @override
  String get subTitle => '這個應用程式並未如預期運作？在這裡您可以找到常見的解決方案。';
  @override
  String get solution => '解決方案：';
  @override
  String get fixButton => '自動修正';
  @override
  late final _TranslationsTroubleshootPageFirewallZhTw firewall = _TranslationsTroubleshootPageFirewallZhTw._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryZhTw noDiscovery = _TranslationsTroubleshootPageNoDiscoveryZhTw._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionZhTw noConnection = _TranslationsTroubleshootPageNoConnectionZhTw._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageZhTw extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '歷史記錄';
  @override
  String get openFolder => '開啟資料夾';
  @override
  String get deleteHistory => '刪除歷史記錄';
  @override
  String get empty => '沒有歷史記錄。';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsZhTw entryActions = _TranslationsReceiveHistoryPageEntryActionsZhTw._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageZhTw extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '應用程式 (APK)';
  @override
  String get excludeSystemApps => '排除系統應用程式';
  @override
  String get excludeAppsWithoutLaunchIntent => '排除不可啟動的應用程式';
  @override
  String apps({required Object n}) => '${n} 個應用程式';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageZhTw extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => '全部刪除';
}

// Path: receivePage
class _TranslationsReceivePageZhTw extends TranslationsReceivePageEn {
  _TranslationsReceivePageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, one: '要傳送一個檔案給您', other: '要傳送 ${n} 個檔案給您');
  @override
  String get subTitleMessage => '已傳送一則訊息給您：';
  @override
  String get subTitleLink => '已傳送一個連結給您：';
  @override
  String get canceled => '傳送者已取消要求。';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageZhTw extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '選項';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend 資料夾)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => '因內容存在資料夾而自動關閉。';
}

// Path: sendPage
class _TranslationsSendPageZhTw extends TranslationsSendPageEn {
  _TranslationsSendPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => '正在等候回應…';
  @override
  String get rejected => '接收者拒絕了要求。';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => '接收者正忙於處理另一個要求。';
}

// Path: progressPage
class _TranslationsProgressPageZhTw extends TranslationsProgressPageEn {
  _TranslationsProgressPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => '正在傳送檔案';
  @override
  String get titleReceiving => '正在接收檔案';
  @override
  String get savedToGallery => '已儲存至相簿';
  @override
  late final _TranslationsProgressPageTotalZhTw total = _TranslationsProgressPageTotalZhTw._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageZhTw extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '透過連結分享';
  @override
  String get loading => '正在啟動伺服器…';
  @override
  String get stopping => '正在關閉伺服器…';
  @override
  String get error => '啟動伺服器時發生錯誤。';
  @override
  String openLink({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, one: '在瀏覽器開啟此連結：', other: '在瀏覽器中開啟其中一個連結：');
  @override
  String get requests => '要求';
  @override
  String get noRequests => '目前沒有任何要求。';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => '自動接受請求';
  @override
  String get requirePin => '需要 PIN 碼';
  @override
  String pinHint({required Object pin}) => 'PIN 碼是「${pin}」';
  @override
  String get encryptionHint => 'LocalSend 使用自簽署憑證。您需要在瀏覽器中接受它。';
  @override
  String pendingRequests({required Object n}) => '待處理的要求：${n}';
}

// Path: aboutPage
class _TranslationsAboutPageZhTw extends TranslationsAboutPageEn {
  _TranslationsAboutPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '關於 LocalSend';
  @override
  List<String> get description => [
    'LocalSend 是一款免費的開源應用程式，可讓您透過區域網路與鄰近的裝置安全的分享檔案和訊息，無需網際網路連線。',
    '此應用程式可在 Android、iOS、macOS、Windows 和 Linux 上使用。 您可以在官網首頁上找到所有下載選項。',
  ];
  @override
  String get author => '作者';
  @override
  String get contributors => '貢獻者';
  @override
  String get packagers => '封裝人員';
  @override
  String get translators => '翻譯人員';
}

// Path: donationPage
class _TranslationsDonationPageZhTw extends TranslationsDonationPageEn {
  _TranslationsDonationPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '贊助';
  @override
  String get info => 'LocalSend 是免費、開源且沒有任何廣告的。如果您喜歡此應用程式，您可以透過捐贈來支持開發。';
  @override
  String donate({required Object amount}) => '贊助 ${amount}';
  @override
  String get thanks => '非常感謝您！';
  @override
  String get restore => '復原購買';
}

// Path: changelogPage
class _TranslationsChangelogPageZhTw extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '變更記錄';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorZhTw extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsZhTw extends TranslationsDialogsEn {
  _TranslationsDialogsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileZhTw addFile = _TranslationsDialogsAddFileZhTw._(_root);
  @override
  late final _TranslationsDialogsOpenFileZhTw openFile = _TranslationsDialogsOpenFileZhTw._(_root);
  @override
  late final _TranslationsDialogsAddressInputZhTw addressInput = _TranslationsDialogsAddressInputZhTw._(_root);
  @override
  late final _TranslationsDialogsCancelSessionZhTw cancelSession = _TranslationsDialogsCancelSessionZhTw._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileZhTw cannotOpenFile = _TranslationsDialogsCannotOpenFileZhTw._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeZhTw encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeZhTw._(_root);
  @override
  late final _TranslationsDialogsErrorDialogZhTw errorDialog = _TranslationsDialogsErrorDialogZhTw._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogZhTw favoriteDialog = _TranslationsDialogsFavoriteDialogZhTw._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogZhTw favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogZhTw._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogZhTw favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogZhTw._(_root);
  @override
  late final _TranslationsDialogsFileInfoZhTw fileInfo = _TranslationsDialogsFileInfoZhTw._(_root);
  @override
  late final _TranslationsDialogsFileNameInputZhTw fileNameInput = _TranslationsDialogsFileNameInputZhTw._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogZhTw historyClearDialog = _TranslationsDialogsHistoryClearDialogZhTw._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedZhTw localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedZhTw._(_root);
  @override
  late final _TranslationsDialogsMessageInputZhTw messageInput = _TranslationsDialogsMessageInputZhTw._(_root);
  @override
  late final _TranslationsDialogsNoFilesZhTw noFiles = _TranslationsDialogsNoFilesZhTw._(_root);
  @override
  late final _TranslationsDialogsNoPermissionZhTw noPermission = _TranslationsDialogsNoPermissionZhTw._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformZhTw notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformZhTw._(_root);
  @override
  late final _TranslationsDialogsQrZhTw qr = _TranslationsDialogsQrZhTw._(_root);
  @override
  late final _TranslationsDialogsQuickActionsZhTw quickActions = _TranslationsDialogsQuickActionsZhTw._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeZhTw quickSaveNotice = _TranslationsDialogsQuickSaveNoticeZhTw._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeZhTw quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeZhTw._(_root);
  @override
  late final _TranslationsDialogsPinZhTw pin = _TranslationsDialogsPinZhTw._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpZhTw sendModeHelp = _TranslationsDialogsSendModeHelpZhTw._(_root);
  @override
  late final _TranslationsDialogsZoomZhTw zoom = _TranslationsDialogsZoomZhTw._(_root);
}

// Path: sanitization
class _TranslationsSanitizationZhTw extends TranslationsSanitizationEn {
  _TranslationsSanitizationZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get empty => '檔案名稱不能為空';
  @override
  String get invalid => '檔案名稱包含無效字元';
}

// Path: tray
class _TranslationsTrayZhTw extends TranslationsTrayEn {
  _TranslationsTrayZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => '退出 LocalSend';
  @override
  String get closeWindows => '離開';
}

// Path: web
class _TranslationsWebZhTw extends TranslationsWebEn {
  _TranslationsWebZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => '輸入 PIN 碼';
  @override
  String get invalidPin => 'PIN 碼無效';
  @override
  String get tooManyAttempts => '嘗試次數過多，請稍後再試';
  @override
  String get rejected => '遭到拒絕';
  @override
  String get files => '檔案';
  @override
  String get fileName => '檔案名稱';
  @override
  String get size => '大小';
}

// Path: assetPicker
class _TranslationsAssetPickerZhTw extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => '確認';
  @override
  String get cancel => '取消';
  @override
  String get edit => '編輯';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => '載入失敗';
  @override
  String get original => '原始檔案';
  @override
  String get preview => '預覽';
  @override
  String get select => '選取';
  @override
  String get emptyList => '空白清單';
  @override
  String get unSupportedAssetType => '不支援的檔案類型。';
  @override
  String get unableToAccessAll => '無法存取此裝置上的所有檔案';
  @override
  String get viewingLimitedAssetsTip => '僅檢視此應用程式可存取的檔案和相簿。';
  @override
  String get changeAccessibleLimitedAssets => '按一下以更新可存取的檔案';
  @override
  String get accessAllTip => '應用程式僅可存取此裝置的部分檔案，前往系統設定並允許應用程式存取此裝置上的所有媒體。';
  @override
  String get goToSystemSettings => '前往系統設定';
  @override
  String get accessLimitedAssets => '以受限制的存取繼續';
  @override
  String get accessiblePathName => '可存取的檔案';
  @override
  String get sTypeAudioLabel => '音樂';
  @override
  String get sTypeImageLabel => '圖片';
  @override
  String get sTypeVideoLabel => '影片';
  @override
  String get sTypeOtherLabel => '其他媒體';
  @override
  String get sActionPlayHint => '播放';
  @override
  String get sActionPreviewHint => '預覽';
  @override
  String get sActionSelectHint => '選取';
  @override
  String get sActionSwitchPathLabel => '變更路徑';
  @override
  String get sActionUseCameraHint => '使用相機';
  @override
  String get sNameDurationLabel => '持續時間';
  @override
  String get sUnitAssetCountLabel => '計數';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageZhTw extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get info => 'LocalSend 預設使用所有可用的網路介面，您可於此處排除不想使用的網路。您需要重新啟動伺服器以套用變更。';
  @override
  String get title => '網路介面';
  @override
  String get preview => '預覽';
  @override
  String get whitelist => '允許清單';
  @override
  String get blacklist => '禁止清單';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxZhTw extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP：';
  @override
  String get port => '通訊埠：';
  @override
  String get alias => '別名：';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveZhTw extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => '最愛';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionZhTw extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '選取';
  @override
  String files({required Object files}) => '檔案：${files}';
  @override
  String size({required Object size}) => '大小：${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerZhTw extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get file => '檔案';
  @override
  String get folder => '資料夾';
  @override
  String get media => '媒體';
  @override
  String get text => '文字';
  @override
  String get app => '應用程式';
  @override
  String get clipboard => '貼上';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesZhTw extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get single => '單一接收者';
  @override
  String get multiple => '多重接收者';
  @override
  String get link => '透過連結分享';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralZhTw extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  String get brightness => '主題';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsZhTw brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsZhTw._(_root);
  @override
  String get color => '色彩';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsZhTw colorOptions = _TranslationsSettingsTabGeneralColorOptionsZhTw._(_root);
  @override
  String get language => '語言';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsZhTw languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsZhTw._(_root);
  @override
  String get saveWindowPlacement => '退出時儲存視窗位置';
  @override
  String get saveWindowPlacementWindows => '離開時儲存視窗位置';
  @override
  String get minimizeToTray => '關閉時最小化至系統匣';
  @override
  String get launchAtStartup => '登入後自動啟動';
  @override
  String get launchMinimized => '自動啟動至系統匣';
  @override
  String get showInContextMenu => '在檔案功能表「傳送到」項目中顯示 LocalSend';
  @override
  String get animations => '動畫';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveZhTw extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

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
  String get autoFinish => '自動完成傳送任務';
  @override
  String get destination => '儲存目錄';
  @override
  String get downloads => '(下載)';
  @override
  String get saveToGallery => '儲存媒體至相簿';
  @override
  String get saveToHistory => '儲存至歷史記錄';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendZhTw extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '傳送';
  @override
  String get shareViaLinkAutoAccept => '透過連結分享：自動同意接收要求';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkZhTw extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '網路';
  @override
  String get needRestart => '重新啟動伺服器以套用設定！';
  @override
  String get server => '伺服器';
  @override
  String get alias => '別名';
  @override
  String get deviceType => '裝置類型';
  @override
  String get deviceModel => '裝置型號';
  @override
  String get port => '通訊埠';
  @override
  String get discoveryTimeout => '探索裝置逾時';
  @override
  String get useSystemName => '使用系統名稱';
  @override
  String get generateRandomAlias => '隨機產生別名';
  @override
  String portWarning({required Object defaultPort}) => '您可能無法被其他裝置偵測，因為您正在使用自訂通訊埠。(預設：${defaultPort})';
  @override
  String get encryption => '加密';
  @override
  String get multicastGroup => '多點傳送';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) => '您可能無法被其他裝置偵測，因為您正在使用自訂多點傳送位址。(預設：${defaultMulticast})';
  @override
  String get network => '網路';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsZhTw networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsZhTw._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherZhTw extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '其它';
  @override
  String get support => '支持 LocalSend';
  @override
  String get donate => '贊助';
  @override
  String get privacyPolicy => '隱私權政策';
  @override
  String get termsOfUse => '使用條款';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallZhTw extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '此應用程式可以向其他裝置傳送檔案，但其他裝置無法向此裝置傳送檔案。';
  @override
  String solution({required Object port}) => '這很可能是防火牆問題。您可以透過允許通訊埠 ${port} 上的連入連線 (UDP 和 TCP) 以解決此問題。';
  @override
  String get openFirewallSettings => '開啟防火牆';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryZhTw extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '本裝置無法探索其他裝置。';
  @override
  String get solution => '請確保所有裝置都在同一個 Wi‑Fi 網路上並共用相同的設定 (通訊埠、多點傳送位址、加密選項)。您可以嘗試手動輸入目標裝置的 IP 位址。如果這樣可以運作，考慮將此裝置新增至最愛，以便未來可以自動偵測到。';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionZhTw extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '兩部裝置無法探索彼此，也無法分享檔案。';
  @override
  String get solution => '雙方都存在問題？然後你需要確保兩部裝置處於相同的 Wi‑Fi 網路中並共用相同的組態 (通訊埠、多點傳送位址、加密選項)。Wi‑Fi 可能不允許參與者之間進行通訊。在這種狀況下，必須在路由器上停用「存取點 (AP) 隔離」選項。';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsZhTw extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get open => '開啟檔案';
  @override
  String get showInFolder => '在資料夾中顯示';
  @override
  String get info => '資訊';
  @override
  String get deleteFromHistory => '從歷史記錄刪除';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalZhTw extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleZhTw title = _TranslationsProgressPageTotalTitleZhTw._(_root);
  @override
  String count({required Object curr, required Object n}) => '檔案：${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => '大小：${curr} / ${n}';
  @override
  String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileZhTw extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '新增檔案';
  @override
  String get content => '您想要新增什麼檔案？';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileZhTw extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '開啟檔案';
  @override
  String get content => '您想開啟接收到的檔案嗎？';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputZhTw extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入位址';
  @override
  String get hashtag => '雜湊標記';
  @override
  String get ip => 'IP 位址';
  @override
  String get recentlyUsed => '最近使用：';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionZhTw extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '取消檔案傳輸';
  @override
  String get content => '您確定要取消檔案傳輸嗎？';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileZhTw extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '無法開啟檔案';
  @override
  String content({required Object file}) => '無法開啟「${file}」，這個檔案已被移動、重新命名或刪除了嗎？';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeZhTw extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '加密已停用';
  @override
  String get content => '目前的通訊透過未經加密的 HTTP 通訊協定執行。若要使用 HTTPS，請再次啟用加密。';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogZhTw extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogZhTw extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '最愛';
  @override
  String get noFavorites => '還沒有最愛的裝置。';
  @override
  String get addFavorite => '新增';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogZhTw extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '從最愛中刪除';
  @override
  String content({required Object name}) => '您確定要從最愛中刪除「${name}」嗎？';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogZhTw extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => '新增至最愛';
  @override
  String get titleEdit => '設定';
  @override
  String get name => '裝置名稱';
  @override
  String get auto => '(自動)';
  @override
  String get ip => 'IP 位址';
  @override
  String get port => '連接埠';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoZhTw extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '檔案資訊';
  @override
  String get fileName => '檔案名稱：';
  @override
  String get path => '路徑：';
  @override
  String get size => '大小：';
  @override
  String get sender => '傳送者：';
  @override
  String get time => '時間：';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputZhTw extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入檔案名稱';
  @override
  String original({required Object original}) => '原始檔案名稱：${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogZhTw extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '清除歷史記錄';
  @override
  String get content => '您真的要刪除整個歷史記錄嗎?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedZhTw extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => '在未取得掃描區域網路權限的狀況下 LocalSend 無法找到其他裝置，請在設定中授予此權限。';
  @override
  String get gotoSettings => '設定';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputZhTw extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入訊息';
  @override
  String get multiline => '多行';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesZhTw extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '未選取檔案';
  @override
  String get content => '請至少選取一個檔案。';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionZhTw extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '沒有權限';
  @override
  String get content => '您尚未授予必要的權限。請在設定中授予權限。';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformZhTw extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '無法使用';
  @override
  String get content => '此功能僅適用於：';
}

// Path: dialogs.qr
class _TranslationsDialogsQrZhTw extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR 圖碼';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsZhTw extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '快速動作';
  @override
  String get counter => '計數器';
  @override
  String get prefix => '前置詞';
  @override
  String get padZero => '字元零填補';
  @override
  String get sortBeforeCount => '事先依字母排序';
  @override
  String get random => '隨機';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeZhTw extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => '自動接受所有檔案要求。請注意，區域網路中的所有人都可以傳送檔案給您。';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeZhTw extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => ['自動接受來自您最愛清單中裝置傳送的檔案。', '警告：目前這並非絕對安全，因為知道您最愛裝置指紋的駭客仍然可以向您傳送檔案。', '但仍然比允許任何裝置更安全。'];
}

// Path: dialogs.pin
class _TranslationsDialogsPinZhTw extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.web.enterPin;
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpZhTw extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '傳送模式';
  @override
  String get single => '傳送檔案至單個接收者，選取項目將在檔案傳輸完成後被清除。';
  @override
  String get multiple => '傳送檔案至多重接收者，選取項目將不會被清除。';
  @override
  String get link => '未安裝 LocalSend 的接收者可以透過在瀏覽器開啟連結以下載選取的檔案.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomZhTw extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title => '網址';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsZhTw extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get system => '系統';
  @override
  String get dark => '深色';
  @override
  String get light => '淺色';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsZhTw extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get system => '系統';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsZhTw extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get system => '系統';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsZhTw extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get all => '全部';
  @override
  String get filtered => '已篩選';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleZhTw extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => '整體進度 (${time})';
  @override
  String get finishedError => '已完成，但發生錯誤';
  @override
  String get canceledSender => '傳送者已取消';
  @override
  String get canceledReceiver => '接收者已取消';
}
