import Photos
import PhotosUI
import MobileCoreServices
import UIKit
import AVFoundation

@objc class LivePhotoHandler: NSObject {
    
    @objc func saveLivePhoto(imagePath: String, videoPath: String, completion: @escaping (Error?) -> Void) {
        print("LivePhotoHandler: Starting to save live photo, image: \(imagePath), video: \(videoPath)")
        
        // 检查文件是否存在
        guard FileManager.default.fileExists(atPath: imagePath) else {
            let error = NSError(domain: "LivePhotoHandler", code: -1, userInfo: [NSLocalizedDescriptionKey: "Image file does not exist"])
            print("LivePhotoHandler: Error - \(error.localizedDescription)")
            completion(error)
            return
        }
        
        guard FileManager.default.fileExists(atPath: videoPath) else {
            let error = NSError(domain: "LivePhotoHandler", code: -1, userInfo: [NSLocalizedDescriptionKey: "Video file does not exist"])
            print("LivePhotoHandler: Error - \(error.localizedDescription)")
            completion(error)
            return
        }
        
        // 获取文件大小
        let imageSize = (try? FileManager.default.attributesOfItem(atPath: imagePath)[.size] as? NSNumber)?.int64Value ?? 0
        let videoSize = (try? FileManager.default.attributesOfItem(atPath: videoPath)[.size] as? NSNumber)?.int64Value ?? 0
        print("LivePhotoHandler: File size - image: \(imageSize) bytes, video: \(videoSize) bytes")
        
        // 检查文件扩展名
        let imageExtension = URL(fileURLWithPath: imagePath).pathExtension.lowercased()
        let videoExtension = URL(fileURLWithPath: videoPath).pathExtension.lowercased()
        
        // 验证文件格式
        if !["jpg", "jpeg", "heic"].contains(imageExtension) {
            let error = NSError(domain: "LivePhotoHandler", code: -3, userInfo: [NSLocalizedDescriptionKey: "Image format not supported, need jpg/jpeg/heic"])
            print("LivePhotoHandler: Error - \(error.localizedDescription)")
            completion(error)
            return
        }
        
        // 创建唯一标识符
        let identifier = UUID().uuidString
        
        // 创建临时文件路径
        let tempDirectory = NSTemporaryDirectory()

        // 获取原始文件名（不含扩展名）
        let imageFileName = URL(fileURLWithPath: imagePath).deletingPathExtension().lastPathComponent
        let videoFileName = URL(fileURLWithPath: videoPath).deletingPathExtension().lastPathComponent

        let tempImageURL = URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(imageFileName).\(imageExtension)")
        let tempVideoURL = URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(videoFileName).mov") // 强制使用 .mov 扩展名
        
        // 复制图片文件到临时位置
        do {
            if FileManager.default.fileExists(atPath: tempImageURL.path) {
                try FileManager.default.removeItem(at: tempImageURL)
            }
            
            try FileManager.default.copyItem(atPath: imagePath, toPath: tempImageURL.path)
        } catch {
            print("LivePhotoHandler: Failed to copy image file to temp location: \(error.localizedDescription)")
            completion(error)
            return
        }
        
        // 为图片添加标识符
        self.addPhotoIdentifier(imagePath: tempImageURL.path, identifier: identifier) { error in
            if let error = error {
                print("LivePhotoHandler: Failed to add identifier to image: \(error.localizedDescription)")
                self.cleanupTempFiles(tempImageURL)
                completion(error)
                return
            }
            
            // 处理视频文件 - 如果不是 MOV 格式，需要转换
            if videoExtension != "mov" {
                print("LivePhotoHandler: Video is not MOV format, need to convert")
                self.convertVideoToMov(videoPath: videoPath, outputURL: tempVideoURL, identifier: identifier) { error in
                    if let error = error {
                        print("LivePhotoHandler: Failed to convert video: \(error.localizedDescription)")
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        completion(error)
                        return
                    }
                    
                    // 视频转换成功，继续处理
                    self.createAndSaveLivePhoto(imageURL: tempImageURL, videoURL: tempVideoURL, completion: { error in
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        completion(error)
                    })
                }
            } else {
                // 视频已经是 MOV 格式，直接复制
                do {
                    if FileManager.default.fileExists(atPath: tempVideoURL.path) {
                        try FileManager.default.removeItem(at: tempVideoURL)
                    }
                    
                    try FileManager.default.copyItem(atPath: videoPath, toPath: tempVideoURL.path)
                    
                    // 为视频添加标识符
                    self.addVideoIdentifier(videoPath: tempVideoURL.path, identifier: identifier) { error in
                        if let error = error {
                            print("LivePhotoHandler: Failed to add identifier to video: \(error.localizedDescription)")
                            self.cleanupTempFiles(tempImageURL, tempVideoURL)
                            completion(error)
                            return
                        }
                        
                        // 视频处理成功，继续创建 Live Photo
                        self.createAndSaveLivePhoto(imageURL: tempImageURL, videoURL: tempVideoURL, completion: { error in
                            self.cleanupTempFiles(tempImageURL, tempVideoURL)
                            completion(error)
                        })
                    }
                } catch {
                    print("LivePhotoHandler: Failed to copy video file: \(error.localizedDescription)")
                    self.cleanupTempFiles(tempImageURL)
                    completion(error)
                }
            }
        }
    }
    
    private func createAndSaveLivePhoto(imageURL: URL, videoURL: URL, completion: @escaping (Error?) -> Void) {
        // 创建 Live Photo
        print("LivePhotoHandler: Creating Live Photo")
        PHLivePhoto.request(withResourceFileURLs: [imageURL, videoURL],
                            placeholderImage: nil,
                            targetSize: .zero,
                            contentMode: .aspectFit) { livePhoto, info in
            
            // 检查是否有错误
            if let error = info[PHLivePhotoInfoErrorKey] as? Error {
                print("LivePhotoHandler: Failed to create Live Photo: \(error.localizedDescription)")
                completion(error)
                return
            }
            
            // 检查 Live Photo 是否创建成功
            guard let livePhoto = livePhoto else {
                print("LivePhotoHandler: Failed to create Live Photo, no valid object returned")
                completion(NSError(domain: "LivePhotoHandler", code: -5, userInfo: [NSLocalizedDescriptionKey: "Failed to create live photo"]))
                return
            }
            
            print("LivePhotoHandler: Live Photo created successfully")
            
            // 保存到相册
            print("LivePhotoHandler: Saving Live Photo to photo library")
            PHPhotoLibrary.shared().performChanges({
                let creationRequest = PHAssetCreationRequest.forAsset()
                let options = PHAssetResourceCreationOptions()
                options.shouldMoveFile = false
                
                creationRequest.addResource(with: .photo, fileURL: imageURL, options: options)
                creationRequest.addResource(with: .pairedVideo, fileURL: videoURL, options: options)
                
            }) { success, error in
                if success {
                    print("LivePhotoHandler: Live Photo saved successfully")
                    completion(nil)
                } else if let error = error {
                    print("LivePhotoHandler: Failed to save Live Photo: \(error.localizedDescription)")
                    completion(error)
                } else {
                    print("LivePhotoHandler: Failed to save Live Photo, unknown error")
                    completion(NSError(domain: "LivePhotoHandler", code: -6, userInfo: [NSLocalizedDescriptionKey: "Failed to save live photo"]))
                }
            }
        }
    }
    
    private func convertVideoToMov(videoPath: String, outputURL: URL, identifier: String, completion: @escaping (Error?) -> Void) {
        print("LivePhotoHandler: Converting video to MOV format")
        
        let videoURL = URL(fileURLWithPath: videoPath)
        let asset = AVURLAsset(url: videoURL)
        
        // 使用传统方式处理视频
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                // 检查视频轨道
                let videoTracks = asset.tracks(withMediaType: .video)
                guard let videoTrack = videoTracks.first else {
                    DispatchQueue.main.async {
                        let error = NSError(domain: "LivePhotoHandler", code: -2, userInfo: [NSLocalizedDescriptionKey: "No video track found"])
                        print("LivePhotoHandler: Error - \(error.localizedDescription)")
                        completion(error)
                    }
                    return
                }
                
                // 获取视频信息
                let duration = CMTimeGetSeconds(asset.duration)
                let nominalFrameRate = videoTrack.nominalFrameRate
                let naturalSize = videoTrack.naturalSize
                
                print("LivePhotoHandler: Video info - duration: \(duration)s, frame rate: \(nominalFrameRate), size: \(naturalSize)")
                
                // 检查视频时长，Live Photo 视频通常较短
                if duration > 10.0 {
                    print("LivePhotoHandler: Warning - Video duration exceeds 10 seconds, may not be suitable for Live Photo")
                }
                
                // 删除可能存在的旧文件
                if FileManager.default.fileExists(atPath: outputURL.path) {
                    try FileManager.default.removeItem(at: outputURL)
                }
                
                // 创建 AVAssetExportSession
                guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {
                    DispatchQueue.main.async {
                        let error = NSError(domain: "LivePhotoHandler", code: -7, userInfo: [NSLocalizedDescriptionKey: "Failed to create export session"])
                        print("LivePhotoHandler: Error - \(error.localizedDescription)")
                        completion(error)
                    }
                    return
                }
                
                // 设置导出参数
                exportSession.outputURL = outputURL
                exportSession.outputFileType = .mov
                exportSession.shouldOptimizeForNetworkUse = true
                
                // 添加元数据
                let metadataItem = AVMutableMetadataItem()
                metadataItem.key = "com.apple.quicktime.content.identifier" as NSString
                metadataItem.keySpace = AVMetadataKeySpace.quickTimeMetadata
                metadataItem.value = identifier as NSString
                metadataItem.dataType = "com.apple.metadata.datatype.UTF-8"
                
                let stillImageTimeItem = AVMutableMetadataItem()
                stillImageTimeItem.key = "com.apple.quicktime.still-image-time" as NSString
                stillImageTimeItem.keySpace = AVMetadataKeySpace.quickTimeMetadata
                stillImageTimeItem.value = NSNumber(value: Float(duration / 2.0))
                stillImageTimeItem.dataType = "com.apple.metadata.datatype.float32"
                
                exportSession.metadata = [metadataItem, stillImageTimeItem]
                
                // 开始导出
                print("LivePhotoHandler: Starting video export")
                exportSession.exportAsynchronously {
                    DispatchQueue.main.async {
                        if exportSession.status == .completed {
                            print("LivePhotoHandler: Video export completed successfully")
                            completion(nil)
                        } else if let error = exportSession.error {
                            print("LivePhotoHandler: Video export failed: \(error.localizedDescription)")
                            completion(error)
                        } else {
                            let error = NSError(domain: "LivePhotoHandler", code: -8, userInfo: [NSLocalizedDescriptionKey: "Unknown error during video export"])
                            print("LivePhotoHandler: Error - \(error.localizedDescription)")
                            completion(error)
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print("LivePhotoHandler: Video processing exception: \(error.localizedDescription)")
                    completion(error)
                }
            }
        }
    }
    
    private func cleanupTempFiles(_ files: URL...) {
        for file in files {
            if FileManager.default.fileExists(atPath: file.path) {
                do {
                    try FileManager.default.removeItem(at: file)
                    print("LivePhotoHandler: Temporary file deleted: \(file.path)")
                } catch {
                    print("LivePhotoHandler: Failed to delete temporary file: \(file.path), error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func addPhotoIdentifier(imagePath: String, identifier: String, completion: @escaping (Error?) -> Void) {
        print("LivePhotoHandler: Adding identifier to image: \(imagePath)")
        
        // 检查图片格式
        let imageExtension = URL(fileURLWithPath: imagePath).pathExtension.lowercased()
        
        // 创建图片源
        guard let imageSource = CGImageSourceCreateWithURL(URL(fileURLWithPath: imagePath) as CFURL, nil) else {
            print("LivePhotoHandler: Failed to create image source")
            completion(NSError(domain: "LivePhotoHandler", code: -9, userInfo: [NSLocalizedDescriptionKey: "Failed to create image source"]))
            return
        }
        
        // 获取图片类型
        let imageType = CGImageSourceGetType(imageSource)
        
        // 获取图片属性并添加标识符
        guard let imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, nil),
              var imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [AnyHashable : Any] else {
            print("LivePhotoHandler: Failed to create image from source or get properties")
            completion(NSError(domain: "LivePhotoHandler", code: -9, userInfo: [NSLocalizedDescriptionKey: "Failed to create image from source or get properties"]))
            return
        }
        
        // 使用 MakerAppleDictionary 添加标识符
        let identifierInfo = ["17" : identifier]
        imageProperties[kCGImagePropertyMakerAppleDictionary] = identifierInfo
        
        // 创建目标并写入图片
        guard let imageDestination = CGImageDestinationCreateWithURL(URL(fileURLWithPath: imagePath) as CFURL, kUTTypeJPEG, 1, nil) else {
            print("LivePhotoHandler: Failed to create image destination")
            completion(NSError(domain: "LivePhotoHandler", code: -10, userInfo: [NSLocalizedDescriptionKey: "Failed to create image destination"]))
            return
        }
        
        CGImageDestinationAddImage(imageDestination, imageRef, imageProperties as CFDictionary)
        
        if !CGImageDestinationFinalize(imageDestination) {
            print("LivePhotoHandler: Failed to finalize image destination")
            completion(NSError(domain: "LivePhotoHandler", code: -11, userInfo: [NSLocalizedDescriptionKey: "Failed to finalize image destination"]))
            return
        }
        
        print("LivePhotoHandler: Image processing completed, saved to: \(imagePath)")
        completion(nil)
    }
    
    private func addVideoIdentifier(videoPath: String, identifier: String, completion: @escaping (Error?) -> Void) {
        print("LivePhotoHandler: Adding identifier to video: \(videoPath)")
        
        let videoURL = URL(fileURLWithPath: videoPath)
        let asset = AVURLAsset(url: videoURL)
        
        // 使用 AVAssetExportSession 添加元数据
        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {
            let error = NSError(domain: "LivePhotoHandler", code: -7, userInfo: [NSLocalizedDescriptionKey: "Failed to create export session"])
            print("LivePhotoHandler: Error - \(error.localizedDescription)")
            completion(error)
            return
        }
        
        // 创建临时输出路径
        let tempDirectory = NSTemporaryDirectory()
        let tempOutputURL = URL(fileURLWithPath: tempDirectory).appendingPathComponent("temp_video_\(UUID().uuidString).mov")
        
        // 设置导出参数
        exportSession.outputURL = tempOutputURL
        exportSession.outputFileType = .mov
        exportSession.shouldOptimizeForNetworkUse = true
        
        // 添加元数据
        let metadataItem = AVMutableMetadataItem()
        metadataItem.key = "com.apple.quicktime.content.identifier" as NSString
        metadataItem.keySpace = AVMetadataKeySpace.quickTimeMetadata
        metadataItem.value = identifier as NSString
        metadataItem.dataType = "com.apple.metadata.datatype.UTF-8"
        
        let stillImageTimeItem = AVMutableMetadataItem()
        stillImageTimeItem.key = "com.apple.quicktime.still-image-time" as NSString
        stillImageTimeItem.keySpace = AVMetadataKeySpace.quickTimeMetadata
        stillImageTimeItem.value = NSNumber(value: Float(CMTimeGetSeconds(asset.duration) / 2.0))
        stillImageTimeItem.dataType = "com.apple.metadata.datatype.float32"
        
        exportSession.metadata = [metadataItem, stillImageTimeItem]
        
        // 开始导出
        print("LivePhotoHandler: Starting video export for identifier")
        exportSession.exportAsynchronously {
            if exportSession.status == .completed {
                print("LivePhotoHandler: Video export completed successfully")
                
                do {
                    // 替换原始文件
                    if FileManager.default.fileExists(atPath: videoURL.path) {
                        try FileManager.default.removeItem(at: videoURL)
                    }
                    try FileManager.default.moveItem(at: tempOutputURL, to: videoURL)
                    print("LivePhotoHandler: Video file replaced")
                    completion(nil)
                } catch {
                    print("LivePhotoHandler: Failed to replace video file: \(error.localizedDescription)")
                    completion(error)
                }
            } else if let error = exportSession.error {
                print("LivePhotoHandler: Video export failed: \(error.localizedDescription)")
                completion(error)
            } else {
                let error = NSError(domain: "LivePhotoHandler", code: -8, userInfo: [NSLocalizedDescriptionKey: "Unknown error during video export"])
                print("LivePhotoHandler: Error - \(error.localizedDescription)")
                completion(error)
            }
        }
    }
}

// 扩展 AVAsset 以支持帧计数
extension AVAsset {
    func frameCount() throws -> Int {
        guard let videoTrack = tracks(withMediaType: .video).first else {
            throw NSError(domain: "LivePhotoHandler", code: -13, userInfo: [NSLocalizedDescriptionKey: "No video track found"])
        }
        let frameRate = videoTrack.nominalFrameRate
        return Int(Float(duration.value) * frameRate / Float(duration.timescale))
    }
}
