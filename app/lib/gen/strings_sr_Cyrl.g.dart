///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'strings.g.dart';

// Path: <root>
class _StringsSrCyrl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSrCyrl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.srCyrl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sr-Cyrl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsSrCyrl _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Српски';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralSrCyrl general = _StringsGeneralSrCyrl._(_root);
	@override late final _StringsReceiveTabSrCyrl receiveTab = _StringsReceiveTabSrCyrl._(_root);
	@override late final _StringsSendTabSrCyrl sendTab = _StringsSendTabSrCyrl._(_root);
	@override late final _StringsSettingsTabSrCyrl settingsTab = _StringsSettingsTabSrCyrl._(_root);
	@override late final _StringsTroubleshootPageSrCyrl troubleshootPage = _StringsTroubleshootPageSrCyrl._(_root);
	@override late final _StringsReceiveHistoryPageSrCyrl receiveHistoryPage = _StringsReceiveHistoryPageSrCyrl._(_root);
	@override late final _StringsApkPickerPageSrCyrl apkPickerPage = _StringsApkPickerPageSrCyrl._(_root);
	@override late final _StringsSelectedFilesPageSrCyrl selectedFilesPage = _StringsSelectedFilesPageSrCyrl._(_root);
	@override late final _StringsReceivePageSrCyrl receivePage = _StringsReceivePageSrCyrl._(_root);
	@override late final _StringsReceiveOptionsPageSrCyrl receiveOptionsPage = _StringsReceiveOptionsPageSrCyrl._(_root);
	@override late final _StringsSendPageSrCyrl sendPage = _StringsSendPageSrCyrl._(_root);
	@override late final _StringsProgressPageSrCyrl progressPage = _StringsProgressPageSrCyrl._(_root);
	@override late final _StringsWebSharePageSrCyrl webSharePage = _StringsWebSharePageSrCyrl._(_root);
	@override late final _StringsAboutPageSrCyrl aboutPage = _StringsAboutPageSrCyrl._(_root);
	@override late final _StringsDonationPageSrCyrl donationPage = _StringsDonationPageSrCyrl._(_root);
	@override late final _StringsChangelogPageSrCyrl changelogPage = _StringsChangelogPageSrCyrl._(_root);
	@override late final _StringsAliasGeneratorSrCyrl aliasGenerator = _StringsAliasGeneratorSrCyrl._(_root);
	@override late final _StringsDialogsSrCyrl dialogs = _StringsDialogsSrCyrl._(_root);
	@override late final _StringsSanitizationSrCyrl sanitization = _StringsSanitizationSrCyrl._(_root);
	@override late final _StringsTraySrCyrl tray = _StringsTraySrCyrl._(_root);
	@override late final _StringsWebSrCyrl web = _StringsWebSrCyrl._(_root);
	@override late final _StringsAssetPickerSrCyrl assetPicker = _StringsAssetPickerSrCyrl._(_root);
}

// Path: general
class _StringsGeneralSrCyrl extends _StringsGeneralEn {
	_StringsGeneralSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Прихвати';
	@override String get accepted => 'Прихваћено';
	@override String get add => 'Додај';
	@override String get advanced => 'Напредно';
	@override String get cancel => 'Одустани';
	@override String get close => 'Затвори';
	@override String get confirm => 'Потврди';
	@override String get continueStr => 'Настави';
	@override String get copy => 'Копирај';
	@override String get copiedToClipboard => 'Копирано у Clipboard';
	@override String get decline => 'Одбиј';
	@override String get done => 'Готово';
	@override String get delete => 'Избриши';
	@override String get edit => 'Измени';
	@override String get error => 'Грешка';
	@override String get example => 'Пример';
	@override String get files => 'Фајлови';
	@override String get finished => 'Завршено';
	@override String get hide => 'Сакриј';
	@override String get off => 'Искључено';
	@override String get offline => 'Ван мреже';
	@override String get on => 'Укључено';
	@override String get online => 'На мрежи';
	@override String get open => 'Отвори';
	@override String get queue => 'Стави у Queue';
	@override String get quickSave => 'Брзо сними';
	@override String get renamed => 'Преименовано';
	@override String get reset => 'Ресетуј';
	@override String get restart => 'Рестартуј';
	@override String get settings => 'Подешавања';
	@override String get skipped => 'Пропуштено';
	@override String get start => 'Покрени';
	@override String get stop => 'Заустави';
	@override String get save => 'Сними';
	@override String get unchanged => 'Непромењено';
	@override String get unknown => 'Непознато';
	@override String get noItemInClipboard => 'Нема ставки у Clipboard-у';
}

// Path: receiveTab
class _StringsReceiveTabSrCyrl extends _StringsReceiveTabEn {
	_StringsReceiveTabSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Примање';
	@override late final _StringsReceiveTabInfoBoxSrCyrl infoBox = _StringsReceiveTabInfoBoxSrCyrl._(_root);
}

// Path: sendTab
class _StringsSendTabSrCyrl extends _StringsSendTabEn {
	_StringsSendTabSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Слање';
	@override late final _StringsSendTabSelectionSrCyrl selection = _StringsSendTabSelectionSrCyrl._(_root);
	@override late final _StringsSendTabPickerSrCyrl picker = _StringsSendTabPickerSrCyrl._(_root);
	@override String get shareIntentInfo => 'Можеш такође да користиш и "Share" опцију твог мобилног уређаја да би лакше селектовао фајлове.';
	@override String get nearbyDevices => 'Уређаји у близини';
	@override String get thisDevice => 'Овај уређај';
	@override String get scan => 'Потражи уређаје';
	@override String get sendMode => 'Мод за слање';
	@override late final _StringsSendTabSendModesSrCyrl sendModes = _StringsSendTabSendModesSrCyrl._(_root);
	@override String get sendModeHelp => 'Објашњење';
	@override String get help => 'Молим уверите се да је жељена дестинација такође на истој WiFi мрежи.';
	@override String get placeItems => 'Постави шта желиш да share-ујеш.';
}

// Path: settingsTab
class _StringsSettingsTabSrCyrl extends _StringsSettingsTabEn {
	_StringsSettingsTabSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подешавање';
	@override late final _StringsSettingsTabGeneralSrCyrl general = _StringsSettingsTabGeneralSrCyrl._(_root);
	@override late final _StringsSettingsTabReceiveSrCyrl receive = _StringsSettingsTabReceiveSrCyrl._(_root);
	@override late final _StringsSettingsTabSendSrCyrl send = _StringsSettingsTabSendSrCyrl._(_root);
	@override late final _StringsSettingsTabNetworkSrCyrl network = _StringsSettingsTabNetworkSrCyrl._(_root);
	@override late final _StringsSettingsTabOtherSrCyrl other = _StringsSettingsTabOtherSrCyrl._(_root);
	@override String get advancedSettings => 'Напредна подешавања';
}

// Path: troubleshootPage
class _StringsTroubleshootPageSrCyrl extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Troubleshoot';
	@override String get subTitle => 'Да ли апликација ради како треба? Овде можете пронаћи нека уобичајена решења.';
	@override String get solution => 'Решење:';
	@override String get fixButton => 'Поправи аутоматски';
	@override late final _StringsTroubleshootPageFirewallSrCyrl firewall = _StringsTroubleshootPageFirewallSrCyrl._(_root);
	@override late final _StringsTroubleshootPageNoConnectionSrCyrl noConnection = _StringsTroubleshootPageNoConnectionSrCyrl._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageSrCyrl extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Историја';
	@override String get openFolder => 'Отвори фолдер';
	@override String get deleteHistory => 'Обриши Историју';
	@override String get empty => 'Историја је празна.';
	@override late final _StringsReceiveHistoryPageEntryActionsSrCyrl entryActions = _StringsReceiveHistoryPageEntryActionsSrCyrl._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageSrCyrl extends _StringsApkPickerPageEn {
	_StringsApkPickerPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Апликације (APK)';
	@override String get excludeSystemApps => 'Изостави системске апликације';
	@override String get excludeAppsWithoutLaunchIntent => 'Изостави апликације које се не покрећу';
	@override String apps({required Object n}) => '${n} Апликације';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageSrCyrl extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Обриши све';
}

// Path: receivePage
class _StringsReceivePageSrCyrl extends _StringsReceivePageEn {
	_StringsReceivePageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n,
		one: 'жели да пошаље фајл',
		other: 'жели да пошаље ${n} фајлова',
	);
	@override String get subTitleMessage => 'је послао поруку:';
	@override String get subTitleLink => 'је послао Линк:';
	@override String get canceled => 'Пошиљалац је поништио захтев.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageSrCyrl extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Опције';
	@override String get destination => _root.settingsTab.receive.destination;
	@override String get appDirectory => '(LocalSend folder)';
	@override String get saveToGallery => _root.settingsTab.receive.saveToGallery;
	@override String get saveToGalleryOff => 'Искључено аутоматски зато што постоје фолдери.';
}

// Path: sendPage
class _StringsSendPageSrCyrl extends _StringsSendPageEn {
	_StringsSendPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Чекам одговор...';
	@override String get rejected => 'Прималац је одбио захтев.';
	@override String get busy => 'Прималац је заузет неким другим захтевом за слање.';
}

// Path: progressPage
class _StringsProgressPageSrCyrl extends _StringsProgressPageEn {
	_StringsProgressPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Слање фајлова';
	@override String get titleReceiving => 'Примање фајлова';
	@override String get savedToGallery => 'Снимљено у Галерију';
	@override late final _StringsProgressPageTotalSrCyrl total = _StringsProgressPageTotalSrCyrl._(_root);
}

// Path: webSharePage
class _StringsWebSharePageSrCyrl extends _StringsWebSharePageEn {
	_StringsWebSharePageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дели помоћу Линка';
	@override String get loading => 'Покрећем сервер...';
	@override String get stopping => 'Заустављам сервер...';
	@override String get error => 'Приликом покретања сервера догодила се грешка.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sr'))(n,
		one: 'Отвори овај линк у browseru:',
		other: 'Отвори један од ових линкова у browseru:',
	);
	@override String get requests => 'Захтеви';
	@override String get noRequests => 'Нема захтева још увек.';
	@override String get encryption => _root.settingsTab.network.encryption;
	@override String get autoAccept => 'Аутоматски прихвати захтеве';
	@override String get encryptionHint => 'LocalSend користи сертификате који су self-signed. Морате да прихватите то у browseru.';
	@override String pendingRequests({required Object n}) => 'Захтеви на чекању: ${n}';
}

// Path: aboutPage
class _StringsAboutPageSrCyrl extends _StringsAboutPageEn {
	_StringsAboutPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'О LocalSend-у';
	@override List<String> get description => [
		'LocalSend је бесплатна (слободна) апликација отвореног кода, која Вам омогућава да делите фајлове и поруке са оближњим уређајима сигурно, преко локалне мреже, без потребе за интернет конекцијом.',
		'Ова апликације је доступна за Android, iOS, macOS, Windows i Linux. Можете пронаћи све опције за преузимање на официјелној интернет страници.',
	];
	@override String get author => 'Аутор';
	@override String get contributors => 'Сарадници';
	@override String get translators => 'Преводиоци';
}

// Path: donationPage
class _StringsDonationPageSrCyrl extends _StringsDonationPageEn {
	_StringsDonationPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Донирај';
	@override String get info => 'LocalSend је слободна, апликација отвореног кода без реклама. Ако Вам се допада, можете подржати развој путем донације.';
	@override String donate({required Object amount}) => 'Донирај ${amount}';
	@override String get thanks => 'Хвала Вам!';
	@override String get restore => 'Обнови куповину';
}

// Path: changelogPage
class _StringsChangelogPageSrCyrl extends _StringsChangelogPageEn {
	_StringsChangelogPageSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log промена';
}

// Path: aliasGenerator
class _StringsAliasGeneratorSrCyrl extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override List<String> get adjectives => [
		'Неодољива',
		'Прелепа',
		'Велика',
		'Бистра',
		'Чиста',
		'Паметна',
		'Хладњикава',
		'Слатка',
		'Лукава',
		'Одлучна',
		'Енергетска',
		'Ефикасна',
		'Фантастична',
		'Брза',
		'Фина',
		'Свежа',
		'Добра',
		'Дивна',
		'Велика',
		'Згодна',
		'Врућа',
		'Нежна',
		'Љубазна',
		'Мистична',
		'Уредна',
		'Лепа',
		'Стрпљива',
		'Прелепа',
		'Моћна',
		'Богата',
		'Тајновита',
		'Паметна',
		'Чврста',
		'Специјална',
		'Буђава',
		'Јака',
		'Уредна',
		'Мудра',
	];
	@override List<String> get fruits => [
		'Јабука',
		'Шљива',
		'Банана',
		'Боровница',
		'Рибизла',
		'Кајсија',
		'Шаргарепа',
		'Трешња',
		'Паприка',
		'Папричица',
		'Кромпируша',
		'Купусара',
		'Ротквица',
		'Лубеница',
		'Печурка',
		'Мандарина',
		'Поморанџа',
		'Папаја',
		'Бресква',
		'Крушка',
		'Шишарка',
		'Диња',
		'Бундева',
		'Вишња',
		'Јагода',
		'Дуња',
	];

	/// In some languages, the adjective must be last. Not the case in Serbian, but serbian adjectives must have endings which depend on the gender of the noun. That's why we put all the Fruits with the female form and corresponding adjective endings in female form for this translation.
	@override String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _StringsDialogsSrCyrl extends _StringsDialogsEn {
	_StringsDialogsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileSrCyrl addFile = _StringsDialogsAddFileSrCyrl._(_root);
	@override late final _StringsDialogsAddressInputSrCyrl addressInput = _StringsDialogsAddressInputSrCyrl._(_root);
	@override late final _StringsDialogsCancelSessionSrCyrl cancelSession = _StringsDialogsCancelSessionSrCyrl._(_root);
	@override late final _StringsDialogsCannotOpenFileSrCyrl cannotOpenFile = _StringsDialogsCannotOpenFileSrCyrl._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeSrCyrl encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeSrCyrl._(_root);
	@override late final _StringsDialogsErrorDialogSrCyrl errorDialog = _StringsDialogsErrorDialogSrCyrl._(_root);
	@override late final _StringsDialogsFavoriteDialogSrCyrl favoriteDialog = _StringsDialogsFavoriteDialogSrCyrl._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogSrCyrl favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogSrCyrl._(_root);
	@override late final _StringsDialogsFavoriteEditDialogSrCyrl favoriteEditDialog = _StringsDialogsFavoriteEditDialogSrCyrl._(_root);
	@override late final _StringsDialogsFileInfoSrCyrl fileInfo = _StringsDialogsFileInfoSrCyrl._(_root);
	@override late final _StringsDialogsFileNameInputSrCyrl fileNameInput = _StringsDialogsFileNameInputSrCyrl._(_root);
	@override late final _StringsDialogsHistoryClearDialogSrCyrl historyClearDialog = _StringsDialogsHistoryClearDialogSrCyrl._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedSrCyrl localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedSrCyrl._(_root);
	@override late final _StringsDialogsMessageInputSrCyrl messageInput = _StringsDialogsMessageInputSrCyrl._(_root);
	@override late final _StringsDialogsNoFilesSrCyrl noFiles = _StringsDialogsNoFilesSrCyrl._(_root);
	@override late final _StringsDialogsNoPermissionSrCyrl noPermission = _StringsDialogsNoPermissionSrCyrl._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformSrCyrl notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformSrCyrl._(_root);
	@override late final _StringsDialogsQrSrCyrl qr = _StringsDialogsQrSrCyrl._(_root);
	@override late final _StringsDialogsQuickActionsSrCyrl quickActions = _StringsDialogsQuickActionsSrCyrl._(_root);
	@override late final _StringsDialogsQuickSaveNoticeSrCyrl quickSaveNotice = _StringsDialogsQuickSaveNoticeSrCyrl._(_root);
	@override late final _StringsDialogsSendModeHelpSrCyrl sendModeHelp = _StringsDialogsSendModeHelpSrCyrl._(_root);
	@override late final _StringsDialogsZoomSrCyrl zoom = _StringsDialogsZoomSrCyrl._(_root);
}

// Path: sanitization
class _StringsSanitizationSrCyrl extends _StringsSanitizationEn {
	_StringsSanitizationSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Име фајла не може бити празно';
	@override String get invalid => 'Име фајла садржи недозвољене карактере';
}

// Path: tray
class _StringsTraySrCyrl extends _StringsTrayEn {
	_StringsTraySrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get open => _root.general.open;
	@override String get close => 'Quit LocalSend';
}

// Path: web
class _StringsWebSrCyrl extends _StringsWebEn {
	_StringsWebSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get waiting => _root.sendPage.waiting;
	@override String get rejected => 'Одбијено';
	@override String get files => 'Фајлови';
	@override String get fileName => 'Име фајла';
	@override String get size => 'Величина';
}

// Path: assetPicker
class _StringsAssetPickerSrCyrl extends _StringsAssetPickerEn {
	_StringsAssetPickerSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Потврди';
	@override String get cancel => 'Одустани';
	@override String get edit => 'Измени';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Учитавање неуспешно';
	@override String get original => 'Порекло';
	@override String get preview => 'Погледај';
	@override String get select => 'Изабери';
	@override String get emptyList => 'Испразни листу';
	@override String get unSupportedAssetType => 'Тип фајла није подржан.';
	@override String get unableToAccessAll => 'Немогуће приступити свим фајловима на овом уређају';
	@override String get viewingLimitedAssetsTip => 'Само view фајлови и албуми доступни апликацији.';
	@override String get changeAccessibleLimitedAssets => 'Кликни да упдејтујеш доступне фајлове';
	@override String get accessAllTip => 'Апликација може да приступи само неким фајловима на уређају. Иди у Системска Подешавања и дозволи апликацији приступ свим медијским фајловима на уређају.';
	@override String get goToSystemSettings => 'Иди у Системска подешавања';
	@override String get accessLimitedAssets => 'Настави са ограниченим приступом';
	@override String get accessiblePathName => 'Доступни фајлови';
	@override String get sTypeAudioLabel => 'Аудио';
	@override String get sTypeImageLabel => 'Слике';
	@override String get sTypeVideoLabel => 'Видео';
	@override String get sTypeOtherLabel => 'Друга врста медија';
	@override String get sActionPlayHint => 'play';
	@override String get sActionPreviewHint => 'preview';
	@override String get sActionSelectHint => 'изабери';
	@override String get sActionSwitchPathLabel => 'промени путању';
	@override String get sActionUseCameraHint => 'користи камеру';
	@override String get sNameDurationLabel => 'трајање';
	@override String get sUnitAssetCountLabel => 'број';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxSrCyrl extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Порт:';
	@override String get alias => 'Име уређаја:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionSrCyrl extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Селекција';
	@override String files({required Object files}) => 'Фајлови: ${files}';
	@override String size({required Object size}) => 'Величина: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerSrCyrl extends _StringsSendTabPickerEn {
	_StringsSendTabPickerSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get file => 'Фајл';
	@override String get folder => 'Фолдер';
	@override String get media => 'Медији';
	@override String get text => 'Текст';
	@override String get app => 'App';
	@override String get clipboard => 'Налепи';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesSrCyrl extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get single => 'Један прималац';
	@override String get multiple => 'Више прималаца';
	@override String get link => 'Дели помоћу Линка';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralSrCyrl extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Уопштено';
	@override String get brightness => 'Тема';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsSrCyrl brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsSrCyrl._(_root);
	@override String get color => 'Боја';
	@override late final _StringsSettingsTabGeneralColorOptionsSrCyrl colorOptions = _StringsSettingsTabGeneralColorOptionsSrCyrl._(_root);
	@override String get language => 'Језик';
	@override late final _StringsSettingsTabGeneralLanguageOptionsSrCyrl languageOptions = _StringsSettingsTabGeneralLanguageOptionsSrCyrl._(_root);
	@override String get saveWindowPlacement => 'Изађи: Сними положај прозора';
	@override String get minimizeToTray => 'Изађи: Минимизуј у Tray/MenuBar';
	@override String get launchAtStartup => 'Аутостартуј после login-а';
	@override String get launchMinimized => 'Аутостартуј: Старт сакривен';
	@override String get animations => 'Анимације';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveSrCyrl extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Примање';
	@override String get quickSave => _root.general.quickSave;
	@override String get autoFinish => 'Аутоматски заврши';
	@override String get destination => 'Дестинација';
	@override String get downloads => '(Downloads)';
	@override String get saveToGallery => 'Сними медиа фајлове у Галерију';
	@override String get saveToHistory => 'Сними у Историју';
}

// Path: settingsTab.send
class _StringsSettingsTabSendSrCyrl extends _StringsSettingsTabSendEn {
	_StringsSettingsTabSendSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Слање';
	@override String get shareViaLinkAutoAccept => 'Подели преко Линка: Аутоматски прихвати';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkSrCyrl extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мрежа';
	@override String get needRestart => 'Рестартуј сервер да би Подешавања била примењена!';
	@override String get server => 'Сервер';
	@override String get alias => 'Име уређаја';
	@override String get deviceType => 'Тип уређаја';
	@override String get deviceModel => 'Модел уређаја';
	@override String get port => 'Порт';
	@override String get discoveryTimeout => 'Откривање отказано';
	@override String portWarning({required Object defaultPort}) => 'Можда нећете бити пронађени од стране других уређаја јер користите неки други Порт. (default: ${defaultPort})';
	@override String get encryption => 'Енкрипција';
	@override String get multicastGroup => 'Мултикаст';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Можда нећете бити пронађени од стране других уређаја јер користите неку другу Мултикаст адресу. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherSrCyrl extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Друго';
	@override String get support => 'Подржи LocalSend';
	@override String get donate => 'Донирај';
	@override String get privacyPolicy => 'Политика приватности';
	@override String get termsOfUse => 'Услови коришћења';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallSrCyrl extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Ова апликација може послати фајлове другим уређајима; али други уређаји не могу послати фајлове овом уређају.';
	@override String solution({required Object port}) => 'Ово је највероватније Firewall проблем. Možete решити ово омогућавањем долазних конекција (UDP and TCP) на Порту ${port}.';
	@override String get openFirewall => 'Отвори Firewall';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionSrCyrl extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Уређаји не могу ни да пронађу један другог ни да поделе фајлове.';
	@override String get solution => 'Да ли проблем постоји на обе стране? Ако је тако, морате да се уверите да се оба уређаја налазе на истој Wi-Fi мрежи и да деле исту конфигурацију (порт, мултикаст адреса, енкрипција). Мрежа можда не дозвољава комуникацију међу уређајима. У овом случају, ова опција мора бити омогућена на рутеру.';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsSrCyrl extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get open => 'Отвори фајл';
	@override String get info => 'Информације';
	@override String get deleteFromHistory => 'Обриши из Историје.';
}

// Path: progressPage.total
class _StringsProgressPageTotalSrCyrl extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleSrCyrl title = _StringsProgressPageTotalTitleSrCyrl._(_root);
	@override String count({required Object curr, required Object n}) => 'Фајлова: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Величина: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Брзина: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileSrCyrl extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додај у селекцију';
	@override String get content => 'Шта желиш да додаш?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputSrCyrl extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Упиши адресу';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP адреса';
	@override String get recentlyUsed => 'Недавно коришћено: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionSrCyrl extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Одустани од пребацивања фајла';
	@override String get content => 'Да ли стварно желиш да одустанеш од слања фајла?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileSrCyrl extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Не могу да отворим фајл';
	@override String content({required Object file}) => 'Не могу да отворим "${file}". Да ли је овај фајл негде померен, преименован, или обрисан?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeSrCyrl extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Енкрипција онемогућена';
	@override String get content => 'Комуникација се сада врши преко не-енкриптованог HTTP протокола. Да би користио HTTPS, омогући Енкрипцију опет.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogSrCyrl extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogSrCyrl extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Омиљени';
	@override String get noFavorites => 'Нема омиљених уређаја још увек.';
	@override String get addFavorite => 'Додај';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogSrCyrl extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Избриши из Омиљених';
	@override String content({required Object name}) => 'Да ли стварно желиш да избришеш из Омиљених "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogSrCyrl extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Додај у Омиљене';
	@override String get titleEdit => 'Подешавања';
	@override String get name => 'Име уређаја';
	@override String get auto => '(auto)';
	@override String get ip => 'IP адреса';
	@override String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoSrCyrl extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Информације о фајлу';
	@override String get fileName => 'Име фајла:';
	@override String get path => 'Путања:';
	@override String get size => 'Величина:';
	@override String get sender => 'Пошиљалац:';
	@override String get time => 'Време:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputSrCyrl extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Убаци име фајла';
	@override String original({required Object original}) => 'Оригинал: ${original}';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogSrCyrl extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Очисти Историју';
	@override String get content => 'Да ли стварно желиш да избришеш целу Историју?';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedSrCyrl extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.dialogs.noPermission.title;
	@override String get description => 'LocalSend не може да нађе друге уређаје без дозволе да скенира локалну мрежу. Молим додајте ову дозволу у Подешавања.';
	@override String get gotoSettings => 'Подешавања';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputSrCyrl extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Упиши поруку';
	@override String get multiline => 'Више линија';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesSrCyrl extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ниједан фајл није изабран';
	@override String get content => 'Молим изаберите бар један фајл.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionSrCyrl extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Нема дозволе';
	@override String get content => 'Нисте додали неопходне дозволе. Молим додајте их у Подешавања.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformSrCyrl extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Није доступно';
	@override String get content => 'Ова опција је доступна само на:';
}

// Path: dialogs.qr
class _StringsDialogsQrSrCyrl extends _StringsDialogsQrEn {
	_StringsDialogsQrSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Код';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsSrCyrl extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Брзе акције';
	@override String get counter => 'Мерач';
	@override String get prefix => 'Префикс';
	@override String get padZero => 'Без padding-a';
	@override String get sortBeforeCount => 'Сортирај по абецеди претходно';
	@override String get random => 'Random';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeSrCyrl extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => _root.general.quickSave;
	@override String get content => 'Захтеви за слање фајлова су аутоматски прихваћени. Примите к знању да било ко на локалној мрежи може да Вам пошаље фајл.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpSrCyrl extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Метод за слање';
	@override String get single => 'Пошаљи фајлове једном примаоцу. Селекција ће бити ресетована након завршеног слања.';
	@override String get multiple => 'Пошаљи фајлове за више прималаца. Селекција неће бити ресетована након завршеног слања.';
	@override String get link => 'Примаоци који немају LocalSend инсталиран, могу да преузму селектоване фајлове преко Линка у browseru.';
}

// Path: dialogs.zoom
class _StringsDialogsZoomSrCyrl extends _StringsDialogsZoomEn {
	_StringsDialogsZoomSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsSrCyrl extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Систем';
	@override String get dark => 'Тамно';
	@override String get light => 'Светло';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsSrCyrl extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Систем';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsSrCyrl extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Систем';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleSrCyrl extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleSrCyrl._(_StringsSrCyrl root) : this._root = root, super._(root);

	@override final _StringsSrCyrl _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Укупан прогрес (${time})';
	@override String get finishedError => 'Завршено са грешком';
	@override String get canceledSender => 'Пошиљалац је одустао';
	@override String get canceledReceiver => 'Прималац је одустао';
}
