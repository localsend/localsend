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
class TranslationsEu extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEu({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.eu,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <eu>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsEu _root = this; // ignore: unused_field

  @override
  TranslationsEu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$eu general = _Translations$general$eu._(_root);
  @override
  late final _Translations$receiveTab$eu receiveTab = _Translations$receiveTab$eu._(_root);
  @override
  late final _Translations$sendTab$eu sendTab = _Translations$sendTab$eu._(_root);
  @override
  late final _Translations$settingsTab$eu settingsTab = _Translations$settingsTab$eu._(_root);
  @override
  late final _Translations$troubleshootPage$eu troubleshootPage = _Translations$troubleshootPage$eu._(_root);
  @override
  late final _Translations$networkInterfacesPage$eu networkInterfacesPage = _Translations$networkInterfacesPage$eu._(_root);
  @override
  late final _Translations$receiveHistoryPage$eu receiveHistoryPage = _Translations$receiveHistoryPage$eu._(_root);
  @override
  late final _Translations$apkPickerPage$eu apkPickerPage = _Translations$apkPickerPage$eu._(_root);
  @override
  late final _Translations$selectedFilesPage$eu selectedFilesPage = _Translations$selectedFilesPage$eu._(_root);
  @override
  late final _Translations$deviceDetailsPage$eu deviceDetailsPage = _Translations$deviceDetailsPage$eu._(_root);
  @override
  late final _Translations$verifyPage$eu verifyPage = _Translations$verifyPage$eu._(_root);
  @override
  late final _Translations$receivePage$eu receivePage = _Translations$receivePage$eu._(_root);
  @override
  late final _Translations$receiveOptionsPage$eu receiveOptionsPage = _Translations$receiveOptionsPage$eu._(_root);
  @override
  late final _Translations$sendPage$eu sendPage = _Translations$sendPage$eu._(_root);
  @override
  late final _Translations$progressPage$eu progressPage = _Translations$progressPage$eu._(_root);
  @override
  late final _Translations$webSharePage$eu webSharePage = _Translations$webSharePage$eu._(_root);
  @override
  late final _Translations$webReceivePage$eu webReceivePage = _Translations$webReceivePage$eu._(_root);
  @override
  late final _Translations$aboutPage$eu aboutPage = _Translations$aboutPage$eu._(_root);
  @override
  late final _Translations$donationPage$eu donationPage = _Translations$donationPage$eu._(_root);
  @override
  late final _Translations$changelogPage$eu changelogPage = _Translations$changelogPage$eu._(_root);
  @override
  late final _Translations$whatsNewPage$eu whatsNewPage = _Translations$whatsNewPage$eu._(_root);
  @override
  late final _Translations$dialogs$eu dialogs = _Translations$dialogs$eu._(_root);
  @override
  late final _Translations$sanitization$eu sanitization = _Translations$sanitization$eu._(_root);
  @override
  late final _Translations$tray$eu tray = _Translations$tray$eu._(_root);
  @override
  late final _Translations$web$eu web = _Translations$web$eu._(_root);
  @override
  late final _Translations$assetPicker$eu assetPicker = _Translations$assetPicker$eu._(_root);
}

// Path: general
class _Translations$general$eu extends Translations$general$en {
  _Translations$general$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Onartu';
  @override
  String get accepted => 'Onartuta';
  @override
  String get add => 'Gehitu';
  @override
  String get advanced => 'Aurreratua';
  @override
  String get cancel => 'Utzi';
  @override
  String get close => 'Itxi';
  @override
  String get confirm => 'Baieztatu';
  @override
  String get continueStr => 'Jarraitu';
  @override
  String get copy => 'Kopiatu';
  @override
  String get copiedToClipboard => 'Arbelean kopiatua';
  @override
  String get decline => 'Ez onartu';
  @override
  String get done => 'Egina';
  @override
  String get delete => 'Ezabatu';
  @override
  String get edit => 'Editatu';
  @override
  String get error => 'Errorea';
  @override
  String get example => 'Adibidea';
  @override
  String get files => 'Fitxategiak';
  @override
  String get finished => 'Amaituta';
  @override
  String get hide => 'Ezkutatu';
  @override
  String get off => 'Itzalita';
  @override
  String get offline => 'Deskonektatua';
  @override
  String get on => 'Piztuta';
  @override
  String get online => 'Online';
  @override
  String get open => 'Ireki';
  @override
  String get queue => 'Ilara';
  @override
  String get quickSave => 'Gordetze Azkarra';
  @override
  String get quickSaveFromFavorites => '“Gogokoetan” gorde';
  @override
  String get renamed => 'Berizendatua';
  @override
  String get reset => 'Berrezarri';
  @override
  String get restart => 'Berrasieratu';
  @override
  String get settings => 'Aukerak';
  @override
  String get skipped => 'Utzita';
  @override
  String get start => 'Hasieratu';
  @override
  String get stop => 'Gelditu';
  @override
  String get save => 'Gorde';
  @override
  String get unchanged => 'Aldaketarik gabe';
  @override
  String get unknown => 'Ezezaguna';
  @override
  String get noItemInClipboard => 'Arbela hutsik dago.';
}

// Path: receiveTab
class _Translations$receiveTab$eu extends Translations$receiveTab$en {
  _Translations$receiveTab$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eskuratu';
  @override
  late final _Translations$receiveTab$infoBox$eu infoBox = _Translations$receiveTab$infoBox$eu._(_root);
  @override
  late final _Translations$receiveTab$quickSave$eu quickSave = _Translations$receiveTab$quickSave$eu._(_root);
  @override
  String get link => 'Jaso esteka bidez';
}

// Path: sendTab
class _Translations$sendTab$eu extends Translations$sendTab$en {
  _Translations$sendTab$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bidali';
  @override
  late final _Translations$sendTab$selection$eu selection = _Translations$sendTab$selection$eu._(_root);
  @override
  late final _Translations$sendTab$picker$eu picker = _Translations$sendTab$picker$eu._(_root);
  @override
  String get shareIntentInfo => 'Zure gailuko "Elkarbanatu" aukera ere erabil dezakezu fitxategi gehiago errezago aukeratzeko.';
  @override
  String get nearbyDevices => 'Inguruko Gailuak';
  @override
  String get thisDevice => 'Gailu hau';
  @override
  String get scan => 'Bilatu gailuak';
  @override
  String get manualSending => 'Eskuzko bidalketa';
  @override
  String get sendMode => 'Bidalketa modua';
  @override
  late final _Translations$sendTab$sendModes$eu sendModes = _Translations$sendTab$sendModes$eu._(_root);
  @override
  String get sendModeHelp => 'Azalpena';
  @override
  String get help => 'Ziurtatu zaitez aukeratutako hartzailea zure Wi-Fi sare berean dagoela.';
  @override
  String get placeItems => 'Aukeratu elkarbanatzeko elementuak.';
}

// Path: settingsTab
class _Translations$settingsTab$eu extends Translations$settingsTab$en {
  _Translations$settingsTab$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezarpenak';
  @override
  late final _Translations$settingsTab$general$eu general = _Translations$settingsTab$general$eu._(_root);
  @override
  late final _Translations$settingsTab$receive$eu receive = _Translations$settingsTab$receive$eu._(_root);
  @override
  late final _Translations$settingsTab$send$eu send = _Translations$settingsTab$send$eu._(_root);
  @override
  late final _Translations$settingsTab$network$eu network = _Translations$settingsTab$network$eu._(_root);
  @override
  late final _Translations$settingsTab$other$eu other = _Translations$settingsTab$other$eu._(_root);
  @override
  String get advancedSettings => 'Ezarpen aurreratuak';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$eu extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Konpondu arazoak';
  @override
  String get subTitle => 'Aplikazioa ez dabil espero bezala? Hemen arazo arrunten konponbidea aurki dezakezu.';
  @override
  String get solution => 'Konponbidea:';
  @override
  String get fixButton => 'Konpondu automatikoki';
  @override
  late final _Translations$troubleshootPage$firewall$eu firewall = _Translations$troubleshootPage$firewall$eu._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$eu noDiscovery = _Translations$troubleshootPage$noDiscovery$eu._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$eu noConnection = _Translations$troubleshootPage$noConnection$eu._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$eu extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sare interfazeak';
  @override
  String get info =>
      'Lehenespenez, LocalSend-ek eskuragarri dauden sare-interfaze guztiak erabiltzen ditu. Nahi ez dituzun sareak hemen baztertu ditzakezu. Zerbitzaria berrabiarazi behar duzu aldaketak aplikatzeko.';
  @override
  String get preview => 'Aurrebista';
  @override
  String get whitelist => 'Zerrenda zuria';
  @override
  String get blacklist => 'Zerrenda beltza';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$eu extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historia';
  @override
  String get openFolder => 'Ireki direktorioa';
  @override
  String get deleteHistory => 'Ezabatu historia';
  @override
  String get empty => 'Historia hutsik dago.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$eu entryActions = _Translations$receiveHistoryPage$entryActions$eu._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$eu extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'App-ak (APK)';
  @override
  String get excludeSystemApps => 'Baztertu sistemako app-ak';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Baztertu exekutatu ezin diren app-ak';
  @override
  String apps({required Object n}) => '${n} App-ak';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$eu extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Ezabatu dena';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$eu extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gailuaren xehetasunak';
  @override
  String get favorite => 'Gogokoa';
  @override
  String get verify => 'Egiaztatu';
  @override
  late final _Translations$deviceDetailsPage$info$eu info = _Translations$deviceDetailsPage$info$eu._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$eu logs = _Translations$deviceDetailsPage$logs$eu._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$eu extends Translations$verifyPage$en {
  _Translations$verifyPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Egiaztatu';
  @override
  String get icons => 'Ikonoak';
  @override
  String get text => 'Testua';
  @override
  String get question => 'Beste gailuan berdin ikusten da?';
}

// Path: receivePage
class _Translations$receivePage$eu extends Translations$receivePage$en {
  _Translations$receivePage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    n,
    one: '-(e)k fitxategi bat bidali nahi dizu',
    other: '-(e)k ${n} fitxategi bidali nahi dizkizu',
  );
  @override
  String get subTitleMessage => '-(e)k mezu bat bidali dizu:';
  @override
  String get subTitleLink => '-(e)k lotura bat bidali dizu:';
  @override
  String get canceled => 'Bidaltzaileak bidalketa bertan behera utzi du.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$eu extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezarpenak';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(directorio ${_root.appName})';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Direktorioak daudelako desaktibatua.';
}

// Path: sendPage
class _Translations$sendPage$eu extends Translations$sendPage$en {
  _Translations$sendPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Kontrol-batura kalkulatzen (${curr} / ${n})';
  @override
  String get waiting => 'Erantzunaren zai...';
  @override
  String get rejected => 'Hartzaileak ez du bidalketa onartu.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Hartzailea beste bidalketa batekin okupatuta dago.';
}

// Path: progressPage
class _Translations$progressPage$eu extends Translations$progressPage$en {
  _Translations$progressPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Fitxategiak bidaltzen';
  @override
  String get titleReceiving => 'Fitxategiak eskuratzen';
  @override
  String get savedToGallery => 'Galerian gordeta';
  @override
  late final _Translations$progressPage$total$eu total = _Translations$progressPage$total$eu._(_root);
  @override
  late final _Translations$progressPage$remainingTime$eu remainingTime = _Translations$progressPage$remainingTime$eu._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$eu extends Translations$webSharePage$en {
  _Translations$webSharePage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Loturaren bidez elkarbanatu';
  @override
  String get loading => 'Hasieratu zerbitzaria...';
  @override
  String get stopping => 'Gelditu zerbitzaria...';
  @override
  String get error => 'Zerbitzaria hasieratzean arazo bat gertatu da.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    n,
    one: 'Ireki lotura nabigatzailean:',
    other: 'Ireki hauetako lotura bat nabigatzailean:',
  );
  @override
  String get requests => 'Eskerak';
  @override
  String get noRequests => 'Oraindik ez dago eskaerarik.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Onartu eskaerak automatikoki';
  @override
  String get requirePin => 'Eskatu PINa';
  @override
  String pinHint({required Object pin}) => 'PINa "${pin}" da';
  @override
  String get encryptionHint => 'LocalSend-ek autosinatutako zertifikatuak erabiltzen ditu. Nabigatzailean onartu behar duzu';
  @override
  String pendingRequests({required Object n}) => 'Eskerak: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$eu extends Translations$webReceivePage$en {
  _Translations$webReceivePage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Jaso esteka bidez';
}

// Path: aboutPage
class _Translations$aboutPage$eu extends Translations$aboutPage$en {
  _Translations$aboutPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend buruz';
  @override
  List<String> get description => [
    'LocalSend doako eta kode irekiko aplikazio bat da, gertuko gailuekin fitxategiak eta mezuak modu seguruan partekatzeko aukera ematen dizuna zure sare lokalaren bidez, interneteko konexiorik behar izan gabe.',
    'Aplikazio hau Android, iOS, macOS, Windows eta Linux sistemetan dago eskuragarri. Deskarga-aukera guztiak webgune ofizialean aurki ditzakezu.',
  ];
  @override
  String get author => 'Egilea';
  @override
  String get contributors => 'Laguntzaileak';
  @override
  String get packagers => 'Paketatzaileak';
  @override
  String get translators => 'Itzultzaileak';
}

// Path: donationPage
class _Translations$donationPage$eu extends Translations$donationPage$en {
  _Translations$donationPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Egin dohaintza';
  @override
  String get info =>
      'LocalSend doakoa da, kode irekikoa eta iragarkirik gabea. Aplikazioa gustuko baduzu, garapena dohaintza batekin lagun dezakezu.';
  @override
  String donate({required Object amount}) => 'Eman ${amount}';
  @override
  String get thanks => 'Eskerrik asko!';
  @override
  String get restore => 'Berreskuratu erosketa';
}

// Path: changelogPage
class _Translations$changelogPage$eu extends Translations$changelogPage$en {
  _Translations$changelogPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aldaketak';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$eu extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => 'Zer berri ${version} bertsioan';
  @override
  late final _Translations$whatsNewPage$changes$eu changes = _Translations$whatsNewPage$changes$eu._(_root);
}

// Path: dialogs
class _Translations$dialogs$eu extends Translations$dialogs$en {
  _Translations$dialogs$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$eu addFile = _Translations$dialogs$addFile$eu._(_root);
  @override
  late final _Translations$dialogs$openFile$eu openFile = _Translations$dialogs$openFile$eu._(_root);
  @override
  late final _Translations$dialogs$addressInput$eu addressInput = _Translations$dialogs$addressInput$eu._(_root);
  @override
  late final _Translations$dialogs$cancelSession$eu cancelSession = _Translations$dialogs$cancelSession$eu._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$eu cannotOpenFile = _Translations$dialogs$cannotOpenFile$eu._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$eu encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$eu._(_root);
  @override
  late final _Translations$dialogs$errorDialog$eu errorDialog = _Translations$dialogs$errorDialog$eu._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$eu favoriteDialog = _Translations$dialogs$favoriteDialog$eu._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$eu favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$eu._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$eu favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$eu._(_root);
  @override
  late final _Translations$dialogs$fileInfo$eu fileInfo = _Translations$dialogs$fileInfo$eu._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$eu fileNameInput = _Translations$dialogs$fileNameInput$eu._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$eu historyClearDialog = _Translations$dialogs$historyClearDialog$eu._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$eu localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$eu._(_root);
  @override
  late final _Translations$dialogs$messageInput$eu messageInput = _Translations$dialogs$messageInput$eu._(_root);
  @override
  late final _Translations$dialogs$noFiles$eu noFiles = _Translations$dialogs$noFiles$eu._(_root);
  @override
  late final _Translations$dialogs$noPermission$eu noPermission = _Translations$dialogs$noPermission$eu._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$eu notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$eu._(_root);
  @override
  late final _Translations$dialogs$qr$eu qr = _Translations$dialogs$qr$eu._(_root);
  @override
  late final _Translations$dialogs$quickActions$eu quickActions = _Translations$dialogs$quickActions$eu._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$eu quickSaveNotice = _Translations$dialogs$quickSaveNotice$eu._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$eu quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$eu._(_root);
  @override
  late final _Translations$dialogs$pin$eu pin = _Translations$dialogs$pin$eu._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$eu sendModeHelp = _Translations$dialogs$sendModeHelp$eu._(_root);
  @override
  late final _Translations$dialogs$zoom$eu zoom = _Translations$dialogs$zoom$eu._(_root);
}

// Path: sanitization
class _Translations$sanitization$eu extends Translations$sanitization$en {
  _Translations$sanitization$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Fitxategi-izena ezin da hutsik egon';
  @override
  String get invalid => 'Fitxategiaren izena karaktere baliogabeak ditu';
}

// Path: tray
class _Translations$tray$eu extends Translations$tray$en {
  _Translations$tray$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Itxi LocalSend';
  @override
  String get closeWindows => 'Irten';
}

// Path: web
class _Translations$web$eu extends Translations$web$en {
  _Translations$web$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Sartu PINa';
  @override
  String get invalidPin => 'PIN baliogabea';
  @override
  String get tooManyAttempts => 'Saiakera gehiegi';
  @override
  String get rejected => 'Bertan behera utzita';
  @override
  String get files => 'Fitxategiak';
  @override
  String get fileName => 'Fitxateig izena';
  @override
  String get size => 'Tamaina';
}

// Path: assetPicker
class _Translations$assetPicker$eu extends Translations$assetPicker$en {
  _Translations$assetPicker$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Baieztatu';
  @override
  String get cancel => 'Utzi';
  @override
  String get edit => 'Editatu';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Akatsa kargatzen';
  @override
  String get original => 'Jatorrizkoa';
  @override
  String get preview => 'Aurrebista';
  @override
  String get select => 'Aukeratu';
  @override
  String get emptyList => 'Zerrenda hutsik';
  @override
  String get unSupportedAssetType => 'Fitxategi mota ez onartua.';
  @override
  String get unableToAccessAll => 'Ezin da gailuko fitxategietara atzitu.';
  @override
  String get viewingLimitedAssetsTip => 'Ikusi bakarrik aplikazioarentzat eskuragarri dauden fitxategi eta albumak.';
  @override
  String get changeAccessibleLimitedAssets => 'Egin klik eskuragarri dauden fitxategiak eguneratzeko';
  @override
  String get accessAllTip =>
      'Aplikazioak gailu fitxategi batzuk bakarrik atzitu ditzake. Joan sistemako ezarpenetara eta eman aplikazioari media fitxategi guztiak atzitzeko baimena';
  @override
  String get goToSystemSettings => 'Joan sistemako ezarpenetara';
  @override
  String get accessLimitedAssets => 'Jarraitu atzipen mugatuarekin';
  @override
  String get accessiblePathName => 'Eskuragarri dauden fitxategiak';
  @override
  String get sTypeAudioLabel => 'Audioa';
  @override
  String get sTypeImageLabel => 'Irudia';
  @override
  String get sTypeVideoLabel => 'Bideoa';
  @override
  String get sTypeOtherLabel => 'Bestelako medioak';
  @override
  String get sActionPlayHint => 'erreproduzitu';
  @override
  String get sActionPreviewHint => 'aurrebista';
  @override
  String get sActionSelectHint => 'aukeratu';
  @override
  String get sActionSwitchPathLabel => 'aldatu bidea';
  @override
  String get sActionUseCameraHint => 'erabaili kamera';
  @override
  String get sNameDurationLabel => 'iraupena';
  @override
  String get sUnitAssetCountLabel => 'kontaketa';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$eu extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Portua:';
  @override
  String get alias => 'Aliasa:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$eu extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Gogokoak';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$eu extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aukeraketa';
  @override
  String files({required Object files}) => 'Fitxategiak: ${files}';
  @override
  String size({required Object size}) => 'Tamaina: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$eu extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fitxategia';
  @override
  String get folder => 'Direktorioa';
  @override
  String get media => 'Media';
  @override
  String get text => 'Testua';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Itsatsi';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$eu extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Hartzaile bakarra';
  @override
  String get multiple => 'Hartzaile anitz';
  @override
  String get link => 'URL bidez partekatu';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$eu extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Orokorra';
  @override
  String get brightness => 'Argitasuna';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$eu brightnessOptions = _Translations$settingsTab$general$brightnessOptions$eu._(
    _root,
  );
  @override
  String get color => 'Kolorea';
  @override
  late final _Translations$settingsTab$general$colorOptions$eu colorOptions = _Translations$settingsTab$general$colorOptions$eu._(_root);
  @override
  String get language => 'Hizkuntza';
  @override
  late final _Translations$settingsTab$general$languageOptions$eu languageOptions = _Translations$settingsTab$general$languageOptions$eu._(_root);
  @override
  String get saveWindowPlacement => 'Ateratzean gorde lehioaren kokapena';
  @override
  String get saveWindowPlacementWindows => 'Irteeran leihoaren kokapena gorde';
  @override
  String get minimizeToTray => 'Itxi: txikitu lehioa';
  @override
  String get launchAtStartup => 'Hasieratze automatikoa';
  @override
  String get launchMinimized => 'Hasieratze automatikoa: hasi txikituta';
  @override
  String get showInContextMenu => 'Erakutsi LocalSend testuinguru menuan';
  @override
  String get animations => 'Animazioak';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$eu extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Eskuratu';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatikoki amaitu';
  @override
  String get destination => 'Hartzailea';
  @override
  String get downloads => '(Deskargak)';
  @override
  String get saveToGallery => 'Gorde galerian';
  @override
  String get saveToHistory => 'Gorde historialean';
  @override
  String get verifyChecksums => 'Egiaztatu kontrol-baturak fitxategiak jasotzean';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$eu extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bidali';
  @override
  String get shareViaLinkAutoAccept => 'Eskaerak automatikoki onartu “URL bidez partekatu” moduan';
  @override
  String get createChecksums => 'Sortu kontrol-baturak fitxategiak bidaltzean';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$eu extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gorria';
  @override
  String get needRestart => 'Berrabiarazi zerbitzaria aldaketak aplikatzeko!';
  @override
  String get server => 'Zerbitzaria';
  @override
  String get alias => 'Aliasa';
  @override
  String get deviceType => 'Gailu mota';
  @override
  String get deviceModel => 'Gailu modeloa';
  @override
  String get port => 'Portua';
  @override
  String get network => 'Sarea';
  @override
  late final _Translations$settingsTab$network$networkOptions$eu networkOptions = _Translations$settingsTab$network$networkOptions$eu._(_root);
  @override
  String get discoveryTimeout => 'Aurkikuntza denbora muga';
  @override
  String get useSystemName => 'Erabili sistemaren izena';
  @override
  String get generateRandomAlias => 'Ausazko "alias" sortu';
  @override
  String portWarning({required Object defaultPort}) =>
      'Portu berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango (Lehenetsitako portua: ${defaultPort})';
  @override
  String get encryption => 'Zifratzea';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Multicast helbide berezi bat erabiltzen ari zarenez, agian ez zara beste gailuentzat ikusgarri izango. (Lehenetsitako multicast helbidea: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$eu extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Besteak';
  @override
  String get support => 'LocalSend Lagundu';
  @override
  String get donate => 'Dohaintza egin';
  @override
  String get privacyPolicy => 'Pribatutasun politika';
  @override
  String get termsOfUse => 'Erabilera baldintzak';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$eu extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom =>
      'Aplikazio honek fitxategiak bidal ditzake beste gailuei, baina beste gailuek ezin ditzakete fitxategiak bidali gailu honetara.';
  @override
  String solution({required Object port}) =>
      'Suhesiarekin erlazionatutako arazo bat izen liteke. ${port} portura sarrerako konexioak (UDP eta TCP) onartuz konpon dezakezu.';
  @override
  String get openFirewall => 'Ireki Suhesia';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$eu extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Gailu honek ezin ditu beste gailurik aurkitu.';
  @override
  String get solution =>
      'Ziurtatu gailu guztiak Wi-Fi sare berean daudela eta konfigurazio bera partekatzen dutela (atea, helbide multikasta, kodeketa). Helburuko gailuaren IP helbidea eskuz idatz dezakezu. Horrek balio badu, gehitu gailu hori gogokoetan, etorkizunean automatikoki aurkitu dadin.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$eu extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Hartzaile eta bidaltzaileak ez dute elkar ikusten eta ezin diote fitxategiak elkarri bidali.';
  @override
  String get solution =>
      'Bi aldeetan dago arazoa? Ziurtatu Wi-Fi sare berdinean kokatuta daudela eta konfigurazio bera elkarbanatzen dutela (portua, multicast helbidea, zifratua). Arazoa Wi-Fi sareak partaideen arteko konexioak mugatzea ere izan liteke. Horrela bada, routerrean aukera hau aktibatu.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$eu extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Ireki fitxategia';
  @override
  String get showInFolder => 'Erakutsi karpetan';
  @override
  String get info => 'Informazioa';
  @override
  String get deleteFromHistory => 'Ezabatu historia';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$eu extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Izena';
  @override
  String get address => 'Helbidea';
  @override
  String get version => 'Bertsioa';
  @override
  String protocol({required Object version}) => 'Protokoloa v${version}';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$eu extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Erregistroak';
  @override
  String get empty => 'Ez dago erregistrorik eskuragarri.';
  @override
  String discovered({required Object protocol, required Object host}) => '${protocol} bidez aurkitua (${host})';
  @override
  String updated({required Object protocol, required Object host}) => '${protocol} bidez eguneratua (${host})';
}

// Path: progressPage.total
class _Translations$progressPage$total$eu extends Translations$progressPage$total$en {
  _Translations$progressPage$total$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$eu title = _Translations$progressPage$total$title$eu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fitxategiak: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Tamaina: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Abiadura: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$eu extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    m,
    other: '${m}min',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(
    h,
    other: '${h}h',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$eu extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$eu v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$eu._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$eu extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gehitu aukeraketari';
  @override
  String get content => 'Zer gehitu nahi duzu?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$eu extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ireki fitxategia';
  @override
  String get content => 'Jasotako fitxategia ireki nahi duzu?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$eu extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sartu helbidea';
  @override
  String get recentlyUsed => 'Duela gutxi erabilitakoak: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$eu extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bertan behera utzi fitxategi bidalketa';
  @override
  String get content => '¿Benetan nahi duzu bertan behera utzi fitxategi bidalketa?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$eu extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezin da fitxategia ireki';
  @override
  String content({required Object file}) => 'Ezin izan da "${file}" fitxategia ireki. Agian mugitu, berizendatu edo ezabatu egin da?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$eu extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Zifratua ezgaituta';
  @override
  String get content => 'Orain komunikazioa zifratu gabeko HTTP konexioaren bidez egiten ari da. HTTPS erailtzeko, gaitu berriro zifratua';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$eu extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$eu extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gogokoak';
  @override
  String get noFavorites => 'Ez dago gogoko gailurik.';
  @override
  String get addFavorite => 'Gehitu';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$eu extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ezabatu gogokoetatik';
  @override
  String content({required Object name}) => 'Benetan nahi duzu "${name}" gogokoetatik ezabatu?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$eu extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Gehitu gogokoetara';
  @override
  String get titleEdit => 'Doitu';
  @override
  String get name => 'Aliasa';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP Helbidea';
  @override
  String get port => 'Portua';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$eu extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fitxategiari buruzko informazioa';
  @override
  String get fileName => 'Fitxategiaren izena:';
  @override
  String get path => 'Bidea:';
  @override
  String get size => 'Tamaina:';
  @override
  String get sender => 'Bidaltzailea:';
  @override
  String get time => 'Ordua:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$eu extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sartu izena';
  @override
  String original({required Object original}) => 'Jatorrizkoa: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$eu extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Garbitu historia';
  @override
  String get content => 'Ziur historia osoa ezabatu nahi duzula?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$eu extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Sare lokala eskaneatzeko baimenik gabe, LocalSend-ek ezin ditu inguruko gailuak aurkitu. Mesedez, onartu baimen hau ezarpenetan.';
  @override
  String get gotoSettings => 'Ezarpenak';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$eu extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Idatzi mezu bat';
  @override
  String get multiline => 'Lerro anitz';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$eu extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ez da fitxategirik aukeratu';
  @override
  String get content => 'Mesedez aukeratu gutxienez fitxategi bat.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$eu extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Baimenik gabe';
  @override
  String get content => 'Ez dituzu beharrezko baimenak onartu. Mesedez, onartu itzazu ezarpenetan.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$eu extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ez dago eskuragarri';
  @override
  String get content => 'Ezaugarri hau hurrengo plataforman bakarrik dago eskuragarri:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$eu extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Kodea';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$eu extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ekintza azkarrak';
  @override
  String get counter => 'Kontagailua';
  @override
  String get prefix => 'Aurrizkia';
  @override
  String get padZero => 'Hutsekin osatu';
  @override
  String get sortBeforeCount => 'Aldez aurretik alfabetikoki ordenatu';
  @override
  String get random => 'Ausazkoa';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$eu extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Fitxategi eskaerak automatikoki onartzen dira. Kontutan izan sare lokaleko edonork bidali ahal izango dizkizula fitxategiak.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$eu extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Fitxategi-eskaerak orain automatikoki onartzen dira zure gogokoen zerrendako gailuetatik.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$eu extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sartu PINa';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$eu extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bidalketa moduak';
  @override
  String get single => 'Bidali fitxategiak hartzaile bakar bati. Bidalketa bukatutakoan aukeraketa garbituko da.';
  @override
  String get multiple => 'Bidali fitxategiak hartzaile anitzeri. Aukeraketa ez da garbituko.';
  @override
  String get link => 'LocalSend instalatuta ez duten hartzaileak fitxategiak eskuratu ahali zango dituzte lotura nabigatzailean zabalduz.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$eu extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$eu extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Iluna';
  @override
  String get light => 'Argia';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$eu extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
  @override
  String get custom => 'Pertsonalizatua';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$eu extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$eu extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Guztiak';
  @override
  String get filtered => 'Iragazita';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$eu extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Aurrerapena (${time})';
  @override
  String get finishedError => 'Akatsarekin amaitu da';
  @override
  String get canceledSender => 'Bidaltzaileak bertan behera utzita';
  @override
  String get canceledReceiver => 'Hartzaileak bertan behera utzita';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$eu extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$eu._(TranslationsEu root) : this._root = root, super.internal(root);

  final TranslationsEu _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Zifratzeak jada ez ditu transferentziak moteltzen. Gailu honetan berriro gaitu da, lehen desgaitu bazenuen.',
    'Gogokoen eskaerak orain automatikoki onartzen dira. Lehenespenez gaituta dago eta ezarpenetan desgaitu daiteke.',
    'Android-en, transferentziek jarraitzen dute aplikazioa atzeko planoan dagoenean edo pantaila itzalita dagoenean. iOS-en, aplikazioak aurreko planoan egon behar du oraindik.',
  ];
}
