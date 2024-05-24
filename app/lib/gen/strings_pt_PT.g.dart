///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsPtPt extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPtPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ptPt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-PT>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsPtPt _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Português (Portugal)';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralPtPt general = _StringsGeneralPtPt._(_root);
	@override late final _StringsReceiveTabPtPt receiveTab = _StringsReceiveTabPtPt._(_root);
	@override late final _StringsSendTabPtPt sendTab = _StringsSendTabPtPt._(_root);
	@override late final _StringsSettingsTabPtPt settingsTab = _StringsSettingsTabPtPt._(_root);
	@override late final _StringsTroubleshootPagePtPt troubleshootPage = _StringsTroubleshootPagePtPt._(_root);
	@override late final _StringsReceiveHistoryPagePtPt receiveHistoryPage = _StringsReceiveHistoryPagePtPt._(_root);
	@override late final _StringsApkPickerPagePtPt apkPickerPage = _StringsApkPickerPagePtPt._(_root);
	@override late final _StringsSelectedFilesPagePtPt selectedFilesPage = _StringsSelectedFilesPagePtPt._(_root);
	@override late final _StringsReceivePagePtPt receivePage = _StringsReceivePagePtPt._(_root);
	@override late final _StringsReceiveOptionsPagePtPt receiveOptionsPage = _StringsReceiveOptionsPagePtPt._(_root);
	@override late final _StringsSendPagePtPt sendPage = _StringsSendPagePtPt._(_root);
	@override late final _StringsProgressPagePtPt progressPage = _StringsProgressPagePtPt._(_root);
	@override late final _StringsWebSharePagePtPt webSharePage = _StringsWebSharePagePtPt._(_root);
	@override late final _StringsAboutPagePtPt aboutPage = _StringsAboutPagePtPt._(_root);
	@override late final _StringsDonationPagePtPt donationPage = _StringsDonationPagePtPt._(_root);
	@override late final _StringsChangelogPagePtPt changelogPage = _StringsChangelogPagePtPt._(_root);
	@override late final _StringsAliasGeneratorPtPt aliasGenerator = _StringsAliasGeneratorPtPt._(_root);
	@override late final _StringsDialogsPtPt dialogs = _StringsDialogsPtPt._(_root);
	@override late final _StringsSanitizationPtPt sanitization = _StringsSanitizationPtPt._(_root);
	@override late final _StringsTrayPtPt tray = _StringsTrayPtPt._(_root);
	@override late final _StringsWebPtPt web = _StringsWebPtPt._(_root);
	@override late final _StringsAssetPickerPtPt assetPicker = _StringsAssetPickerPtPt._(_root);
}

// Path: general
class _StringsGeneralPtPt extends _StringsGeneralEn {
	_StringsGeneralPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Aceitar';
	@override String get accepted => 'Aceito';
	@override String get add => 'Adicionar';
	@override String get advanced => 'Avançado';
	@override String get cancel => 'Cancelar';
	@override String get close => 'Fechar';
	@override String get confirm => 'Confirmar';
	@override String get continueStr => 'Continuar';
	@override String get copy => 'Copiar';
	@override String get copiedToClipboard => 'Copiado para a Área de transferência';
	@override String get decline => 'Rejeitar';
	@override String get done => 'Concluído';
	@override String get delete => 'Eliminar';
	@override String get edit => 'Editar';
	@override String get error => 'Erro';
	@override String get example => 'Exemplo';
	@override String get files => 'Ficheiros';
	@override String get finished => 'Terminado';
	@override String get hide => 'Ocultar';
	@override String get off => 'Desativado';
	@override String get offline => 'Offline';
	@override String get on => 'Ativado';
	@override String get online => 'Online';
	@override String get open => 'Abrir';
	@override String get queue => 'Fila';
	@override String get quickSave => 'Guardar rápido';
	@override String get renamed => 'Renomeado';
	@override String get reset => 'Repor';
	@override String get restart => 'Reiniciar';
	@override String get settings => 'Definições';
	@override String get skipped => 'Ignorado';
	@override String get start => 'Iniciar';
	@override String get stop => 'Parar';
	@override String get save => 'Guardar';
	@override String get unchanged => 'Inalterado';
	@override String get unknown => 'Desconhecido';
	@override String get noItemInClipboard => 'Nenhum item na área de transferência.';
}

// Path: receiveTab
class _StringsReceiveTabPtPt extends _StringsReceiveTabEn {
	_StringsReceiveTabPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Receber';
	@override late final _StringsReceiveTabInfoBoxPtPt infoBox = _StringsReceiveTabInfoBoxPtPt._(_root);
}

// Path: sendTab
class _StringsSendTabPtPt extends _StringsSendTabEn {
	_StringsSendTabPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enviar';
	@override late final _StringsSendTabSelectionPtPt selection = _StringsSendTabSelectionPtPt._(_root);
	@override late final _StringsSendTabPickerPtPt picker = _StringsSendTabPickerPtPt._(_root);
	@override String get shareIntentInfo => 'Também pode usar o recurso "Partilhar" do seu dispositivo móvel para selecionar ficheiros com mais facilidade.';
	@override String get nearbyDevices => 'Dispositivos próximos';
	@override String get thisDevice => 'Este dispositivo';
	@override String get scan => 'Procurar dispositivos';
	@override String get sendMode => 'Modo de envio';
	@override late final _StringsSendTabSendModesPtPt sendModes = _StringsSendTabSendModesPtPt._(_root);
	@override String get sendModeHelp => 'Explicação';
	@override String get help => 'Certifique-se de que ambos os dispositivos estejam na mesma rede Wi-Fi.';
	@override String get placeItems => 'Coloque os itens para partilhar.';
}

// Path: settingsTab
class _StringsSettingsTabPtPt extends _StringsSettingsTabEn {
	_StringsSettingsTabPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Definições';
	@override late final _StringsSettingsTabGeneralPtPt general = _StringsSettingsTabGeneralPtPt._(_root);
	@override late final _StringsSettingsTabReceivePtPt receive = _StringsSettingsTabReceivePtPt._(_root);
	@override late final _StringsSettingsTabSendPtPt send = _StringsSettingsTabSendPtPt._(_root);
	@override late final _StringsSettingsTabNetworkPtPt network = _StringsSettingsTabNetworkPtPt._(_root);
	@override late final _StringsSettingsTabOtherPtPt other = _StringsSettingsTabOtherPtPt._(_root);
	@override String get advancedSettings => 'Definições avançadas';
}

// Path: troubleshootPage
class _StringsTroubleshootPagePtPt extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diagnosticar problemas';
	@override String get subTitle => 'Esta aplicação não está a funcionar como esperado? Aqui pode encontrar soluções comuns.';
	@override String get solution => 'Solução:';
	@override String get fixButton => 'Corrigir automaticamente';
	@override late final _StringsTroubleshootPageFirewallPtPt firewall = _StringsTroubleshootPageFirewallPtPt._(_root);
	@override late final _StringsTroubleshootPageNoConnectionPtPt noConnection = _StringsTroubleshootPageNoConnectionPtPt._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPagePtPt extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Histórico';
	@override String get openFolder => 'Abrir pasta';
	@override String get deleteHistory => 'Eliminar histórico';
	@override String get empty => 'O histórico está vazio.';
	@override late final _StringsReceiveHistoryPageEntryActionsPtPt entryActions = _StringsReceiveHistoryPageEntryActionsPtPt._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPagePtPt extends _StringsApkPickerPageEn {
	_StringsApkPickerPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicações (APK)';
	@override String get excludeSystemApps => 'Ocultar aplicações do sistema';
	@override String get excludeAppsWithoutLaunchIntent => 'Ocultar aplicações não executáveis';
	@override String apps({required Object n}) => '${n} Aplicações';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPagePtPt extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Remover tudo';
}

// Path: receivePage
class _StringsReceivePagePtPt extends _StringsReceivePageEn {
	_StringsReceivePagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'quer enviar um ficheiro',
		other: 'quer enviar ${n} ficheiros',
	);
	@override String get subTitleMessage => 'enviou-lhe uma mensagem:';
	@override String get subTitleLink => 'enviou-lhe um link:';
	@override String get canceled => 'O remetente cancelou o pedido.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPagePtPt extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opções';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(pasta LocalSend)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Opção desligada automaticamente pois uma pasta está a ser transferida.';
}

// Path: sendPage
class _StringsSendPagePtPt extends _StringsSendPageEn {
	_StringsSendPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Aguardar resposta...';
	@override String get rejected => 'O destinatário rejeitou o pedido.';
	@override String get busy => 'O destinatário está ocupado com outro pedido de transferência.';
}

// Path: progressPage
class _StringsProgressPagePtPt extends _StringsProgressPageEn {
	_StringsProgressPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'A enviar ficheiros';
	@override String get titleReceiving => 'A receber ficheiros';
	@override String get savedToGallery => 'Guardado na Galeria';
	@override late final _StringsProgressPageTotalPtPt total = _StringsProgressPageTotalPtPt._(_root);
}

// Path: webSharePage
class _StringsWebSharePagePtPt extends _StringsWebSharePageEn {
	_StringsWebSharePagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Partilhe via link';
	@override String get loading => 'A iniciar o servidor...';
	@override String get stopping => 'A parar o servidor...';
	@override String get error => 'Ocorreu um erro enquanto o servidor tentava iniciar.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Abrir este link no navegador:',
		other: 'Abrir um destes links no navegador:',
	);
	@override String get requests => 'Pedidos';
	@override String get noRequests => 'Nenhum pedido ainda.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Aceitar pedidos automaticamente';
	@override String get encryptionHint => 'O LocalSend utiliza um certificado assinado automaticamente. Precisa de aceitá-lo no navegador.';
	@override String pendingRequests({required Object n}) => 'Pedidos pendentes: ${n}';
}

// Path: aboutPage
class _StringsAboutPagePtPt extends _StringsAboutPageEn {
	_StringsAboutPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acerca do LocalSend';
	@override List<String> get description => [
		'O LocalSend é uma aplicação gratuita e de código aberto que permite partilhar ficheiros e mensagens de forma segura com dispositivos próximos através da sua rede local, sem a necessidade de uma ligação à Internet.',
		'Esta aplicação está disponível para Android, iOS, macOS, Windows e Linux. Pode encontrar todas as opções para descarregar na página oficial.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Contribuidores';
	@override String get translators => 'Tradutores';
}

// Path: donationPage
class _StringsDonationPagePtPt extends _StringsDonationPageEn {
	_StringsDonationPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doar';
	@override String get info => 'O LocalSend é um software gratuito, de código aberto e sem qualquer anúncio. Se gosta da aplicação, então considere apoiar o desenvolvimento com um donativo!';
	@override String donate({required Object amount}) => 'Doar ${amount}';
	@override String get thanks => 'Muito obrigado!';
	@override String get restore => 'Restaurar compra';
}

// Path: changelogPage
class _StringsChangelogPagePtPt extends _StringsChangelogPageEn {
	_StringsChangelogPagePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Histórico de alterações';
}

// Path: aliasGenerator
class _StringsAliasGeneratorPtPt extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Adorável',
		'Lindo',
		'Grande',
		'Brilhante',
		'Limpo',
		'Inteligente',
		'Fixe',
		'Giro',
		'Astuto',
		'Determinado',
		'Enérgico',
		'Eficiente',
		'Fantástico',
		'Rápido',
		'Ótimo',
		'Fresco',
		'Bom',
		'Deslumbrante',
		'Bonito',
		'Gentil',
		'Adorável',
		'Místico',
		'Simpático',
		'Paciente',
		'Poderoso',
		'Rico',
		'Secreto',
		'Inteligente',
		'Sólido',
		'Especial',
		'Estratégico',
		'Forte',
		'Interessante',
		'Perspicaz',
		'Reluzente',
		'Vigilante',
		'Arrumado',
		'Sábio',
	];
	@override List<String> get fruits => [
		'Maçã',
		'Abacate',
		'Banana',
		'Mirtilo',
		'Maracujá',
		'Ameixa',
		'Amora',
		'Brócolos',
		'Cenoura',
		'Cereja',
		'Côco',
		'Uva',
		'Limão',
		'Alface',
		'Manga',
		'Melão',
		'Cogumelo',
		'Cebola',
		'Laranja',
		'Papaia',
		'Mamão',
		'Pêssego',
		'Pêra',
		'Ananás',
		'Abacaxi',
		'Batata',
		'Abóbora',
		'Morango',
		'Tomate',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsPtPt extends _StringsDialogsEn {
	_StringsDialogsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFilePtPt addFile = _StringsDialogsAddFilePtPt._(_root);
	@override late final _StringsDialogsAddressInputPtPt addressInput = _StringsDialogsAddressInputPtPt._(_root);
	@override late final _StringsDialogsCancelSessionPtPt cancelSession = _StringsDialogsCancelSessionPtPt._(_root);
	@override late final _StringsDialogsCannotOpenFilePtPt cannotOpenFile = _StringsDialogsCannotOpenFilePtPt._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticePtPt encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticePtPt._(_root);
	@override late final _StringsDialogsErrorDialogPtPt errorDialog = _StringsDialogsErrorDialogPtPt._(_root);
	@override late final _StringsDialogsFavoriteDialogPtPt favoriteDialog = _StringsDialogsFavoriteDialogPtPt._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogPtPt favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogPtPt._(_root);
	@override late final _StringsDialogsFavoriteEditDialogPtPt favoriteEditDialog = _StringsDialogsFavoriteEditDialogPtPt._(_root);
	@override late final _StringsDialogsFileInfoPtPt fileInfo = _StringsDialogsFileInfoPtPt._(_root);
	@override late final _StringsDialogsFileNameInputPtPt fileNameInput = _StringsDialogsFileNameInputPtPt._(_root);
	@override late final _StringsDialogsHistoryClearDialogPtPt historyClearDialog = _StringsDialogsHistoryClearDialogPtPt._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedPtPt localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedPtPt._(_root);
	@override late final _StringsDialogsMessageInputPtPt messageInput = _StringsDialogsMessageInputPtPt._(_root);
	@override late final _StringsDialogsNoFilesPtPt noFiles = _StringsDialogsNoFilesPtPt._(_root);
	@override late final _StringsDialogsNoPermissionPtPt noPermission = _StringsDialogsNoPermissionPtPt._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformPtPt notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformPtPt._(_root);
	@override late final _StringsDialogsQrPtPt qr = _StringsDialogsQrPtPt._(_root);
	@override late final _StringsDialogsQuickActionsPtPt quickActions = _StringsDialogsQuickActionsPtPt._(_root);
	@override late final _StringsDialogsQuickSaveNoticePtPt quickSaveNotice = _StringsDialogsQuickSaveNoticePtPt._(_root);
	@override late final _StringsDialogsSendModeHelpPtPt sendModeHelp = _StringsDialogsSendModeHelpPtPt._(_root);
	@override late final _StringsDialogsZoomPtPt zoom = _StringsDialogsZoomPtPt._(_root);
}

// Path: sanitization
class _StringsSanitizationPtPt extends _StringsSanitizationEn {
	_StringsSanitizationPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'O nome do ficheiro não pode estar em branco';
	@override String get invalid => 'O nome do ficheiro contém caracteres inválidos';
}

// Path: tray
class _StringsTrayPtPt extends _StringsTrayEn {
	_StringsTrayPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Fechar o LocalSend';
}

// Path: web
class _StringsWebPtPt extends _StringsWebEn {
	_StringsWebPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get rejected => 'Ligação rejeitada';
	@override String get files => 'Ficheiros';
	@override String get fileName => 'Nome do ficheiro';
	@override String get size => 'Tamanho';
}

// Path: assetPicker
class _StringsAssetPickerPtPt extends _StringsAssetPickerEn {
	_StringsAssetPickerPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get edit => 'Editar';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Falha ao carregar';
	@override String get original => 'Original';
	@override String get preview => 'Pré-visualização';
	@override String get select => 'Selecionar';
	@override String get emptyList => 'Lista vazia';
	@override String get unSupportedAssetType => 'Este tipo de ficheiro não é suportado.';
	@override String get unableToAccessAll => 'Incapaz de aceder todos os ficheiros do dispositivo';
	@override String get viewingLimitedAssetsTip => 'Apenas visualizar ficheiros e álbuns acessíveis à aplicação.';
	@override String get changeAccessibleLimitedAssets => 'Clique para atualizar os ficheiros acessíveis';
	@override String get accessAllTip => 'A aplicação só pode aceder a alguns ficheiros no dispositivo. Aceda às definições do sistema e permita que a aplicação aceda a todos os ficheiros no dispositivo.';
	@override String get goToSystemSettings => 'Ir para definições do sistema';
	@override String get accessLimitedAssets => 'Continuar com acesso limitado';
	@override String get accessiblePathName => 'Ficheiros acessíveis';
	@override String get sTypeAudioLabel => 'Áudio';
	@override String get sTypeImageLabel => 'Imagem';
	@override String get sTypeVideoLabel => 'Vídeo';
	@override String get sTypeOtherLabel => 'Outros ficheiros';
	@override String get sActionPlayHint => 'reproduzir';
	@override String get sActionPreviewHint => 'pré-visualizar';
	@override String get sActionSelectHint => 'selecionar';
	@override String get sActionSwitchPathLabel => 'mudar a localização';
	@override String get sActionUseCameraHint => 'use a câmara';
	@override String get sNameDurationLabel => 'duração';
	@override String get sUnitAssetCountLabel => 'total';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxPtPt extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Porta:';
	@override String get alias => 'Nome do dispositivo:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionPtPt extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seleção';
	@override String files({required Object files}) => 'Ficheiros: ${files}';
	@override String size({required Object size}) => 'Tamanho: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerPtPt extends _StringsSendTabPickerEn {
	_StringsSendTabPickerPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get file => 'Ficheiro';
	@override String get folder => 'Pasta';
	@override String get media => 'Media';
	@override String get text => 'Texto';
	@override String get app => 'Aplicação';
	@override String get clipboard => 'Colar';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesPtPt extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get single => 'Único destinatário';
	@override String get multiple => 'Vários destinatários';
	@override String get link => 'Partilhar via link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralPtPt extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geral';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsPtPt brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsPtPt._(_root);
	@override String get color => 'Cores';
	@override late final _StringsSettingsTabGeneralColorOptionsPtPt colorOptions = _StringsSettingsTabGeneralColorOptionsPtPt._(_root);
	@override String get language => 'Idioma';
	@override late final _StringsSettingsTabGeneralLanguageOptionsPtPt languageOptions = _StringsSettingsTabGeneralLanguageOptionsPtPt._(_root);
	@override String get saveWindowPlacement => 'Guardar a posição da janela ao fechar';
	@override String get minimizeToTray => 'Minimizar para a área de notificação ao fechar';
	@override String get launchAtStartup => 'Abrir automaticamente após iniciar sessão';
	@override String get launchMinimized => 'Início automático: Abrir minimizado';
	@override String get animations => 'Animações';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceivePtPt extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceivePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recepção';
	@override String get quickSave => _root.general.quickSave;
	@override String get autoFinish => 'Concluir automaticamente';
	@override String get destination => 'Destino';
	@override String get downloads => '(Descargas)';
	@override String get saveToGallery => 'Guardar na galeria';
	@override String get saveToHistory => 'Guardar no histórico';
}

// Path: settingsTab.send
class _StringsSettingsTabSendPtPt extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enviar';
	@override String get shareViaLinkAutoAccept => 'Partilhar via link: Aceitar automaticamente';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkPtPt extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rede';
	@override String get needRestart => 'Reinicie o servidor para aplicar as definições!';
	@override String get server => 'Servidor';
	@override String get alias => 'Nome';
	@override String get deviceType => 'Tipo de dispositivo';
	@override String get deviceModel => 'Modelo do dispositivo';
	@override String get port => 'Porta';
	@override String get discoveryTimeout => 'Tempo limite de deteção';
	@override String portWarning({required Object defaultPort}) => 'Pode estar indetectável para outros dispositivos por estar a usar uma porta personalizada. (Padrão: ${defaultPort})';
	@override String get encryption => 'Encriptação';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Pode estar indetectável para outros dispositivos por estar a usar um endereço multicast personalizado. (Padrão: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherPtPt extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Outros';
	@override String get support => 'Suporte o LocalSend';
	@override String get donate => 'Doar';
	@override String get privacyPolicy => 'Política de Privacidade';
	@override String get termsOfUse => 'Termos de Utilização';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallPtPt extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Esta aplicação pode enviar ficheiros para outros dispositivos, mas outros dispositivos não podem enviar ficheiros para este dispositivo.';
	@override String solution({required Object port}) => 'Provavelmente isto trata-se de um problema da firewall. Pode resolver este problema ao permitir ligações recebidas (UDP e TCP) na porta ${port}.';
	@override String get openFirewall => 'Abrir a Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionPtPt extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ambos os dispositivos não se detectam nem podem partilhar ficheiros entre si.';
	@override String get solution => 'O problema existe em ambos os lados? Então precisa de ter a certeza de que os dispositivos estão na mesma rede Wi-Fi e possuem a mesma configuração (porta, endereço multicast, encriptação). A rede Wi-Fi pode não permitir a comunicação entre os participantes. Neste caso, esta opção deve ser ativada no router.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsPtPt extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get open => 'Abrir ficheiro';
	@override String get info => 'Informação';
	@override String get deleteFromHistory => 'Remover do histórico';
}

// Path: progressPage.total
class _StringsProgressPageTotalPtPt extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitlePtPt title = _StringsProgressPageTotalTitlePtPt._(_root);
	@override String count({required Object curr, required Object n}) => 'Ficheiros: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Tamanho: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFilePtPt extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFilePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adicionar à seleção';
	@override String get content => 'O que quer adicionar?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputPtPt extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite o endereço';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Endereço IP';
	@override String get recentlyUsed => 'Recém ligado: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionPtPt extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cancelar transferência de ficheiros';
	@override String get content => 'Cancelar a transferência de ficheiros?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFilePtPt extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFilePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Não foi possível abrir o ficheiro';
	@override String content({required Object file}) => 'Não foi possível abrir "${file}". O ficheiro foi movido, renomeado ou eliminado?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticePtPt extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Encriptação desativada';
	@override String get content => 'A comunicação agora ocorre via protocolo HTTP não encriptado. Para usar HTTPS, ative a encriptação novamente.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogPtPt extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogPtPt extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get noFavorites => 'Ainda sem favoritos :(';
	@override String get addFavorite => 'Adicionar';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogPtPt extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eliminar favorito';
	@override String content({required Object name}) => 'Eliminar "${name}" dos favoritos?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogPtPt extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Adicionar aos favoritos';
	@override String get titleEdit => 'Editar';
	@override String get name => 'Apelido';
	@override String get auto => '(auto)';
	@override String get ip => 'Endereço IP';
	@override String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoPtPt extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informação do ficheiro';
	@override String get fileName => 'Nome do ficheiro:';
	@override String get path => 'Localização:';
	@override String get size => 'Tamanho:';
	@override String get sender => 'Remetente:';
	@override String get time => 'Data:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputPtPt extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite o nome do ficheiro';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogPtPt extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpar histórico';
	@override String get content => 'Eliminar todo o histórico?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedPtPt extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'O LocalSend não consegue encontrar outros dispositivos sem ter a permissão para analisar a rede local. Conceda esta permissão nas definições.';
	@override String get gotoSettings => 'Definições';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputPtPt extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite a mensagem';
	@override String get multiline => 'Várias linhas';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesPtPt extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nenhum ficheiro selecionado';
	@override String get content => 'Selecione pelo menos um ficheiro.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionPtPt extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sem permissão';
	@override String get content => 'Não concedeu as permissões necessárias. Conceda-as nas definições.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformPtPt extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indisponível';
	@override String get content => 'Esta função está disponível apenas no: ';
}

// Path: dialogs.qr
class _StringsDialogsQrPtPt extends _StringsDialogsQrEn {
	_StringsDialogsQrPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsPtPt extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ações rápidas';
	@override String get counter => 'Contador';
	@override String get prefix => 'Prefixo';
	@override String get padZero => 'Preencher com zeros';
	@override String get sortBeforeCount => 'Ordenar previamente por ordem alfabética';
	@override String get random => 'Aleatório';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticePtPt extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Pedidos de ficheiros são aceites automaticamente. Tenha em atenção que todas as pessoas na rede local podem enviar-lhe ficheiros.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpPtPt extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modos de envio';
	@override String get single => 'Envia ficheiros para um destinatário. A seleção será apagada após a conclusão da transferência dos ficheiros.';
	@override String get multiple => 'Envia ficheiros para vários destinatários. A seleção não será apagada.';
	@override String get link => 'Os destinatários que não têm o LocalSend instalado podem descarregar os ficheiros selecionados abrindo o link fornecido no navegador.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomPtPt extends _StringsDialogsZoomEn {
	_StringsDialogsZoomPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsPtPt extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Escuro';
	@override String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsPtPt extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsPtPt extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsPtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitlePtPt extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitlePtPt._(_StringsPtPt root) : this._root = root, super._(root);

	@override final _StringsPtPt _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progresso total (${time})';
	@override String get finishedError => 'Terminado com erro';
	@override String get canceledSender => 'Cancelado pelo remetente';
	@override String get canceledReceiver => 'Cancelado pelo destinatário';
}
