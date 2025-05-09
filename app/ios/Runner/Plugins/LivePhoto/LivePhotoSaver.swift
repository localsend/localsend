import Flutter
import Photos

@objc public class LivePhotoSaver: NSObject, FlutterPlugin {
    private let livePhotoHandler = LivePhotoHandler()
    private let logger = Logger(module: "LivePhotoSaver")
    
    @objc public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "org.localsend.localsend_app/live_photo", binaryMessenger: registrar.messenger())
        let instance = LivePhotoSaver()
        registrar.addMethodCallDelegate(instance, channel: channel)
        instance.logger.info("插件通道已注册")
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        logger.debug("收到方法调用: \(call.method)")
        
        if call.method == "putLivePhoto" {
            guard let args = call.arguments as? [String: Any],
                  let imagePath = args["imagePath"] as? String,
                  let videoPath = args["videoPath"] as? String else {
                logger.error("参数无效")
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "缺少必要参数", details: nil))
                return
            }
            
            logger.info("保存 Live Photo: 图片=\(imagePath.split(separator: "/").last ?? ""), 视频=\(videoPath.split(separator: "/").last ?? "")")
            
            // 检查权限
            PHPhotoLibrary.requestAuthorization { (status) in
                self.logger.debug("相册库授权状态: \(status.rawValue)")
                
                if status != .authorized {
                    self.logger.error("没有相册访问权限")
                    let error = AppErrorType.permissionDenied(type: "相册")
                    ErrorUtils.logError(error, context: "权限检查")
                    result(FlutterError(code: "PERMISSION_DENIED", message: "未授权访问相册", details: nil))
                    return
                }
                
                // 保存 Live Photo
                self.livePhotoHandler.saveLivePhoto(imagePath: imagePath, videoPath: videoPath) { error in
                    if let error = error {
                        self.logger.error("保存 Live Photo 失败: \(error.localizedDescription)")
                        result(FlutterError(code: "SAVE_FAILED", message: "保存 Live Photo 失败", details: error.localizedDescription))
                    } else {
                        self.logger.info("保存 Live Photo 成功")
                        result(nil)
                    }
                }
            }
        } else {
            logger.warning("未实现的方法: \(call.method)")
            result(FlutterMethodNotImplemented)
        }
    }
} 