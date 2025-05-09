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
            logger.error("无法创建图像源")
            throw error
        }
        let identifierInfo = ["17" : identifier]
        imageProperties[kCGImagePropertyMakerAppleDictionary] = identifierInfo
        guard let imageDestination = CGImageDestinationCreateWithURL(destinationURL as CFURL, kUTTypeJPEG, 1, nil) else {
            let error = ImageProcessingError.unableToReadImage
            logger.error("无法创建图像目标")
            throw error
        }
        CGImageDestinationAddImage(imageDestination, imageRef, imageProperties as CFDictionary)
        if CGImageDestinationFinalize(imageDestination) {
            logger.info("成功处理图像: \(destinationURL.lastPathComponent)")
            return destinationURL
        } else {
            let error = ImageProcessingError.unableToWriteImage
            logger.error("无法写入图像")
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
    
    // 获取视频码率函数
    private func getVideoBitRate(from videoTrack: AVAssetTrack) -> Int {
        // 获取原始码率
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
        logger.info("开始处理视频文件: \(videoURL.path)")
        
        let asset = AVURLAsset(url: videoURL)
        
        // --- Reader ---
        
        // Create the video reader
        guard let videoReader = try? AVAssetReader(asset: asset) else {
            logger.error("创建视频读取器失败")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "视频读取")
            completion(.failure(error))
            return
        }
        
        // Create the video reader output
        let videoTracks = asset.tracks(withMediaType: .video)
        guard let videoTrack = videoTracks.first else {
            logger.error("视频文件中没有找到视频轨道")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "视频轨道")
            completion(.failure(error))
            return
        }
        
        logger.info("找到视频轨道，尺寸: \(videoTrack.naturalSize), 帧率: \(videoTrack.nominalFrameRate)")
        
        let videoReaderOutputSettings : [String : Any] = [kCVPixelBufferPixelFormatTypeKey as String : kCVPixelFormatType_32BGRA]
        let videoReaderOutput = AVAssetReaderTrackOutput(track: videoTrack, outputSettings: videoReaderOutputSettings)
        
        // Add the video reader output to video reader
        videoReader.add(videoReaderOutput)
        
        // Create the audio reader
        guard let audioReader = try? AVAssetReader(asset: asset) else {
            logger.error("创建音频读取器失败")
            let error = VideoProcessingError.loadTracksFailed
            ErrorUtils.logError(error, context: "音频读取")
            completion(.failure(error))
            return
        }
        
        // Check if there are audio tracks
        let audioTracks = asset.tracks(withMediaType: .audio)
        if audioTracks.isEmpty {
            logger.warning("视频文件中没有音频轨道，将创建没有音频的 Live Photo")
        }
        
        var audioReaderOutput: AVAssetReaderTrackOutput? = nil
        var audioTrack: AVAssetTrack? = nil
        
        if let firstAudioTrack = audioTracks.first {
            audioTrack = firstAudioTrack
            audioReaderOutput = AVAssetReaderTrackOutput(track: firstAudioTrack, outputSettings: nil)
            audioReader.add(audioReaderOutput!)
            logger.info("找到音频轨道")
        }
        
        // --- Writer ---
        
        // Create the asset writer
        guard let assetWriter = try? AVAssetWriter(outputURL: destinationURL, fileType: .mov) else {
            logger.error("创建视频写入器失败")
            let error = VideoProcessingError.unableToWriteVideo
            ErrorUtils.logError(error, context: "视频写入")
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
                AVVideoAverageBitRateKey : bitRate // 使用原始码率
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
                        self.logger.error("写入视频数据失败")
                        let error = VideoProcessingError.unableToWriteVideo
                        completion(.failure(error))
                        return
                    }
                } else {
                    self.logger.info("视频处理完成")
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
                            self.logger.error("写入音频数据失败")
                            let error = VideoProcessingError.unableToWriteVideo
                            completion(.failure(error))
                            return
                        }
                    } else {
                        self.logger.info("音频处理完成")
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
                    self.logger.info("视频转换成功完成")
                    completion(.success(destinationURL))
                case .failed:
                    self.logger.error("视频转换失败: \(assetWriter.error?.localizedDescription ?? "未知错误")")
                    if let error = assetWriter.error {
                        ErrorUtils.logError(error, context: "视频转换")
                        completion(.failure(error))
                    } else {
                        let error = VideoProcessingError.unableToWriteVideo
                        completion(.failure(error))
                    }
                case .cancelled:
                    self.logger.error("视频转换被取消")
                    let error = VideoProcessingError.unableToWriteVideo
                    completion(.failure(error))
                default:
                    self.logger.error("视频转换状态未知: \(assetWriter.status.rawValue)")
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

                // 检查文件是否存在
                if !FileUtils.fileExists(at: imageURL.path) || !FileUtils.fileExists(at: videoURL.path) {
                    self.logger.error("文件不存在：\(imageURL) 或 \(videoURL)")
                    let error = AppErrorType.fileNotFound(path: "\(imageURL) 或 \(videoURL)")
                    completion(false, error)
                    return
                }

                // 保存 Live Photo
                PHPhotoLibrary.shared().performChanges({
                    let request = PHAssetCreationRequest.forAsset()
                    request.addResource(with: .photo, fileURL: imageURL, options: nil)
                    request.addResource(with: .pairedVideo, fileURL: videoURL, options: nil)
                }) { success, error in
                    if success {
                        self.logger.info("Live Photo 保存成功：\(imageURL.lastPathComponent)")
                    } else if let error = error {
                        self.logger.error("保存失败：\(error.localizedDescription)")
                        ErrorUtils.logError(error, context: "保存Live Photo")
                    }
                    completion(success, error)
                    semaphore.signal()
                }

                semaphore.wait()
            } else {
                let error = AppErrorType.permissionDenied(type: "相册访问")
                self.logger.error("未授权访问相册")
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


