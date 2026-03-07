// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'log_entry.dart';

class LogEntryMapper extends ClassMapperBase<LogEntry> {
  LogEntryMapper._();

  static LogEntryMapper? _instance;
  static LogEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogEntryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LogEntry';

  static DateTime _$timestamp(LogEntry v) => v.timestamp;
  static const Field<LogEntry, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static String _$log(LogEntry v) => v.log;
  static const Field<LogEntry, String> _f$log = Field('log', _$log);

  @override
  final MappableFields<LogEntry> fields = const {
    #timestamp: _f$timestamp,
    #log: _f$log,
  };

  static LogEntry _instantiate(DecodingData data) {
    return LogEntry(timestamp: data.dec(_f$timestamp), log: data.dec(_f$log));
  }

  @override
  final Function instantiate = _instantiate;

  static LogEntry fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LogEntry>(map);
  }

  static LogEntry deserialize(String json) {
    return ensureInitialized().decodeJson<LogEntry>(json);
  }
}

mixin LogEntryMappable {
  String serialize() {
    return LogEntryMapper.ensureInitialized().encodeJson<LogEntry>(
      this as LogEntry,
    );
  }

  Map<String, dynamic> toJson() {
    return LogEntryMapper.ensureInitialized().encodeMap<LogEntry>(
      this as LogEntry,
    );
  }

  LogEntryCopyWith<LogEntry, LogEntry, LogEntry> get copyWith =>
      _LogEntryCopyWithImpl<LogEntry, LogEntry>(
        this as LogEntry,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LogEntryMapper.ensureInitialized().stringifyValue(this as LogEntry);
  }

  @override
  bool operator ==(Object other) {
    return LogEntryMapper.ensureInitialized().equalsValue(
      this as LogEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return LogEntryMapper.ensureInitialized().hashValue(this as LogEntry);
  }
}

extension LogEntryValueCopy<$R, $Out> on ObjectCopyWith<$R, LogEntry, $Out> {
  LogEntryCopyWith<$R, LogEntry, $Out> get $asLogEntry =>
      $base.as((v, t, t2) => _LogEntryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LogEntryCopyWith<$R, $In extends LogEntry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? timestamp, String? log});
  LogEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LogEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LogEntry, $Out>
    implements LogEntryCopyWith<$R, LogEntry, $Out> {
  _LogEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LogEntry> $mapper =
      LogEntryMapper.ensureInitialized();
  @override
  $R call({DateTime? timestamp, String? log}) => $apply(
    FieldCopyWithData({
      if (timestamp != null) #timestamp: timestamp,
      if (log != null) #log: log,
    }),
  );
  @override
  LogEntry $make(CopyWithData data) => LogEntry(
    timestamp: data.get(#timestamp, or: $value.timestamp),
    log: data.get(#log, or: $value.log),
  );

  @override
  LogEntryCopyWith<$R2, LogEntry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LogEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

