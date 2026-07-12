import 'package:collection/collection.dart';
import 'package:common/constants.dart';
import 'package:common/model/device.dart';

class KnownPeerEndpoint {
  final String ip;
  final int port;
  final bool https;
  final int lastSeen;
  final int failures;

  const KnownPeerEndpoint({
    required this.ip,
    required this.port,
    required this.https,
    required this.lastSeen,
    this.failures = 0,
  });

  factory KnownPeerEndpoint.fromJson(Map<String, dynamic> json) {
    return KnownPeerEndpoint(
      ip: json['ip'] as String,
      port: json['port'] as int,
      https: json['https'] as bool? ?? true,
      lastSeen: json['lastSeen'] as int? ?? 0,
      failures: json['failures'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'port': port,
      'https': https,
      'lastSeen': lastSeen,
      'failures': failures,
    };
  }

  String get key => '$ip:$port:${https ? 'https' : 'http'}';

  KnownPeerEndpoint copyWith({
    String? ip,
    int? port,
    bool? https,
    int? lastSeen,
    int? failures,
  }) {
    return KnownPeerEndpoint(
      ip: ip ?? this.ip,
      port: port ?? this.port,
      https: https ?? this.https,
      lastSeen: lastSeen ?? this.lastSeen,
      failures: failures ?? this.failures,
    );
  }
}

class KnownPeer {
  final String fingerprint;
  final String alias;
  final String? deviceModel;
  final DeviceType deviceType;
  final bool download;
  final List<KnownPeerEndpoint> endpoints;
  final int lastSeen;

  const KnownPeer({
    required this.fingerprint,
    required this.alias,
    required this.deviceModel,
    required this.deviceType,
    required this.download,
    required this.endpoints,
    required this.lastSeen,
  });

  factory KnownPeer.fromJson(Map<String, dynamic> json) {
    return KnownPeer(
      fingerprint: json['fingerprint'] as String,
      alias: json['alias'] as String,
      deviceModel: json['deviceModel'] as String?,
      deviceType:
          DeviceType.values.firstWhereOrNull(
            (type) => type.name == json['deviceType'],
          ) ??
          DeviceType.desktop,
      download: json['download'] as bool? ?? false,
      endpoints: ((json['endpoints'] as List?) ?? [])
          .whereType<Map>()
          .map(
            (entry) =>
                KnownPeerEndpoint.fromJson(entry.cast<String, dynamic>()),
          )
          .toList(),
      lastSeen: json['lastSeen'] as int? ?? 0,
    );
  }

  factory KnownPeer.fromDevice(Device device, int now) {
    return KnownPeer(
      fingerprint: device.fingerprint,
      alias: device.alias,
      deviceModel: device.deviceModel,
      deviceType: device.deviceType,
      download: device.download,
      endpoints: [
        if (device.ip != null)
          KnownPeerEndpoint(
            ip: device.ip!,
            port: device.port,
            https: device.https,
            lastSeen: now,
          ),
      ],
      lastSeen: now,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fingerprint': fingerprint,
      'alias': alias,
      'deviceModel': deviceModel,
      'deviceType': deviceType.name,
      'download': download,
      'endpoints': endpoints.map((endpoint) => endpoint.toJson()).toList(),
      'lastSeen': lastSeen,
    };
  }

  KnownPeer mergeDevice(Device device, int now) {
    final updatedEndpoint = device.ip == null
        ? null
        : KnownPeerEndpoint(
            ip: device.ip!,
            port: device.port,
            https: device.https,
            lastSeen: now,
          );
    final endpointByKey = {
      for (final endpoint in endpoints) endpoint.key: endpoint,
      if (updatedEndpoint != null) updatedEndpoint.key: updatedEndpoint,
    };
    final sortedEndpoints = endpointByKey.values
        .sorted((a, b) => b.lastSeen.compareTo(a.lastSeen))
        .take(maxKnownPeerEndpoints)
        .toList();

    return KnownPeer(
      fingerprint: fingerprint,
      alias: device.alias,
      deviceModel: device.deviceModel,
      deviceType: device.deviceType,
      download: device.download,
      endpoints: sortedEndpoints,
      lastSeen: now,
    );
  }

  KnownPeer markFailures(Set<String> endpointKeys) {
    final updatedEndpoints = endpoints
        .map((endpoint) {
          if (!endpointKeys.contains(endpoint.key)) {
            return endpoint;
          }
          return endpoint.copyWith(failures: endpoint.failures + 1);
        })
        .where((endpoint) => endpoint.failures < 3)
        .toList();

    return KnownPeer(
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType,
      download: download,
      endpoints: updatedEndpoints,
      lastSeen: lastSeen,
    );
  }
}
