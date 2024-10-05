import 'package:common/model/session_status.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/macos_channel.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:windows_taskbar/windows_taskbar.dart';

enum TaskbarIcon { regular, error, success }

class TaskbarHelper {
  static final _isWindows = checkPlatform([TargetPlatform.windows]);
  static final _isMacos = checkPlatform([TargetPlatform.macOS]);

  static Future<void> clearProgressBar() async {
    if (_isWindows) {
      await WindowsTaskbar.setProgressMode(TaskbarProgressMode.noProgress);
    } else if (_isMacos) {
      await updateDockProgress(1.0);
    }
  }

  static Future<void> setProgressBar(int progress, int total) async {
    // Scale down to 0-100 range because Windows Taskbar only supports 32-bit integers
    // This ensures that files with a size of 2^32 bytes or greater can still be displayed correctly
    final (digestedProgress, digestedTotal) = _scaleRange(progress, total);
    if (total != double.minPositive.toInt() && total != double.maxFinite.toInt()) {
      if (_isWindows) {
        await WindowsTaskbar.setProgress(digestedProgress, digestedTotal);
      } else if (_isMacos) {
        await updateDockProgress(progress / total);
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

  static Future<void> setTaskbarIcon(TaskbarIcon icon) async {
    if (_isMacos) {
      await setDockIcon(icon);
    }
  }

  static Future<void> visualizeStatus(SessionStatus? status) async {
    // macOS handling
    switch (status) {
      case SessionStatus.finished:
        await TaskbarHelper.setTaskbarIcon(TaskbarIcon.success);
        break;
      case SessionStatus.declined:
      case SessionStatus.recipientBusy:
      case SessionStatus.finishedWithErrors:
      case SessionStatus.canceledBySender:
      case SessionStatus.canceledByReceiver:
        await TaskbarHelper.setTaskbarIcon(TaskbarIcon.error);
        break;
      default:
        await TaskbarHelper.setTaskbarIcon(TaskbarIcon.regular);
    }

    // Windows handling
    switch (status) {
      case SessionStatus.waiting:
        await TaskbarHelper.setProgressBarMode(TaskbarProgressMode.indeterminate);
        break;
      case SessionStatus.declined:
      case SessionStatus.recipientBusy:
      case SessionStatus.finishedWithErrors:
      case SessionStatus.canceledBySender:
      case SessionStatus.canceledByReceiver:
        await TaskbarHelper.setProgressBarMode(TaskbarProgressMode.error);
        break;
      default:
        await TaskbarHelper.setProgressBarMode(TaskbarProgressMode.normal);
    }
  }
}

(int, int) _scaleRange(int progress, int total) {
  final percentage = progress / total;
  return ((percentage * 100).toInt(), 100);
}
