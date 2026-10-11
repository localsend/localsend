import 'package:localsend_isolates/model/stored_security_context.dart';
import 'package:localsend_isolates/rust/api/crypto.dart' as rust;

/// Generates a random [StoredSecurityContext].
Future<StoredSecurityContext> generateSecurityContext() async {
  final result = await rust.generateSecurityContext();
  return StoredSecurityContext(
    privateKey: result.privateKey,
    publicKey: result.publicKey,
    certificate: result.certificate,
    certificateHash: result.certificateHash,
  );
}

/// Verifies a certificate with a public key.
/// Throws an exception if the certificate is invalid.
Future<void> verifyCertificate({
  required String cert,
  required String publicKey,
}) async {
  await rust.verifyCert(cert: cert, publicKey: publicKey);
}
