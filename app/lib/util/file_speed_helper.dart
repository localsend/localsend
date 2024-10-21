/// Returns bytes per second
int getFileSpeed({
  required int start,
  required int end,
  required int bytes,
}) {
  final deltaTime = end - start;
  return (1000 * bytes) ~/
      deltaTime; // multiply by 1000 to convert millis to seconds
}

/// Returns remaining time in m:ss
String getRemainingTime({
  required int bytesPerSeconds,
  required int remainingBytes,
}) {
  final totalSeconds = _getRemainingTime(
      bytesPerSeconds: bytesPerSeconds, remainingBytes: remainingBytes);
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}

/// Returns remaining time in seconds
int _getRemainingTime({
  required int bytesPerSeconds,
  required int remainingBytes,
}) {
  return remainingBytes ~/ bytesPerSeconds;
}

// Returns transfer speed in Kbps or Mbps
String displaySpeed(int speedInBytes) {
  double speedInKB = speedInBytes / 1024;
  double speedInMB = speedInBytes / (1024 * 1024);
  if (speedInBytes >= (1024 * 1024)) {
    return '${speedInMB.toStringAsFixed(2)} Mbps';
  } else {
    return '${speedInKB.toStringAsFixed(2)} Kbps';
  }
}
