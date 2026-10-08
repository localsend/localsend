import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/native/macos_channel.dart' as macos_channel;
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

  bool get _usesNativeWindowFrameAutosave => defaultTargetPlatform == TargetPlatform.macOS && !_service.isPortableMode();

  /// Sets window position & size according to saved settings.
  Future<void> initDimensionsConfiguration() async {
    await WindowManager.instance.setMinimumSize(_minimalSize);

    final useSavedPlacement = _service.getSaveWindowPlacement();
    if (_usesNativeWindowFrameAutosave) {
      await _restoreNativeDimensions(useSavedPlacement: useSavedPlacement);
    } else {
      await _restorePersistedDimensions(useSavedPlacement: useSavedPlacement);
    }
  }

  Future<void> _restorePersistedDimensions({required bool useSavedPlacement}) async {
    final persistedDimensions = _service.getWindowLastDimensions();
    if (useSavedPlacement && persistedDimensions != null && await isInScreenBounds(persistedDimensions.position, persistedDimensions.size)) {
      await _applyDimensions(persistedDimensions);
    } else {
      await _setDefaultDimensions();
    }
  }

  Future<void> _restoreNativeDimensions({required bool useSavedPlacement}) async {
    final restored = useSavedPlacement && await macos_channel.restoreWindowFrame();
    if (!restored) {
      // Migrate placement saved by earlier versions when AppKit has no saved frame.
      await _restorePersistedDimensions(useSavedPlacement: useSavedPlacement);
    }
    await configureWindowFrameAutosave(enabled: useSavedPlacement);
  }

  Future<void> configureWindowFrameAutosave({required bool enabled}) async {
    if (_usesNativeWindowFrameAutosave) {
      await macos_channel.configureWindowFrameAutosave(enabled: enabled);
    }
  }

  Future<void> _applyDimensions(WindowDimensions dimensions) async {
    await WindowManager.instance.setSize(dimensions.size);
    await WindowManager.instance.setPosition(dimensions.position);
  }

  Future<void> _setDefaultDimensions() async {
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final hasEnoughWidthForDefaultSize = primaryDisplay.digestedSize.width >= 1200;
    await WindowManager.instance.setSize(hasEnoughWidthForDefaultSize ? _defaultSize : _minimalSize);
    await WindowManager.instance.center();
  }

  Future<bool> isInScreenBounds(Offset windowPosition, [Size? windowSize]) async {
    final displays = await ScreenRetriever.instance.getAllDisplays();
    final sumWidth = displays.fold(0.0, (previousValue, element) => previousValue + element.digestedSize.width);
    final maxHeight = displays.fold(
      0.0,
      (previousValue, element) => previousValue > element.digestedSize.height ? previousValue : element.digestedSize.height,
    );
    final minX = displays.fold(0.0, (previousValue, element) {
      final currX = element.visiblePosition?.dx ?? 0;
      return currX < previousValue ? currX : previousValue;
    });
    final minY = displays.fold(0.0, (previousValue, element) {
      final currY = element.visiblePosition?.dy ?? 0;
      return currY < previousValue ? currY : previousValue;
    });
    final checkX = windowPosition.dx >= minX && windowPosition.dx + (windowSize?.width ?? 0) <= sumWidth;
    final checkY = windowPosition.dy >= minY && windowPosition.dy + (windowSize?.height ?? 0) <= maxHeight;

    return checkX && checkY;
  }

  Future<void> storeDimensions({
    required Offset windowOffset,
    required Size windowSize,
  }) async {
    if (_usesNativeWindowFrameAutosave) return;
    if (await isInScreenBounds(windowOffset)) {
      await _service.setWindowOffsetX(windowOffset.dx);
      await _service.setWindowOffsetY(windowOffset.dy);
      await _service.setWindowHeight(windowSize.height);
      await _service.setWindowWidth(windowSize.width);
    }
  }

  Future<void> storePosition({required Offset windowOffset}) async {
    if (_usesNativeWindowFrameAutosave) return;
    if (await isInScreenBounds(windowOffset)) {
      await _service.setWindowOffsetX(windowOffset.dx);
      await _service.setWindowOffsetY(windowOffset.dy);
    }
  }

  Future<void> storeSize({required Size windowSize}) async {
    if (_usesNativeWindowFrameAutosave) return;
    await _service.setWindowHeight(windowSize.height);
    await _service.setWindowWidth(windowSize.width);
  }
}

extension on Display {
  Size get digestedSize => visibleSize ?? size;
}
