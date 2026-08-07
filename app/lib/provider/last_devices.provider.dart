import 'dart:async';

import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// This provider stores the last devices that the user sent a file to.
/// It stores only the last 5 devices that were selected by be [AddressInputDialog].
/// LocalSend NG also persists these devices so startup scans can probe
/// previously working addresses when multicast does not cross the Wi-Fi.
final lastDevicesProvider = ReduxProvider<LastDevicesService, List<Device>>((ref) {
  return LastDevicesService(ref.read(persistenceProvider));
});

class LastDevicesService extends ReduxNotifier<List<Device>> {
  final PersistenceService? _persistence;

  LastDevicesService([this._persistence]);

  @override
  List<Device> init() => _persistence?.getLastDevices() ?? [];
}

/// Adds a device to the list of last devices.
class AddLastDeviceAction extends ReduxAction<LastDevicesService, List<Device>> {
  final Device device;

  AddLastDeviceAction(this.device);

  @override
  List<Device> reduce() {
    final updated = [
      device,
      ...state.where((existing) => existing.ip != device.ip),
    ].take(5).toList();
    unawaited(notifier._persistence?.setLastDevices(updated) ?? Future.value());
    return updated;
  }
}
