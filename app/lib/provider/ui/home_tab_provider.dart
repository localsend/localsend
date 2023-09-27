import 'package:localsend_app/pages/home_page.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';

/// This provider is used so that tabs know if they are currently visible.
/// The [HomePage] is responsible for setting the current tab.
final homeTabProvider = ReduxProvider<HomeTabNotifier, HomeTab>((ref) => HomeTabNotifier());

class HomeTabNotifier extends ReduxNotifier<HomeTab> {
  @override
  HomeTab init() => HomeTab.receive;
}

class SetHomeTabAction extends ReduxAction<HomeTabNotifier, HomeTab> {
  final HomeTab tab;

  SetHomeTabAction(this.tab);

  @override
  HomeTab reduce() => tab;
}
