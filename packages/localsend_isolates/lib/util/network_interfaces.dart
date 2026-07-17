import 'dart:io';

import 'package:logging/logging.dart';

final _logger = Logger('NetworkInterface');

/// Returns a list of network interfaces respecting the whitelist and blacklist.
Future<List<NetworkInterface>> getNetworkInterfaces({
  required List<String>? whitelist,
  required List<String>? blacklist,
}) async {
  final result = <NetworkInterface>[];
  final digestedWhitelist = whitelist?.map(buildRegExpFromIpFilter).toList();
  final digestedBlacklist = blacklist?.map(buildRegExpFromIpFilter).toList();

  for (final interface in await NetworkInterface.list()) {
    if (isNetworkIgnored(
      networkWhitelist: digestedWhitelist,
      networkBlacklist: digestedBlacklist,
      interface: interface.addresses.map((a) => a.address).toList(),
    )) {
      _logger.info('Ignore network interface ${interface.name} (${interface.addresses.map((a) => a.address).toList()})');
      continue;
    }
    result.add(interface);
  }

  return result;
}

/// Returns true if the given IP should be ignored.
/// - When the IP is not in the whitelist (if the whitelist is not null)
/// - When the IP is in the blacklist (if the blacklist is not null)
bool isNetworkIgnoredRaw({
  required List<String>? networkWhitelist,
  required List<String>? networkBlacklist,
  required List<String> interface,
}) {
  return isNetworkIgnored(
    networkWhitelist: networkWhitelist?.map(buildRegExpFromIpFilter).toList(),
    networkBlacklist: networkBlacklist?.map(buildRegExpFromIpFilter).toList(),
    interface: interface,
  );
}

/// Builds a regular expression from the given IP.
/// - '123.123.124.*' -> '^123\.123\.124\.[^.]+$'
/// - '1::1:*:3' -> '^1::1:[^.]+:3$'
RegExp buildRegExpFromIpFilter(String ip) {
  return RegExp('^${ip.replaceAll('.', '\\.').replaceAll('*', '[^.]+')}\$');
}

/// Returns true if the given IP should be ignored.
/// - When the IP is not in the whitelist (if the whitelist is not null)
/// - When the IP is in the blacklist (if the blacklist is not null)
bool isNetworkIgnored({
  required List<RegExp>? networkWhitelist,
  required List<RegExp>? networkBlacklist,
  required List<String> interface,
}) {
  if (networkWhitelist != null && !interface.any((a) => networkWhitelist.any((w) => w.hasMatch(a)))) {
    return true;
  }
  if (networkBlacklist != null && interface.any((a) => networkBlacklist.any((b) => b.hasMatch(a)))) {
    return true;
  }
  return false;
}
