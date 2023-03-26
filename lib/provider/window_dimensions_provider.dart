import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

//Records are a better alternative, but they are currently experimental
typedef WindowDimensions = Map<String, OffsetBase?>;

final windowDimensionProvider = Provider<WindowDimensionsController>((ref) {
  return WindowDimensionsController(ref.watch(persistenceProvider));
});

class WindowDimensionsController {
  final PersistenceService _service;
  static const Size minimalSize = Size(400, 500);
  static const Size defaultSize = Size(900, 600);

  WindowDimensionsController(this._service);

  Future<void> dimensionsConfiguration() async {
    await WindowManager.instance.setMinimumSize(minimalSize);
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final hasEnoughWidth = (primaryDisplay.visibleSize ?? primaryDisplay.size).width >= 1200 ? true : false;

    //load saved Window placement and preferences
    final savePlacement = _service.getSaveWindowPlacement();
    final WindowDimensions persistedDimensions = _service.getWindowLastDimensions();

    //if [savePlacement is false], both values will be [set to null]
    final Size? persistedSize = savePlacement ? persistedDimensions["size"] as Size? : null;
    final Offset? persistedOffset = savePlacement ? persistedDimensions["position"] as Offset? : null;

    //settings applied accordingly if [save option is enabled] and if [persisted values exist]
    await WindowManager.instance.setSize(hasEnoughWidth ? persistedSize ?? defaultSize : persistedSize ?? minimalSize);
    persistedOffset == null ? await WindowManager.instance.center() : await WindowManager.instance.setPosition(persistedOffset);
  }

  Future<void> storeDimensions({
    required Offset windowOffset,
    required Size windowSize,
  }) async {
    await Future.wait([
      _service.setWindowOffsetX(windowOffset.dx),
      _service.setWindowOffsetY(windowOffset.dy),
      _service.setWindowHeight(windowSize.height),
      _service.setWindowWidth(windowSize.width)
    ]);
  }

  Future<void> storePosition({ required Offset windowOffset }) async {
    await Future.wait([
      _service.setWindowOffsetX(windowOffset.dx),
      _service.setWindowOffsetY(windowOffset.dy),
    ]);
  }

  Future<void> storeSize({ required Size windowSize }) async {
    await Future.wait([
      _service.setWindowHeight(windowSize.height),
      _service.setWindowWidth(windowSize.width)
    ]);
  }
}