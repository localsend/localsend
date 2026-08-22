import 'package:flutter_rust_bridge/flutter_rust_bridge.dart' show AnyhowException;
import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/rust/api/discovery.dart' as rust_discovery;
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
              modified: metadata!.lastModified,
              accessed: metadata!.lastAccessed,
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
      AnyhowException(:final message) => message,
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
              lastModified: metadata!.modified,
              lastAccessed: metadata!.accessed,
            )
          : null,
    );
  }
}

extension RsStoredDeviceExt on rust_discovery.RsStoredDevice {
  /// Maps the merged stored state to a [Device]: the best channel becomes the
  /// dialed address, every channel is kept as a [HttpChannel], best first.
  Device toDevice() {
    final best = channels.first;
    return Device(
      signalingId: null,
      ip: best.host,
      version: version,
      port: best.port,
      https: best.protocol == rust_model.ProtocolType.https,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDart() ?? DeviceType.desktop,
      download: download,
      channels: [
        for (final channel in channels)
          HttpChannel(
            host: channel.host,
            port: channel.port,
            https: channel.protocol == rust_model.ProtocolType.https,
          ),
      ],
    );
  }
}

extension RsDeviceLogExt on rust_discovery.RsDeviceLog {
  DeviceLog toDeviceLog() {
    return DeviceLog(
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestampMillis.toInt()),
      kind: switch (kind) {
        rust_discovery.DeviceLogKind.discovered => DeviceLogKind.discovered,
        rust_discovery.DeviceLogKind.updated => DeviceLogKind.updated,
      },
      channel: HttpChannel(
        host: channel.host,
        port: channel.port,
        https: channel.protocol == rust_model.ProtocolType.https,
      ),
    );
  }
}

extension DeviceToRsDiscoveredDeviceExt on Device {
  rust_discovery.RsDiscoveredDevice toRsDiscoveredDevice(String ip) {
    return rust_discovery.RsDiscoveredDevice(
      alias: alias,
      version: version,
      deviceModel: deviceModel,
      deviceType: deviceType.toRust(),
      fingerprint: fingerprint,
      host: ip,
      port: port,
      protocol: https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http,
      download: download,
    );
  }
}

extension RegisterDtoV2Ext on rust_server.RegisterDtoV2 {
  Device toDevice(String ip, {required bool withChannel}) {
    return Device(
      signalingId: null,
      ip: ip,
      version: version,
      port: port,
      https: protocol == rust_model.ProtocolType.https,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDart() ?? DeviceType.desktop,
      download: download,
      channels: withChannel ? [HttpChannel(host: ip, port: port, https: protocol == rust_model.ProtocolType.https)] : const [],
    );
  }
}

extension RegisterResponseDtoExt on rust_model.RegisterResponseDto {
  Device toDevice(String ip, int port, bool https) {
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
      channels: [HttpChannel(host: ip, port: port, https: https)],
    );
  }
}
