import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const nativeChannel = MethodChannel('main-delegate-channel');
  const windowChannel = MethodChannel('window_manager');
  const screenChannel = MethodChannel('dev.leanflutter.plugins/screen_retriever');
  final legacyFrame = WindowDimensions(position: const Offset(120, 80), size: const Size(700, 550));

  late MockPersistenceService persistence;
  late List<MethodCall> nativeCalls;
  late List<MethodCall> windowCalls;
  late List<MethodCall> screenCalls;
  var nativeRestoreResult = false;
  late List<Rect> visibleDisplays;

  Map<String, Object> displayFor(Rect bounds, int index) => {
    'id': '$index',
    'name': 'Display $index',
    'size': {'width': bounds.width, 'height': bounds.height},
    'visibleSize': {'width': bounds.width, 'height': bounds.height},
    'visiblePosition': {'dx': bounds.left, 'dy': bounds.top},
    'scaleFactor': 1.0,
  };

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    persistence = MockPersistenceService();
    nativeCalls = [];
    windowCalls = [];
    screenCalls = [];
    nativeRestoreResult = false;
    visibleDisplays = [const Rect.fromLTWH(0, 0, 1440, 900)];
    when(persistence.getSaveWindowPlacement()).thenReturn(true);
    when(persistence.isPortableMode()).thenReturn(false);
    when(persistence.getWindowLastDimensions()).thenReturn(legacyFrame);

    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(nativeChannel, (call) async {
      nativeCalls.add(call);
      if (call.method == 'restoreWindowFrame') return nativeRestoreResult;
      return null;
    });
    messenger.setMockMethodCallHandler(windowChannel, (call) async {
      windowCalls.add(call);
      if (call.method == 'getBounds') return {'x': 0.0, 'y': 0.0, 'width': 900.0, 'height': 600.0};
      return null;
    });
    messenger.setMockMethodCallHandler(screenChannel, (call) async {
      screenCalls.add(call);
      final display = displayFor(visibleDisplays.first, 0);
      if (call.method == 'getAllDisplays') {
        return {
          'displays': [for (var i = 0; i < visibleDisplays.length; i++) displayFor(visibleDisplays[i], i)],
        };
      }
      if (call.method == 'getPrimaryDisplay') return display;
      if (call.method == 'getCursorScreenPoint') return {'dx': 500.0, 'dy': 400.0};
      return null;
    });
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(nativeChannel, null);
    messenger.setMockMethodCallHandler(windowChannel, null);
    messenger.setMockMethodCallHandler(screenChannel, null);
  });

  test('macOS native frame wins over a legacy saved frame', () async {
    nativeRestoreResult = true;

    await WindowDimensionsController(persistence).initDimensionsConfiguration();

    expect(nativeCalls.map((call) => call.method), ['restoreWindowFrame', 'configureWindowFrameAutosave']);
    expect(nativeCalls.last.arguments, {'enabled': true});
    expect(windowCalls.map((call) => call.method), ['setMinimumSize']);
    verifyNever(persistence.getWindowLastDimensions());
    expect(screenCalls, isEmpty);
  });

  test('macOS ignores a legacy frame on a disconnected display', () async {
    when(persistence.getWindowLastDimensions()).thenReturn(
      WindowDimensions(position: const Offset(1200, 80), size: const Size(700, 550)),
    );

    await WindowDimensionsController(persistence).initDimensionsConfiguration();

    expect(screenCalls.map((call) => call.method), [
      'getAllDisplays',
      'getPrimaryDisplay',
      'getPrimaryDisplay',
      'getAllDisplays',
      'getCursorScreenPoint',
    ]);
    expect(windowCalls.map((call) => call.method), ['setMinimumSize', 'setBounds', 'getBounds', 'setBounds']);
    expect((windowCalls[1].arguments as Map)['width'], 900.0);
    expect((windowCalls[1].arguments as Map)['height'], 600.0);
    expect((windowCalls[3].arguments as Map)['x'], 270.0);
    expect((windowCalls[3].arguments as Map)['y'], 150.0);
    expect(nativeCalls.map((call) => call.method), ['restoreWindowFrame', 'configureWindowFrameAutosave']);
  });

  test('macOS migrates the legacy frame when no native frame exists', () async {
    await WindowDimensionsController(persistence).initDimensionsConfiguration();

    expect(nativeCalls.map((call) => call.method), ['restoreWindowFrame', 'configureWindowFrameAutosave']);
    expect(windowCalls.map((call) => call.method), ['setMinimumSize', 'setBounds', 'setBounds']);
    expect((windowCalls[1].arguments as Map)['width'], legacyFrame.size.width);
    expect((windowCalls[1].arguments as Map)['height'], legacyFrame.size.height);
    expect((windowCalls[2].arguments as Map)['x'], legacyFrame.position.dx);
    expect((windowCalls[2].arguments as Map)['y'], legacyFrame.position.dy);
    expect(screenCalls.map((call) => call.method), ['getAllDisplays']);
  });

  test('changing frame autosave preference does not restore a frame', () async {
    final controller = WindowDimensionsController(persistence);

    await controller.configureWindowFrameAutosave(enabled: false);
    await controller.configureWindowFrameAutosave(enabled: true);

    expect(nativeCalls.map((call) => call.method), ['configureWindowFrameAutosave', 'configureWindowFrameAutosave']);
    expect(nativeCalls.map((call) => call.arguments), [
      {'enabled': false},
      {'enabled': true},
    ]);
    expect(windowCalls, isEmpty);
  });

  test('macOS native autosave suppresses legacy placement writes', () async {
    final controller = WindowDimensionsController(persistence);

    await controller.storeDimensions(windowOffset: legacyFrame.position, windowSize: legacyFrame.size);
    await controller.storePosition(windowOffset: legacyFrame.position);
    await controller.storeSize(windowSize: legacyFrame.size);

    verifyNever(persistence.setWindowOffsetX(any));
    verifyNever(persistence.setWindowOffsetY(any));
    verifyNever(persistence.setWindowWidth(any));
    verifyNever(persistence.setWindowHeight(any));
    expect(screenCalls, isEmpty);
  });

  test('portable macOS keeps the legacy placement path', () async {
    when(persistence.isPortableMode()).thenReturn(true);

    await WindowDimensionsController(persistence).initDimensionsConfiguration();

    expect(nativeCalls, isEmpty);
    expect(screenCalls.map((call) => call.method), ['getAllDisplays']);
    expect(windowCalls.map((call) => call.method), ['setMinimumSize', 'setBounds', 'setBounds']);
    expect((windowCalls[2].arguments as Map)['x'], legacyFrame.position.dx);
    expect((windowCalls[2].arguments as Map)['y'], legacyFrame.position.dy);
  });

  final geometryCases = <({String name, List<Rect> displays, Offset position, Size? size, bool expected})>[
    (
      name: 'visible top inset retains bottom edge',
      displays: [const Rect.fromLTWH(0, 25, 1440, 875)],
      position: const Offset(500, 395),
      size: const Size(900, 500),
      expected: true,
    ),
    (
      name: 'visible left inset retains right edge',
      displays: [const Rect.fromLTWH(60, 25, 1380, 875)],
      position: const Offset(535, 100),
      size: const Size(900, 600),
      expected: true,
    ),
    (
      name: 'vertical displays accept a saved frame',
      displays: [const Rect.fromLTWH(0, 0, 1440, 900), const Rect.fromLTWH(0, 900, 1440, 900)],
      position: const Offset(100, 1000),
      size: const Size(900, 600),
      expected: true,
    ),
    (
      name: 'left display does not extend the right boundary',
      displays: [const Rect.fromLTWH(-1280, 0, 1280, 900), const Rect.fromLTWH(0, 0, 1920, 1080)],
      position: const Offset(2500, 100),
      size: const Size(500, 500),
      expected: false,
    ),
    (
      name: 'position-only rejects the phantom right area',
      displays: [const Rect.fromLTWH(-1280, 0, 1280, 900), const Rect.fromLTWH(0, 0, 1920, 1080)],
      position: const Offset(2500, 100),
      size: null,
      expected: false,
    ),
    (
      name: 'bounding rectangle retains existing gap behavior',
      displays: [const Rect.fromLTWH(0, 0, 1000, 900), const Rect.fromLTWH(2000, 0, 1000, 900)],
      position: const Offset(1200, 100),
      size: const Size(500, 500),
      expected: true,
    ),
    (
      name: 'ordinary zero-origin frame remains accepted',
      displays: [const Rect.fromLTWH(0, 0, 1440, 900)],
      position: const Offset(120, 80),
      size: const Size(700, 550),
      expected: true,
    ),
  ];

  for (final c in geometryCases) {
    test('legacy geometry: ${c.name}', () async {
      visibleDisplays = c.displays;
      expect(await WindowDimensionsController(persistence).isInScreenBounds(c.position, c.size), c.expected);
    });
  }

  for (final portable in [false, true]) {
    test('macOS portable=$portable restores a legacy frame at the visible bottom edge', () async {
      when(persistence.isPortableMode()).thenReturn(portable);
      visibleDisplays = [const Rect.fromLTWH(0, 25, 1440, 875)];
      when(persistence.getWindowLastDimensions()).thenReturn(
        WindowDimensions(position: const Offset(500, 395), size: const Size(900, 500)),
      );

      await WindowDimensionsController(persistence).initDimensionsConfiguration();

      expect(windowCalls.map((call) => call.method), ['setMinimumSize', 'setBounds', 'setBounds']);
      expect((windowCalls[1].arguments as Map)['height'], 500.0);
      expect((windowCalls[2].arguments as Map)['x'], 500.0);
      expect((windowCalls[2].arguments as Map)['y'], 395.0);
      expect(screenCalls.map((call) => call.method), ['getAllDisplays']);
      expect(nativeCalls.map((call) => call.method), portable ? <String>[] : ['restoreWindowFrame', 'configureWindowFrameAutosave']);
    });
  }

  test('portable macOS does not persist positions beyond the visible desktop', () async {
    when(persistence.isPortableMode()).thenReturn(true);
    visibleDisplays = [const Rect.fromLTWH(-1280, 0, 1280, 900), const Rect.fromLTWH(0, 0, 1920, 1080)];
    final controller = WindowDimensionsController(persistence);

    await controller.storeDimensions(windowOffset: const Offset(2500, 100), windowSize: const Size(500, 500));
    await controller.storePosition(windowOffset: const Offset(2500, 100));

    verifyNever(persistence.setWindowOffsetX(any));
    verifyNever(persistence.setWindowOffsetY(any));
    verifyNever(persistence.setWindowWidth(any));
    verifyNever(persistence.setWindowHeight(any));
  });
}
