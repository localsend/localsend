import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
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
      locale: service.getLocale(),
      port: service.getPort(),
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
}
