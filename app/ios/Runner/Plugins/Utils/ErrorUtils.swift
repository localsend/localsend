import Foundation

/// Base error protocol for all plugins
public protocol AppError: Error {
    var code: String { get }
    var message: String { get }
    var details: String? { get }
}

/// Comprehensive error types for common operations
public enum AppErrorType: Error {
    // File-related errors
    case fileNotFound(path: String)
    case fileEmpty(path: String)
    case fileFormatNotSupported(extension: String)
    case fileSizeExceeded(size: Int64, maxSize: Int64)
    case fileReadError(reason: String)
    case fileWriteError(reason: String)
    
    // Media-related errors
    case imageProcessingFailed(reason: String)
    case videoProcessingFailed(reason: String)
    case audioProcessingFailed(reason: String)
    case mediaTrackMissing(type: String)
    
    // Permission-related errors
    case permissionDenied(type: String)
    
    // Network-related errors
    case networkUnavailable
    case connectionFailed(host: String)
    case requestTimeout
    case responseInvalid(reason: String)
    
    // General errors
    case invalidArgument(name: String, reason: String)
    case operationCancelled
    case operationTimeout
    case internalError(reason: String)
    case unknownError(error: Error?)
    
    public var localizedDescription: String {
        switch self {
        // File errors
        case .fileNotFound(let path):
            return "File not found: \(path)"
        case .fileEmpty(let path):
            return "File is empty: \(path)"
        case .fileFormatNotSupported(let ext):
            return "Unsupported file format: \(ext)"
        case .fileSizeExceeded(let size, let maxSize):
            return "File size (\(size) bytes) exceeds maximum allowed size (\(maxSize) bytes)"
        case .fileReadError(let reason):
            return "Failed to read file: \(reason)"
        case .fileWriteError(let reason):
            return "Failed to write file: \(reason)"
            
        // Media errors
        case .imageProcessingFailed(let reason):
            return "Image processing failed: \(reason)"
        case .videoProcessingFailed(let reason):
            return "Video processing failed: \(reason)"
        case .audioProcessingFailed(let reason):
            return "Audio processing failed: \(reason)"
        case .mediaTrackMissing(let type):
            return "No \(type) track found in the media file"
            
        // Permission errors
        case .permissionDenied(let type):
            return "Permission to access \(type) denied"
            
        // Network errors
        case .networkUnavailable:
            return "Network is not available"
        case .connectionFailed(let host):
            return "Failed to connect to \(host)"
        case .requestTimeout:
            return "Request timed out"
        case .responseInvalid(let reason):
            return "Invalid response: \(reason)"
            
        // General errors
        case .invalidArgument(let name, let reason):
            return "Invalid argument \(name): \(reason)"
        case .operationCancelled:
            return "Operation was cancelled"
        case .operationTimeout:
            return "Operation timed out after waiting too long"
        case .internalError(let reason):
            return "Internal error: \(reason)"
        case .unknownError(let error):
            if let error = error {
                return "Unknown error: \(error.localizedDescription)"
            } else {
                return "Unknown error occurred"
            }
        }
    }
}

/// Utility class for error handling
public class ErrorUtils {
    private static let logger = Logger(module: "ErrorUtils")
    
    /// Convert any error to a Flutter error
    public static func asFlutterError(_ error: Error) -> [String: Any?] {
        if let appError = error as? AppError {
            return [
                "code": appError.code,
                "message": appError.message,
                "details": appError.details
            ]
        } else if let appErrorType = error as? AppErrorType {
            return [
                "code": String(describing: type(of: appErrorType)),
                "message": appErrorType.localizedDescription,
                "details": nil
            ]
        } else {
            // Log unexpected error types
            logger.error("Converting unexpected error type: \(type(of: error))")
            
            return [
                "code": "UNKNOWN_ERROR",
                "message": error.localizedDescription,
                "details": nil
            ]
        }
    }
    
    /// Log an error with context information
    public static func logError(_ error: Error, context: String, file: String = #file, function: String = #function, line: Int = #line) {
        let message = "[\(context)] \(error.localizedDescription)"
        logger.error(message, file: file, function: function, line: line)
    }
} 