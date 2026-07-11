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
class TranslationsHi extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsHi({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.hi,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <hi>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsHi _root = this; // ignore: unused_field

  @override
  TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'अंग्रेज़ी';
  @override
  String get appName => 'स्थानीय भेजें (फाइल भेजो)';
  @override
  late final _Translations$general$hi general = _Translations$general$hi._(_root);
  @override
  late final _Translations$receiveTab$hi receiveTab = _Translations$receiveTab$hi._(_root);
  @override
  late final _Translations$sendTab$hi sendTab = _Translations$sendTab$hi._(_root);
  @override
  late final _Translations$settingsTab$hi settingsTab = _Translations$settingsTab$hi._(_root);
  @override
  late final _Translations$troubleshootPage$hi troubleshootPage = _Translations$troubleshootPage$hi._(_root);
  @override
  late final _Translations$receiveHistoryPage$hi receiveHistoryPage = _Translations$receiveHistoryPage$hi._(_root);
  @override
  late final _Translations$apkPickerPage$hi apkPickerPage = _Translations$apkPickerPage$hi._(_root);
  @override
  late final _Translations$selectedFilesPage$hi selectedFilesPage = _Translations$selectedFilesPage$hi._(_root);
  @override
  late final _Translations$receivePage$hi receivePage = _Translations$receivePage$hi._(_root);
  @override
  late final _Translations$receiveOptionsPage$hi receiveOptionsPage = _Translations$receiveOptionsPage$hi._(_root);
  @override
  late final _Translations$sendPage$hi sendPage = _Translations$sendPage$hi._(_root);
  @override
  late final _Translations$progressPage$hi progressPage = _Translations$progressPage$hi._(_root);
  @override
  late final _Translations$webSharePage$hi webSharePage = _Translations$webSharePage$hi._(_root);
  @override
  late final _Translations$aboutPage$hi aboutPage = _Translations$aboutPage$hi._(_root);
  @override
  late final _Translations$donationPage$hi donationPage = _Translations$donationPage$hi._(_root);
  @override
  late final _Translations$changelogPage$hi changelogPage = _Translations$changelogPage$hi._(_root);
  @override
  late final _Translations$aliasGenerator$hi aliasGenerator = _Translations$aliasGenerator$hi._(_root);
  @override
  late final _Translations$dialogs$hi dialogs = _Translations$dialogs$hi._(_root);
  @override
  late final _Translations$sanitization$hi sanitization = _Translations$sanitization$hi._(_root);
  @override
  late final _Translations$tray$hi tray = _Translations$tray$hi._(_root);
  @override
  late final _Translations$web$hi web = _Translations$web$hi._(_root);
  @override
  late final _Translations$assetPicker$hi assetPicker = _Translations$assetPicker$hi._(_root);
  @override
  late final _Translations$networkInterfacesPage$hi networkInterfacesPage = _Translations$networkInterfacesPage$hi._(_root);
}

// Path: general
class _Translations$general$hi extends Translations$general$en {
  _Translations$general$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'स्वीकार करें';
  @override
  String get accepted => 'स्वीकृत';
  @override
  String get add => 'जोड़ें';
  @override
  String get advanced => 'उन्नत';
  @override
  String get cancel => 'रद्द करें';
  @override
  String get close => 'बंद करें';
  @override
  String get confirm => 'पुष्टि करें';
  @override
  String get continueStr => 'जारी रखें';
  @override
  String get copy => 'नकल करें';
  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';
  @override
  String get decline => 'अस्वीकार करें';
  @override
  String get done => 'हो गया';
  @override
  String get delete => 'हटाएं';
  @override
  String get edit => 'संपादित करें';
  @override
  String get error => 'त्रुटि';
  @override
  String get example => 'उदाहरण';
  @override
  String get files => 'फाइलें';
  @override
  String get finished => 'समाप्त';
  @override
  String get hide => 'छुपाएं';
  @override
  String get off => 'बंद';
  @override
  String get offline => 'ऑफ़लाइन';
  @override
  String get on => 'चालू';
  @override
  String get online => 'ऑनलाइन';
  @override
  String get open => 'खोलें';
  @override
  String get queue => 'कतार';
  @override
  String get quickSave => 'त्वरित सहेजें';
  @override
  String get quickSaveFromFavorites => '"पसंदीदा" के लिए त्वरित सहेजें';
  @override
  String get renamed => 'नाम बदला गया';
  @override
  String get reset => 'रीसेट करें';
  @override
  String get restart => 'पुनः प्रारंभ करें';
  @override
  String get settings => 'सेटिंग्स';
  @override
  String get skipped => 'छोड़ा गया';
  @override
  String get start => 'प्रारंभ करें';
  @override
  String get stop => 'रोकें';
  @override
  String get save => 'सहेजें';
  @override
  String get unchanged => 'अपरिवर्तित';
  @override
  String get unknown => 'अज्ञात';
  @override
  String get noItemInClipboard => 'क्लिपबोर्ड में कोई आइटम नहीं है।';
}

// Path: receiveTab
class _Translations$receiveTab$hi extends Translations$receiveTab$en {
  _Translations$receiveTab$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'प्राप्त करें';
  @override
  late final _Translations$receiveTab$infoBox$hi infoBox = _Translations$receiveTab$infoBox$hi._(_root);
  @override
  late final _Translations$receiveTab$quickSave$hi quickSave = _Translations$receiveTab$quickSave$hi._(_root);
}

// Path: sendTab
class _Translations$sendTab$hi extends Translations$sendTab$en {
  _Translations$sendTab$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'भेजें';
  @override
  late final _Translations$sendTab$selection$hi selection = _Translations$sendTab$selection$hi._(_root);
  @override
  late final _Translations$sendTab$picker$hi picker = _Translations$sendTab$picker$hi._(_root);
  @override
  String get shareIntentInfo => 'आप अपने मोबाइल डिवाइस की "शेयर" सुविधा का उपयोग करके फाइलें अधिक आसानी से चुन सकते हैं।';
  @override
  String get nearbyDevices => 'निकटवर्ती उपकरण';
  @override
  String get thisDevice => 'यह डिवाइस';
  @override
  String get scan => 'उपकरणों को खोजें';
  @override
  String get manualSending => 'मैन्युअल भेजना';
  @override
  String get sendMode => 'भेजने का मोड';
  @override
  late final _Translations$sendTab$sendModes$hi sendModes = _Translations$sendTab$sendModes$hi._(_root);
  @override
  String get sendModeHelp => 'व्याख्या';
  @override
  String get help => 'कृपया सुनिश्चित करें कि वांछित लक्ष्य भी उसी वाई-फाई नेटवर्क पर हो।';
  @override
  String get placeItems => 'साझा करने के लिए आइटम रखें।';
}

// Path: settingsTab
class _Translations$settingsTab$hi extends Translations$settingsTab$en {
  _Translations$settingsTab$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'सेटिंग्स';
  @override
  late final _Translations$settingsTab$general$hi general = _Translations$settingsTab$general$hi._(_root);
  @override
  late final _Translations$settingsTab$receive$hi receive = _Translations$settingsTab$receive$hi._(_root);
  @override
  late final _Translations$settingsTab$send$hi send = _Translations$settingsTab$send$hi._(_root);
  @override
  late final _Translations$settingsTab$network$hi network = _Translations$settingsTab$network$hi._(_root);
  @override
  late final _Translations$settingsTab$other$hi other = _Translations$settingsTab$other$hi._(_root);
  @override
  String get advancedSettings => 'उन्नत सेटिंग्स';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$hi extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'समस्या निवारण';
  @override
  String get subTitle => 'क्या ऐप उम्मीद के मुताबिक काम नहीं कर रहा है? यहाँ आप कुछ सामान्य समाधान पा सकते हैं।';
  @override
  String get solution => 'समाधान:';
  @override
  String get fixButton => 'स्वतः ठीक करें';
  @override
  late final _Translations$troubleshootPage$firewall$hi firewall = _Translations$troubleshootPage$firewall$hi._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$hi noDiscovery = _Translations$troubleshootPage$noDiscovery$hi._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$hi noConnection = _Translations$troubleshootPage$noConnection$hi._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$hi extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'इतिहास';
  @override
  String get openFolder => 'फ़ोल्डर खोलें';
  @override
  String get deleteHistory => 'इतिहास हटाएं';
  @override
  String get empty => 'इतिहास खाली है।';
  @override
  late final _Translations$receiveHistoryPage$entryActions$hi entryActions = _Translations$receiveHistoryPage$entryActions$hi._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$hi extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ऐप्स (APK)';
  @override
  String get excludeSystemApps => 'सिस्टम ऐप्स को बाहर रखें';
  @override
  String get excludeAppsWithoutLaunchIntent => 'लॉन्च न किए जा सकने वाले ऐप्स को बाहर रखें';
  @override
  String apps({required Object n}) => '${n} ऐप्स';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$hi extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'सभी हटाएं';
}

// Path: receivePage
class _Translations$receivePage$hi extends Translations$receivePage$en {
  _Translations$receivePage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hi'))(
    n,
    one: 'आपको एक फाइल भेजना चाहता है',
    other: 'आपको ${n} फाइलें भेजना चाहता है',
  );
  @override
  String get subTitleMessage => 'ने आपको एक संदेश भेजा:';
  @override
  String get subTitleLink => 'ने आपको एक लिंक भेजा:';
  @override
  String get canceled => 'प्रेषक ने अनुरोध रद्द कर दिया है।';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$hi extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'विकल्प';
  @override
  String get destination => '@ : सेटिंग्सटैब.रिसीव.डेस्टिनेशन';
  @override
  String get appDirectory => '(LocalSend फ़ोल्डर)';
  @override
  String get saveToGallery => '@ : सेटिंग्सटैब.रिसीव.सेव टू गैलरी';
  @override
  String get saveToGalleryOff => 'स्वचालित रूप से बंद कर दिया गया क्योंकि वहाँ निर्देशिकाएँ हैं।';
}

// Path: sendPage
class _Translations$sendPage$hi extends Translations$sendPage$en {
  _Translations$sendPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'प्रतिक्रिया का इंतजार कर रहे हैं ||';
  @override
  String get rejected => 'प्राप्तकर्ता ने अनुरोध अस्वीकार कर दिया।';
  @override
  String get tooManyAttempts => '@ : वेब. बहुत अधिक प्रयास';
  @override
  String get busy => 'प्राप्तकर्ता किसी अन्य अनुरोध में व्यस्त है।';
}

// Path: progressPage
class _Translations$progressPage$hi extends Translations$progressPage$en {
  _Translations$progressPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'फ़ाइलें भेजी जा रही';
  @override
  String get titleReceiving => 'फ़ाइलें प्राप्त की जा रही';
  @override
  String get savedToGallery => 'गैलरी में सहेजा गया';
  @override
  late final _Translations$progressPage$total$hi total = _Translations$progressPage$total$hi._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$hi extends Translations$webSharePage$en {
  _Translations$webSharePage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'लिंक के माध्यम से साझा करें';
  @override
  String get loading => 'सर्वर प्रारंभ हो रहा है ||';
  @override
  String get stopping => 'सर्वर बंद हो रहा है ||';
  @override
  String get error => 'सर्वर शुरू करते समय एक त्रुटि हुई।';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hi'))(
    n,
    one: 'अपने ब्राउज़र में इस लिंक को खोलें:',
    other: 'अपने ब्राउज़र में इन लिंक में से एक को खोलें:',
  );
  @override
  String get requests => 'अनुरोध';
  @override
  String get noRequests => 'अभी तक कोई अनुरोध नहीं।';
  @override
  String get encryption => '@ : सेटिंग्स टैब . नेटवर्क . एन्क्रिप्शन';
  @override
  String get autoAccept => 'अनुरोधों को स्वचालित रूप से स्वीकार करें';
  @override
  String get requirePin => 'पिन आवश्यक है';
  @override
  String pinHint({required Object pin}) => 'पिन "${pin}" है';
  @override
  String get encryptionHint => 'LocalSend एक स्व-हस्ताक्षरित प्रमाणपत्र का उपयोग करता है। आपको इसे अपने ब्राउज़र में स्वीकार करना होगा।';
  @override
  String pendingRequests({required Object n}) => 'लंबित अनुरोध: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$hi extends Translations$aboutPage$en {
  _Translations$aboutPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend के बारे में';
  @override
  List<String> get description => [
    'LocalSend एक मुफ्त, ओपन-सोर्स ऐप है जो आपको अपने स्थानीय नेटवर्क पर पास के डिवाइसों के साथ इंटरनेट कनेक्शन की आवश्यकता के बिना सुरक्षित रूप से फाइलें और संदेश साझा करने की अनुमति देता है।',
    'यह ऐप Android, iOS, macOS, Windows और Linux पर उपलब्ध है। आप सभी डाउनलोड विकल्पों को आधिकारिक होमपेज पर पा सकते हैं।',
  ];
  @override
  String get author => 'लेखक';
  @override
  String get contributors => 'योगदानकर्ताओं';
  @override
  String get packagers => 'पैकेजर्स';
  @override
  String get translators => 'अनुवादकों';
}

// Path: donationPage
class _Translations$donationPage$hi extends Translations$donationPage$en {
  _Translations$donationPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'दान करें';
  @override
  String get info => 'LocalSend मुफ्त, ओपन-सोर्स और बिना किसी विज्ञापन के है। यदि आपको ऐप पसंद है, तो आप विकास का समर्थन दान करके कर सकते हैं।';
  @override
  String donate({required Object amount}) => 'दान करें ${amount}';
  @override
  String get thanks => 'आपका हार्दिक धन्यवाद!';
  @override
  String get restore => 'खरीदारी पुनर्स्थापित करें';
}

// Path: changelogPage
class _Translations$changelogPage$hi extends Translations$changelogPage$en {
  _Translations$changelogPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'परिवर्तन सूची';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$hi extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'प्यारा',
    'सुंदर',
    'बड़ा',
    'उज्ज्वल',
    'स्वच्छ',
    'चतुर',
    'शांत',
    'प्यारा',
    'चालाक',
    'दृढ़निश्चयी',
    'ऊर्जावान',
    'कुशल',
    'शानदार',
    'तेज',
    'अच्छा',
    'ताजा',
    'अच्छा',
    'गजब का',
    'महान',
    'सुडौल',
    'गर्म',
    'दयालु',
    'सुंदर',
    'रहस्यमय',
    'साफ-सुथरा',
    'अच्छा',
    'धैर्यवान',
    'सुंदर',
    'शक्तिशाली',
    'धनी',
    'गुप्त',
    'स्मार्ट',
    'ठोस',
    'विशेष',
    'रणनीतिक',
    'मजबूत',
    'साफ-सुथरा',
    'बुद्धिमान',
  ];
  @override
  List<String> get fruits => [
    'सेब',
    'एवोकाडो',
    'केला',
    'ब्लैकबेरी',
    'ब्लूबेरी',
    'ब्रोकली',
    'गाजर',
    'चेरी',
    'नारियल',
    'अंगूर',
    'नींबू',
    'सलाद पत्ता',
    'आम',
    'खरबूजा',
    'मशरूम',
    'प्याज',
    'संतरा',
    'पपीता',
    'आड़ू',
    'नाशपाती',
    'अनानास',
    'आलू',
    'कद्दू',
    'रसभरी',
    'स्ट्रॉबेरी',
    'टमाटर',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$hi extends Translations$dialogs$en {
  _Translations$dialogs$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$hi addFile = _Translations$dialogs$addFile$hi._(_root);
  @override
  late final _Translations$dialogs$openFile$hi openFile = _Translations$dialogs$openFile$hi._(_root);
  @override
  late final _Translations$dialogs$addressInput$hi addressInput = _Translations$dialogs$addressInput$hi._(_root);
  @override
  late final _Translations$dialogs$cancelSession$hi cancelSession = _Translations$dialogs$cancelSession$hi._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$hi cannotOpenFile = _Translations$dialogs$cannotOpenFile$hi._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$hi encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$hi._(_root);
  @override
  late final _Translations$dialogs$errorDialog$hi errorDialog = _Translations$dialogs$errorDialog$hi._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$hi favoriteDialog = _Translations$dialogs$favoriteDialog$hi._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$hi favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$hi._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$hi favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$hi._(_root);
  @override
  late final _Translations$dialogs$fileInfo$hi fileInfo = _Translations$dialogs$fileInfo$hi._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$hi fileNameInput = _Translations$dialogs$fileNameInput$hi._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$hi historyClearDialog = _Translations$dialogs$historyClearDialog$hi._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$hi localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$hi._(_root);
  @override
  late final _Translations$dialogs$messageInput$hi messageInput = _Translations$dialogs$messageInput$hi._(_root);
  @override
  late final _Translations$dialogs$noFiles$hi noFiles = _Translations$dialogs$noFiles$hi._(_root);
  @override
  late final _Translations$dialogs$noPermission$hi noPermission = _Translations$dialogs$noPermission$hi._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$hi notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$hi._(_root);
  @override
  late final _Translations$dialogs$qr$hi qr = _Translations$dialogs$qr$hi._(_root);
  @override
  late final _Translations$dialogs$quickActions$hi quickActions = _Translations$dialogs$quickActions$hi._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$hi quickSaveNotice = _Translations$dialogs$quickSaveNotice$hi._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$hi quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$hi._(_root);
  @override
  late final _Translations$dialogs$pin$hi pin = _Translations$dialogs$pin$hi._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$hi sendModeHelp = _Translations$dialogs$sendModeHelp$hi._(_root);
  @override
  late final _Translations$dialogs$zoom$hi zoom = _Translations$dialogs$zoom$hi._(_root);
}

// Path: sanitization
class _Translations$sanitization$hi extends Translations$sanitization$en {
  _Translations$sanitization$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'फ़ाइल नाम खाली नहीं हो सकता';
  @override
  String get invalid => 'फ़ाइल नाम में अमान्य वर्ण हैं';
}

// Path: tray
class _Translations$tray$hi extends Translations$tray$en {
  _Translations$tray$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend बंद करें';
  @override
  String get closeWindows => 'बाहर जाएं।';
}

// Path: web
class _Translations$web$hi extends Translations$web$en {
  _Translations$web$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN दर्ज करें';
  @override
  String get invalidPin => 'अमान्य PIN';
  @override
  String get tooManyAttempts => 'बहुत अधिक प्रयास';
  @override
  String get rejected => 'अस्वीकृत';
  @override
  String get files => 'फ़ाइलें';
  @override
  String get fileName => 'फ़ाइल नाम';
  @override
  String get size => 'आकार';
}

// Path: assetPicker
class _Translations$assetPicker$hi extends Translations$assetPicker$en {
  _Translations$assetPicker$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'पुष्ट करें';
  @override
  String get cancel => 'रद्द करें';
  @override
  String get edit => 'संपादित करें';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'लोड विफल';
  @override
  String get original => 'मूल';
  @override
  String get preview => 'पूर्वावलोकन';
  @override
  String get select => 'चुनें';
  @override
  String get emptyList => 'खाली सूची';
  @override
  String get unSupportedAssetType => 'असमर्थित फ़ाइल प्रकार।';
  @override
  String get unableToAccessAll => 'डिवाइस पर सभी फ़ाइलों तक पहुंच असमर्थ';
  @override
  String get viewingLimitedAssetsTip => 'केवल उन फ़ाइलों और एलबमों को देखें जो ऐप तक पहुंच योग्य हैं।';
  @override
  String get changeAccessibleLimitedAssets => 'पहुंच योग्य फ़ाइलों को अपडेट करने के लिए क्लिक करें';
  @override
  String get accessAllTip =>
      'ऐप डिवाइस पर केवल कुछ फ़ाइलों तक पहुंच सकता है। सिस्टम सेटिंग्स पर जाएं और ऐप को डिवाइस पर सभी मीडिया तक पहुंच की अनुमति दें।';
  @override
  String get goToSystemSettings => 'सिस्टम सेटिंग्स पर जाएं';
  @override
  String get accessLimitedAssets => 'सीमित पहुंच के साथ जारी रखें';
  @override
  String get accessiblePathName => 'पहुंच योग्य फ़ाइलें';
  @override
  String get sTypeAudioLabel => 'ऑडियो';
  @override
  String get sTypeImageLabel => 'फोटो';
  @override
  String get sTypeVideoLabel => 'वीडियो';
  @override
  String get sTypeOtherLabel => 'अन्य मीडिया';
  @override
  String get sActionPlayHint => 'चलाएँ';
  @override
  String get sActionPreviewHint => 'पूर्वावलोकन';
  @override
  String get sActionSelectHint => 'चुनें';
  @override
  String get sActionSwitchPathLabel => 'मार्ग बदलें';
  @override
  String get sActionUseCameraHint => 'कैमरा का उपयोग करें';
  @override
  String get sNameDurationLabel => 'अवधि';
  @override
  String get sUnitAssetCountLabel => 'गणना';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$hi extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'नेटवर्क इंटरफेस';
  @override
  String get info =>
      'डिफ़ॉल्ट रूप से, LocalSend सभी उपलब्ध नेटवर्क इंटरफेस का उपयोग करता है। आप यहां अवांछित नेटवर्क को बाहर कर सकते हैं। परिवर्तनों को लागू करने के लिए आपको सर्वर को पुनः आरंभ करना होगा।';
  @override
  String get preview => 'पूर्वावलोकन';
  @override
  String get whitelist => 'श्वेतसूची';
  @override
  String get blacklist => 'काले सूची';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$hi extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'पोर्ट:';
  @override
  String get alias => 'डिवाइस का नाम:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$hi extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'पसंदीदा';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$hi extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'चयन';
  @override
  String files({required Object files}) => 'फाइलें: ${files}';
  @override
  String size({required Object size}) => 'साइज़: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$hi extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'फाइल';
  @override
  String get folder => 'फ़ोल्डर';
  @override
  String get media => 'मीडिया';
  @override
  String get text => 'पाठ';
  @override
  String get app => 'एप';
  @override
  String get clipboard => 'पेस्ट';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$hi extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'एकल प्राप्तकर्ता';
  @override
  String get multiple => 'एकाधिक प्राप्तकर्ता';
  @override
  String get link => 'लिंक के माध्यम से साझा करें';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$hi extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'सामान्य';
  @override
  String get brightness => 'थीम';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$hi brightnessOptions = _Translations$settingsTab$general$brightnessOptions$hi._(
    _root,
  );
  @override
  String get color => 'रंग';
  @override
  late final _Translations$settingsTab$general$colorOptions$hi colorOptions = _Translations$settingsTab$general$colorOptions$hi._(_root);
  @override
  String get language => 'भाषा';
  @override
  late final _Translations$settingsTab$general$languageOptions$hi languageOptions = _Translations$settingsTab$general$languageOptions$hi._(_root);
  @override
  String get saveWindowPlacement => 'बंद करें: विंडो प्लेसमेंट सहेजें';
  @override
  String get saveWindowPlacementWindows => 'बाहर निकलने के बाद विंडो की स्थिति सहेजें';
  @override
  String get minimizeToTray => 'बंद करें: ट्रे/मेनू बार में मिनिमाइज करें';
  @override
  String get launchAtStartup => 'लॉगिन के बाद ऑटोस्टार्ट';
  @override
  String get launchMinimized => 'ऑटोस्टार्ट: छुपा हुआ प्रारंभ करें';
  @override
  String get showInContextMenu => 'कॉन्टेक्स्ट मेनू में LocalSend दिखाएं';
  @override
  String get animations => 'एनिमेशन';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$hi extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'प्राप्त करें';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'स्वतः समाप्त';
  @override
  String get destination => 'गंतव्य';
  @override
  String get downloads => '(डाउनलोड्स)';
  @override
  String get saveToGallery => 'मीडिया को गैलरी में सहेजें';
  @override
  String get saveToHistory => 'इतिहास में सहेजें';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$hi extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'भेजें';
  @override
  String get shareViaLinkAutoAccept => 'लिंक के माध्यम से साझा करें: स्वतः स्वीकार';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$hi extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'नेटवर्क';
  @override
  String get needRestart => 'सेटिंग्स लागू करने के लिए सर्वर को पुनः प्रारंभ करें!';
  @override
  String get server => 'सर्वर';
  @override
  String get alias => 'डिवाइस का नाम';
  @override
  String get deviceType => 'डिवाइस का प्रकार';
  @override
  String get deviceModel => 'डिवाइस का मॉडल';
  @override
  String get port => 'पोर्ट';
  @override
  String get discoveryTimeout => 'खोज का समय समाप्त';
  @override
  String get useSystemName => 'सिस्टम नाम का उपयोग करें';
  @override
  String get generateRandomAlias => 'रैंडम उपनाम जनरेट करें';
  @override
  String portWarning({required Object defaultPort}) =>
      'आप कस्टम पोर्ट का उपयोग कर रहे हैं इसलिए अन्य डिवाइस आपको पहचान नहीं सकते हैं। (डिफ़ॉल्ट: ${defaultPort})';
  @override
  String get encryption => 'एन्क्रिप्शन';
  @override
  String get multicastGroup => 'मल्टीकास्ट';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'आप कस्टम मल्टीकास्ट पते का उपयोग कर रहे हैं इसलिए अन्य डिवाइस आपको पहचान नहीं सकते हैं। (डिफ़ॉल्ट: ${defaultMulticast})';
  @override
  String get network => 'नेटवर्क';
  @override
  late final _Translations$settingsTab$network$networkOptions$hi networkOptions = _Translations$settingsTab$network$networkOptions$hi._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$hi extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'अन्य';
  @override
  String get support => 'LocalSend का समर्थन करें';
  @override
  String get donate => 'दान करें';
  @override
  String get privacyPolicy => 'गोपनीयता नीति';
  @override
  String get termsOfUse => 'उपयोग की शर्तें';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$hi extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'यह ऐप अन्य उपकरणों को फाइल भेज सकता है; लेकिन अन्य उपकरण इस डिवाइस को फाइल नहीं भेज सकते।';
  @override
  String solution({required Object port}) =>
      'यह संभवतः फ़ायरवॉल समस्या है। आप इसे पोर्ट ${port} पर आने वाले कनेक्शनों (UDP और TCP) को अनुमति देकर हल कर सकते हैं।';
  @override
  String get openFirewall => 'फायरवॉल खोलें';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$hi extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'यह डिवाइस अन्य डिवाइसों को ढूंढ नहीं सकता।';
  @override
  String get solution =>
      'सुनिश्चित करें कि सभी डिवाइस एक ही वाई-फाई नेटवर्क से जुड़े हों। पोर्ट, मल्टीकास्ट पता और एन्क्रिप्शन की सेटिंग्स समान होनी चाहिए। यदि डिवाइस नहीं मिलता है, तो लक्ष्य डिवाइस का आईपी पता स्वयं दर्ज करें। अगर यह काम करता है, तो डिवाइस को पसंदीदा में सहेजें ताकि भविष्य में स्वचालित रूप से मिल सके।';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$hi extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'दोनों उपकरण एक दूसरे को खोज नहीं सकते और न ही वे फाइल साझा कर सकते हैं।';
  @override
  String get solution =>
      'क्या समस्या दोनों तरफ मौजूद है? अगर हाँ, तो आपको यह सुनिश्चित करना होगा कि दोनों डिवाइस एक ही वाई-फ़ाई नेटवर्क पर हैं और एक ही कॉन्फ़िगरेशन (पोर्ट, मल्टीकास्ट पता, एन्क्रिप्शन) साझा करते हैं। नेटवर्क प्रतिभागियों के बीच संचार की अनुमति नहीं दे सकता है। इस मामले में, यह विकल्प राउटर पर सक्षम होना चाहिए।';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$hi extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'फाइल खोलें';
  @override
  String get showInFolder => 'फ़ोल्डर में दिखाएं';
  @override
  String get info => 'जानकारी';
  @override
  String get deleteFromHistory => 'इतिहास से हटाएं';
}

// Path: progressPage.total
class _Translations$progressPage$total$hi extends Translations$progressPage$total$en {
  _Translations$progressPage$total$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$hi title = _Translations$progressPage$total$title$hi._(_root);
  @override
  String count({required Object curr, required Object n}) => 'फाइलें: ${curr}/${n}';
  @override
  String size({required Object curr, required Object n}) => 'आकार: ${curr}/${n}';
  @override
  String speed({required Object speed}) => 'गति: ${speed}/सेकंड';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$hi extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फाइल जोड़ें';
  @override
  String get content => 'आप क्या जोड़ना चाहते हैं?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$hi extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल खोलें';
  @override
  String get content => 'क्या आप प्राप्त फ़ाइल खोलना चाहते हैं?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$hi extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'पता दर्ज करें';
  @override
  String get hashtag => 'हैशटैग';
  @override
  String get ip => 'IP पता';
  @override
  String get recentlyUsed => 'हाल ही में उपयोग किया गया: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$hi extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल स्थानांतरण रद्द करें';
  @override
  String get content => 'क्या आप वास्तव में फ़ाइल स्थानांतरण रद्द करना चाहते हैं?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$hi extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल नहीं खोल सकते';
  @override
  String content({required Object file}) => '"${file}" खोल नहीं सके। क्या यह फ़ाइल स्थानांतरित कर दी गई या नाम बदला या हटा दिया गया है?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$hi extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'एन्क्रिप्शन अक्षम';
  @override
  String get content =>
      'अब संचार बिना एन्क्रिप्ट किए हुए HTTP प्रोटोकॉल के माध्यम से होता है। HTTPS का उपयोग करने के लिए, एन्क्रिप्शन को फिर से सक्षम करें।';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$hi extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$hi extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'पसंदीदा';
  @override
  String get noFavorites => 'अभी तक कोई पसंदीदा डिवाइस नहीं है।';
  @override
  String get addFavorite => 'जोड़ें';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$hi extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'पसंदीदा से हटाएँ';
  @override
  String content({required Object name}) => 'क्या आप वास्तव में "${name}" को पसंदीदा से हटाना चाहते हैं?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$hi extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'पसंदीदा में जोड़ें';
  @override
  String get titleEdit => 'सेटिंग्स';
  @override
  String get name => 'डिवाइस नाम';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP पता';
  @override
  String get port => 'पोर्ट';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$hi extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल की जानकारी';
  @override
  String get fileName => 'फ़ाइल का नाम:';
  @override
  String get path => 'पथ:';
  @override
  String get size => 'आकार:';
  @override
  String get sender => 'प्रेषक:';
  @override
  String get time => 'समय:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$hi extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल का नाम दर्ज करें';
  @override
  String original({required Object original}) => 'मूल: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$hi extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'इतिहास साफ करें';
  @override
  String get content => 'क्या आप वास्तव में पूरे इतिहास को हटाना चाहते हैं?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$hi extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend स्थानीय नेटवर्क को स्कैन करने की अनुमति के बिना अन्य डिवाइसों को नहीं ढूंढ सकता। कृपया सेटिंग्स में यह अनुमति दें।';
  @override
  String get gotoSettings => 'सेटिंग्स';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$hi extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'संदेश टाइप करें';
  @override
  String get multiline => 'मल्टीलाइन';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$hi extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'कोई फ़ाइल चयनित नहीं';
  @override
  String get content => 'कृपया कम से कम एक फ़ाइल का चयन करें।';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$hi extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'अनुमति नहीं';
  @override
  String get content => 'आपने आवश्यक अनुमतियाँ नहीं दी हैं। कृपया सेटिंग्स में उन्हें अनुमति दें।';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$hi extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'उपलब्ध नहीं';
  @override
  String get content => 'यह सुविधा केवल यहां उपलब्ध है:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$hi extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR कोड';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$hi extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'त्वरित क्रियाएँ';
  @override
  String get counter => 'काउंटर';
  @override
  String get prefix => 'प्रिफिक्स';
  @override
  String get padZero => 'शून्य के साथ पैड करें';
  @override
  String get sortBeforeCount => 'पहले वर्णानुक्रम में क्रमबद्ध करें';
  @override
  String get random => 'यादृच्छिक';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$hi extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => '@:सामान्य.जल्दी सहेजें';
  @override
  String get content => 'फ़ाइल अनुरोध स्वचालित रूप से स्वीकार कर लिए जाते हैं। ध्यान दें कि स्थानीय नेटवर्क पर सभी लोग आपको फ़ाइलें भेज सकते हैं।';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$hi extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => '@ : सामान्य .जल्दी पसंदीदा से सहेजें';
  @override
  List<String> get content => [
    'अब आपके पसंदीदा सूची में शामिल डिवाइसों से फ़ाइल अनुरोध स्वतः स्वीकार किए जाएंगे।',
    'चेतावनी! वर्तमान में, यह पूरी तरह से सुरक्षित नहीं है, क्योंकि कोई हैकर जो आपकी पसंदीदा सूची में शामिल किसी भी डिवाइस का फ़िंगरप्रिंट प्राप्त कर लेता है, वह बिना किसी प्रतिबंध के आपको फ़ाइलें भेज सकता है।',
    'हालांकि, यह विकल्प अभी भी उन सभी उपयोगकर्ताओं को बिना प्रतिबंध फ़ाइलें भेजने की अनुमति देने की तुलना में सुरक्षित है, जो स्थानीय नेटवर्क पर हैं।',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$hi extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN दर्ज करें';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$hi extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'भेजने के मोड';
  @override
  String get single => 'एक प्राप्तकर्ता को फ़ाइलें भेजता है। फ़ाइल ट्रांसफर समाप्त होने के बाद चयन हटा दिया जाएगा।';
  @override
  String get multiple => 'कई प्राप्तकर्ताओं को फ़ाइलें भेजता है। चयन हटाया नहीं जाएगा।';
  @override
  String get link => 'जिन प्राप्तकर्ताओं के पास LocalSend इंस्टॉल नहीं है, वे अपने ब्राउज़र में लिंक खोलकर चयनित फ़ाइलें डाउनलोड कर सकते हैं।';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$hi extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$hi extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
  @override
  String get dark => 'डार्क';
  @override
  String get light => 'लाइट';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$hi extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$hi extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$hi extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'सब';
  @override
  String get filtered => 'परिष्कृत';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$hi extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$hi._(TranslationsHi root) : this._root = root, super.internal(root);

  final TranslationsHi _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'कुल प्रगति (${time})';
  @override
  String get finishedError => 'त्रुटि के साथ समाप्त हुआ';
  @override
  String get canceledSender => 'प्रेषक द्वारा रद्द किया गया';
  @override
  String get canceledReceiver => 'प्राप्तकर्ता द्वारा रद्द किया गया';
}
