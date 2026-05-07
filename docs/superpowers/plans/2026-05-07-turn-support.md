# TURN Support Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add manually configured TURN credentials so cross-public-network WebRTC transfers can relay through coturn when STUN-only traversal fails.

**Architecture:** Replace the current `List<String> stunServers` plumbing with a structured ICE server model containing `urls`, `username`, and `credential`. Keep the existing ICE URL text field for STUN/TURN URLs, add TURN username/password fields, and convert settings into structured ICE servers at the Flutter boundary before calling Rust. Rust bridge forwards the structure to core WebRTC, where it becomes `RTCIceServer`.

**Tech Stack:** Flutter/Dart, Refena providers, SharedPreferences persistence, flutter_rust_bridge, Rust `webrtc` crate, coturn-compatible ICE URLs.

---

## File Structure

- `app/lib/model/webrtc/ice_server_config.dart`: New Dart value class for app-side ICE server configuration and a `buildIceServers` helper.
- `app/test/unit/model/webrtc/ice_server_config_test.dart`: Unit tests for STUN/TURN credential composition.
- `app/lib/provider/persistence_provider.dart`: Store TURN username/password next to existing ICE URLs.
- `app/lib/model/state/settings_state.dart`: Add TURN username/password to settings state.
- `app/lib/provider/settings_provider.dart`: Expose getters/setters for TURN username/password.
- `app/lib/pages/tabs/settings_tab_vm.dart`: Add text controllers for TURN username/password.
- `app/lib/pages/tabs/settings_tab_controller.dart`: Initialize and dispose new controllers.
- `app/lib/pages/tabs/settings_tab.dart`: Add settings fields under Remote discovery.
- `app/lib/provider/network/webrtc/signaling_provider.dart`: Replace `stunServers` state with `iceServers` built from settings.
- `app/lib/provider/network/send_provider.dart`: Pass structured `iceServers` into `sendOffer`.
- `app/lib/provider/network/webrtc/webrtc_receiver.dart`: Pass structured `iceServers` into `acceptOffer`.
- `app/rust/src/api/webrtc.rs`: Add bridge-safe `IceServerConfig` Rust struct and change offer APIs.
- `core/src/webrtc/webrtc.rs`: Add core `IceServerConfig` and build `RTCConfiguration.ice_servers` with credentials.
- `core/src/main.rs`: Update local WebRTC test helpers to use structured ICE config.
- Generated files: Run `dart run build_runner build --delete-conflicting-outputs` and the FRB generator if this repository requires manual bridge regeneration.

---

### Task 1: Add Dart ICE Server Config Helper

**Files:**
- Create: `app/lib/model/webrtc/ice_server_config.dart`
- Create: `app/test/unit/model/webrtc/ice_server_config_test.dart`

- [ ] **Step 1: Write the failing helper tests**

Create `app/test/unit/model/webrtc/ice_server_config_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/model/webrtc/ice_server_config.dart';

void main() {
  group('buildIceServers', () {
    test('keeps stun servers without credentials', () {
      final result = buildIceServers(
        urls: ['stun:stun.example.com:3478'],
        turnUsername: 'user',
        turnCredential: 'secret',
      );

      expect(result, [
        const IceServerConfig(
          urls: ['stun:stun.example.com:3478'],
          username: null,
          credential: null,
        ),
      ]);
    });

    test('adds credentials to turn servers', () {
      final result = buildIceServers(
        urls: ['turn:turn.example.com:3478?transport=udp'],
        turnUsername: 'user',
        turnCredential: 'secret',
      );

      expect(result, [
        const IceServerConfig(
          urls: ['turn:turn.example.com:3478?transport=udp'],
          username: 'user',
          credential: 'secret',
        ),
      ]);
    });

    test('omits credentials when username or credential is empty', () {
      final result = buildIceServers(
        urls: ['turn:turn.example.com:3478?transport=udp'],
        turnUsername: 'user',
        turnCredential: '',
      );

      expect(result.single.username, isNull);
      expect(result.single.credential, isNull);
    });

    test('drops empty urls', () {
      final result = buildIceServers(
        urls: ['', '  ', 'stun:stun.example.com:3478'],
        turnUsername: null,
        turnCredential: null,
      );

      expect(result.length, 1);
      expect(result.single.urls, ['stun:stun.example.com:3478']);
    });
  });
}
```

- [ ] **Step 2: Run the failing tests**

Run:

```bash
cd app
flutter test test/unit/model/webrtc/ice_server_config_test.dart
```

Expected: FAIL because `app/lib/model/webrtc/ice_server_config.dart` does not exist.

- [ ] **Step 3: Implement the helper**

Create `app/lib/model/webrtc/ice_server_config.dart`:

```dart
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
  final hasTurnCredentials =
      username != null && username.isNotEmpty && credential != null && credential.isNotEmpty;

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
```

- [ ] **Step 4: Verify helper tests pass**

Run:

```bash
cd app
flutter test test/unit/model/webrtc/ice_server_config_test.dart
```

Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add app/lib/model/webrtc/ice_server_config.dart app/test/unit/model/webrtc/ice_server_config_test.dart
git commit -m "test: add ice server config helper"
```

---

### Task 2: Persist TURN Credentials in Settings

**Files:**
- Modify: `app/lib/provider/persistence_provider.dart`
- Modify: `app/lib/model/state/settings_state.dart`
- Modify: `app/lib/provider/settings_provider.dart`
- Generated: `app/lib/model/state/settings_state.mapper.dart`

- [ ] **Step 1: Add state fields test by compiling mapper consumers**

No direct unit test exists for `SettingsState`; use generation/analyze as verification after implementation. Keep this task minimal and add fields consistently before generation.

- [ ] **Step 2: Add persistence keys and methods**

In `app/lib/provider/persistence_provider.dart`, near existing `_stunServers` and `_remoteRoomSecret` keys, add:

```dart
const _turnUsername = 'ls_turn_username';
const _turnCredential = 'ls_turn_credential';
```

Near `getStunServers` / `setStunServers`, add:

```dart
String? getTurnUsername() {
  return _prefs.getString(_turnUsername);
}

Future<void> setTurnUsername(String? username) async {
  if (username == null || username.isEmpty) {
    await _prefs.remove(_turnUsername);
  } else {
    await _prefs.setString(_turnUsername, username);
  }
}

String? getTurnCredential() {
  return _prefs.getString(_turnCredential);
}

Future<void> setTurnCredential(String? credential) async {
  if (credential == null || credential.isEmpty) {
    await _prefs.remove(_turnCredential);
  } else {
    await _prefs.setString(_turnCredential, credential);
  }
}
```

- [ ] **Step 3: Add settings state fields**

In `app/lib/model/state/settings_state.dart`, add fields near remote settings:

```dart
final String? turnUsername;
final String? turnCredential;
```

Add constructor parameters:

```dart
required this.turnUsername,
required this.turnCredential,
```

- [ ] **Step 4: Initialize and update settings provider**

In `app/lib/provider/settings_provider.dart`, add to `SettingsState(...)` initialization:

```dart
turnUsername: _persistence.getTurnUsername(),
turnCredential: _persistence.getTurnCredential(),
```

Add methods:

```dart
Future<void> setTurnUsername(String? username) async {
  final normalized = username == null || username.trim().isEmpty ? null : username.trim();
  await _persistence.setTurnUsername(normalized);
  state = state.copyWith(turnUsername: normalized);
}

Future<void> setTurnCredential(String? credential) async {
  final normalized = credential == null || credential.trim().isEmpty ? null : credential.trim();
  await _persistence.setTurnCredential(normalized);
  state = state.copyWith(turnCredential: normalized);
}
```

- [ ] **Step 5: Generate mapper**

Run:

```bash
cd app
dart run build_runner build --delete-conflicting-outputs
```

Expected: succeeds and updates `settings_state.mapper.dart`.

- [ ] **Step 6: Commit**

```bash
git add app/lib/provider/persistence_provider.dart app/lib/model/state/settings_state.dart app/lib/provider/settings_provider.dart app/lib/model/state/settings_state.mapper.dart
git commit -m "feat: persist turn credentials"
```

---

### Task 3: Add TURN Fields to Settings UI

**Files:**
- Modify: `app/lib/pages/tabs/settings_tab_vm.dart`
- Modify: `app/lib/pages/tabs/settings_tab_controller.dart`
- Modify: `app/lib/pages/tabs/settings_tab.dart`
- Generated: `app/lib/pages/tabs/settings_tab_vm.mapper.dart`

- [ ] **Step 1: Add controllers to view model**

In `app/lib/pages/tabs/settings_tab_vm.dart`, add fields near `stunServersController`:

```dart
final TextEditingController turnUsernameController;
final TextEditingController turnCredentialController;
```

Add required constructor params:

```dart
required this.turnUsernameController,
required this.turnCredentialController,
```

- [ ] **Step 2: Initialize and dispose controllers**

In `app/lib/pages/tabs/settings_tab_controller.dart`, initialize in VM construction:

```dart
turnUsernameController: TextEditingController(
  text: _settingsService.state.turnUsername ?? '',
),
turnCredentialController: TextEditingController(
  text: _settingsService.state.turnCredential ?? '',
),
```

Dispose in `dispose()`:

```dart
state.turnUsernameController.dispose();
state.turnCredentialController.dispose();
```

- [ ] **Step 3: Add settings fields**

In `app/lib/pages/tabs/settings_tab.dart`, after `ICE servers`, add:

```dart
if (vm.advanced)
  _SettingsEntry(
    label: 'TURN username',
    child: TextFieldTv(
      name: 'TURN username',
      controller: vm.turnUsernameController,
      onChanged: (s) async {
        await ref.notifier(settingsProvider).setTurnUsername(
              s.trim().isEmpty ? null : s.trim(),
            );
      },
    ),
  ),
if (vm.advanced)
  _SettingsEntry(
    label: 'TURN password',
    child: TextFieldTv(
      name: 'TURN password',
      controller: vm.turnCredentialController,
      onChanged: (s) async {
        await ref.notifier(settingsProvider).setTurnCredential(
              s.trim().isEmpty ? null : s.trim(),
            );
      },
    ),
  ),
```

- [ ] **Step 4: Generate mapper**

Run:

```bash
cd app
dart run build_runner build --delete-conflicting-outputs
```

Expected: succeeds and updates `settings_tab_vm.mapper.dart`.

- [ ] **Step 5: Commit**

```bash
git add app/lib/pages/tabs/settings_tab_vm.dart app/lib/pages/tabs/settings_tab_controller.dart app/lib/pages/tabs/settings_tab.dart app/lib/pages/tabs/settings_tab_vm.mapper.dart
git commit -m "feat: add turn credential settings"
```

---

### Task 4: Thread Structured ICE Config Through Flutter Providers

**Files:**
- Modify: `app/lib/provider/network/webrtc/signaling_provider.dart`
- Modify: `app/lib/provider/network/send_provider.dart`
- Modify: `app/lib/provider/network/webrtc/webrtc_receiver.dart`
- Generated: `app/lib/provider/network/webrtc/signaling_provider.mapper.dart`

- [ ] **Step 1: Write a compile-time integration target**

Use analyzer after changes as the verification target because provider state is generated and not currently unit-tested.

- [ ] **Step 2: Update SignalingState**

In `app/lib/provider/network/webrtc/signaling_provider.dart`, import:

```dart
import 'package:localsend_app/model/webrtc/ice_server_config.dart';
```

Change `SignalingState` field:

```dart
final List<IceServerConfig> iceServers;
```

Change constructor parameter:

```dart
required this.iceServers,
```

In `init()`, replace `stunServers:` with:

```dart
iceServers: buildIceServers(
  urls: _persistence.getStunServers() ?? defaultStunServers,
  turnUsername: _persistence.getTurnUsername(),
  turnCredential: _persistence.getTurnCredential(),
),
```

- [ ] **Step 3: Update receive provider creation**

In `signaling_provider.dart`, replace:

```dart
stunServers: ref.read(signalingProvider).stunServers,
```

with:

```dart
iceServers: ref.read(signalingProvider).iceServers,
```

- [ ] **Step 4: Update send provider call**

In `app/lib/provider/network/send_provider.dart`, replace:

```dart
stunServers: ref.read(signalingProvider).stunServers,
```

with:

```dart
iceServers: ref.read(signalingProvider).iceServers.map((server) => server.toRust()).toList(),
```

Add an extension at the bottom of the file:

```dart
extension on IceServerConfig {
  rust_webrtc.IceServerConfig toRust() {
    return rust_webrtc.IceServerConfig(
      urls: urls,
      username: username,
      credential: credential,
    );
  }
}
```

Also import `app/lib/model/webrtc/ice_server_config.dart`.

- [ ] **Step 5: Update WebRTC receiver constructor and call**

In `app/lib/provider/network/webrtc/webrtc_receiver.dart`, change `_stunServers` to:

```dart
final List<IceServerConfig> _iceServers;
```

Change constructor parameter:

```dart
required List<IceServerConfig> iceServers,
```

Assign:

```dart
_iceServers = iceServers,
```

Replace accept call:

```dart
iceServers: notifier._iceServers.map((server) => server.toRust()).toList(),
```

Add the same `toRust()` extension and import `IceServerConfig`.

- [ ] **Step 6: Generate mapper**

Run:

```bash
cd app
dart run build_runner build --delete-conflicting-outputs
```

Expected: succeeds and updates `signaling_provider.mapper.dart`.

- [ ] **Step 7: Commit**

```bash
git add app/lib/provider/network/webrtc/signaling_provider.dart app/lib/provider/network/send_provider.dart app/lib/provider/network/webrtc/webrtc_receiver.dart app/lib/provider/network/webrtc/signaling_provider.mapper.dart
git commit -m "feat: use structured ice config in app"
```

---

### Task 5: Add Rust Bridge ICE Server Struct

**Files:**
- Modify: `app/rust/src/api/webrtc.rs`
- Generated: `app/lib/rust/api/webrtc.dart`
- Generated: `app/lib/rust/frb_generated.dart`
- Generated: `app/lib/rust/frb_generated.io.dart`
- Generated: `app/lib/rust/frb_generated.web.dart`
- Generated: `app/rust/src/frb_generated.rs`

- [ ] **Step 1: Add bridge struct and API signature changes**

In `app/rust/src/api/webrtc.rs`, add near `ProposingClientInfo`:

```rust
pub struct IceServerConfig {
    pub urls: Vec<String>,
    pub username: Option<String>,
    pub credential: Option<String>,
}

impl From<IceServerConfig> for localsend::webrtc::webrtc::IceServerConfig {
    fn from(value: IceServerConfig) -> Self {
        Self {
            urls: value.urls,
            username: value.username,
            credential: value.credential,
        }
    }
}
```

Change `send_offer` parameter:

```rust
ice_servers: Vec<IceServerConfig>,
```

Convert before spawning:

```rust
let ice_servers = ice_servers.into_iter().map(Into::into).collect();
```

Pass `ice_servers` into `localsend::webrtc::webrtc::send_offer`.

Change `accept_offer` the same way.

- [ ] **Step 2: Regenerate Flutter Rust Bridge outputs**

Run the repository's FRB generation command. If no wrapper exists, run from `app`:

```bash
flutter_rust_bridge_codegen generate
```

Expected: generated Dart/Rust bridge files include `IceServerConfig` and `sendOffer/acceptOffer` accept `required List<IceServerConfig> iceServers`.

- [ ] **Step 3: Commit**

```bash
git add app/rust/src/api/webrtc.rs app/lib/rust/api/webrtc.dart app/lib/rust/frb_generated.dart app/lib/rust/frb_generated.io.dart app/lib/rust/frb_generated.web.dart app/rust/src/frb_generated.rs
git commit -m "feat: expose ice server config over bridge"
```

---

### Task 6: Add Core Rust TURN Credential Support

**Files:**
- Modify: `core/src/webrtc/webrtc.rs`
- Modify: `core/src/main.rs`

- [ ] **Step 1: Add core struct**

In `core/src/webrtc/webrtc.rs`, near `RTCFile`, add:

```rust
#[derive(Clone, Debug)]
pub struct IceServerConfig {
    pub urls: Vec<String>,
    pub username: Option<String>,
    pub credential: Option<String>,
}
```

- [ ] **Step 2: Change send/accept signatures**

Change `send_offer` parameter from:

```rust
stun_servers: Vec<String>,
```

to:

```rust
ice_servers: Vec<IceServerConfig>,
```

Pass `ice_servers` to `create_peer_connection`.

Change `accept_offer` the same way.

- [ ] **Step 3: Build RTCIceServer with credentials**

Replace `create_peer_connection(stun: Vec<String>)` with:

```rust
async fn create_peer_connection(
    ice_servers: Vec<IceServerConfig>,
) -> Result<(Arc<RTCPeerConnection>, mpsc::Receiver<()>)> {
    let api = APIBuilder::new().build();

    let config = RTCConfiguration {
        ice_servers: ice_servers
            .into_iter()
            .map(|server| RTCIceServer {
                urls: server.urls,
                username: server.username.unwrap_or_default(),
                credential: server.credential.unwrap_or_default(),
                ..Default::default()
            })
            .collect(),
        ..Default::default()
    };

    let peer_connection = api.new_peer_connection(config).await?;

    let (done_tx, done_rx) = mpsc::channel::<()>(1);

    peer_connection.on_peer_connection_state_change(Box::new(move |s: RTCPeerConnectionState| {
        if s == RTCPeerConnectionState::Disconnected {
            let _ = done_tx.try_send(());
        }
        Box::pin(async {})
    }));

    Ok((Arc::new(peer_connection), done_rx))
}
```

- [ ] **Step 4: Update core test helper**

In `core/src/main.rs`, replace local `stun_servers` examples with:

```rust
let ice_servers = vec![webrtc::webrtc::IceServerConfig {
    urls: vec!["stun:stun.l.google.com:19302".to_string()],
    username: None,
    credential: None,
}];
```

Rename local variables and parameters from `stun_servers` to `ice_servers` where compile errors require it.

- [ ] **Step 5: Verify Rust tests/build**

Run:

```bash
cd core
cargo test --lib
```

Expected: PASS or no relevant failures. If full core tests require network features, run `cargo check` and document any known unrelated blockers.

- [ ] **Step 6: Commit**

```bash
git add core/src/webrtc/webrtc.rs core/src/main.rs
git commit -m "feat: support turn credentials in core webrtc"
```

---

### Task 7: End-to-End Verification and TURN Deployment Notes

**Files:**
- Modify: `server/README.md`

- [ ] **Step 1: Add coturn example to server docs**

Append to `server/README.md`:

```markdown
## TURN Relay

The signaling server only coordinates peers. Cross-network WebRTC file transfer may require a TURN relay.

Example coturn settings:

```text
listening-port=3478
fingerprint
lt-cred-mech
realm=localsend.telyra.top
user=localsend:CHANGE_ME_STRONG_PASSWORD
no-multicast-peers
no-cli
```

Open firewall ports:

```bash
sudo ufw allow 3478/tcp
sudo ufw allow 3478/udp
```

Client settings:

```text
ICE servers:
stun:stun.localsend.org:5349
turn:localsend.telyra.top:3478?transport=udp
turn:localsend.telyra.top:3478?transport=tcp

TURN username:
localsend

TURN password:
CHANGE_ME_STRONG_PASSWORD
```
```

- [ ] **Step 2: Run Dart generation and tests**

Run:

```bash
cd app
dart run build_runner build --delete-conflicting-outputs
flutter test
```

Expected: all Flutter tests pass.

- [ ] **Step 3: Run focused analyzer**

Run:

```bash
cd app
flutter analyze --no-fatal-warnings --no-fatal-infos lib test
```

Expected: no analyzer errors. Existing generated `UuidValue` warnings may remain.

- [ ] **Step 4: Manual E2E test**

Configure both devices:

```text
Remote discovery: enabled
Signaling servers: wss://localsend.telyra.top/v1/ws
Remote room: same value on both devices
ICE servers:
stun:stun.localsend.org:5349
turn:localsend.telyra.top:3478?transport=udp
turn:localsend.telyra.top:3478?transport=tcp
TURN username: localsend
TURN password: the coturn password
```

Expected:
- Server logs show both peers connected to the same room.
- Sender selects remote peer.
- Receiver sees confirmation page.
- Receiver accepts.
- Small image transfer completes across different public networks.

- [ ] **Step 5: Commit docs and generated verification changes**

```bash
git add server/README.md app/lib app/test app/rust core
git commit -m "docs: add turn relay setup"
```

---

## Self-Review

- Spec coverage: The plan covers manual TURN credentials, STUN retention, TURN 3478 URL support, app settings, Dart/Rust bridge, core WebRTC, docs, and tests.
- Placeholder scan: No TBD/TODO placeholders remain. FRB generation command is explicit; if the repository uses a wrapper, the worker should use the wrapper but the fallback command is provided.
- Type consistency: `IceServerConfig` is used consistently on Dart app side, Dart generated bridge side, app Rust bridge side, and core Rust side. Flutter app model converts to generated bridge model through `toRust()` extensions.
