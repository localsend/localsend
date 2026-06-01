import 'dart:async';

import 'package:collection/collection.dart';
import 'package:common/model/device.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/local_interface_info.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/last_devices.provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/rust/api/model.dart';
import 'package:localsend_app/util/rust.dart';
import 'package:localsend_app/util/two_direction_scanner.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

const int _kWideScanWorkers = 32;

enum _InputMode {
  hashtag,
  ip;

  String get label {
    return switch (this) {
      _InputMode.hashtag => t.dialogs.addressInput.hashtag,
      _InputMode.ip => t.dialogs.addressInput.ip,
    };
  }
}

/// A dialog to input an hash or address.
/// Pops the dialog with the device if found.
class AddressInputDialog extends StatefulWidget {
  const AddressInputDialog();

  @override
  State<AddressInputDialog> createState() => _AddressInputDialogState();
}

class _AddressInputDialogState extends State<AddressInputDialog> with Refena {
  final _selected = List.generate(_InputMode.values.length, (index) => index == 0);
  _InputMode _mode = _InputMode.hashtag;
  String _input = '';
  bool _fetching = false;
  String? _error;

  TwoDirectionScanner? _scan;
  final List<String> _triedIps = [];
  bool _triedExpanded = false;
  Timer? _rebuildTimer;

  @override
  void dispose() {
    _rebuildTimer?.cancel();
    super.dispose();
  }

  /// Coalesces rapid worker-completion notifications into ~20 Hz UI updates.
  void _scheduleRebuild() {
    if (_rebuildTimer != null) return;
    _rebuildTimer = Timer(const Duration(milliseconds: 50), () {
      _rebuildTimer = null;
      if (mounted) setState(() {});
    });
  }

  Future<void> _submit(List<LocalInterfaceInfo> localInterfaces, int port, [String? candidate]) async {
    final String input = _input.trim();
    final List<String> narrowCandidates;
    if (candidate != null) {
      narrowCandidates = [candidate];
    } else if (_mode == _InputMode.ip) {
      narrowCandidates = [input];
    } else {
      narrowCandidates = localInterfaces.map((i) => '${i.ip.ipPrefix}.$input').toList();
    }

    setState(() {
      _fetching = true;
      _triedIps.clear();
      _scan = null;
    });

    final https = ref.read(settingsProvider).https;
    final payload = ref.read(deviceFullInfoProvider).toRegisterDto();

    final deviceCompleter = Completer<void>();
    Device? foundDevice;
    String? error;

    Future<void> tryIp(String ip) async {
      if (deviceCompleter.isCompleted) return;
      try {
        final response = await ref
            .read(httpProvider)
            .v2
            .register(
              protocol: https ? ProtocolType.https : ProtocolType.http,
              ip: ip,
              port: port,
              payload: payload,
            );
        if (deviceCompleter.isCompleted) return;
        foundDevice = response.body.toDevice(ip, port, https, HttpDiscovery(ip: ip));
        deviceCompleter.complete();
      } catch (e) {
        error ??= e.toString();
      }
    }

    /// Fires a register attempt and records the IP in the tried list.
    Future<void> tryIpTracked(String ip) async {
      await tryIp(ip);
      _triedIps.insert(0, ip);
      _scheduleRebuild();
    }

    final narrowFuture = Future.wait([for (final ip in narrowCandidates) tryIpTracked(ip)]);

    Future<void> wideFuture = Future<void>.value();
    final isHashtagSearch = candidate == null && _mode == _InputMode.hashtag;
    if (isHashtagSearch) {
      final queues = buildWideQueues(localInterfaces, input, exclude: narrowCandidates.toSet());
      final scanner = TwoDirectionScanner(down: queues.down, up: queues.up)..start();
      setState(() => _scan = scanner);

      final alloc = allocateWorkers(_kWideScanWorkers, scanner.downTotal, scanner.upTotal);

      Future<void> worker(ScanDirection origin) async {
        while (!deviceCompleter.isCompleted) {
          final item = scanner.popNext(origin);
          if (item == null) return;
          try {
            await tryIp(item.ip);
          } finally {
            scanner.markDone(item);
            _triedIps.insert(0, item.ip);
            _scheduleRebuild();
          }
        }
      }

      wideFuture = Future.wait([
        for (var i = 0; i < alloc.down; i++) worker(ScanDirection.down),
        for (var i = 0; i < alloc.up; i++) worker(ScanDirection.up),
      ]);
    }

    // Wait until,
    // - a device is found
    // - both narrow and wide phases have settled
    await Future.any([
      deviceCompleter.future,
      Future.wait([narrowFuture, wideFuture]),
    ]);

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
        _scan = null;
        _triedIps.sort(_compareIpv4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localInterfaces = ref.watch(localIpProvider.select((info) => info.localInterfaces)).uniqueByIpPrefix;
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
            onFieldSubmitted: (s) async => _submit(localInterfaces, settings.port),
          ),
          const SizedBox(height: 10),
          if (_mode == _InputMode.hashtag) ...[
            Text(
              '${t.general.example}: 123',
              style: const TextStyle(color: Colors.grey),
            ),
            if (localInterfaces.length <= 1)
              Text(
                '${t.dialogs.addressInput.ip}: ${_candidateLabel(localInterfaces.firstOrNull, _input)}',
                style: const TextStyle(color: Colors.grey),
              )
            else ...[
              Text(
                '${t.dialogs.addressInput.ip}:',
                style: const TextStyle(color: Colors.grey),
              ),
              for (final iface in localInterfaces)
                Text(
                  '- ${_candidateLabel(iface, _input)}',
                  style: const TextStyle(color: Colors.grey),
                ),
            ],
          ] else ...[
            if (lastDevices.isEmpty)
              Text(
                '${t.general.example}: ${localInterfaces.firstOrNull?.ip.ipPrefix ?? '192.168.2'}.123',
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
                              recognizer: TapGestureRecognizer()..onTap = () async => _submit(localInterfaces, settings.port, device.ip),
                            ),
                          ];
                        })
                        .expand((e) => e),
                  ],
                ),
              ),
          ],
          if (_fetching && _scan != null) ...[
            const SizedBox(height: 14),
            _ProgressRow(direction: ScanDirection.down, scanner: _scan!),
            const SizedBox(height: 6),
            _ProgressRow(direction: ScanDirection.up, scanner: _scan!),
          ],
          if (_triedIps.isNotEmpty) ...[
            const SizedBox(height: 4),
            _TriedIpsDisclosure(
              ips: _triedIps,
              expanded: _triedExpanded,
              onToggle: (v) => setState(() => _triedExpanded = v),
            ),
          ],
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
          onPressed: _fetching ? null : () async => _submit(localInterfaces, settings.port),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}

class _ProgressRow extends StatelessWidget {
  final ScanDirection direction;
  final TwoDirectionScanner scanner;
  const _ProgressRow({required this.direction, required this.scanner});

  @override
  Widget build(BuildContext context) {
    final isDown = direction == ScanDirection.down;
    final done = isDown ? scanner.downDone : scanner.upDone;
    final total = isDown ? scanner.downTotal : scanner.upTotal;
    final eta = scanner.etaFor(direction);
    final hasItems = total > 0;
    final value = hasItems ? (done / total).clamp(0.0, 1.0) : 1.0;
    final style = TextStyle(fontSize: 12, color: Colors.grey.shade600);
    return Row(
      children: [
        Icon(
          isDown ? Icons.arrow_downward : Icons.arrow_upward,
          size: 14,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 56,
          child: Text(
            hasItems ? '$done/$total' : '—',
            style: style,
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 48,
          child: Text(
            eta != null ? '~${_formatEta(eta)}' : '—',
            style: style,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

String _formatEta(Duration d) {
  if (d.inSeconds < 60) return '${d.inSeconds}s';
  return '${(d.inSeconds / 60).floor()}m';
}

/// Renders a candidate-IP hint like `10.67.149.X /21 (subnet 144-151)`. The
/// `/N` and subnet range expose the detected prefix so the user can confirm
/// `if-addrs` actually picked it up — a fallback /16 surfaces as `(subnet
/// 0-255)`.
String _candidateLabel(LocalInterfaceInfo? iface, String input) {
  if (iface == null) return '192.168.2.$input';
  final base = '${iface.ip.ipPrefix}.$input';
  final octets = iface.ip.split('.');
  if (octets.length != 4) return base;
  final c = int.tryParse(octets[2]);
  if (c == null) return base;
  final bounds = subnetBoundsForThirdOctet(c, iface.prefixLength);
  final range = bounds.min == bounds.max ? '${bounds.min}' : '${bounds.min}-${bounds.max}';
  return '$base /${iface.prefixLength} (subnet $range)';
}

int _compareIpv4(String a, String b) {
  final pa = a.split('.');
  final pb = b.split('.');
  final n = pa.length < pb.length ? pa.length : pb.length;
  for (var i = 0; i < n; i++) {
    final ai = int.tryParse(pa[i]) ?? 0;
    final bi = int.tryParse(pb[i]) ?? 0;
    if (ai != bi) return ai.compareTo(bi);
  }
  return pa.length.compareTo(pb.length);
}

class _TriedIpsDisclosure extends StatelessWidget {
  final List<String> ips;
  final bool expanded;
  final ValueChanged<bool> onToggle;
  const _TriedIpsDisclosure({required this.ips, required this.expanded, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text('Tried IPs (${ips.length})', style: const TextStyle(fontSize: 13)),
        initiallyExpanded: expanded,
        onExpansionChanged: onToggle,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 160),
            child: Scrollbar(
              child: ListView.builder(
                itemCount: ips.length,
                itemBuilder: (_, i) => Text(
                  ips[i],
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on String {
  String get ipPrefix {
    return split('.').take(3).join('.');
  }
}

extension on List<LocalInterfaceInfo> {
  /// Deduplicates by the leading three octets of each IP — multiple addresses
  /// on the same `/24` collapse to the first seen.
  List<LocalInterfaceInfo> get uniqueByIpPrefix {
    final seen = <String>{};
    return where((i) => seen.add(i.ip.ipPrefix)).toList();
  }
}
