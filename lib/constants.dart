/// The protocol version.
///
/// Version table:
/// Protocols | App (Official implementation)
/// ----------|------------------------------
/// 1.0       | 1.0.0 - 1.8.0
/// 1.0, 2.0  | 1.9.0
const protocolVersion = '2.0';

/// Assumed protocol version of peers for first handshake.
/// Generally this should be slightly lower than the current protocol version.
const peerProtocolVersion = '1.0';

/// The protocol version when no version is specified.
/// Prior v2, the protocol version was not specified.
const fallbackProtocolVersion = '1.0';

/// The default http server port and
/// and multicast port.
const defaultPort = 53317;

/// The default multicast group should be 224.0.0.0/24
/// because on some Android devices this is the only IP range
/// that can receive UDP multicast messages.
const defaultMulticastGroup = '224.0.0.167';
