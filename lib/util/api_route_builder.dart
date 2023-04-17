import 'package:localsend_app/model/device.dart';

const _basePath = '/api/localsend/v1';

/// Type-safe API paths
enum ApiRoute {
  info('/info'),
  register('/register'),
  sendRequest('/send-request'),
  send('/send'),
  cancel('/cancel'),
  show('/show'),
  receiveRequest('/receive-request'),
  receive('/receive'),
  ;

  const ApiRoute(String path) : path = '$_basePath$path';

  /// The server url
  final String path;

  /// The client url
  String target(Device target, {Map<String, String>? query}) {
    final protocol = target.https ? 'https' : 'http';
    if (query != null) {
      return '$protocol://${target.ip}:${target.port}$path?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}';
    } else {
      return '$protocol://${target.ip}:${target.port}$path';
    }
  }

  /// The client url for polling
  String targetRaw(String ip, int port, bool https) => '${https ? 'https' : 'http'}://$ip:$port$path';
}
