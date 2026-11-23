import 'package:collection/collection.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_isolates/model/device.dart';

extension FavoriteDevicesExt on Iterable<FavoriteDevice> {
  /// Returns the favorite device with the given [device] or null if not found.
  /// A device without fingerprint (e.g. an anonymous sender) is never a favorite.
  FavoriteDevice? findDevice(Device device) {
    if (device.fingerprint.isEmpty) {
      return null;
    }
    return firstWhereOrNull((e) => e.fingerprint == device.fingerprint);
  }

  /// Returns true if the list contains the given [device].
  bool containsDevice(Device device) {
    return findDevice(device) != null;
  }
}
