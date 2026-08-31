// AppClipInvocation parses the short-lived "Send with LocalSend" App Clip URL emitted by Android.
// It rejects unconfigured origins and malformed capabilities before hotspot or network work begins.
// Protocol parsing is covered by AppClipProtocolTests; signed invocation remains device-unverified.
import Foundation

/// Strict, nonpersistent parser for the short-lived Android invocation capability.
struct AppClipInvocation: Equatable, Hashable {
    let sessionID: Data
    let sessionKey: Data
    let ssid: String
    let passphrase: String
    let hosts: [String]
    let bootstrapPort: UInt16
    let receiverName: String

    static func configured(url: URL, bundle: Bundle = .main) throws -> AppClipInvocation {
        guard let value = bundle.object(forInfoDictionaryKey: "AppClipInvocationBaseURL") as? String,
              !value.isEmpty, let expected = URL(string: value),
              expected.scheme == "https", expected.host != nil,
              expected.user == nil, expected.password == nil,
              expected.query == nil, expected.fragment == nil,
              url.scheme == expected.scheme, url.host == expected.host,
              url.port == expected.port, url.path == expected.path else {
            throw AppClipInvocationError.configurationMismatch
        }
        return try AppClipInvocation(url: url)
    }

    init(url: URL) throws {
        guard url.absoluteString.utf8.count <= 1_024,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            throw AppClipInvocationError.invalidURL
        }

        var values: [String: String] = [:]
        for item in queryItems {
            guard values[item.name] == nil, let value = item.value else {
                throw AppClipInvocationError.duplicateOrMissingField
            }
            values[item.name] = value
        }
        let expectedFields: Set<String> = ["v", "sid", "k", "ssid", "pass", "hosts", "bp", "name"]
        guard Set(values.keys) == expectedFields,
              values["v"] == "1",
              let sessionID = values["sid"].flatMap(Data.init(base64URL:)), sessionID.count == 16,
              let sessionKey = values["k"].flatMap(Data.init(base64URL:)), sessionKey.count == 32,
              let ssid = values["ssid"], ssid.utf8.count >= 1, ssid.utf8.count <= 32,
              let passphrase = values["pass"], passphrase.utf8.count >= 8, passphrase.utf8.count <= 63,
              let rawHosts = values["hosts"],
              let rawPort = values["bp"], let port = UInt16(rawPort), port != 0,
              let receiverName = values["name"], receiverName.utf8.count >= 1, receiverName.utf8.count <= 80,
              !receiverName.unicodeScalars.contains(where: CharacterSet.controlCharacters.contains) else {
            throw AppClipInvocationError.invalidField
        }
        let hosts = rawHosts.split(separator: ",", omittingEmptySubsequences: false).map(String.init)
        guard hosts.count >= 1, hosts.count <= 4,
              Set(hosts).count == hosts.count,
              hosts.allSatisfy(Self.isCanonicalPrivateIPv4) else {
            throw AppClipInvocationError.invalidHost
        }

        self.sessionID = sessionID
        self.sessionKey = sessionKey
        self.ssid = ssid
        self.passphrase = passphrase
        self.hosts = hosts
        self.bootstrapPort = port
        self.receiverName = receiverName
    }

    static func isCanonicalPrivateIPv4(_ value: String) -> Bool {
        let parts = value.split(separator: ".", omittingEmptySubsequences: false)
        guard parts.count == 4 else { return false }
        var octets: [Int] = []
        for part in parts {
            guard !part.isEmpty, !(part.count > 1 && part.first == "0"),
                  part.utf8.allSatisfy({ (48...57).contains($0) }), let octet = Int(part), (0...255).contains(octet) else {
                return false
            }
            octets.append(octet)
        }
        return octets[0] == 10 ||
            (octets[0] == 172 && (16...31).contains(octets[1])) ||
            (octets[0] == 192 && octets[1] == 168)
    }
}

enum AppClipInvocationError: Error {
    case configurationMismatch
    case invalidURL
    case duplicateOrMissingField
    case invalidField
    case invalidHost
}

extension Data {
    init?(base64URL value: String) {
        guard !value.contains("="), value.utf8.allSatisfy({
            (65...90).contains($0) || (97...122).contains($0) || (48...57).contains($0) || $0 == 45 || $0 == 95
        }) else {
            return nil
        }
        var padded = value.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
        padded += String(repeating: "=", count: (4 - padded.count % 4) % 4)
        guard let decoded = Data(base64Encoded: padded) else { return nil }
        self = decoded
    }

    var base64URL: String {
        base64EncodedString().replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }

    func constantTimeEquals(_ other: Data) -> Bool {
        guard count == other.count else { return false }
        return zip(self, other).reduce(UInt8(0)) { $0 | ($1.0 ^ $1.1) } == 0
    }
}
