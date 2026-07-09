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
class TranslationsZhHk extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsZhHk({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.zhHk,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <zh-HK>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsZhHk _root = this; // ignore: unused_field

  @override
  TranslationsZhHk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => '繁體中文 (香港)';
  @override
  String get appName => 'LocalSend';
  @override
  late final Translations$general$zh_HK general = Translations$general$zh_HK.internal(_root);
  @override
  late final Translations$receiveTab$zh_HK receiveTab = Translations$receiveTab$zh_HK.internal(_root);
  @override
  late final Translations$sendTab$zh_HK sendTab = Translations$sendTab$zh_HK.internal(_root);
  @override
  late final Translations$settingsTab$zh_HK settingsTab = Translations$settingsTab$zh_HK.internal(_root);
  @override
  late final Translations$troubleshootPage$zh_HK troubleshootPage = Translations$troubleshootPage$zh_HK.internal(_root);
  @override
  late final Translations$receiveHistoryPage$zh_HK receiveHistoryPage = Translations$receiveHistoryPage$zh_HK.internal(_root);
  @override
  late final Translations$apkPickerPage$zh_HK apkPickerPage = Translations$apkPickerPage$zh_HK.internal(_root);
  @override
  late final Translations$selectedFilesPage$zh_HK selectedFilesPage = Translations$selectedFilesPage$zh_HK.internal(_root);
  @override
  late final Translations$receivePage$zh_HK receivePage = Translations$receivePage$zh_HK.internal(_root);
  @override
  late final Translations$receiveOptionsPage$zh_HK receiveOptionsPage = Translations$receiveOptionsPage$zh_HK.internal(_root);
  @override
  late final Translations$sendPage$zh_HK sendPage = Translations$sendPage$zh_HK.internal(_root);
  @override
  late final Translations$progressPage$zh_HK progressPage = Translations$progressPage$zh_HK.internal(_root);
  @override
  late final Translations$webSharePage$zh_HK webSharePage = Translations$webSharePage$zh_HK.internal(_root);
  @override
  late final Translations$aboutPage$zh_HK aboutPage = Translations$aboutPage$zh_HK.internal(_root);
  @override
  late final Translations$donationPage$zh_HK donationPage = Translations$donationPage$zh_HK.internal(_root);
  @override
  late final Translations$changelogPage$zh_HK changelogPage = Translations$changelogPage$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$zh_HK dialogs = Translations$dialogs$zh_HK.internal(_root);
  @override
  late final Translations$sanitization$zh_HK sanitization = Translations$sanitization$zh_HK.internal(_root);
  @override
  late final Translations$tray$zh_HK tray = Translations$tray$zh_HK.internal(_root);
  @override
  late final Translations$web$zh_HK web = Translations$web$zh_HK.internal(_root);
  @override
  late final Translations$assetPicker$zh_HK assetPicker = Translations$assetPicker$zh_HK.internal(_root);
  @override
  late final Translations$networkInterfacesPage$zh_HK networkInterfacesPage = Translations$networkInterfacesPage$zh_HK.internal(_root);
}

// Path: general
class Translations$general$zh_HK extends Translations$general$en {
  Translations$general$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get accept => '接受';
  @override
  String get accepted => '已接受';
  @override
  String get add => '新增';
  @override
  String get advanced => '更多資訊';
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
  String get finished => '搞掂';
  @override
  String get hide => '隱藏';
  @override
  String get off => '閂';
  @override
  String get offline => '離線';
  @override
  String get on => '開';
  @override
  String get online => '線上';
  @override
  String get open => '開啟';
  @override
  String get queue => '佇列';
  @override
  String get quickSave => '自動儲存';
  @override
  String get quickSaveFromFavorites => '自動儲存來自已收藏裝置嘅檔案';
  @override
  String get renamed => '改咗名';
  @override
  String get reset => '重設';
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
  String get unchanged => '冇改過';
  @override
  String get unknown => '未知';
  @override
  String get noItemInClipboard => '剪貼簿冇嘢.';
}

// Path: receiveTab
class Translations$receiveTab$zh_HK extends Translations$receiveTab$en {
  Translations$receiveTab$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.settingsTab.receive.title;
  @override
  late final Translations$receiveTab$infoBox$zh_HK infoBox = Translations$receiveTab$infoBox$zh_HK.internal(_root);
  @override
  late final Translations$receiveTab$quickSave$zh_HK quickSave = Translations$receiveTab$quickSave$zh_HK.internal(_root);
}

// Path: sendTab
class Translations$sendTab$zh_HK extends Translations$sendTab$en {
  Translations$sendTab$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.settingsTab.send.title;
  @override
  late final Translations$sendTab$selection$zh_HK selection = Translations$sendTab$selection$zh_HK.internal(_root);
  @override
  late final Translations$sendTab$picker$zh_HK picker = Translations$sendTab$picker$zh_HK.internal(_root);
  @override
  String get shareIntentInfo => '用你裝置嘅「分享」功能以更方便揀選檔案。';
  @override
  String get nearbyDevices => '附近裝置';
  @override
  String get thisDevice => '此裝置';
  @override
  String get scan => '掃描裝置';
  @override
  String get manualSending => '手動傳送';
  @override
  String get sendMode => '傳送模式';
  @override
  late final Translations$sendTab$sendModes$zh_HK sendModes = Translations$sendTab$sendModes$zh_HK.internal(_root);
  @override
  String get sendModeHelp => '説明';
  @override
  String get help => '請確保目標裝置駁緊同一個 Wi‑Fi 網路。';
  @override
  String get placeItems => '將要分享嘅檔案拉過嚟呢度.';
}

// Path: settingsTab
class Translations$settingsTab$zh_HK extends Translations$settingsTab$en {
  Translations$settingsTab$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.settings;
  @override
  late final Translations$settingsTab$general$zh_HK general = Translations$settingsTab$general$zh_HK.internal(_root);
  @override
  late final Translations$settingsTab$receive$zh_HK receive = Translations$settingsTab$receive$zh_HK.internal(_root);
  @override
  late final Translations$settingsTab$send$zh_HK send = Translations$settingsTab$send$zh_HK.internal(_root);
  @override
  late final Translations$settingsTab$network$zh_HK network = Translations$settingsTab$network$zh_HK.internal(_root);
  @override
  late final Translations$settingsTab$other$zh_HK other = Translations$settingsTab$other$zh_HK.internal(_root);
  @override
  String get advancedSettings => '進階設定';
}

// Path: troubleshootPage
class Translations$troubleshootPage$zh_HK extends Translations$troubleshootPage$en {
  Translations$troubleshootPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '疑難排解';
  @override
  String get subTitle => '個 app 唔 work？你可以喺度揾到一啲常見問題嘅解決辦法。';
  @override
  String get solution => '解決辦法：';
  @override
  String get fixButton => '自動修復';
  @override
  late final Translations$troubleshootPage$firewall$zh_HK firewall = Translations$troubleshootPage$firewall$zh_HK.internal(_root);
  @override
  late final Translations$troubleshootPage$noDiscovery$zh_HK noDiscovery = Translations$troubleshootPage$noDiscovery$zh_HK.internal(_root);
  @override
  late final Translations$troubleshootPage$noConnection$zh_HK noConnection = Translations$troubleshootPage$noConnection$zh_HK.internal(_root);
}

// Path: receiveHistoryPage
class Translations$receiveHistoryPage$zh_HK extends Translations$receiveHistoryPage$en {
  Translations$receiveHistoryPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '歷史記錄';
  @override
  String get openFolder => '開啟資料夾';
  @override
  String get deleteHistory => '清除記錄';
  @override
  String get empty => '得個吉噃 :(.';
  @override
  late final Translations$receiveHistoryPage$entryActions$zh_HK entryActions = Translations$receiveHistoryPage$entryActions$zh_HK.internal(_root);
}

// Path: apkPickerPage
class Translations$apkPickerPage$zh_HK extends Translations$apkPickerPage$en {
  Translations$apkPickerPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '應用程式（APK）';
  @override
  String get excludeSystemApps => '排除系統應用程式';
  @override
  String get excludeAppsWithoutLaunchIntent => '排除唔開得嘅應用程式';
  @override
  String apps({required Object n}) => '${n} 個應用程式';
}

// Path: selectedFilesPage
class Translations$selectedFilesPage$zh_HK extends Translations$selectedFilesPage$en {
  Translations$selectedFilesPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => '全部刪除';
}

// Path: receivePage
class Translations$receivePage$zh_HK extends Translations$receivePage$en {
  Translations$receivePage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
    n,
    one: '想 send 1 個檔案畀你',
    other: '想 send ${n} 個檔案畀你',
  );
  @override
  String get subTitleMessage => 'send 咗條訊息畀你：';
  @override
  String get subTitleLink => 'send 咗條 link 畀你：';
  @override
  String get canceled => '對方取消咗個請求。';
}

// Path: receiveOptionsPage
class Translations$receiveOptionsPage$zh_HK extends Translations$receiveOptionsPage$en {
  Translations$receiveOptionsPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.settings;
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '（LocalSend 資料夾）';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => '因為有資料夾存在而自動閂咗.';
}

// Path: sendPage
class Translations$sendPage$zh_HK extends Translations$sendPage$en {
  Translations$sendPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => '等緊回應……';
  @override
  String get rejected => '對方拒絕咗個請求。';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => '對方忙緊另一個請求。';
}

// Path: progressPage
class Translations$progressPage$zh_HK extends Translations$progressPage$en {
  Translations$progressPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => '正在傳送檔案';
  @override
  String get titleReceiving => '正在接收檔案';
  @override
  String get savedToGallery => '成功 save 咗落相簿';
  @override
  late final Translations$progressPage$total$zh_HK total = Translations$progressPage$total$zh_HK.internal(_root);
}

// Path: webSharePage
class Translations$webSharePage$zh_HK extends Translations$webSharePage$en {
  Translations$webSharePage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.sendTab.sendModes.link;
  @override
  String get loading => '開緊個 server……';
  @override
  String get stopping => '閂緊個 server……';
  @override
  String get error => '開 server 嗰陣發生錯誤。';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
    n,
    one: '喺瀏覽器開啟以下連結：',
    other: '喺瀏覽器開啟以下任何一個連結：',
  );
  @override
  String get requests => '請求';
  @override
  String get noRequests => '未有請求.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => '自動接受請求';
  @override
  String get requirePin => '需要密碼';
  @override
  String pinHint({required Object pin}) => '密碼為「${pin}」';
  @override
  String get encryptionHint => 'LocalSend 用嘅係自我簽署憑證。麻煩你喺瀏覽器度允許咗佢。';
  @override
  String pendingRequests({required Object n}) => '仲有 ${n} 個請求未處理';
}

// Path: aboutPage
class Translations$aboutPage$zh_HK extends Translations$aboutPage$en {
  Translations$aboutPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '關於 LocalSend';
  @override
  List<String> get description => [
    'LocalSend 係一款免費嘅開源應用程式，佢可以透過區域網路幫你安全噉將檔案同訊息分享畀附近嘅裝置，全程無需互聯網連線。',
    '呢個 app 喺 Android、iOS、macOS、Windows 同 Linux 都用得㗎。你可以喺我哋嘅網站揾到呢個 app 所有平台嘅版本同其他下載方式。',
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
class Translations$donationPage$zh_HK extends Translations$donationPage$en {
  Translations$donationPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.settingsTab.other.donate;
  @override
  String get info => 'LocalSend 唔單只免費、開源，仲係冇廣告添㗎！如果你鍾意呢個 app，不妨捐款贊助我哋開發.';
  @override
  String donate({required Object amount}) => '捐 ${amount}';
  @override
  String get thanks => '多謝支持！';
  @override
  String get restore => '還原 app 內購買';
}

// Path: changelogPage
class Translations$changelogPage$zh_HK extends Translations$changelogPage$en {
  Translations$changelogPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '更新記錄';
}

// Path: dialogs
class Translations$dialogs$zh_HK extends Translations$dialogs$en {
  Translations$dialogs$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$dialogs$addFile$zh_HK addFile = Translations$dialogs$addFile$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$openFile$zh_HK openFile = Translations$dialogs$openFile$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$addressInput$zh_HK addressInput = Translations$dialogs$addressInput$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$cancelSession$zh_HK cancelSession = Translations$dialogs$cancelSession$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$cannotOpenFile$zh_HK cannotOpenFile = Translations$dialogs$cannotOpenFile$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$encryptionDisabledNotice$zh_HK encryptionDisabledNotice =
      Translations$dialogs$encryptionDisabledNotice$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$errorDialog$zh_HK errorDialog = Translations$dialogs$errorDialog$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$favoriteDialog$zh_HK favoriteDialog = Translations$dialogs$favoriteDialog$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$favoriteDeleteDialog$zh_HK favoriteDeleteDialog = Translations$dialogs$favoriteDeleteDialog$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$favoriteEditDialog$zh_HK favoriteEditDialog = Translations$dialogs$favoriteEditDialog$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$fileInfo$zh_HK fileInfo = Translations$dialogs$fileInfo$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$fileNameInput$zh_HK fileNameInput = Translations$dialogs$fileNameInput$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$historyClearDialog$zh_HK historyClearDialog = Translations$dialogs$historyClearDialog$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$localNetworkUnauthorized$zh_HK localNetworkUnauthorized =
      Translations$dialogs$localNetworkUnauthorized$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$messageInput$zh_HK messageInput = Translations$dialogs$messageInput$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$noFiles$zh_HK noFiles = Translations$dialogs$noFiles$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$noPermission$zh_HK noPermission = Translations$dialogs$noPermission$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$notAvailableOnPlatform$zh_HK notAvailableOnPlatform = Translations$dialogs$notAvailableOnPlatform$zh_HK.internal(
    _root,
  );
  @override
  late final Translations$dialogs$qr$zh_HK qr = Translations$dialogs$qr$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$quickActions$zh_HK quickActions = Translations$dialogs$quickActions$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$quickSaveNotice$zh_HK quickSaveNotice = Translations$dialogs$quickSaveNotice$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$quickSaveFromFavoritesNotice$zh_HK quickSaveFromFavoritesNotice =
      Translations$dialogs$quickSaveFromFavoritesNotice$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$pin$zh_HK pin = Translations$dialogs$pin$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$sendModeHelp$zh_HK sendModeHelp = Translations$dialogs$sendModeHelp$zh_HK.internal(_root);
  @override
  late final Translations$dialogs$zoom$zh_HK zoom = Translations$dialogs$zoom$zh_HK.internal(_root);
}

// Path: sanitization
class Translations$sanitization$zh_HK extends Translations$sanitization$en {
  Translations$sanitization$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => '檔案名稱唔可以係吉嘅';
  @override
  String get invalid => '檔案名稱唔可以包括唔用得嘅字元';
}

// Path: tray
class Translations$tray$zh_HK extends Translations$tray$en {
  Translations$tray$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => '退出 LocalSend';
  @override
  String get closeWindows => '離開';
}

// Path: web
class Translations$web$zh_HK extends Translations$web$en {
  Translations$web$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => '輸入密碼';
  @override
  String get invalidPin => '密碼無效';
  @override
  String get tooManyAttempts => '嘗試次數過多，請稍後再試';
  @override
  String get rejected => '已遭對方拒絕';
  @override
  String get files => _root.general.files;
  @override
  String get fileName => '檔案名稱';
  @override
  String get size => '大細';
}

// Path: assetPicker
class Translations$assetPicker$zh_HK extends Translations$assetPicker$en {
  Translations$assetPicker$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => _root.general.confirm;
  @override
  String get cancel => _root.general.cancel;
  @override
  String get edit => _root.general.edit;
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => '載入失敗';
  @override
  String get original => '原始檔案';
  @override
  String get preview => '預覽';
  @override
  String get select => '揀選';
  @override
  String get emptyList => '列表冇嘢';
  @override
  String get unSupportedAssetType => '檔案類型唔支援。';
  @override
  String get unableToAccessAll => '無法存取裝置入面所有檔案';
  @override
  String get viewingLimitedAssetsTip => '你淨係可以睇到個 app 能夠存取嘅檔案同相簿。';
  @override
  String get changeAccessibleLimitedAssets => '撳呢度更新可存取檔案';
  @override
  String get accessAllTip => '個 app 只能夠存取裝置入面部分檔案。要存取所有媒體，你要去系統設定開返個權限。';
  @override
  String get goToSystemSettings => '開啟系統設定';
  @override
  String get accessLimitedAssets => '喺限制存取嘅情況下繼續';
  @override
  String get accessiblePathName => '可存取檔案';
  @override
  String get sTypeAudioLabel => '音樂';
  @override
  String get sTypeImageLabel => '相片';
  @override
  String get sTypeVideoLabel => '影片';
  @override
  String get sTypeOtherLabel => '其他媒體';
  @override
  String get sActionPlayHint => '播放';
  @override
  String get sActionPreviewHint => _root.assetPicker.preview;
  @override
  String get sActionSelectHint => _root.assetPicker.select;
  @override
  String get sActionSwitchPathLabel => '更改路徑';
  @override
  String get sActionUseCameraHint => '影相';
  @override
  String get sNameDurationLabel => '持續時間';
  @override
  String get sUnitAssetCountLabel => '數量';
}

// Path: networkInterfacesPage
class Translations$networkInterfacesPage$zh_HK extends Translations$networkInterfacesPage$en {
  Translations$networkInterfacesPage$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get info => 'LocalSend 預設使用所有可用的網路介面。您可以在這裡排除不需要的網路。您需要重新啟動伺服器才能套用變更。';
  @override
  String get title => '網路介面';
  @override
  String get preview => '預覽';
  @override
  String get whitelist => '白名單';
  @override
  String get blacklist => '黑名單';
}

// Path: receiveTab.infoBox
class Translations$receiveTab$infoBox$zh_HK extends Translations$receiveTab$infoBox$en {
  Translations$receiveTab$infoBox$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP：';
  @override
  String get port => 'Port：';
  @override
  String get alias => '名：';
}

// Path: receiveTab.quickSave
class Translations$receiveTab$quickSave$zh_HK extends Translations$receiveTab$quickSave$en {
  Translations$receiveTab$quickSave$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get off => '關閉';
  @override
  String get favorites => '僅來自已收藏裝置嘅檔案';
  @override
  String get on => '來自所有裝置嘅檔案';
}

// Path: sendTab.selection
class Translations$sendTab$selection$zh_HK extends Translations$sendTab$selection$en {
  Translations$sendTab$selection$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '揀選';
  @override
  String files({required Object files}) => '檔案：${files}';
  @override
  String size({required Object size}) => '大細：${size}';
}

// Path: sendTab.picker
class Translations$sendTab$picker$zh_HK extends Translations$sendTab$picker$en {
  Translations$sendTab$picker$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

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
class Translations$sendTab$sendModes$zh_HK extends Translations$sendTab$sendModes$en {
  Translations$sendTab$sendModes$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get single => '單一接收者';
  @override
  String get multiple => '多個接收者';
  @override
  String get link => '用 link 分享';
}

// Path: settingsTab.general
class Translations$settingsTab$general$zh_HK extends Translations$settingsTab$general$en {
  Translations$settingsTab$general$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  String get brightness => '亮度';
  @override
  late final Translations$settingsTab$general$brightnessOptions$zh_HK brightnessOptions =
      Translations$settingsTab$general$brightnessOptions$zh_HK.internal(_root);
  @override
  String get color => '色彩';
  @override
  late final Translations$settingsTab$general$colorOptions$zh_HK colorOptions = Translations$settingsTab$general$colorOptions$zh_HK.internal(_root);
  @override
  String get language => '語言';
  @override
  late final Translations$settingsTab$general$languageOptions$zh_HK languageOptions = Translations$settingsTab$general$languageOptions$zh_HK.internal(
    _root,
  );
  @override
  String get saveWindowPlacement => '退出嗰陣記低視窗位置';
  @override
  String get saveWindowPlacementWindows => '離開嗰陣記低視窗位置';
  @override
  String get minimizeToTray => '關閉嗰陣縮細做通知圖示';
  @override
  String get launchAtStartup => '開機自動啟動';
  @override
  String get launchMinimized => '自動啟動成通知圖示';
  @override
  String get showInContextMenu => '喺檔案功能表嘅「傳送到」項目顯示 LocalSend';
  @override
  String get animations => '動畫';
}

// Path: settingsTab.receive
class Translations$settingsTab$receive$zh_HK extends Translations$settingsTab$receive$en {
  Translations$settingsTab$receive$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

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
  String get autoFinish => '完成後自動關閉傳輸畫面';
  @override
  String get destination => '儲存位置';
  @override
  String get downloads => '（下載資料夾）';
  @override
  String get saveToGallery => 'Save 落相簿';
  @override
  String get saveToHistory => 'Save 去歷史紀錄';
}

// Path: settingsTab.send
class Translations$settingsTab$send$zh_HK extends Translations$settingsTab$send$en {
  Translations$settingsTab$send$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '傳送';
  @override
  String get shareViaLinkAutoAccept => '用 link 分享檔案嗰陣自動接收';
}

// Path: settingsTab.network
class Translations$settingsTab$network$zh_HK extends Translations$settingsTab$network$en {
  Translations$settingsTab$network$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '網路';
  @override
  String get needRestart => '熄咗個 server 再開過，設定先會生效!';
  @override
  String get server => 'Server';
  @override
  String get alias => '名';
  @override
  String get deviceType => '裝置類型';
  @override
  String get deviceModel => '裝置型號';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => '裝置搜尋逾時';
  @override
  String get useSystemName => '使用系統名稱';
  @override
  String get generateRandomAlias => '求其改個名';
  @override
  String portWarning({required Object defaultPort}) => '改 port 嘅話其他裝置有機會偵測唔到你。（預設：${defaultPort}）';
  @override
  String get encryption => '加密傳送';
  @override
  String get multicastGroup => '多播 IP 地址';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) => '用自訂多播地址嘅話其他裝置有機會偵測唔到你。（預設：${defaultMulticast}）';
  @override
  String get network => '網絡';
  @override
  late final Translations$settingsTab$network$networkOptions$zh_HK networkOptions = Translations$settingsTab$network$networkOptions$zh_HK.internal(
    _root,
  );
}

// Path: settingsTab.other
class Translations$settingsTab$other$zh_HK extends Translations$settingsTab$other$en {
  Translations$settingsTab$other$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '其他';
  @override
  String get support => '支援 LocalSend';
  @override
  String get donate => '捐款';
  @override
  String get privacyPolicy => '私隱權政策';
  @override
  String get termsOfUse => '服務條款';
}

// Path: troubleshootPage.firewall
class Translations$troubleshootPage$firewall$zh_HK extends Translations$troubleshootPage$firewall$en {
  Translations$troubleshootPage$firewall$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '我 send 到嘢但係接收唔到。';
  @override
  String solution({required Object port}) => '應該係防火牆嘅問題，可以透過允許接受 port ${port} 嘅連線（UDP 同 TCP）嚟解決。';
  @override
  String get openFirewall => '開啟防火牆設定';
}

// Path: troubleshootPage.noDiscovery
class Translations$troubleshootPage$noDiscovery$zh_HK extends Translations$troubleshootPage$noDiscovery$en {
  Translations$troubleshootPage$noDiscovery$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '呢部機偵測唔到其他裝置。';
  @override
  String get solution => '請確保所有裝置都駁緊同一個 Wi‑Fi 網路同用緊相同嘅設定（port、多播 IP 地址同有冇開加密傳送）。你亦都可以試下人手輸入目標裝置嘅 IP 地址。如果 work 嘅話可以選擇收藏呢部裝置，噉樣日後就會自動偵測到佢，毋須重新輸入。';
}

// Path: troubleshootPage.noConnection
class Translations$troubleshootPage$noConnection$zh_HK extends Translations$troubleshootPage$noConnection$en {
  Translations$troubleshootPage$noConnection$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '兩部裝置都偵測唔到同 send 唔到嘢畀對方。';
  @override
  String get solution =>
      '如果兩邊都發生同樣嘅情況，你要 check 清楚兩邊係咪駁緊同一個 Wi‑Fi 網路同用緊相同嘅設定（port、多播 IP 地址同有冇開加密傳送）。亦可能係個 Wi‑Fi 唔畀裝置之間通訊，呢種情況下要喺 router 嗰邊熄咗「接入點 (AP) 隔離」模式至得。';
}

// Path: receiveHistoryPage.entryActions
class Translations$receiveHistoryPage$entryActions$zh_HK extends Translations$receiveHistoryPage$entryActions$en {
  Translations$receiveHistoryPage$entryActions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.dialogs.openFile.title;
  @override
  String get showInFolder => '喺檔案瀏覽器顯示';
  @override
  String get info => '資訊';
  @override
  String get deleteFromHistory => '刪走呢筆記錄';
}

// Path: progressPage.total
class Translations$progressPage$total$zh_HK extends Translations$progressPage$total$en {
  Translations$progressPage$total$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$progressPage$total$title$zh_HK title = Translations$progressPage$total$title$zh_HK.internal(_root);
  @override
  String count({required Object curr, required Object n}) => '檔案：${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => '大細：${curr} / ${n}';
  @override
  String speed({required Object speed}) => '速度：${speed}/s';
}

// Path: dialogs.addFile
class Translations$dialogs$addFile$zh_HK extends Translations$dialogs$addFile$en {
  Translations$dialogs$addFile$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '將檔案加至選擇';
  @override
  String get content => '您想新增什麼檔案?';
}

// Path: dialogs.openFile
class Translations$dialogs$openFile$zh_HK extends Translations$dialogs$openFile$en {
  Translations$dialogs$openFile$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '開啟檔案';
  @override
  String get content => '你係咪要開啟接收咗嘅檔案？';
}

// Path: dialogs.addressInput
class Translations$dialogs$addressInput$zh_HK extends Translations$dialogs$addressInput$en {
  Translations$dialogs$addressInput$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入地址';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP 地址';
  @override
  String get recentlyUsed => '輸入記錄： ';
}

// Path: dialogs.cancelSession
class Translations$dialogs$cancelSession$zh_HK extends Translations$dialogs$cancelSession$en {
  Translations$dialogs$cancelSession$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '取消檔案傳輸';
  @override
  String get content => '你係咪要放棄傳輸檔案？';
}

// Path: dialogs.cannotOpenFile
class Translations$dialogs$cannotOpenFile$zh_HK extends Translations$dialogs$cannotOpenFile$en {
  Translations$dialogs$cannotOpenFile$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '無法開啟檔案';
  @override
  String content({required Object file}) => '檔案「${file}」開唔到喎，係咪畀人郁過、改過名或者剷走咗？';
}

// Path: dialogs.encryptionDisabledNotice
class Translations$dialogs$encryptionDisabledNotice$zh_HK extends Translations$dialogs$encryptionDisabledNotice$en {
  Translations$dialogs$encryptionDisabledNotice$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '加密已停用';
  @override
  String get content => '而家會透過未經加密嘅 HTTP 協定嚟通訊。要用 HTTPS 請開返加密。';
}

// Path: dialogs.errorDialog
class Translations$dialogs$errorDialog$zh_HK extends Translations$dialogs$errorDialog$en {
  Translations$dialogs$errorDialog$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class Translations$dialogs$favoriteDialog$zh_HK extends Translations$dialogs$favoriteDialog$en {
  Translations$dialogs$favoriteDialog$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '收藏';
  @override
  String get noFavorites => '未收藏任何裝置.';
  @override
  String get addFavorite => _root.general.add;
}

// Path: dialogs.favoriteDeleteDialog
class Translations$dialogs$favoriteDeleteDialog$zh_HK extends Translations$dialogs$favoriteDeleteDialog$en {
  Translations$dialogs$favoriteDeleteDialog$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '取消收藏裝置';
  @override
  String content({required Object name}) => '你係咪要取消收藏裝置「${name}」？';
}

// Path: dialogs.favoriteEditDialog
class Translations$dialogs$favoriteEditDialog$zh_HK extends Translations$dialogs$favoriteEditDialog$en {
  Translations$dialogs$favoriteEditDialog$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => '新增至收藏';
  @override
  String get titleEdit => '編輯';
  @override
  String get name => '名';
  @override
  String get auto => '（自動）';
  @override
  String get ip => 'IP 地址';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class Translations$dialogs$fileInfo$zh_HK extends Translations$dialogs$fileInfo$en {
  Translations$dialogs$fileInfo$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

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
class Translations$dialogs$fileNameInput$zh_HK extends Translations$dialogs$fileNameInput$en {
  Translations$dialogs$fileNameInput$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入檔案名稱';
  @override
  String original({required Object original}) => '原名：${original}';
}

// Path: dialogs.historyClearDialog
class Translations$dialogs$historyClearDialog$zh_HK extends Translations$dialogs$historyClearDialog$en {
  Translations$dialogs$historyClearDialog$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '清除歷史記錄';
  @override
  String get content => '你係咪真係要剷走全部歷史記錄？';
}

// Path: dialogs.localNetworkUnauthorized
class Translations$dialogs$localNetworkUnauthorized$zh_HK extends Translations$dialogs$localNetworkUnauthorized$en {
  Translations$dialogs$localNetworkUnauthorized$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => '喺冇權掃描區域網路嘅情況下 LocalSend 唔會偵測到其他裝置。麻煩你喺系統設定開返呢個權限。';
  @override
  String get gotoSettings => '開啟系統設定';
}

// Path: dialogs.messageInput
class Translations$dialogs$messageInput$zh_HK extends Translations$dialogs$messageInput$en {
  Translations$dialogs$messageInput$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '輸入訊息';
  @override
  String get multiline => '多行';
}

// Path: dialogs.noFiles
class Translations$dialogs$noFiles$zh_HK extends Translations$dialogs$noFiles$en {
  Translations$dialogs$noFiles$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '冇揀選檔案';
  @override
  String get content => '最少需要揀選一個檔案。';
}

// Path: dialogs.noPermission
class Translations$dialogs$noPermission$zh_HK extends Translations$dialogs$noPermission$en {
  Translations$dialogs$noPermission$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '權限閂咗';
  @override
  String get content => '你冇畀足夠權限我哋進行處理。麻煩你喺系統設定開返啲權限。';
}

// Path: dialogs.notAvailableOnPlatform
class Translations$dialogs$notAvailableOnPlatform$zh_HK extends Translations$dialogs$notAvailableOnPlatform$en {
  Translations$dialogs$notAvailableOnPlatform$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '無法使用';
  @override
  String get content => '此功能只適用於：';
}

// Path: dialogs.qr
class Translations$dialogs$qr$zh_HK extends Translations$dialogs$qr$en {
  Translations$dialogs$qr$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class Translations$dialogs$quickActions$zh_HK extends Translations$dialogs$quickActions$en {
  Translations$dialogs$quickActions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '快速動作';
  @override
  String get counter => '計數器';
  @override
  String get prefix => '前綴';
  @override
  String get padZero => '補零';
  @override
  String get sortBeforeCount => '事前跟字母排序';
  @override
  String get random => '隨機';
}

// Path: dialogs.quickSaveNotice
class Translations$dialogs$quickSaveNotice$zh_HK extends Translations$dialogs$quickSaveNotice$en {
  Translations$dialogs$quickSaveNotice$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => '自動接受所有檔案傳輸請求。留意返，噉樣會令呢個網路嘅所有人都 send 得嘢畀你。';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class Translations$dialogs$quickSaveFromFavoritesNotice$zh_HK extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  Translations$dialogs$quickSaveFromFavoritesNotice$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    '自動接受來自已收藏裝置嘅檔案傳輸請求。',
    '警告：目前呢個選項並非絕對安全，因為只要黑客攞到你任何一部已收藏裝置嘅指紋，佢就可以無限制噉 send 嘢畀你。',
    '不過揀已收藏裝置點都安全過揀所有裝置嘅。',
  ];
}

// Path: dialogs.pin
class Translations$dialogs$pin$zh_HK extends Translations$dialogs$pin$en {
  Translations$dialogs$pin$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.web.enterPin;
}

// Path: dialogs.sendModeHelp
class Translations$dialogs$sendModeHelp$zh_HK extends Translations$dialogs$sendModeHelp$en {
  Translations$dialogs$sendModeHelp$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.sendTab.sendMode;
  @override
  String get single => '淨係 send 畀一部裝置，傳輸完成後會清除揀選項目。';
  @override
  String get multiple => '一次過 send 畀多部裝置，揀選項目會一路保留。';
  @override
  String get link => '冇裝 LocalSend 嘅裝置可以透過條 link 嚟 download 返揀選嘅項目。';
}

// Path: dialogs.zoom
class Translations$dialogs$zoom$zh_HK extends Translations$dialogs$zoom$en {
  Translations$dialogs$zoom$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '網址';
}

// Path: settingsTab.general.brightnessOptions
class Translations$settingsTab$general$brightnessOptions$zh_HK extends Translations$settingsTab$general$brightnessOptions$en {
  Translations$settingsTab$general$brightnessOptions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟機';
  @override
  String get dark => '暗色';
  @override
  String get light => '亮色';
}

// Path: settingsTab.general.colorOptions
class Translations$settingsTab$general$colorOptions$zh_HK extends Translations$settingsTab$general$colorOptions$en {
  Translations$settingsTab$general$colorOptions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟機';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class Translations$settingsTab$general$languageOptions$zh_HK extends Translations$settingsTab$general$languageOptions$en {
  Translations$settingsTab$general$languageOptions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get system => '跟機';
}

// Path: settingsTab.network.networkOptions
class Translations$settingsTab$network$networkOptions$zh_HK extends Translations$settingsTab$network$networkOptions$en {
  Translations$settingsTab$network$networkOptions$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get all => '全部';
  @override
  String get filtered => '已過濾';
}

// Path: progressPage.total.title
class Translations$progressPage$total$title$zh_HK extends Translations$progressPage$total$title$en {
  Translations$progressPage$total$title$zh_HK.internal(TranslationsZhHk root) : this._root = root, super.internal(root);

  final TranslationsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => '進度：${time}';
  @override
  String get finishedError => '搞掂，不過有 error';
  @override
  String get canceledSender => '傳送者取消咗';
  @override
  String get canceledReceiver => '接收者取消咗';
}
