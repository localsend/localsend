import AppIntents
import AppKit
import SwiftUI
import WidgetKit

private enum ReceivingState {
    static let notification = "org.localsend.localsendApp.receivingControlRequest" as CFString
    static let defaults = UserDefaults(suiteName: "\(Bundle.main.infoDictionary?["AppIdentifierPrefix"] as? String ?? "")localsend.shared_group")

    static var isAppAlive: Bool {
        defaults?.synchronize()
        return Date().timeIntervalSince1970 - (defaults?.double(forKey: "controlHeartbeat") ?? 0) < 25
    }

    static var isReceiving: Bool {
        isAppAlive && (defaults?.bool(forKey: "receivingActive") ?? false)
    }
}

struct ReceivingToggleIntent: SetValueIntent {
    static var title: LocalizedStringResource = "LocalSend Receiving"

    @Parameter(title: "Receiving")
    var value: Bool

    func perform() async throws -> some IntentResult {
        guard let defaults = ReceivingState.defaults else { return .result() }
        defaults.set(value, forKey: "receivingRequested")
        defaults.set(UUID().uuidString, forKey: "controlRequestId")
        defaults.set(Date().timeIntervalSince1970, forKey: "controlRequestTime")
        defaults.synchronize()

        if !ReceivingState.isAppAlive && value {
            let appURL = Bundle.main.bundleURL.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            let configuration = NSWorkspace.OpenConfiguration()
            configuration.activates = false
            configuration.arguments = ["--hidden"]
            try await NSWorkspace.shared.openApplication(at: appURL, configuration: configuration)
        }

        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFNotificationName(ReceivingState.notification), nil, nil, true)
        return .result()
    }
}

struct ReceivingControl: ControlWidget {
    static let kind = "org.localsend.localsendApp.receivingControl"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: Provider()) { receiving in
            ControlWidgetToggle("LocalSend Receiving", isOn: receiving, action: ReceivingToggleIntent()) { isOn in
                Label(isOn ? "Receiving On" : "Receiving Off", systemImage: "square.and.arrow.down")
            }
        }
        .displayName("LocalSend Receiving")
        .description("Turn LocalSend receiving on or off.")
    }

    struct Provider: ControlValueProvider {
        var previewValue: Bool { false }

        func currentValue() async throws -> Bool {
            ReceivingState.isReceiving
        }
    }
}

@main
struct LocalSendControls: WidgetBundle {
    var body: some Widget {
        ReceivingControl()
    }
}
