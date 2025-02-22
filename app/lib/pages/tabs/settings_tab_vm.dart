import 'package:common/model/device_info_result.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/model/state/settings_state.dart';

part 'settings_tab_vm.mapper.dart';

@MappableClass()
class SettingsTabVm with SettingsTabVmMappable {
  final bool advanced;
  final TextEditingController aliasController;
  final TextEditingController deviceModelController;
  final TextEditingController portController;
  final TextEditingController timeoutController;
  final TextEditingController multicastController;
  final TextEditingController proxyServerController;

  final SettingsState settings;
  final ServerState? serverState;
  final DeviceInfoResult deviceInfo;
  final List<ThemeMode> themeModes = ThemeMode.values;
  final List<ColorMode> colorModes;
  final bool autoStart;
  final bool autoStartLaunchHidden;
  final bool showInContextMenu;
  final void Function(BuildContext context, ThemeMode mode) onChangeTheme;
  final void Function(ColorMode mode) onChangeColorMode;
  final void Function(BuildContext context) onTapLanguage;
  final void Function(BuildContext context) onToggleAutoStart;
  final void Function(BuildContext context) onToggleAutoStartLaunchHidden;
  final void Function(BuildContext context) onToggleShowInContextMenu;
  final void Function(BuildContext context) onTapRestartServer;
  final void Function(BuildContext context) onTapStartServer;
  final void Function() onTapStopServer;
  final void Function(bool advanced) onTapAdvanced;

  SettingsTabVm({
    required this.advanced,
    required this.aliasController,
    required this.deviceModelController,
    required this.portController,
    required this.timeoutController,
    required this.multicastController,
    required this.proxyServerController,
    required this.settings,
    required this.serverState,
    required this.deviceInfo,
    required this.colorModes,
    required this.autoStart,
    required this.autoStartLaunchHidden,
    required this.showInContextMenu,
    required this.onChangeTheme,
    required this.onChangeColorMode,
    required this.onTapLanguage,
    required this.onToggleAutoStart,
    required this.onToggleAutoStartLaunchHidden,
    required this.onToggleShowInContextMenu,
    required this.onTapRestartServer,
    required this.onTapStartServer,
    required this.onTapStopServer,
    required this.onTapAdvanced,
  });
}
