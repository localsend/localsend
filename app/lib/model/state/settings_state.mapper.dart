// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_state.dart';

class SettingsStateMapper extends ClassMapperBase<SettingsState> {
  SettingsStateMapper._();

  static SettingsStateMapper? _instance;
  static SettingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsStateMapper._());
      DeviceTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsState';

  static String _$showToken(SettingsState v) => v.showToken;
  static const Field<SettingsState, String> _f$showToken =
      Field('showToken', _$showToken);
  static String _$alias(SettingsState v) => v.alias;
  static const Field<SettingsState, String> _f$alias = Field('alias', _$alias);
  static ThemeMode _$theme(SettingsState v) => v.theme;
  static const Field<SettingsState, ThemeMode> _f$theme =
      Field('theme', _$theme);
  static ColorMode _$colorMode(SettingsState v) => v.colorMode;
  static const Field<SettingsState, ColorMode> _f$colorMode =
      Field('colorMode', _$colorMode);
  static AppLocale? _$locale(SettingsState v) => v.locale;
  static const Field<SettingsState, AppLocale> _f$locale =
      Field('locale', _$locale);
  static int _$port(SettingsState v) => v.port;
  static const Field<SettingsState, int> _f$port = Field('port', _$port);
  static String _$multicastGroup(SettingsState v) => v.multicastGroup;
  static const Field<SettingsState, String> _f$multicastGroup =
      Field('multicastGroup', _$multicastGroup);
  static String? _$destination(SettingsState v) => v.destination;
  static const Field<SettingsState, String> _f$destination =
      Field('destination', _$destination);
  static bool _$saveToGallery(SettingsState v) => v.saveToGallery;
  static const Field<SettingsState, bool> _f$saveToGallery =
      Field('saveToGallery', _$saveToGallery);
  static bool _$saveToHistory(SettingsState v) => v.saveToHistory;
  static const Field<SettingsState, bool> _f$saveToHistory =
      Field('saveToHistory', _$saveToHistory);
  static bool _$quickSave(SettingsState v) => v.quickSave;
  static const Field<SettingsState, bool> _f$quickSave =
      Field('quickSave', _$quickSave);
  static bool _$autoFinish(SettingsState v) => v.autoFinish;
  static const Field<SettingsState, bool> _f$autoFinish =
      Field('autoFinish', _$autoFinish);
  static bool _$minimizeToTray(SettingsState v) => v.minimizeToTray;
  static const Field<SettingsState, bool> _f$minimizeToTray =
      Field('minimizeToTray', _$minimizeToTray);
  static bool _$launchAtStartup(SettingsState v) => v.launchAtStartup;
  static const Field<SettingsState, bool> _f$launchAtStartup =
      Field('launchAtStartup', _$launchAtStartup);
  static bool _$autoStartLaunchMinimized(SettingsState v) =>
      v.autoStartLaunchMinimized;
  static const Field<SettingsState, bool> _f$autoStartLaunchMinimized =
      Field('autoStartLaunchMinimized', _$autoStartLaunchMinimized);
  static bool _$https(SettingsState v) => v.https;
  static const Field<SettingsState, bool> _f$https = Field('https', _$https);
  static SendMode _$sendMode(SettingsState v) => v.sendMode;
  static const Field<SettingsState, SendMode> _f$sendMode =
      Field('sendMode', _$sendMode);
  static bool _$saveWindowPlacement(SettingsState v) => v.saveWindowPlacement;
  static const Field<SettingsState, bool> _f$saveWindowPlacement =
      Field('saveWindowPlacement', _$saveWindowPlacement);
  static bool _$enableAnimations(SettingsState v) => v.enableAnimations;
  static const Field<SettingsState, bool> _f$enableAnimations =
      Field('enableAnimations', _$enableAnimations);
  static DeviceType? _$deviceType(SettingsState v) => v.deviceType;
  static const Field<SettingsState, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static String? _$deviceModel(SettingsState v) => v.deviceModel;
  static const Field<SettingsState, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);

  @override
  final Map<Symbol, Field<SettingsState, dynamic>> fields = const {
    #showToken: _f$showToken,
    #alias: _f$alias,
    #theme: _f$theme,
    #colorMode: _f$colorMode,
    #locale: _f$locale,
    #port: _f$port,
    #multicastGroup: _f$multicastGroup,
    #destination: _f$destination,
    #saveToGallery: _f$saveToGallery,
    #saveToHistory: _f$saveToHistory,
    #quickSave: _f$quickSave,
    #autoFinish: _f$autoFinish,
    #minimizeToTray: _f$minimizeToTray,
    #launchAtStartup: _f$launchAtStartup,
    #autoStartLaunchMinimized: _f$autoStartLaunchMinimized,
    #https: _f$https,
    #sendMode: _f$sendMode,
    #saveWindowPlacement: _f$saveWindowPlacement,
    #enableAnimations: _f$enableAnimations,
    #deviceType: _f$deviceType,
    #deviceModel: _f$deviceModel,
  };

  static SettingsState _instantiate(DecodingData data) {
    return SettingsState(
        showToken: data.dec(_f$showToken),
        alias: data.dec(_f$alias),
        theme: data.dec(_f$theme),
        colorMode: data.dec(_f$colorMode),
        locale: data.dec(_f$locale),
        port: data.dec(_f$port),
        multicastGroup: data.dec(_f$multicastGroup),
        destination: data.dec(_f$destination),
        saveToGallery: data.dec(_f$saveToGallery),
        saveToHistory: data.dec(_f$saveToHistory),
        quickSave: data.dec(_f$quickSave),
        autoFinish: data.dec(_f$autoFinish),
        minimizeToTray: data.dec(_f$minimizeToTray),
        launchAtStartup: data.dec(_f$launchAtStartup),
        autoStartLaunchMinimized: data.dec(_f$autoStartLaunchMinimized),
        https: data.dec(_f$https),
        sendMode: data.dec(_f$sendMode),
        saveWindowPlacement: data.dec(_f$saveWindowPlacement),
        enableAnimations: data.dec(_f$enableAnimations),
        deviceType: data.dec(_f$deviceType),
        deviceModel: data.dec(_f$deviceModel));
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsState>(map);
  }

  static SettingsState deserialize(String json) {
    return ensureInitialized().decodeJson<SettingsState>(json);
  }
}

mixin SettingsStateMappable {
  String serialize() {
    return SettingsStateMapper.ensureInitialized()
        .encodeJson<SettingsState>(this as SettingsState);
  }

  Map<String, dynamic> toJson() {
    return SettingsStateMapper.ensureInitialized()
        .encodeMap<SettingsState>(this as SettingsState);
  }

  SettingsStateCopyWith<SettingsState, SettingsState, SettingsState>
      get copyWith => _SettingsStateCopyWithImpl(
          this as SettingsState, $identity, $identity);
  @override
  String toString() {
    return SettingsStateMapper.ensureInitialized()
        .stringifyValue(this as SettingsState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SettingsStateMapper.ensureInitialized()
                .isValueEqual(this as SettingsState, other));
  }

  @override
  int get hashCode {
    return SettingsStateMapper.ensureInitialized()
        .hashValue(this as SettingsState);
  }
}

extension SettingsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsState, $Out> {
  SettingsStateCopyWith<$R, SettingsState, $Out> get $asSettingsState =>
      $base.as((v, t, t2) => _SettingsStateCopyWithImpl(v, t, t2));
}

abstract class SettingsStateCopyWith<$R, $In extends SettingsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? showToken,
      String? alias,
      ThemeMode? theme,
      ColorMode? colorMode,
      AppLocale? locale,
      int? port,
      String? multicastGroup,
      String? destination,
      bool? saveToGallery,
      bool? saveToHistory,
      bool? quickSave,
      bool? autoFinish,
      bool? minimizeToTray,
      bool? launchAtStartup,
      bool? autoStartLaunchMinimized,
      bool? https,
      SendMode? sendMode,
      bool? saveWindowPlacement,
      bool? enableAnimations,
      DeviceType? deviceType,
      String? deviceModel});
  SettingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsState, $Out>
    implements SettingsStateCopyWith<$R, SettingsState, $Out> {
  _SettingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsState> $mapper =
      SettingsStateMapper.ensureInitialized();
  @override
  $R call(
          {String? showToken,
          String? alias,
          ThemeMode? theme,
          ColorMode? colorMode,
          Object? locale = $none,
          int? port,
          String? multicastGroup,
          Object? destination = $none,
          bool? saveToGallery,
          bool? saveToHistory,
          bool? quickSave,
          bool? autoFinish,
          bool? minimizeToTray,
          bool? launchAtStartup,
          bool? autoStartLaunchMinimized,
          bool? https,
          SendMode? sendMode,
          bool? saveWindowPlacement,
          bool? enableAnimations,
          Object? deviceType = $none,
          Object? deviceModel = $none}) =>
      $apply(FieldCopyWithData({
        if (showToken != null) #showToken: showToken,
        if (alias != null) #alias: alias,
        if (theme != null) #theme: theme,
        if (colorMode != null) #colorMode: colorMode,
        if (locale != $none) #locale: locale,
        if (port != null) #port: port,
        if (multicastGroup != null) #multicastGroup: multicastGroup,
        if (destination != $none) #destination: destination,
        if (saveToGallery != null) #saveToGallery: saveToGallery,
        if (saveToHistory != null) #saveToHistory: saveToHistory,
        if (quickSave != null) #quickSave: quickSave,
        if (autoFinish != null) #autoFinish: autoFinish,
        if (minimizeToTray != null) #minimizeToTray: minimizeToTray,
        if (launchAtStartup != null) #launchAtStartup: launchAtStartup,
        if (autoStartLaunchMinimized != null)
          #autoStartLaunchMinimized: autoStartLaunchMinimized,
        if (https != null) #https: https,
        if (sendMode != null) #sendMode: sendMode,
        if (saveWindowPlacement != null)
          #saveWindowPlacement: saveWindowPlacement,
        if (enableAnimations != null) #enableAnimations: enableAnimations,
        if (deviceType != $none) #deviceType: deviceType,
        if (deviceModel != $none) #deviceModel: deviceModel
      }));
  @override
  SettingsState $make(CopyWithData data) => SettingsState(
      showToken: data.get(#showToken, or: $value.showToken),
      alias: data.get(#alias, or: $value.alias),
      theme: data.get(#theme, or: $value.theme),
      colorMode: data.get(#colorMode, or: $value.colorMode),
      locale: data.get(#locale, or: $value.locale),
      port: data.get(#port, or: $value.port),
      multicastGroup: data.get(#multicastGroup, or: $value.multicastGroup),
      destination: data.get(#destination, or: $value.destination),
      saveToGallery: data.get(#saveToGallery, or: $value.saveToGallery),
      saveToHistory: data.get(#saveToHistory, or: $value.saveToHistory),
      quickSave: data.get(#quickSave, or: $value.quickSave),
      autoFinish: data.get(#autoFinish, or: $value.autoFinish),
      minimizeToTray: data.get(#minimizeToTray, or: $value.minimizeToTray),
      launchAtStartup: data.get(#launchAtStartup, or: $value.launchAtStartup),
      autoStartLaunchMinimized: data.get(#autoStartLaunchMinimized,
          or: $value.autoStartLaunchMinimized),
      https: data.get(#https, or: $value.https),
      sendMode: data.get(#sendMode, or: $value.sendMode),
      saveWindowPlacement:
          data.get(#saveWindowPlacement, or: $value.saveWindowPlacement),
      enableAnimations:
          data.get(#enableAnimations, or: $value.enableAnimations),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel));

  @override
  SettingsStateCopyWith<$R2, SettingsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SettingsStateCopyWithImpl($value, $cast, t);
}
