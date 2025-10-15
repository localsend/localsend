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
class TranslationsJa extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => '日本語';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralJa general = _TranslationsGeneralJa._(_root);
  @override
  late final _TranslationsReceiveTabJa receiveTab = _TranslationsReceiveTabJa._(_root);
  @override
  late final _TranslationsSendTabJa sendTab = _TranslationsSendTabJa._(_root);
  @override
  late final _TranslationsSettingsTabJa settingsTab = _TranslationsSettingsTabJa._(_root);
  @override
  late final _TranslationsTroubleshootPageJa troubleshootPage = _TranslationsTroubleshootPageJa._(_root);
  @override
  late final _TranslationsReceiveHistoryPageJa receiveHistoryPage = _TranslationsReceiveHistoryPageJa._(_root);
  @override
  late final _TranslationsApkPickerPageJa apkPickerPage = _TranslationsApkPickerPageJa._(_root);
  @override
  late final _TranslationsSelectedFilesPageJa selectedFilesPage = _TranslationsSelectedFilesPageJa._(_root);
  @override
  late final _TranslationsReceivePageJa receivePage = _TranslationsReceivePageJa._(_root);
  @override
  late final _TranslationsReceiveOptionsPageJa receiveOptionsPage = _TranslationsReceiveOptionsPageJa._(_root);
  @override
  late final _TranslationsSendPageJa sendPage = _TranslationsSendPageJa._(_root);
  @override
  late final _TranslationsProgressPageJa progressPage = _TranslationsProgressPageJa._(_root);
  @override
  late final _TranslationsWebSharePageJa webSharePage = _TranslationsWebSharePageJa._(_root);
  @override
  late final _TranslationsAboutPageJa aboutPage = _TranslationsAboutPageJa._(_root);
  @override
  late final _TranslationsDonationPageJa donationPage = _TranslationsDonationPageJa._(_root);
  @override
  late final _TranslationsChangelogPageJa changelogPage = _TranslationsChangelogPageJa._(_root);
  @override
  late final _TranslationsAliasGeneratorJa aliasGenerator = _TranslationsAliasGeneratorJa._(_root);
  @override
  late final _TranslationsDialogsJa dialogs = _TranslationsDialogsJa._(_root);
  @override
  late final _TranslationsSanitizationJa sanitization = _TranslationsSanitizationJa._(_root);
  @override
  late final _TranslationsTrayJa tray = _TranslationsTrayJa._(_root);
  @override
  late final _TranslationsWebJa web = _TranslationsWebJa._(_root);
  @override
  late final _TranslationsAssetPickerJa assetPicker = _TranslationsAssetPickerJa._(_root);
}

// Path: general
class _TranslationsGeneralJa extends TranslationsGeneralEn {
  _TranslationsGeneralJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabJa extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '受信';
  @override
  late final _TranslationsReceiveTabInfoBoxJa infoBox = _TranslationsReceiveTabInfoBoxJa._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveJa quickSave = _TranslationsReceiveTabQuickSaveJa._(_root);
}

// Path: sendTab
class _TranslationsSendTabJa extends TranslationsSendTabEn {
  _TranslationsSendTabJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '送信';
  @override
  late final _TranslationsSendTabSelectionJa selection = _TranslationsSendTabSelectionJa._(_root);
  @override
  late final _TranslationsSendTabPickerJa picker = _TranslationsSendTabPickerJa._(_root);
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
  late final _TranslationsSendTabSendModesJa sendModes = _TranslationsSendTabSendModesJa._(_root);
  @override
  String get sendModeHelp => '説明';
  @override
  String get help => '目標のデバイスが同じWi-Fiネットワーク内にあることを確認してください。';
  @override
  String get placeItems => '共有するアイテムを配置してください。';
}

// Path: settingsTab
class _TranslationsSettingsTabJa extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '設定';
  @override
  late final _TranslationsSettingsTabGeneralJa general = _TranslationsSettingsTabGeneralJa._(_root);
  @override
  late final _TranslationsSettingsTabReceiveJa receive = _TranslationsSettingsTabReceiveJa._(_root);
  @override
  late final _TranslationsSettingsTabSendJa send = _TranslationsSettingsTabSendJa._(_root);
  @override
  late final _TranslationsSettingsTabNetworkJa network = _TranslationsSettingsTabNetworkJa._(_root);
  @override
  late final _TranslationsSettingsTabOtherJa other = _TranslationsSettingsTabOtherJa._(_root);
  @override
  String get advancedSettings => '詳細設定';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageJa extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallJa firewall = _TranslationsTroubleshootPageFirewallJa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryJa noDiscovery = _TranslationsTroubleshootPageNoDiscoveryJa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionJa noConnection = _TranslationsTroubleshootPageNoConnectionJa._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageJa extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsJa entryActions = _TranslationsReceiveHistoryPageEntryActionsJa._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageJa extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageJa extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'すべて削除';
}

// Path: receivePage
class _TranslationsReceivePageJa extends TranslationsReceivePageEn {
  _TranslationsReceivePageJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n, one: 'がファイルを送信しようとしています。', other: 'が ${n} 件のファイルを送信しようとしています。');
  @override
  String get subTitleMessage => 'がメッセージを送信しました:';
  @override
  String get subTitleLink => 'がリンクを送信しました:';
  @override
  String get canceled => '送信者がリクエストをキャンセルしました。';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageJa extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageJa extends TranslationsSendPageEn {
  _TranslationsSendPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageJa extends TranslationsProgressPageEn {
  _TranslationsProgressPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ファイルを送信中';
  @override
  String get titleReceiving => 'ファイルを受信中';
  @override
  String get savedToGallery => '写真に保存しました';
  @override
  late final _TranslationsProgressPageTotalJa total = _TranslationsProgressPageTotalJa._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageJa extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
  String openLink({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n, one: 'このリンクをブラウザーで開いてください:', other: 'これらのリンクのいずれかをブラウザーで開いてください:');
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
class _TranslationsAboutPageJa extends TranslationsAboutPageEn {
  _TranslationsAboutPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageJa extends TranslationsDonationPageEn {
  _TranslationsDonationPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageJa extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '更新履歴';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorJa extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsJa extends TranslationsDialogsEn {
  _TranslationsDialogsJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileJa addFile = _TranslationsDialogsAddFileJa._(_root);
  @override
  late final _TranslationsDialogsOpenFileJa openFile = _TranslationsDialogsOpenFileJa._(_root);
  @override
  late final _TranslationsDialogsAddressInputJa addressInput = _TranslationsDialogsAddressInputJa._(_root);
  @override
  late final _TranslationsDialogsCancelSessionJa cancelSession = _TranslationsDialogsCancelSessionJa._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileJa cannotOpenFile = _TranslationsDialogsCannotOpenFileJa._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeJa encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeJa._(_root);
  @override
  late final _TranslationsDialogsErrorDialogJa errorDialog = _TranslationsDialogsErrorDialogJa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogJa favoriteDialog = _TranslationsDialogsFavoriteDialogJa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogJa favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogJa._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogJa favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogJa._(_root);
  @override
  late final _TranslationsDialogsFileInfoJa fileInfo = _TranslationsDialogsFileInfoJa._(_root);
  @override
  late final _TranslationsDialogsFileNameInputJa fileNameInput = _TranslationsDialogsFileNameInputJa._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogJa historyClearDialog = _TranslationsDialogsHistoryClearDialogJa._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedJa localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedJa._(_root);
  @override
  late final _TranslationsDialogsMessageInputJa messageInput = _TranslationsDialogsMessageInputJa._(_root);
  @override
  late final _TranslationsDialogsNoFilesJa noFiles = _TranslationsDialogsNoFilesJa._(_root);
  @override
  late final _TranslationsDialogsNoPermissionJa noPermission = _TranslationsDialogsNoPermissionJa._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformJa notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformJa._(_root);
  @override
  late final _TranslationsDialogsQrJa qr = _TranslationsDialogsQrJa._(_root);
  @override
  late final _TranslationsDialogsQuickActionsJa quickActions = _TranslationsDialogsQuickActionsJa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeJa quickSaveNotice = _TranslationsDialogsQuickSaveNoticeJa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeJa quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeJa._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinJa pin = _TranslationsDialogsPinJa._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpJa sendModeHelp = _TranslationsDialogsSendModeHelpJa._(_root);
  @override
  late final _TranslationsDialogsZoomJa zoom = _TranslationsDialogsZoomJa._(_root);
}

// Path: sanitization
class _TranslationsSanitizationJa extends TranslationsSanitizationEn {
  _TranslationsSanitizationJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ファイル名は空にできません';
  @override
  String get invalid => 'ファイル名に無効な文字が含まれています';
}

// Path: tray
class _TranslationsTrayJa extends TranslationsTrayEn {
  _TranslationsTrayJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsWebJa extends TranslationsWebEn {
  _TranslationsWebJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerJa extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerJa._(TranslationsJa root) : this._root = root, super.internal(root);

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

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxJa extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveJa extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionJa extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerJa extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesJa extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralJa extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  String get brightness => '明るさ';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsJa brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsJa._(_root);
  @override
  String get color => 'カラー';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsJa colorOptions = _TranslationsSettingsTabGeneralColorOptionsJa._(_root);
  @override
  String get language => '言語';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsJa languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsJa._(_root);
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
class _TranslationsSettingsTabReceiveJa extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendJa extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '送信';
  @override
  String get shareViaLinkAutoAccept => 'リンク経由で共有時: 自動で承諾';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkJa extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherJa extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallJa extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'このアプリから他のデバイスへはファイルを送信できるのに、他のデバイスからこのデバイスへはファイルが送信できない。';
  @override
  String solution({required Object port}) => 'ファイアウォールに問題があると思われます。ポート ${port} の受け入れ (UDPとTCP) を許可することでこの問題を解決できます。';
  @override
  String get openFirewallSettings => 'ファイアウォールを開く';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryJa extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'このデバイスで他のデバイスを見つけられない。';
  @override
  String get solution =>
      'すべてのデバイスが同じWi-Fiネットワーク上にあり、各種設定(ポート、マルチキャストアドレス、暗号化)が一致していることを確認してください。もしくは、送信先デバイスのIPアドレスを手動で入力することもできます。これでうまくいく場合は、そのデバイスをお気に入りに追加して、今後自動的に検出できるようにすることもご検討ください。';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionJa extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'どちらのデバイスも互いに表示されず、ファイルも共有できない。';
  @override
  String get solution =>
      '双方で問題が発生している場合は、両方のデバイスが同じWi-Fiネットワーク上にあり、ポート・マルチキャストアドレス・暗号化の設定が一致していることを確認してください。Wi-Fiネットワークが接続者同士の通信を許可していない可能性もあります。その場合は、ルーターの設定でそれを許可する必要があります。';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsJa extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalJa extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleJa title = _TranslationsProgressPageTotalTitleJa._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ファイル: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'サイズ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => '速度: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileJa extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '選択に追加';
  @override
  String get content => '何を追加しますか？';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileJa extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルを開く';
  @override
  String get content => '受信したファイルを開きますか？';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputJa extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionJa extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイル転送をキャンセル';
  @override
  String get content => '本当にファイル転送をキャンセルしますか？';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileJa extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルを開けません';
  @override
  String content({required Object file}) => '"${file}"を開けませんでした。ファイルが移動、改名、削除された可能性があります。';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeJa extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '暗号化は無効です';
  @override
  String get content => 'これより、通信は暗号化されていないHTTPプロトコルで行われます。HTTPSを使用するには、暗号化を再度有効にしてください。';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogJa extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogJa extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogJa extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お気に入りから削除';
  @override
  String content({required Object name}) => '本当に"${name}"をお気に入りから削除しますか？';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogJa extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoJa extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputJa extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイル名を入力';
  @override
  String original({required Object original}) => '元の名前: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogJa extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '履歴をクリア';
  @override
  String get content => '本当にすべての履歴を削除しますか？';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedJa extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputJa extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'メッセージを入力';
  @override
  String get multiline => '複数行';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesJa extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ファイルが選択されていません';
  @override
  String get content => '少なくとも1つのファイルを選択してください。';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionJa extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '権限がありません';
  @override
  String get content => '必要な権限を許可していません。設定で許可してください。';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformJa extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '利用不可';
  @override
  String get content => 'この機能は次のプラットフォームでのみ利用できます:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrJa extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QRコード';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsJa extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeJa extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ファイルリクエストが自動で承諾されます。ローカルネットワーク内の全員がファイルを送信できるので注意してください。';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeJa extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinJa extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PINコードを入力';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpJa extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomJa extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsJa extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsJa extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'システム';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsJa extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'システム';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleJa extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleJa._(TranslationsJa root) : this._root = root, super.internal(root);

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
