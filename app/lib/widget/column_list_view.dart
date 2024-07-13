import 'package:flutter/material.dart';

/// Behaves like a [Column] if there is enough space, otherwise like a [ListView].
class ColumnListView extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const ColumnListView({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
