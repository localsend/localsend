import 'dart:io';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/file_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:path/path.dart' as p;
import 'package:refena_flutter/refena_flutter.dart';

void main() {
  group('SelectedReceivingFilesNotifier', () {
    late Ref ref;
    late Directory tempDir;

    setUp(() {
      ref = RefenaContainer();
      tempDir = Directory.systemTemp.createTempSync('localsend_test_');
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });

    test('Should accept all files if skipDuplicateFiles is false', () {
      final notifier = ref.notifier(selectedReceivingFilesProvider);

      notifier.initFiles(
        files: [
          const FileDto(id: '1', fileName: 'test1.txt', size: 100, fileType: FileType.text, hash: null, preview: null, metadata: null),
          const FileDto(id: '2', fileName: 'test2.txt', size: 100, fileType: FileType.text, hash: null, preview: null, metadata: null),
        ],
        destinationDir: tempDir.path,
        skipDuplicateFiles: false,
      );

      final state = ref.read(selectedReceivingFilesProvider);
      expect(state, {
        '1': 'test1.txt',
        '2': 'test2.txt',
      });
    });

    test('Should skip existing files if skipDuplicateFiles is true', () {
      // Create a dummy existing file
      File(p.join(tempDir.path, 'test1.txt')).writeAsStringSync('existing file');

      final notifier = ref.notifier(selectedReceivingFilesProvider);

      notifier.initFiles(
        files: [
          const FileDto(id: '1', fileName: 'test1.txt', size: 100, fileType: FileType.text, hash: null, preview: null, metadata: null),
          const FileDto(id: '2', fileName: 'test2.txt', size: 100, fileType: FileType.text, hash: null, preview: null, metadata: null),
        ],
        destinationDir: tempDir.path,
        skipDuplicateFiles: true,
      );

      final state = ref.read(selectedReceivingFilesProvider);
      
      // test1.txt should be skipped
      // test2.txt should be kept
      expect(state, {
        '2': 'test2.txt',
      });
    });
  });
}
