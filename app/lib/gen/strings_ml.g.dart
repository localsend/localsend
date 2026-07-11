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
class TranslationsMl extends Translations with BaseTranslations<AppLocale, Translations> {
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
  late final _Translations$general$ml general = _Translations$general$ml._(_root);
  @override
  String get appName => 'ലോക്കൽസെൻഡ്‌';
  @override
  String get locale => 'മലയാളം';
  @override
  late final _Translations$sendTab$ml sendTab = _Translations$sendTab$ml._(_root);
  @override
  late final _Translations$receiveTab$ml receiveTab = _Translations$receiveTab$ml._(_root);
  @override
  late final _Translations$settingsTab$ml settingsTab = _Translations$settingsTab$ml._(_root);
  @override
  late final _Translations$assetPicker$ml assetPicker = _Translations$assetPicker$ml._(_root);
  @override
  late final _Translations$web$ml web = _Translations$web$ml._(_root);
  @override
  late final _Translations$dialogs$ml dialogs = _Translations$dialogs$ml._(_root);
  @override
  late final _Translations$tray$ml tray = _Translations$tray$ml._(_root);
  @override
  late final _Translations$networkInterfacesPage$ml networkInterfacesPage = _Translations$networkInterfacesPage$ml._(_root);
  @override
  late final _Translations$sanitization$ml sanitization = _Translations$sanitization$ml._(_root);
  @override
  late final _Translations$receivePage$ml receivePage = _Translations$receivePage$ml._(_root);
  @override
  late final _Translations$receiveHistoryPage$ml receiveHistoryPage = _Translations$receiveHistoryPage$ml._(_root);
  @override
  late final _Translations$receiveOptionsPage$ml receiveOptionsPage = _Translations$receiveOptionsPage$ml._(_root);
  @override
  late final _Translations$apkPickerPage$ml apkPickerPage = _Translations$apkPickerPage$ml._(_root);
  @override
  late final _Translations$troubleshootPage$ml troubleshootPage = _Translations$troubleshootPage$ml._(_root);
  @override
  late final _Translations$selectedFilesPage$ml selectedFilesPage = _Translations$selectedFilesPage$ml._(_root);
  @override
  late final _Translations$sendPage$ml sendPage = _Translations$sendPage$ml._(_root);
  @override
  late final _Translations$progressPage$ml progressPage = _Translations$progressPage$ml._(_root);
  @override
  late final _Translations$webSharePage$ml webSharePage = _Translations$webSharePage$ml._(_root);
  @override
  late final _Translations$donationPage$ml donationPage = _Translations$donationPage$ml._(_root);
  @override
  late final _Translations$aboutPage$ml aboutPage = _Translations$aboutPage$ml._(_root);
  @override
  late final _Translations$changelogPage$ml changelogPage = _Translations$changelogPage$ml._(_root);
}

// Path: general
class _Translations$general$ml extends Translations$general$en {
  _Translations$general$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$ml extends Translations$sendTab$en {
  _Translations$sendTab$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get shareIntentInfo => 'താങ്കൾക്ക് മൊബൈലിലെ ഷെയർ ഫീച്ചർ ഉപയോഗിച്ചു എളുപ്പത്തിൽ ഫയൽസ് സെലക്ട് ചെയ്യാം.';
  @override
  String get title => 'അയക്കുക';
  @override
  late final _Translations$sendTab$selection$ml selection = _Translations$sendTab$selection$ml._(_root);
  @override
  late final _Translations$sendTab$picker$ml picker = _Translations$sendTab$picker$ml._(_root);
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
  late final _Translations$sendTab$sendModes$ml sendModes = _Translations$sendTab$sendModes$ml._(_root);
  @override
  String get sendModeHelp => 'വിശദീകരണം';
  @override
  String get help => 'ലഭിക്കേണ്ടയാളും ഒരേ WIFI യിൽ കണക്റ്റഡ് ആണെന്ന് ഉറപ്പു വരുത്തുക.';
  @override
  String get placeItems => 'ഷെയർ ചെയ്യേണ്ട ഐറ്റംസ് ഇടുക.';
}

// Path: receiveTab
class _Translations$receiveTab$ml extends Translations$receiveTab$en {
  _Translations$receiveTab$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'സ്വീകരിക്കുക';
  @override
  late final _Translations$receiveTab$infoBox$ml infoBox = _Translations$receiveTab$infoBox$ml._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ml quickSave = _Translations$receiveTab$quickSave$ml._(_root);
}

// Path: settingsTab
class _Translations$settingsTab$ml extends Translations$settingsTab$en {
  _Translations$settingsTab$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$settingsTab$general$ml general = _Translations$settingsTab$general$ml._(_root);
  @override
  late final _Translations$settingsTab$network$ml network = _Translations$settingsTab$network$ml._(_root);
  @override
  late final _Translations$settingsTab$receive$ml receive = _Translations$settingsTab$receive$ml._(_root);
  @override
  late final _Translations$settingsTab$send$ml send = _Translations$settingsTab$send$ml._(_root);
  @override
  String get title => 'ക്രമീകരണങ്ങൾ';
  @override
  late final _Translations$settingsTab$other$ml other = _Translations$settingsTab$other$ml._(_root);
  @override
  String get advancedSettings => 'അഡ്വാൻസ്‌ഡ് ക്രമീകരണങ്ങൾ';
}

// Path: assetPicker
class _Translations$assetPicker$ml extends Translations$assetPicker$en {
  _Translations$assetPicker$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$web$ml extends Translations$web$en {
  _Translations$web$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$ml extends Translations$dialogs$en {
  _Translations$dialogs$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ml quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ml._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ml sendModeHelp = _Translations$dialogs$sendModeHelp$ml._(_root);
  @override
  late final _Translations$dialogs$pin$ml pin = _Translations$dialogs$pin$ml._(_root);
  @override
  late final _Translations$dialogs$zoom$ml zoom = _Translations$dialogs$zoom$ml._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ml encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ml._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ml localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ml._(_root);
  @override
  late final _Translations$dialogs$addFile$ml addFile = _Translations$dialogs$addFile$ml._(_root);
  @override
  late final _Translations$dialogs$openFile$ml openFile = _Translations$dialogs$openFile$ml._(_root);
  @override
  late final _Translations$dialogs$addressInput$ml addressInput = _Translations$dialogs$addressInput$ml._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ml cancelSession = _Translations$dialogs$cancelSession$ml._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ml cannotOpenFile = _Translations$dialogs$cannotOpenFile$ml._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ml favoriteDialog = _Translations$dialogs$favoriteDialog$ml._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ml favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ml._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ml favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ml._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ml fileInfo = _Translations$dialogs$fileInfo$ml._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ml fileNameInput = _Translations$dialogs$fileNameInput$ml._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ml historyClearDialog = _Translations$dialogs$historyClearDialog$ml._(_root);
  @override
  late final _Translations$dialogs$messageInput$ml messageInput = _Translations$dialogs$messageInput$ml._(_root);
  @override
  late final _Translations$dialogs$noFiles$ml noFiles = _Translations$dialogs$noFiles$ml._(_root);
  @override
  late final _Translations$dialogs$noPermission$ml noPermission = _Translations$dialogs$noPermission$ml._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ml notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ml._(_root);
  @override
  late final _Translations$dialogs$qr$ml qr = _Translations$dialogs$qr$ml._(_root);
  @override
  late final _Translations$dialogs$quickActions$ml quickActions = _Translations$dialogs$quickActions$ml._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ml quickSaveNotice = _Translations$dialogs$quickSaveNotice$ml._(_root);
}

// Path: tray
class _Translations$tray$ml extends Translations$tray$en {
  _Translations$tray$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get close => 'ഈ അപ്പ്ലിക്കേഷനിൽ നിന്നും പുറത്തു കടക്കുക';
  @override
  String get closeWindows => 'എക്സിറ്';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ml extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$sanitization$ml extends Translations$sanitization$en {
  _Translations$sanitization$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ഫയലിന്റെ പേര് ആവശ്യമാണ്';
  @override
  String get invalid => 'ഫയലിന്റെ പേരിൽ അംഗീകാരമില്ലാത്ത അക്ഷരങ്ങൾ ഉണ്ട്';
}

// Path: receivePage
class _Translations$receivePage$ml extends Translations$receivePage$en {
  _Translations$receivePage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$receiveHistoryPage$ml extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$receiveHistoryPage$entryActions$ml entryActions = _Translations$receiveHistoryPage$entryActions$ml._(_root);
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
class _Translations$receiveOptionsPage$ml extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$apkPickerPage$ml extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$ml extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$troubleshootPage$firewall$ml firewall = _Translations$troubleshootPage$firewall$ml._(_root);
  @override
  String get title => 'ട്രബിൾഷൂട്ട് ചെയ്യുക';
  @override
  String get subTitle => 'ആപ്പ് പ്രതീക്ഷിച്ചതുപോലെ പ്രവർത്തിക്കുന്നില്ലേ? പ്രശ്‌നങ്ങൾക്കുള്ള പൊതുവായ ചില പരിഹാരങ്ങൾ ഇവിടെ കാണാം.';
  @override
  String get solution => 'പരിഹാരം:';
  @override
  late final _Translations$troubleshootPage$noDiscovery$ml noDiscovery = _Translations$troubleshootPage$noDiscovery$ml._(_root);
  @override
  String get fixButton => 'ഓട്ടോമാറ്റിക്കായി ശരിയാക്കുക';
  @override
  late final _Translations$troubleshootPage$noConnection$ml noConnection = _Translations$troubleshootPage$noConnection$ml._(_root);
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ml extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'എല്ലാം ഡിലീറ്റ് ചെയ്യുക';
}

// Path: sendPage
class _Translations$sendPage$ml extends Translations$sendPage$en {
  _Translations$sendPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$ml extends Translations$progressPage$en {
  _Translations$progressPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ഫയലുകൾ അയയ്ക്കുന്നു';
  @override
  String get titleReceiving => 'ഫയലുകൾ സ്വീകരിക്കുന്നു';
  @override
  String get savedToGallery => 'ഫോട്ടോസിൽ സേവ് ചെയ്തു';
  @override
  late final _Translations$progressPage$total$ml total = _Translations$progressPage$total$ml._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ml extends Translations$webSharePage$en {
  _Translations$webSharePage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$ml extends Translations$donationPage$en {
  _Translations$donationPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$ml extends Translations$aboutPage$en {
  _Translations$aboutPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$ml extends Translations$changelogPage$en {
  _Translations$changelogPage$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'മാറ്റവിവരപട്ടിക';
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ml extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$ml extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$ml extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$ml extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$ml extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$ml extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$general$brightnessOptions$ml brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ml._(
    _root,
  );
  @override
  String get color => 'നിറം';
  @override
  late final _Translations$settingsTab$general$colorOptions$ml colorOptions = _Translations$settingsTab$general$colorOptions$ml._(_root);
  @override
  String get language => 'ഭാഷ';
  @override
  late final _Translations$settingsTab$general$languageOptions$ml languageOptions = _Translations$settingsTab$general$languageOptions$ml._(_root);
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
class _Translations$settingsTab$network$ml extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$ml networkOptions = _Translations$settingsTab$network$networkOptions$ml._(_root);
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
class _Translations$settingsTab$receive$ml extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$ml extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get shareViaLinkAutoAccept => '"ലിങ്ക് വഴി ഷെയർ" ചെയ്യുമ്പോൾ ഓട്ടോമാറ്റിക് ആയി സ്വീകരിക്കുക';
  @override
  String get title => 'അയക്കുക';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ml extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveFromFavoritesNotice$ml extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$sendModeHelp$ml extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$ml extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN എന്റർ ചെയ്യുക';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ml extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ml extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get content =>
      'എൻക്രിപ്ട് ചെയ്യാത്ത HTTP പ്രോട്ടോകോൾ വഴിയാണ് ഇപ്പോൾ ആശയ വിനിമയം നടക്കുന്നത്. HTTPS പ്രോട്ടോകോൾ ഉപയോഗിക്കാൻ എൻക്രിപ്ഷൻ ഓൺ ചെയ്യുക.';
  @override
  String get title => 'എൻക്രിപ്ഷൻ ഓഫ് ചെയ്തു';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ml extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get description =>
      'അനുവാദം ഇല്ലാതെ ലോക്കൽ നെറ്റ്‌വർക്ക് സ്കാൻ ചെയ്തു മറ്റു ഡിവൈസുകൾ കണ്ടുപിടിക്കാൻ ലോക്കൽസെന്റിന്‌ കഴിയില്ല. ദയവായി സെറ്റിങ്സിൽ ഇതിനുള്ള അനുവാദം നൽകുക.';
  @override
  String get gotoSettings => 'സജ്ജീകരണങ്ങൾ';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ml extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'തിരഞ്ഞെടുത്തതിലേക്കു ചേർക്കുക';
  @override
  String get content => 'എന്താണ് നിങ്ങൾക്കു ചേർക്കേണ്ടത്?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ml extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ തുറക്കുക';
  @override
  String get content => 'ലഭിച്ച ഫയൽ നിങ്ങൾക്കു തുറക്കണമോ?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ml extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$ml extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ കൈമാറ്റം റദ്ദാക്കുക';
  @override
  String get content => 'നിങ്ങൾക്കു തീർച്ചയായും ഫയലുകളുടെ കൈമാറ്റം റദ്ദാക്കണമോ?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ml extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ തുറക്കാൻ കഴിയുന്നില്ല';
  @override
  String content({required Object file}) =>
      '"${file}" തുറക്കാൻ കഴിയുന്നില്ല. ഈ ഫയൽ ഡിലീറ്റ് ചെയ്യുകയോ പേര് മാറ്റുകയോ മറ്റൊരിടത്തേക്ക് നീക്കുകയോ ചെയ്തിരിക്കുന്നുവോ?';
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ml extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$ml extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫേവറിറ്റ്സിൽ നിന്ന് ഒഴിവാക്കുക';
  @override
  String content({required Object name}) => 'നിങ്ങൾക്കു തീർച്ചയായും "${name}" ഫേവറിറ്റ്സിൽ നിന്ന് ഒഴിവാക്കണമോ?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ml extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$ml extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$ml extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയൽ നാമം എഴുതുക';
  @override
  String original({required Object original}) => 'ഒറിജിനൽ: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ml extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഹിസ്റ്ററി ക്ലിയർ ചെയ്യുക';
  @override
  String get content => 'നിങ്ങൾക്കു തീർച്ചയായും മുഴുവൻ ഹിസ്റ്ററി ഡിലീറ്റ് ചെയ്യണമോ?';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ml extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'സന്ദേശം ടൈപ്പ് ചെയ്യുക';
  @override
  String get multiline => 'ബഹുരേഖ';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ml extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ഫയലുകളൊന്നും തിരഞ്ഞെടുത്തില്ല';
  @override
  String get content => 'ദയവായി ഒരു ഫയൽ എങ്കിലും തിരഞ്ഞെടുക്കുക.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ml extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'അനുവാദമില്ല';
  @override
  String get content => 'ആവശ്യമായ അനുമതികൾ നിങ്ങൾ അനുവദിച്ചിട്ടില്ല. ദയവായി സജ്ജീകരണങ്ങളിൽ അവ അനുവദിക്കുക.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ml extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ലഭ്യമല്ല';
  @override
  String get content => 'ഈ ഫീച്ചർ ലഭ്യമായത് ഇവിടെ മാത്രം:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ml extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ക്യു ആർ കോഡ്';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ml extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$ml extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get content =>
      'ഫയൽ അപേക്ഷകൾ ഇപ്പോൾ ഓട്ടോമാറ്റിക് ആയി അനുവദിക്കുന്നു. ലോക്കൽ നെറ്റ്‌വർക്കിലുള്ള എല്ലാവര്ക്കും നിങ്ങൾക്കു ഫയൽ അയക്കാൻ കഴിയും എന്ന ബോധ്യമുണ്ടായിരിക്കുക.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ml extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$ml extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$noDiscovery$ml extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ഈ ഡിവൈസിനു മറ്റ് ഡിവൈസുകൾ കണ്ടെത്താൻ കഴിയില്ല.';
  @override
  String get solution =>
      'ദയവായി എല്ലാ ഡിവൈസുകളും ഒരേ വൈഫൈ നെറ്റ്‌വർക്കിൽ ആണെന്നും ഒരേ കോൺഫിഗറേഷൻ(പോർട്ട്, മൾട്ടി കാസ്റ്റ് അഡ്രസ്സ്, എൻക്രിപ്ഷൻ) ആണെന്നും ഉറപ്പു വരുത്തുക. നിങ്ങൾ കണക്ട് ചെയ്യാൻ ശ്രമിക്കുന്ന ഡിവൈസിന്റെ ഐപി അഡ്രസ്സ് ടൈപ്പ് ചെയ്തു നോക്കാവുന്നതാണ്. ഇത് ഫലിക്കുക ആണെങ്കിൽ ഈ ഡിവൈസ് ഫേവറിറ്റ് ആയി സേവ് ചെയ്തു പിന്നീട് ഓട്ടോമാറ്റിക് ആയി കണക്ട് ചെയ്തു ഉപയോഗിക്കാവുന്നതാണ്.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ml extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'ഇരു ഡിവൈസുകൾക്കും പരസ്പരം കണ്ടെത്താനോ ഫയലുകൾ അയക്കാനോ കഴിയില്ല.';
  @override
  String get solution =>
      'ഇരു ഭാഗങ്ങളിലും പ്രശ്നം ഉണ്ടോ? ഉണ്ടെങ്കിൽ, ദയവായി എല്ലാ ഡിവൈസുകളും ഒരേ വൈഫൈ നെറ്റ്‌വർക്കിൽ ആണെന്നും ഒരേ കോൺഫിഗറേഷൻ(പോർട്ട്, മൾട്ടി കാസ്റ്റ് അഡ്രസ്സ്, എൻക്രിപ്ഷൻ) ആണെന്നും ഉറപ്പു വരുത്തുക. അക്സസ്സ് പോയിന്റ്(എ.പി) ഐസൊലേഷൻ മൂലം പരസ്പരം ഉള്ള ആശയ വിനിമയം വൈഫൈ നെറ്റ്‌വർക്ക് അനുവദിക്കാതെ ഇരിക്കാൻ സാധ്യത ഉണ്ട്. അങ്ങനെ എങ്കിൽ ആ ഓപ്ഷൻ റൗട്ടറിൽ ഓഫ് ചെയ്തു വക്കേണ്ടതാണ്.';
}

// Path: progressPage.total
class _Translations$progressPage$total$ml extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ml title = _Translations$progressPage$total$title$ml._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ഫയലുകൾ: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'വലിപ്പം: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'വേഗത: ${speed}/s';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ml extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$ml extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ml extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'സിസ്റ്റം';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ml extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ml._(TranslationsMl root) : this._root = root, super.internal(root);

  final TranslationsMl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'മുഴുവൻ';
  @override
  String get filtered => 'ഫിൽറ്റർ ചെയ്യപ്പെട്ട';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ml extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ml._(TranslationsMl root) : this._root = root, super.internal(root);

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
