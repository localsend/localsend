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
class TranslationsNl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsNl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Nederlands';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$nl general = _Translations$general$nl._(_root);
  @override
  late final _Translations$receiveTab$nl receiveTab = _Translations$receiveTab$nl._(_root);
  @override
  late final _Translations$sendTab$nl sendTab = _Translations$sendTab$nl._(_root);
  @override
  late final _Translations$settingsTab$nl settingsTab = _Translations$settingsTab$nl._(_root);
  @override
  late final _Translations$troubleshootPage$nl troubleshootPage = _Translations$troubleshootPage$nl._(_root);
  @override
  late final _Translations$receiveHistoryPage$nl receiveHistoryPage = _Translations$receiveHistoryPage$nl._(_root);
  @override
  late final _Translations$apkPickerPage$nl apkPickerPage = _Translations$apkPickerPage$nl._(_root);
  @override
  late final _Translations$selectedFilesPage$nl selectedFilesPage = _Translations$selectedFilesPage$nl._(_root);
  @override
  late final _Translations$receivePage$nl receivePage = _Translations$receivePage$nl._(_root);
  @override
  late final _Translations$receiveOptionsPage$nl receiveOptionsPage = _Translations$receiveOptionsPage$nl._(_root);
  @override
  late final _Translations$sendPage$nl sendPage = _Translations$sendPage$nl._(_root);
  @override
  late final _Translations$progressPage$nl progressPage = _Translations$progressPage$nl._(_root);
  @override
  late final _Translations$webSharePage$nl webSharePage = _Translations$webSharePage$nl._(_root);
  @override
  late final _Translations$aboutPage$nl aboutPage = _Translations$aboutPage$nl._(_root);
  @override
  late final _Translations$donationPage$nl donationPage = _Translations$donationPage$nl._(_root);
  @override
  late final _Translations$changelogPage$nl changelogPage = _Translations$changelogPage$nl._(_root);
  @override
  late final _Translations$dialogs$nl dialogs = _Translations$dialogs$nl._(_root);
  @override
  late final _Translations$sanitization$nl sanitization = _Translations$sanitization$nl._(_root);
  @override
  late final _Translations$tray$nl tray = _Translations$tray$nl._(_root);
  @override
  late final _Translations$web$nl web = _Translations$web$nl._(_root);
  @override
  late final _Translations$assetPicker$nl assetPicker = _Translations$assetPicker$nl._(_root);
  @override
  late final _Translations$networkInterfacesPage$nl networkInterfacesPage = _Translations$networkInterfacesPage$nl._(_root);
}

// Path: general
class _Translations$general$nl extends Translations$general$en {
  _Translations$general$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$nl extends Translations$receiveTab$en {
  _Translations$receiveTab$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ontvangen';
  @override
  late final _Translations$receiveTab$infoBox$nl infoBox = _Translations$receiveTab$infoBox$nl._(_root);
  @override
  late final _Translations$receiveTab$quickSave$nl quickSave = _Translations$receiveTab$quickSave$nl._(_root);
}

// Path: sendTab
class _Translations$sendTab$nl extends Translations$sendTab$en {
  _Translations$sendTab$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verzenden';
  @override
  late final _Translations$sendTab$selection$nl selection = _Translations$sendTab$selection$nl._(_root);
  @override
  late final _Translations$sendTab$picker$nl picker = _Translations$sendTab$picker$nl._(_root);
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
  late final _Translations$sendTab$sendModes$nl sendModes = _Translations$sendTab$sendModes$nl._(_root);
  @override
  String get sendModeHelp => 'Informatie';
  @override
  String get help => 'Zorg ervoor dat de ontvanger is verbonden met hetzelfde wifi-netwerk.';
  @override
  String get placeItems => 'Zet items neer om te delen.';
}

// Path: settingsTab
class _Translations$settingsTab$nl extends Translations$settingsTab$en {
  _Translations$settingsTab$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Instellingen';
  @override
  late final _Translations$settingsTab$general$nl general = _Translations$settingsTab$general$nl._(_root);
  @override
  late final _Translations$settingsTab$receive$nl receive = _Translations$settingsTab$receive$nl._(_root);
  @override
  late final _Translations$settingsTab$send$nl send = _Translations$settingsTab$send$nl._(_root);
  @override
  late final _Translations$settingsTab$network$nl network = _Translations$settingsTab$network$nl._(_root);
  @override
  late final _Translations$settingsTab$other$nl other = _Translations$settingsTab$other$nl._(_root);
  @override
  String get advancedSettings => 'Geavanceerde instellingen';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$nl extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$nl firewall = _Translations$troubleshootPage$firewall$nl._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$nl noDiscovery = _Translations$troubleshootPage$noDiscovery$nl._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$nl noConnection = _Translations$troubleshootPage$noConnection$nl._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$nl extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$nl entryActions = _Translations$receiveHistoryPage$entryActions$nl._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$nl extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$selectedFilesPage$nl extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Alles verwijderen';
}

// Path: receivePage
class _Translations$receivePage$nl extends Translations$receivePage$en {
  _Translations$receivePage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$receiveOptionsPage$nl extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$sendPage$nl extends Translations$sendPage$en {
  _Translations$sendPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$nl extends Translations$progressPage$en {
  _Translations$progressPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Bestanden verzenden';
  @override
  String get titleReceiving => 'Bestanden ontvangen';
  @override
  String get savedToGallery => 'Opgeslagen in galerij';
  @override
  late final _Translations$progressPage$total$nl total = _Translations$progressPage$total$nl._(_root);
  @override
  late final _Translations$progressPage$remainingTime$nl remainingTime = _Translations$progressPage$remainingTime$nl._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$nl extends Translations$webSharePage$en {
  _Translations$webSharePage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$nl extends Translations$aboutPage$en {
  _Translations$aboutPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$nl extends Translations$donationPage$en {
  _Translations$donationPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$nl extends Translations$changelogPage$en {
  _Translations$changelogPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wijzigingenoverzicht';
}

// Path: dialogs
class _Translations$dialogs$nl extends Translations$dialogs$en {
  _Translations$dialogs$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$nl addFile = _Translations$dialogs$addFile$nl._(_root);
  @override
  late final _Translations$dialogs$openFile$nl openFile = _Translations$dialogs$openFile$nl._(_root);
  @override
  late final _Translations$dialogs$addressInput$nl addressInput = _Translations$dialogs$addressInput$nl._(_root);
  @override
  late final _Translations$dialogs$cancelSession$nl cancelSession = _Translations$dialogs$cancelSession$nl._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$nl cannotOpenFile = _Translations$dialogs$cannotOpenFile$nl._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$nl encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$nl._(_root);
  @override
  late final _Translations$dialogs$errorDialog$nl errorDialog = _Translations$dialogs$errorDialog$nl._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$nl favoriteDialog = _Translations$dialogs$favoriteDialog$nl._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$nl favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$nl._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$nl favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$nl._(_root);
  @override
  late final _Translations$dialogs$fileInfo$nl fileInfo = _Translations$dialogs$fileInfo$nl._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$nl fileNameInput = _Translations$dialogs$fileNameInput$nl._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$nl historyClearDialog = _Translations$dialogs$historyClearDialog$nl._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$nl localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$nl._(_root);
  @override
  late final _Translations$dialogs$messageInput$nl messageInput = _Translations$dialogs$messageInput$nl._(_root);
  @override
  late final _Translations$dialogs$noFiles$nl noFiles = _Translations$dialogs$noFiles$nl._(_root);
  @override
  late final _Translations$dialogs$noPermission$nl noPermission = _Translations$dialogs$noPermission$nl._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$nl notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$nl._(_root);
  @override
  late final _Translations$dialogs$qr$nl qr = _Translations$dialogs$qr$nl._(_root);
  @override
  late final _Translations$dialogs$quickActions$nl quickActions = _Translations$dialogs$quickActions$nl._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$nl quickSaveNotice = _Translations$dialogs$quickSaveNotice$nl._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$nl quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$nl._(_root);
  @override
  late final _Translations$dialogs$pin$nl pin = _Translations$dialogs$pin$nl._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$nl sendModeHelp = _Translations$dialogs$sendModeHelp$nl._(_root);
  @override
  late final _Translations$dialogs$zoom$nl zoom = _Translations$dialogs$zoom$nl._(_root);
}

// Path: sanitization
class _Translations$sanitization$nl extends Translations$sanitization$en {
  _Translations$sanitization$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Bestandsnaam mag niet leeg zijn';
  @override
  String get invalid => 'Bestandsnaam bevat ongeldige tekens';
}

// Path: tray
class _Translations$tray$nl extends Translations$tray$en {
  _Translations$tray$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$web$nl extends Translations$web$en {
  _Translations$web$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$nl extends Translations$assetPicker$en {
  _Translations$assetPicker$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$networkInterfacesPage$nl extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$infoBox$nl extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$nl extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$nl extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$nl extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$nl extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$nl extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Algemeen';
  @override
  String get brightness => 'Thema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$nl brightnessOptions = _Translations$settingsTab$general$brightnessOptions$nl._(
    _root,
  );
  @override
  String get color => 'Kleur';
  @override
  late final _Translations$settingsTab$general$colorOptions$nl colorOptions = _Translations$settingsTab$general$colorOptions$nl._(_root);
  @override
  String get language => 'Taal';
  @override
  late final _Translations$settingsTab$general$languageOptions$nl languageOptions = _Translations$settingsTab$general$languageOptions$nl._(_root);
  @override
  String get saveWindowPlacement => 'Vensterpositie na beëindigen opslaan';
  @override
  String get saveWindowPlacementWindows => 'Vensterpositie na afsluiten opslaan';
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
class _Translations$settingsTab$receive$nl extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$nl extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verzenden';
  @override
  String get shareViaLinkAutoAccept => 'Automatisch verzoeken goedkeuren in modus \'Delen via link\'';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$nl extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$nl networkOptions = _Translations$settingsTab$network$networkOptions$nl._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$nl extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$nl extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Dit apparaat kan bestanden naar andere apparaten verzenden, maar andere apparaten kunnen geen bestanden naar dit apparaat verzenden.';
  @override
  String solution({required Object port}) =>
      'Dit is hoogstwaarschijnlijk een firewallprobleem. Je kunt dit oplossen door inkomende verbindingen (UDP en TCP) op poort ${port} toe te staan.';
  @override
  String get openFirewall => 'Firewall openen';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$nl extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Dit apparaat vindt geen andere apparaten.';
  @override
  String get solution =>
      'Zorg ervoor dat alle apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-adres, versleuteling). Je kunt proberen het IP-adres van het apparaat handmatig in te vullen. Als dat werkt, kun je het apparaat toevoegen aan je favorieten, zodat het voortaan automatisch kan worden gevonden.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$nl extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Beide apparaten kunnen elkaar niet vinden en kunnen ook geen bestanden delen.';
  @override
  String get solution =>
      'Doet het probleem zich aan beide kanten voor? Zorg er dan voor dat beide apparaten met hetzelfde wifi-netwerk zijn verbonden en dat ze dezelfde configuratie hebben (poort, multicast-address, versleuteling). Mogelijk is onderlinge communicatie tussen apparaten op het wifi-netwerk geblokkeerd (AP-isolatie). Dit moet je dan toestaan in de instellingen van je router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$nl extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$nl extends Translations$progressPage$total$en {
  _Translations$progressPage$total$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$nl title = _Translations$progressPage$total$title$nl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Bestanden: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Grootte: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Snelheid: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$nl extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Gebruik 'h' als afkorting voor uren en 'm' voor minuten
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Gebruik 'd' voor dagen, 'h' voor uren en 'm' voor minuten
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$nl extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Toevoegen aan selectie';
  @override
  String get content => 'Wat wil je toevoegen?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$nl extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bestand openen';
  @override
  String get content => 'Wil je het ontvangen bestand openen?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$nl extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$cancelSession$nl extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bestandsoverdracht annuleren';
  @override
  String get content => 'Wil je de bestandsoverdracht annuleren?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$nl extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kan bestand niet openen';
  @override
  String content({required Object file}) => 'Het bestand "${file}" kan niet worden geopend. Is het mogelijk verplaatst, hernoemd of verwijderd?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$nl extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Versleuteling uitgeschakeld';
  @override
  String get content =>
      'Communicatie verloopt nu via het onversleutelde HTTP-protocol. Schakel versleuteling weer in om het HTTPS-protocol te gebruiken.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$nl extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$nl extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$nl extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verwijderen uit favorieten';
  @override
  String content({required Object name}) => 'Wil je \'${name}\' uit je favorieten verwijderen?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$nl extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileInfo$nl extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$nl extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vul een bestandsnaam in';
  @override
  String original({required Object original}) => 'Origineel: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$nl extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geschiedenis wissen';
  @override
  String get content => 'Wil je de volledige geschiedenis verwijderen?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$nl extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$nl extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Typ een bericht';
  @override
  String get multiline => 'Meerdere regels';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$nl extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geen bestanden geselecteerd';
  @override
  String get content => 'Selecteer ten minste één bestand.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$nl extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geen rechten';
  @override
  String get content => 'Je hebt de benodigde rechten niet verleend. Verleen deze in de instellingen.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$nl extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Niet beschikbaar';
  @override
  String get content => 'Deze functie is alleen beschikbaar op:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$nl extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-code';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$nl extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$nl extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Bestandsverzoeken worden nu automatisch geaccepteerd. Iedereen op het lokale netwerk kan nu dus bestanden naar je verzenden.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$nl extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$nl extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vul de code in';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$nl extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$nl extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$nl extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$nl extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systeem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$nl extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systeem';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$nl extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

  final TranslationsNl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Alle';
  @override
  String get filtered => 'Gefilterd';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$nl extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$nl._(TranslationsNl root) : this._root = root, super.internal(root);

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
