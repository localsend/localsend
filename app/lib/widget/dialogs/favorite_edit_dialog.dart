import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/network/targeted_discovery_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/widget/dialogs/favorite_delete_dialog.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

/// A dialog to add or edit a favorite device.
class FavoriteEditDialog extends StatefulWidget {
  final FavoriteDevice? favorite;

  const FavoriteEditDialog({this.favorite});

  @override
  State<FavoriteEditDialog> createState() => _FavoriteEditDialogState();
}

class _FavoriteEditDialogState extends State<FavoriteEditDialog> with Refena {
  final _ipController = TextEditingController();
  final _portController = TextEditingController();
  final _aliasController = TextEditingController();
  bool _fetching = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();

    _ipController.text = widget.favorite?.ip ?? '';
    _aliasController.text = widget.favorite?.alias ?? '';

    ensureRef((ref) {
      _portController.text = widget.favorite?.port.toString() ?? ref.read(settingsProvider).port.toString();
    });
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    _aliasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.favorite != null ? t.dialogs.favoriteEditDialog.titleEdit : t.dialogs.favoriteEditDialog.titleAdd),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.dialogs.favoriteEditDialog.name),
          const SizedBox(height: 5),
          TextFormField(
            controller: _aliasController,
            decoration: InputDecoration(
              hintText: t.dialogs.favoriteEditDialog.auto,
            ),
            enabled: !_fetching,
          ),
          const SizedBox(height: 16),
          Text(t.dialogs.favoriteEditDialog.ip),
          const SizedBox(height: 5),
          TextFormField(
            controller: _ipController,
            autofocus: widget.favorite == null,
            enabled: !_fetching,
          ),
          const SizedBox(height: 16),
          Text(t.dialogs.favoriteEditDialog.port),
          const SizedBox(height: 5),
          TextFormField(
            controller: _portController,
            enabled: !_fetching,
            keyboardType: TextInputType.number,
          ),
          if (widget.favorite != null) ...[
            const SizedBox(height: 16),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.warning,
              ),
              onPressed: () async {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (_) => FavoriteDeleteDialog(widget.favorite!),
                );

                if (mounted && result == true) {
                  await context.ref.redux(favoritesProvider).dispatchAsync(RemoveFavoriteAction(deviceFingerprint: widget.favorite!.fingerprint));
                  if (mounted) {
                    context.pop();
                  }
                }
              },
              icon: const Icon(Icons.delete),
              label: Text(t.general.delete),
            ),
          ],
          if (_failed)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(t.general.error, style: TextStyle(color: Theme.of(context).colorScheme.warning)),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        FilledButton(
          onPressed: _fetching
              ? null
              : () async {
                  if (_ipController.text.isEmpty) {
                    return;
                  }

                  if (_portController.text.isEmpty) {
                    return;
                  }

                  if (widget.favorite != null) {
                    // Update existing favorite
                    final existingFavorite = widget.favorite!;
                    final trimmedNewAlias = _aliasController.text.trim();
                    if (trimmedNewAlias.isEmpty) {
                      return;
                    }

                    await ref.redux(favoritesProvider).dispatchAsync(UpdateFavoriteAction(existingFavorite.copyWith(
                          ip: _ipController.text,
                          port: int.parse(_portController.text),
                          alias: trimmedNewAlias,
                          customAlias: existingFavorite.customAlias || trimmedNewAlias != existingFavorite.alias,
                        )));
                  } else {
                    // Add new favorite
                    final ip = _ipController.text;
                    final port = int.parse(_portController.text);
                    final https = ref.read(settingsProvider).https;
                    setState(() {
                      _fetching = true;
                    });
                    final result = await ref.read(targetedDiscoveryProvider).discover(ip: ip, port: port, https: https);
                    if (result == null) {
                      setState(() {
                        _fetching = false;
                        _failed = true;
                      });
                      return;
                    }

                    final name = _aliasController.text.trim();

                    await ref.redux(favoritesProvider).dispatchAsync(AddFavoriteAction(FavoriteDevice.fromValues(
                          fingerprint: result.fingerprint,
                          ip: _ipController.text,
                          port: int.parse(_portController.text),
                          alias: name.isEmpty ? result.alias : name,
                        )));
                  }

                  if (mounted) {
                    context.pop();
                  }
                },
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
