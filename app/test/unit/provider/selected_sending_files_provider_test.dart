import 'dart:io';

import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:path/path.dart' as p;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUpAll(() {
    RustLib.initMock(api: _MockRustLibApi());
  });

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('selected_sending_files_test');
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  test('excludes PowerPoint lock files when adding a directory', () async {
    File(p.join(tempDir.path, 'Presentation.pptx')).writeAsStringSync('presentation');
    File(p.join(tempDir.path, r'~$Presentation.pptx')).writeAsStringSync('lock');
    File(p.join(tempDir.path, 'document.pdf')).writeAsStringSync('document');
    File(p.join(tempDir.path, r'~$100-budget.pdf')).writeAsStringSync('budget');
    final service = ReduxNotifier.test(
      redux: SelectedSendingFilesNotifier(),
    );

    await service.dispatchAsync(AddDirectoryAction(tempDir.path));

    expect(
      service.state.map((file) => p.basename(file.name)),
      unorderedEquals(['Presentation.pptx', 'document.pdf', r'~$100-budget.pdf']),
    );
  });
}

class _MockRustLibApi implements RustLibApi {
  @override
  Future<FileMetadata?> crateApiMetadataReadFileMetadata({required String path}) async => null;

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError('Not mocked: ${invocation.memberName}');
}
