import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/pick_directory_path.dart';

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test('Linux uses the native directory when the platform dialog succeeds', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    var fallbackCalled = false;

    final path = await pickDesktopDirectory(
      pickNative: () async => '/home/user/Documents',
      pickFallback: () async {
        fallbackCalled = true;
        return '/fallback';
      },
    );

    expect(path, '/home/user/Documents');
    expect(fallbackCalled, isFalse);
  });

  test('Linux treats a null native result as cancellation', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    var fallbackCalled = false;

    final path = await pickDesktopDirectory(
      pickNative: () async => null,
      pickFallback: () async {
        fallbackCalled = true;
        return '/fallback';
      },
    );

    expect(path, isNull);
    expect(fallbackCalled, isFalse);
  });

  test('Linux falls back when the native dialog fails', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;

    final path = await pickDesktopDirectory(
      pickNative: () async => throw Exception('portal unavailable'),
      pickFallback: () async => '/fallback',
    );

    expect(path, '/fallback');
  });

  test('other platforms go straight to the fallback', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    var nativeCalled = false;

    final path = await pickDesktopDirectory(
      pickNative: () async {
        nativeCalled = true;
        return '/native';
      },
      pickFallback: () async => '/windows',
    );

    expect(nativeCalled, isFalse);
    expect(path, '/windows');
  });
}
