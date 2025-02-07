import 'package:dart_mappable/dart_mappable.dart';

part 'device.mapper.dart';

@MappableEnum(defaultValue: DeviceType.desktop)
enum DeviceType {
  mobile,
  desktop,
  web,
  headless,
  server,
}

@MappableClass()
sealed class DiscoveryMethod with DiscoveryMethodMappable {
  const DiscoveryMethod();
}

@MappableClass()
class MulticastDiscovery extends DiscoveryMethod with MulticastDiscoveryMappable {
  const MulticastDiscovery();
}

@MappableClass()
class HttpDiscovery extends DiscoveryMethod with HttpDiscoveryMappable {
  final String ip;

  const HttpDiscovery({required this.ip});
}

@MappableClass()
class SignalingDiscovery extends DiscoveryMethod with SignalingDiscoveryMappable {
  final String signalingServer;

  const SignalingDiscovery({required this.signalingServer});
}

enum TransmissionMethod {
  http('HTTP'),
  webrtc('WebRTC');

  final String label;

  const TransmissionMethod(this.label);
}

/// Internal device model.
/// It gets not serialized.
@MappableClass()
class Device with DeviceMappable {
  /// A unique ID provided by the signaling server.
  final String? signalingId;

  /// The IP address of the device.
  /// Is null when found via signaling.
  final String? ip;

  final String version;
  final int port;
  final bool https;
  final String fingerprint;
  final String alias;
  final String? deviceModel;
  final DeviceType deviceType;
  final bool download;
  final Set<DiscoveryMethod> discoveryMethods;

  Set<TransmissionMethod> get transmissionMethods {
    bool http = false;
    bool webrtc = false;

    for (final method in discoveryMethods) {
      if (method is SignalingDiscovery) {
        webrtc = true;
      } else {
        http = true;
      }
    }

    final methods = <TransmissionMethod>{};
    if (http) {
      methods.add(TransmissionMethod.http);
    }
    if (webrtc) {
      methods.add(TransmissionMethod.webrtc);
    }

    return methods;
  }

  const Device({
    required this.signalingId,
    required this.ip,
    required this.version,
    required this.port,
    required this.https,
    required this.fingerprint,
    required this.alias,
    required this.deviceModel,
    required this.deviceType,
    required this.download,
    required this.discoveryMethods,
  });

  static const empty = Device(
    signalingId: null,
    ip: null,
    version: '',
    port: -1,
    https: false,
    fingerprint: '',
    alias: '',
    deviceModel: null,
    deviceType: DeviceType.desktop,
    download: false,
    discoveryMethods: {},
  );
}
