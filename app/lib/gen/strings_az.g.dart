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
  TranslationsAz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
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
  String get copiedToClipboard => 'Buferə Köçürüldü';
  @override
  String get decline => 'İmtina et';
  @override
  String get done => 'Bitdi';
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
  String get quickSave => 'Cəld Saxla';
  @override
  String get quickSaveFromFavorites => '"Sevimlilər" üçün cəld saxla';
  @override
  String get renamed => 'Təkrar adlandırıldı';
  @override
  String get reset => 'Dəyişiklikləri geri al';
  @override
  String get restart => 'Təkrar başlat';
  @override
  String get settings => 'Tənzimləmələr';
  @override
  String get skipped => 'Ötürüldü';
  @override
  String get start => 'Başlat';
  @override
  String get stop => 'Dayandır';
  @override
  String get save => 'Saxla';
  @override
  String get unchanged => 'Dəyişməmiş';
  @override
  String get unknown => 'Naməlum';
  @override
  String get noItemInClipboard => 'Buferdə element yoxdur.';
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
  String get alias => 'Cihaz adı:';
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
  String get title => 'Seçilmə';
  @override
  String files({required Object files}) => 'Fayllar: ${files}';
  @override
  String size({required Object size}) => 'Həcm: ${size}';
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
  String get link => 'Bağlantıdan paylaş';
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
