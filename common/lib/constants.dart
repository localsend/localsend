/// The protocol version.
///
/// Version table:
/// Protocols | App (Official implementation)
/// ----------|------------------------------
/// 1.0       | 1.0.0 - 1.8.0
/// 1.0, 2.0  | 1.9.0 - 1.14.0
/// 1.0, 2.1  | 1.15.0 - 1.17.0
/// 2.1       | 1.18.0
const protocolVersion = '2.1';

/// Assumed protocol version of peers for first handshake.
/// Generally this should be slightly lower than the current protocol version.
const peerProtocolVersion = '1.0';

/// The protocol version when no version is specified.
/// Prior v2, the protocol version was not specified.
const fallbackProtocolVersion = '1.0';

/// The default http server port and
/// and multicast port.
const defaultPort = 53317;

/// The default discovery timeout in milliseconds.
/// This is the time the discovery server waits for responses.
/// If no response is received within this time, the target server is unavailable.
const defaultDiscoveryTimeout = 500;

/// The default multicast group should be 224.0.0.0/24
/// because on some Android devices this is the only IP range
/// that can receive UDP multicast messages.
const defaultMulticastGroup = '224.0.0.167';

/// Whether LocalSend should try bounded cross-subnet HTTP discovery after
/// the local subnet scan could not find any devices.
const defaultCrossSubnetScan = true;

/// Number of neighbouring /24 subnets scanned on each side of the current one.
///
/// Example: 192.168.73.15 with depth 4 scans 192.168.69.0/24 through
/// 192.168.77.0/24, excluding the current 192.168.73.0/24 because the legacy
/// local subnet scan already covers it.
const defaultCrossSubnetScanDepth = 4;

/// Upper bound for neighbouring /24 subnet expansion.
const maxCrossSubnetScanDepth = 16;

/// Hard limit for generated cross-subnet scan targets.
const maxCrossSubnetScanHosts = 4096;

/// Maximum number of endpoint addresses remembered for a known peer.
const maxKnownPeerEndpoints = 8;
