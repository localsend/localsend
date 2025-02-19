import 'dart:async';

import 'package:collection/collection.dart';
import 'package:common/util/network_interfaces.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/model/state/network_state.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:network_info_plus/network_info_plus.dart' as plugin;
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('NetworkInfo');

final localIpProvider = ReduxProvider<LocalIpService, NetworkState>((ref) {
  return LocalIpService(
    ref.notifier(settingsProvider),
  );
});

StreamSubscription? _subscription;

class LocalIpService extends ReduxNotifier<NetworkState> {
  final SettingsService _settingsService;

  LocalIpService(this._settingsService);

  @override
  NetworkState init() {
    return const NetworkState(
      localIps: [],
      initialized: false,
    );
  }

  @override
  get initialAction => InitLocalIpAction();
}

/// Fetches the local IP address and registers a listener to update the IP address
class InitLocalIpAction extends ReduxAction<LocalIpService, NetworkState> {
  @override
  NetworkState reduce() {
    if (!kIsWeb) {
      // ignore: discarded_futures
      _subscription?.cancel();

      if (checkPlatform([TargetPlatform.windows])) {
        // https://github.com/localsend/localsend/issues/12
        // https://github.com/localsend/localsend/issues/78
      } else {
        _subscription = Connectivity().onConnectivityChanged.listen((_) async {
          await dispatchAsync(FetchLocalIpAction());
        });
      }
    }

    return state;
  }

  @override
  void after() {
    // ignore: discarded_futures
    dispatchAsync(FetchLocalIpAction());
  }
}

class FetchLocalIpAction extends AsyncReduxAction<LocalIpService, NetworkState> {
  @override
  Future<NetworkState> reduce() async {
    return NetworkState(
      localIps: await _getIp(
        whitelist: notifier._settingsService.state.networkWhitelist,
        blacklist: notifier._settingsService.state.networkBlacklist,
      ),
      initialized: true,
    );
  }
}

Future<List<String>> _getIp({
  required List<String>? whitelist,
  required List<String>? blacklist,
}) async {
  final info = plugin.NetworkInfo();
  String? ip;
  try {
    ip = await info.getWifiIP();
  } catch (e) {
    _logger.warning('Failed to get wifi IP', e);
  }

  final nativeResult = (await getNetworkInterfaces(
    whitelist: whitelist,
    blacklist: blacklist,
  ))
      .map((interface) => interface.addresses.map((a) => a.address).toList())
      .expand((ip) => ip)
      .where((ip) => !ip.contains(':')) // ignore IPv6 for now
      .toList();

  final addresses = rankIpAddresses(nativeResult, ip);
  _logger.info('Network state: $addresses');
  return addresses;
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
