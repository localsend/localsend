// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'multicast_dto.dart';

class ProtocolTypeMapper extends EnumMapper<ProtocolType> {
  ProtocolTypeMapper._();

  static ProtocolTypeMapper? _instance;
  static ProtocolTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProtocolTypeMapper._());
    }
    return _instance!;
  }

  static ProtocolType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProtocolType decode(dynamic value) {
    switch (value) {
      case r'http':
        return ProtocolType.http;
      case r'https':
        return ProtocolType.https;
      default:
        return ProtocolType.values[1];
    }
  }

  @override
  dynamic encode(ProtocolType self) {
    switch (self) {
      case ProtocolType.http:
        return r'http';
      case ProtocolType.https:
        return r'https';
    }
  }
}

extension ProtocolTypeMapperExtension on ProtocolType {
  String toValue() {
    ProtocolTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProtocolType>(this) as String;
  }
}

