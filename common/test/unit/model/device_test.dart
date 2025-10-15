import 'package:common/model/device.dart';
import 'package:test/test.dart';

void main() {
  test('Should not have duplicate DiscoveryMethod', () {
    final set = <DiscoveryMethod>{};

    set.add(MulticastDiscovery());

    expect(set, hasLength(1));

    set.add(MulticastDiscovery());

    expect(set, hasLength(1));

    set.add(HttpDiscovery(ip: 'a'));

    expect(set, hasLength(2));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));

    set.add(HttpDiscovery(ip: 'a'));

    expect(set, hasLength(2));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));

    set.add(HttpDiscovery(ip: 'b'));

    expect(set, hasLength(3));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));
    expect(set, contains(HttpDiscovery(ip: 'b')));

    set.add(SignalingDiscovery(signalingServer: 'sa'));

    expect(set, hasLength(4));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));
    expect(set, contains(HttpDiscovery(ip: 'b')));
    expect(set, contains(SignalingDiscovery(signalingServer: 'sa')));

    set.add(SignalingDiscovery(signalingServer: 'sa'));

    expect(set, hasLength(4));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));
    expect(set, contains(HttpDiscovery(ip: 'b')));
    expect(set, contains(SignalingDiscovery(signalingServer: 'sa')));

    set.add(SignalingDiscovery(signalingServer: 'sb'));

    expect(set, hasLength(5));
    expect(set, contains(MulticastDiscovery()));
    expect(set, contains(HttpDiscovery(ip: 'a')));
    expect(set, contains(HttpDiscovery(ip: 'b')));
    expect(set, contains(SignalingDiscovery(signalingServer: 'sa')));
    expect(set, contains(SignalingDiscovery(signalingServer: 'sb')));
  });
}
