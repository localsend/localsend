import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_state.mapper.dart';

enum IsolateType {
  /// The multicast isolate is responsible for sending and receiving multicast messages.
  /// There is only one multicast isolate per device.
  multicast,

  /// The isolate is responsible for discovering other devices on the network by
  /// sending HTTP requests to the other devices.
  /// There is only one discovery isolate per device.
  httpDiscovery,

  /// The isolate where the HTTP server is running.
  /// There is as many isolates as there are CPU cores.
  httpServer,

  /// The isolate where data is sent to the server.
  /// There is as many isolates as there are CPU cores.
  httpClient,
}

@MappableClass()
class IsolateState with IsolateStateMappable {
  final int? isolateId;
  final IsolateType? isolateType;

  const IsolateState({
    required this.isolateId,
    required this.isolateType,
  });
}
