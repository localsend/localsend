import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

/// A virtual cursor for TV remotes, similar to the pointer in TV browsers.
///
/// Wraps the whole app (installed via [MaterialApp.builder]).
///
/// Controls:
/// - MENU key: toggle cursor mode on/off.
/// - D-pad: move the cursor (accelerates while held).
/// - OK/center: press = touch down at cursor, release = touch up.
///   - Quick press = tap.
///   - Hold = long press (e.g. starts text selection in [SelectableText]).
///   - Hold + D-pad = drag (extends text selection, scrolls lists).
/// - Pushing the cursor against a screen edge scrolls the content under it.
///
/// Key events are intercepted with [FocusManager.addEarlyKeyEventHandler],
/// which runs before focus traversal, so the D-pad does not move focus
/// while cursor mode is active. When inactive, all keys pass through.
class TvCursor extends StatefulWidget {
  final Widget child;

  const TvCursor({super.key, required this.child});

  @override
  State<TvCursor> createState() => _TvCursorState();
}

class _TvCursorState extends State<TvCursor> with SingleTickerProviderStateMixin {
  static const double _baseSpeed = 350; // logical px/s
  static const double _maxSpeed = 1400;
  static const double _acceleration = 1100; // px/s^2
  static const double _edgeScrollSpeed = 500; // px/s injected as wheel scroll

  bool _active = false;
  Offset _pos = Offset.zero;
  bool _posInitialized = false;
  bool _pressing = false;
  int _pointerId = 1 << 20; // avoid clashing with real pointer ids
  double _speed = _baseSpeed;
  Duration? _lastTick;
  late final Ticker _ticker;
  final Set<LogicalKeyboardKey> _heldDirections = {};

  bool get _supported => Platform.isAndroid;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    if (_supported) {
      FocusManager.instance.addEarlyKeyEventHandler(_onKey);
    }
  }

  @override
  void dispose() {
    if (_supported) {
      FocusManager.instance.removeEarlyKeyEventHandler(_onKey);
    }
    _ticker.dispose();
    super.dispose();
  }

  static bool _isDirection(LogicalKeyboardKey key) =>
      key == LogicalKeyboardKey.arrowUp ||
      key == LogicalKeyboardKey.arrowDown ||
      key == LogicalKeyboardKey.arrowLeft ||
      key == LogicalKeyboardKey.arrowRight;

  static bool _isSelect(LogicalKeyboardKey key) =>
      key == LogicalKeyboardKey.select ||
      key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter ||
      key == LogicalKeyboardKey.gameButtonA;

  static bool _isToggle(LogicalKeyboardKey key) => key == LogicalKeyboardKey.contextMenu;

  KeyEventResult _onKey(KeyEvent event) {
    final key = event.logicalKey;

    if (_isToggle(key)) {
      if (event is KeyDownEvent) {
        _toggle();
      }
      return KeyEventResult.handled;
    }

    if (!_active) {
      return KeyEventResult.ignored;
    }

    if (_isDirection(key)) {
      if (event is KeyDownEvent) {
        _heldDirections.add(key);
        _ensureTicking();
      } else if (event is KeyUpEvent) {
        _heldDirections.remove(key);
      }
      return KeyEventResult.handled;
    }

    if (_isSelect(key)) {
      if (event is KeyDownEvent && !_pressing) {
        _touchDown();
      } else if (event is KeyUpEvent && _pressing) {
        _touchUp();
      }
      return KeyEventResult.handled;
    }

    // Back key etc. behave normally even in cursor mode.
    return KeyEventResult.ignored;
  }

  void _toggle() {
    setState(() {
      _active = !_active;
      if (_active && !_posInitialized) {
        final size = MediaQuery.sizeOf(context);
        _pos = size.center(Offset.zero);
        _posInitialized = true;
      }
      if (!_active) {
        if (_pressing) {
          _touchUp();
        }
        _heldDirections.clear();
      }
    });
  }

  void _ensureTicking() {
    if (!_ticker.isActive) {
      _lastTick = null;
      _speed = _baseSpeed;
      unawaited(_ticker.start());
    }
  }

  void _onTick(Duration elapsed) {
    final last = _lastTick;
    _lastTick = elapsed;
    if (last == null) {
      return;
    }
    final dt = (elapsed - last).inMicroseconds / 1e6;

    if (_heldDirections.isEmpty) {
      _ticker.stop();
      _lastTick = null;
      _speed = _baseSpeed;
      return;
    }

    _speed = (_speed + _acceleration * dt).clamp(_baseSpeed, _maxSpeed);

    var delta = Offset.zero;
    if (_heldDirections.contains(LogicalKeyboardKey.arrowUp)) {
      delta += const Offset(0, -1);
    }
    if (_heldDirections.contains(LogicalKeyboardKey.arrowDown)) {
      delta += const Offset(0, 1);
    }
    if (_heldDirections.contains(LogicalKeyboardKey.arrowLeft)) {
      delta += const Offset(-1, 0);
    }
    if (_heldDirections.contains(LogicalKeyboardKey.arrowRight)) {
      delta += const Offset(1, 0);
    }
    if (delta == Offset.zero) {
      return;
    }

    final size = MediaQuery.sizeOf(context);
    final target = _pos + delta * (_speed * dt);
    final clamped = Offset(
      target.dx.clamp(0.0, size.width - 1),
      target.dy.clamp(0.0, size.height - 1),
    );

    // When pinned against an edge, scroll the content under the cursor instead.
    final blocked = target - clamped;
    if (blocked != Offset.zero && !_pressing) {
      final scrollDelta = Offset(
        blocked.dx == 0 ? 0 : blocked.dx.sign * _edgeScrollSpeed * dt,
        blocked.dy == 0 ? 0 : blocked.dy.sign * _edgeScrollSpeed * dt,
      );
      GestureBinding.instance.handlePointerEvent(PointerScrollEvent(
        position: _pos,
        scrollDelta: scrollDelta,
        kind: PointerDeviceKind.mouse,
      ));
    }

    if (clamped == _pos) {
      return;
    }

    final moveDelta = clamped - _pos;
    setState(() => _pos = clamped);

    if (_pressing) {
      GestureBinding.instance.handlePointerEvent(PointerMoveEvent(
        pointer: _pointerId,
        position: _pos,
        delta: moveDelta,
        kind: PointerDeviceKind.touch,
      ));
    }
  }

  void _touchDown() {
    _pointerId++;
    setState(() => _pressing = true);
    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      pointer: _pointerId,
      position: _pos,
      kind: PointerDeviceKind.touch,
    ));
  }

  void _touchUp() {
    setState(() => _pressing = false);
    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      pointer: _pointerId,
      position: _pos,
      kind: PointerDeviceKind.touch,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (!_supported) {
      return widget.child;
    }
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        if (_active)
          Positioned(
            left: _pos.dx - _CursorDot.radius,
            top: _pos.dy - _CursorDot.radius,
            child: IgnorePointer(
              child: _CursorDot(pressing: _pressing),
            ),
          ),
      ],
    );
  }
}

class _CursorDot extends StatelessWidget {
  static const double radius = 14;

  final bool pressing;

  const _CursorDot({required this.pressing});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pressing ? Colors.deepOrange.withValues(alpha: 0.85) : Colors.white.withValues(alpha: 0.75),
        border: Border.all(color: Colors.black54, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 6, spreadRadius: 1),
        ],
      ),
    );
  }
}
