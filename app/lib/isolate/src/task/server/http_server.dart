import 'package:localsend_app/rust/api/model.dart';
import 'package:localsend_app/rust/api/server.dart';
import 'package:refena_flutter/refena_flutter.dart';

final httpServerProvider = Provider((ref) => HttpServerService());

/// Wraps the Rust HTTP server.
/// Only one server can run at a time.
class HttpServerService {
  RsHttpServer? _server;

  bool get running => _server != null;

  /// Starts the server and returns the stream of server events.
  /// The stream ends when the server is stopped.
  Future<Stream<RsServerEvent>> start({
    required int port,
    required TlsConfig? tls,
    required String alias,
    required String version,
    required String? deviceModel,
    required DeviceType? deviceType,
    required String fingerprint,
    required String? pin,
    required WebSendParams? webSend,
    required String? showToken,
  }) async {
    if (_server != null) {
      throw StateError('Server already running');
    }

    final server = await startServer(
      port: port,
      tls: tls,
      alias: alias,
      version: version,
      deviceModel: deviceModel,
      deviceType: deviceType,
      fingerprint: fingerprint,
      pin: pin,
      webSend: webSend,
      showToken: showToken,
    );
    _server = server;
    return server.listen();
  }

  /// Answers a pending prepare-upload request.
  /// [acceptedFileIds] is the subset of the offered files to accept; `null` declines the request.
  Future<void> respondPrepareUpload({required List<String>? acceptedFileIds}) async {
    await _requireServer().respondPrepareUpload(acceptedFileIds: acceptedFileIds);
  }

  /// Answers a pending file upload with the target the file should be saved to
  /// (either a [path] or a [fileDescriptor]) and waits until the file has been received completely.
  Future<void> respondFileUpload({
    required String sessionId,
    required String fileId,
    required String? path,
    required int? fileDescriptor,
  }) async {
    await _requireServer().respondFileUpload(
      sessionId: sessionId,
      fileId: fileId,
      path: path,
      fileDescriptor: fileDescriptor,
    );
  }

  /// Answers a pending web prepare-download request.
  /// [accept] grants the download; `false` declines it.
  Future<void> respondPrepareDownload({required String sessionId, required bool accept}) async {
    await _requireServer().respondPrepareDownload(sessionId: sessionId, accept: accept);
  }

  /// Answers a pending web file download with the source the file content should be
  /// read from (either a [path] or a [fileDescriptor]). The server streams the content.
  Future<void> respondFileDownload({
    required String sessionId,
    required String fileId,
    required String? path,
    required int? fileDescriptor,
  }) async {
    await _requireServer().respondFileDownload(
      sessionId: sessionId,
      fileId: fileId,
      path: path,
      fileDescriptor: fileDescriptor,
    );
  }

  /// Stops the server. The event stream returned by [start] will end.
  Future<void> stop() async {
    final server = _server;
    _server = null;
    await server?.stop();
  }

  RsHttpServer _requireServer() {
    final server = _server;
    if (server == null) {
      throw StateError('Server is not running');
    }
    return server;
  }
}
