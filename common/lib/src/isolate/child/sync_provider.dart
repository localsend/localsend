import 'package:common/model/device_info_result.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/model/stored_security_context.dart';
import 'package:common/src/isolate/child/http_provider.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:refena/refena.dart';

part 'sync_provider.mapper.dart';

/// Represents the state that is synchronized from the main isolate to the child isolate.
/// In other words, the main isolate sends this state to the child isolate.
@MappableClass()
class SyncState with SyncStateMappable {
  final Future<void> Function() init;
  final Object rootIsolateToken;
  final CustomHttpClient Function(Duration timeout, StoredSecurityContext) httpClientFactory;
  final StoredSecurityContext securityContext;
  final DeviceInfoResult deviceInfo;
  final String alias;
  final int port;
  final List<String>? networkWhitelist;
  final List<String>? networkBlacklist;
  final ProtocolType protocol;
  final String multicastGroup;
  final int discoveryTimeout;

  final bool serverRunning;
  final bool download;

  SyncState({
    required this.init,
    required this.rootIsolateToken,
    required this.httpClientFactory,
    required this.securityContext,
    required this.deviceInfo,
    required this.alias,
    required this.port,
    required this.networkWhitelist,
    required this.networkBlacklist,
    required this.protocol,
    required this.multicastGroup,
    required this.discoveryTimeout,
    required this.serverRunning,
    required this.download,
  });

  @override
  String toString() {
    return 'SyncState(securityContext: <SecurityContext>, deviceInfo: $deviceInfo, alias: $alias, port: $port, networkWhitelist: $networkWhitelist, networkBlacklist: $networkBlacklist, protocol: $protocol, multicastGroup: $multicastGroup, discoveryTimeout: $discoveryTimeout, serverRunning: $serverRunning, download: $download)';
  }
}

@internal
final syncProvider = ReduxProvider<SyncService, SyncState>((ref) {
  throw 'Not initialized';
});

class SyncService extends ReduxNotifier<SyncState> {
  final SyncState initial;

  SyncService({
    required this.initial,
  });

  @override
  SyncState init() => initial;
}

class UpdateSyncStateAction extends ReduxAction<SyncService, SyncState> {
  final SyncState newState;

  UpdateSyncStateAction(this.newState);

  @override
  SyncState reduce() {
    return newState;
  }
}
