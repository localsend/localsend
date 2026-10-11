import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:window_manager/window_manager.dart';

final _logger = Logger('WindowBrightnessWatcher');

class WindowBrightnessWatcher extends StatefulWidget {
  final Widget child;

  const WindowBrightnessWatcher({
    required this.child,
    super.key,
  });

  @override
  State<WindowBrightnessWatcher> createState() => _WindowBrightnessWatcherState();
}

class _WindowBrightnessWatcherState extends State<WindowBrightnessWatcher> {
  Brightness? _brightness;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final brightness = Theme.of(context).brightness;
    if (!checkPlatform([TargetPlatform.linux]) || brightness == _brightness) {
      return;
    }

    _brightness = brightness;
    unawaited(_setBrightness(brightness));
  }

  Future<void> _setBrightness(Brightness brightness) async {
    try {
      await windowManager.setBrightness(brightness);
    } catch (e) {
      _logger.warning('Failed to set window brightness', e);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
