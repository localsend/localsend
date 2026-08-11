# AGENTS.md

LocalSend disallows AI generated contributions unless:

- they are bug fixes or
- very small or
- you prove your expertise in your field

This file provides guidance to LLMs when working with code in this repository.

## Repository layout

This is a multi-language monorepo: a Flutter app on top of a Rust protocol implementation.

| Path                           | What it is                                                                                                                                                  |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `app/`                         | The Flutter app (`localsend_app`). UI, providers, persistence, platform channels.                                                                           |
| `packages/localsend_isolates/` | Dart isolate layer + `flutter_rust_bridge` (FRB) bindings. Owns `rust/` (the Flutter plugin crate `rust_lib_localsend_app`) and `rust_builder/` (cargokit). |
| `packages/core/`               | Rust crate `localsend`: protocol, HTTP server/client, crypto, WebRTC. No Flutter dependency.                                                                |
| `packages/typed_isolates/`     | Small standalone package wrapping Dart `Isolate` with typed send/receive channels.                                                                          |
| `server/`                      | Axum WebSocket signaling server for WebRTC (`/v1/ws`). Deployed separately, see `server/Dockerfile`.                                                        |
| `cli/`                         | Rust CLI crate (`localsend-cli`): interactive terminal client on top of `packages/core` (v2 HTTP + multicast).                                              |
| `support/scripts/`             | Release/packaging scripts (per-platform builds, MSIX, Inno Setup, FOSS stripping).                                                                          |

The four Rust crates (`packages/core`, `packages/localsend_isolates/rust`, `server`, `cli`) form a single Cargo workspace rooted at the repository root: one shared `Cargo.lock` and `target/`, and `[profile.*]` settings live only in the root `Cargo.toml` (member profiles would be ignored). Cargokit still builds the plugin crate into its own target dir during Flutter builds.

Dependency direction: `app` → `localsend_isolates` → (`typed_isolates`, `rust_lib_localsend_app` → `localsend` core).
The app depends on **only** `localsend_isolates` — not on `flutter_rust_bridge`, `typed_isolates`, or the plugin crate directly.

## Flutter version

Pinned to the version in `.fvmrc` (also mirrored in `.github/workflows/ci.yml` and `app/pubspec.yaml`, plus the `support/submodules/flutter` git submodule). Use **`fvm flutter` / `fvm dart`** instead of the system-wide toolchain.
Bumping the version means updating all four places — see the "Bump Flutter" section of `CONTRIBUTING.md`.

## Commands

Run from `app/` unless stated otherwise.

```bash
fvm flutter pub get
fvm dart run build_runner build  # dart_mappable, freezed, flutter_gen, mockito
fvm dart run slang               # i18n codegen (slang_build_runner is disabled in build.yaml)
fvm flutter run
```

Checks (what CI runs):

```bash
fvm dart format --set-exit-if-changed lib test   # CI deletes lib/gen first; generated code is not format-checked
fvm flutter analyze
fvm flutter test
fvm flutter test test/unit/util/security_helper_test.dart          # single file
fvm flutter test --plain-name 'some test name'                     # single test
```

Formatting is **150 columns** (`page_width: 150` in `analysis_options.yaml`, `trailing_commas: preserve`). Any tool that reformats generated Dart at 80 columns creates pure noise — reformat with `fvm dart format` afterwards.

Rust:

```bash
cargo test --features full       # in packages/core — see "Core crate features" below
cargo clippy --features full
cargo check                      # in packages/localsend_isolates/rust, server, cli
```

FRB codegen — run from `packages/localsend_isolates/`:

```bash
flutter_rust_bridge_codegen generate    # config in flutter_rust_bridge.yaml (dart_format_line_length: 150)
```

Codegen has a habit of rewriting `app/test/mocks.mocks.dart` at 80 columns; revert that file if it shows up in the diff.

`packages/localsend_isolates` has its own `build.yaml`/`pubspec.yaml` and needs its own `pub get` + `build_runner` run when its models change. CI additionally runs `flutter pub get` in `packages/localsend_isolates/rust_builder/cargokit/build_tool`.

## Core crate features

`packages/core` gates almost everything behind Cargo features (`crypto`, `http`, `multicast`, `webrtc`, `webrtc-signaling`, `full`), and `default = []`. **Always build and test it with `--features full`.** A bare `cargo check`/`cargo build` fails because modules are declared unconditionally while their dependencies are optional — that is pre-existing and expected, not a regression.

## Architecture

### State management

Refena (`refena_flutter`), not Riverpod. Providers live in `app/lib/provider/`; `NotifierProvider` for plain state, `ReduxProvider` + dispatched action classes for anything the isolate layer touches. `app/lib/config/init.dart` (`preInit`) is the bootstrap: it initialises logging, `RustLib.init()`, persistence, the isolate container, tray/window, and returns the `RefenaContainer` that `main.dart` mounts.

Models are `dart_mappable` (`@MappableClass`, `.mapper.dart` parts) with renamed methods — `fromJson`/`toJson` are the **Map** converters and `deserialize`/`serialize` are the string ones (configured in both `build.yaml` files). Freezed is used for FRB-adjacent unions.

### Isolates

The heavy networking never runs on the main isolate. `packages/localsend_isolates/lib/src/isolate/`:

- `parent/parent_isolate_provider.dart` — `ParentIsolateState` holds one `IsolateConnector` per child (http scan discovery, multicast discovery, http upload, http server) plus a `SyncState` mirrored into every child. `IsolateSetupAction` spawns them.
- `parent/actions.dart`, `parent/actions_sync.dart` — the only supported way for the app to talk to the children.
- `child/*_isolate.dart` — child entry points; they translate typed task messages into calls on `lib/src/task/`.
- `lib/src/task/` — pure helpers only; **isolate logic is prohibited there** (see its `README.md`).

State that children need (alias, port, protocol, whether the server runs, whether web send is on) is pushed via `IsolateSyncServerStateAction`. Children read `syncState` at start, so sync **before** starting the server.

### Networking (Rust)

The HTTP server and client are Rust, not Dart. `packages/core/src/http/server/` implements protocol v2 (v1 endpoints are not served) plus the "web send" download flow (`server/web.rs`) and an internal `show` endpoint used to foreground an already-running instance.

Integration is channel-based: `start_with_port` takes a `ServerConfigV2 { pin, event_tx, web_send }` and emits `ServerEventV2` events (`Register`, `PrepareUpload` with a `decision_tx` oneshot, `FileUpload` with a byte stream + `result_tx`, `PrepareDownload`, `SessionEnd`, `PrepareUploadAborted`, `CancelReceived`). Only **one upload session is active at a time**; cancellation safety comes from drop guards (`PendingSessionGuard`, `UploadGuard`, `PendingWebSessionGuard`). There is deliberately no `auto_accept` in core — the app auto-accepts by answering `decision_tx` immediately. New server→app interactions should extend `ServerEventV2` rather than adding side channels.

The FRB layer (`packages/localsend_isolates/rust/src/api/server.rs`) exposes `start_server` + an opaque `RsHttpServer` whose `listen` merges the v2, web-send and internal channels into one `RsServerEvent` stream; responder oneshots stay on the Rust side. On the Dart side `child/server_isolate.dart` turns those into `HttpServerEvent`s, which `app/lib/provider/network/server/server_provider.dart` routes to `ReceiveController` / `SendController` — these are **event handlers, not route handlers**.

Save targets are decided in Dart (`prepareFileSaveTarget`) and written by Rust: a path, or an Android SAF file descriptor obtained through the `org.localsend.localsend_app/localsend` method channel. Gallery saves go through a cache file first.

Server event `ip`s are `PeerIp` (IP + IPv6 scope): a link-local peer renders as `fe80::1%3`, which the HTTP client accepts back as a host, so event ips stay dialable.

TLS uses per-device on-the-fly certificates with **mandatory client certificates** (optional while the web pages are served, so browsers can connect); the peer identity is the uppercase-hex SHA-256 of the client cert DER, and `Register` is simply not emitted when a payload's claimed fingerprint disagrees with the cert. Prefer `event.certFingerprint ?? event.info.fingerprint` — the payload fallback only exists for encryption-off mode.

Both the receive pin and the web-send pin are fixed at server start, so changing either restarts the server.

Web assets for the browser download page are embedded from `packages/core/assets/web/`.

### Multicast discovery (Rust)

`packages/core/src/multicast/` (feature `multicast`, independent of `http`) implements UDP multicast discovery for protocol v2.2 — v1 messages are not parsed.
Integration mirrors the HTTP server: `multicast::start` takes a `MulticastConfig { group, group_v6, port, interface_filter, device, event_tx }` and emits `MulticastEvent::Discovered { ip, message }`; the returned `MulticastHandle` offers `announce` (the announcement burst) and `wait_stopped`.

UDP is **announce-only**: responses go back over HTTP as a unicast register request to the announcing device.

One socket is bound per interface IPv4 address (`SO_REUSEPORT`/`SO_REUSEADDR` + `IP_MULTICAST_IF`), because a single socket only sends on one interface. Multicast loopback stays on so that instances on one host see each other; own messages are dropped by fingerprint. IPv6 is a LocalSend extension (group `ff12::fd3a:e420`, `DEFAULT_MULTICAST_GROUP_V6`), enabled by setting `group_v6`: one `IPV6_V6ONLY` socket per interface, joined by interface index. `Discovered` carries the source's scope ID (interface index), which link-local IPv6 sources need for the HTTP answer.

### i18n

Slang, source files in `app/assets/i18n/` (`<locale>.json` plus `_missing_translations_<locale>.json`), generated output in `app/lib/gen/`. Translations are managed on Weblate; fields prefixed with `@` are metadata for translators and are not used by the app. `app/test/unit/i18n_test.dart` guards the locale set.

### FOSS build

`in_app_purchase` and the donation UI are stripped for F-Droid by `support/scripts/remove_proprietary_dependencies.sh`, which relies on the `# [FOSS_REMOVE]` pubspec marker and `// [FOSS_REMOVE_START]` / `// [FOSS_REMOVE_END]` comment pairs. Preserve those markers when editing `lib/config/init.dart`, `lib/pages/donation/*`, or `lib/provider/purchase_provider.dart`.

## Release notes

`app/pubspec.yaml`'s version must match `#define MyAppVersion` in `support/scripts/compile_windows_exe-inno.iss` and the `version` in `cli/Cargo.toml` (the CLI prints it in its start banner) — CI fails on a mismatch. Platform build commands and release steps are documented in `README.md` ("Building") and `CONTRIBUTING.md` ("Release").