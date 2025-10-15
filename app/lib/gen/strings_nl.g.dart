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
class TranslationsNl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.nl,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <nl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsNl _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Nederlands';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralNl general = _TranslationsGeneralNl._(_root);
  @override
  late final _TranslationsReceiveTabNl receiveTab = _TranslationsReceiveTabNl._(_root);
  @override
  late final _TranslationsSendTabNl sendTab = _TranslationsSendTabNl._(_root);
  @override
  late final _TranslationsSettingsTabNl settingsTab = _TranslationsSettingsTabNl._(_root);
  @override
  late final _TranslationsTroubleshootPageNl troubleshootPage = _TranslationsTroubleshootPageNl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageNl receiveHistoryPage = _TranslationsReceiveHistoryPageNl._(_root);
  @override
  late final _TranslationsApkPickerPageNl apkPickerPage = _TranslationsApkPickerPageNl._(_root);
  @override
  late final _TranslationsSelectedFilesPageNl selectedFilesPage = _TranslationsSelectedFilesPageNl._(_root);
  @override
  late final _TranslationsReceivePageNl receivePage = _TranslationsReceivePageNl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageNl receiveOptionsPage = _TranslationsReceiveOptionsPageNl._(_root);
  @override
  late final _TranslationsSendPageNl sendPage = _TranslationsSendPageNl._(_root);
  @override
  late final _TranslationsProgressPageNl progressPage = _TranslationsProgressPageNl._(_root);
  @override
  late final _TranslationsWebSharePageNl webSharePage = _TranslationsWebSharePageNl._(_root);
  @override
  late final _TranslationsAboutPageNl aboutPage = _TranslationsAboutPageNl._(_root);
  @override
  late final _TranslationsDonationPageNl donationPage = _TranslationsDonationPageNl._(_root);
  @override
  late final _TranslationsChangelogPageNl changelogPage = _TranslationsChangelogPageNl._(_root);
  @override
  late final _TranslationsAliasGeneratorNl aliasGenerator = _TranslationsAliasGeneratorNl._(_root);
  @override
  late final _TranslationsDialogsNl dialogs = _TranslationsDialogsNl._(_root);
  @override
  late final _TranslationsSanitizationNl sanitization = _TranslationsSanitizationNl._(_root);
  @override
  late final _TranslationsTrayNl tray = _TranslationsTrayNl._(_root);
  @override
  late final _TranslationsWebNl web = _TranslationsWebNl._(_root);
  @override
  late final _TranslationsAssetPickerNl assetPicker = _TranslationsAssetPickerNl._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageNl networkInterfacesPage = _TranslationsNetworkInterfacesPageNl._(_root);
}

// Path: general
class _TranslationsGeneralNl extends TranslationsGeneralEn {
  _TranslationsGeneralNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Accepteren';
  @override
  String get accepted => 'Geaccepteerd';
  @override
  String get add => 'Toevoegen';
  @override
  String get advanced => 'Geavanceerd';
  @override
  String get cancel => 'Annuleren';
  @override
  String get close => 'Sluiten';
  @override
  String get confirm => 'Bevestigen';
  @override
  String get continueStr => 'Doorgaan';
  @override
  String get copy => 'Kopiëren';
  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';
  @override
  String get decline => 'Weigeren';
  @override
  String get done => 'Gereed';
  @override
  String get delete => 'Verwijderen';
  @override
  String get edit => 'Bewerken';
  @override
  String get error => 'Fout';
  @override
  String get example => 'Voorbeeld';
  @override
  String get files => 'Bestanden';
  @override
  String get finished => 'Voltooid';
  @override
  String get hide => 'Verbergen';
  @override
  String get off => 'Uit';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Aan';
  @override
  String get online => 'Online';
  @override
  String get open => 'Openen';
  @override
  String get queue => 'Wachtrij';
  @override
  String get quickSave => 'Snel opslaan';
  @override
  String get quickSaveFromFavorites => 'Snel opslaan voor \'Favorieten\'';
  @override
  String get renamed => 'Hernoemd';
  @override
  String get reset => 'Herstellen';
  @override
  String get restart => 'Opnieuw starten';
  @override
  String get settings => 'Instellingen';
  @override
  String get skipped => 'Overgeslagen';
  @override
  String get start => 'Starten';
  @override
  String get stop => 'Stoppen';
  @override
  String get save => 'Opslaan';
  @override
  String get unchanged => 'Ongewijzigd';
  @override
  String get unknown => 'Onbekend';
  @override
  String get noItemInClipboard => 'Het klembord is leeg.';
}

// Path: receiveTab
class _TranslationsReceiveTabNl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ontvangen';
  @override
  late final _TranslationsReceiveTabInfoBoxNl infoBox = _TranslationsReceiveTabInfoBoxNl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveNl quickSave = _TranslationsReceiveTabQuickSaveNl._(_root);
}

// Path: sendTab
class _TranslationsSendTabNl extends TranslationsSendTabEn {
  _TranslationsSendTabNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verzenden';
  @override
  late final _TranslationsSendTabSelectionNl selection = _TranslationsSendTabSelectionNl._(_root);
  @override
  late final _TranslationsSendTabPickerNl picker = _TranslationsSendTabPickerNl._(_root);
  @override
  String get shareIntentInfo => 'Je kunt ook de functie \'Delen\' van je mobiele apparaat gebruiken om gemakkelijker bestanden te selecteren.';
  @override
  String get nearbyDevices => 'Apparaten in de buurt';
  @override
  String get thisDevice => 'Dit apparaat';
  @override
  String get scan => 'Apparaten zoeken';
  @override
  String get manualSending => 'Handmatig verzenden';
  @override
  String get sendMode => 'Verzendmodus';
  @override
  late final _TranslationsSendTabSendModesNl sendModes = _TranslationsSendTabSendModesNl._(_root);
  @override
  String get sendModeHelp => 'Informatie';
  @override
  String get help => 'Zorg ervoor dat de ontvanger is verbonden met hetzelfde wifi-netwerk.';
  @override
  String get placeItems => 'Zet items neer om te delen.';
}

// Path: settingsTab
class _TranslationsSettingsTabNl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Instellingen';
  @override
  late final _TranslationsSettingsTabGeneralNl general = _TranslationsSettingsTabGeneralNl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveNl receive = _TranslationsSettingsTabReceiveNl._(_root);
  @override
  late final _TranslationsSettingsTabSendNl send = _TranslationsSettingsTabSendNl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkNl network = _TranslationsSettingsTabNetworkNl._(_root);
  @override
  late final _TranslationsSettingsTabOtherNl other = _TranslationsSettingsTabOtherNl._(_root);
  @override
  String get advancedSettings => 'Geavanceerde instellingen';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageNl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Problemen oplossen';
  @override
  String get subTitle => 'Werkt de app niet zoals verwacht? Op deze pagina vind je oplossingen voor veelvoorkomende problemen.';
  @override
  String get solution => 'Oplossing:';
  @override
  String get fixButton => 'Automatisch oplossen';
  @override
  late final _TranslationsTroubleshootPageFirewallNl firewall = _TranslationsTroubleshootPageFirewallNl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryNl noDiscovery = _TranslationsTroubleshootPageNoDiscoveryNl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionNl noConnection = _TranslationsTroubleshootPageNoConnectionNl._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageNl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geschiedenis';
  @override
  String get openFolder => 'Map openen';
  @override
  String get deleteHistory => 'Geschiedenis verwijderen';
  @override
  String get empty => 'De geschiedenis is leeg.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsNl entryActions = _TranslationsReceiveHistoryPageEntryActionsNl._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageNl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'Systeemapps uitsluiten';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Niet-startbare apps uitsluiten';
  @override
  String apps({required Object n}) => '${n} apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageNl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Alles verwijderen';
}

// Path: receivePage
class _TranslationsReceivePageNl extends TranslationsReceivePageEn {
  _TranslationsReceivePageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
    n,
    one: 'wil een bestand naar je verzenden',
    other: 'wil ${n} bestanden naar je verzenden',
  );
  @override
  String get subTitleMessage => 'heeft een bericht naar je verzonden:';
  @override
  String get subTitleLink => 'heeft een link naar je verzonden:';
  @override
  String get canceled => 'De verzender heeft het verzoek geannuleerd.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageNl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opties';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-map)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automatisch uitgezet omdat er mappen bij zitten.';
}

// Path: sendPage
class _TranslationsSendPageNl extends TranslationsSendPageEn {
  _TranslationsSendPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Wachten op antwoord…';
  @override
  String get rejected => 'De ontvanger heeft het verzoek geweigerd.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'De ontvanger is bezig met een ander verzoek.';
}

// Path: progressPage
class _TranslationsProgressPageNl extends TranslationsProgressPageEn {
  _TranslationsProgressPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Bestanden verzenden';
  @override
  String get titleReceiving => 'Bestanden ontvangen';
  @override
  String get savedToGallery => 'Opgeslagen in galerij';
  @override
  late final _TranslationsProgressPageTotalNl total = _TranslationsProgressPageTotalNl._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageNl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Delen via link';
  @override
  String get loading => 'Server starten…';
  @override
  String get stopping => 'Server stoppen…';
  @override
  String get error => 'Er is een fout opgetreden bij het starten van de server.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
    n,
    one: 'Open deze link in je browser:',
    other: 'Open een van deze links in je browser:',
  );
  @override
  String get requests => 'Verzoeken';
  @override
  String get noRequests => 'Nog geen verzoeken.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Verzoeken automatisch accepteren';
  @override
  String get requirePin => 'Code vereisen';
  @override
  String pinHint({required Object pin}) => 'De PINcode is "${pin}"';
  @override
  String get encryptionHint => 'LocalSend maakt gebruik van een zelfondertekend certificaat. Je moet dit accepteren in je browser.';
  @override
  String pendingRequests({required Object n}) => 'Openstaande verzoeken: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageNl extends TranslationsAboutPageEn {
  _TranslationsAboutPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Over LocalSend';
  @override
  List<String> get description => [
    'LocalSend is een gratis en opensource app waarmee je veilig bestanden en berichten met apparaten op je lokale netwerk kunt delen, zonder internetverbinding.',
    'De app is beschikbaar voor Android, iOS, macOS, Windows en Linux. Je vindt alle downloadopties op de officiële website.',
  ];
  @override
  String get author => 'Auteur';
  @override
  String get contributors => 'Bijdragers';
  @override
  String get packagers => 'Distributeurs';
  @override
  String get translators => 'Vertalers';
}

// Path: donationPage
class _TranslationsDonationPageNl extends TranslationsDonationPageEn {
  _TranslationsDonationPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doneren';
  @override
  String get info =>
      'LocalSend is gratis, opensource en advertentievrij. Als je de app graag gebruikt, kun je de ontwikkeling steunen middels een donatie.';
  @override
  String donate({required Object amount}) => '${amount} doneren';
  @override
  String get thanks => 'Ontzettend bedankt!';
  @override
  String get restore => 'Aankoop herstellen';
}

// Path: changelogPage
class _TranslationsChangelogPageNl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wijzigingenoverzicht';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorNl extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsNl extends TranslationsDialogsEn {
  _TranslationsDialogsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileNl addFile = _TranslationsDialogsAddFileNl._(_root);
  @override
  late final _TranslationsDialogsOpenFileNl openFile = _TranslationsDialogsOpenFileNl._(_root);
  @override
  late final _TranslationsDialogsAddressInputNl addressInput = _TranslationsDialogsAddressInputNl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionNl cancelSession = _TranslationsDialogsCancelSessionNl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileNl cannotOpenFile = _TranslationsDialogsCannotOpenFileNl._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeNl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeNl._(_root);
  @override
  late final _TranslationsDialogsErrorDialogNl errorDialog = _TranslationsDialogsErrorDialogNl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogNl favoriteDialog = _TranslationsDialogsFavoriteDialogNl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogNl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogNl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogNl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogNl._(_root);
  @override
  late final _TranslationsDialogsFileInfoNl fileInfo = _TranslationsDialogsFileInfoNl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputNl fileNameInput = _TranslationsDialogsFileNameInputNl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogNl historyClearDialog = _TranslationsDialogsHistoryClearDialogNl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedNl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedNl._(_root);
  @override
  late final _TranslationsDialogsMessageInputNl messageInput = _TranslationsDialogsMessageInputNl._(_root);
  @override
  late final _TranslationsDialogsNoFilesNl noFiles = _TranslationsDialogsNoFilesNl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionNl noPermission = _TranslationsDialogsNoPermissionNl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformNl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformNl._(_root);
  @override
  late final _TranslationsDialogsQrNl qr = _TranslationsDialogsQrNl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsNl quickActions = _TranslationsDialogsQuickActionsNl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeNl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeNl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeNl quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeNl._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinNl pin = _TranslationsDialogsPinNl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpNl sendModeHelp = _TranslationsDialogsSendModeHelpNl._(_root);
  @override
  late final _TranslationsDialogsZoomNl zoom = _TranslationsDialogsZoomNl._(_root);
}

// Path: sanitization
class _TranslationsSanitizationNl extends TranslationsSanitizationEn {
  _TranslationsSanitizationNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Bestandsnaam mag niet leeg zijn';
  @override
  String get invalid => 'Bestandsnaam bevat ongeldige tekens';
}

// Path: tray
class _TranslationsTrayNl extends TranslationsTrayEn {
  _TranslationsTrayNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend afsluiten';
  @override
  String get closeWindows => 'Sluiten';
}

// Path: web
class _TranslationsWebNl extends TranslationsWebEn {
  _TranslationsWebNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Vul de code in';
  @override
  String get invalidPin => 'Ongeldige code';
  @override
  String get tooManyAttempts => 'Te veel pogingen';
  @override
  String get rejected => 'Geweigerd';
  @override
  String get files => 'Bestanden';
  @override
  String get fileName => 'Bestandsnaam';
  @override
  String get size => 'Grootte';
}

// Path: assetPicker
class _TranslationsAssetPickerNl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Bevestigen';
  @override
  String get cancel => 'Annuleren';
  @override
  String get edit => 'Bewerken';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Laden mislukt';
  @override
  String get original => 'Herkomst';
  @override
  String get preview => 'Voorbeeld';
  @override
  String get select => 'Selecteren';
  @override
  String get emptyList => 'Lege lijst';
  @override
  String get unSupportedAssetType => 'Niet-ondersteund bestandstype.';
  @override
  String get unableToAccessAll => 'Geen toegang tot alle bestanden op het apparaat';
  @override
  String get viewingLimitedAssetsTip => 'De app heeft beperkte toegang tot bestanden.';
  @override
  String get changeAccessibleLimitedAssets => 'Toegankelijke bestanden aanpassen';
  @override
  String get accessAllTip =>
      'De app heeft slechts beperkte toegang tot je bestanden. Ga naar de systeeminstellingen om de toegangsrechten aan te passen.';
  @override
  String get goToSystemSettings => 'Naar systeeminstellingen';
  @override
  String get accessLimitedAssets => 'Doorgaan met beperkte toegang';
  @override
  String get accessiblePathName => 'Toegankelijke bestanden';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Foto\'s';
  @override
  String get sTypeVideoLabel => 'Video\'s';
  @override
  String get sTypeOtherLabel => 'Andere media';
  @override
  String get sActionPlayHint => 'afspelen';
  @override
  String get sActionPreviewHint => 'voorbeeld';
  @override
  String get sActionSelectHint => 'selecteren';
  @override
  String get sActionSwitchPathLabel => 'pad wijzigen';
  @override
  String get sActionUseCameraHint => 'camera gebruiken';
  @override
  String get sNameDurationLabel => 'duur';
  @override
  String get sUnitAssetCountLabel => 'aantal';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageNl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'Voorvertoning';
  @override
  String get title => 'Netwerkinterfaces';
  @override
  String get info =>
      'Standaard gebruikt LocalSend alle beschikbare netwerkinterfaces. U kunt hier ongewenste netwerken uitsluiten. U moet de server opnieuw opstarten om de wijzigingen toe te passen.';
  @override
  String get whitelist => 'Whitelist';
  @override
  String get blacklist => 'Blacklist';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxNl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP-adres:';
  @override
  String get port => 'Poort:';
  @override
  String get alias => 'Apparaatnaam:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveNl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favorieten';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionNl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selectie';
  @override
  String files({required Object files}) => 'Bestanden: ${files}';
  @override
  String size({required Object size}) => 'Grootte: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerNl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Bestand';
  @override
  String get folder => 'Map';
  @override
  String get media => 'Media';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Plakken';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesNl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Eén ontvanger';
  @override
  String get multiple => 'Meerdere ontvangers';
  @override
  String get link => 'Delen via link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralNl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Algemeen';
  @override
  String get brightness => 'Thema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsNl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsNl._(_root);
  @override
  String get color => 'Kleur';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsNl colorOptions = _TranslationsSettingsTabGeneralColorOptionsNl._(_root);
  @override
  String get language => 'Taal';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsNl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsNl._(_root);
  @override
  String get saveWindowPlacement => 'Afsluiten: vensterindeling behouden';
  @override
  String get saveWindowPlacementWindows => 'Afsluiten: vensterindeling behouden';
  @override
  String get minimizeToTray => 'Sluiten: minimaliseren naar systeemvak/menubalk';
  @override
  String get launchAtStartup => 'Automatisch starten na aanmelden';
  @override
  String get launchMinimized => 'Automatisch starten: verborgen';
  @override
  String get showInContextMenu => 'LocalSend weergeven in contextmenu';
  @override
  String get animations => 'Animaties';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveNl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ontvangen';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatisch voltooien';
  @override
  String get destination => 'Opslaan in map';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Media opslaan in galerij';
  @override
  String get saveToHistory => 'Opslaan in geschiedenis';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendNl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verzenden';
  @override
  String get shareViaLinkAutoAccept => 'Automatisch verzoeken goedkeuren in modus \'Delen via link\'';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkNl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Netwerk';
  @override
  String get needRestart => 'Start de server opnieuw op om de instellingen toe te passen!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Apparaatnaam';
  @override
  String get deviceType => 'Apparaattype';
  @override
  String get deviceModel => 'Apparaatmodel';
  @override
  String get port => 'Poort';
  @override
  String get discoveryTimeout => 'Time-out voor scannen';
  @override
  String get useSystemName => 'Systeemnaam gebruiken';
  @override
  String get generateRandomAlias => 'Willekeurige naam genereren';
  @override
  String portWarning({required Object defaultPort}) =>
      'Je apparaat kan mogelijk niet worden gevonden omdat je een aangepaste poort gebruikt. (Standaard: ${defaultPort})';
  @override
  String get encryption => 'Versleuteling';
  @override
  String get multicastGroup => 'Multicast-adres';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Je apparaat kan mogelijk niet worden gevonden omdat je een aangepast multicast-adres gebruikt. (Standaard: ${defaultMulticast})';
  @override
  String get network => 'Netwerk';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsNl networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsNl._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherNl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Overig';
  @override
  String get support => 'LocalSend steunen';
  @override
  String get donate => 'Doneren';
  @override
  String get privacyPolicy => 'Privacybeleid';
  @override
  String get termsOfUse => 'Gebruiksvoorwaarden';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallNl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Dit apparaat kan bestanden naar andere apparaten verzenden, maar andere apparaten kunnen geen bestanden naar dit apparaat verzenden.';
  @override
  String solution({required Object port}) =>
      'Dit is hoogstwaarschijnlijk een firewallprobleem. Je kunt dit oplossen door inkomende verbindingen (UDP en TCP) op poort ${port} toe te staan.';
  @override
  String get openFirewallSettings => 'Firewall openen';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryNl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Dit apparaat vindt geen andere apparaten.';
  @override
  String get solution =>
      'Zorg ervoor dat alle apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-adres, versleuteling). Je kunt proberen het IP-adres van het apparaat handmatig in te vullen. Als dat werkt, kun je het apparaat toevoegen aan je favorieten, zodat het voortaan automatisch kan worden gevonden.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionNl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Beide apparaten kunnen elkaar niet vinden en kunnen ook geen bestanden delen.';
  @override
  String get solution =>
      'Doet het probleem zich aan beide kanten voor? Zorg er dan voor dat beide apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-address, versleuteling). Mogelijk is onderlinge communicatie tussen apparaten op het wifi-netwerk geblokkeerd (AP-isolatie). Dit moet je dan toestaan in de instellingen van je router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsNl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Bestand openen';
  @override
  String get showInFolder => 'Weergeven in map';
  @override
  String get info => 'Informatie';
  @override
  String get deleteFromHistory => 'Verwijderen uit geschiedenis';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalNl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleNl title = _TranslationsProgressPageTotalTitleNl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Bestanden: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Grootte: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Snelheid: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileNl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Toevoegen aan selectie';
  @override
  String get content => 'Wat wil je toevoegen?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileNl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bestand openen';
  @override
  String get content => 'Wil je het ontvangen bestand openen?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputNl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vul een adres in';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP-adres';
  @override
  String get recentlyUsed => 'Onlangs gebruikt: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionNl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bestandsoverdracht annuleren';
  @override
  String get content => 'Wil je de bestandsoverdracht annuleren?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileNl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kan bestand niet openen';
  @override
  String content({required Object file}) => 'Het bestand "${file}" kan niet worden geopend. Is het mogelijk verplaatst, hernoemd of verwijderd?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeNl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Versleuteling uitgeschakeld';
  @override
  String get content =>
      'Communicatie verloopt nu via het onversleutelde HTTP-protocol. Schakel versleuteling weer in om het HTTPS-protocol te gebruiken.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogNl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogNl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorieten';
  @override
  String get noFavorites => 'Nog geen favoriete apparaten.';
  @override
  String get addFavorite => 'Toevoegen';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogNl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verwijderen uit favorieten';
  @override
  String content({required Object name}) => 'Wil je \'${name}\' uit je favorieten verwijderen?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogNl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Toevoegen aan favorieten';
  @override
  String get titleEdit => 'Instellingen';
  @override
  String get name => 'Apparaatnaam';
  @override
  String get auto => '(automatisch)';
  @override
  String get ip => 'IP-adres';
  @override
  String get port => 'Poort';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoNl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bestandsinformatie';
  @override
  String get fileName => 'Bestandsnaam:';
  @override
  String get path => 'Locatie:';
  @override
  String get size => 'Grootte:';
  @override
  String get sender => 'Afzender:';
  @override
  String get time => 'Tijd:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputNl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vul een bestandsnaam in';
  @override
  String original({required Object original}) => 'Origineel: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogNl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geschiedenis wissen';
  @override
  String get content => 'Wil je de volledige geschiedenis verwijderen?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedNl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend heeft rechten nodig om op het lokale netwerk naar andere apparaten te kunnen zoeken. Verleen deze rechten in de instellingen.';
  @override
  String get gotoSettings => 'Instellingen';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputNl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Typ een bericht';
  @override
  String get multiline => 'Meerdere regels';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesNl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geen bestanden geselecteerd';
  @override
  String get content => 'Selecteer ten minste één bestand.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionNl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geen rechten';
  @override
  String get content => 'Je hebt de benodigde rechten niet verleend. Verleen deze in de instellingen.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformNl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Niet beschikbaar';
  @override
  String get content => 'Deze functie is alleen beschikbaar op:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrNl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-code';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsNl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Snelle acties';
  @override
  String get counter => 'Teller';
  @override
  String get prefix => 'Voorvoegsel';
  @override
  String get padZero => 'Aanvullen met nullen';
  @override
  String get sortBeforeCount => 'Vooraf alfabetisch sorteren (A-Z)';
  @override
  String get random => 'Willekeurig';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeNl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Bestandsverzoeken worden nu automatisch geaccepteerd. Iedereen op het lokale netwerk kan nu dus bestanden naar je verzenden.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeNl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Bestandsverzoeken van apparaten op je favorietenlijst worden nu automatisch geaccepteerd.',
    'Waarschuwing! Dit is momenteel niet volkomen veilig. Een hacker die beschikt over de digitale vingerafdruk van een apparaat op je favorietenlijst zou zonder enige beperking bestanden naar je kunnen verzenden.',
    'Desalniettemin is deze optie alsnog veiliger dan wanneer je zou toestaan dat alle gebruikers op het lokale netwerk bestanden naar je kunnen verzenden.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinNl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vul de code in';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpNl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verzendmodi';
  @override
  String get single => 'Bestanden naar één ontvanger verzenden. De selectie wordt na de bestandsoverdracht gewist.';
  @override
  String get multiple => 'Bestanden naar meerdere ontvangers verzenden. De selectie blijft na de bestandsoverdracht behouden.';
  @override
  String get link => 'Ontvangers die LocalSend niet hebben geïnstalleerd kunnen de bestanden downloaden door de link in hun browser te openen.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomNl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsNl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systeem';
  @override
  String get dark => 'Donker';
  @override
  String get light => 'Licht';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsNl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systeem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsNl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systeem';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsNl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Alle';
  @override
  String get filtered => 'Gefilterd';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleNl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleNl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Totale voortgang (${time})';
  @override
  String get finishedError => 'Voltooid met fouten';
  @override
  String get canceledSender => 'Geannuleerd door verzender';
  @override
  String get canceledReceiver => 'Geannuleerd door ontvanger';
}
