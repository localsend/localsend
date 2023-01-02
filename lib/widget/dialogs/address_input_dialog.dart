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
  final _addressController = TextEditingController();
  final _selected = List.generate(_InputMode.values.length, (index) => index == 0);
  _InputMode _mode = _InputMode.hashtag;
  bool _fetching = false;
  bool _failed = false;

  Future<void> _submit(String? ipPrefix, int port) async {
    final String ip;
    final String input = _addressController.text.trim();
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
    final localIp = ref.watch(networkInfoProvider.select((info) => info?.localIp));
    final ipPrefix = localIp?.split('.').take(3).join('.');
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
            children: _InputMode.values.map((mode) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(mode.label),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _addressController,
            autofocus: true,
            enabled: !_fetching,
            decoration: InputDecoration(
              prefixText: _mode == _InputMode.hashtag ? '# ' : 'IP: ',
            ),
            onFieldSubmitted: (s) => _submit(ipPrefix, settings.port),
          ),
          const SizedBox(height: 10),
          Text('${t.general.example}: ${_mode == _InputMode.hashtag ? '123' : '${ipPrefix ?? '192.168.2'}.123'}'),
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
