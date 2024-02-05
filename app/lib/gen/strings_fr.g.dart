part of 'strings.g.dart';

// Path: <root>
class _StringsFr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Français';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralFr general = _StringsGeneralFr._(_root);
	@override late final _StringsReceiveTabFr receiveTab = _StringsReceiveTabFr._(_root);
	@override late final _StringsSendTabFr sendTab = _StringsSendTabFr._(_root);
	@override late final _StringsSettingsTabFr settingsTab = _StringsSettingsTabFr._(_root);
	@override late final _StringsTroubleshootPageFr troubleshootPage = _StringsTroubleshootPageFr._(_root);
	@override late final _StringsReceiveHistoryPageFr receiveHistoryPage = _StringsReceiveHistoryPageFr._(_root);
	@override late final _StringsApkPickerPageFr apkPickerPage = _StringsApkPickerPageFr._(_root);
	@override late final _StringsSelectedFilesPageFr selectedFilesPage = _StringsSelectedFilesPageFr._(_root);
	@override late final _StringsReceivePageFr receivePage = _StringsReceivePageFr._(_root);
	@override late final _StringsReceiveOptionsPageFr receiveOptionsPage = _StringsReceiveOptionsPageFr._(_root);
	@override late final _StringsSendPageFr sendPage = _StringsSendPageFr._(_root);
	@override late final _StringsProgressPageFr progressPage = _StringsProgressPageFr._(_root);
	@override late final _StringsWebSharePageFr webSharePage = _StringsWebSharePageFr._(_root);
	@override late final _StringsAboutPageFr aboutPage = _StringsAboutPageFr._(_root);
	@override late final _StringsDonationPageFr donationPage = _StringsDonationPageFr._(_root);
	@override late final _StringsChangelogPageFr changelogPage = _StringsChangelogPageFr._(_root);
	@override late final _StringsAliasGeneratorFr aliasGenerator = _StringsAliasGeneratorFr._(_root);
	@override late final _StringsDialogsFr dialogs = _StringsDialogsFr._(_root);
	@override late final _StringsTrayFr tray = _StringsTrayFr._(_root);
	@override late final _StringsWebFr web = _StringsWebFr._(_root);
	@override late final _StringsAssetPickerFr assetPicker = _StringsAssetPickerFr._(_root);
}

// Path: general
class _StringsGeneralFr extends _StringsGeneralEn {
	_StringsGeneralFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Accepter';
	@override String get accepted => 'Acceptée';
	@override String get add => 'Ajouter';
	@override String get advanced => 'Avancé';
	@override String get cancel => 'Annuler';
	@override String get close => 'Fermer';
	@override String get confirm => 'Confirmer';
	@override String get continueStr => 'Continuer';
	@override String get copy => 'Copier';
	@override String get copiedToClipboard => 'Copié dans le presse-papiers';
	@override String get decline => 'Refuser';
	@override String get done => 'Terminé';
	@override String get delete => 'Supprimer';
	@override String get edit => 'Modifier';
	@override String get error => 'Erreur';
	@override String get example => 'Exemple';
	@override String get files => 'Fichiers';
	@override String get finished => 'Terminé';
	@override String get hide => 'Masquer';
	@override String get off => 'Off';
	@override String get offline => 'Hors ligne';
	@override String get on => 'On';
	@override String get online => 'En ligne';
	@override String get open => 'Ouvrir';
	@override String get queue => 'File d\'attente';
	@override String get quickSave => 'Sauvegarde rapide';
	@override String get renamed => 'Renommé';
	@override String get reset => 'Réinitialiser';
	@override String get restart => 'Redémarrer';
	@override String get settings => 'Paramètres';
	@override String get skipped => 'Ignoré';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
	@override String get save => 'Sauvegarder';
	@override String get unchanged => 'Inchangé';
	@override String get unknown => 'Inconnu';
	@override String get noItemInClipboard => 'Aucun élément dans le presse-papiers';
}

// Path: receiveTab
class _StringsReceiveTabFr extends _StringsReceiveTabEn {
	_StringsReceiveTabFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recevoir';
	@override late final _StringsReceiveTabInfoBoxFr infoBox = _StringsReceiveTabInfoBoxFr._(_root);
}

// Path: sendTab
class _StringsSendTabFr extends _StringsSendTabEn {
	_StringsSendTabFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Envoyer';
	@override late final _StringsSendTabSelectionFr selection = _StringsSendTabSelectionFr._(_root);
	@override late final _StringsSendTabPickerFr picker = _StringsSendTabPickerFr._(_root);
	@override String get shareIntentInfo => 'Vous pouvez également utiliser la fonction "Partager" de votre appareil pour sélectionner des fichiers plus facilement.';
	@override String get nearbyDevices => 'Appareils à proximité';
	@override String get thisDevice => 'Cet Appareil';
	@override String get scan => 'Recherchez des appareils';
	@override String get sendMode => 'Mode envoi';
	@override late final _StringsSendTabSendModesFr sendModes = _StringsSendTabSendModesFr._(_root);
	@override String get sendModeHelp => 'Explication';
	@override String get help => 'Veuillez vous assurer que la cible souhaitée se trouve également dans le même réseau wifi.';
	@override String get placeItems => 'Placez des éléments à partager.';
}

// Path: settingsTab
class _StringsSettingsTabFr extends _StringsSettingsTabEn {
	_StringsSettingsTabFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override late final _StringsSettingsTabGeneralFr general = _StringsSettingsTabGeneralFr._(_root);
	@override late final _StringsSettingsTabReceiveFr receive = _StringsSettingsTabReceiveFr._(_root);
	@override late final _StringsSettingsTabNetworkFr network = _StringsSettingsTabNetworkFr._(_root);
	@override late final _StringsSettingsTabOtherFr other = _StringsSettingsTabOtherFr._(_root);
	@override String get advancedSettings => 'Paramètres avancés';
}

// Path: troubleshootPage
class _StringsTroubleshootPageFr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dépannage';
	@override String get subTitle => 'Cette application ne marche pas comme vous l\'espérez? Vous pouvez ici trouver des solutions à des problèmes communs.';
	@override String get solution => 'Solution:';
	@override String get fixButton => 'Régler automatiquement';
	@override late final _StringsTroubleshootPageFirewallFr firewall = _StringsTroubleshootPageFirewallFr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionFr noConnection = _StringsTroubleshootPageNoConnectionFr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageFr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historique';
	@override String get openFolder => 'Ouvrir le dossier';
	@override String get deleteHistory => 'Supprimer l\'historique';
	@override String get empty => 'L\'historique est vide.';
	@override late final _StringsReceiveHistoryPageEntryActionsFr entryActions = _StringsReceiveHistoryPageEntryActionsFr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageFr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Application (APK)';
	@override String get excludeSystemApps => 'Exclure les applications système';
	@override String get excludeAppsWithoutLaunchIntent => 'Exclure les applications non-lançables';
	@override String apps({required Object n}) => '${n} Applications';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageFr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Tout supprimer';
}

// Path: receivePage
class _StringsReceivePageFr extends _StringsReceivePageEn {
	_StringsReceivePageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		one: 'veut vous envoyer un fichier',
		other: 'veut vous envoyer ${n} fichiers',
	);
	@override String get subTitleMessage => 'vous a envoyé un message :';
	@override String get subTitleLink => 'vous a envoyé un lien :';
	@override String get canceled => 'L\'expéditeur a annulé la demande.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageFr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Désactivé automatiquement car des dossiers sont présents.';
}

// Path: sendPage
class _StringsSendPageFr extends _StringsSendPageEn {
	_StringsSendPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'En attente d\'une réponse...';
	@override String get rejected => 'Le destinataire a rejeté la demande.';
	@override String get busy => 'Le destinataire est occupé avec une autre requête.';
}

// Path: progressPage
class _StringsProgressPageFr extends _StringsProgressPageEn {
	_StringsProgressPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Envoi de fichiers';
	@override String get titleReceiving => 'Réception des fichiers';
	@override String get savedToGallery => 'Sauvegardé dans Photos';
	@override late final _StringsProgressPageTotalFr total = _StringsProgressPageTotalFr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageFr extends _StringsWebSharePageEn {
	_StringsWebSharePageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Partager via un lien';
	@override String get loading => 'Démarrage du serveur...';
	@override String get stopping => 'Fermeture du serveur...';
	@override String get error => 'Une erreur est survenue lors du démarrage du serveur.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		one: 'Ouvrir ce lien dans le navigateur:',
		other: 'Ouvrir un de ces liens dans le navigateur:',
	);
	@override String get requests => 'Requêtes';
	@override String get noRequests => 'Aucune requête en attente.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend utilise un certificat auto-signé. Vous devez l\'accepter dans le navigateur.';
	@override String pendingRequests({required Object n}) => 'Requêtes en attente: ${n}';
}

// Path: aboutPage
class _StringsAboutPageFr extends _StringsAboutPageEn {
	_StringsAboutPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A propos de LocalSend';
	@override List<String> get description => [
		'Localsend est un logiciel gratuit et open-source qui vous permet de partager de manière sécurisée des fichers et des messages avec d\'autres appareils sur votre réseau local, sans même avoir besoin d\'une connexion à internet.',
		'Localsend est disponible sur Android, iOS, macOS, Windows et Linux. Vous pouvez accéder à ces téléchargements sur la page officielle.',
	];
	@override String get author => 'Auteur';
	@override String get contributors => 'Contributeurs';
	@override String get translators => 'Traducteurs';
}

// Path: donationPage
class _StringsDonationPageFr extends _StringsDonationPageEn {
	_StringsDonationPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Faire une donation';
	@override String get info => 'LocalSend est gratuit, open-source and sans aucune pub. Si vous aimez ce logiciel, vous pouvez faire un don pour supporter son développement.';
	@override String donate({required Object amount}) => 'Donner ${amount}';
	@override String get thanks => 'Merci beaucoup!';
	@override String get restore => 'Restaurer les achats';
}

// Path: changelogPage
class _StringsChangelogPageFr extends _StringsChangelogPageEn {
	_StringsChangelogPageFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historique des mises à jour';
}

// Path: aliasGenerator
class _StringsAliasGeneratorFr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsFr extends _StringsDialogsEn {
	_StringsDialogsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileFr addFile = _StringsDialogsAddFileFr._(_root);
	@override late final _StringsDialogsAddressInputFr addressInput = _StringsDialogsAddressInputFr._(_root);
	@override late final _StringsDialogsCancelSessionFr cancelSession = _StringsDialogsCancelSessionFr._(_root);
	@override late final _StringsDialogsCannotOpenFileFr cannotOpenFile = _StringsDialogsCannotOpenFileFr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeFr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeFr._(_root);
	@override late final _StringsDialogsErrorDialogFr errorDialog = _StringsDialogsErrorDialogFr._(_root);
	@override late final _StringsDialogsFavoriteDialogFr favoriteDialog = _StringsDialogsFavoriteDialogFr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogFr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogFr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogFr favoriteEditDialog = _StringsDialogsFavoriteEditDialogFr._(_root);
	@override late final _StringsDialogsFileInfoFr fileInfo = _StringsDialogsFileInfoFr._(_root);
	@override late final _StringsDialogsFileNameInputFr fileNameInput = _StringsDialogsFileNameInputFr._(_root);
	@override late final _StringsDialogsHistoryClearDialogFr historyClearDialog = _StringsDialogsHistoryClearDialogFr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedFr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedFr._(_root);
	@override late final _StringsDialogsMessageInputFr messageInput = _StringsDialogsMessageInputFr._(_root);
	@override late final _StringsDialogsNoFilesFr noFiles = _StringsDialogsNoFilesFr._(_root);
	@override late final _StringsDialogsNoPermissionFr noPermission = _StringsDialogsNoPermissionFr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformFr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformFr._(_root);
	@override late final _StringsDialogsQrFr qr = _StringsDialogsQrFr._(_root);
	@override late final _StringsDialogsQuickActionsFr quickActions = _StringsDialogsQuickActionsFr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeFr quickSaveNotice = _StringsDialogsQuickSaveNoticeFr._(_root);
	@override late final _StringsDialogsSendModeHelpFr sendModeHelp = _StringsDialogsSendModeHelpFr._(_root);
}

// Path: tray
class _StringsTrayFr extends _StringsTrayEn {
	_StringsTrayFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Quitter LocalSend';
}

// Path: web
class _StringsWebFr extends _StringsWebEn {
	_StringsWebFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Rejeté';
	@override String get files => 'Fichiers';
	@override String get fileName => 'Nom du fichier';
	@override String get size => 'Taille';
}

// Path: assetPicker
class _StringsAssetPickerFr extends _StringsAssetPickerEn {
	_StringsAssetPickerFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'OK';
	@override String get cancel => 'Annuler';
	@override String get edit => 'Modifier';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Echec du chargement';
	@override String get original => 'Original';
	@override String get preview => 'Aperçu';
	@override String get select => 'Choisir';
	@override String get emptyList => 'Liste vide';
	@override String get unSupportedAssetType => 'Type de fichier non supporté.';
	@override String get unableToAccessAll => 'Impossible d\'accéder aux médias de votre appareil';
	@override String get viewingLimitedAssetsTip => 'Affichage des médias et albums limité.';
	@override String get changeAccessibleLimitedAssets => 'Modifier l\'accès limité aux médias';
	@override String get accessAllTip => 'L\'application ne peut accéder qu\'à certains medias. Allez dans les paramètres système et autoriser l\'application à accéder à tous les medias sur l\'appareil.';
	@override String get goToSystemSettings => 'Allez dans les paramètres système';
	@override String get accessLimitedAssets => 'Continuer avec un accès limité';
	@override String get accessiblePathName => 'Medias accessible';
	@override String get sTypeAudioLabel => 'l\'audio';
	@override String get sTypeImageLabel => 'image';
	@override String get sTypeVideoLabel => 'vidéo';
	@override String get sTypeOtherLabel => 'Autre';
	@override String get sActionPlayHint => 'jouer';
	@override String get sActionPreviewHint => 'aperçu';
	@override String get sActionSelectHint => 'choisir';
	@override String get sActionSwitchPathLabel => 'changer le dossier';
	@override String get sActionUseCameraHint => 'Utiliser la Caméra';
	@override String get sNameDurationLabel => 'durée';
	@override String get sUnitAssetCountLabel => 'quantité';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxFr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionFr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sélection';
	@override String files({required Object files}) => 'Fichiers: ${files}';
	@override String size({required Object size}) => 'Taille: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerFr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fichier';
	@override String get folder => 'Dossier';
	@override String get media => 'Média';
	@override String get text => 'Texte';
	@override String get app => 'Application';
	@override String get clipboard => 'Presse-papiers';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesFr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get single => 'Récipient unique';
	@override String get multiple => 'Récipients multiples';
	@override String get link => 'Partager via un lien';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralFr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Général';
	@override String get brightness => 'Luminosité';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsFr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsFr._(_root);
	@override String get color => 'Couleur';
	@override late final _StringsSettingsTabGeneralColorOptionsFr colorOptions = _StringsSettingsTabGeneralColorOptionsFr._(_root);
	@override String get language => 'Langue';
	@override late final _StringsSettingsTabGeneralLanguageOptionsFr languageOptions = _StringsSettingsTabGeneralLanguageOptionsFr._(_root);
	@override String get saveWindowPlacement => 'Quitter: Sauvegarder l\'emplacement de la fenêtre';
	@override String get minimizeToTray => 'Quitter : Réduire à la barre des tâches';
	@override String get launchAtStartup => 'Démarrage automatique : Après la connexion';
	@override String get launchMinimized => 'Démarrage automatique : Minimiser';
	@override String get animations => 'Animations';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveFr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reçu';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Finir automatiquement';
	@override String get destination => 'Destination';
	@override String get downloads => '(Téléchargements)';
	@override String get saveToGallery => 'Sauvegarder les médias dans la galerie';
	@override String get saveToHistory => 'Enregistrer dans l\'historique';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkFr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Réseau';
	@override String get needRestart => 'Redémarrez le serveur pour appliquer les paramètres !';
	@override String get server => 'Serveur';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Type d\'appareil';
	@override String get deviceModel => 'Modèle d\'appareil';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Il se peut que vous ne soyez pas détecté par d\'autres appareils car vous utilisez un port personnalisé. (par défaut : ${defaultPort})';
	@override String get encryption => 'Chiffrement';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Il est possible que vous ne soyez pas détecté par d\'autres appareils car vous utilisez une adresse multicast différente de celle par défaut. (par défaut: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherFr extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autre';
	@override String get support => 'Supporter LocalSend';
	@override String get donate => 'Faire une donation';
	@override String get privacyPolicy => 'Politique de confidentialité';
	@override String get termsOfUse => 'Conditions d\'utilisation';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallFr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Cet appareil peut envoyer des fichiers à d\'autres appareils, mais d\'autres appareils ne peuvent pas en envoyer à cet appareil.';
	@override String solution({required Object port}) => 'Le problème est probablement dû à votre pare-feu. Vous pouvez le régler en autorisant les connections entrantes (UDP et TCP) sur le port ${port}.';
	@override String get openFirewall => 'Ouvrir le pare-feu';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionFr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Les deux appareils ne peuvent ni se trouver, ni partager des fichiers.';
	@override String get solution => 'Le problème existe-il des deux côtés? Si oui, vérifiez que les deux appareils sont connectés au même réseau wifi et qu\'ils partagent la même configuration (port, adresse multicast, chiffrement). Le wifi peut ne pas autoriser les communications entre appareils. Dans ce cas, l\'option doit être activée dans les paramètres du routeur.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsFr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get open => 'Ouvrir le fichier';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Supprimer de l\'historique';
}

// Path: progressPage.total
class _StringsProgressPageTotalFr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleFr title = _StringsProgressPageTotalTitleFr._(_root);
	@override String count({required Object curr, required Object n}) => 'Fichiers: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Taille: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Vitesse: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileFr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajouter à la sélection';
	@override String get content => 'Que voulez-vous ajouter ?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputFr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrez l\'adresse';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Adresse IP';
	@override String get recentlyUsed => 'Récemment utilisé :';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionFr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Annuler le transfert de fichiers';
	@override String get content => 'Voulez-vous vraiment annuler le transfert de fichiers ?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileFr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ne peut pas ouvrir le fichier';
	@override String content({required Object file}) => 'Ne peut pas ouvrir "${file}". Ce fichier a-t-il été déplacé, renommé ou supprimé ?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeFr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffrement désactivé';
	@override String get content => 'La communication s\'effectue désormais via le protocole HTTP non crypté. Pour utiliser HTTPS, réactivez le chiffrement.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogFr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogFr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoris';
	@override String get noFavorites => 'Aucun appareil favori pour le moment.';
	@override String get addFavorite => 'Ajouter';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogFr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer des favoris';
	@override String content({required Object name}) => 'Voulez-vous vraiment supprimer "${name}" des favoris ?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogFr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Ajouter aux favoris';
	@override String get titleEdit => 'Ajuster';
	@override String get name => 'Alias';
	@override String get auto => '(automatique)';
	@override String get ip => 'Adresse IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoFr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations sur le fichier';
	@override String get fileName => 'Nom du fichier :';
	@override String get path => 'Chemin :';
	@override String get size => 'Taille :';
	@override String get sender => 'Éxpéditeur :';
	@override String get time => 'Temps :';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputFr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrez le nom du fichier';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogFr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Effacer l\'historique';
	@override String get content => 'Voulez-vous vraiment effacer l\'historique entier?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedFr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend ne peut pas trouver d\'autres appareils sans la permission de scanner votre réseau local. Veuillez autoriser cette permission à LocalSend dans les paramètres.';
	@override String get gotoSettings => 'Paramètres';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputFr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tapez un message';
	@override String get multiline => 'Multiligne';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesFr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aucun fichier sélectionné';
	@override String get content => 'Veuillez sélectionner au moins un fichier.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionFr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pas la permission';
	@override String get content => 'Vous n\'avez pas accordé les autorisations nécessaires. Veuillez les accorder dans les paramètres.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformFr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Non disponible';
	@override String get content => 'Cette fonctionalité est disponible uniquement sur:';
}

// Path: dialogs.qr
class _StringsDialogsQrFr extends _StringsDialogsQrEn {
	_StringsDialogsQrFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsFr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actions Rapides';
	@override String get counter => 'Compteur';
	@override String get prefix => 'Préfixe';
	@override String get padZero => 'Remplir de zéros';
	@override String get sortBeforeCount => 'Trier préalablement par ordre alphabétique';
	@override String get random => 'Aléatoire';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeFr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Les demandes de fichiers sont automatiquement acceptées. Sachez que tous les membres du réseau local peuvent vous envoyer des fichiers.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpFr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modes d\'envoi';
	@override String get single => 'Envoyer des fichiers à un récipient. La sélection sera effacée une fois l\'envoi du fichier terminé.';
	@override String get multiple => 'Envoyer des fichiers à plusieurs récipients. La sélection ne sera pas effacée.';
	@override String get link => 'Les récipients n\'ayant pas LocalSend installé peuvent télécharger les fichiers sélectionnés en ouvrant le lien dans leur navigateur.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsFr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get dark => 'Sombre';
	@override String get light => 'Clair';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsFr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsFr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleFr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progression totale (${time})';
	@override String get finishedError => 'Terminé avec une erreur';
	@override String get canceledSender => 'Annulé par l\'expéditeur';
	@override String get canceledReceiver => 'Annulé par le destinataire';
}
