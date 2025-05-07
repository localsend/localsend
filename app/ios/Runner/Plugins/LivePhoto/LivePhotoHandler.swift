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
    
    @objc func saveLivePhoto(imagePath: String, videoPath: String, completion: @escaping (Error?) -> Void) {
        print("LivePhotoHandler: Starting to save live photo")
        print("LivePhotoHandler: Image path: \(imagePath)")
        print("LivePhotoHandler: Video path: \(videoPath)")
        
        // 检查文件是否存在
        guard FileManager.default.fileExists(atPath: imagePath) else {
            let error = NSError(domain: "LivePhotoHandler", code: -1, userInfo: [NSLocalizedDescriptionKey: "Image file does not exist"])
            completion(error)
            return
        }
        
        guard FileManager.default.fileExists(atPath: videoPath) else {
            let error = NSError(domain: "LivePhotoHandler", code: -1, userInfo: [NSLocalizedDescriptionKey: "Video file does not exist"])
            completion(error)
            return
        }
        
        // 获取文件大小
        let imageURL = URL(fileURLWithPath: imagePath)
        let videoURL = URL(fileURLWithPath: videoPath)
        
        do {
            let imageAttributes = try FileManager.default.attributesOfItem(atPath: imagePath)
            let videoAttributes = try FileManager.default.attributesOfItem(atPath: videoPath)
            
            if let imageSize = imageAttributes[.size] as? NSNumber, 
               let videoSize = videoAttributes[.size] as? NSNumber {
                print("LivePhotoHandler: Image size: \(imageSize.int64Value) bytes")
                print("LivePhotoHandler: Video size: \(videoSize.int64Value) bytes")
                
                // 检查文件是否为空
                if imageSize.int64Value == 0 {
                    let error = NSError(domain: "LivePhotoHandler", code: -2, userInfo: [NSLocalizedDescriptionKey: "Image file is empty"])
                    completion(error)
                    return
                }
                
                if videoSize.int64Value == 0 {
                    let error = NSError(domain: "LivePhotoHandler", code: -2, userInfo: [NSLocalizedDescriptionKey: "Video file is empty"])
                    completion(error)
                    return
                }
            }
        } catch {
            print("LivePhotoHandler: Error getting file attributes: \(error.localizedDescription)")
        }
        
        // 检查文件扩展名
        let imageExtension = imageURL.pathExtension.lowercased()
        let videoExtension = videoURL.pathExtension.lowercased()
        
        print("LivePhotoHandler: Image extension: \(imageExtension)")
        print("LivePhotoHandler: Video extension: \(videoExtension)")
        
        // 验证文件格式
        if !["jpg", "jpeg", "heic"].contains(imageExtension) {
            let error = NSError(domain: "LivePhotoHandler", code: -3, userInfo: [NSLocalizedDescriptionKey: "Image format not supported, need jpg/jpeg/heic"])
            completion(error)
            return
        }
        
        // 创建唯一标识符
        let identifier = UUID().uuidString
        
        // 创建临时文件路径
        let tempDirectory = NSTemporaryDirectory()
        let imageFileName = imageURL.deletingPathExtension().lastPathComponent
        let videoFileName = videoURL.deletingPathExtension().lastPathComponent
        let tempImageURL = URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(imageFileName).\(imageExtension)")
        let tempVideoURL = URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(videoFileName).mov")
        
        print("LivePhotoHandler: Temp image path: \(tempImageURL.path)")
        print("LivePhotoHandler: Temp video path: \(tempVideoURL.path)")
        
        // 处理图片和视频
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                // 处理图片
                print("LivePhotoHandler: Starting to process image")
                let processedImageURL = try self.livePhotoUtils.addPhotoIdentifier(
                    identifier,
                    fromPhotoURL: imageURL,
                    to: tempImageURL
                )
                print("LivePhotoHandler: Image processed successfully")
                
                // 处理视频
                print("LivePhotoHandler: Starting to process video")
                self.livePhotoUtils.addVideoIdentifier(
                    identifier,
                    fromVideoURL: videoURL,
                    to: tempVideoURL
                ) { progress in
                    print("LivePhotoHandler: Video conversion progress: \(progress * 100)%")
                } completion: { result in
                    switch result {
                    case .success(let processedVideoURL):
                        print("LivePhotoHandler: Video processed successfully")
                        
                        // 保存前检查文件是否存在
                        guard FileManager.default.fileExists(atPath: processedImageURL.path),
                              FileManager.default.fileExists(atPath: processedVideoURL.path) else {
                            let error = NSError(domain: "LivePhotoHandler", code: -5, userInfo: [NSLocalizedDescriptionKey: "Processed files do not exist"])
                            completion(error)
                            return
                        }
                        
                        // 保存LivePhoto
                        // 使用信号量等待保存完成
                        let semaphore = DispatchSemaphore(value: 0)
                        var saveError: Error? = nil
                        var saveSuccess = false
                        
                        print("LivePhotoHandler: Starting to save to Photos library")
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetCreationRequest.forAsset()
                            let options = PHAssetResourceCreationOptions()
                            options.shouldMoveFile = false
                            
                            print("LivePhotoHandler: Adding resources to Photos library")
                            request.addResource(with: .photo, fileURL: processedImageURL, options: options)
                            request.addResource(with: .pairedVideo, fileURL: processedVideoURL, options: options)
                            
                        }) { success, error in
                            saveSuccess = success
                            saveError = error
                            if let error = error {
                                print("LivePhotoHandler: Photos library reported error: \(error.localizedDescription)")
                            }
                            semaphore.signal()
                        }
                        
                        semaphore.wait()
                        
                        // 清理临时文件
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // 通过主线程回调
                        DispatchQueue.main.async {
                            if saveSuccess {
                                print("LivePhotoHandler: Live Photo saved successfully")
                                completion(nil)
                            } else if let error = saveError {
                                print("LivePhotoHandler: Failed to save Live Photo: \(error.localizedDescription)")
                                completion(error)
                            } else {
                                let error = NSError(domain: "LivePhotoHandler", code: -6, userInfo: [NSLocalizedDescriptionKey: "Failed to save live photo"])
                                completion(error)
                            }
                        }
                        
                    case .failure(let error):
                        print("LivePhotoHandler: Video processing failed: \(error.localizedDescription)")
                        // 清理临时文件
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // 通过主线程回调错误
                        DispatchQueue.main.async {
                            print("LivePhotoHandler: Processing failed: \(error.localizedDescription)")
                            completion(error)
                        }
                    }
                }
            } catch {
                print("LivePhotoHandler: Image processing failed: \(error.localizedDescription)")
                // 清理临时文件
                self.cleanupTempFiles(tempImageURL, tempVideoURL)
                
                // 通过主线程回调错误
                DispatchQueue.main.async {
                    print("LivePhotoHandler: Processing failed: \(error.localizedDescription)")
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
                } catch {
                    print("LivePhotoHandler: Failed to delete temporary file: \(file.path)")
                }
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
