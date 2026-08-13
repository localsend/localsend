# Wi-Fi Aware transport

LocalSend can use Android Wi-Fi Aware (NAN) as an additional discovery and
network path when no shared LAN is available. The existing multicast and
subnet discovery remain active and are the fallback on unsupported devices or
when the user denies the Nearby Wi-Fi permission.

## Android

Android support requires:

- Android 10 (API 29) or newer. Android 8 introduced Wi-Fi Aware, but the peer
  IPv6 endpoint needed by LocalSend is exposed through `WifiAwareNetworkInfo`
  starting with Android 10.
- Hardware advertising `android.hardware.wifi.aware`.
- Location permission through Android 12L, or Nearby Wi-Fi Devices permission
  on Android 13 and newer. On older releases the system may also require
  Location services to be enabled before Wi-Fi Aware is reported available.

Both LocalSend devices publish and subscribe to the `localsend` service. The
publisher advertises a versioned, bounded service-info record containing its
HTTP server port, HTTP/HTTPS mode, and an ephemeral Wi-Fi Aware passphrase.
After discovery, the subscriber requests a data path and reports the peer's
scoped link-local IPv6 address to Dart. The Rust discovery layer then performs
the normal LocalSend register request. A peer is not shown until that request
succeeds, and HTTPS continues to use LocalSend's mutual-certificate identity.

Wi-Fi Aware therefore changes only how a reachable IP path is obtained. File
transfer, authentication, pins, protocol negotiation, and the LAN path are not
duplicated in the platform integration.

Physical devices are required for end-to-end validation; Android emulators do
not provide a Wi-Fi Aware radio.

## Apple platforms

Apple's Wi-Fi Aware framework is not an interchangeable implementation of
Android's open publish/subscribe flow. The public API requires:

- the Apple-granted `com.apple.developer.wifi-aware` entitlement;
- services declared in `WiFiAwareServices`;
- `WAPairedDevice` identities created through the system accessory-pairing
  flow before a browser or listener can connect.

LocalSend currently has no accessory identity or pairing enrollment, and the
entitlement cannot be enabled or tested by an unaffiliated fork. Adding the
entitlement or `Info.plist` declarations alone would either fail signing or
leave the app without eligible peers. For that reason this change does not
claim iOS peer support. An Apple implementation needs an approved entitlement
and a product decision for a user-visible pairing flow before it can share the
transport abstraction described above.

Relevant platform documentation:

- <https://developer.android.com/develop/connectivity/wifi/wifi-aware>
- <https://developer.apple.com/documentation/wifiaware/adopting-wi-fi-aware>
- <https://developer.apple.com/documentation/wifiaware/connecting-paired-devices>
