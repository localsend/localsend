import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';
import 'package:system_settings/system_settings.dart';

class IosLocalNetworkDialog extends StatelessWidget {
  const IosLocalNetworkDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: t.dialogs.localNetworkUnauthorized.title,
      description: t.dialogs.localNetworkUnauthorized.description,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(t.general.close),
          ),
          ElevatedButton.icon(
            onPressed: () async => SystemSettings.app(),
            icon: const Icon(Icons.settings),
            label: Text(t.dialogs.localNetworkUnauthorized.gotoSettings),
          ),
        ],
      ),
    );
  }
}
