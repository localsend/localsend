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
class TranslationsSv extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSv({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.sv,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sv>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSv _root = this; // ignore: unused_field

  @override
  TranslationsSv $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSv(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$sv general = _Translations$general$sv._(_root);
  @override
  late final _Translations$receiveTab$sv receiveTab = _Translations$receiveTab$sv._(_root);
  @override
  late final _Translations$sendTab$sv sendTab = _Translations$sendTab$sv._(_root);
  @override
  late final _Translations$settingsTab$sv settingsTab = _Translations$settingsTab$sv._(_root);
  @override
  late final _Translations$troubleshootPage$sv troubleshootPage = _Translations$troubleshootPage$sv._(_root);
  @override
  late final _Translations$networkInterfacesPage$sv networkInterfacesPage = _Translations$networkInterfacesPage$sv._(_root);
  @override
  late final _Translations$receiveHistoryPage$sv receiveHistoryPage = _Translations$receiveHistoryPage$sv._(_root);
  @override
  late final _Translations$apkPickerPage$sv apkPickerPage = _Translations$apkPickerPage$sv._(_root);
  @override
  late final _Translations$selectedFilesPage$sv selectedFilesPage = _Translations$selectedFilesPage$sv._(_root);
  @override
  late final _Translations$receivePage$sv receivePage = _Translations$receivePage$sv._(_root);
  @override
  late final _Translations$receiveOptionsPage$sv receiveOptionsPage = _Translations$receiveOptionsPage$sv._(_root);
  @override
  late final _Translations$sendPage$sv sendPage = _Translations$sendPage$sv._(_root);
  @override
  late final _Translations$progressPage$sv progressPage = _Translations$progressPage$sv._(_root);
  @override
  late final _Translations$webSharePage$sv webSharePage = _Translations$webSharePage$sv._(_root);
  @override
  late final _Translations$aboutPage$sv aboutPage = _Translations$aboutPage$sv._(_root);
  @override
  late final _Translations$donationPage$sv donationPage = _Translations$donationPage$sv._(_root);
  @override
  late final _Translations$changelogPage$sv changelogPage = _Translations$changelogPage$sv._(_root);
  @override
  late final _Translations$aliasGenerator$sv aliasGenerator = _Translations$aliasGenerator$sv._(_root);
  @override
  late final _Translations$dialogs$sv dialogs = _Translations$dialogs$sv._(_root);
  @override
  late final _Translations$sanitization$sv sanitization = _Translations$sanitization$sv._(_root);
  @override
  late final _Translations$tray$sv tray = _Translations$tray$sv._(_root);
  @override
  late final _Translations$web$sv web = _Translations$web$sv._(_root);
  @override
  late final _Translations$assetPicker$sv assetPicker = _Translations$assetPicker$sv._(_root);
}

// Path: general
class _Translations$general$sv extends Translations$general$en {
  _Translations$general$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Acceptera';
  @override
  String get accepted => 'Accepterad';
  @override
  String get add => 'Lägg till';
  @override
  String get advanced => 'Avancerat';
  @override
  String get cancel => 'Avbryt';
  @override
  String get close => 'Stäng';
  @override
  String get confirm => 'Bekräfta';
  @override
  String get continueStr => 'Fortsätt';
  @override
  String get copy => 'Kopiera';
  @override
  String get copiedToClipboard => 'Kopierat till urklipp';
  @override
  String get decline => 'Avböj';
  @override
  String get done => 'Klar';
  @override
  String get delete => 'Ta bort';
  @override
  String get edit => 'Redigera';
  @override
  String get error => 'Fel';
  @override
  String get example => 'Exempel';
  @override
  String get files => 'Filer';
  @override
  String get finished => 'Slutförd';
  @override
  String get hide => 'Dölj';
  @override
  String get off => 'Av';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'På';
  @override
  String get online => 'Online';
  @override
  String get open => 'Öppna';
  @override
  String get queue => 'Kö';
  @override
  String get quickSave => 'Snabbspara';
  @override
  String get quickSaveFromFavorites => 'Snabbspara från favoriter';
  @override
  String get renamed => 'Namnändrad';
  @override
  String get reset => 'Ångra ändringar';
  @override
  String get restart => 'Starta om';
  @override
  String get settings => 'Inställningar';
  @override
  String get skipped => 'Hoppades över';
  @override
  String get start => 'Starta';
  @override
  String get stop => 'Stoppa';
  @override
  String get save => 'Spara';
  @override
  String get unchanged => 'Oförändrad';
  @override
  String get unknown => 'Okänd';
  @override
  String get noItemInClipboard => 'Det finns inga objekt i urklipp.';
}

// Path: receiveTab
class _Translations$receiveTab$sv extends Translations$receiveTab$en {
  _Translations$receiveTab$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ta emot';
  @override
  late final _Translations$receiveTab$infoBox$sv infoBox = _Translations$receiveTab$infoBox$sv._(_root);
  @override
  late final _Translations$receiveTab$quickSave$sv quickSave = _Translations$receiveTab$quickSave$sv._(_root);
}

// Path: sendTab
class _Translations$sendTab$sv extends Translations$sendTab$en {
  _Translations$sendTab$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Skicka';
  @override
  late final _Translations$sendTab$selection$sv selection = _Translations$sendTab$selection$sv._(_root);
  @override
  late final _Translations$sendTab$picker$sv picker = _Translations$sendTab$picker$sv._(_root);
  @override
  String get shareIntentInfo => 'Du kan också använda funktionen ”Dela” på mobilen för att enklare välja filer.';
  @override
  String get nearbyDevices => 'Närbelägna enheter';
  @override
  String get thisDevice => 'Den här enheten';
  @override
  String get scan => 'Sök efter enheter';
  @override
  String get manualSending => 'Skicka manuellt';
  @override
  String get sendMode => 'Sändningsläge';
  @override
  late final _Translations$sendTab$sendModes$sv sendModes = _Translations$sendTab$sendModes$sv._(_root);
  @override
  String get sendModeHelp => 'Förklaring';
  @override
  String get help => 'Kontrollera att målenheten är ansluten till samma Wi-Fi-nätverk.';
  @override
  String get placeItems => 'Lägg till objekt att dela.';
}

// Path: settingsTab
class _Translations$settingsTab$sv extends Translations$settingsTab$en {
  _Translations$settingsTab$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inställningar';
  @override
  late final _Translations$settingsTab$general$sv general = _Translations$settingsTab$general$sv._(_root);
  @override
  late final _Translations$settingsTab$receive$sv receive = _Translations$settingsTab$receive$sv._(_root);
  @override
  late final _Translations$settingsTab$send$sv send = _Translations$settingsTab$send$sv._(_root);
  @override
  late final _Translations$settingsTab$network$sv network = _Translations$settingsTab$network$sv._(_root);
  @override
  late final _Translations$settingsTab$other$sv other = _Translations$settingsTab$other$sv._(_root);
  @override
  String get advancedSettings => 'Avancerade inställningar';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$sv extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Felsökning';
  @override
  String get subTitle => 'Fungerar inte appen som förväntat? Här finns vanliga lösningar på problem.';
  @override
  String get solution => 'Lösning:';
  @override
  String get fixButton => 'Åtgärda automatiskt';
  @override
  late final _Translations$troubleshootPage$firewall$sv firewall = _Translations$troubleshootPage$firewall$sv._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$sv noDiscovery = _Translations$troubleshootPage$noDiscovery$sv._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$sv noConnection = _Translations$troubleshootPage$noConnection$sv._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$sv extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nätverksgränssnitt';
  @override
  String get info =>
      'Som standard använder LocalSend alla tillgängliga nätverksgränssnitt. Du kan utesluta oönskade nätverk här. Starta om servern för att tillämpa ändringarna.';
  @override
  String get preview => 'Förhandsvisning';
  @override
  String get whitelist => 'Tillåtelselista';
  @override
  String get blacklist => 'Blockeringslista';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$sv extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historik';
  @override
  String get openFolder => 'Öppna mapp';
  @override
  String get deleteHistory => 'Ta bort historiken';
  @override
  String get empty => 'Historiken är tom.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$sv entryActions = _Translations$receiveHistoryPage$entryActions$sv._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$sv extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Appar (APK)';
  @override
  String get excludeSystemApps => 'Uteslut systemappar';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Uteslut appar som inte kan startas';
  @override
  String apps({required Object n}) => '${n} appar';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$sv extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Ta bort alla';
}

// Path: receivePage
class _Translations$receivePage$sv extends Translations$receivePage$en {
  _Translations$receivePage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
    n,
    one: 'vill skicka en fil till dig',
    other: 'vill skicka ${n} filer till dig',
  );
  @override
  String get subTitleMessage => 'skickade ett meddelande till dig:';
  @override
  String get subTitleLink => 'skickade en länk till dig:';
  @override
  String get canceled => 'Sändaren avbröt begäran.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$sv extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Alternativ';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-mappen)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Inaktiverades automatiskt eftersom överföringen innehåller mappar.';
}

// Path: sendPage
class _Translations$sendPage$sv extends Translations$sendPage$en {
  _Translations$sendPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Väntar på svar…';
  @override
  String get rejected => 'Mottagaren har avvisat begäran.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Mottagaren är upptagen med en annan förfrågan.';
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Beräknar kontrollsumma (${curr} / ${n})';
}

// Path: progressPage
class _Translations$progressPage$sv extends Translations$progressPage$en {
  _Translations$progressPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Skickar filer';
  @override
  String get titleReceiving => 'Tar emot filer';
  @override
  String get savedToGallery => 'Sparat bland bilderna';
  @override
  late final _Translations$progressPage$total$sv total = _Translations$progressPage$total$sv._(_root);
  @override
  late final _Translations$progressPage$remainingTime$sv remainingTime = _Translations$progressPage$remainingTime$sv._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$sv extends Translations$webSharePage$en {
  _Translations$webSharePage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dela via länk';
  @override
  String get loading => 'Startar servern…';
  @override
  String get stopping => 'Stoppar servern…';
  @override
  String get error => 'Ett fel uppstod när servern skulle startas.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
    n,
    one: 'Öppna denna länk i webbläsaren:',
    other: 'Öppna en av dessa länkar i webbläsaren:',
  );
  @override
  String get requests => 'Förfrågningar';
  @override
  String get noRequests => 'Inga förfrågningar ännu.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Acceptera förfrågningar automatiskt';
  @override
  String get requirePin => 'Kräv PIN-kod';
  @override
  String pinHint({required Object pin}) => 'PIN-koden är "${pin}"';
  @override
  String get encryptionHint => 'LocalSend använder ett självsignerat certifikat. Du måste godkänna det i webbläsaren.';
  @override
  String pendingRequests({required Object n}) => 'Väntande förfrågningar: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$sv extends Translations$aboutPage$en {
  _Translations$aboutPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Om LocalSend';
  @override
  List<String> get description => [
    'LocalSend är en fri app med öppen källkod som gör det möjligt att säkert dela filer och meddelanden med enheter i närheten via det lokala nätverket, utan internetanslutning.',
    'Appen finns för Android, iOS, macOS, Windows och Linux. Alla nedladdningsalternativ finns på den officiella webbplatsen.',
  ];
  @override
  String get author => 'Upphovsperson';
  @override
  String get contributors => 'Bidragsgivare';
  @override
  String get packagers => 'Paketerare';
  @override
  String get translators => 'Översättare';
}

// Path: donationPage
class _Translations$donationPage$sv extends Translations$donationPage$en {
  _Translations$donationPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donera';
  @override
  String get info => 'LocalSend är en fri app med öppen källkod och utan annonser. Om du gillar appen kan du stödja utvecklingen genom att donera.';
  @override
  String donate({required Object amount}) => 'Donera ${amount}';
  @override
  String get thanks => 'Tack så mycket!';
  @override
  String get restore => 'Återställ köp';
}

// Path: changelogPage
class _Translations$changelogPage$sv extends Translations$changelogPage$en {
  _Translations$changelogPage$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ändringslogg';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$sv extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Bedårande',
    'Vacker',
    'Stor',
    'Ljus',
    'Ren',
    'Klyftig',
    'Cool',
    'Söt',
    'Listig',
    'Bestämd',
    'Energisk',
    'Effektiv',
    'Fantastisk',
    'Snabb',
    'Fint',
    'Fräsch',
    'Bra',
    'Underbar',
    'Jättebra',
    'Stilig',
    'Het',
    'Snäll',
    'Underbar',
    'Mystiker',
    'Prydlig',
    'Trevlig',
    'Tålmodig',
    'Snygg',
    'Kraftfull',
    'Rik',
    'Hemlig',
    'Smart',
    'Solid',
    'Speciell',
    'Strategisk',
    'Stark',
    'Ordentlig',
    'Vis',
  ];
  @override
  List<String> get fruits => [
    'Äpple',
    'Avocado',
    'Banan',
    'Björnbär',
    'Blåbär',
    'Broccoli',
    'Morot',
    'Körsbär',
    'Kokosnöt',
    'Druva',
    'Citron',
    'Sallad',
    'Mango',
    'Melon',
    'Svamp',
    'Lök',
    'Apelsin',
    'Papaya',
    'Persika',
    'Päron',
    'Ananas',
    'Potatis',
    'Pumpa',
    'Hallon',
    'Jordgubbe',
    'Tomat',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$sv extends Translations$dialogs$en {
  _Translations$dialogs$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$sv addFile = _Translations$dialogs$addFile$sv._(_root);
  @override
  late final _Translations$dialogs$openFile$sv openFile = _Translations$dialogs$openFile$sv._(_root);
  @override
  late final _Translations$dialogs$addressInput$sv addressInput = _Translations$dialogs$addressInput$sv._(_root);
  @override
  late final _Translations$dialogs$cancelSession$sv cancelSession = _Translations$dialogs$cancelSession$sv._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$sv cannotOpenFile = _Translations$dialogs$cannotOpenFile$sv._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$sv encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$sv._(_root);
  @override
  late final _Translations$dialogs$errorDialog$sv errorDialog = _Translations$dialogs$errorDialog$sv._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$sv favoriteDialog = _Translations$dialogs$favoriteDialog$sv._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$sv favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$sv._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$sv favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$sv._(_root);
  @override
  late final _Translations$dialogs$fileInfo$sv fileInfo = _Translations$dialogs$fileInfo$sv._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$sv fileNameInput = _Translations$dialogs$fileNameInput$sv._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$sv historyClearDialog = _Translations$dialogs$historyClearDialog$sv._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$sv localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$sv._(_root);
  @override
  late final _Translations$dialogs$messageInput$sv messageInput = _Translations$dialogs$messageInput$sv._(_root);
  @override
  late final _Translations$dialogs$noFiles$sv noFiles = _Translations$dialogs$noFiles$sv._(_root);
  @override
  late final _Translations$dialogs$noPermission$sv noPermission = _Translations$dialogs$noPermission$sv._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$sv notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$sv._(_root);
  @override
  late final _Translations$dialogs$qr$sv qr = _Translations$dialogs$qr$sv._(_root);
  @override
  late final _Translations$dialogs$quickActions$sv quickActions = _Translations$dialogs$quickActions$sv._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$sv quickSaveNotice = _Translations$dialogs$quickSaveNotice$sv._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$sv quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$sv._(_root);
  @override
  late final _Translations$dialogs$pin$sv pin = _Translations$dialogs$pin$sv._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$sv sendModeHelp = _Translations$dialogs$sendModeHelp$sv._(_root);
  @override
  late final _Translations$dialogs$zoom$sv zoom = _Translations$dialogs$zoom$sv._(_root);
}

// Path: sanitization
class _Translations$sanitization$sv extends Translations$sanitization$en {
  _Translations$sanitization$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Filnamnet får inte vara tomt';
  @override
  String get invalid => 'Filnamnet innehåller ogiltiga tecken';
}

// Path: tray
class _Translations$tray$sv extends Translations$tray$en {
  _Translations$tray$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Avsluta LocalSend';
  @override
  String get closeWindows => 'Avsluta';
}

// Path: web
class _Translations$web$sv extends Translations$web$en {
  _Translations$web$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Ange PIN-kod';
  @override
  String get invalidPin => 'Ogiltig PIN-kod';
  @override
  String get tooManyAttempts => 'För många försök';
  @override
  String get rejected => 'Avvisad';
  @override
  String get files => 'Filer';
  @override
  String get fileName => 'Filnamn';
  @override
  String get size => 'Storlek';
}

// Path: assetPicker
class _Translations$assetPicker$sv extends Translations$assetPicker$en {
  _Translations$assetPicker$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Bekräfta';
  @override
  String get cancel => 'Avbryt';
  @override
  String get edit => 'Redigera';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Inläsningen misslyckades';
  @override
  String get original => 'Original';
  @override
  String get preview => 'Förhandsvisning';
  @override
  String get select => 'Välj';
  @override
  String get emptyList => 'Listan är tom';
  @override
  String get unSupportedAssetType => 'Filtypen stöds inte.';
  @override
  String get unableToAccessAll => 'Det går inte att komma åt alla filer på enheten';
  @override
  String get viewingLimitedAssetsTip => 'Visa endast filer och album som appen har åtkomst till.';
  @override
  String get changeAccessibleLimitedAssets => 'Tryck för att uppdatera åtkomliga filer';
  @override
  String get accessAllTip =>
      'Appen har endast åtkomst till vissa filer på enheten. Gå till systeminställningarna och ge appen åtkomst till alla mediefiler på enheten.';
  @override
  String get goToSystemSettings => 'Gå till systeminställningarna';
  @override
  String get accessLimitedAssets => 'Fortsätt med begränsad åtkomst';
  @override
  String get accessiblePathName => 'Åtkomliga filer';
  @override
  String get sTypeAudioLabel => 'Ljud';
  @override
  String get sTypeImageLabel => 'Bild';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Övriga medier';
  @override
  String get sActionPlayHint => 'spela upp';
  @override
  String get sActionPreviewHint => 'förhandsvisa';
  @override
  String get sActionSelectHint => 'välj';
  @override
  String get sActionSwitchPathLabel => 'byt sökväg';
  @override
  String get sActionUseCameraHint => 'använd kameran';
  @override
  String get sNameDurationLabel => 'längd';
  @override
  String get sUnitAssetCountLabel => 'antal';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$sv extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Enhetsnamn:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$sv extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoriter';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$sv extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Val';
  @override
  String files({required Object files}) => 'Filer: ${files}';
  @override
  String size({required Object size}) => 'Storlek: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$sv extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fil';
  @override
  String get folder => 'Mapp';
  @override
  String get media => 'Medier';
  @override
  String get text => 'Text';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Klistra in';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$sv extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'En mottagare';
  @override
  String get multiple => 'Flera mottagare';
  @override
  String get link => 'Dela via länk';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$sv extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Allmänt';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$sv brightnessOptions = _Translations$settingsTab$general$brightnessOptions$sv._(
    _root,
  );
  @override
  String get color => 'Färg';
  @override
  late final _Translations$settingsTab$general$colorOptions$sv colorOptions = _Translations$settingsTab$general$colorOptions$sv._(_root);
  @override
  String get language => 'Språk';
  @override
  late final _Translations$settingsTab$general$languageOptions$sv languageOptions = _Translations$settingsTab$general$languageOptions$sv._(_root);
  @override
  String get saveWindowPlacement => 'Spara fönsterposition vid avslut';
  @override
  String get saveWindowPlacementWindows => 'Spara fönsterposition vid avslut';
  @override
  String get minimizeToTray => 'Minimera till systemfältet eller menyraden vid stängning';
  @override
  String get launchAtStartup => 'Starta automatiskt efter inloggning';
  @override
  String get launchMinimized => 'Automatisk start: starta dolt';
  @override
  String get showInContextMenu => 'Visa LocalSend i snabbmenyn';
  @override
  String get animations => 'Animationer';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$sv extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ta emot';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Slutför automatiskt';
  @override
  String get destination => 'Spara i mapp';
  @override
  String get downloads => '(Nedladdningar)';
  @override
  String get saveToGallery => 'Spara medier i galleriet';
  @override
  String get saveToHistory => 'Spara i historiken';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$sv extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Skicka';
  @override
  String get shareViaLinkAutoAccept => 'Acceptera förfrågningar automatiskt i läget ”Dela via länk”';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$sv extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nätverk';
  @override
  String get needRestart => 'Starta om servern för att tillämpa inställningarna!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Enhetsnamn';
  @override
  String get deviceType => 'Enhetstyp';
  @override
  String get deviceModel => 'Enhetsmodell';
  @override
  String get port => 'Port';
  @override
  String get network => 'Nätverk';
  @override
  late final _Translations$settingsTab$network$networkOptions$sv networkOptions = _Translations$settingsTab$network$networkOptions$sv._(_root);
  @override
  String get discoveryTimeout => 'Tidsgräns för enhetssökning';
  @override
  String get useSystemName => 'Använd systemnamn';
  @override
  String get generateRandomAlias => 'Skapa slumpmässigt enhetsnamn';
  @override
  String portWarning({required Object defaultPort}) =>
      'Andra enheter kanske inte hittar dig eftersom du använder en anpassad port. (Standard: ${defaultPort})';
  @override
  String get encryption => 'Kryptering';
  @override
  String get multicastGroup => 'Multicast-adress';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Andra enheter kanske inte hittar dig eftersom du använder en anpassad multicast-adress. (Standard: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$sv extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Övrigt';
  @override
  String get support => 'Stöd LocalSend';
  @override
  String get donate => 'Donera';
  @override
  String get privacyPolicy => 'Sekretesspolicy';
  @override
  String get termsOfUse => 'Användarvillkor';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$sv extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Den här enheten kan skicka filer till andra enheter, men andra enheter kan inte skicka filer till den.';
  @override
  String solution({required Object port}) => 'Detta beror troligen på brandväggen. Tillåt inkommande anslutningar via UDP och TCP på port ${port}.';
  @override
  String get openFirewall => 'Öppna brandväggsinställningarna';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$sv extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Denna enhet kan inte upptäcka andra enheter.';
  @override
  String get solution =>
      'Kontrollera att alla enheter är anslutna till samma Wi-Fi-nätverk och använder samma konfiguration för port, multicast-adress och kryptering. Försök att ange målenhetens IP-adress manuellt. Om det fungerar kan du lägga till målenheten i favoriterna så att den hittas automatiskt i framtiden.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$sv extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Enheterna kan varken hitta varandra eller dela filer.';
  @override
  String get solution =>
      'Om problemet finns på båda enheterna ska du kontrollera att de är anslutna till samma Wi-Fi-nätverk och använder samma konfiguration för port, multicast-adress och kryptering. Nätverket kan blockera kommunikation mellan enheter på grund av AP-isolering. I så fall måste AP-isolering inaktiveras i routern.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$sv extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Öppna fil';
  @override
  String get showInFolder => 'Visa i mapp';
  @override
  String get info => 'Information';
  @override
  String get deleteFromHistory => 'Ta bort från historiken';
}

// Path: progressPage.total
class _Translations$progressPage$total$sv extends Translations$progressPage$total$en {
  _Translations$progressPage$total$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$sv title = _Translations$progressPage$total$title$sv._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Filer: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Storlek: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Hastighet: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$sv extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';

  /// Använd ”h” som förkortning för timmar och ”m” för minuter
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$sv extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lägg till i val';
  @override
  String get content => 'Vad vill du lägga till?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$sv extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Öppna fil';
  @override
  String get content => 'Vill du öppna den mottagna filen?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$sv extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ange adress';
  @override
  String get recentlyUsed => 'Senast använda: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$sv extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Avbryt filöverföring';
  @override
  String get content => 'Vill du verkligen avbryta filöverföringen?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$sv extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kan inte öppna fil';
  @override
  String content({required Object file}) => 'Det gick inte att öppna ”${file}”. Har filen flyttats, bytt namn eller tagits bort?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$sv extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kryptering inaktiverad';
  @override
  String get content => 'Kommunikationen sker nu via det okrypterade HTTP-protokollet. Aktivera kryptering igen för att använda HTTPS-protokollet.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$sv extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$sv extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoriter';
  @override
  String get noFavorites => 'Inga favoritenheter ännu.';
  @override
  String get addFavorite => 'Lägg till';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$sv extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ta bort från favoriter';
  @override
  String content({required Object name}) => 'Vill du verkligen ta bort ”${name}” från favoriterna?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$sv extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Lägg till i favoriter';
  @override
  String get titleEdit => 'Inställningar';
  @override
  String get name => 'Enhetens namn';
  @override
  String get auto => '(automatiskt)';
  @override
  String get ip => 'IP-adress';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$sv extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Filinformation';
  @override
  String get fileName => 'Filnamn:';
  @override
  String get path => 'Sökväg:';
  @override
  String get size => 'Storlek:';
  @override
  String get sender => 'Avsändare:';
  @override
  String get time => 'Tid:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$sv extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ange filnamn';
  @override
  String original({required Object original}) => 'Original: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$sv extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rensa historiken';
  @override
  String get content => 'Vill du verkligen rensa hela historiken?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$sv extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend kan inte hitta andra enheter utan behörighet att söka i det lokala nätverket. Bevilja behörigheten i inställningarna.';
  @override
  String get gotoSettings => 'Inställningar';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$sv extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Skriv ett meddelande';
  @override
  String get multiline => 'Flera rader';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$sv extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inga filer valda';
  @override
  String get content => 'Välj minst en fil.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$sv extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Behörighet saknas';
  @override
  String get content => 'Nödvändiga behörigheter har inte beviljats. Bevilja dem i inställningarna.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$sv extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inte tillgängligt';
  @override
  String get content => 'Funktionen är endast tillgänglig på:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$sv extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kod';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$sv extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Snabbåtgärder';
  @override
  String get counter => 'Räknare';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Fyll ut med nollor';
  @override
  String get sortBeforeCount => 'Sortera alfabetiskt i förväg (A–Ö)';
  @override
  String get random => 'Slumpmässig';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$sv extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Filförfrågningar accepteras automatiskt. Observera att alla på det lokala nätverket kan skicka filer till dig.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$sv extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Filförfrågningar accepteras nu automatiskt från enheter i din favoritlista.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$sv extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ange PIN-kod';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$sv extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sändningslägen';
  @override
  String get single => 'Skickar filer till en mottagare. Valet rensas när filöverföringen är klar.';
  @override
  String get multiple => 'Skickar filer till flera mottagare. Valet rensas inte när filöverföringen är klar.';
  @override
  String get link => 'Mottagare som inte har LocalSend installerat kan ladda ner de valda filerna genom att öppna länken i sin webbläsare.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$sv extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$sv extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get dark => 'Mörkt';
  @override
  String get light => 'Ljust';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$sv extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$sv extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$sv extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Alla';
  @override
  String get filtered => 'Filtrerad';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$sv extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$sv._(TranslationsSv root) : this._root = root, super.internal(root);

  final TranslationsSv _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Totalt förlopp (${time})';
  @override
  String get finishedError => 'Slutförd med fel';
  @override
  String get canceledSender => 'Avbruten av sändaren';
  @override
  String get canceledReceiver => 'Avbruten av mottagaren';
}
