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
class TranslationsMn extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsMn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.mn,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <mn>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsMn _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Mongolian';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralMn general = _TranslationsGeneralMn._(_root);
  @override
  late final _TranslationsReceiveTabMn receiveTab = _TranslationsReceiveTabMn._(_root);
  @override
  late final _TranslationsSendTabMn sendTab = _TranslationsSendTabMn._(_root);
  @override
  late final _TranslationsSettingsTabMn settingsTab = _TranslationsSettingsTabMn._(_root);
  @override
  late final _TranslationsTroubleshootPageMn troubleshootPage = _TranslationsTroubleshootPageMn._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageMn networkInterfacesPage = _TranslationsNetworkInterfacesPageMn._(_root);
  @override
  late final _TranslationsReceiveHistoryPageMn receiveHistoryPage = _TranslationsReceiveHistoryPageMn._(_root);
  @override
  late final _TranslationsApkPickerPageMn apkPickerPage = _TranslationsApkPickerPageMn._(_root);
  @override
  late final _TranslationsSelectedFilesPageMn selectedFilesPage = _TranslationsSelectedFilesPageMn._(_root);
  @override
  late final _TranslationsReceivePageMn receivePage = _TranslationsReceivePageMn._(_root);
  @override
  late final _TranslationsReceiveOptionsPageMn receiveOptionsPage = _TranslationsReceiveOptionsPageMn._(_root);
  @override
  late final _TranslationsSendPageMn sendPage = _TranslationsSendPageMn._(_root);
  @override
  late final _TranslationsProgressPageMn progressPage = _TranslationsProgressPageMn._(_root);
  @override
  late final _TranslationsWebSharePageMn webSharePage = _TranslationsWebSharePageMn._(_root);
  @override
  late final _TranslationsAboutPageMn aboutPage = _TranslationsAboutPageMn._(_root);
  @override
  late final _TranslationsDonationPageMn donationPage = _TranslationsDonationPageMn._(_root);
  @override
  late final _TranslationsChangelogPageMn changelogPage = _TranslationsChangelogPageMn._(_root);
  @override
  late final _TranslationsAliasGeneratorMn aliasGenerator = _TranslationsAliasGeneratorMn._(_root);
  @override
  late final _TranslationsDialogsMn dialogs = _TranslationsDialogsMn._(_root);
  @override
  late final _TranslationsSanitizationMn sanitization = _TranslationsSanitizationMn._(_root);
  @override
  late final _TranslationsTrayMn tray = _TranslationsTrayMn._(_root);
  @override
  late final _TranslationsWebMn web = _TranslationsWebMn._(_root);
  @override
  late final _TranslationsAssetPickerMn assetPicker = _TranslationsAssetPickerMn._(_root);
}

// Path: general
class _TranslationsGeneralMn extends TranslationsGeneralEn {
  _TranslationsGeneralMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Зөвшөөрөх';
  @override
  String get accepted => 'Зөвшөөрсөн';
  @override
  String get add => 'Нэмэх';
  @override
  String get advanced => 'Нэмэлт үйлчилгээ';
  @override
  String get cancel => 'Цуцлах';
  @override
  String get close => 'Хаах';
  @override
  String get confirm => 'Баталгаажуулах';
  @override
  String get continueStr => 'Үргэлжлүүлэх';
  @override
  String get copy => 'Хуулах';
  @override
  String get copiedToClipboard => 'Амжилттай хууллаа';
  @override
  String get decline => 'Татгалзах';
  @override
  String get done => 'Болсон';
  @override
  String get delete => 'Устгах';
  @override
  String get edit => 'Өөрчлөх';
  @override
  String get error => 'Алдаа';
  @override
  String get example => 'Жишээ';
  @override
  String get files => 'Файлууд';
  @override
  String get finished => 'Дууссан';
  @override
  String get hide => 'Нуух';
  @override
  String get off => 'Унтраах';
  @override
  String get offline => 'Оффлайн';
  @override
  String get on => 'Асаах';
  @override
  String get online => 'Онлайн';
  @override
  String get open => 'Нээх';
  @override
  String get queue => 'Хүлээгдэж байгаа';
  @override
  String get quickSave => 'Шууд хадгалах';
  @override
  String get quickSaveFromFavorites => 'Дурласан төхөөрөмжүүдийн жагсаалтаас түргэн хадгалах';
  @override
  String get renamed => 'Дахин нэрлэсэн';
  @override
  String get reset => 'Өөрчлөлтүүдийг буцаах';
  @override
  String get restart => 'Дахин ачаалах';
  @override
  String get settings => 'Тохиргоо';
  @override
  String get skipped => 'Алгассан';
  @override
  String get start => 'Эхлэх';
  @override
  String get stop => 'Зогсоох';
  @override
  String get save => 'Хадгалах';
  @override
  String get unchanged => 'Өөрчлөгдөөгүй';
  @override
  String get unknown => 'Үл мэдэгдэх';
  @override
  String get noItemInClipboard => 'Санах ой хоосон байна.';
}

// Path: receiveTab
class _TranslationsReceiveTabMn extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Авах';
  @override
  late final _TranslationsReceiveTabInfoBoxMn infoBox = _TranslationsReceiveTabInfoBoxMn._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveMn quickSave = _TranslationsReceiveTabQuickSaveMn._(_root);
}

// Path: sendTab
class _TranslationsSendTabMn extends TranslationsSendTabEn {
  _TranslationsSendTabMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх';
  @override
  late final _TranslationsSendTabSelectionMn selection = _TranslationsSendTabSelectionMn._(_root);
  @override
  late final _TranslationsSendTabPickerMn picker = _TranslationsSendTabPickerMn._(_root);
  @override
  String get shareIntentInfo => 'Та өөрийн төхөөрөмжийн "Хуваалцах" цэсийг ашиглан файлуудаа хялбар сонгох боломжтой.';
  @override
  String get nearbyDevices => 'Ойролцоо төхөөрөмжүүд';
  @override
  String get thisDevice => 'Энэ төхөөрөмж';
  @override
  String get scan => 'Төхөөрөмжүүд хайх';
  @override
  String get manualSending => 'Гар аргаар хайх';
  @override
  String get sendMode => 'Илгээх горим';
  @override
  late final _TranslationsSendTabSendModesMn sendModes = _TranslationsSendTabSendModesMn._(_root);
  @override
  String get sendModeHelp => 'Тайлбар';
  @override
  String get help => 'Хүлээн авах төхөөрөмжийг адилхан Wi-Fi сүлжээнд байгаа эсэхийг шалгана уу.';
  @override
  String get placeItems => 'Хуваалцах зүйлсээ орулна уу.';
}

// Path: settingsTab
class _TranslationsSettingsTabMn extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Тохиргоо';
  @override
  late final _TranslationsSettingsTabGeneralMn general = _TranslationsSettingsTabGeneralMn._(_root);
  @override
  late final _TranslationsSettingsTabReceiveMn receive = _TranslationsSettingsTabReceiveMn._(_root);
  @override
  late final _TranslationsSettingsTabSendMn send = _TranslationsSettingsTabSendMn._(_root);
  @override
  late final _TranslationsSettingsTabNetworkMn network = _TranslationsSettingsTabNetworkMn._(_root);
  @override
  late final _TranslationsSettingsTabOtherMn other = _TranslationsSettingsTabOtherMn._(_root);
  @override
  String get advancedSettings => 'Нэмэлт тохиргоо';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageMn extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Асуудал илрүүлэх';
  @override
  String get subTitle => 'Апп нь санаснаар ажиллахгүй байна уу? Эндээс асуудлыг нийтлэг асуудалуудыг олох боломжтой.';
  @override
  String get solution => 'Шийдэл:';
  @override
  String get fixButton => 'Автоматаар засварлах';
  @override
  late final _TranslationsTroubleshootPageFirewallMn firewall = _TranslationsTroubleshootPageFirewallMn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryMn noDiscovery = _TranslationsTroubleshootPageNoDiscoveryMn._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionMn noConnection = _TranslationsTroubleshootPageNoConnectionMn._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageMn extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сүлжээний интерфэйсүүд';
  @override
  String get info =>
      'Анхдагчаар LocalSend нь бүх боломжит сүлжээний интерфэйсүүдийг ашигладаг. Энд та шаардлагагүй сүлжээг хасаж болно. Өөрчлөлтийг хэрэгжүүлэхийн тулд серверийг дахин ачааллах шаардлагатай.';
  @override
  String get preview => 'Урьдчилсан харагдац';
  @override
  String get whitelist => 'Цагаан жагсаалт';
  @override
  String get blacklist => 'Хар жагсаалт';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageMn extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Түүх';
  @override
  String get openFolder => 'Хавтас нээх';
  @override
  String get deleteHistory => 'Түүх устгах';
  @override
  String get empty => 'Түүх хоосон байна.';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsMn entryActions = _TranslationsReceiveHistoryPageEntryActionsMn._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageMn extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Аппууд (APK)';
  @override
  String get excludeSystemApps => 'Системийн аппуудыг хасах';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Нээх боломжгүй аппуудыг хасах';
  @override
  String apps({required Object n}) => '${n} апп';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageMn extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Бүгдийг устгах';
}

// Path: receivePage
class _TranslationsReceivePageMn extends TranslationsReceivePageEn {
  _TranslationsReceivePageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
        n,
        one: 'танруу файл явуулахыг хүсэж байна',
        other: 'танруу ${n} файл явуулахыг хүсэж байна',
      );
  @override
  String get subTitleMessage => 'танруу зурвас илгээлээ:';
  @override
  String get subTitleLink => 'танруу холбоос илгээлээ:';
  @override
  String get canceled => 'Илгээгч хүсэлтийг цуцалсан байна.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageMn extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголтын тохиргоо';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend-н хавтас)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Хавтсууд байгаа учир автоматаар унтраалаа.';
}

// Path: sendPage
class _TranslationsSendPageMn extends TranslationsSendPageEn {
  _TranslationsSendPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Хариу хүлээж байна…';
  @override
  String get rejected => 'Хүлээн авагч хүсэлтйиг татгалзлаа.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Хүлээн авагч өөр хүсэлт авсан тул завгүй байна.';
}

// Path: progressPage
class _TranslationsProgressPageMn extends TranslationsProgressPageEn {
  _TranslationsProgressPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Файлууд илгээж байна';
  @override
  String get titleReceiving => 'Файлыг татаж байна';
  @override
  String get savedToGallery => 'Photos дээр амжилттай хадгаллаа';
  @override
  late final _TranslationsProgressPageTotalMn total = _TranslationsProgressPageTotalMn._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageMn extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Линкээр хуваалцах';
  @override
  String get loading => 'Серверийг эхлүүлж байна…';
  @override
  String get stopping => 'Серверийг зогсоож байна…';
  @override
  String get error => 'Сервер асаахад алдаа гарлаа.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('mn'))(
        n,
        one: 'Энэ холбоосыг browser дээрээ нээнэ үү:',
        other: 'Уг линкийн аль нэгрүү орно уу:',
      );
  @override
  String get requests => 'Хүсэлтүүд';
  @override
  String get noRequests => 'Одоогоор хүсэлт байхгүй байна.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Хүсэлтийг автоматаар авах';
  @override
  String get requirePin => 'PIN код ашиглах';
  @override
  String pinHint({required Object pin}) => 'PIN код: "${pin}"';
  @override
  String get encryptionHint => 'LocalSend нь өөрийн гарын үсэг ашигладаг тул үүнийг browser дээрээ хүлээн зөвшөөрнө үү.';
  @override
  String pendingRequests({required Object n}) => 'Хүлээгдэж буй хүсэлт: ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageMn extends TranslationsAboutPageEn {
  _TranslationsAboutPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend танилцуулга';
  @override
  List<String> get description => [
        'LocalSend нь үнэгүй, нээлттэй эхийн програм бөгөөд танд интернет холболт шаардлагагүйгээр өөрийн дотоод сүлжээгээр ойролцоох төхөөрөмжүүдтэй файл, мессежийг аюулгүйгээр хуваалцах боломтой.',
        'Энэ програмыг Android, iOS, macOS, Windows болон Linux дээр ашиглах боломжтой. Та албан ёсны веб сайтнаас татах боломжтой.',
      ];
  @override
  String get author => 'Эзэмшигч';
  @override
  String get contributors => 'Хамт тусалсан';
  @override
  String get packagers => 'Багцлагчид';
  @override
  String get translators => 'Орчуулагч нар';
}

// Path: donationPage
class _TranslationsDonationPageMn extends TranslationsDonationPageEn {
  _TranslationsDonationPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хандив';
  @override
  String get info =>
      'LocalSend нь үнэ төлбөргүй, нээлттэй эх сурвалжтай бөгөөд ямар ч зар сурталчилгаагүй. Хэрэв энэ програм таалагдсан бол хандивын мөнгөөр хөгжлийг дэмжих боломжтой.';
  @override
  String donate({required Object amount}) => '${amount} аар хандивлах';
  @override
  String get thanks => 'Маш их баярлалаа!';
  @override
  String get restore => 'Буцаах';
}

// Path: changelogPage
class _TranslationsChangelogPageMn extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шинэчлэлт';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorMn extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsMn extends TranslationsDialogsEn {
  _TranslationsDialogsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileMn addFile = _TranslationsDialogsAddFileMn._(_root);
  @override
  late final _TranslationsDialogsOpenFileMn openFile = _TranslationsDialogsOpenFileMn._(_root);
  @override
  late final _TranslationsDialogsAddressInputMn addressInput = _TranslationsDialogsAddressInputMn._(_root);
  @override
  late final _TranslationsDialogsCancelSessionMn cancelSession = _TranslationsDialogsCancelSessionMn._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileMn cannotOpenFile = _TranslationsDialogsCannotOpenFileMn._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeMn encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeMn._(_root);
  @override
  late final _TranslationsDialogsErrorDialogMn errorDialog = _TranslationsDialogsErrorDialogMn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogMn favoriteDialog = _TranslationsDialogsFavoriteDialogMn._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogMn favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogMn._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogMn favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogMn._(_root);
  @override
  late final _TranslationsDialogsFileInfoMn fileInfo = _TranslationsDialogsFileInfoMn._(_root);
  @override
  late final _TranslationsDialogsFileNameInputMn fileNameInput = _TranslationsDialogsFileNameInputMn._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogMn historyClearDialog = _TranslationsDialogsHistoryClearDialogMn._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedMn localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedMn._(_root);
  @override
  late final _TranslationsDialogsMessageInputMn messageInput = _TranslationsDialogsMessageInputMn._(_root);
  @override
  late final _TranslationsDialogsNoFilesMn noFiles = _TranslationsDialogsNoFilesMn._(_root);
  @override
  late final _TranslationsDialogsNoPermissionMn noPermission = _TranslationsDialogsNoPermissionMn._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformMn notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformMn._(_root);
  @override
  late final _TranslationsDialogsQrMn qr = _TranslationsDialogsQrMn._(_root);
  @override
  late final _TranslationsDialogsQuickActionsMn quickActions = _TranslationsDialogsQuickActionsMn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeMn quickSaveNotice = _TranslationsDialogsQuickSaveNoticeMn._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeMn quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeMn._(_root);
  @override
  late final _TranslationsDialogsPinMn pin = _TranslationsDialogsPinMn._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpMn sendModeHelp = _TranslationsDialogsSendModeHelpMn._(_root);
  @override
  late final _TranslationsDialogsZoomMn zoom = _TranslationsDialogsZoomMn._(_root);
}

// Path: sanitization
class _TranslationsSanitizationMn extends TranslationsSanitizationEn {
  _TranslationsSanitizationMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Файлын нэр хоосон байж болохгүй';
  @override
  String get invalid => 'Файлын нэрд хууль бус тэмдэгт орсон байна';
}

// Path: tray
class _TranslationsTrayMn extends TranslationsTrayEn {
  _TranslationsTrayMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend-ыг хаах';
  @override
  String get closeWindows => 'Гарах';
}

// Path: web
class _TranslationsWebMn extends TranslationsWebEn {
  _TranslationsWebMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN код оруулах';
  @override
  String get invalidPin => 'Хүчин төгөлдөр бус PIN';
  @override
  String get tooManyAttempts => 'Оролдлогын хязгаар хэтэрсэн';
  @override
  String get rejected => 'Татгалзсан';
  @override
  String get files => 'Файлууд';
  @override
  String get fileName => 'Файлын нэр';
  @override
  String get size => 'Хэмжээ';
}

// Path: assetPicker
class _TranslationsAssetPickerMn extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Батлах';
  @override
  String get cancel => 'Цуцлах';
  @override
  String get edit => 'Засах';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Ачааллахад алдаа гарлаа';
  @override
  String get original => 'Эх';
  @override
  String get preview => 'Урьдчилсан харагдац';
  @override
  String get select => 'Сонгох';
  @override
  String get emptyList => 'Жагсаалт хоосон';
  @override
  String get unSupportedAssetType => 'Дэмжигдээгүй файл төрлөөс.';
  @override
  String get unableToAccessAll => 'Төхөөрөмж дээрх бүх файлд хандаж чадахгүй байна';
  @override
  String get viewingLimitedAssetsTip => 'Программд хандах боломжтой файлууд болон цомгуудыг л харж байна.';
  @override
  String get changeAccessibleLimitedAssets => 'Хандах боломжтой файлуудыг шинэчлэхийн тулд товшино уу';
  @override
  String get accessAllTip =>
      'Программ нь төхөөрөмж дээрх зарим файлуудад л хандаж чадна. Системийн тохиргоо руу орж бүх мультимедиа файлуудыг хандах эрх олгоно уу.';
  @override
  String get goToSystemSettings => 'Системийн тохиргоо руу орох';
  @override
  String get accessLimitedAssets => 'Хязгаарлагдмал хандалттай үргэлжлүүлэх';
  @override
  String get accessiblePathName => 'Хандах боломжтой файлууд';
  @override
  String get sTypeAudioLabel => 'Аудио';
  @override
  String get sTypeImageLabel => 'Зураг';
  @override
  String get sTypeVideoLabel => 'Видео';
  @override
  String get sTypeOtherLabel => 'Бусад мультимедиа';
  @override
  String get sActionPlayHint => 'Тоглуулах';
  @override
  String get sActionPreviewHint => 'Урьдчилсан харах';
  @override
  String get sActionSelectHint => 'Сонгох';
  @override
  String get sActionSwitchPathLabel => 'Замыг солих';
  @override
  String get sActionUseCameraHint => 'Камер ашиглах';
  @override
  String get sNameDurationLabel => 'Үргэлжилэх хугацаа';
  @override
  String get sUnitAssetCountLabel => 'Тоо';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxMn extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP хаяг:';
  @override
  String get port => 'Порт:';
  @override
  String get alias => 'Төхөөрөмжийн нэр:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveMn extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Хадгалсан';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionMn extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголт';
  @override
  String files({required Object files}) => 'Файлууд: ${files}';
  @override
  String size({required Object size}) => 'Хэмжээ: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerMn extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Файл';
  @override
  String get folder => 'Хавтас';
  @override
  String get media => 'Медиа';
  @override
  String get text => 'Бичвэр';
  @override
  String get app => 'Апп';
  @override
  String get clipboard => 'Санах ойгоос буулгах';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesMn extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Ганц хүлээн авагч';
  @override
  String get multiple => 'Олон хүлээн авагч';
  @override
  String get link => 'Холбоосоор хуваалцах';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralMn extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ерөнхий';
  @override
  String get brightness => 'Үзэмж';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsMn brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsMn._(_root);
  @override
  String get color => 'Өнгө';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsMn colorOptions = _TranslationsSettingsTabGeneralColorOptionsMn._(_root);
  @override
  String get language => 'Хэл';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsMn languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsMn._(_root);
  @override
  String get saveWindowPlacement => 'Гарсаны дараа цонхны байрлал хадгалах';
  @override
  String get saveWindowPlacementWindows => 'Гарсаны дараа цонхны байрлал хадгалах';
  @override
  String get minimizeToTray => 'Цонх хаах үед програмыг нуух';
  @override
  String get launchAtStartup => 'Нэвтрэх үед хамт нээх';
  @override
  String get launchMinimized => 'Авто эхлүүлэх: Нуугдсан эхлэх';
  @override
  String get showInContextMenu => 'Системийн цэсэнд LocalSend-д харуулах';
  @override
  String get animations => 'Анимэйшн';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveMn extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Авах';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Авто-дуусгах';
  @override
  String get destination => 'Хавтаст хадгалах';
  @override
  String get downloads => '(Татсан файлууд)';
  @override
  String get saveToGallery => 'Зургийн санд хадгалах';
  @override
  String get saveToHistory => 'Түүхэнд хадгалах';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendMn extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх';
  @override
  String get shareViaLinkAutoAccept => '"Холбоосоор илгээх" горимын хүсэлтүүдийн шууд зөвшөөрөх';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkMn extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сүлжээ';
  @override
  String get needRestart => 'Серверийг дахин ачаалж тохиргоог идэвхжүүлнэ үү!';
  @override
  String get server => 'Сервер';
  @override
  String get alias => 'Төхөөрөмжийн нэр';
  @override
  String get deviceType => 'Төхөөрөмжийн төрөл';
  @override
  String get deviceModel => 'Төхөөрөмжийг модел';
  @override
  String get port => 'Порт';
  @override
  String get network => 'Сүлжээ';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsMn networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsMn._(_root);
  @override
  String get discoveryTimeout => 'Хайх хүчинтэй хугацаа';
  @override
  String get useSystemName => 'Системийн нэр ашиглах';
  @override
  String get generateRandomAlias => 'Санамсаргүй нэр үүсгэх';
  @override
  String portWarning({required Object defaultPort}) =>
      'Та өөр порт ашиглаж байгаа тул бусад төхөөрөмжинд олдохгүй байж магадгүй . (өгөгдмөл: ${defaultPort})';
  @override
  String get encryption => 'Нууцлал';
  @override
  String get multicastGroup => 'Мультикаст хаяг';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Хувийн multicast хаяг ашиглаж үед бусад төхөөрөмжид илрэхгүй байх магадлалтай. (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherMn extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Бусад';
  @override
  String get support => 'LocalSend-г дэмжих';
  @override
  String get donate => 'Хандив өгөх';
  @override
  String get privacyPolicy => 'Нууцлалын бодлого';
  @override
  String get termsOfUse => 'Ашиглах нөхцөл';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallMn extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Энэ төрөөрөмж бусадруу файл илгээж чадаж байгаа ч бусад төхөөрөмж энэ төхөөрөмжрүү илгээж чадахгүй байна.';
  @override
  String solution({required Object port}) =>
      'Энэ нь ихэвчлэн firewall-н асуудл байдаг. Та ${port} дээр ирж буй холболтыг (UDP ба TCP) зөвшөөрч шийдвэрлэх боломжтой.';
  @override
  String get openFirewall => 'Firewall-г нээх';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryMn extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Энэ төхөөрөмж бусад төхөөрөмжийг илрүүлж чадахгүй байна.';
  @override
  String get solution =>
      'Бүх төхөөрөмж адилхан Wi-Fi сүлжээнд орсон, адилхан тохиргоотой (порт, мультикаст хаяг, нууцлал) эсэхийг шалгана уу. Мөн төхөөрөмжийн IP хаягийг гараар оруулж үзнэ үү. Хэрэв болж байвал тухайн төхөөрөмжийг "Хадгалсан" хэсэгт нэмж дараа нь автоматаар таниулаарай.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionMn extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Төхөөрөмжүүд бие биенийгээ танихгүй, файл хуваалцаж чадахгүй байна.';
  @override
  String get solution =>
      'Хоёр талдаа ажиллахгүй байна уу? Хэрэв тийм бол хоёр төхөөрөмж ижил Wi-Fi сүлжээнд байгаа эсэхийг эсвэл ижил тохиргоотой (порт, multicast хаяг, шифрлэлт) байгаа эсэхийг шалгана уу. Wi-Fi сүлжээ эсвэл Acess Point (AP) төхөөрөмж хоорондын харилцааг хаасан байж магадгүй. Энэ тохиолдолд Wi-Fi төхөөрөмжийн тохиргоог өөрчлөнө үү.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsMn extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Файл нээх';
  @override
  String get showInFolder => 'Хавтаст харуулах';
  @override
  String get info => 'Мэдээлэл';
  @override
  String get deleteFromHistory => 'Түүхээс устгах';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalMn extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleMn title = _TranslationsProgressPageTotalTitleMn._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Файл: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Хэмжээ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Хурд: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileMn extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Сонголтод нэмэх';
  @override
  String get content => 'Юуг нэмэх вэ?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileMn extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлыг нээх';
  @override
  String get content => 'Хүлээн авсан файлыг нээх үү?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputMn extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хаяг оруулах';
  @override
  String get hashtag => 'Хэштэг';
  @override
  String get ip => 'IP хаяг';
  @override
  String get recentlyUsed => 'Саяхан ашигласан: ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionMn extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлын дамжуулалтыг цуцлах';
  @override
  String get content => 'Та үнэхээр файлын дамжуулалтыг цуцлах уу?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileMn extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл нээж чадахгүй';
  @override
  String content({required Object file}) =>
      '"${file}" файлыг нээж чадаагүй. Энэ файл шилжүүлэгдсэн, нэр өөрчлөгдсөн эсвэл устгагдсан эсэхийг шалгана уу.';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeMn extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Шифрлэлт идэвхгүй';
  @override
  String get content => 'Харилцаа одоо шифрлэгдээгүй HTTP протоколоор явагдаж байна. HTTPS протокол ашиглахын тулд шифрлэлтээ дахин идэвхжүүлнэ үү.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogMn extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogMn extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дуртай төхөөрөмжүүд';
  @override
  String get noFavorites => 'Одоогоор дуртай төхөөрөмжүүд алга байна.';
  @override
  String get addFavorite => 'Нэмэх';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogMn extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Дуртайгаасаа устгах';
  @override
  String content({required Object name}) => 'Та үнэхээр "${name}"-ийг дуртайгаасаа устгах уу?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogMn extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Дуртайдаа нэмэх';
  @override
  String get titleEdit => 'Тохиргоо';
  @override
  String get name => 'Төхөөрөмжийн нэр';
  @override
  String get auto => '(авто)';
  @override
  String get ip => 'IP хаяг';
  @override
  String get port => 'Порт';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoMn extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файл мэдээлэл';
  @override
  String get fileName => 'Файлын нэр:';
  @override
  String get path => 'Зам:';
  @override
  String get size => 'Хэмжээ:';
  @override
  String get sender => 'Илгээгч:';
  @override
  String get time => 'Цаг:';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputMn extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлын нэр оруулах';
  @override
  String original({required Object original}) => 'Анхны: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogMn extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Түүхийг арилгах';
  @override
  String get content => 'Та үнэхээр бүх түүхийг устгах уу?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedMn extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'LocalSend нь локал сүлжээг скан хийх зөвшөөрөлгүй учраас бусад төхөөрөмжийг олж чадахгүй байна. Зөвшөөрлийг тохиргоонд өгнө үү.';
  @override
  String get gotoSettings => 'Тохиргоо';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputMn extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Мессеж бичих';
  @override
  String get multiline => 'Олон мөрт';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesMn extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Файлууд сонгогдоогүй';
  @override
  String get content => 'Дор хаяж нэг файлыг сонгоно уу.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionMn extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Зөвшөөрөл байхгүй';
  @override
  String get content => 'Танд шаардлагатай зөвшөөрөл олгогдоогүй байна. Тохиргооноос зөвшөөрөл олгоно уу.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformMn extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Боломжгүй';
  @override
  String get content => 'Энэ функц дараах платформ дээр л боломжтой:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrMn extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR код';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsMn extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Хурдан үйлдлүүд';
  @override
  String get counter => 'Тоо';
  @override
  String get prefix => 'Өгүүлэмж';
  @override
  String get padZero => 'Тэгээр нөхөх';
  @override
  String get sortBeforeCount => 'Тоогоор эрэмблэхээс өмнө (A-Z)';
  @override
  String get random => 'Санамсаргүй';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeMn extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content =>
      'Файл илгээх хүсэлтүүд одоо автоматаар хүлээн авна. Локал сүлжээнд байгаа бүх хүн танд файл илгээх боломжтой гэдгийг анхаарна уу.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeMn extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
        'Дуртай төхөөрөмжүүдийн жагсаалтад байгаа төхөөрөмжүүдээс ирсэн файл илгээх хүсэлтүүд одоо автоматаар хүлээн авна.',
        'Анхаар! Одоогоор энэ нь бүрэн найдвартай биш байна, учир нь дуртай төхөөрөмжүүдийн жагсаалтад байгаа аливаа төхөөрөмжийн хуруу мөрийн мэдээллийг эзэмшсэн халдагч хязгааргүй файл илгээх боломжтой.',
        'Гэсэн хэдий ч энэ сонголт нь локал сүлжээнд байгаа бүх хэрэглэгчдэд хязгааргүй файл илгээхийг зөвшөөрөхөөс илүү аюулгүй хэвээр байна.',
      ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinMn extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN код оруулах';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpMn extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Илгээх горимууд';
  @override
  String get single => 'Файлуудыг ганц хүлээн авагчид илгээнэ. Дамжуулалт дуусах үед сонголт автоматаар арилна.';
  @override
  String get multiple => 'Файлуудыг хэд хэдэн хүлээн авагчдад илгээнэ. Дамжуулалт дууссаны дараа сонголт устахгүй.';
  @override
  String get link => 'LocalSend суулгагдаагүй хүлээн авагчид холбоосыг нээж сонгосон файлуудыг браузераар татаж авах боломжтой.';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomMn extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsMn extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get dark => 'Харанхуй';
  @override
  String get light => 'Гэгээлэг';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsMn extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsMn extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Систем';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsMn extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Бүгд';
  @override
  String get filtered => 'Шүүсэн';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleMn extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleMn._(TranslationsMn root)
      : this._root = root,
        super.internal(root);

  final TranslationsMn _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Нийт хугацаа (${time})';
  @override
  String get finishedError => 'Амжилтгүй болсон';
  @override
  String get canceledSender => 'Явуулж байгаа хүн цуцаллаа';
  @override
  String get canceledReceiver => 'Хүлээн авагчийн хүсэлтээр цуцалсан';
}
