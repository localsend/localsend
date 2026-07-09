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
class TranslationsHu extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsHu({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.hu,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <hu>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsHu _root = this; // ignore: unused_field

  @override
  TranslationsHu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Magyar';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$hu general = _Translations$general$hu._(_root);
  @override
  late final _Translations$receiveTab$hu receiveTab = _Translations$receiveTab$hu._(_root);
  @override
  late final _Translations$sendTab$hu sendTab = _Translations$sendTab$hu._(_root);
  @override
  late final _Translations$settingsTab$hu settingsTab = _Translations$settingsTab$hu._(_root);
  @override
  late final _Translations$troubleshootPage$hu troubleshootPage = _Translations$troubleshootPage$hu._(_root);
  @override
  late final _Translations$receiveHistoryPage$hu receiveHistoryPage = _Translations$receiveHistoryPage$hu._(_root);
  @override
  late final _Translations$apkPickerPage$hu apkPickerPage = _Translations$apkPickerPage$hu._(_root);
  @override
  late final _Translations$selectedFilesPage$hu selectedFilesPage = _Translations$selectedFilesPage$hu._(_root);
  @override
  late final _Translations$receivePage$hu receivePage = _Translations$receivePage$hu._(_root);
  @override
  late final _Translations$receiveOptionsPage$hu receiveOptionsPage = _Translations$receiveOptionsPage$hu._(_root);
  @override
  late final _Translations$sendPage$hu sendPage = _Translations$sendPage$hu._(_root);
  @override
  late final _Translations$progressPage$hu progressPage = _Translations$progressPage$hu._(_root);
  @override
  late final _Translations$webSharePage$hu webSharePage = _Translations$webSharePage$hu._(_root);
  @override
  late final _Translations$aboutPage$hu aboutPage = _Translations$aboutPage$hu._(_root);
  @override
  late final _Translations$donationPage$hu donationPage = _Translations$donationPage$hu._(_root);
  @override
  late final _Translations$changelogPage$hu changelogPage = _Translations$changelogPage$hu._(_root);
  @override
  late final _Translations$dialogs$hu dialogs = _Translations$dialogs$hu._(_root);
  @override
  late final _Translations$sanitization$hu sanitization = _Translations$sanitization$hu._(_root);
  @override
  late final _Translations$tray$hu tray = _Translations$tray$hu._(_root);
  @override
  late final _Translations$web$hu web = _Translations$web$hu._(_root);
  @override
  late final _Translations$assetPicker$hu assetPicker = _Translations$assetPicker$hu._(_root);
  @override
  late final _Translations$networkInterfacesPage$hu networkInterfacesPage = _Translations$networkInterfacesPage$hu._(_root);
}

// Path: general
class _Translations$general$hu extends Translations$general$en {
  _Translations$general$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Elfogad';
  @override
  String get accepted => 'Elfogadva';
  @override
  String get add => 'Hozzáad';
  @override
  String get advanced => 'Haladó';
  @override
  String get cancel => 'Mégse';
  @override
  String get close => 'Bezár';
  @override
  String get confirm => 'Megerősít';
  @override
  String get continueStr => 'Folytat';
  @override
  String get copy => 'Másol';
  @override
  String get copiedToClipboard => 'Másolva a vágólapra';
  @override
  String get decline => 'Elutasít';
  @override
  String get done => 'Kész';
  @override
  String get delete => 'Töröl';
  @override
  String get edit => 'Szerkeszt';
  @override
  String get error => 'Hiba';
  @override
  String get example => 'Példa';
  @override
  String get files => 'Fájlok';
  @override
  String get finished => 'Befejezve';
  @override
  String get hide => 'Elrejt';
  @override
  String get off => 'Ki';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Be';
  @override
  String get online => 'Online';
  @override
  String get open => 'Megnyit';
  @override
  String get queue => 'Várósor';
  @override
  String get quickSave => 'Autom. mentés';
  @override
  String get quickSaveFromFavorites => 'Gyors mentés a "Kedvencek"-hez';
  @override
  String get renamed => 'Átnevezve';
  @override
  String get reset => 'Reset';
  @override
  String get restart => 'Újraindít';
  @override
  String get settings => 'Beállítások';
  @override
  String get skipped => 'Kihagyva';
  @override
  String get start => 'Start';
  @override
  String get stop => 'Stop';
  @override
  String get save => 'Ment';
  @override
  String get unchanged => 'Változatlan';
  @override
  String get unknown => 'Ismeretlen';
  @override
  String get noItemInClipboard => 'Nincs semmi a vágólapon.';
}

// Path: receiveTab
class _Translations$receiveTab$hu extends Translations$receiveTab$en {
  _Translations$receiveTab$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fogadás';
  @override
  late final _Translations$receiveTab$infoBox$hu infoBox = _Translations$receiveTab$infoBox$hu._(_root);
  @override
  late final _Translations$receiveTab$quickSave$hu quickSave = _Translations$receiveTab$quickSave$hu._(_root);
}

// Path: sendTab
class _Translations$sendTab$hu extends Translations$sendTab$en {
  _Translations$sendTab$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Küldés';
  @override
  late final _Translations$sendTab$selection$hu selection = _Translations$sendTab$selection$hu._(_root);
  @override
  late final _Translations$sendTab$picker$hu picker = _Translations$sendTab$picker$hu._(_root);
  @override
  String get shareIntentInfo => 'A fájlok könnyebb kiválasztásához használhatja mobileszköze "Megosztás" funkcióját is.';
  @override
  String get nearbyDevices => 'Közeli eszközök';
  @override
  String get thisDevice => 'Ez az eszköz';
  @override
  String get scan => 'Keressen eszközöket';
  @override
  String get manualSending => 'Manuális küldés';
  @override
  String get sendMode => 'Küldési mód';
  @override
  late final _Translations$sendTab$sendModes$hu sendModes = _Translations$sendTab$sendModes$hu._(_root);
  @override
  String get sendModeHelp => 'Magyarázat';
  @override
  String get help => 'Győződjön meg arról, hogy a kívánt eszköz is ugyanazon a wifi hálózaton van.';
  @override
  String get placeItems => 'Helyezze el a megosztandó elemeket.';
}

// Path: settingsTab
class _Translations$settingsTab$hu extends Translations$settingsTab$en {
  _Translations$settingsTab$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Beállítások';
  @override
  late final _Translations$settingsTab$general$hu general = _Translations$settingsTab$general$hu._(_root);
  @override
  late final _Translations$settingsTab$receive$hu receive = _Translations$settingsTab$receive$hu._(_root);
  @override
  late final _Translations$settingsTab$send$hu send = _Translations$settingsTab$send$hu._(_root);
  @override
  late final _Translations$settingsTab$network$hu network = _Translations$settingsTab$network$hu._(_root);
  @override
  late final _Translations$settingsTab$other$hu other = _Translations$settingsTab$other$hu._(_root);
  @override
  String get advancedSettings => 'Haladó beállítások';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$hu extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hibaelhárítás';
  @override
  String get subTitle => 'Az alkalmazás nem a várt módon működik? Itt találhat általános megoldásokat.';
  @override
  String get solution => 'Megoldás:';
  @override
  String get fixButton => 'Autom. javítás';
  @override
  late final _Translations$troubleshootPage$firewall$hu firewall = _Translations$troubleshootPage$firewall$hu._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$hu noDiscovery = _Translations$troubleshootPage$noDiscovery$hu._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$hu noConnection = _Translations$troubleshootPage$noConnection$hu._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$hu extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Előzmény';
  @override
  String get openFolder => 'Mappa megnyitása';
  @override
  String get deleteHistory => 'Előzmény törlése';
  @override
  String get empty => 'Még nincs előzmény.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$hu entryActions = _Translations$receiveHistoryPage$entryActions$hu._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$hu extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Appok (APK)';
  @override
  String get excludeSystemApps => 'Rendszeralkalmazások kizárása';
  @override
  String get excludeAppsWithoutLaunchIntent => 'A nem indítható alkalmazások kizárása';
  @override
  String apps({required Object n}) => '${n} app';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$hu extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Összes törlése';
}

// Path: receivePage
class _Translations$receivePage$hu extends Translations$receivePage$en {
  _Translations$receivePage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hu'))(
    n,
    one: 'fájlt szeretne küldeni',
    other: '${n} fájlt szeretne küldeni',
  );
  @override
  String get subTitleMessage => 'üzenetet küldött:';
  @override
  String get subTitleLink => 'Linket küldött:';
  @override
  String get canceled => 'A küldő visszavonta a kérést.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$hu extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opciók';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend mappa)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automatikusan kikapcsol, mert vannak könyvtárak.';
}

// Path: sendPage
class _Translations$sendPage$hu extends Translations$sendPage$en {
  _Translations$sendPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Válaszra várva…';
  @override
  String get rejected => 'A fogadó elutasította a kérelmet.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'A fogadó más kéréssel van elfoglalva.';
}

// Path: progressPage
class _Translations$progressPage$hu extends Translations$progressPage$en {
  _Translations$progressPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Fájlok küldése';
  @override
  String get titleReceiving => 'Fájlok fogadása';
  @override
  String get savedToGallery => 'Mentve a Galériába';
  @override
  late final _Translations$progressPage$total$hu total = _Translations$progressPage$total$hu._(_root);
  @override
  late final _Translations$progressPage$remainingTime$hu remainingTime = _Translations$progressPage$remainingTime$hu._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$hu extends Translations$webSharePage$en {
  _Translations$webSharePage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Megosztás linkben';
  @override
  String get loading => 'Szerver indítása…';
  @override
  String get stopping => 'Szerver leállítása…';
  @override
  String get error => 'Hiba történt a szerver indításakor.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hu'))(
    n,
    one: 'Nyissa meg ezt a hivatkozást böngészőben:',
    other: 'Nyissa meg a linkek egyikét a böngészőben:',
  );
  @override
  String get requests => 'Kérések';
  @override
  String get noRequests => 'Még nincsenek kérések.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Kérések automatikus elfogadása';
  @override
  String get requirePin => 'PIN kód megkövetelése';
  @override
  String pinHint({required Object pin}) => 'A PIN kód "${pin}"';
  @override
  String get encryptionHint => 'A LocalSend a saját aláírt tanúsítványt használja. A böngészőben kell elfogadnod.';
  @override
  String pendingRequests({required Object n}) => 'Függőben lévő kérések: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$hu extends Translations$aboutPage$en {
  _Translations$aboutPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A LocalSend';
  @override
  List<String> get description => [
    'A LocalSend egy ingyenes, nyílt forráskódú alkalmazás, amely lehetővé teszi a fájlok és üzenetek biztonságos megosztását a közeli eszközökkel a helyi hálózaton keresztül, internet kapcsolat nélkül.',
    'Ez az alkalmazás Android, iOS, macOS, Windows és Linux rendszereken érhető el. Az összes letöltési lehetőséget megtalálja a hivatalos honlapon.',
  ];
  @override
  String get author => 'Szerző';
  @override
  String get contributors => 'Közreműködők';
  @override
  String get packagers => 'Csomagolók';
  @override
  String get translators => 'Fordítók';
}

// Path: donationPage
class _Translations$donationPage$hu extends Translations$donationPage$en {
  _Translations$donationPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adomány';
  @override
  String get info =>
      'A LocalSend ingyenes, nyílt forráskódú és hirdetések nélküli. Ha megtetszett az alkalmazás, adományával támogathatja a fejlesztést.';
  @override
  String donate({required Object amount}) => 'Adomány ${amount}';
  @override
  String get thanks => 'Köszönöm szépen!';
  @override
  String get restore => 'Vásárlás visszaállítása';
}

// Path: changelogPage
class _Translations$changelogPage$hu extends Translations$changelogPage$en {
  _Translations$changelogPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Változásnapló';
}

// Path: dialogs
class _Translations$dialogs$hu extends Translations$dialogs$en {
  _Translations$dialogs$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$hu addFile = _Translations$dialogs$addFile$hu._(_root);
  @override
  late final _Translations$dialogs$openFile$hu openFile = _Translations$dialogs$openFile$hu._(_root);
  @override
  late final _Translations$dialogs$addressInput$hu addressInput = _Translations$dialogs$addressInput$hu._(_root);
  @override
  late final _Translations$dialogs$cancelSession$hu cancelSession = _Translations$dialogs$cancelSession$hu._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$hu cannotOpenFile = _Translations$dialogs$cannotOpenFile$hu._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$hu encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$hu._(_root);
  @override
  late final _Translations$dialogs$errorDialog$hu errorDialog = _Translations$dialogs$errorDialog$hu._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$hu favoriteDialog = _Translations$dialogs$favoriteDialog$hu._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$hu favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$hu._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$hu favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$hu._(_root);
  @override
  late final _Translations$dialogs$fileInfo$hu fileInfo = _Translations$dialogs$fileInfo$hu._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$hu fileNameInput = _Translations$dialogs$fileNameInput$hu._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$hu historyClearDialog = _Translations$dialogs$historyClearDialog$hu._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$hu localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$hu._(_root);
  @override
  late final _Translations$dialogs$messageInput$hu messageInput = _Translations$dialogs$messageInput$hu._(_root);
  @override
  late final _Translations$dialogs$noFiles$hu noFiles = _Translations$dialogs$noFiles$hu._(_root);
  @override
  late final _Translations$dialogs$noPermission$hu noPermission = _Translations$dialogs$noPermission$hu._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$hu notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$hu._(_root);
  @override
  late final _Translations$dialogs$qr$hu qr = _Translations$dialogs$qr$hu._(_root);
  @override
  late final _Translations$dialogs$quickActions$hu quickActions = _Translations$dialogs$quickActions$hu._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$hu quickSaveNotice = _Translations$dialogs$quickSaveNotice$hu._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$hu quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$hu._(_root);
  @override
  late final _Translations$dialogs$pin$hu pin = _Translations$dialogs$pin$hu._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$hu sendModeHelp = _Translations$dialogs$sendModeHelp$hu._(_root);
  @override
  late final _Translations$dialogs$zoom$hu zoom = _Translations$dialogs$zoom$hu._(_root);
}

// Path: sanitization
class _Translations$sanitization$hu extends Translations$sanitization$en {
  _Translations$sanitization$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'A fájlnév nem lehet üres';
  @override
  String get invalid => 'A fájlnév érvénytelen karaktereket tartalmaz';
}

// Path: tray
class _Translations$tray$hu extends Translations$tray$en {
  _Translations$tray$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Kilépés';
  @override
  String get closeWindows => 'Kilépés';
}

// Path: web
class _Translations$web$hu extends Translations$web$en {
  _Translations$web$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN kód megadása';
  @override
  String get invalidPin => 'Érvénytelen a PIN';
  @override
  String get tooManyAttempts => 'Túl sok kísérlet';
  @override
  String get rejected => 'Elutasítva';
  @override
  String get files => 'Fájl';
  @override
  String get fileName => 'Fájlnév';
  @override
  String get size => 'Méret';
}

// Path: assetPicker
class _Translations$assetPicker$hu extends Translations$assetPicker$en {
  _Translations$assetPicker$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Megerősít';
  @override
  String get cancel => 'Mégse';
  @override
  String get edit => 'Szerkeszt';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'A betöltés sikertelen';
  @override
  String get original => 'Eredeti';
  @override
  String get preview => 'Előnézet';
  @override
  String get select => 'Válasszon';
  @override
  String get emptyList => 'Üres lista';
  @override
  String get unSupportedAssetType => 'Nem támogatott fájl típus.';
  @override
  String get unableToAccessAll => 'Nem lehet hozzáférni az eszközön lévő összes fájlhoz';
  @override
  String get viewingLimitedAssetsTip => 'Csak az app által elérhető fájlok és albumok megtekintése.';
  @override
  String get changeAccessibleLimitedAssets => 'Koppintson az elérhető fájlok frissítéséhez';
  @override
  String get accessAllTip =>
      'Az alkalmazás csak néhány fájlhoz férhet hozzá az eszközön. Nyissa meg a rendszerbeállításokat és engedélyezze az alkalmazás számára, hogy hozzáférjen az eszközön lévő összes médiafájlhoz.';
  @override
  String get goToSystemSettings => 'Lépjen a rendszer beállításaihoz';
  @override
  String get accessLimitedAssets => 'Folytassa korlátozott hozzáféréssel';
  @override
  String get accessiblePathName => 'Elérhető fájlok';
  @override
  String get sTypeAudioLabel => 'Audió';
  @override
  String get sTypeImageLabel => 'Kép';
  @override
  String get sTypeVideoLabel => 'Videó';
  @override
  String get sTypeOtherLabel => 'Egyéb média';
  @override
  String get sActionPlayHint => 'lejátszás';
  @override
  String get sActionPreviewHint => 'előnézet';
  @override
  String get sActionSelectHint => 'választás';
  @override
  String get sActionSwitchPathLabel => 'útvonal módosítás';
  @override
  String get sActionUseCameraHint => 'használjon kamerát';
  @override
  String get sNameDurationLabel => 'időtartam';
  @override
  String get sUnitAssetCountLabel => 'számol';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$hu extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hálózati interfészek';
  @override
  String get info =>
      'Alapértelmezésként a LocalSend az összes rendelkezésre álló hálózati interfészt használja. Itt kizárhatja a nem kívánt hálózatokat. A módosítások alkalmazásához újra kell indítania a kiszolgálót.';
  @override
  String get preview => 'Előnézet';
  @override
  String get whitelist => 'Fehérlista';
  @override
  String get blacklist => 'Tiltólista';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$hu extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Álnév:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$hu extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Kedvencek';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$hu extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kiválasztás';
  @override
  String files({required Object files}) => 'Fájl(ok): ${files}';
  @override
  String size({required Object size}) => 'Méret: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$hu extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fájl';
  @override
  String get folder => 'Mappa';
  @override
  String get media => 'Média';
  @override
  String get text => 'Szöveg';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Beillesztés';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$hu extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Egyetlen címzett';
  @override
  String get multiple => 'Több címzett';
  @override
  String get link => 'Megosztás linkben';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$hu extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Általános';
  @override
  String get brightness => 'Fényerő';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$hu brightnessOptions = _Translations$settingsTab$general$brightnessOptions$hu._(
    _root,
  );
  @override
  String get color => 'Színek';
  @override
  late final _Translations$settingsTab$general$colorOptions$hu colorOptions = _Translations$settingsTab$general$colorOptions$hu._(_root);
  @override
  String get language => 'Nyelv';
  @override
  late final _Translations$settingsTab$general$languageOptions$hu languageOptions = _Translations$settingsTab$general$languageOptions$hu._(_root);
  @override
  String get saveWindowPlacement => 'Kilépés: Ablak pozíció mentése';
  @override
  String get saveWindowPlacementWindows => 'Az ablak pozíciójának mentése kilépés után';
  @override
  String get minimizeToTray => 'Kilépés: Minimalizálja a tálcára';
  @override
  String get launchAtStartup => 'Auto. indítás bejelentkezés után';
  @override
  String get launchMinimized => 'Auto. indítás: Kis méretben';
  @override
  String get showInContextMenu => 'A LocalSend megjelenítése a helyi menüben';
  @override
  String get animations => 'Animációk';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$hu extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fogadás';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Autom. befejezés';
  @override
  String get destination => 'Mentés helye';
  @override
  String get downloads => '(Letöltések)';
  @override
  String get saveToGallery => 'Média mentése a galériába';
  @override
  String get saveToHistory => 'Mentés az előzmények közé';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$hu extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Küld';
  @override
  String get shareViaLinkAutoAccept => 'Megosztás linken keresztül: Auto. elfogadás';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$hu extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hálózat';
  @override
  String get needRestart => 'A beállítások alkalmazásához indítsa újra a szervert!';
  @override
  String get server => 'Szerver';
  @override
  String get alias => 'Álnév';
  @override
  String get deviceType => 'Eszköz típusa';
  @override
  String get deviceModel => 'Eszköz modell';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Felfedezési időtúllépés';
  @override
  String get useSystemName => 'Rendszernév használata';
  @override
  String get generateRandomAlias => 'Véletlenszerű álnév generálás';
  @override
  String portWarning({required Object defaultPort}) =>
      'Előfordulhat, hogy más eszközök nem észlelik eszközét, mert egyéni portot használ. (alapértelmezett: ${defaultPort})';
  @override
  String get encryption => 'Titkosítás';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Előfordulhat, hogy más eszközök nem észlelik eszközét, mert egyéni multicast címet használ. (alapérték: ${defaultMulticast})';
  @override
  String get network => 'Hálózat';
  @override
  late final _Translations$settingsTab$network$networkOptions$hu networkOptions = _Translations$settingsTab$network$networkOptions$hu._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$hu extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Egyéb';
  @override
  String get support => 'LocalSend támogatás';
  @override
  String get donate => 'Adomány';
  @override
  String get privacyPolicy => 'Adatvédelmi irányelvek';
  @override
  String get termsOfUse => 'Használati feltételek';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$hu extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ez az alkalmazás képes fájlokat küldeni más eszközökre, de más eszközök nem küldhetnek fájlokat erre az eszközre.';
  @override
  String solution({required Object port}) =>
      'Ez valószínűleg tűzfal probléma. Ezt úgy oldhatja meg, hogy engedélyezi a bejövő kapcsolatokat (UDP és TCP) a ${port} porton.';
  @override
  String get openFirewall => 'Tűzfal megnyitás';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$hu extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ez az eszköz nem tud más eszközöket felismerni.';
  @override
  String get solution =>
      'Győződjön meg róla, hogy minden eszköz ugyanabban a Wi-Fi hálózatban van, és ugyanaz a konfiguráció (port, multicast cím, titkosítás). Megpróbálhatja manuálisan beírni a céleszköz IP-címét. Ha ez működik, fontolja meg az eszköz hozzáadását a kedvencekhez, hogy a jövőben automatikusan fel lehessen fedezni.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$hu extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'A két eszköz nem tudja felismerni egymást, és nem tud fájlokat megosztani.';
  @override
  String get solution =>
      'A probléma mindkét oldalon létezik? Akkor meg kell győződnie arról, hogy mindkét eszköz ugyanabban a wifi hálózatban van, és ugyanazt a konfigurációt használja (port, multicast cím, titkosítás). Előfordulhat, hogy a Wifi nem teszi lehetővé a résztvevők közötti kommunikációt. Ebben az esetben ezt az opciót engedélyezni kell a routeren..';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$hu extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Fájl megnyitás';
  @override
  String get showInFolder => 'Megjelenítés a mappában';
  @override
  String get info => 'Információ';
  @override
  String get deleteFromHistory => 'Törlés az előzményből';
}

// Path: progressPage.total
class _Translations$progressPage$total$hu extends Translations$progressPage$total$en {
  _Translations$progressPage$total$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$hu title = _Translations$progressPage$total$title$hu._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fájl: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Méret: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Sebesség: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$hu extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Az órák rövidítéséhez használja a 'h' betűt, a percekhez pedig az 'm' betűt
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// A naphoz  a 'd', az órához a 'h', a percekhez az 'm' betűt használja
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$hu extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hozzáadás a kijelöléshez';
  @override
  String get content => 'Mit szeretne hozzáfűzni?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$hu extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fájl megnyitás';
  @override
  String get content => 'Meg akarja nyitni a fogadott fájlt?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$hu extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adja meg a címet';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP cím';
  @override
  String get recentlyUsed => 'Nemrég használt: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$hu extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fájlátvitel megszakítása';
  @override
  String get content => 'Valóban meg akarja szakítani a fájlátvitelt?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$hu extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A fájl nem nyitható meg';
  @override
  String content({required Object file}) => 'Nem sikerült megnyitni a(z) "${file}" fájlt. A fájlt áthelyezték, átnevezték vagy törölték?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$hu extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A titkosítás letiltva';
  @override
  String get content =>
      'A kommunikáció most a titkosítatlan HTTP protokollon keresztül történik. A HTTPS használatához engedélyezze újra a titkosítást.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$hu extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$hu extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kedvencek';
  @override
  String get noFavorites => 'Nincsenek még kedvenc eszközök.';
  @override
  String get addFavorite => 'Hozzáadás';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$hu extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Törlés a kedvencek közül';
  @override
  String content({required Object name}) => 'Tényleg törölni szeretnéd a "${name}" a kedvencek közül?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$hu extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Hozzáadás a kedvencekhez';
  @override
  String get titleEdit => 'Beállítás';
  @override
  String get name => 'Álnév';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'IP cím';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$hu extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fájl információ';
  @override
  String get fileName => 'Fájl neve:';
  @override
  String get path => 'Útvonal:';
  @override
  String get size => 'Méret:';
  @override
  String get sender => 'Küldő:';
  @override
  String get time => 'Idő:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$hu extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Írja be a fájl nevét';
  @override
  String original({required Object original}) => 'Eredeti: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$hu extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Törölje az előzményt';
  @override
  String get content => 'Biztosan törölni szeretné a teljes előzményt?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$hu extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'A LocalSend nem találhat más eszközöket a helyi hálózat vizsgálatára vonatkozó engedély nélkül. Adja meg ezt az engedélyt a beállításokban.';
  @override
  String get gotoSettings => 'Beállítások';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$hu extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Írja be az üzenetét';
  @override
  String get multiline => 'Több soros';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$hu extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nincs fájl kiválasztva';
  @override
  String get content => 'Kérjük válasszon legalább egy fájlt.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$hu extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nem engedélyezett';
  @override
  String get content => 'Nem adtál megfelelő engedélyeket. Kérlek engedélyezd őket a beállításokban.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$hu extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nem érhető el';
  @override
  String get content => 'Ez a funkció csak itt érhető el:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$hu extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kód';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$hu extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gyors műveletek';
  @override
  String get counter => 'Számláló';
  @override
  String get prefix => 'Előtag';
  @override
  String get padZero => 'Kitöltés nullákkal';
  @override
  String get sortBeforeCount => 'Előzetesen rendezze ábécé sorrendbe';
  @override
  String get random => 'Véletlen';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$hu extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'A fájlkérések autom. elfogadásra kerülnek. Ügyeljen arra, hogy a helyi hálózaton mindenki küldhet Önnek fájlokat.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$hu extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'A fájlkérések auto. elfogadása mostantól a kedvencek listáján szereplő eszközökről.',
    'Figyelmeztetés: Ez jelenleg nem teljesen biztonságos, mert egy hacker, aki ismeri a kedvenc eszközeinek ujjlenyomatát, még mindig küldhet fájlokat.',
    'Ez a lehetőség azonban még mindig biztonságosabb, mint bármely eszköz engedélyezése.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$hu extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN kód megadása';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$hu extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Küldési módok';
  @override
  String get single => 'Fájlokat küld egy címzettnek. Az átvitel befejezése után a kijelölés törlődik.';
  @override
  String get multiple => 'Fájlokat küld több címzettnek. A kijelölés nem törlődik.';
  @override
  String get link =>
      'Azok a címzettek, akiknél nincs telepítve a LocalSend, letölthetik a kiválasztott fájlokat a hivatkozás megnyitásával a böngészőjükben.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$hu extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$hu extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Rendszer';
  @override
  String get dark => 'Sötét';
  @override
  String get light => 'Világos';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$hu extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Rendszer';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$hu extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Rendszer';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$hu extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Mindegyik';
  @override
  String get filtered => 'Szűrt';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$hu extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$hu._(TranslationsHu root) : this._root = root, super.internal(root);

  final TranslationsHu _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Teljes folyamat (${time})';
  @override
  String get finishedError => 'Hibával befejezve';
  @override
  String get canceledSender => 'A küldő törölte';
  @override
  String get canceledReceiver => 'A fogadó törölte';
}
