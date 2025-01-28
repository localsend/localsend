import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/rust/api/webrtc.dart';
import 'package:refena_flutter/refena_flutter.dart';

part 'signaling_provider.mapper.dart';

final signalingProvider = ReduxProvider<SignalingService, SignalingState>((ref) {
  return SignalingService(
    persistence: ref.read(persistenceProvider),
  );
});

@MappableClass()
class SignalingState with SignalingStateMappable {
  final List<String> signalingServers;
  final List<String> stunServers;
  final Map<String, LsSignalingConnection> connections;

  SignalingState({
    required this.signalingServers,
    required this.stunServers,
    required this.connections,
  });
}

class SignalingService extends ReduxNotifier<SignalingState> {
  final PersistenceService _persistence;

  SignalingService({required PersistenceService persistence}) : _persistence = persistence;

  @override
  SignalingState init() {
    return SignalingState(
      signalingServers: _persistence.getSignalingServers(),
      stunServers: _persistence.getStunServers(),
      connections: {},
    );
  }
}

class SetupSignalingConnection extends AsyncReduxAction<SignalingService, SignalingState> {
  @override
  Future<SignalingState> reduce() async {
    for (final signalingServer in state.signalingServers) {
      // ignore: unawaited_futures
      dispatchAsync(_SetupSignalingConnection(signalingServer: signalingServer));
    }
    return state;
  }
}

/// Starts an endless running action.
class _SetupSignalingConnection extends AsyncReduxAction<SignalingService, SignalingState> {
  final String signalingServer;

  _SetupSignalingConnection({required this.signalingServer});

  @override
  Future<SignalingState> reduce() async {
    LsSignalingConnection? connection;
    final stream = connect(
      uri: 'wss://public.localsend.org/v1/ws',
      info: ClientInfoWithoutId(
        alias: 'alias',
        version: 'version',
        deviceModel: 'deviceModel',
        deviceType: PeerDeviceType.mobile,
        fingerprint: 'fingerprint',
      ),
      onConnection: (c) {
        connection = c;
      },
    );

    await for (final message in stream) {}

    return state;
  }
}
