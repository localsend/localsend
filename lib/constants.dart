/// The default http server port and
/// and multicast port.
const defaultPort = 53317;

/// The default multicast group should be 224.0.0.0/24
/// because on some Android devices this is the only IP range
/// that can receive UDP multicast messages.
const defaultMulticastGroup = '224.0.0.167';
