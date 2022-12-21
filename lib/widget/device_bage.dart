import 'package:flutter/material.dart';

class DeviceBadge extends StatelessWidget {
  final Color color;
  final String label;

  const DeviceBadge({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface)),
    );
  }
}
