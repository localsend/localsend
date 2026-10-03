import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:screen_retriever/screen_retriever.dart';

import '../../mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockPersistenceService persistence;
  late WindowDimensionsController controller;
  late ScreenRetrieverPlatform originalPlatform;
  late _ScreenRetriever screens;
  late Rect windowBounds;
  late List<MethodCall> windowCalls;

  const display = Display(id: 'primary', size: Size(1440, 900), visiblePosition: Offset(0, 25), visibleSize: Size(1440, 875));

  setUp(() {
    persistence = MockPersistenceService();
    controller = WindowDimensionsController(persistence);
    originalPlatform = ScreenRetrieverPlatform.instance;
    screens = _ScreenRetriever([display]);
    ScreenRetrieverPlatform.instance = screens;
    windowBounds = const Rect.fromLTWH(100, 100, 400, 500);
    windowCalls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(const MethodChannel('window_manager'), (call) async {
      windowCalls.add(call);
      switch (call.method) {
        case 'setMinimumSize':
          return null;
        case 'setBounds':
          final arguments = (call.arguments as Map).cast<String, dynamic>();
          windowBounds = Rect.fromLTWH(
            (arguments['x'] as num?)?.toDouble() ?? windowBounds.left,
            (arguments['y'] as num?)?.toDouble() ?? windowBounds.top,
            (arguments['width'] as num?)?.toDouble() ?? windowBounds.width,
            (arguments['height'] as num?)?.toDouble() ?? windowBounds.height,
          );
          return null;
        case 'getBounds':
          return {
            'x': windowBounds.left,
            'y': windowBounds.top,
            'width': windowBounds.width,
            'height': windowBounds.height,
          };
        default:
          throw UnimplementedError(call.method);
      }
    });
  });

  tearDown(() {
    ScreenRetrieverPlatform.instance = originalPlatform;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(const MethodChannel('window_manager'), null);
  });

  group('isInScreenBounds', () {
    test('accepts a window near the bottom edge below the menu bar', () async {
      // Five pixels above the actual bottom (25 + 875), but below height 875.
      expect(await controller.isInScreenBounds(const Offset(535, 295), const Size(900, 600)), isTrue);
    });

    test('accepts a window far from the edges', () async {
      expect(await controller.isInScreenBounds(const Offset(100, 100), const Size(900, 600)), isTrue);
    });

    test('includes all four visible boundaries', () async {
      expect(await controller.isInScreenBounds(display.visiblePosition!, display.visibleSize), isTrue);
    });

    for (final position in [const Offset(-1, 25), const Offset(0, 24), const Offset(541, 25), const Offset(0, 301)]) {
      test('rejects a window crossing the visible boundary at $position', () async {
        expect(await controller.isInScreenBounds(position, const Size(900, 600)), isFalse);
      });
    }

    test('uses the display origin when a Dock reduces visible width', () async {
      screens.displays = [const Display(id: 'primary', size: Size(1440, 900), visiblePosition: Offset(80, 25), visibleSize: Size(1360, 875))];
      expect(await controller.isInScreenBounds(const Offset(535, 100), const Size(900, 600)), isTrue);
      expect(await controller.isInScreenBounds(const Offset(79, 100)), isFalse);
    });

    test('uses full display size when visible bounds are unavailable', () async {
      screens.displays = [const Display(id: 'primary', size: Size(1440, 900))];
      expect(await controller.isInScreenBounds(const Offset(540, 300), const Size(900, 600)), isTrue);
      expect(await controller.isInScreenBounds(const Offset(541, 300), const Size(900, 600)), isFalse);
    });

    test('supports a display to the left without extending the right edge', () async {
      screens.displays = [
        const Display(id: 'left', size: Size(1280, 900), visiblePosition: Offset(-1280, 25), visibleSize: Size(1280, 875)),
        display,
      ];
      expect(await controller.isInScreenBounds(const Offset(-1200, 100), const Size(900, 600)), isTrue);
      expect(await controller.isInScreenBounds(const Offset(1441, 100)), isFalse);
    });

    test('supports a display below the primary display', () async {
      screens.displays.add(const Display(id: 'below', size: Size(1440, 900), visiblePosition: Offset(0, 900), visibleSize: Size(1440, 900)));
      expect(await controller.isInScreenBounds(const Offset(100, 1000), const Size(900, 600)), isTrue);
    });

    test('preserves windows spanning adjacent displays', () async {
      screens.displays.add(const Display(id: 'right', size: Size(1440, 900), visiblePosition: Offset(1440, 25), visibleSize: Size(1440, 875)));
      expect(await controller.isInScreenBounds(const Offset(1300, 100), const Size(900, 600)), isTrue);
    });

    test('rejects placement when no displays are available', () async {
      screens.displays.clear();
      expect(await controller.isInScreenBounds(Offset.zero), isFalse);
    });
  });

  group('initDimensionsConfiguration', () {
    test('restores saved position and size near the bottom edge', () async {
      when(persistence.getSaveWindowPlacement()).thenReturn(true);
      when(persistence.getWindowLastDimensions()).thenReturn(WindowDimensions(position: const Offset(615, 345), size: const Size(820, 550)));

      await controller.initDimensionsConfiguration();

      expect(windowBounds, const Rect.fromLTWH(615, 345, 820, 550));
      expect(windowCalls.map((call) => call.method), ['setMinimumSize', 'setBounds', 'setBounds']);
      verifyNever(persistence.setWindowOffsetX(any));
      verifyNever(persistence.setWindowOffsetY(any));
    });

    test('centers the default size when saved placement is off screen', () async {
      when(persistence.getSaveWindowPlacement()).thenReturn(true);
      when(persistence.getWindowLastDimensions()).thenReturn(WindowDimensions(position: const Offset(615, 351), size: const Size(820, 550)));

      await controller.initDimensionsConfiguration();

      expect(windowBounds, const Rect.fromLTWH(270, 162.5, 900, 600));
    });

    test('centers the default size when saving placement is disabled', () async {
      when(persistence.getSaveWindowPlacement()).thenReturn(false);
      when(persistence.getWindowLastDimensions()).thenReturn(WindowDimensions(position: const Offset(615, 345), size: const Size(820, 550)));

      await controller.initDimensionsConfiguration();

      expect(windowBounds, const Rect.fromLTWH(270, 162.5, 900, 600));
    });

    test('uses the minimum size on a small display without saved placement', () async {
      screens.displays = [const Display(id: 'small', size: Size(1024, 768), visiblePosition: Offset(0, 25), visibleSize: Size(1024, 743))];
      when(persistence.getSaveWindowPlacement()).thenReturn(true);
      when(persistence.getWindowLastDimensions()).thenReturn(null);

      await controller.initDimensionsConfiguration();

      expect(windowBounds, const Rect.fromLTWH(312, 146.5, 400, 500));
    });
  });

  test('stores dimensions near the bottom edge', () async {
    await controller.storeDimensions(windowOffset: const Offset(615, 345), windowSize: const Size(820, 550));

    verify(persistence.setWindowOffsetX(615));
    verify(persistence.setWindowOffsetY(345));
    verify(persistence.setWindowWidth(820));
    verify(persistence.setWindowHeight(550));
  });
}

class _ScreenRetriever extends ScreenRetrieverPlatform {
  List<Display> displays;

  _ScreenRetriever(this.displays);

  @override
  Future<List<Display>> getAllDisplays() async => displays;

  @override
  Future<Display> getPrimaryDisplay() async => displays.first;

  @override
  Future<Offset> getCursorScreenPoint() async => const Offset(100, 100);
}
