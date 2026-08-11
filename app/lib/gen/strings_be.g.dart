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
class TranslationsBe extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsBe({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.be,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <be>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsBe _root = this; // ignore: unused_field

  @override
  TranslationsBe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBe(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$be general = _Translations$general$be._(_root);
  @override
  late final _Translations$receiveTab$be receiveTab = _Translations$receiveTab$be._(_root);
  @override
  late final _Translations$sendTab$be sendTab = _Translations$sendTab$be._(_root);
  @override
  late final _Translations$settingsTab$be settingsTab = _Translations$settingsTab$be._(_root);
  @override
  late final _Translations$troubleshootPage$be troubleshootPage = _Translations$troubleshootPage$be._(_root);
  @override
  late final _Translations$networkInterfacesPage$be networkInterfacesPage = _Translations$networkInterfacesPage$be._(_root);
  @override
  late final _Translations$receiveHistoryPage$be receiveHistoryPage = _Translations$receiveHistoryPage$be._(_root);
  @override
  late final _Translations$apkPickerPage$be apkPickerPage = _Translations$apkPickerPage$be._(_root);
  @override
  late final _Translations$selectedFilesPage$be selectedFilesPage = _Translations$selectedFilesPage$be._(_root);
  @override
  late final _Translations$deviceDetailsPage$be deviceDetailsPage = _Translations$deviceDetailsPage$be._(_root);
  @override
  late final _Translations$verifyPage$be verifyPage = _Translations$verifyPage$be._(_root);
  @override
  late final _Translations$receivePage$be receivePage = _Translations$receivePage$be._(_root);
  @override
  late final _Translations$receiveOptionsPage$be receiveOptionsPage = _Translations$receiveOptionsPage$be._(_root);
  @override
  late final _Translations$sendPage$be sendPage = _Translations$sendPage$be._(_root);
  @override
  late final _Translations$progressPage$be progressPage = _Translations$progressPage$be._(_root);
  @override
  late final _Translations$webSharePage$be webSharePage = _Translations$webSharePage$be._(_root);
  @override
  late final _Translations$webReceivePage$be webReceivePage = _Translations$webReceivePage$be._(_root);
  @override
  late final _Translations$aboutPage$be aboutPage = _Translations$aboutPage$be._(_root);
  @override
  late final _Translations$donationPage$be donationPage = _Translations$donationPage$be._(_root);
  @override
  late final _Translations$changelogPage$be changelogPage = _Translations$changelogPage$be._(_root);
  @override
  late final _Translations$whatsNewPage$be whatsNewPage = _Translations$whatsNewPage$be._(_root);
  @override
  late final _Translations$dialogs$be dialogs = _Translations$dialogs$be._(_root);
  @override
  late final _Translations$sanitization$be sanitization = _Translations$sanitization$be._(_root);
  @override
  late final _Translations$tray$be tray = _Translations$tray$be._(_root);
  @override
  late final _Translations$web$be web = _Translations$web$be._(_root);
  @override
  late final _Translations$assetPicker$be assetPicker = _Translations$assetPicker$be._(_root);
}

// Path: general
class _Translations$general$be extends Translations$general$en {
  _Translations$general$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Прыняць';
  @override
  String get accepted => 'Прынята';
  @override
  String get add => 'Дадаць';
  @override
  String get advanced => 'Пашыранае';
  @override
  String get cancel => 'Скасаваць';
  @override
  String get close => 'Закрыць';
  @override
  String get confirm => 'Пацвердзіць';
  @override
  String get continueStr => 'Працягнуць';
  @override
  String get copy => 'Капіраваць';
  @override
  String get copiedToClipboard => 'Скапіравана ў буфер абмену';
  @override
  String get decline => 'Адхіліць';
  @override
  String get done => 'Гатова';
  @override
  String get delete => 'Выдаліць';
  @override
  String get edit => 'Рэдагаваць';
  @override
  String get error => 'Памылка';
  @override
  String get example => 'Прыклад';
  @override
  String get files => 'Файлы';
  @override
  String get finished => 'Скончана';
  @override
  String get hide => 'Схаваць';
  @override
  String get off => 'Выкл.';
  @override
  String get offline => 'Па-за сеткай';
  @override
  String get on => 'Укл.';
  @override
  String get online => 'У сетцы';
  @override
  String get open => 'Адкрыць';
  @override
  String get queue => 'Чарга';
  @override
  String get quickSave => 'Хуткае захаванне';
  @override
  String get quickSaveFromFavorites => 'Хуткае захаванне для «Абраных»';
  @override
  String get renamed => 'Перайменавана';
  @override
  String get reset => 'Адрабіць змяненні';
  @override
  String get restart => 'Перазапусціць';
  @override
  String get settings => 'Налады';
  @override
  String get skipped => 'Прапушчана';
  @override
  String get start => 'Пачаць';
  @override
  String get stop => 'Спыніць';
  @override
  String get save => 'Захаваць';
  @override
  String get unchanged => 'Без змяненняў';
  @override
  String get unknown => 'Невядома';
  @override
  String get noItemInClipboard => 'Буфер абмену пусты.';
}

// Path: receiveTab
class _Translations$receiveTab$be extends Translations$receiveTab$en {
  _Translations$receiveTab$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Атрымаць';
  @override
  late final _Translations$receiveTab$infoBox$be infoBox = _Translations$receiveTab$infoBox$be._(_root);
  @override
  late final _Translations$receiveTab$quickSave$be quickSave = _Translations$receiveTab$quickSave$be._(_root);
  @override
  String get link => 'Атрымаць праз спасылку';
}

// Path: sendTab
class _Translations$sendTab$be extends Translations$sendTab$en {
  _Translations$sendTab$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Адправіць';
  @override
  late final _Translations$sendTab$selection$be selection = _Translations$sendTab$selection$be._(_root);
  @override
  late final _Translations$sendTab$picker$be picker = _Translations$sendTab$picker$be._(_root);
  @override
  String get shareIntentInfo => 'Вы таксама можаце выкарыстоўваць функцыю «Абагуліць» вашай мабільнай прылады, каб зручней выбіраць файлы.';
  @override
  String get nearbyDevices => 'Прылады побач';
  @override
  String get thisDevice => 'Гэта прылада';
  @override
  String get scan => 'Пошук прылад';
  @override
  String get manualSending => 'Ручная адпраўка';
  @override
  String get sendMode => 'Рэжым адпраўкі';
  @override
  late final _Translations$sendTab$sendModes$be sendModes = _Translations$sendTab$sendModes$be._(_root);
  @override
  String get sendModeHelp => 'Тлумачэнне';
  @override
  String get help => 'Упэўніцеся, што патрэбная прылада знаходзіцца ў той жа сетцы Wi-Fi.';
  @override
  String get placeItems => 'Змясціце элементы для абагульвання.';
}

// Path: settingsTab
class _Translations$settingsTab$be extends Translations$settingsTab$en {
  _Translations$settingsTab$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Налады';
  @override
  late final _Translations$settingsTab$general$be general = _Translations$settingsTab$general$be._(_root);
  @override
  late final _Translations$settingsTab$receive$be receive = _Translations$settingsTab$receive$be._(_root);
  @override
  late final _Translations$settingsTab$send$be send = _Translations$settingsTab$send$be._(_root);
  @override
  late final _Translations$settingsTab$network$be network = _Translations$settingsTab$network$be._(_root);
  @override
  late final _Translations$settingsTab$other$be other = _Translations$settingsTab$other$be._(_root);
  @override
  String get advancedSettings => 'Пашыраныя налады';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$be extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Выпраўленне непаладак';
  @override
  String get subTitle => 'Праграма не працуе належным чынам? Тут вы можаце знайсці рашэнні найбольш распаўсюджаных праблем.';
  @override
  String get solution => 'Рашэнне:';
  @override
  String get fixButton => 'Выправіць аўтаматычна';
  @override
  late final _Translations$troubleshootPage$firewall$be firewall = _Translations$troubleshootPage$firewall$be._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$be noDiscovery = _Translations$troubleshootPage$noDiscovery$be._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$be noConnection = _Translations$troubleshootPage$noConnection$be._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$be extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сеткавыя інтэрфейсы';
  @override
  String get info =>
      'Прадвызначана, LocalSend выкарыстоўвае ўсе даступныя сеткавыя інтэрфейсы. Тут вы можаце выключыць непажаданыя сеткі. Каб змяненні ўступілі ў сілу, трэба перазапусціць сервер.';
  @override
  String get preview => 'Перадпрагляд';
  @override
  String get whitelist => 'Белы спіс';
  @override
  String get blacklist => 'Чорны спіс';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$be extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Гісторыя';
  @override
  String get openFolder => 'Адкрыць папку';
  @override
  String get deleteHistory => 'Выдаліць гісторыю';
  @override
  String get empty => 'Гісторыя пустая.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$be entryActions = _Translations$receiveHistoryPage$entryActions$be._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$be extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Праграмы (APK)';
  @override
  String get excludeSystemApps => 'Выключыць сістэмныя праграмы';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Выключыць праграмы, якія не запускаюцца';
  @override
  String apps({required Object n}) => 'Праграм: ${n}';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$be extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Выдаліць усе';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$be extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Звесткі пра прыладу';
  @override
  String get favorite => 'Абранае';
  @override
  String get verify => 'Спраўдзіць';
  @override
  late final _Translations$deviceDetailsPage$info$be info = _Translations$deviceDetailsPage$info$be._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$be logs = _Translations$deviceDetailsPage$logs$be._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$be extends Translations$verifyPage$en {
  _Translations$verifyPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Спраўджванне';
  @override
  String get icons => 'Значкі';
  @override
  String get text => 'Тэкст';
  @override
  String get question => 'На іншай прыладзе паказана тое самае?';
}

// Path: receivePage
class _Translations$receivePage$be extends Translations$receivePage$en {
  _Translations$receivePage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('be'))(
    n,
    one: 'хоча адправіць вам файл',
    other: 'хоча адправіць вам файлы (${n})',
  );
  @override
  String get subTitleMessage => 'адправіў(-ла) вам паведамленне:';
  @override
  String get subTitleLink => 'адправіў(-ла) вам спасылку:';
  @override
  String get canceled => 'Адпраўнік скасаваў запыт.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$be extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Параметры';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Папка LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Аўтаматычна выключана з-за наяўнасці папак.';
}

// Path: sendPage
class _Translations$sendPage$be extends Translations$sendPage$en {
  _Translations$sendPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Ідзе разлік кантрольнай сумы (${curr} / ${n})';
  @override
  String get waiting => 'Чакаецца адказ…';
  @override
  String get rejected => 'Атрымальнік адхіліў запыт.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Атрымальнік заняты іншым запытам.';
}

// Path: progressPage
class _Translations$progressPage$be extends Translations$progressPage$en {
  _Translations$progressPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Адпраўка файлаў';
  @override
  String get titleReceiving => 'Атрыманне файлаў';
  @override
  String get savedToGallery => 'Захавана ў галерэі';
  @override
  late final _Translations$progressPage$total$be total = _Translations$progressPage$total$be._(_root);
  @override
  late final _Translations$progressPage$remainingTime$be remainingTime = _Translations$progressPage$remainingTime$be._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$be extends Translations$webSharePage$en {
  _Translations$webSharePage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Абагуліць праз спасылку';
  @override
  String get loading => 'Ідзе запуск сервера…';
  @override
  String get stopping => 'Ідзе спыненне сервера…';
  @override
  String get error => 'Узнікла памылка падчас запуску сервера.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('be'))(
    n,
    one: 'Адкрыйце гэтую спасылку ў браўзеры:',
    other: 'Адкрыйце адну з гэтых спасылак у браўзеры:',
  );
  @override
  String get requests => 'Запыты';
  @override
  String get noRequests => 'Няма запытаў.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Аўтаматычна прымаць запыты';
  @override
  String get requirePin => 'Патрабаваць PIN-код';
  @override
  String pinHint({required Object pin}) => 'PIN-код: «${pin}»';
  @override
  String get encryptionHint => 'LocalSend выкарыстоўвае самападпісаны сертыфікат. Вам трэба прыняць яго ў браўзеры.';
  @override
  String pendingRequests({required Object n}) => 'Запытаў у чаканні: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$be extends Translations$webReceivePage$en {
  _Translations$webReceivePage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Атрымаць праз спасылку';
}

// Path: aboutPage
class _Translations$aboutPage$be extends Translations$aboutPage$en {
  _Translations$aboutPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Пра LocalSend';
  @override
  List<String> get description => [
    'LocalSend — гэта бясплатная праграма з адкрытым зыходным кодам, якая дазваляе бяспечна абменьвацца файламі і паведамленнямі з прыладамі побач праз лакальную сетку без інтэрнэт-злучэння.',
    'Гэта праграма даступная на Android, iOS, macOS, Windows і Linux. Усе варыянты спампоўвання можна знайсці на афіцыйным сайце.',
  ];
  @override
  String get author => 'Аўтар';
  @override
  String get contributors => 'Суаўтары';
  @override
  String get packagers => 'Зборшчыкі';
  @override
  String get translators => 'Перакладчыкі';
}

// Path: donationPage
class _Translations$donationPage$be extends Translations$donationPage$en {
  _Translations$donationPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ахвяраваць';
  @override
  String get info =>
      'LocalSend — бясплатная праграма з адкрытым зыходным кодам і без рэкламы. Калі вам падабаецца праграма, вы можаце падтрымаць яе распрацоўку ахвяраваннем.';
  @override
  String donate({required Object amount}) => 'Ахвяраваць ${amount}';
  @override
  String get thanks => 'Шчыра дзякуем!';
  @override
  String get restore => 'Аднавіць куплю';
}

// Path: changelogPage
class _Translations$changelogPage$be extends Translations$changelogPage$en {
  _Translations$changelogPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Журнал змяненняў';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$be extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => 'Што новага ў ${version}';
  @override
  late final _Translations$whatsNewPage$changes$be changes = _Translations$whatsNewPage$changes$be._(_root);
}

// Path: dialogs
class _Translations$dialogs$be extends Translations$dialogs$en {
  _Translations$dialogs$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$be addFile = _Translations$dialogs$addFile$be._(_root);
  @override
  late final _Translations$dialogs$openFile$be openFile = _Translations$dialogs$openFile$be._(_root);
  @override
  late final _Translations$dialogs$addressInput$be addressInput = _Translations$dialogs$addressInput$be._(_root);
  @override
  late final _Translations$dialogs$cancelSession$be cancelSession = _Translations$dialogs$cancelSession$be._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$be cannotOpenFile = _Translations$dialogs$cannotOpenFile$be._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$be encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$be._(_root);
  @override
  late final _Translations$dialogs$errorDialog$be errorDialog = _Translations$dialogs$errorDialog$be._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$be favoriteDialog = _Translations$dialogs$favoriteDialog$be._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$be favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$be._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$be favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$be._(_root);
  @override
  late final _Translations$dialogs$fileInfo$be fileInfo = _Translations$dialogs$fileInfo$be._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$be fileNameInput = _Translations$dialogs$fileNameInput$be._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$be historyClearDialog = _Translations$dialogs$historyClearDialog$be._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$be localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$be._(_root);
  @override
  late final _Translations$dialogs$messageInput$be messageInput = _Translations$dialogs$messageInput$be._(_root);
  @override
  late final _Translations$dialogs$noFiles$be noFiles = _Translations$dialogs$noFiles$be._(_root);
  @override
  late final _Translations$dialogs$noPermission$be noPermission = _Translations$dialogs$noPermission$be._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$be notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$be._(_root);
  @override
  late final _Translations$dialogs$qr$be qr = _Translations$dialogs$qr$be._(_root);
  @override
  late final _Translations$dialogs$quickActions$be quickActions = _Translations$dialogs$quickActions$be._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$be quickSaveNotice = _Translations$dialogs$quickSaveNotice$be._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$be quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$be._(_root);
  @override
  late final _Translations$dialogs$pin$be pin = _Translations$dialogs$pin$be._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$be sendModeHelp = _Translations$dialogs$sendModeHelp$be._(_root);
  @override
  late final _Translations$dialogs$zoom$be zoom = _Translations$dialogs$zoom$be._(_root);
}

// Path: sanitization
class _Translations$sanitization$be extends Translations$sanitization$en {
  _Translations$sanitization$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Назва файла не можа быць пустой';
  @override
  String get invalid => 'Назва файла змяшчае недапушчальныя сімвалы';
}

// Path: tray
class _Translations$tray$be extends Translations$tray$en {
  _Translations$tray$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Выйсці з LocalSend';
  @override
  String get closeWindows => 'Выйсці';
}

// Path: web
class _Translations$web$be extends Translations$web$en {
  _Translations$web$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Увядзіце PIN-код';
  @override
  String get invalidPin => 'Памылковы PIN-код';
  @override
  String get tooManyAttempts => 'Занадта шмат спроб';
  @override
  String get rejected => 'Адхілена';
  @override
  String get files => 'Файлы';
  @override
  String get fileName => 'Назва файла';
  @override
  String get size => 'Памер';
}

// Path: assetPicker
class _Translations$assetPicker$be extends Translations$assetPicker$en {
  _Translations$assetPicker$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Пацвердзіць';
  @override
  String get cancel => 'Скасаваць';
  @override
  String get edit => 'Рэдагаваць';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Не ўдалося загрузіць';
  @override
  String get original => 'Арыгінал';
  @override
  String get preview => 'Перадпрагляд';
  @override
  String get select => 'Выбраць';
  @override
  String get emptyList => 'Спіс пусты';
  @override
  String get unSupportedAssetType => 'Тып файла не падтрымліваецца.';
  @override
  String get unableToAccessAll => 'Немагчыма атрымаць доступ да ўсіх файлаў на прыладзе';
  @override
  String get viewingLimitedAssetsTip => 'Праглядаць толькі файлы і альбомы, даступныя праграме.';
  @override
  String get changeAccessibleLimitedAssets => 'Націсніце, каб абнавіць даступныя файлы';
  @override
  String get accessAllTip =>
      'Праграма мае доступ толькі да некаторых файлаў на прыладзе. Перайдзіце ў налады сістэмы і дазвольце праграме доступ да ўсіх медыяфайлаў.';
  @override
  String get goToSystemSettings => 'Перайсці ў налады сістэмы';
  @override
  String get accessLimitedAssets => 'Працягнуць з абмежаваным доступам';
  @override
  String get accessiblePathName => 'Даступныя файлы';
  @override
  String get sTypeAudioLabel => 'Аўдыя';
  @override
  String get sTypeImageLabel => 'Відарыс';
  @override
  String get sTypeVideoLabel => 'Відэа';
  @override
  String get sTypeOtherLabel => 'Іншыя медыяфайлы';
  @override
  String get sActionPlayHint => 'прайграць';
  @override
  String get sActionPreviewHint => 'перадпрагляд';
  @override
  String get sActionSelectHint => 'выбраць';
  @override
  String get sActionSwitchPathLabel => 'змяніць шлях';
  @override
  String get sActionUseCameraHint => 'выкарыстоўваць камеру';
  @override
  String get sNameDurationLabel => 'працягласць';
  @override
  String get sUnitAssetCountLabel => 'колькасць';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$be extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP-адрас:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Назва прылады:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$be extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Абраныя';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$be extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Выбар';
  @override
  String files({required Object files}) => 'Файлаў: ${files}';
  @override
  String size({required Object size}) => 'Памер: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$be extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Папка';
  @override
  String get media => 'Медыя';
  @override
  String get text => 'Тэкст';
  @override
  String get app => 'Праграма';
  @override
  String get clipboard => 'Уставіць';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$be extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Адзін атрымальнік';
  @override
  String get multiple => 'Некалькі атрымальнікаў';
  @override
  String get link => 'Абагуліць праз спасылку';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$be extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Агульныя';
  @override
  String get brightness => 'Тэма';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$be brightnessOptions = _Translations$settingsTab$general$brightnessOptions$be._(
    _root,
  );
  @override
  String get color => 'Колер';
  @override
  late final _Translations$settingsTab$general$colorOptions$be colorOptions = _Translations$settingsTab$general$colorOptions$be._(_root);
  @override
  String get language => 'Мова';
  @override
  late final _Translations$settingsTab$general$languageOptions$be languageOptions = _Translations$settingsTab$general$languageOptions$be._(_root);
  @override
  String get saveWindowPlacement => 'Запамінаць пазіцыю акна пасля выхаду';
  @override
  String get saveWindowPlacementWindows => 'Запамінаць пазіцыю акна пасля выхаду';
  @override
  String get minimizeToTray => 'Згортваць у вобласць апавяшчэнняў/панэль меню пры закрыцці';
  @override
  String get launchAtStartup => 'Аўтазапуск пасля ўваходу';
  @override
  String get launchMinimized => 'Аўтазапуск: запускаць схаванай';
  @override
  String get showInContextMenu => 'Паказваць LocalSend у кантэкстным меню';
  @override
  String get animations => 'Анімацыі';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$be extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Атрыманне';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Заканчваць аўтаматычна';
  @override
  String get destination => 'Захоўваць у папку';
  @override
  String get downloads => '(Спампоўкі)';
  @override
  String get saveToGallery => 'Захоўваць медыя ў галерэю';
  @override
  String get saveToHistory => 'Захоўваць у гісторыю';
  @override
  String get verifyChecksums => 'Спраўджваць кантрольныя сумы пры атрыманні файлаў';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$be extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Адпраўка';
  @override
  String get shareViaLinkAutoAccept => 'Аўтаматычна прымаць запыты ў рэжыме «Абагуліць праз спасылку»';
  @override
  String get createChecksums => 'Ствараць кантрольныя сумы пры адпраўцы файлаў';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$be extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сетка';
  @override
  String get needRestart => 'Перазапусціце сервер, каб прымяніць налады!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Назва прылады';
  @override
  String get deviceType => 'Тып прылады';
  @override
  String get deviceModel => 'Мадэль прылады';
  @override
  String get port => 'Порт';
  @override
  String get network => 'Сетка';
  @override
  late final _Translations$settingsTab$network$networkOptions$be networkOptions = _Translations$settingsTab$network$networkOptions$be._(_root);
  @override
  String get discoveryTimeout => 'Час чакання выяўлення';
  @override
  String get useSystemName => 'Выкарыстоўваць сістэмную назву';
  @override
  String get generateRandomAlias => 'Стварыць выпадковую назву';
  @override
  String portWarning({required Object defaultPort}) =>
      'Іншыя прылады могуць не выявіць вас, бо вы выкарыстоўваеце ўласны порт. (Прадвызначана: ${defaultPort})';
  @override
  String get encryption => 'Шыфраванне';
  @override
  String get multicastGroup => 'Multicast-адрас';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Іншыя прылады могуць не выявіць вас, бо вы выкарыстоўваеце ўласны multicast-адрас. (Прадвызначана: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$be extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Іншае';
  @override
  String get support => 'Падтрымаць LocalSend';
  @override
  String get donate => 'Ахвяраваць';
  @override
  String get privacyPolicy => 'Палітыка прыватнасці';
  @override
  String get termsOfUse => 'Умовы карыстання';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$be extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Гэта прылада можа адпраўляць файлы на іншыя прылады, але іншыя прылады не могуць адпраўляць файлы на гэту прыладу.';
  @override
  String solution({required Object port}) =>
      'Хутчэй за ўсё, гэта праблема з міжсеткавым экранам. Вы можаце вырашыць яе, дазволіўшы ўваходныя злучэнні (UDP і TCP) на порце ${port}.';
  @override
  String get openFirewall => 'Адкрыць міжсеткавы экран';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$be extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Гэта прылада не можа выявіць іншыя прылады.';
  @override
  String get solution =>
      'Упэўніцеся, што ўсе прылады знаходзяцца ў адной сетцы Wi-Fi і маюць аднолькавую канфігурацыю (порт, multicast-адрас, шыфраванне). Вы можаце паспрабаваць увесці IP-адрас мэтавай прылады ўручную. Калі гэта спрацуе, паспрабуйце дадаць гэту прыладу ў абранае, каб яна магла аўтаматычна выяўляцца ў будучыні.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$be extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Абедзве прылады не могуць выявіць адна адну і не могуць абагульваць файлы.';
  @override
  String get solution =>
      'Ці існуе праблема з абодвух бакоў? Калі так, трэба ўпэўніцца, што абедзве прылады знаходзяцца ў адной сетцы Wi-Fi і маюць аднолькавую канфігурацыю (порт, multicast-адрас, шыфраванне). Сетка Wi-Fi можа не дазваляць сувязь паміж удзельнікамі з-за ізаляцыі пункта доступу (AP). У гэтым выпадку такі параметр трэба адключыць на маршрутызатары.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$be extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Адкрыць файл';
  @override
  String get showInFolder => 'Паказаць у папцы';
  @override
  String get info => 'Інфармацыя';
  @override
  String get deleteFromHistory => 'Выдаліць з гісторыі';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$be extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Назва';
  @override
  String get address => 'Адрас';
  @override
  String get version => 'Версія';
  @override
  String protocol({required Object version}) => 'Пратакол v${version}';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$be extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Журнал';
  @override
  String get empty => 'Няма запісаў у журнале.';
  @override
  String discovered({required Object protocol, required Object host}) => 'Выяўлена праз ${protocol} (${host})';
  @override
  String updated({required Object protocol, required Object host}) => 'Абноўлена праз ${protocol} (${host})';
}

// Path: progressPage.total
class _Translations$progressPage$total$be extends Translations$progressPage$total$en {
  _Translations$progressPage$total$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$be title = _Translations$progressPage$total$title$be._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файлаў: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Памер: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Хуткасць: ${speed}/с';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$be extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('be'))(
    m,
    other: '${m}хв',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('be'))(
    h,
    other: '${h}гадз',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$be extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$be v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$be._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$be extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дадаць да выбару';
  @override
  String get content => 'Што вы хочаце дадаць?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$be extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Адкрыць файл';
  @override
  String get content => 'Вы хочаце адкрыць атрыманы файл?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$be extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Увядзіце адрас';
  @override
  String get recentlyUsed => 'Нядаўнія: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$be extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Скасаваць перадачу файлаў';
  @override
  String get content => 'Вы сапраўды хочаце скасаваць перадачу файлаў?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$be extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Не ўдалося адкрыць файл';
  @override
  String content({required Object file}) => 'Не ўдалося адкрыць «${file}». Гэты файл быў перамешчаны, перайменаваны або выдалены?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$be extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шыфраванне адключана';
  @override
  String get content => 'Цяпер сувязь адбываецца праз незашыфраваны пратакол HTTP. Каб выкарыстоўваць пратакол HTTPS, зноў уключыце шыфраванне.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$be extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$be extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Абраныя';
  @override
  String get noFavorites => 'Пакуль няма абраных прылад.';
  @override
  String get addFavorite => 'Дадаць';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$be extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Выдаліць з абраных';
  @override
  String content({required Object name}) => 'Вы сапраўды хочаце выдаліць з абраных «${name}»?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$be extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Дадаць у абраныя';
  @override
  String get titleEdit => 'Налады';
  @override
  String get name => 'Назва прылады';
  @override
  String get auto => '(аўта)';
  @override
  String get ip => 'IP-адрас';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$be extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Звесткі пра файл';
  @override
  String get fileName => 'Назва файла:';
  @override
  String get path => 'Шлях:';
  @override
  String get size => 'Памер:';
  @override
  String get sender => 'Адпраўнік:';
  @override
  String get time => 'Час:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$be extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Увядзіце назву файла';
  @override
  String original({required Object original}) => 'Арыгінальная назва: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$be extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ачысціць гісторыю';
  @override
  String get content => 'Вы сапраўды хочаце выдаліць усю гісторыю?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$be extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend не можа знайсці іншыя прылады, не маючы дазволу на сканіраванне лакальнай сеткі. Дайце гэты дазвол у наладах.';
  @override
  String get gotoSettings => 'Налады';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$be extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Увядзіце паведамленне';
  @override
  String get multiline => 'Шматрадковае';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$be extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлы не выбраны';
  @override
  String get content => 'Выберыце хаця б адзін файл.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$be extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Няма дазволу';
  @override
  String get content => 'Вы не далі неабходныя дазволы. Дайце іх у наладах.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$be extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Недаступна';
  @override
  String get content => 'Гэта функцыя даступная толькі на:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$be extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$be extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хуткія дзеянні';
  @override
  String get counter => 'Лічыльнік';
  @override
  String get prefix => 'Прэфікс';
  @override
  String get padZero => 'Дадаць нулі ў пачатку';
  @override
  String get sortBeforeCount => 'Загадзя адсартаваць у алфавітным парадку (А-Я)';
  @override
  String get random => 'Выпадкова';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$be extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Запыты на адпраўку файлаў цяпер прымаюцца аўтаматычна. Майце на ўвазе, што ўсе карыстальнікі лакальнай сеткі могуць адпраўляць вам файлы.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$be extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Запыты на адпраўку файлаў цяпер прымаюцца аўтаматычна ад прылад са спісу абраных.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$be extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Увядзіце PIN-код';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$be extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Рэжымы адпраўкі';
  @override
  String get single => 'Адпраўляе файлы аднаму атрымальніку. Выбар будзе ачышчаны пасля заканчэння перадачы файлаў.';
  @override
  String get multiple => 'Адпраўляе файлы некалькім атрымальнікам. Выбар не будзе ачышчаны пасля заканчэння перадачы файлаў.';
  @override
  String get link => 'Атрымальнікі, у якіх не ўсталяваны LocalSend, могуць спампаваць выбраныя файлы, адкрыўшы спасылку ў браўзеры.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$be extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL-адрас';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$be extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Сістэмная';
  @override
  String get dark => 'Цёмная';
  @override
  String get light => 'Светлая';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$be extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Сістэмны';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'Уласны';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$be extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Сістэмная';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$be extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Усе';
  @override
  String get filtered => 'Фільтраваныя';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$be extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Агульны ход выканання (${time})';
  @override
  String get finishedError => 'Скончана з памылкай';
  @override
  String get canceledSender => 'Скасавана адпраўніком';
  @override
  String get canceledReceiver => 'Скасавана атрымальнікам';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$be extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$be._(TranslationsBe root) : this._root = root, super.internal(root);

  final TranslationsBe _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Шыфраванне больш не запавольвае перадачу. Калі вы раней выключылі яго на гэтай прыладзе, цяпер яно ўключана зноў.',
    'Запыты ад абраных прылад цяпер прымаюцца аўтаматычна. Гэтая функцыя ўключана прадвызначана, і яе можна адключыць у наладах.',
    'На Android перадача працягваецца, пакуль праграма працуе ў фонавым рэжыме ці экран выключаны. На iOS праграма па-ранейшаму мусіць заставацца на пярэднім плане.',
  ];
}
