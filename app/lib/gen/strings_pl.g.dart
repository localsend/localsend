part of 'strings.g.dart';

// Path: <root>
class _StringsPl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsPl _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Polska';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralPl general = _StringsGeneralPl._(_root);
	@override late final _StringsReceiveTabPl receiveTab = _StringsReceiveTabPl._(_root);
	@override late final _StringsSendTabPl sendTab = _StringsSendTabPl._(_root);
	@override late final _StringsSettingsTabPl settingsTab = _StringsSettingsTabPl._(_root);
	@override late final _StringsTroubleshootPagePl troubleshootPage = _StringsTroubleshootPagePl._(_root);
	@override late final _StringsReceiveHistoryPagePl receiveHistoryPage = _StringsReceiveHistoryPagePl._(_root);
	@override late final _StringsApkPickerPagePl apkPickerPage = _StringsApkPickerPagePl._(_root);
	@override late final _StringsSelectedFilesPagePl selectedFilesPage = _StringsSelectedFilesPagePl._(_root);
	@override late final _StringsReceivePagePl receivePage = _StringsReceivePagePl._(_root);
	@override late final _StringsReceiveOptionsPagePl receiveOptionsPage = _StringsReceiveOptionsPagePl._(_root);
	@override late final _StringsSendPagePl sendPage = _StringsSendPagePl._(_root);
	@override late final _StringsProgressPagePl progressPage = _StringsProgressPagePl._(_root);
	@override late final _StringsWebSharePagePl webSharePage = _StringsWebSharePagePl._(_root);
	@override late final _StringsAboutPagePl aboutPage = _StringsAboutPagePl._(_root);
	@override late final _StringsDonationPagePl donationPage = _StringsDonationPagePl._(_root);
	@override late final _StringsChangelogPagePl changelogPage = _StringsChangelogPagePl._(_root);
	@override late final _StringsAliasGeneratorPl aliasGenerator = _StringsAliasGeneratorPl._(_root);
	@override late final _StringsDialogsPl dialogs = _StringsDialogsPl._(_root);
	@override late final _StringsTrayPl tray = _StringsTrayPl._(_root);
	@override late final _StringsWebPl web = _StringsWebPl._(_root);
	@override late final _StringsAssetPickerPl assetPicker = _StringsAssetPickerPl._(_root);
}

// Path: general
class _StringsGeneralPl extends _StringsGeneralEn {
	_StringsGeneralPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Akceptuj';
	@override String get accepted => 'Zaakceptowane';
	@override String get add => 'Dodaj';
	@override String get advanced => 'Zaawansowane';
	@override String get cancel => 'Anuluj';
	@override String get close => 'Zamknij';
	@override String get confirm => 'Potwierdź';
	@override String get continueStr => 'Dalej';
	@override String get copy => 'Kopiuj';
	@override String get copiedToClipboard => 'Skopiowane do Schowka';
	@override String get decline => 'Odrzuć';
	@override String get done => 'Gotowe';
	@override String get delete => 'Usuń';
	@override String get edit => 'Edytuj';
	@override String get error => 'Błąd';
	@override String get example => 'Przykład';
	@override String get files => 'Pliki';
	@override String get finished => 'Skończone';
	@override String get hide => 'Schowaj';
	@override String get off => 'Wyłączony';
	@override String get offline => 'Offline';
	@override String get on => 'Włączony';
	@override String get online => 'Online';
	@override String get open => 'Otwórz';
	@override String get queue => 'Kolejka';
	@override String get quickSave => 'Szybki Zapis';
	@override String get renamed => 'Przemianowany';
	@override String get reset => 'Resetowanie';
	@override String get restart => 'Restartuj';
	@override String get settings => 'Ustawienia';
	@override String get skipped => 'Pominięty';
	@override String get start => 'Zacznij';
	@override String get stop => 'Zatrzymaj';
	@override String get save => 'Zapisz';
	@override String get unchanged => 'Bez Zmian';
	@override String get unknown => 'Nieznany';
	@override String get noItemInClipboard => 'Schowek jest pusty';
}

// Path: receiveTab
class _StringsReceiveTabPl extends _StringsReceiveTabEn {
	_StringsReceiveTabPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odbierz';
	@override late final _StringsReceiveTabInfoBoxPl infoBox = _StringsReceiveTabInfoBoxPl._(_root);
}

// Path: sendTab
class _StringsSendTabPl extends _StringsSendTabEn {
	_StringsSendTabPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wyślij';
	@override late final _StringsSendTabSelectionPl selection = _StringsSendTabSelectionPl._(_root);
	@override late final _StringsSendTabPickerPl picker = _StringsSendTabPickerPl._(_root);
	@override String get shareIntentInfo => 'Możesz także skorzystać z funkcji „Udostępnij” swojego urządzenia mobilnego, aby łatwiej wybierać pliki.';
	@override String get nearbyDevices => 'Urządzenia w pobliżu';
	@override String get thisDevice => 'To urządzenie';
	@override String get scan => 'Szukaj urządzeń';
	@override String get sendMode => 'Tryb wysyłania';
	@override late final _StringsSendTabSendModesPl sendModes = _StringsSendTabSendModesPl._(_root);
	@override String get sendModeHelp => 'Wyjaśnienie';
	@override String get help => 'Upewnij się, że żądany cel również znajduje się w tej samej sieci Wi-Fi.';
	@override String get placeItems => 'Umieść elementy do udostępnienia.';
}

// Path: settingsTab
class _StringsSettingsTabPl extends _StringsSettingsTabEn {
	_StringsSettingsTabPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ustawienia';
	@override late final _StringsSettingsTabGeneralPl general = _StringsSettingsTabGeneralPl._(_root);
	@override late final _StringsSettingsTabReceivePl receive = _StringsSettingsTabReceivePl._(_root);
	@override late final _StringsSettingsTabNetworkPl network = _StringsSettingsTabNetworkPl._(_root);
	@override late final _StringsSettingsTabOtherPl other = _StringsSettingsTabOtherPl._(_root);
	@override String get advancedSettings => 'Zaawansowane ustawienia';
}

// Path: troubleshootPage
class _StringsTroubleshootPagePl extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rozwiązywanie problemów';
	@override String get subTitle => 'Aplikacja nie działa zgodnie z oczekiwaniami? Tutaj znajdziesz powszechne rozwiązania.';
	@override String get solution => 'Rozwiązanie:';
	@override String get fixButton => 'Napraw automatycznie';
	@override late final _StringsTroubleshootPageFirewallPl firewall = _StringsTroubleshootPageFirewallPl._(_root);
	@override late final _StringsTroubleshootPageNoConnectionPl noConnection = _StringsTroubleshootPageNoConnectionPl._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPagePl extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historia';
	@override String get openFolder => 'Otwórz folder';
	@override String get deleteHistory => 'Usuń historię';
	@override String get empty => 'Historia jest pusta.';
	@override late final _StringsReceiveHistoryPageEntryActionsPl entryActions = _StringsReceiveHistoryPageEntryActionsPl._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPagePl extends _StringsApkPickerPageEn {
	_StringsApkPickerPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikacje (APK)';
	@override String get excludeSystemApps => 'Wyklucz aplikacje systemowe';
	@override String get excludeAppsWithoutLaunchIntent => 'Wyklucz aplikacje niewystartowalne';
	@override String apps({required Object n}) => '${n} Aplikacje';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPagePl extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Usuń wszystko';
}

// Path: receivePage
class _StringsReceivePagePl extends _StringsReceivePageEn {
	_StringsReceivePagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(n,
		one: 'chce wysłać ci plik',
		other: 'chce wysłać ci ${n} plików',
	);
	@override String get subTitleMessage => 'wysłał ci wiadomość:';
	@override String get subTitleLink => 'wysłał ci link:';
	@override String get canceled => 'Nadawca anulował żądanie.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPagePl extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opcje';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Wyłączono automatycznie, ponieważ istnieją katalogi.';
}

// Path: sendPage
class _StringsSendPagePl extends _StringsSendPageEn {
	_StringsSendPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Czekanie na odpowiedź...';
	@override String get rejected => 'Odbiorca odrzucił żądanie.';
	@override String get busy => 'Odbiorca jest zajęty innym żądaniem.';
}

// Path: progressPage
class _StringsProgressPagePl extends _StringsProgressPageEn {
	_StringsProgressPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Wysyłanie plików';
	@override String get titleReceiving => 'Odbieranie plików';
	@override String get savedToGallery => 'Zapisane w Zdjęciach';
	@override late final _StringsProgressPageTotalPl total = _StringsProgressPageTotalPl._(_root);
}

// Path: webSharePage
class _StringsWebSharePagePl extends _StringsWebSharePageEn {
	_StringsWebSharePagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Udostępnij przez link';
	@override String get loading => 'Uruchamianie serwera...';
	@override String get stopping => 'Zatrzymywanie serwera...';
	@override String get error => 'Wystąpił błąd podczas uruchamiania serwera.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(n,
		one: 'Otwórz ten link w przeglądarce:',
		other: 'Otwórz jeden z tych linków w przeglądarce:',
	);
	@override String get requests => 'Żądania';
	@override String get noRequests => 'Brak żądań.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend używa samopodpisanego certyfikatu. Musisz go zaakceptować w przeglądarce.';
	@override String pendingRequests({required Object n}) => 'Oczekujące żądania: ${n}';
}

// Path: aboutPage
class _StringsAboutPagePl extends _StringsAboutPageEn {
	_StringsAboutPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'O LocalSend';
	@override List<String> get description => [
		'LocalSend jest darmową, otwarto-źródłową aplikacją, która pozwala na bezpieczne udostępnianie plików i wiadomości urządzeniom w pobliżu poprzez twoją sieć lokalną, bez konieczności połączenia z internetem.',
		'Ta aplikacja jest dostępna na systemach Android, iOS, macOS, Windows i Linux. Możesz znaleźć wszystkie opcje pobierania na oficjalnej stronie głównej.',
	];
	@override String get author => 'Autor';
	@override String get contributors => 'Współautorzy';
	@override String get translators => 'Tłumacze';
}

// Path: donationPage
class _StringsDonationPagePl extends _StringsDonationPageEn {
	_StringsDonationPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Przekaż darowiznę';
	@override String get info => 'LocalSend jest darmową, otwarto-źródłową aplikacją bez żadnych reklam. Jeśli podoba Ci się aplikacja, możesz wesprzec jej rozwój przekazując darowiznę.';
	@override String donate({required Object amount}) => 'Przekaż ${amount}';
	@override String get thanks => 'Bardzo Ci dziękuję!';
	@override String get restore => 'Przywróć zakupy';
}

// Path: changelogPage
class _StringsChangelogPagePl extends _StringsChangelogPageEn {
	_StringsChangelogPagePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dziennik Zmian';
}

// Path: aliasGenerator
class _StringsAliasGeneratorPl extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsPl extends _StringsDialogsEn {
	_StringsDialogsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFilePl addFile = _StringsDialogsAddFilePl._(_root);
	@override late final _StringsDialogsAddressInputPl addressInput = _StringsDialogsAddressInputPl._(_root);
	@override late final _StringsDialogsCancelSessionPl cancelSession = _StringsDialogsCancelSessionPl._(_root);
	@override late final _StringsDialogsCannotOpenFilePl cannotOpenFile = _StringsDialogsCannotOpenFilePl._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticePl encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticePl._(_root);
	@override late final _StringsDialogsErrorDialogPl errorDialog = _StringsDialogsErrorDialogPl._(_root);
	@override late final _StringsDialogsFavoriteDialogPl favoriteDialog = _StringsDialogsFavoriteDialogPl._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogPl favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogPl._(_root);
	@override late final _StringsDialogsFavoriteEditDialogPl favoriteEditDialog = _StringsDialogsFavoriteEditDialogPl._(_root);
	@override late final _StringsDialogsFileInfoPl fileInfo = _StringsDialogsFileInfoPl._(_root);
	@override late final _StringsDialogsFileNameInputPl fileNameInput = _StringsDialogsFileNameInputPl._(_root);
	@override late final _StringsDialogsHistoryClearDialogPl historyClearDialog = _StringsDialogsHistoryClearDialogPl._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedPl localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedPl._(_root);
	@override late final _StringsDialogsMessageInputPl messageInput = _StringsDialogsMessageInputPl._(_root);
	@override late final _StringsDialogsNoFilesPl noFiles = _StringsDialogsNoFilesPl._(_root);
	@override late final _StringsDialogsNoPermissionPl noPermission = _StringsDialogsNoPermissionPl._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformPl notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformPl._(_root);
	@override late final _StringsDialogsQrPl qr = _StringsDialogsQrPl._(_root);
	@override late final _StringsDialogsQuickActionsPl quickActions = _StringsDialogsQuickActionsPl._(_root);
	@override late final _StringsDialogsQuickSaveNoticePl quickSaveNotice = _StringsDialogsQuickSaveNoticePl._(_root);
	@override late final _StringsDialogsSendModeHelpPl sendModeHelp = _StringsDialogsSendModeHelpPl._(_root);
}

// Path: tray
class _StringsTrayPl extends _StringsTrayEn {
	_StringsTrayPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'Zamknij LocalSend';
}

// Path: web
class _StringsWebPl extends _StringsWebEn {
	_StringsWebPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Odrzucone';
	@override String get files => 'Pliki';
	@override String get fileName => 'Nazwa pliku';
	@override String get size => 'Rozmiar';
}

// Path: assetPicker
class _StringsAssetPickerPl extends _StringsAssetPickerEn {
	_StringsAssetPickerPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Potwierdź';
	@override String get cancel => 'Anuluj';
	@override String get edit => 'Edytuj';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Nie udało się załadować';
	@override String get original => 'Oryginał';
	@override String get preview => 'Podgląd';
	@override String get select => 'Wybierz';
	@override String get emptyList => 'Pusta lista';
	@override String get unSupportedAssetType => 'Nieobsługiwany typ pliku.';
	@override String get unableToAccessAll => 'Nie można uzyskać dostępu do wszystkich plików na urządzeniu';
	@override String get viewingLimitedAssetsTip => 'Przeglądaj tylko pliki i albumy dostępne dla aplikacji.';
	@override String get changeAccessibleLimitedAssets => 'Kliknij, aby zaktualizować dostępne pliki';
	@override String get accessAllTip => 'Aplikacja może uzyskać dostęp tylko do niektórych plików na urządzeniu. Przejdź do ustawień systemowych i zezwól aplikacji na dostęp do wszystkich mediów na urządzeniu.';
	@override String get goToSystemSettings => 'Przejdź do ustawień systemowych';
	@override String get accessLimitedAssets => 'Kontynuuj z ograniczonym dostępem';
	@override String get accessiblePathName => 'Dostępne pliki';
	@override String get sTypeAudioLabel => 'Audio';
	@override String get sTypeImageLabel => 'Obraz';
	@override String get sTypeVideoLabel => 'Wideo';
	@override String get sTypeOtherLabel => 'Inne media';
	@override String get sActionPlayHint => 'odtwarzaj';
	@override String get sActionPreviewHint => 'podgląd';
	@override String get sActionSelectHint => 'wybierz';
	@override String get sActionSwitchPathLabel => 'zmień ścieżkę';
	@override String get sActionUseCameraHint => 'użyj kamery';
	@override String get sNameDurationLabel => 'czas trwania';
	@override String get sUnitAssetCountLabel => 'ilość';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxPl extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Alias:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionPl extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wybór';
	@override String files({required Object files}) => 'Pliki: ${files}';
	@override String size({required Object size}) => 'Wielkość: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerPl extends _StringsSendTabPickerEn {
	_StringsSendTabPickerPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get file => 'Plik';
	@override String get folder => 'Folder';
	@override String get media => 'Media';
	@override String get text => 'Tekst';
	@override String get app => 'Aplikacja';
	@override String get clipboard => 'Wklej';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesPl extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get single => 'Pojedynczy odbiorca';
	@override String get multiple => 'Wielu odbiorców';
	@override String get link => 'Udostępnij przez link';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralPl extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ogólne';
	@override String get brightness => 'Motyw';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsPl brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsPl._(_root);
	@override String get color => 'Kolor';
	@override late final _StringsSettingsTabGeneralColorOptionsPl colorOptions = _StringsSettingsTabGeneralColorOptionsPl._(_root);
	@override String get language => 'Język';
	@override late final _StringsSettingsTabGeneralLanguageOptionsPl languageOptions = _StringsSettingsTabGeneralLanguageOptionsPl._(_root);
	@override String get saveWindowPlacement => 'Zamknij: Zapisz położenie okna';
	@override String get minimizeToTray => 'Wyjdź: zminimalizuj do menu ukrytych ikon';
	@override String get launchAtStartup => 'Autostart po zalogowaniu';
	@override String get launchMinimized => 'Autostart: Start ukryty';
	@override String get animations => 'Animacje';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceivePl extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceivePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Odbierz';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get autoFinish => 'Zakończ automatycznie';
	@override String get destination => 'Miejsce docelowe';
	@override String get downloads => '(Pobrane)';
	@override String get saveToGallery => 'Zapisz multimedia w galerii';
	@override String get saveToHistory => 'Zapisz do historii';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkPl extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sieć';
	@override String get needRestart => 'Uruchom ponownie serwer, aby zastosować ustawienia!';
	@override String get server => 'Serwer';
	@override String get alias => 'Alias';
	@override String get deviceType => 'Typ urządzenia';
	@override String get deviceModel => 'Model urządzenia';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Inne urządzenia mogą nie wykryć Twojego urządzenia, ponieważ używasz niestandardowego portu. (domyślnie: ${defaultPort})';
	@override String get encryption => 'Szyfrowanie';
	@override String get multicastGroup => 'Multicast';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Inne urządzenia mogą nie wykryć Twojego urządzenia, ponieważ używasz niestandardowego adresu multicast. (domyślnie: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherPl extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inne';
	@override String get support => 'Wesprzyj LocalSend';
	@override String get donate => 'Przekaż darowiznę';
	@override String get privacyPolicy => 'Polityka prywatności';
	@override String get termsOfUse => 'Warunki korzystania';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallPl extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Aplikacja może wysyłać pliki do innych urządzeń, ale inne urządzenia nie mogą wysyłać plików do tego urządzenia.';
	@override String solution({required Object port}) => 'Prawdopodobnie jest to problem z zaporą. Możesz go rozwiązać, zezwalając na przychodzące połączenia (UDP i TCP) na porcie ${port}.';
	@override String get openFirewall => 'Otwórz zaporę';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionPl extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Oba urządzenia nie mogą się nawzajem wykryć ani dzielić się plikami.';
	@override String get solution => 'Problem istnieje po obu stronach? Upewnij się, że oba urządzenia są w tej samej sieci Wi-Fi i mają takie same ustawienia (port, adres multicast, szyfrowanie). Wi-Fi może nie zezwalać na komunikację między uczestnikami. W takim przypadku opcję tę należy włączyć w routerze.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsPl extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get open => 'Otwórz plik';
	@override String get info => 'Informacje';
	@override String get deleteFromHistory => 'Usuń z historii';
}

// Path: progressPage.total
class _StringsProgressPageTotalPl extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitlePl title = _StringsProgressPageTotalTitlePl._(_root);
	@override String count({required Object curr, required Object n}) => 'Pliki: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Wielkość: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Prędkość: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFilePl extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFilePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dodaj do wyboru';
	@override String get content => 'Co chcesz dodać?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputPl extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wpisz adres';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'Adres IP';
	@override String get recentlyUsed => 'Ostatnio używane: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionPl extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anuluj transfer plików';
	@override String get content => 'Czy na pewno?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFilePl extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFilePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nie można otworzyć pliku';
	@override String content({required Object file}) => 'Nie można otworzyć "${file}". Czy ten plik został przeniesiony, zmieniono mu nazwę lub usunięto?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticePl extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Szyfrowanie wyłączone';
	@override String get content => 'Komunikacja odbywa się teraz za pomocą niezaszyfrowanego protokołu HTTP. Aby korzystać z HTTPS, włącz ponownie szyfrowanie.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogPl extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogPl extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ulubione';
	@override String get noFavorites => 'Brak ulubionych urządzeń.';
	@override String get addFavorite => 'Dodaj';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogPl extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Usuń z ulubionych';
	@override String content({required Object name}) => 'Czy na pewno chcesz usunąć z ulubionych "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogPl extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Dodaj do ulubionych';
	@override String get titleEdit => 'Dostosuj';
	@override String get name => 'Alias';
	@override String get auto => '(auto)';
	@override String get ip => 'Adres IP';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoPl extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informacje o pliku';
	@override String get fileName => 'Nazwa pliku:';
	@override String get path => 'Ścieżka:';
	@override String get size => 'Rozmiar:';
	@override String get sender => 'Nadawca:';
	@override String get time => 'Czas:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputPl extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wpisz imię';
	@override String original({required Object original}) => 'Oryginalny: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogPl extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wyczyść historię';
	@override String get content => 'Czy na pewno chcesz usunąć całą historię?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedPl extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend nie może znaleźć innych urządzeń bez uprawnienia do skanowania sieci lokalnej. Udziel tego uprawnienia w ustawieniach.';
	@override String get gotoSettings => 'Ustawienia';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputPl extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wpisz wiadomość';
	@override String get multiline => 'Wieloliniowy';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesPl extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nie wybrano pliku';
	@override String get content => 'Proszę wybierz jeden plik.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionPl extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Brak uprawnień';
	@override String get content => 'Nie udzieliłeś wymaganych uprawnień. Proszę udziel ich w ustawieniach.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformPl extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Niedostępne';
	@override String get content => 'Ta funkcja jest dostępna tylko na:';
}

// Path: dialogs.qr
class _StringsDialogsQrPl extends _StringsDialogsQrEn {
	_StringsDialogsQrPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kod QR';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsPl extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Szybkie akcje';
	@override String get counter => 'Licznik';
	@override String get prefix => 'Prefiks';
	@override String get padZero => 'Wypchnij zerami';
	@override String get sortBeforeCount => 'Wcześniej posortuj alfabetycznie';
	@override String get random => 'Losowy';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticePl extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Żądania plików są akceptowane automatycznie. Pamiętaj, że każdy w sieci lokalnej może przesyłać ci pliki.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpPl extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tryby wysyłania';
	@override String get single => 'Wysyła pliki do jednego odbiorcy. Wybór zostanie wyczyszczony po zakończonym transferze pliku.';
	@override String get multiple => 'Wysyła pliki do wielu odbiorców. Wybór nie zostanie wyczyszczony.';
	@override String get link => 'Odbiorcy, którzy nie mają zainstalowanego LocalSend, mogą pobrać wybrane pliki, otwierając link w swojej przeglądarce.';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsPl extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get dark => 'Ciemny';
	@override String get light => 'Jasny';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsPl extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsPl extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsPl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitlePl extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitlePl._(_StringsPl root) : this._root = root, super._(root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Całkowity postęp (${time})';
	@override String get finishedError => 'Zakończono z błędem';
	@override String get canceledSender => 'Anulowane przez nadawcę';
	@override String get canceledReceiver => 'Anulowane przez odbiorcę';
}
