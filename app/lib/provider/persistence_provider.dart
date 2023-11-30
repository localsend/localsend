import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/model/persistence/stored_security_context.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:localsend_app/util/shared_preferences_portable.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger('PersistenceService');

// Version of the storage
const _version = 'ls_version';

// Security keys (generated on first app start)
const _securityContext = 'ls_security_context';

// Received file history
const _receiveHistory = 'ls_receive_history';

// Favorites
const _favorites = 'ls_favorites';

// App Window Offset and Size info
const _windowOffsetX = 'ls_window_offset_x';
const _windowOffsetY = 'ls_window_offset_y';
const _windowWidth = 'ls_window_width';
const _windowHeight = 'ls_window_height';
const _saveWindowPlacement = 'ls_save_window_placement';

// Settings
const _showToken = 'ls_show_token';
const _aliasKey = 'ls_alias';
const _themeKey = 'ls_theme'; // now called brightness
const _colorKey = 'ls_color';
const _localeKey = 'ls_locale';
const _portKey = 'ls_port';
const _multicastGroupKey = 'ls_multicast_group';
const _destinationKey = 'ls_destination';
const _saveToGallery = 'ls_save_to_gallery';
const _saveToHistory = 'ls_save_to_history';
const _quickSave = 'ls_quick_save';
const _autoFinish = 'ls_auto_finish';
const _minimizeToTray = 'ls_minimize_to_tray';
const _launchAtStartup = 'ls_launch_at_startup';
const _autoStartLaunchMinimized = 'ls_auto_start_launch_minimized';
const _https = 'ls_https';
const _sendMode = 'ls_send_mode';
const _enableAnimations = 'ls_enable_animations';
const _deviceType = 'ls_device_type';
const _deviceModel = 'ls_device_model';

final persistenceProvider = Provider<PersistenceService>((ref) {
  throw Exception('persistenceProvider not initialized');
});

/// This service abstracts the persistence layer.
class PersistenceService {
  final SharedPreferences _prefs;

  PersistenceService._(this._prefs);

  static Future<PersistenceService> initialize(DynamicColors? dynamicColors) async {
    SharedPreferences prefs;

    if (checkPlatform([TargetPlatform.windows]) && SharedPreferencesPortable.exists()) {
      _logger.info('Using portable settings.');
      SharedPreferencesStorePlatform.instance = SharedPreferencesPortable();
    }

    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      if (checkPlatform([TargetPlatform.windows])) {
        _logger.info('Could not initialize SharedPreferences, trying to delete corrupted settings file');
        final settingsDir = await path.getApplicationSupportDirectory();
        final prefsFile = p.join(settingsDir.path, 'shared_preferences.json');
        File(prefsFile).deleteSync();
        prefs = await SharedPreferences.getInstance();
      } else {
        throw Exception('Could not initialize SharedPreferences');
      }
    }

    // Locale configuration upon persistence initialisation to prevent unlocalised Alias generation
    final persistedLocale = prefs.getString(_localeKey);
    if (persistedLocale == null) {
      LocaleSettings.useDeviceLocale();
    } else {
      LocaleSettings.setLocaleRaw(persistedLocale);
    }

    if (prefs.getInt(_version) == null) {
      await prefs.setInt(_version, 1);
    }

    if (prefs.getString(_showToken) == null) {
      await prefs.setString(_showToken, const Uuid().v4());
    }

    if (prefs.getString(_aliasKey) == null) {
      await prefs.setString(_aliasKey, generateRandomAlias());
    }

    if (prefs.getString(_securityContext) == null) {
      await prefs.setString(_securityContext, jsonEncode(generateSecurityContext()));
    }

    final supportsDynamicColors = dynamicColors != null;
    if (prefs.getString(_colorKey) == null) {
      await _initColorSetting(prefs, supportsDynamicColors);
    } else {
      // fix when device does not support dynamic colors
      final supported = supportsDynamicColors ? ColorMode.values : ColorMode.values.where((e) => e != ColorMode.system);
      final colorMode = supported.firstWhereOrNull((color) => color.name == prefs.getString(_colorKey));
      if (colorMode == null) {
        await _initColorSetting(prefs, supportsDynamicColors);
      }
    }

    return PersistenceService._(prefs);
  }

  static Future<void> _initColorSetting(SharedPreferences prefs, bool supportsDynamicColors) async {
    await prefs.setString(
        _colorKey, checkPlatform([TargetPlatform.android]) && supportsDynamicColors ? ColorMode.system.name : ColorMode.localsend.name);
  }

  StoredSecurityContext getSecurityContext() {
    final contextRaw = _prefs.getString(_securityContext)!;
    return StoredSecurityContext.fromJson(jsonDecode(contextRaw));
  }

  Future<void> setSecurityContext(StoredSecurityContext context) async {
    await _prefs.setString(_securityContext, jsonEncode(context));
  }

  List<ReceiveHistoryEntry> getReceiveHistory() {
    final historyRaw = _prefs.getStringList(_receiveHistory) ?? [];
    return historyRaw.map((entry) => ReceiveHistoryEntry.fromJson(jsonDecode(entry))).toList();
  }

  Future<void> setReceiveHistory(List<ReceiveHistoryEntry> entries) async {
    final historyRaw = entries.map((entry) => jsonEncode(entry.toJson())).toList();
    await _prefs.setStringList(_receiveHistory, historyRaw);
  }

  List<FavoriteDevice> getFavorites() {
    final favoritesRaw = _prefs.getStringList(_favorites) ?? [];
    return favoritesRaw.map((entry) => FavoriteDevice.fromJson(jsonDecode(entry))).toList();
  }

  Future<void> setFavorites(List<FavoriteDevice> entries) async {
    final favoritesRaw = entries.map((entry) => jsonEncode(entry.toJson())).toList();
    await _prefs.setStringList(_favorites, favoritesRaw);
  }

  String getShowToken() {
    return _prefs.getString(_showToken)!;
  }

  String getAlias() {
    return _prefs.getString(_aliasKey) ?? generateRandomAlias();
  }

  Future<void> setAlias(String alias) async {
    await _prefs.setString(_aliasKey, alias);
  }

  ThemeMode getTheme() {
    final value = _prefs.getString(_themeKey);
    if (value == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values.firstWhereOrNull((theme) => theme.name == value) ?? ThemeMode.system;
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _prefs.setString(_themeKey, theme.name);
  }

  ColorMode getColorMode() {
    final value = _prefs.getString(_colorKey);
    if (value == null) {
      return ColorMode.system;
    }
    return ColorMode.values.firstWhereOrNull((color) => color.name == value) ?? ColorMode.system;
  }

  Future<void> setColorMode(ColorMode color) async {
    await _prefs.setString(_colorKey, color.name);
  }

  AppLocale? getLocale() {
    final value = _prefs.getString(_localeKey);
    if (value == null) {
      return null;
    }
    return AppLocale.values.firstWhereOrNull((locale) => locale.languageTag == value);
  }

  Future<void> setLocale(AppLocale? locale) async {
    if (locale == null) {
      await _prefs.remove(_localeKey);
    } else {
      await _prefs.setString(_localeKey, locale.languageTag);
    }
  }

  int getPort() {
    return _prefs.getInt(_portKey) ?? defaultPort;
  }

  Future<void> setPort(int port) async {
    await _prefs.setInt(_portKey, port);
  }

  String getMulticastGroup() {
    return _prefs.getString(_multicastGroupKey) ?? defaultMulticastGroup;
  }

  Future<void> setMulticastGroup(String group) async {
    await _prefs.setString(_multicastGroupKey, group);
  }

  String? getDestination() {
    return _prefs.getString(_destinationKey);
  }

  Future<void> setDestination(String? destination) async {
    if (destination == null) {
      await _prefs.remove(_destinationKey);
    } else {
      await _prefs.setString(_destinationKey, destination);
    }
  }

  bool isSaveToGallery() {
    return _prefs.getBool(_saveToGallery) ?? true;
  }

  Future<void> setSaveToGallery(bool saveToGallery) async {
    await _prefs.setBool(_saveToGallery, saveToGallery);
  }

  bool isSaveToHistory() {
    return _prefs.getBool(_saveToHistory) ?? true;
  }

  Future<void> setSaveToHistory(bool saveToHistory) async {
    await _prefs.setBool(_saveToHistory, saveToHistory);
  }

  bool isQuickSave() {
    return _prefs.getBool(_quickSave) ?? false;
  }

  Future<void> setQuickSave(bool quickSave) async {
    await _prefs.setBool(_quickSave, quickSave);
  }

  bool isAutoFinish() {
    return _prefs.getBool(_autoFinish) ?? false;
  }

  Future<void> setAutoFinish(bool autoFinish) async {
    await _prefs.setBool(_autoFinish, autoFinish);
  }

  bool isMinimizeToTray() {
    return _prefs.getBool(_minimizeToTray) ?? false;
  }

  Future<void> setMinimizeToTray(bool minimizeToTray) async {
    await _prefs.setBool(_minimizeToTray, minimizeToTray);
  }

  bool isLaunchAtStartup() {
    return _prefs.getBool(_launchAtStartup) ?? false;
  }

  Future<void> setLaunchAtStartup(bool launchAtStartup) async {
    await _prefs.setBool(_launchAtStartup, launchAtStartup);
  }

  bool isAutoStartLaunchMinimized() {
    return _prefs.getBool(_autoStartLaunchMinimized) ?? true;
  }

  Future<void> setAutoStartLaunchMinimized(bool launchMinimized) async {
    await _prefs.setBool(_autoStartLaunchMinimized, launchMinimized);
  }

  bool isHttps() {
    return _prefs.getBool(_https) ?? true;
  }

  Future<void> setHttps(bool https) async {
    await _prefs.setBool(_https, https);
  }

  SendMode getSendMode() {
    return SendMode.values.firstWhereOrNull((m) => m.name == _prefs.getString(_sendMode)) ?? SendMode.single;
  }

  Future<void> setSendMode(SendMode mode) async {
    await _prefs.setString(_sendMode, mode.name);
  }

  Future<void> setWindowOffsetX(double x) async {
    await _prefs.setDouble(_windowOffsetX, x);
  }

  Future<void> setWindowOffsetY(double y) async {
    await _prefs.setDouble(_windowOffsetY, y);
  }

  Future<void> setWindowHeight(double height) async {
    await _prefs.setDouble(_windowHeight, height);
  }

  Future<void> setWindowWidth(double width) async {
    await _prefs.setDouble(_windowWidth, width);
  }

  WindowDimensions getWindowLastDimensions() {
    Size? size;
    Offset? position;
    final offsetX = _prefs.getDouble(_windowOffsetX);
    final offsetY = _prefs.getDouble(_windowOffsetY);
    final width = _prefs.getDouble(_windowWidth);
    final height = _prefs.getDouble(_windowHeight);
    if (width != null && height != null) size = Size(width, height);
    if (offsetX != null && offsetY != null) position = Offset(offsetX, offsetY);

    final dimensions = {'size': size, 'position': position};
    return dimensions;
  }

  Future<void> setSaveWindowPlacement(bool savePlacement) async {
    await _prefs.setBool(_saveWindowPlacement, savePlacement);
  }

  bool getSaveWindowPlacement() {
    if (!checkPlatformIsNotWaylandDesktop()) return false;
    return _prefs.getBool(_saveWindowPlacement) ?? true;
  }

  Future<void> setEnableAnimations(bool enableAnimations) async {
    await _prefs.setBool(_enableAnimations, enableAnimations);
  }

  bool getEnableAnimations() {
    return _prefs.getBool(_enableAnimations) ?? true;
  }

  DeviceType? getDeviceType() {
    return DeviceType.values.firstWhereOrNull((m) => m.name == _prefs.getString(_deviceType));
  }

  Future<void> setDeviceType(DeviceType deviceType) async {
    await _prefs.setString(_deviceType, deviceType.name);
  }

  String? getDeviceModel() {
    return _prefs.getString(_deviceModel);
  }

  Future<void> setDeviceModel(String deviceModel) async {
    await _prefs.setString(_deviceModel, deviceModel);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
