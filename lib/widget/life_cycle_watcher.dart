import 'package:flutter/material.dart';

class LifeCycleWatcher extends StatefulWidget {
  final Widget child;
  final void Function(AppLifecycleState state) onChangedState;

  const LifeCycleWatcher({required this.child, required this.onChangedState, super.key});

  @override
  State<LifeCycleWatcher> createState() => _LifeCycleWatcherState();
}

class _LifeCycleWatcherState extends State<LifeCycleWatcher> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.onChangedState(state);
  }
}
