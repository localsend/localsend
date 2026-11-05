import 'package:flutter/material.dart';
import 'package:localsend_app/widget/car_mode_scope.dart';

class SizingInformation {
  static const double wideBreakpoint = carModeMinWidth;

  /// Width of the centered content column for each layout profile.
  static const double mobileContentWidth = 600;
  static const double desktopContentWidth = 900;
  static const double wideContentWidth = 1200;
  static const double carContentWidth = 1400;

  final bool isMobile;
  final bool isTabletOrDesktop;
  final bool isDesktop;
  final bool isWide;
  final bool isCar;

  const SizingInformation(double width, {this.carMode = false})
    : isMobile = width < 700,
      isTabletOrDesktop = width >= 700,
      isDesktop = width >= 800,
      isWide = width >= wideBreakpoint,
      isCar = carMode && width >= 700;

  /// Whether the car dashboard is active.
  final bool carMode;

  /// Maximum width of the centered content column.
  double get contentMaxWidth {
    if (isCar) {
      return carContentWidth;
    }
    if (isWide) {
      return wideContentWidth;
    }
    if (isDesktop) {
      return desktopContentWidth;
    }
    return mobileContentWidth;
  }

  /// Reads the layout profile from the widget tree.
  static SizingInformation of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizingInformation(width, carMode: CarModeScope.of(context));
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return builder(SizingInformation.of(context));
  }
}
