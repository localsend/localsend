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
        logger.info("Starting to save Live Photo. Image path: [\(imagePath)],Video path: [\(videoPath)]")
        
        // Check if files exist
        if !FileUtils.fileExists(at: imagePath) {
            let error = AppErrorType.fileNotFound(path: imagePath)
            logger.error("Image file does not exist: [\(imagePath)]")
            completion(error)
            return
        }
        
        if !FileUtils.fileExists(at: videoPath) {
            let error = AppErrorType.fileNotFound(path: videoPath)
            logger.error("Video file does not exist: [\(videoPath)]")
            completion(error)
            return
        }
        
        let imageURL = URL(fileURLWithPath: imagePath)
        let videoURL = URL(fileURLWithPath: videoPath)
        
        // Create unique identifier
        let identifier = UUID().uuidString
        
        // Create temporary file paths
        let tempImageURL = FileUtils.createTempFilePath(originalURL: imageURL, prefix: nil, suffix: nil)
        let tempVideoURL = FileUtils.createTempFilePath(originalURL: videoURL, prefix: nil, suffix: "mov")
        
        // Process image and video
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                // Process image
                self.logger.info("Starting to process image")
                let processedImageURL = try self.livePhotoUtils.addPhotoIdentifier(
                    identifier,
                    fromPhotoURL: imageURL,
                    to: tempImageURL
                )
                
                // Process video
                self.logger.info("Starting to process video")
                self.livePhotoUtils.addVideoIdentifier(
                    identifier,
                    fromVideoURL: videoURL,
                    to: tempVideoURL
                ) { progress in
                    self.logger.debug("Video conversion progress: \(Int(progress * 100))%")
                } completion: { result in
                    switch result {
                    case .success(let processedVideoURL):
                        // Check if files exist before saving
                        if !FileUtils.fileExists(at: processedImageURL.path) || !FileUtils.fileExists(at: processedVideoURL.path) {
                            let error = AppErrorType.fileNotFound(path: "processed files")
                            ErrorUtils.logError(error, context: "Live Photo processing")
                            
                            // Clean up temporary files
                            self.cleanupTempFiles(tempImageURL, tempVideoURL)
                            
                            DispatchQueue.main.async {
                                completion(error)
                            }
                            return
                        }
                        
                        // Save LivePhoto
                        // Use semaphore to wait for save completion
                        let semaphore = DispatchSemaphore(value: 0)
                        var saveError: Error? = nil
                        var saveSuccess = false
                        
                        self.logger.info("Starting to save to photo library")
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetCreationRequest.forAsset()
                            let options = PHAssetResourceCreationOptions()
                            options.shouldMoveFile = false
                            
                            self.logger.debug("Adding resources to photo library")
                            request.addResource(with: .photo, fileURL: processedImageURL, options: options)
                            request.addResource(with: .pairedVideo, fileURL: processedVideoURL, options: options)
                            
                        }) { success, error in
                            saveSuccess = success
                            saveError = error
                            if let error = error {
                                self.logger.error("Photo library reported error: \(error.localizedDescription)")
                                ErrorUtils.logError(error, context: "Save to photo library")
                            }
                            semaphore.signal()
                        }
                        
                        semaphore.wait()
                        
                        // Clean up temporary files
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // Callback through main thread
                        DispatchQueue.main.async {
                            if saveSuccess {
                                self.logger.info("Live Photo saved successfully.")
                                completion(nil)
                            } else if let error = saveError {
                                self.logger.error("Live Photo save failed: \(error.localizedDescription)")
                                completion(error)
                            } else {
                                let error = AppErrorType.internalError(reason: "Failed to save to photo library")
                                self.logger.error("Save failed")
                                completion(error)
                            }
                        }
                        
                    case .failure(let error):
                        self.logger.error("Video processing failed: \(error.localizedDescription)")
                        ErrorUtils.logError(error, context: "Video processing")
                        
                        // Clean up temporary files
                        self.cleanupTempFiles(tempImageURL, tempVideoURL)
                        
                        // Callback error through main thread
                        DispatchQueue.main.async {
                            completion(error)
                        }
                    }
                }
            } catch {
                self.logger.error("Image processing failed: \(error.localizedDescription)")
                ErrorUtils.logError(error, context: "Image processing")
                
                // Clean up temporary files
                self.cleanupTempFiles(tempImageURL, tempVideoURL)
                
                // Callback error through main thread
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

// Extension for AVAsset to support frame counting
extension AVAsset {
    func frameCount() throws -> Int {
        guard let videoTrack = tracks(withMediaType: .video).first else {
            let error = AppErrorType.mediaTrackMissing(type: "video")
            throw error
        }
        let frameRate = videoTrack.nominalFrameRate
        return Int(Float(duration.value) * frameRate / Float(duration.timescale))
    }
}
