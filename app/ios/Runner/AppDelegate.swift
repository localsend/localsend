import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    if let engine = controller.engine {
      let channel = FlutterMethodChannel(
        name: "ios-delegate-channel",
        binaryMessenger: engine.binaryMessenger
      )
      channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "isReduceMotionEnabled" {
          result(UIAccessibility.isReduceMotionEnabled)
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    } else {
      // I couldn't get the iOS build to run without this check
      print("Flutter engine is nil!")
    }

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    // register live-photo channel
    let livePhotoChannel = FlutterMethodChannel(
      name: "org.localsend.localsend_app/live_photo",
      binaryMessenger: controller.binaryMessenger)

    let livePhotoHandler = LivePhotoHandler()

    livePhotoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      switch call.method {
      case "putLivePhoto":
        guard let args = call.arguments as? [String: Any],
              let imagePath = args["imagePath"] as? String,
              let videoPath = args["videoPath"] as? String else {
          result(FlutterError(code: "INVALID_ARGUMENTS",
                            message: "Image path and video path must not be null",
                            details: nil))
          return
        }

        let album = args["album"] as? String

        livePhotoHandler.saveLivePhoto(
          imagePath: imagePath,
          videoPath: videoPath,
          album: album
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

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}