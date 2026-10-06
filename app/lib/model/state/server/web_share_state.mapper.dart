// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_share_state.dart';

class WebShareStateMapper extends ClassMapperBase<WebShareState> {
  WebShareStateMapper._();

  static WebShareStateMapper? _instance;
  static WebShareStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebShareStateMapper._());
      WebShareDownloadMapper.ensureInitialized();
      WebShareUploadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebShareState';

  static String? _$pin(WebShareState v) => v.pin;
  static const Field<WebShareState, String> _f$pin = Field('pin', _$pin);

  @override
  final MappableFields<WebShareState> fields = const {#pin: _f$pin};

  static WebShareState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('WebShareState');
  }

  @override
  final Function instantiate = _instantiate;

  static WebShareState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebShareState>(map);
  }

  static WebShareState deserialize(String json) {
    return ensureInitialized().decodeJson<WebShareState>(json);
  }
}

mixin WebShareStateMappable {
  String serialize();
  Map<String, dynamic> toJson();
  WebShareStateCopyWith<WebShareState, WebShareState, WebShareState>
  get copyWith;
}

abstract class WebShareStateCopyWith<$R, $In extends WebShareState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? pin});
  WebShareStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class WebShareDownloadMapper extends ClassMapperBase<WebShareDownload> {
  WebShareDownloadMapper._();

  static WebShareDownloadMapper? _instance;
  static WebShareDownloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebShareDownloadMapper._());
      WebShareStateMapper.ensureInitialized();
      WebDownloadStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebShareDownload';

  static WebDownloadState _$state(WebShareDownload v) => v.state;
  static const Field<WebShareDownload, WebDownloadState> _f$state = Field(
    'state',
    _$state,
  );
  static String? _$pin(WebShareDownload v) => v.pin;
  static const Field<WebShareDownload, String> _f$pin = Field('pin', _$pin);

  @override
  final MappableFields<WebShareDownload> fields = const {
    #state: _f$state,
    #pin: _f$pin,
  };

  static WebShareDownload _instantiate(DecodingData data) {
    return WebShareDownload(state: data.dec(_f$state), pin: data.dec(_f$pin));
  }

  @override
  final Function instantiate = _instantiate;

  static WebShareDownload fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebShareDownload>(map);
  }

  static WebShareDownload deserialize(String json) {
    return ensureInitialized().decodeJson<WebShareDownload>(json);
  }
}

mixin WebShareDownloadMappable {
  String serialize() {
    return WebShareDownloadMapper.ensureInitialized()
        .encodeJson<WebShareDownload>(this as WebShareDownload);
  }

  Map<String, dynamic> toJson() {
    return WebShareDownloadMapper.ensureInitialized()
        .encodeMap<WebShareDownload>(this as WebShareDownload);
  }

  WebShareDownloadCopyWith<WebShareDownload, WebShareDownload, WebShareDownload>
  get copyWith =>
      _WebShareDownloadCopyWithImpl<WebShareDownload, WebShareDownload>(
        this as WebShareDownload,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebShareDownloadMapper.ensureInitialized().stringifyValue(
      this as WebShareDownload,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebShareDownloadMapper.ensureInitialized().equalsValue(
      this as WebShareDownload,
      other,
    );
  }

  @override
  int get hashCode {
    return WebShareDownloadMapper.ensureInitialized().hashValue(
      this as WebShareDownload,
    );
  }
}

extension WebShareDownloadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebShareDownload, $Out> {
  WebShareDownloadCopyWith<$R, WebShareDownload, $Out>
  get $asWebShareDownload =>
      $base.as((v, t, t2) => _WebShareDownloadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebShareDownloadCopyWith<$R, $In extends WebShareDownload, $Out>
    implements WebShareStateCopyWith<$R, $In, $Out> {
  WebDownloadStateCopyWith<$R, WebDownloadState, WebDownloadState> get state;
  @override
  $R call({WebDownloadState? state, String? pin});
  WebShareDownloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebShareDownloadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebShareDownload, $Out>
    implements WebShareDownloadCopyWith<$R, WebShareDownload, $Out> {
  _WebShareDownloadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebShareDownload> $mapper =
      WebShareDownloadMapper.ensureInitialized();
  @override
  WebDownloadStateCopyWith<$R, WebDownloadState, WebDownloadState> get state =>
      $value.state.copyWith.$chain((v) => call(state: v));
  @override
  $R call({WebDownloadState? state, Object? pin = $none}) => $apply(
    FieldCopyWithData({
      if (state != null) #state: state,
      if (pin != $none) #pin: pin,
    }),
  );
  @override
  WebShareDownload $make(CopyWithData data) => WebShareDownload(
    state: data.get(#state, or: $value.state),
    pin: data.get(#pin, or: $value.pin),
  );

  @override
  WebShareDownloadCopyWith<$R2, WebShareDownload, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebShareDownloadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WebShareUploadMapper extends ClassMapperBase<WebShareUpload> {
  WebShareUploadMapper._();

  static WebShareUploadMapper? _instance;
  static WebShareUploadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebShareUploadMapper._());
      WebShareStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebShareUpload';

  static String? _$pin(WebShareUpload v) => v.pin;
  static const Field<WebShareUpload, String> _f$pin = Field('pin', _$pin);

  @override
  final MappableFields<WebShareUpload> fields = const {#pin: _f$pin};

  static WebShareUpload _instantiate(DecodingData data) {
    return WebShareUpload(pin: data.dec(_f$pin));
  }

  @override
  final Function instantiate = _instantiate;

  static WebShareUpload fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebShareUpload>(map);
  }

  static WebShareUpload deserialize(String json) {
    return ensureInitialized().decodeJson<WebShareUpload>(json);
  }
}

mixin WebShareUploadMappable {
  String serialize() {
    return WebShareUploadMapper.ensureInitialized().encodeJson<WebShareUpload>(
      this as WebShareUpload,
    );
  }

  Map<String, dynamic> toJson() {
    return WebShareUploadMapper.ensureInitialized().encodeMap<WebShareUpload>(
      this as WebShareUpload,
    );
  }

  WebShareUploadCopyWith<WebShareUpload, WebShareUpload, WebShareUpload>
  get copyWith => _WebShareUploadCopyWithImpl<WebShareUpload, WebShareUpload>(
    this as WebShareUpload,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WebShareUploadMapper.ensureInitialized().stringifyValue(
      this as WebShareUpload,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebShareUploadMapper.ensureInitialized().equalsValue(
      this as WebShareUpload,
      other,
    );
  }

  @override
  int get hashCode {
    return WebShareUploadMapper.ensureInitialized().hashValue(
      this as WebShareUpload,
    );
  }
}

extension WebShareUploadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebShareUpload, $Out> {
  WebShareUploadCopyWith<$R, WebShareUpload, $Out> get $asWebShareUpload =>
      $base.as((v, t, t2) => _WebShareUploadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebShareUploadCopyWith<$R, $In extends WebShareUpload, $Out>
    implements WebShareStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? pin});
  WebShareUploadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebShareUploadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebShareUpload, $Out>
    implements WebShareUploadCopyWith<$R, WebShareUpload, $Out> {
  _WebShareUploadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebShareUpload> $mapper =
      WebShareUploadMapper.ensureInitialized();
  @override
  $R call({Object? pin = $none}) =>
      $apply(FieldCopyWithData({if (pin != $none) #pin: pin}));
  @override
  WebShareUpload $make(CopyWithData data) =>
      WebShareUpload(pin: data.get(#pin, or: $value.pin));

  @override
  WebShareUploadCopyWith<$R2, WebShareUpload, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebShareUploadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

