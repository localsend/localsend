import 'package:flutter/material.dart';
import 'package:localsend_app/widget/copyable_text.dart';

class DebugEntry extends StatelessWidget {
  static const headerStyle = TextStyle(fontWeight: FontWeight.bold);

  final String name;
  final String? value;

  const DebugEntry({
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(name, style: headerStyle),
        CopyableText(
          name: name,
          value: value,
        ),
      ],
    );
  }
}
