import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:localsend_app/model/persistence/stored_security_context.dart';

/// Generates a random [SecurityContextResult].
StoredSecurityContext generateSecurityContext([AsymmetricKeyPair? keyPair]) {
  keyPair ??= CryptoUtils.generateRSAKeyPair();
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
  final certificate = X509Utils.generateSelfSignedCertificate(keyPair.privateKey, csr, 365 * 10);
  final hash = calculateHashOfCertificate(certificate);

  return StoredSecurityContext(
    privateKey: CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(privateKey),
    publicKey: CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey),
    certificate: certificate,
    certificateHash: hash,
  );
}

/// Calculates the hash of a certificate.
String calculateHashOfCertificate(String certificate) {
  // Convert PEM to DER
  final pemContent = certificate.replaceAll('\r\n', '\n').split('\n').where((line) => line.isNotEmpty && !line.startsWith('---')).join();
  final der = base64Decode(pemContent);

  // Calculate hash
  return CryptoUtils.getHash(
    Uint8List.fromList(der),
    algorithmName: 'SHA-256',
  );
}
