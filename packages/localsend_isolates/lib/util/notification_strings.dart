/// The translated strings that this package needs but cannot produce on its own: the app owns the
/// translations, and the dependency only points from the app to this package.
///
/// Inject an instance via `TransferNotification.init`. The signatures mirror the ones slang
/// generates, so the app can hand over its translation members directly.
class NotificationStrings {
  /// Title while files are being received, e.g. "Receiving files".
  final String titleReceiving;

  /// Title while files are being sent, e.g. "Sending files".
  final String titleSending;

  /// Remaining time below an hour, e.g. "1:30" or "0:45". [ss] is zero padded.
  final String Function({required Object n, required Object ss}) remainingTimeMinutes;

  /// Remaining time below a day, e.g. "2h 5m".
  final String Function({required num h, required num m}) remainingTimeHours;

  /// Remaining time of a day or more, e.g. "3d 4h 5m".
  final String Function({required num d, required num h, required num m}) remainingTimeDays;

  const NotificationStrings({
    required this.titleReceiving,
    required this.titleSending,
    required this.remainingTimeMinutes,
    required this.remainingTimeHours,
    required this.remainingTimeDays,
  });
}
