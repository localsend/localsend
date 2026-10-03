/// Resolves a file URI passed as a desktop launch argument to a filesystem path.
String resolveFilePathArgument(String argument) {
  if (!argument.startsWith('file://')) {
    return argument;
  }

  try {
    return Uri.parse(argument).toFilePath();
  } on FormatException {
    return argument;
  }
}
