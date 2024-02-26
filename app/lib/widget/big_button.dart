import 'package:flutter/material.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

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
    final sizingInformation = SizingInformation(MediaQuery.sizeOf(context).width);
    final buttonWidth = sizingInformation.isDesktop ? 100.0 : 90.0;
    const buttonHeight = 65.0;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: buttonWidth,
        minWidth: buttonWidth,
        minHeight: buttonHeight,
        maxHeight: buttonHeight,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? colorScheme.primary : colorScheme.secondaryContainerIfDark,
          foregroundColor: filled ? colorScheme.onPrimary : colorScheme.onSecondaryContainerIfDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(left: 2, right: 2, top: 10 + desktopPaddingFix, bottom: 8 + desktopPaddingFix),
        ),
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            FittedBox(
              alignment: Alignment.bottomCenter,
              child: Text(label, maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}
