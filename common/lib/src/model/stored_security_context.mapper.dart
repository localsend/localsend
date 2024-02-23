// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stored_security_context.dart';

class StoredSecurityContextMapper
    extends ClassMapperBase<StoredSecurityContext> {
  StoredSecurityContextMapper._();

  static StoredSecurityContextMapper? _instance;
  static StoredSecurityContextMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoredSecurityContextMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StoredSecurityContext';

  static String _$privateKey(StoredSecurityContext v) => v.privateKey;
  static const Field<StoredSecurityContext, String> _f$privateKey =
      Field('privateKey', _$privateKey);
  static String _$publicKey(StoredSecurityContext v) => v.publicKey;
  static const Field<StoredSecurityContext, String> _f$publicKey =
      Field('publicKey', _$publicKey);
  static String _$certificate(StoredSecurityContext v) => v.certificate;
  static const Field<StoredSecurityContext, String> _f$certificate =
      Field('certificate', _$certificate);
  static String _$certificateHash(StoredSecurityContext v) => v.certificateHash;
  static const Field<StoredSecurityContext, String> _f$certificateHash =
      Field('certificateHash', _$certificateHash);

  @override
  final Map<Symbol, Field<StoredSecurityContext, dynamic>> fields = const {
    #privateKey: _f$privateKey,
    #publicKey: _f$publicKey,
    #certificate: _f$certificate,
    #certificateHash: _f$certificateHash,
  };

  static StoredSecurityContext _instantiate(DecodingData data) {
    return StoredSecurityContext(
        privateKey: data.dec(_f$privateKey),
        publicKey: data.dec(_f$publicKey),
        certificate: data.dec(_f$certificate),
        certificateHash: data.dec(_f$certificateHash));
  }

  @override
  final Function instantiate = _instantiate;

  static StoredSecurityContext fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoredSecurityContext>(map);
  }

  static StoredSecurityContext deserialize(String json) {
    return ensureInitialized().decodeJson<StoredSecurityContext>(json);
  }
}

mixin StoredSecurityContextMappable {
  String serialize() {
    return StoredSecurityContextMapper.ensureInitialized()
        .encodeJson<StoredSecurityContext>(this as StoredSecurityContext);
  }

  Map<String, dynamic> toJson() {
    return StoredSecurityContextMapper.ensureInitialized()
        .encodeMap<StoredSecurityContext>(this as StoredSecurityContext);
  }

  StoredSecurityContextCopyWith<StoredSecurityContext, StoredSecurityContext,
          StoredSecurityContext>
      get copyWith => _StoredSecurityContextCopyWithImpl(
          this as StoredSecurityContext, $identity, $identity);
  @override
  String toString() {
    return StoredSecurityContextMapper.ensureInitialized()
        .stringifyValue(this as StoredSecurityContext);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StoredSecurityContextMapper.ensureInitialized()
                .isValueEqual(this as StoredSecurityContext, other));
  }

  @override
  int get hashCode {
    return StoredSecurityContextMapper.ensureInitialized()
        .hashValue(this as StoredSecurityContext);
  }
}

extension StoredSecurityContextValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoredSecurityContext, $Out> {
  StoredSecurityContextCopyWith<$R, StoredSecurityContext, $Out>
      get $asStoredSecurityContext =>
          $base.as((v, t, t2) => _StoredSecurityContextCopyWithImpl(v, t, t2));
}

abstract class StoredSecurityContextCopyWith<
    $R,
    $In extends StoredSecurityContext,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? privateKey,
      String? publicKey,
      String? certificate,
      String? certificateHash});
  StoredSecurityContextCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StoredSecurityContextCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoredSecurityContext, $Out>
    implements StoredSecurityContextCopyWith<$R, StoredSecurityContext, $Out> {
  _StoredSecurityContextCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoredSecurityContext> $mapper =
      StoredSecurityContextMapper.ensureInitialized();
  @override
  $R call(
          {String? privateKey,
          String? publicKey,
          String? certificate,
          String? certificateHash}) =>
      $apply(FieldCopyWithData({
        if (privateKey != null) #privateKey: privateKey,
        if (publicKey != null) #publicKey: publicKey,
        if (certificate != null) #certificate: certificate,
        if (certificateHash != null) #certificateHash: certificateHash
      }));
  @override
  StoredSecurityContext $make(CopyWithData data) => StoredSecurityContext(
      privateKey: data.get(#privateKey, or: $value.privateKey),
      publicKey: data.get(#publicKey, or: $value.publicKey),
      certificate: data.get(#certificate, or: $value.certificate),
      certificateHash: data.get(#certificateHash, or: $value.certificateHash));

  @override
  StoredSecurityContextCopyWith<$R2, StoredSecurityContext, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StoredSecurityContextCopyWithImpl($value, $cast, t);
}
