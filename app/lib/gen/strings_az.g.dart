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
class TranslationsAz extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAz({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.az,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <az>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAz _root = this; // ignore: unused_field

  @override
  TranslationsAz $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAz(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'Azərbaycanca';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$az general = _Translations$general$az._(_root);
  @override
  late final _Translations$receiveTab$az receiveTab = _Translations$receiveTab$az._(_root);
  @override
  late final _Translations$sendTab$az sendTab = _Translations$sendTab$az._(_root);
  @override
  late final _Translations$settingsTab$az settingsTab = _Translations$settingsTab$az._(_root);
  @override
  late final _Translations$receiveHistoryPage$az receiveHistoryPage = _Translations$receiveHistoryPage$az._(_root);
  @override
  late final _Translations$dialogs$az dialogs = _Translations$dialogs$az._(_root);
  @override
  late final _Translations$troubleshootPage$az troubleshootPage = _Translations$troubleshootPage$az._(_root);
  @override
  late final _Translations$webSharePage$az webSharePage = _Translations$webSharePage$az._(_root);
  @override
  late final _Translations$networkInterfacesPage$az networkInterfacesPage = _Translations$networkInterfacesPage$az._(_root);
  @override
  late final _Translations$assetPicker$az assetPicker = _Translations$assetPicker$az._(_root);
  @override
  late final _Translations$sendPage$az sendPage = _Translations$sendPage$az._(_root);
  @override
  late final _Translations$web$az web = _Translations$web$az._(_root);
  @override
  late final _Translations$tray$az tray = _Translations$tray$az._(_root);
  @override
  late final _Translations$apkPickerPage$az apkPickerPage = _Translations$apkPickerPage$az._(_root);
  @override
  late final _Translations$receivePage$az receivePage = _Translations$receivePage$az._(_root);
  @override
  late final _Translations$receiveOptionsPage$az receiveOptionsPage = _Translations$receiveOptionsPage$az._(_root);
  @override
  late final _Translations$progressPage$az progressPage = _Translations$progressPage$az._(_root);
  @override
  late final _Translations$donationPage$az donationPage = _Translations$donationPage$az._(_root);
  @override
  late final _Translations$selectedFilesPage$az selectedFilesPage = _Translations$selectedFilesPage$az._(_root);
  @override
  late final _Translations$aboutPage$az aboutPage = _Translations$aboutPage$az._(_root);
  @override
  late final _Translations$changelogPage$az changelogPage = _Translations$changelogPage$az._(_root);
  @override
  late final _Translations$sanitization$az sanitization = _Translations$sanitization$az._(_root);
}

// Path: general
class _Translations$general$az extends Translations$general$en {
  _Translations$general$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Qəbul et';
  @override
  String get accepted => 'Qəbul edildi';
  @override
  String get add => 'Əlavə et';
  @override
  String get advanced => 'Qabaqcıl';
  @override
  String get cancel => 'Ləğv et';
  @override
  String get close => 'Bağla';
  @override
  String get confirm => 'Təsdiqlə';
  @override
  String get continueStr => 'Davam et';
  @override
  String get copy => 'Köçür';
  @override
  String get copiedToClipboard => 'Məlumat buferinə köçürüldü';
  @override
  String get decline => 'İmtina et';
  @override
  String get done => 'Oldu';
  @override
  String get delete => 'Sil';
  @override
  String get edit => 'Düzəliş et';
  @override
  String get error => 'Xəta';
  @override
  String get example => 'Nümunə';
  @override
  String get files => 'Fayllar';
  @override
  String get finished => 'Bitdi';
  @override
  String get hide => 'Gizlət';
  @override
  String get off => 'Bağlı';
  @override
  String get offline => 'Oflayn';
  @override
  String get on => 'Aktiv';
  @override
  String get online => 'Onlayn';
  @override
  String get open => 'Aç';
  @override
  String get queue => 'Növbə';
  @override
  String get quickSave => 'Cəld yadda saxla';
  @override
  String get quickSaveFromFavorites => '"Sevimlilər" üçün cəld yadda saxla';
  @override
  String get renamed => 'Adı dəyişdirildi';
  @override
  String get reset => 'Dəyişiklikləri geri qaytar';
  @override
  String get restart => 'Yenidən başlat';
  @override
  String get settings => 'Parametrlər';
  @override
  String get skipped => 'Ötürüldü';
  @override
  String get start => 'Başlat';
  @override
  String get stop => 'Dayandır';
  @override
  String get save => 'Yadda saxla';
  @override
  String get unchanged => 'Dəyişdirilməmiş';
  @override
  String get unknown => 'Naməlum';
  @override
  String get noItemInClipboard => 'Məlumat buferində element yoxdur.';
}

// Path: receiveTab
class _Translations$receiveTab$az extends Translations$receiveTab$en {
  _Translations$receiveTab$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Qəbul et';
  @override
  late final _Translations$receiveTab$infoBox$az infoBox = _Translations$receiveTab$infoBox$az._(_root);
  @override
  late final _Translations$receiveTab$quickSave$az quickSave = _Translations$receiveTab$quickSave$az._(_root);
}

// Path: sendTab
class _Translations$sendTab$az extends Translations$sendTab$en {
  _Translations$sendTab$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Göndər';
  @override
  late final _Translations$sendTab$selection$az selection = _Translations$sendTab$selection$az._(_root);
  @override
  late final _Translations$sendTab$picker$az picker = _Translations$sendTab$picker$az._(_root);
  @override
  String get shareIntentInfo => 'Faylları daha rahat seçmək üçün mobil cihazınızın "Paylaş" xüsusiyyətin də istifadə edə bilərsiniz.';
  @override
  String get nearbyDevices => 'Yaxınlıqdakı cihazlar';
  @override
  String get thisDevice => 'Bu Cihaz';
  @override
  String get scan => 'Cihazları axtar';
  @override
  String get manualSending => 'Özünüz göndərin';
  @override
  String get sendMode => 'Göndərmə üsulu';
  @override
  late final _Translations$sendTab$sendModes$az sendModes = _Translations$sendTab$sendModes$az._(_root);
  @override
  String get sendModeHelp => 'İzahat';
  @override
  String get help => 'Xahiş olunur, əmin olun ki, istədiyiniz hədəf eyni Wi-Fi şəbəkəsindədir.';
  @override
  String get placeItems => 'Paylaşmaq üçün elementləri yerləşdir.';
}

// Path: settingsTab
class _Translations$settingsTab$az extends Translations$settingsTab$en {
  _Translations$settingsTab$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tənzimləmələr';
  @override
  late final _Translations$settingsTab$general$az general = _Translations$settingsTab$general$az._(_root);
  @override
  late final _Translations$settingsTab$receive$az receive = _Translations$settingsTab$receive$az._(_root);
  @override
  String get advancedSettings => 'Qabaqcıl parametrlər';
  @override
  late final _Translations$settingsTab$send$az send = _Translations$settingsTab$send$az._(_root);
  @override
  late final _Translations$settingsTab$network$az network = _Translations$settingsTab$network$az._(_root);
  @override
  late final _Translations$settingsTab$other$az other = _Translations$settingsTab$other$az._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$az extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get openFolder => 'Qovluğu aç';
  @override
  String get deleteHistory => 'Tarixçəni sil';
  @override
  String get title => 'Tarixçə';
  @override
  late final _Translations$receiveHistoryPage$entryActions$az entryActions = _Translations$receiveHistoryPage$entryActions$az._(_root);
  @override
  String get empty => 'Tarixçə boşdur.';
}

// Path: dialogs
class _Translations$dialogs$az extends Translations$dialogs$en {
  _Translations$dialogs$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$noFiles$az noFiles = _Translations$dialogs$noFiles$az._(_root);
  @override
  late final _Translations$dialogs$fileInfo$az fileInfo = _Translations$dialogs$fileInfo$az._(_root);
  @override
  late final _Translations$dialogs$qr$az qr = _Translations$dialogs$qr$az._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$az historyClearDialog = _Translations$dialogs$historyClearDialog$az._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$az localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$az._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$az quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$az._(_root);
  @override
  late final _Translations$dialogs$pin$az pin = _Translations$dialogs$pin$az._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$az sendModeHelp = _Translations$dialogs$sendModeHelp$az._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$az favoriteDialog = _Translations$dialogs$favoriteDialog$az._(_root);
  @override
  late final _Translations$dialogs$errorDialog$az errorDialog = _Translations$dialogs$errorDialog$az._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$az favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$az._(_root);
  @override
  late final _Translations$dialogs$addFile$az addFile = _Translations$dialogs$addFile$az._(_root);
  @override
  late final _Translations$dialogs$openFile$az openFile = _Translations$dialogs$openFile$az._(_root);
  @override
  late final _Translations$dialogs$addressInput$az addressInput = _Translations$dialogs$addressInput$az._(_root);
  @override
  late final _Translations$dialogs$cancelSession$az cancelSession = _Translations$dialogs$cancelSession$az._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$az cannotOpenFile = _Translations$dialogs$cannotOpenFile$az._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$az encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$az._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$az favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$az._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$az fileNameInput = _Translations$dialogs$fileNameInput$az._(_root);
  @override
  late final _Translations$dialogs$messageInput$az messageInput = _Translations$dialogs$messageInput$az._(_root);
  @override
  late final _Translations$dialogs$noPermission$az noPermission = _Translations$dialogs$noPermission$az._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$az notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$az._(_root);
  @override
  late final _Translations$dialogs$quickActions$az quickActions = _Translations$dialogs$quickActions$az._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$az quickSaveNotice = _Translations$dialogs$quickSaveNotice$az._(_root);
  @override
  late final _Translations$dialogs$zoom$az zoom = _Translations$dialogs$zoom$az._(_root);
}

// Path: troubleshootPage
class _Translations$troubleshootPage$az extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Problemləri həll etmə';
  @override
  late final _Translations$troubleshootPage$noDiscovery$az noDiscovery = _Translations$troubleshootPage$noDiscovery$az._(_root);
  @override
  String get subTitle => 'Tətbiq gözlənildiyi kimi işləmir? Burada problemlərin ümumi həll yollarını tapa bilərsiniz.';
  @override
  late final _Translations$troubleshootPage$firewall$az firewall = _Translations$troubleshootPage$firewall$az._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$az noConnection = _Translations$troubleshootPage$noConnection$az._(_root);
  @override
  String get solution => 'Həll:';
  @override
  String get fixButton => 'Avtomatik düzəlt';
}

// Path: webSharePage
class _Translations$webSharePage$az extends Translations$webSharePage$en {
  _Translations$webSharePage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get stopping => 'Server dayandırılır…';
  @override
  String pendingRequests({required Object n}) => 'Gözləyən sorğular: ${n}';
  @override
  String get loading => 'Server aktivləşdirilir…';
  @override
  String get error => 'Serveri aktivləşdirərkən xəta baş verdi.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('az'))(
    n,
    one: 'Bu keçidi brauzerdə aç:',
    other: 'Bu keçidlərdən birini brauzerdə aç:',
  );
  @override
  String get title => 'Keçid vasitəsilə paylaş';
  @override
  String get requests => 'Sorğular';
  @override
  String get noRequests => 'Hələ ki, heç bir sorğu yoxdur.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Sorğuları avtomatik qəbul et';
  @override
  String get requirePin => 'PIN tələb et';
  @override
  String pinHint({required Object pin}) => 'Sizin PIN: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend özü imzalanmış sertifikatdan istifadə edir. Siz onu brauzerinizdə qəbul etməlisiniz.';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$az extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'Defolt olaraq, LocalSend bütün mövcud şəbəkə interfeyslərindən istifadə edir. Burada istənilməyən şəbəkələri istisna edə bilərsiniz. Dəyişiklikləri tətbiq etmək üçün serveri yenidən başlatmalısınız.';
  @override
  String get whitelist => 'Ağ siyahı';
  @override
  String get blacklist => 'Qara siyahı';
  @override
  String get title => 'Şəbəkə interfeysləri';
  @override
  String get preview => 'Önizlə';
}

// Path: assetPicker
class _Translations$assetPicker$az extends Translations$assetPicker$en {
  _Translations$assetPicker$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get accessiblePathName => 'Əlçatan fayllar';
  @override
  String get sTypeAudioLabel => 'Audio';
  @override
  String get loadFailed => 'Yükləmə uğursuz oldu';
  @override
  String get accessLimitedAssets => 'Məhdud icazə ilə davam et';
  @override
  String get preview => 'Önizləmə';
  @override
  String get select => 'Seç';
  @override
  String get emptyList => 'Boş siyahı';
  @override
  String get unSupportedAssetType => 'Dəstəklənməyən fayl tipi.';
  @override
  String get unableToAccessAll => 'Cihazdakı bütün fayllara daxil olmaq mümkün deyil';
  @override
  String get viewingLimitedAssetsTip => 'Yalnız proqram üçün əlçatan olan fayl və albomlara bax.';
  @override
  String get confirm => 'Təsdiqlə';
  @override
  String get cancel => 'İmtina';
  @override
  String get edit => 'Düzəliş et';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get original => 'Orijinal';
  @override
  String get changeAccessibleLimitedAssets => 'Əlçatan faylları yeniləmək üçün kliklə';
  @override
  String get accessAllTip =>
      'Tətbiq cihazdakı yalnız bəzi fayllara daxil ola bilər. Sistem parametrlərinə gedin və tətbiqin cihazdakı bütün mediaya daxil olmasına icazə verin.';
  @override
  String get goToSystemSettings => 'Sistem parametrlərinə get';
  @override
  String get sTypeImageLabel => 'Şəkil';
  @override
  String get sTypeVideoLabel => 'Video';
  @override
  String get sTypeOtherLabel => 'Digər media';
  @override
  String get sActionPlayHint => 'aç';
  @override
  String get sActionPreviewHint => 'önizləmə';
  @override
  String get sActionSelectHint => 'seç';
  @override
  String get sActionSwitchPathLabel => 'yolu dəyiş';
  @override
  String get sActionUseCameraHint => 'kamera istifadə et';
  @override
  String get sNameDurationLabel => 'müddət';
  @override
  String get sUnitAssetCountLabel => 'say';
}

// Path: sendPage
class _Translations$sendPage$az extends Translations$sendPage$en {
  _Translations$sendPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get rejected => 'Qəbul edən bu sorğudan imtina etdi.';
  @override
  String get waiting => 'Qarşı tərəfdən cavab gözlənilir…';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Qəbul edən başqa sorğu ilə məşğuldur.';
}

// Path: web
class _Translations$web$az extends Translations$web$en {
  _Translations$web$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get fileName => 'Fayl adı';
  @override
  String get files => 'Fayllar';
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN-i daxil et';
  @override
  String get invalidPin => 'Səhv PIN';
  @override
  String get tooManyAttempts => 'Çoxsaylı cəhd';
  @override
  String get rejected => 'Rədd edildi';
  @override
  String get size => 'Ölçü';
}

// Path: tray
class _Translations$tray$az extends Translations$tray$en {
  _Translations$tray$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get closeWindows => 'Çıxış';
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend-dən çıx';
}

// Path: apkPickerPage
class _Translations$apkPickerPage$az extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String apps({required Object n}) => '${n} tətbiq';
  @override
  String get title => 'Tətbiqlər (APK)';
  @override
  String get excludeSystemApps => 'Sistem tətbiqlərini istisna et';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Açıla bilməyən tətbiqləri istisna et';
}

// Path: receivePage
class _Translations$receivePage$az extends Translations$receivePage$en {
  _Translations$receivePage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get subTitleLink => 'sənə keçid göndərdi:';
  @override
  String get canceled => 'Göndərən bu sorğunu ləğv etdi.';
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('az'))(
    n,
    one: 'sənə fayl göndərmək istəyir',
    other: 'sənə ${n} fayl göndərmək istəyir',
  );
  @override
  String get subTitleMessage => 'sənə mesaj göndərdi:';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$az extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçimlər';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend qovluğu)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Qovluqlar olduğu üçün avtomatik söndürülür.';
}

// Path: progressPage
class _Translations$progressPage$az extends Translations$progressPage$en {
  _Translations$progressPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$az total = _Translations$progressPage$total$az._(_root);
  @override
  String get titleSending => 'Fayllar göndərilir';
  @override
  String get titleReceiving => 'Fayllar qəbul edilir';
  @override
  String get savedToGallery => 'Qalereyada saxlanıldı';
}

// Path: donationPage
class _Translations$donationPage$az extends Translations$donationPage$en {
  _Translations$donationPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'LocalSend pulsuz, açıq mənbəlidir və heç bir reklam yoxdur. Proqramı bəyənirsinizsə, ianə ilə inkişafını dəstəkləyə bilərsiniz.';
  @override
  String get title => 'İanə et';
  @override
  String donate({required Object amount}) => '${amount} ianə et';
  @override
  String get thanks => 'Çox təşəkkür edirəm!';
  @override
  String get restore => 'Satın almaları bərpa et';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$az extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Hamısını sil';
}

// Path: aboutPage
class _Translations$aboutPage$az extends Translations$aboutPage$en {
  _Translations$aboutPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  List<String> get description => [
    'LocalSend internet bağlantısına ehtiyac olmadan lokal şəbəkə üzərindən yaxınlıqdakı cihazlarla faylları və mesajları təhlükəsiz paylaşmağa imkan verən pulsuz, açıq mənbəli proqramdır.',
    'Bu proqram Android, iOS, macOS, Windows və Linux sistemlərində mövcuddur. Bütün yükləmə variantlarını rəsmi saytda tapa bilərsiniz.',
  ];
  @override
  String get author => 'Müəllif';
  @override
  String get contributors => 'Töhfə verənlər';
  @override
  String get title => 'LocalSend haqqında';
  @override
  String get packagers => 'Paketləyənlər';
  @override
  String get translators => 'Tərcüməçilər';
}

// Path: changelogPage
class _Translations$changelogPage$az extends Translations$changelogPage$en {
  _Translations$changelogPage$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Versiya jurnalı';
}

// Path: sanitization
class _Translations$sanitization$az extends Translations$sanitization$en {
  _Translations$sanitization$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Fayl adı boş ola bilməz';
  @override
  String get invalid => 'Fayl adında etibarsız simvollar ola bilməz';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$az extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'Cihazın adı:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$az extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Sevimlilər';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$az extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçim';
  @override
  String files({required Object files}) => 'Fayllar: ${files}';
  @override
  String size({required Object size}) => 'Ölçü: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$az extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Fayl';
  @override
  String get folder => 'Qovluq';
  @override
  String get media => 'Media';
  @override
  String get text => 'Mətn';
  @override
  String get app => 'Tətbiq';
  @override
  String get clipboard => 'Yapışdır';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$az extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Tək qəbul edən';
  @override
  String get multiple => 'Çoxsaylı alıcılar';
  @override
  String get link => 'Keçid vasitəsilə paylaş';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$az extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ümumi';
  @override
  String get brightness => 'Tema';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$az brightnessOptions = _Translations$settingsTab$general$brightnessOptions$az._(
    _root,
  );
  @override
  String get color => 'Rəng';
  @override
  late final _Translations$settingsTab$general$colorOptions$az colorOptions = _Translations$settingsTab$general$colorOptions$az._(_root);
  @override
  String get language => 'Dil';
  @override
  late final _Translations$settingsTab$general$languageOptions$az languageOptions = _Translations$settingsTab$general$languageOptions$az._(_root);
  @override
  String get saveWindowPlacement => 'Çıxdıqdan sonra pəncərə mövqeyini saxla';
  @override
  String get saveWindowPlacementWindows => 'Çıxış sonrası pəncərə mövqeyin saxla';
  @override
  String get minimizeToTray => 'Bağlayanda Sistem Sahəsi/Menyu Cizgisinə kiçilt';
  @override
  String get launchAtStartup => 'Girişdən sonra birbaşa başlat';
  @override
  String get launchMinimized => 'Birbaşa başlat: Gizli başlat';
  @override
  String get showInContextMenu => 'Məzmun menyusunda LocalSend-i göstər';
  @override
  String get animations => 'Animasiyalar';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$az extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Qəbul et';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get autoFinish => 'Avtomatik Bitirmə';
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get destination => 'Qovluqda yadda saxla';
  @override
  String get downloads => '(Yüklənənlər)';
  @override
  String get saveToGallery => 'Medianı qalereyada yadda saxla';
  @override
  String get saveToHistory => 'Tarixçədə yadda saxla';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$az extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Göndər';
  @override
  String get shareViaLinkAutoAccept => '"Keçid vasitəsilə paylaş" rejimində sorğuları avtomatik qəbul et';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$az extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Şəbəkə';
  @override
  String get needRestart => 'Parametrləri tətbiq etmək üçün serveri yenidən başladın!';
  @override
  String get server => 'Server';
  @override
  String get alias => 'Cihazın adı';
  @override
  String get deviceType => 'Cihazın tipi';
  @override
  String get deviceModel => 'Cihazın modeli';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'Axtarışın zaman aşımı';
  @override
  String get useSystemName => 'Sistemin adından istifadə et';
  @override
  String get generateRandomAlias => 'Təsadüfi ad yarat';
  @override
  String portWarning({required Object defaultPort}) =>
      'Fərdi portdan istifadə etdiyiniz üçün başqa cihazlar tərəfindən aşkarlanmaya bilərsiniz. (defolt: ${defaultPort})';
  @override
  String get multicastGroup => 'Multicast ünvanı';
  @override
  String get encryption => 'Şifrələmə';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Fərdi multicast ünvanından istifadə etdiyiniz üçün başqa cihazlar tərəfindən aşkarlanmaya bilərsiniz. (defolt: ${defaultMulticast})';
  @override
  String get network => 'Şəbəkə';
  @override
  late final _Translations$settingsTab$network$networkOptions$az networkOptions = _Translations$settingsTab$network$networkOptions$az._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$az extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Digər';
  @override
  String get support => 'LocalSend-i dəstəklə';
  @override
  String get donate => 'İanə et';
  @override
  String get privacyPolicy => 'Məxfilik siyasəti';
  @override
  String get termsOfUse => 'İstifadə şərtləri';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$az extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get deleteFromHistory => 'Tarixçədən sil';
  @override
  String get open => 'Faylı aç';
  @override
  String get showInFolder => 'Qovluqda göstər';
  @override
  String get info => 'Məlumat';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$az extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Heç bir fayl seçilməyib';
  @override
  String get content => 'Zəhmət olmasa, ən azı bir fayl seçin.';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$az extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get size => 'Ölçüsü:';
  @override
  String get path => 'Yol:';
  @override
  String get sender => 'Göndərən:';
  @override
  String get title => 'Fayl məlumatı';
  @override
  String get fileName => 'Faylın adı:';
  @override
  String get time => 'Vaxt:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$az extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kod';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$az extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Bütün tarixçəni silmək istədiyinizə əminsiniz?';
  @override
  String get title => 'Tarixçəni təmizlə';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$az extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend lokal şəbəkəni skan etmək icazəsi olmadan digər cihazları tapa bilmir. Zəhmət olmasa, parametrlərdən bu icazəni verin.';
  @override
  String get gotoSettings => 'Parametrlər';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$az extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  List<String> get content => [
    'Fayl sorğuları artıq sevimlilər siyahısındakı cihazlardan avtomatik qəbul edəcək.',
    'Xəbərdarlıq! Hal-hazırda bu, tamamilə təhlükəsiz deyil, çünki sevimlilər siyahısındakı istənilən cihazın barmaq izinə sahib olan haker məhdudiyyətsiz sizə fayllar göndərə bilər.',
    'Bununla belə, bu seçim lokal şəbəkədəki bütün istifadəçilərin sizə məhdudiyyətsiz fayllar göndərməsinə icazə verməkdən daha təhlükəsizdir.',
  ];
  @override
  String get title => _root.general.quickSaveFromFavorites;
}

// Path: dialogs.pin
class _Translations$dialogs$pin$az extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN-i daxil et';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$az extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Göndərmə rejimləri';
  @override
  String get single => 'Faylları bir cihaza göndərir. Faylların ötürülməsi başa çatdıqdan sonra seçim silinəcək.';
  @override
  String get multiple => 'Faylları birdən çox cihaza göndərir. Faylların ötürülməsi tamamlandıqdan sonra seçim silinməyəcək.';
  @override
  String get link => 'LocalSend-i quraşdırmamış alıcılar linki brauzerlərində açaraq seçilmiş faylları endirə bilərlər.';
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$az extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get addFavorite => 'Əlavə et';
  @override
  String get title => 'Sevimlilər';
  @override
  String get noFavorites => 'Hələ ki, sevimli cihaz yoxdur.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$az extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$az extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Sevimlilərə əlavə et';
  @override
  String get titleEdit => 'Parametrlər';
  @override
  String get name => 'Cihazın adı';
  @override
  String get auto => '(avtomatik)';
  @override
  String get ip => 'IP ünvan';
  @override
  String get port => 'Port';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$az extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçilmişlərə əlavə et';
  @override
  String get content => 'Nə əlavə etmək istəyirsiniz?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$az extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylı aç';
  @override
  String get content => 'Qəbul edilmiş faylı açmaq istəyirsiniz?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$az extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ünvanı daxil et';
  @override
  String get hashtag => 'Heşteq';
  @override
  String get ip => 'IP ünvan';
  @override
  String get recentlyUsed => 'Son istifadə olunan: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$az extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fayl transferini ləğv et';
  @override
  String get content => 'Siz həqiqətən faylların transferini ləğv etmək istəyirsiniz?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$az extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylı açmaq mümkün olmadı';
  @override
  String content({required Object file}) => '"${file}" faylını açmaq mümkün olmadı. Fayl köçürülmüş, adı dəyişdirilmiş və ya silinmiş ola bilər?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$az extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Şifrələmə deaktiv edilib';
  @override
  String get content =>
      'Əlaqə artıq şifrələnməmiş HTTP protokolu vasitəsilə həyata keçirilir. HTTPS protokolundan istifadə etmək üçün şifrələməni yenidən aktiv edin.';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$az extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sevimlilərdən sil';
  @override
  String content({required Object name}) => 'Həqiqətən də "${name}" cihazını sevimlilərdən silmək istəyirsiniz?';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$az extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylın adını daxil et';
  @override
  String original({required Object original}) => 'Orijinal: ${original}';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$az extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mesaj yaz';
  @override
  String get multiline => 'Çoxsətirli';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$az extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'İcazə yoxdur';
  @override
  String get content => 'Siz lazımi icazələri verməmisiniz. Zəhmət olmasa, parametrlərdə icazə verin.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$az extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mövcud deyil';
  @override
  String get content => 'Bu funksiya sadəcə burada mövcuddur:';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$az extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sürətli hərəkətlər';
  @override
  String get counter => 'Sayğac';
  @override
  String get prefix => 'Prefiks';
  @override
  String get padZero => 'Sıfırlar ilə doldur';
  @override
  String get sortBeforeCount => 'Qabaqcadan əlifba sırası ilə sırala';
  @override
  String get random => 'Təsadüfi';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$az extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Fayl sorğuları artıq avtomatik qəbul ediləcək. Nəzərə alın ki, lokal şəbəkədəki hər kəs sizə fayl göndərə bilər.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$az extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$az extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Zəhmət olmasa, bütün cihazların eyni Wi-Fi şəbəkəsində olduğundan və eyni konfiqurasiyanı (port, multicast ünvanı, şifrələmə) paylaşdığından əmin olun. Hədəf cihazın IP ünvanını əl ilə yazmağı cəhd edə bilərsiniz. Əgər bu işə yararsa, gələcəkdə avtomatik aşkarlanması üçün bu cihazı sevimlilərə əlavə etməyi nəzərdən keçirin.';
  @override
  String get symptom => 'Bu cihaz digər cihazları aşkar edə bilməz.';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$az extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Bu cihaz digər cihazlara fayl göndərə bilər, lakin qəbul edə bilməz.';
  @override
  String solution({required Object port}) =>
      'Bu, çox güman ki, firewall problemidir. Siz ${port} portunda daxil olan bağlantılara (UDP və TCP) icazə verməklə bunu həll edə bilərsiniz.';
  @override
  String get openFirewall => 'Şəbəkə ekranını (firewall) aç';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$az extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Problem hər iki tərəfdə də var? Əgər belədirsə, hər iki cihazın eyni Wi-Fi şəbəkəsində olduğundan və eyni konfiqurasiyanı (port, multicast ünvanı, şifrələmə) paylaşdığından əmin olmalısınız. Wi-Fi şəbəkəsi Access Point (AP) izolyasiyasına görə iştirakçılar arasında ünsiyyətə icazə verməyə bilər. Bu halda, bu seçim ruterdə söndürülməlidir.';
  @override
  String get symptom => 'Hər iki cihaz bir-birini aşkarlaya bilmir və faylları paylaşa bilmir.';
}

// Path: progressPage.total
class _Translations$progressPage$total$az extends Translations$progressPage$total$en {
  _Translations$progressPage$total$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$az title = _Translations$progressPage$total$title$az._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fayl: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Ölçü: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Sürət: ${speed}/s';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$az extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get dark => 'Qaranlıq';
  @override
  String get light => 'İşıqlı';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$az extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$az extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$az extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Hamısı';
  @override
  String get filtered => 'Filtrlənmiş';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$az extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$az._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get canceledSender => 'Göndərən tərəfindən dayandırıldı';
  @override
  String sending({required Object time}) => 'Ümumi proses (${time})';
  @override
  String get finishedError => 'Proses xəta verərək dayandı';
  @override
  String get canceledReceiver => 'Qəbul edən tərəfindən dayandırıldı';
}
