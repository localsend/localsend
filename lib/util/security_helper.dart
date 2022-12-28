import 'package:basic_utils/basic_utils.dart';

/// Holds all necessary data for deploying a self signed HTTPS server
class SecurityContextResult {
  /// Private key - equivalent to privkey.pem
  final String privateKey; // privkey.pem

  /// Public key - equivalent to cert.pem
  final String publicKey;

  /// Certificate - equivalent to chain.pem (but only containing the leaf certificate)
  final String certificate;

  SecurityContextResult({
    required this.privateKey,
    required this.publicKey,
    required this.certificate,
  });
}

/// Generates a random [SecurityContextResult].
SecurityContextResult generateSecurityContext() {
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
  return SecurityContextResult(
    privateKey: CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(privateKey),
    publicKey: CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey),
    certificate: X509Utils.generateSelfSignedCertificate(keyPair.privateKey, csr, 1),
  );
}
