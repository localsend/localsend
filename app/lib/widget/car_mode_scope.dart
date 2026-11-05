import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Minimum logical width for the car dashboard.
///
/// A 15.6 inch 2560x1440 screen reports 1200 to 2560 logical pixels,
/// so this breakpoint covers every common density.
const double carModeMinWidth = 1200;

/// Resolves whether the car dashboard is active.
///
/// [override] is the user preference. A null value means auto-detection.
/// Auto-detection only enables the dashboard on wide Android landscape screens
/// so that desktop and phone layouts stay unchanged.
bool resolveCarMode({
  required bool? override,
  required Size size,
  required bool isAndroid,
}) {
  if (override != null) {
    return override;
  }
  return isAndroid && size.width >= carModeMinWidth && size.width > size.height;
}

/// Exposes the resolved car dashboard state to the widget tree.
///
/// The scope wraps the navigator inside [MaterialApp], so every page,
/// dialog and builder can read it.
class CarModeScope extends InheritedWidget {
  final bool enabled;

  const CarModeScope({required this.enabled, required super.child, super.key});

  static bool of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CarModeScope>()?.enabled ?? false;
  }

  @override
  bool updateShouldNotify(CarModeScope oldWidget) => enabled != oldWidget.enabled;
}

/// Applies the screen orientation that matches the car dashboard.
///
/// The car screen is fixed in landscape. Turning the dashboard off restores
/// the default behaviour of the device.
Future<void> applyCarModeSystemChrome(bool enabled) async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  try {
    if (enabled) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    }
  } catch (_) {
    // Orientation is a hint for the platform, so a failure is not fatal.
  }
}
