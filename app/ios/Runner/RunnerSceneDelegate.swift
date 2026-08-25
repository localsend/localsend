// RunnerSceneDelegate handles the production "Send with LocalSend" universal link in the full app.
// Apple launches Runner instead of its App Clip when LocalSend is installed, so iOS 16+ presents the
// same validated native sender sheet. Earlier iOS versions receive a clear unsupported-version alert.
import Flutter
import SwiftUI
import UIKit

final class RunnerSceneDelegate: FlutterSceneDelegate {
    override func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        super.scene(scene, willConnectTo: session, options: connectionOptions)
        guard let activity = connectionOptions.userActivities.first(where: { $0.activityType == NSUserActivityTypeBrowsingWeb }) else { return }
        handle(activity)
    }

    override func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        super.scene(scene, continue: userActivity)
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb else { return }
        handle(userActivity)
    }

    private func handle(_ activity: NSUserActivity) {
        guard let url = activity.webpageURL else { return }
        DispatchQueue.main.async { [weak self] in self?.presentTransfer(for: url) }
    }

    private func presentTransfer(for url: URL) {
        guard #available(iOS 16.0, *) else {
            presentError("Sending from an App Clip invitation requires iOS 16 or later.")
            return
        }
        do {
            let invocation = try AppClipInvocation.configured(url: url)
            let controller = UIHostingController(rootView: AppClipFullAppSheet(invocation: invocation))
            controller.restorationIdentifier = "LocalSendAppClipTransfer"
            controller.modalPresentationStyle = .formSheet
            guard let presenter = Self.topViewController(from: window?.rootViewController) else { return }
            if presenter.restorationIdentifier == controller.restorationIdentifier {
                presenter.dismiss(animated: false) { [weak self] in
                    Self.topViewController(from: self?.window?.rootViewController)?.present(controller, animated: true)
                }
            } else {
                presenter.present(controller, animated: true)
            }
        } catch {
            presentError("The direct-transfer invitation is invalid or expired.")
        }
    }

    private func presentError(_ message: String) {
        guard let presenter = Self.topViewController(from: window?.rootViewController) else { return }
        let alert = UIAlertController(title: "Unable to open LocalSend", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        presenter.present(alert, animated: true)
    }

    private static func topViewController(from root: UIViewController?) -> UIViewController? {
        if let presented = root?.presentedViewController { return topViewController(from: presented) }
        if let navigation = root as? UINavigationController { return topViewController(from: navigation.visibleViewController) }
        if let tabs = root as? UITabBarController { return topViewController(from: tabs.selectedViewController) }
        return root
    }
}
