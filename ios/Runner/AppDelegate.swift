import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name:"localsend.localsend_app/iosCall", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler {
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if call.method == "triggerLocalNetworkDialog" {
            if #available(iOS 14, *) {
                Task {
                    let localNetworkAuthorization = LocalNetworkAuthorization()
                    let granted = await localNetworkAuthorization.requestAuthorization()
                    result(granted)
                }
            } else {
                // Fallback for older iOS versions
                result(true)
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
