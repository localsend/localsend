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
  String get locale => 'Српски';
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
}

// Path: general
class _TranslationsGeneralSrCyrl extends TranslationsGeneralEn {
  _TranslationsGeneralSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  String get cancel => 'Одустани';
  @override
  String get close => 'Затвори';
  @override
  String get confirm => 'Потврди';
  @override
  String get continueStr => 'Настави';
  @override
  String get copy => 'Копирај';
  @override
  String get copiedToClipboard => 'Копирано у Clipboard';
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
  String get offline => 'Ван мреже';
  @override
  String get on => 'Укључено';
  @override
  String get online => 'На мрежи';
  @override
  String get open => 'Отвори';
  @override
  String get queue => 'Стави у Queue';
  @override
  String get quickSave => 'Брзо сними';
  @override
  String get quickSaveFromFavorites => 'Брзо сними у "Омиљени"';
  @override
  String get renamed => 'Преименовано';
  @override
  String get reset => 'Ресетуј';
  @override
  String get restart => 'Рестартуј';
  @override
  String get settings => 'Подешавања';
  @override
  String get skipped => 'Пропуштено';
  @override
  String get start => 'Покрени';
  @override
  String get stop => 'Заустави';
  @override
  String get save => 'Сними';
  @override
  String get unchanged => 'Непромењено';
  @override
  String get unknown => 'Непознато';
  @override
  String get noItemInClipboard => 'Нема ставки у Clipboard-у';
}

// Path: receiveTab
class _TranslationsReceiveTabSrCyrl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSendTabSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  late final _TranslationsSendTabSelectionSrCyrl selection = _TranslationsSendTabSelectionSrCyrl._(_root);
  @override
  late final _TranslationsSendTabPickerSrCyrl picker = _TranslationsSendTabPickerSrCyrl._(_root);
  @override
  String get shareIntentInfo => 'Можеш такође да користиш и "Share" опцију твог мобилног уређаја да би лакше селектовао фајлове.';
  @override
  String get nearbyDevices => 'Уређаји у близини';
  @override
  String get thisDevice => 'Овај уређај';
  @override
  String get scan => 'Потражи уређаје';
  @override
  String get manualSending => 'Мануелно слање';
  @override
  String get sendMode => 'Мод за слање';
  @override
  late final _TranslationsSendTabSendModesSrCyrl sendModes = _TranslationsSendTabSendModesSrCyrl._(_root);
  @override
  String get sendModeHelp => 'Објашњење';
  @override
  String get help => 'Молим уверите се да је жељена дестинација такође на истој WiFi мрежи.';
  @override
  String get placeItems => 'Постави шта желиш да share-ујеш.';
}

// Path: settingsTab
class _TranslationsSettingsTabSrCyrl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Подешавање';
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
  _TranslationsTroubleshootPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Troubleshoot';
  @override
  String get subTitle => 'Да ли апликација ради како треба? Овде можете пронаћи нека уобичајена решења.';
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
  _TranslationsReceiveHistoryPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Историја';
  @override
  String get openFolder => 'Отвори фолдер';
  @override
  String get deleteHistory => 'Обриши Историју';
  @override
  String get empty => 'Историја је празна.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsSrCyrl entryActions = _TranslationsReceiveHistoryPageEntryActionsSrCyrl._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSrCyrl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Апликације (APK)';
  @override
  String get excludeSystemApps => 'Изостави системске апликације';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Изостави апликације које се не покрећу';
  @override
  String apps({required Object n}) => '${n} Апликације';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageSrCyrl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Обриши све';
}

// Path: receivePage
class _TranslationsReceivePageSrCyrl extends TranslationsReceivePageEn {
  _TranslationsReceivePageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
        n,
        one: 'жели да пошаље фајл',
        other: 'жели да пошаље ${n} фајлова',
      );
  @override
  String get subTitleMessage => 'је послао поруку:';
  @override
  String get subTitleLink => 'је послао Линк:';
  @override
  String get canceled => 'Пошиљалац је поништио захтев.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSrCyrl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опције';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Искључено аутоматски зато што постоје фолдери.';
}

// Path: sendPage
class _TranslationsSendPageSrCyrl extends TranslationsSendPageEn {
  _TranslationsSendPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Чекам одговор...';
  @override
  String get rejected => 'Прималац је одбио захтев.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Прималац је заузет неким другим захтевом за слање.';
}

// Path: progressPage
class _TranslationsProgressPageSrCyrl extends TranslationsProgressPageEn {
  _TranslationsProgressPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Слање фајлова';
  @override
  String get titleReceiving => 'Примање фајлова';
  @override
  String get savedToGallery => 'Снимљено у Галерију';
  @override
  late final _TranslationsProgressPageTotalSrCyrl total = _TranslationsProgressPageTotalSrCyrl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSrCyrl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дели помоћу Линка';
  @override
  String get loading => 'Покрећем сервер...';
  @override
  String get stopping => 'Заустављам сервер...';
  @override
  String get error => 'Приликом покретања сервера догодила се грешка.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
        n,
        one: 'Отвори овај линк у browseru:',
        other: 'Отвори један од ових линкова у browseru:',
      );
  @override
  String get requests => 'Захтеви';
  @override
  String get noRequests => 'Нема захтева још увек.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Аутоматски прихвати захтеве';
  @override
  String get requirePin => 'Потребан PIN';
  @override
  String pinHint({required Object pin}) => 'PIN је "${pin}"';
  @override
  String get encryptionHint => 'LocalSend користи сертификате који су self-signed. Морате да прихватите то у browseru.';
  @override
  String pendingRequests({required Object n}) => 'Захтеви на чекању: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageSrCyrl extends TranslationsAboutPageEn {
  _TranslationsAboutPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'О LocalSend-у';
  @override
  List<String> get description => [
        'LocalSend је бесплатна (слободна) апликација отвореног кода, која Вам омогућава да делите фајлове и поруке са оближњим уређајима сигурно, преко локалне мреже, без потребе за интернет конекцијом.',
        'Ова апликације је доступна за Android, iOS, macOS, Windows i Linux. Можете пронаћи све опције за преузимање на официјелној интернет страници.',
      ];
  @override
  String get author => 'Аутор';
  @override
  String get contributors => 'Сарадници';
  @override
  String get packagers => 'Пакети';
  @override
  String get translators => 'Преводиоци';
}

// Path: donationPage
class _TranslationsDonationPageSrCyrl extends TranslationsDonationPageEn {
  _TranslationsDonationPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Донирај';
  @override
  String get info => 'LocalSend је слободна, апликација отвореног кода без реклама. Ако Вам се допада, можете подржати развој путем донације.';
  @override
  String donate({required Object amount}) => 'Донирај ${amount}';
  @override
  String get thanks => 'Хвала Вам!';
  @override
  String get restore => 'Обнови куповину';
}

// Path: changelogPage
class _TranslationsChangelogPageSrCyrl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Log промена';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSrCyrl extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  late final _TranslationsDialogsEncryptionDisabledNoticeSrCyrl encryptionDisabledNotice =
      _TranslationsDialogsEncryptionDisabledNoticeSrCyrl._(_root);
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
  late final _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl localNetworkUnauthorized =
      _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl._(_root);
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
  _TranslationsSanitizationSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Име фајла не може бити празно';
  @override
  String get invalid => 'Име фајла садржи недозвољене карактере';
}

// Path: tray
class _TranslationsTraySrCyrl extends TranslationsTrayEn {
  _TranslationsTraySrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Quit LocalSend';
  @override
  String get closeWindows => 'Изађи';
}

// Path: web
class _TranslationsWebSrCyrl extends TranslationsWebEn {
  _TranslationsWebSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Унеси PIN';
  @override
  String get invalidPin => 'Неисправан PIN';
  @override
  String get tooManyAttempts => 'Превише покушаја';
  @override
  String get rejected => 'Одбијено';
  @override
  String get files => 'Фајлови';
  @override
  String get fileName => 'Име фајла';
  @override
  String get size => 'Величина';
}

// Path: assetPicker
class _TranslationsAssetPickerSrCyrl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Потврди';
  @override
  String get cancel => 'Одустани';
  @override
  String get edit => 'Измени';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Учитавање неуспешно';
  @override
  String get original => 'Порекло';
  @override
  String get preview => 'Погледај';
  @override
  String get select => 'Изабери';
  @override
  String get emptyList => 'Испразни листу';
  @override
  String get unSupportedAssetType => 'Тип фајла није подржан.';
  @override
  String get unableToAccessAll => 'Немогуће приступити свим фајловима на овом уређају';
  @override
  String get viewingLimitedAssetsTip => 'Само view фајлови и албуми доступни апликацији.';
  @override
  String get changeAccessibleLimitedAssets => 'Кликни да упдејтујеш доступне фајлове';
  @override
  String get accessAllTip =>
      'Апликација може да приступи само неким фајловима на уређају. Иди у Системска Подешавања и дозволи апликацији приступ свим медијским фајловима на уређају.';
  @override
  String get goToSystemSettings => 'Иди у Системска подешавања';
  @override
  String get accessLimitedAssets => 'Настави са ограниченим приступом';
  @override
  String get accessiblePathName => 'Доступни фајлови';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Слике';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Друга врста медија';
  @override
  String get sActionPlayHint => 'play';
  @override
  String get sActionPreviewHint => 'preview';
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

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxSrCyrl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Име уређаја:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveSrCyrl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Омиљени';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionSrCyrl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Селекција';
  @override
  String files({required Object files}) => 'Фајлови: ${files}';
  @override
  String size({required Object size}) => 'Величина: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerSrCyrl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  String get app => 'App';
  @override
  String get clipboard => 'Налепи';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesSrCyrl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Један прималац';
  @override
  String get multiple => 'Више прималаца';
  @override
  String get link => 'Дели помоћу Линка';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralSrCyrl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Уопштено';
  @override
  String get brightness => 'Тема';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl brightnessOptions =
      _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl._(_root);
  @override
  String get color => 'Боја';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSrCyrl colorOptions = _TranslationsSettingsTabGeneralColorOptionsSrCyrl._(_root);
  @override
  String get language => 'Језик';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl._(_root);
  @override
  String get saveWindowPlacement => 'Изађи: Сними положај прозора';
  @override
  String get saveWindowPlacementWindows => 'Сними позицију прозора након изласка из апликације';
  @override
  String get minimizeToTray => 'Изађи: Минимизуј у Tray/MenuBar';
  @override
  String get launchAtStartup => 'Аутостартуј после login-а';
  @override
  String get launchMinimized => 'Аутостартуј: Старт сакривен';
  @override
  String get showInContextMenu => 'Прикажи LocalSend у контекст менију';
  @override
  String get animations => 'Анимације';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveSrCyrl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  String get destination => 'Дестинација';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Сними медиа фајлове у Галерију';
  @override
  String get saveToHistory => 'Сними у Историју';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendSrCyrl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  String get shareViaLinkAutoAccept => 'Подели преко Линка: Аутоматски прихвати';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSrCyrl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мрежа';
  @override
  String get needRestart => 'Рестартуј сервер да би Подешавања била примењена!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Име уређаја';
  @override
  String get deviceType => 'Тип уређаја';
  @override
  String get deviceModel => 'Модел уређаја';
  @override
  String get port => 'Порт';
  @override
  String get discoveryTimeout => 'Откривање отказано';
  @override
  String get useSystemName => 'Користи име система';
  @override
  String get generateRandomAlias => 'Генериши случајни псеудоним';
  @override
  String portWarning({required Object defaultPort}) =>
      'Можда нећете бити пронађени од стране других уређаја јер користите неки други Порт. (default: ${defaultPort})';
  @override
  String get encryption => 'Енкрипција';
  @override
  String get multicastGroup => 'Мултикаст';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Можда нећете бити пронађени од стране других уређаја јер користите неку другу Мултикаст адресу. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSrCyrl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Друго';
  @override
  String get support => 'Подржи LocalSend';
  @override
  String get donate => 'Донирај';
  @override
  String get privacyPolicy => 'Политика приватности';
  @override
  String get termsOfUse => 'Услови коришћења';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallSrCyrl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ова апликација може послати фајлове другим уређајима; али други уређаји не могу послати фајлове овом уређају.';
  @override
  String solution({required Object port}) =>
      'Ово је највероватније Firewall проблем. Možete решити ово омогућавањем долазних конекција (UDP and TCP) на Порту ${port}.';
  @override
  String get openFirewall => 'Отвори Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySrCyrl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овај уређај не може да пронађе друге уређаје.';
  @override
  String get solution =>
      'Уверите се да су сви уређаји на истој Wi-Fi мрежи и да деле исту конфигурацију (порт, мултикаст адресу, енкрипцију). Можете да покушате да упишете IP адресу уређаја мануелно. Ако то ради, размислите о додавању те адресе у Омиљене, тако да уређај може да буде аутоматски пронађен у будућности.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSrCyrl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Уређаји не могу ни да пронађу један другог ни да поделе фајлове.';
  @override
  String get solution =>
      'Да ли проблем постоји на обе стране? Ако је тако, морате да се уверите да се оба уређаја налазе на истој Wi-Fi мрежи и да деле исту конфигурацију (порт, мултикаст адреса, енкрипција). Мрежа можда не дозвољава комуникацију међу уређајима. У овом случају, ова опција мора бити омогућена на рутеру.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSrCyrl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Отвори фајл';
  @override
  String get showInFolder => 'Прикажи у фолдеру';
  @override
  String get info => 'Информације';
  @override
  String get deleteFromHistory => 'Обриши из Историје.';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalSrCyrl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsAddFileSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додај у селекцију';
  @override
  String get content => 'Шта желиш да додаш?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSrCyrl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори фајл';
  @override
  String get content => 'Да ли желите да отворите примљени фајл?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSrCyrl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Упиши адресу';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP адреса';
  @override
  String get recentlyUsed => 'Недавно коришћено: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionSrCyrl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Одустани од пребацивања фајла';
  @override
  String get content => 'Да ли стварно желиш да одустанеш од слања фајла?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSrCyrl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не могу да отворим фајл';
  @override
  String content({required Object file}) => 'Не могу да отворим "${file}". Да ли је овај фајл негде померен, преименован, или обрисан?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSrCyrl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Енкрипција онемогућена';
  @override
  String get content => 'Комуникација се сада врши преко не-енкриптованог HTTP протокола. Да би користио HTTPS, омогући Енкрипцију опет.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSrCyrl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSrCyrl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Омиљени';
  @override
  String get noFavorites => 'Нема омиљених уређаја још увек.';
  @override
  String get addFavorite => 'Додај';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogSrCyrl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избриши из Омиљених';
  @override
  String content({required Object name}) => 'Да ли стварно желиш да избришеш из Омиљених "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSrCyrl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Додај у Омиљене';
  @override
  String get titleEdit => 'Подешавања';
  @override
  String get name => 'Име уређаја';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP адреса';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoSrCyrl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Информације о фајлу';
  @override
  String get fileName => 'Име фајла:';
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
  _TranslationsDialogsFileNameInputSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Убаци име фајла';
  @override
  String original({required Object original}) => 'Оригинал: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSrCyrl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очисти Историју';
  @override
  String get content => 'Да ли стварно желиш да избришеш целу Историју?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend не може да нађе друге уређаје без дозволе да скенира локалну мрежу. Молим додајте ову дозволу у Подешавања.';
  @override
  String get gotoSettings => 'Подешавања';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputSrCyrl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Упиши поруку';
  @override
  String get multiline => 'Више линија';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSrCyrl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ниједан фајл није изабран';
  @override
  String get content => 'Молим изаберите бар један фајл.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSrCyrl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нема дозволе';
  @override
  String get content => 'Нисте додали неопходне дозволе. Молим додајте их у Подешавања.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSrCyrl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није доступно';
  @override
  String get content => 'Ова опција је доступна само на:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSrCyrl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSrCyrl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Брзе акције';
  @override
  String get counter => 'Мерач';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Без padding-a';
  @override
  String get sortBeforeCount => 'Сортирај по абецеди претходно';
  @override
  String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeSrCyrl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Захтеви за слање фајлова су аутоматски прихваћени. Примите к знању да било ко на локалној мрежи може да Вам пошаље фајл.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
        'Захтеви за примање фајлова су аутоматски прихваћени од уређаја у листи Омиљених.',
        'Упозорење: Ово тренутно није потпуно безбедно, јер нападач који зна Fingerprint вашег уређаја у Омиљенима такође може да вам пошаље фајл.',
        'Ипак, ово је и даље сигурније него дозволити пријем са свих уређаја.',
      ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinSrCyrl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унеси PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSrCyrl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Метод за слање';
  @override
  String get single => 'Пошаљи фајлове једном примаоцу. Селекција ће бити ресетована након завршеног слања.';
  @override
  String get multiple => 'Пошаљи фајлове за више прималаца. Селекција неће бити ресетована након завршеног слања.';
  @override
  String get link => 'Примаоци који немају LocalSend инсталиран, могу да преузму селектоване фајлове преко Линка у browseru.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomSrCyrl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get dark => 'Тамно';
  @override
  String get light => 'Светло';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsSrCyrl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSrCyrl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSrCyrl._(TranslationsSrCyrl root)
      : this._root = root,
        super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Укупан прогрес (${time})';
  @override
  String get finishedError => 'Завршено са грешком';
  @override
  String get canceledSender => 'Пошиљалац је одустао';
  @override
  String get canceledReceiver => 'Прималац је одустао';
}
