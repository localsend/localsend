import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_info.freezed.dart';

@freezed
class NetworkInfo with _$NetworkInfo {
  const factory NetworkInfo({
    required List<String> localIps,
    required bool initialized,
    required bool scanWhenInitialized,
  }) = _NetworkInfo;
}
