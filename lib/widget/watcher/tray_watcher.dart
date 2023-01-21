import 'dart:io';

import 'package:flutter/material.dart' hide MenuItem;
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class TrayWatcher extends StatefulWidget {
  final Widget child;

  const TrayWatcher({required this.child, super.key});

  @override
  State<TrayWatcher> createState() => _TrayWatcherState();
}

class _TrayWatcherState extends State<TrayWatcher> with TrayListener {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    trayManager.addListener(this);
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  @override
  void onTrayIconMouseDown() async {
    try {
      if (await windowManager.isVisible() && !(await windowManager.isMinimized())) {
        await trayManager.popUpContextMenu();
      } else {
        await windowManager.show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onTrayIconRightMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    // There is only an exit button
    exit(0);
  }
}
