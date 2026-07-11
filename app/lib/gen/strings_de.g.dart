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
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsDe({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.de,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <de>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsDe _root = this; // ignore: unused_field

  @override
  TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Deutsch';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$de general = _Translations$general$de._(_root);
  @override
  late final _Translations$receiveTab$de receiveTab = _Translations$receiveTab$de._(_root);
  @override
  late final _Translations$sendTab$de sendTab = _Translations$sendTab$de._(_root);
  @override
  late final _Translations$settingsTab$de settingsTab = _Translations$settingsTab$de._(_root);
  @override
  late final _Translations$troubleshootPage$de troubleshootPage = _Translations$troubleshootPage$de._(_root);
  @override
  late final _Translations$networkInterfacesPage$de networkInterfacesPage = _Translations$networkInterfacesPage$de._(_root);
  @override
  late final _Translations$receiveHistoryPage$de receiveHistoryPage = _Translations$receiveHistoryPage$de._(_root);
  @override
  late final _Translations$apkPickerPage$de apkPickerPage = _Translations$apkPickerPage$de._(_root);
  @override
  late final _Translations$selectedFilesPage$de selectedFilesPage = _Translations$selectedFilesPage$de._(_root);
  @override
  late final _Translations$receivePage$de receivePage = _Translations$receivePage$de._(_root);
  @override
  late final _Translations$receiveOptionsPage$de receiveOptionsPage = _Translations$receiveOptionsPage$de._(_root);
  @override
  late final _Translations$sendPage$de sendPage = _Translations$sendPage$de._(_root);
  @override
  late final _Translations$progressPage$de progressPage = _Translations$progressPage$de._(_root);
  @override
  late final _Translations$webSharePage$de webSharePage = _Translations$webSharePage$de._(_root);
  @override
  late final _Translations$aboutPage$de aboutPage = _Translations$aboutPage$de._(_root);
  @override
  late final _Translations$donationPage$de donationPage = _Translations$donationPage$de._(_root);
  @override
  late final _Translations$changelogPage$de changelogPage = _Translations$changelogPage$de._(_root);
  @override
  late final _Translations$dialogs$de dialogs = _Translations$dialogs$de._(_root);
  @override
  late final _Translations$sanitization$de sanitization = _Translations$sanitization$de._(_root);
  @override
  late final _Translations$tray$de tray = _Translations$tray$de._(_root);
  @override
  late final _Translations$web$de web = _Translations$web$de._(_root);
  @override
  late final _Translations$assetPicker$de assetPicker = _Translations$assetPicker$de._(_root);
}

// Path: general
class _Translations$general$de extends Translations$general$en {
  _Translations$general$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Akzeptieren';
  @override
  String get accepted => 'Akzeptiert';
  @override
  String get add => 'Hinzufügen';
  @override
  String get advanced => 'Erweitert';
  @override
  String get cancel => 'Abbrechen';
  @override
  String get close => 'Schließen';
  @override
  String get confirm => 'Bestätigen';
  @override
  String get continueStr => 'Weiter';
  @override
  String get copy => 'Kopieren';
  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';
  @override
  String get decline => 'Ablehnen';
  @override
  String get done => 'Fertig';
  @override
  String get delete => 'Löschen';
  @override
  String get edit => 'Bearbeiten';
  @override
  String get error => 'Fehler';
  @override
  String get example => 'Beispiel';
  @override
  String get files => 'Dateien';
  @override
  String get finished => 'Abgeschlossen';
  @override
  String get hide => 'Verstecken';
  @override
  String get off => 'Aus';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'An';
  @override
  String get online => 'Online';
  @override
  String get open => 'Öffnen';
  @override
  String get queue => 'Warteschlange';
  @override
  String get quickSave => 'Quick Save';
  @override
  String get quickSaveFromFavorites => 'Quick Save für "Favoriten"';
  @override
  String get renamed => 'Umbenannt';
  @override
  String get reset => 'Zurücksetzen';
  @override
  String get restart => 'Neustarten';
  @override
  String get settings => 'Einstellungen';
  @override
  String get skipped => 'Übersprungen';
  @override
  String get start => 'Start';
  @override
  String get stop => 'Stop';
  @override
  String get save => 'Speichern';
  @override
  String get unchanged => 'Unverändert';
  @override
  String get unknown => 'Unbekannt';
  @override
  String get noItemInClipboard => 'Kein Element in der Zwischenablage gefunden.';
}

// Path: receiveTab
class _Translations$receiveTab$de extends Translations$receiveTab$en {
  _Translations$receiveTab$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Empfangen';
  @override
  late final _Translations$receiveTab$infoBox$de infoBox = _Translations$receiveTab$infoBox$de._(_root);
  @override
  late final _Translations$receiveTab$quickSave$de quickSave = _Translations$receiveTab$quickSave$de._(_root);
}

// Path: sendTab
class _Translations$sendTab$de extends Translations$sendTab$en {
  _Translations$sendTab$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Senden';
  @override
  late final _Translations$sendTab$selection$de selection = _Translations$sendTab$selection$de._(_root);
  @override
  late final _Translations$sendTab$picker$de picker = _Translations$sendTab$picker$de._(_root);
  @override
  String get shareIntentInfo => 'Du kannst auch die "Teilen"-Funktion deines mobilen Geräts nutzen, um Dateien einfacher auszuwählen.';
  @override
  String get nearbyDevices => 'Geräte in der Nähe';
  @override
  String get thisDevice => 'Dieses Gerät';
  @override
  String get scan => 'Geräte suchen';
  @override
  String get manualSending => 'Manuelles Senden';
  @override
  String get sendMode => 'Sendemodus';
  @override
  late final _Translations$sendTab$sendModes$de sendModes = _Translations$sendTab$sendModes$de._(_root);
  @override
  String get sendModeHelp => 'Erklärung';
  @override
  String get help => 'Bitte stelle sicher, dass sich das gewünschte Ziel auch im selben WLAN-Netzwerk befindet.';
  @override
  String get placeItems => 'Dateien ablegen, um zu teilen.';
}

// Path: settingsTab
class _Translations$settingsTab$de extends Translations$settingsTab$en {
  _Translations$settingsTab$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Einstellungen';
  @override
  late final _Translations$settingsTab$general$de general = _Translations$settingsTab$general$de._(_root);
  @override
  late final _Translations$settingsTab$receive$de receive = _Translations$settingsTab$receive$de._(_root);
  @override
  late final _Translations$settingsTab$send$de send = _Translations$settingsTab$send$de._(_root);
  @override
  late final _Translations$settingsTab$network$de network = _Translations$settingsTab$network$de._(_root);
  @override
  late final _Translations$settingsTab$other$de other = _Translations$settingsTab$other$de._(_root);
  @override
  String get advancedSettings => 'Erweiterte Einstellungen';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$de extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fehlerbehebung';
  @override
  String get subTitle => 'Diese App funktioniert nicht wie erwartet? Hier findest du häufige Lösungsansätze.';
  @override
  String get solution => 'Lösung:';
  @override
  String get fixButton => 'Automatisch beheben';
  @override
  late final _Translations$troubleshootPage$firewall$de firewall = _Translations$troubleshootPage$firewall$de._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$de noDiscovery = _Translations$troubleshootPage$noDiscovery$de._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$de noConnection = _Translations$troubleshootPage$noConnection$de._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$de extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Netzwerkschnittstellen';
  @override
  String get info =>
      'Standardmäßig verwendet LocalSend alle verfügbaren Netzwerkschnittstellen. Hier können Sie unerwünschte Netzwerke ausschließen. Sie müssen den Server neu starten, um die Änderungen zu übernehmen.';
  @override
  String get preview => 'Vorschau';
  @override
  String get whitelist => 'Whitelist';
  @override
  String get blacklist => 'Blacklist';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$de extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verlauf';
  @override
  String get openFolder => 'Ordner öffnen';
  @override
  String get deleteHistory => 'Verlauf löschen';
  @override
  String get empty => 'Der Verlauf ist leer.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$de entryActions = _Translations$receiveHistoryPage$entryActions$de._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$de extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'System-Apps ausschließen';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Nicht-startbare Apps ausschließen';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$de extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Alle löschen';
}

// Path: receivePage
class _Translations$receivePage$de extends Translations$receivePage$en {
  _Translations$receivePage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
    n,
    one: 'möchte dir eine Datei senden',
    other: 'möchte dir ${n} Dateien senden',
  );
  @override
  String get subTitleMessage => 'sendet dir eine Nachricht:';
  @override
  String get subTitleLink => 'sendet dir einen Link:';
  @override
  String get canceled => 'Der Absender hat die Anfrage abgebrochen.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$de extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Optionen';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-Ordner)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Aufgrund von Ordnern automatisch ausgeschaltet.';
}

// Path: sendPage
class _Translations$sendPage$de extends Translations$sendPage$en {
  _Translations$sendPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Warte auf Antwort…';
  @override
  String get rejected => 'Der Empfänger hat die Anfrage abgelehnt.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Der Empfänger ist mit einer anderen Anfrage beschäftigt.';
}

// Path: progressPage
class _Translations$progressPage$de extends Translations$progressPage$en {
  _Translations$progressPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Sende Dateien';
  @override
  String get titleReceiving => 'Empfange Dateien';
  @override
  String get savedToGallery => 'in Fotos gespeichert';
  @override
  late final _Translations$progressPage$total$de total = _Translations$progressPage$total$de._(_root);
  @override
  late final _Translations$progressPage$remainingTime$de remainingTime = _Translations$progressPage$remainingTime$de._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$de extends Translations$webSharePage$en {
  _Translations$webSharePage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Per Link teilen';
  @override
  String get loading => 'Starte Server…';
  @override
  String get stopping => 'Stoppe server…';
  @override
  String get error => 'Ein Fehler ist beim Starten des Servers aufgetreten.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
    n,
    one: 'Öffne diesen Link im Browser:',
    other: 'Öffne einer dieser Links im Browser:',
  );
  @override
  String get requests => 'Anfragen';
  @override
  String get noRequests => 'Bisher keine Anfragen erhalten.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Anfragen automatisch akzeptieren';
  @override
  String get requirePin => 'PIN erforderlich';
  @override
  String pinHint({required Object pin}) => 'Die PIN lautet "${pin}"';
  @override
  String get encryptionHint => 'LocalSend verwendet ein selbstsigniertes Zertifikat. Du musst es im Browser akzeptieren.';
  @override
  String pendingRequests({required Object n}) => 'Offene Anfragen: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$de extends Translations$aboutPage$en {
  _Translations$aboutPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Über LocalSend';
  @override
  List<String> get description => [
    'LocalSend ist eine kostenlose Open-Source-App, mit der du Dateien und Nachrichten sicher über dein lokales Netzwerk mit Geräten in der Nähe teilen kannst, ohne dass eine Internetverbindung erforderlich ist.',
    'Diese App ist für Android, iOS, macOS, Windows und Linux verfügbar. Alle Downloadmöglichkeiten findest du auf der offiziellen Homepage.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Mitwirkende';
  @override
  String get packagers => 'Paketierende';
  @override
  String get translators => 'Übersetzende';
}

// Path: donationPage
class _Translations$donationPage$de extends Translations$donationPage$en {
  _Translations$donationPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Spenden';
  @override
  String get info =>
      'LocalSend ist kostenlos, quelloffen und frei von Werbung. Wenn dir diese App gefällt, kannst du die Entwicklung mit einer Spende unterstützen.';
  @override
  String donate({required Object amount}) => 'Spende ${amount}';
  @override
  String get thanks => 'Vielen Dank für deine Unterstützung!';
  @override
  String get restore => 'Käufe wiederherstellen';
}

// Path: changelogPage
class _Translations$changelogPage$de extends Translations$changelogPage$en {
  _Translations$changelogPage$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Änderungsprotokoll';
}

// Path: dialogs
class _Translations$dialogs$de extends Translations$dialogs$en {
  _Translations$dialogs$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$de addFile = _Translations$dialogs$addFile$de._(_root);
  @override
  late final _Translations$dialogs$openFile$de openFile = _Translations$dialogs$openFile$de._(_root);
  @override
  late final _Translations$dialogs$addressInput$de addressInput = _Translations$dialogs$addressInput$de._(_root);
  @override
  late final _Translations$dialogs$cancelSession$de cancelSession = _Translations$dialogs$cancelSession$de._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$de cannotOpenFile = _Translations$dialogs$cannotOpenFile$de._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$de encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$de._(_root);
  @override
  late final _Translations$dialogs$errorDialog$de errorDialog = _Translations$dialogs$errorDialog$de._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$de favoriteDialog = _Translations$dialogs$favoriteDialog$de._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$de favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$de._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$de favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$de._(_root);
  @override
  late final _Translations$dialogs$fileInfo$de fileInfo = _Translations$dialogs$fileInfo$de._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$de fileNameInput = _Translations$dialogs$fileNameInput$de._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$de historyClearDialog = _Translations$dialogs$historyClearDialog$de._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$de localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$de._(_root);
  @override
  late final _Translations$dialogs$messageInput$de messageInput = _Translations$dialogs$messageInput$de._(_root);
  @override
  late final _Translations$dialogs$noFiles$de noFiles = _Translations$dialogs$noFiles$de._(_root);
  @override
  late final _Translations$dialogs$noPermission$de noPermission = _Translations$dialogs$noPermission$de._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$de notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$de._(_root);
  @override
  late final _Translations$dialogs$qr$de qr = _Translations$dialogs$qr$de._(_root);
  @override
  late final _Translations$dialogs$quickActions$de quickActions = _Translations$dialogs$quickActions$de._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$de quickSaveNotice = _Translations$dialogs$quickSaveNotice$de._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$de quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$de._(_root);
  @override
  late final _Translations$dialogs$pin$de pin = _Translations$dialogs$pin$de._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$de sendModeHelp = _Translations$dialogs$sendModeHelp$de._(_root);
  @override
  late final _Translations$dialogs$zoom$de zoom = _Translations$dialogs$zoom$de._(_root);
}

// Path: sanitization
class _Translations$sanitization$de extends Translations$sanitization$en {
  _Translations$sanitization$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Dateiname darf nicht leer sein';
  @override
  String get invalid => 'Dateiname enthält ungültige Zeichen';
}

// Path: tray
class _Translations$tray$de extends Translations$tray$en {
  _Translations$tray$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend beenden';
  @override
  String get closeWindows => 'Beenden';
}

// Path: web
class _Translations$web$de extends Translations$web$en {
  _Translations$web$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN eingeben';
  @override
  String get invalidPin => 'Ungültige PIN';
  @override
  String get tooManyAttempts => 'Zu viele Versuche';
  @override
  String get rejected => 'Abgelehnt';
  @override
  String get files => 'Dateien';
  @override
  String get fileName => 'Dateiname';
  @override
  String get size => 'Größe';
}

// Path: assetPicker
class _Translations$assetPicker$de extends Translations$assetPicker$en {
  _Translations$assetPicker$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Bestätigen';
  @override
  String get cancel => 'Abbrechen';
  @override
  String get edit => 'Bearbeiten';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Ladevorgang ist fehlgeschlagen';
  @override
  String get original => 'Ursprung';
  @override
  String get preview => 'Vorschau';
  @override
  String get select => 'Auswählen';
  @override
  String get emptyList => 'Leere Liste';
  @override
  String get unSupportedAssetType => 'Format ist nicht unterstützt.';
  @override
  String get unableToAccessAll => 'Zugriff nicht möglich';
  @override
  String get viewingLimitedAssetsTip => 'Zeige nur Dateien und Alben an, auf die die App zugreifen kann.';
  @override
  String get changeAccessibleLimitedAssets => 'Tippen, um erlaubte Dateien zu aktualisieren';
  @override
  String get accessAllTip =>
      'Die App kann nur auf einige der Dateien auf dem Gerät zugreifen. Öffne die Systemeinstellungen und erlaube der App, auf alle Dateien auf dem Gerät zuzugreifen.';
  @override
  String get goToSystemSettings => 'Gehe zu den Systemeinstellungen';
  @override
  String get accessLimitedAssets => 'Fahre mit eingeschränktem Zugriff fort';
  @override
  String get accessiblePathName => 'Verfügbare Assets';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Bild';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Andere Medien';
  @override
  String get sActionPlayHint => 'Abspielen';
  @override
  String get sActionPreviewHint => 'Vorschau';
  @override
  String get sActionSelectHint => 'Auswählen';
  @override
  String get sActionSwitchPathLabel => 'Dateipfad ändern';
  @override
  String get sActionUseCameraHint => 'Kamera benutzen';
  @override
  String get sNameDurationLabel => 'Dauer';
  @override
  String get sUnitAssetCountLabel => 'Anzahl';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$de extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$de extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoriten';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$de extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Auswahl';
  @override
  String files({required Object files}) => 'Dateien: ${files}';
  @override
  String size({required Object size}) => 'Größe: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$de extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Datei';
  @override
  String get folder => 'Ordner';
  @override
  String get media => 'Medien';
  @override
  String get text => 'Text';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Ablage';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$de extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Einzelner Empfänger';
  @override
  String get multiple => 'Mehrere Empfänger';
  @override
  String get link => 'Per Link teilen';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$de extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Allgemein';
  @override
  String get brightness => 'Helligkeit';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$de brightnessOptions = _Translations$settingsTab$general$brightnessOptions$de._(
    _root,
  );
  @override
  String get color => 'Farbe';
  @override
  late final _Translations$settingsTab$general$colorOptions$de colorOptions = _Translations$settingsTab$general$colorOptions$de._(_root);
  @override
  String get language => 'Sprache';
  @override
  late final _Translations$settingsTab$general$languageOptions$de languageOptions = _Translations$settingsTab$general$languageOptions$de._(_root);
  @override
  String get saveWindowPlacement => 'Beenden: Fensterposition speichern';
  @override
  String get saveWindowPlacementWindows => 'Beenden: Fensterposition speichern';
  @override
  String get minimizeToTray => 'Beenden: in Symbolleiste minimieren';
  @override
  String get launchAtStartup => 'Autostart nach Login';
  @override
  String get launchMinimized => 'Autostart: versteckt starten';
  @override
  String get showInContextMenu => 'LocalSend im Kontextmenü anzeigen';
  @override
  String get animations => 'Animationen';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$de extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Empfangen';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Autom. beenden';
  @override
  String get destination => 'Ziel-Ordner';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Medien in die Galerie speichern';
  @override
  String get saveToHistory => 'In Verlauf speichern';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$de extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Senden';
  @override
  String get shareViaLinkAutoAccept => 'Link teilen: Autom. akzeptieren';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$de extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Netzwerk';
  @override
  String get needRestart => 'Starte den Server neu, um die Änderungen zu übernehmen!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Gerätetyp';
  @override
  String get deviceModel => 'Gerätemodell';
  @override
  String get port => 'Port';
  @override
  String get network => 'Netzwerk';
  @override
  late final _Translations$settingsTab$network$networkOptions$de networkOptions = _Translations$settingsTab$network$networkOptions$de._(_root);
  @override
  String get discoveryTimeout => 'Erkennungs-Timeout';
  @override
  String get useSystemName => 'Systemnamen verwenden';
  @override
  String get generateRandomAlias => 'Zufälligen Alias generieren';
  @override
  String portWarning({required Object defaultPort}) =>
      'Möglicherweise wirst du von anderen Geräten nicht erkannt, weil du einen benutzerdefinierten Port verwendest. (Standard: ${defaultPort})';
  @override
  String get encryption => 'Verschlüsselung';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Möglicherweise wirst du von anderen Geräten nicht erkannt, weil du eine benutzerdefinierte Multicast-Adresse verwendest. (Standard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$de extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Weitere';
  @override
  String get support => 'LocalSend unterstützen';
  @override
  String get donate => 'Spenden';
  @override
  String get privacyPolicy => 'Datenschutzerklärung';
  @override
  String get termsOfUse => 'Nutzungsbedingungen';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$de extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Diese App kann Dateien an andere Geräte senden, aber nicht umgekehrt.';
  @override
  String solution({required Object port}) =>
      'Dies ist höchstwahrscheinlich ein Firewall-Problem. Du kannst es lösen, indem du eingehende Verbindungen (UDP und TCP) auf Port ${port} zulässt.';
  @override
  String get openFirewall => 'Firewall öffnen';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$de extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Dieses Gerät kann keine anderen Geräte entdecken.';
  @override
  String get solution =>
      'Stelle sicher, dass alle Geräte im selben Wi-Fi-Netzwerk sind und die gleiche Konfiguration teilen (Port, Multicast-Adresse, Verschlüsselung). Du kannst versuchen, die IP-Adresse des Zielgeräts manuell einzugeben. Wenn dies funktioniert, füge dieses Gerät zu den Favoriten hinzu, damit es in Zukunft automatisch entdeckt werden kann.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$de extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Beide Geräte können sich weder sehen noch können sie Dateien miteinander teilen.';
  @override
  String get solution =>
      'Das Problem tritt auf beiden Seiten auf? Dann stelle sicher, dass beide Geräte im selben WLAN sind sowie dieselbe Konfiguration (Port, Multicast-Adresse, Verschlüsselung) haben. Es kann sein, dass das WLAN keine Kommunikation zwischen Teilnehmern erlaubt (AP-Isolation). In diesem Fall muss am Router diese Option aktiviert werden.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$de extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Datei öffnen';
  @override
  String get showInFolder => 'Im Ordner anzeigen';
  @override
  String get info => 'Information';
  @override
  String get deleteFromHistory => 'Vom Verlauf entfernen';
}

// Path: progressPage.total
class _Translations$progressPage$total$de extends Translations$progressPage$total$en {
  _Translations$progressPage$total$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$de title = _Translations$progressPage$total$title$de._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Dateien: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Größe: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Geschwindigkeit: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$de extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Benutze 'h' als Abkürzung für Stunden und 'm' für Minuten
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Benutze 'd' für Tage, 'h' für Stunden und 'm' für Minuten
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$de extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zur Auswahl hinzufügen';
  @override
  String get content => 'Was möchtest du zum Senden hinzufügen?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$de extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Datei öffnen';
  @override
  String get content => 'Möchtest du die empfangene Datei öffnen?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$de extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adresse eingeben';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP-Adresse';
  @override
  String get recentlyUsed => 'Zuletzt verwendet: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$de extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dateiübertragung abbrechen';
  @override
  String get content => 'Möchtest du wirklich die Dateiübertragung abbrechen?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$de extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Öffnen fehlgeschlagen';
  @override
  String content({required Object file}) =>
      'Die Datei "${file}" konnte nicht geöffnet werden. Wurde diese Datei verschoben, umbenannt oder gelöscht?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$de extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verschlüsselung deaktiviert';
  @override
  String get content =>
      'Die Kommunikation erfolgt nun über das unverschlüsselte HTTP-Protokoll. Um HTTPS zu verwenden, aktiviere wieder die Verschlüsselung.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$de extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$de extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoriten';
  @override
  String get noFavorites => 'Keine Favoriten konfiguriert.';
  @override
  String get addFavorite => 'Neu';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$de extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorit löschen';
  @override
  String content({required Object name}) => 'Möchtest du wirklich "${name}" löschen?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$de extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Favorit hinzufügen';
  @override
  String get titleEdit => 'Favorit bearbeiten';
  @override
  String get name => 'Name';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP-Adresse';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$de extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Datei-Information';
  @override
  String get fileName => 'Dateiname:';
  @override
  String get path => 'Pfad:';
  @override
  String get size => 'Größe:';
  @override
  String get sender => 'Absender:';
  @override
  String get time => 'Zeit:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$de extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dateiname eingeben';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$de extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verlauf löschen';
  @override
  String get content => 'Möchtest du wirklich den gesamten Verlauf löschen?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$de extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend kann nicht auf das lokale Netzwerk zugreifen. Bitte erlaube LocalSend den Zugriff auf das lokale Netzwerk in den Einstellungen.';
  @override
  String get gotoSettings => 'Einstellungen';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$de extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nachricht eingeben';
  @override
  String get multiline => 'Mehrzeilig';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$de extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Keine Datei ausgewählt';
  @override
  String get content => 'Bitte wähle mindestens eine Datei aus.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$de extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Keine Berechtigung';
  @override
  String get content => 'Du hast die erforderlichen Berechtigungen nicht gewährt. Bitte gewähre sie in den Einstellungen.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$de extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nicht verfügbar';
  @override
  String get content => 'Diese Funktion ist nur verfügbar auf:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$de extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-Code';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$de extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Quick Actions';
  @override
  String get counter => 'Zähler';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Mit Nullen auffüllen';
  @override
  String get sortBeforeCount => 'Vorher alphabetisch sortieren';
  @override
  String get random => 'Zufall';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$de extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Dateianfragen werden automatisch akzeptiert. Beachte, dass jeder im lokalen Netzwerk dir Dateien senden kann.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$de extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Dateianfragen werden jetzt automatisch von Geräten in deiner Favoritenliste akzeptiert.',
    'Warnung: Dies ist derzeit nicht vollständig sicher, da ein Hacker, der den Fingerabdruck der Geräte in deiner Favoritenliste kennt, dir immer noch Dateien senden kann.',
    'Diese Option ist jedoch immer noch sicherer als die Erlaubnis für jedes Gerät.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$de extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN eingeben';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$de extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sendemodus';
  @override
  String get single => 'Sende Dateien an einen Empfänger. Die Auswahl wird nach Abschluss der Dateiübertragung gelöscht.';
  @override
  String get multiple => 'Sende Dateien an mehrere Empfänger. Die Auswahl bleibt erhalten.';
  @override
  String get link =>
      'Empfänger, die LocalSend nicht installiert haben, können die ausgewählten Dateien herunterladen, in dem sie den Link im Browser öffnen.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$de extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$de extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get dark => 'Dunkel';
  @override
  String get light => 'Hell';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$de extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$de extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$de extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Alle';
  @override
  String get filtered => 'Gefiltert';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$de extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$de._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Gesamtfortschritt (${time})';
  @override
  String get finishedError => 'Abgeschlossen mit Fehler';
  @override
  String get canceledSender => 'Abgebrochen durch Absender';
  @override
  String get canceledReceiver => 'Abgebrochen durch Empfänger';
}
