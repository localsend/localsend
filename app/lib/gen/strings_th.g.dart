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
class TranslationsTh extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsTh({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.th,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <th>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsTh _root = this; // ignore: unused_field

  @override
  TranslationsTh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTh(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'ไทย';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$th general = _Translations$general$th._(_root);
  @override
  late final _Translations$receiveTab$th receiveTab = _Translations$receiveTab$th._(_root);
  @override
  late final _Translations$sendTab$th sendTab = _Translations$sendTab$th._(_root);
  @override
  late final _Translations$settingsTab$th settingsTab = _Translations$settingsTab$th._(_root);
  @override
  late final _Translations$troubleshootPage$th troubleshootPage = _Translations$troubleshootPage$th._(_root);
  @override
  late final _Translations$receiveHistoryPage$th receiveHistoryPage = _Translations$receiveHistoryPage$th._(_root);
  @override
  late final _Translations$apkPickerPage$th apkPickerPage = _Translations$apkPickerPage$th._(_root);
  @override
  late final _Translations$selectedFilesPage$th selectedFilesPage = _Translations$selectedFilesPage$th._(_root);
  @override
  late final _Translations$receivePage$th receivePage = _Translations$receivePage$th._(_root);
  @override
  late final _Translations$receiveOptionsPage$th receiveOptionsPage = _Translations$receiveOptionsPage$th._(_root);
  @override
  late final _Translations$sendPage$th sendPage = _Translations$sendPage$th._(_root);
  @override
  late final _Translations$progressPage$th progressPage = _Translations$progressPage$th._(_root);
  @override
  late final _Translations$webSharePage$th webSharePage = _Translations$webSharePage$th._(_root);
  @override
  late final _Translations$aboutPage$th aboutPage = _Translations$aboutPage$th._(_root);
  @override
  late final _Translations$donationPage$th donationPage = _Translations$donationPage$th._(_root);
  @override
  late final _Translations$changelogPage$th changelogPage = _Translations$changelogPage$th._(_root);
  @override
  late final _Translations$aliasGenerator$th aliasGenerator = _Translations$aliasGenerator$th._(_root);
  @override
  late final _Translations$dialogs$th dialogs = _Translations$dialogs$th._(_root);
  @override
  late final _Translations$sanitization$th sanitization = _Translations$sanitization$th._(_root);
  @override
  late final _Translations$tray$th tray = _Translations$tray$th._(_root);
  @override
  late final _Translations$web$th web = _Translations$web$th._(_root);
  @override
  late final _Translations$assetPicker$th assetPicker = _Translations$assetPicker$th._(_root);
  @override
  late final _Translations$networkInterfacesPage$th networkInterfacesPage = _Translations$networkInterfacesPage$th._(_root);
}

// Path: general
class _Translations$general$th extends Translations$general$en {
  _Translations$general$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'ยอมรับ';
  @override
  String get accepted => 'ยอมรับแล้ว';
  @override
  String get add => 'เพิ่ม';
  @override
  String get advanced => 'ขั้นสูง';
  @override
  String get cancel => 'ยกเลิก';
  @override
  String get close => 'ปิด';
  @override
  String get confirm => 'ยืนยัน';
  @override
  String get continueStr => 'ดำเนินการต่อ';
  @override
  String get copy => 'คัดลอก';
  @override
  String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ดแล้ว';
  @override
  String get decline => 'ปฏิเสธ';
  @override
  String get done => 'เสร็จแล้ว';
  @override
  String get delete => 'ลบ';
  @override
  String get edit => 'แก้ไข';
  @override
  String get error => 'ข้อผิดพลาด';
  @override
  String get example => 'ตัวอย่าง';
  @override
  String get files => 'ไฟล์';
  @override
  String get finished => 'สำเร็จแล้ว';
  @override
  String get hide => 'ซ่อน';
  @override
  String get off => 'ปิด';
  @override
  String get offline => 'ออฟไลน์';
  @override
  String get on => 'เปิด';
  @override
  String get online => 'ออนไลน์';
  @override
  String get open => 'เปิด';
  @override
  String get queue => 'ลำดับคิว';
  @override
  String get quickSave => 'บันทึกด่วน';
  @override
  String get renamed => 'เปลี่ยนชื่อแล้ว';
  @override
  String get reset => 'เลิกทำการเปลี่ยนแปลง';
  @override
  String get restart => 'เริ่มต้นใหม่';
  @override
  String get settings => 'ตั้งค่า';
  @override
  String get skipped => 'ข้ามไฟล์';
  @override
  String get start => 'เริ่ม';
  @override
  String get stop => 'หยุด';
  @override
  String get save => 'บันทึก';
  @override
  String get unchanged => 'ไม่เปลี่ยนแปลง';
  @override
  String get unknown => 'ไม่รู้จัก';
  @override
  String get noItemInClipboard => 'ไม่มีรายการใดในคลิปบอร์ด';
  @override
  String get quickSaveFromFavorites => 'เซฟด่วน สำหรับ "รายการโปรด"';
}

// Path: receiveTab
class _Translations$receiveTab$th extends Translations$receiveTab$en {
  _Translations$receiveTab$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'รับ';
  @override
  late final _Translations$receiveTab$infoBox$th infoBox = _Translations$receiveTab$infoBox$th._(_root);
  @override
  late final _Translations$receiveTab$quickSave$th quickSave = _Translations$receiveTab$quickSave$th._(_root);
}

// Path: sendTab
class _Translations$sendTab$th extends Translations$sendTab$en {
  _Translations$sendTab$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ส่ง';
  @override
  late final _Translations$sendTab$selection$th selection = _Translations$sendTab$selection$th._(_root);
  @override
  late final _Translations$sendTab$picker$th picker = _Translations$sendTab$picker$th._(_root);
  @override
  String get shareIntentInfo => 'คุณยังสามารถใช้ฟีเจอร์ "แชร์" บนอุปกรณ์ของคุณเพื่อเลือกไฟล์ที่ต้องการได้อย่างง่ายดาย';
  @override
  String get nearbyDevices => 'อุปกรณ์ที่อยู่ใกล้เคียง';
  @override
  String get thisDevice => 'อุปกรณ์นี้';
  @override
  String get scan => 'กำลังค้นหาอุปกรณ์ภายในเครือข่าย';
  @override
  String get sendMode => 'โหมดการส่ง';
  @override
  late final _Translations$sendTab$sendModes$th sendModes = _Translations$sendTab$sendModes$th._(_root);
  @override
  String get sendModeHelp => 'คำอธิบาย';
  @override
  String get help => 'โปรดตรวจสอบให้แน่ใจว่าอุปกรณ์เป้าหมายเชื่อมต่ออยู่ภายในเครือข่าย WiFi เดียวกันแล้ว';
  @override
  String get placeItems => 'วางไฟล์ที่ต้องการแชร์';
  @override
  String get manualSending => 'ส่งด้วยตัวเอง';
}

// Path: settingsTab
class _Translations$settingsTab$th extends Translations$settingsTab$en {
  _Translations$settingsTab$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'การตั้งค่า';
  @override
  late final _Translations$settingsTab$general$th general = _Translations$settingsTab$general$th._(_root);
  @override
  late final _Translations$settingsTab$receive$th receive = _Translations$settingsTab$receive$th._(_root);
  @override
  late final _Translations$settingsTab$send$th send = _Translations$settingsTab$send$th._(_root);
  @override
  late final _Translations$settingsTab$network$th network = _Translations$settingsTab$network$th._(_root);
  @override
  late final _Translations$settingsTab$other$th other = _Translations$settingsTab$other$th._(_root);
  @override
  String get advancedSettings => 'ตั้งค่าขั้นสูง';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$th extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'แก้ไขปัญหาเบื้องต้น';
  @override
  String get subTitle => 'มีปัญหาเกี่ยวกับการใช้งานแอปอยู่หรือเปล่า? คุณสามารถค้นหาวิธีการแก้ปัญหาเบื้องต้นได้จากที่นี้';
  @override
  String get solution => 'วิธีทำ:';
  @override
  String get fixButton => 'แก้ไขให้โดยอัตโนมัติ';
  @override
  late final _Translations$troubleshootPage$firewall$th firewall = _Translations$troubleshootPage$firewall$th._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$th noDiscovery = _Translations$troubleshootPage$noDiscovery$th._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$th noConnection = _Translations$troubleshootPage$noConnection$th._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$th extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ประวัติ';
  @override
  String get openFolder => 'เปิดโฟลเดอร์';
  @override
  String get deleteHistory => 'ลบประวัติ';
  @override
  String get empty => 'ประวัติว่างเปล่า';
  @override
  late final _Translations$receiveHistoryPage$entryActions$th entryActions = _Translations$receiveHistoryPage$entryActions$th._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$th extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'แอป (APK)';
  @override
  String get excludeSystemApps => 'ไม่แสดงแอปของระบบ';
  @override
  String get excludeAppsWithoutLaunchIntent => 'ไม่แสดงแอปที่ไม่สามารถเปิดใช้งานได้';
  @override
  String apps({required Object n}) => '${n} แอป';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$th extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'ลบทั้งหมด';
}

// Path: receivePage
class _Translations$receivePage$th extends Translations$receivePage$en {
  _Translations$receivePage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
    n,
    one: 'ต้องการส่งไฟล์ให้คุณ',
    other: 'ต้องการส่งไฟล์จำนวน ${n} ไฟล์ให้คุณ',
  );
  @override
  String get subTitleMessage => 'ส่งข้อความถึงคุณ:';
  @override
  String get subTitleLink => 'ส่งลิงค์ให้คุณ:';
  @override
  String get canceled => 'ผู้ส่งได้ยกเลิกคำขอส่งไฟล์แล้ว';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$th extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ตัวเลือก';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(โฟลเดอร์ของ LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'ถูกปิดโดยอัตโนมัติเนื่องจากมีโฟลเดอร์';
}

// Path: sendPage
class _Translations$sendPage$th extends Translations$sendPage$en {
  _Translations$sendPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'กำลังรอการตอบกลับ...';
  @override
  String get rejected => 'ผู้รับได้ปฏิเสธคำขอส่งไฟล์';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'อุปกรณ์ของผู้รับกำลังประมวลผลคำขอรับ-ส่งไฟล์อื่นอยู่';
}

// Path: progressPage
class _Translations$progressPage$th extends Translations$progressPage$en {
  _Translations$progressPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'กำลังส่งไฟล์';
  @override
  String get titleReceiving => 'กำลังรับไฟล์';
  @override
  String get savedToGallery => 'บันทึกไว้ในแอปรูปถ่ายแล้ว';
  @override
  late final _Translations$progressPage$total$th total = _Translations$progressPage$total$th._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$th extends Translations$webSharePage$en {
  _Translations$webSharePage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'แชร์ผ่านลิงก์';
  @override
  String get loading => 'กำลังเริ่มเซิร์ฟเวอร์...';
  @override
  String get stopping => 'กำลังหยุดเซิร์ฟเวอร์...';
  @override
  String get error => 'เกิดข้อผิดพลาดขณะกำลังเริ่มเซิร์ฟเวอร์';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
    n,
    one: 'เปิดลิงค์นี้ในเบราว์เซอร์:',
    other: 'เปิดลิงก์ใดลิงก์หนึ่งในเบราว์เซอร์:',
  );
  @override
  String get requests => 'คำขอ';
  @override
  String get noRequests => 'ยังไม่มีคำขอ';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'ตอบรับคำขอโดยอัตโนมัติ';
  @override
  String get requirePin => 'กรอกรหัส PIN';
  @override
  String pinHint({required Object pin}) => 'รหัส PIN คือ "${pin}"';
  @override
  String get encryptionHint =>
      'LocalSend ใช้ใบรับรองอุปกรณ์จากเว็บเบราเซอร์ (self-signed certificate) คุณต้องกดยอมรับใบรับรองนี้ในเบราว์เซอร์บนอุปกรณ์ของคุณ';
  @override
  String pendingRequests({required Object n}) => 'คำขอที่รอดำเนินการ: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$th extends Translations$aboutPage$en {
  _Translations$aboutPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'เกี่ยวกับ LocalSend';
  @override
  List<String> get description => [
    'LocalSend เป็นแอปโอเพ่นซอร์สที่คุณสามารถดาวน์โหลดมาใช้ได้ฟรีโดยไม่เสียค่าใช้จ่าย ซึ่งตัวแอปจะช่วยให้คุณสามารถแบ่งปันไฟล์และข้อความกับอุปกรณ์ใกล้เคียงได้อย่างปลอดภัยผ่านเครือข่ายท้องถิ่นที่เชื่อมต่อร่วมกันโดยไม่จำเป็นต้องเชื่อมต่ออินเทอร์เน็ต',
    'แอปนี้พร้อมใช้งานบน Android, iOS, macOS, Windows และ Linux โดยคุณสามารถดาวน์โหลดแอปนี้เพื่อใช้กับระบบปฏิบัติการต่างๆ ได้ผ่านทางหน้าแรกของเว็บไซต์ทางการของเรา',
  ];
  @override
  String get author => 'ผู้เขียนโปรแกรม';
  @override
  String get contributors => 'รายชื่อผู้มีส่วนร่วมพัฒนา';
  @override
  String get packagers => 'ไลบรารี';
  @override
  String get translators => 'รายชื่อนักแปล';
}

// Path: donationPage
class _Translations$donationPage$th extends Translations$donationPage$en {
  _Translations$donationPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'บริจาค';
  @override
  String get info =>
      'LocalSend เป็นแอปโอเพ่นซอร์สที่คุณสามารถดาวน์โหลดมาใช้ได้ฟรีโดยไม่เสียค่าใช้จ่ายหรือโฆษณาแฝง หากคุณชื่นชอบแอปนี้ คุณสามารถสนับสนุนการพัฒนาแอปได้ด้วยการบริจาคเงิน';
  @override
  String donate({required Object amount}) => 'บริจาคเงิน จำนวน ${amount}';
  @override
  String get thanks => 'ขอบคุณมาก!';
  @override
  String get restore => 'เรียกคืนข้อมูลการซื้อ';
}

// Path: changelogPage
class _Translations$changelogPage$th extends Translations$changelogPage$en {
  _Translations$changelogPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'บันทึกรายการเปลี่ยนแปลง';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$th extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'น่ารัก',
    'สวย',
    'ใหญ่',
    'สว่าง',
    'ทำความสะอาด',
    'ฉลาด',
    'เย็น',
    'น่ารัก',
    'ฉลาดแกมโกง',
    'มุ่งมั่น',
    'กระฉับกระเฉง',
    'มีประสิทธิภาพ',
    'มหัศจรรย์',
    'เร็ว',
    'ดี',
    'สด',
    'ดี',
    'งดงาม',
    'ยอดเยี่ยม',
    'หล่อ',
    'ร้อน',
    'ใจดี',
    'น่ารัก',
    'มิสติก',
    'ประณีต',
    'ดี',
    'อดทน',
    'สวย',
    'ทรงพลัง',
    'รวย',
    'ความลับ',
    'ปราดเปรื่อง',
    'แข็ง',
    'พิเศษ',
    'เชิงกลยุทธ์',
    'แข็งแกร่ง',
    'เรียบร้อย',
    'ฉลาด',
  ];
  @override
  List<String> get fruits => [
    'แอปเปิล',
    'อาโวคาโด',
    'กล้วย',
    'แบล็คเบอร์รี่',
    'บลูเบอร์รี่',
    'บร็อคโคลี',
    'แครอท',
    'เชอร์รี่',
    'มะพร้าว',
    'องุ่น',
    'มะนาว',
    'ผักกาดหอม',
    'มะม่วง',
    'แตงโม',
    'เห็ด',
    'หัวหอม',
    'ส้ม',
    'มะละกอ',
    'ลูกพีช',
    'ลูกแพร์',
    'สัปปะรด',
    'มันฝรั่ง',
    'ฟักทอง',
    'ราสเบอร์รี่',
    'สตรอเบอร์รี่',
    'มะเขือเทศ',
  ];

  /// ในบางภาษา คำคุณศัพท์จะต้องอยู่ท้ายสุด
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _Translations$dialogs$th extends Translations$dialogs$en {
  _Translations$dialogs$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$th addFile = _Translations$dialogs$addFile$th._(_root);
  @override
  late final _Translations$dialogs$addressInput$th addressInput = _Translations$dialogs$addressInput$th._(_root);
  @override
  late final _Translations$dialogs$cancelSession$th cancelSession = _Translations$dialogs$cancelSession$th._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$th cannotOpenFile = _Translations$dialogs$cannotOpenFile$th._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$th encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$th._(_root);
  @override
  late final _Translations$dialogs$errorDialog$th errorDialog = _Translations$dialogs$errorDialog$th._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$th favoriteDialog = _Translations$dialogs$favoriteDialog$th._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$th favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$th._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$th favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$th._(_root);
  @override
  late final _Translations$dialogs$fileInfo$th fileInfo = _Translations$dialogs$fileInfo$th._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$th fileNameInput = _Translations$dialogs$fileNameInput$th._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$th historyClearDialog = _Translations$dialogs$historyClearDialog$th._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$th localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$th._(_root);
  @override
  late final _Translations$dialogs$messageInput$th messageInput = _Translations$dialogs$messageInput$th._(_root);
  @override
  late final _Translations$dialogs$noFiles$th noFiles = _Translations$dialogs$noFiles$th._(_root);
  @override
  late final _Translations$dialogs$noPermission$th noPermission = _Translations$dialogs$noPermission$th._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$th notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$th._(_root);
  @override
  late final _Translations$dialogs$qr$th qr = _Translations$dialogs$qr$th._(_root);
  @override
  late final _Translations$dialogs$quickActions$th quickActions = _Translations$dialogs$quickActions$th._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$th quickSaveNotice = _Translations$dialogs$quickSaveNotice$th._(_root);
  @override
  late final _Translations$dialogs$pin$th pin = _Translations$dialogs$pin$th._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$th sendModeHelp = _Translations$dialogs$sendModeHelp$th._(_root);
  @override
  late final _Translations$dialogs$zoom$th zoom = _Translations$dialogs$zoom$th._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$th quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$th._(_root);
  @override
  late final _Translations$dialogs$openFile$th openFile = _Translations$dialogs$openFile$th._(_root);
}

// Path: sanitization
class _Translations$sanitization$th extends Translations$sanitization$en {
  _Translations$sanitization$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ชื่อไฟล์ไม่สามารถปล่อยเว้นว่างไว้ได้';
  @override
  String get invalid => 'ชื่อไฟล์ประกอบไปด้วยอักขระที่ไม่รองรับ';
}

// Path: tray
class _Translations$tray$th extends Translations$tray$en {
  _Translations$tray$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'ออกจากแอป LocalSend';
  @override
  String get closeWindows => 'ออก';
}

// Path: web
class _Translations$web$th extends Translations$web$en {
  _Translations$web$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'กรอกรหัส PIN';
  @override
  String get invalidPin => 'รหัส PIN ไม่ถูกต้อง';
  @override
  String get tooManyAttempts => 'ป้อนรหัสผิดหลายครั้ง';
  @override
  String get rejected => 'ถูกปฏิเสธ';
  @override
  String get files => 'ไฟล์';
  @override
  String get fileName => 'ชื่อไฟล์';
  @override
  String get size => 'ขนาด';
}

// Path: assetPicker
class _Translations$assetPicker$th extends Translations$assetPicker$en {
  _Translations$assetPicker$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'ยืนยัน';
  @override
  String get cancel => 'ยกเลิก';
  @override
  String get edit => 'แก้ไข';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'โหลดล้มเหลว';
  @override
  String get original => 'ต้นฉบับ';
  @override
  String get preview => 'ตัวอย่าง';
  @override
  String get select => 'เลือก';
  @override
  String get emptyList => 'รายการว่างเปล่า';
  @override
  String get unSupportedAssetType => 'ประเภทไฟล์ที่ไม่รองรับ';
  @override
  String get unableToAccessAll => 'ไม่สามารถเข้าถึงไฟล์ทั้งหมดบนอุปกรณ์ได้';
  @override
  String get viewingLimitedAssetsTip => 'เลือกดูเฉพาะไฟล์และอัลบั้มที่แอปสามารถเข้าถึงได้';
  @override
  String get changeAccessibleLimitedAssets => 'คลิกเพื่ออัปเดตไฟล์ที่แอปจะเข้าถึงได้';
  @override
  String get accessAllTip =>
      'แอปสามารถเข้าถึงไฟล์ที่อยู่ในอุปกรณ์ของคุณได้เพียงบางไฟล์เท่านั้น คุณต้องไปที่การตั้งค่าระบบและอนุญาตให้แอปสามารถเข้าถึงสื่อมีเดียทั้งหมดที่อยู่ในอุปกรณ์ก่อน';
  @override
  String get goToSystemSettings => 'ไปที่การตั้งค่าระบบ';
  @override
  String get accessLimitedAssets => 'ดำเนินการต่อด้วยการเข้าถึงแบบจำกัด';
  @override
  String get accessiblePathName => 'ไฟล์ที่เข้าถึงได้';
  @override
  String get sTypeAudioLabel => 'เสียง';
  @override
  String get sTypeImageLabel => 'รูปภาพ';
  @override
  String get sTypeVideoLabel => 'วิดีโอ';
  @override
  String get sTypeOtherLabel => 'สื่ออื่นๆ';
  @override
  String get sActionPlayHint => 'เล่น';
  @override
  String get sActionPreviewHint => 'ดูตัวอย่าง';
  @override
  String get sActionSelectHint => 'เลือก';
  @override
  String get sActionSwitchPathLabel => 'เปลี่ยนที่เก็บไฟล์';
  @override
  String get sActionUseCameraHint => 'ใช้กล้อง';
  @override
  String get sNameDurationLabel => 'ความยาว';
  @override
  String get sUnitAssetCountLabel => 'จำนวน';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$th extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'อินเทอร์เฟซเครือข่าย';
  @override
  String get info =>
      'ตามค่าเริ่มต้น LocalSend จะใช้อินเทอร์เฟซเครือข่ายที่มีอยู่ทั้งหมด คุณสามารถยกเว้นเครือข่ายที่ไม่ต้องการได้ที่นี่ คุณต้องรีสตาร์ทเซิร์ฟเวอร์เพื่อใช้การเปลี่ยนแปลง';
  @override
  String get whitelist => 'ไวท์ลิสต์';
  @override
  String get blacklist => 'บัญชีดำ';
  @override
  String get preview => 'ดูตัวอย่าง';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$th extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'ไอพี:';
  @override
  String get port => 'พอร์ต:';
  @override
  String get alias => 'ชื่ออุปกรณ์:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$th extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get favorites => 'รายการโปรด';
  @override
  String get off => 'บันทึกอย่างรวดเร็ว';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$th extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'การเลือก';
  @override
  String files({required Object files}) => 'ไฟล์: ${files}';
  @override
  String size({required Object size}) => 'ขนาด: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$th extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ไฟล์';
  @override
  String get folder => 'โฟลเดอร์';
  @override
  String get media => 'มีเดีย';
  @override
  String get text => 'ข้อความ';
  @override
  String get app => 'แอป';
  @override
  String get clipboard => 'วาง';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$th extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'ผู้รับคนเดียว';
  @override
  String get multiple => 'ผู้รับหลายคน';
  @override
  String get link => 'แชร์ผ่านลิงก์';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$th extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ทั่วไป';
  @override
  String get brightness => 'ธีม';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$th brightnessOptions = _Translations$settingsTab$general$brightnessOptions$th._(
    _root,
  );
  @override
  String get color => 'สี';
  @override
  late final _Translations$settingsTab$general$colorOptions$th colorOptions = _Translations$settingsTab$general$colorOptions$th._(_root);
  @override
  String get language => 'ภาษา';
  @override
  late final _Translations$settingsTab$general$languageOptions$th languageOptions = _Translations$settingsTab$general$languageOptions$th._(_root);
  @override
  String get saveWindowPlacement => 'ออก: บันทึกตำแหน่งหน้าต่างของโปรแกรม';
  @override
  String get minimizeToTray => 'ย่อแอปไปยัง System Tray/แถบเมนูเมื่อปิดโปรแกรม';
  @override
  String get launchAtStartup => 'เริ่มอัตโนมัติหลังจากเข้าสู่ระบบ';
  @override
  String get launchMinimized => 'เริ่มอัตโนมัติ: ซ่อนโปรแกรมหลังจากเริ่ม';
  @override
  String get showInContextMenu => 'แสดง LocalSend ในเมนูคลิกขวา';
  @override
  String get animations => 'ภาพเคลื่อนไหว';
  @override
  String get saveWindowPlacementWindows => 'บันทึกตำแหน่งหน้าต่างหลังจากออก';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$th extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'รับ';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'ดำเนินการให้เสร็จสิ้นโดยอัตโนมัติ';
  @override
  String get destination => 'ปลายทาง';
  @override
  String get downloads => '(ดาวน์โหลด)';
  @override
  String get saveToGallery => 'บันทึกมีเดียลงในแกลอรี่';
  @override
  String get saveToHistory => 'บันทึกลงในประวัติย้อนหลัง';
  @override
  String get quickSaveFromFavorites => 'บันทึกอย่างรวดเร็วจากรายการโปรด';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$th extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ส่ง';
  @override
  String get shareViaLinkAutoAccept => 'ตอบรับคำขอในการโอนถ่ายข้อมูลจากโหมด "แชร์ผ่านลิงก์" โดยอัตโนมัติ';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$th extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'เครือข่าย';
  @override
  String get needRestart => 'เริ่มต้นเซิร์ฟเวอร์ใหม่อีกครั้งเพื่อปรับเปลี่ยนค่าให้เป็นไปตามที่ตั้งไว้ก่อนหน้า!';
  @override
  String get server => 'เซิร์ฟเวอร์';
  @override
  String get alias => 'ชื่ออุปกรณ์';
  @override
  String get deviceType => 'ประเภทอุปกรณ์';
  @override
  String get deviceModel => 'รุ่นอุปกรณ์';
  @override
  String get port => 'พอร์ต';
  @override
  String get discoveryTimeout => 'สิ้นสุดเวลาสำหรับการค้นหาอุปกรณ์ในเครือข่าย';
  @override
  String portWarning({required Object defaultPort}) =>
      'อุปกรณ์เครื่องอื่นอาจจะไม่สามารถค้นหาอุปกรณ์เครื่องนี้เจอในเครื่อข่ายได้เนื่องจากคุณแก้ไขพอร์ตเป็นหมายเลขอื่น (default: ${defaultPort})';
  @override
  String get encryption => 'การเข้ารหัส';
  @override
  String get multicastGroup => 'มัลติคาสต์';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'อุปกรณ์เครื่องอื่นอาจจะไม่สามารถค้นหาอุปกรณ์เครื่องนี้เจอในเครื่อข่ายได้เนื่องจากคุณกำหนดที่อยู่มัลติคาสต์ใหม่ด้วยตนเอง (default: ${defaultMulticast})';
  @override
  String get network => 'เครือข่าย';
  @override
  late final _Translations$settingsTab$network$networkOptions$th networkOptions = _Translations$settingsTab$network$networkOptions$th._(_root);
  @override
  String get useSystemName => 'ใช้ชื่อในระบบ';
  @override
  String get generateRandomAlias => 'สุ่มนามแฝง';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$th extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'อื่นๆ';
  @override
  String get support => 'สนับสนุน LocalSend';
  @override
  String get donate => 'บริจาค';
  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';
  @override
  String get termsOfUse => 'ข้อกำหนดการใช้งาน';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$th extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'แอปนี้สามารถส่งไฟล์ข้อมูลไปยังอุปกรณ์อื่นได้ แต่อุปกรณ์อื่นไม่สามารถส่งไฟล์ข้อมูลมายังอุปกรณ์นี้ได้';
  @override
  String solution({required Object port}) =>
      'ปัญหานี้อาจมีสาเหตุมาจากการตั้งค่าไฟร์วอลล์ คุณสามารถแก้ไขปัญหานี้ได้ด้วยการอนุญาตการเชื่อมต่อขาเข้า (UDP และ TCP) ผ่านพอร์ตหมายเลข ${port}';
  @override
  String get openFirewall => 'เปิดไฟร์วอลล์';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$th extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'อุปกรณ์นี้ไม่สามารถค้นหาอุปกรณ์อื่นได้';
  @override
  String get solution =>
      'โปรดตรวจสอบให้แน่ใจว่าอุปกรณ์ทั้งหมดเชื่อมต่อกับเครือข่าย Wi-Fi เดียวกันและมีการตั้งค่าที่เหมือนกัน (พอร์ต, ที่อยู่ไอพีของมัลติแคสต์, การเข้ารหัส) คุณสามารถลองป้อนที่อยู่ IP ในอุปกรณ์ของคุณด้วยตนเองได้ หากได้ผล สามารถเพิ่มอุปกรณ์ดังกล่าวไปยังรายการโปรดเพื่อให้สามารถค้นพบได้โดยอัตโนมัติในครั้งถัดไป';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$th extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'อุปกรณ์สำหรับรับ-ส่งข้อมูลค้นหากันไม่เจอและไม่สามารถแชร์ไฟล์ได้';
  @override
  String get solution =>
      'ปัญหานี้เกิดกับอุปกรณ์ที่จะรับและส่งข้อมูลใช่หรือไม่ ถ้าใช่ คุณจำเป็นต้องตรวจสอบให้แน่ใจว่าอุปกรณ์ทั้งสองได้เชื่อมต่อบนเครือข่ายเดียวกันและได้มีการตั้งค่าการเชื่อมต่อภายในแอปที่เหมือนกัน (ใช้หมายเลขพอร์ต, ที่อยู่มัลติคาสต์, วิธีการเข้ารหัสเดียวกัน) ทั้งนี้เครือข่ายที่คุณเชื่อมต่ออยู่อาจมีการตั้งค่าเพื่อป้องกันไม่ให้อุปกรณ์ภายในเครือข่ายสื่อสารกันได้ หากเป็นเช่นนั้น คุณจำเป็นต้องปรับการตั้งค่าของเราเตอร์ก่อนเป็นอันดับแรกเพื่อให้อุปกรณ์ในเครือข่ายสามารถสื่อสารเพื่อส่งข้อมูลได้';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$th extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'เปิดไฟล์';
  @override
  String get showInFolder => 'แสดงในโฟลเดอร์';
  @override
  String get info => 'ข้อมูล';
  @override
  String get deleteFromHistory => 'ลบออกจากประวัติ';
}

// Path: progressPage.total
class _Translations$progressPage$total$th extends Translations$progressPage$total$en {
  _Translations$progressPage$total$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$th title = _Translations$progressPage$total$title$th._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ไฟล์: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'ขนาด: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'ความเร็ว: ${speed}/วิ';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$th extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'เพิ่มไปยังส่วนที่เลือกไว้';
  @override
  String get content => 'คุณต้องการจะเพิ่มไฟล์ใด?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$th extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'กรอกที่อยู่';
  @override
  String get hashtag => 'แฮชแท็ก';
  @override
  String get ip => 'ที่อยู่ไอพี';
  @override
  String get recentlyUsed => 'ใช้งานล่าสุดเมื่อ: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$th extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ยกเลิกการโอนไฟล์';
  @override
  String get content => 'คุณต้องการยกเลิกการโอนไฟล์หรือไม่?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$th extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ไม่สามารถเปิดไฟล์ได้';
  @override
  String content({required Object file}) => 'ไม่สามารถเปิดไฟล์ "${file}" ได้ โปรดตรวจสอบว่าไฟล์นี้ได้ถูกย้าย เปลี่ยนชื่อ หรือถูกลบไปแล้วหรือไม่';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$th extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ปิดใช้งานการเข้ารหัสอยู่';
  @override
  String get content =>
      'การส่งข้อมูลที่เกิดขึ้นต่อจากนี้จะเป็นการส่งข้อมูลผ่านโปรโตคอล HTTP ที่ไม่ได้รับการเข้ารหัส หากต้องการส่งข้อมูลผ่านโปรโตคอล HTTPS คุณจำเป็นต้องเปิดใช้งานการเข้ารหัสอีกครั้ง';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$th extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$th extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'รายการโปรด';
  @override
  String get noFavorites => 'ยังไม่มีอุปกรณ์ในรายการโปรด';
  @override
  String get addFavorite => 'เพิ่มอุปกรณ์';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$th extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ลบจากรายการโปรด';
  @override
  String content({required Object name}) => 'คุณต้องการลบอุปกรณ์ "${name}" ออกจากรายการโปรดหรือไม่?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$th extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'เพิ่มในรายการโปรด';
  @override
  String get titleEdit => 'ปรับแต่ง';
  @override
  String get name => 'ชื่ออุปกรณ์';
  @override
  String get auto => '(ตั้งให้อัตโนมัติ)';
  @override
  String get ip => 'ที่อยู่ IP';
  @override
  String get port => 'พอร์ต';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$th extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ข้อมูลไฟล์';
  @override
  String get fileName => 'ชื่อไฟล์:';
  @override
  String get path => 'ที่อยู่ไฟล์บนเครื่อง:';
  @override
  String get size => 'ขนาด:';
  @override
  String get sender => 'ผู้ส่ง:';
  @override
  String get time => 'เวลา:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$th extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'กรอกชื่อไฟล์';
  @override
  String original({required Object original}) => 'ชื่อไฟล์เดิม: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$th extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ล้างประวัติ';
  @override
  String get content => 'คุณต้องการลบประวัติทั้งหมดหรือไม่?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$th extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend ไม่สามารถค้นหาอุปกรณ์อื่นได้หากคุณไม่ให้สิทธิ์การสแกนเครือข่ายที่อุปกรณ์นี้กำลังเชื่อมต่ออยู่ โปรดอนุญาตให้สิทธิ์ในการสแกนนี้ในหน้าการตั้งค่า';
  @override
  String get gotoSettings => 'การตั้งค่า';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$th extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'พิมพ์ข้อความ';
  @override
  String get multiline => 'หลายบรรทัด';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$th extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ไม่ได้เลือกไฟล์';
  @override
  String get content => 'กรุณาเลือกไฟล์อย่างน้อยหนึ่งไฟล์';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$th extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ไม่มีสิทธิ์';
  @override
  String get content => 'คุณยังไม่ได้ให้สิทธิ์ที่จำเป็น โปรดให้สิทธิ์เหล่านั้นในการตั้งค่า';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$th extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ไม่พร้อมใช้งาน';
  @override
  String get content => 'ฟีเจอร์นี้ใช้งานได้เฉพาะบน:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$th extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'คิวอาร์โค้ด';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$th extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'การดำเนินการอย่างรวดเร็ว';
  @override
  String get counter => 'ตัวนับ';
  @override
  String get prefix => 'คำนำหน้า';
  @override
  String get padZero => 'เติมศูนย์ด้านหน้า';
  @override
  String get sortBeforeCount => 'เรียงตามตัวอักษรไว้ก่อนหน้า';
  @override
  String get random => 'สุ่ม';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$th extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'การตอบรับคำขอรับไฟล์จากอุปกรณ์อื่นจะเป็นไปโดยอัตโนมัติ โปรดทราบว่าทุกคนในเครือข่ายที่อุปกรณ์นี้เชื่อมต่ออยู่จะสามารถส่งไฟล์ถึงคุณได้';
}

// Path: dialogs.pin
class _Translations$dialogs$pin$th extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'กรอกรหัส PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$th extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'โหมดส่งไฟล์';
  @override
  String get single => 'ส่งไฟล์ไปยังผู้รับเพียงอุปกรณ์เดียว ไฟล์ที่เลือกไว้จะถูกล้างออกจากรายการทันทีที่โอนไฟล์สำเร็จ';
  @override
  String get multiple => 'ส่งไฟล์ไปยังผู้รับหลายอุปกรณ์ ไฟล์ที่เลือกไว้จะไม่ถูกล้างออกจากรายการ';
  @override
  String get link => 'ผู้รับที่ไม่ได้ติดตั้งแอป LocalSend สามารถดาวน์โหลดไฟล์ที่เลือกไว้ในรายการได้โดยการเปิดลิงก์ในเบราว์เซอร์';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$th extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$th extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'คำขอไฟล์ได้รับการยอมรับโดยอัตโนมัติจากอุปกรณ์ในรายการโปรดของคุณแล้ว',
    'คำเตือน! ในขณะนี้ระบบยังไม่ปลอดภัยอย่างสมบูรณ์ เนื่องจากแฮกเกอร์ที่มีลายนิ้วมือดิจิทัลของอุปกรณ์ใดๆ จากรายการโปรดของคุณสามารถส่งไฟล์ถึงคุณได้โดยไม่มีข้อจำกัด',
    'อย่างไรก็ตาม ตัวเลือกนี้ยังปลอดภัยกว่าการอนุญาตให้ผู้ใช้ทั้งหมดบนเครือข่ายท้องถิ่นส่งไฟล์ถึงคุณโดยไม่มีข้อจำกัด',
  ];
  @override
  String get title => 'บันทึกอย่างรวดเร็วจากรายการโปรด';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$th extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'เปิดไฟล์';
  @override
  String get content => 'ต้องการเปิดไฟล์ที่ได้รับหรือไม่?';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$th extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ตามระบบ';
  @override
  String get dark => 'มืด';
  @override
  String get light => 'สว่าง';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$th extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ตามระบบ';
  @override
  String get oled => 'โอเล็ด';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$th extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'ตามระบบ';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$th extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'ทั้งหมด';
  @override
  String get filtered => 'ตัวกรอง';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$th extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$th._(TranslationsTh root) : this._root = root, super.internal(root);

  final TranslationsTh _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'ความคืบหน้าทั้งหมด (${time})';
  @override
  String get finishedError => 'ดำเนินการเสร็จสิ้นโดยมีข้อผิดพลาดเกิดขึ้น';
  @override
  String get canceledSender => 'ถูกยกเลิกโดยผู้ส่ง';
  @override
  String get canceledReceiver => 'ถูกยกเลิกโดยผู้รับ';
}
