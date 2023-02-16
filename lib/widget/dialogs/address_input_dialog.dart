import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/provider/last_devices.provider.dart';
import 'package:localsend_app/provider/network/targeted_discovery_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/task_runner.dart';
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

  Future<void> _submit(List<String> localIps, int port, [String? candidate]) async {
    final List<String> candidates;
    final String input = _input.trim();
    if (candidate != null) {
      candidates = [candidate];
    } else if (_mode == _InputMode.ip) {
      candidates = [input];
    } else {
      candidates = localIps.map((ip) => '${ip.ipPrefix}.$input').toList();
    }

    setState(() {
      _fetching = true;
    });

    final https = ref.read(settingsProvider.select((s) => s.https));
    final results = TaskRunner<Device?>(
      concurrency: 10,
      initialTasks: [
        for (final ip in candidates) () => ref.read(targetedDiscoveryProvider).discover(ip, port, https),
      ],
    ).stream;

    bool found = false;

    await results.forEach((device) {
      if (!found && device != null) {
        found = true;
        if (mounted) {
          ref.read(lastDevicesProvider.notifier).addDevice(device);
          context.pop(device);
        }
      }
    });

    if (!found && mounted) {
      setState(() {
        _fetching = false;
        _failed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localIps = (ref.watch(networkInfoProvider.select((info) => info.localIps))).uniqueIpPrefix;
    final settings = ref.watch(settingsProvider);
    final lastDevices = ref.watch(lastDevicesProvider);

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
            key: ValueKey('input-$_mode'),
            autofocus: true,
            enabled: !_fetching,
            keyboardType: _mode == _InputMode.hashtag ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              prefixText: _mode == _InputMode.hashtag ? '# ' : 'IP: ',
            ),
            onChanged: (s) {
              setState(() => _input = s);
            },
            onFieldSubmitted: (s) => _submit(localIps, settings.port),
          ),
          const SizedBox(height: 10),
          if (_mode == _InputMode.hashtag) ...[
            Text(
              '${t.general.example}: 123',
              style: const TextStyle(color: Colors.grey),
            ),
            if (localIps.length <= 1)
              Text(
                '${t.dialogs.addressInput.ip}: ${localIps.firstOrNull?.ipPrefix ?? '192.168.2'}.$_input',
                style: const TextStyle(color: Colors.grey),
              )
            else ...[
              Text(
                '${t.dialogs.addressInput.ip}:',
                style: const TextStyle(color: Colors.grey),
              ),
              for (final ip in localIps)
                Text(
                  '- ${ip.ipPrefix}.$_input',
                  style: const TextStyle(color: Colors.grey),
                ),
            ],
          ] else ...[
            if (lastDevices.isEmpty)
              Text(
                '${t.general.example}: ${localIps.firstOrNull?.ipPrefix ?? '192.168.2'}.123',
                style: const TextStyle(color: Colors.grey),
              )
            else
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: t.dialogs.addressInput.recentlyUsed),
                    ...lastDevices.mapIndexed((index, device) {
                      return [
                        if (index != 0) const TextSpan(text: ', '),
                        TextSpan(
                          text: device.ip,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _submit(localIps, settings.port, device.ip);
                            },
                        )
                      ];
                    }).expand((e) => e),
                  ],
                ),
              ),
          ],
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
          onPressed: _fetching ? null : () => _submit(localIps, settings.port),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}

extension on String {
  String get ipPrefix {
    return split('.').take(3).join('.');
  }
}

extension on List<String> {
  List<String> get uniqueIpPrefix {
    final seen = <String>{};
    return where((s) => seen.add(s.ipPrefix)).toList();
  }
}
