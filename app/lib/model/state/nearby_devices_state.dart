import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/device.dart';

part 'nearby_devices_state.mapper.dart';

@MappableClass()
class NearbyDevicesState with NearbyDevicesStateMappable {
  final Set<String> runningIps; // list of local ips
  final Map<String, Device> devices; // ip -> device

  const NearbyDevicesState({
    required this.runningIps,
    required this.devices,
  });
}
