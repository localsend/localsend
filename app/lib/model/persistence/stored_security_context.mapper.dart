// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
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
    return _guard((c) => c.fromMap<StoredSecurityContext>(map));
  }

  static StoredSecurityContext deserialize(String json) {
    return _guard((c) => c.fromJson<StoredSecurityContext>(json));
  }
}

mixin StoredSecurityContextMappable {
  String serialize() {
    return StoredSecurityContextMapper._guard(
        (c) => c.toJson(this as StoredSecurityContext));
  }

  Map<String, dynamic> toJson() {
    return StoredSecurityContextMapper._guard(
        (c) => c.toMap(this as StoredSecurityContext));
  }

  StoredSecurityContextCopyWith<StoredSecurityContext, StoredSecurityContext,
          StoredSecurityContext>
      get copyWith => _StoredSecurityContextCopyWithImpl(
          this as StoredSecurityContext, $identity, $identity);
  @override
  String toString() {
    return StoredSecurityContextMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StoredSecurityContextMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return StoredSecurityContextMapper._guard((c) => c.hash(this));
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
