import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'nearby_devices_state.freezed.dart';

@freezed
class NearbyDevicesState with _$NearbyDevicesState {
  const factory NearbyDevicesState({
    required bool running,
    required Map<String, Device> devices, // ip -> device
  }) = _NearbyDevicesState;
}
