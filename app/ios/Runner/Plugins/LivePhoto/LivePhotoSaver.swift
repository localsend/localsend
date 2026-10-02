import Flutter
import Photos

@objc public class LivePhotoSaver: NSObject, FlutterPlugin {
    private let livePhotoHandler = LivePhotoHandler()
    private let logger = Logger(module: "LivePhotoSaver")
    
    @objc public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "org.localsend.localsend_app/live_photo", binaryMessenger: registrar.messenger())
        let instance = LivePhotoSaver()
        registrar.addMethodCallDelegate(instance, channel: channel)
        instance.logger.info("Plugin channel registered")
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        logger.debug("Received method call: \(call.method)")
        
        if call.method == "isLivePhotoSupported" {
            result(true)
            return
        }
        if call.method == "putLivePhoto" {
            guard let args = call.arguments as? [String: Any],
                  let imagePath = args["imagePath"] as? String,
                  let videoPath = args["videoPath"] as? String else {
                logger.error("Invalid arguments")
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing required parameters", details: nil))
                return
            }
            
            logger.info("Saving Live Photo: image=[\(imagePath)], video=[\(videoPath)]")
            
            // Check permissions
            PHPhotoLibrary.requestAuthorization { (status) in
                self.logger.debug("Photo library authorization status: \(status.rawValue)")
                
                if status != .authorized {
                    self.logger.error("No photo library access permission")
                    let error = AppErrorType.permissionDenied(type: "photo library")
                    ErrorUtils.logError(error, context: "Permission check")
                    result(FlutterError(code: "PERMISSION_DENIED", message: "Unauthorized access to photo library", details: nil))
                    return
                }
                
                // Save Live Photo
                self.livePhotoHandler.saveLivePhoto(imagePath: imagePath, videoPath: videoPath) { error in
                    if let error = error {
                        self.logger.error("Failed to save Live Photo: \(error.localizedDescription)")
                        result(FlutterError(code: "SAVE_FAILED", message: "Failed to save Live Photo", details: error.localizedDescription))
                    } else {
                        self.logger.info("Live Photo saved successfully")
                        result(nil)
                    }
                }
            }
        } else {
            logger.warning("Unimplemented method: \(call.method)")
            result(FlutterMethodNotImplemented)
        }
    }
} 