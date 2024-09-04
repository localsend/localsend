import 'package:flutter/material.dart';

/// A horizontal list that adjusts the width if the screen is too small.
/// In this case, the width increases until 10% - 50% of the next button is visible.
/// This is useful to communicate to the user that there are more buttons to the right.
class HorizontalClipListView extends StatelessWidget {
  final double outerHorizontalPadding;
  final double outerVerticalPadding;
  final double childPadding;
  final double minChildWidth;
  final List<Widget> children;

  const HorizontalClipListView({
    super.key,
    required this.outerHorizontalPadding,
    required this.outerVerticalPadding,
    required this.childPadding,
    required this.minChildWidth,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final childWidth = _calcOptimalButtonWidth(
          availableWidth: constraints.maxWidth,
          paddingLeft: outerHorizontalPadding,
          childrenCount: children.length,
          minChildWidth: minChildWidth,
          childPadding: childPadding,
        );
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: outerHorizontalPadding,
              vertical: outerVerticalPadding,
            ),
            child: Row(
              children: [
                for (int i = 0; i < children.length; i++)
                  i == children.length - 1
                      ? SizedBox(
                          width: childWidth,
                          child: children[i],
                        )
                      : Padding(
                          padding: EdgeInsetsDirectional.only(end: childPadding),
                          child: SizedBox(
                            width: childWidth,
                            child: children[i],
                          ),
                        ),
              ],
            ),
          ),
        );
      },
    );
  }
}

double _calcOptimalButtonWidth({
  required double availableWidth,
  required double paddingLeft,
  required int childrenCount,
  required double minChildWidth,
  required double childPadding,
}) {
  int childWidth = minChildWidth.toInt();
  while (true) {
    if (_fitsOnScreen(
          availableWidth: availableWidth,
          paddingLeft: paddingLeft,
          childrenCount: childrenCount,
          childWidth: childWidth.toDouble(),
          childPadding: childPadding,
        ) ||
        _fitsPartially(
          availableWidth: availableWidth,
          paddingLeft: paddingLeft,
          childrenCount: childrenCount,
          childWidth: childWidth.toDouble(),
          childPadding: childPadding,
        )) {
      return childWidth.toDouble();
    }

    childWidth++;
  }
}

bool _fitsOnScreen({
  required double availableWidth,
  required double paddingLeft,
  required int childrenCount,
  required double childWidth,
  required double childPadding,
}) {
  return paddingLeft + childrenCount * childWidth + (childrenCount - 1) * childPadding <= availableWidth;
}

bool _fitsPartially({
  required double availableWidth,
  required double paddingLeft,
  required int childrenCount,
  required double childWidth,
  required double childPadding,
}) {
  for (int i = 2; i <= childrenCount; i++) {
    final minWidth = _calcTotalWidthWithPartialLastItem(
      paddingLeft: paddingLeft,
      childrenCount: i,
      childWidth: childWidth,
      childPadding: childPadding,
      lastItemPercentage: 0.1,
    );
    final maxWidth = _calcTotalWidthWithPartialLastItem(
      paddingLeft: paddingLeft,
      childrenCount: i,
      childWidth: childWidth,
      childPadding: childPadding,
      lastItemPercentage: 0.5,
    );

    if (minWidth <= availableWidth && maxWidth > availableWidth) {
      return true;
    }
  }
  return false;
}

@pragma('vm:prefer-inline')
@pragma('dart2js:tryInline')
double _calcTotalWidthWithPartialLastItem({
  required double paddingLeft,
  required int childrenCount,
  required double childWidth,
  required double childPadding,
  required double lastItemPercentage,
}) {
  return paddingLeft + (childrenCount - 1) * childWidth + childWidth * lastItemPercentage + (childrenCount - 1) * childPadding;
}
