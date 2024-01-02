part of 'strings.g.dart';

// Path: <root>
class _StringsEl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.el,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <el>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsEl _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Ελληνικά';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralEl general = _StringsGeneralEl._(_root);
	@override late final _StringsReceiveTabEl receiveTab = _StringsReceiveTabEl._(_root);
	@override late final _StringsSendTabEl sendTab = _StringsSendTabEl._(_root);
	@override late final _StringsSettingsTabEl settingsTab = _StringsSettingsTabEl._(_root);
	@override late final _StringsTroubleshootPageEl troubleshootPage = _StringsTroubleshootPageEl._(_root);
	@override late final _StringsReceiveHistoryPageEl receiveHistoryPage = _StringsReceiveHistoryPageEl._(_root);
	@override late final _StringsApkPickerPageEl apkPickerPage = _StringsApkPickerPageEl._(_root);
	@override late final _StringsSelectedFilesPageEl selectedFilesPage = _StringsSelectedFilesPageEl._(_root);
	@override late final _StringsReceivePageEl receivePage = _StringsReceivePageEl._(_root);
	@override late final _StringsReceiveOptionsPageEl receiveOptionsPage = _StringsReceiveOptionsPageEl._(_root);
	@override late final _StringsSendPageEl sendPage = _StringsSendPageEl._(_root);
	@override late final _StringsProgressPageEl progressPage = _StringsProgressPageEl._(_root);
	@override late final _StringsWebSharePageEl webSharePage = _StringsWebSharePageEl._(_root);
	@override late final _StringsAboutPageEl aboutPage = _StringsAboutPageEl._(_root);
	@override late final _StringsChangelogPageEl changelogPage = _StringsChangelogPageEl._(_root);
	@override late final _StringsAliasGeneratorEl aliasGenerator = _StringsAliasGeneratorEl._(_root);
	@override late final _StringsDialogsEl dialogs = _StringsDialogsEl._(_root);
	@override late final _StringsTrayEl tray = _StringsTrayEl._(_root);
	@override late final _StringsWebEl web = _StringsWebEl._(_root);
	@override late final _StringsAssetPickerEl assetPicker = _StringsAssetPickerEl._(_root);
}

// Path: general
class _StringsGeneralEl extends _StringsGeneralEn {
	_StringsGeneralEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Αποδοχή';
	@override String get accepted => 'Αποδεκτό';
	@override String get add => 'Προσθήκη';
	@override String get advanced => 'Προχωρημένες';
	@override String get cancel => 'Άκυρο';
	@override String get close => 'Κλείσιμο';
	@override String get confirm => 'Επιβεβαίωση';
	@override String get continueStr => 'Συνέχεια';
	@override String get copy => 'Αντιγραφή';
	@override String get copiedToClipboard => 'Αντιγράφηκε στο Πρόχειρο';
	@override String get decline => 'Απόρριψη';
	@override String get done => 'Έγινε';
	@override String get delete => 'Διαγραφή';
	@override String get edit => 'Επεξεργασία';
	@override String get error => 'Σφάλμα';
	@override String get example => 'Παράδειγμα';
	@override String get files => 'Αρχεία';
	@override String get finished => 'Ολοκληρώθηκε';
	@override String get hide => 'Απόκρυψη';
	@override String get off => 'Απενεργοποίηση';
	@override String get offline => 'Εκτός σύνδεσης';
	@override String get on => 'Ενεργοποίηση';
	@override String get online => 'Σε σύνδεση';
	@override String get open => 'Άνοιγμα';
	@override String get queue => 'Ουρά';
	@override String get quickSave => 'Γρήγορη Αποθήκευση';
	@override String get renamed => 'Μετονομάστηκε';
	@override String get reset => 'Επαναφορά';
	@override String get restart => 'Επανεκκίνηση';
	@override String get settings => 'Ρυθμίσεις';
	@override String get skipped => 'Παράλειψη';
	@override String get start => 'Έναρξη';
	@override String get stop => 'Διακοπή';
	@override String get save => 'Αποθήκευση';
	@override String get unchanged => 'Χωρίς αλλαγές';
	@override String get unknown => 'Αγνωστο';
	@override String get noItemInClipboard => 'Κανένα στοιχείο στο Πρόχειρο';
}

// Path: receiveTab
class _StringsReceiveTabEl extends _StringsReceiveTabEn {
	_StringsReceiveTabEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Λήψη';
	@override late final _StringsReceiveTabInfoBoxEl infoBox = _StringsReceiveTabInfoBoxEl._(_root);
}

// Path: sendTab
class _StringsSendTabEl extends _StringsSendTabEn {
	_StringsSendTabEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Αποστολή';
	@override late final _StringsSendTabSelectionEl selection = _StringsSendTabSelectionEl._(_root);
	@override late final _StringsSendTabPickerEl picker = _StringsSendTabPickerEl._(_root);
	@override String get shareIntentInfo => 'Μπορείτε επίσης να χρησιμοποιήσετε τη δυνατότητα "Κοινή χρήση" της κινητής συσκευής σας για να επιλέξετε αρχεία πιο εύκολα.';
	@override String get nearbyDevices => 'Κοντινές συσκευές';
	@override String get thisDevice => 'Αυτή η συσκευή';
	@override String get scan => 'Αναζήτηση για συσκευές';
	@override String get sendMode => 'Λειτουργία αποστολής';
	@override late final _StringsSendTabSendModesEl sendModes = _StringsSendTabSendModesEl._(_root);
	@override String get sendModeHelp => 'Επεξήγηση';
	@override String get help => 'Βεβαιωθείτε ότι ο επιθυμητός παραλήπτης βρίσκεται επίσης στο ίδιο δίκτυο Wi-Fi.';
	@override String get placeItems => 'Τοποθετήστε στοιχεία για διαμοιρασμό.';
}

// Path: settingsTab
class _StringsSettingsTabEl extends _StringsSettingsTabEn {
	_StringsSettingsTabEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ρυθμίσεις';
	@override late final _StringsSettingsTabGeneralEl general = _StringsSettingsTabGeneralEl._(_root);
	@override late final _StringsSettingsTabReceiveEl receive = _StringsSettingsTabReceiveEl._(_root);
	@override late final _StringsSettingsTabNetworkEl network = _StringsSettingsTabNetworkEl._(_root);
	@override String get advancedSettings => 'Προχωρημένες ρυθμίσεις';
}

// Path: troubleshootPage
class _StringsTroubleshootPageEl extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Αντιμετώπιση προβλημάτων';
	@override String get subTitle => 'Αυτή η εφαρμογή δεν λειτουργεί όπως αναμένεται; Εδώ μπορείτε να βρείτε κοινές λύσεις.';
	@override String get solution => 'Λύση:';
	@override String get fixButton => 'Αυτόματη διόρθωση';
	@override late final _StringsTroubleshootPageFirewallEl firewall = _StringsTroubleshootPageFirewallEl._(_root);
	@override late final _StringsTroubleshootPageNoConnectionEl noConnection = _StringsTroubleshootPageNoConnectionEl._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageEl extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ιστορικό';
	@override String get openFolder => 'Άνοιγμα φακέλου';
	@override String get deleteHistory => 'Διαγραφή ιστορικού';
	@override String get empty => 'Το ιστορικό είναι κενό.';
	@override late final _StringsReceiveHistoryPageEntryActionsEl entryActions = _StringsReceiveHistoryPageEntryActionsEl._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageEl extends _StringsApkPickerPageEn {
	_StringsApkPickerPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εφαρμογές (APK)';
	@override String get excludeSystemApps => 'Εξαίρεση εφαρμογών συστήματος';
	@override String get excludeAppsWithoutLaunchIntent => 'Εξαίρεση μη εκκινήσιμων εφαρμογών';
	@override String apps({required Object n}) => '${n} Εφαρμογές';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageEl extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Διαγραφή όλων';
}

// Path: receivePage
class _StringsReceivePageEl extends _StringsReceivePageEn {
	_StringsReceivePageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('el'))(n,
		one: 'θέλει να σου στείλει ένα αρχείο',
		other: 'θέλει να σου στείλει ${n} αρχεία',
	);
	@override String get subTitleMessage => 'σου έστειλε ένα μήνυμα:';
	@override String get subTitleLink => 'σου έστειλε ένα σύνδεσμο:';
	@override String get canceled => 'Ο αποστολέας ακύρωσε το αίτημα.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageEl extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Επιλογές';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(Φάκελος LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Απενεργοποιήθηκε αυτόματα επειδή υπάρχουν κατάλογοι.';
}

// Path: sendPage
class _StringsSendPageEl extends _StringsSendPageEn {
	_StringsSendPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Αναμονή για απάντηση...';
	@override String get rejected => 'Ο παραλήπτης απέρριψε το αίτημα.';
	@override String get busy => 'Ο παραλήπτης είναι απασχολημένος με άλλο αίτημα.';
}

// Path: progressPage
class _StringsProgressPageEl extends _StringsProgressPageEn {
	_StringsProgressPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Γίνεται αποστολή αρχείων';
	@override String get titleReceiving => 'Γίνεται λήψη αρχείων';
	@override String get savedToGallery => 'Αποθηκεύτηκε στις Φωτογραφίες';
	@override late final _StringsProgressPageTotalEl total = _StringsProgressPageTotalEl._(_root);
}

// Path: webSharePage
class _StringsWebSharePageEl extends _StringsWebSharePageEn {
	_StringsWebSharePageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Διαμοιρασμός μέσω συνδέσμου';
	@override String get loading => 'Εκκίνηση διακομιστή...';
	@override String get stopping => 'Σταμάτημα διακομιστή...';
	@override String get error => 'Ένα σφάλμα προέκυψε κατά την εκκίνηση του διακομιστή.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('el'))(n,
		one: 'Άνοιγμα αυτού του συνδέσμου στον φυλλομετρητή:',
		other: 'Άνοιγμα ενός από αυτούς τους συνδέσμους στον φυλλομετρητή:',
	);
	@override String get requests => 'Αιτήματα';
	@override String get noRequests => 'Κανένα αίτμηα ακόμα.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'Το LocalSend χρησιμοποιεί αυτο-υπογεγραμμένο πιστοποιητικό. Χρειάζεται να το αποθεχτείτε στον φυλλομετρητή.';
	@override String pendingRequests({required Object n}) => 'Αναμονή αιτημάτων: ${n}';
}

// Path: aboutPage
class _StringsAboutPageEl extends _StringsAboutPageEn {
	_StringsAboutPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Σχετικά με το LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageEl extends _StringsChangelogPageEn {
	_StringsChangelogPageEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Καταγραφή αλλαγών';
}

// Path: aliasGenerator
class _StringsAliasGeneratorEl extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
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
	@override List<String> get fruits => [
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
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsEl extends _StringsDialogsEn {
	_StringsDialogsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileEl addFile = _StringsDialogsAddFileEl._(_root);
	@override late final _StringsDialogsAddressInputEl addressInput = _StringsDialogsAddressInputEl._(_root);
	@override late final _StringsDialogsCancelSessionEl cancelSession = _StringsDialogsCancelSessionEl._(_root);
	@override late final _StringsDialogsCannotOpenFileEl cannotOpenFile = _StringsDialogsCannotOpenFileEl._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeEl encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeEl._(_root);
	@override late final _StringsDialogsErrorDialogEl errorDialog = _StringsDialogsErrorDialogEl._(_root);
	@override late final _StringsDialogsFavoriteDialogEl favoriteDialog = _StringsDialogsFavoriteDialogEl._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogEl favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogEl._(_root);
	@override late final _StringsDialogsFavoriteEditDialogEl favoriteEditDialog = _StringsDialogsFavoriteEditDialogEl._(_root);
	@override late final _StringsDialogsFileInfoEl fileInfo = _StringsDialogsFileInfoEl._(_root);
	@override late final _StringsDialogsFileNameInputEl fileNameInput = _StringsDialogsFileNameInputEl._(_root);
	@override late final _StringsDialogsHistoryClearDialogEl historyClearDialog = _StringsDialogsHistoryClearDialogEl._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedEl localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedEl._(_root);
	@override late final _StringsDialogsMessageInputEl messageInput = _StringsDialogsMessageInputEl._(_root);
	@override late final _StringsDialogsNoFilesEl noFiles = _StringsDialogsNoFilesEl._(_root);
	@override late final _StringsDialogsNoPermissionEl noPermission = _StringsDialogsNoPermissionEl._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformEl notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformEl._(_root);
	@override late final _StringsDialogsQrEl qr = _StringsDialogsQrEl._(_root);
	@override late final _StringsDialogsQuickActionsEl quickActions = _StringsDialogsQuickActionsEl._(_root);
	@override late final _StringsDialogsQuickSaveNoticeEl quickSaveNotice = _StringsDialogsQuickSaveNoticeEl._(_root);
	@override late final _StringsDialogsSendModeHelpEl sendModeHelp = _StringsDialogsSendModeHelpEl._(_root);
}

// Path: tray
class _StringsTrayEl extends _StringsTrayEn {
	_StringsTrayEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Έξοδος από το LocalSend';
}

// Path: web
class _StringsWebEl extends _StringsWebEn {
	_StringsWebEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Απορρίφθηκε';
	@override String get files => 'Αρχεία';
	@override String get fileName => 'Όνομα αρχείου';
	@override String get size => 'Μέγεθος';
}

// Path: assetPicker
class _StringsAssetPickerEl extends _StringsAssetPickerEn {
	_StringsAssetPickerEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Επιβεβαιώση';
	@override String get cancel => 'Ακύρωση';
	@override String get edit => 'Επεξεργασία';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Η φόρτωση απέτυχε';
	@override String get original => 'Προέλευση';
	@override String get preview => 'Προεπισκόπηση';
	@override String get select => 'Επιλογή';
	@override String get emptyList => 'Κενή λίστα';
	@override String get unSupportedAssetType => 'Μη υποστηριζόμενος τύπος αρχείου.';
	@override String get unableToAccessAll => 'Δεν είναι δυνατή η πρόσβαση σε όλα τα αρχεία της συσκευής';
	@override String get viewingLimitedAssetsTip => 'Προβολή μόνο των αρχείων και άλμπουμ που είναι προσβάσιμα από την εφαρμογή.';
	@override String get changeAccessibleLimitedAssets => 'Κάντε κλικ για ενημέρωση των προσβάσιμων αρχείων';
	@override String get accessAllTip => 'Η εφαρμογή μπορεί να έχει πρόσβαση μόνο σε ορισμένα αρχεία στη συσκευή. Μεταβείτε στις ρυθμίσεις συστήματος και επιτρέψτε στην εφαρμογή να έχει πρόσβαση σε όλα τα μέσα της συσκευής.';
	@override String get goToSystemSettings => 'Μεταβείτε στις ρυθμίσεις συστήματος';
	@override String get accessLimitedAssets => 'Συνεχίστε με περιορισμένη πρόσβαση';
	@override String get accessiblePathName => 'Προσβάσιμα αρχεία';
	@override String get sTypeAudioLabel => 'Ήχος';
	@override String get sTypeImageLabel => 'Εικόνα';
	@override String get sTypeVideoLabel => 'Βίντεο';
	@override String get sTypeOtherLabel => 'Άλλα μέσα';
	@override String get sActionPlayHint => 'αναπαραγωγή';
	@override String get sActionPreviewHint => 'προεπισκόπηση';
	@override String get sActionSelectHint => 'επιλογή';
	@override String get sActionSwitchPathLabel => 'αλλαγή μονοπατιού';
	@override String get sActionUseCameraHint => 'χρήση κάμερας';
	@override String get sNameDurationLabel => 'διάρκεια';
	@override String get sUnitAssetCountLabel => 'μετρητής';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxEl extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Θύρα:';
	@override String get alias => 'Όνομα συσκευής:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionEl extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Επιλογή';
	@override String files({required Object files}) => 'Αρχεία: ${files}';
	@override String size({required Object size}) => 'Μέγεθος: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerEl extends _StringsSendTabPickerEn {
	_StringsSendTabPickerEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get file => 'Αρχείο';
	@override String get folder => 'Φάκελος';
	@override String get media => 'Μέσα';
	@override String get text => 'Κείμενο';
	@override String get app => 'Εφαρμογή';
	@override String get clipboard => 'Επικόλληση';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesEl extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get single => 'Ένας παραλήπτης';
	@override String get multiple => 'Πολλαπλοί παραλήπτες';
	@override String get link => 'Διαμοιρασμός μέσω συνδέσμου';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralEl extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Γενικά';
	@override String get brightness => 'Θέμα';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsEl brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsEl._(_root);
	@override String get color => 'Χρώμα';
	@override late final _StringsSettingsTabGeneralColorOptionsEl colorOptions = _StringsSettingsTabGeneralColorOptionsEl._(_root);
	@override String get language => 'Γλώσσα';
	@override late final _StringsSettingsTabGeneralLanguageOptionsEl languageOptions = _StringsSettingsTabGeneralLanguageOptionsEl._(_root);
	@override String get saveWindowPlacement => 'Έξοδος: Αποθήκευση θέσης παραθύρου';
	@override String get minimizeToTray => 'Έξοδος: Ελαχιστοποίηση στη γραμμή εργασιών/μενού';
	@override String get launchAtStartup => 'Αυτόματη εκκίνηση μετά τη σύνδεση';
	@override String get launchMinimized => 'Αυτόματη εκκίνηση: Έναρξη ελαχιστοποιημένο';
	@override String get animations => 'Οπτικά εφέ';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveEl extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Λήψη';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Προορισμός';
	@override String get downloads => '(Λήψεις)';
	@override String get saveToGallery => 'Αποθήκευση μέσου στη συλλογή';
	@override String get saveToHistory => 'Αποθήκευση στο ιστορικό';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkEl extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Δίκτυο';
	@override String get needRestart => 'Κάντε επανεκκίνηση του διακομιστή για να εφαρμοστούν οι ρυθμίσεις!';
	@override String get server => 'Διακομιστής';
	@override String get alias => 'Όνομα συσκευής';
	@override String get deviceType => 'Τύπος συσκευής';
	@override String get deviceModel => 'Μοντέλο συσκευής';
	@override String get port => 'Θύρα';
	@override String portWarning({required Object defaultPort}) => 'Ενδέχεται να μην εντοπιστείτε από άλλες συσκευές επειδή χρησιμοποιείτε μια προσαρμοσμένη θύρα. (προεπιλογή: ${defaultPort})';
	@override String get encryption => 'Κρυπτογράφηση';
	@override String get multicastGroup => 'Αναμετάδοση';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Ενδέχεται να μην εντοπιστείτε από άλλες συσκευές επειδή χρησιμοποιείτε μια προσαρμοσμένη διεύθυνση αναμετάδοσης. (προεπιλογή: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallEl extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Αυτή η εφαρμογή μπορεί να στείλει αρχεία σε άλλες συσκευές, αλλά άλλες συσκευές δεν μπορούν να στείλουν αρχεία σε αυτήν τη συσκευή.';
	@override String solution({required Object port}) => 'Αυτό είναι πιθανότατα ένα ζήτημα του τείχους προστασίας. Μπορείτε να το λύσετε επιτρέποντας τις εισερχόμενες συνδέσεις (UDP και TCP) στη θύρα ${port}.';
	@override String get openFirewall => 'Άνοιγμα Τείχους Προστασίας';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionEl extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Και οι δύο συσκευές δεν μπορούν να ανακαλύψουν η μία την άλλη ούτε μπορούν να μοιραστούν αρχεία.';
	@override String get solution => 'Υπάρχει το πρόβλημα και από τις δύο πλευρές; Πρέπει να βεβαιωθείτε ότι και οι δύο συσκευές βρίσκονται στο ίδιο δίκτυο Wi-Fi και μοιράζονται την ίδια διαμόρφωση (θύρα, διεύθυνση αναμετάδοσης, κρυπτογράφηση). Το wifi ενδέχεται να μην επιτρέπει την επικοινωνία μεταξύ των συμμετεχόντων. Σε αυτήν την περίπτωση, αυτή η επιλογή πρέπει να είναι ενεργοποιημένη στο δρομολογητή.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsEl extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get open => 'Άνοιγμα αρχείου';
	@override String get info => 'Πληροφορίες';
	@override String get deleteFromHistory => 'Διαγραφή από το ιστορικό';
}

// Path: progressPage.total
class _StringsProgressPageTotalEl extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleEl title = _StringsProgressPageTotalTitleEl._(_root);
	@override String count({required Object curr, required Object n}) => 'Αρχεία: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Μέγεθος: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Ταχύτητα: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileEl extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Προσθήκη στις επιλογές';
	@override String get content => 'Τι θέλετε να προστεθεί;';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputEl extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εισαγωγή διεύθυνσης';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Διεύθυνση IP';
	@override String get recentlyUsed => 'Χρησιμοποιήθηκε πρόσφατα: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionEl extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ακύρωση της μεταφοράς του αρχείου';
	@override String get content => 'Θέλετε σίγουρα να ακυρωθεί η μεταφορά του αρχείου?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileEl extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Δεν μπορεί να ανοιχτεί το αρχείο';
	@override String content({required Object file}) => 'Δεν μπορεί να ανοιχτεί το "${file}". Έχετε μήπως μετακινήσει, μενονομάσει ή διαγράψει το αρχείο;';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeEl extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Η κρυπτογράφηση απενεργοποιήθηκε';
	@override String get content => 'Η επικοινωνία πραγματοποιείται πλέον μέσω του μη κρυπτογραφημένου πρωτοκόλλου HTTP. Για να χρησιμοποιήσετε το HTTPS, ενεργοποιήστε ξανά την κρυπτογράφηση.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogEl extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogEl extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Αγαπημένα';
	@override String get noFavorites => 'Καμία αγαπημένη συσκευή προς το παρόν.';
	@override String get addFavorite => 'Προσθήκη';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogEl extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Διαγραφή από τα αγαπημένα';
	@override String content({required Object name}) => 'Θέλετε σίγουρα να διαγραφεί από τα αγαπημένα το "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogEl extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Προσθήκη στα αγαπημένα';
	@override String get titleEdit => 'Ρυθμίσεις';
	@override String get name => 'Όνομα συσκευής';
	@override String get auto => '(αυτόματα)';
	@override String get ip => 'Διεύθυνση IP';
	@override String get port => 'Θύρα';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoEl extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Πληροφορίες αρχείου';
	@override String get fileName => 'Όνομα αρχείου:';
	@override String get path => 'Μονοπάτι:';
	@override String get size => 'Μέγεθος:';
	@override String get sender => 'Αποστολέας:';
	@override String get time => 'Ώρα:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputEl extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εισάγετε το όνομα του αρχείου';
	@override String original({required Object original}) => 'Πρωτότυπο: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogEl extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Καθαρισμός ιστορικού';
	@override String get content => 'Θέλετε σίγουρα να διαγράψετε όλο το ιστορικό;';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedEl extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend can\'t find other devices without having the permission to scan the local network. Please grant this permission in the settings.';
	@override String get gotoSettings => 'Ρυθμίσεις';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputEl extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Τύπος μηνύματος';
	@override String get multiline => 'Πολλαπλών γραμμών';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesEl extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Κανένα αρχείο δεν επιλέχθηκε';
	@override String get content => 'Παρακαλώ επιλέξτε τουλάχιστον ένα αρχείο.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionEl extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Χωρίς άδεια';
	@override String get content => 'Δεν έχετε παραχωρήσει τις απαραίτητες άδειες. Παρακαλώ παραχωρήστε τα στις ρυθμίσεις.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformEl extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Μη διαθέσιμο';
	@override String get content => 'Αυτό το χαρακτηριστικό είναι διαθέσιμο μόνο σε:';
}

// Path: dialogs.qr
class _StringsDialogsQrEl extends _StringsDialogsQrEn {
	_StringsDialogsQrEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Κώδικας QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsEl extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Γρήγορες Ενέργειες';
	@override String get counter => 'Μετρητής';
	@override String get prefix => 'Πρόθεμα';
	@override String get padZero => 'Συμπλήρωση με μηδενικά';
	@override String get sortBeforeCount => 'Ταξινόμηση αλφαβητικά εκ των προτέρων';
	@override String get random => 'Τυχαία';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeEl extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Τα αιτήματα αρχείων γίνονται αυτόματα δεκτά. Έχετε υπόψη σας ότι όλοι στο τοπικό δίκτυο μπορούν να σας στείλουν αρχεία.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpEl extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Λειτουργίες αποστολής';
	@override String get single => 'Στέλνει αρχεία σε έναν παραλήπτη. Η επιλογή θα διαγραφεί μετά την ολοκλήρωση της μεταφοράς του αρχείου.';
	@override String get multiple => 'Στέλνει αρχεία σε πολλούς παραλήπτες. Η επιλογή δεν θα διαγραφεί.';
	@override String get link => 'Οι παραλήπτες που δεν έχουν εγκαταστήσει το LocalSend μπορούν να πραγματοποιήσουν λήψη των επιλεγμένων αρχείων ανοίγοντας τον σύνδεσμο στον φυλλομετρητή τους.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsEl extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Σύστημα';
	@override String get dark => 'Σκοτεινό';
	@override String get light => 'Φωτεινό';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsEl extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Σύστημα';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsEl extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Σύστημα';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleEl extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleEl._(_StringsEl root) : this._root = root, super._(root);

	@override final _StringsEl _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Συνολική πρόοδος (${time})';
	@override String get finishedError => 'Ολοκληρώθηκε με σφάλμα';
	@override String get canceledSender => 'Ακυρώθηκε από τον αποστολέα';
	@override String get canceledReceiver => 'Ακυρώθηκε από τον παραλήπτη';
}
