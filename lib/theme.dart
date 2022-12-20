import 'package:flutter/material.dart';

ThemeData getTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
    useMaterial3: true,
    scaffoldBackgroundColor: brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
    navigationBarTheme: brightness == Brightness.dark ? NavigationBarThemeData(
      indicatorColor: Colors.teal,
      iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
    ) : null,
  );
}
