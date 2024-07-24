import 'package:collection/collection.dart';
import 'package:common/model/device.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';

extension FavoriteDevicesExt on Iterable<FavoriteDevice> {
  /// Returns the favorite device with the given [device] or null if not found.
  FavoriteDevice? findDevice(Device device) {
    return firstWhereOrNull((e) => e.fingerprint == device.fingerprint);
  }

  /// Returns true if the list contains the given [device].
  bool containsDevice(Device device) {
    return any((e) => e.fingerprint == device.fingerprint);
  }
}
