// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'clipboard_data.dart';

class ClipboardDataTypeMapper extends EnumMapper<ClipboardDataType> {
  ClipboardDataTypeMapper._();

  static ClipboardDataTypeMapper? _instance;
  static ClipboardDataTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClipboardDataTypeMapper._());
    }
    return _instance!;
  }

  static ClipboardDataType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ClipboardDataType decode(dynamic value) {
    switch (value) {
      case r'text':
        return ClipboardDataType.text;
      case r'image':
        return ClipboardDataType.image;
      case r'html':
        return ClipboardDataType.html;
      case r'url':
        return ClipboardDataType.url;
      case r'files':
        return ClipboardDataType.files;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ClipboardDataType self) {
    switch (self) {
      case ClipboardDataType.text:
        return r'text';
      case ClipboardDataType.image:
        return r'image';
      case ClipboardDataType.html:
        return r'html';
      case ClipboardDataType.url:
        return r'url';
      case ClipboardDataType.files:
        return r'files';
    }
  }
}

extension ClipboardDataTypeMapperExtension on ClipboardDataType {
  String toValue() {
    ClipboardDataTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ClipboardDataType>(this) as String;
  }
}

class ClipboardDataMapper extends ClassMapperBase<ClipboardData> {
  ClipboardDataMapper._();

  static ClipboardDataMapper? _instance;
  static ClipboardDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClipboardDataMapper._());
      ClipboardDataTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ClipboardData';

  static String _$id(ClipboardData v) => v.id;
  static const Field<ClipboardData, String> _f$id = Field('id', _$id);
  static ClipboardDataType _$type(ClipboardData v) => v.type;
  static const Field<ClipboardData, ClipboardDataType> _f$type = Field(
    'type',
    _$type,
  );
  static String? _$text(ClipboardData v) => v.text;
  static const Field<ClipboardData, String> _f$text = Field(
    'text',
    _$text,
    opt: true,
  );
  static Uint8List? _$imageData(ClipboardData v) => v.imageData;
  static const Field<ClipboardData, Uint8List> _f$imageData = Field(
    'imageData',
    _$imageData,
    opt: true,
  );
  static String? _$html(ClipboardData v) => v.html;
  static const Field<ClipboardData, String> _f$html = Field(
    'html',
    _$html,
    opt: true,
  );
  static String? _$url(ClipboardData v) => v.url;
  static const Field<ClipboardData, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );
  static List<String>? _$filePaths(ClipboardData v) => v.filePaths;
  static const Field<ClipboardData, List<String>> _f$filePaths = Field(
    'filePaths',
    _$filePaths,
    opt: true,
  );
  static String? _$mimeType(ClipboardData v) => v.mimeType;
  static const Field<ClipboardData, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );
  static int? _$size(ClipboardData v) => v.size;
  static const Field<ClipboardData, int> _f$size = Field(
    'size',
    _$size,
    opt: true,
  );
  static DateTime _$timestamp(ClipboardData v) => v.timestamp;
  static const Field<ClipboardData, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static String _$displayName(ClipboardData v) => v.displayName;
  static const Field<ClipboardData, String> _f$displayName = Field(
    'displayName',
    _$displayName,
    mode: FieldMode.member,
  );
  static String _$sizeFormatted(ClipboardData v) => v.sizeFormatted;
  static const Field<ClipboardData, String> _f$sizeFormatted = Field(
    'sizeFormatted',
    _$sizeFormatted,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ClipboardData> fields = const {
    #id: _f$id,
    #type: _f$type,
    #text: _f$text,
    #imageData: _f$imageData,
    #html: _f$html,
    #url: _f$url,
    #filePaths: _f$filePaths,
    #mimeType: _f$mimeType,
    #size: _f$size,
    #timestamp: _f$timestamp,
    #displayName: _f$displayName,
    #sizeFormatted: _f$sizeFormatted,
  };

  static ClipboardData _instantiate(DecodingData data) {
    return ClipboardData(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      text: data.dec(_f$text),
      imageData: data.dec(_f$imageData),
      html: data.dec(_f$html),
      url: data.dec(_f$url),
      filePaths: data.dec(_f$filePaths),
      mimeType: data.dec(_f$mimeType),
      size: data.dec(_f$size),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClipboardData fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClipboardData>(map);
  }

  static ClipboardData deserialize(String json) {
    return ensureInitialized().decodeJson<ClipboardData>(json);
  }
}

mixin ClipboardDataMappable {
  String serialize() {
    return ClipboardDataMapper.ensureInitialized().encodeJson<ClipboardData>(
      this as ClipboardData,
    );
  }

  Map<String, dynamic> toJson() {
    return ClipboardDataMapper.ensureInitialized().encodeMap<ClipboardData>(
      this as ClipboardData,
    );
  }

  ClipboardDataCopyWith<ClipboardData, ClipboardData, ClipboardData>
  get copyWith => _ClipboardDataCopyWithImpl<ClipboardData, ClipboardData>(
    this as ClipboardData,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ClipboardDataMapper.ensureInitialized().stringifyValue(
      this as ClipboardData,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClipboardDataMapper.ensureInitialized().equalsValue(
      this as ClipboardData,
      other,
    );
  }

  @override
  int get hashCode {
    return ClipboardDataMapper.ensureInitialized().hashValue(
      this as ClipboardData,
    );
  }
}

extension ClipboardDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClipboardData, $Out> {
  ClipboardDataCopyWith<$R, ClipboardData, $Out> get $asClipboardData =>
      $base.as((v, t, t2) => _ClipboardDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClipboardDataCopyWith<$R, $In extends ClipboardData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get filePaths;
  $R call({
    String? id,
    ClipboardDataType? type,
    String? text,
    Uint8List? imageData,
    String? html,
    String? url,
    List<String>? filePaths,
    String? mimeType,
    int? size,
    DateTime? timestamp,
  });
  ClipboardDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClipboardDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClipboardData, $Out>
    implements ClipboardDataCopyWith<$R, ClipboardData, $Out> {
  _ClipboardDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClipboardData> $mapper =
      ClipboardDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get filePaths =>
      $value.filePaths != null
      ? ListCopyWith(
          $value.filePaths!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(filePaths: v),
        )
      : null;
  @override
  $R call({
    String? id,
    ClipboardDataType? type,
    Object? text = $none,
    Object? imageData = $none,
    Object? html = $none,
    Object? url = $none,
    Object? filePaths = $none,
    Object? mimeType = $none,
    Object? size = $none,
    DateTime? timestamp,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (type != null) #type: type,
      if (text != $none) #text: text,
      if (imageData != $none) #imageData: imageData,
      if (html != $none) #html: html,
      if (url != $none) #url: url,
      if (filePaths != $none) #filePaths: filePaths,
      if (mimeType != $none) #mimeType: mimeType,
      if (size != $none) #size: size,
      if (timestamp != null) #timestamp: timestamp,
    }),
  );
  @override
  ClipboardData $make(CopyWithData data) => ClipboardData(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    text: data.get(#text, or: $value.text),
    imageData: data.get(#imageData, or: $value.imageData),
    html: data.get(#html, or: $value.html),
    url: data.get(#url, or: $value.url),
    filePaths: data.get(#filePaths, or: $value.filePaths),
    mimeType: data.get(#mimeType, or: $value.mimeType),
    size: data.get(#size, or: $value.size),
    timestamp: data.get(#timestamp, or: $value.timestamp),
  );

  @override
  ClipboardDataCopyWith<$R2, ClipboardData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClipboardDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

