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
class TranslationsBg extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsBg({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Български';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralBg general = _TranslationsGeneralBg._(_root);
  @override
  late final _TranslationsReceiveTabBg receiveTab = _TranslationsReceiveTabBg._(_root);
  @override
  late final _TranslationsSendTabBg sendTab = _TranslationsSendTabBg._(_root);
  @override
  late final _TranslationsSettingsTabBg settingsTab = _TranslationsSettingsTabBg._(_root);
  @override
  late final _TranslationsTroubleshootPageBg troubleshootPage = _TranslationsTroubleshootPageBg._(_root);
  @override
  late final _TranslationsReceiveHistoryPageBg receiveHistoryPage = _TranslationsReceiveHistoryPageBg._(_root);
  @override
  late final _TranslationsApkPickerPageBg apkPickerPage = _TranslationsApkPickerPageBg._(_root);
  @override
  late final _TranslationsSelectedFilesPageBg selectedFilesPage = _TranslationsSelectedFilesPageBg._(_root);
  @override
  late final _TranslationsReceivePageBg receivePage = _TranslationsReceivePageBg._(_root);
  @override
  late final _TranslationsReceiveOptionsPageBg receiveOptionsPage = _TranslationsReceiveOptionsPageBg._(_root);
  @override
  late final _TranslationsSendPageBg sendPage = _TranslationsSendPageBg._(_root);
  @override
  late final _TranslationsProgressPageBg progressPage = _TranslationsProgressPageBg._(_root);
  @override
  late final _TranslationsWebSharePageBg webSharePage = _TranslationsWebSharePageBg._(_root);
  @override
  late final _TranslationsAboutPageBg aboutPage = _TranslationsAboutPageBg._(_root);
  @override
  late final _TranslationsDonationPageBg donationPage = _TranslationsDonationPageBg._(_root);
  @override
  late final _TranslationsChangelogPageBg changelogPage = _TranslationsChangelogPageBg._(_root);
  @override
  late final _TranslationsAliasGeneratorBg aliasGenerator = _TranslationsAliasGeneratorBg._(_root);
  @override
  late final _TranslationsDialogsBg dialogs = _TranslationsDialogsBg._(_root);
  @override
  late final _TranslationsSanitizationBg sanitization = _TranslationsSanitizationBg._(_root);
  @override
  late final _TranslationsTrayBg tray = _TranslationsTrayBg._(_root);
  @override
  late final _TranslationsWebBg web = _TranslationsWebBg._(_root);
  @override
  late final _TranslationsAssetPickerBg assetPicker = _TranslationsAssetPickerBg._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageBg networkInterfacesPage = _TranslationsNetworkInterfacesPageBg._(_root);
}

// Path: general
class _TranslationsGeneralBg extends TranslationsGeneralEn {
  _TranslationsGeneralBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
  String get delete => 'Изтрий';
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
class _TranslationsReceiveTabBg extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Получаване';
  @override
  late final _TranslationsReceiveTabInfoBoxBg infoBox = _TranslationsReceiveTabInfoBoxBg._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveBg quickSave = _TranslationsReceiveTabQuickSaveBg._(_root);
}

// Path: sendTab
class _TranslationsSendTabBg extends TranslationsSendTabEn {
  _TranslationsSendTabBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изпращане';
  @override
  late final _TranslationsSendTabSelectionBg selection = _TranslationsSendTabSelectionBg._(_root);
  @override
  late final _TranslationsSendTabPickerBg picker = _TranslationsSendTabPickerBg._(_root);
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
  late final _TranslationsSendTabSendModesBg sendModes = _TranslationsSendTabSendModesBg._(_root);
  @override
  String get sendModeHelp => 'Обяснение';
  @override
  String get help => 'Моля, уверете се, че желаната цел също е в същата Wi-Fi мрежа.';
  @override
  String get placeItems => 'Поставете елементи за споделяне.';
}

// Path: settingsTab
class _TranslationsSettingsTabBg extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Настройки';
  @override
  late final _TranslationsSettingsTabGeneralBg general = _TranslationsSettingsTabGeneralBg._(_root);
  @override
  late final _TranslationsSettingsTabReceiveBg receive = _TranslationsSettingsTabReceiveBg._(_root);
  @override
  late final _TranslationsSettingsTabSendBg send = _TranslationsSettingsTabSendBg._(_root);
  @override
  late final _TranslationsSettingsTabNetworkBg network = _TranslationsSettingsTabNetworkBg._(_root);
  @override
  late final _TranslationsSettingsTabOtherBg other = _TranslationsSettingsTabOtherBg._(_root);
  @override
  String get advancedSettings => 'Разширени настройки';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageBg extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallBg firewall = _TranslationsTroubleshootPageFirewallBg._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryBg noDiscovery = _TranslationsTroubleshootPageNoDiscoveryBg._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionBg noConnection = _TranslationsTroubleshootPageNoConnectionBg._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageBg extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'История';
  @override
  String get openFolder => 'Отвори папка';
  @override
  String get deleteHistory => 'Изтрий историята';
  @override
  String get empty => 'Историята е празна.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsBg entryActions = _TranslationsReceiveHistoryPageEntryActionsBg._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageBg extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageBg extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Изтрий всички';
}

// Path: receivePage
class _TranslationsReceivePageBg extends TranslationsReceivePageEn {
  _TranslationsReceivePageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bg'))(n, one: 'иска да ви изпрати файл', other: 'иска да ви изпрати ${n} файлове');
  @override
  String get subTitleMessage => 'ти изпрати съобщение:';
  @override
  String get subTitleLink => 'ти изпрати връзка:';
  @override
  String get canceled => 'Подателят е отменил заявката.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageBg extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опции';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend папка)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Изключва се автоматично, защото има папки.';
}

// Path: sendPage
class _TranslationsSendPageBg extends TranslationsSendPageEn {
  _TranslationsSendPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageBg extends TranslationsProgressPageEn {
  _TranslationsProgressPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Изпращане на файлове';
  @override
  String get titleReceiving => 'Получаване на файлове';
  @override
  String get savedToGallery => 'Запазено в Снимки';
  @override
  late final _TranslationsProgressPageTotalBg total = _TranslationsProgressPageTotalBg._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageBg extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageBg extends TranslationsAboutPageEn {
  _TranslationsAboutPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageBg extends TranslationsDonationPageEn {
  _TranslationsDonationPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дарете';
  @override
  String get info =>
      'LocalSend е безплатен, с отворен код и без никакви реклами. Ако харесвате приложението, можете да подкрепите разработката с дарение.';
  @override
  String donate({required Object amount}) => 'Дарете ${amount}';
  @override
  String get thanks => 'Благодаря много!';
  @override
  String get restore => 'Възстановяване на покупка';
}

// Path: changelogPage
class _TranslationsChangelogPageBg extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дневник на промените';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorBg extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsBg extends TranslationsDialogsEn {
  _TranslationsDialogsBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileBg addFile = _TranslationsDialogsAddFileBg._(_root);
  @override
  late final _TranslationsDialogsOpenFileBg openFile = _TranslationsDialogsOpenFileBg._(_root);
  @override
  late final _TranslationsDialogsAddressInputBg addressInput = _TranslationsDialogsAddressInputBg._(_root);
  @override
  late final _TranslationsDialogsCancelSessionBg cancelSession = _TranslationsDialogsCancelSessionBg._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileBg cannotOpenFile = _TranslationsDialogsCannotOpenFileBg._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeBg encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeBg._(_root);
  @override
  late final _TranslationsDialogsErrorDialogBg errorDialog = _TranslationsDialogsErrorDialogBg._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogBg favoriteDialog = _TranslationsDialogsFavoriteDialogBg._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogBg favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogBg._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogBg favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogBg._(_root);
  @override
  late final _TranslationsDialogsFileInfoBg fileInfo = _TranslationsDialogsFileInfoBg._(_root);
  @override
  late final _TranslationsDialogsFileNameInputBg fileNameInput = _TranslationsDialogsFileNameInputBg._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogBg historyClearDialog = _TranslationsDialogsHistoryClearDialogBg._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedBg localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedBg._(_root);
  @override
  late final _TranslationsDialogsMessageInputBg messageInput = _TranslationsDialogsMessageInputBg._(_root);
  @override
  late final _TranslationsDialogsNoFilesBg noFiles = _TranslationsDialogsNoFilesBg._(_root);
  @override
  late final _TranslationsDialogsNoPermissionBg noPermission = _TranslationsDialogsNoPermissionBg._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformBg notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformBg._(_root);
  @override
  late final _TranslationsDialogsQrBg qr = _TranslationsDialogsQrBg._(_root);
  @override
  late final _TranslationsDialogsQuickActionsBg quickActions = _TranslationsDialogsQuickActionsBg._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeBg quickSaveNotice = _TranslationsDialogsQuickSaveNoticeBg._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeBg quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeBg._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinBg pin = _TranslationsDialogsPinBg._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpBg sendModeHelp = _TranslationsDialogsSendModeHelpBg._(_root);
  @override
  late final _TranslationsDialogsZoomBg zoom = _TranslationsDialogsZoomBg._(_root);
}

// Path: sanitization
class _TranslationsSanitizationBg extends TranslationsSanitizationEn {
  _TranslationsSanitizationBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Името на файла не може да бъде празно';
  @override
  String get invalid => 'Името на файла съдържа невалидни знаци';
}

// Path: tray
class _TranslationsTrayBg extends TranslationsTrayEn {
  _TranslationsTrayBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsWebBg extends TranslationsWebEn {
  _TranslationsWebBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerBg extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageBg extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxBg extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveBg extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionBg extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerBg extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesBg extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralBg extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Общи';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsBg brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsBg._(_root);
  @override
  String get color => 'Цвят';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsBg colorOptions = _TranslationsSettingsTabGeneralColorOptionsBg._(_root);
  @override
  String get language => 'Език';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsBg languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsBg._(_root);
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
class _TranslationsSettingsTabReceiveBg extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendBg extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изпращане';
  @override
  String get shareViaLinkAutoAccept => 'Автоматично приемане на заявки в режим "Споделяне чрез връзка"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkBg extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsBg networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsBg._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherBg extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Други';
  @override
  String get support => 'Поддръжка на LocalSend';
  @override
  String get donate => 'Дарете';
  @override
  String get privacyPolicy => 'Политика за поверителност';
  @override
  String get termsOfUse => 'Условия за ползване';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallBg extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Това устройство може да изпраща файлове на други устройства, но други устройства не могат да изпращат файлове на това устройство.';
  @override
  String solution({required Object port}) =>
      'Това най-вероятно е проблем със защитната стена. Можете да разрешите това, като разрешите входящи връзки (UDP и TCP) на порт ${port}.';
  @override
  String get openFirewallSettings => 'Отворете защитната стена';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryBg extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Това устройство не може да открие други устройства.';
  @override
  String get solution =>
      'Моля, уверете се, че всички устройства са в една и съща Wi-Fi мрежа и споделят една и съща конфигурация (порт, адрес за множествено предаване, криптиране). Можете да опитате да въведете ръчно IP адреса на целевото устройство. Ако това работи, обмислете добавянето на това устройство към любими, за да може да бъде автоматично открито в бъдеще.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionBg extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'И двете устройства не могат да се откриват, нито могат да споделят файлове.';
  @override
  String get solution =>
      'Проблемът и от двете страни ли съществува? Ако е така, трябва да се уверите, че и двете устройства са в една и съща Wi-Fi мрежа и споделят една и съща конфигурация (порт, адрес за множествено предаване, криптиране). Wi-Fi мрежата може да не позволява комуникация между участниците поради изолация на точката за достъп (AP). В този случай тази опция трябва да бъде деактивирана на рутера.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsBg extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Отвори файл';
  @override
  String get showInFolder => 'Покажи в папка';
  @override
  String get info => 'Информация';
  @override
  String get deleteFromHistory => 'Изтрий от историята';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalBg extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleBg title = _TranslationsProgressPageTotalTitleBg._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлове: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Размер: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Скорост: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileBg extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Добави към избора';
  @override
  String get content => 'Какво искате да добавите?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileBg extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори файл';
  @override
  String get content => 'Искате ли да отворите получения файл?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputBg extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionBg extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отмени прехвърлянето на файлове';
  @override
  String get content => 'Наистина ли искате да отмените прехвърлянето на файлове?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileBg extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не може да се отвори файл';
  @override
  String content({required Object file}) => 'Не може да се отвори "${file}". Този файл бил ли е преместен, преименуван или изтрит?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeBg extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифроването е деактивирано';
  @override
  String get content =>
      'Комуникацията вече се осъществява чрез некриптиран HTTP протокол. За да използвате HTTPS протокол, активирайте криптирането отново.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogBg extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogBg extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogBg extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изтриване от любими';
  @override
  String content({required Object name}) => 'Наистина ли искате да изтриете от любими "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogBg extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoBg extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputBg extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Въведете име на файл';
  @override
  String original({required Object original}) => 'Оригинално: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogBg extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Изчистване на история';
  @override
  String get content => 'Наистина ли искате да изтриете цялата история?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedBg extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend не може да намери други устройства, без да има разрешение за сканиране на локалната мрежа. Моля, дайте това разрешение в настройките.';
  @override
  String get gotoSettings => 'Настройки';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputBg extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Вид съобщение';
  @override
  String get multiline => 'Многоредов';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesBg extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Няма избрани файлове';
  @override
  String get content => 'Моля, изберете поне един файл.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionBg extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Няма разрешение';
  @override
  String get content => 'Не сте предоставили необходимите разрешения. Моля, дайте ги в настройките.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformBg extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не е налична';
  @override
  String get content => 'Тази функция е достъпна само на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrBg extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsBg extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeBg extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Заявките за файлове вече се приемат автоматично. Имайте предвид, че всеки в локалната мрежа може да ви изпраща файлове.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeBg extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinBg extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Въведете ПИН код';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpBg extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomBg extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL адрес';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsBg extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsBg extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Система';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsBg extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Система';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsBg extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsBg._(TranslationsBg root) : this._root = root, super.internal(root);

  final TranslationsBg _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Всички';
  @override
  String get filtered => 'Филтриране';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleBg extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleBg._(TranslationsBg root) : this._root = root, super.internal(root);

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
