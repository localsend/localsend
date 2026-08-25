// AppClipBootstrap authenticates the App Clip's private callback to Android's "Receive from App Clip" host.
// AppClipBootstrapClient performs the exact-origin, nonpersistent WebKit POST after joining the hotspot.
// The byte fixture is unit-tested; WebKit-on-hotspot behavior remains signed-device-unverified.
import CryptoKit
import Foundation
import Security
import SwiftUI
import WebKit

enum AppClipBootstrap {
    static let path = "/api/localsend/app-clip/v1/bootstrap"

    static func body(
        invocation: AppClipInvocation,
        listenerPort: UInt16,
        issuedAtMillis: UInt64,
        nonce: Data
    ) throws -> Data {
        guard listenerPort != 0, nonce.count == 16 else { throw AppClipBootstrapError.invalidInput }
        var signed = Data([1])
        signed.append(invocation.sessionID)
        signed.append(contentsOf: [UInt8(listenerPort >> 8), UInt8(listenerPort & 0xff)])
        signed.append(contentsOf: (0..<8).reversed().map { UInt8((issuedAtMillis >> UInt64($0 * 8)) & 0xff) })
        signed.append(nonce)
        let mac = HMAC<SHA256>.authenticationCode(for: signed, using: SymmetricKey(data: invocation.sessionKey))
        signed.append(contentsOf: mac)
        return signed
    }

    static func body(invocation: AppClipInvocation, listenerPort: UInt16) throws -> Data {
        var nonce = Data(count: 16)
        let status = nonce.withUnsafeMutableBytes { bytes in
            guard let address = bytes.baseAddress else { return errSecParam }
            return SecRandomCopyBytes(kSecRandomDefault, 16, address)
        }
        guard status == errSecSuccess else { throw AppClipBootstrapError.randomFailure }
        return try body(
            invocation: invocation,
            listenerPort: listenerPort,
            issuedAtMillis: UInt64(Date().timeIntervalSince1970 * 1_000),
            nonce: nonce
        )
    }

    static func downloadToken(sessionKey: Data) -> String {
        let label = Data("localsend-app-clip-download-v1".utf8)
        return Data(HMAC<SHA256>.authenticationCode(for: label, using: SymmetricKey(data: sessionKey))).base64URL
    }

    static func candidates(invocation: AppClipInvocation) throws -> [URL] {
        try invocation.hosts.map { host in
            var components = URLComponents()
            components.scheme = "http"
            components.host = host
            components.port = Int(invocation.bootstrapPort)
            components.path = path
            guard let url = components.url else { throw AppClipBootstrapError.invalidInput }
            return url
        }
    }
}

enum AppClipBootstrapError: Error, LocalizedError {
    case invalidInput
    case randomFailure
    case busy
    case rejected
    case cancelled

    var errorDescription: String? {
        switch self {
        case .invalidInput: return "The direct-connection invitation is invalid."
        case .randomFailure: return "Secure session setup failed."
        case .busy: return "A direct connection is already starting."
        case .rejected: return "The Android phone did not accept the direct connection."
        case .cancelled: return "The transfer was cancelled."
        }
    }
}

@MainActor
final class AppClipBootstrapClient: NSObject, WKNavigationDelegate {
    var onWebViewChanged: ((WKWebView?) -> Void)?

    private var candidates: [URL] = []
    private var body = Data()
    private var index = 0
    private var continuation: CheckedContinuation<Void, Error>?
    private var webView: WKWebView?

    func perform(candidates: [URL], body: Data) async throws {
        guard continuation == nil else { throw AppClipBootstrapError.busy }
        try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                self.candidates = candidates
                self.body = body
                self.index = 0
                self.continuation = continuation
                self.loadCurrentCandidate()
            }
        } onCancel: {
            Task { @MainActor in self.cancel() }
        }
    }

    func cancel() {
        finish(.failure(AppClipBootstrapError.cancelled))
    }

    private func loadCurrentCandidate() {
        guard continuation != nil else { return }
        guard index < candidates.count else {
            finish(.failure(AppClipBootstrapError.rejected))
            return
        }
        webView?.stopLoading()
        webView?.navigationDelegate = nil
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .nonPersistent()
        let next = WKWebView(frame: .zero, configuration: configuration)
        next.navigationDelegate = self
        webView = next
        onWebViewChanged?(next)

        var request = URLRequest(url: candidates[index], cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 8)
        request.httpMethod = "POST"
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        next.load(request)
    }

    private func advance(_ current: WKWebView) {
        guard current === webView, continuation != nil else { return }
        current.stopLoading()
        current.navigationDelegate = nil
        index += 1
        loadCurrentCandidate()
    }

    private func finish(_ result: Result<Void, Error>) {
        guard let continuation else { return }
        self.continuation = nil
        webView?.stopLoading()
        webView?.navigationDelegate = nil
        webView = nil
        onWebViewChanged?(nil)
        candidates = []
        body.removeAll(keepingCapacity: false)
        switch result {
        case .success: continuation.resume()
        case .failure(let error): continuation.resume(throwing: error)
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard webView === self.webView,
              action.targetFrame?.isMainFrame == true,
              action.request.url == candidates[safe: index] else {
            decisionHandler(.cancel)
            if webView === self.webView { advance(webView) }
            return
        }
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, decidePolicyFor response: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard webView === self.webView,
              response.isForMainFrame,
              response.response.url == candidates[safe: index],
              let http = response.response as? HTTPURLResponse,
              http.statusCode == 202 else {
            decisionHandler(.cancel)
            if webView === self.webView { advance(webView) }
            return
        }
        decisionHandler(.cancel)
        finish(.success(()))
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) { advance(webView) }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { advance(webView) }
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.cancelAuthenticationChallenge, nil)
        advance(webView)
    }
}

struct AppClipBootstrapWebView: UIViewRepresentable {
    let webView: WKWebView
    func makeUIView(context: Context) -> WKWebView { webView }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

private extension Collection {
    subscript(safe index: Index) -> Element? { indices.contains(index) ? self[index] : nil }
}
