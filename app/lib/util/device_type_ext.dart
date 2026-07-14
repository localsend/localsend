import 'package:flutter/material.dart';
import 'package:localsend_app/common/model/device.dart';

extension DeviceTypeExt on DeviceType {
  IconData get icon {
    return switch (this) {
      DeviceType.mobile => Icons.smartphone,
      DeviceType.desktop => Icons.computer,
      DeviceType.web => Icons.language,
      DeviceType.headless => Icons.terminal,
      DeviceType.server => Icons.dns,
    };
  }
}
