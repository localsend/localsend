import 'package:localsend_app/model/device.dart';

const _basePath = '/api/localsend';

/// Type-safe API paths
enum ApiRoute {
  info('info'),
  register('register'),
  prepareUpload('prepare-upload', 'send-request'),
  upload('upload', 'send'),
  cancel('cancel'),
  show('show'),
  prepareDownload('prepare-download'),
  download('download'),
  ;

  const ApiRoute(String path, [String? legacy])
      : v1 = '$_basePath/v1/${legacy ?? path}',
        v2 = '$_basePath/v2/$path';

  /// The server url for v1
  final String v1;

  /// The server url for v2
  final String v2;

  /// The client url
  String target(Device target, {Map<String, String>? query}) {
    final protocol = target.https ? 'https' : 'http';
    final route = target.version == '1.0' ? v1 : v2;
    if (query != null) {
      return '$protocol://${target.ip}:${target.port}$route?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}';
    } else {
      return '$protocol://${target.ip}:${target.port}$route';
    }
  }

  /// The client url for polling
  String targetRaw(String ip, int port, bool https, String version) {
    final protocol = https ? 'https' : 'http';
    final route = version == '1.0' ? v1 : v2;
    return '$protocol://$ip:$port$route';
  }
}
