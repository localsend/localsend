import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final bool labelFirst;

  const LabeledCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
    this.labelFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labelFirst
          ? [
              Text(label),
              const SizedBox(width: 5),
              CupertinoCheckbox(
                activeColor: Theme.of(context).colorScheme.primary,
                value: value,
                onChanged: onChanged,
              ),
            ]
          : [
              CupertinoCheckbox(
                activeColor: Theme.of(context).colorScheme.primary,
                value: value,
                onChanged: onChanged,
              ),
              const SizedBox(width: 5),
              Text(label),
            ],
    );
  }
}
