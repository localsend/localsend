import Flutter
import Photos

@objc public class LivePhotoSaver: NSObject, FlutterPlugin {
    private let livePhotoHandler = LivePhotoHandler()
    
    @objc public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "org.localsend.localsend_app/live_photo", binaryMessenger: registrar.messenger())
        let instance = LivePhotoSaver()
        registrar.addMethodCallDelegate(instance, channel: channel)
        print("LivePhotoSaver: channel registered")
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("LivePhotoSaver: received method call: \(call.method)")
        
        if call.method == "putLivePhoto" {
            guard let args = call.arguments as? [String: Any],
                  let imagePath = args["imagePath"] as? String,
                  let videoPath = args["videoPath"] as? String else {
                print("LivePhotoSaver: invalid arguments")
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing required arguments", details: nil))
                return
            }
            
            print("LivePhotoSaver: Saving live photo: image=\(imagePath), video=\(videoPath)")
            
            // 检查权限
            PHPhotoLibrary.requestAuthorization { (status) in
                print("LivePhotoSaver: photo library permission status: \(status.rawValue)")
                
                if status != .authorized {
                    print("LivePhotoSaver: no photo library access permission")
                    result(FlutterError(code: "PERMISSION_DENIED", message: "Photos access not authorized", details: nil))
                    return
                }
                
                // 保存 Live Photo
                self.livePhotoHandler.saveLivePhoto(imagePath: imagePath, videoPath: videoPath) { error in
                    if let error = error {
                        print("LivePhotoSaver: failed to save live photo: \(error.localizedDescription)")
                        result(FlutterError(code: "SAVE_FAILED", message: "Failed to save live photo", details: error.localizedDescription))
                    } else {
                        print("LivePhotoSaver: saved live photo successfully")
                        result(nil)
                    }
                }
            }
        } else {
            print("LivePhotoSaver: unimplemented method: \(call.method)")
            result(FlutterMethodNotImplemented)
        }
    }
} 