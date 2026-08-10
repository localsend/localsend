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
class TranslationsMn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsMn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.mn,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <mn>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsMn _root = this; // ignore: unused_field

  @override
  TranslationsMn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsMn(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$mn general = _Translations$general$mn._(_root);
  @override
  late final _Translations$receiveTab$mn receiveTab = _Translations$receiveTab$mn._(_root);
  @override
  late final _Translations$sendTab$mn sendTab = _Translations$sendTab$mn._(_root);
  @override
  late final _Translations$settingsTab$mn settingsTab = _Translations$settingsTab$mn._(_root);
  @override
  late final _Translations$troubleshootPage$mn troubleshootPage = _Translations$troubleshootPage$mn._(_root);
  @override
  late final _Translations$networkInterfacesPage$mn networkInterfacesPage = _Translations$networkInterfacesPage$mn._(_root);
  @override
  late final _Translations$receiveHistoryPage$mn receiveHistoryPage = _Translations$receiveHistoryPage$mn._(_root);
  @override
  late final _Translations$apkPickerPage$mn apkPickerPage = _Translations$apkPickerPage$mn._(_root);
  @override
  late final _Translations$selectedFilesPage$mn selectedFilesPage = _Translations$selectedFilesPage$mn._(_root);
  @override
  late final _Translations$deviceDetailsPage$mn deviceDetailsPage = _Translations$deviceDetailsPage$mn._(_root);
  @override
  late final _Translations$verifyPage$mn verifyPage = _Translations$verifyPage$mn._(_root);
  @override
  late final _Translations$receivePage$mn receivePage = _Translations$receivePage$mn._(_root);
  @override
  late final _Translations$receiveOptionsPage$mn receiveOptionsPage = _Translations$receiveOptionsPage$mn._(_root);
  @override
  late final _Translations$sendPage$mn sendPage = _Translations$sendPage$mn._(_root);
  @override
  late final _Translations$progressPage$mn progressPage = _Translations$progressPage$mn._(_root);
  @override
  late final _Translations$webSharePage$mn webSharePage = _Translations$webSharePage$mn._(_root);
  @override
  late final _Translations$webReceivePage$mn webReceivePage = _Translations$webReceivePage$mn._(_root);
  @override
  late final _Translations$aboutPage$mn aboutPage = _Translations$aboutPage$mn._(_root);
  @override
  late final _Translations$donationPage$mn donationPage = _Translations$donationPage$mn._(_root);
  @override
  late final _Translations$changelogPage$mn changelogPage = _Translations$changelogPage$mn._(_root);
  @override
  late final _Translations$whatsNewPage$mn whatsNewPage = _Translations$whatsNewPage$mn._(_root);
  @override
  late final _Translations$dialogs$mn dialogs = _Translations$dialogs$mn._(_root);
  @override
  late final _Translations$sanitization$mn sanitization = _Translations$sanitization$mn._(_root);
  @override
  late final _Translations$tray$mn tray = _Translations$tray$mn._(_root);
  @override
  late final _Translations$web$mn web = _Translations$web$mn._(_root);
  @override
  late final _Translations$assetPicker$mn assetPicker = _Translations$assetPicker$mn._(_root);
}

// Path: general
class _Translations$general$mn extends Translations$general$en {
  _Translations$general$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Зөвшөөрөх';
  @override
  String get accepted => 'Зөвшөөрсөн';
  @override
  String get add => 'Нэмэх';
  @override
  String get advanced => 'Нэмэлт үйлчилгээ';
  @override
  String get cancel => 'Цуцлах';
  @override
  String get close => 'Хаах';
  @override
  String get confirm => 'Баталгаажуулах';
  @override
  String get continueStr => 'Үргэлжлүүлэх';
  @override
  String get copy => 'Хуулах';
  @override
  String get copiedToClipboard => 'Амжилттай хууллаа';
  @override
  String get decline => 'Татгалзах';
  @override
  String get done => 'Болсон';
  @override
  String get delete => 'Устгах';
  @override
  String get edit => 'Өөрчлөх';
  @override
  String get error => 'Алдаа';
  @override
  String get example => 'Жишээ';
  @override
  String get files => 'Файлууд';
  @override
  String get finished => 'Дууссан';
  @override
  String get hide => 'Нуух';
  @override
  String get off => 'Унтраах';
  @override
  String get offline => 'Оффлайн';
  @override
  String get on => 'Асаах';
  @override
  String get online => 'Онлайн';
  @override
  String get open => 'Нээх';
  @override
  String get queue => 'Хүлээгдэж байгаа';
  @override
  String get quickSave => 'Шууд хадгалах';
  @override
  String get quickSaveFromFavorites => '"Дуртай"-д зориулсан шуурхай хадгалалт';
  @override
  String get renamed => 'Дахин нэрлэсэн';
  @override
  String get reset => 'Өөрчлөлтүүдийг буцаах';
  @override
  String get restart => 'Дахин ачаалах';
  @override
  String get settings => 'Тохиргоо';
  @override
  String get skipped => 'Алгассан';
  @override
  String get start => 'Эхлэх';
  @override
  String get stop => 'Зогсоох';
  @override
  String get save => 'Хадгалах';
  @override
  String get unchanged => 'Өөрчлөгдөөгүй';
  @override
  String get unknown => 'Үл мэдэгдэх';
  @override
  String get noItemInClipboard => 'Санах ой хоосон байна.';
}

// Path: receiveTab
class _Translations$receiveTab$mn extends Translations$receiveTab$en {
  _Translations$receiveTab$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Авах';
  @override
  late final _Translations$receiveTab$infoBox$mn infoBox = _Translations$receiveTab$infoBox$mn._(_root);
  @override
  late final _Translations$receiveTab$quickSave$mn quickSave = _Translations$receiveTab$quickSave$mn._(_root);
  @override
  String get link => 'Холбоосоор хүлээн авах';
}

// Path: sendTab
class _Translations$sendTab$mn extends Translations$sendTab$en {
  _Translations$sendTab$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх';
  @override
  late final _Translations$sendTab$selection$mn selection = _Translations$sendTab$selection$mn._(_root);
  @override
  late final _Translations$sendTab$picker$mn picker = _Translations$sendTab$picker$mn._(_root);
  @override
  String get shareIntentInfo => 'Та өөрийн төхөөрөмжийн "Хуваалцах" цэсийг ашиглан файлуудаа хялбар сонгох боломжтой.';
  @override
  String get nearbyDevices => 'Ойролцоо төхөөрөмжүүд';
  @override
  String get thisDevice => 'Энэ төхөөрөмж';
  @override
  String get scan => 'Төхөөрөмжүүд хайх';
  @override
  String get manualSending => 'Гар аргаар хайх';
  @override
  String get sendMode => 'Илгээх горим';
  @override
  late final _Translations$sendTab$sendModes$mn sendModes = _Translations$sendTab$sendModes$mn._(_root);
  @override
  String get sendModeHelp => 'Тайлбар';
  @override
  String get help => 'Хүлээн авах төхөөрөмжийг адилхан Wi-Fi сүлжээнд байгаа эсэхийг шалгана уу.';
  @override
  String get placeItems => 'Хуваалцах зүйлсээ орулна уу.';
}

// Path: settingsTab
class _Translations$settingsTab$mn extends Translations$settingsTab$en {
  _Translations$settingsTab$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тохиргоо';
  @override
  late final _Translations$settingsTab$general$mn general = _Translations$settingsTab$general$mn._(_root);
  @override
  late final _Translations$settingsTab$receive$mn receive = _Translations$settingsTab$receive$mn._(_root);
  @override
  late final _Translations$settingsTab$send$mn send = _Translations$settingsTab$send$mn._(_root);
  @override
  late final _Translations$settingsTab$network$mn network = _Translations$settingsTab$network$mn._(_root);
  @override
  late final _Translations$settingsTab$other$mn other = _Translations$settingsTab$other$mn._(_root);
  @override
  String get advancedSettings => 'Нэмэлт тохиргоо';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$mn extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Асуудал илрүүлэх';
  @override
  String get subTitle => 'Апп нь санаснаар ажиллахгүй байна уу? Эндээс асуудлыг нийтлэг асуудалуудыг олох боломжтой.';
  @override
  String get solution => 'Шийдэл:';
  @override
  String get fixButton => 'Автоматаар засварлах';
  @override
  late final _Translations$troubleshootPage$firewall$mn firewall = _Translations$troubleshootPage$firewall$mn._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$mn noDiscovery = _Translations$troubleshootPage$noDiscovery$mn._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$mn noConnection = _Translations$troubleshootPage$noConnection$mn._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$mn extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сүлжээний интерфэйсүүд';
  @override
  String get info =>
      'Анхдагчаар LocalSend боломжтой бүх сүлжээний интерфэйсийг ашигладаг. Та хүсээгүй сүлжээг эндээс хасаж болно. Өөрчлөлтийг хэрэгжүүлэхийн тулд серверийг дахин эхлүүлэх шаардлагатай.';
  @override
  String get preview => 'Урьдчилан харах';
  @override
  String get whitelist => 'Цагаан жагсаалт';
  @override
  String get blacklist => 'Хар жагсаалт';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$mn extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Түүх';
  @override
  String get openFolder => 'Хавтас нээх';
  @override
  String get deleteHistory => 'Түүх устгах';
  @override
  String get empty => 'Түүх хоосон байна.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$mn entryActions = _Translations$receiveHistoryPage$entryActions$mn._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$mn extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Аппууд (APK)';
  @override
  String get excludeSystemApps => 'Системийн аппуудыг хасах';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Нээх боломжгүй аппуудыг хасах';
  @override
  String apps({required Object n}) => '${n} апп';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$mn extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Бүгдийг устгах';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$mn extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Төхөөрөмжийн дэлгэрэнгүй';
  @override
  String get favorite => 'Дуртай';
  @override
  String get verify => 'Баталгаажуулах';
  @override
  late final _Translations$deviceDetailsPage$info$mn info = _Translations$deviceDetailsPage$info$mn._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$mn logs = _Translations$deviceDetailsPage$logs$mn._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$mn extends Translations$verifyPage$en {
  _Translations$verifyPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Баталгаажуулах';
  @override
  String get icons => 'Дүрс тэмдэг';
  @override
  String get text => 'Текст';
  @override
  String get question => 'Нөгөө төхөөрөмж дээр адилхан харагдаж байна уу?';
}

// Path: receivePage
class _Translations$receivePage$mn extends Translations$receivePage$en {
  _Translations$receivePage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
    n,
    one: 'танруу файл явуулахыг хүсэж байна',
    other: 'танруу ${n} файл явуулахыг хүсэж байна',
  );
  @override
  String get subTitleMessage => 'танруу зурвас илгээлээ:';
  @override
  String get subTitleLink => 'танруу холбоос илгээлээ:';
  @override
  String get canceled => 'Илгээгч хүсэлтийг цуцалсан байна.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$mn extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголтын тохиргоо';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-н хавтас)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Хавтсууд байгаа учир автоматаар унтраалаа.';
}

// Path: sendPage
class _Translations$sendPage$mn extends Translations$sendPage$en {
  _Translations$sendPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Шалгах нийлбэрийг тооцоолж байна (${curr} / ${n})';
  @override
  String get waiting => 'Хариу хүлээж байна…';
  @override
  String get rejected => 'Хүлээн авагч хүсэлтйиг татгалзлаа.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Хүлээн авагч өөр хүсэлт авсан тул завгүй байна.';
}

// Path: progressPage
class _Translations$progressPage$mn extends Translations$progressPage$en {
  _Translations$progressPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Файлууд илгээж байна';
  @override
  String get titleReceiving => 'Файлыг татаж байна';
  @override
  String get savedToGallery => 'Photos дээр амжилттай хадгаллаа';
  @override
  late final _Translations$progressPage$total$mn total = _Translations$progressPage$total$mn._(_root);
  @override
  late final _Translations$progressPage$remainingTime$mn remainingTime = _Translations$progressPage$remainingTime$mn._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$mn extends Translations$webSharePage$en {
  _Translations$webSharePage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Линкээр хуваалцах';
  @override
  String get loading => 'Сервер эхэлж байна…';
  @override
  String get stopping => 'Сервер зогсож байна…';
  @override
  String get error => 'Сервер асаахад алдаа гарлаа.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
    n,
    one: 'Энэ холбоосыг browser дээрээ нээнэ үү:',
    other: 'Уг линкийн аль нэгрүү орно уу:',
  );
  @override
  String get requests => 'Хүсэлтүүд';
  @override
  String get noRequests => 'Одоогоор хүсэлт байхгүй байна.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Хүсэлтийг автоматаар авах';
  @override
  String get requirePin => 'PIN код ашиглах';
  @override
  String pinHint({required Object pin}) => 'PIN код: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend нь өөрийн гарын үсэг ашигладаг тул үүнийг browser дээрээ хүлээн зөвшөөрнө үү.';
  @override
  String pendingRequests({required Object n}) => 'Хүлээгдэж буй хүсэлт: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$mn extends Translations$webReceivePage$en {
  _Translations$webReceivePage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Холбоосоор хүлээн авах';
}

// Path: aboutPage
class _Translations$aboutPage$mn extends Translations$aboutPage$en {
  _Translations$aboutPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend танилцуулга';
  @override
  List<String> get description => [
    'LocalSend нь үнэгүй, нээлттэй эхийн програм бөгөөд танд интернет холболт шаардлагагүйгээр өөрийн дотоод сүлжээгээр ойролцоох төхөөрөмжүүдтэй файл, мессежийг аюулгүйгээр хуваалцах боломтой.',
    'Энэ програмыг Android, iOS, macOS, Windows болон Linux дээр ашиглах боломжтой. Та албан ёсны веб сайтнаас татах боломжтой.',
  ];
  @override
  String get author => 'Эзэмшигч';
  @override
  String get contributors => 'Хамт тусалсан';
  @override
  String get packagers => 'Багцлагчид';
  @override
  String get translators => 'Орчуулагч нар';
}

// Path: donationPage
class _Translations$donationPage$mn extends Translations$donationPage$en {
  _Translations$donationPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хандив';
  @override
  String get info =>
      'LocalSend нь үнэ төлбөргүй, нээлттэй эх сурвалжтай бөгөөд ямар ч зар сурталчилгаагүй. Хэрэв энэ програм таалагдсан бол хандивын мөнгөөр хөгжлийг дэмжих боломжтой.';
  @override
  String donate({required Object amount}) => '${amount} аар хандивлах';
  @override
  String get thanks => 'Маш их баярлалаа!';
  @override
  String get restore => 'Буцаах';
}

// Path: changelogPage
class _Translations$changelogPage$mn extends Translations$changelogPage$en {
  _Translations$changelogPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шинэчлэлт';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$mn extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => '${version} хувилбарын шинэлэг зүйлс';
  @override
  late final _Translations$whatsNewPage$changes$mn changes = _Translations$whatsNewPage$changes$mn._(_root);
}

// Path: dialogs
class _Translations$dialogs$mn extends Translations$dialogs$en {
  _Translations$dialogs$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$mn addFile = _Translations$dialogs$addFile$mn._(_root);
  @override
  late final _Translations$dialogs$openFile$mn openFile = _Translations$dialogs$openFile$mn._(_root);
  @override
  late final _Translations$dialogs$addressInput$mn addressInput = _Translations$dialogs$addressInput$mn._(_root);
  @override
  late final _Translations$dialogs$cancelSession$mn cancelSession = _Translations$dialogs$cancelSession$mn._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$mn cannotOpenFile = _Translations$dialogs$cannotOpenFile$mn._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$mn encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$mn._(_root);
  @override
  late final _Translations$dialogs$errorDialog$mn errorDialog = _Translations$dialogs$errorDialog$mn._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$mn favoriteDialog = _Translations$dialogs$favoriteDialog$mn._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$mn favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$mn._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$mn favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$mn._(_root);
  @override
  late final _Translations$dialogs$fileInfo$mn fileInfo = _Translations$dialogs$fileInfo$mn._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$mn fileNameInput = _Translations$dialogs$fileNameInput$mn._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$mn historyClearDialog = _Translations$dialogs$historyClearDialog$mn._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$mn localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$mn._(_root);
  @override
  late final _Translations$dialogs$messageInput$mn messageInput = _Translations$dialogs$messageInput$mn._(_root);
  @override
  late final _Translations$dialogs$noFiles$mn noFiles = _Translations$dialogs$noFiles$mn._(_root);
  @override
  late final _Translations$dialogs$noPermission$mn noPermission = _Translations$dialogs$noPermission$mn._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$mn notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$mn._(_root);
  @override
  late final _Translations$dialogs$qr$mn qr = _Translations$dialogs$qr$mn._(_root);
  @override
  late final _Translations$dialogs$quickActions$mn quickActions = _Translations$dialogs$quickActions$mn._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$mn quickSaveNotice = _Translations$dialogs$quickSaveNotice$mn._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$mn quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$mn._(_root);
  @override
  late final _Translations$dialogs$pin$mn pin = _Translations$dialogs$pin$mn._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$mn sendModeHelp = _Translations$dialogs$sendModeHelp$mn._(_root);
  @override
  late final _Translations$dialogs$zoom$mn zoom = _Translations$dialogs$zoom$mn._(_root);
}

// Path: sanitization
class _Translations$sanitization$mn extends Translations$sanitization$en {
  _Translations$sanitization$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Файлын нэр хоосон байж болохгүй';
  @override
  String get invalid => 'Файлын нэр буруу тэмдэгт агуулж байна';
}

// Path: tray
class _Translations$tray$mn extends Translations$tray$en {
  _Translations$tray$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend-с гарах';
  @override
  String get closeWindows => 'Гарах';
}

// Path: web
class _Translations$web$mn extends Translations$web$en {
  _Translations$web$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN код оруулах';
  @override
  String get invalidPin => 'Буруу PIN';
  @override
  String get tooManyAttempts => 'Хэт олон оролдлого';
  @override
  String get rejected => 'Татгалзсан';
  @override
  String get files => 'Файлууд';
  @override
  String get fileName => 'Файлын нэр';
  @override
  String get size => 'Хэмжээ';
}

// Path: assetPicker
class _Translations$assetPicker$mn extends Translations$assetPicker$en {
  _Translations$assetPicker$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Батлах';
  @override
  String get cancel => 'Цуцлах';
  @override
  String get edit => 'Засах';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Ачаалж чадсангүй';
  @override
  String get original => 'Эх';
  @override
  String get preview => 'Урьдчилан харах';
  @override
  String get select => 'Сонгох';
  @override
  String get emptyList => 'Хоосон жагсаалт';
  @override
  String get unSupportedAssetType => 'Дэмжигдээгүй файлын төрөл.';
  @override
  String get unableToAccessAll => 'Төхөөрөмж дээрх бүх файлд хандах боломжгүй';
  @override
  String get viewingLimitedAssetsTip => 'Зөвхөн аппд хандах боломжтой файл болон цомгуудыг харна.';
  @override
  String get changeAccessibleLimitedAssets => 'Хандах боломжтой файлуудыг шинэчлэхийн тулд дарна уу';
  @override
  String get accessAllTip =>
      'Апп төхөөрөмж дээрх зарим файлд л хандах боломжтой. Системийн тохиргоо руу орж аппд төхөөрөмжийн бүх медиад хандахыг зөвшөөрнө үү.';
  @override
  String get goToSystemSettings => 'Системийн тохиргоо руу очих';
  @override
  String get accessLimitedAssets => 'Хязгаарлагдмал хандалтаар үргэлжлүүлэх';
  @override
  String get accessiblePathName => 'Хандах боломжтой файлууд';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Зураг';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Бусад медиа';
  @override
  String get sActionPlayHint => 'тоглуулах';
  @override
  String get sActionPreviewHint => 'урьдчилан харах';
  @override
  String get sActionSelectHint => 'сонгох';
  @override
  String get sActionSwitchPathLabel => 'зам солих';
  @override
  String get sActionUseCameraHint => 'камер ашиглах';
  @override
  String get sNameDurationLabel => 'үргэлжлэх хугацаа';
  @override
  String get sUnitAssetCountLabel => 'тоо';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$mn extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP хаяг:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Төхөөрөмжийн нэр:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$mn extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Хадгалсан';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$mn extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголт';
  @override
  String files({required Object files}) => 'Файлууд: ${files}';
  @override
  String size({required Object size}) => 'Хэмжээ: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$mn extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Хавтас';
  @override
  String get media => 'Медиа';
  @override
  String get text => 'Бичвэр';
  @override
  String get app => 'Апп';
  @override
  String get clipboard => 'Санах ойгоос буулгах';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$mn extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Ганц хүлээн авагч';
  @override
  String get multiple => 'Олон хүлээн авагч';
  @override
  String get link => 'Холбоосоор хуваалцах';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$mn extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ерөнхий';
  @override
  String get brightness => 'Үзэмж';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$mn brightnessOptions = _Translations$settingsTab$general$brightnessOptions$mn._(
    _root,
  );
  @override
  String get color => 'Өнгө';
  @override
  late final _Translations$settingsTab$general$colorOptions$mn colorOptions = _Translations$settingsTab$general$colorOptions$mn._(_root);
  @override
  String get language => 'Хэл';
  @override
  late final _Translations$settingsTab$general$languageOptions$mn languageOptions = _Translations$settingsTab$general$languageOptions$mn._(_root);
  @override
  String get saveWindowPlacement => 'Гарсаны дараа цонхны байрлал хадгалах';
  @override
  String get saveWindowPlacementWindows => 'Гарсаны дараа цонхны байрлал хадгалах';
  @override
  String get minimizeToTray => 'Цонх хаах үед програмыг нуух';
  @override
  String get launchAtStartup => 'Нэвтрэх үед хамт нээх';
  @override
  String get launchMinimized => 'Авто эхлүүлэх: Нуугдсан эхлэх';
  @override
  String get showInContextMenu => 'Системийн цэсэнд LocalSend-д харуулах';
  @override
  String get animations => 'Анимэйшн';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$mn extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Авах';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Авто-дуусгах';
  @override
  String get destination => 'Хавтаст хадгалах';
  @override
  String get downloads => '(Татсан файлууд)';
  @override
  String get saveToGallery => 'Зургийн санд хадгалах';
  @override
  String get saveToHistory => 'Түүхэнд хадгалах';
  @override
  String get verifyChecksums => 'Файл хүлээн авахдаа шалгах нийлбэрийг баталгаажуулах';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$mn extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх';
  @override
  String get shareViaLinkAutoAccept => '"Холбоосоор илгээх" горимын хүсэлтүүдийн шууд зөвшөөрөх';
  @override
  String get createChecksums => 'Файл илгээхдээ шалгах нийлбэр үүсгэх';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$mn extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сүлжээ';
  @override
  String get needRestart => 'Серверийг дахин ачаалж тохиргоог идэвхжүүлнэ үү!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Төхөөрөмжийн нэр';
  @override
  String get deviceType => 'Төхөөрөмжийн төрөл';
  @override
  String get deviceModel => 'Төхөөрөмжийг модел';
  @override
  String get port => 'Порт';
  @override
  String get network => 'Сүлжээ';
  @override
  late final _Translations$settingsTab$network$networkOptions$mn networkOptions = _Translations$settingsTab$network$networkOptions$mn._(_root);
  @override
  String get discoveryTimeout => 'Хайх хүчинтэй хугацаа';
  @override
  String get useSystemName => 'Системийн нэр ашиглах';
  @override
  String get generateRandomAlias => 'Санамсаргүй нэр үүсгэх';
  @override
  String portWarning({required Object defaultPort}) =>
      'Та өөр порт ашиглаж байгаа тул бусад төхөөрөмжинд олдохгүй байж магадгүй . (өгөгдмөл: ${defaultPort})';
  @override
  String get encryption => 'Нууцлал';
  @override
  String get multicastGroup => 'Мультикаст хаяг';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Хувийн multicast хаяг ашиглаж үед бусад төхөөрөмжид илрэхгүй байх магадлалтай. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$mn extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Бусад';
  @override
  String get support => 'LocalSend-г дэмжих';
  @override
  String get donate => 'Хандив өгөх';
  @override
  String get privacyPolicy => 'Нууцлалын бодлого';
  @override
  String get termsOfUse => 'Ашиглах нөхцөл';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$mn extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Энэ төрөөрөмж бусадруу файл илгээж чадаж байгаа ч бусад төхөөрөмж энэ төхөөрөмжрүү илгээж чадахгүй байна.';
  @override
  String solution({required Object port}) =>
      'Энэ нь ихэвчлэн firewall-н асуудл байдаг. Та ${port} дээр ирж буй холболтыг (UDP ба TCP) зөвшөөрч шийдвэрлэх боломжтой.';
  @override
  String get openFirewall => 'Firewall-г нээх';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$mn extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Энэ төхөөрөмж бусад төхөөрөмжийг илрүүлж чадахгүй байна.';
  @override
  String get solution =>
      'Бүх төхөөрөмж адилхан Wi-Fi сүлжээнд орсон, адилхан тохиргоотой (порт, мультикаст хаяг, нууцлал) эсэхийг шалгана уу. Мөн төхөөрөмжийн IP хаягийг гараар оруулж үзнэ үү. Хэрэв болж байвал тухайн төхөөрөмжийг "Хадгалсан" хэсэгт нэмж дараа нь автоматаар таниулаарай.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$mn extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Төхөөрөмжүүд бие биенийгээ танихгүй, файл хуваалцаж чадахгүй байна.';
  @override
  String get solution =>
      'Хоёр талдаа ажиллахгүй байна уу? Хэрэв тийм бол хоёр төхөөрөмж ижил Wi-Fi сүлжээнд байгаа эсэхийг эсвэл ижил тохиргоотой (порт, multicast хаяг, шифрлэлт) байгаа эсэхийг шалгана уу. Wi-Fi сүлжээ эсвэл Acess Point (AP) төхөөрөмж хоорондын харилцааг хаасан байж магадгүй. Энэ тохиолдолд Wi-Fi төхөөрөмжийн тохиргоог өөрчлөнө үү.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$mn extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Файл нээх';
  @override
  String get showInFolder => 'Хавтаст харуулах';
  @override
  String get info => 'Мэдээлэл';
  @override
  String get deleteFromHistory => 'Түүхээс устгах';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$mn extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Нэр';
  @override
  String get address => 'Хаяг';
  @override
  String get version => 'Хувилбар';
  @override
  String protocol({required Object version}) => 'Протокол v${version}';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$mn extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Логууд';
  @override
  String get empty => 'Лог байхгүй байна.';
  @override
  String discovered({required Object protocol, required Object host}) => '${protocol}-оор илэрсэн (${host})';
  @override
  String updated({required Object protocol, required Object host}) => '${protocol}-оор шинэчлэгдсэн (${host})';
}

// Path: progressPage.total
class _Translations$progressPage$total$mn extends Translations$progressPage$total$en {
  _Translations$progressPage$total$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$mn title = _Translations$progressPage$total$title$mn._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файл: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Хэмжээ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Хурд: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$mn extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
    m,
    other: '${m}м',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
    h,
    other: '${h}ц',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$mn extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$mn v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$mn._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$mn extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголтод нэмэх';
  @override
  String get content => 'Та юу нэмэхийг хүсэж байна?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$mn extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл нээх';
  @override
  String get content => 'Хүлээн авсан файлыг нээх үү?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$mn extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хаяг оруулах';
  @override
  String get recentlyUsed => 'Саяхан ашигласан: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$mn extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл дамжуулалтыг цуцлах';
  @override
  String get content => 'Та файл дамжуулалтыг үнэхээр цуцлах уу?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$mn extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлыг нээж чадсангүй';
  @override
  String content({required Object file}) => '"${file}"-г нээж чадсангүй. Энэ файл зөөгдсөн, нэр нь өөрчлөгдсөн эсвэл устгагдсан уу?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$mn extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрлэлт идэвхгүй';
  @override
  String get content => 'Харилцаа одоо шифрлэгдээгүй HTTP протоколоор явагдаж байна. HTTPS протокол ашиглахын тулд шифрлэлтийг дахин идэвхжүүлнэ үү.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$mn extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$mn extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дуртай';
  @override
  String get noFavorites => 'Одоогоор дуртай төхөөрөмж алга.';
  @override
  String get addFavorite => 'Нэмэх';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$mn extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дуртайгаас устгах';
  @override
  String content({required Object name}) => 'Та "${name}"-г дуртайгаас үнэхээр устгах уу?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$mn extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Дуртайд нэмэх';
  @override
  String get titleEdit => 'Тохиргоо';
  @override
  String get name => 'Төхөөрөмжийн нэр';
  @override
  String get auto => '(авто)';
  @override
  String get ip => 'IP хаяг';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$mn extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлын мэдээлэл';
  @override
  String get fileName => 'Файлын нэр:';
  @override
  String get path => 'Зам:';
  @override
  String get size => 'Хэмжээ:';
  @override
  String get sender => 'Илгээгч:';
  @override
  String get time => 'Цаг:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$mn extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлын нэр оруулах';
  @override
  String original({required Object original}) => 'Эх нэр: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$mn extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Түүхийг цэвэрлэх';
  @override
  String get content => 'Та бүх түүхийг үнэхээр устгах уу?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$mn extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Дотоод сүлжээг скан хийх зөвшөөрөлгүйгээр LocalSend бусад төхөөрөмжийг олж чадахгүй. Энэ зөвшөөрлийг тохиргооноос олгоно уу.';
  @override
  String get gotoSettings => 'Тохиргоо';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$mn extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мессеж бичих';
  @override
  String get multiline => 'Олон мөр';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$mn extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл сонгоогүй';
  @override
  String get content => 'Дор хаяж нэг файл сонгоно уу.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$mn extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Зөвшөөрөл алга';
  @override
  String get content => 'Та шаардлагатай зөвшөөрлүүдийг олгоогүй байна. Тохиргооноос олгоно уу.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$mn extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Боломжгүй';
  @override
  String get content => 'Энэ боломж зөвхөн дараах дээр ажиллана:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$mn extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR код';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$mn extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шуурхай үйлдлүүд';
  @override
  String get counter => 'Тоолуур';
  @override
  String get prefix => 'Угтвар';
  @override
  String get padZero => 'Тэгээр дүүргэх';
  @override
  String get sortBeforeCount => 'Эхлээд цагаан толгойн дарааллаар эрэмбэлэх (A-Z)';
  @override
  String get random => 'Санамсаргүй';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$mn extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Файлын хүсэлтийг одоо автоматаар хүлээн авна. Дотоод сүлжээн дэх хэн ч танд файл илгээж болохыг анхаарна уу.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$mn extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Дуртай жагсаалтад байгаа төхөөрөмжүүдийн файлын хүсэлтийг одоо автоматаар хүлээн авна.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$mn extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN код оруулах';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$mn extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх горимууд';
  @override
  String get single => 'Нэг хүлээн авагчид файл илгээнэ. Дамжуулалт дууссаны дараа сонголт арилна.';
  @override
  String get multiple => 'Олон хүлээн авагчид файл илгээнэ. Дамжуулалт дууссаны дараа сонголт арилахгүй.';
  @override
  String get link => 'LocalSend суулгаагүй хүлээн авагчид холбоосыг хөтчөөрөө нээж сонгосон файлуудыг татаж авах боломжтой.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$mn extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$mn extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get dark => 'Харанхуй';
  @override
  String get light => 'Гэгээлэг';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$mn extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'Өөрийн';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$mn extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$mn extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Бүгд';
  @override
  String get filtered => 'Шүүсэн';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$mn extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Нийт хугацаа (${time})';
  @override
  String get finishedError => 'Амжилтгүй болсон';
  @override
  String get canceledSender => 'Явуулж байгаа хүн цуцаллаа';
  @override
  String get canceledReceiver => 'Хүлээн авагчийн хүсэлтээр цуцалсан';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$mn extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$mn._(TranslationsMn root) : this._root = root, super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Шифрлэлт дамжуулалтыг удаашруулахаа больсон. Хэрэв та өмнө нь унтраасан бол энэ төхөөрөмж дээр дахин идэвхжүүлсэн.',
    'Дуртай төхөөрөмжүүдийн хүсэлтийг одоо автоматаар хүлээн авдаг боллоо. Энэ нь анхдагчаар идэвхтэй бөгөөд тохиргооноос унтрааж болно.',
    'Android дээр апп ар талд байх эсвэл дэлгэц унтарсан үед дамжуулалт үргэлжилнэ. iOS дээр апп урд талд байх ёстой хэвээр.',
  ];
}
