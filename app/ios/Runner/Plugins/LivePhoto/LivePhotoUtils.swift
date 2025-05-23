//
//  LivePhotoUtils.swift
//  live_easier_cmd
//
//  Created by zerun on 2024/11/3.
//
import Foundation
import ImageIO
import MobileCoreServices
import AVFoundation
import Photos

class LivePhotoUtils {
    private let logger = Logger(module: "LivePhotoUtils")
    
    func addPhotoIdentifier(
        _ identifier: String,
        fromPhotoURL photoURL: URL,
        to destinationURL: URL
    ) throws -> URL {
        guard let imageSource = CGImageSourceCreateWithURL(photoURL as CFURL, nil),
              let imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, nil),
              var imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [AnyHashable : Any] else {
            let error = ImageProcessingError.invalidImageSource
            logger.error("Unable to create image source")
            throw error
        }
        let identifierInfo = ["17" : identifier]
        imageProperties[kCGImagePropertyMakerAppleDictionary] = identifierInfo
        guard let imageDestination = CGImageDestinationCreateWithURL(destinationURL as CFURL, kUTTypeJPEG, 1, nil) else {
            let error = ImageProcessingError.unableToReadImage
            logger.error("Unable to create image destination")
            throw error
        }
        CGImageDestinationAddImage(imageDestination, imageRef, imageProperties as CFDictionary)
        if CGImageDestinationFinalize(imageDestination) {
            logger.info("Successfully processed image: \(destinationURL.lastPathComponent)")
            return destinationURL
        } else {
            let error = ImageProcessingError.unableToWriteImage
            logger.error("Unable to write image")
            throw error
        }
    }
    
    private func metadataItem(for identifier: String) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.keySpace = AVMetadataKeySpace.quickTimeMetadata // "mdta"
        item.dataType = "com.apple.metadata.datatype.UTF-8"
        item.key = AVMetadataKey.quickTimeMetadataKeyContentIdentifier as any NSCopying & NSObjectProtocol // "com.apple.quicktime.content.identifier"
        item.value = identifier as any NSCopying & NSObjectProtocol
        return item
    }
    
    private func stillImageTimeMetadataAdaptor() -> AVAssetWriterInputMetadataAdaptor {
        let quickTimeMetadataKeySpace = AVMetadataKeySpace.quickTimeMetadata.rawValue // "mdta"
        let stillImageTimeKey = "com.apple.quicktime.still-image-time"
        let spec: [NSString : Any] = [
            kCMMetadataFormatDescriptionMetadataSpecificationKey_Identifier as NSString : "\(quickTimeMetadataKeySpace)/\(stillImageTimeKey)",
            kCMMetadataFormatDescriptionMetadataSpecificationKey_DataType as NSString : kCMMetadataBaseDataType_SInt8]
        var desc : CMFormatDescription? = nil
        CMMetadataFormatDescriptionCreateWithMetadataSpecifications(
            allocator: kCFAllocatorDefault,
            metadataType: kCMMetadataFormatType_Boxed,
            metadataSpecifications: [spec] as CFArray,
            formatDescriptionOut: &desc)
        let input = AVAssetWriterInput(
            mediaType: .metadata,
            outputSettings: nil,
            sourceFormatHint: desc)
        return AVAssetWriterInputMetadataAdaptor(assetWriterInput: input)
    }
    
    private func stillImageTimeMetadataItem() -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.key = "com.apple.quicktime.still-image-time" as any NSCopying & NSObjectProtocol
        item.keySpace = AVMetadataKeySpace.quickTimeMetadata // "mdta"
        item.value = 0 as any NSCopying & NSObjectProtocol
        item.dataType = kCMMetadataBaseDataType_SInt8 as String // "com.apple.metadata.datatype.int8"
        return item
    }
    
    // Get video bitrate function
    private func getVideoBitRate(from videoTrack: AVAssetTrack) -> Int {
        // Get original bitrate
        let bitRate = videoTrack.estimatedDataRate
        
        return Int(bitRate)
    }
    
    func addVideoIdentifier(
        _ identifier: String,
        fromVideoURL videoURL: URL,
        to destinationURL: URL,
        progress: ((Float) -> Void)? = nil,
        completion: @escaping (Result<URL, Error>) -> Void
    ) {
        logger.info("Starting to process video file: \(videoURL.path)")
        
        let asset = AVURLAsset(url: videoURL)
        
        // --- Reader ---
        
        // Create the video reader
        guard let videoReader = try? AVAssetReader(asset: asset) else {
            logger.error("Failed to create video reader")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "Video reading")
            completion(.failure(error))
            return
        }
        
        // Create the video reader output
        let videoTracks = asset.tracks(withMediaType: .video)
        guard let videoTrack = videoTracks.first else {
            logger.error("No video track found in video file")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "Video track")
            completion(.failure(error))
            return
        }
        
        logger.info("Found video track, size: \(videoTrack.naturalSize), frame rate: \(videoTrack.nominalFrameRate)")
        
        let videoReaderOutputSettings : [String : Any] = [kCVPixelBufferPixelFormatTypeKey as String : kCVPixelFormatType_32BGRA]
        let videoReaderOutput = AVAssetReaderTrackOutput(track: videoTrack, outputSettings: videoReaderOutputSettings)
        
        // Add the video reader output to video reader
        videoReader.add(videoReaderOutput)
        
        // Create the audio reader
        guard let audioReader = try? AVAssetReader(asset: asset) else {
            logger.error("Failed to create audio reader")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "Audio reading")
            completion(.failure(error))
            return
        }
        
        // Check if there are audio tracks
        let audioTracks = asset.tracks(withMediaType: .audio)
        if audioTracks.isEmpty {
            logger.warning("No audio track found in video file, will create Live Photo without audio")
        }
        
        var audioReaderOutput: AVAssetReaderTrackOutput? = nil
        var audioTrack: AVAssetTrack? = nil
        
        if let firstAudioTrack = audioTracks.first {
            audioTrack = firstAudioTrack
            audioReaderOutput = AVAssetReaderTrackOutput(track: firstAudioTrack, outputSettings: nil)
            audioReader.add(audioReaderOutput!)
            logger.info("Found audio track")
        }
        
        // --- Writer ---
        
        // Create the asset writer
        guard let assetWriter = try? AVAssetWriter(outputURL: destinationURL, fileType: .mov) else {
            logger.error("Failed to create video writer")
            let error = VideoProcessingError.unableToWriteVideo
            ErrorUtils.logError(error, context: "Video writing")
            completion(.failure(error))
            return
        }
        
        // Create the video writer input
        let bitRate = getVideoBitRate(from: videoTrack)
        let videoWriterInputOutputSettings : [String : Any] = [
            AVVideoCodecKey : AVVideoCodecType.h264,
            AVVideoWidthKey : videoTrack.naturalSize.width,
            AVVideoHeightKey : videoTrack.naturalSize.height,
            AVVideoCompressionPropertiesKey : [
                AVVideoAverageBitRateKey : bitRate // Use original bitrate
            ]
        ]
        
        let videoWriterInput = AVAssetWriterInput(mediaType: .video, outputSettings: videoWriterInputOutputSettings)
        videoWriterInput.transform = videoTrack.preferredTransform
        videoWriterInput.expectsMediaDataInRealTime = true
        
        // Add the video writer input to asset writer
        assetWriter.add(videoWriterInput)
        
        // Create the audio writer input if we have audio
        var audioWriterInput: AVAssetWriterInput? = nil
        if audioTrack != nil {
            audioWriterInput = AVAssetWriterInput(mediaType: .audio, outputSettings: nil)
            audioWriterInput?.expectsMediaDataInRealTime = false
            assetWriter.add(audioWriterInput!)
        }
        
        let identifierMetadata = self.metadataItem(for: identifier)
        // Create still image time metadata track
        let stillImageTimeMetadataAdaptor = self.stillImageTimeMetadataAdaptor()
        assetWriter.metadata = [identifierMetadata]
        assetWriter.add(stillImageTimeMetadataAdaptor.assetWriterInput)
        
        // Start the asset writer
        assetWriter.startWriting()
        assetWriter.startSession(atSourceTime: .zero)
        
        // Calculate frame count
        let frameCount = Int(CMTimeGetSeconds(asset.duration) * Float64(videoTrack.nominalFrameRate))
        let stillImagePercent: Float = 0.5
        
        let stillImageTime = CMTime(value: Int64(Float(frameCount) * stillImagePercent), timescale: CMTimeScale(videoTrack.nominalFrameRate))
        let stillImageTimeRange = CMTimeRange(start: stillImageTime, duration: .zero)
        
        stillImageTimeMetadataAdaptor.append(
            AVTimedMetadataGroup(
                items: [self.stillImageTimeMetadataItem()],
                timeRange: stillImageTimeRange))
        
        // Start reading and writing
        videoReader.startReading()
        if audioTrack != nil {
            audioReader.startReading()
        }
        
        let videoQueue = DispatchQueue(label: "videoWriterInputQueue")
        let audioQueue = DispatchQueue(label: "audioWriterInputQueue")
        
        var currentFrameCount = 0
        
        // Group to track completion
        let group = DispatchGroup()
        group.enter() // Video
        if audioTrack != nil {
            group.enter() // Audio
        }
        
        // Process video
        videoWriterInput.requestMediaDataWhenReady(on: videoQueue) {
            while videoWriterInput.isReadyForMoreMediaData {
                if let sampleBuffer = videoReaderOutput.copyNextSampleBuffer() {
                    currentFrameCount += 1
                    if let progress = progress {
                        let progressValue = min(Float(currentFrameCount)/Float(frameCount), 1.0)
                        DispatchQueue.main.async {
                            progress(progressValue)
                        }
                    }
                    if !videoWriterInput.append(sampleBuffer) {
                        videoReader.cancelReading()
                        self.logger.error("Failed to write video data")
                        let error = VideoProcessingError.unableToWriteVideo
                        completion(.failure(error))
                        return
                    }
                } else {
                    self.logger.info("Video processing completed")
                    videoWriterInput.markAsFinished()
                    group.leave()
                    break
                }
            }
        }
        
        // Process audio if available
        if let audioReaderOutput = audioReaderOutput, let audioWriterInput = audioWriterInput {
            audioWriterInput.requestMediaDataWhenReady(on: audioQueue) {
                while audioWriterInput.isReadyForMoreMediaData {
                    if let sampleBuffer = audioReaderOutput.copyNextSampleBuffer() {
                        if !audioWriterInput.append(sampleBuffer) {
                            audioReader.cancelReading()
                            self.logger.error("Failed to write audio data")
                            let error = VideoProcessingError.unableToWriteVideo
                            completion(.failure(error))
                            return
                        }
                    } else {
                        self.logger.info("Audio processing completed")
                        audioWriterInput.markAsFinished()
                        group.leave()
                        break
                    }
                }
            }
        }
        
        // Wait for both video and audio to finish
        group.notify(queue: .main) {
            assetWriter.finishWriting {
                switch assetWriter.status {
                case .completed:
                    self.logger.info("Video conversion completed successfully")
                    completion(.success(destinationURL))
                case .failed:
                    self.logger.error("Video conversion failed: \(assetWriter.error?.localizedDescription ?? "unknown error")")
                    if let error = assetWriter.error {
                        ErrorUtils.logError(error, context: "Video conversion")
                        completion(.failure(error))
                    } else {
                        let error = VideoProcessingError.unableToWriteVideo
                        completion(.failure(error))
                    }
                case .cancelled:
                    self.logger.error("Video conversion was cancelled")
                    let error = VideoProcessingError.unableToWriteVideo
                    completion(.failure(error))
                default:
                    self.logger.error("Video conversion status unknown: \(assetWriter.status.rawValue)")
                    let error = VideoProcessingError.unableToWriteVideo
                    completion(.failure(error))
                }
            }
        }
    }
    
    private let serialQueue = DispatchQueue(label: "com.example.LivePhotoSaver")
    func saveAsLivePhoto(imageURL: URL, videoURL: URL, completion: @escaping (Bool, Error?) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                let semaphore = DispatchSemaphore(value: 0)

                // Check if files exist
                if !FileUtils.fileExists(at: imageURL.path) || !FileUtils.fileExists(at: videoURL.path) {
                    self.logger.error("Files do not exist: \(imageURL) or \(videoURL)")
                    let error = AppErrorType.fileNotFound(path: "\(imageURL) or \(videoURL)")
                    completion(false, error)
                    return
                }

                // Save Live Photo
                PHPhotoLibrary.shared().performChanges({
                    let request = PHAssetCreationRequest.forAsset()
                    request.addResource(with: .photo, fileURL: imageURL, options: nil)
                    request.addResource(with: .pairedVideo, fileURL: videoURL, options: nil)
                }) { success, error in
                    if success {
                        self.logger.info("Live Photo saved successfully: \(imageURL.lastPathComponent)")
                    } else if let error = error {
                        self.logger.error("Save failed: \(error.localizedDescription)")
                        ErrorUtils.logError(error, context: "Save Live Photo")
                    }
                    completion(success, error)
                    semaphore.signal()
                }

                semaphore.wait()
            } else {
                let error = AppErrorType.permissionDenied(type: "photo library access")
                self.logger.error("Unauthorized access to photo library")
                completion(false, error)
            }
        }
    }
}

extension AVAsset {
    func calculateFrameCount() -> Int {
        let videoReader = try? AVAssetReader(asset: self)
        guard let videoTrack = self.tracks(withMediaType: .video).first else { return 0 }
        return Int(CMTimeGetSeconds(self.duration) * Float64(videoTrack.nominalFrameRate))
    }
    
    func makeStillImageTimeRange(percent: Float, inFrameCount: Int = 0) -> CMTimeRange {
        var time = self.duration
        var frameCount = inFrameCount
        if frameCount == 0 {
            frameCount = self.calculateFrameCount()
        }
        let duration = Int64(Float(time.value) / Float(frameCount))
        time.value = Int64(Float(time.value) * percent)
        return CMTimeRangeMake(start: time, duration: CMTimeMake(value: duration, timescale: time.timescale))
    }
}


