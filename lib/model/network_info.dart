import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_info.freezed.dart';

@freezed
class NetworkInfo with _$NetworkInfo {
  const factory NetworkInfo({
    required String? localIp,
    required String? netMask,
  }) = _NetworkInfo;
}
