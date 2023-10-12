import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'file_type.mapper.dart';

/// Categorization of one file.
/// We use this information for a better UX.
@MappableEnum(defaultValue: FileType.other)
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
