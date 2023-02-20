import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/file_picker.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';

class AddFileDialog extends StatelessWidget {
  final WidgetRef parentRef;
  final List<FilePickerOption> options;

  const AddFileDialog({required this.parentRef, required this.options});

  static void open({required BuildContext context, required WidgetRef parentRef, required List<FilePickerOption> options}) {
    if (checkPlatformIsDesktop()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t.dialogs.addFile.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.dialogs.addFile.content),
              const SizedBox(height: 20),
              AddFileDialog(parentRef: parentRef, options: options),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(t.general.close),
            )
          ],
        ),
      );
    } else {
      context.pushBottomSheet(() => CustomBottomSheet(
            title: t.dialogs.addFile.title,
            description: t.dialogs.addFile.content,
            child: AddFileDialog(parentRef: parentRef, options: options),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        ...options.map((option) {
          return BigButton(
            icon: option.icon,
            label: option.label,
            filled: true,
            onTap: () {
              context.popUntilRoot();
              option.select(
                context: context,
                ref: parentRef,
              );
            },
          );
        }),
      ],
    );
  }
}
