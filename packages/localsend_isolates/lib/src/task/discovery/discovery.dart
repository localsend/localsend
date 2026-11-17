import 'dart:async';

import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/discovery_event.dart';
import 'package:localsend_isolates/rust/api/discovery.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Discovery');

final discoveryProvider = Provider((ref) {
  return DiscoveryService(ref);
});

/// Owns the Rust discovery (`core/discovery`): the multicast sockets, the
/// register requests answering announcements, the subnet scans and the store
/// of devices all live on the Rust side. This service configures it from the
/// [syncProvider] state and maps every observation to a [DiscoveryEvent].
class DiscoveryService {
  DiscoveryService(this._ref);

  final Ref _ref;
  RsDiscovery? _discovery;
  Completer<void> _retryCompleter = Completer();
  bool _listening = false;

  /// Whether the current discovery was stopped by [restartListener], as
  /// opposed to stopping itself because the multicast sockets failed.
  bool _restartRequested = false;

  /// Starts the discovery and emits its events on this one stream.
  ///
  /// A [DiscoveryDeviceEvent] carries a confirmed device whose state changed:
  /// answered announcements, scan results, devices fed in via
  /// [observeInbound] and outcomes reported via [reportOutbound].
  /// A [DiscoveryUnreachableEvent] carries a device that was only heard
  /// announcing itself and did not answer.
  Stream<DiscoveryEvent> startListener() {
    if (_listening) {
      _logger.info('Already listening to discovery');
      return const Stream.empty();
    }

    _listening = true;

    final events = StreamController<DiscoveryEvent>();
    unawaited(_runListener(events));
    return events.stream;
  }

  Future<void> _runListener(StreamController<DiscoveryEvent> events) async {
    // Announcements are only answered while the server runs: the answer would
    // advertise an HTTP port that nobody listens on otherwise.
    _ref.stream(syncProvider).listen((event) {
      if (event.prev.serverRunning != event.next.serverRunning) {
        unawaited(_discovery?.setAnswerAnnouncements(answer: event.next.serverRunning));
      }
    });

    while (true) {
      final syncState = _ref.read(syncProvider);

      final RsDiscovery discovery;
      try {
        discovery = await startDiscovery(
          group: syncState.multicastGroup,
          port: syncState.port,
          networkWhitelist: syncState.networkWhitelist,
          networkBlacklist: syncState.networkBlacklist,
          alias: syncState.alias,
          version: protocolVersion,
          deviceModel: syncState.deviceInfo.deviceModel,
          deviceType: syncState.deviceInfo.deviceType.toRust(),
          fingerprint: syncState.securityContext.certificateHash,
          protocol: syncState.protocol.toRust(),
          download: syncState.download,
          certPem: syncState.securityContext.certificate,
          privateKeyPem: syncState.securityContext.privateKey,
          timeoutMs: BigInt.from(syncState.discoveryTimeout),
        );
      } catch (e) {
        _logger.warning('Could not start discovery (group: ${syncState.multicastGroup}, port: ${syncState.port})', e);
        // Wait for the next restart request instead of hot-looping
        _retryCompleter = Completer();
        await _retryCompleter.future;
        continue;
      }

      final multicastError = await discovery.multicastError();
      if (multicastError != null) {
        _logger.warning('Discovery runs without multicast (group: ${syncState.multicastGroup}, port: ${syncState.port}): $multicastError');
      }

      if (!_ref.read(syncProvider).serverRunning) {
        await discovery.setAnswerAnnouncements(answer: false);
      }

      _discovery = discovery;

      // Tell everyone in the network that I am online.
      unawaited(discovery.announce());

      await for (final event in discovery.listen()) {
        if (!events.isClosed) {
          events.add(event.toDiscoveryEvent());
        }
      }

      _discovery = null;

      if (_restartRequested) {
        // The stream ended because [restartListener] stopped the discovery.
        _restartRequested = false;
      } else {
        // The stream ended because the multicast sockets failed permanently,
        // e.g. because iOS reclaimed them while the app was suspended.
        // The delay avoids hot-looping when binding keeps succeeding but the
        // sockets keep failing right away.
        _logger.warning('Discovery stopped unexpectedly (multicast sockets failed). Restarting discovery.');
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
  }

  /// Restarts the discovery, e.g. after the port or the network settings changed.
  void restartListener() {
    final discovery = _discovery;
    if (discovery != null) {
      // Ends the listen stream, which makes [startListener] rebind.
      _restartRequested = true;
      unawaited(discovery.stop());
    } else if (!_retryCompleter.isCompleted) {
      // Starting failed previously; let [startListener] try again.
      _retryCompleter.complete();
    }
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    final discovery = _discovery;
    if (discovery == null) {
      _logger.info('Discovery is not running, skipping announcement');
      return;
    }

    _logger.info('Announce via UDP');
    await discovery.announce();
  }

  /// Scans the subnet of [networkInterface] by probing every host over HTTP,
  /// for networks that do not carry multicast.
  /// Found devices arrive on the [startListener] stream; this method returns
  /// once the whole scan has finished.
  Future<void> scanSubnet({required String networkInterface, required int port, required bool https}) async {
    final discovery = _discovery;
    if (discovery == null) {
      _logger.info('Discovery is not running, skipping subnet scan');
      return;
    }

    await discovery.scanSubnet(
      interfaceIp: networkInterface,
      port: port,
      protocol: https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http,
    );
  }

  /// Discovers devices in stages, cheapest first: announces this device and
  /// probes the known addresses of the favorites, then falls back to scanning
  /// the subnets of [networkInterfaces] when nothing was confirmed within the
  /// grace period.
  /// Found devices arrive on the [startListener] stream; this method returns
  /// once every stage has finished, including the whole announcement burst.
  Future<void> discoverStaged({
    required List<(String, int)> favorites,
    required List<String> networkInterfaces,
    required int port,
    required bool https,
    required Duration grace,
  }) async {
    final discovery = _discovery;
    if (discovery == null) {
      _logger.info('Discovery is not running, skipping staged discovery');
      return;
    }

    final protocol = https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http;
    await discovery.discoverStaged(
      channels: [
        for (final (host, port) in favorites) RsDeviceChannel(host: host, port: port, protocol: protocol),
      ],
      interfaceIps: networkInterfaces,
      port: port,
      protocol: protocol,
      graceMs: BigInt.from(grace.inMilliseconds),
    );
  }

  /// The retained observations of a stored device, oldest first, including a
  /// device that was only heard announcing itself.
  /// Empty when the fingerprint is unknown or the discovery is not running.
  Future<List<DeviceLog>> deviceLogs(String fingerprint) async {
    final discovery = _discovery;
    if (discovery == null) {
      _logger.info('Discovery is not running, skipping device logs');
      return const [];
    }

    final logs = await discovery.deviceLogs(fingerprint: fingerprint);
    return logs.map((log) => log.toDeviceLog()).toList();
  }

  /// Feeds a device that reached this device's HTTP server into the store,
  /// e.g. one that registered. Only the inbound direction of its address is
  /// confirmed: whether the device can be dialed back there is then tested by
  /// the discovery in the background.
  /// The device comes back on the [startListener] stream, and again with the
  /// outcome of that test.
  Future<void> observeInbound(Device device) async {
    final discovery = _discovery;
    final ip = device.ip;
    if (discovery == null || ip == null) {
      // A device lost here re-appears on its next register request, which the
      // announcement sent when the discovery (re)starts triggers by itself.
      _logger.info('Discovery is not running, skipping device ${device.alias} ($ip)');
      return;
    }

    await discovery.observeInbound(device: device.toRsDiscoveredDevice(ip));
  }

  /// Records the outcome of a request the application itself sent to the
  /// stored device with the given [fingerprint] over [channel], e.g. a
  /// transfer: without an [error] the device was reached, with one (the
  /// reason, for display) it could not be reached at all.
  /// The device comes back on the [startListener] stream.
  ///
  /// Only report failures to reach the device, not requests that the device
  /// answered with an error.
  Future<void> reportOutbound(String fingerprint, HttpChannel channel, {String? error}) async {
    final discovery = _discovery;
    if (discovery == null) {
      _logger.info('Discovery is not running, skipping outcome of ${channel.host}:${channel.port}');
      return;
    }

    final known = await discovery.reportOutbound(fingerprint: fingerprint, channel: channel.toRsDeviceChannel(), error: error);
    if (!known) {
      _logger.info('Unknown device, skipping outcome of ${channel.host}:${channel.port}');
    }
  }
}
