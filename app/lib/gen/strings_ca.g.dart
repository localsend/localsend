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
class TranslationsCa extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.ca,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ca>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsCa _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Català';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralCa general = _TranslationsGeneralCa._(_root);
  @override
  late final _TranslationsReceiveTabCa receiveTab = _TranslationsReceiveTabCa._(_root);
  @override
  late final _TranslationsSendTabCa sendTab = _TranslationsSendTabCa._(_root);
  @override
  late final _TranslationsSettingsTabCa settingsTab = _TranslationsSettingsTabCa._(_root);
  @override
  late final _TranslationsTroubleshootPageCa troubleshootPage = _TranslationsTroubleshootPageCa._(_root);
  @override
  late final _TranslationsReceiveHistoryPageCa receiveHistoryPage = _TranslationsReceiveHistoryPageCa._(_root);
  @override
  late final _TranslationsApkPickerPageCa apkPickerPage = _TranslationsApkPickerPageCa._(_root);
  @override
  late final _TranslationsSelectedFilesPageCa selectedFilesPage = _TranslationsSelectedFilesPageCa._(_root);
  @override
  late final _TranslationsReceivePageCa receivePage = _TranslationsReceivePageCa._(_root);
  @override
  late final _TranslationsReceiveOptionsPageCa receiveOptionsPage = _TranslationsReceiveOptionsPageCa._(_root);
  @override
  late final _TranslationsSendPageCa sendPage = _TranslationsSendPageCa._(_root);
  @override
  late final _TranslationsProgressPageCa progressPage = _TranslationsProgressPageCa._(_root);
  @override
  late final _TranslationsWebSharePageCa webSharePage = _TranslationsWebSharePageCa._(_root);
  @override
  late final _TranslationsAboutPageCa aboutPage = _TranslationsAboutPageCa._(_root);
  @override
  late final _TranslationsDonationPageCa donationPage = _TranslationsDonationPageCa._(_root);
  @override
  late final _TranslationsChangelogPageCa changelogPage = _TranslationsChangelogPageCa._(_root);
  @override
  late final _TranslationsAliasGeneratorCa aliasGenerator = _TranslationsAliasGeneratorCa._(_root);
  @override
  late final _TranslationsDialogsCa dialogs = _TranslationsDialogsCa._(_root);
  @override
  late final _TranslationsSanitizationCa sanitization = _TranslationsSanitizationCa._(_root);
  @override
  late final _TranslationsTrayCa tray = _TranslationsTrayCa._(_root);
  @override
  late final _TranslationsWebCa web = _TranslationsWebCa._(_root);
  @override
  late final _TranslationsAssetPickerCa assetPicker = _TranslationsAssetPickerCa._(_root);
}

// Path: general
class _TranslationsGeneralCa extends TranslationsGeneralEn {
  _TranslationsGeneralCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Acceptar';
  @override
  String get accepted => 'Acceptat';
  @override
  String get add => 'Afegir';
  @override
  String get advanced => 'Avançat';
  @override
  String get cancel => 'Cancel·lar';
  @override
  String get close => 'Tancar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueStr => 'Continuar';
  @override
  String get copy => 'Copiar';
  @override
  String get copiedToClipboard => 'Copiat al porta-paper';
  @override
  String get decline => 'Rebutjar';
  @override
  String get done => 'Fet';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Error';
  @override
  String get example => 'Exemple';
  @override
  String get files => 'Fitxers';
  @override
  String get finished => 'Finalitzat';
  @override
  String get hide => 'Amagar';
  @override
  String get off => 'Apagat';
  @override
  String get offline => 'Desconnectat';
  @override
  String get on => 'Encès';
  @override
  String get online => 'En línia';
  @override
  String get open => 'Obrir';
  @override
  String get queue => 'Cua';
  @override
  String get quickSave => 'Desar ràpid';
  @override
  String get quickSaveFromFavorites => 'Desar ràpid per "Preferits"';
  @override
  String get renamed => 'Reanomenar';
  @override
  String get reset => 'Restablir';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Configuració';
  @override
  String get skipped => 'Omès';
  @override
  String get start => 'Iniciar';
  @override
  String get stop => 'Parar';
  @override
  String get save => 'Desar';
  @override
  String get unchanged => 'No canviat';
  @override
  String get unknown => 'Desconegut';
  @override
  String get noItemInClipboard => 'No hi ha elements al porta-papers.';
}

// Path: receiveTab
class _TranslationsReceiveTabCa extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rebre';
  @override
  late final _TranslationsReceiveTabInfoBoxCa infoBox = _TranslationsReceiveTabInfoBoxCa._(_root);
}

// Path: sendTab
class _TranslationsSendTabCa extends TranslationsSendTabEn {
  _TranslationsSendTabCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _TranslationsSendTabSelectionCa selection = _TranslationsSendTabSelectionCa._(_root);
  @override
  late final _TranslationsSendTabPickerCa picker = _TranslationsSendTabPickerCa._(_root);
  @override
  String get shareIntentInfo =>
      'També pot utilitzar l\'opció de "Compartir" del seu dispositiu mòbil per seleccionar fitxer d\'una manera més fàcil.';
  @override
  String get nearbyDevices => 'Dispositius propers';
  @override
  String get thisDevice => 'Aquest dispositiu';
  @override
  String get scan => 'Cercar dispositius';
  @override
  String get manualSending => 'Enviament manual';
  @override
  String get sendMode => 'Mode d\'enviament';
  @override
  late final _TranslationsSendTabSendModesCa sendModes = _TranslationsSendTabSendModesCa._(_root);
  @override
  String get sendModeHelp => 'Explicació';
  @override
  String get help => 'Si us plau, asseguris que el destinatari està a la mateixa xarxa Wi-Fi.';
  @override
  String get placeItems => 'Place items to share.';
}

// Path: settingsTab
class _TranslationsSettingsTabCa extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configuració';
  @override
  late final _TranslationsSettingsTabGeneralCa general = _TranslationsSettingsTabGeneralCa._(_root);
  @override
  late final _TranslationsSettingsTabReceiveCa receive = _TranslationsSettingsTabReceiveCa._(_root);
  @override
  late final _TranslationsSettingsTabSendCa send = _TranslationsSettingsTabSendCa._(_root);
  @override
  late final _TranslationsSettingsTabNetworkCa network = _TranslationsSettingsTabNetworkCa._(_root);
  @override
  late final _TranslationsSettingsTabOtherCa other = _TranslationsSettingsTabOtherCa._(_root);
  @override
  String get advancedSettings => 'Configuració avançada';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageCa extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Solucionar problemes';
  @override
  String get subTitle => 'L\'aplicació no funciona com s\'espera? Aquí pot trobar la solucions dels problemes més comuns.';
  @override
  String get solution => 'Solució:';
  @override
  String get fixButton => 'Corregir automàticament';
  @override
  late final _TranslationsTroubleshootPageFirewallCa firewall = _TranslationsTroubleshootPageFirewallCa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryCa noDiscovery = _TranslationsTroubleshootPageNoDiscoveryCa._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionCa noConnection = _TranslationsTroubleshootPageNoConnectionCa._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageCa extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historial';
  @override
  String get openFolder => 'Obrir carpeta';
  @override
  String get deleteHistory => 'Eliminar historial';
  @override
  String get empty => 'L\'historial està buit.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsCa entryActions = _TranslationsReceiveHistoryPageEntryActionsCa._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageCa extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicacions (APK)';
  @override
  String get excludeSystemApps => 'Excloure aplicacions del sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Excloure aplicacions no executables';
  @override
  String apps({required Object n}) => '${n} Aplicacions';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageCa extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Eliminar tot';
}

// Path: receivePage
class _TranslationsReceivePageCa extends TranslationsReceivePageEn {
  _TranslationsReceivePageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n, one: 'vol enviar un fitxer', other: 'vol enviar ${n} fitxers');
  @override
  String get subTitleMessage => 't\'ha enviat un missatge:';
  @override
  String get subTitleLink => 't\'ha enviat un enllaç:';
  @override
  String get canceled => 'El remitent ha cancelat la petició.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageCa extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opcions';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Carpeta LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'S\'ha desactivat automàticament perquè hi ha carpetes.';
}

// Path: sendPage
class _TranslationsSendPageCa extends TranslationsSendPageEn {
  _TranslationsSendPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Esperant una resposta...';
  @override
  String get rejected => 'El destinatari ha rebutjat la petició.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'El destinatari està ocupat amb una altra petició.';
}

// Path: progressPage
class _TranslationsProgressPageCa extends TranslationsProgressPageEn {
  _TranslationsProgressPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Enviant fitxers';
  @override
  String get titleReceiving => 'Rebent fitxers';
  @override
  String get savedToGallery => 'Guardar a Fotos';
  @override
  late final _TranslationsProgressPageTotalCa total = _TranslationsProgressPageTotalCa._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageCa extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Compartir via enllaç';
  @override
  String get loading => 'Iniciant servidor...';
  @override
  String get stopping => 'Parant servidor...';
  @override
  String get error => 'Hi ha hagut un error mentre s\'iniciava el servidor.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(
    n,
    one: 'Obrir l\'enllaç al navegador:',
    other: 'Obrir un d\'aquests enllaços al navegador:',
  );
  @override
  String get requests => 'Peticions';
  @override
  String get noRequests => 'Encara no hi ha peticions.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Acceptar peticions automàticament';
  @override
  String get requirePin => 'Requerir un PIN';
  @override
  String pinHint({required Object pin}) => 'El PIN és "${pin}"';
  @override
  String get encryptionHint => 'LocalSend utilitza un certificat auto-signat. Cal que l\'accepteu al navegador.';
  @override
  String pendingRequests({required Object n}) => 'Peticions pendents: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageCa extends TranslationsAboutPageEn {
  _TranslationsAboutPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sobre LocalSend';
  @override
  List<String> get description => [
    'LocalSend és una aplicació gratuïta i de codi obert que us permet compartir fitxers i missatges de manera segura amb dispositius propers a la vostra xarxa local sense necessitat de connexió a Internet.',
    'Aquesta aplicació està disponible per a Android, iOS, macOS, Windows i Linux. Pot trobar totes les opcions de descàrrega a la pàgina d\'inici oficial.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Col·laboradors';
  @override
  String get packagers => 'Empaquetadors';
  @override
  String get translators => 'Traductors';
}

// Path: donationPage
class _TranslationsDonationPageCa extends TranslationsDonationPageEn {
  _TranslationsDonationPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donació';
  @override
  String get info =>
      'LocalSend és gratuït, de codi obert i sense cap anunci. Si t\'agrada l\'aplicació, pots donar suport al desenvolupament amb una donació.';
  @override
  String donate({required Object amount}) => 'Donació ${amount}';
  @override
  String get thanks => 'Moltes gràcies!';
  @override
  String get restore => 'Restaurar la compra';
}

// Path: changelogPage
class _TranslationsChangelogPageCa extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registre de canvis';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorCa extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Adorable',
    'Bonic',
    'Gran',
    'Brillant',
    'Neteja',
    'Intel·ligent',
    'Guai',
    'Bonic',
    'Astúcia',
    'Determinat',
    'Energètic',
    'Eficient',
    'Fantàstic',
    'Ràpid',
    'Bé',
    'Fresca',
    'Bo',
    'Preciós',
    'Genial',
    'Guapo',
    'Calent',
    'Amable',
    'Encantador',
    'Místic',
    'Producte',
    'Bonic',
    'Pacient',
    'Bonic',
    'Potent',
    'Ric',
    'Secret',
    'Intel·ligent',
    'Sòlid',
    'Especial',
    'Estratègic',
    'Fort',
    'Endreçat',
    'Savi',
  ];
  @override
  List<String> get fruits => [
    'Poma',
    'Alvocat',
    'Plàtan',
    'Blackberry',
    'Nabiu',
    'Bròquil',
    'Pastanaga',
    'Cirera',
    'Coco',
    'Raïm',
    'Llimona',
    'Enciam',
    'Mango',
    'Meló',
    'Bolet',
    'Ceba',
    'Taronja',
    'Papaia',
    'Préssec',
    'Pera',
    'Pinya',
    'Patata',
    'Carbassa',
    'Gerd',
    'Maduixa',
    'Tomàquet',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _TranslationsDialogsCa extends TranslationsDialogsEn {
  _TranslationsDialogsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileCa addFile = _TranslationsDialogsAddFileCa._(_root);
  @override
  late final _TranslationsDialogsAddressInputCa addressInput = _TranslationsDialogsAddressInputCa._(_root);
  @override
  late final _TranslationsDialogsCancelSessionCa cancelSession = _TranslationsDialogsCancelSessionCa._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileCa cannotOpenFile = _TranslationsDialogsCannotOpenFileCa._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeCa encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeCa._(_root);
  @override
  late final _TranslationsDialogsErrorDialogCa errorDialog = _TranslationsDialogsErrorDialogCa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogCa favoriteDialog = _TranslationsDialogsFavoriteDialogCa._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogCa favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogCa._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogCa favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogCa._(_root);
  @override
  late final _TranslationsDialogsFileInfoCa fileInfo = _TranslationsDialogsFileInfoCa._(_root);
  @override
  late final _TranslationsDialogsFileNameInputCa fileNameInput = _TranslationsDialogsFileNameInputCa._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogCa historyClearDialog = _TranslationsDialogsHistoryClearDialogCa._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedCa localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedCa._(_root);
  @override
  late final _TranslationsDialogsMessageInputCa messageInput = _TranslationsDialogsMessageInputCa._(_root);
  @override
  late final _TranslationsDialogsNoFilesCa noFiles = _TranslationsDialogsNoFilesCa._(_root);
  @override
  late final _TranslationsDialogsNoPermissionCa noPermission = _TranslationsDialogsNoPermissionCa._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformCa notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformCa._(_root);
  @override
  late final _TranslationsDialogsQrCa qr = _TranslationsDialogsQrCa._(_root);
  @override
  late final _TranslationsDialogsQuickActionsCa quickActions = _TranslationsDialogsQuickActionsCa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeCa quickSaveNotice = _TranslationsDialogsQuickSaveNoticeCa._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeCa quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeCa._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinCa pin = _TranslationsDialogsPinCa._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpCa sendModeHelp = _TranslationsDialogsSendModeHelpCa._(_root);
  @override
  late final _TranslationsDialogsZoomCa zoom = _TranslationsDialogsZoomCa._(_root);
}

// Path: sanitization
class _TranslationsSanitizationCa extends TranslationsSanitizationEn {
  _TranslationsSanitizationCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'El nom del fitxer no pot estar buit';
  @override
  String get invalid => 'El nom del fitxer conté caràcters invàlids';
}

// Path: tray
class _TranslationsTrayCa extends TranslationsTrayEn {
  _TranslationsTrayCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Sortir de LocalSend';
  @override
  String get closeWindows => 'Sortir';
}

// Path: web
class _TranslationsWebCa extends TranslationsWebEn {
  _TranslationsWebCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Introduïr PIN';
  @override
  String get invalidPin => 'PIN invàlid';
  @override
  String get tooManyAttempts => 'Massa intents';
  @override
  String get rejected => 'Rebutjat';
  @override
  String get files => 'Fitxers';
  @override
  String get fileName => 'Nom del fitxer';
  @override
  String get size => 'Mida';
}

// Path: assetPicker
class _TranslationsAssetPickerCa extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Confirmar';
  @override
  String get cancel => 'Cancel·lar';
  @override
  String get edit => 'Editar';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Càrrega fallida';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Vista prèvia';
  @override
  String get select => 'Seleccioni';
  @override
  String get emptyList => 'Llista buida';
  @override
  String get unSupportedAssetType => 'Tipus de fitxer no suportat.';
  @override
  String get unableToAccessAll => 'No es pot accedir a tots els fitxers del dispositiu.';
  @override
  String get viewingLimitedAssetsTip => 'Visualitza només fitxers i àlbums accessibles per l\'aplicació.';
  @override
  String get changeAccessibleLimitedAssets => 'Faci clic per actualitzar els fitxers accessibles';
  @override
  String get accessAllTip =>
      'L\'aplicació només pot accedir a alguns fitxers del dispositiu. Vés a la configuració del sistema i permet que l\'aplicació accedeixi a tots els mitjans del dispositiu.';
  @override
  String get goToSystemSettings => 'Anar a la configuració del sistema';
  @override
  String get accessLimitedAssets => 'Continuar amb accés limitat';
  @override
  String get accessiblePathName => 'Fitxers accessibles';
  @override
  String get sTypeAudioLabel => 'Àudio';
  @override
  String get sTypeImageLabel => 'Imatge';
  @override
  String get sTypeVideoLabel => 'Vídeo';
  @override
  String get sTypeOtherLabel => 'Altres medis';
  @override
  String get sActionPlayHint => 'reproduir';
  @override
  String get sActionPreviewHint => 'previ';
  @override
  String get sActionSelectHint => 'selecccionar';
  @override
  String get sActionSwitchPathLabel => 'canviar ruta';
  @override
  String get sActionUseCameraHint => 'utilitzar càmera';
  @override
  String get sNameDurationLabel => 'duració';
  @override
  String get sUnitAssetCountLabel => 'comptar';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxCa extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Àlies:';
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionCa extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selecció';
  @override
  String files({required Object files}) => 'Fitxers: ${files}';
  @override
  String size({required Object size}) => 'Mida: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerCa extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fitxer';
  @override
  String get folder => 'Carpeta';
  @override
  String get media => 'Media';
  @override
  String get text => 'Text';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Enganxar';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesCa extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Destinatari únic';
  @override
  String get multiple => 'Múltiple destinataris';
  @override
  String get link => 'Compartir via enllaç';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralCa extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsCa brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsCa._(_root);
  @override
  String get color => 'Color';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsCa colorOptions = _TranslationsSettingsTabGeneralColorOptionsCa._(_root);
  @override
  String get language => 'Idioma';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsCa languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsCa._(_root);
  @override
  String get saveWindowPlacement => 'Surt: desa la ubicació de la finestra';
  @override
  String get saveWindowPlacementWindows => 'Desa la posició de la finestra després de sortir';
  @override
  String get minimizeToTray => 'Surt: Minimitzar a la safata';
  @override
  String get launchAtStartup => 'Inici automàtic després d\'iniciar sessió';
  @override
  String get launchMinimized => 'Inici automàtic: Inici minimitzat';
  @override
  String get showInContextMenu => 'Mostrar LocalSend al menú contextual';
  @override
  String get animations => 'Animacions';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveCa extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rebre';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Finalització Automàtica';
  @override
  String get destination => 'Destinació';
  @override
  String get downloads => '(Descàrregues)';
  @override
  String get saveToGallery => 'Desar media a la galeria';
  @override
  String get saveToHistory => 'Desa a l\'historial';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendCa extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Acceptar peticions automàticament amb el mode "Compartir mitjançant enllaç"';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkCa extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xarxa';
  @override
  String get needRestart => 'Reiniciar el servidor per aplicar la configuració!';
  @override
  String get server => 'Servidor';
  @override
  String get alias => 'Àlies';
  @override
  String get deviceType => 'Tipus de dispositiu';
  @override
  String get deviceModel => 'Model de dispositiu';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Temps d\'espera de descobriment';
  @override
  String get useSystemName => 'Utilitzar nom del sistema';
  @override
  String get generateRandomAlias => 'Generar àlies aleatòriament';
  @override
  String portWarning({required Object defaultPort}) =>
      'Podria no ser detectat per altres dispositius perquè està utilitzant un port personalitzat. (per defecte: ${defaultPort})';
  @override
  String get encryption => 'Encriptació';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Podria no ser detectat per altres dispositius perquè està utilitzant una adreça multicast personalitzada. (per defecte: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherCa extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Altre';
  @override
  String get support => 'Suport LocalSend';
  @override
  String get donate => 'Donació';
  @override
  String get privacyPolicy => 'Política Privacitat';
  @override
  String get termsOfUse => 'Condicions d\'ús';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallCa extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Aquesta aplicació pot enviar fitxers a altres dispositius però altres dispositius no poden enviar fitxers a aquest.';
  @override
  String solution({required Object port}) =>
      'El més provable és que sigui un problema del tallafocs. Pot solucionar-ho permetent les connexiions entrants (UDP I TCP) al port ${port}.';
  @override
  String get openFirewallSettings => 'Obrir Tallafocs';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryCa extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Aquest dispositiu no pot descobrir altres dispositius.';
  @override
  String get solution =>
      'Si us plau, asseguris que tots els dispositius estan a la mateixa xarxa Wi-Fi i tenen la mateixa configuració (port, adreça multicast i encriptació). Pot provar d\'escriure l\'adreça IP del dispositiu de destí manulament. Si això funciona, consideri afegir aquest dispositiu a preferits per tal de ser descobert automàticament en un futur.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionCa extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambdós dispositius no poden trobar-se ni compartir fitxers.';
  @override
  String get solution =>
      'El problema existeix als dos costats? S\'ha d\'assegurar que els dispositius estan a la mateixa xarxa Wi-Fi i comparteixen la mateixa configuració (port, adreça multicast i encriptació). El Wi-Fi pot no permetre la comunciació entre participants. En aquest cas, s\'ha d\'activar l\'opció a l\'encaminador.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsCa extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Obrir fitxer';
  @override
  String get showInFolder => 'Mostrar a la carpeta';
  @override
  String get info => 'Informació';
  @override
  String get deleteFromHistory => 'Eliminar de l\'historial';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalCa extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleCa title = _TranslationsProgressPageTotalTitleCa._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fitxers: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Mida: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocitat: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileCa extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Afegir a la selecció';
  @override
  String get content => 'Què vol afegir?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputCa extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introdueixi adreça';
  @override
  String get hashtag => 'Etiqueta';
  @override
  String get ip => 'Adreça IP';
  @override
  String get recentlyUsed => 'Utilitzat recentment: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionCa extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancel·lar transferència del fitxer';
  @override
  String get content => 'Segur que vol cancel·lar la transferència del fitxer?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileCa extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No es pot obrir el fitxer';
  @override
  String content({required Object file}) => 'No pot obrir el "${file}". Aquest fitxer s\'ha mogut, reanomenat o eliminat?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeCa extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encriptació deshabilitada';
  @override
  String get content => 'La comunicació ara es fa mitjançant el protocol HTTP no xifrat. Per utilitzar HTTPS, torneu a activar l\'encriptació.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogCa extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogCa extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Preferits';
  @override
  String get noFavorites => 'Encara no hi ha cap dispositiu preferit.';
  @override
  String get addFavorite => 'Afegir';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogCa extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar de preferits';
  @override
  String content({required Object name}) => 'Realment vol eliminar "${name}" de preferits?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogCa extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Afegir a preferits';
  @override
  String get titleEdit => 'Configuració';
  @override
  String get name => 'Nom del dispositiu';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Adreça IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoCa extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informació del fitxer';
  @override
  String get fileName => 'Nom del fitxer:';
  @override
  String get path => 'Ruta:';
  @override
  String get size => 'Mida:';
  @override
  String get sender => 'Remitent:';
  @override
  String get time => 'Temps:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputCa extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introdueixi el nom del fitxer';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogCa extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Netejar historial';
  @override
  String get content => 'Realment vol eliminar tot l\'historial?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedCa extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend no pot trobar altres dispositius sense tenir el permís per escanejar la xarxa local. Concediu aquest permís a la configuració.';
  @override
  String get gotoSettings => 'Configuració';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputCa extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tipus de missatge';
  @override
  String get multiline => 'Multilínia';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesCa extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fitxer no seleccionat';
  @override
  String get content => 'Si us plau, seleccioni un fitxer com a mínim.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionCa extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sense permisos';
  @override
  String get content => 'No has concedit els permisos necessaris. Concediu-los a la configuració.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformCa extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No disponible';
  @override
  String get content => 'Aquesta característica només està disponible a:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrCa extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Codi QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsCa extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Accions Ràpides';
  @override
  String get counter => 'Comptador';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Emplenar amb zeros';
  @override
  String get sortBeforeCount => 'Ordenar prèviament alfabèticament';
  @override
  String get random => 'Aleatori';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeCa extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Les sol·licituds d\'arxiu s\'accepten automàticament. Tingueu en compte que tothom a la xarxa local us pot enviar fitxers.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeCa extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _TranslationsDialogsPinCa extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduïr PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpCa extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modes d\'enviament';
  @override
  String get single => 'Enviar fitxers a un destinatari. La selecció s\'esborrarà un cop finalitzada la transferència de fitxers.';
  @override
  String get multiple => 'Enviar fitxers a diversos destinataris. La selecció no s\'esborrarà.';
  @override
  String get link =>
      'Els destinataris que no tinguin LocalSend instal·lat poden descarregar els fitxers seleccionats obrint l\'enllaç al seu navegador.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomCa extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsCa extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Fosc';
  @override
  String get light => 'Clar';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsCa extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsCa extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleCa extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleCa._(TranslationsCa root) : this._root = root, super.internal(root);

  final TranslationsCa _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progrés total (${time})';
  @override
  String get finishedError => 'Finalitzat amb error';
  @override
  String get canceledSender => 'Cancel·lat pel remitent';
  @override
  String get canceledReceiver => 'Cancelat pel destinatari';
}
