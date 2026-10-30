import 'package:localsend_app/model/send_order.dart';
import 'package:localsend_app/util/send_order_sorter.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:test/test.dart';

HttpUploadFile _createFile(String fileId, int fileSize) {
  return HttpUploadFile(
    remoteFileToken: 'token-$fileId',
    fileId: fileId,
    filePath: '/tmp/$fileId',
    fileBytes: null,
    fileSize: fileSize,
  );
}

void main() {
  final medium = _createFile('medium', 500);
  final large = _createFile('large', 5000);
  final small = _createFile('small', 5);
  final files = [medium, large, small];

  group('sortBySendOrder', () {
    test('keeps the selection order when no size order is configured', () {
      final sorted = sortBySendOrder(files, SendOrder.selection, (file) => file.fileSize);

      expect(sorted.map((file) => file.fileId), ['medium', 'large', 'small']);
    });

    test('puts the smallest file first', () {
      final sorted = sortBySendOrder(files, SendOrder.smallestFirst, (file) => file.fileSize);

      expect(sorted.map((file) => file.fileId), ['small', 'medium', 'large']);
    });

    test('puts the largest file first', () {
      final sorted = sortBySendOrder(files, SendOrder.largestFirst, (file) => file.fileSize);

      expect(sorted.map((file) => file.fileId), ['large', 'medium', 'small']);
    });

    test('keeps the selection order of equally sized files', () {
      // More than 32 files, because List.sort is only stable below that.
      final manyFiles = List.generate(100, (i) => _createFile('$i', i.isEven ? 100 : 200));

      for (final sendOrder in [SendOrder.smallestFirst, SendOrder.largestFirst]) {
        final sorted = sortBySendOrder(manyFiles, sendOrder, (file) => file.fileSize);
        final small = sorted.where((file) => file.fileSize == 100).map((file) => int.parse(file.fileId));
        final large = sorted.where((file) => file.fileSize == 200).map((file) => int.parse(file.fileId));

        expect(small, [for (var i = 0; i < 100; i += 2) i], reason: sendOrder.name);
        expect(large, [for (var i = 1; i < 100; i += 2) i], reason: sendOrder.name);
      }
    });

    test('does not mutate the given list', () {
      sortBySendOrder(files, SendOrder.smallestFirst, (file) => file.fileSize);

      expect(files.map((file) => file.fileId), ['medium', 'large', 'small']);
    });
  });
}
