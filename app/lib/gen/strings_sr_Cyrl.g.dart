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
class TranslationsSrCyrl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSrCyrl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.srCyrl,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sr-Cyrl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSrCyrl _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Српски (ћирилица)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralSrCyrl general = _TranslationsGeneralSrCyrl._(_root);
  @override
  late final _TranslationsReceiveTabSrCyrl receiveTab = _TranslationsReceiveTabSrCyrl._(_root);
  @override
  late final _TranslationsSendTabSrCyrl sendTab = _TranslationsSendTabSrCyrl._(_root);
  @override
  late final _TranslationsSettingsTabSrCyrl settingsTab = _TranslationsSettingsTabSrCyrl._(_root);
  @override
  late final _TranslationsTroubleshootPageSrCyrl troubleshootPage = _TranslationsTroubleshootPageSrCyrl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageSrCyrl receiveHistoryPage = _TranslationsReceiveHistoryPageSrCyrl._(_root);
  @override
  late final _TranslationsApkPickerPageSrCyrl apkPickerPage = _TranslationsApkPickerPageSrCyrl._(_root);
  @override
  late final _TranslationsSelectedFilesPageSrCyrl selectedFilesPage = _TranslationsSelectedFilesPageSrCyrl._(_root);
  @override
  late final _TranslationsReceivePageSrCyrl receivePage = _TranslationsReceivePageSrCyrl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageSrCyrl receiveOptionsPage = _TranslationsReceiveOptionsPageSrCyrl._(_root);
  @override
  late final _TranslationsSendPageSrCyrl sendPage = _TranslationsSendPageSrCyrl._(_root);
  @override
  late final _TranslationsProgressPageSrCyrl progressPage = _TranslationsProgressPageSrCyrl._(_root);
  @override
  late final _TranslationsWebSharePageSrCyrl webSharePage = _TranslationsWebSharePageSrCyrl._(_root);
  @override
  late final _TranslationsAboutPageSrCyrl aboutPage = _TranslationsAboutPageSrCyrl._(_root);
  @override
  late final _TranslationsDonationPageSrCyrl donationPage = _TranslationsDonationPageSrCyrl._(_root);
  @override
  late final _TranslationsChangelogPageSrCyrl changelogPage = _TranslationsChangelogPageSrCyrl._(_root);
  @override
  late final _TranslationsAliasGeneratorSrCyrl aliasGenerator = _TranslationsAliasGeneratorSrCyrl._(_root);
  @override
  late final _TranslationsDialogsSrCyrl dialogs = _TranslationsDialogsSrCyrl._(_root);
  @override
  late final _TranslationsSanitizationSrCyrl sanitization = _TranslationsSanitizationSrCyrl._(_root);
  @override
  late final _TranslationsTraySrCyrl tray = _TranslationsTraySrCyrl._(_root);
  @override
  late final _TranslationsWebSrCyrl web = _TranslationsWebSrCyrl._(_root);
  @override
  late final _TranslationsAssetPickerSrCyrl assetPicker = _TranslationsAssetPickerSrCyrl._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageSrCyrl networkInterfacesPage = _TranslationsNetworkInterfacesPageSrCyrl._(_root);
}

// Path: general
class _TranslationsGeneralSrCyrl extends TranslationsGeneralEn {
  _TranslationsGeneralSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Прихвати';
  @override
  String get accepted => 'Прихваћено';
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
  String get continueStr => 'Настави';
  @override
  String get copy => 'Копирај';
  @override
  String get copiedToClipboard => 'Копирано у привремену меморију';
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
  String get files => 'Фајлови';
  @override
  String get finished => 'Завршено';
  @override
  String get hide => 'Сакриј';
  @override
  String get off => 'Искључено';
  @override
  String get offline => 'Офлајн';
  @override
  String get on => 'Укључено';
  @override
  String get online => 'Онлајн';
  @override
  String get open => 'Отвори';
  @override
  String get queue => 'Редослед';
  @override
  String get quickSave => 'Брзо чување';
  @override
  String get quickSaveFromFavorites => 'Брзо чување у „Омиљено“';
  @override
  String get renamed => 'Преименовано';
  @override
  String get reset => 'Поништи промене';
  @override
  String get restart => 'Рестартуј';
  @override
  String get settings => 'Подешавања';
  @override
  String get skipped => 'Прескочено';
  @override
  String get start => 'Покрени';
  @override
  String get stop => 'Заустави';
  @override
  String get save => 'Сачувај';
  @override
  String get unchanged => 'Непромењено';
  @override
  String get unknown => 'Непознато';
  @override
  String get noItemInClipboard => 'Нема предмета у привременој меморији.';
}

// Path: receiveTab
class _TranslationsReceiveTabSrCyrl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Примање';
  @override
  late final _TranslationsReceiveTabInfoBoxSrCyrl infoBox = _TranslationsReceiveTabInfoBoxSrCyrl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveSrCyrl quickSave = _TranslationsReceiveTabQuickSaveSrCyrl._(_root);
}

// Path: sendTab
class _TranslationsSendTabSrCyrl extends TranslationsSendTabEn {
  _TranslationsSendTabSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  late final _TranslationsSendTabSelectionSrCyrl selection = _TranslationsSendTabSelectionSrCyrl._(_root);
  @override
  late final _TranslationsSendTabPickerSrCyrl picker = _TranslationsSendTabPickerSrCyrl._(_root);
  @override
  String get shareIntentInfo => 'Такође, можете да користите функцију „Дели“ на свом мобилном уређају да бисте лакше бирали фајлове.';
  @override
  String get nearbyDevices => 'Уређаји у близини';
  @override
  String get thisDevice => 'Овај уређај';
  @override
  String get scan => 'Претрага уређаја';
  @override
  String get manualSending => 'Ручно слање';
  @override
  String get sendMode => 'Режим слања';
  @override
  late final _TranslationsSendTabSendModesSrCyrl sendModes = _TranslationsSendTabSendModesSrCyrl._(_root);
  @override
  String get sendModeHelp => 'Објашњење';
  @override
  String get help => 'Уверите се да је прималац такође на истој Wi-Fi мрежи.';
  @override
  String get placeItems => 'Поставите предмете за дељење.';
}

// Path: settingsTab
class _TranslationsSettingsTabSrCyrl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Подешавања';
  @override
  late final _TranslationsSettingsTabGeneralSrCyrl general = _TranslationsSettingsTabGeneralSrCyrl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveSrCyrl receive = _TranslationsSettingsTabReceiveSrCyrl._(_root);
  @override
  late final _TranslationsSettingsTabSendSrCyrl send = _TranslationsSettingsTabSendSrCyrl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkSrCyrl network = _TranslationsSettingsTabNetworkSrCyrl._(_root);
  @override
  late final _TranslationsSettingsTabOtherSrCyrl other = _TranslationsSettingsTabOtherSrCyrl._(_root);
  @override
  String get advancedSettings => 'Напредна подешавања';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageSrCyrl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отклањање грешака';
  @override
  String get subTitle => 'Да ли апликација ради како треба? Овде можете пронаћи нека уобичајена решења проблема.';
  @override
  String get solution => 'Решење:';
  @override
  String get fixButton => 'Поправи аутоматски';
  @override
  late final _TranslationsTroubleshootPageFirewallSrCyrl firewall = _TranslationsTroubleshootPageFirewallSrCyrl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoverySrCyrl noDiscovery = _TranslationsTroubleshootPageNoDiscoverySrCyrl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionSrCyrl noConnection = _TranslationsTroubleshootPageNoConnectionSrCyrl._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageSrCyrl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Историја';
  @override
  String get openFolder => 'Отвори фолдер';
  @override
  String get deleteHistory => 'Избриши историју';
  @override
  String get empty => 'Историја је празна.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsSrCyrl entryActions = _TranslationsReceiveHistoryPageEntryActionsSrCyrl._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSrCyrl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Апликације (APK)';
  @override
  String get excludeSystemApps => 'Изузми системске апликације';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Изузми апликације које се не покрећу';
  @override
  String apps({required Object n}) => '${n} апликација';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageSrCyrl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Избриши све';
}

// Path: receivePage
class _TranslationsReceivePageSrCyrl extends TranslationsReceivePageEn {
  _TranslationsReceivePageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n, one: 'жели да вам пошаље фајл', other: 'жели да вам пошаље ${n} фајлова');
  @override
  String get subTitleMessage => 'послао вам је поруку:';
  @override
  String get subTitleLink => 'послао вам је линк:';
  @override
  String get canceled => 'Пошиљалац је отказао захтев.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSrCyrl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опције';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend фолдер)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Аутоматски искључено јер постоје фолдери.';
}

// Path: sendPage
class _TranslationsSendPageSrCyrl extends TranslationsSendPageEn {
  _TranslationsSendPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Чекање одговора…';
  @override
  String get rejected => 'Прималац је одбио захтев.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Прималац је заузет другим захтевом.';
}

// Path: progressPage
class _TranslationsProgressPageSrCyrl extends TranslationsProgressPageEn {
  _TranslationsProgressPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Слање фајлова';
  @override
  String get titleReceiving => 'Примање фајлова';
  @override
  String get savedToGallery => 'Сачувано у галерији';
  @override
  late final _TranslationsProgressPageTotalSrCyrl total = _TranslationsProgressPageTotalSrCyrl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSrCyrl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дељење путем линка';
  @override
  String get loading => 'Покретање сервера…';
  @override
  String get stopping => 'Заустављање сервера…';
  @override
  String get error => 'Дошло је до грешке приликом покретања сервера.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
    n,
    one: 'Отворите овај линк у вашем прегледачу:',
    other: 'Отворите један од ових линкова у вашем прегледачу:',
  );
  @override
  String get requests => 'Захтеви';
  @override
  String get noRequests => 'Још увек нема захтева.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Аутоматски прихвати захтеве';
  @override
  String get requirePin => 'Захтевај PIN';
  @override
  String pinHint({required Object pin}) => 'PIN је ${pin}“„';
  @override
  String get encryptionHint => 'LocalSend користи самопотписани сертификат. Морате га прихватити у свом прегледачу.';
  @override
  String pendingRequests({required Object n}) => 'Захтеви на чекању: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageSrCyrl extends TranslationsAboutPageEn {
  _TranslationsAboutPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'О LocalSend-у';
  @override
  List<String> get description => [
    'LocalSend је бесплатна апликација отвореног кода која вам омогућава да безбедно делите фајлове и поруке са уређајима у близини преко ваше локалне мреже, без потребе за интернет везом.',
    'Ова апликације је доступна за Android, iOS, macOS, Windows i Linux. Можете пронаћи све опције за преузимање на званичној почетној страници.',
  ];
  @override
  String get author => 'Аутор';
  @override
  String get contributors => 'Сарадници';
  @override
  String get packagers => 'Пакери';
  @override
  String get translators => 'Преводиоци';
}

// Path: donationPage
class _TranslationsDonationPageSrCyrl extends TranslationsDonationPageEn {
  _TranslationsDonationPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Донација';
  @override
  String get info => 'LocalSend је бесплатан, отвореног кода и без икаквих огласа. Ако вам се свиђа апликација, можете подржати развој донацијом.';
  @override
  String donate({required Object amount}) => 'Донирај ${amount}';
  @override
  String get thanks => 'Хвала вам пуно!';
  @override
  String get restore => 'Врати куповину';
}

// Path: changelogPage
class _TranslationsChangelogPageSrCyrl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Евиденција промена';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSrCyrl extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Неодољива',
    'Прелепа',
    'Велика',
    'Бистра',
    'Чиста',
    'Паметна',
    'Хладњикава',
    'Слатка',
    'Лукава',
    'Одлучна',
    'Енергетска',
    'Ефикасна',
    'Фантастична',
    'Брза',
    'Фина',
    'Свежа',
    'Добра',
    'Дивна',
    'Велика',
    'Згодна',
    'Врућа',
    'Нежна',
    'Љубазна',
    'Мистична',
    'Уредна',
    'Лепа',
    'Стрпљива',
    'Прелепа',
    'Моћна',
    'Богата',
    'Тајновита',
    'Паметна',
    'Чврста',
    'Специјална',
    'Буђава',
    'Јака',
    'Уредна',
    'Мудра',
  ];
  @override
  List<String> get fruits => [
    'Јабука',
    'Шљива',
    'Банана',
    'Боровница',
    'Рибизла',
    'Кајсија',
    'Шаргарепа',
    'Трешња',
    'Паприка',
    'Папричица',
    'Кромпируша',
    'Купусара',
    'Ротквица',
    'Лубеница',
    'Печурка',
    'Мандарина',
    'Поморанџа',
    'Папаја',
    'Бресква',
    'Крушка',
    'Шишарка',
    'Диња',
    'Бундева',
    'Вишња',
    'Јагода',
    'Дуња',
  ];

  /// In some languages, the adjective must be last. Not the case in Serbian, but serbian adjectives must have endings which depend on the gender of the noun. That's why we put all the Fruits with the female form and corresponding adjective endings in female form for this translation.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsSrCyrl extends TranslationsDialogsEn {
  _TranslationsDialogsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileSrCyrl addFile = _TranslationsDialogsAddFileSrCyrl._(_root);
  @override
  late final _TranslationsDialogsOpenFileSrCyrl openFile = _TranslationsDialogsOpenFileSrCyrl._(_root);
  @override
  late final _TranslationsDialogsAddressInputSrCyrl addressInput = _TranslationsDialogsAddressInputSrCyrl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionSrCyrl cancelSession = _TranslationsDialogsCancelSessionSrCyrl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileSrCyrl cannotOpenFile = _TranslationsDialogsCannotOpenFileSrCyrl._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeSrCyrl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeSrCyrl._(
    _root,
  );
  @override
  late final _TranslationsDialogsErrorDialogSrCyrl errorDialog = _TranslationsDialogsErrorDialogSrCyrl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogSrCyrl favoriteDialog = _TranslationsDialogsFavoriteDialogSrCyrl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogSrCyrl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogSrCyrl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogSrCyrl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogSrCyrl._(_root);
  @override
  late final _TranslationsDialogsFileInfoSrCyrl fileInfo = _TranslationsDialogsFileInfoSrCyrl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputSrCyrl fileNameInput = _TranslationsDialogsFileNameInputSrCyrl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogSrCyrl historyClearDialog = _TranslationsDialogsHistoryClearDialogSrCyrl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl._(
    _root,
  );
  @override
  late final _TranslationsDialogsMessageInputSrCyrl messageInput = _TranslationsDialogsMessageInputSrCyrl._(_root);
  @override
  late final _TranslationsDialogsNoFilesSrCyrl noFiles = _TranslationsDialogsNoFilesSrCyrl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionSrCyrl noPermission = _TranslationsDialogsNoPermissionSrCyrl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformSrCyrl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformSrCyrl._(_root);
  @override
  late final _TranslationsDialogsQrSrCyrl qr = _TranslationsDialogsQrSrCyrl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsSrCyrl quickActions = _TranslationsDialogsQuickActionsSrCyrl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeSrCyrl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeSrCyrl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl._(_root);
  @override
  late final _TranslationsDialogsPinSrCyrl pin = _TranslationsDialogsPinSrCyrl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSrCyrl sendModeHelp = _TranslationsDialogsSendModeHelpSrCyrl._(_root);
  @override
  late final _TranslationsDialogsZoomSrCyrl zoom = _TranslationsDialogsZoomSrCyrl._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSrCyrl extends TranslationsSanitizationEn {
  _TranslationsSanitizationSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Назив фајла не може бити празан';
  @override
  String get invalid => 'Назив фајла садржи неважеће знакове';
}

// Path: tray
class _TranslationsTraySrCyrl extends TranslationsTrayEn {
  _TranslationsTraySrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Напусти LocalSend';
  @override
  String get closeWindows => 'Изађи';
}

// Path: web
class _TranslationsWebSrCyrl extends TranslationsWebEn {
  _TranslationsWebSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Унесите PIN';
  @override
  String get invalidPin => 'Неисправан PIN';
  @override
  String get tooManyAttempts => 'Превише покушаја';
  @override
  String get rejected => 'Одбијено';
  @override
  String get files => 'Фајлови';
  @override
  String get fileName => 'Назив фајла';
  @override
  String get size => 'Величина';
}

// Path: assetPicker
class _TranslationsAssetPickerSrCyrl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

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
  String get loadFailed => 'Учитавање неуспешно';
  @override
  String get original => 'Порекло';
  @override
  String get preview => 'Преглед';
  @override
  String get select => 'Изабери';
  @override
  String get emptyList => 'Очисти листу';
  @override
  String get unSupportedAssetType => 'Неподржан тип фајла.';
  @override
  String get unableToAccessAll => 'Није могуће приступити свим фајловима на уређају';
  @override
  String get viewingLimitedAssetsTip => 'Само фајлови за гледање и албуми доступни апликацији.';
  @override
  String get changeAccessibleLimitedAssets => 'Додирните да ажурирате доступне фајлове';
  @override
  String get accessAllTip =>
      'Апликација може да приступи само неким фајловима на уређају. Идите у системска подешавања и дозволите апликацији приступ свим медијима на уређају.';
  @override
  String get goToSystemSettings => 'Иди у системска подешавања';
  @override
  String get accessLimitedAssets => 'Настави са ограниченим приступом';
  @override
  String get accessiblePathName => 'Доступни фајлови';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Слика';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Остали медији';
  @override
  String get sActionPlayHint => 'пусти';
  @override
  String get sActionPreviewHint => 'преглед';
  @override
  String get sActionSelectHint => 'изабери';
  @override
  String get sActionSwitchPathLabel => 'промени путању';
  @override
  String get sActionUseCameraHint => 'користи камеру';
  @override
  String get sNameDurationLabel => 'трајање';
  @override
  String get sUnitAssetCountLabel => 'број';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageSrCyrl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежни интерфејси';
  @override
  String get preview => 'Преглед';
  @override
  String get whitelist => 'Бела листа';
  @override
  String get blacklist => 'Црна листа';
  @override
  String get info =>
      'Подразумевано, LocalSend користи све доступне мрежне интерфејсе. Овде можете изузети нежељене мреже. Морате рестартовати сервер да би се примениле промене.';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxSrCyrl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Назив уређаја:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveSrCyrl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Омиљено';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionSrCyrl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избор';
  @override
  String files({required Object files}) => 'Фајлови: ${files}';
  @override
  String size({required Object size}) => 'Величина: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerSrCyrl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Фајл';
  @override
  String get folder => 'Фолдер';
  @override
  String get media => 'Медији';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Aпликација';
  @override
  String get clipboard => 'Налепи';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesSrCyrl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Један прималац';
  @override
  String get multiple => 'Више прималаца';
  @override
  String get link => 'Дељење путем линка';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralSrCyrl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опште';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl._(
    _root,
  );
  @override
  String get color => 'Боја';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSrCyrl colorOptions = _TranslationsSettingsTabGeneralColorOptionsSrCyrl._(_root);
  @override
  String get language => 'Језик';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl._(_root);
  @override
  String get saveWindowPlacement => 'Сачувај положај прозора након напуштања';
  @override
  String get saveWindowPlacementWindows => 'Сачувај положај прозора након излажења';
  @override
  String get minimizeToTray => 'Минимизирај на системску траку/траку менија приликом затварања';
  @override
  String get launchAtStartup => 'Аутоматски покрени након пријаве';
  @override
  String get launchMinimized => 'Аутоматско покретање: Покретање скривено';
  @override
  String get showInContextMenu => 'Прикажи LocalSend у контекстуалном менију';
  @override
  String get animations => 'Анимације';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveSrCyrl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

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
  String get autoFinish => 'Аутоматски заврши';
  @override
  String get destination => 'Чување у фолдер';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Сачувај медије у галерију';
  @override
  String get saveToHistory => 'Сачувај у историји';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendSrCyrl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  String get shareViaLinkAutoAccept => 'Аутоматски прихвати захтеве у режиму „Дељење путем линка“';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSrCyrl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежа';
  @override
  String get needRestart => 'Рестартујте сервер да би се применила подешавања!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Назив уређаја';
  @override
  String get deviceType => 'Тип уређаја';
  @override
  String get deviceModel => 'Модел уређаја';
  @override
  String get port => 'Порт';
  @override
  String get discoveryTimeout => 'Откривање је истекло';
  @override
  String get useSystemName => 'Користи системски назив';
  @override
  String get generateRandomAlias => 'Генериши насумични псеудоним';
  @override
  String portWarning({required Object defaultPort}) =>
      'Други уређаји вас можда неће открити, јер користите прилагођени порт. (подразумевани: ${defaultPort})';
  @override
  String get encryption => 'Шифровање';
  @override
  String get multicastGroup => 'Адреса вишесмерног емитовања';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Други уређаји вас можда неће открити, јер користите прилагођену адресу вишесмерног емитовања. (подразумевана: ${defaultMulticast})';
  @override
  String get network => 'Мрежа';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsSrCyrl networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsSrCyrl._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSrCyrl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Остало';
  @override
  String get support => 'Подржите LocalSend';
  @override
  String get donate => 'Донирај';
  @override
  String get privacyPolicy => 'Политика приватности';
  @override
  String get termsOfUse => 'Услови коришћења';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallSrCyrl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овај уређај може слати фајлове другим уређајима; али други уређаји не могу слати фајлове овом уређају.';
  @override
  String solution({required Object port}) =>
      'Ово је највероватније проблем са заштитним зидом. Ово можете решити тако што ћете дозволити долазне везе (UDP и TCP) на порту ${port}.';
  @override
  String get openFirewallSettings => 'Отвори заштитни зид';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySrCyrl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овај уређај не може да открије друге уређаје.';
  @override
  String get solution =>
      'Уверите се да су сви уређаји на истој Wi-Fi мрежи и да имају исту конфигурацију (порт, адреса вишесмерног емитовања, шифровање). Можете покушати да ручно унесете IP адресу циљног уређаја. Ако то функционише, размислите о додавању тог уређаја у омиљене како би се могао аутоматски открити у будућности.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSrCyrl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Оба уређаја не могу да открију један другог нити могу да деле фајлове.';
  @override
  String get solution =>
      'Да ли проблем постоји на обе стране? Ако је тако, потребно је да се уверите да су оба уређаја на истој Wi-Fi мрежи и да имају исту конфигурацију (порт, адреса вишесмерног емитовања, шифровање). Wi-Fi мрежа можда неће дозволити комуникацију између учесника због изолације приступне тачке (AP). У овом случају, ова опција мора бити онемогућена на рутеру.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSrCyrl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Отвори фајл';
  @override
  String get showInFolder => 'Прикажи у фолдеру';
  @override
  String get info => 'Информације';
  @override
  String get deleteFromHistory => 'Избриши из историје';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalSrCyrl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleSrCyrl title = _TranslationsProgressPageTotalTitleSrCyrl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Фајлова: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Величина: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Брзина: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileSrCyrl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додајте у избор';
  @override
  String get content => 'Шта желите додати?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSrCyrl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори фајл';
  @override
  String get content => 'Желите ли да отворите примљени фајл?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSrCyrl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унесите адресу';
  @override
  String get hashtag => 'Хеш-ознака';
  @override
  String get ip => 'IP адреса';
  @override
  String get recentlyUsed => 'Недавно коришћено: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionSrCyrl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Откажите пренос фајлова';
  @override
  String get content => 'Желите ли заиста да откажете пренос фајлова?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSrCyrl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није могуће отворити фајл';
  @override
  String content({required Object file}) => 'Није могуће отворити „${file}“. Да ли је овај фајл премештен, преименован, или избрисан?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSrCyrl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифровање онемогућено';
  @override
  String get content =>
      'Комуникација се сада одвија преко нешифрованог HTTP протокола. Да бисте користили HTTPS протокол, поново омогућите шифровање.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSrCyrl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSrCyrl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Омиљено';
  @override
  String get noFavorites => 'Још увек нема омиљених уређаја.';
  @override
  String get addFavorite => 'Додај';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogSrCyrl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избриши из омиљених';
  @override
  String content({required Object name}) => 'Желите ли заиста да избришете „${name}“ из омиљених?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSrCyrl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Додајте у омиљене';
  @override
  String get titleEdit => 'Подешавања';
  @override
  String get name => 'Назив уређаја';
  @override
  String get auto => '(аутоматски)';
  @override
  String get ip => 'IP адреса';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoSrCyrl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Информације о фајлу';
  @override
  String get fileName => 'Назив фајла:';
  @override
  String get path => 'Путања:';
  @override
  String get size => 'Величина:';
  @override
  String get sender => 'Пошиљалац:';
  @override
  String get time => 'Време:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputSrCyrl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унесите назив фајла';
  @override
  String original({required Object original}) => 'Оригинални назив фајла: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSrCyrl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистите историју';
  @override
  String get content => 'Желите ли заиста да очистите читаву историју?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend не може да пронађе друге уређаје без дозволе за скенирање локалне мреже. Дајте ову дозволу у подешавањима.';
  @override
  String get gotoSettings => 'Подешавања';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputSrCyrl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Напишите поруку';
  @override
  String get multiline => 'Више редова';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSrCyrl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није изабран ниједан фајл';
  @override
  String get content => 'Изаберите бар један фајл.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSrCyrl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нема дозволе';
  @override
  String get content => 'Нисте дали неопходне дозволе. Дајте их у подешавањима.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSrCyrl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није доступно';
  @override
  String get content => 'Ова функција је доступна само на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSrCyrl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR кôд';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSrCyrl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Брзе радње';
  @override
  String get counter => 'Бројач';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Допуна нулама';
  @override
  String get sortBeforeCount => 'Сортирај унапред по абецеди (A-Z)';
  @override
  String get random => 'Насумично';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeSrCyrl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Захтеви за фајлове се сада аутоматски прихватају. Имајте на уму да сви на локалној мрежи могу да вам шаљу фајлове.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Захтеви за фајлове се сада аутоматски прихватају са уређаја који су на вашој листи омиљених.',
    'Упозорење! Тренутно, ово није потпуно безбедно, јер хакер који има отисак прста било ког уређаја са ваше листе омиљених може да вам шаље фајлове без ограничења.',
    'Ипак, ова опција је и даље безбеднија од допуштања свим корисницима на локалној мрежи да вам шаљу фајлове без ограничења.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinSrCyrl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унесите PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSrCyrl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Режими слања';
  @override
  String get single => 'Слање фајлова једном примаоцу. Избор ће бити очишћен након завршеног преноса фајлова.';
  @override
  String get multiple => 'Слање фајлове више прималаца. Избор неће бити очишћен након завршеног преноса фајлова.';
  @override
  String get link => 'Примаоци који немају инсталиран LocalSend могу преузети изабране фајлове отварањем линка у свом прегледачу.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomSrCyrl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системска';
  @override
  String get dark => 'Тамна';
  @override
  String get light => 'Светла';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsSrCyrl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системска';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системски';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsSrCyrl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Све';
  @override
  String get filtered => 'Филтрирана';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSrCyrl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSrCyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Укупан напредак (${time})';
  @override
  String get finishedError => 'Завршено са грешком';
  @override
  String get canceledSender => 'Пошиљалац је отказао';
  @override
  String get canceledReceiver => 'Прималац је отказао';
}
