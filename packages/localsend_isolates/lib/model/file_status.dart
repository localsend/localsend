/// Status of one single file during file transfer.
/// Both receiver and sender should share the same information.
enum FileStatus {
  queue,
  skipped,
  sending,
  failed,
  finished,
}

extension FileStatusIterable on Iterable<FileStatus> {
  bool get isFinishedOrError => every((status) => const {FileStatus.skipped, FileStatus.failed, FileStatus.finished}.contains(status));
  bool get isFinishedOrSkipped => every((status) => const {FileStatus.skipped, FileStatus.finished}.contains(status));
}
