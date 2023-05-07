import 'dart:io';
import 'dart:math';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/pages/tabs/receive_tab.dart';
import 'package:localsend_app/pages/tabs/send_tab.dart';
import 'package:localsend_app/pages/tabs/settings_tab.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

enum HomeTab {
  receive(Icons.wifi),
  send(Icons.send),
  settings(Icons.settings);

  const HomeTab(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case HomeTab.receive:
        return t.receiveTab.title;
      case HomeTab.send:
        return t.sendTab.title;
      case HomeTab.settings:
        return t.settingsTab.title;
    }
  }
}

class HomePage extends ConsumerStatefulWidget {
  final HomeTab initialTab;

  /// It is important for the initializing step
  /// because the first init clears the cache
  final bool appStart;

  const HomePage({
    required this.initialTab,
    required this.appStart,
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PageController _pageController;
  HomeTab _currentTab = HomeTab.receive;

  bool _dragAndDropIndicator = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialTab.index);
    _currentTab = widget.initialTab;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await postInit(context, ref, widget.appStart, _goToPage);
    });
  }

  void _goToPage(int index) {
    setState(() {
      _currentTab = HomeTab.values[index];
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
      onDragDone: (event) async {
        if (event.files.length == 1 && Directory(event.files.first.path).existsSync()) {
          // user dropped a directory
          await ref.read(selectedSendingFilesProvider.notifier).addDirectory(event.files.first.path);
        } else {
          // user dropped one or more files
          await ref.read(selectedSendingFilesProvider.notifier).addFiles(
            files: event.files,
            converter: CrossFileConverters.convertXFile,
          );
        }
        _goToPage(HomeTab.send.index);
      },
      child: ResponsiveBuilder(
        builder: (sizingInformation) {
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  if (!sizingInformation.isMobile)
                    NavigationRail(
                      selectedIndex: _currentTab.index,
                      onDestinationSelected: _goToPage,
                      extended: sizingInformation.isDesktop,
                      backgroundColor: Theme.of(context).cardColorWithElevation,
                      leading: sizingInformation.isDesktop
                          ? Column(
                              children: const [
                                SizedBox(height: 20),
                                Text(
                                  'LocalSend',
                                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                              ],
                            )
                          : null,
                      destinations: HomeTab.values.map((tab) {
                        return NavigationRailDestination(
                          icon: Icon(tab.icon),
                          label: Text(tab.label),
                        );
                      }).toList(),
                    ),
                  Expanded(
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
                                Text(t.sendTab.placeItems, style: Theme.of(context).textTheme.titleLarge),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: sizingInformation.isMobile
                ? NavigationBar(
                    selectedIndex: sizingInformation.isMobile ? min(_currentTab.index, 2) : _currentTab.index,
                    onDestinationSelected: _goToPage,
                    destinations: HomeTab.values.map((tab) {
                      return NavigationDestination(icon: Icon(tab.icon), label: tab.label);
                    }).toList(),
                  )
                : null,
          );
        },
      ),
    );
  }
}
