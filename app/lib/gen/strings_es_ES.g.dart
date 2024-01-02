part of 'strings.g.dart';

// Path: <root>
class _StringsEsEs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.esEs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <es-ES>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsEsEs _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Español';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralEsEs general = _StringsGeneralEsEs._(_root);
	@override late final _StringsReceiveTabEsEs receiveTab = _StringsReceiveTabEsEs._(_root);
	@override late final _StringsSendTabEsEs sendTab = _StringsSendTabEsEs._(_root);
	@override late final _StringsSettingsTabEsEs settingsTab = _StringsSettingsTabEsEs._(_root);
	@override late final _StringsTroubleshootPageEsEs troubleshootPage = _StringsTroubleshootPageEsEs._(_root);
	@override late final _StringsReceiveHistoryPageEsEs receiveHistoryPage = _StringsReceiveHistoryPageEsEs._(_root);
	@override late final _StringsApkPickerPageEsEs apkPickerPage = _StringsApkPickerPageEsEs._(_root);
	@override late final _StringsSelectedFilesPageEsEs selectedFilesPage = _StringsSelectedFilesPageEsEs._(_root);
	@override late final _StringsReceivePageEsEs receivePage = _StringsReceivePageEsEs._(_root);
	@override late final _StringsReceiveOptionsPageEsEs receiveOptionsPage = _StringsReceiveOptionsPageEsEs._(_root);
	@override late final _StringsSendPageEsEs sendPage = _StringsSendPageEsEs._(_root);
	@override late final _StringsProgressPageEsEs progressPage = _StringsProgressPageEsEs._(_root);
	@override late final _StringsWebSharePageEsEs webSharePage = _StringsWebSharePageEsEs._(_root);
	@override late final _StringsAboutPageEsEs aboutPage = _StringsAboutPageEsEs._(_root);
	@override late final _StringsDonationPageEsEs donationPage = _StringsDonationPageEsEs._(_root);
	@override late final _StringsChangelogPageEsEs changelogPage = _StringsChangelogPageEsEs._(_root);
	@override late final _StringsAliasGeneratorEsEs aliasGenerator = _StringsAliasGeneratorEsEs._(_root);
	@override late final _StringsDialogsEsEs dialogs = _StringsDialogsEsEs._(_root);
	@override late final _StringsTrayEsEs tray = _StringsTrayEsEs._(_root);
	@override late final _StringsWebEsEs web = _StringsWebEsEs._(_root);
	@override late final _StringsAssetPickerEsEs assetPicker = _StringsAssetPickerEsEs._(_root);
}

// Path: general
class _StringsGeneralEsEs extends _StringsGeneralEn {
	_StringsGeneralEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Aceptar';
	@override String get accepted => 'Aceptado';
	@override String get add => 'Añadir';
	@override String get advanced => 'Avanzado';
	@override String get cancel => 'Cancelar';
	@override String get close => 'Cerrar';
	@override String get confirm => 'Confirmar';
	@override String get continueStr => 'Continuar';
	@override String get copy => 'Copiar';
	@override String get copiedToClipboard => 'Copiado al Portapapeles';
	@override String get decline => 'Rechazar';
	@override String get done => 'Hecho';
	@override String get delete => 'Eliminar';
	@override String get edit => 'Editar';
	@override String get error => 'Error';
	@override String get example => 'Ejemplo';
	@override String get files => 'Archivos';
	@override String get finished => 'Finalizado';
	@override String get hide => 'Ocultar';
	@override String get off => 'Apagado';
	@override String get offline => 'Desconectado';
	@override String get on => 'Encendido';
	@override String get online => 'En línea';
	@override String get open => 'Abrir';
	@override String get queue => 'Cola';
	@override String get quickSave => 'Guardado Rápido';
	@override String get renamed => 'Renombrado';
	@override String get reset => 'Resetear';
	@override String get restart => 'Reiniciar';
	@override String get settings => 'Ajustes';
	@override String get skipped => 'Omitido';
	@override String get start => 'Iniciar';
	@override String get stop => 'Detener';
	@override String get save => 'Guardar';
	@override String get unchanged => 'Sin Cambios';
	@override String get unknown => 'Desconocido';
	@override String get noItemInClipboard => 'No hay ningún elemento en el portapapeles';
}

// Path: receiveTab
class _StringsReceiveTabEsEs extends _StringsReceiveTabEn {
	_StringsReceiveTabEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recibir';
	@override late final _StringsReceiveTabInfoBoxEsEs infoBox = _StringsReceiveTabInfoBoxEsEs._(_root);
}

// Path: sendTab
class _StringsSendTabEsEs extends _StringsSendTabEn {
	_StringsSendTabEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enviar';
	@override late final _StringsSendTabSelectionEsEs selection = _StringsSendTabSelectionEsEs._(_root);
	@override late final _StringsSendTabPickerEsEs picker = _StringsSendTabPickerEsEs._(_root);
	@override String get shareIntentInfo => 'También puedes usar la opción "Compartir" de tu dispositivo para seleccionar archivos más fácilmente.';
	@override String get nearbyDevices => 'Dispositivos Cercanos';
	@override String get thisDevice => 'Este dispositivo';
	@override String get scan => 'Buscar dispositivos';
	@override String get sendMode => 'Modo de envío';
	@override late final _StringsSendTabSendModesEsEs sendModes = _StringsSendTabSendModesEsEs._(_root);
	@override String get sendModeHelp => 'Explicación';
	@override String get help => 'Asegúrate de que el destino elegido esté en la misma red Wi-Fi.';
	@override String get placeItems => 'Selecciona items para compartir.';
}

// Path: settingsTab
class _StringsSettingsTabEsEs extends _StringsSettingsTabEn {
	_StringsSettingsTabEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajustes';
	@override late final _StringsSettingsTabGeneralEsEs general = _StringsSettingsTabGeneralEsEs._(_root);
	@override late final _StringsSettingsTabReceiveEsEs receive = _StringsSettingsTabReceiveEsEs._(_root);
	@override late final _StringsSettingsTabNetworkEsEs network = _StringsSettingsTabNetworkEsEs._(_root);
	@override late final _StringsSettingsTabOtherEsEs other = _StringsSettingsTabOtherEsEs._(_root);
	@override String get advancedSettings => 'Configuración avanzada';
}

// Path: troubleshootPage
class _StringsTroubleshootPageEsEs extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Solucionar problemas';
	@override String get subTitle => '¿La aplicación no funciona como debería? Aquí puedes encontrar soluciones a problemas comunes.';
	@override String get solution => 'Solución:';
	@override String get fixButton => 'Corregir automáticamente';
	@override late final _StringsTroubleshootPageFirewallEsEs firewall = _StringsTroubleshootPageFirewallEsEs._(_root);
	@override late final _StringsTroubleshootPageNoConnectionEsEs noConnection = _StringsTroubleshootPageNoConnectionEsEs._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageEsEs extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historial';
	@override String get openFolder => 'Abrir carpeta';
	@override String get deleteHistory => 'Borrar historial';
	@override String get empty => 'El historial está vacío.';
	@override late final _StringsReceiveHistoryPageEntryActionsEsEs entryActions = _StringsReceiveHistoryPageEntryActionsEsEs._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageEsEs extends _StringsApkPickerPageEn {
	_StringsApkPickerPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apps (APK)';
	@override String get excludeSystemApps => 'Excluir apps de sistema';
	@override String get excludeAppsWithoutLaunchIntent => 'Excluir apps no ejecutables';
	@override String apps({required Object n}) => '${n} Apps';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageEsEs extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Eliminar todo';
}

// Path: receivePage
class _StringsReceivePageEsEs extends _StringsReceivePageEn {
	_StringsReceivePageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'quiere enviarte un archivo',
		other: 'quiere enviarte ${n} archivos',
	);
	@override String get subTitleMessage => 'te ha enviado un mensaje:';
	@override String get subTitleLink => 'te ha enviado un enlace:';
	@override String get canceled => 'El remitente ha cancelado la petición.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageEsEs extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciones';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(carpeta ${_root.appName})';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Desactivado automáticamente porque hay carpetas.';
}

// Path: sendPage
class _StringsSendPageEsEs extends _StringsSendPageEn {
	_StringsSendPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Esperando respuesta...';
	@override String get rejected => 'El destino ha rechazado la petición.';
	@override String get busy => 'El destino está ocupado con otra petición.';
}

// Path: progressPage
class _StringsProgressPageEsEs extends _StringsProgressPageEn {
	_StringsProgressPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Enviando archivos';
	@override String get titleReceiving => 'Recibiendo archivos';
	@override String get savedToGallery => 'Guardado en fotos';
	@override late final _StringsProgressPageTotalEsEs total = _StringsProgressPageTotalEsEs._(_root);
}

// Path: webSharePage
class _StringsWebSharePageEsEs extends _StringsWebSharePageEn {
	_StringsWebSharePageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compartir mediante enlace';
	@override String get loading => 'Iniciando servidor...';
	@override String get stopping => 'Deteniendo servidor...';
	@override String get error => 'Se ha producido un error al iniciar el servidor.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'Abre este enlace en el navegador:',
		other: 'Abre uno de estos enlaces en el navegador:',
	);
	@override String get requests => 'Solicitudes';
	@override String get noRequests => 'Aún no hay solicitudes.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend utiliza un certificado autofirmado. Necesitas aceptarlo en el navegador.';
	@override String pendingRequests({required Object n}) => 'Solicitudes pendientes: ${n}';
}

// Path: aboutPage
class _StringsAboutPageEsEs extends _StringsAboutPageEn {
	_StringsAboutPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobre LocalSend';
	@override List<String> get description => [
		'LocalSend es una aplicación libre, de código abierto, que te permite compartir archivos y mensajes de forma segura con dispositivos cercanos a través de tu red local sin necesidad de conexión a Internet.',
		'Está disponible para Android, iOS, macOS, Windows y Linux. Puedes encontrar todas las opciones de descarga en la página web oficial.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Colaboradores';
	@override String get translators => 'Traductores';
}

// Path: donationPage
class _StringsDonationPageEsEs extends _StringsDonationPageEn {
	_StringsDonationPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Donar';
	@override String get info => 'LocalSend es libre, open source y no contiene anuncios. Si te gusta la aplicación puedes ayudar al desarrollo con una donación.';
	@override String donate({required Object amount}) => 'Donar ${amount}';
	@override String get thanks => '¡Muchas gracias!';
	@override String get restore => 'Restablecer compra';
}

// Path: changelogPage
class _StringsChangelogPageEsEs extends _StringsChangelogPageEn {
	_StringsChangelogPageEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registro de cambios';
}

// Path: aliasGenerator
class _StringsAliasGeneratorEsEs extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsEsEs extends _StringsDialogsEn {
	_StringsDialogsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileEsEs addFile = _StringsDialogsAddFileEsEs._(_root);
	@override late final _StringsDialogsAddressInputEsEs addressInput = _StringsDialogsAddressInputEsEs._(_root);
	@override late final _StringsDialogsCancelSessionEsEs cancelSession = _StringsDialogsCancelSessionEsEs._(_root);
	@override late final _StringsDialogsCannotOpenFileEsEs cannotOpenFile = _StringsDialogsCannotOpenFileEsEs._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeEsEs encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeEsEs._(_root);
	@override late final _StringsDialogsErrorDialogEsEs errorDialog = _StringsDialogsErrorDialogEsEs._(_root);
	@override late final _StringsDialogsFavoriteDialogEsEs favoriteDialog = _StringsDialogsFavoriteDialogEsEs._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogEsEs favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogEsEs._(_root);
	@override late final _StringsDialogsFavoriteEditDialogEsEs favoriteEditDialog = _StringsDialogsFavoriteEditDialogEsEs._(_root);
	@override late final _StringsDialogsFileInfoEsEs fileInfo = _StringsDialogsFileInfoEsEs._(_root);
	@override late final _StringsDialogsFileNameInputEsEs fileNameInput = _StringsDialogsFileNameInputEsEs._(_root);
	@override late final _StringsDialogsHistoryClearDialogEsEs historyClearDialog = _StringsDialogsHistoryClearDialogEsEs._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedEsEs localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedEsEs._(_root);
	@override late final _StringsDialogsMessageInputEsEs messageInput = _StringsDialogsMessageInputEsEs._(_root);
	@override late final _StringsDialogsNoFilesEsEs noFiles = _StringsDialogsNoFilesEsEs._(_root);
	@override late final _StringsDialogsNoPermissionEsEs noPermission = _StringsDialogsNoPermissionEsEs._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformEsEs notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformEsEs._(_root);
	@override late final _StringsDialogsQrEsEs qr = _StringsDialogsQrEsEs._(_root);
	@override late final _StringsDialogsQuickActionsEsEs quickActions = _StringsDialogsQuickActionsEsEs._(_root);
	@override late final _StringsDialogsQuickSaveNoticeEsEs quickSaveNotice = _StringsDialogsQuickSaveNoticeEsEs._(_root);
	@override late final _StringsDialogsSendModeHelpEsEs sendModeHelp = _StringsDialogsSendModeHelpEsEs._(_root);
}

// Path: tray
class _StringsTrayEsEs extends _StringsTrayEn {
	_StringsTrayEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Cerrar LocalSend';
}

// Path: web
class _StringsWebEsEs extends _StringsWebEn {
	_StringsWebEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Rechazado';
	@override String get files => 'Archivos';
	@override String get fileName => 'Nombre del archivo';
	@override String get size => 'Tamaño';
}

// Path: assetPicker
class _StringsAssetPickerEsEs extends _StringsAssetPickerEn {
	_StringsAssetPickerEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get edit => 'Editar';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Error de carga';
	@override String get original => 'Original';
	@override String get preview => 'Vista previa';
	@override String get select => 'Seleccionar';
	@override String get emptyList => 'Lista vacía';
	@override String get unSupportedAssetType => 'Tipo de archivo no soportado.';
	@override String get unableToAccessAll => 'No se puede acceder a los archivos del dispositivo.';
	@override String get viewingLimitedAssetsTip => 'Ver sólo los archivos y álbumes accesibles para la aplicación.';
	@override String get changeAccessibleLimitedAssets => 'Haga clic para actualizar los archivos accesibles';
	@override String get accessAllTip => 'La aplicación sólo puede acceder a algunos archivos del dispositivo. Ve a la configuración del sistema y permite que la aplicación acceda a todos los archivos multimedia del dispositivo.';
	@override String get goToSystemSettings => 'Ir a los ajustes del sistema';
	@override String get accessLimitedAssets => 'Continuar con acceso limitado';
	@override String get accessiblePathName => 'Archivos accesibles';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Imagen';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Otros medios';
	@override String get sActionPlayHint => 'play';
	@override String get sActionPreviewHint => 'vista previa';
	@override String get sActionSelectHint => 'selecccionar';
	@override String get sActionSwitchPathLabel => 'cambiar ruta';
	@override String get sActionUseCameraHint => 'usar cámara';
	@override String get sNameDurationLabel => 'duración';
	@override String get sUnitAssetCountLabel => 'conteo';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxEsEs extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Puerto:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionEsEs extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selección';
	@override String files({required Object files}) => 'Archivos: ${files}';
	@override String size({required Object size}) => 'Tamaño: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerEsEs extends _StringsSendTabPickerEn {
	_StringsSendTabPickerEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get file => 'Archivo';
	@override String get folder => 'Carpeta';
	@override String get media => 'Medios';
	@override String get text => 'Texto';
	@override String get app => 'App';
	@override String get clipboard => 'Pegar';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesEsEs extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get single => 'Solo un destino';
	@override String get multiple => 'Múltiples destinos';
	@override String get link => 'Compartir enlace';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralEsEs extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'General';
	@override String get brightness => 'Luminosidad';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsEsEs brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsEsEs._(_root);
	@override String get color => 'Color';
	@override late final _StringsSettingsTabGeneralColorOptionsEsEs colorOptions = _StringsSettingsTabGeneralColorOptionsEsEs._(_root);
	@override String get language => 'Idioma';
	@override late final _StringsSettingsTabGeneralLanguageOptionsEsEs languageOptions = _StringsSettingsTabGeneralLanguageOptionsEsEs._(_root);
	@override String get saveWindowPlacement => 'Al salir guardar la ubicación de la ventana';
	@override String get minimizeToTray => 'Cerrar: Minimizar ventana';
	@override String get launchAtStartup => 'Inicio automático';
	@override String get launchMinimized => 'Inicio automático: Iniciar minimizado';
	@override String get animations => 'Animaciones';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveEsEs extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recibir';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Auto finalizar';
	@override String get destination => 'Destino';
	@override String get downloads => '(Descargas)';
	@override String get saveToGallery => 'Guardar media en la galería';
	@override String get saveToHistory => 'Guardar en el historial';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkEsEs extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Red';
	@override String get needRestart => 'Reiniciar el servidor para aplicar los ajustes.';
	@override String get server => 'Servidor';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Tipo de dispositivo';
	@override String get deviceModel => 'Modelo de dispositivo';
	@override String get port => 'Puerto';
	@override String portWarning({required Object defaultPort}) => 'Es posible que no seas visible para otros dispositivos porque estás utilizando un puerto personalizado. (Puerto por defecto: ${defaultPort})';
	@override String get encryption => 'Encriptación';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Es posible que no seas visible para otros dispositivos porque estás utilizando una dirección multicast personalizada. (Dirección multicast por defecto: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherEsEs extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Otros';
	@override String get support => 'Apoya a LocalSend';
	@override String get donate => 'Donar';
	@override String get privacyPolicy => 'Política de privacidad';
	@override String get termsOfUse => 'Condiciones de uso';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallEsEs extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Esta aplicación puede enviar archivos a otros dispositivos pero otros dispositivos no pueden enviar archivos a este.';
	@override String solution({required Object port}) => 'Lo más probable es que se trate de un problema con el firewall, puedes solucionarlo permitiendo las conexiones entrantes (UDP y TCP) en el puerto ${port}.';
	@override String get openFirewall => 'Abrir Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionEsEs extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ambos dispositivos no pueden descubrirse ni compartir archivos.';
	@override String get solution => '¿El problema existe en ambos lados? Tienes que asegurarte que los dispositivos están en la misma red wifi y comparten la misma configuración (puerto, dirección multicast, encriptación). Es posible que el wifi no permita la comunicación entre los dispositivos. En este caso, hay que activar esta opción en el router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsEsEs extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get open => 'Abrir archivo';
	@override String get info => 'Información';
	@override String get deleteFromHistory => 'Borrar del historial';
}

// Path: progressPage.total
class _StringsProgressPageTotalEsEs extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleEsEs title = _StringsProgressPageTotalTitleEsEs._(_root);
	@override String count({required Object curr, required Object n}) => 'Archivos: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Tamaño: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Velocidad: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileEsEs extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Añadir a selección';
	@override String get content => '¿Qué quieres añadir?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputEsEs extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introducir dirección';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Dirección IP';
	@override String get recentlyUsed => 'Usados recientemente: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionEsEs extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cancelar transferencia de archivos';
	@override String get content => '¿Realmente quieres cancelar la transferencia de archivos?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileEsEs extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'No se puede abrir el archivo';
	@override String content({required Object file}) => 'No se ha podido abrir "${file}". ¿Es posible que el archivo se haya movido, renombrado o eliminado?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeEsEs extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encriptación deshabilitada';
	@override String get content => 'La comunicación ahora tiene lugar mediante un protocolo HTTP sin encriptar. Para usar HTTPS, vuelve a habilitar la encriptación.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogEsEs extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogEsEs extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get noFavorites => 'Aún no hay dispositivos favoritos.';
	@override String get addFavorite => 'Agregar';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogEsEs extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eliminar de favoritos';
	@override String content({required Object name}) => '¿Realmente quieres borrar de favoritos "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogEsEs extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Agregar a favoritos';
	@override String get titleEdit => 'Editar';
	@override String get name => 'Alias';
	@override String get auto => '(auto)';
	@override String get ip => 'Dirección IP';
	@override String get port => 'Puerto';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoEsEs extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información del archivo';
	@override String get fileName => 'Nombre del archivo:';
	@override String get path => 'Ruta:';
	@override String get size => 'Tamaño:';
	@override String get sender => 'Emisor:';
	@override String get time => 'Hora:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputEsEs extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Introduce el nombre';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogEsEs extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Borrar historial';
	@override String get content => '¿Realmente quieres borrar todo el historial?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedEsEs extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend no puede encontrar otros dispositivos sin tener permiso para escanear la red local. Por favor, concede este permiso en los ajustes.';
	@override String get gotoSettings => 'Ajustes';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputEsEs extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Escribe un mensaje';
	@override String get multiline => 'Varias líneas';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesEsEs extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ningún archivo seleccionado';
	@override String get content => 'Por favor selecciona al menos un archivo.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionEsEs extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sin autorización';
	@override String get content => 'No has otorgado los permisos necesarios. Por favor, otórgalos en la configuración.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformEsEs extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'No disponible';
	@override String get content => 'Esta característica solo está disponible en:';
}

// Path: dialogs.qr
class _StringsDialogsQrEsEs extends _StringsDialogsQrEn {
	_StringsDialogsQrEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsEsEs extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acciones rápidas';
	@override String get counter => 'Contador';
	@override String get prefix => 'Prefijo';
	@override String get padZero => 'Llenar con ceros';
	@override String get sortBeforeCount => 'Ordenar alfabéticamente antes';
	@override String get random => 'Aleatorio';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeEsEs extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Las solicitudes de archivos se aceptan automáticamente. Ten en cuenta que cualquiera en la red local podrá enviarte archivos.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpEsEs extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modos de envío';
	@override String get single => 'Enviar archivos a un solo destino. La selección se borrará una vez finalizada la transferencia.';
	@override String get multiple => 'Enviar archivos a múltiples destinos. La selección no se borrará.';
	@override String get link => 'Los destinatarios que no tengan LocalSend instalado pueden descargar los archivos seleccionados abriendo el enlace en su navegador.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsEsEs extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Oscuro';
	@override String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsEsEs extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsEsEs extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleEsEs extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleEsEs._(_StringsEsEs root) : this._root = root, super._(root);

	@override final _StringsEsEs _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progreso total (${time})';
	@override String get finishedError => 'Finalizado con error';
	@override String get canceledSender => 'Cancelado por remitente';
	@override String get canceledReceiver => 'Cancelado por destino';
}
