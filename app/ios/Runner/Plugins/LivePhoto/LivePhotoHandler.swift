import Photos
import PhotosUI
import MobileCoreServices
import UIKit
import AVFoundation

enum ImageProcessingError: Error {
    case invalidImageSource
    case unableToReadImage
    case unableToWriteImage
}

enum VideoProcessingError: Error {
    case loadTracksFailed
    case unableToWriteVideo
}

@objc class LivePhotoHandler: NSObject {
    private let livePhotoUtils = LivePhotoUtils()
    private let logger = Logger(module: "LivePhotoHandler")
    
    @objc func saveLivePhoto(imagePath: String, videoPath: String, completion: @escaping (Error?) -> Void) {
        logger.info("开始保存 Live Photo")
        logger.debug("图片路径: \(imagePath)")
        logger.debug("视频路径: \(videoPath)")
        
        // 检查文件是否存在
        if !FileUtils.fileExists(at: imagePath) {
            let error = AppErrorType.fileNotFound(path: imagePath)
            logger.error("图片文件不存在: \(imagePath)")
            completion(error)
            return
        }
        
        if !FileUtils.fileExists(at: videoPath) {
            let error = AppErrorType.fileNotFound(path: videoPath)
            logger.error("视频文件不存在: \(videoPath)")
            completion(error)
            return
        }
        
        // 获取文件大小
        let imageURL = URL(fileURLWithPath: imagePath)
        let videoURL = URL(fileURLWithPath: videoPath)
        
        // 检查文件大小
        if let imageSize = FileUtils.fileSize(at: imagePath), 
           let videoSize = FileUtils.fileSize(at: videoPath) {
            logger.debug("图片大小: \(imageSize) 字节")
            logger.debug("视频大小: \(videoSize) 字节")
            
            // 检查文件是否为空
            if FileUtils.isFileEmpty(at: imagePath) {
                let error = AppErrorType.fileEmpty(path: imagePath)
                logger.error("图片文件为空")
                completion(error)
                return
            }
            
            if FileUtils.isFileEmpty(at: videoPath) {
                let error = AppErrorType.fileEmpty(path: videoPath)
                logger.error("视频文件为空")
                completion(error)
                return
            }
        } else {
            logger.warning("无法获取文件大小信息")
        }
        
        // 检查文件扩展名
        let imageExtension = imageURL.pathExtension.lowercased()
        let videoExtension = videoURL.pathExtension.lowercased()
        
        logger.debug("图片扩展名: \(imageExtension)")
        logger.debug("视频扩展名: \(videoExtension)")
        
        // 验证文件格式
        if !FileUtils.isFileExtensionSupported(path: imagePath, supportedExtensions: ["jpg", "jpeg", "heic"]) {
            let error = AppErrorType.fileFormatNotSupported(extension: imageExtension)
            logger.error("不支持的图片格式，需要 jpg/jpeg/heic")
            completion(error)
            return
        }
        
        // 创建唯一标识符
        let identifier = UUID().uuidString
        
        // 创建临时文件路径
        let tempImageURL = FileUtils.createTempFilePath(originalURL: imageURL, prefix: nil, suffix: nil)
        let tempVideoURL = FileUtils.createTempFilePath(originalURL: videoURL, prefix: nil, suffix: "mov")
        
        logger.debug("临时图片路径: \(tempImageURL.path)")
        logger.debug("临时视频路径: \(tempVideoURL.path)")
        
        // 处理图片和视频
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                // 处理图片
                self.logger.info("开始处理图片")
                let processedImageURL = try self.livePhotoUtils.addPhotoIdentifier(
                    identifier,
                    fromPhotoURL: imageURL,
                    to: tempImageURL
                )
                self.logger.info("图片处理成功")
                
                // 处理视频
                self.logger.info("开始处理视频")
                self.livePhotoUtils.addVideoIdentifier(
                    identifier,
                    fromVideoURL: videoURL,
                    to: tempVideoURL
                ) { progress in
                    self.logger.debug("视频转换进度: \(Int(progress * 100))%")
                } completion: { result in
                    switch result {
                    case .success(let processedVideoURL):
                        self.logger.info("视频处理成功")
                        
                        // 保存前检查文件是否存在
                        if !FileUtils.fileExists(at: processedImageURL.path) || !FileUtils.fileExists(at: processedVideoURL.path) {
                            let error = AppErrorType.fileNotFound(path: "处理后的文件")
                            ErrorUtils.logError(error, context: "Live Photo处理")
                            
                            // 清理临时文件
                            self.cleanupTempFiles(tempImageURL, tempVideoURL)
                            
                            DispatchQueue.main.async {
                                completion(error)
                            }
                            return
                        }
                        
                        // 保存LivePhoto
                        // 使用信号量等待保存完成
                        let semaphore = DispatchSemaphore(value: 0)
                        var saveError: Error? = nil
                        var saveSuccess = false
                        
                        self.logger.info("开始保存到相册")
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetCreationRequest.forAsset()
                            let options = PHAssetResourceCreationOptions()
                            options.shouldMoveFile = false
                            
                            self.logger.debug("添加资源到相册")
                            request.addResource(with: .photo, fileURL: processedImageURL, options: options)
                            request.addResource(with: .pairedVideo, fileURL: processedVideoURL, options: options)
                            
                        }) { success, error in
                            saveSuccess = success
                            saveError = error
                            if let error = error {
                                self.logger.error("相册报告错误: \(error.localizedDescription)")
                                ErrorUtils.logError(error, context: "保存到相册")
                            }
                            semaphore.signal()
                        }
                        
                        semaphore.wait()
                        
                        // 清理临时文件
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // 通过主线程回调
                        DispatchQueue.main.async {
                            if saveSuccess {
                                self.logger.info("Live Photo 保存成功")
                                completion(nil)
                            } else if let error = saveError {
                                self.logger.error("Live Photo 保存失败: \(error.localizedDescription)")
                                completion(error)
                            } else {
                                let error = AppErrorType.internalError(reason: "保存到相册失败")
                                self.logger.error("保存失败")
                                completion(error)
                            }
                        }
                        
                    case .failure(let error):
                        self.logger.error("视频处理失败: \(error.localizedDescription)")
                        ErrorUtils.logError(error, context: "视频处理")
                        
                        // 清理临时文件
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // 通过主线程回调错误
                        DispatchQueue.main.async {
                            completion(error)
                        }
                    }
                }
            } catch {
                self.logger.error("图片处理失败: \(error.localizedDescription)")
                ErrorUtils.logError(error, context: "图片处理")
                
                // 清理临时文件
                self.cleanupTempFiles(tempImageURL, tempVideoURL)
                
                // 通过主线程回调错误
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
    
    private func cleanupTempFiles(_ files: URL...) {
        for file in files {
            FileUtils.cleanupTempFile(file)
        }
    }
}

// 扩展 AVAsset 以支持帧计数
extension AVAsset {
    func frameCount() throws -> Int {
        guard let videoTrack = tracks(withMediaType: .video).first else {
            let error = AppErrorType.mediaTrackMissing(type: "视频")
            throw error
        }
        let frameRate = videoTrack.nominalFrameRate
        return Int(Float(duration.value) * frameRate / Float(duration.timescale))
    }
}
