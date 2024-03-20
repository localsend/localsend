import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:macos_dock_progress/macos_dock_progress.dart';
import 'package:windows_taskbar/windows_taskbar.dart';

class TaskbarHelper {
  static final _isWindows = checkPlatform([TargetPlatform.windows]);
  static final _isMacos = checkPlatform([TargetPlatform.macOS]);

  static Future<void> clearProgressBar() async {
    if (_isWindows) {
      await WindowsTaskbar.setProgressMode(TaskbarProgressMode.noProgress);
    } else if (_isMacos) {
      await DockProgress.setProgress(1.0);
    }
  }

  static Future<void> setProgressBar(int progress, int total) async {
    if (total != double.minPositive.toInt() && total != double.maxFinite.toInt()) {
      if (_isWindows) {
        await WindowsTaskbar.setProgress(progress, total);
      } else if (_isMacos) {
        await DockProgress.setProgress(double.parse((progress / total).toStringAsFixed(3)));
      }
    } else {
      if (_isWindows) {
        await WindowsTaskbar.setProgressMode(TaskbarProgressMode.indeterminate);
      }
    }
  }

  static Future<void> setProgressBarMode(int mode) async {
    if (_isWindows) {
      await WindowsTaskbar.setProgressMode(mode);
    }
  }
}
