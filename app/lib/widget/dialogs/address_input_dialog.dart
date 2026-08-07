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
import 'package:localsend_isolates/constants.dart' as constants;
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

  Future<void> _submit(int port, List<String> localIps, [String? candidate, int? candidatePort]) async {
    final candidates = _addressCandidates(candidate ?? _input.trim(), port, localIps, candidatePort);
    if (candidates.isEmpty) {
      return;
    }

    setState(() {
      _fetching = true;
    });

    final https = ref.read(settingsProvider).https;

    final deviceCompleter = Completer<void>();
    Device? foundDevice;
    String? error;

    final payload = ref.read(deviceFullInfoProvider).toRegisterDto();

    final List<Future<void>> futures = [
      for (final candidate in candidates)
        () async {
          try {
            final response = await ref
                .read(httpProvider)
                .discovery
                .register(
                  protocol: https ? ProtocolType.https : ProtocolType.http,
                  ip: candidate.host,
                  port: candidate.port,
                  payload: payload,
                );

            foundDevice = response.body.toDevice(candidate.host, candidate.port, https);
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
            onFieldSubmitted: (s) async => _submit(settings.port, localIps),
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
                            recognizer: TapGestureRecognizer()..onTap = () async => _submit(settings.port, localIps, device.ip, device.port),
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
          onPressed: _fetching ? null : () async => _submit(settings.port, localIps),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}

List<({String host, int port})> _addressCandidates(String rawInput, int configuredPort, List<String> localIps, [int? candidatePort]) {
  final input = rawInput.trim();
  if (input.isEmpty) {
    return [];
  }

  final octetMatch = RegExp(r'^[#.]?(\d{1,3})(?::(\d{1,5}))?$').firstMatch(input);
  if (octetMatch != null) {
    final octet = int.tryParse(octetMatch.group(1)!);
    if (octet != null && octet >= 0 && octet <= 255) {
      final explicitPort = int.tryParse(octetMatch.group(2) ?? '');
      final prefixes = localIps.map((ip) => ip.ipPrefix).where((prefix) => prefix.split('.').length == 3).toSet();
      if (prefixes.isNotEmpty) {
        return _dedupeCandidates([
          for (final prefix in prefixes)
            for (final port in _candidatePorts(configuredPort, candidatePort, explicitPort)) (host: '$prefix.$octet', port: port),
        ]);
      }
    }
  }

  final parsed = _parseHostPort(input);
  if (parsed != null) {
    return _dedupeCandidates([
      for (final port in _candidatePorts(configuredPort, candidatePort, parsed.port)) (host: parsed.host, port: port),
    ]);
  }

  return _dedupeCandidates([
    for (final port in _candidatePorts(configuredPort, candidatePort, null)) (host: input, port: port),
  ]);
}

({String host, int? port})? _parseHostPort(String input) {
  final uri = Uri.tryParse(input.contains('://') ? input : 'localsend://$input');
  if (uri == null || uri.host.isEmpty) {
    return null;
  }

  return (host: uri.host, port: uri.hasPort ? uri.port : null);
}

List<int> _candidatePorts(int configuredPort, int? candidatePort, int? explicitPort) {
  final ports = [
    ?explicitPort,
    ?candidatePort,
    configuredPort,
    constants.defaultPort,
  ];
  final seen = <int>{};
  return ports.where((port) => port > 0 && port <= 65535 && seen.add(port)).toList();
}

List<({String host, int port})> _dedupeCandidates(List<({String host, int port})> candidates) {
  final seen = <String>{};
  return candidates.where((candidate) => seen.add('${candidate.host}:${candidate.port}')).toList();
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
