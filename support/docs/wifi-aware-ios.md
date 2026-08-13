# iOS Wi-Fi Aware transport

LocalSend can use the iOS 26 Wi-Fi Aware framework as an additional paired
transport. Existing LAN discovery remains active and is the fallback on older
iOS releases, unsupported iPhones, missing entitlements, or transport errors.

## Requirements

- iOS 26 and a device for which
  `WACapabilities.supportedFeatures` contains `wifiAware`.
- The `com.apple.developer.wifi-aware` signing entitlement with both `Publish`
  and `Subscribe` capabilities.
- The `_localsend._tcp` service declared as both `Publishable` and
  `Subscribable` in `WiFiAwareServices`.
- A peer paired through Apple's DeviceDiscoveryUI. The Receive screen exposes
  a Wi-Fi Aware button on supported devices; one device advertises and the
  other chooses it in the system UI.

## Architecture

The native listener and browser use Apple's paired Wi-Fi Aware service. They do
not duplicate the LocalSend protocol. Each Wi-Fi Aware TCP connection is
bridged byte-for-byte to a loopback TCP connection:

- Incoming publisher connections are forwarded to the existing LocalSend
  server.
- Discovered subscriber endpoints receive a stable local loopback listener.
  Dart sends that endpoint to the normal targeted discovery probe, and later
  LocalSend connections to the same endpoint create fresh Wi-Fi Aware streams.

Consequently, LocalSend's existing HTTPS identity, registration, PIN handling,
transfer protocol, and device store remain unchanged.

## Validation limits

The code is conditionally compiled when the iOS 26 WiFiAware and
DeviceDiscoveryUI SDKs are present, so older Xcode toolchains continue to build
the LAN-only application. The iOS transport must still be compiled with Xcode
26, signed by the LocalSend team with the entitlement, and tested between two
supported physical devices before it can leave draft status.

Android interoperability additionally requires an Android radio/firmware that
advertises standards-based Wi-Fi Aware Pairing and the API 37 paired data path.
Android devices without that support cannot pair with iOS, but continue using
their Android passphrase path and LAN fallback.

References:

- <https://developer.apple.com/documentation/wifiaware/adopting-wi-fi-aware>
- <https://developer.apple.com/documentation/wifiaware/connecting-paired-devices>
- <https://developer.apple.com/documentation/devicediscoveryui>
