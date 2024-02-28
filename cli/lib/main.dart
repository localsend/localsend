import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:cli/server/multicast_provider.dart';
import 'package:cli/server/server_provider.dart';
import 'package:common/common.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart' as path;

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();

  parser.addFlag('help',
      abbr: 'h',
      negatable: false,
      help: 'Prints usage information',
      defaultsTo: false);
  parser.addFlag('receive',
      abbr: 'r',
      negatable: false,
      help: 'Start a server to receive files',
      defaultsTo: false);
  parser.addFlag('send',
      abbr: 's',
      negatable: false,
      help: 'Setups a client to send files',
      defaultsTo: false);

  final results = parser.parse(arguments);

  if (results['help']) {
    _printUsage(parser);
    return;
  }

  final receive = results['receive'] as bool;
  final send = results['send'] as bool;

  if (receive) {
    defaultAlias='New alias';
    MapperContainer.globals.use(const FileDtoMapper());
    await serverService.startServerFromSettings();
    MulticastService mc = MulticastService(DeviceInfoResult(
        androidSdkInt: 0, deviceType: DeviceType.headless, deviceModel: 'headless'));
    Timer.periodic(Duration(seconds: 5), (Timer t) => mc.sendAnnouncement());
    await mc.startListener().forEach((element) {});
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
