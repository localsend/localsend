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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.fr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <fr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsFr _root = this; // ignore: unused_field

  @override
  TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Français';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$fr general = _Translations$general$fr._(_root);
  @override
  late final _Translations$receiveTab$fr receiveTab = _Translations$receiveTab$fr._(_root);
  @override
  late final _Translations$sendTab$fr sendTab = _Translations$sendTab$fr._(_root);
  @override
  late final _Translations$settingsTab$fr settingsTab = _Translations$settingsTab$fr._(_root);
  @override
  late final _Translations$troubleshootPage$fr troubleshootPage = _Translations$troubleshootPage$fr._(_root);
  @override
  late final _Translations$receiveHistoryPage$fr receiveHistoryPage = _Translations$receiveHistoryPage$fr._(_root);
  @override
  late final _Translations$apkPickerPage$fr apkPickerPage = _Translations$apkPickerPage$fr._(_root);
  @override
  late final _Translations$selectedFilesPage$fr selectedFilesPage = _Translations$selectedFilesPage$fr._(_root);
  @override
  late final _Translations$receivePage$fr receivePage = _Translations$receivePage$fr._(_root);
  @override
  late final _Translations$receiveOptionsPage$fr receiveOptionsPage = _Translations$receiveOptionsPage$fr._(_root);
  @override
  late final _Translations$sendPage$fr sendPage = _Translations$sendPage$fr._(_root);
  @override
  late final _Translations$progressPage$fr progressPage = _Translations$progressPage$fr._(_root);
  @override
  late final _Translations$webSharePage$fr webSharePage = _Translations$webSharePage$fr._(_root);
  @override
  late final _Translations$aboutPage$fr aboutPage = _Translations$aboutPage$fr._(_root);
  @override
  late final _Translations$donationPage$fr donationPage = _Translations$donationPage$fr._(_root);
  @override
  late final _Translations$changelogPage$fr changelogPage = _Translations$changelogPage$fr._(_root);
  @override
  late final _Translations$dialogs$fr dialogs = _Translations$dialogs$fr._(_root);
  @override
  late final _Translations$sanitization$fr sanitization = _Translations$sanitization$fr._(_root);
  @override
  late final _Translations$tray$fr tray = _Translations$tray$fr._(_root);
  @override
  late final _Translations$web$fr web = _Translations$web$fr._(_root);
  @override
  late final _Translations$assetPicker$fr assetPicker = _Translations$assetPicker$fr._(_root);
  @override
  late final _Translations$networkInterfacesPage$fr networkInterfacesPage = _Translations$networkInterfacesPage$fr._(_root);
}

// Path: general
class _Translations$general$fr extends Translations$general$en {
  _Translations$general$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Accepter';
  @override
  String get accepted => 'Accepté';
  @override
  String get add => 'Ajouter';
  @override
  String get advanced => 'Avancé';
  @override
  String get cancel => 'Annuler';
  @override
  String get close => 'Fermer';
  @override
  String get confirm => 'Confirmer';
  @override
  String get continueStr => 'Continuer';
  @override
  String get copy => 'Copier';
  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';
  @override
  String get decline => 'Refuser';
  @override
  String get done => 'Terminé';
  @override
  String get delete => 'Supprimer';
  @override
  String get edit => 'Modifier';
  @override
  String get error => 'Erreur';
  @override
  String get example => 'Exemple';
  @override
  String get files => 'Fichiers';
  @override
  String get finished => 'Terminé';
  @override
  String get hide => 'Masquer';
  @override
  String get off => 'Désactivé';
  @override
  String get offline => 'Hors ligne';
  @override
  String get on => 'Activé';
  @override
  String get online => 'En ligne';
  @override
  String get open => 'Ouvrir';
  @override
  String get queue => 'File d\'attente';
  @override
  String get quickSave => 'Sauvegarde rapide';
  @override
  String get quickSaveFromFavorites => 'Sauvegarde rapide des favoris';
  @override
  String get renamed => 'Renommé';
  @override
  String get reset => 'Annuler les changements';
  @override
  String get restart => 'Redémarrer';
  @override
  String get settings => 'Paramètres';
  @override
  String get skipped => 'Ignoré';
  @override
  String get start => 'Démarrer';
  @override
  String get stop => 'Arrêter';
  @override
  String get save => 'Sauvegarder';
  @override
  String get unchanged => 'Inchangé';
  @override
  String get unknown => 'Inconnu';
  @override
  String get noItemInClipboard => 'Aucun élément dans le presse-papiers.';
}

// Path: receiveTab
class _Translations$receiveTab$fr extends Translations$receiveTab$en {
  _Translations$receiveTab$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recevoir';
  @override
  late final _Translations$receiveTab$infoBox$fr infoBox = _Translations$receiveTab$infoBox$fr._(_root);
  @override
  late final _Translations$receiveTab$quickSave$fr quickSave = _Translations$receiveTab$quickSave$fr._(_root);
}

// Path: sendTab
class _Translations$sendTab$fr extends Translations$sendTab$en {
  _Translations$sendTab$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Envoyer';
  @override
  late final _Translations$sendTab$selection$fr selection = _Translations$sendTab$selection$fr._(_root);
  @override
  late final _Translations$sendTab$picker$fr picker = _Translations$sendTab$picker$fr._(_root);
  @override
  String get shareIntentInfo =>
      'Vous pouvez également utiliser la fonction "Partager" de votre appareil pour sélectionner des fichiers plus facilement.';
  @override
  String get nearbyDevices => 'Appareils à proximité';
  @override
  String get thisDevice => 'Cet Appareil';
  @override
  String get scan => 'Recherche automatique';
  @override
  String get manualSending => 'Recherche manuelle';
  @override
  String get sendMode => 'Mode d\'envoi';
  @override
  late final _Translations$sendTab$sendModes$fr sendModes = _Translations$sendTab$sendModes$fr._(_root);
  @override
  String get sendModeHelp => 'Explication';
  @override
  String get help => 'Veuillez vous assurer que l\'appareil cible se trouve sur le même réseau Wi-Fi.';
  @override
  String get placeItems => 'Placez des éléments à partager.';
}

// Path: settingsTab
class _Translations$settingsTab$fr extends Translations$settingsTab$en {
  _Translations$settingsTab$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Paramètres';
  @override
  late final _Translations$settingsTab$general$fr general = _Translations$settingsTab$general$fr._(_root);
  @override
  late final _Translations$settingsTab$receive$fr receive = _Translations$settingsTab$receive$fr._(_root);
  @override
  late final _Translations$settingsTab$send$fr send = _Translations$settingsTab$send$fr._(_root);
  @override
  late final _Translations$settingsTab$network$fr network = _Translations$settingsTab$network$fr._(_root);
  @override
  late final _Translations$settingsTab$other$fr other = _Translations$settingsTab$other$fr._(_root);
  @override
  String get advancedSettings => 'Paramètres avancés';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$fr extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dépannage';
  @override
  String get subTitle => 'Cette application ne fonctionne pas comme vous l\'espérez ? Vous trouverez ici des solutions aux problèmes communs.';
  @override
  String get solution => 'Solution :';
  @override
  String get fixButton => 'Corriger automatiquement';
  @override
  late final _Translations$troubleshootPage$firewall$fr firewall = _Translations$troubleshootPage$firewall$fr._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$fr noDiscovery = _Translations$troubleshootPage$noDiscovery$fr._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$fr noConnection = _Translations$troubleshootPage$noConnection$fr._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$fr extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historique';
  @override
  String get openFolder => 'Ouvrir le dossier';
  @override
  String get deleteHistory => 'Supprimer l\'historique';
  @override
  String get empty => 'L\'historique est vide.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$fr entryActions = _Translations$receiveHistoryPage$entryActions$fr._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$fr extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Application (APK)';
  @override
  String get excludeSystemApps => 'Exclure les applications système';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Exclure les applications non-lançables';
  @override
  String apps({required Object n}) => '${n} Applications';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$fr extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Tout supprimer';
}

// Path: receivePage
class _Translations$receivePage$fr extends Translations$receivePage$en {
  _Translations$receivePage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
    n,
    one: 'veut vous envoyer un fichier',
    other: 'veut vous envoyer ${n} fichiers',
  );
  @override
  String get subTitleMessage => 'vous a envoyé un message :';
  @override
  String get subTitleLink => 'vous a envoyé un lien :';
  @override
  String get canceled => 'L\'expéditeur a annulé la demande.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$fr extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Options';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(dossier LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Désactivé automatiquement car des dossiers sont présents.';
}

// Path: sendPage
class _Translations$sendPage$fr extends Translations$sendPage$en {
  _Translations$sendPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'En attente d\'une réponse …';
  @override
  String get rejected => 'Le destinataire a rejeté la demande.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Le destinataire ne peut pas traiter la requête actuelle. Veuillez réessayer ultérieument.';
}

// Path: progressPage
class _Translations$progressPage$fr extends Translations$progressPage$en {
  _Translations$progressPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Envoi de fichiers';
  @override
  String get titleReceiving => 'Réception des fichiers';
  @override
  String get savedToGallery => 'Sauvegardé dans la Galerie';
  @override
  late final _Translations$progressPage$total$fr total = _Translations$progressPage$total$fr._(_root);
  @override
  late final _Translations$progressPage$remainingTime$fr remainingTime = _Translations$progressPage$remainingTime$fr._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$fr extends Translations$webSharePage$en {
  _Translations$webSharePage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Partager via un lien';
  @override
  String get loading => 'Démarrage du serveur …';
  @override
  String get stopping => 'Arrêt du serveur …';
  @override
  String get error => 'Une erreur est survenue lors du démarrage du serveur.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
    n,
    one: 'Ouvrir ce lien dans le navigateur :',
    other: 'Ouvrir un des liens suivants dans le navigateur :',
  );
  @override
  String get requests => 'Requêtes';
  @override
  String get noRequests => 'Aucune requête en attente.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Accepter automatiquement les requêtes';
  @override
  String get requirePin => 'Code PIN requis';
  @override
  String pinHint({required Object pin}) => 'Le code PIN est "${pin}"';
  @override
  String get encryptionHint => 'LocalSend utilise un certificat auto-signé. Vous devez l\'accepter dans le navigateur.';
  @override
  String pendingRequests({required Object n}) => 'Requêtes en attente : ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$fr extends Translations$aboutPage$en {
  _Translations$aboutPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'À propos de LocalSend';
  @override
  List<String> get description => [
    'Localsend est un logiciel gratuit et open-source qui vous permet de partager de manière sécurisée des fichiers et des messages avec d\'autres appareils connectés à votre réseau local. Une connexion à internet n\'est pas requise.',
    'Localsend est disponible sur Android, iOS, macOS, Windows et Linux. Vous pouvez accéder à ces téléchargements depuis la page officielle.',
  ];
  @override
  String get author => 'Auteur';
  @override
  String get contributors => 'Contributeurs';
  @override
  String get packagers => 'Distributeurs';
  @override
  String get translators => 'Traducteurs';
}

// Path: donationPage
class _Translations$donationPage$fr extends Translations$donationPage$en {
  _Translations$donationPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faire une donation';
  @override
  String get info =>
      'LocalSend est gratuit, open-source et sans aucune pub. Si vous aimez ce logiciel, vous pouvez faire un don pour soutenir son développement.';
  @override
  String donate({required Object amount}) => 'Donner ${amount}';
  @override
  String get thanks => 'Merci beaucoup !';
  @override
  String get restore => 'Restaurer les achats';
}

// Path: changelogPage
class _Translations$changelogPage$fr extends Translations$changelogPage$en {
  _Translations$changelogPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historique des mises à jour';
}

// Path: dialogs
class _Translations$dialogs$fr extends Translations$dialogs$en {
  _Translations$dialogs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$fr addFile = _Translations$dialogs$addFile$fr._(_root);
  @override
  late final _Translations$dialogs$openFile$fr openFile = _Translations$dialogs$openFile$fr._(_root);
  @override
  late final _Translations$dialogs$addressInput$fr addressInput = _Translations$dialogs$addressInput$fr._(_root);
  @override
  late final _Translations$dialogs$cancelSession$fr cancelSession = _Translations$dialogs$cancelSession$fr._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$fr cannotOpenFile = _Translations$dialogs$cannotOpenFile$fr._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$fr encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$fr._(_root);
  @override
  late final _Translations$dialogs$errorDialog$fr errorDialog = _Translations$dialogs$errorDialog$fr._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$fr favoriteDialog = _Translations$dialogs$favoriteDialog$fr._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$fr favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$fr._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$fr favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$fr._(_root);
  @override
  late final _Translations$dialogs$fileInfo$fr fileInfo = _Translations$dialogs$fileInfo$fr._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$fr fileNameInput = _Translations$dialogs$fileNameInput$fr._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$fr historyClearDialog = _Translations$dialogs$historyClearDialog$fr._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$fr localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$fr._(_root);
  @override
  late final _Translations$dialogs$messageInput$fr messageInput = _Translations$dialogs$messageInput$fr._(_root);
  @override
  late final _Translations$dialogs$noFiles$fr noFiles = _Translations$dialogs$noFiles$fr._(_root);
  @override
  late final _Translations$dialogs$noPermission$fr noPermission = _Translations$dialogs$noPermission$fr._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$fr notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$fr._(_root);
  @override
  late final _Translations$dialogs$qr$fr qr = _Translations$dialogs$qr$fr._(_root);
  @override
  late final _Translations$dialogs$quickActions$fr quickActions = _Translations$dialogs$quickActions$fr._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$fr quickSaveNotice = _Translations$dialogs$quickSaveNotice$fr._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$fr quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$fr._(_root);
  @override
  late final _Translations$dialogs$pin$fr pin = _Translations$dialogs$pin$fr._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$fr sendModeHelp = _Translations$dialogs$sendModeHelp$fr._(_root);
  @override
  late final _Translations$dialogs$zoom$fr zoom = _Translations$dialogs$zoom$fr._(_root);
}

// Path: sanitization
class _Translations$sanitization$fr extends Translations$sanitization$en {
  _Translations$sanitization$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Le nom du fichier ne peut pas être vide';
  @override
  String get invalid => 'Le nom du fichier contient des caractères non valides';
}

// Path: tray
class _Translations$tray$fr extends Translations$tray$en {
  _Translations$tray$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Quitter LocalSend';
  @override
  String get closeWindows => 'Fermer';
}

// Path: web
class _Translations$web$fr extends Translations$web$en {
  _Translations$web$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Entrez le code PIN';
  @override
  String get invalidPin => 'Code PIN invalide';
  @override
  String get tooManyAttempts => 'Trop d\'essais infructueux';
  @override
  String get rejected => 'Rejeté';
  @override
  String get files => 'Fichiers';
  @override
  String get fileName => 'Nom du fichier';
  @override
  String get size => 'Taille';
}

// Path: assetPicker
class _Translations$assetPicker$fr extends Translations$assetPicker$en {
  _Translations$assetPicker$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'OK';
  @override
  String get cancel => 'Annuler';
  @override
  String get edit => 'Modifier';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Echec du chargement';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Aperçu';
  @override
  String get select => 'Choisir';
  @override
  String get emptyList => 'Liste vide';
  @override
  String get unSupportedAssetType => 'Type de fichier non supporté.';
  @override
  String get unableToAccessAll => 'Impossible d\'accéder aux médias de votre appareil';
  @override
  String get viewingLimitedAssetsTip => 'Affichage limité des médias et des albums.';
  @override
  String get changeAccessibleLimitedAssets => 'Modifier l\'accès limité aux médias';
  @override
  String get accessAllTip =>
      'L\'application ne peut accéder qu\'à certains medias. Allez dans les paramètres système et autorisez l\'application à accéder à tous les medias sur l\'appareil.';
  @override
  String get goToSystemSettings => 'Allez dans les paramètres système';
  @override
  String get accessLimitedAssets => 'Continuer avec un accès limité';
  @override
  String get accessiblePathName => 'Medias accessible';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Image';
  @override
  String get sTypeVideoLabel => 'Vidéo';
  @override
  String get sTypeOtherLabel => 'Autre';
  @override
  String get sActionPlayHint => 'lire';
  @override
  String get sActionPreviewHint => 'aperçu';
  @override
  String get sActionSelectHint => 'choisir';
  @override
  String get sActionSwitchPathLabel => 'changer le dossier';
  @override
  String get sActionUseCameraHint => 'Utiliser la Caméra';
  @override
  String get sNameDurationLabel => 'durée';
  @override
  String get sUnitAssetCountLabel => 'quantité';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$fr extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfaces réseau';
  @override
  String get info =>
      'Par défaut, LocalSend utilise toutes les interfaces réseau disponibles. Vous pouvez exclure les réseaux indésirables ici. Vous aurez besoin de redémarrer le serveur pour appliquer les changements.';
  @override
  String get preview => 'Aperçu';
  @override
  String get whitelist => 'Liste blanche';
  @override
  String get blacklist => 'Liste noire';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$fr extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP :';
  @override
  String get port => 'Port :';
  @override
  String get alias => 'Nom du périphérique :';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$fr extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoris';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$fr extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sélection';
  @override
  String files({required Object files}) => 'Fichiers : ${files}';
  @override
  String size({required Object size}) => 'Taille : ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$fr extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fichier';
  @override
  String get folder => 'Dossier';
  @override
  String get media => 'Média';
  @override
  String get text => 'Texte';
  @override
  String get app => 'Application';
  @override
  String get clipboard => 'Presse-papiers';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$fr extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Destinataire unique';
  @override
  String get multiple => 'Destinataires multiples';
  @override
  String get link => 'Partager via un lien';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$fr extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Général';
  @override
  String get brightness => 'Thème';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$fr brightnessOptions = _Translations$settingsTab$general$brightnessOptions$fr._(
    _root,
  );
  @override
  String get color => 'Couleur';
  @override
  late final _Translations$settingsTab$general$colorOptions$fr colorOptions = _Translations$settingsTab$general$colorOptions$fr._(_root);
  @override
  String get language => 'Langue';
  @override
  late final _Translations$settingsTab$general$languageOptions$fr languageOptions = _Translations$settingsTab$general$languageOptions$fr._(_root);
  @override
  String get saveWindowPlacement => 'Sauvegarder l\'emplacement de la fenêtre à la fermeture';
  @override
  String get saveWindowPlacementWindows => 'Sauvegarder la position de la fenêtre en quittant';
  @override
  String get minimizeToTray => 'Réduire dans la barre des tâches à la fermeture';
  @override
  String get launchAtStartup => 'Lancer LocalSend à la connexion de l\'utilisateur';
  @override
  String get launchMinimized => 'Minimiser LocalSend lors du lancement';
  @override
  String get showInContextMenu => 'Afficher LocalSend dans le menu contextuel';
  @override
  String get animations => 'Animations';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$fr extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Réception';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Fermer la page du transfert lorqu\'il est terminé';
  @override
  String get destination => 'Destination';
  @override
  String get downloads => '(Téléchargements)';
  @override
  String get saveToGallery => 'Sauvegarder les médias dans la galerie';
  @override
  String get saveToHistory => 'Activer l\'historique';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$fr extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Envoyer';
  @override
  String get shareViaLinkAutoAccept => 'Accepter automatiquement les demandes de téléchargement d\'un partage par lien';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$fr extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Réseau';
  @override
  String get needRestart => 'Redémarrez le serveur pour appliquer les paramètres !';
  @override
  String get server => 'Serveur';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Type d\'appareil';
  @override
  String get deviceModel => 'Modèle d\'appareil';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Délai d\'expiration de la recherche';
  @override
  String get useSystemName => 'Utiliser le nom du système';
  @override
  String get generateRandomAlias => 'Générer un alias aléatoire';
  @override
  String portWarning({required Object defaultPort}) =>
      'Il se peut que vous ne soyez pas détecté par d\'autres appareils car vous utilisez un port personnalisé. (par défaut : ${defaultPort})';
  @override
  String get encryption => 'Chiffrement';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Il est possible que vous ne soyez pas détecté par d\'autres appareils car vous utilisez une adresse multicast différente de celle par défaut. (par défaut : ${defaultMulticast})';
  @override
  String get network => 'Réseau';
  @override
  late final _Translations$settingsTab$network$networkOptions$fr networkOptions = _Translations$settingsTab$network$networkOptions$fr._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$fr extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Autre';
  @override
  String get support => 'Soutenir LocalSend';
  @override
  String get donate => 'Faire une donation';
  @override
  String get privacyPolicy => 'Politique de confidentialité';
  @override
  String get termsOfUse => 'Conditions d\'utilisation';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$fr extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Cet appareil peut envoyer des fichiers mais pas en recevoir.';
  @override
  String solution({required Object port}) =>
      'Il se peut que votre pare-feu bloque la réception de fichiers. Pour corriger ce problème, il est nécessaire d\'autoriser les connections entrantes (UDP et TCP) sur le port ${port}.';
  @override
  String get openFirewall => 'Ouvrir le pare-feu';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$fr extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Cet appareil ne peut pas trouver d\'autres appareils.';
  @override
  String get solution =>
      'Assurez-vous que tous les appareils soient sur le même réseau Wi-Fi et qu\'ils partagent la même configuration (port, adresse multicast, chiffrement). Vous pouvez également rechercher manuellement d\'autres appareils en utilisant leur addresse IP. Pensez à ajouter l\'appareil à vos favoris pour faciliter les prochains transferts de fichiers.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$fr extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Les deux appareils ne peuvent ni se trouver, ni partager des fichiers.';
  @override
  String get solution =>
      'Le problème existe-il des deux côtés ? Si oui, vérifiez que les deux appareils soient connectés au même réseau Wi-Fi et qu\'ils partagent la même configuration (port, adresse multicast, chiffrement). Il se peut que les appareils soient isolés les uns des autres, empêchant toutes communications entre eux. Cet isolement peut être désactivé dans votre routeur/box internet via l\'option "Isolement du point d\'accès" ou "AP Isolation".';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$fr extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Ouvrir le fichier';
  @override
  String get showInFolder => 'Ouvrir le dossier';
  @override
  String get info => 'Information';
  @override
  String get deleteFromHistory => 'Supprimer de l\'historique';
}

// Path: progressPage.total
class _Translations$progressPage$total$fr extends Translations$progressPage$total$en {
  _Translations$progressPage$total$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$fr title = _Translations$progressPage$total$title$fr._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fichiers : ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Taille : ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Vitesse : ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$fr extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n} :${ss}';

  /// Utilisez « h » pour l'abréviation des heures et « m » pour les minutes
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}min';

  /// Utilisez « j » pour les jours, « h » pour les heures et « m » pour les minutes
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}j ${h}h ${m}min';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$fr extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ajouter à la sélection';
  @override
  String get content => 'Que voulez-vous ajouter ?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$fr extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ouvrir le fichier';
  @override
  String get content => 'Voulez-vous ouvrir le fichier reçu ?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$fr extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Entrez l\'adresse IP';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Adresse IP';
  @override
  String get recentlyUsed => 'Récemment utilisé : ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$fr extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Annuler le transfert de fichiers';
  @override
  String get content => 'Voulez-vous vraiment annuler le transfert de fichiers ?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$fr extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ne peut pas ouvrir le fichier';
  @override
  String content({required Object file}) => 'Ne peut pas ouvrir "${file}". Ce fichier a-t-il été déplacé, renommé ou supprimé ?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$fr extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Chiffrement désactivé';
  @override
  String get content => 'La communication s\'effectue désormais via le protocole non chiffré HTTP. Pour utiliser HTTPS, réactivez le chiffrement.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$fr extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$fr extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoris';
  @override
  String get noFavorites => 'Aucun appareil favori pour le moment.';
  @override
  String get addFavorite => 'Ajouter';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$fr extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Supprimer des favoris';
  @override
  String content({required Object name}) => 'Voulez-vous vraiment supprimer "${name}" des favoris ?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$fr extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Ajouter aux favoris';
  @override
  String get titleEdit => 'Modifier le favori';
  @override
  String get name => 'Alias';
  @override
  String get auto => '(automatique)';
  @override
  String get ip => 'Adresse IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$fr extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informations sur le fichier';
  @override
  String get fileName => 'Nom du fichier :';
  @override
  String get path => 'Chemin :';
  @override
  String get size => 'Taille :';
  @override
  String get sender => 'Expéditeur :';
  @override
  String get time => 'Date :';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$fr extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Entrez le nom du fichier';
  @override
  String original({required Object original}) => 'Original : ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$fr extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Effacer l\'historique';
  @override
  String get content => 'Voulez-vous vraiment effacer l\'historique ?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$fr extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend ne peut pas trouver d\'autres appareils sans la permission de scanner votre réseau local. Veuillez donner cette permission à LocalSend dans les paramètres système.';
  @override
  String get gotoSettings => 'Paramètres';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$fr extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tapez un message';
  @override
  String get multiline => 'Multiligne';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$fr extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aucun fichier sélectionné';
  @override
  String get content => 'Veuillez sélectionner au moins un fichier.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$fr extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend n\'a pas la permission';
  @override
  String get content => 'Vous n\'avez pas accordé les autorisations nécessaires. Veuillez les accorder dans les paramètres systèmes.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$fr extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Non disponible';
  @override
  String get content => 'Cette fonctionnalité est disponible uniquement sur :';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$fr extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$fr extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Actions Rapides';
  @override
  String get counter => 'Compteur';
  @override
  String get prefix => 'Préfixe';
  @override
  String get padZero => 'Remplir de zéros';
  @override
  String get sortBeforeCount => 'Trier préalablement par ordre alphabétique';
  @override
  String get random => 'Aléatoire';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$fr extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Les demandes d\'envoi de fichiers sont désormais automatiquement acceptées. Veuillez noter que tous les appareils connectés au réseau local pourront vous envoyer des fichiers.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$fr extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Les demandes de fichiers provenant de vos appareils favoris sont désormais automatiquement acceptées.',
    'Attention : Cette option n\'est pas sûre car un hackeur qui connaîtrait l\'empreinte numérique de vos appareils favoris pourrait quand même vous envoyer des fichiers.',
    'Cette option reste néanmoins plus sûre que d\'autoriser tous les appareils.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$fr extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Entrez le code PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$fr extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Modes d\'envoi';
  @override
  String get single => 'Envoyer des fichiers à un destinataire. La sélection sera effacée une fois l\'envoi du fichier terminé.';
  @override
  String get multiple => 'Envoyer des fichiers à plusieurs destinataires. La sélection ne sera pas effacée.';
  @override
  String get link =>
      'Les destinataires n\'ayant pas LocalSend installé peuvent télécharger les fichiers sélectionnés en ouvrant le lien dans leur navigateur.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$fr extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$fr extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Système';
  @override
  String get dark => 'Sombre';
  @override
  String get light => 'Clair';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$fr extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Système';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$fr extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Système';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$fr extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'Filtré';
  @override
  String get all => 'Tout';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$fr extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$fr._(TranslationsFr root) : this._root = root, super.internal(root);

  final TranslationsFr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progression totale (${time})';
  @override
  String get finishedError => 'Terminé avec une erreur';
  @override
  String get canceledSender => 'Annulé par l\'expéditeur';
  @override
  String get canceledReceiver => 'Annulé par le destinataire';
}
