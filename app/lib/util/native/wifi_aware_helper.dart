import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_app/localsend');
final _logger = Logger('WifiAware');
StreamSubscription? _serverSubscription;
(int, bool)? _configuration;

/// Connects Android Wi-Fi Aware discovery to LocalSend's regular discovery
/// store. Wi-Fi Aware supplies only an endpoint; the normal LocalSend register
/// request still authenticates and confirms the peer before it is shown.
Future<void> setupWifiAwareDiscovery(Ref ref) async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return;
  }

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

  final permissionGranted = await _methodChannel.invokeMethod<bool>('requestWifiAwarePermission') ?? false;
  if (!permissionGranted) {
    _logger.info('Wi-Fi Aware is unsupported or permission was not granted');
    return;
  }

  await _serverSubscription?.cancel();
  _serverSubscription = ref.stream(serverProvider).listen((event) {
    unawaited(_configureWifiAware(event.next));
  });
  await _configureWifiAware(ref.read(serverProvider));
}

Future<void> _configureWifiAware(ServerState? server) async {
  try {
    if (server == null) {
      _configuration = null;
      await _methodChannel.invokeMethod<void>('stopWifiAware');
      return;
    }

    final next = (server.port, server.https);
    if (_configuration == next) {
      return;
    }
    _configuration = next;
    final supported = await _methodChannel.invokeMethod<bool>('startWifiAware', {'port': server.port, 'https': server.https}) ?? false;
    if (!supported) {
      _logger.info('Wi-Fi Aware is unavailable on this Android device');
    }
  } catch (e, stackTrace) {
    _configuration = null;
    _logger.warning('Could not configure Wi-Fi Aware', e, stackTrace);
  }
}
