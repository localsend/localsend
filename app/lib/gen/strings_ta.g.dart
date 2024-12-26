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
class TranslationsTa extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsTa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ta,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ta>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsTa _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'தமிழ்';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralTa general = _TranslationsGeneralTa._(_root);
  @override
  late final _TranslationsReceiveTabTa receiveTab = _TranslationsReceiveTabTa._(_root);
  @override
  late final _TranslationsSendTabTa sendTab = _TranslationsSendTabTa._(_root);
  @override
  late final _TranslationsSettingsTabTa settingsTab = _TranslationsSettingsTabTa._(_root);
  @override
  late final _TranslationsTroubleshootPageTa troubleshootPage = _TranslationsTroubleshootPageTa._(_root);
  @override
  late final _TranslationsReceiveHistoryPageTa receiveHistoryPage = _TranslationsReceiveHistoryPageTa._(_root);
  @override
  late final _TranslationsApkPickerPageTa apkPickerPage = _TranslationsApkPickerPageTa._(_root);
  @override
  late final _TranslationsSelectedFilesPageTa selectedFilesPage = _TranslationsSelectedFilesPageTa._(_root);
  @override
  late final _TranslationsReceivePageTa receivePage = _TranslationsReceivePageTa._(_root);
  @override
  late final _TranslationsReceiveOptionsPageTa receiveOptionsPage = _TranslationsReceiveOptionsPageTa._(_root);
  @override
  late final _TranslationsSendPageTa sendPage = _TranslationsSendPageTa._(_root);
  @override
  late final _TranslationsProgressPageTa progressPage = _TranslationsProgressPageTa._(_root);
  @override
  late final _TranslationsWebSharePageTa webSharePage = _TranslationsWebSharePageTa._(_root);
  @override
  late final _TranslationsAboutPageTa aboutPage = _TranslationsAboutPageTa._(_root);
  @override
  late final _TranslationsDonationPageTa donationPage = _TranslationsDonationPageTa._(_root);
  @override
  late final _TranslationsChangelogPageTa changelogPage = _TranslationsChangelogPageTa._(_root);
  @override
  late final _TranslationsAliasGeneratorTa aliasGenerator = _TranslationsAliasGeneratorTa._(_root);
  @override
  late final _TranslationsDialogsTa dialogs = _TranslationsDialogsTa._(_root);
  @override
  late final _TranslationsSanitizationTa sanitization = _TranslationsSanitizationTa._(_root);
  @override
  late final _TranslationsTrayTa tray = _TranslationsTrayTa._(_root);
  @override
  late final _TranslationsWebTa web = _TranslationsWebTa._(_root);
  @override
  late final _TranslationsAssetPickerTa assetPicker = _TranslationsAssetPickerTa._(_root);
}

// Path: general
class _TranslationsGeneralTa extends TranslationsGeneralEn {
  _TranslationsGeneralTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'ஏற்றுக்கொள்';
  @override
  String get accepted => 'ஏற்றுக்கொள்ளப்பட்டது';
  @override
  String get add => 'சேர்க்க';
  @override
  String get advanced => 'மேம்பட்ட';
  @override
  String get cancel => 'ரத்து செய்';
  @override
  String get close => 'மூடு';
  @override
  String get confirm => 'உறுதி';
  @override
  String get continueStr => 'தொடரவும்';
  @override
  String get copy => 'நகல் எடு';
  @override
  String get copiedToClipboard => 'கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';
  @override
  String get decline => 'மறு';
  @override
  String get done => 'முடிந்தது';
  @override
  String get delete => 'நீக்கு';
  @override
  String get edit => 'தொகுத்து அமை (திருத்து)';
  @override
  String get error => 'பிழை / தவறு';
  @override
  String get example => 'உதாரணம்';
  @override
  String get files => 'கோப்புகள்';
  @override
  String get finished => 'முடிந்தது';
  @override
  String get hide => 'மறை';
  @override
  String get off => 'ஆஃப் (Off)';
  @override
  String get offline => 'ஆஃப்லைன் (Offline)';
  @override
  String get on => 'ஆன் (On)';
  @override
  String get online => 'ஆன்லைன் (Online)';
  @override
  String get open => 'திறக்கவும்';
  @override
  String get queue => 'வரிசை';
  @override
  String get quickSave => 'விரைவில் சேமி';
  @override
  String get quickSaveFromFavorites => 'விருப்பங்களுக்கு விரைவாகச் சேமி';
  @override
  String get renamed => 'மறுபெயரிடப்பட்டது';
  @override
  String get reset => 'மாற்றங்களைச் செயல்தவிர்';
  @override
  String get restart => 'மறுதொடக்கம்';
  @override
  String get settings => 'அமைப்புகள்';
  @override
  String get skipped => 'தவிர்க்கப்பட்டது';
  @override
  String get start => 'தொடங்கு';
  @override
  String get stop => 'நிறுத்து';
  @override
  String get save => 'சேமி';
  @override
  String get unchanged => 'மாறாது';
  @override
  String get unknown => 'தெரியவில்லை';
  @override
  String get noItemInClipboard => 'கிளிப்போர்டில் உருப்படிகள் இல்லை';
}

// Path: receiveTab
class _TranslationsReceiveTabTa extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பெறு';
  @override
  late final _TranslationsReceiveTabInfoBoxTa infoBox = _TranslationsReceiveTabInfoBoxTa._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveTa quickSave = _TranslationsReceiveTabQuickSaveTa._(_root);
}

// Path: sendTab
class _TranslationsSendTabTa extends TranslationsSendTabEn {
  _TranslationsSendTabTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'அனுப்பு';
  @override
  late final _TranslationsSendTabSelectionTa selection = _TranslationsSendTabSelectionTa._(_root);
  @override
  late final _TranslationsSendTabPickerTa picker = _TranslationsSendTabPickerTa._(_root);
  @override
  String get shareIntentInfo => 'கோப்புகளை மிக எளிதாக தேர்ந்தெடுக்க உங்கள் மொபைல் சாதனத்தின் பகிர் அம்சத்தையும் பயன்படுத்தலாம்.';
  @override
  String get nearbyDevices => 'அருகிலுள்ள சாதனங்கள்';
  @override
  String get thisDevice => 'இந்த சாதனம்';
  @override
  String get scan => 'சாதனங்களைத் தேடு';
  @override
  String get manualSending => 'கைமுறையாக அனுப்புதல்';
  @override
  String get sendMode => 'அனுப்பும் முறை';
  @override
  late final _TranslationsSendTabSendModesTa sendModes = _TranslationsSendTabSendModesTa._(_root);
  @override
  String get sendModeHelp => 'விளக்கம்';
  @override
  String get help => 'விரும்பிய இலக்கும் அதே வைஃபை நெட்வொர்க்கில் இருப்பதை உறுதிசெய்யவும்.';
  @override
  String get placeItems => 'பகிர்ந்து கொள்ள பொருட்களை வைக்கவும்.';
}

// Path: settingsTab
class _TranslationsSettingsTabTa extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'அமைப்புகள்';
  @override
  late final _TranslationsSettingsTabGeneralTa general = _TranslationsSettingsTabGeneralTa._(_root);
  @override
  late final _TranslationsSettingsTabReceiveTa receive = _TranslationsSettingsTabReceiveTa._(_root);
  @override
  late final _TranslationsSettingsTabSendTa send = _TranslationsSettingsTabSendTa._(_root);
  @override
  late final _TranslationsSettingsTabNetworkTa network = _TranslationsSettingsTabNetworkTa._(_root);
  @override
  late final _TranslationsSettingsTabOtherTa other = _TranslationsSettingsTabOtherTa._(_root);
  @override
  String get advancedSettings => 'மேம்பட்ட அமைப்புகள்';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageTa extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பிரச்சனைகளை தீர்க்கவும்';
  @override
  String get subTitle => 'ஆப் எதிர்பார்த்தது போல வேலை செய்யவில்லையா? இங்கே சில பொதுவான தீர்வுகளை நீங்கள் காணலாம்.';
  @override
  String get solution => 'தீர்வு:';
  @override
  String get fixButton => 'தானாக சரி செய்யவும்';
  @override
  late final _TranslationsTroubleshootPageFirewallTa firewall = _TranslationsTroubleshootPageFirewallTa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryTa noDiscovery = _TranslationsTroubleshootPageNoDiscoveryTa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionTa noConnection = _TranslationsTroubleshootPageNoConnectionTa._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageTa extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'வரலாறு';
  @override
  String get openFolder => 'கோப்புறையை திறக்கவும்';
  @override
  String get deleteHistory => 'வரலாற்றை நீக்கவும்';
  @override
  String get empty => 'வரலாறு காலியாக உள்ளது.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsTa entryActions = _TranslationsReceiveHistoryPageEntryActionsTa._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageTa extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'செயலிகள் (APK)';
  @override
  String get excludeSystemApps => 'கணினி செயலிகளைக் கணக்கில் எடுத்துக்கொள்ளாமல் விடவும்';
  @override
  String get excludeAppsWithoutLaunchIntent => 'திறக்க முடியாத செயலிகளை தவிர்க்கவும்';
  @override
  String apps({required Object n}) => '${n} செயலிகள்';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageTa extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'அனைத்தையும் நீக்கவும்';
}

// Path: receivePage
class _TranslationsReceivePageTa extends TranslationsReceivePageEn {
  _TranslationsReceivePageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ta'))(
        n,
        one: 'உங்களுக்கு ஒரு கோப்பை அனுப்ப விரும்புகிறார்',
        other: 'உங்களுக்கு ${n} கோப்புகளை அனுப்ப விரும்புகிறார்',
      );
  @override
  String get subTitleMessage => 'உங்களுக்கு ஒரு செய்தியை அனுப்பினார்:';
  @override
  String get subTitleLink => 'உங்களுக்கு ஒரு இணைப்பை அனுப்பினார்:';
  @override
  String get canceled => 'அனுப்புபவர் கோரிக்கையை ரத்து செய்துள்ளார்.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageTa extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'விருப்பங்கள்';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend கோப்புறை)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'கோப்புறைகள் இருப்பதால் தானாகவே முடக்கப்பட்டது.';
}

// Path: sendPage
class _TranslationsSendPageTa extends TranslationsSendPageEn {
  _TranslationsSendPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'பதில் வரும் வரை காத்திருக்கிறது…';
  @override
  String get rejected => 'பெறுநர் கோரிக்கையை நிராகரித்துள்ளார்.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'பெறுநர் மற்றொரு கோரிக்கையுடன் ব্যস্তமாக உள்ளார்.';
}

// Path: progressPage
class _TranslationsProgressPageTa extends TranslationsProgressPageEn {
  _TranslationsProgressPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'கோப்புகளை அனுப்புகிறது';
  @override
  String get titleReceiving => 'கோப்புகளை பெறுகிறது';
  @override
  String get savedToGallery => 'புகைப்படங்களில் சேமிக்கப்பட்டது';
  @override
  late final _TranslationsProgressPageTotalTa total = _TranslationsProgressPageTotalTa._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageTa extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'இணைப்பின் மூலம் பகிரவும்';
  @override
  String get loading => 'சேவையை தொடங்குகிறது…';
  @override
  String get stopping => 'சேவையை நிறுத்துகிறது…';
  @override
  String get error => 'சேவையை தொடங்கும்போது பிழை ஏற்பட்டது.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ta'))(
        n,
        one: 'உங்கள் உலாவியில் இந்த இணைப்பை திறக்கவும்:',
        other: 'உங்கள் உலாவியில் இந்த இணைப்புகளில் ஒன்றை திறக்கவும்:',
      );
  @override
  String get requests => 'கோரிக்கைகள்';
  @override
  String get noRequests => 'இன்னும் கோரிக்கைகள் இல்லை.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'கோரிக்கைகளை தானாகவே ஏற்கவும்';
  @override
  String get requirePin => 'PIN தேவை';
  @override
  String pinHint({required Object pin}) => 'PIN "${pin}" ஆகும்';
  @override
  String get encryptionHint => 'LocalSend ஒரு சுய கையொப்பம் செய்யப்பட்ட சான்றிதழைப் பயன்படுத்துகிறது. உங்களின் உலாவியில் அதை ஏற்க வேண்டும்.';
  @override
  String pendingRequests({required Object n}) => 'நிலுவை கோரிக்கைகள்: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageTa extends TranslationsAboutPageEn {
  _TranslationsAboutPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend பற்றி';
  @override
  List<String> get description => [
        'LocalSend என்பது ஒரு இலவச, திறந்த மூல செயலி ஆகும், இது உங்களுக்கு உங்களின் உள்ளூர் நெட்வொர்க்கின் மூலம் அருகிலுள்ள சாதனங்களுடன் இணையம் தேவையின்றி பாதுகாப்பாக கோப்புகள் மற்றும் செய்திகளை பகிர அனுமதிக்கிறது.',
        'இந்த செயலி Android, iOS, macOS, Windows மற்றும் Linux-ல் கிடைக்கிறது. அனைத்து பதிவிறக்கம் விருப்பங்களையும் உத்தியோகபூர்வ இணையதளத்தில் காணலாம்.',
      ];
  @override
  String get author => 'ஆசிரியர்';
  @override
  String get contributors => 'பங்களிப்பாளர்கள்';
  @override
  String get packagers => 'பேக்கேஜர்கள்';
  @override
  String get translators => 'மொழிபெயர்ப்பாளர்கள்';
}

// Path: donationPage
class _TranslationsDonationPageTa extends TranslationsDonationPageEn {
  _TranslationsDonationPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'தானம்';
  @override
  String get info =>
      'LocalSend இலவசம், திறந்த மூலமாக உள்ளது மற்றும் விளம்பரங்களின்றி உள்ளது. செயலியை நீங்கள் விரும்பினால், ஒரு தானம் மூலம் வளர்ச்சியை ஆதரிக்கலாம்.';
  @override
  String donate({required Object amount}) => '${amount} தானம் செய்யவும்';
  @override
  String get thanks => 'மிகவும் நன்றி!';
  @override
  String get restore => 'கொள்முதல் மீட்டமை';
}

// Path: changelogPage
class _TranslationsChangelogPageTa extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'மாற்றம் பதிவு';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorTa extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
        'அருமையான',
        'அழகான',
        'பெரிய',
        'பிரகாசமான',
        'சுத்தமான',
        'திறமையான',
        'குளிர்ச்சி',
        'அழகான',
        'வில்லங்கமான',
        'உறுதியான',
        'ஆற்றல் மிக்க',
        'திறமையான',
        'அபாரமான',
        'வேகமான',
        'நன்றாக',
        'புதிய',
        'நல்ல',
        'கண்கவர்',
        'சிறந்த',
        'அழகான',
        'சூடான',
        'கருணைமிக்க',
        'செல்வாக்கான',
        'மர்மமான',
        'ஒழுங்கான',
        'நன்றான',
        'பொறுமையான',
        'அழகான',
        'சக்திவாய்ந்த',
        'செல்வந்தர்',
        'ரகசியமான',
        'சாமர்த்தியமான',
        'உறுதியான',
        'சிறப்பான',
        'உத்தேசமான',
        'வலுவான',
        'சுத்தமாக',
        'புத்திசாலி',
      ];
  @override
  List<String> get fruits => [
        'ஆப்பிள்',
        'அவகேடோ',
        'வாழை',
        'கருப்பு திராட்சை',
        'நீல திராட்சை',
        'ப்ரோக்கோலி',
        'கேரட்',
        'செர்ரி',
        'தேங்காய்',
        'திராட்சை',
        'எலுமிச்சை',
        'லெட்டுஸ்',
        'மாம்பழம்',
        'மெலன்',
        'மஷ்ரூம்',
        'வெங்காயம்',
        'ஆரஞ்சு',
        'பப்பாளி',
        'பீச்',
        'பேரிக்காய்',
        'அன்னாசி',
        'உருளைக்கிழங்கு',
        'மடிக்கோயா',
        'ராஸ்பெர்ரி',
        'ஸ்ட்ராபெர்ரி',
        'தக்காளி',
      ];

  /// சில மொழிகளில், பெயர்ச்சொல் இறுதியில் வர வேண்டும்.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsTa extends TranslationsDialogsEn {
  _TranslationsDialogsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileTa addFile = _TranslationsDialogsAddFileTa._(_root);
  @override
  late final _TranslationsDialogsOpenFileTa openFile = _TranslationsDialogsOpenFileTa._(_root);
  @override
  late final _TranslationsDialogsAddressInputTa addressInput = _TranslationsDialogsAddressInputTa._(_root);
  @override
  late final _TranslationsDialogsCancelSessionTa cancelSession = _TranslationsDialogsCancelSessionTa._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileTa cannotOpenFile = _TranslationsDialogsCannotOpenFileTa._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeTa encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeTa._(_root);
  @override
  late final _TranslationsDialogsErrorDialogTa errorDialog = _TranslationsDialogsErrorDialogTa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogTa favoriteDialog = _TranslationsDialogsFavoriteDialogTa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogTa favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogTa._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogTa favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogTa._(_root);
  @override
  late final _TranslationsDialogsFileInfoTa fileInfo = _TranslationsDialogsFileInfoTa._(_root);
  @override
  late final _TranslationsDialogsFileNameInputTa fileNameInput = _TranslationsDialogsFileNameInputTa._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogTa historyClearDialog = _TranslationsDialogsHistoryClearDialogTa._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedTa localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedTa._(_root);
  @override
  late final _TranslationsDialogsMessageInputTa messageInput = _TranslationsDialogsMessageInputTa._(_root);
  @override
  late final _TranslationsDialogsNoFilesTa noFiles = _TranslationsDialogsNoFilesTa._(_root);
  @override
  late final _TranslationsDialogsNoPermissionTa noPermission = _TranslationsDialogsNoPermissionTa._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformTa notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformTa._(_root);
  @override
  late final _TranslationsDialogsQrTa qr = _TranslationsDialogsQrTa._(_root);
  @override
  late final _TranslationsDialogsQuickActionsTa quickActions = _TranslationsDialogsQuickActionsTa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeTa quickSaveNotice = _TranslationsDialogsQuickSaveNoticeTa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeTa quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeTa._(_root);
  @override
  late final _TranslationsDialogsPinTa pin = _TranslationsDialogsPinTa._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpTa sendModeHelp = _TranslationsDialogsSendModeHelpTa._(_root);
  @override
  late final _TranslationsDialogsZoomTa zoom = _TranslationsDialogsZoomTa._(_root);
}

// Path: sanitization
class _TranslationsSanitizationTa extends TranslationsSanitizationEn {
  _TranslationsSanitizationTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'கோப்பின் பெயர் காலியாக இருக்க முடியாது';
  @override
  String get invalid => 'கோப்பின் பெயரில் தவறான எழுத்துக்கள் உள்ளன';
}

// Path: tray
class _TranslationsTrayTa extends TranslationsTrayEn {
  _TranslationsTrayTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend-ஐ நிறுத்து';
  @override
  String get closeWindows => 'வெளியேறு';
}

// Path: web
class _TranslationsWebTa extends TranslationsWebEn {
  _TranslationsWebTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN-ஐ உள்ளிடவும்';
  @override
  String get invalidPin => 'தவறான PIN';
  @override
  String get tooManyAttempts => 'மிக அதிகமான முயற்சிகள்';
  @override
  String get rejected => 'நிராகரிக்கப்பட்டது';
  @override
  String get files => 'கோப்புகள்';
  @override
  String get fileName => 'கோப்பின் பெயர்';
  @override
  String get size => 'அளவு';
}

// Path: assetPicker
class _TranslationsAssetPickerTa extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'உறுதிசெய்';
  @override
  String get cancel => 'ரத்து செய்';
  @override
  String get edit => 'தொகு';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'ஏற்றுதல் தோல்வியடைந்தது';
  @override
  String get original => 'மூல';
  @override
  String get preview => 'முன்னோட்டம்';
  @override
  String get select => 'தேர்வு செய்';
  @override
  String get emptyList => 'காலி பட்டியல்';
  @override
  String get unSupportedAssetType => 'ஆதரிக்கப்படாத கோப்பு வகை.';
  @override
  String get unableToAccessAll => 'சாதனத்தின் அனைத்து கோப்புகளுக்கும் அணுக முடியவில்லை';
  @override
  String get viewingLimitedAssetsTip => 'பயன்பாட்டால் அணுகக்கூடிய கோப்புகள் மற்றும் ஆல்பங்களை மட்டுமே பார்க்கவும்.';
  @override
  String get changeAccessibleLimitedAssets => 'அணுகக்கூடிய கோப்புகளை புதுப்பிக்க கிளிக் செய்யவும்';
  @override
  String get accessAllTip =>
      'பயன்பாடு சாதனத்தின் சில கோப்புகளுக்கே அணுக முடியும். முறைமை அமைப்புகள் செல்லவும் மற்றும் பயன்பாட்டுக்கு அனைத்து ஊடகத்திற்கும் அணுகலை அனுமதிக்கவும்.';
  @override
  String get goToSystemSettings => 'முறைமை அமைப்புகள் செல்லவும்';
  @override
  String get accessLimitedAssets => 'வரையறுக்கப்பட்ட அணுகலுடன் தொடரவும்';
  @override
  String get accessiblePathName => 'அணுகக்கூடிய கோப்புகள்';
  @override
  String get sTypeAudioLabel => 'ஒலி';
  @override
  String get sTypeImageLabel => 'படம்';
  @override
  String get sTypeVideoLabel => 'வீடியோ';
  @override
  String get sTypeOtherLabel => 'மற்ற ஊடகம்';
  @override
  String get sActionPlayHint => 'விளையாட';
  @override
  String get sActionPreviewHint => 'முன்னோட்டம்';
  @override
  String get sActionSelectHint => 'தேர்வு செய்';
  @override
  String get sActionSwitchPathLabel => 'பாதையை மாற்றவும்';
  @override
  String get sActionUseCameraHint => 'கேமராவை பயன்படுத்தவும்';
  @override
  String get sNameDurationLabel => 'நேர அளவு';
  @override
  String get sUnitAssetCountLabel => 'எண்ணிக்கை';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxTa extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'இணைய நெறிமுறை:';
  @override
  String get port => 'போர்ட்:';
  @override
  String get alias => 'சாதனத்தின் பெயர்:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveTa extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favorites';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionTa extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'தேர்வு';
  @override
  String files({required Object files}) => 'கோப்புகள்: ${files}';
  @override
  String size({required Object size}) => 'அளவு: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerTa extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'கோப்பு';
  @override
  String get folder => 'கோப்புறை';
  @override
  String get media => 'மீடியா';
  @override
  String get text => 'தட்டச்சு';
  @override
  String get app => 'செயலி';
  @override
  String get clipboard => 'ஒட்டவும்';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesTa extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'ஒற்றை பெறுநர்';
  @override
  String get multiple => 'பல பெறுநர்கள்';
  @override
  String get link => 'இணைப்பு மூலம் பகிரவும்';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralTa extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பொது';
  @override
  String get brightness => 'தீம்';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsTa brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsTa._(_root);
  @override
  String get color => 'நிறம்';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsTa colorOptions = _TranslationsSettingsTabGeneralColorOptionsTa._(_root);
  @override
  String get language => 'மொழி';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsTa languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsTa._(_root);
  @override
  String get saveWindowPlacement => 'வெளியேறிய பிறகு சாளர நிலையை சேமிக்கவும்';
  @override
  String get saveWindowPlacementWindows => 'வெளியேறிய பிறகு சாளர நிலையை சேமிக்கவும்';
  @override
  String get minimizeToTray => 'மூடும் போது சிஸ்டம் ட்ரே/மெனு பட்டியில் குறைக்கவும்';
  @override
  String get launchAtStartup => 'உள்நுழைந்த பிறகு தானாக துவக்கவும்';
  @override
  String get launchMinimized => 'ஆட்டோஸ்டார்ட்: மறைக்கப்பட்ட தொடக்கம்';
  @override
  String get showInContextMenu => 'சூழல் மெனுவில் LocalSend ஐக் காட்டு';
  @override
  String get animations => 'அனிமேஷன்கள்';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveTa extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பெறு';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'ஆட்டோ பினிஷ்';
  @override
  String get destination => 'கோப்புறையில் சேமிக்கவும்';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'மீடியாவை கேலரியில் சேமிக்கவும்';
  @override
  String get saveToHistory => 'வரலாற்றில் சேமிக்கவும்';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendTa extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'அனுப்பு';
  @override
  String get shareViaLinkAutoAccept => '"இணைப்பு வழியாக பகிர்" பயன்முறையில் கோரிக்கைகளை தானாக ஏற்கவும்';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkTa extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'நெட்வொர்க்';
  @override
  String get needRestart => 'அமைப்புகளைப் பயன்படுத்த, சேவையகத்தை மறுதொடக்கம் செய்யுங்கள்!';
  @override
  String get server => 'சர்வர்';
  @override
  String get alias => 'சாதனத்தின் பெயர்';
  @override
  String get deviceType => 'சாதன வகை';
  @override
  String get deviceModel => 'சாதன மாதிரி';
  @override
  String get port => 'போர்ட்';
  @override
  String get discoveryTimeout => 'கண்டுபிடிப்பு நேரம் முடிந்தது';
  @override
  String get useSystemName => 'அமைப்பின் பெயரைப் பயன்படுத்தவும்';
  @override
  String get generateRandomAlias => 'சீரற்ற மாற்றுப்பெயரை உருவாக்கவும்';
  @override
  String portWarning({required Object defaultPort}) =>
      'நீங்கள் தனிப்பயன் போர்ட்டைப் பயன்படுத்துவதால், பிற சாதனங்களால் உங்களைக் கண்டறிய முடியாமல் போகலாம். (இயல்புநிலை: ${defaultPort})';
  @override
  String get encryption => 'மறையாக்கம்';
  @override
  String get multicastGroup => 'மல்டிகாஸ்ட் முகவரி';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'நீங்கள் தனிப்பயன் மல்டிகாஸ்ட் முகவரியைப் பயன்படுத்துவதால் பிற சாதனங்களால் உங்களைக் கண்டறிய முடியாமல் போகலாம். (இயல்புநிலை: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherTa extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'மற்றவை';
  @override
  String get support => 'LocalSend ஐ ஆதரிக்க';
  @override
  String get donate => 'நன்கொடை';
  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';
  @override
  String get termsOfUse => 'பயன்பாட்டு விதிமுறைகள்';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallTa extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'இந்த சாதனம் மற்ற சாதனங்களுக்கு கோப்புகளை அனுப்ப முடிகிறது ஆனால் மற்ற சாதனங்கள் இந்த சாதனத்திற்கு கோப்புகளை அனுப்ப முடியாது.';
  @override
  String solution({required Object port}) =>
      'இது பொதுவாக ஒரு ஃபயர்வால் பிரச்சனை ஆகும். ${port} போர்ட் மீது உள்வரும் இணைப்புகளை (UDP மற்றும் TCP) அனுமதிப்பதன் மூலம் இதை சரி செய்யலாம்.';
  @override
  String get openFirewall => 'ஃபயர்வால் திறக்கவும்';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryTa extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'இந்த சாதனம் மற்ற சாதனங்களை கண்டறிய முடியவில்லை.';
  @override
  String get solution =>
      'அனைத்து சாதனங்களும் ஒரே Wi-Fi நெட்வொர்க்கில் உள்ளன மற்றும் ஒரே அமைப்பைப் பகிர்ந்து கொள்கின்றன என்பதை உறுதிசெய்யவும் (போர்ட், மல்டிகாஸ்ட் முகவரி, குறியாக்கம்). இலக்கு சாதனத்தின் IP முகவரியை கையால் টাইப் செய்ய முயற்சிக்கவும். இது வேலை செய்தால், இந்த சாதனத்தை விருப்பங்களில் சேர்க்க பரிந்துரை செய்யப்படுகிறது, எனவே எதிர்காலத்தில் இது தானாகவே கண்டறியப்படும்.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionTa extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'இரண்டு சாதனங்களும் ஒருவருக்கொருவர் கண்டறிய முடியவில்லை அல்லது கோப்புகளை பகிர முடியவில்லை.';
  @override
  String get solution =>
      'பிரச்சனை இரு பக்கங்களிலும் உள்ளதா? அவ்வாறெனில், இரு சாதனங்களும் ஒரே Wi-Fi நெட்வொர்க்கில் உள்ளன மற்றும் ஒரே அமைப்பைப் பகிர்ந்து கொள்கின்றன என்பதை உறுதிசெய்ய வேண்டும் (போர்ட், மல்டிகாஸ்ட் முகவரி, குறியாக்கம்). Access Point (AP) Isolation காரணமாக Wi-Fi நெட்வொர்க்கில் பங்கேற்பாளர்கள் ஒருவருடன் ஒருவர் தொடர்பு கொள்ள முடியாமல் இருக்கலாம். இந்த விருப்பத்தை ரௌட்டரில் முடக்க வேண்டும்.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsTa extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'கோப்பை திறக்கவும்';
  @override
  String get showInFolder => 'கோப்புறையில் காண்பிக்கவும்';
  @override
  String get info => 'தகவல்';
  @override
  String get deleteFromHistory => 'வரலாற்றில் இருந்து நீக்கவும்';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalTa extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleTa title = _TranslationsProgressPageTotalTitleTa._(_root);
  @override
  String count({required Object curr, required Object n}) => 'கோப்புகள்: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'அளவு: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'வேகம்: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileTa extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'தேர்வுக்கு சேர்';
  @override
  String get content => 'நீங்கள் என்ன சேர்க்க விரும்புகிறீர்கள்?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileTa extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்பை திறக்கவும்';
  @override
  String get content => 'பெறப்பட்ட கோப்பை திறக்க விரும்புகிறீர்களா?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputTa extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'முகவரியை உள்ளிடவும்';
  @override
  String get hashtag => 'ஹாஷ்டேக்';
  @override
  String get ip => 'IP முகவரி';
  @override
  String get recentlyUsed => 'சமீபத்தில் பயன்படுத்தப்பட்டது:';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionTa extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்புகள் பரிமாற்றத்தை ரத்து செய்யவும்';
  @override
  String get content => 'நீங்கள் உண்மையிலேயே கோப்புகள் பரிமாற்றத்தை ரத்து செய்ய விரும்புகிறீர்களா?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileTa extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்பை திறக்க முடியவில்லை';
  @override
  String content({required Object file}) => '"${file}"-ஐ திறக்க முடியவில்லை. இந்த கோப்பு நகர்த்தப்பட்டதா, மறுபெயரிடப்பட்டதா அல்லது நீக்கப்பட்டதா?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeTa extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'குறியாக்கம் முடக்கப்பட்டது';
  @override
  String get content =>
      'இப்போது தகவல்தொடர்பு குறியாக்கமில்லாத HTTP நெறிமுறையின் மூலம் நடக்கிறது. HTTPS நெறிமுறையை பயன்படுத்த, குறியாக்கத்தை மீண்டும் இயக்கவும்.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogTa extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogTa extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பிடித்தவை';
  @override
  String get noFavorites => 'இன்னும் பிடித்த சாதனங்கள் இல்லை.';
  @override
  String get addFavorite => 'சேர்';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogTa extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'பிடித்தவையிலிருந்து நீக்கவும்';
  @override
  String content({required Object name}) => '"${name}"-ஐ பிடித்தவையிலிருந்து உண்மையிலேயே நீக்க விரும்புகிறீர்களா?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogTa extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'பிடித்தவைகளில் சேர்க்கவும்';
  @override
  String get titleEdit => 'அமைப்புகள்';
  @override
  String get name => 'சாதனத்தின் பெயர்';
  @override
  String get auto => '(தானாக)';
  @override
  String get ip => 'IP முகவரி';
  @override
  String get port => 'போர்ட்';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoTa extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்பு தகவல்';
  @override
  String get fileName => 'கோப்பின் பெயர்:';
  @override
  String get path => 'பாதை:';
  @override
  String get size => 'அளவு:';
  @override
  String get sender => 'அனுப்புநர்:';
  @override
  String get time => 'நேரம்:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputTa extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்பின் பெயரை உள்ளிடவும்';
  @override
  String original({required Object original}) => 'மூல: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogTa extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'வரலாற்றை அழிக்கவும்';
  @override
  String get content => 'மொத்த வரலாற்றையும் உண்மையிலேயே நீக்க விரும்புகிறீர்களா?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedTa extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend உள்நாட்டு நெட்வொர்க்கை ஸ்கேன் செய்ய அனுமதியின்றி சாதனங்களை கண்டறிய முடியாது. தயவுசெய்து அமைப்புகளில் இந்த அனுமதியை வழங்கவும்.';
  @override
  String get gotoSettings => 'அமைப்புகள்';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputTa extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'செய்தியை தட்டச்சு செய்யவும்';
  @override
  String get multiline => 'பல வரிகள்';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesTa extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கோப்புகள் தேர்ந்தெடுக்கப்படவில்லை';
  @override
  String get content => 'குறைந்தது ஒரு கோப்பை தேர்ந்தெடுக்கவும்.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionTa extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'அனுமதி இல்லை';
  @override
  String get content => 'தேவையான அனுமதிகளை நீங்கள் வழங்கவில்லை. தயவுசெய்து அமைப்புகளில் அவற்றை வழங்கவும்.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformTa extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'கிடைக்கவில்லை';
  @override
  String get content => 'இந்த அம்சம் மட்டுமே கிடைக்கிறது:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrTa extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR குறியீடு';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsTa extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'விரைவு செயல்கள்';
  @override
  String get counter => 'கணக்கிடுபவர்';
  @override
  String get prefix => 'முன்னொட்டு';
  @override
  String get padZero => 'பூஜ்யங்களால் நிரப்பவும்';
  @override
  String get sortBeforeCount => 'முன்னதாக வரிசைப்படுத்தவும் (A-Z)';
  @override
  String get random => 'சீரற்ற';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeTa extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'கோப்பு கோரிக்கைகள் இப்போது தானாகவே ஏற்கப்படும். உள்ளூர் நெட்வொர்க்கில் உள்ள அனைவரும் உங்களுக்கு கோப்புகளை அனுப்ப முடியும் என்பதை கவனிக்கவும்.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeTa extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
        'உங்கள் பிடித்த பட்டியலில் உள்ள சாதனங்களில் இருந்து கோப்பு கோரிக்கைகள் இப்போது தானாகவே ஏற்கப்படும்.',
        'எச்சரிக்கை! தற்போது, இது முழுமையாக பாதுகாப்பாக இல்லை, ஏனெனில் உங்கள் பிடித்த பட்டியலில் உள்ள சாதனங்களின் விரலடிகளை வைத்துள்ள ஒரு ஹேக்கர் எந்த கட்டுப்பாடுகளும் இல்லாமல் உங்களுக்கு கோப்புகளை அனுப்ப முடியும்.',
        'என்ன தவிர, இந்த விருப்பம் உள்ளூர் நெட்வொர்க்கில் உள்ள அனைத்து பயனர்களும் எந்த கட்டுப்பாடுகளும் இல்லாமல் உங்களுக்கு கோப்புகளை அனுப்புவதை அனுமதிக்கும் விருப்பத்தை விட அதிகமாக பாதுகாப்பாக உள்ளது.',
      ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinTa extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN-ஐ உள்ளிடவும்';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpTa extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'அனுப்பும் முறைகள்';
  @override
  String get single => 'கோப்புகளை ஒரு பெறுநருக்கு அனுப்புகிறது. கோப்புகள் பரிமாற்றம் முடிந்த பிறகு தேர்வு அழிக்கப்படும்.';
  @override
  String get multiple => 'கோப்புகளை பல பெறுநர்களுக்கு அனுப்புகிறது. கோப்புகள் பரிமாற்றம் முடிந்த பிறகு தேர்வு அழிக்கப்படாது.';
  @override
  String get link =>
      'LocalSend நிறுவப்படாத பெறுநர்கள் தங்கள் உலாவியில் இணைப்பைத் திறக்க மூலம் தேர்ந்தெடுக்கப்பட்ட கோப்புகளை பதிவிறக்கம் செய்ய முடியும்.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomTa extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsTa extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'கணினி தீம்';
  @override
  String get dark => 'இருண்ட தீம்';
  @override
  String get light => 'ஒளி தீம்';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsTa extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'கணினி நிறம்';
  @override
  String get oled => 'ஓஎல்இடி';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsTa extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'கணினி மொழி';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleTa extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleTa._(TranslationsTa root)
      : this._root = root,
        super.internal(root);

  final TranslationsTa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'மொத்த முன்னேற்றம் (${time})';
  @override
  String get finishedError => 'பிழையுடன் முடிந்தது';
  @override
  String get canceledSender => 'அனுப்புநரால் ரத்து செய்யப்பட்டது';
  @override
  String get canceledReceiver => 'பெறுநரால் ரத்து செய்யப்பட்டது';
}
