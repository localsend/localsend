import 'dart:async';
import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/device_info_result.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/model/stored_security_context.dart';
import 'package:localsend_isolates/src/isolate/child/server_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/isolate/parent/parent_isolate_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/typed_isolates.dart';

Future<void> _server(
  Stream<SendToIsolateData<IsolateTask<BaseHttpServerTask>>> messages,
  void Function(IsolateTaskStreamResult<HttpServerEvent>) send,
  SendPort parent,
) async {
  await for (final message in messages) {
    final task = message.data;
    if (task?.data is HttpServerStopTask) {
      final releaseSave = ReceivePort();
      parent.send(releaseSave.sendPort);
      await releaseSave.first;
      releaseSave.close();
      send(IsolateTaskStreamResult.done(id: task!.id));
    }
  }
}

void main() {
  test('dispose waits for receiver stop acknowledgement before killing the isolate', () async {
    final stopRequested = ReceivePort();
    final exited = ReceivePort();
    final connection =
        await TypedIsolates.startIsolate<IsolateTaskStreamResult<HttpServerEvent>, SendToIsolateData<IsolateTask<BaseHttpServerTask>>, SendPort>(
          task: _server,
          param: stopRequested.sendPort,
        );
    connection.isolate.addOnExitListener(exited.sendPort);
    addTearDown(() {
      connection.isolate.kill();
      stopRequested.close();
      exited.close();
    });
    final controller = ReduxNotifier.test(
      redux: IsolateController(
        initialState: ParentIsolateState(
          discovery: null,
          httpUpload: null,
          httpServer: connection,
          syncState: SyncState(
            rootIsolateToken: Object(),
            securityContext: const StoredSecurityContext(privateKey: '', publicKey: '', certificate: '', certificateHash: ''),
            deviceInfo: DeviceInfoResult(deviceType: DeviceType.desktop, deviceModel: null, androidSdkInt: null),
            alias: 'test',
            port: 53317,
            networkWhitelist: null,
            networkBlacklist: null,
            protocol: ProtocolType.http,
            multicastGroup: '224.0.0.167',
            discoveryTimeout: 100,
            serverRunning: true,
            download: false,
          ),
        ),
      ),
    );
    var finished = false;
    final disposing = controller.dispatchAsync(IsolateDisposeAction()).then((_) => finished = true);
    final release = await stopRequested.first as SendPort;
    await Future<void>.delayed(Duration.zero);
    expect(finished, isFalse);
    release.send(null);
    await disposing;
    await exited.first;
    expect(finished, isTrue);
  });
}
