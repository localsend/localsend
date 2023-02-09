import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:udp/udp.dart';

const _multicastGroup = '224.0.245.133';

final multicastProvider = Provider((ref) {
  final deviceInfo = ref.watch(deviceRawInfoProvider);
  return MulticastService(ref, deviceInfo);
});


class MulticastService {
  final Ref _ref;
  final DeviceInfoResult _deviceInfo;

  UDP? _receiver;

  MulticastService(this._ref, this._deviceInfo);

  /// Binds the UDP port and listen to UDP multicast packages
  /// It will automatically answer announcement messages
  Stream<Device> startListener() async* {
    if (_receiver != null) {
      print('Multicast receiver already running.');
      return;
    }

    final settings = _ref.read(settingsProvider);
    final fingerprint = _ref.read(fingerprintProvider);
    final multicastEndpoint = Endpoint.multicast(InternetAddress(_multicastGroup), port: Port(settings.port));
    final receiver = await UDP.bind(multicastEndpoint);

    // Tell everyone in the network that I am online
    sendAnnouncement();

    print('Listening to multicast messages ($_multicastGroup, port: ${settings.port})');
    await for (final datagram in receiver.asStream()) {
      if (datagram == null) {
        continue;
      }
      try {
        final dto = MulticastDto.fromJson(jsonDecode(utf8.decode(datagram.data)));
        if (dto.fingerprint == fingerprint) {
          continue;
        }

        final ip = datagram.address.address;
        yield dto.toDevice(ip, settings.port, settings.https);
        print('Received UDP: ${dto.alias} ($ip)');
        if (dto.announcement && _ref.read(serverProvider) != null) {
          // only respond when server is running
          print('Answering announcement');
          _answerAnnouncement();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  /// Sends an announcement which triggers a response on every LocalSend member of the network.
  Future<void> sendAnnouncement() async {
    try {
      final settings = _ref.read(settingsProvider);
      final multicastEndpoint = Endpoint.multicast(InternetAddress(_multicastGroup), port: Port(settings.port));
      final sender = await UDP.bind(Endpoint.any());
      final dto = _getDto(announcement: true);

      for (final wait in [100, 500, 1000, 2000]) {
        await sleepAsync(wait);
        print('Sending announcement');
        await sender.send(dto, multicastEndpoint);
      }
      sender.close();
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  /// Responds to an announcement.
  Future<void> _answerAnnouncement() async {
    try {
      final settings = _ref.read(settingsProvider);
      final multicastEndpoint = Endpoint.multicast(InternetAddress(_multicastGroup), port: Port(settings.port));
      final sender = await UDP.bind(Endpoint.any());
      final dto = _getDto(announcement: false);
      await sender.send(dto, multicastEndpoint);
      sender.close();
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  /// Returns the MulticastDto of this device in bytes.
  List<int> _getDto({required bool announcement}) {
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
}
