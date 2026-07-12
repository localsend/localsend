import 'package:common/model/device.dart';
import 'package:localsend_app/model/persistence/known_peer.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('KnownPeers');

final knownPeersProvider = ReduxProvider<KnownPeersService, List<KnownPeer>>((ref) {
  return KnownPeersService(ref.read(persistenceProvider));
});

class KnownPeersService extends ReduxNotifier<List<KnownPeer>> {
  final PersistenceService _persistence;

  KnownPeersService(this._persistence);

  @override
  List<KnownPeer> init() => _persistence.getKnownPeers();
}

class UpdateKnownPeerAction
    extends AsyncReduxAction<KnownPeersService, List<KnownPeer>> {
  final Device device;

  UpdateKnownPeerAction(this.device);

  @override
  Future<List<KnownPeer>> reduce() async {
    if (device.ip == null || device.fingerprint.isEmpty) {
      return state;
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    final index = state.indexWhere(
      (peer) => peer.fingerprint == device.fingerprint,
    );
    final KnownPeer updatedPeer;
    final List<KnownPeer> updated;
    if (index == -1) {
      updatedPeer = KnownPeer.fromDevice(device, now);
      updated = [updatedPeer, ...state];
      _logger.info(
        '[KNOWN_PEERS] Cache create: ${device.alias} (${device.ip}:${device.port})',
      );
    } else {
      updatedPeer = state[index].mergeDevice(device, now);
      updated = <KnownPeer>[...state]
        ..replaceRange(index, index + 1, [updatedPeer]);
      _logger.info(
        '[KNOWN_PEERS] Cache update: ${device.alias} (${device.ip}:${device.port})',
      );
    }

    final sorted = updated.where((peer) => peer.endpoints.isNotEmpty).toList()
      ..sort((a, b) => b.lastSeen.compareTo(a.lastSeen));
    await notifier._persistence.setKnownPeers(sorted);
    return sorted;
  }
}

class RecordKnownPeerFailuresAction
    extends AsyncReduxAction<KnownPeersService, List<KnownPeer>> {
  final Set<String> endpointKeys;

  RecordKnownPeerFailuresAction(this.endpointKeys);

  @override
  Future<List<KnownPeer>> reduce() async {
    if (endpointKeys.isEmpty) {
      return state;
    }

    final updated = state
        .map((peer) => peer.markFailures(endpointKeys))
        .where((peer) => peer.endpoints.isNotEmpty)
        .toList();
    final beforeEndpoints = state.fold<int>(
      0,
      (count, peer) => count + peer.endpoints.length,
    );
    final afterEndpoints = updated.fold<int>(
      0,
      (count, peer) => count + peer.endpoints.length,
    );
    if (afterEndpoints < beforeEndpoints) {
      _logger.info(
        '[KNOWN_PEERS] Cache invalidated ${beforeEndpoints - afterEndpoints} stale endpoints',
      );
    } else {
      _logger.info(
        '[KNOWN_PEERS] Cache miss for ${endpointKeys.length} endpoints',
      );
    }
    await notifier._persistence.setKnownPeers(updated);
    return updated;
  }
}
