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
class TranslationsDe extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'Deutsch';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralDe general = _TranslationsGeneralDe._(_root);
  @override
  late final _TranslationsReceiveTabDe receiveTab = _TranslationsReceiveTabDe._(_root);
  @override
  late final _TranslationsSendTabDe sendTab = _TranslationsSendTabDe._(_root);
  @override
  late final _TranslationsSettingsTabDe settingsTab = _TranslationsSettingsTabDe._(_root);
  @override
  late final _TranslationsTroubleshootPageDe troubleshootPage = _TranslationsTroubleshootPageDe._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageDe networkInterfacesPage = _TranslationsNetworkInterfacesPageDe._(_root);
  @override
  late final _TranslationsReceiveHistoryPageDe receiveHistoryPage = _TranslationsReceiveHistoryPageDe._(_root);
  @override
  late final _TranslationsApkPickerPageDe apkPickerPage = _TranslationsApkPickerPageDe._(_root);
  @override
  late final _TranslationsSelectedFilesPageDe selectedFilesPage = _TranslationsSelectedFilesPageDe._(_root);
  @override
  late final _TranslationsReceivePageDe receivePage = _TranslationsReceivePageDe._(_root);
  @override
  late final _TranslationsReceiveOptionsPageDe receiveOptionsPage = _TranslationsReceiveOptionsPageDe._(_root);
  @override
  late final _TranslationsSendPageDe sendPage = _TranslationsSendPageDe._(_root);
  @override
  late final _TranslationsProgressPageDe progressPage = _TranslationsProgressPageDe._(_root);
  @override
  late final _TranslationsWebSharePageDe webSharePage = _TranslationsWebSharePageDe._(_root);
  @override
  late final _TranslationsAboutPageDe aboutPage = _TranslationsAboutPageDe._(_root);
  @override
  late final _TranslationsDonationPageDe donationPage = _TranslationsDonationPageDe._(_root);
  @override
  late final _TranslationsChangelogPageDe changelogPage = _TranslationsChangelogPageDe._(_root);
  @override
  late final _TranslationsAliasGeneratorDe aliasGenerator = _TranslationsAliasGeneratorDe._(_root);
  @override
  late final _TranslationsDialogsDe dialogs = _TranslationsDialogsDe._(_root);
  @override
  late final _TranslationsSanitizationDe sanitization = _TranslationsSanitizationDe._(_root);
  @override
  late final _TranslationsTrayDe tray = _TranslationsTrayDe._(_root);
  @override
  late final _TranslationsWebDe web = _TranslationsWebDe._(_root);
  @override
  late final _TranslationsAssetPickerDe assetPicker = _TranslationsAssetPickerDe._(_root);
}

// Path: general
class _TranslationsGeneralDe extends TranslationsGeneralEn {
  _TranslationsGeneralDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabDe extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Empfangen';
  @override
  late final _TranslationsReceiveTabInfoBoxDe infoBox = _TranslationsReceiveTabInfoBoxDe._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveDe quickSave = _TranslationsReceiveTabQuickSaveDe._(_root);
}

// Path: sendTab
class _TranslationsSendTabDe extends TranslationsSendTabEn {
  _TranslationsSendTabDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Senden';
  @override
  late final _TranslationsSendTabSelectionDe selection = _TranslationsSendTabSelectionDe._(_root);
  @override
  late final _TranslationsSendTabPickerDe picker = _TranslationsSendTabPickerDe._(_root);
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
  late final _TranslationsSendTabSendModesDe sendModes = _TranslationsSendTabSendModesDe._(_root);
  @override
  String get sendModeHelp => 'Erklärung';
  @override
  String get help => 'Bitte stelle sicher, dass sich das gewünschte Ziel auch im selben WLAN-Netzwerk befindet.';
  @override
  String get placeItems => 'Dateien ablegen, um zu teilen.';
}

// Path: settingsTab
class _TranslationsSettingsTabDe extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Einstellungen';
  @override
  late final _TranslationsSettingsTabGeneralDe general = _TranslationsSettingsTabGeneralDe._(_root);
  @override
  late final _TranslationsSettingsTabReceiveDe receive = _TranslationsSettingsTabReceiveDe._(_root);
  @override
  late final _TranslationsSettingsTabSendDe send = _TranslationsSettingsTabSendDe._(_root);
  @override
  late final _TranslationsSettingsTabNetworkDe network = _TranslationsSettingsTabNetworkDe._(_root);
  @override
  late final _TranslationsSettingsTabOtherDe other = _TranslationsSettingsTabOtherDe._(_root);
  @override
  String get advancedSettings => 'Erweiterte Einstellungen';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageDe extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallDe firewall = _TranslationsTroubleshootPageFirewallDe._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryDe noDiscovery = _TranslationsTroubleshootPageNoDiscoveryDe._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionDe noConnection = _TranslationsTroubleshootPageNoConnectionDe._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageDe extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveHistoryPageDe extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsDe entryActions = _TranslationsReceiveHistoryPageEntryActionsDe._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageDe extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageDe extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Alle löschen';
}

// Path: receivePage
class _TranslationsReceivePageDe extends TranslationsReceivePageEn {
  _TranslationsReceivePageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveOptionsPageDe extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageDe extends TranslationsSendPageEn {
  _TranslationsSendPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageDe extends TranslationsProgressPageEn {
  _TranslationsProgressPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Sende Dateien';
  @override
  String get titleReceiving => 'Empfange Dateien';
  @override
  String get savedToGallery => 'in Fotos gespeichert';
  @override
  late final _TranslationsProgressPageTotalDe total = _TranslationsProgressPageTotalDe._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageDe extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageDe extends TranslationsAboutPageEn {
  _TranslationsAboutPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageDe extends TranslationsDonationPageEn {
  _TranslationsDonationPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageDe extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Änderungsprotokoll';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorDe extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsDe extends TranslationsDialogsEn {
  _TranslationsDialogsDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileDe addFile = _TranslationsDialogsAddFileDe._(_root);
  @override
  late final _TranslationsDialogsOpenFileDe openFile = _TranslationsDialogsOpenFileDe._(_root);
  @override
  late final _TranslationsDialogsAddressInputDe addressInput = _TranslationsDialogsAddressInputDe._(_root);
  @override
  late final _TranslationsDialogsCancelSessionDe cancelSession = _TranslationsDialogsCancelSessionDe._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileDe cannotOpenFile = _TranslationsDialogsCannotOpenFileDe._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeDe encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeDe._(_root);
  @override
  late final _TranslationsDialogsErrorDialogDe errorDialog = _TranslationsDialogsErrorDialogDe._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogDe favoriteDialog = _TranslationsDialogsFavoriteDialogDe._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogDe favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogDe._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogDe favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogDe._(_root);
  @override
  late final _TranslationsDialogsFileInfoDe fileInfo = _TranslationsDialogsFileInfoDe._(_root);
  @override
  late final _TranslationsDialogsFileNameInputDe fileNameInput = _TranslationsDialogsFileNameInputDe._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogDe historyClearDialog = _TranslationsDialogsHistoryClearDialogDe._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedDe localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedDe._(_root);
  @override
  late final _TranslationsDialogsMessageInputDe messageInput = _TranslationsDialogsMessageInputDe._(_root);
  @override
  late final _TranslationsDialogsNoFilesDe noFiles = _TranslationsDialogsNoFilesDe._(_root);
  @override
  late final _TranslationsDialogsNoPermissionDe noPermission = _TranslationsDialogsNoPermissionDe._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformDe notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformDe._(_root);
  @override
  late final _TranslationsDialogsQrDe qr = _TranslationsDialogsQrDe._(_root);
  @override
  late final _TranslationsDialogsQuickActionsDe quickActions = _TranslationsDialogsQuickActionsDe._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeDe quickSaveNotice = _TranslationsDialogsQuickSaveNoticeDe._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeDe quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeDe._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinDe pin = _TranslationsDialogsPinDe._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpDe sendModeHelp = _TranslationsDialogsSendModeHelpDe._(_root);
  @override
  late final _TranslationsDialogsZoomDe zoom = _TranslationsDialogsZoomDe._(_root);
}

// Path: sanitization
class _TranslationsSanitizationDe extends TranslationsSanitizationEn {
  _TranslationsSanitizationDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Dateiname darf nicht leer sein';
  @override
  String get invalid => 'Dateiname enthält ungültige Zeichen';
}

// Path: tray
class _TranslationsTrayDe extends TranslationsTrayEn {
  _TranslationsTrayDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsWebDe extends TranslationsWebEn {
  _TranslationsWebDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerDe extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxDe extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveDe extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionDe extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerDe extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesDe extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralDe extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Allgemein';
  @override
  String get brightness => 'Helligkeit';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsDe brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsDe._(_root);
  @override
  String get color => 'Farbe';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsDe colorOptions = _TranslationsSettingsTabGeneralColorOptionsDe._(_root);
  @override
  String get language => 'Sprache';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsDe languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsDe._(_root);
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
class _TranslationsSettingsTabReceiveDe extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendDe extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Senden';
  @override
  String get shareViaLinkAutoAccept => 'Link teilen: Autom. akzeptieren';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkDe extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsDe networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsDe._(_root);
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
class _TranslationsSettingsTabOtherDe extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallDe extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Diese App kann Dateien an andere Geräte senden, aber nicht umgekehrt.';
  @override
  String solution({required Object port}) =>
      'Dies ist höchstwahrscheinlich ein Firewall-Problem. Du kannst es lösen, indem du eingehende Verbindungen (UDP und TCP) auf Port ${port} zulässt.';
  @override
  String get openFirewallSettings => 'Firewall öffnen';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryDe extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Dieses Gerät kann keine anderen Geräte entdecken.';
  @override
  String get solution =>
      'Stelle sicher, dass alle Geräte im selben Wi-Fi-Netzwerk sind und die gleiche Konfiguration teilen (Port, Multicast-Adresse, Verschlüsselung). Du kannst versuchen, die IP-Adresse des Zielgeräts manuell einzugeben. Wenn dies funktioniert, füge dieses Gerät zu den Favoriten hinzu, damit es in Zukunft automatisch entdeckt werden kann.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionDe extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Beide Geräte können sich weder sehen noch können sie Dateien miteinander teilen.';
  @override
  String get solution =>
      'Das Problem tritt auf beiden Seiten auf? Dann stelle sicher, dass beide Geräte im selben WLAN sind sowie dieselbe Konfiguration (Port, Multicast-Adresse, Verschlüsselung) haben. Es kann sein, dass das WLAN keine Kommunikation zwischen Teilnehmern erlaubt (AP-Isolation). In diesem Fall muss am Router diese Option aktiviert werden.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsDe extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalDe extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleDe title = _TranslationsProgressPageTotalTitleDe._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Dateien: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Größe: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Geschwindigkeit: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileDe extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zur Auswahl hinzufügen';
  @override
  String get content => 'Was möchtest du zum Senden hinzufügen?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileDe extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Datei öffnen';
  @override
  String get content => 'Möchtest du die empfangene Datei öffnen?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputDe extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionDe extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dateiübertragung abbrechen';
  @override
  String get content => 'Möchtest du wirklich die Dateiübertragung abbrechen?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileDe extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Öffnen fehlgeschlagen';
  @override
  String content({required Object file}) =>
      'Die Datei "${file}" konnte nicht geöffnet werden. Wurde diese Datei verschoben, umbenannt oder gelöscht?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeDe extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verschlüsselung deaktiviert';
  @override
  String get content =>
      'Die Kommunikation erfolgt nun über das unverschlüsselte HTTP-Protokoll. Um HTTPS zu verwenden, aktiviere wieder die Verschlüsselung.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogDe extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogDe extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogDe extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorit löschen';
  @override
  String content({required Object name}) => 'Möchtest du wirklich "${name}" löschen?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogDe extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoDe extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputDe extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dateiname eingeben';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogDe extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Verlauf löschen';
  @override
  String get content => 'Möchtest du wirklich den gesamten Verlauf löschen?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedDe extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputDe extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nachricht eingeben';
  @override
  String get multiline => 'Mehrzeilig';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesDe extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Keine Datei ausgewählt';
  @override
  String get content => 'Bitte wähle mindestens eine Datei aus.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionDe extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Keine Berechtigung';
  @override
  String get content => 'Du hast die erforderlichen Berechtigungen nicht gewährt. Bitte gewähre sie in den Einstellungen.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformDe extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nicht verfügbar';
  @override
  String get content => 'Diese Funktion ist nur verfügbar auf:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrDe extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-Code';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsDe extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeDe extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Dateianfragen werden automatisch akzeptiert. Beachte, dass jeder im lokalen Netzwerk dir Dateien senden kann.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeDe extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinDe extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN eingeben';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpDe extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomDe extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsDe extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsDe extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsDe extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsDe extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

  final TranslationsDe _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Alle';
  @override
  String get filtered => 'Gefiltert';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleDe extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleDe._(TranslationsDe root) : this._root = root, super.internal(root);

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
