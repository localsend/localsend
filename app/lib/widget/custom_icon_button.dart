import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/platform_check.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CustomIconButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        shape: const CircleBorder(),
        padding: checkPlatformIsDesktop() ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16) : const EdgeInsets.all(8),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
