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
class TranslationsHy extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsHy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.hy,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <hy>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsHy _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Հայերեն';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralHy general = _TranslationsGeneralHy._(_root);
  @override
  late final _TranslationsReceiveTabHy receiveTab = _TranslationsReceiveTabHy._(_root);
  @override
  late final _TranslationsSendTabHy sendTab = _TranslationsSendTabHy._(_root);
  @override
  late final _TranslationsSettingsTabHy settingsTab = _TranslationsSettingsTabHy._(_root);
  @override
  late final _TranslationsTroubleshootPageHy troubleshootPage = _TranslationsTroubleshootPageHy._(_root);
  @override
  late final _TranslationsNetworkInterfacesPageHy networkInterfacesPage = _TranslationsNetworkInterfacesPageHy._(_root);
  @override
  late final _TranslationsReceiveHistoryPageHy receiveHistoryPage = _TranslationsReceiveHistoryPageHy._(_root);
  @override
  late final _TranslationsApkPickerPageHy apkPickerPage = _TranslationsApkPickerPageHy._(_root);
  @override
  late final _TranslationsSelectedFilesPageHy selectedFilesPage = _TranslationsSelectedFilesPageHy._(_root);
  @override
  late final _TranslationsReceivePageHy receivePage = _TranslationsReceivePageHy._(_root);
  @override
  late final _TranslationsReceiveOptionsPageHy receiveOptionsPage = _TranslationsReceiveOptionsPageHy._(_root);
  @override
  late final _TranslationsSendPageHy sendPage = _TranslationsSendPageHy._(_root);
  @override
  late final _TranslationsProgressPageHy progressPage = _TranslationsProgressPageHy._(_root);
  @override
  late final _TranslationsWebSharePageHy webSharePage = _TranslationsWebSharePageHy._(_root);
  @override
  late final _TranslationsAboutPageHy aboutPage = _TranslationsAboutPageHy._(_root);
  @override
  late final _TranslationsDonationPageHy donationPage = _TranslationsDonationPageHy._(_root);
  @override
  late final _TranslationsChangelogPageHy changelogPage = _TranslationsChangelogPageHy._(_root);
  @override
  late final _TranslationsAliasGeneratorHy aliasGenerator = _TranslationsAliasGeneratorHy._(_root);
  @override
  late final _TranslationsDialogsHy dialogs = _TranslationsDialogsHy._(_root);
  @override
  late final _TranslationsSanitizationHy sanitization = _TranslationsSanitizationHy._(_root);
  @override
  late final _TranslationsTrayHy tray = _TranslationsTrayHy._(_root);
  @override
  late final _TranslationsWebHy web = _TranslationsWebHy._(_root);
  @override
  late final _TranslationsAssetPickerHy assetPicker = _TranslationsAssetPickerHy._(_root);
}

// Path: general
class _TranslationsGeneralHy extends TranslationsGeneralEn {
  _TranslationsGeneralHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Ընդունել';
  @override
  String get accepted => 'Ընդունված';
  @override
  String get add => 'Ավելացնել';
  @override
  String get advanced => 'Ընդլայնված';
  @override
  String get cancel => 'Չեղարկել';
  @override
  String get close => 'Փակել';
  @override
  String get confirm => 'Հաստատել';
  @override
  String get continueStr => 'Շարունակել';
  @override
  String get copy => 'Պատճենել';
  @override
  String get copiedToClipboard => 'Պատճենվել է միջանկյալ պահեստում';
  @override
  String get decline => 'Մերժել';
  @override
  String get done => 'Կատարված է';
  @override
  String get delete => 'Ջնջել';
  @override
  String get edit => 'Խմբագրել';
  @override
  String get error => 'Սխալ';
  @override
  String get example => 'Օրինակ';
  @override
  String get files => 'Ֆայլեր';
  @override
  String get finished => 'Ավարտված է';
  @override
  String get hide => 'Թաքցնել';
  @override
  String get off => 'Անջատված';
  @override
  String get offline => 'Անցանց';
  @override
  String get on => 'Միացված';
  @override
  String get online => 'Առցանց';
  @override
  String get open => 'Բացել';
  @override
  String get queue => 'Հերթ';
  @override
  String get quickSave => 'Արագ պահպանում';
  @override
  String get quickSaveFromFavorites => 'Արագ պահպանում «Ընտրյալներից»';
  @override
  String get renamed => 'Վերանվանված է';
  @override
  String get reset => 'Հետարկել փոփոխությունները';
  @override
  String get restart => 'Վերագործարկել';
  @override
  String get settings => 'Կարգավորումներ';
  @override
  String get skipped => 'Բաց թողնված';
  @override
  String get start => 'Սկսել';
  @override
  String get stop => 'Կանգնեցնել';
  @override
  String get save => 'Պահպանել';
  @override
  String get unchanged => 'Չփոփոխված';
  @override
  String get unknown => 'Անհայտ';
  @override
  String get noItemInClipboard => 'Միջանկյալ պահեստում ոչինչ չկա։';
}

// Path: receiveTab
class _TranslationsReceiveTabHy extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ստանալ';
  @override
  late final _TranslationsReceiveTabInfoBoxHy infoBox = _TranslationsReceiveTabInfoBoxHy._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveHy quickSave = _TranslationsReceiveTabQuickSaveHy._(_root);
}

// Path: sendTab
class _TranslationsSendTabHy extends TranslationsSendTabEn {
  _TranslationsSendTabHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկել';
  @override
  late final _TranslationsSendTabSelectionHy selection = _TranslationsSendTabSelectionHy._(_root);
  @override
  late final _TranslationsSendTabPickerHy picker = _TranslationsSendTabPickerHy._(_root);
  @override
  String get shareIntentInfo => 'Կարող եք օգտագործել նաև ձեր հեռախոսի «Կիսվել» ֆունկցիան՝ ֆայլերը ավելի հեշտ ընտրելու համար։';
  @override
  String get nearbyDevices => 'Մոտակայքի սարքեր';
  @override
  String get thisDevice => 'Այս սարքը';
  @override
  String get scan => 'Սարքերի որոնում';
  @override
  String get manualSending => 'Ձեռքով ուղարկում';
  @override
  String get sendMode => 'Ուղարկման ռեժիմ';
  @override
  late final _TranslationsSendTabSendModesHy sendModes = _TranslationsSendTabSendModesHy._(_root);
  @override
  String get sendModeHelp => 'Բացատրություն';
  @override
  String get help => 'Համոզվեք, որ նպատակային սարքը նույնպես նույն Wi-Fi ցանցում է։';
  @override
  String get placeItems => 'Տեղադրեք կիսվելիք տարրերը։';
}

// Path: settingsTab
class _TranslationsSettingsTabHy extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Կարգավորումներ';
  @override
  late final _TranslationsSettingsTabGeneralHy general = _TranslationsSettingsTabGeneralHy._(_root);
  @override
  late final _TranslationsSettingsTabReceiveHy receive = _TranslationsSettingsTabReceiveHy._(_root);
  @override
  late final _TranslationsSettingsTabSendHy send = _TranslationsSettingsTabSendHy._(_root);
  @override
  late final _TranslationsSettingsTabNetworkHy network = _TranslationsSettingsTabNetworkHy._(_root);
  @override
  late final _TranslationsSettingsTabOtherHy other = _TranslationsSettingsTabOtherHy._(_root);
  @override
  String get advancedSettings => 'Ընդլայնված կարգավորումներ';
}

// Path: troubleshootPage
class _TranslationsTroubleshootPageHy extends TranslationsTroubleshootPageEn {
  _TranslationsTroubleshootPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Խնդիրների լուծում';
  @override
  String get subTitle => 'Հավելվածը չի՞ աշխատում սպասվածի պես։ Այստեղ կգտնեք որոշ տարածված խնդիրների լուծումներ։';
  @override
  String get solution => 'Լուծում՝';
  @override
  String get fixButton => 'Ուղղել ավտոմատ';
  @override
  late final _TranslationsTroubleshootPageFirewallHy firewall = _TranslationsTroubleshootPageFirewallHy._(_root);
  @override
  late final _TranslationsTroubleshootPageNoDiscoveryHy noDiscovery = _TranslationsTroubleshootPageNoDiscoveryHy._(_root);
  @override
  late final _TranslationsTroubleshootPageNoConnectionHy noConnection = _TranslationsTroubleshootPageNoConnectionHy._(_root);
}

// Path: networkInterfacesPage
class _TranslationsNetworkInterfacesPageHy extends TranslationsNetworkInterfacesPageEn {
  _TranslationsNetworkInterfacesPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ցանցային ինտերֆեյսներ';
  @override
  String get info =>
      'Լռելյայն LocalSend-ը օգտագործում է հասանելի բոլոր ինտերֆեյսները։ Այստեղ կարող եք բացառել անցանկալի ցանցերը։ Փոփոխությունները կիրառելու համար վերագործարկեք սերվերը։';
  @override
  String get preview => 'Նախադիտում';
  @override
  String get whitelist => 'Սպիտակ ցուցակ';
  @override
  String get blacklist => 'Սև ցուցակ';
}

// Path: receiveHistoryPage
class _TranslationsReceiveHistoryPageHy extends TranslationsReceiveHistoryPageEn {
  _TranslationsReceiveHistoryPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Պատմություն';
  @override
  String get openFolder => 'Բացել թղթապանակը';
  @override
  String get deleteHistory => 'Ջնջել պատմությունը';
  @override
  String get empty => 'Պատմությունը դատարկ է։';
  @override
  late final _TranslationsReceiveHistoryPageEntryActionsHy entryActions = _TranslationsReceiveHistoryPageEntryActionsHy._(_root);
}

// Path: apkPickerPage
class _TranslationsApkPickerPageHy extends TranslationsApkPickerPageEn {
  _TranslationsApkPickerPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Հավելվածներ (APK)';
  @override
  String get excludeSystemApps => 'Բացառել համակարգային հավելվածները';
  @override
  String get excludeAppsWithoutLaunchIntent => 'Բացառել չգործարկվող հավելվածները';
  @override
  String apps({required Object n}) => '${n} հավելված';
}

// Path: selectedFilesPage
class _TranslationsSelectedFilesPageHy extends TranslationsSelectedFilesPageEn {
  _TranslationsSelectedFilesPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'Ջնջել բոլորը';
}

// Path: receivePage
class _TranslationsReceivePageHy extends TranslationsReceivePageEn {
  _TranslationsReceivePageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
        n,
        one: 'ցանկանում է ուղարկել ձեզ ֆայլ',
        other: 'ցանկանում է ուղարկել ձեզ ${n} ֆայլ',
      );
  @override
  String get subTitleMessage => 'ուղարկել է ձեզ հաղորդագրություն․';
  @override
  String get subTitleLink => 'ուղարկել է ձեզ հղում․';
  @override
  String get canceled => 'Ուղարկողը չեղարկել է հարցումը։';
}

// Path: receiveOptionsPage
class _TranslationsReceiveOptionsPageHy extends TranslationsReceiveOptionsPageEn {
  _TranslationsReceiveOptionsPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընտրանքներ';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(LocalSend թղթապանակ)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'Ավտոմատ անջատվել է, քանի որ կան թղթապանակներ։';
}

// Path: sendPage
class _TranslationsSendPageHy extends TranslationsSendPageEn {
  _TranslationsSendPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'Սպասում ենք պատասխանին…';
  @override
  String get rejected => 'Ստացողը մերժեց հարցումը։';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'Ստացողը զբաղված է այլ հարցումով։';
}

// Path: progressPage
class _TranslationsProgressPageHy extends TranslationsProgressPageEn {
  _TranslationsProgressPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'Ֆայլերի ուղարկում';
  @override
  String get titleReceiving => 'Ֆայլերի ստացում';
  @override
  String get savedToGallery => 'Պահպանվել է պատկերասրահում';
  @override
  late final _TranslationsProgressPageTotalHy total = _TranslationsProgressPageTotalHy._(_root);
}

// Path: webSharePage
class _TranslationsWebSharePageHy extends TranslationsWebSharePageEn {
  _TranslationsWebSharePageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Կիսվել հղումով';
  @override
  String get loading => 'Սերվերի գործարկում…';
  @override
  String get stopping => 'Սերվերի կանգնեցում…';
  @override
  String get error => 'Սերվերի գործարկման ժամանակ տեղի ունեցավ սխալ։';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hy'))(
        n,
        one: 'Բացեք այս հղումը ձեր բրաուզերում․',
        other: 'Բացեք այս հղումներից մեկը ձեր բրաուզերում․',
      );
  @override
  String get requests => 'Հարցումներ';
  @override
  String get noRequests => 'Դեռ հարցումներ չկան։';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'Ավտոմատ ընդունել հարցումները';
  @override
  String get requirePin => 'Պահանջել PIN';
  @override
  String pinHint({required Object pin}) => 'PIN կոդը՝ "${pin}"';
  @override
  String get encryptionHint => 'LocalSend-ը օգտագործում է ինքնահաստատված սերտիֆիկատ․ անհրաժեշտ է այն ընդունել ձեր բրաուզերում։';
  @override
  String pendingRequests({required Object n}) => 'Սպասվող հարցումներ՝ ${n}';
}

// Path: aboutPage
class _TranslationsAboutPageHy extends TranslationsAboutPageEn {
  _TranslationsAboutPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend-ի մասին';
  @override
  List<String> get description => [
        'LocalSend-ը անվճար, բաց կոդով հավելված է, որը թույլ է տալիս անվտանգ կիսվել ֆայլերով և հաղորդագրություններով մոտակայքում գտնվող սարքերի հետ ձեր տեղական ցանցով՝ առանց ինտերնետի։',
        'Հավելվածը հասանելի է Android, iOS, macOS, Windows և Linux հարթակներում։ Դուք կարող եք գտնել բոլոր ներբեռնման տարբերակները պաշտոնական գլխավոր էջում',
      ];
  @override
  String get author => 'Հեղինակ';
  @override
  String get contributors => 'Ներդրողներ';
  @override
  String get packagers => 'Փաթեթավորողներ';
  @override
  String get translators => 'Թարգմանիչներ';
}

// Path: donationPage
class _TranslationsDonationPageHy extends TranslationsDonationPageEn {
  _TranslationsDonationPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Նվիրաբերել';
  @override
  String get info => 'LocalSend-ը անվճար է, բաց կոդով և առանց գովազդի։ Եթե հավանում եք հավելվածը, կարող եք աջակցել զարգացմանը նվիրատվությամբ։';
  @override
  String donate({required Object amount}) => 'Նվիրաբերել ${amount}';
  @override
  String get thanks => 'Շատ շնորհակալ ենք։';
  @override
  String get restore => 'Վերականգնել գնումը';
}

// Path: changelogPage
class _TranslationsChangelogPageHy extends TranslationsChangelogPageEn {
  _TranslationsChangelogPageHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Փոփոխությունների մատյան';
}

// Path: aliasGenerator
class _TranslationsAliasGeneratorHy extends TranslationsAliasGeneratorEn {
  _TranslationsAliasGeneratorHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
        'Հմայիչ',
        'Գեղեցիկ',
        'Մեծ',
        'Պայծառ',
        'Մաքուր',
        'Խելացի',
        'Թույն',
        'Քաղցրիկ',
        'Խորամանկ',
        'Վճռական',
        'Էներգիայով լի',
        'Արդյունավետ',
        'Ֆանտաստիկ',
        'Արագ',
        'Գերազանց',
        'Թարմ',
        'Լավ',
        'Շքեղ',
        'Հիանալի',
        'Սիմպատիկ',
        'Թեժ',
        'Բարի',
        'Սիրելի',
        'Միստիկ',
        'Կոկիկ',
        'Հաճելի',
        'Համբերատար',
        'Գեղեցիկ',
        'Հզոր',
        'Հարուստ',
        'Գաղտնի',
        'Խելացի',
        'Ամուր',
        'Հատուկ',
        'Ռազմավարական',
        'Ուժեղ',
        'Կոկիկ',
        'Իմաստուն',
      ];
  @override
  List<String> get fruits => [
        'Խնձոր',
        'Ավոկադո',
        'Բանան',
        'Մոշ',
        'Հապալաս',
        'Բրոկոլի',
        'Գազար',
        'Բալ',
        'Կոկոս',
        'Խաղող',
        'Կիտրոն',
        'Հազար',
        'Մանգո',
        'Սեխ',
        'Սունկ',
        'Սոխ',
        'Նարինջ',
        'Պապայա',
        'Դեղձ',
        'Տանձ',
        'Անանաս',
        'Կարտոֆիլ',
        'Դդում',
        'Ազնվամորի',
        'Ելակ',
        'Լոլիկ',
      ];

  /// Որոշ լեզուներում ածականը պետք է լինի վերջինը։
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _TranslationsDialogsHy extends TranslationsDialogsEn {
  _TranslationsDialogsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsDialogsAddFileHy addFile = _TranslationsDialogsAddFileHy._(_root);
  @override
  late final _TranslationsDialogsOpenFileHy openFile = _TranslationsDialogsOpenFileHy._(_root);
  @override
  late final _TranslationsDialogsAddressInputHy addressInput = _TranslationsDialogsAddressInputHy._(_root);
  @override
  late final _TranslationsDialogsCancelSessionHy cancelSession = _TranslationsDialogsCancelSessionHy._(_root);
  @override
  late final _TranslationsDialogsCannotOpenFileHy cannotOpenFile = _TranslationsDialogsCannotOpenFileHy._(_root);
  @override
  late final _TranslationsDialogsEncryptionDisabledNoticeHy encryptionDisabledNotice = _TranslationsDialogsEncryptionDisabledNoticeHy._(_root);
  @override
  late final _TranslationsDialogsErrorDialogHy errorDialog = _TranslationsDialogsErrorDialogHy._(_root);
  @override
  late final _TranslationsDialogsFavoriteDialogHy favoriteDialog = _TranslationsDialogsFavoriteDialogHy._(_root);
  @override
  late final _TranslationsDialogsFavoriteDeleteDialogHy favoriteDeleteDialog = _TranslationsDialogsFavoriteDeleteDialogHy._(_root);
  @override
  late final _TranslationsDialogsFavoriteEditDialogHy favoriteEditDialog = _TranslationsDialogsFavoriteEditDialogHy._(_root);
  @override
  late final _TranslationsDialogsFileInfoHy fileInfo = _TranslationsDialogsFileInfoHy._(_root);
  @override
  late final _TranslationsDialogsFileNameInputHy fileNameInput = _TranslationsDialogsFileNameInputHy._(_root);
  @override
  late final _TranslationsDialogsHistoryClearDialogHy historyClearDialog = _TranslationsDialogsHistoryClearDialogHy._(_root);
  @override
  late final _TranslationsDialogsLocalNetworkUnauthorizedHy localNetworkUnauthorized = _TranslationsDialogsLocalNetworkUnauthorizedHy._(_root);
  @override
  late final _TranslationsDialogsMessageInputHy messageInput = _TranslationsDialogsMessageInputHy._(_root);
  @override
  late final _TranslationsDialogsNoFilesHy noFiles = _TranslationsDialogsNoFilesHy._(_root);
  @override
  late final _TranslationsDialogsNoPermissionHy noPermission = _TranslationsDialogsNoPermissionHy._(_root);
  @override
  late final _TranslationsDialogsNotAvailableOnPlatformHy notAvailableOnPlatform = _TranslationsDialogsNotAvailableOnPlatformHy._(_root);
  @override
  late final _TranslationsDialogsQrHy qr = _TranslationsDialogsQrHy._(_root);
  @override
  late final _TranslationsDialogsQuickActionsHy quickActions = _TranslationsDialogsQuickActionsHy._(_root);
  @override
  late final _TranslationsDialogsQuickSaveNoticeHy quickSaveNotice = _TranslationsDialogsQuickSaveNoticeHy._(_root);
  @override
  late final _TranslationsDialogsQuickSaveFromFavoritesNoticeHy quickSaveFromFavoritesNotice =
      _TranslationsDialogsQuickSaveFromFavoritesNoticeHy._(_root);
  @override
  late final _TranslationsDialogsPinHy pin = _TranslationsDialogsPinHy._(_root);
  @override
  late final _TranslationsDialogsSendModeHelpHy sendModeHelp = _TranslationsDialogsSendModeHelpHy._(_root);
  @override
  late final _TranslationsDialogsZoomHy zoom = _TranslationsDialogsZoomHy._(_root);
}

// Path: sanitization
class _TranslationsSanitizationHy extends TranslationsSanitizationEn {
  _TranslationsSanitizationHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'Ֆայլի անունը չի կարող լինել դատարկ';
  @override
  String get invalid => 'Ֆայլի անվանումը պարունակում է անթույլատրելի նիշեր';
}

// Path: tray
class _TranslationsTrayHy extends TranslationsTrayEn {
  _TranslationsTrayHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'Փակել LocalSend-ը';
  @override
  String get closeWindows => 'Ելք';
}

// Path: web
class _TranslationsWebHy extends TranslationsWebEn {
  _TranslationsWebHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'Մուտքագրեք PIN-ը';
  @override
  String get invalidPin => 'Սխալ PIN';
  @override
  String get tooManyAttempts => 'Չափազանց շատ փորձ';
  @override
  String get rejected => 'Մերժված';
  @override
  String get files => 'Ֆայլեր';
  @override
  String get fileName => 'Ֆայլի անուն';
  @override
  String get size => 'Չափ';
}

// Path: assetPicker
class _TranslationsAssetPickerHy extends TranslationsAssetPickerEn {
  _TranslationsAssetPickerHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Հաստատել';
  @override
  String get cancel => 'Չեղարկել';
  @override
  String get edit => 'Խմբագրել';
  @override
  String get gifIndicator => 'GIF';
  @override
  String get loadFailed => 'Բեռնումը ձախողվեց';
  @override
  String get original => 'Բնօրինակ';
  @override
  String get preview => 'Նախադիտում';
  @override
  String get select => 'Ընտրել';
  @override
  String get emptyList => 'Դատարկ ցուցակ';
  @override
  String get unSupportedAssetType => 'Չաջակցվող ֆայլի տեսակ։';
  @override
  String get unableToAccessAll => 'Հնարավոր չէ մուտք գործել սարքի բոլոր ֆայլեր';
  @override
  String get viewingLimitedAssetsTip => 'Տեսանելի են միայն հավելվածին հասանելի ֆայլերն ու ալբոմները։';
  @override
  String get changeAccessibleLimitedAssets => 'Սեղմեք՝ թարմացնելու հասանելի ֆայլերը';
  @override
  String get accessAllTip =>
      'Հավելվածը կարող է մուտք գործել սարքի վրա գտնվող միայն որոշ ֆայլերի: Անցեք համակարգի կարգավորումներ և թույլ տվեք հավելվածին մուտք գործել սարքի վրա գտնվող բոլոր մեդիա ֆայլերին:';
  @override
  String get goToSystemSettings => 'Բացել համակարգի կարգավորումները';
  @override
  String get accessLimitedAssets => 'Շարունակել սահմանափակ մուտքով';
  @override
  String get accessiblePathName => 'Հասանելի ֆայլեր';
  @override
  String get sTypeAudioLabel => 'Ձայնային';
  @override
  String get sTypeImageLabel => 'Պատկեր';
  @override
  String get sTypeVideoLabel => 'Տեսանյութ';
  @override
  String get sTypeOtherLabel => 'Այլ մեդիա';
  @override
  String get sActionPlayHint => 'նվագարկել';
  @override
  String get sActionPreviewHint => 'նախադիտել';
  @override
  String get sActionSelectHint => 'ընտրել';
  @override
  String get sActionSwitchPathLabel => 'փոխել ուղին';
  @override
  String get sActionUseCameraHint => 'օգտ. տեսախցիկը';
  @override
  String get sNameDurationLabel => 'տևողություն';
  @override
  String get sUnitAssetCountLabel => 'քանակ';
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxHy extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP՝';
  @override
  String get port => 'Պորտ՝';
  @override
  String get alias => 'Սարքի անուն՝';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveHy extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Ընտրյալներ';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionHy extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընտրություն';
  @override
  String files({required Object files}) => 'Ֆայլեր՝ ${files}';
  @override
  String size({required Object size}) => 'Չափ՝ ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerHy extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Ֆայլ';
  @override
  String get folder => 'Թղթապանակ';
  @override
  String get media => 'Մեդիա';
  @override
  String get text => 'Տեքստ';
  @override
  String get app => 'Հավելված';
  @override
  String get clipboard => 'Տեղադրել';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesHy extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Մեկ ստացող';
  @override
  String get multiple => 'Բազմաթիվ ստացողներ';
  @override
  String get link => 'Կիսվել հղումով';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralHy extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընդհանուր';
  @override
  String get brightness => 'Թեմա';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsHy brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsHy._(_root);
  @override
  String get color => 'Գույն';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsHy colorOptions = _TranslationsSettingsTabGeneralColorOptionsHy._(_root);
  @override
  String get language => 'Լեզու';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsHy languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsHy._(_root);
  @override
  String get saveWindowPlacement => 'Պահպանել պատուհանի դիրքը ելքից հետո';
  @override
  String get saveWindowPlacementWindows => 'Պահպանել պատուհանի դիրքը փակելուց հետո';
  @override
  String get minimizeToTray => 'Փակելիս մինիմալիզացնել System Tray/մենյուի տողում';
  @override
  String get launchAtStartup => 'Ավտոմատ գործարկել մուտքից հետո';
  @override
  String get launchMinimized => 'Ավտոմատ գործարկում՝ թաքցված';
  @override
  String get showInContextMenu => 'Ցուցադրել LocalSend-ը համատեքստային մենյուում';
  @override
  String get animations => 'Անիմացիաներ';
}

// Path: settingsTab.receive
class _TranslationsSettingsTabReceiveHy extends TranslationsSettingsTabReceiveEn {
  _TranslationsSettingsTabReceiveHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ստանալ';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'Ավտոմատ ավարտ';
  @override
  String get destination => 'Պահպանել թղթապանակում';
  @override
  String get downloads => '(Ներբեռնումներ)';
  @override
  String get saveToGallery => 'Պահպանել մեդիան պատկերասրահում';
  @override
  String get saveToHistory => 'Պահպանել պատմության մեջ';
}

// Path: settingsTab.send
class _TranslationsSettingsTabSendHy extends TranslationsSettingsTabSendEn {
  _TranslationsSettingsTabSendHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկել';
  @override
  String get shareViaLinkAutoAccept => 'Ավտոմատ ընդունել հարցումները «Կիսվել հղումով» ռեժիմում';
}

// Path: settingsTab.network
class _TranslationsSettingsTabNetworkHy extends TranslationsSettingsTabNetworkEn {
  _TranslationsSettingsTabNetworkHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ցանց';
  @override
  String get needRestart => 'Վերագործարկեք սերվերը՝ կարգավորումները կիրառելու համար։';
  @override
  String get server => 'Սերվեր';
  @override
  String get alias => 'Սարքի անուն';
  @override
  String get deviceType => 'Սարքի տեսակ';
  @override
  String get deviceModel => 'Սարքի մոդել';
  @override
  String get port => 'Պորտ';
  @override
  String get network => 'Ցանց';
  @override
  late final _TranslationsSettingsTabNetworkNetworkOptionsHy networkOptions = _TranslationsSettingsTabNetworkNetworkOptionsHy._(_root);
  @override
  String get discoveryTimeout => 'Հայտնաբերման ժամանակի սպառում';
  @override
  String get useSystemName => 'Օգտագործել համակարգի անունը';
  @override
  String get generateRandomAlias => 'Գեներացնել պատահական անուն';
  @override
  String portWarning({required Object defaultPort}) =>
      'Այլ սարքերը կարող են չհայտնաբերել ձեզ, քանի որ օգտագործում եք անհատական պորտ (լռելյայն՝ ${defaultPort})։';
  @override
  String get encryption => 'Գաղտնագրում';
  @override
  String get multicastGroup => 'Multicast հասցե';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'Այլ սարքերը կարող են չհայտնաբերել ձեզ, քանի որ օգտագործում եք անհատական multicast հասցե (լռելյայն՝ ${defaultMulticast})։';
}

// Path: settingsTab.other
class _TranslationsSettingsTabOtherHy extends TranslationsSettingsTabOtherEn {
  _TranslationsSettingsTabOtherHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Այլ';
  @override
  String get support => 'Աջակցել LocalSend-ին';
  @override
  String get donate => 'Նվիրաբերել';
  @override
  String get privacyPolicy => 'Գաղտնիության քաղաքականություն';
  @override
  String get termsOfUse => 'Օգտագործման պայմաններ';
}

// Path: troubleshootPage.firewall
class _TranslationsTroubleshootPageFirewallHy extends TranslationsTroubleshootPageFirewallEn {
  _TranslationsTroubleshootPageFirewallHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Այս սարքը կարող է ֆայլեր ուղարկել այլ սարքերի, բայց այլ սարքերը չեն կարող ֆայլեր ուղարկել այս սարքին։';
  @override
  String solution({required Object port}) =>
      'Սա, ամենայն հավանականությամբ, firewall-ի խնդիր է։ Դուք կարող եք լուծել այս խնդիրը՝ թույլատրելով մուտքային միացումները (UDP և TCP) ${port} պորտի համար։';
  @override
  String get openFirewall => 'Բացել firewall-ը';
}

// Path: troubleshootPage.noDiscovery
class _TranslationsTroubleshootPageNoDiscoveryHy extends TranslationsTroubleshootPageNoDiscoveryEn {
  _TranslationsTroubleshootPageNoDiscoveryHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Այս սարքը չի գտնում այլ սարքեր։';
  @override
  String get solution =>
      'Համոզվեք, որ բոլոր սարքերը նույն Wi-Fi ցանցում են և ունեն նույն կարգավորումները (պորտ, multicast հասցե, գաղտնագրում)։ Կարող եք ձեռքով մուտքագրել նպատակային սարքի IP հասցեն։ Եթե դա աշխատի, ավելացրեք սարքը ընտրյալներին՝ ապագայում ավտոմատ հայտնաբերման համար։';
}

// Path: troubleshootPage.noConnection
class _TranslationsTroubleshootPageNoConnectionHy extends TranslationsTroubleshootPageNoConnectionEn {
  _TranslationsTroubleshootPageNoConnectionHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'Սարքերը չեն գտնում միմյանց և չեն կիսվում ֆայլերով։';
  @override
  String get solution =>
      'Եթե խնդիրը երկու կողմում էլ կա, համոզվեք, որ երկու սարքերն էլ նույն Wi-Fi ցանցում են ու միևնույն կարգավորումներով։ Հնարավոր է ցանցը արգելում է մասնակիցների միջև կապը AP Isolation-ի պատճառով․ անջատեք այդ տարբերակը երթուղիչում։';
}

// Path: receiveHistoryPage.entryActions
class _TranslationsReceiveHistoryPageEntryActionsHy extends TranslationsReceiveHistoryPageEntryActionsEn {
  _TranslationsReceiveHistoryPageEntryActionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'Բացել ֆայլը';
  @override
  String get showInFolder => 'Ցուցադրել թղթապանակում';
  @override
  String get info => 'Տեղեկություն';
  @override
  String get deleteFromHistory => 'Ջնջել պատմությունից';
}

// Path: progressPage.total
class _TranslationsProgressPageTotalHy extends TranslationsProgressPageTotalEn {
  _TranslationsProgressPageTotalHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsProgressPageTotalTitleHy title = _TranslationsProgressPageTotalTitleHy._(_root);
  @override
  String count({required Object curr, required Object n}) => 'Ֆայլեր՝ ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'Չափ՝ ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'Արագություն՝ ${speed}/վ';
}

// Path: dialogs.addFile
class _TranslationsDialogsAddFileHy extends TranslationsDialogsAddFileEn {
  _TranslationsDialogsAddFileHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ավելացնել ընտրությանը';
  @override
  String get content => 'Ի՞նչ եք ցանկանում ավելացնել։';
}

// Path: dialogs.openFile
class _TranslationsDialogsOpenFileHy extends TranslationsDialogsOpenFileEn {
  _TranslationsDialogsOpenFileHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Բացել ֆայլը';
  @override
  String get content => 'Բացե՞լ ստացված ֆայլը։';
}

// Path: dialogs.addressInput
class _TranslationsDialogsAddressInputHy extends TranslationsDialogsAddressInputEn {
  _TranslationsDialogsAddressInputHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մուտքագրել հասցե';
  @override
  String get hashtag => 'Հեշթեգ';
  @override
  String get ip => 'IP հասցե';
  @override
  String get recentlyUsed => 'Վերջին օգտագործված․ ';
}

// Path: dialogs.cancelSession
class _TranslationsDialogsCancelSessionHy extends TranslationsDialogsCancelSessionEn {
  _TranslationsDialogsCancelSessionHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Չեղարկել փոխանցումը';
  @override
  String get content => 'Իրո՞ք չեղարկե՞լ ֆայլերի փոխանցումը։';
}

// Path: dialogs.cannotOpenFile
class _TranslationsDialogsCannotOpenFileHy extends TranslationsDialogsCannotOpenFileEn {
  _TranslationsDialogsCannotOpenFileHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Հնարավոր չէ բացել ֆայլը';
  @override
  String content({required Object file}) => 'Չհաջողվեց բացել «${file}»․ ֆայլը տեղափոխվա՞ծ, վերանվանվա՞ծ կամ ջնջվա՞ծ է։';
}

// Path: dialogs.encryptionDisabledNotice
class _TranslationsDialogsEncryptionDisabledNoticeHy extends TranslationsDialogsEncryptionDisabledNoticeEn {
  _TranslationsDialogsEncryptionDisabledNoticeHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գաղտնագրումը անջատված է';
  @override
  String get content => 'Կապը հիմա կատարվում է չգաղտնագրված HTTP-ով։ HTTPS օգտագործելու համար կրկին միացրեք գաղտնագրումը։';
}

// Path: dialogs.errorDialog
class _TranslationsDialogsErrorDialogHy extends TranslationsDialogsErrorDialogEn {
  _TranslationsDialogsErrorDialogHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _TranslationsDialogsFavoriteDialogHy extends TranslationsDialogsFavoriteDialogEn {
  _TranslationsDialogsFavoriteDialogHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ընտրյալներ';
  @override
  String get noFavorites => 'Դեռ ընտրյալ սարքեր չկան։';
  @override
  String get addFavorite => 'Ավելացնել';
}

// Path: dialogs.favoriteDeleteDialog
class _TranslationsDialogsFavoriteDeleteDialogHy extends TranslationsDialogsFavoriteDeleteDialogEn {
  _TranslationsDialogsFavoriteDeleteDialogHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ջնջել ընտրյալներից';
  @override
  String content({required Object name}) => 'Ջնջե՞լ «${name}» սարքը ընտրյալներից։';
}

// Path: dialogs.favoriteEditDialog
class _TranslationsDialogsFavoriteEditDialogHy extends TranslationsDialogsFavoriteEditDialogEn {
  _TranslationsDialogsFavoriteEditDialogHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'Ավելացնել ընտրյալներին';
  @override
  String get titleEdit => 'Կարգավորումներ';
  @override
  String get name => 'Սարքի անուն';
  @override
  String get auto => '(ավտո)';
  @override
  String get ip => 'IP հասցե';
  @override
  String get port => 'Պորտ';
}

// Path: dialogs.fileInfo
class _TranslationsDialogsFileInfoHy extends TranslationsDialogsFileInfoEn {
  _TranslationsDialogsFileInfoHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ֆայլի տեղեկություն';
  @override
  String get fileName => 'Ֆայլի անուն՝';
  @override
  String get path => 'Ուղի՝';
  @override
  String get size => 'Չափ՝';
  @override
  String get sender => 'Ուղարկող՝';
  @override
  String get time => 'Ժամ՝';
}

// Path: dialogs.fileNameInput
class _TranslationsDialogsFileNameInputHy extends TranslationsDialogsFileNameInputEn {
  _TranslationsDialogsFileNameInputHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մուտքագրել ֆայլի անունը';
  @override
  String original({required Object original}) => 'Բնօրինակ՝ ${original}';
}

// Path: dialogs.historyClearDialog
class _TranslationsDialogsHistoryClearDialogHy extends TranslationsDialogsHistoryClearDialogEn {
  _TranslationsDialogsHistoryClearDialogHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մաքրել պատմությունը';
  @override
  String get content => 'Ջնջե՞լ ամբողջ պատմությունը։';
}

// Path: dialogs.localNetworkUnauthorized
class _TranslationsDialogsLocalNetworkUnauthorizedHy extends TranslationsDialogsLocalNetworkUnauthorizedEn {
  _TranslationsDialogsLocalNetworkUnauthorizedHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description =>
      'Առանց տեղական ցանցը սկանելու թույլտվության LocalSend-ը չի կարող գտնել այլ սարքեր։ Խնդրում ենք տրամադրել այս թույլտվությունը կարգավորումներում:';
  @override
  String get gotoSettings => 'Կարգավորումներ';
}

// Path: dialogs.messageInput
class _TranslationsDialogsMessageInputHy extends TranslationsDialogsMessageInputEn {
  _TranslationsDialogsMessageInputHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Գրել հաղորդագրություն';
  @override
  String get multiline => 'Բազմատող';
}

// Path: dialogs.noFiles
class _TranslationsDialogsNoFilesHy extends TranslationsDialogsNoFilesEn {
  _TranslationsDialogsNoFilesHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ֆայլեր ընտրված չեն';
  @override
  String get content => 'Ընտրեք առնվազն մեկ ֆայլ։';
}

// Path: dialogs.noPermission
class _TranslationsDialogsNoPermissionHy extends TranslationsDialogsNoPermissionEn {
  _TranslationsDialogsNoPermissionHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Թույլտվություն չկա';
  @override
  String get content => 'Չեք տրամադրել անհրաժեշտ թույլտվությունները։ Խնդրում ենք տրամադրել դրանք կարգավորումներում։';
}

// Path: dialogs.notAvailableOnPlatform
class _TranslationsDialogsNotAvailableOnPlatformHy extends TranslationsDialogsNotAvailableOnPlatformEn {
  _TranslationsDialogsNotAvailableOnPlatformHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մատչելի չէ';
  @override
  String get content => 'Այս հնարավորությունը հասանելի է միայն հետևյալ հարթակներում․';
}

// Path: dialogs.qr
class _TranslationsDialogsQrHy extends TranslationsDialogsQrEn {
  _TranslationsDialogsQrHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR կոդ';
}

// Path: dialogs.quickActions
class _TranslationsDialogsQuickActionsHy extends TranslationsDialogsQuickActionsEn {
  _TranslationsDialogsQuickActionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Արագ գործողություններ';
  @override
  String get counter => 'Հաշվիչ';
  @override
  String get prefix => 'Նախածանց';
  @override
  String get padZero => 'Լրացնել զրոներով';
  @override
  String get sortBeforeCount => 'Նախ դասավորել այբեցական (A–Z)';
  @override
  String get random => 'Պատահական';
}

// Path: dialogs.quickSaveNotice
class _TranslationsDialogsQuickSaveNoticeHy extends TranslationsDialogsQuickSaveNoticeEn {
  _TranslationsDialogsQuickSaveNoticeHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'Ֆայլերի հարցումները այժմ ընդունվում են ավտոմատ։ Ուշադիր եղեք․ ցանցի բոլոր օգտվողները կարող են ուղարկել ձեզ ֆայլեր։';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _TranslationsDialogsQuickSaveFromFavoritesNoticeHy extends TranslationsDialogsQuickSaveFromFavoritesNoticeEn {
  _TranslationsDialogsQuickSaveFromFavoritesNoticeHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
        'Հիմա ընտրյալ սարքերից եկող հարցումները ընդունվում են ավտոմատ։',
        'Զգուշացում․ սա լիովին անվտանգ չէ, քանի որ հաքերը, ունենալով ձեր որևէ ընտրյալ սարքի «ֆինգերպրինթը», կարող է անարգել ուղարկել ֆայլեր։',
        'Այնուհանդերձ, սա ավելի անվտանգ է, քան թույլ տալը, որ ցանցի ցանկացած օգտվող անարգել ուղարկի ֆայլեր։',
      ];
}

// Path: dialogs.pin
class _TranslationsDialogsPinHy extends TranslationsDialogsPinEn {
  _TranslationsDialogsPinHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Մուտքագրեք PIN-ը';
}

// Path: dialogs.sendModeHelp
class _TranslationsDialogsSendModeHelpHy extends TranslationsDialogsSendModeHelpEn {
  _TranslationsDialogsSendModeHelpHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ուղարկման ռեժիմներ';
  @override
  String get single => 'Ուղարկում է մեկ ստացողի։ Ավարտից հետո ընտրությունը կմաքրվի։';
  @override
  String get multiple => 'Ուղարկում է մի քանի ստացողների։ Ավարտից հետո ընտրությունը չի մաքրվի։';
  @override
  String get link => 'Առանց LocalSend-ի օգտվողները կարող են ներբեռնել ընտրված ֆայլերը՝ բացելով հղումը բրաուզերում։';
}

// Path: dialogs.zoom
class _TranslationsDialogsZoomHy extends TranslationsDialogsZoomEn {
  _TranslationsDialogsZoomHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsHy extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
  @override
  String get dark => 'Մուգ';
  @override
  String get light => 'Լուսավոր';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsHy extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsHy extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Համակարգ';
}

// Path: settingsTab.network.networkOptions
class _TranslationsSettingsTabNetworkNetworkOptionsHy extends TranslationsSettingsTabNetworkNetworkOptionsEn {
  _TranslationsSettingsTabNetworkNetworkOptionsHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'Բոլորը';
  @override
  String get filtered => 'Զտված';
}

// Path: progressPage.total.title
class _TranslationsProgressPageTotalTitleHy extends TranslationsProgressPageTotalTitleEn {
  _TranslationsProgressPageTotalTitleHy._(TranslationsHy root)
      : this._root = root,
        super.internal(root);

  final TranslationsHy _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'Ընդհանուր առաջընթաց (${time})';
  @override
  String get finishedError => 'Ավարտվել է սխալով';
  @override
  String get canceledSender => 'Չեղարկվել է ուղարկողի կողմից';
  @override
  String get canceledReceiver => 'Չեղարկվել է ստացողի կողմից';
}
