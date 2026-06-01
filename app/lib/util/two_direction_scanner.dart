import 'package:localsend_app/model/local_interface_info.dart';

/// Direction of a candidate within the wide-subnet scan.
enum ScanDirection { down, up }

/// A single popped candidate, tagged with the queue it was actually drawn from
/// (which may differ from the worker's own direction when stealing).
class ScanItem {
  final String ip;
  final ScanDirection source;
  const ScanItem(this.ip, this.source);
}

/// Two ordered queues — one per spiral direction — with work-stealing pops.
///
/// A worker tagged with [ScanDirection.down] always tries to pop from the down
/// queue first; only when its own queue is empty does it steal from the up
/// queue. The popped [ScanItem] carries the *source* direction so progress is
/// credited to the queue that actually drained.
class TwoDirectionScanner {
  final List<String> _down;
  final List<String> _up;
  final int downTotal;
  final int upTotal;
  int downDone = 0;
  int upDone = 0;
  DateTime? _startedAt;

  TwoDirectionScanner({required List<String> down, required List<String> up})
    : _down = List.of(down),
      _up = List.of(up),
      downTotal = down.length,
      upTotal = up.length;

  int get downPending => _down.length;
  int get upPending => _up.length;
  bool get isEmpty => _down.isEmpty && _up.isEmpty;
  DateTime? get startedAt => _startedAt;

  /// Marks the wall-clock start of the scan. Called once before the first pop;
  /// subsequent calls are no-ops.
  void start({DateTime? at}) {
    _startedAt ??= at ?? DateTime.now();
  }

  /// Returns the next candidate for a worker whose origin is [origin], or null
  /// if both queues are empty. Always prefers the worker's own queue and only
  /// steals when that queue is empty.
  ScanItem? popNext(ScanDirection origin) {
    if (origin == ScanDirection.down) {
      if (_down.isNotEmpty) return ScanItem(_down.removeAt(0), ScanDirection.down);
      if (_up.isNotEmpty) return ScanItem(_up.removeAt(0), ScanDirection.up);
    } else {
      if (_up.isNotEmpty) return ScanItem(_up.removeAt(0), ScanDirection.up);
      if (_down.isNotEmpty) return ScanItem(_down.removeAt(0), ScanDirection.down);
    }
    return null;
  }

  void markDone(ScanItem item) {
    if (item.source == ScanDirection.down) {
      downDone++;
    } else {
      upDone++;
    }
  }

  /// Throughput-based ETA for [dir]. Returns null until at least
  /// [_etaWarmup] completions have been observed on that side, or once the
  /// direction has finished. The rate combines the direction's own workers
  /// and any stealers, which is what we want — it reflects how fast that
  /// queue is actually draining.
  Duration? etaFor(ScanDirection dir, {DateTime? now}) {
    final startedAt = _startedAt;
    if (startedAt == null) return null;
    final done = dir == ScanDirection.down ? downDone : upDone;
    final total = dir == ScanDirection.down ? downTotal : upTotal;
    if (done < _etaWarmup || done >= total) return null;
    final elapsedMs = (now ?? DateTime.now()).difference(startedAt).inMilliseconds;
    if (elapsedMs <= 0) return null;
    final remaining = total - done;
    final etaMs = (remaining * elapsedMs / done).round();
    return Duration(milliseconds: etaMs);
  }

  static const _etaWarmup = 5;
}

/// Returns the inclusive `[min, max]` third-octet range covered by the subnet
/// `(c, prefixLength)`. Examples:
///   * /16: (0, 255)
///   * /20 with c=149: (144, 159)
///   * /21 with c=149: (144, 151)
///   * /24: (c, c)
///   * /25–/32: (c, c)
/// For prefixes ≤ 16 the whole third octet is free; for ≥ 24 the third octet
/// is fully constrained to `c` itself.
({int min, int max}) subnetBoundsForThirdOctet(int c, int prefixLength) {
  if (prefixLength <= 16) return (min: 0, max: 255);
  if (prefixLength >= 24) return (min: c, max: c);
  final freeBits = 24 - prefixLength;
  final mask = (0xFF << freeBits) & 0xFF;
  final base = c & mask;
  return (min: base, max: base | ((1 << freeBits) - 1));
}

/// Splits [total] workers between the two queues proportionally to their
/// initial sizes, with a floor of one per non-empty direction.
///
/// If one direction starts empty, all workers go to the other (no floor
/// applies — there's nothing to scan on that side).
({int down, int up}) allocateWorkers(int total, int downTotal, int upTotal) {
  if (total <= 0) return (down: 0, up: 0);
  if (downTotal <= 0 && upTotal <= 0) return (down: 0, up: 0);
  if (downTotal <= 0) return (down: 0, up: total);
  if (upTotal <= 0) return (down: total, up: 0);
  if (total == 1) return (down: 1, up: 0);
  final combined = downTotal + upTotal;
  var down = (total * downTotal / combined).round();
  if (down < 1) down = 1;
  if (down > total - 1) down = total - 1;
  return (down: down, up: total - down);
}

/// Constructs the two ordered wide-scan queues for hashtag mode.
///
/// For each interface, candidates are emitted outward from the local third
/// octet: in-subnet third octets first (descending toward [bounds.min] /
/// ascending toward [bounds.max]) so the queue head is the most likely hit,
/// then out-of-subnet octets continuing toward 0 / 255. Per-interface lists
/// are round-robin interleaved across interfaces, and anything in [exclude]
/// (typically the narrow `/24` candidates already in flight) is filtered
/// out.
({List<String> down, List<String> up}) buildWideQueues(
  List<LocalInterfaceInfo> interfaces,
  String input, {
  required Set<String> exclude,
}) {
  final downPerInterface = <List<String>>[];
  final upPerInterface = <List<String>>[];
  for (final iface in interfaces) {
    final parts = iface.ip.split('.');
    if (parts.length != 4) continue;
    final c = int.tryParse(parts[2]);
    if (c == null) continue;
    final prefix = '${parts[0]}.${parts[1]}';
    final bounds = subnetBoundsForThirdOctet(c, iface.prefixLength);

    final down = <String>[];
    for (var n = c - 1; n >= bounds.min; n--) {
      down.add('$prefix.$n.$input');
    }
    for (var n = bounds.min - 1; n >= 0; n--) {
      down.add('$prefix.$n.$input');
    }
    downPerInterface.add(down);

    final up = <String>[];
    for (var n = c + 1; n <= bounds.max; n++) {
      up.add('$prefix.$n.$input');
    }
    for (var n = bounds.max + 1; n <= 255; n++) {
      up.add('$prefix.$n.$input');
    }
    upPerInterface.add(up);
  }
  return (
    down: _interleaveDedupe(downPerInterface, exclude),
    up: _interleaveDedupe(upPerInterface, exclude),
  );
}

List<String> _interleaveDedupe(List<List<String>> lists, Set<String> exclude) {
  final result = <String>[];
  final seen = <String>{...exclude};
  final maxLen = lists.fold<int>(0, (m, l) => l.length > m ? l.length : m);
  for (var i = 0; i < maxLen; i++) {
    for (final list in lists) {
      if (i >= list.length) continue;
      final cand = list[i];
      if (seen.add(cand)) result.add(cand);
    }
  }
  return result;
}
