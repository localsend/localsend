import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/tabs/receive_tab.dart';
import 'package:localsend_app/pages/tabs/send_tab.dart';
import 'package:localsend_app/pages/tabs/settings_tab.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  _Tab _currentTab = _Tab.receive;

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
