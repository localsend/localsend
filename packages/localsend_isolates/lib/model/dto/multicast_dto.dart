import 'package:dart_mappable/dart_mappable.dart';

part 'multicast_dto.mapper.dart';

@MappableEnum(defaultValue: ProtocolType.https)
enum ProtocolType { http, https }
