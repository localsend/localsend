part of 'strings.g.dart';

// Path: <root>
class _StringsRu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Русский';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralRu general = _StringsGeneralRu._(_root);
	@override late final _StringsReceiveTabRu receiveTab = _StringsReceiveTabRu._(_root);
	@override late final _StringsSendTabRu sendTab = _StringsSendTabRu._(_root);
	@override late final _StringsSettingsTabRu settingsTab = _StringsSettingsTabRu._(_root);
	@override late final _StringsTroubleshootPageRu troubleshootPage = _StringsTroubleshootPageRu._(_root);
	@override late final _StringsReceiveHistoryPageRu receiveHistoryPage = _StringsReceiveHistoryPageRu._(_root);
	@override late final _StringsApkPickerPageRu apkPickerPage = _StringsApkPickerPageRu._(_root);
	@override late final _StringsSelectedFilesPageRu selectedFilesPage = _StringsSelectedFilesPageRu._(_root);
	@override late final _StringsReceivePageRu receivePage = _StringsReceivePageRu._(_root);
	@override late final _StringsReceiveOptionsPageRu receiveOptionsPage = _StringsReceiveOptionsPageRu._(_root);
	@override late final _StringsSendPageRu sendPage = _StringsSendPageRu._(_root);
	@override late final _StringsProgressPageRu progressPage = _StringsProgressPageRu._(_root);
	@override late final _StringsWebSharePageRu webSharePage = _StringsWebSharePageRu._(_root);
	@override late final _StringsAboutPageRu aboutPage = _StringsAboutPageRu._(_root);
	@override late final _StringsDonationPageRu donationPage = _StringsDonationPageRu._(_root);
	@override late final _StringsChangelogPageRu changelogPage = _StringsChangelogPageRu._(_root);
	@override late final _StringsAliasGeneratorRu aliasGenerator = _StringsAliasGeneratorRu._(_root);
	@override late final _StringsDialogsRu dialogs = _StringsDialogsRu._(_root);
	@override late final _StringsTrayRu tray = _StringsTrayRu._(_root);
	@override late final _StringsWebRu web = _StringsWebRu._(_root);
	@override late final _StringsAssetPickerRu assetPicker = _StringsAssetPickerRu._(_root);
}

// Path: general
class _StringsGeneralRu extends _StringsGeneralEn {
	_StringsGeneralRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Принять';
	@override String get accepted => 'Принято';
	@override String get add => 'Добавить';
	@override String get advanced => 'Подробнее';
	@override String get cancel => 'Отменить';
	@override String get close => 'Закрыть';
	@override String get confirm => 'Подтвердить';
	@override String get continueStr => 'Продолжить';
	@override String get copy => 'Скопировать';
	@override String get copiedToClipboard => 'Скопировано в буфер обмена';
	@override String get decline => 'Отклонить';
	@override String get done => 'Готово';
	@override String get delete => 'Удалить';
	@override String get edit => 'Редактировать';
	@override String get error => 'Ошибка';
	@override String get example => 'Пример';
	@override String get files => 'Файлы';
	@override String get finished => 'Завершено';
	@override String get hide => 'Скрыть';
	@override String get off => 'Отключено';
	@override String get offline => 'Не в сети';
	@override String get on => 'Включено';
	@override String get online => 'В сети';
	@override String get open => 'Открыть';
	@override String get queue => 'Очередь';
	@override String get quickSave => 'Быстрое сохранение';
	@override String get renamed => 'Переименовано';
	@override String get reset => 'Сброс настроек';
	@override String get restart => 'Перезагрузка';
	@override String get settings => 'Настройки';
	@override String get skipped => 'Отклонено';
	@override String get start => 'Запуск';
	@override String get stop => 'Остановить';
	@override String get save => 'Сохранить';
	@override String get unchanged => 'Без изменений';
	@override String get unknown => 'Неизвестно';
	@override String get noItemInClipboard => 'Буфер обмена пуст';
}

// Path: receiveTab
class _StringsReceiveTabRu extends _StringsReceiveTabEn {
	_StringsReceiveTabRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Получить';
	@override late final _StringsReceiveTabInfoBoxRu infoBox = _StringsReceiveTabInfoBoxRu._(_root);
}

// Path: sendTab
class _StringsSendTabRu extends _StringsSendTabEn {
	_StringsSendTabRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отправить';
	@override late final _StringsSendTabSelectionRu selection = _StringsSendTabSelectionRu._(_root);
	@override late final _StringsSendTabPickerRu picker = _StringsSendTabPickerRu._(_root);
	@override String get shareIntentInfo => 'Также вы можете использовать функцию "Поделиться" вашего мобильного устройства для более быстрого выбора файлов.';
	@override String get nearbyDevices => 'Устройства поблизости';
	@override String get thisDevice => 'Это устройство';
	@override String get scan => 'Поиск устройств';
	@override String get sendMode => 'Режим отправки';
	@override late final _StringsSendTabSendModesRu sendModes = _StringsSendTabSendModesRu._(_root);
	@override String get sendModeHelp => 'Примечание';
	@override String get help => 'Пожалуйста, убедитесь, что получатель находится в той же Wi-Fi сети, что и отправитель.';
	@override String get placeItems => 'Добавьте файлы, чтобы поделиться.';
}

// Path: settingsTab
class _StringsSettingsTabRu extends _StringsSettingsTabEn {
	_StringsSettingsTabRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override late final _StringsSettingsTabGeneralRu general = _StringsSettingsTabGeneralRu._(_root);
	@override late final _StringsSettingsTabReceiveRu receive = _StringsSettingsTabReceiveRu._(_root);
	@override late final _StringsSettingsTabNetworkRu network = _StringsSettingsTabNetworkRu._(_root);
	@override late final _StringsSettingsTabOtherRu other = _StringsSettingsTabOtherRu._(_root);
	@override String get advancedSettings => 'Дополнительные настройки';
}

// Path: troubleshootPage
class _StringsTroubleshootPageRu extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Устранение неполадок';
	@override String get subTitle => 'Это приложение не работает должным образом? Здесь вы найдёте общие решения проблем.';
	@override String get solution => 'Решение:';
	@override String get fixButton => 'Исправить автоматически';
	@override late final _StringsTroubleshootPageFirewallRu firewall = _StringsTroubleshootPageFirewallRu._(_root);
	@override late final _StringsTroubleshootPageNoConnectionRu noConnection = _StringsTroubleshootPageNoConnectionRu._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageRu extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'История';
	@override String get openFolder => 'Открыть папку';
	@override String get deleteHistory => 'Очистить историю';
	@override String get empty => 'История пуста.';
	@override late final _StringsReceiveHistoryPageEntryActionsRu entryActions = _StringsReceiveHistoryPageEntryActionsRu._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageRu extends _StringsApkPickerPageEn {
	_StringsApkPickerPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Приложения (APK)';
	@override String get excludeSystemApps => 'Исключить системные приложения';
	@override String get excludeAppsWithoutLaunchIntent => 'Исключить незапускаемые приложения';
	@override String apps({required Object n}) => '${n} приложений';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageRu extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Удалить все';
}

// Path: receivePage
class _StringsReceivePageRu extends _StringsReceivePageEn {
	_StringsReceivePageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'хочет отправить вам файл',
		other: 'хочет отправить вам ${n} файлы (-ов)',
	);
	@override String get subTitleMessage => 'отправил вам сообщение:';
	@override String get subTitleLink => 'отправил вам ссылку:';
	@override String get canceled => 'Отправитель отменил запрос на передачу файлов.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageRu extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Параметры получения';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Папка LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Отключено автоматически, поскольку есть папки.';
}

// Path: sendPage
class _StringsSendPageRu extends _StringsSendPageEn {
	_StringsSendPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Ожидание ответа...';
	@override String get rejected => 'Получатель отклонил запрос.';
	@override String get busy => 'Получатель занят другим запросом.';
}

// Path: progressPage
class _StringsProgressPageRu extends _StringsProgressPageEn {
	_StringsProgressPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Отправка файлов';
	@override String get titleReceiving => 'Получение файлов';
	@override String get savedToGallery => 'Сохранено в галереи';
	@override late final _StringsProgressPageTotalRu total = _StringsProgressPageTotalRu._(_root);
}

// Path: webSharePage
class _StringsWebSharePageRu extends _StringsWebSharePageEn {
	_StringsWebSharePageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Поделиться по ссылке';
	@override String get loading => 'Запуск сервера...';
	@override String get stopping => 'Остановка сервера...';
	@override String get error => 'При запуске сервера произошла ошибка.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'Откройте эту ссылку в браузере:',
		other: 'Откройте одну из этих ссылок в браузере:',
	);
	@override String get requests => 'Запросы';
	@override String get noRequests => 'Запросов пока нет.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend использует самоподписанный сертификат. Вам необходимо принять его в браузере.';
	@override String pendingRequests({required Object n}) => 'Ожидающие запросы: ${n}';
}

// Path: aboutPage
class _StringsAboutPageRu extends _StringsAboutPageEn {
	_StringsAboutPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'О LocalSend';
	@override List<String> get description => [
		'LocalSend — это бесплатное приложение с открытым исходным кодом, которое позволяет вам безопасно обмениваться файлами и сообщениями с находящимися поблизости устройствами через локальную сеть без необходимости подключения к Интернету.',
		'Это приложение доступно на Android, iOS, macOS, Windows и Linux. Вы можете найти все варианты загрузки на официальной домашней странице.',
	];
	@override String get author => 'Автор';
	@override String get contributors => 'Участники';
	@override String get translators => 'Переводчики';
}

// Path: donationPage
class _StringsDonationPageRu extends _StringsDonationPageEn {
	_StringsDonationPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Пожертвовать';
	@override String get info => 'LocalSend бесплатен, имеет открытый исходный код и не содержит рекламы. Если вам нравится приложение, вы можете поддержать его разработку пожертвованием.';
	@override String donate({required Object amount}) => 'Пожертвовать ${amount}';
	@override String get thanks => 'Большое спасибо!';
	@override String get restore => 'Восстановить покупку';
}

// Path: changelogPage
class _StringsChangelogPageRu extends _StringsChangelogPageEn {
	_StringsChangelogPageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'История изменений';
}

// Path: aliasGenerator
class _StringsAliasGeneratorRu extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsRu extends _StringsDialogsEn {
	_StringsDialogsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileRu addFile = _StringsDialogsAddFileRu._(_root);
	@override late final _StringsDialogsAddressInputRu addressInput = _StringsDialogsAddressInputRu._(_root);
	@override late final _StringsDialogsCancelSessionRu cancelSession = _StringsDialogsCancelSessionRu._(_root);
	@override late final _StringsDialogsCannotOpenFileRu cannotOpenFile = _StringsDialogsCannotOpenFileRu._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeRu encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeRu._(_root);
	@override late final _StringsDialogsErrorDialogRu errorDialog = _StringsDialogsErrorDialogRu._(_root);
	@override late final _StringsDialogsFavoriteDialogRu favoriteDialog = _StringsDialogsFavoriteDialogRu._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogRu favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogRu._(_root);
	@override late final _StringsDialogsFavoriteEditDialogRu favoriteEditDialog = _StringsDialogsFavoriteEditDialogRu._(_root);
	@override late final _StringsDialogsFileInfoRu fileInfo = _StringsDialogsFileInfoRu._(_root);
	@override late final _StringsDialogsFileNameInputRu fileNameInput = _StringsDialogsFileNameInputRu._(_root);
	@override late final _StringsDialogsHistoryClearDialogRu historyClearDialog = _StringsDialogsHistoryClearDialogRu._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedRu localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedRu._(_root);
	@override late final _StringsDialogsMessageInputRu messageInput = _StringsDialogsMessageInputRu._(_root);
	@override late final _StringsDialogsNoFilesRu noFiles = _StringsDialogsNoFilesRu._(_root);
	@override late final _StringsDialogsNoPermissionRu noPermission = _StringsDialogsNoPermissionRu._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformRu notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformRu._(_root);
	@override late final _StringsDialogsQrRu qr = _StringsDialogsQrRu._(_root);
	@override late final _StringsDialogsQuickActionsRu quickActions = _StringsDialogsQuickActionsRu._(_root);
	@override late final _StringsDialogsQuickSaveNoticeRu quickSaveNotice = _StringsDialogsQuickSaveNoticeRu._(_root);
	@override late final _StringsDialogsSendModeHelpRu sendModeHelp = _StringsDialogsSendModeHelpRu._(_root);
}

// Path: tray
class _StringsTrayRu extends _StringsTrayEn {
	_StringsTrayRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Выйти из LocalSend';
}

// Path: web
class _StringsWebRu extends _StringsWebEn {
	_StringsWebRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Отклонено';
	@override String get files => 'Файлов';
	@override String get fileName => 'Имя файла';
	@override String get size => 'Размер';
}

// Path: assetPicker
class _StringsAssetPickerRu extends _StringsAssetPickerEn {
	_StringsAssetPickerRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Подтвердить';
	@override String get cancel => 'Отмена';
	@override String get edit => 'Изменить';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Загрузка не удалась';
	@override String get original => 'Оригинал';
	@override String get preview => 'Предпросмотр';
	@override String get select => 'Выбрать';
	@override String get emptyList => 'Список пуст';
	@override String get unSupportedAssetType => 'Неподдерживаемый тип файла.';
	@override String get unableToAccessAll => 'Не удаётся получить доступ ко всем файлам на устройстве';
	@override String get viewingLimitedAssetsTip => 'Показывать файлы, к которым у приложения есть доступ.';
	@override String get changeAccessibleLimitedAssets => 'Разрешить доступ к дополнительным файлам';
	@override String get accessAllTip => 'У приложения есть доступ только к некоторым файлам на устройстве. Откройте настройки системы и разрешите приложению доступ ко всем файлам на устройстве.';
	@override String get goToSystemSettings => 'Открыть настройки системы';
	@override String get accessLimitedAssets => 'Продолжить с ограниченным доступом';
	@override String get accessiblePathName => 'Доступные файлы';
	@override String get sTypeAudioLabel => 'Аудио';
	@override String get sTypeImageLabel => 'Изображение';
	@override String get sTypeVideoLabel => 'Видео';
	@override String get sTypeOtherLabel => 'Другие медиафайлы';
	@override String get sActionPlayHint => 'воспроизвести';
	@override String get sActionPreviewHint => 'предпросмотр';
	@override String get sActionSelectHint => 'выбрать';
	@override String get sActionSwitchPathLabel => 'изменить путь';
	@override String get sActionUseCameraHint => 'использовать камеру';
	@override String get sNameDurationLabel => 'продолжительность';
	@override String get sUnitAssetCountLabel => 'количество';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxRu extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Порт:';
	@override String get alias => 'Имя устройства:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionRu extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выборка';
	@override String files({required Object files}) => 'Файлов: ${files}';
	@override String size({required Object size}) => 'Размер: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerRu extends _StringsSendTabPickerEn {
	_StringsSendTabPickerRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get file => 'Файл';
	@override String get folder => 'Папка';
	@override String get media => 'Медиа';
	@override String get text => 'Текст';
	@override String get app => 'Приложение';
	@override String get clipboard => 'Вставить';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesRu extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get single => 'Один получатель';
	@override String get multiple => 'Несколько получателей';
	@override String get link => 'Поделиться по ссылке';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralRu extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Общие';
	@override String get brightness => 'Тема';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsRu brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsRu._(_root);
	@override String get color => 'Цвет';
	@override late final _StringsSettingsTabGeneralColorOptionsRu colorOptions = _StringsSettingsTabGeneralColorOptionsRu._(_root);
	@override String get language => 'Язык';
	@override late final _StringsSettingsTabGeneralLanguageOptionsRu languageOptions = _StringsSettingsTabGeneralLanguageOptionsRu._(_root);
	@override String get saveWindowPlacement => 'Сохранить расположение окна после закрытия';
	@override String get minimizeToTray => 'Закрыть: свернуть в системный трей/строку меню';
	@override String get launchAtStartup => 'Автозагрузка';
	@override String get launchMinimized => 'Скрытая автозагрузка';
	@override String get animations => 'Анимации';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveRu extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Получение';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Автозавершение';
	@override String get destination => 'Сохранять в';
	@override String get downloads => '(Загрузки)';
	@override String get saveToGallery => 'Сохранять медиафайлы в галерею';
	@override String get saveToHistory => 'Сохранять историю';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkRu extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сеть';
	@override String get needRestart => 'Для применения изменений необходимо перезапустить сервер!';
	@override String get server => 'Сервер';
	@override String get alias => 'Имя устройства';
	@override String get deviceType => 'Тип устройства';
	@override String get deviceModel => 'Модель устройства';
	@override String get port => 'Порт';
	@override String portWarning({required Object defaultPort}) => 'Другие устройства могут вас не обнаружить, поскольку вы используете пользовательский порт. (default: ${defaultPort})';
	@override String get encryption => 'Шифрование';
	@override String get multicastGroup => 'Мультивещание';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Другие устройства могут вас не обнаружить, поскольку вы используете пользовательский адрес мультивещания. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherRu extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Другое';
	@override String get support => 'Поддержать LocalSend';
	@override String get donate => 'Пожертвовать';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get termsOfUse => 'Условия использования';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallRu extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Это приложение может отправлять файлы на другие устройства, но другие устройства не могут отправлять файлы на это устройство.';
	@override String solution({required Object port}) => 'Скорее всего, проблема с брандмауэром. Вы можете решить эту проблему, разрешив входящие соединения (UDP и TCP) для порта ${port}.';
	@override String get openFirewall => 'Открыть брандмауэр';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionRu extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Оба устройства не могут обнаружить друг друга и не могут обмениваться файлами.';
	@override String get solution => 'Проблема с обеих сторон? Вам нужно убедиться, что оба устройства находятся в одной сети Wi-Fi и используют одинаковую конфигурацию (порт, адрес мультивещания, шифрование). Wi-Fi может не разрешать обмен (передачу) между участниками. В этом случае Вам необходимо включить данную опцию на своём маршрутизаторе.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsRu extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get open => 'Открыть файл';
	@override String get info => 'Информация';
	@override String get deleteFromHistory => 'Удалить из истории';
}

// Path: progressPage.total
class _StringsProgressPageTotalRu extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleRu title = _StringsProgressPageTotalTitleRu._(_root);
	@override String count({required Object curr, required Object n}) => 'Файлов: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Размер: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Скорость: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileRu extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Добавить в выборку';
	@override String get content => 'Что вы хотите добавить?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputRu extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введите адрес';
	@override String get hashtag => 'Хэштег';
	@override String get ip => 'IP-адрес';
	@override String get recentlyUsed => 'Недавно использованные: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionRu extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отменить отправку файлов';
	@override String get content => 'Вы действительно хотите отменить отправку файлов?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileRu extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Не удалось открыть файл';
	@override String content({required Object file}) => 'Не удалось открыть "${file}". Возможно, файл перемещён, переименован или удалён?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeRu extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Шифрование отключено';
	@override String get content => 'Связь происходит по незашифрованному HTTP-протоколу. Чтобы использовать HTTPS, включите шифрование.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogRu extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogRu extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Избранное';
	@override String get noFavorites => 'Избранных устройств пока нет.';
	@override String get addFavorite => 'Добавить';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogRu extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Удалить из избранных';
	@override String content({required Object name}) => 'Вы действительно хотите удалить из избранных "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogRu extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Добавить в избранное';
	@override String get titleEdit => 'Настройки';
	@override String get name => 'Имя устройства';
	@override String get auto => '(автоматически)';
	@override String get ip => 'IP-адрес';
	@override String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoRu extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'О файле';
	@override String get fileName => 'Имя файла:';
	@override String get path => 'Путь:';
	@override String get size => 'Размер:';
	@override String get sender => 'Отправитель:';
	@override String get time => 'Время:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputRu extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введите имя файла';
	@override String original({required Object original}) => 'Оригинальное имя файла: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogRu extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Очистить историю';
	@override String get content => 'Вы действительно хотите удалить всю историю?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedRu extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend не может найти другие устройства без разрешения на сканирование локальной сети. Пожалуйста, предоставьте это разрешение в настройках.';
	@override String get gotoSettings => 'Настройки';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputRu extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введите сообщение';
	@override String get multiline => 'Многострочное';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesRu extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Файлы не выбраны';
	@override String get content => 'Пожалуйста, добавьте, как минимум, один файл.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionRu extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Нет разрешения';
	@override String get content => 'Вы не предоставили необходимые разрешения. Пожалуйста, предоставьте их в настройках.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformRu extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Недоступно';
	@override String get content => 'Эта функция доступна только на:';
}

// Path: dialogs.qr
class _StringsDialogsQrRu extends _StringsDialogsQrEn {
	_StringsDialogsQrRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsRu extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Быстрые действия';
	@override String get counter => 'Счётчик';
	@override String get prefix => 'Префикс';
	@override String get padZero => 'Добавить нули в начале';
	@override String get sortBeforeCount => 'Отсортировать по алфавиту (А-Я)';
	@override String get random => 'Случайно';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeRu extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Запросы на получение файлов теперь принимаются автоматически. Будьте осторожны, все пользователи этой локальной сети могут отправлять вам файлы.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpRu extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Режимы отправки';
	@override String get single => 'Отправляет файлы одному получателю. Выбор будет очищен после завершения передачи файла.';
	@override String get multiple => 'Отправляет файлы нескольким получателям. Выбор не будет очищен.';
	@override String get link => 'Получатели, у которых не установлен LocalSend, могут загрузить выбранные файлы по ссылке.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsRu extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системная';
	@override String get dark => 'Тёмная';
	@override String get light => 'Светлая';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsRu extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системный';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsRu extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системный';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleRu extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Общее время передачи (${time})';
	@override String get finishedError => 'Завершено с ошибкой';
	@override String get canceledSender => 'Отменено отправителем';
	@override String get canceledReceiver => 'Отменено получателем';
}
