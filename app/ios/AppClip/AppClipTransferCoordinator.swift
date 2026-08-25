// AppClipTransferCoordinator drives the App Clip's "Choose photos and videos" send flow.
// It stages media before leaving internet, joins Android's hotspot, bootstraps, serves LocalSend v2,
// and tears down every temporary/network resource. Unit/static checks exist; device UI is unverified.
import CoreTransferable
import Foundation
import PhotosUI
import SwiftUI
import UniformTypeIdentifiers
import UIKit
import WebKit

@available(iOS 16.0, *)
@MainActor
final class AppClipTransferCoordinator: ObservableObject {
    enum Phase: Equatable {
        case choosing
        case staging
        case joining
        case waitingForReceiver
        case transferring
        case completed
        case failed(String)
    }

    @Published private(set) var phase: Phase = .choosing
    @Published private(set) var progress = 0.0
    @Published private(set) var bootstrapWebView: WKWebView?

    let invocation: AppClipInvocation
    private let bootstrapClient = AppClipBootstrapClient()
    private var task: Task<Void, Never>?
    private var server: AppClipReverseDownloadServer?

    init(invocation: AppClipInvocation) {
        self.invocation = invocation
        bootstrapClient.onWebViewChanged = { [weak self] in self?.bootstrapWebView = $0 }
    }

    var isActive: Bool {
        switch phase {
        case .staging, .joining, .waitingForReceiver, .transferring: return true
        default: return false
        }
    }

    func send(_ picks: [PhotosPickerItem]) {
        guard !isActive, !picks.isEmpty else { return }
        task?.cancel()
        task = Task { await run(picks) }
    }

    func cancel() {
        task?.cancel()
        bootstrapClient.cancel()
        server?.stop()
    }

    func reset() {
        cancel()
        progress = 0
        phase = .choosing
    }

    private func run(_ picks: [PhotosPickerItem]) async {
        phase = .staging
        progress = 0
        UIApplication.shared.isIdleTimerDisabled = true
        var staged: [AppClipStagedFile] = []
        var joined = false
        defer {
            server?.stop()
            server = nil
            bootstrapWebView = nil
            if joined { AppClipHotspot.remove(ssid: invocation.ssid) }
            for file in staged { try? FileManager.default.removeItem(at: file.url) }
            UIApplication.shared.isIdleTimerDisabled = false
        }

        do {
            staged = try await Self.stage(picks)
            try Task.checkCancellation()
            phase = .joining
            try await AppClipHotspot.join(ssid: invocation.ssid, passphrase: invocation.passphrase)
            joined = true
            try Task.checkCancellation()

            let token = AppClipBootstrap.downloadToken(sessionKey: invocation.sessionKey)
            let server = try AppClipReverseDownloadServer(files: staged, alias: UIDevice.current.name.isEmpty ? "iPhone" : UIDevice.current.name, pin: token)
            self.server = server
            server.onProgress = { [weak self] sent, total in
                Task { @MainActor in
                    guard let self else { return }
                    self.phase = .transferring
                    self.progress = total == 0 ? 1 : min(Double(sent) / Double(total), 1)
                }
            }
            let listenerPort = try await server.start()
            let bootstrapBody = try AppClipBootstrap.body(invocation: invocation, listenerPort: listenerPort)
            phase = .waitingForReceiver
            try await bootstrapClient.perform(candidates: try AppClipBootstrap.candidates(invocation: invocation), body: bootstrapBody)
            try await server.waitUntilComplete()
            try Task.checkCancellation()
            progress = 1
            phase = .completed
        } catch is CancellationError {
            phase = .failed(AppClipBootstrapError.cancelled.localizedDescription)
        } catch {
            phase = .failed(error.localizedDescription)
        }
    }

    private static func stage(_ picks: [PhotosPickerItem]) async throws -> [AppClipStagedFile] {
        guard picks.count <= 100 else { throw AppClipStageError.tooManyFiles }
        var staged: [AppClipStagedFile] = []
        do {
            for (index, item) in picks.enumerated() {
                try Task.checkCancellation()
                guard let transferred = try await item.loadTransferable(type: AppClipTransferredFile.self) else {
                    throw AppClipStageError.unavailable
                }
                let attributes = try FileManager.default.attributesOfItem(atPath: transferred.url.path)
                guard let number = attributes[.size] as? NSNumber else { throw AppClipStageError.unavailable }
                let size = number.uint64Value
                guard size <= 4 * 1_024 * 1_024 * 1_024 else {
                    try? FileManager.default.removeItem(at: transferred.url)
                    throw AppClipStageError.fileTooLarge
                }
                let type = item.supportedContentTypes.first ?? .data
                guard type.conforms(to: .image) || type.conforms(to: .movie) else {
                    try? FileManager.default.removeItem(at: transferred.url)
                    throw AppClipStageError.unsupportedType
                }
                let ext = type.preferredFilenameExtension ?? (type.conforms(to: .image) ? "jpg" : "mov")
                let name = String(format: type.conforms(to: .image) ? "IMG_%04d.%@" : "VID_%04d.%@", index + 1, ext)
                staged.append(AppClipStagedFile(
                    id: UUID().uuidString,
                    name: name,
                    size: size,
                    fileType: type.conforms(to: .image) ? "image" : "video",
                    url: transferred.url
                ))
            }
            let total = staged.reduce(UInt64(0)) { $0 + $1.size }
            guard total <= 20 * 1_024 * 1_024 * 1_024 else { throw AppClipStageError.sessionTooLarge }
            return staged
        } catch {
            for file in staged { try? FileManager.default.removeItem(at: file.url) }
            throw error
        }
    }
}

@available(iOS 16.0, *)
private struct AppClipTransferredFile: Transferable {
    let url: URL

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .item) { item in
            SentTransferredFile(item.url)
        } importing: { received in
            let extensionName = received.file.pathExtension
            let destination = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString)
                .appendingPathExtension(extensionName)
            try FileManager.default.copyItem(at: received.file, to: destination)
            return AppClipTransferredFile(url: destination)
        }
    }
}

enum AppClipStageError: Error, LocalizedError {
    case unavailable
    case unsupportedType
    case tooManyFiles
    case fileTooLarge
    case sessionTooLarge

    var errorDescription: String? {
        switch self {
        case .unavailable: return "A selected item could not be prepared."
        case .unsupportedType: return "Only photos and videos can be sent."
        case .tooManyFiles: return "Select no more than 100 items."
        case .fileTooLarge: return "A selected item is larger than 4 GB."
        case .sessionTooLarge: return "The selection is larger than 20 GB."
        }
    }
}
