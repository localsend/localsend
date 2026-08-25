// AppClipRootView is the shared native "Send with LocalSend" media-transfer screen.
// The App Clip displays it directly; the installed Runner presents it for the same invocation URL.
// UI and physical transfer remain device-unverified; AppClipProtocolTests cover the wire capability.
import PhotosUI
import SwiftUI

@available(iOS 16.0, *)
struct AppClipRootView: View {
    let invocation: AppClipInvocation
    let onDismiss: (() -> Void)?
    @StateObject private var coordinator: AppClipTransferCoordinator
    @State private var picks: [PhotosPickerItem] = []
    @Environment(\.scenePhase) private var scenePhase

    init(invocation: AppClipInvocation, onDismiss: (() -> Void)? = nil) {
        self.invocation = invocation
        self.onDismiss = onDismiss
        _coordinator = StateObject(wrappedValue: AppClipTransferCoordinator(invocation: invocation))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // blueSendHeroIcon — large blue filled upload circle at the top of the transfer screen.
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 68))
                    .foregroundStyle(.blue)
                Text("Send to \(invocation.receiverName)")
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                content
                if let webView = coordinator.bootstrapWebView {
                    AppClipBootstrapWebView(webView: webView)
                        .frame(width: 1, height: 1)
                        .opacity(0.01)
                        .accessibilityHidden(true)
                }
            }
            .padding(24)
            .navigationTitle("LocalSend")
            .toolbar {
                if let onDismiss {
                    // navigationCloseButton — closes the installed-app sheet and cancels active transfer work.
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close") {
                            coordinator.cancel()
                            onDismiss()
                        }
                    }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background && coordinator.isActive { coordinator.cancel() }
        }
        .onDisappear {
            if coordinator.isActive { coordinator.cancel() }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch coordinator.phase {
        case .choosing:
            Text(picks.isEmpty ? "Choose photos or videos to send." : "\(picks.count) item(s) selected")
                .foregroundStyle(.secondary)
            // borderedMediaPickerButton — centered system picker for photos and videos.
            PhotosPicker(selection: $picks, maxSelectionCount: 100, matching: .any(of: [.images, .videos])) {
                Label("Choose photos and videos", systemImage: "photo.on.rectangle")
            }
            .buttonStyle(.bordered)
            // prominentBlueSendButton — starts staging and direct transfer for the selection.
            Button("Send") { coordinator.send(picks) }
                .buttonStyle(.borderedProminent)
                .disabled(picks.isEmpty)
        case .staging:
            progress("Preparing selected items…")
        case .joining:
            progress("Connecting privately…")
        case .waitingForReceiver:
            progress("Waiting for acceptance on \(invocation.receiverName)…")
        case .transferring:
            // horizontalTransferProgress — determinate progress while Android downloads files.
            ProgressView(value: coordinator.progress)
            Text("Sending… \(Int(coordinator.progress * 100))%")
        case .completed:
            AppClipMessageView(icon: "checkmark.circle.fill", title: "Sent", message: "All selected items were received.")
        case .failed(let message):
            AppClipMessageView(icon: "exclamationmark.triangle", title: "Transfer stopped", message: message)
            // prominentRetryButton — returns a failed transfer to media selection.
            Button("Try again") { coordinator.reset() }.buttonStyle(.borderedProminent)
        }
        if coordinator.isActive {
            // borderedCancelButton — tears down any active direct-transfer phase.
            Button("Cancel", role: .cancel) { coordinator.cancel() }.buttonStyle(.bordered)
        }
    }

    private func progress(_ label: String) -> some View {
        VStack(spacing: 12) {
            ProgressView()
            Text(label).multilineTextAlignment(.center).foregroundStyle(.secondary)
        }
    }
}

@available(iOS 16.0, *)
struct AppClipFullAppSheet: View {
    let invocation: AppClipInvocation
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        AppClipRootView(invocation: invocation, onDismiss: { dismiss() })
    }
}

struct AppClipMessageView: View {
    let icon: String
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon).font(.system(size: 48))
            Text(title).font(.title3.bold())
            Text(message).multilineTextAlignment(.center).foregroundStyle(.secondary)
        }
    }
}
