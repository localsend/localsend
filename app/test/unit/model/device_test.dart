import 'package:localsend_isolates/model/device.dart';
import 'package:test/test.dart';

void main() {
  test('Should not have duplicate DeviceChannel', () {
    final set = <DeviceChannel>{};

    set.add(HttpChannel(host: 'a', port: 1, https: true));

    expect(set, hasLength(1));

    set.add(HttpChannel(host: 'a', port: 1, https: true));

    expect(set, hasLength(1));

    set.add(HttpChannel(host: 'a', port: 2, https: true));

    expect(set, hasLength(2));
    expect(set, contains(HttpChannel(host: 'a', port: 1, https: true)));
    expect(set, contains(HttpChannel(host: 'a', port: 2, https: true)));

    set.add(HttpChannel(host: 'b', port: 1, https: true));

    expect(set, hasLength(3));
    expect(set, contains(HttpChannel(host: 'a', port: 1, https: true)));
    expect(set, contains(HttpChannel(host: 'a', port: 2, https: true)));
    expect(set, contains(HttpChannel(host: 'b', port: 1, https: true)));

    set.add(SignalingChannel(signalingServer: 'sa'));

    expect(set, hasLength(4));
    expect(set, contains(SignalingChannel(signalingServer: 'sa')));

    set.add(SignalingChannel(signalingServer: 'sa'));

    expect(set, hasLength(4));
    expect(set, contains(SignalingChannel(signalingServer: 'sa')));

    set.add(SignalingChannel(signalingServer: 'sb'));

    expect(set, hasLength(5));
    expect(set, contains(SignalingChannel(signalingServer: 'sa')));
    expect(set, contains(SignalingChannel(signalingServer: 'sb')));
  });
}
