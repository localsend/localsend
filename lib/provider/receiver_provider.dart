import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final receiverProvider = StateNotifierProvider((ref) {
  final alias = ref.watch(settingsProvider.select((settings) => settings.alias));
  return ReceiverNotifier(alias);
});

class ReceiverNotifier extends StateNotifier<HttpServer?> {
  final String alias;

  ReceiverNotifier(this.alias) : super(null);

  Future<void> startServer() async {
    if (state != null) {
      print('Server already running.');
      return;
    }

    final app = Router();

    final deviceInfo = await getDeviceInfo();
    app.get('/localsend/v1/info', (Request request) {
      final dto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );
      return Response.ok(jsonEncode(dto.toJson()), headers: {'Content-Type': 'application/json'});
    });

    app.get('/user/<user>', (Request request, String user) {
      return Response.ok('hello $user');
    });

    print('Starting server...');
    state = await serve(app, '0.0.0.0', Constants.defaultPort);
    print('Server started. (Port: ${state?.port})');
  }

  Future<void> stop() async {
    await state?.close(force: true);
    state = null;
    print('Server stopped.');
  }
}

