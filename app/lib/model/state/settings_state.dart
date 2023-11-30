import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/send_mode.dart';

part 'settings_state.mapper.dart';

@MappableClass()
class SettingsState with SettingsStateMappable {
  final String showToken; // the token to show / maximize the window because only one instance is allowed
  final String alias;
  final ThemeMode theme;
  final ColorMode colorMode;
  final AppLocale? locale;
  final int port;
  final String multicastGroup;
  final String? destination; // null = default
  final bool saveToGallery; // only Android, iOS
  final bool saveToHistory;
  final bool quickSave; // automatically accept file requests
  final bool autoFinish; // automatically finish sessions
  final bool minimizeToTray; // minimize to tray instead of exiting the app
  final bool launchAtStartup; // Tracks if the option is enabled on Linux
  final bool autoStartLaunchMinimized; // start hidden in tray (only available when launchAtStartup is true)
  final bool https;
  final SendMode sendMode;
  final bool saveWindowPlacement;
  final bool enableAnimations;
  final DeviceType? deviceType;
  final String? deviceModel;

  const SettingsState({
    required this.showToken,
    required this.alias,
    required this.theme,
    required this.colorMode,
    required this.locale,
    required this.port,
    required this.multicastGroup,
    required this.destination,
    required this.saveToGallery,
    required this.saveToHistory,
    required this.quickSave,
    required this.autoFinish,
    required this.minimizeToTray,
    required this.launchAtStartup,
    required this.autoStartLaunchMinimized,
    required this.https,
    required this.sendMode,
    required this.saveWindowPlacement,
    required this.enableAnimations,
    required this.deviceType,
    required this.deviceModel,
  });
}
