import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/rust/api/server.dart';
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
  /// (either a [path] or a [fileDescriptor]).
  ///
  /// The returned stream emits the progress (fraction of [fileSize]) while the
  /// file is being received and closes once the file has been received
  /// completely (or errors when saving failed).
  Stream<double> respondFileUpload({
    required String sessionId,
    required String fileId,
    required String? path,
    required int? fileDescriptor,
    required int fileSize,
  }) {
    return _requireServer().respondFileUpload(
      sessionId: sessionId,
      fileId: fileId,
      path: path,
      fileDescriptor: fileDescriptor,
      fileSize: BigInt.from(fileSize),
    );
  }

  /// Rejects a pending file upload, e.g. because no save target could be
  /// prepared. The upload request fails with an error response and the file is
  /// marked as failed; the session itself continues.
  /// Does nothing if the upload was already answered via [respondFileUpload].
  Future<void> rejectFileUpload({required String sessionId, required String fileId}) async {
    await _requireServer().rejectFileUpload(sessionId: sessionId, fileId: fileId);
  }

  /// Cancels the active upload session. Uploads that are already in progress
  /// still run to completion, but new upload requests are rejected and a new
  /// session can be created. No session-end event is emitted.
  Future<void> cancelSession({required String sessionId}) async {
    await _requireServer().cancelSession(sessionId: sessionId);
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

  /// Rejects a pending web file download, e.g. because no content source could
  /// be resolved. The download request fails with an error response.
  /// Does nothing if the download was already answered via [respondFileDownload].
  Future<void> rejectFileDownload({required String sessionId, required String fileId}) async {
    await _requireServer().rejectFileDownload(sessionId: sessionId, fileId: fileId);
  }

  /// Stops the server. The event stream returned by [start] will end.
  /// Completes once the port is released and can be bound again.
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
