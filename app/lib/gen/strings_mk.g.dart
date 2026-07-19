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
class TranslationsMk extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsMk({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.mk,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <mk>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsMk _root = this; // ignore: unused_field

  @override
  TranslationsMk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsMk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Македонски';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralMk general = _TranslationsGeneralMk._(_root);
  @override
  late final _TranslationsReceiveTabMk receiveTab = _TranslationsReceiveTabMk._(_root);
  @override
  late final _TranslationsSendTabMk sendTab = _TranslationsSendTabMk._(_root);
  @override
  late final _TranslationsSettingsTabMk settingsTab = _TranslationsSettingsTabMk._(_root);
  @override
  late final _TranslationsTroubleshootPageMk troubleshootPage = _TranslationsTroubleshootPageMk._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageMk networkInterfacesPage = _TranslationsNetworkInterfacesPageMk._(_root);
  @override
  late final _TranslationsReceiveHistoryPageMk receiveHistoryPage = _TranslationsReceiveHistoryPageMk._(_root);
  @override
  late final _TranslationsApkPickerPageMk apkPickerPage = _TranslationsApkPickerPageMk._(_root);
  @override
  late final _TranslationsSelectedFilesPageMk selectedFilesPage = _TranslationsSelectedFilesPageMk._(_root);
  @override
  late final _TranslationsReceivePageMk receivePage = _TranslationsReceivePageMk._(_root);
  @override
  late final _TranslationsReceiveOptionsPageMk receiveOptionsPage = _TranslationsReceiveOptionsPageMk._(_root);
  @override
  late final _TranslationsSendPageMk sendPage = _TranslationsSendPageMk._(_root);
  @override
  late final _TranslationsProgressPageMk progressPage = _TranslationsProgressPageMk._(_root);
  @override
  late final _TranslationsWebSharePageMk webSharePage = _TranslationsWebSharePageMk._(_root);
  @override
  late final _TranslationsAboutPageMk aboutPage = _TranslationsAboutPageMk._(_root);
  @override
  late final _TranslationsDonationPageMk donationPage = _TranslationsDonationPageMk._(_root);
  @override
  late final _TranslationsChangelogPageMk changelogPage = _TranslationsChangelogPageMk._(_root);
  @override
  late final _TranslationsAliasGeneratorMk aliasGenerator = _TranslationsAliasGeneratorMk._(_root);
  @override
  late final _TranslationsDialogsMk dialogs = _TranslationsDialogsMk._(_root);
  @override
  late final _TranslationsSanitizationMk sanitization = _TranslationsSanitizationMk._(_root);
  @override
  late final _TranslationsTrayMk tray = _TranslationsTrayMk._(_root);
  @override
  late final _TranslationsWebMk web = _TranslationsWebMk._(_root);
  @override
  late final _TranslationsAssetPickerMk assetPicker = _TranslationsAssetPickerMk._(_root);
}

// Path: general
class _TranslationsGeneralMk extends TranslationsGeneralEn {
  _TranslationsGeneralMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Прифати';
  @override
  String get accepted => 'Прифатено';
  @override
  String get add => 'Додај';
  @override
  String get advanced => 'Напредно';
  @override
  String get cancel => 'Откажи';
  @override
  String get close => 'Затвори';
  @override
  String get confirm => 'Потврди';
  @override
  String get continueStr => 'Продолжи';
  @override
  String get copy => 'Копирај';
  @override
  String get copiedToClipboard => 'Копирано во клипборд';
  @override
  String get decline => 'Одбиј';
  @override
  String get done => 'Готово';
  @override
  String get delete => 'Избриши';
  @override
  String get edit => 'Измени';
  @override
  String get error => 'Грешка';
  @override
  String get example => 'Пример';
  @override
  String get files => 'Датотеки';
  @override
  String get finished => 'Завршено';
  @override
  String get hide => 'Скриј';
  @override
  String get off => 'Исклучено';
  @override
  String get offline => 'Офлајн';
  @override
  String get on => 'Уклучено';
  @override
  String get online => 'Онлајн';
  @override
  String get open => 'Отвори';
  @override
  String get queue => 'Редица';
  @override
  String get quickSave => 'Брзо зачувување';
  @override
  String get quickSaveFromFavorites => 'Брзо зачувување од "Омилени"';
  @override
  String get renamed => 'Преименувано';
  @override
  String get reset => 'Ресетирај промени';
  @override
  String get restart => 'Рестрарт';
  @override
  String get settings => 'Поставки';
  @override
  String get skipped => 'Прескокнато';
  @override
  String get start => 'Започни';
  @override
  String get stop => 'Стопирај';
  @override
  String get save => 'Зачувај';
  @override
  String get unchanged => 'Непроменето';
  @override
  String get unknown => 'Непознато';
  @override
  String get noItemInClipboard => 'Нема ништо во клипборд.';
}

// Path: receiveTab
class _TranslationsReceiveTabMk extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Примање';
  @override
  late final _TranslationsReceiveTabInfoBoxMk infoBox = _TranslationsReceiveTabInfoBoxMk._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveMk quickSave = _TranslationsReceiveTabQuickSaveMk._(_root);
}

// Path: sendTab
class _TranslationsSendTabMk extends TranslationsSendTabEn {
  _TranslationsSendTabMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Праќање';
  @override
  late final _TranslationsSendTabSelectionMk selection = _TranslationsSendTabSelectionMk._(_root);
  @override
  late final _TranslationsSendTabPickerMk picker = _TranslationsSendTabPickerMk._(_root);
  @override
  String get shareIntentInfo => 'Исто така, можете да ја користите опцијата "Сподели" на вашиот мобилен уред за полесно одбирање на датотеки.';
  @override
  String get nearbyDevices => 'Уреди во близина';
  @override
  String get thisDevice => 'Овој уред';
  @override
  String get scan => 'Барај уреди';
  @override
  String get manualSending => 'Рачно праќање';
  @override
  String get sendMode => 'Режим на праќање';
  @override
  late final _TranslationsSendTabSendModesMk sendModes = _TranslationsSendTabSendModesMk._(_root);
  @override
  String get sendModeHelp => 'Објаснување';
  @override
  String get help => 'Ве молиме осигурајте се дека посакуваниот примач е на истата Wi-Fi мрежа.';
  @override
  String get placeItems => 'Поставете предмети за споделување.';
}

// Path: settingsTab
class _TranslationsSettingsTabMk extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Поставки';
  @override
  late final _TranslationsSettingsTabGeneralMk general = _TranslationsSettingsTabGeneralMk._(_root);
  @override
  late final _TranslationsSettingsTabReceiveMk receive = _TranslationsSettingsTabReceiveMk._(_root);
  @override
  late final _TranslationsSettingsTabSendMk send = _TranslationsSettingsTabSendMk._(_root);
  @override
  late final _TranslationsSettingsTabNetworkMk network = _TranslationsSettingsTabNetworkMk._(_root);
  @override
  late final _TranslationsSettingsTabOtherMk other = _TranslationsSettingsTabOtherMk._(_root);
  @override
  String get advancedSettings => 'Напредни поставки';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageMk extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отстранување на грешки';
  @override
  String get subTitle => 'Дали апликацијата не работи како што треба? Овде можете да најдете некои од почестите решенија за проблемите.';
  @override
  String get solution => 'Решение:';
  @override
  String get fixButton => 'Поправи автоматски';
  @override
  late final _TranslationsTroubleshootPageFirewallMk firewall = _TranslationsTroubleshootPageFirewallMk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryMk noDiscovery = _TranslationsTroubleshootPageNoDiscoveryMk._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionMk noConnection = _TranslationsTroubleshootPageNoConnectionMk._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageMk extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежни интерфејси';
  @override
  String get info =>
      'Вообичаено, LocalSend ги користи сите достапни мрежни интерфејси. Можете да отстраните непосакувани мрежи овде. Треба да го рестартирате серверот за да се вчитаат промените.';
  @override
  String get preview => 'Преглед';
  @override
  String get whitelist => 'Бела листа';
  @override
  String get blacklist => 'Црна листа';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageMk extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Историја';
  @override
  String get openFolder => 'Отвори папка';
  @override
  String get deleteHistory => 'Избриши историја';
  @override
  String get empty => 'Историјата е празна.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsMk entryActions = _TranslationsReceiveHistoryPageEntryActionsMk._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageMk extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Апликации (APK)';
  @override
  String get excludeSystemApps => 'Отстрани системски апликации';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Отстрани апликации кои не можат да се стартуваат';
  @override
  String apps({required Object n}) => '${n} Апликации';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageMk extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Избриши ги сите';
}

// Path: receivePage
class _TranslationsReceivePageMk extends TranslationsReceivePageEn {
  _TranslationsReceivePageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mk'))(
    n,
    one: 'сака да ви прати датотека',
    other: 'сака да ви прати ${n} датотеки',
  );
  @override
  String get subTitleMessage => 'ви прати порака:';
  @override
  String get subTitleLink => 'ви прати линк:';
  @override
  String get canceled => 'Праќачот го откажа барањето.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageMk extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

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
  String get saveToGalleryOff => 'Автоматски исклучено бидејќи има папки.';
}

// Path: sendPage
class _TranslationsSendPageMk extends TranslationsSendPageEn {
  _TranslationsSendPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Во очекување за одговор…';
  @override
  String get rejected => 'Примачот го одби барањето.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Примачот е зафатен со друго барање.';
}

// Path: progressPage
class _TranslationsProgressPageMk extends TranslationsProgressPageEn {
  _TranslationsProgressPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Праќање датотеки';
  @override
  String get titleReceiving => 'Примање датотеки';
  @override
  String get savedToGallery => 'Зачувано во галерија';
  @override
  late final _TranslationsProgressPageTotalMk total = _TranslationsProgressPageTotalMk._(_root);
  @override
  late final _TranslationsProgressPageRemainingTimeMk remainingTime = _TranslationsProgressPageRemainingTimeMk._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageMk extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сподели преку линк';
  @override
  String get loading => 'Стартување на серверот…';
  @override
  String get stopping => 'Сопирање на серверот…';
  @override
  String get error => 'Се појави грешка при стартување на серверот.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mk'))(
    n,
    one: 'Отвори го овој линк во твојот пребарувач:',
    other: 'Отвори еден од овие линкови во твојот пребарувач:',
  );
  @override
  String get requests => 'Барања';
  @override
  String get noRequests => 'Нема барања досега.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Автоматско прифаќање барања';
  @override
  String get requirePin => 'Барај ПИН код';
  @override
  String pinHint({required Object pin}) => 'ПИН кодот е "${pin}"';
  @override
  String get encryptionHint => 'LocalSend користи самопотпишан сертификат. Треба да го прифатите во својот пребарувач.';
  @override
  String pendingRequests({required Object n}) => 'Барања што чекаат: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageMk extends TranslationsAboutPageEn {
  _TranslationsAboutPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'За LocalSend';
  @override
  List<String> get description => [
    'LocalSend е бесплатна апликација, со отворен код што овозможува безбедно споделување датотеки и пораки со уреди во близина преку вашата локална мрежа без потреба од интернет конекција.',
    'Оваа апликација е достапна на Android, iOS, macOS, Windows и Linux. Можете да ги најдете сите опции за превземање на официјалната страна.',
  ];
  @override
  String get author => 'Автор';
  @override
  String get contributors => 'Допринесувачи';
  @override
  String get packagers => 'Пакетери';
  @override
  String get translators => 'Преведувачи';
}

// Path: donationPage
class _TranslationsDonationPageMk extends TranslationsDonationPageEn {
  _TranslationsDonationPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Донирај';
  @override
  String get info =>
      'LocalSend е бесплатна апликација, со отворен код и без ниедна реклама. Ако ви се допаѓа апликацијата, можете да го поддржите развивањето со донација.';
  @override
  String donate({required Object amount}) => 'Донирај ${amount}';
  @override
  String get thanks => 'Ви благодариме многу!';
  @override
  String get restore => 'Поврати го купувањето';
}

// Path: changelogPage
class _TranslationsChangelogPageMk extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Евиденција на промени';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorMk extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Неодоливо',
    'Убаво',
    'Големо',
    'Светло',
    'Чисто',
    'Паметно',
    'Кул',
    'Слатко',
    'Лукаво',
    'Одлучно',
    'Енергетично',
    'Ефикасно',
    'Фантастично',
    'Брзо',
    'Фино',
    'Свежо',
    'Добро',
    'Прекрасно',
    'Велико',
    'Згодно',
    'Жешко',
    'Љубезно',
    'Сакано',
    'Мистично',
    'Уредно',
    'Мило',
    'Трпеливо',
    'Убаво',
    'Моќно',
    'Богато',
    'Тајно',
    'Паметно',
    'Цврсто',
    'Специјално',
    'Стратешко',
    'Силно',
    'Уредно',
    'Мудро',
  ];
  @override
  List<String> get fruits => [
    'Јаболче',
    'Авокадце',
    'Бананче',
    'Капинче',
    'Боровниче',
    'Брокулче',
    'Морковче',
    'Црешиче',
    'Кокосче',
    'Гроздче',
    'Лимонче',
    'Марулче',
    'Мангце',
    'Дињче',
    'Печурче',
    'Кромидче',
    'Портокалче',
    'Папајче',
    'Прасче',
    'Крувче',
    'Ананасче',
    'Компирче',
    'Тиквиче',
    'Малинче',
    'Јагодче',
    'Доматче',
  ];

  /// Завршетоците на именките намерно се ставени во деминутив, за да се совпадне родот со придавката
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsMk extends TranslationsDialogsEn {
  _TranslationsDialogsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileMk addFile = _TranslationsDialogsAddFileMk._(_root);
  @override
  late final _TranslationsDialogsOpenFileMk openFile = _TranslationsDialogsOpenFileMk._(_root);
  @override
  late final _TranslationsDialogsAddressInputMk addressInput = _TranslationsDialogsAddressInputMk._(_root);
  @override
  late final _TranslationsDialogsCancelSessionMk cancelSession = _TranslationsDialogsCancelSessionMk._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileMk cannotOpenFile = _TranslationsDialogsCannotOpenFileMk._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeMk encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeMk._(_root);
  @override
  late final _TranslationsDialogsErrorDialogMk errorDialog = _TranslationsDialogsErrorDialogMk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogMk favoriteDialog = _TranslationsDialogsFavoriteDialogMk._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogMk favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogMk._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogMk favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogMk._(_root);
  @override
  late final _TranslationsDialogsFileInfoMk fileInfo = _TranslationsDialogsFileInfoMk._(_root);
  @override
  late final _TranslationsDialogsFileNameInputMk fileNameInput = _TranslationsDialogsFileNameInputMk._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogMk historyClearDialog = _TranslationsDialogsHistoryClearDialogMk._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedMk localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedMk._(_root);
  @override
  late final _TranslationsDialogsMessageInputMk messageInput = _TranslationsDialogsMessageInputMk._(_root);
  @override
  late final _TranslationsDialogsNoFilesMk noFiles = _TranslationsDialogsNoFilesMk._(_root);
  @override
  late final _TranslationsDialogsNoPermissionMk noPermission = _TranslationsDialogsNoPermissionMk._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformMk notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformMk._(_root);
  @override
  late final _TranslationsDialogsQrMk qr = _TranslationsDialogsQrMk._(_root);
  @override
  late final _TranslationsDialogsQuickActionsMk quickActions = _TranslationsDialogsQuickActionsMk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeMk quickSaveNotice = _TranslationsDialogsQuickSaveNoticeMk._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeMk quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeMk._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinMk pin = _TranslationsDialogsPinMk._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpMk sendModeHelp = _TranslationsDialogsSendModeHelpMk._(_root);
  @override
  late final _TranslationsDialogsZoomMk zoom = _TranslationsDialogsZoomMk._(_root);
}

// Path: sanitization
class _TranslationsSanitizationMk extends TranslationsSanitizationEn {
  _TranslationsSanitizationMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Името на датотеката не може да биде празно';
  @override
  String get invalid => 'Името на датотеката содржи невалидни карактери';
}

// Path: tray
class _TranslationsTrayMk extends TranslationsTrayEn {
  _TranslationsTrayMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Затвори го LocalSend';
  @override
  String get closeWindows => 'Излези';
}

// Path: web
class _TranslationsWebMk extends TranslationsWebEn {
  _TranslationsWebMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Внеси ПИН код';
  @override
  String get invalidPin => 'Невалиден ПИН код';
  @override
  String get tooManyAttempts => 'Премногу обиди';
  @override
  String get rejected => 'Одбиено';
  @override
  String get files => 'Датотеки';
  @override
  String get fileName => 'Име на датотека';
  @override
  String get size => 'Големина';
}

// Path: assetPicker
class _TranslationsAssetPickerMk extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Потврди';
  @override
  String get cancel => 'Откажи';
  @override
  String get edit => 'Измени';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Вчитувањето е неуспешно';
  @override
  String get original => 'Потекло';
  @override
  String get preview => 'Преглед';
  @override
  String get select => 'Избери';
  @override
  String get emptyList => 'Празна листа';
  @override
  String get unSupportedAssetType => 'Неподдржан тип на датотека.';
  @override
  String get unableToAccessAll => 'Не е возможно пристапување до сите датотеки на уредот';
  @override
  String get viewingLimitedAssetsTip => 'Види ги единствено датотеките и албумите достапни за апликацијата.';
  @override
  String get changeAccessibleLimitedAssets => 'Кликнете за да ги ажурирате достапните датотеки';
  @override
  String get accessAllTip =>
      'Апликацијата може да пристапи само до некои датотеки на уредот. Одете до системските поставки и дозволете апликацијата да пристапува до сите медиуми на уредот.';
  @override
  String get goToSystemSettings => 'Одете до системските поставки';
  @override
  String get accessLimitedAssets => 'Продолжи со ограничен пристап';
  @override
  String get accessiblePathName => 'Достапни датотеки';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Слика';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Останати медии';
  @override
  String get sActionPlayHint => 'пушти';
  @override
  String get sActionPreviewHint => 'преглед';
  @override
  String get sActionSelectHint => 'избери';
  @override
  String get sActionSwitchPathLabel => 'промени патека';
  @override
  String get sActionUseCameraHint => 'користи камера';
  @override
  String get sNameDurationLabel => 'времетраење';
  @override
  String get sUnitAssetCountLabel => 'број';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxMk extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порта:';
  @override
  String get alias => 'Име на уред:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveMk extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Омилени';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionMk extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избор';
  @override
  String files({required Object files}) => 'Датотеки: ${files}';
  @override
  String size({required Object size}) => 'Големина: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerMk extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Датотека';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медија';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Апликација';
  @override
  String get clipboard => 'Пастирај';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesMk extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Еден примач';
  @override
  String get multiple => 'Повеќе примачи';
  @override
  String get link => 'Сподели со линк';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralMk extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Општо';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsMk brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsMk._(_root);
  @override
  String get color => 'Боја';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsMk colorOptions = _TranslationsSettingsTabGeneralColorOptionsMk._(_root);
  @override
  String get language => 'Јазик';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsMk languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsMk._(_root);
  @override
  String get saveWindowPlacement => 'Зачувај ја позицијата на прозорецот после напуштање';
  @override
  String get saveWindowPlacementWindows => 'Зачувај ја положбата на прозорецот после излез';
  @override
  String get minimizeToTray => 'Минимизирај во системската лента/лента со менија, при затварање';
  @override
  String get launchAtStartup => 'Отвори на почеток на системот';
  @override
  String get launchMinimized => 'Автоматско отворање: Започни минимизирано';
  @override
  String get showInContextMenu => 'Прикажи го LocalSend во контекстното мени';
  @override
  String get animations => 'Анимации';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveMk extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Примање';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Автоматски заврши';
  @override
  String get destination => 'Зачувај во папка';
  @override
  String get downloads => '(Симнувања)';
  @override
  String get saveToGallery => 'Зачувај ја медијата во галерија';
  @override
  String get saveToHistory => 'Зачувај во историја';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendMk extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Праќање';
  @override
  String get shareViaLinkAutoAccept => 'Автоматски прифати барања во режимот "Сподели преку линк"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkMk extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежа';
  @override
  String get needRestart => 'Рестартирај го серверот за да се применат поставките!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Име на уред';
  @override
  String get deviceType => 'Тип на уред';
  @override
  String get deviceModel => 'Модел на уред';
  @override
  String get port => 'Порта';
  @override
  String get network => 'Мрежа';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsMk networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsMk._(_root);
  @override
  String get discoveryTimeout => 'Откривањето истече';
  @override
  String get useSystemName => 'Користи го системското име';
  @override
  String get generateRandomAlias => 'Генерирај случаен назив';
  @override
  String portWarning({required Object defaultPort}) =>
      'Можно е да не бидете пронајдени од други уреди бидејќи користите нестандардна порта. (стандардна: ${defaultPort})';
  @override
  String get encryption => 'Енкрипција';
  @override
  String get multicastGroup => 'Мултикаст адреса';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Можно е да не бидете детектирани од други уреди бидејќи имате нестандардна мултикаст адреса. (стандардна: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherMk extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Останато';
  @override
  String get support => 'Поддржи го LocalSend';
  @override
  String get donate => 'Донирај';
  @override
  String get privacyPolicy => 'Политика на приватност';
  @override
  String get termsOfUse => 'Услови за користење';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallMk extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овој уред може да праќа датотеки до други уреди, но други уреди не можат да праќаат датотеки до овој уред.';
  @override
  String solution({required Object port}) =>
      'Најверојатно ова е проблем со firewall. Можете да го решите ова со овозможување на дојдовни конекции(УДП и ТЦП) на порта ${port}.';
  @override
  String get openFirewall => 'Отвори Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryMk extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овој уред не може да открие други уреди.';
  @override
  String get solution =>
      'Осигурајте се дека сите уреди се на истата Wi-Fi мрежа и споделуваат иста конфигурација(порта, мултикаст адреса, енкрипција). Можете да пробате да ја напишете IP адресата на таргет уредот мануелно. Ако ова работи, размислете за додавање на овој уред во омилени за автоматски да се открива во иднина.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionMk extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'И двата уреди не можат да се пронајдат меѓусебно ниту можат да споделуваат датотеки.';
  @override
  String get solution =>
      'Дали проблемот постои на двете страни? Ако да, треба да се осигурате дека двата уреди се на истата Wi-Fi мрежа и споделуваат иста конфигурација(порта, мултикаст адреса, енкрипција). Wi-Fi мрежата може да не дозволува комуникација помеѓу партиципанти поради Access Point (AP) изолација. Во овој случај, оваа опција мора да биде исклучена на рутерот.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsMk extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Отвори датотека';
  @override
  String get showInFolder => 'Покажи во папка';
  @override
  String get info => 'Информација';
  @override
  String get deleteFromHistory => 'Избриши од историја';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalMk extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleMk title = _TranslationsProgressPageTotalTitleMk._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Датотеки: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Големина: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Брзина: ${speed}/s';
}

// Path: progressPage.remainingTime
class _TranslationsProgressPageRemainingTimeMk extends TranslationsProgressPageRemainingTimeEn {
  _TranslationsProgressPageRemainingTimeMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Користи 'h' како кратенка за часови и 'm' за минути
  @override
  String hours({required Object h, required Object m}) => '${h}ч ${m}мин';

  /// Користи 'd' за денови, 'h' за часови и 'm' за минути
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}д ${h}ч ${m}мин';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileMk extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додај во изборот';
  @override
  String get content => 'Што сакате да додадете?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileMk extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори датотека';
  @override
  String get content => 'Дали сакате да ја отворите добиената датотека?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputMk extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Внеси адреса';
  @override
  String get hashtag => 'Хаштаг';
  @override
  String get ip => 'IP адреса';
  @override
  String get recentlyUsed => 'Неодамна користени: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionMk extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Откажи го трансферот на датотеки';
  @override
  String get content => 'Дали навистина сакаш да го откажеш трансферот на датотеки?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileMk extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не може да се отвори датотеката';
  @override
  String content({required Object file}) => 'Не може да се отвори "${file}". Дали оваа датотека беше преместена, преименувана или пак избришана?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeMk extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Енкрипцијата е исклучена';
  @override
  String get content =>
      'Комуникацијата сега се одвива преку неенкриптиран HTTP протокол. Да користите  HTTPS протокол, овозможете ја енкрипцијата повторно.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogMk extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogMk extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Омилени';
  @override
  String get noFavorites => 'Нема омилени уреди сеуште.';
  @override
  String get addFavorite => 'Додај';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogMk extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избриши од омилени';
  @override
  String content({required Object name}) => 'Дали навистина сакате да го избришете "${name}" од омилени?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogMk extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Додај во омилени';
  @override
  String get titleEdit => 'Поставки';
  @override
  String get name => 'Име на уред';
  @override
  String get auto => '(автоматски)';
  @override
  String get ip => 'IP адреса';
  @override
  String get port => 'Порта';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoMk extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Информација за датотеката';
  @override
  String get fileName => 'Име на датотека:';
  @override
  String get path => 'Патека:';
  @override
  String get size => 'Големина:';
  @override
  String get sender => 'Испраќач:';
  @override
  String get time => 'Време:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputMk extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Внеси име на датотека';
  @override
  String original({required Object original}) => 'Оригинал: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogMk extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Исчисти ја историјата';
  @override
  String get content => 'Дали навистина сакаш да ја избришеш целата историја?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedMk extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend не може да најде други уреди без дозвола да ја скенира локалната мрежа. Ве молиме дадете дозвола во поставките.';
  @override
  String get gotoSettings => 'Поставки';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputMk extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Напишете порака';
  @override
  String get multiline => 'Повеќе редови';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesMk extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нема избрани датотеки';
  @override
  String get content => 'Ве молиме изберете бар една датотека.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionMk extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нема дозвола';
  @override
  String get content => 'Не сте ги дале неопходните дозволи. Ве молиме дајте ги во поставките.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformMk extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не е достапно';
  @override
  String get content => 'Оваа функција е единствено достапна на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrMk extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsMk extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Брзи акции';
  @override
  String get counter => 'Бројач';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Дополни со нули';
  @override
  String get sortBeforeCount => 'Подреди по азбучен ред однапред (А-Ш)';
  @override
  String get random => 'Случаен';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeMk extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Барањата за датотеки се отсега прифатени автоматски. Имајте во предвид дека секој на локалната мрежа може да ви прати датотеки.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeMk extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Барањата за датотеки се отсега прифатени автоматски од уреди во вашата листа на омилени уреди.',
    'Предупредување! Сега, ова не е целосно безбедно, бидејќи хакер кој има отисок од било кој уред од вашата листа на омилени уреди може да ви прати датотеки без ограничување.',
    'Сепак, оваа опција е секако побезбедна одколку дозволување на сите корисници од локалната мрежа да ви праќаат датотеки без ограничување.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinMk extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Внеси ПИН код';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpMk extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Режими на праќање';
  @override
  String get single => 'Праќа датотеки до еден примач. Изборот ќе биде тргнат после завршен трансфер на датотеки.';
  @override
  String get multiple => 'Праќа датотеки на повеќе примачи. Избророт нема да биде тргнат после завршен трансфер на датотеки.';
  @override
  String get link =>
      'Примачите кои го немаат LocalSend инсталирано може да ги симнат избраните датотеки преку отварање на линкот во нивниот пребарувач.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomMk extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL адреса';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsMk extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системска';
  @override
  String get dark => 'Темна';
  @override
  String get light => 'Светла';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsMk extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системска';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsMk extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системски';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsMk extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Сите';
  @override
  String get filtered => 'Филтрирани';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleMk extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleMk._(TranslationsMk root) : this._root = root, super.internal(root);

  final TranslationsMk _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Вкупен напредок (${time})';
  @override
  String get finishedError => 'Заврши со грешка';
  @override
  String get canceledSender => 'Откажано од праќач';
  @override
  String get canceledReceiver => 'Откажано од примач';
}
