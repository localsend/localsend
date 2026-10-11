import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/util/favorites.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:test/test.dart';

void main() {
  test('refreshes a favorite address and generated alias', () {
    final favorite = _favorite(customAlias: false);

    final updated = updateFavoriteFromDevice(favorite, _device());

    expect(updated.ip, '192.168.1.42');
    expect(updated.port, 53318);
    expect(updated.alias, 'Phone');
  });

  test('keeps a custom favorite alias while refreshing its address', () {
    final favorite = _favorite(customAlias: true, alias: 'My phone');

    final updated = updateFavoriteFromDevice(favorite, _device());

    expect(updated.ip, '192.168.1.42');
    expect(updated.port, 53318);
    expect(updated.alias, 'My phone');
  });
}

FavoriteDevice _favorite({required bool customAlias, String alias = 'Old phone'}) {
  return FavoriteDevice(
    id: 'favorite-id',
    fingerprint: 'phone-fingerprint',
    ip: '192.168.1.10',
    port: 53317,
    alias: alias,
    customAlias: customAlias,
  );
}

Device _device() {
  return const Device(
    signalingId: null,
    ip: '192.168.1.42',
    version: '2.2',
    port: 53318,
    https: true,
    fingerprint: 'phone-fingerprint',
    alias: 'Phone',
    deviceModel: 'Samsung S23+',
    deviceType: DeviceType.mobile,
    download: false,
    channels: [],
  );
}
