import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

class ScanButton extends ConsumerWidget {
  final List<String> ips;
  final void Function(String ip) onSelect;

  const ScanButton({
    required this.ips,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanningIps = ref.watch(nearbyDevicesProvider.select((s) => s.runningIps));

    if (ips.length <= 1) {
      return RotatingWidget(
        duration: const Duration(seconds: 2),
        spinning: scanningIps.isNotEmpty,
        reverse: true,
        child: CustomIconButton(
          onPressed: () => onSelect(ips.first),
          child: const Icon(Icons.sync),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(9999),
      child: Material(
        type: MaterialType.transparency,
        child: PopupMenuButton(
          offset: const Offset(60, 40),
          onSelected: (ip) => onSelect(ip),
          tooltip: t.sendTab.scan,
          itemBuilder: (_) {
            return [
              ...ips.map(
                (ip) => PopupMenuItem(
                  value: ip,
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _RotatingSyncIcon(ip),
                      const SizedBox(width: 10),
                      Text(ip),
                    ],
                  ),
                ),
              ),
            ];
          },
          child: RotatingWidget(
            duration: const Duration(seconds: 2),
            spinning: scanningIps.isNotEmpty,
            reverse: true,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.sync),
            ),
          ),
        ),
      ),
    );
  }
}

/// A separate widget, so it gets the latest data from provider.
class _RotatingSyncIcon extends ConsumerWidget {
  final String ip;

  const _RotatingSyncIcon(this.ip);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanningIps = ref.watch(nearbyDevicesProvider.select((s) => s.runningIps));
    return RotatingWidget(
      duration: const Duration(seconds: 2),
      spinning: scanningIps.contains(ip),
      reverse: true,
      child: const Icon(Icons.sync),
    );
  }
}
