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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsRu({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Русский';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ru general = _Translations$general$ru._(_root);
  @override
  late final _Translations$receiveTab$ru receiveTab = _Translations$receiveTab$ru._(_root);
  @override
  late final _Translations$sendTab$ru sendTab = _Translations$sendTab$ru._(_root);
  @override
  late final _Translations$settingsTab$ru settingsTab = _Translations$settingsTab$ru._(_root);
  @override
  late final _Translations$troubleshootPage$ru troubleshootPage = _Translations$troubleshootPage$ru._(_root);
  @override
  late final _Translations$receiveHistoryPage$ru receiveHistoryPage = _Translations$receiveHistoryPage$ru._(_root);
  @override
  late final _Translations$apkPickerPage$ru apkPickerPage = _Translations$apkPickerPage$ru._(_root);
  @override
  late final _Translations$selectedFilesPage$ru selectedFilesPage = _Translations$selectedFilesPage$ru._(_root);
  @override
  late final _Translations$receivePage$ru receivePage = _Translations$receivePage$ru._(_root);
  @override
  late final _Translations$receiveOptionsPage$ru receiveOptionsPage = _Translations$receiveOptionsPage$ru._(_root);
  @override
  late final _Translations$sendPage$ru sendPage = _Translations$sendPage$ru._(_root);
  @override
  late final _Translations$progressPage$ru progressPage = _Translations$progressPage$ru._(_root);
  @override
  late final _Translations$webSharePage$ru webSharePage = _Translations$webSharePage$ru._(_root);
  @override
  late final _Translations$aboutPage$ru aboutPage = _Translations$aboutPage$ru._(_root);
  @override
  late final _Translations$donationPage$ru donationPage = _Translations$donationPage$ru._(_root);
  @override
  late final _Translations$changelogPage$ru changelogPage = _Translations$changelogPage$ru._(_root);
  @override
  late final _Translations$dialogs$ru dialogs = _Translations$dialogs$ru._(_root);
  @override
  late final _Translations$sanitization$ru sanitization = _Translations$sanitization$ru._(_root);
  @override
  late final _Translations$tray$ru tray = _Translations$tray$ru._(_root);
  @override
  late final _Translations$web$ru web = _Translations$web$ru._(_root);
  @override
  late final _Translations$assetPicker$ru assetPicker = _Translations$assetPicker$ru._(_root);
  @override
  late final _Translations$networkInterfacesPage$ru networkInterfacesPage = _Translations$networkInterfacesPage$ru._(_root);
}

// Path: general
class _Translations$general$ru extends Translations$general$en {
  _Translations$general$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$ru extends Translations$receiveTab$en {
  _Translations$receiveTab$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получить';
  @override
  late final _Translations$receiveTab$infoBox$ru infoBox = _Translations$receiveTab$infoBox$ru._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ru quickSave = _Translations$receiveTab$quickSave$ru._(_root);
}

// Path: sendTab
class _Translations$sendTab$ru extends Translations$sendTab$en {
  _Translations$sendTab$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отправить';
  @override
  late final _Translations$sendTab$selection$ru selection = _Translations$sendTab$selection$ru._(_root);
  @override
  late final _Translations$sendTab$picker$ru picker = _Translations$sendTab$picker$ru._(_root);
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
  late final _Translations$sendTab$sendModes$ru sendModes = _Translations$sendTab$sendModes$ru._(_root);
  @override
  String get sendModeHelp => 'Справка';
  @override
  String get help => 'Пожалуйста, убедитесь, что получатель находится в той же Wi-Fi сети, что и отправитель.';
  @override
  String get placeItems => 'Добавьте файлы, чтобы поделиться.';
}

// Path: settingsTab
class _Translations$settingsTab$ru extends Translations$settingsTab$en {
  _Translations$settingsTab$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Настройки';
  @override
  late final _Translations$settingsTab$general$ru general = _Translations$settingsTab$general$ru._(_root);
  @override
  late final _Translations$settingsTab$receive$ru receive = _Translations$settingsTab$receive$ru._(_root);
  @override
  late final _Translations$settingsTab$send$ru send = _Translations$settingsTab$send$ru._(_root);
  @override
  late final _Translations$settingsTab$network$ru network = _Translations$settingsTab$network$ru._(_root);
  @override
  late final _Translations$settingsTab$other$ru other = _Translations$settingsTab$other$ru._(_root);
  @override
  String get advancedSettings => 'Расширенные настройки';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ru extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$ru firewall = _Translations$troubleshootPage$firewall$ru._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ru noDiscovery = _Translations$troubleshootPage$noDiscovery$ru._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ru noConnection = _Translations$troubleshootPage$noConnection$ru._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ru extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$ru entryActions = _Translations$receiveHistoryPage$entryActions$ru._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ru extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$ru extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Удалить все';
}

// Path: receivePage
class _Translations$receivePage$ru extends Translations$receivePage$en {
  _Translations$receivePage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$receiveOptionsPage$ru extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$ru extends Translations$sendPage$en {
  _Translations$sendPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$ru extends Translations$progressPage$en {
  _Translations$progressPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Отправка файлов';
  @override
  String get titleReceiving => 'Получение файлов';
  @override
  String get savedToGallery => 'Сохранено в галереи';
  @override
  late final _Translations$progressPage$total$ru total = _Translations$progressPage$total$ru._(_root);
  @override
  late final _Translations$progressPage$remainingTime$ru remainingTime = _Translations$progressPage$remainingTime$ru._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ru extends Translations$webSharePage$en {
  _Translations$webSharePage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$ru extends Translations$aboutPage$en {
  _Translations$aboutPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$ru extends Translations$donationPage$en {
  _Translations$donationPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$ru extends Translations$changelogPage$en {
  _Translations$changelogPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'История изменений';
}

// Path: dialogs
class _Translations$dialogs$ru extends Translations$dialogs$en {
  _Translations$dialogs$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ru addFile = _Translations$dialogs$addFile$ru._(_root);
  @override
  late final _Translations$dialogs$openFile$ru openFile = _Translations$dialogs$openFile$ru._(_root);
  @override
  late final _Translations$dialogs$addressInput$ru addressInput = _Translations$dialogs$addressInput$ru._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ru cancelSession = _Translations$dialogs$cancelSession$ru._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ru cannotOpenFile = _Translations$dialogs$cannotOpenFile$ru._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ru encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ru._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ru errorDialog = _Translations$dialogs$errorDialog$ru._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ru favoriteDialog = _Translations$dialogs$favoriteDialog$ru._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ru favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ru._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ru favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ru._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ru fileInfo = _Translations$dialogs$fileInfo$ru._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ru fileNameInput = _Translations$dialogs$fileNameInput$ru._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ru historyClearDialog = _Translations$dialogs$historyClearDialog$ru._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ru localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ru._(_root);
  @override
  late final _Translations$dialogs$messageInput$ru messageInput = _Translations$dialogs$messageInput$ru._(_root);
  @override
  late final _Translations$dialogs$noFiles$ru noFiles = _Translations$dialogs$noFiles$ru._(_root);
  @override
  late final _Translations$dialogs$noPermission$ru noPermission = _Translations$dialogs$noPermission$ru._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ru notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ru._(_root);
  @override
  late final _Translations$dialogs$qr$ru qr = _Translations$dialogs$qr$ru._(_root);
  @override
  late final _Translations$dialogs$quickActions$ru quickActions = _Translations$dialogs$quickActions$ru._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ru quickSaveNotice = _Translations$dialogs$quickSaveNotice$ru._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ru quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ru._(_root);
  @override
  late final _Translations$dialogs$pin$ru pin = _Translations$dialogs$pin$ru._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ru sendModeHelp = _Translations$dialogs$sendModeHelp$ru._(_root);
  @override
  late final _Translations$dialogs$zoom$ru zoom = _Translations$dialogs$zoom$ru._(_root);
}

// Path: sanitization
class _Translations$sanitization$ru extends Translations$sanitization$en {
  _Translations$sanitization$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Имя файла не может быть пустым';
  @override
  String get invalid => 'Имя файла содержит недопустимые символы';
}

// Path: tray
class _Translations$tray$ru extends Translations$tray$en {
  _Translations$tray$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$web$ru extends Translations$web$en {
  _Translations$web$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$ru extends Translations$assetPicker$en {
  _Translations$assetPicker$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$ru extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$ru extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$ru extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$ru extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$ru extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$ru extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$ru extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Общие';
  @override
  String get brightness => 'Тема';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ru brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ru._(
    _root,
  );
  @override
  String get color => 'Цвет';
  @override
  late final _Translations$settingsTab$general$colorOptions$ru colorOptions = _Translations$settingsTab$general$colorOptions$ru._(_root);
  @override
  String get language => 'Язык';
  @override
  late final _Translations$settingsTab$general$languageOptions$ru languageOptions = _Translations$settingsTab$general$languageOptions$ru._(_root);
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
class _Translations$settingsTab$receive$ru extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$ru extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отправка';
  @override
  String get shareViaLinkAutoAccept => 'Автоматически принимать запросы в режиме "Поделиться по ссылке"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ru extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$ru networkOptions = _Translations$settingsTab$network$networkOptions$ru._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ru extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$ru extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Это устройство может отправлять файлы на другие устройства, но другие устройства не могут отправлять файлы на это устройство.';
  @override
  String solution({required Object port}) =>
      'Скорее всего, это проблема брандмауэра. Вы можете решить эту проблему, разрешив входящие соединения (UDP и TCP) для порта ${port}.';
  @override
  String get openFirewall => 'Открыть брандмауэр';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ru extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Это устройство не может найти другие устройства.';
  @override
  String get solution =>
      'Пожалуйста, убедитесь, что оба устройства находятся в одной Wi-Fi сети и имеют одинаковую конфигурацию (порт, адрес мультивещания, шифрование). Вы можете попробовать ввести IP-адрес целевого устройства вручную. Если это сработает, подумайте о том, чтобы добавить это устройство в избранное, чтобы его можно было автоматически находить в будущем.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ru extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Оба устройства не могут найти друг друга и не могут обмениваться файлами.';
  @override
  String get solution =>
      'Проблема существует с обеих сторон? Итак, вам нужно убедиться, что оба устройства находятся в одной Wi-Fi сети и имеют одинаковую конфигурацию (порт, адрес мультивещания, шифрование). Сеть Wi-Fi может не разрешать обмен (передачу) между участниками. В этом случае, вам необходимо включить эту опцию на своем маршрутизаторе.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ru extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$ru extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ru title = _Translations$progressPage$total$title$ru._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлов: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Размер: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Скорость: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$ru extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Используйте "h" для обозначения часов, а "m" для минут
  @override
  String hours({required Object h, required Object m}) => '${h}ч ${m}мин';

  /// Используйте "d" для дней, "h" для часов и "m" для минут
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}д ${h}ч ${m}мин';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ru extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Добавить в выборку';
  @override
  String get content => 'Что вы хотите добавить?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ru extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Открыть файл';
  @override
  String get content => 'Хотите открыть полученный файл?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ru extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$ru extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отменить отправку файлов';
  @override
  String get content => 'Вы действительно хотите отменить отправку файлов?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ru extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не удалось открыть файл';
  @override
  String content({required Object file}) => 'Не удалось открыть "${file}". Возможно, этот файл был перемещен, переименован или удален?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ru extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрование отключено';
  @override
  String get content => 'Связь теперь происходит по незашифрованному HTTP протоколу. Чтобы использовать протокол HTTPS, снова включите шифрование.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ru extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ru extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$ru extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Удалить из избранных';
  @override
  String content({required Object name}) => 'Вы действительно хотите удалить из избранных "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ru extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$ru extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$ru extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите имя файла';
  @override
  String original({required Object original}) => 'Оригинальное имя файла: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ru extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистить историю';
  @override
  String get content => 'Вы действительно хотите удалить всю историю?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ru extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$ru extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите сообщение';
  @override
  String get multiline => 'Многострочное';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ru extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не выбрано ни одного файла';
  @override
  String get content => 'Пожалуйста, добавьте как минимум один файл.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ru extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нет разрешения';
  @override
  String get content => 'Вы не предоставили необходимые разрешения. Пожалуйста, предоставьте их в настройках.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ru extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Недоступно';
  @override
  String get content => 'Эта функция доступна только на:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ru extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ru extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$ru extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Запросы на получение файлов теперь принимаются автоматически. Будьте осторожны, все пользователи этой локальной сети могут отправлять вам файлы.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ru extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$ru extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введите PIN-код';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ru extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$ru extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL-адрес';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ru extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$ru extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системный';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ru extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системный';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ru extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ru._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Все';
  @override
  String get filtered => 'Фильтровано';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ru extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ru._(TranslationsRu root) : this._root = root, super.internal(root);

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
