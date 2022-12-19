import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _aliasKey = 'alias';
const _themeKey = 'theme';

/// This service abstracts the persistence layer.
class PersistenceService {
  final SharedPreferences _prefs;

  PersistenceService._(this._prefs);

  static Future<PersistenceService> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(_aliasKey) == null) {
      await prefs.setString(_aliasKey, generateRandomAlias());
    }

    if (prefs.getString(_themeKey) == null) {
      await prefs.setString(_themeKey, ThemeMode.system.name);
    }

    return PersistenceService._(prefs);
  }

  String getAlias() {
    return _prefs.getString(_aliasKey) ?? generateRandomAlias();
  }

  Future<void> setAlias(String alias) async {
    await _prefs.setString(_aliasKey, alias);
  }

  ThemeMode getTheme() {
    final value = _prefs.getString(_themeKey);
    if (value == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values.firstWhereOrNull((theme) => theme.name == value) ?? ThemeMode.system;
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _prefs.setString(_themeKey, theme.name);
  }
}
