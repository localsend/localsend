import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/tabs/receive_tab.dart';
import 'package:localsend_app/pages/tabs/send_tab.dart';
import 'package:localsend_app/pages/tabs/settings_tab.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/snackbar.dart';

enum _Tab {
  receive(Icons.wifi),
  send(Icons.send),
  settings(Icons.settings);

  const _Tab(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case _Tab.receive:
        return t.receiveTab.title;
      case _Tab.send:
        return t.sendTab.title;
      case _Tab.settings:
        return t.settingsTab.title;
    }
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _pageController = PageController();
  _Tab _currentTab = _Tab.receive;

  bool _dragAndDropIndicator = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    updateSystemOverlayStyle(context);

    final settings = ref.read(settingsProvider);
    try {
      await ref.read(serverProvider.notifier).startServer(
        alias: settings.alias,
        port: settings.port,
      );
    } catch (e) {
      context.showSnackBar(e.toString());
    }
  }

  void _goToPage(int index) {
    setState(() {
      _currentTab = _Tab.values[index];
      _pageController.jumpToPage(_currentTab.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Translations.of(context); // rebuild on locale change
    return DropTarget(
      onDragEntered: (_) {
        setState(() {
          _dragAndDropIndicator = true;
        });
      },
      onDragExited: (_) {
        setState(() {
          _dragAndDropIndicator = false;
        });
      },
      onDragDone: (event) {
        ref.read(selectedFilesProvider.notifier).addFiles(
          files: event.files,
          converter: CrossFileConverters.convertXFile,
        );
        _goToPage(_Tab.send.index);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ReceiveTab(),
                  SendTab(),
                  SettingsTab(),
                ],
              ),
              if (_dragAndDropIndicator)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_download, size: 128),
                      const SizedBox(height: 30),
                      Text(t.sendTab.placeItems, style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentTab.index,
          onDestinationSelected: _goToPage,
          destinations: _Tab.values.map((tab) {
            return NavigationDestination(icon: Icon(tab.icon), label: tab.label);
          }).toList(),
        ),
      ),
    );
  }
}
