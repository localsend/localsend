/// The translated strings that this package needs but cannot produce on its own: the app owns the
/// translations, and the dependency only points from the app to this package.
///
/// Inject an instance via `TransferNotification.init` to keep this package independent of the
/// app's localization implementation.
class NotificationStrings {
  /// Title while files are being received, e.g. "Receiving files".
  final String titleReceiving;

  /// Title while files are being sent, e.g. "Sending files".
  final String titleSending;

  /// Remaining time below an hour, e.g. "1:30" or "0:45". [ss] is zero padded.
  final String Function({required Object m, required Object ss}) remainingTimeMinutes;

  /// Remaining time of an hour or more, e.g. "2h 5m" or "34h". Hours are not capped at a day.
  final String Function({required num h, required num m}) remainingTimeLong;

  const NotificationStrings({
    required this.titleReceiving,
    required this.titleSending,
    required this.remainingTimeMinutes,
    required this.remainingTimeLong,
  });
}
