import 'package:collection/collection.dart';
import 'package:common/isolate.dart';
import 'package:common/model/device.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _listEq = const ListEquality().equals;

final settingsProvider = NotifierProvider<SettingsService, SettingsState>(
  (ref) {
    return SettingsService(ref.read(persistenceProvider));
  },
  onChanged: (_, next, ref) {
    final syncState = ref.read(parentIsolateProvider).syncState;
    if (_listEq(syncState.networkWhitelist, next.networkWhitelist) &&
        _listEq(syncState.networkBlacklist, next.networkBlacklist) &&
        syncState.multicastGroup == next.multicastGroup &&
        syncState.discoveryTimeout == next.discoveryTimeout) {
      return;
    }

    ref
        .redux(parentIsolateProvider)
        .dispatch(
          IsolateSyncSettingsAction(
            networkWhitelist: next.networkWhitelist,
            networkBlacklist: next.networkBlacklist,
            multicastGroup: next.multicastGroup,
            discoveryTimeout: next.discoveryTimeout,
          ),
        );
  },
);

class SettingsService extends PureNotifier<SettingsState> {
  final PersistenceService _persistence;

  SettingsService(this._persistence);

  @override
  SettingsState init() => SettingsState(
    showToken: _persistence.getShowToken(),
    alias: _persistence.getAlias(),
    theme: _persistence.getTheme(),
    colorMode: _persistence.getColorMode(),
    locale: _persistence.getLocale(),
    port: _persistence.getPort(),
    networkWhitelist: _persistence.getNetworkWhitelist(),
    networkBlacklist: _persistence.getNetworkBlacklist(),
    multicastGroup: _persistence.getMulticastGroup(),
    destination: _persistence.getDestination(),
    saveToGallery: _persistence.isSaveToGallery(),
    saveToHistory: _persistence.isSaveToHistory(),
    quickSave: _persistence.isQuickSave(),
    quickSaveFromFavorites: _persistence.isQuickSaveFromFavorites(),
    receivePin: _persistence.getReceivePin(),
    autoFinish: _persistence.isAutoFinish(),
    minimizeToTray: _persistence.isMinimizeToTray(),
    https: _persistence.isHttps(),
    sendMode: _persistence.getSendMode(),
    saveWindowPlacement: _persistence.getSaveWindowPlacement(),
    enableAnimations: _persistence.getEnableAnimations(),
    deviceType: _persistence.getDeviceType(),
    deviceModel: _persistence.getDeviceModel(),
    shareViaLinkAutoAccept: _persistence.getShareViaLinkAutoAccept(),
    discoveryTimeout: _persistence.getDiscoveryTimeout(),
    advancedSettings: _persistence.getAdvancedSettingsEnabled(),
  );

  Future<void> setAlias(String alias) async {
    await _persistence.setAlias(alias);
    state = state.copyWith(
      alias: alias,
    );
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _persistence.setTheme(theme);
    state = state.copyWith(
      theme: theme,
    );
  }

  Future<void> setColorMode(ColorMode mode) async {
    await _persistence.setColorMode(mode);
    state = state.copyWith(
      colorMode: mode,
    );
  }

  Future<void> setAdvancedSettingsEnabled(bool isEnabled) async {
    await _persistence.setAdvancedSettingsEnabled(isEnabled);
    state = state.copyWith(
      advancedSettings: isEnabled,
    );
  }

  Future<void> setLocale(AppLocale? locale) async {
    await _persistence.setLocale(locale);
    state = state.copyWith(
      locale: locale,
    );
  }

  Future<void> setPort(int port) async {
    await _persistence.setPort(port);
    state = state.copyWith(
      port: port,
    );
  }

  Future<void> setNetworkWhitelist(List<String>? whitelist) async {
    await _persistence.setNetworkWhitelist(whitelist);
    state = state.copyWith(
      networkWhitelist: whitelist,
    );
  }

  Future<void> setNetworkBlacklist(List<String>? blacklist) async {
    await _persistence.setNetworkBlacklist(blacklist);
    state = state.copyWith(
      networkBlacklist: blacklist,
    );
  }

  Future<void> setDiscoveryTimeout(int timeout) async {
    await _persistence.setDiscoveryTimeout(timeout);
    state = state.copyWith(
      discoveryTimeout: timeout,
    );
  }

  Future<void> setMulticastGroup(String group) async {
    await _persistence.setMulticastGroup(group);
    state = state.copyWith(
      multicastGroup: group,
    );
  }

  Future<void> setDestination(String? destination) async {
    await _persistence.setDestination(destination);
    state = state.copyWith(
      destination: destination,
    );
  }

  Future<void> setSaveToGallery(bool saveToGallery) async {
    await _persistence.setSaveToGallery(saveToGallery);
    state = state.copyWith(
      saveToGallery: saveToGallery,
    );
  }

  Future<void> setSaveToHistory(bool saveToHistory) async {
    await _persistence.setSaveToHistory(saveToHistory);
    state = state.copyWith(
      saveToHistory: saveToHistory,
    );
  }

  Future<void> setQuickSave(bool quickSave) async {
    await _persistence.setQuickSave(quickSave);
    state = state.copyWith(
      quickSave: quickSave,
    );
  }

  Future<void> setQuickSaveFromFavorites(bool quickSaveFromFavorites) async {
    await _persistence.setQuickSaveFromFavorites(quickSaveFromFavorites);
    state = state.copyWith(
      quickSaveFromFavorites: quickSaveFromFavorites,
    );
  }

  Future<void> setReceivePin(String? receivePin) async {
    await _persistence.setReceivePin(receivePin);
    state = state.copyWith(
      receivePin: receivePin,
    );
  }

  Future<void> setAutoFinish(bool autoFinish) async {
    await _persistence.setAutoFinish(autoFinish);
    state = state.copyWith(
      autoFinish: autoFinish,
    );
  }

  Future<void> setMinimizeToTray(bool minimizeToTray) async {
    await _persistence.setMinimizeToTray(minimizeToTray);
    state = state.copyWith(
      minimizeToTray: minimizeToTray,
    );
  }

  Future<void> setHttps(bool https) async {
    await _persistence.setHttps(https);
    state = state.copyWith(
      https: https,
    );
  }

  Future<void> setSendMode(SendMode mode) async {
    await _persistence.setSendMode(mode);
    state = state.copyWith(
      sendMode: mode,
    );
  }

  Future<void> setSaveWindowPlacement(bool savePlacement) async {
    await _persistence.setSaveWindowPlacement(savePlacement);
    state = state.copyWith(
      saveWindowPlacement: savePlacement,
    );
  }

  Future<void> setEnableAnimations(bool enableAnimations) async {
    await _persistence.setEnableAnimations(enableAnimations);
    state = state.copyWith(
      enableAnimations: enableAnimations,
    );
  }

  Future<void> setDeviceType(DeviceType deviceType) async {
    await _persistence.setDeviceType(deviceType);
    state = state.copyWith(
      deviceType: deviceType,
    );
  }

  Future<void> setDeviceModel(String deviceModel) async {
    await _persistence.setDeviceModel(deviceModel);
    state = state.copyWith(
      deviceModel: deviceModel,
    );
  }

  Future<void> setShareViaLinkAutoAccept(bool shareViaLinkAutoAccept) async {
    await _persistence.setShareViaLinkAutoAccept(shareViaLinkAutoAccept);

    state = state.copyWith(
      shareViaLinkAutoAccept: shareViaLinkAutoAccept,
    );
  }
}
