import 'dart:ui';

import 'package:flutter/material.dart';

class LiquidGlassBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination> destinations;

  const LiquidGlassBottomBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.white.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.8),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(destinations.length, (index) {
                final selected = index == selectedIndex;
                return _LiquidGlassNavItem(
                  destination: destinations[index],
                  selected: selected,
                  onTap: () => onDestinationSelected(index),
                  colorScheme: colorScheme,
                  brightness: brightness,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _LiquidGlassNavItem extends StatefulWidget {
  final NavigationDestination destination;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final Brightness brightness;

  const _LiquidGlassNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
    required this.colorScheme,
    required this.brightness,
  });

  @override
  State<_LiquidGlassNavItem> createState() => _LiquidGlassNavItemState();
}

class _LiquidGlassNavItemState extends State<_LiquidGlassNavItem> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePointerDown(PointerDownEvent event) {
    _controller.forward();
  }

  void _handlePointerUp(PointerUpEvent event) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.colorScheme;
    final brightness = widget.brightness;

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: Listener(
        onPointerDown: _handlePointerDown,
        onPointerUp: _handlePointerUp,
        onPointerCancel: (_) => _controller.reverse(),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.selected
                      ? (brightness == Brightness.dark
                          ? colorScheme.primary.withValues(alpha: 0.25)
                          : colorScheme.primary.withValues(alpha: 0.18))
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: widget.selected
                      ? [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.selected
                            ? colorScheme.primary.withValues(alpha: 0.15)
                            : Colors.transparent,
                      ),
                      child: Icon(
                        widget.destination.icon,
                        color: widget.selected
                            ? colorScheme.primary
                            : brightness == Brightness.dark
                                ? Colors.white.withValues(alpha: 0.7)
                                : colorScheme.onSurface.withValues(alpha: 0.6),
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 2),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic,
                      style: TextStyle(
                        color: widget.selected
                            ? colorScheme.primary
                            : brightness == Brightness.dark
                                ? Colors.white.withValues(alpha: 0.7)
                                : colorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: 12,
                        fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w500,
                      ),
                      child: Text(
                        widget.destination.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
