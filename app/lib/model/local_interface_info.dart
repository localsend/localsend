import 'package:dart_mappable/dart_mappable.dart';

part 'local_interface_info.mapper.dart';

/// An IPv4 address attached to a local interface and the CIDR prefix length
/// of its subnet (e.g. 24 for `/24`, 21 for `/21`). Sourced from the Rust
/// `if-addrs` binding so every interface with an IP has a real mask, not
/// just the active WiFi adapter.
@MappableClass()
class LocalInterfaceInfo with LocalInterfaceInfoMappable {
  final String ip;
  final int prefixLength;

  const LocalInterfaceInfo({required this.ip, required this.prefixLength});
}
