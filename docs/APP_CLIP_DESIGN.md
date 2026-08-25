# iOS App Clip sender design

Status: architecture proposal for `feat/ios-app-clip`; no runtime behavior is implemented by this document.

Related issue: [#3255](https://github.com/localsend/localsend/issues/3255).

## Scope

The first App Clip feature lets an iPhone without LocalSend installed select photos and videos through PhotosPicker and send them to a nearby Android device running LocalSend. Android hosts a temporary local-only Wi-Fi network and exposes a dynamic App Clip invocation URL through NFC Host Card Emulation and a QR fallback.

This proposal does not claim to provide durable no-install receipt on iPhone. Apple restricts the Photos and Files/File Provider capabilities needed to keep received files from an App Clip. A receive-preview/install handoff is a separate feature.

The normal LocalSend LAN discovery, upload protocol, server settings, and non-Android platforms remain unchanged.

## Why this shape

- The App Clip stays native SwiftUI and links only Apple frameworks. It does not embed the Flutter engine or every LocalSend plugin, keeping the physical-invocation binary below Apple's 15 MB uncompressed limit.
- The file transfer uses LocalSend v2's existing reverse-download API. It does not introduce ClipDrop's separate framing protocol.
- The Android device connects back to an inbound App Clip listener. This preserves the App Clip transport established by the ClipDrop prototype and avoids making the App Clip initiate a private-address socket.
- A small authenticated HTTP bootstrap listener is separate from LocalSend's normal HTTP server because the normal server may be configured for HTTPS with a self-signed certificate that `WKWebView` cannot trust automatically.
- All App Clip behavior is opt-in from a new Android receive action. Nothing starts in the background and ordinary LocalSend transfers do not change.

## Components

### Shared Flutter/Rust

- `packages/core`: extend the v2 client with a bounded, cancellable download-to-path/file-descriptor operation with size validation and progress.
- `packages/localsend_isolates`: expose prepare-download and download-to-target through the existing Rust/Dart bridge.
- `app/lib/provider/network/app_clip`: own the App Clip receive session, file acceptance, save targets, progress, cancellation, history, and teardown.
- `app/lib/pages`: add an Android-only entry action and a direct-receive page using LocalSend's existing receive/progress visual components.

### Android

- `AppClipHostService`: foreground owner of `LocalOnlyHotspotReservation`, the bootstrap listener, and the HCE payload.
- `Type4NdefTag`: pure Kotlin Type-4 NDEF state machine serving exactly one URI record.
- `AppClipNdefService`: thin `HostApduService` adapter, enabled only while a ready session exists.
- `AppClipBootstrapServer`: bounded one-shot HTTP listener that authenticates the App Clip's callback and retains the peer result until Dart acknowledges it.
- Existing `MainActivity` method channel plus one event stream: start/stop/status/acknowledge the host session. No transfer bytes cross the Flutter platform channel.

### iOS

- A native `LocalSendClip` target embedded in Runner, alongside the existing Share Extension.
- A small native `AppClipTransferKit` module shared by Runner and `LocalSendClip`, containing invocation parsing, PhotosPicker staging, hotspot join, reverse-download server, authenticated bootstrap, and the LocalSend-branded SwiftUI flow.
- The full Flutter Runner remains LocalSend's installed iOS app and `@main` entry point. Runner's existing AppDelegate presents the shared native send flow when it receives the same invocation URL, because iOS launches the full app instead of its App Clip after installation. The App Clip has its own `@main`; no standalone ClipDrop parent app is imported.

## Ordered end-to-end flow

1. On Android 8.0 or newer, the user opens Receive and chooses **Receive from iPhone**.
2. Flutter checks HCE, Wi-Fi, notification, nearby-Wi-Fi/location, and foreground-service prerequisites. A missing prerequisite is shown before session startup.
3. Flutter asks `AppClipHostService` to start. The service generates a fresh session ID and 32-byte session key using `SecureRandom`.
4. The service starts `LocalOnlyHotspot`. It reads the OS-generated SSID and passphrase and identifies up to four newly available private IPv4 addresses from the live interface set. It never assumes `192.168.43.1`.
5. The service binds the bootstrap listener to an ephemeral port on all local interfaces.
6. The service constructs the invocation URL described below, arms HCE with one NDEF URI record, and returns the same URL to Flutter for QR rendering. Neither the URL nor its credentials are logged or persisted.
7. The user holds the unlocked iPhone near the Android device, or scans the QR. iOS presents the App Clip card and launches `LocalSendClip` with the invocation URL.
8. The App Clip validates the URL version, field sizes, address classes, port ranges, and cryptographic material before showing a destination.
9. The iPhone user selects photos or videos through PhotosPicker. Every item is copied to the App Clip's temporary directory while internet access is still available. A partial staging failure stops the attempt visibly.
10. On Send, the App Clip joins the Android local-only hotspot with `NEHotspotConfiguration(joinOnce: true)`.
11. The App Clip starts a Wi-Fi-only `NWListener` on an ephemeral port. Its HTTP server is limited to the endpoints and limits below.
12. The App Clip builds the bootstrap body, then a nonpersistent `WKWebView` POSTs it to each exact private IPv4 bootstrap candidate. Redirects, popups, credentials, downloads, hostname targets, and non-candidate origins are rejected.
13. Android accepts at most 4 KiB, validates the body in constant time, checks the session/TTL/replay state, records the App Clip IP from the accepted socket rather than the request body, consumes the bootstrap once, and returns HTTP 202.
14. The service reports `{sessionId, peerIp, peerPort, downloadToken}` to Dart. The result remains queryable until Dart acknowledges it, so activity recreation cannot lose the session.
15. Flutter creates the existing LocalSend v2 HTTP client in HTTP mode and calls `prepare-download` with the derived download token as `pin`.
16. The App Clip server returns LocalSend's standard `PrepareDownloadResponseDtoV2`. The App Clip auto-accepts only the authenticated session created by step 13.
17. Flutter creates an incoming transfer state from the returned device/file metadata and shows LocalSend's receive confirmation UI. No file request is made before the Android user accepts it.
18. For each accepted file, Flutter prepares the normal destination path or Android SAF file descriptor. Rust issues `GET /api/localsend/v2/download`, streams to that target, validates the declared byte count, and emits throttled progress.
19. Successful files are added to LocalSend receive history. Failed files remain visible and retryable without creating duplicate destination names.
20. When every accepted file reaches a terminal state, Android stops the foreground transfer notification, disarms HCE, closes the bootstrap listener and hotspot, and returns to the normal network.
21. The App Clip marks success only after all offered files were downloaded completely. It tears down its listener, removes the temporary hotspot configuration, deletes staged files, and shows Done.

If the full LocalSend app is already installed, iOS launches it instead of the App Clip. Runner's scene delegate validates the same invocation and presents the shared native sender screen on iOS 16 or later; its target carries the same hotspot capability required by that flow. Older supported Runner versions show an explicit unsupported-version message.

## Invocation URL contract

The checked-in production base URL is `https://localsend.org/clip`. Android reads it from the overridable `appClipInvocationBaseUrl` project property; iOS reads the matching overridable `APP_CLIP_INVOCATION_BASE_URL` target setting. Both iOS targets carry the configurable `APP_CLIP_ASSOCIATED_DOMAIN` entitlement, whose source default is `appclips:localsend.org`. Deployment also requires the matching AASA response and App Store Connect experience described in `APP_CLIP_DEPLOYMENT.md`.

Query fields are unique; duplicates are invalid.

| Field | Encoding | Limit | Meaning |
|---|---|---:|---|
| `v` | ASCII integer | `1` | Invocation contract version. |
| `sid` | base64url without padding | 16 decoded bytes | Per-attempt session ID. |
| `k` | base64url without padding | 32 decoded bytes | Per-attempt bearer/session key. |
| `ssid` | percent-encoded UTF-8 | 1-32 bytes | Android local-only hotspot SSID. |
| `pass` | percent-encoded UTF-8 | 8-63 bytes | Ephemeral hotspot passphrase. |
| `hosts` | comma-separated canonical IPv4 literals | 1-4 entries | Bootstrap candidates; RFC1918 only, no leading-zero variants. |
| `bp` | ASCII integer | 1-65535 | Android bootstrap listener port. |
| `name` | percent-encoded UTF-8 | 1-80 bytes | Android display alias. |

The full URL is limited to 1,024 UTF-8 bytes. Missing, duplicate, unknown, or invalid fields fail closed; a future version must explicitly update both parsers. The URL is a short-lived bearer capability and must never enter logs, analytics, history, crash text, clipboard, or persistent preferences.

## Type-4 NDEF contract

- Application AID: `D2760000850101`.
- Capability Container file ID: `E103`.
- NDEF file ID: `E104`.
- The NDEF message contains exactly one NFC Forum well-known URI record (`TNF=wellKnown`, type `U`, MB=1, ME=1).
- The URI record uses prefix byte `0x00` followed by the complete HTTPS invocation URL.
- No Android Application Record, external record, text record, or second URI record is emitted.
- Supported APDUs are SELECT application, SELECT CC/NDEF file, and bounded READ BINARY. Malformed lengths, invalid offsets, unknown files, UPDATE BINARY, and unknown instructions fail without mutating state.
- The service is disabled and serves no session after stop, timeout, terminal transfer state, or process restart.

Pure JVM tests byte-compare the CC file and NDEF file, cover chunked reads and APDU errors, and prove that a new session cannot expose a previous URL.

## Bootstrap body contract

All integers are unsigned big-endian. The exact body is 75 bytes:

```
version        1 byte   = 0x01
sessionId     16 bytes  = decoded sid
listenerPort   2 bytes
issuedAt        8 bytes = Unix milliseconds
nonce          16 bytes = fresh random value
mac            32 bytes = HMAC-SHA256(sessionKey, all preceding bytes)
```

Android accepts the body only when:

- request method/path/content type are exactly `POST`, `/api/localsend/app-clip/v1/bootstrap`, and `application/octet-stream`;
- Content-Length is exactly 75 and never exceeds the 4 KiB server cap;
- version/session match the active attempt;
- listener port is nonzero;
- `issuedAt` is within 120 seconds of Android wall-clock time;
- the nonce has not been consumed;
- the HMAC matches in constant time;
- no bootstrap was previously accepted for the attempt.

The listener returns 202 only after storing the peer IP, listener port, and derived token atomically. Replays return 409; authentication failures return 403; invalid shape returns 400; no active session returns 404. Responses contain no secrets.

The reverse-download PIN is `base64url(HMAC-SHA256(sessionKey, "localsend-app-clip-download-v1"))` without padding. It is never sent in the bootstrap body and is available independently to both sides.

## LocalSend v2 reverse-download contract

The App Clip implements only:

1. `POST /api/localsend/v2/prepare-download?pin=<downloadToken>`
2. `GET /api/localsend/v2/download?sessionId=<id>&fileId=<id>`
3. `POST /api/localsend/v2/cancel?sessionId=<id>` for explicit Android decline/cancel

The prepare response is the existing camel-case JSON shape:

```json
{
  "info": {
    "alias": "iPhone",
    "version": "2.2",
    "deviceModel": "iPhone",
    "deviceType": "mobile",
    "fingerprint": "<per-attempt identifier>",
    "download": true
  },
  "sessionId": "<random session id>",
  "files": {
    "<file id>": {
      "id": "<file id>",
      "fileName": "photo.jpg",
      "size": 123,
      "fileType": "image/jpeg"
    }
  }
}
```

The proposed App Clip-specific server limits are 10,000 files, 4 GiB per file, 20 GiB per session, 255 UTF-8 bytes per file name, 64 KiB request headers, and one authenticated session. Duplicate IDs, duplicate query fields, traversal names, size overflow, and unknown files fail closed. Every response uses `Connection: close`; the client may open one request per connection.

Downloads return `application/octet-stream`, exact `Content-Length`, and a sanitized `Content-Disposition`. The App Clip streams from disk in bounded chunks and never loads a whole file into memory.

Android's new Rust bridge operation accepts exactly one destination: path or Android file descriptor. It validates the number of written bytes against the file DTO, truncates stale target tails, transfers descriptor ownership once, supports cancellation, and emits progress no more often than every 20 ms plus the final event.

## State, cancellation, and recovery

Android host states:

```
idle -> startingHotspot -> readyForTap -> waitingForClip
     -> waitingForApproval -> receiving -> completed
     -> failed | cancelled -> idle
```

- Start is idempotent; a second start while active returns the current redacted state.
- Stop is safe from every state and closes HCE, listener, hotspot, and pending client work exactly once.
- Activity recreation reads the service's current redacted state; secrets never cross to widgets or restoration data.
- A 10-minute ready timeout and 2-minute post-bootstrap approval timeout tear down the session visibly.
- Decline/cancel calls the App Clip cancel endpoint best-effort, cancels the Rust token, aborts unfinished save targets, and tears down the hotspot.
- App Clip cancellation closes its listener and staged files. Android treats connection loss as a terminal failure with Retry/Close actions.
- Ordinary LocalSend sessions are not silently replaced. The App Clip action is disabled while another transfer session is active, and ordinary inbound requests are rejected while the direct receive session owns the transfer slot.

## Permissions and capabilities

Android:

- feature-gated to API 26+;
- `CHANGE_WIFI_STATE`, `ACCESS_WIFI_STATE`, `ACCESS_NETWORK_STATE`, `NFC`;
- `ACCESS_FINE_LOCATION` through Android 12 and `NEARBY_WIFI_DEVICES` on Android 13+ as required by the hotspot API;
- `FOREGROUND_SERVICE_CONNECTED_DEVICE` and notification permission where applicable;
- `android.hardware.nfc.hce` remains optional so non-HCE devices can still use normal LocalSend; the App Clip action explains that the QR fallback still requires hotspot support.

iOS App Clip:

- App Clip parent association and embed phase;
- Hotspot Configuration entitlement;
- Associated Domains for the production App Clip experience;
- no Photo Library usage prompt for PhotosPicker;
- the parent Runner carries matching Associated Domains and Hotspot Configuration capabilities and handles the same invocation URL with `AppClipTransferKit`;
- temporary-file and foreground-only operation;
- no background networking, Bluetooth dependency, or persistent identifier.

## Verification gates

Automated on Linux:

- Rust v2 download-to-target success, size mismatch, path failure, cancellation, and progress tests;
- Dart controller tests with fake host platform and fake reverse-download client;
- pure JVM APDU/NDEF, invocation encoding, bootstrap authentication, replay, timeout, and redaction tests. Android compilation is a separate authorized gate.

macOS CI:

- generate/update bindings;
- build Runner, Share Extension, and `LocalSendClip` for simulator without signing;
- run Swift invocation/bootstrap/HTTP parser/state tests;
- archive and report the App Clip's uncompressed size; the physical-invocation limit is 15 MB.

Real devices before a non-draft PR claim:

1. Android action starts the hotspot and exposes a QR/NFC payload.
2. A clean iPhone shows the App Clip card and launches the clip with the URL.
3. PhotosPicker and Files selection stage successfully.
4. The iPhone joins the hotspot.
5. WebKit bootstrap reaches Android and Android connects back.
6. Android accept, decline, retry, cancel, rotation, and background/foreground paths are exercised.
7. Multiple file types and a large file arrive byte-identically at the configured destination.
8. HCE is disarmed and both phones return to their normal networks after every terminal path.

Until those clicks and observations occur, the feature is source/test/compile verified only, not end-to-end verified.

## Reviewable implementation series

1. Rust v2 reverse-download-to-target API and tests.
2. Rust/Dart bridge plus controller tests, with no UI or platform change.
3. Android host/HCE/bootstrap service and pure JVM tests.
4. Android LocalSend receive action and direct-session UI.
5. Native App Clip target, Swift protocol implementation, and simulator tests.
6. macOS size/build CI, device-test evidence, documentation, and final PR description.

Each commit must leave normal LocalSend transfers passing. The branch remains draft until the macOS and real-device gates are complete.
