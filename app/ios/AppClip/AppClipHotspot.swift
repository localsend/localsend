// AppClipHotspot owns the ephemeral Wi-Fi join used by the "Send with LocalSend" App Clip flow.
// The transfer coordinator joins once and always removes the configuration during teardown.
// The API contract is source-reviewed; the approval sheet and physical join remain device-unverified.
import Foundation
import NetworkExtension

enum AppClipHotspot {
    static func join(ssid: String, passphrase: String) async throws {
        let configuration = NEHotspotConfiguration(ssid: ssid, passphrase: passphrase, isWEP: false)
        configuration.joinOnce = true
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            NEHotspotConfigurationManager.shared.apply(configuration) { error in
                if let error = error as NSError?,
                   error.domain == NEHotspotConfigurationErrorDomain,
                   error.code == NEHotspotConfigurationError.alreadyAssociated.rawValue {
                    continuation.resume()
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }

    static func remove(ssid: String) {
        NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: ssid)
    }
}
