import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/util/file_size_helper.dart';

void main() {
  test('formats decimal file sizes using the selected locale', () {
    expect(1500.readableFileSize(locale: 'en'), '1.5 KB');
    expect(1500.readableFileSize(locale: 'de'), '1,5 KB');
    expect(123.readableFileSize(locale: 'bn'), '১২৩ B');
    expect(123.readableFileSize(locale: 'fa'), '۱۲۳ B');
    expect(0.readableFileSize(locale: 'bn'), '০ B');
  });
}
