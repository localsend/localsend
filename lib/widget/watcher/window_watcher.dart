import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:window_manager/window_manager.dart';

class WindowWatcher extends ConsumerStatefulWidget {
  final Widget child;
  final VoidCallback onClose;

  const WindowWatcher({
    required this.child,
    required this.onClose,
    super.key,
  });

  @override
  ConsumerState<WindowWatcher> createState() => _WindowWatcherState();
}

class _WindowWatcherState extends ConsumerState<WindowWatcher> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    if (checkPlatformIsDesktop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          // always handle close actions manually
          await windowManager.setPreventClose(true);
        } catch (e) {
          print(e);
        }
      });
    }
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Future<void> onWindowClose() async {
    PersistenceService persistenceService = ref.watch(persistenceProvider);
    final windowOffset = await windowManager.getPosition();
    final windowSize = await windowManager.getSize();
    await WindowDimensionProvider(persistenceService).storeDimensions(windowOffset: windowOffset, windowSize: windowSize);
    widget.onClose();
  }

  @override
  void onWindowFocus() {
    // call set state according to window_manager README
    setState(() {});
  }
}
