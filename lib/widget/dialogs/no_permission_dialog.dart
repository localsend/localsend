import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

class NoPermissionDialog extends StatelessWidget {
  const NoPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.noPermission.title),
      content: Text(t.dialogs.noPermission.content),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.close),
        )
      ],
    );
  }
}
