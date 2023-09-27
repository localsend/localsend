import 'package:flutter/material.dart';

/// Categorization of one file.
/// We use this information for a better UX.
enum FileType {
  image(Icons.image),
  video(Icons.movie),
  pdf(Icons.description),
  text(Icons.subject),
  apk(Icons.android),
  other(Icons.file_present_sharp);

  const FileType(this.icon);

  final IconData icon;
}
