import 'package:freezed_annotation/freezed_annotation.dart';

part 'stored_security_context.freezed.dart';
part 'stored_security_context.g.dart';

@freezed
class StoredSecurityContext with _$StoredSecurityContext {
  const factory StoredSecurityContext({
    required String privateKey,
    required String publicKey,
    required String certificate,
    required String certificateHash,
  }) = _StoredSecurityContext;

  factory StoredSecurityContext.fromJson(Map<String, Object?> json) => _$StoredSecurityContextFromJson(json);
}
