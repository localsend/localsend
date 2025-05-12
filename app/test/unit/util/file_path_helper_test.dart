import 'package:localsend_app/util/file_path_helper.dart';
import 'package:test/test.dart';

void main() {
  test('fileName with counter', () async {
    final fileName = 'myFile';

    final fileNameWithCounter1 = 'myFile (1)';
    final fileNameWithCounter2 = 'myFile (2)';

    final fileNameAddCounter1 = fileName.withCount(1);
    final fileNameAddCounter2 = fileNameWithCounter1.withCount(2);

    expect(fileNameWithCounter1, fileNameAddCounter1);
    expect(fileNameWithCounter2, fileNameAddCounter2);
  });
}
