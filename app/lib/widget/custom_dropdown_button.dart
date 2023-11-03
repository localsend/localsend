import 'package:flutter/material.dart';
import 'package:localsend_app/theme.dart';

/// A [DropdownButton] with a custom theme.
/// Currently, there is no easy way to apply color and border radius to all [DropdownButton].
class CustomDropdownButton<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T>? onChanged;
  final bool expanded;

  const CustomDropdownButton({
    required this.value,
    required this.items,
    this.onChanged,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).inputDecorationTheme.fillColor,
      shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
      child: DropdownButton<T>(
        value: value,
        isExpanded: expanded,
        underline: Container(),
        borderRadius: Theme.of(context).inputDecorationTheme.borderRadius,
        items: items,
        onChanged: onChanged == null ? null : (value) {
          if (value != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}
