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
class TranslationsLo extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsLo({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.lo,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <lo>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsLo _root = this; // ignore: unused_field

  @override
  TranslationsLo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsLo(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'ລາວ';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$lo general = _Translations$general$lo._(_root);
  @override
  late final _Translations$receiveTab$lo receiveTab = _Translations$receiveTab$lo._(_root);
  @override
  late final _Translations$sendTab$lo sendTab = _Translations$sendTab$lo._(_root);
  @override
  late final _Translations$settingsTab$lo settingsTab = _Translations$settingsTab$lo._(_root);
  @override
  late final _Translations$troubleshootPage$lo troubleshootPage = _Translations$troubleshootPage$lo._(_root);
  @override
  late final _Translations$networkInterfacesPage$lo networkInterfacesPage = _Translations$networkInterfacesPage$lo._(_root);
  @override
  late final _Translations$receiveHistoryPage$lo receiveHistoryPage = _Translations$receiveHistoryPage$lo._(_root);
  @override
  late final _Translations$apkPickerPage$lo apkPickerPage = _Translations$apkPickerPage$lo._(_root);
  @override
  late final _Translations$selectedFilesPage$lo selectedFilesPage = _Translations$selectedFilesPage$lo._(_root);
  @override
  late final _Translations$receivePage$lo receivePage = _Translations$receivePage$lo._(_root);
  @override
  late final _Translations$receiveOptionsPage$lo receiveOptionsPage = _Translations$receiveOptionsPage$lo._(_root);
  @override
  late final _Translations$sendPage$lo sendPage = _Translations$sendPage$lo._(_root);
  @override
  late final _Translations$progressPage$lo progressPage = _Translations$progressPage$lo._(_root);
  @override
  late final _Translations$webSharePage$lo webSharePage = _Translations$webSharePage$lo._(_root);
  @override
  late final _Translations$aboutPage$lo aboutPage = _Translations$aboutPage$lo._(_root);
  @override
  late final _Translations$donationPage$lo donationPage = _Translations$donationPage$lo._(_root);
  @override
  late final _Translations$changelogPage$lo changelogPage = _Translations$changelogPage$lo._(_root);
  @override
  late final _Translations$aliasGenerator$lo aliasGenerator = _Translations$aliasGenerator$lo._(_root);
  @override
  late final _Translations$dialogs$lo dialogs = _Translations$dialogs$lo._(_root);
  @override
  late final _Translations$sanitization$lo sanitization = _Translations$sanitization$lo._(_root);
  @override
  late final _Translations$tray$lo tray = _Translations$tray$lo._(_root);
  @override
  late final _Translations$web$lo web = _Translations$web$lo._(_root);
  @override
  late final _Translations$assetPicker$lo assetPicker = _Translations$assetPicker$lo._(_root);
}

// Path: general
class _Translations$general$lo extends Translations$general$en {
  _Translations$general$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'ຍອມຮັບ';
  @override
  String get accepted => 'ຍອມຮັບແລ້ວ';
  @override
  String get add => 'ເພີ່ມ';
  @override
  String get advanced => 'ຂັ້ນສູງ';
  @override
  String get cancel => 'ຍົກເລີກ';
  @override
  String get close => 'ປິດ';
  @override
  String get confirm => 'ຢືນຢັນ';
  @override
  String get continueStr => 'ສືບຕໍ່';
  @override
  String get copy => 'ສຳເນົາ';
  @override
  String get copiedToClipboard => 'ສຳເນົາໃສ່ຄລິບບອດແລ້ວ';
  @override
  String get decline => 'ປະຕິເສດ';
  @override
  String get done => 'ຮຽບຮ້ອຍ';
  @override
  String get delete => 'ລຶບ';
  @override
  String get edit => 'ແກ້ໄຂ';
  @override
  String get error => 'ຂໍ້ຜິດພາດ';
  @override
  String get example => 'ຕົວຢ່າງ';
  @override
  String get files => 'ໄຟລ໌';
  @override
  String get finished => 'ສຳເລັດ';
  @override
  String get hide => 'ເຊື່ອງ';
  @override
  String get off => 'ປິດ';
  @override
  String get offline => 'ອອບໄລນ໌';
  @override
  String get on => 'ເປີດ';
  @override
  String get online => 'ອອນໄລນ໌';
  @override
  String get open => 'ເປີດ';
  @override
  String get queue => 'ຄິວ';
  @override
  String get quickSave => 'ບັນທຶກດ່ວນ';
  @override
  String get quickSaveFromFavorites => 'ບັນທຶກດ່ວນສຳລັບ "ລາຍການໂປຣດ"';
  @override
  String get renamed => 'ປ່ຽນຊື່ແລ້ວ';
  @override
  String get reset => 'ຍົກເລີກການປ່ຽນແປງ';
  @override
  String get restart => 'ເລີ່ມໃໝ່';
  @override
  String get settings => 'ການຕັ້ງຄ່າ';
  @override
  String get skipped => 'ຂ້າມແລ້ວ';
  @override
  String get start => 'ເລີ່ມ';
  @override
  String get stop => 'ຢຸດ';
  @override
  String get save => 'ບັນທຶກ';
  @override
  String get unchanged => 'ບໍ່ປ່ຽນແປງ';
  @override
  String get unknown => 'ບໍ່ຮູ້ຈັກ';
  @override
  String get noItemInClipboard => 'ບໍ່ມີລາຍການໃນຄລິບບອດ.';
}

// Path: receiveTab
class _Translations$receiveTab$lo extends Translations$receiveTab$en {
  _Translations$receiveTab$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຮັບ';
  @override
  late final _Translations$receiveTab$infoBox$lo infoBox = _Translations$receiveTab$infoBox$lo._(_root);
  @override
  late final _Translations$receiveTab$quickSave$lo quickSave = _Translations$receiveTab$quickSave$lo._(_root);
}

// Path: sendTab
class _Translations$sendTab$lo extends Translations$sendTab$en {
  _Translations$sendTab$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ສົ່ງ';
  @override
  late final _Translations$sendTab$selection$lo selection = _Translations$sendTab$selection$lo._(_root);
  @override
  late final _Translations$sendTab$picker$lo picker = _Translations$sendTab$picker$lo._(_root);
  @override
  String get shareIntentInfo => 'ທ່ານຍັງສາມາດໃຊ້ຄຸນສົມບັດ "ແບ່ງປັນ" ຂອງອຸປະກອນມືຖືຂອງທ່ານ ເພື່ອເລືອກໄຟລ໌ໄດ້ງ່າຍຂຶ້ນ.';
  @override
  String get nearbyDevices => 'ອຸປະກອນໃກ້ຄຽງ';
  @override
  String get thisDevice => 'ອຸປະກອນນີ້';
  @override
  String get scan => 'ຄົ້ນຫາອຸປະກອນ';
  @override
  String get manualSending => 'ສົ່ງດ້ວຍຕົນເອງ';
  @override
  String get sendMode => 'ໂໝດການສົ່ງ';
  @override
  late final _Translations$sendTab$sendModes$lo sendModes = _Translations$sendTab$sendModes$lo._(_root);
  @override
  String get sendModeHelp => 'ຄຳອະທິບາຍ';
  @override
  String get help => 'ກະລຸນາໝັ້ນໃຈວ່າເປົ້າໝາຍທີ່ຕ້ອງການຢູ່ໃນເຄືອຂ່າຍ Wi-Fi ດຽວກັນ.';
  @override
  String get placeItems => 'ວາງລາຍການເພື່ອແບ່ງປັນ.';
}

// Path: settingsTab
class _Translations$settingsTab$lo extends Translations$settingsTab$en {
  _Translations$settingsTab$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ການຕັ້ງຄ່າ';
  @override
  late final _Translations$settingsTab$general$lo general = _Translations$settingsTab$general$lo._(_root);
  @override
  late final _Translations$settingsTab$receive$lo receive = _Translations$settingsTab$receive$lo._(_root);
  @override
  late final _Translations$settingsTab$send$lo send = _Translations$settingsTab$send$lo._(_root);
  @override
  late final _Translations$settingsTab$network$lo network = _Translations$settingsTab$network$lo._(_root);
  @override
  late final _Translations$settingsTab$other$lo other = _Translations$settingsTab$other$lo._(_root);
  @override
  String get advancedSettings => 'ການຕັ້ງຄ່າຂັ້ນສູງ';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$lo extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ແກ້ໄຂບັນຫາ';
  @override
  String get subTitle => 'ແອັບບໍ່ເຮັດວຽກຕາມທີ່ຄາດຫວັງບໍ? ຢູ່ນີ້ທ່ານສາມາດຊອກຫາວິທີແກ້ໄຂບັນຫາທົ່ວໄປໄດ້.';
  @override
  String get solution => 'ວິທີແກ້ໄຂ:';
  @override
  String get fixButton => 'ແກ້ໄຂອັດຕະໂນມັດ';
  @override
  late final _Translations$troubleshootPage$firewall$lo firewall = _Translations$troubleshootPage$firewall$lo._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$lo noDiscovery = _Translations$troubleshootPage$noDiscovery$lo._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$lo noConnection = _Translations$troubleshootPage$noConnection$lo._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$lo extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ອິນເຕີເຟສເຄືອຂ່າຍ';
  @override
  String get info =>
      'ໂດຍຄ່າເລີ່ມຕົ້ນ LocalSend ໃຊ້ອິນເຕີເຟສເຄືອຂ່າຍທັງໝົດທີ່ມີ. ທ່ານສາມາດຍົກເວັ້ນເຄືອຂ່າຍທີ່ບໍ່ຕ້ອງການໄດ້ຢູ່ນີ້. ທ່ານຕ້ອງເລີ່ມເຊີບເວີໃໝ່ເພື່ອນຳໃຊ້ການປ່ຽນແປງ.';
  @override
  String get preview => 'ຕົວຢ່າງ';
  @override
  String get whitelist => 'ບັນຊີຂາວ';
  @override
  String get blacklist => 'ບັນຊີດຳ';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$lo extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ປະຫວັດ';
  @override
  String get openFolder => 'ເປີດໂຟລເດີ';
  @override
  String get deleteHistory => 'ລຶບປະຫວັດ';
  @override
  String get empty => 'ປະຫວັດວ່າງເປົ່າ.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$lo entryActions = _Translations$receiveHistoryPage$entryActions$lo._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$lo extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ແອັບ (APK)';
  @override
  String get excludeSystemApps => 'ຍົກເວັ້ນແອັບຂອງລະບົບ';
  @override
  String get excludeAppsWithoutLaunchIntent => 'ຍົກເວັ້ນແອັບທີ່ເປີດບໍ່ໄດ້';
  @override
  String apps({required Object n}) => '${n} ແອັບ';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$lo extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'ລຶບທັງໝົດ';
}

// Path: receivePage
class _Translations$receivePage$lo extends Translations$receivePage$en {
  _Translations$receivePage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('lo'))(
    n,
    one: 'ຕ້ອງການສົ່ງໄຟລ໌ໃຫ້ທ່ານ',
    other: 'ຕ້ອງການສົ່ງໄຟລ໌ ${n} ໄຟລ໌ໃຫ້ທ່ານ',
  );
  @override
  String get subTitleMessage => 'ສົ່ງຂໍ້ຄວາມໃຫ້ທ່ານ:';
  @override
  String get subTitleLink => 'ສົ່ງລິ້ງໃຫ້ທ່ານ:';
  @override
  String get canceled => 'ຜູ້ສົ່ງໄດ້ຍົກເລີກຄຳຂໍ.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$lo extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຕົວເລືອກ';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(ໂຟລເດີ LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'ປິດອັດຕະໂນມັດເພາະມີໂຟລເດີ.';
}

// Path: sendPage
class _Translations$sendPage$lo extends Translations$sendPage$en {
  _Translations$sendPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'ກຳລັງລໍຖ້າການຕອບກັບ…';
  @override
  String get rejected => 'ຜູ້ຮັບໄດ້ປະຕິເສດຄຳຂໍ.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'ຜູ້ຮັບກຳລັງຫຍຸ້ງກັບຄຳຂໍອື່ນ.';
}

// Path: progressPage
class _Translations$progressPage$lo extends Translations$progressPage$en {
  _Translations$progressPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ກຳລັງສົ່ງໄຟລ໌';
  @override
  String get titleReceiving => 'ກຳລັງຮັບໄຟລ໌';
  @override
  String get savedToGallery => 'ບັນທຶກໃນ Photos';
  @override
  late final _Translations$progressPage$total$lo total = _Translations$progressPage$total$lo._(_root);
  @override
  late final _Translations$progressPage$remainingTime$lo remainingTime = _Translations$progressPage$remainingTime$lo._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$lo extends Translations$webSharePage$en {
  _Translations$webSharePage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ແບ່ງປັນຜ່ານລິ້ງ';
  @override
  String get loading => 'ກຳລັງເລີ່ມເຊີບເວີ…';
  @override
  String get stopping => 'ກຳລັງຢຸດເຊີບເວີ…';
  @override
  String get error => 'ເກີດຂໍ້ຜິດພາດໃນຂະນະເລີ່ມເຊີບເວີ.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('lo'))(
    n,
    one: 'ເປີດລິ້ງນີ້ໃນບຣາວເຊີຂອງທ່ານ:',
    other: 'ເປີດໜຶ່ງໃນລິ້ງເຫຼົ່ານີ້ໃນບຣາວເຊີຂອງທ່ານ:',
  );
  @override
  String get requests => 'ຄຳຂໍ';
  @override
  String get noRequests => 'ຍັງບໍ່ມີຄຳຂໍ.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'ຍອມຮັບຄຳຂໍອັດຕະໂນມັດ';
  @override
  String get requirePin => 'ຕ້ອງໃຊ້ PIN';
  @override
  String pinHint({required Object pin}) => 'PIN ຄື "${pin}"';
  @override
  String get encryptionHint => 'LocalSend ໃຊ້ໃບຮັບຮອງທີ່ເຊັນດ້ວຍຕົນເອງ. ທ່ານຕ້ອງຍອມຮັບມັນຢູ່ໃນບຣາວເຊີຂອງທ່ານ.';
  @override
  String pendingRequests({required Object n}) => 'ຄຳຂໍທີ່ລໍຖ້າ: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$lo extends Translations$aboutPage$en {
  _Translations$aboutPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ກ່ຽວກັບ LocalSend';
  @override
  List<String> get description => [
    'LocalSend ເປັນແອັບຟຣີແບບໂອເພັນຊອດ ທີ່ໃຫ້ທ່ານແບ່ງປັນໄຟລ໌ ແລະ ຂໍ້ຄວາມກັບອຸປະກອນໃກ້ຄຽງຜ່ານເຄືອຂ່າຍທ້ອງຖິ່ນຂອງທ່ານໄດ້ຢ່າງປອດໄພ ໂດຍບໍ່ຈຳເປັນຕ້ອງມີການເຊື່ອມຕໍ່ອິນເຕີເນັດ.',
    'ແອັບນີ້ມີໃຫ້ໃຊ້ໃນ Android, iOS, macOS, Windows ແລະ Linux. ທ່ານສາມາດຊອກຫາທາງເລືອກການດາວໂຫຼດທັງໝົດໄດ້ຢູ່ໜ້າຫຼັກຢ່າງເປັນທາງການ.',
  ];
  @override
  String get author => 'ຜູ້ຂຽນ';
  @override
  String get contributors => 'ຜູ້ປະກອບສ່ວນ';
  @override
  String get packagers => 'ຜູ້ຈັດແພັກເກັດ';
  @override
  String get translators => 'ຜູ້ແປພາສາ';
}

// Path: donationPage
class _Translations$donationPage$lo extends Translations$donationPage$en {
  _Translations$donationPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບໍລິຈາກ';
  @override
  String get info => 'LocalSend ຟຣີ, ໂອເພັນຊອດ ແລະ ບໍ່ມີໂຄສະນາ. ຖ້າທ່ານມັກແອັບນີ້ ທ່ານສາມາດສະໜັບສະໜູນການພັດທະນາດ້ວຍການບໍລິຈາກ.';
  @override
  String donate({required Object amount}) => 'ບໍລິຈາກ ${amount}';
  @override
  String get thanks => 'ຂອບໃຈຫຼາຍໆ!';
  @override
  String get restore => 'ກູ້ຄືນການຊື້';
}

// Path: changelogPage
class _Translations$changelogPage$lo extends Translations$changelogPage$en {
  _Translations$changelogPage$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບັນທຶກການປ່ຽນແປງ';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$lo extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'ໜ້າຮັກ',
    'ສວຍງາມ',
    'ໃຫຍ່',
    'ສະຫວ່າງ',
    'ສະອາດ',
    'ສະຫຼາດ',
    'ເທ່',
    'ໜ້າເອັນດູ',
    'ຫຼັກແຫຼມ',
    'ມຸ່ງໝັ້ນ',
    'ກະຕືລືລົ້ນ',
    'ມີປະສິດທິພາບ',
    'ມະຫັດສະຈັນ',
    'ໄວ',
    'ດີ',
    'ສົດ',
    'ດີງາມ',
    'ງົດງາມ',
    'ຍອດຢ້ຽມ',
    'ຫຼໍ່',
    'ຮ້ອນ',
    'ໃຈດີ',
    'ຮັກແພງ',
    'ລຶກລັບ',
    'ເປັນລະບຽບ',
    'ອ່ອນໂຍນ',
    'ອົດທົນ',
    'ສວຍ',
    'ຊົງພະລັງ',
    'ຮັ່ງມີ',
    'ລັບ',
    'ຫົວດີ',
    'ໜັກແໜ້ນ',
    'ພິເສດ',
    'ມີຍຸດທະສາດ',
    'ແຂງແຮງ',
    'ຮຽບຮ້ອຍ',
    'ມີປັນຍາ',
  ];
  @override
  List<String> get fruits => [
    'ໝາກແອບເປີ້ນ',
    'ໝາກອາໂວກາໂດ',
    'ໝາກກ້ວຍ',
    'ໝາກແບລກເບີຣີ',
    'ໝາກບລູເບີຣີ',
    'ບຣັອກໂຄລີ',
    'ໝາກກາລົດ',
    'ໝາກເຊີຣີ',
    'ໝາກພ້າວ',
    'ໝາກອະງຸ່ນ',
    'ໝາກນາວ',
    'ຜັກສະຫຼັດ',
    'ໝາກມ່ວງ',
    'ໝາກໂມ',
    'ເຫັດ',
    'ຫົວຜັກບົ່ວ',
    'ໝາກກ້ຽງ',
    'ໝາກຫຸ່ງ',
    'ໝາກພີດ',
    'ໝາກແພຣ໌',
    'ໝາກນັດ',
    'ມັນຝຣັ່ງ',
    'ໝາກອຶ',
    'ໝາກຣາສເບີຣີ',
    'ໝາກສະຕໍເບີຣີ',
    'ໝາກເລ່ນ',
  ];
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _Translations$dialogs$lo extends Translations$dialogs$en {
  _Translations$dialogs$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$lo addFile = _Translations$dialogs$addFile$lo._(_root);
  @override
  late final _Translations$dialogs$openFile$lo openFile = _Translations$dialogs$openFile$lo._(_root);
  @override
  late final _Translations$dialogs$addressInput$lo addressInput = _Translations$dialogs$addressInput$lo._(_root);
  @override
  late final _Translations$dialogs$cancelSession$lo cancelSession = _Translations$dialogs$cancelSession$lo._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$lo cannotOpenFile = _Translations$dialogs$cannotOpenFile$lo._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$lo encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$lo._(_root);
  @override
  late final _Translations$dialogs$errorDialog$lo errorDialog = _Translations$dialogs$errorDialog$lo._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$lo favoriteDialog = _Translations$dialogs$favoriteDialog$lo._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$lo favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$lo._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$lo favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$lo._(_root);
  @override
  late final _Translations$dialogs$fileInfo$lo fileInfo = _Translations$dialogs$fileInfo$lo._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$lo fileNameInput = _Translations$dialogs$fileNameInput$lo._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$lo historyClearDialog = _Translations$dialogs$historyClearDialog$lo._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$lo localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$lo._(_root);
  @override
  late final _Translations$dialogs$messageInput$lo messageInput = _Translations$dialogs$messageInput$lo._(_root);
  @override
  late final _Translations$dialogs$noFiles$lo noFiles = _Translations$dialogs$noFiles$lo._(_root);
  @override
  late final _Translations$dialogs$noPermission$lo noPermission = _Translations$dialogs$noPermission$lo._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$lo notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$lo._(_root);
  @override
  late final _Translations$dialogs$qr$lo qr = _Translations$dialogs$qr$lo._(_root);
  @override
  late final _Translations$dialogs$quickActions$lo quickActions = _Translations$dialogs$quickActions$lo._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$lo quickSaveNotice = _Translations$dialogs$quickSaveNotice$lo._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$lo quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$lo._(_root);
  @override
  late final _Translations$dialogs$pin$lo pin = _Translations$dialogs$pin$lo._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$lo sendModeHelp = _Translations$dialogs$sendModeHelp$lo._(_root);
  @override
  late final _Translations$dialogs$zoom$lo zoom = _Translations$dialogs$zoom$lo._(_root);
}

// Path: sanitization
class _Translations$sanitization$lo extends Translations$sanitization$en {
  _Translations$sanitization$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ຊື່ໄຟລ໌ຫ້າມວ່າງເປົ່າ';
  @override
  String get invalid => 'ຊື່ໄຟລ໌ມີຕົວອັກສອນທີ່ບໍ່ຖືກຕ້ອງ';
}

// Path: tray
class _Translations$tray$lo extends Translations$tray$en {
  _Translations$tray$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'ອອກຈາກ LocalSend';
  @override
  String get closeWindows => 'ອອກ';
}

// Path: web
class _Translations$web$lo extends Translations$web$en {
  _Translations$web$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'ໃສ່ PIN';
  @override
  String get invalidPin => 'PIN ບໍ່ຖືກຕ້ອງ';
  @override
  String get tooManyAttempts => 'ພະຍາຍາມຫຼາຍເກີນໄປ';
  @override
  String get rejected => 'ຖືກປະຕິເສດ';
  @override
  String get files => 'ໄຟລ໌';
  @override
  String get fileName => 'ຊື່ໄຟລ໌';
  @override
  String get size => 'ຂະໜາດ';
}

// Path: assetPicker
class _Translations$assetPicker$lo extends Translations$assetPicker$en {
  _Translations$assetPicker$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'ຢືນຢັນ';
  @override
  String get cancel => 'ຍົກເລີກ';
  @override
  String get edit => 'ແກ້ໄຂ';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'ໂຫຼດລົ້ມແຫຼວ';
  @override
  String get original => 'ຕົ້ນສະບັບ';
  @override
  String get preview => 'ຕົວຢ່າງ';
  @override
  String get select => 'ເລືອກ';
  @override
  String get emptyList => 'ລາຍການວ່າງເປົ່າ';
  @override
  String get unSupportedAssetType => 'ບໍ່ຮອງຮັບປະເພດໄຟລ໌ນີ້.';
  @override
  String get unableToAccessAll => 'ບໍ່ສາມາດເຂົ້າເຖິງໄຟລ໌ທັງໝົດໃນອຸປະກອນ';
  @override
  String get viewingLimitedAssetsTip => 'ເບິ່ງໄດ້ສະເພາະໄຟລ໌ ແລະ ອານບໍ້ (album) ທີ່ແອັບເຂົ້າເຖິງໄດ້ເທົ່ານັ້ນ.';
  @override
  String get changeAccessibleLimitedAssets => 'ຄລິກເພື່ອອັບເດດໄຟລ໌ທີ່ເຂົ້າເຖິງໄດ້';
  @override
  String get accessAllTip => 'ແອັບເຂົ້າເຖິງໄດ້ພຽງບາງໄຟລ໌ໃນອຸປະກອນເທົ່ານັ້ນ. ໃຫ້ໄປທີ່ການຕັ້ງຄ່າລະບົບ ແລ້ວອະນຸຍາດໃຫ້ແອັບເຂົ້າເຖິງມີເດຍທັງໝົດໃນອຸປະກອນ.';
  @override
  String get goToSystemSettings => 'ໄປທີ່ການຕັ້ງຄ່າລະບົບ';
  @override
  String get accessLimitedAssets => 'ສືບຕໍ່ດ້ວຍການເຂົ້າເຖິງແບບຈຳກັດ';
  @override
  String get accessiblePathName => 'ໄຟລ໌ທີ່ເຂົ້າເຖິງໄດ້';
  @override
  String get sTypeAudioLabel => 'ສຽງ';
  @override
  String get sTypeImageLabel => 'ຮູບພາບ';
  @override
  String get sTypeVideoLabel => 'ວິດີໂອ';
  @override
  String get sTypeOtherLabel => 'ມີເດຍອື່ນໆ';
  @override
  String get sActionPlayHint => 'ຫຼິ້ນ';
  @override
  String get sActionPreviewHint => 'ຕົວຢ່າງ';
  @override
  String get sActionSelectHint => 'ເລືອກ';
  @override
  String get sActionSwitchPathLabel => 'ປ່ຽນເສັ້ນທາງ';
  @override
  String get sActionUseCameraHint => 'ໃຊ້ກ້ອງ';
  @override
  String get sNameDurationLabel => 'ໄລຍະເວລາ';
  @override
  String get sUnitAssetCountLabel => 'ຈຳນວນ';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$lo extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'ພອດ:';
  @override
  String get alias => 'ຊື່ອຸປະກອນ:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$lo extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'ລາຍການໂປຣດ';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$lo extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ການເລືອກ';
  @override
  String files({required Object files}) => 'ໄຟລ໌: ${files}';
  @override
  String size({required Object size}) => 'ຂະໜາດ: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$lo extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ໄຟລ໌';
  @override
  String get folder => 'ໂຟລເດີ';
  @override
  String get media => 'ມີເດຍ';
  @override
  String get text => 'ຂໍ້ຄວາມ';
  @override
  String get app => 'ແອັບ';
  @override
  String get clipboard => 'ວາງ';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$lo extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'ຜູ້ຮັບຄົນດຽວ';
  @override
  String get multiple => 'ຜູ້ຮັບຫຼາຍຄົນ';
  @override
  String get link => 'ແບ່ງປັນຜ່ານລິ້ງ';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$lo extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ທົ່ວໄປ';
  @override
  String get brightness => 'ຮູບແບບ';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$lo brightnessOptions = _Translations$settingsTab$general$brightnessOptions$lo._(
    _root,
  );
  @override
  String get color => 'ສີ';
  @override
  late final _Translations$settingsTab$general$colorOptions$lo colorOptions = _Translations$settingsTab$general$colorOptions$lo._(_root);
  @override
  String get language => 'ພາສາ';
  @override
  late final _Translations$settingsTab$general$languageOptions$lo languageOptions = _Translations$settingsTab$general$languageOptions$lo._(_root);
  @override
  String get saveWindowPlacement => 'ບັນທຶກຕຳແໜ່ງໜ້າຕ່າງຫຼັງອອກຈາກໂປຣແກຣມ';
  @override
  String get saveWindowPlacementWindows => 'ບັນທຶກຕຳແໜ່ງໜ້າຕ່າງຫຼັງອອກ';
  @override
  String get minimizeToTray => 'ຫຍໍ້ລົງໃສ່ System Tray/Menu Bar ເມື່ອປິດ';
  @override
  String get launchAtStartup => 'ເປີດອັດຕະໂນມັດຫຼັງເຂົ້າສູ່ລະບົບ';
  @override
  String get launchMinimized => 'ເປີດອັດຕະໂນມັດ: ເລີ່ມແບບເຊື່ອງ';
  @override
  String get showInContextMenu => 'ສະແດງ LocalSend ໃນເມນູຄລິກຂວາ';
  @override
  String get animations => 'ອະນິເມຊັນ';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$lo extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຮັບ';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'ສຳເລັດອັດຕະໂນມັດ';
  @override
  String get destination => 'ບັນທຶກໄປໃສ່ໂຟລເດີ';
  @override
  String get downloads => '(ດາວໂຫຼດ)';
  @override
  String get saveToGallery => 'ບັນທຶກມີເດຍໃສ່ແກລເລີຣີ';
  @override
  String get saveToHistory => 'ບັນທຶກໃສ່ປະຫວັດ';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$lo extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ສົ່ງ';
  @override
  String get shareViaLinkAutoAccept => 'ຍອມຮັບຄຳຂໍອັດຕະໂນມັດໃນໂໝດ "ແບ່ງປັນຜ່ານລິ້ງ"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$lo extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ເຄືອຂ່າຍ';
  @override
  String get needRestart => 'ເລີ່ມເຊີບເວີໃໝ່ເພື່ອນຳໃຊ້ການຕັ້ງຄ່າ!';
  @override
  String get server => 'ເຊີບເວີ';
  @override
  String get alias => 'ຊື່ອຸປະກອນ';
  @override
  String get deviceType => 'ປະເພດອຸປະກອນ';
  @override
  String get deviceModel => 'ລຸ້ນອຸປະກອນ';
  @override
  String get port => 'ພອດ';
  @override
  String get network => 'ເຄືອຂ່າຍ';
  @override
  late final _Translations$settingsTab$network$networkOptions$lo networkOptions = _Translations$settingsTab$network$networkOptions$lo._(_root);
  @override
  String get discoveryTimeout => 'ໝົດເວລາການຄົ້ນຫາ';
  @override
  String get useSystemName => 'ໃຊ້ຊື່ລະບົບ';
  @override
  String get generateRandomAlias => 'ສ້າງຊື່ແບບສຸ່ມ';
  @override
  String portWarning({required Object defaultPort}) =>
      'ທ່ານອາດຈະບໍ່ຖືກກວດພົບໂດຍອຸປະກອນອື່ນ ເພາະທ່ານໃຊ້ພອດແບບກຳນົດເອງ. (ຄ່າເລີ່ມຕົ້ນ: ${defaultPort})';
  @override
  String get encryption => 'ການເຂົ້າລະຫັດ';
  @override
  String get multicastGroup => 'ທີ່ຢູ່ multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ທ່ານອາດຈະບໍ່ຖືກກວດພົບໂດຍອຸປະກອນອື່ນ ເພາະທ່ານໃຊ້ທີ່ຢູ່ multicast ແບບກຳນົດເອງ. (ຄ່າເລີ່ມຕົ້ນ: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$lo extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ອື່ນໆ';
  @override
  String get support => 'ສະໜັບສະໜູນ LocalSend';
  @override
  String get donate => 'ບໍລິຈາກ';
  @override
  String get privacyPolicy => 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ';
  @override
  String get termsOfUse => 'ເງື່ອນໄຂການໃຊ້ງານ';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$lo extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ອຸປະກອນນີ້ສາມາດສົ່ງໄຟລ໌ໄປຫາອຸປະກອນອື່ນໄດ້ ແຕ່ອຸປະກອນອື່ນບໍ່ສາມາດສົ່ງໄຟລ໌ມາຫາອຸປະກອນນີ້ໄດ້.';
  @override
  String solution({required Object port}) => 'ນີ້ອາດເປັນບັນຫາໄຟວໍ. ທ່ານສາມາດແກ້ໄຂໄດ້ໂດຍການອະນຸຍາດການເຊື່ອມຕໍ່ຂາເຂົ້າ (UDP ແລະ TCP) ຢູ່ພອດ ${port}.';
  @override
  String get openFirewall => 'ເປີດໄຟວໍ';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$lo extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ອຸປະກອນນີ້ບໍ່ສາມາດຄົ້ນພົບອຸປະກອນອື່ນໄດ້.';
  @override
  String get solution =>
      'ກະລຸນາໝັ້ນໃຈວ່າອຸປະກອນທັງໝົດຢູ່ໃນເຄືອຂ່າຍ Wi-Fi ດຽວກັນ ແລະ ໃຊ້ການຕັ້ງຄ່າດຽວກັນ (ພອດ, ທີ່ຢູ່ multicast, ການເຂົ້າລະຫັດ). ທ່ານສາມາດລອງພິມທີ່ຢູ່ IP ຂອງອຸປະກອນເປົ້າໝາຍດ້ວຍຕົນເອງ. ຖ້າວິທີນີ້ໃຊ້ໄດ້ ໃຫ້ພິຈາລະນາເພີ່ມອຸປະກອນນີ້ໃສ່ລາຍການໂປຣດ ເພື່ອໃຫ້ຖືກຄົ້ນພົບອັດຕະໂນມັດໃນອະນາຄົດ.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$lo extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ອຸປະກອນທັງສອງບໍ່ສາມາດຄົ້ນພົບກັນ ແລະ ບໍ່ສາມາດແບ່ງປັນໄຟລ໌ໄດ້.';
  @override
  String get solution =>
      'ບັນຫາເກີດຂຶ້ນທັງສອງຝ່າຍບໍ? ຖ້າແມ່ນ ທ່ານຕ້ອງໝັ້ນໃຈວ່າອຸປະກອນທັງສອງຢູ່ໃນເຄືອຂ່າຍ Wi-Fi ດຽວກັນ ແລະ ໃຊ້ການຕັ້ງຄ່າດຽວກັນ (ພອດ, ທີ່ຢູ່ multicast, ການເຂົ້າລະຫັດ). ເຄືອຂ່າຍ Wi-Fi ອາດບໍ່ອະນຸຍາດການສື່ສານລະຫວ່າງຜູ້ໃຊ້ ເນື່ອງຈາກການແຍກ Access Point (AP). ໃນກໍລະນີນີ້ ຕ້ອງປິດຕົວເລືອກນີ້ຢູ່ເຣົາເຕີ.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$lo extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ເປີດໄຟລ໌';
  @override
  String get showInFolder => 'ສະແດງໃນໂຟລເດີ';
  @override
  String get info => 'ຂໍ້ມູນ';
  @override
  String get deleteFromHistory => 'ລຶບອອກຈາກປະຫວັດ';
}

// Path: progressPage.total
class _Translations$progressPage$total$lo extends Translations$progressPage$total$en {
  _Translations$progressPage$total$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$lo title = _Translations$progressPage$total$title$lo._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ໄຟລ໌: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'ຂະໜາດ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'ຄວາມໄວ: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$lo extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String hours({required Object h, required Object m}) => '${h}ຊມ ${m}ນທ';
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}ມື້ ${h}ຊມ ${m}ນທ';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$lo extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ເພີ່ມໃສ່ການເລືອກ';
  @override
  String get content => 'ທ່ານຕ້ອງການເພີ່ມຫຍັງ?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$lo extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ເປີດໄຟລ໌';
  @override
  String get content => 'ທ່ານຕ້ອງການເປີດໄຟລ໌ທີ່ໄດ້ຮັບບໍ?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$lo extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ໃສ່ທີ່ຢູ່';
  @override
  String get hashtag => 'ແຮັຊແທັກ';
  @override
  String get ip => 'ທີ່ຢູ່ IP';
  @override
  String get recentlyUsed => 'ໃຊ້ຫຼ້າສຸດ: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$lo extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຍົກເລີກການໂອນໄຟລ໌';
  @override
  String get content => 'ທ່ານຕ້ອງການຍົກເລີກການໂອນໄຟລ໌ແທ້ບໍ?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$lo extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບໍ່ສາມາດເປີດໄຟລ໌';
  @override
  String content({required Object file}) => 'ບໍ່ສາມາດເປີດ "${file}". ໄຟລ໌ນີ້ຖືກຍ້າຍ, ປ່ຽນຊື່ ຫຼື ລຶບໄປແລ້ວບໍ?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$lo extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ປິດການເຂົ້າລະຫັດແລ້ວ';
  @override
  String get content => 'ຕອນນີ້ການສື່ສານເກີດຂຶ້ນຜ່ານໂປຣໂຕຄໍ HTTP ທີ່ບໍ່ໄດ້ເຂົ້າລະຫັດ. ເພື່ອໃຊ້ໂປຣໂຕຄໍ HTTPS ໃຫ້ເປີດການເຂົ້າລະຫັດອີກຄັ້ງ.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$lo extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$lo extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ລາຍການໂປຣດ';
  @override
  String get noFavorites => 'ຍັງບໍ່ມີອຸປະກອນໂປຣດ.';
  @override
  String get addFavorite => 'ເພີ່ມ';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$lo extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ລຶບອອກຈາກລາຍການໂປຣດ';
  @override
  String content({required Object name}) => 'ທ່ານຕ້ອງການລຶບ "${name}" ອອກຈາກລາຍການໂປຣດແທ້ບໍ?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$lo extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'ເພີ່ມໃສ່ລາຍການໂປຣດ';
  @override
  String get titleEdit => 'ການຕັ້ງຄ່າ';
  @override
  String get name => 'ຊື່ອຸປະກອນ';
  @override
  String get auto => '(ອັດຕະໂນມັດ)';
  @override
  String get ip => 'ທີ່ຢູ່ IP';
  @override
  String get port => 'ພອດ';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$lo extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຂໍ້ມູນໄຟລ໌';
  @override
  String get fileName => 'ຊື່ໄຟລ໌:';
  @override
  String get path => 'ເສັ້ນທາງ:';
  @override
  String get size => 'ຂະໜາດ:';
  @override
  String get sender => 'ຜູ້ສົ່ງ:';
  @override
  String get time => 'ເວລາ:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$lo extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ໃສ່ຊື່ໄຟລ໌';
  @override
  String original({required Object original}) => 'ຕົ້ນສະບັບ: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$lo extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ລ້າງປະຫວັດ';
  @override
  String get content => 'ທ່ານຕ້ອງການລຶບປະຫວັດທັງໝົດແທ້ບໍ?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$lo extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend ບໍ່ສາມາດຄົ້ນຫາອຸປະກອນອື່ນໄດ້ ຫາກບໍ່ໄດ້ຮັບອະນຸຍາດໃຫ້ສະແກນເຄືອຂ່າຍທ້ອງຖິ່ນ. ກະລຸນາອະນຸຍາດສິດນີ້ໃນການຕັ້ງຄ່າ.';
  @override
  String get gotoSettings => 'ການຕັ້ງຄ່າ';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$lo extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ພິມຂໍ້ຄວາມ';
  @override
  String get multiline => 'ຫຼາຍແຖວ';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$lo extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບໍ່ໄດ້ເລືອກໄຟລ໌';
  @override
  String get content => 'ກະລຸນາເລືອກຢ່າງໜ້ອຍໜຶ່ງໄຟລ໌.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$lo extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບໍ່ມີສິດ';
  @override
  String get content => 'ທ່ານຍັງບໍ່ໄດ້ໃຫ້ສິດທີ່ຈຳເປັນ. ກະລຸນາໃຫ້ສິດໃນການຕັ້ງຄ່າ.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$lo extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ບໍ່ສາມາດໃຊ້ໄດ້';
  @override
  String get content => 'ຄຸນສົມບັດນີ້ໃຊ້ໄດ້ສະເພາະໃນ:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$lo extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR ໂຄດ';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$lo extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ຄຳສັ່ງດ່ວນ';
  @override
  String get counter => 'ຕົວນັບ';
  @override
  String get prefix => 'ຄຳນຳໜ້າ';
  @override
  String get padZero => 'ເຕີມດ້ວຍເລກສູນ';
  @override
  String get sortBeforeCount => 'ຮຽງລຳດັບຕົວອັກສອນກ່ອນ (A-Z)';
  @override
  String get random => 'ສຸ່ມ';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$lo extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ຕອນນີ້ຄຳຂໍໄຟລ໌ຈະຖືກຍອມຮັບອັດຕະໂນມັດ. ໂປຣດຮັບຮູ້ວ່າທຸກຄົນໃນເຄືອຂ່າຍທ້ອງຖິ່ນສາມາດສົ່ງໄຟລ໌ໃຫ້ທ່ານໄດ້.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$lo extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'ຕອນນີ້ຄຳຂໍໄຟລ໌ຈະຖືກຍອມຮັບອັດຕະໂນມັດຈາກອຸປະກອນໃນລາຍການໂປຣດຂອງທ່ານ.',
    'ຄຳເຕືອນ! ປັດຈຸບັນນີ້ບໍ່ປອດໄພທັງໝົດ ເນື່ອງຈາກແຮັກເກີທີ່ມີລາຍນິ້ວມື (fingerprint) ຂອງອຸປະກອນໃດໜຶ່ງຈາກລາຍການໂປຣດຂອງທ່ານ ສາມາດສົ່ງໄຟລ໌ໃຫ້ທ່ານໄດ້ໂດຍບໍ່ມີຂໍ້ຈຳກັດ.',
    'ຢ່າງໃດກໍຕາມ ຕົວເລືອກນີ້ຍັງປອດໄພກວ່າການອະນຸຍາດໃຫ້ຜູ້ໃຊ້ທັງໝົດໃນເຄືອຂ່າຍທ້ອງຖິ່ນສົ່ງໄຟລ໌ໃຫ້ທ່ານໄດ້ໂດຍບໍ່ມີຂໍ້ຈຳກັດ.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$lo extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ໃສ່ PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$lo extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ໂໝດການສົ່ງ';
  @override
  String get single => 'ສົ່ງໄຟລ໌ໃຫ້ຜູ້ຮັບຄົນດຽວ. ການເລືອກຈະຖືກລ້າງຫຼັງຈາກການໂອນໄຟລ໌ສຳເລັດ.';
  @override
  String get multiple => 'ສົ່ງໄຟລ໌ໃຫ້ຜູ້ຮັບຫຼາຍຄົນ. ການເລືອກຈະບໍ່ຖືກລ້າງຫຼັງຈາກການໂອນໄຟລ໌ສຳເລັດ.';
  @override
  String get link => 'ຜູ້ຮັບທີ່ບໍ່ໄດ້ຕິດຕັ້ງ LocalSend ສາມາດດາວໂຫຼດໄຟລ໌ທີ່ເລືອກໄດ້ ໂດຍການເປີດລິ້ງໃນບຣາວເຊີ.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$lo extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$lo extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ລະບົບ';
  @override
  String get dark => 'ມືດ';
  @override
  String get light => 'ແຈ້ງ';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$lo extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ລະບົບ';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$lo extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ລະບົບ';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$lo extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'ທັງໝົດ';
  @override
  String get filtered => 'ກັ່ນຕອງແລ້ວ';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$lo extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$lo._(TranslationsLo root) : this._root = root, super.internal(root);

  final TranslationsLo _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'ຄວາມຄືບໜ້າທັງໝົດ (${time})';
  @override
  String get finishedError => 'ສຳເລັດພ້ອມຂໍ້ຜິດພາດ';
  @override
  String get canceledSender => 'ຍົກເລີກໂດຍຜູ້ສົ່ງ';
  @override
  String get canceledReceiver => 'ຍົກເລີກໂດຍຜູ້ຮັບ';
}
