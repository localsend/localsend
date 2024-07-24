import 'dart:io';

import 'package:common/model/stored_security_context.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// It always trust the self signed certificate as all requests happen in a local network.
/// The user only needs to trust the local IP address.
/// Thanks to TCP (HTTP uses TCP), IP spoofing is nearly impossible.
Dio createDio(Duration timeout, StoredSecurityContext securityContext, {Interceptor? interceptor}) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: timeout,
      sendTimeout: timeout,
    ),
  );

  // Allow any self signed certificate
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient(
        context: SecurityContext()
          ..usePrivateKeyBytes(securityContext.privateKey.codeUnits)
          ..useCertificateChainBytes(securityContext.certificate.codeUnits),
      );
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    },
  );

  // Add logging
  if (interceptor != null) {
    dio.interceptors.add(interceptor);
  }

  return dio;
}
