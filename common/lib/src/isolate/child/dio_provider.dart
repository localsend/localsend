import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:common/util/dio.dart';
import 'package:dio/dio.dart';
import 'package:refena/refena.dart';

class DioCollection {
  final Dio discovery;
  final Dio longLiving;

  DioCollection({
    required this.discovery,
    required this.longLiving,
  });
}

/// Provides a dio having a specific timeout.
/// Copied from app/lib/provider/dio_provider.dart
final dioProvider = ViewProvider((ref) {
  final (securityContext, discoveryTimeout) = ref.watch(syncProvider.select((state) => (state.securityContext, state.discoveryTimeout)));
  return DioCollection(
    discovery: createDio(Duration(milliseconds: discoveryTimeout), securityContext),
    longLiving: createDio(const Duration(days: 30), securityContext),
  );
});
