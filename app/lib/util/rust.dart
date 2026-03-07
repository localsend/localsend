import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:localsend_app/rust/api/model.dart' as rust_model;
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
