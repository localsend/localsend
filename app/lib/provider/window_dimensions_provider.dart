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
