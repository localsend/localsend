import 'package:dart_mappable/dart_mappable.dart';
import 'package:uuid/uuid.dart';

part 'favorite_device.mapper.dart';

const _uuid = Uuid();

@MappableClass()
class FavoriteDevice with FavoriteDeviceMappable {
  final String id;
  final String fingerprint;
  final String ip;
  final int port;
  final String alias;

  const FavoriteDevice({
    required this.id,
    required this.fingerprint,
    required this.ip,
    required this.port,
    required this.alias,
  });

  factory FavoriteDevice.fromValues({
    required String fingerprint,
    required String ip,
    required int port,
    required String alias,
  }) {
    return FavoriteDevice(
      id: _uuid.v1(),
      fingerprint: fingerprint,
      ip: ip,
      port: port,
      alias: alias,
    );
  }

  static const fromJson = FavoriteDeviceMapper.fromJson;
}
