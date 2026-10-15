// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content_source.dart';

class ContentSourceMapper extends ClassMapperBase<ContentSource> {
  ContentSourceMapper._();

  static ContentSourceMapper? _instance;
  static ContentSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentSourceMapper._());
      PathContentSourceMapper.ensureInitialized();
      BytesContentSourceMapper.ensureInitialized();
      PreparedContentSourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContentSource';

  @override
  final MappableFields<ContentSource> fields = const {};

  static ContentSource _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'ContentSource',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ContentSource fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContentSource>(map);
  }

  static ContentSource deserialize(String json) {
    return ensureInitialized().decodeJson<ContentSource>(json);
  }
}

mixin ContentSourceMappable {
  String serialize();
  Map<String, dynamic> toJson();
  ContentSourceCopyWith<ContentSource, ContentSource, ContentSource>
  get copyWith;
}

abstract class ContentSourceCopyWith<$R, $In extends ContentSource, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ContentSourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class PathContentSourceMapper extends SubClassMapperBase<PathContentSource> {
  PathContentSourceMapper._();

  static PathContentSourceMapper? _instance;
  static PathContentSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PathContentSourceMapper._());
      ContentSourceMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'PathContentSource';

  static String _$path(PathContentSource v) => v.path;
  static const Field<PathContentSource, String> _f$path = Field('path', _$path);

  @override
  final MappableFields<PathContentSource> fields = const {#path: _f$path};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'path';
  @override
  late final ClassMapperBase superMapper =
      ContentSourceMapper.ensureInitialized();

  static PathContentSource _instantiate(DecodingData data) {
    return PathContentSource(data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static PathContentSource fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PathContentSource>(map);
  }

  static PathContentSource deserialize(String json) {
    return ensureInitialized().decodeJson<PathContentSource>(json);
  }
}

mixin PathContentSourceMappable {
  String serialize() {
    return PathContentSourceMapper.ensureInitialized()
        .encodeJson<PathContentSource>(this as PathContentSource);
  }

  Map<String, dynamic> toJson() {
    return PathContentSourceMapper.ensureInitialized()
        .encodeMap<PathContentSource>(this as PathContentSource);
  }

  PathContentSourceCopyWith<
    PathContentSource,
    PathContentSource,
    PathContentSource
  >
  get copyWith =>
      _PathContentSourceCopyWithImpl<PathContentSource, PathContentSource>(
        this as PathContentSource,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PathContentSourceMapper.ensureInitialized().stringifyValue(
      this as PathContentSource,
    );
  }

  @override
  bool operator ==(Object other) {
    return PathContentSourceMapper.ensureInitialized().equalsValue(
      this as PathContentSource,
      other,
    );
  }

  @override
  int get hashCode {
    return PathContentSourceMapper.ensureInitialized().hashValue(
      this as PathContentSource,
    );
  }
}

extension PathContentSourceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PathContentSource, $Out> {
  PathContentSourceCopyWith<$R, PathContentSource, $Out>
  get $asPathContentSource => $base.as(
    (v, t, t2) => _PathContentSourceCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PathContentSourceCopyWith<
  $R,
  $In extends PathContentSource,
  $Out
>
    implements ContentSourceCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  PathContentSourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PathContentSourceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PathContentSource, $Out>
    implements PathContentSourceCopyWith<$R, PathContentSource, $Out> {
  _PathContentSourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PathContentSource> $mapper =
      PathContentSourceMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  PathContentSource $make(CopyWithData data) =>
      PathContentSource(data.get(#path, or: $value.path));

  @override
  PathContentSourceCopyWith<$R2, PathContentSource, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PathContentSourceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BytesContentSourceMapper extends SubClassMapperBase<BytesContentSource> {
  BytesContentSourceMapper._();

  static BytesContentSourceMapper? _instance;
  static BytesContentSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BytesContentSourceMapper._());
      ContentSourceMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'BytesContentSource';

  static List<int> _$bytes(BytesContentSource v) => v.bytes;
  static const Field<BytesContentSource, List<int>> _f$bytes = Field(
    'bytes',
    _$bytes,
  );

  @override
  final MappableFields<BytesContentSource> fields = const {#bytes: _f$bytes};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'bytes';
  @override
  late final ClassMapperBase superMapper =
      ContentSourceMapper.ensureInitialized();

  static BytesContentSource _instantiate(DecodingData data) {
    return BytesContentSource(data.dec(_f$bytes));
  }

  @override
  final Function instantiate = _instantiate;

  static BytesContentSource fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BytesContentSource>(map);
  }

  static BytesContentSource deserialize(String json) {
    return ensureInitialized().decodeJson<BytesContentSource>(json);
  }
}

mixin BytesContentSourceMappable {
  String serialize() {
    return BytesContentSourceMapper.ensureInitialized()
        .encodeJson<BytesContentSource>(this as BytesContentSource);
  }

  Map<String, dynamic> toJson() {
    return BytesContentSourceMapper.ensureInitialized()
        .encodeMap<BytesContentSource>(this as BytesContentSource);
  }

  BytesContentSourceCopyWith<
    BytesContentSource,
    BytesContentSource,
    BytesContentSource
  >
  get copyWith =>
      _BytesContentSourceCopyWithImpl<BytesContentSource, BytesContentSource>(
        this as BytesContentSource,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BytesContentSourceMapper.ensureInitialized().stringifyValue(
      this as BytesContentSource,
    );
  }

  @override
  bool operator ==(Object other) {
    return BytesContentSourceMapper.ensureInitialized().equalsValue(
      this as BytesContentSource,
      other,
    );
  }

  @override
  int get hashCode {
    return BytesContentSourceMapper.ensureInitialized().hashValue(
      this as BytesContentSource,
    );
  }
}

extension BytesContentSourceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BytesContentSource, $Out> {
  BytesContentSourceCopyWith<$R, BytesContentSource, $Out>
  get $asBytesContentSource => $base.as(
    (v, t, t2) => _BytesContentSourceCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class BytesContentSourceCopyWith<
  $R,
  $In extends BytesContentSource,
  $Out
>
    implements ContentSourceCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get bytes;
  @override
  $R call({List<int>? bytes});
  BytesContentSourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BytesContentSourceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BytesContentSource, $Out>
    implements BytesContentSourceCopyWith<$R, BytesContentSource, $Out> {
  _BytesContentSourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BytesContentSource> $mapper =
      BytesContentSourceMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get bytes => ListCopyWith(
    $value.bytes,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(bytes: v),
  );
  @override
  $R call({List<int>? bytes}) =>
      $apply(FieldCopyWithData({if (bytes != null) #bytes: bytes}));
  @override
  BytesContentSource $make(CopyWithData data) =>
      BytesContentSource(data.get(#bytes, or: $value.bytes));

  @override
  BytesContentSourceCopyWith<$R2, BytesContentSource, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BytesContentSourceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PreparedContentSourceMapper
    extends SubClassMapperBase<PreparedContentSource> {
  PreparedContentSourceMapper._();

  static PreparedContentSourceMapper? _instance;
  static PreparedContentSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreparedContentSourceMapper._());
      ContentSourceMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'PreparedContentSource';

  static String _$descriptor(PreparedContentSource v) => v.descriptor;
  static const Field<PreparedContentSource, String> _f$descriptor = Field(
    'descriptor',
    _$descriptor,
  );

  @override
  final MappableFields<PreparedContentSource> fields = const {
    #descriptor: _f$descriptor,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'generated';
  @override
  late final ClassMapperBase superMapper =
      ContentSourceMapper.ensureInitialized();

  static PreparedContentSource _instantiate(DecodingData data) {
    return PreparedContentSource(data.dec(_f$descriptor));
  }

  @override
  final Function instantiate = _instantiate;

  static PreparedContentSource fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PreparedContentSource>(map);
  }

  static PreparedContentSource deserialize(String json) {
    return ensureInitialized().decodeJson<PreparedContentSource>(json);
  }
}

mixin PreparedContentSourceMappable {
  String serialize() {
    return PreparedContentSourceMapper.ensureInitialized()
        .encodeJson<PreparedContentSource>(this as PreparedContentSource);
  }

  Map<String, dynamic> toJson() {
    return PreparedContentSourceMapper.ensureInitialized()
        .encodeMap<PreparedContentSource>(this as PreparedContentSource);
  }

  PreparedContentSourceCopyWith<
    PreparedContentSource,
    PreparedContentSource,
    PreparedContentSource
  >
  get copyWith =>
      _PreparedContentSourceCopyWithImpl<
        PreparedContentSource,
        PreparedContentSource
      >(this as PreparedContentSource, $identity, $identity);
  @override
  String toString() {
    return PreparedContentSourceMapper.ensureInitialized().stringifyValue(
      this as PreparedContentSource,
    );
  }

  @override
  bool operator ==(Object other) {
    return PreparedContentSourceMapper.ensureInitialized().equalsValue(
      this as PreparedContentSource,
      other,
    );
  }

  @override
  int get hashCode {
    return PreparedContentSourceMapper.ensureInitialized().hashValue(
      this as PreparedContentSource,
    );
  }
}

extension PreparedContentSourceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PreparedContentSource, $Out> {
  PreparedContentSourceCopyWith<$R, PreparedContentSource, $Out>
  get $asPreparedContentSource => $base.as(
    (v, t, t2) => _PreparedContentSourceCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PreparedContentSourceCopyWith<
  $R,
  $In extends PreparedContentSource,
  $Out
>
    implements ContentSourceCopyWith<$R, $In, $Out> {
  @override
  $R call({String? descriptor});
  PreparedContentSourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PreparedContentSourceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PreparedContentSource, $Out>
    implements PreparedContentSourceCopyWith<$R, PreparedContentSource, $Out> {
  _PreparedContentSourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PreparedContentSource> $mapper =
      PreparedContentSourceMapper.ensureInitialized();
  @override
  $R call({String? descriptor}) => $apply(
    FieldCopyWithData({if (descriptor != null) #descriptor: descriptor}),
  );
  @override
  PreparedContentSource $make(CopyWithData data) =>
      PreparedContentSource(data.get(#descriptor, or: $value.descriptor));

  @override
  PreparedContentSourceCopyWith<$R2, PreparedContentSource, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PreparedContentSourceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
