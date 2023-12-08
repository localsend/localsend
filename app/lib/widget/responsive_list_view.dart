import 'package:flutter/material.dart';
import 'package:localsend_app/util/ui/nav_bar_padding.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

class ResponsiveListView extends StatelessWidget {
  static const defaultMaxWidth = 600.0;

  final double maxWidth;
  final ScrollController? controller;
  final EdgeInsets padding;
  final EdgeInsets desktopPadding;
  final List<Widget>? children;
  final Widget? child;

  const ResponsiveListView.single({
    this.maxWidth = defaultMaxWidth,
    this.controller,
    required this.padding,
    EdgeInsets? tabletPadding,
    required Widget this.child,
    super.key,
  })  : desktopPadding = tabletPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        children = null;

  const ResponsiveListView({
    this.maxWidth = defaultMaxWidth,
    this.controller,
    required this.padding,
    EdgeInsets? tabletPadding,
    required List<Widget> this.children,
    super.key,
  })  : desktopPadding = tabletPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child = null;

  @override
  Widget build(BuildContext context) {
    if (children != null) {
      return SingleChildScrollView(
        controller: controller,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: ResponsiveBuilder(
              builder: (sizingInformation) {
                final bottom = sizingInformation.isDesktop ? desktopPadding.bottom : padding.bottom;
                return Padding(
                  padding: (sizingInformation.isDesktop ? desktopPadding : padding).copyWith(
                    bottom: bottom + getNavBarPadding(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children!,
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: ResponsiveBuilder(
            builder: (sizingInformation) {
              return Padding(
                padding: sizingInformation.isDesktop ? desktopPadding : padding,
                child: child!,
              );
            },
          ),
        ),
      );
    }
  }
}
