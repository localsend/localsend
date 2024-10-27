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
class TranslationsNe extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsNe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ne,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ne>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsNe _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'नेपाली';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralNe general = _TranslationsGeneralNe._(_root);
  @override
  late final _TranslationsReceiveTabNe receiveTab = _TranslationsReceiveTabNe._(_root);
  @override
  late final _TranslationsSendTabNe sendTab = _TranslationsSendTabNe._(_root);
  @override
  late final _TranslationsSettingsTabNe settingsTab = _TranslationsSettingsTabNe._(_root);
  @override
  late final _TranslationsTroubleshootPageNe troubleshootPage = _TranslationsTroubleshootPageNe._(_root);
  @override
  late final _TranslationsReceiveHistoryPageNe receiveHistoryPage = _TranslationsReceiveHistoryPageNe._(_root);
  @override
  late final _TranslationsApkPickerPageNe apkPickerPage = _TranslationsApkPickerPageNe._(_root);
  @override
  late final _TranslationsSelectedFilesPageNe selectedFilesPage = _TranslationsSelectedFilesPageNe._(_root);
  @override
  late final _TranslationsReceivePageNe receivePage = _TranslationsReceivePageNe._(_root);
  @override
  late final _TranslationsReceiveOptionsPageNe receiveOptionsPage = _TranslationsReceiveOptionsPageNe._(_root);
  @override
  late final _TranslationsSendPageNe sendPage = _TranslationsSendPageNe._(_root);
  @override
  late final _TranslationsProgressPageNe progressPage = _TranslationsProgressPageNe._(_root);
  @override
  late final _TranslationsWebSharePageNe webSharePage = _TranslationsWebSharePageNe._(_root);
  @override
  late final _TranslationsAboutPageNe aboutPage = _TranslationsAboutPageNe._(_root);
  @override
  late final _TranslationsChangelogPageNe changelogPage = _TranslationsChangelogPageNe._(_root);
  @override
  late final _TranslationsAliasGeneratorNe aliasGenerator = _TranslationsAliasGeneratorNe._(_root);
  @override
  late final _TranslationsDialogsNe dialogs = _TranslationsDialogsNe._(_root);
  @override
  late final _TranslationsTrayNe tray = _TranslationsTrayNe._(_root);
  @override
  late final _TranslationsWebNe web = _TranslationsWebNe._(_root);
  @override
  late final _TranslationsAssetPickerNe assetPicker = _TranslationsAssetPickerNe._(_root);
}

// Path: general
class _TranslationsGeneralNe extends TranslationsGeneralEn {
  _TranslationsGeneralNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'स्वीकार गर्नुहोस्';
  @override
  String get accepted => 'स्वीकृत';
  @override
  String get add => 'थप्नुहोस्';
  @override
  String get advanced => 'उन्नत';
  @override
  String get cancel => 'रद्द गर्नुहोस्';
  @override
  String get close => 'बन्द गर्नुहोस्';
  @override
  String get confirm => 'पुष्टि गर्नुहोस्';
  @override
  String get continueStr => 'जारी राख्नुहोस्';
  @override
  String get copy => 'कपी';
  @override
  String get copiedToClipboard => 'क्लिपबोर्डमा प्रतिलिपि गरियो';
  @override
  String get decline => 'अस्वीकार गर्नुहोस्';
  @override
  String get done => 'सकियो';
  @override
  String get edit => 'सम्पादन गर्नुहोस्';
  @override
  String get error => 'त्रुटि';
  @override
  String get example => 'उदाहरण';
  @override
  String get files => 'फाइलहरू';
  @override
  String get finished => 'समाप्त भयो';
  @override
  String get hide => 'लुकाउनुहोस्';
  @override
  String get off => 'बन्द';
  @override
  String get offline => 'अफलाइन';
  @override
  String get on => 'अन';
  @override
  String get online => 'अनलाइन';
  @override
  String get open => 'खोल्नुहोस्';
  @override
  String get queue => 'लाम';
  @override
  String get quickSave => 'छिटो सेव गर्नुहोस्  ';
  @override
  String get renamed => 'पुन: नामाकरण गरियो';
  @override
  String get reset => 'रिसेट गर्नुहोस्';
  @override
  String get restart => 'फेरि शुरु गर्नु';
  @override
  String get settings => 'सेटिङहरू';
  @override
  String get skipped => 'छोडियो';
  @override
  String get start => 'सुरु गर्नुहोस्';
  @override
  String get stop => 'रोक';
  @override
  String get save => 'सेव  गर्नुहोस्';
  @override
  String get unchanged => 'अपरिवर्तित';
  @override
  String get unknown => 'अज्ञात';
}

// Path: receiveTab
class _TranslationsReceiveTabNe extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'प्राप्त गर्नुहोस्';
  @override
  late final _TranslationsReceiveTabInfoBoxNe infoBox = _TranslationsReceiveTabInfoBoxNe._(_root);
}

// Path: sendTab
class _TranslationsSendTabNe extends TranslationsSendTabEn {
  _TranslationsSendTabNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'पठाउनुहोस्';
  @override
  late final _TranslationsSendTabSelectionNe selection = _TranslationsSendTabSelectionNe._(_root);
  @override
  late final _TranslationsSendTabPickerNe picker = _TranslationsSendTabPickerNe._(_root);
  @override
  String get shareIntentInfo => 'तपाईले आफ्नो मोबाइल उपकरणको "साझेदारी" सुविधा पनि प्रयोग गर्न सक्नुहुन्छ फाइलहरू थप सजिलै चयन गर्न।';
  @override
  String get nearbyDevices => 'नजिकैका उपकरणहरू';
  @override
  String get thisDevice => 'यो डिभाईस';
  @override
  String get scan => 'डिभाईसहरू खोज्नुहोस्';
  @override
  String get sendMode => 'मोड भेजें';
  @override
  late final _TranslationsSendTabSendModesNe sendModes = _TranslationsSendTabSendModesNe._(_root);
  @override
  String get sendModeHelp => 'स्पष्टीकरण';
  @override
  String get help => 'कृपया सुनिश्चित गर्नुहोस् कि इच्छित लक्ष्य पनि उही वाइफाइ नेटवर्कमा छ।';
  @override
  String get placeItems => 'साझेदारी गर्न वस्तुहरू राख्नुहोस्।';
}

// Path: settingsTab
class _TranslationsSettingsTabNe extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'सेटिङहरू';
  @override
  late final _TranslationsSettingsTabGeneralNe general = _TranslationsSettingsTabGeneralNe._(_root);
  @override
  late final _TranslationsSettingsTabReceiveNe receive = _TranslationsSettingsTabReceiveNe._(_root);
  @override
  late final _TranslationsSettingsTabNetworkNe network = _TranslationsSettingsTabNetworkNe._(_root);
  @override
  String get advancedSettings => 'उन्नत सेटिङहरू';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageNe extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'समस्या निवारण करें';
  @override
  String get subTitle => 'इस अनुप्रयोग का अपेक्षित रूप से काम नहीं कर रहा है क्या? यहाँ आप आम समाधान प्राप्त कर सकते हैं।';
  @override
  String get solution => 'समाधान:';
  @override
  String get fixButton => 'स्वचालित ठीक करें';
  @override
  late final _TranslationsTroubleshootPageFirewallNe firewall = _TranslationsTroubleshootPageFirewallNe._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionNe noConnection = _TranslationsTroubleshootPageNoConnectionNe._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageNe extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'इतिहास';
  @override
  String get openFolder => 'फ़ोल्डर खोलें';
  @override
  String get deleteHistory => 'इतिहास को हटाएँ';
  @override
  String get empty => 'इतिहास खाली है।';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsNe entryActions = _TranslationsReceiveHistoryPageEntryActionsNe._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageNe extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'अनुप्रयोग (APK)';
  @override
  String get excludeSystemApps => 'सिस्टम ऐप्स को छोड़ें';
  @override
  String get excludeAppsWithoutLaunchIntent => 'लौंच के लिए उपयोग न करने योग्य ऐप्स को छोड़ें';
  @override
  String apps({required Object n}) => '${n} अनुप्रयोग';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageNe extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'सबै मेटाउनुहोस्';
}

// Path: receivePage
class _TranslationsReceivePageNe extends TranslationsReceivePageEn {
  _TranslationsReceivePageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ne'))(
        n,
        one: 'तपाईंलाई एउटा फाइल पठाउन चाहन्छ।',
        other: 'तपाईलाई ${n} फाइलहरू पठाउन चाहन्छ।',
      );
  @override
  String get subTitleMessage => 'तपाईलाई सन्देश पठाउनुभयो:';
  @override
  String get subTitleLink => 'तपाईंलाई लिङ्क पठाइयो:';
  @override
  String get canceled => 'प्रेषकले अनुरोध रद्द गरेको छ।';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageNe extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'विकल्पहरू';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend फोल्डर)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'निर्दिष्ट की यह नहीं की जा सकती है क्योंकि डायरेक्टरियाँ हैं।';
}

// Path: sendPage
class _TranslationsSendPageNe extends TranslationsSendPageEn {
  _TranslationsSendPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'प्रतिक्रियाको प्रतीक्षा गर्दै...';
  @override
  String get rejected => 'प्राप्तकर्ताले अनुरोध अस्वीकार गरेको छ।';
  @override
  String get busy => 'ग्राहक दूसरे अनुरोध के साथ व्यस्त हैं।';
}

// Path: progressPage
class _TranslationsProgressPageNe extends TranslationsProgressPageEn {
  _TranslationsProgressPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'फाइलहरू पठाउँदै';
  @override
  String get titleReceiving => 'फाइलहरू प्राप्त गर्दै';
  @override
  String get savedToGallery => 'फोटोहरूमा सुरक्षित गरियो';
  @override
  late final _TranslationsProgressPageTotalNe total = _TranslationsProgressPageTotalNe._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageNe extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'लिंक के माध्यम से साझा करें';
  @override
  String get loading => 'सर्वर प्रारंभ हो रहा है...';
  @override
  String get stopping => 'सर्वर को बंद कर रहा है...';
  @override
  String get error => 'सर्वर को शुरू करने के दौरान एक त्रुटि हुई है।';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ne'))(
        n,
        one: 'ब्राउज़र में इस लिंक को खोलें:',
        other: 'इनमें से लिंक्स में से एक ब्राउज़र में खोलें:',
      );
  @override
  String get requests => 'अनुरोध';
  @override
  String get noRequests => 'अबतक कोई अनुरोध नहीं हैं।';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get encryptionHint => 'LocalSend एक स्वयंसिग्ध प्रमाणपत्र प्रयोग गर्दछ। तपाईंले ब्राउजरमा यसलाई स्वीकार्नु पर्दछ।';
  @override
  String pendingRequests({required Object n}) => 'लंबित अनुरोध: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageNe extends TranslationsAboutPageEn {
  _TranslationsAboutPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend को बारेमा';
}

// Path: changelogPage
class _TranslationsChangelogPageNe extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Changelog';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorNe extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
        'मनमोहक',
        'सुन्दर',
        'ठूलो',
        'उज्यालो',
        'सफा',
        'चलाख',
        'कूल',
        'प्यारो',
        'चतुर',
        'निर्धारित',
        'ऊर्जावान',
        'कुशल',
        'शानदार',
        'छिटो',
        'राम्रो',
        'ताजा',
        'राम्रो',
        'भव्य',
        'महान',
        'सुन्दर',
        'तातो',
        'दयालु',
        'प्यारो',
        'रहस्यवादी',
        'सफा',
        'राम्रो',
        'बिरामी',
        'सुन्दर',
        'शक्तिशाली',
        'धनी',
        'गोप्य',
        'स्मार्ट',
        'ठोस',
        'विशेष',
        'रणनीतिक',
        'बलियो',
        'व्यवस्थित',
        'बुद्धिमान्',
      ];
  @override
  List<String> get fruits => [
        'स्याऊ',
        'एभोकाडो',
        'केरा',
        'ब्ल्याकबेरी',
        'ब्लूबेरी',
        'ब्रोकाउली',
        'गाजर',
        'चेरी',
        'नरिवल',
        'अंगूर',
        'कागती',
        'सलाद',
        'आँप',
        'खरबुजा',
        'च्याउ',
        'प्याज',
        'सुन्तला',
        'पपीता',
        'पीच',
        'नाशपाती',
        'अनानास',
        'आलु',
        'कद्दू',
        'रास्पबेरी',
        'स्ट्रबेरी',
        'टमाटर',
      ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsNe extends TranslationsDialogsEn {
  _TranslationsDialogsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileNe addFile = _TranslationsDialogsAddFileNe._(_root);
  @override
  late final _TranslationsDialogsAddressInputNe addressInput = _TranslationsDialogsAddressInputNe._(_root);
  @override
  late final _TranslationsDialogsCancelSessionNe cancelSession = _TranslationsDialogsCancelSessionNe._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileNe cannotOpenFile = _TranslationsDialogsCannotOpenFileNe._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeNe encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeNe._(_root);
  @override
  late final _TranslationsDialogsErrorDialogNe errorDialog = _TranslationsDialogsErrorDialogNe._(_root);
  @override
  late final _TranslationsDialogsFileInfoNe fileInfo = _TranslationsDialogsFileInfoNe._(_root);
  @override
  late final _TranslationsDialogsFileNameInputNe fileNameInput = _TranslationsDialogsFileNameInputNe._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedNe localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedNe._(_root);
  @override
  late final _TranslationsDialogsMessageInputNe messageInput = _TranslationsDialogsMessageInputNe._(_root);
  @override
  late final _TranslationsDialogsNoFilesNe noFiles = _TranslationsDialogsNoFilesNe._(_root);
  @override
  late final _TranslationsDialogsNoPermissionNe noPermission = _TranslationsDialogsNoPermissionNe._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformNe notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformNe._(_root);
  @override
  late final _TranslationsDialogsQrNe qr = _TranslationsDialogsQrNe._(_root);
  @override
  late final _TranslationsDialogsQuickActionsNe quickActions = _TranslationsDialogsQuickActionsNe._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeNe quickSaveNotice = _TranslationsDialogsQuickSaveNoticeNe._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpNe sendModeHelp = _TranslationsDialogsSendModeHelpNe._(_root);
}

// Path: tray
class _TranslationsTrayNe extends TranslationsTrayEn {
  _TranslationsTrayNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend छोड्नुहोस्';
}

// Path: web
class _TranslationsWebNe extends TranslationsWebEn {
  _TranslationsWebNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get rejected => 'मना कर दिया';
  @override
  String get files => 'फ़ाइलें';
  @override
  String get fileName => 'फ़ाइल का नाम';
  @override
  String get size => 'आकार';
}

// Path: assetPicker
class _TranslationsAssetPickerNe extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'पुष्टि गर्नुहोस्';
  @override
  String get cancel => 'रद्द गर्नुहोस्';
  @override
  String get edit => 'सम्पादन गर्नुहोस्';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'लोड गर्न मिलेन';
  @override
  String get original => 'मूल';
  @override
  String get preview => 'पूर्वावलोकन गर्नुहोस्';
  @override
  String get select => 'छान्नुहोस्';
  @override
  String get emptyList => 'खाली सूची';
  @override
  String get unSupportedAssetType => 'असमर्थित फाईल प्रकार।';
  @override
  String get unableToAccessAll => 'यस उपकरणमा सबै फाईलहरूमा पहुँच प्राप्त गर्न सकिएन।';
  @override
  String get viewingLimitedAssetsTip => 'केवल फाईलहरू र एल्बमहरूलाई अनुप्रयोगको लागि पहुँचयोग्य हेर्नुहोस्।';
  @override
  String get changeAccessibleLimitedAssets => 'पहुँचयोग्य फाईलहरू अद्यावधिक गर्न क्लिक गर्नुहोस्';
  @override
  String get accessAllTip =>
      'अनुप्रयोगमा केहि फाईलहरूलाई मात्र पहुँच गर्न सक्दछ। प्रणाली सेटिङ्समा जानुहोस् र उपकरणमा सबै मिडिया मा अनुप्रयोगलाई पहुँच दिनुहोस्।';
  @override
  String get goToSystemSettings => 'प्रणाली सेटिंग्समा जानुहोस्';
  @override
  String get accessLimitedAssets => 'अधिकृताद्वारा पहुँचले जारी राख्नुहोस्';
  @override
  String get accessiblePathName => 'पहुँचीने फाईलहरू';
  @override
  String get sTypeAudioLabel => 'अडियो';
  @override
  String get sTypeImageLabel => 'तस्वीर';
  @override
  String get sTypeVideoLabel => 'भिडियो';
  @override
  String get sTypeOtherLabel => 'अन्य मिडिया';
  @override
  String get sActionPlayHint => 'खेल्नुहोस्';
  @override
  String get sActionPreviewHint => 'अग्रिम पूर्वावलोकन गर्नुहोस्';
  @override
  String get sActionSelectHint => 'छान्नुहोस्';
  @override
  String get sActionSwitchPathLabel => 'पथ परिवर्तन गर्नुहोस्';
  @override
  String get sActionUseCameraHint => 'क्यामेरा प्रयोग गर्नुहोस्';
  @override
  String get sNameDurationLabel => 'समय अवधि';
  @override
  String get sUnitAssetCountLabel => 'गणना';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxNe extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'पोर्ट:';
  @override
  String get alias => 'उपनाम:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionNe extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'चयन';
  @override
  String files({required Object files}) => 'फाइलहरू: ${files}';
  @override
  String size({required Object size}) => 'आकार: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerNe extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'फाइल';
  @override
  String get folder => 'फोल्डर';
  @override
  String get media => 'मिडिया';
  @override
  String get text => 'पाठ';
  @override
  String get app => 'अनुप्रयोग';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesNe extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'एकल प्राप्तकर्ता';
  @override
  String get multiple => 'एकाधिक प्राप्तकर्ता';
  @override
  String get link => 'लिंक के माध्यम से साझा करें';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralNe extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'सामान्य';
  @override
  String get brightness => 'थीम';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsNe brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsNe._(_root);
  @override
  String get color => 'रंग';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsNe colorOptions = _TranslationsSettingsTabGeneralColorOptionsNe._(_root);
  @override
  String get language => 'भाषा';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsNe languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsNe._(_root);
  @override
  String get saveWindowPlacement => 'बंद करें: विंडो स्थानन प्लेसमेंट सहेजें';
  @override
  String get minimizeToTray => 'छोड्नुहोस्: ट्रेमा न्यूनतम गर्नुहोस्';
  @override
  String get launchAtStartup => 'लगइन पछि स्वत: सुरु गर्नुहोस्';
  @override
  String get launchMinimized => 'स्वतः सुरु गर्नुहोस्: लुकेको सुरु गर्नुहोस्';
  @override
  String get animations => 'एनिमेसनहरू';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveNe extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'प्राप्त गर्नुहोस्';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get destination => 'गन्तव्य';
  @override
  String get downloads => '(डाउनलोड)';
  @override
  String get saveToGallery => 'ग्यालरीमा मिडिया सेव  गर्नुहोस्';
  @override
  String get saveToHistory => 'इतिहासमा संचय गर्नुहोस्';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkNe extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'नेटवर्क';
  @override
  String get needRestart => 'सेटिङ्हरू लागू गर्न सर्भर पुन: सुरु गर्नुहोस्!';
  @override
  String get server => 'सर्भर';
  @override
  String get alias => 'उपनाम';
  @override
  String get deviceType => 'यन्त्रको प्रकार';
  @override
  String get deviceModel => 'यन्त्र मोडेल';
  @override
  String get port => 'पोर्ट';
  @override
  String portWarning({required Object defaultPort}) =>
      'आपको अन्य उपकर्णों द्वारा पहचाना नहीं जा सकता है क्योंकि आप कस्टम पोर्ट का उपयोग कर रहे हैं। (डिफ़ॉल्ट: ${defaultPort})';
  @override
  String get encryption => 'एनक्रिप्शन';
  @override
  String get multicastGroup => 'मल्टीकास्ट';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'आप अन्य उपकर्णों द्वारा पहचाना नहीं जा सकता है क्योंकि आप कस्टम मल्टीकास्ट पता का उपयोग कर रहे हैं। (डिफ़ॉल्ट: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallNe extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'यह अनुप्रयोग फ़ाइलें अन्य उपकर्णों को भेज सकता है, लेकिन अन्य उपकरण इस उपकरण को फ़ाइलें नहीं भेज सकते हैं।';
  @override
  String solution({required Object port}) =>
      'यह शायद एक फ़यरवॉल मुद्दा है। आप इसे पोर्ट ${port} पर आने वाली कनेक्शन्स की अनुमति देकर इसे हल कर सकते हैं।';
  @override
  String get openFirewall => 'फ़ायरवॉल खोलें';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionNe extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'दोनों उपकरण एक दूसरे को खोज नहीं सकते हैं और वे फ़ाइलें साझा नहीं कर सकते हैं।';
  @override
  String get solution =>
      'समस्या दोनों ओर है? तो आपको सुनिश्चित करना होगा कि दोनों उपकरण एक ही Wifi नेटवर्क में हैं और वे एक ही कॉन्फ़िगरेशन (पोर्ट, मल्टीकास्ट पता, एन्क्रिप्शन) साझा करते हैं। Wifi कम संचार करने की अनुमति नहीं दे सकता है। इस मामले में, इस विकल्प को राउटर पर सक्षम किया जाना चाहिए।';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsNe extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'फ़ाइल खोलें';
  @override
  String get info => 'सूचना';
  @override
  String get deleteFromHistory => 'इतिहास से हटाएँ';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalNe extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleNe title = _TranslationsProgressPageTotalTitleNe._(_root);
  @override
  String count({required Object curr, required Object n}) => 'फाइलहरू: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'आकार: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'गति: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileNe extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'चयनमा थप्नुहोस्';
  @override
  String get content => 'तपाईं के थप्न चाहनुहुन्छ?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputNe extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ठेगाना प्रविष्ट गर्नुहोस्';
  @override
  String get hashtag => 'ह्यासट्याग';
  @override
  String get ip => 'आईपी ​​ठेगाना';
  @override
  String get recentlyUsed => 'हाल में इस्तेमाल हुआ: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionNe extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फाइल स्थानान्तरण रद्द गर्नुहोस्';
  @override
  String get content => 'के तपाइँ साँच्चै फाइल स्थानान्तरण रद्द गर्न चाहनुहुन्छ?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileNe extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फ़ाइल नहीं खोल सकते';
  @override
  String content({required Object file}) =>
      '"${file}" फ़ाइल नहीं खोल सकती। क्या इस फ़ाइल को हटा दिया गया है, नाम बदल दिया गया है या मिटा दिया गया है?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeNe extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'एन्क्रिप्शन अक्षम है';
  @override
  String get content =>
      'अब संचरण बिना एनक्रिप्टों एचटीटीपी प्रोटोकॉल के माध्यम से होता है। एचटीटीपीएस का उपयोग करने के लिए, कृपया फिर से एन्क्रिप्शन सक्षम करें।';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogNe extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoNe extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

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
  String get sender => 'भेजने वाला:';
  @override
  String get time => 'समय:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputNe extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'फाइल नाम प्रविष्ट गर्नुहोस्';
  @override
  String original({required Object original}) => 'मूल: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedNe extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      ' LocalSend बिना निजी नेटवर्क स्कैन की अनुमति के बिना अन्य उपकरणों को नहीं खोज सकता है। कृपया सेटिंग्स में इस अनुमति को प्रदान करें।';
  @override
  String get gotoSettings => 'सेटिंग्स';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputNe extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'सन्देश टाइप गर्नुहोस्';
  @override
  String get multiline => 'बहुरेखा';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesNe extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'कुनै फाइल चयन गरिएको छैन';
  @override
  String get content => 'कृपया कम्तिमा एउटा फाइल चयन गर्नुहोस्।';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionNe extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'अनुमति नहीं है';
  @override
  String get content => 'तपाईंले आवश्यक अनुमतिहरूको प्रदान गर्न दिएको छैन। कृपया सेटिङहरूमा तिनीहरूलाई प्रदान गर्नुहोस्।';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformNe extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'उपलब्ध नहीं है';
  @override
  String get content => 'यह सुविधा केवल निम्नलिखित में उपलब्ध है:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrNe extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'क्यूआर कोड';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsNe extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'द्रुत कार्यहरू';
  @override
  String get counter => 'काउन्टर';
  @override
  String get prefix => 'उपसर्ग';
  @override
  String get padZero => 'शून्य संग प्याड';
  @override
  String get sortBeforeCount => 'पहिले वर्णमाला क्रमबद्ध गर्नुहोस्';
  @override
  String get random => 'अनियमित';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeNe extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'फाइल अनुरोधहरू स्वचालित रूपमा स्वीकार गरिन्छ। ';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpNe extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'मोड भेजें';
  @override
  String get single => 'एकांत प्राप्तकर्ताओं को फ़ाइलें भेजता है। चयन फ़ाइल संचरण के बाद साफ़ हो जाएगा।';
  @override
  String get multiple => 'एकाधिक प्राप्तकर्ताओं को फ़ाइलें भेजता है। चयन साफ़ नहीं होगा।';
  @override
  String get link => 'LocalSend इंस्टॉल न करने वाले प्राप्तकर्ता चयनित फ़ाइलें डाउनलोड कर सकते हैं जब वह ब्राउज़र में लिंक खोलते हैं।';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsNe extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
  @override
  String get dark => 'अँध्यारो';
  @override
  String get light => 'उज्यालो';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsNe extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsNe extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'सिस्टम';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleNe extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleNe._(TranslationsNe root)
      : this._root = root,
        super.internal(root);

  final TranslationsNe _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'कुल प्रगति (${time})';
  @override
  String get finishedError => 'त्रुटि संग समाप्त भयो';
  @override
  String get canceledSender => 'प्रेषकद्वारा रद्द गरियो';
  @override
  String get canceledReceiver => 'प्राप्तकर्ता द्वारा रद्द गरियो';
}
