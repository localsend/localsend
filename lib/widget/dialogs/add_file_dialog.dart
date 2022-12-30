import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/file_picker.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';

class AddFileDialog extends StatelessWidget {
  final WidgetRef parentRef;
  final List<FilePickerOption> options;

  const AddFileDialog({required this.parentRef, required this.options});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: t.general.add,
      description: null,
      child: Column(
        children: [
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(3, (index) {
                  final option = index < options.length ? options[index] : null;
                  return [
                    Expanded(
                      child: option == null
                          ? Container()
                          : BigButton(
                              icon: option.icon,
                              label: option.label,
                              onTap: () {
                                context.popUntilRoot();
                                option.select(
                                  context: context,
                                  ref: parentRef,
                                );
                              },
                            ),
                    ),
                    const SizedBox(width: 15),
                  ];
                }).expand((e) => e).toList()
                  ..removeLast(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
