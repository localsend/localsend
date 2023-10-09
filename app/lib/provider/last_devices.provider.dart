import 'package:localsend_app/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

final lastDevicesProvider = NotifierProvider<LastDevicesNotifier, List<Device>>((ref) {
  return LastDevicesNotifier();
});

class LastDevicesNotifier extends Notifier<List<Device>> {
  LastDevicesNotifier();

  @override
  List<Device> init() => [];

  void addDevice(Device device) {
    state = {
      device,
      ...state,
    }.toList().take(5).toList();
  }
}
