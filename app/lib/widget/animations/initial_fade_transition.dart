import 'package:flutter/material.dart';
import 'package:localsend_app/util/sleep.dart';

class InitialFadeTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const InitialFadeTransition({
    required this.child,
    required this.duration,
    this.delay = Duration.zero,
    super.key,
  });

  @override
  State<InitialFadeTransition> createState() => _InitialFadeTransitionState();
}

class _InitialFadeTransitionState extends State<InitialFadeTransition> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await sleepAsync(widget.delay.inMilliseconds);
      if (!mounted) {
        return;
      }
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
