import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localsend_app/util/sleep.dart';

/// A slideshow of widgets using [AnimatedOpacity] as transition.
class OpacitySlideshow extends StatefulWidget {
  final List<Widget> children;
  final int durationMillis;
  final int switchDurationMillis;
  final bool running;

  const OpacitySlideshow({
    required this.children,
    required this.durationMillis,
    this.switchDurationMillis = 300,
    this.running = true,
    super.key,
  });

  @override
  State<OpacitySlideshow> createState() => _OpacitySlideshowState();
}

class _OpacitySlideshowState extends State<OpacitySlideshow> {
  Timer? _timer;
  int _index = 0;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void didUpdateWidget(OpacitySlideshow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.running && !widget.running) {
      _timer?.cancel();
    } else if (!oldWidget.running && widget.running) {
      _startTimer();
    }
  }

  void _startTimer() {
    if (widget.children.length <= 1) {
      return;
    }

    _timer = Timer.periodic(Duration(milliseconds: widget.durationMillis), (_) async {
      if (!mounted) return;
      setState(() {
        _opacity = 0;
      });
      await sleepAsync(widget.switchDurationMillis);
      if (!mounted) return;
      setState(() {
        _index = (_index + 1) % widget.children.length;
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: widget.switchDurationMillis),
      child: widget.children[_index],
    );
  }
}
