import 'package:collection/collection.dart';
import 'package:localsend_app/model/persistence/tailnet_peer.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/tailnet_address.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// How many tailnet peers are persisted. Enough for a personal tailnet;
/// bounded so that the scan cost and the preference entry cannot be grown
/// without limit from the network.
const _maxTailnetPeers = 16;

/// The tailnet peers this device has seen, persisted across restarts.
///
/// Every staged scan probes them: a tailnet carries no announcements and
/// cannot be scanned, so these stored addresses — plus the local daemon's
/// peer list, on platforms that can enumerate it — are all discovery has
/// there. See [TailnetPeer] for why they must survive a restart.
final tailnetPeersProvider = ReduxProvider<TailnetPeersService, List<TailnetPeer>>((ref) {
  return TailnetPeersService(ref.read(persistenceProvider));
});

class TailnetPeersService extends ReduxNotifier<List<TailnetPeer>> {
  final PersistenceService _persistence;

  TailnetPeersService(this._persistence);

  @override
  List<TailnetPeer> init() => _persistence.getTailnetPeers();
}

/// Remembers the tailnet address of a confirmed device, replacing the
/// device's previous entry. Does nothing for a device without one.
class UpsertTailnetPeerAction extends AsyncReduxAction<TailnetPeersService, List<TailnetPeer>> {
  final Device device;

  UpsertTailnetPeerAction(this.device);

  @override
  Future<List<TailnetPeer>> reduce() async {
    // The channels are best first, so the first tailnet channel is the one
    // most recently confirmed.
    final channel = device.channels.whereType<HttpChannel>().firstWhereOrNull((channel) => isTailnetAddress(channel.host));
    if (channel == null) {
      await Future.microtask(() {});
      return state;
    }

    final peer = TailnetPeer(fingerprint: device.fingerprint, alias: device.alias, ip: channel.host, port: channel.port);
    if (state.contains(peer)) {
      // Confirmations arrive in bursts; only a change is worth a write.
      await Future.microtask(() {});
      return state;
    }

    // Newest last, so the cap drops the least recently confirmed peer.
    final updated = [
      ...state.where((e) => e.fingerprint != peer.fingerprint),
      peer,
    ];
    final capped = List<TailnetPeer>.unmodifiable(updated.length > _maxTailnetPeers ? updated.sublist(updated.length - _maxTailnetPeers) : updated);
    await notifier._persistence.setTailnetPeers(capped);
    return capped;
  }
}
