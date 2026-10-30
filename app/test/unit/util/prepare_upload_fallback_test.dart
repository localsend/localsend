import 'package:localsend_app/util/prepare_upload_fallback.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;
import 'package:test/test.dart';

const v6 = HttpChannel(host: 'fe80::1%3', port: 53317, https: true);
const v4 = HttpChannel(host: '192.168.0.1', port: 53318, https: true);
const alternateV4 = HttpChannel(host: '192.168.0.2', port: 53319, https: true);

void main() {
  test('missing channels have a domain error instead of raw StateError text', () async {
    await expectLater(
      prepareUploadWithFallback<int>(
        channels: [],
        startIndex: 0,
        isActive: () => true,
        onAttempt: (_) {},
        attempt: (_) async => 204,
      ),
      throwsA(isA<NoHttpChannelException>()),
    );
  });
  test('preserves scoped candidates, removes duplicates and prevents TLS downgrade', () {
    final target = Device.empty.copyWith(
      ip: v6.host,
      port: v6.port,
      https: true,
      channels: [
        v6,
        const HttpChannel(host: '192.168.0.2', port: 53317, https: false),
        v6,
        v4,
      ],
    );
    expect(prepareUploadChannels(target), [v6, v4]);
    expect(prepareUploadChannels(target.copyWith(channels: [])), [v6]);
    expect(prepareUploadChannels(Device.empty), isEmpty);
  });

  test('connection failures advance in order to the third endpoint', () async {
    final attempted = <HttpChannel>[];
    final selected = <int>[];
    final result = await prepareUploadWithFallback(
      channels: [v6, v4, alternateV4],
      startIndex: 0,
      isActive: () => true,
      onAttempt: selected.add,
      attempt: (channel) async {
        attempted.add(channel);
        if (channel != alternateV4) {
          throw const rust_http.RsHttpClientError.unreachable('Network unreachable');
        }
        return 204;
      },
    );
    expect(attempted, [v6, v4, alternateV4]);
    expect(selected, [0, 1, 2]);
    expect(result.channel, alternateV4);
    expect(result.response, 204);
  });

  for (final error in <Object>[
    for (final status in [401, 403, 409, 429]) rust_http.RsHttpClientError.statusCode(status: status),
    const rust_http.RsHttpClientError.other('Upload cancelled'),
    const rust_http.RsHttpClientError.io('Local file IO failure'),
    const rust_http.RsHttpClientError.json('Invalid response'),
    const rust_http.RsHttpClientError.reqwest('Response disconnected after dispatch'),
    StateError('unknown'),
  ]) {
    test('does not change endpoints for $error', () async {
      var attempts = 0;
      await expectLater(
        prepareUploadWithFallback<int>(
          channels: [v6, v4],
          startIndex: 0,
          isActive: () => true,
          onAttempt: (_) {},
          attempt: (_) async {
            attempts++;
            throw error;
          },
        ),
        throwsA(same(error)),
      );
      expect(attempts, 1);
    });
  }

  test('does not retry after cancellation between attempts', () async {
    var active = true;
    var attempts = 0;
    const error = rust_http.RsHttpClientError.unreachable('Connection refused');
    await expectLater(
      prepareUploadWithFallback<int>(
        channels: [v6, v4],
        startIndex: 0,
        isActive: () => active,
        onAttempt: (_) {},
        attempt: (_) async {
          attempts++;
          active = false;
          throw error;
        },
      ),
      throwsA(same(error)),
    );
    expect(attempts, 1);
  });

  test('PIN retry starts at the selected channel', () async {
    final attempted = <HttpChannel>[];
    await prepareUploadWithFallback<int>(
      channels: [v6, v4],
      startIndex: 1,
      isActive: () => true,
      onAttempt: (_) {},
      attempt: (channel) async {
        attempted.add(channel);
        return 204;
      },
    );
    expect(attempted, [v4]);
  });

  test('last connection error is preserved', () async {
    const error = rust_http.RsHttpClientError.unreachable('Last endpoint failed');
    await expectLater(
      prepareUploadWithFallback<int>(
        channels: [v6, v4],
        startIndex: 0,
        isActive: () => true,
        onAttempt: (_) {},
        attempt: (_) async => throw error,
      ),
      throwsA(same(error)),
    );
  });

  test('already canceled session sends no request', () async {
    var attempts = 0;
    await expectLater(
      prepareUploadWithFallback<int>(
        channels: [v6, v4],
        startIndex: 0,
        isActive: () => false,
        onAttempt: (_) {},
        attempt: (_) async => ++attempts,
      ),
      throwsStateError,
    );
    expect(attempts, 0);
  });
}
