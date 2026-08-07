# LocalSend NG Handoff

Repo: `C:\Users\mac\localsend-ng`

Fork: `https://github.com/maceip/localsend-ng`

Original upstream: `https://github.com/localsend/localsend`

## Next Agent: Do This First

You are inheriting an uncommitted working tree. Do not start over.

1. Open this repo:

```powershell
cd C:\Users\mac\localsend-ng
git status --short --branch
```

2. Run analyzer from the Flutter app directory:

```powershell
cd C:\Users\mac\localsend-ng\app
C:\tools\flutter-3.41.9\bin\flutter.bat analyze
```

3. If analyzer fails, fix those errors first. The most likely fresh errors are in the two very late Android autostart files:

- `app/android/app/src/main/kotlin/org/localsend/localsend_app/BootStartReceiver.kt`
- `app/android/app/src/main/kotlin/org/localsend/localsend_app/MainActivity.kt`

4. Build Android debug APK:

```powershell
cd C:\Users\mac\localsend-ng\app
C:\tools\flutter-3.41.9\bin\flutter.bat build apk --debug
```

5. If Android build succeeds, artifact should be:

```text
C:\Users\mac\localsend-ng\app\build\app\outputs\flutter-apk\app-debug.apk
```

6. Then build Windows debug app to compile-check the Windows lock:

```powershell
cd C:\Users\mac\localsend-ng\app
C:\tools\flutter-3.41.9\bin\flutter.bat build windows --debug
```

7. Only after build success, consider committing/pushing. Nothing has been committed yet.

## Current Status

- Upstream LocalSend was uninstalled from Windows via winget before this source work.
- The fork was cloned locally and renamed/package-adjusted toward `LocalSend NG`.
- Flutter SDK `3.41.9` was installed locally at `C:\tools\flutter-3.41.9`.
- `app/android/local.properties` exists locally and points Gradle at that Flutter SDK. It is ignored by git.
- `flutter analyze` passed cleanly from `app/` before the final quick Android boot-start edits.
- Focused test `test\unit\provider\last_devices_provider_test.dart` passed before the final quick Android boot-start edits.
- Android APK build was started but intentionally interrupted by the user; no final APK was produced.
- Any leftover Flutter/Dart/Gradle/Java build processes from the aborted build were stopped.
- After the final quick additions, no tests/builds were run at the user's request.

## Main Changes Made

### Android Background Availability

Files:
- `app/android/app/src/main/AndroidManifest.xml`
- `app/android/app/src/main/kotlin/org/localsend/localsend_app/BootStartReceiver.kt`
- `app/android/app/src/main/kotlin/org/localsend/localsend_app/MainActivity.kt`
- `packages/localsend_isolates/lib/util/foreground_service.dart`
- `packages/localsend_isolates/lib/util/transfer_notification.dart`
- `app/lib/config/init.dart`

Behavior:
- Added an idle Android foreground-service keepalive after app startup.
- Transfer notifications now restore the idle keepalive instead of fully stopping the foreground service after the last transfer.
- This should help Android remain discoverable after the user opens the app once.
- Added a best-effort boot/package-update receiver that starts the existing Flutter app path after `BOOT_COMPLETED`, `MY_PACKAGE_REPLACED`, or `PACKAGE_REPLACED`.
- Boot-start launches are marked with `EXTRA_BACKGROUND_START`; `MainActivity` moves the task to the back after 4 seconds so the Dart server/discovery path can initialize and then get out of the way.
- Added Android permissions `RECEIVE_BOOT_COMPLETED` and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`.

Limits:
- This does not bypass Android OS restrictions for a killed app, force-stopped app, or an app the OS decides to restrict heavily.
- A persistent notification is expected.
- Some Android vendors aggressively block autostart unless the user allows it in OEM battery/autostart settings.
- This is not a pure headless Flutter service; it is a fast pragmatic startup shim that reuses the existing app/server initialization path.
- `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` is declared only. No UI flow has been added yet to prompt the user to exempt LocalSend NG from battery optimization.
- `PACKAGE_REPLACED` may require manifest data-scheme filtering depending on Android behavior. `MY_PACKAGE_REPLACED` is the important self-update case and should be enough if `PACKAGE_REPLACED` causes manifest/build issues.

### Better Local Discovery Without Hosted Relay

Files:
- `app/lib/provider/persistence_provider.dart`
- `app/lib/provider/last_devices.provider.dart`
- `app/lib/provider/network/nearby_devices_provider.dart`
- `app/lib/provider/network/scan_facade.dart`
- `app/lib/provider/network/server/controller/receive_controller.dart`
- `app/lib/provider/network/send_provider.dart`

Behavior:
- Recent reachable peers are now persisted.
- Smart scan now probes favorites and recent peers directly, in addition to multicast.
- Any peer that registers or sends a file to this device is fed back into discovery as a reachable device.
- Successful sends/receives update recent peers.

Why:
- This is a practical local-only improvement for networks where multicast/broadcast is unreliable or client isolation makes mDNS-style discovery spotty.

### Trusted Auto-Receive After 3 Successful Sessions

Files:
- `app/lib/provider/favorites_provider.dart`
- `app/lib/provider/persistence_provider.dart`
- `app/lib/provider/network/send_provider.dart`
- `app/lib/provider/network/server/controller/receive_controller.dart`

Behavior:
- Successful send/receive sessions are counted by LocalSend certificate fingerprint.
- After 3 successful sessions, the peer is automatically added to Favorites.
- Favorites are the existing LocalSend "quick save from favorites" trusted auto-receive bucket.

Identity notes:
- Fingerprint is the durable identity here.
- IP address is not durable.
- MAC address is not reliable on modern Android/iOS because of randomization and OS access limits.
- LocalSend alias/app names are not trusted identity and may change.
- If a peer reinstalls or wipes LocalSend settings, it gets a new fingerprint and must earn trust again.

### Receiving Defaults / No Open Picker

Files:
- `app/lib/provider/persistence_provider.dart`
- `app/lib/provider/network/server/controller/receive_controller.dart`

Behavior:
- Default `saveToGallery` is now `false`, so files go to the normal receive destination by default.
- Default `autoFinish` is now `true`.
- Default quick save remains `paired`/favorites-only, which now works with the 3-success auto-trust promotion.
- Removed the automatic open-file dialog after quick-save completes.

Why:
- User wanted received files written to disk without Android immediately asking which app should open them.
- This should avoid the Android Photos/file-intent race where a freshly received PNG fails to open even though transfer completed.

### Manual Address Input Improvements

File:
- `app/lib/widget/dialogs/address_input_dialog.dart`

Behavior:
- Manual send now accepts:
  - full URLs
  - `host:port`
  - raw host/IP
  - `#123`
  - `.123`
  - `123`
- Last-octet shortcuts expand across local IP prefixes.
- If no explicit port is provided, it tries the configured port and the upstream default port `53317`.

### Windows Single Instance Guard

Files:
- `app/lib/config/init.dart`
- `app/lib/util/native/windows_single_instance_lock.dart`
- `app/pubspec.yaml`
- `app/pubspec.lock`

Behavior:
- Added a Windows named kernel-object lock before Rust/network startup.
- This prevents a second patched Windows LocalSend NG process from reaching server socket binding, even if ports differ.
- The old HTTP "show existing instance" path remains as best-effort UI behavior.
- Explicit policy added in code: one native Windows LocalSend NG process per Windows logon session.

Notes:
- Implemented with `CreateEventW`/`GetLastError`/`CloseHandle` via FFI because the resolved `win32` package did not generate `CreateMutex`.
- It is still a proper named kernel-object single-instance gate.
- This only protects patched builds. An old unpatched upstream LocalSend binary will not know about this lock.
- WSL, VM, Docker/container and other isolated OS boundaries intentionally do not share this Win32 kernel namespace; they are allowed/separate rather than killed by the host Windows app.

### WebSocket Keepalive Research

No WebSocket keepalive code was added.

The user asked whether there is a well-known always-online WebSocket endpoint that can be kept open on Android because open sockets sometimes make Android leave a process alive longer.

Findings:
- `wss://echo.websocket.org` exists and is public, but it is a testing echo endpoint. It has limits including 64KB messages and a 10-minute connection timeout / reasonable anti-abuse limits. Source: `https://websocket.org/tools/websocket-echo-server/`
- The backing echo server source says WebSocket/SSE connections time out by default after 10 minutes and are for testing HTTP proxies/clients. Source: `https://github.com/ably/echo.websocket.org`
- `wss://ws.postman-echo.com/raw` exists as Postman's public raw WebSocket echo endpoint. It is for testing WebSocket clients. Source: `https://blog.postman.com/introducing-postman-websocket-echo-service/`
- `wss://google.com` is not a generic public WebSocket service.

Recommendation:
- Do not hardcode any public echo endpoint as default behavior.
- If implementing this, make it disabled by default and clearly experimental.
- Add a user-configurable advanced setting such as `backgroundKeepaliveWebSocketUrl`.
- If set, Android can open a WebSocket in the existing foreground-service-backed runtime, send a tiny ping every few minutes, reconnect with exponential backoff, and never block local send/receive if it fails.
- Treat this as "internet-assisted keepalive experiment", not pure LocalSend.

Likely implementation files if adding it:
- `app/lib/provider/persistence_provider.dart`: persist URL and enabled flag.
- `app/lib/provider/settings_provider.dart`: expose setting in app state.
- `app/lib/pages/tabs/settings_tab.dart`: optional advanced UI toggle/text field.
- `app/lib/config/init.dart`: start it from `postInit` only on Android after foreground keepalive setup.
- New file such as `app/lib/provider/network/background_websocket_keepalive_provider.dart`: owns WebSocket connect/reconnect/ping loop using `dart:io` `WebSocket`.

### Android App Identity Rename

Files:
- `app/android/app/build.gradle`
- Android manifests under `app/android/app/src/...`
- Kotlin files under `app/android/app/src/main/kotlin/org/localsend/localsend_app/...`
- Dart/Android native channel files

Behavior:
- Application id / namespace changed from `org.localsend.localsend_app` to `org.localsend.localsend_ng`.
- Visible Android app label changed to `LocalSend NG`.
- Native method channel name changed to `org.localsend.localsend_ng/localsend`.

Cleanup note:
- Kotlin package declarations changed, but the physical folder path is still `org/localsend/localsend_app`. Kotlin can compile this, but a later cleanup should move files into `org/localsend/localsend_ng`.

## Validation Completed

Commands run from `C:\Users\mac\localsend-ng\app`:

```powershell
C:\tools\flutter-3.41.9\bin\flutter.bat pub get
C:\tools\flutter-3.41.9\bin\flutter.bat analyze
C:\tools\flutter-3.41.9\bin\flutter.bat test test\unit\provider\last_devices_provider_test.dart
```

Results:
- `pub get`: succeeded.
- `analyze`: `No issues found`.
- focused test: all tests passed.

Important:
- These validation results are from before the very last quick edits adding Android boot autostart and the final Windows policy comment/name change.
- The next agent must rerun analyzer/build before claiming the current tree is good.

## Not Done

- Android APK build did not complete because the user interrupted at the build step.
- Windows build did not run yet.
- No APK/installer artifact was produced.
- Latest quick Android boot-start changes were not analyzed or built.
- No real-device testing was done for:
  - Android background discoverability
  - Android boot/package-update autostart
  - macOS/Windows/Android asymmetric discovery
  - manual `#last-octet` input
  - Android receive-to-downloads flow
  - Windows duplicate-instance prevention
- Optional WebSocket keepalive was researched but not implemented.
- No commit was made.
- No branch was pushed.
- No PR was opened.
- Generated desktop plugin registrant files show as modified in `git status`; inspect before committing. They may be Flutter/pub-get or line-ending noise.

## Likely Build Fixes If It Fails

- If Kotlin cannot resolve `EXTRA_BACKGROUND_START`, confirm `BootStartReceiver.kt` and `MainActivity.kt` have the same package declaration: `package org.localsend.localsend_ng`.
- If Android manifest complains about `PACKAGE_REPLACED`, remove that action and keep only `BOOT_COMPLETED` plus `MY_PACKAGE_REPLACED`.
- If Android background activity launch is blocked at runtime after boot, replace the activity-start shim with a native foreground service or WorkManager path. The current shim is intentionally fast, not perfect.
- If Windows build complains about FFI types, inspect `app/lib/util/native/windows_single_instance_lock.dart`; it uses direct `dart:ffi` lookups and only needs `ffi: 2.2.0` for `toNativeUtf16`.
- If generated plugin registrant files are noisy, inspect their diffs before committing. Do not blindly delete or reset unrelated user changes.

## Suggested Next Steps

1. Inspect and clean the working tree:

```powershell
git status --short
git diff --stat
git diff -- app/linux/flutter app/macos/Flutter app/windows/flutter
```

2. Build Android debug APK:

```powershell
cd C:\Users\mac\localsend-ng\app
C:\tools\flutter-3.41.9\bin\flutter.bat build apk --debug
```

Expected output if successful:

```text
build\app\outputs\flutter-apk\app-debug.apk
```

3. If local Windows build is needed:

```powershell
cd C:\Users\mac\localsend-ng\app
C:\tools\flutter-3.41.9\bin\flutter.bat build windows --debug
```

4. If local Dart/Flutter gets painful, use the remote Linux machine:

```powershell
ssh devuser@secure.build
```

Remote notes:
- SSH works.
- Remote had git and Java.
- Remote did not appear to have Flutter/Dart preinstalled during the earlier check.
- Transfer local changes by patch/rsync/commit before building there.

5. Test manually:

- Launch one Windows instance, then try launching another. The second patched instance should exit before binding the server port.
- On Android, open LocalSend NG once and confirm the persistent receive notification appears.
- Reboot Android and confirm LocalSend NG starts itself, briefly backgrounds itself, and leaves receive/discovery running with the persistent notification.
- Send from Mac/Windows to Android. File should save without an open-with picker.
- Send/receive successfully with the same peer 3 times. Confirm the peer appears in Favorites and quick-save-from-favorites applies.
- On a multicast-hostile network, use manual input with `#<last-octet>` and verify both configured port and `53317` are tried.

## Important Caveats

- Nearby/Bluetooth/mic/speaker/narrowband transports were only discussed, not implemented.
- Android Nearby Connections would not solve Mac/Windows/iPhone universally without additional platform-specific transports.
- The current changes deliberately keep the app local-only and avoid hosted relay infrastructure.
