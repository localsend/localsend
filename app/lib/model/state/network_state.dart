import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/local_interface_info.dart';

part 'network_state.mapper.dart';

@MappableClass()
class NetworkState with NetworkStateMappable {
  final List<LocalInterfaceInfo> localInterfaces;
  final bool initialized;

  const NetworkState({
    required this.localInterfaces,
    required this.initialized,
  });

  /// IP-only view kept for the existing call sites that don't care about the
  /// subnet mask (ranked-IP display, scan facade, send tab VM, etc.).
  List<String> get localIps => [for (final i in localInterfaces) i.ip];
}
