import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';
import 'package:localsend_app/model/dto/register_dto.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/provider/multicast_logs_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/sleep.dart';

final multicastProvider = Provider((ref) {
  final deviceInfo = ref.watch(deviceRawInfoProvider);
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
      print('Multicast receiver already running.');
      return;
    }

    _listening = true;

    final streamController = StreamController<Device>();
    final settings = _ref.read(settingsProvider);
    final fingerprint = _ref.read(fingerprintProvider);

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
          streamController.add(dto.toDevice(ip, settings.port, settings.https));
          _ref.read(multicastLogsProvider.notifier).addLog('Received UDP: ${dto.alias} ($ip)');
          if (dto.announcement && _ref.read(serverProvider) != null) {
            // only respond when server is running
            _answerAnnouncement(
              ip: datagram.address.address,
              peerAlias: dto.alias,
            );
          }
        } catch (e) {
          _ref.read(multicastLogsProvider.notifier).addLog(e.toString());
        }
      });
      _ref.read(multicastLogsProvider.notifier).addLog('Bind UDP multicast port (ip: ${socket.interface.addresses.map((a) => a.address).toList()}, group: ${settings.multicastGroup}, port: ${settings.port})');
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

      _ref.read(multicastLogsProvider.notifier).addLog('Sending announcement');
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(settings.multicastGroup), settings.port);
          socket.socket.close();
        } catch (e) {
          _ref.read(multicastLogsProvider.notifier).addLog(e.toString());
        }
      }
    }
  }

  /// Responds to an announcement.
  Future<void> _answerAnnouncement({required String ip, required String peerAlias}) async {
    final settings = _ref.read(settingsProvider);

    try {
      // Answer with TCP
      await _ref.read(dioProvider(DioType.discovery)).post(
        ApiRoute.register.targetRaw(ip, settings.port, settings.https),
        data: _getRegisterDto().toJson(),
      );
      _ref.read(multicastLogsProvider.notifier).addLog('Responded to announcement of $peerAlias via TCP successfully.');
    } catch (e) {
      // Fallback: Answer with UDP
      final sockets = await _getSockets(settings.multicastGroup);
      final dto = _getMulticastDto(announcement: false);
      for (final socket in sockets) {
        try {
          socket.socket.send(dto, InternetAddress(settings.multicastGroup), settings.port);
          socket.socket.close();
        } catch (e) {
          _ref.read(multicastLogsProvider.notifier).addLog(e.toString());
        }
      }
      _ref.read(multicastLogsProvider.notifier).addLog('Responded to announcement of $peerAlias with UDP because TCP failed.');
    }
  }

  /// Returns the MulticastDto of this device in bytes.
  List<int> _getMulticastDto({required bool announcement}) {
    final settings = _ref.read(settingsProvider);
    final serverState = _ref.read(serverProvider);
    final fingerprint = _ref.read(fingerprintProvider);
    final dto = MulticastDto(
      alias: serverState?.alias ?? settings.alias,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
      announcement: announcement,
    );
    return utf8.encode(jsonEncode(dto.toJson()));
  }

  RegisterDto _getRegisterDto() {
    final settings = _ref.read(settingsProvider);
    final serverState = _ref.read(serverProvider);
    final fingerprint = _ref.read(fingerprintProvider);
    return RegisterDto(
      alias: serverState?.alias ?? settings.alias,
      deviceModel: _deviceInfo.deviceModel,
      deviceType: _deviceInfo.deviceType,
      fingerprint: fingerprint,
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
      print(e);
    }
  }

  return sockets;
}
