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
class TranslationsSi extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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

  // Translations
  @override
  String get locale => 'සිංහල';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralSi general = _TranslationsGeneralSi._(_root);
  @override
  late final _TranslationsReceiveTabSi receiveTab = _TranslationsReceiveTabSi._(_root);
  @override
  late final _TranslationsSendTabSi sendTab = _TranslationsSendTabSi._(_root);
  @override
  late final _TranslationsSettingsTabSi settingsTab = _TranslationsSettingsTabSi._(_root);
  @override
  late final _TranslationsTroubleshootPageSi troubleshootPage = _TranslationsTroubleshootPageSi._(_root);
  @override
  late final _TranslationsReceiveHistoryPageSi receiveHistoryPage = _TranslationsReceiveHistoryPageSi._(_root);
  @override
  late final _TranslationsApkPickerPageSi apkPickerPage = _TranslationsApkPickerPageSi._(_root);
  @override
  late final _TranslationsSelectedFilesPageSi selectedFilesPage = _TranslationsSelectedFilesPageSi._(_root);
  @override
  late final _TranslationsReceivePageSi receivePage = _TranslationsReceivePageSi._(_root);
  @override
  late final _TranslationsReceiveOptionsPageSi receiveOptionsPage = _TranslationsReceiveOptionsPageSi._(_root);
  @override
  late final _TranslationsSendPageSi sendPage = _TranslationsSendPageSi._(_root);
  @override
  late final _TranslationsProgressPageSi progressPage = _TranslationsProgressPageSi._(_root);
  @override
  late final _TranslationsWebSharePageSi webSharePage = _TranslationsWebSharePageSi._(_root);
  @override
  late final _TranslationsAboutPageSi aboutPage = _TranslationsAboutPageSi._(_root);
  @override
  late final _TranslationsDonationPageSi donationPage = _TranslationsDonationPageSi._(_root);
  @override
  late final _TranslationsChangelogPageSi changelogPage = _TranslationsChangelogPageSi._(_root);
  @override
  late final _TranslationsAliasGeneratorSi aliasGenerator = _TranslationsAliasGeneratorSi._(_root);
  @override
  late final _TranslationsDialogsSi dialogs = _TranslationsDialogsSi._(_root);
  @override
  late final _TranslationsSanitizationSi sanitization = _TranslationsSanitizationSi._(_root);
  @override
  late final _TranslationsTraySi tray = _TranslationsTraySi._(_root);
  @override
  late final _TranslationsWebSi web = _TranslationsWebSi._(_root);
  @override
  late final _TranslationsAssetPickerSi assetPicker = _TranslationsAssetPickerSi._(_root);
}

// Path: general
class _TranslationsGeneralSi extends TranslationsGeneralEn {
  _TranslationsGeneralSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabSi extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලබාගන්න';
  @override
  late final _TranslationsReceiveTabInfoBoxSi infoBox = _TranslationsReceiveTabInfoBoxSi._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveSi quickSave = _TranslationsReceiveTabQuickSaveSi._(_root);
}

// Path: sendTab
class _TranslationsSendTabSi extends TranslationsSendTabEn {
  _TranslationsSendTabSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'යවන්න';
  @override
  late final _TranslationsSendTabSelectionSi selection = _TranslationsSendTabSelectionSi._(_root);
  @override
  late final _TranslationsSendTabPickerSi picker = _TranslationsSendTabPickerSi._(_root);
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
  late final _TranslationsSendTabSendModesSi sendModes = _TranslationsSendTabSendModesSi._(_root);
  @override
  String get sendModeHelp => 'පැහැදිලි කිරීම';
  @override
  String get help => 'කරුණාකර ලබන්නාගේ උපාංගය හා ඔබේ උපාංගය එකම Wi-Fi ජාලයේ ඇති බව සහතික කර ගන්න.';
  @override
  String get placeItems => 'බෙදා (Share) ගැනීමට අවශ්‍ය දේ තබන්න.';
}

// Path: settingsTab
class _TranslationsSettingsTabSi extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'සැකසුම්';
  @override
  late final _TranslationsSettingsTabGeneralSi general = _TranslationsSettingsTabGeneralSi._(_root);
  @override
  late final _TranslationsSettingsTabReceiveSi receive = _TranslationsSettingsTabReceiveSi._(_root);
  @override
  late final _TranslationsSettingsTabSendSi send = _TranslationsSettingsTabSendSi._(_root);
  @override
  late final _TranslationsSettingsTabNetworkSi network = _TranslationsSettingsTabNetworkSi._(_root);
  @override
  late final _TranslationsSettingsTabOtherSi other = _TranslationsSettingsTabOtherSi._(_root);
  @override
  String get advancedSettings => 'ගැඹුරු සැකසුම්';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageSi extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
  late final _TranslationsTroubleshootPageFirewallSi firewall = _TranslationsTroubleshootPageFirewallSi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoverySi noDiscovery = _TranslationsTroubleshootPageNoDiscoverySi._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionSi noConnection = _TranslationsTroubleshootPageNoConnectionSi._(_root);
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageSi extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
  late final _TranslationsReceiveHistoryPageEntryActionsSi entryActions = _TranslationsReceiveHistoryPageEntryActionsSi._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageSi extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSelectedFilesPageSi extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'සියල්ල මකන්න';
}

// Path: receivePage
class _TranslationsReceivePageSi extends TranslationsReceivePageEn {
  _TranslationsReceivePageSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('si'))(n, one: 'ඔබට ගොනුවක් එවීමට කැමතියි', other: 'ඔබට ගොනු ${n} එවීමට කැමතියි');
  @override
  String get subTitleMessage => 'ඔබට පණිවිඩයක් එවා ඇත:';
  @override
  String get subTitleLink => 'ඔබට ලින්ක් (Link) එකක් එවා ඇත:';
  @override
  String get canceled => 'යවන්නා ඉල්ලීම අවලංගු කර ඇත.';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageSi extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSendPageSi extends TranslationsSendPageEn {
  _TranslationsSendPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageSi extends TranslationsProgressPageEn {
  _TranslationsProgressPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ගොනු යවමින්';
  @override
  String get titleReceiving => 'ගොනු ලබා ගනිමින්';
  @override
  String get savedToGallery => 'Photos තුළ සේව් කරන ලදි';
  @override
  late final _TranslationsProgressPageTotalSi total = _TranslationsProgressPageTotalSi._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageSi extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsAboutPageSi extends TranslationsAboutPageEn {
  _TranslationsAboutPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDonationPageSi extends TranslationsDonationPageEn {
  _TranslationsDonationPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsChangelogPageSi extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'වෙනස්කම් ලේඛනය';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorSi extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
}

// Path: dialogs
class _TranslationsDialogsSi extends TranslationsDialogsEn {
  _TranslationsDialogsSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileSi addFile = _TranslationsDialogsAddFileSi._(_root);
  @override
  late final _TranslationsDialogsOpenFileSi openFile = _TranslationsDialogsOpenFileSi._(_root);
  @override
  late final _TranslationsDialogsAddressInputSi addressInput = _TranslationsDialogsAddressInputSi._(_root);
  @override
  late final _TranslationsDialogsCancelSessionSi cancelSession = _TranslationsDialogsCancelSessionSi._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileSi cannotOpenFile = _TranslationsDialogsCannotOpenFileSi._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeSi encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeSi._(_root);
  @override
  late final _TranslationsDialogsErrorDialogSi errorDialog = _TranslationsDialogsErrorDialogSi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogSi favoriteDialog = _TranslationsDialogsFavoriteDialogSi._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogSi favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogSi._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogSi favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogSi._(_root);
  @override
  late final _TranslationsDialogsFileInfoSi fileInfo = _TranslationsDialogsFileInfoSi._(_root);
  @override
  late final _TranslationsDialogsFileNameInputSi fileNameInput = _TranslationsDialogsFileNameInputSi._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogSi historyClearDialog = _TranslationsDialogsHistoryClearDialogSi._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedSi localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedSi._(_root);
  @override
  late final _TranslationsDialogsMessageInputSi messageInput = _TranslationsDialogsMessageInputSi._(_root);
  @override
  late final _TranslationsDialogsNoFilesSi noFiles = _TranslationsDialogsNoFilesSi._(_root);
  @override
  late final _TranslationsDialogsNoPermissionSi noPermission = _TranslationsDialogsNoPermissionSi._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformSi notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformSi._(_root);
  @override
  late final _TranslationsDialogsQrSi qr = _TranslationsDialogsQrSi._(_root);
  @override
  late final _TranslationsDialogsQuickActionsSi quickActions = _TranslationsDialogsQuickActionsSi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeSi quickSaveNotice = _TranslationsDialogsQuickSaveNoticeSi._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeSi quickSaveFromFavoritesNotice = _TranslationsDialogsQuickSaveFromFavoritesNoticeSi._(
    _root,
  );
  @override
  late final _TranslationsDialogsPinSi pin = _TranslationsDialogsPinSi._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpSi sendModeHelp = _TranslationsDialogsSendModeHelpSi._(_root);
  @override
  late final _TranslationsDialogsZoomSi zoom = _TranslationsDialogsZoomSi._(_root);
}

// Path: sanitization
class _TranslationsSanitizationSi extends TranslationsSanitizationEn {
  _TranslationsSanitizationSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ගොනුවේ නම හිස් විය නොහැක';
  @override
  String get invalid => 'ගොනු නාමයේ වලංගු නොවන අක්ෂර අඩංගු වේ';
}

// Path: tray
class _TranslationsTraySi extends TranslationsTrayEn {
  _TranslationsTraySi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsWebSi extends TranslationsWebEn {
  _TranslationsWebSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsAssetPickerSi extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerSi._(TranslationsSi root) : this._root = root, super.internal(root);

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

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxSi extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsReceiveTabQuickSaveSi extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSelectionSi extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabPickerSi extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSendTabSendModesSi extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralSi extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'සාමාන්‍ය';
  @override
  String get brightness => 'තේමාව';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsSi brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsSi._(_root);
  @override
  String get color => 'පාට';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsSi colorOptions = _TranslationsSettingsTabGeneralColorOptionsSi._(_root);
  @override
  String get language => 'භාෂාව';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsSi languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsSi._(_root);
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
class _TranslationsSettingsTabReceiveSi extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabSendSi extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'යවන්න';
  @override
  String get shareViaLinkAutoAccept => '"ලින්ක් (Link) ඔස්සේ බෙදාගන්න (Share)" මාදිලියේ ඉල්ලීම් ස්වයංක්‍රීයව පිළිගන්න';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkSi extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherSi extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsTroubleshootPageFirewallSi extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'මෙම උපාංගය මගින් වෙනත් උපාංගවලට ගොනු යැවිය හැක, නමුත් වෙනත් උපාංගවලින් මෙම උපාංගයට ගොනු යැවිය නොහැක.';
  @override
  String solution({required Object port}) =>
      'මෙය බොහෝවිට firewall සම්බන්ධ ගැටලුවක් විය හැක. විසඳීමට port ${port} එක සඳහා \'Allow Incoming Connections" (TCP සහ UDP) ලබා දෙන්න.';
  @override
  String get openFirewallSettings => 'Firewall විවෘත කරන්න';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoverySi extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoverySi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'මෙම උපාංගයට වෙනත් උපාංග සොයාගත නොහැක.';
  @override
  String get solution =>
      'කරුණාකර සියලුම උපාංග එකම Wi-Fi ජාලයක ඇති බවත්, එකම configuration (port, multicast address, encryption) එකක් ඇති බවත් තහවුරු කරගන්න. ඔබට ඉලක්කගත උපාංගයේ IP ලිපිනය අතින් ටයිප් කිරීමට උත්සාහ කළ හැකිය. මෙය ක්‍රියාත්මක නම්, මෙම උපාංගය ප්‍රියතමයන් අතරට එක් කිරීමට සලකා බලන්න, එවිට අනාගතයේදී එය ස්වයංක්‍රීයව සොයාගත හැක.';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionSi extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'දෙපාර්ශ්වයටම එකිනෙකාගේ උපාංග හඳුනාගැනීම හෝ ගොනු බෙදාගැනීම කළ නොහැක.';
  @override
  String get solution =>
      'ගැටලුව දෙපාර්ශවයේම තිබේ ද? එසේ නම්, දෙපාර්ශවයේම උපාංග එකම Wi-Fi ජාලයක ඇති බවත්, එකම configuration (port, multicast address, encryption) එකක් ඇති බවත් තහවුරු කරගන්න. Access Point (AP) Isolation මඟින් Wi-Fi ජාලය තුළ සහභාගීවන්නන් අතර සන්නිවේදනය වාරණය විය හැක. එවැනි අවස්තාවක, මෙම විකල්පය (AP Isolation) රවුටරයේ අක්‍රීය කළ යුතුය.';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsSi extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsProgressPageTotalSi extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleSi title = _TranslationsProgressPageTotalTitleSi._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ගොනු: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'විශාලත්වය: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'වේගය: ${speed}/s';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileSi extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'තේරීමට ඇඩ් කරන්න';
  @override
  String get content => 'ඔබට ඇඩ් කිරීමට අවශ්‍ය මොනවා ද?';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileSi extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුව විවෘත කරන්න';
  @override
  String get content => 'ලබාගත් ගොනුව විවෘත කිරීමට කැමතිද?';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputSi extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsCancelSessionSi extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනු මාරු අවලංගු කරන්න';
  @override
  String get content => 'ඔබට ඇත්තටම ගොනු හුවමාරුව අවලංගු කිරීමට අවශ්‍යද?';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileSi extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුව විවෘත කළ නොහැක';
  @override
  String content({required Object file}) =>
      '"${file}" විවෘත කිරීමට නොහැකි විය. මෙම ගොනුව වෙනත් තැනකට ගෙන ගොස් (moved) හෝ නැවත නම් කර (renamed) හෝ මකා දමා (deleted) තිබේද?';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeSi extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'කේතනය අක්‍රිය කර ඇත';
  @override
  String get content => 'දැන් සන්නිවේදනය අනාරක්ශිත HTTP protocol හරහා සිදු වේ. HTTPS protocol භාවිතා කිරීමට, කේතනය නැවත සක්‍රීය කරන්න.';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogSi extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogSi extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFavoriteDeleteDialogSi extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ප්‍රියතම වලින් මකන්න';
  @override
  String content({required Object name}) => 'ඔබට ඇත්තටම "${name}" ප්‍රියතම වෙතින් මැකීමට අවශ්‍යද?';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogSi extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileInfoSi extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsFileNameInputSi extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ගොනුවේ නම ඇතුලත් කරන්න';
  @override
  String original({required Object original}) => 'මුල්: ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogSi extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ඉතිහාසය ඉවත් කරන්න';
  @override
  String get content => 'ඔබට ඇත්තටම ඉතිහාසය සම්පූර්ණයෙන් මකා දැමීමට අවශ්‍යද?';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedSi extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsMessageInputSi extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'පණිවිඩය ටයිප් කරන්න';
  @override
  String get multiline => 'බහු පේලි';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesSi extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'කිසිදු ගොනුවක් තෝරා නැත';
  @override
  String get content => 'කරුණාකර අවම වශයෙන් එක් ගොනුවක්වත් තෝරන්න.';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionSi extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'අවසර නැත';
  @override
  String get content => 'අවශ්‍ය අවසර ලබා නොදී ඇත. මෙම අවසර සැකසුම් (Settings) තුළ ලබා දෙන්න.';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformSi extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ලබා ගත නොහැක';
  @override
  String get content => 'මෙම විශේෂාංගය ලබා ගත හැක්කේ පහත ක්‍රමවේද තුල පමණි:';
}

// Path: dialogs.qr
class _TranslationsDialogsQrSi extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR කේතය';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsSi extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsQuickSaveNoticeSi extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ගොනු ඉල්ලීම් දැන් ස්වයංක්‍රීයව පිළිගනු ලැබේ. ජාලයේ සිටින සෑම කෙනෙකුටම ඔබට ගොනු එවිය හැකි බව මතක තබා ගන්න.';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeSi extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsPinSi extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'PIN ඇතුල් කරන්න';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpSi extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsDialogsZoomSi extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsSi extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsTabGeneralColorOptionsSi extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'පද්ධතිය';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsSi extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsSi._(TranslationsSi root) : this._root = root, super.internal(root);

  final TranslationsSi _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'පද්ධතිය';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleSi extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleSi._(TranslationsSi root) : this._root = root, super.internal(root);

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
