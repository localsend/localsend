import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/discovery_event.dart';
import 'package:localsend_isolates/rust/api/discovery.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/util/rust.dart';

void main() {
  group('RsStoredDevice.toDevice', () {
    test('Should dial the best channel and keep the state of every channel in order', () {
      final device = _storedDevice(
        channels: [
          RsStoredChannel(
            host: 'fe80::1%3',
            port: 53317,
            protocol: rust_model.ProtocolType.https,
            outbound: RsOutbound.reachable,
            inboundAtMillis: BigInt.from(1700000000000),
          ),
          const RsStoredChannel(
            host: '192.168.1.2',
            port: 53318,
            protocol: rust_model.ProtocolType.http,
            outbound: RsOutbound.untested,
          ),
          const RsStoredChannel(
            host: '10.0.0.2',
            port: 53317,
            protocol: rust_model.ProtocolType.https,
            outbound: RsOutbound.failed,
          ),
        ],
      ).toDevice();

      expect(device.ip, 'fe80::1%3');
      expect(device.port, 53317);
      expect(device.https, true);
      expect(device.fingerprint, 'FINGERPRINT');
      expect(device.alias, 'Nice Banana');
      expect(device.channels, [
        HttpChannel(
          host: 'fe80::1%3',
          port: 53317,
          https: true,
          outbound: ChannelOutbound.reachable,
          inbound: DateTime.fromMillisecondsSinceEpoch(1700000000000),
        ),
        const HttpChannel(host: '192.168.1.2', port: 53318, https: false, outbound: ChannelOutbound.untested, inbound: null),
        const HttpChannel(host: '10.0.0.2', port: 53317, https: true, outbound: ChannelOutbound.failed, inbound: null),
      ]);
    });
  });

  group('RsDiscoveryEvent.toDiscoveryEvent', () {
    test('Should map a confirmed device', () {
      final event = RsDiscoveryEvent.device(_storedDevice()).toDiscoveryEvent();

      expect(event, isA<DiscoveryDeviceEvent>().having((e) => e.device, 'device', _storedDevice().toDevice()));
    });

    test('Should map an unreachable device with its error', () {
      final event = RsDiscoveryEvent.unreachable(device: _storedDevice(), error: 'connection refused').toDiscoveryEvent();

      expect(
        event,
        isA<DiscoveryUnreachableEvent>()
            .having((e) => e.device, 'device', _storedDevice().toDevice())
            .having((e) => e.error, 'error', 'connection refused'),
      );
    });
  });

  group('RsDeviceLog.toDeviceLog', () {
    const rsChannel = RsDeviceChannel(host: '192.168.1.2', port: 53317, protocol: rust_model.ProtocolType.https);
    const channel = HttpChannel(host: '192.168.1.2', port: 53317, https: true);

    DeviceLog map(RsDeviceLogEvent event) {
      return RsDeviceLog(timestampMillis: BigInt.from(1700000000000), event: event).toDeviceLog();
    }

    test('Should map the timestamp', () {
      final log = map(const RsDeviceLogEvent.outbound(channel: rsChannel));

      expect(log.timestamp, DateTime.fromMillisecondsSinceEpoch(1700000000000));
    });

    test('Should map an answered request', () {
      final log = map(const RsDeviceLogEvent.outbound(channel: rsChannel));

      expect(log.event, isA<DeviceLogOutbound>().having((e) => e.channel, 'channel', channel));
    });

    test('Should map a failed request with its error', () {
      final log = map(const RsDeviceLogEvent.outboundFailed(channel: rsChannel, error: 'timed out'));

      expect(
        log.event,
        isA<DeviceLogOutboundFailed>().having((e) => e.channel, 'channel', channel).having((e) => e.error, 'error', 'timed out'),
      );
    });

    test('Should map a request of the peer', () {
      final log = map(const RsDeviceLogEvent.inbound(channel: rsChannel));

      expect(log.event, isA<DeviceLogInbound>().having((e) => e.channel, 'channel', channel));
    });

    test('Should map a heard announcement', () {
      final log = map(const RsDeviceLogEvent.multicastInbound(host: 'fe80::1%3'));

      expect(log.event, isA<DeviceLogMulticastInbound>().having((e) => e.host, 'host', 'fe80::1%3'));
    });
  });

  group('HttpChannel.toRsDeviceChannel', () {
    test('Should map only the address', () {
      final channel = HttpChannel(
        host: '192.168.1.2',
        port: 53317,
        https: false,
        outbound: ChannelOutbound.failed,
        inbound: DateTime.fromMillisecondsSinceEpoch(1700000000000),
      );

      expect(
        channel.toRsDeviceChannel(),
        const RsDeviceChannel(host: '192.168.1.2', port: 53317, protocol: rust_model.ProtocolType.http),
      );
    });
  });

  group('Device.toRsDiscoveredDevice', () {
    test('Should use the address the request came from and the claimed port and protocol', () {
      final device = _storedDevice().toDevice().toRsDiscoveredDevice('192.168.1.77');

      expect(
        device,
        const RsDiscoveredDevice(
          alias: 'Nice Banana',
          version: '2.1',
          deviceModel: 'Pixel',
          deviceType: rust_model.DeviceType.mobile,
          fingerprint: 'FINGERPRINT',
          host: '192.168.1.77',
          port: 53317,
          protocol: rust_model.ProtocolType.https,
          download: true,
        ),
      );
    });
  });
}

RsStoredDevice _storedDevice({List<RsStoredChannel>? channels}) {
  return RsStoredDevice(
    alias: 'Nice Banana',
    version: '2.1',
    deviceModel: 'Pixel',
    deviceType: rust_model.DeviceType.mobile,
    fingerprint: 'FINGERPRINT',
    download: true,
    channels:
        channels ??
        const [
          RsStoredChannel(
            host: '192.168.1.2',
            port: 53317,
            protocol: rust_model.ProtocolType.https,
            outbound: RsOutbound.reachable,
          ),
        ],
  );
}
