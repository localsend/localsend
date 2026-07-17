import 'dart:async';

import 'package:localsend_app/isolate/model/device.dart';
import 'package:localsend_app/isolate/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:localsend_app/isolate/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:localsend_app/isolate/src/isolate/child/server_isolate.dart';
import 'package:localsend_app/isolate/src/isolate/child/upload_isolate.dart';
import 'package:localsend_app/isolate/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_app/isolate/src/isolate/parent/parent_isolate_provider.dart';
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

  IsolateHttpServerStartAction({
    required this.pin,
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
        ),
      ),
    );
  }
}

class IsolateHttpServerStopAction extends ReduxAction<IsolateController, ParentIsolateState> {
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
          data: HttpServerStopTask(),
        ),
      ),
    );

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
/// The returned future completes when the file has been received completely
/// and throws if saving the file failed.
class IsolateHttpServerFileUploadTargetAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, Future<void>> {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;

  IsolateHttpServerFileUploadTargetAction({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
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
      ),
    );

    return (state, _awaitResult(events));
  }

  Future<void> _awaitResult(Stream<HttpServerEvent> events) async {
    await for (final event in events) {
      if (event case HttpServerFileUploadResultEvent(:final error)) {
        if (error != null) {
          throw HttpServerFileUploadException(error);
        }
        return;
      }
    }

    throw HttpServerFileUploadException('The server isolate did not report a result');
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
