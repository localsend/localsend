import 'package:localsend_app/util/transport/transports.dart';

/// Legacy re-exports for backward compatibility.
///
/// New code should import from `package:localsend_app/util/transport/transports.dart`
/// directly and use [WifiHotspotTransport] / [TransportManager] instead.

// Re-export the WifiHotspotTransport for backward compatibility
export 'package:localsend_app/util/transport/transports.dart' show WifiHotspotTransport;

// Legacy HotspotInfo — maps to TransportInfo for backward compat
typedef HotspotInfo = TransportInfo;
