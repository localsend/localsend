import 'dart:io';

import 'package:cli/server/security_service.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioCollection {
  final Dio startupCheckAnotherInstance;
  final Dio discovery;
  final Dio longLiving;

  DioCollection({
    required this.startupCheckAnotherInstance,
    required this.discovery,
    required this.longLiving,
  });
}

/// Provides a dio having a specific timeout.

var dioCollection = DioCollection(
  startupCheckAnotherInstance:
      createDio(const Duration(milliseconds: 100), securityContext),
  discovery: createDio(const Duration(seconds: 2), securityContext),
  longLiving: createDio(const Duration(days: 30), securityContext),
);

/// It always trust the self signed certificate as all requests happen in a local network.
/// The user only needs to trust the local IP address.
/// Thanks to TCP (HTTP uses TCP), IP spoofing is nearly impossible.
Dio createDio(Duration timeout, StoredSecurityContext securityContext) {
  final dio = Dio(

    BaseOptions(


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

  dio.interceptors.add(LogInterceptor(
    requestHeader: false,
    requestBody: true,
    request: false,
    responseHeader: false,
    responseBody: true,
    error: true,
    logPrint: (log) {
      print(log.toString());
    },
  ));

  return dio;
}
