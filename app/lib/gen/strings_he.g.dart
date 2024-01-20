part of 'strings.g.dart';

// Path: <root>
class _StringsHe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsHe _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'עברית';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralHe general = _StringsGeneralHe._(_root);
	@override late final _StringsReceiveTabHe receiveTab = _StringsReceiveTabHe._(_root);
	@override late final _StringsSendTabHe sendTab = _StringsSendTabHe._(_root);
	@override late final _StringsSettingsTabHe settingsTab = _StringsSettingsTabHe._(_root);
	@override late final _StringsTroubleshootPageHe troubleshootPage = _StringsTroubleshootPageHe._(_root);
	@override late final _StringsReceiveHistoryPageHe receiveHistoryPage = _StringsReceiveHistoryPageHe._(_root);
	@override late final _StringsApkPickerPageHe apkPickerPage = _StringsApkPickerPageHe._(_root);
	@override late final _StringsSelectedFilesPageHe selectedFilesPage = _StringsSelectedFilesPageHe._(_root);
	@override late final _StringsReceivePageHe receivePage = _StringsReceivePageHe._(_root);
	@override late final _StringsReceiveOptionsPageHe receiveOptionsPage = _StringsReceiveOptionsPageHe._(_root);
	@override late final _StringsSendPageHe sendPage = _StringsSendPageHe._(_root);
	@override late final _StringsProgressPageHe progressPage = _StringsProgressPageHe._(_root);
	@override late final _StringsWebSharePageHe webSharePage = _StringsWebSharePageHe._(_root);
	@override late final _StringsAboutPageHe aboutPage = _StringsAboutPageHe._(_root);
	@override late final _StringsDonationPageHe donationPage = _StringsDonationPageHe._(_root);
	@override late final _StringsChangelogPageHe changelogPage = _StringsChangelogPageHe._(_root);
	@override late final _StringsAliasGeneratorHe aliasGenerator = _StringsAliasGeneratorHe._(_root);
	@override late final _StringsDialogsHe dialogs = _StringsDialogsHe._(_root);
	@override late final _StringsTrayHe tray = _StringsTrayHe._(_root);
	@override late final _StringsWebHe web = _StringsWebHe._(_root);
	@override late final _StringsAssetPickerHe assetPicker = _StringsAssetPickerHe._(_root);
}

// Path: general
class _StringsGeneralHe extends _StringsGeneralEn {
	_StringsGeneralHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get accept => 'אישור';
	@override String get accepted => 'התקבל';
	@override String get add => 'הוספה';
	@override String get advanced => 'מידע נוסף';
	@override String get cancel => 'ביטול';
	@override String get close => 'סגור';
	@override String get confirm => 'אישור';
	@override String get continueStr => 'המשך';
	@override String get copy => 'העתקה';
	@override String get copiedToClipboard => 'הועתק ללוח';
	@override String get decline => 'דחיה';
	@override String get done => 'אישור';
	@override String get delete => 'מחיקה';
	@override String get edit => 'עריכה';
	@override String get error => 'שגיאה';
	@override String get example => 'דוגמא';
	@override String get files => 'קבצים';
	@override String get finished => 'הסתיים';
	@override String get hide => 'הסתרה';
	@override String get off => 'כבויה';
	@override String get offline => 'אין אינטרנט';
	@override String get on => 'פעילה';
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
class _StringsReceiveTabHe extends _StringsReceiveTabEn {
	_StringsReceiveTabHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבלה';
	@override late final _StringsReceiveTabInfoBoxHe infoBox = _StringsReceiveTabInfoBoxHe._(_root);
}

// Path: sendTab
class _StringsSendTabHe extends _StringsSendTabEn {
	_StringsSendTabHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'שליחה';
	@override late final _StringsSendTabSelectionHe selection = _StringsSendTabSelectionHe._(_root);
	@override late final _StringsSendTabPickerHe picker = _StringsSendTabPickerHe._(_root);
	@override String get shareIntentInfo => 'תוכל גם להשתמש בתכונת "שתף" של המכשיר הנייד שלך כדי לבחור קבצים בקלות.';
	@override String get nearbyDevices => 'מכשירים בקרבת מקום';
	@override String get thisDevice => 'המכשיר הזה';
	@override String get scan => 'חפש מכשירים';
	@override String get sendMode => 'מצב שליחה';
	@override late final _StringsSendTabSendModesHe sendModes = _StringsSendTabSendModesHe._(_root);
	@override String get sendModeHelp => 'עזרה';
	@override String get help => 'אנא ודא שאתה ומכשיר היעד נמצאים באותה רשת WiFi.';
	@override String get placeItems => 'הצב פריטים לשיתוף.';
}

// Path: settingsTab
class _StringsSettingsTabHe extends _StringsSettingsTabEn {
	_StringsSettingsTabHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הגדרות';
	@override late final _StringsSettingsTabGeneralHe general = _StringsSettingsTabGeneralHe._(_root);
	@override late final _StringsSettingsTabReceiveHe receive = _StringsSettingsTabReceiveHe._(_root);
	@override late final _StringsSettingsTabNetworkHe network = _StringsSettingsTabNetworkHe._(_root);
	@override late final _StringsSettingsTabOtherHe other = _StringsSettingsTabOtherHe._(_root);
	@override String get advancedSettings => 'הגדרות מתקדמות';
}

// Path: troubleshootPage
class _StringsTroubleshootPageHe extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פתרון תקלות';
	@override String get subTitle => 'האפליקציה לא פועלת כראוי? כאן תוכל למצוא פתרונות לבעיות נפוצות.';
	@override String get solution => 'פתרון:';
	@override String get fixButton => 'תקן אוטומטית';
	@override late final _StringsTroubleshootPageFirewallHe firewall = _StringsTroubleshootPageFirewallHe._(_root);
	@override late final _StringsTroubleshootPageNoConnectionHe noConnection = _StringsTroubleshootPageNoConnectionHe._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageHe extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'היסטוריה';
	@override String get openFolder => 'פתח תיקייה';
	@override String get deleteHistory => 'מחק היסטוריה';
	@override String get empty => 'ההיסטוריה ריקה.';
	@override late final _StringsReceiveHistoryPageEntryActionsHe entryActions = _StringsReceiveHistoryPageEntryActionsHe._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageHe extends _StringsApkPickerPageEn {
	_StringsApkPickerPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפליקציות (APK)';
	@override String get excludeSystemApps => 'אל תכלול אפליקציות מערכת';
	@override String get excludeAppsWithoutLaunchIntent => 'אל תכלול אפליקציות שאינן ניתנות להפעלה';
	@override String apps({required Object n}) => '${n} אפליקציות';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageHe extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'מחק הכל';
}

// Path: receivePage
class _StringsReceivePageHe extends _StringsReceivePageEn {
	_StringsReceivePageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('he'))(n,
		one: 'רוצה לשלוח לך קובץ',
		other: 'רוצה לשלוח לך ${n} קבצים',
	);
	@override String get subTitleMessage => 'שלח לך הודעה:';
	@override String get subTitleLink => 'שלח לך קישור:';
	@override String get canceled => 'השולח ביטל את הבקשה.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageHe extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפשרויות';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(תיקיית LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'כבוי באופן אוטומטי בשל קיום ספריות.';
}

// Path: sendPage
class _StringsSendPageHe extends _StringsSendPageEn {
	_StringsSendPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'ממתין לתגובה...';
	@override String get rejected => 'הנמען דחה את הבקשה.';
	@override String get busy => 'הנמען תפוס בבקשה אחרת.';
}

// Path: progressPage
class _StringsProgressPageHe extends _StringsProgressPageEn {
	_StringsProgressPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'שולח קבצים';
	@override String get titleReceiving => 'מקבל קבצים';
	@override String get savedToGallery => 'נשמר בתמונות';
	@override late final _StringsProgressPageTotalHe total = _StringsProgressPageTotalHe._(_root);
}

// Path: webSharePage
class _StringsWebSharePageHe extends _StringsWebSharePageEn {
	_StringsWebSharePageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'שיתוף באמצעות קישור';
	@override String get loading => 'מפעיל את השרת...';
	@override String get stopping => 'עוצר את השרת...';
	@override String get error => 'אירעה שגיאה בזמן הפעלת השרת.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('he'))(n,
		one: 'פתח את הקישור בדפדפן:',
		other: 'פתח את אחד מהקישורים האלו בדפדפן:',
	);
	@override String get requests => 'בקשות';
	@override String get noRequests => 'אין כרגע בקשות.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend משתמש בתעודה עצמית. עליך לאשר אותה בדפדפן.';
	@override String pendingRequests({required Object n}) => 'בקשות בהמתנה: ${n}';
}

// Path: aboutPage
class _StringsAboutPageHe extends _StringsAboutPageEn {
	_StringsAboutPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אודות LocalSend';
	@override List<String> get description => [
		'LocalSend היא אפליקציית קוד פתוח חינמית המאפשרת לשתף קבצים והודעות בצורה מאובטחת עם מכשירים קרובים דרך הרשת המקומית מבלי להזדקק לחיבור לאינטרנט.',
		'אפליקציה זו זמינה באנדרואיד, iOS, macOS, Windows ו-Linux. אתה יכול למצוא את כל אפשרויות ההורדה בדף הבית הרשמי.',
	];
	@override String get author => 'יוצר';
	@override String get contributors => 'תורמים';
	@override String get translators => 'מתרגמים';
}

// Path: donationPage
class _StringsDonationPageHe extends _StringsDonationPageEn {
	_StringsDonationPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תרומה';
	@override String get info => 'אפליקציית LocalSend היא חינמית, קוד פתוח וללא פרסומות. אם אתה אוהב את האפליקציה, אתה יכול לתמוך בפיתוח באמצעות תרומה.';
	@override String donate({required Object amount}) => 'תרומת ${amount}';
	@override String get thanks => 'תודה רבה!';
	@override String get restore => 'שחזור רכישה';
}

// Path: changelogPage
class _StringsChangelogPageHe extends _StringsChangelogPageEn {
	_StringsChangelogPageHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'יומן שינויים';
}

// Path: aliasGenerator
class _StringsAliasGeneratorHe extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsHe extends _StringsDialogsEn {
	_StringsDialogsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileHe addFile = _StringsDialogsAddFileHe._(_root);
	@override late final _StringsDialogsAddressInputHe addressInput = _StringsDialogsAddressInputHe._(_root);
	@override late final _StringsDialogsCancelSessionHe cancelSession = _StringsDialogsCancelSessionHe._(_root);
	@override late final _StringsDialogsCannotOpenFileHe cannotOpenFile = _StringsDialogsCannotOpenFileHe._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeHe encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeHe._(_root);
	@override late final _StringsDialogsErrorDialogHe errorDialog = _StringsDialogsErrorDialogHe._(_root);
	@override late final _StringsDialogsFavoriteDialogHe favoriteDialog = _StringsDialogsFavoriteDialogHe._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogHe favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogHe._(_root);
	@override late final _StringsDialogsFavoriteEditDialogHe favoriteEditDialog = _StringsDialogsFavoriteEditDialogHe._(_root);
	@override late final _StringsDialogsFileInfoHe fileInfo = _StringsDialogsFileInfoHe._(_root);
	@override late final _StringsDialogsFileNameInputHe fileNameInput = _StringsDialogsFileNameInputHe._(_root);
	@override late final _StringsDialogsHistoryClearDialogHe historyClearDialog = _StringsDialogsHistoryClearDialogHe._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedHe localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedHe._(_root);
	@override late final _StringsDialogsMessageInputHe messageInput = _StringsDialogsMessageInputHe._(_root);
	@override late final _StringsDialogsNoFilesHe noFiles = _StringsDialogsNoFilesHe._(_root);
	@override late final _StringsDialogsNoPermissionHe noPermission = _StringsDialogsNoPermissionHe._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformHe notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformHe._(_root);
	@override late final _StringsDialogsQrHe qr = _StringsDialogsQrHe._(_root);
	@override late final _StringsDialogsQuickActionsHe quickActions = _StringsDialogsQuickActionsHe._(_root);
	@override late final _StringsDialogsQuickSaveNoticeHe quickSaveNotice = _StringsDialogsQuickSaveNoticeHe._(_root);
	@override late final _StringsDialogsSendModeHelpHe sendModeHelp = _StringsDialogsSendModeHelpHe._(_root);
}

// Path: tray
class _StringsTrayHe extends _StringsTrayEn {
	_StringsTrayHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'צא מ-LocalSend';
}

// Path: web
class _StringsWebHe extends _StringsWebEn {
	_StringsWebHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'נדחה';
	@override String get files => 'קבצים';
	@override String get fileName => 'שם קובץ';
	@override String get size => 'גודל';
}

// Path: assetPicker
class _StringsAssetPickerHe extends _StringsAssetPickerEn {
	_StringsAssetPickerHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

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
	@override String get changeAccessibleLimitedAssets => 'לחץ כדי לעדכן את הקבצים הנגישים';
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
	@override String get sNameDurationLabel => 'אורך';
	@override String get sUnitAssetCountLabel => 'מספר';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxHe extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'יציאה:';
	@override String get alias => 'כינוי:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionHe extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'בחירה';
	@override String files({required Object files}) => 'קבצים: ${files}';
	@override String size({required Object size}) => 'גודל: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerHe extends _StringsSendTabPickerEn {
	_StringsSendTabPickerHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get file => 'קובץ';
	@override String get folder => 'תיקייה';
	@override String get media => 'מדיה';
	@override String get text => 'טקסט';
	@override String get app => 'אפליקציה';
	@override String get clipboard => 'לוח ההעתקה';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesHe extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get single => 'שליחה למקבל בודד';
	@override String get multiple => 'שליחה למקבלים מרובים';
	@override String get link => 'שיתוף באמצעות קישור';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralHe extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'כללי';
	@override String get brightness => 'ערכת נושא';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsHe brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsHe._(_root);
	@override String get color => 'צבע';
	@override late final _StringsSettingsTabGeneralColorOptionsHe colorOptions = _StringsSettingsTabGeneralColorOptionsHe._(_root);
	@override String get language => 'שפה';
	@override late final _StringsSettingsTabGeneralLanguageOptionsHe languageOptions = _StringsSettingsTabGeneralLanguageOptionsHe._(_root);
	@override String get saveWindowPlacement => 'יציאה: שמירת מיקום החלון';
	@override String get minimizeToTray => 'יציאה: מזעור למגש';
	@override String get launchAtStartup => 'הפעלה אוטומטית לאחר הכניסה';
	@override String get launchMinimized => 'הפעלה אוטומטית: התחל מוסתר';
	@override String get animations => 'אנימציות';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveHe extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבלה';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'סיום אוטומטי';
	@override String get destination => 'יעד';
	@override String get downloads => '(הורדות)';
	@override String get saveToGallery => 'שמור מדיה לגלריה';
	@override String get saveToHistory => 'שמור בהיסטוריה';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkHe extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

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

// Path: settingsTab.other
class _StringsSettingsTabOtherHe extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אחר';
	@override String get support => 'תמיכה ב-LocalSend';
	@override String get donate => 'תרומה';
	@override String get privacyPolicy => 'מדיניות פרטיות';
	@override String get termsOfUse => 'תנאי השימוש';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallHe extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'האפליקציה יכולה לשלוח קבצים למכשירים אחרים, אך מכשירים אחרים אינם יכולים לשלוח קבצים למכשיר זה';
	@override String solution({required Object port}) => 'כנראה זו בעיה של חומת אש. באפשרותך לפתור את הבעיה על ידי אפשור חיבורים נכנסים (UDP ו-TCP) ביציאה ${port}.';
	@override String get openFirewall => 'פתח את חומת האש';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionHe extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'שני המכשירים לא מצליחים לגלות אחד את השני כדי לשתף קבצים';
	@override String get solution => 'הבעיה קיימת בשני הצדדים? עליך לוודא ששני המכשירים נמצאים באותה רשת WiFi וחולקים את אותה תצורה (יציאה, כתובת מולטיקאסט, הצפנה). רשת ה-WiFi עשויה שלא לאפשר תקשורת בין משתתפים. במקרה כזה, יש לאפשר אפשרות זו בראוטר.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsHe extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get open => 'פתח קובץ';
	@override String get info => 'מידע';
	@override String get deleteFromHistory => 'מחק מההיסטוריה';
}

// Path: progressPage.total
class _StringsProgressPageTotalHe extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleHe title = _StringsProgressPageTotalTitleHe._(_root);
	@override String count({required Object curr, required Object n}) => 'קבצים: ${curr}/${n}';
	@override String size({required Object curr, required Object n}) => 'גודל: ${curr}/${n}';
	@override String speed({required Object speed}) => 'מהירות: ${speed}/שניה';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileHe extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הוסף לבחירה';
	@override String get content => 'מה אתה רוצה להוסיף?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputHe extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכנס כתובת';
	@override String get hashtag => 'סולמית';
	@override String get ip => 'כתובת ה-IP';
	@override String get recentlyUsed => 'בשימוש לאחרונה: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionHe extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'בטל את העברת הקבצים';
	@override String get content => 'האם אתה באמת רוצה לבטל את העברת הקבצים?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileHe extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא ניתן לפתוח את הקובץ';
	@override String content({required Object file}) => 'לא ניתן לפתוח את "${file}". האם הקובץ הועבר, הועתק או נמחק?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeHe extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'ההצפנה מנוטרלת';
	@override String get content => 'התקשורת כעת מתבצעת בפרוטוקול HTTP שאינו מוצפן. כדי להשתמש ב-HTTPS, יש להפעיל שוב את ההצפנה.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogHe extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogHe extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מועדפים';
	@override String get noFavorites => 'עדיין אין מכשירים מועדפים.';
	@override String get addFavorite => 'הוספה';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogHe extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הסרה מהמועדפים';
	@override String content({required Object name}) => 'האם אתה באמת רוצה להסיר מהמועדפים "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogHe extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'הוסף למועדפים';
	@override String get titleEdit => 'עריכה';
	@override String get name => 'כינוי';
	@override String get auto => '(אוטומטי)';
	@override String get ip => 'כתובת IP';
	@override String get port => 'יציאה';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoHe extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מידע על הקובץ';
	@override String get fileName => 'שם הקובץ:';
	@override String get path => 'נתיב:';
	@override String get size => 'גודל:';
	@override String get sender => 'שולח:';
	@override String get time => 'זמן:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputHe extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הזן את שם הקובץ';
	@override String original({required Object original}) => 'מקורי: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogHe extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'ניקוי היסטוריה';
	@override String get content => 'האם אתה באמת רוצה למחוק את כל ההיסטוריה?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedHe extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'ל־LocalSend אין אפשרות למצוא מכשירים אחרים ללא הרשאה לסריקת הרשת המקומית. אנא הענק את ההרשאה הזו בהגדרות.';
	@override String get gotoSettings => 'הגדרות';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputHe extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הקלד הודעה';
	@override String get multiline => 'מרובה שורות';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesHe extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא נבחר אף קובץ';
	@override String get content => 'אנא בחר קובץ אחד לפחות.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionHe extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אין הרשאה';
	@override String get content => 'אתה לא נתת הרשאות הנדרשות. אנא הענק את הרשאות בהגדרות.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformHe extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'לא זמין';
	@override String get content => 'תכונה זו זמינה רק במערכות הבאות:';
}

// Path: dialogs.qr
class _StringsDialogsQrHe extends _StringsDialogsQrEn {
	_StringsDialogsQrHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קוד QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsHe extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פעולות מהירות';
	@override String get counter => 'מונה';
	@override String get prefix => 'קידומת';
	@override String get padZero => 'ריפוד באפסים';
	@override String get sortBeforeCount => 'מיין תחילה בסדר אלפביתי';
	@override String get random => 'אקראי';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeHe extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'בקשות שליחה מתקבלות אוטומטית. שים לב שכל אחד ברשת המקומית יוכל לשלוח לך קבצים.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpHe extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מצבי שליחה';
	@override String get single => 'שליחת קבצים למקבל בודד. בחירת הקבצים תתאפס לאחר השליחה.';
	@override String get multiple => 'שליחת קבצים למקבלים מרובים. בחירת הקבצים לא תתאפס.';
	@override String get link => 'מקבלים ש-LocalSend לא מותקן אצלם יוכלו להוריד את הקבצים שנבחרו על ידי פתיחת הקישור בדפדפן שלהם.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsHe extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get dark => 'כהה';
	@override String get light => 'בהירה';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsHe extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsHe extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleHe extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'סה"כ התקדמות (${time})';
	@override String get finishedError => 'הסתיים עם שגיאה';
	@override String get canceledSender => 'בוטל על ידי השולח';
	@override String get canceledReceiver => 'בוטל על ידי הצד המקבל';
}
