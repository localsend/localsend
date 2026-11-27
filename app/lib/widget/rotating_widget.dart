import 'package:flutter/material.dart';
import 'package:localsend_isolates/util/sleep.dart';

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
  bool _looping = false;
  bool _ticking = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAnglePerTick();
      _loop();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticking = TickerMode.valuesOf(context).enabled;
    _loop();
  }

  @override
  void didUpdateWidget(RotatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loop();
  }

  void _updateAnglePerTick() {
    _anglePerTick = _maxRadians / (widget.duration.inMilliseconds / _tickDuration);
    if (widget.reverse) {
      _anglePerTick = -_anglePerTick;
    }
  }

  /// This loop has a much greater performance than using [AnimationController].
  void _loop() async {
    if (_looping) {
      return;
    }
    _looping = true;
    while (mounted && widget.spinning && _ticking) {
      if (!WidgetsBinding.instance.framesEnabled) {
        await WidgetsBinding.instance.endOfFrame; // app hidden: wait for resume
      }
      await sleepAsync(_tickDuration);
      if (!mounted || !widget.spinning || !_ticking) {
        break;
      }
      setState(() {
        _angle = (_angle + _anglePerTick) % _maxRadians;
      });
    }
    _looping = false;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angle,
      child: widget.child,
    );
  }
}
