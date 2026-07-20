import 'dart:async';

import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/server.dart' show WebSendParams;
import 'package:localsend_isolates/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/server_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/upload_isolate.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/isolate/parent/parent_isolate_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/id.dart';
import 'package:typed_isolates/typed_isolates.dart';

class IsolateInterfaceHttpDiscoveryAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<Device>> {
  final String networkInterface;
  final int port;
  final bool https;

  IsolateInterfaceHttpDiscoveryAction({
    required this.networkInterface,
    required this.port,
    required this.https,
  });

  @override
  (ParentIsolateState, Stream<Device>) reduce() {
    final connection = state.httpScanDiscovery;
    if (connection == null) {
      throw StateError('httpScanDiscovery is not initialized');
    }

    final task = HttpInterfaceScanTask(
      networkInterface: networkInterface,
      port: port,
      https: https,
    );

    return (
      state,
      connection.sendWrappedTaskAndListenStream(
        task: task,
      ),
    );
  }
}

class IsolateFavoriteHttpDiscoveryAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<Device>> {
  final List<(String, int)> favorites;
  final bool https;

  IsolateFavoriteHttpDiscoveryAction({
    required this.favorites,
    required this.https,
  });

  @override
  (ParentIsolateState, Stream<Device>) reduce() {
    final connection = state.httpScanDiscovery;
    if (connection == null) {
      throw StateError('httpScanDiscovery is not initialized');
    }

    final task = HttpFavoriteScanTask(
      favorites: favorites,
      https: https,
    );

    return (
      state,
      connection.sendWrappedTaskAndListenStream(
        task: task,
      ),
    );
  }
}

class IsolateSendMulticastAnnouncementAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    final connection = state.multicastDiscovery;
    if (connection == null) {
      throw StateError('multicastDiscovery is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: MulticastAnnouncementTask.instance,
      ),
    );

    return state;
  }
}

class IsolateSendMulticastRestartListenerAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    final connection = state.multicastDiscovery;
    if (connection == null) {
      throw StateError('multicastDiscovery is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: MulticastRestartListenerTask.instance,
      ),
    );

    return state;
  }
}

class IsolateHttpUploadActionResult {
  final int taskId;
  final Stream<HttpUploadEvent> events;

  IsolateHttpUploadActionResult({
    required this.taskId,
    required this.events,
  });
}

class IsolateHttpUploadFilesAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, IsolateHttpUploadActionResult> {
  final String? remoteSessionId;
  final List<HttpUploadFile> files;
  final Device device;

  IsolateHttpUploadFilesAction({
    required this.remoteSessionId,
    required this.files,
    required this.device,
  });

  @override
  (ParentIsolateState, IsolateHttpUploadActionResult) reduce() {
    final connection = state.httpUpload;
    if (connection == null) {
      throw StateError('httpUpload is not initialized');
    }
    final taskId = IdProvider.instance.getNextId();
    final events = connection.sendWrappedTaskAndListenStream(
      task: HttpUploadFilesTask(
        remoteSessionId: remoteSessionId,
        files: files,
        device: device,
      ),
      taskId: taskId,
    );

    return (
      state,
      IsolateHttpUploadActionResult(
        taskId: taskId,
        events: events,
      ),
    );
  }
}

class IsolateHttpUploadCancelAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final int taskId;

  IsolateHttpUploadCancelAction({
    required this.taskId,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpUpload;
    if (connection == null) {
      throw StateError('httpUpload is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpUploadCancelTask(
            taskId: taskId,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Starts the HTTP server and returns the stream of server events.
/// The stream ends when the server is stopped via [IsolateHttpServerStopAction].
class IsolateHttpServerStartAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<HttpServerEvent>> {
  final String? pin;

  /// Enables web send (download API) so web browsers can download the offered files.
  /// `null` disables web send.
  final WebSendParams? webSend;

  /// Enables the internal `show` endpoint, guarded by this token, that lets another
  /// application instance request this one to show itself. `null` disables it.
  final String? showToken;

  IsolateHttpServerStartAction({
    required this.pin,
    required this.webSend,
    required this.showToken,
  });

  @override
  (ParentIsolateState, Stream<HttpServerEvent>) reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    return (
      state,
      connection.sendWrappedTaskAndListenStream(
        task: HttpServerStartTask(
          pin: pin,
          webSend: webSend,
          showToken: showToken,
        ),
      ),
    );
  }
}

/// Stops the HTTP server.
/// Completes once the server has released the port, so the port can be bound again.
class IsolateHttpServerStopAction extends AsyncReduxAction<IsolateController, ParentIsolateState> {
  @override
  Future<ParentIsolateState> reduce() async {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    await connection
        .sendWrappedTaskAndListenStream(
          task: HttpServerStopTask(),
        )
        .drain<void>();

    return state;
  }
}

/// Answers a pending [HttpServerPrepareUploadEvent].
class IsolateHttpServerPrepareUploadDecisionAction extends ReduxAction<IsolateController, ParentIsolateState> {
  /// The file IDs to accept (a subset of the offered files).
  /// `null` declines the request.
  final List<String>? acceptedFileIds;

  IsolateHttpServerPrepareUploadDecisionAction({
    required this.acceptedFileIds,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerPrepareUploadDecisionTask(
            acceptedFileIds: acceptedFileIds,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Answers a pending [HttpServerFileUploadEvent] with the target the file
/// should be saved to (either a [path] or a writable [fileDescriptor]).
/// [onProgress] is called with the progress (0.0 to 1.0) while the file is being received.
/// The returned future completes when the file has been received completely
/// and throws if saving the file failed.
class IsolateHttpServerFileUploadTargetAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Future<void>> {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;
  final int fileSize;
  final void Function(double progress)? onProgress;

  IsolateHttpServerFileUploadTargetAction({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
    required this.fileSize,
    required this.onProgress,
  });

  @override
  (ParentIsolateState, Future<void>) reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    final events = connection.sendWrappedTaskAndListenStream(
      task: HttpServerFileUploadTargetTask(
        sessionId: sessionId,
        fileId: fileId,
        path: path,
        fileDescriptor: fileDescriptor,
        fileSize: fileSize,
      ),
    );

    return (state, _awaitResult(events));
  }

  Future<void> _awaitResult(Stream<HttpServerEvent> events) async {
    await for (final event in events) {
      switch (event) {
        case HttpServerFileUploadProgressEvent(:final progress):
          onProgress?.call(progress);
        case HttpServerFileUploadResultEvent(:final error):
          if (error != null) {
            throw HttpServerFileUploadException(error);
          }
          return;
        default:
          break;
      }
    }

    throw HttpServerFileUploadException('The server isolate did not report a result');
  }
}

/// Rejects a pending [HttpServerFileUploadEvent], e.g. because preparing the
/// save target for the file failed. The sender receives an error response for
/// this file and the session itself continues.
/// Does nothing if the upload was already answered with a
/// [IsolateHttpServerFileUploadTargetAction].
class IsolateHttpServerRejectFileUploadAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;
  final String fileId;

  IsolateHttpServerRejectFileUploadAction({
    required this.sessionId,
    required this.fileId,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerRejectFileUploadTask(
            sessionId: sessionId,
            fileId: fileId,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Cancels the active upload session of the HTTP server, e.g. because the
/// user aborted the transfer on the receiving side.
/// No [HttpServerSessionEndEvent] is emitted.
class IsolateHttpServerCancelSessionAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;

  IsolateHttpServerCancelSessionAction({
    required this.sessionId,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerCancelSessionTask(
            sessionId: sessionId,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Answers a pending [HttpServerWebPrepareDownloadEvent].
class IsolateHttpServerPrepareDownloadDecisionAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;

  /// `true` accepts the download request, `false` declines it.
  final bool accept;

  IsolateHttpServerPrepareDownloadDecisionAction({
    required this.sessionId,
    required this.accept,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerPrepareDownloadDecisionTask(
            sessionId: sessionId,
            accept: accept,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Answers a pending [HttpServerWebFileDownloadEvent] with the source the file
/// content should be read from (either a [path] or a readable [fileDescriptor]).
class IsolateHttpServerFileDownloadTargetAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;

  IsolateHttpServerFileDownloadTargetAction({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerFileDownloadTargetTask(
            sessionId: sessionId,
            fileId: fileId,
            path: path,
            fileDescriptor: fileDescriptor,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Rejects a pending [HttpServerWebFileDownloadEvent], e.g. because no source
/// for the file content could be resolved. The web client receives an error
/// response for this file.
/// Does nothing if the download was already answered with a
/// [IsolateHttpServerFileDownloadTargetAction].
class IsolateHttpServerRejectFileDownloadAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;
  final String fileId;

  IsolateHttpServerRejectFileDownloadAction({
    required this.sessionId,
    required this.fileId,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpServer;
    if (connection == null) {
      throw StateError('httpServer is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: HttpServerRejectFileDownloadTask(
            sessionId: sessionId,
            fileId: fileId,
          ),
        ),
      ),
    );

    return state;
  }
}

/// Saving a file received by the HTTP server failed.
class HttpServerFileUploadException implements Exception {
  final String message;

  HttpServerFileUploadException(this.message);

  @override
  String toString() => message;
}

/// Adds the [SendToIsolateData] envelope on top of the generic
/// [IsolateTaskConnector.sendTaskAndListenStream] from `typed_isolates`.
extension _WrappedTaskConnector<R, T> on IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateTask<T>>> {
  /// Sends a [task] wrapped in a [SendToIsolateData] envelope and transforms
  /// the responded [IsolateTaskStreamResult]s into a plain [Stream].
  Stream<R> sendWrappedTaskAndListenStream({
    required T task,
    int? taskId,
  }) {
    final wrappedTask = IsolateTask(
      id: taskId,
      data: task,
    );

    // ignore: discarded_futures
    Future.microtask(() {
      sendToIsolate(
        SendToIsolateData(
          syncState: null,
          data: wrappedTask,
        ),
      );
    });

    return convertResponseToStream(taskId: wrappedTask.id);
  }
}
