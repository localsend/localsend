/// Categorization of one file.
/// We use this information for a better UX.
enum FileType {
  image,
  video,
  pdf,
  text,
  other,
}

extension FileTypeGuessExt on String {
  FileType guessFileType() {
    final extension = substring(lastIndexOf('.') + 1).toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'svg':
        return FileType.image;
      case 'mp4':
      case 'mov':
        return FileType.video;
      case 'pdf':
        return FileType.pdf;
      case 'txt':
        return FileType.text;
      default:
        return FileType.other;
    }
  }
}
