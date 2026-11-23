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
  late final _Translations$networkInterfacesPage$tr networkInterfacesPage = _Translations$networkInterfacesPage$tr._(_root);
  @override
  late final _Translations$receiveHistoryPage$tr receiveHistoryPage = _Translations$receiveHistoryPage$tr._(_root);
  @override
  late final _Translations$apkPickerPage$tr apkPickerPage = _Translations$apkPickerPage$tr._(_root);
  @override
  late final _Translations$selectedFilesPage$tr selectedFilesPage = _Translations$selectedFilesPage$tr._(_root);
  @override
  late final _Translations$deviceDetailsPage$tr deviceDetailsPage = _Translations$deviceDetailsPage$tr._(_root);
  @override
  late final _Translations$verifyPage$tr verifyPage = _Translations$verifyPage$tr._(_root);
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
  late final _Translations$webReceivePage$tr webReceivePage = _Translations$webReceivePage$tr._(_root);
  @override
  late final _Translations$aboutPage$tr aboutPage = _Translations$aboutPage$tr._(_root);
  @override
  late final _Translations$donationPage$tr donationPage = _Translations$donationPage$tr._(_root);
  @override
  late final _Translations$changelogPage$tr changelogPage = _Translations$changelogPage$tr._(_root);
  @override
  late final _Translations$whatsNewPage$tr whatsNewPage = _Translations$whatsNewPage$tr._(_root);
  @override
  late final _Translations$aliasGenerator$tr aliasGenerator = _Translations$aliasGenerator$tr._(_root);
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
}

// Path: general
class _Translations$general$tr extends Translations$general$en {
  _Translations$general$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Kabul Et';
  @override
  String get accepted => 'Kabul Edildi';
  @override
  String get add => 'Ekle';
  @override
  String get advanced => 'Gelişmiş';
  @override
  String get cancel => 'İptal';
  @override
  String get close => 'Kapat';
  @override
  String get confirm => 'Onayla';
  @override
  String get continueStr => 'Devam Et';
  @override
  String get copy => 'Kopyala';
  @override
  String get copiedToClipboard => 'Panoya kopyalandı';
  @override
  String get decline => 'Reddet';
  @override
  String get done => 'Bitti';
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
  String get finished => 'Tamamlandı';
  @override
  String get hide => 'Gizle';
  @override
  String get off => 'Kapalı';
  @override
  String get offline => 'Çevrimdışı';
  @override
  String get on => 'Açık';
  @override
  String get online => 'Çevrimiçi';
  @override
  String get open => 'Aç';
  @override
  String get queue => 'Sıra';
  @override
  String get quickSave => 'Hızlı Kaydet';
  @override
  String get quickSaveFromFavorites => '"Favoriler" için Hızlı Kaydet';
  @override
  String get renamed => 'Yeniden adlandırıldı';
  @override
  String get reset => 'Değişiklikleri geri al';
  @override
  String get restart => 'Yeniden başlat';
  @override
  String get settings => 'Ayarlar';
  @override
  String get skipped => 'Atlandı';
  @override
  String get start => 'Başlat';
  @override
  String get stop => 'Durdur';
  @override
  String get save => 'Kaydet';
  @override
  String get unchanged => 'Değişmedi';
  @override
  String get unknown => 'Bilinmiyor';
  @override
  String get noItemInClipboard => 'Panoda hiçbir öğe yok.';
}

// Path: receiveTab
class _Translations$receiveTab$tr extends Translations$receiveTab$en {
  _Translations$receiveTab$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Al';
  @override
  late final _Translations$receiveTab$infoBox$tr infoBox = _Translations$receiveTab$infoBox$tr._(_root);
  @override
  late final _Translations$receiveTab$quickSave$tr quickSave = _Translations$receiveTab$quickSave$tr._(_root);
  @override
  String get link => 'Bağlantıyla al';
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
  String get shareIntentInfo => 'Dosyaları daha kolay seçmek için mobil cihazınızın "Paylaş" özelliğini de kullanabilirsiniz.';
  @override
  String get nearbyDevices => 'Yakındaki cihazlar';
  @override
  String get thisDevice => 'Bu Cihaz';
  @override
  String get scan => 'Cihaz ara';
  @override
  String get manualSending => 'Manuel gönderim';
  @override
  String get sendMode => 'Gönderim modu';
  @override
  late final _Translations$sendTab$sendModes$tr sendModes = _Translations$sendTab$sendModes$tr._(_root);
  @override
  String get sendModeHelp => 'Açıklama';
  @override
  String get help => 'Lütfen göndermek istediğiniz cihazın da aynı Wi-Fi ağında olduğundan emin olun.';
  @override
  String get placeItems => 'Paylaşmak istediğiniz öğeleri buraya bırakın.';
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
  String get subTitle => 'Uygulama beklediğiniz gibi çalışmıyor mu? Yaygın sorunların çözümlerini burada bulabilirsiniz.';
  @override
  String get solution => 'Çözüm:';
  @override
  String get fixButton => 'Otomatik düzelt';
  @override
  late final _Translations$troubleshootPage$firewall$tr firewall = _Translations$troubleshootPage$firewall$tr._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$tr noDiscovery = _Translations$troubleshootPage$noDiscovery$tr._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$tr noConnection = _Translations$troubleshootPage$noConnection$tr._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$tr extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ağ Arayüzleri';
  @override
  String get info =>
      'LocalSend varsayılan olarak kullanılabilir tüm ağ arayüzlerini kullanır. İstemediğiniz ağları buradan hariç tutabilirsiniz. Değişikliklerin geçerli olması için sunucuyu yeniden başlatmanız gerekir.';
  @override
  String get preview => 'Önizleme';
  @override
  String get whitelist => 'Beyaz Liste';
  @override
  String get blacklist => 'Kara Liste';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$tr extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geçmiş';
  @override
  String get openFolder => 'Klasörü aç';
  @override
  String get deleteHistory => 'Geçmişi temizle';
  @override
  String get empty => 'Geçmiş boş.';
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
  String get excludeSystemApps => 'Sistem uygulamalarını gizle';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Başlatılamayan uygulamaları gizle';
  @override
  String apps({required Object n}) => '${n} Uygulama';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$tr extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Tümünü kaldır';
}

// Path: deviceDetailsPage
class _Translations$deviceDetailsPage$tr extends Translations$deviceDetailsPage$en {
  _Translations$deviceDetailsPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Cihaz Ayrıntıları';
  @override
  String get favorite => 'Favori';
  @override
  String get verify => 'Doğrula';
  @override
  late final _Translations$deviceDetailsPage$info$tr info = _Translations$deviceDetailsPage$info$tr._(_root);
  @override
  late final _Translations$deviceDetailsPage$channels$tr channels = _Translations$deviceDetailsPage$channels$tr._(_root);
  @override
  late final _Translations$deviceDetailsPage$logs$tr logs = _Translations$deviceDetailsPage$logs$tr._(_root);
}

// Path: verifyPage
class _Translations$verifyPage$tr extends Translations$verifyPage$en {
  _Translations$verifyPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Doğrula';
  @override
  String get icons => 'Simgeler';
  @override
  String get text => 'Metin';
  @override
  String get question => 'Diğer cihazda da aynı şekilde mi görünüyor?';
}

// Path: receivePage
class _Translations$receivePage$tr extends Translations$receivePage$en {
  _Translations$receivePage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    n,
    one: 'size bir dosya göndermek istiyor',
    other: 'size ${n} dosya göndermek istiyor',
  );
  @override
  String get subTitleMessage => 'size bir mesaj gönderdi:';
  @override
  String get subTitleLink => 'size bir bağlantı gönderdi:';
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
  String get saveToGalleryOff => 'Klasör içerdiği için otomatik olarak kapatıldı.';
}

// Path: sendPage
class _Translations$sendPage$tr extends Translations$sendPage$en {
  _Translations$sendPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String calculatingChecksum({required Object curr, required Object n}) => 'Sağlama toplamı hesaplanıyor (${curr} / ${n})';
  @override
  String get waiting => 'Yanıt bekleniyor…';
  @override
  String get rejected => 'Alıcı isteği reddetti.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Alıcı şu anda başka bir istekle meşgul.';
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
  String get savedToGallery => 'Fotoğraflar\'a kaydedildi';
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
  String get title => 'Bağlantıyla paylaş';
  @override
  String get loading => 'Sunucu başlatılıyor…';
  @override
  String get stopping => 'Sunucu durduruluyor…';
  @override
  String get error => 'Sunucu başlatılırken bir hata oluştu.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    n,
    one: 'Bu bağlantıyı tarayıcınızda açın:',
    other: 'Bu bağlantılardan birini tarayıcınızda açın:',
  );
  @override
  String get requests => 'İstekler';
  @override
  String get noRequests => 'Henüz istek yok.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'İstekleri otomatik kabul et';
  @override
  String get requirePin => 'PIN iste';
  @override
  String pinHint({required Object pin}) => 'PIN kodu: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend kendinden imzalı (self-signed) bir sertifika kullanır. Tarayıcınızda bu sertifikayı onaylamanız gerekir.';
  @override
  String pendingRequests({required Object n}) => 'Bekleyen istekler: ${n}';
}

// Path: webReceivePage
class _Translations$webReceivePage$tr extends Translations$webReceivePage$en {
  _Translations$webReceivePage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bağlantıyla al';
}

// Path: aboutPage
class _Translations$aboutPage$tr extends Translations$aboutPage$en {
  _Translations$aboutPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend Hakkında';
  @override
  List<String> get description => [
    'LocalSend; internet bağlantısına ihtiyaç duymadan, yerel ağınız üzerinden yakındaki cihazlarla güvenli bir şekilde dosya ve mesaj paylaşmanızı sağlayan ücretsiz ve açık kaynaklı bir uygulamadır.',
    'Bu uygulama Android, iOS, macOS, Windows ve Linux platformlarında kullanılabilir. Tüm indirme seçeneklerini resmi web sitesinde bulabilirsiniz.',
  ];
  @override
  String get author => 'Geliştirici';
  @override
  String get contributors => 'Katkıda Bulunanlar';
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
  String get title => 'Bağış Yap';
  @override
  String get info =>
      'LocalSend ücretsiz, açık kaynaklı ve reklamsız bir uygulamadır. Uygulamayı beğendiyseniz geliştirme sürecine bağış yaparak destek olabilirsiniz.';
  @override
  String donate({required Object amount}) => '${amount} Bağış Yap';
  @override
  String get thanks => 'Çok teşekkür ederiz!';
  @override
  String get restore => 'Satın alımı geri yükle';
}

// Path: changelogPage
class _Translations$changelogPage$tr extends Translations$changelogPage$en {
  _Translations$changelogPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sürüm Notları';
}

// Path: whatsNewPage
class _Translations$whatsNewPage$tr extends Translations$whatsNewPage$en {
  _Translations$whatsNewPage$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object version}) => '${version} sürümündeki yenilikler';
  @override
  late final _Translations$whatsNewPage$changes$tr changes = _Translations$whatsNewPage$changes$tr._(_root);
}

// Path: aliasGenerator
class _Translations$aliasGenerator$tr extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'Sevimli',
    'Güzel',
    'Kocaman',
    'Parlak',
    'Temiz',
    'Zeki',
    'Havalı',
    'Şirin',
    'Kurnaz',
    'Kararlı',
    'Enerjik',
    'Becerikli',
    'Harika',
    'Hızlı',
    'Hoş',
    'Taze',
    'İyi',
    'Görkemli',
    'Şahane',
    'Yakışıklı',
    'Sıcak',
    'Nazik',
    'Tatlı',
    'Gizemli',
    'Şık',
    'Kibar',
    'Sabırlı',
    'Alımlı',
    'Güçlü',
    'Zengin',
    'Gizli',
    'Akıllı',
    'Sağlam',
    'Özel',
    'Stratejik',
    'Kuvvetli',
    'Titiz',
    'Bilge',
  ];
  @override
  List<String> get fruits => [
    'Elma',
    'Avokado',
    'Muz',
    'Böğürtlen',
    'Yaban Mersini',
    'Brokoli',
    'Havuç',
    'Kiraz',
    'Hindistan Cevizi',
    'Üzüm',
    'Limon',
    'Marul',
    'Mango',
    'Kavun',
    'Mantar',
    'Soğan',
    'Portakal',
    'Papaya',
    'Şeftali',
    'Armut',
    'Ananas',
    'Patates',
    'Balkabağı',
    'Ahududu',
    'Çilek',
    'Domates',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$tr extends Translations$dialogs$en {
  _Translations$dialogs$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$tr addFile = _Translations$dialogs$addFile$tr._(_root);
  @override
  late final _Translations$dialogs$openFile$tr openFile = _Translations$dialogs$openFile$tr._(_root);
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
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$tr quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$tr._(_root);
  @override
  late final _Translations$dialogs$pin$tr pin = _Translations$dialogs$pin$tr._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$tr sendModeHelp = _Translations$dialogs$sendModeHelp$tr._(_root);
  @override
  late final _Translations$dialogs$zoom$tr zoom = _Translations$dialogs$zoom$tr._(_root);
}

// Path: sanitization
class _Translations$sanitization$tr extends Translations$sanitization$en {
  _Translations$sanitization$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Dosya adı boş bırakılamaz';
  @override
  String get invalid => 'Dosya adı geçersiz karakterler içeriyor';
}

// Path: tray
class _Translations$tray$tr extends Translations$tray$en {
  _Translations$tray$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend\'den Çık';
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
  String get enterPin => 'PIN\'i girin';
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
  String get confirm => 'Onayla';
  @override
  String get cancel => 'İptal';
  @override
  String get edit => 'Düzenle';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Yüklenemedi';
  @override
  String get original => 'Orijinal';
  @override
  String get preview => 'Önizleme';
  @override
  String get select => 'Seç';
  @override
  String get emptyList => 'Liste boş';
  @override
  String get unSupportedAssetType => 'Desteklenmeyen dosya türü.';
  @override
  String get unableToAccessAll => 'Cihazdaki tüm dosyalara erişilemiyor';
  @override
  String get viewingLimitedAssetsTip => 'Yalnızca uygulamanın erişebildiği dosya ve albümleri görüntülüyorsunuz.';
  @override
  String get changeAccessibleLimitedAssets => 'Erişilebilir dosyaları güncellemek için dokunun';
  @override
  String get accessAllTip =>
      'Uygulama cihazdaki dosyaların yalnızca bir kısmına erişebiliyor. Tüm medyaya erişim izni vermek için sistem ayarlarına gidin.';
  @override
  String get goToSystemSettings => 'Sistem ayarlarına git';
  @override
  String get accessLimitedAssets => 'Sınırlı erişimle devam et';
  @override
  String get accessiblePathName => 'Erişilebilir dosyalar';
  @override
  String get sTypeAudioLabel => 'Ses';
  @override
  String get sTypeImageLabel => 'Görsel';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Diğer medya';
  @override
  String get sActionPlayHint => 'oynat';
  @override
  String get sActionPreviewHint => 'önizle';
  @override
  String get sActionSelectHint => 'seç';
  @override
  String get sActionSwitchPathLabel => 'klasör değiştir';
  @override
  String get sActionUseCameraHint => 'kamerayı kullan';
  @override
  String get sNameDurationLabel => 'süre';
  @override
  String get sUnitAssetCountLabel => 'adet';
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
  String get alias => 'Cihaz adı:';
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
  String get title => 'Seçilenler';
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
  String get multiple => 'Çoklu alıcı';
  @override
  String get link => 'Bağlantıyla paylaş';
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
  String get saveWindowPlacement => 'Uygulamadan çıkınca pencere konumunu kaydet';
  @override
  String get saveWindowPlacementWindows => 'Çıkışta pencere konumunu kaydet';
  @override
  String get alwaysOnTop => 'Her zaman üstte tut';
  @override
  String get alwaysOnTopUnavailable => 'Wayland\'de desteklenmiyor';
  @override
  String get minimizeToTray => 'Kapatırken sistem tepsisine/menü çubuğuna küçült';
  @override
  String get launchAtStartup => 'Oturum açılışında otomatik başlat';
  @override
  String get launchMinimized => 'Otomatik başlatma: Gizli başlat';
  @override
  String get showInContextMenu => 'Sağ tık menüsünde LocalSend\'i göster';
  @override
  String get softwareRendering => 'Yazılımsal işleme';
  @override
  String get softwareRenderingDescription =>
      'Pencere boş kalıyor, bozuk görünüyor veya açılışta kapanıyorsa kullanın. Yeniden başlatmadan sonra geçerli olur.';
  @override
  String get animations => 'Animasyonlar';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$tr extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Alma';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Otomatik Bitir';
  @override
  String get destination => 'Kaydedilecek klasör';
  @override
  String get downloads => '(İndirilenler)';
  @override
  String get saveToGallery => 'Medyayı galeriye kaydet';
  @override
  String get saveToHistory => 'Geçmişe kaydet';
  @override
  String get verifyChecksums => 'Dosya alırken sağlama toplamını (checksum) doğrula';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$tr extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gönderme';
  @override
  String get shareViaLinkAutoAccept => '"Bağlantıyla paylaş" modunda istekleri otomatik kabul et';
  @override
  String get createChecksums => 'Dosya gönderirken sağlama toplamı (checksum) oluştur';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$tr extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ağ';
  @override
  String get needRestart => 'Ayarların geçerli olması için sunucuyu yeniden başlatın!';
  @override
  String get server => 'Sunucu';
  @override
  String get alias => 'Cihaz adı';
  @override
  String get deviceType => 'Cihaz türü';
  @override
  String get deviceModel => 'Cihaz modeli';
  @override
  String get port => 'Port';
  @override
  String get network => 'Ağ';
  @override
  late final _Translations$settingsTab$network$networkOptions$tr networkOptions = _Translations$settingsTab$network$networkOptions$tr._(_root);
  @override
  String get discoveryTimeout => 'Keşif zaman aşımı';
  @override
  String get useSystemName => 'Sistem adını kullan';
  @override
  String get generateRandomAlias => 'Rastgele ad oluştur';
  @override
  String portWarning({required Object defaultPort}) =>
      'Özel bir port kullandığınız için diğer cihazlar sizi göremeyebilir. (varsayılan: ${defaultPort})';
  @override
  String get encryption => 'Şifreleme';
  @override
  String get multicastGroup => 'Multicast adresi';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Özel bir multicast adresi kullandığınız için diğer cihazlar sizi göremeyebilir. (varsayılan: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$tr extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Diğer';
  @override
  String get support => 'LocalSend\'i Destekle';
  @override
  String get donate => 'Bağış Yap';
  @override
  String get privacyPolicy => 'Gizlilik Politikası';
  @override
  String get termsOfUse => 'Kullanım Koşulları';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$tr extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu cihaz diğer cihazlara dosya gönderebiliyor ama diğer cihazlar bu cihaza dosya gönderemiyor.';
  @override
  String solution({required Object port}) =>
      'Büyük ihtimalle güvenlik duvarından kaynaklanıyor. ${port} numaralı portta gelen bağlantılara (UDP ve TCP) izin vererek bu sorunu çözebilirsiniz.';
  @override
  String get openFirewall => 'Güvenlik Duvarını Aç';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$tr extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu cihaz diğer cihazları bulamıyor.';
  @override
  String get solution =>
      'Lütfen tüm cihazların aynı Wi-Fi ağında olduğundan ve aynı ayarları (port, multicast adresi, şifreleme) kullandığından emin olun. Hedef cihazın IP adresini elle girmeyi de deneyebilirsiniz. Bu yöntem işe yararsa, ileride otomatik olarak bulunabilmesi için cihazı favorilerinize ekleyebilirsiniz.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$tr extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Cihazlar ne birbirini bulabiliyor ne de dosya paylaşabiliyor.';
  @override
  String get solution =>
      'Sorun her iki tarafta da mı yaşanıyor? Öyleyse her iki cihazın da aynı Wi-Fi ağında olduğundan ve aynı ayarları (port, multicast adresi, şifreleme) kullandığından emin olun. Wi-Fi ağınız, Erişim Noktası (AP) İzolasyonu nedeniyle cihazlar arası iletişimi engelliyor olabilir. Bu durumda yönlendirici (modem/router) ayarlarından bu özelliği kapatmanız gerekir.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$tr extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Dosyayı aç';
  @override
  String get showInFolder => 'Klasörde göster';
  @override
  String get info => 'Bilgiler';
  @override
  String get deleteFromHistory => 'Geçmişten sil';
}

// Path: deviceDetailsPage.info
class _Translations$deviceDetailsPage$info$tr extends Translations$deviceDetailsPage$info$en {
  _Translations$deviceDetailsPage$info$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Ad';
  @override
  String get version => 'Sürüm';
  @override
  String protocol({required Object version}) => 'Protokol v${version}';
}

// Path: deviceDetailsPage.channels
class _Translations$deviceDetailsPage$channels$tr extends Translations$deviceDetailsPage$channels$en {
  _Translations$deviceDetailsPage$channels$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kanallar';
  @override
  String get you => 'Siz';
  @override
  String get outgoing => 'Giden';
  @override
  String get incoming => 'Gelen';
  @override
  String get works => 'Çalışıyor';
  @override
  String get notTested => 'Test edilmedi';
  @override
  String get failed => 'Başarısız';
  @override
  String get notSeen => 'Görülmedi';
}

// Path: deviceDetailsPage.logs
class _Translations$deviceDetailsPage$logs$tr extends Translations$deviceDetailsPage$logs$en {
  _Translations$deviceDetailsPage$logs$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kayıtlar';
  @override
  String get empty => 'Henüz kayıt yok.';
  @override
  String outbound({required Object protocol, required Object host}) => '${protocol} üzerinden ulaşıldı (${host})';
  @override
  String outboundFailed({required Object protocol, required Object host, required Object error}) =>
      '${protocol} üzerinden ulaşılamadı (${host}): ${error}';
  @override
  String inbound({required Object protocol, required Object host}) => 'Bize ${protocol} üzerinden ulaştı (${host})';
  @override
  String multicastInbound({required Object host}) => 'Duyuru alındı (${host})';
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
  String speed({required Object speed}) => 'Hız: ${speed}/sn';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$tr extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String minutesUnit({required num m}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    m,
    other: '${m} dk',
  );
  @override
  String hoursUnit({required num h}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
    h,
    other: '${h} sa',
  );
  @override
  String minutes({required Object m, required Object ss}) => '${m}:${ss}';
  @override
  String hours({required num h, required num m}) =>
      '${_root.progressPage.remainingTime.hoursUnit(h: h)} ${_root.progressPage.remainingTime.minutesUnit(m: m)}';
}

// Path: whatsNewPage.changes
class _Translations$whatsNewPage$changes$tr extends Translations$whatsNewPage$changes$en {
  _Translations$whatsNewPage$changes$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$whatsNewPage$changes$v1_18_0$tr v1_18_0 = _Translations$whatsNewPage$changes$v1_18_0$tr._(_root);
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$tr extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçime ekle';
  @override
  String get content => 'Ne eklemek istersiniz?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$tr extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosyayı aç';
  @override
  String get content => 'Gelen dosyayı açmak istiyor musunuz?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$tr extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Adres girin';
  @override
  String get hashtag => 'Hashtag';
  @override
  String get ip => 'IP Adresi';
  @override
  String get recentlyUsed => 'Son kullanılanlar: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$tr extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya aktarımını iptal et';
  @override
  String get content => 'Dosya aktarımını iptal etmek istediğinizden emin misiniz?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$tr extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya açılamıyor';
  @override
  String content({required Object file}) => '"${file}" açılamadı. Dosya taşınmış, yeniden adlandırılmış veya silinmiş olabilir mi?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$tr extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Şifreleme devre dışı';
  @override
  String get content =>
      'İletişim artık şifrelenmemiş HTTP protokolü üzerinden gerçekleşiyor. HTTPS protokolünü kullanmak için şifrelemeyi tekrar açın.';
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
  String get noFavorites => 'Henüz favori cihazınız yok.';
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
  String content({required Object name}) => '"${name}" cihazını favorilerden silmek istediğinizden emin misiniz?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$tr extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Favorilere ekle';
  @override
  String get titleEdit => 'Ayarlar';
  @override
  String get name => 'Cihaz adı';
  @override
  String get auto => '(otomatik)';
  @override
  String get ip => 'IP Adresi';
  @override
  String get port => 'Port';
  @override
  String get invalidPort => '1 ile 65535 arasında bir tam sayı girin.';
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
  String get path => 'Dosya yolu:';
  @override
  String get size => 'Boyut:';
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
  String get title => 'Dosya adını girin';
  @override
  String original({required Object original}) => 'Orijinali: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$tr extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Geçmişi temizle';
  @override
  String get content => 'Tüm geçmişi temizlemek istediğinizden emin misiniz?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$tr extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'LocalSend, yerel ağı tarama izni olmadan diğer cihazları bulamaz. Lütfen ayarlardan bu izni verin.';
  @override
  String get gotoSettings => 'Ayarlar';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$tr extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mesaj yazın';
  @override
  String get multiline => 'Çok satırlı';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$tr extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dosya seçilmedi';
  @override
  String get content => 'Lütfen en az bir dosya seçin.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$tr extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'İzin yok';
  @override
  String get content => 'Gerekli izinleri vermediniz. Lütfen ayarlardan gerekli izinleri verin.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$tr extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Kullanılamıyor';
  @override
  String get content => 'Bu özellik yalnızca şu platformlarda kullanılabilir:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$tr extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR Kodu';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$tr extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Hızlı İşlemler';
  @override
  String get counter => 'Sayaç';
  @override
  String get prefix => 'Ön ek';
  @override
  String get padZero => 'Başına sıfır ekle';
  @override
  String get sortBeforeCount => 'Öncesinde alfabetik sırala (A-Z)';
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
  String get content => 'Gelen dosya istekleri artık otomatik olarak kabul edilecek. Yerel ağdaki herkesin size dosya gönderebileceğini unutmayın.';
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
    'Favori listenizdeki cihazlardan gelen dosya istekleri artık otomatik olarak kabul edilecek.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$tr extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN\'i girin';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$tr extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gönderim modları';
  @override
  String get single => 'Dosyaları tek bir alıcıya gönderir. Aktarım tamamlandıktan sonra seçilen dosyalar temizlenir.';
  @override
  String get multiple => 'Dosyaları birden fazla alıcıya gönderir. Aktarım tamamlandıktan sonra seçilen dosyalar listede kalır.';
  @override
  String get link => 'LocalSend yüklü olmayan kişiler, verilen bağlantıyı tarayıcılarında açarak seçili dosyaları indirebilir.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$tr extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$tr extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
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
  @override
  String get custom => 'Özel';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$tr extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
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
  String get finishedError => 'Hata ile sonuçlandı';
  @override
  String get canceledSender => 'Gönderici iptal etti';
  @override
  String get canceledReceiver => 'Alıcı iptal etti';
}

// Path: whatsNewPage.changes.v1_18_0
class _Translations$whatsNewPage$changes$v1_18_0$tr extends Translations$whatsNewPage$changes$v1_18_0$en with WhatsNewStrings {
  _Translations$whatsNewPage$changes$v1_18_0$tr._(TranslationsTr root) : this._root = root, super.internal(root);

  final TranslationsTr _root; // ignore: unused_field

  // Translations
  @override
  List<String> get changes => [
    'Şifreleme artık aktarımları yavaşlatmıyor. Daha önce kapattıysanız bu cihazda yeniden etkinleştirildi.',
    'Favorilerden gelen istekler artık otomatik olarak kabul ediliyor. Bu özellik varsayılan olarak açıktır; dilerseniz ayarlardan kapatabilirsiniz.',
    'Android\'de uygulama arka plandayken ya da ekran kapalıyken bile aktarımlar devam eder. iOS\'te ise uygulamanın ön planda kalması gerekir.',
  ];
}
