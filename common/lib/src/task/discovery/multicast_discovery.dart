import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/constants.dart';
import 'package:common/isolate.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/model/dto/register_dto.dart';
import 'package:common/src/isolate/child/http_provider.dart';
import 'package:common/util/network_interfaces.dart';
import 'package:common/util/sleep.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final _logger = Logger('Multicast');

final multicastDiscoveryProvider = Provider((ref) {
  return MulticastService(ref);
});

class MulticastService {
  MulticastService(this._ref);

  final Ref _ref;
  Completer<void> _cancelCompleter = Completer();
  bool _listening = false;

  /// Binds the UDP port and listen to UDP multicast packages
  /// It will automatically answer announcement messages
  Stream<Device> startListener() async* {
    if (_listening) {
      _logger.info('Already listening to multicast');
      return;
    }

    _listening = true;

    while (true) {
      final streamController = StreamController<Device>();
      final syncState = _ref.read(syncProvider);

      final sockets = await _getSockets(
        whitelist: syncState.networkWhitelist,
        blacklist: syncState.networkBlacklist,
        multicastGroup: syncState.multicastGroup,
        port: syncState.port,
      );
      for (final socket in sockets) {
        socket.socket.listen((_) {
          final datagram = socket.socket.receive();
          if (datagram == null) {
            return;
          }

          try {
            final dto = MulticastDto.fromJson(jsonDecode(utf8.decode(datagram.data)));
            if (dto.fingerprint == syncState.securityContext.certificateHash) {
              return;
            }

            final ip = datagram.address.address;
            final peer = dto.toDevice(ip, syncState.port, syncState.protocol == ProtocolType.https);
            streamController.add(peer);
            if ((dto.announcement == true || dto.announce == true) && syncState.serverRunning) {
              // only respond when server is running
              // ignore: discarded_futures
              _answerAnnouncement(peer);
            }
          } catch (e) {
            _logger.warning('Could not parse multicast message', e);
          }
        });
        _logger.info(
          'Bind UDP multicast port (ip: ${socket.interface.addresses.map((a) => a.address).toList()}, group: ${syncState.multicastGroup}, port: ${syncState.port})',
        );
      }

      // Tell everyone in the network that I am online
      sendAnnouncement(); // ignore: unawaited_futures

      _cancelCompleter = Completer();

      // ignore: unawaited_futures
      _cancelCompleter.future.then((_) {
        // ignore: discarded_futures
        streamController.close();
        for (final socket in sockets) {
          socket.socket.close();
        }
      });

      yield* streamController.stream;

      // streamController is closed because of cancel
      // wait for resources to be released (it works without on macOS, but who knows)
      await sleepAsync(500);
    }
  }

  void restartListener() {
    _cancelCompleter.complete();
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    final syncState = _ref.read(syncProvider);
    final sockets = await _getSockets(
      whitelist: syncState.networkWhitelist,
      blacklist: syncState.networkBlacklist,
      multicastGroup: syncState.multicastGroup,
    );
    final dto = _getMulticastDto(announcement: true);
    for (final wait in [100, 500, 2000]) {
      await sleepAsync(wait);

      _logger.info('Announce via UDP');
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(syncState.multicastGroup), syncState.port);
          socket.socket.close();
        } catch (e) {
          _logger.warning('Could not send multicast message', e);
        }
      }
    }
  }

  /// Responds to an announcement.
  Future<void> _answerAnnouncement(Device peer) async {
    try {
      // Answer with TCP
      await _ref.read(httpProvider).discovery.post(
            uri: ApiRoute.register.target(peer),
            json: _getRegisterDto().toJson(),
          );
      _logger.info('Respond to announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) via TCP');
    } catch (e) {
      // Fallback: Answer with UDP
      final syncState = _ref.read(syncProvider);
      final sockets = await _getSockets(
        whitelist: syncState.networkWhitelist,
        blacklist: syncState.networkBlacklist,
        multicastGroup: syncState.multicastGroup,
      );
      final dto = _getMulticastDto(announcement: false);
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(syncState.multicastGroup), syncState.port);
          socket.socket.close();
        } catch (e) {
          _logger.warning('Could not send multicast message', e);
        }
      }
      _logger.info('Respond to announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) with UDP because TCP failed');
    }
  }

  /// Returns the MulticastDto of this device in bytes.
  List<int> _getMulticastDto({required bool announcement}) {
    final syncState = _ref.read(syncProvider);
    final dto = MulticastDto(
      alias: syncState.alias,
      version: protocolVersion,
      deviceModel: syncState.deviceInfo.deviceModel,
      deviceType: syncState.deviceInfo.deviceType,
      fingerprint: syncState.securityContext.certificateHash,
      port: syncState.port,
      protocol: syncState.protocol,
      download: syncState.download,
      announcement: announcement,
      announce: announcement,
    );
    return utf8.encode(jsonEncode(dto.toJson()));
  }

  RegisterDto _getRegisterDto() {
    final syncState = _ref.read(syncProvider);
    return RegisterDto(
      alias: syncState.alias,
      version: protocolVersion,
      deviceModel: syncState.deviceInfo.deviceModel,
      deviceType: syncState.deviceInfo.deviceType,
      fingerprint: syncState.securityContext.certificateHash,
      port: syncState.port,
      protocol: syncState.protocol,
      download: syncState.download,
    );
  }
}

class _SocketResult {
  final NetworkInterface interface;
  final RawDatagramSocket socket;

  _SocketResult(this.interface, this.socket);
}

Future<List<_SocketResult>> _getSockets({
  required List<String>? whitelist,
  required List<String>? blacklist,
  required String multicastGroup,
  int? port,
}) async {
  final interfaces = await getNetworkInterfaces(
    whitelist: whitelist,
    blacklist: blacklist,
  );
  final sockets = <_SocketResult>[];
  for (final interface in interfaces) {
    try {
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port ?? 0);
      socket.joinMulticast(InternetAddress(multicastGroup), interface);
      sockets.add(_SocketResult(interface, socket));
    } catch (e) {
      _logger.warning(
        'Could not bind UDP multicast port (ip: ${interface.addresses.map((a) => a.address).toList()}, group: $multicastGroup, port: $port)',
        e,
      );
    }
  }

  return sockets;
}
