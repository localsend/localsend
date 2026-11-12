import 'package:collection/collection.dart';

extension StringIpExt on String {
  String get visualId => split('.').last;

  String withPort(int port) {
    final isIpv6 = contains(':');
    return isIpv6 ? '[$this]:$port' : '$this:$port';
  }
}

class IpHelper {
  /// Sorts Ip addresses with first being the most likely primary local address
  /// Currently,
  /// - sorts ending with ".1" last
  /// - primary is always first
  static List<String> rankIpAddresses(List<String> addresses, String primary) {
    return addresses.sorted((a, b) {
      int scoreA = a == primary ? 10 : (a.endsWith('.1') ? 0 : 1);
      int scoreB = b == primary ? 10 : (b.endsWith('.1') ? 0 : 1);
      return scoreB.compareTo(scoreA);
    });
  }
}
