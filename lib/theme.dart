import 'package:flutter/material.dart';

ThemeData getTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
    useMaterial3: true,
  );
}
