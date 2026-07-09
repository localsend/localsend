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
class TranslationsEsEs extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEsEs({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
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

  @override
  TranslationsEsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEsEs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Español';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$es_ES general = _Translations$general$es_ES._(_root);
  @override
  late final _Translations$receiveTab$es_ES receiveTab = _Translations$receiveTab$es_ES._(_root);
  @override
  late final _Translations$sendTab$es_ES sendTab = _Translations$sendTab$es_ES._(_root);
  @override
  late final _Translations$settingsTab$es_ES settingsTab = _Translations$settingsTab$es_ES._(_root);
  @override
  late final _Translations$troubleshootPage$es_ES troubleshootPage = _Translations$troubleshootPage$es_ES._(_root);
  @override
  late final _Translations$receiveHistoryPage$es_ES receiveHistoryPage = _Translations$receiveHistoryPage$es_ES._(_root);
  @override
  late final _Translations$apkPickerPage$es_ES apkPickerPage = _Translations$apkPickerPage$es_ES._(_root);
  @override
  late final _Translations$selectedFilesPage$es_ES selectedFilesPage = _Translations$selectedFilesPage$es_ES._(_root);
  @override
  late final _Translations$receivePage$es_ES receivePage = _Translations$receivePage$es_ES._(_root);
  @override
  late final _Translations$receiveOptionsPage$es_ES receiveOptionsPage = _Translations$receiveOptionsPage$es_ES._(_root);
  @override
  late final _Translations$sendPage$es_ES sendPage = _Translations$sendPage$es_ES._(_root);
  @override
  late final _Translations$progressPage$es_ES progressPage = _Translations$progressPage$es_ES._(_root);
  @override
  late final _Translations$webSharePage$es_ES webSharePage = _Translations$webSharePage$es_ES._(_root);
  @override
  late final _Translations$aboutPage$es_ES aboutPage = _Translations$aboutPage$es_ES._(_root);
  @override
  late final _Translations$donationPage$es_ES donationPage = _Translations$donationPage$es_ES._(_root);
  @override
  late final _Translations$changelogPage$es_ES changelogPage = _Translations$changelogPage$es_ES._(_root);
  @override
  late final _Translations$dialogs$es_ES dialogs = _Translations$dialogs$es_ES._(_root);
  @override
  late final _Translations$sanitization$es_ES sanitization = _Translations$sanitization$es_ES._(_root);
  @override
  late final _Translations$tray$es_ES tray = _Translations$tray$es_ES._(_root);
  @override
  late final _Translations$web$es_ES web = _Translations$web$es_ES._(_root);
  @override
  late final _Translations$assetPicker$es_ES assetPicker = _Translations$assetPicker$es_ES._(_root);
  @override
  late final _Translations$networkInterfacesPage$es_ES networkInterfacesPage = _Translations$networkInterfacesPage$es_ES._(_root);
}

// Path: general
class _Translations$general$es_ES extends Translations$general$en {
  _Translations$general$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$es_ES extends Translations$receiveTab$en {
  _Translations$receiveTab$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  late final _Translations$receiveTab$infoBox$es_ES infoBox = _Translations$receiveTab$infoBox$es_ES._(_root);
  @override
  late final _Translations$receiveTab$quickSave$es_ES quickSave = _Translations$receiveTab$quickSave$es_ES._(_root);
}

// Path: sendTab
class _Translations$sendTab$es_ES extends Translations$sendTab$en {
  _Translations$sendTab$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _Translations$sendTab$selection$es_ES selection = _Translations$sendTab$selection$es_ES._(_root);
  @override
  late final _Translations$sendTab$picker$es_ES picker = _Translations$sendTab$picker$es_ES._(_root);
  @override
  String get shareIntentInfo => 'También puedes usar la opción "Compartir" de tu dispositivo para seleccionar archivos más fácilmente.';
  @override
  String get nearbyDevices => 'Dispositivos Cercanos';
  @override
  String get thisDevice => 'Este dispositivo';
  @override
  String get scan => 'Buscar dispositivos';
  @override
  String get manualSending => 'Enviar manualmente';
  @override
  String get sendMode => 'Modo de envío';
  @override
  late final _Translations$sendTab$sendModes$es_ES sendModes = _Translations$sendTab$sendModes$es_ES._(_root);
  @override
  String get sendModeHelp => 'Explicación';
  @override
  String get help => 'Por favor asegúrese que el dispositivo de destino esté en la misma red Wi-Fi.';
  @override
  String get placeItems => 'Selecciona elementos para compartir.';
}

// Path: settingsTab
class _Translations$settingsTab$es_ES extends Translations$settingsTab$en {
  _Translations$settingsTab$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ajustes';
  @override
  late final _Translations$settingsTab$general$es_ES general = _Translations$settingsTab$general$es_ES._(_root);
  @override
  late final _Translations$settingsTab$receive$es_ES receive = _Translations$settingsTab$receive$es_ES._(_root);
  @override
  late final _Translations$settingsTab$send$es_ES send = _Translations$settingsTab$send$es_ES._(_root);
  @override
  late final _Translations$settingsTab$network$es_ES network = _Translations$settingsTab$network$es_ES._(_root);
  @override
  late final _Translations$settingsTab$other$es_ES other = _Translations$settingsTab$other$es_ES._(_root);
  @override
  String get advancedSettings => 'Configuración avanzada';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$es_ES extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
  late final _Translations$troubleshootPage$firewall$es_ES firewall = _Translations$troubleshootPage$firewall$es_ES._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$es_ES noDiscovery = _Translations$troubleshootPage$noDiscovery$es_ES._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$es_ES noConnection = _Translations$troubleshootPage$noConnection$es_ES._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$es_ES extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
  late final _Translations$receiveHistoryPage$entryActions$es_ES entryActions = _Translations$receiveHistoryPage$entryActions$es_ES._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$es_ES extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicaciones (APK)';
  @override
  String get excludeSystemApps => 'Excluir apps de sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Excluir apps no ejecutables';
  @override
  String apps({required Object n}) => '${n} Aplicaciones';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$es_ES extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Eliminar todo';
}

// Path: receivePage
class _Translations$receivePage$es_ES extends Translations$receivePage$en {
  _Translations$receivePage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
    n,
    one: 'quiere enviarte un archivo',
    other: 'quiere enviarte ${n} archivos',
  );
  @override
  String get subTitleMessage => 'te ha enviado un mensaje:';
  @override
  String get subTitleLink => 'te ha enviado un enlace:';
  @override
  String get canceled => 'El remitente ha cancelado la petición.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$es_ES extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opciones';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Carpeta LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Desactivado automáticamente porque hay carpetas.';
}

// Path: sendPage
class _Translations$sendPage$es_ES extends Translations$sendPage$en {
  _Translations$sendPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$es_ES extends Translations$progressPage$en {
  _Translations$progressPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Enviando archivos';
  @override
  String get titleReceiving => 'Recibiendo archivos';
  @override
  String get savedToGallery => 'Guardado en fotos';
  @override
  late final _Translations$progressPage$total$es_ES total = _Translations$progressPage$total$es_ES._(_root);
  @override
  late final _Translations$progressPage$remainingTime$es_ES remainingTime = _Translations$progressPage$remainingTime$es_ES._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$es_ES extends Translations$webSharePage$en {
  _Translations$webSharePage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$aboutPage$es_ES extends Translations$aboutPage$en {
  _Translations$aboutPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$donationPage$es_ES extends Translations$donationPage$en {
  _Translations$donationPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$changelogPage$es_ES extends Translations$changelogPage$en {
  _Translations$changelogPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registro de cambios';
}

// Path: dialogs
class _Translations$dialogs$es_ES extends Translations$dialogs$en {
  _Translations$dialogs$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$es_ES addFile = _Translations$dialogs$addFile$es_ES._(_root);
  @override
  late final _Translations$dialogs$openFile$es_ES openFile = _Translations$dialogs$openFile$es_ES._(_root);
  @override
  late final _Translations$dialogs$addressInput$es_ES addressInput = _Translations$dialogs$addressInput$es_ES._(_root);
  @override
  late final _Translations$dialogs$cancelSession$es_ES cancelSession = _Translations$dialogs$cancelSession$es_ES._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$es_ES cannotOpenFile = _Translations$dialogs$cannotOpenFile$es_ES._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$es_ES encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$es_ES._(
    _root,
  );
  @override
  late final _Translations$dialogs$errorDialog$es_ES errorDialog = _Translations$dialogs$errorDialog$es_ES._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$es_ES favoriteDialog = _Translations$dialogs$favoriteDialog$es_ES._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$es_ES favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$es_ES._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$es_ES favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$es_ES._(_root);
  @override
  late final _Translations$dialogs$fileInfo$es_ES fileInfo = _Translations$dialogs$fileInfo$es_ES._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$es_ES fileNameInput = _Translations$dialogs$fileNameInput$es_ES._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$es_ES historyClearDialog = _Translations$dialogs$historyClearDialog$es_ES._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$es_ES localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$es_ES._(
    _root,
  );
  @override
  late final _Translations$dialogs$messageInput$es_ES messageInput = _Translations$dialogs$messageInput$es_ES._(_root);
  @override
  late final _Translations$dialogs$noFiles$es_ES noFiles = _Translations$dialogs$noFiles$es_ES._(_root);
  @override
  late final _Translations$dialogs$noPermission$es_ES noPermission = _Translations$dialogs$noPermission$es_ES._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$es_ES notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$es_ES._(_root);
  @override
  late final _Translations$dialogs$qr$es_ES qr = _Translations$dialogs$qr$es_ES._(_root);
  @override
  late final _Translations$dialogs$quickActions$es_ES quickActions = _Translations$dialogs$quickActions$es_ES._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$es_ES quickSaveNotice = _Translations$dialogs$quickSaveNotice$es_ES._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$es_ES quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$es_ES._(_root);
  @override
  late final _Translations$dialogs$pin$es_ES pin = _Translations$dialogs$pin$es_ES._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$es_ES sendModeHelp = _Translations$dialogs$sendModeHelp$es_ES._(_root);
  @override
  late final _Translations$dialogs$zoom$es_ES zoom = _Translations$dialogs$zoom$es_ES._(_root);
}

// Path: sanitization
class _Translations$sanitization$es_ES extends Translations$sanitization$en {
  _Translations$sanitization$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'El nombre del archivo no puede estar vacío';
  @override
  String get invalid => 'El nombre del archivo contiene caracteres no válidos';
}

// Path: tray
class _Translations$tray$es_ES extends Translations$tray$en {
  _Translations$tray$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$web$es_ES extends Translations$web$en {
  _Translations$web$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$assetPicker$es_ES extends Translations$assetPicker$en {
  _Translations$assetPicker$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
  String get sActionPlayHint => 'reproducir';
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
class _Translations$networkInterfacesPage$es_ES extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfaces de la red';
  @override
  String get info =>
      'De forma predeterminada, LocalSend utiliza todas las interfaces de red disponibles. Aquí puede desactivar las redes no deseadas. Debe reiniciar el servidor para aplicar los cambios.';
  @override
  String get preview => 'Vista previa';
  @override
  String get whitelist => 'Lista blanca';
  @override
  String get blacklist => 'Lista negra';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$es_ES extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$receiveTab$quickSave$es_ES extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$selection$es_ES extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$picker$es_ES extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$sendTab$sendModes$es_ES extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$es_ES extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Luminosidad';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$es_ES brightnessOptions =
      _Translations$settingsTab$general$brightnessOptions$es_ES._(_root);
  @override
  String get color => 'Color';
  @override
  late final _Translations$settingsTab$general$colorOptions$es_ES colorOptions = _Translations$settingsTab$general$colorOptions$es_ES._(_root);
  @override
  String get language => 'Idioma';
  @override
  late final _Translations$settingsTab$general$languageOptions$es_ES languageOptions = _Translations$settingsTab$general$languageOptions$es_ES._(
    _root,
  );
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
class _Translations$settingsTab$receive$es_ES extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$send$es_ES extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Aceptar automáticamente solicitudes en el modo "Compartir mediante enlace"';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$es_ES extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
  late final _Translations$settingsTab$network$networkOptions$es_ES networkOptions = _Translations$settingsTab$network$networkOptions$es_ES._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$es_ES extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$troubleshootPage$firewall$es_ES extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo puede enviar archivos a otros, pero otros dispositivos no pueden enviar archivos a este.';
  @override
  String solution({required Object port}) =>
      'Lo más probable es que se trate de un problema con el firewall, puedes solucionarlo permitiendo las conexiones entrantes (UDP y TCP) en el puerto ${port}.';
  @override
  String get openFirewall => 'Abrir Firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$es_ES extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo no puede descubrir otros dispositivos.';
  @override
  String get solution =>
      'Asegúrese que todos los dispositivos estén en la misma red Wi-Fi y compartan la misma configuración (puerto, dirección de multidifusión, cifrado). Puede intentar escribir la dirección IP del dispositivo de destino manualmente. Si esto funciona, considere agregar este dispositivo a los favoritos para que pueda detectarse automáticamente en el futuro.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$es_ES extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos dispositivos no pueden descubrirse ni compartir archivos.';
  @override
  String get solution =>
      '¿El problema existe en ambos lados? Tienes que asegurarte que los dispositivos están en la misma red Wi-Fi y comparten la misma configuración (puerto, dirección multicast, encriptación). Es posible que el Wi-Fi no permita la comunicación entre los dispositivos. En este caso, hay que activar esta opción en el router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$es_ES extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$progressPage$total$es_ES extends Translations$progressPage$total$en {
  _Translations$progressPage$total$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$es_ES title = _Translations$progressPage$total$title$es_ES._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Archivos: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaño: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidad: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$es_ES extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Usa «h» como abreviatura de horas y «m» para minutos
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Usa «d» para días, «h» para horas y «m» para minutos
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$es_ES extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Añadir a selección';
  @override
  String get content => '¿Qué quieres añadir?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$es_ES extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir archivo';
  @override
  String get content => '¿Quieres abrir el archivo recibido?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$es_ES extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introducir dirección';
  @override
  String get hashtag => 'Etiqueta';
  @override
  String get ip => 'Dirección IP';
  @override
  String get recentlyUsed => 'Usados recientemente: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$es_ES extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar transferencia de archivos';
  @override
  String get content => '¿Realmente quieres cancelar la transferencia de archivos?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$es_ES extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No se puede abrir el archivo';
  @override
  String content({required Object file}) => 'No se ha podido abrir "${file}". ¿Es posible que el archivo se haya movido, renombrado o eliminado?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$es_ES extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encriptación deshabilitada';
  @override
  String get content =>
      'La comunicación ahora tiene lugar mediante un protocolo HTTP sin encriptar. Para usar HTTPS, vuelve a habilitar la encriptación.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$es_ES extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$es_ES extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$favoriteDeleteDialog$es_ES extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar de favoritos';
  @override
  String content({required Object name}) => '¿Realmente quieres borrar de favoritos "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$es_ES extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Agregar a favoritos';
  @override
  String get titleEdit => 'Ajustes';
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
class _Translations$dialogs$fileInfo$es_ES extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$fileNameInput$es_ES extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduce el nombre';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$es_ES extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Borrar historial';
  @override
  String get content => '¿Realmente quieres borrar todo el historial?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$es_ES extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$messageInput$es_ES extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Escribe un mensaje';
  @override
  String get multiline => 'Varias líneas';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$es_ES extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ningún archivo seleccionado';
  @override
  String get content => 'Por favor selecciona al menos un archivo.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$es_ES extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sin autorización';
  @override
  String get content => 'No has otorgado los permisos necesarios. Por favor, otórgalos en la configuración.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$es_ES extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'No disponible';
  @override
  String get content => 'Esta característica solo está disponible en:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$es_ES extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$es_ES extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$quickSaveNotice$es_ES extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Las solicitudes de archivos se aceptan automáticamente. Ten en cuenta que cualquiera en la red local podrá enviarte archivos.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$es_ES extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$pin$es_ES extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ingresar PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$es_ES extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$dialogs$zoom$es_ES extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$es_ES extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
class _Translations$settingsTab$general$colorOptions$es_ES extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$es_ES extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$es_ES extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todo';
  @override
  String get filtered => 'Filtrado';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$es_ES extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$es_ES._(TranslationsEsEs root) : this._root = root, super.internal(root);

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
