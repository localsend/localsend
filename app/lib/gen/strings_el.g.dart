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
class TranslationsEl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Ελληνικά';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralEl general = _TranslationsGeneralEl._(_root);
  @override
  late final _TranslationsReceiveTabEl receiveTab = _TranslationsReceiveTabEl._(_root);
  @override
  late final _TranslationsSendTabEl sendTab = _TranslationsSendTabEl._(_root);
  @override
  late final _TranslationsSettingsTabEl settingsTab = _TranslationsSettingsTabEl._(_root);
  @override
  late final _TranslationsTroubleshootPageEl troubleshootPage = _TranslationsTroubleshootPageEl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageEl receiveHistoryPage = _TranslationsReceiveHistoryPageEl._(_root);
  @override
  late final _TranslationsApkPickerPageEl apkPickerPage = _TranslationsApkPickerPageEl._(_root);
  @override
  late final _TranslationsSelectedFilesPageEl selectedFilesPage = _TranslationsSelectedFilesPageEl._(_root);
  @override
  late final _TranslationsReceivePageEl receivePage = _TranslationsReceivePageEl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageEl receiveOptionsPage = _TranslationsReceiveOptionsPageEl._(_root);
  @override
  late final _TranslationsSendPageEl sendPage = _TranslationsSendPageEl._(_root);
  @override
  late final _TranslationsProgressPageEl progressPage = _TranslationsProgressPageEl._(_root);
  @override
  late final _TranslationsWebSharePageEl webSharePage = _TranslationsWebSharePageEl._(_root);
  @override
  late final _TranslationsAboutPageEl aboutPage = _TranslationsAboutPageEl._(_root);
  @override
  late final _TranslationsDonationPageEl donationPage = _TranslationsDonationPageEl._(_root);
  @override
  late final _TranslationsChangelogPageEl changelogPage = _TranslationsChangelogPageEl._(_root);
  @override
  late final _TranslationsAliasGeneratorEl aliasGenerator = _TranslationsAliasGeneratorEl._(_root);
  @override
  late final _TranslationsDialogsEl dialogs = _TranslationsDialogsEl._(_root);
  @override
  late final _TranslationsSanitizationEl sanitization = _TranslationsSanitizationEl._(_root);
  @override
  late final _TranslationsTrayEl tray = _TranslationsTrayEl._(_root);
  @override
  late final _TranslationsWebEl web = _TranslationsWebEl._(_root);
  @override
  late final _TranslationsAssetPickerEl assetPicker = _TranslationsAssetPickerEl._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageEl networkInterfacesPage = _TranslationsNetworkInterfacesPageEl._(_root);
}

// Path: general
class _TranslationsGeneralEl extends TranslationsGeneralEn {
  _TranslationsGeneralEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabEl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Λήψη';
  @override
  late final _TranslationsReceiveTabInfoBoxEl infoBox = _TranslationsReceiveTabInfoBoxEl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveEl quickSave = _TranslationsReceiveTabQuickSaveEl._(_root);
}

// Path: sendTab
class _TranslationsSendTabEl extends TranslationsSendTabEn {
  _TranslationsSendTabEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αποστολή';
  @override
  late final _TranslationsSendTabSelectionEl selection = _TranslationsSendTabSelectionEl._(_root);
  @override
  late final _TranslationsSendTabPickerEl picker = _TranslationsSendTabPickerEl._(_root);
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
  late final _TranslationsSendTabSendModesEl sendModes = _TranslationsSendTabSendModesEl._(_root);
  @override
  String get sendModeHelp => 'Επεξήγηση';
  @override
  String get help => 'Βεβαιωθείτε ότι ο επιθυμητός παραλήπτης βρίσκεται επίσης στο ίδιο δίκτυο Wi-Fi.';
  @override
  String get placeItems => 'Τοποθετήστε στοιχεία για διαμοιρασμό.';
}

// Path: settingsTab
class _TranslationsSettingsTabEl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ρυθμίσεις';
  @override
  late final _TranslationsSettingsTabGeneralEl general = _TranslationsSettingsTabGeneralEl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveEl receive = _TranslationsSettingsTabReceiveEl._(_root);
  @override
  late final _TranslationsSettingsTabSendEl send = _TranslationsSettingsTabSendEl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkEl network = _TranslationsSettingsTabNetworkEl._(_root);
  @override
  late final _TranslationsSettingsTabOtherEl other = _TranslationsSettingsTabOtherEl._(_root);
  @override
  String get advancedSettings => 'Προχωρημένες ρυθμίσεις';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageEl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallEl firewall = _TranslationsTroubleshootPageFirewallEl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryEl noDiscovery = _TranslationsTroubleshootPageNoDiscoveryEl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionEl noConnection = _TranslationsTroubleshootPageNoConnectionEl._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageEl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsEl entryActions = _TranslationsReceiveHistoryPageEntryActionsEl._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageEl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageEl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Διαγραφή όλων';
}

// Path: receivePage
class _TranslationsReceivePageEl extends TranslationsReceivePageEn {
  _TranslationsReceivePageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveOptionsPageEl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Επιλογές';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Φάκελος LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Απενεργοποιήθηκε αυτόματα επειδή υπάρχουν κατάλογοι.';
}

// Path: sendPage
class _TranslationsSendPageEl extends TranslationsSendPageEn {
  _TranslationsSendPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Αναμονή για απάντηση…';
  @override
  String get rejected => 'Ο παραλήπτης απέρριψε το αίτημα.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Ο παραλήπτης είναι απασχολημένος με άλλο αίτημα.';
}

// Path: progressPage
class _TranslationsProgressPageEl extends TranslationsProgressPageEn {
  _TranslationsProgressPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Γίνεται αποστολή αρχείων';
  @override
  String get titleReceiving => 'Γίνεται λήψη αρχείων';
  @override
  String get savedToGallery => 'Αποθηκεύτηκε στις Φωτογραφίες';
  @override
  late final _TranslationsProgressPageTotalEl total = _TranslationsProgressPageTotalEl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageEl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
  String get encryption => _root.settingsTab.network.encryption;
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
}

// Path: aboutPage
class _TranslationsAboutPageEl extends TranslationsAboutPageEn {
  _TranslationsAboutPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageEl extends TranslationsDonationPageEn {
  _TranslationsDonationPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageEl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Καταγραφή αλλαγών';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorEl extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsEl extends TranslationsDialogsEn {
  _TranslationsDialogsEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileEl addFile = _TranslationsDialogsAddFileEl._(_root);
  @override
  late final _TranslationsDialogsOpenFileEl openFile = _TranslationsDialogsOpenFileEl._(_root);
  @override
  late final _TranslationsDialogsAddressInputEl addressInput = _TranslationsDialogsAddressInputEl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionEl cancelSession = _TranslationsDialogsCancelSessionEl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileEl cannotOpenFile = _TranslationsDialogsCannotOpenFileEl._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeEl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeEl._(_root);
  @override
  late final _TranslationsDialogsErrorDialogEl errorDialog = _TranslationsDialogsErrorDialogEl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogEl favoriteDialog = _TranslationsDialogsFavoriteDialogEl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogEl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogEl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogEl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogEl._(_root);
  @override
  late final _TranslationsDialogsFileInfoEl fileInfo = _TranslationsDialogsFileInfoEl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputEl fileNameInput = _TranslationsDialogsFileNameInputEl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogEl historyClearDialog = _TranslationsDialogsHistoryClearDialogEl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedEl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedEl._(_root);
  @override
  late final _TranslationsDialogsMessageInputEl messageInput = _TranslationsDialogsMessageInputEl._(_root);
  @override
  late final _TranslationsDialogsNoFilesEl noFiles = _TranslationsDialogsNoFilesEl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionEl noPermission = _TranslationsDialogsNoPermissionEl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformEl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformEl._(_root);
  @override
  late final _TranslationsDialogsQrEl qr = _TranslationsDialogsQrEl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsEl quickActions = _TranslationsDialogsQuickActionsEl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeEl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeEl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeEl quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeEl._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinEl pin = _TranslationsDialogsPinEl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpEl sendModeHelp = _TranslationsDialogsSendModeHelpEl._(_root);
  @override
  late final _TranslationsDialogsZoomEl zoom = _TranslationsDialogsZoomEl._(_root);
}

// Path: sanitization
class _TranslationsSanitizationEl extends TranslationsSanitizationEn {
  _TranslationsSanitizationEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Το όνομα του αρχείου δεν μπορεί να είναι κενό';
  @override
  String get invalid => 'Το όνομα του αρχείου περιέχει μη έγκυρους χαρακτήρες';
}

// Path: tray
class _TranslationsTrayEl extends TranslationsTrayEn {
  _TranslationsTrayEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsWebEl extends TranslationsWebEn {
  _TranslationsWebEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerEl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageEl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxEl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveEl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionEl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerEl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesEl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralEl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Γενικά';
  @override
  String get brightness => 'Θέμα';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsEl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsEl._(_root);
  @override
  String get color => 'Χρώμα';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsEl colorOptions = _TranslationsSettingsTabGeneralColorOptionsEl._(_root);
  @override
  String get language => 'Γλώσσα';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsEl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsEl._(_root);
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
class _TranslationsSettingsTabReceiveEl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendEl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Αποστολή';
  @override
  String get shareViaLinkAutoAccept => 'Κοινοποίηση μέσω συνδέσμου: Αυτόματη αποδοχή';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkEl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsEl networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsEl._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherEl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallEl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Αυτή η εφαρμογή μπορεί να στείλει αρχεία σε άλλες συσκευές, αλλά άλλες συσκευές δεν μπορούν να στείλουν αρχεία σε αυτήν τη συσκευή.';
  @override
  String solution({required Object port}) =>
      'Αυτό είναι πιθανότατα ένα ζήτημα του τείχους προστασίας. Μπορείτε να το λύσετε επιτρέποντας τις εισερχόμενες συνδέσεις (UDP και TCP) στη θύρα ${port}.';
  @override
  String get openFirewallSettings => 'Άνοιγμα Τείχους Προστασίας';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryEl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Αυτή η συσκευή δεν μπορεί ανακαλυφθεί από άλλες συσεκυές.';
  @override
  String get solution =>
      'Βεβαιωθείτε ότι όλες οι συσκευές βρίσκονται στο ίδιο δίκτυο Wi-Fi και μοιράζονται την ίδια διαμόρφωση (θύρα, διεύθυνση multicast, κρυπτογράφηση). Μπορείτε να προσπαθήσετε να πληκτρολογήσετε τη διεύθυνση IP της συσκευής προορισμού με μη αυτόματο τρόπο. Εάν αυτό λειτουργεί, εξετάστε το ενδεχόμενο να προσθέσετε αυτήν τη συσκευή στα αγαπημένα, ώστε να μπορεί να ανακαλυφθεί αυτόματα στο μέλλον.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionEl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Και οι δύο συσκευές δεν μπορούν να ανακαλύψουν η μία την άλλη ούτε μπορούν να μοιραστούν αρχεία.';
  @override
  String get solution =>
      'Υπάρχει το πρόβλημα και από τις δύο πλευρές; Πρέπει να βεβαιωθείτε ότι και οι δύο συσκευές βρίσκονται στο ίδιο δίκτυο Wi-Fi και μοιράζονται την ίδια διαμόρφωση (θύρα, διεύθυνση αναμετάδοσης, κρυπτογράφηση). Το wifi ενδέχεται να μην επιτρέπει την επικοινωνία μεταξύ των συμμετεχόντων. Σε αυτήν την περίπτωση, αυτή η επιλογή πρέπει να είναι ενεργοποιημένη στο δρομολογητή.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsEl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalEl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleEl title = _TranslationsProgressPageTotalTitleEl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Αρχεία: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Μέγεθος: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Ταχύτητα: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileEl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Προσθήκη στις επιλογές';
  @override
  String get content => 'Τι θέλετε να προστεθεί;';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileEl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Άνοιγμα αρχείου';
  @override
  String get content => 'Θέλετε να ανοιχτεί το ληφθέν αρχείο;';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputEl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισαγωγή διεύθυνσης';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Διεύθυνση IP';
  @override
  String get recentlyUsed => 'Χρησιμοποιήθηκε πρόσφατα: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionEl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ακύρωση της μεταφοράς του αρχείου';
  @override
  String get content => 'Θέλετε σίγουρα να ακυρωθεί η μεταφορά του αρχείου?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileEl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Δεν μπορεί να ανοιχτεί το αρχείο';
  @override
  String content({required Object file}) => 'Δεν μπορεί να ανοιχτεί το "${file}". Έχετε μήπως μετακινήσει, μενονομάσει ή διαγράψει το αρχείο;';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeEl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Η κρυπτογράφηση απενεργοποιήθηκε';
  @override
  String get content =>
      'Η επικοινωνία πραγματοποιείται πλέον μέσω του μη κρυπτογραφημένου πρωτοκόλλου HTTP. Για να χρησιμοποιήσετε το HTTPS, ενεργοποιήστε ξανά την κρυπτογράφηση.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogEl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogEl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogEl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Διαγραφή από τα αγαπημένα';
  @override
  String content({required Object name}) => 'Θέλετε σίγουρα να διαγραφεί από τα αγαπημένα το "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogEl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoEl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputEl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισάγετε το όνομα του αρχείου';
  @override
  String original({required Object original}) => 'Πρωτότυπο: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogEl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Καθαρισμός ιστορικού';
  @override
  String get content => 'Θέλετε σίγουρα να διαγράψετε όλο το ιστορικό;';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedEl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
  @override
  String get gotoSettings => 'Ρυθμίσεις';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputEl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Τύπος μηνύματος';
  @override
  String get multiline => 'Πολλαπλών γραμμών';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesEl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Κανένα αρχείο δεν επιλέχθηκε';
  @override
  String get content => 'Παρακαλώ επιλέξτε τουλάχιστον ένα αρχείο.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionEl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Χωρίς άδεια';
  @override
  String get content => 'Δεν έχετε παραχωρήσει τις απαραίτητες άδειες. Παρακαλώ παραχωρήστε τα στις ρυθμίσεις.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformEl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Μη διαθέσιμο';
  @override
  String get content => 'Αυτό το χαρακτηριστικό είναι διαθέσιμο μόνο σε:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrEl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Κώδικας QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsEl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeEl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Τα αιτήματα αρχείων γίνονται αυτόματα δεκτά. Έχετε υπόψη σας ότι όλοι στο τοπικό δίκτυο μπορούν να σας στείλουν αρχεία.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeEl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Τα αιτήματα αρχείων γίνονται τώρα αυτόματα αποδεκτά από τις συσκευές της λίστας των αγαπημένων σας.',
    'Προειδοποίηση! Επί του παρόντος, αυτό δεν είναι απολύτως ασφαλές, ένας χάκερ που έχει το δακτυλικό αποτύπωμα οποιασδήποτε συσκευής από τη λίστα των αγαπημένων σας μπορεί να σας στείλει αρχεία χωρίς περιορισμό.',
    'Ωστόσο, αυτή η επιλογή είναι ακόμα πιο ασφαλής από το να επιτρέπεται σε όλους τους χρήστες στο τοπικό δίκτυο να σας στείλουν αρχεία χωρίς περιορισμό.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinEl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Εισαγωγή PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpEl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomEl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsEl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsEl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Σύστημα';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsEl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Σύστημα';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsEl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsEl._(TranslationsEl root) : this._root = root, super.internal(root);

  final TranslationsEl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Όλα';
  @override
  String get filtered => 'Περιορισμένο';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleEl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleEl._(TranslationsEl root) : this._root = root, super.internal(root);

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
