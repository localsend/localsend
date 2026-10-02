import Foundation

/// Utility class for common file operations
public class FileUtils {
    private static let logger = Logger(module: "FileUtils")
    private static let fileManager = FileManager.default
    
    /// Create a temporary file path based on an original URL
    public static func createTempFilePath(originalURL: URL, prefix: String? = nil, suffix: String? = nil) -> URL {
        let tempDirectory = NSTemporaryDirectory()
        let fileName = prefix ?? originalURL.deletingPathExtension().lastPathComponent
        let fileExtension = suffix ?? originalURL.pathExtension
        let uniqueID = UUID().uuidString.prefix(8)
        return URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(fileName)-\(uniqueID).\(fileExtension)")
    }
    
    /// Create a temporary file with a specific extension
    public static func createTempFile(prefix: String, extension ext: String) -> URL {
        let tempDirectory = NSTemporaryDirectory()
        let uniqueID = UUID().uuidString.prefix(8)
        return URL(fileURLWithPath: tempDirectory).appendingPathComponent("\(prefix)-\(uniqueID).\(ext)")
    }
    
    /// Clean up a temporary file
    public static func cleanupTempFile(_ fileURL: URL) {
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                try fileManager.removeItem(at: fileURL)
                logger.debug("Temp file removed: \(fileURL.path)")
            } catch {
                logger.error("Failed to remove temp file: \(fileURL.path), error: \(error.localizedDescription)")
            }
        }
    }
    
    /// Clean up multiple temporary files
    public static func cleanupTempFiles(_ files: [URL]) {
        for file in files {
            cleanupTempFile(file)
        }
    }
    
    /// Check if a file exists at the given path
    public static func fileExists(at path: String) -> Bool {
        return fileManager.fileExists(atPath: path)
    }
    
    /// Get the size of a file
    public static func fileSize(at path: String) -> Int64? {
        do {
            let attributes = try fileManager.attributesOfItem(atPath: path)
            return attributes[.size] as? Int64
        } catch {
            logger.error("Failed to get file size for \(path): \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Check if a file is empty
    public static func isFileEmpty(at path: String) -> Bool {
        guard let size = fileSize(at: path) else { return true }
        return size == 0
    }
    
    /// Check if file extension is in a list of supported extensions
    public static func isFileExtensionSupported(path: String, supportedExtensions: [String]) -> Bool {
        let fileExtension = URL(fileURLWithPath: path).pathExtension.lowercased()
        return supportedExtensions.contains(fileExtension)
    }
    
    /// Copy a file to a new location
    public static func copyFile(from sourcePath: String, to destinationPath: String) -> Bool {
        do {
            try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
            return true
        } catch {
            logger.error("Failed to copy file from \(sourcePath) to \(destinationPath): \(error.localizedDescription)")
            return false
        }
    }
    
    /// Get MIME type from file extension
    public static func mimeType(for path: String) -> String {
        let url = URL(fileURLWithPath: path)
        let fileExtension = url.pathExtension.lowercased()
        
        let mimeTypes = [
            "jpg": "image/jpeg",
            "jpeg": "image/jpeg",
            "png": "image/png",
            "gif": "image/gif",
            "heic": "image/heic",
            "mp4": "video/mp4",
            "mov": "video/quicktime",
            "pdf": "application/pdf",
            "txt": "text/plain",
            "html": "text/html",
            "css": "text/css",
            "js": "application/javascript",
            "json": "application/json",
            "xml": "application/xml",
            "zip": "application/zip"
        ]
        
        return mimeTypes[fileExtension] ?? "application/octet-stream"
    }
} 