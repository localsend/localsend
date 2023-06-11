import 'package:flutter/material.dart';

class DeviceBadge extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;

  const DeviceBadge({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: TextStyle(color: foregroundColor)),
    );
  }
}
