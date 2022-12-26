/// Status of one single file during file transfer.
/// Both receiver and sender should share the same information.
enum FileStatus {
  queue,
  skipped,
  sending,
  failed,
  finished,
}
