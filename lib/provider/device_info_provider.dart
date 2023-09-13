import 'package:collection/collection.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';

final deviceRawInfoProvider = Provider<DeviceInfoResult>((ref) {
  throw Exception('deviceRawInfoProvider not initialized');
});

final deviceInfoProvider = ViewProvider<DeviceInfoResult>((ref) {
  final settings = ref.watch(settingsProvider);
  final rawInfo = ref.watch(deviceRawInfoProvider);

  return DeviceInfoResult(
    deviceType: settings.deviceType ?? rawInfo.deviceType,
    deviceModel: settings.deviceModel ?? rawInfo.deviceModel,
    androidSdkInt: rawInfo.androidSdkInt,
  );
});

final deviceFullInfoProvider = ViewProvider((ref) {
  final networkInfo = ref.watch(networkStateProvider);
  final serverState = ref.watch(serverProvider);
  final rawInfo = ref.watch(deviceInfoProvider);
  final securityContext = ref.read(securityProvider);
  return Device(
    ip: networkInfo.localIps.firstOrNull ?? '-',
    version: protocolVersion,
    port: serverState?.port ?? -1,
    alias: serverState?.alias ?? '-',
    https: serverState?.https ?? true,
    fingerprint: securityContext.certificateHash,
    deviceModel: rawInfo.deviceModel,
    deviceType: rawInfo.deviceType,
    download: serverState?.webSendState != null,
  );
});
