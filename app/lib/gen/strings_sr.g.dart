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
class TranslationsSr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.sr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <sr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSr _root = this; // ignore: unused_field

  @override
  TranslationsSr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Srpski (latinica)';
  @override
  String get appName => 'LocalSend';
  @override
  late final Translations$general$sr general = Translations$general$sr.internal(_root);
  @override
  late final Translations$receiveTab$sr receiveTab = Translations$receiveTab$sr.internal(_root);
  @override
  late final Translations$sendTab$sr sendTab = Translations$sendTab$sr.internal(_root);
  @override
  late final Translations$settingsTab$sr settingsTab = Translations$settingsTab$sr.internal(_root);
  @override
  late final Translations$troubleshootPage$sr troubleshootPage = Translations$troubleshootPage$sr.internal(_root);
  @override
  late final Translations$receiveHistoryPage$sr receiveHistoryPage = Translations$receiveHistoryPage$sr.internal(_root);
  @override
  late final Translations$apkPickerPage$sr apkPickerPage = Translations$apkPickerPage$sr.internal(_root);
  @override
  late final Translations$selectedFilesPage$sr selectedFilesPage = Translations$selectedFilesPage$sr.internal(_root);
  @override
  late final Translations$receivePage$sr receivePage = Translations$receivePage$sr.internal(_root);
  @override
  late final Translations$receiveOptionsPage$sr receiveOptionsPage = Translations$receiveOptionsPage$sr.internal(_root);
  @override
  late final Translations$sendPage$sr sendPage = Translations$sendPage$sr.internal(_root);
  @override
  late final Translations$progressPage$sr progressPage = Translations$progressPage$sr.internal(_root);
  @override
  late final Translations$webSharePage$sr webSharePage = Translations$webSharePage$sr.internal(_root);
  @override
  late final Translations$aboutPage$sr aboutPage = Translations$aboutPage$sr.internal(_root);
  @override
  late final Translations$donationPage$sr donationPage = Translations$donationPage$sr.internal(_root);
  @override
  late final Translations$changelogPage$sr changelogPage = Translations$changelogPage$sr.internal(_root);
  @override
  late final Translations$aliasGenerator$sr aliasGenerator = Translations$aliasGenerator$sr.internal(_root);
  @override
  late final Translations$dialogs$sr dialogs = Translations$dialogs$sr.internal(_root);
  @override
  late final Translations$sanitization$sr sanitization = Translations$sanitization$sr.internal(_root);
  @override
  late final Translations$tray$sr tray = Translations$tray$sr.internal(_root);
  @override
  late final Translations$web$sr web = Translations$web$sr.internal(_root);
  @override
  late final Translations$assetPicker$sr assetPicker = Translations$assetPicker$sr.internal(_root);
  @override
  late final Translations$networkInterfacesPage$sr networkInterfacesPage = Translations$networkInterfacesPage$sr.internal(_root);
}

// Path: general
class Translations$general$sr extends Translations$general$en {
  Translations$general$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Prihvati';
  @override
  String get accepted => 'Prihvaćeno';
  @override
  String get add => 'Dodaj';
  @override
  String get advanced => 'Napredno';
  @override
  String get cancel => 'Otkaži';
  @override
  String get close => 'Zatvori';
  @override
  String get confirm => 'Potvrdi';
  @override
  String get continueStr => 'Nastavi';
  @override
  String get copy => 'Kopiraj';
  @override
  String get copiedToClipboard => 'Kopirano u privremenu memoriju';
  @override
  String get decline => 'Odbij';
  @override
  String get done => 'Gotovo';
  @override
  String get delete => 'Izbriši';
  @override
  String get edit => 'Izmeni';
  @override
  String get error => 'Greška';
  @override
  String get example => 'Primer';
  @override
  String get files => 'Fajlovi';
  @override
  String get finished => 'Završeno';
  @override
  String get hide => 'Sakrij';
  @override
  String get off => 'Isključeno';
  @override
  String get offline => 'Oflajn';
  @override
  String get on => 'Uključeno';
  @override
  String get online => 'Onlajn';
  @override
  String get open => 'Otvori';
  @override
  String get queue => 'Redosled';
  @override
  String get quickSave => 'Brzo čuvanje';
  @override
  String get quickSaveFromFavorites => 'Brzo čuvanje u „Omiljeno“';
  @override
  String get renamed => 'Preimenovano';
  @override
  String get reset => 'Poništi promene';
  @override
  String get restart => 'Restartuj';
  @override
  String get settings => 'Podešavanja';
  @override
  String get skipped => 'Preskočeno';
  @override
  String get start => 'Pokreni';
  @override
  String get stop => 'Zaustavi';
  @override
  String get save => 'Sačuvaj';
  @override
  String get unchanged => 'Nepromenjeno';
  @override
  String get unknown => 'Nepoznato';
  @override
  String get noItemInClipboard => 'Nema predmeta u privremenoj memoriji.';
}

// Path: receiveTab
class Translations$receiveTab$sr extends Translations$receiveTab$en {
  Translations$receiveTab$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primanje';
  @override
  late final Translations$receiveTab$infoBox$sr infoBox = Translations$receiveTab$infoBox$sr.internal(_root);
  @override
  late final Translations$receiveTab$quickSave$sr quickSave = Translations$receiveTab$quickSave$sr.internal(_root);
}

// Path: sendTab
class Translations$sendTab$sr extends Translations$sendTab$en {
  Translations$sendTab$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  late final Translations$sendTab$selection$sr selection = Translations$sendTab$selection$sr.internal(_root);
  @override
  late final Translations$sendTab$picker$sr picker = Translations$sendTab$picker$sr.internal(_root);
  @override
  String get shareIntentInfo => 'Takođe, možete da koristite funkciju „Deli“ na svom mobilnom uređaju da biste lakše birali fajlove.';
  @override
  String get nearbyDevices => 'Uređaji u blizini';
  @override
  String get thisDevice => 'Ovaj uređaj';
  @override
  String get scan => 'Pretraga uređaja';
  @override
  String get manualSending => 'Ručno slanje';
  @override
  String get sendMode => 'Režim slanja';
  @override
  late final Translations$sendTab$sendModes$sr sendModes = Translations$sendTab$sendModes$sr.internal(_root);
  @override
  String get sendModeHelp => 'Objašnjenje';
  @override
  String get help => 'Uverite se da je primalac takođe na istoj Wi-Fi mreži.';
  @override
  String get placeItems => 'Postavite predmete za deljenje.';
}

// Path: settingsTab
class Translations$settingsTab$sr extends Translations$settingsTab$en {
  Translations$settingsTab$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Podešavanja';
  @override
  late final Translations$settingsTab$general$sr general = Translations$settingsTab$general$sr.internal(_root);
  @override
  late final Translations$settingsTab$receive$sr receive = Translations$settingsTab$receive$sr.internal(_root);
  @override
  late final Translations$settingsTab$send$sr send = Translations$settingsTab$send$sr.internal(_root);
  @override
  late final Translations$settingsTab$network$sr network = Translations$settingsTab$network$sr.internal(_root);
  @override
  late final Translations$settingsTab$other$sr other = Translations$settingsTab$other$sr.internal(_root);
  @override
  String get advancedSettings => 'Napredna podešavanja';
}

// Path: troubleshootPage
class Translations$troubleshootPage$sr extends Translations$troubleshootPage$en {
  Translations$troubleshootPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otklanjanje grešaka';
  @override
  String get subTitle => 'Da li aplikacija radi kako treba? Ovde možete pronaći neka uobičajena rešenja problema.';
  @override
  String get solution => 'Rešenje:';
  @override
  String get fixButton => 'Popravi automatski';
  @override
  late final Translations$troubleshootPage$firewall$sr firewall = Translations$troubleshootPage$firewall$sr.internal(_root);
  @override
  late final Translations$troubleshootPage$noDiscovery$sr noDiscovery = Translations$troubleshootPage$noDiscovery$sr.internal(_root);
  @override
  late final Translations$troubleshootPage$noConnection$sr noConnection = Translations$troubleshootPage$noConnection$sr.internal(_root);
}

// Path: receiveHistoryPage
class Translations$receiveHistoryPage$sr extends Translations$receiveHistoryPage$en {
  Translations$receiveHistoryPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Istorija';
  @override
  String get openFolder => 'Otvori folder';
  @override
  String get deleteHistory => 'Izbriši istoriju';
  @override
  String get empty => 'Istorija je prazna.';
  @override
  late final Translations$receiveHistoryPage$entryActions$sr entryActions = Translations$receiveHistoryPage$entryActions$sr.internal(_root);
}

// Path: apkPickerPage
class Translations$apkPickerPage$sr extends Translations$apkPickerPage$en {
  Translations$apkPickerPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikacije (APK)';
  @override
  String get excludeSystemApps => 'Izuzmi sistemske aplikacije';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Izuzmi aplikacije koje se ne pokreću';
  @override
  String apps({required Object n}) => '${n} aplikacija';
}

// Path: selectedFilesPage
class Translations$selectedFilesPage$sr extends Translations$selectedFilesPage$en {
  Translations$selectedFilesPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Izbriši sve';
}

// Path: receivePage
class Translations$receivePage$sr extends Translations$receivePage$en {
  Translations$receivePage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
    n,
    one: 'želi da vam pošalje fajl',
    other: 'želi da vam pošalje ${n} fajlova',
  );
  @override
  String get subTitleMessage => 'poslao vam je poruku:';
  @override
  String get subTitleLink => 'poslao vam je link:';
  @override
  String get canceled => 'Pošiljalac je otkazao zahtev.';
}

// Path: receiveOptionsPage
class Translations$receiveOptionsPage$sr extends Translations$receiveOptionsPage$en {
  Translations$receiveOptionsPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opcije';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Automatski isključeno jer postoje folderi.';
}

// Path: sendPage
class Translations$sendPage$sr extends Translations$sendPage$en {
  Translations$sendPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Čekanje odgovora…';
  @override
  String get rejected => 'Primalac je odbio zahtev.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Primalac je zauzet drugim zahtevom.';
}

// Path: progressPage
class Translations$progressPage$sr extends Translations$progressPage$en {
  Translations$progressPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Slanje fajlova';
  @override
  String get titleReceiving => 'Primanje fajlova';
  @override
  String get savedToGallery => 'Sačuvano u galeriji';
  @override
  late final Translations$progressPage$total$sr total = Translations$progressPage$total$sr.internal(_root);
}

// Path: webSharePage
class Translations$webSharePage$sr extends Translations$webSharePage$en {
  Translations$webSharePage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Deljenje putem linka';
  @override
  String get loading => 'Pokretanje servera…';
  @override
  String get stopping => 'Zaustavljanje servera…';
  @override
  String get error => 'Došlo je do greške prilikom pokretanja servera.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(
    n,
    one: 'Otvorite ovaj link u vašem pregledaču:',
    other: 'Otvorite jedan od ovih linkova u vašem pregledaču:',
  );
  @override
  String get requests => 'Zahtevi';
  @override
  String get noRequests => 'Još uvek nema zahteva.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automatski prihvati zahteve';
  @override
  String get requirePin => 'Zahtevaj PIN';
  @override
  String pinHint({required Object pin}) => 'PIN je „${pin}“';
  @override
  String get encryptionHint => 'LocalSend koristi samopotpisani sertifikat. Morate ga prihvatiti u svom pregledaču.';
  @override
  String pendingRequests({required Object n}) => 'Zahtevi na čekanju: ${n}';
}

// Path: aboutPage
class Translations$aboutPage$sr extends Translations$aboutPage$en {
  Translations$aboutPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O LocalSend-u';
  @override
  List<String> get description => [
    'LocalSend je besplatna aplikacija otvorenog koda koja vam omogućava da bezbedno delite fajlove i poruke sa uređajima u blizini preko vaše lokalne mreže, bez potrebe za internet vezom.',
    'Ova aplikacije je dostupna za Android, iOS, macOS, Windows i Linux. Možete pronaći sve opcije za preuzimanje na zvaničnoj početnoj stranici.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Saradnici';
  @override
  String get packagers => 'Pakeri';
  @override
  String get translators => 'Prevodioci';
}

// Path: donationPage
class Translations$donationPage$sr extends Translations$donationPage$en {
  Translations$donationPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Donacija';
  @override
  String get info => 'LocalSend je besplatan, otvorenog koda i bez ikakvih oglasa. Ako vam se sviđa aplikacija, možete podržati razvoj donacijom.';
  @override
  String donate({required Object amount}) => 'Doniraj ${amount}';
  @override
  String get thanks => 'Hvala vam puno!';
  @override
  String get restore => 'Vrati kupovinu';
}

// Path: changelogPage
class Translations$changelogPage$sr extends Translations$changelogPage$en {
  Translations$changelogPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Evidencija promena';
}

// Path: aliasGenerator
class Translations$aliasGenerator$sr extends Translations$aliasGenerator$en {
  Translations$aliasGenerator$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Neodoljiva',
    'Prelepa',
    'Velika',
    'Bistra',
    'Čista',
    'Pametna',
    'Hladnjikava',
    'Slatka',
    'Lukava',
    'Odlučna',
    'Energetska',
    'Efikasna',
    'Fantastična',
    'Brza',
    'Fina',
    'Sveža',
    'Dobra',
    'Divna',
    'Velika',
    'Zgodna',
    'Vruća',
    'Nežna',
    'Ljubazna',
    'Mistična',
    'Uredna',
    'Lepa',
    'Strpljiva',
    'Prelepa',
    'Moćna',
    'Bogata',
    'Tajnovita',
    'Pametna',
    'Čvrsta',
    'Specijalna',
    'Budjava',
    'Jaka',
    'Uredna',
    'Mudra',
  ];
  @override
  List<String> get fruits => [
    'Jabuka',
    'Šljiva',
    'Banana',
    'Borovnica',
    'Ribizla',
    'Kajsija',
    'Šargarepa',
    'Trešnja',
    'Paprika',
    'Papričica',
    'Krompiruša',
    'Kupusara',
    'Rotkvica',
    'Lubenica',
    'Pečurka',
    'Mandarina',
    'Pomorandža',
    'Papaja',
    'Breskva',
    'Kruška',
    'Šišarka',
    'Dinja',
    'Bundeva',
    'Višnja',
    'Jagoda',
    'Dunja',
  ];

  /// In some languages, the adjective must be last. Not the case in Serbian, but serbian adjectives must have endings which depend on the gender of the noun. That's why we put all the Fruits with the female form and corresponding adjective endings in female form for this translation.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class Translations$dialogs$sr extends Translations$dialogs$en {
  Translations$dialogs$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$dialogs$addFile$sr addFile = Translations$dialogs$addFile$sr.internal(_root);
  @override
  late final Translations$dialogs$openFile$sr openFile = Translations$dialogs$openFile$sr.internal(_root);
  @override
  late final Translations$dialogs$addressInput$sr addressInput = Translations$dialogs$addressInput$sr.internal(_root);
  @override
  late final Translations$dialogs$cancelSession$sr cancelSession = Translations$dialogs$cancelSession$sr.internal(_root);
  @override
  late final Translations$dialogs$cannotOpenFile$sr cannotOpenFile = Translations$dialogs$cannotOpenFile$sr.internal(_root);
  @override
  late final Translations$dialogs$encryptionDisabledNotice$sr encryptionDisabledNotice = Translations$dialogs$encryptionDisabledNotice$sr.internal(
    _root,
  );
  @override
  late final Translations$dialogs$errorDialog$sr errorDialog = Translations$dialogs$errorDialog$sr.internal(_root);
  @override
  late final Translations$dialogs$favoriteDialog$sr favoriteDialog = Translations$dialogs$favoriteDialog$sr.internal(_root);
  @override
  late final Translations$dialogs$favoriteDeleteDialog$sr favoriteDeleteDialog = Translations$dialogs$favoriteDeleteDialog$sr.internal(_root);
  @override
  late final Translations$dialogs$favoriteEditDialog$sr favoriteEditDialog = Translations$dialogs$favoriteEditDialog$sr.internal(_root);
  @override
  late final Translations$dialogs$fileInfo$sr fileInfo = Translations$dialogs$fileInfo$sr.internal(_root);
  @override
  late final Translations$dialogs$fileNameInput$sr fileNameInput = Translations$dialogs$fileNameInput$sr.internal(_root);
  @override
  late final Translations$dialogs$historyClearDialog$sr historyClearDialog = Translations$dialogs$historyClearDialog$sr.internal(_root);
  @override
  late final Translations$dialogs$localNetworkUnauthorized$sr localNetworkUnauthorized = Translations$dialogs$localNetworkUnauthorized$sr.internal(
    _root,
  );
  @override
  late final Translations$dialogs$messageInput$sr messageInput = Translations$dialogs$messageInput$sr.internal(_root);
  @override
  late final Translations$dialogs$noFiles$sr noFiles = Translations$dialogs$noFiles$sr.internal(_root);
  @override
  late final Translations$dialogs$noPermission$sr noPermission = Translations$dialogs$noPermission$sr.internal(_root);
  @override
  late final Translations$dialogs$notAvailableOnPlatform$sr notAvailableOnPlatform = Translations$dialogs$notAvailableOnPlatform$sr.internal(_root);
  @override
  late final Translations$dialogs$qr$sr qr = Translations$dialogs$qr$sr.internal(_root);
  @override
  late final Translations$dialogs$quickActions$sr quickActions = Translations$dialogs$quickActions$sr.internal(_root);
  @override
  late final Translations$dialogs$quickSaveNotice$sr quickSaveNotice = Translations$dialogs$quickSaveNotice$sr.internal(_root);
  @override
  late final Translations$dialogs$quickSaveFromFavoritesNotice$sr quickSaveFromFavoritesNotice =
      Translations$dialogs$quickSaveFromFavoritesNotice$sr.internal(_root);
  @override
  late final Translations$dialogs$pin$sr pin = Translations$dialogs$pin$sr.internal(_root);
  @override
  late final Translations$dialogs$sendModeHelp$sr sendModeHelp = Translations$dialogs$sendModeHelp$sr.internal(_root);
  @override
  late final Translations$dialogs$zoom$sr zoom = Translations$dialogs$zoom$sr.internal(_root);
}

// Path: sanitization
class Translations$sanitization$sr extends Translations$sanitization$en {
  Translations$sanitization$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Naziv fajla ne može biti prazan';
  @override
  String get invalid => 'Naziv fajla sadrži nevažeće znakove';
}

// Path: tray
class Translations$tray$sr extends Translations$tray$en {
  Translations$tray$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Napusti LocalSend';
  @override
  String get closeWindows => 'Izađi';
}

// Path: web
class Translations$web$sr extends Translations$web$en {
  Translations$web$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Unesite PIN';
  @override
  String get invalidPin => 'Neispravan PIN';
  @override
  String get tooManyAttempts => 'Previše pokušaja';
  @override
  String get rejected => 'Odbijeno';
  @override
  String get files => 'Fajlovi';
  @override
  String get fileName => 'Naziv fajla';
  @override
  String get size => 'Veličina';
}

// Path: assetPicker
class Translations$assetPicker$sr extends Translations$assetPicker$en {
  Translations$assetPicker$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potvrdi';
  @override
  String get cancel => 'Otkaži';
  @override
  String get edit => 'Izmeni';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Učitavanje neuspešno';
  @override
  String get original => 'Poreklo';
  @override
  String get preview => 'Pregled';
  @override
  String get select => 'Izaberi';
  @override
  String get emptyList => 'Očisti listu';
  @override
  String get unSupportedAssetType => 'Nepodržan tip fajla.';
  @override
  String get unableToAccessAll => 'Nije moguće pristupiti svim fajlovima na uređaju';
  @override
  String get viewingLimitedAssetsTip => 'Samo fajlovi za gledanje i albumi dostupni aplikaciji.';
  @override
  String get changeAccessibleLimitedAssets => 'Dodirnite da ažurirate dostupne fajlove';
  @override
  String get accessAllTip =>
      'Aplikacija može da pristupi samo nekim fajlovima na uređaju. Idite u sistemska podešavanja i dozvolite aplikaciji pristup svim medijima na uređaju.';
  @override
  String get goToSystemSettings => 'Idi u sistemska podešavanja';
  @override
  String get accessLimitedAssets => 'Nastavi sa ograničenim pristupom';
  @override
  String get accessiblePathName => 'Dostupni fajlovi';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Slika';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Ostali mediji';
  @override
  String get sActionPlayHint => 'pusti';
  @override
  String get sActionPreviewHint => 'pregled';
  @override
  String get sActionSelectHint => 'izaberi';
  @override
  String get sActionSwitchPathLabel => 'promeni putanju';
  @override
  String get sActionUseCameraHint => 'koristi kameru';
  @override
  String get sNameDurationLabel => 'trajanje';
  @override
  String get sUnitAssetCountLabel => 'broj';
}

// Path: networkInterfacesPage
class Translations$networkInterfacesPage$sr extends Translations$networkInterfacesPage$en {
  Translations$networkInterfacesPage$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mrežni interfejsi';
  @override
  String get preview => 'Pregled';
  @override
  String get whitelist => 'Bela lista';
  @override
  String get blacklist => 'Crna lista';
  @override
  String get info =>
      'Podrazumevano, LocalSend koristi sve dostupne mrežne interfejse. Ovde možete izuzeti neželjene mreže. Morate restartovati server da bi se primenile promene.';
}

// Path: receiveTab.infoBox
class Translations$receiveTab$infoBox$sr extends Translations$receiveTab$infoBox$en {
  Translations$receiveTab$infoBox$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Naziv uređaja:';
}

// Path: receiveTab.quickSave
class Translations$receiveTab$quickSave$sr extends Translations$receiveTab$quickSave$en {
  Translations$receiveTab$quickSave$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Omiljeno';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class Translations$sendTab$selection$sr extends Translations$sendTab$selection$en {
  Translations$sendTab$selection$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbor';
  @override
  String files({required Object files}) => 'Fajlovi: ${files}';
  @override
  String size({required Object size}) => 'Veličina: ${size}';
}

// Path: sendTab.picker
class Translations$sendTab$picker$sr extends Translations$sendTab$picker$en {
  Translations$sendTab$picker$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fajl';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Mediji';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'Aplikacija';
  @override
  String get clipboard => 'Nalepi';
}

// Path: sendTab.sendModes
class Translations$sendTab$sendModes$sr extends Translations$sendTab$sendModes$en {
  Translations$sendTab$sendModes$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Jedan primalac';
  @override
  String get multiple => 'Više primalaca';
  @override
  String get link => 'Deljenje putem linka';
}

// Path: settingsTab.general
class Translations$settingsTab$general$sr extends Translations$settingsTab$general$en {
  Translations$settingsTab$general$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opšte';
  @override
  String get brightness => 'Tema';
  @override
  late final Translations$settingsTab$general$brightnessOptions$sr brightnessOptions = Translations$settingsTab$general$brightnessOptions$sr.internal(
    _root,
  );
  @override
  String get color => 'Boja';
  @override
  late final Translations$settingsTab$general$colorOptions$sr colorOptions = Translations$settingsTab$general$colorOptions$sr.internal(_root);
  @override
  String get language => 'Jezik';
  @override
  late final Translations$settingsTab$general$languageOptions$sr languageOptions = Translations$settingsTab$general$languageOptions$sr.internal(
    _root,
  );
  @override
  String get saveWindowPlacement => 'Sačuvaj položaj prozora nakon napuštanja';
  @override
  String get saveWindowPlacementWindows => 'Sačuvaj položaj prozora nakon izlaženja';
  @override
  String get minimizeToTray => 'Minimiziraj na sistemsku traku/traku menija prilikom zatvaranja';
  @override
  String get launchAtStartup => 'Automatski pokreni nakon prijave';
  @override
  String get launchMinimized => 'Automatsko pokretanje: Pokretanje skriveno';
  @override
  String get showInContextMenu => 'Prikaži LocalSend u kontekstualnom meniju';
  @override
  String get animations => 'Animacije';
}

// Path: settingsTab.receive
class Translations$settingsTab$receive$sr extends Translations$settingsTab$receive$en {
  Translations$settingsTab$receive$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Primanje';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Automatski završi';
  @override
  String get destination => 'Čuvanje u folder';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'Sačuvaj medije u galeriju';
  @override
  String get saveToHistory => 'Sačuvaj u istoriji';
}

// Path: settingsTab.send
class Translations$settingsTab$send$sr extends Translations$settingsTab$send$en {
  Translations$settingsTab$send$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slanje';
  @override
  String get shareViaLinkAutoAccept => 'Automatski prihvati zahteve u režimu „Deljenje putem linka“';
}

// Path: settingsTab.network
class Translations$settingsTab$network$sr extends Translations$settingsTab$network$en {
  Translations$settingsTab$network$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mreža';
  @override
  String get needRestart => 'Restartujte server da bi se primenila podešavanja!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Naziv uređaja';
  @override
  String get deviceType => 'Tip uređaja';
  @override
  String get deviceModel => 'Model uređaja';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Otkrivanje je isteklo';
  @override
  String get useSystemName => 'Koristi sistemski naziv';
  @override
  String get generateRandomAlias => 'Generiši nasumični pseudonim';
  @override
  String portWarning({required Object defaultPort}) =>
      'Drugi uređaji vas možda neće otkriti, jer koristite prilagođeni port. (podrazumevani: ${defaultPort})';
  @override
  String get encryption => 'Šifrovanje';
  @override
  String get multicastGroup => 'Adresa višesmernog emitovanja';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Drugi uređaji vas možda neće otkriti, jer koristite prilagođenu adresu višesmernog emitovanja. (podrazumevana: ${defaultMulticast})';
  @override
  String get network => 'Mreža';
  @override
  late final Translations$settingsTab$network$networkOptions$sr networkOptions = Translations$settingsTab$network$networkOptions$sr.internal(_root);
}

// Path: settingsTab.other
class Translations$settingsTab$other$sr extends Translations$settingsTab$other$en {
  Translations$settingsTab$other$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ostalo';
  @override
  String get support => 'Podržite LocalSend';
  @override
  String get donate => 'Doniraj';
  @override
  String get privacyPolicy => 'Politika privatnosti';
  @override
  String get termsOfUse => 'Uslovi korišćenja';
}

// Path: troubleshootPage.firewall
class Translations$troubleshootPage$firewall$sr extends Translations$troubleshootPage$firewall$en {
  Translations$troubleshootPage$firewall$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ovaj uređaj može slati fajlove drugim uređajima, ali drugi uređaji ne mogu slati fajlove ovom uređaju.';
  @override
  String solution({required Object port}) =>
      'Ovo je najverovatnije problem sa zaštitnim zidom. Ovo možete rešiti tako što ćete dozvoliti dolazne veze (UDP i TCP) na portu ${port}.';
  @override
  String get openFirewall => 'Otvori zaštitni zid';
}

// Path: troubleshootPage.noDiscovery
class Translations$troubleshootPage$noDiscovery$sr extends Translations$troubleshootPage$noDiscovery$en {
  Translations$troubleshootPage$noDiscovery$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Ovaj uređaj ne može da otkrije druge uređaje.';
  @override
  String get solution =>
      'Uverite se da su svi uređaji na istoj Wi-Fi mreži i da imaju istu konfiguraciju (port, adresa višesmernog emitovanja, šifrovanje). Možete pokušati da ručno unesete IP adresu ciljnog uređaja. Ako ovo funkcioniše, razmislite o dodavanju ovog uređaja u omiljene kako bi se mogao automatski otkriti u budućnosti.';
}

// Path: troubleshootPage.noConnection
class Translations$troubleshootPage$noConnection$sr extends Translations$troubleshootPage$noConnection$en {
  Translations$troubleshootPage$noConnection$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Oba uređaja ne mogu da otkriju jedan drugog niti mogu da dele fajlove.';
  @override
  String get solution =>
      'Da li problem postoji na obe strane? Ako je tako, potrebno je da se uverite da su oba uređaja na istoj Wi-Fi mreži i da imaju istu konfiguraciju (port, adresa višesmernog emitovanja, šifrovanje). Wi-Fi mreža možda neće dozvoliti komunikaciju između učesnika zbog izolacije pristupne tačke (AP). U ovom slučaju, ova opcija mora biti onemogućena na ruteru.';
}

// Path: receiveHistoryPage.entryActions
class Translations$receiveHistoryPage$entryActions$sr extends Translations$receiveHistoryPage$entryActions$en {
  Translations$receiveHistoryPage$entryActions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otvori fajl';
  @override
  String get showInFolder => 'Prikaži u folderu';
  @override
  String get info => 'Informacije';
  @override
  String get deleteFromHistory => 'Izbriši iz istorije';
}

// Path: progressPage.total
class Translations$progressPage$total$sr extends Translations$progressPage$total$en {
  Translations$progressPage$total$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  late final Translations$progressPage$total$title$sr title = Translations$progressPage$total$title$sr.internal(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fajlova: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Veličina: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Brzina: ${speed}/s';
}

// Path: dialogs.addFile
class Translations$dialogs$addFile$sr extends Translations$dialogs$addFile$en {
  Translations$dialogs$addFile$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodajte u izbor';
  @override
  String get content => 'Šta želite dodati?';
}

// Path: dialogs.openFile
class Translations$dialogs$openFile$sr extends Translations$dialogs$openFile$en {
  Translations$dialogs$openFile$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otvori fajl';
  @override
  String get content => 'Želite li da otvorite primljeni fajl?';
}

// Path: dialogs.addressInput
class Translations$dialogs$addressInput$sr extends Translations$dialogs$addressInput$en {
  Translations$dialogs$addressInput$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite adresu';
  @override
  String get hashtag => 'Heš-oznaka';
  @override
  String get ip => 'IP adresa';
  @override
  String get recentlyUsed => 'Nedavno korišćeno: ';
}

// Path: dialogs.cancelSession
class Translations$dialogs$cancelSession$sr extends Translations$dialogs$cancelSession$en {
  Translations$dialogs$cancelSession$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otkažite prenos fajlova';
  @override
  String get content => 'Želite li zaista da otkažete prenos fajlova?';
}

// Path: dialogs.cannotOpenFile
class Translations$dialogs$cannotOpenFile$sr extends Translations$dialogs$cannotOpenFile$en {
  Translations$dialogs$cannotOpenFile$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije moguće otvoriti fajl';
  @override
  String content({required Object file}) => 'Nije moguće otvoriti „${file}“. Da li je ovaj fajl premešten, preimenovan ili izbrisan?';
}

// Path: dialogs.encryptionDisabledNotice
class Translations$dialogs$encryptionDisabledNotice$sr extends Translations$dialogs$encryptionDisabledNotice$en {
  Translations$dialogs$encryptionDisabledNotice$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Šifrovanje onemogućeno';
  @override
  String get content =>
      'Komunikacija se sada odvija preko nešifrovanog HTTP protokola. Da biste koristili HTTPS protokol, ponovo omogućite šifrovanje.';
}

// Path: dialogs.errorDialog
class Translations$dialogs$errorDialog$sr extends Translations$dialogs$errorDialog$en {
  Translations$dialogs$errorDialog$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class Translations$dialogs$favoriteDialog$sr extends Translations$dialogs$favoriteDialog$en {
  Translations$dialogs$favoriteDialog$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Omiljeno';
  @override
  String get noFavorites => 'Još uvek nema omiljenih uređaja.';
  @override
  String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class Translations$dialogs$favoriteDeleteDialog$sr extends Translations$dialogs$favoriteDeleteDialog$en {
  Translations$dialogs$favoriteDeleteDialog$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Izbriši iz omiljenih';
  @override
  String content({required Object name}) => 'Želite li zaista da izbrišete „${name}“ iz omiljenih?';
}

// Path: dialogs.favoriteEditDialog
class Translations$dialogs$favoriteEditDialog$sr extends Translations$dialogs$favoriteEditDialog$en {
  Translations$dialogs$favoriteEditDialog$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Dodajte u omiljene';
  @override
  String get titleEdit => 'Podešavanja';
  @override
  String get name => 'Naziv uređaja';
  @override
  String get auto => '(automatski)';
  @override
  String get ip => 'IP adresa';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class Translations$dialogs$fileInfo$sr extends Translations$dialogs$fileInfo$en {
  Translations$dialogs$fileInfo$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informacije o fajlu';
  @override
  String get fileName => 'Naziv fajla:';
  @override
  String get path => 'Putanja:';
  @override
  String get size => 'Veličina:';
  @override
  String get sender => 'Pošiljalac:';
  @override
  String get time => 'Vreme:';
}

// Path: dialogs.fileNameInput
class Translations$dialogs$fileNameInput$sr extends Translations$dialogs$fileNameInput$en {
  Translations$dialogs$fileNameInput$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite naziv fajla';
  @override
  String original({required Object original}) => 'Originalni naziv fajla: ${original}';
}

// Path: dialogs.historyClearDialog
class Translations$dialogs$historyClearDialog$sr extends Translations$dialogs$historyClearDialog$en {
  Translations$dialogs$historyClearDialog$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Očistite istoriju';
  @override
  String get content => 'Želite li zaista da očistite čitavu istoriju?';
}

// Path: dialogs.localNetworkUnauthorized
class Translations$dialogs$localNetworkUnauthorized$sr extends Translations$dialogs$localNetworkUnauthorized$en {
  Translations$dialogs$localNetworkUnauthorized$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend ne može da pronađe druge uređaje bez dozvole za skeniranje lokalne mreže. Dajte ovu dozvolu u podešavanjima.';
  @override
  String get gotoSettings => 'Podešavanja';
}

// Path: dialogs.messageInput
class Translations$dialogs$messageInput$sr extends Translations$dialogs$messageInput$en {
  Translations$dialogs$messageInput$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Napišite poruku';
  @override
  String get multiline => 'Više redova';
}

// Path: dialogs.noFiles
class Translations$dialogs$noFiles$sr extends Translations$dialogs$noFiles$en {
  Translations$dialogs$noFiles$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije izabran nijedan fajl';
  @override
  String get content => 'Izaberite bar jedan fajl.';
}

// Path: dialogs.noPermission
class Translations$dialogs$noPermission$sr extends Translations$dialogs$noPermission$en {
  Translations$dialogs$noPermission$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nema dozvole';
  @override
  String get content => 'Niste dali neophodne dozvole. Dajte ih u podešavanjima.';
}

// Path: dialogs.notAvailableOnPlatform
class Translations$dialogs$notAvailableOnPlatform$sr extends Translations$dialogs$notAvailableOnPlatform$en {
  Translations$dialogs$notAvailableOnPlatform$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nije dostupno';
  @override
  String get content => 'Ova funkcija je dostupna samo na:';
}

// Path: dialogs.qr
class Translations$dialogs$qr$sr extends Translations$dialogs$qr$en {
  Translations$dialogs$qr$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR kôd';
}

// Path: dialogs.quickActions
class Translations$dialogs$quickActions$sr extends Translations$dialogs$quickActions$en {
  Translations$dialogs$quickActions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Brze radnje';
  @override
  String get counter => 'Brojač';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Dopuna nulama';
  @override
  String get sortBeforeCount => 'Sortiraj unapred po abecedi (A-Z)';
  @override
  String get random => 'Nasumično';
}

// Path: dialogs.quickSaveNotice
class Translations$dialogs$quickSaveNotice$sr extends Translations$dialogs$quickSaveNotice$en {
  Translations$dialogs$quickSaveNotice$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Zahtevi za fajlove se sada automatski prihvataju. Imajte na umu da svi na lokalnoj mreži mogu da vam šalju fajlove.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class Translations$dialogs$quickSaveFromFavoritesNotice$sr extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  Translations$dialogs$quickSaveFromFavoritesNotice$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Zahtevi za fajlove se sada automatski prihvataju sa uređaja koji su na vašoj listi omiljenih.',
    'Upozorenje! Trenutno, ovo nije potpuno bezbedno, jer haker koji ima otisak prsta bilo kog uređaja sa vaše liste omiljenih može da vam šalje fajlove bez ograničenja.',
    'Ipak, ova opcija je i dalje bezbednija od dopuštanja svim korisnicima na lokalnoj mreži da vam šalju fajlove bez ograničenja.',
  ];
}

// Path: dialogs.pin
class Translations$dialogs$pin$sr extends Translations$dialogs$pin$en {
  Translations$dialogs$pin$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unesite PIN';
}

// Path: dialogs.sendModeHelp
class Translations$dialogs$sendModeHelp$sr extends Translations$dialogs$sendModeHelp$en {
  Translations$dialogs$sendModeHelp$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Režimi slanja';
  @override
  String get single => 'Slanje fajlova jednom primaocu. Izbor će biti očišćen nakon završenog prenosa fajlova.';
  @override
  String get multiple => 'Slanje fajlova više primalaca. Izbor neće biti očišćen nakon završenog prenosa fajlova.';
  @override
  String get link => 'Primaoci koji nemaju instaliran LocalSend mogu preuzeti izabrane fajlove otvaranjem linka u svom pregledaču.';
}

// Path: dialogs.zoom
class Translations$dialogs$zoom$sr extends Translations$dialogs$zoom$en {
  Translations$dialogs$zoom$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class Translations$settingsTab$general$brightnessOptions$sr extends Translations$settingsTab$general$brightnessOptions$en {
  Translations$settingsTab$general$brightnessOptions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemska';
  @override
  String get dark => 'Tamna';
  @override
  String get light => 'Svetla';
}

// Path: settingsTab.general.colorOptions
class Translations$settingsTab$general$colorOptions$sr extends Translations$settingsTab$general$colorOptions$en {
  Translations$settingsTab$general$colorOptions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemska';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class Translations$settingsTab$general$languageOptions$sr extends Translations$settingsTab$general$languageOptions$en {
  Translations$settingsTab$general$languageOptions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistemski';
}

// Path: settingsTab.network.networkOptions
class Translations$settingsTab$network$networkOptions$sr extends Translations$settingsTab$network$networkOptions$en {
  Translations$settingsTab$network$networkOptions$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String get filtered => 'Filtrirana';
  @override
  String get all => 'Sve';
}

// Path: progressPage.total.title
class Translations$progressPage$total$title$sr extends Translations$progressPage$total$title$en {
  Translations$progressPage$total$title$sr.internal(TranslationsSr root) : this._root = root, super.internal(root);

  final TranslationsSr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Ukupan napredak (${time})';
  @override
  String get finishedError => 'Završeno sa greškom';
  @override
  String get canceledSender => 'Pošiljalac je otkazao';
  @override
  String get canceledReceiver => 'Primalac je otkazao';
}
