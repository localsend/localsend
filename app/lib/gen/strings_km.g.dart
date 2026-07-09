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
class TranslationsKm extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsKm({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.km,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <km>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsKm _root = this; // ignore: unused_field

  @override
  TranslationsKm $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKm(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'ភាសាខ្មែរ';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$km general = _Translations$general$km._(_root);
  @override
  late final _Translations$receiveTab$km receiveTab = _Translations$receiveTab$km._(_root);
  @override
  late final _Translations$sendTab$km sendTab = _Translations$sendTab$km._(_root);
  @override
  late final _Translations$settingsTab$km settingsTab = _Translations$settingsTab$km._(_root);
  @override
  late final _Translations$troubleshootPage$km troubleshootPage = _Translations$troubleshootPage$km._(_root);
  @override
  late final _Translations$receiveHistoryPage$km receiveHistoryPage = _Translations$receiveHistoryPage$km._(_root);
  @override
  late final _Translations$apkPickerPage$km apkPickerPage = _Translations$apkPickerPage$km._(_root);
  @override
  late final _Translations$selectedFilesPage$km selectedFilesPage = _Translations$selectedFilesPage$km._(_root);
  @override
  late final _Translations$receivePage$km receivePage = _Translations$receivePage$km._(_root);
  @override
  late final _Translations$receiveOptionsPage$km receiveOptionsPage = _Translations$receiveOptionsPage$km._(_root);
  @override
  late final _Translations$sendPage$km sendPage = _Translations$sendPage$km._(_root);
  @override
  late final _Translations$progressPage$km progressPage = _Translations$progressPage$km._(_root);
  @override
  late final _Translations$webSharePage$km webSharePage = _Translations$webSharePage$km._(_root);
  @override
  late final _Translations$aboutPage$km aboutPage = _Translations$aboutPage$km._(_root);
  @override
  late final _Translations$donationPage$km donationPage = _Translations$donationPage$km._(_root);
  @override
  late final _Translations$changelogPage$km changelogPage = _Translations$changelogPage$km._(_root);
  @override
  late final _Translations$aliasGenerator$km aliasGenerator = _Translations$aliasGenerator$km._(_root);
  @override
  late final _Translations$dialogs$km dialogs = _Translations$dialogs$km._(_root);
  @override
  late final _Translations$sanitization$km sanitization = _Translations$sanitization$km._(_root);
  @override
  late final _Translations$tray$km tray = _Translations$tray$km._(_root);
  @override
  late final _Translations$web$km web = _Translations$web$km._(_root);
  @override
  late final _Translations$assetPicker$km assetPicker = _Translations$assetPicker$km._(_root);
}

// Path: general
class _Translations$general$km extends Translations$general$en {
  _Translations$general$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'ទទួល';
  @override
  String get accepted => 'បានទទួល';
  @override
  String get add => 'បន្ថែម';
  @override
  String get advanced => 'កម្រិតខ្ពស់';
  @override
  String get cancel => 'បោះបង់';
  @override
  String get close => 'បិទ';
  @override
  String get confirm => 'បញ្ជាក់';
  @override
  String get continueStr => 'បន្ត';
  @override
  String get copy => 'ចម្លង';
  @override
  String get copiedToClipboard => 'បានចម្លងទៅឃ្លីបប៊ត';
  @override
  String get decline => 'បដិសេធ';
  @override
  String get done => 'រួចរាល់';
  @override
  String get delete => 'លុប';
  @override
  String get edit => 'កែប្រែ';
  @override
  String get error => 'មានបញ្ហា';
  @override
  String get example => 'ឧទាហរណ៍';
  @override
  String get files => 'ឯកសារ';
  @override
  String get finished => 'រួចរាល់ហើយ';
  @override
  String get hide => 'លាក់';
  @override
  String get off => 'បិទ';
  @override
  String get offline => 'អហ្វឡាញ';
  @override
  String get on => 'បើក';
  @override
  String get online => 'អនឡាញ';
  @override
  String get open => 'បើក';
  @override
  String get queue => 'តម្រៀបជួរ';
  @override
  String get quickSave => 'រក្សាទុករហ័ស';
  @override
  String get quickSaveFromFavorites => 'រក្សាទុករហ័សសម្រាប់ "ឧបករណ៍សំណព្វ"';
  @override
  String get renamed => 'បានកែឈ្មោះ';
  @override
  String get reset => 'អាន់ឌូផ្លាស់ប្ដូរ';
  @override
  String get restart => 'ចាប់ផ្តើមឡើងវិញ';
  @override
  String get settings => 'ការកំណត់';
  @override
  String get skipped => 'រំលង';
  @override
  String get start => 'ចាប់ផ្តើម';
  @override
  String get stop => 'បញ្ឈប់';
  @override
  String get save => 'រក្សាទុក';
  @override
  String get unchanged => 'មិនបានផ្លាស់ប្តូរ';
  @override
  String get unknown => 'មិនស្គាល់';
  @override
  String get noItemInClipboard => 'មិនមានធាតុនៅក្នុងឃ្លីបប៊ត។';
}

// Path: receiveTab
class _Translations$receiveTab$km extends Translations$receiveTab$en {
  _Translations$receiveTab$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការទទួល';
  @override
  late final _Translations$receiveTab$infoBox$km infoBox = _Translations$receiveTab$infoBox$km._(_root);
  @override
  late final _Translations$receiveTab$quickSave$km quickSave = _Translations$receiveTab$quickSave$km._(_root);
}

// Path: sendTab
class _Translations$sendTab$km extends Translations$sendTab$en {
  _Translations$sendTab$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការផ្ញើ';
  @override
  late final _Translations$sendTab$selection$km selection = _Translations$sendTab$selection$km._(_root);
  @override
  late final _Translations$sendTab$picker$km picker = _Translations$sendTab$picker$km._(_root);
  @override
  String get shareIntentInfo => 'អ្នកក៏អាចប្រើប្រាស់មុខងារ "ចែករំលេក" ក្នុងទូរសព្ទចល័តរបស់អ្នក ដើម្បីរើសឯកសារឱ្យកាន់តែងាយស្រួល។';
  @override
  String get nearbyDevices => 'ឧបករណ៍ដែលនៅជិតនេះ';
  @override
  String get thisDevice => 'ឧបករណ៍នេះ';
  @override
  String get scan => 'កំពុងរកមើលឧបករណ៍';
  @override
  String get manualSending => 'ផ្ញើដោយខ្លួនឯង';
  @override
  String get sendMode => 'ប្រភេទនៃការផ្ញើ';
  @override
  late final _Translations$sendTab$sendModes$km sendModes = _Translations$sendTab$sendModes$km._(_root);
  @override
  String get sendModeHelp => 'ការពន្យល់';
  @override
  String get help => 'សូមប្រាកដថាទីតាំងដែលអ្នកចង់ផ្ញើគឺត្រូវតែភ្ជាប់បណ្តាញ Wi-Fi តែមួយដូចគ្នា។';
  @override
  String get placeItems => 'ដាក់ធាតុដែលត្រូវចែករំលែក។';
}

// Path: settingsTab
class _Translations$settingsTab$km extends Translations$settingsTab$en {
  _Translations$settingsTab$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការកំណត់';
  @override
  late final _Translations$settingsTab$general$km general = _Translations$settingsTab$general$km._(_root);
  @override
  late final _Translations$settingsTab$receive$km receive = _Translations$settingsTab$receive$km._(_root);
  @override
  late final _Translations$settingsTab$send$km send = _Translations$settingsTab$send$km._(_root);
  @override
  late final _Translations$settingsTab$network$km network = _Translations$settingsTab$network$km._(_root);
  @override
  late final _Translations$settingsTab$other$km other = _Translations$settingsTab$other$km._(_root);
  @override
  String get advancedSettings => 'ការកំណត់កម្រិតខ្ពស់';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$km extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ដោះស្រាយបញ្ហា';
  @override
  String get subTitle => 'កម្មវិធីនេះមិនដំណើរការដូចការរំពឹងទុកមែនទេ? សូមមើលដំណោះស្រាយមួយចំនួននេះ។';
  @override
  String get solution => 'ដំណោះស្រាយ:';
  @override
  String get fixButton => 'ជួសជុលដោយស្វ័យប្រវត្តិ';
  @override
  late final _Translations$troubleshootPage$firewall$km firewall = _Translations$troubleshootPage$firewall$km._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$km noDiscovery = _Translations$troubleshootPage$noDiscovery$km._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$km noConnection = _Translations$troubleshootPage$noConnection$km._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$km extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ប្រវត្តិ';
  @override
  String get openFolder => 'បើកថតឯកសារ';
  @override
  String get deleteHistory => 'លុបប្រវត្តិ';
  @override
  String get empty => 'មិនមានប្រវត្តិទេ';
  @override
  late final _Translations$receiveHistoryPage$entryActions$km entryActions = _Translations$receiveHistoryPage$entryActions$km._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$km extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'កម្មវិធី (APK)';
  @override
  String get excludeSystemApps => 'ដកចេញកម្មវិធីរបស់ប្រព័ន្ធ';
  @override
  String get excludeAppsWithoutLaunchIntent => 'ដកចេញកម្មវិធីដែលមិនអាចបើកបាន';
  @override
  String apps({required Object n}) => '${n} កម្មវិធី';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$km extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'លុបទាំងអស់';
}

// Path: receivePage
class _Translations$receivePage$km extends Translations$receivePage$en {
  _Translations$receivePage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('km'))(
    n,
    one: 'ចង់ផ្ញើឯកសារមួយឲ្យមកអ្នក។',
    other: 'ចង់ផ្ញើឯកសារ ${n} ឲ្យមកអ្នក។',
  );
  @override
  String get subTitleMessage => 'បានផ្ញើសារមួយមកអ្នក:';
  @override
  String get subTitleLink => 'បានផ្ញើតំណភ្ជាប់មួយមកអ្នក:';
  @override
  String get canceled => 'អ្នកផ្ញើបានបោះបង់សំណើរហើយ។';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$km extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ជម្រើស';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(ថតឯកសារ LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'បានបិទដោយស្វ័យប្រវត្តិ ដោយសារមានថតស្រាប់ហើយ។';
}

// Path: sendPage
class _Translations$sendPage$km extends Translations$sendPage$en {
  _Translations$sendPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'កំពុងរង់ចាំការឆ្លើយតប...';
  @override
  String get rejected => 'អ្នកទទួលបានបដិសេធសំណើនេះ។';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'អ្នកទទួលកំពុងជាប់រវល់ជាមួយសំណើផ្សេងទៀត។';
}

// Path: progressPage
class _Translations$progressPage$km extends Translations$progressPage$en {
  _Translations$progressPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'កំពុងផ្ញើឯកសារ';
  @override
  String get titleReceiving => 'កំពុងទទួលឯកសារ';
  @override
  String get savedToGallery => 'បានរក្សាទុកក្នុងកម្មវិធីរូបថត';
  @override
  late final _Translations$progressPage$total$km total = _Translations$progressPage$total$km._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$km extends Translations$webSharePage$en {
  _Translations$webSharePage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ចែករំលែកតាមតំណភ្ជាប់';
  @override
  String get loading => 'កំពុងចាប់ផ្តើម server...';
  @override
  String get stopping => 'កំពុងបញ្ឈប់ server...';
  @override
  String get error => 'មានកំហុសមួយបានកើតឡើងអំឡុងពេលចាប់ផ្តើម server ។';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('km'))(
    n,
    one: 'បើកតំណនេះនៅក្នុងកម្មវិធី browser:',
    other: 'បើកតំណមួយក្នុងចំណោមតំណភ្ជាប់ទាំងនេះក្នុងកម្មវិធី browser:',
  );
  @override
  String get requests => 'ការស្នើសុំ';
  @override
  String get noRequests => 'មិនទាន់មានសំណើនៅឡើយ។';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'ទទួលយកការស្នើរដោយស្វ័យប្រវត្តិ';
  @override
  String get requirePin => 'ត្រូវការលេខកូដ';
  @override
  String pinHint({required Object pin}) => 'លេខកូដគឺ "${pin}"';
  @override
  String get encryptionHint => 'LocalSend ប្រើវិញ្ញាបនបត្រដែលចុះហត្ថលេខាដោយខ្លួនឯង។ អ្នកត្រូវទទួលយកវានៅក្នុងកម្មវិធី​ browser ។';
  @override
  String pendingRequests({required Object n}) => 'សំណើដែលកំពុងរង់ចាំ: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$km extends Translations$aboutPage$en {
  _Translations$aboutPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'អំពី LocalSend';
  @override
  List<String> get description => [
    'LocalSend គឺជាកម្មវិធីដែលប្រើដោយឥតគិតថ្លៃ និងបើកចំហនូវប្រភពកូដ ដែលអនុញ្ញាតឱ្យអ្នកអាចចែករំលែកឯកសារ និងសារដោយសុវត្ថិភាពជាមួយនឹងឧបករណ៍ដែលនៅជិតៗដែលនៅលើបណ្តាញមូលដ្ឋានរួមគ្នាដោយមិនចាំបាច់ភ្ជាប់អ៊ីនធឺណិត។',
    'កម្មវិធីនេះគឺអាចដំណើរការនៅលើគ្រប់ប្រព័ន្ធប្រតិបត្តិការទាំងអស់រួមមានដូចជា Android, iOS, macOS, Windows និង Linux ។ អ្នកអាចស្វែងរក និងទាញយកបានច្រើនវិធីសាស្ត្រតាមរយៈគេហទំព័រផ្លូវការរបស់ LocalSend ។',
  ];
  @override
  String get author => 'ម្ចាស់កម្មសិទ្ធ';
  @override
  String get contributors => 'អ្នកចូលរួមចំណែក';
  @override
  String get packagers => 'អ្នកបង្កើតកញ្ចប់កម្មវិធី Package';
  @override
  String get translators => 'អ្នកបកប្រែ';
}

// Path: donationPage
class _Translations$donationPage$km extends Translations$donationPage$en {
  _Translations$donationPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការឧបត្ថម្ភ';
  @override
  String get info =>
      'LocalSend ជាកម្មវិធីដែលឥតគិតថ្លៃ, បើកបង្ហាញប្រភពកូដជាសាធារណៈ និងមិនមានការបង្ហាញនូវផ្ទាំងពាណិជ្ជកម្មរំខានឡើយ។ ប្រសិនបើអ្នកពេញចិត្តកម្មវិធីនេះ​ និងចង់ជួយពួកយើង, អ្នកអាចចូលរួមលើកស្ទួយការអភិវឌ្ឍន៍កម្មវិធីនេះជាមួយពួកយើងតាមរយៈការឧបត្ថម្ភជាថវិកា។';
  @override
  String donate({required Object amount}) => 'ឧបត្ថម្ភចំនួន ${amount}';
  @override
  String get thanks => 'អរគុណអ្នកខ្លាំងណាស់សម្រាប់ការឧបត្ថម្ភមកកាន់ពួកយើង!';
  @override
  String get restore => 'ស្តារការទូទាត់ត្រឡប់មកវិញ';
}

// Path: changelogPage
class _Translations$changelogPage$km extends Translations$changelogPage$en {
  _Translations$changelogPage$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'កំណត់ត្រាការផ្លាស់ប្តូរ';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$km extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
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
  @override
  List<String> get fruits => [
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
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$km extends Translations$dialogs$en {
  _Translations$dialogs$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$km addFile = _Translations$dialogs$addFile$km._(_root);
  @override
  late final _Translations$dialogs$openFile$km openFile = _Translations$dialogs$openFile$km._(_root);
  @override
  late final _Translations$dialogs$addressInput$km addressInput = _Translations$dialogs$addressInput$km._(_root);
  @override
  late final _Translations$dialogs$cancelSession$km cancelSession = _Translations$dialogs$cancelSession$km._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$km cannotOpenFile = _Translations$dialogs$cannotOpenFile$km._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$km encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$km._(_root);
  @override
  late final _Translations$dialogs$errorDialog$km errorDialog = _Translations$dialogs$errorDialog$km._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$km favoriteDialog = _Translations$dialogs$favoriteDialog$km._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$km favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$km._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$km favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$km._(_root);
  @override
  late final _Translations$dialogs$fileInfo$km fileInfo = _Translations$dialogs$fileInfo$km._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$km fileNameInput = _Translations$dialogs$fileNameInput$km._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$km historyClearDialog = _Translations$dialogs$historyClearDialog$km._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$km localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$km._(_root);
  @override
  late final _Translations$dialogs$messageInput$km messageInput = _Translations$dialogs$messageInput$km._(_root);
  @override
  late final _Translations$dialogs$noFiles$km noFiles = _Translations$dialogs$noFiles$km._(_root);
  @override
  late final _Translations$dialogs$noPermission$km noPermission = _Translations$dialogs$noPermission$km._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$km notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$km._(_root);
  @override
  late final _Translations$dialogs$qr$km qr = _Translations$dialogs$qr$km._(_root);
  @override
  late final _Translations$dialogs$quickActions$km quickActions = _Translations$dialogs$quickActions$km._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$km quickSaveNotice = _Translations$dialogs$quickSaveNotice$km._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$km quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$km._(_root);
  @override
  late final _Translations$dialogs$pin$km pin = _Translations$dialogs$pin$km._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$km sendModeHelp = _Translations$dialogs$sendModeHelp$km._(_root);
  @override
  late final _Translations$dialogs$zoom$km zoom = _Translations$dialogs$zoom$km._(_root);
}

// Path: sanitization
class _Translations$sanitization$km extends Translations$sanitization$en {
  _Translations$sanitization$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ឈ្មោះឯកសារមិនអាចទទេបានទេ';
  @override
  String get invalid => 'ឈ្មោះឯកសារមានផ្ទុកនូវតួអក្សរដែលមិនត្រឹមត្រូវ';
}

// Path: tray
class _Translations$tray$km extends Translations$tray$en {
  _Translations$tray$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'ចាកចេញពីកម្មវិធី LocalSend';
  @override
  String get closeWindows => 'ចាកចេញ';
}

// Path: web
class _Translations$web$km extends Translations$web$en {
  _Translations$web$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'សូមបញ្ចូលលេខកូដ';
  @override
  String get invalidPin => 'លេខកូដមិនត្រឹមត្រូវ';
  @override
  String get tooManyAttempts => 'ចំនួននៃការប៉ុនប៉ងបញ្ចូលច្រើនដងពេកហើយ';
  @override
  String get rejected => 'បានបដិសេធ';
  @override
  String get files => 'ឯកសារ';
  @override
  String get fileName => 'ឈ្មោះឯកសារ';
  @override
  String get size => 'ទំហំ';
}

// Path: assetPicker
class _Translations$assetPicker$km extends Translations$assetPicker$en {
  _Translations$assetPicker$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'បញ្ជាក់';
  @override
  String get cancel => 'បោះបង់';
  @override
  String get edit => 'កែសម្រួល';
  @override
  String get gifIndicator => 'រូបចលនា GIF';
  @override
  String get loadFailed => 'ការផ្ទុកបរាជ័យ';
  @override
  String get original => 'ប្រភពដើម';
  @override
  String get preview => 'មើលលទ្ធផលទុកមុន';
  @override
  String get select => 'ជ្រើសរើស';
  @override
  String get emptyList => 'បញ្ជីទទេ';
  @override
  String get unSupportedAssetType => 'ប្រភេទឯកសារដែលមិនគាំទ្រ។';
  @override
  String get unableToAccessAll => 'មិនអាចចូលប្រើឯកសារទាំងអស់នៅលើឧបករណ៍បានទេ';
  @override
  String get viewingLimitedAssetsTip => 'បានតែមើលឯកសារ និងអាល់ប៊ុមប៉ុណ្ណោះដែលអាចចូលដំណើរការបានក្នុងកម្មវិធី។';
  @override
  String get changeAccessibleLimitedAssets => 'ចុចដើម្បីធ្វើបច្ចុប្បន្នភាពឯកសារដែលអាចចូលប្រើបាន។';
  @override
  String get accessAllTip =>
      'កម្មវិធីអាចចូលប្រើបានតែឯកសារមួយចំនួននៅលើឧបករណ៍ប៉ុណ្ណោះ។ ចូលទៅកាន់ការកំណត់ប្រព័ន្ធ ហើយអនុញ្ញាតឱ្យកម្មវិធីចូលប្រើមាតិកាទាំងអស់នៅលើឧបករណ៍។';
  @override
  String get goToSystemSettings => 'ចូលទៅកាន់ការកំណត់របស់ប្រព័ន្ធ';
  @override
  String get accessLimitedAssets => 'បន្តជាមួយនឹងការចូលប្រើមានកំណត់';
  @override
  String get accessiblePathName => 'ឯកសារដែលអាចចូលប្រើបាន';
  @override
  String get sTypeAudioLabel => 'សម្លេង';
  @override
  String get sTypeImageLabel => 'រូបភាព';
  @override
  String get sTypeVideoLabel => 'វីដេអូ';
  @override
  String get sTypeOtherLabel => 'មាតិកាផ្សេងទៀត';
  @override
  String get sActionPlayHint => 'ចាក់';
  @override
  String get sActionPreviewHint => 'មើលលទ្ធផលទុកមុន';
  @override
  String get sActionSelectHint => 'ជ្រើសរើស';
  @override
  String get sActionSwitchPathLabel => 'ប្តូរទីតាំង';
  @override
  String get sActionUseCameraHint => 'ប្រើកាមេរ៉ា';
  @override
  String get sNameDurationLabel => 'ថេរវេលា';
  @override
  String get sUnitAssetCountLabel => 'ចំនួន';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$km extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'អាយភី៖';
  @override
  String get port => 'ច្រក៖';
  @override
  String get alias => 'ឈ្មោះឧបករណ៍៖';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$km extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'ឧបករណ៍សំណព្វ';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$km extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការជ្រើសរើស';
  @override
  String files({required Object files}) => 'ឯកសារ៖ ${files}';
  @override
  String size({required Object size}) => 'ទំហំ៖ ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$km extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ឯកសារ';
  @override
  String get folder => 'ថតឯកសារ';
  @override
  String get media => 'មាតិកា';
  @override
  String get text => 'សំណេរ';
  @override
  String get app => 'កម្មវិធី';
  @override
  String get clipboard => 'បិទភ្ជាប់';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$km extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'អ្នកទទួលតែម្នាក់';
  @override
  String get multiple => 'អ្នកទទួលច្រើននាក់';
  @override
  String get link => 'ចែករំលែកតាមតំណភ្ជាប់';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$km extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ទិដ្ឋភាពទូទៅ';
  @override
  String get brightness => 'ស្បែកកម្មវិធី';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$km brightnessOptions = _Translations$settingsTab$general$brightnessOptions$km._(
    _root,
  );
  @override
  String get color => 'ពណ៌';
  @override
  late final _Translations$settingsTab$general$colorOptions$km colorOptions = _Translations$settingsTab$general$colorOptions$km._(_root);
  @override
  String get language => 'ភាសា';
  @override
  late final _Translations$settingsTab$general$languageOptions$km languageOptions = _Translations$settingsTab$general$languageOptions$km._(_root);
  @override
  String get saveWindowPlacement => 'រក្សាទុកផ្ទាំងវីនដូ ក្រោយពេលចាកចេញ';
  @override
  String get saveWindowPlacementWindows => 'រក្សាទុកទីតាំងផ្ទាំងអេក្រង់នៅដដែលបន្ទាប់ពីចាកចេញ';
  @override
  String get minimizeToTray => 'ចាកចេញ: បង្រួមអប្បបរមាទៅរបារម៉ឺនុយ';
  @override
  String get launchAtStartup => 'ចាប់ផ្តើមដោយស្វ័យប្រវត្តិបន្ទាប់ពីចូលគណនី';
  @override
  String get launchMinimized => 'ចាប់ផ្តើមដោយស្វ័យប្រវត្តិ: ការចាប់ផ្តើមត្រូវបានលាក់';
  @override
  String get showInContextMenu => 'បង្ហាញ LocalSend in នៅលើរបារម៉ឺនុយ';
  @override
  String get animations => 'ចលនារស់រវើក';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$km extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ការទទួល';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'បញ្ចប់ដោយស្វ័យប្រវត្តិ';
  @override
  String get destination => 'រក្សាទុកនៅឯថត';
  @override
  String get downloads => '(ទាញយក)';
  @override
  String get saveToGallery => 'រក្សាទុកទៅកាន់កម្មវិធីវិចិត្រសាល';
  @override
  String get saveToHistory => 'រក្សាទុកទៅកាន់ប្រវត្តិ';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$km extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ផ្ញើ';
  @override
  String get shareViaLinkAutoAccept => 'ទទួលការស្នើដោយស្វ័យប្រវត្តិនៅក្នុងម៉ូដ"ចែករំលែកតាមរយៈតំណភ្ជាប់"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$km extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បណ្តាញ';
  @override
  String get needRestart => 'ចាប់ផ្តើម server ឡើងវិញដើម្បីអនុវត្តការកំណត់នេះ!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'ឈ្មោះផ្សេងទៀត';
  @override
  String get deviceType => 'ប្រភេទឧបករណ៍';
  @override
  String get deviceModel => 'ម៉ូឌែលរបស់ឧបករណ៍';
  @override
  String get port => 'ច្រក';
  @override
  String get discoveryTimeout => 'ថេរវេលាក្នុងការស្វែងរក';
  @override
  String get useSystemName => 'ប្រើប្រាស់ឈ្មោះរបស់ប្រព័ន្ធ';
  @override
  String get generateRandomAlias => 'បង្កើតឈ្មោះដទៃដោយដៃចៃដន្យ';
  @override
  String portWarning({required Object defaultPort}) =>
      'អ្នកប្រហែលជាមិនត្រូវបានរកឃើញដោយឧបករណ៍ផ្សេងទៀតទេ ដោយសារតែអ្នកកំពុងប្រើច្រកដែលបង្កើតផ្ទាល់ខ្លួន។ (ច្រកដើម: ${defaultPort})';
  @override
  String get encryption => 'ការការពារទិន្នន័យ';
  @override
  String get multicastGroup => 'អាសយដ្ឋានពហុផ្សាយ';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'អ្នកប្រហែលជាមិនត្រូវបានរកឃើញដោយឧបករណ៍ផ្សេងទៀតទេ ដោយសារតែអ្នកកំពុងប្រើអាសយដ្ឋានពហុផ្សាយដែលបង្កើតផ្ទាល់ខ្លួន។ (ច្រកដើម: ${defaultMulticast})';
  @override
  String get network => 'បណ្តាញ';
  @override
  late final _Translations$settingsTab$network$networkOptions$km networkOptions = _Translations$settingsTab$network$networkOptions$km._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$km extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ផ្សេងៗ';
  @override
  String get support => 'ជួយគាំទ្រ LocalSend';
  @override
  String get donate => 'ការឧបត្ថម្ភ';
  @override
  String get privacyPolicy => 'ច្បាប់ស្តីអំពីឯកជនភាព';
  @override
  String get termsOfUse => 'លក្ខខណ្ឌនៃការប្រើប្រាស់';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$km extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => '​កម្មវិធីនេះអាចផ្ញើឯកសារទៅឧបករណ៍ផ្សេងទៀត ប៉ុន្តែឧបករណ៍ផ្សេងទៀតមិនអាចផ្ញើឯកសារមកឧបករណ៍នេះបានទេ។';
  @override
  String solution({required Object port}) =>
      'នេះទំនងជាបញ្ហារបស់ Firewall ។ អ្នកអាចដោះស្រាយវាបានដោយអនុញ្ញាតឱ្យមានការតភ្ជាប់ចូល (UDP និង TCP) តាមរយៈច្រក ${port}។';
  @override
  String get openFirewall => 'បើក Firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$km extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ឧបករណ៍នេះហាក់ដូចមិនអាចស្វែងរកឧបករណ៍ផ្សេងបានទេ។';
  @override
  String get solution =>
      'សូមប្រាកដថាគ្រប់ឧបករណ៍ទាំងអស់ត្រូវតែស្ថិតក្នុងបណ្តាញ Wi-Fi តែមួយរួមគ្នា និងត្រូវមានការកំណត់រួមមួយដូចគ្នា (ផត, អាសយដ្ឋាន multicast, កូដនីយកម្ម ជាដើម)។ អ្នកអាចធ្វើការសាកល្បងវាយបញ្ចូលអាសយដ្ឋាន IP របស់ឧបករណ៍គោលដៅមួយទៀតដោយខ្លួនឯង។ បើធ្វើបែបនេះទៅដំណើរការ, អ្នកគួរតែបន្ថែម ឬបញ្ចូលឧបករណ៍នោះទៅក្នុងបញ្ជីឧបករណ៍សំណព្វដើម្បីងាយស្រួលក្នុងការស្វែងរក និងធ្វើប្រតិបត្តិការនាពេលក្រោយទៀតដោយស្វ័យប្រវត្តិ និងងាយស្រួល។';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$km extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ឧបករណ៍ទាំងពីរមិនអាចរកឃើញគ្នាទៅវិញទៅមក ហើយក៏មិនអាចចែករំលែកឯកសារបានដែរ។';
  @override
  String get solution =>
      'បញ្ហា​កើត​មាន​ទាំង​សង​ខាង? បន្ទាប់មកអ្នកត្រូវប្រាកដថាឧបករណ៍ទាំងពីរស្ថិតនៅក្នុងបណ្តាញ wifi ដូចគ្នា និងចែករំលែកការកំណត់ដូចគ្នា (ច្រក អាសយដ្ឋានពហុផ្សាយ ការអ៊ិនគ្រីបទិន្នន័យ)។ Wi-Fi ប្រហែលជាមិនអនុញ្ញាតឱ្យទំនាក់ទំនងរវាងអ្នកចូលរួមទេ។ ក្នុងករណីនេះជម្រើសត្រូវតែបើកនៅលើរ៉ោតទ័រ។';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$km extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'បើកឯកសារ';
  @override
  String get showInFolder => 'បង្ហាញនៅក្នុងកម្មវិធីឯកសារ';
  @override
  String get info => 'ព័ត៌មាននៃឯកសារ';
  @override
  String get deleteFromHistory => 'លុបចោលពីប្រវត្តិ';
}

// Path: progressPage.total
class _Translations$progressPage$total$km extends Translations$progressPage$total$en {
  _Translations$progressPage$total$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$km title = _Translations$progressPage$total$title$km._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ឯកសារ: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'ទំហំ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'ល្បឿន: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$km extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បន្ថែមទៅការជ្រើសរើស';
  @override
  String get content => 'តើអ្នកចង់បន្ថែមអ្វី?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$km extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បើកឯកសារ';
  @override
  String get content => 'តើអ្នកចង់បើកឯកសារដែលទទួលបាននេះមែនទេ??';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$km extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បញ្ចូលអាសយដ្ឋាន';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'អាស័យដ្ឋាន IP';
  @override
  String get recentlyUsed => 'បានប្រើថ្មីៗនេះ: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$km extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បោះបង់ការផ្ទេរឯកសារ';
  @override
  String get content => 'តើអ្នកពិតជាចង់បោះបង់ការផ្ទេរឯកសារមែនទេ?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$km extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'មិនអាចបើកឯកសារបានទេ';
  @override
  String content({required Object file}) => 'មិនអាចបើកបានទេ "${file}"។ តើឯកសារនេះត្រូវបានផ្លាស់ទី ប្តូរឈ្មោះ ឬលុបមែនទេ?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$km extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បានបិទការអ៊ិនគ្រីបទិន្នន័យ';
  @override
  String get content =>
      'ឥឡូវនេះការទំនាក់ទំនងកើតឡើងតាមរយៈពិធីការ HTTP ដែលមិនបានអ៊ិនគ្រីបការពារទិន្នន័យ។ ដើម្បីប្រើ HTTPS សូមបើកការអ៊ិនគ្រីបទិន្នន័យម្តងទៀត។';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$km extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$km extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ឧបករណ៍សំណព្វ';
  @override
  String get noFavorites => 'មិនទាន់មានឧបករណ៍សំណព្វនៅឡើយទេ';
  @override
  String get addFavorite => 'បន្ថែម';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$km extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'លុបចេញពីឧបករណ៍សំណព្វ';
  @override
  String content({required Object name}) => 'តើអ្នកប្រាកដដែរឬទេថាចង់ដក "${name}" ចេញពីឧបករណ៍សំណព្វ?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$km extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'បន្ថែមទៅកាន់ឧបករណ៍សំណព្វ';
  @override
  String get titleEdit => 'ការកំណត់';
  @override
  String get name => 'ឈ្មោះឧបករណ៍';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'អាសយដ្ឋាន IP';
  @override
  String get port => 'ច្រក';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$km extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ព័ត៌មាននៃឯកសារ';
  @override
  String get fileName => 'ឈ្មោះ​ឯកសារ:';
  @override
  String get path => 'ទីតាំង:';
  @override
  String get size => 'ទំហំ:';
  @override
  String get sender => 'អ្នកផ្ញើ:';
  @override
  String get time => 'រយៈពេល:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$km extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'បញ្ចូលឈ្មោះឯកសារ';
  @override
  String original({required Object original}) => 'ច្បាប់ដើម: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$km extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'លុបជម្រះប្រវត្តិ';
  @override
  String get content => 'តើអ្នកប្រាកដទេថាចង់លុបនូវរាល់ប្រវត្តិនៃការប្រើប្រាស់ទាំងអស់នេះ?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$km extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend មិន​អាច​រក​ឃើញ​ឧបករណ៍​ផ្សេង​ទៀត​ដោយ​មិន​មាន​ការ​អនុញ្ញាត​ក្នុង​ការ​ស្កែន​បណ្តាញរួមគ្នា​ទេ។ សូមផ្តល់ការអនុញ្ញាតនេះនៅក្នុងការកំណត់។';
  @override
  String get gotoSettings => 'ការកំណត់';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$km extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'សរសេរសារ';
  @override
  String get multiline => 'ពហុជួរ';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$km extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'គ្មានឯកសារត្រូវបានជ្រើសរើសទេ។';
  @override
  String get content => 'សូមជ្រើសរើសយ៉ាងហោចណាស់មួយឯកសារ។';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$km extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'គ្មានការអនុញ្ញាត';
  @override
  String get content => 'អ្នកមិន​ទាន់ត្រូវបានផ្តល់ការអនុញ្ញាតទេ។ សូមផ្តល់ឱ្យពួកគេនៅក្នុងការកំណត់។';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$km extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'មិនដំណើរការ';
  @override
  String get content => 'មុខងារនេះអាចប្រើបានតែនៅលើ:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$km extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'កូដ QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$km extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'សកម្មភាពរហ័ស';
  @override
  String get counter => 'Counter';
  @override
  String get prefix => 'បុព្វបទ';
  @override
  String get padZero => 'Pad with zeros';
  @override
  String get sortBeforeCount => 'តម្រៀបតាមអក្ខរក្រមជាមុន';
  @override
  String get random => 'ចៃដន្យ';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$km extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'សំណើឯកសារត្រូវបានទទួលយកដោយស្វ័យប្រវត្តិ។ ត្រូវ​ចំណាំ​ថា​អ្នក​រាល់​គ្នា​នៅ​ក្នុង​បណ្ដាញ​មូលដ្ឋាន​រួមគ្នាអាច​ផ្ញើ​ឯកសារ​មក​អ្នកបាន។';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$km extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'ឥឡូវនេះសំណើឯកសារត្រូវបានទទួលយកដោយស្វ័យប្រវត្តិពីឧបករណ៍ទាំងឡាយដែលមាននៅក្នុងបញ្ជីឧបករណ៍សំណព្វរបស់អ្នក។',
    'ការព្រមាន៖ ពេលនេះជម្រើស ឬមុខងារមួយនេះមិនទាន់មានសុវត្ថិភាពទាំងស្រុងទេ និងណែនាំឲ្យប្រើប្រាស់នៅឡើយទេ ពីព្រោះជនអនាមិកដែលវាយប្រហារតាមប្រព័ន្ធបច្ចេកវិទ្យា ដែលស្គាល់ស្នាមដាននៃឧបករណ៍សំណព្វរបស់អ្នក អាចនឹងផ្ញើឯកសារផ្សេងៗមកអ្នកបាន។',
    'ទោះ​ជា​យ៉ាង​ណាក៏ដោយ ជម្រើស​នេះ​នៅ​តែ​មាន​សុវត្ថិភាព​ជាង​ការ​អនុញ្ញាត​ឱ្យ​ឧបករណ៍​ទាំងអស់អាចផ្ញើមកអ្នកដោយសេរី​។',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$km extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'វាយបញ្ចូលលេខកូដ';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$km extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'របៀបនៃការផ្ញើ';
  @override
  String get single => 'ផ្ញើឯកសារទៅអ្នកទទួលម្នាក់។ ការជ្រើសរើសនឹងត្រូវបានសម្អាតបន្ទាប់ពីការផ្ទេរឯកសារបានបញ្ចប់។';
  @override
  String get multiple => 'ផ្ញើឯកសារទៅអ្នកទទួលច្រើននាក់។ ការជ្រើសរើសនឹងមិនត្រូវបានសម្អាតទេ។';
  @override
  String get link => 'អ្នកទទួលដែលមិនបានដំឡើង LocalSend អាចទាញយកឯកសារដែលបានជ្រើសរើសដោយបើកតំណនៅក្នុងកម្មវិធី browser របស់ពួកគេ។';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$km extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'តំណភ្ជាប់ URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$km extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'តាមប្រព័ន្ធ';
  @override
  String get dark => 'ងងឹត';
  @override
  String get light => 'ភ្លឺ';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$km extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'តាមប្រព័ន្ធ';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$km extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'តាមប្រព័ន្ធ';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$km extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'ទាំងអស់';
  @override
  String get filtered => 'បានតម្រង';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$km extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$km._(TranslationsKm root) : this._root = root, super.internal(root);

  final TranslationsKm _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'រយៈពេលប្រតិបត្តិការសរុប (${time})';
  @override
  String get finishedError => 'បានបញ្ចប់ជាមួយនឹងបញ្ហា';
  @override
  String get canceledSender => 'ត្រូវបានបោះបង់ដោយអ្នកផ្ញើ';
  @override
  String get canceledReceiver => 'ត្រូវបានបោះបង់ដោយអ្នកទទួល';
}
