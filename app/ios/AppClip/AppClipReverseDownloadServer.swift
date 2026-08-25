// AppClipReverseDownloadServer is the bounded, Wi-Fi-only LocalSend v2 sender used by the App Clip.
// Android prepares and downloads staged media with a derived PIN after authenticated bootstrap.
// Protocol structure is statically reviewed; Xcode compilation and physical transfer remain unverified.
import Foundation
import Network

struct AppClipStagedFile {
    let id: String
    let name: String
    let size: UInt64
    let fileType: String
    let url: URL
}

final class AppClipReverseDownloadServer {
    private let files: [String: AppClipStagedFile]
    private let alias: String
    private let pin: Data
    private let sessionID = UUID().uuidString
    private let listener: NWListener
    private let queue = DispatchQueue(label: "org.localsend.appclip.http")
    private let lock = NSLock()
    private var acceptedIP: String?
    private var inFlight: Set<String> = []
    private var progress: [String: UInt64] = [:]
    private var completed: Set<String> = []
    private var connections: [ObjectIdentifier: NWConnection] = [:]
    private var requestCount = 0
    private var lastProgressNotification: UInt64 = 0
    private var stopped = false
    private var startContinuation: CheckedContinuation<UInt16, Error>?
    private var completionContinuation: CheckedContinuation<Void, Error>?
    private var completionResult: Result<Void, Error>?
    var onProgress: ((UInt64, UInt64) -> Void)?

    init(files: [AppClipStagedFile], alias: String, pin: String) throws {
        guard !files.isEmpty, files.count <= 100,
              Set(files.map(\.id)).count == files.count else {
            throw AppClipServerError.invalidFiles
        }
        self.files = Dictionary(uniqueKeysWithValues: files.map { ($0.id, $0) })
        self.alias = alias
        self.pin = Data(pin.utf8)
        let parameters = NWParameters.tcp
        parameters.requiredInterfaceType = .wifi
        self.listener = try NWListener(using: parameters, on: .any)
    }

    var totalBytes: UInt64 { files.values.reduce(0) { $0 + $1.size } }

    func start() async throws -> UInt16 {
        try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                lock.lock()
                guard !stopped else {
                    lock.unlock()
                    continuation.resume(throwing: AppClipServerError.cancelled)
                    return
                }
                startContinuation = continuation
                lock.unlock()
                listener.stateUpdateHandler = { [weak self] state in self?.handleListenerState(state) }
                listener.newConnectionHandler = { [weak self] connection in self?.accept(connection) }
                listener.start(queue: queue)
            }
        } onCancel: { [weak self] in self?.stop(error: AppClipServerError.cancelled) }
    }

    func waitUntilComplete() async throws {
        try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                lock.lock()
                if let result = completionResult {
                    lock.unlock()
                    continuation.resume(with: result)
                } else {
                    completionContinuation = continuation
                    lock.unlock()
                }
            }
        } onCancel: { [weak self] in self?.stop(error: AppClipServerError.cancelled) }
    }

    func stop(error: Error = AppClipServerError.cancelled) {
        let start: CheckedContinuation<UInt16, Error>?
        let completion: CheckedContinuation<Void, Error>?
        let activeConnections: [NWConnection]
        lock.lock()
        guard !stopped else { lock.unlock(); return }
        stopped = true
        completionResult = .failure(error)
        start = startContinuation
        completion = completionContinuation
        startContinuation = nil
        completionContinuation = nil
        activeConnections = Array(connections.values)
        connections.removeAll()
        lock.unlock()
        listener.cancel()
        activeConnections.forEach { $0.cancel() }
        start?.resume(throwing: error)
        completion?.resume(throwing: error)
    }

    private func handleListenerState(_ state: NWListener.State) {
        switch state {
        case .ready:
            guard let rawPort = listener.port?.rawValue else { stop(error: AppClipServerError.listenerFailed); return }
            lock.lock()
            let continuation = startContinuation
            startContinuation = nil
            lock.unlock()
            continuation?.resume(returning: rawPort)
        case .failed(let error): stop(error: error)
        case .cancelled: break
        default: break
        }
    }

    private func accept(_ connection: NWConnection) {
        lock.lock()
        requestCount += 1
        let allowed = !stopped && requestCount <= 205
        if allowed { connections[ObjectIdentifier(connection)] = connection }
        lock.unlock()
        guard allowed else { connection.cancel(); return }
        connection.start(queue: queue)
        Task {
            defer {
                self.lock.lock()
                self.connections.removeValue(forKey: ObjectIdentifier(connection))
                self.lock.unlock()
                connection.cancel()
            }
            do { try await handle(connection) }
            catch {
                self.lock.lock()
                let canReply = !self.stopped
                self.lock.unlock()
                if canReply { try? await sendResponse(connection, status: 400, reason: "Bad Request", body: Data(), contentType: nil) }
            }
        }
    }

    private func handle(_ connection: NWConnection) async throws {
        let request = try await readRequest(connection)
        guard let remoteIP = Self.remoteIPv4(connection.endpoint) else { throw AppClipServerError.forbidden }
        let components = try Self.parseTarget(request.target)
        let path = components.path
        let query = try Self.uniqueQuery(components)

        if request.method == "POST" && path == "/api/localsend/v2/prepare-download" {
            guard request.bodyBytes == 0 else { throw AppClipServerError.invalidRequest }
            let supplied = Data((query["pin"] ?? "").utf8)
            guard supplied.constantTimeEquals(pin) else { return try await sendResponse(connection, status: 403, reason: "Forbidden", body: Data(), contentType: nil) }
            guard authorize(remoteIP: remoteIP, requestedSession: query["sessionId"]) else {
                return try await sendResponse(connection, status: 403, reason: "Forbidden", body: Data(), contentType: nil)
            }
            let body = try manifestJSON()
            return try await sendResponse(connection, status: 200, reason: "OK", body: body, contentType: "application/json")
        }

        if request.method == "GET" && path == "/api/localsend/v2/download" {
            guard request.bodyBytes == 0,
                  validate(remoteIP: remoteIP, session: query["sessionId"]),
                  let fileID = query["fileId"], let file = beginFile(fileID) else {
                return try await sendResponse(connection, status: 403, reason: "Forbidden", body: Data(), contentType: nil)
            }
            do {
                try await sendFile(connection, file: file)
                finishFile(file)
            } catch {
                abandonFile(file.id)
                connection.cancel()
            }
            return
        }

        if request.method == "POST" && path == "/api/localsend/v2/cancel" {
            guard validate(remoteIP: remoteIP, session: query["sessionId"]) else {
                return try await sendResponse(connection, status: 403, reason: "Forbidden", body: Data(), contentType: nil)
            }
            try await sendResponse(connection, status: 204, reason: "No Content", body: Data(), contentType: nil)
            stop(error: AppClipServerError.cancelled)
            return
        }

        try await sendResponse(connection, status: 404, reason: "Not Found", body: Data(), contentType: nil)
    }

    private func authorize(remoteIP: String, requestedSession: String?) -> Bool {
        lock.lock(); defer { lock.unlock() }
        if let acceptedIP { return acceptedIP == remoteIP && (requestedSession == nil || requestedSession == sessionID) }
        guard requestedSession == nil else { return false }
        acceptedIP = remoteIP
        return true
    }

    private func validate(remoteIP: String, session: String?) -> Bool {
        lock.lock(); defer { lock.unlock() }
        return !stopped && acceptedIP == remoteIP && session == sessionID
    }

    private func beginFile(_ id: String) -> AppClipStagedFile? {
        lock.lock(); defer { lock.unlock() }
        guard !stopped, !inFlight.contains(id), !completed.contains(id), let file = files[id] else { return nil }
        inFlight.insert(id)
        return file
    }

    private func abandonFile(_ id: String) {
        lock.lock(); inFlight.remove(id); lock.unlock()
    }

    private func finishFile(_ file: AppClipStagedFile) {
        var continuation: CheckedContinuation<Void, Error>?
        lock.lock()
        inFlight.remove(file.id)
        completed.insert(file.id)
        progress[file.id] = file.size
        if completed.count == files.count && completionResult == nil {
            completionResult = .success(())
            continuation = completionContinuation
            completionContinuation = nil
        }
        lock.unlock()
        emitProgress(fileID: file.id, bytes: file.size)
        continuation?.resume()
    }

    private func emitProgress(fileID: String, bytes: UInt64) {
        let callback: ((UInt64, UInt64) -> Void)?
        let shouldNotify: Bool
        lock.lock()
        progress[fileID] = min(bytes, files[fileID]?.size ?? 0)
        let sent = progress.values.reduce(0, +)
        let total = totalBytes
        shouldNotify = sent == total || sent >= lastProgressNotification + 1_048_576
        if shouldNotify { lastProgressNotification = sent }
        callback = onProgress
        lock.unlock()
        if shouldNotify { callback?(sent, total) }
    }

    private func manifestJSON() throws -> Data {
        let fileMap = Dictionary(uniqueKeysWithValues: files.values.map { file in
            (file.id, [
                "id": file.id,
                "fileName": file.name,
                "size": NSNumber(value: file.size),
                "fileType": file.fileType,
            ] as [String: Any])
        })
        let response: [String: Any] = [
            "info": [
                "alias": alias,
                "version": "2.2",
                "deviceModel": "iPhone",
                "deviceType": "mobile",
                "fingerprint": "appclip-\(sessionID)",
                "download": true,
            ],
            "sessionId": sessionID,
            "files": fileMap,
        ]
        return try JSONSerialization.data(withJSONObject: response, options: [.sortedKeys])
    }

    private func sendFile(_ connection: NWConnection, file: AppClipStagedFile) async throws {
        let header = "HTTP/1.1 200 OK\r\nContent-Type: application/octet-stream\r\nContent-Length: \(file.size)\r\nConnection: close\r\n\r\n"
        try await send(connection, Data(header.utf8), complete: file.size == 0)
        guard file.size > 0 else { return }
        let handle = try FileHandle(forReadingFrom: file.url)
        defer { try? handle.close() }
        var sent: UInt64 = 0
        while let chunk = try handle.read(upToCount: 64 * 1_024), !chunk.isEmpty {
            sent += UInt64(chunk.count)
            guard sent <= file.size else { throw AppClipServerError.fileChanged }
            try await send(connection, chunk, complete: sent == file.size)
            emitProgress(fileID: file.id, bytes: sent)
        }
        guard sent == file.size else { throw AppClipServerError.fileChanged }
    }

    private func sendResponse(_ connection: NWConnection, status: Int, reason: String, body: Data, contentType: String?) async throws {
        var header = "HTTP/1.1 \(status) \(reason)\r\nContent-Length: \(body.count)\r\nConnection: close\r\n"
        if let contentType { header += "Content-Type: \(contentType)\r\n" }
        header += "\r\n"
        var data = Data(header.utf8)
        data.append(body)
        try await send(connection, data, complete: true)
    }

    private func send(_ connection: NWConnection, _ data: Data, complete: Bool) async throws {
        try await withCheckedThrowingContinuation { continuation in
            connection.send(content: data, contentContext: .defaultMessage, isComplete: complete, completion: .contentProcessed { error in
                if let error { continuation.resume(throwing: error) } else { continuation.resume() }
            })
        }
    }

    private func readRequest(_ connection: NWConnection) async throws -> HTTPRequest {
        var received = Data()
        let marker = Data("\r\n\r\n".utf8)
        while received.range(of: marker) == nil {
            let chunk = try await receive(connection)
            received.append(chunk)
            guard received.count <= 8_192 else { throw AppClipServerError.invalidRequest }
        }
        guard let boundary = received.range(of: marker), boundary.upperBound == received.count,
              let text = String(data: received[..<boundary.lowerBound], encoding: .ascii) else {
            throw AppClipServerError.invalidRequest
        }
        let lines = text.components(separatedBy: "\r\n")
        guard let first = lines.first else { throw AppClipServerError.invalidRequest }
        let requestParts = first.split(separator: " ")
        guard requestParts.count == 3, requestParts[2] == "HTTP/1.1" else { throw AppClipServerError.invalidRequest }
        var headers: [String: String] = [:]
        for line in lines.dropFirst() {
            guard let separator = line.firstIndex(of: ":") else { throw AppClipServerError.invalidRequest }
            let name = String(line[..<separator]).trimmingCharacters(in: .whitespaces).lowercased()
            guard !name.isEmpty, headers[name] == nil else { throw AppClipServerError.invalidRequest }
            headers[name] = String(line[line.index(after: separator)...]).trimmingCharacters(in: .whitespaces)
        }
        let bodyBytes: Int
        if let value = headers["content-length"] {
            guard let parsed = Int(value) else { throw AppClipServerError.invalidRequest }
            bodyBytes = parsed
        } else {
            bodyBytes = 0
        }
        guard headers["transfer-encoding"] == nil, bodyBytes == 0 else {
            throw AppClipServerError.invalidRequest
        }
        return HTTPRequest(method: String(requestParts[0]), target: String(requestParts[1]), bodyBytes: bodyBytes)
    }

    private func receive(_ connection: NWConnection) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            connection.receive(minimumIncompleteLength: 1, maximumLength: 4_096) { data, _, complete, error in
                if let error { continuation.resume(throwing: error) }
                else if let data, !data.isEmpty { continuation.resume(returning: data) }
                else if complete { continuation.resume(throwing: AppClipServerError.invalidRequest) }
                else { continuation.resume(throwing: AppClipServerError.invalidRequest) }
            }
        }
    }

    private static func parseTarget(_ target: String) throws -> URLComponents {
        guard target.utf8.count <= 2_048, target.first == "/",
              let components = URLComponents(string: "http://localhost\(target)"),
              components.fragment == nil else {
            throw AppClipServerError.invalidRequest
        }
        return components
    }

    private static func uniqueQuery(_ components: URLComponents) throws -> [String: String] {
        var values: [String: String] = [:]
        for item in components.queryItems ?? [] {
            guard values[item.name] == nil, let value = item.value else { throw AppClipServerError.invalidRequest }
            values[item.name] = value
        }
        return values
    }

    private static func remoteIPv4(_ endpoint: NWEndpoint) -> String? {
        guard case .hostPort(let host, _) = endpoint else { return nil }
        let value = String(describing: host)
        return AppClipInvocation.isCanonicalPrivateIPv4(value) ? value : nil
    }
}

private struct HTTPRequest {
    let method: String
    let target: String
    let bodyBytes: Int
}

enum AppClipServerError: Error, LocalizedError {
    case invalidFiles
    case listenerFailed
    case invalidRequest
    case forbidden
    case fileChanged
    case cancelled

    var errorDescription: String? {
        switch self {
        case .invalidFiles: return "The selected files cannot be shared."
        case .listenerFailed: return "The iPhone could not open a direct connection."
        case .invalidRequest, .forbidden: return "The receiver sent an invalid request."
        case .fileChanged: return "A selected file changed during transfer."
        case .cancelled: return "The transfer was cancelled."
        }
    }
}
