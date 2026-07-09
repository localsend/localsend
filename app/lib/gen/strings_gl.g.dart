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
class TranslationsGl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.gl,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <gl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsGl _root = this; // ignore: unused_field

  @override
  TranslationsGl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Galego';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$gl general = _Translations$general$gl._(_root);
  @override
  late final _Translations$receiveTab$gl receiveTab = _Translations$receiveTab$gl._(_root);
  @override
  late final _Translations$sendTab$gl sendTab = _Translations$sendTab$gl._(_root);
  @override
  late final _Translations$settingsTab$gl settingsTab = _Translations$settingsTab$gl._(_root);
  @override
  late final _Translations$troubleshootPage$gl troubleshootPage = _Translations$troubleshootPage$gl._(_root);
  @override
  late final _Translations$apkPickerPage$gl apkPickerPage = _Translations$apkPickerPage$gl._(_root);
  @override
  late final _Translations$networkInterfacesPage$gl networkInterfacesPage = _Translations$networkInterfacesPage$gl._(_root);
  @override
  late final _Translations$receiveHistoryPage$gl receiveHistoryPage = _Translations$receiveHistoryPage$gl._(_root);
  @override
  late final _Translations$selectedFilesPage$gl selectedFilesPage = _Translations$selectedFilesPage$gl._(_root);
  @override
  late final _Translations$receivePage$gl receivePage = _Translations$receivePage$gl._(_root);
  @override
  late final _Translations$receiveOptionsPage$gl receiveOptionsPage = _Translations$receiveOptionsPage$gl._(_root);
  @override
  late final _Translations$dialogs$gl dialogs = _Translations$dialogs$gl._(_root);
  @override
  late final _Translations$webSharePage$gl webSharePage = _Translations$webSharePage$gl._(_root);
  @override
  late final _Translations$progressPage$gl progressPage = _Translations$progressPage$gl._(_root);
  @override
  late final _Translations$aboutPage$gl aboutPage = _Translations$aboutPage$gl._(_root);
  @override
  late final _Translations$sendPage$gl sendPage = _Translations$sendPage$gl._(_root);
  @override
  late final _Translations$donationPage$gl donationPage = _Translations$donationPage$gl._(_root);
  @override
  late final _Translations$changelogPage$gl changelogPage = _Translations$changelogPage$gl._(_root);
  @override
  late final _Translations$tray$gl tray = _Translations$tray$gl._(_root);
  @override
  late final _Translations$sanitization$gl sanitization = _Translations$sanitization$gl._(_root);
  @override
  late final _Translations$web$gl web = _Translations$web$gl._(_root);
  @override
  late final _Translations$assetPicker$gl assetPicker = _Translations$assetPicker$gl._(_root);
}

// Path: general
class _Translations$general$gl extends Translations$general$en {
  _Translations$general$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Aceptar';
  @override
  String get accepted => 'Aceptado';
  @override
  String get add => 'Engadir';
  @override
  String get advanced => 'Avanzado';
  @override
  String get cancel => 'Cancelar';
  @override
  String get close => 'Pechar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueStr => 'Continuar';
  @override
  String get copy => 'Copiar';
  @override
  String get copiedToClipboard => 'Copiouse no Portapapeis';
  @override
  String get decline => 'Declinar';
  @override
  String get done => 'Feito';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Erro';
  @override
  String get example => 'Exemplo';
  @override
  String get files => 'Arquivos';
  @override
  String get finished => 'Rematou';
  @override
  String get hide => 'Ocultar';
  @override
  String get off => 'Apagado';
  @override
  String get offline => 'Sen Conexión';
  @override
  String get on => 'Activado';
  @override
  String get online => 'En Liña';
  @override
  String get open => 'Aberto';
  @override
  String get queue => 'Fila';
  @override
  String get quickSave => 'Gardar Rápido';
  @override
  String get quickSaveFromFavorites => 'Gardar rápido para "Favoritos"';
  @override
  String get renamed => 'Renomeado';
  @override
  String get reset => 'Desfacer os cambios';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Configuración';
  @override
  String get skipped => 'Omitido';
  @override
  String get start => 'Comeza';
  @override
  String get stop => 'Parar';
  @override
  String get save => 'Gardar';
  @override
  String get unchanged => 'Sen Cambios';
  @override
  String get unknown => 'Descoñecido';
  @override
  String get noItemInClipboard => 'Non hai elementos no Portapapeis.';
}

// Path: receiveTab
class _Translations$receiveTab$gl extends Translations$receiveTab$en {
  _Translations$receiveTab$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  late final _Translations$receiveTab$infoBox$gl infoBox = _Translations$receiveTab$infoBox$gl._(_root);
  @override
  late final _Translations$receiveTab$quickSave$gl quickSave = _Translations$receiveTab$quickSave$gl._(_root);
}

// Path: sendTab
class _Translations$sendTab$gl extends Translations$sendTab$en {
  _Translations$sendTab$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _Translations$sendTab$selection$gl selection = _Translations$sendTab$selection$gl._(_root);
  @override
  late final _Translations$sendTab$picker$gl picker = _Translations$sendTab$picker$gl._(_root);
  @override
  String get shareIntentInfo => 'Tamén podes usar a función "Compartir" do teu dispositivo móbil para seleccionar ficheiros máis facilmente.';
  @override
  String get nearbyDevices => 'Dispositivos Próximos';
  @override
  String get thisDevice => 'Este Dispositivo';
  @override
  String get scan => 'Busca Dispositivos';
  @override
  String get manualSending => 'Envío Manual';
  @override
  String get sendMode => 'Modo de Envío';
  @override
  late final _Translations$sendTab$sendModes$gl sendModes = _Translations$sendTab$sendModes$gl._(_root);
  @override
  String get sendModeHelp => 'Explicación';
  @override
  String get help => 'Asegúrate de que o obxectivo desexado tamén estea na mesma rede wifi.';
  @override
  String get placeItems => 'Coloca elementos para compartir.';
}

// Path: settingsTab
class _Translations$settingsTab$gl extends Translations$settingsTab$en {
  _Translations$settingsTab$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configuración';
  @override
  late final _Translations$settingsTab$general$gl general = _Translations$settingsTab$general$gl._(_root);
  @override
  late final _Translations$settingsTab$receive$gl receive = _Translations$settingsTab$receive$gl._(_root);
  @override
  late final _Translations$settingsTab$network$gl network = _Translations$settingsTab$network$gl._(_root);
  @override
  late final _Translations$settingsTab$send$gl send = _Translations$settingsTab$send$gl._(_root);
  @override
  late final _Translations$settingsTab$other$gl other = _Translations$settingsTab$other$gl._(_root);
  @override
  String get advancedSettings => 'Configuración avanzada';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$gl extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$troubleshootPage$noDiscovery$gl noDiscovery = _Translations$troubleshootPage$noDiscovery$gl._(_root);
  @override
  late final _Translations$troubleshootPage$firewall$gl firewall = _Translations$troubleshootPage$firewall$gl._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$gl noConnection = _Translations$troubleshootPage$noConnection$gl._(_root);
  @override
  String get title => 'Solucionar problemas';
  @override
  String get subTitle => 'A aplicación non funciona segundo o esperado? Aquó podes atopar algunhas solucións comúns aos problemas.';
  @override
  String get solution => 'Solución:';
  @override
  String get fixButton => 'Corrixir automáticamente';
}

// Path: apkPickerPage
class _Translations$apkPickerPage$gl extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicacións (APK)';
  @override
  String get excludeSystemApps => 'Excluír aplicacións do sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Excluír aplicacións non executábels';
  @override
  String apps({required Object n}) => '${n} Aplicacións';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$gl extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'Vista previa';
  @override
  String get title => 'Interfaces de rede';
  @override
  String get whitelist => 'Lista de permitidos';
  @override
  String get blacklist => 'Lista negra';
  @override
  String get info =>
      'Por defecto, LocalSend emprega todas as interfaces de rede dispoñíbeis. Eiquí podes desactivar as redes non desexadas. Tes que reiniciar o servidor para aplicar os cambios.';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$gl extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historial';
  @override
  String get empty => 'O historial está vacío.';
  @override
  String get openFolder => 'Abrir cartafol';
  @override
  String get deleteHistory => 'Borrar historial';
  @override
  late final _Translations$receiveHistoryPage$entryActions$gl entryActions = _Translations$receiveHistoryPage$entryActions$gl._(_root);
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$gl extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Eliminar todo';
}

// Path: receivePage
class _Translations$receivePage$gl extends Translations$receivePage$en {
  _Translations$receivePage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
    n,
    one: 'quere enviarte un ficheiro',
    other: 'quere enviarte ${n} ficheiros',
  );
  @override
  String get subTitleMessage => 'envioute unha mensaxe:';
  @override
  String get subTitleLink => 'envioute unha ligazón:';
  @override
  String get canceled => 'O remitente cancelou a petición.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$gl extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opcións';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Cartafol Localsend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Desactivado automáticamente porque hai cartafois.';
}

// Path: dialogs
class _Translations$dialogs$gl extends Translations$dialogs$en {
  _Translations$dialogs$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$gl encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$gl._(_root);
  @override
  late final _Translations$dialogs$openFile$gl openFile = _Translations$dialogs$openFile$gl._(_root);
  @override
  late final _Translations$dialogs$addressInput$gl addressInput = _Translations$dialogs$addressInput$gl._(_root);
  @override
  late final _Translations$dialogs$addFile$gl addFile = _Translations$dialogs$addFile$gl._(_root);
  @override
  late final _Translations$dialogs$cancelSession$gl cancelSession = _Translations$dialogs$cancelSession$gl._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$gl cannotOpenFile = _Translations$dialogs$cannotOpenFile$gl._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$gl favoriteDialog = _Translations$dialogs$favoriteDialog$gl._(_root);
  @override
  late final _Translations$dialogs$errorDialog$gl errorDialog = _Translations$dialogs$errorDialog$gl._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$gl favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$gl._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$gl favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$gl._(_root);
  @override
  late final _Translations$dialogs$fileInfo$gl fileInfo = _Translations$dialogs$fileInfo$gl._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$gl fileNameInput = _Translations$dialogs$fileNameInput$gl._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$gl historyClearDialog = _Translations$dialogs$historyClearDialog$gl._(_root);
  @override
  late final _Translations$dialogs$noPermission$gl noPermission = _Translations$dialogs$noPermission$gl._(_root);
  @override
  late final _Translations$dialogs$noFiles$gl noFiles = _Translations$dialogs$noFiles$gl._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$gl localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$gl._(_root);
  @override
  late final _Translations$dialogs$messageInput$gl messageInput = _Translations$dialogs$messageInput$gl._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$gl notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$gl._(_root);
  @override
  late final _Translations$dialogs$qr$gl qr = _Translations$dialogs$qr$gl._(_root);
  @override
  late final _Translations$dialogs$quickActions$gl quickActions = _Translations$dialogs$quickActions$gl._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$gl quickSaveNotice = _Translations$dialogs$quickSaveNotice$gl._(_root);
  @override
  late final _Translations$dialogs$zoom$gl zoom = _Translations$dialogs$zoom$gl._(_root);
  @override
  late final _Translations$dialogs$pin$gl pin = _Translations$dialogs$pin$gl._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$gl sendModeHelp = _Translations$dialogs$sendModeHelp$gl._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$gl quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$gl._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$gl extends Translations$webSharePage$en {
  _Translations$webSharePage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get encryptionHint => 'LocalSend precisa un certificado autoasinado. Tes que aceptalo no teu navegador.';
  @override
  String get title => 'Compartir mediante ligazón';
  @override
  String get stopping => 'Parando o servidor…';
  @override
  String get loading => 'Iniciando servidor…';
  @override
  String get error => 'Produciuse un erro ao iniciar o servidor.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
    n,
    one: 'Abre esta ligazón no teu navegador:',
    other: 'Abre unha destas ligazóns no teu navegador:',
  );
  @override
  String get requests => 'Solicitudes';
  @override
  String get noRequests => 'Aínda non hai solicitudes.';
  @override
  String get autoAccept => 'Aceptar solicitudes automaticamente';
  @override
  String get requirePin => 'Requerir PIN';
  @override
  String pinHint({required Object pin}) => 'O PIN é "${pin}"';
  @override
  String pendingRequests({required Object n}) => 'Solicitudes pendentes: ${n}';
}

// Path: progressPage
class _Translations$progressPage$gl extends Translations$progressPage$en {
  _Translations$progressPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$gl total = _Translations$progressPage$total$gl._(_root);
  @override
  String get titleReceiving => 'Recibindo ficheiros';
  @override
  String get savedToGallery => 'Gardado en Fotos';
  @override
  String get titleSending => 'Enviando ficheiros';
  @override
  late final _Translations$progressPage$remainingTime$gl remainingTime = _Translations$progressPage$remainingTime$gl._(_root);
}

// Path: aboutPage
class _Translations$aboutPage$gl extends Translations$aboutPage$en {
  _Translations$aboutPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  List<String> get description => [
    'LocalSend é unha aplicación gratuita, de código aberto, que che permite compartir ficheiros e mensaxes de xeito seguro con dispositivos cercanos a través da túa rede local sen necesidade dunha conexión a internet.',
    'Esta aplicación está dispoñíbel en Android, iOS, macOS, Windows e Linux. Podes atopar todas as opcións de descarga na páxina web oficial.',
  ];
  @override
  String get contributors => 'Colaboradores';
  @override
  String get author => 'Autor';
  @override
  String get translators => 'Tradutores';
  @override
  String get packagers => 'Empaquetadores';
  @override
  String get title => 'Acerca de LocalSend';
}

// Path: sendPage
class _Translations$sendPage$gl extends Translations$sendPage$en {
  _Translations$sendPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Agardando pola resposta…';
  @override
  String get rejected => 'O destinatario rexeitou a solicitude.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'O destinatario está ocupado con outra petición.';
}

// Path: donationPage
class _Translations$donationPage$gl extends Translations$donationPage$en {
  _Translations$donationPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doar';
  @override
  String get info =>
      'LocalSen é gratuita, de código aberto e non ten anuncios. Se che gusta a aplicación, podes apoiar o desenvolvemento cunha doazón.';
  @override
  String donate({required Object amount}) => 'Doar ${amount}';
  @override
  String get thanks => 'Moitas grazas!';
  @override
  String get restore => 'Restaurar a compra';
}

// Path: changelogPage
class _Translations$changelogPage$gl extends Translations$changelogPage$en {
  _Translations$changelogPage$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rexistro de cambios';
}

// Path: tray
class _Translations$tray$gl extends Translations$tray$en {
  _Translations$tray$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Saír de LocalSend';
  @override
  String get closeWindows => 'Saír';
}

// Path: sanitization
class _Translations$sanitization$gl extends Translations$sanitization$en {
  _Translations$sanitization$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'O nome do ficheiro non pode estar valeiro';
  @override
  String get invalid => 'O nome do ficheiro contén caracteres inválidos';
}

// Path: web
class _Translations$web$gl extends Translations$web$en {
  _Translations$web$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Insira o PIN';
  @override
  String get invalidPin => 'PIN non válido';
  @override
  String get tooManyAttempts => 'Demasiados intentos';
  @override
  String get rejected => 'Rexeitado';
  @override
  String get files => 'Ficheiros';
  @override
  String get fileName => 'Nome do ficheiro';
  @override
  String get size => 'Tamaño';
}

// Path: assetPicker
class _Translations$assetPicker$gl extends Translations$assetPicker$en {
  _Translations$assetPicker$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Confirmar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get edit => 'Editar';
  @override
  String get loadFailed => 'Carga fallida';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get original => 'Orixe';
  @override
  String get preview => 'Previsualizar';
  @override
  String get select => 'Seleccionar';
  @override
  String get emptyList => 'Lista baleira';
  @override
  String get unSupportedAssetType => 'Tipo de ficheiro non soportado.';
  @override
  String get unableToAccessAll => 'Non se puido acceder a todos os ficheiros do dispositivo';
  @override
  String get sTypeOtherLabel => 'Outros contidos multimedia';
  @override
  String get sActionPlayHint => 'reproducir';
  @override
  String get sActionPreviewHint => 'vista previa';
  @override
  String get sTypeImageLabel => 'Imaxe';
  @override
  String get sActionSelectHint => 'seleccionar';
  @override
  String get sTypeVideoLabel => 'Vídeo';
  @override
  String get sActionSwitchPathLabel => 'cambiar ruta';
  @override
  String get changeAccessibleLimitedAssets => 'Preme para actualizar os ficheiros accesíbeis';
  @override
  String get goToSystemSettings => 'Vaia á configuración do sistema';
  @override
  String get accessLimitedAssets => 'Continuar con acceso limitado';
  @override
  String get sActionUseCameraHint => 'usar cámara';
  @override
  String get sUnitAssetCountLabel => 'cantidade';
  @override
  String get viewingLimitedAssetsTip => 'Ver só ficheiros e álbums accesíbeis para a aplicación.';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sNameDurationLabel => 'duración';
  @override
  String get accessAllTip =>
      'A aplicación só pode acceder a algúns ficheiros do dispositivo. Vaia á configuración do sistema e permite que a aplicación acceda a todos os elementos do dispositivo.';
  @override
  String get accessiblePathName => 'Ficheiros accesíbeis';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$gl extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porto:';
  @override
  String get alias => 'Nome do Dispositivo:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$gl extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoritos';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$gl extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selección';
  @override
  String files({required Object files}) => 'Ficheiros: ${files}';
  @override
  String size({required Object size}) => 'Tamaño: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$gl extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Arquivo';
  @override
  String get folder => 'Cartafol';
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
class _Translations$sendTab$sendModes$gl extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Destinatario Único';
  @override
  String get multiple => 'Múltiples Destinatarios';
  @override
  String get link => 'Comparte via ligazón';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$gl extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xeral';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$gl brightnessOptions = _Translations$settingsTab$general$brightnessOptions$gl._(
    _root,
  );
  @override
  String get color => 'Cor';
  @override
  late final _Translations$settingsTab$general$colorOptions$gl colorOptions = _Translations$settingsTab$general$colorOptions$gl._(_root);
  @override
  String get language => 'Linguaxe';
  @override
  late final _Translations$settingsTab$general$languageOptions$gl languageOptions = _Translations$settingsTab$general$languageOptions$gl._(_root);
  @override
  String get saveWindowPlacement => 'Garda a posición da xanela despois de saír';
  @override
  String get saveWindowPlacementWindows => 'Garda a posición da xanela despois da saída';
  @override
  String get minimizeToTray => 'Minimizar á Bandexa do Sistema/Barra de Menú ao Pechar';
  @override
  String get launchAtStartup => 'Arrancar automáticamente despois do inicio de sesión';
  @override
  String get launchMinimized => 'Arranque automático: Iniciar minimizada';
  @override
  String get showInContextMenu => 'Amosar LocalSend no menú contextual';
  @override
  String get animations => 'Animacións';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$gl extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

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
  String get autoFinish => 'Finalizar automáticamente';
  @override
  String get destination => 'Gardar no cartafol';
  @override
  String get downloads => '(Descargas)';
  @override
  String get saveToGallery => 'Gardar multimedia na galería';
  @override
  String get saveToHistory => 'Gardar no historial';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$gl extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get deviceType => 'Tipo de dispositivo';
  @override
  String get title => 'Rede';
  @override
  String get needRestart => 'Reinicia o servidor para aplicar os axustes!';
  @override
  String get server => 'Servidor';
  @override
  String get alias => 'Nome do dispositivo';
  @override
  String get deviceModel => 'Modelo de dispositivo';
  @override
  String get port => 'Porto';
  @override
  String get discoveryTimeout => 'Tempo límite de Descubrimento';
  @override
  String get multicastGroup => 'Enderezo multicast';
  @override
  String get network => 'Rede';
  @override
  late final _Translations$settingsTab$network$networkOptions$gl networkOptions = _Translations$settingsTab$network$networkOptions$gl._(_root);
  @override
  String get encryption => 'Cifrado';
  @override
  String get useSystemName => 'Usar o nome do sistema';
  @override
  String get generateRandomAlias => 'Xerar alias aleatorio';
  @override
  String portWarning({required Object defaultPort}) =>
      'Pode que non sexas detectado por outros dispositivos porque estás a empregar un porto personalizado. (Porto por defecto: ${defaultPort})';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Pode que non sexas detectado por outros dispositivos porque estás a empregar un enderezo multicast personalizada. (Por defecto: ${defaultMulticast})';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$gl extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Aceptar automáticamente peticións no modo "Compartir mediante ligazón"';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$gl extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Outros';
  @override
  String get support => 'Apoia a LocalSend';
  @override
  String get donate => 'Doar';
  @override
  String get privacyPolicy => 'Política de privacidade';
  @override
  String get termsOfUse => 'Condicións de uso';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$gl extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Por favor asegúrese de que todos os dispositivos están na mesma rede Wi-Fi e que co partan a mesma configuración (porto, enderezo multicast, cifrado). Podes tentar escribir o enderezo IP do dispositivo de destino manualmente. Se funciona, considera agregar o dispositivo a favoritos para poder descubrilo automaticamente no futuro.';
  @override
  String get symptom => 'Este dispositivo non pode descubrir outros dispositivos.';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$gl extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String solution({required Object port}) =>
      'O máis probábel é que se trate dun problema do firewall. Podes resolver este problema permitindo conexións entrantes (UDP e TCP) no porto ${port}.';
  @override
  String get openFirewall => 'Abrir Firewall';
  @override
  String get symptom => 'Este dispositivo pode enviar ficheiros a outros dispositivos, pero outros dispositivos non lle poden enviar ficheiros.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$gl extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos dispositivos non poden descubrirse nin enviarse ficheiros.';
  @override
  String get solution =>
      'O problema existe nos dous lados? Se é así, cómpre asegurarse de que ambos os dispositivos están na mesma rede Wi-Fi e comparten a mesma configuración (porto, enderezo de multidifusión, cifrado). É posíbel que a rede wifi non permita a comunicación entre os participantes debido ao illamento do punto de acceso (AP). Neste caso, esta opción debe estar desactivada no router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$gl extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get info => 'Información';
  @override
  String get open => 'Abrir ficheiro';
  @override
  String get showInFolder => 'Amosar no cartafol';
  @override
  String get deleteFromHistory => 'Borrar do historial';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$gl extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cifrado deshabilitado';
  @override
  String get content =>
      'A comunicación ten lugar agora mediante o protocolo sen cifrado HTTP. Para usar o protocolo HTTPS, habilite novamente o cifrado.';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$gl extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir ficheiro';
  @override
  String get content => 'Queres abrir o ficheiro recibido?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$gl extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduce enderezo';
  @override
  String get ip => 'Enderezo IP';
  @override
  String get recentlyUsed => 'Empregados recentemente: ';
  @override
  String get hashtag => 'Etiqueta';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$gl extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Que queres engadir?';
  @override
  String get title => 'Engadir á selección';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$gl extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar a transferencia de ficheiros';
  @override
  String get content => 'Realmente queres cancelar a transferencia de ficheiros?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$gl extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String content({required Object file}) => 'Non se puido abrir "${file}". Moveuse, renomeouse ou eliminouse este ficheiro?';
  @override
  String get title => 'Non se pode abrir o ficheiro';
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$gl extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoritos';
  @override
  String get noFavorites => 'Aínda non hai ningún dispositivo favorito.';
  @override
  String get addFavorite => 'Engadir';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$gl extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$gl extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar de favoritos';
  @override
  String content({required Object name}) => 'Realmente queres eliminar dos favoritos "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$gl extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Engadir a favoritos';
  @override
  String get titleEdit => 'Axustes';
  @override
  String get name => 'Nome do dispositivo';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Enderezo IP';
  @override
  String get port => 'Porto';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$gl extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get time => 'Hora:';
  @override
  String get title => 'Información do ficheiro';
  @override
  String get fileName => 'Nome do ficheiro:';
  @override
  String get path => 'Ruta:';
  @override
  String get size => 'Tamaño:';
  @override
  String get sender => 'Remitente:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$gl extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduce o nome do ficheiro';
  @override
  String original({required Object original}) => 'Orixinal: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$gl extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Limpar historial';
  @override
  String get content => 'Realmente queres eliminar todo o historial?';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$gl extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Non concedeches os permisos necesarios. Por favor, concédeos na configuración.';
  @override
  String get title => 'Sen permiso';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$gl extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Por favor selecciona polo menos un ficheiro.';
  @override
  String get title => 'Non se seleccionaron ficheiros';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$gl extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend non pode atopar outros dispositivos sen ter permiso para escanear a rede local. Por favor, concede este permiso na configuración.';
  @override
  String get gotoSettings => 'Axustes';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$gl extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Escribir mensaxe';
  @override
  String get multiline => 'Multiliña';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$gl extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Non dispoñíbel';
  @override
  String get content => 'Esta característica só está dispoñíbel en:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$gl extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$gl extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Accións rápidas';
  @override
  String get counter => 'Contador';
  @override
  String get prefix => 'Prefixo';
  @override
  String get padZero => 'Encher con ceros';
  @override
  String get sortBeforeCount => 'Ordenar alfabéticamente de antemán (A-Z)';
  @override
  String get random => 'Aleatorio';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$gl extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Agora as solicitudes de ficheiros acéptanse automaticamente. Teña en conta que todos os usuarios da rede local poden enviarche ficheiros.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$gl extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.pin
class _Translations$dialogs$pin$gl extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Insira o PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$gl extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modos de envío';
  @override
  String get single => 'Envia ficheiros a un receptor. A selección borrarase unha vez rematada a transferencia de ficheiros.';
  @override
  String get multiple => 'Envia ficheiros a múltiples receptores. A selección non se borrará unha vez rematada a transferencia de ficheiros.';
  @override
  String get link =>
      'Os destinatarios que non teñan instalado LocalSend poden descargar os ficheiros seleccionados abrindo a ligazón no seu navegador.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$gl extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Agora as solicitudes de ficheiros da túa lista de dispositivos favoritos acéptanse automaticamente.',
    'Aviso! Actualmente isto non é completamente seguro, xa que un hacker que teña a pegada dixital de calquera dos dispositivos da túa lista de favoritos pode enviarte ficheiros sen restriccións.',
    'Porén, esta opción aínda é máis segura que permitir que todos os usuarios da rede local te envíen ficheiros sen restricións.',
  ];
}

// Path: progressPage.total
class _Translations$progressPage$total$gl extends Translations$progressPage$total$en {
  _Translations$progressPage$total$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$gl title = _Translations$progressPage$total$title$gl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Ficheiros: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaño: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$gl extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Usa «h» para abreviatura de horas e «m» para minutos
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Usa «d» para días, «h» para horas e «m» para minutos
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$gl extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Escuro';
  @override
  String get light => 'Luz';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$gl extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$gl extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$gl extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todo';
  @override
  String get filtered => 'Filtrado';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$gl extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$gl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get canceledReceiver => 'Cancelado polo receptor';
  @override
  String sending({required Object time}) => 'Progreso total (${time})';
  @override
  String get finishedError => 'Rematado con erro';
  @override
  String get canceledSender => 'Cancelado polo remitente';
}
