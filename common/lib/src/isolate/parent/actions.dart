import 'dart:async';

import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:common/src/isolate/child/http_target_discovery_isolate.dart';
import 'package:common/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:common/src/isolate/child/upload_isolate.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/isolate/parent/parent_isolate_provider.dart';
import 'package:common/src/util/id_provider.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:refena/refena.dart';

final _idProvider = IdProvider();

class IsolateTargetHttpDiscoveryAction extends AsyncReduxActionWithResult<IsolateController, ParentIsolateState, Device> {
  final String ip;
  final int port;
  final bool https;

  IsolateTargetHttpDiscoveryAction({
    required this.ip,
    required this.port,
    required this.https,
  });

  @override
  Future<(ParentIsolateState, Device)> reduce() async {
    final connection = state.httpTargetDiscovery;
    if (connection == null) {
      throw StateError('httpTargetDiscovery is not initialized');
    }

    final task = IsolateTask(
      id: _idProvider.getNextId(),
      data: HttpTargetTask(
        ip: ip,
        port: port,
        https: https,
      ),
    );

    // ignore: unawaited_futures
    Future.microtask(() {
      connection.sendToIsolate(SendToIsolateData(
        syncState: null,
        data: task,
      ));
    });

    await for (final result in connection.receiveFromIsolate) {
      if (result.id == task.id) {
        switch (result) {
          case IsolateTaskSuccessResult<Device>():
            return (state, result.data);
          case IsolateTaskErrorResult<Device>():
            throw result.error;
        }
      }
    }

    throw StateError('Unexpected end of stream');
  }
}

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
      _sendTaskAndListenStream(
        task: task,
        connection: connection,
      )
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
      _sendTaskAndListenStream(
        task: task,
        connection: connection,
      )
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

    connection.sendToIsolate(SendToIsolateData(
      syncState: null,
      data: MulticastAnnouncementTask.instance,
    ));

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

    connection.sendToIsolate(SendToIsolateData(
      syncState: null,
      data: MulticastRestartListenerTask.instance,
    ));

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
  final String mime;
  final int fileSize;
  final Device device;

  IsolateHttpUploadAction({
    required this.isolateIndex,
    required this.remoteSessionId,
    required this.remoteFileToken,
    required this.fileId,
    required this.filePath,
    required this.fileBytes,
    required this.mime,
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
      mime: mime,
      fileSize: fileSize,
      device: device,
    );

    final taskId = _idProvider.getNextId();
    final progress = _sendTaskAndListenStream(
      task: task,
      connection: connection,
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

    connection.sendToIsolate(SendToIsolateData(
      syncState: null,
      data: IsolateTask(
        id: _idProvider.getNextId(),
        data: HttpUploadCancelTask(
          taskId: taskId,
        ),
      ),
    ));

    return state;
  }
}

/// Sends a task to the isolate
/// and transforms [IsolateTaskStreamResult] into a proper stream making it easier to work with.
Stream<R> _sendTaskAndListenStream<R, T>({
  required T task,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateTask<T>>> connection,
  int? taskId,
}) {
  final wrappedTask = IsolateTask(
    id: taskId ?? _idProvider.getNextId(),
    data: task,
  );

  // ignore: discarded_futures
  Future.microtask(() {
    connection.sendToIsolate(SendToIsolateData<IsolateTask<T>>(
      syncState: null,
      data: wrappedTask,
    ));
  });

  return _convertResponseToStream<R, T>(
    taskId: wrappedTask.id,
    connection: connection,
  );
}

Stream<R> _convertResponseToStream<R, T>({
  required int taskId,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateTask<T>>> connection,
}) {
  final controller = StreamController<R>();
  late StreamSubscription subscription;
  subscription = connection.receiveFromIsolate.listen((result) {
    if (result.id == taskId) {
      if (result.data != null) {
        controller.add(result.data as R);
      } else if (result.done) {
        if (result.error != null) {
          controller.addError(result.error!);
        } else {
          subscription.cancel(); // ignore: discarded_futures
          controller.close(); // ignore: discarded_futures
        }
      }
    }
  });

  return controller.stream;
}
