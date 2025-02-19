import 'package:common/isolate.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_app/widget/dialogs/favorite_edit_dialog.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

/// A dialog showing a list of favorites
class FavoritesDialog extends StatefulWidget {
  const FavoritesDialog();

  @override
  State<FavoritesDialog> createState() => _FavoritesDialogState();
}

class _FavoritesDialogState extends State<FavoritesDialog> with Refena {
  bool _fetching = false;
  String? _error;

  /// Checks if the device is reachable and pops the dialog with the result if it is.
  Future<void> _checkConnectionToDevice(FavoriteDevice favorite) async {
    setState(() {
      _fetching = true;
    });

    final https = ref.read(settingsProvider).https;

    try {
      final result = await ref.redux(parentIsolateProvider).dispatchAsyncTakeResult(IsolateTargetHttpDiscoveryAction(
            ip: favorite.ip,
            port: favorite.port,
            https: https,
          ));

      if (mounted) {
        context.pop(result);
      }
    } catch (e) {
      setState(() {
        _fetching = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _showDeviceDialog([FavoriteDevice? favorite]) async {
    await showDialog(context: context, builder: (_) => FavoriteEditDialog(favorite: favorite));
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesProvider);

    return AlertDialog(
      title: Text(t.dialogs.favoriteDialog.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (favorites.isEmpty)
            Text(
              t.dialogs.favoriteDialog.noFavorites,
              style: const TextStyle(color: Colors.grey),
            ),
          for (final favorite in favorites)
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                    onPressed: _fetching ? null : () async => await _checkConnectionToDevice(favorite),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${favorite.alias}\n(${favorite.ip})'),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                  onPressed: _fetching ? null : () async => await _showDeviceDialog(favorite),
                  child: const Icon(Icons.edit),
                ),
              ],
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(t.general.error, style: TextStyle(color: Theme.of(context).colorScheme.warning)),
                  if (_error != null) ...[
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => ErrorDialog(error: _error!),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.info, color: Theme.of(context).colorScheme.warning, size: 20),
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        FilledButton(
          onPressed: _showDeviceDialog,
          child: Text(t.dialogs.favoriteDialog.addFavorite),
        ),
      ],
    );
  }
}
