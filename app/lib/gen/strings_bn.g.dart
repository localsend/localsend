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
class TranslationsBn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsBn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.bn,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <bn>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsBn _root = this; // ignore: unused_field

  @override
  TranslationsBn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBn(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => 'বাংলা';
  @override
  String get appName => 'লোকালসেন্ড';
  @override
  late final _Translations$general$bn general = _Translations$general$bn._(_root);
  @override
  late final _Translations$receiveTab$bn receiveTab = _Translations$receiveTab$bn._(_root);
  @override
  late final _Translations$sendTab$bn sendTab = _Translations$sendTab$bn._(_root);
  @override
  late final _Translations$settingsTab$bn settingsTab = _Translations$settingsTab$bn._(_root);
  @override
  late final _Translations$troubleshootPage$bn troubleshootPage = _Translations$troubleshootPage$bn._(_root);
  @override
  late final _Translations$networkInterfacesPage$bn networkInterfacesPage = _Translations$networkInterfacesPage$bn._(_root);
  @override
  late final _Translations$receiveHistoryPage$bn receiveHistoryPage = _Translations$receiveHistoryPage$bn._(_root);
  @override
  late final _Translations$apkPickerPage$bn apkPickerPage = _Translations$apkPickerPage$bn._(_root);
  @override
  late final _Translations$selectedFilesPage$bn selectedFilesPage = _Translations$selectedFilesPage$bn._(_root);
  @override
  late final _Translations$receivePage$bn receivePage = _Translations$receivePage$bn._(_root);
  @override
  late final _Translations$receiveOptionsPage$bn receiveOptionsPage = _Translations$receiveOptionsPage$bn._(_root);
  @override
  late final _Translations$sendPage$bn sendPage = _Translations$sendPage$bn._(_root);
  @override
  late final _Translations$progressPage$bn progressPage = _Translations$progressPage$bn._(_root);
  @override
  late final _Translations$webSharePage$bn webSharePage = _Translations$webSharePage$bn._(_root);
  @override
  late final _Translations$aboutPage$bn aboutPage = _Translations$aboutPage$bn._(_root);
  @override
  late final _Translations$donationPage$bn donationPage = _Translations$donationPage$bn._(_root);
  @override
  late final _Translations$changelogPage$bn changelogPage = _Translations$changelogPage$bn._(_root);
  @override
  late final _Translations$aliasGenerator$bn aliasGenerator = _Translations$aliasGenerator$bn._(_root);
  @override
  late final _Translations$dialogs$bn dialogs = _Translations$dialogs$bn._(_root);
  @override
  late final _Translations$sanitization$bn sanitization = _Translations$sanitization$bn._(_root);
  @override
  late final _Translations$tray$bn tray = _Translations$tray$bn._(_root);
  @override
  late final _Translations$web$bn web = _Translations$web$bn._(_root);
  @override
  late final _Translations$assetPicker$bn assetPicker = _Translations$assetPicker$bn._(_root);
}

// Path: general
class _Translations$general$bn extends Translations$general$en {
  _Translations$general$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'অ্যাকসেপ্ট করুন';
  @override
  String get accepted => 'অ্যাকসেপ্টেড';
  @override
  String get add => 'অ্যাড করুন';
  @override
  String get advanced => 'আডভান্স';
  @override
  String get cancel => 'ক্যানসেল করুন';
  @override
  String get close => 'বন্ধ করুন';
  @override
  String get confirm => 'কনফার্ম করুন';
  @override
  String get continueStr => 'চালিয়ে যান';
  @override
  String get copy => 'কপি করুন';
  @override
  String get copiedToClipboard => 'ক্লিপবোর্ডে কপি করা হয়েছে';
  @override
  String get decline => 'প্রত্যাখ্যান করুন';
  @override
  String get done => 'সম্পন্ন';
  @override
  String get delete => 'ডিলিট';
  @override
  String get edit => 'এডিট';
  @override
  String get error => 'ভুল হয়েছে';
  @override
  String get example => 'উদাহরণ';
  @override
  String get files => 'ফাইল গুলো';
  @override
  String get finished => 'শেষ হয়েছে';
  @override
  String get hide => 'হাইড করুন';
  @override
  String get off => 'বন্ধ';
  @override
  String get offline => 'অফলাইন';
  @override
  String get on => 'চালু';
  @override
  String get online => 'অনলাইন';
  @override
  String get open => 'খুলুন';
  @override
  String get queue => 'কিউ';
  @override
  String get quickSave => 'কুইক সেভ করুন';
  @override
  String get quickSaveFromFavorites => '"ফেভারিট"দের জন্য কুইক সেভ করুন';
  @override
  String get renamed => 'নাম পরিবর্তন করা হয়েছে';
  @override
  String get reset => 'রিসেট করুন';
  @override
  String get restart => 'পুনরায় চালু করুন';
  @override
  String get settings => 'সেটিংস';
  @override
  String get skipped => 'স্কিপ করা হয়েছে';
  @override
  String get start => 'শুরু করুন';
  @override
  String get stop => 'বন্ধ করুন';
  @override
  String get save => 'সেভ করুন';
  @override
  String get unchanged => 'অপরিবর্তিত';
  @override
  String get unknown => 'আননোন';
  @override
  String get noItemInClipboard => 'ক্লিপবোর্ডে কোনো আইটেম নেই।';
}

// Path: receiveTab
class _Translations$receiveTab$bn extends Translations$receiveTab$en {
  _Translations$receiveTab$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'রিসিভ';
  @override
  late final _Translations$receiveTab$infoBox$bn infoBox = _Translations$receiveTab$infoBox$bn._(_root);
  @override
  late final _Translations$receiveTab$quickSave$bn quickSave = _Translations$receiveTab$quickSave$bn._(_root);
}

// Path: sendTab
class _Translations$sendTab$bn extends Translations$sendTab$en {
  _Translations$sendTab$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সেন্ড';
  @override
  late final _Translations$sendTab$selection$bn selection = _Translations$sendTab$selection$bn._(_root);
  @override
  late final _Translations$sendTab$picker$bn picker = _Translations$sendTab$picker$bn._(_root);
  @override
  String get shareIntentInfo => 'আরো সহজে ফাইল সিলেক্ট করার জন্য আপনার মোবাইলের "Share" ফিচারটি ব্যবহার করতে পারেন।';
  @override
  String get nearbyDevices => 'কাছাকাছি থাকা ডিভাইস';
  @override
  String get thisDevice => 'এই ডিভাইস';
  @override
  String get scan => 'ডিভাইস স্ক্যান করুন';
  @override
  String get manualSending => 'ম্যানুয়াল সেন্ডিং';
  @override
  String get sendMode => 'সেন্ড মোড';
  @override
  late final _Translations$sendTab$sendModes$bn sendModes = _Translations$sendTab$sendModes$bn._(_root);
  @override
  String get sendModeHelp => 'ব্যাখ্যা';
  @override
  String get help => 'অনুগ্রহ করে নিশ্চিত করুন যে পছন্দসই লক্ষ্যটিও একই ওয়াইফাই নেটওয়ার্কে রয়েছে।';
  @override
  String get placeItems => 'শেয়ার করার জন্য আইটেম রাখুন।';
}

// Path: settingsTab
class _Translations$settingsTab$bn extends Translations$settingsTab$en {
  _Translations$settingsTab$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সেটিংস';
  @override
  late final _Translations$settingsTab$general$bn general = _Translations$settingsTab$general$bn._(_root);
  @override
  late final _Translations$settingsTab$receive$bn receive = _Translations$settingsTab$receive$bn._(_root);
  @override
  late final _Translations$settingsTab$send$bn send = _Translations$settingsTab$send$bn._(_root);
  @override
  late final _Translations$settingsTab$network$bn network = _Translations$settingsTab$network$bn._(_root);
  @override
  late final _Translations$settingsTab$other$bn other = _Translations$settingsTab$other$bn._(_root);
  @override
  String get advancedSettings => 'আডভান্স সেটিংস';
}

// Path: troubleshootPage
class _Translations$troubleshootPage$bn extends Translations$troubleshootPage$en {
  _Translations$troubleshootPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ট্রাবলশুট';
  @override
  String get subTitle => 'অ্যাপটি আশানুরূপ কাজ না করলে, এখানে আপনি কিছু সাধারণ সমাধান পেতে পারেন।';
  @override
  String get solution => 'সমাধান:';
  @override
  String get fixButton => 'অটোমেটিকালি ঠিক করুন';
  @override
  late final _Translations$troubleshootPage$firewall$bn firewall = _Translations$troubleshootPage$firewall$bn._(_root);
  @override
  late final _Translations$troubleshootPage$noDiscovery$bn noDiscovery = _Translations$troubleshootPage$noDiscovery$bn._(_root);
  @override
  late final _Translations$troubleshootPage$noConnection$bn noConnection = _Translations$troubleshootPage$noConnection$bn._(_root);
}

// Path: networkInterfacesPage
class _Translations$networkInterfacesPage$bn extends Translations$networkInterfacesPage$en {
  _Translations$networkInterfacesPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'নেটওয়ার্ক ইন্টারফেস';
  @override
  String get info =>
      'LocalSend সব অ্যাভেলেবেল নেটওয়ার্ক ইন্টারফেস ব্যবহার করে। আপনি এখানে অপ্রয়োজনীয় নেটওয়ার্ক বাদ দিতে পারেন। কোন পরিবর্তন আনলে সার্ভারটি পুনরায় চালু করতে হবে।';
  @override
  String get preview => 'প্রিভিউ';
  @override
  String get whitelist => 'হোয়াইটলিস্ট';
  @override
  String get blacklist => 'ব্ল্যাকলিস্ট';
}

// Path: receiveHistoryPage
class _Translations$receiveHistoryPage$bn extends Translations$receiveHistoryPage$en {
  _Translations$receiveHistoryPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'হিস্ট্রি';
  @override
  String get openFolder => 'ফোল্ডার খুলুন';
  @override
  String get deleteHistory => 'হিস্ট্রি ক্লিয়ার করুন';
  @override
  String get empty => 'হিস্ট্রি খালি।';
  @override
  late final _Translations$receiveHistoryPage$entryActions$bn entryActions = _Translations$receiveHistoryPage$entryActions$bn._(_root);
}

// Path: apkPickerPage
class _Translations$apkPickerPage$bn extends Translations$apkPickerPage$en {
  _Translations$apkPickerPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'অ্যাপস (এপিকে)';
  @override
  String get excludeSystemApps => 'সিস্টেম অ্যাপ বাদ দিন';
  @override
  String get excludeAppsWithoutLaunchIntent => 'অ-লঞ্চযোগ্য অ্যাপগুলি বাদ দিন';
  @override
  String apps({required Object n}) => '${n} অ্যাপ্স';
}

// Path: selectedFilesPage
class _Translations$selectedFilesPage$bn extends Translations$selectedFilesPage$en {
  _Translations$selectedFilesPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAll => 'সব ডিলিট করুন';
}

// Path: receivePage
class _Translations$receivePage$bn extends Translations$receivePage$en {
  _Translations$receivePage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String subTitle({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bn'))(
    n,
    one: 'আপনাকে একটি ফাইল পাঠাতে চায়',
    other: 'আপনাকে ${n}টি ফাইল পাঠাতে চায়',
  );
  @override
  String get subTitleMessage => 'আপনাকে একটি মেসেজ পাঠিয়েছে:';
  @override
  String get subTitleLink => 'আপনাকে একটি লিঙ্ক পাঠিয়েছে:';
  @override
  String get canceled => 'সেন্ডার রিকুয়েস্টটি ক্যানসেল করেছে।';
}

// Path: receiveOptionsPage
class _Translations$receiveOptionsPage$bn extends Translations$receiveOptionsPage$en {
  _Translations$receiveOptionsPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'অপশনসমূহ';
  @override
  String get destination => _root.settingsTab.receive.destination;
  @override
  String get appDirectory => '(${_root.appName} folder)';
  @override
  String get saveToGallery => _root.settingsTab.receive.saveToGallery;
  @override
  String get saveToGalleryOff => 'অটোমেটিকালি বন্ধ কারণ ডিরেক্টরি আছে.';
}

// Path: sendPage
class _Translations$sendPage$bn extends Translations$sendPage$en {
  _Translations$sendPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => 'রেস্পন্সের অপেক্ষায়…';
  @override
  String get rejected => 'রিসিভার রিকুয়েস্টটি ক্যানসেল করেছে।';
  @override
  String get tooManyAttempts => _root.web.tooManyAttempts;
  @override
  String get busy => 'রিসিভার রিকুয়েস্টটি আরেকটি রিকুয়েস্টে ব্যস্ত।';
}

// Path: progressPage
class _Translations$progressPage$bn extends Translations$progressPage$en {
  _Translations$progressPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get titleSending => 'ফাইল সেন্ড হচ্ছে';
  @override
  String get titleReceiving => 'ফাইল রিসিভ করা হচ্ছে';
  @override
  String get savedToGallery => 'Photos এ সেভ করা হয়েছে';
  @override
  late final _Translations$progressPage$total$bn total = _Translations$progressPage$total$bn._(_root);
  @override
  late final _Translations$progressPage$remainingTime$bn remainingTime = _Translations$progressPage$remainingTime$bn._(_root);
}

// Path: webSharePage
class _Translations$webSharePage$bn extends Translations$webSharePage$en {
  _Translations$webSharePage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'লিঙ্কের মাধ্যমে শেয়ার করুন';
  @override
  String get loading => 'সার্ভার চালু করা হচ্ছে…';
  @override
  String get stopping => 'সার্ভার বন্ধ করা হচ্ছে…';
  @override
  String get error => 'সার্ভার চালু করার সময় একটি সমস্যা হয়েছে৷';
  @override
  String openLink({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('bn'))(
    n,
    one: 'ব্রাউজারে এই লিঙ্কটি খুলুন:',
    other: 'ব্রাউজারে এই লিঙ্কগুলির একটি খুলুন:',
  );
  @override
  String get requests => 'রিকুয়েস্ট';
  @override
  String get noRequests => 'এখনো কোনো রিকুয়েস্ট নেই.';
  @override
  String get encryption => _root.settingsTab.network.encryption;
  @override
  String get autoAccept => 'রিকুয়েস্ট অটো এক্সেপ্ট করুন';
  @override
  String get requirePin => 'পিন প্রয়োজন';
  @override
  String pinHint({required Object pin}) => 'পিনটি "${pin}"';
  @override
  String get encryptionHint => 'LocalSend একটি সেল্ফ-সাইন্ড সার্টিফিকেট ব্যবহার করে। আপনাকে ব্রাউজারে এটি একসেপ্ট করতে হবে।';
  @override
  String pendingRequests({required Object n}) => 'রিকুয়েস্ট অপেক্ষারত: ${n}';
}

// Path: aboutPage
class _Translations$aboutPage$bn extends Translations$aboutPage$en {
  _Translations$aboutPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'LocalSend সম্পর্কে';
  @override
  List<String> get description => [
    'LocalSend হল একটি ফ্রী, ওপেন সোর্স অ্যাপ যা ইন্টারনেট ছাড়াই আপনার লোকাল নেটওয়ার্কের ডিভাইসগুলির সাথে ফাইল এবং মেসেজ নিরাপদে শেয়ার করতে দেয়৷',
    'এই অ্যাপটি Android, iOS, macOS, Windows এবং Linux-এ অ্যাভেলেবেল। আপনি অফিসিয়াল হোমপেজে সব ডাউনলোড অপশন খুঁজে পাবেন।',
  ];
  @override
  String get author => 'লেখক';
  @override
  String get contributors => 'অবদানকারী';
  @override
  String get packagers => 'প্যাকেজেস';
  @override
  String get translators => 'অনুবাদক';
}

// Path: donationPage
class _Translations$donationPage$bn extends Translations$donationPage$en {
  _Translations$donationPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ডোনেট';
  @override
  String get info =>
      'LocalSend ফ্রী, ওপেন সোর্স এবং কোনো অ্যাড ছাড়াই। আপনি যদি অ্যাপটি পছন্দ করেন তবে আপনি একটি ডোনেশন দিয়ে ডেভেলপমেন্টকে সাপোর্ট করতে পারেন।';
  @override
  String donate({required Object amount}) => 'ডোনেট ${amount}';
  @override
  String get thanks => 'আপনাকে অনেক ধন্যবাদ!';
  @override
  String get restore => 'পারচেজ রিস্টোর';
}

// Path: changelogPage
class _Translations$changelogPage$bn extends Translations$changelogPage$en {
  _Translations$changelogPage$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'চেঞ্জলগ';
}

// Path: aliasGenerator
class _Translations$aliasGenerator$bn extends Translations$aliasGenerator$en {
  _Translations$aliasGenerator$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  List<String> get adjectives => [
    'আরাধ্য',
    'সুন্দর',
    'বড়',
    'উজ্জ্বল',
    'পরিষ্কার',
    'চতুর',
    'ঠান্ডা',
    'চতুর',
    'ধূর্ত',
    'নির্ধারিত',
    'অনলস',
    'দক্ষ',
    'অসাধারণ',
    'দ্রুত',
    'ভালো',
    'তাজা',
    'ভাল',
    'চমৎকার',
    'দারুণ',
    'সুদর্শন',
    'গরম',
    'দয়াময়',
    'সুন্দর',
    'রহস্যময়',
    'পরিচ্ছন্ন',
    'সুন্দর',
    'রোগী',
    'সুন্দর',
    'ক্ষমতাশালী',
    'ধনী',
    'গোপন',
    'স্মার্ট',
    'কঠিন',
    'বিশেষ',
    'কৌশলগত',
    'শক্তিশালী',
    'পরিপাটি',
    'জ্ঞানী',
  ];
  @override
  List<String> get fruits => [
    'আপেল',
    'অ্যাভোকাডো',
    'কলা',
    'ব্ল্যাকবেরি',
    'ব্লুবেরি',
    'ব্রকলি',
    'গাজর',
    'চেরি',
    'নারকেল',
    'আঙ্গুর',
    'লেবু',
    'লেটুস',
    'আম',
    'তরমুজ',
    'মাশরুম',
    'পেঁয়াজ',
    'কমলা',
    'পেঁপে',
    'পীচ',
    'নাশপাতি',
    'আনারস',
    'আলু',
    'কুমড়া',
    'রাস্পবেরি',
    'স্ট্রবেরি',
    'টমেটো',
  ];

  /// In some languages, the adjective must be last.
  @override
  String combination({required Object adjective, required Object fruit}) => '${adjective} ${fruit}';
}

// Path: dialogs
class _Translations$dialogs$bn extends Translations$dialogs$en {
  _Translations$dialogs$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$dialogs$addFile$bn addFile = _Translations$dialogs$addFile$bn._(_root);
  @override
  late final _Translations$dialogs$openFile$bn openFile = _Translations$dialogs$openFile$bn._(_root);
  @override
  late final _Translations$dialogs$addressInput$bn addressInput = _Translations$dialogs$addressInput$bn._(_root);
  @override
  late final _Translations$dialogs$cancelSession$bn cancelSession = _Translations$dialogs$cancelSession$bn._(_root);
  @override
  late final _Translations$dialogs$cannotOpenFile$bn cannotOpenFile = _Translations$dialogs$cannotOpenFile$bn._(_root);
  @override
  late final _Translations$dialogs$encryptionDisabledNotice$bn encryptionDisabledNotice = _Translations$dialogs$encryptionDisabledNotice$bn._(_root);
  @override
  late final _Translations$dialogs$errorDialog$bn errorDialog = _Translations$dialogs$errorDialog$bn._(_root);
  @override
  late final _Translations$dialogs$favoriteDialog$bn favoriteDialog = _Translations$dialogs$favoriteDialog$bn._(_root);
  @override
  late final _Translations$dialogs$favoriteDeleteDialog$bn favoriteDeleteDialog = _Translations$dialogs$favoriteDeleteDialog$bn._(_root);
  @override
  late final _Translations$dialogs$favoriteEditDialog$bn favoriteEditDialog = _Translations$dialogs$favoriteEditDialog$bn._(_root);
  @override
  late final _Translations$dialogs$fileInfo$bn fileInfo = _Translations$dialogs$fileInfo$bn._(_root);
  @override
  late final _Translations$dialogs$fileNameInput$bn fileNameInput = _Translations$dialogs$fileNameInput$bn._(_root);
  @override
  late final _Translations$dialogs$historyClearDialog$bn historyClearDialog = _Translations$dialogs$historyClearDialog$bn._(_root);
  @override
  late final _Translations$dialogs$localNetworkUnauthorized$bn localNetworkUnauthorized = _Translations$dialogs$localNetworkUnauthorized$bn._(_root);
  @override
  late final _Translations$dialogs$messageInput$bn messageInput = _Translations$dialogs$messageInput$bn._(_root);
  @override
  late final _Translations$dialogs$noFiles$bn noFiles = _Translations$dialogs$noFiles$bn._(_root);
  @override
  late final _Translations$dialogs$noPermission$bn noPermission = _Translations$dialogs$noPermission$bn._(_root);
  @override
  late final _Translations$dialogs$notAvailableOnPlatform$bn notAvailableOnPlatform = _Translations$dialogs$notAvailableOnPlatform$bn._(_root);
  @override
  late final _Translations$dialogs$qr$bn qr = _Translations$dialogs$qr$bn._(_root);
  @override
  late final _Translations$dialogs$quickActions$bn quickActions = _Translations$dialogs$quickActions$bn._(_root);
  @override
  late final _Translations$dialogs$quickSaveNotice$bn quickSaveNotice = _Translations$dialogs$quickSaveNotice$bn._(_root);
  @override
  late final _Translations$dialogs$quickSaveFromFavoritesNotice$bn quickSaveFromFavoritesNotice =
      _Translations$dialogs$quickSaveFromFavoritesNotice$bn._(_root);
  @override
  late final _Translations$dialogs$pin$bn pin = _Translations$dialogs$pin$bn._(_root);
  @override
  late final _Translations$dialogs$sendModeHelp$bn sendModeHelp = _Translations$dialogs$sendModeHelp$bn._(_root);
  @override
  late final _Translations$dialogs$zoom$bn zoom = _Translations$dialogs$zoom$bn._(_root);
}

// Path: sanitization
class _Translations$sanitization$bn extends Translations$sanitization$en {
  _Translations$sanitization$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get empty => 'ফাইলের নাম খালি রাখা যাবে না';
  @override
  String get invalid => 'ফাইলের নামে ইনভেলিড অক্ষর রয়েছে';
}

// Path: tray
class _Translations$tray$bn extends Translations$tray$en {
  _Translations$tray$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get open => _root.general.open;
  @override
  String get close => 'LocalSend থেকে বের হোন';
  @override
  String get closeWindows => 'সব উইন্ডো বন্ধ করুন';
}

// Path: web
class _Translations$web$bn extends Translations$web$en {
  _Translations$web$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get waiting => _root.sendPage.waiting;
  @override
  String get enterPin => 'পিন দিন';
  @override
  String get invalidPin => 'পিনটি সঠিক নয়';
  @override
  String get tooManyAttempts => 'অনেক বার ভুল পিন দেওয়া হয়েছে';
  @override
  String get rejected => 'রিজেক্টেড';
  @override
  String get files => 'ফাইলস';
  @override
  String get fileName => 'ফাইলের নাম';
  @override
  String get size => 'সাইজ';
}

// Path: assetPicker
class _Translations$assetPicker$bn extends Translations$assetPicker$en {
  _Translations$assetPicker$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'কনফার্ম করুন';
  @override
  String get cancel => 'ক্যানসেল করুন';
  @override
  String get edit => 'এডিট করুন';
  @override
  String get gifIndicator => 'জিফ';
  @override
  String get loadFailed => 'লোড করা যায়নি';
  @override
  String get original => 'অরিজিনাল';
  @override
  String get preview => 'প্রিভিউ';
  @override
  String get select => 'সিলেক্ট করুন';
  @override
  String get emptyList => 'খালি লিস্ট';
  @override
  String get unSupportedAssetType => 'আনসাপোর্টেড ফাইল টাইপ.';
  @override
  String get unableToAccessAll => 'ডিভাইসে সমস্ত ফাইল অ্যাক্সেস পাওয়া যায়নি';
  @override
  String get viewingLimitedAssetsTip => 'শুধুমাত্র অ্যাপে অ্যাক্সেসযোগ্য ফাইল এবং অ্যালবাম দেখুন.';
  @override
  String get changeAccessibleLimitedAssets => 'অ্যাক্সেসযোগ্য ফাইল আপডেট করতে ট্যাপ করুন';
  @override
  String get accessAllTip =>
      'অ্যাপ শুধুমাত্র ডিভাইসে কিছু ফাইল অ্যাক্সেস করতে পারে। সিস্টেম সেটিংসে যান এবং অ্যাপটিকে ডিভাইসের সমস্ত মিডিয়া অ্যাক্সেস করার পারমিশন দিন।';
  @override
  String get goToSystemSettings => 'সিস্টেম সেটিংসে যান';
  @override
  String get accessLimitedAssets => 'সীমিত অ্যাক্সেস দিয়ে চালিয়ে যান';
  @override
  String get accessiblePathName => 'অ্যাক্সেসযোগ্য ফাইল';
  @override
  String get sTypeAudioLabel => 'অডিও';
  @override
  String get sTypeImageLabel => 'ছবি';
  @override
  String get sTypeVideoLabel => 'ভিডিও';
  @override
  String get sTypeOtherLabel => 'অন্যান্য মিডিয়া';
  @override
  String get sActionPlayHint => 'প্লে';
  @override
  String get sActionPreviewHint => 'প্রিভিউ';
  @override
  String get sActionSelectHint => 'নির্বাচন করুন';
  @override
  String get sActionSwitchPathLabel => 'পাথ পরিবর্তন';
  @override
  String get sActionUseCameraHint => 'ক্যামেরা ব্যবহার করুন';
  @override
  String get sNameDurationLabel => 'ডিউরেশন';
  @override
  String get sUnitAssetCountLabel => 'কাউন্ট';
}

// Path: receiveTab.infoBox
class _Translations$receiveTab$infoBox$bn extends Translations$receiveTab$infoBox$en {
  _Translations$receiveTab$infoBox$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'আইপি:';
  @override
  String get port => 'পোর্ট:';
  @override
  String get alias => 'ডিভাইসের নাম:';
}

// Path: receiveTab.quickSave
class _Translations$receiveTab$quickSave$bn extends Translations$receiveTab$quickSave$en {
  _Translations$receiveTab$quickSave$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'ফেভারিট';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _Translations$sendTab$selection$bn extends Translations$sendTab$selection$en {
  _Translations$sendTab$selection$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সিলেকশন';
  @override
  String files({required Object files}) => 'ফাইলসমূহ: ${files}';
  @override
  String size({required Object size}) => 'সাইজ: ${size}';
}

// Path: sendTab.picker
class _Translations$sendTab$picker$bn extends Translations$sendTab$picker$en {
  _Translations$sendTab$picker$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'ফাইল';
  @override
  String get folder => 'ফোল্ডার';
  @override
  String get media => 'মিডিয়া';
  @override
  String get text => 'টেক্সট';
  @override
  String get app => 'আবেদন';
  @override
  String get clipboard => 'ক্লিপবোর্ড পেস্ট';
}

// Path: sendTab.sendModes
class _Translations$sendTab$sendModes$bn extends Translations$sendTab$sendModes$en {
  _Translations$sendTab$sendModes$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'একজন রিসিভার';
  @override
  String get multiple => 'একাধিক রিসিভার';
  @override
  String get link => 'লিঙ্কের মাধ্যমে শেয়ার করুন';
}

// Path: settingsTab.general
class _Translations$settingsTab$general$bn extends Translations$settingsTab$general$en {
  _Translations$settingsTab$general$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'জেনারেল';
  @override
  String get brightness => 'থিম';
  @override
  late final _Translations$settingsTab$general$brightnessOptions$bn brightnessOptions = _Translations$settingsTab$general$brightnessOptions$bn._(
    _root,
  );
  @override
  String get color => 'অ্যাপ কালার';
  @override
  late final _Translations$settingsTab$general$colorOptions$bn colorOptions = _Translations$settingsTab$general$colorOptions$bn._(_root);
  @override
  String get language => 'ভাষা';
  @override
  late final _Translations$settingsTab$general$languageOptions$bn languageOptions = _Translations$settingsTab$general$languageOptions$bn._(_root);
  @override
  String get saveWindowPlacement => 'বের হোন: উইন্ডো প্লেসমেন্ট সেভ করুন';
  @override
  String get saveWindowPlacementWindows => 'বের হবার পরে উইন্ডোর অবস্থান সেভ করুন';
  @override
  String get minimizeToTray => 'বের হোন: ট্রেতে মিনিমাইজ করুন';
  @override
  String get launchAtStartup => 'লগইন করার পরে অটোস্টার্ট করুন';
  @override
  String get launchMinimized => 'অটোস্টার্ট: হিডেন রেখে শুরু করুন';
  @override
  String get showInContextMenu => 'কনটেক্সট মেনুতে LocalSend দেখান';
  @override
  String get animations => 'অ্যানিমেশন';
}

// Path: settingsTab.receive
class _Translations$settingsTab$receive$bn extends Translations$settingsTab$receive$en {
  _Translations$settingsTab$receive$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'রিসিভ';
  @override
  String get quickSave => _root.general.quickSave;
  @override
  String get quickSaveFromFavorites => _root.general.quickSaveFromFavorites;
  @override
  String get requirePin => _root.webSharePage.requirePin;
  @override
  String get autoFinish => 'অটো ফিনিশ';
  @override
  String get destination => 'ডেস্টিনেশন';
  @override
  String get downloads => '(Downloads)';
  @override
  String get saveToGallery => 'মিডিয়া গ্যালারিতে সেভ করুন';
  @override
  String get saveToHistory => 'হিস্ট্রি সেভ করুন';
}

// Path: settingsTab.send
class _Translations$settingsTab$send$bn extends Translations$settingsTab$send$en {
  _Translations$settingsTab$send$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সেন্ড';
  @override
  String get shareViaLinkAutoAccept => '"Share via link" মোডের রিকুয়েস্ট অটো এক্সেপ্ট করুন';
}

// Path: settingsTab.network
class _Translations$settingsTab$network$bn extends Translations$settingsTab$network$en {
  _Translations$settingsTab$network$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'নেটওয়ার্ক';
  @override
  String get needRestart => 'সেটিংস অ্যাপ্লাই করতে সার্ভার রিস্টার্ট করুন!';
  @override
  String get server => 'সার্ভার';
  @override
  String get alias => 'ডিভাইসের নাম';
  @override
  String get deviceType => 'ডিভাইসের ধরন';
  @override
  String get deviceModel => 'ডিভাইস মডেল';
  @override
  String get port => 'পোর্ট';
  @override
  String get network => 'নেটওয়ার্ক';
  @override
  late final _Translations$settingsTab$network$networkOptions$bn networkOptions = _Translations$settingsTab$network$networkOptions$bn._(_root);
  @override
  String get discoveryTimeout => 'ডিসকভারি টাইমআউট';
  @override
  String get useSystemName => 'সিস্টেমের নাম ব্যবহার করুন';
  @override
  String get generateRandomAlias => 'এলিয়াস তৈরি করুন';
  @override
  String portWarning({required Object defaultPort}) =>
      'আপনি একটি কাস্টম পোর্ট ব্যবহার করছেন, তাই অন্য ডিভাইস থেকে এই ডিভাইসকে খুঁজে নাও পাওয়া যেতে পারে। (default: ${defaultPort})';
  @override
  String get encryption => 'এনক্রিপশন';
  @override
  String get multicastGroup => 'মাল্টিকাস্ট';
  @override
  String multicastGroupWarning({required Object defaultMulticast}) =>
      'আপনি একটি কাস্টম মাল্টিকাস্ট অ্যাড্রেস ব্যবহার করছেন যেই কারণে আপনি অন্য ডিভাইস দ্বারা স্ক্যান নাও হতে পারেন। (default: ${defaultMulticast})';
}

// Path: settingsTab.other
class _Translations$settingsTab$other$bn extends Translations$settingsTab$other$en {
  _Translations$settingsTab$other$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'অন্যান্য';
  @override
  String get support => 'লোকাল সেন্ডকে সাপোর্ট করুন';
  @override
  String get donate => 'ডোনেট';
  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';
  @override
  String get termsOfUse => 'ব্যবহারের শর্তাবলী';
}

// Path: troubleshootPage.firewall
class _Translations$troubleshootPage$firewall$bn extends Translations$troubleshootPage$firewall$en {
  _Translations$troubleshootPage$firewall$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'এই অ্যাপটি অন্য ডিভাইসে ফাইল পাঠাতে পারে কিন্তু অন্য ডিভাইস এই ডিভাইসে ফাইল পাঠাতে পারে না।';
  @override
  String solution({required Object port}) =>
      'এটি সম্ভবত একটি ফায়ারওয়াল সমস্যা। আপনি পোর্টে ইনকামিং কানেকশন (UDP এবং TCP) পারমিশন দিয়ে এটি ঠিক করতে পারেন ${port}.';
  @override
  String get openFirewall => 'ফায়ারওয়াল খুলুন';
}

// Path: troubleshootPage.noDiscovery
class _Translations$troubleshootPage$noDiscovery$bn extends Translations$troubleshootPage$noDiscovery$en {
  _Translations$troubleshootPage$noDiscovery$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'এই ডিভাইসটি অন্য ডিভাইস খুঁজতে পারতেছে না।';
  @override
  String get solution =>
      'সব ডিভাইস একই ওয়াই-ফাই নেটওয়ার্কে আছে তা নিশ্চিত করুন এবং একই কনফিগারেশন ব্যাবহার করছে (পোর্ট, মাল্টিকাস্ট অ্যাড্রেস, এনক্রিপশন)। টার্গেট ডিভাইসের আইপি ম্যানুয়ালি টাইপ করতে পারেন। যদি এটা কাজ করে, তাহলে ভবিষ্যতে এই ডিভাইসটি অটোমেটিকালি ডিসকভার করা হবে, তা নিশ্চিত করতে এই ডিভাইসটি ফেভারিটে অ্যাড করুন।';
}

// Path: troubleshootPage.noConnection
class _Translations$troubleshootPage$noConnection$bn extends Translations$troubleshootPage$noConnection$en {
  _Translations$troubleshootPage$noConnection$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get symptom => 'উভয় ডিভাইস একে অপরকে আবিষ্কার করতে পারে না বা তারা ফাইল ভাগ করতে পারে না।';
  @override
  String get solution =>
      'সমস্যা কি দুই দিকেই আছে? তারপরে আপনাকে নিশ্চিত করতে হবে যে উভয় ডিভাইস একই ওয়াইফাই নেটওয়ার্কে রয়েছে এবং একই কনফিগারেশন (পোর্ট, মাল্টিকাস্ট ঠিকানা, এনক্রিপশন) ভাগ করে নিয়েছে। ওয়াইফাই অংশগ্রহণকারীদের মধ্যে যোগাযোগের অনুমতি নাও দিতে পারে। এই ক্ষেত্রে, এই বিকল্পটি রাউটারে সক্রিয় করা আবশ্যক।';
}

// Path: receiveHistoryPage.entryActions
class _Translations$receiveHistoryPage$entryActions$bn extends Translations$receiveHistoryPage$entryActions$en {
  _Translations$receiveHistoryPage$entryActions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get open => 'ফাইল খুলুন';
  @override
  String get showInFolder => 'ফোল্ডারে দেখুন';
  @override
  String get info => 'ইনফো';
  @override
  String get deleteFromHistory => 'হিস্ট্রি থেকে মুছে ফেলুন';
}

// Path: progressPage.total
class _Translations$progressPage$total$bn extends Translations$progressPage$total$en {
  _Translations$progressPage$total$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$progressPage$total$title$bn title = _Translations$progressPage$total$title$bn._(_root);
  @override
  String count({required Object curr, required Object n}) => 'ফাইলগুলি: ${curr} / ${n}';
  @override
  String size({required Object curr, required Object n}) => 'সাইজ: ${curr} / ${n}';
  @override
  String speed({required Object speed}) => 'স্পীড: ${speed}/s';
}

// Path: progressPage.remainingTime
class _Translations$progressPage$remainingTime$bn extends Translations$progressPage$remainingTime$en {
  _Translations$progressPage$remainingTime$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations

  /// ঘন্টার জন্য 'h' এবং মিনিটের জন্য 'm' ব্যবহার করুন
  @override
  String hours({required Object h, required Object m}) => '${h}ঘণ্টা ${m}মিনিট';

  /// দিনের জন্য 'd', ঘন্টার জন্য 'h' এবং মিনিটের জন্য 'm' ব্যবহার করুন
  @override
  String days({required Object d, required Object h, required Object m}) => '${d}দিন ${h}ঘণ্টা ${m}মিনিট';

  @override
  String seconds({required Object n, required Object ss}) => '${n}:${ss}';
  @override
  String minutes({required Object n, required Object ss}) => '${n}:${ss}';
}

// Path: dialogs.addFile
class _Translations$dialogs$addFile$bn extends Translations$dialogs$addFile$en {
  _Translations$dialogs$addFile$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সিলেকশনে অ্যাড করুন';
  @override
  String get content => 'আপনি কি অ্যাড করতে চান?';
}

// Path: dialogs.openFile
class _Translations$dialogs$openFile$bn extends Translations$dialogs$openFile$en {
  _Translations$dialogs$openFile$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফাইল খুলুন';
  @override
  String get content => 'আপনি কি ফাইলটি খুলতে চান?';
}

// Path: dialogs.addressInput
class _Translations$dialogs$addressInput$bn extends Translations$dialogs$addressInput$en {
  _Translations$dialogs$addressInput$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'এড্রেস লিখুন';
  @override
  String get hashtag => 'হ্যাশট্যাগ';
  @override
  String get ip => 'আইপি অ্যাড্রেস';
  @override
  String get recentlyUsed => 'সম্প্রতি ব্যবহৃত: ';
}

// Path: dialogs.cancelSession
class _Translations$dialogs$cancelSession$bn extends Translations$dialogs$cancelSession$en {
  _Translations$dialogs$cancelSession$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফাইল ট্রান্সফার ক্যানসেল করুন';
  @override
  String get content => 'আপনি কি ফাইল ট্রান্সফার ক্যানসেল করতে চান?';
}

// Path: dialogs.cannotOpenFile
class _Translations$dialogs$cannotOpenFile$bn extends Translations$dialogs$cannotOpenFile$en {
  _Translations$dialogs$cannotOpenFile$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফাইলটি খোলা যাচ্ছে না';
  @override
  String content({required Object file}) => '"${file}" খোলা যায়নি। এই ফাইলটি কি সরানো হয়েছে, নাম পরিবর্তন বা মুছে ফেলা হয়েছে?';
}

// Path: dialogs.encryptionDisabledNotice
class _Translations$dialogs$encryptionDisabledNotice$bn extends Translations$dialogs$encryptionDisabledNotice$en {
  _Translations$dialogs$encryptionDisabledNotice$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'এনক্রিপশন বন্ধ করা হয়েছে';
  @override
  String get content => 'এখন কমিউনিকেশন আনএনক্রিপ্টেড HTTP প্রটোকলের মাধ্যমে করা হচ্ছে। HTTPS ব্যবহার করার জন্য আবার এনক্রিপশন চালু করুন।';
}

// Path: dialogs.errorDialog
class _Translations$dialogs$errorDialog$bn extends Translations$dialogs$errorDialog$en {
  _Translations$dialogs$errorDialog$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.error;
}

// Path: dialogs.favoriteDialog
class _Translations$dialogs$favoriteDialog$bn extends Translations$dialogs$favoriteDialog$en {
  _Translations$dialogs$favoriteDialog$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফেভারিট';
  @override
  String get noFavorites => 'এখনও কোন ফেভারিট ডিভাইস নেই.';
  @override
  String get addFavorite => 'যোগ করুন';
}

// Path: dialogs.favoriteDeleteDialog
class _Translations$dialogs$favoriteDeleteDialog$bn extends Translations$dialogs$favoriteDeleteDialog$en {
  _Translations$dialogs$favoriteDeleteDialog$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'যোগ করুনযোগ করুন';
  @override
  String content({required Object name}) => 'আপনি কি সত্যিই ফেভারিট থেকে মুছে ফেলতে চান "${name}"?';
}

// Path: dialogs.favoriteEditDialog
class _Translations$dialogs$favoriteEditDialog$bn extends Translations$dialogs$favoriteEditDialog$en {
  _Translations$dialogs$favoriteEditDialog$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get titleAdd => 'ফেভারিটে অ্যাড করুন';
  @override
  String get titleEdit => 'এডিট করুন';
  @override
  String get name => 'এলিয়াস';
  @override
  String get auto => '(auto)';
  @override
  String get ip => 'আইপি অ্যাড্রেস';
  @override
  String get port => 'পোর্ট';
}

// Path: dialogs.fileInfo
class _Translations$dialogs$fileInfo$bn extends Translations$dialogs$fileInfo$en {
  _Translations$dialogs$fileInfo$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফাইল ইনফো';
  @override
  String get fileName => 'ফাইলের নাম:';
  @override
  String get path => 'পাথ:';
  @override
  String get size => 'সাইজ:';
  @override
  String get sender => 'সেন্ডার:';
  @override
  String get time => 'সময়:';
}

// Path: dialogs.fileNameInput
class _Translations$dialogs$fileNameInput$bn extends Translations$dialogs$fileNameInput$en {
  _Translations$dialogs$fileNameInput$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ফাইলের নাম লিখুন';
  @override
  String original({required Object original}) => 'অরিজিনাল: ${original}';
}

// Path: dialogs.historyClearDialog
class _Translations$dialogs$historyClearDialog$bn extends Translations$dialogs$historyClearDialog$en {
  _Translations$dialogs$historyClearDialog$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'হিস্ট্রি ক্লিয়ার করুন';
  @override
  String get content => 'আপনি কি সব হিস্ট্রি ক্লিয়ার চান?';
}

// Path: dialogs.localNetworkUnauthorized
class _Translations$dialogs$localNetworkUnauthorized$bn extends Translations$dialogs$localNetworkUnauthorized$en {
  _Translations$dialogs$localNetworkUnauthorized$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.dialogs.noPermission.title;
  @override
  String get description => 'লোকাল নেটওয়ার্ক স্ক্যান করার পারমিশন ছাড়া LocalSend অন্য ডিভাইস খুঁজে পায় না। অনুগ্রহ করে সেটিংসে এই পারমিশনটি দিন।';
  @override
  String get gotoSettings => 'সেটিংস';
}

// Path: dialogs.messageInput
class _Translations$dialogs$messageInput$bn extends Translations$dialogs$messageInput$en {
  _Translations$dialogs$messageInput$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'মেসেজ লিখুন';
  @override
  String get multiline => 'মাল্টিলাইন';
}

// Path: dialogs.noFiles
class _Translations$dialogs$noFiles$bn extends Translations$dialogs$noFiles$en {
  _Translations$dialogs$noFiles$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'কোনো ফাইল সিলেক্ট করা হয়নি';
  @override
  String get content => 'অন্তত একটি ফাইল সিলেক্ট করুন।';
}

// Path: dialogs.noPermission
class _Translations$dialogs$noPermission$bn extends Translations$dialogs$noPermission$en {
  _Translations$dialogs$noPermission$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'পারমিশন নেই';
  @override
  String get content => 'আপনি প্রয়োজনীয় পারমিশন প্রদান করেননি। অনুগ্রহ করে সেটিংসে তাদের পারমিশন দিন।';
}

// Path: dialogs.notAvailableOnPlatform
class _Translations$dialogs$notAvailableOnPlatform$bn extends Translations$dialogs$notAvailableOnPlatform$en {
  _Translations$dialogs$notAvailableOnPlatform$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'পাওয়া যায় নি';
  @override
  String get content => 'এই ফিচার শুধুমাত্র উপলব্ধ:';
}

// Path: dialogs.qr
class _Translations$dialogs$qr$bn extends Translations$dialogs$qr$en {
  _Translations$dialogs$qr$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'QR কোড';
}

// Path: dialogs.quickActions
class _Translations$dialogs$quickActions$bn extends Translations$dialogs$quickActions$en {
  _Translations$dialogs$quickActions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'কুইক অ্যাকশনস';
  @override
  String get counter => 'কাউন্টার';
  @override
  String get prefix => 'উপসর্গ';
  @override
  String get padZero => 'শূন্য সহ প্যাড';
  @override
  String get sortBeforeCount => 'আগে থেকে বর্ণানুক্রমিকভাবে সাজান';
  @override
  String get random => 'র‍্যান্ডম';
}

// Path: dialogs.quickSaveNotice
class _Translations$dialogs$quickSaveNotice$bn extends Translations$dialogs$quickSaveNotice$en {
  _Translations$dialogs$quickSaveNotice$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSave;
  @override
  String get content => 'ফাইল অনুরোধ অটোমেটিকালি এক্সেপ্ট করা হয়। সচেতন থাকুন যেনা লোকাল নেটওয়ার্কের সবাই আপনাকে ফাইল পাঠাতে পারে।';
}

// Path: dialogs.quickSaveFromFavoritesNotice
class _Translations$dialogs$quickSaveFromFavoritesNotice$bn extends Translations$dialogs$quickSaveFromFavoritesNotice$en {
  _Translations$dialogs$quickSaveFromFavoritesNotice$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => _root.general.quickSaveFromFavorites;
  @override
  List<String> get content => [
    'আপনার ফেভারিট তালিকায় থাকা ডিভাইস থেকে ফাইল অটোমেটিক রিসিভ করা হয়।',
    'সতর্কতা! বর্তমানে, এটা সম্পূর্ণভাবে নিরাপদ নয়, কোন হ্যাকারের কাছে আপনার ফেভারিট তালিকার কোনও ডিভাইসের ফিঙ্গারপ্রিন্ট থাকে তাহলে সে সীমাবদ্ধতা ছাড়াই আপনাকে ফাইল পাঠাতে পারে।',
    'তবে, এই অপশনটি এখনও লোকাল নেটওয়ার্কের ব্যবহারকারীদের কোনও সীমাবদ্ধতা ছাড়াই আপনাকে ফাইল পাঠাতে দেয়।',
  ];
}

// Path: dialogs.pin
class _Translations$dialogs$pin$bn extends Translations$dialogs$pin$en {
  _Translations$dialogs$pin$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'পিন দিন';
}

// Path: dialogs.sendModeHelp
class _Translations$dialogs$sendModeHelp$bn extends Translations$dialogs$sendModeHelp$en {
  _Translations$dialogs$sendModeHelp$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'সেন্ড মোড';
  @override
  String get single => 'একজন প্রাপকের কাছে ফাইল পাঠায়। ফাইল স্থানান্তর সমাপ্ত হওয়ার পরে নির্বাচন পরিষ্কার করা হবে.';
  @override
  String get multiple => 'একাধিক প্রাপককে ফাইল পাঠায়। নির্বাচন সাফ করা হবে না।';
  @override
  String get link => 'যাদের LocalSend ইনস্টল করা নেই তারা ব্রাউজারে লিঙ্কটি খুলে ফাইলগুলি ডাউনলোড করতে পারবেন।';
}

// Path: dialogs.zoom
class _Translations$dialogs$zoom$bn extends Translations$dialogs$zoom$en {
  _Translations$dialogs$zoom$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'URL';
}

// Path: settingsTab.general.brightnessOptions
class _Translations$settingsTab$general$brightnessOptions$bn extends Translations$settingsTab$general$brightnessOptions$en {
  _Translations$settingsTab$general$brightnessOptions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'সিস্টেম';
  @override
  String get dark => 'ডার্ক';
  @override
  String get light => 'লাইট';
}

// Path: settingsTab.general.colorOptions
class _Translations$settingsTab$general$colorOptions$bn extends Translations$settingsTab$general$colorOptions$en {
  _Translations$settingsTab$general$colorOptions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'সিস্টেম';
  @override
  String get oled => 'ওলেড';
}

// Path: settingsTab.general.languageOptions
class _Translations$settingsTab$general$languageOptions$bn extends Translations$settingsTab$general$languageOptions$en {
  _Translations$settingsTab$general$languageOptions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'সিস্টেম';
}

// Path: settingsTab.network.networkOptions
class _Translations$settingsTab$network$networkOptions$bn extends Translations$settingsTab$network$networkOptions$en {
  _Translations$settingsTab$network$networkOptions$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String get all => 'সব';
  @override
  String get filtered => 'ফিল্টারড';
}

// Path: progressPage.total.title
class _Translations$progressPage$total$title$bn extends Translations$progressPage$total$title$en {
  _Translations$progressPage$total$title$bn._(TranslationsBn root) : this._root = root, super.internal(root);

  final TranslationsBn _root; // ignore: unused_field

  // Translations
  @override
  String sending({required Object time}) => 'মোট অগ্রগতি (${time})';
  @override
  String get finishedError => 'ত্রুটি সহ সমাপ্ত হয়েছে';
  @override
  String get canceledSender => 'সেন্ডারের দ্বারা ক্যানসেল করা হয়েছে';
  @override
  String get canceledReceiver => 'রিসিভার দ্বারা ক্যানসেল করা হয়েছে';
}
