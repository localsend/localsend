import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/provider/persistence_provider.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});

class SettingsNotifier extends Notifier<SettingsState> {
  late PersistenceService _service;

  SettingsNotifier();

  @override
  SettingsState build() {
    _service = ref.watch(persistenceProvider);
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
      quickSave: _service.isQuickSave(),
      minimizeToTray: _service.isMinimizeToTray(),
      autoStartLaunchMinimized: _service.isAutoStartLaunchMinimized(),
      https: _service.isHttps(),
      sendMode: _service.getSendMode(),
      saveWindowPlacement: _service.getSaveWindowPlacement(),
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
}
