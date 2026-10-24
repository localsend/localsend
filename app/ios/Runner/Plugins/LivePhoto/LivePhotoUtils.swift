import Foundation
import ImageIO
import AVFoundation

/// Adds the shared content identifier and still-image time required by PhotoKit.
class LivePhotoUtils {
    /// Copies the source image with the Live Photo identifier in its Apple metadata.
    func addPhotoIdentifier(
        _ identifier: String,
        fromPhotoURL photoURL: URL,
        to destinationURL: URL
    ) throws -> URL {
        guard let imageSource = CGImageSourceCreateWithURL(photoURL as CFURL, nil),
              let imageType = CGImageSourceGetType(imageSource),
              var properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [AnyHashable: Any] else {
            throw ImageProcessingError.invalidImageSource
        }
        var appleMetadata = properties[kCGImagePropertyMakerAppleDictionary] as? [String: Any] ?? [:]
        appleMetadata["17"] = identifier
        properties[kCGImagePropertyMakerAppleDictionary] = appleMetadata
        guard let destination = CGImageDestinationCreateWithURL(destinationURL as CFURL, imageType, 1, nil) else {
            throw ImageProcessingError.unableToWriteImage
        }
        CGImageDestinationAddImageFromSource(destination, imageSource, 0, properties as CFDictionary)
        guard CGImageDestinationFinalize(destination) else {
            throw ImageProcessingError.unableToWriteImage
        }
        return destinationURL
    }

    /// Associates the MOV with the image's MakerApple content identifier.
    private func metadataItem(for identifier: String) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.keySpace = .quickTimeMetadata
        item.dataType = kCMMetadataBaseDataType_UTF8 as String
        item.key = AVMetadataKey.quickTimeMetadataKeyContentIdentifier as NSString
        item.value = identifier as NSString
        return item
    }

    /// Creates the signed-byte timed-metadata track recognized by PhotoKit.
    private func stillImageTimeMetadataAdaptor() -> AVAssetWriterInputMetadataAdaptor {
        let spec: [NSString: Any] = [
            kCMMetadataFormatDescriptionMetadataSpecificationKey_Identifier as NSString:
                "mdta/com.apple.quicktime.still-image-time",
            kCMMetadataFormatDescriptionMetadataSpecificationKey_DataType as NSString:
                kCMMetadataBaseDataType_SInt8
        ]
        var description: CMFormatDescription?
        CMMetadataFormatDescriptionCreateWithMetadataSpecifications(
            allocator: kCFAllocatorDefault,
            metadataType: kCMMetadataFormatType_Boxed,
            metadataSpecifications: [spec] as CFArray,
            formatDescriptionOut: &description)
        let input = AVAssetWriterInput(mediaType: .metadata, outputSettings: nil, sourceFormatHint: description)
        return AVAssetWriterInputMetadataAdaptor(assetWriterInput: input)
    }

    /// Marks the selected still frame in the paired video.
    private func stillImageTimeMetadataItem() -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.key = "com.apple.quicktime.still-image-time" as NSString
        item.keySpace = .quickTimeMetadata
        item.value = NSNumber(value: Int8(0))
        item.dataType = kCMMetadataBaseDataType_SInt8 as String
        return item
    }

    /// Remuxes compressed video/audio into MOV, preserving their formats and orientation.
    /// All sample callbacks share a serial queue so failure cancels processing exactly once.
    func addVideoIdentifier(
        _ identifier: String,
        fromVideoURL videoURL: URL,
        to destinationURL: URL,
        completion: @escaping (Result<URL, Error>) -> Void
    ) {
        let asset = AVURLAsset(url: videoURL)
        let reader: AVAssetReader
        let writer: AVAssetWriter
        do {
            reader = try AVAssetReader(asset: asset)
            writer = try AVAssetWriter(outputURL: destinationURL, fileType: .mov)
        } catch {
            completion(.failure(error))
            return
        }
        guard let videoTrack = asset.tracks(withMediaType: .video).first,
              let videoFormat = videoTrack.formatDescriptions.first,
              asset.duration.isNumeric, CMTimeGetSeconds(asset.duration) > 0 else {
            completion(.failure(VideoProcessingError.loadTracksFailed))
            return
        }
        let videoOutput = AVAssetReaderTrackOutput(track: videoTrack, outputSettings: nil)
        let videoInput = AVAssetWriterInput(
            mediaType: .video, outputSettings: nil, sourceFormatHint: (videoFormat as! CMFormatDescription))
        videoInput.transform = videoTrack.preferredTransform
        videoInput.expectsMediaDataInRealTime = false
        guard reader.canAdd(videoOutput), writer.canAdd(videoInput) else {
            completion(.failure(VideoProcessingError.unableToWriteVideo))
            return
        }
        reader.add(videoOutput)
        writer.add(videoInput)

        var audioReader: AVAssetReader?
        var audioOutput: AVAssetReaderTrackOutput?
        var audioInput: AVAssetWriterInput?
        if let track = asset.tracks(withMediaType: .audio).first {
            let trackReader: AVAssetReader
            do {
                trackReader = try AVAssetReader(asset: asset)
            } catch {
                completion(.failure(error))
                return
            }
            guard let format = track.formatDescriptions.first else {
                completion(.failure(VideoProcessingError.loadTracksFailed))
                return
            }
            let output = AVAssetReaderTrackOutput(track: track, outputSettings: nil)
            let input = AVAssetWriterInput(mediaType: .audio, outputSettings: nil, sourceFormatHint: (format as! CMFormatDescription))
            input.expectsMediaDataInRealTime = false
            guard trackReader.canAdd(output), writer.canAdd(input) else {
                completion(.failure(VideoProcessingError.unableToWriteVideo))
                return
            }
            trackReader.add(output)
            audioReader = trackReader
            writer.add(input)
            audioOutput = output
            audioInput = input
        }

        let metadata = stillImageTimeMetadataAdaptor()
        guard writer.canAdd(metadata.assetWriterInput) else {
            completion(.failure(VideoProcessingError.unableToWriteVideo))
            return
        }
        writer.add(metadata.assetWriterInput)
        writer.metadata = asset.metadata.filter {
            $0.identifier != .quickTimeMetadataContentIdentifier
        } + [metadataItem(for: identifier)]
        guard writer.startWriting() else {
            completion(.failure(writer.error ?? VideoProcessingError.unableToWriteVideo))
            return
        }
        writer.startSession(atSourceTime: .zero)
        // A finite duration also works for variable frame rates and a nominal rate of zero.
        let stillTime = CMTimeMultiplyByFloat64(asset.duration, multiplier: 0.5)
        guard metadata.append(AVTimedMetadataGroup(
            items: [stillImageTimeMetadataItem()],
            timeRange: CMTimeRange(start: stillTime, duration: CMTimeMinimum(
                CMTime(value: 1, timescale: 30), CMTimeSubtract(asset.duration, stillTime))))) else {
            writer.cancelWriting()
            completion(.failure(writer.error ?? VideoProcessingError.unableToWriteVideo))
            return
        }
        metadata.assetWriterInput.markAsFinished()
        guard reader.startReading() else {
            writer.cancelWriting()
            completion(.failure(reader.error ?? VideoProcessingError.loadTracksFailed))
            return
        }

        if let audioReader = audioReader, !audioReader.startReading() {
            reader.cancelReading()
            writer.cancelWriting()
            completion(.failure(audioReader.error ?? VideoProcessingError.loadTracksFailed))
            return
        }

        let queue = DispatchQueue(label: "org.localsend.live-photo-remux")
        var videoFinished = false
        var audioFinished = audioInput == nil
        var finished = false
        var videoEnd = CMTime.invalid
        var audioEnd = CMTime.invalid

        func fail(_ error: Error) {
            guard !finished else { return }
            finished = true
            reader.cancelReading()
            audioReader?.cancelReading()
            writer.cancelWriting()
            completion(.failure(error))
        }

        func finishIfReady() {
            guard !finished, videoFinished, audioFinished else { return }
            finished = true
            guard reader.status == .completed, audioReader == nil || audioReader?.status == .completed else {
                reader.cancelReading()
                writer.cancelWriting()
                completion(.failure(reader.error ?? audioReader?.error ?? VideoProcessingError.loadTracksFailed))
                return
            }
            writer.finishWriting {
                if writer.status == .completed {
                    completion(.success(destinationURL))
                } else {
                    completion(.failure(writer.error ?? VideoProcessingError.unableToWriteVideo))
                }
            }
        }

        func copySamples(reader: AVAssetReader, track: AVAssetTrack, from output: AVAssetReaderTrackOutput,
                         to input: AVAssetWriterInput, isVideo: Bool) {
            guard !finished, !(isVideo ? videoFinished : audioFinished) else { return }
            while input.isReadyForMoreMediaData {
                guard let sample = output.copyNextSampleBuffer() else {
                    guard reader.status == .completed else {
                        fail(reader.error ?? VideoProcessingError.loadTracksFailed)
                        return
                    }
                    // Some truncated containers report a normal EOF. Require samples
                    // to reach the declared track end before accepting the result.
                    let end = isVideo ? videoEnd : audioEnd
                    let tolerance = CMTime(value: 1, timescale: track.naturalTimeScale)
                    guard end.isNumeric, CMTimeCompare(CMTimeAdd(end, tolerance), CMTimeRangeGetEnd(track.timeRange)) >= 0 else {
                        fail(VideoProcessingError.loadTracksFailed)
                        return
                    }
                    input.markAsFinished()
                    if isVideo { videoFinished = true } else { audioFinished = true }
                    finishIfReady()
                    return
                }
                guard input.append(sample) else {
                    fail(writer.error ?? VideoProcessingError.unableToWriteVideo)
                    return
                }
                if CMSampleBufferGetNumSamples(sample) > 0 {
                    let end = CMTimeAdd(CMSampleBufferGetPresentationTimeStamp(sample), CMSampleBufferGetDuration(sample))
                    if end.isNumeric {
                        if isVideo {
                            videoEnd = videoEnd.isNumeric ? CMTimeMaximum(videoEnd, end) : end
                        } else {
                            audioEnd = audioEnd.isNumeric ? CMTimeMaximum(audioEnd, end) : end
                        }
                    }
                }
            }
        }

        videoInput.requestMediaDataWhenReady(on: queue) {
            copySamples(reader: reader, track: videoTrack, from: videoOutput, to: videoInput, isVideo: true)
        }
        if let output = audioOutput, let input = audioInput, let audioReader = audioReader {
            input.requestMediaDataWhenReady(on: queue) {
                copySamples(reader: audioReader, track: output.track, from: output, to: input, isVideo: false)
            }
        }
    }
}
