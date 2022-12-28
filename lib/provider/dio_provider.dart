import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides a dio having a specific timeout.
///
/// It always trust the self signed certificate as all requests happen in a local network.
/// The user only needs to trust the local IP address.
/// Thanks to TCP (HTTP uses TCP), IP spoofing is nearly impossible.
final dioProvider = Provider.family<Dio, int>((ref, timeout) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: timeout,
      sendTimeout: timeout,
    ),
  );
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      return true;
    };
    return client;
  };

  return dio;
});
