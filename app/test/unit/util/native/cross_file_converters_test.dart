import 'package:localsend_app/util/native/channel/android_channel.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:test/test.dart';

FileInfo fileInfo(int lastModified) {
  return FileInfo(
    name: 'photo.jpg',
    size: 1234,
    uri: 'content://com.example.provider/document/1',
    lastModified: lastModified,
  );
}

void main() {
  test('safTimestampToRfc3339 should convert a SAF timestamp', () {
    expect(safTimestampToRfc3339(1600000000123), '2020-09-13T12:26:40.123Z');
  });

  test('safTimestampToRfc3339 should treat a non-positive timestamp as unknown', () {
    // COLUMN_LAST_MODIFIED is nullable and a null column reads back as 0,
    // which must not be sent as a 1970 timestamp.
    expect(safTimestampToRfc3339(0), isNull);
    expect(safTimestampToRfc3339(-1), isNull);
  });

  test('convertFileInfo should drop an unknown timestamp', () async {
    expect((await CrossFileConverters.convertFileInfo(fileInfo(1600000000123))).lastModified, '2020-09-13T12:26:40.123Z');
    expect((await CrossFileConverters.convertFileInfo(fileInfo(0))).lastModified, isNull);
  });
}
