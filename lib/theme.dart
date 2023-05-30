import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/native/platform_check.dart';

final _borderRadius = BorderRadius.circular(5);

ThemeData getTheme(Brightness brightness, ColorScheme? colorScheme) {
  colorScheme ??= ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    brightness: brightness,
    backgroundColor: brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
  ).copyWith(
    // overrides for LocalSend theme
    onError: Colors.white,
    secondaryContainer:
        brightness == Brightness.light ? Color.lerp(Colors.teal.shade100, Colors.white, 0.2) : Color.lerp(Colors.teal.shade100, Colors.black, 0.6),
    onSecondaryContainer: brightness == Brightness.light ? Colors.black : Colors.white,
  );

  final lightInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: colorScheme.secondaryContainer),
    borderRadius: _borderRadius,
  );

  final darkInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: colorScheme.secondaryContainer),
    borderRadius: _borderRadius,
  );

  // https://github.com/localsend/localsend/issues/52
  final String? fontFamily;
  if (checkPlatform([TargetPlatform.windows])) {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.ja:
        fontFamily = 'Yu Gothic UI';
        break;
      case AppLocale.ko:
        fontFamily = 'Malgun Gothic';
        break;
      case AppLocale.zhCn:
        fontFamily = 'Microsoft YaHei UI';
        break;
      case AppLocale.zhHk:
      case AppLocale.zhTw:
        fontFamily = 'Microsoft JhengHei UI';
        break;
      default:
        fontFamily = 'Segoe UI Variable Display';
    }
  } else {
    fontFamily = null;
  }

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    navigationBarTheme: brightness == Brightness.dark
        ? NavigationBarThemeData(
            iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
          )
        : null,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.secondaryContainer,
      border: brightness == Brightness.light ? lightInputBorder : darkInputBorder,
      focusedBorder: brightness == Brightness.light ? lightInputBorder : darkInputBorder,
      enabledBorder: brightness == Brightness.light ? lightInputBorder : darkInputBorder,
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
        padding: checkPlatformIsDesktop() ? const EdgeInsets.all(16) : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    fontFamily: fontFamily,
  );
}

Future<void> updateSystemOverlayStyle(BuildContext context) async {
  final brightness = Theme.of(context).brightness;
  await updateSystemOverlayStyleWithBrightness(brightness);
}

Future<void> updateSystemOverlayStyleWithBrightness(Brightness brightness) async {
  final style = SystemUiOverlayStyle(
    statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light, // android
    statusBarBrightness: brightness, // iOS
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  );

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(style);
}

extension ThemeDataExt on ThemeData {
  /// This is the actual [cardColor] being used.
  Color get cardColorWithElevation {
    return ElevationOverlay.applySurfaceTint(cardColor, colorScheme.surfaceTint, 1);
  }
}

extension ColorSchemeExt on ColorScheme {
  Color get warning {
    return Colors.orange;
  }
}

extension InputDecorationThemeExt on InputDecorationTheme {
  BorderRadius get borderRadius => _borderRadius;
}
