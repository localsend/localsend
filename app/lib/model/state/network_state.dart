import 'package:dart_mappable/dart_mappable.dart';

part 'network_state.mapper.dart';

@MappableClass()
class NetworkState with NetworkStateMappable {
  final List<String> localIps;
  final bool initialized;

  const NetworkState({
    required this.localIps,
    required this.initialized,
  });
}
