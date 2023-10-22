import 'package:flutter/material.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:localsend_app/widget/list_tile/custom_list_tile.dart';
import 'package:localsend_app/widget/opacity_slideshow.dart';
import 'package:refena_flutter/refena_flutter.dart';

class DevicePlaceholderListTile extends StatelessWidget {
  const DevicePlaceholderListTile();

  @override
  Widget build(BuildContext context) {
    final animations = context.ref.watch(animationProvider);
    return CustomListTile(
      icon: OpacitySlideshow(
        durationMillis: 3000,
        running: animations,
        children: [
          ...DeviceType.values.map((d) => Icon(d.icon, size: 46)),
        ],
      ),
      title: const Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        // A workaround to have an implicit height
        child: Text('A', style: TextStyle(fontSize: 20)),
      ),
      subTitle: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          DeviceBadge(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.5),
            foregroundColor: Colors.transparent,
            label: '       ',
          ),
          DeviceBadge(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.5),
            foregroundColor: Colors.transparent,
            label: '              ',
          ),
        ],
      ),
    );
  }
}
