part of 'strings.g.dart';

// Path: <root>
class _StringsIw extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIw.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.iw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <iw>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsIw _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'עברית';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralIw general = _StringsGeneralIw._(_root);
	@override late final _StringsReceiveTabIw receiveTab = _StringsReceiveTabIw._(_root);
	@override late final _StringsSendTabIw sendTab = _StringsSendTabIw._(_root);
	@override late final _StringsSettingsTabIw settingsTab = _StringsSettingsTabIw._(_root);
	@override late final _StringsTroubleshootPageIw troubleshootPage = _StringsTroubleshootPageIw._(_root);
	@override late final _StringsReceiveHistoryPageIw receiveHistoryPage = _StringsReceiveHistoryPageIw._(_root);
	@override late final _StringsApkPickerPageIw apkPickerPage = _StringsApkPickerPageIw._(_root);
	@override late final _StringsSelectedFilesPageIw selectedFilesPage = _StringsSelectedFilesPageIw._(_root);
	@override late final _StringsReceivePageIw receivePage = _StringsReceivePageIw._(_root);
	@override late final _StringsReceiveOptionsPageIw receiveOptionsPage = _StringsReceiveOptionsPageIw._(_root);
	@override late final _StringsSendPageIw sendPage = _StringsSendPageIw._(_root);
	@override late final _StringsProgressPageIw progressPage = _StringsProgressPageIw._(_root);
	@override late final _StringsWebSharePageIw webSharePage = _StringsWebSharePageIw._(_root);
	@override late final _StringsAboutPageIw aboutPage = _StringsAboutPageIw._(_root);
	@override late final _StringsChangelogPageIw changelogPage = _StringsChangelogPageIw._(_root);
	@override late final _StringsAliasGeneratorIw aliasGenerator = _StringsAliasGeneratorIw._(_root);
	@override late final _StringsDialogsIw dialogs = _StringsDialogsIw._(_root);
	@override late final _StringsTrayIw tray = _StringsTrayIw._(_root);
	@override late final _StringsWebIw web = _StringsWebIw._(_root);
	@override late final _StringsAssetPickerIw assetPicker = _StringsAssetPickerIw._(_root);
}

// Path: general
class _StringsGeneralIw extends _StringsGeneralEn {
	_StringsGeneralIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get accept => 'קבלה';
	@override String get accepted => 'התקבל';
	@override String get add => 'הוסף';
	@override String get advanced => 'מידע נוסף';
	@override String get cancel => 'ביטול';
	@override String get close => 'סגור';
	@override String get confirm => 'אישור';
	@override String get continueStr => 'המשך';
	@override String get copy => 'העתק';
	@override String get copiedToClipboard => 'הועתק ללוח';
	@override String get decline => 'דחיה';
	@override String get done => 'אישור';
	@override String get edit => 'עריכה';
	@override String get error => 'שגיאה';
	@override String get example => 'דוגמא';
	@override String get files => 'קבצים';
	@override String get finished => 'הסתיים';
	@override String get hide => 'הסתר';
	@override String get off => 'כבוי';
	@override String get offline => 'אין אינטרנט';
	@override String get on => 'פעיל';
	@override String get online => 'מקוון';
	@override String get open => 'פתח';
	@override String get queue => 'תור';
	@override String get quickSave => 'שמירה מהירה';
	@override String get renamed => 'שונה שם';
	@override String get reset => 'איפוס';
	@override String get restart => 'הפעל מחדש';
	@override String get settings => 'הגדרות';
	@override String get skipped => 'דילג';
	@override String get start => 'התחל';
	@override String get stop => 'עצור';
	@override String get save => 'שמור';
	@override String get unchanged => 'ללא שינוי';
	@override String get unknown => 'לא ידוע';
	@override String get noItemInClipboard => 'לוח ההעתקה ריק';
}

// Path: receiveTab
class _StringsReceiveTabIw extends _StringsReceiveTabEn {
	_StringsReceiveTabIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבלה';
	@override late final _StringsReceiveTabInfoBoxIw infoBox = _StringsReceiveTabInfoBoxIw._(_root);
}

// Path: sendTab
class _StringsSendTabIw extends _StringsSendTabEn {
	_StringsSendTabIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'שליחה';
	@override late final _StringsSendTabSelectionIw selection = _StringsSendTabSelectionIw._(_root);
	@override late final _StringsSendTabPickerIw picker = _StringsSendTabPickerIw._(_root);
	@override String get shareIntentInfo => 'תוכל גם להשתמש בתכונת "שתף" של המכשיר הנייד שלך כדי לבחור קבצים בקלות.';
	@override String get nearbyDevices => 'מכשירים בקרבת מקום';
	@override String get thisDevice => 'המכשיר הזה';
	@override String get scan => 'חפש מכשירים';
	@override String get sendMode => 'מצב שליחה';
	@override late final _StringsSendTabSendModesIw sendModes = _StringsSendTabSendModesIw._(_root);
	@override String get sendModeHelp => 'תיאור';
	@override String get help => 'אנא ודא שאתה ומכשיר היעד נמצאים באותה רשת wifi.';
	@override String get placeItems => 'הצב פריטים לשיתוף.';
}

// Path: settingsTab
class _StringsSettingsTabIw extends _StringsSettingsTabEn {
	_StringsSettingsTabIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'הגדרות';
	@override late final _StringsSettingsTabGeneralIw general = _StringsSettingsTabGeneralIw._(_root);
	@override late final _StringsSettingsTabReceiveIw receive = _StringsSettingsTabReceiveIw._(_root);
	@override late final _StringsSettingsTabNetworkIw network = _StringsSettingsTabNetworkIw._(_root);
	@override String get advancedSettings => 'הגדרות מתקדמות';
}

// Path: troubleshootPage
class _StringsTroubleshootPageIw extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'פתרון תקלות';
	@override String get subTitle => 'האפליקציה לא פועלת כפי שציפית? כאן תוכל למצוא פתרונות נפוצים.';
	@override String get solution => 'פתרון:';
	@override String get fixButton => 'תקן אוטומטית';
	@override late final _StringsTroubleshootPageFirewallIw firewall = _StringsTroubleshootPageFirewallIw._(_root);
	@override late final _StringsTroubleshootPageNoConnectionIw noConnection = _StringsTroubleshootPageNoConnectionIw._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageIw extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'היסטוריה';
	@override String get openFolder => 'פתח תיקייה';
	@override String get deleteHistory => 'מחק היסטוריה';
	@override String get empty => 'ההיסטוריה ריקה.';
	@override late final _StringsReceiveHistoryPageEntryActionsIw entryActions = _StringsReceiveHistoryPageEntryActionsIw._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageIw extends _StringsApkPickerPageEn {
	_StringsApkPickerPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפליקציות (APK)';
	@override String get excludeSystemApps => 'אל תכלול אפליקציות מערכת';
	@override String get excludeAppsWithoutLaunchIntent => 'אל תכלול אפליקציות שאינן ניתנות להפעלה';
	@override String apps({required Object n}) => '${n} אפליקציות';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageIw extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'מחק הכל';
}

// Path: receivePage
class _StringsReceivePageIw extends _StringsReceivePageEn {
	_StringsReceivePageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('iw'))(n,
		one: 'רוצה לשלוח לך קובץ.',
		other: 'רוצה לשלוח לך ${n} קבצים.',
	);
	@override String get subTitleMessage => 'שלח לך הודעה:';
	@override String get subTitleLink => 'שלח לך קישור:';
	@override String get canceled => 'השולח ביטל את הבקשה.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageIw extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפשרויות';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(תיקיית LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'כבוי באופן אוטומטי בשל קיום ספריות.';
}

// Path: sendPage
class _StringsSendPageIw extends _StringsSendPageEn {
	_StringsSendPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'ממתין לתגובה...';
	@override String get rejected => 'הנמען דחה את הבקשה.';
	@override String get busy => 'המקבל תפוס בבקשה אחרת.';
}

// Path: progressPage
class _StringsProgressPageIw extends _StringsProgressPageEn {
	_StringsProgressPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'שולח קבצים';
	@override String get titleReceiving => 'מקבל קבצים';
	@override String get savedToGallery => 'נשמר בתמונות';
	@override late final _StringsProgressPageTotalIw total = _StringsProgressPageTotalIw._(_root);
}

// Path: webSharePage
class _StringsWebSharePageIw extends _StringsWebSharePageEn {
	_StringsWebSharePageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'שיתוף באמצעות קישור';
	@override String get loading => 'הפעלת השרת...';
	@override String get stopping => 'השהיית השרת...';
	@override String get error => 'אירעה שגיאה בזמן התחלת השרת.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('iw'))(n,
		one: 'פתח את הקישור בדפדפן:',
		other: 'פתח אחד מהקישורים הללו בדפדפן:',
	);
	@override String get requests => 'בקשות';
	@override String get noRequests => 'אין כרגע בקשות.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend משתמש בתעודה עצמית. עליך לאשר אותה בדפדפן.';
	@override String pendingRequests({required Object n}) => 'בקשות בהמתנה: ${n}';
}

// Path: aboutPage
class _StringsAboutPageIw extends _StringsAboutPageEn {
	_StringsAboutPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'אודות LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageIw extends _StringsChangelogPageEn {
	_StringsChangelogPageIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'יומן שינויים';
}

// Path: aliasGenerator
class _StringsAliasGeneratorIw extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsIw extends _StringsDialogsEn {
	_StringsDialogsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileIw addFile = _StringsDialogsAddFileIw._(_root);
	@override late final _StringsDialogsAddressInputIw addressInput = _StringsDialogsAddressInputIw._(_root);
	@override late final _StringsDialogsCancelSessionIw cancelSession = _StringsDialogsCancelSessionIw._(_root);
	@override late final _StringsDialogsCannotOpenFileIw cannotOpenFile = _StringsDialogsCannotOpenFileIw._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeIw encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeIw._(_root);
	@override late final _StringsDialogsErrorDialogIw errorDialog = _StringsDialogsErrorDialogIw._(_root);
	@override late final _StringsDialogsFileInfoIw fileInfo = _StringsDialogsFileInfoIw._(_root);
	@override late final _StringsDialogsFileNameInputIw fileNameInput = _StringsDialogsFileNameInputIw._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedIw localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedIw._(_root);
	@override late final _StringsDialogsMessageInputIw messageInput = _StringsDialogsMessageInputIw._(_root);
	@override late final _StringsDialogsNoFilesIw noFiles = _StringsDialogsNoFilesIw._(_root);
	@override late final _StringsDialogsNoPermissionIw noPermission = _StringsDialogsNoPermissionIw._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformIw notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformIw._(_root);
	@override late final _StringsDialogsQrIw qr = _StringsDialogsQrIw._(_root);
	@override late final _StringsDialogsQuickActionsIw quickActions = _StringsDialogsQuickActionsIw._(_root);
	@override late final _StringsDialogsQuickSaveNoticeIw quickSaveNotice = _StringsDialogsQuickSaveNoticeIw._(_root);
	@override late final _StringsDialogsSendModeHelpIw sendModeHelp = _StringsDialogsSendModeHelpIw._(_root);
}

// Path: tray
class _StringsTrayIw extends _StringsTrayEn {
	_StringsTrayIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'צא מ-LocalSend';
}

// Path: web
class _StringsWebIw extends _StringsWebEn {
	_StringsWebIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'נדחה';
	@override String get files => 'קבצים';
	@override String get fileName => 'שם קובץ';
	@override String get size => 'גודל';
}

// Path: assetPicker
class _StringsAssetPickerIw extends _StringsAssetPickerEn {
	_StringsAssetPickerIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'אישור';
	@override String get cancel => 'ביטול';
	@override String get edit => 'עריכה';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'טעינת הקובץ נכשלה';
	@override String get original => 'מקור';
	@override String get preview => 'תצוגה מקדימה';
	@override String get select => 'בחירה';
	@override String get emptyList => 'רשימה ריקה';
	@override String get unSupportedAssetType => 'סוג קובץ לא נתמך';
	@override String get unableToAccessAll => 'לא ניתן לגשת לכל הקבצים במכשיר';
	@override String get viewingLimitedAssetsTip => 'ניתן להציג רק קבצים ואלבומים שנגישים לאפליקציה.';
	@override String get changeAccessibleLimitedAssets => 'לחץ כדי לעדכן את הקבצים שנגישים';
	@override String get accessAllTip => 'האפליקציה יכולה לגשת רק לקבצים מסוימים במכשיר. עבור להגדרות המערכת ואפשר לאפליקציה לגשת לכל הקבצים שבמכשיר.';
	@override String get goToSystemSettings => 'מעבר להגדרות המערכת';
	@override String get accessLimitedAssets => 'המשך עם גישה מוגבלת';
	@override String get accessiblePathName => 'קבצים שנגישים';
	@override String get sTypeAudioLabel => 'שמע';
	@override String get sTypeImageLabel => 'תמונה';
	@override String get sTypeVideoLabel => 'סרטון';
	@override String get sTypeOtherLabel => 'סוגים אחרים';
	@override String get sActionPlayHint => 'הפעלה';
	@override String get sActionPreviewHint => 'תצוגה מקדימה';
	@override String get sActionSelectHint => 'בחירה';
	@override String get sActionSwitchPathLabel => 'שינוי נתיב';
	@override String get sActionUseCameraHint => 'שימוש במצלמה';
	@override String get sNameDurationLabel => 'משך זמן';
	@override String get sUnitAssetCountLabel => 'מספר';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxIw extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'יציאה:';
	@override String get alias => 'כינוי:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionIw extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'בחירה';
	@override String files({required Object files}) => 'קבצים: ${files}';
	@override String size({required Object size}) => 'גודל: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerIw extends _StringsSendTabPickerEn {
	_StringsSendTabPickerIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get file => 'קובץ';
	@override String get folder => 'תיקייה';
	@override String get media => 'מדיה';
	@override String get text => 'טקסט';
	@override String get app => 'אפליקציה';
	@override String get clipboard => 'לוח ההעתקה';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesIw extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get single => 'שליחה למקבל בודד';
	@override String get multiple => 'שליחה למקבלים מרובים';
	@override String get link => 'שיתוף באמצעות קישור';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralIw extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'כללי';
	@override String get brightness => 'ערכת נושא';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsIw brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsIw._(_root);
	@override String get color => 'צבע';
	@override late final _StringsSettingsTabGeneralColorOptionsIw colorOptions = _StringsSettingsTabGeneralColorOptionsIw._(_root);
	@override String get language => 'שפה';
	@override late final _StringsSettingsTabGeneralLanguageOptionsIw languageOptions = _StringsSettingsTabGeneralLanguageOptionsIw._(_root);
	@override String get saveWindowPlacement => 'יציאה: שמירת מיקום החלון';
	@override String get minimizeToTray => 'יציאה: מזעור למגש';
	@override String get launchAtStartup => 'הפעלה אוטומטית לאחר הכניסה';
	@override String get launchMinimized => 'הפעלה אוטומטית: התחל מוסתר';
	@override String get animations => 'אנימציות';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveIw extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבלה';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'יעד';
	@override String get downloads => '(הורדות)';
	@override String get saveToGallery => 'שמור מדיה לגלריה';
	@override String get saveToHistory => 'שמור בהיסטוריה';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkIw extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'רשת';
	@override String get needRestart => 'הפעל מחדש את השרת כדי להחיל את ההגדרות!';
	@override String get server => 'שרת';
	@override String get alias => 'כינוי';
	@override String get deviceType => 'סוג המכשיר';
	@override String get deviceModel => 'דגם המכשיר';
	@override String get port => 'יציאה';
	@override String portWarning({required Object defaultPort}) => 'יתכן שלא יזוהו מכשירים אחרים בגלל שאתה משתמש ביציאה מותאמת אישית. (ברירת־מחדל: ${defaultPort})';
	@override String get encryption => 'הצפנה';
	@override String get multicastGroup => 'מולטיקאסט';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'יתכן שלא יזוהו מכשירים אחרים בגלל שאתה משתמש בכתובת מולטיקאסט מותאמת אישית. (ברירת־מחדל: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallIw extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'האפליקציה יכולה לשלוח קבצים למכשירים אחרים, אך מכשירים אחרים אינם יכולים לשלוח קבצים למכשיר זה.';
	@override String solution({required Object port}) => 'כנראה זו בעיה של חומת אש. באפשרותך לפתור את הבעיה על ידי אישור חיבורים נכנסים (UDP ו-TCP) ביציאה ${port}.';
	@override String get openFirewall => 'פתח את חומת האש';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionIw extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'שני המכשירים אינם יכולים לגלות אחד את השני ואין ביכולתם לשתף קבצים.';
	@override String get solution => 'הבעיה קיימת בשני הצדדים? אז עליך לוודא ששני המכשירים נמצאים באותה רשת WiFi וחולקים את אותה תצורה (יציאה, כתובת מולטיקאסט, הצפנה). רשת ה-WiFi עשויה שלא לאפשר תקשורת בין משתתפים. במקרה כזה, יש לאפשר אפשרות זו בנתב.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsIw extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get open => 'פתח קובץ';
	@override String get info => 'מידע';
	@override String get deleteFromHistory => 'מחק מההיסטוריה';
}

// Path: progressPage.total
class _StringsProgressPageTotalIw extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleIw title = _StringsProgressPageTotalTitleIw._(_root);
	@override String count({required Object curr, required Object n}) => 'קבצים: ${curr}/${n}';
	@override String size({required Object curr, required Object n}) => 'גודל: ${curr}/${n}';
	@override String speed({required Object speed}) => 'מהירות: ${speed}/שניה';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileIw extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'הוסף לבחירה';
	@override String get content => 'מה אתה רוצה להוסיף?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputIw extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכנס כתובת';
	@override String get hashtag => 'סולמית';
	@override String get ip => 'כתובת ה-IP';
	@override String get recentlyUsed => 'בשימוש לאחרונה: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionIw extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'בטל את העברת הקבצים';
	@override String get content => 'האם אתה באמת רוצה לבטל את העברת הקבצים?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileIw extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא ניתן לפתוח את הקובץ';
	@override String content({required Object file}) => 'לא ניתן לפתוח את "${file}". האם הקובץ הועבר, הועתק או נמחק?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeIw extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'ההצפנה מנוטרלת';
	@override String get content => 'התקשורת כעת מתבצעת בפרוטוקול HTTP שאינו מוצפן. כדי להשתמש ב-HTTPS, יש להפעיל שוב את ההצפנה.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogIw extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoIw extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'מידע על הקובץ';
	@override String get fileName => 'שם הקובץ:';
	@override String get path => 'נתיב:';
	@override String get size => 'גודל:';
	@override String get sender => 'שולח:';
	@override String get time => 'זמן:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputIw extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'הזן את שם הקובץ';
	@override String original({required Object original}) => 'מקורי: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedIw extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'ל־LocalSend אין אפשרות למצוא מכשירים אחרים ללא הרשאה לסריקת הרשת המקומית. בבקשה הענק את ההרשאה הזו בהגדרות.';
	@override String get gotoSettings => 'הגדרות';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputIw extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'הקלד הודעה';
	@override String get multiline => 'מרובה שורות';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesIw extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא נבחר אף קובץ';
	@override String get content => 'אנא בחר קובץ אחד לפחות.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionIw extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'אין הרשאה';
	@override String get content => 'אתה לא נתת הרשאות הנדרשות. אנא הענק את הרשאות בהגדרות.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformIw extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא זמין';
	@override String get content => 'תכונה זו זמינה רק במערכות הבאות:';
}

// Path: dialogs.qr
class _StringsDialogsQrIw extends _StringsDialogsQrEn {
	_StringsDialogsQrIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'קוד QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsIw extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'פעולות מהירות';
	@override String get counter => 'מונה';
	@override String get prefix => 'קידומת';
	@override String get padZero => 'ריפוד באפסים';
	@override String get sortBeforeCount => 'מיון לפי אלפביתי מראש';
	@override String get random => 'אקראי';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeIw extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'בקשות לקבצים מתקבלות אוטומטית. שים לב שכל אחד ברשת המקומית יוכל לשלוח לך קבצים.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpIw extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get title => 'מצבי שליחה';
	@override String get single => 'שולח קבצים למקבל בודד. בחירת הקבצים תתאפס לאחר העברת הקובץ.';
	@override String get multiple => 'שולח קבצים למקבלים מרובים. בחירת הקבצים לא תתאפס.';
	@override String get link => 'מקבלים ש-LocalSend לא מותקן אצלם יוכלו להוריד את הקבצים שנבחרו על ידי פתיחת הקישור בדפדפן.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsIw extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get dark => 'כהה';
	@override String get light => 'בהירה';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsIw extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsIw extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleIw extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleIw._(_StringsIw root) : this._root = root, super._(root);

	@override final _StringsIw _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'סה"כ התקדמות (${time})';
	@override String get finishedError => 'הסתיים עם שגיאה';
	@override String get canceledSender => 'בוטל על ידי השולח';
	@override String get canceledReceiver => 'בוטל על ידי הצד המקבל';
}
