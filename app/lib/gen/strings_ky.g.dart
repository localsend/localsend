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
class TranslationsKy extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsKy({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ky,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ky>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsKy _root = this; // ignore: unused_field

  @override
  TranslationsKy $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKy(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ky general = _Translations$general$ky._(_root);
  @override
  late final _Translations$receiveTab$ky receiveTab = _Translations$receiveTab$ky._(_root);
  @override
  late final _Translations$sendTab$ky sendTab = _Translations$sendTab$ky._(_root);
  @override
  late final _Translations$settingsTab$ky settingsTab = _Translations$settingsTab$ky._(_root);
  @override
  late final _Translations$troubleshootPage$ky troubleshootPage = _Translations$troubleshootPage$ky._(_root);
  @override
  late final _Translations$networkInterfacesPage$ky networkInterfacesPage = _Translations$networkInterfacesPage$ky._(_root);
  @override
  late final _Translations$receiveHistoryPage$ky receiveHistoryPage = _Translations$receiveHistoryPage$ky._(_root);
  @override
  late final _Translations$apkPickerPage$ky apkPickerPage = _Translations$apkPickerPage$ky._(_root);
  @override
  late final _Translations$selectedFilesPage$ky selectedFilesPage = _Translations$selectedFilesPage$ky._(_root);
  @override
  late final _Translations$deviceDetailsPage$ky deviceDetailsPage = _Translations$deviceDetailsPage$ky._(_root);
  @override
  late final _Translations$verifyPage$ky verifyPage = _Translations$verifyPage$ky._(_root);
  @override
  late final _Translations$receivePage$ky receivePage = _Translations$receivePage$ky._(_root);
  @override
  late final _Translations$receiveOptionsPage$ky receiveOptionsPage = _Translations$receiveOptionsPage$ky._(_root);
  @override
  late final _Translations$sendPage$ky sendPage = _Translations$sendPage$ky._(_root);
  @override
  late final _Translations$progressPage$ky progressPage = _Translations$progressPage$ky._(_root);
  @override
  late final _Translations$webSharePage$ky webSharePage = _Translations$webSharePage$ky._(_root);
  @override
  late final _Translations$webReceivePage$ky webReceivePage = _Translations$webReceivePage$ky._(_root);
  @override
  late final _Translations$aboutPage$ky aboutPage = _Translations$aboutPage$ky._(_root);
  @override
  late final _Translations$donationPage$ky donationPage = _Translations$donationPage$ky._(_root);
  @override
  late final _Translations$changelogPage$ky changelogPage = _Translations$changelogPage$ky._(_root);
  @override
  late final _Translations$whatsNewPage$ky whatsNewPage = _Translations$whatsNewPage$ky._(_root);
  @override
  late final _Translations$aliasGenerator$ky aliasGenerator = _Translations$aliasGenerator$ky._(_root);
  @override
  late final _Translations$dialogs$ky dialogs = _Translations$dialogs$ky._(_root);
  @override
  late final _Translations$sanitization$ky sanitization = _Translations$sanitization$ky._(_root);
  @override
  late final _Translations$tray$ky tray = _Translations$tray$ky._(_root);
  @override
  late final _Translations$web$ky web = _Translations$web$ky._(_root);
  @override
  late final _Translations$assetPicker$ky assetPicker = _Translations$assetPicker$ky._(_root);
}

// Path: general
class _Translations$general$ky extends Translations$general$en {
  _Translations$general$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Кабыл алуу';
  @override
  String get accepted => 'Кабыл алынды';
  @override
  String get add => 'Кошуу';
  @override
  String get advanced => 'Өркүндөтүлгөн';
  @override
  String get cancel => 'Жокко чыгаруу';
  @override
  String get close => 'Жабуу';
  @override
  String get confirm => 'Ырастоо';
  @override
  String get continueStr => 'Улантуу';
  @override
  String get copy => 'Көчүрүү';
  @override
  String get copiedToClipboard => 'Алмашуу буферине көчүрүлдү';
  @override
  String get decline => 'Баш тартуу';
  @override
  String get done => 'Даяр';
  @override
  String get delete => 'Өчүрүү';
  @override
  String get edit => 'Оңдоо';
  @override
  String get error => 'Ката';
  @override
  String get example => 'Мисал';
  @override
  String get files => 'Файлдар';
  @override
  String get finished => 'Аяктады';
  @override
  String get hide => 'Жашыруу';
  @override
  String get off => 'Өчүк';
  @override
  String get offline => 'Тармактан тышкары';
  @override
  String get on => 'Күйүк';
  @override
  String get online => 'Тармакта';
  @override
  String get open => 'Ачуу';
  @override
  String get queue => 'Кезек';
  @override
  String get quickSave => 'Тез сактоо';
  @override
  String get quickSaveFromFavorites => '"Тандалмалар" үчүн тез сактоо';
  @override
  String get renamed => 'Аты өзгөртүлдү';
  @override
  String get reset => 'Өзгөртүүлөрдү кайтаруу';
  @override
  String get restart => 'Кайра иштетүү';
  @override
  String get settings => 'Жөндөөлөр';
  @override
  String get skipped => 'Өткөрүлүп жиберилди';
  @override
  String get start => 'Баштоо';
  @override
  String get stop => 'Токтотуу';
  @override
  String get save => 'Сактоо';
  @override
  String get unchanged => 'Өзгөртүлгөн жок';
  @override
  String get unknown => 'Белгисиз';
  @override
  String get noItemInClipboard => 'Алмашуу буферинде элементтер жок.';
}

// Path: receiveTab
class _Translations$receiveTab$ky extends Translations$receiveTab$en {
  _Translations$receiveTab$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Кабыл алуу';
  @override
  late final _Translations$receiveTab$infoBox$ky infoBox = _Translations$receiveTab$infoBox$ky._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ky quickSave = _Translations$receiveTab$quickSave$ky._(_root);
  @override
  String get link => 'Шилтеме аркылуу кабыл алуу';
}

// Path: sendTab
class _Translations$sendTab$ky extends Translations$sendTab$en {
  _Translations$sendTab$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жөнөтүү';
  @override
  late final _Translations$sendTab$selection$ky selection = _Translations$sendTab$selection$ky._(_root);
  @override
  late final _Translations$sendTab$picker$ky picker = _Translations$sendTab$picker$ky._(_root);
  @override
  String get shareIntentInfo => 'Файлдарды оңой тандоо үчүн мобилдик түзмөгүңүздүн "Бөлүшүү" функциясын колдонсоңуз болот.';
  @override
  String get nearbyDevices => 'Жакындагы түзмөктөр';
  @override
  String get thisDevice => 'Бул түзмөк';
  @override
  String get scan => 'Түзмөктөрдү издөө';
  @override
  String get manualSending => 'Кол менен жөнөтүү';
  @override
  String get sendMode => 'Жөнөтүү режими';
  @override
  late final _Translations$sendTab$sendModes$ky sendModes = _Translations$sendTab$sendModes$ky._(_root);
  @override
  String get sendModeHelp => 'Түшүндүрмө';
  @override
  String get help => 'Кабыл алуучу сиз менен бир Wi-Fi тармагында экенин текшериңиз.';
  @override
  String get placeItems => 'Бөлүшө турган элементтерди кошуңуз.';
}

// Path: settingsTab
class _Translations$settingsTab$ky extends Translations$settingsTab$en {
  _Translations$settingsTab$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жөндөөлөр';
  @override
  late final _Translations$settingsTab$general$ky general = _Translations$settingsTab$general$ky._(_root);
  @override
  late final _Translations$settingsTab$receive$ky receive = _Translations$settingsTab$receive$ky._(_root);
  @override
  late final _Translations$settingsTab$send$ky send = _Translations$settingsTab$send$ky._(_root);
  @override
  late final _Translations$settingsTab$network$ky network = _Translations$settingsTab$network$ky._(_root);
  @override
  late final _Translations$settingsTab$other$ky other = _Translations$settingsTab$other$ky._(_root);
  @override
  String get advancedSettings => 'Өркүндөтүлгөн жөндөөлөр';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ky extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Көйгөйлөрдү чечүү';
  @override
  String get subTitle => 'Тиркеме туура эмес иштеп жатабы? Бул жерден кеңири таралган көйгөйлөрдүн чечимдерин таба аласыз.';
  @override
  String get solution => 'Чечим:';
  @override
  String get fixButton => 'Автоматтык түрдө оңдоо';
  @override
  late final _Translations$troubleshootPage$firewall$ky firewall = _Translations$troubleshootPage$firewall$ky._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ky noDiscovery = _Translations$troubleshootPage$noDiscovery$ky._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ky noConnection = _Translations$troubleshootPage$noConnection$ky._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ky extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тармак интерфейстери';
  @override
  String get info =>
      'Демейки боюнча, LocalSend колдо бар бардык тармак интерфейстерин колдонот. Керексиз тармактарды бул жерден чыгарып салсаңыз болот. Өзгөртүүлөрдү колдонуу үчүн серверди кайра иштетүү керек.';
  @override
  String get preview => 'Алдын ала көрүү';
  @override
  String get whitelist => 'Ак тизме';
  @override
  String get blacklist => 'Кара тизме';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ky extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тарых';
  @override
  String get openFolder => 'Папканы ачуу';
  @override
  String get deleteHistory => 'Тарыхты тазалоо';
  @override
  String get empty => 'Тарых бош.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$ky entryActions = _Translations$receiveHistoryPage$entryActions$ky._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ky extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тиркемелер (APK)';
  @override
  String get excludeSystemApps => 'Системалык тиркемелерди көрсөтпөө';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Ишке киргизүүгө мүмкүн болбогон тиркемелерди көрсөтпөө';
  @override
  String apps({required Object n}) => '${n} тиркеме';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ky extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Бардыгын өчүрүү';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$ky extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Түзмөк жөнүндө маалымат';
  @override
  String get favorite => 'Тандалма';
  @override
  String get verify => 'Текшерүү';
  @override
  late final _Translations$deviceDetailsPage$info$ky info = _Translations$deviceDetailsPage$info$ky._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$ky logs = _Translations$deviceDetailsPage$logs$ky._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$ky extends Translations$verifyPage$en {
  _Translations$verifyPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Текшерүү';
  @override
  String get icons => 'Сөлөкөттөр';
  @override
  String get text => 'Текст';
  @override
  String get question => 'Бул экинчи түзмөктө да ушундай көрүнүп жатабы?';
}

// Path: receivePage
class _Translations$receivePage$ky extends Translations$receivePage$en {
  _Translations$receivePage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ky'))(
    n,
    one: 'сизге файл жөнөткүсү келип жатат',
    other: 'сизге ${n} файл жөнөткүсү келип жатат',
  );
  @override
  String get subTitleMessage => 'сизге билдирүү жөнөттү:';
  @override
  String get subTitleLink => 'сизге шилтеме жөнөттү:';
  @override
  String get canceled => 'Жөнөтүүчү сурамды жокко чыгарды.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$ky extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Параметрлер';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend папкасы)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Папкалар бар болгондуктан автоматтык түрдө өчүрүлдү.';
}

// Path: sendPage
class _Translations$sendPage$ky extends Translations$sendPage$en {
  _Translations$sendPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Текшерүү суммасын эсептөө (${curr} / ${n})';
  @override
  String get waiting => 'Жооп күтүлүүдө…';
  @override
  String get rejected => 'Кабыл алуучу сурамды четке какты.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Кабыл алуучу башка сурамды аткарып жатат.';
}

// Path: progressPage
class _Translations$progressPage$ky extends Translations$progressPage$en {
  _Translations$progressPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Файлдар жөнөтүлүүдө';
  @override
  String get titleReceiving => 'Файлдар кабыл алынууда';
  @override
  String get savedToGallery => 'Сүрөттөргө сакталды';
  @override
  late final _Translations$progressPage$total$ky total = _Translations$progressPage$total$ky._(_root);
  @override
  late final _Translations$progressPage$remainingTime$ky remainingTime = _Translations$progressPage$remainingTime$ky._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ky extends Translations$webSharePage$en {
  _Translations$webSharePage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шилтеме аркылуу бөлүшүү';
  @override
  String get loading => 'Сервер ишке киргизилүүдө…';
  @override
  String get stopping => 'Сервер токтотулууда…';
  @override
  String get error => 'Серверди ишке киргизүүдө ката кетти.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ky'))(
    n,
    one: 'Бул шилтемени браузерде ачыңыз:',
    other: 'Бул шилтемелердин бирин браузерде ачыңыз:',
  );
  @override
  String get requests => 'Сурамдар';
  @override
  String get noRequests => 'Сурамдар азырынча жок.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Сурамдарды автоматтык түрдө кабыл алуу';
  @override
  String get requirePin => 'PIN-код талап кылуу';
  @override
  String pinHint({required Object pin}) => 'PIN-код: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend өз алдынча кол коюлган сертификатты колдонот. Браузерде аны кабыл алышыңыз керек.';
  @override
  String pendingRequests({required Object n}) => 'Күтүлүп жаткан сурамдар: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$ky extends Translations$webReceivePage$en {
  _Translations$webReceivePage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шилтеме аркылуу кабыл алуу';
}

// Path: aboutPage
class _Translations$aboutPage$ky extends Translations$aboutPage$en {
  _Translations$aboutPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend жөнүндө';
  @override
  List<String> get description => [
    'LocalSend — бул интернетке туташпастан, жергиликтүү тармак аркылуу жакын жердеги түзмөктөр менен файлдарды жана билдирүүлөрдү коопсуз бөлүшүүгө мүмкүндүк берген акысыз, ачык булактуу тиркеме.',
    'Бул тиркеме Android, iOS, macOS, Windows жана Linux үчүн жеткиликтүү. Жүктөп алуунун бардык варианттарын расмий веб-сайттан таба аласыз.',
  ];
  @override
  String get author => 'Автор';
  @override
  String get contributors => 'Салым кошкондор';
  @override
  String get packagers => 'Пакеттөөчүлөр';
  @override
  String get translators => 'Котормочулар';
}

// Path: donationPage
class _Translations$donationPage$ky extends Translations$donationPage$en {
  _Translations$donationPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Кайрымдуулук кылуу';
  @override
  String get info =>
      'LocalSend — бул жарнамасыз, акысыз жана ачык булактуу тиркеме. Эгер сизге жакса, ыктыярдуу тартуу менен анын өнүгүшүн колдой аласыз.';
  @override
  String donate({required Object amount}) => '${amount} тартуулоо';
  @override
  String get thanks => 'Чоң рахмат!';
  @override
  String get restore => 'Сатып алууну калыбына келтирүү';
}

// Path: changelogPage
class _Translations$changelogPage$ky extends Translations$changelogPage$en {
  _Translations$changelogPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Өзгөрүүлөр тарыхы';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$ky extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => '${version} версиясындагы жаңылыктар';
  @override
  late final _Translations$whatsNewPage$changes$ky changes = _Translations$whatsNewPage$changes$ky._(_root);
}

// Path: aliasGenerator
class _Translations$aliasGenerator$ky extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Татынакай',
    'Кооз',
    'Чоң',
    'Жаркын',
    'Таза',
    'Зээндүү',
    'Укмуш',
    'Сүйкүмдүү',
    'Айлакер',
    'Чечкиндүү',
    'Энергиялуу',
    'Натыйжалуу',
    'Кереметтүү',
    'Тез',
    'Жакшы',
    'Жаңы',
    'Сонун',
    'Ажайып',
    'Улуу',
    'Көрктүү',
    'Ысык',
    'Боорукер',
    'Жагымдуу',
    'Сырдуу',
    'Тыканаак',
    'Ылайыктуу',
    'Сабырдуу',
    'Сулуу',
    'Кубаттуу',
    'Бай',
    'Жашыруун',
    'Зерек',
    'Бекем',
    'Өзгөчө',
    'Стратегиялык',
    'Күчтүү',
    'Тыкан',
    'Даанышман',
  ];
  @override
  List<String> get fruits => [
    'Алма',
    'Авокадо',
    'Банан',
    'Кара бүлдүркөн',
    'Черника',
    'Брокколи',
    'Сабиз',
    'Алча',
    'Кокос',
    'Жүзүм',
    'Лимон',
    'Салат жалбырагы',
    'Манго',
    'Ковун',
    'Козу карын',
    'Пияз',
    'Апельсин',
    'Папайя',
    'Шабдалы',
    'Алмурут',
    'Ананас',
    'Картөшкө',
    'Ашкабак',
    'Малина',
    'Кулпунай',
    'Помидор',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$ky extends Translations$dialogs$en {
  _Translations$dialogs$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ky addFile = _Translations$dialogs$addFile$ky._(_root);
  @override
  late final _Translations$dialogs$openFile$ky openFile = _Translations$dialogs$openFile$ky._(_root);
  @override
  late final _Translations$dialogs$addressInput$ky addressInput = _Translations$dialogs$addressInput$ky._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ky cancelSession = _Translations$dialogs$cancelSession$ky._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ky cannotOpenFile = _Translations$dialogs$cannotOpenFile$ky._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ky encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ky._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ky errorDialog = _Translations$dialogs$errorDialog$ky._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ky favoriteDialog = _Translations$dialogs$favoriteDialog$ky._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ky favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ky._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ky favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ky._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ky fileInfo = _Translations$dialogs$fileInfo$ky._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ky fileNameInput = _Translations$dialogs$fileNameInput$ky._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ky historyClearDialog = _Translations$dialogs$historyClearDialog$ky._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ky localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ky._(_root);
  @override
  late final _Translations$dialogs$messageInput$ky messageInput = _Translations$dialogs$messageInput$ky._(_root);
  @override
  late final _Translations$dialogs$noFiles$ky noFiles = _Translations$dialogs$noFiles$ky._(_root);
  @override
  late final _Translations$dialogs$noPermission$ky noPermission = _Translations$dialogs$noPermission$ky._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ky notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ky._(_root);
  @override
  late final _Translations$dialogs$qr$ky qr = _Translations$dialogs$qr$ky._(_root);
  @override
  late final _Translations$dialogs$quickActions$ky quickActions = _Translations$dialogs$quickActions$ky._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ky quickSaveNotice = _Translations$dialogs$quickSaveNotice$ky._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ky quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ky._(_root);
  @override
  late final _Translations$dialogs$pin$ky pin = _Translations$dialogs$pin$ky._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ky sendModeHelp = _Translations$dialogs$sendModeHelp$ky._(_root);
  @override
  late final _Translations$dialogs$zoom$ky zoom = _Translations$dialogs$zoom$ky._(_root);
}

// Path: sanitization
class _Translations$sanitization$ky extends Translations$sanitization$en {
  _Translations$sanitization$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Файлдын аты бош болбошу керек';
  @override
  String get invalid => 'Файлдын атында жараксыз белгилер бар';
}

// Path: tray
class _Translations$tray$ky extends Translations$tray$en {
  _Translations$tray$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend\'ден чыгуу';
  @override
  String get closeWindows => 'Чыгуу';
}

// Path: web
class _Translations$web$ky extends Translations$web$en {
  _Translations$web$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN-кодду киргизиңиз';
  @override
  String get invalidPin => 'Туура эмес PIN-код';
  @override
  String get tooManyAttempts => 'Аракеттердин саны өтө көп';
  @override
  String get rejected => 'Четке кагылды';
  @override
  String get files => 'Файлдар';
  @override
  String get fileName => 'Файлдын аты';
  @override
  String get size => 'Көлөмү';
}

// Path: assetPicker
class _Translations$assetPicker$ky extends Translations$assetPicker$en {
  _Translations$assetPicker$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Ырастоо';
  @override
  String get cancel => 'Жокко чыгаруу';
  @override
  String get edit => 'Оңдоо';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Жүктөө оңунан чыкпады';
  @override
  String get original => 'Түпнуска';
  @override
  String get preview => 'Алдын ала көрүү';
  @override
  String get select => 'Тандоо';
  @override
  String get emptyList => 'Тизме бош';
  @override
  String get unSupportedAssetType => 'Колдоого алынбаган файл түрү.';
  @override
  String get unableToAccessAll => 'Түзмөктөгү бардык файлларга кирүүгө мүмкүн болбоду';
  @override
  String get viewingLimitedAssetsTip => 'Тиркеме өзү кире алган файлдарды жана альбомдорду гана көрө алат.';
  @override
  String get changeAccessibleLimitedAssets => 'Жеткиликтүү файлдарды жаңыртуу үчүн басыңыз';
  @override
  String get accessAllTip =>
      'Тиркеме түзмөктөгү кээ бир файлларга гана кире алат. Системалык жөндөөлөргө өтүп, тиркемеге бардык медиафайлдарга кирүүгө уруксат бериңиз.';
  @override
  String get goToSystemSettings => 'Системалык жөндөөлөргө өтүү';
  @override
  String get accessLimitedAssets => 'Чектелген мүмкүнчүлүк менен улантуу';
  @override
  String get accessiblePathName => 'Жеткиликтүү файлдар';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Сүрөт';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Башка медиа';
  @override
  String get sActionPlayHint => 'ойнотуу';
  @override
  String get sActionPreviewHint => 'алдын ала көрүү';
  @override
  String get sActionSelectHint => 'тандоо';
  @override
  String get sActionSwitchPathLabel => 'жолду өзгөртүү';
  @override
  String get sActionUseCameraHint => 'камераны колдонуу';
  @override
  String get sNameDurationLabel => 'узактыгы';
  @override
  String get sUnitAssetCountLabel => 'саны';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$ky extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Түзмөктүн аты:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$ky extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Тандалмалар';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ky extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тандоо';
  @override
  String files({required Object files}) => 'Файлдар: ${files}';
  @override
  String size({required Object size}) => 'Көлөмү: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$ky extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медиа';
  @override
  String get text => 'Текст';
  @override
  String get app => 'Тиркеме';
  @override
  String get clipboard => 'Чаптоо';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$ky extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Бир кабыл алуучу';
  @override
  String get multiple => 'Бир нече кабыл алуучу';
  @override
  String get link => 'Шилтеме аркылуу бөлүшүү';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$ky extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жалпы';
  @override
  String get brightness => 'Тема';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ky brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ky._(
    _root,
  );
  @override
  String get color => 'Түс';
  @override
  late final _Translations$settingsTab$general$colorOptions$ky colorOptions = _Translations$settingsTab$general$colorOptions$ky._(_root);
  @override
  String get language => 'Тил';
  @override
  late final _Translations$settingsTab$general$languageOptions$ky languageOptions = _Translations$settingsTab$general$languageOptions$ky._(_root);
  @override
  String get saveWindowPlacement => 'Чыккандан кийин терезенин ордун сактоо';
  @override
  String get saveWindowPlacementWindows => 'Чыккандан кийин терезенин ордун сактоо';
  @override
  String get minimizeToTray => 'Жапканда трейге/меню тилкесине жашыруу';
  @override
  String get launchAtStartup => 'Автоматтык ишке киргизүү';
  @override
  String get launchMinimized => 'Автоматтык ишке киргизүү: жашыруун баштоо';
  @override
  String get showInContextMenu => 'LocalSend\'ди контексттик менюда көрсөтүү';
  @override
  String get animations => 'Анимациялар';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$ky extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Кабыл алуу';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Автоматтык аяктоо';
  @override
  String get destination => 'Сактала турган папка';
  @override
  String get downloads => '(Жүктөөлөр)';
  @override
  String get saveToGallery => 'Медиафайлдарды галереяга сактоо';
  @override
  String get saveToHistory => 'Тарыхка сактоо';
  @override
  String get verifyChecksums => 'Файлдарды кабыл алууда текшерүү суммаларын текшерүү';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$ky extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жөнөтүү';
  @override
  String get shareViaLinkAutoAccept => '"Шилтеме аркылуу бөлүшүү" режиминде сурамдарды автоматтык түрдө кабыл алуу';
  @override
  String get createChecksums => 'Файлдарды жөнөтүүдө текшерүү суммаларын түзүү';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ky extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тармак';
  @override
  String get needRestart => 'Параметрлерди колдонуу үчүн серверди кайра иштетүү керек!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Түзмөктүн аты';
  @override
  String get deviceType => 'Түзмөктүн түрү';
  @override
  String get deviceModel => 'Түзмөктүн модели';
  @override
  String get port => 'Порт';
  @override
  String get network => 'Тармак';
  @override
  late final _Translations$settingsTab$network$networkOptions$ky networkOptions = _Translations$settingsTab$network$networkOptions$ky._(_root);
  @override
  String get discoveryTimeout => 'Түзмөктөрдү табуу тайм-ауту';
  @override
  String get useSystemName => 'Системалык аталышты колдонуу';
  @override
  String get generateRandomAlias => 'Кокус түзмөктүн атын түзүү';
  @override
  String portWarning({required Object defaultPort}) =>
      'Башка порт колдонулуп жаткандыктан, башка түзмөктөр сизди таппай калышы мүмкүн. (демейки: ${defaultPort})';
  @override
  String get encryption => 'Шифрлөө';
  @override
  String get multicastGroup => 'Мультикаст дареги';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Башка мультикаст дареги колдонулуп жаткандыктан, башка түзмөктөр сизди таппай калышы мүмкүн. (демейки: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ky extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Башка';
  @override
  String get support => 'LocalSend\'ди колдоо';
  @override
  String get donate => 'Кайрымдуулук кылуу';
  @override
  String get privacyPolicy => 'Купуялуулук саясаты';
  @override
  String get termsOfUse => 'Колдонуу шарттары';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$ky extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Бул түзмөк башка түзмөктөргө файл жөнөтө алат, бирок башка түзмөктөр буга жөнөтө алышпайт.';
  @override
  String solution({required Object port}) =>
      'Бул көбүнчө брандмауэр көйгөйү. ${port} порту үчүн кирүүчү байланыштарга (UDP жана TCP) уруксат берүү менен муну чечсеңиз болот.';
  @override
  String get openFirewall => 'Брандмауэрди ачуу';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ky extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Бул түзмөк башка түзмөктөрдү таба албай жатат.';
  @override
  String get solution =>
      'Эки түзмөк тең бир Wi-Fi тармагында жана бирдей конфигурацияда (порт, мультикаст дареги, шифрлөө) экенин текшериңиз. Түзмөктүн IP дарегин кол менен киргизип көрсөңүз болот. Эгер бул иштесе, келечекте автоматтык түрдө табуу үчүн түзмөктү тандалмаларга кошуп коюңуз.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ky extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Эки түзмөк тең бири-бирин таба албайт жана файлдар менен бөлүшө албайт.';
  @override
  String get solution =>
      'Көйгөй эки тарапта тең барбы? Эгер ошондой болсо, эки түзмөк тең бир Wi-Fi тармагында экенин жана жөндөөлөрү бирдей экенин текшериңиз. Wi-Fi тармагы түзмөктөр ортосундагы байланышка бөгөт коюшу мүмкүн (AP обочолонуусу). Бул учурда маршрутизатордо бул параметрди өчүрүү керек.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ky extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Файлды ачуу';
  @override
  String get showInFolder => 'Папкада көрсөтүү';
  @override
  String get info => 'Маалымат';
  @override
  String get deleteFromHistory => 'Тарыхтан өчүрүү';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$ky extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Түзмөктүн аты';
  @override
  String get address => 'Дарек';
  @override
  String get version => 'Версия';
  @override
  String protocol({required Object version}) => 'Протокол v${version}';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$ky extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Журналдар';
  @override
  String get empty => 'Журналдар жок.';
  @override
  String discovered({required Object protocol, required Object host}) => '${protocol} аркылуу табылды (${host})';
  @override
  String updated({required Object protocol, required Object host}) => '${protocol} аркылуу жаңыртылды (${host})';
}

// Path: progressPage.total
class _Translations$progressPage$total$ky extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ky title = _Translations$progressPage$total$title$ky._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлдар: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Көлөмү: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Тездиги: ${speed}/с';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$ky extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ky'))(
    m,
    other: '${m}мүн',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ky'))(
    h,
    other: '${h}саат',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$ky extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$ky v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$ky._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ky extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тандоого кошуу';
  @override
  String get content => 'Эмнени кошууну каалайсыз?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ky extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлды ачуу';
  @override
  String get content => 'Кабыл алынган файлды ачууну каалайсызбы?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ky extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Даректи киргизиңиз';
  @override
  String get recentlyUsed => 'Акыркы колдонулгандар: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$ky extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлдарды өткөрүүнү жокко чыгаруу';
  @override
  String get content => 'Файлдарды өткөрүүнү чын эле жокко чыгаргыңыз келеби?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ky extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлды ачууга мүмкүн болбоду';
  @override
  String content({required Object file}) => '"${file}" файлын ачуу мүмкүн болгон жок. Файл жылдырылган, аты өзгөртүлгөн же өчүрүлгөн болушу мүмкүн.';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ky extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрлөө өчүрүлгөн';
  @override
  String get content => 'Байланыш эми шифрленбеген HTTP протоколу аркылуу жүргүзүлөт. HTTPS протоколун колдонуу үчүн шифрлөөнү кайра күйгүзүңүз.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ky extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ky extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тандалмалар';
  @override
  String get noFavorites => 'Азырынча тандалма түзмөктөр жок.';
  @override
  String get addFavorite => 'Кошуу';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$ky extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тандалмалардан өчүрүү';
  @override
  String content({required Object name}) => '"${name}" түзмөгүн тандалмалардан өчүрүүнү каалайсызбы?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ky extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Тандалмаларга кошуу';
  @override
  String get titleEdit => 'Жөндөөлөр';
  @override
  String get name => 'Түзмөктүн аты';
  @override
  String get auto => '(автоматтык)';
  @override
  String get ip => 'IP-дарек';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$ky extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл жөнүндө маалымат';
  @override
  String get fileName => 'Файлдын аты:';
  @override
  String get path => 'Жол:';
  @override
  String get size => 'Көлөмү:';
  @override
  String get sender => 'Жөнөтүүчү:';
  @override
  String get time => 'Убакыт:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$ky extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлдын атын киргизиңиз';
  @override
  String original({required Object original}) => 'Түпнуска аты: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ky extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тарыхты тазалоо';
  @override
  String get content => 'Бүткүл тарыхты өчүрүүнү чын эле каалайсызбы?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ky extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend жергиликтүү тармакты сканерлөөгө уруксатсыз башка түзмөктөрдү таба албайт. Жөндөөлөрдөн бул уруксатты бериңиз.';
  @override
  String get gotoSettings => 'Жөндөөлөр';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ky extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Билдирүү жазуу';
  @override
  String get multiline => 'Көп саптуу';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ky extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Бир да файл тандалган жок';
  @override
  String get content => 'Сураныч, кем дегенде бир файл тандаңыз.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ky extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Уруксат жок';
  @override
  String get content => 'Сиз керектүү уруксаттарды берген жоксуз. Сураныч, аларды жөндөөлөрдөн бериңиз.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ky extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жеткиликсиз';
  @override
  String get content => 'Бул функция төмөнкү платформаларда гана жеткиликтүү:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ky extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ky extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тез аракеттер';
  @override
  String get counter => 'Эсептегич';
  @override
  String get prefix => 'Префикс';
  @override
  String get padZero => 'Башына нөлдөрдү кошуу';
  @override
  String get sortBeforeCount => 'Алдын ала алфавиттик тартипте сорттоо';
  @override
  String get random => 'Кокустук';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$ky extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Файл жөнөтүү сурамдары эми автоматтык түрдө кабыл алынат. Абайлаңыз, ушул жергиликтүү тармактагы каалаган колдонуучу сизге файл жөнөтө алат.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ky extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Файл жөнөтүү сурамдары эми тандалмалар тизмесиндеги түзмөктөрдөн автоматтык түрдө кабыл алынат.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$ky extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN-кодду киргизиңиз';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ky extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Жөнөтүү режимдери';
  @override
  String get single => 'Файлдарды бир кабыл алуучуга жөнөтөт. Өткөрүү аяктагандан кийин тандоо тазаланат.';
  @override
  String get multiple => 'Файлдарды бир нече кабыл алуучуга жөнөтөт. Өткөрүү аяктагандан кийин тандоо тазаланбайт.';
  @override
  String get link => 'LocalSend орнотулбаган кабыл алуучулар шилтемени браузерде ачып, тандалган файлдарды жүктөй алышат.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ky extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ky extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системалык';
  @override
  String get dark => 'Күңүрт';
  @override
  String get light => 'Жарык';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$ky extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системалык';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'Ыңгайлаштырылган';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ky extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Системалык';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ky extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Баары';
  @override
  String get filtered => 'Чыпкаланган';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ky extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Жалпы прогресс (${time})';
  @override
  String get finishedError => 'Ката менен аяктады';
  @override
  String get canceledSender => 'Жөнөтүүчү жокко чыгарды';
  @override
  String get canceledReceiver => 'Кабыл алуучу жокко чыгарды';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$ky extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$ky._(TranslationsKy root) : this._root = root, super.internal(root);

  final TranslationsKy _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Шифрлөө берилиштерди өткөрүүнү жайлатпайт. Эгер сиз аны мурда өчүргөн болсоңуз, ал кайра күйгүзүлдү.',
    'Тандалма түзмөктөрдөн келген сурамдар эми автоматтык түрдө кабыл алынат. Бул параметр демейки боюнча күйгүзүлгөн жана жөндөөлөрдөн өчүрүлөт.',
    'Android түзмөктөрүндө тиркеме фондо иштеп жатканда же экран өчүк кезде да берилиштер өткөрүлө берет. iOS түзмөктөрүндө тиркеме алдыңкы планда иштеп турушу керек.',
  ];
}
