import 'package:flutter/material.dart';
import 'package:localsend_app/util/sleep.dart';

/// The same as AnimatedCrossFade but with an opacity animation
class AnimatedOpacityCrossFade extends StatefulWidget {
  final CrossFadeState crossFadeState;
  final int durationMillis;
  final Widget firstChild;
  final Widget secondChild;

  const AnimatedOpacityCrossFade({
    required this.crossFadeState,
    required this.durationMillis,
    required this.firstChild,
    required this.secondChild,
  });

  @override
  State<AnimatedOpacityCrossFade> createState() => _AnimatedOpacityCrossFadeState();
}

class _AnimatedOpacityCrossFadeState extends State<AnimatedOpacityCrossFade> {
  late CrossFadeState _internalState;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    _internalState = widget.crossFadeState;
  }

  @override
  void didUpdateWidget(AnimatedOpacityCrossFade oldWidget) async {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.crossFadeState != widget.crossFadeState) {
      setState(() {
        _opacity = 0;
      });
      final targetState = widget.crossFadeState;
      await sleepAsync(widget.durationMillis);
      if (mounted && targetState == widget.crossFadeState) {
        setState(() {
          _internalState = widget.crossFadeState;
          _opacity = 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: widget.durationMillis ~/ 2),
      child: _internalState == CrossFadeState.showFirst ? widget.firstChild : widget.secondChild,
    );
  }
}
