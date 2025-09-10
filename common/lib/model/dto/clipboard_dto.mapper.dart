// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'clipboard_dto.dart';

class ClipboardDtoMapper extends ClassMapperBase<ClipboardDto> {
  ClipboardDtoMapper._();

  static ClipboardDtoMapper? _instance;
  static ClipboardDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClipboardDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClipboardDto';

  static String _$id(ClipboardDto v) => v.id;
  static const Field<ClipboardDto, String> _f$id = Field('id', _$id);
  static String _$type(ClipboardDto v) => v.type;
  static const Field<ClipboardDto, String> _f$type = Field('type', _$type);
  static String? _$data(ClipboardDto v) => v.data;
  static const Field<ClipboardDto, String> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static String? _$text(ClipboardDto v) => v.text;
  static const Field<ClipboardDto, String> _f$text = Field(
    'text',
    _$text,
    opt: true,
  );
  static String? _$html(ClipboardDto v) => v.html;
  static const Field<ClipboardDto, String> _f$html = Field(
    'html',
    _$html,
    opt: true,
  );
  static String? _$url(ClipboardDto v) => v.url;
  static const Field<ClipboardDto, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );
  static List<String>? _$filePaths(ClipboardDto v) => v.filePaths;
  static const Field<ClipboardDto, List<String>> _f$filePaths = Field(
    'filePaths',
    _$filePaths,
    opt: true,
  );
  static int? _$size(ClipboardDto v) => v.size;
  static const Field<ClipboardDto, int> _f$size = Field(
    'size',
    _$size,
    opt: true,
  );
  static String _$timestamp(ClipboardDto v) => v.timestamp;
  static const Field<ClipboardDto, String> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );

  @override
  final MappableFields<ClipboardDto> fields = const {
    #id: _f$id,
    #type: _f$type,
    #data: _f$data,
    #text: _f$text,
    #html: _f$html,
    #url: _f$url,
    #filePaths: _f$filePaths,
    #size: _f$size,
    #timestamp: _f$timestamp,
  };

  static ClipboardDto _instantiate(DecodingData data) {
    return ClipboardDto(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      data: data.dec(_f$data),
      text: data.dec(_f$text),
      html: data.dec(_f$html),
      url: data.dec(_f$url),
      filePaths: data.dec(_f$filePaths),
      size: data.dec(_f$size),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClipboardDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClipboardDto>(map);
  }

  static ClipboardDto deserialize(String json) {
    return ensureInitialized().decodeJson<ClipboardDto>(json);
  }
}

mixin ClipboardDtoMappable {
  String serialize() {
    return ClipboardDtoMapper.ensureInitialized().encodeJson<ClipboardDto>(
      this as ClipboardDto,
    );
  }

  Map<String, dynamic> toJson() {
    return ClipboardDtoMapper.ensureInitialized().encodeMap<ClipboardDto>(
      this as ClipboardDto,
    );
  }

  ClipboardDtoCopyWith<ClipboardDto, ClipboardDto, ClipboardDto> get copyWith =>
      _ClipboardDtoCopyWithImpl<ClipboardDto, ClipboardDto>(
        this as ClipboardDto,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClipboardDtoMapper.ensureInitialized().stringifyValue(
      this as ClipboardDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClipboardDtoMapper.ensureInitialized().equalsValue(
      this as ClipboardDto,
      other,
    );
  }

  @override
  int get hashCode {
    return ClipboardDtoMapper.ensureInitialized().hashValue(
      this as ClipboardDto,
    );
  }
}

extension ClipboardDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClipboardDto, $Out> {
  ClipboardDtoCopyWith<$R, ClipboardDto, $Out> get $asClipboardDto =>
      $base.as((v, t, t2) => _ClipboardDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClipboardDtoCopyWith<$R, $In extends ClipboardDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get filePaths;
  $R call({
    String? id,
    String? type,
    String? data,
    String? text,
    String? html,
    String? url,
    List<String>? filePaths,
    int? size,
    String? timestamp,
  });
  ClipboardDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClipboardDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClipboardDto, $Out>
    implements ClipboardDtoCopyWith<$R, ClipboardDto, $Out> {
  _ClipboardDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClipboardDto> $mapper =
      ClipboardDtoMapper.ensureInitialized();
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
    String? type,
    Object? data = $none,
    Object? text = $none,
    Object? html = $none,
    Object? url = $none,
    Object? filePaths = $none,
    Object? size = $none,
    String? timestamp,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (type != null) #type: type,
      if (data != $none) #data: data,
      if (text != $none) #text: text,
      if (html != $none) #html: html,
      if (url != $none) #url: url,
      if (filePaths != $none) #filePaths: filePaths,
      if (size != $none) #size: size,
      if (timestamp != null) #timestamp: timestamp,
    }),
  );
  @override
  ClipboardDto $make(CopyWithData data) => ClipboardDto(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    data: data.get(#data, or: $value.data),
    text: data.get(#text, or: $value.text),
    html: data.get(#html, or: $value.html),
    url: data.get(#url, or: $value.url),
    filePaths: data.get(#filePaths, or: $value.filePaths),
    size: data.get(#size, or: $value.size),
    timestamp: data.get(#timestamp, or: $value.timestamp),
  );

  @override
  ClipboardDtoCopyWith<$R2, ClipboardDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClipboardDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

