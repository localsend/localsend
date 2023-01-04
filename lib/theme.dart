import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/platform_check.dart';

final _borderRadius = BorderRadius.circular(5);

final _lightInputColor = Color.lerp(Colors.teal.shade100, Colors.white, 0.5)!;
final _lightInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: _lightInputColor),
  borderRadius: _borderRadius,
);

final _darkInputColor = Color.lerp(Colors.teal.shade100, Colors.black, 0.6)!;
final _darkInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: _darkInputColor),
  borderRadius: _borderRadius,
);

ThemeData getTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
    useMaterial3: true,
    scaffoldBackgroundColor: brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
    navigationBarTheme: brightness == Brightness.dark
        ? NavigationBarThemeData(
            indicatorColor: Colors.teal,
            iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
          )
        : null,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: brightness == Brightness.light ? _lightInputColor : _darkInputColor,
      border: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      focusedBorder: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      enabledBorder: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: brightness == Brightness.dark ? Colors.white : null,
        padding: checkPlatformIsDesktop() ? const EdgeInsets.all(16) : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: checkPlatformIsDesktop() ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16) : const EdgeInsets.all(8),
      ),
    ),
  );
}

void updateSystemOverlayStyle(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  final style = SystemUiOverlayStyle(
    // statusBarColor: Colors.white, // android
    statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light, // android
    statusBarBrightness: brightness, // iOS
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

extension ThemeDataExt on ThemeData {
  /// This is the actual [cardColor] being used.
  Color get cardColorWithElevation {
    return ElevationOverlay.applySurfaceTint(cardColor, colorScheme.surfaceTint, 1);
  }
}

extension InputDecorationThemeExt on InputDecorationTheme {
  BorderRadius get borderRadius => _borderRadius;
}
