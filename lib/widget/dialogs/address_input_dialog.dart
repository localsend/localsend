import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/targeted_discovery_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:routerino/routerino.dart';

enum _InputMode {
  hashtag,
  ip;

  String get label {
    switch (this) {
      case _InputMode.hashtag:
        return t.dialogs.addressInput.hashtag;
      case _InputMode.ip:
        return t.dialogs.addressInput.ip;
    }
  }
}

class AddressInputDialog extends ConsumerStatefulWidget {
  const AddressInputDialog();

  @override
  ConsumerState<AddressInputDialog> createState() => _AddressInputDialogState();
}

class _AddressInputDialogState extends ConsumerState<AddressInputDialog> {
  final _selected = List.generate(_InputMode.values.length, (index) => index == 0);
  _InputMode _mode = _InputMode.hashtag;
  String _input = '';
  bool _fetching = false;
  bool _failed = false;

  Future<void> _submit(String? ipPrefix, int port) async {
    final String ip;
    final String input = _input.trim();
    if (_mode == _InputMode.ip) {
      ip = input;
    } else {
      ip = '$ipPrefix.$input';
    }

    setState(() {
      _fetching = true;
    });

    final device = await ref.read(targetedDiscoveryProvider).discover(ip, port);
    if (device != null) {
      if (mounted) {
        context.pop(device);
      }
    } else {
      setState(() {
        _fetching = false;
        _failed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localIps = ref.watch(networkInfoProvider.select((info) => info?.localIps));
    final ipPrefix = localIps?.firstOrNull?.split('.').take(3).join('.');
    final settings = ref.watch(settingsProvider);

    return AlertDialog(
      title: Text(t.dialogs.addressInput.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleButtons(
            isSelected: _selected,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selected.length; i++) {
                  _selected[i] = i == index;
                }
                _mode = _InputMode.values[index];
              });
            },
            borderRadius: BorderRadius.circular(10),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            children: _InputMode.values.map((mode) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(mode.label),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          TextFormField(
            autofocus: true,
            enabled: !_fetching,
            decoration: InputDecoration(
              prefixText: _mode == _InputMode.hashtag ? '# ' : 'IP: ',
            ),
            onChanged: (s) {
              setState(() => _input = s);
            },
            onFieldSubmitted: (s) => _submit(ipPrefix, settings.port),
          ),
          const SizedBox(height: 10),
          Text(
            '${t.general.example}: ${_mode == _InputMode.hashtag ? '123' : '${ipPrefix ?? '192.168.2'}.123'}',
            style: const TextStyle(color: Colors.grey),
          ),
          if (_mode == _InputMode.hashtag)
            Text(
              '${t.dialogs.addressInput.ip}: ${ipPrefix ?? '192.168.2'}.$_input',
              style: const TextStyle(color: Colors.grey),
            ),
          if (_failed)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(t.general.error, style: const TextStyle(color: Colors.orange)),
            ),
        ],
      ),
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).buttonTheme.colorScheme!.onPrimary : null,
          ),
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
            foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
          ),
          onPressed: _fetching ? null : () => _submit(ipPrefix, settings.port),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
