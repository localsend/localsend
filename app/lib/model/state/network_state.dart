import 'package:dart_mappable/dart_mappable.dart';

part 'network_state.mapper.dart';

@MappableClass()
class NetworkState with NetworkStateMappable {
  final List<String> localIps;
  final bool initialized;

  List<String> get localIpv4Ips => localIps.where((ip) => !ip.contains(':')).toList();

  const NetworkState({
    required this.localIps,
    required this.initialized,
  });
}
