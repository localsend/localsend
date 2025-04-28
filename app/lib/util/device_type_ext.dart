import 'package:common/model/device.dart';
import 'package:flutter/material.dart';
import  'package:lucide_icons_flutter/lucide_icons.dart';

extension DeviceTypeExt on DeviceType {
  IconData get icon {
    return switch (this) {
      DeviceType.mobile => LucideIcons.smartphone,
      DeviceType.desktop => LucideIcons.laptopMinimal,
      DeviceType.web => LucideIcons.globe,
      DeviceType.headless => LucideIcons.squareTerminal,
      DeviceType.server => LucideIcons.server,
    };
  }
}
