import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/linux_tray.dart';
import 'package:tray_kit/tray_kit.dart';

void main() {
  test('shows PNG data and menu actions through tray_kit', () async {
    final platform = _FakeTrayKitPlatform();
    final icon = TrayIcon.png(Uint8List.fromList([1, 2, 3]));
    var opened = 0;
    var closed = 0;

    final shown = await showLinuxTray(
      platform: platform,
      icon: icon,
      tooltip: 'LocalSend',
      openLabel: 'Open',
      closeLabel: 'Quit',
      onOpen: () => opened++,
      onClose: () => closed++,
    );

    expect(shown, true);
    expect(platform.shownIcon?.bytes, same(icon.bytes));
    expect(platform.tooltip, 'LocalSend');
    expect(platform.menu, hasLength(2));
    (platform.menu!.first as TrayMenuAction).onSelected!();
    (platform.menu!.last as TrayMenuAction).onSelected!();
    expect(opened, 1);
    expect(closed, 1);
  });

  test('does not show a tray without a StatusNotifierItem host', () async {
    final platform = _FakeTrayKitPlatform(supported: false);

    final shown = await showLinuxTray(
      platform: platform,
      icon: TrayIcon.png(Uint8List(0)),
      tooltip: 'LocalSend',
      openLabel: 'Open',
      closeLabel: 'Quit',
      onOpen: () {},
      onClose: () {},
    );

    expect(shown, false);
    expect(platform.showCalls, 0);
  });

  test('hides through tray_kit', () async {
    final platform = _FakeTrayKitPlatform();

    await hideLinuxTray(platform);

    expect(platform.hideCalls, 1);
  });
}

class _FakeTrayKitPlatform extends TrayKitPlatform {
  _FakeTrayKitPlatform({this.supported = true});

  final bool supported;
  var showCalls = 0;
  var hideCalls = 0;
  TrayIcon? shownIcon;
  String? tooltip;
  List<TrayMenuItem>? menu;

  @override
  Future<void> hide() async {
    hideCalls++;
  }

  @override
  Future<bool> isSupported() async => supported;

  @override
  Future<void> show({
    required TrayIcon icon,
    required String tooltip,
    required List<TrayMenuItem> menu,
    required VoidCallback? onActivate,
  }) async {
    showCalls++;
    shownIcon = icon;
    this.tooltip = tooltip;
    this.menu = menu;
  }
}
