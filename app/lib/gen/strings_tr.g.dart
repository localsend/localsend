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
class TranslationsTr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsTr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.tr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <tr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsTr _root = this; // ignore: unused_field

  @override
  TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Türkçe';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$tr general = _Translations$general$tr._(_root);
  @override
  late final _Translations$receiveTab$tr receiveTab = _Translations$receiveTab$tr._(_root);
  @override
  late final _Translations$sendTab$tr sendTab = _Translations$sendTab$tr._(_root);
  @override
  late final _Translations$settingsTab$tr settingsTab = _Translations$settingsTab$tr._(_root);
  @override
  late final _Translations$troubleshootPage$tr troubleshootPage = _Translations$troubleshootPage$tr._(_root);
  @override
  late final _Translations$receiveHistoryPage$tr receiveHistoryPage = _Translations$receiveHistoryPage$tr._(_root);
  @override
  late final _Translations$apkPickerPage$tr apkPickerPage = _Translations$apkPickerPage$tr._(_root);
  @override
  late final _Translations$selectedFilesPage$tr selectedFilesPage = _Translations$selectedFilesPage$tr._(_root);
  @override
  late final _Translations$receivePage$tr receivePage = _Translations$receivePage$tr._(_root);
  @override
  late final _Translations$receiveOptionsPage$tr receiveOptionsPage = _Translations$receiveOptionsPage$tr._(_root);
  @override
  late final _Translations$sendPage$tr sendPage = _Translations$sendPage$tr._(_root);
  @override
  late final _Translations$progressPage$tr progressPage = _Translations$progressPage$tr._(_root);
  @override
  late final _Translations$webSharePage$tr webSharePage = _Translations$webSharePage$tr._(_root);
  @override
  late final _Translations$aboutPage$tr aboutPage = _Translations$aboutPage$tr._(_root);
  @override
  late final _Translations$donationPage$tr donationPage = _Translations$donationPage$tr._(_root);
  @override
  late final _Translations$changelogPage$tr changelogPage = _Translations$changelogPage$tr._(_root);
  @override
  late final _Translations$dialogs$tr dialogs = _Translations$dialogs$tr._(_root);
  @override
  late final _Translations$sanitization$tr sanitization = _Translations$sanitization$tr._(_root);
  @override
  late final _Translations$tray$tr tray = _Translations$tray$tr._(_root);
  @override
  late final _Translations$web$tr web = _Translations$web$tr._(_root);
  @override
  late final _Translations$assetPicker$tr assetPicker = _Translations$assetPicker$tr._(_root);
  @override
  late final _Translations$networkInterfacesPage$tr networkInterfacesPage = _Translations$networkInterfacesPage$tr._(_root);
}

// Path: general
class _Translations$general$tr extends Translations$general$en {
  _Translations$general$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Kabul et';
  @override
  String get accepted => 'Kabul edildi';
  @override
  String get add => 'Ekle';
  @override
  String get advanced => 'Gelişmiş';
  @override
  String get cancel => 'İptal et';
  @override
  String get close => 'Kapat';
  @override
  String get confirm => 'Onayla';
  @override
  String get continueStr => 'Devam et';
  @override
  String get copy => 'Kopyala';
  @override
  String get copiedToClipboard => 'Panoya kopyalandı';
  @override
  String get decline => 'Reddet';
  @override
  String get done => 'Bitir';
  @override
  String get delete => 'Sil';
  @override
  String get edit => 'Düzenle';
  @override
  String get error => 'Hata';
  @override
  String get example => 'Örnek';
  @override
  String get files => 'Dosyalar';
  @override
  String get finished => 'Sonlandırıldı';
  @override
  String get hide => 'Gizle';
  @override
  String get off => 'Kapalı';
  @override
  String get offline => 'Çevrim dışı';
  @override
  String get on => 'Açık';
  @override
  String get online => 'Çevrim içi';
  @override
  String get open => 'Aç';
  @override
  String get queue => 'Sıra';
  @override
  String get quickSave => 'Hızlı kaydetme';
  @override
  String get quickSaveFromFavorites => 'Favoriler';
  @override
  String get renamed => 'Yeniden adlandırıldı';
  @override
  String get reset => 'Sıfırla';
  @override
  String get restart => 'Yeniden başlat';
  @override
  String get settings => 'Ayarlar';
  @override
  String get skipped => 'Geçildi';
  @override
  String get start => 'Başlat';
  @override
  String get stop => 'Durdur';
  @override
  String get save => 'Kaydet';
  @override
  String get unchanged => 'Değiştirilmemiş';
  @override
  String get unknown => 'Bilinmiyor';
  @override
  String get noItemInClipboard => 'Panoda öğe yok.';
}

// Path: receiveTab
class _Translations$receiveTab$tr extends Translations$receiveTab$en {
  _Translations$receiveTab$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Alım';
  @override
  late final _Translations$receiveTab$infoBox$tr infoBox = _Translations$receiveTab$infoBox$tr._(_root);
  @override
  late final _Translations$receiveTab$quickSave$tr quickSave = _Translations$receiveTab$quickSave$tr._(_root);
}

// Path: sendTab
class _Translations$sendTab$tr extends Translations$sendTab$en {
  _Translations$sendTab$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gönder';
  @override
  late final _Translations$sendTab$selection$tr selection = _Translations$sendTab$selection$tr._(_root);
  @override
  late final _Translations$sendTab$picker$tr picker = _Translations$sendTab$picker$tr._(_root);
  @override
  String get shareIntentInfo => 'Dosyalarınızı daha kolay seçmek için cihazınızın "Paylaş" özelliğini kullanabilirsiniz.';
  @override
  String get nearbyDevices => 'Yakınınızdaki cihazlar';
  @override
  String get thisDevice => 'Cihazınız';
  @override
  String get scan => 'Cihazları tara';
  @override
  String get manualSending => 'Manuel Gönderme';
  @override
  String get sendMode => 'Gönderme Modu';
  @override
  late final _Translations$sendTab$sendModes$tr sendModes = _Translations$sendTab$sendModes$tr._(_root);
  @override
  String get sendModeHelp => 'Açıklama';
  @override
  String get help => 'Lütfen hedef cihaz ile aynı wifi ağında olduğunuzdan emin olun.';
  @override
  String get placeItems => 'Paylaşmak istediğiniz dosyayı yerleştiriniz.';
}

// Path: settingsTab
class _Translations$settingsTab$tr extends Translations$settingsTab$en {
  _Translations$settingsTab$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ayarlar';
  @override
  late final _Translations$settingsTab$general$tr general = _Translations$settingsTab$general$tr._(_root);
  @override
  late final _Translations$settingsTab$receive$tr receive = _Translations$settingsTab$receive$tr._(_root);
  @override
  late final _Translations$settingsTab$send$tr send = _Translations$settingsTab$send$tr._(_root);
  @override
  late final _Translations$settingsTab$network$tr network = _Translations$settingsTab$network$tr._(_root);
  @override
  late final _Translations$settingsTab$other$tr other = _Translations$settingsTab$other$tr._(_root);
  @override
  String get advancedSettings => 'Gelişmiş ayarlar';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$tr extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sorun Giderme';
  @override
  String get subTitle => 'Bu uygulama beklendiği gibi çalışmıyor mu? Burada ortak çözümler bulabilirsiniz.';
  @override
  String get solution => 'Çözüm:';
  @override
  String get fixButton => 'Otomatik olarak düzelt';
  @override
  late final _Translations$troubleshootPage$firewall$tr firewall = _Translations$troubleshootPage$firewall$tr._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$tr noDiscovery = _Translations$troubleshootPage$noDiscovery$tr._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$tr noConnection = _Translations$troubleshootPage$noConnection$tr._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$tr extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geçmiş';
  @override
  String get openFolder => 'Dosyayı aç';
  @override
  String get deleteHistory => 'Geçmişi sil';
  @override
  String get empty => 'Geçmiş yok.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$tr entryActions = _Translations$receiveHistoryPage$entryActions$tr._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$tr extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Uygulamalar (APK)';
  @override
  String get excludeSystemApps => 'Sistem uygulamalarını hariç tut';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Başlatılamayan uygulamaları hariç tut';
  @override
  String apps({required Object n}) => '${n} Uygulamalar';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$tr extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Hepsini sil';
}

// Path: receivePage
class _Translations$receivePage$tr extends Translations$receivePage$en {
  _Translations$receivePage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    n,
    one: 'sana bir dosya göndermek istiyor',
    other: 'sana ${n} tane dosya göndermek istiyor',
  );
  @override
  String get subTitleMessage => 'bir mesaj gönderdi:';
  @override
  String get subTitleLink => 'bir bağlantı gönderdi:';
  @override
  String get canceled => 'Gönderici isteği iptal etti.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$tr extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçenekler';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend klasörü)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Otomatik olarak kapanır çünkü bunlar klasör.';
}

// Path: sendPage
class _Translations$sendPage$tr extends Translations$sendPage$en {
  _Translations$sendPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Alıcıdan cevap bekleniyor…';
  @override
  String get rejected => 'Alıcı isteği reddetti.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Alıcı başka bir istekle meşgul.';
}

// Path: progressPage
class _Translations$progressPage$tr extends Translations$progressPage$en {
  _Translations$progressPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Dosyalar gönderiliyor';
  @override
  String get titleReceiving => 'Dosyalar alınıyor';
  @override
  String get savedToGallery => 'Galeriye kaydedildi';
  @override
  late final _Translations$progressPage$total$tr total = _Translations$progressPage$total$tr._(_root);
  @override
  late final _Translations$progressPage$remainingTime$tr remainingTime = _Translations$progressPage$remainingTime$tr._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$tr extends Translations$webSharePage$en {
  _Translations$webSharePage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Link üzerinden paylaşın';
  @override
  String get loading => 'Sunucu başlıyor…';
  @override
  String get stopping => 'Sunucu durduruluyor…';
  @override
  String get error => 'Sunucuyu başlatırken bir hata oluştu.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    n,
    one: 'Bu bağlantıyı tarayıcıda açın:',
    other: 'Bu bağlantılardan birini tarayıcıda açın:',
  );
  @override
  String get requests => 'İstekler';
  @override
  String get noRequests => 'Henüz istek yok.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'İstekleri otomatik olarak kabul et';
  @override
  String get requirePin => 'PIN gerektir';
  @override
  String pinHint({required Object pin}) => 'PIN "${pin}"';
  @override
  String get encryptionHint => 'LocalSend, tarayıcıda kabul etmeniz gereken kendi-üretimli bir sertifika kullanır.';
  @override
  String pendingRequests({required Object n}) => 'Bekleyen istekler: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$tr extends Translations$aboutPage$en {
  _Translations$aboutPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend hakkında';
  @override
  List<String> get description => [
    'LocalSend, internet bağlantısına ihtiyaç duymadan yerel ağınız üzerinden yakınınızdaki cihazlarla dosya ve mesajlarınızı güvenli bir şekilde paylaşmanıza olanak tanıyan özgür ve açık kaynaklı bir uygulamadır.',
    'Bu uygulama Android, iOS, macOS, Windows ve Linux\'ta mevcuttur. Tüm indirme seçeneklerini resmi ana sayfada bulabilirsiniz.',
  ];
  @override
  String get author => 'Yazar';
  @override
  String get contributors => 'Katkıda bulunanlar';
  @override
  String get packagers => 'Paketleyiciler';
  @override
  String get translators => 'Çevirmenler';
}

// Path: donationPage
class _Translations$donationPage$tr extends Translations$donationPage$en {
  _Translations$donationPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bağış yap';
  @override
  String get info =>
      'LocalSend ücretsiz, açık kaynaklı ve reklamsız bir uygulamadır. Eğer uygulamayı beğendiyseniz, bağış yaparak uygulamanın gelişimine katkıda bulunabilirsiniz.';
  @override
  String donate({required Object amount}) => 'Bağışta bulun ${amount}';
  @override
  String get thanks => 'Çok teşekkür ederim!';
  @override
  String get restore => 'Satın alınanları geri yükle';
}

// Path: changelogPage
class _Translations$changelogPage$tr extends Translations$changelogPage$en {
  _Translations$changelogPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Değişiklik günlüğü';
}

// Path: dialogs
class _Translations$dialogs$tr extends Translations$dialogs$en {
  _Translations$dialogs$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$tr addFile = _Translations$dialogs$addFile$tr._(_root);
  @override
  late final _Translations$dialogs$addressInput$tr addressInput = _Translations$dialogs$addressInput$tr._(_root);
  @override
  late final _Translations$dialogs$cancelSession$tr cancelSession = _Translations$dialogs$cancelSession$tr._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$tr cannotOpenFile = _Translations$dialogs$cannotOpenFile$tr._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$tr encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$tr._(_root);
  @override
  late final _Translations$dialogs$errorDialog$tr errorDialog = _Translations$dialogs$errorDialog$tr._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$tr favoriteDialog = _Translations$dialogs$favoriteDialog$tr._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$tr favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$tr._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$tr favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$tr._(_root);
  @override
  late final _Translations$dialogs$fileInfo$tr fileInfo = _Translations$dialogs$fileInfo$tr._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$tr fileNameInput = _Translations$dialogs$fileNameInput$tr._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$tr historyClearDialog = _Translations$dialogs$historyClearDialog$tr._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$tr localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$tr._(_root);
  @override
  late final _Translations$dialogs$messageInput$tr messageInput = _Translations$dialogs$messageInput$tr._(_root);
  @override
  late final _Translations$dialogs$noFiles$tr noFiles = _Translations$dialogs$noFiles$tr._(_root);
  @override
  late final _Translations$dialogs$noPermission$tr noPermission = _Translations$dialogs$noPermission$tr._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$tr notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$tr._(_root);
  @override
  late final _Translations$dialogs$qr$tr qr = _Translations$dialogs$qr$tr._(_root);
  @override
  late final _Translations$dialogs$quickActions$tr quickActions = _Translations$dialogs$quickActions$tr._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$tr quickSaveNotice = _Translations$dialogs$quickSaveNotice$tr._(_root);
  @override
  late final _Translations$dialogs$pin$tr pin = _Translations$dialogs$pin$tr._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$tr sendModeHelp = _Translations$dialogs$sendModeHelp$tr._(_root);
  @override
  late final _Translations$dialogs$zoom$tr zoom = _Translations$dialogs$zoom$tr._(_root);
  @override
  late final _Translations$dialogs$openFile$tr openFile = _Translations$dialogs$openFile$tr._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$tr quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$tr._(_root);
}

// Path: sanitization
class _Translations$sanitization$tr extends Translations$sanitization$en {
  _Translations$sanitization$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Dosya ismi boş olamaz';
  @override
  String get invalid => 'Dosya ismi geçersiz karakter bulunduruyor';
}

// Path: tray
class _Translations$tray$tr extends Translations$tray$en {
  _Translations$tray$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend\'den çık';
  @override
  String get closeWindows => 'Çıkış';
}

// Path: web
class _Translations$web$tr extends Translations$web$en {
  _Translations$web$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN girin';
  @override
  String get invalidPin => 'Geçersiz PIN';
  @override
  String get tooManyAttempts => 'Çok fazla deneme';
  @override
  String get rejected => 'Reddedildi';
  @override
  String get files => 'Dosyalar';
  @override
  String get fileName => 'Dosya adı';
  @override
  String get size => 'Boyut';
}

// Path: assetPicker
class _Translations$assetPicker$tr extends Translations$assetPicker$en {
  _Translations$assetPicker$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Onay';
  @override
  String get cancel => 'İptal';
  @override
  String get edit => 'Düzenle';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Yükleme başarısız';
  @override
  String get original => 'Orijinal';
  @override
  String get preview => 'Ön izleme';
  @override
  String get select => 'Seç';
  @override
  String get emptyList => 'Boş liste';
  @override
  String get unSupportedAssetType => 'Desteklenmeyen dosya türü.';
  @override
  String get unableToAccessAll => 'Cihazdaki tüm dosyalara erişilemiyor';
  @override
  String get viewingLimitedAssetsTip => 'Yalnızca uygulamanın erişilebilir dosyalarını ve albümlerini görüntüleyin.';
  @override
  String get changeAccessibleLimitedAssets => 'Erişilebilir dosyaları güncellemek için tıklayın';
  @override
  String get accessAllTip =>
      'Uygulama yalnızca cihazdaki bazı dosyalara erişebilir. Sistem ayarlarına gidin ve uygulamanın cihazdaki tüm medyalara erişmesine izin verin.';
  @override
  String get goToSystemSettings => 'Sistem ayarlarına gidin';
  @override
  String get accessLimitedAssets => 'Sınırlı Erişimle Devam Et';
  @override
  String get accessiblePathName => 'Erişilebilir dosyalar';
  @override
  String get sTypeAudioLabel => 'Ses';
  @override
  String get sTypeImageLabel => 'Görüntü';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Diğer medya';
  @override
  String get sActionPlayHint => 'oynat';
  @override
  String get sActionPreviewHint => 'Ön izleme';
  @override
  String get sActionSelectHint => 'seç';
  @override
  String get sActionSwitchPathLabel => 'dosya uzantısını değiştir';
  @override
  String get sActionUseCameraHint => 'Kamera kullan';
  @override
  String get sNameDurationLabel => 'süre';
  @override
  String get sUnitAssetCountLabel => 'sayım';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$tr extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ağ Arayüzleri';
  @override
  String get preview => 'Önizle';
  @override
  String get whitelist => 'Beyaz liste';
  @override
  String get blacklist => 'Kara liste';
  @override
  String get info =>
      'Varsayılan olarak, LocalSend mevcut olan tüm ağları kullanır. Burada istenmeyen ağları engelleyebilirsiniz. Değişikliklerin uygulanması için sunucuyu yeniden başlatmanız gerekir.';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$tr extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Takma isminiz:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$tr extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoriler';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$tr extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçiminiz';
  @override
  String files({required Object files}) => 'Dosyalar: ${files}';
  @override
  String size({required Object size}) => 'Boyut: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$tr extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Dosya';
  @override
  String get folder => 'Klasör';
  @override
  String get media => 'Medya';
  @override
  String get text => 'Metin';
  @override
  String get app => 'Uygulama';
  @override
  String get clipboard => 'Yapıştır';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$tr extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Tek alıcı';
  @override
  String get multiple => 'Birden fazla alıcı';
  @override
  String get link => 'Link üzerinden paylaşın';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$tr extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Genel';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$tr brightnessOptions = _Translations$settingsTab$general$brightnessOptions$tr._(
    _root,
  );
  @override
  String get color => 'Renk';
  @override
  late final _Translations$settingsTab$general$colorOptions$tr colorOptions = _Translations$settingsTab$general$colorOptions$tr._(_root);
  @override
  String get language => 'Dil';
  @override
  late final _Translations$settingsTab$general$languageOptions$tr languageOptions = _Translations$settingsTab$general$languageOptions$tr._(_root);
  @override
  String get saveWindowPlacement => 'Çıkış: Burayı Kaydet';
  @override
  String get saveWindowPlacementWindows => 'Çıkıştan sonra pencere konumunu kaydet';
  @override
  String get minimizeToTray => 'Çıkış: Simge durumuna küçült';
  @override
  String get launchAtStartup => 'Giriş yapıldıktan sonra otomatik başlat';
  @override
  String get launchMinimized => 'Otomatik başlatma: Gizli Başlatma';
  @override
  String get showInContextMenu => 'LocalSend\'i bağlam menüsünde göster';
  @override
  String get animations => 'Animasyonlar';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$tr extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Alım';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Otomatik bitir';
  @override
  String get destination => 'Hedef klasör';
  @override
  String get downloads => '(İndirilenler)';
  @override
  String get saveToGallery => 'Medyayı galeriye kaydet';
  @override
  String get saveToHistory => 'Geçmişe kaydet';
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
}

// Path: settingsTab.send
class _Translations$settingsTab$send$tr extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gönder';
  @override
  String get shareViaLinkAutoAccept => 'Link aracılığıyla paylaş: Otomatik olarak kabul et';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$tr extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ağ';
  @override
  String get needRestart => 'Ayarları uygulamak için sunucuyu yeniden başlatınız!';
  @override
  String get server => 'Sunucu';
  @override
  String get alias => 'Takma isminiz';
  @override
  String get deviceType => 'Cihaz tipi';
  @override
  String get deviceModel => 'Cihaz modeli';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Arama zaman aşımına uğradı';
  @override
  String portWarning({required Object defaultPort}) =>
      'Kişiselleştirilmiş bir port kullanıyorsanız ağınızdaki diğer cihazlar tarafından bulunamayabilirsiniz. (varsayılan: ${defaultPort})';
  @override
  String get encryption => 'Şifreleme';
  @override
  String get multicastGroup => 'Çoklu yayın';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Özel çoklu yayın adresini kullandığınız için diğer cihazlar tarafından algılanamayabilirsiniz.(varsayılan: ${defaultMulticast})';
  @override
  String get network => 'Ağ';
  @override
  late final _Translations$settingsTab$network$networkOptions$tr networkOptions = _Translations$settingsTab$network$networkOptions$tr._(_root);
  @override
  String get useSystemName => 'Sistem adını kullan';
  @override
  String get generateRandomAlias => 'Rastgele takma ad oluştur';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$tr extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Diğer';
  @override
  String get support => 'LocalSend\'i destekle';
  @override
  String get donate => 'Bağış yap';
  @override
  String get privacyPolicy => 'Gizlilik politikası';
  @override
  String get termsOfUse => 'Kullanım koşulları';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$tr extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu uygulama diğer cihazlara dosya gönderebilir, ancak diğer cihazlar bu cihaza dosya gönderemez.';
  @override
  String solution({required Object port}) =>
      'Bu büyük olasılıkla bir güvenlik duvarı sorunudur. Port ${port} \'da gelen bağlantılara (UDP ve TCP) izin vererek bunu çözebilirsiniz.';
  @override
  String get openFirewall => 'Güvenlik Duvarını Aç';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$tr extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu cihaz diğer cihazları keşfedemez.';
  @override
  String get solution =>
      'Lütfen tüm cihazların aynı Wi-Fi ağında olduğundan ve aynı yapılandırmayı (bağlantı noktası, çok noktaya yayın adresi, şifreleme) paylaştığından emin olun. Hedef cihazın IP adresini manuel olarak yazmayı deneyebilirsiniz. Bu işe yararsa, gelecekte otomatik olarak keşfedilebilmesi için bu cihazı favorilere eklemeyi düşünün.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$tr extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Her iki cihaz da birbirini keşfedemez ve dosya paylaşamazlar.';
  @override
  String get solution =>
      'Sorun her iki tarafta da var mı? O zaman her iki cihazın da aynı WiFi ağında olduğundan ve aynı yapılandırmayı (bağlantı noktası, çoklu yayın adresi, şifreleme) paylaştığından emin olmanız gerekir. WiFi, katılımcılar arasında iletişime izin vermeyebilir. Bu durumda, bu seçenek yönlendiricide etkinleştirilmelidir.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$tr extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Dosya aç';
  @override
  String get showInFolder => 'Klasörde göster';
  @override
  String get info => 'Bilgi';
  @override
  String get deleteFromHistory => 'Geçmişten sil';
}

// Path: progressPage.total
class _Translations$progressPage$total$tr extends Translations$progressPage$total$en {
  _Translations$progressPage$total$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$tr title = _Translations$progressPage$total$title$tr._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Dosyalar: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Boyut: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Hız: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$tr extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';

  /// Saat kısaltması için 's', dakika kısaltması için 'd' kullanın
  @override
  String hours({required Object h, required Object m}) => '${h}s ${m}d';

  /// Günler için 'g', saatler için 's' ve dakikalar için 'd' kullanın
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}g ${h}s ${m}d';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$tr extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçime ekle';
  @override
  String get content => 'Ne eklemek istiyorsunuz ?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$tr extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adresi giriniz';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP adresi';
  @override
  String get recentlyUsed => 'Daha önce kullanılmış: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$tr extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya transferini iptal et';
  @override
  String get content => 'Gerçekten dosya transferini iptal etmek istiyor musunuz?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$tr extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya açılamadı';
  @override
  String content({required Object file}) => '"${file}" dosyası açılamadı. Dosya taşınmış, silinmiş veya ismi değiştirilmiş olabilir mi?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$tr extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Şifreleme devre dışı bırakıldı';
  @override
  String get content =>
      'Artık iletişim şifrelenmemiş HTTP protokolü aracılığıyla gerçekleşiyor. HTTPS protokolünü kullanmak için şifrelemeyi yeniden aktif edin.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$tr extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$tr extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favoriler';
  @override
  String get noFavorites => 'Henüz favori cihaz yok.';
  @override
  String get addFavorite => 'Ekle';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$tr extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Favorilerden sil';
  @override
  String content({required Object name}) => 'Favorilerden "${name}" öğesini gerçekten silmek istiyor musunuz?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$tr extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Favorilere ekle';
  @override
  String get titleEdit => 'Düzenle';
  @override
  String get name => 'Takma ad';
  @override
  String get auto => '(otomatik)';
  @override
  String get ip => 'IP Adresi';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$tr extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya bilgileri';
  @override
  String get fileName => 'Dosya adı:';
  @override
  String get path => 'Yolu:';
  @override
  String get size => 'Boyutu:';
  @override
  String get sender => 'Gönderen:';
  @override
  String get time => 'Zaman:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$tr extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya adını giriniz';
  @override
  String original({required Object original}) => 'Orijinal: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$tr extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geçmişi temizle';
  @override
  String get content => 'Gerçekten tüm geçmişi silmek istiyor musunuz?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$tr extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend, lokal ağı tarama iznine sahip olmadan başka cihazları bulamıyor. Lütfen bu izni ayarlarda verin.';
  @override
  String get gotoSettings => 'Ayarlar';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$tr extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mesaj yazınız';
  @override
  String get multiline => 'Çok satırlı mesaj';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$tr extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Herhangi bir dosya seçilmedi';
  @override
  String get content => 'Lütfen bir dosya seçiniz.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$tr extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'İzin yok';
  @override
  String get content => 'Gerekli izinleri vermediniz. Lütfen ayarlardan izinleri verin.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$tr extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Müsait değil';
  @override
  String get content => 'Bu özellik yalnızca şurada mevcuttur:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$tr extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Kod';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$tr extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hızlı eylemler';
  @override
  String get counter => 'Sayaç';
  @override
  String get prefix => 'Ön ek';
  @override
  String get padZero => 'Sıfırlar ile doldurun';
  @override
  String get sortBeforeCount => 'Önceden alfabetik olarak sırala';
  @override
  String get random => 'Rastgele';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$tr extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Dosya gönderim istekleri otomatik olarak gerçekleşir. Yerel ağınızdaki herkesin size dosya gönderebileceğinin farkında olunuz.';
}

// Path: dialogs.pin
class _Translations$dialogs$pin$tr extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN girin';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$tr extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gönderme Modu';
  @override
  String get single => 'Dosyaları bir alıcıya gönderir. Seçim, bitmiş dosya aktarımından sonra temizlenir.';
  @override
  String get multiple => 'Dosyaları birden çok alıcıya gönderir. Seçim temizlenmeyecektir.';
  @override
  String get link => 'LocalSend yüklü olmayan alıcılar, tarayıcılarındaki bağlantıyı açarak seçilen dosyaları indirebilir.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$tr extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$tr extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya Aç';
  @override
  String get content => 'Alınan dosyayı açmak istiyor musunuz?';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$tr extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'Favoriler listenizdeki cihazların paylaşım istekleri otomatik olarak kabul edilecektir.',
    'Uyarı! Şu an, bu tamamen güvenli değildir çünkü favoriler listenizdeki herhangi bir cihazın parmak izine sahip olan hackerlar sınırlama olmadan size dosyalar gönderebilir.',
    'Ancak, bu seçenek yinede ağdaki tüm kullanıcıların size sınırlandırma olmadan dosya göndermesine izin vermekten daha güvenlidir.',
  ];
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$tr extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem teması';
  @override
  String get dark => 'Koyu';
  @override
  String get light => 'Açık';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$tr extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$tr extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem dili';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$tr extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Tümü';
  @override
  String get filtered => 'Filtrelenmiş';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$tr extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Toplam ilerleme (${time})';
  @override
  String get finishedError => 'İşlem hatayla sonuçlandı';
  @override
  String get canceledSender => 'Gönderici tarafından iptal edildi';
  @override
  String get canceledReceiver => 'Alıcı tarafından iptal edildi';
}
