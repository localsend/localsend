import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';

part 'settings_tab_vm.mapper.dart';

@MappableClass()
class SettingsTabVm with SettingsTabVmMappable {
  final bool advanced;
  final TextEditingController aliasController;
  final TextEditingController deviceModelController;
  final TextEditingController portController;
  final TextEditingController multicastController;

  final SettingsState settings;
  final ServerState? serverState;
  final DeviceInfoResult deviceInfo;
  final List<ThemeMode> themeModes = ThemeMode.values;
  final List<ColorMode> colorModes;
  final void Function(BuildContext context, ThemeMode mode) onChangeTheme;
  final void Function(ColorMode mode) onChangeColorMode;
  final void Function(BuildContext context) onTapLanguage;
  final void Function(BuildContext context) onTapRestartServer;
  final void Function(BuildContext context) onTapStartServer;
  final void Function() onTapStopServer;
  final void Function(bool advanced) onTapAdvanced;

  SettingsTabVm({
    required this.advanced,
    required this.aliasController,
    required this.deviceModelController,
    required this.portController,
    required this.multicastController,
    required this.settings,
    required this.serverState,
    required this.deviceInfo,
    required this.colorModes,
    required this.onChangeTheme,
    required this.onChangeColorMode,
    required this.onTapLanguage,
    required this.onTapRestartServer,
    required this.onTapStartServer,
    required this.onTapStopServer,
    required this.onTapAdvanced,
  });
}
