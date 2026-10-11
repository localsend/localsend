import 'package:flutter/material.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_isolates/util/sleep.dart';
import 'package:refena_flutter/refena_flutter.dart';

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
      final delay = context.read(settingsProvider).enableAnimations ? widget.delay.inMilliseconds : 0;
      await sleepAsync(delay);
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
