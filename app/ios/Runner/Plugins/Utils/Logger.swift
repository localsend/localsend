import Foundation

/// A comprehensive logging utility that can be used across all modules
public class Logger {
    /// Available log levels
    public enum LogLevel: Int {
        case debug = 0
        case info = 1
        case warning = 2
        case error = 3
        
        var prefix: String {
            switch self {
            case .debug: return "DEBUG"
            case .info: return "INFO"
            case .warning: return "WARNING"
            case .error: return "ERROR"
            }
        }
    }
    
    /// The minimum log level to display. Default is debug (show all logs)
    public static var minimumLogLevel: LogLevel = .debug
    
    /// Enable or disable logging completely
    public static var isLoggingEnabled = true
    
    /// Include timestamp in logs
    public static var includeTimestamp = true
    
    /// The module this logger is associated with
    private let module: String
    
    /// Create a logger for a specific module
    public init(module: String) {
        self.module = module
    }
    
    /// Internal logging method with file, function and line information
    public func log(_ message: String, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        guard Logger.isLoggingEnabled && level.rawValue >= Logger.minimumLogLevel.rawValue else { return }
        
        let fileName = (file as NSString).lastPathComponent
        var logMessage = "[\(module)][\(level.prefix)][\(fileName):\(line)] \(message)"
        
        if Logger.includeTimestamp {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
            let timestamp = formatter.string(from: Date())
            logMessage = "\(timestamp)    \(logMessage)"
        }
        
        print(logMessage)
    }
    
    /// Log a debug message
    public func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .debug, file: file, function: function, line: line)
    }
    
    /// Log an info message
    public func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .info, file: file, function: function, line: line)
    }
    
    /// Log a warning message
    public func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .warning, file: file, function: function, line: line)
    }
    
    /// Log an error message
    public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .error, file: file, function: function, line: line)
    }
    
    /// Create a scoped logger that adds an additional scope identifier to logs
    public func scoped(_ scope: String) -> ScopedLogger {
        return ScopedLogger(logger: self, scope: scope)
    }
}

/// A logger wrapper that adds scope information to logs
public class ScopedLogger {
    private let logger: Logger
    private let scope: String
    
    init(logger: Logger, scope: String) {
        self.logger = logger
        self.scope = scope
    }
    
    /// Log a debug message with scope
    public func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        logger.debug("[\(scope)] \(message)", file: file, function: function, line: line)
    }
    
    /// Log an info message with scope
    public func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        logger.info("[\(scope)] \(message)", file: file, function: function, line: line)
    }
    
    /// Log a warning message with scope
    public func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        logger.warning("[\(scope)] \(message)", file: file, function: function, line: line)
    }
    
    /// Log an error message with scope
    public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        logger.error("[\(scope)] \(message)", file: file, function: function, line: line)
    }
} 