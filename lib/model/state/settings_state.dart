import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/gen/strings.g.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String showToken, // the token to show / maximize the window because only one instance is allowed
    required String alias,
    required ThemeMode theme,
    required AppLocale? locale,
    required int port,
    required String multicastGroup,
    required String? destination, // null = default
    required bool saveToGallery, // only Android, iOS
    required bool quickSave, // automatically accept file requests
    required bool minimizeToTray, // minimize to tray instead of exiting the app
    required bool autoStartLaunchMinimized, // start hidden in tray (only available when launchAtStartup is true)
    required bool https,
  }) = _SettingsState;
}
