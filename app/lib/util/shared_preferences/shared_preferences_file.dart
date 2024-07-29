import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

const _beautyEncoder = JsonEncoder.withIndent('  ');
const _encoder = JsonEncoder();

/// Custom implementation of SharedPreferencesStorePlatform
/// that uses a custom file.
class SharedPreferencesFile extends SharedPreferencesStorePlatform {
  final File _file;
  final bool beautify;

  SharedPreferencesFile({
    required String filePath,
    this.beautify = false,
  }) : _file = File(filePath);

  late final Map<String, Object> _cache = _getAll();

  bool exists() {
    return _file.existsSync();
  }

  String getPath() {
    return _file.path;
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
      _file.createSync(recursive: true);
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

    _file.writeAsStringSync((beautify ? _beautyEncoder : _encoder).convert(data));
  }
}
