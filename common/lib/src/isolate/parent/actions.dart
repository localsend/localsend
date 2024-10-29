import 'dart:async';

import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:common/src/isolate/child/http_target_discovery_isolate.dart';
import 'package:common/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/isolate/parent/parent_isolate_provider.dart';
import 'package:common/src/util/id_provider.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:refena/refena.dart';

final _idProvider = IdProvider();

class IsolateTargetHttpDiscoveryAction extends AsyncReduxActionWithResult<IsolateController, ParentIsolateState, Device?> {
  final String ip;
  final int port;
  final bool https;

  IsolateTargetHttpDiscoveryAction({
    required this.ip,
    required this.port,
    required this.https,
  });

  @override
  Future<(ParentIsolateState, Device?)> reduce() async {
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
        return (state, result.data);
      }
    }

    return (state, null);
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
  IsolateSendMulticastAnnouncementAction();

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

/// Sends a task to the isolate
/// and transforms [IsolateTaskStreamResult] into a proper stream making it easier to work with.
Stream<R> _sendTaskAndListenStream<R, T>({
  required T task,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateTask<T>>> connection,
}) {
  final wrappedTask = IsolateTask(
    id: _idProvider.getNextId(),
    data: task,
  );

  // ignore: unawaited_futures
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

/// Sends an [IsolateStreamTask] to the isolate
/// and transforms [IsolateTaskStreamResult] into a proper stream making it easier to work with.
Stream<R> _sendStreamTaskAndListenStream<R, S, T>({
  required Stream<T> task,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateStreamTask<T>>> connection,
}) {
  final taskId = _idProvider.getNextId();

  // ignore: unawaited_futures
  Future.microtask(() async {
    await for (final event in task) {
      connection.sendToIsolate(SendToIsolateData<IsolateStreamTask<T>>(
        syncState: null,
        data: IsolateStreamTask.event(
          id: taskId,
          data: event,
        ),
      ));

      // Make sure that the message was received because pulling the next event from the stream
      await connection.receiveFromIsolate.firstWhere((result) {
        return result is IsolateTaskStreamAckResult && result.id == taskId;
      });
    }
  });

  return _convertResponseToStream<R, T>(
    taskId: taskId,
    connection: connection,
  );
}

Stream<R> _convertResponseToStream<R, T>({
  required int taskId,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<BaseIsolateTask<T>>> connection,
}) {
  final controller = StreamController<R>();
  late StreamSubscription subscription;
  subscription = connection.receiveFromIsolate.listen((result) {
    if (result.id == taskId) {
      if (result.done) {
        subscription.cancel(); // ignore: discarded_futures
        controller.close(); // ignore: discarded_futures
      } else if (result.data != null) {
        controller.add(result.data as R);
      }
    }
  });

  return controller.stream;
}
