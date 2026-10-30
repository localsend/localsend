import 'package:flutter/material.dart';

const _itemWidth = 68.0;
const _indicatorSize = 52.0;
const _animationDuration = Duration(milliseconds: 300);

class FloatingNavigationDestination {
  final IconData icon;
  final String label;

  const FloatingNavigationDestination({
    required this.icon,
    required this.label,
  });
}

/// An icon-only navigation bar that floats over the page content.
class FloatingNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<FloatingNavigationDestination> destinations;

  const FloatingNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        child: Center(
          heightFactor: 1,
          child: Material(
            color: colorScheme.surfaceContainerHigh,
            elevation: 3,
            shadowColor: colorScheme.shadow,
            shape: const StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: _animationDuration,
                    curve: Curves.easeOutCubic,
                    left: selectedIndex * _itemWidth + (_itemWidth - _indicatorSize) / 2,
                    top: 0,
                    child: Container(
                      width: _indicatorSize,
                      height: _indicatorSize,
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var i = 0; i < destinations.length; i++)
                        _FloatingNavigationItem(
                          destination: destinations[i],
                          selected: i == selectedIndex,
                          onTap: () => onDestinationSelected(i),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingNavigationItem extends StatelessWidget {
  final FloatingNavigationDestination destination;
  final bool selected;
  final VoidCallback onTap;

  const _FloatingNavigationItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      selected: selected,
      button: true,
      child: Tooltip(
        message: destination.label,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: _itemWidth,
            height: _indicatorSize,
            child: AnimatedScale(
              duration: _animationDuration,
              curve: Curves.easeOutBack,
              scale: selected ? 1.15 : 1,
              child: TweenAnimationBuilder<Color?>(
                duration: _animationDuration,
                tween: ColorTween(end: selected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant),
                builder: (context, color, _) => Icon(destination.icon, color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
