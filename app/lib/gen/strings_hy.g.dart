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
class TranslationsHy extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsHy({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.hy,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <hy>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsHy _root = this; // ignore: unused_field

  @override
  TranslationsHy $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHy(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$hy general = _Translations$general$hy._(_root);
  @override
  late final _Translations$receiveTab$hy receiveTab = _Translations$receiveTab$hy._(_root);
  @override
  late final _Translations$sendTab$hy sendTab = _Translations$sendTab$hy._(_root);
  @override
  late final _Translations$settingsTab$hy settingsTab = _Translations$settingsTab$hy._(_root);
  @override
  late final _Translations$troubleshootPage$hy troubleshootPage = _Translations$troubleshootPage$hy._(_root);
  @override
  late final _Translations$networkInterfacesPage$hy networkInterfacesPage = _Translations$networkInterfacesPage$hy._(_root);
  @override
  late final _Translations$receiveHistoryPage$hy receiveHistoryPage = _Translations$receiveHistoryPage$hy._(_root);
  @override
  late final _Translations$apkPickerPage$hy apkPickerPage = _Translations$apkPickerPage$hy._(_root);
  @override
  late final _Translations$selectedFilesPage$hy selectedFilesPage = _Translations$selectedFilesPage$hy._(_root);
  @override
  late final _Translations$deviceDetailsPage$hy deviceDetailsPage = _Translations$deviceDetailsPage$hy._(_root);
  @override
  late final _Translations$verifyPage$hy verifyPage = _Translations$verifyPage$hy._(_root);
  @override
  late final _Translations$receivePage$hy receivePage = _Translations$receivePage$hy._(_root);
  @override
  late final _Translations$receiveOptionsPage$hy receiveOptionsPage = _Translations$receiveOptionsPage$hy._(_root);
  @override
  late final _Translations$sendPage$hy sendPage = _Translations$sendPage$hy._(_root);
  @override
  late final _Translations$progressPage$hy progressPage = _Translations$progressPage$hy._(_root);
  @override
  late final _Translations$webSharePage$hy webSharePage = _Translations$webSharePage$hy._(_root);
  @override
  late final _Translations$webReceivePage$hy webReceivePage = _Translations$webReceivePage$hy._(_root);
  @override
  late final _Translations$aboutPage$hy aboutPage = _Translations$aboutPage$hy._(_root);
  @override
  late final _Translations$donationPage$hy donationPage = _Translations$donationPage$hy._(_root);
  @override
  late final _Translations$changelogPage$hy changelogPage = _Translations$changelogPage$hy._(_root);
  @override
  late final _Translations$whatsNewPage$hy whatsNewPage = _Translations$whatsNewPage$hy._(_root);
  @override
  late final _Translations$aliasGenerator$hy aliasGenerator = _Translations$aliasGenerator$hy._(_root);
  @override
  late final _Translations$dialogs$hy dialogs = _Translations$dialogs$hy._(_root);
  @override
  late final _Translations$sanitization$hy sanitization = _Translations$sanitization$hy._(_root);
  @override
  late final _Translations$tray$hy tray = _Translations$tray$hy._(_root);
  @override
  late final _Translations$web$hy web = _Translations$web$hy._(_root);
  @override
  late final _Translations$assetPicker$hy assetPicker = _Translations$assetPicker$hy._(_root);
}

// Path: general
class _Translations$general$hy extends Translations$general$en {
  _Translations$general$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Ընդունել';
  @override
  String get accepted => 'Ընդունված է';
  @override
  String get add => 'Ավելացնել';
  @override
  String get advanced => 'Լրացուցիչ';
  @override
  String get cancel => 'Չեղարկել';
  @override
  String get close => 'Փակել';
  @override
  String get confirm => 'Հաստատել';
  @override
  String get continueStr => 'Շարունակել';
  @override
  String get copy => 'Պատճենել';
  @override
  String get copiedToClipboard => 'Պատճենվեց';
  @override
  String get decline => 'Մերժել';
  @override
  String get done => 'Պատրաստ';
  @override
  String get delete => 'Ջնջել';
  @override
  String get edit => 'Փոփոխել';
  @override
  String get error => 'Սխալ';
  @override
  String get example => 'Օրինակ';
  @override
  String get files => 'Ֆայլեր';
  @override
  String get finished => 'Ավարտված';
  @override
  String get hide => 'Թաքցնել';
  @override
  String get off => 'Անջ․';
  @override
  String get offline => 'Օֆլայն';
  @override
  String get on => 'Միացված';
  @override
  String get online => 'Առցանց';
  @override
  String get open => 'Բացել';
  @override
  String get queue => 'Հերթ';
  @override
  String get quickSave => 'Արագ պահպանում';
  @override
  String get quickSaveFromFavorites => 'Արագ պահպանում «Սիրվածներ»-ում';
  @override
  String get renamed => 'Վերանվանվեց';
  @override
  String get reset => 'Չեղարկել փոփոխությունները';
  @override
  String get restart => 'Վերաբացել';
  @override
  String get settings => 'Կարգավորումներ';
  @override
  String get skipped => 'Բաց թողնված';
  @override
  String get start => 'Սկսել';
  @override
  String get stop => 'Կանգնեցնել';
  @override
  String get save => 'Պահել';
  @override
  String get unchanged => 'Անփոփոխ';
  @override
  String get unknown => 'Անհայտ';
  @override
  String get noItemInClipboard => 'Փոխանակման բուֆերում բան չկա';
}

// Path: receiveTab
class _Translations$receiveTab$hy extends Translations$receiveTab$en {
  _Translations$receiveTab$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ստանալ';
  @override
  late final _Translations$receiveTab$infoBox$hy infoBox = _Translations$receiveTab$infoBox$hy._(_root);
  @override
  late final _Translations$receiveTab$quickSave$hy quickSave = _Translations$receiveTab$quickSave$hy._(_root);
  @override
  String get link => 'Ստանալ հղումով';
}

// Path: sendTab
class _Translations$sendTab$hy extends Translations$sendTab$en {
  _Translations$sendTab$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկել';
  @override
  late final _Translations$sendTab$selection$hy selection = _Translations$sendTab$selection$hy._(_root);
  @override
  late final _Translations$sendTab$picker$hy picker = _Translations$sendTab$picker$hy._(_root);
  @override
  String get shareIntentInfo => 'Կարող եք նաև օգտագործել ձեր հեռախոսի «Կիսվել» ֆունկցիան՝ ֆայլերն ավելի հեշտությամբ ընտրելու համար։';
  @override
  String get nearbyDevices => 'Սարքեր մոտակայքում';
  @override
  String get thisDevice => 'Այս սարքը';
  @override
  String get scan => 'Որոնել սարքեր';
  @override
  String get manualSending => 'Ձեռքով ուղարկում';
  @override
  String get sendMode => 'Ուղարկման ռեժիմ';
  @override
  late final _Translations$sendTab$sendModes$hy sendModes = _Translations$sendTab$sendModes$hy._(_root);
  @override
  String get sendModeHelp => 'Բացատրություն';
  @override
  String get help => 'Համոզվեք, որ ստացողը և Դուք միացած եք նույն Wi-Fi-ին։';
  @override
  String get placeItems => 'Ընտրեք իրերը կիսվելու համար։';
}

// Path: settingsTab
class _Translations$settingsTab$hy extends Translations$settingsTab$en {
  _Translations$settingsTab$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Կարգավորումներ';
  @override
  late final _Translations$settingsTab$general$hy general = _Translations$settingsTab$general$hy._(_root);
  @override
  late final _Translations$settingsTab$receive$hy receive = _Translations$settingsTab$receive$hy._(_root);
  @override
  late final _Translations$settingsTab$send$hy send = _Translations$settingsTab$send$hy._(_root);
  @override
  late final _Translations$settingsTab$network$hy network = _Translations$settingsTab$network$hy._(_root);
  @override
  late final _Translations$settingsTab$other$hy other = _Translations$settingsTab$other$hy._(_root);
  @override
  String get advancedSettings => 'Ընդլայնված կարգավորումներ';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$hy extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Խնդիրների լուծում';
  @override
  String get subTitle => 'Ծրագիրը չի՞ աշխատում սպասվածի պես: Այստեղ կարող եք գտնել խնդիրների որոշ տարածված լուծումներ:';
  @override
  String get solution => 'Լուծում.';
  @override
  String get fixButton => 'Ավտոմատ ուղղել';
  @override
  late final _Translations$troubleshootPage$firewall$hy firewall = _Translations$troubleshootPage$firewall$hy._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$hy noDiscovery = _Translations$troubleshootPage$noDiscovery$hy._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$hy noConnection = _Translations$troubleshootPage$noConnection$hy._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$hy extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ցանցային ինտերֆեյսներ';
  @override
  String get info =>
      'Լռելյայն, LocalSend-ը օգտագործում է բոլոր հասանելի ցանցային ինտերֆեյսները: Այստեղ կարող եք բացառել անցանկալի ցանցերը: Փոփոխությունները կիրառելու համար պետք է թարմացնել սերվերը:';
  @override
  String get preview => 'Նախադիտում';
  @override
  String get whitelist => 'Սպիտակ ցուցակ';
  @override
  String get blacklist => 'Սև ցուցակ';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$hy extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Պատմություն';
  @override
  String get openFolder => 'Բացել պանակը';
  @override
  String get deleteHistory => 'Ջնջել պատմությունը';
  @override
  String get empty => 'Պատմությունը դատարկ է։';
  @override
  late final _Translations$receiveHistoryPage$entryActions$hy entryActions = _Translations$receiveHistoryPage$entryActions$hy._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$hy extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ծրագրեր (APK)';
  @override
  String get excludeSystemApps => 'Բացառել համակարգի ծրագրերը';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Բացառել չբացվող ծրագրերը';
  @override
  String apps({required Object n}) => '${n} ծրագիր';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$hy extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Ջնջել բոլորը';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$hy extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Սարքի մանրամասները';
  @override
  String get favorite => 'Սիրված';
  @override
  String get verify => 'Հաստատել';
  @override
  late final _Translations$deviceDetailsPage$info$hy info = _Translations$deviceDetailsPage$info$hy._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$hy logs = _Translations$deviceDetailsPage$logs$hy._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$hy extends Translations$verifyPage$en {
  _Translations$verifyPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Հաստատել';
  @override
  String get icons => 'Նշաններ';
  @override
  String get text => 'Տեքստ';
  @override
  String get question => 'Նո՞ւյն տեսքն ունի մյուս սարքի վրա։';
}

// Path: receivePage
class _Translations$receivePage$hy extends Translations$receivePage$en {
  _Translations$receivePage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
    n,
    one: 'ուզում է ձեզ ֆայլ ուղարկել',
    other: 'ուզում է ձեզ ${n} ֆայլ ուղարկել',
  );
  @override
  String get subTitleMessage => 'ձեզ նամակ ուղարկեց՝';
  @override
  String get subTitleLink => 'ուղարկել է ձեզ հղում՝';
  @override
  String get canceled => 'Ուղարկողը չեղարկել է հարցումը։';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$hy extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Տարբերակներ';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend պանակ)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Ավտոմատ անջատված է, քանի որ կան պանակներ։';
}

// Path: sendPage
class _Translations$sendPage$hy extends Translations$sendPage$en {
  _Translations$sendPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Գումարային թվի հաշվվում (${curr}/${n})';
  @override
  String get waiting => 'Սպասում ենք պատասխանի․․․';
  @override
  String get rejected => 'Ստացողը մերժել է հարցումը։';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Ստացողը զբաղված է մեկ այլ հարցումով։';
}

// Path: progressPage
class _Translations$progressPage$hy extends Translations$progressPage$en {
  _Translations$progressPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Ֆայլերի ուղարկում';
  @override
  String get titleReceiving => 'Ֆայլերի ստացում';
  @override
  String get savedToGallery => 'Պահված է սարքում';
  @override
  late final _Translations$progressPage$total$hy total = _Translations$progressPage$total$hy._(_root);
  @override
  late final _Translations$progressPage$remainingTime$hy remainingTime = _Translations$progressPage$remainingTime$hy._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$hy extends Translations$webSharePage$en {
  _Translations$webSharePage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Կիսվել հղման միջոցով';
  @override
  String get loading => 'Սերվերի սկսում․․․';
  @override
  String get stopping => 'Սերվերը կանգնեցվում է…';
  @override
  String get error => 'Սերվերը սկսելիս սխալ տեղի ունեցավ։';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
    n,
    one: 'Բացել այս հղումը բրաուզերում',
    other: 'Բացել այս հղումները բրաուզերում',
  );
  @override
  String get requests => 'Հարցումներ';
  @override
  String get noRequests => 'Դեռևս հարցումներ չկան։';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Ավտոմատ ընդունել հարցումները';
  @override
  String get requirePin => 'Պահանջել PIN կոդ';
  @override
  String pinHint({required Object pin}) => 'PIN կոդը՝ «${pin}»';
  @override
  String get encryptionHint => 'LocalSend-ը օգտագործում է ինքնաստորագրված վկայական։ Դուք պետք է ընդունեք այն ձեր բրաուզերում։';
  @override
  String pendingRequests({required Object n}) => 'Սպասող հարցումներ՝ ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$hy extends Translations$webReceivePage$en {
  _Translations$webReceivePage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ստանալ հղումով';
}

// Path: aboutPage
class _Translations$aboutPage$hy extends Translations$aboutPage$en {
  _Translations$aboutPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend-ի մասին';
  @override
  List<String> get description => [
    'LocalSend-ը անվճար, բաց կոդով ծրագիր է, որը թույլ է տալիս անվտանգ կերպով կիսվել ֆայլերով և նամակներով մոտակա սարքերի հետ ձեր տեղական ցանցի միջոցով՝ առանց ինտերնետ կապի անհրաժեշտության:',
    'Ծրագիրը հասանելի է Android, iOS, macOS, Windows և Linux օպերացիոն համակարգերում: Դուք կարող եք գտնել բոլոր ներբեռնման տարբերակները պաշտոնական գլխավոր էջում:',
  ];
  @override
  String get author => 'Հեղինակ';
  @override
  String get contributors => 'Աջակցողներ';
  @override
  String get packagers => 'Փաթեթավորողներ';
  @override
  String get translators => 'Թարգմանիչներ';
}

// Path: donationPage
class _Translations$donationPage$hy extends Translations$donationPage$en {
  _Translations$donationPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Նվիրաբերել';
  @override
  String get info =>
      'LocalSend-ը անվճար է, բաց կոդով և առանց որևէ գովազդի: Եթե ​​ձեզ դուր է գալիս ծրագիրը, կարող եք աջակցել զարգացմանը նվիրաբերելով:';
  @override
  String donate({required Object amount}) => 'Նվիրաբերել ${amount}';
  @override
  String get thanks => 'Շա՜տ շնորհակալ ենք';
  @override
  String get restore => 'Վերականգնել գնումը';
}

// Path: changelogPage
class _Translations$changelogPage$hy extends Translations$changelogPage$en {
  _Translations$changelogPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Փոփոխությունների պատմություն';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$hy extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => 'Ի՞նչ նոր բաներ կան ${version}-ում';
  @override
  late final _Translations$whatsNewPage$changes$hy changes = _Translations$whatsNewPage$changes$hy._(_root);
}

// Path: aliasGenerator
class _Translations$aliasGenerator$hy extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Adorable',
    'Beautiful',
    'Big',
    'Bright',
    'Clean',
    'Clever',
    'Cool',
    'Cute',
    'Cunning',
    'Determined',
    'Energetic',
    'Efficient',
    'Fantastic',
    'Fast',
    'Fine',
    'Fresh',
    'Good',
    'Gorgeous',
    'Great',
    'Handsome',
    'Hot',
    'Kind',
    'Lovely',
    'Mystic',
    'Neat',
    'Nice',
    'Patient',
    'Pretty',
    'Powerful',
    'Rich',
    'Secret',
    'Smart',
    'Solid',
    'Special',
    'Strategic',
    'Strong',
    'Tidy',
    'Wise',
  ];
  @override
  List<String> get fruits => [
    'Apple',
    'Avocado',
    'Banana',
    'Blackberry',
    'Blueberry',
    'Broccoli',
    'Carrot',
    'Cherry',
    'Coconut',
    'Grape',
    'Lemon',
    'Lettuce',
    'Mango',
    'Melon',
    'Mushroom',
    'Onion',
    'Orange',
    'Papaya',
    'Peach',
    'Pear',
    'Pineapple',
    'Potato',
    'Pumpkin',
    'Raspberry',
    'Strawberry',
    'Tomato',
  ];
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$hy extends Translations$dialogs$en {
  _Translations$dialogs$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$hy addFile = _Translations$dialogs$addFile$hy._(_root);
  @override
  late final _Translations$dialogs$openFile$hy openFile = _Translations$dialogs$openFile$hy._(_root);
  @override
  late final _Translations$dialogs$addressInput$hy addressInput = _Translations$dialogs$addressInput$hy._(_root);
  @override
  late final _Translations$dialogs$cancelSession$hy cancelSession = _Translations$dialogs$cancelSession$hy._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$hy cannotOpenFile = _Translations$dialogs$cannotOpenFile$hy._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$hy encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$hy._(_root);
  @override
  late final _Translations$dialogs$errorDialog$hy errorDialog = _Translations$dialogs$errorDialog$hy._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$hy favoriteDialog = _Translations$dialogs$favoriteDialog$hy._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$hy favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$hy._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$hy favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$hy._(_root);
  @override
  late final _Translations$dialogs$fileInfo$hy fileInfo = _Translations$dialogs$fileInfo$hy._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$hy fileNameInput = _Translations$dialogs$fileNameInput$hy._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$hy historyClearDialog = _Translations$dialogs$historyClearDialog$hy._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$hy localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$hy._(_root);
  @override
  late final _Translations$dialogs$messageInput$hy messageInput = _Translations$dialogs$messageInput$hy._(_root);
  @override
  late final _Translations$dialogs$noFiles$hy noFiles = _Translations$dialogs$noFiles$hy._(_root);
  @override
  late final _Translations$dialogs$noPermission$hy noPermission = _Translations$dialogs$noPermission$hy._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$hy notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$hy._(_root);
  @override
  late final _Translations$dialogs$qr$hy qr = _Translations$dialogs$qr$hy._(_root);
  @override
  late final _Translations$dialogs$quickActions$hy quickActions = _Translations$dialogs$quickActions$hy._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$hy quickSaveNotice = _Translations$dialogs$quickSaveNotice$hy._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$hy quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$hy._(_root);
  @override
  late final _Translations$dialogs$pin$hy pin = _Translations$dialogs$pin$hy._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$hy sendModeHelp = _Translations$dialogs$sendModeHelp$hy._(_root);
  @override
  late final _Translations$dialogs$zoom$hy zoom = _Translations$dialogs$zoom$hy._(_root);
}

// Path: sanitization
class _Translations$sanitization$hy extends Translations$sanitization$en {
  _Translations$sanitization$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ֆայլի անունը չի կարող դատարկ լինել';
  @override
  String get invalid => 'Ֆայլի անունը պարունակում է անվավեր նիշեր';
}

// Path: tray
class _Translations$tray$hy extends Translations$tray$en {
  _Translations$tray$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Դուրս գալ LocalSend-ից';
  @override
  String get closeWindows => 'Դուրս գալ';
}

// Path: web
class _Translations$web$hy extends Translations$web$en {
  _Translations$web$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Գրեք PIN-ը';
  @override
  String get invalidPin => 'Անվավեր PIN կոդ';
  @override
  String get tooManyAttempts => 'Չափից շատ փորձեր';
  @override
  String get rejected => 'Մերժված';
  @override
  String get files => 'Ֆայլեր';
  @override
  String get fileName => 'Ֆայլի անունը';
  @override
  String get size => 'Չափը';
}

// Path: assetPicker
class _Translations$assetPicker$hy extends Translations$assetPicker$en {
  _Translations$assetPicker$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Հաստատել';
  @override
  String get cancel => 'Չեղարկել';
  @override
  String get edit => 'Փոփոխել';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Չհաջողվեց բեռնել';
  @override
  String get original => 'Ծագումը';
  @override
  String get preview => 'Նախադիտում';
  @override
  String get select => 'Ընտրել';
  @override
  String get emptyList => 'Դատարկ ցուցակ';
  @override
  String get unSupportedAssetType => 'Չաջակցվող ֆայլի տեսակ';
  @override
  String get unableToAccessAll => 'Չհաջողվեց մուտք ստանալ սարքի բոլոր ֆայլերին';
  @override
  String get viewingLimitedAssetsTip => 'Ծրագիրը կարող է միայն տեսնել այն ֆայլերն ու ալբոմները, որոնց մուտք ունի։';
  @override
  String get changeAccessibleLimitedAssets => 'Սեղմեք՝ հասանելի ֆայլերը թարմացնելու համար';
  @override
  String get accessAllTip =>
      'Ծրագիրը մուտք ունի սարքի միայն որոշ ֆայլերին: Անցեք համակարգի կարգավորումներ և թույլ տվեք ծրագրին մուտք գործել սարքի վրա գտնվող բոլոր մեդիա ֆայլերին:';
  @override
  String get goToSystemSettings => 'Գնալ համակարգի կարգավորումներ';
  @override
  String get accessLimitedAssets => 'Շարունակել սահմանափակ մուտքով';
  @override
  String get accessiblePathName => 'Հասանելի ֆայլեր';
  @override
  String get sTypeAudioLabel => 'Աուդիո';
  @override
  String get sTypeImageLabel => 'Նկար';
  @override
  String get sTypeVideoLabel => 'Վիդեո';
  @override
  String get sTypeOtherLabel => 'Այլ մեդիա';
  @override
  String get sActionPlayHint => 'նվագարկել';
  @override
  String get sActionPreviewHint => 'նախադիտում';
  @override
  String get sActionSelectHint => 'ընտրել';
  @override
  String get sActionSwitchPathLabel => 'փոխել ուղին';
  @override
  String get sActionUseCameraHint => 'օգտագործել տեսախցիկը';
  @override
  String get sNameDurationLabel => 'տևողություն';
  @override
  String get sUnitAssetCountLabel => 'քանակը';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$hy extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Սարքի անունը՝';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$hy extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Սիրվածներ';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$hy extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընտրություն';
  @override
  String files({required Object files}) => 'Ֆայլեր՝ ${files}';
  @override
  String size({required Object size}) => 'Չափսը՝ ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$hy extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Ֆայլ';
  @override
  String get folder => 'Պանակ';
  @override
  String get media => 'Մեդիա';
  @override
  String get text => 'Տեքստ';
  @override
  String get app => 'Ծրագիր';
  @override
  String get clipboard => 'Տեղադրել';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$hy extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Մեկ ստացող';
  @override
  String get multiple => 'Մի քանի ստացող';
  @override
  String get link => 'Կիսվել հղման միջոցով';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$hy extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընդհանուր';
  @override
  String get brightness => 'Տեսք';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$hy brightnessOptions = _Translations$settingsTab$general$brightnessOptions$hy._(
    _root,
  );
  @override
  String get color => 'Գույն';
  @override
  late final _Translations$settingsTab$general$colorOptions$hy colorOptions = _Translations$settingsTab$general$colorOptions$hy._(_root);
  @override
  String get language => 'Լեզու';
  @override
  late final _Translations$settingsTab$general$languageOptions$hy languageOptions = _Translations$settingsTab$general$languageOptions$hy._(_root);
  @override
  String get saveWindowPlacement => 'Պահել պատուհանի դիրքը դուրս գալուց հետո';
  @override
  String get saveWindowPlacementWindows => 'Պահել պատուհանի դիրքը դուրս գալուց հետո';
  @override
  String get minimizeToTray => 'Փոքրացնել համակարգի տրեյում/տողում փակելու ժամանակ';
  @override
  String get launchAtStartup => 'Ավտոբացում';
  @override
  String get launchMinimized => 'Թաքնված ավտոբացում';
  @override
  String get showInContextMenu => 'Ցուցադրել LocalSend-ը կոնտեքստային մենյուում';
  @override
  String get animations => 'Անիմացիաներ';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$hy extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ստանալ';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Ավտոմատ ավարտ';
  @override
  String get destination => 'Պահել պանակում';
  @override
  String get downloads => '(Ներբեռնումներ)';
  @override
  String get saveToGallery => 'Պահել մեդիան սարքում';
  @override
  String get saveToHistory => 'Պահել պատմությունում';
  @override
  String get verifyChecksums => 'Ստուգել ստուգվող գումարները ֆայլեր ստանալիս';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$hy extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկում';
  @override
  String get shareViaLinkAutoAccept => 'Ավտոմատ ընդունել հարցումները «Կիսվել հղումի միջոցով» ռեժիմում';
  @override
  String get createChecksums => 'Ստեղծել ստուգվող գումարներ ֆայլեր ուղարկելիս';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$hy extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ցանց';
  @override
  String get needRestart => 'Որպեսզի կարգավորումները ընդունվեն, պետք է թարմացնել սերվերը։';
  @override
  String get server => 'Սերվեր';
  @override
  String get alias => 'Սարքի անունը';
  @override
  String get deviceType => 'Սարքի տեսակը';
  @override
  String get deviceModel => 'Սարքի մոդել';
  @override
  String get port => 'Port';
  @override
  String get network => 'Ցանց';
  @override
  late final _Translations$settingsTab$network$networkOptions$hy networkOptions = _Translations$settingsTab$network$networkOptions$hy._(_root);
  @override
  String get discoveryTimeout => 'Որոնման ժամանակի սպառում';
  @override
  String get useSystemName => 'Օգտագործել համակարգի անունը';
  @override
  String get generateRandomAlias => 'Ստեղծել պատահական կեղծանուններ';
  @override
  String portWarning({required Object defaultPort}) =>
      'Հնարավոր է՝ ձեզ չհայտնաբերեն այլ սարքերը, քանի որ օգտագործում եք հատուկ պորտ (լռելյայն՝ ${defaultPort}):';
  @override
  String get encryption => 'Գաղտնագրում';
  @override
  String get multicastGroup => 'Բազմահեռարձակման հասցե';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Հնարավոր է՝ ձեզ չհայտնաբերեն այլ սարքերը, քանի որ օգտագործում եք հատուկ բազմահեռարձակման հասցե: (լռելյայն՝ ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$hy extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Այլ';
  @override
  String get support => 'Աջակցել LocalSend-ին';
  @override
  String get donate => 'Նվիրաբերել';
  @override
  String get privacyPolicy => 'Գաղտնիության քաղաքականություն';
  @override
  String get termsOfUse => 'Օգտագործման պայմաններ';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$hy extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Այս սարքը կարող է ֆայլեր ուղարկել այլ սարքերի, բայց այլ սարքերը չեն կարող ֆայլեր ուղարկել այս սարքին։';
  @override
  String solution({required Object port}) =>
      'Սա, ամենայն հավանականությամբ, firewall-ի խնդիր է։ Դուք կարող եք լուծել այս խնդիրը՝ թույլատրելով մուտքային միացումները (UDP և TCP) ${port} պորտի վրա։';
  @override
  String get openFirewall => 'Բացել Firewall-ը';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$hy extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Այս սարքը չի կարողանում գտնել այլ սարքեր։';
  @override
  String get solution =>
      'Համոզվեք, որ բոլոր սարքերը միացված են նույն Wi-Fi ցանցին և ունեն նույն կարգավորումները (պորտ, բազմահեռարձակման հասցե, գաղտնագրում): Կարող եք փորձել ձեռքով մուտքագրել նպատակային սարքի IP հասցեն: Եթե սա աշխատում է, խորհուրդ ենք տալիս ավելացնել այս սարքը սիրվածների ցանկում, որպեսզի այն ապագայում ավտոմատ կերպով հայտնաբերվի:';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$hy extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Երկու սարքերն էլ չեն կարողանում միմյանց գտնել և ֆայլեր փոխանակել։';
  @override
  String get solution =>
      'Արդյո՞ք խնդիրը գոյություն ունի երկու կողմերում: Եթե այո, ապա պետք է համոզվեք, որ երկու սարքերն էլ միացված են նույն Wi-Fi-ին և ունեն նույն կարգավորումները (պորտ, բազմահեռարձակման հասցե, գաղտնագրում): Wi-Fi-ն կարող է թույլ չտալ մասնակիցների միջև փոխանակում՝ մուտքի կետի (AP) մեկուսացման պատճառով: Այս դեպքում այս տարբերակը պետք է անջատված լինի ռոուտերի վրա:';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$hy extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Բացել ֆայլ';
  @override
  String get showInFolder => 'Ցուցադրել պանակում';
  @override
  String get info => 'Ինֆորմացիա';
  @override
  String get deleteFromHistory => 'Ջնջել պատմությունից';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$hy extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Անուն';
  @override
  String get address => 'Հասցե';
  @override
  String get version => 'Վերսիա';
  @override
  String protocol({required Object version}) => 'v${version} պրոտոկոլ';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$hy extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Լոգեր';
  @override
  String get empty => 'Լոգեր չկան։';
  @override
  String discovered({required Object protocol, required Object host}) => 'Գտնվել է ${protocol} (${host}) միջոցով';
  @override
  String updated({required Object protocol, required Object host}) => 'Թարմացվել է ${protocol} (${host}) միջոցով';
}

// Path: progressPage.total
class _Translations$progressPage$total$hy extends Translations$progressPage$total$en {
  _Translations$progressPage$total$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$hy title = _Translations$progressPage$total$title$hy._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Ֆայլեր՝ ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Չափսը՝ ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Արագություն՝ ${speed}/վրկ';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$hy extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
    m,
    other: '${m}ր',
    one: '${m}ր',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
    h,
    other: '${h}ժ',
    one: '${h}ժ',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$hy extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$hy v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$hy._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$hy extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ավելացնել ընտրությանը';
  @override
  String get content => 'Ի՞նչ եք ուզում ավելացնել։';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$hy extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Բացել ֆայլ';
  @override
  String get content => 'Ցանկանո՞ւմ եք բացել ստացված ֆայլը։';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$hy extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գրեք հասցեն';
  @override
  String get recentlyUsed => 'Վերջերս օգտագործված՝ ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$hy extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Չեղարկել ֆայլերի փոխանցումը';
  @override
  String get content => 'Հաստա՞տ ուզում եք չեղարկել ֆայլերի փոխանցումը';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$hy extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Չստացվեց բացել ֆայլը';
  @override
  String content({required Object file}) => 'Չստացվեց բացել «${file}»։ Այս ֆայլը տեղափոխվե՞լ, վերանվանվե՞լ կամ ջնջվե՞լ է։';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$hy extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գաղտնագրումն անջատված է';
  @override
  String get content =>
      'Փոխանցումը այժմ տեղի է ունենում չգաղտնագրված HTTP պրոտոկոլի միջոցով: HTTPS պրոտոկոլն օգտագործելու համար կրկին միացրեք գաղտնագրումը:';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$hy extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$hy extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Սիրվածներ';
  @override
  String get noFavorites => 'Դեռևս սիրված սարքեր չկան։';
  @override
  String get addFavorite => 'Ավելացնել';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$hy extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ջնջել սիրվածներից';
  @override
  String content({required Object name}) => 'Հաստա՞տ ուզում եք ջնջել «${name}» սիրվածներից։';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$hy extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Ավելացնել սիրվածներին';
  @override
  String get titleEdit => 'Կարգավորումներ';
  @override
  String get name => 'Սարքի անունը';
  @override
  String get auto => '(ավտոմատ)';
  @override
  String get ip => 'IP հասցե';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$hy extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ֆայլի մասին';
  @override
  String get fileName => 'Ֆայլի անունը՝';
  @override
  String get path => 'Ուղի՝';
  @override
  String get size => 'Չափսը՝';
  @override
  String get sender => 'Ուղարկող՝';
  @override
  String get time => 'Ժամանակը՝';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$hy extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գրեք ֆայլի անունը';
  @override
  String original({required Object original}) => 'Օրիգինալը՝ ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$hy extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մաքրել պատմությունը';
  @override
  String get content => 'Հաստա՞տ ուզում եք ջնջել ամբողջ պատմությունը';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$hy extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend-ը չի կարող գտնել այլ սարքեր՝ առանց այդ թույլտվության: Խնդրում ենք տրամադրել այս թույլտվությունը կարգավորումներում:';
  @override
  String get gotoSettings => 'Կարգավորումներ';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$hy extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գրեք նամակը';
  @override
  String get multiline => 'Բազմագիծ';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$hy extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընտրված ֆայլեր չկան';
  @override
  String get content => 'Խնդրում ենք ընտրել առնվազն մեկ ֆայլ։';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$hy extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Թույլտվություն չկա';
  @override
  String get content => 'Դուք չեք տրամադրել անհրաժեշտ թույլտվությունները։ Խնդրում ենք տրամադրել դրանք կարգավորումներում։';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$hy extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Հասանելի չէ';
  @override
  String get content => 'Այս գործառույթը հասանելի է միայն հետևյալ սարքերում՝';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$hy extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR կոդ';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$hy extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Արագ գործողություններ';
  @override
  String get counter => 'Հաշվիչ';
  @override
  String get prefix => 'Նախածանց';
  @override
  String get padZero => 'Սկզբում ավելացնել զրոներ';
  @override
  String get sortBeforeCount => 'Դասավորել այբբենական կարգով (Ա-Ֆ)';
  @override
  String get random => 'Պատահական';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$hy extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Ֆայլերի հարցումները այժմ ընդունվում են ավտոմատ: Հաշվի առեք, որ տեղական ցանցի բոլոր օգտատերերը կարող են ձեզ ֆայլեր ուղարկել:';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$hy extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Ֆայլերի հարցումները այժմ ընդունվում են ավտոմատ ձեր սիրվածների ցանկում գտնվող սարքերից։',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$hy extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գրեք PIN-ը';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$hy extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկման ռեժիմներ';
  @override
  String get single => 'Ֆայլերը ուղարկում է մեկ ստացողի: Ընտրությունը կջնջվի ֆայլերի փոխանցման ավարտից հետո:';
  @override
  String get multiple => 'Ֆայլերը ուղարկում է մի քանի ստացողների: Ընտրությունը չի ջնջվի ֆայլերի փոխանցման ավարտից հետո:';
  @override
  String get link => 'Ստացողները, որոնք չունեն LocalSend տեղադրված, կարող են ներբեռնել ընտրված ֆայլերը՝ բացելով հղումը իրենց բրաուզերում։';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$hy extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$hy extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
  @override
  String get dark => 'Մութ';
  @override
  String get light => 'Լուսավոր';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$hy extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'Հատուկ';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$hy extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$hy extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Բոլորը';
  @override
  String get filtered => 'Ֆիլտրված';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$hy extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Փոխանակման ընդհանուր ժամանակ (${time})';
  @override
  String get finishedError => 'Ավարտվեց սխալով';
  @override
  String get canceledSender => 'Ուղարկողը չեղարկեց';
  @override
  String get canceledReceiver => 'Ստացողը չեղարկեց';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$hy extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$hy._(TranslationsHy root) : this._root = root, super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Գաղտնագրումն այլևս չի դանդաղեցնում փոխանցումները: Այն վերագործարկվել է այս սարքի վրա, եթե դուք այն նախկինում անջատել եք:',
    'Սիրվածներից ստացված հարցումները այժմ ընդունվում են ավտոմատ: Սա միացված է լռելյայնորեն և կարող է անջատվել կարգավորումներում:',
    'Android-ում տվյալների փոխանցումը շարունակվում է, երբ ծրագիրը ֆոնային ռեժիմում է կամ էկրանը անջատված է։ iOS-ում հավելվածը պետք է մնա առաջին պլանում։',
  ];
}
