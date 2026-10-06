/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'src/build_tool.dart' as build_tool;

Future<void> runMain(List<String> args) async {
  return build_tool.runMain(args);
}
