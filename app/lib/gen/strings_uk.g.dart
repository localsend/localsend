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
class TranslationsUk extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.uk,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <uk>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsUk _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Українська';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralUk general = _TranslationsGeneralUk._(_root);
  @override
  late final _TranslationsReceiveTabUk receiveTab = _TranslationsReceiveTabUk._(_root);
  @override
  late final _TranslationsSendTabUk sendTab = _TranslationsSendTabUk._(_root);
  @override
  late final _TranslationsSettingsTabUk settingsTab = _TranslationsSettingsTabUk._(_root);
  @override
  late final _TranslationsTroubleshootPageUk troubleshootPage = _TranslationsTroubleshootPageUk._(_root);
  @override
  late final _TranslationsReceiveHistoryPageUk receiveHistoryPage = _TranslationsReceiveHistoryPageUk._(_root);
  @override
  late final _TranslationsApkPickerPageUk apkPickerPage = _TranslationsApkPickerPageUk._(_root);
  @override
  late final _TranslationsSelectedFilesPageUk selectedFilesPage = _TranslationsSelectedFilesPageUk._(_root);
  @override
  late final _TranslationsReceivePageUk receivePage = _TranslationsReceivePageUk._(_root);
  @override
  late final _TranslationsReceiveOptionsPageUk receiveOptionsPage = _TranslationsReceiveOptionsPageUk._(_root);
  @override
  late final _TranslationsSendPageUk sendPage = _TranslationsSendPageUk._(_root);
  @override
  late final _TranslationsProgressPageUk progressPage = _TranslationsProgressPageUk._(_root);
  @override
  late final _TranslationsWebSharePageUk webSharePage = _TranslationsWebSharePageUk._(_root);
  @override
  late final _TranslationsAboutPageUk aboutPage = _TranslationsAboutPageUk._(_root);
  @override
  late final _TranslationsDonationPageUk donationPage = _TranslationsDonationPageUk._(_root);
  @override
  late final _TranslationsChangelogPageUk changelogPage = _TranslationsChangelogPageUk._(_root);
  @override
  late final _TranslationsAliasGeneratorUk aliasGenerator = _TranslationsAliasGeneratorUk._(_root);
  @override
  late final _TranslationsDialogsUk dialogs = _TranslationsDialogsUk._(_root);
  @override
  late final _TranslationsSanitizationUk sanitization = _TranslationsSanitizationUk._(_root);
  @override
  late final _TranslationsTrayUk tray = _TranslationsTrayUk._(_root);
  @override
  late final _TranslationsWebUk web = _TranslationsWebUk._(_root);
  @override
  late final _TranslationsAssetPickerUk assetPicker = _TranslationsAssetPickerUk._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageUk networkInterfacesPage = _TranslationsNetworkInterfacesPageUk._(_root);
}

// Path: general
class _TranslationsGeneralUk extends TranslationsGeneralEn {
  _TranslationsGeneralUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Прийняти';
  @override
  String get accepted => 'Прийнято';
  @override
  String get add => 'Додати';
  @override
  String get advanced => 'Детальніше';
  @override
  String get cancel => 'Скасувати';
  @override
  String get close => 'Закрити';
  @override
  String get confirm => 'Підтвердити';
  @override
  String get continueStr => 'Продовжити';
  @override
  String get copy => 'Копіювати';
  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';
  @override
  String get decline => 'Відхилити';
  @override
  String get done => 'Виконано';
  @override
  String get delete => 'Видалити';
  @override
  String get edit => 'Редагувати';
  @override
  String get error => 'Помилка';
  @override
  String get example => 'Приклад';
  @override
  String get files => 'Файли';
  @override
  String get finished => 'Виконано';
  @override
  String get hide => 'Приховати';
  @override
  String get off => 'Вимкнено';
  @override
  String get offline => 'Не в мережі';
  @override
  String get on => 'Увімкнено';
  @override
  String get online => 'У мережі';
  @override
  String get open => 'Відкрити';
  @override
  String get queue => 'Черга';
  @override
  String get quickSave => 'Швидке збереження';
  @override
  String get quickSaveFromFavorites => 'Швидке збереження для «Улюблених»';
  @override
  String get renamed => 'Перейменовано';
  @override
  String get reset => 'Скасувати зміни';
  @override
  String get restart => 'Перезапустити';
  @override
  String get settings => 'Налаштування';
  @override
  String get skipped => 'Відхилено';
  @override
  String get start => 'Запустити';
  @override
  String get stop => 'Зупинити';
  @override
  String get save => 'Зберегти';
  @override
  String get unchanged => 'Без змін';
  @override
  String get unknown => 'Невідомо';
  @override
  String get noItemInClipboard => 'Буфер обміну порожній.';
}

// Path: receiveTab
class _TranslationsReceiveTabUk extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отримати';
  @override
  late final _TranslationsReceiveTabInfoBoxUk infoBox = _TranslationsReceiveTabInfoBoxUk._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveUk quickSave = _TranslationsReceiveTabQuickSaveUk._(_root);
}

// Path: sendTab
class _TranslationsSendTabUk extends TranslationsSendTabEn {
  _TranslationsSendTabUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Надіслати';
  @override
  late final _TranslationsSendTabSelectionUk selection = _TranslationsSendTabSelectionUk._(_root);
  @override
  late final _TranslationsSendTabPickerUk picker = _TranslationsSendTabPickerUk._(_root);
  @override
  String get shareIntentInfo => 'Ви також можете скористатися функцією «Поділитися» на своєму мобільному пристрої, щоб швидше вибирати файли.';
  @override
  String get nearbyDevices => 'Пристрої поблизу';
  @override
  String get thisDevice => 'Цей пристрій';
  @override
  String get scan => 'Пошук пристроїв';
  @override
  String get manualSending => 'Ручне надсилання';
  @override
  String get sendMode => 'Режим надсилання';
  @override
  late final _TranslationsSendTabSendModesUk sendModes = _TranslationsSendTabSendModesUk._(_root);
  @override
  String get sendModeHelp => 'Довідка';
  @override
  String get help => 'Будь ласка, переконайтеся, що отримувач перебуває в тій же ж Wi-Fi мережі, що й відправник.';
  @override
  String get placeItems => 'Додайте файли, щоб поділитися.';
}

// Path: settingsTab
class _TranslationsSettingsTabUk extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Налаштування';
  @override
  late final _TranslationsSettingsTabGeneralUk general = _TranslationsSettingsTabGeneralUk._(_root);
  @override
  late final _TranslationsSettingsTabReceiveUk receive = _TranslationsSettingsTabReceiveUk._(_root);
  @override
  late final _TranslationsSettingsTabSendUk send = _TranslationsSettingsTabSendUk._(_root);
  @override
  late final _TranslationsSettingsTabNetworkUk network = _TranslationsSettingsTabNetworkUk._(_root);
  @override
  late final _TranslationsSettingsTabOtherUk other = _TranslationsSettingsTabOtherUk._(_root);
  @override
  String get advancedSettings => 'Розширені налаштування';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageUk extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Усунення несправностей';
  @override
  String get subTitle => 'Програма не працює належним чином? Тут ви можете знайти деякі поширені рішення проблем.';
  @override
  String get solution => 'Рішення:';
  @override
  String get fixButton => 'Виправити автоматично';
  @override
  late final _TranslationsTroubleshootPageFirewallUk firewall = _TranslationsTroubleshootPageFirewallUk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryUk noDiscovery = _TranslationsTroubleshootPageNoDiscoveryUk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionUk noConnection = _TranslationsTroubleshootPageNoConnectionUk._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageUk extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Історія';
  @override
  String get openFolder => 'Відкрити папку';
  @override
  String get deleteHistory => 'Видалити історію';
  @override
  String get empty => 'Історія порожня.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsUk entryActions = _TranslationsReceiveHistoryPageEntryActionsUk._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageUk extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Програми (APK)';
  @override
  String get excludeSystemApps => 'Виключити системні програми';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Виключити програми, що не запускаються';
  @override
  String apps({required Object n}) => '${n} програм';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageUk extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Видалити все';
}

// Path: receivePage
class _TranslationsReceivePageUk extends TranslationsReceivePageEn {
  _TranslationsReceivePageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
    n,
    one: 'хоче надіслати вам файл',
    other: 'хоче надіслати вам ${n} файли (-ів)',
  );
  @override
  String get subTitleMessage => 'надіслав вам повідомлення:';
  @override
  String get subTitleLink => 'надіслав вам посилання:';
  @override
  String get canceled => 'Відправник скасував запит на передачу файлів.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageUk extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Параметри отримання';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Папка LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Вимкнено автоматично, оскільки є папки.';
}

// Path: sendPage
class _TranslationsSendPageUk extends TranslationsSendPageEn {
  _TranslationsSendPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Очікування відповіді…';
  @override
  String get rejected => 'Отримувач відхилив запит.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Отримувач зайнятий іншим запитом.';
}

// Path: progressPage
class _TranslationsProgressPageUk extends TranslationsProgressPageEn {
  _TranslationsProgressPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Надсилання файлів';
  @override
  String get titleReceiving => 'Отримання файлів';
  @override
  String get savedToGallery => 'Збережено в галереї';
  @override
  late final _TranslationsProgressPageTotalUk total = _TranslationsProgressPageTotalUk._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageUk extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Поділитися через посилання';
  @override
  String get loading => 'Запуск сервера…';
  @override
  String get stopping => 'Зупинка сервера…';
  @override
  String get error => 'Під час запуску сервера сталася помилка.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
    n,
    one: 'Відкрийте це посилання в браузері:',
    other: 'Відкрийте одне з цих посилань в браузері:',
  );
  @override
  String get requests => 'Запити';
  @override
  String get noRequests => 'Запитів поки що немає.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Автоматично приймати запити';
  @override
  String get requirePin => 'Вимагати PIN-код';
  @override
  String pinHint({required Object pin}) => 'PIN-код: «${pin}»';
  @override
  String get encryptionHint => 'LocalSend використовує самопідписаний сертифікат. Вам потрібно прийняти його в браузері.';
  @override
  String pendingRequests({required Object n}) => 'Запити, що очікують на розгляд: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageUk extends TranslationsAboutPageEn {
  _TranslationsAboutPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Про LocalSend';
  @override
  List<String> get description => [
    'LocalSend — це безплатна програма з відкритим вихідним кодом, яка дозволяє вам безпечно обмінюватися файлами та повідомленнями з пристроями поблизу через локальну мережу, без необхідності підключення до Інтернету.',
    'Ця програма доступна для Android, iOS, macOS, Windows та Linux. Ви можете знайти всі варіанти завантаження на офіційній домашній сторінці.',
  ];
  @override
  String get author => 'Автор';
  @override
  String get contributors => 'Учасники';
  @override
  String get packagers => 'Пакувальники';
  @override
  String get translators => 'Перекладачі';
}

// Path: donationPage
class _TranslationsDonationPageUk extends TranslationsDonationPageEn {
  _TranslationsDonationPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Пожертвувати';
  @override
  String get info =>
      'LocalSend — це безплатна програма з відкритим вихідним кодом та без реклами. Якщо вона вам подобається, ви можете підтримати її розробку пожертвою.';
  @override
  String donate({required Object amount}) => 'Пожертвувати ${amount}';
  @override
  String get thanks => 'Велике спасибі!';
  @override
  String get restore => 'Відновити покупку';
}

// Path: changelogPage
class _TranslationsChangelogPageUk extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Історія змін';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorUk extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsUk extends TranslationsDialogsEn {
  _TranslationsDialogsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileUk addFile = _TranslationsDialogsAddFileUk._(_root);
  @override
  late final _TranslationsDialogsOpenFileUk openFile = _TranslationsDialogsOpenFileUk._(_root);
  @override
  late final _TranslationsDialogsAddressInputUk addressInput = _TranslationsDialogsAddressInputUk._(_root);
  @override
  late final _TranslationsDialogsCancelSessionUk cancelSession = _TranslationsDialogsCancelSessionUk._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileUk cannotOpenFile = _TranslationsDialogsCannotOpenFileUk._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeUk encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeUk._(_root);
  @override
  late final _TranslationsDialogsErrorDialogUk errorDialog = _TranslationsDialogsErrorDialogUk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogUk favoriteDialog = _TranslationsDialogsFavoriteDialogUk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogUk favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogUk._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogUk favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogUk._(_root);
  @override
  late final _TranslationsDialogsFileInfoUk fileInfo = _TranslationsDialogsFileInfoUk._(_root);
  @override
  late final _TranslationsDialogsFileNameInputUk fileNameInput = _TranslationsDialogsFileNameInputUk._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogUk historyClearDialog = _TranslationsDialogsHistoryClearDialogUk._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedUk localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedUk._(_root);
  @override
  late final _TranslationsDialogsMessageInputUk messageInput = _TranslationsDialogsMessageInputUk._(_root);
  @override
  late final _TranslationsDialogsNoFilesUk noFiles = _TranslationsDialogsNoFilesUk._(_root);
  @override
  late final _TranslationsDialogsNoPermissionUk noPermission = _TranslationsDialogsNoPermissionUk._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformUk notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformUk._(_root);
  @override
  late final _TranslationsDialogsQrUk qr = _TranslationsDialogsQrUk._(_root);
  @override
  late final _TranslationsDialogsQuickActionsUk quickActions = _TranslationsDialogsQuickActionsUk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeUk quickSaveNotice = _TranslationsDialogsQuickSaveNoticeUk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeUk quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeUk._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinUk pin = _TranslationsDialogsPinUk._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpUk sendModeHelp = _TranslationsDialogsSendModeHelpUk._(_root);
  @override
  late final _TranslationsDialogsZoomUk zoom = _TranslationsDialogsZoomUk._(_root);
}

// Path: sanitization
class _TranslationsSanitizationUk extends TranslationsSanitizationEn {
  _TranslationsSanitizationUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Назва файлу не може бути порожнім';
  @override
  String get invalid => 'Назва файлу містить недопустимі символи';
}

// Path: tray
class _TranslationsTrayUk extends TranslationsTrayEn {
  _TranslationsTrayUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Вийти з LocalSend';
  @override
  String get closeWindows => 'Вийти';
}

// Path: web
class _TranslationsWebUk extends TranslationsWebEn {
  _TranslationsWebUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Введіть PIN-код';
  @override
  String get invalidPin => 'Неправильний PIN-код';
  @override
  String get tooManyAttempts => 'Забагато спроб';
  @override
  String get rejected => 'Відхилено';
  @override
  String get files => 'Файлів';
  @override
  String get fileName => 'Назва файлу';
  @override
  String get size => 'Розмір';
}

// Path: assetPicker
class _TranslationsAssetPickerUk extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Підтвердити';
  @override
  String get cancel => 'Скасувати';
  @override
  String get edit => 'Редагувати';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Не вдалося завантажити';
  @override
  String get original => 'Оригінал';
  @override
  String get preview => 'Передперегляд';
  @override
  String get select => 'Вибрати';
  @override
  String get emptyList => 'Список порожній';
  @override
  String get unSupportedAssetType => 'Непідтримуваний тип файлу.';
  @override
  String get unableToAccessAll => 'Не вдалося отримати доступ до всіх файлів на пристрої';
  @override
  String get viewingLimitedAssetsTip => 'Програма може переглядати тільки файли та альбоми, до яких вона має доступ.';
  @override
  String get changeAccessibleLimitedAssets => 'Дозволити доступ до додаткових файлів';
  @override
  String get accessAllTip =>
      'Програма має доступ тільки до деяких файлів на пристрої. Перейдіть до системних налаштувань та дозвольте програмі отримати доступ до всіх медіафайлів на пристрої.';
  @override
  String get goToSystemSettings => 'Перейти до системних налаштувань';
  @override
  String get accessLimitedAssets => 'Продовжити з обмеженим доступом';
  @override
  String get accessiblePathName => 'Доступні файли';
  @override
  String get sTypeAudioLabel => 'Аудіо';
  @override
  String get sTypeImageLabel => 'Зображення';
  @override
  String get sTypeVideoLabel => 'Відео';
  @override
  String get sTypeOtherLabel => 'Інші медіафайли';
  @override
  String get sActionPlayHint => 'відтворити';
  @override
  String get sActionPreviewHint => 'передперегляд';
  @override
  String get sActionSelectHint => 'вибрати';
  @override
  String get sActionSwitchPathLabel => 'змінити шлях';
  @override
  String get sActionUseCameraHint => 'використати камеру';
  @override
  String get sNameDurationLabel => 'тривалість';
  @override
  String get sUnitAssetCountLabel => 'кількість';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageUk extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мережевий інтерфейс';
  @override
  String get preview => 'Передперегляд';
  @override
  String get whitelist => 'Білий список';
  @override
  String get blacklist => 'Чорний список';
  @override
  String get info =>
      'Типово LocalSend використовує всі доступні мережеві інтерфейси. Ви можете виключити небажані мережі тут. Щоб застосувати зміни, потрібно перезапустити сервер.';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxUk extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Ім\'я пристрою:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveUk extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Улюблені';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionUk extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Вибірка';
  @override
  String files({required Object files}) => 'Файлів: ${files}';
  @override
  String size({required Object size}) => 'Розмір: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerUk extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медіа';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Програма';
  @override
  String get clipboard => 'Вставити';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesUk extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Один отримувач';
  @override
  String get multiple => 'Декілька отримувачів';
  @override
  String get link => 'Поділитися через посилання';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralUk extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Загальні';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsUk brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsUk._(_root);
  @override
  String get color => 'Колір';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsUk colorOptions = _TranslationsSettingsTabGeneralColorOptionsUk._(_root);
  @override
  String get language => 'Мова';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsUk languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsUk._(_root);
  @override
  String get saveWindowPlacement => 'Зберігати розташування вікна після виходу';
  @override
  String get saveWindowPlacementWindows => 'Зберігати розташування вікна після виходу';
  @override
  String get minimizeToTray => 'Згортати в системний трей/смугу меню при закритті';
  @override
  String get launchAtStartup => 'Автозапуск';
  @override
  String get launchMinimized => 'Прихований автозапуск';
  @override
  String get showInContextMenu => 'Відображати LocalSend в контекстному меню';
  @override
  String get animations => 'Анімації';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveUk extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отримання';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Автозавершення';
  @override
  String get destination => 'Зберігати в папку';
  @override
  String get downloads => '(Завантаження)';
  @override
  String get saveToGallery => 'Зберігати медіафайли в галерею';
  @override
  String get saveToHistory => 'Зберігати історію';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendUk extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Надсилання';
  @override
  String get shareViaLinkAutoAccept => 'Автоматично приймати запити в режимі «Поділитися через посилання»';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkUk extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мережа';
  @override
  String get needRestart => 'Для застосування змін необхідно перезапустити сервер!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Назва пристрою';
  @override
  String get deviceType => 'Тип пристрою';
  @override
  String get deviceModel => 'Модель пристрою';
  @override
  String get port => 'Порт';
  @override
  String get discoveryTimeout => 'Час пошуку вийшов';
  @override
  String get useSystemName => 'Використати системну назву';
  @override
  String get generateRandomAlias => 'Згенерувати випадковий псевдонім';
  @override
  String portWarning({required Object defaultPort}) =>
      'Інші пристрої можуть вас не знайти, оскільки ви використовуєте інший, власний порт. (default: ${defaultPort})';
  @override
  String get encryption => 'Шифрування';
  @override
  String get multicastGroup => 'Адреса групової передачі';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Інші пристрої можуть вас не знайти, оскільки ви використовуєте іншу, власну адресу групової передачі. (default: ${defaultMulticast})';
  @override
  String get network => 'Мережа';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsUk networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsUk._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherUk extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Інше';
  @override
  String get support => 'Підтримати LocalSend';
  @override
  String get donate => 'Пожертвувати';
  @override
  String get privacyPolicy => 'Політика конфіденційності';
  @override
  String get termsOfUse => 'Умови використання';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallUk extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Цей пристрій може надсилати файли на інші пристрої, але інші пристрої не можуть надсилати файли на цей пристрій.';
  @override
  String solution({required Object port}) =>
      'Швидше за все, це проблема брандмауера. Ви можете вирішити дану проблему, дозволивши вхідні з\'єднання (UDP та TCP) для порта: ${port}.';
  @override
  String get openFirewallSettings => 'Відкрити брандмауер';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryUk extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Цей пристрій не може знайти інші пристрої.';
  @override
  String get solution =>
      'Будь ласка, переконайтеся, що обидва пристрої знаходяться в одній Wi-Fi мережі та мають однакову конфігурацію (порт, адресу групової передачі, шифрування). Ви можете спробувати ввести IP-адресу цільового пристрою вручну. Якщо це спрацює, подумайте про те, щоб додати цей пристрій до улюблених, щоб його можна було автоматично знаходити в майбутньому.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionUk extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Обидва пристрої не можуть знайти один одного та не можуть обмінюватися файлами.';
  @override
  String get solution =>
      'Проблема існує з обох сторін? Отже, вам потрібно переконатися, що обидва пристрої знаходяться в одній Wi-Fi мережі та мають однакову конфігурацію (порт, адресу групової передачі, шифрування). Мережа Wi-Fi може не дозволяти обмін (передачу) між учасниками. У такому разі, вам потрібно увімкнути дану опцію на своєму маршрутизаторі.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsUk extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Відкрити файл';
  @override
  String get showInFolder => 'Показати в папці';
  @override
  String get info => 'Інформація';
  @override
  String get deleteFromHistory => 'Видалити з історії';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalUk extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleUk title = _TranslationsProgressPageTotalTitleUk._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлів: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Розмір: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Швидкість: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileUk extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додати у вибірку';
  @override
  String get content => 'Що ви хочете додати?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileUk extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Відкрити файл';
  @override
  String get content => 'Хочете відкрити отриманий файл?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputUk extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть адресу';
  @override
  String get hashtag => 'Хештег';
  @override
  String get ip => 'IP-адреса';
  @override
  String get recentlyUsed => 'Нещодавно використані: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionUk extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Скасувати надсилання файлів';
  @override
  String get content => 'Ви справді хочете скасувати надсилання файлів?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileUk extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не вдалося відкрити файл';
  @override
  String content({required Object file}) => 'Не вдалося відкрити «${file}». Можливо, цей файл було переміщено, перейменовано або видалено?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeUk extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрування вимкнено';
  @override
  String get content =>
      'Зв\'язок тепер відбувається через незашифрований HTTP протокол. Щоб використовувати протокол HTTPS, знову увімкніть шифрування.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogUk extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogUk extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Улюблені';
  @override
  String get noFavorites => 'Улюблених пристроїв поки що немає.';
  @override
  String get addFavorite => 'Додати';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogUk extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Видалити з улюблених';
  @override
  String content({required Object name}) => 'Ви справді хочете видалити з улюблених «${name}»?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogUk extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Додати до улюблених';
  @override
  String get titleEdit => 'Налаштування';
  @override
  String get name => 'Ім\'я пристрою';
  @override
  String get auto => '(автоматично)';
  @override
  String get ip => 'IP-адреса';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoUk extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Інформація про файл';
  @override
  String get fileName => 'Назва файлу:';
  @override
  String get path => 'Шлях:';
  @override
  String get size => 'Розмір:';
  @override
  String get sender => 'Відправник:';
  @override
  String get time => 'Час:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputUk extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть ім\'я файлу';
  @override
  String original({required Object original}) => 'Оригінальне ім\'я файлу: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogUk extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистити історію';
  @override
  String get content => 'Ви справді хочете видалити всю історію?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedUk extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend не може знайти інші пристрої без дозволу на сканування локальної мережі. Будь ласка, надайте цей дозвіл у налаштуваннях.';
  @override
  String get gotoSettings => 'Налаштування';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputUk extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть повідомлення';
  @override
  String get multiline => 'Багаторядкове';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesUk extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не вибрано жодного файлу';
  @override
  String get content => 'Будь ласка, додайте як мінімум один файл.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionUk extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Немає дозволу';
  @override
  String get content => 'Ви не надали необхідні дозволи. Будь ласка, надайте їх у налаштуваннях.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformUk extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Недоступно';
  @override
  String get content => 'Ця функція доступна тільки на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrUk extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsUk extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Швидкі дії';
  @override
  String get counter => 'Лічильник';
  @override
  String get prefix => 'Префікс';
  @override
  String get padZero => 'Додати нулі на початку';
  @override
  String get sortBeforeCount => 'Відсортувати за алфавітом (А-Я)';
  @override
  String get random => 'Випадково';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeUk extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Запити на отримання файлів відтепер приймаються автоматично. Будьте обережні, всі користувачі цієї локальної мережі можуть надсилати вам файли.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeUk extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Запити на отримання файлів відтепер приймаються автоматично від пристроїв із вашого списку улюблених.',
    'Попередження! Наразі, це не зовсім безпечно, оскільки хакер, який має відбиток пальця будь-якого пристрою з вашого списку улюблених, може безперешкодно надсилати вам файли.',
    'Проте, цей варіант все одно безпечніший, ніж дозволити всім користувачам локальної мережі безперешкодно надсилати вам файли.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinUk extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть PIN-код';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpUk extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Режими надсилання';
  @override
  String get single => 'Надсилає файли одному отримувачу. Вибірку буде очищено після завершення передачі файлів.';
  @override
  String get multiple => 'Надсилає файли декільком отримувачам. Вибірку не буде очищено після завершення передачі файлів.';
  @override
  String get link => 'Отримувачі, у яких не встановлено LocalSend, можуть завантажити вибрані файли, відкривши посилання у своєму браузері.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomUk extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL-адреса';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsUk extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системна';
  @override
  String get dark => 'Темна';
  @override
  String get light => 'Світла';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsUk extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системний';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsUk extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системна';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsUk extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Все';
  @override
  String get filtered => 'Фільтроване';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleUk extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleUk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Загальний час передачі (${time})';
  @override
  String get finishedError => 'Завершено з помилкою';
  @override
  String get canceledSender => 'Скасовано відправником';
  @override
  String get canceledReceiver => 'Скасовано отримувачем';
}
