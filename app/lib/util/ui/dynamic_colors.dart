import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:refena_flutter/refena_flutter.dart';

class DynamicColors {
  final ColorScheme light;
  final ColorScheme dark;

  /// The raw seed color the system reported (accent color / core palette key color).
  /// Kept around so callers can re-derive a [ColorScheme] with a different tone mapping
  /// instead of the default Material fromSeed() algorithm.
  final Color seedColor;

  const DynamicColors({
    required this.light,
    required this.dark,
    required this.seedColor,
  });
}

final dynamicColorsProvider = Provider<DynamicColors?>((ref) => throw 'not initialized');

/// Returns the dynamic colors.
/// A copy of the dynamic_color_plugin implementation to retrieve the dynamic colors without a widget.
/// We need to replace [PlatformException] with a generic exception because on Windows 7 it is somehow not a [PlatformException].
Future<DynamicColors?> getDynamicColors() async {
  try {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    if (corePalette != null) {
      debugPrint('dynamic_color: Core palette detected.');
      return DynamicColors(
        light: corePalette.toColorScheme(),
        dark: corePalette.toColorScheme(brightness: Brightness.dark),
        seedColor: Color(corePalette.primary.get(40)),
      );
    }
  } catch (e) {
    debugPrint('dynamic_color: Failed to obtain core palette.');
  }

  try {
    final accentColor = await DynamicColorPlugin.getAccentColor();
    if (accentColor != null) {
      debugPrint('dynamic_color: Accent color detected.');
      return DynamicColors(
        light: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.light,
        ),
        dark: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        ),
        seedColor: accentColor,
      );
    }
  } catch (e) {
    debugPrint('dynamic_color: Failed to obtain accent color.');
  }

  return null;
}
