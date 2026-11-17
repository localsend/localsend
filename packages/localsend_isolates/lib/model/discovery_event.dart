import 'package:localsend_isolates/model/device.dart';

/// An event of the running discovery.
sealed class DiscoveryEvent {
  const DiscoveryEvent();
}

/// The state of a confirmed device changed: it was discovered or confirmed
/// again, or a request to it failed. Carries the merged state, so the device
/// re-appears with everything known about its channels so far.
class DiscoveryDeviceEvent extends DiscoveryEvent {
  final Device device;

  const DiscoveryDeviceEvent({required this.device});
}

/// A device was heard announcing itself but did not answer the register
/// request, typically because a firewall blocks its server.
///
/// Nothing about such a device is verified (announcements are
/// unauthenticated): it is for diagnostics only and must not be offered as a
/// transfer target.
class DiscoveryUnreachableEvent extends DiscoveryEvent {
  /// The device as its announcements claim it.
  final Device device;

  /// Why the most recent register request failed, for display.
  final String error;

  const DiscoveryUnreachableEvent({required this.device, required this.error});
}
