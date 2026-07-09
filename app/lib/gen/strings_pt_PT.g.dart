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
class TranslationsPtPt extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPtPt({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ptPt,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <pt-PT>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsPtPt _root = this; // ignore: unused_field

  @override
  TranslationsPtPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtPt(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Português (Portugal)';
  @override
  String get appName => 'LocalSend';
  @override
  late final Translations$general$pt_PT general = Translations$general$pt_PT.internal(_root);
  @override
  late final Translations$receiveTab$pt_PT receiveTab = Translations$receiveTab$pt_PT.internal(_root);
  @override
  late final Translations$sendTab$pt_PT sendTab = Translations$sendTab$pt_PT.internal(_root);
  @override
  late final Translations$settingsTab$pt_PT settingsTab = Translations$settingsTab$pt_PT.internal(_root);
  @override
  late final Translations$troubleshootPage$pt_PT troubleshootPage = Translations$troubleshootPage$pt_PT.internal(_root);
  @override
  late final Translations$receiveHistoryPage$pt_PT receiveHistoryPage = Translations$receiveHistoryPage$pt_PT.internal(_root);
  @override
  late final Translations$apkPickerPage$pt_PT apkPickerPage = Translations$apkPickerPage$pt_PT.internal(_root);
  @override
  late final Translations$selectedFilesPage$pt_PT selectedFilesPage = Translations$selectedFilesPage$pt_PT.internal(_root);
  @override
  late final Translations$receivePage$pt_PT receivePage = Translations$receivePage$pt_PT.internal(_root);
  @override
  late final Translations$receiveOptionsPage$pt_PT receiveOptionsPage = Translations$receiveOptionsPage$pt_PT.internal(_root);
  @override
  late final Translations$sendPage$pt_PT sendPage = Translations$sendPage$pt_PT.internal(_root);
  @override
  late final Translations$progressPage$pt_PT progressPage = Translations$progressPage$pt_PT.internal(_root);
  @override
  late final Translations$webSharePage$pt_PT webSharePage = Translations$webSharePage$pt_PT.internal(_root);
  @override
  late final Translations$aboutPage$pt_PT aboutPage = Translations$aboutPage$pt_PT.internal(_root);
  @override
  late final Translations$donationPage$pt_PT donationPage = Translations$donationPage$pt_PT.internal(_root);
  @override
  late final Translations$changelogPage$pt_PT changelogPage = Translations$changelogPage$pt_PT.internal(_root);
  @override
  late final Translations$aliasGenerator$pt_PT aliasGenerator = Translations$aliasGenerator$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$pt_PT dialogs = Translations$dialogs$pt_PT.internal(_root);
  @override
  late final Translations$sanitization$pt_PT sanitization = Translations$sanitization$pt_PT.internal(_root);
  @override
  late final Translations$tray$pt_PT tray = Translations$tray$pt_PT.internal(_root);
  @override
  late final Translations$web$pt_PT web = Translations$web$pt_PT.internal(_root);
  @override
  late final Translations$assetPicker$pt_PT assetPicker = Translations$assetPicker$pt_PT.internal(_root);
  @override
  late final Translations$networkInterfacesPage$pt_PT networkInterfacesPage = Translations$networkInterfacesPage$pt_PT.internal(_root);
}

// Path: general
class Translations$general$pt_PT extends Translations$general$en {
  Translations$general$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

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
  String get copiedToClipboard => 'Copiado para a Área de transferência';
  @override
  String get decline => 'Rejeitar';
  @override
  String get done => 'Concluído';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Erro';
  @override
  String get example => 'Exemplo';
  @override
  String get files => 'Ficheiros';
  @override
  String get finished => 'Terminado';
  @override
  String get hide => 'Ocultar';
  @override
  String get off => 'Desativado';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Ativado';
  @override
  String get online => 'Online';
  @override
  String get open => 'Abrir';
  @override
  String get queue => 'Fila';
  @override
  String get quickSave => 'Guardar rápido';
  @override
  String get renamed => 'Renomeado';
  @override
  String get reset => 'Repor';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Definições';
  @override
  String get skipped => 'Ignorado';
  @override
  String get start => 'Iniciar';
  @override
  String get stop => 'Parar';
  @override
  String get save => 'Guardar';
  @override
  String get unchanged => 'Inalterado';
  @override
  String get unknown => 'Desconhecido';
  @override
  String get noItemInClipboard => 'Nenhum item na área de transferência.';
  @override
  String get quickSaveFromFavorites => 'Gravar rapidamente dos "Favoritos"';
}

// Path: receiveTab
class Translations$receiveTab$pt_PT extends Translations$receiveTab$en {
  Translations$receiveTab$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Receber';
  @override
  late final Translations$receiveTab$infoBox$pt_PT infoBox = Translations$receiveTab$infoBox$pt_PT.internal(_root);
  @override
  late final Translations$receiveTab$quickSave$pt_PT quickSave = Translations$receiveTab$quickSave$pt_PT.internal(_root);
}

// Path: sendTab
class Translations$sendTab$pt_PT extends Translations$sendTab$en {
  Translations$sendTab$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final Translations$sendTab$selection$pt_PT selection = Translations$sendTab$selection$pt_PT.internal(_root);
  @override
  late final Translations$sendTab$picker$pt_PT picker = Translations$sendTab$picker$pt_PT.internal(_root);
  @override
  String get shareIntentInfo => 'Também pode usar o recurso "Partilhar" do seu dispositivo móvel para selecionar ficheiros com mais facilidade.';
  @override
  String get nearbyDevices => 'Dispositivos próximos';
  @override
  String get thisDevice => 'Este dispositivo';
  @override
  String get scan => 'Procurar dispositivos';
  @override
  String get sendMode => 'Modo de envio';
  @override
  late final Translations$sendTab$sendModes$pt_PT sendModes = Translations$sendTab$sendModes$pt_PT.internal(_root);
  @override
  String get sendModeHelp => 'Explicação';
  @override
  String get help => 'Certifique-se de que ambos os dispositivos estejam na mesma rede Wi-Fi.';
  @override
  String get placeItems => 'Coloque os itens para partilhar.';
  @override
  String get manualSending => 'Envio manual';
}

// Path: settingsTab
class Translations$settingsTab$pt_PT extends Translations$settingsTab$en {
  Translations$settingsTab$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Definições';
  @override
  late final Translations$settingsTab$general$pt_PT general = Translations$settingsTab$general$pt_PT.internal(_root);
  @override
  late final Translations$settingsTab$receive$pt_PT receive = Translations$settingsTab$receive$pt_PT.internal(_root);
  @override
  late final Translations$settingsTab$send$pt_PT send = Translations$settingsTab$send$pt_PT.internal(_root);
  @override
  late final Translations$settingsTab$network$pt_PT network = Translations$settingsTab$network$pt_PT.internal(_root);
  @override
  late final Translations$settingsTab$other$pt_PT other = Translations$settingsTab$other$pt_PT.internal(_root);
  @override
  String get advancedSettings => 'Definições avançadas';
}

// Path: troubleshootPage
class Translations$troubleshootPage$pt_PT extends Translations$troubleshootPage$en {
  Translations$troubleshootPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Diagnosticar problemas';
  @override
  String get subTitle => 'Esta aplicação não está a funcionar como esperado? Aqui pode encontrar soluções comuns.';
  @override
  String get solution => 'Solução:';
  @override
  String get fixButton => 'Corrigir automaticamente';
  @override
  late final Translations$troubleshootPage$firewall$pt_PT firewall = Translations$troubleshootPage$firewall$pt_PT.internal(_root);
  @override
  late final Translations$troubleshootPage$noConnection$pt_PT noConnection = Translations$troubleshootPage$noConnection$pt_PT.internal(_root);
  @override
  late final Translations$troubleshootPage$noDiscovery$pt_PT noDiscovery = Translations$troubleshootPage$noDiscovery$pt_PT.internal(_root);
}

// Path: receiveHistoryPage
class Translations$receiveHistoryPage$pt_PT extends Translations$receiveHistoryPage$en {
  Translations$receiveHistoryPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Histórico';
  @override
  String get openFolder => 'Abrir pasta';
  @override
  String get deleteHistory => 'Eliminar histórico';
  @override
  String get empty => 'O histórico está vazio.';
  @override
  late final Translations$receiveHistoryPage$entryActions$pt_PT entryActions = Translations$receiveHistoryPage$entryActions$pt_PT.internal(_root);
}

// Path: apkPickerPage
class Translations$apkPickerPage$pt_PT extends Translations$apkPickerPage$en {
  Translations$apkPickerPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicações (APK)';
  @override
  String get excludeSystemApps => 'Ocultar aplicações do sistema';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Ocultar aplicações não executáveis';
  @override
  String apps({required Object n}) => '${n} Aplicações';
}

// Path: selectedFilesPage
class Translations$selectedFilesPage$pt_PT extends Translations$selectedFilesPage$en {
  Translations$selectedFilesPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Remover tudo';
}

// Path: receivePage
class Translations$receivePage$pt_PT extends Translations$receivePage$en {
  Translations$receivePage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
    n,
    one: 'quer enviar um ficheiro',
    other: 'quer enviar ${n} ficheiros',
  );
  @override
  String get subTitleMessage => 'enviou-lhe uma mensagem:';
  @override
  String get subTitleLink => 'enviou-lhe um link:';
  @override
  String get canceled => 'O remetente cancelou o pedido.';
}

// Path: receiveOptionsPage
class Translations$receiveOptionsPage$pt_PT extends Translations$receiveOptionsPage$en {
  Translations$receiveOptionsPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opções';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(pasta LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Opção desligada automaticamente pois uma pasta está a ser transferida.';
}

// Path: sendPage
class Translations$sendPage$pt_PT extends Translations$sendPage$en {
  Translations$sendPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'A aguardar resposta…';
  @override
  String get rejected => 'O destinatário rejeitou o pedido.';
  @override
  String get busy => 'O destinatário está ocupado com outro pedido de transferência.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
}

// Path: progressPage
class Translations$progressPage$pt_PT extends Translations$progressPage$en {
  Translations$progressPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'A enviar ficheiros';
  @override
  String get titleReceiving => 'A receber ficheiros';
  @override
  String get savedToGallery => 'Guardado na Galeria';
  @override
  late final Translations$progressPage$total$pt_PT total = Translations$progressPage$total$pt_PT.internal(_root);
  @override
  late final Translations$progressPage$remainingTime$pt_PT remainingTime = Translations$progressPage$remainingTime$pt_PT.internal(_root);
}

// Path: webSharePage
class Translations$webSharePage$pt_PT extends Translations$webSharePage$en {
  Translations$webSharePage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Partilhe via link';
  @override
  String get loading => 'A iniciar o servidor…';
  @override
  String get stopping => 'A parar o servidor…';
  @override
  String get error => 'Ocorreu um erro enquanto o servidor tentava iniciar.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
    n,
    one: 'Abrir este link no navegador:',
    other: 'Abrir um destes links no navegador:',
  );
  @override
  String get requests => 'Pedidos';
  @override
  String get noRequests => 'Nenhum pedido ainda.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Aceitar pedidos automaticamente';
  @override
  String get encryptionHint => 'O LocalSend utiliza um certificado assinado automaticamente. Precisa de aceitá-lo no navegador.';
  @override
  String pendingRequests({required Object n}) => 'Pedidos pendentes: ${n}';
  @override
  String get requirePin => 'Solicitar PIN';
  @override
  String pinHint({required Object pin}) => 'O PIN é "${pin}"';
}

// Path: aboutPage
class Translations$aboutPage$pt_PT extends Translations$aboutPage$en {
  Translations$aboutPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Acerca do LocalSend';
  @override
  List<String> get description => [
    'O LocalSend é uma aplicação gratuita e de código aberto que permite partilhar ficheiros e mensagens de forma segura com dispositivos próximos através da sua rede local, sem a necessidade de uma ligação à Internet.',
    'Esta aplicação está disponível para Android, iOS, macOS, Windows e Linux. Pode encontrar todas as opções para descarregar na página oficial.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Contribuidores';
  @override
  String get translators => 'Tradutores';
  @override
  String get packagers => 'Empacotadores';
}

// Path: donationPage
class Translations$donationPage$pt_PT extends Translations$donationPage$en {
  Translations$donationPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doar';
  @override
  String get info =>
      'O LocalSend é um software gratuito, de código aberto e sem qualquer anúncio. Se gosta da aplicação, considere apoiar o desenvolvimento com um donativo.';
  @override
  String donate({required Object amount}) => 'Doar ${amount}';
  @override
  String get thanks => 'Muito obrigado!';
  @override
  String get restore => 'Restaurar compra';
}

// Path: changelogPage
class Translations$changelogPage$pt_PT extends Translations$changelogPage$en {
  Translations$changelogPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Histórico de alterações';
}

// Path: aliasGenerator
class Translations$aliasGenerator$pt_PT extends Translations$aliasGenerator$en {
  Translations$aliasGenerator$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
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
  @override
  List<String> get fruits => [
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
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class Translations$dialogs$pt_PT extends Translations$dialogs$en {
  Translations$dialogs$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$dialogs$addFile$pt_PT addFile = Translations$dialogs$addFile$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$addressInput$pt_PT addressInput = Translations$dialogs$addressInput$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$cancelSession$pt_PT cancelSession = Translations$dialogs$cancelSession$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$cannotOpenFile$pt_PT cannotOpenFile = Translations$dialogs$cannotOpenFile$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$encryptionDisabledNotice$pt_PT encryptionDisabledNotice =
      Translations$dialogs$encryptionDisabledNotice$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$errorDialog$pt_PT errorDialog = Translations$dialogs$errorDialog$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$favoriteDialog$pt_PT favoriteDialog = Translations$dialogs$favoriteDialog$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$favoriteDeleteDialog$pt_PT favoriteDeleteDialog = Translations$dialogs$favoriteDeleteDialog$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$favoriteEditDialog$pt_PT favoriteEditDialog = Translations$dialogs$favoriteEditDialog$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$fileInfo$pt_PT fileInfo = Translations$dialogs$fileInfo$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$fileNameInput$pt_PT fileNameInput = Translations$dialogs$fileNameInput$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$historyClearDialog$pt_PT historyClearDialog = Translations$dialogs$historyClearDialog$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$localNetworkUnauthorized$pt_PT localNetworkUnauthorized =
      Translations$dialogs$localNetworkUnauthorized$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$messageInput$pt_PT messageInput = Translations$dialogs$messageInput$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$noFiles$pt_PT noFiles = Translations$dialogs$noFiles$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$noPermission$pt_PT noPermission = Translations$dialogs$noPermission$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$notAvailableOnPlatform$pt_PT notAvailableOnPlatform = Translations$dialogs$notAvailableOnPlatform$pt_PT.internal(
    _root,
  );
  @override
  late final Translations$dialogs$qr$pt_PT qr = Translations$dialogs$qr$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$quickActions$pt_PT quickActions = Translations$dialogs$quickActions$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$quickSaveNotice$pt_PT quickSaveNotice = Translations$dialogs$quickSaveNotice$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$sendModeHelp$pt_PT sendModeHelp = Translations$dialogs$sendModeHelp$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$zoom$pt_PT zoom = Translations$dialogs$zoom$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$quickSaveFromFavoritesNotice$pt_PT quickSaveFromFavoritesNotice =
      Translations$dialogs$quickSaveFromFavoritesNotice$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$openFile$pt_PT openFile = Translations$dialogs$openFile$pt_PT.internal(_root);
  @override
  late final Translations$dialogs$pin$pt_PT pin = Translations$dialogs$pin$pt_PT.internal(_root);
}

// Path: sanitization
class Translations$sanitization$pt_PT extends Translations$sanitization$en {
  Translations$sanitization$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'O nome do ficheiro não pode estar em branco';
  @override
  String get invalid => 'O nome do ficheiro contém caracteres inválidos';
}

// Path: tray
class Translations$tray$pt_PT extends Translations$tray$en {
  Translations$tray$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Fechar o LocalSend';
  @override
  String get closeWindows => 'Sair';
}

// Path: web
class Translations$web$pt_PT extends Translations$web$en {
  Translations$web$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get rejected => 'Ligação rejeitada';
  @override
  String get files => 'Ficheiros';
  @override
  String get fileName => 'Nome do ficheiro';
  @override
  String get size => 'Tamanho';
  @override
  String get enterPin => 'Digite o PIN';
  @override
  String get invalidPin => 'PIN inválido';
  @override
  String get tooManyAttempts => 'Muitas tentativas';
}

// Path: assetPicker
class Translations$assetPicker$pt_PT extends Translations$assetPicker$en {
  Translations$assetPicker$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

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
  String get original => 'Original';
  @override
  String get preview => 'Pré-visualização';
  @override
  String get select => 'Selecionar';
  @override
  String get emptyList => 'Lista vazia';
  @override
  String get unSupportedAssetType => 'Este tipo de ficheiro não é suportado.';
  @override
  String get unableToAccessAll => 'Incapaz de aceder todos os ficheiros do dispositivo';
  @override
  String get viewingLimitedAssetsTip => 'Apenas visualizar ficheiros e álbuns acessíveis à aplicação.';
  @override
  String get changeAccessibleLimitedAssets => 'Clique para atualizar os ficheiros acessíveis';
  @override
  String get accessAllTip =>
      'A aplicação só pode aceder a alguns ficheiros no dispositivo. Aceda às definições do sistema e permita que a aplicação aceda a todos os ficheiros no dispositivo.';
  @override
  String get goToSystemSettings => 'Ir para definições do sistema';
  @override
  String get accessLimitedAssets => 'Continuar com acesso limitado';
  @override
  String get accessiblePathName => 'Ficheiros acessíveis';
  @override
  String get sTypeAudioLabel => 'Áudio';
  @override
  String get sTypeImageLabel => 'Imagem';
  @override
  String get sTypeVideoLabel => 'Vídeo';
  @override
  String get sTypeOtherLabel => 'Outros ficheiros';
  @override
  String get sActionPlayHint => 'reproduzir';
  @override
  String get sActionPreviewHint => 'pré-visualizar';
  @override
  String get sActionSelectHint => 'selecionar';
  @override
  String get sActionSwitchPathLabel => 'mudar a localização';
  @override
  String get sActionUseCameraHint => 'use a câmara';
  @override
  String get sNameDurationLabel => 'duração';
  @override
  String get sUnitAssetCountLabel => 'total';
}

// Path: networkInterfacesPage
class Translations$networkInterfacesPage$pt_PT extends Translations$networkInterfacesPage$en {
  Translations$networkInterfacesPage$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfaces de rede';
  @override
  String get info =>
      'Por padrão, o LocalSend utiliza todas as interfaces de rede disponíveis. Pode excluir as redes indesejadas aqui. É necessário reiniciar o servidor para aplicar as alterações.';
  @override
  String get preview => 'Anterior';
  @override
  String get whitelist => 'Lista branca';
  @override
  String get blacklist => 'Lista negra';
}

// Path: receiveTab.infoBox
class Translations$receiveTab$infoBox$pt_PT extends Translations$receiveTab$infoBox$en {
  Translations$receiveTab$infoBox$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porta:';
  @override
  String get alias => 'Nome do dispositivo:';
}

// Path: receiveTab.quickSave
class Translations$receiveTab$quickSave$pt_PT extends Translations$receiveTab$quickSave$en {
  Translations$receiveTab$quickSave$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoritos';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class Translations$sendTab$selection$pt_PT extends Translations$sendTab$selection$en {
  Translations$sendTab$selection$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seleção';
  @override
  String files({required Object files}) => 'Ficheiros: ${files}';
  @override
  String size({required Object size}) => 'Tamanho: ${size}';
}

// Path: sendTab.picker
class Translations$sendTab$picker$pt_PT extends Translations$sendTab$picker$en {
  Translations$sendTab$picker$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Ficheiro';
  @override
  String get folder => 'Pasta';
  @override
  String get media => 'Media';
  @override
  String get text => 'Texto';
  @override
  String get app => 'Aplicação';
  @override
  String get clipboard => 'Colar';
}

// Path: sendTab.sendModes
class Translations$sendTab$sendModes$pt_PT extends Translations$sendTab$sendModes$en {
  Translations$sendTab$sendModes$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Único destinatário';
  @override
  String get multiple => 'Vários destinatários';
  @override
  String get link => 'Partilhar via link';
}

// Path: settingsTab.general
class Translations$settingsTab$general$pt_PT extends Translations$settingsTab$general$en {
  Translations$settingsTab$general$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geral';
  @override
  String get brightness => 'Tema';
  @override
  late final Translations$settingsTab$general$brightnessOptions$pt_PT brightnessOptions =
      Translations$settingsTab$general$brightnessOptions$pt_PT.internal(_root);
  @override
  String get color => 'Cores';
  @override
  late final Translations$settingsTab$general$colorOptions$pt_PT colorOptions = Translations$settingsTab$general$colorOptions$pt_PT.internal(_root);
  @override
  String get language => 'Idioma';
  @override
  late final Translations$settingsTab$general$languageOptions$pt_PT languageOptions = Translations$settingsTab$general$languageOptions$pt_PT.internal(
    _root,
  );
  @override
  String get saveWindowPlacement => 'Guardar a posição da janela ao fechar';
  @override
  String get minimizeToTray => 'Minimizar para a área de notificação ao fechar';
  @override
  String get launchAtStartup => 'Abrir automaticamente após iniciar sessão';
  @override
  String get launchMinimized => 'Início automático: Abrir minimizado';
  @override
  String get animations => 'Animações';
  @override
  String get saveWindowPlacementWindows => 'Gravar posição da janela ao sair';
  @override
  String get showInContextMenu => 'Mostrar LocalSend no menu de contexto';
}

// Path: settingsTab.receive
class Translations$settingsTab$receive$pt_PT extends Translations$settingsTab$receive$en {
  Translations$settingsTab$receive$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recepção';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get autoFinish => 'Concluir automaticamente';
  @override
  String get destination => 'Destino';
  @override
  String get downloads => '(Descargas)';
  @override
  String get saveToGallery => 'Guardar na galeria';
  @override
  String get saveToHistory => 'Guardar no histórico';
  @override
  String get quickSaveFromFavorites => 'Gravar rapidamente dos "Favoritos"';
  @override
  String get requirePin => _root.webSharePage.requirePin;
}

// Path: settingsTab.send
class Translations$settingsTab$send$pt_PT extends Translations$settingsTab$send$en {
  Translations$settingsTab$send$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  String get shareViaLinkAutoAccept => 'Partilhar via link: Aceitar automaticamente';
}

// Path: settingsTab.network
class Translations$settingsTab$network$pt_PT extends Translations$settingsTab$network$en {
  Translations$settingsTab$network$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rede';
  @override
  String get needRestart => 'Reinicie o servidor para aplicar as definições!';
  @override
  String get server => 'Servidor';
  @override
  String get alias => 'Nome do dispositivo';
  @override
  String get deviceType => 'Tipo de dispositivo';
  @override
  String get deviceModel => 'Modelo do dispositivo';
  @override
  String get port => 'Porta';
  @override
  String get discoveryTimeout => 'Tempo limite de deteção';
  @override
  String portWarning({required Object defaultPort}) =>
      'Pode estar indetectável para outros dispositivos por estar a usar uma porta personalizada. (Padrão: ${defaultPort})';
  @override
  String get encryption => 'Encriptação';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Pode estar indetectável para outros dispositivos por estar a usar um endereço multicast personalizado. (Padrão: ${defaultMulticast})';
  @override
  String get generateRandomAlias => 'Gerar apelido aleatório';
  @override
  String get network => 'Rede';
  @override
  late final Translations$settingsTab$network$networkOptions$pt_PT networkOptions = Translations$settingsTab$network$networkOptions$pt_PT.internal(
    _root,
  );
  @override
  String get useSystemName => 'Usar nome do sistema';
}

// Path: settingsTab.other
class Translations$settingsTab$other$pt_PT extends Translations$settingsTab$other$en {
  Translations$settingsTab$other$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Outros';
  @override
  String get support => 'Suporte o LocalSend';
  @override
  String get donate => 'Doar';
  @override
  String get privacyPolicy => 'Política de Privacidade';
  @override
  String get termsOfUse => 'Termos de Utilização';
}

// Path: troubleshootPage.firewall
class Translations$troubleshootPage$firewall$pt_PT extends Translations$troubleshootPage$firewall$en {
  Translations$troubleshootPage$firewall$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Esta aplicação pode enviar ficheiros para outros dispositivos, mas outros dispositivos não podem enviar ficheiros para este dispositivo.';
  @override
  String solution({required Object port}) =>
      'Provavelmente isto trata-se de um problema da firewall. Pode resolver este problema ao permitir ligações recebidas (UDP e TCP) na porta ${port}.';
  @override
  String get openFirewall => 'Abrir a Firewall';
}

// Path: troubleshootPage.noConnection
class Translations$troubleshootPage$noConnection$pt_PT extends Translations$troubleshootPage$noConnection$en {
  Translations$troubleshootPage$noConnection$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambos os dispositivos não se detectam nem podem partilhar ficheiros entre si.';
  @override
  String get solution =>
      'O problema existe em ambos os lados? Então precisa de ter a certeza de que os dispositivos estão na mesma rede Wi-Fi e possuem a mesma configuração (porta, endereço multicast, encriptação). A rede Wi-Fi pode não permitir a comunicação entre os participantes. Neste caso, esta opção deve ser ativada no router.';
}

// Path: troubleshootPage.noDiscovery
class Translations$troubleshootPage$noDiscovery$pt_PT extends Translations$troubleshootPage$noDiscovery$en {
  Translations$troubleshootPage$noDiscovery$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Este dispositivo não consegue descobrir outros dispositivos.';
  @override
  String get solution =>
      'Certifique-se de que todos os dispositivos estão na mesma rede Wi-Fi e partilham as mesmas configurações (porta, endereço multicast, criptografia). Pode tentar digitar o endereço IP do dispositivo de destino manualmente. Se isto funcionar, considere adicionar este dispositivo aos favoritos, assim ele será descoberto automaticamente no futuro.';
}

// Path: receiveHistoryPage.entryActions
class Translations$receiveHistoryPage$entryActions$pt_PT extends Translations$receiveHistoryPage$entryActions$en {
  Translations$receiveHistoryPage$entryActions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Abrir ficheiro';
  @override
  String get info => 'Informação';
  @override
  String get deleteFromHistory => 'Remover do histórico';
  @override
  String get showInFolder => 'Mostrar na pasta';
}

// Path: progressPage.total
class Translations$progressPage$total$pt_PT extends Translations$progressPage$total$en {
  Translations$progressPage$total$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$progressPage$total$title$pt_PT title = Translations$progressPage$total$title$pt_PT.internal(_root);
  @override
  String count({required Object curr, required Object n}) => 'Ficheiros: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamanho: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Velocidade: ${speed}/s';
}

// Path: progressPage.remainingTime
class Translations$progressPage$remainingTime$pt_PT extends Translations$progressPage$remainingTime$en {
  Translations$progressPage$remainingTime$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Usar 'h' e 'm' para abreviar as palavras horas e minutos
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Usar 'd' para dias, 'h' para horas e 'm' para minutos
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class Translations$dialogs$addFile$pt_PT extends Translations$dialogs$addFile$en {
  Translations$dialogs$addFile$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adicionar à seleção';
  @override
  String get content => 'O que quer adicionar?';
}

// Path: dialogs.addressInput
class Translations$dialogs$addressInput$pt_PT extends Translations$dialogs$addressInput$en {
  Translations$dialogs$addressInput$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o endereço';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Endereço IP';
  @override
  String get recentlyUsed => 'Recém ligado: ';
}

// Path: dialogs.cancelSession
class Translations$dialogs$cancelSession$pt_PT extends Translations$dialogs$cancelSession$en {
  Translations$dialogs$cancelSession$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cancelar transferência de ficheiros';
  @override
  String get content => 'Cancelar a transferência de ficheiros?';
}

// Path: dialogs.cannotOpenFile
class Translations$dialogs$cannotOpenFile$pt_PT extends Translations$dialogs$cannotOpenFile$en {
  Translations$dialogs$cannotOpenFile$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Não foi possível abrir o ficheiro';
  @override
  String content({required Object file}) => 'Não foi possível abrir "${file}". O ficheiro foi movido, renomeado ou eliminado?';
}

// Path: dialogs.encryptionDisabledNotice
class Translations$dialogs$encryptionDisabledNotice$pt_PT extends Translations$dialogs$encryptionDisabledNotice$en {
  Translations$dialogs$encryptionDisabledNotice$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Encriptação desativada';
  @override
  String get content => 'A comunicação agora ocorre via protocolo HTTP não encriptado. Para usar HTTPS, ative a encriptação novamente.';
}

// Path: dialogs.errorDialog
class Translations$dialogs$errorDialog$pt_PT extends Translations$dialogs$errorDialog$en {
  Translations$dialogs$errorDialog$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class Translations$dialogs$favoriteDialog$pt_PT extends Translations$dialogs$favoriteDialog$en {
  Translations$dialogs$favoriteDialog$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoritos';
  @override
  String get noFavorites => 'Ainda não tem dispositivos favoritos.';
  @override
  String get addFavorite => 'Adicionar';
}

// Path: dialogs.favoriteDeleteDialog
class Translations$dialogs$favoriteDeleteDialog$pt_PT extends Translations$dialogs$favoriteDeleteDialog$en {
  Translations$dialogs$favoriteDeleteDialog$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eliminar favorito';
  @override
  String content({required Object name}) => 'Eliminar "${name}" dos favoritos?';
}

// Path: dialogs.favoriteEditDialog
class Translations$dialogs$favoriteEditDialog$pt_PT extends Translations$dialogs$favoriteEditDialog$en {
  Translations$dialogs$favoriteEditDialog$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Adicionar aos favoritos';
  @override
  String get titleEdit => 'Editar';
  @override
  String get name => 'Nome do dispositivo';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Endereço IP';
  @override
  String get port => 'Porta';
}

// Path: dialogs.fileInfo
class Translations$dialogs$fileInfo$pt_PT extends Translations$dialogs$fileInfo$en {
  Translations$dialogs$fileInfo$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informação do ficheiro';
  @override
  String get fileName => 'Nome do ficheiro:';
  @override
  String get path => 'Localização:';
  @override
  String get size => 'Tamanho:';
  @override
  String get sender => 'Remetente:';
  @override
  String get time => 'Data:';
}

// Path: dialogs.fileNameInput
class Translations$dialogs$fileNameInput$pt_PT extends Translations$dialogs$fileNameInput$en {
  Translations$dialogs$fileNameInput$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o nome do ficheiro';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class Translations$dialogs$historyClearDialog$pt_PT extends Translations$dialogs$historyClearDialog$en {
  Translations$dialogs$historyClearDialog$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Limpar histórico';
  @override
  String get content => 'Eliminar todo o histórico?';
}

// Path: dialogs.localNetworkUnauthorized
class Translations$dialogs$localNetworkUnauthorized$pt_PT extends Translations$dialogs$localNetworkUnauthorized$en {
  Translations$dialogs$localNetworkUnauthorized$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'O LocalSend não consegue encontrar outros dispositivos sem ter a permissão para analisar a rede local. Conceda esta permissão nas definições.';
  @override
  String get gotoSettings => 'Definições';
}

// Path: dialogs.messageInput
class Translations$dialogs$messageInput$pt_PT extends Translations$dialogs$messageInput$en {
  Translations$dialogs$messageInput$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite a mensagem';
  @override
  String get multiline => 'Várias linhas';
}

// Path: dialogs.noFiles
class Translations$dialogs$noFiles$pt_PT extends Translations$dialogs$noFiles$en {
  Translations$dialogs$noFiles$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nenhum ficheiro selecionado';
  @override
  String get content => 'Selecione pelo menos um ficheiro.';
}

// Path: dialogs.noPermission
class Translations$dialogs$noPermission$pt_PT extends Translations$dialogs$noPermission$en {
  Translations$dialogs$noPermission$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sem permissão';
  @override
  String get content => 'Não concedeu as permissões necessárias. Conceda-as nas definições.';
}

// Path: dialogs.notAvailableOnPlatform
class Translations$dialogs$notAvailableOnPlatform$pt_PT extends Translations$dialogs$notAvailableOnPlatform$en {
  Translations$dialogs$notAvailableOnPlatform$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Indisponível';
  @override
  String get content => 'Esta funcionalidade só está disponível no:';
}

// Path: dialogs.qr
class Translations$dialogs$qr$pt_PT extends Translations$dialogs$qr$en {
  Translations$dialogs$qr$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class Translations$dialogs$quickActions$pt_PT extends Translations$dialogs$quickActions$en {
  Translations$dialogs$quickActions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

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
  String get sortBeforeCount => 'Ordenar previamente por ordem alfabética';
  @override
  String get random => 'Aleatório';
}

// Path: dialogs.quickSaveNotice
class Translations$dialogs$quickSaveNotice$pt_PT extends Translations$dialogs$quickSaveNotice$en {
  Translations$dialogs$quickSaveNotice$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Pedidos de ficheiros são aceites automaticamente. Tenha em atenção que todas as pessoas na rede local podem enviar-lhe ficheiros.';
}

// Path: dialogs.sendModeHelp
class Translations$dialogs$sendModeHelp$pt_PT extends Translations$dialogs$sendModeHelp$en {
  Translations$dialogs$sendModeHelp$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modos de envio';
  @override
  String get single => 'Envia ficheiros para um destinatário. A seleção será apagada após a conclusão da transferência dos ficheiros.';
  @override
  String get multiple => 'Envia ficheiros para vários destinatários. A seleção não será apagada.';
  @override
  String get link =>
      'Os destinatários que não têm o LocalSend instalado podem descarregar os ficheiros selecionados abrindo o link fornecido no navegador.';
}

// Path: dialogs.zoom
class Translations$dialogs$zoom$pt_PT extends Translations$dialogs$zoom$en {
  Translations$dialogs$zoom$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class Translations$dialogs$quickSaveFromFavoritesNotice$pt_PT extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  Translations$dialogs$quickSaveFromFavoritesNotice$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'Requisições de ficheiro agora são aceitas automaticamente de dispositivos da sua lista de favoritos.',
    'Atenção! Atualmente, esta opção não é totalmente segura pois um hacker que saiba a identificação dos seus dispositivos favoritos ainda pode te enviar ficheiros sem restrições.',
    'De qualquer forma, esta opção ainda é mais segura que permitir qualquer dispositivo.',
  ];
  @override
  String get title => 'Gravar rapidamento dos "Favoritos"';
}

// Path: dialogs.openFile
class Translations$dialogs$openFile$pt_PT extends Translations$dialogs$openFile$en {
  Translations$dialogs$openFile$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Abrir ficheiro';
  @override
  String get content => 'Quer abrir o ficheiro recebido?';
}

// Path: dialogs.pin
class Translations$dialogs$pin$pt_PT extends Translations$dialogs$pin$en {
  Translations$dialogs$pin$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digite o PIN';
}

// Path: settingsTab.general.brightnessOptions
class Translations$settingsTab$general$brightnessOptions$pt_PT extends Translations$settingsTab$general$brightnessOptions$en {
  Translations$settingsTab$general$brightnessOptions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Escuro';
  @override
  String get light => 'Claro';
}

// Path: settingsTab.general.colorOptions
class Translations$settingsTab$general$colorOptions$pt_PT extends Translations$settingsTab$general$colorOptions$en {
  Translations$settingsTab$general$colorOptions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class Translations$settingsTab$general$languageOptions$pt_PT extends Translations$settingsTab$general$languageOptions$en {
  Translations$settingsTab$general$languageOptions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class Translations$settingsTab$network$networkOptions$pt_PT extends Translations$settingsTab$network$networkOptions$en {
  Translations$settingsTab$network$networkOptions$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Todos';
  @override
  String get filtered => 'Filtrado';
}

// Path: progressPage.total.title
class Translations$progressPage$total$title$pt_PT extends Translations$progressPage$total$title$en {
  Translations$progressPage$total$title$pt_PT.internal(TranslationsPtPt root) : this._root = root, super.internal(root);

  final TranslationsPtPt _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progresso total (${time})';
  @override
  String get finishedError => 'Terminado com erro';
  @override
  String get canceledSender => 'Cancelado pelo remetente';
  @override
  String get canceledReceiver => 'Cancelado pelo destinatário';
}
