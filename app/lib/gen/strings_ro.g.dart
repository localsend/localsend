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
class TranslationsRo extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsRo({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ro,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ro>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsRo _root = this; // ignore: unused_field

  @override
  TranslationsRo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRo(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Română';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$ro general = _Translations$general$ro._(_root);
  @override
  late final _Translations$receiveTab$ro receiveTab = _Translations$receiveTab$ro._(_root);
  @override
  late final _Translations$sendTab$ro sendTab = _Translations$sendTab$ro._(_root);
  @override
  late final _Translations$settingsTab$ro settingsTab = _Translations$settingsTab$ro._(_root);
  @override
  late final _Translations$troubleshootPage$ro troubleshootPage = _Translations$troubleshootPage$ro._(_root);
  @override
  late final _Translations$receiveHistoryPage$ro receiveHistoryPage = _Translations$receiveHistoryPage$ro._(_root);
  @override
  late final _Translations$apkPickerPage$ro apkPickerPage = _Translations$apkPickerPage$ro._(_root);
  @override
  late final _Translations$selectedFilesPage$ro selectedFilesPage = _Translations$selectedFilesPage$ro._(_root);
  @override
  late final _Translations$receivePage$ro receivePage = _Translations$receivePage$ro._(_root);
  @override
  late final _Translations$receiveOptionsPage$ro receiveOptionsPage = _Translations$receiveOptionsPage$ro._(_root);
  @override
  late final _Translations$sendPage$ro sendPage = _Translations$sendPage$ro._(_root);
  @override
  late final _Translations$progressPage$ro progressPage = _Translations$progressPage$ro._(_root);
  @override
  late final _Translations$webSharePage$ro webSharePage = _Translations$webSharePage$ro._(_root);
  @override
  late final _Translations$aboutPage$ro aboutPage = _Translations$aboutPage$ro._(_root);
  @override
  late final _Translations$donationPage$ro donationPage = _Translations$donationPage$ro._(_root);
  @override
  late final _Translations$changelogPage$ro changelogPage = _Translations$changelogPage$ro._(_root);
  @override
  late final _Translations$aliasGenerator$ro aliasGenerator = _Translations$aliasGenerator$ro._(_root);
  @override
  late final _Translations$dialogs$ro dialogs = _Translations$dialogs$ro._(_root);
  @override
  late final _Translations$sanitization$ro sanitization = _Translations$sanitization$ro._(_root);
  @override
  late final _Translations$tray$ro tray = _Translations$tray$ro._(_root);
  @override
  late final _Translations$web$ro web = _Translations$web$ro._(_root);
  @override
  late final _Translations$assetPicker$ro assetPicker = _Translations$assetPicker$ro._(_root);
  @override
  late final _Translations$networkInterfacesPage$ro networkInterfacesPage = _Translations$networkInterfacesPage$ro._(_root);
}

// Path: general
class _Translations$general$ro extends Translations$general$en {
  _Translations$general$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Acceptă';
  @override
  String get accepted => 'Acceptat';
  @override
  String get add => 'Adaugă';
  @override
  String get advanced => 'Avansat';
  @override
  String get cancel => 'Anulare';
  @override
  String get close => 'Închide';
  @override
  String get confirm => 'Confirmă';
  @override
  String get continueStr => 'Continuă';
  @override
  String get copy => 'Copiază';
  @override
  String get copiedToClipboard => 'Copiat în Clipboard';
  @override
  String get decline => 'Respinge';
  @override
  String get done => 'Finalizat';
  @override
  String get delete => 'Șterge';
  @override
  String get edit => 'Editează';
  @override
  String get error => 'Eroare';
  @override
  String get example => 'Exemplu';
  @override
  String get files => 'Fișiere';
  @override
  String get finished => 'Finalizat';
  @override
  String get hide => 'Ascunde';
  @override
  String get off => 'Oprit';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Pornit';
  @override
  String get online => 'Online';
  @override
  String get open => 'Deschide';
  @override
  String get queue => 'Coadă';
  @override
  String get quickSave => 'Salvare rapidă';
  @override
  String get quickSaveFromFavorites => 'Salvare rapidă pentru "Favorite"';
  @override
  String get renamed => 'Redenumit';
  @override
  String get reset => 'Anulează modificările';
  @override
  String get restart => 'Repornire';
  @override
  String get settings => 'Setări';
  @override
  String get skipped => 'Omis';
  @override
  String get start => 'Pornește';
  @override
  String get stop => 'Oprește';
  @override
  String get save => 'Salvează';
  @override
  String get unchanged => 'Neschimbat';
  @override
  String get unknown => 'Necunoscut';
  @override
  String get noItemInClipboard => 'Fără elemente în clipboard.';
}

// Path: receiveTab
class _Translations$receiveTab$ro extends Translations$receiveTab$en {
  _Translations$receiveTab$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primire';
  @override
  late final _Translations$receiveTab$infoBox$ro infoBox = _Translations$receiveTab$infoBox$ro._(_root);
  @override
  late final _Translations$receiveTab$quickSave$ro quickSave = _Translations$receiveTab$quickSave$ro._(_root);
}

// Path: sendTab
class _Translations$sendTab$ro extends Translations$sendTab$en {
  _Translations$sendTab$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Trimite';
  @override
  late final _Translations$sendTab$selection$ro selection = _Translations$sendTab$selection$ro._(_root);
  @override
  late final _Translations$sendTab$picker$ro picker = _Translations$sendTab$picker$ro._(_root);
  @override
  String get shareIntentInfo => 'Poți utiliza, de asemenea, funcția „Partajare” a dispozitivului pentru a selecta mai ușor fișierele.';
  @override
  String get nearbyDevices => 'Dispozitive din apropiere';
  @override
  String get thisDevice => 'Acest dispozitiv';
  @override
  String get scan => 'Caută dispozitive';
  @override
  String get manualSending => 'Trimitere manuală';
  @override
  String get sendMode => 'Mod de trimitere';
  @override
  late final _Translations$sendTab$sendModes$ro sendModes = _Translations$sendTab$sendModes$ro._(_root);
  @override
  String get sendModeHelp => 'Explicație';
  @override
  String get help => 'Verifică dacă destinația se află în aceeași rețea Wi-Fi.';
  @override
  String get placeItems => 'Adaugă elemente pentru a partaja.';
}

// Path: settingsTab
class _Translations$settingsTab$ro extends Translations$settingsTab$en {
  _Translations$settingsTab$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Setări';
  @override
  late final _Translations$settingsTab$general$ro general = _Translations$settingsTab$general$ro._(_root);
  @override
  late final _Translations$settingsTab$receive$ro receive = _Translations$settingsTab$receive$ro._(_root);
  @override
  late final _Translations$settingsTab$send$ro send = _Translations$settingsTab$send$ro._(_root);
  @override
  late final _Translations$settingsTab$network$ro network = _Translations$settingsTab$network$ro._(_root);
  @override
  late final _Translations$settingsTab$other$ro other = _Translations$settingsTab$other$ro._(_root);
  @override
  String get advancedSettings => 'Setări avansate';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$ro extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Depanare';
  @override
  String get subTitle => 'Aplicația nu funcționează așa cum trebuie? Aici poți găsi câteva soluții comune.';
  @override
  String get solution => 'Soluția:';
  @override
  String get fixButton => 'Repară automat';
  @override
  late final _Translations$troubleshootPage$firewall$ro firewall = _Translations$troubleshootPage$firewall$ro._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$ro noDiscovery = _Translations$troubleshootPage$noDiscovery$ro._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$ro noConnection = _Translations$troubleshootPage$noConnection$ro._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$ro extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Istoric';
  @override
  String get openFolder => 'Deschide dosarul';
  @override
  String get deleteHistory => 'Șterge istoricul';
  @override
  String get empty => 'Istoricul este gol.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$ro entryActions = _Translations$receiveHistoryPage$entryActions$ro._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$ro extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplicații (APK)';
  @override
  String get excludeSystemApps => 'Exclude aplicațiile de sistem';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Exclude aplicațiile nelansabile';
  @override
  String apps({required Object n}) => '${n} Aplicații';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$ro extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Șterge tot';
}

// Path: receivePage
class _Translations$receivePage$ro extends Translations$receivePage$en {
  _Translations$receivePage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(
    n,
    one: 'vrea să îți trimită un fișier',
    other: 'vrea să îți trimită ${n} fișiere',
  );
  @override
  String get subTitleMessage => 'ți-a trimis un mesaj:';
  @override
  String get subTitleLink => 'ți-a trimis un link:';
  @override
  String get canceled => 'Expeditorul a anulat cererea.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$ro extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opțiuni';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Dosarul LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Dezactivat automat deoarece există foldere.';
}

// Path: sendPage
class _Translations$sendPage$ro extends Translations$sendPage$en {
  _Translations$sendPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Așteptare răspuns…';
  @override
  String get rejected => 'Destinatarul a respins cererea.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Destinatarul este ocupat cu o altă cerere.';
}

// Path: progressPage
class _Translations$progressPage$ro extends Translations$progressPage$en {
  _Translations$progressPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Trimitere fișiere';
  @override
  String get titleReceiving => 'Primire fișiere';
  @override
  String get savedToGallery => 'Salvat în Galerie';
  @override
  late final _Translations$progressPage$total$ro total = _Translations$progressPage$total$ro._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$ro extends Translations$webSharePage$en {
  _Translations$webSharePage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Partajează prin link';
  @override
  String get loading => 'Pornirea serverului…';
  @override
  String get stopping => 'Oprirea serverului…';
  @override
  String get error => 'A apărut o eroare la pornirea serverului.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(
    n,
    one: 'Deschide acest link în browserul tău:',
    other: 'Deschide unul dintre aceste linkuri în browserul tău:',
  );
  @override
  String get requests => 'Cereri';
  @override
  String get noRequests => 'Nicio cerere încă.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Acceptă automat cererile';
  @override
  String get requirePin => 'Solicită PIN';
  @override
  String pinHint({required Object pin}) => 'PIN-ul este "${pin}"';
  @override
  String get encryptionHint => 'LocalSend folosește un certificat auto-semnat. Trebuie să-l accepți în browserul tău.';
  @override
  String pendingRequests({required Object n}) => 'Cereri în așteptare: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$ro extends Translations$aboutPage$en {
  _Translations$aboutPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Despre LocalSend';
  @override
  List<String> get description => [
    'LocalSend este o aplicație gratuită și open-source care îți permite să partajezi în siguranță fișiere și mesaje cu dispozitivele din apropiere prin rețeaua ta locală, fără a avea nevoie de o conexiune la internet.',
    'Această aplicație este disponibilă pe Android, iOS, macOS, Windows și Linux. Poți găsi toate opțiunile de descărcare pe pagina oficială.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Contribuitori';
  @override
  String get packagers => 'Pachetari';
  @override
  String get translators => 'Traducători';
}

// Path: donationPage
class _Translations$donationPage$ro extends Translations$donationPage$en {
  _Translations$donationPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donează';
  @override
  String get info => 'LocalSend este gratuit, open-source și fără reclame. Dacă îți place aplicația, poți susține dezvoltarea cu o donație.';
  @override
  String donate({required Object amount}) => 'Donează ${amount}';
  @override
  String get thanks => 'Îți mulțumim foarte mult!';
  @override
  String get restore => 'Restabilește achiziția';
}

// Path: changelogPage
class _Translations$changelogPage$ro extends Translations$changelogPage$en {
  _Translations$changelogPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Schimbări';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$ro extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Adorabilă',
    'Frumoasă',
    'Mare',
    'Strălucitoare',
    'Curată',
    'Deșteaptă',
    'Cool',
    'Drăguță',
    'Vicleană',
    'Determinantă',
    'Energică',
    'Eficientă',
    'Fantastică',
    'Repede',
    'Bine',
    'Sănătoasă',
    'Proaspătă',
    'Bună',
    'Superbă',
    'Grozavă',
    'Coaptă',
    'Fierbinte',
    'Amabilă',
    'Iubitoare',
    'Mistică',
    'îngrijită',
    'Plăcută',
    'Răbdătoare',
    'Frumușică',
    'Puternică',
    'Delicioasă',
    'Secretă',
    'Inteligentă',
    'Solidă',
    'Specială',
    'Strategică',
    'Aromată',
    'Înțeleaptă',
  ];
  @override
  List<String> get fruits => [
    'Caisă',
    'Gutuie',
    'Banană',
    'Mură',
    'Nucă',
    'Afină',
    'Vișină',
    'Cireașă',
    'Lămâie',
    'Salată',
    'Fasole',
    'Conopidă',
    'Ciupercă',
    'Ceapă',
    'Portocală',
    'Piersică',
    'Pară',
    'Varză',
    'Mazăre',
    'Prună',
    'Rodie',
    'Zmeură',
    'Căpșună',
    'Roșie',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object fruit, required Object adjective}) => '${fruit} ${adjective}';
}

// Path: dialogs
class _Translations$dialogs$ro extends Translations$dialogs$en {
  _Translations$dialogs$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$ro addFile = _Translations$dialogs$addFile$ro._(_root);
  @override
  late final _Translations$dialogs$openFile$ro openFile = _Translations$dialogs$openFile$ro._(_root);
  @override
  late final _Translations$dialogs$addressInput$ro addressInput = _Translations$dialogs$addressInput$ro._(_root);
  @override
  late final _Translations$dialogs$cancelSession$ro cancelSession = _Translations$dialogs$cancelSession$ro._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$ro cannotOpenFile = _Translations$dialogs$cannotOpenFile$ro._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$ro encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$ro._(_root);
  @override
  late final _Translations$dialogs$errorDialog$ro errorDialog = _Translations$dialogs$errorDialog$ro._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$ro favoriteDialog = _Translations$dialogs$favoriteDialog$ro._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$ro favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$ro._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$ro favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$ro._(_root);
  @override
  late final _Translations$dialogs$fileInfo$ro fileInfo = _Translations$dialogs$fileInfo$ro._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$ro fileNameInput = _Translations$dialogs$fileNameInput$ro._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$ro historyClearDialog = _Translations$dialogs$historyClearDialog$ro._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$ro localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$ro._(_root);
  @override
  late final _Translations$dialogs$messageInput$ro messageInput = _Translations$dialogs$messageInput$ro._(_root);
  @override
  late final _Translations$dialogs$noFiles$ro noFiles = _Translations$dialogs$noFiles$ro._(_root);
  @override
  late final _Translations$dialogs$noPermission$ro noPermission = _Translations$dialogs$noPermission$ro._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$ro notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$ro._(_root);
  @override
  late final _Translations$dialogs$qr$ro qr = _Translations$dialogs$qr$ro._(_root);
  @override
  late final _Translations$dialogs$quickActions$ro quickActions = _Translations$dialogs$quickActions$ro._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$ro quickSaveNotice = _Translations$dialogs$quickSaveNotice$ro._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$ro quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$ro._(_root);
  @override
  late final _Translations$dialogs$pin$ro pin = _Translations$dialogs$pin$ro._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$ro sendModeHelp = _Translations$dialogs$sendModeHelp$ro._(_root);
  @override
  late final _Translations$dialogs$zoom$ro zoom = _Translations$dialogs$zoom$ro._(_root);
}

// Path: sanitization
class _Translations$sanitization$ro extends Translations$sanitization$en {
  _Translations$sanitization$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Numele fișierului nu poate fi gol';
  @override
  String get invalid => 'Numele fișierului conține caractere greșite';
}

// Path: tray
class _Translations$tray$ro extends Translations$tray$en {
  _Translations$tray$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Închide LocalSend';
  @override
  String get closeWindows => 'Ieșire';
}

// Path: web
class _Translations$web$ro extends Translations$web$en {
  _Translations$web$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Introdu codul PIN';
  @override
  String get invalidPin => 'Codul PIN introdus este greșit';
  @override
  String get tooManyAttempts => 'Prea multe încercări';
  @override
  String get rejected => 'Respins';
  @override
  String get files => 'Fișiere';
  @override
  String get fileName => 'Numele fișierului';
  @override
  String get size => 'Dimensiune';
}

// Path: assetPicker
class _Translations$assetPicker$ro extends Translations$assetPicker$en {
  _Translations$assetPicker$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Confirmă';
  @override
  String get cancel => 'Anulează';
  @override
  String get edit => 'Editează';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Eroare la încărcare';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Previzualizare';
  @override
  String get select => 'Selectează';
  @override
  String get emptyList => 'Listă goală';
  @override
  String get unSupportedAssetType => 'Tip de fișier neacceptat.';
  @override
  String get unableToAccessAll => 'Nu se pot accesa toate fișierele de pe dispozitiv';
  @override
  String get viewingLimitedAssetsTip => 'Aplicația poate vizualiza doar fișiere și albume la care are acces.';
  @override
  String get changeAccessibleLimitedAssets => 'Apasă pentru a actualiza fișierele accesibile';
  @override
  String get accessAllTip =>
      'Aplicația are acces doar la unele fișiere de pe dispozitiv. Accesează setările de sistem și permite aplicației să acceseze toate fișierele media de pe dispozitiv.';
  @override
  String get goToSystemSettings => 'Accesează setările sistemului';
  @override
  String get accessLimitedAssets => 'Continuă cu acces limitat';
  @override
  String get accessiblePathName => 'Fișiere accesibile';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Imagini';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Alte fișiere media';
  @override
  String get sActionPlayHint => 'redare';
  @override
  String get sActionPreviewHint => 'previzualizare';
  @override
  String get sActionSelectHint => 'selectează';
  @override
  String get sActionSwitchPathLabel => 'schimbă calea';
  @override
  String get sActionUseCameraHint => 'folosește camera';
  @override
  String get sNameDurationLabel => 'durată';
  @override
  String get sUnitAssetCountLabel => 'cantitate';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$ro extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Interfețe de rețea';
  @override
  String get info =>
      'În mod implicit, LocalSend folosește toate interfețele de rețea disponibile. Poți exclude rețelele nedorite aici. Trebuie să repornești serverul pentru a aplica modificările.';
  @override
  String get preview => 'Previzualizare';
  @override
  String get whitelist => 'Lista albă';
  @override
  String get blacklist => 'Lista neagră';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$ro extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Nume dispozitivului:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$ro extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favorite';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$ro extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selecție';
  @override
  String files({required Object files}) => 'Fișiere: ${files}';
  @override
  String size({required Object size}) => 'Dimensiune: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$ro extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fișier';
  @override
  String get folder => 'Dosar';
  @override
  String get media => 'Media';
  @override
  String get text => 'Text';
  @override
  String get app => 'Aplicație';
  @override
  String get clipboard => 'Lipește';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$ro extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Un singur destinatar';
  @override
  String get multiple => 'Mai mulți destinatari';
  @override
  String get link => 'Partajează prin link';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$ro extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'General';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$ro brightnessOptions = _Translations$settingsTab$general$brightnessOptions$ro._(
    _root,
  );
  @override
  String get color => 'Culoare';
  @override
  late final _Translations$settingsTab$general$colorOptions$ro colorOptions = _Translations$settingsTab$general$colorOptions$ro._(_root);
  @override
  String get language => 'Limba';
  @override
  late final _Translations$settingsTab$general$languageOptions$ro languageOptions = _Translations$settingsTab$general$languageOptions$ro._(_root);
  @override
  String get saveWindowPlacement => 'Reține locația ferestrei după ieșire';
  @override
  String get saveWindowPlacementWindows => 'Salvarea poziției ferestrei după închidere';
  @override
  String get minimizeToTray => 'Minimizează în Bara de Meniuri/Tray la închidere';
  @override
  String get launchAtStartup => 'Pornire automată după autentificare';
  @override
  String get launchMinimized => 'Autopornire: Pornire ascunsă';
  @override
  String get showInContextMenu => 'Afișează LocalSend în meniul contextual';
  @override
  String get animations => 'Animații';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$ro extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primire';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Finisare automată';
  @override
  String get destination => 'Salvează în dosar';
  @override
  String get downloads => '(Descărcări)';
  @override
  String get saveToGallery => 'Salvează media în galerie';
  @override
  String get saveToHistory => 'Salvează în istoric';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$ro extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Trimite';
  @override
  String get shareViaLinkAutoAccept => 'Acceptă automat cererile în modul „Partajare prin link”';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$ro extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rețea';
  @override
  String get needRestart => 'Repornește serverul pentru a aplica setările!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Nume dispozitiv';
  @override
  String get deviceType => 'Tip dispozitiv';
  @override
  String get deviceModel => 'Model dispozitiv';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Expirare descoperire';
  @override
  String get useSystemName => 'Folosește numele sistemului';
  @override
  String get generateRandomAlias => 'Generează alias aleatoriu';
  @override
  String portWarning({required Object defaultPort}) =>
      'Este posibil să nu fii detectat de alte dispozitive pentru că folosești un port personalizat. (implicit: ${defaultPort})';
  @override
  String get encryption => 'Criptare';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Este posibil să nu fii detectat de alte dispozitive pentru că folosești o adresă multicast personalizată. (implicit: ${defaultMulticast})';
  @override
  late final _Translations$settingsTab$network$networkOptions$ro networkOptions = _Translations$settingsTab$network$networkOptions$ro._(_root);
  @override
  String get network => 'Rețea';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$ro extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Altele';
  @override
  String get support => 'Susține LocalSend';
  @override
  String get donate => 'Donează';
  @override
  String get privacyPolicy => 'Politica de confidențialitate';
  @override
  String get termsOfUse => 'Termeni de utilizare';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$ro extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Această aplicație poate trimite fișiere la alte dispozitive, dar alte dispozitive nu pot trimite fișiere de pe acest dispozitiv.';
  @override
  String solution({required Object port}) =>
      'Cel mai probabil problema este de la firewall. Poți rezolva această problemă permițând conexiunile de intrare (UDP și TCP) pe portul ${port}.';
  @override
  String get openFirewall => 'Deschide Firewall';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$ro extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Acest dispozitiv nu poate descoperi alte dispozitive.';
  @override
  String get solution =>
      'Asigură-te că toate dispozitivele sunt pe aceeași rețea Wi-Fi și au aceeași configurație (port, adresă de multicast, criptare). Poți încerca să scrii manual adresa IP pe dispozitivul ales. Dacă merge, consideră să adaugi dispozitivul la favorite ca să fie găsit automat în viitor.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$ro extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ambele dispozitive nu se pot descoperi și nu pot partaja fișiere.';
  @override
  String get solution =>
      'Problema există de ambele părți? Dacă da, trebuie să te asiguri că ambele dispozitive se află în aceeași rețea Wi-Fi și au aceeași configurație (port, adresă multicast, criptare). Este posibil ca rețeaua să nu permită comunicarea între participanți. În acest caz, această opțiune trebuie să fie activată pe router.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$ro extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Deschide fișierul';
  @override
  String get showInFolder => 'Afișează în dosar';
  @override
  String get info => 'Informații';
  @override
  String get deleteFromHistory => 'Șterge din istoric';
}

// Path: progressPage.total
class _Translations$progressPage$total$ro extends Translations$progressPage$total$en {
  _Translations$progressPage$total$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$ro title = _Translations$progressPage$total$title$ro._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fișiere: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Dimensiune: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Viteză: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$ro extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adaugă la selecție';
  @override
  String get content => 'Ce vrei să adaugi?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$ro extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Deschide fișierul';
  @override
  String get content => 'Vrei să deschizi fișierul primit?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$ro extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introdu adresa';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Adresă IP';
  @override
  String get recentlyUsed => 'Folosit recent: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$ro extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Anulează trimiterea fișierelor';
  @override
  String get content => 'Chiar vrei să anulezi transferul fișierelor?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$ro extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nu se poate deschide fișierul';
  @override
  String content({required Object file}) => 'Nu s-a putut deschide \"${file}\". A fost mutat, redenumit sau șters?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$ro extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Criptare dezactivată';
  @override
  String get content => 'Comunicarea are loc acum prin protocolul HTTP necriptat. Pentru a folosi HTTPS, activează din nou criptarea.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$ro extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$ro extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorite';
  @override
  String get noFavorites => 'Încă nu sunt dispozitive favorite.';
  @override
  String get addFavorite => 'Adaugă';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$ro extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Șterge din favorite';
  @override
  String content({required Object name}) => 'Sigur vrei să ștergi din favorite "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$ro extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Adaugă la favorite';
  @override
  String get titleEdit => 'Setări';
  @override
  String get name => 'Numele dispozitivului';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Adresă IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$ro extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informații despre fișier';
  @override
  String get fileName => 'Numele fișierului:';
  @override
  String get path => 'Calea:';
  @override
  String get size => 'Dimensiune:';
  @override
  String get sender => 'Expeditor:';
  @override
  String get time => 'Timp:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$ro extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introdu numele fișierului';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$ro extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Golește istoricul';
  @override
  String get content => 'Sigur vrei să golești întregul istoric?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$ro extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend nu poate găsi alte dispozitive fără permisiunea de a scana rețeaua locală. Acordă această permisiune în setări.';
  @override
  String get gotoSettings => 'Setări';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$ro extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Scrie un mesaj';
  @override
  String get multiline => 'Multi-linie';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$ro extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Niciun fișier selectat';
  @override
  String get content => 'Selectează cel puțin un fișier.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$ro extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fără permisiune';
  @override
  String get content => 'Nu ai acordat permisiunile necesare. Acordă-le în setări.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$ro extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nu este disponibil';
  @override
  String get content => 'Această funcție este disponibilă doar pe:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$ro extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cod QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$ro extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Acțiuni rapide';
  @override
  String get counter => 'Contor';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Completează cu zerouri';
  @override
  String get sortBeforeCount => 'Sortează alfabetic înainte';
  @override
  String get random => 'Aleatoriu';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$ro extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Cererile de fișiere sunt acceptate automat. Fii atent oricine din rețeaua locală îți poate trimite fișiere.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$ro extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Cererile de fișiere sunt acum acceptate automat de la dispozitivele din lista dispozitivelor favorite.',
    'Atenție! În prezent, aceasta nu este complet securizată, deoarece un hacker care are amprente pe oricare dintre dispozitivele din lista ta de favorite poate trimite fișiere fără restricții.',
    'Oricum ar fi, această opțiune este mult mai sigură decât să permiți utilizatorilor din rețeaua locală să trimită fișiere fără restricții.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$ro extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Introdu codul PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$ro extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Moduri de trimitere';
  @override
  String get single => 'Trimite fișiere unui singur destinatar. Selecția va fi golită după ce transferul este finalizat.';
  @override
  String get multiple => 'Trimite fișiere la mai mulți destinatari. Selecția nu va fi ștearsă după transferul de fișiere terminate.';
  @override
  String get link => 'Destinatarii care nu au LocalSend instalat pot descărca fișierele selectate prin deschiderea linkului în browserul lor.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$ro extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$ro extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Întuneric';
  @override
  String get light => 'Luminoasă';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$ro extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$ro extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$ro extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Toate';
  @override
  String get filtered => 'Filtrat';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$ro extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$ro._(TranslationsRo root) : this._root = root, super.internal(root);

  final TranslationsRo _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Progres total (${time})';
  @override
  String get finishedError => 'Finalizat cu eroare';
  @override
  String get canceledSender => 'Anulat de expeditor';
  @override
  String get canceledReceiver => 'Anulat de către destinatar';
}
