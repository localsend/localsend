import SwiftUI
import Defaults

@available(macOS 13.0, *)
final class ShareController: ExtensionController {
    override func run(_ context: NSExtensionContext) async throws -> [NSExtensionItem] {
        guard
            let url = try await (context.attachments.first { $0.hasItemConforming(to: .url) })?.loadTransferable(type: URL.self)
        else {
            context.cancel()
            return []
        }
        
        // Save the URL to a shared UserDefaults
        // This is Apple's recommended way to share data from App Extension to the Containing App.
        // See: https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ExtensionScenarios.html#//apple_ref/doc/uid/TP40014214-CH21-SW6
        Defaults[.sharedURL] = url

        // Close the share extension
        context.completeRequest(returningItems: [], completionHandler: nil)
        
        // Launch localsend app if it's not running
        let localsendAppURL = getParentAppURL()
        launchAppIfNeeded(appUrl: localsendAppURL)
        
        return []
    }
}
