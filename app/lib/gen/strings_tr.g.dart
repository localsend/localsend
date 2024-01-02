part of 'strings.g.dart';

// Path: <root>
class _StringsTr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsTr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'Türkçe';
	@override String get appName => 'LocalSend';
	@override late final _StringsGeneralTr general = _StringsGeneralTr._(_root);
	@override late final _StringsReceiveTabTr receiveTab = _StringsReceiveTabTr._(_root);
	@override late final _StringsSendTabTr sendTab = _StringsSendTabTr._(_root);
	@override late final _StringsSettingsTabTr settingsTab = _StringsSettingsTabTr._(_root);
	@override late final _StringsTroubleshootPageTr troubleshootPage = _StringsTroubleshootPageTr._(_root);
	@override late final _StringsReceiveHistoryPageTr receiveHistoryPage = _StringsReceiveHistoryPageTr._(_root);
	@override late final _StringsApkPickerPageTr apkPickerPage = _StringsApkPickerPageTr._(_root);
	@override late final _StringsSelectedFilesPageTr selectedFilesPage = _StringsSelectedFilesPageTr._(_root);
	@override late final _StringsReceivePageTr receivePage = _StringsReceivePageTr._(_root);
	@override late final _StringsReceiveOptionsPageTr receiveOptionsPage = _StringsReceiveOptionsPageTr._(_root);
	@override late final _StringsSendPageTr sendPage = _StringsSendPageTr._(_root);
	@override late final _StringsProgressPageTr progressPage = _StringsProgressPageTr._(_root);
	@override late final _StringsWebSharePageTr webSharePage = _StringsWebSharePageTr._(_root);
	@override late final _StringsAboutPageTr aboutPage = _StringsAboutPageTr._(_root);
	@override late final _StringsDonationPageTr donationPage = _StringsDonationPageTr._(_root);
	@override late final _StringsChangelogPageTr changelogPage = _StringsChangelogPageTr._(_root);
	@override late final _StringsAliasGeneratorTr aliasGenerator = _StringsAliasGeneratorTr._(_root);
	@override late final _StringsDialogsTr dialogs = _StringsDialogsTr._(_root);
	@override late final _StringsTrayTr tray = _StringsTrayTr._(_root);
	@override late final _StringsWebTr web = _StringsWebTr._(_root);
	@override late final _StringsAssetPickerTr assetPicker = _StringsAssetPickerTr._(_root);
}

// Path: general
class _StringsGeneralTr extends _StringsGeneralEn {
	_StringsGeneralTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Kabul et';
	@override String get accepted => 'Kabul edildi';
	@override String get add => 'Ekle';
	@override String get advanced => 'Gelişmiş';
	@override String get cancel => 'İptal et';
	@override String get close => 'Kapat';
	@override String get confirm => 'Onayla';
	@override String get continueStr => 'Devam et';
	@override String get copy => 'Kopyala';
	@override String get copiedToClipboard => 'Panoya kopyalandı';
	@override String get decline => 'Reddet';
	@override String get done => 'Bitir';
	@override String get delete => 'Sil';
	@override String get edit => 'Düzenle';
	@override String get error => 'Hata';
	@override String get example => 'Örnek';
	@override String get files => 'Dosyalar';
	@override String get finished => 'Sonlandırıldı';
	@override String get hide => 'Gizle';
	@override String get off => 'Kapalı';
	@override String get offline => 'Çevrim dışı';
	@override String get on => 'Açık';
	@override String get online => 'Çevrim içi';
	@override String get open => 'Aç';
	@override String get queue => 'Sıra';
	@override String get quickSave => 'Hızlı kaydetme';
	@override String get renamed => 'Yeniden adlandırıldı';
	@override String get reset => 'Sıfırla';
	@override String get restart => 'Yeniden başlat';
	@override String get settings => 'Ayarlar';
	@override String get skipped => 'Geçildi';
	@override String get start => 'Başlat';
	@override String get stop => 'Durdur';
	@override String get save => 'Kaydet';
	@override String get unchanged => 'Değiştirilmemiş';
	@override String get unknown => 'Bilinmiyor';
	@override String get noItemInClipboard => 'Panoda öğe yok';
}

// Path: receiveTab
class _StringsReceiveTabTr extends _StringsReceiveTabEn {
	_StringsReceiveTabTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alım';
	@override late final _StringsReceiveTabInfoBoxTr infoBox = _StringsReceiveTabInfoBoxTr._(_root);
}

// Path: sendTab
class _StringsSendTabTr extends _StringsSendTabEn {
	_StringsSendTabTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gönder';
	@override late final _StringsSendTabSelectionTr selection = _StringsSendTabSelectionTr._(_root);
	@override late final _StringsSendTabPickerTr picker = _StringsSendTabPickerTr._(_root);
	@override String get shareIntentInfo => 'Dosyalarınızı daha kolay seçmek için cihazınızın "Paylaş" özelliğini kullanabilirsiniz.';
	@override String get nearbyDevices => 'Yakınınızdaki cihazlar';
	@override String get thisDevice => 'Cihazınız';
	@override String get scan => 'Cihazları tara';
	@override String get sendMode => 'Gönderme Modu';
	@override late final _StringsSendTabSendModesTr sendModes = _StringsSendTabSendModesTr._(_root);
	@override String get sendModeHelp => 'Açıklama';
	@override String get help => 'Lütfen hedef cihaz ile aynı wifi ağında olduğunuzdan emin olun.';
	@override String get placeItems => 'Paylaşmak istediğiniz dosyayı yerleştiriniz.';
}

// Path: settingsTab
class _StringsSettingsTabTr extends _StringsSettingsTabEn {
	_StringsSettingsTabTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarlar';
	@override late final _StringsSettingsTabGeneralTr general = _StringsSettingsTabGeneralTr._(_root);
	@override late final _StringsSettingsTabReceiveTr receive = _StringsSettingsTabReceiveTr._(_root);
	@override late final _StringsSettingsTabNetworkTr network = _StringsSettingsTabNetworkTr._(_root);
	@override String get advancedSettings => 'Gelişmiş ayarlar';
	@override late final _StringsSettingsTabOtherTr other = _StringsSettingsTabOtherTr._(_root);
}

// Path: troubleshootPage
class _StringsTroubleshootPageTr extends _StringsTroubleshootPageEn {
	_StringsTroubleshootPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sorun Giderme';
	@override String get subTitle => 'Bu uygulama beklendiği gibi çalışmıyor mu? Burada ortak çözümler bulabilirsiniz.';
	@override String get solution => 'Çözüm:';
	@override String get fixButton => 'Otomatik olarak düzelt';
	@override late final _StringsTroubleshootPageFirewallTr firewall = _StringsTroubleshootPageFirewallTr._(_root);
	@override late final _StringsTroubleshootPageNoConnectionTr noConnection = _StringsTroubleshootPageNoConnectionTr._(_root);
}

// Path: receiveHistoryPage
class _StringsReceiveHistoryPageTr extends _StringsReceiveHistoryPageEn {
	_StringsReceiveHistoryPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geçmiş';
	@override String get openFolder => 'Dosyayı aç';
	@override String get deleteHistory => 'Geçmişi sil';
	@override String get empty => 'Geçmiş yok.';
	@override late final _StringsReceiveHistoryPageEntryActionsTr entryActions = _StringsReceiveHistoryPageEntryActionsTr._(_root);
}

// Path: apkPickerPage
class _StringsApkPickerPageTr extends _StringsApkPickerPageEn {
	_StringsApkPickerPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uygulamalar (APK)';
	@override String get excludeSystemApps => 'Sistem uygulamalarını hariç tut';
	@override String get excludeAppsWithoutLaunchIntent => 'Başlatılamayan uygulamaları hariç tut';
	@override String apps({required Object n}) => '${n} Uygulamalar';
}

// Path: selectedFilesPage
class _StringsSelectedFilesPageTr extends _StringsSelectedFilesPageEn {
	_StringsSelectedFilesPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get deleteAll => 'Hepsini sil';
}

// Path: receivePage
class _StringsReceivePageTr extends _StringsReceivePageEn {
	_StringsReceivePageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n,
		one: 'sana bir dosya göndermek istiyor',
		other: 'sana ${n} tane dosya göndermek istiyor',
	);
	@override String get subTitleMessage => 'bir mesaj gönderdi:';
	@override String get subTitleLink => 'bir bağlantı gönderdi:';
	@override String get canceled => 'Gönderici isteği iptal etti.';
}

// Path: receiveOptionsPage
class _StringsReceiveOptionsPageTr extends _StringsReceiveOptionsPageEn {
	_StringsReceiveOptionsPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seçenekler';
	@override String get destination => '${_root.settingsTab.receive.destination}';
	@override String get appDirectory => '(LocalSend klasörü)';
	@override String get saveToGallery => '${_root.settingsTab.receive.saveToGallery}';
	@override String get saveToGalleryOff => 'Otomatik olarak kapanır çünkü bunlar klasör.';
}

// Path: sendPage
class _StringsSendPageTr extends _StringsSendPageEn {
	_StringsSendPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get waiting => 'Alıcıdan cevap bekleniyor...';
	@override String get rejected => 'Alıcı isteği reddetti.';
	@override String get busy => 'Alıcı başka bir istekle meşgul.';
}

// Path: progressPage
class _StringsProgressPageTr extends _StringsProgressPageEn {
	_StringsProgressPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get titleSending => 'Dosyalar gönderiliyor';
	@override String get titleReceiving => 'Dosyalar alınıyor';
	@override String get savedToGallery => 'Galeriye kaydedildi';
	@override late final _StringsProgressPageTotalTr total = _StringsProgressPageTotalTr._(_root);
}

// Path: webSharePage
class _StringsWebSharePageTr extends _StringsWebSharePageEn {
	_StringsWebSharePageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Link üzerinden paylaşın';
	@override String get loading => 'Sunucu başlıyor...';
	@override String get stopping => 'Sunucu durduruluyor ...';
	@override String get error => 'Sunucuyu başlatırken bir hata oluştu.';
	@override String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n,
		one: 'Bu bağlantıyı tarayıcıda açın:',
		other: 'Bu bağlantılardan birini tarayıcıda açın:',
	);
	@override String get requests => 'İstekler';
	@override String get noRequests => 'Henüz istek yok.';
	@override String get encryption => '${_root.settingsTab.network.encryption}';
	@override String get encryptionHint => 'LocalSend, tarayıcıda kabul etmeniz gereken kendi-üretimli bir sertifika kullanır.';
	@override String pendingRequests({required Object n}) => 'Bekleyen istekler: ${n}';
}

// Path: aboutPage
class _StringsAboutPageTr extends _StringsAboutPageEn {
	_StringsAboutPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'LocalSend hakkında';
	@override List<String> get description => [
		'LocalSend, internet bağlantısına ihtiyaç duymadan yerel ağınız üzerinden yakınınızdaki cihazlarla dosya ve mesajlarınızı güvenli bir şekilde paylaşmanıza olanak tanıyan özgür ve açık kaynaklı bir uygulamadır.',
		'Bu uygulama Android, iOS, macOS, Windows ve Linux\'ta mevcuttur. Tüm indirme seçeneklerini resmi ana sayfada bulabilirsiniz.',
	];
	@override String get author => 'Yazar';
	@override String get contributors => 'Katkıda bulunanlar';
	@override String get translators => 'Çevirmenler';
}

// Path: donationPage
class _StringsDonationPageTr extends _StringsDonationPageEn {
	_StringsDonationPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bağış yap';
	@override String get info => 'LocalSend ücretsiz, açık kaynaklı ve reklamsız bir uygulamadır. Eğer uygulamayı beğendiyseniz, bağış yaparak uygulamanın gelişimine katkıda bulunabilirsiniz.';
	@override String donate({required Object amount}) => 'Bağışta bulun ${amount}';
	@override String get thanks => 'Çok teşekkür ederim!';
	@override String get restore => 'Satın alınanları geri yükle';
}

// Path: changelogPage
class _StringsChangelogPageTr extends _StringsChangelogPageEn {
	_StringsChangelogPageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Değişiklik günlüğü';
}

// Path: aliasGenerator
class _StringsAliasGeneratorTr extends _StringsAliasGeneratorEn {
	_StringsAliasGeneratorTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
}

// Path: dialogs
class _StringsDialogsTr extends _StringsDialogsEn {
	_StringsDialogsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsDialogsAddFileTr addFile = _StringsDialogsAddFileTr._(_root);
	@override late final _StringsDialogsAddressInputTr addressInput = _StringsDialogsAddressInputTr._(_root);
	@override late final _StringsDialogsCancelSessionTr cancelSession = _StringsDialogsCancelSessionTr._(_root);
	@override late final _StringsDialogsCannotOpenFileTr cannotOpenFile = _StringsDialogsCannotOpenFileTr._(_root);
	@override late final _StringsDialogsEncryptionDisabledNoticeTr encryptionDisabledNotice = _StringsDialogsEncryptionDisabledNoticeTr._(_root);
	@override late final _StringsDialogsErrorDialogTr errorDialog = _StringsDialogsErrorDialogTr._(_root);
	@override late final _StringsDialogsFavoriteDialogTr favoriteDialog = _StringsDialogsFavoriteDialogTr._(_root);
	@override late final _StringsDialogsFavoriteDeleteDialogTr favoriteDeleteDialog = _StringsDialogsFavoriteDeleteDialogTr._(_root);
	@override late final _StringsDialogsFavoriteEditDialogTr favoriteEditDialog = _StringsDialogsFavoriteEditDialogTr._(_root);
	@override late final _StringsDialogsFileInfoTr fileInfo = _StringsDialogsFileInfoTr._(_root);
	@override late final _StringsDialogsFileNameInputTr fileNameInput = _StringsDialogsFileNameInputTr._(_root);
	@override late final _StringsDialogsLocalNetworkUnauthorizedTr localNetworkUnauthorized = _StringsDialogsLocalNetworkUnauthorizedTr._(_root);
	@override late final _StringsDialogsMessageInputTr messageInput = _StringsDialogsMessageInputTr._(_root);
	@override late final _StringsDialogsNoFilesTr noFiles = _StringsDialogsNoFilesTr._(_root);
	@override late final _StringsDialogsNoPermissionTr noPermission = _StringsDialogsNoPermissionTr._(_root);
	@override late final _StringsDialogsNotAvailableOnPlatformTr notAvailableOnPlatform = _StringsDialogsNotAvailableOnPlatformTr._(_root);
	@override late final _StringsDialogsQrTr qr = _StringsDialogsQrTr._(_root);
	@override late final _StringsDialogsQuickActionsTr quickActions = _StringsDialogsQuickActionsTr._(_root);
	@override late final _StringsDialogsQuickSaveNoticeTr quickSaveNotice = _StringsDialogsQuickSaveNoticeTr._(_root);
	@override late final _StringsDialogsSendModeHelpTr sendModeHelp = _StringsDialogsSendModeHelpTr._(_root);
	@override late final _StringsDialogsHistoryClearDialogTr historyClearDialog = _StringsDialogsHistoryClearDialogTr._(_root);
}

// Path: tray
class _StringsTrayTr extends _StringsTrayEn {
	_StringsTrayTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get open => '${_root.general.open}';
	@override String get close => 'LocalSend\'den çık';
}

// Path: web
class _StringsWebTr extends _StringsWebEn {
	_StringsWebTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get waiting => '${_root.sendPage.waiting}';
	@override String get rejected => 'Reddedildi';
	@override String get files => 'Dosyalar';
	@override String get fileName => 'Dosya adı';
	@override String get size => 'Boyut';
}

// Path: assetPicker
class _StringsAssetPickerTr extends _StringsAssetPickerEn {
	_StringsAssetPickerTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Onay';
	@override String get cancel => 'İptal';
	@override String get edit => 'Düzenle';
	@override String get gifIndicator => 'GIF';
	@override String get loadFailed => 'Yükleme başarısız';
	@override String get original => 'Orijinal';
	@override String get preview => 'Ön izleme';
	@override String get select => 'Seç';
	@override String get emptyList => 'Boş liste';
	@override String get unSupportedAssetType => 'Desteklenmeyen dosya türü.';
	@override String get unableToAccessAll => 'Cihazdaki tüm dosyalara erişilemiyor';
	@override String get viewingLimitedAssetsTip => 'Yalnızca uygulamanın erişilebilir dosyalarını ve albümlerini görüntüleyin.';
	@override String get changeAccessibleLimitedAssets => 'Erişilebilir dosyaları güncellemek için tıklayın';
	@override String get accessAllTip => 'Uygulama yalnızca cihazdaki bazı dosyalara erişebilir. Sistem ayarlarına gidin ve uygulamanın cihazdaki tüm medyalara erişmesine izin verin.';
	@override String get goToSystemSettings => 'Sistem ayarlarına gidin';
	@override String get accessLimitedAssets => 'Sınırlı Erişimle Devam Et';
	@override String get accessiblePathName => 'Erişilebilir dosyalar';
	@override String get sTypeAudioLabel => 'Ses';
	@override String get sTypeImageLabel => 'Görüntü';
	@override String get sTypeVideoLabel => 'Video';
	@override String get sTypeOtherLabel => 'Diğer medya';
	@override String get sActionPlayHint => 'oynat';
	@override String get sActionPreviewHint => 'Ön izleme';
	@override String get sActionSelectHint => 'seç';
	@override String get sActionSwitchPathLabel => 'dosya uzantısını değiştir';
	@override String get sActionUseCameraHint => 'Kamera kullan';
	@override String get sNameDurationLabel => 'süre';
	@override String get sUnitAssetCountLabel => 'sayım';
}

// Path: receiveTab.infoBox
class _StringsReceiveTabInfoBoxTr extends _StringsReceiveTabInfoBoxEn {
	_StringsReceiveTabInfoBoxTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get ip => 'IP:';
	@override String get port => 'Port:';
	@override String get alias => 'Takma isminiz:';
}

// Path: sendTab.selection
class _StringsSendTabSelectionTr extends _StringsSendTabSelectionEn {
	_StringsSendTabSelectionTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seçiminiz';
	@override String files({required Object files}) => 'Dosyalar: ${files}';
	@override String size({required Object size}) => 'Boyut: ${size}';
}

// Path: sendTab.picker
class _StringsSendTabPickerTr extends _StringsSendTabPickerEn {
	_StringsSendTabPickerTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get file => 'Dosya';
	@override String get folder => 'Klasör';
	@override String get media => 'Medya';
	@override String get text => 'Metin';
	@override String get app => 'Uygulama';
	@override String get clipboard => 'Yapıştır';
}

// Path: sendTab.sendModes
class _StringsSendTabSendModesTr extends _StringsSendTabSendModesEn {
	_StringsSendTabSendModesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get single => 'Tek alıcı';
	@override String get multiple => 'Birden fazla alıcı';
	@override String get link => 'Link üzerinden paylaşın';
}

// Path: settingsTab.general
class _StringsSettingsTabGeneralTr extends _StringsSettingsTabGeneralEn {
	_StringsSettingsTabGeneralTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Genel';
	@override String get brightness => 'Tema';
	@override late final _StringsSettingsTabGeneralBrightnessOptionsTr brightnessOptions = _StringsSettingsTabGeneralBrightnessOptionsTr._(_root);
	@override String get color => 'Renk';
	@override late final _StringsSettingsTabGeneralColorOptionsTr colorOptions = _StringsSettingsTabGeneralColorOptionsTr._(_root);
	@override String get language => 'Dil';
	@override late final _StringsSettingsTabGeneralLanguageOptionsTr languageOptions = _StringsSettingsTabGeneralLanguageOptionsTr._(_root);
	@override String get saveWindowPlacement => 'Çıkış: Burayı Kaydet';
	@override String get minimizeToTray => 'Çıkış: Simge durumuna küçült';
	@override String get launchAtStartup => 'Giriş yapıldıktan sonra otomatik başlat';
	@override String get launchMinimized => 'Otomatik başlatma: Gizli Başlatma';
	@override String get animations => 'Animasyonlar';
}

// Path: settingsTab.receive
class _StringsSettingsTabReceiveTr extends _StringsSettingsTabReceiveEn {
	_StringsSettingsTabReceiveTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alım';
	@override String get quickSave => '${_root.general.quickSave}';
	@override String get destination => 'Hedef klasör';
	@override String get downloads => '(İndirilenler)';
	@override String get saveToGallery => 'Medyayı galeriye kaydet';
	@override String get saveToHistory => 'Geçmişe kaydet';
}

// Path: settingsTab.network
class _StringsSettingsTabNetworkTr extends _StringsSettingsTabNetworkEn {
	_StringsSettingsTabNetworkTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ağ';
	@override String get needRestart => 'Ayarları uygulamak için sunucuyu yeniden başlatınız!';
	@override String get server => 'Sunucu';
	@override String get alias => 'Takma isminiz';
	@override String get deviceType => 'Cihaz tipi';
	@override String get deviceModel => 'Cihaz modeli';
	@override String get port => 'Port';
	@override String portWarning({required Object defaultPort}) => 'Kişiselleştirilmiş bir port kullanıyorsanız ağınızdaki diğer cihazlar tarafından bulunamayabilirsiniz. (varsayılan: ${defaultPort})';
	@override String get encryption => 'Şifreleme';
	@override String get multicastGroup => 'Çoklu yayın';
	@override String multicastGroupWarning({required Object defaultMulticast}) => 'Özel çoklu yayın adresini kullandığınız için diğer cihazlar tarafından algılanamayabilirsiniz.(varsayılan: ${defaultMulticast})';
}

// Path: settingsTab.other
class _StringsSettingsTabOtherTr extends _StringsSettingsTabOtherEn {
	_StringsSettingsTabOtherTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diğer';
	@override String get support => 'LocalSend\'i destekle';
	@override String get donate => 'Bağış yap';
	@override String get privacyPolicy => 'Gizlilik politikası';
	@override String get termsOfUse => 'Kullanım koşulları';
}

// Path: troubleshootPage.firewall
class _StringsTroubleshootPageFirewallTr extends _StringsTroubleshootPageFirewallEn {
	_StringsTroubleshootPageFirewallTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Bu uygulama diğer cihazlara dosya gönderebilir, ancak diğer cihazlar bu cihaza dosya gönderemez.';
	@override String solution({required Object port}) => 'Bu büyük olasılıkla bir güvenlik duvarı sorunudur. Port ${port} \'da gelen bağlantılara (UDP ve TCP) izin vererek bunu çözebilirsiniz.';
	@override String get openFirewall => 'Güvenlik Duvarını Aç';
}

// Path: troubleshootPage.noConnection
class _StringsTroubleshootPageNoConnectionTr extends _StringsTroubleshootPageNoConnectionEn {
	_StringsTroubleshootPageNoConnectionTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get symptom => 'Her iki cihaz da birbirini keşfedemez ve dosya paylaşamazlar.';
	@override String get solution => 'Sorun her iki tarafta da var mı? O zaman her iki cihazın da aynı WiFi ağında olduğundan ve aynı yapılandırmayı (bağlantı noktası, çoklu yayın adresi, şifreleme) paylaştığından emin olmanız gerekir. WiFi, katılımcılar arasında iletişime izin vermeyebilir. Bu durumda, bu seçenek yönlendiricide etkinleştirilmelidir. ';
}

// Path: receiveHistoryPage.entryActions
class _StringsReceiveHistoryPageEntryActionsTr extends _StringsReceiveHistoryPageEntryActionsEn {
	_StringsReceiveHistoryPageEntryActionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get open => 'Dosya aç';
	@override String get info => 'Bilgi';
	@override String get deleteFromHistory => 'Geçmişten sil';
}

// Path: progressPage.total
class _StringsProgressPageTotalTr extends _StringsProgressPageTotalEn {
	_StringsProgressPageTotalTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsProgressPageTotalTitleTr title = _StringsProgressPageTotalTitleTr._(_root);
	@override String count({required Object curr, required Object n}) => 'Dosyalar: ${curr} / ${n}';
	@override String size({required Object curr, required Object n}) => 'Boyut: ${curr} / ${n}';
	@override String speed({required Object speed}) => 'Hız: ${speed}/s';
}

// Path: dialogs.addFile
class _StringsDialogsAddFileTr extends _StringsDialogsAddFileEn {
	_StringsDialogsAddFileTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seçime ekle';
	@override String get content => 'Ne eklemek istiyorsunuz ?';
}

// Path: dialogs.addressInput
class _StringsDialogsAddressInputTr extends _StringsDialogsAddressInputEn {
	_StringsDialogsAddressInputTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adresi giriniz';
	@override String get hashtag => 'Hashtag';
	@override String get ip => 'IP adresi';
	@override String get recentlyUsed => 'Daha önce kullanılmış: ';
}

// Path: dialogs.cancelSession
class _StringsDialogsCancelSessionTr extends _StringsDialogsCancelSessionEn {
	_StringsDialogsCancelSessionTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dosya transferini iptal et';
	@override String get content => 'Gerçekten dosya transferini iptal etmek istiyor musunuz?';
}

// Path: dialogs.cannotOpenFile
class _StringsDialogsCannotOpenFileTr extends _StringsDialogsCannotOpenFileEn {
	_StringsDialogsCannotOpenFileTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dosya açılamadı';
	@override String content({required Object file}) => '"${file}" dosyası açılamadı. Dosya taşınmış, silinmiş veya ismi değiştirilmiş olabilir mi?';
}

// Path: dialogs.encryptionDisabledNotice
class _StringsDialogsEncryptionDisabledNoticeTr extends _StringsDialogsEncryptionDisabledNoticeEn {
	_StringsDialogsEncryptionDisabledNoticeTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Şifreleme devre dışı bırakıldı';
	@override String get content => 'Artık iletişim şifrelenmemiş HTTP protokolü aracılığıyla gerçekleşiyor. HTTPS protokolünü kullanmak için şifrelemeyi yeniden aktif edin.';
}

// Path: dialogs.errorDialog
class _StringsDialogsErrorDialogTr extends _StringsDialogsErrorDialogEn {
	_StringsDialogsErrorDialogTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.error}';
}

// Path: dialogs.favoriteDialog
class _StringsDialogsFavoriteDialogTr extends _StringsDialogsFavoriteDialogEn {
	_StringsDialogsFavoriteDialogTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoriler';
	@override String get noFavorites => 'Henüz favori cihaz yok.';
	@override String get addFavorite => 'Ekle';
}

// Path: dialogs.favoriteDeleteDialog
class _StringsDialogsFavoriteDeleteDialogTr extends _StringsDialogsFavoriteDeleteDialogEn {
	_StringsDialogsFavoriteDeleteDialogTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favorilerden sil';
	@override String content({required Object name}) => 'Favorilerden "${name}" öğesini gerçekten silmek istiyor musunuz?';
}

// Path: dialogs.favoriteEditDialog
class _StringsDialogsFavoriteEditDialogTr extends _StringsDialogsFavoriteEditDialogEn {
	_StringsDialogsFavoriteEditDialogTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get titleAdd => 'Favorilere ekle';
	@override String get titleEdit => 'Düzenle';
	@override String get name => 'Takma ad';
	@override String get auto => '(otomatik)';
	@override String get ip => 'IP Adresi';
	@override String get port => 'Port';
}

// Path: dialogs.fileInfo
class _StringsDialogsFileInfoTr extends _StringsDialogsFileInfoEn {
	_StringsDialogsFileInfoTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dosya bilgileri';
	@override String get fileName => 'Dosya adı:';
	@override String get path => 'Yolu:';
	@override String get size => 'Boyutu:';
	@override String get sender => 'Gönderen:';
	@override String get time => 'Zaman:';
}

// Path: dialogs.fileNameInput
class _StringsDialogsFileNameInputTr extends _StringsDialogsFileNameInputEn {
	_StringsDialogsFileNameInputTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dosya adını giriniz';
	@override String original({required Object original}) => 'Orijinal: ${original}';
}

// Path: dialogs.localNetworkUnauthorized
class _StringsDialogsLocalNetworkUnauthorizedTr extends _StringsDialogsLocalNetworkUnauthorizedEn {
	_StringsDialogsLocalNetworkUnauthorizedTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.dialogs.noPermission.title}';
	@override String get description => 'LocalSend, lokal ağı tarama iznine sahip olmadan başka cihazları bulamıyor. Lütfen bu izni ayarlarda verin.';
	@override String get gotoSettings => 'Ayarlar';
}

// Path: dialogs.messageInput
class _StringsDialogsMessageInputTr extends _StringsDialogsMessageInputEn {
	_StringsDialogsMessageInputTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mesaj yazınız';
	@override String get multiline => 'Çok satırlı mesaj';
}

// Path: dialogs.noFiles
class _StringsDialogsNoFilesTr extends _StringsDialogsNoFilesEn {
	_StringsDialogsNoFilesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Herhangi bir dosya seçilmedi';
	@override String get content => 'Lütfen bir dosya seçiniz.';
}

// Path: dialogs.noPermission
class _StringsDialogsNoPermissionTr extends _StringsDialogsNoPermissionEn {
	_StringsDialogsNoPermissionTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'İzin yok';
	@override String get content => 'Gerekli izinleri vermediniz. Lütfen ayarlardan izinleri verin.';
}

// Path: dialogs.notAvailableOnPlatform
class _StringsDialogsNotAvailableOnPlatformTr extends _StringsDialogsNotAvailableOnPlatformEn {
	_StringsDialogsNotAvailableOnPlatformTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Müsait değil';
	@override String get content => 'Bu özellik yalnızca şurada mevcuttur:';
}

// Path: dialogs.qr
class _StringsDialogsQrTr extends _StringsDialogsQrEn {
	_StringsDialogsQrTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Kod';
}

// Path: dialogs.quickActions
class _StringsDialogsQuickActionsTr extends _StringsDialogsQuickActionsEn {
	_StringsDialogsQuickActionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hızlı eylemler';
	@override String get counter => 'Sayaç';
	@override String get prefix => 'Ön ek';
	@override String get padZero => 'Sıfırlar ile doldurun';
	@override String get sortBeforeCount => 'Önceden alfabetik olarak sırala';
	@override String get random => 'Rastgele';
}

// Path: dialogs.quickSaveNotice
class _StringsDialogsQuickSaveNoticeTr extends _StringsDialogsQuickSaveNoticeEn {
	_StringsDialogsQuickSaveNoticeTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => '${_root.general.quickSave}';
	@override String get content => 'Dosya gönderim istekleri otomatik olarak gerçekleşir. Yerel ağınızdaki herkesin size dosya gönderebileceğinin farkında olunuz.';
}

// Path: dialogs.sendModeHelp
class _StringsDialogsSendModeHelpTr extends _StringsDialogsSendModeHelpEn {
	_StringsDialogsSendModeHelpTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gönderme Modu';
	@override String get single => 'Dosyaları bir alıcıya gönderir. Seçim, bitmiş dosya aktarımından sonra temizlenir.';
	@override String get multiple => 'Dosyaları birden çok alıcıya gönderir. Seçim temizlenmeyecektir.';
	@override String get link => 'LocalSend yüklü olmayan alıcılar, tarayıcılarındaki bağlantıyı açarak seçilen dosyaları indirebilir.';
}

// Path: dialogs.historyClearDialog
class _StringsDialogsHistoryClearDialogTr extends _StringsDialogsHistoryClearDialogEn {
	_StringsDialogsHistoryClearDialogTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geçmişi temizle';
	@override String get content => 'Gerçekten tüm geçmişi silmek istiyor musunuz?';
}

// Path: settingsTab.general.brightnessOptions
class _StringsSettingsTabGeneralBrightnessOptionsTr extends _StringsSettingsTabGeneralBrightnessOptionsEn {
	_StringsSettingsTabGeneralBrightnessOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem teması';
	@override String get dark => 'Koyu';
	@override String get light => 'Açık';
}

// Path: settingsTab.general.colorOptions
class _StringsSettingsTabGeneralColorOptionsTr extends _StringsSettingsTabGeneralColorOptionsEn {
	_StringsSettingsTabGeneralColorOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _StringsSettingsTabGeneralLanguageOptionsTr extends _StringsSettingsTabGeneralLanguageOptionsEn {
	_StringsSettingsTabGeneralLanguageOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem dili';
}

// Path: progressPage.total.title
class _StringsProgressPageTotalTitleTr extends _StringsProgressPageTotalTitleEn {
	_StringsProgressPageTotalTitleTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String sending({required Object time}) => 'Toplam ilerleme (${time})';
	@override String get finishedError => 'İşlem hatayla sonuçlandı';
	@override String get canceledSender => 'Gönderici tarafından iptal edildi';
	@override String get canceledReceiver => 'Alıcı tarafından iptal edildi';
}
