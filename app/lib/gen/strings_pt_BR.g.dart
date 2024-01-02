part of 'strings.g.dart';

// Path: <root>
class _StringsPtBr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPtBr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsPtBr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Português (Brasil)';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralPtBr general = _StringsGeneralPtBr._(_root);
	@override late final _StringsReceiveTabPtBr receiveTab = _StringsReceiveTabPtBr._(_root);
	@override late final _StringsSendTabPtBr sendTab = _StringsSendTabPtBr._(_root);
	@override late final _StringsSettingsTabPtBr settingsTab = _StringsSettingsTabPtBr._(_root);
	@override late final _StringsTroubleshootPagePtBr troubleshootPage = _StringsTroubleshootPagePtBr._(_root);
	@override late final _StringsReceiveHistoryPagePtBr receiveHistoryPage = _StringsReceiveHistoryPagePtBr._(_root);
	@override late final _StringsApkPickerPagePtBr apkPickerPage = _StringsApkPickerPagePtBr._(_root);
	@override late final _StringsSelectedFilesPagePtBr selectedFilesPage = _StringsSelectedFilesPagePtBr._(_root);
	@override late final _StringsReceivePagePtBr receivePage = _StringsReceivePagePtBr._(_root);
	@override late final _StringsReceiveOptionsPagePtBr receiveOptionsPage = _StringsReceiveOptionsPagePtBr._(_root);
	@override late final _StringsSendPagePtBr sendPage = _StringsSendPagePtBr._(_root);
	@override late final _StringsProgressPagePtBr progressPage = _StringsProgressPagePtBr._(_root);
	@override late final _StringsWebSharePagePtBr webSharePage = _StringsWebSharePagePtBr._(_root);
	@override late final _StringsAboutPagePtBr aboutPage = _StringsAboutPagePtBr._(_root);
	@override late final _StringsDonationPagePtBr donationPage = _StringsDonationPagePtBr._(_root);
	@override late final _StringsChangelogPagePtBr changelogPage = _StringsChangelogPagePtBr._(_root);
	@override late final _StringsAliasGeneratorPtBr aliasGenerator = _StringsAliasGeneratorPtBr._(_root);
	@override late final _StringsDialogsPtBr dialogs = _StringsDialogsPtBr._(_root);
	@override late final _StringsTrayPtBr tray = _StringsTrayPtBr._(_root);
	@override late final _StringsWebPtBr web = _StringsWebPtBr._(_root);
	@override late final _StringsAssetPickerPtBr assetPicker = _StringsAssetPickerPtBr._(_root);
}

// Path: general
class _StringsGeneralPtBr extends _StringsGeneralEn {
	_StringsGeneralPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

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
	@override String get copiedToClipboard => 'Copiado para a Área de Transferência';
	@override String get decline => 'Rejeitar';
	@override String get done => 'Completo';
	@override String get delete => 'Deletar';
	@override String get edit => 'Editar';
	@override String get error => 'Erro';
	@override String get example => 'Exemplo';
	@override String get files => 'Arquivos';
	@override String get finished => 'Concluído';
	@override String get hide => 'Ocultar';
	@override String get off => 'Desabilitado';
	@override String get offline => 'Offline';
	@override String get on => 'Habilitado';
	@override String get online => 'Online';
	@override String get open => 'Abrir';
	@override String get queue => 'Fila';
	@override String get quickSave => 'Salvamento Rápido';
	@override String get renamed => 'Renomeado';
	@override String get reset => 'Redefinir';
	@override String get restart => 'Reiniciar';
	@override String get settings => 'Configurações';
	@override String get skipped => 'Pulado';
	@override String get start => 'Começar';
	@override String get stop => 'Parar';
	@override String get save => 'Salvar';
	@override String get unchanged => 'Inalterado';
	@override String get unknown => 'Desconhecido';
	@override String get noItemInClipboard => 'Não há nada na área de transferência.';
}

// Path: receiveTab
class _StringsReceiveTabPtBr extends _StringsReceiveTabEn {
	_StringsReceiveTabPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Receber';
	@override late final _StringsReceiveTabInfoBoxPtBr infoBox = _StringsReceiveTabInfoBoxPtBr._(_root);
}

// Path: sendTab
class _StringsSendTabPtBr extends _StringsSendTabEn {
	_StringsSendTabPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enviar';
	@override late final _StringsSendTabSelectionPtBr selection = _StringsSendTabSelectionPtBr._(_root);
	@override late final _StringsSendTabPickerPtBr picker = _StringsSendTabPickerPtBr._(_root);
	@override String get shareIntentInfo => 'Você também pode usar o recurso "Compartilhar" do seu dispositivo móvel para selecionar arquivos com mais facilidade.';
	@override String get nearbyDevices => 'Dispositivos próximos';
	@override String get thisDevice => 'Este dispositivo';
	@override String get scan => 'Procurar dispositivos';
	@override String get sendMode => 'Modo de envio';
	@override late final _StringsSendTabSendModesPtBr sendModes = _StringsSendTabSendModesPtBr._(_root);
	@override String get sendModeHelp => 'Explicação';
	@override String get help => 'Por favor, certifique-se de que ambos os dispositivos estejam na mesma rede wifi.';
	@override String get placeItems => 'Coloque os itens para compartilhar.';
}

// Path: settingsTab
class _StringsSettingsTabPtBr extends _StringsSettingsTabEn {
	_StringsSettingsTabPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configurações';
	@override late final _StringsSettingsTabGeneralPtBr general = _StringsSettingsTabGeneralPtBr._(_root);
	@override late final _StringsSettingsTabReceivePtBr receive = _StringsSettingsTabReceivePtBr._(_root);
	@override late final _StringsSettingsTabNetworkPtBr network = _StringsSettingsTabNetworkPtBr._(_root);
	@override late final _StringsSettingsTabOtherPtBr other = _StringsSettingsTabOtherPtBr._(_root);
	@override String get advancedSettings => 'Configurações avançadas';
}

// Path: troubleshootPage
class _StringsTroubleshootPagePtBr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diagnostique problemas';
	@override String get subTitle => 'Este aplicativo não está funcionando como esperado? Aqui você pode encontrar soluções comuns.';
	@override String get solution => 'Solução:';
	@override String get fixButton => 'Consertar automaticamente';
	@override late final _StringsTroubleshootPageFirewallPtBr firewall = _StringsTroubleshootPageFirewallPtBr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionPtBr noConnection = _StringsTroubleshootPageNoConnectionPtBr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPagePtBr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Histórico';
	@override String get openFolder => 'Abrir pasta';
	@override String get deleteHistory => 'Deletar histórico';
	@override String get empty => 'O histórico está vazio.';
	@override late final _StringsReceiveHistoryPageEntryActionsPtBr entryActions = _StringsReceiveHistoryPageEntryActionsPtBr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPagePtBr extends _StringsApkPickerPageEn {
	_StringsApkPickerPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicativos (APK)';
	@override String get excludeSystemApps => 'Ocultar aplicativos do sistema';
	@override String get excludeAppsWithoutLaunchIntent => 'Ocultar aplicativos não executáveis';
	@override String apps({required Object n}) => '${n} Aplicativos';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPagePtBr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Remover tudo';
}

// Path: receivePage
class _StringsReceivePagePtBr extends _StringsReceivePageEn {
	_StringsReceivePagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'quer enviar um arquivo',
		other: 'quer enviar ${n} arquivos',
	);
	@override String get subTitleMessage => 'enviou uma mensagem:';
	@override String get subTitleLink => 'enviou um link:';
	@override String get canceled => 'O remetente cancelou a solicitação.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPagePtBr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opções';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(pasta LocalSend)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Opção desligada automaticamente pois uma pasta está sendo transferida.';
}

// Path: sendPage
class _StringsSendPagePtBr extends _StringsSendPageEn {
	_StringsSendPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Aguardando resposta...';
	@override String get rejected => 'O destinatário rejeitou a solicitação.';
	@override String get busy => 'O destinatário está ocupado com outra solicitação de transferência.';
}

// Path: progressPage
class _StringsProgressPagePtBr extends _StringsProgressPageEn {
	_StringsProgressPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Enviando arquivos';
	@override String get titleReceiving => 'Recebendo arquivos';
	@override String get savedToGallery => 'Salvo na Galeria';
	@override late final _StringsProgressPageTotalPtBr total = _StringsProgressPageTotalPtBr._(_root);
}

// Path: webSharePage
class _StringsWebSharePagePtBr extends _StringsWebSharePageEn {
	_StringsWebSharePagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compartilhe via link';
	@override String get loading => 'Iniciando o servidor...';
	@override String get stopping => 'Parando o servidor...';
	@override String get error => 'Um erro ocorreu enquanto o servidor tentava iniciar.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Abra este link no navegador:',
		other: 'Abra um desses links no navegador:',
	);
	@override String get requests => 'Solicitações';
	@override String get noRequests => 'Nenhuma solicitação ainda.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend utiliza um certificado autoassinado. Você precisa aceitá-lo no navegador.';
	@override String pendingRequests({required Object n}) => 'Solicitações pendentes: ${n}';
}

// Path: aboutPage
class _StringsAboutPagePtBr extends _StringsAboutPageEn {
	_StringsAboutPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobre LocalSend';
	@override List<String> get description => [
		'LocalSend é um aplicativo gratuito e de código aberto que permite compartilhar arquivos e mensagens de forma segura com dispositivos próximos através da sua rede local, sem a necessidade de uma conexão com a internet.',
		'Este aplicativo está disponível para Android, iOS, macOS, Windows e Linux. Você pode encontrar todas as opções de download na página oficial.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Contribuidores';
	@override String get translators => 'Tradutores';
}

// Path: donationPage
class _StringsDonationPagePtBr extends _StringsDonationPageEn {
	_StringsDonationPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doar';
	@override String get info => 'LocalSend é gratuito, de código aberto e sem nenhum anúncio. Se tu curte o app, então considere apoiar o desenvolvimento com uma doação!';
	@override String donate({required Object amount}) => 'Doar ${amount}';
	@override String get thanks => 'Muito obrigado!';
	@override String get restore => 'Restaurar compra';
}

// Path: changelogPage
class _StringsChangelogPagePtBr extends _StringsChangelogPageEn {
	_StringsChangelogPagePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Histórico de alterações';
}

// Path: aliasGenerator
class _StringsAliasGeneratorPtBr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Adorável',
		'Elegante',
		'Grande',
		'Brilhante',
		'Legal',
		'Inteligente',
		'Eficiente',
		'Quente',
		'Gentil',
		'Paciente',
		'Forte',
		'Especial',
		'Carente',
		'Cativante',
		'Deslumbrante',
		'Doce',
		'Experiente',
		'Exigente',
		'Fascinante',
		'Fiel',
		'Genial',
		'Formidável',
		'Humilde',
		'Incrível',
		'Interessante',
		'Perspicaz',
		'Reluzente',
		'Vigilante',
	];
	@override List<String> get fruits => [
		'Maçã',
		'Abacate',
		'Banana',
		'Maracujá',
		'Ameixa',
		'Brócolis',
		'Cenoura',
		'Cereja',
		'Jaca',
		'Uva',
		'Limão',
		'Alface',
		'Manga',
		'Melão',
		'Cogumelo',
		'Cebola',
		'Laranja',
		'Mamão',
		'Pêssego',
		'Pera',
		'Abacaxi',
		'Batata',
		'Abóbora',
		'Pitanga',
		'Morango',
		'Tomate',
	];

	/// In some languages, the adjective must be last.
	@override String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _StringsDialogsPtBr extends _StringsDialogsEn {
	_StringsDialogsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFilePtBr addFile = _StringsDialogsAddFilePtBr._(_root);
	@override late final _StringsDialogsAddressInputPtBr addressInput = _StringsDialogsAddressInputPtBr._(_root);
	@override late final _StringsDialogsCancelSessionPtBr cancelSession = _StringsDialogsCancelSessionPtBr._(_root);
	@override late final _StringsDialogsCannotOpenFilePtBr cannotOpenFile = _StringsDialogsCannotOpenFilePtBr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticePtBr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticePtBr._(_root);
	@override late final _StringsDialogsErrorDialogPtBr errorDialog = _StringsDialogsErrorDialogPtBr._(_root);
	@override late final _StringsDialogsFavoriteDialogPtBr favoriteDialog = _StringsDialogsFavoriteDialogPtBr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogPtBr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogPtBr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogPtBr favoriteEditDialog = _StringsDialogsFavoriteEditDialogPtBr._(_root);
	@override late final _StringsDialogsFileInfoPtBr fileInfo = _StringsDialogsFileInfoPtBr._(_root);
	@override late final _StringsDialogsFileNameInputPtBr fileNameInput = _StringsDialogsFileNameInputPtBr._(_root);
	@override late final _StringsDialogsHistoryClearDialogPtBr historyClearDialog = _StringsDialogsHistoryClearDialogPtBr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedPtBr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedPtBr._(_root);
	@override late final _StringsDialogsMessageInputPtBr messageInput = _StringsDialogsMessageInputPtBr._(_root);
	@override late final _StringsDialogsNoFilesPtBr noFiles = _StringsDialogsNoFilesPtBr._(_root);
	@override late final _StringsDialogsNoPermissionPtBr noPermission = _StringsDialogsNoPermissionPtBr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformPtBr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformPtBr._(_root);
	@override late final _StringsDialogsQrPtBr qr = _StringsDialogsQrPtBr._(_root);
	@override late final _StringsDialogsQuickActionsPtBr quickActions = _StringsDialogsQuickActionsPtBr._(_root);
	@override late final _StringsDialogsQuickSaveNoticePtBr quickSaveNotice = _StringsDialogsQuickSaveNoticePtBr._(_root);
	@override late final _StringsDialogsSendModeHelpPtBr sendModeHelp = _StringsDialogsSendModeHelpPtBr._(_root);
}

// Path: tray
class _StringsTrayPtBr extends _StringsTrayEn {
	_StringsTrayPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Fechar LocalSend';
}

// Path: web
class _StringsWebPtBr extends _StringsWebEn {
	_StringsWebPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Conexão Rejeitada';
	@override String get files => 'Arquivos';
	@override String get fileName => 'Nome do arquivo';
	@override String get size => 'Tamanho';
}

// Path: assetPicker
class _StringsAssetPickerPtBr extends _StringsAssetPickerEn {
	_StringsAssetPickerPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get edit => 'Editar';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Falha ao carregar';
	@override String get original => 'Original';
	@override String get preview => 'Prévia';
	@override String get select => 'Selecionar';
	@override String get emptyList => 'Lista Vazia';
	@override String get unSupportedAssetType => 'Este tipo de arquivo não é suportado.';
	@override String get unableToAccessAll => 'Incapaz de acessar todos os arquivos do dispositivo';
	@override String get viewingLimitedAssetsTip => 'Somente visualizar arquivos e álbuns acessíveis ao aplicativo.';
	@override String get changeAccessibleLimitedAssets => 'Clique para atualizar os arquivos acessíveis';
	@override String get accessAllTip => 'O aplicativo só pode acessar alguns arquivos no dispositivo. Vá às configurações do sistema e permita que o aplicativo acesse todas as mídias do dispositivo.';
	@override String get goToSystemSettings => 'Ir para configurações do sistema';
	@override String get accessLimitedAssets => 'Continuar com acesso limitado';
	@override String get accessiblePathName => 'Arquivos acessíveis';
	@override String get sTypeAudioLabel => 'Áudio';
	@override String get sTypeImageLabel => 'Imagem';
	@override String get sTypeVideoLabel => 'Vídeo';
	@override String get sTypeOtherLabel => 'Outras mídias';
	@override String get sActionPlayHint => 'reproduzir';
	@override String get sActionPreviewHint => 'prévia';
	@override String get sActionSelectHint => 'selecionar';
	@override String get sActionSwitchPathLabel => 'mudar o caminho';
	@override String get sActionUseCameraHint => 'use a câmera';
	@override String get sNameDurationLabel => 'duração';
	@override String get sUnitAssetCountLabel => 'Total';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxPtBr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Porta:';
	@override String get alias => 'Nome:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionPtBr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seleção';
	@override String files({required Object files}) => 'Arquivos: ${files}';
	@override String size({required Object size}) => 'Tamanho: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerPtBr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get file => 'Arquivo';
	@override String get folder => 'Pasta';
	@override String get media => 'Mídia';
	@override String get text => 'Texto';
	@override String get app => 'Aplicativo';
	@override String get clipboard => 'Colar';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesPtBr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get single => 'Único destinatário';
	@override String get multiple => 'Múltiplos destinatários';
	@override String get link => 'Compartilhe via link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralPtBr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geral';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsPtBr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsPtBr._(_root);
	@override String get color => 'Cores';
	@override late final _StringsSettingsTabGeneralColorOptionsPtBr colorOptions = _StringsSettingsTabGeneralColorOptionsPtBr._(_root);
	@override String get language => 'Idioma';
	@override late final _StringsSettingsTabGeneralLanguageOptionsPtBr languageOptions = _StringsSettingsTabGeneralLanguageOptionsPtBr._(_root);
	@override String get saveWindowPlacement => 'Salvar a posição da janela ao fechar';
	@override String get minimizeToTray => 'Minimizar para a bandeja ao fechar';
	@override String get launchAtStartup => 'Abrir automaticamente após o login';
	@override String get launchMinimized => 'Início automático: Abrir minimizado';
	@override String get animations => 'Animações';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceivePtBr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceivePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recebimento';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Concluir Automaticamente';
	@override String get destination => 'Destino';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Salvar mídia na Galeria';
	@override String get saveToHistory => 'Salvar no histórico';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkPtBr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rede';
	@override String get needRestart => 'Reinicie o servidor para aplicar as configurações!';
	@override String get server => 'Servidor';
	@override String get alias => 'Nome';
	@override String get deviceType => 'Tipo de dispositivo';
	@override String get deviceModel => 'Modelo do dispositivo';
	@override String get port => 'Porta';
	@override String portWarning({required Object defaultPort}) => 'Você pode estar indetectável para outros dispositivos por estar usando uma porta customizada. (Padrão: ${defaultPort})';
	@override String get encryption => 'Criptografia';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Você pode estar indetectável para outros dispositivos por estar usando um endereço multicast customizado. (Padrão: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherPtBr extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Outros';
	@override String get support => 'Suporte o LocalSend';
	@override String get donate => 'Doar';
	@override String get privacyPolicy => 'Política de Privacidade';
	@override String get termsOfUse => 'Termos de Uso';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallPtBr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Este aplicativo pode enviar arquivos para outros dispositivos, mas outros dispositivos não podem enviar arquivos para este dispositivo.';
	@override String solution({required Object port}) => 'Provavelmente isto se trata de um problema de firewall. Você pode resolver esse problema permitindo conexões recebidas (UDP e TCP) na porta ${port}.';
	@override String get openFirewall => 'Abrir o Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionPtBr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ambos os dispositivos não se detectam nem podem compartilhar arquivos entre si.';
	@override String get solution => 'O problema existe em ambos os lados? Então você precisa ter certeza de que os dispositivos estão na mesma rede wifi e possuem a mesma configuração (porta, endereço multicast, criptografia). A rede wifi pode não permitir a comunicação entre os participantes. Neste caso, esta opção deve ser habilitada no roteador.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsPtBr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get open => 'Abrir arquivo';
	@override String get info => 'Informações';
	@override String get deleteFromHistory => 'Remover do histórico';
}

// Path: progressPage.total
class _StringsProgressPageTotalPtBr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitlePtBr title = _StringsProgressPageTotalTitlePtBr._(_root);
	@override String count({required Object curr, required Object n}) => 'Arquivos: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Tamanho: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFilePtBr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFilePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adicionar à seleção';
	@override String get content => 'O que você quer adicionar?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputPtBr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite o endereço';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Endereço IP';
	@override String get recentlyUsed => 'Recém conectado: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionPtBr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cancelar transferência de arquivos';
	@override String get content => 'Você realmente quer cancelar a transferência de arquivos?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFilePtBr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFilePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Não foi possível abrir o arquivo';
	@override String content({required Object file}) => 'Não foi possível abrir "${file}". O arquivo foi movido, renomeado ou excluído?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticePtBr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Criptografia desativada';
	@override String get content => 'A comunicação agora ocorre via protocolo HTTP não criptografado. Para usar HTTPS, ative a criptografia novamente.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogPtBr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogPtBr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get noFavorites => 'Sem favoritos ainda :(';
	@override String get addFavorite => 'Adicionar';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogPtBr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deletar favorito';
	@override String content({required Object name}) => 'Você realmente deseja excluir "${name}" dos favoritos?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogPtBr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Adicionar aos favoritos';
	@override String get titleEdit => 'Editar';
	@override String get name => 'Apelido';
	@override String get auto => '(auto)';
	@override String get ip => 'Endereço IP';
	@override String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoPtBr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informação do arquivo';
	@override String get fileName => 'Nome do arquivo:';
	@override String get path => 'Caminho:';
	@override String get size => 'Tamanho:';
	@override String get sender => 'Remetente:';
	@override String get time => 'Data:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputPtBr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite o nome do arquivo';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogPtBr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpar histórico';
	@override String get content => 'Você realmente deseja deletar todo o histórico?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedPtBr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'O LocalSend não consegue encontrar outros dispositivos sem ter a permissão para escanear a rede local. Por favor, conceda esta permissão nas configurações.';
	@override String get gotoSettings => 'Configurações';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputPtBr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Digite a mensagem';
	@override String get multiline => 'Múltiplas linhas';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesPtBr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nenhum arquivo selecionado';
	@override String get content => 'Por favor, selecione ao menos um arquivo.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionPtBr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sem permissão';
	@override String get content => 'Você não concedeu as permissões necessárias. Por favor, conceda-as nas configurações.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformPtBr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indisponível';
	@override String get content => 'Essa função está disponível somente no: ';
}

// Path: dialogs.qr
class _StringsDialogsQrPtBr extends _StringsDialogsQrEn {
	_StringsDialogsQrPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsPtBr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ações Rápidas';
	@override String get counter => 'Contador';
	@override String get prefix => 'Prefixo';
	@override String get padZero => 'Preencher com zeros';
	@override String get sortBeforeCount => 'Ordenar alfabeticamente antes';
	@override String get random => 'Aleatório';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticePtBr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Solicitações de arquivos são aceitas automaticamente. Tenha em mente que qualquer pessoa na rede local pode enviar arquivos para você.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpPtBr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modos de envio';
	@override String get single => 'Envia arquivos para um destinatário. A seleção será apagada após a conclusão da transferência dos arquivos.';
	@override String get multiple => 'Envia arquivos para múltiplos destinatários. A seleção não será apagada.';
	@override String get link => 'Os destinatários que não têm o LocalSend instalado podem baixar os arquivos selecionados abrindo o link fornecido no navegador.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsPtBr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get dark => 'Escuro';
	@override String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsPtBr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsPtBr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitlePtBr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitlePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progresso total (${time})';
	@override String get finishedError => 'Terminado com erro';
	@override String get canceledSender => 'Cancelado pelo remetente';
	@override String get canceledReceiver => 'Cancelado pelo destinatário';
}
