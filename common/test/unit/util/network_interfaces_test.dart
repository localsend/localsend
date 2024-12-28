import 'package:common/util/network_interfaces.dart';
import 'package:test/test.dart';

void main() {
  test('Should allow any IP', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: null, networkBlacklist: null, interface: [ip]);

    expect(ignored('1.2.3.4'), false);
    expect(ignored('1::1'), false);
  });

  test('Should only allow explicit whitelisted IP', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: ['2.2.2.3'], networkBlacklist: null, interface: [ip]);

    expect(ignored('2.2.2.2'), true);
    expect(ignored('2.2.2.3'), false);
  });

  test('Should allow wildcard whitelisted IP', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: ['3.3.3.*'], networkBlacklist: null, interface: [ip]);

    expect(ignored('3.3.3.1'), false);
    expect(ignored('3.3.3.2'), false);
    expect(ignored('3.3.4.3'), true);
  });

  test('Should allow wildcard whitelisted ipv6', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: ['1::1:*'], networkBlacklist: null, interface: [ip]);

    expect(ignored('1::1:1'), false);
    expect(ignored('1::1:2'), false);
    expect(ignored('1::2:1'), true);
  });

  test('Should ignore explicit blacklisted IP', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: null, networkBlacklist: ['3.3.3.4'], interface: [ip]);

    expect(ignored('3.3.3.3'), false);
    expect(ignored('3.3.3.4'), true);
  });

  test('Should ignore wildcard blacklisted IP', () {
    ignored(String ip) => isNetworkIgnoredRaw(networkWhitelist: null, networkBlacklist: ['3.3.3.*'], interface: [ip]);

    expect(ignored('3.3.3.3'), true);
    expect(ignored('3.3.3.4'), true);
    expect(ignored('4.3.3.3'), false);
  });
}
