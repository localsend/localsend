import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'dart:io';  // Add this import

final _borderRadius = BorderRadius.circular(5);

double get desktopPaddingFix => checkPlatformIsDesktop() ? 8 : 0;

ThemeData getTheme(ColorMode colorMode, Brightness brightness, DynamicColors? dynamicColors) {
  if (colorMode == ColorMode.yaru) {
    return _getYaruTheme(brightness);
  }

  final colorScheme = _determineColorScheme(colorMode, brightness, dynamicColors);

  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: colorScheme.secondaryContainer),
    borderRadius: _borderRadius,
  );

  final fontFamily = checkPlatform([TargetPlatform.windows])
      ? _getWindowsFontFamily()
      : null;

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    navigationBarTheme: _getNavigationBarTheme(colorScheme),
    inputDecorationTheme: _getInputDecorationTheme(colorScheme, inputBorder),
    elevatedButtonTheme: _getElevatedButtonTheme(colorScheme),
    textButtonTheme: _getTextButtonTheme(),
    fontFamily: fontFamily,
  );
}

Future<void> updateSystemOverlayStyle(BuildContext context) async {
  final brightness = Theme.of(context).brightness;
  await updateSystemOverlayStyleWithBrightness(brightness);
}

Future<void> updateSystemOverlayStyleWithBrightness(Brightness brightness) async {
  if (checkPlatform([TargetPlatform.android])) {
    await _updateAndroidSystemOverlayStyle(brightness);
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: brightness,
      statusBarColor: Colors.transparent,
    ));
  }
}

extension ThemeDataExt on ThemeData {
  Color get cardColorWithElevation {
    return ElevationOverlay.applySurfaceTint(cardColor, colorScheme.surfaceTint, 1);
  }
}

extension ColorSchemeExt on ColorScheme {
  Color get warning => Colors.orange;

  Color? get secondaryContainerIfDark => brightness == Brightness.dark ? secondaryContainer : null;

  Color? get onSecondaryContainerIfDark => brightness == Brightness.dark ? onSecondaryContainer : null;
}

extension InputDecorationThemeExt on InputDecorationTheme {
  BorderRadius get borderRadius => _borderRadius;
}

ColorScheme _determineColorScheme(ColorMode mode, Brightness brightness, DynamicColors? dynamicColors) {
  final defaultColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: brightness,
  );

  return switch (mode) {
    ColorMode.system => brightness == Brightness.light ? dynamicColors?.light : dynamicColors?.dark,
    ColorMode.localsend => null,
    ColorMode.oled => (dynamicColors?.dark ?? defaultColorScheme).copyWith(
        background: Colors.black,
        surface: Colors.black,
      ),
    ColorMode.yaru => throw 'Should not reach here',
  } ?? defaultColorScheme;
}

ThemeData _getYaruTheme(Brightness brightness) {
  final baseTheme = brightness == Brightness.light ? yaru.yaruLight : yaru.yaruDark;
  final colorScheme = baseTheme.colorScheme;

  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: colorScheme.secondaryContainer),
    borderRadius: _borderRadius,
  );

  return baseTheme.copyWith(
    navigationBarTheme: _getNavigationBarTheme(colorScheme),
    inputDecorationTheme: _getInputDecorationTheme(colorScheme, inputBorder),
    elevatedButtonTheme: _getElevatedButtonTheme(colorScheme),
    textButtonTheme: _getTextButtonTheme(),
  );
}

NavigationBarThemeData? _getNavigationBarTheme(ColorScheme colorScheme) {
  return colorScheme.brightness == Brightness.dark
      ? NavigationBarThemeData(
          iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
        )
      : null;
}

InputDecorationTheme _getInputDecorationTheme(ColorScheme colorScheme, OutlineInputBorder inputBorder) {
  return InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.secondaryContainer,
    border: inputBorder,
    focusedBorder: inputBorder,
    enabledBorder: inputBorder,
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  );
}

ElevatedButtonThemeData _getElevatedButtonTheme(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: colorScheme.brightness == Brightness.dark ? Colors.white : null,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8 + desktopPaddingFix),
    ),
  );
}

TextButtonThemeData _getTextButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8 + desktopPaddingFix),
    ),
  );
}

Future<void> _updateAndroidSystemOverlayStyle(Brightness brightness) async {
  final darkMode = brightness == Brightness.dark;
  final androidSdkInt = RefenaScope.defaultRef.read(deviceInfoProvider).androidSdkInt ?? 0;
  final bool edgeToEdge = androidSdkInt >= 29;

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: edgeToEdge ? Colors.transparent : (darkMode ? Colors.black : Colors.white),
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarIconBrightness: darkMode ? Brightness.light : Brightness.dark,
  ));
}

String? _getWindowsFontFamily() {
  return switch (LocaleSettings.currentLocale) {
    AppLocale.ja => 'Yu Gothic UI',
    AppLocale.ko => 'Malgun Gothic',
    AppLocale.zhCn => 'Microsoft YaHei UI',
    AppLocale.zhHk || AppLocale.zhTw => 'Microsoft JhengHei UI',
    _ => 'Segoe UI Variable Display',
  };
}
