import 'package:common/model/device.dart';

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
  clipboardSend('clipboard/send'),
  clipboardReceive('clipboard/receive'),
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
    return Uri(
      scheme: target.https ? 'https' : 'http',
      host: target.ip,
      port: target.port,
      path: target.version == '1.0' ? v1 : v2,
      queryParameters: query,
    ).toString();
  }

  /// The client url for polling
  String targetRaw(String ip, int port, bool https, String version) {
    final protocol = https ? 'https' : 'http';
    final route = version == '1.0' ? v1 : v2;
    return '$protocol://$ip:$port$route';
  }
}
