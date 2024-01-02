part of 'strings.g.dart';

// Path: <root>
class _StringsUk extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsUk _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Українська';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralUk general = _StringsGeneralUk._(_root);
	@override late final _StringsReceiveTabUk receiveTab = _StringsReceiveTabUk._(_root);
	@override late final _StringsSendTabUk sendTab = _StringsSendTabUk._(_root);
	@override late final _StringsSettingsTabUk settingsTab = _StringsSettingsTabUk._(_root);
	@override late final _StringsTroubleshootPageUk troubleshootPage = _StringsTroubleshootPageUk._(_root);
	@override late final _StringsReceiveHistoryPageUk receiveHistoryPage = _StringsReceiveHistoryPageUk._(_root);
	@override late final _StringsApkPickerPageUk apkPickerPage = _StringsApkPickerPageUk._(_root);
	@override late final _StringsSelectedFilesPageUk selectedFilesPage = _StringsSelectedFilesPageUk._(_root);
	@override late final _StringsReceivePageUk receivePage = _StringsReceivePageUk._(_root);
	@override late final _StringsReceiveOptionsPageUk receiveOptionsPage = _StringsReceiveOptionsPageUk._(_root);
	@override late final _StringsSendPageUk sendPage = _StringsSendPageUk._(_root);
	@override late final _StringsProgressPageUk progressPage = _StringsProgressPageUk._(_root);
	@override late final _StringsWebSharePageUk webSharePage = _StringsWebSharePageUk._(_root);
	@override late final _StringsAboutPageUk aboutPage = _StringsAboutPageUk._(_root);
	@override late final _StringsDonationPageUk donationPage = _StringsDonationPageUk._(_root);
	@override late final _StringsChangelogPageUk changelogPage = _StringsChangelogPageUk._(_root);
	@override late final _StringsAliasGeneratorUk aliasGenerator = _StringsAliasGeneratorUk._(_root);
	@override late final _StringsDialogsUk dialogs = _StringsDialogsUk._(_root);
	@override late final _StringsTrayUk tray = _StringsTrayUk._(_root);
	@override late final _StringsWebUk web = _StringsWebUk._(_root);
	@override late final _StringsAssetPickerUk assetPicker = _StringsAssetPickerUk._(_root);
}

// Path: general
class _StringsGeneralUk extends _StringsGeneralEn {
	_StringsGeneralUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Прийняти';
	@override String get accepted => 'Прийнято';
	@override String get add => 'Додати';
	@override String get advanced => 'Детальніше';
	@override String get cancel => 'Скасувати';
	@override String get close => 'Закрити';
	@override String get confirm => 'Підтвердити';
	@override String get continueStr => 'Продовжити';
	@override String get copy => 'Копіювати';
	@override String get copiedToClipboard => 'Скопійовано в буфер обміну';
	@override String get decline => 'Відхилити';
	@override String get done => 'Виконано';
	@override String get delete => 'Видалити';
	@override String get edit => 'Редагувати';
	@override String get error => 'Помилка';
	@override String get example => 'Приклад';
	@override String get files => 'Файли';
	@override String get finished => 'Виконано';
	@override String get hide => 'Приховати';
	@override String get off => 'Вимкнено';
	@override String get offline => 'Не в мережі';
	@override String get on => 'Увімкнено';
	@override String get online => 'В мережі';
	@override String get open => 'Відкрити';
	@override String get queue => 'Черга';
	@override String get quickSave => 'Швидке збереження';
	@override String get renamed => 'Перейменовано';
	@override String get reset => 'Скидання налаштувань';
	@override String get restart => 'Перезавантаження';
	@override String get settings => 'Налаштування';
	@override String get skipped => 'Відхилено';
	@override String get start => 'Запуск';
	@override String get stop => 'Зупинити';
	@override String get save => 'Зберегти';
	@override String get unchanged => 'Без змін';
	@override String get unknown => 'Невідомо';
	@override String get noItemInClipboard => 'Буфер обміну порожній';
}

// Path: receiveTab
class _StringsReceiveTabUk extends _StringsReceiveTabEn {
	_StringsReceiveTabUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отримати';
	@override late final _StringsReceiveTabInfoBoxUk infoBox = _StringsReceiveTabInfoBoxUk._(_root);
}

// Path: sendTab
class _StringsSendTabUk extends _StringsSendTabEn {
	_StringsSendTabUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Надіслати';
	@override late final _StringsSendTabSelectionUk selection = _StringsSendTabSelectionUk._(_root);
	@override late final _StringsSendTabPickerUk picker = _StringsSendTabPickerUk._(_root);
	@override String get shareIntentInfo => 'Ви також можете використовувати кнопку "Поділитися" на своєму мобільному пристрої для швидкого вибору файлів.';
	@override String get nearbyDevices => 'Пристрої поблизу';
	@override String get thisDevice => 'Цей пристрій';
	@override String get scan => 'Пошук пристроїв';
	@override String get sendMode => 'Режим надсилання';
	@override late final _StringsSendTabSendModesUk sendModes = _StringsSendTabSendModesUk._(_root);
	@override String get sendModeHelp => 'Довідка';
	@override String get help => 'Будь ласка, переконайтесь, що одержувач перебуває в тій же ж Wi-Fi мережі, що і відправник.';
	@override String get placeItems => 'Додайте сюди файли, щоб поділитися.';
}

// Path: settingsTab
class _StringsSettingsTabUk extends _StringsSettingsTabEn {
	_StringsSettingsTabUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Налаштування';
	@override late final _StringsSettingsTabGeneralUk general = _StringsSettingsTabGeneralUk._(_root);
	@override late final _StringsSettingsTabReceiveUk receive = _StringsSettingsTabReceiveUk._(_root);
	@override late final _StringsSettingsTabNetworkUk network = _StringsSettingsTabNetworkUk._(_root);
	@override late final _StringsSettingsTabOtherUk other = _StringsSettingsTabOtherUk._(_root);
	@override String get advancedSettings => 'Розширені налаштування';
}

// Path: troubleshootPage
class _StringsTroubleshootPageUk extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Усунення несправностей';
	@override String get subTitle => 'Цей додаток не працює належним чином? Тут можна знайти загальні рішення проблем.';
	@override String get solution => 'Рішення:';
	@override String get fixButton => 'Виправити автоматично';
	@override late final _StringsTroubleshootPageFirewallUk firewall = _StringsTroubleshootPageFirewallUk._(_root);
	@override late final _StringsTroubleshootPageNoConnectionUk noConnection = _StringsTroubleshootPageNoConnectionUk._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageUk extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Історія';
	@override String get openFolder => 'Відкрити теку';
	@override String get deleteHistory => 'Очистити історію';
	@override String get empty => 'Історія порожня.';
	@override late final _StringsReceiveHistoryPageEntryActionsUk entryActions = _StringsReceiveHistoryPageEntryActionsUk._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageUk extends _StringsApkPickerPageEn {
	_StringsApkPickerPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додатки (APK)';
	@override String get excludeSystemApps => 'Виключити системні додатки';
	@override String get excludeAppsWithoutLaunchIntent => 'Виключити додатки, які не запускаються';
	@override String apps({required Object n}) => '${n} додатків';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageUk extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Видалити все';
}

// Path: receivePage
class _StringsReceivePageUk extends _StringsReceivePageEn {
	_StringsReceivePageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(n,
		one: 'хоче надіслати вам файл',
		other: 'хоче надіслати вам ${n} файли (-ів)',
	);
	@override String get subTitleMessage => 'надіслав вам повідомлення:';
	@override String get subTitleLink => 'надіслав вам посилання:';
	@override String get canceled => 'Відправник скасував запит на передачу файлів.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageUk extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Параметри отримання';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Тека LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Вимкнено автоматично, оскільки є каталоги.';
}

// Path: sendPage
class _StringsSendPageUk extends _StringsSendPageEn {
	_StringsSendPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Очікування відповіді...';
	@override String get rejected => 'Отримувач відхилив запит.';
	@override String get busy => 'Одержувач зайнятий іншим запитом.';
}

// Path: progressPage
class _StringsProgressPageUk extends _StringsProgressPageEn {
	_StringsProgressPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Надсилання файлів';
	@override String get titleReceiving => 'Отримання файлів';
	@override String get savedToGallery => 'Збережено у галереї';
	@override late final _StringsProgressPageTotalUk total = _StringsProgressPageTotalUk._(_root);
}

// Path: webSharePage
class _StringsWebSharePageUk extends _StringsWebSharePageEn {
	_StringsWebSharePageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Поділитися через посилання';
	@override String get loading => 'Запуск сервера...';
	@override String get stopping => 'Зупинка сервера...';
	@override String get error => 'Під час запуску сервера сталася помилка.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(n,
		one: 'Відкрийте це посилання в браузері:',
		other: 'Відкрийте одне з цих посилань в браузері:',
	);
	@override String get requests => 'Запити';
	@override String get noRequests => 'Запитів поки що немає.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend використовує самопідписаний сертифікат. Вам потрібно прийняти його в браузері.';
	@override String pendingRequests({required Object n}) => 'Запити, що очікують на розгляд: ${n}';
}

// Path: aboutPage
class _StringsAboutPageUk extends _StringsAboutPageEn {
	_StringsAboutPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Про LocalSend';
	@override List<String> get description => [
		'LocalSend — це безкоштовний додаток з відкритим вихідним кодом, який дозволяє безпечно обмінюватися файлами та повідомленнями з пристроями поблизу через локальну мережу без підключення до Інтернету.',
		'Цей додаток доступний для Android, iOS, macOS, Windows і Linux. Ви можете знайти всі варіанти завантаження на офіційній домашній сторінці.',
	];
	@override String get author => 'Автор';
	@override String get contributors => 'Учасники';
	@override String get translators => 'Перекладачі';
}

// Path: donationPage
class _StringsDonationPageUk extends _StringsDonationPageEn {
	_StringsDonationPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Пожертвувати';
	@override String get info => 'LocalSend є безкоштовним, із відкритим вихідним кодом і без реклами. Якщо вам подобається додаток, ви можете підтримати його розробку пожертвою.';
	@override String donate({required Object amount}) => 'Пожертвувати ${amount}';
	@override String get thanks => 'Велике спасибі!';
	@override String get restore => 'Відновити покупку';
}

// Path: changelogPage
class _StringsChangelogPageUk extends _StringsChangelogPageEn {
	_StringsChangelogPageUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Історія змін';
}

// Path: aliasGenerator
class _StringsAliasGeneratorUk extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsUk extends _StringsDialogsEn {
	_StringsDialogsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileUk addFile = _StringsDialogsAddFileUk._(_root);
	@override late final _StringsDialogsAddressInputUk addressInput = _StringsDialogsAddressInputUk._(_root);
	@override late final _StringsDialogsCancelSessionUk cancelSession = _StringsDialogsCancelSessionUk._(_root);
	@override late final _StringsDialogsCannotOpenFileUk cannotOpenFile = _StringsDialogsCannotOpenFileUk._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeUk encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeUk._(_root);
	@override late final _StringsDialogsErrorDialogUk errorDialog = _StringsDialogsErrorDialogUk._(_root);
	@override late final _StringsDialogsFavoriteDialogUk favoriteDialog = _StringsDialogsFavoriteDialogUk._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogUk favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogUk._(_root);
	@override late final _StringsDialogsFavoriteEditDialogUk favoriteEditDialog = _StringsDialogsFavoriteEditDialogUk._(_root);
	@override late final _StringsDialogsFileInfoUk fileInfo = _StringsDialogsFileInfoUk._(_root);
	@override late final _StringsDialogsFileNameInputUk fileNameInput = _StringsDialogsFileNameInputUk._(_root);
	@override late final _StringsDialogsHistoryClearDialogUk historyClearDialog = _StringsDialogsHistoryClearDialogUk._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedUk localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedUk._(_root);
	@override late final _StringsDialogsMessageInputUk messageInput = _StringsDialogsMessageInputUk._(_root);
	@override late final _StringsDialogsNoFilesUk noFiles = _StringsDialogsNoFilesUk._(_root);
	@override late final _StringsDialogsNoPermissionUk noPermission = _StringsDialogsNoPermissionUk._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformUk notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformUk._(_root);
	@override late final _StringsDialogsQrUk qr = _StringsDialogsQrUk._(_root);
	@override late final _StringsDialogsQuickActionsUk quickActions = _StringsDialogsQuickActionsUk._(_root);
	@override late final _StringsDialogsQuickSaveNoticeUk quickSaveNotice = _StringsDialogsQuickSaveNoticeUk._(_root);
	@override late final _StringsDialogsSendModeHelpUk sendModeHelp = _StringsDialogsSendModeHelpUk._(_root);
}

// Path: tray
class _StringsTrayUk extends _StringsTrayEn {
	_StringsTrayUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Вихід із LocalSend';
}

// Path: web
class _StringsWebUk extends _StringsWebEn {
	_StringsWebUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Відхилено';
	@override String get files => 'Файлів';
	@override String get fileName => 'Ім\'я файлу';
	@override String get size => 'Розмір';
}

// Path: assetPicker
class _StringsAssetPickerUk extends _StringsAssetPickerEn {
	_StringsAssetPickerUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Підтвердити';
	@override String get cancel => 'Скасувати';
	@override String get edit => 'Редагувати';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Помилка завантаження';
	@override String get original => 'Оригінал';
	@override String get preview => 'Попередній перегляд';
	@override String get select => 'Вибрати';
	@override String get emptyList => 'Список порожній';
	@override String get unSupportedAssetType => 'Непідтримуваний тип файлу.';
	@override String get unableToAccessAll => 'Неможливо отримати доступ до всіх файлів на пристрої';
	@override String get viewingLimitedAssetsTip => 'Додаток може переглядати тільки файли та альбоми, до яких він має доступ.';
	@override String get changeAccessibleLimitedAssets => 'Дозволити доступ до додаткових файлів';
	@override String get accessAllTip => 'Додаток може отримати доступ тільки до деяких файлів на пристрої. Перейдіть до системних налаштувань та дозвольте додатку отримати доступ до всіх медіафайлів на пристрої.';
	@override String get goToSystemSettings => 'Перейти до системних налаштувань';
	@override String get accessLimitedAssets => 'Продовжити з обмеженим доступом';
	@override String get accessiblePathName => 'Доступні файли';
	@override String get sTypeAudioLabel => 'Аудіо';
	@override String get sTypeImageLabel => 'Зображення';
	@override String get sTypeVideoLabel => 'Відео';
	@override String get sTypeOtherLabel => 'Інші медіафайли';
	@override String get sActionPlayHint => 'відтворити';
	@override String get sActionPreviewHint => 'попередній перегляд';
	@override String get sActionSelectHint => 'вибрати';
	@override String get sActionSwitchPathLabel => 'змінити шлях';
	@override String get sActionUseCameraHint => 'використати камеру';
	@override String get sNameDurationLabel => 'тривалість';
	@override String get sUnitAssetCountLabel => 'кількість';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxUk extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Порт:';
	@override String get alias => 'Ім\'я пристрою:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionUk extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вибірка';
	@override String files({required Object files}) => 'Файлів: ${files}';
	@override String size({required Object size}) => 'Розмір: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerUk extends _StringsSendTabPickerEn {
	_StringsSendTabPickerUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get file => 'Файл';
	@override String get folder => 'Тека';
	@override String get media => 'Медіа';
	@override String get text => 'Текст';
	@override String get app => 'Додаток';
	@override String get clipboard => 'Вставити';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesUk extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get single => 'Один одержувач';
	@override String get multiple => 'Кілька одержувачів';
	@override String get link => 'Поділіться через посилання';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralUk extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Загальні';
	@override String get brightness => 'Тема';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsUk brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsUk._(_root);
	@override String get color => 'Колір';
	@override late final _StringsSettingsTabGeneralColorOptionsUk colorOptions = _StringsSettingsTabGeneralColorOptionsUk._(_root);
	@override String get language => 'Мова';
	@override late final _StringsSettingsTabGeneralLanguageOptionsUk languageOptions = _StringsSettingsTabGeneralLanguageOptionsUk._(_root);
	@override String get saveWindowPlacement => 'Зберегти розташування вікна після закриття';
	@override String get minimizeToTray => 'Закрити: згорнути в системний трей/смугу меню';
	@override String get launchAtStartup => 'Автозапуск';
	@override String get launchMinimized => 'Прихований автозапуск';
	@override String get animations => 'Анімації';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveUk extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отримання';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Автозавершення';
	@override String get destination => 'Зберігати в теку';
	@override String get downloads => '(Завантаження)';
	@override String get saveToGallery => 'Зберігати медіафайли до галереї';
	@override String get saveToHistory => 'Зберігати історію';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkUk extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мережа';
	@override String get needRestart => 'Для застосування змін необхідно перезапустити сервер!';
	@override String get server => 'Сервер';
	@override String get alias => 'Ім\'я пристрою';
	@override String get deviceType => 'Тип пристрою';
	@override String get deviceModel => 'Модель пристрою';
	@override String get port => 'Порт';
	@override String portWarning({required Object defaultPort}) => 'Інші пристрої можуть вас не виявити, оскільки ви використовуєте інший, власний порт. (default: ${defaultPort})';
	@override String get encryption => 'Шифрування';
	@override String get multicastGroup => 'Групова передача';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Інші пристрої можуть вас не виявити, оскільки ви використовуєте іншу, власну групову адресу. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherUk extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Інше';
	@override String get support => 'Підтримати LocalSend';
	@override String get donate => 'Пожертвувати';
	@override String get privacyPolicy => 'Політика конфіденційності';
	@override String get termsOfUse => 'Умови використання';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallUk extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Цей додаток може надсилати файли на інші пристрої, але інші пристрої не можуть надсилати файли на цей пристрій.';
	@override String solution({required Object port}) => 'Швидше за все, це проблема брандмауера. Ви можете вирішити цю проблему, дозволивши вхідні з’єднання (UDP та TCP) для порта: ${port}.';
	@override String get openFirewall => 'Відкрити брандмауер';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionUk extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Обидва пристрої не можуть виявити один одного і не можуть обмінюватися файлами.';
	@override String get solution => 'Проблема існує з обох сторін? Отже вам потрібно переконатися, що обидва пристрої знаходяться в одній мережі Wi-Fi і мають однакову конфігурацію (порт, групову адресу, шифрування). Wi-Fi може не дозволяти обмін (передачу) між учасниками. У цьому випадку вам необхідно увімкнути дану опцію на своєму маршрутизаторі.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsUk extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get open => 'Відкрити файл';
	@override String get info => 'Інформація';
	@override String get deleteFromHistory => 'Видалити з історії';
}

// Path: progressPage.total
class _StringsProgressPageTotalUk extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleUk title = _StringsProgressPageTotalTitleUk._(_root);
	@override String count({required Object curr, required Object n}) => 'Файлів: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Розмір: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Швидкість: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileUk extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додати до обраних';
	@override String get content => 'Що ви бажаєте додати?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputUk extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введіть адресу';
	@override String get hashtag => 'Хештег';
	@override String get ip => 'IP-адреса';
	@override String get recentlyUsed => 'Нещодавно використані: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionUk extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Скасувати надсилання файлів';
	@override String get content => 'Ви справді хочете скасувати надсилання файлів?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileUk extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Не вдалося відкрити файл';
	@override String content({required Object file}) => 'Не вдалося відкрити "${file}". Можливо цей файл було переміщено, перейменовано чи видалено?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeUk extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Шифрування вимкнено';
	@override String get content => 'Зв\'язок тепер відбувається через незашифрований протокол HTTP. Щоб використовувати HTTPS, знову ввімкніть шифрування.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogUk extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogUk extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вибране';
	@override String get noFavorites => 'Вибраних пристроїв ще немає.';
	@override String get addFavorite => 'Додати';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogUk extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Видалити з вибраних';
	@override String content({required Object name}) => 'Ви справді хочете видалити з вибраних "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogUk extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Додати до вибраних';
	@override String get titleEdit => 'Налаштування';
	@override String get name => 'Ім\'я пристрою';
	@override String get auto => '(автоматично)';
	@override String get ip => 'IP-адреса';
	@override String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoUk extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Інформація про файл';
	@override String get fileName => 'Ім\'я файлу:';
	@override String get path => 'Шлях:';
	@override String get size => 'Розмір:';
	@override String get sender => 'Відправник:';
	@override String get time => 'Час:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputUk extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введіть ім\'я файлу';
	@override String original({required Object original}) => 'Оригінальне ім\'я файлу: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogUk extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Очистити історію';
	@override String get content => 'Ви справді хочете видалити всю історію?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedUk extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend не може знайти інші пристрої, не маючи дозволу на сканування в локальній мережі. Надайте цей дозвіл у налаштуваннях.';
	@override String get gotoSettings => 'Налаштування';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputUk extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Введіть повідомлення';
	@override String get multiline => 'Багаторядкове';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesUk extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Файли не обрано';
	@override String get content => 'Будь ласка, додайте як мінімум один файл.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionUk extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Немає дозволу';
	@override String get content => 'Ви не надали необхідні дозволи. Будь ласка, надайте їх у налаштуваннях.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformUk extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Недоступно';
	@override String get content => 'Ця функція доступна лише на:';
}

// Path: dialogs.qr
class _StringsDialogsQrUk extends _StringsDialogsQrEn {
	_StringsDialogsQrUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsUk extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Швидкі дії';
	@override String get counter => 'Лічильник';
	@override String get prefix => 'Префікс';
	@override String get padZero => 'Додати нулі на початку';
	@override String get sortBeforeCount => 'Відсортувати за алфавітом (А-Я)';
	@override String get random => 'Випадково';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeUk extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Запити на отримання файлів відтепер приймаються автоматично. Будьте обережні, всі користувачі цієї локальної мережі можуть надсилати вам файли.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpUk extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Режими надсилання';
	@override String get single => 'Надсилає файли одному одержувачу. Після завершення передачі файлу (-ів), виділення буде знято.';
	@override String get multiple => 'Надсилає файли кільком одержувачам. Виділення не буде знято.';
	@override String get link => 'Одержувачі, у яких не встановлено LocalSend, можуть завантажити вибрані файли, відкривши посилання у своєму браузері.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsUk extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системна';
	@override String get dark => 'Темна';
	@override String get light => 'Світла';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsUk extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системний';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsUk extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системна';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleUk extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleUk._(_StringsUk root) : this._root = root, super._(root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Загальний час передачі (${time})';
	@override String get finishedError => 'Завершено з помилкою';
	@override String get canceledSender => 'Скасовано відправником';
	@override String get canceledReceiver => 'Скасовано одержувачем';
}
