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
  TranslationsMl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
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
}

// Path: general
class _TranslationsGeneralMl extends TranslationsGeneralEn {
  _TranslationsGeneralMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  String get hide => 'ഹൈഡ്';
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
  String get offline => 'ലഭ്യമല്ല';
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
  _TranslationsSendTabMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsReceiveTabMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsTabMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  String get title => 'സജ്ജീകരണങ്ങൾ';
  @override
  late final _TranslationsSettingsTabOtherMl other = _TranslationsSettingsTabOtherMl._(_root);
}

// Path: assetPicker
class _TranslationsAssetPickerMl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsWebMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeMl quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeMl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpMl sendModeHelp = _TranslationsDialogsSendModeHelpMl._(_root);
  @override
  late final _TranslationsDialogsPinMl pin = _TranslationsDialogsPinMl._(_root);
  @override
  late final _TranslationsDialogsZoomMl zoom = _TranslationsDialogsZoomMl._(_root);
}

// Path: tray
class _TranslationsTrayMl extends TranslationsTrayEn {
  _TranslationsTrayMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get close => 'ഈ അപ്പ്ലിക്കേഷനിൽ നിന്നും പുറത്തു കടക്കുക';
  @override
  String get closeWindows => 'എക്സിറ്';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageMl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'സ്വകാര്യപ്രദർശനം';
}

// Path: sanitization
class _TranslationsSanitizationMl extends TranslationsSanitizationEn {
  _TranslationsSanitizationMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ഫയലിന്റെ പേര് ആവശ്യമാണ്';
  @override
  String get invalid => 'ഫയലിന്റെ പേരിൽ അംഗീകാരമില്ലാത്ത അക്ഷരങ്ങൾ ഉണ്ട്';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionMl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'തിരഞ്ഞെടുക്കപ്പെട്ടത്';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerMl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSendTabSendModesMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsReceiveTabInfoBoxMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsReceiveTabQuickSaveMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get off => 'നിർത്തുക';
  @override
  String get favorites => 'പ്രത്യേകതാൽപര്യമുള്ള';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralMl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  String get color => 'നിറങ്ങൾ';
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
  _TranslationsSettingsTabNetworkMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get needRestart => 'പതിയ മാറ്റങ്ങൾ അപ്ലൈ ചെയ്യാൻ സെർവർ റീസ്റ്റാർട്ട് ചെയ്യുക!';
  @override
  String get title => 'നെറ്റ്‌വർക്ക്';
  @override
  String get server => 'സെർവർ';
  @override
  String get deviceType => 'ഈ ഡിവൈസിന്റെ തരം';
  @override
  String get alias => 'ഈ ഡിവൈസിന്റെ പേര്';
  @override
  String get deviceModel => 'ഈ ഡിവൈസിന്റെ മോഡൽ';
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
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveMl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendMl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get shareViaLinkAutoAccept => '"ലിങ്ക് വഴി ഷെയർ" ചെയ്യുമ്പോൾ ഓട്ടോമാറ്റിക് ആയി സ്വീകരിക്കുക';
  @override
  String get title => 'അയക്കുക';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherMl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get privacyPolicy => 'സ്വകാര്യത നയം';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeMl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsSendModeHelpMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsDialogsPinMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN എന്റർ ചെയ്യുക';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomMl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsMl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsTabGeneralColorOptionsMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsMl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsMl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsMl._(TranslationsMl root)
      : this._root = root,
        super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'മുഴുവൻ';
  @override
  String get filtered => 'ഫിൽറ്റർ ചെയ്യപ്പെട്ട';
}
