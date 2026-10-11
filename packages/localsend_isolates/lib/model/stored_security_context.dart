import 'package:dart_mappable/dart_mappable.dart';

part 'stored_security_context.mapper.dart';

@MappableClass()
class StoredSecurityContext with StoredSecurityContextMappable {
  final String privateKey;
  final String publicKey;
  final String certificate;
  final String certificateHash;

  const StoredSecurityContext({
    required this.privateKey,
    required this.publicKey,
    required this.certificate,
    required this.certificateHash,
  });

  static const fromJson = StoredSecurityContextMapper.fromJson;

  @override
  String toString() {
    return 'StoredSecurityContext(<privateKey>, <publicKey>, <certificate>, <certificateHash>)';
  }
}
