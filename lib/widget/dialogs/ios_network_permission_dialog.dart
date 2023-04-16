import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';
import 'package:system_settings/system_settings.dart';

class IosLocalNetworkDialog extends StatelessWidget {
  const IosLocalNetworkDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      // TODO i18n: Substitute hard-coded strings
      title: "Local Network discovery unauthorized",
      description: "Localsend can't find other devices without this permission, so make sure it's enabled!",
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
            label: Text("Go to Settings"),
          ),
        ],
      ),
    );
  }
}
