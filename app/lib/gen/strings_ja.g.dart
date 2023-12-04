part of 'strings.g.dart';

// Path: <root>
class _StringsJa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override String get locale => '日本語';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralJa general = _StringsGeneralJa._(_root);
	@override late final _StringsReceiveTabJa receiveTab = _StringsReceiveTabJa._(_root);
	@override late final _StringsSendTabJa sendTab = _StringsSendTabJa._(_root);
	@override late final _StringsSettingsTabJa settingsTab = _StringsSettingsTabJa._(_root);
	@override late final _StringsTroubleshootPageJa troubleshootPage = _StringsTroubleshootPageJa._(_root);
	@override late final _StringsReceiveHistoryPageJa receiveHistoryPage = _StringsReceiveHistoryPageJa._(_root);
	@override late final _StringsApkPickerPageJa apkPickerPage = _StringsApkPickerPageJa._(_root);
	@override late final _StringsSelectedFilesPageJa selectedFilesPage = _StringsSelectedFilesPageJa._(_root);
	@override late final _StringsReceivePageJa receivePage = _StringsReceivePageJa._(_root);
	@override late final _StringsReceiveOptionsPageJa receiveOptionsPage = _StringsReceiveOptionsPageJa._(_root);
	@override late final _StringsSendPageJa sendPage = _StringsSendPageJa._(_root);
	@override late final _StringsProgressPageJa progressPage = _StringsProgressPageJa._(_root);
	@override late final _StringsWebSharePageJa webSharePage = _StringsWebSharePageJa._(_root);
	@override late final _StringsAboutPageJa aboutPage = _StringsAboutPageJa._(_root);
	@override late final _StringsDonationPageJa donationPage = _StringsDonationPageJa._(_root);
	@override late final _StringsChangelogPageJa changelogPage = _StringsChangelogPageJa._(_root);
	@override late final _StringsAliasGeneratorJa aliasGenerator = _StringsAliasGeneratorJa._(_root);
	@override late final _StringsDialogsJa dialogs = _StringsDialogsJa._(_root);
	@override late final _StringsTrayJa tray = _StringsTrayJa._(_root);
	@override late final _StringsWebJa web = _StringsWebJa._(_root);
	@override late final _StringsAssetPickerJa assetPicker = _StringsAssetPickerJa._(_root);
}

// Path: general
class _StringsGeneralJa extends _StringsGeneralEn {
	_StringsGeneralJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get accept => '承諾';
	@override String get accepted => '承諾済み';
	@override String get add => '追加';
	@override String get advanced => '詳細';
	@override String get cancel => 'キャンセル';
	@override String get close => '閉じる';
	@override String get confirm => '確認';
	@override String get continueStr => '続行';
	@override String get copy => 'コピー';
	@override String get copiedToClipboard => 'クリップボードにコピーしました';
	@override String get decline => '拒否';
	@override String get done => '完了';
	@override String get delete => '削除';
	@override String get edit => '編集';
	@override String get error => 'エラー';
	@override String get example => '例';
	@override String get files => 'ファイル';
	@override String get finished => '完了しました';
	@override String get hide => '隠す';
	@override String get off => 'オフ';
	@override String get offline => 'オフライン';
	@override String get on => 'オン';
	@override String get online => 'オンライン';
	@override String get open => '開く';
	@override String get queue => '順番待ち';
	@override String get quickSave => 'クイックセーブ';
	@override String get renamed => '改名済み';
	@override String get reset => 'リセット';
	@override String get restart => '再起動';
	@override String get settings => '設定';
	@override String get skipped => 'スキップ済み';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get save => '保存';
	@override String get unchanged => '未変更';
	@override String get unknown => '不明';
	@override String get noItemInClipboard => 'クリップボードにアイテムがありません';
}

// Path: receiveTab
class _StringsReceiveTabJa extends _StringsReceiveTabEn {
	_StringsReceiveTabJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '受信';
	@override late final _StringsReceiveTabInfoBoxJa infoBox = _StringsReceiveTabInfoBoxJa._(_root);
}

// Path: sendTab
class _StringsSendTabJa extends _StringsSendTabEn {
	_StringsSendTabJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '送信';
	@override late final _StringsSendTabSelectionJa selection = _StringsSendTabSelectionJa._(_root);
	@override late final _StringsSendTabPickerJa picker = _StringsSendTabPickerJa._(_root);
	@override String get shareIntentInfo => 'モバイルデバイスの「共有」機能を使うと、より簡単にファイルを選択できます。';
	@override String get nearbyDevices => '近くのデバイス';
	@override String get thisDevice => 'このデバイス';
	@override String get scan => 'デバイスを検索';
	@override String get sendMode => '送信モード';
	@override late final _StringsSendTabSendModesJa sendModes = _StringsSendTabSendModesJa._(_root);
	@override String get sendModeHelp => '説明';
	@override String get help => '目標のデバイスが同じWi-Fiネットワーク内にあることを確認してください。';
	@override String get placeItems => 'ドロップして共有します。';
}

// Path: settingsTab
class _StringsSettingsTabJa extends _StringsSettingsTabEn {
	_StringsSettingsTabJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override late final _StringsSettingsTabGeneralJa general = _StringsSettingsTabGeneralJa._(_root);
	@override late final _StringsSettingsTabReceiveJa receive = _StringsSettingsTabReceiveJa._(_root);
	@override late final _StringsSettingsTabNetworkJa network = _StringsSettingsTabNetworkJa._(_root);
	@override late final _StringsSettingsTabOtherJa other = _StringsSettingsTabOtherJa._(_root);
	@override String get advancedSettings => '詳細設定';
}

// Path: troubleshootPage
class _StringsTroubleshootPageJa extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'トラブルシューティング';
	@override String get subTitle => 'アプリが期待通りに動作しませんか？ここでは一般的な解決策を紹介します。';
	@override String get solution => '解決策:';
	@override String get fixButton => '自動で修正する';
	@override late final _StringsTroubleshootPageFirewallJa firewall = _StringsTroubleshootPageFirewallJa._(_root);
	@override late final _StringsTroubleshootPageNoConnectionJa noConnection = _StringsTroubleshootPageNoConnectionJa._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageJa extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '履歴';
	@override String get openFolder => 'フォルダを開く';
	@override String get deleteHistory => '履歴を消去';
	@override String get empty => '履歴には何もありません。';
	@override late final _StringsReceiveHistoryPageEntryActionsJa entryActions = _StringsReceiveHistoryPageEntryActionsJa._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageJa extends _StringsApkPickerPageEn {
	_StringsApkPickerPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリ (APK)';
	@override String get excludeSystemApps => 'システムアプリを除外';
	@override String get excludeAppsWithoutLaunchIntent => '起動できないアプリを除外';
	@override String apps({required Object n}) => '${n} 個';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageJa extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'すべて削除';
}

// Path: receivePage
class _StringsReceivePageJa extends _StringsReceivePageEn {
	_StringsReceivePageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
		one: 'がファイルを送信しようとしています。',
		other: 'が${n}件のファイルを送信しようとしています。',
	);
	@override String get subTitleMessage => 'がメッセージを送信しました:';
	@override String get subTitleLink => 'がリンクを送信しました:';
	@override String get canceled => '送信者がリクエストをキャンセルしました。';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageJa extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'オプション';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend フォルダー)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'ディレクトリーがあるため自動で無効になっています。';
}

// Path: sendPage
class _StringsSendPageJa extends _StringsSendPageEn {
	_StringsSendPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get waiting => '返答を待っています...';
	@override String get rejected => '受信者がリクエストを拒否しました。';
	@override String get busy => '受信者は他のリクエストでビジー状態です。';
}

// Path: progressPage
class _StringsProgressPageJa extends _StringsProgressPageEn {
	_StringsProgressPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'ファイルを送信中';
	@override String get titleReceiving => 'ファイルを受信中';
	@override String get savedToGallery => '写真に保存しました';
	@override late final _StringsProgressPageTotalJa total = _StringsProgressPageTotalJa._(_root);
}

// Path: webSharePage
class _StringsWebSharePageJa extends _StringsWebSharePageEn {
	_StringsWebSharePageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'リンク経由で共有';
	@override String get loading => 'サーバーを起動中...';
	@override String get stopping => 'サーバーを停止中...';
	@override String get error => 'サーバーの起動中にエラーが発生しました。';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
		one: 'このリンクをブラウザーで開いてください:',
		other: 'これらのリンクのいずれかをブラウザーで開いてください:',
	);
	@override String get requests => 'リクエスト';
	@override String get noRequests => 'リクエストはまだありません。';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSendは自己署名証明書を使用しています。ブラウザでそれを受け入れる必要があります。';
	@override String pendingRequests({required Object n}) => '保留中のリクエスト数: ${n}';
}

// Path: aboutPage
class _StringsAboutPageJa extends _StringsAboutPageEn {
	_StringsAboutPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSendについて';
	@override List<String> get description => [
		'LocalSendは無料のオープンソースアプリで、インターネットに接続することなく、ローカルネットワーク経由で近くにあるデバイスとファイルやメッセージを安全に共有することができます。',
		'本アプリはAndroid、iOS、macOS、Windows、Linuxで利用でき、公式ホームページからダウンロードすることができます。',
	];
	@override String get author => '著者';
	@override String get contributors => '貢献者';
	@override String get translators => '翻訳者';
}

// Path: donationPage
class _StringsDonationPageJa extends _StringsDonationPageEn {
	_StringsDonationPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '寄付';
	@override String get info => 'LocalSendは無料かつオープンソースで、広告を一切含みません。もしアプリを気に入っていただけたら、寄付で開発をサポートすることができます。';
	@override String donate({required Object amount}) => '${amount} 寄付する';
	@override String get thanks => 'ありがとうございます！';
	@override String get restore => '購入を復元する';
}

// Path: changelogPage
class _StringsChangelogPageJa extends _StringsChangelogPageEn {
	_StringsChangelogPageJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '更新履歴';
}

// Path: aliasGenerator
class _StringsAliasGeneratorJa extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsJa extends _StringsDialogsEn {
	_StringsDialogsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileJa addFile = _StringsDialogsAddFileJa._(_root);
	@override late final _StringsDialogsAddressInputJa addressInput = _StringsDialogsAddressInputJa._(_root);
	@override late final _StringsDialogsCancelSessionJa cancelSession = _StringsDialogsCancelSessionJa._(_root);
	@override late final _StringsDialogsCannotOpenFileJa cannotOpenFile = _StringsDialogsCannotOpenFileJa._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeJa encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeJa._(_root);
	@override late final _StringsDialogsErrorDialogJa errorDialog = _StringsDialogsErrorDialogJa._(_root);
	@override late final _StringsDialogsFavoriteDialogJa favoriteDialog = _StringsDialogsFavoriteDialogJa._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogJa favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogJa._(_root);
	@override late final _StringsDialogsFavoriteEditDialogJa favoriteEditDialog = _StringsDialogsFavoriteEditDialogJa._(_root);
	@override late final _StringsDialogsFileInfoJa fileInfo = _StringsDialogsFileInfoJa._(_root);
	@override late final _StringsDialogsFileNameInputJa fileNameInput = _StringsDialogsFileNameInputJa._(_root);
	@override late final _StringsDialogsHistoryClearDialogJa historyClearDialog = _StringsDialogsHistoryClearDialogJa._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedJa localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedJa._(_root);
	@override late final _StringsDialogsMessageInputJa messageInput = _StringsDialogsMessageInputJa._(_root);
	@override late final _StringsDialogsNoFilesJa noFiles = _StringsDialogsNoFilesJa._(_root);
	@override late final _StringsDialogsNoPermissionJa noPermission = _StringsDialogsNoPermissionJa._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformJa notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformJa._(_root);
	@override late final _StringsDialogsQrJa qr = _StringsDialogsQrJa._(_root);
	@override late final _StringsDialogsQuickActionsJa quickActions = _StringsDialogsQuickActionsJa._(_root);
	@override late final _StringsDialogsQuickSaveNoticeJa quickSaveNotice = _StringsDialogsQuickSaveNoticeJa._(_root);
	@override late final _StringsDialogsSendModeHelpJa sendModeHelp = _StringsDialogsSendModeHelpJa._(_root);
}

// Path: tray
class _StringsTrayJa extends _StringsTrayEn {
	_StringsTrayJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSendを終了';
}

// Path: web
class _StringsWebJa extends _StringsWebEn {
	_StringsWebJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => '拒否済み';
	@override String get files => 'ファイル';
	@override String get fileName => 'ファイル名';
	@override String get size => 'サイズ';
}

// Path: assetPicker
class _StringsAssetPickerJa extends _StringsAssetPickerEn {
	_StringsAssetPickerJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get confirm => '確認';
	@override String get cancel => 'キャンセル';
	@override String get edit => '編集';
	@override String get gifIndicator => 'GIF画像';
	@override String get loadFailed => '読み込みに失敗しました';
	@override String get original => '元の画像';
	@override String get preview => 'プレビュー';
	@override String get select => '選択';
	@override String get emptyList => 'リストが空です';
	@override String get unSupportedAssetType => '未対応のフォーマットです。';
	@override String get unableToAccessAll => 'デバイス内のすべてのファイルにアクセスすることができません';
	@override String get viewingLimitedAssetsTip => 'アプリからアクセスできるファイルやアルバムのみを表示します。';
	@override String get changeAccessibleLimitedAssets => 'クリックしてアクセスできるファイルを設定する';
	@override String get accessAllTip => 'アプリが端末の一部のファイルにしかアクセスできません。システム設定を開き、アプリがデバイス上のすべてのメディアにアクセスすることを許可してください。';
	@override String get goToSystemSettings => 'システム設定に移動';
	@override String get accessLimitedAssets => '限られたアクセスで続ける';
	@override String get accessiblePathName => 'アクセス可能なファイル';
	@override String get sTypeAudioLabel => '音声';
	@override String get sTypeImageLabel => '画像';
	@override String get sTypeVideoLabel => '動画';
	@override String get sTypeOtherLabel => 'その他のメディア';
	@override String get sActionPlayHint => '再生';
	@override String get sActionPreviewHint => 'プレビュー';
	@override String get sActionSelectHint => '選択';
	@override String get sActionSwitchPathLabel => 'パスを切り替え';
	@override String get sActionUseCameraHint => 'カメラを使う';
	@override String get sNameDurationLabel => '長さ';
	@override String get sUnitAssetCountLabel => '数';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxJa extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'ポート:';
	@override String get alias => 'エイリアス:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionJa extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '選択';
	@override String files({required Object files}) => 'ファイル数: ${files}';
	@override String size({required Object size}) => 'サイズ: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerJa extends _StringsSendTabPickerEn {
	_StringsSendTabPickerJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get file => 'ファイル';
	@override String get folder => 'フォルダー';
	@override String get media => 'メディア';
	@override String get text => 'テキスト';
	@override String get app => 'アプリ';
	@override String get clipboard => 'ペースト';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesJa extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get single => '一対一送信';
	@override String get multiple => '一対多送信';
	@override String get link => 'リンク経由で共有';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralJa extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '一般';
	@override String get brightness => '明るさ';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsJa brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsJa._(_root);
	@override String get color => 'カラー';
	@override late final _StringsSettingsTabGeneralColorOptionsJa colorOptions = _StringsSettingsTabGeneralColorOptionsJa._(_root);
	@override String get language => '言語';
	@override late final _StringsSettingsTabGeneralLanguageOptionsJa languageOptions = _StringsSettingsTabGeneralLanguageOptionsJa._(_root);
	@override String get saveWindowPlacement => '終了時: ウィンドウ配置を記憶';
	@override String get minimizeToTray => '終了時: トレイに最小化';
	@override String get launchAtStartup => 'ログイン時に自動起動';
	@override String get launchMinimized => '自動起動時: 隠れた状態で開始';
	@override String get animations => 'アニメーション';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveJa extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '受信';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => '自動で完了';
	@override String get destination => '保存先';
	@override String get downloads => '(ダウンロード)';
	@override String get saveToGallery => 'メディアをギャラリーに保存';
	@override String get saveToHistory => '履歴に保存';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkJa extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ネットワーク';
	@override String get needRestart => '設定を反映するにはサーバーを再起動してください！';
	@override String get server => 'サーバー';
	@override String get alias => 'エイリアス';
	@override String get deviceType => 'デバイスタイプ';
	@override String get deviceModel => 'デバイスモデル';
	@override String get port => 'ポート';
	@override String portWarning({required Object defaultPort}) => 'カスタムポートを使用すると、このデバイスが他のデバイスから検出されない場合があります。(デフォルト: ${defaultPort})';
	@override String get encryption => '暗号化';
	@override String get multicastGroup => 'マルチキャスト';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'カスタムのマルチキャストアドレスを使用しているため、他のデバイスから検出されない場合があります。(デフォルト: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherJa extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'その他';
	@override String get support => 'LocalSendを支援';
	@override String get donate => '寄付';
	@override String get privacyPolicy => 'プライバシーポリシー';
	@override String get termsOfUse => '利用規約';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallJa extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'このアプリから他のデバイスへはファイルを送信できるのに、他のデバイスからこのデバイスへはファイルが送信できない。';
	@override String solution({required Object port}) => 'ファイアウォールに問題があると思われます。ポート${port}の受け入れ(UDPとTCP)を許可することでこの問題を解決できます。';
	@override String get openFirewall => 'ファイアウォールを開く';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionJa extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'どちらのデバイスも互いに表示されず、ファイルも共有できない。';
	@override String get solution => '双方で問題が発生している場合は、両方のデバイスが同じWi-Fiネットワーク上にあり、同じ設定(ポート、マルチキャストアドレス、暗号化)を共有していることを確認してください。Wi-Fiが接続者同士の通信を許可していない可能性もあります。その場合は、ルーターの設定でそれを許可する必要があります。';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsJa extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get open => 'ファイルを開く';
	@override String get info => '情報';
	@override String get deleteFromHistory => '履歴から削除';
}

// Path: progressPage.total
class _StringsProgressPageTotalJa extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleJa title = _StringsProgressPageTotalTitleJa._(_root);
	@override String count({required Object curr, required Object n}) => 'ファイル: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'サイズ: ${curr} / ${n}';
	@override String speed({required Object speed}) => '速度: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileJa extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '選択に追加';
	@override String get content => '何を追加しますか？';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputJa extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アドレスを入力';
	@override String get hashtag => 'ハッシュタグ';
	@override String get ip => 'IPアドレス';
	@override String get recentlyUsed => '最近使用したアドレス: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionJa extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイル転送をキャンセル';
	@override String get content => '本当にファイル転送をキャンセルしますか？';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileJa extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイルを開けません';
	@override String content({required Object file}) => '"${file}"を開けませんでした。ファイルが移動、改名、削除された可能性があります。';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeJa extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '暗号化は無効です';
	@override String get content => 'これより、通信は暗号化されていないHTTPプロトコルで行われます。HTTPSを使用するには、暗号化を再度有効にしてください。';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogJa extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogJa extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'お気に入り';
	@override String get noFavorites => 'お気に入りしたデバイスがありません。';
	@override String get addFavorite => '追加';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogJa extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'お気に入りから削除';
	@override String content({required Object name}) => '本当に"${name}"をお気に入りから削除しますか？';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogJa extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'お気に入りに追加';
	@override String get titleEdit => '編集';
	@override String get name => 'エイリアス';
	@override String get auto => '(自動)';
	@override String get ip => 'IPアドレス';
	@override String get port => 'ポート';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoJa extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイルの情報';
	@override String get fileName => 'ファイル名:';
	@override String get path => 'ファイルパス:';
	@override String get size => 'サイズ:';
	@override String get sender => '送信者:';
	@override String get time => '時間:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputJa extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイル名を入力';
	@override String original({required Object original}) => '元の名前: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogJa extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '履歴をクリア';
	@override String get content => '本当にすべての履歴を削除しますか？';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedJa extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'ローカルネットワークをスキャンする権限がないと、LocalSendは他のデバイスを見つけることができません。設定でこの権限を付与してください。';
	@override String get gotoSettings => '設定';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputJa extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'メッセージを入力';
	@override String get multiline => '複数行';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesJa extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイルが選択されていません';
	@override String get content => '少なくとも1つのファイルを選択してください。';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionJa extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '権限がありません';
	@override String get content => '必要な権限を許可していません。設定で許可してください。';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformJa extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '利用不可';
	@override String get content => 'この機能は次のプラットフォームでのみ利用できます:';
}

// Path: dialogs.qr
class _StringsDialogsQrJa extends _StringsDialogsQrEn {
	_StringsDialogsQrJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'QRコード';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsJa extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'クイックアクション';
	@override String get counter => 'カウンター';
	@override String get prefix => '接頭辞';
	@override String get padZero => 'ゼロで埋める';
	@override String get sortBeforeCount => '事前にアルファベット順で並べる';
	@override String get random => 'ランダム';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeJa extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'ファイルリクエストが自動で承諾されます。ローカルネットワーク内の全員がファイルを送信できるので注意してください。';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpJa extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '送信モード';
	@override String get single => '単一の受信者にファイルを送信します。ファイルの転送完了後、選択は解除されます。';
	@override String get multiple => '複数の受信者にファイルを送信します。ファイルの選択は解除されません。';
	@override String get link => 'LocalSendをインストールしていない受信者でも、ブラウザでリンクを開くことで選択したファイルをダウンロードできます。';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsJa extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
	@override String get dark => 'ダーク';
	@override String get light => 'ライト';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsJa extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsJa extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleJa extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => '総進捗 (${time})';
	@override String get finishedError => 'エラーで終了しました';
	@override String get canceledSender => '送信者によりキャンセルされました';
	@override String get canceledReceiver => '受信者よりキャンセルされました';
}
