import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/settings.dart';
import 'package:localsend_app/provider/persistence_provider.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  final persistenceService = ref.watch(persistenceProvider);
  return SettingsNotifier(persistenceService);
});

class SettingsNotifier extends StateNotifier<Settings> {
  final PersistenceService _service;

  SettingsNotifier(this._service) : super(_loadFromPersistence(_service));

  static Settings _loadFromPersistence(PersistenceService service) {
    return Settings(
      showToken: service.getShowToken(),
      alias: service.getAlias(),
      theme: service.getTheme(),
      locale: service.getLocale(),
      port: service.getPort(),
      destination: service.getDestination(),
      saveToGallery: service.isSaveToGallery(),
      quickSave: service.isQuickSave(),
      minimizeToTray: service.isMinimizeToTray(),
      autoStartLaunchMinimized: service.isAutoStartLaunchMinimized(),
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
}
