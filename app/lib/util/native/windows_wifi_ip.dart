import 'package:network_info_plus/network_info_plus.dart';

Future<String?> readWindowsWifiIp() => NetworkInfoPlusWindowsPlugin().getWifiIP();
