use localsend::model::transfer::FileMetadata;

/// Reads the timestamps of the file at `path` in the protocol's RFC 3339
/// format with nanosecond precision, which Dart's `DateTime` cannot express.
/// `None` when the file cannot be inspected or provides no timestamps.
pub async fn read_file_metadata(path: String) -> Option<FileMetadata> {
    FileMetadata::from_path(std::path::Path::new(&path))
}
