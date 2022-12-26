import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/animated_opacity_cross_fade.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:localsend_app/widget/list_tile/custom_list_tile.dart';

class DeviceListTile extends StatelessWidget {
  final Device device;
  final bool thisDevice;
  final VoidCallback? onTap;

  const DeviceListTile({required this.device, this.thisDevice = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      icon: Icon(device.deviceType.icon, size: 46),
      title: AnimatedOpacityCrossFade(
        crossFadeState: thisDevice ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        durationMillis: 300,
        firstChild: Row(
          children: [
            Text(t.send.thisDevice, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 5),
            const Icon(Icons.star, size: 16),
          ],
        ),
        secondChild: Text(device.alias, style: const TextStyle(fontSize: 20)),
      ),
      subTitle: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          DeviceBadge(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            label: '#${device.ip.visualId}',
          ),
          if (device.deviceModel != null)
            DeviceBadge(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              label: device.deviceModel!,
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
