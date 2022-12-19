import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/settings.dart';
import 'package:localsend_app/service/persistence_service.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  throw Exception('settingsProvider not initialized');
});

class SettingsNotifier extends StateNotifier<Settings> {
  final PersistenceService _service;

  SettingsNotifier(this._service) : super(_loadFromPersistence(_service));

  static Settings _loadFromPersistence(PersistenceService service) {
    return Settings(
      alias: service.getAlias(),
      theme: service.getTheme(),
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
}
