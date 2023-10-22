import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends Notifier<SettingsState> {
  late PersistenceService _service;

  SettingsNotifier();

  @override
  SettingsState init() {
    _service = ref.read(persistenceProvider);
    return SettingsState(
      showToken: _service.getShowToken(),
      alias: _service.getAlias(),
      theme: _service.getTheme(),
      colorMode: _service.getColorMode(),
      locale: _service.getLocale(),
      port: _service.getPort(),
      multicastGroup: _service.getMulticastGroup(),
      destination: _service.getDestination(),
      saveToGallery: _service.isSaveToGallery(),
      saveToHistory: _service.isSaveToHistory(),
      quickSave: _service.isQuickSave(),
      minimizeToTray: _service.isMinimizeToTray(),
      launchAtStartup: _service.isLaunchAtStartup(),
      autoStartLaunchMinimized: _service.isAutoStartLaunchMinimized(),
      https: _service.isHttps(),
      sendMode: _service.getSendMode(),
      saveWindowPlacement: _service.getSaveWindowPlacement(),
      enableAnimations: _service.getEnableAnimations(),
      deviceType: _service.getDeviceType(),
      deviceModel: _service.getDeviceModel(),
    );
  }

  Future<void> setAlias(String alias) async {
    await _service.setAlias(alias);
    state = state.copyWith(
      alias: alias,
    );
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _service.setTheme(theme);
    state = state.copyWith(
      theme: theme,
    );
  }

  Future<void> setColorMode(ColorMode mode) async {
    await _service.setColorMode(mode);
    state = state.copyWith(
      colorMode: mode,
    );
  }

  Future<void> setLocale(AppLocale? locale) async {
    await _service.setLocale(locale);
    state = state.copyWith(
      locale: locale,
    );
  }

  Future<void> setPort(int port) async {
    await _service.setPort(port);
    state = state.copyWith(
      port: port,
    );
  }

  Future<void> setMulticastGroup(String group) async {
    await _service.setMulticastGroup(group);
    state = state.copyWith(
      multicastGroup: group,
    );
  }

  Future<void> setDestination(String? destination) async {
    await _service.setDestination(destination);
    state = state.copyWith(
      destination: destination,
    );
  }

  Future<void> setSaveToGallery(bool saveToGallery) async {
    await _service.setSaveToGallery(saveToGallery);
    state = state.copyWith(
      saveToGallery: saveToGallery,
    );
  }

  Future<void> setSaveToHistory(bool saveToHistory) async {
    await _service.setSaveToHistory(saveToHistory);
    state = state.copyWith(
      saveToHistory: saveToHistory,
    );
  }

  Future<void> setQuickSave(bool quickSave) async {
    await _service.setQuickSave(quickSave);
    state = state.copyWith(
      quickSave: quickSave,
    );
  }

  Future<void> setMinimizeToTray(bool minimizeToTray) async {
    await _service.setMinimizeToTray(minimizeToTray);
    state = state.copyWith(
      minimizeToTray: minimizeToTray,
    );
  }

  Future<void> setLaunchAtStartup(bool launchAtStartup) async {
    await _service.setLaunchAtStartup(launchAtStartup);
    state = state.copyWith(
      launchAtStartup: launchAtStartup,
    );
  }

  Future<void> setAutoStartLaunchMinimized(bool launchMinimized) async {
    await _service.setAutoStartLaunchMinimized(launchMinimized);
    state = state.copyWith(
      autoStartLaunchMinimized: launchMinimized,
    );
  }

  Future<void> setHttps(bool https) async {
    await _service.setHttps(https);
    state = state.copyWith(
      https: https,
    );
  }

  Future<void> setSendMode(SendMode mode) async {
    await _service.setSendMode(mode);
    state = state.copyWith(
      sendMode: mode,
    );
  }

  Future<void> setSaveWindowPlacement(bool savePlacement) async {
    await _service.setSaveWindowPlacement(savePlacement);
    state = state.copyWith(
      saveWindowPlacement: savePlacement,
    );
  }

  Future<void> setEnableAnimations(bool enableAnimations) async {
    await _service.setEnableAnimations(enableAnimations);
    state = state.copyWith(
      enableAnimations: enableAnimations,
    );
  }

  Future<void> setDeviceType(DeviceType deviceType) async {
    await _service.setDeviceType(deviceType);
    state = state.copyWith(
      deviceType: deviceType,
    );
  }

  Future<void> setDeviceModel(String deviceModel) async {
    await _service.setDeviceModel(deviceModel);
    state = state.copyWith(
      deviceModel: deviceModel,
    );
  }
}
