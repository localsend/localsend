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
class TranslationsUk extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsUk({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsUk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Українська';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$uk general = _Translations$general$uk._(_root);
  @override
  late final _Translations$receiveTab$uk receiveTab = _Translations$receiveTab$uk._(_root);
  @override
  late final _Translations$sendTab$uk sendTab = _Translations$sendTab$uk._(_root);
  @override
  late final _Translations$settingsTab$uk settingsTab = _Translations$settingsTab$uk._(_root);
  @override
  late final _Translations$troubleshootPage$uk troubleshootPage = _Translations$troubleshootPage$uk._(_root);
  @override
  late final _Translations$receiveHistoryPage$uk receiveHistoryPage = _Translations$receiveHistoryPage$uk._(_root);
  @override
  late final _Translations$apkPickerPage$uk apkPickerPage = _Translations$apkPickerPage$uk._(_root);
  @override
  late final _Translations$selectedFilesPage$uk selectedFilesPage = _Translations$selectedFilesPage$uk._(_root);
  @override
  late final _Translations$receivePage$uk receivePage = _Translations$receivePage$uk._(_root);
  @override
  late final _Translations$receiveOptionsPage$uk receiveOptionsPage = _Translations$receiveOptionsPage$uk._(_root);
  @override
  late final _Translations$sendPage$uk sendPage = _Translations$sendPage$uk._(_root);
  @override
  late final _Translations$progressPage$uk progressPage = _Translations$progressPage$uk._(_root);
  @override
  late final _Translations$webSharePage$uk webSharePage = _Translations$webSharePage$uk._(_root);
  @override
  late final _Translations$aboutPage$uk aboutPage = _Translations$aboutPage$uk._(_root);
  @override
  late final _Translations$donationPage$uk donationPage = _Translations$donationPage$uk._(_root);
  @override
  late final _Translations$changelogPage$uk changelogPage = _Translations$changelogPage$uk._(_root);
  @override
  late final _Translations$dialogs$uk dialogs = _Translations$dialogs$uk._(_root);
  @override
  late final _Translations$sanitization$uk sanitization = _Translations$sanitization$uk._(_root);
  @override
  late final _Translations$tray$uk tray = _Translations$tray$uk._(_root);
  @override
  late final _Translations$web$uk web = _Translations$web$uk._(_root);
  @override
  late final _Translations$assetPicker$uk assetPicker = _Translations$assetPicker$uk._(_root);
  @override
  late final _Translations$networkInterfacesPage$uk networkInterfacesPage = _Translations$networkInterfacesPage$uk._(_root);
}

// Path: general
class _Translations$general$uk extends Translations$general$en {
  _Translations$general$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
  String get finished => 'Завершено';
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
class _Translations$receiveTab$uk extends Translations$receiveTab$en {
  _Translations$receiveTab$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отримати';
  @override
  late final _Translations$receiveTab$infoBox$uk infoBox = _Translations$receiveTab$infoBox$uk._(_root);
  @override
  late final _Translations$receiveTab$quickSave$uk quickSave = _Translations$receiveTab$quickSave$uk._(_root);
}

// Path: sendTab
class _Translations$sendTab$uk extends Translations$sendTab$en {
  _Translations$sendTab$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Надіслати';
  @override
  late final _Translations$sendTab$selection$uk selection = _Translations$sendTab$selection$uk._(_root);
  @override
  late final _Translations$sendTab$picker$uk picker = _Translations$sendTab$picker$uk._(_root);
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
  late final _Translations$sendTab$sendModes$uk sendModes = _Translations$sendTab$sendModes$uk._(_root);
  @override
  String get sendModeHelp => 'Довідка';
  @override
  String get help => 'Будь ласка, переконайтеся, що отримувач перебуває в тій же ж Wi-Fi мережі, що й відправник.';
  @override
  String get placeItems => 'Додайте файли, щоб поділитися.';
}

// Path: settingsTab
class _Translations$settingsTab$uk extends Translations$settingsTab$en {
  _Translations$settingsTab$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Налаштування';
  @override
  late final _Translations$settingsTab$general$uk general = _Translations$settingsTab$general$uk._(_root);
  @override
  late final _Translations$settingsTab$receive$uk receive = _Translations$settingsTab$receive$uk._(_root);
  @override
  late final _Translations$settingsTab$send$uk send = _Translations$settingsTab$send$uk._(_root);
  @override
  late final _Translations$settingsTab$network$uk network = _Translations$settingsTab$network$uk._(_root);
  @override
  late final _Translations$settingsTab$other$uk other = _Translations$settingsTab$other$uk._(_root);
  @override
  String get advancedSettings => 'Розширені налаштування';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$uk extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$uk firewall = _Translations$troubleshootPage$firewall$uk._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$uk noDiscovery = _Translations$troubleshootPage$noDiscovery$uk._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$uk noConnection = _Translations$troubleshootPage$noConnection$uk._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$uk extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$uk entryActions = _Translations$receiveHistoryPage$entryActions$uk._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$uk extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$uk extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Видалити все';
}

// Path: receivePage
class _Translations$receivePage$uk extends Translations$receivePage$en {
  _Translations$receivePage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$receiveOptionsPage$uk extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$uk extends Translations$sendPage$en {
  _Translations$sendPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$uk extends Translations$progressPage$en {
  _Translations$progressPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Надсилання файлів';
  @override
  String get titleReceiving => 'Отримання файлів';
  @override
  String get savedToGallery => 'Збережено в галереї';
  @override
  late final _Translations$progressPage$total$uk total = _Translations$progressPage$total$uk._(_root);
  @override
  late final _Translations$progressPage$remainingTime$uk remainingTime = _Translations$progressPage$remainingTime$uk._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$uk extends Translations$webSharePage$en {
  _Translations$webSharePage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$uk extends Translations$aboutPage$en {
  _Translations$aboutPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$uk extends Translations$donationPage$en {
  _Translations$donationPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$uk extends Translations$changelogPage$en {
  _Translations$changelogPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Історія змін';
}

// Path: dialogs
class _Translations$dialogs$uk extends Translations$dialogs$en {
  _Translations$dialogs$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$uk addFile = _Translations$dialogs$addFile$uk._(_root);
  @override
  late final _Translations$dialogs$openFile$uk openFile = _Translations$dialogs$openFile$uk._(_root);
  @override
  late final _Translations$dialogs$addressInput$uk addressInput = _Translations$dialogs$addressInput$uk._(_root);
  @override
  late final _Translations$dialogs$cancelSession$uk cancelSession = _Translations$dialogs$cancelSession$uk._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$uk cannotOpenFile = _Translations$dialogs$cannotOpenFile$uk._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$uk encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$uk._(_root);
  @override
  late final _Translations$dialogs$errorDialog$uk errorDialog = _Translations$dialogs$errorDialog$uk._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$uk favoriteDialog = _Translations$dialogs$favoriteDialog$uk._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$uk favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$uk._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$uk favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$uk._(_root);
  @override
  late final _Translations$dialogs$fileInfo$uk fileInfo = _Translations$dialogs$fileInfo$uk._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$uk fileNameInput = _Translations$dialogs$fileNameInput$uk._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$uk historyClearDialog = _Translations$dialogs$historyClearDialog$uk._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$uk localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$uk._(_root);
  @override
  late final _Translations$dialogs$messageInput$uk messageInput = _Translations$dialogs$messageInput$uk._(_root);
  @override
  late final _Translations$dialogs$noFiles$uk noFiles = _Translations$dialogs$noFiles$uk._(_root);
  @override
  late final _Translations$dialogs$noPermission$uk noPermission = _Translations$dialogs$noPermission$uk._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$uk notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$uk._(_root);
  @override
  late final _Translations$dialogs$qr$uk qr = _Translations$dialogs$qr$uk._(_root);
  @override
  late final _Translations$dialogs$quickActions$uk quickActions = _Translations$dialogs$quickActions$uk._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$uk quickSaveNotice = _Translations$dialogs$quickSaveNotice$uk._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$uk quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$uk._(_root);
  @override
  late final _Translations$dialogs$pin$uk pin = _Translations$dialogs$pin$uk._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$uk sendModeHelp = _Translations$dialogs$sendModeHelp$uk._(_root);
  @override
  late final _Translations$dialogs$zoom$uk zoom = _Translations$dialogs$zoom$uk._(_root);
}

// Path: sanitization
class _Translations$sanitization$uk extends Translations$sanitization$en {
  _Translations$sanitization$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Назва файлу не може бути порожнім';
  @override
  String get invalid => 'Назва файлу містить недопустимі символи';
}

// Path: tray
class _Translations$tray$uk extends Translations$tray$en {
  _Translations$tray$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$web$uk extends Translations$web$en {
  _Translations$web$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$uk extends Translations$assetPicker$en {
  _Translations$assetPicker$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$uk extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$uk extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$uk extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$uk extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$uk extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$uk extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$uk extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Загальні';
  @override
  String get brightness => 'Тема';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$uk brightnessOptions = _Translations$settingsTab$general$brightnessOptions$uk._(
    _root,
  );
  @override
  String get color => 'Колір';
  @override
  late final _Translations$settingsTab$general$colorOptions$uk colorOptions = _Translations$settingsTab$general$colorOptions$uk._(_root);
  @override
  String get language => 'Мова';
  @override
  late final _Translations$settingsTab$general$languageOptions$uk languageOptions = _Translations$settingsTab$general$languageOptions$uk._(_root);
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
class _Translations$settingsTab$receive$uk extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$uk extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Надсилання';
  @override
  String get shareViaLinkAutoAccept => 'Автоматично приймати запити в режимі «Поділитися через посилання»';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$uk extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$uk networkOptions = _Translations$settingsTab$network$networkOptions$uk._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$uk extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$uk extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Цей пристрій може надсилати файли на інші пристрої, але інші пристрої не можуть надсилати файли на цей пристрій.';
  @override
  String solution({required Object port}) =>
      'Швидше за все, це проблема брандмауера. Ви можете вирішити дану проблему, дозволивши вхідні з\'єднання (UDP та TCP) для порта: ${port}.';
  @override
  String get openFirewall => 'Відкрити брандмауер';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$uk extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Цей пристрій не може знайти інші пристрої.';
  @override
  String get solution =>
      'Будь ласка, переконайтеся, що обидва пристрої знаходяться в одній Wi-Fi мережі та мають однакову конфігурацію (порт, адресу групової передачі, шифрування). Ви можете спробувати ввести IP-адресу цільового пристрою вручну. Якщо це спрацює, подумайте про те, щоб додати цей пристрій до улюблених, щоб його можна було автоматично знаходити в майбутньому.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$uk extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Обидва пристрої не можуть знайти один одного та не можуть обмінюватися файлами.';
  @override
  String get solution =>
      'Проблема існує з обох сторін? Отже, вам потрібно переконатися, що обидва пристрої знаходяться в одній Wi-Fi мережі та мають однакову конфігурацію (порт, адресу групової передачі, шифрування). Мережа Wi-Fi може не дозволяти обмін (передачу) між учасниками. У такому разі, вам потрібно увімкнути дану опцію на своєму маршрутизаторі.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$uk extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$uk extends Translations$progressPage$total$en {
  _Translations$progressPage$total$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$uk title = _Translations$progressPage$total$title$uk._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлів: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Розмір: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Швидкість: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$uk extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Використовуйте «h» як скорочення для годин і «m» для хвилин
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Використовуйте «d» для днів, «h» для годин і «m» для хвилин
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$uk extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додати у вибірку';
  @override
  String get content => 'Що ви хочете додати?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$uk extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Відкрити файл';
  @override
  String get content => 'Хочете відкрити отриманий файл?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$uk extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$uk extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Скасувати надсилання файлів';
  @override
  String get content => 'Ви справді хочете скасувати надсилання файлів?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$uk extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не вдалося відкрити файл';
  @override
  String content({required Object file}) => 'Не вдалося відкрити «${file}». Можливо, цей файл було переміщено, перейменовано або видалено?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$uk extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрування вимкнено';
  @override
  String get content =>
      'Зв\'язок тепер відбувається через незашифрований HTTP протокол. Щоб використовувати протокол HTTPS, знову увімкніть шифрування.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$uk extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$uk extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$uk extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Видалити з улюблених';
  @override
  String content({required Object name}) => 'Ви справді хочете видалити з улюблених «${name}»?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$uk extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$uk extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$uk extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть ім\'я файлу';
  @override
  String original({required Object original}) => 'Оригінальне ім\'я файлу: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$uk extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистити історію';
  @override
  String get content => 'Ви справді хочете видалити всю історію?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$uk extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$uk extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть повідомлення';
  @override
  String get multiline => 'Багаторядкове';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$uk extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не вибрано жодного файлу';
  @override
  String get content => 'Будь ласка, додайте як мінімум один файл.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$uk extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Немає дозволу';
  @override
  String get content => 'Ви не надали необхідні дозволи. Будь ласка, надайте їх у налаштуваннях.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$uk extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Недоступно';
  @override
  String get content => 'Ця функція доступна тільки на:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$uk extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$uk extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$uk extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Запити на отримання файлів відтепер приймаються автоматично. Будьте обережні, всі користувачі цієї локальної мережі можуть надсилати вам файли.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$uk extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$uk extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Введіть PIN-код';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$uk extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$uk extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL-адреса';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$uk extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$uk extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системний';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$uk extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системна';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$uk extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

  final TranslationsUk _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Все';
  @override
  String get filtered => 'Фільтроване';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$uk extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
