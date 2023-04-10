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
    return SizedBox(
      height: 60,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              filled ? Theme.of(context).colorScheme.primary : null,
          foregroundColor:
              filled ? Theme.of(context).colorScheme.onPrimary : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            FittedBox(
              child: Text(label, maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}
