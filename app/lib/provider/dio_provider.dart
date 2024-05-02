import 'dart:io';

import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:localsend_app/provider/logging/http_logs_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class DioCollection {
  final Dio discovery;
  final Dio longLiving;

  DioCollection({
    required this.discovery,
    required this.longLiving,
  });
}

/// Provides a dio having a specific timeout.
final dioProvider = ViewProvider((ref) {
  final securityContext = ref.watch(securityProvider);
  final discoveryTimeout = ref.watch(settingsProvider.select((state) => state.discoveryTimeout));
  return DioCollection(
    discovery: createDio(Duration(milliseconds: discoveryTimeout), securityContext, null),
    longLiving: createDio(const Duration(days: 30), securityContext, ref),
  );
});

/// It always trust the self signed certificate as all requests happen in a local network.
/// The user only needs to trust the local IP address.
/// Thanks to TCP (HTTP uses TCP), IP spoofing is nearly impossible.
Dio createDio(Duration timeout, StoredSecurityContext securityContext, [Ref? ref]) {
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
  if (ref != null) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      requestBody: true,
      request: false,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (log) {
        ref.notifier(httpLogsProvider).addLog(log.toString());
      },
    ));
  }

  return dio;
}
