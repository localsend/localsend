import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// This provider stores the last devices that the user sent a file to.
/// It stores only the last 5 devices that were selected by be [AddressInputDialog].
/// The information is **not** persisted.
final lastDevicesProvider = ReduxProvider<LastDevicesService, List<Device>>((ref) {
  return LastDevicesService();
});

class LastDevicesService extends ReduxNotifier<List<Device>> {
  @override
  List<Device> init() => [];
}

/// Adds a device to the list of last devices.
class AddLastDeviceAction extends ReduxAction<LastDevicesService, List<Device>> {
  final Device device;

  AddLastDeviceAction(this.device);

  @override
  List<Device> reduce() {
    return {
      device,
      ...state.where(
        (previous) => device.ip == null || previous.ip != device.ip || previous.port != device.port || previous.https != device.https,
      ),
    }.take(5).toList();
  }
}
