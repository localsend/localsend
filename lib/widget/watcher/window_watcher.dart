import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:logging/logging.dart';
import 'package:window_manager/window_manager.dart';

final _logger = Logger('WindowWatcher');

class WindowWatcher extends ConsumerStatefulWidget {
  final Widget child;

  const WindowWatcher({
    required this.child,
    super.key,
  });

  @override
  ConsumerState<WindowWatcher> createState() => _WindowWatcherState();
}

class _WindowWatcherState extends ConsumerState<WindowWatcher> with WindowListener {
  static WindowDimensionsController? _dimensionsController;
  static Stopwatch s = Stopwatch();

  WindowDimensionsController _ensureDimensionsProvider() => ref.watch(windowDimensionProvider);

  @override
  Widget build(BuildContext context) {
    _dimensionsController ??= _ensureDimensionsProvider();
    s.start();
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    if (checkPlatformIsDesktop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          // always handle close actions manually
          await windowManager.setPreventClose(true);
        } catch (e) {
          _logger.warning('Failed to set prevent close', e);
        }
      });
    }
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  //Linux alternative for onWindowMoved and onWindowResized
  @override
  Future<void> onWindowMove() async {
    if (checkPlatform([TargetPlatform.linux]) && s.elapsedMilliseconds >= 600) {
      s.reset();
      final windowOffset = await windowManager.getPosition();
      final windowSize = await windowManager.getSize();
      await _dimensionsController?.storeDimensions(windowOffset: windowOffset, windowSize: windowSize);
    }
  }

  @override
  Future<void> onWindowMoved() async {
    final windowOffset = await windowManager.getPosition();
    await _dimensionsController?.storePosition(windowOffset: windowOffset);
  }

  @override
  Future<void> onWindowResized() async {
    final windowSize = await windowManager.getSize();
    await _dimensionsController?.storeSize(windowSize: windowSize);
  }

  @override
  Future<void> onWindowClose() async {
    final windowOffset = await windowManager.getPosition();
    final windowSize = await windowManager.getSize();
    await _dimensionsController?.storeDimensions(windowOffset: windowOffset, windowSize: windowSize);

    if (!checkPlatformIsDesktop()) {
      return;
    }

    try {
      if (ref.read(settingsProvider).minimizeToTray) {
        await hideToTray();
      } else {
        exit(0);
      }
    } catch (e) {
      _logger.warning('Failed to close window', e);
    }
  }

  @override
  void onWindowFocus() {
    // call set state according to window_manager README
    setState(() {});
  }
}
