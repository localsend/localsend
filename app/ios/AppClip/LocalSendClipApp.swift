// LocalSendClipApp is the native "Send with LocalSend" App Clip UI invoked by Android NFC or QR.
// It validates the capability URL, lets the user choose media, and delegates the private transfer.
// Protocol tests exist; signed App Clip launch and the complete tap-to-send UI remain unverified.
import SwiftUI

@main
struct LocalSendClipApp: App {
    @State private var invocation: AppClipInvocation?
    @State private var launchError: String?

    var body: some Scene {
        WindowGroup {
            Group {
                if let invocation {
                    AppClipRootView(invocation: invocation).id(invocation)
                } else if let launchError {
                    AppClipMessageView(icon: "exclamationmark.triangle", title: "Unable to open LocalSend", message: launchError)
                } else {
                    ProgressView("Opening LocalSend…")
                }
            }
            .onOpenURL(perform: handle)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { activity in
                guard let url = activity.webpageURL else {
                    launchError = "The App Clip invitation did not include a web address."
                    return
                }
                handle(url)
            }
            .task {
                do {
                    try await Task.sleep(nanoseconds: 5_000_000_000)
                } catch {
                    return
                }
                if invocation == nil && launchError == nil {
                    launchError = "No direct-transfer invitation was received."
                }
            }
        }
    }

    private func handle(_ url: URL) {
        do {
            let parsed = try AppClipInvocation.configured(url: url)
            if parsed != invocation { invocation = parsed }
            launchError = nil
        } catch {
            invocation = nil
            launchError = "The direct-transfer invitation is invalid or expired."
        }
    }
}
