import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/rust/api/server.dart' as rust_server;
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:mime/mime.dart';

extension ProtocolTypeExt on ProtocolType {
  rust_model.ProtocolType toRust() {
    return switch (this) {
      ProtocolType.http => rust_model.ProtocolType.http,
      ProtocolType.https => rust_model.ProtocolType.https,
    };
  }
}

extension DeviceExt on Device {
  rust_model.ProtocolType getProtocolType() {
    return switch (https) {
      false => rust_model.ProtocolType.http,
      true => rust_model.ProtocolType.https,
    };
  }

  rust_model.RegisterDto toRegisterDto() {
    return rust_model.RegisterDto(
      alias: alias,
      version: version,
      deviceModel: deviceModel,
      deviceType: deviceType.toRust(),
      token: fingerprint,
      port: port,
      protocol: getProtocolType(),
      hasWebInterface: download,
    );
  }
}

extension DeviceTypeExt on DeviceType {
  rust_model.DeviceType toRust() {
    return switch (this) {
      DeviceType.mobile => rust_model.DeviceType.mobile,
      DeviceType.desktop => rust_model.DeviceType.desktop,
      DeviceType.web => rust_model.DeviceType.web,
      DeviceType.headless => rust_model.DeviceType.headless,
      DeviceType.server => rust_model.DeviceType.server,
    };
  }
}

extension FileDtoExt on FileDto {
  rust_model.FileDto toRust() {
    return rust_model.FileDto(
      id: id,
      fileName: fileName,
      size: BigInt.from(size),
      fileType: lookupMimeType(fileName) ?? 'application/octet-stream',
      sha256: hash,
      preview: preview,
      metadata: metadata != null
          ? rust_model.FileMetadata(
              modified: metadata!.lastModified?.toUtc().toIso8601String(),
              accessed: metadata!.lastAccessed?.toUtc().toIso8601String(),
            )
          : null,
    );
  }
}

extension RustDeviceTypeExt on rust_model.DeviceType {
  DeviceType toDart() {
    return switch (this) {
      rust_model.DeviceType.mobile => DeviceType.mobile,
      rust_model.DeviceType.desktop => DeviceType.desktop,
      rust_model.DeviceType.web => DeviceType.web,
      rust_model.DeviceType.headless => DeviceType.headless,
      rust_model.DeviceType.server => DeviceType.server,
    };
  }
}

extension SyncStateToRegisterDtoExt on SyncState {
  rust_model.RegisterDto toRegisterDto() {
    return rust_model.RegisterDto(
      alias: alias,
      version: protocolVersion,
      deviceModel: deviceInfo.deviceModel,
      deviceType: deviceInfo.deviceType.toRust(),
      token: securityContext.certificateHash,
      port: port,
      protocol: protocol.toRust(),
      hasWebInterface: download,
    );
  }
}

extension HumanErrorMessageExt on Object {
  /// Converts an error to a human-readable message,
  /// showing the status code and server message if available.
  String get humanErrorMessage {
    final e = this;
    return switch (e) {
      rust_http.RsHttpClientError_StatusCode(:final status, :final message) when message != null => '[$status] $message',
      _ => e.toString(),
    };
  }
}

extension RustFileDtoExt on rust_model.FileDto {
  FileDto toDart() {
    return FileDto(
      id: id,
      fileName: fileName,
      size: size.toInt(),
      fileType: decodeFromMime(fileType),
      hash: sha256,
      preview: preview,
      metadata: metadata != null
          ? FileMetadata(
              lastModified: metadata!.modified != null ? DateTime.tryParse(metadata!.modified!) : null,
              lastAccessed: metadata!.accessed != null ? DateTime.tryParse(metadata!.accessed!) : null,
            )
          : null,
    );
  }
}

extension RegisterDtoV2Ext on rust_server.RegisterDtoV2 {
  Device toDevice(String ip, DiscoveryMethod? method) {
    return Device(
      signalingId: null,
      ip: ip,
      version: version,
      port: port,
      https: protocol == rust_server.ProtocolTypeV2.https,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDart() ?? DeviceType.desktop,
      download: download,
      discoveryMethods: method == null ? const {} : {method},
    );
  }
}

extension RegisterResponseDtoExt on rust_model.RegisterResponseDto {
  Device toDevice(String ip, int port, bool https, DiscoveryMethod method) {
    return Device(
      signalingId: null,
      ip: ip,
      version: version,
      port: port,
      https: https,
      fingerprint: token,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDart() ?? DeviceType.desktop,
      download: hasWebInterface,
      discoveryMethods: {method},
    );
  }
}
