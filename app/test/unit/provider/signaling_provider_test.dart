import 'package:localsend_app/provider/network/webrtc/signaling_provider.dart';
import 'package:localsend_app/rust/api/model.dart' as rust;
import 'package:localsend_app/rust/api/webrtc.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  const info = ProposingClientInfo(
    alias: 'New Alias',
    version: '2.1',
    deviceModel: 'macOS',
    deviceType: rust.DeviceType.desktop,
  );

  test('Should send client info to all connected signaling servers', () async {
    final connectionA = MockLsSignalingConnection();
    final connectionB = MockLsSignalingConnection();
    final service = _createService({
      'wss://a.localsend.org/v1/ws': connectionA,
      'wss://b.localsend.org/v1/ws': connectionB,
    });

    await service.dispatchAsync(UpdateClientInfoAction(info: info));

    verify(connectionA.updateInfo(info: info)).called(1);
    verify(connectionB.updateInfo(info: info)).called(1);
  });

  test('Should keep sending to remaining connections when one fails', () async {
    final connectionA = MockLsSignalingConnection();
    final connectionB = MockLsSignalingConnection();
    when(connectionA.updateInfo(info: anyNamed('info'))).thenAnswer((_) async => throw Exception('connection lost'));
    final service = _createService({
      'wss://a.localsend.org/v1/ws': connectionA,
      'wss://b.localsend.org/v1/ws': connectionB,
    });

    await service.dispatchAsync(UpdateClientInfoAction(info: info));

    verify(connectionB.updateInfo(info: info)).called(1);
  });
}

ReduxNotifierTester<SignalingState> _createService(Map<String, LsSignalingConnection> connections) {
  return ReduxNotifier.test(
    redux: SignalingService(persistence: MockPersistenceService()),
    initialState: SignalingState(
      signalingServers: connections.keys.toList(),
      stunServers: [],
      connections: connections,
    ),
  );
}
