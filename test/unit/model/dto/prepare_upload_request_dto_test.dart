import 'dart:convert';

import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_register_dto.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';
import 'package:localsend_app/model/dto/prepare_upload_request_dto.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:test/test.dart';

void main() {
  group('parse PrepareUploadRequestDto', () {
    test('should parse valid enums', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'image',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should fallback deviceType', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'invalidType',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'image',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.desktop);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should fallback fileType', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'superBigImage',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.other);
    });

    test('should parse mime type', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'image/jpeg',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should parse apk mime type', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'myApk.apk',
            'size': 1234,
            'fileType': 'application/vnd.android.package-archive',
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.apk);
    });
  });

  group('serialize PrepareUploadRequestDto', () {
    const info = InfoRegisterDto(
      alias: 'Nice Banana',
      version: '2.0',
      deviceModel: 'Samsung',
      deviceType: DeviceType.mobile,
      fingerprint: '123',
      port: 123,
      protocol: ProtocolType.http,
    );

    test('should serialize in legacy mode', () {
      const dto = PrepareUploadRequestDto(
        info: info,
        files: {
          'some id': FileDto(
            id: 'some id',
            fileName: 'another image.jpg',
            size: 1234,
            fileType: FileType.image,
            hash: '*hash*',
            preview: "*preview data*",
            legacy: true,
          ),
          'some id 2': FileDto(
            id: 'some id 2',
            fileName: 'my apk.apk',
            size: 1234,
            fileType: FileType.apk,
            hash: '*hash*',
            preview: "*preview data*",
            legacy: true,
          ),
        }
      );
      final serialized = _deepSerialize(dto);
      expect(serialized['info']['deviceType'], 'mobile');
      expect(serialized['files'].length, 2);
      expect(serialized['files']['some id']['fileType'], 'image');
      expect(serialized['files']['some id 2']['fileType'], 'apk');
    });

    test('should serialize in mime mode', () {
      const dto = PrepareUploadRequestDto(
          info: info,
          files: {
            'some id': FileDto(
              id: 'some id',
              fileName: 'another image.jpg',
              size: 1234,
              fileType: FileType.image,
              hash: '*hash*',
              preview: "*preview data*",
              legacy: false,
            ),
            'some id 2': FileDto(
              id: 'some id 2',
              fileName: 'my apk.apk',
              size: 1234,
              fileType: FileType.apk,
              hash: '*hash*',
              preview: "*preview data*",
              legacy: false,
            ),
          }
      );
      final serialized = _deepSerialize(dto);

      expect(serialized['info']['deviceType'], 'mobile');
      expect(serialized['files'].length, 2);
      expect(serialized['files']['some id']['fileType'], 'image/jpeg');
      expect(serialized['files']['some id 2']['fileType'], 'application/vnd.android.package-archive');
    });
  });
}

/// Deep serialize an object to a map.
/// The toJson method only serializes the first level.
Map<String, dynamic> _deepSerialize(Object object) {
  return jsonDecode(jsonEncode(object));
}
