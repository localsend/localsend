part of 'strings.g.dart';

// Path: <root>
class _StringsFrFr extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFrFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.frFr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr-FR>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsFrFr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Français (France)';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralFrFr general = _StringsGeneralFrFr._(_root);
	@override late final _StringsReceiveTabFrFr receiveTab = _StringsReceiveTabFrFr._(_root);
	@override late final _StringsSendTabFrFr sendTab = _StringsSendTabFrFr._(_root);
	@override late final _StringsSettingsTabFrFr settingsTab = _StringsSettingsTabFrFr._(_root);
	@override late final _StringsTroubleshootPageFrFr troubleshootPage = _StringsTroubleshootPageFrFr._(_root);
	@override late final _StringsReceiveHistoryPageFrFr receiveHistoryPage = _StringsReceiveHistoryPageFrFr._(_root);
	@override late final _StringsApkPickerPageFrFr apkPickerPage = _StringsApkPickerPageFrFr._(_root);
	@override late final _StringsSelectedFilesPageFrFr selectedFilesPage = _StringsSelectedFilesPageFrFr._(_root);
	@override late final _StringsReceivePageFrFr receivePage = _StringsReceivePageFrFr._(_root);
	@override late final _StringsReceiveOptionsPageFrFr receiveOptionsPage = _StringsReceiveOptionsPageFrFr._(_root);
	@override late final _StringsSendPageFrFr sendPage = _StringsSendPageFrFr._(_root);
	@override late final _StringsProgressPageFrFr progressPage = _StringsProgressPageFrFr._(_root);
	@override late final _StringsWebSharePageFrFr webSharePage = _StringsWebSharePageFrFr._(_root);
	@override late final _StringsAboutPageFrFr aboutPage = _StringsAboutPageFrFr._(_root);
	@override late final _StringsChangelogPageFrFr changelogPage = _StringsChangelogPageFrFr._(_root);
	@override late final _StringsAliasGeneratorFrFr aliasGenerator = _StringsAliasGeneratorFrFr._(_root);
	@override late final _StringsDialogsFrFr dialogs = _StringsDialogsFrFr._(_root);
	@override late final _StringsTrayFrFr tray = _StringsTrayFrFr._(_root);
	@override late final _StringsWebFrFr web = _StringsWebFrFr._(_root);
	@override late final _StringsAssetPickerFrFr assetPicker = _StringsAssetPickerFrFr._(_root);
}

// Path: general
class _StringsGeneralFrFr extends _StringsGeneralEn {
	_StringsGeneralFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

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
class _StringsReceiveTabFrFr extends _StringsReceiveTabEn {
	_StringsReceiveTabFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recevoir';
	@override late final _StringsReceiveTabInfoBoxFrFr infoBox = _StringsReceiveTabInfoBoxFrFr._(_root);
}

// Path: sendTab
class _StringsSendTabFrFr extends _StringsSendTabEn {
	_StringsSendTabFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Envoyer';
	@override late final _StringsSendTabSelectionFrFr selection = _StringsSendTabSelectionFrFr._(_root);
	@override late final _StringsSendTabPickerFrFr picker = _StringsSendTabPickerFrFr._(_root);
	@override String get shareIntentInfo => 'Vous pouvez également utiliser la fonction "Partager" de votre appareil pour sélectionner des fichiers plus facilement.';
	@override String get nearbyDevices => 'Appareils à proximité';
	@override String get thisDevice => 'Cet Appareil';
	@override String get scan => 'Recherchez des appareils';
	@override String get sendMode => 'Mode envoi';
	@override late final _StringsSendTabSendModesFrFr sendModes = _StringsSendTabSendModesFrFr._(_root);
	@override String get sendModeHelp => 'Explication';
	@override String get help => 'Veuillez vous assurer que la cible souhaitée se trouve également dans le même réseau wifi.';
	@override String get placeItems => 'Placez des éléments à partager.';
}

// Path: settingsTab
class _StringsSettingsTabFrFr extends _StringsSettingsTabEn {
	_StringsSettingsTabFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override late final _StringsSettingsTabGeneralFrFr general = _StringsSettingsTabGeneralFrFr._(_root);
	@override late final _StringsSettingsTabReceiveFrFr receive = _StringsSettingsTabReceiveFrFr._(_root);
	@override late final _StringsSettingsTabNetworkFrFr network = _StringsSettingsTabNetworkFrFr._(_root);
	@override String get advancedSettings => 'Paramètres avancés';
}

// Path: troubleshootPage
class _StringsTroubleshootPageFrFr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dépannage';
	@override String get subTitle => 'Cette application ne marche pas comme vous l\'espérez? Vous pouvez ici trouver des solutions à des problèmes communs.';
	@override String get solution => 'Solution:';
	@override String get fixButton => 'Régler automatiquement';
	@override late final _StringsTroubleshootPageFirewallFrFr firewall = _StringsTroubleshootPageFirewallFrFr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionFrFr noConnection = _StringsTroubleshootPageNoConnectionFrFr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageFrFr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historique';
	@override String get openFolder => 'Ouvrir le dossier';
	@override String get deleteHistory => 'Supprimer l\'historique';
	@override String get empty => 'L\'historique est vide.';
	@override late final _StringsReceiveHistoryPageEntryActionsFrFr entryActions = _StringsReceiveHistoryPageEntryActionsFrFr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageFrFr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Application (APK)';
	@override String get excludeSystemApps => 'Exclure les applications système';
	@override String get excludeAppsWithoutLaunchIntent => 'Exclure les applications non-lançables';
	@override String apps({required Object n}) => '${n} Applications';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageFrFr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Tout supprimer';
}

// Path: receivePage
class _StringsReceivePageFrFr extends _StringsReceivePageEn {
	_StringsReceivePageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		one: 'veut vous envoyer un fichier.',
		other: 'veut vous envoyer ${n} fichiers.',
	);
	@override String get subTitleMessage => 'vous a envoyé un message :';
	@override String get subTitleLink => 'vous a envoyé un lien :';
	@override String get canceled => 'L\'expéditeur a annulé la demande.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageFrFr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Désactivé automatiquement car des dossiers sont présents.';
}

// Path: sendPage
class _StringsSendPageFrFr extends _StringsSendPageEn {
	_StringsSendPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'En attente d\'une réponse...';
	@override String get rejected => 'Le destinataire a rejeté la demande.';
	@override String get busy => 'Le destinataire est occupé avec une autre requête.';
}

// Path: progressPage
class _StringsProgressPageFrFr extends _StringsProgressPageEn {
	_StringsProgressPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Envoi de fichiers';
	@override String get titleReceiving => 'Réception des fichiers';
	@override String get savedToGallery => 'Sauvegardé dans Photos';
	@override late final _StringsProgressPageTotalFrFr total = _StringsProgressPageTotalFrFr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageFrFr extends _StringsWebSharePageEn {
	_StringsWebSharePageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

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
class _StringsAboutPageFrFr extends _StringsAboutPageEn {
	_StringsAboutPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A propos de LocalSend';
}

// Path: changelogPage
class _StringsChangelogPageFrFr extends _StringsChangelogPageEn {
	_StringsChangelogPageFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historique des mises à jour';
}

// Path: aliasGenerator
class _StringsAliasGeneratorFrFr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsFrFr extends _StringsDialogsEn {
	_StringsDialogsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileFrFr addFile = _StringsDialogsAddFileFrFr._(_root);
	@override late final _StringsDialogsAddressInputFrFr addressInput = _StringsDialogsAddressInputFrFr._(_root);
	@override late final _StringsDialogsCancelSessionFrFr cancelSession = _StringsDialogsCancelSessionFrFr._(_root);
	@override late final _StringsDialogsCannotOpenFileFrFr cannotOpenFile = _StringsDialogsCannotOpenFileFrFr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeFrFr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeFrFr._(_root);
	@override late final _StringsDialogsErrorDialogFrFr errorDialog = _StringsDialogsErrorDialogFrFr._(_root);
	@override late final _StringsDialogsFavoriteDialogFrFr favoriteDialog = _StringsDialogsFavoriteDialogFrFr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogFrFr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogFrFr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogFrFr favoriteEditDialog = _StringsDialogsFavoriteEditDialogFrFr._(_root);
	@override late final _StringsDialogsFileInfoFrFr fileInfo = _StringsDialogsFileInfoFrFr._(_root);
	@override late final _StringsDialogsFileNameInputFrFr fileNameInput = _StringsDialogsFileNameInputFrFr._(_root);
	@override late final _StringsDialogsHistoryClearDialogFrFr historyClearDialog = _StringsDialogsHistoryClearDialogFrFr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedFrFr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedFrFr._(_root);
	@override late final _StringsDialogsMessageInputFrFr messageInput = _StringsDialogsMessageInputFrFr._(_root);
	@override late final _StringsDialogsNoFilesFrFr noFiles = _StringsDialogsNoFilesFrFr._(_root);
	@override late final _StringsDialogsNoPermissionFrFr noPermission = _StringsDialogsNoPermissionFrFr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformFrFr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformFrFr._(_root);
	@override late final _StringsDialogsQrFrFr qr = _StringsDialogsQrFrFr._(_root);
	@override late final _StringsDialogsQuickActionsFrFr quickActions = _StringsDialogsQuickActionsFrFr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeFrFr quickSaveNotice = _StringsDialogsQuickSaveNoticeFrFr._(_root);
	@override late final _StringsDialogsSendModeHelpFrFr sendModeHelp = _StringsDialogsSendModeHelpFrFr._(_root);
}

// Path: tray
class _StringsTrayFrFr extends _StringsTrayEn {
	_StringsTrayFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Quitter LocalSend';
}

// Path: web
class _StringsWebFrFr extends _StringsWebEn {
	_StringsWebFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Rejeté';
	@override String get files => 'Fichiers';
	@override String get fileName => 'Nom du fichier';
	@override String get size => 'Taille';
}

// Path: assetPicker
class _StringsAssetPickerFrFr extends _StringsAssetPickerEn {
	_StringsAssetPickerFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

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
class _StringsReceiveTabInfoBoxFrFr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionFrFr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sélection';
	@override String files({required Object files}) => 'Fichiers: ${files}';
	@override String size({required Object size}) => 'Taille: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerFrFr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get file => 'Fichier';
	@override String get folder => 'Dossier';
	@override String get media => 'Média';
	@override String get text => 'Texte';
	@override String get app => 'Application';
	@override String get clipboard => 'Presse-papiers';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesFrFr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get single => 'Récipient unique';
	@override String get multiple => 'Récipients multiples';
	@override String get link => 'Partager via un lien';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralFrFr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Général';
	@override String get brightness => 'Luminosité';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsFrFr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsFrFr._(_root);
	@override String get color => 'Couleur';
	@override late final _StringsSettingsTabGeneralColorOptionsFrFr colorOptions = _StringsSettingsTabGeneralColorOptionsFrFr._(_root);
	@override String get language => 'Langue';
	@override late final _StringsSettingsTabGeneralLanguageOptionsFrFr languageOptions = _StringsSettingsTabGeneralLanguageOptionsFrFr._(_root);
	@override String get saveWindowPlacement => 'Quitter: Sauvegarder l\'emplacement de la fenêtre';
	@override String get minimizeToTray => 'Quitter : Réduire à la barre des tâches';
	@override String get launchAtStartup => 'Démarrage automatique : Après la connexion';
	@override String get launchMinimized => 'Démarrage automatique : Minimiser';
	@override String get animations => 'Animations';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveFrFr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reçu';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Destination';
	@override String get downloads => '(Téléchargements)';
	@override String get saveToGallery => 'Sauvegarder les médias dans la galerie';
	@override String get saveToHistory => 'Enregistrer dans l\'historique';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkFrFr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

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

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallFrFr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Cet appareil peut envoyer des fichiers à d\'autres appareils, mais d\'autres appareils ne peuvent pas en envoyer à cet appareil.';
	@override String solution({required Object port}) => 'Le problème est probablement dû à votre pare-feu. Vous pouvez le régler en autorisant les connections entrantes (UDP et TCP) sur le port ${port}.';
	@override String get openFirewall => 'Ouvrir le pare-feu';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionFrFr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Les deux appareils ne peuvent ni se trouver, ni partager des fichiers.';
	@override String get solution => 'Le problème existe-il des deux côtés? Si oui, vérifiez que les deux appareils sont connectés au même réseau wifi et qu\'ils partagent la même configuration (port, adresse multicast, chiffrement). Le wifi peut ne pas autoriser les communications entre appareils. Dans ce cas, l\'option doit être activée dans les paramètres du routeur.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsFrFr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get open => 'Ouvrir le fichier';
	@override String get info => 'Information';
	@override String get deleteFromHistory => 'Supprimer de l\'historique';
}

// Path: progressPage.total
class _StringsProgressPageTotalFrFr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleFrFr title = _StringsProgressPageTotalTitleFrFr._(_root);
	@override String count({required Object curr, required Object n}) => 'Fichiers: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Taille: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Vitesse: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileFrFr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajouter à la sélection';
	@override String get content => 'Que voulez-vous ajouter ?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputFrFr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrez l\'adresse';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Adresse IP';
	@override String get recentlyUsed => 'Récemment utilisé :';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionFrFr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Annuler le transfert de fichiers';
	@override String get content => 'Voulez-vous vraiment annuler le transfert de fichiers ?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileFrFr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ne peut pas ouvrir le fichier';
	@override String content({required Object file}) => 'Ne peut pas ouvrir "${file}". Ce fichier a-t-il été déplacé, renommé ou supprimé ?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeFrFr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffrement désactivé';
	@override String get content => 'La communication s\'effectue désormais via le protocole HTTP non crypté. Pour utiliser HTTPS, réactivez le chiffrement.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogFrFr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogFrFr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoris';
	@override String get noFavorites => 'Aucun appareil favori pour le moment.';
	@override String get addFavorite => 'Ajouter';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogFrFr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer des favoris';
	@override String content({required Object name}) => 'Voulez-vous vraiment supprimer "${name}" des favoris ?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogFrFr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Ajouter aux favoris';
	@override String get titleEdit => 'Ajuster';
	@override String get name => 'Alias';
	@override String get auto => '(automatique)';
	@override String get ip => 'Adresse IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoFrFr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations sur le fichier';
	@override String get fileName => 'Nom du fichier :';
	@override String get path => 'Chemin :';
	@override String get size => 'Taille :';
	@override String get sender => 'Éxpéditeur :';
	@override String get time => 'Temps :';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputFrFr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrez le nom du fichier';
	@override String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogFrFr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Effacer l\'historique';
	@override String get content => 'Voulez-vous vraiment effacer l\'historique entier?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedFrFr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend ne peut pas trouver d\'autres appareils sans la permission de scanner votre réseau local. Veuillez autoriser cette permission à LocalSend dans les paramètres.';
	@override String get gotoSettings => 'Paramètres';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputFrFr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tapez un message';
	@override String get multiline => 'Multiligne';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesFrFr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aucun fichier sélectionné';
	@override String get content => 'Veuillez sélectionner au moins un fichier.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionFrFr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pas la permission';
	@override String get content => 'Vous n\'avez pas accordé les autorisations nécessaires. Veuillez les accorder dans les paramètres.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformFrFr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Non disponible';
	@override String get content => 'Cette fonctionalité est disponible uniquement sur:';
}

// Path: dialogs.qr
class _StringsDialogsQrFrFr extends _StringsDialogsQrEn {
	_StringsDialogsQrFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsFrFr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actions Rapides';
	@override String get counter => 'Compteur';
	@override String get prefix => 'Préfixe';
	@override String get padZero => 'Remplir de zéros';
	@override String get sortBeforeCount => 'Trier préalablement par ordre alphabétique';
	@override String get random => 'Aléatoire';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeFrFr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Les demandes de fichiers sont automatiquement acceptées. Sachez que tous les membres du réseau local peuvent vous envoyer des fichiers.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpFrFr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modes d\'envoi';
	@override String get single => 'Envoyer des fichiers à un récipient. La sélection sera effacée une fois l\'envoi du fichier terminé.';
	@override String get multiple => 'Envoyer des fichiers à plusieurs récipients. La sélection ne sera pas effacée.';
	@override String get link => 'Les récipients n\'ayant pas LocalSend installé peuvent télécharger les fichiers sélectionnés en ouvrant le lien dans leur navigateur.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsFrFr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get dark => 'Sombre';
	@override String get light => 'Clair';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsFrFr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsFrFr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleFrFr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleFrFr._(_StringsFrFr root) : this._root = root, super._(root);

	@override final _StringsFrFr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Progression totale (${time})';
	@override String get finishedError => 'Terminé avec une erreur';
	@override String get canceledSender => 'Annulé par l\'expéditeur';
	@override String get canceledReceiver => 'Annulé par le destinataire';
}
