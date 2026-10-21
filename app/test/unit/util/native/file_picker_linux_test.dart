import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/file_picker.dart';

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test('Linux uses the native paths when the platform dialog succeeds', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    var fallbackCalled = false;

    final files = await pickDesktopFiles(
      pickNative: () async => ['/tmp/a.txt', '/tmp/b.txt'],
      pickFallback: () async {
        fallbackCalled = true;
        return [];
      },
    );

    expect(files.map((file) => file.path), ['/tmp/a.txt', '/tmp/b.txt']);
    expect(fallbackCalled, isFalse);
  });

  test('Linux falls back when the native dialog fails', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;

    final files = await pickDesktopFiles(
      pickNative: () async => throw Exception('portal unavailable'),
      pickFallback: () async => [XFile('/tmp/fallback.txt')],
    );

    expect(files.map((file) => file.path), ['/tmp/fallback.txt']);
  });

  test('other platforms go straight to the fallback', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    var nativeCalled = false;

    final files = await pickDesktopFiles(
      pickNative: () async {
        nativeCalled = true;
        return [];
      },
      pickFallback: () async => [XFile('/tmp/windows.txt')],
    );

    expect(nativeCalled, isFalse);
    expect(files.map((file) => file.path), ['/tmp/windows.txt']);
  });
}
