import AVFoundation
import CryptoKit
import Foundation
import ImageIO
import UniformTypeIdentifiers

// Run with the macOS SDK; see live_photo_manual_test.md for fixture/build commands.
@main
struct LivePhotoUtilsTest {
    static func check(_ condition: @autoclosure () -> Bool, _ message: String) {
        precondition(condition(), message)
    }

    static func remux(_ source: URL, to destination: URL) -> Result<URL, Error> {
        let done = DispatchSemaphore(value: 0)
        let lock = NSLock()
        var result: Result<URL, Error>?
        var callbacks = 0
        LivePhotoUtils().addVideoIdentifier("0E200F1C-CC78-4919-8D8E-B4D148648793", fromVideoURL: source, to: destination) { value in
            lock.lock()
            callbacks += 1
            result = value
            lock.unlock()
            done.signal()
        }
        check(done.wait(timeout: .now() + 15) == .success, "Video processing timed out")
        check(done.wait(timeout: .now() + 0.1) == .timedOut, "Completion called more than once")
        lock.lock()
        defer { lock.unlock() }
        check(callbacks == 1, "Completion count")
        return result!
    }

    static func sampleDigest(_ asset: AVAsset, type: AVMediaType) throws -> (Int, SHA256.Digest)? {
        guard let track = asset.tracks(withMediaType: type).first else { return nil }
        let reader = try AVAssetReader(asset: asset)
        let output = AVAssetReaderTrackOutput(track: track, outputSettings: nil)
        reader.add(output)
        check(reader.startReading(), "Unable to read samples")
        var hash = SHA256()
        var count = 0
        while let sample = output.copyNextSampleBuffer() {
            guard let block = CMSampleBufferGetDataBuffer(sample), CMBlockBufferGetDataLength(block) > 0 else { continue }
            var data = Data(count: CMBlockBufferGetDataLength(block))
            let status = data.withUnsafeMutableBytes {
                CMBlockBufferCopyDataBytes(block, atOffset: 0, dataLength: $0.count, destination: $0.baseAddress!)
            }
            check(status == kCMBlockBufferNoErr, "Unable to read compressed sample")
            hash.update(data: data)
            count += 1
        }
        check(reader.status == .completed, "Incomplete samples")
        return (count, hash.finalize())
    }

    static func checkVideo(_ source: URL, directory: URL) throws {
        let output = directory.appendingPathComponent(source.deletingPathExtension().lastPathComponent + "-output.mov")
        try? FileManager.default.removeItem(at: output)
        _ = try remux(source, to: output).get()
        let before = AVURLAsset(url: source)
        let after = AVURLAsset(url: output)
        for type in [AVMediaType.video, .audio] {
            let original = try sampleDigest(before, type: type)
            let saved = try sampleDigest(after, type: type)
            if type == .video { check(original?.0 == saved?.0, "Video sample count changed") }
            check(original?.1 == saved?.1, "Compressed data changed for \(type)")
        }
        check(before.tracks(withMediaType: .video).first!.preferredTransform ==
              after.tracks(withMediaType: .video).first!.preferredTransform, "Orientation changed")
        let ids = AVMetadataItem.metadataItems(from: after.metadata, filteredByIdentifier: .quickTimeMetadataContentIdentifier)
        check(ids.count == 1 && ids.first?.stringValue == "0E200F1C-CC78-4919-8D8E-B4D148648793", "Content identifier missing or duplicated")
        let reader = try AVAssetReader(asset: after)
        let metadataTrack = after.tracks(withMediaType: .metadata).first!
        let metadataOutput = AVAssetReaderTrackOutput(track: metadataTrack, outputSettings: nil)
        reader.add(metadataOutput)
        let adaptor = AVAssetReaderOutputMetadataAdaptor(assetReaderTrackOutput: metadataOutput)
        check(reader.startReading(), "Unable to read timed metadata")
        let group = adaptor.nextTimedMetadataGroup()!
        check(group.items.first?.key as? String == "com.apple.quicktime.still-image-time", "Still image key missing")
        check(group.items.first?.numberValue == 0, "Still image marker missing")
        check(abs(CMTimeGetSeconds(group.timeRange.start) - CMTimeGetSeconds(before.duration) / 2) < 0.01,
              "Still image time changed")
        print("PASS: compressed samples, audio, orientation and metadata: \(source.lastPathComponent)")
    }

    static func checkImage(_ type: UTType, directory: URL) throws {
        let image = CGContext(data: nil, width: 32, height: 32, bitsPerComponent: 8, bytesPerRow: 0,
                              space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
        image.setFillColor(CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
        image.fill(CGRect(x: 0, y: 0, width: 32, height: 32))
        let source = directory.appendingPathComponent("source.\(type.preferredFilenameExtension!)")
        let destination = CGImageDestinationCreateWithURL(source as CFURL, type.identifier as CFString, 1, nil)!
        CGImageDestinationAddImage(destination, image.makeImage()!, nil)
        check(CGImageDestinationFinalize(destination), "Unable to create image fixture")
        let output = directory.appendingPathComponent("output.\(type.preferredFilenameExtension!)")
        _ = try LivePhotoUtils().addPhotoIdentifier("0E200F1C-CC78-4919-8D8E-B4D148648793", fromPhotoURL: source, to: output)
        let saved = CGImageSourceCreateWithURL(output as CFURL, nil)!
        check(CGImageSourceGetType(saved) as String? == type.identifier, "Image format changed")
        let properties = CGImageSourceCopyPropertiesAtIndex(saved, 0, nil) as! [String: Any]
        let apple = properties[kCGImagePropertyMakerAppleDictionary as String] as! [String: Any]
        check(apple["17"] as? String == "0E200F1C-CC78-4919-8D8E-B4D148648793", "Image identifier missing")
        check(properties[kCGImagePropertyPixelWidth as String] as? Int == 32, "Image size changed")
        print("PASS: image format and content identifier: \(type.identifier)")
    }

    static func main() throws {
        setbuf(stdout, nil)
        let directory = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
        for name in ["invalid-output.mov", "corrupted-output.mov"] {
            try? FileManager.default.removeItem(at: directory.appendingPathComponent(name))
        }
        try checkImage(.jpeg, directory: directory)
        try checkImage(.heic, directory: directory)
        for name in ["audio.mp4", "silent.mp4", "hevc.mp4", "rotated.mp4"] {
            try checkVideo(directory.appendingPathComponent(name), directory: directory)
        }
        let invalid = directory.appendingPathComponent("invalid.mp4")
        try Data("invalid video".utf8).write(to: invalid)
        if case .success = remux(invalid, to: directory.appendingPathComponent("invalid-output.mov")) {
            fatalError("Invalid video unexpectedly succeeded")
        }
        if case .success = remux(directory.appendingPathComponent("audio.mp4"), to: invalid) {
            fatalError("Existing destination unexpectedly succeeded")
        }
        let corrupted = directory.appendingPathComponent("corrupted.mp4")
        let data = try Data(contentsOf: directory.appendingPathComponent("audio.mp4"))
        try data.prefix(data.count / 2).write(to: corrupted)
        if case .success = remux(corrupted, to: directory.appendingPathComponent("corrupted-output.mov")) {
            fatalError("Truncated video unexpectedly succeeded")
        }
        print("PASS: invalid/truncated input and existing output fail once")
    }
}
