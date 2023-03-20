import 'dart:ui';
import 'package:localsend_app/provider/persistence_provider.dart';

class WindowDimensionProvider {
  final PersistenceService service;

  WindowDimensionProvider(this.service);

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

  List<double> getDimensions() {
    return service.getWindowLastDimensions();
  }

}