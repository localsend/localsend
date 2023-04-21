import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';

final deviceRawInfoProvider = Provider<DeviceInfoResult>((ref) {
  throw Exception('settingsProvider not initialized');
});

final deviceInfoProvider = Provider((ref) {
  final networkInfo = ref.watch(networkStateProvider);
  final serverState = ref.watch(serverProvider);
  final rawInfo = ref.watch(deviceRawInfoProvider);
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
  );
});
