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
class TranslationsPtBr extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPtBr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ptBr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <pt-BR>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsPtBr _root = this; // ignore: unused_field

  @override
  TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Português (Brasil)';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralPtBr general = _TranslationsGeneralPtBr._(_root);
  @override
  late final _TranslationsReceiveTabPtBr receiveTab = _TranslationsReceiveTabPtBr._(_root);
  @override
  late final _TranslationsSendTabPtBr sendTab = _TranslationsSendTabPtBr._(_root);
  @override
  late final _TranslationsSettingsTabPtBr settingsTab = _TranslationsSettingsTabPtBr._(_root);
  @override
  late final _TranslationsTroubleshootPagePtBr troubleshootPage = _TranslationsTroubleshootPagePtBr._(_root);
  @override
  late final _TranslationsReceiveHistoryPagePtBr receiveHistoryPage = _TranslationsReceiveHistoryPagePtBr._(_root);
  @override
  late final _TranslationsApkPickerPagePtBr apkPickerPage = _TranslationsApkPickerPagePtBr._(_root);
  @override
  late final _TranslationsSelectedFilesPagePtBr selectedFilesPage = _TranslationsSelectedFilesPagePtBr._(_root);
  @override
  late final _TranslationsReceivePagePtBr receivePage = _TranslationsReceivePagePtBr._(_root);
  @override
  late final _TranslationsReceiveOptionsPagePtBr receiveOptionsPage = _TranslationsReceiveOptionsPagePtBr._(_root);
  @override
  late final _TranslationsSendPagePtBr sendPage = _TranslationsSendPagePtBr._(_root);
  @override
  late final _TranslationsProgressPagePtBr progressPage = _TranslationsProgressPagePtBr._(_root);
  @override
  late final _TranslationsWebSharePagePtBr webSharePage = _TranslationsWebSharePagePtBr._(_root);
  @override
  late final _TranslationsAboutPagePtBr aboutPage = _TranslationsAboutPagePtBr._(_root);
  @override
  late final _TranslationsDonationPagePtBr donationPage = _TranslationsDonationPagePtBr._(_root);
  @override
  late final _TranslationsChangelogPagePtBr changelogPage = _TranslationsChangelogPagePtBr._(_root);
  @override
  late final _TranslationsAliasGeneratorPtBr aliasGenerator = _TranslationsAliasGeneratorPtBr._(_root);
  @override
  late final _TranslationsDialogsPtBr dialogs = _TranslationsDialogsPtBr._(_root);
  @override
  late final _TranslationsSanitizationPtBr sanitization = _TranslationsSanitizationPtBr._(_root);
  @override
  late final _TranslationsTrayPtBr tray = _TranslationsTrayPtBr._(_root);
  @override
  late final _TranslationsWebPtBr web = _TranslationsWebPtBr._(_root);
  @override
  late final _TranslationsAssetPickerPtBr assetPicker = _TranslationsAssetPickerPtBr._(_root);
  @override
  late final _TranslationsNetworkInterfacesPagePtBr networkInterfacesPage = _TranslationsNetworkInterfacesPagePtBr._(_root);
}

// Path: general
class _TranslationsGeneralPtBr extends TranslationsGeneralEn {
  _TranslationsGeneralPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Aceitar';
  @override
  String get accepted => 'Aceito';
  @override
  String get add => 'Adicionar';
  @override
  String get advanced => 'Avançado';
  @override
  String get cancel => 'Cancelar';
  @override
  String get close => 'Fechar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueStr => 'Continuar';
  @override
  String get copy => 'Copiar';
  @override
  String get copiedToClipboard => 'Copiado pra área de transferência';
  @override
  String get decline => 'Recusar';
  @override
  String get done => 'Pronto';
  @override
  String get delete => 'Apagar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Erro';
  @override
  String get example => 'Exemplo';
  @override
  String get files => 'Arquivos';
  @override
  String get finished => 'Concluído';
  @override
  String get hide => 'Ocultar';
  @override
  String get off => 'Desativado';
  @override
  String get offline => 'Off-line';
  @override
  String get on => 'Ativado';
  @override
  String get online => 'On-line';
  @override
  String get open => 'Abrir';
  @override
  String get queue => 'Fila';
  @override
  String get quickSave => 'Salvar rápido';
  @override
  String get quickSaveFromFavorites => 'Salvar rápido para "Favoritos"';
  @override
  String get renamed => 'Renomeado';
  @override
  String get reset => 'Desfazer alterações';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Configurações';
  @override
  String get skipped => 'Pulado';
  @override
  String get start => 'Iniciar';
  @override
  String get stop => 'Parar';
  @override
  String get save => 'Salvar';
  @override
  String get unchanged => 'Inalterado';
  @override
  String get unknown => 'Desconhecido';
  @override
  String get noItemInClipboard => 'Não há nada na área de transferência.';
}

// Path: receiveTab
class _TranslationsReceiveTabPtBr extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Receber';
  @override
  late final _TranslationsReceiveTabInfoBoxPtBr infoBox = _TranslationsReceiveTabInfoBoxPtBr._(_root);
  @override
  late final _TranslationsReceiveTabQuickSavePtBr quickSave = _TranslationsReceiveTabQuickSavePtBr._(_root);
}

// Path: sendTab
class _TranslationsSendTabPtBr extends TranslationsSendTabEn {
  _TranslationsSendTabPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _TranslationsSendTabSelectionPtBr selection = _TranslationsSendTabSelectionPtBr._(_root);
  @override
  late final _TranslationsSendTabPickerPtBr picker = _TranslationsSendTabPickerPtBr._(_root);
  @override
  String get shareIntentInfo =>
      'Você também pode usar o recurso "Compartilhar" do seu dispositivo móvel para selecionar arquivos com mais facilidade.';
  @override
  String get nearbyDevices => 'Dispositivos por perto';
  @override
  String get thisDevice => 'Este dispositivo';
  @override
  String get scan => 'Procurar dispositivos';
  @override
  String get manualSending => 'Envio manual';
  @override
  String get sendMode => 'Modo de envio';
  @override
  late final _TranslationsSendTabSendModesPtBr sendModes = _TranslationsSendTabSendModesPtBr._(_root);
  @override
  String get sendModeHelp => 'Explicação';
  @override
  String get help => 'Certifique-se de que ambos os dispositivos estão na mesma rede Wi-Fi.';
  @override
  String get placeItems => 'Insira os itens que quer compartilhar.';
}

// Path: settingsTab
class _TranslationsSettingsTabPtBr extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configurações';
  @override
  late final _TranslationsSettingsTabGeneralPtBr general = _TranslationsSettingsTabGeneralPtBr._(_root);
  @override
  late final _TranslationsSettingsTabReceivePtBr receive = _TranslationsSettingsTabReceivePtBr._(_root);
  @override
  late final _TranslationsSettingsTabSendPtBr send = _TranslationsSettingsTabSendPtBr._(_root);
  @override
  late final _TranslationsSettingsTabNetworkPtBr network = _TranslationsSettingsTabNetworkPtBr._(_root);
  @override
  late final _TranslationsSettingsTabOtherPtBr other = _TranslationsSettingsTabOtherPtBr._(_root);
  @override
  String get advancedSettings => 'Configurações avançadas';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPagePtBr extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Resolução de problemas';
  @override
  String get subTitle => 'Este aplicativo não está funcionando como esperado? Aqui você pode encontrar soluções para problemas comuns.';
  @override
  String get solution => 'Solução:';
  @override
  String get fixButton => 'Consertar automaticamente';
  @override
  late final _TranslationsTroubleshootPageFirewallPtBr firewall = _TranslationsTroubleshootPageFirewallPtBr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryPtBr noDiscovery = _TranslationsTroubleshootPageNoDiscoveryPtBr._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionPtBr noConnection = _TranslationsTroubleshootPageNoConnectionPtBr._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPagePtBr extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Histórico';
  @override
  String get openFolder => 'Abrir pasta';
  @override
  String get deleteHistory => 'Apagar histórico';
  @override
  String get empty => 'O histórico está vazio.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsPtBr entryActions = _TranslationsReceiveHistoryPageEntryActionsPtBr._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPagePtBr extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicativos (APK)';
  @override
  String get excludeSystemApps => 'Excluir aplicativos do sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Excluir aplicativos não executáveis';
  @override
  String apps({required Object n}) => '${n} aplicativos';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPagePtBr extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Apagar tudo';
}

// Path: receivePage
class _TranslationsReceivePagePtBr extends TranslationsReceivePageEn {
  _TranslationsReceivePagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
    n,
    one: 'quer te enviar um arquivo',
    other: 'quer te enviar ${n} arquivos',
  );
  @override
  String get subTitleMessage => 'te enviou uma mensagem:';
  @override
  String get subTitleLink => 'te enviou um link:';
  @override
  String get canceled => 'O remetente cancelou a solicitação.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPagePtBr extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opções';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(pasta do LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Desativada automaticamente pois há pastas.';
}

// Path: sendPage
class _TranslationsSendPagePtBr extends TranslationsSendPageEn {
  _TranslationsSendPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Aguardando resposta…';
  @override
  String get rejected => 'O destinatário rejeitou a solicitação.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'O destinatário está ocupado com outra solicitação.';
}

// Path: progressPage
class _TranslationsProgressPagePtBr extends TranslationsProgressPageEn {
  _TranslationsProgressPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Enviando arquivos';
  @override
  String get titleReceiving => 'Recebendo arquivos';
  @override
  String get savedToGallery => 'Salvo na Galeria';
  @override
  late final _TranslationsProgressPageTotalPtBr total = _TranslationsProgressPageTotalPtBr._(_root);
  @override
  late final _TranslationsProgressPageRemainingTimePtBr remainingTime = _TranslationsProgressPageRemainingTimePtBr._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePagePtBr extends TranslationsWebSharePageEn {
  _TranslationsWebSharePagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Compartilhar via link';
  @override
  String get loading => 'Iniciando o servidor…';
  @override
  String get stopping => 'Parando o servidor…';
  @override
  String get error => 'Ocorreu um erro ao iniciar o servidor.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
    n,
    one: 'Abra este link no seu navegador:',
    other: 'Abra um destes links no seu navegador:',
  );
  @override
  String get requests => 'Solicitações';
  @override
  String get noRequests => 'Nenhuma solicitação ainda.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Aceitar solicitações automaticamente';
  @override
  String get requirePin => 'Solicitar PIN';
  @override
  String pinHint({required Object pin}) => 'O PIN é "${pin}"';
  @override
  String get encryptionHint => 'O LocalSend utiliza um certificado autoassinado. Você precisa aceitá-lo no seu navegador.';
  @override
  String pendingRequests({required Object n}) => 'Solicitações pendentes: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPagePtBr extends TranslationsAboutPageEn {
  _TranslationsAboutPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sobre o LocalSend';
  @override
  List<String> get description => [
    'O LocalSend é um aplicativo gratuito, de código aberto, que permite compartilhar arquivos e mensagens com dispositivos próximos através da sua rede local, sem a necessidade de uma conexão à internet.',
    'Este aplicativo está disponível para Android, iOS, macOS, Windows e Linux. Você pode encontrar todas as opções de download na página oficial.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Contribuidores';
  @override
  String get packagers => 'Empacotadores';
  @override
  String get translators => 'Tradutores';
}

// Path: donationPage
class _TranslationsDonationPagePtBr extends TranslationsDonationPageEn {
  _TranslationsDonationPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doe';
  @override
  String get info =>
      'O LocalSend é gratuito, de código aberto e não tem anúncios. Se tu curte o app, então pense em apoiar o desenvolvimento com uma doação.';
  @override
  String donate({required Object amount}) => 'Doar ${amount}';
  @override
  String get thanks => 'Muito obrigado!';
  @override
  String get restore => 'Restaurar compra';
}

// Path: changelogPage
class _TranslationsChangelogPagePtBr extends TranslationsChangelogPageEn {
  _TranslationsChangelogPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registro de alterações';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorPtBr extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
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
  @override
  List<String> get fruits => [
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
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _TranslationsDialogsPtBr extends TranslationsDialogsEn {
  _TranslationsDialogsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFilePtBr addFile = _TranslationsDialogsAddFilePtBr._(_root);
  @override
  late final _TranslationsDialogsOpenFilePtBr openFile = _TranslationsDialogsOpenFilePtBr._(_root);
  @override
  late final _TranslationsDialogsAddressInputPtBr addressInput = _TranslationsDialogsAddressInputPtBr._(_root);
  @override
  late final _TranslationsDialogsCancelSessionPtBr cancelSession = _TranslationsDialogsCancelSessionPtBr._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFilePtBr cannotOpenFile = _TranslationsDialogsCannotOpenFilePtBr._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticePtBr encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticePtBr._(_root);
  @override
  late final _TranslationsDialogsErrorDialogPtBr errorDialog = _TranslationsDialogsErrorDialogPtBr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogPtBr favoriteDialog = _TranslationsDialogsFavoriteDialogPtBr._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogPtBr favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogPtBr._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogPtBr favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogPtBr._(_root);
  @override
  late final _TranslationsDialogsFileInfoPtBr fileInfo = _TranslationsDialogsFileInfoPtBr._(_root);
  @override
  late final _TranslationsDialogsFileNameInputPtBr fileNameInput = _TranslationsDialogsFileNameInputPtBr._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogPtBr historyClearDialog = _TranslationsDialogsHistoryClearDialogPtBr._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedPtBr localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedPtBr._(_root);
  @override
  late final _TranslationsDialogsMessageInputPtBr messageInput = _TranslationsDialogsMessageInputPtBr._(_root);
  @override
  late final _TranslationsDialogsNoFilesPtBr noFiles = _TranslationsDialogsNoFilesPtBr._(_root);
  @override
  late final _TranslationsDialogsNoPermissionPtBr noPermission = _TranslationsDialogsNoPermissionPtBr._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformPtBr notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformPtBr._(_root);
  @override
  late final _TranslationsDialogsQrPtBr qr = _TranslationsDialogsQrPtBr._(_root);
  @override
  late final _TranslationsDialogsQuickActionsPtBr quickActions = _TranslationsDialogsQuickActionsPtBr._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticePtBr quickSaveNotice = _TranslationsDialogsQuickSaveNoticePtBr._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticePtBr quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticePtBr._(_root);
  @override
  late final _TranslationsDialogsPinPtBr pin = _TranslationsDialogsPinPtBr._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpPtBr sendModeHelp = _TranslationsDialogsSendModeHelpPtBr._(_root);
  @override
  late final _TranslationsDialogsZoomPtBr zoom = _TranslationsDialogsZoomPtBr._(_root);
}

// Path: sanitization
class _TranslationsSanitizationPtBr extends TranslationsSanitizationEn {
  _TranslationsSanitizationPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'O nome do arquivo não pode estar vazio';
  @override
  String get invalid => 'O nome do arquivo contém caracteres inválidos';
}

// Path: tray
class _TranslationsTrayPtBr extends TranslationsTrayEn {
  _TranslationsTrayPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Sair do LocalSend';
  @override
  String get closeWindows => 'Sair';
}

// Path: web
class _TranslationsWebPtBr extends TranslationsWebEn {
  _TranslationsWebPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Digite o PIN';
  @override
  String get invalidPin => 'PIN inválido';
  @override
  String get tooManyAttempts => 'Muitas tentativas';
  @override
  String get rejected => 'Recusado';
  @override
  String get files => 'Arquivos';
  @override
  String get fileName => 'Nome do arquivo';
  @override
  String get size => 'Tamanho';
}

// Path: assetPicker
class _TranslationsAssetPickerPtBr extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

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
  String get loadFailed => 'Falha ao carregar';
  @override
  String get original => 'Origem';
  @override
  String get preview => 'Pré-visualização';
  @override
  String get select => 'Selecionar';
  @override
  String get emptyList => 'Lista vazia';
  @override
  String get unSupportedAssetType => 'Não há suporte para o tipo de arquivo.';
  @override
  String get unableToAccessAll => 'Não é possível acessar todos os arquivos do dispositivo';
  @override
  String get viewingLimitedAssetsTip => 'Somente visualizar arquivos e álbuns acessíveis ao aplicativo.';
  @override
  String get changeAccessibleLimitedAssets => 'Clique para atualizar os arquivos acessíveis';
  @override
  String get accessAllTip =>
      'O aplicativo só pode acessar alguns arquivos no dispositivo. Vá às configurações do sistema e permita que o aplicativo acesse todas as mídias do dispositivo.';
  @override
  String get goToSystemSettings => 'Ir pras configurações do sistema';
  @override
  String get accessLimitedAssets => 'Continuar com acesso limitado';
  @override
  String get accessiblePathName => 'Arquivos acessíveis';
  @override
  String get sTypeAudioLabel => 'Áudio';
  @override
  String get sTypeImageLabel => 'Imagem';
  @override
  String get sTypeVideoLabel => 'Vídeo';
  @override
  String get sTypeOtherLabel => 'Outras mídias';
  @override
  String get sActionPlayHint => 'reproduzir';
  @override
  String get sActionPreviewHint => 'pré-visualizar';
  @override
  String get sActionSelectHint => 'selecionar';
  @override
  String get sActionSwitchPathLabel => 'mudar o caminho';
  @override
  String get sActionUseCameraHint => 'usar a câmera';
  @override
  String get sNameDurationLabel => 'duração';
  @override
  String get sUnitAssetCountLabel => 'contagem';
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPagePtBr extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPagePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get whitelist => 'Lista de permissão';
  @override
  String get blacklist => 'Lista de bloqueio';
  @override
  String get info =>
      'Por padrão, o LocalSend utiliza todas as interfaces de rede disponíveis. Você pode excluir as redes indesejadas aqui. É necessário reiniciar o servidor para aplicar as alterações.';
  @override
  String get preview => 'Pré-visualização';
  @override
  String get title => 'Interfaces de rede';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxPtBr extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porta:';
  @override
  String get alias => 'Nome do dispositivo:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSavePtBr extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSavePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoritos';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionPtBr extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seleção';
  @override
  String files({required Object files}) => 'Arquivos: ${files}';
  @override
  String size({required Object size}) => 'Tamanho: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerPtBr extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Arquivo';
  @override
  String get folder => 'Pasta';
  @override
  String get media => 'Mídia';
  @override
  String get text => 'Texto';
  @override
  String get app => 'Aplicativo';
  @override
  String get clipboard => 'Colar';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesPtBr extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Único destinatário';
  @override
  String get multiple => 'Vários destinatários';
  @override
  String get link => 'Compartilhar via link';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralPtBr extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geral';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsPtBr brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsPtBr._(_root);
  @override
  String get color => 'Cores';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsPtBr colorOptions = _TranslationsSettingsTabGeneralColorOptionsPtBr._(_root);
  @override
  String get language => 'Idioma';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsPtBr languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsPtBr._(_root);
  @override
  String get saveWindowPlacement => 'Salvar a posição da janela ao fechar';
  @override
  String get saveWindowPlacementWindows => 'Salvar posição da janela ao sair';
  @override
  String get minimizeToTray => 'Minimizar para a bandeja ao fechar';
  @override
  String get launchAtStartup => 'Abrir junto com o usuário';
  @override
  String get launchMinimized => 'Início automático: Abrir minimizado';
  @override
  String get showInContextMenu => 'Mostrar LocalSend no menu de contexto';
  @override
  String get animations => 'Animações';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceivePtBr extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceivePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recepção';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Concluir automaticamente';
  @override
  String get destination => 'Pasta de destino';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Salvar mídia na galeria';
  @override
  String get saveToHistory => 'Salvar no histórico';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendPtBr extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Envio';
  @override
  String get shareViaLinkAutoAccept => 'Aceitar solicitações por link automaticamente';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkPtBr extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rede';
  @override
  String get needRestart => 'Reinicie o servidor para aplicar as configurações!';
  @override
  String get server => 'Servidor';
  @override
  String get alias => 'Nome do dispositivo';
  @override
  String get deviceType => 'Tipo do dispositivo';
  @override
  String get deviceModel => 'Modelo do dispositivo';
  @override
  String get port => 'Porta';
  @override
  String get discoveryTimeout => 'Tempo limite de descoberta';
  @override
  String get useSystemName => 'Usar nome do sistema';
  @override
  String get generateRandomAlias => 'Gerar apelido aleatório';
  @override
  String portWarning({required Object defaultPort}) =>
      'Você pode estar indetectável para outros dispositivos por estar usando uma porta customizada. (Padrão: ${defaultPort})';
  @override
  String get encryption => 'Criptografia';
  @override
  String get multicastGroup => 'Endereço de multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Você pode estar indetectável para outros dispositivos por estar usando um endereço de multicast customizado. (Padrão: ${defaultMulticast})';
  @override
  String get network => 'Rede';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsPtBr networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsPtBr._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherPtBr extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Outras';
  @override
  String get support => 'Apoiar o LocalSend';
  @override
  String get donate => 'Doar';
  @override
  String get privacyPolicy => 'Política de privacidade';
  @override
  String get termsOfUse => 'Termos de uso';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallPtBr extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Este aplicativo pode enviar arquivos para outros dispositivos, mas outros dispositivos não podem enviar arquivos para este dispositivo.';
  @override
  String solution({required Object port}) =>
      'Provavelmente isto se trata de um problema de firewall. Você pode resolver esse problema permitindo conexões (UDP e TCP) recebidas na porta ${port}.';
  @override
  String get openFirewall => 'Abrir Firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryPtBr extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo não consegue encontrar outros dispositivos.';
  @override
  String get solution =>
      'Certifique-se de que todos os dispositivos estão na mesma rede Wi-Fi e utilizam as mesmas configurações (porta, endereço de multicast, criptografia). Você pode tentar digitar o endereço IP do outro dispositivo manualmente. Se isto funcionar, considere adicionar este dispositivo aos favoritos, assim ele será descoberto automaticamente no futuro.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionPtBr extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos os dispositivos não se encontram nem podem compartilhar arquivos entre si.';
  @override
  String get solution =>
      'O problema acontece em ambos? Então você precisa ter certeza de que os dispositivos estão na mesma rede Wi-Fi e utilizam as mesmas configurações (porta, endereço de multicast, criptografia). A rede Wi-Fi pode não permitir a comunicação entre os participantes devido à isolação de ponto de acesso (AP). Neste caso, esta opção deve ser desativada no roteador.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsPtBr extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Abrir arquivo';
  @override
  String get showInFolder => 'Mostrar na pasta';
  @override
  String get info => 'Informações';
  @override
  String get deleteFromHistory => 'Apagar do histórico';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalPtBr extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitlePtBr title = _TranslationsProgressPageTotalTitlePtBr._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Arquivos: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamanho: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: progressPage.remainingTime
class _TranslationsProgressPageRemainingTimePtBr extends TranslationsProgressPageRemainingTimeEn {
  _TranslationsProgressPageRemainingTimePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Use 'h' para abreviar horas e 'm' para minutos
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Use 'd' para dias, 'h' para horas e 'm' para minutos
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFilePtBr extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adicionar à seleção';
  @override
  String get content => 'O que você quer adicionar?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFilePtBr extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir arquivo';
  @override
  String get content => 'Você quer abrir o arquivo recebido?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputPtBr extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o endereço';
  @override
  String get hashtag => 'Jogo da velha';
  @override
  String get ip => 'Endereço de IP';
  @override
  String get recentlyUsed => 'Usado recentemente: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionPtBr extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar transferência de arquivos';
  @override
  String get content => 'Você quer mesmo cancelar a transferência de arquivos?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFilePtBr extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Não foi possível abrir o arquivo';
  @override
  String content({required Object file}) => 'Não foi possível abrir "${file}". Por acaso, o arquivo foi movido, renomeado ou excluído?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticePtBr extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Criptografia desativada';
  @override
  String get content => 'A comunicação agora ocorre via protocolo HTTP sem criptografia. Para usar o HTTPS, ative a criptografia novamente.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogPtBr extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogPtBr extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoritos';
  @override
  String get noFavorites => 'Nenhum dispositivo favorito ainda.';
  @override
  String get addFavorite => 'Adicionar';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogPtBr extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Apagar dos favoritos';
  @override
  String content({required Object name}) => 'Você quer mesmo apagar "${name}" dos favoritos?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogPtBr extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Adicionar aos favoritos';
  @override
  String get titleEdit => 'Configurações';
  @override
  String get name => 'Nome do dispositivo';
  @override
  String get auto => '(auto.)';
  @override
  String get ip => 'Endereço de IP';
  @override
  String get port => 'Porta';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoPtBr extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informação do arquivo';
  @override
  String get fileName => 'Nome do arquivo:';
  @override
  String get path => 'Caminho:';
  @override
  String get size => 'Tamanho:';
  @override
  String get sender => 'Remetente:';
  @override
  String get time => 'Horário:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputPtBr extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o nome do arquivo';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogPtBr extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Limpar histórico';
  @override
  String get content => 'Você quer mesmo apagar todo o histórico?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedPtBr extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'O LocalSend não consegue encontrar outros dispositivos sem ter a permissão para escanear a rede local. Conceda esta permissão nas configurações.';
  @override
  String get gotoSettings => 'Configurações';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputPtBr extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite a mensagem';
  @override
  String get multiline => 'Várias linhas';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesPtBr extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nenhum arquivo selecionado';
  @override
  String get content => 'Selecione pelo menos um arquivo.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionPtBr extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sem permissão';
  @override
  String get content => 'Você não concedeu as permissões necessárias. Por favor, conceda-as nas configurações.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformPtBr extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Não disponível';
  @override
  String get content => 'Este recurso só está disponível no:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrPtBr extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Código QR';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsPtBr extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ações rápidas';
  @override
  String get counter => 'Contador';
  @override
  String get prefix => 'Prefixo';
  @override
  String get padZero => 'Preencher com zeros';
  @override
  String get sortBeforeCount => 'Ordenar alfabeticamente antes';
  @override
  String get random => 'Aleatório';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticePtBr extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Agora, as solicitações de arquivos são aceitas automaticamente. Tenha em mente que qualquer pessoa na rede local pode enviar arquivos para você.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticePtBr extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Salvar rapidamento dos "Favoritos"';
  @override
  List<String> get content => [
    'Agora, as solicitações de arquivos vindas de dispositivos na sua lista de favoritos são aceitas automaticamente.',
    'Atenção! Atualmente, esta opção não é totalmente segura pois um hacker que saiba a identificação dos seus dispositivos favoritos pode te enviar arquivos sem restrições.',
    'De qualquer forma, esta opção ainda é mais segura que permitir qualquer dispositivo na sua rede local envie arquivos sem restrições.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinPtBr extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpPtBr extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modos de envio';
  @override
  String get single => 'Envia arquivos para um destinatário. A seleção será apagada após a conclusão da transferência dos arquivos.';
  @override
  String get multiple => 'Envia arquivos para vários destinatários. A seleção não será apagada.';
  @override
  String get link =>
      'Os destinatários que não têm o LocalSend instalado podem baixar os arquivos selecionados abrindo o link fornecido no navegador.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomPtBr extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsPtBr extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Escuro';
  @override
  String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsPtBr extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsPtBr extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsPtBr extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todas';
  @override
  String get filtered => 'Filtradas';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitlePtBr extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitlePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progresso total (${time})';
  @override
  String get finishedError => 'Concluiu com erro';
  @override
  String get canceledSender => 'Cancelado pelo remetente';
  @override
  String get canceledReceiver => 'Cancelado pelo destinatário';
}
