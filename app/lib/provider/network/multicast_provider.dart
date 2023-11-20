import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';
import 'package:localsend_app/model/dto/register_dto.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Multicast');

final multicastProvider = ViewProvider((ref) {
  final deviceInfo = ref.watch(deviceInfoProvider);
  return MulticastService(ref, deviceInfo);
});

class MulticastService {
  final Ref _ref;
  final DeviceInfoResult _deviceInfo;
  bool _listening = false;

  MulticastService(this._ref, this._deviceInfo);

  /// Binds the UDP port and listen to UDP multicast packages
  /// It will automatically answer announcement messages
  Stream<Device> startListener() async* {
    if (_listening) {
      _logger.info('Already listening to multicast');
      return;
    }

    _listening = true;

    final streamController = StreamController<Device>();
    final settings = _ref.read(settingsProvider);
    final fingerprint = _ref.read(securityProvider).certificateHash;

    final sockets = await _getSockets(settings.multicastGroup, settings.port);
    for (final socket in sockets) {
      socket.socket.listen((_) {
        final datagram = socket.socket.receive();
        if (datagram == null) {
          return;
        }

        try {
          final dto = MulticastDto.fromJson(jsonDecode(utf8.decode(datagram.data)));
          if (dto.fingerprint == fingerprint) {
            return;
          }

          final ip = datagram.address.address;
          final peer = dto.toDevice(ip, settings.port, settings.https);
          streamController.add(peer);
          if ((dto.announcement == true || dto.announce == true) && _ref.read(serverProvider) != null) {
            // only respond when server is running
            _answerAnnouncement(peer);
          }
        } catch (e) {
          _ref.notifier(discoveryLoggerProvider).addLog(e.toString());
        }
      });
      _ref.notifier(discoveryLoggerProvider).addLog(
            'Bind UDP multicast port (ip: ${socket.interface.addresses.map((a) => a.address).toList()}, group: ${settings.multicastGroup}, port: ${settings.port})',
          );
    }

    // Tell everyone in the network that I am online
    unawaited(
      sendAnnouncement(),
    );

    yield* streamController.stream;
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    final settings = _ref.read(settingsProvider);
    final sockets = await _getSockets(settings.multicastGroup);
    final dto = _getMulticastDto(announcement: true);
    for (final wait in [100, 500, 2000]) {
      await sleepAsync(wait);

      _ref.notifier(discoveryLoggerProvider).addLog('[ANNOUNCE/UDP]');
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(settings.multicastGroup), settings.port);
          socket.socket.close();
        } catch (e) {
          _ref.notifier(discoveryLoggerProvider).addLog(e.toString());
        }
      }
    }
  }

  /// Responds to an announcement.
  Future<void> _answerAnnouncement(Device peer) async {
    final settings = _ref.read(settingsProvider);

    try {
      // Answer with TCP
      await _ref.read(dioProvider).discovery.post(
            ApiRoute.register.target(peer),
            data: _getRegisterDto().toJson(),
          );
      _ref.notifier(discoveryLoggerProvider).addLog('[RESPONSE/TCP] Announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) via TCP');
    } catch (e) {
      // Fallback: Answer with UDP
      final sockets = await _getSockets(settings.multicastGroup);
      final dto = _getMulticastDto(announcement: false);
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(settings.multicastGroup), settings.port);
          socket.socket.close();
        } catch (e) {
          _ref.notifier(discoveryLoggerProvider).addLog(e.toString());
        }
      }
      _ref
          .notifier(discoveryLoggerProvider)
          .addLog('[RESPONSE/UDP] Announcement of ${peer.alias} (${peer.ip}, model: ${peer.deviceModel}) with UDP because TCP failed');
    }
  }

  /// Returns the MulticastDto of this device in bytes.
  List<int> _getMulticastDto({required bool announcement}) {
    final settings = _ref.read(settingsProvider);
    final serverState = _ref.read(serverProvider);
    final fingerprint = _ref.read(securityProvider).certificateHash;
    final dto = MulticastDto(
      alias: serverState?.alias ?? settings.alias,
      version: protocolVersion,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
      port: serverState?.port ?? settings.port,
      protocol: (serverState?.https ?? settings.https) ? ProtocolType.https : ProtocolType.http,
      download: serverState?.webSendState != null,
      announcement: announcement,
      announce: announcement,
    );
    return utf8.encode(jsonEncode(dto.toJson()));
  }

  RegisterDto _getRegisterDto() {
    final settings = _ref.read(settingsProvider);
    final serverState = _ref.read(serverProvider);
    final fingerprint = _ref.read(securityProvider).certificateHash;
    return RegisterDto(
      alias: serverState?.alias ?? settings.alias,
      version: protocolVersion,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
      port: serverState?.port ?? settings.port,
      protocol: (serverState?.https ?? settings.https) ? ProtocolType.https : ProtocolType.http,
      download: serverState?.webSendState != null,
    );
  }
}

class _SocketResult {
  final NetworkInterface interface;
  final RawDatagramSocket socket;

  _SocketResult(this.interface, this.socket);
}

Future<List<_SocketResult>> _getSockets(String multicastGroup, [int? port]) async {
  final interfaces = await NetworkInterface.list();
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
