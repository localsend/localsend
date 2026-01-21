import 'package:common/isolate.dart';
import 'package:common/model/device_info_result.dart';
import 'package:common/util/sleep.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/language_page.dart';
import 'package:localsend_app/pages/tabs/settings_tab_vm.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/autostart_helper.dart';
import 'package:localsend_app/util/native/context_menu_helper.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

final settingsTabControllerProvider = ReduxProvider<SettingsTabController, SettingsTabVm>((ref) {
  final settings = ref.notifier(settingsProvider);
  final server = ref.notifier(serverProvider);
  final isolateController = ref.notifier(parentIsolateProvider);
  final localIpService = ref.notifier(localIpProvider);
  final initialDeviceInfo = ref.read(deviceInfoProvider);
  final supportsDynamicColors = ref.read(dynamicColorsProvider) != null;

  return SettingsTabController(
    settingsService: settings,
    serverNotifier: server,
    isolateController: isolateController,
    localIpService: localIpService,
    initialDeviceInfo: initialDeviceInfo,
    supportsDynamicColors: supportsDynamicColors,
  );
});

class SettingsTabController extends ReduxNotifier<SettingsTabVm> {
  final SettingsService _settingsService;
  final ServerService _serverService;
  final IsolateController _isolateController;
  final LocalIpService _localIpService;
  final DeviceInfoResult _initialDeviceInfo;
  final bool _supportsDynamicColors;

  SettingsTabController({
    required SettingsService settingsService,
    required ServerService serverNotifier,
    required IsolateController isolateController,
    required LocalIpService localIpService,
    required DeviceInfoResult initialDeviceInfo,
    required bool supportsDynamicColors,
  }) : _settingsService = settingsService,
       _serverService = serverNotifier,
       _isolateController = isolateController,
       _localIpService = localIpService,
       _initialDeviceInfo = initialDeviceInfo,
       _supportsDynamicColors = supportsDynamicColors;

  @override
  SettingsTabVm init() {
    return SettingsTabVm(
      advanced: _settingsService.state.advancedSettings,
      aliasController: TextEditingController(text: _settingsService.state.alias),
      deviceModelController: TextEditingController(text: _initialDeviceInfo.deviceModel),
      portController: TextEditingController(text: _settingsService.state.port.toString()),
      timeoutController: TextEditingController(text: _settingsService.state.discoveryTimeout.toString()),
      multicastController: TextEditingController(text: _settingsService.state.multicastGroup),
      settings: _settingsService.state,
      serverState: _serverService.state,
      deviceInfo: _initialDeviceInfo,
      colorModes: _supportsDynamicColors ? ColorMode.values : ColorMode.values.where((e) => e != ColorMode.system).toList(),
      autoStart: false,
      autoStartLaunchHidden: false,
      showInContextMenu: false,
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
      onToggleAutoStart: (context) async {
        final bool success;
        if (state.autoStart) {
          success = await disableAutoStart();
        } else {
          success = await enableAutoStart(startHidden: state.autoStartLaunchHidden);
        }

        if (success) {
          redux.dispatch(_SetAutoStartAction(!state.autoStart));
        }
      },
      onToggleAutoStartLaunchHidden: (context) async {
        if (state.autoStart) {
          final success = await enableAutoStart(startHidden: !state.autoStartLaunchHidden);
          if (success) {
            redux.dispatch(_SetAutoStartLaunchHiddenAction(!state.autoStartLaunchHidden));
          }
        }
      },
      onToggleShowInContextMenu: (context) async {
        final bool success;
        if (state.showInContextMenu) {
          success = await disableContextMenu();
        } else {
          success = await enableContextMenu();
        }
        if (success) {
          redux.dispatch(_SetShowInContextMenuAction(!state.showInContextMenu));
        }
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
            external(_isolateController).dispatch(IsolateSendMulticastRestartListenerAction());
            external(_localIpService).dispatchAsync(FetchLocalIpAction()); // ignore: unawaited_futures
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
  get initialAction => _SettingsTabInitAction();

  @override
  void dispose() {
    state.aliasController.dispose();
    state.deviceModelController.dispose();
    state.portController.dispose();
    state.timeoutController.dispose();
    state.multicastController.dispose();
    super.dispose();
  }
}

class _SettingsTabInitAction extends AsyncReduxAction<SettingsTabController, SettingsTabVm> {
  @override
  Future<SettingsTabVm> reduce() async {
    dispatch(_SettingsTabWatchAction());
    final autoStartEnabled = await isAutoStartEnabled();
    final autoStartHidden = await isAutoStartHidden();
    final showInContextMenu = await isContextMenuEnabled();
    return state.copyWith(
      autoStart: autoStartEnabled,
      autoStartLaunchHidden: autoStartHidden,
      showInContextMenu: showInContextMenu,
    );
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

class _SetAutoStartAction extends ReduxAction<SettingsTabController, SettingsTabVm> {
  final bool enabled;

  _SetAutoStartAction(this.enabled);

  @override
  SettingsTabVm reduce() {
    return state.copyWith(autoStart: enabled);
  }
}

class _SetAutoStartLaunchHiddenAction extends ReduxAction<SettingsTabController, SettingsTabVm> {
  final bool enabled;

  _SetAutoStartLaunchHiddenAction(this.enabled);

  @override
  SettingsTabVm reduce() {
    return state.copyWith(autoStartLaunchHidden: enabled);
  }
}

class _SetShowInContextMenuAction extends ReduxAction<SettingsTabController, SettingsTabVm> {
  final bool enabled;

  _SetShowInContextMenuAction(this.enabled);

  @override
  SettingsTabVm reduce() {
    return state.copyWith(showInContextMenu: enabled);
  }
}
