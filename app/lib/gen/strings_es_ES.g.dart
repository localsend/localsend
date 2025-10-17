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
class TranslationsEsEs extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.esEs,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <es-ES>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEsEs _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Español';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralEsEs general = _TranslationsGeneralEsEs._(_root);
  @override
  late final _TranslationsReceiveTabEsEs receiveTab = _TranslationsReceiveTabEsEs._(_root);
  @override
  late final _TranslationsSendTabEsEs sendTab = _TranslationsSendTabEsEs._(_root);
  @override
  late final _TranslationsSettingsTabEsEs settingsTab = _TranslationsSettingsTabEsEs._(_root);
  @override
  late final _TranslationsTroubleshootPageEsEs troubleshootPage = _TranslationsTroubleshootPageEsEs._(_root);
  @override
  late final _TranslationsReceiveHistoryPageEsEs receiveHistoryPage = _TranslationsReceiveHistoryPageEsEs._(_root);
  @override
  late final _TranslationsApkPickerPageEsEs apkPickerPage = _TranslationsApkPickerPageEsEs._(_root);
  @override
  late final _TranslationsSelectedFilesPageEsEs selectedFilesPage = _TranslationsSelectedFilesPageEsEs._(_root);
  @override
  late final _TranslationsReceivePageEsEs receivePage = _TranslationsReceivePageEsEs._(_root);
  @override
  late final _TranslationsReceiveOptionsPageEsEs receiveOptionsPage = _TranslationsReceiveOptionsPageEsEs._(_root);
  @override
  late final _TranslationsSendPageEsEs sendPage = _TranslationsSendPageEsEs._(_root);
  @override
  late final _TranslationsProgressPageEsEs progressPage = _TranslationsProgressPageEsEs._(_root);
  @override
  late final _TranslationsWebSharePageEsEs webSharePage = _TranslationsWebSharePageEsEs._(_root);
  @override
  late final _TranslationsAboutPageEsEs aboutPage = _TranslationsAboutPageEsEs._(_root);
  @override
  late final _TranslationsDonationPageEsEs donationPage = _TranslationsDonationPageEsEs._(_root);
  @override
  late final _TranslationsChangelogPageEsEs changelogPage = _TranslationsChangelogPageEsEs._(_root);
  @override
  late final _TranslationsAliasGeneratorEsEs aliasGenerator = _TranslationsAliasGeneratorEsEs._(_root);
  @override
  late final _TranslationsDialogsEsEs dialogs = _TranslationsDialogsEsEs._(_root);
  @override
  late final _TranslationsSanitizationEsEs sanitization = _TranslationsSanitizationEsEs._(_root);
  @override
  late final _TranslationsTrayEsEs tray = _TranslationsTrayEsEs._(_root);
  @override
  late final _TranslationsWebEsEs web = _TranslationsWebEsEs._(_root);
  @override
  late final _TranslationsAssetPickerEsEs assetPicker = _TranslationsAssetPickerEsEs._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageEsEs networkInterfacesPage = _TranslationsNetworkInterfacesPageEsEs._(_root);
}

// Path: general
class _TranslationsGeneralEsEs extends TranslationsGeneralEn {
  _TranslationsGeneralEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Aceptar';
  @override
  String get accepted => 'Aceptado';
  @override
  String get add => 'Añadir';
  @override
  String get advanced => 'Avanzado';
  @override
  String get cancel => 'Cancelar';
  @override
  String get close => 'Cerrar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueStr => 'Continuar';
  @override
  String get copy => 'Copiar';
  @override
  String get copiedToClipboard => 'Copiado al Portapapeles';
  @override
  String get decline => 'Rechazar';
  @override
  String get done => 'Hecho';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Error';
  @override
  String get example => 'Ejemplo';
  @override
  String get files => 'Archivos';
  @override
  String get finished => 'Finalizado';
  @override
  String get hide => 'Ocultar';
  @override
  String get off => 'Apagado';
  @override
  String get offline => 'Desconectado';
  @override
  String get on => 'Encendido';
  @override
  String get online => 'En línea';
  @override
  String get open => 'Abrir';
  @override
  String get queue => 'Cola';
  @override
  String get quickSave => 'Guardado rápido';
  @override
  String get quickSaveFromFavorites => 'Guardado rápido en "Favoritos"';
  @override
  String get renamed => 'Renombrado';
  @override
  String get reset => 'Deshacer cambios';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Ajustes';
  @override
  String get skipped => 'Omitido';
  @override
  String get start => 'Iniciar';
  @override
  String get stop => 'Detener';
  @override
  String get save => 'Guardar';
  @override
  String get unchanged => 'Sin Cambios';
  @override
  String get unknown => 'Desconocido';
  @override
  String get noItemInClipboard => 'No hay ningún elemento en el portapapeles.';
}

// Path: receiveTab
class _TranslationsReceiveTabEsEs extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  late final _TranslationsReceiveTabInfoBoxEsEs infoBox = _TranslationsReceiveTabInfoBoxEsEs._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveEsEs quickSave = _TranslationsReceiveTabQuickSaveEsEs._(_root);
}

// Path: sendTab
class _TranslationsSendTabEsEs extends TranslationsSendTabEn {
  _TranslationsSendTabEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _TranslationsSendTabSelectionEsEs selection = _TranslationsSendTabSelectionEsEs._(_root);
  @override
  late final _TranslationsSendTabPickerEsEs picker = _TranslationsSendTabPickerEsEs._(_root);
  @override
  String get shareIntentInfo => 'También puedes usar la opción "Compartir" de tu dispositivo para seleccionar archivos más fácilmente.';
  @override
  String get nearbyDevices => 'Dispositivos Cercanos';
  @override
  String get thisDevice => 'Este dispositivo';
  @override
  String get scan => 'Buscar dispositivos';
  @override
  String get manualSending => 'Envío manual';
  @override
  String get sendMode => 'Modo de envío';
  @override
  late final _TranslationsSendTabSendModesEsEs sendModes = _TranslationsSendTabSendModesEsEs._(_root);
  @override
  String get sendModeHelp => 'Explicación';
  @override
  String get help => 'Por favor asegúrese que el destino elegido esté en la misma red Wi-Fi.';
  @override
  String get placeItems => 'Selecciona elementos para compartir.';
}

// Path: settingsTab
class _TranslationsSettingsTabEsEs extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ajustes';
  @override
  late final _TranslationsSettingsTabGeneralEsEs general = _TranslationsSettingsTabGeneralEsEs._(_root);
  @override
  late final _TranslationsSettingsTabReceiveEsEs receive = _TranslationsSettingsTabReceiveEsEs._(_root);
  @override
  late final _TranslationsSettingsTabSendEsEs send = _TranslationsSettingsTabSendEsEs._(_root);
  @override
  late final _TranslationsSettingsTabNetworkEsEs network = _TranslationsSettingsTabNetworkEsEs._(_root);
  @override
  late final _TranslationsSettingsTabOtherEsEs other = _TranslationsSettingsTabOtherEsEs._(_root);
  @override
  String get advancedSettings => 'Configuración avanzada';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageEsEs extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Solucionar problemas';
  @override
  String get subTitle => '¿La aplicación no funciona como debería? Aquí puedes encontrar soluciones a problemas comunes.';
  @override
  String get solution => 'Solución:';
  @override
  String get fixButton => 'Corregir automáticamente';
  @override
  late final _TranslationsTroubleshootPageFirewallEsEs firewall = _TranslationsTroubleshootPageFirewallEsEs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryEsEs noDiscovery = _TranslationsTroubleshootPageNoDiscoveryEsEs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionEsEs noConnection = _TranslationsTroubleshootPageNoConnectionEsEs._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageEsEs extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historial';
  @override
  String get openFolder => 'Abrir carpeta';
  @override
  String get deleteHistory => 'Borrar historial';
  @override
  String get empty => 'El historial está vacío.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsEsEs entryActions = _TranslationsReceiveHistoryPageEntryActionsEsEs._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageEsEs extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apps (APK)';
  @override
  String get excludeSystemApps => 'Excluir apps de sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Excluir apps no ejecutables';
  @override
  String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageEsEs extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Eliminar todo';
}

// Path: receivePage
class _TranslationsReceivePageEsEs extends TranslationsReceivePageEn {
  _TranslationsReceivePageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n, one: 'quiere enviarte un archivo', other: 'quiere enviarte ${n} archivos');
  @override
  String get subTitleMessage => 'te ha enviado un mensaje:';
  @override
  String get subTitleLink => 'te ha enviado un enlace:';
  @override
  String get canceled => 'El remitente ha cancelado la petición.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageEsEs extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opciones';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(carpeta ${_root.appName})';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Desactivado automáticamente porque hay carpetas.';
}

// Path: sendPage
class _TranslationsSendPageEsEs extends TranslationsSendPageEn {
  _TranslationsSendPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Esperando respuesta…';
  @override
  String get rejected => 'El destino ha rechazado la petición.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'El destino está ocupado con otra petición.';
}

// Path: progressPage
class _TranslationsProgressPageEsEs extends TranslationsProgressPageEn {
  _TranslationsProgressPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Enviando archivos';
  @override
  String get titleReceiving => 'Recibiendo archivos';
  @override
  String get savedToGallery => 'Guardado en fotos';
  @override
  late final _TranslationsProgressPageTotalEsEs total = _TranslationsProgressPageTotalEsEs._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageEsEs extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Compartir mediante enlace';
  @override
  String get loading => 'Iniciando servidor…';
  @override
  String get stopping => 'Deteniendo servidor…';
  @override
  String get error => 'Se ha producido un error al iniciar el servidor.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
    n,
    one: 'Abre este enlace en el navegador:',
    other: 'Abre uno de estos enlaces en el navegador:',
  );
  @override
  String get requests => 'Solicitudes';
  @override
  String get noRequests => 'Aún no hay solicitudes.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Aceptar solicitudes automáticamente';
  @override
  String get requirePin => 'Requerir PIN';
  @override
  String pinHint({required Object pin}) => 'El PIN es "${pin}"';
  @override
  String get encryptionHint => 'LocalSend utiliza un certificado autofirmado. Necesitas aceptarlo en el navegador.';
  @override
  String pendingRequests({required Object n}) => 'Solicitudes pendientes: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageEsEs extends TranslationsAboutPageEn {
  _TranslationsAboutPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sobre LocalSend';
  @override
  List<String> get description => [
    'LocalSend es una aplicación libre, de código abierto, que te permite compartir archivos y mensajes de forma segura con dispositivos cercanos a través de tu red local sin necesidad de conexión a Internet.',
    'Está disponible para Android, iOS, macOS, Windows y Linux. Puedes encontrar todas las opciones de descarga en la página web oficial.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Colaboradores';
  @override
  String get packagers => 'Empaquetadores';
  @override
  String get translators => 'Traductores';
}

// Path: donationPage
class _TranslationsDonationPageEsEs extends TranslationsDonationPageEn {
  _TranslationsDonationPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donar';
  @override
  String get info =>
      'LocalSend es libre, open source y no contiene anuncios. Si te gusta la aplicación puedes ayudar al desarrollo con una donación.';
  @override
  String donate({required Object amount}) => 'Donar ${amount}';
  @override
  String get thanks => '¡Muchas gracias!';
  @override
  String get restore => 'Restablecer compra';
}

// Path: changelogPage
class _TranslationsChangelogPageEsEs extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registro de cambios';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorEsEs extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsEsEs extends TranslationsDialogsEn {
  _TranslationsDialogsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileEsEs addFile = _TranslationsDialogsAddFileEsEs._(_root);
  @override
  late final _TranslationsDialogsOpenFileEsEs openFile = _TranslationsDialogsOpenFileEsEs._(_root);
  @override
  late final _TranslationsDialogsAddressInputEsEs addressInput = _TranslationsDialogsAddressInputEsEs._(_root);
  @override
  late final _TranslationsDialogsCancelSessionEsEs cancelSession = _TranslationsDialogsCancelSessionEsEs._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileEsEs cannotOpenFile = _TranslationsDialogsCannotOpenFileEsEs._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeEsEs encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeEsEs._(_root);
  @override
  late final _TranslationsDialogsErrorDialogEsEs errorDialog = _TranslationsDialogsErrorDialogEsEs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogEsEs favoriteDialog = _TranslationsDialogsFavoriteDialogEsEs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogEsEs favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogEsEs._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogEsEs favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogEsEs._(_root);
  @override
  late final _TranslationsDialogsFileInfoEsEs fileInfo = _TranslationsDialogsFileInfoEsEs._(_root);
  @override
  late final _TranslationsDialogsFileNameInputEsEs fileNameInput = _TranslationsDialogsFileNameInputEsEs._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogEsEs historyClearDialog = _TranslationsDialogsHistoryClearDialogEsEs._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedEsEs localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedEsEs._(_root);
  @override
  late final _TranslationsDialogsMessageInputEsEs messageInput = _TranslationsDialogsMessageInputEsEs._(_root);
  @override
  late final _TranslationsDialogsNoFilesEsEs noFiles = _TranslationsDialogsNoFilesEsEs._(_root);
  @override
  late final _TranslationsDialogsNoPermissionEsEs noPermission = _TranslationsDialogsNoPermissionEsEs._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformEsEs notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformEsEs._(_root);
  @override
  late final _TranslationsDialogsQrEsEs qr = _TranslationsDialogsQrEsEs._(_root);
  @override
  late final _TranslationsDialogsQuickActionsEsEs quickActions = _TranslationsDialogsQuickActionsEsEs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeEsEs quickSaveNotice = _TranslationsDialogsQuickSaveNoticeEsEs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeEsEs quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeEsEs._(_root);
  @override
  late final _TranslationsDialogsPinEsEs pin = _TranslationsDialogsPinEsEs._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpEsEs sendModeHelp = _TranslationsDialogsSendModeHelpEsEs._(_root);
  @override
  late final _TranslationsDialogsZoomEsEs zoom = _TranslationsDialogsZoomEsEs._(_root);
}

// Path: sanitization
class _TranslationsSanitizationEsEs extends TranslationsSanitizationEn {
  _TranslationsSanitizationEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'El nombre del archivo no puede estar vacío';
  @override
  String get invalid => 'El nombre del archivo contiene caracteres no válidos';
}

// Path: tray
class _TranslationsTrayEsEs extends TranslationsTrayEn {
  _TranslationsTrayEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Cerrar LocalSend';
  @override
  String get closeWindows => 'Cerrar';
}

// Path: web
class _TranslationsWebEsEs extends TranslationsWebEn {
  _TranslationsWebEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Ingresar PIN';
  @override
  String get invalidPin => 'PIN Inválido';
  @override
  String get tooManyAttempts => 'Demasiados intentos';
  @override
  String get rejected => 'Rechazado';
  @override
  String get files => 'Archivos';
  @override
  String get fileName => 'Nombre del archivo';
  @override
  String get size => 'Tamaño';
}

// Path: assetPicker
class _TranslationsAssetPickerEsEs extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Confirmar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get edit => 'Editar';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Error de carga';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Vista previa';
  @override
  String get select => 'Seleccionar';
  @override
  String get emptyList => 'Lista vacía';
  @override
  String get unSupportedAssetType => 'Tipo de archivo no soportado.';
  @override
  String get unableToAccessAll => 'No se puede acceder a todos los archivos del dispositivo';
  @override
  String get viewingLimitedAssetsTip => 'Ver solo los archivos y álbumes accesibles para la aplicación.';
  @override
  String get changeAccessibleLimitedAssets => 'Haga clic para actualizar los archivos accesibles';
  @override
  String get accessAllTip =>
      'La aplicación solo puede acceder a algunos archivos del dispositivo. Ve a la configuración del sistema y permite que la aplicación acceda a todos los archivos multimedia del dispositivo.';
  @override
  String get goToSystemSettings => 'Ir a los ajustes del sistema';
  @override
  String get accessLimitedAssets => 'Continuar con acceso limitado';
  @override
  String get accessiblePathName => 'Archivos accesibles';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Imagen';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Otros medios';
  @override
  String get sActionPlayHint => 'play';
  @override
  String get sActionPreviewHint => 'vista previa';
  @override
  String get sActionSelectHint => 'selecccionar';
  @override
  String get sActionSwitchPathLabel => 'cambiar ruta';
  @override
  String get sActionUseCameraHint => 'usar cámara';
  @override
  String get sNameDurationLabel => 'duración';
  @override
  String get sUnitAssetCountLabel => 'conteo';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageEsEs extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfaces de red';
  @override
  String get info =>
      'De forma predeterminada, LocalSend utiliza todas las interfaces de red disponibles. Aquí puede desactivar las redes no deseadas. Debe reiniciar el servidor para aplicar los cambios.';
  @override
  String get preview => 'Vista previa';
  @override
  String get whitelist => 'Lista de permitidos';
  @override
  String get blacklist => 'Lista negra';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxEsEs extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Puerto:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveEsEs extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoritos';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionEsEs extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selección';
  @override
  String files({required Object files}) => 'Archivos: ${files}';
  @override
  String size({required Object size}) => 'Tamaño: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerEsEs extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Archivo';
  @override
  String get folder => 'Carpeta';
  @override
  String get media => 'Medios';
  @override
  String get text => 'Texto';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Pegar';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesEsEs extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Solo un destino';
  @override
  String get multiple => 'Múltiples destinos';
  @override
  String get link => 'Compartir enlace';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralEsEs extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Luminosidad';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsEsEs brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsEsEs._(_root);
  @override
  String get color => 'Color';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsEsEs colorOptions = _TranslationsSettingsTabGeneralColorOptionsEsEs._(_root);
  @override
  String get language => 'Idioma';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsEsEs languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsEsEs._(_root);
  @override
  String get saveWindowPlacement => 'Al salir guardar la ubicación de la ventana';
  @override
  String get saveWindowPlacementWindows => 'Guardar la posición de la ventana después de salir';
  @override
  String get minimizeToTray => 'Cerrar: Minimizar ventana';
  @override
  String get launchAtStartup => 'Inicio automático';
  @override
  String get launchMinimized => 'Inicio automático: Iniciar minimizado';
  @override
  String get showInContextMenu => 'Mostrar LocalSend en el menú contextual';
  @override
  String get animations => 'Animaciones';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveEsEs extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Auto finalizar';
  @override
  String get destination => 'Guardar en carpeta';
  @override
  String get downloads => '(Descargas)';
  @override
  String get saveToGallery => 'Guardar media en la galería';
  @override
  String get saveToHistory => 'Guardar en el historial';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendEsEs extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Enviar enlace: Aceptar automáticamente';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkEsEs extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Red';
  @override
  String get needRestart => '¡Reinicia el servidor para aplicar los ajustes!';
  @override
  String get server => 'Servidor';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Tipo de dispositivo';
  @override
  String get deviceModel => 'Modelo de dispositivo';
  @override
  String get port => 'Puerto';
  @override
  String get discoveryTimeout => 'Tiempo de espera para Detección';
  @override
  String get useSystemName => 'Usar el nombre del sistema';
  @override
  String get generateRandomAlias => 'Generar alias aleatorio';
  @override
  String portWarning({required Object defaultPort}) =>
      'Es posible que no seas visible para otros dispositivos porque estás utilizando un puerto personalizado. (Puerto por defecto: ${defaultPort})';
  @override
  String get encryption => 'Encriptación';
  @override
  String get multicastGroup => 'Direccion Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Es posible que no seas visible para otros dispositivos porque estás utilizando una dirección multicast personalizada. (Dirección multicast por defecto: ${defaultMulticast})';
  @override
  String get network => 'Red';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsEsEs networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsEsEs._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherEsEs extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otros';
  @override
  String get support => 'Apoya a LocalSend';
  @override
  String get donate => 'Donar';
  @override
  String get privacyPolicy => 'Política de privacidad';
  @override
  String get termsOfUse => 'Condiciones de uso';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallEsEs extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo puede enviar archivos a otros, pero otros dispositivos no pueden enviar archivos a este.';
  @override
  String solution({required Object port}) =>
      'Lo más probable es que se trate de un problema con el firewall, puedes solucionarlo permitiendo las conexiones entrantes (UDP y TCP) en el puerto ${port}.';
  @override
  String get openFirewallSettings => 'Abrir Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryEsEs extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo no puede descubrir otros dispositivos.';
  @override
  String get solution =>
      'Asegúrese que todos los dispositivos estén en la misma red Wi-Fi y compartan la misma configuración (puerto, dirección de multidifusión, cifrado). Puede intentar escribir la dirección IP del dispositivo de destino manualmente. Si esto funciona, considere agregar este dispositivo a los favoritos para que pueda detectarse automáticamente en el futuro.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionEsEs extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos dispositivos no pueden descubrirse ni compartir archivos.';
  @override
  String get solution =>
      '¿El problema existe en ambos lados? Tienes que asegurarte que los dispositivos están en la misma red Wi-Fi y comparten la misma configuración (puerto, dirección multicast, encriptación). Es posible que el Wi-Fi no permita la comunicación entre los dispositivos. En este caso, hay que activar esta opción en el router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsEsEs extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Abrir archivo';
  @override
  String get showInFolder => 'Mostrar en carpeta';
  @override
  String get info => 'Información';
  @override
  String get deleteFromHistory => 'Borrar del historial';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalEsEs extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleEsEs title = _TranslationsProgressPageTotalTitleEsEs._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Archivos: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaño: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidad: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileEsEs extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Añadir a selección';
  @override
  String get content => '¿Qué quieres añadir?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileEsEs extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir archivo';
  @override
  String get content => '¿Quieres abrir el archivo recibido?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputEsEs extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introducir dirección';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Dirección IP';
  @override
  String get recentlyUsed => 'Usados recientemente: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionEsEs extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar transferencia de archivos';
  @override
  String get content => '¿Realmente quieres cancelar la transferencia de archivos?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileEsEs extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No se puede abrir el archivo';
  @override
  String content({required Object file}) => 'No se ha podido abrir "${file}". ¿Es posible que el archivo se haya movido, renombrado o eliminado?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeEsEs extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encriptación deshabilitada';
  @override
  String get content =>
      'La comunicación ahora tiene lugar mediante un protocolo HTTP sin encriptar. Para usar HTTPS, vuelve a habilitar la encriptación.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogEsEs extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogEsEs extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoritos';
  @override
  String get noFavorites => 'Aún no hay dispositivos favoritos.';
  @override
  String get addFavorite => 'Agregar';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogEsEs extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar de favoritos';
  @override
  String content({required Object name}) => '¿Realmente quieres borrar de favoritos "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogEsEs extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Agregar a favoritos';
  @override
  String get titleEdit => 'Editar';
  @override
  String get name => 'Alias';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Dirección IP';
  @override
  String get port => 'Puerto';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoEsEs extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Información del archivo';
  @override
  String get fileName => 'Nombre del archivo:';
  @override
  String get path => 'Ruta:';
  @override
  String get size => 'Tamaño:';
  @override
  String get sender => 'Emisor:';
  @override
  String get time => 'Hora:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputEsEs extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduce el nombre';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogEsEs extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Borrar historial';
  @override
  String get content => '¿Realmente quieres borrar todo el historial?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedEsEs extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend no puede encontrar otros dispositivos sin tener permiso para escanear la red local. Por favor, concede este permiso en los ajustes.';
  @override
  String get gotoSettings => 'Ajustes';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputEsEs extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Escribe un mensaje';
  @override
  String get multiline => 'Varias líneas';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesEsEs extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ningún archivo seleccionado';
  @override
  String get content => 'Por favor selecciona al menos un archivo.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionEsEs extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sin autorización';
  @override
  String get content => 'No has otorgado los permisos necesarios. Por favor, otórgalos en la configuración.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformEsEs extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No disponible';
  @override
  String get content => 'Esta característica solo está disponible en:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrEsEs extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsEsEs extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Acciones rápidas';
  @override
  String get counter => 'Contador';
  @override
  String get prefix => 'Prefijo';
  @override
  String get padZero => 'Llenar con ceros';
  @override
  String get sortBeforeCount => 'Ordenar alfabéticamente antes';
  @override
  String get random => 'Aleatorio';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeEsEs extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Las solicitudes de archivos se aceptan automáticamente. Ten en cuenta que cualquiera en la red local podrá enviarte archivos.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeEsEs extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Se aceptarán automáticamente los archivos recibidos de los dispositivos incluidos en su lista de favoritos.',
    'Advertencia: esta opción no es completamente segura, cualquiera que conozca la huella digital de sus dispositivos favoritos aún puede enviarle archivos.',
    'Sin embargo, esta opción sigue siendo más segura que permitir que todos los usuarios en la red local te envíen archivos sin restricción.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinEsEs extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ingresar PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpEsEs extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modos de envío';
  @override
  String get single => 'Enviar archivos a un solo destino. La selección se borrará una vez finalizada la transferencia.';
  @override
  String get multiple => 'Enviar archivos a múltiples destinos. La selección no se borrará.';
  @override
  String get link =>
      'Los destinatarios que no tengan LocalSend instalado pueden descargar los archivos seleccionados abriendo el enlace en su navegador.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomEsEs extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsEsEs extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Oscuro';
  @override
  String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsEsEs extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsEsEs extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsEsEs extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todo';
  @override
  String get filtered => 'Filtrado';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleEsEs extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleEsEs._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progreso total (${time})';
  @override
  String get finishedError => 'Finalizado con error';
  @override
  String get canceledSender => 'Cancelado por remitente';
  @override
  String get canceledReceiver => 'Cancelado por destino';
}
