class IceServerConfig {
  final List<String> urls;
  final String? username;
  final String? credential;

  const IceServerConfig({
    required this.urls,
    required this.username,
    required this.credential,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IceServerConfig &&
          runtimeType == other.runtimeType &&
          _listEquals(urls, other.urls) &&
          username == other.username &&
          credential == other.credential;

  @override
  int get hashCode => Object.hash(Object.hashAll(urls), username, credential);
}

List<IceServerConfig> buildIceServers({
  required List<String> urls,
  required String? turnUsername,
  required String? turnCredential,
}) {
  final username = turnUsername?.trim();
  final credential = turnCredential?.trim();
  final hasTurnCredentials = username != null && username.isNotEmpty && credential != null && credential.isNotEmpty;

  return urls
      .map((url) => url.trim())
      .where((url) => url.isNotEmpty)
      .map(
        (url) => IceServerConfig(
          urls: [url],
          username: hasTurnCredentials && url.startsWith('turn:') ? username : null,
          credential: hasTurnCredentials && url.startsWith('turn:') ? credential : null,
        ),
      )
      .toList(growable: false);
}

bool _listEquals(List<String> a, List<String> b) {
  if (a.length != b.length) {
    return false;
  }
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}
