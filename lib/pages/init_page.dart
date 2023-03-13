import 'package:flutter/material.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:routerino/routerino.dart';

/// This is just a proxy widget that pushes [HomePage] immediately.
/// This is needed because we want to change the root name from '/' to 'HomePage'.
class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.pushRootImmediately<void, HomePage>(() => const HomePage(initialTab: HomeTab.receive, appStart: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
