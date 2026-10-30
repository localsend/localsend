import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;

/// The sender translates this failure before displaying it to the user.
class NoHttpChannelException implements Exception {
  const NoHttpChannelException();
}

/// Preserve discovery order and encryption level, including scoped hosts.
List<HttpChannel> prepareUploadChannels(Device target) {
  final channels = target.channels.whereType<HttpChannel>().where((channel) => channel.https == target.https).toSet().toList();
  if (channels.isEmpty && target.ip != null) {
    channels.add(HttpChannel(host: target.ip!, port: target.port, https: target.https));
  }
  return channels;
}

/// Only the prepare-upload Rust adapter's Unreachable branch proves that no HTTP
/// request was dispatched. Reqwest also includes ambiguous response errors.
Future<({HttpChannel channel, T response})> prepareUploadWithFallback<T>({
  required List<HttpChannel> channels,
  required int startIndex,
  required bool Function() isActive,
  required void Function(int) onAttempt,
  required Future<T> Function(HttpChannel) attempt,
}) async {
  for (var index = startIndex; index < channels.length; index++) {
    if (!isActive()) {
      throw StateError('Prepare-upload canceled');
    }
    onAttempt(index);
    try {
      final response = await attempt(channels[index]);
      return (channel: channels[index], response: response);
    } on rust_http.RsHttpClientError_Unreachable {
      if (!isActive() || index == channels.length - 1) {
        rethrow;
      }
    }
  }
  throw const NoHttpChannelException();
}
