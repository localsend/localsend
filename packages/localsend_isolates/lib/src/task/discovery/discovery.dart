import 'dart:async';

import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/discovery.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Discovery');

/// How many registrations are held while the discovery is down.
/// Bounded because nothing limits how many devices may register in that
/// window, and the isolate must not grow its memory from the network.
const _maxPendingDevices = 64;

/// The default of [DiscoveryService.startTimeout]. Generous compared to the
/// startup itself, which only binds the multicast sockets, because the cost
/// of waiting is invisible while the cost of skipping a scan is a device
/// list that stays empty until the user rescans by hand.
const _defaultStartTimeout = Duration(seconds: 5);

final discoveryProvider = Provider((ref) {
  return DiscoveryService(ref);
});

/// Owns the Rust discovery (`core/discovery`): the multicast sockets, the
/// register requests answering announcements, the subnet scans and the store
/// of confirmed devices all live on the Rust side. This service configures it
/// from the [syncProvider] state and maps every confirmation to a [Device].
class DiscoveryService {
  DiscoveryService(this._ref, {this.startTimeout = _defaultStartTimeout});

  final Ref _ref;

  /// How long a scan waits for the discovery to come up before it is skipped.
  ///
  /// The app dispatches its first automatic scan without awaiting the
  /// discovery startup, so that scan regularly arrives while [_discovery] is
  /// still null. Dropping it there is only recoverable on a LAN, where the
  /// startup announcement makes every peer register again; over a tailnet a
  /// dropped scan means the persisted peers are not probed until the user
  /// rescans by hand.
  final Duration startTimeout;

  RsDiscovery? _discovery;
  Completer<void> _retryCompleter = Completer();

  /// Whether the last start attempt failed and the listener is parked until
  /// [restartListener]. A scan skips immediately in this state: only a
  /// settings change can end it, so the wait of [_runningDiscovery] could
  /// never be answered.
  bool _startFailed = false;

  /// Completed once the discovery runs, re-created when it stops: what a
  /// scan awaits when it arrives while the discovery is still starting.
  Completer<void> _started = Completer();

  bool _listening = false;

  /// Whether the current discovery was stopped by [restartListener], as
  /// opposed to stopping itself because the multicast sockets failed.
  bool _restartRequested = false;

  /// Devices that registered with this device's HTTP server while the
  /// discovery was starting or restarting, by fingerprint, newest last.
  ///
  /// On a LAN such a device would come back by itself, because the
  /// announcement sent when the discovery starts makes it register again.
  /// A peer reached over a tailnet answers no announcement and its address
  /// range cannot be scanned, so dropping it here would lose it until that
  /// peer happens to probe this device again — which on Android and iOS,
  /// where the tailnet cannot be enumerated, is the only way it is ever found.
  final Map<String, Device> _pending = {};

  /// Starts the discovery and emits every device confirmation:
  /// answered announcements, scan results and devices fed in
  /// via [addDevice] all arrive on this one stream.
  Stream<Device> startListener() {
    if (_listening) {
      _logger.info('Already listening to discovery');
      return const Stream.empty();
    }

    _listening = true;

    final devices = StreamController<Device>();
    unawaited(_runListener(devices));
    return devices.stream;
  }

  Future<void> _runListener(StreamController<Device> devices) async {
    // Announcements are only answered while the server runs: the answer would
    // advertise an HTTP port that nobody listens on otherwise.
    _ref.stream(syncProvider).listen((event) {
      if (event.prev.serverRunning != event.next.serverRunning) {
        unawaited(_discovery?.setAnswerAnnouncements(answer: event.next.serverRunning));
      }
      // Applied without rebinding the sockets: the tailnet stage only runs
      // during a scan, so the next one already picks up the new value.
      if (event.prev.tailnet != event.next.tailnet) {
        unawaited(_discovery?.setTailnet(tailnet: event.next.tailnet));
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
          tailnet: syncState.tailnet,
        );
      } catch (e) {
        _logger.warning('Could not start discovery (group: ${syncState.multicastGroup}, port: ${syncState.port})', e);
        // Wait for the next restart request instead of hot-looping
        _startFailed = true;
        _retryCompleter = Completer();
        await _retryCompleter.future;
        _startFailed = false;
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
      if (!_started.isCompleted) {
        _started.complete();
      }
      await _flushPending();

      // Tell everyone in the network that I am online.
      unawaited(discovery.announce());

      await for (final device in discovery.listen()) {
        if (!devices.isClosed) {
          devices.add(device.toDevice());
        }
      }

      _discovery = null;
      // Re-armed before the restart branch below: the discovery is already down
      // at this point, so a scan arriving during the restart delay must wait for
      // the rebind rather than read the completer the previous run left completed.
      _started = Completer();

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
    final discovery = await _runningDiscovery();
    if (discovery == null) {
      _logger.warning('Discovery did not start within $startTimeout, skipping subnet scan');
      return;
    }

    await discovery.scanSubnet(
      interfaceIp: networkInterface,
      port: port,
      protocol: https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http,
    );
  }

  /// The running discovery, waited for up to [startTimeout] when it is still
  /// starting. Null when it did not come up in time, e.g. because starting
  /// failed and the retry is waiting for a settings change.
  Future<RsDiscovery?> _runningDiscovery() async {
    if (_discovery != null) {
      return _discovery;
    }
    if (_startFailed) {
      return null;
    }
    try {
      await _started.future.timeout(startTimeout);
    } on TimeoutException {
      return null;
    }
    return _discovery;
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
    final discovery = await _runningDiscovery();
    if (discovery == null) {
      _logger.warning('Discovery did not start within $startTimeout, skipping staged discovery');
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

  /// The retained confirmations of a stored device, oldest first.
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

  /// Feeds a device confirmed outside of the discovery into the store, e.g.
  /// one that registered with this device's HTTP server.
  /// The device comes back on the [startListener] stream.
  ///
  /// A device that arrives while the discovery is starting or restarting is
  /// held until it runs again, see [_pending].
  Future<void> addDevice(Device device) async {
    final ip = device.ip;
    if (ip == null) {
      _logger.info('Skipping device ${device.alias} without an address');
      return;
    }

    final discovery = _discovery;
    if (discovery == null) {
      if (_pending.length >= _maxPendingDevices) {
        _pending.remove(_pending.keys.first);
      }
      _pending[device.fingerprint] = device;
      _logger.info('Discovery is not running, holding device ${device.alias} ($ip)');
      return;
    }

    await discovery.addDevice(device: device.toRsDiscoveredDevice(ip));
  }

  /// Registers the devices held while the discovery was down, oldest first.
  Future<void> _flushPending() async {
    final discovery = _discovery;
    if (discovery == null || _pending.isEmpty) {
      return;
    }

    final pending = List<Device>.of(_pending.values);
    _pending.clear();
    _logger.info('Registering ${pending.length} device(s) held while the discovery was down');
    for (final device in pending) {
      final ip = device.ip;
      if (ip != null) {
        await discovery.addDevice(device: device.toRsDiscoveredDevice(ip));
      }
    }
  }
}
