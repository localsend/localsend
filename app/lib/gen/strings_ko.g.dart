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
class TranslationsKo extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.ko,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ko>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsKo _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => '한국어';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralKo general = _TranslationsGeneralKo._(_root);
  @override
  late final _TranslationsReceiveTabKo receiveTab = _TranslationsReceiveTabKo._(_root);
  @override
  late final _TranslationsSendTabKo sendTab = _TranslationsSendTabKo._(_root);
  @override
  late final _TranslationsSettingsTabKo settingsTab = _TranslationsSettingsTabKo._(_root);
  @override
  late final _TranslationsTroubleshootPageKo troubleshootPage = _TranslationsTroubleshootPageKo._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageKo networkInterfacesPage = _TranslationsNetworkInterfacesPageKo._(_root);
  @override
  late final _TranslationsReceiveHistoryPageKo receiveHistoryPage = _TranslationsReceiveHistoryPageKo._(_root);
  @override
  late final _TranslationsApkPickerPageKo apkPickerPage = _TranslationsApkPickerPageKo._(_root);
  @override
  late final _TranslationsSelectedFilesPageKo selectedFilesPage = _TranslationsSelectedFilesPageKo._(_root);
  @override
  late final _TranslationsReceivePageKo receivePage = _TranslationsReceivePageKo._(_root);
  @override
  late final _TranslationsReceiveOptionsPageKo receiveOptionsPage = _TranslationsReceiveOptionsPageKo._(_root);
  @override
  late final _TranslationsSendPageKo sendPage = _TranslationsSendPageKo._(_root);
  @override
  late final _TranslationsProgressPageKo progressPage = _TranslationsProgressPageKo._(_root);
  @override
  late final _TranslationsWebSharePageKo webSharePage = _TranslationsWebSharePageKo._(_root);
  @override
  late final _TranslationsAboutPageKo aboutPage = _TranslationsAboutPageKo._(_root);
  @override
  late final _TranslationsDonationPageKo donationPage = _TranslationsDonationPageKo._(_root);
  @override
  late final _TranslationsChangelogPageKo changelogPage = _TranslationsChangelogPageKo._(_root);
  @override
  late final _TranslationsAliasGeneratorKo aliasGenerator = _TranslationsAliasGeneratorKo._(_root);
  @override
  late final _TranslationsDialogsKo dialogs = _TranslationsDialogsKo._(_root);
  @override
  late final _TranslationsSanitizationKo sanitization = _TranslationsSanitizationKo._(_root);
  @override
  late final _TranslationsTrayKo tray = _TranslationsTrayKo._(_root);
  @override
  late final _TranslationsWebKo web = _TranslationsWebKo._(_root);
  @override
  late final _TranslationsAssetPickerKo assetPicker = _TranslationsAssetPickerKo._(_root);
}

// Path: general
class _TranslationsGeneralKo extends TranslationsGeneralEn {
  _TranslationsGeneralKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get accept => '수락';
  @override
  String get accepted => '수락됨';
  @override
  String get add => '추가';
  @override
  String get advanced => '상세';
  @override
  String get cancel => '취소';
  @override
  String get close => '닫기';
  @override
  String get confirm => '확인';
  @override
  String get continueStr => '계속';
  @override
  String get copy => '복사';
  @override
  String get copiedToClipboard => '클립보드에 복사했습니다';
  @override
  String get decline => '거부';
  @override
  String get done => '완료';
  @override
  String get delete => '삭제';
  @override
  String get edit => '편집';
  @override
  String get error => '에러';
  @override
  String get example => '예시';
  @override
  String get files => '파일';
  @override
  String get finished => '완료';
  @override
  String get hide => '숨김';
  @override
  String get off => '꺼짐';
  @override
  String get offline => '오프라인';
  @override
  String get on => '켜짐';
  @override
  String get online => '온라인';
  @override
  String get open => '열기';
  @override
  String get queue => '대기 중';
  @override
  String get quickSave => '빠른 저장';
  @override
  String get quickSaveFromFavorites => '"즐겨찾기"를 위한 빠른 저장';
  @override
  String get renamed => '이름 변경됨';
  @override
  String get reset => '변경사항 되돌리기';
  @override
  String get restart => '재시작';
  @override
  String get settings => '설정';
  @override
  String get skipped => '건너뜀';
  @override
  String get start => '시작';
  @override
  String get stop => '정지';
  @override
  String get save => '저장';
  @override
  String get unchanged => '변경사항 없음';
  @override
  String get unknown => '알 수 없음';
  @override
  String get noItemInClipboard => '클립보드가 비어있습니다.';
}

// Path: receiveTab
class _TranslationsReceiveTabKo extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '받기';
  @override
  late final _TranslationsReceiveTabInfoBoxKo infoBox = _TranslationsReceiveTabInfoBoxKo._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveKo quickSave = _TranslationsReceiveTabQuickSaveKo._(_root);
}

// Path: sendTab
class _TranslationsSendTabKo extends TranslationsSendTabEn {
  _TranslationsSendTabKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '보내기';
  @override
  late final _TranslationsSendTabSelectionKo selection = _TranslationsSendTabSelectionKo._(_root);
  @override
  late final _TranslationsSendTabPickerKo picker = _TranslationsSendTabPickerKo._(_root);
  @override
  String get shareIntentInfo => '휴대전화의 \'공유\' 기능을 사용하면 보다 편리하게 파일을 선택할 수 있습니다';
  @override
  String get nearbyDevices => '근처 기기';
  @override
  String get thisDevice => '이 기기';
  @override
  String get scan => '기기 검색';
  @override
  String get manualSending => '수동 전송';
  @override
  String get sendMode => '전송 모드';
  @override
  late final _TranslationsSendTabSendModesKo sendModes = _TranslationsSendTabSendModesKo._(_root);
  @override
  String get sendModeHelp => '설명';
  @override
  String get help => '파일을 전송받을 기기도 동일한 Wi-Fi 네트워크에 연결되어 있어야 합니다.';
  @override
  String get placeItems => '드롭하여 공유하기';
}

// Path: settingsTab
class _TranslationsSettingsTabKo extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '설정';
  @override
  late final _TranslationsSettingsTabGeneralKo general = _TranslationsSettingsTabGeneralKo._(_root);
  @override
  late final _TranslationsSettingsTabReceiveKo receive = _TranslationsSettingsTabReceiveKo._(_root);
  @override
  late final _TranslationsSettingsTabSendKo send = _TranslationsSettingsTabSendKo._(_root);
  @override
  late final _TranslationsSettingsTabNetworkKo network = _TranslationsSettingsTabNetworkKo._(_root);
  @override
  late final _TranslationsSettingsTabOtherKo other = _TranslationsSettingsTabOtherKo._(_root);
  @override
  String get advancedSettings => '고급 설정';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageKo extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '문제 해결';
  @override
  String get subTitle => '앱이 제대로 작동하지 않나요? 이 곳에서 자주 발생하는 문제들에 대한 도움말을 찾을 수 있습니다.';
  @override
  String get solution => '도움말:';
  @override
  String get fixButton => '자동으로 해결하기';
  @override
  late final _TranslationsTroubleshootPageFirewallKo firewall = _TranslationsTroubleshootPageFirewallKo._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryKo noDiscovery = _TranslationsTroubleshootPageNoDiscoveryKo._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionKo noConnection = _TranslationsTroubleshootPageNoConnectionKo._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageKo extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '네트워크 인터페이스';
  @override
  String get info => '기본적으로 LocalSend는 활용할 수 있는 모든 네트워크 인터페이스를 사용하도록 되어 있습니다. 원하지 않는 네트워크가 있다면 이 곳에서 비활성화할 수 있습니다. 변경사항을 적용하려면 서버를 다시 시작해야 합니다.';
  @override
  String get preview => '미리보기';
  @override
  String get whitelist => '허용 목록';
  @override
  String get blacklist => '거부 목록';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageKo extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '전송 기록';
  @override
  String get openFolder => '폴더 열기';
  @override
  String get deleteHistory => '기록 삭제';
  @override
  String get empty => '전송 기록이 비어 있습니다.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsKo entryActions = _TranslationsReceiveHistoryPageEntryActionsKo._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageKo extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '앱 (APK)';
  @override
  String get excludeSystemApps => '시스템 앱 제외';
  @override
  String get excludeAppsWithoutLaunchIntent => '실행할 수 없는 앱 제외';
  @override
  String apps({required Object n}) => '${n} 개의 앱';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageKo extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => '모두 삭제';
}

// Path: receivePage
class _TranslationsReceivePageKo extends TranslationsReceivePageEn {
  _TranslationsReceivePageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(n, one: '에서 파일을 보내려고 합니다', other: '에서 ${n}개의 파일을 보내려고 합니다');
  @override
  String get subTitleMessage => '에서 메시지를 보냈습니다:';
  @override
  String get subTitleLink => '에서 링크를 보냈습니다:';
  @override
  String get canceled => '보내는 사람이 요청을 취소했습니다.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageKo extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '설정';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend 폴더)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => '폴더가 있어 자동으로 비활성화되었습니다.';
}

// Path: sendPage
class _TranslationsSendPageKo extends TranslationsSendPageEn {
  _TranslationsSendPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => '응답 대기 중…';
  @override
  String get rejected => '받는 사람이 요청을 거부했습니다';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => '받는 사람이 다른 요청을 처리하는 중입니다.';
}

// Path: progressPage
class _TranslationsProgressPageKo extends TranslationsProgressPageEn {
  _TranslationsProgressPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => '파일 보내는 중';
  @override
  String get titleReceiving => '파일 받는 중';
  @override
  String get savedToGallery => '갤러리에 저장했습니다.';
  @override
  late final _TranslationsProgressPageTotalKo total = _TranslationsProgressPageTotalKo._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageKo extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '링크로 공유하기';
  @override
  String get loading => '서버 시작 중...';
  @override
  String get stopping => '서버 중지 중...';
  @override
  String get error => '서버를 시작하는 도중 오류가 발생했습니다.';
  @override
  String openLink({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(n, one: '해당 링크를 브라우저에서 여세요:', other: '해당 링크들 중 하나를 브라우저에서 여세요:');
  @override
  String get requests => '요청';
  @override
  String get noRequests => '아직 요청이 없습니다.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => '요청 자동 수락';
  @override
  String get requirePin => 'PIN 번호 사용';
  @override
  String pinHint({required Object pin}) => 'PIN 번호는 "${pin}" 입니다';
  @override
  String get encryptionHint => 'LocalSend는 자체 서명된 인증서를 사용합니다. 브라우저에서 이를 허용해야 합니다.';
  @override
  String pendingRequests({required Object n}) => '대기 중인 요청: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageKo extends TranslationsAboutPageEn {
  _TranslationsAboutPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend 정보';
  @override
  List<String> get description => [
    'LocalSend는 인터넷에 연결하지 않고도 로컬 네트워크를 통해 주변 기기들과 파일 및 메시지를 안전하게 공유할 수 있는 무료 오픈소스 애플리케이션입니다.',
    '이 앱은 Android, iOS, macOS, Windows 및 Linux에서 사용할 수 있습니다. 모든 다운로드 옵션은 공식 홈페이지에서 확인할 수 있습니다.',
  ];
  @override
  String get author => '작성자';
  @override
  String get contributors => '기여자';
  @override
  String get packagers => '패키지 관리자';
  @override
  String get translators => '번역가';
}

// Path: donationPage
class _TranslationsDonationPageKo extends TranslationsDonationPageEn {
  _TranslationsDonationPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '기부';
  @override
  String get info => 'LocalSend는 광고없이 무료로 제공되는 오픈소스 프로젝트입니다. 앱이 마음에 드신다면 후원을 통해 프로젝트 개발을 지원해주세요.';
  @override
  String donate({required Object amount}) => '${amount} 기부하기';
  @override
  String get thanks => '진심으로 감사드립니다!';
  @override
  String get restore => '구매 복원';
}

// Path: changelogPage
class _TranslationsChangelogPageKo extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '변경사항';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorKo extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsKo extends TranslationsDialogsEn {
  _TranslationsDialogsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileKo addFile = _TranslationsDialogsAddFileKo._(_root);
  @override
  late final _TranslationsDialogsOpenFileKo openFile = _TranslationsDialogsOpenFileKo._(_root);
  @override
  late final _TranslationsDialogsAddressInputKo addressInput = _TranslationsDialogsAddressInputKo._(_root);
  @override
  late final _TranslationsDialogsCancelSessionKo cancelSession = _TranslationsDialogsCancelSessionKo._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileKo cannotOpenFile = _TranslationsDialogsCannotOpenFileKo._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeKo encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeKo._(_root);
  @override
  late final _TranslationsDialogsErrorDialogKo errorDialog = _TranslationsDialogsErrorDialogKo._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogKo favoriteDialog = _TranslationsDialogsFavoriteDialogKo._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogKo favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogKo._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogKo favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogKo._(_root);
  @override
  late final _TranslationsDialogsFileInfoKo fileInfo = _TranslationsDialogsFileInfoKo._(_root);
  @override
  late final _TranslationsDialogsFileNameInputKo fileNameInput = _TranslationsDialogsFileNameInputKo._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogKo historyClearDialog = _TranslationsDialogsHistoryClearDialogKo._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedKo localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedKo._(_root);
  @override
  late final _TranslationsDialogsMessageInputKo messageInput = _TranslationsDialogsMessageInputKo._(_root);
  @override
  late final _TranslationsDialogsNoFilesKo noFiles = _TranslationsDialogsNoFilesKo._(_root);
  @override
  late final _TranslationsDialogsNoPermissionKo noPermission = _TranslationsDialogsNoPermissionKo._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformKo notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformKo._(_root);
  @override
  late final _TranslationsDialogsQrKo qr = _TranslationsDialogsQrKo._(_root);
  @override
  late final _TranslationsDialogsQuickActionsKo quickActions = _TranslationsDialogsQuickActionsKo._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeKo quickSaveNotice = _TranslationsDialogsQuickSaveNoticeKo._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeKo quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeKo._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinKo pin = _TranslationsDialogsPinKo._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpKo sendModeHelp = _TranslationsDialogsSendModeHelpKo._(_root);
  @override
  late final _TranslationsDialogsZoomKo zoom = _TranslationsDialogsZoomKo._(_root);
}

// Path: sanitization
class _TranslationsSanitizationKo extends TranslationsSanitizationEn {
  _TranslationsSanitizationKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get empty => '파일 이름은 비워 둘 수 없습니다';
  @override
  String get invalid => '파일 이름에 잘못된 문자가 포함되어 있습니다';
}

// Path: tray
class _TranslationsTrayKo extends TranslationsTrayEn {
  _TranslationsTrayKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend 종료하기';
  @override
  String get closeWindows => '나가기';
}

// Path: web
class _TranslationsWebKo extends TranslationsWebEn {
  _TranslationsWebKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN 번호 입력';
  @override
  String get invalidPin => 'PIN 번호가 올바르지 않습니다';
  @override
  String get tooManyAttempts => '시도 횟수를 초과했습니다';
  @override
  String get rejected => '거부됨';
  @override
  String get files => '파일';
  @override
  String get fileName => '파일 이름';
  @override
  String get size => '크기';
}

// Path: assetPicker
class _TranslationsAssetPickerKo extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => '확인';
  @override
  String get cancel => '취소';
  @override
  String get edit => '편집';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => '불러오기 실패';
  @override
  String get original => '원본';
  @override
  String get preview => '미리보기';
  @override
  String get select => '선택';
  @override
  String get emptyList => '목록이 비어있음';
  @override
  String get unSupportedAssetType => '지원하지 않는 파일 유형입니다.';
  @override
  String get unableToAccessAll => '기기의 모든 파일에 접근할 수 없습니다.';
  @override
  String get viewingLimitedAssetsTip => '앱에서 접근할 수 있는 파일과 앨범만 볼 수 있습니다.';
  @override
  String get changeAccessibleLimitedAssets => '접근이 허용된 파일 목록을 갱신하려면 클릭하세요.';
  @override
  String get accessAllTip => '앱은 기기의 일부 파일에만 접근할 수 있습니다. 설정으로 이동하여 앱이 모든 미디어에 접근할 수 있도록 허용해주세요.';
  @override
  String get goToSystemSettings => '설정으로 이동';
  @override
  String get accessLimitedAssets => '제한된 접근으로 계속하기';
  @override
  String get accessiblePathName => '접근 가능한 파일';
  @override
  String get sTypeAudioLabel => '오디오';
  @override
  String get sTypeImageLabel => '이미지';
  @override
  String get sTypeVideoLabel => '비디오';
  @override
  String get sTypeOtherLabel => '기타 미디어';
  @override
  String get sActionPlayHint => '재생';
  @override
  String get sActionPreviewHint => '미리보기';
  @override
  String get sActionSelectHint => '선택';
  @override
  String get sActionSwitchPathLabel => '경로 변경';
  @override
  String get sActionUseCameraHint => '카메라 사용';
  @override
  String get sNameDurationLabel => '길이';
  @override
  String get sUnitAssetCountLabel => '개수';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxKo extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => '포트:';
  @override
  String get alias => '별명:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveKo extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => '즐겨찾기';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionKo extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '선택';
  @override
  String files({required Object files}) => '파일 수: ${files}';
  @override
  String size({required Object size}) => '크기: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerKo extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get file => '파일';
  @override
  String get folder => '폴더';
  @override
  String get media => '미디어';
  @override
  String get text => '텍스트';
  @override
  String get app => '앱';
  @override
  String get clipboard => '붙여넣기';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesKo extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get single => '하나의 기기에 보내기';
  @override
  String get multiple => '여러 기기에 보내기';
  @override
  String get link => '링크로 공유하기';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralKo extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '일반';
  @override
  String get brightness => '테마';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsKo brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsKo._(_root);
  @override
  String get color => '색상';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsKo colorOptions = _TranslationsSettingsTabGeneralColorOptionsKo._(_root);
  @override
  String get language => '언어';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsKo languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsKo._(_root);
  @override
  String get saveWindowPlacement => '종료 후 창 위치 기억';
  @override
  String get saveWindowPlacementWindows => '종료 후 창 위치 기억';
  @override
  String get minimizeToTray => '종료 시 시스템 트레이로 최소화';
  @override
  String get launchAtStartup => '로그인 시 자동으로 시작';
  @override
  String get launchMinimized => '최소화된 상태로 시작';
  @override
  String get showInContextMenu => '컨텍스트 메뉴에 LocalSend 표시';
  @override
  String get animations => '애니메이션';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveKo extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '받기';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => '자동 완료';
  @override
  String get destination => '저장 위치';
  @override
  String get downloads => '(다운로드 폴더)';
  @override
  String get saveToGallery => '갤러리에 미디어 저장';
  @override
  String get saveToHistory => '전송 기록 보관';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendKo extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '보내기';
  @override
  String get shareViaLinkAutoAccept => '"링크로 공유하기" 요청 자동 수락';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkKo extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '네트워크';
  @override
  String get needRestart => '변경 사항을 적용하려면 서버를 다시 시작하세요!';
  @override
  String get server => '서버';
  @override
  String get alias => '별명';
  @override
  String get deviceType => '기기 유형';
  @override
  String get deviceModel => '기기 모델';
  @override
  String get port => '포트';
  @override
  String get network => '네트워크';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsKo networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsKo._(_root);
  @override
  String get discoveryTimeout => '탐색 제한시간';
  @override
  String get useSystemName => '시스템 이름 사용';
  @override
  String get generateRandomAlias => '무작위 별명 생성';
  @override
  String portWarning({required Object defaultPort}) => '사용자 지정 포트를 사용하면 다른 장치에서 기기가 감지되지 않을 수 있습니다. (기본값: ${defaultPort})';
  @override
  String get encryption => '암호화';
  @override
  String get multicastGroup => '멀티캐스트';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) => '사용자 지정 멀티캐스트 주소를 사용하면 다른 장치에서 기기가 감지되지 않을 수 있습니다. (기본값: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherKo extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '기타';
  @override
  String get support => 'LocalSend 후원하기';
  @override
  String get donate => '기부';
  @override
  String get privacyPolicy => '개인정보 처리 방침';
  @override
  String get termsOfUse => '이용 약관';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallKo extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '파일을 다른 기기로 보내는 데에는 문제가 없으나, 다른 기기로부터 파일을 받을 수 없는 경우';
  @override
  String solution({required Object port}) => '방화벽 설정으로 인한 문제일 가능성이 높습니다. ${port} 포트로 들어오는 연결(UDP 및 TCP)을 허용하여 이 문제를 해결할 수 있습니다.';
  @override
  String get openFirewallSettings => '방화벽 열기';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryKo extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '현재 사용 중인 기기에서 다른 기기들이 감지되지 않는 경우';
  @override
  String get solution =>
      '사용하려는 모든 기기가 동일한 Wi-Fi 네트워크에 연결되어 있고, 동일한 설정(포트, 멀티캐스트 주소, 암호화)이 적용되어 있는지 확인해보세요. 직접 상대의 IP 주소를 입력하여 기기를 추가할 수도 있습니다. 즐겨찾기에 등록하면 다음부터 자동으로 감지될 수 있습니다.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionKo extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '양쪽 기기 모두 서로를 감지하지 못하거나, 파일을 전송할 수 없는 경우';
  @override
  String get solution =>
      '양쪽 모두에 문제가 있는 경우, 두 기기가 동일한 Wi-Fi 네트워크에 연결되어 있고 동일한 설정(포트, 멀티캐스트 주소, 암호화)이 적용되어 있는지 확인해야 합니다. Wi-Fi 네트워크가 기기 간 통신을 허용하지 않는 경우일 수도 있습니다. 이 경우 라우터에서 관련 옵션을 수정해야 합니다.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsKo extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get open => '파일 열기';
  @override
  String get showInFolder => '폴더에서 보기';
  @override
  String get info => '정보';
  @override
  String get deleteFromHistory => '기록에서 삭제';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalKo extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleKo title = _TranslationsProgressPageTotalTitleKo._(_root);
  @override
  String count({required Object curr, required Object n}) => '파일: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => '크기: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => '속도: ${speed}/초';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileKo extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '선택 파일 추가';
  @override
  String get content => '어떤 파일을 추가할까요?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileKo extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '파일 열기';
  @override
  String get content => '전송받은 파일을 여시겠습니까?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputKo extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '주소 입력';
  @override
  String get hashtag => '해시태그';
  @override
  String get ip => 'IP 주소';
  @override
  String get recentlyUsed => '최근 사용된 주소: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionKo extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '파일 전송 취소';
  @override
  String get content => '정말로 파일 전송을 취소할까요?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileKo extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '열 수 없는 파일';
  @override
  String content({required Object file}) => '"${file}" 파일을 열 수 없습니다. 파일의 이름이 변경되었거나 이동 또는 삭제되었는지 확인해주세요.';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeKo extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '암호화 비활성화';
  @override
  String get content => '이제부터 암호화되지 않은 HTTP 프로토콜을 사용해 파일을 주고 받습니다. HTTPS 프로토콜을 사용하려면 암호화를 다시 활성화해주세요.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogKo extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogKo extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '즐겨찾기';
  @override
  String get noFavorites => '즐겨찾기한 기기가 없습니다.';
  @override
  String get addFavorite => '추가';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogKo extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '즐겨찾기 삭제';
  @override
  String content({required Object name}) => '정말로 "${name}" 기기를 즐겨찾기에서 삭제하시겠습니까?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogKo extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => '즐겨찾기 추가';
  @override
  String get titleEdit => '편집';
  @override
  String get name => '별명';
  @override
  String get auto => '(자동)';
  @override
  String get ip => 'IP 주소';
  @override
  String get port => '포트';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoKo extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '파일 정보';
  @override
  String get fileName => '파일 이름:';
  @override
  String get path => '경로:';
  @override
  String get size => '크기:';
  @override
  String get sender => '보낸 사람:';
  @override
  String get time => '시간:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputKo extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '파일 이름 입력';
  @override
  String original({required Object original}) => '기존 이름: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogKo extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '기록 삭제';
  @override
  String get content => '정말 모든 기록을 삭제하시겠습니까?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedKo extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend가 다른 기기를 감지하려면 로컬 네트워크 탐색을 위한 권한이 필요합니다. 설정에서 권한을 허용해주세요.';
  @override
  String get gotoSettings => '설정';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputKo extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '메시지 입력';
  @override
  String get multiline => '여러 줄';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesKo extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '선택된 파일 없음';
  @override
  String get content => '적어도 하나 이상의 파일을 선택해주세요.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionKo extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '권한 없음';
  @override
  String get content => '필요한 권한이 부여되지 않았습니다. 설정에서 권한을 허용해주세요.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformKo extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '사용 불가';
  @override
  String get content => '해당 기능은 다음 플랫폼에서만 사용할 수 있습니다:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrKo extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR 코드';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsKo extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '퀵 액션';
  @override
  String get counter => '카운터';
  @override
  String get prefix => '접두어';
  @override
  String get padZero => '0으로 채우기';
  @override
  String get sortBeforeCount => '미리 알파벳순으로 정렬';
  @override
  String get random => '무작위';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeKo extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => '이제부터 파일 전송 요청이 자동으로 승인됩니다. 로컬 네트워크 상에 존재하는 모두가 당신에게 파일을 보낼 수 있다는 점을 명심하세요.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeKo extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    '이제부터 즐겨찾기 목록에 있는 기기에서 보내는 파일 전송 요청이 자동으로 승인됩니다.',
    '다만, 이 기능은 아직 보안이 완벽하지 않으므로 주의가 필요합니다. 만약 해커가 즐겨찾기 기기의 식별 정보를 알아낸다면, 별다른 제한 없이 파일을 전송할 수도 있습니다.',
    '그럼에도 불구하고, 로컬 네트워크 상에 존재하는 모든 기기로부터 파일 전송을 허용하는 것보다는 더 안전한 방법입니다.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinKo extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN 번호 입력';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpKo extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => '전송 모드';
  @override
  String get single => '파일을 하나의 기기에 보냅니다. 파일 전송이 완료된 후 선택 항목이 초기화됩니다.';
  @override
  String get multiple => '파일을 여러 기기에 보냅니다. 파일 전송이 완료된 뒤에도 선택 항목이 유지됩니다.';
  @override
  String get link => 'LocalSend가 설치되지 않은 기기에서도 브라우저를 통해 링크에 접속하여 파일을 다운로드 받을 수 있습니다.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomKo extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsKo extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get system => '시스템';
  @override
  String get dark => '다크';
  @override
  String get light => '라이트';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsKo extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get system => '시스템';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsKo extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get system => '시스템';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsKo extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String get all => '전체 허용';
  @override
  String get filtered => '일부 허용';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleKo extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleKo._(TranslationsKo root) : this._root = root, super.internal(root);

  final TranslationsKo _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => '진행 시간 (${time})';
  @override
  String get finishedError => '에러와 함께 종료되었습니다';
  @override
  String get canceledSender => '보내는 사람에 의해 취소되었습니다';
  @override
  String get canceledReceiver => '받는 사람에 의해 취소되었습니다';
}
