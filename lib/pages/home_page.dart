import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/tabs/receive_tab.dart';
import 'package:localsend_app/pages/tabs/send_tab.dart';
import 'package:localsend_app/pages/tabs/settings_tab.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';

enum _Tab {
  receive(Icons.wifi),
  send(Icons.send),
  settings(Icons.settings);

  const _Tab(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case _Tab.receive:
        return t.receive.title;
      case _Tab.send:
        return t.send.title;
      case _Tab.settings:
        return t.settings.title;
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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final settings = ref.read(settingsProvider);
      await ref.read(serverProvider.notifier).startServer(
        alias: settings.alias,
        port: settings.port,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Translations.of(context); // rebuild on locale change
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ReceiveTab(),
            SendTab(),
            SettingsTab(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab.index,
        onDestinationSelected: (index) {
          setState(() {
            _currentTab = _Tab.values[index];
            _pageController.jumpToPage(_currentTab.index);
          });
        },
        destinations: _Tab.values.map((tab) {
          return NavigationDestination(icon: Icon(tab.icon), label: tab.label);
        }).toList(),
      ),
    );
  }
}
