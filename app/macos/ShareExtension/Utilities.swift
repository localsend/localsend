import SwiftUI
import UniformTypeIdentifiers


extension Sequence where Element: Sequence {
    func flatten() -> [Element.Element] {
        // TODO: Make this `flatMap(\.self)` when https://github.com/apple/swift/issues/55343 is fixed.
        flatMap { $0 }
    }
}

struct TextContent {
    var title: String?
    var body: String?
}

extension NSExtensionContext {
    var inputItemsTyped: [NSExtensionItem] { inputItems as! [NSExtensionItem] }
    
    var attachments: [NSItemProvider] {
        inputItemsTyped.compactMap(\.attachments).flatten()
    }
    
    var textContent: TextContent {
        TextContent(
            title: inputItemsTyped.first?.attributedTitle?.string,
            body: inputItemsTyped.first?.attributedContentText?.string
        )
    }
}


// Strongly-typed versions of some of the methods.
extension NSItemProvider {
    func hasItemConforming(to contentType: UTType) -> Bool {
        hasItemConformingToTypeIdentifier(contentType.identifier)
    }
}


extension NSError {
    static let userCancelled = NSError(domain: NSCocoaErrorDomain, code: NSUserCancelledError, userInfo: nil)
}


extension NSExtensionContext {
    func cancel() {
        cancelRequest(withError: NSError.userCancelled)
    }
}

@MainActor
extension NSItemProvider {
    func loadItem<T>(ofClass cls: T.Type) async throws -> T where T: NSItemProviderReading {
        try await withCheckedThrowingContinuation { continuation in
            _ = self.loadObject(ofClass: cls) { (item, error) in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let item = item as? T {
                    continuation.resume(returning: item)
                } else {
                    continuation.resume(throwing: NSError(domain: "ItemProviderError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load item of expected type"]))
                }
            }
        }
    }
}


@MainActor
class ExtensionController: NSViewController {
    @MainActor
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        Task { @MainActor in // Not sure if this is needed, but added just in case.
            do {
                extensionContext!.completeRequest(
                    returningItems: try await run(extensionContext!),
                    completionHandler: nil
                )
            } catch {
                extensionContext!.cancelRequest(withError: error)
            }
        }
    }
    
    func run(_ context: NSExtensionContext) async throws -> [NSExtensionItem] { [] }
}

extension NSItemProvider: @unchecked Sendable {}

fileprivate func isAppRunning(at url: URL) -> Bool {
    NSWorkspace.shared.runningApplications.contains { $0.bundleURL == url }
}

func launchAppIfNeeded(appURL: URL) {
    guard !isAppRunning(at: appURL) else { return }
    NSWorkspace.shared.openApplication(at: appURL, configuration: NSWorkspace.OpenConfiguration()) { (app, error) in
        if let error = error {
            print("Error opening the application: \(error.localizedDescription)")
        } else if let app = app {
            print("Application opened successfully: \(app.bundleIdentifier ?? "")")
        } else {
            print("Failed to open the application for an unknown reason")
        }
    }
}

/// Peel off 3 directory levels to get the containing app URL from the app extension
/// MY_APP.app/Contents/PlugIns/MY_APP_EXTENSION.appex
func getParentAppURL() -> URL {
    Bundle.main.bundleURL
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
}
