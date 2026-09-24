import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    let channel = FlutterMethodChannel(
        name: "ios-delegate-channel",
        binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "isReduceMotionEnabled" {
          result(UIAccessibility.isReduceMotionEnabled)
        } else {
          result(FlutterMethodNotImplemented)
        }
    }
    // register live-photo channel
    let livePhotoChannel = FlutterMethodChannel(
      name: "org.localsend.localsend_app/live_photo",
      binaryMessenger: engineBridge.applicationRegistrar.messenger())

    let livePhotoHandler = LivePhotoHandler()

    livePhotoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      switch call.method {
      case "isLivePhotoSupported":
        // iOS devices support Live Photo by default
        result(true)
        
      case "putLivePhoto":
        guard let args = call.arguments as? [String: Any],
              let imagePath = args["imagePath"] as? String,
              let videoPath = args["videoPath"] as? String else {
          result(FlutterError(code: "INVALID_ARGUMENTS",
                            message: "Image path and video path must not be null",
                            details: nil))
          return
        }

        livePhotoHandler.saveLivePhoto(
          imagePath: imagePath,
          videoPath: videoPath
        ) { error in
          if let error = error {
            result(FlutterError(code: "SAVE_FAILED",
                              message: "Failed to save live photo",
                              details: error.localizedDescription))
          } else {
            result(nil)
          }
        }

      default:
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}
