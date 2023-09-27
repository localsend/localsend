import 'package:flutter/material.dart';

class SizingInformation {
  final bool isMobile;
  final bool isTabletOrDesktop;
  final bool isDesktop;

  const SizingInformation(double width)
      : isMobile = width < 700,
        isTabletOrDesktop = width >= 700,
        isDesktop = width >= 800;
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return builder(SizingInformation(width));
  }
}
