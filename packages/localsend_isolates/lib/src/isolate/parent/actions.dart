import 'dart:async';

import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/server.dart' show WebParams;
import 'package:localsend_isolates/src/isolate/child/discovery_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/server_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/upload_isolate.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/isolate/parent/parent_isolate_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/id.dart';
import 'package:typed_isolates/typed_isolates.dart';

/// Starts the discovery and returns the stream of confirmed devices:
/// answered announcements, scan results and devices fed in via
/// [IsolateDiscoveryAddDeviceAction] all arrive on this one stream.
/// The stream never completes; it survives [IsolateDiscoveryRestartAction]s.
class IsolateDiscoveryListenAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<Device>> {
  @override
  (ParentIsolateState, Stream<Device>) reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    return (
      state,
      connection
          .sendWrappedTaskAndListenStream(
            task: DiscoveryListenTask(),
          )
          .toDeviceStream(),
    );
  }
}

/// Scans the subnet of one network interface over HTTP,
/// for networks that do not carry multicast.
/// The returned stream completes (without events) when the scan is finished;
/// the found devices arrive on the [IsolateDiscoveryListenAction] stream.
class IsolateDiscoverySubnetScanAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<Device>> {
  final String networkInterface;
  final int port;
  final bool https;

  IsolateDiscoverySubnetScanAction({
    required this.networkInterface,
    required this.port,
    required this.https,
  });

  @override
  (ParentIsolateState, Stream<Device>) reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    return (
      state,
      connection
          .sendWrappedTaskAndListenStream(
            task: DiscoverySubnetScanTask(
              networkInterface: networkInterface,
              port: port,
              https: https,
            ),
          )
          .toDeviceStream(),
    );
  }
}

/// Probes the known addresses of the favorites over HTTP.
/// The returned stream completes (without events) when every favorite has been
/// probed; the found devices arrive on the [IsolateDiscoveryListenAction] stream.
class IsolateDiscoveryFavoriteScanAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Stream<Device>> {
  final List<(String, int)> favorites;
  final bool https;

  IsolateDiscoveryFavoriteScanAction({
    required this.favorites,
    required this.https,
  });

  @override
  (ParentIsolateState, Stream<Device>) reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    return (
      state,
      connection
          .sendWrappedTaskAndListenStream(
            task: DiscoveryFavoriteScanTask(
              favorites: favorites,
              https: https,
            ),
          )
          .toDeviceStream(),
    );
  }
}

/// Fetches the retained confirmations of a stored device, oldest first.
/// The logs are empty when the fingerprint is unknown or the discovery is
/// not running.
class IsolateDiscoveryDeviceLogsAction extends AsyncReduxActionWithResult<IsolateController, ParentIsolateState, List<DeviceLog>> {
  final String fingerprint;

  IsolateDiscoveryDeviceLogsAction({
    required this.fingerprint,
  });

  @override
  Future<(ParentIsolateState, List<DeviceLog>)> reduce() async {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    final result = await connection
        .sendWrappedTaskAndListenStream(
          task: DiscoveryDeviceLogsTask(fingerprint: fingerprint),
        )
        .first;

    return (state, (result as DiscoveryDeviceLogsResult).logs);
  }
}

/// Sends an announcement which makes every other LocalSend device on the
/// network register with this device's HTTP server.
class IsolateDiscoveryAnnouncementAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: DiscoveryAnnouncementTask(),
        ),
      ),
    );

    return state;
  }
}

/// Restarts the discovery, e.g. after the port or the network settings changed.
class IsolateDiscoveryRestartAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: DiscoveryRestartTask(),
        ),
      ),
    );

    return state;
  }
}

/// Feeds a device confirmed outside of the discovery into the discovery store,
/// e.g. one that registered with this device's HTTP server. The device comes
/// back on the [IsolateDiscoveryListenAction] stream.
class IsolateDiscoveryAddDeviceAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final Device device;

  IsolateDiscoveryAddDeviceAction({
    required this.device,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.discovery;
    if (connection == null) {
      throw StateError('discovery is not initialized');
    }

    connection.sendToIsolate(
      SendToIsolateData(
        syncState: null,
        data: IsolateTask(
          data: DiscoveryAddDeviceTask(
            device: device,
          ),
        ),
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

  /// Whether the SHA-256 checksums that senders provide for their files are
  /// verified after receiving.
  final bool verifyChecksums;

  /// Serves the web pages: the download page (web send) and/or the upload page.
  /// `null` disables the web pages.
  final WebParams? web;

  /// Enables the internal `show` endpoint, guarded by this token, that lets another
  /// application instance request this one to show itself. `null` disables it.
  final String? showToken;

  IsolateHttpServerStartAction({
    required this.pin,
    required this.verifyChecksums,
    required this.web,
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
          verifyChecksums: verifyChecksums,
          web: web,
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
///
/// When accepted, the server isolate receives all files on its own and
/// reports [HttpServerFileUploadEvent], [HttpServerFileUploadProgressEvent]
/// and [HttpServerFileUploadResultEvent] on the server event stream.
class IsolateHttpServerPrepareUploadDecisionAction extends ReduxAction<IsolateController, ParentIsolateState> {
  /// The receive configuration including the accepted file IDs.
  /// `null` declines the request.
  final HttpServerReceiveConfig? config;

  IsolateHttpServerPrepareUploadDecisionAction({
    required this.config,
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
            config: config,
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

/// Fails a pending [HttpServerWebFileDownloadEvent], e.g. because no source
/// for the file content could be resolved. The web client receives an error
/// response for this file.
/// Does nothing if the download was already answered with a
/// [IsolateHttpServerFileDownloadTargetAction].
class IsolateHttpServerFailFileDownloadAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final String sessionId;
  final String fileId;

  IsolateHttpServerFailFileDownloadAction({
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
          data: HttpServerFailFileDownloadTask(
            sessionId: sessionId,
            fileId: fileId,
          ),
        ),
      ),
    );

    return state;
  }
}

extension _DeviceStreamExt on Stream<DiscoveryResult> {
  /// Unwraps the [DiscoveryDeviceResult]s of a device stream.
  Stream<Device> toDeviceStream() {
    return map((result) => (result as DiscoveryDeviceResult).device);
  }
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
