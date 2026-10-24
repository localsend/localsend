import Photos
import Foundation

/// Reconstructs received Live Photo resources and saves them to the photo library.
@objc class LivePhotoHandler: NSObject {
    private let livePhotoUtils = LivePhotoUtils()
    private let logger = Logger(module: "LivePhotoHandler")

    /// Adds matching metadata, saves the pair, and removes only the temporary copies.
    @objc func saveLivePhoto(imagePath: String, videoPath: String, completion: @escaping (Error?) -> Void) {
        guard FileUtils.fileExists(at: imagePath), FileUtils.fileExists(at: videoPath) else {
            logger.error("A Live Photo component is missing")
            completion(AppErrorType.fileNotFound(path: "Live Photo component"))
            return
        }
        let imageURL = URL(fileURLWithPath: imagePath)
        let videoURL = URL(fileURLWithPath: videoPath)
        let tempImageURL = FileUtils.createTempFilePath(originalURL: imageURL)
        let tempVideoURL = FileUtils.createTempFilePath(originalURL: videoURL, suffix: "mov")
        let identifier = UUID().uuidString

        func finish(_ error: Error?) {
            FileUtils.cleanupTempFiles([tempImageURL, tempVideoURL])
            DispatchQueue.main.async { completion(error) }
        }

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let image = try self.livePhotoUtils.addPhotoIdentifier(
                    identifier, fromPhotoURL: imageURL, to: tempImageURL)
                self.livePhotoUtils.addVideoIdentifier(
                    identifier, fromVideoURL: videoURL, to: tempVideoURL
                ) { result in
                    switch result {
                    case .success(let video):
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetCreationRequest.forAsset()
                            request.addResource(with: .photo, fileURL: image, options: nil)
                            request.addResource(with: .pairedVideo, fileURL: video, options: nil)
                        }) { success, error in
                            finish(success ? nil : error ?? AppErrorType.internalError(reason: "Failed to save Live Photo"))
                        }
                    case .failure(let error):
                        finish(error)
                    }
                }
            } catch {
                finish(error)
            }
        }
    }
}

enum ImageProcessingError: Error {
    case invalidImageSource
    case unableToWriteImage
}

enum VideoProcessingError: Error {
    case loadTracksFailed
    case unableToWriteVideo
}
