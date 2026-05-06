import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';
import 'package:system_settings_2/system_settings_2.dart';

class NoPermissionDialog extends StatelessWidget {
  const NoPermissionDialog({
    super.key,
    this.additionalContent,
  });

  final String? additionalContent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.noPermission.title),
      content: Text(
        additionalContent == null ? t.dialogs.noPermission.content : '${t.dialogs.noPermission.content}\n\n$additionalContent',
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.close),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            context.pop();
            await SystemSettings.app();
          },
          icon: const Icon(Icons.settings),
          label: Text(t.general.settings),
        ),
      ],
    );
  }
}
