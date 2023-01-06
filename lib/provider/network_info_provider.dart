import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/network_info.dart';
import 'package:network_info_plus/network_info_plus.dart' as plugin;

final networkInfoProvider = StateNotifierProvider<NetworkInfoNotifier, NetworkInfo?>((ref) => NetworkInfoNotifier());

StreamSubscription<ConnectivityResult>? _subscription;

class NetworkInfoNotifier extends StateNotifier<NetworkInfo?> {
  NetworkInfoNotifier() : super(null) {
    init();
  }

  Future<void> init() async {
    if (!kIsWeb) {
      _subscription?.cancel();
      _subscription = Connectivity().onConnectivityChanged.listen((_) async  {
        state = await _getInfo();
      });
    }
    state = await _getInfo();
  }

  Future<NetworkInfo> _getInfo() async {
    final info = plugin.NetworkInfo();
    String? ip;
    String? mask;
    try {
      ip = await info.getWifiIP();
      mask = await info.getWifiSubmask();
    } catch (e) {
      print(e);
    }

    List<String> nativeResult = [];
    if (!kIsWeb) {
      try {
        // fallback with dart:io NetworkInterface
        final result = (await NetworkInterface.list()).map((networkInterface) => networkInterface.addresses).expand((ip) => ip);
        nativeResult = result.where((ip) => ip.type == InternetAddressType.IPv4).map((address) => address.address).toList();
      } catch (e, st) {
        print(e);
        print(st);
      }
    }

    print('New network state: $ip ($mask)');

    return NetworkInfo(
      localIps: rankIpAddresses(nativeResult, ip),
      netMask: mask,
    );
  }
}

List<String> rankIpAddresses(List<String> nativeResult, String? thirdPartyResult) {
  if (thirdPartyResult == null) {
    // only take the list
    return nativeResult._rankIpAddresses(null);
  } else if (nativeResult.isEmpty) {
    // only take the first IP from third party library
    return [thirdPartyResult];
  } else if (thirdPartyResult.endsWith('.1')) {
    // merge
    return {thirdPartyResult, ...nativeResult}.toList()._rankIpAddresses(null);
  } else {
    // merge but prefer result from third party library
    return {thirdPartyResult, ...nativeResult}.toList()._rankIpAddresses(thirdPartyResult);
  }
}

/// Sorts Ip addresses with first being the most likely primary local address
/// Currently,
/// - sorts ending with ".1" last
/// - primary is always first
extension ListIpExt on List<String> {
  List<String> _rankIpAddresses(String? primary) {
    return sorted((a, b) {
      int scoreA = a == primary ? 10 : (a.endsWith('.1') ? 0 : 1);
      int scoreB = b == primary ? 10 : (b.endsWith('.1') ? 0 : 1);
      return scoreB.compareTo(scoreA);
    });
  }
}