import 'dart:ui';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

//Records are a better alternative, but they are currently experimental
typedef WindowDimensions = Map<OffsetBase?, OffsetBase?>?;

class WindowDimensionProvider {
  final PersistenceService service;
  final Size minimalSize = const Size(400, 500);
  final Size defaultSize = const Size(900, 600);
  WindowDimensions currentDimensions;

  WindowDimensionProvider(this.service);

  Future<void> dimensionsConfiguration() async {
    await WindowManager.instance.setMinimumSize(minimalSize);
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final hasEnoughWidth = (primaryDisplay.visibleSize ?? primaryDisplay.size).width >= 1200 ? true : false;
    
    _getPersistedDimensions();
    final Size? persistedSize = currentDimensions?.entries.first.value as Size?;
    final Offset? persistedOffset = currentDimensions?.entries.last.value as Offset?;

    await WindowManager.instance.setSize(hasEnoughWidth ? persistedSize ?? defaultSize : persistedSize ?? minimalSize);
    persistedOffset == null ? await WindowManager.instance.center() : await WindowManager.instance.setPosition(persistedOffset);
  }

  Future<void> storeDimensions({
    required Offset windowOffset,
    required Size windowSize,
  }) async {
    await Future.wait([
      service.setWindowOffsetX(windowOffset.dx),
      service.setWindowOffsetY(windowOffset.dy),
      service.setWindowHeight(windowSize.height),
      service.setWindowWidth(windowSize.width)
    ]);
  }

  Future<void> storePosition({ required Offset windowOffset }) async {
    await Future.wait([
      service.setWindowOffsetX(windowOffset.dx),
      service.setWindowOffsetY(windowOffset.dy),
    ]);
    _getPersistedDimensions();
  }

  Future<void> storeSize({ required Size windowSize }) async {
    await Future.wait([
      service.setWindowHeight(windowSize.height),
      service.setWindowWidth(windowSize.width)
    ]);
    _getPersistedDimensions();
  }

  void _getPersistedDimensions() {
     currentDimensions = service.getWindowLastDimensions();
  }

}