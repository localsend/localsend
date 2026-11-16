import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final bool labelFirst;
  final bool wrapLabel;

  const LabeledCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
    this.labelFirst = false,
    this.wrapLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelWidget = wrapLabel ? Flexible(child: Text(label)) : Text(label);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: labelFirst
          ? [
              labelWidget,
              const SizedBox(width: 5),
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
            ]
          : [
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
              const SizedBox(width: 5),
              labelWidget,
            ],
    );
  }
}
