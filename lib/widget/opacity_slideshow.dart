import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localsend_app/util/sleep.dart';

/// A slideshow of widgets using [AnimatedOpacity] as transition.
class OpacitySlideshow extends StatefulWidget {
  final List<Widget> children;
  final int durationMillis;
  final int switchDurationMillis;

  const OpacitySlideshow({
    required this.children,
    required this.durationMillis,
    this.switchDurationMillis = 300,
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
    if (widget.children.length > 1) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void _startTimer() {
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
