part of 'strings.g.dart';

// Path: <root>
class _StringsTh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.th,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <th>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsTh _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'ไทย';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralTh general = _StringsGeneralTh._(_root);
	@override late final _StringsReceiveTabTh receiveTab = _StringsReceiveTabTh._(_root);
	@override late final _StringsSendTabTh sendTab = _StringsSendTabTh._(_root);
	@override late final _StringsSettingsTabTh settingsTab = _StringsSettingsTabTh._(_root);
	@override late final _StringsTroubleshootPageTh troubleshootPage = _StringsTroubleshootPageTh._(_root);
	@override late final _StringsReceiveHistoryPageTh receiveHistoryPage = _StringsReceiveHistoryPageTh._(_root);
	@override late final _StringsApkPickerPageTh apkPickerPage = _StringsApkPickerPageTh._(_root);
	@override late final _StringsSelectedFilesPageTh selectedFilesPage = _StringsSelectedFilesPageTh._(_root);
	@override late final _StringsReceivePageTh receivePage = _StringsReceivePageTh._(_root);
	@override late final _StringsReceiveOptionsPageTh receiveOptionsPage = _StringsReceiveOptionsPageTh._(_root);
	@override late final _StringsSendPageTh sendPage = _StringsSendPageTh._(_root);
	@override late final _StringsProgressPageTh progressPage = _StringsProgressPageTh._(_root);
	@override late final _StringsWebSharePageTh webSharePage = _StringsWebSharePageTh._(_root);
	@override late final _StringsAboutPageTh aboutPage = _StringsAboutPageTh._(_root);
	@override late final _StringsDonationPageTh donationPage = _StringsDonationPageTh._(_root);
	@override late final _StringsChangelogPageTh changelogPage = _StringsChangelogPageTh._(_root);
	@override late final _StringsAliasGeneratorTh aliasGenerator = _StringsAliasGeneratorTh._(_root);
	@override late final _StringsDialogsTh dialogs = _StringsDialogsTh._(_root);
	@override late final _StringsTrayTh tray = _StringsTrayTh._(_root);
	@override late final _StringsWebTh web = _StringsWebTh._(_root);
	@override late final _StringsAssetPickerTh assetPicker = _StringsAssetPickerTh._(_root);
}

// Path: general
class _StringsGeneralTh extends _StringsGeneralEn {
	_StringsGeneralTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get accept => 'ยอมรับ';
	@override String get accepted => 'ยอมรับแล้ว';
	@override String get add => 'เพิ่ม';
	@override String get advanced => 'ขั้นสูง';
	@override String get cancel => 'ยกเลิก';
	@override String get close => 'ปิด';
	@override String get confirm => 'ยืนยัน';
	@override String get continueStr => 'ดำเนินการต่อ';
	@override String get copy => 'คัดลอก';
	@override String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ด';
	@override String get decline => 'ปฏิเสธ';
	@override String get done => 'เสร็จแล้ว';
	@override String get delete => 'ลบ';
	@override String get edit => 'แก้ไข';
	@override String get error => 'ข้อผิดพลาด';
	@override String get example => 'ตัวอย่าง';
	@override String get files => 'ไฟล์';
	@override String get finished => 'สำเร็จแล้ว';
	@override String get hide => 'ซ่อน';
	@override String get off => 'ปิด';
	@override String get offline => 'ออฟไลน์';
	@override String get on => 'เปิด';
	@override String get online => 'ออนไลน์';
	@override String get open => 'เปิด';
	@override String get queue => 'คิว';
	@override String get quickSave => 'บันทึกด่วน';
	@override String get renamed => 'เปลี่ยนชื่อแล้ว';
	@override String get reset => 'ตั้งใหม่';
	@override String get restart => 'เริ่มต้นใหม่';
	@override String get settings => 'การตั้งค่า';
	@override String get skipped => 'ข้ามไป';
	@override String get start => 'เริ่ม';
	@override String get stop => 'หยุด';
	@override String get save => 'บันทึก';
	@override String get unchanged => 'ไม่เปลี่ยนแปลง';
	@override String get unknown => 'ไม่รู้จัก';
	@override String get noItemInClipboard => 'ไม่มีรายการใดในคลิปบอร์ด';
}

// Path: receiveTab
class _StringsReceiveTabTh extends _StringsReceiveTabEn {
	_StringsReceiveTabTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'รับ';
	@override late final _StringsReceiveTabInfoBoxTh infoBox = _StringsReceiveTabInfoBoxTh._(_root);
}

// Path: sendTab
class _StringsSendTabTh extends _StringsSendTabEn {
	_StringsSendTabTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ส่ง';
	@override late final _StringsSendTabSelectionTh selection = _StringsSendTabSelectionTh._(_root);
	@override late final _StringsSendTabPickerTh picker = _StringsSendTabPickerTh._(_root);
	@override String get shareIntentInfo => 'คุณยังสามารถใช้ฟีเจอร์ "แชร์" บนอุปกรณ์เคลื่อนที่ของคุณเพื่อเลือกไฟล์ให้ง่ายขึ้น';
	@override String get nearbyDevices => 'อุปกรณ์ใกล้เคียง';
	@override String get thisDevice => 'อุปกรณ์นี้';
	@override String get scan => 'มองหาอุปกรณ์';
	@override String get sendMode => 'โหลดส่ง';
	@override late final _StringsSendTabSendModesTh sendModes = _StringsSendTabSendModesTh._(_root);
	@override String get sendModeHelp => 'คำอธิบาย';
	@override String get help => 'โปรดตรวจสอบให้แน่ใจว่าเป้าหมายที่ต้องการนั้นอยู่ในเครือข่าย wifi เดียวกันหรือเปล่า';
	@override String get placeItems => 'วางรายการที่จะแชร์';
}

// Path: settingsTab
class _StringsSettingsTabTh extends _StringsSettingsTabEn {
	_StringsSettingsTabTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'การตั้งค่า';
	@override late final _StringsSettingsTabGeneralTh general = _StringsSettingsTabGeneralTh._(_root);
	@override late final _StringsSettingsTabReceiveTh receive = _StringsSettingsTabReceiveTh._(_root);
	@override late final _StringsSettingsTabNetworkTh network = _StringsSettingsTabNetworkTh._(_root);
	@override late final _StringsSettingsTabOtherTh other = _StringsSettingsTabOtherTh._(_root);
	@override String get advancedSettings => 'ตั้งค่าขั้นสูง';
}

// Path: troubleshootPage
class _StringsTroubleshootPageTh extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'แก้ไขปัญหา';
	@override String get subTitle => 'แอพนี้ไม่ทำงานอย่างที่คาดไว้ใช่ไหม? คุณสามารถพบวิธีแก้ปัญหาทั่วไปได้ที่นี่';
	@override String get solution => 'วิธีทำ:';
	@override String get fixButton => 'แก้ไขโดยอัตโนมัติ';
	@override late final _StringsTroubleshootPageFirewallTh firewall = _StringsTroubleshootPageFirewallTh._(_root);
	@override late final _StringsTroubleshootPageNoConnectionTh noConnection = _StringsTroubleshootPageNoConnectionTh._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageTh extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ประวัติ';
	@override String get openFolder => 'เปิดโฟลเดอร์';
	@override String get deleteHistory => 'ลบประวัติ';
	@override String get empty => 'ประวัติว่างเปล่า';
	@override late final _StringsReceiveHistoryPageEntryActionsTh entryActions = _StringsReceiveHistoryPageEntryActionsTh._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageTh extends _StringsApkPickerPageEn {
	_StringsApkPickerPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'แอป (APK)';
	@override String get excludeSystemApps => 'ยกเว้นแอประบบ';
	@override String get excludeAppsWithoutLaunchIntent => 'ยกเว้นแอปที่ไม่สามารถเปิดใช้งานได้';
	@override String apps({required Object n}) => '${n} แอป';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageTh extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'ลบทั้งหมด';
}

// Path: receivePage
class _StringsReceivePageTh extends _StringsReceivePageEn {
	_StringsReceivePageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(n,
		one: 'ต้องการส่งไฟล์ให้คุณ',
		other: 'ต้องการส่งไฟล์ ${n} ให้คุณ',
	);
	@override String get subTitleMessage => 'ส่งข้อความถึงคุณ:';
	@override String get subTitleLink => 'ส่งลิงค์ให้คุณ:';
	@override String get canceled => 'ผู้ส่งได้ยกเลิกคำขอแล้ว';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageTh extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ตัวเลือก';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(โฟลเดอร์ของ LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'ปิดโดยอัตโนมัติเนื่องจากมีไดเร็กทอรี';
}

// Path: sendPage
class _StringsSendPageTh extends _StringsSendPageEn {
	_StringsSendPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'รอการตอบกลับ...';
	@override String get rejected => 'ผู้รับได้ปฏิเสธคำขอ';
	@override String get busy => 'ผู้รับกำลังยุ่งอยู่กับคำขออื่น';
}

// Path: progressPage
class _StringsProgressPageTh extends _StringsProgressPageEn {
	_StringsProgressPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'กำลังส่งไฟล์';
	@override String get titleReceiving => 'กำลังรับไฟล์';
	@override String get savedToGallery => 'บันทึกไว้ในรูปถ่าย';
	@override late final _StringsProgressPageTotalTh total = _StringsProgressPageTotalTh._(_root);
}

// Path: webSharePage
class _StringsWebSharePageTh extends _StringsWebSharePageEn {
	_StringsWebSharePageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'แชร์ผ่านลิงก์';
	@override String get loading => 'กำลังเริ่มเซิร์ฟเวอร์...';
	@override String get stopping => 'กำลังหยุดเซิร์ฟเวอร์...';
	@override String get error => 'เกิดข้อผิดพลาดขณะเริ่มเซิร์ฟเวอร์';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(n,
		one: 'เปิดลิงค์นี้ในเบราว์เซอร์:',
		other: 'เปิดลิงก์ใดลิงก์หนึ่งพวกนี้ในเบราว์เซอร์:',
	);
	@override String get requests => 'คำขอ';
	@override String get noRequests => 'ยังไม่มีคำขอ';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend ใช้ใบรับรองที่ลงนามด้วยตัวเอง คุณต้องยอมรับในเบราว์เซอร์';
	@override String pendingRequests({required Object n}) => 'คำขอที่รอดำเนินการ: ${n}';
}

// Path: aboutPage
class _StringsAboutPageTh extends _StringsAboutPageEn {
	_StringsAboutPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'เกี่ยวกับ LocalSend';
	@override List<String> get description => [
		'LocalSend เป็นแอปโอเพ่นซอร์สฟรีที่ช่วยให้คุณแบ่งปันไฟล์และข้อความอย่างปลอดภัยกับอุปกรณ์ใกล้เคียงผ่านเครือข่ายท้องถิ่นของคุณโดยไม่จำเป็นต้องเชื่อมต่ออินเทอร์เน็ต',
		'แอปนี้พร้อมใช้งานบน Android, iOS, macOS, Windows และ Linux คุณสามารถค้นหาตัวเลือกการดาวน์โหลดทั้งหมดได้จากหน้าแรกของเว็บไซต์ที่ทางการ',
	];
	@override String get author => 'ผู้เขียน';
	@override String get contributors => 'ผู้มีส่วนร่วม';
	@override String get translators => 'ผู้แปล';
}

// Path: donationPage
class _StringsDonationPageTh extends _StringsDonationPageEn {
	_StringsDonationPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'บริจาค';
	@override String get info => 'LocalSend เป็นบริการโอเพ่นซอร์สฟรีและไม่มีโฆษณา หากคุณชอบแอพนี้ คุณสามารถสนับสนุนการพัฒนาด้วยการบริจาค';
	@override String donate({required Object amount}) => 'บริจาค ${amount}';
	@override String get thanks => 'ขอบคุณมาก!';
	@override String get restore => 'คืนค่าการซื้อ';
}

// Path: changelogPage
class _StringsChangelogPageTh extends _StringsChangelogPageEn {
	_StringsChangelogPageTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'บันทึกการเปลี่ยนแปลง';
}

// Path: aliasGenerator
class _StringsAliasGeneratorTh extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
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
	@override List<String> get fruits => [
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
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsTh extends _StringsDialogsEn {
	_StringsDialogsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileTh addFile = _StringsDialogsAddFileTh._(_root);
	@override late final _StringsDialogsAddressInputTh addressInput = _StringsDialogsAddressInputTh._(_root);
	@override late final _StringsDialogsCancelSessionTh cancelSession = _StringsDialogsCancelSessionTh._(_root);
	@override late final _StringsDialogsCannotOpenFileTh cannotOpenFile = _StringsDialogsCannotOpenFileTh._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeTh encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeTh._(_root);
	@override late final _StringsDialogsErrorDialogTh errorDialog = _StringsDialogsErrorDialogTh._(_root);
	@override late final _StringsDialogsFavoriteDialogTh favoriteDialog = _StringsDialogsFavoriteDialogTh._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogTh favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogTh._(_root);
	@override late final _StringsDialogsFavoriteEditDialogTh favoriteEditDialog = _StringsDialogsFavoriteEditDialogTh._(_root);
	@override late final _StringsDialogsFileInfoTh fileInfo = _StringsDialogsFileInfoTh._(_root);
	@override late final _StringsDialogsFileNameInputTh fileNameInput = _StringsDialogsFileNameInputTh._(_root);
	@override late final _StringsDialogsHistoryClearDialogTh historyClearDialog = _StringsDialogsHistoryClearDialogTh._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedTh localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedTh._(_root);
	@override late final _StringsDialogsMessageInputTh messageInput = _StringsDialogsMessageInputTh._(_root);
	@override late final _StringsDialogsNoFilesTh noFiles = _StringsDialogsNoFilesTh._(_root);
	@override late final _StringsDialogsNoPermissionTh noPermission = _StringsDialogsNoPermissionTh._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformTh notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformTh._(_root);
	@override late final _StringsDialogsQrTh qr = _StringsDialogsQrTh._(_root);
	@override late final _StringsDialogsQuickActionsTh quickActions = _StringsDialogsQuickActionsTh._(_root);
	@override late final _StringsDialogsQuickSaveNoticeTh quickSaveNotice = _StringsDialogsQuickSaveNoticeTh._(_root);
	@override late final _StringsDialogsSendModeHelpTh sendModeHelp = _StringsDialogsSendModeHelpTh._(_root);
}

// Path: tray
class _StringsTrayTh extends _StringsTrayEn {
	_StringsTrayTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'ออกจาก LocalSend';
}

// Path: web
class _StringsWebTh extends _StringsWebEn {
	_StringsWebTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'ถูกปฏิเสธ';
	@override String get files => 'ไฟล์';
	@override String get fileName => 'ชื่อไฟล์';
	@override String get size => 'ขนาด';
}

// Path: assetPicker
class _StringsAssetPickerTh extends _StringsAssetPickerEn {
	_StringsAssetPickerTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'ยืนยัน';
	@override String get cancel => 'ยกเลิก';
	@override String get edit => 'แก้ไข';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'โหลดล้มเหลว';
	@override String get original => 'ต้นฉบับ';
	@override String get preview => 'ตัวอย่าง';
	@override String get select => 'เลือก';
	@override String get emptyList => 'รายการว่างเปล่า';
	@override String get unSupportedAssetType => 'ประเภทไฟล์ที่ไม่รองรับ';
	@override String get unableToAccessAll => 'ไม่สามารถเข้าถึงไฟล์ทั้งหมดบนอุปกรณ์';
	@override String get viewingLimitedAssetsTip => 'ดูเฉพาะไฟล์และอัลบั้มที่เข้าถึงได้โดยแอป';
	@override String get changeAccessibleLimitedAssets => 'คลิกเพื่ออัปเดตไฟล์ที่เข้าถึงได้';
	@override String get accessAllTip => 'แอปสามารถเข้าถึงไฟล์บางไฟล์บนอุปกรณ์เท่านั้น ไปที่การตั้งค่าระบบและอนุญาตให้แอปเข้าถึงสื่อทั้งหมดบนอุปกรณ์';
	@override String get goToSystemSettings => 'ไปที่การตั้งค่าระบบ';
	@override String get accessLimitedAssets => 'ดำเนินการต่อด้วยการเข้าถึงแบบจำกัด';
	@override String get accessiblePathName => 'ไฟล์ที่เข้าถึงได้';
	@override String get sTypeAudioLabel => 'เสียง';
	@override String get sTypeImageLabel => 'รูปภาพ';
	@override String get sTypeVideoLabel => 'วิดีโอ';
	@override String get sTypeOtherLabel => 'สื่ออื่นๆ';
	@override String get sActionPlayHint => 'เล่น';
	@override String get sActionPreviewHint => 'ตัวอย่าง';
	@override String get sActionSelectHint => 'เลือก';
	@override String get sActionSwitchPathLabel => 'เปลี่ยนเส้นทาง';
	@override String get sActionUseCameraHint => 'ใช้กล้อง';
	@override String get sNameDurationLabel => 'ความยาว';
	@override String get sUnitAssetCountLabel => 'จำนวน';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxTh extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get ip => 'ไอพี:';
	@override String get port => 'พอร์ต:';
	@override String get alias => 'นามแฝง:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionTh extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'การเลือก';
	@override String files({required Object files}) => 'ไฟล์: ${files}';
	@override String size({required Object size}) => 'ขนาด: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerTh extends _StringsSendTabPickerEn {
	_StringsSendTabPickerTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get file => 'ไฟล์';
	@override String get folder => 'โฟลเดอร์';
	@override String get media => 'มีเดีย';
	@override String get text => 'ข้อความ';
	@override String get app => 'แอป';
	@override String get clipboard => 'วาง';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesTh extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get single => 'ผู้รับคนเดียว';
	@override String get multiple => 'ผู้รับหลายคน';
	@override String get link => 'แชร์ผ่านลิงก์';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralTh extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ทั่วไป';
	@override String get brightness => 'ธีม';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsTh brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsTh._(_root);
	@override String get color => 'สี';
	@override late final _StringsSettingsTabGeneralColorOptionsTh colorOptions = _StringsSettingsTabGeneralColorOptionsTh._(_root);
	@override String get language => 'ภาษา';
	@override late final _StringsSettingsTabGeneralLanguageOptionsTh languageOptions = _StringsSettingsTabGeneralLanguageOptionsTh._(_root);
	@override String get saveWindowPlacement => 'ออก: บันทึกตำแหน่งหน้าต่าง';
	@override String get minimizeToTray => 'ออก: ย่อให้เล็กสุดไปยังแถบเทรย์/แถบเมนู';
	@override String get launchAtStartup => 'เริ่มอัตโนมัติหลังจากเข้าสู่ระบบ';
	@override String get launchMinimized => 'เริ่มอัตโนมัติ: เริ่มซ่อน';
	@override String get animations => 'ภาพเคลื่อนไหว';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveTh extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'รับ';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'เสร็จสิ้นอัตโนมัติ';
	@override String get destination => 'ปลายทาง';
	@override String get downloads => '(ดาวน์โหลด)';
	@override String get saveToGallery => 'บันทึกมีเดียลงแกลอรี่';
	@override String get saveToHistory => 'บันทึกลงในประวัติ';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkTh extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'เครือข่าย';
	@override String get needRestart => 'เริ่มต้นเซิร์ฟเวอร์ใหม่เพื่อปรับการตั้งค่า!';
	@override String get server => 'เซิร์ฟเวอร์';
	@override String get alias => 'นามแฝง';
	@override String get deviceType => 'ประเภทอุปกรณ์';
	@override String get deviceModel => 'รุ่นอุปกรณ์';
	@override String get port => 'พอร์ต';
	@override String portWarning({required Object defaultPort}) => 'อุปกรณ์อื่นอาจตรวจไม่พบเนื่องจากคุณใช้พอร์ตที่คุณกำหนดเอง (default: ${defaultPort})';
	@override String get encryption => 'การเข้ารหัส';
	@override String get multicastGroup => 'มัลติคาสต์';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'อุปกรณ์อื่นอาจตรวจไม่พบเนื่องจากคุณใช้ที่อยู่มัลติคาสต์แบบกำหนดเอง (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherTh extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'อื่นๆ';
	@override String get support => 'สนับสนุน LocalSend';
	@override String get donate => 'บริจาค';
	@override String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';
	@override String get termsOfUse => 'ข้อกำหนดการใช้งาน';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallTh extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'แอปนี้สามารถส่งไฟล์ไปยังอุปกรณ์อื่นได้ แต่อุปกรณ์อื่นไม่สามารถส่งไฟล์ไปยังอุปกรณ์นี้ได้';
	@override String solution({required Object port}) => 'นี่น่าจะเป็นปัญหาจากไฟร์วอลล์ คุณสามารถแก้ไขได้ด้วยการอนุญาตการเชื่อมต่อขาเข้า (UDP และ TCP) บนพอร์ต ${port}';
	@override String get openFirewall => 'เปิดไฟร์วอลล์';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionTh extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'อุปกรณ์ทั้งสองไม่เจอกันและไม่สามารถแชร์ไฟล์ได้';
	@override String get solution => 'ปัญหามีอยู่ทั้งสองฝ่าย? จากนั้น คุณต้องตรวจสอบให้แน่ใจว่าอุปกรณ์ทั้งสองอยู่ในเครือข่าย wifi เดียวกันและใช้การกำหนดค่าเดียวกัน (พอร์ต ที่อยู่มัลติคาสต์ การเข้ารหัส) wifi อาจไม่อนุญาตให้มีการสื่อสารระหว่างผู้เข้าร่วม ในกรณีนี้ ต้องเปิดใช้งานตัวเลือกนี้บนเราเตอร์';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsTh extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get open => 'เปิดไฟล์';
	@override String get info => 'ข้อมูล';
	@override String get deleteFromHistory => 'ลบออกจากประวัติ';
}

// Path: progressPage.total
class _StringsProgressPageTotalTh extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleTh title = _StringsProgressPageTotalTitleTh._(_root);
	@override String count({required Object curr, required Object n}) => 'ไฟล์: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'ขนาด: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'ความเร็ว: ${speed}/วิ';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileTh extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'เพิ่มไปยังส่วนที่เลือก';
	@override String get content => 'คุณต้องการจะเพิ่มอะไร?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputTh extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'กรอกที่อยู่';
	@override String get hashtag => 'แฮชแท็ก';
	@override String get ip => 'ที่อยู่ไอพี';
	@override String get recentlyUsed => 'ใช้งานล่าสุด: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionTh extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ยกเลิกการโอนไฟล์';
	@override String get content => 'คุณต้องการยกเลิกการโอนไฟล์หรือไม่?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileTh extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ไม่สามารถเปิดไฟล์ได้';
	@override String content({required Object file}) => 'ไม่สามารถเปิดไฟล์ "${file}" ได้ ไฟล์นี้ถูกย้าย เปลี่ยนชื่อ หรือลบไปหรือเปล่า';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeTh extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ปิดใช้งานการเข้ารหัส';
	@override String get content => 'การสื่อสารขณะนี้เกิดขึ้นผ่านโปรโตคอล HTTP ที่ไม่ได้เข้ารหัส เพื่อที่จะใช้งาน HTTPS ให้เปิดใช้งานการเข้ารหัสอีกครั้ง';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogTh extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogTh extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'รายการโปรด';
	@override String get noFavorites => 'ยังไม่มีอุปกรณ์ในรายการโปรด';
	@override String get addFavorite => 'เพิ่ม';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogTh extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ลบจากรายการโปรด';
	@override String content({required Object name}) => 'คุณต้องการลบ "${name}" ออกจากรายการโปรดหรือไม่?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogTh extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'เพิ่มในรายการโปรด';
	@override String get titleEdit => 'ปรับแต่ง';
	@override String get name => 'ชื่อเล่น';
	@override String get auto => '(อัตโนมัติ)';
	@override String get ip => 'ที่อยู่ IP';
	@override String get port => 'พอร์ต';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoTh extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ข้อมูลไฟล์';
	@override String get fileName => 'ชื่อไฟล์:';
	@override String get path => 'เส้นทาง:';
	@override String get size => 'ขนาด:';
	@override String get sender => 'ผู้ส่ง:';
	@override String get time => 'เวลา:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputTh extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'กรอกชื่อไฟล์';
	@override String original({required Object original}) => 'ต้นฉบับ: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogTh extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ล้างประวัติ';
	@override String get content => 'คุณต้องการลบประวัติทั้งหมดจริงๆหรือไม่?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedTh extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend ไม่สามารถค้นหาอุปกรณ์อื่นได้หากไม่มีสิทธิ์ในการสแกนเครือข่ายท้องถิ่น โปรดอนุญาตสิทธิ์นี้ในการตั้งค่า';
	@override String get gotoSettings => 'การตั้งค่า';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputTh extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'พิมพ์ข้อความ';
	@override String get multiline => 'หลายบรรทัด';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesTh extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ไม่ได้เลือกไฟล์';
	@override String get content => 'โปรดเลือกไฟล์อย่างน้อยหนึ่งไฟล์';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionTh extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ไม่มีสิทธิ์';
	@override String get content => 'คุณยังไม่ได้ให้สิทธิ์ที่จำเป็น โปรดให้สิทธิ์เหล่านั้นในการตั้งค่า';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformTh extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ไม่พร้อมใช้งาน';
	@override String get content => 'ฟีเจอร์นี้ใช้งานเฉพาะบน:';
}

// Path: dialogs.qr
class _StringsDialogsQrTh extends _StringsDialogsQrEn {
	_StringsDialogsQrTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'คิวอาร์โค้ด';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsTh extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'การดำเนินการอย่างรวดเร็ว';
	@override String get counter => 'ตัวนับ';
	@override String get prefix => 'คำนำหน้า';
	@override String get padZero => 'เติมศูนย์ด้านหน้า';
	@override String get sortBeforeCount => 'เรียงตามตัวอักษรไว้ก่อน';
	@override String get random => 'สุ่ม';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeTh extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'คำขอไฟล์ได้รับการยอมรับโดยอัตโนมัติ โปรดทราบว่าทุกคนในเครือข่ายท้องถิ่นสามารถส่งไฟล์ถึงคุณได้';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpTh extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'โหมดส่ง';
	@override String get single => 'ส่งไฟล์ไปยังผู้รับคนเดียว การเลือกจะถูกล้างออกออกหลังจากเสร็จสิ้นการโอนไฟล์';
	@override String get multiple => 'ส่งไฟล์ไปยังผู้รับหลายคน การเลือกจะไม่ถูกล้างออก';
	@override String get link => 'ผู้รับที่ไม่ได้ติดตั้ง LocalSend สามารถดาวน์โหลดไฟล์ที่เลือกได้โดยเปิดลิงก์ในเบราว์เซอร์';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsTh extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get system => 'ระบบ';
	@override String get dark => 'มืด';
	@override String get light => 'สว่าง';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsTh extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get system => 'ระบบ';
	@override String get oled => 'โอเล็ด';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsTh extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String get system => 'ระบบ';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleTh extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleTh._(_StringsTh root) : this._root = root, super._(root);

	@override final _StringsTh _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'ความก้าวคลืบหน้าทั้งหมด (${time})';
	@override String get finishedError => 'เสร็จสิ้นมีข้อผิดพลาด';
	@override String get canceledSender => 'ยกเลิกโดยผู้ส่ง';
	@override String get canceledReceiver => 'ยกเลิกโดยผู้รับ';
}
