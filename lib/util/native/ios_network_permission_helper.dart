import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/widget/dialogs/ios_network_permission_dialog.dart';
import 'package:logging/logging.dart';
import 'package:routerino/routerino.dart';

final _logger = Logger('IosNetworkPermissionHelper');
const iosCall = MethodChannel('localsend.localsend_app/iosCall');

/// Checks if local network permission is granted on iOS.
/// If not, a dialog will be shown.
void checkIosNetworkPermission(BuildContext context) async {
  try {
    final bool granted = await iosCall.invokeMethod('triggerLocalNetworkDialog');
    if (!granted) {
      _logger.info('Local Network Permission denied');
      if (context.mounted) await context.pushBottomSheet(() => const IosLocalNetworkDialog());
    }
  } on PlatformException catch (e) {
    _logger.warning('Failed to check local network permission', e);
  }
}
