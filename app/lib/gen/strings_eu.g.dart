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
class TranslationsEu extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.eu,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <eu>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEu _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Euskara';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralEu general = _TranslationsGeneralEu._(_root);
  @override
  late final _TranslationsReceiveTabEu receiveTab = _TranslationsReceiveTabEu._(_root);
  @override
  late final _TranslationsSendTabEu sendTab = _TranslationsSendTabEu._(_root);
  @override
  late final _TranslationsSettingsTabEu settingsTab = _TranslationsSettingsTabEu._(_root);
  @override
  late final _TranslationsTroubleshootPageEu troubleshootPage = _TranslationsTroubleshootPageEu._(_root);
  @override
  late final _TranslationsReceiveHistoryPageEu receiveHistoryPage = _TranslationsReceiveHistoryPageEu._(_root);
  @override
  late final _TranslationsApkPickerPageEu apkPickerPage = _TranslationsApkPickerPageEu._(_root);
  @override
  late final _TranslationsSelectedFilesPageEu selectedFilesPage = _TranslationsSelectedFilesPageEu._(_root);
  @override
  late final _TranslationsReceivePageEu receivePage = _TranslationsReceivePageEu._(_root);
  @override
  late final _TranslationsReceiveOptionsPageEu receiveOptionsPage = _TranslationsReceiveOptionsPageEu._(_root);
  @override
  late final _TranslationsSendPageEu sendPage = _TranslationsSendPageEu._(_root);
  @override
  late final _TranslationsProgressPageEu progressPage = _TranslationsProgressPageEu._(_root);
  @override
  late final _TranslationsWebSharePageEu webSharePage = _TranslationsWebSharePageEu._(_root);
  @override
  late final _TranslationsAboutPageEu aboutPage = _TranslationsAboutPageEu._(_root);
  @override
  late final _TranslationsChangelogPageEu changelogPage = _TranslationsChangelogPageEu._(_root);
  @override
  late final _TranslationsAliasGeneratorEu aliasGenerator = _TranslationsAliasGeneratorEu._(_root);
  @override
  late final _TranslationsDialogsEu dialogs = _TranslationsDialogsEu._(_root);
  @override
  late final _TranslationsTrayEu tray = _TranslationsTrayEu._(_root);
  @override
  late final _TranslationsWebEu web = _TranslationsWebEu._(_root);
  @override
  late final _TranslationsAssetPickerEu assetPicker = _TranslationsAssetPickerEu._(_root);
}

// Path: general
class _TranslationsGeneralEu extends TranslationsGeneralEn {
  _TranslationsGeneralEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Onartu';
  @override
  String get accepted => 'Onartuta';
  @override
  String get add => 'Gehitu';
  @override
  String get advanced => 'Aurreratua';
  @override
  String get cancel => 'Utzi';
  @override
  String get close => 'Itxi';
  @override
  String get confirm => 'Baieztatu';
  @override
  String get continueStr => 'Jarraitu';
  @override
  String get copy => 'Kopiatu';
  @override
  String get copiedToClipboard => 'Arbelean kopiatua';
  @override
  String get decline => 'Ez onartu';
  @override
  String get done => 'Egina';
  @override
  String get delete => 'Ezabatu';
  @override
  String get edit => 'Editatu';
  @override
  String get error => 'Errorea';
  @override
  String get example => 'Adibidea';
  @override
  String get files => 'Fitxategiak';
  @override
  String get finished => 'Amaituta';
  @override
  String get hide => 'Ezkutatu';
  @override
  String get off => 'Itzalita';
  @override
  String get offline => 'Deskonektatua';
  @override
  String get on => 'Piztuta';
  @override
  String get online => 'Online';
  @override
  String get open => 'Ireki';
  @override
  String get queue => 'Ilara';
  @override
  String get quickSave => 'Gordetze Azkarra';
  @override
  String get renamed => 'Berizendatua';
  @override
  String get reset => 'Berrezarri';
  @override
  String get restart => 'Berrasieratu';
  @override
  String get settings => 'Aukerak';
  @override
  String get skipped => 'Utzita';
  @override
  String get start => 'Hasieratu';
  @override
  String get stop => 'Gelditu';
  @override
  String get save => 'Gorde';
  @override
  String get unchanged => 'Aldaketarik gabe';
  @override
  String get unknown => 'Ezezaguna';
  @override
  String get noItemInClipboard => 'Elementua ez dago arbeletan';
}

// Path: receiveTab
class _TranslationsReceiveTabEu extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eskuratu';
  @override
  late final _TranslationsReceiveTabInfoBoxEu infoBox = _TranslationsReceiveTabInfoBoxEu._(_root);
}

// Path: sendTab
class _TranslationsSendTabEu extends TranslationsSendTabEn {
  _TranslationsSendTabEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bidali';
  @override
  late final _TranslationsSendTabSelectionEu selection = _TranslationsSendTabSelectionEu._(_root);
  @override
  late final _TranslationsSendTabPickerEu picker = _TranslationsSendTabPickerEu._(_root);
  @override
  String get shareIntentInfo => 'Zure gailuko "Elkarbanatu" aukera ere erabil dezakezu fitxategi gehiago errezago aukeratzeko.';
  @override
  String get nearbyDevices => 'Inguruko Gailuak';
  @override
  String get thisDevice => 'Gailu hau';
  @override
  String get scan => 'Bilatu gailuak';
  @override
  String get sendMode => 'Bidalketa modua';
  @override
  late final _TranslationsSendTabSendModesEu sendModes = _TranslationsSendTabSendModesEu._(_root);
  @override
  String get sendModeHelp => 'Azalpena';
  @override
  String get help => 'Ziurtatu zaitez aukeratutako hartzailea zure Wi-Fi sare berean dagoela.';
  @override
  String get placeItems => 'Aukeratu elkarbanatzeko elementuak.';
}

// Path: settingsTab
class _TranslationsSettingsTabEu extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezarpenak';
  @override
  late final _TranslationsSettingsTabGeneralEu general = _TranslationsSettingsTabGeneralEu._(_root);
  @override
  late final _TranslationsSettingsTabReceiveEu receive = _TranslationsSettingsTabReceiveEu._(_root);
  @override
  late final _TranslationsSettingsTabNetworkEu network = _TranslationsSettingsTabNetworkEu._(_root);
  @override
  String get advancedSettings => 'Ezarpen aurreratuak';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageEu extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Konpondu arazoak';
  @override
  String get subTitle => 'Aplikazioa ez dabil espero bezala? Hemen arazo arrunten konponbidea aurki dezakezu.';
  @override
  String get solution => 'Konponbidea:';
  @override
  String get fixButton => 'Konpondu automatikoki';
  @override
  late final _TranslationsTroubleshootPageFirewallEu firewall = _TranslationsTroubleshootPageFirewallEu._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionEu noConnection = _TranslationsTroubleshootPageNoConnectionEu._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageEu extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historia';
  @override
  String get openFolder => 'Ireki direktorioa';
  @override
  String get deleteHistory => 'Ezabatu historia';
  @override
  String get empty => 'Historia hutsik dago.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsEu entryActions = _TranslationsReceiveHistoryPageEntryActionsEu._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageEu extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'App-ak (APK)';
  @override
  String get excludeSystemApps => 'Baztertu sistemako app-ak';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Baztertu exekutatu ezin diren app-ak';
  @override
  String apps({required Object n}) => '${n} App-ak';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageEu extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Ezabatu dena';
}

// Path: receivePage
class _TranslationsReceivePageEu extends TranslationsReceivePageEn {
  _TranslationsReceivePageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    n,
    one: '-(e)k fitxategi bat bidali nahi dizu',
    other: '-(e)k ${n} fitxategi bidali nahi dizkizu',
  );
  @override
  String get subTitleMessage => '-(e)k mezu bat bidali dizu:';
  @override
  String get subTitleLink => '-(e)k lotura bat bidali dizu:';
  @override
  String get canceled => 'Bidaltzaileak bidalketa bertan behera utzi du.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageEu extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezarpenak';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(directorio ${_root.appName})';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Direktorioak daudelako desaktibatua.';
}

// Path: sendPage
class _TranslationsSendPageEu extends TranslationsSendPageEn {
  _TranslationsSendPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Erantzunaren zai...';
  @override
  String get rejected => 'Hartzaileak ez du bidalketa onartu.';
  @override
  String get busy => 'Hartzailea beste bidalketa batekin okupatuta dago.';
}

// Path: progressPage
class _TranslationsProgressPageEu extends TranslationsProgressPageEn {
  _TranslationsProgressPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Fitxategiak bidaltzen';
  @override
  String get titleReceiving => 'Fitxategiak eskuratzen';
  @override
  String get savedToGallery => 'Galerian gordeta';
  @override
  late final _TranslationsProgressPageTotalEu total = _TranslationsProgressPageTotalEu._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageEu extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Loturaren bidez elkarbanatu';
  @override
  String get loading => 'Hasieratu zerbitzaria...';
  @override
  String get stopping => 'Gelditu zerbitzaria...';
  @override
  String get error => 'Zerbitzaria hasieratzean arazo bat gertatu da.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    n,
    one: 'Ireki lotura nabigatzailean:',
    other: 'Ireki hauetako lotura bat nabigatzailean:',
  );
  @override
  String get requests => 'Eskerak';
  @override
  String get noRequests => 'Oraindik ez dago eskaerarik.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get encryptionHint => 'LocalSend-ek autosinatutako zertifikatuak erabiltzen ditu. Nabigatzailean onartu behar duzu';
  @override
  String pendingRequests({required Object n}) => 'Eskerak: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageEu extends TranslationsAboutPageEn {
  _TranslationsAboutPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend buruz';
}

// Path: changelogPage
class _TranslationsChangelogPageEu extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aldaketak';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorEu extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsEu extends TranslationsDialogsEn {
  _TranslationsDialogsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileEu addFile = _TranslationsDialogsAddFileEu._(_root);
  @override
  late final _TranslationsDialogsAddressInputEu addressInput = _TranslationsDialogsAddressInputEu._(_root);
  @override
  late final _TranslationsDialogsCancelSessionEu cancelSession = _TranslationsDialogsCancelSessionEu._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileEu cannotOpenFile = _TranslationsDialogsCannotOpenFileEu._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeEu encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeEu._(_root);
  @override
  late final _TranslationsDialogsErrorDialogEu errorDialog = _TranslationsDialogsErrorDialogEu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogEu favoriteDialog = _TranslationsDialogsFavoriteDialogEu._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogEu favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogEu._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogEu favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogEu._(_root);
  @override
  late final _TranslationsDialogsFileInfoEu fileInfo = _TranslationsDialogsFileInfoEu._(_root);
  @override
  late final _TranslationsDialogsFileNameInputEu fileNameInput = _TranslationsDialogsFileNameInputEu._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedEu localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedEu._(_root);
  @override
  late final _TranslationsDialogsMessageInputEu messageInput = _TranslationsDialogsMessageInputEu._(_root);
  @override
  late final _TranslationsDialogsNoFilesEu noFiles = _TranslationsDialogsNoFilesEu._(_root);
  @override
  late final _TranslationsDialogsNoPermissionEu noPermission = _TranslationsDialogsNoPermissionEu._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformEu notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformEu._(_root);
  @override
  late final _TranslationsDialogsQrEu qr = _TranslationsDialogsQrEu._(_root);
  @override
  late final _TranslationsDialogsQuickActionsEu quickActions = _TranslationsDialogsQuickActionsEu._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeEu quickSaveNotice = _TranslationsDialogsQuickSaveNoticeEu._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpEu sendModeHelp = _TranslationsDialogsSendModeHelpEu._(_root);
}

// Path: tray
class _TranslationsTrayEu extends TranslationsTrayEn {
  _TranslationsTrayEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Itxi LocalSend';
}

// Path: web
class _TranslationsWebEu extends TranslationsWebEn {
  _TranslationsWebEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get rejected => 'Bertan behera utzita';
  @override
  String get files => 'Fitxategiak';
  @override
  String get fileName => 'Fitxateig izena';
  @override
  String get size => 'Tamaina';
}

// Path: assetPicker
class _TranslationsAssetPickerEu extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Baieztatu';
  @override
  String get cancel => 'Utzi';
  @override
  String get edit => 'Editatu';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Akatsa kargatzen';
  @override
  String get original => 'Jatorrizkoa';
  @override
  String get preview => 'Aurrebista';
  @override
  String get select => 'Aukeratu';
  @override
  String get emptyList => 'Zerrenda hutsik';
  @override
  String get unSupportedAssetType => 'Fitxategi mota ez onartua.';
  @override
  String get unableToAccessAll => 'Ezin da gailuko fitxategietara atzitu.';
  @override
  String get viewingLimitedAssetsTip => 'Ikusi bakarrik aplikazioarentzat eskuragarri dauden fitxategi eta albumak.';
  @override
  String get changeAccessibleLimitedAssets => 'Egin klik eskuragarri dauden fitxategiak eguneratzeko';
  @override
  String get accessAllTip =>
      'Aplikazioak gailu fitxategi batzuk bakarrik atzitu ditzake. Joan sistemako ezarpenetara eta eman aplikazioari media fitxategi guztiak atzitzeko baimena';
  @override
  String get goToSystemSettings => 'Joan sistemako ezarpenetara';
  @override
  String get accessLimitedAssets => 'Jarraitu atzipen mugatuarekin';
  @override
  String get accessiblePathName => 'Eskuragarri dauden fitxategiak';
  @override
  String get sTypeAudioLabel => 'Audioa';
  @override
  String get sTypeImageLabel => 'Irudia';
  @override
  String get sTypeVideoLabel => 'Bideoa';
  @override
  String get sTypeOtherLabel => 'Bestelako medioak';
  @override
  String get sActionPlayHint => 'erreproduzitu';
  @override
  String get sActionPreviewHint => 'aurrebista';
  @override
  String get sActionSelectHint => 'aukeratu';
  @override
  String get sActionSwitchPathLabel => 'aldatu bidea';
  @override
  String get sActionUseCameraHint => 'erabaili kamera';
  @override
  String get sNameDurationLabel => 'iraupena';
  @override
  String get sUnitAssetCountLabel => 'kontaketa';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxEu extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Portua:';
  @override
  String get alias => 'Aliasa:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionEu extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aukeraketa';
  @override
  String files({required Object files}) => 'Fitxategiak: ${files}';
  @override
  String size({required Object size}) => 'Tamaina: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerEu extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fitxategia';
  @override
  String get folder => 'Direktorioa';
  @override
  String get media => 'Media';
  @override
  String get text => 'Testua';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Itsatsi';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesEu extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Hartzaile bakarra';
  @override
  String get multiple => 'Hartzaile anitz';
  @override
  String get link => 'Lotura elkarbanatu';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralEu extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Orokorra';
  @override
  String get brightness => 'Argitasuna';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsEu brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsEu._(_root);
  @override
  String get color => 'Kolorea';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsEu colorOptions = _TranslationsSettingsTabGeneralColorOptionsEu._(_root);
  @override
  String get language => 'Hizkuntza';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsEu languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsEu._(_root);
  @override
  String get saveWindowPlacement => 'Ateratzean gorde lehioaren kokapena';
  @override
  String get minimizeToTray => 'Itxi: txikitu lehioa';
  @override
  String get launchAtStartup => 'Hasieratze automatikoa';
  @override
  String get launchMinimized => 'Hasieratze automatikoa: hasi txikituta';
  @override
  String get animations => 'Animazioak';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveEu extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eskuratu';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get destination => 'Hartzailea';
  @override
  String get downloads => '(Deskargak)';
  @override
  String get saveToGallery => 'Gorde galerian';
  @override
  String get saveToHistory => 'Gorde historialean';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkEu extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gorria';
  @override
  String get needRestart => 'Berrabiarazi zerbitzaria aldaketak aplikatzeko.';
  @override
  String get server => 'Zerbitzaria';
  @override
  String get alias => 'Aliasa';
  @override
  String get deviceType => 'Gailu mota';
  @override
  String get deviceModel => 'Gailu modeloa';
  @override
  String get port => 'Portua';
  @override
  String portWarning({required Object defaultPort}) =>
      'Portu berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango (Lehenetsitako portua: ${defaultPort})';
  @override
  String get encryption => 'Zifratzea';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Multicast helbide berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango. (Lehenetsitako multicast helbidea: ${defaultMulticast})';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallEu extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Aplikazio honek fitxategiak bidal ditzake beste gailuei, baina beste gailuek ezin ditzakete fitxategiak bidali gailu honetara.';
  @override
  String solution({required Object port}) =>
      'Suhesiarekin erlazionatutako arazo bat izen liteke. ${port} portura sarrerako konexioak (UDP eta TCP) onartuz konpon dezakezu.';
  @override
  String get openFirewallSettings => 'Ireki Suhesia';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionEu extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Hartzaile eta bidaltzaileak ez dute elkar ikusten eta ezin diote fitxategiak elkarri bidali';
  @override
  String get solution =>
      'Bi aldeetan dago arazoa? Ziurtatu Wi-Fi sare berdinean kokatuta daudela eta konfigurazio bera elkarbanatzen dutela (portua, multicast helbidea, zifratua). Arazoa Wi-Fi sareak partaideen arteko konexioak mugatzea ere izan liteke. Horrela bada, routerrean aukera hau aktibatu';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsEu extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Ireki fitxategia';
  @override
  String get info => 'Informazioa';
  @override
  String get deleteFromHistory => 'Ezabatu historia';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalEu extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleEu title = _TranslationsProgressPageTotalTitleEu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fitxategiak: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaina: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Abiadura: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileEu extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gehitu aukeraketari';
  @override
  String get content => 'Zer gehitu nahi duzu?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputEu extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sartu helbidea';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Helbidea';
  @override
  String get recentlyUsed => 'Duela gutxi erabilitakoak: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionEu extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bertan behera utzi fitxategi bidalketa';
  @override
  String get content => '¿Benetan nahi duzu bertan behera utzi fitxategi bidalketa?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileEu extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezin da fitxategia ireki';
  @override
  String content({required Object file}) => 'Ezin izan da "${file}" fitxategia ireki. Agian mugitu, berizendatu edo ezabatu egin da?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeEu extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zifratua ezgaituta';
  @override
  String get content => 'Orain komunikazioa zifratu gabeko HTTP konexioaren bidez egiten ari da. HTTPS erailtzeko, gaitu berriro zifratua';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogEu extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogEu extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gogokoak';
  @override
  String get noFavorites => 'Ez dago gogoko gailurik.';
  @override
  String get addFavorite => 'Gehitu';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogEu extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezabatu gogokoetatik';
  @override
  String content({required Object name}) => 'Benetan nahi duzu "${name}" gogokoetatik ezabatu?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogEu extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Gehitu gogokoetara';
  @override
  String get titleEdit => 'Doitu';
  @override
  String get name => 'Aliasa';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP Helbidea';
  @override
  String get port => 'Portua';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoEu extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fitxategiari buruzko informazioa';
  @override
  String get fileName => 'Fitxategiaren izena:';
  @override
  String get path => 'Bidea:';
  @override
  String get size => 'Tamaina:';
  @override
  String get sender => 'Bidaltzailea:';
  @override
  String get time => 'Ordua:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputEu extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sartu izena';
  @override
  String original({required Object original}) => 'Jatorrizkoa: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedEu extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Sare lokala eskaneatzeko baimenik gabe, LocalSend-ek ezin ditu inguruko gailuak aurkitu. Mesedez, onartu baimen hau ezarpenetan.';
  @override
  String get gotoSettings => 'Ezarpenak';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputEu extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Idatzi mezu bat';
  @override
  String get multiline => 'Lerro anitz';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesEu extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ez da fitxategirik aukeratu';
  @override
  String get content => 'Mesedez aukeratu gutxienez fitxategi bat.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionEu extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Baimenik gabe';
  @override
  String get content => 'Ez dituzu beharrezko baimenak onartu. Mesedez, onartu itzazu ezarpenetan.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformEu extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ez dago eskuragarri';
  @override
  String get content => 'Ezaugarri hau hurrengo plataforman bakarrik dago eskuragarri:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrEu extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Kodea';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsEu extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ekintza azkarrak';
  @override
  String get counter => 'Kontagailua';
  @override
  String get prefix => 'Aurrizkia';
  @override
  String get padZero => 'Hutsekin osatu';
  @override
  String get sortBeforeCount => 'Aldez aurretik alfabetikoki ordenatu';
  @override
  String get random => 'Ausazkoa';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeEu extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Fitxategi eskaerak automatikoki onartzen dira. Kontutan izan sare lokaleko edonork bidali ahal izango dizkizula fitxategiak.';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpEu extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bidalketa moduak';
  @override
  String get single => 'Bidali fitxategiak hartzaile bakar bati. Bidalketa bukatutakoan aukeraketa garbituko da.';
  @override
  String get multiple => 'Bidali fitxategiak hartzaile anitzeri. Aukeraketa ez da garbituko.';
  @override
  String get link => 'LocalSend instalatuta ez duten hartzaileak fitxategiak eskuratu ahali zango dituzte lotura nabigatzailean zabalduz.';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsEu extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Iluna';
  @override
  String get light => 'Argia';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsEu extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsEu extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleEu extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleEu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Aurrerapena (${time})';
  @override
  String get finishedError => 'Akatsarekin amaitu da';
  @override
  String get canceledSender => 'Bidaltzaileak bertan behera utzita';
  @override
  String get canceledReceiver => 'Hartzaileak bertan behera utzita';
}
