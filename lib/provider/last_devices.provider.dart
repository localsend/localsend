import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';

final lastDevicesProvider = StateNotifierProvider<LastDevicesNotifier, List<Device>>((ref) {
  return LastDevicesNotifier();
});

class LastDevicesNotifier extends StateNotifier<List<Device>> {
  LastDevicesNotifier() : super([]);

  void addDevice(Device device) {
    state = {
      device,
      ...state,
    }.toList().take(5).toList();
  }
}
