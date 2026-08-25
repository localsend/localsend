// AppClipProtocolTests locks the Android/iOS invocation, HMAC, and derived-PIN wire contract.
// These tests run in the macOS Xcode workflow; physical NFC, hotspot, and transfer UI are separate gates.
import XCTest
@testable import LocalSendClip

final class AppClipProtocolTests: XCTestCase {
    func testParsesStrictInvocation() throws {
        let sessionID = Data((0..<16).map { UInt8($0) }).base64URL
        let key = Data((0..<32).map { UInt8($0) }).base64URL
        let url = try XCTUnwrap(URL(string: "https://localsend.org/clip?v=1&sid=\(sessionID)&k=\(key)&ssid=Local%20Send&pass=12345678&hosts=192.168.43.1,172.20.10.1&bp=8080&name=Pixel"))
        let invocation = try AppClipInvocation(url: url)
        XCTAssertEqual(invocation.hosts, ["192.168.43.1", "172.20.10.1"])
        XCTAssertEqual(invocation.bootstrapPort, 8080)
    }

    func testRejectsDuplicateAndNonCanonicalHosts() throws {
        let sessionID = Data(repeating: 0, count: 16).base64URL
        let key = Data(repeating: 0, count: 32).base64URL
        XCTAssertThrowsError(try AppClipInvocation(url: XCTUnwrap(URL(string: "https://localsend.org/clip?v=1&v=1&sid=\(sessionID)&k=\(key)&ssid=Local&pass=12345678&hosts=10.0.0.1&bp=8080&name=Pixel"))))
        XCTAssertFalse(AppClipInvocation.isCanonicalPrivateIPv4("192.168.001.1"))
        XCTAssertFalse(AppClipInvocation.isCanonicalPrivateIPv4("8.8.8.8"))
    }

    func testRejectsUnknownFieldsAndControlCharacters() throws {
        let sessionID = Data(repeating: 0, count: 16).base64URL
        let key = Data(repeating: 0, count: 32).base64URL
        let base = "https://localsend.org/clip?v=1&sid=\(sessionID)&k=\(key)&ssid=Local&pass=12345678&hosts=10.0.0.1&bp=8080&name=Pixel"
        XCTAssertThrowsError(try AppClipInvocation(url: XCTUnwrap(URL(string: base + "&extra=1"))))
        XCTAssertThrowsError(try AppClipInvocation(url: XCTUnwrap(URL(string: base.replacingOccurrences(of: "name=Pixel", with: "name=Pixel%0AInjected")))))
    }

    func testMatchesAndroidBootstrapFixture() throws {
        let sessionID = Data((0..<16).map { UInt8($0) }).base64URL
        let keyBytes = Data((0..<32).map { UInt8($0) })
        let url = try XCTUnwrap(URL(string: "https://localsend.org/clip?v=1&sid=\(sessionID)&k=\(keyBytes.base64URL)&ssid=Local&pass=12345678&hosts=10.0.0.1&bp=8080&name=Pixel"))
        let invocation = try AppClipInvocation(url: url)
        let nonce = Data((0..<16).map { UInt8(0xa0 + $0) })
        let body = try AppClipBootstrap.body(invocation: invocation, listenerPort: 8080, issuedAtMillis: 1_700_000_000_000, nonce: nonce)
        XCTAssertEqual(body.map { String(format: "%02x", $0) }.joined(), "01000102030405060708090a0b0c0d0e0f1f900000018bcfe56800a0a1a2a3a4a5a6a7a8a9aaabacadaeaf268b9b48e5b2564018c313fe6e41d2cb2ea801bd9b95fcc4a415f234b8d1db3c")
        XCTAssertEqual(AppClipBootstrap.downloadToken(sessionKey: keyBytes), "pk1G7b8k5hTIZy-kMRJmCLYFNGHb0FdNQhB0DT_o7Pw")
    }
}
