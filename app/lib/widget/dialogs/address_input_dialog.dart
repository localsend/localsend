import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/last_devices.provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

/// A dialog to input an address.
/// Pops the dialog with the device if found.
class AddressInputDialog extends StatefulWidget {
  const AddressInputDialog();

  @override
  State<AddressInputDialog> createState() => _AddressInputDialogState();
}

class _AddressInputDialogState extends State<AddressInputDialog> with Refena {
  String _input = '';
  bool _fetching = false;
  String? _error;

  Future<void> _submit(int port, [String? candidate]) async {
    final candidates = [candidate ?? _input.trim()];

    setState(() {
      _fetching = true;
    });

    final https = ref.read(settingsProvider).https;

    final deviceCompleter = Completer<void>();
    Device? foundDevice;
    String? error;

    final payload = ref.read(deviceFullInfoProvider).toRegisterDto();

    final List<Future<void>> futures = [
      for (final ip in candidates)
        () async {
          try {
            final response = await ref
                .read(httpProvider)
                .discovery
                .register(
                  protocol: https ? ProtocolType.https : ProtocolType.http,
                  ip: ip,
                  port: port,
                  payload: payload,
                );

            foundDevice = response.body.toDevice(ip, port, https);
            deviceCompleter.complete();
          } catch (e) {
            error = e.toString();
            rethrow;
          }
        }(),
    ];

    // Wait until,
    // - a device is found
    // - all candidates are checked
    try {
      await Future.any([
        deviceCompleter.future,
        Future.wait(futures),
      ]);
    } catch (_) {}

    if (!mounted) {
      return;
    }

    if (foundDevice != null) {
      ref.redux(lastDevicesProvider).dispatch(AddLastDeviceAction(foundDevice!));
      context.pop(foundDevice);
    } else {
      setState(() {
        _fetching = false;
        _error = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localIps = (ref.watch(localIpProvider.select((info) => info.localIps))).uniqueIpPrefix;
    final settings = ref.watch(settingsProvider);
    final lastDevices = ref.watch(lastDevicesProvider);

    return AlertDialog(
      title: Text(t.dialogs.addressInput.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: true,
            enabled: !_fetching,
            decoration: InputDecoration(
              prefixText: 'IP: ',
            ),
            onChanged: (s) {
              setState(() => _input = s);
            },
            onFieldSubmitted: (s) async => _submit(settings.port),
          ),
          const SizedBox(height: 10),
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
                  ...lastDevices
                      .mapIndexed((index, device) {
                        return [
                          if (index != 0) const TextSpan(text: ', '),
                          TextSpan(
                            text: device.ip,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                            recognizer: TapGestureRecognizer()..onTap = () async => _submit(settings.port, device.ip),
                          ),
                        ];
                      })
                      .expand((e) => e),
                ],
              ),
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
          onPressed: _fetching ? null : () async => _submit(settings.port),
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
