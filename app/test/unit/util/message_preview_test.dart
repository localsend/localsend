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

  test('message labels decode only the start of the text', () {
    expect(createMessageLabel(utf8.encode('Hello')), 'Hello');
    expect(createMessageLabel(utf8.encode('a' * 100000)), '${'a' * 256}…');
    // 中 is 3 bytes: 85 characters fit, the cut-off 86th is dropped.
    expect(createMessageLabel(utf8.encode('中' * 1000)), '${'中' * 85}…');
  });

  test('the cheap length check agrees with the encoded length', () {
    for (final text in ['a' * maxMessagePreviewBytes, '中' * 5461, '中' * 5462, '👋' * 4096, '👋' * 4097]) {
      expect(isMessagePreviewWithinLimit(text), utf8.encode(text).length <= maxMessagePreviewBytes, reason: '${text.length} code units');
    }
  });
}
