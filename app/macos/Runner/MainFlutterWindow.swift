import Cocoa
import FlutterMacOS
import window_manager
import bitsdojo_window_macos  // used to make custom window bars on macOS (or any desktop operating system for that matter)

class MainFlutterWindow: BitsdojoWindow {
  // just following intructions from https://pub.dev/packages/bitsdojo_window
  override func bitsdojo_window_configure() -> UInt {
    return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
  }
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // 注册实时照片处理通道
    let livePhotoChannel = FlutterMethodChannel(
      name: "org.localsend.localsend_app/live_photo",
      binaryMessenger: flutterViewController.engine.binaryMessenger)
    
    let livePhotoHandler = LivePhotoHandler()
    
    livePhotoChannel.setMethodCallHandler { call, result in
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
    }

    RegisterGeneratedPlugins(registry: flutterViewController)
    // window_manager: start window hidden
    hiddenWindowAtLaunch()  

    super.awakeFromNib()
  }
}
