import 'dart:ui';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

// Records are a better alternative, but they are currently experimental
typedef WindowDimensions = Map<String, OffsetBase?>;

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
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final hasEnoughWidth = (primaryDisplay.visibleSize ?? primaryDisplay.size).width >= 1200;

    // load saved Window placement and preferences
    final useSavedPlacement = _service.getSaveWindowPlacement();
    final persistedDimensions = _service.getWindowLastDimensions();

    // if [savePlacement is false], both values will be [set to null]
    final Size? persistedSize = useSavedPlacement ? persistedDimensions['size'] as Size? : null;
    final Offset? persistedOffset = useSavedPlacement ? persistedDimensions['position'] as Offset? : null;

    // Checks if the last known position is valid
    bool foundInScreen = await isInScreenBounds(persistedOffset);

    // settings applied accordingly if [save option is enabled] and if [persisted values are valid]
    if (foundInScreen) {
      await WindowManager.instance.setSize(persistedSize ?? (hasEnoughWidth ? _defaultSize : _minimalSize));
    } else {
      await WindowManager.instance.setSize(hasEnoughWidth ? _defaultSize : _minimalSize);
    }

    if (persistedOffset == null || !foundInScreen) {
      await WindowManager.instance.center();
    } else {
      await WindowManager.instance.setPosition(persistedOffset);
    }
  }

  Future<bool> isInScreenBounds(Offset? windowOffset) async {
    if (windowOffset != null) {
      Size screenTotal = const Size(0.0, 0.0);
      double height = 0;
      List<Display> displays = await ScreenRetriever.instance.getAllDisplays();
      for (final display in displays) {
        if (display.size.height > height) {
          height = display.size.height - height;
        }
        screenTotal += Offset(display.size.width, height);
        if (screenTotal.contains(windowOffset)) {
          return true;
        }
      }
    }
    return false;
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
