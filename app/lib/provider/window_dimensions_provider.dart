import 'dart:ui';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

class WindowDimensions {
  final Offset position;
  final Size size;

  WindowDimensions({
    required this.position,
    required this.size,
  });
}

final windowDimensionProvider = Provider<WindowDimensionsController>((ref) {
  return WindowDimensionsController(ref.read(persistenceProvider));
});

const Size _minimalSize = Size(400, 500);
const Size _defaultSize = Size(900, 600);

class WindowDimensionsController {
  final PersistenceService _service;

  WindowDimensionsController(this._service);

  /// Sets window position & size according to saved settings.
  Future<void> initDimensionsConfiguration() async {
    await WindowManager.instance.setMinimumSize(_minimalSize);

    // load saved Window placement and preferences
    final useSavedPlacement = _service.getSaveWindowPlacement();
    final persistedDimensions = _service.getWindowLastDimensions();

    if (useSavedPlacement && persistedDimensions != null && await isInScreenBounds(persistedDimensions.position, persistedDimensions.size)) {
      await WindowManager.instance.setSize(persistedDimensions.size);
      await WindowManager.instance.setPosition(persistedDimensions.position);
    } else {
      final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
      final hasEnoughWidthForDefaultSize = primaryDisplay.digestedSize.width >= 1200;
      await WindowManager.instance.setSize(hasEnoughWidthForDefaultSize ? _defaultSize : _minimalSize);
      await WindowManager.instance.center();
    }
  }

  /// Checks the visible bounding rectangle of all displays.
  /// Windows may span displays; gaps between displays are not checked.
  Future<bool> isInScreenBounds(Offset windowPosition, [Size? windowSize]) async {
    final displays = await ScreenRetriever.instance.getAllDisplays();
    if (displays.isEmpty) {
      return false;
    }

    final screenBounds = displays
        .map((display) => (display.visiblePosition ?? Offset.zero) & display.digestedSize)
        .reduce((bounds, displayBounds) => bounds.expandToInclude(displayBounds));
    final windowBounds = windowPosition & (windowSize ?? Size.zero);

    return windowBounds.left >= screenBounds.left &&
        windowBounds.top >= screenBounds.top &&
        windowBounds.right <= screenBounds.right &&
        windowBounds.bottom <= screenBounds.bottom;
  }

  Future<void> storeDimensions({
    required Offset windowOffset,
    required Size windowSize,
  }) async {
    if (await isInScreenBounds(windowOffset)) {
      await _service.setWindowOffsetX(windowOffset.dx);
      await _service.setWindowOffsetY(windowOffset.dy);
      await _service.setWindowHeight(windowSize.height);
      await _service.setWindowWidth(windowSize.width);
    }
  }

  Future<void> storePosition({required Offset windowOffset}) async {
    if (await isInScreenBounds(windowOffset)) {
      await _service.setWindowOffsetX(windowOffset.dx);
      await _service.setWindowOffsetY(windowOffset.dy);
    }
  }

  Future<void> storeSize({required Size windowSize}) async {
    await _service.setWindowHeight(windowSize.height);
    await _service.setWindowWidth(windowSize.width);
  }
}

extension on Display {
  Size get digestedSize => visibleSize ?? size;
}
