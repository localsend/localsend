import SwiftUI
import Defaults

final class ShareController: ExtensionController {
    override func run(_ context: NSExtensionContext) async throws -> [NSExtensionItem] {
        var urls: [URL] = []
        var string: String?
        
        for attachment in context.attachments {
            if attachment.hasItemConforming(to: .url) {
                do {
                    let url = try await attachment.loadItem(ofClass: NSURL.self) as URL
                    if url.isFileURL {
                        urls.append(url)
                    } else {
                        string = url.absoluteString
                    }
                } catch {
                    print("Failed to load URL: \(error)")
                }
            } else {
                print("This attachment type are not supported yet")
            }
        }
        
        if let text = context.textContent.body {
            string = text
        }
        
        if urls.isEmpty && string == nil {
            context.cancel()
            return []
        }
        
        /// - SeeAlso: [``Shared/createBookmarkForFile(at:)``](x-source-tag://create-bookmark-func)
        let bookmarks: [Data] = urls.compactMap { createBookmarkForFile(at: $0) }
        
        // Save the file bookmarks to a shared UserDefaults
        // This is Apple's recommended way to share data from App Extension to the Containing App
        // See: https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ExtensionScenarios.html#//apple_ref/doc/uid/TP40014214-CH21-SW6
        Defaults[.pendingFiles].append(contentsOf: bookmarks)
        
        if let string {
            Defaults[.pendingStrings].append(string)
        }
        
        // Launch localsend app if it's not running
        let localsendAppURL = getParentAppURL()
        launchAppIfNeeded(appURL: localsendAppURL)
        
        // Close the share extension
        context.completeRequest(returningItems: [], completionHandler: nil)
        
        return []
    }
}
