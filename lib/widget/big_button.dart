import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const BigButton({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 90,
        minWidth: 90,
        minHeight: 65,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? colorScheme.primary : colorScheme.secondaryContainer,
          foregroundColor: filled ? colorScheme.onPrimary : colorScheme.onSecondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 5),
            FittedBox(
              child: Text(label, maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}
