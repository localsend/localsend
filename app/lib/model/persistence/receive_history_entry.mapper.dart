// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'receive_history_entry.dart';

class ReceiveHistoryEntryMapper extends ClassMapperBase<ReceiveHistoryEntry> {
  ReceiveHistoryEntryMapper._();

  static ReceiveHistoryEntryMapper? _instance;
  static ReceiveHistoryEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReceiveHistoryEntryMapper._());
      FileTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReceiveHistoryEntry';

  static String _$id(ReceiveHistoryEntry v) => v.id;
  static const Field<ReceiveHistoryEntry, String> _f$id = Field('id', _$id);
  static String _$fileName(ReceiveHistoryEntry v) => v.fileName;
  static const Field<ReceiveHistoryEntry, String> _f$fileName = Field(
    'fileName',
    _$fileName,
  );
  static FileType _$fileType(ReceiveHistoryEntry v) => v.fileType;
  static const Field<ReceiveHistoryEntry, FileType> _f$fileType = Field(
    'fileType',
    _$fileType,
  );
  static String? _$path(ReceiveHistoryEntry v) => v.path;
  static const Field<ReceiveHistoryEntry, String> _f$path = Field(
    'path',
    _$path,
  );
  static bool _$savedToGallery(ReceiveHistoryEntry v) => v.savedToGallery;
  static const Field<ReceiveHistoryEntry, bool> _f$savedToGallery = Field(
    'savedToGallery',
    _$savedToGallery,
  );
  static bool _$isMessage(ReceiveHistoryEntry v) => v.isMessage;
  static const Field<ReceiveHistoryEntry, bool> _f$isMessage = Field(
    'isMessage',
    _$isMessage,
    hook: IsMessageHook(),
  );
  static int _$fileSize(ReceiveHistoryEntry v) => v.fileSize;
  static const Field<ReceiveHistoryEntry, int> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
  );
  static String _$senderAlias(ReceiveHistoryEntry v) => v.senderAlias;
  static const Field<ReceiveHistoryEntry, String> _f$senderAlias = Field(
    'senderAlias',
    _$senderAlias,
  );
  static DateTime _$timestamp(ReceiveHistoryEntry v) => v.timestamp;
  static const Field<ReceiveHistoryEntry, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static String _$timestampString(ReceiveHistoryEntry v) => v.timestampString;
  static const Field<ReceiveHistoryEntry, String> _f$timestampString = Field(
    'timestampString',
    _$timestampString,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ReceiveHistoryEntry> fields = const {
    #id: _f$id,
    #fileName: _f$fileName,
    #fileType: _f$fileType,
    #path: _f$path,
    #savedToGallery: _f$savedToGallery,
    #isMessage: _f$isMessage,
    #fileSize: _f$fileSize,
    #senderAlias: _f$senderAlias,
    #timestamp: _f$timestamp,
    #timestampString: _f$timestampString,
  };

  static ReceiveHistoryEntry _instantiate(DecodingData data) {
    return ReceiveHistoryEntry(
      id: data.dec(_f$id),
      fileName: data.dec(_f$fileName),
      fileType: data.dec(_f$fileType),
      path: data.dec(_f$path),
      savedToGallery: data.dec(_f$savedToGallery),
      isMessage: data.dec(_f$isMessage),
      fileSize: data.dec(_f$fileSize),
      senderAlias: data.dec(_f$senderAlias),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ReceiveHistoryEntry fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReceiveHistoryEntry>(map);
  }

  static ReceiveHistoryEntry deserialize(String json) {
    return ensureInitialized().decodeJson<ReceiveHistoryEntry>(json);
  }
}

mixin ReceiveHistoryEntryMappable {
  String serialize() {
    return ReceiveHistoryEntryMapper.ensureInitialized()
        .encodeJson<ReceiveHistoryEntry>(this as ReceiveHistoryEntry);
  }

  Map<String, dynamic> toJson() {
    return ReceiveHistoryEntryMapper.ensureInitialized()
        .encodeMap<ReceiveHistoryEntry>(this as ReceiveHistoryEntry);
  }

  ReceiveHistoryEntryCopyWith<
    ReceiveHistoryEntry,
    ReceiveHistoryEntry,
    ReceiveHistoryEntry
  >
  get copyWith =>
      _ReceiveHistoryEntryCopyWithImpl<
        ReceiveHistoryEntry,
        ReceiveHistoryEntry
      >(this as ReceiveHistoryEntry, $identity, $identity);
  @override
  String toString() {
    return ReceiveHistoryEntryMapper.ensureInitialized().stringifyValue(
      this as ReceiveHistoryEntry,
    );
  }

  @override
  bool operator ==(Object other) {
    return ReceiveHistoryEntryMapper.ensureInitialized().equalsValue(
      this as ReceiveHistoryEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return ReceiveHistoryEntryMapper.ensureInitialized().hashValue(
      this as ReceiveHistoryEntry,
    );
  }
}

extension ReceiveHistoryEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReceiveHistoryEntry, $Out> {
  ReceiveHistoryEntryCopyWith<$R, ReceiveHistoryEntry, $Out>
  get $asReceiveHistoryEntry => $base.as(
    (v, t, t2) => _ReceiveHistoryEntryCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ReceiveHistoryEntryCopyWith<
  $R,
  $In extends ReceiveHistoryEntry,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? fileName,
    FileType? fileType,
    String? path,
    bool? savedToGallery,
    bool? isMessage,
    int? fileSize,
    String? senderAlias,
    DateTime? timestamp,
  });
  ReceiveHistoryEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ReceiveHistoryEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReceiveHistoryEntry, $Out>
    implements ReceiveHistoryEntryCopyWith<$R, ReceiveHistoryEntry, $Out> {
  _ReceiveHistoryEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReceiveHistoryEntry> $mapper =
      ReceiveHistoryEntryMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? fileName,
    FileType? fileType,
    Object? path = $none,
    bool? savedToGallery,
    bool? isMessage,
    int? fileSize,
    String? senderAlias,
    DateTime? timestamp,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (fileName != null) #fileName: fileName,
      if (fileType != null) #fileType: fileType,
      if (path != $none) #path: path,
      if (savedToGallery != null) #savedToGallery: savedToGallery,
      if (isMessage != null) #isMessage: isMessage,
      if (fileSize != null) #fileSize: fileSize,
      if (senderAlias != null) #senderAlias: senderAlias,
      if (timestamp != null) #timestamp: timestamp,
    }),
  );
  @override
  ReceiveHistoryEntry $make(CopyWithData data) => ReceiveHistoryEntry(
    id: data.get(#id, or: $value.id),
    fileName: data.get(#fileName, or: $value.fileName),
    fileType: data.get(#fileType, or: $value.fileType),
    path: data.get(#path, or: $value.path),
    savedToGallery: data.get(#savedToGallery, or: $value.savedToGallery),
    isMessage: data.get(#isMessage, or: $value.isMessage),
    fileSize: data.get(#fileSize, or: $value.fileSize),
    senderAlias: data.get(#senderAlias, or: $value.senderAlias),
    timestamp: data.get(#timestamp, or: $value.timestamp),
  );

  @override
  ReceiveHistoryEntryCopyWith<$R2, ReceiveHistoryEntry, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ReceiveHistoryEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

