part of 'strings.g.dart';

// Path: <root>
class _StringsKm extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsKm.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.km,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <km>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsKm _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'ភាសាខ្មែរ';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralKm general = _StringsGeneralKm._(_root);
	@override late final _StringsReceiveTabKm receiveTab = _StringsReceiveTabKm._(_root);
	@override late final _StringsSendTabKm sendTab = _StringsSendTabKm._(_root);
	@override late final _StringsSettingsTabKm settingsTab = _StringsSettingsTabKm._(_root);
	@override late final _StringsTroubleshootPageKm troubleshootPage = _StringsTroubleshootPageKm._(_root);
	@override late final _StringsReceiveHistoryPageKm receiveHistoryPage = _StringsReceiveHistoryPageKm._(_root);
	@override late final _StringsApkPickerPageKm apkPickerPage = _StringsApkPickerPageKm._(_root);
	@override late final _StringsSelectedFilesPageKm selectedFilesPage = _StringsSelectedFilesPageKm._(_root);
	@override late final _StringsReceivePageKm receivePage = _StringsReceivePageKm._(_root);
	@override late final _StringsReceiveOptionsPageKm receiveOptionsPage = _StringsReceiveOptionsPageKm._(_root);
	@override late final _StringsSendPageKm sendPage = _StringsSendPageKm._(_root);
	@override late final _StringsProgressPageKm progressPage = _StringsProgressPageKm._(_root);
	@override late final _StringsWebSharePageKm webSharePage = _StringsWebSharePageKm._(_root);
	@override late final _StringsAboutPageKm aboutPage = _StringsAboutPageKm._(_root);
	@override late final _StringsDonationPageKm donationPage = _StringsDonationPageKm._(_root);
	@override late final _StringsChangelogPageKm changelogPage = _StringsChangelogPageKm._(_root);
	@override late final _StringsAliasGeneratorKm aliasGenerator = _StringsAliasGeneratorKm._(_root);
	@override late final _StringsDialogsKm dialogs = _StringsDialogsKm._(_root);
	@override late final _StringsTrayKm tray = _StringsTrayKm._(_root);
	@override late final _StringsWebKm web = _StringsWebKm._(_root);
	@override late final _StringsAssetPickerKm assetPicker = _StringsAssetPickerKm._(_root);
}

// Path: general
class _StringsGeneralKm extends _StringsGeneralEn {
	_StringsGeneralKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get accept => 'ទទួល';
	@override String get accepted => 'បានទទួល';
	@override String get add => 'បន្ថែម';
	@override String get advanced => 'កម្រិតខ្ពស់';
	@override String get cancel => 'បោះបង់';
	@override String get close => 'បិទ';
	@override String get confirm => 'បញ្ជាក់';
	@override String get continueStr => 'បន្ត';
	@override String get copy => 'ចម្លង';
	@override String get copiedToClipboard => 'បានចម្លង';
	@override String get decline => 'បដិសេធ';
	@override String get done => 'រួចរាល់';
	@override String get delete => 'លុប';
	@override String get edit => 'កែប្រែ';
	@override String get error => 'មានបញ្ហា';
	@override String get example => 'ឧទាហរណ៍';
	@override String get files => 'ឯកសារ';
	@override String get finished => 'រួចរាល់ហើយ';
	@override String get hide => 'លាក់';
	@override String get off => 'បិទ';
	@override String get offline => 'បិទអនឡាញ';
	@override String get on => 'បើក';
	@override String get online => 'អនឡាញ';
	@override String get open => 'បើក';
	@override String get queue => 'តម្រៀបជួរ';
	@override String get quickSave => 'រក្សាទុករហ័ស';
	@override String get renamed => 'បានកែឈ្មោះ';
	@override String get reset => 'កំណត់ឡើងវិញ';
	@override String get restart => 'ចាប់ផ្តើមឡើងវិញ';
	@override String get settings => 'ការកំណត់';
	@override String get skipped => 'រំលង';
	@override String get start => 'ចាប់ផ្តើម';
	@override String get stop => 'បញ្ឈប់';
	@override String get save => 'រក្សាទុក';
	@override String get unchanged => 'មិនបានផ្លាស់ប្តូរ';
	@override String get unknown => 'មិនស្គាល់';
	@override String get noItemInClipboard => 'មិនមានរបស់នៅក្នុងក្តារចម្លង';
}

// Path: receiveTab
class _StringsReceiveTabKm extends _StringsReceiveTabEn {
	_StringsReceiveTabKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការទទួល';
	@override late final _StringsReceiveTabInfoBoxKm infoBox = _StringsReceiveTabInfoBoxKm._(_root);
}

// Path: sendTab
class _StringsSendTabKm extends _StringsSendTabEn {
	_StringsSendTabKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការផ្ញើ';
	@override late final _StringsSendTabSelectionKm selection = _StringsSendTabSelectionKm._(_root);
	@override late final _StringsSendTabPickerKm picker = _StringsSendTabPickerKm._(_root);
	@override String get shareIntentInfo => 'អ្នកក៏អាចប្រើប្រាស់មុខងារ "ចែករំលេក" ក្នុងទូរស័ព្ទដៃរបស់អ្នកដើម្បីរើសឯកសារបានកាន់តែងាយស្រួល។';
	@override String get nearbyDevices => 'ឧបករណ៍ដែលនៅជិតនេះ';
	@override String get thisDevice => 'ឧបករណ៍នេះ';
	@override String get scan => 'កំពុងរកមើលឧបករណ៍';
	@override String get sendMode => 'ប្រភេទនៃការផ្ញើ';
	@override late final _StringsSendTabSendModesKm sendModes = _StringsSendTabSendModesKm._(_root);
	@override String get sendModeHelp => 'ការពន្យល់';
	@override String get help => 'សូមប្រាកដថាទីតាំងដែលអ្នកចង់ផ្ញើគឺត្រូវតែភ្ជាប់បណ្តាញ Wi-Fi តែមួយដូចគ្នា។';
	@override String get placeItems => 'ដាក់របស់ដែលត្រូវចែករំលែក';
}

// Path: settingsTab
class _StringsSettingsTabKm extends _StringsSettingsTabEn {
	_StringsSettingsTabKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការកំណត់';
	@override late final _StringsSettingsTabGeneralKm general = _StringsSettingsTabGeneralKm._(_root);
	@override late final _StringsSettingsTabReceiveKm receive = _StringsSettingsTabReceiveKm._(_root);
	@override late final _StringsSettingsTabNetworkKm network = _StringsSettingsTabNetworkKm._(_root);
	@override late final _StringsSettingsTabOtherKm other = _StringsSettingsTabOtherKm._(_root);
	@override String get advancedSettings => 'ការកំណត់កម្រិតខ្ពស់';
}

// Path: troubleshootPage
class _StringsTroubleshootPageKm extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ដោះស្រាយបញ្ហា';
	@override String get subTitle => 'កម្មវិធីនេះមិនដំណើរការដូចការរំពឹងទុកមែនទេ? សូមមើលដំណោះស្រាយមួយចំនួននេះ។';
	@override String get solution => 'ដំណោះស្រាយ:';
	@override String get fixButton => 'ជួសជុលដោយស្វ័យប្រវត្តិ';
	@override late final _StringsTroubleshootPageFirewallKm firewall = _StringsTroubleshootPageFirewallKm._(_root);
	@override late final _StringsTroubleshootPageNoConnectionKm noConnection = _StringsTroubleshootPageNoConnectionKm._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageKm extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ប្រវត្តិ';
	@override String get openFolder => 'បើកថតឯកសារ';
	@override String get deleteHistory => 'លុបប្រវត្តិ';
	@override String get empty => 'មិនមានប្រវត្តិទេ';
	@override late final _StringsReceiveHistoryPageEntryActionsKm entryActions = _StringsReceiveHistoryPageEntryActionsKm._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageKm extends _StringsApkPickerPageEn {
	_StringsApkPickerPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'កម្មវិធី (APK)';
	@override String get excludeSystemApps => 'ដកចេញកម្មវិធីរបស់ប្រព័ន្ធ';
	@override String get excludeAppsWithoutLaunchIntent => 'ដកចេញកម្មវិធីដែលមិនអាចបើកបាន';
	@override String apps({required Object n}) => '${n} កម្មវិធី';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageKm extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'លុបទាំងអស់';
}

// Path: receivePage
class _StringsReceivePageKm extends _StringsReceivePageEn {
	_StringsReceivePageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('km'))(n,
		one: 'ចង់ផ្ញើឯកសារមួយឲ្យមកអ្នក។',
		other: 'ចង់ផ្ញើឯកសារ ${n} ឲ្យមកអ្នក។',
	);
	@override String get subTitleMessage => 'បានផ្ញើសារមួយមកអ្នក:';
	@override String get subTitleLink => 'បានផ្ញើតំណភ្ជាប់មួយមកអ្នក:';
	@override String get canceled => 'អ្នកផ្ញើបានបោះបង់សំណើរហើយ។';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageKm extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ជម្រើស';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(ថតឯកសារ LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'បានបិទដោយស្វ័យប្រវត្តិ ដោយសារមានថតស្រាប់ហើយ។';
}

// Path: sendPage
class _StringsSendPageKm extends _StringsSendPageEn {
	_StringsSendPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'កំពុងរង់ចាំការឆ្លើយតប...';
	@override String get rejected => 'អ្នកទទួលបានបដិសេធសំណើនេះ។';
	@override String get busy => 'អ្នកទទួលកំពុងជាប់រវល់ជាមួយសំណើផ្សេងទៀត។';
}

// Path: progressPage
class _StringsProgressPageKm extends _StringsProgressPageEn {
	_StringsProgressPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'កំពុងផ្ញើឯកសារ';
	@override String get titleReceiving => 'កំពុងទទួលឯកសារ';
	@override String get savedToGallery => 'បានរក្សាទុកក្នុងកម្មវិធីរូបថត';
	@override late final _StringsProgressPageTotalKm total = _StringsProgressPageTotalKm._(_root);
}

// Path: webSharePage
class _StringsWebSharePageKm extends _StringsWebSharePageEn {
	_StringsWebSharePageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ចែករំលែកតាមតំណភ្ជាប់';
	@override String get loading => 'កំពុងចាប់ផ្តើម server...';
	@override String get stopping => 'កំពុងបញ្ឈប់ server...';
	@override String get error => 'មានកំហុសមួយបានកើតឡើងអំឡុងពេលចាប់ផ្តើម server ។';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('km'))(n,
		one: 'បើកតំណនេះនៅក្នុងកម្មវិធី browser:',
		other: 'បើកតំណមួយក្នុងចំណោមតំណភ្ជាប់ទាំងនេះក្នុងកម្មវិធី browser:',
	);
	@override String get requests => 'ការស្នើសុំ';
	@override String get noRequests => 'មិនទាន់មានសំណើនៅឡើយ។';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend ប្រើវិញ្ញាបនបត្រដែលចុះហត្ថលេខាដោយខ្លួនឯង។ អ្នកត្រូវទទួលយកវានៅក្នុងកម្មវិធី​ browser ។';
	@override String pendingRequests({required Object n}) => 'សំណើដែលកំពុងរង់ចាំ: ${n}';
}

// Path: aboutPage
class _StringsAboutPageKm extends _StringsAboutPageEn {
	_StringsAboutPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'អំពី LocalSend';
	@override List<String> get description => [
		'LocalSend គឺជាកម្មវិធីដែលប្រើដោយឥតគិតថ្លៃ និងបើកចំហនូវប្រភពកូដ ដែលអនុញ្ញាតឱ្យអ្នកអាចចែករំលែកឯកសារ និងសារដោយសុវត្ថិភាពជាមួយនឹងឧបករណ៍ដែលនៅជិតៗដែលនៅលើបណ្តាញមូលដ្ឋានរួមគ្នាដោយមិនចាំបាច់ភ្ជាប់អ៊ីនធឺណិត។',
		'កម្មវិធីនេះគឺអាចដំណើរការនៅលើគ្រប់ប្រព័ន្ធប្រតិបត្តិការទាំងអស់រួមមានដូចជា Android, iOS, macOS, Windows និង Linux ។ អ្នកអាចស្វែងរក និងទាញយកបានច្រើនវិធីសាស្ត្រតាមរយៈគេហទំព័រផ្លូវការរបស់ LocalSend ។',
	];
	@override String get author => 'ម្ចាស់កម្មសិទ្ធ';
	@override String get contributors => 'អ្នកចូលរួមចំណែក';
	@override String get translators => 'អ្នកបកប្រែ';
}

// Path: donationPage
class _StringsDonationPageKm extends _StringsDonationPageEn {
	_StringsDonationPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការឧបត្ថម្ភ';
	@override String get info => 'LocalSend ជាកម្មវិធីដែលឥតគិតថ្លៃ, បើកបង្ហាញប្រភពកូដជាសាធារណៈ និងមិនមានការបង្ហាញនូវផ្ទាំងពាណិជ្ជកម្មរំខានឡើយ។ ប្រសិនបើអ្នកពេញចិត្តកម្មវិធីនេះ​ និងចង់ជួយពួកយើង, អ្នកអាចចូលរួមលើកស្ទួយការអភិវឌ្ឍន៍កម្មវិធីនេះជាមួយពួកយើងតាមរយៈការឧបត្ថម្ភជាថវិកា។';
	@override String donate({required Object amount}) => 'ឧបត្ថម្ភចំនួន ${amount}';
	@override String get thanks => 'អរគុណអ្នកខ្លាំងណាស់សម្រាប់ការឧបត្ថម្ភមកកាន់ពួកយើង!';
	@override String get restore => 'ស្តារការទូទាត់ត្រឡប់មកវិញ';
}

// Path: changelogPage
class _StringsChangelogPageKm extends _StringsChangelogPageEn {
	_StringsChangelogPageKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'កំណត់ត្រាការផ្លាស់ប្តូរ';
}

// Path: aliasGenerator
class _StringsAliasGeneratorKm extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'គួរអោយស្រលាញ់',
		'ស្រស់ស្អាត',
		'ធំ',
		'ភ្លឺចែកចាំង',
		'ស្អាត',
		'ពូកែ',
		'ឡូយ',
		'គួរអោយស្រលាញ់',
		'គួរអោយទាក់ទាញ',
		'ហ្មត់ចត់',
		'មានថាមពល',
		'សន្សំសំចៃ',
		'អស្ចារ្យ',
		'លឿន',
		'ល្អ',
		'ស្រស់ស្រាយ',
		'ល្អ',
		'ស្រស់ស្អាត',
		'ល្អណាស់',
		'សង្ហា',
		'ទាក់ទាញ',
		'រួសរាយ',
		'គួរអោយស្រលាញ់',
		'អាថ៌កំបាំង',
		'គួរអោយសរសើរ',
		'ល្អ',
		'អត់ធ្មត់',
		'ស្រស់ស្អាត',
		'មានអំណាច',
		'អ្នកមាន',
		'សម្ងាត់',
		'ឆ្លាតវៃ',
		'រឹងមាំ',
		'ពិសេស',
		'យុទ្ធសាស្ត្រ',
		'រឹងប៉ឹង',
		'ផ្ជិតផ្ចង់',
		'ប្រាជ្ញា',
	];
	@override List<String> get fruits => [
		'ផ្លែប៉ោម',
		'ផ្លែបឺរ',
		'ផ្លែចេក',
		'ផ្លែ Blackberry',
		'ផ្លែ Blueberry',
		'ផ្កាខាត់ណាខៀវ',
		'ផ្លែការ៉ុត',
		'ផ្លែឆឺរី',
		'ផ្លែដូង',
		'ផ្លែទំពាំងបាយជូ',
		'ផ្លែក្រូចឆ្មា',
		'បន្លែ',
		'ផ្លែស្វាយ',
		'ផ្លែឪឡឹក',
		'ផ្សិត',
		'ខ្ទឹមបារាំង',
		'ផ្លែក្រូច',
		'ផ្លែល្ហុង',
		'ផ្លែប៉េស',
		'ផ្លែសឺរី',
		'ផ្លែម្នាស់',
		'ដំឡូង',
		'ផ្លែល្ពៅ',
		'ផ្លែ Raspberry',
		'ផ្លែស្ត្របឺរី',
		'ផ្លែប៉េងប៉ោះ',
	];

	/// នៅក្នុងភាសាខ្លះ គុណនាមអាចនឹងនៅខាងក្រោយនាមវិញ។
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsKm extends _StringsDialogsEn {
	_StringsDialogsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileKm addFile = _StringsDialogsAddFileKm._(_root);
	@override late final _StringsDialogsAddressInputKm addressInput = _StringsDialogsAddressInputKm._(_root);
	@override late final _StringsDialogsCancelSessionKm cancelSession = _StringsDialogsCancelSessionKm._(_root);
	@override late final _StringsDialogsCannotOpenFileKm cannotOpenFile = _StringsDialogsCannotOpenFileKm._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeKm encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeKm._(_root);
	@override late final _StringsDialogsErrorDialogKm errorDialog = _StringsDialogsErrorDialogKm._(_root);
	@override late final _StringsDialogsFavoriteDialogKm favoriteDialog = _StringsDialogsFavoriteDialogKm._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogKm favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogKm._(_root);
	@override late final _StringsDialogsFavoriteEditDialogKm favoriteEditDialog = _StringsDialogsFavoriteEditDialogKm._(_root);
	@override late final _StringsDialogsFileInfoKm fileInfo = _StringsDialogsFileInfoKm._(_root);
	@override late final _StringsDialogsFileNameInputKm fileNameInput = _StringsDialogsFileNameInputKm._(_root);
	@override late final _StringsDialogsHistoryClearDialogKm historyClearDialog = _StringsDialogsHistoryClearDialogKm._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedKm localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedKm._(_root);
	@override late final _StringsDialogsMessageInputKm messageInput = _StringsDialogsMessageInputKm._(_root);
	@override late final _StringsDialogsNoFilesKm noFiles = _StringsDialogsNoFilesKm._(_root);
	@override late final _StringsDialogsNoPermissionKm noPermission = _StringsDialogsNoPermissionKm._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformKm notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformKm._(_root);
	@override late final _StringsDialogsQrKm qr = _StringsDialogsQrKm._(_root);
	@override late final _StringsDialogsQuickActionsKm quickActions = _StringsDialogsQuickActionsKm._(_root);
	@override late final _StringsDialogsQuickSaveNoticeKm quickSaveNotice = _StringsDialogsQuickSaveNoticeKm._(_root);
	@override late final _StringsDialogsSendModeHelpKm sendModeHelp = _StringsDialogsSendModeHelpKm._(_root);
}

// Path: tray
class _StringsTrayKm extends _StringsTrayEn {
	_StringsTrayKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'ចាកចេញពីកម្មវិធី LocalSend';
}

// Path: web
class _StringsWebKm extends _StringsWebEn {
	_StringsWebKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'បានបដិសេធ';
	@override String get files => 'ឯកសារ';
	@override String get fileName => 'ឈ្មោះឯកសារ';
	@override String get size => 'ទំហំ';
}

// Path: assetPicker
class _StringsAssetPickerKm extends _StringsAssetPickerEn {
	_StringsAssetPickerKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'បញ្ជាក់';
	@override String get cancel => 'បោះបង់';
	@override String get edit => 'កែសម្រួល';
	@override String get gifIndicator => 'រូប GIF';
	@override String get loadFailed => 'ការផ្ទុកបរាជ័យ';
	@override String get original => 'ប្រភពដើម';
	@override String get preview => 'មើលលទ្ធផលទុកមុន';
	@override String get select => 'ជ្រើសរើស';
	@override String get emptyList => 'បញ្ជីទទេ';
	@override String get unSupportedAssetType => 'ប្រភេទឯកសារដែលមិនគាំទ្រ។';
	@override String get unableToAccessAll => 'មិនអាចចូលប្រើឯកសារទាំងអស់នៅលើឧបករណ៍បានទេ';
	@override String get viewingLimitedAssetsTip => 'បានតែមើលឯកសារ និងអាល់ប៊ុមប៉ុណ្ណោះដែលអាចចូលដំណើរការបានក្នុងកម្មវិធី។';
	@override String get changeAccessibleLimitedAssets => 'ចុចដើម្បីធ្វើបច្ចុប្បន្នភាពឯកសារដែលអាចចូលប្រើបាន។';
	@override String get accessAllTip => 'កម្មវិធីអាចចូលប្រើបានតែឯកសារមួយចំនួននៅលើឧបករណ៍ប៉ុណ្ណោះ។ ចូលទៅកាន់ការកំណត់ប្រព័ន្ធ ហើយអនុញ្ញាតឱ្យកម្មវិធីចូលប្រើមេឌៀទាំងអស់នៅលើឧបករណ៍។';
	@override String get goToSystemSettings => 'ចូលទៅកាន់ការកំណត់របស់ប្រព័ន្ធ';
	@override String get accessLimitedAssets => 'បន្តជាមួយនឹងការចូលប្រើមានកំណត់';
	@override String get accessiblePathName => 'ឯកសារដែលអាចចូលប្រើបាន';
	@override String get sTypeAudioLabel => 'សម្លេង';
	@override String get sTypeImageLabel => 'រូបភាព';
	@override String get sTypeVideoLabel => 'វីដេអូ';
	@override String get sTypeOtherLabel => 'មេឌៀផ្សេងទៀត';
	@override String get sActionPlayHint => 'ចាក់';
	@override String get sActionPreviewHint => 'មើលលទ្ធផលទុកមុន';
	@override String get sActionSelectHint => 'ជ្រើសរើស';
	@override String get sActionSwitchPathLabel => 'ប្តូរទីតាំង';
	@override String get sActionUseCameraHint => 'ប្រើកាមេរ៉ា';
	@override String get sNameDurationLabel => 'ថេរវេលា';
	@override String get sUnitAssetCountLabel => 'ចំនួន';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxKm extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'ផត:';
	@override String get alias => 'ឈ្មោះដទៃ:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionKm extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការជ្រើសរើស';
	@override String files({required Object files}) => 'ឯកសារ: ${files}';
	@override String size({required Object size}) => 'ទំហំ: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerKm extends _StringsSendTabPickerEn {
	_StringsSendTabPickerKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get file => 'ឯកសារ';
	@override String get folder => 'ថតឯកសារ';
	@override String get media => 'មេឌៀ';
	@override String get text => 'សំណេរ';
	@override String get app => 'កម្មវិធី';
	@override String get clipboard => 'បិទភ្ជាប់';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesKm extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get single => 'អ្នកទទួលតែម្នាក់';
	@override String get multiple => 'អ្នកទទួលច្រើននាក់';
	@override String get link => 'ចែករំលែកតាមតំណភ្ជាប់';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralKm extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ទូទៅ';
	@override String get brightness => 'ស្បែកកម្មវិធី';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsKm brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsKm._(_root);
	@override String get color => 'ពណ៌';
	@override late final _StringsSettingsTabGeneralColorOptionsKm colorOptions = _StringsSettingsTabGeneralColorOptionsKm._(_root);
	@override String get language => 'ភាសា';
	@override late final _StringsSettingsTabGeneralLanguageOptionsKm languageOptions = _StringsSettingsTabGeneralLanguageOptionsKm._(_root);
	@override String get saveWindowPlacement => 'ចាកចេញ: រក្សាទុកផ្ទាំង Window';
	@override String get minimizeToTray => 'ចាកចេញ: បង្រួមអប្បបរមាទៅរបារម៉ឺនុយ';
	@override String get launchAtStartup => 'ចាប់ផ្តើមដោយស្វ័យប្រវត្តិបន្ទាប់ពីចូលគណនី';
	@override String get launchMinimized => 'ចាប់ផ្តើមដោយស្វ័យប្រវត្តិ: ការចាប់ផ្តើមត្រូវបានលាក់';
	@override String get animations => 'ចលនារស់រវើក';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveKm extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ការទទួល';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'បញ្ចប់ដោយស្វ័យប្រវត្តិ';
	@override String get destination => 'ទិសដៅ';
	@override String get downloads => '(ទាញយក)';
	@override String get saveToGallery => 'រក្សាទុកទៅកាន់កម្មវិធីវិចិត្រសាល';
	@override String get saveToHistory => 'រក្សាទុកទៅកាន់ប្រវត្តិ';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkKm extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បណ្តាញ';
	@override String get needRestart => 'ចាប់ផ្តើម server ឡើងវិញដើម្បីអនុវត្តការកំណត់នេះ!';
	@override String get server => 'Server';
	@override String get alias => 'ឈ្មោះផ្សេងទៀត';
	@override String get deviceType => 'ប្រភេទឧបករណ៍';
	@override String get deviceModel => 'ម៉ូឌែលរបស់ឧបករណ៍';
	@override String get port => 'ផត';
	@override String portWarning({required Object defaultPort}) => 'អ្នកប្រហែលជាមិនត្រូវបានរកឃើញដោយឧបករណ៍ផ្សេងទៀតទេ ដោយសារតែអ្នកកំពុងប្រើច្រកដែលបង្កើតផ្ទាល់ខ្លួន។ (ច្រកដើម: ${defaultPort})';
	@override String get encryption => 'ការការពារទិន្នន័យ';
	@override String get multicastGroup => 'ពហុផ្សាយ';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'អ្នកប្រហែលជាមិនត្រូវបានរកឃើញដោយឧបករណ៍ផ្សេងទៀតទេ ដោយសារតែអ្នកកំពុងប្រើអាសយដ្ឋានពហុផ្សាយដែលបង្កើតផ្ទាល់ខ្លួន។ (ច្រកដើម: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherKm extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ផ្សេងៗ';
	@override String get support => 'ជួយគាំទ្រ LocalSend';
	@override String get donate => 'ការឧបត្ថម្ភ';
	@override String get privacyPolicy => 'ច្បាប់ស្តីអំពីឯកជនភាព';
	@override String get termsOfUse => 'លក្ខខណ្ឌនៃការប្រើប្រាស់';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallKm extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get symptom => '​កម្មវិធីនេះអាចផ្ញើឯកសារទៅឧបករណ៍ផ្សេងទៀត ប៉ុន្តែឧបករណ៍ផ្សេងទៀតមិនអាចផ្ញើឯកសារមកឧបករណ៍នេះបានទេ។';
	@override String solution({required Object port}) => 'នេះទំនងជាបញ្ហារបស់ Firewall ។ អ្នកអាចដោះស្រាយវាបានដោយអនុញ្ញាតឱ្យមានការតភ្ជាប់ចូល (UDP និង TCP) តាមរយៈច្រក ${port}។';
	@override String get openFirewall => 'បើក Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionKm extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'ឧបករណ៍ទាំងពីរមិនអាចរកឃើញគ្នាទៅវិញទៅមក ហើយក៏មិនអាចចែករំលែកឯកសារបានដែរ។';
	@override String get solution => 'បញ្ហា​កើត​មាន​ទាំង​សង​ខាង? បន្ទាប់មកអ្នកត្រូវប្រាកដថាឧបករណ៍ទាំងពីរស្ថិតនៅក្នុងបណ្តាញ wifi ដូចគ្នា និងចែករំលែកការកំណត់ដូចគ្នា (ច្រក អាសយដ្ឋានពហុផ្សាយ ការអ៊ិនគ្រីបទិន្នន័យ)។ Wi-Fi ប្រហែលជាមិនអនុញ្ញាតឱ្យទំនាក់ទំនងរវាងអ្នកចូលរួមទេ។ ក្នុងករណីនេះជម្រើសត្រូវតែបើកនៅលើរ៉ោតទ័រ។';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsKm extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get open => 'បើកឯកសារ';
	@override String get info => 'ព័ត៌មាន';
	@override String get deleteFromHistory => 'លុបចោលពីប្រវត្តិ';
}

// Path: progressPage.total
class _StringsProgressPageTotalKm extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleKm title = _StringsProgressPageTotalTitleKm._(_root);
	@override String count({required Object curr, required Object n}) => 'ឯកសារ: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'ទំហំ: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'ល្បឿន: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileKm extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បន្ថែមទៅការជ្រើសរើស';
	@override String get content => 'តើអ្នកចង់បន្ថែមអ្វី?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputKm extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បញ្ចូលអាសយដ្ឋាន';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'អាស័យដ្ឋាន IP';
	@override String get recentlyUsed => 'បានប្រើថ្មីៗនេះ: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionKm extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បោះបង់ការផ្ទេរឯកសារ';
	@override String get content => 'តើអ្នកពិតជាចង់បោះបង់ការផ្ទេរឯកសារមែនទេ?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileKm extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'មិនអាចបើកឯកសារបានទេ';
	@override String content({required Object file}) => 'មិនអាចបើកបានទេ "${file}"។ តើឯកសារនេះត្រូវបានផ្លាស់ទី ប្តូរឈ្មោះ ឬលុបមែនទេ?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeKm extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បានបិទការអ៊ិនគ្រីបទិន្នន័យ';
	@override String get content => 'ឥឡូវនេះការទំនាក់ទំនងកើតឡើងតាមរយៈពិធីការ HTTP ដែលមិនបានអ៊ិនគ្រីបការពារទិន្នន័យ។ ដើម្បីប្រើ HTTPS សូមបើកការអ៊ិនគ្រីបទិន្នន័យម្តងទៀត។';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogKm extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogKm extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ឧបករណ៍សំណព្វ';
	@override String get noFavorites => 'មិនទាន់មានឧបករណ៍សំណព្វនៅឡើយទេ';
	@override String get addFavorite => 'បន្ថែម';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogKm extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'លុបចេញពីឧបករណ៍សំណព្វ';
	@override String content({required Object name}) => 'តើអ្នកប្រាកដដែរឬទេថាចង់ដក "${name}" ចេញពីឧបករណ៍សំណព្វ?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogKm extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'បន្ថែមទៅកាន់ឧបករណ៍សំណព្វ';
	@override String get titleEdit => 'ការកំណត់';
	@override String get name => 'ឈ្មោះឧបករណ៍';
	@override String get auto => '(auto)';
	@override String get ip => 'អាសយដ្ឋាន IP';
	@override String get port => 'ច្រក';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoKm extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ព័ត៌មានឯកសារ';
	@override String get fileName => 'ឈ្មោះ​ឯកសារ:';
	@override String get path => 'ទីតាំង:';
	@override String get size => 'ទំហំ:';
	@override String get sender => 'អ្នកផ្ញើ:';
	@override String get time => 'រយៈពេល:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputKm extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'បញ្ចូលឈ្មោះឯកសារ';
	@override String original({required Object original}) => 'ច្បាប់ដើម: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogKm extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'លុបជម្រះប្រវត្តិ';
	@override String get content => 'តើអ្នកប្រាកដទេថាចង់លុបនូវរាល់ប្រវត្តិនៃការប្រើប្រាស់ទាំងអស់នេះ?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedKm extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend មិន​អាច​រក​ឃើញ​ឧបករណ៍​ផ្សេង​ទៀត​ដោយ​មិន​មាន​ការ​អនុញ្ញាត​ក្នុង​ការ​ស្កែន​បណ្តាញរួមគ្នា​ទេ។ សូមផ្តល់ការអនុញ្ញាតនេះនៅក្នុងការកំណត់។';
	@override String get gotoSettings => 'ការកំណត់';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputKm extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'សរសេរសារ';
	@override String get multiline => 'ពហុជួរ';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesKm extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'គ្មានឯកសារត្រូវបានជ្រើសរើសទេ។';
	@override String get content => 'សូមជ្រើសរើសយ៉ាងហោចណាស់មួយឯកសារ។';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionKm extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'គ្មានការអនុញ្ញាត';
	@override String get content => 'អ្នកមិន​ទាន់ត្រូវបានផ្តល់ការអនុញ្ញាតទេ។ សូមផ្តល់ឱ្យពួកគេនៅក្នុងការកំណត់។';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformKm extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'មិនដំណើរការ';
	@override String get content => 'មុខងារនេះអាចប្រើបានតែនៅលើ:';
}

// Path: dialogs.qr
class _StringsDialogsQrKm extends _StringsDialogsQrEn {
	_StringsDialogsQrKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'កូដ QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsKm extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'សកម្មភាពរហ័ស';
	@override String get counter => 'Counter';
	@override String get prefix => 'បុព្វបទ';
	@override String get padZero => 'Pad with zeros';
	@override String get sortBeforeCount => 'តម្រៀបតាមអក្ខរក្រមជាមុន';
	@override String get random => 'ចៃដន្យ';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeKm extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'សំណើឯកសារត្រូវបានទទួលយកដោយស្វ័យប្រវត្តិ។ ត្រូវ​ចំណាំ​ថា​អ្នក​រាល់​គ្នា​នៅ​ក្នុង​បណ្ដាញ​មូលដ្ឋាន​រួមគ្នាអាច​ផ្ញើ​ឯកសារ​មក​អ្នកបាន។';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpKm extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get title => 'របៀបនៃការផ្ញើ';
	@override String get single => 'ផ្ញើឯកសារទៅអ្នកទទួលម្នាក់។ ការជ្រើសរើសនឹងត្រូវបានសម្អាតបន្ទាប់ពីការផ្ទេរឯកសារបានបញ្ចប់។';
	@override String get multiple => 'ផ្ញើឯកសារទៅអ្នកទទួលច្រើននាក់។ ការជ្រើសរើសនឹងមិនត្រូវបានសម្អាតទេ។';
	@override String get link => 'អ្នកទទួលដែលមិនបានដំឡើង LocalSend អាចទាញយកឯកសារដែលបានជ្រើសរើសដោយបើកតំណនៅក្នុងកម្មវិធី browser របស់ពួកគេ។';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsKm extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get system => 'តាមប្រព័ន្ធ';
	@override String get dark => 'ងងឹត';
	@override String get light => 'ភ្លឺ';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsKm extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get system => 'តាមប្រព័ន្ធ';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsKm extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String get system => 'តាមប្រព័ន្ធ';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleKm extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleKm._(_StringsKm root) : this._root = root, super._(root);

	@override final _StringsKm _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'រយៈពេលប្រតិបត្តិការសរុប (${time})';
	@override String get finishedError => 'បានបញ្ចប់ជាមួយនឹងបញ្ហា';
	@override String get canceledSender => 'ត្រូវបានបោះបង់ដោយអ្នកផ្ញើ';
	@override String get canceledReceiver => 'ត្រូវបានបោះបង់ដោយអ្នកទទួល';
}
