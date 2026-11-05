import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

class CustomListTile extends StatelessWidget {
  final Widget? icon;
  final Widget title;
  final Widget subTitle;
  final Widget? trailing;

  /// If null, the padding follows the layout profile of the screen.
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const CustomListTile({
    this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedPadding = padding ?? EdgeInsets.all(SizingInformation.of(context).isCar ? 24 : 15);
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).colorScheme.secondaryContainerIfDark,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: resolvedPadding,
          child: Row(
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 15),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      child: title,
                    ),
                    const SizedBox(height: 5),
                    subTitle,
                  ],
                ),
              ),
              ?trailing,
            ],
          ),
        ),
      ),
    );
  }
}
