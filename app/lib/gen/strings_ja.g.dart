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
class TranslationsJa extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsJa({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ja,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsJa _root = this; // ignore: unused_field

  @override
  TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => '日本語';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ja general = _Translations$general$ja._(_root);
  @override
  late final _Translations$receiveTab$ja receiveTab = _Translations$receiveTab$ja._(_root);
  @override
  late final _Translations$sendTab$ja sendTab = _Translations$sendTab$ja._(_root);
  @override
  late final _Translations$settingsTab$ja settingsTab = _Translations$settingsTab$ja._(_root);
  @override
  late final _Translations$troubleshootPage$ja troubleshootPage = _Translations$troubleshootPage$ja._(_root);
  @override
  late final _Translations$receiveHistoryPage$ja receiveHistoryPage = _Translations$receiveHistoryPage$ja._(_root);
  @override
  late final _Translations$apkPickerPage$ja apkPickerPage = _Translations$apkPickerPage$ja._(_root);
  @override
  late final _Translations$selectedFilesPage$ja selectedFilesPage = _Translations$selectedFilesPage$ja._(_root);
  @override
  late final _Translations$receivePage$ja receivePage = _Translations$receivePage$ja._(_root);
  @override
  late final _Translations$receiveOptionsPage$ja receiveOptionsPage = _Translations$receiveOptionsPage$ja._(_root);
  @override
  late final _Translations$sendPage$ja sendPage = _Translations$sendPage$ja._(_root);
  @override
  late final _Translations$progressPage$ja progressPage = _Translations$progressPage$ja._(_root);
  @override
  late final _Translations$webSharePage$ja webSharePage = _Translations$webSharePage$ja._(_root);
  @override
  late final _Translations$aboutPage$ja aboutPage = _Translations$aboutPage$ja._(_root);
  @override
  late final _Translations$donationPage$ja donationPage = _Translations$donationPage$ja._(_root);
  @override
  late final _Translations$changelogPage$ja changelogPage = _Translations$changelogPage$ja._(_root);
  @override
  late final _Translations$dialogs$ja dialogs = _Translations$dialogs$ja._(_root);
  @override
  late final _Translations$sanitization$ja sanitization = _Translations$sanitization$ja._(_root);
  @override
  late final _Translations$tray$ja tray = _Translations$tray$ja._(_root);
  @override
  late final _Translations$web$ja web = _Translations$web$ja._(_root);
  @override
  late final _Translations$assetPicker$ja assetPicker = _Translations$assetPicker$ja._(_root);
  @override
  late final _Translations$networkInterfacesPage$ja networkInterfacesPage = _Translations$networkInterfacesPage$ja._(_root);
}

// Path: general
class _Translations$general$ja extends Translations$general$en {
  _Translations$general$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => '承諾';
  @override
  String get accepted => '承諾済み';
  @override
  String get add => '追加';
  @override
  String get advanced => '詳細';
  @override
  String get cancel => 'キャンセル';
  @override
  String get close => '閉じる';
  @override
  String get confirm => '確認';
  @override
  String get continueStr => '続行';
  @override
  String get copy => 'コピー';
  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';
  @override
  String get decline => '拒否';
  @override
  String get done => '完了';
  @override
  String get delete => '削除';
  @override
  String get edit => '編集';
  @override
  String get error => 'エラー';
  @override
  String get example => '例';
  @override
  String get files => 'ファイル';
  @override
  String get finished => '完了しました';
  @override
  String get hide => '隠す';
  @override
  String get off => 'オフ';
  @override
  String get offline => 'オフライン';
  @override
  String get on => 'オン';
  @override
  String get online => 'オンライン';
  @override
  String get open => '開く';
  @override
  String get queue => '順番待ち';
  @override
  String get quickSave => 'クイックセーブ';
  @override
  String get quickSaveFromFavorites => '「お気に入り」からクイックセーブ';
  @override
  String get renamed => '改名済み';
  @override
  String get reset => 'リセット';
  @override
  String get restart => '再起動';
  @override
  String get settings => '設定';
  @override
  String get skipped => 'スキップ済み';
  @override
  String get start => '開始';
  @override
  String get stop => '停止';
  @override
  String get save => '保存';
  @override
  String get unchanged => '変更なし';
  @override
  String get unknown => '不明';
  @override
  String get noItemInClipboard => 'クリップボードにアイテムがありません';
}

// Path: receiveTab
class _Translations$receiveTab$ja extends Translations$receiveTab$en {
  _Translations$receiveTab$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '受信';
  @override
  late final _Translations$receiveTab$infoBox$ja infoBox = _Translations$receiveTab$infoBox$ja._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ja quickSave = _Translations$receiveTab$quickSave$ja._(_root);
}

// Path: sendTab
class _Translations$sendTab$ja extends Translations$sendTab$en {
  _Translations$sendTab$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '送信';
  @override
  late final _Translations$sendTab$selection$ja selection = _Translations$sendTab$selection$ja._(_root);
  @override
  late final _Translations$sendTab$picker$ja picker = _Translations$sendTab$picker$ja._(_root);
  @override
  String get shareIntentInfo => 'モバイルデバイスの「共有」機能を使うと、より簡単にファイルを選択できます。';
  @override
  String get nearbyDevices => '近くのデバイス';
  @override
  String get thisDevice => 'このデバイス';
  @override
  String get scan => 'デバイスを検索';
  @override
  String get manualSending => '手動送信';
  @override
  String get sendMode => '送信モード';
  @override
  late final _Translations$sendTab$sendModes$ja sendModes = _Translations$sendTab$sendModes$ja._(_root);
  @override
  String get sendModeHelp => '説明';
  @override
  String get help => '目標のデバイスが同じWi-Fiネットワーク内にあることを確認してください。';
  @override
  String get placeItems => '共有するアイテムを配置してください。';
}

// Path: settingsTab
class _Translations$settingsTab$ja extends Translations$settingsTab$en {
  _Translations$settingsTab$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '設定';
  @override
  late final _Translations$settingsTab$general$ja general = _Translations$settingsTab$general$ja._(_root);
  @override
  late final _Translations$settingsTab$receive$ja receive = _Translations$settingsTab$receive$ja._(_root);
  @override
  late final _Translations$settingsTab$send$ja send = _Translations$settingsTab$send$ja._(_root);
  @override
  late final _Translations$settingsTab$network$ja network = _Translations$settingsTab$network$ja._(_root);
  @override
  late final _Translations$settingsTab$other$ja other = _Translations$settingsTab$other$ja._(_root);
  @override
  String get advancedSettings => '詳細設定';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ja extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'トラブルシューティング';
  @override
  String get subTitle => 'アプリが期待通りに動作しませんか？ここでは一般的な解決策を紹介します。';
  @override
  String get solution => '解決策:';
  @override
  String get fixButton => '自動で修正する';
  @override
  late final _Translations$troubleshootPage$firewall$ja firewall = _Translations$troubleshootPage$firewall$ja._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ja noDiscovery = _Translations$troubleshootPage$noDiscovery$ja._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ja noConnection = _Translations$troubleshootPage$noConnection$ja._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ja extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '履歴';
  @override
  String get openFolder => 'フォルダを開く';
  @override
  String get deleteHistory => '履歴を消去';
  @override
  String get empty => '履歴には何もありません。';
  @override
  late final _Translations$receiveHistoryPage$entryActions$ja entryActions = _Translations$receiveHistoryPage$entryActions$ja._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ja extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アプリ (APK)';
  @override
  String get excludeSystemApps => 'システムアプリを除外';
  @override
  String get excludeAppsWithoutLaunchIntent => '起動できないアプリを除外';
  @override
  String apps({required Object n}) => '${n} 個';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ja extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'すべて削除';
}

// Path: receivePage
class _Translations$receivePage$ja extends Translations$receivePage$en {
  _Translations$receivePage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
    n,
    one: 'がファイルを送信しようとしています。',
    other: 'が ${n} 件のファイルを送信しようとしています。',
  );
  @override
  String get subTitleMessage => 'がメッセージを送信しました:';
  @override
  String get subTitleLink => 'がリンクを送信しました:';
  @override
  String get canceled => '送信者がリクエストをキャンセルしました。';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$ja extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'オプション';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend フォルダー)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'ディレクトリーがあるため自動で無効になっています。';
}

// Path: sendPage
class _Translations$sendPage$ja extends Translations$sendPage$en {
  _Translations$sendPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => '返答を待っています...';
  @override
  String get rejected => '受信者がリクエストを拒否しました。';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => '受信者は他のリクエストの処理中です。';
}

// Path: progressPage
class _Translations$progressPage$ja extends Translations$progressPage$en {
  _Translations$progressPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ファイルを送信中';
  @override
  String get titleReceiving => 'ファイルを受信中';
  @override
  String get savedToGallery => '写真に保存しました';
  @override
  late final _Translations$progressPage$total$ja total = _Translations$progressPage$total$ja._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ja extends Translations$webSharePage$en {
  _Translations$webSharePage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'リンク経由で共有';
  @override
  String get loading => 'サーバーを起動中...';
  @override
  String get stopping => 'サーバーを停止中...';
  @override
  String get error => 'サーバーの起動中にエラーが発生しました。';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
    n,
    one: 'このリンクをブラウザーで開いてください:',
    other: 'これらのリンクのいずれかをブラウザーで開いてください:',
  );
  @override
  String get requests => 'リクエスト';
  @override
  String get noRequests => 'リクエストはまだありません。';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => '自動でリクエストを承諾する';
  @override
  String get requirePin => 'PINコードを要求';
  @override
  String pinHint({required Object pin}) => 'PINコードは "${pin}" です';
  @override
  String get encryptionHint => 'LocalSendは自己署名証明書を使用しているため、ブラウザーで証明書を許可する必要があります。';
  @override
  String pendingRequests({required Object n}) => '保留中のリクエスト数: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$ja extends Translations$aboutPage$en {
  _Translations$aboutPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSendについて';
  @override
  List<String> get description => [
    'LocalSendは無料のオープンソースアプリで、インターネットに接続することなく、ローカルネットワーク経由で近くにあるデバイスとファイルやメッセージを安全に共有することができます。',
    '本アプリはAndroid、iOS、macOS、Windows、Linuxで利用でき、公式ホームページからダウンロードすることができます。',
  ];
  @override
  String get author => '制作者';
  @override
  String get contributors => '貢献者';
  @override
  String get packagers => 'パッケージ協力者';
  @override
  String get translators => '翻訳者';
}

// Path: donationPage
class _Translations$donationPage$ja extends Translations$donationPage$en {
  _Translations$donationPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '寄付';
  @override
  String get info => 'LocalSendは無料かつオープンソースで、広告を一切含みません。もしアプリを気に入っていただけたら、寄付で開発を支援することができます。';
  @override
  String donate({required Object amount}) => '${amount} 寄付する';
  @override
  String get thanks => 'ありがとうございます！';
  @override
  String get restore => '購入を復元する';
}

// Path: changelogPage
class _Translations$changelogPage$ja extends Translations$changelogPage$en {
  _Translations$changelogPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '更新履歴';
}

// Path: dialogs
class _Translations$dialogs$ja extends Translations$dialogs$en {
  _Translations$dialogs$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ja addFile = _Translations$dialogs$addFile$ja._(_root);
  @override
  late final _Translations$dialogs$openFile$ja openFile = _Translations$dialogs$openFile$ja._(_root);
  @override
  late final _Translations$dialogs$addressInput$ja addressInput = _Translations$dialogs$addressInput$ja._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ja cancelSession = _Translations$dialogs$cancelSession$ja._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ja cannotOpenFile = _Translations$dialogs$cannotOpenFile$ja._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ja encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ja._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ja errorDialog = _Translations$dialogs$errorDialog$ja._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ja favoriteDialog = _Translations$dialogs$favoriteDialog$ja._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ja favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ja._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ja favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ja._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ja fileInfo = _Translations$dialogs$fileInfo$ja._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ja fileNameInput = _Translations$dialogs$fileNameInput$ja._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ja historyClearDialog = _Translations$dialogs$historyClearDialog$ja._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ja localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ja._(_root);
  @override
  late final _Translations$dialogs$messageInput$ja messageInput = _Translations$dialogs$messageInput$ja._(_root);
  @override
  late final _Translations$dialogs$noFiles$ja noFiles = _Translations$dialogs$noFiles$ja._(_root);
  @override
  late final _Translations$dialogs$noPermission$ja noPermission = _Translations$dialogs$noPermission$ja._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ja notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ja._(_root);
  @override
  late final _Translations$dialogs$qr$ja qr = _Translations$dialogs$qr$ja._(_root);
  @override
  late final _Translations$dialogs$quickActions$ja quickActions = _Translations$dialogs$quickActions$ja._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ja quickSaveNotice = _Translations$dialogs$quickSaveNotice$ja._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ja quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ja._(_root);
  @override
  late final _Translations$dialogs$pin$ja pin = _Translations$dialogs$pin$ja._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ja sendModeHelp = _Translations$dialogs$sendModeHelp$ja._(_root);
  @override
  late final _Translations$dialogs$zoom$ja zoom = _Translations$dialogs$zoom$ja._(_root);
}

// Path: sanitization
class _Translations$sanitization$ja extends Translations$sanitization$en {
  _Translations$sanitization$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ファイル名は空にできません';
  @override
  String get invalid => 'ファイル名に無効な文字が含まれています';
}

// Path: tray
class _Translations$tray$ja extends Translations$tray$en {
  _Translations$tray$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSendを終了';
  @override
  String get closeWindows => '終了';
}

// Path: web
class _Translations$web$ja extends Translations$web$en {
  _Translations$web$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PINコードを入力';
  @override
  String get invalidPin => 'PINコードが無効です';
  @override
  String get tooManyAttempts => '試行回数が多すぎます';
  @override
  String get rejected => '拒否済み';
  @override
  String get files => 'ファイル';
  @override
  String get fileName => 'ファイル名';
  @override
  String get size => 'サイズ';
}

// Path: assetPicker
class _Translations$assetPicker$ja extends Translations$assetPicker$en {
  _Translations$assetPicker$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => '確認';
  @override
  String get cancel => 'キャンセル';
  @override
  String get edit => '編集';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => '読み込みに失敗しました';
  @override
  String get original => '元の画像';
  @override
  String get preview => 'プレビュー';
  @override
  String get select => '選択';
  @override
  String get emptyList => 'リストが空です';
  @override
  String get unSupportedAssetType => '未対応のファイル形式です。';
  @override
  String get unableToAccessAll => 'デバイス上のすべてのファイルにアクセスできません';
  @override
  String get viewingLimitedAssetsTip => 'アプリからアクセス可能なファイルやアルバムのみを表示します。';
  @override
  String get changeAccessibleLimitedAssets => 'クリックしてアクセス可能なファイルを設定する';
  @override
  String get accessAllTip => 'アプリが端末の一部のファイルにしかアクセスできません。システム設定を開き、アプリがデバイス上のすべてのメディアにアクセスすることを許可してください。';
  @override
  String get goToSystemSettings => 'システム設定に移動';
  @override
  String get accessLimitedAssets => '限定されたアクセスで続ける';
  @override
  String get accessiblePathName => 'アクセス可能なファイル';
  @override
  String get sTypeAudioLabel => '音声';
  @override
  String get sTypeImageLabel => '画像';
  @override
  String get sTypeVideoLabel => '動画';
  @override
  String get sTypeOtherLabel => 'その他のメディア';
  @override
  String get sActionPlayHint => '再生';
  @override
  String get sActionPreviewHint => 'プレビュー';
  @override
  String get sActionSelectHint => '選択';
  @override
  String get sActionSwitchPathLabel => 'パスを切り替え';
  @override
  String get sActionUseCameraHint => 'カメラを使う';
  @override
  String get sNameDurationLabel => '長さ';
  @override
  String get sUnitAssetCountLabel => '個数';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ja extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'プレビュー';
  @override
  String get blacklist => 'ブラックリスト';
  @override
  String get whitelist => 'ホワイトリスト';
  @override
  String get title => 'ネットワークインターフェース';
  @override
  String get info => 'デフォルトでは、LocalSend は利用可能なすべてのネットワークインターフェースを使用します。不要なネットワークを除外するには、ここで設定できます。変更を適用するには、サーバーを再起動する必要があります。';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$ja extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'ポート:';
  @override
  String get alias => '別名:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$ja extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'お気に入り';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ja extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '選択';
  @override
  String files({required Object files}) => 'ファイル数: ${files}';
  @override
  String size({required Object size}) => 'サイズ: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$ja extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ファイル';
  @override
  String get folder => 'フォルダー';
  @override
  String get media => 'メディア';
  @override
  String get text => 'テキスト';
  @override
  String get app => 'アプリ';
  @override
  String get clipboard => 'ペースト';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$ja extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get single => '一対一送信';
  @override
  String get multiple => '一対多送信';
  @override
  String get link => 'リンク経由で共有';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$ja extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  String get brightness => '明るさ';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ja brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ja._(
    _root,
  );
  @override
  String get color => 'カラー';
  @override
  late final _Translations$settingsTab$general$colorOptions$ja colorOptions = _Translations$settingsTab$general$colorOptions$ja._(_root);
  @override
  String get language => '言語';
  @override
  late final _Translations$settingsTab$general$languageOptions$ja languageOptions = _Translations$settingsTab$general$languageOptions$ja._(_root);
  @override
  String get saveWindowPlacement => '終了時: ウィンドウ配置を記憶';
  @override
  String get saveWindowPlacementWindows => '終了時にウィンドウ配置を記憶';
  @override
  String get minimizeToTray => '終了時: トレイに最小化';
  @override
  String get launchAtStartup => 'ログイン時に自動で起動';
  @override
  String get launchMinimized => '自動起動時: 隠れた状態で開始';
  @override
  String get showInContextMenu => 'コンテキストメニューにLocalSendを表示';
  @override
  String get animations => 'アニメーション';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$ja extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '受信';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => '自動で完了';
  @override
  String get destination => '保存先';
  @override
  String get downloads => '(ダウンロード)';
  @override
  String get saveToGallery => 'メディアをギャラリーに保存';
  @override
  String get saveToHistory => '履歴に保存';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$ja extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '送信';
  @override
  String get shareViaLinkAutoAccept => 'リンク経由で共有時: 自動で承諾';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ja extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ネットワーク';
  @override
  String get needRestart => '設定を反映するにはサーバーを再起動してください！';
  @override
  String get server => 'サーバー';
  @override
  String get alias => '別名';
  @override
  String get deviceType => 'デバイスタイプ';
  @override
  String get deviceModel => 'デバイスモデル';
  @override
  String get port => 'ポート';
  @override
  String get discoveryTimeout => '探索がタイムアウトしました';
  @override
  String get useSystemName => 'システム名を使用';
  @override
  String get generateRandomAlias => 'ランダムな別名を生成';
  @override
  String portWarning({required Object defaultPort}) => 'ポートが変更されているため、このデバイスが他のデバイスから検出されなくなる場合があります。(デフォルト: ${defaultPort})';
  @override
  String get encryption => '暗号化';
  @override
  String get multicastGroup => 'マルチキャスト';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) => 'マルチキャストアドレスが変更されているため、他のデバイスから検出されなくなる場合があります。(デフォルト: ${defaultMulticast})';
  @override
  String get network => 'ネットワーク';
  @override
  late final _Translations$settingsTab$network$networkOptions$ja networkOptions = _Translations$settingsTab$network$networkOptions$ja._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ja extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'その他';
  @override
  String get support => 'LocalSendを支援';
  @override
  String get donate => '寄付';
  @override
  String get privacyPolicy => 'プライバシーポリシー';
  @override
  String get termsOfUse => '利用規約';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$ja extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'このアプリから他のデバイスへはファイルを送信できるのに、他のデバイスからこのデバイスへはファイルが送信できない。';
  @override
  String solution({required Object port}) => 'ファイアウォールに問題があると思われます。ポート ${port} の受け入れ (UDPとTCP) を許可することでこの問題を解決できます。';
  @override
  String get openFirewall => 'ファイアウォールを開く';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ja extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'このデバイスで他のデバイスを見つけられない。';
  @override
  String get solution =>
      'すべてのデバイスが同じWi-Fiネットワーク上にあり、各種設定(ポート、マルチキャストアドレス、暗号化)が一致していることを確認してください。もしくは、送信先デバイスのIPアドレスを手動で入力することもできます。これでうまくいく場合は、そのデバイスをお気に入りに追加して、今後自動的に検出できるようにすることもご検討ください。';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ja extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'どちらのデバイスも互いに表示されず、ファイルも共有できない。';
  @override
  String get solution =>
      '双方で問題が発生している場合は、両方のデバイスが同じWi-Fiネットワーク上にあり、ポート・マルチキャストアドレス・暗号化の設定が一致していることを確認してください。Wi-Fiネットワークが接続者同士の通信を許可していない可能性もあります。その場合は、ルーターの設定でそれを許可する必要があります。';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ja extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ファイルを開く';
  @override
  String get showInFolder => 'フォルダーに表示';
  @override
  String get info => '情報';
  @override
  String get deleteFromHistory => '履歴から削除';
}

// Path: progressPage.total
class _Translations$progressPage$total$ja extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ja title = _Translations$progressPage$total$title$ja._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ファイル: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'サイズ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => '速度: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ja extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '選択に追加';
  @override
  String get content => '何を追加しますか？';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ja extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルを開く';
  @override
  String get content => '受信したファイルを開きますか？';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ja extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アドレスを入力';
  @override
  String get hashtag => 'ハッシュタグ';
  @override
  String get ip => 'IPアドレス';
  @override
  String get recentlyUsed => '最近使用したアドレス: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$ja extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイル転送をキャンセル';
  @override
  String get content => '本当にファイル転送をキャンセルしますか？';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ja extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルを開けません';
  @override
  String content({required Object file}) => '"${file}"を開けませんでした。ファイルが移動、改名、削除された可能性があります。';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ja extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '暗号化は無効です';
  @override
  String get content => 'これより、通信は暗号化されていないHTTPプロトコルで行われます。HTTPSを使用するには、暗号化を再度有効にしてください。';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ja extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ja extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お気に入り';
  @override
  String get noFavorites => 'お気に入りしたデバイスがありません。';
  @override
  String get addFavorite => '追加';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$ja extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お気に入りから削除';
  @override
  String content({required Object name}) => '本当に"${name}"をお気に入りから削除しますか？';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ja extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'お気に入りに追加';
  @override
  String get titleEdit => '編集';
  @override
  String get name => '別名';
  @override
  String get auto => '(自動)';
  @override
  String get ip => 'IPアドレス';
  @override
  String get port => 'ポート';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$ja extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルの情報';
  @override
  String get fileName => 'ファイル名:';
  @override
  String get path => 'ファイルパス:';
  @override
  String get size => 'サイズ:';
  @override
  String get sender => '送信者:';
  @override
  String get time => '時間:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$ja extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイル名を入力';
  @override
  String original({required Object original}) => '元の名前: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ja extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '履歴をクリア';
  @override
  String get content => '本当にすべての履歴を削除しますか？';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ja extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'ローカルネットワークをスキャンする権限がないと、LocalSendは他のデバイスを見つけることができません。設定よりこの権限を付与してください。';
  @override
  String get gotoSettings => '設定';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ja extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'メッセージを入力';
  @override
  String get multiline => '複数行';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ja extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルが選択されていません';
  @override
  String get content => '少なくとも1つのファイルを選択してください。';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ja extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '権限がありません';
  @override
  String get content => '必要な権限を許可していません。設定で許可してください。';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ja extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '利用不可';
  @override
  String get content => 'この機能は次のプラットフォームでのみ利用できます:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ja extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QRコード';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ja extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'クイックアクション';
  @override
  String get counter => 'カウンター';
  @override
  String get prefix => '接頭辞';
  @override
  String get padZero => '先頭をゼロで埋める';
  @override
  String get sortBeforeCount => '事前にアルファベット順で並べる';
  @override
  String get random => 'ランダム';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$ja extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ファイルリクエストが自動で承諾されます。ローカルネットワーク内の全員がファイルを送信できるので注意してください。';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ja extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'お気に入りリストにあるデバイスからのファイルリクエストを自動的に受け入れます。',
    '警告 現時点では、お気に入りリストのデバイスと一致するフィンガープリントがあればハッカーが無制限にファイルを送信できてしまうため、この設定は完全に安全とは言えません。',
    'ですが、この設定はローカルネットワーク上のすべてのユーザーに無制限のファイル送信を許可するよりはまだ安全です。',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$ja extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PINコードを入力';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ja extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '送信モード';
  @override
  String get single => '単一の受信者にファイルを送信します。ファイルの転送完了後、選択は解除されます。';
  @override
  String get multiple => '複数の受信者にファイルを送信します。ファイルの選択は解除されません。';
  @override
  String get link => 'LocalSendをインストールしていない受信者でも、ブラウザでリンクを開くことで選択したファイルをダウンロードできます。';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ja extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ja extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'システム';
  @override
  String get dark => 'ダーク';
  @override
  String get light => 'ライト';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$ja extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'システム';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ja extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'システム';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ja extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'すべて';
  @override
  String get filtered => 'フィルター';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ja extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ja._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => '総進捗 (${time})';
  @override
  String get finishedError => 'エラーで終了しました';
  @override
  String get canceledSender => '送信者によりキャンセルされました';
  @override
  String get canceledReceiver => '受信者よりキャンセルされました';
}
