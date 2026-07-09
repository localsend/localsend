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
class TranslationsSi extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSi({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.si,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <si>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsSi _root = this; // ignore: unused_field

  @override
  TranslationsSi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSi(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'සිංහල';
  @override
  String get appName => 'LocalSend';
  @override
  late final _Translations$general$si general = _Translations$general$si._(_root);
  @override
  late final _Translations$receiveTab$si receiveTab = _Translations$receiveTab$si._(_root);
  @override
  late final _Translations$sendTab$si sendTab = _Translations$sendTab$si._(_root);
  @override
  late final _Translations$settingsTab$si settingsTab = _Translations$settingsTab$si._(_root);
  @override
  late final _Translations$troubleshootPage$si troubleshootPage = _Translations$troubleshootPage$si._(_root);
  @override
  late final _Translations$receiveHistoryPage$si receiveHistoryPage = _Translations$receiveHistoryPage$si._(_root);
  @override
  late final _Translations$apkPickerPage$si apkPickerPage = _Translations$apkPickerPage$si._(_root);
  @override
  late final _Translations$selectedFilesPage$si selectedFilesPage = _Translations$selectedFilesPage$si._(_root);
  @override
  late final _Translations$receivePage$si receivePage = _Translations$receivePage$si._(_root);
  @override
  late final _Translations$receiveOptionsPage$si receiveOptionsPage = _Translations$receiveOptionsPage$si._(_root);
  @override
  late final _Translations$sendPage$si sendPage = _Translations$sendPage$si._(_root);
  @override
  late final _Translations$progressPage$si progressPage = _Translations$progressPage$si._(_root);
  @override
  late final _Translations$webSharePage$si webSharePage = _Translations$webSharePage$si._(_root);
  @override
  late final _Translations$aboutPage$si aboutPage = _Translations$aboutPage$si._(_root);
  @override
  late final _Translations$donationPage$si donationPage = _Translations$donationPage$si._(_root);
  @override
  late final _Translations$changelogPage$si changelogPage = _Translations$changelogPage$si._(_root);
  @override
  late final _Translations$dialogs$si dialogs = _Translations$dialogs$si._(_root);
  @override
  late final _Translations$sanitization$si sanitization = _Translations$sanitization$si._(_root);
  @override
  late final _Translations$tray$si tray = _Translations$tray$si._(_root);
  @override
  late final _Translations$web$si web = _Translations$web$si._(_root);
  @override
  late final _Translations$assetPicker$si assetPicker = _Translations$assetPicker$si._(_root);
  @override
  late final _Translations$networkInterfacesPage$si networkInterfacesPage = _Translations$networkInterfacesPage$si._(_root);
}

// Path: general
class _Translations$general$si extends Translations$general$en {
  _Translations$general$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'පිළිගන්න';
  @override
  String get accepted => 'පිළිගත්';
  @override
  String get add => 'ඇඩ් කරන්න';
  @override
  String get advanced => 'ගැඹුරු';
  @override
  String get cancel => 'අවලංගු කරන්න';
  @override
  String get close => 'වසා දමන්න';
  @override
  String get confirm => 'තහවුරු කරන්න';
  @override
  String get continueStr => 'ඉදිරියට';
  @override
  String get copy => 'කොපි කරන්න';
  @override
  String get copiedToClipboard => 'Clipboard වෙත කොපි කරන ලදි';
  @override
  String get decline => 'ප්‍රතික්ෂේප කරන්න';
  @override
  String get done => 'සම්පූර්ණයි';
  @override
  String get delete => 'මකන්න';
  @override
  String get edit => 'සංස්කරණය';
  @override
  String get error => 'දෝෂය';
  @override
  String get example => 'උදාහරණය';
  @override
  String get files => 'ගොනු';
  @override
  String get finished => 'අවසන්';
  @override
  String get hide => 'සඟවන්න';
  @override
  String get off => 'ඕෆ් (Off)';
  @override
  String get offline => 'ඕෆ්ලයින්';
  @override
  String get on => 'ඔන් (On)';
  @override
  String get online => 'ඔන්ලයින්';
  @override
  String get open => 'විවෘත කරන්න';
  @override
  String get queue => 'පෝලිම';
  @override
  String get quickSave => 'Quick සේව්';
  @override
  String get quickSaveFromFavorites => '"ප්‍රියතම" සඳහා Quick සේව් කරන්න';
  @override
  String get renamed => 'නම වෙනස් කරන ලදි';
  @override
  String get reset => 'වෙනස්කම් අහෝසි කරන්න';
  @override
  String get restart => 'නැවත ආරම්භ කරන්න';
  @override
  String get settings => 'සැකසුම්';
  @override
  String get skipped => 'මග හරින ලදි';
  @override
  String get start => 'ආරම්භ කරන්න';
  @override
  String get stop => 'නවත්වන්න';
  @override
  String get save => 'සේව් කරන්න';
  @override
  String get unchanged => 'නොවෙනස්';
  @override
  String get unknown => 'නොදන්නා';
  @override
  String get noItemInClipboard => 'Clipboard හි අයිතම නැත.';
}

// Path: receiveTab
class _Translations$receiveTab$si extends Translations$receiveTab$en {
  _Translations$receiveTab$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලබාගන්න';
  @override
  late final _Translations$receiveTab$infoBox$si infoBox = _Translations$receiveTab$infoBox$si._(_root);
  @override
  late final _Translations$receiveTab$quickSave$si quickSave = _Translations$receiveTab$quickSave$si._(_root);
}

// Path: sendTab
class _Translations$sendTab$si extends Translations$sendTab$en {
  _Translations$sendTab$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'යවන්න';
  @override
  late final _Translations$sendTab$selection$si selection = _Translations$sendTab$selection$si._(_root);
  @override
  late final _Translations$sendTab$picker$si picker = _Translations$sendTab$picker$si._(_root);
  @override
  String get shareIntentInfo => 'ඔබට වඩාත් පහසුවෙන් ගොනු තේරීමට ඔබගේ ජංගම උපාංගයේ "Share" විශේෂාංගය භාවිතා කළ හැක.';
  @override
  String get nearbyDevices => 'ආසන්න උපාංග';
  @override
  String get thisDevice => 'මෙම උපාංගය';
  @override
  String get scan => 'උපාංග සොයන්න';
  @override
  String get manualSending => 'Manual යැවීම';
  @override
  String get sendMode => 'යැවීමේ ක්‍රමය';
  @override
  late final _Translations$sendTab$sendModes$si sendModes = _Translations$sendTab$sendModes$si._(_root);
  @override
  String get sendModeHelp => 'පැහැදිලි කිරීම';
  @override
  String get help => 'කරුණාකර ලබන්නාගේ උපාංගය හා ඔබේ උපාංගය එකම Wi-Fi ජාලයේ ඇති බව සහතික කර ගන්න.';
  @override
  String get placeItems => 'බෙදා (Share) ගැනීමට අවශ්‍ය දේ තබන්න.';
}

// Path: settingsTab
class _Translations$settingsTab$si extends Translations$settingsTab$en {
  _Translations$settingsTab$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'සැකසුම්';
  @override
  late final _Translations$settingsTab$general$si general = _Translations$settingsTab$general$si._(_root);
  @override
  late final _Translations$settingsTab$receive$si receive = _Translations$settingsTab$receive$si._(_root);
  @override
  late final _Translations$settingsTab$send$si send = _Translations$settingsTab$send$si._(_root);
  @override
  late final _Translations$settingsTab$network$si network = _Translations$settingsTab$network$si._(_root);
  @override
  late final _Translations$settingsTab$other$si other = _Translations$settingsTab$other$si._(_root);
  @override
  String get advancedSettings => 'ගැඹුරු සැකසුම්';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$si extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගැටලු විසඳන්න';
  @override
  String get subTitle => 'යෙදුම අපේක්ෂිත පරිදි ක්‍රියා නොකරන්නේද? මෙහි පොදු ගැටලු සඳහා විසඳුම් සොයා ගත හැක.';
  @override
  String get solution => 'විසඳුම:';
  @override
  String get fixButton => 'ස්වයංක්‍රීයව නිවැරදි කරන්න';
  @override
  late final _Translations$troubleshootPage$firewall$si firewall = _Translations$troubleshootPage$firewall$si._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$si noDiscovery = _Translations$troubleshootPage$noDiscovery$si._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$si noConnection = _Translations$troubleshootPage$noConnection$si._(_root);
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$si extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ඉතිහාසය';
  @override
  String get openFolder => 'ෆෝල්ඩරය විවෘත කරන්න';
  @override
  String get deleteHistory => 'ඉතිහාසය මකන්න';
  @override
  String get empty => 'ඉතිහාසයේ කිසිවක් නැත.';
  @override
  late final _Translations$receiveHistoryPage$entryActions$si entryActions = _Translations$receiveHistoryPage$entryActions$si._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$si extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ඇප් (APK)';
  @override
  String get excludeSystemApps => 'පද්ධති යෙදුම් (System Apps) බැහැර කරන්න';
  @override
  String get excludeAppsWithoutLaunchIntent => 'ක්‍රියාත්මක කිරීමට නොහැකි ඇප් බැහැර කරන්න';
  @override
  String apps({required Object n}) => 'ඇප් ${n}';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$si extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'සියල්ල මකන්න';
}

// Path: receivePage
class _Translations$receivePage$si extends Translations$receivePage$en {
  _Translations$receivePage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('si'))(
    n,
    one: 'ඔබට ගොනුවක් එවීමට කැමතියි',
    other: 'ඔබට ගොනු ${n} එවීමට කැමතියි',
  );
  @override
  String get subTitleMessage => 'ඔබට පණිවිඩයක් එවා ඇත:';
  @override
  String get subTitleLink => 'ඔබට ලින්ක් (Link) එකක් එවා ඇත:';
  @override
  String get canceled => 'යවන්නා ඉල්ලීම අවලංගු කර ඇත.';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$si extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'විකල්ප';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend ෆෝල්ඩරය)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'ෆෝල්ඩර් නොමැති බැවින් ස්වයංක්‍රීයව ක්‍රියා විරහිත කරන ලදි.';
}

// Path: sendPage
class _Translations$sendPage$si extends Translations$sendPage$en {
  _Translations$sendPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'ප්‍රතිචාරයක් බලාපොරොත්තු වෙමින්…';
  @override
  String get rejected => 'ලැබුම්කරු ඉල්ලීම ප්‍රතික්ෂේප කර ඇත.';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'ලැබුම්කරු වෙනත් ඉල්ලීමක් නිසා කාර්‍යබහුලව ඇත.';
}

// Path: progressPage
class _Translations$progressPage$si extends Translations$progressPage$en {
  _Translations$progressPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ගොනු යවමින්';
  @override
  String get titleReceiving => 'ගොනු ලබා ගනිමින්';
  @override
  String get savedToGallery => 'Photos තුළ සේව් කරන ලදි';
  @override
  late final _Translations$progressPage$total$si total = _Translations$progressPage$total$si._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$si extends Translations$webSharePage$en {
  _Translations$webSharePage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලින්ක් (Link) ඔස්සේ බෙදාගන්න (Share)';
  @override
  String get loading => 'සේවාදායකය ආරම්භ කරමින්…';
  @override
  String get stopping => 'සේවාදායකය නවතමින්…';
  @override
  String get error => 'සේවාදායකය ආරම්භ කිරීමේදී දෝෂයක් සිදු විය.';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('si'))(
    n,
    one: 'මෙම ලින්ක් (Link) එක ඔබේ බ්‍රවුසරය (Browser) මගින් විවෘත කරන්න:',
    other: 'මෙම ලින්ක් (Link) වලින් එකක් ඔබේ බ්‍රවුසරය (Browser) මගින් විවෘත කරන්න:',
  );
  @override
  String get requests => 'ඉල්ලීම්';
  @override
  String get noRequests => 'තවමත් කිසිදු ඉල්ලීමක් නැත.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'ඉල්ලීම් ස්වයංක්‍රීයව පිළිගන්න';
  @override
  String get requirePin => 'PIN අවශ්‍යයි';
  @override
  String pinHint({required Object pin}) => 'PIN එක "${pin}"';
  @override
  String get encryptionHint =>
      'LocalSend self-signed certificate එකක් භාවිතා කරයි. ඔබ විසින් එය බ්‍රවුසරය (browser) තුළ දි පිළිගැනීම (accept) අවශ්‍ය වේ.';
  @override
  String pendingRequests({required Object n}) => 'Pending වන ඉල්ලීම්: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$si extends Translations$aboutPage$en {
  _Translations$aboutPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend පිළිබඳව';
  @override
  List<String> get description => [
    'LocalSend යනු ඔබට අන්තර්ජාල සම්බන්ධතාවයක අවශ්‍යතාවයකින් තොරව, local ජාලයක් තුළ, සමීප උපාංග සමඟ ගොනු සහ පණිවිඩ ආරක්ෂිතව බෙදා ගත හැකි නිදහස්, විවෘත-මූලාශ්‍රය (Free and open-source) ඇප් එකකි.',
    'මෙම ඇප් එක Android, iOS, macOS, Windows සහ Linux සඳහා පවතියි. එය ඩවුන්ලෝඩ් (Download) කරගත හැකි ආකාර අපේ අඩවියේ මුල් පිටුවෙන් සොයාගත හැක.',
  ];
  @override
  String get author => 'කතෲ';
  @override
  String get contributors => 'සහය දැක්වූවන්';
  @override
  String get packagers => 'පැකේජ්ර්ස්';
  @override
  String get translators => 'පරිවර්තකයන්';
}

// Path: donationPage
class _Translations$donationPage$si extends Translations$donationPage$en {
  _Translations$donationPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ආධාර කරන්න';
  @override
  String get info =>
      'LocalSend නිදහස්, විවෘත-මූලාශ්‍ර වන අතර කිසිදු වෙළඳ දැන්වීමකින් තොර වේ. ඔබ මෙම ඇප් එකට කැමැති නම්, මෙහි සංවර්ධනය සඳහා මූල්‍යමය දායකත්වයක් ලබා දී සහය ලබා දීමට හැක.';
  @override
  String donate({required Object amount}) => 'දායකත්වය ${amount}';
  @override
  String get thanks => 'ඔබට බොහොම ස්තූතියි!';
  @override
  String get restore => 'මිලදී ගැනීම ප්‍රතිස්ථාපනය (Restore) කරන්න';
}

// Path: changelogPage
class _Translations$changelogPage$si extends Translations$changelogPage$en {
  _Translations$changelogPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'වෙනස්කම් ලේඛනය';
}

// Path: dialogs
class _Translations$dialogs$si extends Translations$dialogs$en {
  _Translations$dialogs$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$si addFile = _Translations$dialogs$addFile$si._(_root);
  @override
  late final _Translations$dialogs$openFile$si openFile = _Translations$dialogs$openFile$si._(_root);
  @override
  late final _Translations$dialogs$addressInput$si addressInput = _Translations$dialogs$addressInput$si._(_root);
  @override
  late final _Translations$dialogs$cancelSession$si cancelSession = _Translations$dialogs$cancelSession$si._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$si cannotOpenFile = _Translations$dialogs$cannotOpenFile$si._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$si encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$si._(_root);
  @override
  late final _Translations$dialogs$errorDialog$si errorDialog = _Translations$dialogs$errorDialog$si._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$si favoriteDialog = _Translations$dialogs$favoriteDialog$si._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$si favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$si._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$si favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$si._(_root);
  @override
  late final _Translations$dialogs$fileInfo$si fileInfo = _Translations$dialogs$fileInfo$si._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$si fileNameInput = _Translations$dialogs$fileNameInput$si._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$si historyClearDialog = _Translations$dialogs$historyClearDialog$si._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$si localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$si._(_root);
  @override
  late final _Translations$dialogs$messageInput$si messageInput = _Translations$dialogs$messageInput$si._(_root);
  @override
  late final _Translations$dialogs$noFiles$si noFiles = _Translations$dialogs$noFiles$si._(_root);
  @override
  late final _Translations$dialogs$noPermission$si noPermission = _Translations$dialogs$noPermission$si._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$si notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$si._(_root);
  @override
  late final _Translations$dialogs$qr$si qr = _Translations$dialogs$qr$si._(_root);
  @override
  late final _Translations$dialogs$quickActions$si quickActions = _Translations$dialogs$quickActions$si._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$si quickSaveNotice = _Translations$dialogs$quickSaveNotice$si._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$si quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$si._(_root);
  @override
  late final _Translations$dialogs$pin$si pin = _Translations$dialogs$pin$si._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$si sendModeHelp = _Translations$dialogs$sendModeHelp$si._(_root);
  @override
  late final _Translations$dialogs$zoom$si zoom = _Translations$dialogs$zoom$si._(_root);
}

// Path: sanitization
class _Translations$sanitization$si extends Translations$sanitization$en {
  _Translations$sanitization$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ගොනුවේ නම හිස් විය නොහැක';
  @override
  String get invalid => 'ගොනු නාමයේ වලංගු නොවන අක්ෂර අඩංගු වේ';
}

// Path: tray
class _Translations$tray$si extends Translations$tray$en {
  _Translations$tray$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend වෙතින් ඉවත් වෙන්න';
  @override
  String get closeWindows => 'පිටවීම';
}

// Path: web
class _Translations$web$si extends Translations$web$en {
  _Translations$web$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'PIN ඇතුල් කරන්න';
  @override
  String get invalidPin => 'වැරදි PIN';
  @override
  String get tooManyAttempts => 'මේ සඳහා පමණට වඩා උත්සාහ කර ඇත';
  @override
  String get rejected => 'ප්‍රතික්ෂේප කරන ලදී';
  @override
  String get files => 'ගොනු';
  @override
  String get fileName => 'ගොනුවේ නම';
  @override
  String get size => 'ප්‍රමාණය';
}

// Path: assetPicker
class _Translations$assetPicker$si extends Translations$assetPicker$en {
  _Translations$assetPicker$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'තහවුරු කරන්න';
  @override
  String get cancel => 'අවලංගු කරන්න';
  @override
  String get edit => 'සංස්කරණය';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Load කිරීම අසාර්ථක විය';
  @override
  String get original => 'මූලාශ්‍රය';
  @override
  String get preview => 'පෙරදසුන';
  @override
  String get select => 'තෝරන්න';
  @override
  String get emptyList => 'හිස් ලැයිස්තුව';
  @override
  String get unSupportedAssetType => 'සහය නොමැති ගොනු වර්ගයකි.';
  @override
  String get unableToAccessAll => 'උපාංගයේ ඇති සියලුම ගොනු වෙත පිවිසීමට නොහැක';
  @override
  String get viewingLimitedAssetsTip => 'ඇප් එකට ප්‍රවේශ විය හැකි ගොනු සහ ඇල්බම් පමණක් බලන්න.';
  @override
  String get changeAccessibleLimitedAssets => 'ප්‍රවේශ කළ හැකි ගොනු යාවත්කාලීන (Update) කිරීමට ක්ලික් කරන්න';
  @override
  String get accessAllTip =>
      'ඇප් එකට ප්‍රවේශ විය හැක්කේ උපාංගයේ ඇති සමහර ගොනුවලට පමණි. පද්ධති සැකසීම් (Settings) වෙත ගොස් උපාංගයේ සියලුම මාධ්‍ය වෙත ප්‍රවේශ වීමට ඇප් එකට අවසර ලබා දෙන්න.';
  @override
  String get goToSystemSettings => 'පද්ධති සැකසුම් වෙත යන්න';
  @override
  String get accessLimitedAssets => 'සීමිත ප්‍රවේශය සමඟ කරගෙන යන්න';
  @override
  String get accessiblePathName => 'ප්‍රවේශ කළ හැකි ගොනු';
  @override
  String get sTypeAudioLabel => 'හඬ';
  @override
  String get sTypeImageLabel => 'චායාරූප';
  @override
  String get sTypeVideoLabel => 'වීඩියෝ';
  @override
  String get sTypeOtherLabel => 'වෙනත් මාධ්‍ය';
  @override
  String get sActionPlayHint => 'වාදනය කරන්න';
  @override
  String get sActionPreviewHint => 'පෙරදසුන';
  @override
  String get sActionSelectHint => 'තෝරන්න';
  @override
  String get sActionSwitchPathLabel => 'පාත් (Path) එක වෙනස් කරන්න';
  @override
  String get sActionUseCameraHint => 'කැමරාව භාවිතා කරන්න';
  @override
  String get sNameDurationLabel => 'කාලසීමාව';
  @override
  String get sUnitAssetCountLabel => 'ගණන';
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$si extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get info =>
      'සාමාන්‍යයෙන් LocalSend ඔබගේ පවතින සියලු ජාල මුහුණත් භාවිතා කරයි. ඔබට අනවශ්‍ය මුහුණතක් වේ නම් එය මෙතනින් ඉවත් කළ හැක. ඔබ සිදු කරන වෙනස්කම් ක්‍රියාත්මක වීමට නම් server එක restart කළ යුතුය.';
  @override
  String get title => 'ජාල අතුරුමුහුණත්';
  @override
  String get preview => 'පෙනෙන අයුරු';
  @override
  String get whitelist => 'අවසර ලත් ලැයිස්තුව';
  @override
  String get blacklist => 'අවහිර කල ලැයිස්තුව';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$si extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Port:';
  @override
  String get alias => 'උපාංගයේ නම:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$si extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'ප්‍රියතම';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$si extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'තේරීම';
  @override
  String files({required Object files}) => 'ගොනු: ${files}';
  @override
  String size({required Object size}) => 'ප්‍රමාණය: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$si extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ගොනුව';
  @override
  String get folder => 'ෆෝල්ඩරය';
  @override
  String get media => 'මාධ්‍ය';
  @override
  String get text => 'පේළි (Text)';
  @override
  String get app => 'ඇප්';
  @override
  String get clipboard => 'පේස්ට් කරන්න';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$si extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'තනි ලබන්නා';
  @override
  String get multiple => 'බහු ලබන්නන්';
  @override
  String get link => 'ලින්ක් (Link) ඔස්සේ බෙදාගන්න (Share)';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$si extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'සාමාන්‍ය';
  @override
  String get brightness => 'තේමාව';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$si brightnessOptions = _Translations$settingsTab$general$brightnessOptions$si._(
    _root,
  );
  @override
  String get color => 'පාට';
  @override
  late final _Translations$settingsTab$general$colorOptions$si colorOptions = _Translations$settingsTab$general$colorOptions$si._(_root);
  @override
  String get language => 'භාෂාව';
  @override
  late final _Translations$settingsTab$general$languageOptions$si languageOptions = _Translations$settingsTab$general$languageOptions$si._(_root);
  @override
  String get saveWindowPlacement => 'ඉවත් වූ පසු කවුළුවේ පිහිටීම සුරකින්න';
  @override
  String get saveWindowPlacementWindows => 'පිටවීමෙන් පසු කවුළුවේ පිහිටීම සුරකින්න';
  @override
  String get minimizeToTray => 'වසා දැමීමේදී System Tray/Menu Bar වෙත අවම කරන්න';
  @override
  String get launchAtStartup => 'පුරනය වීමෙන් පසු ස්වයංක්‍රීයව ආරම්භ කරන්න';
  @override
  String get launchMinimized => 'ස්වයංක්‍රීය ආරම්භය: සඟවා ආරම්භ කරන්න';
  @override
  String get showInContextMenu => 'Context මෙනුව තුළ LocalSend පෙන්වන්න';
  @override
  String get animations => 'ඇනිමේශන්';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$si extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලබාගන්න';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'ස්වයංක්‍රීය අවසන් කිරීම';
  @override
  String get destination => 'ෆෝල්ඩරය වෙත සුරකින්න';
  @override
  String get downloads => '(බාගත කිරීම්)';
  @override
  String get saveToGallery => 'මාධ්‍ය ගැලරියට සුරකින්න';
  @override
  String get saveToHistory => 'ඉතිහාසයට සුරකින්න';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$si extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'යවන්න';
  @override
  String get shareViaLinkAutoAccept => '"ලින්ක් (Link) ඔස්සේ බෙදාගන්න (Share)" මාදිලියේ ඉල්ලීම් ස්වයංක්‍රීයව පිළිගන්න';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$si extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ජාලය';
  @override
  String get needRestart => 'සැකසුම් යෙදීමට සේවාදායකය නැවත අරඹන්න!';
  @override
  String get server => 'සේවාදායකය';
  @override
  String get alias => 'උපාංගයේ නම';
  @override
  String get deviceType => 'උපාංගයේ වර් ගය';
  @override
  String get deviceModel => 'උපාංගයේ ආකෘතිය';
  @override
  String get port => 'Port';
  @override
  String get discoveryTimeout => 'සොයා ගැනීමේ කාලසීමාව';
  @override
  String get useSystemName => 'පද්ධති නම භාවිතා කරන්න';
  @override
  String get generateRandomAlias => 'අහඹු නමක් ජනනය කරන්න';
  @override
  String portWarning({required Object defaultPort}) =>
      'ඔබ custom port එකක් භාවිතා කරන්නේ නම්, වෙනත් උපාංග වලට ඔබව හඳුනා ගත නොහැක. (default: ${defaultPort})';
  @override
  String get encryption => 'කේතනය';
  @override
  String get multicastGroup => 'Multicast ලිපිනය';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'ඔබ custom multicast ලිපිනයක් භාවිතා කරන්නේ නම්, වෙනත් උපාංග වලට ඔබව හඳුනා ගත නොහැක. (default: ${defaultMulticast})';
  @override
  String get network => 'ජාලය';
  @override
  late final _Translations$settingsTab$network$networkOptions$si networkOptions = _Translations$settingsTab$network$networkOptions$si._(_root);
}

// Path: settingsTab.other
class _Translations$settingsTab$other$si extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'වෙනත්';
  @override
  String get support => 'LocalSend සඳහා සහය දක්වන්න';
  @override
  String get donate => 'ආධාර කරන්න';
  @override
  String get privacyPolicy => 'පුද්ගලික තොරතුරු ප්‍රතිපත්තිය';
  @override
  String get termsOfUse => 'භාවිතා කිරීමේ කොන්දේසි';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$si extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'මෙම උපාංගය මගින් වෙනත් උපාංගවලට ගොනු යැවිය හැක, නමුත් වෙනත් උපාංගවලින් මෙම උපාංගයට ගොනු යැවිය නොහැක.';
  @override
  String solution({required Object port}) =>
      'මෙය බොහෝවිට firewall සම්බන්ධ ගැටලුවක් විය හැක. විසඳීමට port ${port} එක සඳහා \'Allow Incoming Connections" (TCP සහ UDP) ලබා දෙන්න.';
  @override
  String get openFirewall => 'Firewall විවෘත කරන්න';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$si extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'මෙම උපාංගයට වෙනත් උපාංග සොයාගත නොහැක.';
  @override
  String get solution =>
      'කරුණාකර සියලුම උපාංග එකම Wi-Fi ජාලයක ඇති බවත්, එකම configuration (port, multicast address, encryption) එකක් ඇති බවත් තහවුරු කරගන්න. ඔබට ඉලක්කගත උපාංගයේ IP ලිපිනය අතින් ටයිප් කිරීමට උත්සාහ කළ හැකිය. මෙය ක්‍රියාත්මක නම්, මෙම උපාංගය ප්‍රියතමයන් අතරට එක් කිරීමට සලකා බලන්න, එවිට අනාගතයේදී එය ස්වයංක්‍රීයව සොයාගත හැක.';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$si extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'දෙපාර්ශ්වයටම එකිනෙකාගේ උපාංග හඳුනාගැනීම හෝ ගොනු බෙදාගැනීම කළ නොහැක.';
  @override
  String get solution =>
      'ගැටලුව දෙපාර්ශවයේම තිබේ ද? එසේ නම්, දෙපාර්ශවයේම උපාංග එකම Wi-Fi ජාලයක ඇති බවත්, එකම configuration (port, multicast address, encryption) එකක් ඇති බවත් තහවුරු කරගන්න. Access Point (AP) Isolation මඟින් Wi-Fi ජාලය තුළ සහභාගීවන්නන් අතර සන්නිවේදනය වාරණය විය හැක. එවැනි අවස්තාවක, මෙම විකල්පය (AP Isolation) රවුටරයේ අක්‍රීය කළ යුතුය.';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$si extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ගොනුව විවෘත කරන්න';
  @override
  String get showInFolder => 'ෆෝල්ඩරය තුළ පෙන්වන්න';
  @override
  String get info => 'තොරතුරු';
  @override
  String get deleteFromHistory => 'ඉතිහාසයෙන් මකන්න';
}

// Path: progressPage.total
class _Translations$progressPage$total$si extends Translations$progressPage$total$en {
  _Translations$progressPage$total$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$si title = _Translations$progressPage$total$title$si._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ගොනු: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'විශාලත්වය: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'වේගය: ${speed}/s';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$si extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'තේරීමට ඇඩ් කරන්න';
  @override
  String get content => 'ඔබට ඇඩ් කිරීමට අවශ්‍ය මොනවා ද?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$si extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුව විවෘත කරන්න';
  @override
  String get content => 'ලබාගත් ගොනුව විවෘත කිරීමට කැමතිද?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$si extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලිපිනය ඇතුලත් කරන්න';
  @override
  String get hashtag => 'හැශ්ටැග්';
  @override
  String get ip => 'IP ලිපිනය';
  @override
  String get recentlyUsed => 'පෙර භාවිතා කළ: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$si extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනු මාරු අවලංගු කරන්න';
  @override
  String get content => 'ඔබට ඇත්තටම ගොනු හුවමාරුව අවලංගු කිරීමට අවශ්‍යද?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$si extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුව විවෘත කළ නොහැක';
  @override
  String content({required Object file}) =>
      '"${file}" විවෘත කිරීමට නොහැකි විය. මෙම ගොනුව වෙනත් තැනකට ගෙන ගොස් (moved) හෝ නැවත නම් කර (renamed) හෝ මකා දමා (deleted) තිබේද?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$si extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'කේතනය අක්‍රිය කර ඇත';
  @override
  String get content => 'දැන් සන්නිවේදනය අනාරක්ශිත HTTP protocol හරහා සිදු වේ. HTTPS protocol භාවිතා කිරීමට, කේතනය නැවත සක්‍රීය කරන්න.';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$si extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$si extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ප්‍රියතම';
  @override
  String get noFavorites => 'තවමත් ප්‍රියතම උපාංග නැත.';
  @override
  String get addFavorite => 'ඇඩ් කරන්න';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$si extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ප්‍රියතම වලින් මකන්න';
  @override
  String content({required Object name}) => 'ඔබට ඇත්තටම "${name}" ප්‍රියතම වෙතින් මැකීමට අවශ්‍යද?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$si extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'ප්‍රියතම වෙත එක් කරන්න';
  @override
  String get titleEdit => 'සැකසුම්';
  @override
  String get name => 'උපාංගයේ නම';
  @override
  String get auto => '(ස්වයංක්‍රීය)';
  @override
  String get ip => 'IP ලිපිනය';
  @override
  String get port => 'Port';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$si extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනු විස්තර';
  @override
  String get fileName => 'ගොනු විස්තර:';
  @override
  String get path => 'පාත් (Path):';
  @override
  String get size => 'ප්‍රමාණය:';
  @override
  String get sender => 'යවන්නා:';
  @override
  String get time => 'වේලාව:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$si extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුවේ නම ඇතුලත් කරන්න';
  @override
  String original({required Object original}) => 'මුල්: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$si extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ඉතිහාසය ඉවත් කරන්න';
  @override
  String get content => 'ඔබට ඇත්තටම ඉතිහාසය සම්පූර්ණයෙන් මකා දැමීමට අවශ්‍යද?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$si extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'ජාලය ස්කෑන් (Scan) කිරීමට අවසරයක් නොමැතිව, LocalSend හට අනෙකුත් උපාංග සොයාගත නොහැක. කාරුණිකව මෙම අවසරය සැකසුම් (Settings) තුළ ලබා දෙන්න.';
  @override
  String get gotoSettings => 'සැකසුම්';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$si extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'පණිවිඩය ටයිප් කරන්න';
  @override
  String get multiline => 'බහු පේලි';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$si extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'කිසිදු ගොනුවක් තෝරා නැත';
  @override
  String get content => 'කරුණාකර අවම වශයෙන් එක් ගොනුවක්වත් තෝරන්න.';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$si extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'අවසර නැත';
  @override
  String get content => 'අවශ්‍ය අවසර ලබා නොදී ඇත. මෙම අවසර සැකසුම් (Settings) තුළ ලබා දෙන්න.';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$si extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලබා ගත නොහැක';
  @override
  String get content => 'මෙම විශේෂාංගය ලබා ගත හැක්කේ පහත ක්‍රමවේද තුල පමණි:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$si extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR කේතය';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$si extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Quick යෙදුම්';
  @override
  String get counter => 'කවුන්ටරය';
  @override
  String get prefix => 'Prefix';
  @override
  String get padZero => 'Pad with zeros';
  @override
  String get sortBeforeCount => 'අකාරාදී පිළිවෙලට සකසන්න (A-Z)';
  @override
  String get random => 'අහඹු';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$si extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ගොනු ඉල්ලීම් දැන් ස්වයංක්‍රීයව පිළිගනු ලැබේ. ජාලයේ සිටින සෑම කෙනෙකුටම ඔබට ගොනු එවිය හැකි බව මතක තබා ගන්න.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$si extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'ඔබගේ ප්‍රියතම ලැයිස්තුවේ ඇති උපාංගවලින් ලැබෙන ගොනු ඉල්ලීම් දැන් ස්වයංක්‍රීයව පිළිගනු ලැබේ.',
    'අවවාදයයි! දැනට, මෙය සම්පූර්ණයෙන්ම ආරක්ෂිත නැත, ඔබේ ප්‍රියතම ලැයිස්තුවේ ඇති ඕනෑම උපාංගයක ඇඟිලි සලකුණක් සහිත හැකර්වරයෙකුට (Hacker) කිසිඳු සීමාවකින් තොරව ඔබ වෙත ගොනු එවිය හැක.',
    'කෙසේ වෙතත්, මෙම විකල්පය ජාලයේ සියලුම පරිශීලකයින්ට කිසිඳු සීමාවකින් තොරව ගොනු එවීමට ඉඩ දීමට වඩා ආරක්ෂිත වේ.',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$si extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN ඇතුල් කරන්න';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$si extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'යැවීමේ ක්‍රම';
  @override
  String get single => 'එක් ලබන්නෙකුට පමණක් ගොනු යැවීම කරයි. ගොනු හුවමාරු කිරීමෙන් පසුව, තේරීම මකා දමනු ලැබේ.';
  @override
  String get multiple => 'ලබන්නන් කිහිපදෙනෙකු වෙත ගොනු යැවීම කරයි. ගොනු හුවමාරු කිරීමෙන් පසුව ද තේරීම මකා දමන්නේ නැත.';
  @override
  String get link =>
      'ලබන්නන් LocalSend ස්ථාපනය කර නොමැති නම්, ඔව්න්ගේ බ්‍රවුසර් (Browser) තුළ අදාල ලින්ක් (Link) එක විවෘත කර, ගොනු බාගත (Download) කළ හැක.';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$si extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$si extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'පද්ධතිය';
  @override
  String get dark => 'අඳුරු';
  @override
  String get light => 'එළිය';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$si extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'පද්ධතිය';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$si extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'පද්ධතිය';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$si extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'සියල්ල';
  @override
  String get filtered => 'වර්ග කළ';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$si extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$si._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'සම්පූර්ණ ප්‍රගතිය (${time})';
  @override
  String get finishedError => 'දෝෂයක් සමඟ අවසන් විය';
  @override
  String get canceledSender => 'යවන්නා විසින් අවලංගු කරන ලදී';
  @override
  String get canceledReceiver => 'ලැබුම්කරු විසින් අවලංගු කරන ලදී';
}
