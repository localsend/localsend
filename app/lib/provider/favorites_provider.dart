import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _autoTrustInteractionThreshold = 3;

/// This provider stores the list of favorite devices.
/// It automatically saves the list to the device's storage.
final favoritesProvider = ReduxProvider<FavoritesService, List<FavoriteDevice>>((ref) {
  return FavoritesService(ref.read(persistenceProvider));
});

class FavoritesService extends ReduxNotifier<List<FavoriteDevice>> {
  final PersistenceService _persistence;

  FavoritesService(this._persistence);

  @override
  List<FavoriteDevice> init() => _persistence.getFavorites();
}

/// Adds a favorite device.
class AddFavoriteAction extends AsyncReduxAction<FavoritesService, List<FavoriteDevice>> {
  final FavoriteDevice device;

  AddFavoriteAction(this.device);

  @override
  Future<List<FavoriteDevice>> reduce() async {
    final updated = List<FavoriteDevice>.unmodifiable([
      ...state,
      device,
    ]);
    await notifier._persistence.setFavorites(updated);
    return updated;
  }
}

/// Records a successful send/receive interaction and promotes repeat peers to
/// Favorites, which is the existing quick-save trusted category.
class RecordTrustedInteractionAction extends AsyncReduxAction<FavoritesService, List<FavoriteDevice>> {
  final Device device;

  RecordTrustedInteractionAction(this.device);

  @override
  Future<List<FavoriteDevice>> reduce() async {
    final ip = device.ip;
    if (device.fingerprint.isEmpty || ip == null || ip.isEmpty) {
      await Future.microtask(() {});
      return state;
    }

    final counts = notifier._persistence.getTrustedInteractionCounts();
    final updatedCount = (counts[device.fingerprint] ?? 0) + 1;
    await notifier._persistence.setTrustedInteractionCounts({
      ...counts,
      device.fingerprint: updatedCount,
    });

    if (updatedCount < _autoTrustInteractionThreshold) {
      return state;
    }

    final existingIndex = state.indexWhere((entry) => entry.fingerprint == device.fingerprint);
    if (existingIndex != -1) {
      final existing = state[existingIndex];
      final updatedDevice = existing.copyWith(
        ip: ip,
        port: device.port,
        alias: existing.customAlias ? existing.alias : device.alias,
      );
      if (updatedDevice == existing) {
        return state;
      }
      final updated = List<FavoriteDevice>.unmodifiable(
        <FavoriteDevice>[
          ...state,
        ]..replaceRange(existingIndex, existingIndex + 1, [updatedDevice]),
      );
      await notifier._persistence.setFavorites(updated);
      return updated;
    }

    final updated = List<FavoriteDevice>.unmodifiable([
      ...state,
      FavoriteDevice.fromValues(
        fingerprint: device.fingerprint,
        ip: ip,
        port: device.port,
        alias: device.alias,
      ),
    ]);
    await notifier._persistence.setFavorites(updated);
    return updated;
  }
}

/// Updates a favorite device.
class UpdateFavoriteAction extends AsyncReduxAction<FavoritesService, List<FavoriteDevice>> {
  final FavoriteDevice device;

  UpdateFavoriteAction(this.device);

  @override
  Future<List<FavoriteDevice>> reduce() async {
    final index = state.indexWhere((e) => e.id == device.id);
    if (index == -1) {
      // Unknown device
      await Future.microtask(() {});
      return state;
    }
    final updated = List<FavoriteDevice>.unmodifiable(
      <FavoriteDevice>[
        ...state,
      ]..replaceRange(index, index + 1, [device]),
    );
    await notifier._persistence.setFavorites(updated);
    return updated;
  }
}

/// Removes a favorite device.
class RemoveFavoriteAction extends AsyncReduxAction<FavoritesService, List<FavoriteDevice>> {
  final String deviceFingerprint;

  RemoveFavoriteAction({
    required this.deviceFingerprint,
  });

  @override
  Future<List<FavoriteDevice>> reduce() async {
    final index = state.indexWhere((e) => e.fingerprint == deviceFingerprint);
    if (index == -1) {
      // Unknown device
      return state;
    }
    final updated = List<FavoriteDevice>.unmodifiable(
      <FavoriteDevice>[
        ...state,
      ]..removeAt(index),
    );
    await notifier._persistence.setFavorites(updated);
    return updated;
  }
}
