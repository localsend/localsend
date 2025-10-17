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
class TranslationsDa extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsDa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.da,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <da>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsDa _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Dansk';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralDa general = _TranslationsGeneralDa._(_root);
  @override
  late final _TranslationsReceiveTabDa receiveTab = _TranslationsReceiveTabDa._(_root);
  @override
  late final _TranslationsSendTabDa sendTab = _TranslationsSendTabDa._(_root);
  @override
  late final _TranslationsSettingsTabDa settingsTab = _TranslationsSettingsTabDa._(_root);
  @override
  late final _TranslationsTroubleshootPageDa troubleshootPage = _TranslationsTroubleshootPageDa._(_root);
  @override
  late final _TranslationsReceiveHistoryPageDa receiveHistoryPage = _TranslationsReceiveHistoryPageDa._(_root);
  @override
  late final _TranslationsApkPickerPageDa apkPickerPage = _TranslationsApkPickerPageDa._(_root);
  @override
  late final _TranslationsSelectedFilesPageDa selectedFilesPage = _TranslationsSelectedFilesPageDa._(_root);
  @override
  late final _TranslationsReceivePageDa receivePage = _TranslationsReceivePageDa._(_root);
  @override
  late final _TranslationsReceiveOptionsPageDa receiveOptionsPage = _TranslationsReceiveOptionsPageDa._(_root);
  @override
  late final _TranslationsSendPageDa sendPage = _TranslationsSendPageDa._(_root);
  @override
  late final _TranslationsProgressPageDa progressPage = _TranslationsProgressPageDa._(_root);
  @override
  late final _TranslationsWebSharePageDa webSharePage = _TranslationsWebSharePageDa._(_root);
  @override
  late final _TranslationsAboutPageDa aboutPage = _TranslationsAboutPageDa._(_root);
  @override
  late final _TranslationsDonationPageDa donationPage = _TranslationsDonationPageDa._(_root);
  @override
  late final _TranslationsChangelogPageDa changelogPage = _TranslationsChangelogPageDa._(_root);
  @override
  late final _TranslationsAliasGeneratorDa aliasGenerator = _TranslationsAliasGeneratorDa._(_root);
  @override
  late final _TranslationsDialogsDa dialogs = _TranslationsDialogsDa._(_root);
  @override
  late final _TranslationsSanitizationDa sanitization = _TranslationsSanitizationDa._(_root);
  @override
  late final _TranslationsTrayDa tray = _TranslationsTrayDa._(_root);
  @override
  late final _TranslationsWebDa web = _TranslationsWebDa._(_root);
  @override
  late final _TranslationsAssetPickerDa assetPicker = _TranslationsAssetPickerDa._(_root);
}

// Path: general
class _TranslationsGeneralDa extends TranslationsGeneralEn {
  _TranslationsGeneralDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Accepter';
  @override
  String get accepted => 'Accepteret';
  @override
  String get add => 'Tilføj';
  @override
  String get advanced => 'Avanceret';
  @override
  String get cancel => 'Afbryd';
  @override
  String get close => 'Luk';
  @override
  String get confirm => 'Bekræft';
  @override
  String get continueStr => 'Videre';
  @override
  String get copy => 'Kopier';
  @override
  String get copiedToClipboard => 'Kopieret til udklipsholderen.';
  @override
  String get decline => 'Afvis';
  @override
  String get done => 'Færdig';
  @override
  String get delete => 'Slet';
  @override
  String get edit => 'Rediger';
  @override
  String get error => 'Fejl';
  @override
  String get example => 'Eksempel';
  @override
  String get files => 'Filer';
  @override
  String get finished => 'Fuldendt';
  @override
  String get hide => 'Skjul';
  @override
  String get off => 'Fra';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Til';
  @override
  String get online => 'Online';
  @override
  String get open => 'Åben';
  @override
  String get queue => 'Kø';
  @override
  String get quickSave => 'Quick Save';
  @override
  String get quickSaveFromFavorites => 'Quick Save til "Favoritter"';
  @override
  String get renamed => 'Omdøbt';
  @override
  String get reset => 'Nulstil';
  @override
  String get restart => 'Genstart';
  @override
  String get settings => 'Indstillinger';
  @override
  String get skipped => 'Sprunget over';
  @override
  String get start => 'Start';
  @override
  String get stop => 'Stop';
  @override
  String get save => 'Gem';
  @override
  String get unchanged => 'Uforandret';
  @override
  String get unknown => 'Ukendt';
  @override
  String get noItemInClipboard => 'Intet element fundet i udklipsholderen.';
}

// Path: receiveTab
class _TranslationsReceiveTabDa extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modtag';
  @override
  late final _TranslationsReceiveTabInfoBoxDa infoBox = _TranslationsReceiveTabInfoBoxDa._(_root);
}

// Path: sendTab
class _TranslationsSendTabDa extends TranslationsSendTabEn {
  _TranslationsSendTabDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  late final _TranslationsSendTabSelectionDa selection = _TranslationsSendTabSelectionDa._(_root);
  @override
  late final _TranslationsSendTabPickerDa picker = _TranslationsSendTabPickerDa._(_root);
  @override
  String get shareIntentInfo => 'Du kan også benytte "Dele"-funktionen på din mobilentelefon, for lettere at kunne vælge filer.';
  @override
  String get nearbyDevices => 'Enheder tæt på';
  @override
  String get thisDevice => 'Denne enhed';
  @override
  String get scan => 'Søg efter enheder';
  @override
  String get manualSending => 'Manuel afsendelse';
  @override
  String get sendMode => 'Sendemåde';
  @override
  late final _TranslationsSendTabSendModesDa sendModes = _TranslationsSendTabSendModesDa._(_root);
  @override
  String get sendModeHelp => 'Forklaring';
  @override
  String get help => 'Vær venligst sikker på, at den ønskede enhed også befinder sig på samme Wi-Fi-netværk.';
  @override
  String get placeItems => 'Placer filer for at dele.';
}

// Path: settingsTab
class _TranslationsSettingsTabDa extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Indstillinger';
  @override
  late final _TranslationsSettingsTabGeneralDa general = _TranslationsSettingsTabGeneralDa._(_root);
  @override
  late final _TranslationsSettingsTabReceiveDa receive = _TranslationsSettingsTabReceiveDa._(_root);
  @override
  late final _TranslationsSettingsTabSendDa send = _TranslationsSettingsTabSendDa._(_root);
  @override
  late final _TranslationsSettingsTabNetworkDa network = _TranslationsSettingsTabNetworkDa._(_root);
  @override
  late final _TranslationsSettingsTabOtherDa other = _TranslationsSettingsTabOtherDa._(_root);
  @override
  String get advancedSettings => 'Avancerede indstillinger';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageDa extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fejlmelding';
  @override
  String get subTitle => 'Virker appen ikke som forventet? Her finder du hyppigt brugte løsninger.';
  @override
  String get solution => 'Løsning:';
  @override
  String get fixButton => 'Løs automatisk';
  @override
  late final _TranslationsTroubleshootPageFirewallDa firewall = _TranslationsTroubleshootPageFirewallDa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryDa noDiscovery = _TranslationsTroubleshootPageNoDiscoveryDa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionDa noConnection = _TranslationsTroubleshootPageNoConnectionDa._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageDa extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historik';
  @override
  String get openFolder => 'Åben mappe';
  @override
  String get deleteHistory => 'Slet historik';
  @override
  String get empty => 'Historikken er tom.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsDa entryActions = _TranslationsReceiveHistoryPageEntryActionsDa._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageDa extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'Ekskluder System-apps';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Ekskluder Ikke-startbare Apps';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageDa extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Slet alle';
}

// Path: receivePage
class _TranslationsReceivePageDa extends TranslationsReceivePageEn {
  _TranslationsReceivePageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(n, one: 'vil sende dig en fil', other: 'vil sende dig ${n} filer');
  @override
  String get subTitleMessage => 'sendte dig en besked:';
  @override
  String get subTitleLink => 'sendte dig et link:';
  @override
  String get canceled => 'Afsenderen har afbrudt delingen.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageDa extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Muligheder';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend mappe)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Slået fra automatisk, fordi der er mapper.';
}

// Path: sendPage
class _TranslationsSendPageDa extends TranslationsSendPageEn {
  _TranslationsSendPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Venter på svar...';
  @override
  String get rejected => 'Modtageren har afvist delingen.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Modtageren er optaget med en anden deling.';
}

// Path: progressPage
class _TranslationsProgressPageDa extends TranslationsProgressPageEn {
  _TranslationsProgressPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Send filer';
  @override
  String get titleReceiving => 'Modtag filer';
  @override
  String get savedToGallery => 'Gemt i fotos';
  @override
  late final _TranslationsProgressPageTotalDa total = _TranslationsProgressPageTotalDa._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageDa extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Del med link';
  @override
  String get loading => 'Start server...';
  @override
  String get stopping => 'Stop server...';
  @override
  String get error => 'En fejl opstod, mens serveren blev startet.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(
    n,
    one: 'Åben dette link i browseren:',
    other: 'Åben et af disse links i browseren:',
  );
  @override
  String get requests => 'Forespørgsler';
  @override
  String get noRequests => 'Ingen forespørgsler endnu.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Accepter automatisk anmodninger';
  @override
  String get requirePin => 'Kræv PIN-kode';
  @override
  String pinHint({required Object pin}) => 'PIN-koden er "${pin}"';
  @override
  String get encryptionHint => 'LocalSend benytter et selvsigneret certifikat. Det skal accepteres i browseren.';
  @override
  String pendingRequests({required Object n}) => 'Ventende forespørgsler: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageDa extends TranslationsAboutPageEn {
  _TranslationsAboutPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Om LocalSend';
  @override
  List<String> get description => [
    'LocalSend er en gratis open-source app, som du kan bruge til sikkert at dele filer og beskeder med andre enheder i nærheden på dit lokale netværk, uden en internet forbindelse.',
    'Appen findes til Android, iOS, macOS, Windows og Linux. Alle downloadmuligheder finder du på den officielle hjemmeside.',
  ];
  @override
  String get author => 'Skaber';
  @override
  String get contributors => 'Medvirkende';
  @override
  String get packagers => 'Pakkere';
  @override
  String get translators => 'Oversættere';
}

// Path: donationPage
class _TranslationsDonationPageDa extends TranslationsDonationPageEn {
  _TranslationsDonationPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donér';
  @override
  String get info => 'LocalSend er gratis, open-source og reklamefri. Hvis du kan lide denne app, kan du støtte dens udvikling med en donation.';
  @override
  String donate({required Object amount}) => 'Donér ${amount}';
  @override
  String get thanks => 'Tusind tak for din støtte!';
  @override
  String get restore => 'Genskab køb';
}

// Path: changelogPage
class _TranslationsChangelogPageDa extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ændringsbemærkninger';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorDa extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsDa extends TranslationsDialogsEn {
  _TranslationsDialogsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileDa addFile = _TranslationsDialogsAddFileDa._(_root);
  @override
  late final _TranslationsDialogsAddressInputDa addressInput = _TranslationsDialogsAddressInputDa._(_root);
  @override
  late final _TranslationsDialogsCancelSessionDa cancelSession = _TranslationsDialogsCancelSessionDa._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileDa cannotOpenFile = _TranslationsDialogsCannotOpenFileDa._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeDa encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeDa._(_root);
  @override
  late final _TranslationsDialogsErrorDialogDa errorDialog = _TranslationsDialogsErrorDialogDa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogDa favoriteDialog = _TranslationsDialogsFavoriteDialogDa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogDa favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogDa._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogDa favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogDa._(_root);
  @override
  late final _TranslationsDialogsFileInfoDa fileInfo = _TranslationsDialogsFileInfoDa._(_root);
  @override
  late final _TranslationsDialogsFileNameInputDa fileNameInput = _TranslationsDialogsFileNameInputDa._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogDa historyClearDialog = _TranslationsDialogsHistoryClearDialogDa._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedDa localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedDa._(_root);
  @override
  late final _TranslationsDialogsMessageInputDa messageInput = _TranslationsDialogsMessageInputDa._(_root);
  @override
  late final _TranslationsDialogsNoFilesDa noFiles = _TranslationsDialogsNoFilesDa._(_root);
  @override
  late final _TranslationsDialogsNoPermissionDa noPermission = _TranslationsDialogsNoPermissionDa._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformDa notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformDa._(_root);
  @override
  late final _TranslationsDialogsQrDa qr = _TranslationsDialogsQrDa._(_root);
  @override
  late final _TranslationsDialogsQuickActionsDa quickActions = _TranslationsDialogsQuickActionsDa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeDa quickSaveNotice = _TranslationsDialogsQuickSaveNoticeDa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeDa quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeDa._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinDa pin = _TranslationsDialogsPinDa._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpDa sendModeHelp = _TranslationsDialogsSendModeHelpDa._(_root);
  @override
  late final _TranslationsDialogsZoomDa zoom = _TranslationsDialogsZoomDa._(_root);
}

// Path: sanitization
class _TranslationsSanitizationDa extends TranslationsSanitizationEn {
  _TranslationsSanitizationDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Filnavn kan ikke være tomt';
  @override
  String get invalid => 'Filnavn indeholder ugyldige tegn';
}

// Path: tray
class _TranslationsTrayDa extends TranslationsTrayEn {
  _TranslationsTrayDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Luk LocalSend';
  @override
  String get closeWindows => 'Afslut';
}

// Path: web
class _TranslationsWebDa extends TranslationsWebEn {
  _TranslationsWebDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Indtast PIN-kode';
  @override
  String get invalidPin => 'Ugyldig PIN-kode';
  @override
  String get tooManyAttempts => 'For mange forsøg';
  @override
  String get rejected => 'Afvist';
  @override
  String get files => 'Filer';
  @override
  String get fileName => 'Filnavn';
  @override
  String get size => 'Størrelse';
}

// Path: assetPicker
class _TranslationsAssetPickerDa extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Bekræft';
  @override
  String get cancel => 'Afbryd';
  @override
  String get edit => 'Rediger';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Indlæsning slog fejl';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Forhåndsvisning';
  @override
  String get select => 'Vælg';
  @override
  String get emptyList => 'Tom liste';
  @override
  String get unSupportedAssetType => 'Formatet understøttes ikke.';
  @override
  String get unableToAccessAll => 'Kan ikke tilgå alle filer på enheden.';
  @override
  String get viewingLimitedAssetsTip => 'Vis kun filer og mapper tilgængelig for appen.';
  @override
  String get changeAccessibleLimitedAssets => 'Klik for at opdatere tilgængelige filer';
  @override
  String get accessAllTip =>
      'Appen kan kun tilgå nogle filer på enheden. Åben venligst systemindstillingerne og giv appen adgang til alle medier på enheden.';
  @override
  String get goToSystemSettings => 'Gå til systemindstillingerne';
  @override
  String get accessLimitedAssets => 'Fortsæt med begrænset adgang';
  @override
  String get accessiblePathName => 'Tilgængelige filer';
  @override
  String get sTypeAudioLabel => 'Lyd';
  @override
  String get sTypeImageLabel => 'Billede';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Andre medier';
  @override
  String get sActionPlayHint => 'Afspil';
  @override
  String get sActionPreviewHint => 'Forhåndsvisning';
  @override
  String get sActionSelectHint => 'Vælg';
  @override
  String get sActionSwitchPathLabel => 'Ændr filens sti';
  @override
  String get sActionUseCameraHint => 'Benyt kamera';
  @override
  String get sNameDurationLabel => 'Varighed';
  @override
  String get sUnitAssetCountLabel => 'Antal';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxDa extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Alias:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionDa extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hvad vil du dele?';
  @override
  String files({required Object files}) => 'Filer: ${files}';
  @override
  String size({required Object size}) => 'Størrelse: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerDa extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fil';
  @override
  String get folder => 'Mappe';
  @override
  String get media => 'Medie';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Udklipsholder';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesDa extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Enkel modtager';
  @override
  String get multiple => 'Flere modtagere';
  @override
  String get link => 'Del med link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralDa extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Generelt';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsDa brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsDa._(_root);
  @override
  String get color => 'Farve';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsDa colorOptions = _TranslationsSettingsTabGeneralColorOptionsDa._(_root);
  @override
  String get language => 'Sprog';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsDa languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsDa._(_root);
  @override
  String get saveWindowPlacement => 'Afslut: Gem vindueposition.';
  @override
  String get saveWindowPlacementWindows => 'Gem vinduesposition efter afslutning';
  @override
  String get minimizeToTray => 'Afslut: minimer til dock/menubjælke';
  @override
  String get launchAtStartup => 'Autostart ved login';
  @override
  String get launchMinimized => 'Autostart: Skjult ved opstart';
  @override
  String get showInContextMenu => 'Vis LocalSend i kontekstmenu';
  @override
  String get animations => 'Animationer';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveDa extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modtag';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Fuldend automatisk';
  @override
  String get destination => 'Placering';
  @override
  String get downloads => '(Overførsler)';
  @override
  String get saveToGallery => 'Gem medier i galleri';
  @override
  String get saveToHistory => 'Gem i historik';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendDa extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Send';
  @override
  String get shareViaLinkAutoAccept => 'Accepter automatisk anmodninger i "Del med link"-tilstand';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkDa extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Netværk';
  @override
  String get needRestart => 'Genstart serveren for at anvende ændringerne!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Enhedstype';
  @override
  String get deviceModel => 'Enhedsmodel';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Timeout for opdagelse';
  @override
  String portWarning({required Object defaultPort}) =>
      'Hvis du bruger en brugerdefineret port, vil du muligvis ikke blive genkendt af andre enheder. (Standard: ${defaultPort})';
  @override
  String get encryption => 'Kryptering';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Du bliver muligvis ikke genkendt af andre enheder, fordi du bruger en brugerdefineret multicast-adresse. (Standard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherDa extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Andet';
  @override
  String get support => 'Støt LocalSend';
  @override
  String get donate => 'Donér';
  @override
  String get privacyPolicy => 'Privatlivspolitik';
  @override
  String get termsOfUse => 'Brugsbetingelser';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallDa extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Denne app kan sende filer til andre endheder, men ikke omvendt.';
  @override
  String solution({required Object port}) =>
      'Dette er højst sandsynligt et Firewall-problem. Du kan løse det ved at tillade indgående forbindelser (UDP und TCP) på Port ${port}.';
  @override
  String get openFirewallSettings => 'Åben firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryDa extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Denne enhed kan ikke finde andre enheder.';
  @override
  String get solution =>
      'Kontrollér venligst, at alle enheder er på det samme Wi-Fi-netværk og har samme konfiguration (port, multicast-adresse, kryptering). Du kan prøve at indtaste enhedens IP-adresse manuelt. Hvis dette virker, kan du overveje at tilføje denne enhed til favoritterne, så den automatisk kan blive opdaget i fremtiden.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionDa extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Begge enheder kan hverken se hinanden eller dele data.';
  @override
  String get solution =>
      'Findes problemet på begge sider? I så fald skal du sikrer, at begge enheder er tilsluttet samme Wi-Fi-netværk og deler den samme konfiguration (Port, Multicast-adresse, kryptering). Det er muligt, at Wi-Fi-netværket ikke tillader forbindelser mellem enheder. I så fald skal denne indstilling slås til på routeren.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsDa extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Åben fil';
  @override
  String get showInFolder => 'Vis i mappe';
  @override
  String get info => 'Information';
  @override
  String get deleteFromHistory => 'Slet fra historikken';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalDa extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleDa title = _TranslationsProgressPageTotalTitleDa._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Filer: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Størrelse: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Hastighed: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileDa extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tilføj til pakke';
  @override
  String get content => 'Hvad vil du tilføje?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputDa extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Skriv adresse';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP-adresse';
  @override
  String get recentlyUsed => 'Senest brugt:';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionDa extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Afbryd filoverførsel';
  @override
  String get content => 'Vil du virkelig afbryde filoverførslen?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileDa extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kan ikke åbne filen';
  @override
  String content({required Object file}) => 'Filen "${file}" kunne ikke åbnes. Er denne fil blevet flyttet, omdøbt eller slettet?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeDa extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kryptering slået fra';
  @override
  String get content => 'Kommunikationen forløber nu over den ukrypterede HTTP-protokol. Aktiver kryptering for igen at benytte HTTPS.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogDa extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogDa extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoritter';
  @override
  String get noFavorites => 'Ingen favoritter indstillet.';
  @override
  String get addFavorite => 'Ny';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogDa extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slet favorit';
  @override
  String content({required Object name}) => 'Vil du virkelig slette "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogDa extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Tilføj favorit';
  @override
  String get titleEdit => 'Rediger favorit';
  @override
  String get name => 'Navn';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP-addresse';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoDa extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fil-information';
  @override
  String get fileName => 'Filnavn:';
  @override
  String get path => 'Sti:';
  @override
  String get size => 'Størrelse:';
  @override
  String get sender => 'Afsender:';
  @override
  String get time => 'Tidspunkt:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputDa extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Angiv filnavn';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogDa extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slet historik';
  @override
  String get content => 'Vil du virkelig slette historikken?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedDa extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend kan ikke finde andre enheder uden tilladelse til at scanne det lokale netværk. Giv venligst tilladelse i systemindstillingerne.';
  @override
  String get gotoSettings => 'Indstillinger';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputDa extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Skriv besked';
  @override
  String get multiline => 'Flerlinjet';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesDa extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ingen fil valgt';
  @override
  String get content => 'Vælg mindst én fil.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionDa extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ingen tilladelse';
  @override
  String get content => 'Du har ikke givet de tilstrækkelige tilladelser. Giv venligst tilladelse i systemindstillingerne.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformDa extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ikke tilgængelig';
  @override
  String get content => 'Denne funktion er ikke tilgængelig:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrDa extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kode';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsDa extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kvikhandlinger';
  @override
  String get counter => 'Tæller';
  @override
  String get prefix => 'Præfiks';
  @override
  String get padZero => 'Fyld med nuller';
  @override
  String get sortBeforeCount => 'Sorter alfabetisk på forhånd';
  @override
  String get random => 'Tilfældig';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeDa extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Filoverførsler bliver automatisk accepteret. Bemærk at alle på det lokale netværk kan sende dig filer.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeDa extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _TranslationsDialogsPinDa extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Indtast PIN-kode';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpDa extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sendemåde';
  @override
  String get single => 'Send filer til en modtager. Filvalget vil blive ryddet når filoverførslen er slut.';
  @override
  String get multiple => 'Send filer til flere modtagere. Filvalget vil ikke blive ryddet.';
  @override
  String get link => 'Modtagere, der ikke har LocalSend installeret, kan downloade de valgte filer i en browser.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomDa extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsDa extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get dark => 'Mørk';
  @override
  String get light => 'Lys';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsDa extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsDa extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleDa extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleDa._(TranslationsDa root) : this._root = root, super.internal(root);

  final TranslationsDa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Samlet tid (${time})';
  @override
  String get finishedError => 'Fuldendt med fejl';
  @override
  String get canceledSender => 'Afbrudt af afsender';
  @override
  String get canceledReceiver => 'Afbrudt af modtager';
}
