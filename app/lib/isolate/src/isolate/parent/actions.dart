import 'dart:async';

import 'package:localsend_app/isolate/model/device.dart';
import 'package:localsend_app/isolate/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:localsend_app/isolate/src/isolate/child/multicast_discovery_isolate.dart';
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
  final Stream<double> progress;

  IsolateHttpUploadActionResult({
    required this.taskId,
    required this.progress,
  });
}

class IsolateHttpUploadAction extends ReduxActionWithResult<IsolateController, ParentIsolateState, IsolateHttpUploadActionResult> {
  final int isolateIndex;
  final String? remoteSessionId;
  final String remoteFileToken;
  final String fileId;
  final String? filePath;
  final List<int>? fileBytes;
  final int fileSize;
  final Device device;

  IsolateHttpUploadAction({
    required this.isolateIndex,
    required this.remoteSessionId,
    required this.remoteFileToken,
    required this.fileId,
    required this.filePath,
    required this.fileBytes,
    required this.fileSize,
    required this.device,
  });

  @override
  (ParentIsolateState, IsolateHttpUploadActionResult) reduce() {
    final connection = state.httpUpload[isolateIndex];

    final task = HttpUploadTask(
      remoteSessionId: remoteSessionId,
      remoteFileToken: remoteFileToken,
      fileId: fileId,
      filePath: filePath,
      fileBytes: fileBytes,
      fileSize: fileSize,
      device: device,
    );

    final taskId = IdProvider.instance.getNextId();
    final progress = connection.sendWrappedTaskAndListenStream(
      task: task,
      taskId: taskId,
    );

    return (
      state,
      IsolateHttpUploadActionResult(
        taskId: taskId,
        progress: progress,
      ),
    );
  }
}

class IsolateHttpUploadCancelAction extends ReduxAction<IsolateController, ParentIsolateState> {
  final int isolateIndex;
  final int taskId;

  IsolateHttpUploadCancelAction({
    required this.isolateIndex,
    required this.taskId,
  });

  @override
  ParentIsolateState reduce() {
    final connection = state.httpUpload[isolateIndex];

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
