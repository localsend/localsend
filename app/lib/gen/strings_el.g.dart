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
class TranslationsEl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.el,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <el>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEl _root = this; // ignore: unused_field

  @override
  TranslationsEl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Ελληνικά';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$el general = _Translations$general$el._(_root);
  @override
  late final _Translations$receiveTab$el receiveTab = _Translations$receiveTab$el._(_root);
  @override
  late final _Translations$sendTab$el sendTab = _Translations$sendTab$el._(_root);
  @override
  late final _Translations$settingsTab$el settingsTab = _Translations$settingsTab$el._(_root);
  @override
  late final _Translations$troubleshootPage$el troubleshootPage = _Translations$troubleshootPage$el._(_root);
  @override
  late final _Translations$receiveHistoryPage$el receiveHistoryPage = _Translations$receiveHistoryPage$el._(_root);
  @override
  late final _Translations$apkPickerPage$el apkPickerPage = _Translations$apkPickerPage$el._(_root);
  @override
  late final _Translations$selectedFilesPage$el selectedFilesPage = _Translations$selectedFilesPage$el._(_root);
  @override
  late final _Translations$receivePage$el receivePage = _Translations$receivePage$el._(_root);
  @override
  late final _Translations$receiveOptionsPage$el receiveOptionsPage = _Translations$receiveOptionsPage$el._(_root);
  @override
  late final _Translations$sendPage$el sendPage = _Translations$sendPage$el._(_root);
  @override
  late final _Translations$progressPage$el progressPage = _Translations$progressPage$el._(_root);
  @override
  late final _Translations$webSharePage$el webSharePage = _Translations$webSharePage$el._(_root);
  @override
  late final _Translations$aboutPage$el aboutPage = _Translations$aboutPage$el._(_root);
  @override
  late final _Translations$donationPage$el donationPage = _Translations$donationPage$el._(_root);
  @override
  late final _Translations$changelogPage$el changelogPage = _Translations$changelogPage$el._(_root);
  @override
  late final _Translations$aliasGenerator$el aliasGenerator = _Translations$aliasGenerator$el._(_root);
  @override
  late final _Translations$dialogs$el dialogs = _Translations$dialogs$el._(_root);
  @override
  late final _Translations$sanitization$el sanitization = _Translations$sanitization$el._(_root);
  @override
  late final _Translations$tray$el tray = _Translations$tray$el._(_root);
  @override
  late final _Translations$web$el web = _Translations$web$el._(_root);
  @override
  late final _Translations$assetPicker$el assetPicker = _Translations$assetPicker$el._(_root);
  @override
  late final _Translations$networkInterfacesPage$el networkInterfacesPage = _Translations$networkInterfacesPage$el._(_root);
}

// Path: general
class _Translations$general$el extends Translations$general$en {
  _Translations$general$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Αποδοχή';
  @override
  String get accepted => 'Αποδεκτό';
  @override
  String get add => 'Προσθήκη';
  @override
  String get advanced => 'Προχωρημένες';
  @override
  String get cancel => 'Άκυρο';
  @override
  String get close => 'Κλείσιμο';
  @override
  String get confirm => 'Επιβεβαίωση';
  @override
  String get continueStr => 'Συνέχεια';
  @override
  String get copy => 'Αντιγραφή';
  @override
  String get copiedToClipboard => 'Αντιγράφηκε στο Πρόχειρο';
  @override
  String get decline => 'Απόρριψη';
  @override
  String get done => 'Έγινε';
  @override
  String get delete => 'Διαγραφή';
  @override
  String get edit => 'Επεξεργασία';
  @override
  String get error => 'Σφάλμα';
  @override
  String get example => 'Παράδειγμα';
  @override
  String get files => 'Αρχεία';
  @override
  String get finished => 'Ολοκληρώθηκε';
  @override
  String get hide => 'Απόκρυψη';
  @override
  String get off => 'Ανενεργή';
  @override
  String get offline => 'Εκτός σύνδεσης';
  @override
  String get on => 'Ενεργή';
  @override
  String get online => 'Σε σύνδεση';
  @override
  String get open => 'Άνοιγμα';
  @override
  String get queue => 'Ουρά';
  @override
  String get quickSave => 'Γρήγορη Αποθήκευση';
  @override
  String get quickSaveFromFavorites => 'Γρήγορη Αποθήκευση των "Αγαπημένων"';
  @override
  String get renamed => 'Μετονομάστηκε';
  @override
  String get reset => 'Επαναφορά';
  @override
  String get restart => 'Επανεκκίνηση';
  @override
  String get settings => 'Ρυθμίσεις';
  @override
  String get skipped => 'Παράλειψη';
  @override
  String get start => 'Έναρξη';
  @override
  String get stop => 'Διακοπή';
  @override
  String get save => 'Αποθήκευση';
  @override
  String get unchanged => 'Χωρίς αλλαγές';
  @override
  String get unknown => 'Αγνωστο';
  @override
  String get noItemInClipboard => 'Κανένα στοιχείο στο Πρόχειρο.';
}

// Path: receiveTab
class _Translations$receiveTab$el extends Translations$receiveTab$en {
  _Translations$receiveTab$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Λήψη';
  @override
  late final _Translations$receiveTab$infoBox$el infoBox = _Translations$receiveTab$infoBox$el._(_root);
  @override
  late final _Translations$receiveTab$quickSave$el quickSave = _Translations$receiveTab$quickSave$el._(_root);
}

// Path: sendTab
class _Translations$sendTab$el extends Translations$sendTab$en {
  _Translations$sendTab$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αποστολή';
  @override
  late final _Translations$sendTab$selection$el selection = _Translations$sendTab$selection$el._(_root);
  @override
  late final _Translations$sendTab$picker$el picker = _Translations$sendTab$picker$el._(_root);
  @override
  String get shareIntentInfo =>
      'Μπορείτε επίσης να χρησιμοποιήσετε τη δυνατότητα "Κοινή χρήση" της κινητής συσκευής σας για να επιλέξετε αρχεία πιο εύκολα.';
  @override
  String get nearbyDevices => 'Κοντινές συσκευές';
  @override
  String get thisDevice => 'Αυτή η συσκευή';
  @override
  String get scan => 'Αναζήτηση για συσκευές';
  @override
  String get manualSending => 'Χειροκίνητη αποστολή';
  @override
  String get sendMode => 'Λειτουργία αποστολής';
  @override
  late final _Translations$sendTab$sendModes$el sendModes = _Translations$sendTab$sendModes$el._(_root);
  @override
  String get sendModeHelp => 'Επεξήγηση';
  @override
  String get help => 'Βεβαιωθείτε ότι ο επιθυμητός παραλήπτης βρίσκεται επίσης στο ίδιο δίκτυο Wi-Fi.';
  @override
  String get placeItems => 'Τοποθετήστε στοιχεία για διαμοιρασμό.';
}

// Path: settingsTab
class _Translations$settingsTab$el extends Translations$settingsTab$en {
  _Translations$settingsTab$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ρυθμίσεις';
  @override
  late final _Translations$settingsTab$general$el general = _Translations$settingsTab$general$el._(_root);
  @override
  late final _Translations$settingsTab$receive$el receive = _Translations$settingsTab$receive$el._(_root);
  @override
  late final _Translations$settingsTab$send$el send = _Translations$settingsTab$send$el._(_root);
  @override
  late final _Translations$settingsTab$network$el network = _Translations$settingsTab$network$el._(_root);
  @override
  late final _Translations$settingsTab$other$el other = _Translations$settingsTab$other$el._(_root);
  @override
  String get advancedSettings => 'Προχωρημένες ρυθμίσεις';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$el extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αντιμετώπιση προβλημάτων';
  @override
  String get subTitle => 'Αυτή η εφαρμογή δεν λειτουργεί όπως αναμένεται; Εδώ μπορείτε να βρείτε κοινές λύσεις.';
  @override
  String get solution => 'Λύση:';
  @override
  String get fixButton => 'Αυτόματη διόρθωση';
  @override
  late final _Translations$troubleshootPage$firewall$el firewall = _Translations$troubleshootPage$firewall$el._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$el noDiscovery = _Translations$troubleshootPage$noDiscovery$el._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$el noConnection = _Translations$troubleshootPage$noConnection$el._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$el extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ιστορικό';
  @override
  String get openFolder => 'Άνοιγμα φακέλου';
  @override
  String get deleteHistory => 'Διαγραφή ιστορικού';
  @override
  String get empty => 'Το ιστορικό είναι κενό.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$el entryActions = _Translations$receiveHistoryPage$entryActions$el._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$el extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εφαρμογές (APK)';
  @override
  String get excludeSystemApps => 'Εξαίρεση εφαρμογών συστήματος';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Εξαίρεση μη εκκινήσιμων εφαρμογών';
  @override
  String apps({required Object n}) => '${n} Εφαρμογές';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$el extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Διαγραφή όλων';
}

// Path: receivePage
class _Translations$receivePage$el extends Translations$receivePage$en {
  _Translations$receivePage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('el'))(
    n,
    one: 'θέλει να σου στείλει ένα αρχείο',
    other: 'θέλει να σου στείλει ${n} αρχεία',
  );
  @override
  String get subTitleMessage => 'σου έστειλε ένα μήνυμα:';
  @override
  String get subTitleLink => 'σου έστειλε ένα σύνδεσμο:';
  @override
  String get canceled => 'Ο αποστολέας ακύρωσε το αίτημα.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$el extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Επιλογές';
  @override
  String get appDirectory => '(Φάκελος LocalSend)';
  @override
  String get saveToGalleryOff => 'Απενεργοποιήθηκε αυτόματα επειδή υπάρχουν κατάλογοι.';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
}

// Path: sendPage
class _Translations$sendPage$el extends Translations$sendPage$en {
  _Translations$sendPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Αναμονή για απάντηση…';
  @override
  String get rejected => 'Ο παραλήπτης απέρριψε το αίτημα.';
  @override
  String get busy => 'Ο παραλήπτης είναι απασχολημένος με άλλο αίτημα.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
}

// Path: progressPage
class _Translations$progressPage$el extends Translations$progressPage$en {
  _Translations$progressPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Γίνεται αποστολή αρχείων';
  @override
  String get titleReceiving => 'Γίνεται λήψη αρχείων';
  @override
  String get savedToGallery => 'Αποθηκεύτηκε στις Φωτογραφίες';
  @override
  late final _Translations$progressPage$total$el total = _Translations$progressPage$total$el._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$el extends Translations$webSharePage$en {
  _Translations$webSharePage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Διαμοιρασμός μέσω συνδέσμου';
  @override
  String get loading => 'Εκκίνηση διακομιστή…';
  @override
  String get stopping => 'Σταμάτημα διακομιστή…';
  @override
  String get error => 'Ένα σφάλμα προέκυψε κατά την εκκίνηση του διακομιστή.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('el'))(
    n,
    one: 'Άνοιγμα αυτού του συνδέσμου στον φυλλομετρητή:',
    other: 'Άνοιγμα ενός από αυτούς τους συνδέσμους στον φυλλομετρητή:',
  );
  @override
  String get requests => 'Αιτήματα';
  @override
  String get noRequests => 'Κανένα αίτμηα ακόμα.';
  @override
  String get autoAccept => 'Αυτόματη αποδοχή αιτημάτων';
  @override
  String get requirePin => 'Απαίτηση PIN';
  @override
  String pinHint({required Object pin}) => 'Το PIN είναι "${pin}"';
  @override
  String get encryptionHint => 'Το LocalSend χρησιμοποιεί αυτο-υπογεγραμμένο πιστοποιητικό. Χρειάζεται να το αποθεχτείτε στον φυλλομετρητή.';
  @override
  String pendingRequests({required Object n}) => 'Αναμονή αιτημάτων: ${n}';
  @override
  String get encryption => _root.settingsTab.network.encryption;
}

// Path: aboutPage
class _Translations$aboutPage$el extends Translations$aboutPage$en {
  _Translations$aboutPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Σχετικά με το LocalSend';
  @override
  List<String> get description => [
    'Το LocalSend είναι μια δωρεάν εφαρμογή ανοιχτού κώδικα που σας επιτρέπει να μοιράζεστε με ασφάλεια αρχεία και μηνύματα με κοντινές συσκευές μέσω του τοπικού σας δικτύου χωρίς να χρειάζεστε σύνδεση στο διαδίκτυο.',
    'Αυτή η εφαρμογή είναι διαθέσιμη σε Android, iOS, macOS, Windows και Linux. Μπορείτε να βρείτε όλες τις επιλογές λήψης στην επίσημη αρχική σελίδα.',
  ];
  @override
  String get author => 'Δημιουργός';
  @override
  String get contributors => 'Συντελεστές';
  @override
  String get packagers => 'Συσκευαστές';
  @override
  String get translators => 'Μεταφραστές';
}

// Path: donationPage
class _Translations$donationPage$el extends Translations$donationPage$en {
  _Translations$donationPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Δωρεά';
  @override
  String get info =>
      'Το LocalSend είναι δωρεάν, ανοιχτού κώδικα και χωρίς διαφημίσεις. Εάν σας αρέσει η εφαρμογή, μπορείτε να υποστηρίξετε την ανάπτυξή της με μια δωρεά.';
  @override
  String donate({required Object amount}) => 'Δωρεά ${amount}';
  @override
  String get thanks => 'Ευχαριστούμε πολύ!';
  @override
  String get restore => 'Επαναφορά αγοράς';
}

// Path: changelogPage
class _Translations$changelogPage$el extends Translations$changelogPage$en {
  _Translations$changelogPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Καταγραφή αλλαγών';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$el extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Λατρευτό',
    'Πανεμορφο',
    'Μεγάλο',
    'Λαμπερό',
    'Ζουμερό',
    'Καλοπροαίρετο',
    'Δροσερό',
    'Χαριτωμένο',
    'Πονηρό',
    'Καταχθώνιο',
    'Ενεργητικό',
    'Αποτελεσματικό',
    'Φανταστικό',
    'Γρήγορο',
    'Ντροπαλό',
    'Φρέσκο',
    'Καλό',
    'Υπέροχο',
    'Εξαιρετικό',
    'Τεμπέλικο',
    'Θερμό',
    'Ψυχρό',
    'Νευρικό',
    'Ήρεμο',
    'Καθαρό',
    'Ομορφο',
    'Υπομονετικο',
    'Αρκετά',
    'Χαρούμενο',
    'Πλούσιο',
    'Μυστικό',
    'Έξυπνο',
    'Ανυπόμονο',
    'Οκνηρό',
    'Νυσταγμένο',
    'Ισχυρό',
    'Τακτοποιημένο',
    'Σοφό',
  ];
  @override
  List<String> get fruits => [
    'Μήλο',
    'Αβοκάντο',
    'Μανταρίνι',
    'Βατόμουρο',
    'Σκόρδο',
    'Μπρόκολο',
    'Καρότο',
    'Κεράσι',
    'Μαρούλι',
    'Σταφύλι',
    'Λεμόνι',
    'Λάχανο',
    'Μάνγκο',
    'Πεπόνι',
    'Μανιτάρι',
    'Κρεμμύδι',
    'Πορτοκάλι',
    'Κολοκύθι',
    'Ροδάκινο',
    'Αχλάδι',
    'Καρπούζι',
    'Κάστανο',
    'Πράσο',
    'Ακτινίδιο',
    'Σύκο',
    'Αγγούρι',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$el extends Translations$dialogs$en {
  _Translations$dialogs$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$el addFile = _Translations$dialogs$addFile$el._(_root);
  @override
  late final _Translations$dialogs$openFile$el openFile = _Translations$dialogs$openFile$el._(_root);
  @override
  late final _Translations$dialogs$addressInput$el addressInput = _Translations$dialogs$addressInput$el._(_root);
  @override
  late final _Translations$dialogs$cancelSession$el cancelSession = _Translations$dialogs$cancelSession$el._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$el cannotOpenFile = _Translations$dialogs$cannotOpenFile$el._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$el encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$el._(_root);
  @override
  late final _Translations$dialogs$errorDialog$el errorDialog = _Translations$dialogs$errorDialog$el._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$el favoriteDialog = _Translations$dialogs$favoriteDialog$el._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$el favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$el._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$el favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$el._(_root);
  @override
  late final _Translations$dialogs$fileInfo$el fileInfo = _Translations$dialogs$fileInfo$el._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$el fileNameInput = _Translations$dialogs$fileNameInput$el._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$el historyClearDialog = _Translations$dialogs$historyClearDialog$el._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$el localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$el._(_root);
  @override
  late final _Translations$dialogs$messageInput$el messageInput = _Translations$dialogs$messageInput$el._(_root);
  @override
  late final _Translations$dialogs$noFiles$el noFiles = _Translations$dialogs$noFiles$el._(_root);
  @override
  late final _Translations$dialogs$noPermission$el noPermission = _Translations$dialogs$noPermission$el._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$el notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$el._(_root);
  @override
  late final _Translations$dialogs$qr$el qr = _Translations$dialogs$qr$el._(_root);
  @override
  late final _Translations$dialogs$quickActions$el quickActions = _Translations$dialogs$quickActions$el._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$el quickSaveNotice = _Translations$dialogs$quickSaveNotice$el._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$el quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$el._(_root);
  @override
  late final _Translations$dialogs$pin$el pin = _Translations$dialogs$pin$el._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$el sendModeHelp = _Translations$dialogs$sendModeHelp$el._(_root);
  @override
  late final _Translations$dialogs$zoom$el zoom = _Translations$dialogs$zoom$el._(_root);
}

// Path: sanitization
class _Translations$sanitization$el extends Translations$sanitization$en {
  _Translations$sanitization$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Το όνομα του αρχείου δεν μπορεί να είναι κενό';
  @override
  String get invalid => 'Το όνομα του αρχείου περιέχει μη έγκυρους χαρακτήρες';
}

// Path: tray
class _Translations$tray$el extends Translations$tray$en {
  _Translations$tray$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Έξοδος από το LocalSend';
  @override
  String get closeWindows => 'Έξοδος';
}

// Path: web
class _Translations$web$el extends Translations$web$en {
  _Translations$web$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Εισαγωγή PIN';
  @override
  String get invalidPin => 'Μη έγκυρο PIN';
  @override
  String get tooManyAttempts => 'Πάρα πολλές προσπάθειες';
  @override
  String get rejected => 'Απορρίφθηκε';
  @override
  String get files => 'Αρχεία';
  @override
  String get fileName => 'Όνομα αρχείου';
  @override
  String get size => 'Μέγεθος';
}

// Path: assetPicker
class _Translations$assetPicker$el extends Translations$assetPicker$en {
  _Translations$assetPicker$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Επιβεβαιώση';
  @override
  String get cancel => 'Ακύρωση';
  @override
  String get edit => 'Επεξεργασία';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Η φόρτωση απέτυχε';
  @override
  String get original => 'Προέλευση';
  @override
  String get preview => 'Προεπισκόπηση';
  @override
  String get select => 'Επιλογή';
  @override
  String get emptyList => 'Κενή λίστα';
  @override
  String get unSupportedAssetType => 'Μη υποστηριζόμενος τύπος αρχείου.';
  @override
  String get unableToAccessAll => 'Δεν είναι δυνατή η πρόσβαση σε όλα τα αρχεία της συσκευής';
  @override
  String get viewingLimitedAssetsTip => 'Προβολή μόνο των αρχείων και άλμπουμ που είναι προσβάσιμα από την εφαρμογή.';
  @override
  String get changeAccessibleLimitedAssets => 'Κάντε κλικ για ενημέρωση των προσβάσιμων αρχείων';
  @override
  String get accessAllTip =>
      'Η εφαρμογή μπορεί να έχει πρόσβαση μόνο σε ορισμένα αρχεία στη συσκευή. Μεταβείτε στις ρυθμίσεις συστήματος και επιτρέψτε στην εφαρμογή να έχει πρόσβαση σε όλα τα μέσα της συσκευής.';
  @override
  String get goToSystemSettings => 'Μεταβείτε στις ρυθμίσεις συστήματος';
  @override
  String get accessLimitedAssets => 'Συνεχίστε με περιορισμένη πρόσβαση';
  @override
  String get accessiblePathName => 'Προσβάσιμα αρχεία';
  @override
  String get sTypeAudioLabel => 'Ήχος';
  @override
  String get sTypeImageLabel => 'Εικόνα';
  @override
  String get sTypeVideoLabel => 'Βίντεο';
  @override
  String get sTypeOtherLabel => 'Άλλα μέσα';
  @override
  String get sActionPlayHint => 'αναπαραγωγή';
  @override
  String get sActionPreviewHint => 'προεπισκόπηση';
  @override
  String get sActionSelectHint => 'επιλογή';
  @override
  String get sActionSwitchPathLabel => 'αλλαγή μονοπατιού';
  @override
  String get sActionUseCameraHint => 'χρήση κάμερας';
  @override
  String get sNameDurationLabel => 'διάρκεια';
  @override
  String get sUnitAssetCountLabel => 'μετρητής';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$el extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'Από προεπιλογή, το LocalSend χρησιμοποιεί όλες τις διαθέσιμες διεπαφές δικτύου. Μπορείτε να εξαιρέσετε τα ανεπιθύμητα δίκτυα εδώ. Πρέπει να κάνετε επανεκκίνηση του διακομιστή για να εφαρμόσετε τις αλλαγές.';
  @override
  String get title => 'Διεπαφές δικτύου';
  @override
  String get preview => 'Προεπισκόπηση';
  @override
  String get whitelist => 'Λευκή λίστα';
  @override
  String get blacklist => 'Μαύρη λίστα';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$el extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Θύρα:';
  @override
  String get alias => 'Όνομα συσκευής:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$el extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Αγαπημένα';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$el extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Επιλογή';
  @override
  String files({required Object files}) => 'Αρχεία: ${files}';
  @override
  String size({required Object size}) => 'Μέγεθος: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$el extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Αρχείο';
  @override
  String get folder => 'Φάκελος';
  @override
  String get media => 'Μέσα';
  @override
  String get text => 'Κείμενο';
  @override
  String get app => 'Εφαρμογή';
  @override
  String get clipboard => 'Επικόλληση';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$el extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Ένας παραλήπτης';
  @override
  String get multiple => 'Πολλαπλοί παραλήπτες';
  @override
  String get link => 'Διαμοιρασμός μέσω συνδέσμου';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$el extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Γενικά';
  @override
  String get brightness => 'Θέμα';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$el brightnessOptions = _Translations$settingsTab$general$brightnessOptions$el._(
    _root,
  );
  @override
  String get color => 'Χρώμα';
  @override
  late final _Translations$settingsTab$general$colorOptions$el colorOptions = _Translations$settingsTab$general$colorOptions$el._(_root);
  @override
  String get language => 'Γλώσσα';
  @override
  late final _Translations$settingsTab$general$languageOptions$el languageOptions = _Translations$settingsTab$general$languageOptions$el._(_root);
  @override
  String get saveWindowPlacement => 'Έξοδος: Αποθήκευση θέσης παραθύρου';
  @override
  String get saveWindowPlacementWindows => 'Αποθήκευση της θέσης του παραθύρου κατά την έξοδο';
  @override
  String get minimizeToTray => 'Έξοδος: Ελαχιστοποίηση στη γραμμή εργασιών/μενού';
  @override
  String get launchAtStartup => 'Αυτόματη εκκίνηση μετά τη σύνδεση';
  @override
  String get launchMinimized => 'Αυτόματη εκκίνηση: Έναρξη ελαχιστοποιημένο';
  @override
  String get showInContextMenu => 'Προβολή του LocalSend στο μενού του περιβάλλοντος εργασίας';
  @override
  String get animations => 'Οπτικά εφέ';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$el extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Λήψη';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Αυτόματη ολοκλήρωση';
  @override
  String get destination => 'Προορισμός';
  @override
  String get downloads => '(Λήψεις)';
  @override
  String get saveToGallery => 'Αποθήκευση μέσου στη συλλογή';
  @override
  String get saveToHistory => 'Αποθήκευση στο ιστορικό';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$el extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αποστολή';
  @override
  String get shareViaLinkAutoAccept => 'Κοινοποίηση μέσω συνδέσμου: Αυτόματη αποδοχή';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$el extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Δίκτυο';
  @override
  String get needRestart => 'Κάντε επανεκκίνηση του διακομιστή για να εφαρμοστούν οι ρυθμίσεις!';
  @override
  String get server => 'Διακομιστής';
  @override
  String get alias => 'Όνομα συσκευής';
  @override
  String get deviceType => 'Τύπος συσκευής';
  @override
  String get deviceModel => 'Μοντέλο συσκευής';
  @override
  String get port => 'Θύρα';
  @override
  String get discoveryTimeout => 'Λήξη χρόνου ανακάλυψης';
  @override
  String get useSystemName => 'Χρήση του ονόματος του συστήματος';
  @override
  String get generateRandomAlias => 'Δημιουργία τυχαίου ψευδώνυμου';
  @override
  String portWarning({required Object defaultPort}) =>
      'Ενδέχεται να μην εντοπιστείτε από άλλες συσκευές επειδή χρησιμοποιείτε μια προσαρμοσμένη θύρα. (προεπιλογή: ${defaultPort})';
  @override
  String get encryption => 'Κρυπτογράφηση';
  @override
  String get multicastGroup => 'Αναμετάδοση';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Ενδέχεται να μην εντοπιστείτε από άλλες συσκευές επειδή χρησιμοποιείτε μια προσαρμοσμένη διεύθυνση αναμετάδοσης. (προεπιλογή: ${defaultMulticast})';
  @override
  String get network => 'Δίκτυο';
  @override
  late final _Translations$settingsTab$network$networkOptions$el networkOptions = _Translations$settingsTab$network$networkOptions$el._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$el extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Άλλα';
  @override
  String get support => 'Υποστηρίξτε το LocalSend';
  @override
  String get donate => 'Δωρεά';
  @override
  String get privacyPolicy => 'Πολιτική Απορρήτου';
  @override
  String get termsOfUse => 'Όροι Χρήσης';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$el extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Αυτή η εφαρμογή μπορεί να στείλει αρχεία σε άλλες συσκευές, αλλά άλλες συσκευές δεν μπορούν να στείλουν αρχεία σε αυτήν τη συσκευή.';
  @override
  String solution({required Object port}) =>
      'Αυτό είναι πιθανότατα ένα ζήτημα του τείχους προστασίας. Μπορείτε να το λύσετε επιτρέποντας τις εισερχόμενες συνδέσεις (UDP και TCP) στη θύρα ${port}.';
  @override
  String get openFirewall => 'Άνοιγμα Τείχους Προστασίας';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$el extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Αυτή η συσκευή δεν μπορεί ανακαλυφθεί από άλλες συσεκυές.';
  @override
  String get solution =>
      'Βεβαιωθείτε ότι όλες οι συσκευές βρίσκονται στο ίδιο δίκτυο Wi-Fi και μοιράζονται την ίδια διαμόρφωση (θύρα, διεύθυνση multicast, κρυπτογράφηση). Μπορείτε να προσπαθήσετε να πληκτρολογήσετε τη διεύθυνση IP της συσκευής προορισμού με μη αυτόματο τρόπο. Εάν αυτό λειτουργεί, εξετάστε το ενδεχόμενο να προσθέσετε αυτήν τη συσκευή στα αγαπημένα, ώστε να μπορεί να ανακαλυφθεί αυτόματα στο μέλλον.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$el extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Και οι δύο συσκευές δεν μπορούν να ανακαλύψουν η μία την άλλη ούτε μπορούν να μοιραστούν αρχεία.';
  @override
  String get solution =>
      'Υπάρχει το πρόβλημα και από τις δύο πλευρές; Πρέπει να βεβαιωθείτε ότι και οι δύο συσκευές βρίσκονται στο ίδιο δίκτυο Wi-Fi και μοιράζονται την ίδια διαμόρφωση (θύρα, διεύθυνση αναμετάδοσης, κρυπτογράφηση). Το wifi ενδέχεται να μην επιτρέπει την επικοινωνία μεταξύ των συμμετεχόντων. Σε αυτήν την περίπτωση, αυτή η επιλογή πρέπει να είναι ενεργοποιημένη στο δρομολογητή.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$el extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Άνοιγμα αρχείου';
  @override
  String get showInFolder => 'Προβολή στον φάκελο';
  @override
  String get info => 'Πληροφορίες';
  @override
  String get deleteFromHistory => 'Διαγραφή από το ιστορικό';
}

// Path: progressPage.total
class _Translations$progressPage$total$el extends Translations$progressPage$total$en {
  _Translations$progressPage$total$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$el title = _Translations$progressPage$total$title$el._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Αρχεία: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Μέγεθος: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Ταχύτητα: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$el extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Προσθήκη στις επιλογές';
  @override
  String get content => 'Τι θέλετε να προστεθεί;';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$el extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Άνοιγμα αρχείου';
  @override
  String get content => 'Θέλετε να ανοιχτεί το ληφθέν αρχείο;';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$el extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισαγωγή διεύθυνσης';
  @override
  String get ip => 'Διεύθυνση IP';
  @override
  String get recentlyUsed => 'Χρησιμοποιήθηκε πρόσφατα: ';
  @override
  String get hashtag => 'Χάσταγκ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$el extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ακύρωση της μεταφοράς του αρχείου';
  @override
  String get content => 'Θέλετε σίγουρα να ακυρωθεί η μεταφορά του αρχείου?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$el extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Δεν μπορεί να ανοιχτεί το αρχείο';
  @override
  String content({required Object file}) => 'Δεν μπορεί να ανοιχτεί το "${file}". Έχετε μήπως μετακινήσει, μενονομάσει ή διαγράψει το αρχείο;';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$el extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Η κρυπτογράφηση απενεργοποιήθηκε';
  @override
  String get content =>
      'Η επικοινωνία πραγματοποιείται πλέον μέσω του μη κρυπτογραφημένου πρωτοκόλλου HTTP. Για να χρησιμοποιήσετε το HTTPS, ενεργοποιήστε ξανά την κρυπτογράφηση.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$el extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$el extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αγαπημένα';
  @override
  String get noFavorites => 'Καμία αγαπημένη συσκευή προς το παρόν.';
  @override
  String get addFavorite => 'Προσθήκη';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$el extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Διαγραφή από τα αγαπημένα';
  @override
  String content({required Object name}) => 'Θέλετε σίγουρα να διαγραφεί από τα αγαπημένα το "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$el extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Προσθήκη στα αγαπημένα';
  @override
  String get titleEdit => 'Ρυθμίσεις';
  @override
  String get name => 'Όνομα συσκευής';
  @override
  String get auto => '(αυτόματα)';
  @override
  String get ip => 'Διεύθυνση IP';
  @override
  String get port => 'Θύρα';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$el extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Πληροφορίες αρχείου';
  @override
  String get fileName => 'Όνομα αρχείου:';
  @override
  String get path => 'Μονοπάτι:';
  @override
  String get size => 'Μέγεθος:';
  @override
  String get sender => 'Αποστολέας:';
  @override
  String get time => 'Ώρα:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$el extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισάγετε το όνομα του αρχείου';
  @override
  String original({required Object original}) => 'Πρωτότυπο: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$el extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Καθαρισμός ιστορικού';
  @override
  String get content => 'Θέλετε σίγουρα να διαγράψετε όλο το ιστορικό;';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$el extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Το LocalSend δεν μπορεί να βρει άλλες συσκευές χωρίς την άδεια σάρωσης του τοπικού δικτύου. Παρακαλείστε να παραχωρήσετε αυτό το δικαίωμα στις ρυθμίσεις.';
  @override
  String get gotoSettings => 'Ρυθμίσεις';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$el extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Πληκτρολογήστε το μήνυμα';
  @override
  String get multiline => 'Πολλαπλών γραμμών';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$el extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Κανένα αρχείο δεν επιλέχθηκε';
  @override
  String get content => 'Παρακαλώ επιλέξτε τουλάχιστον ένα αρχείο.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$el extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Χωρίς άδεια';
  @override
  String get content => 'Δεν έχετε παραχωρήσει τις απαραίτητες άδειες. Παρακαλώ παραχωρήστε τα στις ρυθμίσεις.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$el extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Μη διαθέσιμο';
  @override
  String get content => 'Αυτό το χαρακτηριστικό είναι διαθέσιμο μόνο σε:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$el extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Κώδικας QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$el extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Γρήγορες Ενέργειες';
  @override
  String get counter => 'Μετρητής';
  @override
  String get prefix => 'Πρόθεμα';
  @override
  String get padZero => 'Συμπλήρωση με μηδενικά';
  @override
  String get sortBeforeCount => 'Ταξινόμηση αλφαβητικά εκ των προτέρων';
  @override
  String get random => 'Τυχαία';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$el extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Τα αιτήματα αρχείων γίνονται αυτόματα δεκτά. Έχετε υπόψη σας ότι όλοι στο τοπικό δίκτυο μπορούν να σας στείλουν αρχεία.';
  @override
  String get title => _root.general.quickSave;
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$el extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'Τα αιτήματα αρχείων γίνονται τώρα αυτόματα αποδεκτά από τις συσκευές της λίστας των αγαπημένων σας.',
    'Προειδοποίηση! Επί του παρόντος, αυτό δεν είναι απολύτως ασφαλές, ένας χάκερ που έχει το δακτυλικό αποτύπωμα οποιασδήποτε συσκευής από τη λίστα των αγαπημένων σας μπορεί να σας στείλει αρχεία χωρίς περιορισμό.',
    'Ωστόσο, αυτή η επιλογή είναι ακόμα πιο ασφαλής από το να επιτρέπεται σε όλους τους χρήστες στο τοπικό δίκτυο να σας στείλουν αρχεία χωρίς περιορισμό.',
  ];
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _Translations$dialogs$pin$el extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισαγωγή PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$el extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Λειτουργίες αποστολής';
  @override
  String get single => 'Στέλνει αρχεία σε έναν παραλήπτη. Η επιλογή θα διαγραφεί μετά την ολοκλήρωση της μεταφοράς του αρχείου.';
  @override
  String get multiple => 'Στέλνει αρχεία σε πολλούς παραλήπτες. Η επιλογή δεν θα διαγραφεί.';
  @override
  String get link =>
      'Οι παραλήπτες που δεν έχουν εγκαταστήσει το LocalSend μπορούν να πραγματοποιήσουν λήψη των επιλεγμένων αρχείων ανοίγοντας τον σύνδεσμο στον φυλλομετρητή τους.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$el extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$el extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Σύστημα';
  @override
  String get dark => 'Σκοτεινό';
  @override
  String get light => 'Φωτεινό';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$el extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Σύστημα';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$el extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Σύστημα';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$el extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Όλα';
  @override
  String get filtered => 'Περιορισμένο';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$el extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$el._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Συνολική πρόοδος (${time})';
  @override
  String get finishedError => 'Ολοκληρώθηκε με σφάλμα';
  @override
  String get canceledSender => 'Ακυρώθηκε από τον αποστολέα';
  @override
  String get canceledReceiver => 'Ακυρώθηκε από τον παραλήπτη';
}
