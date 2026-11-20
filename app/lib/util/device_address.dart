/// Splits a host and optional port without validating the destination.
/// Unparseable input is passed unchanged to the request layer for error handling.
({String host, int port}) parseDeviceAddress(String input, {required int defaultPort}) {
  final value = input.trim();
  final fallback = (host: value, port: defaultPort);
  final bracketed = value.startsWith('[');
  final colon = value.indexOf(':');

  // Bare IPv6 (including its scope) and hosts without a port remain unchanged.
  if (!bracketed && (colon == -1 || colon != value.lastIndexOf(':'))) {
    return fallback;
  }

  try {
    // User input uses raw scope delimiters; Uri uses the URI-encoded `%25`.
    final uri = Uri.parse('//${bracketed ? value.replaceAll('%', '%25') : value}');
    // Do not silently discard URL components or a missing port.
    if (uri.path.isNotEmpty || uri.hasQuery || uri.hasFragment || uri.authority.contains('@') || value.endsWith(':')) {
      return fallback;
    }
    final port = bracketed && value.endsWith(']') ? defaultPort : uri.port;
    // The Rust interface takes u16. Leave unrepresentable ports to the original
    // request path instead of passing a value that could be truncated by the bridge.
    if (port < 0 || port > 65535) {
      return fallback;
    }
    return (host: bracketed ? uri.host.replaceFirst('%25', '%') : uri.host, port: port);
  } on FormatException {
    return fallback;
  }
}
