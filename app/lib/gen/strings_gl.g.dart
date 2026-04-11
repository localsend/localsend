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
class TranslationsGl extends Translations {
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
  late final _TranslationsGeneralGl general = _TranslationsGeneralGl._(_root);
  @override
  late final _TranslationsReceiveTabGl receiveTab = _TranslationsReceiveTabGl._(_root);
  @override
  late final _TranslationsSendTabGl sendTab = _TranslationsSendTabGl._(_root);
  @override
  late final _TranslationsSettingsTabGl settingsTab = _TranslationsSettingsTabGl._(_root);
  @override
  late final _TranslationsTroubleshootPageGl troubleshootPage = _TranslationsTroubleshootPageGl._(_root);
  @override
  late final _TranslationsApkPickerPageGl apkPickerPage = _TranslationsApkPickerPageGl._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageGl networkInterfacesPage = _TranslationsNetworkInterfacesPageGl._(_root);
  @override
  late final _TranslationsReceiveHistoryPageGl receiveHistoryPage = _TranslationsReceiveHistoryPageGl._(_root);
  @override
  late final _TranslationsSelectedFilesPageGl selectedFilesPage = _TranslationsSelectedFilesPageGl._(_root);
  @override
  late final _TranslationsReceivePageGl receivePage = _TranslationsReceivePageGl._(_root);
  @override
  late final _TranslationsReceiveOptionsPageGl receiveOptionsPage = _TranslationsReceiveOptionsPageGl._(_root);
  @override
  late final _TranslationsDialogsGl dialogs = _TranslationsDialogsGl._(_root);
  @override
  late final _TranslationsWebSharePageGl webSharePage = _TranslationsWebSharePageGl._(_root);
  @override
  late final _TranslationsProgressPageGl progressPage = _TranslationsProgressPageGl._(_root);
  @override
  late final _TranslationsAboutPageGl aboutPage = _TranslationsAboutPageGl._(_root);
  @override
  late final _TranslationsSendPageGl sendPage = _TranslationsSendPageGl._(_root);
  @override
  late final _TranslationsDonationPageGl donationPage = _TranslationsDonationPageGl._(_root);
  @override
  late final _TranslationsChangelogPageGl changelogPage = _TranslationsChangelogPageGl._(_root);
  @override
  late final _TranslationsTrayGl tray = _TranslationsTrayGl._(_root);
  @override
  late final _TranslationsSanitizationGl sanitization = _TranslationsSanitizationGl._(_root);
  @override
  late final _TranslationsWebGl web = _TranslationsWebGl._(_root);
  @override
  late final _TranslationsAssetPickerGl assetPicker = _TranslationsAssetPickerGl._(_root);
}

// Path: general
class _TranslationsGeneralGl extends TranslationsGeneralEn {
  _TranslationsGeneralGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabGl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  late final _TranslationsReceiveTabInfoBoxGl infoBox = _TranslationsReceiveTabInfoBoxGl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveGl quickSave = _TranslationsReceiveTabQuickSaveGl._(_root);
}

// Path: sendTab
class _TranslationsSendTabGl extends TranslationsSendTabEn {
  _TranslationsSendTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _TranslationsSendTabSelectionGl selection = _TranslationsSendTabSelectionGl._(_root);
  @override
  late final _TranslationsSendTabPickerGl picker = _TranslationsSendTabPickerGl._(_root);
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
  late final _TranslationsSendTabSendModesGl sendModes = _TranslationsSendTabSendModesGl._(_root);
  @override
  String get sendModeHelp => 'Explicación';
  @override
  String get help => 'Asegúrate de que o obxectivo desexado tamén estea na mesma rede wifi.';
  @override
  String get placeItems => 'Coloca elementos para compartir.';
}

// Path: settingsTab
class _TranslationsSettingsTabGl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configuración';
  @override
  late final _TranslationsSettingsTabGeneralGl general = _TranslationsSettingsTabGeneralGl._(_root);
  @override
  late final _TranslationsSettingsTabReceiveGl receive = _TranslationsSettingsTabReceiveGl._(_root);
  @override
  late final _TranslationsSettingsTabNetworkGl network = _TranslationsSettingsTabNetworkGl._(_root);
  @override
  late final _TranslationsSettingsTabSendGl send = _TranslationsSettingsTabSendGl._(_root);
  @override
  late final _TranslationsSettingsTabOtherGl other = _TranslationsSettingsTabOtherGl._(_root);
  @override
  String get advancedSettings => 'Configuración avanzada';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageGl extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryGl noDiscovery = _TranslationsTroubleshootPageNoDiscoveryGl._(_root);
  @override
  late final _TranslationsTroubleshootPageFirewallGl firewall = _TranslationsTroubleshootPageFirewallGl._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionGl noConnection = _TranslationsTroubleshootPageNoConnectionGl._(_root);
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
class _TranslationsApkPickerPageGl extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageGl extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveHistoryPageGl extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsGl entryActions = _TranslationsReceiveHistoryPageEntryActionsGl._(_root);
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageGl extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Eliminar todo';
}

// Path: receivePage
class _TranslationsReceivePageGl extends TranslationsReceivePageEn {
  _TranslationsReceivePageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveOptionsPageGl extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsGl extends TranslationsDialogsEn {
  _TranslationsDialogsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeGl encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeGl._(_root);
  @override
  late final _TranslationsDialogsOpenFileGl openFile = _TranslationsDialogsOpenFileGl._(_root);
  @override
  late final _TranslationsDialogsAddressInputGl addressInput = _TranslationsDialogsAddressInputGl._(_root);
  @override
  late final _TranslationsDialogsAddFileGl addFile = _TranslationsDialogsAddFileGl._(_root);
  @override
  late final _TranslationsDialogsCancelSessionGl cancelSession = _TranslationsDialogsCancelSessionGl._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileGl cannotOpenFile = _TranslationsDialogsCannotOpenFileGl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogGl favoriteDialog = _TranslationsDialogsFavoriteDialogGl._(_root);
  @override
  late final _TranslationsDialogsErrorDialogGl errorDialog = _TranslationsDialogsErrorDialogGl._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogGl favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogGl._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogGl favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogGl._(_root);
  @override
  late final _TranslationsDialogsFileInfoGl fileInfo = _TranslationsDialogsFileInfoGl._(_root);
  @override
  late final _TranslationsDialogsFileNameInputGl fileNameInput = _TranslationsDialogsFileNameInputGl._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogGl historyClearDialog = _TranslationsDialogsHistoryClearDialogGl._(_root);
  @override
  late final _TranslationsDialogsNoPermissionGl noPermission = _TranslationsDialogsNoPermissionGl._(_root);
  @override
  late final _TranslationsDialogsNoFilesGl noFiles = _TranslationsDialogsNoFilesGl._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedGl localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedGl._(_root);
  @override
  late final _TranslationsDialogsMessageInputGl messageInput = _TranslationsDialogsMessageInputGl._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformGl notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformGl._(_root);
  @override
  late final _TranslationsDialogsQrGl qr = _TranslationsDialogsQrGl._(_root);
  @override
  late final _TranslationsDialogsQuickActionsGl quickActions = _TranslationsDialogsQuickActionsGl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeGl quickSaveNotice = _TranslationsDialogsQuickSaveNoticeGl._(_root);
  @override
  late final _TranslationsDialogsZoomGl zoom = _TranslationsDialogsZoomGl._(_root);
  @override
  late final _TranslationsDialogsPinGl pin = _TranslationsDialogsPinGl._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpGl sendModeHelp = _TranslationsDialogsSendModeHelpGl._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeGl quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeGl._(
    _root,
  );
}

// Path: webSharePage
class _TranslationsWebSharePageGl extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageGl extends TranslationsProgressPageEn {
  _TranslationsProgressPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalGl total = _TranslationsProgressPageTotalGl._(_root);
  @override
  String get titleReceiving => 'Recibindo ficheiros';
  @override
  String get savedToGallery => 'Gardado en Fotos';
  @override
  String get titleSending => 'Enviando ficheiros';
  @override
  late final _TranslationsProgressPageRemainingTimeGl remainingTime = _TranslationsProgressPageRemainingTimeGl._(_root);
}

// Path: aboutPage
class _TranslationsAboutPageGl extends TranslationsAboutPageEn {
  _TranslationsAboutPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageGl extends TranslationsSendPageEn {
  _TranslationsSendPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageGl extends TranslationsDonationPageEn {
  _TranslationsDonationPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageGl extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rexistro de cambios';
}

// Path: tray
class _TranslationsTrayGl extends TranslationsTrayEn {
  _TranslationsTrayGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSanitizationGl extends TranslationsSanitizationEn {
  _TranslationsSanitizationGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'O nome do ficheiro non pode estar valeiro';
  @override
  String get invalid => 'O nome do ficheiro contén caracteres inválidos';
}

// Path: web
class _TranslationsWebGl extends TranslationsWebEn {
  _TranslationsWebGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerGl extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabInfoBoxGl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveGl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionGl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerGl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesGl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralGl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xeral';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsGl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsGl._(_root);
  @override
  String get color => 'Cor';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsGl colorOptions = _TranslationsSettingsTabGeneralColorOptionsGl._(_root);
  @override
  String get language => 'Linguaxe';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsGl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsGl._(_root);
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
class _TranslationsSettingsTabReceiveGl extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabNetworkGl extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsGl networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsGl._(_root);
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
class _TranslationsSettingsTabSendGl extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Aceptar automáticamente peticións no modo "Compartir mediante ligazón"';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherGl extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageNoDiscoveryGl extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Por favor asegúrese de que todos os dispositivos están na mesma rede Wi-Fi e que co partan a mesma configuración (porto, enderezo multicast, cifrado). Podes tentar escribir o enderezo IP do dispositivo de destino manualmente. Se funciona, considera agregar o dispositivo a favoritos para poder descubrilo automaticamente no futuro.';
  @override
  String get symptom => 'Este dispositivo non pode descubrir outros dispositivos.';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallGl extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageNoConnectionGl extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos dispositivos non poden descubrirse nin enviarse ficheiros.';
  @override
  String get solution =>
      'O problema existe nos dous lados? Se é así, cómpre asegurarse de que ambos os dispositivos están na mesma rede Wi-Fi e comparten a mesma configuración (porto, enderezo de multidifusión, cifrado). É posíbel que a rede wifi non permita a comunicación entre os participantes debido ao illamento do punto de acceso (AP). Neste caso, esta opción debe estar desactivada no router.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsGl extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsEncryptionDisabledNoticeGl extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cifrado deshabilitado';
  @override
  String get content =>
      'A comunicación ten lugar agora mediante o protocolo sen cifrado HTTP. Para usar o protocolo HTTPS, habilite novamente o cifrado.';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileGl extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir ficheiro';
  @override
  String get content => 'Queres abrir o ficheiro recibido?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputGl extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsAddFileGl extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Que queres engadir?';
  @override
  String get title => 'Engadir á selección';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionGl extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar a transferencia de ficheiros';
  @override
  String get content => 'Realmente queres cancelar a transferencia de ficheiros?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileGl extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String content({required Object file}) => 'Non se puido abrir "${file}". Moveuse, renomeouse ou eliminouse este ficheiro?';
  @override
  String get title => 'Non se pode abrir o ficheiro';
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogGl extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsErrorDialogGl extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogGl extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar de favoritos';
  @override
  String content({required Object name}) => 'Realmente queres eliminar dos favoritos "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogGl extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoGl extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputGl extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introduce o nome do ficheiro';
  @override
  String original({required Object original}) => 'Orixinal: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogGl extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Limpar historial';
  @override
  String get content => 'Realmente queres eliminar todo o historial?';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionGl extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Non concedeches os permisos necesarios. Por favor, concédeos na configuración.';
  @override
  String get title => 'Sen permiso';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesGl extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Por favor selecciona polo menos un ficheiro.';
  @override
  String get title => 'Non se seleccionaron ficheiros';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedGl extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputGl extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Escribir mensaxe';
  @override
  String get multiline => 'Multiliña';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformGl extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Non dispoñíbel';
  @override
  String get content => 'Esta característica só está dispoñíbel en:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrGl extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsGl extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeGl extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Agora as solicitudes de ficheiros acéptanse automaticamente. Teña en conta que todos os usuarios da rede local poden enviarche ficheiros.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomGl extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.pin
class _TranslationsDialogsPinGl extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Insira o PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpGl extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveFromFavoritesNoticeGl extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalGl extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleGl title = _TranslationsProgressPageTotalTitleGl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Ficheiros: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaño: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: progressPage.remainingTime
class _TranslationsProgressPageRemainingTimeGl extends TranslationsProgressPageRemainingTimeEn {
  _TranslationsProgressPageRemainingTimeGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralBrightnessOptionsGl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsGl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsGl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsGl extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todo';
  @override
  String get filtered => 'Filtrado';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleGl extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleGl._(TranslationsGl root) : this._root = root, super.internal(root);

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
