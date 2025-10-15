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
class TranslationsCs extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsCs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.cs,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <cs>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsCs _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Česky';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralCs general = _TranslationsGeneralCs._(_root);
  @override
  late final _TranslationsReceiveTabCs receiveTab = _TranslationsReceiveTabCs._(_root);
  @override
  late final _TranslationsSendTabCs sendTab = _TranslationsSendTabCs._(_root);
  @override
  late final _TranslationsSettingsTabCs settingsTab = _TranslationsSettingsTabCs._(_root);
  @override
  late final _TranslationsTroubleshootPageCs troubleshootPage = _TranslationsTroubleshootPageCs._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageCs networkInterfacesPage = _TranslationsNetworkInterfacesPageCs._(_root);
  @override
  late final _TranslationsReceiveHistoryPageCs receiveHistoryPage = _TranslationsReceiveHistoryPageCs._(_root);
  @override
  late final _TranslationsApkPickerPageCs apkPickerPage = _TranslationsApkPickerPageCs._(_root);
  @override
  late final _TranslationsSelectedFilesPageCs selectedFilesPage = _TranslationsSelectedFilesPageCs._(_root);
  @override
  late final _TranslationsReceivePageCs receivePage = _TranslationsReceivePageCs._(_root);
  @override
  late final _TranslationsReceiveOptionsPageCs receiveOptionsPage = _TranslationsReceiveOptionsPageCs._(_root);
  @override
  late final _TranslationsSendPageCs sendPage = _TranslationsSendPageCs._(_root);
  @override
  late final _TranslationsProgressPageCs progressPage = _TranslationsProgressPageCs._(_root);
  @override
  late final _TranslationsWebSharePageCs webSharePage = _TranslationsWebSharePageCs._(_root);
  @override
  late final _TranslationsAboutPageCs aboutPage = _TranslationsAboutPageCs._(_root);
  @override
  late final _TranslationsDonationPageCs donationPage = _TranslationsDonationPageCs._(_root);
  @override
  late final _TranslationsChangelogPageCs changelogPage = _TranslationsChangelogPageCs._(_root);
  @override
  late final _TranslationsAliasGeneratorCs aliasGenerator = _TranslationsAliasGeneratorCs._(_root);
  @override
  late final _TranslationsDialogsCs dialogs = _TranslationsDialogsCs._(_root);
  @override
  late final _TranslationsSanitizationCs sanitization = _TranslationsSanitizationCs._(_root);
  @override
  late final _TranslationsTrayCs tray = _TranslationsTrayCs._(_root);
  @override
  late final _TranslationsWebCs web = _TranslationsWebCs._(_root);
  @override
  late final _TranslationsAssetPickerCs assetPicker = _TranslationsAssetPickerCs._(_root);
}

// Path: general
class _TranslationsGeneralCs extends TranslationsGeneralEn {
  _TranslationsGeneralCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Přijmout';
  @override
  String get accepted => 'Přijato';
  @override
  String get add => 'Přidat';
  @override
  String get advanced => 'Pokročilé';
  @override
  String get cancel => 'Zrušit';
  @override
  String get close => 'Zavřít';
  @override
  String get confirm => 'Potvrdit';
  @override
  String get continueStr => 'Pokračovat';
  @override
  String get copy => 'Kopírovat';
  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';
  @override
  String get decline => 'Odmítnout';
  @override
  String get done => 'Hotovo';
  @override
  String get delete => 'Vymazat';
  @override
  String get edit => 'Upravit';
  @override
  String get error => 'Chyba';
  @override
  String get example => 'Příklad';
  @override
  String get files => 'Soubory';
  @override
  String get finished => 'Hotovo';
  @override
  String get hide => 'Skrýt';
  @override
  String get off => 'Vypnuto';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Zapnuto';
  @override
  String get online => 'Online';
  @override
  String get open => 'Otevřít';
  @override
  String get queue => 'Fronta';
  @override
  String get quickSave => 'Rychlé uložení';
  @override
  String get quickSaveFromFavorites => 'Rychlé uložení pro "Oblíbené"';
  @override
  String get renamed => 'Přejmenováno';
  @override
  String get reset => 'Resetovat';
  @override
  String get restart => 'Restartovat';
  @override
  String get settings => 'Nastavení';
  @override
  String get skipped => 'Přeskočeno';
  @override
  String get start => 'Spustit';
  @override
  String get stop => 'Zastavit';
  @override
  String get save => 'Uložit';
  @override
  String get unchanged => 'Nezměněno';
  @override
  String get unknown => 'Neznámý';
  @override
  String get noItemInClipboard => 'Žádná položka ve schránce';
}

// Path: receiveTab
class _TranslationsReceiveTabCs extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Příjmout';
  @override
  late final _TranslationsReceiveTabInfoBoxCs infoBox = _TranslationsReceiveTabInfoBoxCs._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveCs quickSave = _TranslationsReceiveTabQuickSaveCs._(_root);
}

// Path: sendTab
class _TranslationsSendTabCs extends TranslationsSendTabEn {
  _TranslationsSendTabCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odeslat';
  @override
  late final _TranslationsSendTabSelectionCs selection = _TranslationsSendTabSelectionCs._(_root);
  @override
  late final _TranslationsSendTabPickerCs picker = _TranslationsSendTabPickerCs._(_root);
  @override
  String get shareIntentInfo => 'Pro snazší výběr souborů můžete také použít funkci "Sdílet" svého mobilního zařízení.';
  @override
  String get nearbyDevices => 'Zařízení v okolí';
  @override
  String get thisDevice => 'Toto zařízení';
  @override
  String get scan => 'Hledat zařízení';
  @override
  String get manualSending => 'Manuální odeslání';
  @override
  String get sendMode => 'Režim odesílání';
  @override
  late final _TranslationsSendTabSendModesCs sendModes = _TranslationsSendTabSendModesCs._(_root);
  @override
  String get sendModeHelp => 'Vysvětlení';
  @override
  String get help => 'Ujistěte se, že se požadovaný cíl nachází ve stejné síti Wi-Fi.';
  @override
  String get placeItems => 'Vložte položky, které chcete sdílet.';
}

// Path: settingsTab
class _TranslationsSettingsTabCs extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nastavení';
  @override
  late final _TranslationsSettingsTabGeneralCs general = _TranslationsSettingsTabGeneralCs._(_root);
  @override
  late final _TranslationsSettingsTabReceiveCs receive = _TranslationsSettingsTabReceiveCs._(_root);
  @override
  late final _TranslationsSettingsTabSendCs send = _TranslationsSettingsTabSendCs._(_root);
  @override
  late final _TranslationsSettingsTabNetworkCs network = _TranslationsSettingsTabNetworkCs._(_root);
  @override
  late final _TranslationsSettingsTabOtherCs other = _TranslationsSettingsTabOtherCs._(_root);
  @override
  String get advancedSettings => 'Pokročilá nastavení';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageCs extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odstraňování problémů';
  @override
  String get subTitle => 'Tato aplikace nefunguje podle očekávání? Zde najdete častá řešení.';
  @override
  String get solution => 'Řešení:';
  @override
  String get fixButton => 'Opravit automaticky';
  @override
  late final _TranslationsTroubleshootPageFirewallCs firewall = _TranslationsTroubleshootPageFirewallCs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryCs noDiscovery = _TranslationsTroubleshootPageNoDiscoveryCs._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionCs noConnection = _TranslationsTroubleshootPageNoConnectionCs._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageCs extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Síťová rozhraní';
  @override
  String get info =>
      'Ve výchozím nastavení používá LocalSend všechna dostupná síťová rozhraní. Zde můžete vyloučit nežádoucí sítě. Chcete-li použít změny, musíte restartovat server.';
  @override
  String get preview => 'Náhled';
  @override
  String get whitelist => 'Seznam povolených';
  @override
  String get blacklist => 'Seznam zakázaných';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageCs extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historie';
  @override
  String get openFolder => 'Otevřít složku';
  @override
  String get deleteHistory => 'Smazat historii';
  @override
  String get empty => 'Historie je prázdná.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsCs entryActions = _TranslationsReceiveHistoryPageEntryActionsCs._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageCs extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikace (APK)';
  @override
  String get excludeSystemApps => 'Vyloučit systémové aplikace';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Vyloučit aplikace, které nelze spustit';
  @override
  String apps({required Object n}) => '${n} Aplikace';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageCs extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Smazat vše';
}

// Path: receivePage
class _TranslationsReceivePageCs extends TranslationsReceivePageEn {
  _TranslationsReceivePageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('cs'))(
    n,
    one: 'vám chce poslat soubor',
    other: 'vám chce poslat několik souborů: ${n}',
  );
  @override
  String get subTitleMessage => 'vám poslal zprávu:';
  @override
  String get subTitleLink => 'vám poslal odkaz:';
  @override
  String get canceled => 'Odesílatel zrušil požadavek.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageCs extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Možnosti';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automaticky vypnuto, protože existují adresáře.';
}

// Path: sendPage
class _TranslationsSendPageCs extends TranslationsSendPageEn {
  _TranslationsSendPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čekání na odpověď...';
  @override
  String get rejected => 'Příjemce žádost odmítl.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Příjemce je zaneprázdněn dalším požadavkem.';
}

// Path: progressPage
class _TranslationsProgressPageCs extends TranslationsProgressPageEn {
  _TranslationsProgressPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Odesílání souborů';
  @override
  String get titleReceiving => 'Přijímání souborů';
  @override
  String get savedToGallery => 'Uloženo ve Fotkách';
  @override
  late final _TranslationsProgressPageTotalCs total = _TranslationsProgressPageTotalCs._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageCs extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sdílet pomocí odkazu';
  @override
  String get loading => 'Spouštění serveru...';
  @override
  String get stopping => 'Zastavování serveru...';
  @override
  String get error => 'Při spouštění serveru došlo k chybě.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('cs'))(
    n,
    one: 'Otevřete tento odkaz v prohlížeči:',
    other: 'Otevřete v prohlížeči jeden z těchto odkazů:',
  );
  @override
  String get requests => 'Žádosti';
  @override
  String get noRequests => 'Zatím žádné žádosti.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automaticky přijímat žádosti';
  @override
  String get requirePin => 'Vyžadovat PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je "${pin}"';
  @override
  String get encryptionHint => 'LocalSend používá self-signed certifikát. Musíte ho přijmout ve vašem prohlížeči.';
  @override
  String pendingRequests({required Object n}) => 'Čekající žádosti: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageCs extends TranslationsAboutPageEn {
  _TranslationsAboutPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O aplikaci LocalSend';
  @override
  List<String> get description => [
    'LocalSend je bezplatná aplikace s otevřeným zdrojovým kódem, která vám umožňuje bezpečně sdílet soubory a zprávy s okolními zařízeními přes vaši místní síť, aniž byste potřebovali připojení k internetu.',
    'Tato aplikace je dostupná pro Android, iOS, macOS, Windows a Linux. Všechny možnosti stahování najdete na oficiální domovské stránce.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Přispěvatelé';
  @override
  String get packagers => 'Baliči';
  @override
  String get translators => 'Překladatelé';
}

// Path: donationPage
class _TranslationsDonationPageCs extends TranslationsDonationPageEn {
  _TranslationsDonationPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Darovat';
  @override
  String get info => 'LocalSend je zdarma, open source a bez reklam. Pokud se vám aplikace líbí, můžete její vývoj podpořit darem.';
  @override
  String donate({required Object amount}) => 'Darovat ${amount}';
  @override
  String get thanks => 'Děkuji mnohokrát!';
  @override
  String get restore => 'Obnovit';
}

// Path: changelogPage
class _TranslationsChangelogPageCs extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seznam změn';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorCs extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsCs extends TranslationsDialogsEn {
  _TranslationsDialogsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileCs addFile = _TranslationsDialogsAddFileCs._(_root);
  @override
  late final _TranslationsDialogsOpenFileCs openFile = _TranslationsDialogsOpenFileCs._(_root);
  @override
  late final _TranslationsDialogsAddressInputCs addressInput = _TranslationsDialogsAddressInputCs._(_root);
  @override
  late final _TranslationsDialogsCancelSessionCs cancelSession = _TranslationsDialogsCancelSessionCs._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileCs cannotOpenFile = _TranslationsDialogsCannotOpenFileCs._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeCs encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeCs._(_root);
  @override
  late final _TranslationsDialogsErrorDialogCs errorDialog = _TranslationsDialogsErrorDialogCs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogCs favoriteDialog = _TranslationsDialogsFavoriteDialogCs._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogCs favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogCs._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogCs favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogCs._(_root);
  @override
  late final _TranslationsDialogsFileInfoCs fileInfo = _TranslationsDialogsFileInfoCs._(_root);
  @override
  late final _TranslationsDialogsFileNameInputCs fileNameInput = _TranslationsDialogsFileNameInputCs._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogCs historyClearDialog = _TranslationsDialogsHistoryClearDialogCs._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedCs localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedCs._(_root);
  @override
  late final _TranslationsDialogsMessageInputCs messageInput = _TranslationsDialogsMessageInputCs._(_root);
  @override
  late final _TranslationsDialogsNoFilesCs noFiles = _TranslationsDialogsNoFilesCs._(_root);
  @override
  late final _TranslationsDialogsNoPermissionCs noPermission = _TranslationsDialogsNoPermissionCs._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformCs notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformCs._(_root);
  @override
  late final _TranslationsDialogsQrCs qr = _TranslationsDialogsQrCs._(_root);
  @override
  late final _TranslationsDialogsQuickActionsCs quickActions = _TranslationsDialogsQuickActionsCs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeCs quickSaveNotice = _TranslationsDialogsQuickSaveNoticeCs._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeCs quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeCs._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinCs pin = _TranslationsDialogsPinCs._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpCs sendModeHelp = _TranslationsDialogsSendModeHelpCs._(_root);
  @override
  late final _TranslationsDialogsZoomCs zoom = _TranslationsDialogsZoomCs._(_root);
}

// Path: sanitization
class _TranslationsSanitizationCs extends TranslationsSanitizationEn {
  _TranslationsSanitizationCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Název souboru nemůže být prázdný';
  @override
  String get invalid => 'Název souboru obsahuje neplatné znaky';
}

// Path: tray
class _TranslationsTrayCs extends TranslationsTrayEn {
  _TranslationsTrayCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Ukončit LocalSend';
  @override
  String get closeWindows => 'Konec';
}

// Path: web
class _TranslationsWebCs extends TranslationsWebEn {
  _TranslationsWebCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Vložit PIN';
  @override
  String get invalidPin => 'Neplatný PIN';
  @override
  String get tooManyAttempts => 'Příliš mnoho pokusů';
  @override
  String get rejected => 'Odmítnuto';
  @override
  String get files => 'Soubory';
  @override
  String get fileName => 'Název souboru';
  @override
  String get size => 'Velikost';
}

// Path: assetPicker
class _TranslationsAssetPickerCs extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potvrdit';
  @override
  String get cancel => 'Zrušit';
  @override
  String get edit => 'Editovat';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Načtení se nezdařilo';
  @override
  String get original => 'Původ';
  @override
  String get preview => 'Náhled';
  @override
  String get select => 'Vybrat';
  @override
  String get emptyList => 'Prázdný seznam';
  @override
  String get unSupportedAssetType => 'Nepodporovaný typ souboru.';
  @override
  String get unableToAccessAll => 'Nelze získat přístup ke všem souborům v zařízení';
  @override
  String get viewingLimitedAssetsTip => 'Zobrazit pouze soubory a alba, ke kterým má aplikace přístup.';
  @override
  String get changeAccessibleLimitedAssets => 'Kliknutím aktualizujete přístupné soubory';
  @override
  String get accessAllTip =>
      'Aplikace má přístup pouze k některým souborům v zařízení. Přejděte do nastavení systému a povolte aplikaci přístup ke všem médiím v zařízení.';
  @override
  String get goToSystemSettings => 'Přejít do nastavení systému';
  @override
  String get accessLimitedAssets => 'Pokračovat s omezeným přístupem';
  @override
  String get accessiblePathName => 'Přístupné soubory';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Obrázek';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Ostatní média';
  @override
  String get sActionPlayHint => 'přehrát';
  @override
  String get sActionPreviewHint => 'náhled';
  @override
  String get sActionSelectHint => 'vybrat';
  @override
  String get sActionSwitchPathLabel => 'změnit cestu';
  @override
  String get sActionUseCameraHint => 'použít kameru';
  @override
  String get sNameDurationLabel => 'doba trvání';
  @override
  String get sUnitAssetCountLabel => 'počet';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxCs extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveCs extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Oblíbené';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionCs extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vybrat';
  @override
  String files({required Object files}) => 'Soubory: ${files}';
  @override
  String size({required Object size}) => 'Velikost: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerCs extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Soubor';
  @override
  String get folder => 'Složka';
  @override
  String get media => 'Média';
  @override
  String get text => 'Text';
  @override
  String get app => 'Aplikace';
  @override
  String get clipboard => 'Vložit';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesCs extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Jediný příjemce';
  @override
  String get multiple => 'Více příjemců';
  @override
  String get link => 'Sdílet pomocí odkazu';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralCs extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Všeobecné';
  @override
  String get brightness => 'Motiv';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsCs brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsCs._(_root);
  @override
  String get color => 'Barva';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsCs colorOptions = _TranslationsSettingsTabGeneralColorOptionsCs._(_root);
  @override
  String get language => 'Jazyk';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsCs languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsCs._(_root);
  @override
  String get saveWindowPlacement => 'Při ukončení uložit umístění okna';
  @override
  String get saveWindowPlacementWindows => 'Uložit polohu okna po ukončení';
  @override
  String get minimizeToTray => 'Při ukončení minimalizovat do lišty';
  @override
  String get launchAtStartup => 'Automatické spuštění po přihlášení';
  @override
  String get launchMinimized => 'Automatické spuštění: skrytý start';
  @override
  String get showInContextMenu => 'Zobrazit LocalSend v kontextové nabídce';
  @override
  String get animations => 'Animace';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveCs extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Soubory';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatické dokončování';
  @override
  String get destination => 'Uložit do';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Uložit média do galerie';
  @override
  String get saveToHistory => 'Uložit do historie';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendCs extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Poslat';
  @override
  String get shareViaLinkAutoAccept => 'Automaticky přijímat požadavky v režimu "Sdílet přes odkaz".';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkCs extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Síť';
  @override
  String get needRestart => 'Chcete-li použít nastavení, restartujte server!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Typ zařízení';
  @override
  String get deviceModel => 'Model zařízení';
  @override
  String get port => 'Port';
  @override
  String get network => 'Síť';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsCs networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsCs._(_root);
  @override
  String get discoveryTimeout => 'Časový limit zjišťování';
  @override
  String get useSystemName => 'Použít název systému';
  @override
  String get generateRandomAlias => 'Generovat náhodný alias';
  @override
  String portWarning({required Object defaultPort}) =>
      'Je možné, že vás ostatní zařízení nezjistí, protože používáte vlastní port. (výchozí: ${defaultPort})';
  @override
  String get encryption => 'Šifrování';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Je možné, že vás ostatní zařízení nezjistí, protože používáte vlastní adresu vícesměrového vysílání. (výchozí: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherCs extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ostatní';
  @override
  String get support => 'Podpora LocalSend';
  @override
  String get donate => 'Darovat';
  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';
  @override
  String get termsOfUse => 'Podmínky použití';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallCs extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Tato aplikace může odesílat soubory do jiných zařízení, ale jiná zařízení nemohou odesílat soubory do tohoto zařízení.';
  @override
  String solution({required Object port}) =>
      'S největší pravděpodobností se jedná o problém s firewallem. Můžete to vyřešit povolením příchozích připojení (UDP a TCP) na portu ${port}.';
  @override
  String get openFirewallSettings => 'Otevřít bránu firewall';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryCs extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Toto zařízení nemůže zjistit jiná zařízení.';
  @override
  String get solution =>
      'Ujistěte se, že jsou všechna zařízení ve stejné síti Wi-Fi a sdílejí stejnou konfiguraci (port, adresa vícesměrového vysílání, šifrování). Můžete zkusit zadat IP adresu cílového zařízení ručně. Pokud to funguje, zvažte přidání tohoto zařízení do oblíbených, aby mohlo být v budoucnu automaticky objeveno.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionCs extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Obě zařízení se nemohou navzájem objevit ani nemohou sdílet soubory.';
  @override
  String get solution =>
      'Problém je na obou stranách? Pak se musíte ujistit, že jsou obě zařízení ve stejné wifi síti a sdílejí stejnou konfiguraci (port, multicastová adresa, šifrování). Wifi nemusí umožňovat komunikaci mezi účastníky. V takovém případě musí být tato možnost povolena na routeru.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsCs extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otevřít soubor';
  @override
  String get showInFolder => 'Zobrazit ve složce';
  @override
  String get info => 'Informace';
  @override
  String get deleteFromHistory => 'Smazat z historie';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalCs extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleCs title = _TranslationsProgressPageTotalTitleCs._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Soubory: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Velikost: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Rychlost: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileCs extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Přidat do výběru';
  @override
  String get content => 'Co chcete přidat?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileCs extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otevřít soubor';
  @override
  String get content => 'Chcete otevřít přijatý soubor?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputCs extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadat adresu';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Adresa';
  @override
  String get recentlyUsed => 'Nedávno použité: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionCs extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zrušit přenos souborů';
  @override
  String get content => 'Opravdu chcete zrušit přenos souborů?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileCs extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nelze otevřít soubor';
  @override
  String content({required Object file}) => 'Nelze otevřít "${file}". Byl tento soubor přesunut, přejmenován nebo smazán?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeCs extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifrování zakázáno';
  @override
  String get content => 'Komunikace nyní probíhá prostřednictvím nešifrovaného protokolu HTTP. Chcete-li použít HTTPS, znovu povolte šifrování.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogCs extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogCs extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Oblíbené';
  @override
  String get noFavorites => 'Zatím nemáte žádná oblíbená zařízení.';
  @override
  String get addFavorite => 'Přidat';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogCs extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Smazat z oblíbených';
  @override
  String content({required Object name}) => 'Opravdu chcete smazat "${name}" z oblíbených?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogCs extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Přidat k oblíbeným';
  @override
  String get titleEdit => 'Upravit';
  @override
  String get name => 'Název zařízení';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP adresa';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoCs extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informace o souboru';
  @override
  String get fileName => 'Název souboru:';
  @override
  String get path => 'Cesta:';
  @override
  String get size => 'Velikost:';
  @override
  String get sender => 'Odesílatel:';
  @override
  String get time => 'Čas:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputCs extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zadejte název souboru';
  @override
  String original({required Object original}) => 'Původní: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogCs extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Smazat historii';
  @override
  String get content => 'Opravdu chcete smazat celou historii?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedCs extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend nemůže najít jiná zařízení, aniž by měl oprávnění skenovat místní síť. Udělte prosím toto oprávnění v nastavení.';
  @override
  String get gotoSettings => 'Nastavení';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputCs extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Napište zprávu';
  @override
  String get multiline => 'Více řádků';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesCs extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Žádný soubor nevybrán';
  @override
  String get content => 'Vyberte prosím alespoň jeden soubor.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionCs extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Žádné oprávnění';
  @override
  String get content => 'Neposkytli jste potřebná oprávnění. Prosím, udělte je v nastavení.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformCs extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Není k dispozici';
  @override
  String get content => 'Tato funkce je dostupná pouze na:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrCs extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kód';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsCs extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rychlé akce';
  @override
  String get counter => 'Číslo';
  @override
  String get prefix => 'Předpona';
  @override
  String get padZero => 'Přidat nuly';
  @override
  String get sortBeforeCount => 'Nejprve seřadit abecedně';
  @override
  String get random => 'Náhodné jméno';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeCs extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Požadavky na soubor jsou automaticky přijímány. Uvědomte si, že každý v místní síti vám může posílat soubory.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeCs extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Žádosti o soubory jsou nyní přijímány automaticky ze zařízení ve vašem seznamu oblíbených.',
    'Upozornění: V současné době to není zcela bezpečné, protože hacker, který zná vaše oblíbené zařízení, vám stále může posílat soubory.',
    'Tato možnost je však stále bezpečnější než povolení libovolného zařízení.',
  ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinCs extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vložit PIN';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpCs extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Režimy odesílání';
  @override
  String get single => 'Odešle soubory jednomu příjemci. Po dokončení přenosu souboru bude výběr vymazán.';
  @override
  String get multiple => 'Odešle soubory více příjemcům. Výběr nebude vymazán.';
  @override
  String get link => 'Příjemci, kteří nemají nainstalovaný LocalSend, si mohou vybrané soubory stáhnout otevřením odkazu ve svém prohlížeči.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomCs extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsCs extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systém';
  @override
  String get dark => 'Tmavý';
  @override
  String get light => 'Světlý';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsCs extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systém';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsCs extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systém';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsCs extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Vše';
  @override
  String get filtered => 'Filtrované';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleCs extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleCs._(TranslationsCs root) : this._root = root, super.internal(root);

  final TranslationsCs _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Celkový průběh (${time})';
  @override
  String get finishedError => 'Dokončeno s chybou';
  @override
  String get canceledSender => 'Zrušeno odesílatelem';
  @override
  String get canceledReceiver => 'Zrušeno příjemcem';
}
