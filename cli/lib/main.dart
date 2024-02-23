import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as path;

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();

  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Prints usage information', defaultsTo: false);
  parser.addFlag('receive', abbr: 'r', negatable: false, help: 'Start a server to receive files', defaultsTo: false);
  parser.addFlag('send', abbr: 's', negatable: false, help: 'Setups a client to send files', defaultsTo: false);

  final results = parser.parse(arguments);

  if (results['help']) {
    _printUsage(parser);
    return;
  }

  final receive = results['receive'] as bool;
  final send = results['send'] as bool;

  if (receive) {
    print('Starting server...');
  } else if (send) {
    print('Setting up client...');
  } else {
    _printUsage(parser);
  }
}

void _printUsage(ArgParser parser) {
  print('The LocalSend CLI to send and receive files locally.');
  print('');
  print('Usage: ${path.basename(Platform.executable)} [options]');
  print('');
  print('Options:');
  print(parser.usage);
}
