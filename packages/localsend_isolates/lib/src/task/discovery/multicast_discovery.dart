import 'dart:async';

import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/rust/api/multicast.dart';
import 'package:localsend_isolates/rust/api/server.dart' show ProtocolTypeV2;
import 'package:localsend_isolates/src/isolate/child/http_provider.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Multicast');

final multicastDiscoveryProvider = Provider((ref) {
  return MulticastService(ref);
});

class MulticastService {
  MulticastService(this._ref);

  final Ref _ref;
  RsMulticast? _multicast;
  Completer<void> _retryCompleter = Completer();
  bool _listening = false;

  /// Binds the UDP sockets and listens to multicast announcements.
  /// Announcements of other devices are answered with an HTTP register
  /// request while the server is running.
  Stream<Device> startListener() async* {
    if (_listening) {
      _logger.info('Already listening to multicast');
      return;
    }

    _listening = true;

    while (true) {
      final syncState = _ref.read(syncProvider);

      final RsMulticast multicast;
      try {
        multicast = await startMulticast(
          group: syncState.multicastGroup,
          port: syncState.port,
          networkWhitelist: syncState.networkWhitelist,
          networkBlacklist: syncState.networkBlacklist,
          alias: syncState.alias,
          version: protocolVersion,
          deviceModel: syncState.deviceInfo.deviceModel,
          deviceType: syncState.deviceInfo.deviceType.toRust(),
          fingerprint: syncState.securityContext.certificateHash,
          protocol: syncState.protocol == ProtocolType.https ? ProtocolTypeV2.https : ProtocolTypeV2.http,
          download: syncState.download,
        );
      } catch (e) {
        _logger.warning('Could not start multicast discovery (group: ${syncState.multicastGroup}, port: ${syncState.port})', e);
        // Wait for the next restart request instead of hot-looping
        _retryCompleter = Completer();
        await _retryCompleter.future;
        continue;
      }

      _multicast = multicast;

      // Tell everyone in the network that I am online.
      unawaited(multicast.announce());

      await for (final event in multicast.listen()) {
        final device = event.message.toDevice(event.ip);
        yield device;

        if (_ref.read(syncProvider).serverRunning) {
          // only respond when server is running
          unawaited(_answerAnnouncement(device));
        }
      }

      // The stream ended because [restartListener] stopped the discovery.
      _multicast = null;
    }
  }

  /// Restarts the listener, e.g. after the port or the network settings changed.
  void restartListener() {
    final multicast = _multicast;
    if (multicast != null) {
      // Ends the listen stream, which makes [startListener] rebind.
      unawaited(multicast.stop());
    } else if (!_retryCompleter.isCompleted) {
      // Starting failed previously; let [startListener] try again.
      _retryCompleter.complete();
    }
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    final multicast = _multicast;
    if (multicast == null) {
      _logger.info('Multicast discovery is not running, skipping announcement');
      return;
    }

    _logger.info('Announce via UDP');
    await multicast.announce();
  }

  /// Responds to an announcement over HTTP.
  Future<void> _answerAnnouncement(Device peer) async {
    try {
      await _ref
          .read(httpProvider)
          .discovery
          .register(
            protocol: peer.getProtocolType(),
            ip: peer.ip!,
            port: peer.port,
            payload: _ref.read(syncProvider).toRegisterDto(),
          );
      _logger.info('Respond to announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) via TCP');
    } catch (e) {
      _logger.warning('Could not respond to announcement of ${peer.alias} (${peer.ip})', e);
    }
  }
}
