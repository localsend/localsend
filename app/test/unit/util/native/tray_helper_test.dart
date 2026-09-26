import 'package:flutter/material.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:test/test.dart';

void main() {
  test('resolveLinuxTrayIcon uses themed name for Flatpak', () {
    expect(
      resolveLinuxTrayIcon(isFlatpak: true, brightness: Brightness.light),
      'org.localsend.localsend_app-tray',
    );
    expect(
      resolveLinuxTrayIcon(isFlatpak: true, brightness: Brightness.dark),
      'org.localsend.localsend_app-tray',
    );
  });

  test('resolveLinuxTrayIcon picks black on light and white on dark', () {
    expect(
      resolveLinuxTrayIcon(isFlatpak: false, brightness: Brightness.light),
      Assets.img.logo32Black.path,
    );
    expect(
      resolveLinuxTrayIcon(isFlatpak: false, brightness: Brightness.dark),
      Assets.img.logo32White.path,
    );
  });
}
