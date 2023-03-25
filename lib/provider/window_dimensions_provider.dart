import 'dart:ui';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

//Records are a better alternative, but they are currently experimental
typedef WindowDimensions = Map<String, OffsetBase?>?;

class WindowDimensionProvider {
  final PersistenceService _service;
  static const Size minimalSize = Size(400, 500);
  static const Size defaultSize = Size(900, 600);
  static WindowDimensions currentDimensions;

  WindowDimensionProvider(this._service);

  Future<void> dimensionsConfiguration() async {
    await WindowManager.instance.setMinimumSize(minimalSize);
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final hasEnoughWidth = (primaryDisplay.visibleSize ?? primaryDisplay.size).width >= 1200 ? true : false;
    final savePlacement = _service.getSaveWindowPlacement();

    _getPersistedDimensions();
    final Size? persistedSize = savePlacement == false ? null : currentDimensions?["size"] as Size?;
    final Offset? persistedOffset = savePlacement == false ? null : currentDimensions?["position"] as Offset?;

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
    _getPersistedDimensions();
  }

  Future<void> storeSize({ required Size windowSize }) async {
    await Future.wait([
      _service.setWindowHeight(windowSize.height),
      _service.setWindowWidth(windowSize.width)
    ]);
    _getPersistedDimensions();
  }

  void _getPersistedDimensions() {
     currentDimensions = _service.getWindowLastDimensions();
  }
}