import 'dart:async';

import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:common/src/isolate/child/http_target_discovery_isolate.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_stream_result.dart';
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

    final task = IsolateTask(
      id: _idProvider.getNextId(),
      data: HttpInterfaceScanTask(
        networkInterface: networkInterface,
        port: port,
        https: https,
      ),
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

    final task = IsolateTask(
      id: _idProvider.getNextId(),
      data: HttpFavoriteScanTask(
        favorites: favorites,
        https: https,
      ),
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
      data: const Object(),
    ));

    return state;
  }
}

Stream<R> _sendTaskAndListenStream<R, T>({
  required IsolateTask<T> task,
  required IsolateConnector<IsolateTaskStreamResult<R>, SendToIsolateData<IsolateTask<T>>> connection,
}) {
  // ignore: unawaited_futures
  Future.microtask(() {
    connection.sendToIsolate(SendToIsolateData<IsolateTask<T>>(
      syncState: null,
      data: task,
    ));
  });

  final controller = StreamController<R>();
  late StreamSubscription subscription;
  subscription = connection.receiveFromIsolate.listen((result) {
    if (result.id == task.id) {
      if (result.done) {
        subscription.cancel(); // ignore: discarded_futures
        controller.close(); // ignore: discarded_futures
      } else {
        controller.add(result.data as R);
      }
    }
  });

  return controller.stream;
}
