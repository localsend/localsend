import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cli/server/controller/api_route_builder.dart';
import 'package:cli/server/controller/dio_provider.dart';
import 'package:cli/server/security_service.dart';
import 'package:cli/server/server_provider.dart';
import 'package:common/common.dart';
import 'package:logging/logging.dart';

final _logger = Logger('Multicast');

class DeviceInfoResult {
  final DeviceType deviceType;
  final String? deviceModel;

  // Used to properly set Edge-to-Edge mode on Android
  // See https://github.com/flutter/flutter/issues/90098
  final int? androidSdkInt;

  DeviceInfoResult({
    required this.deviceType,
    required this.deviceModel,
    required this.androidSdkInt,
  });
}

class MulticastService {
  final DeviceInfoResult _deviceInfo;
  bool _listening = false;

  MulticastService(this._deviceInfo);

  /// Binds the UDP port and listen to UDP multicast packages
  /// It will automatically answer announcement messages
  Stream<Device> startListener() async* {
    if (_listening) {
      _logger.info('Already listening to multicast');
      return;
    }

    _listening = true;

    final streamController = StreamController<Device>();
    final fingerprint = securityContext.certificateHash;

    final sockets = await _getSockets(defaultMulticastGroup, defaultPort);
    for (final socket in sockets) {
      socket.socket.listen((_) {
        final datagram = socket.socket.receive();
        if (datagram == null) {
          return;
        }

        try {
          final dto =
              MulticastDto.fromJson(jsonDecode(utf8.decode(datagram.data)));
          if (dto.fingerprint == fingerprint) {
            return;
          }

          final ip = datagram.address.address;
          final peer = dto.toDevice(ip, defaultPort, defaultHttps);
          streamController.add(peer);
          if ((dto.announcement == true || dto.announce == true)) {
            // only respond when server is running
            _answerAnnouncement(peer);
          }
        } catch (e) {
          print(e.toString());
        }
      });
      print(
        'Bind UDP multicast port (ip: ${socket.interface.addresses.map((a) => a.address).toList()}, group: $defaultMulticastGroup, port: $defaultPort)',
      );
    }

    // Tell everyone in the network that I am online
    unawaited(
      sendAnnouncement(),
    );

    yield* streamController.stream;
  }

  Future<void> sleepAsync(int millis) {
    return Future.delayed(Duration(milliseconds: millis), () {});
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    final sockets = await _getSockets(defaultMulticastGroup);
    final dto = _getMulticastDto(announcement: true);
    for (final wait in [100, 500, 2000]) {
      await sleepAsync(wait);

      for (final socket in sockets) {
        try {
          socket.socket
              .send(dto, InternetAddress(defaultMulticastGroup), defaultPort);
          socket.socket.close();
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }

  /// Responds to an announcement.
  Future<void> _answerAnnouncement(Device peer) async {
    try {
      // Answer with TCP
      await dioCollection.discovery.post(
        ApiRoute.register.target(peer),
        data: _getRegisterDto().toJson(),
      );
      print(
          '[RESPONSE/TCP] Announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) via TCP');
    } catch (e) {
      // Fallback: Answer with UDP
      final sockets = await _getSockets(defaultMulticastGroup);
      final dto = _getMulticastDto(announcement: false);
      for (final socket in sockets) {
        try {
          socket.socket
              .send(dto, InternetAddress(defaultMulticastGroup), defaultPort);
          socket.socket.close();
        } catch (e) {
          print(e.toString());
        }
      }

      print(
          '[RESPONSE/UDP] Announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) with UDP because TCP failed');
    }
  }

  /// Returns the MulticastDto of this device in bytes.
  List<int> _getMulticastDto({required bool announcement}) {
    final serverState = serverService.state;
    final fingerprint = securityContext.certificateHash;
    final dto = MulticastDto(
      alias: serverState?.alias ?? 'unknown alias',
      version: protocolVersion,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
      port: serverState?.port ?? defaultPort,
      protocol: (serverState?.https ?? defaultHttps)
          ? ProtocolType.https
          : ProtocolType.http,
      download: serverState?.webSendState != null,
      announcement: announcement,
      announce: announcement,
    );
    return utf8.encode(jsonEncode(dto.toJson()));
  }

  RegisterDto _getRegisterDto() {
    final serverState = serverService.state;
    final fingerprint = securityContext.certificateHash;
    return RegisterDto(
      alias: serverState?.alias ?? 'settings.alias',
      version: protocolVersion,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
      port: serverState?.port ?? defaultPort,
      protocol: (serverState?.https ?? defaultHttps)
          ? ProtocolType.https
          : ProtocolType.http,
      download: serverState?.webSendState != null,
    );
  }
}

class _SocketResult {
  final NetworkInterface interface;
  final RawDatagramSocket socket;

  _SocketResult(this.interface, this.socket);
}

Future<List<_SocketResult>> _getSockets(String multicastGroup,
    [int? port]) async {
  final interfaces = await NetworkInterface.list();
  final sockets = <_SocketResult>[];
  for (final interface in interfaces) {
    try {
      final socket =
          await RawDatagramSocket.bind(InternetAddress.anyIPv4, port ?? 0);
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
