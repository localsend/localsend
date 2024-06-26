import 'package:flutter/material.dart';
import 'package:localsend_app/util/sleep.dart';

class RotatingWidget extends StatefulWidget {
  final Duration duration;
  final bool spinning;
  final bool reverse;
  final Widget child;

  const RotatingWidget({
    required this.duration,
    this.spinning = true,
    this.reverse = false,
    required this.child,
    super.key,
  });

  @override
  State<RotatingWidget> createState() => RotatingWidgetState();
}

class RotatingWidgetState extends State<RotatingWidget> {
  static const _fps = 30;
  static const _tickDuration = 1000 ~/ _fps; // in milliseconds
  static const _maxRadians = 6.28; // 360 degrees in radians
  double _angle = 0; // in radians
  double _anglePerTick = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAnglePerTick();
      _loop();
    });
  }

  void _updateAnglePerTick() {
    _anglePerTick = _maxRadians / (widget.duration.inMilliseconds / _tickDuration);
    if (widget.reverse) {
      _anglePerTick = -_anglePerTick;
    }
  }

  /// This loop has a much greater performance than using [AnimationController].
  void _loop() async {
    while (true) {
      await sleepAsync(_tickDuration);
      if (!mounted) {
        return;
      }
      if (!widget.spinning) {
        continue;
      }
      setState(() {
        _angle = (_angle + _anglePerTick) % _maxRadians;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angle,
      child: widget.child,
    );
  }
}
