import 'dart:math';

import 'package:flutter/material.dart';

/// A horizontal list that adjusts the padding if the screen is too small.
/// In this case, the padding increases until half of the next button is visible.
/// This is useful to communicate to the user that there are more buttons to the right.
class HorizontalClipListView extends StatelessWidget {
  final double outerHorizontalPadding;
  final double outerVerticalPadding;
  final double minPadding;
  final double childWidth;
  final List<Widget> children;

  const HorizontalClipListView({
    super.key,
    required this.outerHorizontalPadding,
    required this.outerVerticalPadding,
    required this.minPadding,
    required this.childWidth,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - outerHorizontalPadding;
        final requiredWidth = childWidth * (children.length - 1) + childWidth * 0.2 + minPadding * (children.length - 1);
        final padding = switch (requiredWidth <= availableWidth) {
          true => minPadding,
          false => _calcPadding(
              availableWidth: availableWidth,
              childWidth: childWidth,
              childrenCount: children.length,
              minPadding: minPadding,
            ),
        };
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            key: ValueKey(padding),
            padding: EdgeInsets.symmetric(
              horizontal: outerHorizontalPadding,
              vertical: outerVerticalPadding,
            ),
            child: Row(
              children: [
                for (int i = 0; i < children.length; i++)
                  i == children.length - 1
                      ? children[i]
                      : Padding(
                          key: ValueKey(i),
                          padding: EdgeInsets.only(right: padding),
                          child: children[i],
                        ),
              ],
            ),
          ),
        );
      },
    );
  }
}

double _calcPadding({
  required double availableWidth,
  required double childWidth,
  required int childrenCount,
  required double minPadding,
}) {
  final possiblePaddings = const [0.15, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].map((percentage) => _calcPaddingFormula(
        availableWidth: availableWidth,
        childWidth: childWidth,
        childrenCount: childrenCount,
        minPadding: minPadding,
        clipPercentage: percentage,
      ));

  return max(minPadding, possiblePaddings.reduce(min));
}

double _calcPaddingFormula({
  required double availableWidth,
  required double childWidth,
  required int childrenCount,
  required double minPadding,
  required double clipPercentage,
}) {
  int visibleChildren = 0;
  for (int i = 1; i <= childrenCount; i++) {
    if (childWidth * i + minPadding * (i - 1) <= availableWidth + childWidth * clipPercentage) {
      visibleChildren++;
    } else {
      break;
    }
  }

  final padding = (availableWidth + (childWidth * clipPercentage) - childWidth * visibleChildren) / (visibleChildren - 1);

  return padding;
}
