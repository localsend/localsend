import 'package:flutter/material.dart';

/// Categorization of one file.
/// We use this information for a better UX.
enum FileType {
  image(Icons.image),
  video(Icons.movie),
  pdf(Icons.picture_as_pdf),
  text(Icons.subject),
  other(Icons.description);

  const FileType(this.icon);

  final IconData icon;
}
