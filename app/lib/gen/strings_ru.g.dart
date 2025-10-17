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
class TranslationsRu extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.ru,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsRu _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Русский';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralRu general = _TranslationsGeneralRu._(_root);
  @override
  late final _TranslationsReceiveTabRu receiveTab = _TranslationsReceiveTabRu._(_root);
  @override
  late final _TranslationsSendTabRu sendTab = _TranslationsSendTabRu._(_root);
  @override
  late final _TranslationsSettingsTabRu settingsTab = _TranslationsSettingsTabRu._(_root);
  @override
  late final _TranslationsTroubleshootPageRu troubleshootPage = _TranslationsTroubleshootPageRu._(_root);
  @override
  late final _TranslationsReceiveHistoryPageRu receiveHistoryPage = _TranslationsReceiveHistoryPageRu._(_root);
  @override
  late final _TranslationsApkPickerPageRu apkPickerPage = _TranslationsApkPickerPageRu._(_root);
  @override
  late final _TranslationsSelectedFilesPageRu selectedFilesPage = _TranslationsSelectedFilesPageRu._(_root);
  @override
  late final _TranslationsReceivePageRu receivePage = _TranslationsReceivePageRu._(_root);
  @override
  late final _TranslationsReceiveOptionsPageRu receiveOptionsPage = _TranslationsReceiveOptionsPageRu._(_root);
  @override
  late final _TranslationsSendPageRu sendPage = _TranslationsSendPageRu._(_root);
  @override
  late final _TranslationsProgressPageRu progressPage = _TranslationsProgressPageRu._(_root);
  @override
  late final _TranslationsWebSharePageRu webSharePage = _TranslationsWebSharePageRu._(_root);
  @override
  late final _TranslationsAboutPageRu aboutPage = _TranslationsAboutPageRu._(_root);
  @override
  late final _TranslationsDonationPageRu donationPage = _TranslationsDonationPageRu._(_root);
  @override
  late final _TranslationsChangelogPageRu changelogPage = _TranslationsChangelogPageRu._(_root);
  @override
  late final _TranslationsAliasGeneratorRu aliasGenerator = _TranslationsAliasGeneratorRu._(_root);
  @override
  late final _TranslationsDialogsRu dialogs = _TranslationsDialogsRu._(_root);
  @override
  late final _TranslationsSanitizationRu sanitization = _TranslationsSanitizationRu._(_root);
  @override
  late final _TranslationsTrayRu tray = _TranslationsTrayRu._(_root);
  @override
  late final _TranslationsWebRu web = _TranslationsWebRu._(_root);
  @override
  late final _TranslationsAssetPickerRu assetPicker = _TranslationsAssetPickerRu._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageRu networkInterfacesPage = _TranslationsNetworkInterfacesPageRu._(_root);
}

// Path: general
class _TranslationsGeneralRu extends TranslationsGeneralEn {
  _TranslationsGeneralRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Принять';
  @override
  String get accepted => 'Принято';
  @override
  String get add => 'Добавить';
  @override
  String get advanced => 'Подробнее';
  @override
  String get cancel => 'Отменить';
  @override
  String get close => 'Закрыть';
  @override
  String get confirm => 'Подтвердить';
  @override
  String get continueStr => 'Продолжить';
  @override
  String get copy => 'Копировать';
  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';
  @override
  String get decline => 'Отклонить';
  @override
  String get done => 'Готово';
  @override
  String get delete => 'Удалить';
  @override
  String get edit => 'Редактировать';
  @override
  String get error => 'Ошибка';
  @override
  String get example => 'Пример';
  @override
  String get files => 'Файлы';
  @override
  String get finished => 'Завершено';
  @override
  String get hide => 'Скрыть';
  @override
  String get off => 'Отключено';
  @override
  String get offline => 'Не в сети';
  @override
  String get on => 'Включено';
  @override
  String get online => 'В сети';
  @override
  String get open => 'Открыть';
  @override
  String get queue => 'Очередь';
  @override
  String get quickSave => 'Быстрое сохранение';
  @override
  String get quickSaveFromFavorites => 'Быстрое сохранение для "Избранных"';
  @override
  String get renamed => 'Переименовано';
  @override
  String get reset => 'Отменить изменения';
  @override
  String get restart => 'Перезапустить';
  @override
  String get settings => 'Настройки';
  @override
  String get skipped => 'Отклонено';
  @override
  String get start => 'Запустить';
  @override
  String get stop => 'Остановить';
  @override
  String get save => 'Сохранить';
  @override
  String get unchanged => 'Без изменений';
  @override
  String get unknown => 'Неизвестно';
  @override
  String get noItemInClipboard => 'Буфер обмена пуст.';
}

// Path: receiveTab
class _TranslationsReceiveTabRu extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получить';
  @override
  late final _TranslationsReceiveTabInfoBoxRu infoBox = _TranslationsReceiveTabInfoBoxRu._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveRu quickSave = _TranslationsReceiveTabQuickSaveRu._(_root);
}

// Path: sendTab
class _TranslationsSendTabRu extends TranslationsSendTabEn {
  _TranslationsSendTabRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отправить';
  @override
  late final _TranslationsSendTabSelectionRu selection = _TranslationsSendTabSelectionRu._(_root);
  @override
  late final _TranslationsSendTabPickerRu picker = _TranslationsSendTabPickerRu._(_root);
  @override
  String get shareIntentInfo => 'Вы также можете воспользоваться функцией "Поделиться" на своем мобильном устройстве, чтобы быстрее выбирать файлы.';
  @override
  String get nearbyDevices => 'Устройства поблизости';
  @override
  String get thisDevice => 'Это устройство';
  @override
  String get scan => 'Поиск устройств';
  @override
  String get manualSending => 'Ручная отправка';
  @override
  String get sendMode => 'Режим отправки';
  @override
  late final _TranslationsSendTabSendModesRu sendModes = _TranslationsSendTabSendModesRu._(_root);
  @override
  String get sendModeHelp => 'Справка';
  @override
  String get help => 'Пожалуйста, убедитесь, что получатель находится в той же Wi-Fi сети, что и отправитель.';
  @override
  String get placeItems => 'Добавьте файлы, чтобы поделиться.';
}

// Path: settingsTab
class _TranslationsSettingsTabRu extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Настройки';
  @override
  late final _TranslationsSettingsTabGeneralRu general = _TranslationsSettingsTabGeneralRu._(_root);
  @override
  late final _TranslationsSettingsTabReceiveRu receive = _TranslationsSettingsTabReceiveRu._(_root);
  @override
  late final _TranslationsSettingsTabSendRu send = _TranslationsSettingsTabSendRu._(_root);
  @override
  late final _TranslationsSettingsTabNetworkRu network = _TranslationsSettingsTabNetworkRu._(_root);
  @override
  late final _TranslationsSettingsTabOtherRu other = _TranslationsSettingsTabOtherRu._(_root);
  @override
  String get advancedSettings => 'Расширенные настройки';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageRu extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Устранение неисправностей';
  @override
  String get subTitle => 'Приложение не работает должным образом? Здесь вы можете найти некоторые распространенные решения проблем.';
  @override
  String get solution => 'Решение:';
  @override
  String get fixButton => 'Исправить автоматически';
  @override
  late final _TranslationsTroubleshootPageFirewallRu firewall = _TranslationsTroubleshootPageFirewallRu._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryRu noDiscovery = _TranslationsTroubleshootPageNoDiscoveryRu._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionRu noConnection = _TranslationsTroubleshootPageNoConnectionRu._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageRu extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'История';
  @override
  String get openFolder => 'Открыть папку';
  @override
  String get deleteHistory => 'Очистить историю';
  @override
  String get empty => 'История пуста.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsRu entryActions = _TranslationsReceiveHistoryPageEntryActionsRu._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageRu extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Приложения (APK)';
  @override
  String get excludeSystemApps => 'Исключить системные приложения';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Исключить незапускаемые приложения';
  @override
  String apps({required Object n}) => '${n} приложений';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageRu extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Удалить все';
}

// Path: receivePage
class _TranslationsReceivePageRu extends TranslationsReceivePageEn {
  _TranslationsReceivePageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
    n,
    one: 'хочет отправить вам файл',
    other: 'хочет отправить вам ${n} файлы (-ов)',
  );
  @override
  String get subTitleMessage => 'отправил вам сообщение:';
  @override
  String get subTitleLink => 'отправил вам ссылку:';
  @override
  String get canceled => 'Отправитель отменил запрос на передачу файлов.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageRu extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Параметры получения';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Папка LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Отключено автоматически, поскольку есть папки.';
}

// Path: sendPage
class _TranslationsSendPageRu extends TranslationsSendPageEn {
  _TranslationsSendPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Ожидание ответа…';
  @override
  String get rejected => 'Получатель отклонил запрос.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Получатель занят другим запросом.';
}

// Path: progressPage
class _TranslationsProgressPageRu extends TranslationsProgressPageEn {
  _TranslationsProgressPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Отправка файлов';
  @override
  String get titleReceiving => 'Получение файлов';
  @override
  String get savedToGallery => 'Сохранено в галереи';
  @override
  late final _TranslationsProgressPageTotalRu total = _TranslationsProgressPageTotalRu._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageRu extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Поделиться по ссылке';
  @override
  String get loading => 'Запуск сервера…';
  @override
  String get stopping => 'Остановка сервера…';
  @override
  String get error => 'При запуске сервера произошла ошибка.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
    n,
    one: 'Откройте эту ссылку в браузере:',
    other: 'Откройте одну из этих ссылок в браузере:',
  );
  @override
  String get requests => 'Запросы';
  @override
  String get noRequests => 'Запросов пока нет.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Автоматически принимать запросы';
  @override
  String get requirePin => 'Требовать PIN-код';
  @override
  String pinHint({required Object pin}) => 'PIN-код: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend использует самоподписанный сертификат. Вам необходимо принять его в браузере.';
  @override
  String pendingRequests({required Object n}) => 'Ожидающие запросы: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageRu extends TranslationsAboutPageEn {
  _TranslationsAboutPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'О LocalSend';
  @override
  List<String> get description => [
    'LocalSend — это бесплатное приложение с открытым исходным кодом, которое позволяет вам безопасно обмениваться файлами и сообщениями с находящимися поблизости устройствами через локальную сеть, без необходимости подключения к Интернету.',
    'Это приложение доступно для Android, iOS, macOS, Windows и Linux. Вы можете найти все варианты загрузки на официальной домашней странице.',
  ];
  @override
  String get author => 'Автор';
  @override
  String get contributors => 'Участники';
  @override
  String get packagers => 'Сборщики';
  @override
  String get translators => 'Переводчики';
}

// Path: donationPage
class _TranslationsDonationPageRu extends TranslationsDonationPageEn {
  _TranslationsDonationPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Пожертвовать';
  @override
  String get info =>
      'LocalSend — это бесплатное приложение с открытым исходным кодом и без рекламы. Если оно вам нравится, вы можете поддержать его разработку пожертвованием.';
  @override
  String donate({required Object amount}) => 'Пожертвовать ${amount}';
  @override
  String get thanks => 'Большое спасибо!';
  @override
  String get restore => 'Восстановить покупку';
}

// Path: changelogPage
class _TranslationsChangelogPageRu extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'История изменений';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorRu extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsRu extends TranslationsDialogsEn {
  _TranslationsDialogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileRu addFile = _TranslationsDialogsAddFileRu._(_root);
  @override
  late final _TranslationsDialogsOpenFileRu openFile = _TranslationsDialogsOpenFileRu._(_root);
  @override
  late final _TranslationsDialogsAddressInputRu addressInput = _TranslationsDialogsAddressInputRu._(_root);
  @override
  late final _TranslationsDialogsCancelSessionRu cancelSession = _TranslationsDialogsCancelSessionRu._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileRu cannotOpenFile = _TranslationsDialogsCannotOpenFileRu._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeRu encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeRu._(_root);
  @override
  late final _TranslationsDialogsErrorDialogRu errorDialog = _TranslationsDialogsErrorDialogRu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogRu favoriteDialog = _TranslationsDialogsFavoriteDialogRu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogRu favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogRu._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogRu favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogRu._(_root);
  @override
  late final _TranslationsDialogsFileInfoRu fileInfo = _TranslationsDialogsFileInfoRu._(_root);
  @override
  late final _TranslationsDialogsFileNameInputRu fileNameInput = _TranslationsDialogsFileNameInputRu._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogRu historyClearDialog = _TranslationsDialogsHistoryClearDialogRu._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedRu localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedRu._(_root);
  @override
  late final _TranslationsDialogsMessageInputRu messageInput = _TranslationsDialogsMessageInputRu._(_root);
  @override
  late final _TranslationsDialogsNoFilesRu noFiles = _TranslationsDialogsNoFilesRu._(_root);
  @override
  late final _TranslationsDialogsNoPermissionRu noPermission = _TranslationsDialogsNoPermissionRu._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformRu notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformRu._(_root);
  @override
  late final _TranslationsDialogsQrRu qr = _TranslationsDialogsQrRu._(_root);
  @override
  late final _TranslationsDialogsQuickActionsRu quickActions = _TranslationsDialogsQuickActionsRu._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeRu quickSaveNotice = _TranslationsDialogsQuickSaveNoticeRu._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeRu quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeRu._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinRu pin = _TranslationsDialogsPinRu._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpRu sendModeHelp = _TranslationsDialogsSendModeHelpRu._(_root);
  @override
  late final _TranslationsDialogsZoomRu zoom = _TranslationsDialogsZoomRu._(_root);
}

// Path: sanitization
class _TranslationsSanitizationRu extends TranslationsSanitizationEn {
  _TranslationsSanitizationRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Имя файла не может быть пустым';
  @override
  String get invalid => 'Имя файла содержит недопустимые символы';
}

// Path: tray
class _TranslationsTrayRu extends TranslationsTrayEn {
  _TranslationsTrayRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Выйти из LocalSend';
  @override
  String get closeWindows => 'Выйти';
}

// Path: web
class _TranslationsWebRu extends TranslationsWebEn {
  _TranslationsWebRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Введите PIN-код';
  @override
  String get invalidPin => 'Неверный PIN-код';
  @override
  String get tooManyAttempts => 'Слишком много попыток';
  @override
  String get rejected => 'Отклонено';
  @override
  String get files => 'Файлов';
  @override
  String get fileName => 'Имя файла';
  @override
  String get size => 'Размер';
}

// Path: assetPicker
class _TranslationsAssetPickerRu extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Подтвердить';
  @override
  String get cancel => 'Отменить';
  @override
  String get edit => 'Редактировать';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Не удалось загрузить';
  @override
  String get original => 'Оригинал';
  @override
  String get preview => 'Предпросмотр';
  @override
  String get select => 'Выбрать';
  @override
  String get emptyList => 'Список пуст';
  @override
  String get unSupportedAssetType => 'Неподдерживаемый тип файла.';
  @override
  String get unableToAccessAll => 'Не удалось получить доступ ко всем файлам на устройстве';
  @override
  String get viewingLimitedAssetsTip => 'Приложение может просматривать только файлы и альбомы, к которым у него есть доступ.';
  @override
  String get changeAccessibleLimitedAssets => 'Разрешить доступ к дополнительным файлам';
  @override
  String get accessAllTip =>
      'Приложение имеет доступ только к некоторым файлам на устройстве. Перейдите к системным настройкам и разрешите приложению получить доступ ко всем медиафайлам на устройстве.';
  @override
  String get goToSystemSettings => 'Перейти к системным настройкам';
  @override
  String get accessLimitedAssets => 'Продолжить с ограниченным доступом';
  @override
  String get accessiblePathName => 'Доступные файлы';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Изображение';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Другие медиафайлы';
  @override
  String get sActionPlayHint => 'воспроизвести';
  @override
  String get sActionPreviewHint => 'предпросмотр';
  @override
  String get sActionSelectHint => 'выбрать';
  @override
  String get sActionSwitchPathLabel => 'изменить путь';
  @override
  String get sActionUseCameraHint => 'использовать камеру';
  @override
  String get sNameDurationLabel => 'продолжительность';
  @override
  String get sUnitAssetCountLabel => 'количество';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageRu extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сетевые интерфейсы';
  @override
  String get preview => 'Предосмотр';
  @override
  String get whitelist => 'Белый список';
  @override
  String get blacklist => 'Черный список';
  @override
  String get info =>
      'По умолчанию, LocalSend использует все доступные сетевые интерфейсы. Вы можете исключить нежелательные сети здесь. Необходимо перезапустить сервер для применения изменений.';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxRu extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Имя устройства:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveRu extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Избранное';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionRu extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Выборка';
  @override
  String files({required Object files}) => 'Файлов: ${files}';
  @override
  String size({required Object size}) => 'Размер: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerRu extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медиа';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Приложение';
  @override
  String get clipboard => 'Вставить';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesRu extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Один получатель';
  @override
  String get multiple => 'Несколько получателей';
  @override
  String get link => 'Поделиться по ссылке';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralRu extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Общие';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsRu brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsRu._(_root);
  @override
  String get color => 'Цвет';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsRu colorOptions = _TranslationsSettingsTabGeneralColorOptionsRu._(_root);
  @override
  String get language => 'Язык';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsRu languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsRu._(_root);
  @override
  String get saveWindowPlacement => 'Сохранять расположение окна после выхода';
  @override
  String get saveWindowPlacementWindows => 'Сохранять расположение окна после выхода';
  @override
  String get minimizeToTray => 'Сворачивать в системный трей/строку меню при закрытии';
  @override
  String get launchAtStartup => 'Автозагрузка';
  @override
  String get launchMinimized => 'Скрытая автозагрузка';
  @override
  String get showInContextMenu => 'Отображать LocalSend в контекстном меню';
  @override
  String get animations => 'Анимации';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveRu extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получение';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Автозавершение';
  @override
  String get destination => 'Сохранять в папку';
  @override
  String get downloads => '(Загрузки)';
  @override
  String get saveToGallery => 'Сохранять медиафайлы в галерею';
  @override
  String get saveToHistory => 'Сохранять историю';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendRu extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отправка';
  @override
  String get shareViaLinkAutoAccept => 'Автоматически принимать запросы в режиме "Поделиться по ссылке"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkRu extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сеть';
  @override
  String get needRestart => 'Для применения изменений необходимо перезапустить сервер!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Имя устройства';
  @override
  String get deviceType => 'Тип устройства';
  @override
  String get deviceModel => 'Модель устройства';
  @override
  String get port => 'Порт';
  @override
  String get discoveryTimeout => 'Тайм-аут поиска';
  @override
  String get useSystemName => 'Использовать системное имя';
  @override
  String get generateRandomAlias => 'Сгенерировать случайный псевдоним';
  @override
  String portWarning({required Object defaultPort}) =>
      'Другие устройства могут вас не найти, поскольку вы используете другой, собственный порт. (default: ${defaultPort})';
  @override
  String get encryption => 'Шифрование';
  @override
  String get multicastGroup => 'Адрес мультивещание';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Другие устройства могут вас не найти, поскольку вы используете другой, собственный адрес мультивещания. (default: ${defaultMulticast})';
  @override
  String get network => 'Сеть';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsRu networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsRu._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherRu extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Другое';
  @override
  String get support => 'Поддержать LocalSend';
  @override
  String get donate => 'Пожертвовать';
  @override
  String get privacyPolicy => 'Политика конфиденциальности';
  @override
  String get termsOfUse => 'Условия использования';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallRu extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Это устройство может отправлять файлы на другие устройства, но другие устройства не могут отправлять файлы на это устройство.';
  @override
  String solution({required Object port}) =>
      'Скорее всего, это проблема брандмауэра. Вы можете решить эту проблему, разрешив входящие соединения (UDP и TCP) для порта ${port}.';
  @override
  String get openFirewallSettings => 'Открыть брандмауэр';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryRu extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Это устройство не может найти другие устройства.';
  @override
  String get solution =>
      'Пожалуйста, убедитесь, что оба устройства находятся в одной Wi-Fi сети и имеют одинаковую конфигурацию (порт, адрес мультивещания, шифрование). Вы можете попробовать ввести IP-адрес целевого устройства вручную. Если это сработает, подумайте о том, чтобы добавить это устройство в избранное, чтобы его можно было автоматически находить в будущем.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionRu extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Оба устройства не могут найти друг друга и не могут обмениваться файлами.';
  @override
  String get solution =>
      'Проблема существует с обеих сторон? Итак, вам нужно убедиться, что оба устройства находятся в одной Wi-Fi сети и имеют одинаковую конфигурацию (порт, адрес мультивещания, шифрование). Сеть Wi-Fi может не разрешать обмен (передачу) между участниками. В этом случае, вам необходимо включить эту опцию на своем маршрутизаторе.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsRu extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Открыть файл';
  @override
  String get showInFolder => 'Показать в папке';
  @override
  String get info => 'Информация';
  @override
  String get deleteFromHistory => 'Удалить из истории';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalRu extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleRu title = _TranslationsProgressPageTotalTitleRu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлов: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Размер: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Скорость: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileRu extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Добавить в выборку';
  @override
  String get content => 'Что вы хотите добавить?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileRu extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Открыть файл';
  @override
  String get content => 'Хотите открыть полученный файл?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputRu extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите адрес';
  @override
  String get hashtag => 'Хэштег';
  @override
  String get ip => 'IP-адрес';
  @override
  String get recentlyUsed => 'Недавно использованные: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionRu extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отменить отправку файлов';
  @override
  String get content => 'Вы действительно хотите отменить отправку файлов?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileRu extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не удалось открыть файл';
  @override
  String content({required Object file}) => 'Не удалось открыть "${file}". Возможно, этот файл был перемещен, переименован или удален?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeRu extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрование отключено';
  @override
  String get content => 'Связь теперь происходит по незашифрованному HTTP протоколу. Чтобы использовать протокол HTTPS, снова включите шифрование.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogRu extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogRu extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избранное';
  @override
  String get noFavorites => 'Избранных устройств пока нет.';
  @override
  String get addFavorite => 'Добавить';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogRu extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Удалить из избранных';
  @override
  String content({required Object name}) => 'Вы действительно хотите удалить из избранных "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogRu extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Добавить в избранное';
  @override
  String get titleEdit => 'Настройки';
  @override
  String get name => 'Имя устройства';
  @override
  String get auto => '(автоматически)';
  @override
  String get ip => 'IP-адрес';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoRu extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'О файле';
  @override
  String get fileName => 'Имя файла:';
  @override
  String get path => 'Путь:';
  @override
  String get size => 'Размер:';
  @override
  String get sender => 'Отправитель:';
  @override
  String get time => 'Время:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputRu extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите имя файла';
  @override
  String original({required Object original}) => 'Оригинальное имя файла: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogRu extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистить историю';
  @override
  String get content => 'Вы действительно хотите удалить всю историю?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedRu extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend не может найти другие устройства без разрешения на сканирование локальной сети. Пожалуйста, предоставьте это разрешение в настройках.';
  @override
  String get gotoSettings => 'Настройки';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputRu extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите сообщение';
  @override
  String get multiline => 'Многострочное';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesRu extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не выбрано ни одного файла';
  @override
  String get content => 'Пожалуйста, добавьте как минимум один файл.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionRu extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нет разрешения';
  @override
  String get content => 'Вы не предоставили необходимые разрешения. Пожалуйста, предоставьте их в настройках.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformRu extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Недоступно';
  @override
  String get content => 'Эта функция доступна только на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrRu extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsRu extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Быстрые действия';
  @override
  String get counter => 'Счетчик';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Добавить нули в начале';
  @override
  String get sortBeforeCount => 'Отсортировать по алфавиту (А-Я)';
  @override
  String get random => 'Случайно';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeRu extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Запросы на получение файлов теперь принимаются автоматически. Будьте осторожны, все пользователи этой локальной сети могут отправлять вам файлы.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeRu extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Запросы на получение файлов теперь принимаются автоматически от устройств из вашего списка избранных.',
    'Предупреждение! На данный момент, это не совсем безопасно, поскольку хакер, имеющий отпечаток пальца любого устройства из вашего списка избранных, может беспрепятственно отправлять вам файлы.',
    'Однако, этот вариант все равно безопаснее, чем разрешить всем пользователям локальной сети беспрепятственно отправлять вам файлы.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinRu extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите PIN-код';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpRu extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Режимы отправки';
  @override
  String get single => 'Отправляет файлы одному получателю. Выборка будет очищена после завершения передачи файлов.';
  @override
  String get multiple => 'Отправляет файлы нескольким получателям. Выборка не будет очищена после завершения передачи файлов.';
  @override
  String get link => 'Получатели, у которых не установлен LocalSend, могут загрузить выбранные файлы, открыв ссылку в своем браузере.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomRu extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL-адрес';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsRu extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системная';
  @override
  String get dark => 'Темная';
  @override
  String get light => 'Светлая';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsRu extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системный';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsRu extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системный';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsRu extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Все';
  @override
  String get filtered => 'Фильтровано';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleRu extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Общее время передачи (${time})';
  @override
  String get finishedError => 'Завершено с ошибкой';
  @override
  String get canceledSender => 'Отменено отправителем';
  @override
  String get canceledReceiver => 'Отменено получателем';
}
