import 'dart:convert';

import 'package:localsend_app/util/message_preview.dart';
import 'package:test/test.dart';

void main() {
  test('short UTF-8 messages are decoded without changing the contents', () {
    for (final text in ['', 'Hello', '你好 👋\nhttps://localsend.org']) {
      expect(createMessagePreview(utf8.encode(text)), text);
    }
  });

  test('the inline limit is measured in bytes, including for CJK and emoji', () {
    expect(createMessagePreview(utf8.encode('a' * maxMessagePreviewBytes))?.length, maxMessagePreviewBytes);
    expect(createMessagePreview(utf8.encode('a' * (maxMessagePreviewBytes + 1))), isNull);
    expect(createMessagePreview(utf8.encode('中' * 6000)), isNull);
    expect(createMessagePreview(utf8.encode('👋' * 5000)), isNull);
  });

  test('missing and malformed data are transferred without an inline preview', () {
    expect(createMessagePreview(null), isNull);
    expect(createMessagePreview([0xff, 0xfe]), isNull);
  });
}
