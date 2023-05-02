import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/persistence/stored_security_context.dart';
import 'package:localsend_app/provider/logging/http_logs_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';

enum DioType {
  startupCheckAnotherInstance(100), // request to another possible instance (localhost)
  discovery(2000),
  longLiving(30 * 24 * 60 * 60 * 1000); // assuming someone sends a large file over several days

  const DioType(this.timeout);

  final int timeout;
}

/// Provides a dio having a specific timeout.
final dioProvider = Provider.family<Dio, DioType>((ref, type) {
  final securityContext = ref.watch(securityProvider);
  return createDio(type, securityContext, type == DioType.longLiving ? ref : null);
});

/// It always trust the self signed certificate as all requests happen in a local network.
/// The user only needs to trust the local IP address.
/// Thanks to TCP (HTTP uses TCP), IP spoofing is nearly impossible.
Dio createDio(DioType type, StoredSecurityContext securityContext, [Ref? ref]) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: type.timeout),
      sendTimeout: Duration(milliseconds: type.timeout),
    ),
  );

  // Allow any self signed certificate
  dio.httpClientAdapter = IOHttpClientAdapter(
    onHttpClientCreate: (_) {
      final client = HttpClient(context: SecurityContext()
        ..usePrivateKeyBytes(securityContext.privateKey.codeUnits)
        ..useCertificateChainBytes(securityContext.certificate.codeUnits),
      );
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    },
  );

  // Add logging
  if (ref != null) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      requestBody: true,
      request: false,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (log) {
        ref.read(httpLogsProvider.notifier).addLog(log.toString());
      },
    ));
  }

  return dio;
}
