import Photos
import PhotosUI
import MobileCoreServices
import UIKit
import AVFoundation

@objc class LivePhotoHandler: NSObject {
    
    @objc func saveLivePhoto(imagePath: String, videoPath: String, album: String?, completion: @escaping (Error?) -> Void) {
        // 检查权限
        PHPhotoLibrary.requestAuthorization { (status) in
            if status != .authorized {
                completion(NSError(domain: "LivePhotoHandler", code: -1, userInfo: [NSLocalizedDescriptionKey: "Photos access not authorized"]))
                return
            }
            
            // 检查文件是否存在
            guard FileManager.default.fileExists(atPath: imagePath),
                  FileManager.default.fileExists(atPath: videoPath) else {
                completion(NSError(domain: "LivePhotoHandler", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid file paths"]))
                return
            }
            
            // 创建 URL
            let imageURL = URL(fileURLWithPath: imagePath)
            let videoURL = URL(fileURLWithPath: videoPath)
            
            // 生成唯一标识符
            let identifier = UUID().uuidString
            
            // 创建临时文件URL
            let tempImageURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(identifier).jpg")
            let tempVideoURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(identifier).mov")
            
            do {
                // 为图片添加标识符
                try self.addPhotoIdentifier(identifier, fromPhotoURL: imageURL, to: tempImageURL)
                
                // 为视频添加标识符和静态图片时间
                self.addVideoIdentifier(identifier, fromVideoURL: videoURL, to: tempVideoURL) { error in
                    if let error = error {
                        try? FileManager.default.removeItem(at: tempImageURL)
                        try? FileManager.default.removeItem(at: tempVideoURL)
                        completion(error)
                        return
                    }
                    
                    // 创建 LivePhoto
                    PHLivePhoto.request(withResourceFileURLs: [tempImageURL, tempVideoURL],
                                      placeholderImage: nil,
                                      targetSize: .zero,
                                      contentMode: .aspectFit) { livePhoto, info in
                        guard let livePhoto = livePhoto else {
                            try? FileManager.default.removeItem(at: tempImageURL)
                            try? FileManager.default.removeItem(at: tempVideoURL)
                            completion(NSError(domain: "LivePhotoHandler", code: -5, userInfo: [NSLocalizedDescriptionKey: "Failed to create live photo"]))
                            return
                        }
                        
                        // 保存到相册
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetCreationRequest.forAsset()
                            let options = PHAssetResourceCreationOptions()
                            request.addResource(with: .photo, fileURL: tempImageURL, options: options)
                            request.addResource(with: .pairedVideo, fileURL: tempVideoURL, options: options)
                            
                            // 如果指定了相册，保存到指定相册
                            if let albumName = album {
                                let fetchOptions = PHFetchOptions()
                                fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
                                let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
                                
                                if let albumCollection = collection.firstObject {
                                    // 相册存在，添加到相册
                                    let albumChangeRequest = PHAssetCollectionChangeRequest(for: albumCollection)
                                    let assetPlaceholder = request.placeholderForCreatedAsset
                                    albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
                                } else {
                                    // 相册不存在，创建新相册
                                    let albumCreationRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
                                    let assetPlaceholder = request.placeholderForCreatedAsset
                                    let albumPlaceholder = albumCreationRequest.placeholderForCreatedAssetCollection
                                    
                                    let addAssetRequest = PHAssetCollectionChangeRequest(for: PHAssetCollection())
                                    addAssetRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
                                }
                            }
                            
                        }, completionHandler: { success, error in
                            // 清理临时文件
                            try? FileManager.default.removeItem(at: tempImageURL)
                            try? FileManager.default.removeItem(at: tempVideoURL)
                            
                            if success {
                                completion(nil)
                            } else {
                                completion(error)
                            }
                        })
                    }
                }
            } catch {
                try? FileManager.default.removeItem(at: tempImageURL)
                try? FileManager.default.removeItem(at: tempVideoURL)
                completion(error)
            }
        }
    }
    
    private func addPhotoIdentifier(_ identifier: String, fromPhotoURL photoURL: URL, to destinationURL: URL) throws {
        guard let imageSource = CGImageSourceCreateWithURL(photoURL as CFURL, nil),
              let imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            throw NSError(domain: "LivePhotoHandler", code: -9, userInfo: [NSLocalizedDescriptionKey: "Failed to create image source"])
        }
        
        guard let imageDestination = CGImageDestinationCreateWithURL(destinationURL as CFURL, kUTTypeJPEG, 1, nil) else {
            throw NSError(domain: "LivePhotoHandler", code: -10, userInfo: [NSLocalizedDescriptionKey: "Failed to create image destination"])
        }
        
        let contentIdentifierKey = "ContentIdentifier" as NSString as CFString
        let contentIdentifierValue = identifier as NSString as CFString
        let quickTimeMetadata = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)
        CFDictionarySetValue(quickTimeMetadata, contentIdentifierKey, contentIdentifierValue)
        
        let imageMetadata = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)
        CFDictionarySetValue(imageMetadata, kCGImageMetadataEnumerateRecursively, kCFBooleanTrue)
        CFDictionarySetValue(imageMetadata, kCGImagePropertyQuickTimeMetadata, quickTimeMetadata)
        
        let imageProperties = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)
        CFDictionarySetValue(imageProperties, kCGImageDestinationMetadata, imageMetadata)
        
        CGImageDestinationAddImage(imageDestination, imageRef, imageProperties)
        
        if !CGImageDestinationFinalize(imageDestination) {
            throw NSError(domain: "LivePhotoHandler", code: -11, userInfo: [NSLocalizedDescriptionKey: "Failed to finalize image destination"])
        }
    }
    
    private func addVideoIdentifier(_ identifier: String, fromVideoURL videoURL: URL, to destinationURL: URL, completion: @escaping (Error?) -> Void) {
        let asset = AVURLAsset(url: videoURL)
        let duration = CMTimeGetSeconds(asset.duration)
        let stillImageTime = duration / 2.0
        
        // 创建 AVAssetExportSession
        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetPassthrough) else {
            completion(NSError(domain: "LivePhotoHandler", code: -4, userInfo: [NSLocalizedDescriptionKey: "Failed to create export session"]))
            return
        }
        
        // 创建标识符元数据
        let identifierMetadata = AVMutableMetadataItem()
        identifierMetadata.keySpace = .quickTimeMetadata
        identifierMetadata.key = AVMetadataKey.quickTimeMetadataKeyContentIdentifier as NSString
        identifierMetadata.value = identifier as NSString
        identifierMetadata.dataType = "com.apple.metadata.datatype.UTF-8"
        
        // 创建静态图片时间元数据
        let stillImageTimeMetadata = AVMutableMetadataItem()
        stillImageTimeMetadata.keySpace = .quickTimeMetadata
        stillImageTimeMetadata.key = "com.apple.quicktime.still-image-time" as NSString
        stillImageTimeMetadata.value = stillImageTime as NSNumber
        stillImageTimeMetadata.dataType = "com.apple.metadata.datatype.int8"
        
        exportSession.metadata = [identifierMetadata, stillImageTimeMetadata]
        exportSession.outputURL = destinationURL
        exportSession.outputFileType = .mov
        
        exportSession.exportAsynchronously {
            if exportSession.status == .completed {
                completion(nil)
            } else {
                completion(exportSession.error ?? NSError(domain: "LivePhotoHandler", code: -12, userInfo: [NSLocalizedDescriptionKey: "Export failed with unknown error"]))
            }
        }
    }
} 