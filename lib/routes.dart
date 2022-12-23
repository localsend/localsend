import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/pages/send_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<ReceiveRoute>(path: '/receive')
class ReceiveRoute extends GoRouteData {
  const ReceiveRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ReceivePage();
}

@TypedGoRoute<SendRoute>(path: '/send')
class SendRoute extends GoRouteData {
  const SendRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SendPage();
}
