///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';
import 'strings_sr.g.dart';

// Path: <root>
class TranslationsSrCyrl extends TranslationsSr with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSrCyrl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsSrCyrl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSrCyrl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Српски (ћирилица)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$sr_Cyrl general = _Translations$general$sr_Cyrl._(_root);
  @override
  late final _Translations$receiveTab$sr_Cyrl receiveTab = _Translations$receiveTab$sr_Cyrl._(_root);
  @override
  late final _Translations$sendTab$sr_Cyrl sendTab = _Translations$sendTab$sr_Cyrl._(_root);
  @override
  late final _Translations$settingsTab$sr_Cyrl settingsTab = _Translations$settingsTab$sr_Cyrl._(_root);
  @override
  late final _Translations$troubleshootPage$sr_Cyrl troubleshootPage = _Translations$troubleshootPage$sr_Cyrl._(_root);
  @override
  late final _Translations$receiveHistoryPage$sr_Cyrl receiveHistoryPage = _Translations$receiveHistoryPage$sr_Cyrl._(_root);
  @override
  late final _Translations$apkPickerPage$sr_Cyrl apkPickerPage = _Translations$apkPickerPage$sr_Cyrl._(_root);
  @override
  late final _Translations$selectedFilesPage$sr_Cyrl selectedFilesPage = _Translations$selectedFilesPage$sr_Cyrl._(_root);
  @override
  late final _Translations$receivePage$sr_Cyrl receivePage = _Translations$receivePage$sr_Cyrl._(_root);
  @override
  late final _Translations$receiveOptionsPage$sr_Cyrl receiveOptionsPage = _Translations$receiveOptionsPage$sr_Cyrl._(_root);
  @override
  late final _Translations$sendPage$sr_Cyrl sendPage = _Translations$sendPage$sr_Cyrl._(_root);
  @override
  late final _Translations$progressPage$sr_Cyrl progressPage = _Translations$progressPage$sr_Cyrl._(_root);
  @override
  late final _Translations$webSharePage$sr_Cyrl webSharePage = _Translations$webSharePage$sr_Cyrl._(_root);
  @override
  late final _Translations$aboutPage$sr_Cyrl aboutPage = _Translations$aboutPage$sr_Cyrl._(_root);
  @override
  late final _Translations$donationPage$sr_Cyrl donationPage = _Translations$donationPage$sr_Cyrl._(_root);
  @override
  late final _Translations$changelogPage$sr_Cyrl changelogPage = _Translations$changelogPage$sr_Cyrl._(_root);
  @override
  late final _Translations$aliasGenerator$sr_Cyrl aliasGenerator = _Translations$aliasGenerator$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$sr_Cyrl dialogs = _Translations$dialogs$sr_Cyrl._(_root);
  @override
  late final _Translations$sanitization$sr_Cyrl sanitization = _Translations$sanitization$sr_Cyrl._(_root);
  @override
  late final _Translations$tray$sr_Cyrl tray = _Translations$tray$sr_Cyrl._(_root);
  @override
  late final _Translations$web$sr_Cyrl web = _Translations$web$sr_Cyrl._(_root);
  @override
  late final _Translations$assetPicker$sr_Cyrl assetPicker = _Translations$assetPicker$sr_Cyrl._(_root);
  @override
  late final _Translations$networkInterfacesPage$sr_Cyrl networkInterfacesPage = _Translations$networkInterfacesPage$sr_Cyrl._(_root);
}

// Path: general
class _Translations$general$sr_Cyrl extends Translations$general$sr {
  _Translations$general$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$sr_Cyrl extends Translations$receiveTab$sr {
  _Translations$receiveTab$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Примање';
  @override
  late final _Translations$receiveTab$infoBox$sr_Cyrl infoBox = _Translations$receiveTab$infoBox$sr_Cyrl._(_root);
  @override
  late final _Translations$receiveTab$quickSave$sr_Cyrl quickSave = _Translations$receiveTab$quickSave$sr_Cyrl._(_root);
}

// Path: sendTab
class _Translations$sendTab$sr_Cyrl extends Translations$sendTab$sr {
  _Translations$sendTab$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  late final _Translations$sendTab$selection$sr_Cyrl selection = _Translations$sendTab$selection$sr_Cyrl._(_root);
  @override
  late final _Translations$sendTab$picker$sr_Cyrl picker = _Translations$sendTab$picker$sr_Cyrl._(_root);
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
  late final _Translations$sendTab$sendModes$sr_Cyrl sendModes = _Translations$sendTab$sendModes$sr_Cyrl._(_root);
  @override
  String get sendModeHelp => 'Објашњење';
  @override
  String get help => 'Уверите се да је прималац такође на истој Wi-Fi мрежи.';
  @override
  String get placeItems => 'Поставите предмете за дељење.';
}

// Path: settingsTab
class _Translations$settingsTab$sr_Cyrl extends Translations$settingsTab$sr {
  _Translations$settingsTab$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Подешавања';
  @override
  late final _Translations$settingsTab$general$sr_Cyrl general = _Translations$settingsTab$general$sr_Cyrl._(_root);
  @override
  late final _Translations$settingsTab$receive$sr_Cyrl receive = _Translations$settingsTab$receive$sr_Cyrl._(_root);
  @override
  late final _Translations$settingsTab$send$sr_Cyrl send = _Translations$settingsTab$send$sr_Cyrl._(_root);
  @override
  late final _Translations$settingsTab$network$sr_Cyrl network = _Translations$settingsTab$network$sr_Cyrl._(_root);
  @override
  late final _Translations$settingsTab$other$sr_Cyrl other = _Translations$settingsTab$other$sr_Cyrl._(_root);
  @override
  String get advancedSettings => 'Напредна подешавања';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$sr_Cyrl extends Translations$troubleshootPage$sr {
  _Translations$troubleshootPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$sr_Cyrl firewall = _Translations$troubleshootPage$firewall$sr_Cyrl._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$sr_Cyrl noDiscovery = _Translations$troubleshootPage$noDiscovery$sr_Cyrl._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$sr_Cyrl noConnection = _Translations$troubleshootPage$noConnection$sr_Cyrl._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$sr_Cyrl extends Translations$receiveHistoryPage$sr {
  _Translations$receiveHistoryPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$sr_Cyrl entryActions = _Translations$receiveHistoryPage$entryActions$sr_Cyrl._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$sr_Cyrl extends Translations$apkPickerPage$sr {
  _Translations$apkPickerPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$sr_Cyrl extends Translations$selectedFilesPage$sr {
  _Translations$selectedFilesPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Избриши све';
}

// Path: receivePage
class _Translations$receivePage$sr_Cyrl extends Translations$receivePage$sr {
  _Translations$receivePage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
    n,
    one: 'жели да вам пошаље фајл',
    other: 'жели да вам пошаље ${n} фајлова',
  );
  @override
  String get subTitleMessage => 'послао вам је поруку:';
  @override
  String get subTitleLink => 'послао вам је линк:';
  @override
  String get canceled => 'Пошиљалац је отказао захтев.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$sr_Cyrl extends Translations$receiveOptionsPage$sr {
  _Translations$receiveOptionsPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$sr_Cyrl extends Translations$sendPage$sr {
  _Translations$sendPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$sr_Cyrl extends Translations$progressPage$sr {
  _Translations$progressPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Слање фајлова';
  @override
  String get titleReceiving => 'Примање фајлова';
  @override
  String get savedToGallery => 'Сачувано у галерији';
  @override
  late final _Translations$progressPage$total$sr_Cyrl total = _Translations$progressPage$total$sr_Cyrl._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$sr_Cyrl extends Translations$webSharePage$sr {
  _Translations$webSharePage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$sr_Cyrl extends Translations$aboutPage$sr {
  _Translations$aboutPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$sr_Cyrl extends Translations$donationPage$sr {
  _Translations$donationPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$sr_Cyrl extends Translations$changelogPage$sr {
  _Translations$changelogPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Евиденција промена';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$sr_Cyrl extends Translations$aliasGenerator$sr {
  _Translations$aliasGenerator$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$sr_Cyrl extends Translations$dialogs$sr {
  _Translations$dialogs$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$sr_Cyrl addFile = _Translations$dialogs$addFile$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$openFile$sr_Cyrl openFile = _Translations$dialogs$openFile$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$addressInput$sr_Cyrl addressInput = _Translations$dialogs$addressInput$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$cancelSession$sr_Cyrl cancelSession = _Translations$dialogs$cancelSession$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$sr_Cyrl cannotOpenFile = _Translations$dialogs$cannotOpenFile$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$sr_Cyrl encryptionDisabledNotice =
      _Translations$dialogs$encryptionDisabledNotice$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$errorDialog$sr_Cyrl errorDialog = _Translations$dialogs$errorDialog$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$sr_Cyrl favoriteDialog = _Translations$dialogs$favoriteDialog$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$sr_Cyrl favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$sr_Cyrl favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$fileInfo$sr_Cyrl fileInfo = _Translations$dialogs$fileInfo$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$sr_Cyrl fileNameInput = _Translations$dialogs$fileNameInput$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$sr_Cyrl historyClearDialog = _Translations$dialogs$historyClearDialog$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$sr_Cyrl localNetworkUnauthorized =
      _Translations$dialogs$localNetworkUnauthorized$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$messageInput$sr_Cyrl messageInput = _Translations$dialogs$messageInput$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$noFiles$sr_Cyrl noFiles = _Translations$dialogs$noFiles$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$noPermission$sr_Cyrl noPermission = _Translations$dialogs$noPermission$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$sr_Cyrl notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$sr_Cyrl._(
    _root,
  );
  @override
  late final _Translations$dialogs$qr$sr_Cyrl qr = _Translations$dialogs$qr$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$quickActions$sr_Cyrl quickActions = _Translations$dialogs$quickActions$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$sr_Cyrl quickSaveNotice = _Translations$dialogs$quickSaveNotice$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$sr_Cyrl quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$pin$sr_Cyrl pin = _Translations$dialogs$pin$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$sr_Cyrl sendModeHelp = _Translations$dialogs$sendModeHelp$sr_Cyrl._(_root);
  @override
  late final _Translations$dialogs$zoom$sr_Cyrl zoom = _Translations$dialogs$zoom$sr_Cyrl._(_root);
}

// Path: sanitization
class _Translations$sanitization$sr_Cyrl extends Translations$sanitization$sr {
  _Translations$sanitization$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Назив фајла не може бити празан';
  @override
  String get invalid => 'Назив фајла садржи неважеће знакове';
}

// Path: tray
class _Translations$tray$sr_Cyrl extends Translations$tray$sr {
  _Translations$tray$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$web$sr_Cyrl extends Translations$web$sr {
  _Translations$web$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$sr_Cyrl extends Translations$assetPicker$sr {
  _Translations$assetPicker$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$sr_Cyrl extends Translations$networkInterfacesPage$sr {
  _Translations$networkInterfacesPage$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$sr_Cyrl extends Translations$receiveTab$infoBox$sr {
  _Translations$receiveTab$infoBox$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$sr_Cyrl extends Translations$receiveTab$quickSave$sr {
  _Translations$receiveTab$quickSave$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$sr_Cyrl extends Translations$sendTab$selection$sr {
  _Translations$sendTab$selection$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$sr_Cyrl extends Translations$sendTab$picker$sr {
  _Translations$sendTab$picker$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$sr_Cyrl extends Translations$sendTab$sendModes$sr {
  _Translations$sendTab$sendModes$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$sr_Cyrl extends Translations$settingsTab$general$sr {
  _Translations$settingsTab$general$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Опште';
  @override
  String get brightness => 'Тема';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$sr_Cyrl brightnessOptions =
      _Translations$settingsTab$general$brightnessOptions$sr_Cyrl._(_root);
  @override
  String get color => 'Боја';
  @override
  late final _Translations$settingsTab$general$colorOptions$sr_Cyrl colorOptions = _Translations$settingsTab$general$colorOptions$sr_Cyrl._(_root);
  @override
  String get language => 'Језик';
  @override
  late final _Translations$settingsTab$general$languageOptions$sr_Cyrl languageOptions = _Translations$settingsTab$general$languageOptions$sr_Cyrl._(
    _root,
  );
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
class _Translations$settingsTab$receive$sr_Cyrl extends Translations$settingsTab$receive$sr {
  _Translations$settingsTab$receive$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$sr_Cyrl extends Translations$settingsTab$send$sr {
  _Translations$settingsTab$send$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Слање';
  @override
  String get shareViaLinkAutoAccept => 'Аутоматски прихвати захтеве у режиму „Дељење путем линка“';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$sr_Cyrl extends Translations$settingsTab$network$sr {
  _Translations$settingsTab$network$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$sr_Cyrl networkOptions = _Translations$settingsTab$network$networkOptions$sr_Cyrl._(
    _root,
  );
}

// Path: settingsTab.other
class _Translations$settingsTab$other$sr_Cyrl extends Translations$settingsTab$other$sr {
  _Translations$settingsTab$other$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$sr_Cyrl extends Translations$troubleshootPage$firewall$sr {
  _Translations$troubleshootPage$firewall$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овај уређај може слати фајлове другим уређајима; али други уређаји не могу слати фајлове овом уређају.';
  @override
  String solution({required Object port}) =>
      'Ово је највероватније проблем са заштитним зидом. Ово можете решити тако што ћете дозволити долазне везе (UDP и TCP) на порту ${port}.';
  @override
  String get openFirewall => 'Отвори заштитни зид';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$sr_Cyrl extends Translations$troubleshootPage$noDiscovery$sr {
  _Translations$troubleshootPage$noDiscovery$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Овај уређај не може да открије друге уређаје.';
  @override
  String get solution =>
      'Уверите се да су сви уређаји на истој Wi-Fi мрежи и да имају исту конфигурацију (порт, адреса вишесмерног емитовања, шифровање). Можете покушати да ручно унесете IP адресу циљног уређаја. Ако то функционише, размислите о додавању тог уређаја у омиљене како би се могао аутоматски открити у будућности.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$sr_Cyrl extends Translations$troubleshootPage$noConnection$sr {
  _Translations$troubleshootPage$noConnection$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Оба уређаја не могу да открију један другог нити могу да деле фајлове.';
  @override
  String get solution =>
      'Да ли проблем постоји на обе стране? Ако је тако, потребно је да се уверите да су оба уређаја на истој Wi-Fi мрежи и да имају исту конфигурацију (порт, адреса вишесмерног емитовања, шифровање). Wi-Fi мрежа можда неће дозволити комуникацију између учесника због изолације приступне тачке (AP). У овом случају, ова опција мора бити онемогућена на рутеру.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$sr_Cyrl extends Translations$receiveHistoryPage$entryActions$sr {
  _Translations$receiveHistoryPage$entryActions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$sr_Cyrl extends Translations$progressPage$total$sr {
  _Translations$progressPage$total$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$sr_Cyrl title = _Translations$progressPage$total$title$sr_Cyrl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Фајлова: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Величина: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Брзина: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$sr_Cyrl extends Translations$dialogs$addFile$sr {
  _Translations$dialogs$addFile$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Додајте у избор';
  @override
  String get content => 'Шта желите додати?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$sr_Cyrl extends Translations$dialogs$openFile$sr {
  _Translations$dialogs$openFile$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Отвори фајл';
  @override
  String get content => 'Желите ли да отворите примљени фајл?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$sr_Cyrl extends Translations$dialogs$addressInput$sr {
  _Translations$dialogs$addressInput$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$sr_Cyrl extends Translations$dialogs$cancelSession$sr {
  _Translations$dialogs$cancelSession$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Откажите пренос фајлова';
  @override
  String get content => 'Желите ли заиста да откажете пренос фајлова?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$sr_Cyrl extends Translations$dialogs$cannotOpenFile$sr {
  _Translations$dialogs$cannotOpenFile$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није могуће отворити фајл';
  @override
  String content({required Object file}) => 'Није могуће отворити „${file}“. Да ли је овај фајл премештен, преименован, или избрисан?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$sr_Cyrl extends Translations$dialogs$encryptionDisabledNotice$sr {
  _Translations$dialogs$encryptionDisabledNotice$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифровање онемогућено';
  @override
  String get content =>
      'Комуникација се сада одвија преко нешифрованог HTTP протокола. Да бисте користили HTTPS протокол, поново омогућите шифровање.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$sr_Cyrl extends Translations$dialogs$errorDialog$sr {
  _Translations$dialogs$errorDialog$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$sr_Cyrl extends Translations$dialogs$favoriteDialog$sr {
  _Translations$dialogs$favoriteDialog$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$sr_Cyrl extends Translations$dialogs$favoriteDeleteDialog$sr {
  _Translations$dialogs$favoriteDeleteDialog$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Избриши из омиљених';
  @override
  String content({required Object name}) => 'Желите ли заиста да избришете „${name}“ из омиљених?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$sr_Cyrl extends Translations$dialogs$favoriteEditDialog$sr {
  _Translations$dialogs$favoriteEditDialog$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$sr_Cyrl extends Translations$dialogs$fileInfo$sr {
  _Translations$dialogs$fileInfo$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$sr_Cyrl extends Translations$dialogs$fileNameInput$sr {
  _Translations$dialogs$fileNameInput$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унесите назив фајла';
  @override
  String original({required Object original}) => 'Оригинални назив фајла: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$sr_Cyrl extends Translations$dialogs$historyClearDialog$sr {
  _Translations$dialogs$historyClearDialog$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Очистите историју';
  @override
  String get content => 'Желите ли заиста да очистите читаву историју?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$sr_Cyrl extends Translations$dialogs$localNetworkUnauthorized$sr {
  _Translations$dialogs$localNetworkUnauthorized$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$sr_Cyrl extends Translations$dialogs$messageInput$sr {
  _Translations$dialogs$messageInput$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Напишите поруку';
  @override
  String get multiline => 'Више редова';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$sr_Cyrl extends Translations$dialogs$noFiles$sr {
  _Translations$dialogs$noFiles$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није изабран ниједан фајл';
  @override
  String get content => 'Изаберите бар један фајл.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$sr_Cyrl extends Translations$dialogs$noPermission$sr {
  _Translations$dialogs$noPermission$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Нема дозволе';
  @override
  String get content => 'Нисте дали неопходне дозволе. Дајте их у подешавањима.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$sr_Cyrl extends Translations$dialogs$notAvailableOnPlatform$sr {
  _Translations$dialogs$notAvailableOnPlatform$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Није доступно';
  @override
  String get content => 'Ова функција је доступна само на:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$sr_Cyrl extends Translations$dialogs$qr$sr {
  _Translations$dialogs$qr$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR кôд';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$sr_Cyrl extends Translations$dialogs$quickActions$sr {
  _Translations$dialogs$quickActions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$sr_Cyrl extends Translations$dialogs$quickSaveNotice$sr {
  _Translations$dialogs$quickSaveNotice$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Захтеви за фајлове се сада аутоматски прихватају. Имајте на уму да сви на локалној мрежи могу да вам шаљу фајлове.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$sr_Cyrl extends Translations$dialogs$quickSaveFromFavoritesNotice$sr {
  _Translations$dialogs$quickSaveFromFavoritesNotice$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$sr_Cyrl extends Translations$dialogs$pin$sr {
  _Translations$dialogs$pin$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Унесите PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$sr_Cyrl extends Translations$dialogs$sendModeHelp$sr {
  _Translations$dialogs$sendModeHelp$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$sr_Cyrl extends Translations$dialogs$zoom$sr {
  _Translations$dialogs$zoom$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$sr_Cyrl extends Translations$settingsTab$general$brightnessOptions$sr {
  _Translations$settingsTab$general$brightnessOptions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$sr_Cyrl extends Translations$settingsTab$general$colorOptions$sr {
  _Translations$settingsTab$general$colorOptions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системска';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$sr_Cyrl extends Translations$settingsTab$general$languageOptions$sr {
  _Translations$settingsTab$general$languageOptions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системски';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$sr_Cyrl extends Translations$settingsTab$network$networkOptions$sr {
  _Translations$settingsTab$network$networkOptions$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

  final TranslationsSrCyrl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Све';
  @override
  String get filtered => 'Филтрирана';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$sr_Cyrl extends Translations$progressPage$total$title$sr {
  _Translations$progressPage$total$title$sr_Cyrl._(TranslationsSrCyrl root) : this._root = root, super.internal(root);

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
