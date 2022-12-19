import 'package:flutter/material.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/util/ip_helper.dart';

class DeviceWidget extends StatelessWidget {
  final Device device;

  const DeviceWidget({required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(device.deviceType.icon, size: 46),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(device.alias, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    _Badge(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      label: '#${device.ip.visualId}',
                    ),
                    if (device.deviceModel != null)
                      _Badge(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        label: device.deviceModel!,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final Color color;
  final String label;

  const _Badge({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface)),
    );
  }
}
