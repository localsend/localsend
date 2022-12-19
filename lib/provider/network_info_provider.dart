import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/network_info.dart';
import 'package:network_info_plus/network_info_plus.dart' as plugin;

final networkInfoProvider = StateNotifierProvider<NetworkInfoNotifier, NetworkInfo?>((ref) => NetworkInfoNotifier());

class NetworkInfoNotifier extends StateNotifier<NetworkInfo?> {
  NetworkInfoNotifier() : super(null) {
    _init();
  }

  Future<void> _init() async {
    final info = plugin.NetworkInfo();
    String? ip;
    String? mask;
    try {
      ip = await info.getWifiIP();
      mask = await info.getWifiSubmask();
    } catch (e) {
      print(e);
    }
    state = NetworkInfo(
      localIp: ip,
      netMask: mask,
    );
  }
}
