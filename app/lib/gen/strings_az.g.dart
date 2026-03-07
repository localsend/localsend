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
class TranslationsAz extends Translations {
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
  late final _TranslationsGeneralAz general = _TranslationsGeneralAz._(_root);
  @override
  late final _TranslationsReceiveTabAz receiveTab = _TranslationsReceiveTabAz._(_root);
  @override
  late final _TranslationsSendTabAz sendTab = _TranslationsSendTabAz._(_root);
  @override
  late final _TranslationsSettingsTabAz settingsTab = _TranslationsSettingsTabAz._(_root);
  @override
  late final _TranslationsReceiveHistoryPageAz receiveHistoryPage = _TranslationsReceiveHistoryPageAz._(_root);
  @override
  late final _TranslationsDialogsAz dialogs = _TranslationsDialogsAz._(_root);
  @override
  late final _TranslationsTroubleshootPageAz troubleshootPage = _TranslationsTroubleshootPageAz._(_root);
  @override
  late final _TranslationsWebSharePageAz webSharePage = _TranslationsWebSharePageAz._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageAz networkInterfacesPage = _TranslationsNetworkInterfacesPageAz._(_root);
  @override
  late final _TranslationsAssetPickerAz assetPicker = _TranslationsAssetPickerAz._(_root);
  @override
  late final _TranslationsSendPageAz sendPage = _TranslationsSendPageAz._(_root);
  @override
  late final _TranslationsWebAz web = _TranslationsWebAz._(_root);
  @override
  late final _TranslationsTrayAz tray = _TranslationsTrayAz._(_root);
  @override
  late final _TranslationsApkPickerPageAz apkPickerPage = _TranslationsApkPickerPageAz._(_root);
  @override
  late final _TranslationsReceivePageAz receivePage = _TranslationsReceivePageAz._(_root);
  @override
  late final _TranslationsReceiveOptionsPageAz receiveOptionsPage = _TranslationsReceiveOptionsPageAz._(_root);
  @override
  late final _TranslationsProgressPageAz progressPage = _TranslationsProgressPageAz._(_root);
  @override
  late final _TranslationsDonationPageAz donationPage = _TranslationsDonationPageAz._(_root);
  @override
  late final _TranslationsSelectedFilesPageAz selectedFilesPage = _TranslationsSelectedFilesPageAz._(_root);
  @override
  late final _TranslationsAboutPageAz aboutPage = _TranslationsAboutPageAz._(_root);
  @override
  late final _TranslationsChangelogPageAz changelogPage = _TranslationsChangelogPageAz._(_root);
  @override
  late final _TranslationsSanitizationAz sanitization = _TranslationsSanitizationAz._(_root);
}

// Path: general
class _TranslationsGeneralAz extends TranslationsGeneralEn {
  _TranslationsGeneralAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabAz extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Qəbul et';
  @override
  late final _TranslationsReceiveTabInfoBoxAz infoBox = _TranslationsReceiveTabInfoBoxAz._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveAz quickSave = _TranslationsReceiveTabQuickSaveAz._(_root);
}

// Path: sendTab
class _TranslationsSendTabAz extends TranslationsSendTabEn {
  _TranslationsSendTabAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Göndər';
  @override
  late final _TranslationsSendTabSelectionAz selection = _TranslationsSendTabSelectionAz._(_root);
  @override
  late final _TranslationsSendTabPickerAz picker = _TranslationsSendTabPickerAz._(_root);
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
  late final _TranslationsSendTabSendModesAz sendModes = _TranslationsSendTabSendModesAz._(_root);
  @override
  String get sendModeHelp => 'İzahat';
  @override
  String get help => 'Xahiş olunur, əmin olun ki, istədiyiniz hədəf eyni Wi-Fi şəbəkəsindədir.';
  @override
  String get placeItems => 'Paylaşmaq üçün elementləri yerləşdir.';
}

// Path: settingsTab
class _TranslationsSettingsTabAz extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Tənzimləmələr';
  @override
  late final _TranslationsSettingsTabGeneralAz general = _TranslationsSettingsTabGeneralAz._(_root);
  @override
  late final _TranslationsSettingsTabReceiveAz receive = _TranslationsSettingsTabReceiveAz._(_root);
  @override
  String get advancedSettings => 'Qabaqcıl parametrlər';
  @override
  late final _TranslationsSettingsTabSendAz send = _TranslationsSettingsTabSendAz._(_root);
  @override
  late final _TranslationsSettingsTabNetworkAz network = _TranslationsSettingsTabNetworkAz._(_root);
  @override
  late final _TranslationsSettingsTabOtherAz other = _TranslationsSettingsTabOtherAz._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageAz extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get openFolder => 'Qovluğu aç';
  @override
  String get deleteHistory => 'Tarixçəni sil';
  @override
  String get title => 'Tarixçə';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsAz entryActions = _TranslationsReceiveHistoryPageEntryActionsAz._(_root);
  @override
  String get empty => 'Tarixçə boşdur.';
}

// Path: dialogs
class _TranslationsDialogsAz extends TranslationsDialogsEn {
  _TranslationsDialogsAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsNoFilesAz noFiles = _TranslationsDialogsNoFilesAz._(_root);
  @override
  late final _TranslationsDialogsFileInfoAz fileInfo = _TranslationsDialogsFileInfoAz._(_root);
  @override
  late final _TranslationsDialogsQrAz qr = _TranslationsDialogsQrAz._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogAz historyClearDialog = _TranslationsDialogsHistoryClearDialogAz._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedAz localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedAz._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeAz quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeAz._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinAz pin = _TranslationsDialogsPinAz._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpAz sendModeHelp = _TranslationsDialogsSendModeHelpAz._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogAz favoriteDialog = _TranslationsDialogsFavoriteDialogAz._(_root);
  @override
  late final _TranslationsDialogsErrorDialogAz errorDialog = _TranslationsDialogsErrorDialogAz._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogAz favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogAz._(_root);
  @override
  late final _TranslationsDialogsAddFileAz addFile = _TranslationsDialogsAddFileAz._(_root);
  @override
  late final _TranslationsDialogsOpenFileAz openFile = _TranslationsDialogsOpenFileAz._(_root);
  @override
  late final _TranslationsDialogsAddressInputAz addressInput = _TranslationsDialogsAddressInputAz._(_root);
  @override
  late final _TranslationsDialogsCancelSessionAz cancelSession = _TranslationsDialogsCancelSessionAz._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileAz cannotOpenFile = _TranslationsDialogsCannotOpenFileAz._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeAz encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeAz._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogAz favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogAz._(_root);
  @override
  late final _TranslationsDialogsFileNameInputAz fileNameInput = _TranslationsDialogsFileNameInputAz._(_root);
  @override
  late final _TranslationsDialogsMessageInputAz messageInput = _TranslationsDialogsMessageInputAz._(_root);
  @override
  late final _TranslationsDialogsNoPermissionAz noPermission = _TranslationsDialogsNoPermissionAz._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformAz notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformAz._(_root);
  @override
  late final _TranslationsDialogsQuickActionsAz quickActions = _TranslationsDialogsQuickActionsAz._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeAz quickSaveNotice = _TranslationsDialogsQuickSaveNoticeAz._(_root);
  @override
  late final _TranslationsDialogsZoomAz zoom = _TranslationsDialogsZoomAz._(_root);
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageAz extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Problemləri həll etmə';
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryAz noDiscovery = _TranslationsTroubleshootPageNoDiscoveryAz._(_root);
  @override
  String get subTitle => 'Tətbiq gözlənildiyi kimi işləmir? Burada problemlərin ümumi həll yollarını tapa bilərsiniz.';
  @override
  late final _TranslationsTroubleshootPageFirewallAz firewall = _TranslationsTroubleshootPageFirewallAz._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionAz noConnection = _TranslationsTroubleshootPageNoConnectionAz._(_root);
  @override
  String get solution => 'Həll:';
  @override
  String get fixButton => 'Avtomatik düzəlt';
}

// Path: webSharePage
class _TranslationsWebSharePageAz extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsNetworkInterfacesPageAz extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerAz extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageAz extends TranslationsSendPageEn {
  _TranslationsSendPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsWebAz extends TranslationsWebEn {
  _TranslationsWebAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsTrayAz extends TranslationsTrayEn {
  _TranslationsTrayAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsApkPickerPageAz extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsReceivePageAz extends TranslationsReceivePageEn {
  _TranslationsReceivePageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveOptionsPageAz extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageAz extends TranslationsProgressPageEn {
  _TranslationsProgressPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalAz total = _TranslationsProgressPageTotalAz._(_root);
  @override
  String get titleSending => 'Fayllar göndərilir';
  @override
  String get titleReceiving => 'Fayllar qəbul edilir';
  @override
  String get savedToGallery => 'Qalereyada saxlanıldı';
}

// Path: donationPage
class _TranslationsDonationPageAz extends TranslationsDonationPageEn {
  _TranslationsDonationPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageAz extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Hamısını sil';
}

// Path: aboutPage
class _TranslationsAboutPageAz extends TranslationsAboutPageEn {
  _TranslationsAboutPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageAz extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Versiya jurnalı';
}

// Path: sanitization
class _TranslationsSanitizationAz extends TranslationsSanitizationEn {
  _TranslationsSanitizationAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Fayl adı boş ola bilməz';
  @override
  String get invalid => 'Fayl adında etibarsız simvollar ola bilməz';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxAz extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveAz extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionAz extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerAz extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesAz extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralAz extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ümumi';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsAz brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsAz._(_root);
  @override
  String get color => 'Rəng';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsAz colorOptions = _TranslationsSettingsTabGeneralColorOptionsAz._(_root);
  @override
  String get language => 'Dil';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsAz languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsAz._(_root);
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
class _TranslationsSettingsTabReceiveAz extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendAz extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Göndər';
  @override
  String get shareViaLinkAutoAccept => '"Keçid vasitəsilə paylaş" rejimində sorğuları avtomatik qəbul et';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkAz extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
  late final _TranslationsSettingsTabNetworkNetworkOptionsAz networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsAz._(_root);
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherAz extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveHistoryPageEntryActionsAz extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsNoFilesAz extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Heç bir fayl seçilməyib';
  @override
  String get content => 'Zəhmət olmasa, ən azı bir fayl seçin.';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoAz extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQrAz extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR-kod';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogAz extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get content => 'Bütün tarixçəni silmək istədiyinizə əminsiniz?';
  @override
  String get title => 'Tarixçəni təmizlə';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedAz extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveFromFavoritesNoticeAz extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinAz extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN-i daxil et';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpAz extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDialogAz extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsErrorDialogAz extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogAz extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsAddFileAz extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Seçilmişlərə əlavə et';
  @override
  String get content => 'Nə əlavə etmək istəyirsiniz?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileAz extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylı aç';
  @override
  String get content => 'Qəbul edilmiş faylı açmaq istəyirsiniz?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputAz extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionAz extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Fayl transferini ləğv et';
  @override
  String get content => 'Siz həqiqətən faylların transferini ləğv etmək istəyirsiniz?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileAz extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylı açmaq mümkün olmadı';
  @override
  String content({required Object file}) => '"${file}" faylını açmaq mümkün olmadı. Fayl köçürülmüş, adı dəyişdirilmiş və ya silinmiş ola bilər?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeAz extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Şifrələmə deaktiv edilib';
  @override
  String get content =>
      'Əlaqə artıq şifrələnməmiş HTTP protokolu vasitəsilə həyata keçirilir. HTTPS protokolundan istifadə etmək üçün şifrələməni yenidən aktiv edin.';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogAz extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sevimlilərdən sil';
  @override
  String content({required Object name}) => 'Həqiqətən də "${name}" cihazını sevimlilərdən silmək istəyirsiniz?';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputAz extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Faylın adını daxil et';
  @override
  String original({required Object original}) => 'Orijinal: ${original}';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputAz extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mesaj yaz';
  @override
  String get multiline => 'Çoxsətirli';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionAz extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'İcazə yoxdur';
  @override
  String get content => 'Siz lazımi icazələri verməmisiniz. Zəhmət olmasa, parametrlərdə icazə verin.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformAz extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mövcud deyil';
  @override
  String get content => 'Bu funksiya sadəcə burada mövcuddur:';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsAz extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeAz extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Fayl sorğuları artıq avtomatik qəbul ediləcək. Nəzərə alın ki, lokal şəbəkədəki hər kəs sizə fayl göndərə bilər.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomAz extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryAz extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Zəhmət olmasa, bütün cihazların eyni Wi-Fi şəbəkəsində olduğundan və eyni konfiqurasiyanı (port, multicast ünvanı, şifrələmə) paylaşdığından əmin olun. Hədəf cihazın IP ünvanını əl ilə yazmağı cəhd edə bilərsiniz. Əgər bu işə yararsa, gələcəkdə avtomatik aşkarlanması üçün bu cihazı sevimlilərə əlavə etməyi nəzərdən keçirin.';
  @override
  String get symptom => 'Bu cihaz digər cihazları aşkar edə bilməz.';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallAz extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageNoConnectionAz extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get solution =>
      'Problem hər iki tərəfdə də var? Əgər belədirsə, hər iki cihazın eyni Wi-Fi şəbəkəsində olduğundan və eyni konfiqurasiyanı (port, multicast ünvanı, şifrələmə) paylaşdığından əmin olmalısınız. Wi-Fi şəbəkəsi Access Point (AP) izolyasiyasına görə iştirakçılar arasında ünsiyyətə icazə verməyə bilər. Bu halda, bu seçim ruterdə söndürülməlidir.';
  @override
  String get symptom => 'Hər iki cihaz bir-birini aşkarlaya bilmir və faylları paylaşa bilmir.';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalAz extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleAz title = _TranslationsProgressPageTotalTitleAz._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Fayl: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Ölçü: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Sürət: ${speed}/s';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsAz extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsAz extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsAz extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistem';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsAz extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsAz._(TranslationsAz root) : this._root = root, super.internal(root);

  final TranslationsAz _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Hamısı';
  @override
  String get filtered => 'Filtrlənmiş';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleAz extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleAz._(TranslationsAz root) : this._root = root, super.internal(root);

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
