import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

const _encoder = JsonEncoder.withIndent('  ');

/// Custom implementation of SharedPreferencesStorePlatform
/// that uses a file named settings.json located next to the executable.
/// This is used to for portable mode.
class SharedPreferencesPortable extends SharedPreferencesStorePlatform {
  static final _file = File('settings.json');

  late final Map<String, Object> _cache = _getAll();

  static bool exists() {
    return _file.existsSync();
  }

  @override
  Future<bool> clear() {
    _write({});
    return Future.value(true);
  }

  @override
  Future<Map<String, Object>> getAll() async {
    return _cache;
  }

  Map<String, Object> _getAll() {
    if (!_file.existsSync()) {
      _file.createSync();
    }

    try {
      return json.decode(_file.readAsStringSync()).cast<String, Object>();
    } catch (e) {
      return {};
    }
  }

  @override
  Future<bool> remove(String key) {
    _cache.remove(key);
    _write(_cache);
    return Future.value(true);
  }

  @override
  Future<bool> setValue(String valueType, String key, Object value) {
    _cache[key] = value;
    _write(_cache);
    return Future.value(true);
  }

  void _write(Map<String, dynamic> data) {
    if (!_file.existsSync()) {
      _file.createSync(recursive: true);
    }

    _file.writeAsStringSync(_encoder.convert(data));
  }
}
