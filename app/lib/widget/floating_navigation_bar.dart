import 'package:flutter/material.dart';

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
              child: Row(
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            width: 68,
            height: 52,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: selected ? colorScheme.primary : Colors.transparent,
            ),
            child: Icon(
              destination.icon,
              color: selected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
