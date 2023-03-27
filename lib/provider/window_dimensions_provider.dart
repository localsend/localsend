import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

// Records are a better alternative, but they are currently experimental
typedef WindowDimensions = Map<String, OffsetBase?>;

final windowDimensionProvider = Provider<WindowDimensionsController>((ref) {
  return WindowDimensionsController(ref.watch(persistenceProvider));
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
    final Size? persistedSize = useSavedPlacement ? persistedDimensions["size"] as Size? : null;
    final Offset? persistedOffset = useSavedPlacement ? persistedDimensions["position"] as Offset? : null;

    // settings applied accordingly if [save option is enabled] and if [persisted values exist]
    await WindowManager.instance.setSize(persistedSize ?? (hasEnoughWidth ? _defaultSize : _minimalSize));

    if (persistedOffset == null) {
      await WindowManager.instance.center();
    } else {
      await WindowManager.instance.setPosition(persistedOffset);
    }
  }

  Future<void> storeDimensions({
    required Offset windowOffset,
    required Size windowSize,
  }) async {
    await Future.wait([
      _service.setWindowOffsetX(windowOffset.dx),
      _service.setWindowOffsetY(windowOffset.dy),
      _service.setWindowHeight(windowSize.height),
      _service.setWindowWidth(windowSize.width),
    ]);
  }

  Future<void> storePosition({required Offset windowOffset}) async {
    await Future.wait([
      _service.setWindowOffsetX(windowOffset.dx),
      _service.setWindowOffsetY(windowOffset.dy),
    ]);
  }

  Future<void> storeSize({required Size windowSize}) async {
    await Future.wait([
      _service.setWindowHeight(windowSize.height),
      _service.setWindowWidth(windowSize.width),
    ]);
  }
}
