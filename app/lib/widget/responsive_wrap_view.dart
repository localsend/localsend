import 'package:flutter/material.dart';

/// A widget that displays a list of children in a responsive, wrapping grid.
///
/// It lays out children horizontally, and when a row is full, it wraps
/// to the next line. It calculates an optimal, equal width for all children
/// to make them fill the available width, while ensuring they are never
/// smaller than [minChildWidth].
class ResponsiveWrapView extends StatelessWidget {
  final double outerHorizontalPadding;
  final double outerVerticalPadding;
  final double childPadding;
  final double minChildWidth;
  final List<Widget> children;

  const ResponsiveWrapView({
    super.key,
    required this.outerHorizontalPadding,
    required this.outerVerticalPadding,
    required this.childPadding,
    required this.minChildWidth,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: outerHorizontalPadding,
        vertical: outerVerticalPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double availableWidth = constraints.maxWidth;

          if (availableWidth < minChildWidth) {
            return Wrap(
              runSpacing: childPadding,
              children: children
                  .map(
                    (child) => SizedBox(
                      width: availableWidth,
                      child: child,
                    ),
                  )
                  .toList(),
            );
          }

          // Calculate how many items *can* fit in a row at their minimum size.
          //  Formula: n * minChildWidth + (n - 1) * childPadding <= availableWidth
          //  This simplifies to: n <= (availableWidth + childPadding) / (minChildWidth + childPadding)
          final int numItemsPerRow = ((availableWidth + childPadding) / (minChildWidth + childPadding)).floor();

          // Calculate the *actual* width to make `numItemsPerRow` items
          // fill the `availableWidth` perfectly.
          //  Formula: numItemsPerRow * actualWidth + (numItemsPerRow - 1) * childPadding = availableWidth
          final double actualChildWidth = (availableWidth - (numItemsPerRow - 1) * childPadding) / numItemsPerRow;

          return Wrap(
            spacing: childPadding,
            runSpacing: childPadding,
            children: children
                .map(
                  (child) => SizedBox(
                    width: actualChildWidth,
                    child: child,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
