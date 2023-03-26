import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';

final lastDevicesProvider = NotifierProvider<LastDevicesNotifier, List<Device>>(() {
  return LastDevicesNotifier();
});

class LastDevicesNotifier extends Notifier<List<Device>> {
  LastDevicesNotifier();

  @override
  List<Device> build() {
    return [];
  }

  void addDevice(Device device) {
    state = {
      device,
      ...state,
    }.toList().take(5).toList();
  }
}
