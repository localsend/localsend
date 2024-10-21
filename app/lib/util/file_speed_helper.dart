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
  const int kb = 1024;
  const int mb = kb * 1024;
  const int gb = mb * 1024;
  const int tb = gb * 1024;

  if (speedInBytes >= tb) {
    double speedInTB = speedInBytes / tb;
    return '${speedInTB.toStringAsFixed(2)} Tbps';
  } else if (speedInBytes >= gb) {
    double speedInGB = speedInBytes / gb;
    return '${speedInGB.toStringAsFixed(2)} Gbps';
  } else if (speedInBytes >= mb) {
    double speedInMB = speedInBytes / mb;
    return '${speedInMB.toStringAsFixed(2)} Mbps';
  } else if (speedInBytes >= kb) {
    double speedInKB = speedInBytes / kb;
    return '${speedInKB.toStringAsFixed(2)} Kbps';
  } else {
    return '$speedInBytes Bps';
  }
}
