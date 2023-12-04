part of 'strings.g.dart';

// Path: <root>
class _StringsKo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsKo.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsKo _root = this; // ignore: unused_field

	// Translations
	@override String get locale => '한국어';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralKo general = _StringsGeneralKo._(_root);
	@override late final _StringsReceiveTabKo receiveTab = _StringsReceiveTabKo._(_root);
	@override late final _StringsSendTabKo sendTab = _StringsSendTabKo._(_root);
	@override late final _StringsSettingsTabKo settingsTab = _StringsSettingsTabKo._(_root);
	@override late final _StringsTroubleshootPageKo troubleshootPage = _StringsTroubleshootPageKo._(_root);
	@override late final _StringsReceiveHistoryPageKo receiveHistoryPage = _StringsReceiveHistoryPageKo._(_root);
	@override late final _StringsApkPickerPageKo apkPickerPage = _StringsApkPickerPageKo._(_root);
	@override late final _StringsSelectedFilesPageKo selectedFilesPage = _StringsSelectedFilesPageKo._(_root);
	@override late final _StringsReceivePageKo receivePage = _StringsReceivePageKo._(_root);
	@override late final _StringsReceiveOptionsPageKo receiveOptionsPage = _StringsReceiveOptionsPageKo._(_root);
	@override late final _StringsSendPageKo sendPage = _StringsSendPageKo._(_root);
	@override late final _StringsProgressPageKo progressPage = _StringsProgressPageKo._(_root);
	@override late final _StringsWebSharePageKo webSharePage = _StringsWebSharePageKo._(_root);
	@override late final _StringsAboutPageKo aboutPage = _StringsAboutPageKo._(_root);
	@override late final _StringsChangelogPageKo changelogPage = _StringsChangelogPageKo._(_root);
	@override late final _StringsAliasGeneratorKo aliasGenerator = _StringsAliasGeneratorKo._(_root);
	@override late final _StringsDialogsKo dialogs = _StringsDialogsKo._(_root);
	@override late final _StringsTrayKo tray = _StringsTrayKo._(_root);
	@override late final _StringsWebKo web = _StringsWebKo._(_root);
	@override late final _StringsAssetPickerKo assetPicker = _StringsAssetPickerKo._(_root);
}

// Path: general
class _StringsGeneralKo extends _StringsGeneralEn {
	_StringsGeneralKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get accept => '수락';
	@override String get accepted => '수락됨';
	@override String get add => '추가';
	@override String get advanced => '상세';
	@override String get cancel => '취소';
	@override String get close => '닫기';
	@override String get confirm => '확인';
	@override String get continueStr => '계속';
	@override String get copy => '복사';
	@override String get copiedToClipboard => '클립보드에 복사하였습니다';
	@override String get decline => '거부';
	@override String get done => '완료';
	@override String get delete => '삭제';
	@override String get edit => '편집';
	@override String get error => '에러';
	@override String get example => '예시';
	@override String get files => '파일';
	@override String get finished => '완료되었습니다';
	@override String get hide => '숨기기';
	@override String get off => '꺼짐';
	@override String get offline => '오프라인';
	@override String get on => '켜짐';
	@override String get online => '온라인';
	@override String get open => '열기';
	@override String get queue => '대기 중';
	@override String get quickSave => '빠른 저장';
	@override String get renamed => '이름 변경됨';
	@override String get reset => '리셋';
	@override String get restart => '재시작';
	@override String get settings => '설정';
	@override String get skipped => '스킵됨';
	@override String get start => '시작';
	@override String get stop => '정지';
	@override String get save => '저장';
	@override String get unchanged => '변경 안됨';
	@override String get unknown => '알 수 없음';
	@override String get noItemInClipboard => '클립보드에 항목이 없습니다';
}

// Path: receiveTab
class _StringsReceiveTabKo extends _StringsReceiveTabEn {
	_StringsReceiveTabKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '수신';
	@override late final _StringsReceiveTabInfoBoxKo infoBox = _StringsReceiveTabInfoBoxKo._(_root);
}

// Path: sendTab
class _StringsSendTabKo extends _StringsSendTabEn {
	_StringsSendTabKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '송신';
	@override late final _StringsSendTabSelectionKo selection = _StringsSendTabSelectionKo._(_root);
	@override late final _StringsSendTabPickerKo picker = _StringsSendTabPickerKo._(_root);
	@override String get shareIntentInfo => '휴대전화의 \'공유\' 기능을 사용하면 보다 편리하게 파일을 선택할 수 있습니다';
	@override String get nearbyDevices => '근처의 기기';
	@override String get thisDevice => '이 기기';
	@override String get scan => '기기를 검색하는 중';
	@override String get sendMode => '전송 모드';
	@override late final _StringsSendTabSendModesKo sendModes = _StringsSendTabSendModesKo._(_root);
	@override String get sendModeHelp => '설명';
	@override String get help => '보낼 기기가 같은 Wi-Fi 네트워크에 연결되었는지 확인해주세요';
	@override String get placeItems => '드롭해서 공유';
}

// Path: settingsTab
class _StringsSettingsTabKo extends _StringsSettingsTabEn {
	_StringsSettingsTabKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '설정';
	@override late final _StringsSettingsTabGeneralKo general = _StringsSettingsTabGeneralKo._(_root);
	@override late final _StringsSettingsTabReceiveKo receive = _StringsSettingsTabReceiveKo._(_root);
	@override late final _StringsSettingsTabNetworkKo network = _StringsSettingsTabNetworkKo._(_root);
	@override String get advancedSettings => '고급 설정';
}

// Path: troubleshootPage
class _StringsTroubleshootPageKo extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '문제해결';
	@override String get subTitle => '이 앱이 예상대로 작동하지 않나요? 여기에서 일반적인 해결 방법을 찾을 수 있습니다.';
	@override String get solution => '해결방법:';
	@override String get fixButton => '자동으로 수정하기';
	@override late final _StringsTroubleshootPageFirewallKo firewall = _StringsTroubleshootPageFirewallKo._(_root);
	@override late final _StringsTroubleshootPageNoConnectionKo noConnection = _StringsTroubleshootPageNoConnectionKo._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageKo extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '전송 기록';
	@override String get openFolder => '폴더 열기';
	@override String get deleteHistory => '기록 삭제';
	@override String get empty => '전송 기록이 비어 있습니다.';
	@override late final _StringsReceiveHistoryPageEntryActionsKo entryActions = _StringsReceiveHistoryPageEntryActionsKo._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageKo extends _StringsApkPickerPageEn {
	_StringsApkPickerPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '앱 (APK)';
	@override String get excludeSystemApps => '시스템 앱 제외';
	@override String get excludeAppsWithoutLaunchIntent => '실행할 수 없는 앱 제외';
	@override String apps({required Object n}) => '${n} 개의 앱';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageKo extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => '모두 삭제';
}

// Path: receivePage
class _StringsReceivePageKo extends _StringsReceivePageEn {
	_StringsReceivePageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(n,
		one: '에서 파일을 보내려고 합니다',
		other: '에서 ${n}개의 파일을 보내려고 합니다',
	);
	@override String get subTitleMessage => '에서 메시지를 보냈습니다:';
	@override String get subTitleLink => '에서 링크를 보냈습니다:';
	@override String get canceled => '보내는 사람이 요청을 취소했습니다';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageKo extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '옵션';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend 폴더)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => '디렉토리가 있어 자동으로 꺼집니다.';
}

// Path: sendPage
class _StringsSendPageKo extends _StringsSendPageEn {
	_StringsSendPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get waiting => '답변을 기다리는 중…';
	@override String get rejected => '받는 사람이 요청을 거부했습니다';
	@override String get busy => '수신자가 다른 요청으로 바쁩니다.';
}

// Path: progressPage
class _StringsProgressPageKo extends _StringsProgressPageEn {
	_StringsProgressPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get titleSending => '파일을 보내는 중';
	@override String get titleReceiving => '파일을 받는 중';
	@override String get savedToGallery => '갤러리에 저장했습니다.';
	@override late final _StringsProgressPageTotalKo total = _StringsProgressPageTotalKo._(_root);
}

// Path: webSharePage
class _StringsWebSharePageKo extends _StringsWebSharePageEn {
	_StringsWebSharePageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '링크로 공유하기';
	@override String get loading => '서버 시작 중...';
	@override String get stopping => '서버 중지 중...';
	@override String get error => '서버 시작 중 오류가 발생했습니다.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(n,
		one: '이 링크를 브라우저에서 열기:',
		other: '이 중 하나의 링크를 브라우저에서 열기:',
	);
	@override String get requests => '요청';
	@override String get noRequests => '아직 요청이 없습니다.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend는 자체 서명된 인증서를 사용합니다. 브라우저에서 수락해야 합니다.';
	@override String pendingRequests({required Object n}) => '대기중인 요청: ${n}';
}

// Path: aboutPage
class _StringsAboutPageKo extends _StringsAboutPageEn {
	_StringsAboutPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSend에 대해';
}

// Path: changelogPage
class _StringsChangelogPageKo extends _StringsChangelogPageEn {
	_StringsChangelogPageKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '업데이트 이력';
}

// Path: aliasGenerator
class _StringsAliasGeneratorKo extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsKo extends _StringsDialogsEn {
	_StringsDialogsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileKo addFile = _StringsDialogsAddFileKo._(_root);
	@override late final _StringsDialogsAddressInputKo addressInput = _StringsDialogsAddressInputKo._(_root);
	@override late final _StringsDialogsCancelSessionKo cancelSession = _StringsDialogsCancelSessionKo._(_root);
	@override late final _StringsDialogsCannotOpenFileKo cannotOpenFile = _StringsDialogsCannotOpenFileKo._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeKo encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeKo._(_root);
	@override late final _StringsDialogsErrorDialogKo errorDialog = _StringsDialogsErrorDialogKo._(_root);
	@override late final _StringsDialogsFavoriteDialogKo favoriteDialog = _StringsDialogsFavoriteDialogKo._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogKo favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogKo._(_root);
	@override late final _StringsDialogsFavoriteEditDialogKo favoriteEditDialog = _StringsDialogsFavoriteEditDialogKo._(_root);
	@override late final _StringsDialogsFileInfoKo fileInfo = _StringsDialogsFileInfoKo._(_root);
	@override late final _StringsDialogsFileNameInputKo fileNameInput = _StringsDialogsFileNameInputKo._(_root);
	@override late final _StringsDialogsHistoryClearDialogKo historyClearDialog = _StringsDialogsHistoryClearDialogKo._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedKo localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedKo._(_root);
	@override late final _StringsDialogsMessageInputKo messageInput = _StringsDialogsMessageInputKo._(_root);
	@override late final _StringsDialogsNoFilesKo noFiles = _StringsDialogsNoFilesKo._(_root);
	@override late final _StringsDialogsNoPermissionKo noPermission = _StringsDialogsNoPermissionKo._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformKo notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformKo._(_root);
	@override late final _StringsDialogsQrKo qr = _StringsDialogsQrKo._(_root);
	@override late final _StringsDialogsQuickActionsKo quickActions = _StringsDialogsQuickActionsKo._(_root);
	@override late final _StringsDialogsQuickSaveNoticeKo quickSaveNotice = _StringsDialogsQuickSaveNoticeKo._(_root);
	@override late final _StringsDialogsSendModeHelpKo sendModeHelp = _StringsDialogsSendModeHelpKo._(_root);
}

// Path: tray
class _StringsTrayKo extends _StringsTrayEn {
	_StringsTrayKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend 종료';
}

// Path: web
class _StringsWebKo extends _StringsWebEn {
	_StringsWebKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => '거부됨';
	@override String get files => '파일';
	@override String get fileName => '파일 이름';
	@override String get size => '크기';
}

// Path: assetPicker
class _StringsAssetPickerKo extends _StringsAssetPickerEn {
	_StringsAssetPickerKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get confirm => '확인';
	@override String get cancel => '취소';
	@override String get edit => '편집';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => '로드 실패';
	@override String get original => '원본';
	@override String get preview => '미리보기';
	@override String get select => '선택';
	@override String get emptyList => '목록이 비어있음';
	@override String get unSupportedAssetType => '지원하지 않는 파일 유형입니다.';
	@override String get unableToAccessAll => '기기의 모든 파일에 접근할 수 없습니다.';
	@override String get viewingLimitedAssetsTip => '앱에서 접근 가능한 파일과 앨범만 볼 수 있습니다.';
	@override String get changeAccessibleLimitedAssets => '접근 가능한 파일을 업데이트하려면 클릭하세요.';
	@override String get accessAllTip => '앱은 기기의 일부 파일에만 접근할 수 있습니다. 시스템 설정으로 이동하여 앱이 기기의 모든 미디어에 액세스할 수 있도록 허용하세요.';
	@override String get goToSystemSettings => '시스템 설정으로 이동';
	@override String get accessLimitedAssets => '제한된 접근으로 계속하기';
	@override String get accessiblePathName => '접근 가능한 파일';
	@override String get sTypeAudioLabel => '오디오';
	@override String get sTypeImageLabel => '이미지';
	@override String get sTypeVideoLabel => '비디오';
	@override String get sTypeOtherLabel => '기타 미디어';
	@override String get sActionPlayHint => '재생';
	@override String get sActionPreviewHint => '미리보기';
	@override String get sActionSelectHint => '선택';
	@override String get sActionSwitchPathLabel => '경로 변경';
	@override String get sActionUseCameraHint => '카메라 사용';
	@override String get sNameDurationLabel => '길이';
	@override String get sUnitAssetCountLabel => '개수';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxKo extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => '포트:';
	@override String get alias => '별명:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionKo extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '선택';
	@override String files({required Object files}) => '파일 수: ${files}';
	@override String size({required Object size}) => '크기: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerKo extends _StringsSendTabPickerEn {
	_StringsSendTabPickerKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get file => '파일';
	@override String get folder => '폴더';
	@override String get media => '미디어';
	@override String get text => '텍스트';
	@override String get app => '앱';
	@override String get clipboard => '붙여넣기';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesKo extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get single => '단일 수신자';
	@override String get multiple => '다중 수신자';
	@override String get link => '링크로 공유하기';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralKo extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '일반';
	@override String get brightness => '밝기';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsKo brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsKo._(_root);
	@override String get color => '색상';
	@override late final _StringsSettingsTabGeneralColorOptionsKo colorOptions = _StringsSettingsTabGeneralColorOptionsKo._(_root);
	@override String get language => '언어';
	@override late final _StringsSettingsTabGeneralLanguageOptionsKo languageOptions = _StringsSettingsTabGeneralLanguageOptionsKo._(_root);
	@override String get saveWindowPlacement => '종료: 화면 위치 저장하기';
	@override String get minimizeToTray => '종료 시 시스템 트레이로 최소화';
	@override String get launchAtStartup => '로그인 시 자동으로 시작';
	@override String get launchMinimized => '최소화된 상태로 시작';
	@override String get animations => '애니메이션';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveKo extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '수신';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => '저장 위치';
	@override String get downloads => '(다운로드 폴더)';
	@override String get saveToGallery => '미디어를 갤러리에 저장';
	@override String get saveToHistory => '히스토리에 저장';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkKo extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '네트워크';
	@override String get needRestart => '서버를 재시작해야 변경된 설정이 반영됩니다';
	@override String get server => '서버';
	@override String get alias => '별명';
	@override String get deviceType => '기기 유형';
	@override String get deviceModel => '기기 모델';
	@override String get port => '포트';
	@override String portWarning({required Object defaultPort}) => '커스텀 포트를 사용하면 이 디바이스가 다른 장치에서 감지되지 않을 수 있습니다. (기본값: ${defaultPort})';
	@override String get encryption => '암호화';
	@override String get multicastGroup => '멀티캐스트';
	@override String multicastGroupWarning({required Object defaultMulticast}) => '사용자 지정 멀티캐스트 주소를 사용하고 있기 때문에 다른 기기에서 감지되지 않을 수 있습니다. (기본값: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallKo extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get symptom => '이 앱은 다른 기기로 파일을 보낼 수 있지만, 다른 기기에서 이 기기로 파일을 보낼 수 없습니다.';
	@override String solution({required Object port}) => '방화벽 설정 때문일 가능성이 높습니다. ${port} 포트로 들어오는 연결(UDP 및 TCP)을 허용하여 이 문제를 해결할 수 있습니다.';
	@override String get openFirewall => '방화벽 열기';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionKo extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get symptom => '두 기기 모두 서로를 검색하거나 파일을 공유할 수 없습니다.';
	@override String get solution => '양쪽 모두에 문제가 있나요? 두 기기가 동일한 Wi-Fi 네트워크에 연결되어 있고 동일한 구성 (포트, 멀티캐스트 주소, 암호화)를 공유하는지 확인해야 합니다. Wi-Fi가 참가자 간 통신을 허용하지 않을 수도 있습니다. 이 경우 라우터에서 해당 옵션을 활성화해야 합니다.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsKo extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get open => '파일 열기';
	@override String get info => '정보';
	@override String get deleteFromHistory => '기록에서 삭제';
}

// Path: progressPage.total
class _StringsProgressPageTotalKo extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleKo title = _StringsProgressPageTotalTitleKo._(_root);
	@override String count({required Object curr, required Object n}) => '파일: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => '크기: ${curr} / ${n}';
	@override String speed({required Object speed}) => '속도: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileKo extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '선택 목록에 추가';
	@override String get content => '무엇을 추가할까요?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputKo extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '주소를 입력';
	@override String get hashtag => '해시태그';
	@override String get ip => 'IP 주소';
	@override String get recentlyUsed => '최근 사용된 주소: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionKo extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '파일 전송을 취소';
	@override String get content => '정말로 파일 전송을 취소할까요?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileKo extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '파일을 열 수 없음';
	@override String content({required Object file}) => '"${file}"을 열 수 없습니다. 파일이 이동, 이름 변경 또는 삭제 되었는지 확인해주세요.';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeKo extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '암호화가 비활성화되었습니다';
	@override String get content => '이제부터 암호화되지 않은 HTTP 프로토콜로 통신이 이루어집니다. HTTPS를 사용하려면 암호화를 다시 활성화해주세요.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogKo extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogKo extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '즐겨찾기';
	@override String get noFavorites => '즐겨찾기한 기기가 없습니다.';
	@override String get addFavorite => '추가';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogKo extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '즐겨찾기에서 삭제';
	@override String content({required Object name}) => '정말 "${name}" 즐겨찾기에서 삭제할까요?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogKo extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => '즐겨찾기에 추가';
	@override String get titleEdit => '편집';
	@override String get name => '별명';
	@override String get auto => '(자동)';
	@override String get ip => 'IP 주소';
	@override String get port => '포트';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoKo extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '파일 정보';
	@override String get fileName => '파일 이름:';
	@override String get path => '경로:';
	@override String get size => '크기:';
	@override String get sender => '보낸 사람:';
	@override String get time => '시간:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputKo extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '파일 이름을 입력하세요';
	@override String original({required Object original}) => '기존 이름: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogKo extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '기록 지우기';
	@override String get content => '정말 모든 기록을 삭제하시겠습니까?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedKo extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => '로컬 네트워크를 스캔할 권한이 없어 LocalSend가 다른 기기를 찾을 수 없습니다. 설정에서 권한을 부여해주세요.';
	@override String get gotoSettings => '설정';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputKo extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '메시지를 입력하세요';
	@override String get multiline => '여러줄';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesKo extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '파일이 선택되지 않았습니다';
	@override String get content => '적어도 하나 이상의 파일을 선택해주세요';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionKo extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '권한 없음';
	@override String get content => '필요한 권한을 허용하지 않았습니다. 설정에서 허용해주세요.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformKo extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '사용 불가';
	@override String get content => '이 기능은 다음 플랫폼에서만 사용 가능합니다:';
}

// Path: dialogs.qr
class _StringsDialogsQrKo extends _StringsDialogsQrEn {
	_StringsDialogsQrKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR 코드';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsKo extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '퀵 액션';
	@override String get counter => '카운터';
	@override String get prefix => '접두어';
	@override String get padZero => '0으로 채우기';
	@override String get sortBeforeCount => '미리 알파벳순으로 정렬';
	@override String get random => '무작위';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeKo extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => '파일 요청이 자동으로 수락됩니다. 로컬 네트워크의 누구나 파일을 보낼 수 있게되므로 주의해 주세요.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpKo extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '전송 모드';
	@override String get single => '파일을 한 명의 수신자에게 보냅니다. 파일 전송이 완료되면 선택이 지워집니다.';
	@override String get multiple => '파일을 여러 명의 수신자에게 보냅니다. 선택이 지워지지 않습니다.';
	@override String get link => 'LocalSend를 설치하지 않은 수신자는 브라우저에서 링크를 열어 선택한 파일을 다운로드할 수 있습니다.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsKo extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get system => '시스템';
	@override String get dark => '어두움';
	@override String get light => '밝음';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsKo extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get system => '시스템';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsKo extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String get system => '시스템';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleKo extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleKo._(_StringsKo root) : this._root = root, super._(root);

	@override final _StringsKo _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => '진행 시간 (${time})';
	@override String get finishedError => '에러로 인해 종료되었습니다';
	@override String get canceledSender => '보내는 사람이 취소했습니다';
	@override String get canceledReceiver => '받는 사람이 취소했습니다';
}
