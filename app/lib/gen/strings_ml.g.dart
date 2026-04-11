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
class TranslationsMl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsMl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ml,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ml>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsMl _root = this; // ignore: unused_field

  @override
  TranslationsMl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsMl(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _TranslationsGeneralMl general = _TranslationsGeneralMl._(_root);
  @override
  String get appName => 'ലോക്കൽസെൻഡ്‌';
  @override
  String get locale => 'മലയാളം';
  @override
  late final _TranslationsSendTabMl sendTab = _TranslationsSendTabMl._(_root);
  @override
  late final _TranslationsReceiveTabMl receiveTab = _TranslationsReceiveTabMl._(_root);
  @override
  late final _TranslationsSettingsTabMl settingsTab = _TranslationsSettingsTabMl._(_root);
  @override
  late final _TranslationsAssetPickerMl assetPicker = _TranslationsAssetPickerMl._(_root);
  @override
  late final _TranslationsWebMl web = _TranslationsWebMl._(_root);
  @override
  late final _TranslationsDialogsMl dialogs = _TranslationsDialogsMl._(_root);
  @override
  late final _TranslationsTrayMl tray = _TranslationsTrayMl._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageMl networkInterfacesPage = _TranslationsNetworkInterfacesPageMl._(_root);
  @override
  late final _TranslationsSanitizationMl sanitization = _TranslationsSanitizationMl._(_root);
  @override
  late final _TranslationsReceivePageMl receivePage = _TranslationsReceivePageMl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageMl receiveHistoryPage = _TranslationsReceiveHistoryPageMl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageMl receiveOptionsPage = _TranslationsReceiveOptionsPageMl._(_root);
  @override
  late final _TranslationsApkPickerPageMl apkPickerPage = _TranslationsApkPickerPageMl._(_root);
  @override
  late final _TranslationsTroubleshootPageMl troubleshootPage = _TranslationsTroubleshootPageMl._(_root);
  @override
  late final _TranslationsSelectedFilesPageMl selectedFilesPage = _TranslationsSelectedFilesPageMl._(_root);
  @override
  late final _TranslationsSendPageMl sendPage = _TranslationsSendPageMl._(_root);
  @override
  late final _TranslationsProgressPageMl progressPage = _TranslationsProgressPageMl._(_root);
  @override
  late final _TranslationsWebSharePageMl webSharePage = _TranslationsWebSharePageMl._(_root);
  @override
  late final _TranslationsDonationPageMl donationPage = _TranslationsDonationPageMl._(_root);
  @override
  late final _TranslationsAboutPageMl aboutPage = _TranslationsAboutPageMl._(_root);
  @override
  late final _TranslationsChangelogPageMl changelogPage = _TranslationsChangelogPageMl._(_root);
}

// Path: general
class _TranslationsGeneralMl extends TranslationsGeneralEn {
  _TranslationsGeneralMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get edit => 'തിരുത്തുക';
  @override
  String get accept => 'സ്വീകരിക്കുക';
  @override
  String get accepted => 'അംഗീകരിച്ചു';
  @override
  String get add => 'ചേർക്കുക';
  @override
  String get advanced => 'അഡ്വാൻസ്ഡ്';
  @override
  String get cancel => 'വേണ്ടെന്നു വയ്ക്കുക';
  @override
  String get confirm => 'സ്ഥിരീകരിക്കുക';
  @override
  String get continueStr => 'തുടരുക';
  @override
  String get copy => 'പകർത്തുക';
  @override
  String get decline => 'നിരസിക്കുക';
  @override
  String get delete => 'നീക്കം ചെയ്യുക';
  @override
  String get error => 'തകരാറ്';
  @override
  String get example => 'ഉദാഹരണം';
  @override
  String get files => 'ഫയലുകൾ';
  @override
  String get finished => 'പൂർത്തിയാക്കി';
  @override
  String get hide => 'മറയ്ക്കുക';
  @override
  String get save => 'സേവ്';
  @override
  String get close => 'അവസാനിപ്പിക്കുക';
  @override
  String get copiedToClipboard => 'ക്ലിപ്പ്ബോർഡിലേക്ക് കോപ്പി ചെയ്തു';
  @override
  String get done => 'ചെയ്തു കഴിഞ്ഞു';
  @override
  String get off => 'നിർത്തുക';
  @override
  String get offline => 'പ്രവർത്തനക്ഷമമല്ല';
  @override
  String get on => 'തുടങ്ങുക';
  @override
  String get online => 'പ്രവർത്തനക്ഷമമായി';
  @override
  String get open => 'തുറക്കുക';
  @override
  String get queue => 'കാത്തുനിൽക്കുക';
  @override
  String get quickSave => 'വേഗത്തിൽ സേവ് ചെയ്യുക';
  @override
  String get quickSaveFromFavorites => 'വേഗത്തിൽ ഫേവറിറ്റ് ആയി സേവ് ചെയ്യുക';
  @override
  String get renamed => 'പേര് മാറ്റി';
  @override
  String get reset => 'മാറ്റങ്ങൾ ഇല്ലാതാക്കുക';
  @override
  String get restart => 'വീണ്ടും തുടങ്ങുക';
  @override
  String get settings => 'സജ്ജീകരണങ്ങൾ';
  @override
  String get skipped => 'വിട്ടു കളഞ്ഞു';
  @override
  String get start => 'ആരംഭിക്കുക';
  @override
  String get stop => 'നിർത്തുക';
  @override
  String get unchanged => 'മാറ്റമില്ലാത്ത';
  @override
  String get unknown => 'അജ്ഞാതമായ';
  @override
  String get noItemInClipboard => 'ക്ലിപ്ബോർഡിൽ ഒന്നും ഇല്ല.';
}

// Path: sendTab
class _TranslationsSendTabMl extends TranslationsSendTabEn {
  _TranslationsSendTabMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get shareIntentInfo => 'താങ്കൾക്ക് മൊബൈലിലെ ഷെയർ ഫീച്ചർ ഉപയോഗിച്ചു എളുപ്പത്തിൽ ഫയൽസ് സെലക്ട് ചെയ്യാം.';
  @override
  String get title => 'അയക്കുക';
  @override
  late final _TranslationsSendTabSelectionMl selection = _TranslationsSendTabSelectionMl._(_root);
  @override
  late final _TranslationsSendTabPickerMl picker = _TranslationsSendTabPickerMl._(_root);
  @override
  String get nearbyDevices => 'അടുത്തുള്ള ഉപകരണങ്ങൾ';
  @override
  String get thisDevice => 'ഈ ഉപകരണം';
  @override
  String get scan => 'സെർച്ച് ഡിവൈസസ്';
  @override
  String get manualSending => 'മാന്വലായി അയക്കുക';
  @override
  String get sendMode => 'അയക്കുന്ന രീതി';
  @override
  late final _TranslationsSendTabSendModesMl sendModes = _TranslationsSendTabSendModesMl._(_root);
  @override
  String get sendModeHelp => 'വിശദീകരണം';
  @override
  String get help => 'ലഭിക്കേണ്ടയാളും ഒരേ WIFI യിൽ കണക്റ്റഡ് ആണെന്ന് ഉറപ്പു വരുത്തുക.';
  @override
  String get placeItems => 'ഷെയർ ചെയ്യേണ്ട ഐറ്റംസ് ഇടുക.';
}

// Path: receiveTab
class _TranslationsReceiveTabMl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'സ്വീകരിക്കുക';
  @override
  late final _TranslationsReceiveTabInfoBoxMl infoBox = _TranslationsReceiveTabInfoBoxMl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveMl quickSave = _TranslationsReceiveTabQuickSaveMl._(_root);
}

// Path: settingsTab
class _TranslationsSettingsTabMl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsTabGeneralMl general = _TranslationsSettingsTabGeneralMl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkMl network = _TranslationsSettingsTabNetworkMl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveMl receive = _TranslationsSettingsTabReceiveMl._(_root);
  @override
  late final _TranslationsSettingsTabSendMl send = _TranslationsSettingsTabSendMl._(_root);
  @override
  String get title => 'ക്രമീകരണങ്ങൾ';
  @override
  late final _TranslationsSettingsTabOtherMl other = _TranslationsSettingsTabOtherMl._(_root);
  @override
  String get advancedSettings => 'അഡ്വാൻസ്‌ഡ് ക്രമീകരണങ്ങൾ';
}

// Path: assetPicker
class _TranslationsAssetPickerMl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get accessLimitedAssets => 'മുഴുവൻ ആക്സസ് ഇല്ലാതെ തന്നെ മുന്നോട് പോവുക';
  @override
  String get accessAllTip => 'ഈ ഡിവൈസ്സിലെ കുറച്ച ഫയൽസ് മാത്രമേ അക്സസ്സ് ചെയ്യാൻ പറ്റുന്നുള്ളു . സിസ്റ്റം സെറ്റിങ്‌സിൽ നിന്നും അനുവദിക്കുക.';
  @override
  String get sNameDurationLabel => 'ദൈർഖ്യം';
  @override
  String get confirm => 'ഉറപ്പാക്കുക';
  @override
  String get cancel => 'വേണ്ടെന്നു വയ്ക്കുക';
  @override
  String get edit => 'മാറ്റം വരുത്തുക';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'ലോഡ് ചെയ്യാൻ പരാജയപെട്ടു';
  @override
  String get original => 'ഉത്ഭവം';
  @override
  String get preview => 'സ്വകാര്യപ്രദർശനം';
  @override
  String get select => 'തിരഞ്ഞെടുക്കുക';
  @override
  String get emptyList => 'ഒഴിഞ്ഞ ലിസ്റ്റ്';
  @override
  String get unSupportedAssetType => 'ഫയൽ ടൈപ് സപ്പോർട്ട് ചെയ്യുന്നില്ല.';
  @override
  String get unableToAccessAll => 'ഈ ഡിവൈസ്സിലെ മുഴുവൻ ഫയൽസും അക്സസ്സ് ചെയ്യാൻ പറ്റുന്നില്ല';
  @override
  String get viewingLimitedAssetsTip => 'വ്യൂ ഫയൽസും കൂടെ ആൽബവും മാത്രമേ അക്സസ്സ് ചെയ്യാൻ പറ്റുന്നുള്ളു.';
  @override
  String get changeAccessibleLimitedAssets => 'ആക്സിസിബിൾ ആയിട്ടുള്ള ഫയൽസ് അപ്ഡേറ്റ് ചെയ്യാൻ ക്ലിക്ക് ചെയ്യുക';
  @override
  String get goToSystemSettings => 'സിസ്റ്റം സെറ്റിങ്‌സിലേക്കു പോവുക';
  @override
  String get accessiblePathName => 'അക്സസ്സ് ചെയ്യാൻ പറ്റുന്ന ഫയലുകൾ';
  @override
  String get sTypeAudioLabel => 'ഓഡിയോ';
  @override
  String get sTypeImageLabel => 'ഇമേജ്';
  @override
  String get sTypeVideoLabel => 'വീഡിയോ';
  @override
  String get sTypeOtherLabel => 'മറ്റു തരത്തിലുള്ളവ';
  @override
  String get sActionPlayHint => 'പ്രവർത്തനം തുടങ്ങുക';
  @override
  String get sActionPreviewHint => 'സ്വകാര്യപ്രദർശനം';
  @override
  String get sActionSelectHint => 'തിരഞ്ഞെടുക്കുക';
  @override
  String get sActionSwitchPathLabel => 'Path മാറ്റുക';
  @override
  String get sActionUseCameraHint => 'ക്യാമറ ഉപയോഗിക്കുക';
  @override
  String get sUnitAssetCountLabel => 'എണ്ണം';
}

// Path: web
class _TranslationsWebMl extends TranslationsWebEn {
  _TranslationsWebMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get tooManyAttempts => 'ഒരുപാട് തവണ തെറ്റായി ട്രൈ ചെയ്തു';
  @override
  String get fileName => 'ഫയലിന്റെ പേര്';
  @override
  String get size => 'സൈസ്';
  @override
  String get enterPin => 'PIN എന്റർ ചെയ്യുക';
  @override
  String get invalidPin => 'PIN തെറ്റാണു';
  @override
  String get rejected => 'തള്ളിക്കളയപെട്ടു';
  @override
  String get files => 'ഫയലുകൾ';
}

// Path: dialogs
class _TranslationsDialogsMl extends TranslationsDialogsEn {
  _TranslationsDialogsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeMl quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeMl._(
    _root,
  );
  @override
  late final _TranslationsDialogsSendModeHelpMl sendModeHelp = _TranslationsDialogsSendModeHelpMl._(_root);
  @override
  late final _TranslationsDialogsPinMl pin = _TranslationsDialogsPinMl._(_root);
  @override
  late final _TranslationsDialogsZoomMl zoom = _TranslationsDialogsZoomMl._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeMl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeMl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedMl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedMl._(_root);
  @override
  late final _TranslationsDialogsAddFileMl addFile = _TranslationsDialogsAddFileMl._(_root);
  @override
  late final _TranslationsDialogsOpenFileMl openFile = _TranslationsDialogsOpenFileMl._(_root);
  @override
  late final _TranslationsDialogsAddressInputMl addressInput = _TranslationsDialogsAddressInputMl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionMl cancelSession = _TranslationsDialogsCancelSessionMl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileMl cannotOpenFile = _TranslationsDialogsCannotOpenFileMl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogMl favoriteDialog = _TranslationsDialogsFavoriteDialogMl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogMl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogMl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogMl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogMl._(_root);
  @override
  late final _TranslationsDialogsFileInfoMl fileInfo = _TranslationsDialogsFileInfoMl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputMl fileNameInput = _TranslationsDialogsFileNameInputMl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogMl historyClearDialog = _TranslationsDialogsHistoryClearDialogMl._(_root);
  @override
  late final _TranslationsDialogsMessageInputMl messageInput = _TranslationsDialogsMessageInputMl._(_root);
  @override
  late final _TranslationsDialogsNoFilesMl noFiles = _TranslationsDialogsNoFilesMl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionMl noPermission = _TranslationsDialogsNoPermissionMl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformMl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformMl._(_root);
  @override
  late final _TranslationsDialogsQrMl qr = _TranslationsDialogsQrMl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsMl quickActions = _TranslationsDialogsQuickActionsMl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeMl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeMl._(_root);
}

// Path: tray
class _TranslationsTrayMl extends TranslationsTrayEn {
  _TranslationsTrayMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get close => 'ഈ അപ്പ്ലിക്കേഷനിൽ നിന്നും പുറത്തു കടക്കുക';
  @override
  String get closeWindows => 'എക്സിറ്';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageMl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'സ്വകാര്യപ്രദർശനം';
  @override
  String get info =>
      'ഡിഫോൾട്ടായി, ലോക്കൽസെൻഡ് ലഭ്യമായ എല്ലാ നെറ്റ്‌വർക്ക് ഇന്റർഫേസുകളും ഉപയോഗിക്കുന്നു. നിങ്ങൾക്ക് ഇവിടെ ആവശ്യമില്ലാത്ത നെറ്റ്‌വർക്കുകൾ ഒഴിവാക്കാം. മാറ്റങ്ങൾ പ്രയോഗിക്കാൻ നിങ്ങൾ സെർവർ പുനരാരംഭിക്കേണ്ടതുണ്ട്.';
  @override
  String get title => 'നെറ്റ്‌വർക്ക് ഇന്റർഫേസുകൾ';
  @override
  String get whitelist => 'വൈറ്റ്‌ലിസ്റ്റ്';
  @override
  String get blacklist => 'ബ്ലാക്ക്‌ലിസ്റ്റ്';
}

// Path: sanitization
class _TranslationsSanitizationMl extends TranslationsSanitizationEn {
  _TranslationsSanitizationMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ഫയലിന്റെ പേര് ആവശ്യമാണ്';
  @override
  String get invalid => 'ഫയലിന്റെ പേരിൽ അംഗീകാരമില്ലാത്ത അക്ഷരങ്ങൾ ഉണ്ട്';
}

// Path: receivePage
class _TranslationsReceivePageMl extends TranslationsReceivePageEn {
  _TranslationsReceivePageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ml'))(
    n,
    one: 'നിങ്ങൾക്ക് ഒരു ഫയൽ അയയ്‌ക്കാൻ താൽപ്പര്യപ്പെടുന്നു',
    other: 'നിങ്ങൾക്ക് ${n} ഫയലുകൾ അയയ്‌ക്കാൻ താൽപ്പര്യപ്പെടുന്നു',
  );
  @override
  String get subTitleLink => 'നിങ്ങൾക്ക് ഒരു ലിങ്ക് അയച്ചു:';
  @override
  String get subTitleMessage => 'നിങ്ങൾക്ക് ഒരു സന്ദേശം അയച്ചു:';
  @override
  String get canceled => 'അയച്ചയാൾ റിക്വസ്റ്റ് റദ്ദാക്കിയിരിക്കുന്നു.';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageMl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsMl entryActions = _TranslationsReceiveHistoryPageEntryActionsMl._(_root);
  @override
  String get title => 'ഹിസ്റ്ററി';
  @override
  String get openFolder => 'ഫോൾഡർ തുറക്കുക';
  @override
  String get deleteHistory => 'ഹിസ്റ്ററി ഡിലീറ്റ് ചെയ്യുക';
  @override
  String get empty => 'ഹിസ്റ്ററി ശൂന്യമാണ്.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageMl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get saveToGalleryOff => 'ഫോൾഡറുകൾ ഉള്ളതിനാൽ ഓട്ടോമാറ്റിക്കായി ഓഫാക്കി.';
  @override
  String get title => 'ഓപ്ഷനുകൾ';
  @override
  String get appDirectory => '(ലോക്കൽസെൻഡ് ഫോൾഡർ)';
}

// Path: apkPickerPage
class _TranslationsApkPickerPageMl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get excludeSystemApps => 'സിസ്റ്റം ആപ്പുകൾ ഒഴിവാക്കുക';
  @override
  String get title => 'ആപ്പുകൾ (APK)';
  @override
  String get excludeAppsWithoutLaunchIntent => 'ലോഞ്ച് ചെയ്യാൻ കഴിയാത്ത ആപ്പുകൾ ഒഴിവാക്കുക';
  @override
  String apps({required Object n}) => '${n} ആപ്പുകൾ';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageMl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTroubleshootPageFirewallMl firewall = _TranslationsTroubleshootPageFirewallMl._(_root);
  @override
  String get title => 'ട്രബിൾഷൂട്ട് ചെയ്യുക';
  @override
  String get subTitle => 'ആപ്പ് പ്രതീക്ഷിച്ചതുപോലെ പ്രവർത്തിക്കുന്നില്ലേ? പ്രശ്‌നങ്ങൾക്കുള്ള പൊതുവായ ചില പരിഹാരങ്ങൾ ഇവിടെ കാണാം.';
  @override
  String get solution => 'പരിഹാരം:';
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryMl noDiscovery = _TranslationsTroubleshootPageNoDiscoveryMl._(_root);
  @override
  String get fixButton => 'ഓട്ടോമാറ്റിക്കായി ശരിയാക്കുക';
  @override
  late final _TranslationsTroubleshootPageNoConnectionMl noConnection = _TranslationsTroubleshootPageNoConnectionMl._(_root);
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageMl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'എല്ലാം ഡിലീറ്റ് ചെയ്യുക';
}

// Path: sendPage
class _TranslationsSendPageMl extends TranslationsSendPageEn {
  _TranslationsSendPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'പ്രതികരണത്തിനായി കാത്തിരിക്കുന്നു…';
  @override
  String get rejected => 'സ്വീകർത്താവ് അപേക്ഷ നിരസിച്ചിരിക്കുന്നു.';
  @override
  String get busy => 'സ്വീകർത്താവ് മറ്റൊരു അപേക്ഷ മൂലം തിരക്കിലാണ്.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
}

// Path: progressPage
class _TranslationsProgressPageMl extends TranslationsProgressPageEn {
  _TranslationsProgressPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ഫയലുകൾ അയയ്ക്കുന്നു';
  @override
  String get titleReceiving => 'ഫയലുകൾ സ്വീകരിക്കുന്നു';
  @override
  String get savedToGallery => 'ഫോട്ടോസിൽ സേവ് ചെയ്തു';
  @override
  late final _TranslationsProgressPageTotalMl total = _TranslationsProgressPageTotalMl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageMl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String pinHint({required Object pin}) => 'പിൻ ഇതാണ് "${pin}"';
  @override
  String get encryptionHint => 'ലോക്കൽസെൻഡ്‌ ഉപയോഗിക്കുന്നത് സ്വയം ഒപ്പു വച്ച സാക്ഷ്യപത്രം ആണ്. നിങ്ങളുടെ ബ്രൗസറിൽ ഇത് നിങ്ങൾ അംഗീകരിക്കണം.';
  @override
  String get title => 'ലിങ്ക് വഴി ഷെയർ ചെയ്യുക';
  @override
  String get loading => 'സെർവർ ആരംഭിക്കുന്നു…';
  @override
  String get stopping => 'സെർവർ നിർത്തുന്നു…';
  @override
  String get error => 'സെർവർ ആരംഭിക്കുന്നതിൽ തടസ്സം നേരിട്ടു.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ml'))(
    n,
    one: 'ഈ ലിങ്ക് നിങ്ങളുടെ ബ്രൗസറിൽ തുറക്കുക:',
    other: 'ഏതെങ്കിലും ഒരു ലിങ്ക് നിങ്ങളുടെ ബ്രൗസറിൽ തുറക്കുക:',
  );
  @override
  String get requests => 'അപേക്ഷകൾ';
  @override
  String get noRequests => 'അപേക്ഷകളൊന്നും ഇതുവരെ ഇല്ല.';
  @override
  String get autoAccept => 'ആട്ടോമാറ്റിക് ആയി അപേക്ഷകൾ സ്വീകരിക്കുക';
  @override
  String get requirePin => 'പിൻ ആവശ്യമാണ്';
  @override
  String pendingRequests({required Object n}) => 'തീരുമാനിക്കപ്പെടാത്ത അപേക്ഷകൾ: ${n}';
}

// Path: donationPage
class _TranslationsDonationPageMl extends TranslationsDonationPageEn {
  _TranslationsDonationPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'ലോക്കൽസെൻഡ്‌ സൗജന്യവും ഓപ്പൺ-സോഴ്സും പരസ്യങ്ങൾ ഇല്ലാത്തതും ആണ്. നിങ്ങൾക്കു ആപ്പ് ഇഷ്ടമായെങ്കിൽ ചെറിയ സംഭാവന നൽകി വികസനത്തിന് സഹായിക്കാവുന്നതാണ്.';
  @override
  String get title => 'സംഭാവന ചെയ്യുക';
  @override
  String donate({required Object amount}) => 'സംഭാവന ${amount}';
  @override
  String get thanks => 'ഒരുപാട് നന്ദിയുണ്ട്!';
  @override
  String get restore => 'വാങ്ങിയത് വീണ്ടെടുക്കുക';
}

// Path: aboutPage
class _TranslationsAboutPageMl extends TranslationsAboutPageEn {
  _TranslationsAboutPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get description => [
    'ഇന്റർനെറ്റ് കണക്ഷന്റെ ആവശ്യമില്ലാതെ ലോക്കൽ നെറ്റ്വർക്കിലൂടെ അടുത്തുള്ള ഡിവൈസുകളിലേക്ക് സുരക്ഷിതമായി ഫയലുകളും മെസ്സേജുകളും അയക്കാൻ അനുവദിക്കുന്ന ഒരു സൗജന്യ ഓപ്പൺ സോഴ്സ് ആപ്പ് ആണ് ലോക്കൽസെൻഡ്‌.',
    'ഈ ആപ്പ് ആൻഡ്രോയിഡ്, ഐഒഎസ്, മാക് ഒഎസ്, വിൻഡോസ് , ലിനക്സ് എന്നീ പ്ലാറ്റുഫോമുകളിൽ ലഭ്യമാണ് . എല്ലാവിധ ഡൌൺലോഡ് ഓപ്ഷൻസും ഔദ്യോഗിക ഹോം പേജിൽ കാണാവുന്നതാണ്.',
  ];
  @override
  String get title => 'ലോക്കൽസെൻഡിനെ കുറിച്ച്';
  @override
  String get author => 'ലേഖകൻ';
  @override
  String get contributors => 'സംഭാവന ചെയ്യുന്നവർ';
  @override
  String get packagers => 'സംയോജിപ്പിക്കുന്നവർ';
  @override
  String get translators => 'പരിഭാഷകർ';
}

// Path: changelogPage
class _TranslationsChangelogPageMl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'മാറ്റവിവരപട്ടിക';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionMl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'തിരഞ്ഞെടുക്കപ്പെട്ടത്';
  @override
  String files({required Object files}) => 'ഫയലുകൾ:${files}';
  @override
  String size({required Object size}) => 'വലുപ്പം : ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerMl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ഫയൽ';
  @override
  String get folder => 'ഫോൾഡർ';
  @override
  String get media => 'മീഡിയ';
  @override
  String get text => 'ടെക്സ്റ്റ്';
  @override
  String get app => 'ആപ്പ്';
  @override
  String get clipboard => 'പേസ്റ്റ്';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesMl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'സ്വീകരിക്കുന്നയാൾ';
  @override
  String get multiple => 'സ്വീകരിക്കുന്നവർ';
  @override
  String get link => 'ലിങ്ക് ഉപയോഗിച് ഷെയർ ചെയ്യുക';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxMl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'port:';
  @override
  String get alias => 'പേര് :';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveMl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'പ്രിയപ്പെട്ട';
  @override
  String get on => _root.general.on;
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralMl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get saveWindowPlacementWindows => 'എക്സിറ് ആയ ശേഷം ഇപ്പോൾ ഉള്ള വിൻഡോ പൊസിഷൻ സേവ് ചെയ്യുക';
  @override
  String get showInContextMenu => 'കണ്ടെക്സ്റ് മെനുവിൽ ഈ അപ്ലിക്കേഷൻ കാണിക്കുക';
  @override
  String get title => 'പൊതുവായത്';
  @override
  String get brightness => 'തീം';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsMl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsMl._(_root);
  @override
  String get color => 'നിറം';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsMl colorOptions = _TranslationsSettingsTabGeneralColorOptionsMl._(_root);
  @override
  String get language => 'ഭാഷ';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsMl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsMl._(_root);
  @override
  String get saveWindowPlacement => 'എക്സിറ് ആയ ശേഷം ഇപ്പോൾ ഉള്ള വിന്ഡോ പൊസിഷൻ സേവ് ചെയ്യുക';
  @override
  String get minimizeToTray => 'ക്ലോസ് ചെയ്യുന്ന സമയത്തു മെനുബാറിലേക്കോ/സിസ്റ്റം ട്രയിലേക്കോ മിനിമൈസ് ചെയ്യുക';
  @override
  String get launchAtStartup => 'ലോഗിൻ ആയ ശേഷം താനേ പ്രവർത്തിക്കുക';
  @override
  String get launchMinimized => 'താനെ പ്രവർത്തിക്കുക: തുടങ്ങുമ്പോൾ ഹൈഡ് ആയി തുടങ്ങുക';
  @override
  String get animations => 'അനിമേഷനുകൾ';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkMl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get needRestart => 'പതിയ മാറ്റങ്ങൾ അപ്ലൈ ചെയ്യാൻ സെർവർ റീസ്റ്റാർട്ട് ചെയ്യുക!';
  @override
  String get title => 'നെറ്റ്‌വർക്ക്';
  @override
  String get server => 'സെർവർ';
  @override
  String get deviceType => 'ഡിവൈസിന്റെ തരം';
  @override
  String get alias => 'ഡിവൈസിന്റെ പേര്';
  @override
  String get deviceModel => 'ഡിവൈസിന്റെ മോഡൽ';
  @override
  String get port => 'Port';
  @override
  String get network => 'നെറ്റ്‌വർക്ക്';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsMl networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsMl._(_root);
  @override
  String get discoveryTimeout => 'ഡിസ്കവർ ചെയ്യാനുള്ള സമയം കഴിഞ്ഞു';
  @override
  String get useSystemName => 'ഈ സിസ്റ്റത്തിന്റെ പേര് ഉപയോഗിക്കുക';
  @override
  String get generateRandomAlias => 'ഒരു ആകസ്മികമായ മറുപേർ ഉണ്ടാക്കുക';
  @override
  String portWarning({required Object defaultPort}) =>
      'നിങ്ങൾ ഒരു ഇഷ്ടാനുസൃത പോർട്ട് ഉപയോഗിക്കുന്നതിനാൽ മറ്റ് ഉപകരണങ്ങൾക്ക് നിങ്ങളെ കണ്ടെത്താൻ കഴിഞ്ഞേക്കില്ല. (default: ${defaultPort})';
  @override
  String get encryption => 'എൻക്രിപ്ഷൻ';
  @override
  String get multicastGroup => 'മൾട്ടികാസ്റ്റ് അഡ്രസ്സ്';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'നിങ്ങൾ ഒരു ഇഷ്ടാനുസൃത മൾട്ടികാസ്റ്റ് വിലാസം ഉപയോഗിക്കുന്നതിനാൽ മറ്റ് ഡിവൈസുകൾ നിങ്ങളെ കണ്ടെത്തിയേക്കില്ല. (default : ${defaultMulticast})';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveMl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get saveToGallery => 'മീഡിയ ഫയൽസ് ഗാലറിയിലേക്ക് സേവ് ചെയ്യുക';
  @override
  String get title => 'സ്വീകരിക്കുന്ന';
  @override
  String get autoFinish => 'ഓട്ടോമാറ്റിക് ആയി ഫിനിഷ് ചെയ്യുക';
  @override
  String get destination => 'ഫോൾഡറിലേക്കു സേവ് ചെയ്യുക';
  @override
  String get downloads => '(ഡൗൻലോഡ്)';
  @override
  String get saveToHistory => 'ഹിസ്റ്ററിയിലേക്കു സേവ് ചെയ്യുക';
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendMl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get shareViaLinkAutoAccept => '"ലിങ്ക് വഴി ഷെയർ" ചെയ്യുമ്പോൾ ഓട്ടോമാറ്റിക് ആയി സ്വീകരിക്കുക';
  @override
  String get title => 'അയക്കുക';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherMl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get privacyPolicy => 'സ്വകാര്യത നയം';
  @override
  String get support => 'ലോക്കൽ സെൻഡ് പിന്തുണ നൽകുക';
  @override
  String get donate => 'സംഭാവന ചെയ്യുക';
  @override
  String get termsOfUse => 'ഉപയോഗ നിബന്ധനകൾ';
  @override
  String get title => 'മറ്റുള്ളവ';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeMl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'നിങ്ങളുടെ ഫേവറൈറ്സ് ഉള്ള ഡിവൈസുകളിൽ നിന്നും ഓട്ടോമാറ്റിക് ആയി റിക്വസ്റ്റ് അക്സെപ്റ് ചെയ്യും.',
    'മുന്നറിയിപ്പ് ! നിങ്ങളുടെ ഡിവൈസിനെ കുറിച്ച ഡീറ്റൈൽ ആയി അറിയാവുന്ന ഒരു ഹാക്കർക്ക് ,നേരിട്ട് ഫയൽ നിങ്ങള്ക്ക് അയക്കാൻ പറ്റും.',
    'എന്നിരുന്നാലും , ഈ ഓപ്ഷൻ ലോക്കൽ നെറ്റ്‌വർക്കലെ എല്ലാവരെയും ഫയൽ സെൻറ് ചെയ്യാൻ അനുവദിക്കുന്നതിനേക്കാളും സേഫ് ആണ്.',
  ];
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpMl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get link => 'ലോക്കൽസെൻഡ്‌ ഇൻസ്റ്റാൾ ചെയ്തവർക് ഈ ലിങ്ക് ബ്രൗസറിൽ ഓപ്പൺ ചെയ്ത ഫയൽ ഡൌൺലോഡ് ചെയ്യാം.';
  @override
  String get title => 'അയക്കാൻ പറ്റുന്ന രീതികൾ';
  @override
  String get single => 'ഫയൽസ് എല്ലാം ഒരാൾക്ക് അയക്കുക, അയച്ചു കഴിഞ്ഞ ശേഷം സെക്ഷൻ ക്ലീൻ ചെയ്യപ്പെടും.';
  @override
  String get multiple => 'ഫയൽസ് കുറേപേർക്കു അയക്കുക, അയച്ചു കഴിഞ്ഞ ശേഷം സെക്ഷൻ ക്ലീൻ ചെയ്യപ്പെടില്ല .';
}

// Path: dialogs.pin
class _TranslationsDialogsPinMl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN എന്റർ ചെയ്യുക';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomMl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeMl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get content =>
      'എൻക്രിപ്ട് ചെയ്യാത്ത HTTP പ്രോട്ടോകോൾ വഴിയാണ് ഇപ്പോൾ ആശയ വിനിമയം നടക്കുന്നത്. HTTPS പ്രോട്ടോകോൾ ഉപയോഗിക്കാൻ എൻക്രിപ്ഷൻ ഓൺ ചെയ്യുക.';
  @override
  String get title => 'എൻക്രിപ്ഷൻ ഓഫ് ചെയ്തു';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedMl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get description =>
      'അനുവാദം ഇല്ലാതെ ലോക്കൽ നെറ്റ്‌വർക്ക് സ്കാൻ ചെയ്തു മറ്റു ഡിവൈസുകൾ കണ്ടുപിടിക്കാൻ ലോക്കൽസെന്റിന്‌ കഴിയില്ല. ദയവായി സെറ്റിങ്സിൽ ഇതിനുള്ള അനുവാദം നൽകുക.';
  @override
  String get gotoSettings => 'സജ്ജീകരണങ്ങൾ';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileMl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'തിരഞ്ഞെടുത്തതിലേക്കു ചേർക്കുക';
  @override
  String get content => 'എന്താണ് നിങ്ങൾക്കു ചേർക്കേണ്ടത്?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileMl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ തുറക്കുക';
  @override
  String get content => 'ലഭിച്ച ഫയൽ നിങ്ങൾക്കു തുറക്കണമോ?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputMl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'വിലാസം എഴുതുക';
  @override
  String get hashtag => 'ഹാഷ്ടാഗ്';
  @override
  String get ip => 'ഐ പി അഡ്രസ്';
  @override
  String get recentlyUsed => 'ഈയ്യിടെ ഉപയോഗിച്ചത്: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionMl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ കൈമാറ്റം റദ്ദാക്കുക';
  @override
  String get content => 'നിങ്ങൾക്കു തീർച്ചയായും ഫയലുകളുടെ കൈമാറ്റം റദ്ദാക്കണമോ?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileMl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ തുറക്കാൻ കഴിയുന്നില്ല';
  @override
  String content({required Object file}) =>
      '"${file}" തുറക്കാൻ കഴിയുന്നില്ല. ഈ ഫയൽ ഡിലീറ്റ് ചെയ്യുകയോ പേര് മാറ്റുകയോ മറ്റൊരിടത്തേക്ക് നീക്കുകയോ ചെയ്തിരിക്കുന്നുവോ?';
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogMl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫേവറിറ്റ്സ്';
  @override
  String get noFavorites => 'ഫേവറിറ്റ് ഡിവൈസുകൾ ഇതുവരെ ഇല്ല.';
  @override
  String get addFavorite => 'ചേർക്കുക';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogMl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫേവറിറ്റ്സിൽ നിന്ന് ഒഴിവാക്കുക';
  @override
  String content({required Object name}) => 'നിങ്ങൾക്കു തീർച്ചയായും "${name}" ഫേവറിറ്റ്സിൽ നിന്ന് ഒഴിവാക്കണമോ?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogMl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'ഫേവറിറ്റ്സിൽ ചേർക്കുക';
  @override
  String get titleEdit => 'സജ്ജീകരണങ്ങൾ';
  @override
  String get name => 'ഡിവൈസ് നാമം';
  @override
  String get ip => 'ഐ പി അഡ്രസ്';
  @override
  String get port => 'പോർട്ട്';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoMl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ വിവരങ്ങൾ';
  @override
  String get fileName => 'ഫയൽ നാമം:';
  @override
  String get path => 'പാത:';
  @override
  String get size => 'സൈസ്:';
  @override
  String get sender => 'അയക്കുന്നവൻ:';
  @override
  String get time => 'സമയം:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputMl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ നാമം എഴുതുക';
  @override
  String original({required Object original}) => 'ഒറിജിനൽ: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogMl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഹിസ്റ്ററി ക്ലിയർ ചെയ്യുക';
  @override
  String get content => 'നിങ്ങൾക്കു തീർച്ചയായും മുഴുവൻ ഹിസ്റ്ററി ഡിലീറ്റ് ചെയ്യണമോ?';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputMl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'സന്ദേശം ടൈപ്പ് ചെയ്യുക';
  @override
  String get multiline => 'ബഹുരേഖ';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesMl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയലുകളൊന്നും തിരഞ്ഞെടുത്തില്ല';
  @override
  String get content => 'ദയവായി ഒരു ഫയൽ എങ്കിലും തിരഞ്ഞെടുക്കുക.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionMl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'അനുവാദമില്ല';
  @override
  String get content => 'ആവശ്യമായ അനുമതികൾ നിങ്ങൾ അനുവദിച്ചിട്ടില്ല. ദയവായി സജ്ജീകരണങ്ങളിൽ അവ അനുവദിക്കുക.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformMl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ലഭ്യമല്ല';
  @override
  String get content => 'ഈ ഫീച്ചർ ലഭ്യമായത് ഇവിടെ മാത്രം:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrMl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ക്യു ആർ കോഡ്';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsMl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ചടുല പ്രവർത്തികൾ';
  @override
  String get counter => 'കൗണ്ടർ';
  @override
  String get sortBeforeCount => 'മുൻകൂട്ടി അകാരാദിക്രമത്തിൽ ഒത്തിരിക്കുക (A-Z)';
  @override
  String get random => 'ക്രമമില്ലാത്തത്';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeMl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get content =>
      'ഫയൽ അപേക്ഷകൾ ഇപ്പോൾ ഓട്ടോമാറ്റിക് ആയി അനുവദിക്കുന്നു. ലോക്കൽ നെറ്റ്‌വർക്കിലുള്ള എല്ലാവര്ക്കും നിങ്ങൾക്കു ഫയൽ അയക്കാൻ കഴിയും എന്ന ബോധ്യമുണ്ടായിരിക്കുക.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsMl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get info => 'വിവരങ്ങൾ';
  @override
  String get open => 'ഫയൽ തുറക്കുക';
  @override
  String get showInFolder => 'ഫോൾഡറിൽ കാണിക്കുക';
  @override
  String get deleteFromHistory => 'ഹിസ്റ്ററിയിൽ നിന്ന് ഡിലീറ്റ് ചെയ്യുക';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallMl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String solution({required Object port}) =>
      'ഇത് മിക്കവാറും ഒരു ഫയർവാൾ പ്രശ്നമാണ്. പോർട്ട് ${port}-ൽ ഇൻകമിംഗ് കണക്ഷനുകൾ (UDP, TCP) അനുവദിച്ചുകൊണ്ട് നിങ്ങൾക്ക് ഇത് പരിഹരിക്കാൻ കഴിയും.';
  @override
  String get symptom => 'ഈ ഡിവൈസിന് മറ്റ് ഡിവൈസുകളിലേക് ഫയലുകൾ അയയ്ക്കാൻ കഴിയും, എന്നാൽ മറ്റ് ഡിവൈസുകൾക്ക് ഈ ഡിവൈസിലേക്ക് ഫയലുകൾ അയയ്ക്കാൻ കഴിയില്ല.';
  @override
  String get openFirewall => 'ഫയർവാൾ തുറക്കുക';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryMl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ഈ ഡിവൈസിനു മറ്റ് ഡിവൈസുകൾ കണ്ടെത്താൻ കഴിയില്ല.';
  @override
  String get solution =>
      'ദയവായി എല്ലാ ഡിവൈസുകളും ഒരേ വൈഫൈ നെറ്റ്‌വർക്കിൽ ആണെന്നും ഒരേ കോൺഫിഗറേഷൻ(പോർട്ട്, മൾട്ടി കാസ്റ്റ് അഡ്രസ്സ്, എൻക്രിപ്ഷൻ) ആണെന്നും ഉറപ്പു വരുത്തുക. നിങ്ങൾ കണക്ട് ചെയ്യാൻ ശ്രമിക്കുന്ന ഡിവൈസിന്റെ ഐപി അഡ്രസ്സ് ടൈപ്പ് ചെയ്തു നോക്കാവുന്നതാണ്. ഇത് ഫലിക്കുക ആണെങ്കിൽ ഈ ഡിവൈസ് ഫേവറിറ്റ് ആയി സേവ് ചെയ്തു പിന്നീട് ഓട്ടോമാറ്റിക് ആയി കണക്ട് ചെയ്തു ഉപയോഗിക്കാവുന്നതാണ്.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionMl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ഇരു ഡിവൈസുകൾക്കും പരസ്പരം കണ്ടെത്താനോ ഫയലുകൾ അയക്കാനോ കഴിയില്ല.';
  @override
  String get solution =>
      'ഇരു ഭാഗങ്ങളിലും പ്രശ്നം ഉണ്ടോ? ഉണ്ടെങ്കിൽ, ദയവായി എല്ലാ ഡിവൈസുകളും ഒരേ വൈഫൈ നെറ്റ്‌വർക്കിൽ ആണെന്നും ഒരേ കോൺഫിഗറേഷൻ(പോർട്ട്, മൾട്ടി കാസ്റ്റ് അഡ്രസ്സ്, എൻക്രിപ്ഷൻ) ആണെന്നും ഉറപ്പു വരുത്തുക. അക്സസ്സ് പോയിന്റ്(എ.പി) ഐസൊലേഷൻ മൂലം പരസ്പരം ഉള്ള ആശയ വിനിമയം വൈഫൈ നെറ്റ്‌വർക്ക് അനുവദിക്കാതെ ഇരിക്കാൻ സാധ്യത ഉണ്ട്. അങ്ങനെ എങ്കിൽ ആ ഓപ്ഷൻ റൗട്ടറിൽ ഓഫ് ചെയ്തു വക്കേണ്ടതാണ്.';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalMl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleMl title = _TranslationsProgressPageTotalTitleMl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ഫയലുകൾ: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'വലിപ്പം: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'വേഗത: ${speed}/s';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsMl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
  @override
  String get dark => 'ഇരുണ്ട';
  @override
  String get light => 'വെളിച്ചമുള്ള';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsMl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsMl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsMl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'മുഴുവൻ';
  @override
  String get filtered => 'ഫിൽറ്റർ ചെയ്യപ്പെട്ട';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleMl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleMl._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'മുഴുവൻ പുരോഗതി (${time})';
  @override
  String get finishedError => 'തെറ്റുകളോടെ പൂർത്തിയാക്കി';
  @override
  String get canceledSender => 'അയക്കുന്നവൻ റദ്ധാക്കി';
  @override
  String get canceledReceiver => 'സ്വീകർത്താവ് റദ്ധാക്കി';
}
