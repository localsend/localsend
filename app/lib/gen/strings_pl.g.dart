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
class TranslationsPl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.pl,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <pl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsPl _root = this; // ignore: unused_field

  @override
  TranslationsPl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Polski';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$pl general = _Translations$general$pl._(_root);
  @override
  late final _Translations$receiveTab$pl receiveTab = _Translations$receiveTab$pl._(_root);
  @override
  late final _Translations$sendTab$pl sendTab = _Translations$sendTab$pl._(_root);
  @override
  late final _Translations$settingsTab$pl settingsTab = _Translations$settingsTab$pl._(_root);
  @override
  late final _Translations$troubleshootPage$pl troubleshootPage = _Translations$troubleshootPage$pl._(_root);
  @override
  late final _Translations$receiveHistoryPage$pl receiveHistoryPage = _Translations$receiveHistoryPage$pl._(_root);
  @override
  late final _Translations$apkPickerPage$pl apkPickerPage = _Translations$apkPickerPage$pl._(_root);
  @override
  late final _Translations$selectedFilesPage$pl selectedFilesPage = _Translations$selectedFilesPage$pl._(_root);
  @override
  late final _Translations$receivePage$pl receivePage = _Translations$receivePage$pl._(_root);
  @override
  late final _Translations$receiveOptionsPage$pl receiveOptionsPage = _Translations$receiveOptionsPage$pl._(_root);
  @override
  late final _Translations$sendPage$pl sendPage = _Translations$sendPage$pl._(_root);
  @override
  late final _Translations$progressPage$pl progressPage = _Translations$progressPage$pl._(_root);
  @override
  late final _Translations$webSharePage$pl webSharePage = _Translations$webSharePage$pl._(_root);
  @override
  late final _Translations$aboutPage$pl aboutPage = _Translations$aboutPage$pl._(_root);
  @override
  late final _Translations$donationPage$pl donationPage = _Translations$donationPage$pl._(_root);
  @override
  late final _Translations$changelogPage$pl changelogPage = _Translations$changelogPage$pl._(_root);
  @override
  late final _Translations$dialogs$pl dialogs = _Translations$dialogs$pl._(_root);
  @override
  late final _Translations$sanitization$pl sanitization = _Translations$sanitization$pl._(_root);
  @override
  late final _Translations$tray$pl tray = _Translations$tray$pl._(_root);
  @override
  late final _Translations$web$pl web = _Translations$web$pl._(_root);
  @override
  late final _Translations$assetPicker$pl assetPicker = _Translations$assetPicker$pl._(_root);
  @override
  late final _Translations$networkInterfacesPage$pl networkInterfacesPage = _Translations$networkInterfacesPage$pl._(_root);
}

// Path: general
class _Translations$general$pl extends Translations$general$en {
  _Translations$general$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Akceptuj';
  @override
  String get accepted => 'Zaakceptowane';
  @override
  String get add => 'Dodaj';
  @override
  String get advanced => 'Zaawansowane';
  @override
  String get cancel => 'Anuluj';
  @override
  String get close => 'Zamknij';
  @override
  String get confirm => 'Potwierdź';
  @override
  String get continueStr => 'Dalej';
  @override
  String get copy => 'Kopiuj';
  @override
  String get copiedToClipboard => 'Skopiowane do schowka';
  @override
  String get decline => 'Odrzuć';
  @override
  String get done => 'Gotowe';
  @override
  String get delete => 'Usuń';
  @override
  String get edit => 'Edytuj';
  @override
  String get error => 'Błąd';
  @override
  String get example => 'Przykład';
  @override
  String get files => 'Pliki';
  @override
  String get finished => 'Skończone';
  @override
  String get hide => 'Schowaj';
  @override
  String get off => 'Wyłączony';
  @override
  String get offline => 'Offline';
  @override
  String get on => 'Włączony';
  @override
  String get online => 'Online';
  @override
  String get open => 'Otwórz';
  @override
  String get queue => 'Kolejka';
  @override
  String get quickSave => 'Szybki zapis';
  @override
  String get quickSaveFromFavorites => 'Szybki zapis dla „Ulubionych”';
  @override
  String get renamed => 'Przemianowany';
  @override
  String get reset => 'Resetowanie';
  @override
  String get restart => 'Restartuj';
  @override
  String get settings => 'Ustawienia';
  @override
  String get skipped => 'Pominięty';
  @override
  String get start => 'Zacznij';
  @override
  String get stop => 'Zatrzymaj';
  @override
  String get save => 'Zapisz';
  @override
  String get unchanged => 'Bez zmian';
  @override
  String get unknown => 'Nieznany';
  @override
  String get noItemInClipboard => 'Schowek jest pusty';
}

// Path: receiveTab
class _Translations$receiveTab$pl extends Translations$receiveTab$en {
  _Translations$receiveTab$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odbierz';
  @override
  late final _Translations$receiveTab$infoBox$pl infoBox = _Translations$receiveTab$infoBox$pl._(_root);
  @override
  late final _Translations$receiveTab$quickSave$pl quickSave = _Translations$receiveTab$quickSave$pl._(_root);
}

// Path: sendTab
class _Translations$sendTab$pl extends Translations$sendTab$en {
  _Translations$sendTab$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wyślij';
  @override
  late final _Translations$sendTab$selection$pl selection = _Translations$sendTab$selection$pl._(_root);
  @override
  late final _Translations$sendTab$picker$pl picker = _Translations$sendTab$picker$pl._(_root);
  @override
  String get shareIntentInfo => 'Możesz także skorzystać z funkcji „Udostępnij” swojego urządzenia mobilnego, aby łatwiej wybierać pliki.';
  @override
  String get nearbyDevices => 'Urządzenia w pobliżu';
  @override
  String get thisDevice => 'To urządzenie';
  @override
  String get scan => 'Szukaj urządzeń';
  @override
  String get manualSending => 'Wysyłanie ręczne';
  @override
  String get sendMode => 'Tryb wysyłania';
  @override
  late final _Translations$sendTab$sendModes$pl sendModes = _Translations$sendTab$sendModes$pl._(_root);
  @override
  String get sendModeHelp => 'Wyjaśnienie';
  @override
  String get help => 'Upewnij się, że żądany cel również znajduje się w tej samej sieci Wi-Fi.';
  @override
  String get placeItems => 'Umieść elementy do udostępnienia.';
}

// Path: settingsTab
class _Translations$settingsTab$pl extends Translations$settingsTab$en {
  _Translations$settingsTab$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ustawienia';
  @override
  late final _Translations$settingsTab$general$pl general = _Translations$settingsTab$general$pl._(_root);
  @override
  late final _Translations$settingsTab$receive$pl receive = _Translations$settingsTab$receive$pl._(_root);
  @override
  late final _Translations$settingsTab$send$pl send = _Translations$settingsTab$send$pl._(_root);
  @override
  late final _Translations$settingsTab$network$pl network = _Translations$settingsTab$network$pl._(_root);
  @override
  late final _Translations$settingsTab$other$pl other = _Translations$settingsTab$other$pl._(_root);
  @override
  String get advancedSettings => 'Zaawansowane ustawienia';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$pl extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rozwiązywanie problemów';
  @override
  String get subTitle => 'Aplikacja nie działa zgodnie z oczekiwaniami? Tutaj znajdziesz powszechne rozwiązania.';
  @override
  String get solution => 'Rozwiązanie:';
  @override
  String get fixButton => 'Napraw automatycznie';
  @override
  late final _Translations$troubleshootPage$firewall$pl firewall = _Translations$troubleshootPage$firewall$pl._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$pl noDiscovery = _Translations$troubleshootPage$noDiscovery$pl._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$pl noConnection = _Translations$troubleshootPage$noConnection$pl._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$pl extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Historia';
  @override
  String get openFolder => 'Otwórz folder';
  @override
  String get deleteHistory => 'Usuń historię';
  @override
  String get empty => 'Historia jest pusta.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$pl entryActions = _Translations$receiveHistoryPage$entryActions$pl._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$pl extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Aplikacje (APK)';
  @override
  String get excludeSystemApps => 'Wyklucz aplikacje systemowe';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Wyklucz aplikacje niewystartowalne';
  @override
  String apps({required Object n}) => '${n} aplikacje';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$pl extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Usuń wszystko';
}

// Path: receivePage
class _Translations$receivePage$pl extends Translations$receivePage$en {
  _Translations$receivePage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
    n,
    one: 'chce wysłać Ci plik',
    other: 'chce wysłać Ci ${n} plików',
  );
  @override
  String get subTitleMessage => 'wysłał Ci wiadomość:';
  @override
  String get subTitleLink => 'wysłał Ci link:';
  @override
  String get canceled => 'Nadawca anulował żądanie.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$pl extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Opcje';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(Folder LocalSend)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Wyłączono automatycznie, ponieważ istnieją katalogi.';
}

// Path: sendPage
class _Translations$sendPage$pl extends Translations$sendPage$en {
  _Translations$sendPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Czekanie na odpowiedź…';
  @override
  String get rejected => 'Odbiorca odrzucił żądanie.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Odbiorca jest zajęty innym żądaniem.';
}

// Path: progressPage
class _Translations$progressPage$pl extends Translations$progressPage$en {
  _Translations$progressPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Wysyłanie plików';
  @override
  String get titleReceiving => 'Odbieranie plików';
  @override
  String get savedToGallery => 'Zapisane w galerii';
  @override
  late final _Translations$progressPage$total$pl total = _Translations$progressPage$total$pl._(_root);
  @override
  late final _Translations$progressPage$remainingTime$pl remainingTime = _Translations$progressPage$remainingTime$pl._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$pl extends Translations$webSharePage$en {
  _Translations$webSharePage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Udostępnij przez link';
  @override
  String get loading => 'Uruchamianie serwera…';
  @override
  String get stopping => 'Zatrzymywanie serwera…';
  @override
  String get error => 'Wystąpił błąd podczas uruchamiania serwera.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
    n,
    one: 'Otwórz ten link w przeglądarce:',
    other: 'Otwórz jeden z tych linków w przeglądarce:',
  );
  @override
  String get requests => 'Żądania';
  @override
  String get noRequests => 'Brak żądań.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Automatycznie akceptuj żądania';
  @override
  String get requirePin => 'Wymagaj kodu PIN';
  @override
  String pinHint({required Object pin}) => 'Kod PIN to „${pin}”';
  @override
  String get encryptionHint => 'LocalSend używa samopodpisanego certyfikatu. Musisz go zaakceptować w przeglądarce.';
  @override
  String pendingRequests({required Object n}) => 'Oczekujące żądania: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$pl extends Translations$aboutPage$en {
  _Translations$aboutPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O LocalSend';
  @override
  List<String> get description => [
    'LocalSend jest darmową, otwartoźródłową aplikacją, która pozwala na bezpieczne udostępnianie plików i wiadomości urządzeniom w pobliżu poprzez Twoją sieć lokalną, bez konieczności połączenia z internetem.',
    'Ta aplikacja jest dostępna na systemach Android, iOS, macOS, Windows i Linux. Możesz znaleźć wszystkie opcje pobierania na oficjalnej stronie głównej.',
  ];
  @override
  String get author => 'Autor';
  @override
  String get contributors => 'Współautorzy';
  @override
  String get packagers => 'Pakujący';
  @override
  String get translators => 'Tłumacze';
}

// Path: donationPage
class _Translations$donationPage$pl extends Translations$donationPage$en {
  _Translations$donationPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Przekaż darowiznę';
  @override
  String get info =>
      'LocalSend jest darmową, otwartoźródłową aplikacją bez żadnych reklam. Jeśli podoba Ci się aplikacja, możesz wesprzeć jej rozwój darowizną.';
  @override
  String donate({required Object amount}) => 'Przekaż ${amount}';
  @override
  String get thanks => 'Bardzo Ci dziękuję!';
  @override
  String get restore => 'Przywróć zakup';
}

// Path: changelogPage
class _Translations$changelogPage$pl extends Translations$changelogPage$en {
  _Translations$changelogPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dziennik zmian';
}

// Path: dialogs
class _Translations$dialogs$pl extends Translations$dialogs$en {
  _Translations$dialogs$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$pl addFile = _Translations$dialogs$addFile$pl._(_root);
  @override
  late final _Translations$dialogs$openFile$pl openFile = _Translations$dialogs$openFile$pl._(_root);
  @override
  late final _Translations$dialogs$addressInput$pl addressInput = _Translations$dialogs$addressInput$pl._(_root);
  @override
  late final _Translations$dialogs$cancelSession$pl cancelSession = _Translations$dialogs$cancelSession$pl._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$pl cannotOpenFile = _Translations$dialogs$cannotOpenFile$pl._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$pl encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$pl._(_root);
  @override
  late final _Translations$dialogs$errorDialog$pl errorDialog = _Translations$dialogs$errorDialog$pl._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$pl favoriteDialog = _Translations$dialogs$favoriteDialog$pl._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$pl favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$pl._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$pl favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$pl._(_root);
  @override
  late final _Translations$dialogs$fileInfo$pl fileInfo = _Translations$dialogs$fileInfo$pl._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$pl fileNameInput = _Translations$dialogs$fileNameInput$pl._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$pl historyClearDialog = _Translations$dialogs$historyClearDialog$pl._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$pl localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$pl._(_root);
  @override
  late final _Translations$dialogs$messageInput$pl messageInput = _Translations$dialogs$messageInput$pl._(_root);
  @override
  late final _Translations$dialogs$noFiles$pl noFiles = _Translations$dialogs$noFiles$pl._(_root);
  @override
  late final _Translations$dialogs$noPermission$pl noPermission = _Translations$dialogs$noPermission$pl._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$pl notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$pl._(_root);
  @override
  late final _Translations$dialogs$qr$pl qr = _Translations$dialogs$qr$pl._(_root);
  @override
  late final _Translations$dialogs$quickActions$pl quickActions = _Translations$dialogs$quickActions$pl._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$pl quickSaveNotice = _Translations$dialogs$quickSaveNotice$pl._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$pl quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$pl._(_root);
  @override
  late final _Translations$dialogs$pin$pl pin = _Translations$dialogs$pin$pl._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$pl sendModeHelp = _Translations$dialogs$sendModeHelp$pl._(_root);
  @override
  late final _Translations$dialogs$zoom$pl zoom = _Translations$dialogs$zoom$pl._(_root);
}

// Path: sanitization
class _Translations$sanitization$pl extends Translations$sanitization$en {
  _Translations$sanitization$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Nazwa pliku nie może być pusta';
  @override
  String get invalid => 'Nazwa pliku zawiera nieprawidłowe znaki';
}

// Path: tray
class _Translations$tray$pl extends Translations$tray$en {
  _Translations$tray$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Zakończ LocalSend';
  @override
  String get closeWindows => 'Zamknij';
}

// Path: web
class _Translations$web$pl extends Translations$web$en {
  _Translations$web$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Wpisz kod PIN';
  @override
  String get invalidPin => 'Nieprawidłowy kod PIN';
  @override
  String get tooManyAttempts => 'Zbyt wiele prób';
  @override
  String get rejected => 'Odrzucone';
  @override
  String get files => 'Pliki';
  @override
  String get fileName => 'Nazwa pliku';
  @override
  String get size => 'Rozmiar';
}

// Path: assetPicker
class _Translations$assetPicker$pl extends Translations$assetPicker$en {
  _Translations$assetPicker$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Potwierdź';
  @override
  String get cancel => 'Anuluj';
  @override
  String get edit => 'Edytuj';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Nie udało się załadować';
  @override
  String get original => 'Oryginał';
  @override
  String get preview => 'Podgląd';
  @override
  String get select => 'Wybierz';
  @override
  String get emptyList => 'Pusta lista';
  @override
  String get unSupportedAssetType => 'Nieobsługiwany typ pliku.';
  @override
  String get unableToAccessAll => 'Nie można uzyskać dostępu do wszystkich plików na urządzeniu';
  @override
  String get viewingLimitedAssetsTip => 'Przeglądaj tylko pliki i albumy dostępne dla aplikacji.';
  @override
  String get changeAccessibleLimitedAssets => 'Kliknij, aby zaktualizować dostępne pliki';
  @override
  String get accessAllTip =>
      'Aplikacja może uzyskać dostęp tylko do niektórych plików na urządzeniu. Przejdź do ustawień systemowych i zezwól aplikacji na dostęp do wszystkich mediów na urządzeniu.';
  @override
  String get goToSystemSettings => 'Przejdź do ustawień systemowych';
  @override
  String get accessLimitedAssets => 'Kontynuuj z ograniczonym dostępem';
  @override
  String get accessiblePathName => 'Dostępne pliki';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get sTypeImageLabel => 'Obraz';
  @override
  String get sTypeVideoLabel => 'Wideo';
  @override
  String get sTypeOtherLabel => 'Inne media';
  @override
  String get sActionPlayHint => 'odtwarzaj';
  @override
  String get sActionPreviewHint => 'podgląd';
  @override
  String get sActionSelectHint => 'wybierz';
  @override
  String get sActionSwitchPathLabel => 'zmień ścieżkę';
  @override
  String get sActionUseCameraHint => 'użyj kamery';
  @override
  String get sNameDurationLabel => 'czas trwania';
  @override
  String get sUnitAssetCountLabel => 'liczba';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$pl extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get preview => 'Podgląd';
  @override
  String get whitelist => 'Biała lista';
  @override
  String get blacklist => 'Czarna lista';
  @override
  String get title => 'Interfejsy sieciowe';
  @override
  String get info =>
      'Domyślnie LocalSend używa wszystkich dostępnych interfejsów sieciowych. Możesz tutaj wykluczyć niechciane sieci. Musisz ponownie uruchomić serwer, aby zastosować zmiany.';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$pl extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Alias:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$pl extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Ulubione';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$pl extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wybór';
  @override
  String files({required Object files}) => 'Pliki: ${files}';
  @override
  String size({required Object size}) => 'Wielkość: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$pl extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Plik';
  @override
  String get folder => 'Folder';
  @override
  String get media => 'Media';
  @override
  String get text => 'Tekst';
  @override
  String get app => 'Aplikacja';
  @override
  String get clipboard => 'Wklej';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$pl extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Pojedynczy odbiorca';
  @override
  String get multiple => 'Wielu odbiorców';
  @override
  String get link => 'Udostępnij przez link';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$pl extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ogólne';
  @override
  String get brightness => 'Motyw';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$pl brightnessOptions = _Translations$settingsTab$general$brightnessOptions$pl._(
    _root,
  );
  @override
  String get color => 'Kolor';
  @override
  late final _Translations$settingsTab$general$colorOptions$pl colorOptions = _Translations$settingsTab$general$colorOptions$pl._(_root);
  @override
  String get language => 'Język';
  @override
  late final _Translations$settingsTab$general$languageOptions$pl languageOptions = _Translations$settingsTab$general$languageOptions$pl._(_root);
  @override
  String get saveWindowPlacement => 'Zapisz pozycję okna po zakończeniu';
  @override
  String get saveWindowPlacementWindows => 'Zapisz pozycję okna po zamknięciu';
  @override
  String get minimizeToTray => 'Zminimalizuj do menu ukrytych ikon przy zamykaniu';
  @override
  String get launchAtStartup => 'Autostart po zalogowaniu';
  @override
  String get launchMinimized => 'Autostart: start ukryty';
  @override
  String get showInContextMenu => 'Pokaż LocalSend w menu kontekstowym';
  @override
  String get animations => 'Animacje';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$pl extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Odbierz';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Zakończ automatycznie';
  @override
  String get destination => 'Miejsce docelowe';
  @override
  String get downloads => '(Pobrane)';
  @override
  String get saveToGallery => 'Zapisz media w galerii';
  @override
  String get saveToHistory => 'Zapisz w historii';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$pl extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wyślij';
  @override
  String get shareViaLinkAutoAccept => 'Udostępnij przez link: akceptuj automatycznie';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$pl extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sieć';
  @override
  String get needRestart => 'Uruchom ponownie serwer, aby zastosować ustawienia!';
  @override
  String get server => 'Serwer';
  @override
  String get alias => 'Alias';
  @override
  String get deviceType => 'Typ urządzenia';
  @override
  String get deviceModel => 'Model urządzenia';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Limit czasu wykrywania';
  @override
  String get useSystemName => 'Użyj nazwy systemu';
  @override
  String get generateRandomAlias => 'Wygeneruj losowy alias';
  @override
  String portWarning({required Object defaultPort}) =>
      'Inne urządzenia mogą nie wykryć Twojego urządzenia, ponieważ używasz niestandardowego portu. (domyślnie: ${defaultPort})';
  @override
  String get encryption => 'Szyfrowanie';
  @override
  String get multicastGroup => 'Multicast';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Inne urządzenia mogą nie wykryć Twojego urządzenia, ponieważ używasz niestandardowego adresu multicast. (domyślnie: ${defaultMulticast})';
  @override
  late final _Translations$settingsTab$network$networkOptions$pl networkOptions = _Translations$settingsTab$network$networkOptions$pl._(_root);
  @override
  String get network => 'Sieć';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$pl extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Inne';
  @override
  String get support => 'Wesprzyj LocalSend';
  @override
  String get donate => 'Przekaż darowiznę';
  @override
  String get privacyPolicy => 'Polityka prywatności';
  @override
  String get termsOfUse => 'Warunki korzystania';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$pl extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Aplikacja może wysyłać pliki do innych urządzeń, ale inne urządzenia nie mogą wysyłać plików do tego urządzenia.';
  @override
  String solution({required Object port}) =>
      'Prawdopodobnie jest to problem z zaporą. Możesz go rozwiązać, zezwalając na przychodzące połączenia (UDP i TCP) na porcie ${port}.';
  @override
  String get openFirewall => 'Otwórz zaporę';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$pl extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'To urządzenie nie może wykryć innych urządzeń.';
  @override
  String get solution =>
      'Upewnij się, że wszystkie urządzenia są w tej samej sieci Wi-Fi i mają tę samą konfigurację (port, adres multiemisji, szyfrowanie). Możesz spróbować wpisać adres IP urządzenia docelowego ręcznie. Jeśli to zadziała, rozważ dodanie tego urządzenia do ulubionych, aby mogło zostać automatycznie wykryte w przyszłości.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$pl extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Oba urządzenia nie mogą się nawzajem wykryć ani dzielić się plikami.';
  @override
  String get solution =>
      'Problem istnieje po obu stronach? Upewnij się, że oba urządzenia są w tej samej sieci Wi-Fi i mają takie same ustawienia (port, adres multicast, szyfrowanie). Wi-Fi może nie zezwalać na komunikację między uczestnikami z powodu izolacji punktu dostępu (AP). W takim przypadku tę opcję należy wyłączyć w routerze.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$pl extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Otwórz plik';
  @override
  String get showInFolder => 'Pokaż w folderze';
  @override
  String get info => 'Informacje';
  @override
  String get deleteFromHistory => 'Usuń z historii';
}

// Path: progressPage.total
class _Translations$progressPage$total$pl extends Translations$progressPage$total$en {
  _Translations$progressPage$total$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$pl title = _Translations$progressPage$total$title$pl._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Pliki: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Wielkość: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Prędkość: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$pl extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Użyj „h” w przypadku skrótu godzin i „m” w przypadku minut
  @override
  String hours({required Object h, required Object m}) => '${h}h ${m}m';

  /// Uży „d” w przypadku dni, „h” w przypadku godzin i „m” w przypadku minut
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}d ${h}h ${m}m';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$pl extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dodaj do wyboru';
  @override
  String get content => 'Co chcesz dodać?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$pl extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Otwórz plik';
  @override
  String get content => 'Czy chcesz otworzyć odebrany plik?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$pl extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wpisz adres';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'Adres IP';
  @override
  String get recentlyUsed => 'Ostatnio używane: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$pl extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Anuluj transfer plików';
  @override
  String get content => 'Czy na pewno chcesz anulować transfer plików?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$pl extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie można otworzyć pliku';
  @override
  String content({required Object file}) => 'Nie można otworzyć „${file}”. Czy ten plik został przeniesiony, zmieniono mu nazwę lub usunięto?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$pl extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Szyfrowanie wyłączone';
  @override
  String get content => 'Komunikacja odbywa się teraz za pomocą niezaszyfrowanego protokołu HTTP. Aby korzystać z HTTPS, włącz ponownie szyfrowanie.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$pl extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$pl extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ulubione';
  @override
  String get noFavorites => 'Brak ulubionych urządzeń.';
  @override
  String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$pl extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Usuń z ulubionych';
  @override
  String content({required Object name}) => 'Czy na pewno chcesz usunąć z ulubionych „${name}”?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$pl extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Dodaj do ulubionych';
  @override
  String get titleEdit => 'Dostosuj';
  @override
  String get name => 'Alias';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'Adres IP';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$pl extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Informacje o pliku';
  @override
  String get fileName => 'Nazwa pliku:';
  @override
  String get path => 'Ścieżka:';
  @override
  String get size => 'Rozmiar:';
  @override
  String get sender => 'Nadawca:';
  @override
  String get time => 'Czas:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$pl extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wpisz nazwę pliku';
  @override
  String original({required Object original}) => 'Oryginalny: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$pl extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wyczyść historię';
  @override
  String get content => 'Czy na pewno chcesz usunąć całą historię?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$pl extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend nie może znaleźć innych urządzeń bez uprawnienia do skanowania sieci lokalnej. Udziel tego uprawnienia w ustawieniach.';
  @override
  String get gotoSettings => 'Ustawienia';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$pl extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wpisz wiadomość';
  @override
  String get multiline => 'Wieloliniowy';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$pl extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nie wybrano pliku';
  @override
  String get content => 'Wybierz jeden plik.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$pl extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Brak uprawnień';
  @override
  String get content => 'Nie udzielono wymaganych uprawnień. Udziel ich w ustawieniach.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$pl extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Niedostępne';
  @override
  String get content => 'Ta funkcja jest dostępna tylko na:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$pl extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kod QR';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$pl extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Szybkie akcje';
  @override
  String get counter => 'Licznik';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Wypchnij zerami';
  @override
  String get sortBeforeCount => 'Wcześniej posortuj alfabetycznie';
  @override
  String get random => 'Losowy';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$pl extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Żądania plików są akceptowane automatycznie. Pamiętaj, że każdy w sieci lokalnej może przesyłać Ci pliki.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$pl extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Żądania plików są teraz akceptowane automatycznie z urządzeń na liście ulubionych.',
    'Uwaga! Obecnie nie jest to całkowicie bezpieczne, ponieważ haker, który ma odcisk palca dowolnego urządzenia z listy ulubionych, może wysyłać Ci pliki bez ograniczeń.',
    'Jednak ta opcja jest nadal bezpieczniejsza niż umożliwienie wszystkim użytkownikom w sieci lokalnej wysyłanie plików bez ograniczeń.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$pl extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Wpisz kod PIN';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$pl extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tryby wysyłania';
  @override
  String get single => 'Wysyła pliki do jednego odbiorcy. Wybór zostanie wyczyszczony po zakończonym transferze pliku.';
  @override
  String get multiple => 'Wysyła pliki do wielu odbiorców. Wybór nie zostanie wyczyszczony.';
  @override
  String get link => 'Odbiorcy, którzy nie mają zainstalowanego LocalSend, mogą pobrać wybrane pliki, otwierając link w swojej przeglądarce.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$pl extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adres URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$pl extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systemowy';
  @override
  String get dark => 'Ciemny';
  @override
  String get light => 'Jasny';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$pl extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systemowy';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$pl extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Systemowy';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$pl extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Wszystkie';
  @override
  String get filtered => 'Przefiltrowane';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$pl extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$pl._(TranslationsPl root) : this._root = root, super.internal(root);

  final TranslationsPl _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Całkowity postęp (${time})';
  @override
  String get finishedError => 'Zakończono z błędem';
  @override
  String get canceledSender => 'Anulowane przez nadawcę';
  @override
  String get canceledReceiver => 'Anulowane przez odbiorcę';
}
