// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_tab_vm.dart';

class SettingsTabVmMapper extends ClassMapperBase<SettingsTabVm> {
  SettingsTabVmMapper._();

  static SettingsTabVmMapper? _instance;
  static SettingsTabVmMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsTabVmMapper._());
      SettingsStateMapper.ensureInitialized();
      ServerStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsTabVm';

  static bool _$advanced(SettingsTabVm v) => v.advanced;
  static const Field<SettingsTabVm, bool> _f$advanced =
      Field('advanced', _$advanced);
  static TextEditingController _$aliasController(SettingsTabVm v) =>
      v.aliasController;
  static const Field<SettingsTabVm, TextEditingController> _f$aliasController =
      Field('aliasController', _$aliasController);
  static TextEditingController _$deviceModelController(SettingsTabVm v) =>
      v.deviceModelController;
  static const Field<SettingsTabVm, TextEditingController>
      _f$deviceModelController =
      Field('deviceModelController', _$deviceModelController);
  static TextEditingController _$portController(SettingsTabVm v) =>
      v.portController;
  static const Field<SettingsTabVm, TextEditingController> _f$portController =
      Field('portController', _$portController);
  static TextEditingController _$multicastController(SettingsTabVm v) =>
      v.multicastController;
  static const Field<SettingsTabVm, TextEditingController>
      _f$multicastController =
      Field('multicastController', _$multicastController);
  static SettingsState _$settings(SettingsTabVm v) => v.settings;
  static const Field<SettingsTabVm, SettingsState> _f$settings =
      Field('settings', _$settings);
  static ServerState? _$serverState(SettingsTabVm v) => v.serverState;
  static const Field<SettingsTabVm, ServerState> _f$serverState =
      Field('serverState', _$serverState);
  static DeviceInfoResult _$deviceInfo(SettingsTabVm v) => v.deviceInfo;
  static const Field<SettingsTabVm, DeviceInfoResult> _f$deviceInfo =
      Field('deviceInfo', _$deviceInfo);
  static List<ColorMode> _$colorModes(SettingsTabVm v) => v.colorModes;
  static const Field<SettingsTabVm, List<ColorMode>> _f$colorModes =
      Field('colorModes', _$colorModes);
  static void Function(BuildContext, ThemeMode) _$onChangeTheme(
          SettingsTabVm v) =>
      v.onChangeTheme;
  static const Field<SettingsTabVm, void Function(BuildContext, ThemeMode)>
      _f$onChangeTheme = Field('onChangeTheme', _$onChangeTheme);
  static void Function(ColorMode) _$onChangeColorMode(SettingsTabVm v) =>
      v.onChangeColorMode;
  static const Field<SettingsTabVm, void Function(ColorMode)>
      _f$onChangeColorMode = Field('onChangeColorMode', _$onChangeColorMode);
  static void Function(BuildContext) _$onTapLanguage(SettingsTabVm v) =>
      v.onTapLanguage;
  static const Field<SettingsTabVm, void Function(BuildContext)>
      _f$onTapLanguage = Field('onTapLanguage', _$onTapLanguage);
  static void Function(BuildContext) _$onTapRestartServer(SettingsTabVm v) =>
      v.onTapRestartServer;
  static const Field<SettingsTabVm, void Function(BuildContext)>
      _f$onTapRestartServer = Field('onTapRestartServer', _$onTapRestartServer);
  static void Function(BuildContext) _$onTapStartServer(SettingsTabVm v) =>
      v.onTapStartServer;
  static const Field<SettingsTabVm, void Function(BuildContext)>
      _f$onTapStartServer = Field('onTapStartServer', _$onTapStartServer);
  static void Function() _$onTapStopServer(SettingsTabVm v) =>
      v.onTapStopServer;
  static const Field<SettingsTabVm, void Function()> _f$onTapStopServer =
      Field('onTapStopServer', _$onTapStopServer);
  static void Function(bool) _$onTapAdvanced(SettingsTabVm v) =>
      v.onTapAdvanced;
  static const Field<SettingsTabVm, void Function(bool)> _f$onTapAdvanced =
      Field('onTapAdvanced', _$onTapAdvanced);
  static List<ThemeMode> _$themeModes(SettingsTabVm v) => v.themeModes;
  static const Field<SettingsTabVm, List<ThemeMode>> _f$themeModes =
      Field('themeModes', _$themeModes, mode: FieldMode.member);

  @override
  final Map<Symbol, Field<SettingsTabVm, dynamic>> fields = const {
    #advanced: _f$advanced,
    #aliasController: _f$aliasController,
    #deviceModelController: _f$deviceModelController,
    #portController: _f$portController,
    #multicastController: _f$multicastController,
    #settings: _f$settings,
    #serverState: _f$serverState,
    #deviceInfo: _f$deviceInfo,
    #colorModes: _f$colorModes,
    #onChangeTheme: _f$onChangeTheme,
    #onChangeColorMode: _f$onChangeColorMode,
    #onTapLanguage: _f$onTapLanguage,
    #onTapRestartServer: _f$onTapRestartServer,
    #onTapStartServer: _f$onTapStartServer,
    #onTapStopServer: _f$onTapStopServer,
    #onTapAdvanced: _f$onTapAdvanced,
    #themeModes: _f$themeModes,
  };

  static SettingsTabVm _instantiate(DecodingData data) {
    return SettingsTabVm(
        advanced: data.dec(_f$advanced),
        aliasController: data.dec(_f$aliasController),
        deviceModelController: data.dec(_f$deviceModelController),
        portController: data.dec(_f$portController),
        multicastController: data.dec(_f$multicastController),
        settings: data.dec(_f$settings),
        serverState: data.dec(_f$serverState),
        deviceInfo: data.dec(_f$deviceInfo),
        colorModes: data.dec(_f$colorModes),
        onChangeTheme: data.dec(_f$onChangeTheme),
        onChangeColorMode: data.dec(_f$onChangeColorMode),
        onTapLanguage: data.dec(_f$onTapLanguage),
        onTapRestartServer: data.dec(_f$onTapRestartServer),
        onTapStartServer: data.dec(_f$onTapStartServer),
        onTapStopServer: data.dec(_f$onTapStopServer),
        onTapAdvanced: data.dec(_f$onTapAdvanced));
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsTabVm fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsTabVm>(map);
  }

  static SettingsTabVm deserialize(String json) {
    return ensureInitialized().decodeJson<SettingsTabVm>(json);
  }
}

mixin SettingsTabVmMappable {
  String serialize() {
    return SettingsTabVmMapper.ensureInitialized()
        .encodeJson<SettingsTabVm>(this as SettingsTabVm);
  }

  Map<String, dynamic> toJson() {
    return SettingsTabVmMapper.ensureInitialized()
        .encodeMap<SettingsTabVm>(this as SettingsTabVm);
  }

  SettingsTabVmCopyWith<SettingsTabVm, SettingsTabVm, SettingsTabVm>
      get copyWith => _SettingsTabVmCopyWithImpl(
          this as SettingsTabVm, $identity, $identity);
  @override
  String toString() {
    return SettingsTabVmMapper.ensureInitialized()
        .stringifyValue(this as SettingsTabVm);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SettingsTabVmMapper.ensureInitialized()
                .isValueEqual(this as SettingsTabVm, other));
  }

  @override
  int get hashCode {
    return SettingsTabVmMapper.ensureInitialized()
        .hashValue(this as SettingsTabVm);
  }
}

extension SettingsTabVmValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsTabVm, $Out> {
  SettingsTabVmCopyWith<$R, SettingsTabVm, $Out> get $asSettingsTabVm =>
      $base.as((v, t, t2) => _SettingsTabVmCopyWithImpl(v, t, t2));
}

abstract class SettingsTabVmCopyWith<$R, $In extends SettingsTabVm, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SettingsStateCopyWith<$R, SettingsState, SettingsState> get settings;
  ServerStateCopyWith<$R, ServerState, ServerState>? get serverState;
  ListCopyWith<$R, ColorMode, ObjectCopyWith<$R, ColorMode, ColorMode>>
      get colorModes;
  $R call(
      {bool? advanced,
      TextEditingController? aliasController,
      TextEditingController? deviceModelController,
      TextEditingController? portController,
      TextEditingController? multicastController,
      SettingsState? settings,
      ServerState? serverState,
      DeviceInfoResult? deviceInfo,
      List<ColorMode>? colorModes,
      void Function(BuildContext, ThemeMode)? onChangeTheme,
      void Function(ColorMode)? onChangeColorMode,
      void Function(BuildContext)? onTapLanguage,
      void Function(BuildContext)? onTapRestartServer,
      void Function(BuildContext)? onTapStartServer,
      void Function()? onTapStopServer,
      void Function(bool)? onTapAdvanced});
  SettingsTabVmCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsTabVmCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsTabVm, $Out>
    implements SettingsTabVmCopyWith<$R, SettingsTabVm, $Out> {
  _SettingsTabVmCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsTabVm> $mapper =
      SettingsTabVmMapper.ensureInitialized();
  @override
  SettingsStateCopyWith<$R, SettingsState, SettingsState> get settings =>
      $value.settings.copyWith.$chain((v) => call(settings: v));
  @override
  ServerStateCopyWith<$R, ServerState, ServerState>? get serverState =>
      $value.serverState?.copyWith.$chain((v) => call(serverState: v));
  @override
  ListCopyWith<$R, ColorMode, ObjectCopyWith<$R, ColorMode, ColorMode>>
      get colorModes => ListCopyWith(
          $value.colorModes,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(colorModes: v));
  @override
  $R call(
          {bool? advanced,
          TextEditingController? aliasController,
          TextEditingController? deviceModelController,
          TextEditingController? portController,
          TextEditingController? multicastController,
          SettingsState? settings,
          Object? serverState = $none,
          DeviceInfoResult? deviceInfo,
          List<ColorMode>? colorModes,
          void Function(BuildContext, ThemeMode)? onChangeTheme,
          void Function(ColorMode)? onChangeColorMode,
          void Function(BuildContext)? onTapLanguage,
          void Function(BuildContext)? onTapRestartServer,
          void Function(BuildContext)? onTapStartServer,
          void Function()? onTapStopServer,
          void Function(bool)? onTapAdvanced}) =>
      $apply(FieldCopyWithData({
        if (advanced != null) #advanced: advanced,
        if (aliasController != null) #aliasController: aliasController,
        if (deviceModelController != null)
          #deviceModelController: deviceModelController,
        if (portController != null) #portController: portController,
        if (multicastController != null)
          #multicastController: multicastController,
        if (settings != null) #settings: settings,
        if (serverState != $none) #serverState: serverState,
        if (deviceInfo != null) #deviceInfo: deviceInfo,
        if (colorModes != null) #colorModes: colorModes,
        if (onChangeTheme != null) #onChangeTheme: onChangeTheme,
        if (onChangeColorMode != null) #onChangeColorMode: onChangeColorMode,
        if (onTapLanguage != null) #onTapLanguage: onTapLanguage,
        if (onTapRestartServer != null) #onTapRestartServer: onTapRestartServer,
        if (onTapStartServer != null) #onTapStartServer: onTapStartServer,
        if (onTapStopServer != null) #onTapStopServer: onTapStopServer,
        if (onTapAdvanced != null) #onTapAdvanced: onTapAdvanced
      }));
  @override
  SettingsTabVm $make(CopyWithData data) => SettingsTabVm(
      advanced: data.get(#advanced, or: $value.advanced),
      aliasController: data.get(#aliasController, or: $value.aliasController),
      deviceModelController:
          data.get(#deviceModelController, or: $value.deviceModelController),
      portController: data.get(#portController, or: $value.portController),
      multicastController:
          data.get(#multicastController, or: $value.multicastController),
      settings: data.get(#settings, or: $value.settings),
      serverState: data.get(#serverState, or: $value.serverState),
      deviceInfo: data.get(#deviceInfo, or: $value.deviceInfo),
      colorModes: data.get(#colorModes, or: $value.colorModes),
      onChangeTheme: data.get(#onChangeTheme, or: $value.onChangeTheme),
      onChangeColorMode:
          data.get(#onChangeColorMode, or: $value.onChangeColorMode),
      onTapLanguage: data.get(#onTapLanguage, or: $value.onTapLanguage),
      onTapRestartServer:
          data.get(#onTapRestartServer, or: $value.onTapRestartServer),
      onTapStartServer:
          data.get(#onTapStartServer, or: $value.onTapStartServer),
      onTapStopServer: data.get(#onTapStopServer, or: $value.onTapStopServer),
      onTapAdvanced: data.get(#onTapAdvanced, or: $value.onTapAdvanced));

  @override
  SettingsTabVmCopyWith<$R2, SettingsTabVm, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SettingsTabVmCopyWithImpl($value, $cast, t);
}
