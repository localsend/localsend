import 'package:localsend_app/util/file_uri_helper.dart';
import 'package:test/test.dart';

void main() {
  test('resolves file URIs to filesystem paths', () {
    expect(resolveFilePathArgument('file:///tmp/file%20name.txt'), '/tmp/file name.txt');
  });

  test('keeps filesystem paths unchanged', () {
    expect(resolveFilePathArgument('/tmp/file.txt'), '/tmp/file.txt');
  });

  test('keeps non-file URIs unchanged', () {
    expect(resolveFilePathArgument('https://example.com/file.txt'), 'https://example.com/file.txt');
  });
}
