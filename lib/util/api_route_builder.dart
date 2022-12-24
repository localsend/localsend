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
  String target(Device target, {Map<String, String>? query}) {
    if (query != null) {
      return 'http://${target.ip}:${target.port}$path?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}';
    } else {
      return 'http://${target.ip}:${target.port}$path';
    }
  }

  /// The client url for polling
  String targetRaw(String ip, int port) => 'http://$ip:$port$path';
}
