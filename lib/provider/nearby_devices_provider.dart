import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/service/polling_service.dart';

final nearbyDevicesProvider = StreamProvider.autoDispose<List<Device>>((ref) {
  final networkInfo = ref.watch(networkInfoProvider)!;
  final localIp = networkInfo.localIp;

  if (localIp == null) {
    return Stream.value([]);
  }

  return PollingService(localIp.split('.').take(3).join('.')).startPolling();
});
