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
class TranslationsHe extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsHe({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.he,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <he>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsHe _root = this; // ignore: unused_field

  @override
  TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'עברית';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$he general = _Translations$general$he._(_root);
  @override
  late final _Translations$receiveTab$he receiveTab = _Translations$receiveTab$he._(_root);
  @override
  late final _Translations$sendTab$he sendTab = _Translations$sendTab$he._(_root);
  @override
  late final _Translations$settingsTab$he settingsTab = _Translations$settingsTab$he._(_root);
  @override
  late final _Translations$troubleshootPage$he troubleshootPage = _Translations$troubleshootPage$he._(_root);
  @override
  late final _Translations$receiveHistoryPage$he receiveHistoryPage = _Translations$receiveHistoryPage$he._(_root);
  @override
  late final _Translations$apkPickerPage$he apkPickerPage = _Translations$apkPickerPage$he._(_root);
  @override
  late final _Translations$selectedFilesPage$he selectedFilesPage = _Translations$selectedFilesPage$he._(_root);
  @override
  late final _Translations$receivePage$he receivePage = _Translations$receivePage$he._(_root);
  @override
  late final _Translations$receiveOptionsPage$he receiveOptionsPage = _Translations$receiveOptionsPage$he._(_root);
  @override
  late final _Translations$sendPage$he sendPage = _Translations$sendPage$he._(_root);
  @override
  late final _Translations$progressPage$he progressPage = _Translations$progressPage$he._(_root);
  @override
  late final _Translations$webSharePage$he webSharePage = _Translations$webSharePage$he._(_root);
  @override
  late final _Translations$aboutPage$he aboutPage = _Translations$aboutPage$he._(_root);
  @override
  late final _Translations$donationPage$he donationPage = _Translations$donationPage$he._(_root);
  @override
  late final _Translations$changelogPage$he changelogPage = _Translations$changelogPage$he._(_root);
  @override
  late final _Translations$dialogs$he dialogs = _Translations$dialogs$he._(_root);
  @override
  late final _Translations$sanitization$he sanitization = _Translations$sanitization$he._(_root);
  @override
  late final _Translations$tray$he tray = _Translations$tray$he._(_root);
  @override
  late final _Translations$web$he web = _Translations$web$he._(_root);
  @override
  late final _Translations$assetPicker$he assetPicker = _Translations$assetPicker$he._(_root);
  @override
  late final _Translations$networkInterfacesPage$he networkInterfacesPage = _Translations$networkInterfacesPage$he._(_root);
}

// Path: general
class _Translations$general$he extends Translations$general$en {
  _Translations$general$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'אישור';
  @override
  String get accepted => 'התקבל';
  @override
  String get add => 'הוספה';
  @override
  String get advanced => 'מידע נוסף';
  @override
  String get cancel => 'ביטול';
  @override
  String get close => 'סגור';
  @override
  String get confirm => 'אישור';
  @override
  String get continueStr => 'המשך';
  @override
  String get copy => 'העתקה';
  @override
  String get copiedToClipboard => 'הועתק ללוח';
  @override
  String get decline => 'דחיה';
  @override
  String get done => 'אישור';
  @override
  String get delete => 'מחיקה';
  @override
  String get edit => 'עריכה';
  @override
  String get error => 'שגיאה';
  @override
  String get example => 'דוגמא';
  @override
  String get files => 'קבצים';
  @override
  String get finished => 'הסתיים';
  @override
  String get hide => 'הסתרה';
  @override
  String get off => 'כבויה';
  @override
  String get offline => 'כבוי';
  @override
  String get on => 'פעילה';
  @override
  String get online => 'מקוון';
  @override
  String get open => 'פתח';
  @override
  String get queue => 'תור';
  @override
  String get quickSave => 'שמירה מהירה';
  @override
  String get quickSaveFromFavorites => 'שמירה מהירה מהמועדפים';
  @override
  String get renamed => 'שונה שם';
  @override
  String get reset => 'איפוס';
  @override
  String get restart => 'הפעל מחדש';
  @override
  String get settings => 'הגדרות';
  @override
  String get skipped => 'דילג';
  @override
  String get start => 'התחל';
  @override
  String get stop => 'עצור';
  @override
  String get save => 'שמור';
  @override
  String get unchanged => 'ללא שינוי';
  @override
  String get unknown => 'לא ידוע';
  @override
  String get noItemInClipboard => 'לוח ההעתקה ריק.';
}

// Path: receiveTab
class _Translations$receiveTab$he extends Translations$receiveTab$en {
  _Translations$receiveTab$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'קבלה';
  @override
  late final _Translations$receiveTab$infoBox$he infoBox = _Translations$receiveTab$infoBox$he._(_root);
  @override
  late final _Translations$receiveTab$quickSave$he quickSave = _Translations$receiveTab$quickSave$he._(_root);
}

// Path: sendTab
class _Translations$sendTab$he extends Translations$sendTab$en {
  _Translations$sendTab$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'שליחה';
  @override
  late final _Translations$sendTab$selection$he selection = _Translations$sendTab$selection$he._(_root);
  @override
  late final _Translations$sendTab$picker$he picker = _Translations$sendTab$picker$he._(_root);
  @override
  String get shareIntentInfo => 'תוכל גם להשתמש בתכונת "שתף" של המכשיר הנייד שלך כדי לבחור קבצים בקלות.';
  @override
  String get nearbyDevices => 'מכשירים בקרבת מקום';
  @override
  String get thisDevice => 'המכשיר הזה';
  @override
  String get scan => 'חפש מכשירים';
  @override
  String get manualSending => 'שליחה ידנית';
  @override
  String get sendMode => 'מצב שליחה';
  @override
  late final _Translations$sendTab$sendModes$he sendModes = _Translations$sendTab$sendModes$he._(_root);
  @override
  String get sendModeHelp => 'עזרה';
  @override
  String get help => 'אנא ודא שאתה ומכשיר היעד נמצאים באותה רשת WiFi.';
  @override
  String get placeItems => 'הצב פריטים לשיתוף.';
}

// Path: settingsTab
class _Translations$settingsTab$he extends Translations$settingsTab$en {
  _Translations$settingsTab$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הגדרות';
  @override
  late final _Translations$settingsTab$general$he general = _Translations$settingsTab$general$he._(_root);
  @override
  late final _Translations$settingsTab$receive$he receive = _Translations$settingsTab$receive$he._(_root);
  @override
  late final _Translations$settingsTab$send$he send = _Translations$settingsTab$send$he._(_root);
  @override
  late final _Translations$settingsTab$network$he network = _Translations$settingsTab$network$he._(_root);
  @override
  late final _Translations$settingsTab$other$he other = _Translations$settingsTab$other$he._(_root);
  @override
  String get advancedSettings => 'הגדרות מתקדמות';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$he extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'פתרון תקלות';
  @override
  String get subTitle => 'האפליקציה לא פועלת כראוי? כאן תוכל למצוא פתרונות לבעיות נפוצות.';
  @override
  String get solution => 'פתרון:';
  @override
  String get fixButton => 'תקן אוטומטית';
  @override
  late final _Translations$troubleshootPage$firewall$he firewall = _Translations$troubleshootPage$firewall$he._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$he noDiscovery = _Translations$troubleshootPage$noDiscovery$he._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$he noConnection = _Translations$troubleshootPage$noConnection$he._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$he extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'היסטוריה';
  @override
  String get openFolder => 'פתח תיקייה';
  @override
  String get deleteHistory => 'מחק היסטוריה';
  @override
  String get empty => 'ההיסטוריה ריקה.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$he entryActions = _Translations$receiveHistoryPage$entryActions$he._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$he extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'אפליקציות (APK)';
  @override
  String get excludeSystemApps => 'אל תכלול אפליקציות מערכת';
  @override
  String get excludeAppsWithoutLaunchIntent => 'אל תכלול אפליקציות שאינן ניתנות להפעלה';
  @override
  String apps({required Object n}) => '${n} אפליקציות';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$he extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'מחק הכל';
}

// Path: receivePage
class _Translations$receivePage$he extends Translations$receivePage$en {
  _Translations$receivePage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('he'))(
    n,
    one: 'רוצה לשלוח לך קובץ',
    other: 'רוצה לשלוח לך ${n} קבצים',
  );
  @override
  String get subTitleMessage => 'שלח לך הודעה:';
  @override
  String get subTitleLink => 'שלח לך קישור:';
  @override
  String get canceled => 'השולח ביטל את הבקשה.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$he extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'אפשרויות';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(תיקיית LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'כבוי באופן אוטומטי בשל קיום ספריות.';
}

// Path: sendPage
class _Translations$sendPage$he extends Translations$sendPage$en {
  _Translations$sendPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'ממתין לתגובה…';
  @override
  String get rejected => 'הנמען דחה את הבקשה.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'הנמען תפוס בבקשה אחרת.';
}

// Path: progressPage
class _Translations$progressPage$he extends Translations$progressPage$en {
  _Translations$progressPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'שולח קבצים';
  @override
  String get titleReceiving => 'מקבל קבצים';
  @override
  String get savedToGallery => 'נשמר בתמונות';
  @override
  late final _Translations$progressPage$total$he total = _Translations$progressPage$total$he._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$he extends Translations$webSharePage$en {
  _Translations$webSharePage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'שיתוף באמצעות קישור';
  @override
  String get loading => 'מפעיל את השרת…';
  @override
  String get stopping => 'עוצר את השרת…';
  @override
  String get error => 'אירעה שגיאה בזמן הפעלת השרת.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('he'))(
    n,
    one: 'פתח את הקישור בדפדפן:',
    other: 'פתח את אחד מהקישורים האלו בדפדפן:',
  );
  @override
  String get requests => 'בקשות';
  @override
  String get noRequests => 'אין כרגע בקשות.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'אישור בקשות באופן אוטומטי';
  @override
  String get requirePin => 'דרוש סיסמה';
  @override
  String pinHint({required Object pin}) => 'הסיסמה היא "${pin}"';
  @override
  String get encryptionHint => 'LocalSend משתמש בתעודה עצמית. עליך לאשר אותה בדפדפן.';
  @override
  String pendingRequests({required Object n}) => 'בקשות בהמתנה: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$he extends Translations$aboutPage$en {
  _Translations$aboutPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'אודות LocalSend';
  @override
  List<String> get description => [
    'LocalSend היא אפליקציית קוד פתוח חינמית המאפשרת לשתף קבצים והודעות בצורה מאובטחת עם מכשירים קרובים דרך הרשת המקומית מבלי להזדקק לחיבור לאינטרנט.',
    'אפליקציה זו זמינה באנדרואיד, iOS, macOS, Windows ו-Linux. אתה יכול למצוא את כל אפשרויות ההורדה בדף הבית הרשמי.',
  ];
  @override
  String get author => 'יוצר';
  @override
  String get contributors => 'תורמים';
  @override
  String get packagers => 'אורזים';
  @override
  String get translators => 'מתרגמים';
}

// Path: donationPage
class _Translations$donationPage$he extends Translations$donationPage$en {
  _Translations$donationPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'תרומה';
  @override
  String get info => 'אפליקציית LocalSend היא חינמית, קוד פתוח וללא פרסומות. אם אתה אוהב את האפליקציה, אתה יכול לתמוך בפיתוח באמצעות תרומה.';
  @override
  String donate({required Object amount}) => 'תרומת ${amount}';
  @override
  String get thanks => 'תודה רבה!';
  @override
  String get restore => 'שחזור רכישה';
}

// Path: changelogPage
class _Translations$changelogPage$he extends Translations$changelogPage$en {
  _Translations$changelogPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'יומן שינויים';
}

// Path: dialogs
class _Translations$dialogs$he extends Translations$dialogs$en {
  _Translations$dialogs$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$he addFile = _Translations$dialogs$addFile$he._(_root);
  @override
  late final _Translations$dialogs$openFile$he openFile = _Translations$dialogs$openFile$he._(_root);
  @override
  late final _Translations$dialogs$addressInput$he addressInput = _Translations$dialogs$addressInput$he._(_root);
  @override
  late final _Translations$dialogs$cancelSession$he cancelSession = _Translations$dialogs$cancelSession$he._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$he cannotOpenFile = _Translations$dialogs$cannotOpenFile$he._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$he encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$he._(_root);
  @override
  late final _Translations$dialogs$errorDialog$he errorDialog = _Translations$dialogs$errorDialog$he._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$he favoriteDialog = _Translations$dialogs$favoriteDialog$he._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$he favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$he._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$he favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$he._(_root);
  @override
  late final _Translations$dialogs$fileInfo$he fileInfo = _Translations$dialogs$fileInfo$he._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$he fileNameInput = _Translations$dialogs$fileNameInput$he._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$he historyClearDialog = _Translations$dialogs$historyClearDialog$he._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$he localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$he._(_root);
  @override
  late final _Translations$dialogs$messageInput$he messageInput = _Translations$dialogs$messageInput$he._(_root);
  @override
  late final _Translations$dialogs$noFiles$he noFiles = _Translations$dialogs$noFiles$he._(_root);
  @override
  late final _Translations$dialogs$noPermission$he noPermission = _Translations$dialogs$noPermission$he._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$he notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$he._(_root);
  @override
  late final _Translations$dialogs$qr$he qr = _Translations$dialogs$qr$he._(_root);
  @override
  late final _Translations$dialogs$quickActions$he quickActions = _Translations$dialogs$quickActions$he._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$he quickSaveNotice = _Translations$dialogs$quickSaveNotice$he._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$he quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$he._(_root);
  @override
  late final _Translations$dialogs$pin$he pin = _Translations$dialogs$pin$he._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$he sendModeHelp = _Translations$dialogs$sendModeHelp$he._(_root);
  @override
  late final _Translations$dialogs$zoom$he zoom = _Translations$dialogs$zoom$he._(_root);
}

// Path: sanitization
class _Translations$sanitization$he extends Translations$sanitization$en {
  _Translations$sanitization$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'שם הקובץ לא יכול להיות ריק';
  @override
  String get invalid => 'שם הקובץ מכיל תווים לא חוקיים';
}

// Path: tray
class _Translations$tray$he extends Translations$tray$en {
  _Translations$tray$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'צא מ-LocalSend';
  @override
  String get closeWindows => 'יציאה';
}

// Path: web
class _Translations$web$he extends Translations$web$en {
  _Translations$web$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'הזן סיסמה';
  @override
  String get invalidPin => 'סיסמה לא חוקית';
  @override
  String get tooManyAttempts => 'בוצעו יותר מידי ניסיונות כושלים';
  @override
  String get rejected => 'נדחה';
  @override
  String get files => 'קבצים';
  @override
  String get fileName => 'שם קובץ';
  @override
  String get size => 'גודל';
}

// Path: assetPicker
class _Translations$assetPicker$he extends Translations$assetPicker$en {
  _Translations$assetPicker$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'אישור';
  @override
  String get cancel => 'ביטול';
  @override
  String get edit => 'עריכה';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'טעינת הקובץ נכשלה';
  @override
  String get original => 'מקור';
  @override
  String get preview => 'תצוגה מקדימה';
  @override
  String get select => 'בחירה';
  @override
  String get emptyList => 'רשימה ריקה';
  @override
  String get unSupportedAssetType => 'סוג קובץ לא נתמך.';
  @override
  String get unableToAccessAll => 'לא ניתן לגשת לכל הקבצים במכשיר';
  @override
  String get viewingLimitedAssetsTip => 'ניתן להציג רק קבצים ואלבומים שנגישים לאפליקציה.';
  @override
  String get changeAccessibleLimitedAssets => 'לחץ כדי לעדכן את הקבצים הנגישים';
  @override
  String get accessAllTip => 'האפליקציה יכולה לגשת רק לקבצים מסוימים במכשיר. עבור להגדרות המערכת ואפשר לאפליקציה לגשת לכל הקבצים שבמכשיר.';
  @override
  String get goToSystemSettings => 'מעבר להגדרות המערכת';
  @override
  String get accessLimitedAssets => 'המשך עם גישה מוגבלת';
  @override
  String get accessiblePathName => 'קבצים שנגישים';
  @override
  String get sTypeAudioLabel => 'שמע';
  @override
  String get sTypeImageLabel => 'תמונה';
  @override
  String get sTypeVideoLabel => 'סרטון';
  @override
  String get sTypeOtherLabel => 'סוגים אחרים';
  @override
  String get sActionPlayHint => 'הפעלה';
  @override
  String get sActionPreviewHint => 'תצוגה מקדימה';
  @override
  String get sActionSelectHint => 'בחירה';
  @override
  String get sActionSwitchPathLabel => 'שינוי נתיב';
  @override
  String get sActionUseCameraHint => 'שימוש במצלמה';
  @override
  String get sNameDurationLabel => 'אורך';
  @override
  String get sUnitAssetCountLabel => 'מספר';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$he extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ממשקי רשת';
  @override
  String get info =>
      'כברירת מחדל, LocalSend משתמש בכל ממשקי הרשת הזמינים. באפשרותך להסיר רשתות שאינן רצויות כאן. עליך להפעיל מחדש את השרת כדי להחיל את השינויים.';
  @override
  String get preview => 'תצוגה מקדימה';
  @override
  String get whitelist => 'רשימה לבנה';
  @override
  String get blacklist => 'רשימה שחורה';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$he extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'יציאה:';
  @override
  String get alias => 'כינוי:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$he extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'מועדפים';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$he extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'בחירה';
  @override
  String files({required Object files}) => 'קבצים: ${files}';
  @override
  String size({required Object size}) => 'גודל: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$he extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'קובץ';
  @override
  String get folder => 'תיקייה';
  @override
  String get media => 'מדיה';
  @override
  String get text => 'טקסט';
  @override
  String get app => 'אפליקציה';
  @override
  String get clipboard => 'לוח ההעתקה';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$he extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'שליחה למקבל בודד';
  @override
  String get multiple => 'שליחה למקבלים מרובים';
  @override
  String get link => 'שיתוף באמצעות קישור';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$he extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'כללי';
  @override
  String get brightness => 'ערכת נושא';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$he brightnessOptions = _Translations$settingsTab$general$brightnessOptions$he._(
    _root,
  );
  @override
  String get color => 'צבע';
  @override
  late final _Translations$settingsTab$general$colorOptions$he colorOptions = _Translations$settingsTab$general$colorOptions$he._(_root);
  @override
  String get language => 'שפה';
  @override
  late final _Translations$settingsTab$general$languageOptions$he languageOptions = _Translations$settingsTab$general$languageOptions$he._(_root);
  @override
  String get saveWindowPlacement => 'יציאה: שמירת מיקום החלון';
  @override
  String get saveWindowPlacementWindows => 'שמור את מיקום החלון בעת יציאה';
  @override
  String get minimizeToTray => 'יציאה: מזעור למגש';
  @override
  String get launchAtStartup => 'הפעלה אוטומטית לאחר הכניסה';
  @override
  String get launchMinimized => 'הפעלה אוטומטית: התחל מוסתר';
  @override
  String get showInContextMenu => 'הצג את LocalSend בתפריט ההקשר';
  @override
  String get animations => 'אנימציות';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$he extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'קבלה';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'סיום אוטומטי';
  @override
  String get destination => 'יעד';
  @override
  String get downloads => '(הורדות)';
  @override
  String get saveToGallery => 'שמור מדיה לגלריה';
  @override
  String get saveToHistory => 'שמור בהיסטוריה';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$he extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'שליחה';
  @override
  String get shareViaLinkAutoAccept => 'שיתוף באמצעות קישור: אישור אוטומטי';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$he extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'רשת';
  @override
  String get needRestart => 'הפעל מחדש את השרת כדי להחיל את ההגדרות!';
  @override
  String get server => 'שרת';
  @override
  String get alias => 'כינוי';
  @override
  String get deviceType => 'סוג המכשיר';
  @override
  String get deviceModel => 'דגם המכשיר';
  @override
  String get port => 'יציאה';
  @override
  String get discoveryTimeout => 'זמן קצוב לגילוי';
  @override
  String get useSystemName => 'השתמש בשם מערכת';
  @override
  String get generateRandomAlias => 'צור כינוי אקראי';
  @override
  String portWarning({required Object defaultPort}) =>
      'יתכן שלא יזוהו מכשירים אחרים בגלל שאתה משתמש ביציאה מותאמת אישית. (ברירת־מחדל: ${defaultPort})';
  @override
  String get encryption => 'הצפנה';
  @override
  String get multicastGroup => 'מולטיקאסט';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'יתכן שלא יזוהו מכשירים אחרים בגלל שאתה משתמש בכתובת מולטיקאסט מותאמת אישית. (ברירת־מחדל: ${defaultMulticast})';
  @override
  late final _Translations$settingsTab$network$networkOptions$he networkOptions = _Translations$settingsTab$network$networkOptions$he._(_root);
  @override
  String get network => 'רשת';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$he extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'אחר';
  @override
  String get support => 'תמיכה ב-LocalSend';
  @override
  String get donate => 'תרומה';
  @override
  String get privacyPolicy => 'מדיניות פרטיות';
  @override
  String get termsOfUse => 'תנאי השימוש';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$he extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'האפליקציה יכולה לשלוח קבצים למכשירים אחרים, אך מכשירים אחרים אינם יכולים לשלוח קבצים למכשיר זה.';
  @override
  String solution({required Object port}) =>
      'כנראה זו בעיה של חומת אש. באפשרותך לפתור את הבעיה על ידי אפשור חיבורים נכנסים (UDP ו-TCP) ביציאה ${port}.';
  @override
  String get openFirewall => 'פתח את חומת האש';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$he extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'המכשיר הזה לא מצליח לגלות מכשירים אחרים.';
  @override
  String get solution =>
      'אנא ודא שכל המכשירים נמצאים באותה רשת Wi-Fi וחולקים את אותה תצורה (יציאה, כתובת ריבוי שידור, הצפנה). אתה יכול לנסות להקליד את כתובת ה-IP של מכשיר היעד באופן ידני. אם זה יעבוד, שקול להוסיף את המכשיר למועדפים כדי שניתן יהיה לגלות אותו אוטומטית בעתיד.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$he extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'שני המכשירים לא מצליחים לגלות אחד את השני כדי לשתף קבצים.';
  @override
  String get solution =>
      'הבעיה קיימת בשני הצדדים? עליך לוודא ששני המכשירים נמצאים באותה רשת WiFi וחולקים את אותה תצורה (יציאה, כתובת מולטיקאסט, הצפנה). רשת ה-WiFi עשויה שלא לאפשר תקשורת בין משתתפים. במקרה כזה, יש לאפשר אפשרות זו בראוטר.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$he extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'פתח קובץ';
  @override
  String get showInFolder => 'הצג בתיקייה';
  @override
  String get info => 'מידע';
  @override
  String get deleteFromHistory => 'מחק מההיסטוריה';
}

// Path: progressPage.total
class _Translations$progressPage$total$he extends Translations$progressPage$total$en {
  _Translations$progressPage$total$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$he title = _Translations$progressPage$total$title$he._(_root);
  @override
  String count({required Object curr, required Object n}) => 'קבצים: ${curr}/${n}';
  @override
  String size({required Object curr, required Object n}) => 'גודל: ${curr}/${n}';
  @override
  String speed({required Object speed}) => 'מהירות: ${speed}/שניה';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$he extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הוסף לבחירה';
  @override
  String get content => 'מה אתה רוצה להוסיף?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$he extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'פתח קובץ';
  @override
  String get content => 'האם ברצונך לפתוח את הקובץ שהתקבל?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$he extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הכנס כתובת';
  @override
  String get hashtag => 'סולמית';
  @override
  String get ip => 'כתובת ה-IP';
  @override
  String get recentlyUsed => 'בשימוש לאחרונה: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$he extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'בטל את העברת הקבצים';
  @override
  String get content => 'האם אתה באמת רוצה לבטל את העברת הקבצים?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$he extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'לא ניתן לפתוח את הקובץ';
  @override
  String content({required Object file}) => 'לא ניתן לפתוח את "${file}". האם הקובץ הועבר, הועתק או נמחק?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$he extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ההצפנה מנוטרלת';
  @override
  String get content => 'התקשורת כעת מתבצעת בפרוטוקול HTTP שאינו מוצפן. כדי להשתמש ב-HTTPS, יש להפעיל שוב את ההצפנה.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$he extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$he extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'מועדפים';
  @override
  String get noFavorites => 'עדיין אין מכשירים מועדפים.';
  @override
  String get addFavorite => 'הוספה';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$he extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הסרה מהמועדפים';
  @override
  String content({required Object name}) => 'האם אתה באמת רוצה להסיר מהמועדפים "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$he extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'הוסף למועדפים';
  @override
  String get titleEdit => 'עריכה';
  @override
  String get name => 'כינוי';
  @override
  String get auto => '(אוטומטי)';
  @override
  String get ip => 'כתובת IP';
  @override
  String get port => 'יציאה';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$he extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'מידע על הקובץ';
  @override
  String get fileName => 'שם הקובץ:';
  @override
  String get path => 'נתיב:';
  @override
  String get size => 'גודל:';
  @override
  String get sender => 'שולח:';
  @override
  String get time => 'זמן:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$he extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הזן את שם הקובץ';
  @override
  String original({required Object original}) => 'מקורי: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$he extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ניקוי היסטוריה';
  @override
  String get content => 'האם אתה באמת רוצה למחוק את כל ההיסטוריה?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$he extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'ל־LocalSend אין אפשרות למצוא מכשירים אחרים ללא הרשאה לסריקת הרשת המקומית. אנא הענק את ההרשאה הזו בהגדרות.';
  @override
  String get gotoSettings => 'הגדרות';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$he extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הקלד הודעה';
  @override
  String get multiline => 'מרובה שורות';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$he extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'לא נבחר אף קובץ';
  @override
  String get content => 'אנא בחר קובץ אחד לפחות.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$he extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'אין הרשאה';
  @override
  String get content => 'לא הענקת את ההרשאות הנדרשות. אנא הענק את ההרשאות בהגדרות.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$he extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'לא זמין';
  @override
  String get content => 'תכונה זו זמינה רק במערכות הבאות:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$he extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'קוד QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$he extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'פעולות מהירות';
  @override
  String get counter => 'מונה';
  @override
  String get prefix => 'קידומת';
  @override
  String get padZero => 'ריפוד באפסים';
  @override
  String get sortBeforeCount => 'מיין תחילה בסדר אלפביתי';
  @override
  String get random => 'אקראי';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$he extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'בקשות שליחה מתקבלות אוטומטית. שים לב שכל אחד ברשת המקומית יוכל לשלוח לך קבצים.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$he extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'כעת בקשות לקבצים ייתקבלו אוטומטית ממכשירים ברשימת המועדפים שלך.',
    'אזהרה: כרגע זה לא לגמרי מאובטח מכיוון שהאקר שנמצא ברשת שלך ויודע את טביעת האצבע של המכשירים האהובים עליך עדיין יכול לשלוח לך קבצים ללא אישור.',
    'עם זאת, אפשרות זו עדיין מאובטחת יותר מאשר לאפשר קבלה אוטומטית מכל מכשיר.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$he extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'הזן סיסמה';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$he extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'מצבי שליחה';
  @override
  String get single => 'שליחת קבצים למקבל בודד. בחירת הקבצים תתאפס לאחר השליחה.';
  @override
  String get multiple => 'שליחת קבצים למקבלים מרובים. בחירת הקבצים לא תתאפס.';
  @override
  String get link => 'מקבלים ש-LocalSend לא מותקן אצלם יוכלו להוריד את הקבצים שנבחרו על ידי פתיחת הקישור בדפדפן שלהם.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$he extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$he extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'מערכת';
  @override
  String get dark => 'כהה';
  @override
  String get light => 'בהירה';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$he extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'מערכת';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$he extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'מערכת';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$he extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'מסונן';
  @override
  String get all => 'הכל';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$he extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$he._(TranslationsHe root) : this._root = root, super.internal(root);

  final TranslationsHe _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'סה"כ התקדמות (${time})';
  @override
  String get finishedError => 'הסתיים עם שגיאה';
  @override
  String get canceledSender => 'בוטל על ידי השולח';
  @override
  String get canceledReceiver => 'בוטל על ידי הצד המקבל';
}
