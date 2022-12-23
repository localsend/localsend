import 'package:localsend_app/model/device.dart';

const _basePath = '/api/localsend/v1';

/// Type-safe API paths
enum ApiRoute {
  info('/info'),
  sendRequest('/send-request'),
  send('/send'),
  cancel('/cancel');

  const ApiRoute(String path) : path = '$_basePath$path';

  /// The server url
  final String path;

  /// The client url
  String target(Device target) => 'http://${target.ip}:${target.port}$path';

  /// The client url for polling
  String targetRaw(String ip, int port) => 'http://$ip:$port$path';
}
