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
class TranslationsUz extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsUz({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.uz,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <uz>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsUz _root = this; // ignore: unused_field

  @override
  TranslationsUz $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUz(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Oʻzbekcha';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$uz general = _Translations$general$uz._(_root);
  @override
  late final _Translations$receiveTab$uz receiveTab = _Translations$receiveTab$uz._(_root);
  @override
  late final _Translations$sendTab$uz sendTab = _Translations$sendTab$uz._(_root);
  @override
  late final _Translations$settingsTab$uz settingsTab = _Translations$settingsTab$uz._(_root);
  @override
  late final _Translations$troubleshootPage$uz troubleshootPage = _Translations$troubleshootPage$uz._(_root);
  @override
  late final _Translations$networkInterfacesPage$uz networkInterfacesPage = _Translations$networkInterfacesPage$uz._(_root);
  @override
  late final _Translations$receiveHistoryPage$uz receiveHistoryPage = _Translations$receiveHistoryPage$uz._(_root);
  @override
  late final _Translations$apkPickerPage$uz apkPickerPage = _Translations$apkPickerPage$uz._(_root);
  @override
  late final _Translations$selectedFilesPage$uz selectedFilesPage = _Translations$selectedFilesPage$uz._(_root);
  @override
  late final _Translations$receivePage$uz receivePage = _Translations$receivePage$uz._(_root);
  @override
  late final _Translations$receiveOptionsPage$uz receiveOptionsPage = _Translations$receiveOptionsPage$uz._(_root);
  @override
  late final _Translations$sendPage$uz sendPage = _Translations$sendPage$uz._(_root);
  @override
  late final _Translations$progressPage$uz progressPage = _Translations$progressPage$uz._(_root);
  @override
  late final _Translations$webSharePage$uz webSharePage = _Translations$webSharePage$uz._(_root);
  @override
  late final _Translations$aboutPage$uz aboutPage = _Translations$aboutPage$uz._(_root);
  @override
  late final _Translations$donationPage$uz donationPage = _Translations$donationPage$uz._(_root);
  @override
  late final _Translations$changelogPage$uz changelogPage = _Translations$changelogPage$uz._(_root);
  @override
  late final _Translations$dialogs$uz dialogs = _Translations$dialogs$uz._(_root);
  @override
  late final _Translations$sanitization$uz sanitization = _Translations$sanitization$uz._(_root);
  @override
  late final _Translations$tray$uz tray = _Translations$tray$uz._(_root);
  @override
  late final _Translations$web$uz web = _Translations$web$uz._(_root);
  @override
  late final _Translations$assetPicker$uz assetPicker = _Translations$assetPicker$uz._(_root);
}

// Path: general
class _Translations$general$uz extends Translations$general$en {
  _Translations$general$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Qabul qilish';
  @override
  String get accepted => 'Qabul qilindi';
  @override
  String get add => 'Qoʻshish';
  @override
  String get advanced => 'Qoʻshimcha';
  @override
  String get cancel => 'Bekor qilish';
  @override
  String get close => 'Yopish';
  @override
  String get confirm => 'Tasdiqlash';
  @override
  String get continueStr => 'Davom etish';
  @override
  String get copy => 'Nusxa olish';
  @override
  String get copiedToClipboard => 'Vaqtinchalik xotiraga nusxalandi';
  @override
  String get decline => 'Rad etish';
  @override
  String get done => 'Tayyor';
  @override
  String get delete => 'Oʻchirish';
  @override
  String get edit => 'Tahrirlash';
  @override
  String get error => 'Xato';
  @override
  String get example => 'Misol';
  @override
  String get files => 'Fayllar';
  @override
  String get finished => 'Tugadi';
  @override
  String get hide => 'Yashirish';
  @override
  String get off => 'Oʻchiq';
  @override
  String get offline => 'Oflayn';
  @override
  String get on => 'Yoniq';
  @override
  String get online => 'Onlayn';
  @override
  String get open => 'Ochish';
  @override
  String get queue => 'Navbat';
  @override
  String get quickSave => 'Tez saqlash';
  @override
  String get quickSaveFromFavorites => '"Sevimlilar" uchun tez saqlash';
  @override
  String get renamed => 'Nomi oʻzgartirildi';
  @override
  String get reset => 'Oʻzgarishlarni bekor qilish';
  @override
  String get restart => 'Qayta ishga tushirish';
  @override
  String get settings => 'Sozlamalar';
  @override
  String get skipped => 'Oʻtkazib yuborildi';
  @override
  String get start => 'Boshlash';
  @override
  String get stop => 'Toʻxtatish';
  @override
  String get save => 'Saqlash';
  @override
  String get unchanged => 'Oʻzgarishsiz';
  @override
  String get unknown => 'Nomaʼlum';
  @override
  String get noItemInClipboard => 'Vaqtinchalik xotirada element yoʻq.';
}

// Path: receiveTab
class _Translations$receiveTab$uz extends Translations$receiveTab$en {
  _Translations$receiveTab$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Qabul qilish';
  @override
  late final _Translations$receiveTab$infoBox$uz infoBox = _Translations$receiveTab$infoBox$uz._(_root);
  @override
  late final _Translations$receiveTab$quickSave$uz quickSave = _Translations$receiveTab$quickSave$uz._(_root);
}

// Path: sendTab
class _Translations$sendTab$uz extends Translations$sendTab$en {
  _Translations$sendTab$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yuborish';
  @override
  late final _Translations$sendTab$selection$uz selection = _Translations$sendTab$selection$uz._(_root);
  @override
  late final _Translations$sendTab$picker$uz picker = _Translations$sendTab$picker$uz._(_root);
  @override
  String get shareIntentInfo => 'Fayllarni osonroq tanlash uchun mobil qurilmangizning "Ulashish" funksiyasidan ham foydalanishingiz mumkin.';
  @override
  String get nearbyDevices => 'Yaqin atrofdagi qurilmalar';
  @override
  String get thisDevice => 'Bu qurilma';
  @override
  String get scan => 'Qurilmalarni qidirish';
  @override
  String get manualSending => 'Qoʻlda yuborish';
  @override
  String get sendMode => 'Yuborish rejimi';
  @override
  late final _Translations$sendTab$sendModes$uz sendModes = _Translations$sendTab$sendModes$uz._(_root);
  @override
  String get sendModeHelp => 'Tushuntirish';
  @override
  String get help => 'Kerakli qurilma ham bir xil Wi-Fi tarmogʻida ekanligiga ishonch hosil qiling.';
  @override
  String get placeItems => 'Ulashish uchun elementlarni joylashtiring.';
}

// Path: settingsTab
class _Translations$settingsTab$uz extends Translations$settingsTab$en {
  _Translations$settingsTab$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sozlamalar';
  @override
  late final _Translations$settingsTab$general$uz general = _Translations$settingsTab$general$uz._(_root);
  @override
  late final _Translations$settingsTab$receive$uz receive = _Translations$settingsTab$receive$uz._(_root);
  @override
  late final _Translations$settingsTab$send$uz send = _Translations$settingsTab$send$uz._(_root);
  @override
  late final _Translations$settingsTab$network$uz network = _Translations$settingsTab$network$uz._(_root);
  @override
  late final _Translations$settingsTab$other$uz other = _Translations$settingsTab$other$uz._(_root);
  @override
  String get advancedSettings => 'Qoʻshimcha sozlamalar';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$uz extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muammolarni bartaraf etish';
  @override
  String get subTitle => 'Ilova kutilganidek ishlamayaptimi? Bu yerda umumiy muammolarga baʼzi yechimlarni topishingiz mumkin.';
  @override
  String get solution => 'Yechim:';
  @override
  String get fixButton => 'Avtomatik tuzatish';
  @override
  late final _Translations$troubleshootPage$firewall$uz firewall = _Translations$troubleshootPage$firewall$uz._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$uz noDiscovery = _Translations$troubleshootPage$noDiscovery$uz._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$uz noConnection = _Translations$troubleshootPage$noConnection$uz._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$uz extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tarmoq interfeyslari';
  @override
  String get info =>
      'Standart holatda LocalSend barcha mavjud tarmoq interfeyslaridan foydalanadi. Bu yerda keraksiz tarmoqlarni chiqarib tashlashingiz mumkin. Oʻzgarishlarni qoʻllash uchun serverni qayta ishga tushirishingiz kerak.';
  @override
  String get preview => 'Oldindan koʻrish';
  @override
  String get whitelist => 'Ruxsat etilganlar roʻyxati';
  @override
  String get blacklist => 'Taqiqlanganlar roʻyxati';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$uz extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tarix';
  @override
  String get openFolder => 'Papkani ochish';
  @override
  String get deleteHistory => 'Tarixni oʻchirish';
  @override
  String get empty => 'Tarix boʻsh.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$uz entryActions = _Translations$receiveHistoryPage$entryActions$uz._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$uz extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ilovalar (APK)';
  @override
  String get excludeSystemApps => 'Tizim ilovalarini chiqarib tashlash';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Ishga tushmaydigan ilovalarni chiqarib tashlash';
  @override
  String apps({required Object n}) => '${n} ta ilova';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$uz extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Barchasini oʻchirish';
}

// Path: receivePage
class _Translations$receivePage$uz extends Translations$receivePage$en {
  _Translations$receivePage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uz'))(
    n,
    one: 'sizga fayl yubormoqchi',
    other: 'sizga ${n} ta fayl yubormoqchi',
  );
  @override
  String get subTitleMessage => 'sizga xabar yubordi:';
  @override
  String get subTitleLink => 'sizga havola yubordi:';
  @override
  String get canceled => 'Yuboruvchi soʻrovni bekor qildi.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$uz extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Parametrlar';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend papkasi)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Papkalar mavjud boʻlgani uchun avtomatik oʻchirildi.';
}

// Path: sendPage
class _Translations$sendPage$uz extends Translations$sendPage$en {
  _Translations$sendPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Javob kutilmoqda…';
  @override
  String get rejected => 'Qabul qiluvchi soʻrovni rad etdi.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Qabul qiluvchi boshqa soʻrov bilan band.';
}

// Path: progressPage
class _Translations$progressPage$uz extends Translations$progressPage$en {
  _Translations$progressPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Fayllar yuborilmoqda';
  @override
  String get titleReceiving => 'Fayllar qabul qilinmoqda';
  @override
  String get savedToGallery => 'Suratlarga saqlandi';
  @override
  late final _Translations$progressPage$total$uz total = _Translations$progressPage$total$uz._(_root);
  @override
  late final _Translations$progressPage$remainingTime$uz remainingTime = _Translations$progressPage$remainingTime$uz._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$uz extends Translations$webSharePage$en {
  _Translations$webSharePage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Havola orqali ulashish';
  @override
  String get loading => 'Server ishga tushirilmoqda…';
  @override
  String get stopping => 'Server toʻxtatilmoqda…';
  @override
  String get error => 'Serverni ishga tushirishda xato yuz berdi.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uz'))(
    n,
    one: 'Ushbu havolani brauzeringizda oching:',
    other: 'Ushbu havolalardan birini brauzeringizda oching:',
  );
  @override
  String get requests => 'Soʻrovlar';
  @override
  String get noRequests => 'Hali soʻrovlar yoʻq.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Soʻrovlarni avtomatik qabul qilish';
  @override
  String get requirePin => 'PIN talab qilish';
  @override
  String pinHint({required Object pin}) => 'PIN "${pin}"';
  @override
  String get encryptionHint => 'LocalSend oʻz-oʻzini imzolagan sertifikatdan foydalanadi. Uni brauzeringizda qabul qilishingiz kerak.';
  @override
  String pendingRequests({required Object n}) => 'Kutilayotgan soʻrovlar: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$uz extends Translations$aboutPage$en {
  _Translations$aboutPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend haqida';
  @override
  List<String> get description => [
    'LocalSend — bu bepul, ochiq manbali ilova boʻlib, u internet ulanishisiz mahalliy tarmoq orqali yaqin atrofdagi qurilmalar bilan fayllar va xabarlarni xavfsiz ulashish imkonini beradi.',
    'Ushbu ilova Android, iOS, macOS, Windows va Linuxda mavjud. Barcha yuklab olish variantlarini rasmiy sahifada topishingiz mumkin.',
  ];
  @override
  String get author => 'Muallif';
  @override
  String get contributors => 'Hissa qoʻshuvchilar';
  @override
  String get packagers => 'Paketlovchilar';
  @override
  String get translators => 'Tarjimonlar';
}

// Path: donationPage
class _Translations$donationPage$uz extends Translations$donationPage$en {
  _Translations$donationPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xayriya';
  @override
  String get info =>
      'LocalSend bepul, ochiq manbali va reklamasiz. Agar ilova sizga yoqqan boʻlsa, xayriya bilan rivojlanishni qoʻllab-quvvatlashingiz mumkin.';
  @override
  String donate({required Object amount}) => '${amount} xayriya qilish';
  @override
  String get thanks => 'Katta rahmat!';
  @override
  String get restore => 'Xaridni tiklash';
}

// Path: changelogPage
class _Translations$changelogPage$uz extends Translations$changelogPage$en {
  _Translations$changelogPage$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Oʻzgarishlar tarixi';
}

// Path: dialogs
class _Translations$dialogs$uz extends Translations$dialogs$en {
  _Translations$dialogs$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$uz addFile = _Translations$dialogs$addFile$uz._(_root);
  @override
  late final _Translations$dialogs$openFile$uz openFile = _Translations$dialogs$openFile$uz._(_root);
  @override
  late final _Translations$dialogs$addressInput$uz addressInput = _Translations$dialogs$addressInput$uz._(_root);
  @override
  late final _Translations$dialogs$cancelSession$uz cancelSession = _Translations$dialogs$cancelSession$uz._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$uz cannotOpenFile = _Translations$dialogs$cannotOpenFile$uz._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$uz encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$uz._(_root);
  @override
  late final _Translations$dialogs$errorDialog$uz errorDialog = _Translations$dialogs$errorDialog$uz._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$uz favoriteDialog = _Translations$dialogs$favoriteDialog$uz._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$uz favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$uz._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$uz favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$uz._(_root);
  @override
  late final _Translations$dialogs$fileInfo$uz fileInfo = _Translations$dialogs$fileInfo$uz._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$uz fileNameInput = _Translations$dialogs$fileNameInput$uz._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$uz historyClearDialog = _Translations$dialogs$historyClearDialog$uz._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$uz localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$uz._(_root);
  @override
  late final _Translations$dialogs$messageInput$uz messageInput = _Translations$dialogs$messageInput$uz._(_root);
  @override
  late final _Translations$dialogs$noFiles$uz noFiles = _Translations$dialogs$noFiles$uz._(_root);
  @override
  late final _Translations$dialogs$noPermission$uz noPermission = _Translations$dialogs$noPermission$uz._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$uz notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$uz._(_root);
  @override
  late final _Translations$dialogs$qr$uz qr = _Translations$dialogs$qr$uz._(_root);
  @override
  late final _Translations$dialogs$quickActions$uz quickActions = _Translations$dialogs$quickActions$uz._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$uz quickSaveNotice = _Translations$dialogs$quickSaveNotice$uz._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$uz quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$uz._(_root);
  @override
  late final _Translations$dialogs$pin$uz pin = _Translations$dialogs$pin$uz._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$uz sendModeHelp = _Translations$dialogs$sendModeHelp$uz._(_root);
  @override
  late final _Translations$dialogs$zoom$uz zoom = _Translations$dialogs$zoom$uz._(_root);
}

// Path: sanitization
class _Translations$sanitization$uz extends Translations$sanitization$en {
  _Translations$sanitization$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Fayl nomi boʻsh boʻlishi mumkin emas';
  @override
  String get invalid => 'Fayl nomida yaroqsiz belgilar mavjud';
}

// Path: tray
class _Translations$tray$uz extends Translations$tray$en {
  _Translations$tray$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSenddan chiqish';
  @override
  String get closeWindows => 'Chiqish';
}

// Path: web
class _Translations$web$uz extends Translations$web$en {
  _Translations$web$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN kiriting';
  @override
  String get invalidPin => 'Notoʻgʻri PIN';
  @override
  String get tooManyAttempts => 'Juda koʻp urinishlar';
  @override
  String get rejected => 'Rad etildi';
  @override
  String get files => 'Fayllar';
  @override
  String get fileName => 'Fayl nomi';
  @override
  String get size => 'Hajmi';
}

// Path: assetPicker
class _Translations$assetPicker$uz extends Translations$assetPicker$en {
  _Translations$assetPicker$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Tasdiqlash';
  @override
  String get cancel => 'Bekor qilish';
  @override
  String get edit => 'Tahrirlash';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Yuklab boʻlmadi';
  @override
  String get original => 'Asl';
  @override
  String get preview => 'Oldindan koʻrish';
  @override
  String get select => 'Tanlash';
  @override
  String get emptyList => 'Roʻyxat boʻsh';
  @override
  String get unSupportedAssetType => 'Qoʻllab-quvvatlanmaydigan fayl turi.';
  @override
  String get unableToAccessAll => 'Qurilmadagi barcha fayllarga kirib boʻlmadi';
  @override
  String get viewingLimitedAssetsTip => 'Faqat ilova kira oladigan fayllar va albomlarni koʻring.';
  @override
  String get changeAccessibleLimitedAssets => 'Kirish mumkin boʻlgan fayllarni yangilash uchun bosing';
  @override
  String get accessAllTip =>
      'Ilova qurilmadagi baʼzi fayllarga kira oladi. Tizim sozlamalariga oʻting va ilovaga qurilmadagi barcha mediaga kirishga ruxsat bering.';
  @override
  String get goToSystemSettings => 'Tizim sozlamalariga oʻtish';
  @override
  String get accessLimitedAssets => 'Cheklangan kirish bilan davom etish';
  @override
  String get accessiblePathName => 'Kirish mumkin boʻlgan fayllar';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Rasm';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Boshqa media';
  @override
  String get sActionPlayHint => 'ijro etish';
  @override
  String get sActionPreviewHint => 'oldindan koʻrish';
  @override
  String get sActionSelectHint => 'tanlash';
  @override
  String get sActionSwitchPathLabel => 'yoʻlni oʻzgartirish';
  @override
  String get sActionUseCameraHint => 'kameradan foydalanish';
  @override
  String get sNameDurationLabel => 'davomiylik';
  @override
  String get sUnitAssetCountLabel => 'soni';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$uz extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Qurilma nomi:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$uz extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Sevimlilar';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$uz extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tanlov';
  @override
  String files({required Object files}) => 'Fayllar: ${files}';
  @override
  String size({required Object size}) => 'Hajmi: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$uz extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fayl';
  @override
  String get folder => 'Papka';
  @override
  String get media => 'Media';
  @override
  String get text => 'Matn';
  @override
  String get app => 'Ilova';
  @override
  String get clipboard => 'Joylashtirish';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$uz extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Bitta qabul qiluvchi';
  @override
  String get multiple => 'Bir nechta qabul qiluvchi';
  @override
  String get link => 'Havola orqali ulashish';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$uz extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Umumiy';
  @override
  String get brightness => 'Mavzu';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$uz brightnessOptions = _Translations$settingsTab$general$brightnessOptions$uz._(
    _root,
  );
  @override
  String get color => 'Rang';
  @override
  late final _Translations$settingsTab$general$colorOptions$uz colorOptions = _Translations$settingsTab$general$colorOptions$uz._(_root);
  @override
  String get language => 'Til';
  @override
  late final _Translations$settingsTab$general$languageOptions$uz languageOptions = _Translations$settingsTab$general$languageOptions$uz._(_root);
  @override
  String get saveWindowPlacement => 'Chiqishdan soʻng oyna joylashuvini saqlash';
  @override
  String get saveWindowPlacementWindows => 'Chiqishdan soʻng oyna joylashuvini saqlash';
  @override
  String get minimizeToTray => 'Yopganda tizim treyi/menyu paneliga kichraytirish';
  @override
  String get launchAtStartup => 'Tizimga kirgandan soʻng avtomatik ishga tushirish';
  @override
  String get launchMinimized => 'Avtomatik ishga tushirish: yashirin holda boshlash';
  @override
  String get showInContextMenu => 'LocalSendni kontekst menyusida koʻrsatish';
  @override
  String get animations => 'Animatsiyalar';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$uz extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Qabul qilish';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Avtomatik tugatish';
  @override
  String get destination => 'Papkaga saqlash';
  @override
  String get downloads => '(Yuklanmalar)';
  @override
  String get saveToGallery => 'Mediani galereyaga saqlash';
  @override
  String get saveToHistory => 'Tarixga saqlash';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$uz extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yuborish';
  @override
  String get shareViaLinkAutoAccept => '"Havola orqali ulashish" rejimida soʻrovlarni avtomatik qabul qilish';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$uz extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tarmoq';
  @override
  String get needRestart => 'Sozlamalarni qoʻllash uchun serverni qayta ishga tushiring!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Qurilma nomi';
  @override
  String get deviceType => 'Qurilma turi';
  @override
  String get deviceModel => 'Qurilma modeli';
  @override
  String get port => 'Port';
  @override
  String get network => 'Tarmoq';
  @override
  late final _Translations$settingsTab$network$networkOptions$uz networkOptions = _Translations$settingsTab$network$networkOptions$uz._(_root);
  @override
  String get discoveryTimeout => 'Aniqlash vaqti tugashi';
  @override
  String get useSystemName => 'Tizim nomidan foydalanish';
  @override
  String get generateRandomAlias => 'Tasodifiy nom yaratish';
  @override
  String portWarning({required Object defaultPort}) =>
      'Maxsus portdan foydalanayotganingiz uchun boshqa qurilmalar sizni aniqlay olmasligi mumkin. (standart: ${defaultPort})';
  @override
  String get encryption => 'Shifrlash';
  @override
  String get multicastGroup => 'Multicast manzili';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Maxsus multicast manzilidan foydalanayotganingiz uchun boshqa qurilmalar sizni aniqlay olmasligi mumkin. (standart: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$uz extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Boshqa';
  @override
  String get support => 'LocalSendni qoʻllab-quvvatlash';
  @override
  String get donate => 'Xayriya';
  @override
  String get privacyPolicy => 'Maxfiylik siyosati';
  @override
  String get termsOfUse => 'Foydalanish shartlari';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$uz extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu qurilma boshqa qurilmalarga fayllar yubora oladi, lekin boshqa qurilmalar bu qurilmaga fayllar yubora olmaydi.';
  @override
  String solution({required Object port}) =>
      'Bu, ehtimol, xavfsizlik devori muammosi. Buni ${port} portida kiruvchi ulanishlarga (UDP va TCP) ruxsat berish orqali hal qilishingiz mumkin.';
  @override
  String get openFirewall => 'Xavfsizlik devorini ochish';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$uz extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu qurilma boshqa qurilmalarni aniqlay olmaydi.';
  @override
  String get solution =>
      'Iltimos, barcha qurilmalar bir xil Wi-Fi tarmogʻida ekanligiga va bir xil konfiguratsiyaga (port, multicast manzili, shifrlash) egaligiga ishonch hosil qiling. Maqsadli qurilmaning IP manzilini qoʻlda kiritib koʻrishingiz mumkin. Agar bu ishlasa, kelajakda avtomatik aniqlanishi uchun bu qurilmani sevimlilarga qoʻshishni koʻrib chiqing.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$uz extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ikkala qurilma ham bir-birini aniqlay olmaydi va fayllarni ulasha olmaydi.';
  @override
  String get solution =>
      'Muammo ikkala tomonda ham mavjudmi? Agar shunday boʻlsa, ikkala qurilma ham bir xil Wi-Fi tarmogʻida ekanligiga va bir xil konfiguratsiyaga (port, multicast manzili, shifrlash) egaligiga ishonch hosil qilishingiz kerak. Wi-Fi tarmogʻi Access Point (AP) izolyatsiyasi tufayli ishtirokchilar oʻrtasidagi aloqaga ruxsat bermasligi mumkin. Bunday holda, bu parametr routerda oʻchirilishi kerak.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$uz extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Faylni ochish';
  @override
  String get showInFolder => 'Papkada koʻrsatish';
  @override
  String get info => 'Maʼlumot';
  @override
  String get deleteFromHistory => 'Tarixdan oʻchirish';
}

// Path: progressPage.total
class _Translations$progressPage$total$uz extends Translations$progressPage$total$en {
  _Translations$progressPage$total$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$uz title = _Translations$progressPage$total$title$uz._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fayllar: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Hajmi: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Tezlik: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$uz extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String hours({required Object h, required Object m}) => '${h}s ${m}d';
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}k ${h}s ${m}d';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$uz extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tanlovga qoʻshish';
  @override
  String get content => 'Nima qoʻshmoqchisiz?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$uz extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylni ochish';
  @override
  String get content => 'Qabul qilingan faylni ochmoqchimisiz?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$uz extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Manzilni kiriting';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP manzil';
  @override
  String get recentlyUsed => 'Yaqinda ishlatilgan: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$uz extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fayl uzatishni bekor qilish';
  @override
  String get content => 'Fayl uzatishni haqiqatan ham bekor qilmoqchimisiz?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$uz extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylni ochib boʻlmadi';
  @override
  String content({required Object file}) => '"${file}" ochib boʻlmadi. Bu fayl koʻchirilgan, nomi oʻzgartirilgan yoki oʻchirilganmi?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$uz extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Shifrlash oʻchirildi';
  @override
  String get content =>
      'Endi aloqa shifrlanmagan HTTP protokoli orqali amalga oshiriladi. HTTPS protokolidan foydalanish uchun shifrlashni qayta yoqing.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$uz extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$uz extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sevimlilar';
  @override
  String get noFavorites => 'Hali sevimli qurilmalar yoʻq.';
  @override
  String get addFavorite => 'Qoʻshish';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$uz extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sevimlilardan oʻchirish';
  @override
  String content({required Object name}) => '"${name}"ni sevimlilardan haqiqatan ham oʻchirmoqchimisiz?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$uz extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Sevimlilarga qoʻshish';
  @override
  String get titleEdit => 'Sozlamalar';
  @override
  String get name => 'Qurilma nomi';
  @override
  String get auto => '(avto)';
  @override
  String get ip => 'IP manzil';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$uz extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fayl maʼlumoti';
  @override
  String get fileName => 'Fayl nomi:';
  @override
  String get path => 'Yoʻl:';
  @override
  String get size => 'Hajmi:';
  @override
  String get sender => 'Yuboruvchi:';
  @override
  String get time => 'Vaqt:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$uz extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fayl nomini kiriting';
  @override
  String original({required Object original}) => 'Asl: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$uz extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tarixni tozalash';
  @override
  String get content => 'Butun tarixni haqiqatan ham oʻchirmoqchimisiz?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$uz extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend mahalliy tarmoqni skanerlash ruxsatisiz boshqa qurilmalarni topa olmaydi. Iltimos, ushbu ruxsatni sozlamalarda bering.';
  @override
  String get gotoSettings => 'Sozlamalar';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$uz extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xabar yozing';
  @override
  String get multiline => 'Koʻp qatorli';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$uz extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hech qanday fayl tanlanmagan';
  @override
  String get content => 'Iltimos, kamida bitta faylni tanlang.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$uz extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ruxsat yoʻq';
  @override
  String get content => 'Siz kerakli ruxsatlarni bermadingiz. Iltimos, ularni sozlamalarda bering.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$uz extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mavjud emas';
  @override
  String get content => 'Bu funksiya faqat quyidagilarda mavjud:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$uz extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kod';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$uz extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tezkor amallar';
  @override
  String get counter => 'Hisoblagich';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Nollar bilan toʻldirish';
  @override
  String get sortBeforeCount => 'Avval alifbo tartibida saralash (A-Z)';
  @override
  String get random => 'Tasodifiy';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$uz extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Fayl soʻrovlari endi avtomatik qabul qilinadi. Eslatib oʻtamiz, mahalliy tarmoqdagi har bir kishi sizga fayllar yuborishi mumkin.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$uz extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Fayl soʻrovlari endi sevimlilar roʻyxatidagi qurilmalardan avtomatik qabul qilinadi.',
    'Ogohlantirish! Hozircha bu toʻliq xavfsiz emas, chunki sevimlilar roʻyxatingizdagi biror qurilmaning barmoq iziga ega boʻlgan xaker sizga cheklovsiz fayllar yuborishi mumkin.',
    'Shunga qaramay, bu variant mahalliy tarmoqdagi barcha foydalanuvchilarga cheklovsiz fayllar yuborishga ruxsat berishdan koʻra xavfsizroqdir.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$uz extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN kiriting';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$uz extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Yuborish rejimlari';
  @override
  String get single => 'Fayllarni bitta qabul qiluvchiga yuboradi. Fayl uzatish tugagandan soʻng tanlov tozalanadi.';
  @override
  String get multiple => 'Fayllarni bir nechta qabul qiluvchiga yuboradi. Fayl uzatish tugagandan soʻng tanlov tozalanmaydi.';
  @override
  String get link => 'LocalSend oʻrnatilmagan qabul qiluvchilar havolani brauzerlarida ochish orqali tanlangan fayllarni yuklab olishlari mumkin.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$uz extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$uz extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Tizim';
  @override
  String get dark => 'Qorongʻi';
  @override
  String get light => 'Yorugʻ';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$uz extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Tizim';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$uz extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Tizim';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$uz extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Barchasi';
  @override
  String get filtered => 'Filtrlangan';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$uz extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$uz._(TranslationsUz root) : this._root = root, super.internal(root);

  final TranslationsUz _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Umumiy jarayon (${time})';
  @override
  String get finishedError => 'Xato bilan tugadi';
  @override
  String get canceledSender => 'Yuboruvchi tomonidan bekor qilindi';
  @override
  String get canceledReceiver => 'Qabul qiluvchi tomonidan bekor qilindi';
}
