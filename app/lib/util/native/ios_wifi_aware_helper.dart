import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _methodChannel = MethodChannel('ios-delegate-channel');
final _logger = Logger('WifiAware');
StreamSubscription? _serverSubscription;
(int, bool)? _configuration;

Future<bool> isIOSWifiAwareSupported() async {
  if (defaultTargetPlatform != TargetPlatform.iOS) return false;
  return await _methodChannel.invokeMethod<bool>('isWifiAwareSupported') ?? false;
}

Future<void> showIOSWifiAwarePairing() => _methodChannel.invokeMethod<void>('showWifiAwarePairing');

Future<void> setupIOSWifiAwareDiscovery(Ref ref) async {
  if (!await isIOSWifiAwareSupported()) return;

  _methodChannel.setMethodCallHandler((call) async {
    if (call.method != 'wifiAwareEndpoint') {
      throw MissingPluginException('Unknown native method ${call.method}');
    }
    final arguments = (call.arguments as Map).cast<String, dynamic>();
    final host = arguments['host'] as String?;
    final port = arguments['port'] as int?;
    final https = arguments['https'] as bool?;
    if (host == null || port == null || https == null) {
      _logger.warning('Ignoring an invalid Wi-Fi Aware endpoint: $arguments');
      return;
    }
    try {
      await ref.redux(parentIsolateProvider).dispatchTakeResult(IsolateDiscoveryProbeAction(host: host, port: port, https: https)).drain<void>();
    } catch (e, stackTrace) {
      _logger.warning('Wi-Fi Aware endpoint probe failed ($host:$port)', e, stackTrace);
    }
  });

  await _serverSubscription?.cancel();
  _serverSubscription = ref.stream(serverProvider).listen((event) {
    unawaited(_configureIOSWifiAware(event.next));
  });
  await _configureIOSWifiAware(ref.read(serverProvider));
}

Future<void> _configureIOSWifiAware(ServerState? server) async {
  try {
    if (server == null) {
      _configuration = null;
      await _methodChannel.invokeMethod<void>('stopWifiAware');
      return;
    }
    final next = (server.port, server.https);
    if (_configuration == next) return;
    _configuration = next;
    await _methodChannel.invokeMethod<void>('startWifiAware', {'port': server.port, 'https': server.https});
  } catch (e, stackTrace) {
    _configuration = null;
    _logger.warning('Could not configure Wi-Fi Aware', e, stackTrace);
  }
}
