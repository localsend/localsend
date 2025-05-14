import 'package:localsend_app/util/file_path_helper.dart';
import 'package:test/test.dart';

void main() {
  test('fileName with counter', () async {
    expect('myFile'.withCount(1), 'myFile (1)');
    expect('myFile (1)'.withCount(2), 'myFile (2)');
  });
}
