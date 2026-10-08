import 'dart:io';

import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/shared_preferences/shared_preferences_portable.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

class _MockPortableStore extends SharedPreferencesPortable {
  final String customPath;

  _MockPortableStore(this.customPath);

  @override
  bool exists() => File(customPath).existsSync();

  @override
  String getPath() => customPath;
}

void main() {
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('localsend_persistence_test_');
  });

  tearDown(() {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('deleteCorruptedPreferences should delete existing portable settings file', () async {
    final corruptSettingsFile = File(path.join(tempDir.path, 'settings.json'));
    corruptSettingsFile.writeAsStringSync('{invalid json: true,');
    expect(corruptSettingsFile.existsSync(), isTrue);

    final portableStore = _MockPortableStore(corruptSettingsFile.path);
    await deleteCorruptedPreferences(portableStore: portableStore);

    expect(corruptSettingsFile.existsSync(), isFalse);
  });

  test('deleteCorruptedPreferences should not fail when portable settings file does not exist', () async {
    final nonExistentFile = File(path.join(tempDir.path, 'does_not_exist.json'));
    expect(nonExistentFile.existsSync(), isFalse);

    final portableStore = _MockPortableStore(nonExistentFile.path);
    expect(
      () async => await deleteCorruptedPreferences(portableStore: portableStore),
      returnsNormally,
    );
  });
}
