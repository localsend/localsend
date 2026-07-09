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
class TranslationsBg extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsBg({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.bg,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <bg>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsBg _root = this; // ignore: unused_field

  @override
  TranslationsBg $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBg(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Български';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$bg general = _Translations$general$bg._(_root);
  @override
  late final _Translations$receiveTab$bg receiveTab = _Translations$receiveTab$bg._(_root);
  @override
  late final _Translations$sendTab$bg sendTab = _Translations$sendTab$bg._(_root);
  @override
  late final _Translations$settingsTab$bg settingsTab = _Translations$settingsTab$bg._(_root);
  @override
  late final _Translations$troubleshootPage$bg troubleshootPage = _Translations$troubleshootPage$bg._(_root);
  @override
  late final _Translations$receiveHistoryPage$bg receiveHistoryPage = _Translations$receiveHistoryPage$bg._(_root);
  @override
  late final _Translations$apkPickerPage$bg apkPickerPage = _Translations$apkPickerPage$bg._(_root);
  @override
  late final _Translations$selectedFilesPage$bg selectedFilesPage = _Translations$selectedFilesPage$bg._(_root);
  @override
  late final _Translations$receivePage$bg receivePage = _Translations$receivePage$bg._(_root);
  @override
  late final _Translations$receiveOptionsPage$bg receiveOptionsPage = _Translations$receiveOptionsPage$bg._(_root);
  @override
  late final _Translations$sendPage$bg sendPage = _Translations$sendPage$bg._(_root);
  @override
  late final _Translations$progressPage$bg progressPage = _Translations$progressPage$bg._(_root);
  @override
  late final _Translations$webSharePage$bg webSharePage = _Translations$webSharePage$bg._(_root);
  @override
  late final _Translations$aboutPage$bg aboutPage = _Translations$aboutPage$bg._(_root);
  @override
  late final _Translations$donationPage$bg donationPage = _Translations$donationPage$bg._(_root);
  @override
  late final _Translations$changelogPage$bg changelogPage = _Translations$changelogPage$bg._(_root);
  @override
  late final _Translations$dialogs$bg dialogs = _Translations$dialogs$bg._(_root);
  @override
  late final _Translations$sanitization$bg sanitization = _Translations$sanitization$bg._(_root);
  @override
  late final _Translations$tray$bg tray = _Translations$tray$bg._(_root);
  @override
  late final _Translations$web$bg web = _Translations$web$bg._(_root);
  @override
  late final _Translations$assetPicker$bg assetPicker = _Translations$assetPicker$bg._(_root);
  @override
  late final _Translations$networkInterfacesPage$bg networkInterfacesPage = _Translations$networkInterfacesPage$bg._(_root);
}

// Path: general
class _Translations$general$bg extends Translations$general$en {
  _Translations$general$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Приеми';
  @override
  String get accepted => 'Прието';
  @override
  String get add => 'Добави';
  @override
  String get advanced => 'Разширено';
  @override
  String get cancel => 'Отказ';
  @override
  String get close => 'Затвори';
  @override
  String get confirm => 'Потвърди';
  @override
  String get continueStr => 'Продължи';
  @override
  String get copy => 'Копирай';
  @override
  String get copiedToClipboard => 'Копирано в клипборда';
  @override
  String get decline => 'Откажи';
  @override
  String get done => 'Готово';
  @override
  String get delete => 'Изтриване';
  @override
  String get edit => 'Редактирай';
  @override
  String get error => 'Грешка';
  @override
  String get example => 'Пример';
  @override
  String get files => 'Файлове';
  @override
  String get finished => 'Завършено';
  @override
  String get hide => 'Скрий';
  @override
  String get off => 'Изключено';
  @override
  String get offline => 'Офлайн';
  @override
  String get on => 'Включено';
  @override
  String get online => 'Онлайн';
  @override
  String get open => 'Отвори';
  @override
  String get queue => 'Опашка';
  @override
  String get quickSave => 'Бързо запазване';
  @override
  String get quickSaveFromFavorites => 'Бързо запазване за „Любими“';
  @override
  String get renamed => 'Преименуван';
  @override
  String get reset => 'Отмяна на промените';
  @override
  String get restart => 'Рестартирай';
  @override
  String get settings => 'Настройки';
  @override
  String get skipped => 'Пропуснато';
  @override
  String get start => 'Започни';
  @override
  String get stop => 'Спри';
  @override
  String get save => 'Запази';
  @override
  String get unchanged => 'Непроменено';
  @override
  String get unknown => 'Неизвестно';
  @override
  String get noItemInClipboard => 'Няма елементи в клипборда.';
}

// Path: receiveTab
class _Translations$receiveTab$bg extends Translations$receiveTab$en {
  _Translations$receiveTab$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получаване';
  @override
  late final _Translations$receiveTab$infoBox$bg infoBox = _Translations$receiveTab$infoBox$bg._(_root);
  @override
  late final _Translations$receiveTab$quickSave$bg quickSave = _Translations$receiveTab$quickSave$bg._(_root);
}

// Path: sendTab
class _Translations$sendTab$bg extends Translations$sendTab$en {
  _Translations$sendTab$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изпращане';
  @override
  late final _Translations$sendTab$selection$bg selection = _Translations$sendTab$selection$bg._(_root);
  @override
  late final _Translations$sendTab$picker$bg picker = _Translations$sendTab$picker$bg._(_root);
  @override
  String get shareIntentInfo => 'Можете също да използвате функцията „Споделяне“ на вашето мобилно устройство, за да избирате файлове по-лесно.';
  @override
  String get nearbyDevices => 'Устройства в близост';
  @override
  String get thisDevice => 'Това устройство';
  @override
  String get scan => 'Търсене на устройства';
  @override
  String get manualSending => 'Ръчно изпращане';
  @override
  String get sendMode => 'Режим на изпращане';
  @override
  late final _Translations$sendTab$sendModes$bg sendModes = _Translations$sendTab$sendModes$bg._(_root);
  @override
  String get sendModeHelp => 'Обяснение';
  @override
  String get help => 'Моля, уверете се, че желаната цел също е в същата Wi-Fi мрежа.';
  @override
  String get placeItems => 'Поставете елементи за споделяне.';
}

// Path: settingsTab
class _Translations$settingsTab$bg extends Translations$settingsTab$en {
  _Translations$settingsTab$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Настройки';
  @override
  late final _Translations$settingsTab$general$bg general = _Translations$settingsTab$general$bg._(_root);
  @override
  late final _Translations$settingsTab$receive$bg receive = _Translations$settingsTab$receive$bg._(_root);
  @override
  late final _Translations$settingsTab$send$bg send = _Translations$settingsTab$send$bg._(_root);
  @override
  late final _Translations$settingsTab$network$bg network = _Translations$settingsTab$network$bg._(_root);
  @override
  late final _Translations$settingsTab$other$bg other = _Translations$settingsTab$other$bg._(_root);
  @override
  String get advancedSettings => 'Разширени настройки';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$bg extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отстраняване на неизправност';
  @override
  String get subTitle => 'Приложението не работи ли според очакванията? Тук можете да намерите някои общи решения на проблеми.';
  @override
  String get solution => 'Решение:';
  @override
  String get fixButton => 'Автоматично поправяне';
  @override
  late final _Translations$troubleshootPage$firewall$bg firewall = _Translations$troubleshootPage$firewall$bg._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$bg noDiscovery = _Translations$troubleshootPage$noDiscovery$bg._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$bg noConnection = _Translations$troubleshootPage$noConnection$bg._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$bg extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'История';
  @override
  String get openFolder => 'Отвори папка';
  @override
  String get deleteHistory => 'Изтриване на историята';
  @override
  String get empty => 'Историята е празна.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$bg entryActions = _Translations$receiveHistoryPage$entryActions$bg._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$bg extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Приложения (APK)';
  @override
  String get excludeSystemApps => 'Изключване на системни приложения';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Изключване на приложения, които не могат да се стартират';
  @override
  String apps({required Object n}) => '${n} Приложения';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$bg extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Изтриване на всички';
}

// Path: receivePage
class _Translations$receivePage$bg extends Translations$receivePage$en {
  _Translations$receivePage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bg'))(
    n,
    one: 'иска да ви изпрати файл',
    other: 'иска да ви изпрати ${n} файлове',
  );
  @override
  String get subTitleMessage => 'Ви изпрати съобщение:';
  @override
  String get subTitleLink => 'Ви изпрати връзка:';
  @override
  String get canceled => 'Подателят е отменил заявката.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$bg extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опции';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(папка на LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Изключва се автоматично, защото има папки.';
}

// Path: sendPage
class _Translations$sendPage$bg extends Translations$sendPage$en {
  _Translations$sendPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'В очакване на отговор…';
  @override
  String get rejected => 'Получателят е отхвърлил заявката.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Получателят е зает с друга заявка.';
}

// Path: progressPage
class _Translations$progressPage$bg extends Translations$progressPage$en {
  _Translations$progressPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Изпращане на файлове';
  @override
  String get titleReceiving => 'Получаване на файлове';
  @override
  String get savedToGallery => 'Запазено в Снимки';
  @override
  late final _Translations$progressPage$total$bg total = _Translations$progressPage$total$bg._(_root);
  @override
  late final _Translations$progressPage$remainingTime$bg remainingTime = _Translations$progressPage$remainingTime$bg._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$bg extends Translations$webSharePage$en {
  _Translations$webSharePage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Споделете чрез връзка';
  @override
  String get loading => 'Стартиране на сървъра…';
  @override
  String get stopping => 'Спиране на сървъра…';
  @override
  String get error => 'Възникна грешка при стартиране на сървъра.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bg'))(
    n,
    one: 'Отворете тази връзка във вашия браузър:',
    other: 'Отворете една от тези връзки във вашия браузър:',
  );
  @override
  String get requests => 'Заявки';
  @override
  String get noRequests => 'Все още няма заявки.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Автоматично приемане на заявки';
  @override
  String get requirePin => 'Изискване на ПИН код';
  @override
  String pinHint({required Object pin}) => 'ПИН кодът е „${pin}“';
  @override
  String get encryptionHint => 'LocalSend използва самоподписан сертификат. Трябва да го приемете във вашия браузър.';
  @override
  String pendingRequests({required Object n}) => 'Чакащи заявки: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$bg extends Translations$aboutPage$en {
  _Translations$aboutPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Относно LocalSend';
  @override
  List<String> get description => [
    'LocalSend е безплатно приложение с отворен код, което ви позволява сигурно да споделяте файлове и съобщения с устройства наблизо през вашата локална мрежа, без да се нуждаете от интернет връзка.',
    'Това приложение е достъпно за Android, iOS, macOS, Windows и Linux. Можете да намерите всички опции за изтегляне на официалната домашна страница.',
  ];
  @override
  String get author => 'Автор';
  @override
  String get contributors => 'Сътрудници';
  @override
  String get packagers => 'Опаковчици';
  @override
  String get translators => 'Преводачи';
}

// Path: donationPage
class _Translations$donationPage$bg extends Translations$donationPage$en {
  _Translations$donationPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дарение';
  @override
  String get info =>
      'LocalSend е безплатен, с отворен код и без никакви реклами. Ако харесвате приложението, можете да подкрепите разработката с дарение.';
  @override
  String donate({required Object amount}) => 'Дарение ${amount}';
  @override
  String get thanks => 'Благодаря много!';
  @override
  String get restore => 'Възстановяване на покупка';
}

// Path: changelogPage
class _Translations$changelogPage$bg extends Translations$changelogPage$en {
  _Translations$changelogPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дневник на промените';
}

// Path: dialogs
class _Translations$dialogs$bg extends Translations$dialogs$en {
  _Translations$dialogs$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$bg addFile = _Translations$dialogs$addFile$bg._(_root);
  @override
  late final _Translations$dialogs$openFile$bg openFile = _Translations$dialogs$openFile$bg._(_root);
  @override
  late final _Translations$dialogs$addressInput$bg addressInput = _Translations$dialogs$addressInput$bg._(_root);
  @override
  late final _Translations$dialogs$cancelSession$bg cancelSession = _Translations$dialogs$cancelSession$bg._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$bg cannotOpenFile = _Translations$dialogs$cannotOpenFile$bg._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$bg encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$bg._(_root);
  @override
  late final _Translations$dialogs$errorDialog$bg errorDialog = _Translations$dialogs$errorDialog$bg._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$bg favoriteDialog = _Translations$dialogs$favoriteDialog$bg._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$bg favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$bg._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$bg favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$bg._(_root);
  @override
  late final _Translations$dialogs$fileInfo$bg fileInfo = _Translations$dialogs$fileInfo$bg._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$bg fileNameInput = _Translations$dialogs$fileNameInput$bg._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$bg historyClearDialog = _Translations$dialogs$historyClearDialog$bg._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$bg localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$bg._(_root);
  @override
  late final _Translations$dialogs$messageInput$bg messageInput = _Translations$dialogs$messageInput$bg._(_root);
  @override
  late final _Translations$dialogs$noFiles$bg noFiles = _Translations$dialogs$noFiles$bg._(_root);
  @override
  late final _Translations$dialogs$noPermission$bg noPermission = _Translations$dialogs$noPermission$bg._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$bg notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$bg._(_root);
  @override
  late final _Translations$dialogs$qr$bg qr = _Translations$dialogs$qr$bg._(_root);
  @override
  late final _Translations$dialogs$quickActions$bg quickActions = _Translations$dialogs$quickActions$bg._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$bg quickSaveNotice = _Translations$dialogs$quickSaveNotice$bg._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$bg quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$bg._(_root);
  @override
  late final _Translations$dialogs$pin$bg pin = _Translations$dialogs$pin$bg._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$bg sendModeHelp = _Translations$dialogs$sendModeHelp$bg._(_root);
  @override
  late final _Translations$dialogs$zoom$bg zoom = _Translations$dialogs$zoom$bg._(_root);
}

// Path: sanitization
class _Translations$sanitization$bg extends Translations$sanitization$en {
  _Translations$sanitization$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Името на файла не може да бъде празно';
  @override
  String get invalid => 'Името на файла съдържа невалидни знаци';
}

// Path: tray
class _Translations$tray$bg extends Translations$tray$en {
  _Translations$tray$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Излезте от LocalSend';
  @override
  String get closeWindows => 'Изход';
}

// Path: web
class _Translations$web$bg extends Translations$web$en {
  _Translations$web$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Въведете ПИН код';
  @override
  String get invalidPin => 'Невалиден ПИН код';
  @override
  String get tooManyAttempts => 'Твърде много опити';
  @override
  String get rejected => 'Отхвърлено';
  @override
  String get files => 'Файлове';
  @override
  String get fileName => 'Име на файл';
  @override
  String get size => 'Размер';
}

// Path: assetPicker
class _Translations$assetPicker$bg extends Translations$assetPicker$en {
  _Translations$assetPicker$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Потвърди';
  @override
  String get cancel => 'Отказ';
  @override
  String get edit => 'Редактирай';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Неуспешно зареждане';
  @override
  String get original => 'Произход';
  @override
  String get preview => 'Преглед';
  @override
  String get select => 'Избери';
  @override
  String get emptyList => 'Празен списък';
  @override
  String get unSupportedAssetType => 'Неподдържан тип файл.';
  @override
  String get unableToAccessAll => 'Няма достъп до всички файлове на устройството';
  @override
  String get viewingLimitedAssetsTip => 'Преглеждайте само файлове и албуми, достъпни за приложението.';
  @override
  String get changeAccessibleLimitedAssets => 'Щракнете, за да актуализирате достъпните файлове';
  @override
  String get accessAllTip =>
      'Приложението има достъп само до някои файлове на устройството. Отидете в системните настройки и разрешете на приложението достъп до всички медии на устройството.';
  @override
  String get goToSystemSettings => 'Отидете в системните настройки';
  @override
  String get accessLimitedAssets => 'Продължете с ограничен достъп';
  @override
  String get accessiblePathName => 'Достъпни файлове';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Изображение';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Друга медия';
  @override
  String get sActionPlayHint => 'изпълни';
  @override
  String get sActionPreviewHint => 'преглед';
  @override
  String get sActionSelectHint => 'избери';
  @override
  String get sActionSwitchPathLabel => 'промяна на пътя';
  @override
  String get sActionUseCameraHint => 'използвай камера';
  @override
  String get sNameDurationLabel => 'продължителност';
  @override
  String get sUnitAssetCountLabel => 'брой';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$bg extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'Преглед';
  @override
  String get whitelist => 'Бял списък';
  @override
  String get blacklist => 'Черен списък';
  @override
  String get title => 'Мрежови интерфейси';
  @override
  String get info =>
      'По подразбиране, LocalSend използва всички налични мрежови интерфейси. Тук можете да изключите нежелани мрежи. Трябва да рестартирате сървъра, за да приложите промените.';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$bg extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Име на устройството:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$bg extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Любими';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$bg extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избор';
  @override
  String files({required Object files}) => 'Файлове: ${files}';
  @override
  String size({required Object size}) => 'Размер: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$bg extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медия';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Приложение';
  @override
  String get clipboard => 'Постави';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$bg extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Единичен получател';
  @override
  String get multiple => 'Множество получатели';
  @override
  String get link => 'Споделете чрез връзка';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$bg extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Общи';
  @override
  String get brightness => 'Тема';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$bg brightnessOptions = _Translations$settingsTab$general$brightnessOptions$bg._(
    _root,
  );
  @override
  String get color => 'Цвят';
  @override
  late final _Translations$settingsTab$general$colorOptions$bg colorOptions = _Translations$settingsTab$general$colorOptions$bg._(_root);
  @override
  String get language => 'Език';
  @override
  late final _Translations$settingsTab$general$languageOptions$bg languageOptions = _Translations$settingsTab$general$languageOptions$bg._(_root);
  @override
  String get saveWindowPlacement => 'Запази позицията на прозореца след напускане';
  @override
  String get saveWindowPlacementWindows => 'Запази позицията на прозореца след излизане';
  @override
  String get minimizeToTray => 'Минимизирай в Системна област/Лента с менюта при затваряне';
  @override
  String get launchAtStartup => 'Автоматично стартиране след влизане';
  @override
  String get launchMinimized => 'Автоматично стартиране: Стартирай скрито';
  @override
  String get showInContextMenu => 'Покажи LocalSend в контекстното меню';
  @override
  String get animations => 'Анимации';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$bg extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получаване';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Автоматично завършване';
  @override
  String get destination => 'Запази в папка';
  @override
  String get downloads => '(Изтегляния)';
  @override
  String get saveToGallery => 'Запази медия в галерия';
  @override
  String get saveToHistory => 'Запази в история';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$bg extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изпращане';
  @override
  String get shareViaLinkAutoAccept => 'Автоматично приемане на заявки в режим "Споделяне чрез връзка"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$bg extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежа';
  @override
  String get needRestart => 'Рестартирай сървъра, за да приложите настройките!';
  @override
  String get server => 'Сървър';
  @override
  String get alias => 'Име на устройството';
  @override
  String get deviceType => 'Тип на устройството';
  @override
  String get deviceModel => 'Модел на устройството';
  @override
  String get port => 'Порт';
  @override
  String get discoveryTimeout => 'Изчакване за откриване';
  @override
  String get useSystemName => 'Използвай системно име';
  @override
  String get generateRandomAlias => 'Създаване на случаен псевдоним';
  @override
  String portWarning({required Object defaultPort}) =>
      'Възможно е да не бъдете открити от други устройства, защото използвате персонализиран порт. (default: ${defaultPort})';
  @override
  String get encryption => 'Шифроване';
  @override
  String get multicastGroup => 'Адрес за множествено предаване';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Възможно е да не бъдете открити от други устройства, защото използвате персонализиран адрес за множествено предаване. (default: ${defaultMulticast})';
  @override
  String get network => 'Мрежа';
  @override
  late final _Translations$settingsTab$network$networkOptions$bg networkOptions = _Translations$settingsTab$network$networkOptions$bg._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$bg extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Други';
  @override
  String get support => 'Поддръжка на LocalSend';
  @override
  String get donate => 'Дарение';
  @override
  String get privacyPolicy => 'Политика за поверителност';
  @override
  String get termsOfUse => 'Условия за ползване';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$bg extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Това устройство може да изпраща файлове на други устройства, но други устройства не могат да изпращат файлове на това устройство.';
  @override
  String solution({required Object port}) =>
      'Това най-вероятно е проблем със защитната стена. Можете да разрешите това, като разрешите входящи връзки (UDP и TCP) на порт ${port}.';
  @override
  String get openFirewall => 'Отворете защитната стена';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$bg extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Това устройство не може да открие други устройства.';
  @override
  String get solution =>
      'Моля, уверете се, че всички устройства са в една и съща Wi-Fi мрежа и споделят една и съща конфигурация (порт, адрес за множествено предаване, криптиране). Можете да опитате да въведете ръчно IP адреса на целевото устройство. Ако това работи, обмислете добавянето на това устройство към любими, за да може да бъде автоматично открито в бъдеще.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$bg extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'И двете устройства не могат да се откриват, нито могат да споделят файлове.';
  @override
  String get solution =>
      'Проблемът и от двете страни ли съществува? Ако е така, трябва да се уверите, че и двете устройства са в една и съща Wi-Fi мрежа и споделят една и съща конфигурация (порт, адрес за множествено предаване, криптиране). Wi-Fi мрежата може да не позволява комуникация между участниците поради изолация на точката за достъп (AP). В този случай тази опция трябва да бъде деактивирана на рутера.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$bg extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Отвори файл';
  @override
  String get showInFolder => 'Покажи в папка';
  @override
  String get info => 'Информация';
  @override
  String get deleteFromHistory => 'Изтриване от историята';
}

// Path: progressPage.total
class _Translations$progressPage$total$bg extends Translations$progressPage$total$en {
  _Translations$progressPage$total$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$bg title = _Translations$progressPage$total$title$bg._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлове: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Размер: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Скорост: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$bg extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Използвайте „h“ като съкращение за часове и „m“ за минути
  @override
  String hours({required Object h, required Object m}) => '${h}ч ${m}мин';

  /// Използвайте „d“ за дни, „h“ за часове и „m“ за минути
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}д ${h}ч ${m}мин';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$bg extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Добави към избора';
  @override
  String get content => 'Какво искате да добавите?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$bg extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори файл';
  @override
  String get content => 'Искате ли да отворите получения файл?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$bg extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Въведете адрес';
  @override
  String get hashtag => 'Хаштаг';
  @override
  String get ip => 'IP адрес';
  @override
  String get recentlyUsed => 'Наскоро използван: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$bg extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отмени прехвърлянето на файлове';
  @override
  String get content => 'Наистина ли искате да отмените прехвърлянето на файлове?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$bg extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не може да се отвори файл';
  @override
  String content({required Object file}) => 'Не може да се отвори "${file}". Този файл бил ли е преместен, преименуван или изтрит?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$bg extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифроването е деактивирано';
  @override
  String get content =>
      'Комуникацията вече се осъществява чрез некриптиран HTTP протокол. За да използвате HTTPS протокол, активирайте криптирането отново.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$bg extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$bg extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Любими';
  @override
  String get noFavorites => 'Все още няма любими устройства.';
  @override
  String get addFavorite => 'Добави';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$bg extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изтриване от любими';
  @override
  String content({required Object name}) => 'Наистина ли искате да изтриете от любими "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$bg extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Добави към любими';
  @override
  String get titleEdit => 'Настройки';
  @override
  String get name => 'Име на устройство';
  @override
  String get auto => '(автоматично)';
  @override
  String get ip => 'IP адрес';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$bg extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Информация за файла';
  @override
  String get fileName => 'Име на файл:';
  @override
  String get path => 'Път:';
  @override
  String get size => 'Размер:';
  @override
  String get sender => 'Подател:';
  @override
  String get time => 'Време:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$bg extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Въведете име на файл';
  @override
  String original({required Object original}) => 'Оригинално: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$bg extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изчистване на история';
  @override
  String get content => 'Наистина ли искате да изтриете цялата история?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$bg extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend не може да намери други устройства без разрешение за сканиране на локалната мрежа. Моля, предоставете това разрешение в настройките.';
  @override
  String get gotoSettings => 'Настройки';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$bg extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Вид съобщение';
  @override
  String get multiline => 'Многоредов';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$bg extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Няма избрани файлове';
  @override
  String get content => 'Моля, изберете поне един файл.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$bg extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Няма разрешение';
  @override
  String get content => 'Не сте предоставили необходимите разрешения. Моля, предоставете ги в настройките.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$bg extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не е налична';
  @override
  String get content => 'Тази функция е достъпна само на:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$bg extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$bg extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Бързи действия';
  @override
  String get counter => 'Брояч';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Подложка с нули';
  @override
  String get sortBeforeCount => 'Сортирай по азбучен ред предварително (A-Z)';
  @override
  String get random => 'Случаен';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$bg extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Заявките за файлове вече се приемат автоматично. Имайте предвид, че всеки в локалната мрежа може да ви изпраща файлове.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$bg extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Заявките за файлове вече се приемат автоматично от устройства в списъка ви с любими.',
    'Внимание! В момента това не е напълно сигурно, тъй като хакер, който има пръстов отпечатък на всяко устройство от списъка ви с любими, може да ви изпраща файлове без ограничения.',
    'Въпреки това, тази опция все още е по-безопасна от разрешаването на всички потребители в локалната мрежа да ви изпращат файлове без ограничения.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$bg extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Въведете ПИН код';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$bg extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Режими на изпращане';
  @override
  String get single => 'Изпраща файлове до един получател. Изборът ще бъде изчистен след приключване на прехвърлянето на файлове.';
  @override
  String get multiple => 'Изпраща файлове до множество получатели. Изборът няма да бъде изчистен след приключване на прехвърлянето на файлове.';
  @override
  String get link => 'Получателите, които нямат инсталиран LocalSend, могат да изтеглят избраните файлове, като отворят връзката в своя браузър.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$bg extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL адрес';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$bg extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Система';
  @override
  String get dark => 'Тъмна';
  @override
  String get light => 'Светла';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$bg extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Система';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$bg extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Система';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$bg extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Всички';
  @override
  String get filtered => 'Филтриране';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$bg extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$bg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Общ напредък (${time})';
  @override
  String get finishedError => 'Завършено с грешка';
  @override
  String get canceledSender => 'Отменено от подателя';
  @override
  String get canceledReceiver => 'Отменено от получателя';
}
