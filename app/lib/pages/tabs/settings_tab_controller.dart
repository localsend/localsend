import 'package:flutter/material.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/language_page.dart';
import 'package:localsend_app/pages/tabs/settings_tab_vm.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

final settingsTabControllerProvider = ReduxProvider<SettingsTabController, SettingsTabVm>((ref) {
  final settings = ref.notifier(settingsProvider);
  final server = ref.notifier(serverProvider);
  final initialDeviceInfo = ref.read(deviceInfoProvider);
  final supportsDynamicColors = ref.read(dynamicColorsProvider) != null;

  return SettingsTabController(
    settingsService: settings,
    serverNotifier: server,
    initialDeviceInfo: initialDeviceInfo,
    supportsDynamicColors: supportsDynamicColors,
  );
});

class SettingsTabController extends ReduxNotifier<SettingsTabVm> {
  final SettingsService _settingsService;
  final ServerService _serverService;
  final DeviceInfoResult _initialDeviceInfo;
  final bool _supportsDynamicColors;

  SettingsTabController({
    required SettingsService settingsService,
    required ServerService serverNotifier,
    required DeviceInfoResult initialDeviceInfo,
    required bool supportsDynamicColors,
  })  : _settingsService = settingsService,
        _serverService = serverNotifier,
        _initialDeviceInfo = initialDeviceInfo,
    _supportsDynamicColors = supportsDynamicColors;

  @override
  SettingsTabVm init() {
    return SettingsTabVm(
      advanced: false,
      aliasController: TextEditingController(text: _settingsService.state.alias),
      deviceModelController: TextEditingController(text: _initialDeviceInfo.deviceModel),
      portController: TextEditingController(text: _settingsService.state.port.toString()),
      multicastController: TextEditingController(text: _settingsService.state.multicastGroup),
      settings: _settingsService.state,
      serverState: _serverService.state,
      deviceInfo: _initialDeviceInfo,
      colorModes: _supportsDynamicColors ? ColorMode.values : ColorMode.values.where((e) => e != ColorMode.system).toList(),
      onChangeTheme: (context, theme) async {
        await _settingsService.setTheme(theme);
        await sleepAsync(500); // workaround: brightness takes some time to be updated
        if (context.mounted) {
          await updateSystemOverlayStyle(context);
        }
      },
      onChangeColorMode: (colorMode) async {
        await _settingsService.setColorMode(colorMode);
        if (colorMode == ColorMode.oled) {
          await _settingsService.setTheme(ThemeMode.dark);
          await updateSystemOverlayStyleWithBrightness(Brightness.dark);
        }
      },
      onTapLanguage: (context) async {
        await context.push(() => const LanguagePage());
      },
      onTapRestartServer: (context) async {
        try {
          final newServerState = await _serverService.restartServer(
            alias: _settingsService.state.alias,
            port: _settingsService.state.port,
            https: _settingsService.state.https,
          );

          if (newServerState != null) {
            // the new state is always valid, so we can "repair" user's setting
            state.aliasController.text = newServerState.alias;
            state.portController.text = newServerState.port.toString();
            await _settingsService.setAlias(newServerState.alias);
            await _settingsService.setPort(newServerState.port);
          }
        } catch (e) {
          // ignore: use_build_context_synchronously
          context.showSnackBar(e.toString());
        }
      },
      onTapStartServer: (context) async {
        try {
          await _serverService.startServerFromSettings();
        } catch (e) {
          // ignore: use_build_context_synchronously
          context.showSnackBar(e.toString());
        }
      },
      onTapStopServer: () async => await _serverService.stopServer(),
      onTapAdvanced: (advanced) => redux.dispatch(SetAdvancedAction(advanced)),
    );
  }

  @override
  get initialAction => _SettingsTabWatchAction();

  @override
  void dispose() {
    state.aliasController.dispose();
    state.deviceModelController.dispose();
    state.portController.dispose();
    state.multicastController.dispose();
    super.dispose();
  }
}

class _SettingsTabWatchAction extends WatchAction<SettingsTabController, SettingsTabVm> {
  @override
  SettingsTabVm reduce() {
    return state.copyWith(
      settings: ref.watch(settingsProvider),
      serverState: ref.watch(serverProvider),
      deviceInfo: ref.watch(deviceInfoProvider),
    );
  }
}

class SetAdvancedAction extends ReduxAction<SettingsTabController, SettingsTabVm> {
  final bool advanced;

  SetAdvancedAction(this.advanced);

  @override
  SettingsTabVm reduce() {
    return state.copyWith(advanced: advanced);
  }
}
