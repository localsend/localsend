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

/// A channel a device is reachable on.
@MappableClass()
sealed class DeviceChannel with DeviceChannelMappable {
  const DeviceChannel();
}

/// Whether a device can be dialed on a [HttpChannel].
@MappableEnum()
enum ChannelOutbound {
  /// No request was sent over the channel yet: the device reached this
  /// device from it, which says nothing about the way back.
  untested,

  /// The last request over the channel was answered.
  reachable,

  /// The last request over the channel failed.
  failed,
}

/// The device's HTTP server at one address, with what is known about each
/// direction: a channel that works one way does not have to work the other
/// way (e.g. because of a firewall on one of the devices).
@MappableClass()
class HttpChannel extends DeviceChannel with HttpChannelMappable {
  /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
  /// link-local IPv6 (the Rust HTTP client accepts both back as a host).
  final String host;

  /// The port of the device's HTTP server at this address.
  final int port;

  /// Whether the HTTP server uses TLS.
  final bool https;

  /// This device → the peer: whether the peer can be dialed at this address.
  final ChannelOutbound outbound;

  /// The peer → this device: when the peer last reached this device's server
  /// from this address. `null` when it never did.
  final DateTime? inbound;

  const HttpChannel({
    required this.host,
    required this.port,
    required this.https,
    this.outbound = ChannelOutbound.untested,
    this.inbound,
  });
}

/// The device is reachable over WebRTC through a signaling server.
@MappableClass()
class SignalingChannel extends DeviceChannel with SignalingChannelMappable {
  final String signalingServer;

  const SignalingChannel({required this.signalingServer});
}

/// One retained observation of a stored device, for the device details UI.
class DeviceLog {
  /// When the observation happened.
  final DateTime timestamp;

  final DeviceLogEvent event;

  const DeviceLog({
    required this.timestamp,
    required this.event,
  });
}

/// What was observed about a device, and in which direction.
///
/// The channels only identify an address: their direction state is not set.
sealed class DeviceLogEvent {
  const DeviceLogEvent();
}

/// This device → the peer: a request over the channel was answered.
class DeviceLogOutbound extends DeviceLogEvent {
  final HttpChannel channel;

  const DeviceLogOutbound({required this.channel});
}

/// This device → the peer: a request over the channel failed.
class DeviceLogOutboundFailed extends DeviceLogEvent {
  final HttpChannel channel;

  /// Why the request failed, for display.
  final String error;

  const DeviceLogOutboundFailed({required this.channel, required this.error});
}

/// The peer → this device: the peer sent a request to this device's server.
/// The channel is the address the request came from, with the port the peer
/// claims to serve on.
class DeviceLogInbound extends DeviceLogEvent {
  final HttpChannel channel;

  const DeviceLogInbound({required this.channel});
}

/// The peer → this device: an announcement of the peer was heard.
class DeviceLogMulticastInbound extends DeviceLogEvent {
  /// The address the announcement came from, in the scoped form `fe80::1%3`
  /// for link-local IPv6.
  final String host;

  const DeviceLogMulticastInbound({required this.host});
}

enum TransmissionMethod {
  http('HTTP'),
  webrtc('WebRTC')
  ;

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

  /// Every channel the device was observed on, best first.
  final List<DeviceChannel> channels;

  Set<TransmissionMethod> get transmissionMethods {
    return {
      for (final channel in channels)
        switch (channel) {
          HttpChannel() => TransmissionMethod.http,
          SignalingChannel() => TransmissionMethod.webrtc,
        },
    };
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
    required this.channels,
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
    channels: [],
  );
}
