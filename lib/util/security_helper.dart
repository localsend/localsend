import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:localsend_app/model/persistence/stored_security_context.dart';

/// Generates a random [SecurityContextResult].
StoredSecurityContext generateSecurityContext() {
  final keyPair = CryptoUtils.generateRSAKeyPair();
  final privateKey = keyPair.privateKey as RSAPrivateKey;
  final publicKey = keyPair.publicKey as RSAPublicKey;
  final dn = {
    'CN': 'LocalSend User',
    'O': '',
    'OU': '',
    'L': '',
    'S': '',
    'C': '',
  };
  final csr = X509Utils.generateRsaCsrPem(dn, privateKey, publicKey);
  final certificate = X509Utils.generateSelfSignedCertificate(keyPair.privateKey, csr, 1);
  return StoredSecurityContext(
    privateKey: CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(privateKey),
    publicKey: CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey),
    certificate: certificate,
    certificateHash: CryptoUtils.getHash(Uint8List.fromList(certificate.replaceAll('\r\n', '\n').codeUnits), algorithmName: 'SHA-256'),
  );
}
